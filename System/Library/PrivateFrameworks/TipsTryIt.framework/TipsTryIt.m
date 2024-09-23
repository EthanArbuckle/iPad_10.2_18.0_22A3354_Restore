__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_248AB8B1C(a1, &qword_2577B10F0);
}

uint64_t sub_248AB6AFC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_248AB6B1C(uint64_t result, int a2, int a3)
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

void type metadata accessor for MKCoordinateSpan(uint64_t a1)
{
  sub_248AB8B1C(a1, &qword_2577B10F8);
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

uint64_t sub_248AB6B64(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_248AB6B84(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for MKCoordinateRegion(uint64_t a1)
{
  sub_248AB8B1C(a1, &qword_2577B1100);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_248AB8B1C(a1, &qword_2577B1108);
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_248AB8B1C(a1, &qword_2577B1110);
}

uint64_t initializeBufferWithCopyOfBuffer for CompletionView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CompletionView(uint64_t a1)
{
  swift_release();

  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for CompletionView(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  v5 = *(void **)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v4;
  v7 = *(void **)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v6;
  swift_retain();
  v8 = v5;
  swift_retain();
  v9 = v7;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CompletionView(uint64_t a1, uint64_t a2)
{
  char v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  v5 = *(void **)(a1 + 16);
  v6 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = v6;

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v8 = *(void **)(a1 + 32);
  v9 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v9;
  v10 = v9;

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for CompletionView(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_release();

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();

  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CompletionView(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CompletionView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CompletionView()
{
  return &type metadata for CompletionView;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_248AB8B1C(a1, &qword_2577B1118);
}

uint64_t sub_248AB6ECC()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_248AB6EDC()
{
  strcpy((char *)&qword_2577B1078, "TryItCheckmark");
  unk_2577B1087 = -18;
}

double sub_248AB6F0C()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1190);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 3;
  *(_OWORD *)(v0 + 16) = xmmword_248AF6430;
  *(_QWORD *)(v0 + 32) = 0x656B636568636E55;
  *(_QWORD *)(v0 + 40) = 0xE900000000000064;
  *(_QWORD *)(v0 + 48) = 0x64656B63656843;
  *(_QWORD *)(v0 + 56) = 0xE700000000000000;
  *(_QWORD *)(v0 + 64) = 1702060354;
  *(_QWORD *)(v0 + 72) = 0xE400000000000000;
  off_2577B1090 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_248AB6F8C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  id v18;
  char *v19;
  __int128 v20;
  uint64_t (*v21)();
  __int128 v22;
  uint64_t (**v23)();
  uint64_t v24;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char v35[8];
  id v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  char v40[8];
  id v41[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1198);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11A0);
  MEMORY[0x24BDAC7A8](v27);
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11A8);
  v10 = MEMORY[0x24BDAC7A8](v30);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v28 = (uint64_t)v26 - v13;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11B0);
  MEMORY[0x24BDAC7A8](v29);
  v15 = (char *)v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = *((_OWORD *)a1 + 1);
  v31 = *((_OWORD *)a1 + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1180);
  sub_248AF57EC();
  v16 = (void *)v34;
  if ((_QWORD)v34)
  {
    sub_248AB882C((uint64_t)&v39, (uint64_t)v41, &qword_2577B1158);
    sub_248AB882C((uint64_t)&v39 + 8, (uint64_t)v40, &qword_2577B1160);
    sub_248AB8A24(0, &qword_2577B11B8);
    v17 = swift_allocObject();
    v26[1] = a2;
    *(_QWORD *)(v17 + 16) = v16;
    v18 = v16;
    sub_248AF503C();
    sub_248AF58F4();
    sub_248AF5048();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v7, v4);
    v19 = &v9[*(int *)(v27 + 36)];
    v20 = v32;
    *(_OWORD *)v19 = v31;
    *((_OWORD *)v19 + 1) = v20;
    *((_OWORD *)v19 + 2) = v33;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v37 = *a1;
    v38 = *((_BYTE *)a1 + 8);
    v34 = *((_OWORD *)a1 + 2);
    sub_248AB882C((uint64_t)&v34, (uint64_t)&v36, &qword_2577B1168);
    sub_248AB882C((uint64_t)&v34 + 8, (uint64_t)v35, &qword_2577B1170);
    v21 = (uint64_t (*)())swift_allocObject();
    v22 = *((_OWORD *)a1 + 1);
    *((_OWORD *)v21 + 1) = *(_OWORD *)a1;
    *((_OWORD *)v21 + 2) = v22;
    *((_OWORD *)v21 + 3) = *((_OWORD *)a1 + 2);
    sub_248AB8870((uint64_t)v9, (uint64_t)v12, &qword_2577B11A0);
    v23 = (uint64_t (**)())&v12[*(int *)(v30 + 36)];
    *v23 = sub_248AB8824;
    v23[1] = v21;
    v23[2] = 0;
    v23[3] = 0;
    sub_248AB818C((uint64_t)&v37);
    sub_248AB8164(v41);
    sub_248AB818C((uint64_t)v40);
    sub_248AB8164(&v36);
    sub_248AB818C((uint64_t)v35);
    sub_248AB89E8((uint64_t)v9, &qword_2577B11A0);
    v24 = v28;
    sub_248AB882C((uint64_t)v12, v28, &qword_2577B11A8);
    sub_248AB8870(v24, (uint64_t)v15, &qword_2577B11A8);
    swift_storeEnumTagMultiPayload();
    sub_248AB88B4();
    sub_248AF53D8();

    return sub_248AB89E8(v24, &qword_2577B11A8);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_248AB88B4();
    return sub_248AF53D8();
  }
}

uint64_t sub_248AB7390(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _OWORD *v16;
  __int128 v17;
  void *v18;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];
  __int128 v25;
  _BYTE v26[8];
  id v27;
  __int128 v28;
  _BYTE v29[8];
  id v30;
  uint64_t v31;
  char v32;

  v2 = sub_248AF599C();
  v23 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF59C0();
  v21 = *(_QWORD *)(v5 - 8);
  v22 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_248AF59D8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v20 - v13;
  sub_248AB8A24(0, (unint64_t *)&qword_2577B11D8);
  v15 = (void *)sub_248AF5C0C();
  sub_248AF59CC();
  MEMORY[0x2495A5018](v12, 0.5);
  v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v12, v8);
  v31 = *a1;
  v32 = *((_BYTE *)a1 + 8);
  v28 = *((_OWORD *)a1 + 1);
  sub_248AB882C((uint64_t)&v28, (uint64_t)&v30, &qword_2577B1158);
  sub_248AB882C((uint64_t)&v28 + 8, (uint64_t)v29, &qword_2577B1160);
  v25 = *((_OWORD *)a1 + 2);
  sub_248AB882C((uint64_t)&v25, (uint64_t)&v27, &qword_2577B1168);
  sub_248AB882C((uint64_t)&v25 + 8, (uint64_t)v26, &qword_2577B1170);
  v16 = (_OWORD *)swift_allocObject();
  v17 = *((_OWORD *)a1 + 1);
  v16[1] = *(_OWORD *)a1;
  v16[2] = v17;
  v16[3] = *((_OWORD *)a1 + 2);
  aBlock[4] = sub_248AB8A60;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_248ADFE80;
  aBlock[3] = &block_descriptor;
  v18 = _Block_copy(aBlock);
  sub_248AB818C((uint64_t)&v31);
  sub_248AB8164(&v30);
  sub_248AB818C((uint64_t)v29);
  sub_248AB8164(&v27);
  sub_248AB818C((uint64_t)v26);
  swift_release();
  sub_248AF59A8();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_248AB80A8((unint64_t *)&unk_2577B14A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11E0);
  sub_248AB8BE8(&qword_2577B14B0, &qword_2577B11E0, MEMORY[0x24BEE12C8]);
  sub_248AF5C84();
  MEMORY[0x2495A5228](v14, v7, v4, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v22);
  return ((uint64_t (*)(char *, uint64_t))v20)(v14, v8);
}

uint64_t sub_248AB76D8(uint64_t *a1)
{
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
  void *v12;
  void *v13;
  id v14;
  char *v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  char *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD aBlock[6];
  uint64_t v35;
  char v36;

  v30 = sub_248AF599C();
  v33 = *(_QWORD *)(v30 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v29 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_248AF59C0();
  v31 = *(_QWORD *)(v3 - 8);
  v32 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_248AF59D8();
  v6 = *(_QWORD *)(v26 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v26 - v10;
  v12 = (void *)a1[4];
  v13 = (void *)a1[2];
  sub_248AB81B4();
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD670]), sel_initWithStyle_, 1);
  objc_msgSend(v14, sel_impactOccurred);

  sub_248AB8A24(0, (unint64_t *)&qword_2577B11D8);
  v27 = sub_248AF5C0C();
  sub_248AF59CC();
  MEMORY[0x2495A5018](v9, 1.5);
  v28 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15 = v9;
  v16 = v26;
  v28(v15, v26);
  v35 = *a1;
  v36 = *((_BYTE *)a1 + 8);
  v17 = (_OWORD *)swift_allocObject();
  v18 = *((_OWORD *)a1 + 1);
  v17[1] = *(_OWORD *)a1;
  v17[2] = v18;
  v17[3] = *((_OWORD *)a1 + 2);
  aBlock[4] = sub_248AB8AC8;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_248ADFE80;
  aBlock[3] = &block_descriptor_15;
  v19 = _Block_copy(aBlock);
  sub_248AB818C((uint64_t)&v35);
  swift_retain();
  v20 = v13;
  swift_retain();
  v21 = v12;
  swift_release();
  sub_248AF59A8();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_248AB80A8((unint64_t *)&unk_2577B14A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11E0);
  sub_248AB8BE8(&qword_2577B14B0, &qword_2577B11E0, MEMORY[0x24BEE12C8]);
  v23 = v29;
  v22 = v30;
  sub_248AF5C84();
  v24 = (void *)v27;
  MEMORY[0x2495A5228](v11, v5, v23, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v23, v22);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v5, v32);
  return ((uint64_t (*)(char *, uint64_t))v28)(v11, v16);
}

uint64_t sub_248AB7A08(uint64_t a1)
{
  char v1;
  uint64_t v2;

  v1 = *(_BYTE *)(a1 + 8);
  v2 = swift_retain();
  sub_248ADB034(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EE0();
  swift_release();
  return swift_release();
}

uint64_t sub_248AB7AE0()
{
  return sub_248AF56A8();
}

uint64_t sub_248AB7AF8@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __int128 v6;
  uint64_t v7;
  void (*v8)();
  __int128 v9;
  void (**v10)();
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  char v18[8];
  id v19;
  __int128 v20;
  char v21[8];
  id v22;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1148);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v1[1];
  v12 = *v1;
  v13 = v6;
  v14 = v1[2];
  *(_QWORD *)v5 = sub_248AF5324();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1150);
  sub_248AB6F8C((uint64_t *)&v12, (uint64_t)&v5[*(int *)(v7 + 44)]);
  v15 = v12;
  v16 = BYTE8(v12);
  v17 = v13;
  sub_248AB882C((uint64_t)&v17, (uint64_t)&v19, &qword_2577B1158);
  sub_248AB882C((uint64_t)&v17 + 8, (uint64_t)v18, &qword_2577B1160);
  v20 = v14;
  sub_248AB882C((uint64_t)&v20, (uint64_t)&v22, &qword_2577B1168);
  sub_248AB882C((uint64_t)&v20 + 8, (uint64_t)v21, &qword_2577B1170);
  v8 = (void (*)())swift_allocObject();
  v9 = v13;
  *((_OWORD *)v8 + 1) = v12;
  *((_OWORD *)v8 + 2) = v9;
  *((_OWORD *)v8 + 3) = v14;
  sub_248AB8870((uint64_t)v5, a1, &qword_2577B1148);
  v10 = (void (**)())(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1178) + 36));
  *v10 = sub_248AB8158;
  v10[1] = v8;
  v10[2] = 0;
  v10[3] = 0;
  sub_248AB818C((uint64_t)&v15);
  sub_248AB8164(&v19);
  sub_248AB818C((uint64_t)v18);
  sub_248AB8164(&v22);
  sub_248AB818C((uint64_t)v21);
  return sub_248AB89E8((uint64_t)v5, &qword_2577B1148);
}

uint64_t sub_248AB7CA4(uint64_t a1, uint64_t a2)
{
  return sub_248AB7D6C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_248AB7CB0()
{
  sub_248AF5A5C();
  sub_248AF5A98();
  return swift_bridgeObjectRelease();
}

uint64_t sub_248AB7CF0()
{
  uint64_t v0;

  sub_248AF5A5C();
  sub_248AF5D98();
  sub_248AF5A98();
  v0 = sub_248AF5DB0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_248AB7D60(uint64_t a1, uint64_t a2)
{
  return sub_248AB7D6C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_248AB7D6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_248AF5A5C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_248AB7DA8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_248AF5A44();
  *a2 = 0;
  return result;
}

uint64_t sub_248AB7E1C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_248AF5A50();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_248AB7E98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_248AF5A5C();
  v2 = sub_248AF5A38();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_248AB7ED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_248AF5A5C();
  v2 = v1;
  if (v0 == sub_248AF5A5C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_248AF5D68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_248AB7F60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_248AF5A38();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_248AB7FA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_248AF5A5C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_248AB7FCC()
{
  sub_248AB80A8(&qword_2577B1138, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248AF6658);
  sub_248AB80A8(&qword_2577B1140, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248AF65AC);
  return sub_248AF5D38();
}

uint64_t sub_248AB8050()
{
  return sub_248AB80A8(&qword_2577B1120, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248AF6570);
}

uint64_t sub_248AB807C()
{
  return sub_248AB80A8(&qword_2577B1128, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248AF6544);
}

uint64_t sub_248AB80A8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495A57B0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_248AB80E8()
{
  return sub_248AB80A8(&qword_2577B1130, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248AF65E0);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495A5798]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_248AB8158()
{
  uint64_t *v0;

  sub_248AB833C(v0[4], v0[5], v0[6], v0[7]);
}

id *sub_248AB8164(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

uint64_t sub_248AB818C(uint64_t a1)
{
  swift_retain();
  return a1;
}

void sub_248AB81B4()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  id v4;
  id v5;
  double v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1180);
  sub_248AF57EC();
  if (v7)
  {
    if (qword_2577B1088 != -1)
      goto LABEL_11;
    while (1)
    {
      v0 = *((_QWORD *)off_2577B1090 + 2);
      if (v0 < 2)
        break;
      v1 = 0;
      v2 = 1;
      while (v2 < *((_QWORD *)off_2577B1090 + 2))
      {
        swift_bridgeObjectRetain();
        v3 = (void *)sub_248AF5A38();
        swift_bridgeObjectRelease();
        v4 = objc_msgSend(v7, sel_stateWithName_, v3);

        __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1188);
        sub_248AF57EC();
        v5 = v7;
        LODWORD(v6) = 1.0;
        objc_msgSend(v7, sel_setState_ofLayer_transitionSpeed_, v4, v5, v6);

        ++v2;
        v1 += 16;
        if (v0 == v2)
          goto LABEL_8;
      }
      __break(1u);
LABEL_11:
      swift_once();
    }
LABEL_8:

  }
}

void sub_248AB833C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  CATransform3D v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (qword_2577B1070 != -1)
    swift_once();
  v8 = qword_2577B10D0;
  swift_bridgeObjectRetain();
  if (v8 != -1)
    swift_once();
  v9 = (void *)qword_2577B2DE8;
  v10 = objc_allocWithZone(MEMORY[0x24BEBB478]);
  v11 = v9;
  v12 = (void *)sub_248AF5A38();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v10, sel_initWithName_bundle_, v12, v11);

  if (v13)
  {
    v14 = objc_msgSend(v13, sel_data);

    v15 = sub_248AF4E98();
    v17 = v16;

    sub_248AB876C(v15, v17);
    v18 = (void *)sub_248AF4E8C();
    v19 = (void *)sub_248AF5A38();
    v31.m11 = 0.0;
    v20 = objc_msgSend((id)objc_opt_self(), sel_packageWithData_type_options_error_, v18, v19, 0, &v31);

    if (v20)
    {
      v21 = *(id *)&v31.m11;
      sub_248AB87B0(v15, v17);
      v22 = objc_msgSend(v20, sel_rootLayer);
      if (v22)
      {
        *(_QWORD *)&v31.m11 = a1;
        *(_QWORD *)&v31.m12 = a2;
        v32 = v22;
        v23 = v22;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1180);
        sub_248AF57F8();
        v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5788]), sel_initWithLayer_, v23);
        *(_QWORD *)&v31.m11 = a3;
        *(_QWORD *)&v31.m12 = a4;
        v32 = v24;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1188);
        sub_248AF57F8();
        CATransform3DMakeScale(&v31, 1.0, -1.0, 1.0);
        objc_msgSend(v23, sel_setTransform_, &v31);
        if (qword_2577B1088 != -1)
          swift_once();
        if (*((_QWORD *)off_2577B1090 + 2))
        {
          swift_bridgeObjectRetain();
          v25 = (void *)sub_248AF5A38();
          swift_bridgeObjectRelease();
        }
        else
        {
          v25 = 0;
        }
        v28 = objc_msgSend(v23, sel_stateWithName_, v25);

        *(_QWORD *)&v31.m11 = a3;
        *(_QWORD *)&v31.m12 = a4;
        sub_248AF57EC();
        v29 = v32;
        if (v32)
        {
          v30 = v23;
          objc_msgSend(v29, sel_setState_ofLayer_, v28, v30);
          sub_248AB87B0(v15, v17);

        }
        else
        {
          sub_248AB87B0(v15, v17);

        }
      }
      else
      {

        sub_248AB87B0(v15, v17);
      }
    }
    else
    {
      v26 = *(id *)&v31.m11;
      v27 = (void *)sub_248AF4E14();

      swift_willThrow();
      sub_248AB87B0(v15, v17);
      sub_248AB87B0(v15, v17);

    }
  }
}

uint64_t sub_248AB876C(uint64_t a1, unint64_t a2)
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

uint64_t sub_248AB87B0(uint64_t a1, unint64_t a2)
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

uint64_t sub_248AB87F4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_248AB8818(void *a1)
{
  uint64_t v1;

  return sub_248AF1A50(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_248AB8824()
{
  uint64_t v0;

  return sub_248AB7390((uint64_t *)(v0 + 16));
}

uint64_t sub_248AB882C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_248AB8870(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_248AB88B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B11C0;
  if (!qword_2577B11C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B11A8);
    v2[0] = sub_248AB8964();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B11C0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495A57A4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_248AB8964()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B11C8;
  if (!qword_2577B11C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B11A0);
    v2[0] = sub_248AB8BE8(&qword_2577B11D0, &qword_2577B1198, MEMORY[0x24BDEBEC0]);
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B11C8);
  }
  return result;
}

uint64_t sub_248AB89E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_248AB8A24(uint64_t a1, unint64_t *a2)
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

uint64_t sub_248AB8A60()
{
  uint64_t v0;

  return sub_248AB76D8((uint64_t *)(v0 + 16));
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

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AB8AC8()
{
  uint64_t v0;

  return sub_248AB7A08(v0 + 16);
}

uint64_t sub_248AB8AD8()
{
  uint64_t v0;

  return sub_248AD5250(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_248AB8B1C(a1, &qword_2577B11F0);
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
  sub_248AB8B1C(a1, &qword_2577B11F8);
}

void sub_248AB8B1C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_248AB8B64()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1200;
  if (!qword_2577B1200)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1178);
    v2[0] = sub_248AB8BE8(&qword_2577B1208, &qword_2577B1148, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1200);
  }
  return result;
}

uint64_t sub_248AB8BE8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495A57B0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_248AB8C44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_248AF4E2C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v6);
  sub_248AF5A20();
  if (qword_2577B10B0 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v1, (uint64_t)qword_2577B5078);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
  sub_248AF4EC8();
  sub_248AF4E44();
  result = sub_248AF5A74();
  qword_2577B5060 = result;
  *(_QWORD *)algn_2577B5068 = v9;
  return result;
}

uint64_t sub_248AB8DFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  int *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  int v36;
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
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;

  v2 = v1;
  v37 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13B8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = (int *)type metadata accessor for SelectTextView();
  v7 = v1 + v6[7];
  v8 = *(_BYTE *)v7;
  v9 = *(_QWORD *)(v7 + 8);
  LOBYTE(v41) = v8;
  v42 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF5804();
  v39 = v44;
  v40 = v43;
  v36 = v45;
  v10 = v1 + v6[6];
  v11 = *(_BYTE *)v10;
  v12 = *(_QWORD *)(v10 + 8);
  LOBYTE(v41) = v11;
  v42 = v12;
  sub_248AF5804();
  v13 = v44;
  v38 = v43;
  v14 = v45;
  v15 = (uint64_t *)(v1 + v6[9]);
  v16 = *v15;
  v17 = v15[1];
  v41 = v16;
  v42 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
  sub_248AF5804();
  v18 = v43;
  v19 = v44;
  v20 = v45;
  v21 = *(_BYTE *)(v2 + v6[5] + 8);
  v22 = swift_retain();
  v23 = sub_248ADB034(v22, v21);
  swift_release();
  if (qword_2577B1098 != -1)
    swift_once();
  v25 = qword_2577B5060;
  v24 = *(_QWORD *)algn_2577B5068;
  v26 = objc_allocWithZone(MEMORY[0x24BEBDA88]);
  swift_bridgeObjectRetain();
  v27 = objc_msgSend(v26, sel_init);
  v43 = v40;
  v44 = v39;
  LOBYTE(v45) = v36;
  v46 = v38;
  v47 = v13;
  v48 = v14;
  v49 = v18;
  v50 = v19;
  v51 = v20;
  v52 = v23;
  v53 = v27;
  v54 = v25;
  v55 = v24;
  *v5 = sub_248AF58F4();
  v5[1] = v28;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13D0);
  sub_248AB90F0(v2, (uint64_t)&v43, (uint64_t)v5 + *(int *)(v29 + 44));
  if (qword_2577B10C0 != -1)
    swift_once();
  v30 = qword_2577B5098;
  swift_retain();
  v31 = sub_248AF551C();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v32 = v37;
  sub_248AB8870((uint64_t)v5, v37, &qword_2577B13B8);
  v33 = v32 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B13D8) + 36);
  *(_QWORD *)v33 = v30;
  *(_BYTE *)(v33 + 8) = v31;
  return sub_248AB89E8((uint64_t)v5, &qword_2577B13B8);
}

uint64_t sub_248AB90F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  _BYTE v22[16];
  uint64_t v23;
  char v24;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13E0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = &v22[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = &v22[-v11];
  MEMORY[0x24BDAC7A8](v10);
  v14 = &v22[-v13];
  *(_QWORD *)v12 = sub_248AF5324();
  *((_QWORD *)v12 + 1) = 0;
  v12[16] = 0;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13E8);
  sub_248AB9294(a1, a2, (uint64_t)&v12[*(int *)(v15 + 44)]);
  sub_248ABD344((uint64_t)v12, (uint64_t)v14);
  v16 = a1 + *(int *)(type metadata accessor for SelectTextView() + 24);
  v17 = *(_BYTE *)v16;
  v18 = *(_QWORD *)(v16 + 8);
  v22[8] = v17;
  v23 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57EC();
  if (v24)
    v19 = 0.01;
  else
    v19 = 0.0;
  sub_248AB8870((uint64_t)v14, (uint64_t)v9, &qword_2577B13E0);
  sub_248AB8870((uint64_t)v9, a3, &qword_2577B13E0);
  v20 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B13F0) + 48);
  *(float *)v20 = v19;
  *(_WORD *)(v20 + 4) = 256;
  sub_248AB89E8((uint64_t)v14, &qword_2577B13E0);
  return sub_248AB89E8((uint64_t)v9, &qword_2577B13E0);
}

uint64_t sub_248AB9294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  int v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  char v27;
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
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, char *, uint64_t);
  char *v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  void (*v84)(char *, uint64_t);
  uint64_t v86;
  int v87;
  int v88;
  int v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  uint64_t v117;
  _OWORD v118[26];
  unsigned __int8 v119;
  char v120;
  char v121;
  char v122;
  char v123;
  char v124;
  char v125;
  _QWORD v126[52];
  _OWORD v127[7];
  _OWORD v128[2];
  _OWORD v129[9];
  char v130;
  __int128 v131;
  _BYTE v132[145];
  __int128 v133;
  _BYTE v134[145];
  _QWORD v135[2];
  char v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;
  char v147;
  uint64_t v148;
  unsigned __int8 v149;
  uint64_t v150;
  unsigned __int8 v151;
  uint64_t v152;
  unsigned __int8 v153;
  uint64_t v154;
  unsigned __int8 v155;
  uint64_t v156;
  unsigned __int8 v157;
  uint64_t v158;
  uint64_t v159;
  _OWORD v160[7];
  _OWORD v161[2];
  _OWORD v162[9];
  char v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _OWORD v173[13];
  uint64_t v174;

  v109 = a3;
  v5 = type metadata accessor for SelectTextView();
  v101 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v114 = (uint64_t)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13F8);
  v105 = *(_QWORD *)(v7 - 8);
  v106 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v104 = (char *)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577B1400);
  v108 = *(_QWORD *)(v111 - 8);
  v9 = MEMORY[0x24BDAC7A8](v111);
  v110 = (char *)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v103 = (char *)&v86 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v107 = (char *)&v86 - v13;
  v117 = sub_248AF5294();
  sub_248AB9DBC(a1, (uint64_t)v160);
  *(_OWORD *)((char *)&v162[2] + 7) = v160[2];
  *(_OWORD *)((char *)&v162[1] + 7) = v160[1];
  *(_OWORD *)((char *)&v162[6] + 7) = v160[6];
  *(_OWORD *)((char *)&v162[5] + 7) = v160[5];
  *(_OWORD *)((char *)&v162[7] + 7) = v161[0];
  v162[8] = *(_OWORD *)((char *)v161 + 9);
  *(_OWORD *)((char *)&v162[3] + 7) = v160[3];
  v163 = 1;
  *(_OWORD *)((char *)&v162[4] + 7) = v160[4];
  *(_OWORD *)((char *)v162 + 7) = v160[0];
  v116 = 1;
  v167 = v162[3];
  v166 = v162[2];
  v172 = *(_OWORD *)((char *)v161 + 9);
  v171 = v162[7];
  v170 = v162[6];
  v168 = v162[4];
  v169 = v162[5];
  v165 = v162[1];
  v164 = v162[0];
  v14 = (uint64_t *)(a1 + *(int *)(v5 + 32));
  v15 = *v14;
  v16 = v14[1];
  v126[0] = v15;
  v126[1] = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
  sub_248AF57EC();
  v17 = *(double *)v118;
  sub_248AF58F4();
  sub_248AC0AA0(0.0, 1, 0.0, 1, v17, 0, 0.0, 1, (uint64_t)v173, 0.0, 1, 0.0, 1);
  v102 = v5;
  v18 = *(int *)(v5 + 36);
  v113 = a1;
  v19 = (uint64_t *)(a1 + v18);
  v20 = *v19;
  v21 = v19[1];
  v126[0] = v20;
  v126[1] = v21;
  sub_248AF57EC();
  sub_248AF58F4();
  sub_248AF5174();
  v22 = v147;
  v98 = v148;
  v99 = v146;
  v23 = v149;
  v112 = v151;
  v96 = v152;
  v97 = v150;
  v24 = v153;
  LODWORD(v100) = v155;
  v94 = v156;
  v95 = v154;
  v25 = v157;
  v92 = v159;
  v93 = v158;
  LOBYTE(a1) = sub_248AF5540();
  v26 = sub_248AF5558();
  v27 = sub_248AF554C();
  sub_248AF554C();
  if (sub_248AF554C() != a1)
    v27 = sub_248AF554C();
  sub_248AF554C();
  if (sub_248AF554C() != v26)
    v27 = sub_248AF554C();
  v124 = v22;
  v123 = v23;
  v122 = v112;
  v121 = v24;
  v120 = v100;
  v119 = v25;
  v87 = v23;
  v88 = v100;
  v89 = v24;
  v90 = v25;
  sub_248AF4F88();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v125 = 0;
  v36 = v114;
  sub_248ABD38C(v113, v114);
  v37 = *(unsigned __int8 *)(v101 + 80);
  v38 = (v37 + 16) & ~v37;
  v100 = v38;
  v101 = v38 + v115;
  v91 = v37 | 7;
  v39 = (v38 + v115 + 7) & 0xFFFFFFFFFFFFFFF8;
  v40 = swift_allocObject();
  sub_248ABD540(v36, v40 + v38);
  v41 = v40 + v39;
  v42 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v41 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v41 + 80) = v42;
  *(_QWORD *)(v41 + 96) = *(_QWORD *)(a2 + 96);
  v43 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v41 = *(_OWORD *)a2;
  *(_OWORD *)(v41 + 16) = v43;
  v44 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v41 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v41 + 48) = v44;
  v118[10] = v173[10];
  v118[11] = v173[11];
  v118[12] = v173[12];
  v118[6] = v173[6];
  v118[7] = v173[7];
  v118[8] = v173[8];
  v118[9] = v173[9];
  v118[2] = v173[2];
  v118[3] = v173[3];
  v118[4] = v173[4];
  v118[5] = v173[5];
  v118[0] = v173[0];
  v118[1] = v173[1];
  *(_QWORD *)&v118[13] = v174;
  *((_QWORD *)&v118[13] + 1) = v99;
  LOBYTE(v118[14]) = v22;
  *((_QWORD *)&v118[14] + 1) = v98;
  LOBYTE(v118[15]) = v87;
  *((_QWORD *)&v118[15] + 1) = v97;
  LOBYTE(v118[16]) = v112;
  *((_QWORD *)&v118[16] + 1) = v96;
  LOBYTE(v118[17]) = v89;
  *((_QWORD *)&v118[17] + 1) = v95;
  LOBYTE(v118[18]) = v88;
  *((_QWORD *)&v118[18] + 1) = v94;
  LOBYTE(v118[19]) = v90;
  *((_QWORD *)&v118[19] + 1) = v93;
  *(_QWORD *)&v118[20] = v92;
  WORD4(v118[20]) = 256;
  LOBYTE(v118[21]) = v27;
  *((_QWORD *)&v118[21] + 1) = v29;
  *(_QWORD *)&v118[22] = v31;
  *((_QWORD *)&v118[22] + 1) = v33;
  *(_QWORD *)&v118[23] = v35;
  BYTE8(v118[23]) = v125;
  *(_QWORD *)&v118[24] = sub_248ABD584;
  *((_QWORD *)&v118[24] + 1) = v40;
  v118[25] = 0uLL;
  v45 = v102;
  v46 = v113;
  LOBYTE(v40) = *(_BYTE *)(v113 + *(int *)(v102 + 20) + 8);
  sub_248ABD5C4(a2);
  v47 = swift_retain();
  v48 = sub_248ADB034(v47, v40);
  swift_release();
  swift_getKeyPath();
  v126[0] = v48;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  v49 = *(_BYTE *)(v48 + 51);
  swift_release();
  LOBYTE(v135[0]) = v49;
  v50 = v114;
  sub_248ABD38C(v46, v114);
  v51 = swift_allocObject();
  v52 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v51 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v51 + 96) = v52;
  *(_QWORD *)(v51 + 112) = *(_QWORD *)(a2 + 96);
  v53 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v51 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v51 + 32) = v53;
  v54 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v51 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v51 + 64) = v54;
  sub_248ABD540(v50, v51 + ((v37 + 120) & ~v37));
  sub_248ABD5C4(a2);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1410);
  v56 = sub_248ABD838(&qword_2577B1418, &qword_2577B1410, sub_248ABD814, MEMORY[0x24BDF0910]);
  v57 = v104;
  sub_248AF572C();
  swift_release();
  memcpy(v126, v118, sizeof(v126));
  sub_248ABD950(v126);
  v58 = v46 + *(int *)(v45 + 28);
  v59 = *(_BYTE *)v58;
  v60 = *(_QWORD *)(v58 + 8);
  LOBYTE(v118[0]) = v59;
  *((_QWORD *)&v118[0] + 1) = v60;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57EC();
  sub_248ABD38C(v46, v50);
  v61 = swift_allocObject();
  sub_248ABD540(v50, v61 + v100);
  *(_QWORD *)&v118[0] = v55;
  *((_QWORD *)&v118[0] + 1) = MEMORY[0x24BEE1328];
  *(_QWORD *)&v118[1] = v56;
  *((_QWORD *)&v118[1] + 1) = MEMORY[0x24BEE1340];
  swift_getOpaqueTypeConformance2();
  v62 = v103;
  v63 = v106;
  sub_248AF572C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v105 + 8))(v57, v63);
  v64 = v107;
  v65 = v108;
  v66 = v111;
  (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v107, v62, v111);
  v115 = sub_248AF5294();
  sub_248ABAA28(v46, (uint64_t)v127);
  *(_OWORD *)((char *)&v129[5] + 7) = v127[5];
  *(_OWORD *)((char *)&v129[6] + 7) = v127[6];
  *(_OWORD *)((char *)&v129[7] + 7) = v128[0];
  v129[8] = *(_OWORD *)((char *)v128 + 9);
  *(_OWORD *)((char *)&v129[1] + 7) = v127[1];
  *(_OWORD *)((char *)&v129[2] + 7) = v127[2];
  *(_OWORD *)((char *)&v129[3] + 7) = v127[3];
  *(_OWORD *)((char *)&v129[4] + 7) = v127[4];
  v130 = 1;
  *(_OWORD *)((char *)v129 + 7) = v127[0];
  v67 = *(void (**)(char *, char *, uint64_t))(v65 + 16);
  v68 = v110;
  v67(v110, v64, v66);
  *(_OWORD *)&v132[33] = v166;
  *(_OWORD *)&v132[17] = v165;
  *(_OWORD *)&v132[81] = v169;
  *(_OWORD *)&v132[97] = v170;
  *(_OWORD *)&v132[113] = v171;
  *(_OWORD *)&v132[129] = v172;
  *(_OWORD *)&v132[49] = v167;
  v131 = (unint64_t)v117;
  v132[0] = v116;
  *(_OWORD *)&v132[65] = v168;
  *(_OWORD *)&v132[1] = v164;
  v69 = *(_OWORD *)&v132[128];
  v70 = v109;
  *(_OWORD *)(v109 + 128) = *(_OWORD *)&v132[112];
  *(_OWORD *)(v70 + 144) = v69;
  *(_BYTE *)(v70 + 160) = v132[144];
  v71 = *(_OWORD *)&v132[64];
  *(_OWORD *)(v70 + 64) = *(_OWORD *)&v132[48];
  *(_OWORD *)(v70 + 80) = v71;
  v72 = *(_OWORD *)&v132[96];
  *(_OWORD *)(v70 + 96) = *(_OWORD *)&v132[80];
  *(_OWORD *)(v70 + 112) = v72;
  v73 = *(_OWORD *)v132;
  *(_OWORD *)v70 = v131;
  *(_OWORD *)(v70 + 16) = v73;
  v74 = *(_OWORD *)&v132[32];
  *(_OWORD *)(v70 + 32) = *(_OWORD *)&v132[16];
  *(_OWORD *)(v70 + 48) = v74;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1468);
  v67((char *)(v70 + *(int *)(v75 + 48)), v68, v66);
  v76 = *(int *)(v75 + 64);
  *(_OWORD *)&v134[81] = v129[5];
  *(_OWORD *)&v134[97] = v129[6];
  *(_OWORD *)&v134[113] = v129[7];
  *(_OWORD *)&v134[129] = v129[8];
  *(_OWORD *)&v134[33] = v129[2];
  *(_OWORD *)&v134[17] = v129[1];
  *(_OWORD *)&v134[49] = v129[3];
  v77 = v70 + v76;
  v78 = v115;
  v133 = (unint64_t)v115;
  v134[0] = 1;
  *(_OWORD *)&v134[65] = v129[4];
  *(_OWORD *)&v134[1] = v129[0];
  v79 = *(_OWORD *)&v134[128];
  *(_OWORD *)(v77 + 128) = *(_OWORD *)&v134[112];
  *(_OWORD *)(v77 + 144) = v79;
  *(_BYTE *)(v77 + 160) = v134[144];
  v80 = *(_OWORD *)&v134[64];
  *(_OWORD *)(v77 + 64) = *(_OWORD *)&v134[48];
  *(_OWORD *)(v77 + 80) = v80;
  v81 = *(_OWORD *)&v134[96];
  *(_OWORD *)(v77 + 96) = *(_OWORD *)&v134[80];
  *(_OWORD *)(v77 + 112) = v81;
  v82 = *(_OWORD *)v134;
  *(_OWORD *)v77 = v133;
  *(_OWORD *)(v77 + 16) = v82;
  v83 = *(_OWORD *)&v134[32];
  *(_OWORD *)(v77 + 32) = *(_OWORD *)&v134[16];
  *(_OWORD *)(v77 + 48) = v83;
  sub_248ABDB88((uint64_t)&v131);
  sub_248ABDBCC((uint64_t)&v133);
  v84 = *(void (**)(char *, uint64_t))(v65 + 8);
  v84(v64, v66);
  v142 = v129[5];
  v143 = v129[6];
  v144 = v129[7];
  v145 = v129[8];
  v138 = v129[1];
  v139 = v129[2];
  v140 = v129[3];
  v141 = v129[4];
  v135[0] = v78;
  v135[1] = 0;
  v136 = 1;
  v137 = v129[0];
  sub_248ABDC04((uint64_t)v135);
  v84(v68, v66);
  *(_OWORD *)((char *)&v118[6] + 1) = v169;
  *(_OWORD *)((char *)&v118[7] + 1) = v170;
  *(_OWORD *)((char *)&v118[8] + 1) = v171;
  *(_OWORD *)((char *)&v118[9] + 1) = v172;
  *(_OWORD *)((char *)&v118[2] + 1) = v165;
  *(_OWORD *)((char *)&v118[3] + 1) = v166;
  *(_OWORD *)((char *)&v118[4] + 1) = v167;
  *(_OWORD *)((char *)&v118[5] + 1) = v168;
  v118[0] = (unint64_t)v117;
  LOBYTE(v118[1]) = v116;
  *(_OWORD *)((char *)&v118[1] + 1) = v164;
  return sub_248ABDC48((uint64_t)v118);
}

uint64_t sub_248AB9DBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
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
  _BYTE *v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  void (*v27)(_QWORD);
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t);
  int v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  _BYTE *v35;
  _BYTE *v36;
  void (*v37)(_BYTE *, uint64_t);
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  _BYTE *v41;
  _QWORD *v42;
  _BYTE *v43;
  void (*v44)(_BYTE *, uint64_t);
  uint64_t v45;
  char v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v66[4];
  int v67;
  _BYTE *v68;
  _BYTE *v69;
  _BYTE *v70;
  void (*v71)(uint64_t, _QWORD, uint64_t);
  unsigned int v72;
  void (*v73)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  _BYTE *v77;
  uint64_t KeyPath;
  __int128 v79;
  _BYTE *v80;
  _QWORD *v81;
  char v82;
  char v83;
  char v84;
  char v85;
  _OWORD v86[2];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _OWORD v91[2];
  char v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t v114;

  v4 = sub_248AF5408();
  v5 = *(_QWORD **)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v70 = &v66[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1470);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v77 = &v66[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v66[-v10];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v69 = &v66[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v76 = &v66[-v16];
  v17 = MEMORY[0x24BDAC7A8](v15);
  v80 = &v66[-v18];
  v19 = MEMORY[0x24BDAC7A8](v17);
  v68 = &v66[-v20];
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = &v66[-v22];
  MEMORY[0x24BDAC7A8](v21);
  v25 = &v66[-v24];
  v26 = unk_2577B1218;
  *(_QWORD *)&v79 = qword_2577B1210;
  KeyPath = swift_getKeyPath();
  *((_QWORD *)&v79 + 1) = v26;
  swift_bridgeObjectRetain();
  v75 = a1;
  sub_248ADB6C8((uint64_t)v25);
  v27 = (void (*)(_QWORD))v5[13];
  v72 = *MEMORY[0x24BDEFEE8];
  v71 = (void (*)(uint64_t, _QWORD, uint64_t))v27;
  v27(v23);
  v73 = (void (*)(_BYTE *, _QWORD, uint64_t, uint64_t))v5[7];
  v73(v23, 0, 1, v4);
  v74 = v7;
  v28 = (uint64_t)&v11[*(int *)(v7 + 48)];
  sub_248AB8870((uint64_t)v25, (uint64_t)v11, &qword_2577B1300);
  sub_248AB8870((uint64_t)v23, v28, &qword_2577B1300);
  v81 = v5;
  v29 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v5[6];
  if (v29((uint64_t)v11, 1, v4) == 1)
  {
    sub_248AB89E8((uint64_t)v23, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v25, &qword_2577B1300);
    v30 = v29(v28, 1, v4);
    v31 = (uint64_t)v77;
    if (v30 == 1)
    {
      sub_248AB89E8((uint64_t)v11, &qword_2577B1300);
      v32 = 0x4054000000000000;
      v33 = v80;
      v34 = (uint64_t)v76;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  v35 = v68;
  sub_248AB8870((uint64_t)v11, (uint64_t)v68, &qword_2577B1300);
  if (v29(v28, 1, v4) == 1)
  {
    sub_248AB89E8((uint64_t)v23, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v25, &qword_2577B1300);
    ((void (*)(_BYTE *, uint64_t))v81[1])(v35, v4);
    v31 = (uint64_t)v77;
LABEL_6:
    sub_248AB89E8((uint64_t)v11, &qword_2577B1470);
    v33 = v80;
    v34 = (uint64_t)v76;
    goto LABEL_9;
  }
  v36 = v70;
  ((void (*)(_BYTE *, uint64_t, uint64_t))v81[4])(v70, v28, v4);
  sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
  v67 = sub_248AF5A14();
  v37 = (void (*)(_BYTE *, uint64_t))v81[1];
  v37(v36, v4);
  sub_248AB89E8((uint64_t)v23, &qword_2577B1300);
  sub_248AB89E8((uint64_t)v25, &qword_2577B1300);
  v37(v35, v4);
  sub_248AB89E8((uint64_t)v11, &qword_2577B1300);
  v34 = (uint64_t)v76;
  v31 = (uint64_t)v77;
  v33 = v80;
  if ((v67 & 1) != 0)
  {
    v32 = 0x4054000000000000;
    goto LABEL_10;
  }
LABEL_9:
  v32 = 0x405E000000000000;
LABEL_10:
  sub_248ADB6C8((uint64_t)v33);
  v71(v34, v72, v4);
  v73((_BYTE *)v34, 0, 1, v4);
  v38 = v31 + *(int *)(v74 + 48);
  sub_248AB8870((uint64_t)v33, v31, &qword_2577B1300);
  sub_248AB8870(v34, v38, &qword_2577B1300);
  if (v29(v31, 1, v4) != 1)
  {
    v39 = v69;
    sub_248AB8870(v31, (uint64_t)v69, &qword_2577B1300);
    if (v29(v38, 1, v4) != 1)
    {
      v77 = (_BYTE *)v32;
      v40 = v34;
      v41 = v39;
      v42 = v81;
      v43 = v70;
      ((void (*)(_BYTE *, uint64_t, uint64_t))v81[4])(v70, v38, v4);
      sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
      sub_248AF5A14();
      v44 = (void (*)(_BYTE *, uint64_t))v42[1];
      v44(v43, v4);
      sub_248AB89E8(v40, &qword_2577B1300);
      sub_248AB89E8((uint64_t)v80, &qword_2577B1300);
      v44(v41, v4);
      sub_248AB89E8(v31, &qword_2577B1300);
      goto LABEL_17;
    }
    sub_248AB89E8(v34, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v33, &qword_2577B1300);
    ((void (*)(_BYTE *, uint64_t))v81[1])(v39, v4);
    goto LABEL_15;
  }
  sub_248AB89E8(v34, &qword_2577B1300);
  sub_248AB89E8((uint64_t)v33, &qword_2577B1300);
  if (v29(v38, 1, v4) != 1)
  {
LABEL_15:
    sub_248AB89E8(v31, &qword_2577B1470);
    goto LABEL_17;
  }
  sub_248AB89E8(v31, &qword_2577B1300);
LABEL_17:
  sub_248AF5900();
  sub_248AF5048();
  v45 = v109;
  v46 = v110;
  v47 = v111;
  v48 = v112;
  v49 = v113;
  v50 = v114;
  v51 = sub_248AF5540();
  sub_248AF4F88();
  v85 = 0;
  v84 = v46;
  v83 = v48;
  v82 = 0;
  v53 = KeyPath;
  v52 = v79;
  *(_QWORD *)&v86[0] = KeyPath;
  BYTE8(v86[0]) = 0;
  v54 = *((_QWORD *)&v79 + 1);
  v86[1] = v79;
  *(_QWORD *)&v87 = v45;
  BYTE8(v87) = v46;
  *(_QWORD *)&v88 = v47;
  BYTE8(v88) = v48;
  *(_QWORD *)&v89 = v49;
  *((_QWORD *)&v89 + 1) = v50;
  LOBYTE(v90) = v51;
  *((_QWORD *)&v90 + 1) = v55;
  *(_QWORD *)&v91[0] = v56;
  *((_QWORD *)&v91[0] + 1) = v57;
  *(_QWORD *)&v91[1] = v58;
  BYTE8(v91[1]) = 0;
  v59 = v86[0];
  v60 = v79;
  v61 = v88;
  *(_OWORD *)(a2 + 32) = v87;
  *(_OWORD *)(a2 + 48) = v61;
  *(_OWORD *)a2 = v59;
  *(_OWORD *)(a2 + 16) = v60;
  v62 = v89;
  v63 = v90;
  v64 = v91[0];
  *(_OWORD *)(a2 + 105) = *(_OWORD *)((char *)v91 + 9);
  *(_OWORD *)(a2 + 80) = v63;
  *(_OWORD *)(a2 + 96) = v64;
  *(_OWORD *)(a2 + 64) = v62;
  v92 = 1;
  *(_QWORD *)(a2 + 128) = 0;
  *(_BYTE *)(a2 + 136) = 1;
  v93 = v53;
  v94 = 0;
  v95 = v52;
  v96 = v54;
  v97 = v45;
  v98 = v46;
  v99 = v47;
  v100 = v48;
  v101 = v49;
  v102 = v50;
  v103 = v51;
  v104 = v55;
  v105 = v56;
  v106 = v57;
  v107 = v58;
  v108 = 0;
  sub_248ABDC88((uint64_t)v86);
  return sub_248ABDCC0((uint64_t)&v93);
}

uint64_t sub_248ABA4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[6];
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = type metadata accessor for SelectTextView();
  v5 = *(_BYTE *)(a1 + *(int *)(v4 + 20) + 8);
  v6 = swift_retain();
  v7 = sub_248ADB034(v6, v5);
  swift_release();
  swift_getKeyPath();
  v23[5] = v7;
  v24 = 1;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EE0();
  swift_release();
  swift_release();
  v8 = swift_retain();
  v9 = sub_248ADB034(v8, v5);
  swift_release();
  *(_BYTE *)(v9 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 4;
  swift_release();
  v23[0] = 0;
  v23[1] = 0;
  v10 = objc_msgSend(*(id *)(a2 + 80), sel_attributedText);
  if (!v10)
    __break(1u);
  v11 = v10;
  v12 = objc_msgSend(v10, sel_attributesAtIndex_effectiveRange_, 0, v23);

  type metadata accessor for Key(0);
  sub_248AB80A8(&qword_2577B1138, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248AF6658);
  sub_248AF59FC();

  if (qword_2577B1098 != -1)
    swift_once();
  v25 = qword_2577B5060;
  v26 = *(_QWORD *)algn_2577B5068;
  sub_248ABDD1C();
  v13 = sub_248AF5C6C();
  v14 = *(_QWORD *)(v13 + 16);
  if (v14)
  {
    v15 = v14 - 1;
    if (v14 == 1)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v17 = v13 + 56;
      do
      {
        swift_bridgeObjectRetain();
        sub_248AF5AA4();
        sub_248AF5AA4();
        v17 += 16;
        swift_bridgeObjectRelease();
        --v15;
      }
      while (v15);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    v18 = (void *)sub_248AF5A38();
    swift_bridgeObjectRelease();
    v19 = (void *)sub_248AF59F0();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_sizeWithAttributes_, v19);

    v20 = (uint64_t *)(a1 + *(int *)(v4 + 32));
    v21 = *v20;
    v22 = v20[1];
    v25 = v21;
    v26 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
    return sub_248AF57F8();
  }
  else
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void sub_248ABA8BC(uint64_t a1, _BYTE *a2)
{
  if (*a2 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577B1480);
    sub_248AF5840();
    type metadata accessor for SelectTextView();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
    sub_248AF57F8();
  }
}

void sub_248ABA960(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  if (*a2 == 1)
  {
    v4 = type metadata accessor for SelectTextView();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
    sub_248AF57F8();
    v5 = *(_BYTE *)(a3 + *(int *)(v4 + 20) + 8);
    v6 = swift_retain();
    v7 = sub_248ADB034(v6, v5);
    swift_release();
    *(_BYTE *)(v7 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 4;
    swift_release();
  }
}

uint64_t sub_248ABAA28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
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
  _BYTE *v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  void (*v27)(_QWORD);
  uint64_t v28;
  unsigned int (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  uint64_t v33;
  _BYTE *v34;
  void (*v35)(_BYTE *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  _BYTE *v39;
  _QWORD *v40;
  _BYTE *v41;
  void (*v42)(_BYTE *, uint64_t);
  uint64_t v43;
  char v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v64[4];
  int v65;
  _BYTE *v66;
  _BYTE *v67;
  void (*v68)(_BYTE *, _QWORD, uint64_t);
  unsigned int v69;
  void (*v70)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE *v74;
  uint64_t KeyPath;
  __int128 v76;
  _BYTE *v77;
  _BYTE *v78;
  _QWORD *v79;
  char v80;
  char v81;
  char v82;
  char v83;
  _OWORD v84[2];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _OWORD v89[2];
  _OWORD v90[8];
  char v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  char v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  uint64_t v113;

  v4 = sub_248AF5408();
  v5 = *(_QWORD **)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v67 = &v64[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1470);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v74 = &v64[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v64[-v10];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v66 = &v64[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v77 = &v64[-v16];
  v17 = MEMORY[0x24BDAC7A8](v15);
  v78 = &v64[-v18];
  v19 = MEMORY[0x24BDAC7A8](v17);
  v71 = (uint64_t)&v64[-v20];
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = &v64[-v22];
  MEMORY[0x24BDAC7A8](v21);
  v25 = &v64[-v24];
  v26 = unk_2577B1228;
  *(_QWORD *)&v76 = qword_2577B1220;
  KeyPath = swift_getKeyPath();
  *((_QWORD *)&v76 + 1) = v26;
  swift_bridgeObjectRetain();
  v73 = a1;
  sub_248ADB6C8((uint64_t)v25);
  v27 = (void (*)(_QWORD))v5[13];
  v69 = *MEMORY[0x24BDEFEE8];
  v68 = (void (*)(_BYTE *, _QWORD, uint64_t))v27;
  v27(v23);
  v70 = (void (*)(_BYTE *, _QWORD, uint64_t, uint64_t))v5[7];
  v70(v23, 0, 1, v4);
  v72 = v7;
  v28 = (uint64_t)&v11[*(int *)(v7 + 48)];
  sub_248AB8870((uint64_t)v25, (uint64_t)v11, &qword_2577B1300);
  sub_248AB8870((uint64_t)v23, v28, &qword_2577B1300);
  v79 = v5;
  v29 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v5[6];
  if (v29((uint64_t)v11, 1, v4) == 1)
  {
    sub_248AB89E8((uint64_t)v23, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v25, &qword_2577B1300);
    if (v29(v28, 1, v4) == 1)
    {
      sub_248AB89E8((uint64_t)v11, &qword_2577B1300);
      v71 = 0x4054000000000000;
      v30 = (uint64_t)v74;
      v32 = v77;
      v31 = v78;
      goto LABEL_11;
    }
    goto LABEL_6;
  }
  v33 = v71;
  sub_248AB8870((uint64_t)v11, v71, &qword_2577B1300);
  if (v29(v28, 1, v4) == 1)
  {
    sub_248AB89E8((uint64_t)v23, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v25, &qword_2577B1300);
    ((void (*)(uint64_t, uint64_t))v79[1])(v33, v4);
LABEL_6:
    sub_248AB89E8((uint64_t)v11, &qword_2577B1470);
    v30 = (uint64_t)v74;
    v32 = v77;
LABEL_9:
    v36 = 0x405E000000000000;
    goto LABEL_10;
  }
  v34 = v67;
  ((void (*)(_BYTE *, uint64_t, uint64_t))v79[4])(v67, v28, v4);
  sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
  v65 = sub_248AF5A14();
  v35 = (void (*)(_BYTE *, uint64_t))v79[1];
  v35(v34, v4);
  sub_248AB89E8((uint64_t)v23, &qword_2577B1300);
  sub_248AB89E8((uint64_t)v25, &qword_2577B1300);
  v35((_BYTE *)v33, v4);
  sub_248AB89E8((uint64_t)v11, &qword_2577B1300);
  v30 = (uint64_t)v74;
  v32 = v77;
  if ((v65 & 1) == 0)
    goto LABEL_9;
  v36 = 0x4054000000000000;
LABEL_10:
  v71 = v36;
  v31 = v78;
LABEL_11:
  sub_248ADB6C8((uint64_t)v31);
  v68(v32, v69, v4);
  v70(v32, 0, 1, v4);
  v37 = v30 + *(int *)(v72 + 48);
  sub_248AB8870((uint64_t)v31, v30, &qword_2577B1300);
  sub_248AB8870((uint64_t)v32, v37, &qword_2577B1300);
  if (v29(v30, 1, v4) != 1)
  {
    v38 = v66;
    sub_248AB8870(v30, (uint64_t)v66, &qword_2577B1300);
    if (v29(v37, 1, v4) != 1)
    {
      v39 = v38;
      v40 = v79;
      v41 = v67;
      ((void (*)(_BYTE *, uint64_t, uint64_t))v79[4])(v67, v37, v4);
      sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
      sub_248AF5A14();
      v42 = (void (*)(_BYTE *, uint64_t))v40[1];
      v42(v41, v4);
      sub_248AB89E8((uint64_t)v77, &qword_2577B1300);
      sub_248AB89E8((uint64_t)v78, &qword_2577B1300);
      v42(v39, v4);
      sub_248AB89E8(v30, &qword_2577B1300);
      goto LABEL_18;
    }
    sub_248AB89E8((uint64_t)v32, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v31, &qword_2577B1300);
    ((void (*)(_BYTE *, uint64_t))v79[1])(v38, v4);
    goto LABEL_16;
  }
  sub_248AB89E8((uint64_t)v32, &qword_2577B1300);
  sub_248AB89E8((uint64_t)v31, &qword_2577B1300);
  if (v29(v37, 1, v4) != 1)
  {
LABEL_16:
    sub_248AB89E8(v30, &qword_2577B1470);
    goto LABEL_18;
  }
  sub_248AB89E8(v30, &qword_2577B1300);
LABEL_18:
  sub_248AF590C();
  sub_248AF5048();
  v43 = v108;
  v44 = v109;
  v45 = v110;
  v46 = v111;
  v47 = v112;
  v48 = v113;
  v49 = sub_248AF5558();
  sub_248AF4F88();
  v83 = 0;
  v82 = v44;
  v81 = v46;
  v80 = 0;
  v51 = KeyPath;
  v50 = v76;
  *(_QWORD *)&v84[0] = KeyPath;
  BYTE8(v84[0]) = 0;
  v52 = *((_QWORD *)&v76 + 1);
  v84[1] = v76;
  *(_QWORD *)&v85 = v43;
  BYTE8(v85) = v44;
  *(_QWORD *)&v86 = v45;
  BYTE8(v86) = v46;
  *(_QWORD *)&v87 = v47;
  *((_QWORD *)&v87 + 1) = v48;
  LOBYTE(v88) = v49;
  *((_QWORD *)&v88 + 1) = v53;
  *(_QWORD *)&v89[0] = v54;
  *((_QWORD *)&v89[0] + 1) = v55;
  *(_QWORD *)&v89[1] = v56;
  BYTE8(v89[1]) = 0;
  v91 = 1;
  *(_OWORD *)((char *)&v90[3] + 7) = v86;
  *(_OWORD *)((char *)&v90[2] + 7) = v85;
  *(_OWORD *)((char *)&v90[1] + 7) = v76;
  *(_OWORD *)((char *)v90 + 7) = v84[0];
  v90[7] = *(_OWORD *)((char *)v89 + 9);
  *(_OWORD *)((char *)&v90[6] + 7) = v89[0];
  *(_OWORD *)((char *)&v90[5] + 7) = v88;
  *(_OWORD *)((char *)&v90[4] + 7) = v87;
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v57 = v90[0];
  v58 = v90[1];
  v59 = v90[2];
  *(_OWORD *)(a2 + 57) = v90[3];
  *(_OWORD *)(a2 + 41) = v59;
  *(_OWORD *)(a2 + 25) = v58;
  *(_OWORD *)(a2 + 9) = v57;
  v60 = v90[4];
  v61 = v90[5];
  v62 = v90[6];
  *(_OWORD *)(a2 + 121) = v90[7];
  *(_OWORD *)(a2 + 105) = v62;
  *(_OWORD *)(a2 + 89) = v61;
  *(_OWORD *)(a2 + 73) = v60;
  v92 = v51;
  v93 = 0;
  v94 = v50;
  v95 = v52;
  v96 = v43;
  v97 = v44;
  v98 = v45;
  v99 = v46;
  v100 = v47;
  v101 = v48;
  v102 = v49;
  v103 = v53;
  v104 = v54;
  v105 = v55;
  v106 = v56;
  v107 = 0;
  sub_248ABDC88((uint64_t)v84);
  return sub_248ABDCC0((uint64_t)&v92);
}

double sub_248ABB18C@<D0>(uint64_t *a1@<X8>)
{
  int *v2;
  char *v3;
  char v4;
  char *v5;
  char *v6;
  double *v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double *v17;
  double result;
  double v19;
  uint64_t v20;
  CGRect v21;

  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  swift_storeEnumTagMultiPayload();
  v2 = (int *)type metadata accessor for SelectTextView();
  v3 = (char *)a1 + v2[5];
  type metadata accessor for TrainingManager();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  *(_QWORD *)v3 = sub_248AF4FDC();
  v3[8] = v4 & 1;
  v5 = (char *)a1 + v2[6];
  sub_248AF57E0();
  *v5 = LOBYTE(v19);
  *((_QWORD *)v5 + 1) = v20;
  v6 = (char *)a1 + v2[7];
  sub_248AF57E0();
  *v6 = LOBYTE(v19);
  *((_QWORD *)v6 + 1) = v20;
  v7 = (double *)((char *)a1 + v2[8]);
  v8 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v8, sel_bounds);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  CGRectGetWidth(v21);
  sub_248AF57E0();
  *v7 = v19;
  *((_QWORD *)v7 + 1) = v20;
  v17 = (double *)((char *)a1 + v2[9]);
  sub_248AF57E0();
  result = v19;
  *v17 = v19;
  *((_QWORD *)v17 + 1) = v20;
  return result;
}

uint64_t sub_248ABB368(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  __int128 aBlock;
  uint64_t (*v25)(uint64_t);
  void *v26;
  uint64_t (*v27)();
  uint64_t v28;
  uint64_t v29;

  v2 = v1;
  v4 = sub_248AF599C();
  v23 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_248AF59C0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void *)sub_248AF5A38();
  objc_msgSend(a1, sel_setText_, v11);

  aBlock = *(_OWORD *)v2;
  LOBYTE(v25) = *(_BYTE *)(v2 + 16);
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577B1480);
  MEMORY[0x2495A4E68](&v29, v12);
  if (v29 == 1)
    objc_msgSend(a1, sel_setSelectedTextRange_, 0);
  sub_248AB8A24(0, (unint64_t *)&qword_2577B11D8);
  v13 = (void *)sub_248AF5C0C();
  v14 = swift_allocObject();
  v15 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v14 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v14 + 96) = v15;
  v16 = *(_QWORD *)(v2 + 96);
  v17 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v14 + 32) = v17;
  v18 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v14 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v14 + 64) = v18;
  *(_QWORD *)(v14 + 112) = v16;
  *(_QWORD *)(v14 + 120) = a1;
  v27 = sub_248ABEAA4;
  v28 = v14;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v25 = sub_248ADFE80;
  v26 = &block_descriptor_42;
  v19 = _Block_copy(&aBlock);
  sub_248ABD5C4(v2);
  v20 = a1;
  swift_release();
  sub_248AF59A8();
  *(_QWORD *)&aBlock = MEMORY[0x24BEE4AF8];
  sub_248AB80A8((unint64_t *)&unk_2577B14A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11E0);
  sub_248AB8BE8(&qword_2577B14B0, &qword_2577B11E0, MEMORY[0x24BEE12C8]);
  sub_248AF5C84();
  MEMORY[0x2495A524C](0, v10, v6, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_248ABB60C(int a1, id a2)
{
  CGRect v4;

  objc_msgSend(a2, sel_bounds);
  objc_msgSend(a2, sel_sizeThatFits_, CGRectGetWidth(v4), INFINITY);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14E8);
  return sub_248AF5840();
}

id sub_248ABB690()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  objc_class *v7;
  _BYTE *v8;
  _QWORD *v9;
  char *v10;
  objc_super v12[2];
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(void **)(v0 + 80);
  v17 = *(_OWORD *)(v0 + 88);
  v12[1] = *(objc_super *)(v0 + 24);
  v13 = *(_BYTE *)(v0 + 40);
  swift_retain();
  v3 = v2;
  sub_248ABEA10((uint64_t)&v17);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577B1480);
  sub_248AF584C();
  v4 = v14;
  v5 = v15;
  v6 = v16;
  v7 = (objc_class *)type metadata accessor for UITextViewRepresentable.Coordinator();
  v8 = objc_allocWithZone(v7);
  v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isWordSelected] = 0;
  v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isFirstStepComplete] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectionLength] = 0;
  v9 = &v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectedRange];
  *v9 = 0;
  v9[1] = 0;
  *(_OWORD *)&v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_text] = v17;
  v10 = &v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator__disableInteraction];
  *(_QWORD *)v10 = v4;
  *((_QWORD *)v10 + 1) = v5;
  v10[16] = v6;
  *(_QWORD *)&v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_textView] = v3;
  *(_QWORD *)&v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_trainingManager] = v1;
  v12[0].receiver = v8;
  v12[0].super_class = v7;
  return -[objc_super init](v12, sel_init);
}

void sub_248ABB7A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF5A2C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1 + 16;
  swift_beginAccess();
  v10 = (_BYTE *)MEMORY[0x2495A58A0](v9);
  if (v10)
  {
    v11 = v10[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isWordSelected];

    if ((v11 & 1) == 0)
    {
      swift_beginAccess();
      v12 = MEMORY[0x2495A58A0](v9);
      if (v12)
      {
        v13 = (void *)v12;
        swift_retain();

        sub_248AF5A20();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
        sub_248AD6194((uint64_t)v8, 1, (uint64_t)v4);
        swift_release();
        sub_248AB89E8((uint64_t)v4, &qword_2577B14B8);
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      }
      swift_beginAccess();
      v14 = MEMORY[0x2495A58A0](v9);
      if (v14)
      {
        v15 = (void *)v14;
        v16 = *(_QWORD *)(v14 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_trainingManager);
        swift_retain();

        v17 = *(_QWORD *)(v16 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
        v18 = __OFADD__(v17, 1);
        v19 = v17 + 1;
        if (v18)
        {
          __break(1u);
        }
        else
        {
          *(_QWORD *)(v16 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v19;
          swift_release();
        }
      }
    }
  }
}

id sub_248ABBA78(void *a1)
{
  uint64_t v1;
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
  uint64_t v13;
  id result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  NSRange v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  char *v33;
  void (*v34)(_QWORD, _QWORD);
  uint64_t v35;
  uint64_t v36;
  id v37;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  void (*v50)(_QWORD, _QWORD);
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t aBlock;
  uint64_t v59;
  uint64_t (*v60)(uint64_t);
  void *v61;
  void *v62;
  uint64_t v63;
  NSRange v64;

  v2 = v1;
  v4 = sub_248AF599C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v57 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_248AF59C0();
  v56 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v54 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_248AF59D8();
  v9 = *(_QWORD *)(v55 - 8);
  v10 = MEMORY[0x24BDAC7A8](v55);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v53 = (char *)&v48 - v13;
  result = objc_msgSend(a1, sel_selectedRange);
  v16 = v15;
  v17 = OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isFirstStepComplete;
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isFirstStepComplete) == 1)
  {
    v52 = v5;
    v50 = (void (*)(_QWORD, _QWORD))v4;
    v18 = *(_QWORD *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_trainingManager)
        + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
    *(_BYTE *)(v18 + 93) = 5;
    v19 = OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectionLength;
    v20 = *(_QWORD *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectionLength);
    v21 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
LABEL_13:
      __break(1u);
      return result;
    }
    v51 = v7;
    v64.location = (NSUInteger)objc_msgSend(a1, sel_selectedRange);
    v22 = (_QWORD *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectedRange);
    v23 = NSIntersectionRange(v64, *(NSRange *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectedRange));
    result = (id)v23.location;
    if (v21 < v16 && (uint64_t)v23.length >= 1)
    {
      v24 = *(_QWORD *)(v18 + 64);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (!v25)
      {
        *(_QWORD *)(v18 + 64) = v26;
        sub_248AB8A24(0, (unint64_t *)&qword_2577B11D8);
        v27 = (void *)sub_248AF5C0C();
        sub_248AF59CC();
        v28 = v53;
        MEMORY[0x2495A5018](v12, 1.0);
        v49 = *(void (**)(char *, uint64_t))(v9 + 8);
        v29 = v55;
        v49(v12, v55);
        v30 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v62 = sub_248ABDDBC;
        v63 = v30;
        aBlock = MEMORY[0x24BDAC760];
        v59 = 1107296256;
        v60 = sub_248ADFE80;
        v61 = &block_descriptor_23;
        v31 = _Block_copy(&aBlock);
        swift_release();
        v32 = v54;
        sub_248AF59A8();
        aBlock = MEMORY[0x24BEE4AF8];
        sub_248AB80A8((unint64_t *)&unk_2577B14A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11E0);
        sub_248AB8BE8(&qword_2577B14B0, &qword_2577B11E0, MEMORY[0x24BEE12C8]);
        v33 = v57;
        v34 = v50;
        sub_248AF5C84();
        MEMORY[0x2495A5228](v28, v32, v33, v31);
        _Block_release(v31);

        (*(void (**)(char *, _QWORD))(v52 + 8))(v33, v34);
        (*(void (**)(char *, uint64_t))(v56 + 8))(v32, v51);
        return (id)((uint64_t (*)(char *, uint64_t))v49)(v28, v29);
      }
      goto LABEL_13;
    }
    *(_QWORD *)(v2 + v19) = v16;
    result = objc_msgSend(a1, sel_selectedRange);
    *v22 = result;
    v22[1] = v47;
  }
  else if (v15 >= 1)
  {
    v52 = v5;
    v35 = *(_QWORD *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_trainingManager);
    v51 = v7;
    v36 = v35 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
    *(_QWORD *)(v36 + 48) = 0;
    *(_QWORD *)(v36 + 56) = 0;
    swift_bridgeObjectRelease();
    sub_248AD76B0();
    *(_QWORD *)(v36 + 48) = 0;
    *(_QWORD *)(v36 + 56) = 0;
    swift_bridgeObjectRelease();
    *(_BYTE *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isWordSelected) = 1;
    *(_BYTE *)(v2 + v17) = 1;
    *(_QWORD *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectionLength) = v16;
    v37 = objc_msgSend(a1, sel_selectedRange);
    v38 = (_QWORD *)(v2 + OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectedRange);
    *v38 = v37;
    v38[1] = v39;
    sub_248AB8A24(0, (unint64_t *)&qword_2577B11D8);
    v40 = (void *)sub_248AF5C0C();
    sub_248AF59CC();
    v41 = v53;
    MEMORY[0x2495A5018](v12, 0.25);
    v50 = *(void (**)(_QWORD, _QWORD))(v9 + 8);
    v42 = v55;
    v50(v12, v55);
    v43 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v62 = sub_248ABDD9C;
    v63 = v43;
    aBlock = MEMORY[0x24BDAC760];
    v59 = 1107296256;
    v60 = sub_248ADFE80;
    v61 = &block_descriptor_0;
    v44 = _Block_copy(&aBlock);
    swift_release();
    v45 = v54;
    sub_248AF59A8();
    aBlock = MEMORY[0x24BEE4AF8];
    sub_248AB80A8((unint64_t *)&unk_2577B14A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11E0);
    sub_248AB8BE8(&qword_2577B14B0, &qword_2577B11E0, MEMORY[0x24BEE12C8]);
    v46 = v57;
    sub_248AF5C84();
    MEMORY[0x2495A5228](v41, v45, v46, v44);
    _Block_release(v44);

    (*(void (**)(char *, uint64_t))(v52 + 8))(v46, v4);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v45, v51);
    return (id)((uint64_t (*)(char *, uint64_t))v50)(v41, v42);
  }
  return result;
}

void sub_248ABC040(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t KeyPath;
  uint64_t v7;
  _BYTE *v8;
  _QWORD *v9;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2495A58A0](v1);
  if (v2)
  {
    v3 = (void *)v2;
    swift_retain();

    sub_248AD5958(1, 1, 0);
    swift_release();
  }
  swift_beginAccess();
  v4 = MEMORY[0x2495A58A0](v1);
  if (v4)
  {
    v5 = (void *)v4;
    swift_retain();

    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
    sub_248AF4EE0();
    swift_release();
    swift_release();
  }
  swift_beginAccess();
  v7 = MEMORY[0x2495A58A0](v1);
  if (v7)
  {
    v8 = (_BYTE *)v7;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577B1480);
    sub_248AF5840();
    v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isWordSelected] = 0;
    v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_isFirstStepComplete] = 0;
    *(_QWORD *)&v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectionLength] = 0;
    v9 = &v8[OBJC_IVAR____TtCV9TipsTryIt23UITextViewRepresentable11Coordinator_firstStepSelectedRange];
    *v9 = 0;
    v9[1] = 0;

  }
}

uint64_t sub_248ABC244(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  void *v10;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF5A2C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = MEMORY[0x2495A58A0](a1 + 16);
  if (result)
  {
    v10 = (void *)result;
    swift_retain();

    sub_248AF5A20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    sub_248AD6194((uint64_t)v8, 0, (uint64_t)v4);
    swift_release();
    sub_248AB89E8((uint64_t)v4, &qword_2577B14B8);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

id sub_248ABC41C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UITextViewRepresentable.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for UITextViewRepresentable.Coordinator()
{
  return objc_opt_self();
}

uint64_t *sub_248ABC4D4(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(v4, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v4, a2, v7);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
      }
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v11 = a3[5];
    v12 = a3[6];
    v13 = (char *)v4 + v11;
    v14 = (char *)a2 + v11;
    v15 = *(_QWORD *)v14;
    LOBYTE(v14) = v14[8];
    *(_QWORD *)v13 = v15;
    v13[8] = (char)v14;
    v16 = (char *)v4 + v12;
    v17 = (char *)a2 + v12;
    *v16 = *v17;
    *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
    v18 = a3[7];
    v19 = a3[8];
    v20 = (char *)v4 + v18;
    v21 = (char *)a2 + v18;
    *v20 = *v21;
    *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
    v22 = (uint64_t *)((char *)v4 + v19);
    v23 = (uint64_t *)((char *)a2 + v19);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = a3[9];
    v26 = (uint64_t *)((char *)v4 + v25);
    v27 = (uint64_t *)((char *)a2 + v25);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_248ABC694(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_248AF5408();
    v3 = *(_QWORD *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *sub_248ABC768(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_248AF5408();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
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
  v13 = *(_QWORD *)v12;
  LOBYTE(v12) = v12[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v12;
  v14 = (char *)a1 + v10;
  v15 = (char *)a2 + v10;
  *v14 = *v15;
  *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
  v16 = a3[7];
  v17 = a3[8];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *v18 = *v19;
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  v20 = (_QWORD *)((char *)a1 + v17);
  v21 = (_QWORD *)((char *)a2 + v17);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = a3[9];
  v24 = (_QWORD *)((char *)a1 + v23);
  v25 = (_QWORD *)((char *)a2 + v23);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_248ABC900(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_248AF5408();
      v7 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = *(_QWORD *)v11;
  LOBYTE(v11) = v11[8];
  *(_QWORD *)v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *v14 = *v15;
  *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
  swift_retain();
  swift_release();
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  *v17 = *v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_retain();
  swift_release();
  v19 = a3[8];
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  *v20 = *v21;
  v20[1] = v21[1];
  swift_retain();
  swift_release();
  v22 = a3[9];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_248ABCAF4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_248AF5408();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v10 = a3[5];
  v11 = a3[6];
  v12 = &a1[v10];
  v13 = &a2[v10];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  v14 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  return a1;
}

char *sub_248ABCC34(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v10 = a3[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = *(_QWORD *)v12;
  LOBYTE(v12) = v12[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  *v15 = *v16;
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  swift_release();
  v17 = a3[7];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *v18 = *v19;
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  swift_release();
  v20 = a3[8];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
  swift_release();
  v23 = a3[9];
  v24 = &a1[v23];
  v25 = &a2[v23];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  swift_release();
  return a1;
}

uint64_t sub_248ABCDFC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248ABCE08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_248ABCE98()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248ABCEA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  return result;
}

uint64_t type metadata accessor for SelectTextView()
{
  uint64_t result;

  result = qword_2577B1368;
  if (!qword_2577B1368)
    return swift_getSingletonMetadata();
  return result;
}

void sub_248ABCF60()
{
  unint64_t v0;

  sub_248ABCFE0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_248ABCFE0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2577B1378[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1300);
    v0 = sub_248AF4FD0();
    if (!v1)
      atomic_store(v0, qword_2577B1378);
  }
}

uint64_t sub_248ABD038()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_248ABD048()
{
  return sub_248ABDDE8();
}

uint64_t sub_248ABD094(void *a1)
{
  return sub_248ABB368(a1);
}

id sub_248ABD0E4@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_248ABB690();
  *a1 = result;
  return result;
}

uint64_t sub_248ABD10C()
{
  return sub_248AF536C();
}

uint64_t sub_248ABD14C()
{
  sub_248ABE9CC();
  return sub_248AF53CC();
}

uint64_t sub_248ABD19C()
{
  sub_248ABE9CC();
  return sub_248AF5378();
}

void sub_248ABD1EC()
{
  sub_248ABE9CC();
  sub_248AF53C0();
  __break(1u);
}

uint64_t sub_248ABD210@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 52);
  return result;
}

uint64_t sub_248ABD29C()
{
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EE0();
  return swift_release();
}

uint64_t sub_248ABD344(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ABD38C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SelectTextView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ABD3D0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(type metadata accessor for SelectTextView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_248AF5408();
    v5 = *(_QWORD *)(v4 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v0 + v2, 1, v4))
      (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v2, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_248ABD540(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SelectTextView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ABD584()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(type metadata accessor for SelectTextView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_248ABA4E4(v0 + v2, v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
}

uint64_t sub_248ABD5C4(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 80);
  swift_retain();
  swift_retain();
  swift_retain();
  v3 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_248ABD664()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SelectTextView() - 8) + 80);
  v2 = (v1 + 120) & ~v1;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_248AF5408();
    v4 = *(_QWORD *)(v3 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_248ABD7C4(uint64_t a1, _BYTE *a2)
{
  type metadata accessor for SelectTextView();
  sub_248ABA8BC(a1, a2);
}

uint64_t sub_248ABD814()
{
  return sub_248ABD838(&qword_2577B1420, &qword_2577B1428, sub_248ABD8A0, MEMORY[0x24BDECC60]);
}

uint64_t sub_248ABD838(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_248ABD8A0()
{
  return sub_248ABD838(&qword_2577B1430, &qword_2577B1438, sub_248ABD8C4, MEMORY[0x24BDEDB80]);
}

uint64_t sub_248ABD8C4()
{
  return sub_248ABD838(&qword_2577B1440, &qword_2577B1448, sub_248ABD8E8, MEMORY[0x24BDEDBB8]);
}

uint64_t sub_248ABD8E8()
{
  return sub_248ABD838(&qword_2577B1450, &qword_2577B1458, (uint64_t (*)(void))sub_248ABD90C, MEMORY[0x24BDEDBB8]);
}

unint64_t sub_248ABD90C()
{
  unint64_t result;

  result = qword_2577B1460;
  if (!qword_2577B1460)
  {
    result = MEMORY[0x2495A57B0](&unk_248AF6918, &type metadata for UITextViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_2577B1460);
  }
  return result;
}

_QWORD *sub_248ABD950(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;

  v2 = (void *)a1[10];
  v3 = a1[48];
  v5 = a1[50];
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_248ABDA14(v3);
  sub_248ABDA14(v5);
  return a1;
}

uint64_t sub_248ABDA14(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_248ABDA24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SelectTextView() - 8) + 80);
  v2 = (v1 + 16) & ~v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_248AF5408();
    v4 = *(_QWORD *)(v3 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_248ABDB3C(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SelectTextView() - 8) + 80);
  sub_248ABA960(a1, a2, v2 + ((v5 + 16) & ~v5));
}

uint64_t sub_248ABDB88(uint64_t a1)
{
  sub_248ABDBC0(*(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_248ABDBC0(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_248ABDBCC(uint64_t a1)
{
  sub_248ABDBC0(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_248ABDC04(uint64_t a1)
{
  sub_248ABDC3C(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_248ABDC3C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_248ABDC48(uint64_t a1)
{
  sub_248ABDC3C(*(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_248ABDC88(uint64_t a1)
{
  sub_248ABDBC0(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_248ABDCC0(uint64_t a1)
{
  sub_248ABDC3C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_248ABDD00()
{
  uint64_t v0;

  return sub_248AD50D8(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

unint64_t sub_248ABDD1C()
{
  unint64_t result;

  result = qword_2577B1490;
  if (!qword_2577B1490)
  {
    result = MEMORY[0x2495A57B0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2577B1490);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_248ABDD78()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_248ABDD9C()
{
  uint64_t v0;

  return sub_248ABC244(v0);
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

void sub_248ABDDBC()
{
  uint64_t v0;

  sub_248ABC040(v0);
}

uint64_t sub_248ABDDCC()
{
  uint64_t v0;

  return sub_248AD4FF0(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void *sub_248ABDDE8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  uint64_t inited;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  double v26;
  void *v27;
  id v28;
  id v30;
  void *v31;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14F0);
  sub_248AF5480();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v31, sel_handleTapWithSender_);

  v3 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x24BEBE1D0]);
  v4 = objc_msgSend(v3, sel_fontDescriptorWithDesign_, *MEMORY[0x24BEBB580]);

  if (v4)
  {
    v5 = objc_msgSend(v4, sel_fontDescriptorWithSize_, 54.0);

    if (v5)
    {
      v6 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v5, 54.0);
      v30 = v2;
      v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB490]), sel_init);
      objc_msgSend(v7, sel_setLineSpacing_, -5.4);
      objc_msgSend(v7, sel_setAlignment_, 1);
      LODWORD(v8) = 1045220557;
      objc_msgSend(v7, sel_setHyphenationFactor_, v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1500);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_248AF6430;
      v10 = (void *)*MEMORY[0x24BEBB360];
      *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB360];
      v11 = sub_248AB8A24(0, &qword_2577B1508);
      *(_QWORD *)(inited + 40) = v6;
      v12 = (void *)*MEMORY[0x24BEBB3A8];
      *(_QWORD *)(inited + 64) = v11;
      *(_QWORD *)(inited + 72) = v12;
      v13 = sub_248AB8A24(0, (unint64_t *)&unk_2577B1510);
      *(_QWORD *)(inited + 80) = v7;
      v14 = (void *)*MEMORY[0x24BEBB378];
      *(_QWORD *)(inited + 104) = v13;
      *(_QWORD *)(inited + 112) = v14;
      *(_QWORD *)(inited + 144) = MEMORY[0x24BEE13C8];
      *(_QWORD *)(inited + 120) = 0xBFF0000000000000;
      v15 = v10;
      v16 = v6;
      v17 = v12;
      v18 = v7;
      v19 = v14;
      sub_248ACBFC4(inited);
      v20 = objc_allocWithZone(MEMORY[0x24BDD1688]);
      swift_bridgeObjectRetain();
      v21 = (void *)sub_248AF5A38();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      sub_248AB80A8(&qword_2577B1138, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248AF6658);
      v22 = (void *)sub_248AF59F0();
      swift_bridgeObjectRelease();
      v23 = objc_msgSend(v20, sel_initWithString_attributes_, v21, v22);

      objc_msgSend(*(id *)(v1 + 80), sel_setAttributedText_, v23);
      v2 = v30;

    }
  }
  v24 = *(void **)(v1 + 80);
  objc_msgSend(v24, sel_addGestureRecognizer_, v2);
  v25 = objc_msgSend(v24, sel_textContainer);
  objc_msgSend(v25, sel_setLineBreakMode_, 0);

  LODWORD(v26) = 1132068864;
  objc_msgSend(v24, sel_setContentCompressionResistancePriority_forAxis_, 0, v26);
  sub_248AB8A24(0, &qword_2577B14F8);
  if (qword_2577B10C8 != -1)
    swift_once();
  swift_retain();
  v27 = (void *)sub_248AF5C30();
  objc_msgSend(v24, sel_setTextColor_, v27);

  v28 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v24, sel_setBackgroundColor_, v28);

  sub_248AF5480();
  objc_msgSend(v24, sel_setDelegate_, v31);

  objc_msgSend(v24, sel_setScrollEnabled_, 0);
  objc_msgSend(v24, sel_setEditable_, 0);

  return v24;
}

uint64_t sub_248ABE2A0()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v0 = sub_248AF599C();
  v20 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_248AF59C0();
  v18 = *(_QWORD *)(v3 - 8);
  v19 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_248AF59D8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v17 - v11;
  sub_248AB8A24(0, (unint64_t *)&qword_2577B11D8);
  v13 = (void *)sub_248AF5C0C();
  sub_248AF59CC();
  MEMORY[0x2495A5018](v10, 0.25);
  v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v10, v6);
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_248ABE544;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_248ADFE80;
  aBlock[3] = &block_descriptor_31;
  v15 = _Block_copy(aBlock);
  swift_release();
  sub_248AF59A8();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_248AB80A8((unint64_t *)&unk_2577B14A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11E0);
  sub_248AB8BE8(&qword_2577B14B0, &qword_2577B11E0, MEMORY[0x24BEE12C8]);
  sub_248AF5C84();
  MEMORY[0x2495A5228](v12, v5, v2, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v19);
  return ((uint64_t (*)(char *, uint64_t))v17)(v12, v6);
}

void sub_248ABE544()
{
  uint64_t v0;

  sub_248ABB7A4(v0);
}

uint64_t destroy for UITextViewRepresentable(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UITextViewRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v8 = *(void **)(a2 + 80);
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = v8;
  *(_QWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v9 = v8;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UITextViewRepresentable(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  v4 = *(void **)(a2 + 80);
  v5 = *(void **)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v4;
  v6 = v4;

  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for UITextViewRepresentable(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_release();
  v4 = *(void **)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);

  v5 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UITextViewRepresentable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UITextViewRepresentable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UITextViewRepresentable()
{
  return &type metadata for UITextViewRepresentable;
}

unint64_t sub_248ABE920()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B14C0;
  if (!qword_2577B14C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B13D8);
    v2[0] = sub_248AB8BE8(&qword_2577B14C8, &qword_2577B13B8, MEMORY[0x24BDF4750]);
    v2[1] = sub_248AB8BE8(&qword_2577B14D0, &qword_2577B14D8, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B14C0);
  }
  return result;
}

uint64_t sub_248ABE9C0()
{
  return MEMORY[0x24BDF5560];
}

unint64_t sub_248ABE9CC()
{
  unint64_t result;

  result = qword_2577B14E0;
  if (!qword_2577B14E0)
  {
    result = MEMORY[0x2495A57B0](&unk_248AF6888, &type metadata for UITextViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_2577B14E0);
  }
  return result;
}

uint64_t sub_248ABEA10(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_248ABEA38()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_248ABEAA4()
{
  uint64_t v0;

  return sub_248ABB60C((int)v0 + 16, *(id *)(v0 + 120));
}

uint64_t sub_248ABEACC()
{
  return sub_248ABDD00();
}

uint64_t *sub_248ABEAE0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_248AF5A2C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_248ABEB74(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_248AF5A2C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_248ABEBBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_248AF5A2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_248ABEC24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_248AF5A2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_248ABECA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_248AF5A2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_248ABECFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_248AF5A2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_248ABED68()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248ABED74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_248AF5A2C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_248ABEDF4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248ABEE00(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_248AF5A2C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for LocationItemView()
{
  uint64_t result;

  result = qword_2577B1638;
  if (!qword_2577B1638)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_248ABEEB8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_248AF5A2C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_248ABEF28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248ABEF38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  _OWORD *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
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
  char *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[424];
  uint64_t v56;
  uint64_t v57;
  char v58;
  _BYTE v59[288];
  _QWORD v60[36];
  _BYTE v61[296];
  _BYTE v62[432];

  v2 = v1;
  v53 = a1;
  v51 = sub_248AF5150();
  MEMORY[0x24BDAC7A8](v51);
  v52 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1670);
  MEMORY[0x24BDAC7A8](v50);
  v43 = (uint64_t)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF52F4();
  v48 = *(_QWORD *)(v5 - 8);
  v49 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_248AF57B0();
  v44 = *(_QWORD *)(v8 - 8);
  v45 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1678);
  v11 = MEMORY[0x24BDAC7A8](v47);
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v42 - v14;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1680);
  MEMORY[0x24BDAC7A8](v46);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_248AF5324();
  sub_248ABF420(v2, v60);
  v61[288] = 1;
  memcpy(&v61[7], v60, 0x119uLL);
  v56 = v18;
  v57 = 0;
  v58 = 1;
  memcpy(v59, v61, sizeof(v59));
  sub_248AF58F4();
  sub_248AC0C60(0.0, 0, 0.0, 1, 353.0, 0, 0.0, 1, (uint64_t)v55, 0.0, 1, 110.0, 0);
  sub_248ABFB40((uint64_t)v60);
  memcpy(v62, v55, 0x1A8uLL);
  type metadata accessor for LocationItemView();
  v19 = qword_2577B10D0;
  swift_bridgeObjectRetain();
  if (v19 != -1)
    swift_once();
  v20 = (id)qword_2577B2DE8;
  sub_248AF57D4();
  v22 = v44;
  v21 = v45;
  (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v10, *MEMORY[0x24BDF3FD0], v45);
  v23 = sub_248AF57C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v10, v21);
  v54 = v23;
  sub_248AF52E8();
  sub_248AF5708();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v7, v49);
  swift_release();
  sub_248AF50F0();
  sub_248AB89E8((uint64_t)v13, &qword_2577B1678);
  v24 = sub_248AF58F4();
  v26 = v25;
  v27 = v43;
  sub_248AB8870((uint64_t)v15, v43, &qword_2577B1678);
  v28 = (uint64_t *)(v27 + *(int *)(v50 + 36));
  *v28 = v24;
  v28[1] = v26;
  sub_248AB8870(v27, (uint64_t)&v17[*(int *)(v46 + 36)], &qword_2577B1670);
  memcpy(v17, v62, 0x1A8uLL);
  sub_248ABF9C0((uint64_t)v62);
  sub_248AB89E8(v27, &qword_2577B1670);
  sub_248AB89E8((uint64_t)v15, &qword_2577B1678);
  sub_248ABFA20((uint64_t)v62);
  v29 = v52;
  v30 = &v52[*(int *)(v51 + 20)];
  v31 = *MEMORY[0x24BDEEB68];
  v32 = sub_248AF52DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 104))(v30, v31, v32);
  __asm { FMOV            V0.2D, #16.0 }
  *v29 = _Q0;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1688);
  v39 = v53;
  v40 = v53 + *(int *)(v38 + 36);
  sub_248ABFA70((uint64_t)v29, v40);
  *(_WORD *)(v40 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1690) + 36)) = 256;
  sub_248AB8870((uint64_t)v17, v39, &qword_2577B1680);
  sub_248ABFAB4((uint64_t)v29);
  return sub_248AB89E8((uint64_t)v17, &qword_2577B1680);
}

uint64_t sub_248ABF420@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
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
  uint64_t v53;
  uint64_t v54;
  char v55;
  _QWORD *v56;
  __int128 v58;
  _QWORD *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  char v69;
  _BYTE v70[7];
  char v71;
  _BYTE v72[7];
  _BYTE v73[7];
  _OWORD v74[17];
  char v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  char v88;
  _BYTE v89[7];
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  _BYTE v95[7];
  char v96;
  _BYTE v97[7];
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;

  *(_QWORD *)&v58 = a1;
  v59 = a2;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1698);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_248AF4E2C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_248AF5A2C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 16))(v13, v58, v10);
  if (qword_2577B10B0 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v6, (uint64_t)qword_2577B5078);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v15, v6);
  sub_248AF4EC8();
  sub_248AF4E44();
  v16 = sub_248AF5618();
  v18 = v17;
  v20 = v19 & 1;
  v21 = sub_248AF557C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v4, 1, 1, v21);
  sub_248AF55A0();
  sub_248AB89E8((uint64_t)v4, &qword_2577B1698);
  sub_248AF5588();
  sub_248AF55AC();
  swift_release();
  v22 = sub_248AF560C();
  v24 = v23;
  v26 = v25;
  swift_release();
  v27 = v26 & 1;
  sub_248ABF9B0(v16, v18, v20);
  swift_bridgeObjectRelease();
  sub_248AF5768();
  v28 = sub_248AF5600();
  v30 = v29;
  v32 = v31;
  v34 = v33;
  swift_release();
  sub_248ABF9B0(v22, v24, v27);
  swift_bridgeObjectRelease();
  v35 = sub_248AF58D0();
  sub_248AC0E10(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v76, 0.0, 1, 40.0, 0, v35, v36, v28, v30, v32 & 1, v34);
  sub_248ABF9B0(v28, v30, v32 & 1);
  swift_bridgeObjectRelease();
  v66 = v82;
  v67 = v83;
  v68 = v84;
  v62 = v78;
  v63 = v79;
  v64 = v80;
  v65 = v81;
  v60 = v76;
  v61 = v77;
  sub_248AF5750();
  v37 = sub_248AF5774();
  swift_release();
  v38 = sub_248AF5528();
  sub_248AF4F88();
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v69 = 0;
  LOBYTE(v28) = sub_248AF5510();
  sub_248AF4F88();
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  *(_DWORD *)v89 = *(_DWORD *)v70;
  v55 = v69;
  v71 = 0;
  *(_DWORD *)v95 = *(_DWORD *)v73;
  *(_DWORD *)&v89[3] = *(_DWORD *)&v70[3];
  *(_DWORD *)&v95[3] = *(_DWORD *)&v73[3];
  *(_DWORD *)&v97[3] = *(_DWORD *)&v72[3];
  *(_DWORD *)v97 = *(_DWORD *)v72;
  v74[2] = v62;
  v74[3] = v63;
  v74[0] = v60;
  v74[1] = v61;
  v74[7] = v67;
  v74[8] = v68;
  v74[5] = v65;
  v74[6] = v66;
  v74[4] = v64;
  v58 = xmmword_248AF6970;
  *(_OWORD *)((char *)&v74[9] + 8) = xmmword_248AF6970;
  *(_QWORD *)&v74[9] = v37;
  *((_QWORD *)&v74[10] + 1) = 0x4000000000000000;
  LOBYTE(v74[11]) = v38;
  *(_DWORD *)((char *)&v74[11] + 1) = *(_DWORD *)v70;
  DWORD1(v74[11]) = *(_DWORD *)&v70[3];
  *((_QWORD *)&v74[11] + 1) = v40;
  *(_QWORD *)&v74[12] = v42;
  *((_QWORD *)&v74[12] + 1) = v44;
  *(_QWORD *)&v74[13] = v46;
  BYTE8(v74[13]) = v69;
  *(_DWORD *)((char *)&v74[13] + 9) = *(_DWORD *)v73;
  HIDWORD(v74[13]) = *(_DWORD *)&v73[3];
  LOBYTE(v74[14]) = v28;
  DWORD1(v74[14]) = *(_DWORD *)&v72[3];
  *(_DWORD *)((char *)&v74[14] + 1) = *(_DWORD *)v72;
  *((_QWORD *)&v74[14] + 1) = v47;
  *(_QWORD *)&v74[15] = v49;
  *((_QWORD *)&v74[15] + 1) = v51;
  *(_QWORD *)&v74[16] = v53;
  BYTE8(v74[16]) = 0;
  v56 = v59;
  memcpy(v59, v74, 0x109uLL);
  v75 = 1;
  v56[34] = 0;
  *((_BYTE *)v56 + 280) = 1;
  v82 = v66;
  v83 = v67;
  v84 = v68;
  v78 = v62;
  v79 = v63;
  v80 = v64;
  v81 = v65;
  v76 = v60;
  v77 = v61;
  v86 = v58;
  v85 = v37;
  v87 = 0x4000000000000000;
  v88 = v38;
  v90 = v40;
  v91 = v42;
  v92 = v44;
  v93 = v46;
  v94 = v55;
  v96 = v28;
  v98 = v48;
  v99 = v50;
  v100 = v52;
  v101 = v54;
  v102 = 0;
  sub_248ABFAF0((uint64_t)v74);
  return sub_248ABFB40((uint64_t)&v76);
}

uint64_t sub_248ABF9B0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_248ABF9C0(uint64_t a1)
{
  sub_248ABFA10(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_248ABFA10(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_248ABFA20(uint64_t a1)
{
  sub_248ABF9B0(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_248ABFA70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_248AF5150();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ABFAB4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_248AF5150();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248ABFAF0(uint64_t a1)
{
  sub_248ABFA10(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_248ABFB40(uint64_t a1)
{
  sub_248ABF9B0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_248ABFB94()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B16A0;
  if (!qword_2577B16A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1688);
    v2[0] = sub_248ABFC18();
    v2[1] = sub_248AB8BE8(qword_2577B16D8, &qword_2577B1690, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B16A0);
  }
  return result;
}

unint64_t sub_248ABFC18()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B16A8;
  if (!qword_2577B16A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1680);
    v2[0] = sub_248ABFC9C();
    v2[1] = sub_248AB8BE8(&qword_2577B16D0, &qword_2577B1670, MEMORY[0x24BDEF370]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B16A8);
  }
  return result;
}

unint64_t sub_248ABFC9C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B16B0;
  if (!qword_2577B16B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B16B8);
    v2[0] = sub_248AB8BE8(&qword_2577B16C0, &qword_2577B16C8, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B16B0);
  }
  return result;
}

uint64_t *sub_248ABFD20(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(v4, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v4, a2, v7);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
      }
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v11 = a3[5];
    v12 = a3[6];
    v13 = (char *)v4 + v11;
    v14 = (char *)a2 + v11;
    v15 = *(_QWORD *)v14;
    LOBYTE(v14) = v14[8];
    *(_QWORD *)v13 = v15;
    v13[8] = (char)v14;
    v16 = (uint64_t *)((char *)v4 + v12);
    v17 = (uint64_t *)((char *)a2 + v12);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = a3[7];
    v20 = a3[8];
    v21 = (uint64_t *)((char *)v4 + v19);
    v22 = (uint64_t *)((char *)a2 + v19);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = (char *)v4 + v20;
    v25 = (char *)a2 + v20;
    *v24 = *v25;
    *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
    v26 = a3[9];
    v27 = a3[10];
    v28 = (uint64_t *)((char *)v4 + v26);
    v29 = (uint64_t *)((char *)a2 + v26);
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
    v31 = (uint64_t *)((char *)v4 + v27);
    v32 = (uint64_t *)((char *)a2 + v27);
    v33 = v32[1];
    *v31 = *v32;
    v31[1] = v33;
    v34 = a3[11];
    v35 = a3[12];
    v36 = (char *)v4 + v34;
    v37 = (char *)a2 + v34;
    *v36 = *v37;
    *((_QWORD *)v36 + 1) = *((_QWORD *)v37 + 1);
    v38 = (uint64_t *)((char *)v4 + v35);
    v39 = (uint64_t *)((char *)a2 + v35);
    v40 = v39[1];
    *v38 = *v39;
    v38[1] = v40;
    v41 = a3[14];
    *(uint64_t *)((char *)v4 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    *(uint64_t *)((char *)v4 + v41) = *(uint64_t *)((char *)a2 + v41);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_248ABFF50(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_248AF5408();
    v3 = *(_QWORD *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *sub_248AC0054(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_248AF5408();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
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
  v13 = *(_QWORD *)v12;
  LOBYTE(v12) = v12[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v12;
  v14 = (_QWORD *)((char *)a1 + v10);
  v15 = (_QWORD *)((char *)a2 + v10);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = a3[7];
  v18 = a3[8];
  v19 = (_QWORD *)((char *)a1 + v17);
  v20 = (_QWORD *)((char *)a2 + v17);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = (char *)a1 + v18;
  v23 = (char *)a2 + v18;
  *v22 = *v23;
  *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
  v24 = a3[9];
  v25 = a3[10];
  v26 = (_QWORD *)((char *)a1 + v24);
  v27 = (_QWORD *)((char *)a2 + v24);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  v29 = (_QWORD *)((char *)a1 + v25);
  v30 = (_QWORD *)((char *)a2 + v25);
  v31 = v30[1];
  *v29 = *v30;
  v29[1] = v31;
  v32 = a3[11];
  v33 = a3[12];
  v34 = (char *)a1 + v32;
  v35 = (char *)a2 + v32;
  *v34 = *v35;
  *((_QWORD *)v34 + 1) = *((_QWORD *)v35 + 1);
  v36 = (_QWORD *)((char *)a1 + v33);
  v37 = (_QWORD *)((char *)a2 + v33);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  v39 = a3[14];
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  *(_QWORD *)((char *)a1 + v39) = *(_QWORD *)((char *)a2 + v39);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_248AC025C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_248AF5408();
      v7 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = *(_QWORD *)v11;
  LOBYTE(v11) = v11[8];
  *(_QWORD *)v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  v13 = a3[6];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_retain();
  swift_release();
  v16 = a3[7];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_retain();
  swift_release();
  v19 = a3[8];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  *v20 = *v21;
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  swift_retain();
  swift_release();
  v22 = a3[9];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  swift_retain();
  swift_release();
  v25 = a3[10];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_retain();
  swift_release();
  v28 = a3[11];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  *v29 = *v30;
  *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
  swift_retain();
  swift_release();
  v31 = a3[12];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  *(_QWORD *)((char *)a1 + a3[14]) = *(_QWORD *)((char *)a2 + a3[14]);
  return a1;
}

char *sub_248AC04EC(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_248AF5408();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v10 = a3[5];
  v11 = a3[6];
  v12 = &a1[v10];
  v13 = &a2[v10];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  v14 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  v15 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  *(_OWORD *)&a1[v15] = *(_OWORD *)&a2[v15];
  v16 = a3[12];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  *(_OWORD *)&a1[v16] = *(_OWORD *)&a2[v16];
  v17 = a3[14];
  *(_QWORD *)&a1[a3[13]] = *(_QWORD *)&a2[a3[13]];
  *(_QWORD *)&a1[v17] = *(_QWORD *)&a2[v17];
  return a1;
}

char *sub_248AC065C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v10 = a3[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = *(_QWORD *)v12;
  LOBYTE(v12) = v12[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v18 = *(_QWORD *)v16;
  v17 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v15 = v18;
  *((_QWORD *)v15 + 1) = v17;
  swift_release();
  v19 = a3[7];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v23 = *(_QWORD *)v21;
  v22 = *((_QWORD *)v21 + 1);
  *(_QWORD *)v20 = v23;
  *((_QWORD *)v20 + 1) = v22;
  swift_release();
  v24 = a3[8];
  v25 = &a1[v24];
  v26 = &a2[v24];
  *v25 = *v26;
  *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
  swift_release();
  v27 = a3[9];
  v28 = &a1[v27];
  v29 = &a2[v27];
  *(_QWORD *)v28 = *(_QWORD *)v29;
  *((_QWORD *)v28 + 1) = *((_QWORD *)v29 + 1);
  swift_release();
  v30 = a3[10];
  v31 = &a1[v30];
  v32 = &a2[v30];
  *(_QWORD *)v31 = *(_QWORD *)v32;
  *((_QWORD *)v31 + 1) = *((_QWORD *)v32 + 1);
  swift_release();
  v33 = a3[11];
  v34 = &a1[v33];
  v35 = &a2[v33];
  *v34 = *v35;
  *((_QWORD *)v34 + 1) = *((_QWORD *)v35 + 1);
  swift_release();
  v36 = a3[12];
  v37 = &a1[v36];
  v38 = &a2[v36];
  *(_QWORD *)v37 = *(_QWORD *)v38;
  *((_QWORD *)v37 + 1) = *((_QWORD *)v38 + 1);
  swift_release();
  v39 = a3[14];
  *(_QWORD *)&a1[a3[13]] = *(_QWORD *)&a2[a3[13]];
  *(_QWORD *)&a1[v39] = *(_QWORD *)&a2[v39];
  return a1;
}

uint64_t sub_248AC0894()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AC08A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_248AC0930()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AC093C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  return result;
}

uint64_t type metadata accessor for TapView()
{
  uint64_t result;

  result = qword_2577B1738;
  if (!qword_2577B1738)
    return swift_getSingletonMetadata();
  return result;
}

void sub_248AC09F8()
{
  unint64_t v0;

  sub_248ABCFE0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_248AC0A90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248AC0AA0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248AF5BD0();
    v23 = (void *)sub_248AF54F8();
    sub_248AF4F7C();

  }
  sub_248AF5174();
  v24 = *(_OWORD *)(v13 + 80);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  *(_OWORD *)(a9 + 80) = v24;
  *(_QWORD *)(a9 + 96) = *(_QWORD *)(v13 + 96);
  v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  v26 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v26;
  *(_OWORD *)(a9 + 104) = v28;
  *(_OWORD *)(a9 + 120) = v29;
  *(_OWORD *)(a9 + 136) = v30;
  *(_OWORD *)(a9 + 200) = v34;
  *(_OWORD *)(a9 + 184) = v33;
  *(_OWORD *)(a9 + 168) = v32;
  *(_OWORD *)(a9 + 152) = v31;
  return sub_248ABD5C4(v13);
}

uint64_t sub_248AC0C60@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  const void *v13;
  const void *v14;
  uint64_t v15;
  void *v24;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v14 = v13;
  v15 = a9;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248AF5BD0();
    v24 = (void *)sub_248AF54F8();
    sub_248AF4F7C();

    v15 = a9;
  }
  sub_248AF5174();
  memcpy((void *)v15, v14, 0x131uLL);
  *(_OWORD *)(v15 + 376) = v31;
  *(_OWORD *)(v15 + 392) = v32;
  *(_OWORD *)(v15 + 408) = v33;
  *(_OWORD *)(v15 + 312) = v27;
  *(_OWORD *)(v15 + 328) = v28;
  *(_OWORD *)(v15 + 344) = v29;
  *(_OWORD *)(v15 + 360) = v30;
  return sub_248ABF9C0((uint64_t)v14);
}

uint64_t sub_248AC0E10@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v20 = a19;
  v21 = a18;
  v22 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248AF5BD0();
    v31 = (void *)sub_248AF54F8();
    sub_248AF4F7C();

    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  sub_248AF5174();
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  *(_BYTE *)(a9 + 16) = v21 & 1;
  *(_QWORD *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_248ABFA10(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_248AC0FF0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, char a18, char a19)
{
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248AF5BD0();
    v28 = (void *)sub_248AF54F8();
    sub_248AF4F7C();

  }
  sub_248AF5174();
  *(_QWORD *)a9 = a16;
  *(_BYTE *)(a9 + 8) = a17 & 1;
  *(_BYTE *)(a9 + 9) = a18 & 1;
  *(_BYTE *)(a9 + 10) = a19 & 1;
  *(_OWORD *)(a9 + 80) = v34;
  *(_OWORD *)(a9 + 96) = v35;
  *(_OWORD *)(a9 + 112) = v36;
  *(_OWORD *)(a9 + 16) = v30;
  *(_OWORD *)(a9 + 32) = v31;
  *(_OWORD *)(a9 + 48) = v32;
  *(_OWORD *)(a9 + 64) = v33;
  return swift_retain();
}

uint64_t sub_248AC11B0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  __int128 *v13;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  char v39;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248AF5BD0();
    v23 = (void *)sub_248AF54F8();
    sub_248AF4F7C();

  }
  sub_248AF5174();
  v35 = *v13;
  v36 = v13[1];
  v38 = *(_QWORD *)v13;
  v39 = *((_BYTE *)v13 + 8);
  v37 = v36;
  v24 = *((_QWORD *)v13 + 4);
  v25 = *((_QWORD *)v13 + 6);
  *a9 = v35;
  a9[1] = v36;
  v26 = v13[3];
  a9[2] = v13[2];
  a9[3] = v26;
  a9[4] = v28;
  a9[5] = v29;
  a9[9] = v33;
  a9[10] = v34;
  a9[6] = v30;
  a9[7] = v31;
  a9[8] = v32;
  sub_248AC7F98((uint64_t)&v38);
  sub_248ABEA10((uint64_t)&v37);
  sub_248AC8658(v24);
  return sub_248AC8658(v25);
}

uint64_t sub_248AC138C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  __int128 *v13;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  char v36;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248AF5BD0();
    v23 = (void *)sub_248AF54F8();
    sub_248AF4F7C();

  }
  sub_248AF5174();
  v32 = *v13;
  v34 = v13[1];
  v33 = v34;
  *(_OWORD *)a9 = v32;
  *(_OWORD *)(a9 + 16) = v33;
  *(_OWORD *)(a9 + 40) = v25;
  *(_OWORD *)(a9 + 56) = v26;
  *(_OWORD *)(a9 + 72) = v27;
  *(_OWORD *)(a9 + 136) = v31;
  *(_OWORD *)(a9 + 120) = v30;
  v35 = *(_QWORD *)v13;
  v36 = *((_BYTE *)v13 + 8);
  *(_QWORD *)(a9 + 32) = *((_QWORD *)v13 + 4);
  *(_OWORD *)(a9 + 104) = v29;
  *(_OWORD *)(a9 + 88) = v28;
  sub_248AC7F98((uint64_t)&v35);
  return sub_248ABEA10((uint64_t)&v34);
}

uint64_t sub_248AC1554@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19)
{
  char v20;
  uint64_t v21;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v20 = a17;
  v21 = a16;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248AF5BD0();
    v30 = (void *)sub_248AF54F8();
    sub_248AF4F7C();

    v20 = a17;
    v21 = a16;
  }
  sub_248AF5174();
  *(_QWORD *)a9 = v21;
  *(_BYTE *)(a9 + 8) = v20 & 1;
  *(_QWORD *)(a9 + 16) = a18;
  *(_QWORD *)(a9 + 24) = a19;
  *(_OWORD *)(a9 + 96) = v36;
  *(_OWORD *)(a9 + 112) = v37;
  *(_OWORD *)(a9 + 128) = v38;
  *(_OWORD *)(a9 + 32) = v32;
  *(_OWORD *)(a9 + 48) = v33;
  *(_OWORD *)(a9 + 64) = v34;
  *(_OWORD *)(a9 + 80) = v35;
  swift_retain();
  return swift_retain();
}

__n128 sub_248AC1728@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  _OWORD *v24;
  __n128 result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248AF5BD0();
    v23 = (void *)sub_248AF54F8();
    sub_248AF4F7C();

  }
  sub_248AF5174();
  sub_248AB8870(v13, a9, &qword_2577B1AB0);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1AB8) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *v24 = v26;
  v24[1] = v27;
  result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

double sub_248AC18E4@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_248AC193C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_2577B1AA0, &qword_2577B1AA8).n128_u64[0];
  return result;
}

__n128 sub_248AC193C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t *v19;
  void *v28;
  uint64_t v29;
  _OWORD *v30;
  __n128 result;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __n128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v19 = a16;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248AF5BD0();
    v28 = (void *)sub_248AF54F8();
    sub_248AF4F7C();

    v19 = a16;
  }
  sub_248AF5174();
  v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(a9, v17, v29);
  v30 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *v30 = v32;
  v30[1] = v33;
  result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

uint64_t sub_248AC1B18@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19)
{
  char v20;
  uint64_t v21;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v20 = a17;
  v21 = a16;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248AF5BD0();
    v30 = (void *)sub_248AF54F8();
    sub_248AF4F7C();

    v20 = a17;
    v21 = a16;
  }
  sub_248AF5174();
  *(_QWORD *)a9 = v21;
  *(_BYTE *)(a9 + 8) = v20 & 1;
  *(_QWORD *)(a9 + 16) = a18;
  *(_QWORD *)(a9 + 24) = a19;
  *(_OWORD *)(a9 + 96) = v36;
  *(_OWORD *)(a9 + 112) = v37;
  *(_OWORD *)(a9 + 128) = v38;
  *(_OWORD *)(a9 + 32) = v32;
  *(_OWORD *)(a9 + 48) = v33;
  *(_OWORD *)(a9 + 64) = v34;
  *(_OWORD *)(a9 + 80) = v35;
  sub_248ABDBC0(v21, v20 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_248AC1CEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t result;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TapView();
  v8 = *(_BYTE *)(v1 + *(int *)(v7 + 20) + 8);
  v9 = swift_retain();
  v10 = sub_248ADB034(v9, v8);
  swift_release();
  swift_getKeyPath();
  v24 = v10;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  v11 = *(_BYTE *)(v10 + 48);
  result = swift_release();
  if ((v11 & 1) == 0)
  {
    v13 = (uint64_t *)(v2 + *(int *)(v7 + 24));
    v15 = *v13;
    v14 = v13[1];
    v24 = *v13;
    v25 = v14;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17C0);
    result = sub_248AF57EC();
    if (__OFADD__(v26, 1))
    {
      __break(1u);
    }
    else
    {
      v24 = v15;
      v25 = v14;
      v23 = v26 + 1;
      sub_248AF57F8();
      swift_release();
      v16 = swift_retain();
      v17 = sub_248ADB034(v16, v8);
      result = swift_release();
      v18 = *(_QWORD *)(v17 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
      v19 = __OFADD__(v18, 1);
      v20 = v18 + 1;
      if (!v19)
      {
        *(_QWORD *)(v17 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v20;
        swift_release();
        v21 = swift_retain();
        sub_248ADB034(v21, v8);
        swift_release();
        v22 = sub_248AF5A2C();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v6, 1, 1, v22);
        sub_248AD6194(a1, 1, (uint64_t)v6);
        swift_release();
        return sub_248AB89E8((uint64_t)v6, &qword_2577B14B8);
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_248AC1F18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v5;
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char *v27;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;

  v34 = a3;
  v5 = (int *)type metadata accessor for TapView();
  MEMORY[0x24BDAC7A8](v5);
  v30 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1798);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17A0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17A8);
  v32 = *(_QWORD *)(v14 - 8);
  v33 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v31 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = a2;
  v36 = a1;
  sub_248AF5504();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17B0);
  sub_248AB8BE8(&qword_2577B17B8, &qword_2577B17B0, MEMORY[0x24BDF4700]);
  sub_248AF4F94();
  v16 = (uint64_t *)(a2 + v5[12]);
  v17 = *v16;
  v18 = v16[1];
  *(_QWORD *)&v37 = v17;
  *((_QWORD *)&v37 + 1) = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
  sub_248AF57EC();
  v19 = v38;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v10, v7);
  v20 = &v13[*(int *)(v11 + 36)];
  *(_QWORD *)v20 = 0;
  *((_QWORD *)v20 + 1) = v19;
  v21 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22 = (uint64_t)v30;
  v21(v10, v7);
  v37 = *(_OWORD *)(a2 + v5[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17C0);
  sub_248AF57EC();
  v23 = v38;
  sub_248AC7574(a2, v22, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  if (v23 >= 4)
  {
    v24 = v22 + v5[8];
    v25 = *(_BYTE *)v24;
    v26 = *(_QWORD *)(v24 + 8);
    LOBYTE(v37) = v25;
    *((_QWORD *)&v37 + 1) = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
    sub_248AF57EC();
  }
  sub_248AC75B8(v22, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  sub_248AC6CB4();
  v27 = v31;
  sub_248AF56B4();
  sub_248AB89E8((uint64_t)v13, &qword_2577B17A0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v32 + 32))(v34, v27, v33);
}

uint64_t sub_248AC21F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  *(_QWORD *)a3 = sub_248AF5324();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17D8);
  return sub_248AC224C(a1, a2, a3 + *(int *)(v6 + 44));
}

uint64_t sub_248AC224C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>);
  uint64_t (*v44)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>);
  uint64_t (**v45)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  char v67;
  uint64_t *v68;
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
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  int *v103;
  uint64_t v104;
  __int128 v105;
  uint64_t v106;

  v101 = a2;
  v93 = a3;
  v88 = type metadata accessor for TouchAccommodationButtonView();
  v4 = MEMORY[0x24BDAC7A8](v88);
  v87 = (uint64_t *)((char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v85 = (uint64_t)&v85 - v6;
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17E0);
  v89 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90);
  v86 = (uint64_t)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17E8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v92 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v91 = (char *)&v85 - v11;
  v12 = sub_248AF5114();
  v95 = *(_QWORD *)(v12 - 8);
  v13 = *(_QWORD *)(v95 + 64);
  v98 = v12;
  v99 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v97 = (char *)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = (int *)type metadata accessor for TapView();
  v15 = *((_QWORD *)v103 - 1);
  v16 = *(_QWORD *)(v15 + 64);
  v17 = MEMORY[0x24BDAC7A8](v103);
  v100 = (char *)&v85 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v85 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17F0);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (uint64_t *)((char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17F8);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v85 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1800);
  v26 = MEMORY[0x24BDAC7A8](v96);
  v102 = (uint64_t)&v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v85 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v104 = (uint64_t)&v85 - v31;
  *v22 = sub_248AF58F4();
  v22[1] = v32;
  v33 = (char *)v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1808) + 44);
  v94 = a1;
  sub_248AC2990(a1, v33);
  sub_248AB8870((uint64_t)v22, (uint64_t)v25, &qword_2577B17F0);
  v34 = &v25[*(int *)(v23 + 52)];
  *(_QWORD *)v34 = 0x7267206F746F6870;
  *((_QWORD *)v34 + 1) = 0xEA00000000006469;
  sub_248AB89E8((uint64_t)v22, &qword_2577B17F0);
  sub_248AC7574(a1, (uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v35 = v95;
  v37 = v97;
  v36 = v98;
  (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v97, v101, v98);
  v38 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v39 = v35;
  v40 = (v16 + *(unsigned __int8 *)(v35 + 80) + v38) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
  v41 = swift_allocObject();
  sub_248AC72F4((uint64_t)v19, v41 + v38, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  (*(void (**)(unint64_t, char *, uint64_t))(v39 + 32))(v41 + v40, v37, v36);
  v42 = sub_248AF58F4();
  v44 = v43;
  sub_248AB8870((uint64_t)v25, (uint64_t)v30, &qword_2577B17F8);
  v45 = (uint64_t (**)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>))&v30[*(int *)(v96 + 36)];
  *v45 = sub_248AC6D3C;
  v45[1] = (uint64_t (*)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>))v41;
  v45[2] = (uint64_t (*)@<X0>(uint64_t *@<X0>, uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>)@<X8>))v42;
  v45[3] = v44;
  v46 = (uint64_t)v100;
  v47 = (uint64_t)v25;
  v48 = v94;
  sub_248AB89E8(v47, &qword_2577B17F8);
  sub_248AB882C((uint64_t)v30, v104, &qword_2577B1800);
  v105 = *(_OWORD *)(v48 + v103[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17C0);
  sub_248AF57EC();
  v49 = v106;
  sub_248AC7574(v48, v46, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  if (v49 < 4)
  {
    sub_248AC75B8(v46, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    v61 = 1;
    v57 = (uint64_t)v92;
    v56 = v93;
    v58 = (uint64_t)v91;
    v59 = v90;
    v60 = v89;
  }
  else
  {
    v50 = v88;
    v51 = v87;
    v52 = v46 + v103[8];
    v53 = *(_BYTE *)v52;
    v54 = *(_QWORD *)(v52 + 8);
    LOBYTE(v105) = v53;
    *((_QWORD *)&v105 + 1) = v54;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
    sub_248AF57EC();
    v55 = v106;
    sub_248AC75B8(v46, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    v57 = (uint64_t)v92;
    v56 = v93;
    v58 = (uint64_t)v91;
    v59 = v90;
    v60 = v89;
    if ((v55 & 1) != 0)
    {
      v61 = 1;
    }
    else
    {
      *v51 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
      swift_storeEnumTagMultiPayload();
      v62 = (char *)v51 + *(int *)(v50 + 20);
      type metadata accessor for TrainingManager();
      sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
      *(_QWORD *)v62 = sub_248AF4FDC();
      v62[8] = v63 & 1;
      v64 = v85;
      sub_248AC72F4((uint64_t)v51, v85, (uint64_t (*)(_QWORD))type metadata accessor for TouchAccommodationButtonView);
      v65 = sub_248AF5534();
      v66 = v48;
      v67 = v65;
      v68 = (uint64_t *)(v66 + v103[12]);
      v69 = *v68;
      v70 = v68[1];
      *(_QWORD *)&v105 = v69;
      *((_QWORD *)&v105 + 1) = v70;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
      sub_248AF57EC();
      sub_248AF4F88();
      v72 = v71;
      v74 = v73;
      v76 = v75;
      v78 = v77;
      v79 = v86;
      sub_248AC7574(v64, v86, (uint64_t (*)(_QWORD))type metadata accessor for TouchAccommodationButtonView);
      v80 = v79 + *(int *)(v59 + 36);
      *(_BYTE *)v80 = v67;
      *(_QWORD *)(v80 + 8) = v72;
      *(_QWORD *)(v80 + 16) = v74;
      *(_QWORD *)(v80 + 24) = v76;
      *(_QWORD *)(v80 + 32) = v78;
      *(_BYTE *)(v80 + 40) = 0;
      sub_248AC75B8(v64, (uint64_t (*)(_QWORD))type metadata accessor for TouchAccommodationButtonView);
      sub_248AB882C(v79, v58, &qword_2577B17E0);
      v61 = 0;
    }
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v60 + 56))(v58, v61, 1, v59);
  v81 = v104;
  v82 = v102;
  sub_248AB8870(v104, v102, &qword_2577B1800);
  sub_248AB8870(v58, v57, &qword_2577B17E8);
  sub_248AB8870(v82, v56, &qword_2577B1800);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1810);
  sub_248AB8870(v57, v56 + *(int *)(v83 + 48), &qword_2577B17E8);
  sub_248AB89E8(v58, &qword_2577B17E8);
  sub_248AB89E8(v81, &qword_2577B1800);
  sub_248AB89E8(v57, &qword_2577B17E8);
  return sub_248AB89E8(v82, &qword_2577B1800);
}

uint64_t sub_248AC2990@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  uint64_t v18;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  _OWORD *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  void (*v54)(unint64_t, char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __n128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t (*v82)@<X0>(uint64_t *@<X8>);
  uint64_t (*v83)@<X0>(uint64_t *@<X8>);
  uint64_t v84;
  uint64_t (**v85)@<X0>(uint64_t *@<X8>);
  uint64_t v86;
  uint64_t v87;
  uint64_t (**v88)(double *);
  uint64_t v89;
  void (*v90)(char *, char *, uint64_t);
  char *v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  void (*v96)(char *, uint64_t);
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  _OWORD *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  char *v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _OWORD v140[8];
  _OWORD v141[9];

  v133 = a2;
  v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1938);
  MEMORY[0x24BDAC7A8](v132);
  v131 = (uint64_t)&v98 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = sub_248AF53FC();
  MEMORY[0x24BDAC7A8](v122);
  v121 = (char *)&v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF5894();
  v113 = *(_QWORD *)(v5 - 8);
  v114 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v112 = (_OWORD *)((char *)&v98 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_248AF58A0();
  v8 = *(_QWORD *)(v7 - 8);
  v115 = v7;
  v116 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v111 = (char *)&v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1940);
  v124 = *(_QWORD *)(v126 - 8);
  MEMORY[0x24BDAC7A8](v126);
  v118 = (char *)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1948);
  MEMORY[0x24BDAC7A8](v11);
  v119 = (uint64_t)&v98 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1950);
  MEMORY[0x24BDAC7A8](v123);
  v120 = (uint64_t)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1958);
  MEMORY[0x24BDAC7A8](v127);
  v125 = (uint64_t)&v98 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1960);
  v15 = MEMORY[0x24BDAC7A8](v129);
  v128 = (uint64_t)&v98 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v130 = (uint64_t)&v98 - v17;
  v103 = sub_248AF512C();
  v105 = *(_QWORD *)(v103 - 8);
  MEMORY[0x24BDAC7A8](v103);
  v99 = (char *)&v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1968);
  v20 = *(_QWORD *)(v19 - 8);
  v106 = v19;
  v107 = v20;
  MEMORY[0x24BDAC7A8](v19);
  v100 = (char *)&v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = type metadata accessor for TapView();
  v22 = *(_QWORD *)(v117 - 8);
  v23 = *(_QWORD *)(v22 + 64);
  MEMORY[0x24BDAC7A8](v117);
  v24 = (char *)&v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1970);
  v104 = *(_QWORD *)(v101 - 8);
  MEMORY[0x24BDAC7A8](v101);
  v134 = (char *)&v98 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1978);
  v102 = *(_QWORD *)(v137 - 8);
  v26 = MEMORY[0x24BDAC7A8](v137);
  v135 = (char *)&v98 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v136 = (char *)&v98 - v28;
  v29 = sub_248AF575C();
  v30 = sub_248AF58F4();
  sub_248AC0FF0(0.0, 0, 0.0, 1, 333.0, 0, 0.0, 0, (uint64_t)v140, 0.0, 1, 333.0, 0, v30, v31, v29, 0, 1, 0);
  swift_release();
  v98 = a1;
  sub_248AC7574(a1, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v32 = *(unsigned __int8 *)(v22 + 80);
  v33 = (v32 + 16) & ~v32;
  v108 = v32 | 7;
  v109 = v33 + v23;
  v34 = swift_allocObject();
  v110 = v33;
  sub_248AC72F4((uint64_t)v24, v34 + v33, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1980);
  v36 = sub_248ABD838(&qword_2577B1988, &qword_2577B1980, (uint64_t (*)(void))sub_248AC7FD4, MEMORY[0x24BDEDBB8]);
  sub_248AF569C();
  swift_release();
  v141[4] = v140[4];
  v141[5] = v140[5];
  v141[6] = v140[6];
  v141[7] = v140[7];
  v141[0] = v140[0];
  v141[1] = v140[1];
  v141[2] = v140[2];
  v141[3] = v140[3];
  sub_248AC8070((uint64_t)v141);
  v37 = v99;
  sub_248AF5120();
  sub_248AC7574(a1, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v38 = swift_allocObject() + v33;
  v39 = (uint64_t)v24;
  sub_248AC72F4((uint64_t)v24, v38, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  sub_248AB80A8(&qword_2577B19C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDED7B8], MEMORY[0x24BDED7B0]);
  v40 = v100;
  v41 = v103;
  sub_248AF5870();
  swift_release();
  (*(void (**)(char *, uint64_t))(v105 + 8))(v37, v41);
  sub_248AF4FE8();
  *(_QWORD *)&v140[0] = v35;
  *((_QWORD *)&v140[0] + 1) = v36;
  swift_getOpaqueTypeConformance2();
  sub_248AB8BE8(&qword_2577B19C8, &qword_2577B1968, MEMORY[0x24BDEC410]);
  v42 = v135;
  v43 = v40;
  v44 = v101;
  v45 = v106;
  v46 = v134;
  sub_248AF56F0();
  (*(void (**)(char *, uint64_t))(v107 + 8))(v43, v45);
  (*(void (**)(char *, uint64_t))(v104 + 8))(v46, v44);
  v47 = v102;
  (*(void (**)(char *, char *, uint64_t))(v102 + 32))(v136, v42, v137);
  v48 = v112;
  *v112 = xmmword_248AF6A10;
  (*(void (**)(_OWORD *, _QWORD, uint64_t))(v113 + 104))(v48, *MEMORY[0x24BDF4D40], v114);
  v49 = v111;
  sub_248AF58AC();
  v50 = v115;
  v51 = sub_248AF5B40();
  *(_QWORD *)(v51 + 16) = 3;
  v52 = v116;
  v53 = v51 + ((*(unsigned __int8 *)(v116 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v116 + 80));
  v54 = *(void (**)(unint64_t, char *, uint64_t))(v116 + 16);
  v54(v53, v49, v50);
  v55 = *(_QWORD *)(v52 + 72);
  v54(v53 + v55, v49, v50);
  (*(void (**)(unint64_t, char *, uint64_t))(v52 + 32))(v53 + 2 * v55, v49, v50);
  sub_248AF5324();
  v56 = v98;
  v138 = v98;
  LODWORD(v140[0]) = 0;
  sub_248AB80A8(&qword_2577B19D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF998], MEMORY[0x24BDEF9B8]);
  sub_248AF5DC8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B19D8);
  sub_248AC80C0();
  v57 = v118;
  sub_248AF5978();
  v58 = sub_248AF58F4();
  v59 = v119;
  v61 = sub_248AC193C(0.0, 0, 0.0, 1, 333.0, 0, 0.0, 0, v119, 0.0, 1, 333.0, 0, v58, v60, &qword_2577B1940, &qword_2577B1948);
  (*(void (**)(char *, uint64_t, __n128))(v124 + 8))(v57, v126, v61);
  LOBYTE(v53) = sub_248AF5510();
  sub_248AF4F88();
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v70 = v59;
  v71 = v59;
  v72 = v120;
  sub_248AB8870(v70, v120, &qword_2577B1948);
  v73 = v72 + *(int *)(v123 + 36);
  *(_BYTE *)v73 = v53;
  *(_QWORD *)(v73 + 8) = v63;
  *(_QWORD *)(v73 + 16) = v65;
  *(_QWORD *)(v73 + 24) = v67;
  *(_QWORD *)(v73 + 32) = v69;
  *(_BYTE *)(v73 + 40) = 0;
  sub_248AB89E8(v71, &qword_2577B1948);
  v74 = (uint64_t *)(v56 + *(int *)(v117 + 36));
  v75 = *v74;
  v76 = v74[1];
  *(_QWORD *)&v140[0] = v75;
  *((_QWORD *)&v140[0] + 1) = v76;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1868);
  sub_248AF57EC();
  v77 = v139;
  v78 = v125;
  sub_248AB8870(v72, v125, &qword_2577B1950);
  v79 = (_QWORD *)(v78 + *(int *)(v127 + 36));
  *v79 = v77;
  v79[1] = 0;
  sub_248AB89E8(v72, &qword_2577B1950);
  sub_248AC7574(v56, v39, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v80 = swift_allocObject();
  sub_248AC72F4(v39, v80 + v110, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v81 = sub_248AF58F4();
  v83 = v82;
  v84 = v131;
  sub_248AB8870(v78, v131, &qword_2577B1958);
  v85 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v84 + *(int *)(v132 + 36));
  *v85 = sub_248ACBF10;
  v85[1] = 0;
  v85[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v81;
  v85[3] = v83;
  v86 = swift_allocObject();
  *(_QWORD *)(v86 + 16) = sub_248AC8434;
  *(_QWORD *)(v86 + 24) = v80;
  v87 = v128;
  sub_248AB8870(v84, v128, &qword_2577B1938);
  v88 = (uint64_t (**)(double *))(v87 + *(int *)(v129 + 36));
  *v88 = sub_248AC849C;
  v88[1] = (uint64_t (*)(double *))v86;
  sub_248AB89E8(v84, &qword_2577B1938);
  sub_248AB89E8(v78, &qword_2577B1958);
  v89 = v130;
  sub_248AB882C(v87, v130, &qword_2577B1960);
  v90 = *(void (**)(char *, char *, uint64_t))(v47 + 16);
  v91 = v135;
  v92 = v136;
  v93 = v137;
  v90(v135, v136, v137);
  sub_248AB8870(v89, v87, &qword_2577B1960);
  v94 = v133;
  v90(v133, v91, v93);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1A70);
  sub_248AB8870(v87, (uint64_t)&v94[*(int *)(v95 + 48)], &qword_2577B1960);
  sub_248AB89E8(v89, &qword_2577B1960);
  v96 = *(void (**)(char *, uint64_t))(v47 + 8);
  v96(v92, v93);
  sub_248AB89E8(v87, &qword_2577B1960);
  return ((uint64_t (*)(char *, uint64_t))v96)(v91, v93);
}

uint64_t sub_248AC34BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_248AF5A2C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AF5A20();
  sub_248AC1CEC((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_248AC3554(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  __int128 v8;

  v2 = type metadata accessor for TapView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v8 = xmmword_248AF6A20;
  swift_getKeyPath();
  sub_248AC7574(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_248AC72F4((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1A78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B19F0);
  sub_248AC84F4();
  sub_248AC8124();
  return sub_248AF5864();
}

uint64_t sub_248AC3694@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v24;
  uint64_t v25;
  _OWORD *v26;
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
  uint64_t KeyPath;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v50;
  uint64_t (*v51)(void);
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  char *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t result;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  char *v104;
  uint64_t v105;
  char *v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  _OWORD v127[11];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _OWORD v138[2];
  _QWORD v139[3];
  char v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t (*v143)();
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;

  v98 = a3;
  v5 = sub_248AF512C();
  v93 = *(_QWORD *)(v5 - 8);
  v94 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v92 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1968);
  v96 = *(_QWORD *)(v7 - 8);
  v97 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v95 = (char *)&v88 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_248AF52C4();
  MEMORY[0x24BDAC7A8](v9);
  v116 = (char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v11);
  v115 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_248AF4E2C();
  v112 = *(_QWORD *)(v13 - 8);
  v113 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v114 = (char *)&v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v15);
  v107 = (char *)&v88 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v17);
  v111 = (char *)&v88 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1690);
  MEMORY[0x24BDAC7A8](v106);
  v103 = (unint64_t)&v88 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_248AF5150();
  MEMORY[0x24BDAC7A8](v101);
  v99 = (char *)&v88 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for TapView();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v22 + 64);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v88 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1A20);
  MEMORY[0x24BDAC7A8](v100);
  v26 = (_OWORD *)((char *)&v88 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1A08);
  MEMORY[0x24BDAC7A8](v105);
  v102 = (uint64_t)&v88 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1A90);
  v109 = *(_QWORD *)(v28 - 8);
  v110 = v28;
  MEMORY[0x24BDAC7A8](v28);
  v104 = (char *)&v88 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B19F8);
  v30 = MEMORY[0x24BDAC7A8](v117);
  v108 = (char *)&v88 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v88 = (char *)&v88 - v32;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1A98);
  v90 = *(_QWORD *)(v33 - 8);
  v91 = v33;
  MEMORY[0x24BDAC7A8](v33);
  v89 = (char *)&v88 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = *a1;
  strcpy((char *)v139, "TapTouchGrid");
  BYTE5(v139[1]) = 0;
  HIWORD(v139[1]) = -5120;
  *(_QWORD *)&v128 = v118;
  sub_248AF5D5C();
  sub_248AF5AB0();
  swift_bridgeObjectRelease();
  v35 = v139[0];
  v36 = v139[1];
  KeyPath = swift_getKeyPath();
  v120 = a2;
  sub_248AC7574(a2, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v38 = *(unsigned __int8 *)(v22 + 80);
  v119 = ((v38 + 16) & ~v38) + v23;
  v39 = (v38 + 16) & ~v38;
  v121 = v39;
  v122 = v38 | 7;
  v40 = swift_allocObject();
  sub_248AC72F4((uint64_t)v24, v40 + v39, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v139[2] = KeyPath;
  v140 = 0;
  v141 = v35;
  v142 = v36;
  v143 = sub_248AC85A8;
  v144 = v40;
  v145 = 0;
  v146 = 0;
  sub_248AF58F4();
  sub_248AC11B0(0.0, 0, 0.0, 1, 103.0, 0, 0.0, 0, &v128, 0.0, 1, 103.0, 0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v127[8] = v136;
  v127[9] = v137;
  v127[10] = v138[0];
  v127[4] = v132;
  v127[5] = v133;
  v127[6] = v134;
  v127[7] = v135;
  v127[0] = v128;
  v127[1] = v129;
  v127[2] = v130;
  v127[3] = v131;
  *(_QWORD *)&v138[1] = 0x3FF0000000000000;
  WORD4(v138[1]) = 256;
  v41 = v99;
  v42 = &v99[*(int *)(v101 + 20)];
  v43 = *MEMORY[0x24BDEEB68];
  v44 = sub_248AF52DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 104))(v42, v43, v44);
  __asm { FMOV            V0.2D, #10.0 }
  *v41 = _Q0;
  v50 = v103;
  v51 = MEMORY[0x24BDED998];
  sub_248AC7574((uint64_t)v41, v103, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v50 + *((int *)v106 + 9)) = 256;
  sub_248AB8870(v50, (uint64_t)v26 + *(int *)(v100 + 36), &qword_2577B1690);
  v52 = v137;
  v26[8] = v136;
  v26[9] = v52;
  v26[10] = v138[0];
  *(_OWORD *)((char *)v26 + 170) = *(_OWORD *)((char *)v138 + 10);
  v53 = v133;
  v26[4] = v132;
  v26[5] = v53;
  v54 = v135;
  v26[6] = v134;
  v26[7] = v54;
  v55 = v129;
  *v26 = v128;
  v26[1] = v55;
  v56 = v131;
  v26[2] = v130;
  v26[3] = v56;
  sub_248AC85F0((uint64_t)&v128);
  sub_248AB89E8(v50, &qword_2577B1690);
  sub_248AC75B8((uint64_t)v41, (uint64_t (*)(_QWORD))v51);
  sub_248AC8668((uint64_t)v127);
  v57 = swift_getKeyPath();
  v58 = v102;
  sub_248AB8870((uint64_t)v26, v102, &qword_2577B1A20);
  v59 = v105;
  v60 = v58 + *(int *)(v105 + 36);
  *(_QWORD *)v60 = v57;
  *(_BYTE *)(v60 + 8) = 1;
  v61 = v118;
  sub_248AB89E8((uint64_t)v26, &qword_2577B1A20);
  sub_248AC7574(v120, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v62 = (v119 + 7) & 0xFFFFFFFFFFFFFFF8;
  v101 = v62 + 8;
  v63 = swift_allocObject();
  v64 = v104;
  v106 = v24;
  sub_248AC72F4((uint64_t)v24, v63 + v121, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v103 = v62;
  *(_QWORD *)(v63 + v62) = v61;
  v65 = sub_248AC82C0();
  sub_248AF569C();
  swift_release();
  sub_248AB89E8(v58, &qword_2577B1A08);
  sub_248AF5A20();
  if (qword_2577B10B0 != -1)
    swift_once();
  v66 = v113;
  v67 = __swift_project_value_buffer(v113, (uint64_t)qword_2577B5078);
  (*(void (**)(char *, uint64_t, uint64_t))(v112 + 16))(v114, v67, v66);
  sub_248AF4EC8();
  sub_248AF4E44();
  v125 = sub_248AF5A74();
  v126 = v68;
  v123 = v59;
  v124 = v65;
  swift_getOpaqueTypeConformance2();
  sub_248ABDD1C();
  v69 = (uint64_t)v108;
  v70 = v110;
  sub_248AF56CC();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v109 + 8))(v64, v70);
  sub_248AF52B8();
  result = sub_248AF52AC();
  if (__OFADD__(v61, 1))
  {
    __break(1u);
  }
  else
  {
    v125 = v61 + 1;
    sub_248AF52A0();
    sub_248AF52AC();
    sub_248AF52D0();
    v72 = (uint64_t)v88;
    sub_248AF50E4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_248AB89E8(v69, &qword_2577B19F8);
    v73 = v92;
    sub_248AF5120();
    v74 = v120;
    v75 = (uint64_t)v106;
    sub_248AC7574(v120, (uint64_t)v106, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    v76 = swift_allocObject();
    v77 = v121;
    sub_248AC72F4(v75, v76 + v121, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    sub_248AB80A8(&qword_2577B19C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDED7B8], MEMORY[0x24BDED7B0]);
    v78 = v94;
    v79 = v95;
    sub_248AF5870();
    swift_release();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v73, v78);
    sub_248AF4FE8();
    sub_248AC8214();
    sub_248AB8BE8(&qword_2577B19C8, &qword_2577B1968, MEMORY[0x24BDEC410]);
    v80 = v89;
    v81 = v97;
    sub_248AF56F0();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v79, v81);
    sub_248AB89E8(v72, &qword_2577B19F8);
    v82 = sub_248AF581C();
    sub_248AC7574(v74, v75, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    v83 = swift_allocObject();
    sub_248AC72F4(v75, v83 + v77, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    *(_QWORD *)(v83 + v103) = v118;
    v85 = v90;
    v84 = v91;
    v86 = v98;
    (*(void (**)(uint64_t, char *, uint64_t))(v90 + 16))(v98, v80, v91);
    v87 = (uint64_t *)(v86 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B19F0) + 36));
    *v87 = v82;
    v87[1] = (uint64_t)sub_248AC8A2C;
    v87[2] = v83;
    return (*(uint64_t (**)(char *, uint64_t))(v85 + 8))(v80, v84);
  }
  return result;
}

uint64_t sub_248AC41F4(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_BYTE *)(a1 + *(int *)(type metadata accessor for TapView() + 20) + 8);
  v2 = swift_retain();
  v3 = sub_248ADB034(v2, v1);
  swift_release();
  *(_BYTE *)(v3 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 0;
  return swift_release();
}

uint64_t sub_248AC425C(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = type metadata accessor for TapView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17C0);
  sub_248AF57F8();
  v3 = *(_BYTE *)(a1 + *(int *)(v2 + 20) + 8);
  v4 = swift_retain();
  v5 = sub_248ADB034(v4, v3);
  result = swift_release();
  v7 = *(_QWORD *)(v5 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v5 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v9;
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
    sub_248AF57F8();
    v10 = swift_retain();
    v11 = sub_248ADB034(v10, v3);
    swift_release();
    *(_BYTE *)(v11 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 88) = 1;
    swift_release();
    v12 = swift_retain();
    v13 = sub_248ADB034(v12, v3);
    swift_release();
    v14 = v13 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
    *(_QWORD *)(v14 + 48) = 0;
    *(_QWORD *)(v14 + 56) = 0;
    swift_bridgeObjectRelease();
    sub_248AD76B0();
    *(_QWORD *)(v14 + 48) = 0;
    *(_QWORD *)(v14 + 56) = 0;
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_248AC43DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_248AF5A2C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AF5A20();
  sub_248AC1CEC((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_248AC4478@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;

  v8 = type metadata accessor for TapView();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v26 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v26 - v16;
  v18 = a2 + *(int *)(v15 + 32);
  v19 = *(_BYTE *)v18;
  v20 = *(_QWORD *)(v18 + 8);
  LOBYTE(v28) = v19;
  *((_QWORD *)&v28 + 1) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57EC();
  v21 = v27;
  sub_248AC7574(a2, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  if (v21 != 1)
  {
    sub_248AC75B8((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    sub_248AC7574(a2, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    goto LABEL_7;
  }
  v28 = *(_OWORD *)&v17[*(int *)(v8 + 28)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17C0);
  sub_248AF57EC();
  v22 = v27;
  sub_248AC75B8((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  sub_248AC7574(a2, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  if (v22 != a3)
  {
LABEL_7:
    sub_248AC75B8((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    sub_248AC7574(a2, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    goto LABEL_8;
  }
  v28 = *(_OWORD *)&v14[*(int *)(v8 + 28)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17C0);
  sub_248AF57EC();
  v23 = v27;
  sub_248AC75B8((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  sub_248AC7574(a2, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  if (v23 < 0)
  {
LABEL_8:
    result = sub_248AC75B8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    goto LABEL_9;
  }
  v28 = *(_OWORD *)&v11[*(int *)(v8 + 28)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17C0);
  sub_248AF57EC();
  v24 = v27;
  result = sub_248AC75B8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  if (v24 >= 9)
  {
LABEL_9:
    a1 = 0;
    goto LABEL_10;
  }
  result = swift_retain();
LABEL_10:
  *a4 = a1;
  return result;
}

uint64_t sub_248AC46D4(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unsigned int (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  double v24;
  char v25;
  void (*v26)(char *, uint64_t);
  double v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;

  v5 = sub_248AF5408();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1470);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v36 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v36 - v19;
  v36 = a1;
  sub_248ADB6C8((uint64_t)&v36 - v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v18, *MEMORY[0x24BDEFEE8], v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v18, 0, 1, v5);
  v21 = (uint64_t)&v11[*(int *)(v9 + 48)];
  sub_248AB8870((uint64_t)v20, (uint64_t)v11, &qword_2577B1300);
  sub_248AB8870((uint64_t)v18, v21, &qword_2577B1300);
  v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v22((uint64_t)v11, 1, v5) == 1)
  {
    sub_248AB89E8((uint64_t)v18, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v20, &qword_2577B1300);
    if (v22(v21, 1, v5) == 1)
    {
      sub_248AB89E8((uint64_t)v11, &qword_2577B1300);
      v23 = v36;
LABEL_8:
      v24 = *(double *)(v23 + *(int *)(type metadata accessor for TapView() + 56)) * 0.5;
      goto LABEL_10;
    }
  }
  else
  {
    sub_248AB8870((uint64_t)v11, (uint64_t)v15, &qword_2577B1300);
    if (v22(v21, 1, v5) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v8, v21, v5);
      sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
      v25 = sub_248AF5A14();
      v26 = *(void (**)(char *, uint64_t))(v6 + 8);
      v26(v8, v5);
      sub_248AB89E8((uint64_t)v18, &qword_2577B1300);
      sub_248AB89E8((uint64_t)v20, &qword_2577B1300);
      v26(v15, v5);
      sub_248AB89E8((uint64_t)v11, &qword_2577B1300);
      v23 = v36;
      if ((v25 & 1) == 0)
      {
        v24 = 373.0;
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    sub_248AB89E8((uint64_t)v18, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v20, &qword_2577B1300);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v5);
  }
  sub_248AB89E8((uint64_t)v11, &qword_2577B1470);
  v24 = 373.0;
  v23 = v36;
LABEL_10:
  v27 = v24 + a3 * -0.5;
  v28 = type metadata accessor for TapView();
  v29 = (uint64_t *)(v23 + *(int *)(v28 + 48));
  v30 = *v29;
  v31 = v29[1];
  v37 = v27;
  v38 = v30;
  v39 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
  sub_248AF57F8();
  v32 = *(_BYTE *)(v23 + *(int *)(v28 + 20) + 8);
  v33 = swift_retain();
  v34 = sub_248ADB034(v33, v32);
  swift_release();
  v38 = v30;
  v39 = v31;
  sub_248AF57EC();
  *(double *)(v34 + 64) = v37;
  return swift_release();
}

uint64_t sub_248AC4AC8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t (*v20)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  uint64_t v22;
  uint64_t v23;

  v23 = a3;
  v7 = sub_248AF5114();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for TapView();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *a1;
  if (v15)
  {
    sub_248AC7574(a2, (uint64_t)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v7);
    v16 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v17 = (v13 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
    v18 = (*(unsigned __int8 *)(v8 + 80) + v17 + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v19 = swift_allocObject();
    sub_248AC72F4((uint64_t)v14, v19 + v16, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
    *(_QWORD *)(v19 + v17) = v15;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v19 + v18, v10, v7);
    v20 = sub_248AC74E4;
  }
  else
  {
    v20 = 0;
    v19 = 0;
  }
  *a4 = v20;
  a4[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v19;
  return swift_retain();
}

uint64_t sub_248AC4C44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
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
  uint64_t v22;
  uint64_t v23;
  char *v24;
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
  uint64_t KeyPath;
  char v36;
  CGFloat v37;
  uint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  int v42;
  double *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t (*v49)(void);
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  CGFloat v57;
  double v58;
  double MidX;
  uint64_t v60;
  double v61;
  double MidY;
  uint64_t v63;
  double *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (**v74)();
  uint64_t v75;
  CGFloat v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  CGFloat *v88;
  CGFloat v89;
  CGFloat v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  CGFloat v96;
  uint64_t v97;
  uint64_t result;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  double v103;
  uint64_t v104;
  char *v105;
  double *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  char *v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  char *v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  CGRect v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  uint64_t v159;
  _OWORD v160[9];
  uint64_t v161;
  uint64_t v162;
  char v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;

  v128 = a4;
  v119 = a1;
  v120 = a3;
  v102 = a5;
  v6 = sub_248AF52C4();
  MEMORY[0x24BDAC7A8](v6);
  v144 = (char *)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v8);
  v143 = (char *)&v100 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_248AF4E2C();
  v140 = *(_QWORD *)(v10 - 8);
  v141 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v142 = (char *)&v100 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v12);
  v139 = (char *)&v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v14);
  v138 = (char *)&v100 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_248AF5B94();
  v135 = *(_QWORD *)(v16 - 8);
  v136 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v134 = (char *)&v100 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = sub_248AF5114();
  v124 = *(_QWORD *)(v126 - 8);
  MEMORY[0x24BDAC7A8](v126);
  v121 = v18;
  v123 = (char *)&v100 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for TapView();
  v117 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v118 = v20;
  v127 = (uint64_t)&v100 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1690);
  MEMORY[0x24BDAC7A8](v110);
  v109 = (uint64_t)&v100 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = sub_248AF5150();
  MEMORY[0x24BDAC7A8](v107);
  v106 = (double *)((char *)&v100 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1818);
  MEMORY[0x24BDAC7A8](v108);
  v24 = (char *)&v100 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1820);
  MEMORY[0x24BDAC7A8](v145);
  v105 = (char *)&v100 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1828);
  MEMORY[0x24BDAC7A8](v111);
  v113 = (uint64_t)&v100 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1830);
  MEMORY[0x24BDAC7A8](v112);
  v115 = (uint64_t)&v100 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1838);
  MEMORY[0x24BDAC7A8](v114);
  v122 = (uint64_t)&v100 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1840);
  MEMORY[0x24BDAC7A8](v116);
  v125 = (char *)&v100 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1848);
  MEMORY[0x24BDAC7A8](v131);
  v132 = (uint64_t)&v100 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1850);
  v31 = MEMORY[0x24BDAC7A8](v100);
  v137 = (char *)&v100 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v101 = (char *)&v100 - v33;
  strcpy((char *)v160, "TapTouchGrid");
  BYTE13(v160[0]) = 0;
  HIWORD(v160[0]) = -5120;
  v130 = *(int *)(v19 + 28);
  v150 = *(_OWORD *)(a2 + v130);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17C0);
  sub_248AF57EC();
  sub_248AF5D5C();
  sub_248AF5AB0();
  swift_bridgeObjectRelease();
  v34 = *((_QWORD *)&v160[0] + 1);
  v104 = *(_QWORD *)&v160[0];
  KeyPath = swift_getKeyPath();
  v133 = v19;
  v146 = a2 + *(int *)(v19 + 44);
  v147 = a2;
  v36 = *(_BYTE *)v146;
  v37 = *(double *)(v146 + 8);
  LOBYTE(v160[0]) = *(_BYTE *)v146;
  *((CGFloat *)v160 + 1) = v37;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57EC();
  if ((_BYTE)v150)
    v39 = INFINITY;
  else
    v39 = 103.0;
  v103 = v39;
  LOBYTE(v160[0]) = v36;
  *((CGFloat *)v160 + 1) = v37;
  sub_248AF57EC();
  if ((_BYTE)v150)
    v40 = INFINITY;
  else
    v40 = 103.0;
  v162 = KeyPath;
  v163 = 0;
  v164 = v104;
  v165 = v34;
  v166 = 0x3FF0000000000000;
  sub_248AF58F4();
  sub_248AC138C(0.0, 1, 0.0, 1, v103, 0, 0.0, 1, (uint64_t)v160, 0.0, 1, v40, 0);
  swift_bridgeObjectRelease();
  v41 = (uint64_t)v105;
  swift_release();
  v156 = v160[6];
  v157 = v160[7];
  v158 = v160[8];
  v159 = v161;
  v152 = v160[2];
  v153 = v160[3];
  v154 = v160[4];
  v155 = v160[5];
  v150 = v160[0];
  v151 = v160[1];
  LOBYTE(v149.origin.x) = v36;
  v149.origin.y = v37;
  sub_248AF57EC();
  v42 = v148;
  v43 = v106;
  v44 = (char *)v106 + *(int *)(v107 + 20);
  v45 = *MEMORY[0x24BDEEB68];
  v46 = sub_248AF52DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 104))(v44, v45, v46);
  v47 = 10.0;
  if (v42)
    v47 = 0.0;
  *v43 = v47;
  v43[1] = v47;
  v48 = v109;
  v49 = MEMORY[0x24BDED998];
  sub_248AC7574((uint64_t)v43, v109, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v48 + *(int *)(v110 + 36)) = 256;
  sub_248AB8870(v48, (uint64_t)&v24[*(int *)(v108 + 36)], &qword_2577B1690);
  v50 = v157;
  *((_OWORD *)v24 + 6) = v156;
  *((_OWORD *)v24 + 7) = v50;
  *((_OWORD *)v24 + 8) = v158;
  *((_QWORD *)v24 + 18) = v159;
  v51 = v153;
  *((_OWORD *)v24 + 2) = v152;
  *((_OWORD *)v24 + 3) = v51;
  v52 = v155;
  *((_OWORD *)v24 + 4) = v154;
  *((_OWORD *)v24 + 5) = v52;
  v53 = v151;
  *(_OWORD *)v24 = v150;
  *((_OWORD *)v24 + 1) = v53;
  sub_248ABDC88((uint64_t)&v150);
  sub_248AB89E8(v48, &qword_2577B1690);
  sub_248AC75B8((uint64_t)v43, (uint64_t (*)(_QWORD))v49);
  sub_248ABDCC0((uint64_t)&v150);
  v54 = swift_getKeyPath();
  sub_248AB8870((uint64_t)v24, v41, &qword_2577B1818);
  v55 = v41 + *(int *)(v145 + 36);
  *(_QWORD *)v55 = v54;
  *(_BYTE *)(v55 + 8) = 1;
  sub_248AB89E8((uint64_t)v24, &qword_2577B1818);
  v56 = *(_BYTE *)v146;
  v57 = *(double *)(v146 + 8);
  LOBYTE(v149.origin.x) = *(_BYTE *)v146;
  v149.origin.y = v57;
  v145 = v38;
  sub_248AF57EC();
  if (v148 == 1)
  {
    sub_248AF5060();
    MidX = v58 * 0.5;
  }
  else
  {
    type metadata accessor for CGRect(0);
    sub_248AF5084();
    MidX = CGRectGetMidX(v149);
  }
  LOBYTE(v149.origin.x) = v56;
  v149.origin.y = v57;
  sub_248AF57EC();
  v60 = v147;
  if (v148 == 1)
  {
    sub_248AF5060();
    MidY = v61 * 0.5;
  }
  else
  {
    type metadata accessor for CGRect(0);
    sub_248AF5084();
    MidY = CGRectGetMidY(v149);
  }
  v63 = v113;
  sub_248AB8870(v41, v113, &qword_2577B1820);
  v64 = (double *)(v63 + *(int *)(v111 + 36));
  *v64 = MidX;
  v64[1] = MidY;
  sub_248AB89E8(v41, &qword_2577B1820);
  v65 = v127;
  sub_248AC7574(v60, v127, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v66 = v123;
  v67 = v124;
  v68 = v126;
  (*(void (**)(char *, uint64_t, uint64_t))(v124 + 16))(v123, v128, v126);
  v69 = *(unsigned __int8 *)(v117 + 80);
  v70 = (v69 + 16) & ~v69;
  v128 = v70 + v118;
  v120 = v69 | 7;
  v71 = (v70 + v118 + *(unsigned __int8 *)(v67 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80);
  v72 = swift_allocObject();
  sub_248AC72F4(v65, v72 + v70, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  (*(void (**)(unint64_t, char *, uint64_t))(v67 + 32))(v72 + v71, v66, v68);
  v73 = v115;
  sub_248AB8870(v63, v115, &qword_2577B1828);
  v74 = (uint64_t (**)())(v73 + *(int *)(v112 + 36));
  *v74 = sub_248AC7790;
  v74[1] = (uint64_t (*)())v72;
  v74[2] = 0;
  v74[3] = 0;
  sub_248AB89E8(v63, &qword_2577B1828);
  v75 = sub_248AF5954();
  v76 = *(double *)(v146 + 8);
  LOBYTE(v149.origin.x) = *(_BYTE *)v146;
  v149.origin.y = v76;
  sub_248AF57EC();
  LOBYTE(v68) = v148;
  v77 = v122;
  sub_248AB8870(v73, v122, &qword_2577B1830);
  v78 = v77 + *(int *)(v114 + 36);
  *(_QWORD *)v78 = v75;
  *(_BYTE *)(v78 + 8) = v68;
  sub_248AB89E8(v73, &qword_2577B1830);
  sub_248AC7574(v147, v65, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v79 = swift_allocObject();
  sub_248AC72F4(v65, v79 + v70, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v80 = v134;
  sub_248AF5B7C();
  v81 = (uint64_t)v125;
  v82 = &v125[*(int *)(v116 + 36)];
  v83 = sub_248AF50A8();
  v85 = v135;
  v84 = v136;
  (*(void (**)(char *, char *, uint64_t))(v135 + 16))(&v82[*(int *)(v83 + 20)], v80, v136);
  *(_QWORD *)v82 = &unk_2577B1860;
  *((_QWORD *)v82 + 1) = v79;
  sub_248AB8870(v77, v81, &qword_2577B1838);
  (*(void (**)(char *, uint64_t))(v85 + 8))(v80, v84);
  v86 = v77;
  v87 = v147;
  sub_248AB89E8(v86, &qword_2577B1838);
  v88 = (CGFloat *)(v87 + *(int *)(v133 + 40));
  v89 = *v88;
  v90 = v88[1];
  v149.origin.x = v89;
  v149.origin.y = v90;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1868);
  sub_248AF57EC();
  v91 = v148;
  v92 = v132;
  sub_248AB8870(v81, v132, &qword_2577B1840);
  v93 = (_QWORD *)(v92 + *(int *)(v131 + 36));
  *v93 = v91;
  v93[1] = 0;
  sub_248AB89E8(v81, &qword_2577B1840);
  sub_248AF5A20();
  if (qword_2577B10B0 != -1)
    swift_once();
  v94 = v141;
  v95 = __swift_project_value_buffer(v141, (uint64_t)qword_2577B5078);
  (*(void (**)(char *, uint64_t, uint64_t))(v140 + 16))(v142, v95, v94);
  sub_248AF4EC8();
  sub_248AF4E44();
  *(_QWORD *)&v149.origin.x = sub_248AF5A74();
  v149.origin.y = v96;
  sub_248ABD838(&qword_2577B1870, &qword_2577B1848, (uint64_t (*)(void))sub_248AC78A0, MEMORY[0x24BDEC438]);
  sub_248ABDD1C();
  v97 = (uint64_t)v137;
  sub_248AF56CC();
  swift_bridgeObjectRelease();
  sub_248AB89E8(v92, &qword_2577B1848);
  sub_248AF52B8();
  sub_248AF52AC();
  v149.origin = *(CGPoint *)(v87 + v130);
  result = sub_248AF57EC();
  if (__OFADD__(v148, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)&v149.origin.x = v148 + 1;
    sub_248AF52A0();
    sub_248AF52AC();
    sub_248AF52D0();
    v99 = (uint64_t)v101;
    sub_248AF50E4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_248AB89E8(v97, &qword_2577B1850);
    return sub_248AB882C(v99, v102, &qword_2577B1850);
  }
  return result;
}

uint64_t sub_248AC5A0C()
{
  type metadata accessor for TapView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57F8();
  return sub_248AF5108();
}

uint64_t sub_248AC5ABC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  v1[3] = a1;
  v2 = sub_248AF5CD8();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  v1[8] = sub_248AF5B70();
  v1[9] = sub_248AF5B64();
  v3 = (_QWORD *)swift_task_alloc();
  v1[10] = v3;
  *v3 = v1;
  v3[1] = sub_248AC5B5C;
  return sub_248AC6238();
}

uint64_t sub_248AC5B5C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_task_dealloc();
  *(_QWORD *)(v1 + 88) = sub_248AF5B58();
  *(_QWORD *)(v1 + 96) = v2;
  return swift_task_switch();
}

uint64_t sub_248AC5BD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  v1 = sub_248AF5DBC();
  v3 = v2;
  sub_248AF5CCC();
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2577B1918 + dword_2577B1918);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v4;
  *v4 = v0;
  v4[1] = sub_248AC5C64;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_248AC5C64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void (*v6)(uint64_t, uint64_t);
  _QWORD *v8;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  v5 = *(_QWORD **)v1;
  v5[14] = v0;
  swift_task_dealloc();
  v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5[15] = v6;
  v6(v2, v3);
  if (v0)
    return swift_task_switch();
  v8 = (_QWORD *)swift_task_alloc();
  v5[16] = v8;
  *v8 = v5;
  v8[1] = sub_248AC5D20;
  return sub_248AC66E4();
}

uint64_t sub_248AC5D20()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_248AC5D6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  v1 = sub_248AF5DBC();
  v3 = v2;
  sub_248AF5CCC();
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2577B1918 + dword_2577B1918);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v4;
  *v4 = v0;
  v4[1] = sub_248AC5E00;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_248AC5E00()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 120);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  return swift_task_switch();
}

uint64_t sub_248AC5E88()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(void **)(v0 + 112);
  swift_release();
  if (qword_2577B10D8 != -1)
    swift_once();
  v2 = (id)qword_2577B3500;
  v3 = sub_248AF5BC4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v7 = v5;
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v0 + 16) = sub_248AF3998(0xD000000000000064, 0x8000000248AF85E0, &v7);
    sub_248AF5C54();
    _os_log_impl(&dword_248AB5000, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A581C](v5, -1, -1);
    MEMORY[0x2495A581C](v4, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AC601C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  swift_release();
  v2 = *(_BYTE *)(v1 + *(int *)(type metadata accessor for TapView() + 20) + 8);
  v3 = swift_retain();
  sub_248ADB034(v3, v2);
  swift_release();
  sub_248AD6728();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AC60A4()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(void **)(v0 + 144);
  swift_release();
  if (qword_2577B10D8 != -1)
    swift_once();
  v2 = (id)qword_2577B3500;
  v3 = sub_248AF5BC4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v7 = v5;
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v0 + 16) = sub_248AF3998(0xD000000000000064, 0x8000000248AF85E0, &v7);
    sub_248AF5C54();
    _os_log_impl(&dword_248AB5000, v2, v3, "%s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A581C](v5, -1, -1);
    MEMORY[0x2495A581C](v4, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AC6238()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_248AF4ED4();
  v1[7] = swift_task_alloc();
  v2 = sub_248AF4E2C();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  sub_248AF5A2C();
  v1[11] = swift_task_alloc();
  sub_248AF4E38();
  v1[12] = swift_task_alloc();
  sub_248AF5B70();
  v1[13] = sub_248AF5B64();
  sub_248AF5B58();
  return swift_task_switch();
}

uint64_t sub_248AC632C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v1 = *(_QWORD *)(v0 + 48);
  swift_release();
  v2 = *(_BYTE *)(v1 + *(int *)(type metadata accessor for TapView() + 20) + 8);
  v3 = swift_retain();
  v4 = sub_248ADB034(v3, v2);
  swift_release();
  swift_getKeyPath();
  v5 = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v4;
  *(_BYTE *)(v5 + 24) = 1;
  *(_QWORD *)(v0 + 16) = v4;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EE0();
  swift_release();
  swift_release();
  swift_task_dealloc();
  v6 = swift_retain();
  v7 = sub_248ADB034(v6, v2);
  swift_release();
  swift_getKeyPath();
  v8 = swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v7;
  *(_BYTE *)(v8 + 24) = 0;
  *(_QWORD *)(v0 + 24) = v7;
  sub_248AF4EE0();
  swift_release();
  swift_release();
  swift_task_dealloc();
  v9 = swift_retain();
  v10 = sub_248ADB034(v9, v2);
  swift_release();
  swift_getKeyPath();
  v11 = swift_task_alloc();
  *(_QWORD *)(v11 + 16) = v10;
  *(_BYTE *)(v11 + 24) = 1;
  *(_QWORD *)(v0 + 32) = v10;
  sub_248AF4EE0();
  swift_release();
  swift_release();
  swift_task_dealloc();
  v12 = swift_retain();
  v13 = sub_248ADB034(v12, v2);
  swift_release();
  sub_248AF5A20();
  if (qword_2577B10B0 != -1)
    swift_once();
  v14 = *(_QWORD *)(v0 + 72);
  v15 = *(_QWORD *)(v0 + 80);
  v16 = *(_QWORD *)(v0 + 64);
  v17 = __swift_project_value_buffer(v16, (uint64_t)qword_2577B5078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v15, v17, v16);
  sub_248AF4EC8();
  sub_248AF4E44();
  v18 = sub_248AF5A74();
  v20 = v19;
  swift_getKeyPath();
  v21 = (_QWORD *)swift_task_alloc();
  v21[2] = v13;
  v21[3] = v18;
  v21[4] = v20;
  *(_QWORD *)(v0 + 40) = v13;
  sub_248AF4EE0();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AC66E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  sub_248AF5B70();
  *(_QWORD *)(v1 + 48) = sub_248AF5B64();
  sub_248AF5B58();
  return swift_task_switch();
}

uint64_t sub_248AC6750()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release();
  v2 = type metadata accessor for TapView();
  v3 = *(_QWORD *)(v1 + *(int *)(v2 + 52));
  v4 = (uint64_t *)(v1 + *(int *)(v2 + 36));
  v5 = *v4;
  v6 = v4[1];
  *(_QWORD *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v6;
  *(_QWORD *)(v0 + 32) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1868);
  sub_248AF57F8();
  sub_248AF5954();
  *(_QWORD *)(swift_task_alloc() + 16) = v1;
  sub_248AF50B4();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AC682C()
{
  type metadata accessor for TapView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1868);
  sub_248AF57F8();
  return sub_248AF57F8();
}

void sub_248AC68E8(uint64_t *a1@<X8>)
{
  int *v2;
  char *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _OWORD *v8;
  _OWORD *v9;
  char *v10;
  _OWORD *v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  uint64_t v23;
  id v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  __int128 v33;
  CGRect v34;
  CGRect v35;

  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  swift_storeEnumTagMultiPayload();
  v2 = (int *)type metadata accessor for TapView();
  v3 = (char *)a1 + v2[5];
  type metadata accessor for TrainingManager();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  *(_QWORD *)v3 = sub_248AF4FDC();
  v3[8] = v4 & 1;
  v5 = v2[6];
  sub_248AF57E0();
  *(_OWORD *)((char *)a1 + v5) = v33;
  v6 = v2[7];
  sub_248AF57E0();
  *(_OWORD *)((char *)a1 + v6) = v33;
  v7 = (char *)a1 + v2[8];
  sub_248AF57E0();
  *v7 = v33;
  *((_QWORD *)v7 + 1) = *((_QWORD *)&v33 + 1);
  v8 = (_OWORD *)((char *)a1 + v2[9]);
  sub_248AF57E0();
  *v8 = v33;
  v9 = (_OWORD *)((char *)a1 + v2[10]);
  sub_248AF57E0();
  *v9 = v33;
  v10 = (char *)a1 + v2[11];
  sub_248AF57E0();
  *v10 = v33;
  *((_QWORD *)v10 + 1) = *((_QWORD *)&v33 + 1);
  v11 = (_OWORD *)((char *)a1 + v2[12]);
  sub_248AF57E0();
  *v11 = v33;
  v12 = v2[13];
  v13 = (void *)objc_opt_self();
  v14 = objc_msgSend(v13, sel_mainScreen);
  objc_msgSend(v14, sel_bounds);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v34.origin.x = v16;
  v34.origin.y = v18;
  v34.size.width = v20;
  v34.size.height = v22;
  *(CGFloat *)((char *)a1 + v12) = CGRectGetWidth(v34);
  v23 = v2[14];
  v24 = objc_msgSend(v13, sel_mainScreen);
  objc_msgSend(v24, sel_bounds);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v35.origin.x = v26;
  v35.origin.y = v28;
  v35.size.width = v30;
  v35.size.height = v32;
  *(CGFloat *)((char *)a1 + v23) = CGRectGetHeight(v35);
}

uint64_t sub_248AC6BA8@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](a1);
  sub_248AC7574(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  result = sub_248AC72F4((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
  *a2 = sub_248AC6C60;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_248AC6C60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TapView() - 8) + 80);
  return sub_248AC1F18(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_248AC6CAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_248AC21F0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_248AC6CB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B17C8;
  if (!qword_2577B17C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B17A0);
    v2[0] = sub_248AB8BE8(&qword_2577B17D0, &qword_2577B1798, MEMORY[0x24BDEB238]);
    v2[1] = MEMORY[0x24BDEC438];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B17C8);
  }
  return result;
}

uint64_t sub_248AC6D3C@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(type metadata accessor for TapView() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(sub_248AF5114() - 8) + 80);
  return sub_248AC4AC8(a1, v2 + v6, v2 + ((v6 + v7 + v8) & ~v8), a2);
}

void sub_248AC6DB4(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_248AC6DBC(_QWORD *result, _QWORD *(*a2)(uint64_t *__return_ptr))
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = result;
  v3 = *result;
  if (!*result)
  {
    result = a2(&v4);
    v3 = v4;
  }
  *v2 = v3;
  return result;
}

uint64_t sub_248AC6E04@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_248AC6E94()
{
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  swift_bridgeObjectRetain();
  sub_248AF4EE0();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_248AC6F50@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 48);
  return result;
}

uint64_t sub_248AC6FDC()
{
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EE0();
  return swift_release();
}

uint64_t sub_248AC7084@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 50);
  return result;
}

uint64_t sub_248AC7110()
{
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EE0();
  return swift_release();
}

uint64_t sub_248AC71B8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 51);
  return result;
}

uint64_t sub_248AC7244()
{
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EE0();
  return swift_release();
}

uint64_t sub_248AC72F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_248AC7338()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(type metadata accessor for TapView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v8 = *(_QWORD *)(v1 + 64);
  v9 = sub_248AF5114();
  v3 = *(_QWORD *)(v9 - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_248AF5408();
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v2, 1, v5))
      (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v2, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + ((((v8 + v2 + 7) & 0xFFFFFFFFFFFFFFF8) + v4 + 8) & ~v4), v9);
  return swift_deallocObject();
}

uint64_t sub_248AC74E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(type metadata accessor for TapView() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(unsigned __int8 *)(*(_QWORD *)(sub_248AF5114() - 8) + 80);
  return sub_248AC4C44(a1, v2 + v6, *(_QWORD *)(v2 + v7), v2 + ((v7 + v8 + 8) & ~v8), a2);
}

uint64_t sub_248AC7574(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_248AC75B8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(type metadata accessor for TapView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v8 = *(_QWORD *)(v1 + 64);
  v9 = sub_248AF5114();
  v3 = *(_QWORD *)(v9 - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_248AF5408();
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v2, 1, v5))
      (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v2, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + ((v2 + v8 + v4) & ~v4), v9);
  return swift_deallocObject();
}

uint64_t sub_248AC7790()
{
  type metadata accessor for TapView();
  sub_248AF5114();
  return sub_248AC5A0C();
}

uint64_t sub_248AC77F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TapView() - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_248AC7858;
  return sub_248AC5ABC(v3);
}

uint64_t sub_248AC7858()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_248AC78A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1878;
  if (!qword_2577B1878)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1840);
    v2[0] = sub_248AC7924();
    v2[1] = sub_248AB80A8(&qword_2577B1908, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0], MEMORY[0x24BDEC4C8]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1878);
  }
  return result;
}

unint64_t sub_248AC7924()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1880;
  if (!qword_2577B1880)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1838);
    v2[0] = sub_248ABD838(&qword_2577B1888, &qword_2577B1830, (uint64_t (*)(void))sub_248AC79C8, MEMORY[0x24BDF0910]);
    v2[1] = sub_248AB8BE8(&qword_2577B18F8, &qword_2577B1900, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1880);
  }
  return result;
}

unint64_t sub_248AC79C8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1890;
  if (!qword_2577B1890)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1828);
    v2[0] = sub_248AC7A34();
    v2[1] = sub_248AC7C24();
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1890);
  }
  return result;
}

unint64_t sub_248AC7A34()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1898;
  if (!qword_2577B1898)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1820);
    v2[0] = sub_248AC7AB8();
    v2[1] = sub_248AB8BE8(&qword_2577B18E0, &qword_2577B18E8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1898);
  }
  return result;
}

unint64_t sub_248AC7AB8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B18A0;
  if (!qword_2577B18A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1818);
    v2[0] = sub_248ABD838(&qword_2577B18A8, &qword_2577B18B0, (uint64_t (*)(void))sub_248AC7B5C, MEMORY[0x24BDEDBB8]);
    v2[1] = sub_248AB8BE8(qword_2577B16D8, &qword_2577B1690, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B18A0);
  }
  return result;
}

unint64_t sub_248AC7B5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B18B8;
  if (!qword_2577B18B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B18C0);
    v2[0] = sub_248AC7BE0();
    v2[1] = sub_248AB8BE8(&qword_2577B18D0, &qword_2577B18D8, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B18B8);
  }
  return result;
}

unint64_t sub_248AC7BE0()
{
  unint64_t result;

  result = qword_2577B18C8;
  if (!qword_2577B18C8)
  {
    result = MEMORY[0x2495A57B0](&unk_248AF742C, &type metadata for ImageView);
    atomic_store(result, (unint64_t *)&qword_2577B18C8);
  }
  return result;
}

unint64_t sub_248AC7C24()
{
  unint64_t result;

  result = qword_2577B18F0;
  if (!qword_2577B18F0)
  {
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED5C0], MEMORY[0x24BDED5D0]);
    atomic_store(result, (unint64_t *)&qword_2577B18F0);
  }
  return result;
}

uint64_t sub_248AC7C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_248AF5CC0();
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

uint64_t sub_248AC7D0C()
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
  sub_248AF5CD8();
  sub_248AB80A8(&qword_2577B1928, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_248AF5D80();
  sub_248AB80A8(&qword_2577B1930, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_248AF5CE4();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_248AC7E24;
  return sub_248AF5D8C();
}

uint64_t sub_248AC7E24()
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

uint64_t sub_248AC7ED0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AC7F0C()
{
  return sub_248AC682C();
}

uint64_t sub_248AC7F2C()
{
  uint64_t v0;

  return sub_248AD4F08(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_248AC7F50()
{
  uint64_t v0;

  return sub_248AD5064(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_248AC7F7C()
{
  uint64_t *v0;

  return sub_248AD4C68(v0[2], v0[3], v0[4]);
}

uint64_t sub_248AC7F98(uint64_t a1)
{
  sub_248ABDBC0(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

uint64_t sub_248AC7FC8()
{
  return sub_248AC85B4((uint64_t (*)(uint64_t))sub_248AC34BC);
}

unint64_t sub_248AC7FD4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1990;
  if (!qword_2577B1990)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1998);
    v2[0] = sub_248AB8BE8(&qword_2577B19A0, &qword_2577B19A8, MEMORY[0x24BDEB358]);
    v2[1] = sub_248AB8BE8(&qword_2577B19B0, &qword_2577B19B8, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1990);
  }
  return result;
}

uint64_t sub_248AC8070(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_248AC809C()
{
  return sub_248AC887C();
}

uint64_t sub_248AC80B8()
{
  uint64_t v0;

  return sub_248AC3554(*(_QWORD *)(v0 + 16));
}

unint64_t sub_248AC80C0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2577B19E0;
  if (!qword_2577B19E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B19D8);
    v2 = sub_248AC8124();
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2577B19E0);
  }
  return result;
}

unint64_t sub_248AC8124()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_2577B19E8;
  if (!qword_2577B19E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B19F0);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B19F8);
    v2[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1968);
    v2[4] = sub_248AC8214();
    v2[5] = sub_248AB8BE8(&qword_2577B19C8, &qword_2577B1968, MEMORY[0x24BDEC410]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_248AB8BE8(&qword_2577B1A60, &qword_2577B1A68, MEMORY[0x24BDEFF30]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B19E8);
  }
  return result;
}

unint64_t sub_248AC8214()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2577B1A00;
  if (!qword_2577B1A00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B19F8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1A08);
    v2[3] = sub_248AC82C0();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_248AB80A8(&qword_2577B1A58, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1A00);
  }
  return result;
}

unint64_t sub_248AC82C0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1A10;
  if (!qword_2577B1A10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1A08);
    v2[0] = sub_248AC8344();
    v2[1] = sub_248AB8BE8(&qword_2577B18E0, &qword_2577B18E8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1A10);
  }
  return result;
}

unint64_t sub_248AC8344()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1A18;
  if (!qword_2577B1A18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1A20);
    v2[0] = sub_248ABD838(&qword_2577B1A28, &qword_2577B1A30, sub_248AC83E8, MEMORY[0x24BDEEC40]);
    v2[1] = sub_248AB8BE8(qword_2577B16D8, &qword_2577B1690, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1A18);
  }
  return result;
}

uint64_t sub_248AC83E8()
{
  return sub_248ABD838(&qword_2577B1A38, &qword_2577B1A40, sub_248AC840C, MEMORY[0x24BDEDBB8]);
}

uint64_t sub_248AC840C()
{
  return sub_248ABD838(&qword_2577B1A48, &qword_2577B1A50, (uint64_t (*)(void))sub_248AC7BE0, MEMORY[0x24BDF0910]);
}

uint64_t sub_248AC8434(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TapView() - 8) + 80);
  return sub_248AC46D4(v2 + ((v5 + 16) & ~v5), a1, a2);
}

uint64_t sub_248AC8478()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AC849C(double *a1)
{
  uint64_t v1;

  return sub_248ACA97C(a1, *(uint64_t (**)(double, double))(v1 + 16));
}

uint64_t sub_248AC84A8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TapView() - 8) + 80);
  return sub_248AC3694(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_248AC84F4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_2577B1A80;
  if (!qword_2577B1A80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1A78);
    v2 = sub_248AC8560();
    v3[0] = MEMORY[0x24BEE17A8];
    v3[1] = v2;
    result = MEMORY[0x2495A57B0](MEMORY[0x24BEE1BD0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2577B1A80);
  }
  return result;
}

unint64_t sub_248AC8560()
{
  unint64_t result;

  result = qword_2577B1A88;
  if (!qword_2577B1A88)
  {
    result = MEMORY[0x2495A57B0](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2577B1A88);
  }
  return result;
}

uint64_t sub_248AC85A8()
{
  return sub_248AC85B4(sub_248AC41F4);
}

uint64_t sub_248AC85B4(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TapView() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_248AC85F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  sub_248ABDBC0(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_bridgeObjectRetain();
  sub_248AC8658(v2);
  sub_248AC8658(v3);
  return a1;
}

uint64_t sub_248AC8658(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_248AC8668(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  sub_248ABDC3C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  swift_bridgeObjectRelease();
  sub_248ABDA14(v2);
  sub_248ABDA14(v3);
  return a1;
}

uint64_t sub_248AC86D4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TapView() - 8) + 80);
  return sub_248AC425C(v0 + ((v1 + 16) & ~v1));
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TapView() - 8) + 80);
  v2 = (v1 + 16) & ~v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_248AF5408();
    v4 = *(_QWORD *)(v3 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AC8860()
{
  return sub_248AC887C();
}

uint64_t sub_248AC887C()
{
  type metadata accessor for TapView();
  return sub_248AC43DC();
}

uint64_t objectdestroy_65Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TapView() - 8) + 80);
  v2 = (v1 + 16) & ~v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_248AF5408();
    v4 = *(_QWORD *)(v3 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AC8A2C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for TapView() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_248AC4478(a1, v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)), a2);
}

ValueMetadata *type metadata accessor for BoundsKey()
{
  return &type metadata for BoundsKey;
}

uint64_t sub_248AC8A9C()
{
  return sub_248AB8BE8(&qword_2577B1AC0, &qword_2577B1AC8, MEMORY[0x24BDEDA10]);
}

uint64_t sub_248AC8AC8()
{
  return sub_248ABDDCC();
}

uint64_t sub_248AC8ADC()
{
  return sub_248AC7F50();
}

uint64_t sub_248AC8AF0()
{
  return sub_248AC7F2C();
}

uint64_t sub_248AC8B04()
{
  return sub_248AC7F7C();
}

uint64_t *sub_248AC8B18(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v11 = a3[5];
    v12 = a3[6];
    v13 = (char *)a1 + v11;
    v14 = (char *)a2 + v11;
    v15 = *(_QWORD *)v14;
    LOBYTE(v14) = v14[8];
    *(_QWORD *)v13 = v15;
    v13[8] = (char)v14;
    v16 = (uint64_t *)((char *)a1 + v12);
    v17 = (uint64_t *)((char *)a2 + v12);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = a3[7];
    v20 = a3[8];
    v21 = (uint64_t *)((char *)a1 + v19);
    v22 = (uint64_t *)((char *)a2 + v19);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    *(uint64_t *)((char *)a1 + v20) = *(uint64_t *)((char *)a2 + v20);
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_248AC8CCC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_248AF5408();
    v3 = *(_QWORD *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_248AC8D9C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_248AF5408();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
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
  v13 = *(_QWORD *)v12;
  LOBYTE(v12) = v12[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v12;
  v14 = (_QWORD *)((char *)a1 + v10);
  v15 = (_QWORD *)((char *)a2 + v10);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = a3[7];
  v18 = a3[8];
  v19 = (_QWORD *)((char *)a1 + v17);
  v20 = (_QWORD *)((char *)a2 + v17);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  *(_QWORD *)((char *)a1 + v18) = *(_QWORD *)((char *)a2 + v18);
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_248AC8F24(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_248AF5408();
      v7 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = *(_QWORD *)v11;
  LOBYTE(v11) = v11[8];
  *(_QWORD *)v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
  swift_retain();
  swift_release();
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  *(_QWORD *)((char *)a1 + v16) = *(_QWORD *)((char *)a2 + v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  return a1;
}

char *sub_248AC9108(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_248AF5408();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v10 = a3[5];
  v11 = a3[6];
  v12 = &a1[v10];
  v13 = &a2[v10];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  v14 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  return a1;
}

char *sub_248AC9248(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v10 = a3[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = *(_QWORD *)v12;
  LOBYTE(v12) = v12[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];
  swift_bridgeObjectRelease();
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  swift_release();
  v17 = a3[7];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *(_QWORD *)&a1[v17] = *(_QWORD *)&a2[v17];
  swift_bridgeObjectRelease();
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  swift_release();
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  return a1;
}

uint64_t sub_248AC93F8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AC9404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_248AC9484()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AC9490(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for DragView()
{
  uint64_t result;

  result = qword_2577B1B28;
  if (!qword_2577B1B28)
    return swift_getSingletonMetadata();
  return result;
}

void sub_248AC9548()
{
  unint64_t v0;

  sub_248ABCFE0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_248AC95E0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_248AC95F0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1BB8);
  v0 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1BC0) - 8);
  v1 = *(_QWORD *)(v0 + 72);
  v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_248AF6430;
  v4 = (_QWORD *)(v3 + v2);
  *v4 = 0x6B726F592077654ELL;
  v4[1] = 0xE800000000000000;
  sub_248AF5A20();
  v5 = (_QWORD *)((char *)v4 + v1);
  *v5 = 0x79656E647953;
  v5[1] = 0xE600000000000000;
  sub_248AF5A20();
  v6 = (_QWORD *)((char *)v4 + 2 * v1);
  *v6 = 0x6F796B6F54;
  v6[1] = 0xE500000000000000;
  sub_248AF5A20();
  result = sub_248ACC0F0(v3);
  qword_2577B5070 = result;
  return result;
}

uint64_t sub_248AC973C@<X0>(uint64_t a1@<X8>)
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
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (**v23)();
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)@<X0>(uint64_t *@<X8>);
  uint64_t (*v27)@<X0>(uint64_t *@<X8>);
  uint64_t v28;
  uint64_t (**v29)@<X0>(uint64_t *@<X8>);
  uint64_t v30;
  uint64_t v31;
  uint64_t (**v32)(double *);
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
  _QWORD v44[4];
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v53 = a1;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1B70);
  MEMORY[0x24BDAC7A8](v52);
  v51 = (uint64_t)v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for DragView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1B78);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1B80);
  MEMORY[0x24BDAC7A8](v48);
  v47 = (uint64_t)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1B88);
  MEMORY[0x24BDAC7A8](v50);
  v49 = (uint64_t)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = sub_248AF5324();
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v12 = &v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1B90) + 44)];
  v45 = v1;
  v46 = v12;
  v13 = *(_QWORD *)(*(_QWORD *)(v1 + *(int *)(v3 + 32)) + 16);
  v58 = 0;
  v59 = v13;
  v44[3] = swift_getKeyPath();
  sub_248ACA718(v1, (uint64_t)v6);
  v14 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v15 = swift_allocObject();
  sub_248ACA760((uint64_t)v6, v15 + v14);
  v44[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1A78);
  v44[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1B98);
  v44[0] = sub_248AC84F4();
  v16 = type metadata accessor for DraggableLocationItem();
  v17 = type metadata accessor for TrainingManager();
  v18 = sub_248AB80A8(&qword_2577B1BA0, (uint64_t (*)(uint64_t))type metadata accessor for DraggableLocationItem, (uint64_t)&unk_248AF7C70);
  v19 = sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  v54 = v16;
  v55 = v17;
  v56 = v18;
  v57 = v19;
  swift_getOpaqueTypeConformance2();
  sub_248AF5864();
  v20 = v45;
  sub_248ACA718(v45, (uint64_t)v6);
  v21 = swift_allocObject();
  sub_248ACA760((uint64_t)v6, v21 + v14);
  v22 = v47;
  sub_248AB8870((uint64_t)v9, v47, &qword_2577B1B78);
  v23 = (uint64_t (**)())(v22 + *(int *)(v48 + 36));
  *v23 = sub_248ACA7F4;
  v23[1] = (uint64_t (*)())v21;
  v23[2] = 0;
  v23[3] = 0;
  sub_248AB89E8((uint64_t)v9, &qword_2577B1B78);
  sub_248ACA718(v20, (uint64_t)v6);
  v24 = swift_allocObject();
  sub_248ACA760((uint64_t)v6, v24 + v14);
  v25 = sub_248AF58F4();
  v27 = v26;
  v28 = v51;
  sub_248AB8870(v22, v51, &qword_2577B1B80);
  v29 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v28 + *(int *)(v52 + 36));
  *v29 = sub_248ACBF10;
  v29[1] = 0;
  v29[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v25;
  v29[3] = v27;
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = sub_248ACA938;
  *(_QWORD *)(v30 + 24) = v24;
  v31 = v49;
  sub_248AB8870(v28, v49, &qword_2577B1B70);
  v32 = (uint64_t (**)(double *))(v31 + *(int *)(v50 + 36));
  *v32 = sub_248ACA9C4;
  v32[1] = (uint64_t (*)(double *))v30;
  sub_248AB89E8(v28, &qword_2577B1B70);
  sub_248AB89E8(v22, &qword_2577B1B80);
  LOBYTE(v24) = sub_248AF5510();
  sub_248AF4F88();
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v41 = v53;
  sub_248AB8870(v31, v53, &qword_2577B1B88);
  v42 = v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1BA8) + 36);
  *(_BYTE *)v42 = v24;
  *(_QWORD *)(v42 + 8) = v34;
  *(_QWORD *)(v42 + 16) = v36;
  *(_QWORD *)(v42 + 24) = v38;
  *(_QWORD *)(v42 + 32) = v40;
  *(_BYTE *)(v42 + 40) = 0;
  return sub_248AB89E8(v31, &qword_2577B1B88);
}

uint64_t sub_248AC9BF8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
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
  unint64_t v17;
  int *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v49 - v10;
  v12 = sub_248AF5A2C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v59 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = type metadata accessor for DraggableLocationItem();
  MEMORY[0x24BDAC7A8](v62);
  v64 = (uint64_t)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1B98);
  v61 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v60 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a1;
  v18 = (int *)type metadata accessor for DragView();
  v19 = (uint64_t *)(a2 + v18[6]);
  v21 = *v19;
  v20 = v19[1];
  v65 = v21;
  v66 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1BB0);
  v22 = &v65;
  sub_248AF5804();
  v57 = v68;
  v58 = v67;
  v56 = v69;
  v23 = (uint64_t *)(a2 + v18[7]);
  v25 = *v23;
  v24 = v23[1];
  v65 = v25;
  v66 = v24;
  sub_248AF5804();
  if ((v17 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  v54 = a2;
  v55 = a3;
  a3 = *(_QWORD *)(a2 + v18[8]);
  v26 = *(_QWORD *)(a3 + 16);
  if (v17 >= v26)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    result = swift_once();
    if (v17 < *(_QWORD *)(a3 + 16))
      goto LABEL_5;
LABEL_17:
    __break(1u);
    return result;
  }
  v52 = v68;
  v53 = v67;
  v27 = a3 + 16 * v17;
  v29 = *(_QWORD *)(v27 + 32);
  v28 = *(_QWORD *)(v27 + 40);
  v22 = (uint64_t *)(v27 + 32);
  v50 = v29;
  v51 = v69;
  v30 = qword_2577B10A0;
  v49 = v28;
  result = swift_bridgeObjectRetain();
  if (v30 != -1)
    goto LABEL_16;
  if (v17 >= v26)
    goto LABEL_17;
LABEL_5:
  v33 = *v22;
  v32 = v22[1];
  swift_beginAccess();
  v34 = qword_2577B5070;
  if (*(_QWORD *)(qword_2577B5070 + 16))
  {
    swift_bridgeObjectRetain();
    v35 = sub_248ACAA68(v33, v32);
    if ((v36 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v11, *(_QWORD *)(v34 + 56) + *(_QWORD *)(v13 + 72) * v35, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    swift_bridgeObjectRetain();
  }
  v37 = v54;
  sub_248ACAACC((uint64_t)v11, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12) == 1)
  {
    v38 = v59;
    sub_248AF5A20();
    sub_248AB89E8((uint64_t)v9, &qword_2577B14B8);
  }
  else
  {
    v39 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v38 = v59;
    v39(v59, v9, v12);
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  type metadata accessor for TrainingManager();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  v40 = sub_248AF4FDC();
  v48 = (uint64_t)v38;
  *(_QWORD *)&v47 = v17;
  *((_QWORD *)&v47 + 1) = v50;
  LODWORD(v46) = 0x10000;
  v42 = v64;
  sub_248AE3ED8(v40, v41 & 1, v58, v57, v56, v53, v52, v51, v64, v46, v47, v49, v48);
  v43 = *(_BYTE *)(v37 + v18[5] + 8);
  v44 = swift_retain();
  sub_248ADB034(v44, v43);
  swift_release();
  sub_248AB80A8(&qword_2577B1BA0, (uint64_t (*)(uint64_t))type metadata accessor for DraggableLocationItem, (uint64_t)&unk_248AF7C70);
  v45 = v60;
  sub_248AF5690();
  swift_release();
  sub_248ACAB14(v42);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v61 + 32))(v55, v45, v63);
}

uint64_t sub_248ACA084(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_BYTE *)(a1 + *(int *)(type metadata accessor for DragView() + 20) + 8);
  v2 = swift_retain();
  v3 = sub_248ADB034(v2, v1);
  swift_release();
  *(_BYTE *)(v3 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 2;
  return swift_release();
}

uint64_t sub_248ACA0F0(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(uint64_t, uint64_t, uint64_t);
  _BYTE *v25;
  _BYTE *v26;
  void (*v27)(_BYTE *, uint64_t);
  _BYTE *v28;
  double v29;
  double v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v35[4];
  int v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;

  v5 = sub_248AF5408();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v38 = &v35[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1470);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v35[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v41 = &v35[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = &v35[-v15];
  MEMORY[0x24BDAC7A8](v14);
  v18 = &v35[-v17];
  v39 = type metadata accessor for DragView();
  v19 = a1 + *(int *)(v39 + 20);
  v20 = *(_BYTE *)(v19 + 8);
  v21 = swift_retain();
  v22 = sub_248ADB034(v21, v20);
  swift_release();
  v40 = a1;
  sub_248ADB6C8((uint64_t)v18);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v6 + 104))(v16, *MEMORY[0x24BDEFEE8], v5);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v16, 0, 1, v5);
  v23 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_248AB8870((uint64_t)v18, (uint64_t)v10, &qword_2577B1300);
  sub_248AB8870((uint64_t)v16, v23, &qword_2577B1300);
  v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v24((uint64_t)v10, 1, v5) != 1)
  {
    sub_248AB8870((uint64_t)v10, (uint64_t)v41, &qword_2577B1300);
    if (v24(v23, 1, v5) != 1)
    {
      v25 = v38;
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 32))(v38, v23, v5);
      sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
      v37 = v22;
      v26 = v41;
      v36 = sub_248AF5A14();
      v27 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
      v27(v25, v5);
      sub_248AB89E8((uint64_t)v16, &qword_2577B1300);
      sub_248AB89E8((uint64_t)v18, &qword_2577B1300);
      v28 = v26;
      v22 = v37;
      v27(v28, v5);
      sub_248AB89E8((uint64_t)v10, &qword_2577B1300);
      if ((v36 & 1) != 0)
        goto LABEL_8;
LABEL_9:
      v30 = a3 * 0.5;
      v29 = 373.0;
      goto LABEL_10;
    }
    sub_248AB89E8((uint64_t)v16, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v18, &qword_2577B1300);
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v41, v5);
LABEL_6:
    sub_248AB89E8((uint64_t)v10, &qword_2577B1470);
    goto LABEL_9;
  }
  sub_248AB89E8((uint64_t)v16, &qword_2577B1300);
  sub_248AB89E8((uint64_t)v18, &qword_2577B1300);
  if (v24(v23, 1, v5) != 1)
    goto LABEL_6;
  sub_248AB89E8((uint64_t)v10, &qword_2577B1300);
LABEL_8:
  v29 = *(double *)(v40 + *(int *)(v39 + 36)) * 0.5;
  v30 = a3 * 0.5;
LABEL_10:
  *(double *)(v22 + 64) = v29 - v30;
  swift_release();
  v31 = *(_BYTE *)(v19 + 8);
  v32 = swift_retain();
  v33 = sub_248ADB034(v32, v31);
  swift_release();
  *(double *)(v33 + 56) = v30;
  return swift_release();
}

void sub_248ACA4BC(uint64_t *a1@<X8>)
{
  int *v2;
  char *v3;
  char v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  CGRect v24;

  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  swift_storeEnumTagMultiPayload();
  v2 = (int *)type metadata accessor for DragView();
  v3 = (char *)a1 + v2[5];
  type metadata accessor for TrainingManager();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  *(_QWORD *)v3 = sub_248AF4FDC();
  v3[8] = v4 & 1;
  v5 = (uint64_t *)((char *)a1 + v2[6]);
  v6 = (_QWORD *)sub_248AF5B40();
  v6[2] = 3;
  v6[5] = 0;
  v6[6] = 0;
  v6[4] = 0;
  v23 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1BC8);
  sub_248AF57E0();
  *v5 = v21;
  v5[1] = v22;
  v7 = (uint64_t *)((char *)a1 + v2[7]);
  v8 = (_QWORD *)sub_248AF5B40();
  v8[2] = 3;
  v8[5] = 0;
  v8[6] = 0;
  v8[4] = 0;
  v23 = v8;
  sub_248AF57E0();
  *v7 = v21;
  v7[1] = v22;
  if (qword_2577B10A0 != -1)
    swift_once();
  swift_beginAccess();
  v9 = swift_bridgeObjectRetain();
  v10 = sub_248ACAE14(v9);
  swift_bridgeObjectRelease();
  v23 = v10;
  swift_retain();
  sub_248ACADAC((uint64_t *)&v23);
  swift_release();
  *(uint64_t *)((char *)a1 + v2[8]) = (uint64_t)v23;
  v11 = v2[9];
  v12 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v12, sel_bounds);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v24.origin.x = v14;
  v24.origin.y = v16;
  v24.size.width = v18;
  v24.size.height = v20;
  *(CGFloat *)((char *)a1 + v11) = CGRectGetHeight(v24);
}

uint64_t sub_248ACA718(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DragView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ACA760(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DragView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ACA7A4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DragView() - 8) + 80);
  return sub_248AC9BF8(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_248ACA7F4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DragView() - 8) + 80);
  return sub_248ACA084(v0 + ((v1 + 16) & ~v1));
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for DragView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_248AF5408();
    v4 = *(_QWORD *)(v3 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
      (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_248ACA938(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DragView() - 8) + 80);
  return sub_248ACA0F0(v2 + ((v5 + 16) & ~v5), a1, a2);
}

uint64_t sub_248ACA97C(double *a1, uint64_t (*a2)(double, double))
{
  return a2(*a1, a1[1]);
}

uint64_t sub_248ACA9A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248ACA9C4(double *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

unint64_t sub_248ACA9E8(uint64_t a1)
{
  uint64_t v2;

  sub_248AF5A5C();
  sub_248AF5D98();
  sub_248AF5A98();
  v2 = sub_248AF5DB0();
  swift_bridgeObjectRelease();
  return sub_248ACAB50(a1, v2);
}

unint64_t sub_248ACAA68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_248AF5D98();
  sub_248AF5A98();
  v4 = sub_248AF5DB0();
  return sub_248ACACC4(a1, a2, v4);
}

uint64_t sub_248ACAACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ACAB14(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DraggableLocationItem();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_248ACAB50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_248AF5A5C();
    v8 = v7;
    if (v6 == sub_248AF5A5C() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_248AF5D68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_248AF5A5C();
          v15 = v14;
          if (v13 == sub_248AF5A5C() && v15 == v16)
            break;
          v18 = sub_248AF5D68();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_248ACACC4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_248AF5D68() & 1) == 0)
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
      while (!v14 && (sub_248AF5D68() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_248ACADAC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_248ACBAF8(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_248ACAEF8(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_248ACAE14(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1190);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_248ACBB10((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_248ACBD0C();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_248ACAEF8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *__dst;

  v3 = a1[1];
  result = sub_248AF5D50();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_248ACB5E0(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_160;
  v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        v95 = *v102;
        do
        {
          v96 = v12 - 2;
          if (v12 < 2)
            goto LABEL_147;
          if (!v95)
            goto LABEL_159;
          v97 = v94;
          v98 = *(_QWORD *)&v94[16 * v96 + 32];
          v99 = *(_QWORD *)&v94[16 * v12 + 24];
          sub_248ACB6AC((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(_QWORD *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_148;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v97 = sub_248ACBAE4((uint64_t)v97);
          if (v96 >= *((_QWORD *)v97 + 2))
            goto LABEL_149;
          v100 = &v97[16 * v96 + 32];
          *(_QWORD *)v100 = v98;
          *((_QWORD *)v100 + 1) = v99;
          v101 = *((_QWORD *)v97 + 2);
          if (v12 > v101)
            goto LABEL_150;
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((_QWORD *)v97 + 2) = v101 - 1;
          v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_248AF5B40();
    *(_QWORD *)(v7 + 16) = v6;
    v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *a1;
  v103 = v10 + 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v106 = v3;
  while (1)
  {
    v13 = v9++;
    if (v9 >= v3)
      goto LABEL_46;
    v14 = (uint64_t *)(v10 + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = (_QWORD *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_45;
      v19 = 0;
    }
    else
    {
      v19 = sub_248AF5D68();
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_36;
    }
    v21 = (_QWORD *)(v103 + 16 * v20);
    do
    {
      v23 = (_QWORD *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if ((v19 & 1) != 0)
          goto LABEL_37;
      }
      else if (((v19 ^ sub_248AF5D68()) & 1) != 0)
      {
        goto LABEL_36;
      }
      v21 += 2;
      v22 = v20 + 1;
      v9 = v20;
      v20 = v22;
    }
    while (v22 < v3);
    v20 = v22;
LABEL_36:
    v9 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_37:
      if (v20 < v13)
        goto LABEL_155;
      if (v13 < v20)
      {
        v25 = 16 * v20;
        v26 = 16 * v13;
        v27 = v20;
        v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10)
              goto LABEL_158;
            v29 = v10 + v25;
            v30 = *(_QWORD *)(v10 + v26);
            v31 = *(_QWORD *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(_QWORD *)(v29 - 16) = v30;
            *(_QWORD *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13))
        goto LABEL_151;
      if (v9 - v13 < v105)
        break;
    }
LABEL_67:
    if (v9 < v13)
      goto LABEL_146;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_248ACB944(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v41 = *((_QWORD *)v11 + 2);
    v40 = *((_QWORD *)v11 + 3);
    v12 = v41 + 1;
    if (v41 >= v40 >> 1)
      v11 = sub_248ACB944((char *)(v40 > 1), v41 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v12;
    v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(_QWORD *)v43 = v13;
    *((_QWORD *)v43 + 1) = v9;
    if (v41)
    {
      v107 = v9;
      while (1)
      {
        v44 = v12 - 1;
        if (v12 >= 4)
        {
          v49 = &v42[16 * v12];
          v50 = *((_QWORD *)v49 - 8);
          v51 = *((_QWORD *)v49 - 7);
          v55 = __OFSUB__(v51, v50);
          v52 = v51 - v50;
          if (v55)
            goto LABEL_135;
          v54 = *((_QWORD *)v49 - 6);
          v53 = *((_QWORD *)v49 - 5);
          v55 = __OFSUB__(v53, v54);
          v47 = v53 - v54;
          v48 = v55;
          if (v55)
            goto LABEL_136;
          v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          v59 = *(_QWORD *)v57;
          v58 = *((_QWORD *)v57 + 1);
          v55 = __OFSUB__(v58, v59);
          v60 = v58 - v59;
          if (v55)
            goto LABEL_138;
          v55 = __OFADD__(v47, v60);
          v61 = v47 + v60;
          if (v55)
            goto LABEL_141;
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            v81 = *(_QWORD *)v79;
            v80 = *((_QWORD *)v79 + 1);
            v55 = __OFSUB__(v80, v81);
            v82 = v80 - v81;
            if (v55)
              goto LABEL_145;
            v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v73 = *((_QWORD *)v11 + 4);
            v74 = *((_QWORD *)v11 + 5);
            v55 = __OFSUB__(v74, v73);
            v66 = v74 - v73;
            v67 = v55;
            goto LABEL_99;
          }
          v46 = *((_QWORD *)v11 + 4);
          v45 = *((_QWORD *)v11 + 5);
          v55 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          v48 = v55;
        }
        if ((v48 & 1) != 0)
          goto LABEL_137;
        v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v65 = __OFSUB__(v63, v64);
        v66 = v63 - v64;
        v67 = v65;
        if (v65)
          goto LABEL_140;
        v68 = &v42[16 * v44];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v55 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v55)
          goto LABEL_143;
        if (__OFADD__(v66, v71))
          goto LABEL_144;
        if (v66 + v71 >= v47)
        {
          v72 = v47 < v71;
LABEL_105:
          if (v72)
            v44 = v56;
          goto LABEL_107;
        }
LABEL_99:
        if ((v67 & 1) != 0)
          goto LABEL_139;
        v75 = &v42[16 * v44];
        v77 = *(_QWORD *)v75;
        v76 = *((_QWORD *)v75 + 1);
        v55 = __OFSUB__(v76, v77);
        v78 = v76 - v77;
        if (v55)
          goto LABEL_142;
        if (v78 < v66)
          goto LABEL_15;
LABEL_107:
        v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
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
          goto LABEL_154;
        }
        v84 = v10;
        if (!v10)
          goto LABEL_157;
        v85 = v11;
        v86 = &v42[16 * v83];
        v87 = *(_QWORD *)v86;
        v88 = v42;
        v89 = v44;
        v90 = &v42[16 * v44];
        v91 = *((_QWORD *)v90 + 1);
        v92 = v84;
        sub_248ACB6AC((char *)(v84 + 16 * *(_QWORD *)v86), (char *)(v84 + 16 * *(_QWORD *)v90), v84 + 16 * v91, __dst);
        if (v1)
          goto LABEL_115;
        if (v91 < v87)
          goto LABEL_132;
        if (v89 > *((_QWORD *)v85 + 2))
          goto LABEL_133;
        *(_QWORD *)v86 = v87;
        *(_QWORD *)&v88[16 * v83 + 8] = v91;
        v93 = *((_QWORD *)v85 + 2);
        if (v89 >= v93)
          goto LABEL_134;
        v11 = v85;
        v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        v42 = v88;
        *((_QWORD *)v85 + 2) = v93 - 1;
        v10 = v92;
        v9 = v107;
        if (v93 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v106;
    if (v9 >= v106)
    {
      v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105))
    goto LABEL_153;
  if (v13 + v105 >= v3)
    v32 = v3;
  else
    v32 = v13 + v105;
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      v33 = (_QWORD *)(v10 + 16 * v9);
      do
      {
        v34 = (uint64_t *)(v10 + 16 * v9);
        v35 = *v34;
        v36 = v34[1];
        v37 = v13;
        v38 = v33;
        do
        {
          v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_248AF5D68() & 1) == 0)
            break;
          if (!v10)
            goto LABEL_156;
          v35 = *v38;
          v36 = v38[1];
          *(_OWORD *)v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      v9 = v32;
    }
    goto LABEL_67;
  }
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
  result = sub_248AF5CF0();
  __break(1u);
  return result;
}

uint64_t sub_248ACB5E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_248AF5D68(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_248ACB6AC(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t result;
  char *v25;
  char *v26;
  char *v27;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v27 = __src;
  v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v17 = &v4[16 * v13];
      v25 = v17;
      v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v18 = (char *)(a3 - 16);
        v19 = v6;
        while (1)
        {
          v20 = v18 + 16;
          v21 = *((_QWORD *)v19 - 2);
          v22 = *((_QWORD *)v19 - 1);
          v19 -= 16;
          v23 = *((_QWORD *)v17 - 2) == v21 && *((_QWORD *)v17 - 1) == v22;
          if (v23 || (sub_248AF5D68() & 1) == 0)
          {
            v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17)
              *(_OWORD *)v18 = *((_OWORD *)v17 - 1);
            v19 = v6;
            v17 -= 16;
            if (v6 <= v7)
              goto LABEL_50;
          }
          else
          {
            if (v20 != v6 || v18 >= v6)
              *(_OWORD *)v18 = *(_OWORD *)v19;
            v27 = v19;
            if (v19 <= v7)
              goto LABEL_50;
          }
          v18 -= 16;
          v6 = v19;
          if (v17 <= v4)
            goto LABEL_50;
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
        if (v15 || (sub_248AF5D68() & 1) == 0)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v26 = v4;
          v16 = v6;
        }
        else
        {
          v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      v27 = v7;
    }
LABEL_50:
    sub_248ACBA3C((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  result = sub_248AF5D2C();
  __break(1u);
  return result;
}

char *sub_248ACB944(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1BD0);
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

char *sub_248ACBA3C(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_248AF5D2C();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_248ACBAE4(uint64_t a1)
{
  return sub_248ACB944(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_248ACBAF8(uint64_t a1)
{
  return sub_248AF2634(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_248ACBB10(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

uint64_t sub_248ACBD0C()
{
  return swift_release();
}

unint64_t sub_248ACBD18()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1BD8;
  if (!qword_2577B1BD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1BA8);
    v2[0] = sub_248ACBD84();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1BD8);
  }
  return result;
}

unint64_t sub_248ACBD84()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1BE0;
  if (!qword_2577B1BE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1B88);
    v2[0] = sub_248ACBE08();
    v2[1] = sub_248AB8BE8(&qword_2577B1C10, &qword_2577B1C18, MEMORY[0x24BDF09B0]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1BE0);
  }
  return result;
}

unint64_t sub_248ACBE08()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1BE8;
  if (!qword_2577B1BE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1B70);
    v2[0] = sub_248ACBE8C();
    v2[1] = sub_248AB8BE8(&qword_2577B1C00, &qword_2577B1C08, MEMORY[0x24BDEF370]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1BE8);
  }
  return result;
}

unint64_t sub_248ACBE8C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1BF0;
  if (!qword_2577B1BF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1B80);
    v2[0] = sub_248AB8BE8(&qword_2577B1BF8, &qword_2577B1B78, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1BF0);
  }
  return result;
}

uint64_t sub_248ACBF10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_248AF575C();
  result = sub_248AF5060();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

ValueMetadata *type metadata accessor for SizePreferenceKey()
{
  return &type metadata for SizePreferenceKey;
}

void sub_248ACBF5C()
{
  xmmword_2577B1C20 = 0uLL;
}

double sub_248ACBF6C@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_2577B10A8 != -1)
    swift_once();
  result = *(double *)&xmmword_2577B1C20;
  *a1 = xmmword_2577B1C20;
  return result;
}

unint64_t sub_248ACBFC4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D80);
  v2 = sub_248AF5D20();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_248AB8870(v6, (uint64_t)&v13, &qword_2577B1D88);
    v7 = v13;
    result = sub_248ACA9E8(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_248ACD170(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

unint64_t sub_248ACC0F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1BC0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D70);
  v6 = sub_248AF5D20();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (char *)v5 + *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_248AB8870(v12, (uint64_t)v5, &qword_2577B1BC0);
    v14 = *v5;
    v15 = v5[1];
    result = sub_248ACAA68(*v5, v15);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    *v19 = v14;
    v19[1] = v15;
    v20 = v7[7];
    v21 = sub_248AF5A2C();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v18, v9, v21);
    v22 = v7[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_248ACC290(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D78);
  v2 = (_QWORD *)sub_248AF5D20();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_248ACAA68(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
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

uint64_t TryItAnalyticsEvent.__allocating_init(identifier:tipId:correlationId:collectionId:lessonId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v17;

  v17 = swift_allocObject();
  TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return v17;
}

uint64_t TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  *(_OWORD *)(v10 + 64) = 0u;
  *(_OWORD *)(v10 + 80) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  *(_QWORD *)(v10 + 32) = a3;
  *(_QWORD *)(v10 + 40) = a4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v10 + 48) = a5;
  *(_QWORD *)(v10 + 56) = a6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v10 + 64) = a7;
  *(_QWORD *)(v10 + 72) = a8;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v10 + 80) = a9;
  *(_QWORD *)(v10 + 88) = a10;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_248ACC4D4()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  unint64_t v15;

  v1 = v0;
  v2 = sub_248ACC290(MEMORY[0x24BEE4AF8]);
  v15 = v2;
  if (v0[5])
  {
    v3 = v2;
    swift_bridgeObjectRetain();
    v4 = sub_248AF5A38();
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_248ACCE1C(v4, 0x64695F706974, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    v15 = v3;
    swift_bridgeObjectRelease();
    if (v1[7])
      goto LABEL_3;
  }
  else
  {

    if (v0[7])
    {
LABEL_3:
      swift_bridgeObjectRetain();
      v6 = sub_248AF5A38();
      swift_bridgeObjectRelease();
      v7 = swift_isUniquelyReferenced_nonNull_native();
      sub_248ACCE1C(v6, 0xD000000000000012, 0x8000000248AF8820, v7);
      swift_bridgeObjectRelease();
      if (v1[9])
        goto LABEL_4;
LABEL_8:

      if (v1[11])
        goto LABEL_5;
LABEL_9:

      goto LABEL_10;
    }
  }

  if (!v1[9])
    goto LABEL_8;
LABEL_4:
  swift_bridgeObjectRetain();
  v8 = sub_248AF5A38();
  swift_bridgeObjectRelease();
  v9 = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v8, 0x697463656C6C6F63, 0xED000044495F6E6FLL, v9);
  swift_bridgeObjectRelease();
  if (!v1[11])
    goto LABEL_9;
LABEL_5:
  swift_bridgeObjectRetain();
  v10 = sub_248AF5A38();
  swift_bridgeObjectRelease();
  v11 = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v10, 0x495F6E6F7373656CLL, 0xE900000000000044, v11);
  swift_bridgeObjectRelease();
LABEL_10:
  objc_msgSend((id)objc_opt_self(), sel_isSeniorUser);
  v12 = sub_248AF5B4C();
  v13 = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v12, 0x67616C665F353675, 0xE800000000000000, v13);
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t TryItAnalyticsEvent.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TryItAnalyticsEvent.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_248ACC870(uint64_t a1, uint64_t a2)
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
  v6 = sub_248ACAA68(a1, a2);
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
    sub_248ACCFC0();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_248ACCC48(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_248ACC93C(uint64_t a1, char a2)
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
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D78);
  v38 = a2;
  v6 = sub_248AF5D14();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_248AF5D98();
    sub_248AF5A98();
    result = sub_248AF5DB0();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_248ACCC48(unint64_t result, uint64_t a2)
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
  _QWORD *v15;
  _QWORD *v16;
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
    result = sub_248AF5C90();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_248AF5D98();
        swift_bridgeObjectRetain();
        sub_248AF5A98();
        v9 = sub_248AF5DB0();
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
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
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

void sub_248ACCE1C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_248ACAA68(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_248ACCFC0();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_248ACC93C(v15, a4 & 1);
  v20 = sub_248ACAA68(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_248AF5D74();
  __break(1u);
}

uint64_t type metadata accessor for TryItAnalyticsEvent()
{
  return objc_opt_self();
}

uint64_t method lookup function for TryItAnalyticsEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TryItAnalyticsEvent.__allocating_init(identifier:tipId:correlationId:collectionId:lessonId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of TryItAnalyticsEvent.eventRepresentation()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

id sub_248ACCFC0()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D78);
  v2 = *v0;
  v3 = sub_248AF5D08();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_OWORD *sub_248ACD170(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_248ACD180@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t (**v28)();
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t OpaqueTypeConformance2;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  _QWORD v51[2];
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
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
  unint64_t v78;
  char v79[32];
  char v80[8];
  uint64_t v81;
  uint64_t v82;
  char v83;

  v70 = a1;
  v2 = sub_248AF4F70();
  v68 = *(_QWORD *)(v2 - 8);
  v69 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v67 = (char *)v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_248AF4F40();
  v58 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v57 = (char *)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PinchZoomView();
  v6 = *(_QWORD *)(v5 - 8);
  v73 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_248AF4F58();
  MEMORY[0x24BDAC7A8](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1E38);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1E40);
  MEMORY[0x24BDAC7A8](v13);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1E48);
  v53 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v15 = (char *)v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1E50);
  MEMORY[0x24BDAC7A8](v74);
  v17 = (char *)v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1E58);
  v62 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v55 = (char *)v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1E60);
  v66 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v56 = (char *)v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1E68);
  v63 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v61 = (char *)v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D90);
  sub_248AF5804();
  v21 = sub_248AF4F1C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v12, 1, 1, v21);
  sub_248AF4F4C();
  sub_248AF4F10();
  sub_248ACE2D0(v1, (uint64_t)v8);
  v22 = *(unsigned __int8 *)(v6 + 80);
  v23 = (v22 + 16) & ~v22;
  v71 = v23;
  v51[1] = v23 + v73;
  v73 = v22 | 7;
  v24 = swift_allocObject();
  sub_248ACE318((uint64_t)v8, v24 + v23);
  v25 = v53;
  v26 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
  v52 = v17;
  v27 = v54;
  v26(v17, v15, v54);
  v28 = (uint64_t (**)())&v17[*(int *)(v74 + 36)];
  *v28 = sub_248ACE35C;
  v28[1] = (uint64_t (*)())v24;
  v28[2] = 0;
  v28[3] = 0;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v15, v27);
  v29 = v57;
  sub_248AF57EC();
  sub_248AF4F28();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v29, v59);
  sub_248ACE368((uint64_t)v79, (uint64_t)v80);
  v30 = v81;
  v31 = v82;
  if (v83)
  {
    v30 = 0;
    v31 = 0;
  }
  v75 = v30;
  v76 = v31;
  LOBYTE(v77) = v83;
  v32 = v72;
  v33 = (uint64_t)v8;
  sub_248ACE2D0(v72, (uint64_t)v8);
  v34 = swift_allocObject();
  v35 = v71;
  sub_248ACE318(v33, v34 + v71);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1E78);
  v37 = sub_248ACE3C0();
  v38 = sub_248ACE478();
  v39 = v55;
  v40 = v74;
  v41 = (uint64_t)v52;
  sub_248AF5738();
  swift_release();
  sub_248AB89E8(v41, &qword_2577B1E50);
  v42 = v67;
  sub_248AF4F64();
  sub_248ACE2D0(v32, v33);
  v43 = swift_allocObject();
  sub_248ACE318(v33, v43 + v35);
  v75 = v40;
  v76 = v36;
  v77 = v37;
  v78 = v38;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v45 = v56;
  v46 = v60;
  sub_248AF5630();
  swift_release();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v42, v69);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v39, v46);
  sub_248ACE2D0(v72, v33);
  v47 = swift_allocObject();
  sub_248ACE318(v33, v47 + v71);
  v75 = v46;
  v76 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v48 = v61;
  v49 = v64;
  sub_248AF569C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v45, v49);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v63 + 32))(v70, v48, v65);
}

uint64_t sub_248ACD874(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_BYTE *)(a1 + 8);
  v2 = swift_retain();
  sub_248ADB034(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EE0();
  swift_release();
  swift_release();
  v3 = swift_retain();
  v4 = sub_248ADB034(v3, v1);
  swift_release();
  *(_BYTE *)(v4 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 3;
  return swift_release();
}

uint64_t sub_248ACD988()
{
  uint64_t result;
  char v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  result = sub_248AF57EC();
  if ((v1 & 1) == 0)
    return sub_248AF57F8();
  return result;
}

uint64_t sub_248ACDA04(uint64_t a1)
{
  uint64_t result;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  char v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  result = sub_248AF57EC();
  if (v10 == 1)
  {
    v3 = *(_BYTE *)(a1 + 8);
    v4 = swift_retain();
    sub_248ADB034(v4, v3);
    swift_release();
    sub_248AD5958(1, 1, 0);
    swift_release();
    v5 = swift_retain();
    v6 = sub_248ADB034(v5, v3);
    result = swift_release();
    v7 = *(_QWORD *)(v6 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
    v8 = __OFADD__(v7, 1);
    v9 = v7 + 1;
    if (v8)
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(v6 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v9;
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_248ACDAE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF5A2C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_BYTE *)(a1 + 8);
  v10 = swift_retain();
  sub_248ADB034(v10, v9);
  swift_release();
  sub_248AF5A20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  sub_248AD6194((uint64_t)v8, 1, (uint64_t)v4);
  swift_release();
  sub_248AB89E8((uint64_t)v4, &qword_2577B14B8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  LOBYTE(a1) = *(_BYTE *)(a1 + 8);
  v11 = swift_retain();
  v12 = sub_248ADB034(v11, a1);
  result = swift_release();
  v14 = *(_QWORD *)(v12 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v12 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v16;
    return swift_release();
  }
  return result;
}

BOOL static MKCoordinateSpan.== infix(_:_:)(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

BOOL sub_248ACDC90(double *a1, double *a2)
{
  return a1[1] == a2[1] && *a1 == *a2;
}

_QWORD *sub_248ACDCAC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    v5 = *((_BYTE *)a2 + 8);
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = v5;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_QWORD *)(a1 + 24) = a2[3];
    v6 = *(int *)(a3 + 24);
    v7 = a1 + v6;
    v8 = (uint64_t)a2 + v6;
    v9 = sub_248AF4F40();
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_retain();
    swift_retain();
    v10(v7, v8, v9);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D90);
    *(_QWORD *)(v7 + *(int *)(v11 + 28)) = *(_QWORD *)(v8 + *(int *)(v11 + 28));
  }
  swift_retain();
  return v3;
}

uint64_t sub_248ACDD88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_248AF4F40();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D90);
  return swift_release();
}

uint64_t sub_248ACDDF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v5 = *(int *)(a3 + 24);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_248AF4F40();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_retain();
  swift_retain();
  v9(v6, v7, v8);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D90);
  *(_QWORD *)(v6 + *(int *)(v10 + 28)) = *(_QWORD *)(v7 + *(int *)(v10 + 28));
  swift_retain();
  return a1;
}

uint64_t sub_248ACDEA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_248AF4F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D90);
  *(_QWORD *)(v8 + *(int *)(v11 + 28)) = *(_QWORD *)(v9 + *(int *)(v11 + 28));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_248ACDF68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_248AF4F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D90);
  *(_QWORD *)(v5 + *(int *)(v8 + 28)) = *(_QWORD *)(v6 + *(int *)(v8 + 28));
  return a1;
}

uint64_t sub_248ACDFEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v6;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_248AF4F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D90);
  *(_QWORD *)(v8 + *(int *)(v11 + 28)) = *(_QWORD *)(v9 + *(int *)(v11 + 28));
  swift_release();
  return a1;
}

uint64_t sub_248ACE098()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248ACE0A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D90);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v9);
  }
}

uint64_t sub_248ACE130()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248ACE13C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 24) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D90);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PinchZoomView()
{
  uint64_t result;

  result = qword_2577B1DF0;
  if (!qword_2577B1DF0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_248ACE1F0()
{
  unint64_t v0;

  sub_248ACE26C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_248ACE26C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2577B1E00)
  {
    sub_248AF4F40();
    v0 = sub_248AF5810();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2577B1E00);
  }
}

uint64_t sub_248ACE2C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248ACE2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PinchZoomView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ACE318(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PinchZoomView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ACE35C()
{
  return sub_248ACE5C0(sub_248ACD874);
}

uint64_t sub_248ACE368(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1E70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ACE3B4()
{
  return sub_248ACE5C0((uint64_t (*)(uint64_t))sub_248ACD988);
}

unint64_t sub_248ACE3C0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1E80;
  if (!qword_2577B1E80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1E50);
    v2[0] = sub_248ACE42C();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1E80);
  }
  return result;
}

unint64_t sub_248ACE42C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577B1E88;
  if (!qword_2577B1E88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1E48);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDFBC78], v1);
    atomic_store(result, (unint64_t *)&qword_2577B1E88);
  }
  return result;
}

unint64_t sub_248ACE478()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2577B1E90;
  if (!qword_2577B1E90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1E78);
    v2 = sub_248AB80A8(&qword_2577B1E98, (uint64_t (*)(uint64_t))type metadata accessor for MKCoordinateSpan, (uint64_t)&protocol conformance descriptor for MKCoordinateSpan);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2577B1E90);
  }
  return result;
}

uint64_t sub_248ACE4F8()
{
  return sub_248ACE5C0(sub_248ACDA04);
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for PinchZoomView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  swift_release();
  v4 = v3 + *(int *)(v1 + 24);
  v5 = sub_248AF4F40();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1D90);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248ACE5B4()
{
  return sub_248ACE5C0(sub_248ACDAE8);
}

uint64_t sub_248ACE5C0(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PinchZoomView() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_248ACE604()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1E60);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1E58);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1E50);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1E78);
  sub_248ACE3C0();
  sub_248ACE478();
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248ACE6CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v8;

  v0 = sub_248AF4E80();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_248AF4E2C();
  __swift_allocate_value_buffer(v4, qword_2577B5078);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2577B5078);
  if (qword_2577B10D0 != -1)
    swift_once();
  v6 = objc_msgSend((id)qword_2577B2DE8, sel_bundleURL);
  sub_248AF4E68();

  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v5, *MEMORY[0x24BDCD330], v4);
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

uint64_t TipsTryItView.init(lesson:tipId:collectionId:correlationId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int *v17;
  uint64_t *v18;
  uint64_t *v19;
  char *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v29 = a4;
  v30 = a6;
  v28 = a2;
  v13 = sub_248AF55C4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  swift_storeEnumTagMultiPayload();
  v17 = (int *)type metadata accessor for TipsTryItView();
  v18 = (uint64_t *)((char *)a8 + v17[5]);
  *v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
  swift_storeEnumTagMultiPayload();
  v19 = (uint64_t *)((char *)a8 + v17[6]);
  *v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
  swift_storeEnumTagMultiPayload();
  v32 = 0x3FF8000000000000;
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BDF1878], v13);
  sub_248AD2120();
  sub_248AF4FF4();
  v20 = (char *)a8 + v17[8];
  LOBYTE(v31) = 0;
  sub_248AF57E0();
  v21 = v33;
  *v20 = v32;
  *((_QWORD *)v20 + 1) = v21;
  v22 = (uint64_t *)((char *)a8 + v17[9]);
  v31 = 0;
  sub_248AF57E0();
  v23 = v33;
  *v22 = v32;
  v22[1] = v23;
  v24 = (uint64_t *)((char *)a8 + v17[10]);
  v31 = 0;
  sub_248AF57E0();
  v25 = v33;
  *v24 = v32;
  v24[1] = v25;
  v26 = v17[11];
  type metadata accessor for TrainingManager();
  swift_allocObject();
  *(uint64_t *)((char *)a8 + v26) = sub_248AD7AD0();
  swift_retain();
  sub_248AD5258(a1, v28, a3, v29, a5, v30, a7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t TipsTryItView.init(lesson:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  int *v8;
  uint64_t *v9;
  uint64_t *v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[16];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = sub_248AF55C4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  swift_storeEnumTagMultiPayload();
  v8 = (int *)type metadata accessor for TipsTryItView();
  v9 = (uint64_t *)((char *)a2 + v8[5]);
  *v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
  swift_storeEnumTagMultiPayload();
  v10 = (uint64_t *)((char *)a2 + v8[6]);
  *v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
  swift_storeEnumTagMultiPayload();
  v24 = 0x3FF8000000000000;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF1878], v4);
  sub_248AD2120();
  sub_248AF4FF4();
  v11 = (char *)a2 + v8[8];
  LOBYTE(v23) = 0;
  sub_248AF57E0();
  v12 = v25;
  *v11 = v24;
  *((_QWORD *)v11 + 1) = v12;
  v13 = (uint64_t *)((char *)a2 + v8[9]);
  v23 = 0;
  sub_248AF57E0();
  v14 = v25;
  *v13 = v24;
  v13[1] = v14;
  v15 = (uint64_t *)((char *)a2 + v8[10]);
  v23 = 0;
  sub_248AF57E0();
  v16 = v25;
  *v15 = v24;
  v15[1] = v16;
  v17 = v8[11];
  type metadata accessor for TrainingManager();
  swift_allocObject();
  v18 = sub_248AD7AD0();
  *(uint64_t *)((char *)a2 + v17) = v18;
  swift_getKeyPath();
  v21 = v18;
  v22 = a1;
  v24 = v18;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  swift_retain();
  sub_248AF4EE0();
  swift_release();
  return swift_release();
}

uint64_t TipsTryItView.init(lessons:tipId:collectionId:correlationId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int *v17;
  uint64_t *v18;
  uint64_t *v19;
  char *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v29 = a4;
  v30 = a6;
  v28 = a2;
  v13 = sub_248AF55C4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  swift_storeEnumTagMultiPayload();
  v17 = (int *)type metadata accessor for TipsTryItView();
  v18 = (uint64_t *)((char *)a8 + v17[5]);
  *v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
  swift_storeEnumTagMultiPayload();
  v19 = (uint64_t *)((char *)a8 + v17[6]);
  *v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
  swift_storeEnumTagMultiPayload();
  v32 = 0x3FF8000000000000;
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BDF1878], v13);
  sub_248AD2120();
  sub_248AF4FF4();
  v20 = (char *)a8 + v17[8];
  LOBYTE(v31) = 0;
  sub_248AF57E0();
  v21 = v33;
  *v20 = v32;
  *((_QWORD *)v20 + 1) = v21;
  v22 = (uint64_t *)((char *)a8 + v17[9]);
  v31 = 0;
  sub_248AF57E0();
  v23 = v33;
  *v22 = v32;
  v22[1] = v23;
  v24 = (uint64_t *)((char *)a8 + v17[10]);
  v31 = 0;
  sub_248AF57E0();
  v25 = v33;
  *v24 = v32;
  v24[1] = v25;
  v26 = v17[11];
  type metadata accessor for TrainingManager();
  swift_allocObject();
  *(uint64_t *)((char *)a8 + v26) = sub_248AD7AD0();
  swift_retain();
  sub_248AD54C0(a1, v28, a3, v29, a5, v30, a7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall TipsTryItView.logEndSession()()
{
  type metadata accessor for TipsTryItView();
  sub_248AD7464();
}

uint64_t TipsTryItView.body.getter@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v11;
  uint64_t v12;
  uint64_t OpaqueTypeConformance2;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v18 = a1;
  v2 = sub_248AF545C();
  v17 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EB8);
  v16 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EC0);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1EC8);
  v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1ED0);
  v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1ED8);
  v11 = sub_248AB8BE8(&qword_2577B1EE0, &qword_2577B1ED0, MEMORY[0x24BDF4700]);
  v12 = sub_248ABD838(&qword_2577B1EE8, &qword_2577B1ED8, (uint64_t (*)(void))sub_248AD218C, MEMORY[0x24BDECC60]);
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v20 = v8;
  v21 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_248AF50D8();
  sub_248AF5450();
  sub_248AB8BE8(&qword_2577B1F10, &qword_2577B1EB8, MEMORY[0x24BDEC988]);
  sub_248AB80A8(&qword_2577B1F18, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0620], MEMORY[0x24BDF0610]);
  sub_248AF563C();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v7, v5);
}

uint64_t sub_248ACF214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t OpaqueTypeConformance2;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t v64;

  v59 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F08);
  v53 = *(_QWORD *)(v3 - 8);
  v54 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EF8);
  MEMORY[0x24BDAC7A8](v52);
  v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1ED8);
  MEMORY[0x24BDAC7A8](v55);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TipsTryItView();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EC8);
  v15 = *(_QWORD *)(v14 - 8);
  v57 = v14;
  v58 = v15;
  MEMORY[0x24BDAC7A8](v14);
  v56 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_248AF5324();
  sub_248AC7574(a1, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  v18 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v19 = swift_allocObject();
  sub_248AD36A8((uint64_t)v13, v19 + v18);
  v60 = v17;
  v61 = 0;
  LOBYTE(v62) = 1;
  v63 = sub_248AD36EC;
  v64 = v19;
  sub_248AC7574(a1, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  v20 = swift_allocObject();
  sub_248AD36A8((uint64_t)v13, v20 + v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2000);
  sub_248AD3748();
  sub_248AF5828();
  LOBYTE(v12) = sub_248AF5558();
  sub_248AF4F88();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v53;
  v29 = v54;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v7, v5, v54);
  v31 = &v7[*(int *)(v52 + 36)];
  *v31 = v12;
  *((_QWORD *)v31 + 1) = v22;
  *((_QWORD *)v31 + 2) = v24;
  *((_QWORD *)v31 + 3) = v26;
  *((_QWORD *)v31 + 4) = v28;
  v31[40] = 0;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v29);
  LOBYTE(v12) = sub_248AF5534();
  sub_248AF4F88();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  sub_248AB8870((uint64_t)v7, (uint64_t)v9, &qword_2577B1EF8);
  v40 = v55;
  v41 = &v9[*(int *)(v55 + 36)];
  *v41 = v12;
  *((_QWORD *)v41 + 1) = v33;
  *((_QWORD *)v41 + 2) = v35;
  *((_QWORD *)v41 + 3) = v37;
  *((_QWORD *)v41 + 4) = v39;
  v41[40] = 0;
  sub_248AB89E8((uint64_t)v7, &qword_2577B1EF8);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1ED0);
  v43 = sub_248AB8BE8(&qword_2577B1EE0, &qword_2577B1ED0, MEMORY[0x24BDF4700]);
  v44 = sub_248ABD838(&qword_2577B1EE8, &qword_2577B1ED8, (uint64_t (*)(void))sub_248AD218C, MEMORY[0x24BDECC60]);
  v45 = v56;
  v46 = v40;
  sub_248AF56D8();
  sub_248AB89E8((uint64_t)v9, &qword_2577B1ED8);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2060);
  sub_248AF5168();
  v47 = swift_allocObject();
  *(_OWORD *)(v47 + 16) = xmmword_248AF6EC0;
  sub_248AF515C();
  v60 = v42;
  v61 = v46;
  v62 = v43;
  v63 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v44;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v49 = v57;
  MEMORY[0x2495A4CF4](2, v47, v57, OpaqueTypeConformance2);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v45, v49);
}

uint64_t sub_248ACF680@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  *a3 = sub_248AF58F4();
  a3[1] = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2070);
  return sub_248ACF6D4(a1, a2, (char *)a3 + *(int *)(v7 + 44));
}

uint64_t sub_248ACF6D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
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
  char *v18;
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
  unint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t OpaqueTypeConformance2;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  void (*v62)(char *, char *, uint64_t);
  char *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  uint64_t v107;
  char v108;
  __int128 v109;

  v93 = a2;
  v92 = a3;
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2078);
  MEMORY[0x24BDAC7A8](v85);
  v82 = (uint64_t *)((char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2080);
  v87 = *(_QWORD *)(v89 - 8);
  MEMORY[0x24BDAC7A8](v89);
  v83 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2088);
  MEMORY[0x24BDAC7A8](v86);
  v84 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2090);
  v7 = MEMORY[0x24BDAC7A8](v91);
  v88 = (uint64_t)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v90 = (uint64_t)&v70 - v9;
  v81 = type metadata accessor for TipsTryItView();
  v96 = *(_QWORD *)(v81 - 8);
  v10 = *(_QWORD *)(v96 + 64);
  MEMORY[0x24BDAC7A8](v81);
  v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_248AF53E4();
  MEMORY[0x24BDAC7A8](v12);
  v13 = sub_248AF4FC4();
  v72 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2098);
  v16 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v18 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B20A0);
  v76 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v71 = (char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B20A8);
  v80 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v74 = (char *)&v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B20B0);
  v77 = *(_QWORD *)(v99 - 8);
  v21 = MEMORY[0x24BDAC7A8](v99);
  v97 = (char *)&v70 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v98 = (char *)&v70 - v23;
  v78 = a1;
  sub_248AF5060();
  sub_248AF5060();
  sub_248AF58F4();
  sub_248AF5048();
  *(_QWORD *)&v100 = v105;
  BYTE8(v100) = v106;
  *(_QWORD *)&v101 = v107;
  BYTE8(v101) = v108;
  v102 = v109;
  v103 = xmmword_248AF6ED0;
  v104 = 0;
  sub_248AF5414();
  sub_248AF4FA0();
  v24 = v93;
  sub_248AC7574(v93, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  v25 = *(unsigned __int8 *)(v96 + 80);
  v26 = (v25 + 16) & ~v25;
  v94 = v26;
  v95 = v25 | 7;
  v96 = v26 + v10;
  v27 = swift_allocObject();
  sub_248AD36A8((uint64_t)v11, v27 + v26);
  sub_248AB80A8(&qword_2577B20B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB540], MEMORY[0x24BDEB530]);
  sub_248AF5870();
  swift_release();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v15, v13);
  sub_248AF4FE8();
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B20C0);
  v29 = sub_248AD3B24();
  v30 = sub_248AB8BE8(&qword_2577B2118, &qword_2577B2098, MEMORY[0x24BDEC410]);
  v31 = v71;
  v32 = v73;
  sub_248AF5720();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v32);
  v70 = v11;
  sub_248AC7574(v24, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  v33 = swift_allocObject();
  v34 = v94;
  sub_248AD36A8((uint64_t)v11, v33 + v94);
  *(_QWORD *)&v100 = v28;
  *((_QWORD *)&v100 + 1) = v32;
  *(_QWORD *)&v101 = v29;
  *((_QWORD *)&v101 + 1) = v30;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v36 = v74;
  v37 = v75;
  sub_248AF569C();
  swift_release();
  v38 = v37;
  (*(void (**)(char *, uint64_t))(v76 + 8))(v31, v37);
  v39 = v93;
  v40 = (uint64_t)v70;
  sub_248AC7574(v93, (uint64_t)v70, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  v41 = swift_allocObject();
  v42 = v40;
  sub_248AD36A8(v40, v41 + v34);
  *(_QWORD *)&v100 = v38;
  *((_QWORD *)&v100 + 1) = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  v43 = v97;
  v44 = v79;
  sub_248AF56E4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v80 + 8))(v36, v44);
  v45 = v77;
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v98, v43, v99);
  v46 = sub_248AF58DC();
  v47 = (uint64_t)v82;
  *v82 = v46;
  *(_QWORD *)(v47 + 8) = v48;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2120);
  sub_248AD03D0(v39, v78, v47 + *(int *)(v49 + 44));
  type metadata accessor for TrainingManager();
  sub_248AB8BE8(&qword_2577B2128, &qword_2577B2078, MEMORY[0x24BDF4750]);
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  v50 = v83;
  sub_248AF5690();
  sub_248AB89E8(v47, &qword_2577B2078);
  sub_248AF5060();
  sub_248AF5060();
  sub_248AF58F4();
  sub_248AF5048();
  v51 = v87;
  v52 = v84;
  v53 = v50;
  v54 = v89;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v84, v50, v89);
  v55 = &v52[*(int *)(v86 + 36)];
  v56 = (uint64_t)v52;
  v57 = v101;
  *(_OWORD *)v55 = v100;
  *((_OWORD *)v55 + 1) = v57;
  *((_OWORD *)v55 + 2) = v102;
  (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v54);
  sub_248AC7574(v39, v42, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  v58 = swift_allocObject();
  sub_248AD36A8(v42, v58 + v94);
  v59 = v88;
  sub_248AB8870(v56, v88, &qword_2577B2088);
  v60 = (_QWORD *)(v59 + *(int *)(v91 + 36));
  *v60 = 0;
  v60[1] = 0;
  v60[2] = sub_248AD3D14;
  v60[3] = v58;
  sub_248AB89E8(v56, &qword_2577B2088);
  v61 = v90;
  sub_248AD3D48(v59, v90);
  v62 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
  v63 = v97;
  v64 = v98;
  v65 = v99;
  v62(v97, v98, v99);
  sub_248AB8870(v61, v59, &qword_2577B2090);
  v66 = v92;
  v62(v92, v63, v65);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2130);
  sub_248AB8870(v59, (uint64_t)&v66[*(int *)(v67 + 48)], &qword_2577B2090);
  sub_248AB89E8(v61, &qword_2577B2090);
  v68 = *(void (**)(char *, uint64_t))(v45 + 8);
  v68(v64, v65);
  sub_248AB89E8(v59, &qword_2577B2090);
  return ((uint64_t (*)(char *, uint64_t))v68)(v63, v65);
}

uint64_t sub_248AD0088(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t KeyPath;

  v2 = *(_QWORD *)(a2 + *(int *)(type metadata accessor for TipsTryItView() + 44));
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  result = swift_release();
  if ((*(_BYTE *)(v2 + 48) & 1) == 0)
  {
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_248AF4EE0();
    return swift_release();
  }
  return result;
}

uint64_t sub_248AD01A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t KeyPath;

  v1 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for TipsTryItView() + 44));
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  result = swift_release();
  if ((*(_BYTE *)(v1 + 48) & 1) == 0)
  {
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_248AF4EE0();
    return swift_release();
  }
  return result;
}

uint64_t sub_248AD02B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t KeyPath;

  v1 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for TipsTryItView() + 44));
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  result = swift_release();
  if ((*(_BYTE *)(v1 + 48) & 1) == 0)
  {
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_248AF4EE0();
    return swift_release();
  }
  return result;
}

uint64_t sub_248AD03D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _BYTE v25[353];
  _BYTE v26[7];
  _QWORD v27[48];
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[44];
  char v31;
  _BYTE v32[7];
  unint64_t v33;

  v6 = type metadata accessor for InstructionView();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v11 = (uint64_t *)&v25[-v10];
  v12 = (uint64_t *)(a1 + *(int *)(type metadata accessor for TipsTryItView() + 36));
  v13 = *v12;
  v14 = v12[1];
  v27[0] = v13;
  v27[1] = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
  sub_248AF5804();
  v15 = v28;
  v16 = v29;
  v17 = *(double *)v30;
  type metadata accessor for TrainingManager();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  v18 = sub_248AF4FDC();
  sub_248ADFEAC(v18, v19 & 1, v15, v16, v11, v17);
  v20 = sub_248AF58F4();
  v22 = v21;
  sub_248AD061C(a1, a2, (uint64_t)v25);
  LOBYTE(a2) = sub_248AF551C();
  sub_248AC7574((uint64_t)v11, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
  sub_248AC7574((uint64_t)v9, a3, (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
  v23 = (void *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B2138) + 48));
  v27[0] = v20;
  v27[1] = v22;
  memcpy(&v27[2], v25, 0x160uLL);
  LOBYTE(v27[46]) = a2;
  *(_DWORD *)((char *)&v27[46] + 1) = *(_DWORD *)v26;
  HIDWORD(v27[46]) = *(_DWORD *)&v26[3];
  v27[47] = 0xBFF0000000000000;
  memcpy(v23, v27, 0x180uLL);
  sub_248AD3D90((uint64_t)v27);
  sub_248AC75B8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
  v28 = v20;
  v29 = v22;
  memcpy(v30, v25, sizeof(v30));
  v31 = a2;
  *(_DWORD *)v32 = *(_DWORD *)v26;
  *(_DWORD *)&v32[3] = *(_DWORD *)&v26[3];
  v33 = 0xBFF0000000000000;
  sub_248AD3E24((uint64_t)&v28);
  return sub_248AC75B8((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
}

uint64_t sub_248AD061C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t KeyPath;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  _OWORD v42[16];
  _BYTE v43[272];
  _QWORD v44[35];
  _BYTE v45[7];
  char v46;
  _QWORD v47[2];
  char v48;
  _BYTE v49[263];

  v36 = a2;
  v5 = sub_248AF5078();
  v38 = *(_QWORD *)(v5 - 8);
  v39 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v35 = v6;
  v37 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TipsTryItView();
  v33 = *(_QWORD *)(v7 - 8);
  v8 = *(_QWORD *)(v33 + 64);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v34 = (uint64_t)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v31 - v10;
  type metadata accessor for TrainingManager();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  v41 = sub_248AF4FDC();
  v40 = v12;
  v13 = *(_QWORD *)(a1 + *(int *)(v7 + 44));
  swift_getKeyPath();
  v47[0] = v13;
  sub_248AF4EEC();
  swift_release();
  v14 = *(unsigned __int8 *)(v13 + 48);
  sub_248AC7574(a1, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  if (v14 == 1)
  {
    v15 = *(_QWORD *)&v11[*(int *)(v7 + 44)];
    swift_getKeyPath();
    v47[0] = v15;
    sub_248AF4EEC();
    swift_release();
    v16 = *(_BYTE *)(v15 + 50);
  }
  else
  {
    v16 = 0;
  }
  sub_248AC75B8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  KeyPath = swift_getKeyPath();
  v31 = swift_allocObject();
  *(_BYTE *)(v31 + 16) = v16;
  v17 = v34;
  sub_248AC7574(a1, v34, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  v19 = v37;
  v18 = v38;
  v20 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v37, v36, v39);
  v21 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  v22 = (v8 + *(unsigned __int8 *)(v18 + 80) + v21) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v23 = swift_allocObject();
  sub_248AD36A8(v17, v23 + v21);
  (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v23 + v22, v19, v20);
  v24 = sub_248AF58F4();
  v26 = v25;
  v27 = sub_248AF5324();
  sub_248AD0E50(a1, (char *)v42);
  *(_OWORD *)&v43[199] = v42[12];
  *(_OWORD *)&v43[215] = v42[13];
  *(_OWORD *)&v43[231] = v42[14];
  *(_OWORD *)&v43[247] = v42[15];
  *(_OWORD *)&v43[135] = v42[8];
  *(_OWORD *)&v43[151] = v42[9];
  *(_OWORD *)&v43[167] = v42[10];
  *(_OWORD *)&v43[183] = v42[11];
  *(_OWORD *)&v43[71] = v42[4];
  *(_OWORD *)&v43[87] = v42[5];
  *(_OWORD *)&v43[103] = v42[6];
  *(_OWORD *)&v43[119] = v42[7];
  *(_OWORD *)&v43[7] = v42[0];
  *(_OWORD *)&v43[23] = v42[1];
  *(_OWORD *)&v43[39] = v42[2];
  v43[264] = 1;
  *(_OWORD *)&v43[55] = v42[3];
  v44[0] = v27;
  v44[1] = 0;
  LOBYTE(v44[2]) = 1;
  memcpy((char *)&v44[2] + 1, v43, 0x107uLL);
  v46 = v40 & 1;
  memcpy((void *)(a3 + 72), v44, 0x118uLL);
  v28 = v46;
  *(_DWORD *)(a3 + 9) = *(_DWORD *)v45;
  *(_DWORD *)(a3 + 12) = *(_DWORD *)&v45[3];
  *(_QWORD *)a3 = v41;
  *(_BYTE *)(a3 + 8) = v28;
  v29 = v31;
  *(_QWORD *)(a3 + 16) = KeyPath;
  *(_QWORD *)(a3 + 24) = sub_248AD3F20;
  *(_QWORD *)(a3 + 32) = v29;
  *(_QWORD *)(a3 + 40) = sub_248AD417C;
  *(_QWORD *)(a3 + 48) = v23;
  *(_QWORD *)(a3 + 56) = v24;
  *(_QWORD *)(a3 + 64) = v26;
  v47[0] = v27;
  v47[1] = 0;
  v48 = 1;
  memcpy(v49, v43, sizeof(v49));
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_248AD41F4((uint64_t)v44);
  sub_248AD4248((uint64_t)v47);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_248AD0A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
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
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(unint64_t, char *, uint64_t);
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v27 = a3;
  v28 = a1;
  v6 = sub_248AF5078();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - v11;
  v13 = type metadata accessor for TipsTryItView();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_248AF575C();
  sub_248AC7574(a2, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v17(v12, v27, v6);
  v17(v10, v28, v6);
  v18 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v19 = *(unsigned __int8 *)(v7 + 80);
  v20 = (v15 + v19 + v18) & ~v19;
  v21 = (v8 + v19 + v20) & ~v19;
  v22 = swift_allocObject();
  sub_248AD36A8((uint64_t)v16, v22 + v18);
  v23 = v22 + v20;
  v24 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 32);
  v24(v23, v12, v6);
  result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(v22 + v21, v10, v6);
  *a4 = v29;
  a4[1] = (uint64_t)sub_248AD4B28;
  a4[3] = 0;
  a4[4] = 0;
  a4[2] = v22;
  return result;
}

uint64_t sub_248AD0C20(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double MinY;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat MaxY;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  CGRect v44;
  CGRect v45;

  v40 = a2;
  v3 = sub_248AF53E4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_248AF53F0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = type metadata accessor for TipsTryItView();
  v12 = result;
  v13 = *(int *)(result + 44);
  v14 = *(_QWORD *)(a1 + v13);
  MinY = *(double *)(v14 + 64);
  if (MinY != 0.0)
  {
    if (MinY <= 0.0)
    {
      sub_248AF5420();
      sub_248AF506C();
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      v44.origin.x = v17;
      v44.origin.y = v19;
      v44.size.width = v21;
      v44.size.height = v23;
      MinY = CGRectGetMinY(v44);
    }
    sub_248AF5054();
    v24 = (uint64_t *)(a1 + *(int *)(v12 + 36));
    v25 = *v24;
    v26 = v24[1];
    v41 = MinY - v27;
    v42 = v25;
    v43 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
    result = sub_248AF57F8();
    v14 = *(_QWORD *)(a1 + v13);
  }
  if (*(double *)(v14 + 56) != 0.0)
  {
    sub_248AF5414();
    sub_248AF506C();
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v45.origin.x = v29;
    v45.origin.y = v31;
    v45.size.width = v33;
    v45.size.height = v35;
    MaxY = CGRectGetMaxY(v45);
    v37 = (uint64_t *)(a1 + *(int *)(v12 + 40));
    v38 = *v37;
    v39 = v37[1];
    v41 = MaxY * 0.5 - *(double *)(*(_QWORD *)(a1 + v13) + 56);
    v42 = v38;
    v43 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
    return sub_248AF57F8();
  }
  return result;
}

uint64_t sub_248AD0E50@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t (*v23)(_QWORD);
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  _QWORD *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t KeyPath;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t);
  int v54;
  uint64_t v55;
  char *v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  BOOL v71;
  double v72;
  char *v73;
  BOOL v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  char v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  char v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _BOOL4 v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _OWORD v114[9];
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[247];
  char v122;
  _OWORD v123[9];
  char *v124;
  double v125;
  char v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char v131;
  double v132;
  uint64_t v133;
  double v134;
  uint64_t v135;
  char v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;

  v103 = sub_248AF5408();
  v101 = *(_QWORD *)(v103 - 8);
  MEMORY[0x24BDAC7A8](v103);
  v98 = (char *)&v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1470);
  MEMORY[0x24BDAC7A8](v100);
  v102 = (uint64_t)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v99 = (uint64_t)&v98 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v110 = (uint64_t)&v98 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v111 = (uint64_t)&v98 - v11;
  v113 = sub_248AF5318();
  v109 = *(_QWORD *)(v113 - 8);
  v12 = MEMORY[0x24BDAC7A8](v113);
  v107 = (char *)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v105 = (uint64_t)&v98 - v14;
  v15 = type metadata accessor for TipsTryItView();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v108 = (uint64_t)&v98 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v106 = (char *)&v98 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v98 - v21;
  sub_248AC7574(a1, (uint64_t)&v98 - v21, v23);
  v24 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v25 = swift_allocObject();
  sub_248AD36A8((uint64_t)v22, v25 + v24);
  type metadata accessor for TrainingManager();
  v112 = sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  v26 = sub_248AF4FDC();
  v28 = v27;
  v29 = (_QWORD *)(a1 + *(int *)(v15 + 40));
  v30 = v29[1];
  *(_QWORD *)v121 = *v29;
  *(_QWORD *)&v121[8] = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
  sub_248AF57EC();
  v31 = *(double *)v123;
  v32 = sub_248AF58E8();
  sub_248AC1554(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)&v137, 0.0, 1, v31, 0, v32, v33, v26, v28 & 1, (uint64_t)sub_248AD3D14, v25);
  swift_release();
  swift_release();
  v34 = v105;
  sub_248ADB948(v105);
  v35 = v109;
  v36 = (uint64_t)v107;
  v37 = v113;
  (*(void (**)(char *, _QWORD, uint64_t))(v109 + 104))(v107, *MEMORY[0x24BDEEE68], v113);
  v104 = sub_248AD4494(v34, v36);
  v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
  v38(v36, v37);
  v39 = v34;
  v40 = (uint64_t)v106;
  v38(v39, v37);
  KeyPath = swift_getKeyPath();
  LODWORD(v37) = sub_248AF5534();
  v42 = v29[1];
  *(_QWORD *)v121 = *v29;
  *(_QWORD *)&v121[8] = v42;
  sub_248AF57EC();
  v43 = *(double *)v123;
  v113 = a1;
  sub_248AC7574(a1, v40, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  LODWORD(v109) = v37;
  v107 = (char *)KeyPath;
  if (v43 <= 0.0)
  {
    sub_248AC75B8(v40, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
    v45 = v15;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
    sub_248AF5000();
    v44 = *(double *)v121;
    sub_248AC75B8(v40, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
    v45 = v15;
    if (v44 > 0.0)
    {
      v46 = v29[1];
      *(_QWORD *)v121 = *v29;
      *(_QWORD *)&v121[8] = v46;
      sub_248AF57EC();
      sub_248AF5000();
      goto LABEL_12;
    }
  }
  v106 = a2;
  v47 = v111;
  sub_248ADB6C8(v111);
  v48 = v101;
  v49 = v110;
  v50 = v103;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v101 + 104))(v110, *MEMORY[0x24BDEFEE8], v103);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v48 + 56))(v49, 0, 1, v50);
  v51 = v102;
  v52 = v102 + *(int *)(v100 + 48);
  sub_248AB8870(v47, v102, &qword_2577B1300);
  sub_248AB8870(v49, v52, &qword_2577B1300);
  v53 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 48);
  if (v53(v51, 1, v50) == 1)
  {
    sub_248AB89E8(v49, &qword_2577B1300);
    sub_248AB89E8(v47, &qword_2577B1300);
    v54 = v53(v52, 1, v50);
    a2 = v106;
    if (v54 == 1)
    {
      sub_248AB89E8(v51, &qword_2577B1300);
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  v55 = v99;
  sub_248AB8870(v51, v99, &qword_2577B1300);
  if (v53(v52, 1, v50) == 1)
  {
    sub_248AB89E8(v110, &qword_2577B1300);
    sub_248AB89E8(v111, &qword_2577B1300);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v55, v50);
    a2 = v106;
LABEL_10:
    sub_248AB89E8(v51, &qword_2577B1470);
    goto LABEL_12;
  }
  v56 = v98;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v98, v52, v50);
  sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
  sub_248AF5A14();
  v57 = *(void (**)(char *, uint64_t))(v48 + 8);
  v57(v56, v50);
  sub_248AB89E8(v110, &qword_2577B1300);
  sub_248AB89E8(v111, &qword_2577B1300);
  v57((char *)v55, v50);
  sub_248AB89E8(v51, &qword_2577B1300);
  a2 = v106;
LABEL_12:
  sub_248AF4F88();
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v66 = *(int *)(v45 + 44);
  v67 = v113;
  v68 = *(_QWORD *)(v113 + v66);
  swift_getKeyPath();
  *(_QWORD *)v121 = v68;
  sub_248AF4EEC();
  swift_release();
  v69 = *(unsigned __int8 *)(v68 + 53);
  v70 = v108;
  sub_248AC7574(v67, v108, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  if (v69 != 1)
  {
    sub_248AC75B8(v70, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
    v73 = v107;
    v74 = v104;
    goto LABEL_16;
  }
  v71 = sub_248AD5768();
  sub_248AC75B8(v70, (uint64_t (*)(_QWORD))type metadata accessor for TipsTryItView);
  v72 = 1.0;
  v73 = v107;
  v74 = v104;
  if (!v71)
LABEL_16:
    v72 = 0.0;
  if (v74)
    v75 = 0.5;
  else
    v75 = 1.0;
  v136 = 0;
  v76 = sub_248AF593C();
  v77 = *(_QWORD *)(v113 + v66);
  swift_getKeyPath();
  *(_QWORD *)v121 = v77;
  sub_248AF4EEC();
  swift_release();
  v78 = 0.0;
  if (*(_BYTE *)(v77 + 53))
    v78 = 1.0;
  v79 = v136;
  v80 = v143;
  v81 = v144;
  v114[6] = v143;
  v114[7] = v144;
  v82 = v145;
  v114[8] = v145;
  v83 = v139;
  v84 = v140;
  v114[2] = v139;
  v114[3] = v140;
  v86 = v141;
  v85 = v142;
  v114[4] = v141;
  v114[5] = v142;
  v88 = v137;
  v87 = v138;
  v114[0] = v137;
  v114[1] = v138;
  *(_QWORD *)&v115 = v73;
  *((double *)&v115 + 1) = v75;
  v89 = v109;
  LOBYTE(v116) = v109;
  *((_QWORD *)&v116 + 1) = v59;
  *(_QWORD *)&v117 = v61;
  *((_QWORD *)&v117 + 1) = v63;
  *(_QWORD *)&v118 = v65;
  BYTE8(v118) = v136;
  *(double *)&v119 = v72;
  *((_QWORD *)&v119 + 1) = v76;
  *(_OWORD *)&v121[87] = v142;
  *(_OWORD *)&v121[23] = v138;
  *(_OWORD *)&v121[119] = v144;
  *(_OWORD *)&v121[135] = v145;
  *(_OWORD *)&v121[55] = v140;
  *(_OWORD *)&v121[71] = v141;
  *(_OWORD *)&v121[103] = v143;
  *(_OWORD *)&v121[7] = v137;
  *(_OWORD *)&v121[39] = v139;
  *(_OWORD *)&v121[183] = v117;
  *(_OWORD *)&v121[199] = v118;
  *(double *)&v120 = v78;
  *((_QWORD *)&v120 + 1) = 0x4000000000000000;
  *(_OWORD *)&v121[215] = v119;
  *(_OWORD *)&v121[231] = v120;
  *(_OWORD *)&v121[151] = v115;
  *(_OWORD *)&v121[167] = v116;
  v90 = *(_OWORD *)&v121[208];
  *(_OWORD *)(a2 + 201) = *(_OWORD *)&v121[192];
  *(_OWORD *)(a2 + 217) = v90;
  *(_OWORD *)(a2 + 233) = *(_OWORD *)&v121[224];
  v91 = *(_OWORD *)&v121[144];
  *(_OWORD *)(a2 + 137) = *(_OWORD *)&v121[128];
  *(_OWORD *)(a2 + 153) = v91;
  v92 = *(_OWORD *)&v121[176];
  *(_OWORD *)(a2 + 169) = *(_OWORD *)&v121[160];
  *(_OWORD *)(a2 + 185) = v92;
  v93 = *(_OWORD *)&v121[80];
  *(_OWORD *)(a2 + 73) = *(_OWORD *)&v121[64];
  *(_OWORD *)(a2 + 89) = v93;
  v94 = *(_OWORD *)&v121[112];
  *(_OWORD *)(a2 + 105) = *(_OWORD *)&v121[96];
  *(_OWORD *)(a2 + 121) = v94;
  v95 = *(_OWORD *)&v121[16];
  *(_OWORD *)(a2 + 9) = *(_OWORD *)v121;
  *(_OWORD *)(a2 + 25) = v95;
  v96 = *(_OWORD *)&v121[48];
  *(_OWORD *)(a2 + 41) = *(_OWORD *)&v121[32];
  *(_OWORD *)(a2 + 57) = v96;
  v123[6] = v80;
  v123[7] = v81;
  v123[8] = v82;
  v123[2] = v83;
  v123[3] = v84;
  v122 = 1;
  *(_QWORD *)a2 = 0;
  a2[8] = 1;
  *((_QWORD *)a2 + 31) = *(_QWORD *)&v121[239];
  v123[4] = v86;
  v123[5] = v85;
  v123[0] = v88;
  v123[1] = v87;
  v124 = v73;
  v125 = v75;
  v126 = v89;
  v127 = v59;
  v128 = v61;
  v129 = v63;
  v130 = v65;
  v131 = v79;
  v132 = v72;
  v133 = v76;
  v134 = v78;
  v135 = 0x4000000000000000;
  sub_248AD482C((uint64_t)v114);
  return sub_248AD4880((uint64_t)v123);
}

uint64_t sub_248AD181C(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + *(int *)(type metadata accessor for TipsTryItView() + 44))
                 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_presentNextLessonTask))
  {
    swift_retain();
    sub_248AF5BA0();
    swift_release();
  }
  sub_248AD6DF8();
  return sub_248AD6BB4();
}

uint64_t sub_248AD1890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_248AF5144();
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F20);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TipsTryItView();
  sub_248ADB6F4((uint64_t)v3);
  MEMORY[0x2495A4E68](v1);
  sub_248AF5138();
  sub_248AF5840();
  sub_248AB89E8((uint64_t)v3, &qword_2577B1F20);
  return sub_248AD7464();
}

uint64_t sub_248AD1998@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t KeyPath;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v24;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2048);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (uint64_t *)((char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2068);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1698);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2018);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = sub_248AF57A4();
  v15 = sub_248AF557C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v10, 1, 1, v15);
  v16 = sub_248AF55A0();
  sub_248AB89E8((uint64_t)v10, &qword_2577B1698);
  KeyPath = swift_getKeyPath();
  sub_248AF5330();
  v18 = sub_248AF533C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v7, 0, 1, v18);
  v19 = swift_getKeyPath();
  sub_248AB8870((uint64_t)v7, (uint64_t)v4 + *(int *)(v2 + 28), &qword_2577B2068);
  *v4 = v19;
  sub_248AB8870((uint64_t)v4, (uint64_t)v13 + *(int *)(v11 + 36), &qword_2577B2048);
  *v13 = v14;
  v13[1] = KeyPath;
  v13[2] = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_248AB89E8((uint64_t)v4, &qword_2577B2048);
  sub_248AB89E8((uint64_t)v7, &qword_2577B2068);
  swift_release();
  swift_release();
  swift_release();
  v20 = sub_248AF5780();
  v21 = swift_getKeyPath();
  sub_248AB8870((uint64_t)v13, a1, &qword_2577B2018);
  v22 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B2000) + 36));
  *v22 = v21;
  v22[1] = v20;
  return sub_248AB89E8((uint64_t)v13, &qword_2577B2018);
}

uint64_t sub_248AD1C58@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v11;
  uint64_t v12;
  uint64_t OpaqueTypeConformance2;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v18 = a1;
  v2 = sub_248AF545C();
  v17 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EB8);
  v16 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EC0);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1EC8);
  v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1ED0);
  v10 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1ED8);
  v11 = sub_248AB8BE8(&qword_2577B1EE0, &qword_2577B1ED0, MEMORY[0x24BDF4700]);
  v12 = sub_248ABD838(&qword_2577B1EE8, &qword_2577B1ED8, (uint64_t (*)(void))sub_248AD218C, MEMORY[0x24BDECC60]);
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v20 = v8;
  v21 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_248AF50D8();
  sub_248AF5450();
  sub_248AB8BE8(&qword_2577B1F10, &qword_2577B1EB8, MEMORY[0x24BDEC988]);
  sub_248AB80A8(&qword_2577B1F18, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0620], MEMORY[0x24BDF0610]);
  sub_248AF563C();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v7, v5);
}

uint64_t sub_248AD1E7C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  result = swift_release();
  *a2 = *(_QWORD *)(v3 + 32);
  return result;
}

uint64_t sub_248AD1F08()
{
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EE0();
  return swift_release();
}

uint64_t sub_248AD1FAC()
{
  return sub_248AF5204();
}

uint64_t sub_248AD1FCC()
{
  return sub_248AF5204();
}

uint64_t sub_248AD1FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_248AD3994(a1, a2, a3, a4, &qword_2577B1300, MEMORY[0x24BDEE1E0]);
}

uint64_t sub_248AD2000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_248AD3994(a1, a2, a3, a4, &qword_2577B1300, MEMORY[0x24BDEE1E0]);
}

uint64_t type metadata accessor for TipsTryItView()
{
  uint64_t result;

  result = qword_2577B1F98;
  if (!qword_2577B1F98)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_248AD2060()
{
  return sub_248AF51D4();
}

uint64_t sub_248AD2080()
{
  return sub_248AF51A4();
}

uint64_t sub_248AD20A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_248AF5318();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_248AF51B0();
}

unint64_t sub_248AD2120()
{
  unint64_t result;

  result = qword_2577B1EB0;
  if (!qword_2577B1EB0)
  {
    result = MEMORY[0x2495A57B0](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_2577B1EB0);
  }
  return result;
}

uint64_t sub_248AD216C()
{
  uint64_t v0;

  return sub_248AD4D0C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_248AD2184@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_248ACF214(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_248AD218C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B1EF0;
  if (!qword_2577B1EF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1EF8);
    v2[0] = sub_248AB8BE8(&qword_2577B1F00, &qword_2577B1F08, MEMORY[0x24BDF43B0]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B1EF0);
  }
  return result;
}

uint64_t sub_248AD2210()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for TipsTryItView(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  int EnumCaseMultiPayload;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(v4, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v4, a2, v7);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
      }
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v11 = a3[5];
    v12 = (uint64_t *)((char *)v4 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *v12 = *v13;
    if (EnumCaseMultiPayload == 1)
    {
      v12[1] = v13[1];
      swift_retain();
      swift_retain();
      v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F20) + 32);
      v16 = (char *)v12 + v15;
      v17 = (char *)v13 + v15;
      v18 = sub_248AF5144();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v19 = a3[6];
    v20 = (uint64_t *)((char *)v4 + v19);
    v21 = (uint64_t *)((char *)a2 + v19);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v22 = sub_248AF5318();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
    }
    else
    {
      *v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v23 = a3[7];
    v24 = (char *)v4 + v23;
    v25 = (char *)a2 + v23;
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
    v27 = a3[8];
    v28 = a3[9];
    v29 = (char *)v4 + v27;
    v30 = (char *)a2 + v27;
    *v29 = *v30;
    *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
    v31 = (uint64_t *)((char *)v4 + v28);
    v32 = (uint64_t *)((char *)a2 + v28);
    v33 = v32[1];
    *v31 = *v32;
    v31[1] = v33;
    v34 = a3[10];
    v35 = a3[11];
    v36 = (uint64_t *)((char *)v4 + v34);
    v37 = (uint64_t *)((char *)a2 + v34);
    v38 = v37[1];
    *v36 = *v37;
    v36[1] = v38;
    *(uint64_t *)((char *)v4 + v35) = *(uint64_t *)((char *)a2 + v35);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for TipsTryItView(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_248AF5408();
    v5 = *(_QWORD *)(v4 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v6 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v8 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F20) + 32);
    v9 = sub_248AF5144();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
  v10 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_248AF5318();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  v12 = a1 + a2[7];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for TipsTryItView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_248AF5408();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v9 = a3[5];
  v10 = (_QWORD *)((char *)a1 + v9);
  v11 = (_QWORD *)((char *)a2 + v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *v10 = *v11;
  if (EnumCaseMultiPayload == 1)
  {
    v10[1] = v11[1];
    swift_retain();
    swift_retain();
    v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F20) + 32);
    v14 = (char *)v10 + v13;
    v15 = (char *)v11 + v13;
    v16 = sub_248AF5144();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  else
  {
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v17 = a3[6];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v20 = sub_248AF5318();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  }
  else
  {
    *v18 = *v19;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v21 = a3[7];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  v25 = a3[8];
  v26 = a3[9];
  v27 = (char *)a1 + v25;
  v28 = (char *)a2 + v25;
  *v27 = *v28;
  *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
  v29 = (_QWORD *)((char *)a1 + v26);
  v30 = (_QWORD *)((char *)a2 + v26);
  v31 = v30[1];
  *v29 = *v30;
  v29[1] = v31;
  v32 = a3[10];
  v33 = a3[11];
  v34 = (_QWORD *)((char *)a1 + v32);
  v35 = (_QWORD *)((char *)a2 + v32);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  *(_QWORD *)((char *)a1 + v33) = *(_QWORD *)((char *)a2 + v33);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for TipsTryItView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_248AF5408();
      v7 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    sub_248AB89E8((uint64_t)a1 + v9, &qword_2577B1EA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *v10 = *v11;
    if (EnumCaseMultiPayload == 1)
    {
      v10[1] = v11[1];
      swift_retain();
      swift_retain();
      v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F20) + 32);
      v14 = (char *)v10 + v13;
      v15 = (char *)v11 + v13;
      v16 = sub_248AF5144();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v17 = a3[6];
    v18 = (_QWORD *)((char *)a1 + v17);
    v19 = (_QWORD *)((char *)a2 + v17);
    sub_248AB89E8((uint64_t)a1 + v17, &qword_2577B1EA8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v20 = sub_248AF5318();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    }
    else
    {
      *v18 = *v19;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v21 = a3[7];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  v25 = a3[8];
  v26 = (char *)a1 + v25;
  v27 = (char *)a2 + v25;
  *v26 = *v27;
  *((_QWORD *)v26 + 1) = *((_QWORD *)v27 + 1);
  swift_retain();
  swift_release();
  v28 = a3[9];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_retain();
  swift_release();
  v31 = a3[10];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  swift_retain();
  swift_release();
  return a1;
}

char *initializeWithTake for TipsTryItView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_248AF5408();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v10 = a3[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = *((_QWORD *)v12 + 1);
    *(_QWORD *)v11 = *(_QWORD *)v12;
    *((_QWORD *)v11 + 1) = v14;
    v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F20) + 32);
    v16 = &v11[v15];
    v17 = &v12[v15];
    v18 = sub_248AF5144();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  v19 = a3[6];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v23 = sub_248AF5318();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v20, v21, v23);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  v24 = a3[7];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v25, v26, v27);
  v28 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  *(_OWORD *)&a1[v28] = *(_OWORD *)&a2[v28];
  v29 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  *(_QWORD *)&a1[v29] = *(_QWORD *)&a2[v29];
  return a1;
}

char *assignWithTake for TipsTryItView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v10 = a3[5];
    v11 = &a1[v10];
    v12 = &a2[v10];
    sub_248AB89E8((uint64_t)&a1[v10], &qword_2577B1EA0);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = *((_QWORD *)v12 + 1);
      *(_QWORD *)v11 = *(_QWORD *)v12;
      *((_QWORD *)v11 + 1) = v14;
      v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F20) + 32);
      v16 = &v11[v15];
      v17 = &v12[v15];
      v18 = sub_248AF5144();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    v19 = a3[6];
    v20 = &a1[v19];
    v21 = &a2[v19];
    sub_248AB89E8((uint64_t)&a1[v19], &qword_2577B1EA8);
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v23 = sub_248AF5318();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v20, v21, v23);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
  }
  v24 = a3[7];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 40))(v25, v26, v27);
  v28 = a3[8];
  v29 = &a1[v28];
  v30 = &a2[v28];
  *v29 = *v30;
  *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
  swift_release();
  v31 = a3[9];
  v32 = &a1[v31];
  v33 = &a2[v31];
  *(_QWORD *)v32 = *(_QWORD *)v33;
  *((_QWORD *)v32 + 1) = *((_QWORD *)v33 + 1);
  swift_release();
  v34 = a3[10];
  v35 = &a1[v34];
  v36 = &a2[v34];
  *(_QWORD *)v35 = *(_QWORD *)v36;
  *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
  swift_release();
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TipsTryItView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AD320C(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v15;
  unint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F30);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_9:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F38);
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_9;
  }
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
  v12 = *(_QWORD *)(v15 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v15;
    v13 = a3[7];
    goto LABEL_9;
  }
  v17 = *(_QWORD *)(a1 + a3[11]);
  if (v17 >= 0xFFFFFFFF)
    LODWORD(v17) = -1;
  return (v17 + 1);
}

uint64_t storeEnumTagSinglePayload for TipsTryItView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AD3318(uint64_t a1, uint64_t a2, int a3, int *a4)
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
  uint64_t result;

  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F30);
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_9:
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F38);
  v14 = *(_QWORD *)(v16 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v16;
    v15 = a4[6];
    goto LABEL_9;
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[7];
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + a4[11]) = (a2 - 1);
  return result;
}

void sub_248AD3414()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_248AD350C(319, qword_2577B1378, &qword_2577B1300);
  if (v0 <= 0x3F)
  {
    sub_248AD350C(319, &qword_2577B1FA8, &qword_2577B1F20);
    if (v1 <= 0x3F)
    {
      sub_248AD3558();
      if (v2 <= 0x3F)
      {
        sub_248AD35AC();
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_248AD350C(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_248AF4FD0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_248AD3558()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2577B1FB0)
  {
    sub_248AF5318();
    v0 = sub_248AF4FD0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2577B1FB0);
  }
}

void sub_248AD35AC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2577B1FB8[0])
  {
    sub_248AD2120();
    v0 = sub_248AF500C();
    if (!v1)
      atomic_store(v0, qword_2577B1FB8);
  }
}

uint64_t sub_248AD3604()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1EB8);
  sub_248AF545C();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF0620];
  sub_248AB8BE8(&qword_2577B1F10, &qword_2577B1EB8, MEMORY[0x24BDEC988]);
  sub_248AB80A8(&qword_2577B1F18, v0, MEMORY[0x24BDF0610]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248AD36A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TipsTryItView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248AD36EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TipsTryItView() - 8) + 80);
  return sub_248ACF680(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_248AD373C()
{
  return sub_248AD3CC4((uint64_t (*)(uint64_t))sub_248AD1890);
}

unint64_t sub_248AD3748()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2008;
  if (!qword_2577B2008)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2000);
    v2[0] = sub_248AD37CC();
    v2[1] = sub_248AB8BE8(&qword_2577B2050, &qword_2577B2058, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2008);
  }
  return result;
}

unint64_t sub_248AD37CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2010;
  if (!qword_2577B2010)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2018);
    v2[0] = sub_248AD3850();
    v2[1] = sub_248AB8BE8(&qword_2577B2040, &qword_2577B2048, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2010);
  }
  return result;
}

unint64_t sub_248AD3850()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2577B2020;
  if (!qword_2577B2020)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2028);
    v2 = sub_248AB8BE8(&qword_2577B2030, &qword_2577B2038, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2577B2020);
  }
  return result;
}

uint64_t sub_248AD38D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_248AF5234();
  *a1 = result;
  return result;
}

uint64_t sub_248AD38FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_248AF5234();
  *a1 = result;
  return result;
}

uint64_t sub_248AD3924()
{
  swift_retain();
  return sub_248AF5240();
}

uint64_t sub_248AD394C()
{
  swift_retain();
  return sub_248AF5240();
}

uint64_t sub_248AD3974()
{
  return sub_248AF5210();
}

uint64_t sub_248AD3994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(char *))
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AB8870(a1, (uint64_t)v11, a5);
  return a6(v11);
}

uint64_t sub_248AD3A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_248AD3994(a1, a2, a3, a4, &qword_2577B2068, MEMORY[0x24BDEE1F8]);
}

uint64_t sub_248AD3A44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_248AF51BC();
  *a1 = result;
  return result;
}

uint64_t sub_248AD3A6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_248AF51BC();
  *a1 = result;
  return result;
}

uint64_t sub_248AD3A94()
{
  swift_retain();
  return sub_248AF51C8();
}

uint64_t sub_248AD3ABC()
{
  swift_retain();
  return sub_248AF51C8();
}

uint64_t sub_248AD3AE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TipsTryItView() - 8) + 80);
  return sub_248AD0088(a1, v1 + ((v3 + 16) & ~v3));
}

unint64_t sub_248AD3B24()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B20C8;
  if (!qword_2577B20C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B20C0);
    v2[0] = sub_248AD3BA8();
    v2[1] = sub_248AB8BE8(&qword_2577B18D0, &qword_2577B18D8, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B20C8);
  }
  return result;
}

unint64_t sub_248AD3BA8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B20D0;
  if (!qword_2577B20D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B20D8);
    v2[0] = sub_248ABD838(&qword_2577B20E0, &qword_2577B20E8, sub_248AD3C4C, MEMORY[0x24BDECC38]);
    v2[1] = sub_248AB8BE8(&qword_2577B2108, &qword_2577B2110, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B20D0);
  }
  return result;
}

uint64_t sub_248AD3C4C()
{
  return sub_248ABD838(&qword_2577B20F0, &qword_2577B20F8, (uint64_t (*)(void))sub_248AD3C70, MEMORY[0x24BDEBEE0]);
}

unint64_t sub_248AD3C70()
{
  unint64_t result;

  result = qword_2577B2100;
  if (!qword_2577B2100)
  {
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDF52D0], MEMORY[0x24BDF52F8]);
    atomic_store(result, (unint64_t *)&qword_2577B2100);
  }
  return result;
}

uint64_t sub_248AD3CB8()
{
  return sub_248AD3CC4(sub_248AD01A0);
}

uint64_t sub_248AD3CC4(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TipsTryItView() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_248AD3D04()
{
  return sub_248AD3CC4(sub_248AD02B8);
}

uint64_t sub_248AD3D18()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TipsTryItView() - 8) + 80);
  return sub_248AD181C(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_248AD3D48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248AD3D90(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_248AD3E24(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_248AD3EC0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_248AF524C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_248AD3EEC()
{
  return sub_248AF5258();
}

uint64_t sub_248AD3F10()
{
  return swift_deallocObject();
}

_BYTE *sub_248AD3F20(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_248AD3F38()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v1 = (int *)type metadata accessor for TipsTryItView();
  v2 = *((_QWORD *)v1 - 1);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v19 = *(_QWORD *)(v2 + 64);
  v4 = sub_248AF5078();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_248AF5408();
    v9 = *(_QWORD *)(v8 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v0 + v3, 1, v8))
      (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v0 + v3, v8);
  }
  else
  {
    swift_release();
  }
  v10 = v7 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v12 = v10 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F20) + 32);
    v13 = sub_248AF5144();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  }
  v14 = v7 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_248AF5318();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  v16 = v7 + v1[7];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + ((v3 + v19 + v6) & ~v6), v4);
  return swift_deallocObject();
}

uint64_t sub_248AD417C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(type metadata accessor for TipsTryItView() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(sub_248AF5078() - 8) + 80);
  return sub_248AD0A80(a1, v2 + v6, v2 + ((v6 + v7 + v8) & ~v8), a2);
}

uint64_t sub_248AD41F4(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_248AD4248(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t objectdestroyTm_3()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = (int *)type metadata accessor for TipsTryItView();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = (v2 + 16) & ~v2;
  v4 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_248AF5408();
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5))
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  v7 = v4 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v9 = v7 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F20) + 32);
    v10 = sub_248AF5144();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  v11 = v4 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_248AF5318();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  }
  else
  {
    swift_release();
  }
  v13 = v4 + v1[7];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

BOOL sub_248AD4494(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t (*v12)(char *, uint64_t);
  int v13;
  unint64_t v14;
  int v15;
  _DWORD *v16;
  int v17;
  unint64_t v18;
  uint64_t v20;

  v4 = sub_248AF5318();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v20 - v9, a2, v4);
  v12 = *(uint64_t (**)(char *, uint64_t))(v5 + 88);
  v13 = v12(v10, v4);
  v14 = 0;
  v15 = *MEMORY[0x24BDEEE58];
  v16 = (_DWORD *)MEMORY[0x24BDEEE90];
  if (v13 != *MEMORY[0x24BDEEE58])
  {
    if (v13 == *MEMORY[0x24BDEEE90])
    {
      v14 = 1;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x24BDEEE98])
    {
      v14 = 2;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x24BDEEE88])
      goto LABEL_7;
    if (v13 == *MEMORY[0x24BDEEE50])
    {
      v14 = 4;
    }
    else if (v13 == *MEMORY[0x24BDEEE60])
    {
      v14 = 5;
    }
    else if (v13 == *MEMORY[0x24BDEEE30])
    {
      v14 = 6;
    }
    else if (v13 == *MEMORY[0x24BDEEE70])
    {
      v14 = 7;
    }
    else if (v13 == *MEMORY[0x24BDEEE68])
    {
      v14 = 8;
    }
    else if (v13 == *MEMORY[0x24BDEEE78])
    {
      v14 = 9;
    }
    else if (v13 == *MEMORY[0x24BDEEE40])
    {
      v14 = 10;
    }
    else
    {
      if (v13 != *MEMORY[0x24BDEEE48])
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_7:
        v14 = 3;
        goto LABEL_24;
      }
      v14 = 11;
    }
  }
LABEL_24:
  v11(v8, a1, v4);
  v17 = v12(v8, v4);
  if (v17 == v15)
  {
    v18 = 0;
  }
  else if (v17 == *v16)
  {
    v18 = 1;
  }
  else if (v17 == *MEMORY[0x24BDEEE98])
  {
    v18 = 2;
  }
  else
  {
    if (v17 != *MEMORY[0x24BDEEE88])
    {
      if (v17 == *MEMORY[0x24BDEEE50])
      {
        v18 = 4;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE60])
      {
        v18 = 5;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE30])
      {
        v18 = 6;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE70])
      {
        v18 = 7;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE68])
      {
        v18 = 8;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE78])
      {
        v18 = 9;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE40])
      {
        v18 = 10;
        return v14 < v18;
      }
      if (v17 == *MEMORY[0x24BDEEE48])
      {
        v18 = 11;
        return v14 < v18;
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v18 = 3;
  }
  return v14 < v18;
}

uint64_t sub_248AD482C(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_248AD4880(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_248AD48D4()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(unint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;

  v1 = (int *)type metadata accessor for TipsTryItView();
  v2 = *((_QWORD *)v1 - 1);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_248AF5078();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v22 = *(_QWORD *)(v6 + 64);
  v23 = v5;
  v8 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_248AF5408();
    v10 = *(_QWORD *)(v9 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v10 + 48))(v0 + v3, 1, v9))
      (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v0 + v3, v9);
  }
  else
  {
    swift_release();
  }
  v11 = v8 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    v13 = v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F20) + 32);
    v14 = sub_248AF5144();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  }
  v15 = v8 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = sub_248AF5318();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  }
  else
  {
    swift_release();
  }
  v17 = (v3 + v4 + v7) & ~v7;
  v18 = v8 + v1[7];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1F28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v20 = *(void (**)(unint64_t, uint64_t))(v6 + 8);
  v20(v0 + v17, v23);
  v20(v0 + ((v22 + v7 + v17) & ~v7), v23);
  return swift_deallocObject();
}

uint64_t sub_248AD4B28()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for TipsTryItView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_248AF5078() - 8) + 80);
  return sub_248AD0C20(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

uint64_t sub_248AD4BA4()
{
  uint64_t v0;

  return sub_248AD4F7C(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_248AD4BC4()
{
  return sub_248AD4BA4();
}

uint64_t sub_248AD4BD8()
{
  return sub_248AD216C();
}

uint64_t sub_248AD4BEC()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_248AD4C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_248AD4CA0()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  return *(_QWORD *)(v0 + 32);
}

uint64_t sub_248AD4D0C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = a2;
  return result;
}

uint64_t sub_248AD4D14()
{
  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  return swift_bridgeObjectRetain();
}

uint64_t sub_248AD4D84@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t sub_248AD4DFC()
{
  swift_getKeyPath();
  sub_248AD7BAC();
  swift_bridgeObjectRetain();
  sub_248AF4EE0();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_248AD4E9C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_248AD4F08(uint64_t result, char a2)
{
  *(_BYTE *)(result + 48) = a2;
  return result;
}

uint64_t sub_248AD4F10()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t sub_248AD4F7C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 49) = a2;
  return result;
}

uint64_t sub_248AD4F84()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 50);
}

uint64_t sub_248AD4FF0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 50) = a2;
  return result;
}

uint64_t sub_248AD4FF8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 51);
}

uint64_t sub_248AD5064(uint64_t result, char a2)
{
  *(_BYTE *)(result + 51) = a2;
  return result;
}

uint64_t sub_248AD506C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 52);
}

uint64_t sub_248AD50D8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 52) = a2;
  return result;
}

uint64_t sub_248AD50E0()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  return *(unsigned __int8 *)(v0 + 53);
}

uint64_t sub_248AD514C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 53);
  return result;
}

uint64_t sub_248AD51C0()
{
  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EE0();
  return swift_release();
}

uint64_t sub_248AD5250(uint64_t result, char a2)
{
  *(_BYTE *)(result + 53) = a2;
  return result;
}

uint64_t sub_248AD5258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v10;
  _QWORD *v11;

  v10 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v10);
  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EE0();
  swift_release();
  swift_getKeyPath();
  sub_248AF4EEC();
  swift_release();
  TryItLesson.initialInstruction.getter(*(_QWORD *)(v7 + 32));
  sub_248AF5A74();
  swift_getKeyPath();
  sub_248AF4EE0();
  swift_bridgeObjectRelease();
  swift_release();
  swift_getKeyPath();
  sub_248AF4EEC();
  swift_release();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_248AF4EE0();
  swift_bridgeObjectRelease();
  swift_release();
  v11 = (_QWORD *)(v7 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys);
  *v11 = a2;
  v11[1] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[2] = a4;
  v11[3] = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[4] = a6;
  v11[5] = a7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return sub_248AD7318();
}

uint64_t sub_248AD54C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v8 = v7;
  v27 = a6;
  v28 = a7;
  v25 = a4;
  v26 = a5;
  v23 = a2;
  v24 = a3;
  v10 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v10);
  if (*(_QWORD *)(a1 + 16))
    v11 = *(_QWORD *)(a1 + 32);
  else
    v11 = 0;
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  *(&v23 - 2) = v8;
  *(&v23 - 1) = v11;
  v29 = v8;
  sub_248AD7BAC();
  sub_248AF4EE0();
  swift_release();
  swift_getKeyPath();
  v29 = v8;
  sub_248AF4EEC();
  swift_release();
  TryItLesson.initialInstruction.getter(*(_QWORD *)(v8 + 32));
  v13 = sub_248AF5A74();
  v15 = v14;
  v16 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v16);
  *(&v23 - 4) = v8;
  *(&v23 - 3) = v13;
  *(&v23 - 2) = v15;
  v29 = v8;
  sub_248AF4EE0();
  swift_bridgeObjectRelease();
  swift_release();
  v17 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v17);
  *(&v23 - 2) = v8;
  *(&v23 - 1) = a1;
  v29 = v8;
  swift_bridgeObjectRetain();
  sub_248AF4EE0();
  swift_bridgeObjectRelease();
  swift_release();
  v18 = (_QWORD *)(v8 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys);
  v19 = v24;
  *v18 = v23;
  v18[1] = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = v26;
  v18[2] = v25;
  v18[3] = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = v28;
  v18[4] = v27;
  v18[5] = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return sub_248AD7318();
}

BOOL sub_248AD5768()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  v1 = *(_QWORD *)(v0 + 32);
  swift_getKeyPath();
  sub_248AF4EEC();
  swift_release();
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3 && v1 == *(_QWORD *)(v2 + 8 * v3 + 24))
  {
    return 1;
  }
  else
  {
    swift_getKeyPath();
    sub_248AF4EEC();
    swift_release();
    return sub_248AD5870(*(_QWORD **)(v0 + 40), MEMORY[0x24BEE4AF8]);
  }
}

BOOL sub_248AD5870(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v12;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (a1[4] != a2[4])
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = a1 + 5;
  v6 = a2 + 5;
  do
  {
    v8 = *v5++;
    v7 = v8;
    v10 = *v6++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

BOOL sub_248AD58E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  double *v5;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(double *)(a1 + 32) != *(double *)(a2 + 32))
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = (double *)(a1 + 40);
  v6 = (double *)(a2 + 40);
  do
  {
    v7 = *v5++;
    v8 = v7;
    v9 = *v6++;
    v10 = v9;
    v12 = v4-- != 0;
    result = v8 == v10;
  }
  while (v8 == v10 && v12);
  return result;
}

uint64_t sub_248AD5958(char a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;

  v4 = v3;
  v40 = a2;
  v41 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2550);
  MEMORY[0x24BDAC7A8](v6);
  v35 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v8);
  v38 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_248AF4E2C();
  v36 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v37 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v12);
  v13 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v13);
  v34 = OBJC_IVAR____TtC9TipsTryIt15TrainingManager_presentNextLessonTask;
  if (*(_QWORD *)(v4 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_presentNextLessonTask))
  {
    swift_retain();
    sub_248AF5BA0();
    swift_release();
  }
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  *(&v34 - 2) = v4;
  *((_BYTE *)&v34 - 8) = a1 & 1;
  v15 = v4 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager___observationRegistrar;
  v42 = v4;
  sub_248AD7BAC();
  v39 = v15;
  sub_248AF4EE0();
  swift_release();
  sub_248AF5A20();
  if (qword_2577B10B0 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v10, (uint64_t)qword_2577B5078);
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v37, v16, v10);
  sub_248AF4EC8();
  sub_248AF4E44();
  v17 = sub_248AF5A74();
  v19 = v18;
  v20 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v20);
  *(&v34 - 4) = v4;
  *(&v34 - 3) = v17;
  *(&v34 - 2) = v19;
  v42 = v4;
  sub_248AF4EE0();
  swift_bridgeObjectRelease();
  swift_release();
  v21 = v4 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
  *(_QWORD *)(v21 + 48) = 0;
  *(_QWORD *)(v21 + 56) = 0;
  swift_bridgeObjectRelease();
  sub_248AD76B0();
  *(_QWORD *)(v21 + 48) = 0;
  *(_QWORD *)(v21 + 56) = 0;
  swift_bridgeObjectRelease();
  v22 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v22);
  *(&v34 - 2) = v4;
  *((_BYTE *)&v34 - 8) = 0;
  v42 = v4;
  sub_248AF4EE0();
  swift_release();
  v23 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v23);
  *(&v34 - 2) = v4;
  *((_BYTE *)&v34 - 8) = v40 & 1;
  v42 = v4;
  sub_248AF4EE0();
  result = swift_release();
  if ((v41 & 1) != 0)
  {
    v25 = *(_QWORD *)(v21 + 72);
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (!v26)
    {
      *(_QWORD *)(v21 + 72) = v27;
      *(_BYTE *)(v21 + 89) = 1;
LABEL_10:
      v30 = sub_248AF5B94();
      v31 = (uint64_t)v35;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v35, 1, 1, v30);
      v32 = (_QWORD *)swift_allocObject();
      v32[2] = 0;
      v32[3] = 0;
      v32[4] = v4;
      swift_retain();
      v33 = sub_248AE9D80(v31, (uint64_t)&unk_2577B2570, (uint64_t)v32);
      *(_QWORD *)(v4 + v34) = v33;
      return swift_release();
    }
    __break(1u);
  }
  else
  {
    v28 = *(_QWORD *)(v21 + 64);
    v26 = __OFADD__(v28, 1);
    v29 = v28 + 1;
    if (!v26)
    {
      *(_QWORD *)(v21 + 64) = v29;
      *(_BYTE *)(v21 + 88) = 1;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_248AD5E78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[3] = a4;
  v5 = sub_248AF5CD8();
  v4[4] = v5;
  v4[5] = *(_QWORD *)(v5 - 8);
  v4[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_248AD5ED8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  sub_248AF5CCC();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2577B1918 + dword_2577B1918);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_248AD5F58;
  return v3(2000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_248AD5F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t sub_248AD5FD8()
{
  uint64_t v0;

  sub_248AD6728();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AD6010()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  _BOOL4 v3;
  void *v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8;

  if (qword_2577B10D8 != -1)
    swift_once();
  v1 = (id)qword_2577B3500;
  v2 = sub_248AF5BDC();
  v3 = os_log_type_enabled(v1, v2);
  v4 = *(void **)(v0 + 64);
  if (v3)
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v8 = v6;
    *(_DWORD *)v5 = 136315138;
    *(_QWORD *)(v0 + 16) = sub_248AF3998(0xD000000000000038, 0x8000000248AF8B70, &v8);
    sub_248AF5C54();
    _os_log_impl(&dword_248AB5000, v1, v2, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A581C](v6, -1, -1);
    MEMORY[0x2495A581C](v5, -1, -1);
  }

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AD6194(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t KeyPath;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  void (*v30)(_QWORD);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(_QWORD);
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;

  v4 = v3;
  v57 = a3;
  v54 = a1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2550);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  MEMORY[0x24BDAC7A8](v9);
  v56 = (uint64_t)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_248AF4E2C();
  v53 = *(void (**)(_QWORD))(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_248AF5A2C();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v59 = (char *)&v46 - v21;
  v22 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v22);
  v55 = (char *)&v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = OBJC_IVAR____TtC9TipsTryIt15TrainingManager_delayedInstructionTask;
  if (*(_QWORD *)(v3 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_delayedInstructionTask))
  {
    swift_retain();
    sub_248AF5BA0();
    swift_release();
  }
  v61 = v15;
  v58 = v13;
  if ((a2 & 1) != 0)
  {
    v24 = v3 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
    *(_OWORD *)(v3 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 48) = xmmword_248AF71B0;
    swift_bridgeObjectRelease();
    sub_248AD76B0();
    *(_QWORD *)(v24 + 48) = 0;
    *(_QWORD *)(v24 + 56) = 0;
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  v62 = v3;
  sub_248AD7BAC();
  sub_248AF4EEC();
  result = swift_release();
  if ((*(_BYTE *)(v3 + 48) & 1) == 0)
  {
    v48 = v20;
    v49 = v8;
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    *(&v46 - 2) = v3;
    *((_BYTE *)&v46 - 8) = a2 & 1;
    v62 = v3;
    v50 = MEMORY[0x24BEE4AE0] + 8;
    sub_248AF4EE0();
    swift_release();
    v51 = v17;
    v27 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    v28 = v54;
    v54 = v16;
    v47 = v27;
    v27(v59, (char *)v28, v16);
    if (qword_2577B10B0 != -1)
      swift_once();
    v29 = __swift_project_value_buffer(v60, (uint64_t)qword_2577B5078);
    v30 = (void (*)(_QWORD))*((_QWORD *)v53 + 2);
    v46 = v29;
    v53 = v30;
    v30(v61);
    sub_248AF4EC8();
    sub_248AF4E44();
    v31 = sub_248AF5A74();
    v33 = v32;
    v34 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v34);
    *(&v46 - 4) = v3;
    *(&v46 - 3) = v31;
    *(&v46 - 2) = v33;
    v62 = v3;
    sub_248AF4EE0();
    swift_bridgeObjectRelease();
    swift_release();
    v35 = v56;
    sub_248AD7C98(v57, v56);
    v36 = v51;
    v37 = v54;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v35, 1, v54) == 1)
    {
      return sub_248AD7CE0(v35);
    }
    else
    {
      v38 = v48;
      (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(v48, v35, v37);
      v47(v59, v38, v37);
      ((void (*)(char *, uint64_t, uint64_t))v53)(v61, v46, v60);
      sub_248AF4EC8();
      sub_248AF4E44();
      v39 = sub_248AF5A74();
      v41 = v40;
      v42 = sub_248AF5B94();
      v43 = (uint64_t)v49;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(v49, 1, 1, v42);
      v44 = (_QWORD *)swift_allocObject();
      v44[2] = 0;
      v44[3] = 0;
      v44[4] = v4;
      v44[5] = v39;
      v44[6] = v41;
      swift_retain();
      v45 = sub_248AE9D80(v43, (uint64_t)&unk_2577B2560, (uint64_t)v44);
      *(_QWORD *)(v4 + v52) = v45;
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v38, v37);
    }
  }
  return result;
}

void sub_248AD6728()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t KeyPath;
  NSObject *v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15[2];

  v1 = v0;
  swift_getKeyPath();
  v15[0] = v0;
  sub_248AD7BAC();
  sub_248AF4EEC();
  swift_release();
  v2 = *(_QWORD *)(v0 + 40);
  swift_getKeyPath();
  v15[0] = v0;
  swift_bridgeObjectRetain();
  sub_248AF4EEC();
  swift_release();
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    if (qword_2577B10D8 != -1)
      swift_once();
    v15[0] = 0;
    v15[1] = 0xE000000000000000;
    v10 = (id)qword_2577B3500;
    sub_248AF5C9C();
    sub_248AF5AB0();
    swift_getKeyPath();
    sub_248AF4EEC();
    swift_release();
    sub_248AF5A80();
    sub_248AF5AB0();
    swift_bridgeObjectRelease();
    sub_248AF5AB0();
    swift_getKeyPath();
    sub_248AF4EEC();
    swift_release();
    v11 = swift_bridgeObjectRetain();
    MEMORY[0x2495A515C](v11, &type metadata for TryItLesson);
    sub_248AF5AB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12 = sub_248AF5BC4();
    if (os_log_type_enabled(v10, v12))
    {
      swift_bridgeObjectRetain_n();
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v15[0] = v14;
      *(_DWORD *)v13 = 136315138;
      swift_bridgeObjectRetain();
      sub_248AF3998(0, 0xE000000000000000, v15);
      sub_248AF5C54();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_248AB5000, v10, v12, "%s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495A581C](v14, -1, -1);
      MEMORY[0x2495A581C](v13, -1, -1);
    }
    swift_bridgeObjectRelease();

    return;
  }
  v4 = *(_QWORD *)(v0 + 32);
  if (*(_QWORD *)(v2 + 32) != v4)
  {
    v5 = 0;
    v6 = v3 - 1;
    while (v6 != v5)
    {
      v7 = *(_QWORD *)(v2 + 40 + 8 * v5++);
      if (v7 == v4)
        goto LABEL_7;
    }
    goto LABEL_12;
  }
  v5 = 0;
LABEL_7:
  swift_bridgeObjectRelease();
  v8 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    goto LABEL_19;
  }
  swift_getKeyPath();
  v15[0] = v1;
  sub_248AF4EEC();
  swift_release();
  if ((int64_t)v8 < *(_QWORD *)(*(_QWORD *)(v1 + 40) + 16))
  {
    swift_getKeyPath();
    v15[0] = v1;
    sub_248AF4EEC();
    swift_release();
    if ((v8 & 0x8000000000000000) == 0)
    {
      if (v8 < *(_QWORD *)(*(_QWORD *)(v1 + 40) + 16))
      {
        KeyPath = swift_getKeyPath();
        MEMORY[0x24BDAC7A8](KeyPath);
        v15[0] = v1;
        sub_248AF4EE0();
        swift_release();
        sub_248AD6BB4();
        return;
      }
      goto LABEL_20;
    }
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
  }
}

uint64_t sub_248AD6BB4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v1);
  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EE0();
  swift_release();
  swift_getKeyPath();
  sub_248AF4EE0();
  swift_release();
  swift_getKeyPath();
  sub_248AF4EE0();
  swift_release();
  swift_getKeyPath();
  sub_248AF4EEC();
  swift_release();
  TryItLesson.initialInstruction.getter(*(_QWORD *)(v0 + 32));
  sub_248AF5A74();
  swift_getKeyPath();
  sub_248AF4EE0();
  swift_bridgeObjectRelease();
  swift_release();
  swift_getKeyPath();
  sub_248AF4EE0();
  return swift_release();
}

uint64_t sub_248AD6DF8()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;

  swift_getKeyPath();
  sub_248AD7BAC();
  sub_248AF4EEC();
  result = swift_release();
  if (*(_QWORD *)(*(_QWORD *)(v0 + 40) + 16))
  {
    swift_getKeyPath();
    sub_248AF4EEC();
    swift_release();
    v2 = *(_QWORD *)(v0 + 32);
    swift_getKeyPath();
    sub_248AF4EEC();
    result = swift_release();
    v3 = *(_QWORD *)(v0 + 40);
    v4 = *(_QWORD *)(v3 + 16);
    if (v4)
    {
      if (v2 == *(_QWORD *)(v3 + 8 * v4 + 24))
      {
        KeyPath = swift_getKeyPath();
        MEMORY[0x24BDAC7A8](KeyPath);
        sub_248AF4EE0();
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t sub_248AD6F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  v7 = sub_248AF5CD8();
  v6[7] = v7;
  v6[8] = *(_QWORD *)(v7 - 8);
  v6[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_248AD6FC4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  sub_248AF5CCC();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2577B1918 + dword_2577B1918);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_248AD7044;
  return v3(2000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_248AD7044()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[8] + 8))(v2[9], v2[7]);
  return swift_task_switch();
}

uint64_t sub_248AD70B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  swift_getKeyPath();
  v4 = (_QWORD *)swift_task_alloc();
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  *(_QWORD *)(v0 + 24) = v3;
  sub_248AD7BAC();
  swift_bridgeObjectRetain();
  sub_248AF4EE0();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AD7194()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  _BOOL4 v3;
  void *v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8;

  if (qword_2577B10D8 != -1)
    swift_once();
  v1 = (id)qword_2577B3500;
  v2 = sub_248AF5BDC();
  v3 = os_log_type_enabled(v1, v2);
  v4 = *(void **)(v0 + 88);
  if (v3)
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v8 = v6;
    *(_DWORD *)v5 = 136315138;
    *(_QWORD *)(v0 + 16) = sub_248AF3998(0xD00000000000002BLL, 0x8000000248AF8B40, &v8);
    sub_248AF5C54();
    _os_log_impl(&dword_248AB5000, v1, v2, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A581C](v6, -1, -1);
    MEMORY[0x2495A581C](v5, -1, -1);
  }

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AD7318()
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
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 8);
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 32);
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 40);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 16);
  v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 24);
  swift_getKeyPath();
  sub_248AD7BAC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_248AF4EEC();
  swift_release();
  v7 = sub_248AF5D5C();
  v9 = v8;
  type metadata accessor for TryItLaunchAnalyticsEvent();
  swift_allocObject();
  v10 = TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001BLL, 0x8000000248AF8AC0, v1, v2, v3, v4, v5, v6, v7, v9);
  sub_248AF0C10(v10);
  return swift_release();
}

uint64_t sub_248AD7464()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  double v6;
  double v7;
  uint64_t result;
  double v9;
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
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = sub_248AF4EBC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AF4EB0();
  sub_248AF4EA4();
  v7 = v6;
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v9 = ceil(v7 / 60.0);
  if ((~*(_QWORD *)&v9 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v9 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v9 < 9.22337204e18)
  {
    v10 = v1 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
    *(_QWORD *)(v10 + 80) = (uint64_t)v9;
    v11 = *(_QWORD *)v10;
    v12 = *(_QWORD *)(v10 + 8);
    v13 = *(_QWORD *)(v10 + 40);
    v27 = *(_QWORD *)(v10 + 32);
    v28 = v11;
    v14 = *(_QWORD *)(v10 + 16);
    v15 = *(_QWORD *)(v10 + 24);
    v25 = v12;
    v26 = v14;
    swift_getKeyPath();
    v29 = v1;
    sub_248AD7BAC();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_248AF4EEC();
    swift_release();
    v29 = *(_QWORD *)(v1 + 32);
    v16 = sub_248AF5D5C();
    v18 = v17;
    v24 = *(_OWORD *)(v10 + 64);
    v19 = *(_QWORD *)(v10 + 80);
    v20 = *(_BYTE *)(v10 + 88);
    v21 = *(_BYTE *)(v10 + 89);
    LOBYTE(v12) = *(_BYTE *)(v10 + 90);
    LOBYTE(v10) = *(_BYTE *)(v10 + 91);
    type metadata accessor for TryItSessionAnalyticsEvent();
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 96) = v24;
    *(_QWORD *)(v22 + 112) = v19;
    *(_BYTE *)(v22 + 120) = v20;
    *(_BYTE *)(v22 + 121) = v21;
    *(_BYTE *)(v22 + 122) = v12;
    *(_BYTE *)(v22 + 123) = v10;
    v23 = TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x8000000248AF8BB0, v28, v25, v27, v13, v26, v15, v16, v18);
    sub_248AF0C10(v23);
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_248AD76B0()
{
  __asm { BR              X10 }
}

uint64_t sub_248AD771C()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_248AF5AB0();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  type metadata accessor for TryItAttemptAnalyticsEvent();
  v6 = swift_allocObject();
  if (v4)
    v7 = v5;
  else
    v7 = 0;
  *(_QWORD *)(v6 + 96) = v7;
  *(_QWORD *)(v6 + 104) = v4;
  *(_BYTE *)(v6 + 112) = v4 == 0;
  swift_bridgeObjectRetain();
  v8 = TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x8000000248AF8AA0, v12, v1, v11, v2, v10, v3, v13, v14);
  sub_248AF0C10(v8);
  return swift_release();
}

uint64_t sub_248AD7894()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_startTime;
  v2 = sub_248AF4EBC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager___observationRegistrar;
  v4 = sub_248AF4F04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t sub_248AD7980()
{
  sub_248AD7894();
  return swift_deallocClassInstance();
}

uint64_t sub_248AD79A4()
{
  return type metadata accessor for TrainingManager();
}

uint64_t type metadata accessor for TrainingManager()
{
  uint64_t result;

  result = qword_2577B2190;
  if (!qword_2577B2190)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_248AD79E8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_248AF4EBC();
  if (v1 <= 0x3F)
  {
    result = sub_248AF4F04();
    if (v2 <= 0x3F)
      return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t sub_248AD7AD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = v1;
  *(_DWORD *)(v0 + 48) = 0x10000;
  *(_WORD *)(v0 + 52) = 0;
  *(_QWORD *)(v0 + 56) = 0;
  *(_QWORD *)(v0 + 64) = 0;
  sub_248AF4EB0();
  v2 = OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsManager;
  type metadata accessor for TryItAnalyticsManager();
  swift_allocObject();
  *(_QWORD *)(v0 + v2) = sub_248AF1540();
  v3 = v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
  *(_OWORD *)(v3 + 77) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)v3 = 0u;
  *(_BYTE *)(v3 + 93) = 6;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_delayedInstructionTask) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_presentNextLessonTask) = 0;
  sub_248AF4EF8();
  return v0;
}

unint64_t sub_248AD7BAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577B11E8;
  if (!qword_2577B11E8)
  {
    v1 = type metadata accessor for TrainingManager();
    result = MEMORY[0x2495A57B0](&unk_248AF7298, v1);
    atomic_store(result, (unint64_t *)&qword_2577B11E8);
  }
  return result;
}

void sub_248AD7BFC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 32) = *(_QWORD *)(v0 + 24);
}

uint64_t sub_248AD7C08()
{
  return sub_248AD7EC8();
}

void sub_248AD7C24()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 48) = *(_BYTE *)(v0 + 24);
}

void sub_248AD7C3C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 49) = *(_BYTE *)(v0 + 24);
}

void sub_248AD7C54()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 51) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_248AD7C6C()
{
  return sub_248AD7E8C();
}

void sub_248AD7C88()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 53) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_248AD7C98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248AD7CE0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248AD7D20()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_248AD7D54(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_248AD7F00;
  return sub_248AD6F60(a1, v4, v5, v6, v7, v8);
}

void sub_248AD7DDC()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 50) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_248AD7DEC()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AD7E18(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_248AC7858;
  return sub_248AD5E78(a1, v4, v5, v6);
}

uint64_t sub_248AD7E8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[2];
  v2 = v0[4];
  *(_QWORD *)(v1 + 16) = v0[3];
  *(_QWORD *)(v1 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_248AD7EC8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 40) = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_248AD7F04()
{
  sub_248AD7C88();
}

void sub_248AD7F18()
{
  sub_248AD7C3C();
}

void sub_248AD7F2C()
{
  sub_248AD7C24();
}

void sub_248AD7F40()
{
  sub_248AD7C54();
}

void sub_248AD7F54()
{
  sub_248AD7BFC();
}

uint64_t destroy for ImageView(uint64_t a1)
{
  sub_248ABDC3C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ImageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_248ABDBC0(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ImageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_248ABDBC0(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_248ABDC3C(v6, v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ImageView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_248ABDC3C(v6, v7);
  v8 = a2[3];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ImageView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ImageView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ImageView()
{
  return &type metadata for ImageView;
}

uint64_t sub_248AD8144()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248AD8154@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v6 = sub_248AF57B0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v10 = (void *)sub_248AF5A38();
  v11 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v10);

  sub_248AF57D4();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF3FD0], v6);
  v12 = sub_248AF57C8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  a2 &= 1u;
  sub_248ABDBC0(a1, a2);
  LOBYTE(v6) = sub_248ADBB84(a1, a2) & 1;
  result = sub_248ABDC3C(a1, a2);
  *(_QWORD *)a3 = v12;
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  *(_BYTE *)(a3 + 17) = v6;
  return result;
}

uint64_t sub_248AD82D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_248AD8154(*(_QWORD *)v1, *(_BYTE *)(v1 + 8), a1);
}

unint64_t sub_248AD82F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2578;
  if (!qword_2577B2578)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2580);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2578);
  }
  return result;
}

uint64_t *sub_248AD8354(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v11 = *(int *)(a3 + 20);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = *(_QWORD *)v13;
    LOBYTE(v13) = v13[8];
    *(_QWORD *)v12 = v14;
    v12[8] = (char)v13;
  }
  swift_retain();
  return a1;
}

uint64_t sub_248AD849C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_248AF5408();
    v3 = *(_QWORD *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

_QWORD *sub_248AD8530(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_248AF5408();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = *(_QWORD *)v11;
  LOBYTE(v11) = v11[8];
  *(_QWORD *)v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  return a1;
}

_QWORD *sub_248AD8650(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_248AF5408();
      v7 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = *(_QWORD *)v11;
  LOBYTE(v11) = v11[8];
  *(_QWORD *)v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_248AD8794(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_248AF5408();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v11[8] = v12[8];
  return a1;
}

char *sub_248AD88AC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = *(_QWORD *)v12;
  LOBYTE(v12) = v12[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  return a1;
}

uint64_t sub_248AD89E4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AD89F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 > 1)
    return (v9 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t sub_248AD8A70()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AD8A7C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20) + 8) = -(char)a2;
  return result;
}

uint64_t type metadata accessor for TouchAccommodationButtonView()
{
  uint64_t result;

  result = qword_2577B25F8;
  if (!qword_2577B25F8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_248AD8B38()
{
  unint64_t v0;

  sub_248ABCFE0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_248AD8BA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248AD8BB8()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2680);
  __swift_allocate_value_buffer(v0, qword_2577B2588);
  __swift_project_value_buffer(v0, (uint64_t)qword_2577B2588);
  return sub_248AF4E74();
}

uint64_t sub_248AD8C1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(_QWORD);
  uint64_t v32;
  unsigned int (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  _QWORD *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v67;
  int v68;
  uint64_t v69;
  char *v70;
  int v71;
  void (*v72)(char *, _QWORD, uint64_t, uint64_t);
  void (*v73)(uint64_t, _QWORD, uint64_t);
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  _QWORD *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;

  v84 = a1;
  v2 = sub_248AF5408();
  v3 = *(_QWORD **)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v70 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1470);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v83 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v67 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v79 = (uint64_t)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v85 = (uint64_t)&v67 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v77 = (uint64_t)&v67 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v67 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v67 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v67 - v23;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2630);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v67 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2638);
  MEMORY[0x24BDAC7A8](v75);
  v81 = (char *)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2640);
  MEMORY[0x24BDAC7A8](v78);
  v80 = (uint64_t)&v67 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v27 = sub_248AF5324();
  *((_QWORD *)v27 + 1) = 0;
  v27[16] = 1;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2648);
  sub_248AD93D8(v1, (uint64_t *)&v27[*(int *)(v30 + 44)]);
  v71 = sub_248AF5528();
  sub_248ADB6C8((uint64_t)v24);
  v31 = (void (*)(_QWORD))v3[13];
  v74 = *MEMORY[0x24BDEFEE8];
  v73 = (void (*)(uint64_t, _QWORD, uint64_t))v31;
  v31(v22);
  v72 = (void (*)(char *, _QWORD, uint64_t, uint64_t))v3[7];
  v72(v22, 0, 1, v2);
  v76 = v5;
  v32 = (uint64_t)&v9[*(int *)(v5 + 48)];
  sub_248AB8870((uint64_t)v24, (uint64_t)v9, &qword_2577B1300);
  sub_248AB8870((uint64_t)v22, v32, &qword_2577B1300);
  v82 = v3;
  v33 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v3[6];
  if (v33((uint64_t)v9, 1, v2) == 1)
  {
    sub_248AB89E8((uint64_t)v22, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v24, &qword_2577B1300);
    if (v33(v32, 1, v2) == 1)
    {
      sub_248AB89E8((uint64_t)v9, &qword_2577B1300);
      v34 = (uint64_t)v83;
      v35 = (uint64_t)v81;
      v36 = v85;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sub_248AB8870((uint64_t)v9, (uint64_t)v19, &qword_2577B1300);
  if (v33(v32, 1, v2) == 1)
  {
    sub_248AB89E8((uint64_t)v22, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v24, &qword_2577B1300);
    ((void (*)(char *, uint64_t))v82[1])(v19, v2);
LABEL_6:
    sub_248AB89E8((uint64_t)v9, &qword_2577B1470);
    v34 = (uint64_t)v83;
    v35 = (uint64_t)v81;
    v36 = v85;
    goto LABEL_8;
  }
  v69 = v1;
  v37 = v70;
  v67 = v19;
  v38 = v82;
  ((void (*)(char *, uint64_t, uint64_t))v82[4])(v70, v32, v2);
  sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
  v68 = sub_248AF5A14();
  v39 = (void (*)(char *, uint64_t))v38[1];
  v39(v37, v2);
  sub_248AB89E8((uint64_t)v22, &qword_2577B1300);
  sub_248AB89E8((uint64_t)v24, &qword_2577B1300);
  v39(v67, v2);
  sub_248AB89E8((uint64_t)v9, &qword_2577B1300);
  v34 = (uint64_t)v83;
  v35 = (uint64_t)v81;
  v36 = v85;
LABEL_8:
  sub_248AF4F88();
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  sub_248AB8870((uint64_t)v27, v35, &qword_2577B2630);
  v48 = v35 + *(int *)(v75 + 36);
  *(_BYTE *)v48 = v71;
  *(_QWORD *)(v48 + 8) = v41;
  *(_QWORD *)(v48 + 16) = v43;
  *(_QWORD *)(v48 + 24) = v45;
  *(_QWORD *)(v48 + 32) = v47;
  *(_BYTE *)(v48 + 40) = 0;
  sub_248AB89E8((uint64_t)v27, &qword_2577B2630);
  v49 = sub_248AF5510();
  v50 = v77;
  sub_248ADB6C8(v77);
  v73(v36, v74, v2);
  v72((char *)v36, 0, 1, v2);
  v51 = v34 + *(int *)(v76 + 48);
  sub_248AB8870(v50, v34, &qword_2577B1300);
  sub_248AB8870(v36, v51, &qword_2577B1300);
  if (v33(v34, 1, v2) != 1)
  {
    sub_248AB8870(v34, v79, &qword_2577B1300);
    if (v33(v51, 1, v2) != 1)
    {
      v52 = v82;
      v53 = v70;
      ((void (*)(char *, uint64_t, uint64_t))v82[4])(v70, v51, v2);
      sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
      v54 = v79;
      sub_248AF5A14();
      v55 = (void (*)(char *, uint64_t))v52[1];
      v55(v53, v2);
      sub_248AB89E8(v85, &qword_2577B1300);
      sub_248AB89E8(v50, &qword_2577B1300);
      v55((char *)v54, v2);
      sub_248AB89E8(v34, &qword_2577B1300);
      goto LABEL_15;
    }
    sub_248AB89E8(v85, &qword_2577B1300);
    sub_248AB89E8(v50, &qword_2577B1300);
    ((void (*)(uint64_t, uint64_t))v82[1])(v79, v2);
    goto LABEL_13;
  }
  sub_248AB89E8(v36, &qword_2577B1300);
  sub_248AB89E8(v50, &qword_2577B1300);
  if (v33(v51, 1, v2) != 1)
  {
LABEL_13:
    sub_248AB89E8(v34, &qword_2577B1470);
    goto LABEL_15;
  }
  sub_248AB89E8(v34, &qword_2577B1300);
LABEL_15:
  sub_248AF4F88();
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v64 = v80;
  sub_248AB8870(v35, v80, &qword_2577B2638);
  v65 = v64 + *(int *)(v78 + 36);
  *(_BYTE *)v65 = v49;
  *(_QWORD *)(v65 + 8) = v57;
  *(_QWORD *)(v65 + 16) = v59;
  *(_QWORD *)(v65 + 24) = v61;
  *(_QWORD *)(v65 + 32) = v63;
  *(_BYTE *)(v65 + 40) = 0;
  sub_248AB89E8(v35, &qword_2577B2638);
  return sub_248AB882C(v64, v84, &qword_2577B2640);
}

uint64_t sub_248AD93D8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t KeyPath;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;

  v67 = a1;
  v79 = a2;
  v78 = sub_248AF530C();
  v76 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v75 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for TouchAccommodationButtonView();
  v64 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v65 = v4;
  v66 = (uint64_t)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2650);
  v70 = *(_QWORD *)(v5 - 8);
  v71 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v69 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2658);
  v73 = *(_QWORD *)(v7 - 8);
  v74 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v72 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2660);
  v9 = MEMORY[0x24BDAC7A8](v68);
  v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v77 = (uint64_t)&v61 - v12;
  v13 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v13);
  v14 = sub_248AF4E2C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v18);
  v19 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v19);
  sub_248AF5A20();
  if (qword_2577B10B0 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v14, (uint64_t)qword_2577B5078);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v20, v14);
  sub_248AF4EC8();
  sub_248AF4E44();
  v21 = sub_248AF5618();
  v23 = v22;
  v25 = v24 & 1;
  sub_248AF55B8();
  v26 = sub_248AF560C();
  v28 = v27;
  v30 = v29;
  swift_release();
  sub_248ABF9B0(v21, v23, v25);
  swift_bridgeObjectRelease();
  sub_248AF5780();
  v63 = sub_248AF5600();
  v32 = v31;
  LOBYTE(v23) = v33;
  v62 = v34;
  swift_release();
  LOBYTE(v23) = v23 & 1;
  sub_248ABF9B0(v26, v28, v30 & 1);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v36 = v66;
  sub_248AD9F58(v67, v66);
  v37 = (*(unsigned __int8 *)(v64 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
  v38 = swift_allocObject();
  sub_248ADA074(v36, v38 + v37);
  v39 = v69;
  sub_248AF5828();
  v40 = v75;
  sub_248AF5300();
  sub_248AB8BE8(&qword_2577B2668, &qword_2577B2650, MEMORY[0x24BDF43B0]);
  sub_248AB80A8(&qword_2577B2670, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEDC8], MEMORY[0x24BDEEDB8]);
  v42 = v71;
  v41 = v72;
  v43 = v78;
  sub_248AF566C();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v40, v43);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v39, v42);
  v44 = sub_248AF5564();
  sub_248AF4F88();
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v73;
  v53 = v74;
  (*(void (**)(char *, char *, uint64_t))(v73 + 16))(v11, v41, v74);
  v55 = &v11[*(int *)(v68 + 36)];
  *v55 = v44;
  *((_QWORD *)v55 + 1) = v46;
  *((_QWORD *)v55 + 2) = v48;
  *((_QWORD *)v55 + 3) = v50;
  *((_QWORD *)v55 + 4) = v52;
  v55[40] = 0;
  (*(void (**)(char *, uint64_t))(v54 + 8))(v41, v53);
  v56 = v77;
  sub_248AB882C((uint64_t)v11, v77, &qword_2577B2660);
  sub_248AB8870(v56, (uint64_t)v11, &qword_2577B2660);
  v57 = v79;
  v58 = v63;
  *v79 = v63;
  v57[1] = v32;
  *((_BYTE *)v57 + 16) = v23;
  v57[3] = v62;
  v57[4] = KeyPath;
  *((_BYTE *)v57 + 40) = 1;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2678);
  sub_248AB8870((uint64_t)v11, (uint64_t)v57 + *(int *)(v59 + 48), &qword_2577B2660);
  sub_248ABFA10(v58, v32, v23);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_248AB89E8(v56, &qword_2577B2660);
  sub_248AB89E8((uint64_t)v11, &qword_2577B2660);
  sub_248ABF9B0(v58, v32, v23);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_248AD9A10(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v2 = sub_248AF599C();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v17 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_248AF59C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_BYTE *)(a1 + *(int *)(type metadata accessor for TouchAccommodationButtonView() + 20) + 8);
  v11 = swift_retain();
  v12 = sub_248ADB034(v11, v10);
  swift_release();
  *(_BYTE *)(v12 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 91) = 1;
  swift_release();
  sub_248ADA0E4();
  v13 = (void *)sub_248AF5C0C();
  aBlock[4] = sub_248AD9C40;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_248ADFE80;
  aBlock[3] = &block_descriptor_1;
  v14 = _Block_copy(aBlock);
  sub_248AF59A8();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_248AB80A8((unint64_t *)&unk_2577B14A0, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11E0);
  sub_248AB8BE8(&qword_2577B14B0, &qword_2577B11E0, MEMORY[0x24BEE12C8]);
  sub_248AF5C84();
  MEMORY[0x2495A524C](0, v9, v5, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_248AD9C40()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2680);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v3)
  {
    v4 = v3;
    if (qword_2577B10B8 != -1)
      swift_once();
    v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2577B2588);
    sub_248AB8870(v5, (uint64_t)v2, &qword_2577B2680);
    v6 = sub_248AF4E80();
    v7 = *(_QWORD *)(v6 - 8);
    v8 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v2, 1, v6) != 1)
    {
      v8 = (void *)sub_248AF4E5C();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v2, v6);
    }
    objc_msgSend(v4, sel_openSensitiveURL_withOptions_, v8, 0);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_248AD9D84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v2 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_248AF4E2C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v8);
  sub_248AF5A20();
  if (qword_2577B10B0 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v3, (uint64_t)qword_2577B5078);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_248AF4EC8();
  sub_248AF4E44();
  result = sub_248AF5618();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v11;
  *(_BYTE *)(a1 + 16) = v12 & 1;
  *(_QWORD *)(a1 + 24) = v13;
  return result;
}

uint64_t sub_248AD9F58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TouchAccommodationButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248AD9F9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TouchAccommodationButtonView() - 8) + 80);
  v2 = (v1 + 16) & ~v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_248AF5408();
    v4 = *(_QWORD *)(v3 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248ADA074(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TouchAccommodationButtonView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ADA0B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TouchAccommodationButtonView() - 8) + 80);
  return sub_248AD9A10(v0 + ((v1 + 16) & ~v1));
}

unint64_t sub_248ADA0E4()
{
  unint64_t result;

  result = qword_2577B11D8;
  if (!qword_2577B11D8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2577B11D8);
  }
  return result;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_248ADA13C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2688;
  if (!qword_2577B2688)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2640);
    v2[0] = sub_248ADA1A8();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2688);
  }
  return result;
}

unint64_t sub_248ADA1A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2690;
  if (!qword_2577B2690)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2638);
    v2[0] = sub_248AB8BE8(&qword_2577B2698, &qword_2577B2630, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2690);
  }
  return result;
}

double static Double.dragCellOpacityDragging.getter()
{
  return 0.85;
}

double static Double.dragCellAnimationSpeed.getter()
{
  return 1.0;
}

uint64_t SelectTrainingView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v5;
  uint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B26A0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_BYTE *)(v0 + 8);
  sub_248ADA358(v4, (uint64_t)v3);
  v5 = swift_retain();
  sub_248ADB034(v5, v4);
  swift_release();
  type metadata accessor for TrainingManager();
  sub_248ADB1F8();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF5690();
  swift_release();
  return sub_248AB89E8((uint64_t)v3, &qword_2577B26A0);
}

uint64_t sub_248ADA358@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  char v2;
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)();
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)();
  uint64_t *v39;
  uint64_t (*v40)();
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  char *v55;
  char *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;

  v79 = a2;
  v2 = a1 & 1;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2728);
  MEMORY[0x24BDAC7A8](v67);
  v68 = (uint64_t)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2718);
  MEMORY[0x24BDAC7A8](v78);
  v69 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_248AF4F40();
  v58 = *(_QWORD *)(v59 - 8);
  v5 = MEMORY[0x24BDAC7A8](v59);
  v56 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v55 = (char *)&v52 - v7;
  v66 = type metadata accessor for PinchZoomView();
  v8 = MEMORY[0x24BDAC7A8](v66);
  v54 = (uint64_t *)((char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v60 = (uint64_t)&v52 - v10;
  v64 = type metadata accessor for SelectTextView();
  MEMORY[0x24BDAC7A8](v64);
  v57 = (uint64_t *)((char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2730);
  MEMORY[0x24BDAC7A8](v61);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B26F8);
  MEMORY[0x24BDAC7A8](v73);
  v65 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = type metadata accessor for TouchHoldView();
  MEMORY[0x24BDAC7A8](v63);
  v53 = (uint64_t *)((char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v62 = type metadata accessor for TapView();
  MEMORY[0x24BDAC7A8](v62);
  v52 = (uint64_t *)((char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2738);
  MEMORY[0x24BDAC7A8](v75);
  v77 = (uint64_t)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2740);
  MEMORY[0x24BDAC7A8](v70);
  v72 = (uint64_t)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2748);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B26D8);
  MEMORY[0x24BDAC7A8](v71);
  v23 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B26C8);
  MEMORY[0x24BDAC7A8](v76);
  v74 = (char *)&v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for DragView();
  MEMORY[0x24BDAC7A8](v25);
  v27 = (uint64_t *)((char *)&v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  v28 = swift_retain();
  v29 = sub_248ADB034(v28, v2);
  swift_release();
  swift_getKeyPath();
  v81 = v29;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  v30 = *(_QWORD *)(v29 + 32);
  swift_release();
  switch(v30)
  {
    case 1:
      sub_248ACA4BC(v27);
      v31 = type metadata accessor for DragView;
      sub_248AC7574((uint64_t)v27, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for DragView);
      swift_storeEnumTagMultiPayload();
      sub_248AB80A8(&qword_2577B26E0, (uint64_t (*)(uint64_t))type metadata accessor for DragView, (uint64_t)&unk_248AF6C80);
      sub_248AB80A8(&qword_2577B26E8, (uint64_t (*)(uint64_t))type metadata accessor for TapView, (uint64_t)&unk_248AF6A80);
      sub_248AF53D8();
      sub_248AB8870((uint64_t)v23, v72, &qword_2577B26D8);
      swift_storeEnumTagMultiPayload();
      sub_248ADB310();
      sub_248ADB3AC();
      v32 = (uint64_t)v74;
      sub_248AF53D8();
      sub_248AB89E8((uint64_t)v23, &qword_2577B26D8);
      sub_248AB8870(v32, v77, &qword_2577B26C8);
      swift_storeEnumTagMultiPayload();
      sub_248ADB27C();
      sub_248ADB448();
      sub_248AF53D8();
      sub_248AB89E8(v32, &qword_2577B26C8);
      v33 = (uint64_t)v27;
      goto LABEL_5;
    case 2:
      v36 = v52;
      sub_248AC68E8(v52);
      v31 = type metadata accessor for TapView;
      sub_248AC7574((uint64_t)v36, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for TapView);
      swift_storeEnumTagMultiPayload();
      sub_248AB80A8(&qword_2577B26E0, (uint64_t (*)(uint64_t))type metadata accessor for DragView, (uint64_t)&unk_248AF6C80);
      sub_248AB80A8(&qword_2577B26E8, (uint64_t (*)(uint64_t))type metadata accessor for TapView, (uint64_t)&unk_248AF6A80);
      sub_248AF53D8();
      sub_248AB8870((uint64_t)v23, v72, &qword_2577B26D8);
      swift_storeEnumTagMultiPayload();
      sub_248ADB310();
      sub_248ADB3AC();
      v37 = (uint64_t)v74;
      sub_248AF53D8();
      sub_248AB89E8((uint64_t)v23, &qword_2577B26D8);
      sub_248AB8870(v37, v77, &qword_2577B26C8);
      swift_storeEnumTagMultiPayload();
      sub_248ADB27C();
      sub_248ADB448();
      sub_248AF53D8();
      sub_248AB89E8(v37, &qword_2577B26C8);
      v33 = (uint64_t)v36;
LABEL_5:
      v38 = v31;
      goto LABEL_11;
    case 3:
      v39 = v53;
      sub_248AE9ECC(v53);
      v40 = type metadata accessor for TouchHoldView;
      sub_248AC7574((uint64_t)v39, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
      swift_storeEnumTagMultiPayload();
      sub_248AB80A8(&qword_2577B2700, (uint64_t (*)(uint64_t))type metadata accessor for TouchHoldView, (uint64_t)&unk_248AF7DA8);
      goto LABEL_8;
    case 4:
      v39 = v57;
      sub_248ABB18C(v57);
      v40 = type metadata accessor for SelectTextView;
      sub_248AC7574((uint64_t)v39, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for SelectTextView);
      swift_storeEnumTagMultiPayload();
      sub_248AB80A8(&qword_2577B2700, (uint64_t (*)(uint64_t))type metadata accessor for TouchHoldView, (uint64_t)&unk_248AF7DA8);
LABEL_8:
      sub_248AB80A8(&qword_2577B2708, (uint64_t (*)(uint64_t))type metadata accessor for SelectTextView, (uint64_t)&unk_248AF6768);
      v41 = (uint64_t)v65;
      sub_248AF53D8();
      sub_248AB8870(v41, v72, &qword_2577B26F8);
      swift_storeEnumTagMultiPayload();
      sub_248ADB310();
      sub_248ADB3AC();
      v42 = (uint64_t)v74;
      sub_248AF53D8();
      sub_248AB89E8(v41, &qword_2577B26F8);
      sub_248AB8870(v42, v77, &qword_2577B26C8);
      swift_storeEnumTagMultiPayload();
      sub_248ADB27C();
      sub_248ADB448();
      sub_248AF53D8();
      sub_248AB89E8(v42, &qword_2577B26C8);
      v33 = (uint64_t)v39;
      goto LABEL_10;
    case 5:
      type metadata accessor for TrainingManager();
      v43 = sub_248AF4FDC();
      v44 = (uint64_t)v54;
      *v54 = v43;
      *(_BYTE *)(v44 + 8) = v45 & 1;
      v80 = 0;
      sub_248AF57E0();
      v46 = v82;
      *(_BYTE *)(v44 + 16) = v81;
      *(_QWORD *)(v44 + 24) = v46;
      v47 = v55;
      sub_248AF4F34();
      v48 = v58;
      v49 = v59;
      (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v56, v47, v59);
      sub_248AF57E0();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
      v50 = v60;
      sub_248ACE318(v44, v60);
      v40 = type metadata accessor for PinchZoomView;
      sub_248AC7574(v50, v68, (uint64_t (*)(_QWORD))type metadata accessor for PinchZoomView);
      swift_storeEnumTagMultiPayload();
      sub_248AB80A8(&qword_2577B2720, (uint64_t (*)(uint64_t))type metadata accessor for PinchZoomView, (uint64_t)&unk_248AF6E48);
      v51 = (uint64_t)v69;
      sub_248AF53D8();
      sub_248AB8870(v51, v77, &qword_2577B2718);
      swift_storeEnumTagMultiPayload();
      sub_248ADB27C();
      sub_248ADB448();
      sub_248AF53D8();
      sub_248AB89E8(v51, &qword_2577B2718);
      v33 = v50;
LABEL_10:
      v38 = v40;
LABEL_11:
      result = sub_248AC75B8(v33, (uint64_t (*)(_QWORD))v38);
      break;
    default:
      swift_storeEnumTagMultiPayload();
      sub_248AB80A8(&qword_2577B2720, (uint64_t (*)(uint64_t))type metadata accessor for PinchZoomView, (uint64_t)&unk_248AF6E48);
      v34 = (uint64_t)v69;
      sub_248AF53D8();
      sub_248AB8870(v34, v77, &qword_2577B2718);
      swift_storeEnumTagMultiPayload();
      sub_248ADB27C();
      sub_248ADB448();
      sub_248AF53D8();
      result = sub_248AB89E8(v34, &qword_2577B2718);
      break;
  }
  return result;
}

uint64_t sub_248ADAF20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v5;
  uint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B26A0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_BYTE *)(v0 + 8);
  sub_248ADA358(v4, (uint64_t)v3);
  v5 = swift_retain();
  sub_248ADB034(v5, v4);
  swift_release();
  type metadata accessor for TrainingManager();
  sub_248ADB1F8();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF5690();
  swift_release();
  return sub_248AB89E8((uint64_t)v3, &qword_2577B26A0);
}

uint64_t sub_248ADB034(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_248AF5270();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v8 = sub_248AF5BD0();
    v9 = sub_248AF54F8();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v15 = v12;
      *(_DWORD *)v11 = 136315138;
      v14 = sub_248AF3998(0x676E696E69617254, 0xEF726567616E614DLL, &v15);
      sub_248AF5C54();
      _os_log_impl(&dword_248AB5000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495A581C](v12, -1, -1);
      MEMORY[0x2495A581C](v11, -1, -1);
    }

    sub_248AF5264();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

unint64_t sub_248ADB1F8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2577B26A8;
  if (!qword_2577B26A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B26A0);
    v2 = sub_248ADB2A0(&qword_2577B26B0, &qword_2577B26B8, sub_248ADB27C, (uint64_t (*)(void))sub_248ADB448);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2577B26A8);
  }
  return result;
}

uint64_t sub_248ADB27C()
{
  return sub_248ADB2A0(&qword_2577B26C0, &qword_2577B26C8, (uint64_t (*)(void))sub_248ADB310, (uint64_t (*)(void))sub_248ADB3AC);
}

uint64_t sub_248ADB2A0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_248ADB310()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B26D0;
  if (!qword_2577B26D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B26D8);
    v2[0] = sub_248AB80A8(&qword_2577B26E0, (uint64_t (*)(uint64_t))type metadata accessor for DragView, (uint64_t)&unk_248AF6C80);
    v2[1] = sub_248AB80A8(&qword_2577B26E8, (uint64_t (*)(uint64_t))type metadata accessor for TapView, (uint64_t)&unk_248AF6A80);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B26D0);
  }
  return result;
}

unint64_t sub_248ADB3AC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B26F0;
  if (!qword_2577B26F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B26F8);
    v2[0] = sub_248AB80A8(&qword_2577B2700, (uint64_t (*)(uint64_t))type metadata accessor for TouchHoldView, (uint64_t)&unk_248AF7DA8);
    v2[1] = sub_248AB80A8(&qword_2577B2708, (uint64_t (*)(uint64_t))type metadata accessor for SelectTextView, (uint64_t)&unk_248AF6768);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B26F0);
  }
  return result;
}

unint64_t sub_248ADB448()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2710;
  if (!qword_2577B2710)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2718);
    v2[0] = sub_248AB80A8(&qword_2577B2720, (uint64_t (*)(uint64_t))type metadata accessor for PinchZoomView, (uint64_t)&unk_248AF6E48);
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2710);
  }
  return result;
}

uint64_t sub_248ADB4CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for SelectTrainingView(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for SelectTrainingView()
{
  return swift_release();
}

uint64_t assignWithCopy for SelectTrainingView(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for SelectTrainingView(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SelectTrainingView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SelectTrainingView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SelectTrainingView()
{
  return &type metadata for SelectTrainingView;
}

uint64_t sub_248ADB640()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B26A0);
  type metadata accessor for TrainingManager();
  sub_248ADB1F8();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248ADB6C8@<X0>(uint64_t a1@<X8>)
{
  return sub_248ADB720(&qword_2577B12F8, &qword_2577B1300, 0xD000000000000020, 0x8000000248AF8D40, a1);
}

uint64_t sub_248ADB6F4@<X0>(uint64_t a1@<X8>)
{
  return sub_248ADB720(&qword_2577B1EA0, &qword_2577B1F20, 0xD000000000000019, 0x8000000248AF8D70, a1);
}

uint64_t sub_248ADB720@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  os_log_type_t v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v27 = a3;
  v9 = v5;
  v11 = sub_248AF5270();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AB8870(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
    return sub_248AB882C((uint64_t)v17, a5, a2);
  v19 = sub_248AF5BD0();
  v20 = sub_248AF54F8();
  if (os_log_type_enabled(v20, v19))
  {
    v25 = a4;
    v21 = swift_slowAlloc();
    v26 = a5;
    v22 = (uint8_t *)v21;
    v23 = swift_slowAlloc();
    v29 = v23;
    *(_DWORD *)v22 = 136315138;
    v28 = sub_248AF3998(v27, v25, &v29);
    sub_248AF5C54();
    _os_log_impl(&dword_248AB5000, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A581C](v23, -1, -1);
    MEMORY[0x2495A581C](v22, -1, -1);
  }

  sub_248AF5264();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_248ADB948@<X0>(uint64_t a1@<X8>)
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
  v4 = sub_248AF5270();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1EA8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AB8870(v2, (uint64_t)v10, &qword_2577B1EA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_248AF5318();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_248AF5BD0();
    v14 = sub_248AF54F8();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_248AF3998(0xD000000000000013, 0x8000000248AF8D90, &v20);
      sub_248AF5C54();
      _os_log_impl(&dword_248AB5000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495A581C](v18, -1, -1);
      MEMORY[0x2495A581C](v16, -1, -1);
    }

    sub_248AF5264();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_248ADBB84(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v4 = sub_248AF5270();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_248AF5BD0();
  v9 = sub_248AF54F8();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_248AF3998(0x4D746E65746E6F43, 0xEB0000000065646FLL, &v15);
    sub_248AF5C54();
    _os_log_impl(&dword_248AB5000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A581C](v12, -1, -1);
    MEMORY[0x2495A581C](v11, -1, -1);
  }

  sub_248AF5264();
  swift_getAtKeyPath();
  sub_248ABDC3C(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t *sub_248ADBD58(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B2750);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_248ADBDE4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B2750);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_248ADBE1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B2750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_248ADBE7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B2750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_248ADBEDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B2750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_248ADBF3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B2750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_248ADBF9C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248ADBFA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B2750);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_248ADBFE8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248ADBFF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B2750);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SystemFontScaledSupport()
{
  uint64_t result;

  result = qword_2577B27B0;
  if (!qword_2577B27B0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_248ADC074()
{
  unint64_t v0;

  sub_248ADC0E8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_248ADC0E8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2577B27C0)
  {
    sub_248ADC140();
    v0 = sub_248AF500C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2577B27C0);
  }
}

unint64_t sub_248ADC140()
{
  unint64_t result;

  result = qword_2577B27C8[0];
  if (!qword_2577B27C8[0])
  {
    result = MEMORY[0x2495A57B0](MEMORY[0x24BEE50B8], MEMORY[0x24BEE50B0]);
    atomic_store(result, qword_2577B27C8);
  }
  return result;
}

uint64_t sub_248ADC184()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248ADC19C()
{
  return sub_248AF5030();
}

uint64_t sub_248ADC1B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t result;
  uint64_t *v12;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1698);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_2577B2750);
  sub_248AF5000();
  v7 = sub_248AF557C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_248AF55A0();
  sub_248ADC2F4((uint64_t)v6);
  v8 = sub_248AF55AC();
  swift_release();
  KeyPath = swift_getKeyPath();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B27F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a2, a1, v10);
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2800);
  v12 = (uint64_t *)(a2 + *(int *)(result + 36));
  *v12 = KeyPath;
  v12[1] = v8;
  return result;
}

uint64_t sub_248ADC2F4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1698);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_248ADC340()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2808;
  if (!qword_2577B2808)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2800);
    v2[0] = sub_248AB8BE8(&qword_2577B2810, &qword_2577B27F8, MEMORY[0x24BDEFB78]);
    v2[1] = sub_248AB8BE8(&qword_2577B2030, &qword_2577B2038, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2808);
  }
  return result;
}

uint64_t TryItLesson.initialInstruction.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  v2 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_248AF4E2C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v7);
  switch(a1)
  {
    case 1:
      sub_248AF5A20();
      if (qword_2577B10B0 != -1)
        goto LABEL_13;
      goto LABEL_12;
    case 2:
      sub_248AF5A20();
      if (qword_2577B10B0 == -1)
        goto LABEL_12;
      goto LABEL_13;
    case 3:
      sub_248AF5A20();
      if (qword_2577B10B0 == -1)
        goto LABEL_12;
      goto LABEL_13;
    case 4:
      sub_248AF5A20();
      if (qword_2577B10B0 == -1)
        goto LABEL_12;
      goto LABEL_13;
    case 5:
      sub_248AF5A20();
      if (qword_2577B10B0 == -1)
        goto LABEL_12;
LABEL_13:
      swift_once();
LABEL_12:
      v9 = __swift_project_value_buffer(v3, (uint64_t)qword_2577B5078);
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);
      sub_248AF4EC8();
      result = sub_248AF4E44();
      break;
    default:
      result = sub_248AF4E20();
      break;
  }
  return result;
}

uint64_t TryItLesson.description.getter(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 1:
      result = 1734439492;
      break;
    case 2:
      result = 7364948;
      break;
    case 3:
      result = 0x6E61206863756F54;
      break;
    case 4:
      result = 0x54207463656C6553;
      break;
    case 5:
      result = 1836019546;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

unint64_t TryItLesson.init(rawValue:)(unint64_t a1)
{
  return sub_248ADC9E4(a1);
}

void *static TryItLesson.allCases.getter()
{
  return &unk_2519C7C28;
}

BOOL sub_248ADC8D8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_248ADC8EC()
{
  sub_248AF5D98();
  sub_248AF5DA4();
  return sub_248AF5DB0();
}

uint64_t sub_248ADC930()
{
  return sub_248AF5DA4();
}

uint64_t sub_248ADC958()
{
  sub_248AF5D98();
  sub_248AF5DA4();
  return sub_248AF5DB0();
}

unint64_t sub_248ADC998@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_248ADC9E4(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_248ADC9C8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_248ADC9D4(_QWORD *a1@<X8>)
{
  *a1 = &unk_2519C7C28;
}

unint64_t sub_248ADC9E4(unint64_t result)
{
  if (result > 5)
    return 0;
  return result;
}

unint64_t sub_248ADC9F8()
{
  unint64_t result;

  result = qword_2577B2818;
  if (!qword_2577B2818)
  {
    result = MEMORY[0x2495A57B0](&protocol conformance descriptor for TryItLesson, &type metadata for TryItLesson);
    atomic_store(result, (unint64_t *)&qword_2577B2818);
  }
  return result;
}

unint64_t sub_248ADCA40()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577B2820;
  if (!qword_2577B2820)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2828);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2577B2820);
  }
  return result;
}

ValueMetadata *type metadata accessor for TryItLesson()
{
  return &type metadata for TryItLesson;
}

uint64_t destroy for PracticeAgainButton()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PracticeAgainButton(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PracticeAgainButton(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PracticeAgainButton(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PracticeAgainButton(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PracticeAgainButton(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PracticeAgainButton()
{
  return &type metadata for PracticeAgainButton;
}

uint64_t sub_248ADCC50()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248ADCC60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  id v44;
  uint64_t v45;
  uint64_t KeyPath;
  uint64_t *v47;
  double v48;
  char *v49;
  char v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;

  v95 = a1;
  v1 = sub_248AF5858();
  MEMORY[0x24BDAC7A8](v1);
  v94 = (char *)&v73 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_248AF518C();
  v92 = *(_QWORD *)(v3 - 8);
  v93 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v91 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = sub_248AF58C4();
  v87 = *(_QWORD *)(v89 - 8);
  MEMORY[0x24BDAC7A8](v89);
  v85 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_248AF542C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2878);
  MEMORY[0x24BDAC7A8](v74);
  v11 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2880);
  MEMORY[0x24BDAC7A8](v75);
  v13 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2888);
  MEMORY[0x24BDAC7A8](v76);
  v15 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2890);
  MEMORY[0x24BDAC7A8](v78);
  v17 = (char *)&v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2898);
  MEMORY[0x24BDAC7A8](v77);
  v19 = (char *)&v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B28A0);
  MEMORY[0x24BDAC7A8](v80);
  v79 = (char *)&v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B28A8);
  MEMORY[0x24BDAC7A8](v82);
  v81 = (char *)&v73 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B28B0);
  v88 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90);
  v83 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B28B8);
  MEMORY[0x24BDAC7A8](v86);
  v84 = (char *)&v73 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AF5438();
  v24 = sub_248AF5510();
  sub_248AF4F88();
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v9, v6);
  v33 = &v11[*(int *)(v74 + 36)];
  *v33 = v24;
  *((_QWORD *)v33 + 1) = v26;
  *((_QWORD *)v33 + 2) = v28;
  *((_QWORD *)v33 + 3) = v30;
  *((_QWORD *)v33 + 4) = v32;
  v33[40] = 0;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v34 = sub_248AF5564();
  sub_248AF4F88();
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  sub_248AB8870((uint64_t)v11, (uint64_t)v13, &qword_2577B2878);
  v43 = &v13[*(int *)(v75 + 36)];
  *v43 = v34;
  *((_QWORD *)v43 + 1) = v36;
  *((_QWORD *)v43 + 2) = v38;
  *((_QWORD *)v43 + 3) = v40;
  *((_QWORD *)v43 + 4) = v42;
  v43[40] = 0;
  sub_248AB89E8((uint64_t)v11, &qword_2577B2878);
  v44 = objc_msgSend((id)objc_opt_self(), sel_systemBlueColor);
  v45 = MEMORY[0x2495A4DCC](v44);
  KeyPath = swift_getKeyPath();
  sub_248AB8870((uint64_t)v13, (uint64_t)v15, &qword_2577B2880);
  v47 = (uint64_t *)&v15[*(int *)(v76 + 36)];
  *v47 = KeyPath;
  v47[1] = v45;
  sub_248AB89E8((uint64_t)v13, &qword_2577B2880);
  if ((sub_248AF5444() & 1) != 0)
    v48 = 0.5;
  else
    v48 = 1.0;
  sub_248AB8870((uint64_t)v15, (uint64_t)v17, &qword_2577B2888);
  *(double *)&v17[*(int *)(v78 + 36)] = v48;
  sub_248AB89E8((uint64_t)v15, &qword_2577B2888);
  v49 = v85;
  sub_248AF58B8();
  v50 = sub_248AF551C();
  v51 = &v19[*(int *)(v77 + 36)];
  v52 = v87;
  v53 = v89;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v51, v49, v89);
  v51[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B28C0) + 36)] = v50;
  sub_248AB8870((uint64_t)v17, (uint64_t)v19, &qword_2577B2890);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v49, v53);
  sub_248AB89E8((uint64_t)v17, &qword_2577B2890);
  v54 = v91;
  sub_248AF5180();
  v55 = swift_getKeyPath();
  v56 = (uint64_t)v79;
  v57 = (uint64_t *)&v79[*(int *)(v80 + 36)];
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B28C8);
  v60 = v92;
  v59 = v93;
  (*(void (**)(char *, char *, uint64_t))(v92 + 16))((char *)v57 + *(int *)(v58 + 28), v54, v93);
  *v57 = v55;
  sub_248AB8870((uint64_t)v19, v56, &qword_2577B2898);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v54, v59);
  sub_248AB89E8((uint64_t)v19, &qword_2577B2898);
  v61 = *MEMORY[0x24BDEEB68];
  v62 = sub_248AF52DC();
  v63 = (uint64_t)v94;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 104))(v94, v61, v62);
  v64 = (uint64_t)v81;
  v65 = (uint64_t)&v81[*(int *)(v82 + 36)];
  sub_248ADDC38(v63, v65);
  *(_WORD *)(v65 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B28D0) + 36)) = 256;
  sub_248AB8870(v56, v64, &qword_2577B28A0);
  sub_248ADDC7C(v63);
  sub_248AB89E8(v56, &qword_2577B28A0);
  sub_248AF5594();
  sub_248ADDCB8();
  v66 = v83;
  sub_248AF5660();
  sub_248AB89E8(v64, &qword_2577B28A8);
  v67 = sub_248AF5930();
  v68 = v88;
  v69 = (uint64_t)v84;
  v70 = v90;
  (*(void (**)(char *, char *, uint64_t))(v88 + 16))(v84, v66, v90);
  v71 = (uint64_t *)(v69 + *(int *)(v86 + 36));
  *v71 = v67;
  v71[1] = 0;
  (*(void (**)(char *, uint64_t))(v68 + 8))(v66, v70);
  return sub_248AB882C(v69, v95, &qword_2577B28B8);
}

uint64_t sub_248ADD3B0(uint64_t a1, char a2, void (*a3)(void))
{
  char v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2 & 1;
  a3();
  v4 = swift_retain();
  v5 = sub_248ADB034(v4, v3);
  swift_release();
  *(_BYTE *)(v5 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 90) = 1;
  return swift_release();
}

uint64_t sub_248ADD418@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = sub_248AF5294();
  *(_QWORD *)(a1 + 8) = 0x4000000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2858);
  return sub_248ADD45C(a1 + *(int *)(v2 + 44));
}

uint64_t sub_248ADD45C@<X0>(uint64_t a1@<X8>)
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
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v39[3];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;

  v45 = a1;
  v1 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v1);
  v44 = (char *)v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_248AF4E2C();
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v43 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v5);
  v39[1] = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v7);
  v39[2] = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2860);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (_QWORD *)((char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = sub_248AF57BC();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2868);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v40 = (uint64_t)v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (_QWORD *)((char *)v39 - v20);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)v39 - v22;
  v24 = sub_248AF57A4();
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDF40B0], v12);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))((char *)v11 + *(int *)(v9 + 28), v15, v12);
  *v11 = KeyPath;
  sub_248AB8870((uint64_t)v11, (uint64_t)v21 + *(int *)(v16 + 36), &qword_2577B2860);
  *v21 = v24;
  swift_retain();
  sub_248AB89E8((uint64_t)v11, &qword_2577B2860);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  swift_release();
  sub_248AB882C((uint64_t)v21, (uint64_t)v23, &qword_2577B2868);
  sub_248AF5A20();
  if (qword_2577B10B0 != -1)
    swift_once();
  v26 = v42;
  v27 = __swift_project_value_buffer(v42, (uint64_t)qword_2577B5078);
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v43, v27, v26);
  sub_248AF4EC8();
  sub_248AF4E44();
  v28 = sub_248AF5618();
  v30 = v29;
  v32 = v31;
  v34 = v33 & 1;
  v35 = v40;
  sub_248AB8870((uint64_t)v23, v40, &qword_2577B2868);
  v36 = v45;
  sub_248AB8870(v35, v45, &qword_2577B2868);
  v37 = v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B2870) + 48);
  *(_QWORD *)v37 = v28;
  *(_QWORD *)(v37 + 8) = v30;
  *(_BYTE *)(v37 + 16) = v34;
  *(_QWORD *)(v37 + 24) = v32;
  sub_248ABFA10(v28, v30, v34);
  swift_bridgeObjectRetain();
  sub_248AB89E8((uint64_t)v23, &qword_2577B2868);
  sub_248ABF9B0(v28, v30, v34);
  swift_bridgeObjectRelease();
  return sub_248AB89E8(v35, &qword_2577B2868);
}

uint64_t sub_248ADD8A8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2830);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  v6 = *((_BYTE *)v0 + 8);
  v8 = v0[2];
  v7 = v0[3];
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  *(_BYTE *)(v9 + 24) = v6;
  *(_QWORD *)(v9 + 32) = v8;
  *(_QWORD *)(v9 + 40) = v7;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2838);
  sub_248AB8BE8(&qword_2577B2840, &qword_2577B2838, MEMORY[0x24BDF4498]);
  sub_248AF5828();
  sub_248AB8BE8(&qword_2577B2848, &qword_2577B2830, MEMORY[0x24BDF43B0]);
  sub_248ADDA50();
  sub_248AF5678();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_248ADDA0C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248ADDA38()
{
  uint64_t v0;

  return sub_248ADD3B0(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24), *(void (**)(void))(v0 + 32));
}

unint64_t sub_248ADDA50()
{
  unint64_t result;

  result = qword_2577B2850;
  if (!qword_2577B2850)
  {
    result = MEMORY[0x2495A57B0](&unk_248AF784C, &type metadata for PracticeAgainButtonStyle);
    atomic_store(result, (unint64_t *)&qword_2577B2850);
  }
  return result;
}

uint64_t sub_248ADDA94()
{
  return sub_248AF5198();
}

uint64_t sub_248ADDAB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
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

uint64_t sub_248ADDB30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_248ADDAB4(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDF40C0], MEMORY[0x24BDEDE98]);
}

ValueMetadata *type metadata accessor for PracticeAgainButtonStyle()
{
  return &type metadata for PracticeAgainButtonStyle;
}

uint64_t sub_248ADDB64()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2830);
  sub_248AB8BE8(&qword_2577B2848, &qword_2577B2830, MEMORY[0x24BDF43B0]);
  sub_248ADDA50();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248ADDBDC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248ADDBF4()
{
  return sub_248AF51E0();
}

uint64_t sub_248ADDC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_248ADDAB4(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEDCA8], MEMORY[0x24BDEE140]);
}

uint64_t sub_248ADDC38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_248AF5858();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ADDC7C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_248AF5858();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_248ADDCB8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B28D8;
  if (!qword_2577B28D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B28A8);
    v2[0] = sub_248ADDD3C();
    v2[1] = sub_248AB8BE8(&qword_2577B2928, &qword_2577B28D0, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B28D8);
  }
  return result;
}

unint64_t sub_248ADDD3C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B28E0;
  if (!qword_2577B28E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B28A0);
    v2[0] = sub_248ADDDC0();
    v2[1] = sub_248AB8BE8(&qword_2577B2920, &qword_2577B28C8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B28E0);
  }
  return result;
}

unint64_t sub_248ADDDC0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B28E8;
  if (!qword_2577B28E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2898);
    v2[0] = sub_248ABD838(&qword_2577B28F0, &qword_2577B2890, (uint64_t (*)(void))sub_248ADDE64, MEMORY[0x24BDECC38]);
    v2[1] = sub_248AB8BE8(&qword_2577B2918, &qword_2577B28C0, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B28E8);
  }
  return result;
}

unint64_t sub_248ADDE64()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B28F8;
  if (!qword_2577B28F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2888);
    v2[0] = sub_248ABD838(&qword_2577B2900, &qword_2577B2880, sub_248ADDF08, MEMORY[0x24BDECC60]);
    v2[1] = sub_248AB8BE8(&qword_2577B2050, &qword_2577B2058, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B28F8);
  }
  return result;
}

uint64_t sub_248ADDF08()
{
  return sub_248ABD838(&qword_2577B2908, &qword_2577B2878, (uint64_t (*)(void))sub_248ADDF2C, MEMORY[0x24BDECC60]);
}

unint64_t sub_248ADDF2C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577B2910;
  if (!qword_2577B2910)
  {
    v1 = sub_248AF542C();
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDF0438], v1);
    atomic_store(result, (unint64_t *)&qword_2577B2910);
  }
  return result;
}

unint64_t sub_248ADDF78()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2577B2930;
  if (!qword_2577B2930)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B28B8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B28A8);
    v2[3] = sub_248ADDCB8();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_248AB8BE8(&qword_2577B2938, &qword_2577B2940, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2930);
  }
  return result;
}

char *TryItViewController.__allocating_init(lessonURL:tipID:collectionID:correlationID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  id v15;

  v15 = objc_allocWithZone(v7);
  return TryItViewController.init(lessonURL:tipID:collectionID:correlationID:)(a1, a2, a3, a4, a5, a6, a7);
}

char *TryItViewController.init(lessonURL:tipID:collectionID:correlationID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  objc_class *v19;
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;

  v29 = a6;
  v30 = a7;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2948);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (uint64_t *)((char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(_QWORD *)&v7[OBJC_IVAR___TryItViewController_hostingController] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___TryItViewController_delegate] = 0;
  v16 = &v7[OBJC_IVAR___TryItViewController_tryItView];
  v17 = type metadata accessor for TipsTryItView();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v16, 1, 1, v17);
  v19 = (objc_class *)type metadata accessor for TryItViewController();
  v31.receiver = v7;
  v31.super_class = v19;
  v20 = (char *)objc_msgSendSuper2(&v31, sel_initWithNibName_bundle_, 0, 0);
  v21 = sub_248AF2BC0(a1);
  TipsTryItView.init(lessons:tipId:collectionId:correlationId:)((uint64_t)v21, a2, a3, a4, a5, v29, v30, v15);
  v18((char *)v15, 0, 1, v17);
  v22 = (uint64_t)&v20[OBJC_IVAR___TryItViewController_tryItView];
  swift_beginAccess();
  sub_248ADEC2C((uint64_t)v15, v22);
  swift_endAccess();
  sub_248ADEC74(v22, (uint64_t)v15);
  v23 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2577B2968));
  v24 = sub_248AF5348();

  v25 = sub_248AF4E80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(a1, v25);
  v26 = *(void **)&v20[OBJC_IVAR___TryItViewController_hostingController];
  *(_QWORD *)&v20[OBJC_IVAR___TryItViewController_hostingController] = v24;

  return v20;
}

uint64_t type metadata accessor for TryItViewController()
{
  uint64_t result;

  result = qword_2577B29A0;
  if (!qword_2577B29A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_248ADE4B4()
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
  uint64_t v10;

  v1 = type metadata accessor for TipsTryItView();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2948);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v0 + OBJC_IVAR___TryItViewController_tryItView;
  swift_beginAccess();
  sub_248ADEC74(v8, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1))
    return sub_248ADECBC((uint64_t)v7);
  sub_248ADECFC((uint64_t)v7, (uint64_t)v4);
  sub_248ADECBC((uint64_t)v7);
  sub_248AD7464();
  return sub_248ADED40((uint64_t)v4);
}

void sub_248ADE65C()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  objc_super v33;

  v1 = v0;
  v33.receiver = v0;
  v33.super_class = (Class)type metadata accessor for TryItViewController();
  objc_msgSendSuper2(&v33, sel_loadView);
  v2 = *(void **)&v0[OBJC_IVAR___TryItViewController_hostingController];
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v3, sel_view);
    if (!v4)
    {
LABEL_10:

      return;
    }
    v5 = v4;
    objc_msgSend(v0, sel_addChildViewController_, v3);
    v6 = objc_msgSend(v0, sel_view);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, sel_addSubview_, v5);

      v8 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
      objc_msgSend(v5, sel_setBackgroundColor_, v8);

      objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      v9 = objc_msgSend(v1, sel_view);
      if (v9)
      {
        v10 = v9;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577B36D0);
        v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_248AF78F0;
        v12 = objc_msgSend(v5, sel_leadingAnchor);
        v13 = objc_msgSend(v1, sel_view);
        if (v13)
        {
          v14 = v13;
          v15 = objc_msgSend(v13, sel_leadingAnchor);

          v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
          *(_QWORD *)(v11 + 32) = v16;
          v17 = objc_msgSend(v5, sel_topAnchor);
          v18 = objc_msgSend(v1, sel_view);
          if (v18)
          {
            v19 = v18;
            v20 = objc_msgSend(v18, sel_topAnchor);

            v21 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v20);
            *(_QWORD *)(v11 + 40) = v21;
            v22 = objc_msgSend(v5, sel_trailingAnchor);
            v23 = objc_msgSend(v1, sel_view);
            if (v23)
            {
              v24 = v23;
              v25 = objc_msgSend(v23, sel_trailingAnchor);

              v26 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v25);
              *(_QWORD *)(v11 + 48) = v26;
              v27 = objc_msgSend(v5, sel_bottomAnchor);
              v28 = objc_msgSend(v1, sel_view);
              if (v28)
              {
                v29 = v28;
                v30 = objc_msgSend(v28, sel_bottomAnchor);

                v31 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v30);
                *(_QWORD *)(v11 + 56) = v31;
                sub_248AF5B34();
                sub_248ADEE5C();
                v32 = (void *)sub_248AF5B1C();
                swift_bridgeObjectRelease();
                objc_msgSend(v10, sel_addConstraints_, v32);

                objc_msgSend(v3, sel_didMoveToParentViewController_, v1);
                goto LABEL_10;
              }
LABEL_17:
              __break(1u);
              return;
            }
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
}

id TryItViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_248AF5A38();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void TryItViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TryItViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TryItViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_248ADEC2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ADEC74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ADECBC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2948);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248ADECFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TipsTryItView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248ADED40(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TipsTryItView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_248ADEE5C()
{
  unint64_t result;

  result = qword_2577B2970;
  if (!qword_2577B2970)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2577B2970);
  }
  return result;
}

uint64_t sub_248ADEE98()
{
  return type metadata accessor for TryItViewController();
}

void sub_248ADEEA0()
{
  unint64_t v0;

  sub_248ADEF48();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for TryItViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TryItViewController.__allocating_init(lessonURL:tipID:collectionID:correlationID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of TryItViewController.logEndSession()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

void sub_248ADEF48()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2577B29B0)
  {
    type metadata accessor for TipsTryItView();
    v0 = sub_248AF5C48();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2577B29B0);
  }
}

uint64_t *sub_248ADEF9C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  char *v41;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v11 = a3[5];
    v12 = a3[6];
    v13 = (char *)a1 + v11;
    v14 = (char *)a2 + v11;
    v15 = *(_QWORD *)v14;
    LOBYTE(v14) = v14[8];
    *(_QWORD *)v13 = v15;
    v13[8] = (char)v14;
    v16 = (uint64_t *)((char *)a1 + v12);
    v17 = (uint64_t *)((char *)a2 + v12);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v16[2] = v17[2];
    v19 = a3[7];
    v20 = a3[8];
    v21 = (char *)a1 + v19;
    v22 = (char *)a2 + v19;
    *v21 = *v22;
    *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
    v23 = (char *)a1 + v20;
    v24 = (char *)a2 + v20;
    *v23 = *v24;
    *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
    v25 = a3[9];
    v26 = a3[10];
    v27 = (uint64_t *)((char *)a1 + v25);
    v28 = (uint64_t *)((char *)a2 + v25);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v30 = (char *)a1 + v26;
    v31 = (char *)a2 + v26;
    *(_OWORD *)v30 = *(_OWORD *)v31;
    *((_QWORD *)v30 + 2) = *((_QWORD *)v31 + 2);
    v32 = a3[11];
    v33 = a3[12];
    v34 = (uint64_t *)((char *)a1 + v32);
    v35 = (uint64_t *)((char *)a2 + v32);
    v36 = v35[1];
    v41 = (char *)a2 + v33;
    v40 = (char *)a1 + v33;
    *v34 = *v35;
    v34[1] = v36;
    v37 = sub_248AF55F4();
    v39 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v39(v40, v41, v37);
  }
  return a1;
}

uint64_t sub_248ADF20C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_248AF5408();
    v5 = *(_QWORD *)(v4 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v6 = a1 + *(int *)(a2 + 48);
  v7 = sub_248AF55F4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *sub_248ADF334(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  char *v39;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_248AF5408();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
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
  v13 = *(_QWORD *)v12;
  LOBYTE(v12) = v12[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v12;
  v14 = (_QWORD *)((char *)a1 + v10);
  v15 = (_QWORD *)((char *)a2 + v10);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v14[2] = v15[2];
  v17 = a3[7];
  v18 = a3[8];
  v19 = (char *)a1 + v17;
  v20 = (char *)a2 + v17;
  *v19 = *v20;
  *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
  v21 = (char *)a1 + v18;
  v22 = (char *)a2 + v18;
  *v21 = *v22;
  *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
  v23 = a3[9];
  v24 = a3[10];
  v25 = (_QWORD *)((char *)a1 + v23);
  v26 = (_QWORD *)((char *)a2 + v23);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  v28 = (char *)a1 + v24;
  v29 = (char *)a2 + v24;
  *(_OWORD *)v28 = *(_OWORD *)v29;
  *((_QWORD *)v28 + 2) = *((_QWORD *)v29 + 2);
  v30 = a3[11];
  v31 = a3[12];
  v32 = (_QWORD *)((char *)a1 + v30);
  v33 = (_QWORD *)((char *)a2 + v30);
  v34 = v33[1];
  v39 = (char *)a2 + v31;
  v38 = (char *)a1 + v31;
  *v32 = *v33;
  v32[1] = v34;
  v35 = sub_248AF55F4();
  v37 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v37(v38, v39, v35);
  return a1;
}

_QWORD *sub_248ADF578(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_248AF5408();
      v7 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = *(_QWORD *)v11;
  LOBYTE(v11) = v11[8];
  *(_QWORD *)v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  swift_retain();
  swift_release();
  *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
  swift_retain();
  swift_release();
  *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  *v17 = *v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_retain();
  swift_release();
  v19 = a3[8];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  *v20 = *v21;
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  swift_retain();
  swift_release();
  v22 = a3[9];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  swift_retain();
  swift_release();
  v25 = a3[10];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  v26[2] = v27[2];
  swift_retain();
  swift_release();
  v28 = a3[11];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  *(_QWORD *)((char *)a1 + v28) = *(_QWORD *)((char *)a2 + v28);
  swift_retain();
  swift_release();
  *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
  swift_retain();
  swift_release();
  v31 = a3[12];
  v32 = (char *)a1 + v31;
  v33 = (char *)a2 + v31;
  v34 = sub_248AF55F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 24))(v32, v33, v34);
  return a1;
}

char *sub_248ADF820(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_248AF5408();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v10 = a3[5];
  v11 = a3[6];
  v12 = &a1[v10];
  v13 = &a2[v10];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  v14 = &a1[v11];
  v15 = &a2[v11];
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
  v16 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v16] = *(_OWORD *)&a2[v16];
  v17 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *((_QWORD *)v18 + 2) = *((_QWORD *)v19 + 2);
  v20 = *(_OWORD *)v19;
  v21 = a3[11];
  v22 = a3[12];
  v23 = &a1[v22];
  v24 = &a2[v22];
  *(_OWORD *)v18 = v20;
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  v25 = sub_248AF55F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v23, v24, v25);
  return a1;
}

char *sub_248ADF9BC(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v10 = a3[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = *(_QWORD *)v12;
  LOBYTE(v12) = v12[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];
  swift_release();
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  swift_release();
  *((_QWORD *)v15 + 2) = *((_QWORD *)v16 + 2);
  v17 = a3[7];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *v18 = *v19;
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  swift_release();
  v20 = a3[8];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *v21 = *v22;
  *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
  swift_release();
  v23 = a3[9];
  v24 = &a1[v23];
  v25 = &a2[v23];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  swift_release();
  v26 = a3[10];
  v27 = &a1[v26];
  v28 = &a2[v26];
  *(_OWORD *)v27 = *(_OWORD *)v28;
  *((_QWORD *)v27 + 2) = *((_QWORD *)v28 + 2);
  swift_release();
  v29 = a3[11];
  v30 = &a1[v29];
  v31 = &a2[v29];
  *(_QWORD *)&a1[v29] = *(_QWORD *)&a2[v29];
  swift_release();
  *((_QWORD *)v30 + 1) = *((_QWORD *)v31 + 1);
  swift_release();
  v32 = a3[12];
  v33 = &a1[v32];
  v34 = &a2[v32];
  v35 = sub_248AF55F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 40))(v33, v34, v35);
  return a1;
}

uint64_t sub_248ADFC10()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248ADFC1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
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
    v8 = sub_248AF55F4();
    v10 = a1 + *(int *)(a3 + 48);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_248ADFCCC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248ADFCD8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
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
      *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return result;
    }
    v10 = sub_248AF55F4();
    v12 = a1 + *(int *)(a4 + 48);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for InstructionView()
{
  uint64_t result;

  result = qword_2577B2A10;
  if (!qword_2577B2A10)
    return swift_getSingletonMetadata();
  return result;
}

void sub_248ADFDC0()
{
  unint64_t v0;
  unint64_t v1;

  sub_248ABCFE0();
  if (v0 <= 0x3F)
  {
    sub_248AF55F4();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_248ADFE70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248ADFE80(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_248ADFEAC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>, double a6@<D0>)
{
  int *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  _OWORD *v17;
  char *v18;
  uint64_t v19;
  __int128 v21;
  uint64_t v22;

  *a5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  swift_storeEnumTagMultiPayload();
  v12 = (int *)type metadata accessor for InstructionView();
  v13 = (char *)a5 + v12[5];
  *(_QWORD *)v13 = a1;
  v13[8] = a2 & 1;
  v14 = (char *)a5 + v12[6];
  *(_QWORD *)v14 = a3;
  *((_QWORD *)v14 + 1) = a4;
  *((double *)v14 + 2) = a6;
  v15 = (char *)a5 + v12[7];
  sub_248AF57E0();
  *v15 = v21;
  *((_QWORD *)v15 + 1) = *((_QWORD *)&v21 + 1);
  v16 = (char *)a5 + v12[8];
  sub_248AF57E0();
  *v16 = v21;
  *((_QWORD *)v16 + 1) = *((_QWORD *)&v21 + 1);
  v17 = (_OWORD *)((char *)a5 + v12[9]);
  sub_248AF57E0();
  *v17 = v21;
  v18 = (char *)a5 + v12[10];
  type metadata accessor for CGSize(0);
  sub_248AF57E0();
  *(_OWORD *)v18 = v21;
  *((_QWORD *)v18 + 2) = v22;
  v19 = v12[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2BB8);
  sub_248AF57E0();
  *(_OWORD *)((char *)a5 + v19) = v21;
  return sub_248AF55E8();
}

uint64_t sub_248AE0058@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 49);
  return result;
}

uint64_t sub_248AE00E4()
{
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EE0();
  return swift_release();
}

uint64_t sub_248AE018C@<X0>(uint64_t a1@<X8>)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)@<X0>(uint64_t *@<X8>);
  uint64_t (*v32)@<X0>(uint64_t *@<X8>);
  uint64_t (**v33)@<X0>(uint64_t *@<X8>);
  uint64_t v34;
  uint64_t (**v35)(double *);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t KeyPath;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  char v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;

  v122 = a1;
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2A68);
  MEMORY[0x24BDAC7A8](v103);
  v3 = (char *)&v98 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = type metadata accessor for InstructionView();
  v4 = *(_QWORD *)(v113 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v113);
  v6 = (char *)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2A70);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v98 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1AB0);
  MEMORY[0x24BDAC7A8](v100);
  v11 = (char *)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1AB8);
  MEMORY[0x24BDAC7A8](v12);
  v101 = (uint64_t)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2A78);
  MEMORY[0x24BDAC7A8](v107);
  v15 = (char *)&v98 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2A80);
  MEMORY[0x24BDAC7A8](v110);
  v17 = (char *)&v98 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2A88);
  MEMORY[0x24BDAC7A8](v111);
  v19 = (char *)&v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2A90);
  MEMORY[0x24BDAC7A8](v109);
  v108 = (uint64_t)&v98 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2A98);
  v115 = *(_QWORD *)(v21 - 8);
  v116 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v112 = (char *)&v98 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2AA0);
  MEMORY[0x24BDAC7A8](v114);
  v121 = (char *)&v98 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2AA8);
  MEMORY[0x24BDAC7A8](v119);
  v120 = (uint64_t)&v98 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2AB0);
  MEMORY[0x24BDAC7A8](v118);
  v117 = (uint64_t)&v98 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = sub_248AF5324();
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v26 = (uint64_t *)&v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B2AB8) + 44)];
  v99 = v1;
  sub_248AE0CB8(v1, v26);
  v102 = v6;
  sub_248AC7574(v1, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
  v27 = *(unsigned __int8 *)(v4 + 80);
  v105 = ((v27 + 16) & ~v27) + v5;
  v28 = (v27 + 16) & ~v27;
  v106 = v28;
  v104 = v27 | 7;
  v29 = swift_allocObject();
  sub_248AE2DF8((uint64_t)v6, v29 + v28);
  v30 = sub_248AF58F4();
  v32 = v31;
  sub_248AB8870((uint64_t)v9, (uint64_t)v3, &qword_2577B2A70);
  v33 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v3[*(int *)(v103 + 36)];
  *v33 = sub_248ACBF10;
  v33[1] = 0;
  v33[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v30;
  v33[3] = v32;
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = sub_248AE2E3C;
  *(_QWORD *)(v34 + 24) = v29;
  sub_248AB8870((uint64_t)v3, (uint64_t)v11, &qword_2577B2A68);
  v35 = (uint64_t (**)(double *))&v11[*(int *)(v100 + 36)];
  *v35 = sub_248AC849C;
  v35[1] = (uint64_t (*)(double *))v34;
  sub_248AB89E8((uint64_t)v3, &qword_2577B2A68);
  sub_248AB89E8((uint64_t)v9, &qword_2577B2A70);
  sub_248AF58F4();
  v36 = v101;
  sub_248AC1728(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v101, 0.0, 1, 0.0, 1);
  sub_248AB89E8((uint64_t)v11, &qword_2577B1AB0);
  LOBYTE(v29) = sub_248AF5534();
  sub_248AF4F88();
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  sub_248AB8870(v36, (uint64_t)v15, &qword_2577B1AB8);
  v45 = &v15[*(int *)(v107 + 36)];
  *v45 = v29;
  *((_QWORD *)v45 + 1) = v38;
  *((_QWORD *)v45 + 2) = v40;
  *((_QWORD *)v45 + 3) = v42;
  *((_QWORD *)v45 + 4) = v44;
  v45[40] = 0;
  sub_248AB89E8(v36, &qword_2577B1AB8);
  LOBYTE(v29) = sub_248AF5510();
  sub_248AF4F88();
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  sub_248AB8870((uint64_t)v15, (uint64_t)v17, &qword_2577B2A78);
  v54 = &v17[*(int *)(v110 + 36)];
  *v54 = v29;
  *((_QWORD *)v54 + 1) = v47;
  *((_QWORD *)v54 + 2) = v49;
  *((_QWORD *)v54 + 3) = v51;
  *((_QWORD *)v54 + 4) = v53;
  v54[40] = 0;
  sub_248AB89E8((uint64_t)v15, &qword_2577B2A78);
  KeyPath = swift_getKeyPath();
  sub_248AB8870((uint64_t)v17, (uint64_t)v19, &qword_2577B2A80);
  v56 = &v19[*(int *)(v111 + 36)];
  *(_QWORD *)v56 = KeyPath;
  v56[8] = 1;
  sub_248AB89E8((uint64_t)v17, &qword_2577B2A80);
  v57 = v113;
  v58 = v99;
  v59 = v99 + *(int *)(v113 + 28);
  v60 = *(_BYTE *)v59;
  v111 = v59;
  v61 = *(_QWORD *)(v59 + 8);
  LOBYTE(v126) = v60;
  v127 = v61;
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57EC();
  if (v123)
    v62 = -10.0;
  else
    v62 = 0.0;
  v63 = v108;
  sub_248AB8870((uint64_t)v19, v108, &qword_2577B2A88);
  v64 = v63 + *(int *)(v109 + 36);
  *(double *)v64 = v62;
  *(_QWORD *)(v64 + 8) = 0;
  sub_248AB89E8((uint64_t)v19, &qword_2577B2A88);
  v65 = v58 + *(int *)(v57 + 20);
  v66 = *(_BYTE *)(v65 + 8);
  v67 = swift_retain();
  v68 = sub_248ADB034(v67, v66);
  swift_release();
  swift_getKeyPath();
  v126 = v68;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  v69 = *(_BYTE *)(v68 + 49);
  swift_release();
  LOBYTE(v126) = v69;
  v70 = (uint64_t)v102;
  sub_248AC7574(v58, (uint64_t)v102, (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
  v71 = swift_allocObject();
  sub_248AE2DF8(v70, v71 + v106);
  sub_248ABD838(&qword_2577B2AC0, &qword_2577B2A90, (uint64_t (*)(void))sub_248AE32E8, MEMORY[0x24BDEC438]);
  v72 = v112;
  sub_248AF572C();
  swift_release();
  sub_248AB89E8(v63, &qword_2577B2A90);
  LOBYTE(v68) = *(_BYTE *)(v65 + 8);
  v73 = swift_retain();
  v74 = sub_248ADB034(v73, v68);
  swift_release();
  swift_getKeyPath();
  v126 = v74;
  sub_248AF4EEC();
  swift_release();
  v75 = *(unsigned __int8 *)(v74 + 52);
  swift_release();
  if (v75 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B10);
    v76 = swift_allocObject();
    *(_OWORD *)(v76 + 16) = xmmword_248AF7950;
    v77 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    *(_QWORD *)(v76 + 32) = MEMORY[0x2495A4DCC](v77);
    *(_QWORD *)(v76 + 40) = sub_248AF575C();
    v126 = v76;
    sub_248AF5B34();
    v78 = v126;
    sub_248AF5990();
    sub_248AF5984();
    MEMORY[0x2495A4EBC](v78);
    sub_248AF50CC();
    v113 = v126;
    v109 = v127;
    v79 = v129;
    v108 = v128;
    v80 = v130;
    v81 = sub_248AF50FC();
    v82 = sub_248AF551C();
  }
  else
  {
    v113 = 0;
    v109 = 0;
    v108 = 0;
    v79 = 0;
    v80 = 0;
    v81 = 0;
    v82 = 0;
  }
  v83 = sub_248AF58F4();
  v85 = v84;
  v87 = v115;
  v86 = v116;
  v88 = (uint64_t)v121;
  (*(void (**)(char *, char *, uint64_t))(v115 + 16))(v121, v72, v116);
  v89 = v88 + *(int *)(v114 + 36);
  v90 = v109;
  *(_QWORD *)v89 = v113;
  *(_QWORD *)(v89 + 8) = v90;
  *(_QWORD *)(v89 + 16) = v108;
  *(_QWORD *)(v89 + 24) = v79;
  *(_QWORD *)(v89 + 32) = v80;
  *(_QWORD *)(v89 + 40) = v81;
  *(_BYTE *)(v89 + 48) = v82;
  *(_QWORD *)(v89 + 56) = v83;
  *(_QWORD *)(v89 + 64) = v85;
  (*(void (**)(char *, uint64_t))(v87 + 8))(v72, v86);
  sub_248AF596C();
  v91 = sub_248AF5918();
  swift_release();
  v92 = *(_QWORD *)(v111 + 8);
  v123 = *(_BYTE *)v111;
  v124 = v92;
  sub_248AF57EC();
  v93 = v125;
  v94 = v120;
  sub_248AB8870(v88, v120, &qword_2577B2AA0);
  v95 = v94 + *(int *)(v119 + 36);
  *(_QWORD *)v95 = v91;
  *(_BYTE *)(v95 + 8) = v93;
  sub_248AB89E8(v88, &qword_2577B2AA0);
  v96 = v117;
  sub_248AB8870(v94, v117, &qword_2577B2AA8);
  *(_BYTE *)(v96 + *(int *)(v118 + 36)) = 0;
  sub_248AB89E8(v94, &qword_2577B2AA8);
  return sub_248AE34FC(v96, v122);
}

uint64_t sub_248AE0CB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  char *v28;
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
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  char *v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
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
  unsigned int (*v78)(uint64_t, uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unsigned int (*v84)(uint64_t, uint64_t, uint64_t);
  uint64_t v85;
  uint64_t v86;
  char *v87;
  void (*v88)(char *, uint64_t);
  char *v89;
  void (*v90)(char *, uint64_t);
  char v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  _OWORD *v96;
  __int128 v97;
  uint64_t KeyPath;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  double v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t (**v111)();
  char v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  double v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  void (*v122)(char *, char *, uint64_t);
  char *v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  __int128 v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  void (*v131)(char *, uint64_t);
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  char *v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  __int128 v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t *v176;
  uint64_t v177;
  uint64_t v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  double v182;
  uint64_t v183;
  char v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;

  v176 = a2;
  v3 = type metadata accessor for InstructionView();
  v172 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v173 = v4;
  v174 = (uint64_t)&v133 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v154 = sub_248AF5408();
  v153 = *(_QWORD *)(v154 - 8);
  MEMORY[0x24BDAC7A8](v154);
  v136 = (char *)&v133 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1470);
  v6 = MEMORY[0x24BDAC7A8](v152);
  v137 = (uint64_t)&v133 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v138 = (uint64_t)&v133 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v135 = (uint64_t)&v133 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v142 = (uint64_t)&v133 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v140 = (uint64_t)&v133 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v134 = (uint64_t)&v133 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v141 = (uint64_t)&v133 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v139 = (uint64_t)&v133 - v20;
  v151 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B2750);
  v150 = *(_QWORD *)(v151 - 8);
  MEMORY[0x24BDAC7A8](v151);
  v149 = (char *)&v133 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v148 = type metadata accessor for SystemFontScaledSupport();
  MEMORY[0x24BDAC7A8](v148);
  v144 = (char *)&v133 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_248AF55C4();
  v146 = *(_QWORD *)(v23 - 8);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v145 = (char *)&v133 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v133 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v147 = (char *)&v133 - v29;
  v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B38);
  MEMORY[0x24BDAC7A8](v143);
  v157 = (char *)&v133 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B40);
  MEMORY[0x24BDAC7A8](v155);
  v158 = (uint64_t)&v133 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B48);
  MEMORY[0x24BDAC7A8](v156);
  v160 = (uint64_t)&v133 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B50);
  MEMORY[0x24BDAC7A8](v159);
  v161 = (uint64_t)&v133 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B58);
  MEMORY[0x24BDAC7A8](v168);
  v169 = (uint64_t)&v133 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B60);
  v180 = *(_QWORD *)(v171 - 8);
  v35 = MEMORY[0x24BDAC7A8](v171);
  v170 = (char *)&v133 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v167 = (char *)&v133 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v179 = (char *)&v133 - v39;
  v181 = v3;
  v40 = *(int *)(v3 + 20);
  v175 = a1;
  v41 = a1 + v40;
  v42 = *(_BYTE *)(a1 + v40 + 8);
  v43 = swift_retain();
  v44 = sub_248ADB034(v43, v42);
  swift_release();
  swift_getKeyPath();
  *(_QWORD *)&v185 = v44;
  v45 = sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  LODWORD(a1) = *(unsigned __int8 *)(v44 + 48);
  swift_release();
  v178 = v41;
  if ((_DWORD)a1 == 1)
  {
    type metadata accessor for TrainingManager();
    v166 = sub_248AF4FDC();
    v165 = v46 & 1;
    v182 = 0.0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1158);
    sub_248AF57E0();
    v164 = v185;
    v182 = 0.0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1168);
    sub_248AF57E0();
    v162 = *((_QWORD *)&v185 + 1);
    v163 = (void *)v185;
    v42 = *(_BYTE *)(v41 + 8);
  }
  else
  {
    v166 = 0;
    v165 = 0;
    v163 = 0;
    v162 = 0;
    v164 = 1uLL;
  }
  v47 = swift_retain();
  v48 = sub_248ADB034(v47, v42);
  swift_release();
  swift_getKeyPath();
  *(_QWORD *)&v185 = v48;
  v177 = v45;
  sub_248AF4EEC();
  swift_release();
  v50 = *(_QWORD *)(v48 + 16);
  v49 = *(_QWORD *)(v48 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  v51 = v181;
  v52 = v175;
  v53 = (uint64_t *)(v175 + *(int *)(v181 + 36));
  v54 = *v53;
  v55 = v53[1];
  *(_QWORD *)&v185 = v54;
  *((_QWORD *)&v185 + 1) = v55;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
  sub_248AF57EC();
  v56 = v182;
  v57 = v146;
  v58 = v147;
  (*(void (**)(char *, _QWORD, uint64_t))(v146 + 104))(v147, *MEMORY[0x24BDF1880], v23);
  sub_248AF5588();
  v60 = v59;
  v61 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  v61(v28, v58, v23);
  *(double *)&v185 = v56;
  v61(v145, v28, v23);
  sub_248ADC140();
  v62 = v149;
  sub_248AF4FF4();
  v63 = *(void (**)(char *, uint64_t))(v57 + 8);
  v63(v28, v23);
  v64 = (uint64_t)v144;
  (*(void (**)(char *, char *, uint64_t))(v150 + 32))(v144, v62, v151);
  *(_QWORD *)(v64 + *(int *)(v148 + 20)) = v60;
  v65 = (uint64_t)v157;
  sub_248AC7574(v64, (uint64_t)&v157[*(int *)(v143 + 36)], (uint64_t (*)(_QWORD))type metadata accessor for SystemFontScaledSupport);
  *(_QWORD *)v65 = v50;
  *(_QWORD *)(v65 + 8) = v49;
  *(_BYTE *)(v65 + 16) = 0;
  *(_QWORD *)(v65 + 24) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  sub_248AC75B8(v64, (uint64_t (*)(_QWORD))type metadata accessor for SystemFontScaledSupport);
  v63(v58, v23);
  swift_bridgeObjectRelease();
  v66 = v52;
  v67 = (uint64_t *)(v52 + *(int *)(v51 + 24));
  v68 = *v67;
  v69 = v67[1];
  v70 = v67[2];
  *(_QWORD *)&v185 = *v67;
  *((_QWORD *)&v185 + 1) = v69;
  *(_QWORD *)&v186 = v70;
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14E8);
  MEMORY[0x2495A4E68](&v182);
  if (v182 <= 0.0)
  {
    v79 = v140;
    sub_248ADB6C8(v140);
    v80 = v153;
    v81 = v142;
    v82 = v154;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v153 + 104))(v142, *MEMORY[0x24BDEFEE8], v154);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v80 + 56))(v81, 0, 1, v82);
    v76 = v137;
    v83 = v137 + *(int *)(v152 + 48);
    sub_248AB8870(v79, v137, &qword_2577B1300);
    sub_248AB8870(v81, v83, &qword_2577B1300);
    v84 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v80 + 48);
    if (v84(v76, 1, v82) == 1)
    {
      sub_248AB89E8(v81, &qword_2577B1300);
      sub_248AB89E8(v79, &qword_2577B1300);
      if (v84(v83, 1, v82) == 1)
      {
LABEL_10:
        sub_248AB89E8(v76, &qword_2577B1300);
        goto LABEL_19;
      }
      goto LABEL_16;
    }
    v86 = v135;
    sub_248AB8870(v76, v135, &qword_2577B1300);
    if (v84(v83, 1, v82) == 1)
    {
      sub_248AB89E8(v142, &qword_2577B1300);
      sub_248AB89E8(v79, &qword_2577B1300);
      (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v86, v82);
LABEL_16:
      sub_248AB89E8(v76, &qword_2577B1470);
      goto LABEL_19;
    }
    v89 = v136;
    (*(void (**)(char *, uint64_t, uint64_t))(v80 + 32))(v136, v83, v82);
    sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
    LODWORD(v152) = sub_248AF5A14();
    v90 = *(void (**)(char *, uint64_t))(v80 + 8);
    v90(v89, v82);
    sub_248AB89E8(v142, &qword_2577B1300);
    sub_248AB89E8(v140, &qword_2577B1300);
    v90((char *)v86, v82);
    sub_248AB89E8(v76, &qword_2577B1300);
  }
  else
  {
    *(_QWORD *)&v185 = v68;
    *((_QWORD *)&v185 + 1) = v69;
    *(_QWORD *)&v186 = v70;
    MEMORY[0x2495A4E68](&v182, v71, v182);
    v72 = v139;
    sub_248ADB6C8(v139);
    v73 = v153;
    v74 = v141;
    v75 = v154;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v153 + 104))(v141, *MEMORY[0x24BDEFEE8], v154);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v73 + 56))(v74, 0, 1, v75);
    v76 = v138;
    v77 = v138 + *(int *)(v152 + 48);
    sub_248AB8870(v72, v138, &qword_2577B1300);
    sub_248AB8870(v74, v77, &qword_2577B1300);
    v78 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v73 + 48);
    if (v78(v76, 1, v75) == 1)
    {
      sub_248AB89E8(v74, &qword_2577B1300);
      sub_248AB89E8(v72, &qword_2577B1300);
      if (v78(v77, 1, v75) == 1)
        goto LABEL_10;
      goto LABEL_16;
    }
    v85 = v134;
    sub_248AB8870(v76, v134, &qword_2577B1300);
    if (v78(v77, 1, v75) == 1)
    {
      sub_248AB89E8(v141, &qword_2577B1300);
      sub_248AB89E8(v72, &qword_2577B1300);
      (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v85, v75);
      goto LABEL_16;
    }
    v87 = v136;
    (*(void (**)(char *, uint64_t, uint64_t))(v73 + 32))(v136, v77, v75);
    sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
    LODWORD(v152) = sub_248AF5A14();
    v88 = *(void (**)(char *, uint64_t))(v73 + 8);
    v88(v87, v75);
    sub_248AB89E8(v141, &qword_2577B1300);
    sub_248AB89E8(v139, &qword_2577B1300);
    v88((char *)v85, v75);
    sub_248AB89E8(v76, &qword_2577B1300);
  }
LABEL_19:
  v91 = *(_BYTE *)(v178 + 8);
  v92 = swift_retain();
  v93 = sub_248ADB034(v92, v91);
  swift_release();
  swift_getKeyPath();
  *(_QWORD *)&v185 = v93;
  sub_248AF4EEC();
  swift_release();
  v94 = *(unsigned __int8 *)(v93 + 48);
  swift_release();
  if (v94 == 1)
    sub_248AF58DC();
  else
    sub_248AF58F4();
  sub_248AF5048();
  v95 = v158;
  sub_248AB8870(v65, v158, &qword_2577B2B38);
  v96 = (_OWORD *)(v95 + *(int *)(v155 + 36));
  v97 = v186;
  *v96 = v185;
  v96[1] = v97;
  v96[2] = v187;
  sub_248AB89E8(v65, &qword_2577B2B38);
  KeyPath = swift_getKeyPath();
  v99 = v160;
  sub_248AB8870(v95, v160, &qword_2577B2B40);
  v100 = (uint64_t *)(v99 + *(int *)(v156 + 36));
  *v100 = KeyPath;
  v100[1] = 0x3FE0000000000000;
  sub_248AB89E8(v95, &qword_2577B2B40);
  v101 = v66 + *(int *)(v181 + 32);
  v102 = *(_BYTE *)v101;
  v103 = *(_QWORD *)(v101 + 8);
  LOBYTE(v182) = v102;
  v183 = v103;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57EC();
  if (v184)
    v104 = 1.0;
  else
    v104 = 0.0;
  v105 = v161;
  sub_248AB8870(v99, v161, &qword_2577B2B48);
  *(double *)(v105 + *(int *)(v159 + 36)) = v104;
  sub_248AB89E8(v99, &qword_2577B2B48);
  v106 = v174;
  sub_248AC7574(v66, v174, (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
  v107 = (*(unsigned __int8 *)(v172 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v172 + 80);
  v108 = swift_allocObject();
  sub_248AE2DF8(v106, v108 + v107);
  v109 = v66;
  v110 = v169;
  sub_248AB8870(v105, v169, &qword_2577B2B50);
  v111 = (uint64_t (**)())(v110 + *(int *)(v168 + 36));
  *v111 = sub_248AE37B4;
  v111[1] = (uint64_t (*)())v108;
  v111[2] = 0;
  v111[3] = 0;
  sub_248AB89E8(v105, &qword_2577B2B50);
  v112 = *(_BYTE *)(v178 + 8);
  v113 = swift_retain();
  *(double *)&v114 = COERCE_DOUBLE(sub_248ADB034(v113, v112));
  swift_release();
  swift_getKeyPath();
  v182 = *(double *)&v114;
  sub_248AF4EEC();
  swift_release();
  v116 = *(double *)(v114 + 16);
  v115 = *(_QWORD *)(v114 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  v182 = v116;
  v183 = v115;
  sub_248AC7574(v109, v106, (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
  v117 = swift_allocObject();
  sub_248AE2DF8(v106, v117 + v107);
  sub_248ABD838(&qword_2577B2B68, &qword_2577B2B58, sub_248AE37D0, MEMORY[0x24BDF0910]);
  v118 = v167;
  sub_248AF5738();
  swift_release();
  swift_bridgeObjectRelease();
  sub_248AB89E8(v110, &qword_2577B2B58);
  v120 = v179;
  v119 = v180;
  v121 = v171;
  (*(void (**)(char *, char *, uint64_t))(v180 + 32))(v179, v118, v171);
  v122 = *(void (**)(char *, char *, uint64_t))(v119 + 16);
  v123 = v170;
  v122(v170, v120, v121);
  v124 = v176;
  v125 = v166;
  v126 = v165;
  *v176 = v166;
  v124[1] = v126;
  v127 = v164;
  *((_OWORD *)v124 + 1) = v164;
  v128 = v163;
  v129 = v162;
  v124[4] = (uint64_t)v163;
  v124[5] = v129;
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2BA8);
  v122((char *)v124 + *(int *)(v130 + 48), v123, v121);
  sub_248AE391C(v125, v126, (void *)v127, *((uint64_t *)&v127 + 1), v128);
  v131 = *(void (**)(char *, uint64_t))(v180 + 8);
  v131(v179, v121);
  v131(v123, v121);
  return sub_248AE3980(v125, v126, (void *)v127, *((uint64_t *)&v127 + 1), v128);
}

uint64_t sub_248AE1F0C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void (*v18)(char *, uint64_t);
  uint64_t (*v19)(char *, uint64_t);
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 aBlock;
  uint64_t (*v36)(uint64_t);
  void *v37;
  uint64_t (*v38)();
  uint64_t v39;
  double v40;
  double v41;

  v31 = sub_248AF599C();
  v34 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v30 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_248AF59C0();
  v32 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for InstructionView();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = sub_248AF59D8();
  v10 = *(_QWORD *)(v9 - 8);
  v29 = v9;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v27 - v14;
  v16 = a1 + *(int *)(v6 + 40);
  v17 = *(uint64_t (**)(uint64_t))(v16 + 16);
  aBlock = *(_OWORD *)v16;
  v36 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B30);
  sub_248AF57EC();
  sub_248AE223C(v40, v41);
  sub_248ADA0E4();
  v28 = sub_248AF5C0C();
  sub_248AF59CC();
  MEMORY[0x2495A5018](v13, 0.5);
  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  v19 = (uint64_t (*)(char *, uint64_t))v18;
  sub_248AC7574(a1, (uint64_t)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
  v20 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v21 = swift_allocObject();
  sub_248AE2DF8((uint64_t)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20);
  v38 = sub_248AE3B44;
  v39 = v21;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v36 = sub_248ADFE80;
  v37 = &block_descriptor_2;
  v22 = _Block_copy(&aBlock);
  swift_release();
  sub_248AF59A8();
  *(_QWORD *)&aBlock = MEMORY[0x24BEE4AF8];
  sub_248AB80A8((unint64_t *)&unk_2577B14A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11E0);
  sub_248AB8BE8(&qword_2577B14B0, &qword_2577B11E0, MEMORY[0x24BEE12C8]);
  v24 = v30;
  v23 = v31;
  sub_248AF5C84();
  v25 = (void *)v28;
  MEMORY[0x2495A5228](v15, v5, v24, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v34 + 8))(v24, v23);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v33);
  return v19(v15, v29);
}

uint64_t sub_248AE223C(double a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;

  v3 = v2;
  v6 = type metadata accessor for InstructionView();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AC7574(v2, (uint64_t)v8, v9);
  if (a1 == 0.0 && a2 == 0.0)
    return sub_248AC75B8((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
  v11 = v8[*(int *)(v6 + 20) + 8];
  v12 = swift_retain();
  v13 = sub_248ADB034(v12, v11);
  swift_release();
  swift_getKeyPath();
  v26 = v13;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v13 + 24);
  swift_release();
  if ((v15 & 0x2000000000000000) != 0)
    v16 = HIBYTE(v15) & 0xF;
  else
    v16 = v14 & 0xFFFFFFFFFFFFLL;
  result = sub_248AC75B8((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
  if (v16)
  {
    sub_248AF5570();
    v17 = sub_248AE2EA4();
    swift_release();
    if (v17 <= 2)
    {
      v22 = (uint64_t *)(v3 + *(int *)(v6 + 36));
      v23 = *v22;
      v24 = v22[1];
      v26 = v23;
      v27 = v24;
      v21 = 0x403C000000000000;
    }
    else
    {
      v18 = (uint64_t *)(v3 + *(int *)(v6 + 36));
      v19 = *v18;
      v20 = v18[1];
      v26 = v19;
      v27 = v20;
      if (v17 == 3)
        v21 = 0x4033000000000000;
      else
        v21 = 0x4030000000000000;
    }
    v25[1] = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
    return sub_248AF57F8();
  }
  return result;
}

uint64_t sub_248AE2440()
{
  sub_248AF596C();
  sub_248AF50B4();
  return swift_release();
}

uint64_t sub_248AE24AC()
{
  type metadata accessor for InstructionView();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57EC();
  sub_248AF57F8();
  return swift_release();
}

uint64_t sub_248AE255C()
{
  double v1;
  double v2;

  type metadata accessor for InstructionView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B30);
  sub_248AF57EC();
  return sub_248AE223C(v1, v2);
}

uint64_t sub_248AE25C4()
{
  type metadata accessor for InstructionView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B30);
  return sub_248AF57F8();
}

void sub_248AE2638(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  if (*a2 == 1)
  {
    v2 = sub_248AF5954();
    MEMORY[0x24BDAC7A8](v2);
    sub_248AF50B4();
    swift_release();
  }
}

uint64_t sub_248AE26D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v2 = type metadata accessor for InstructionView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2550);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1 + *(int *)(v2 + 28);
  v10 = *(_BYTE *)v9;
  v11 = *(_QWORD *)(v9 + 8);
  LOBYTE(v20) = v10;
  *((_QWORD *)&v20 + 1) = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  result = sub_248AF57EC();
  if ((v21 & 1) == 0)
  {
    v13 = *(int *)(v2 + 44);
    v20 = *(_OWORD *)(a1 + v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B18);
    sub_248AF57EC();
    if (v21)
    {
      sub_248AF5BA0();
      swift_release();
    }
    v14 = sub_248AF5B94();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
    sub_248AC7574(a1, (uint64_t)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for InstructionView);
    sub_248AF5B70();
    v15 = sub_248AF5B64();
    v16 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v17 = swift_allocObject();
    v18 = MEMORY[0x24BEE6930];
    *(_QWORD *)(v17 + 16) = v15;
    *(_QWORD *)(v17 + 24) = v18;
    sub_248AE2DF8((uint64_t)v5, v17 + v16);
    v19 = sub_248AE9D80((uint64_t)v8, (uint64_t)&unk_2577B2B28, v17);
    v20 = *(_OWORD *)(a1 + v13);
    v21 = v19;
    return sub_248AF57F8();
  }
  return result;
}

uint64_t sub_248AE28D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[9] = a4;
  v5 = sub_248AF5CD8();
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 - 8);
  v4[12] = swift_task_alloc();
  sub_248AF5B70();
  v4[13] = sub_248AF5B64();
  v4[14] = sub_248AF5B58();
  v4[15] = v6;
  return swift_task_switch();
}

uint64_t sub_248AE2968()
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
  _QWORD *v10;
  char *v12;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = type metadata accessor for InstructionView();
  *(_QWORD *)(v0 + 128) = v2;
  v3 = *(int *)(v2 + 28);
  *(_DWORD *)(v0 + 160) = v3;
  v4 = (char *)(v1 + v3);
  v5 = *v4;
  v6 = *((_QWORD *)v4 + 1);
  *(_BYTE *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v6;
  *(_BYTE *)(v0 + 164) = 1;
  *(_QWORD *)(v0 + 136) = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57F8();
  v7 = sub_248AF5DBC();
  v9 = v8;
  sub_248AF5CCC();
  v12 = (char *)&dword_2577B1918 + dword_2577B1918;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v10;
  *v10 = v0;
  v10[1] = sub_248AE2A60;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))v12)(v7, v9, 0, 0, 1);
}

uint64_t sub_248AE2A60()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[11] + 8))(v2[12], v2[10]);
  return swift_task_switch();
}

uint64_t sub_248AE2AD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 72);
  swift_release();
  LOBYTE(v2) = *(_BYTE *)(v2 + *(int *)(v1 + 20) + 8);
  v3 = swift_retain();
  v4 = sub_248ADB034(v3, v2);
  swift_release();
  swift_getKeyPath();
  *(_QWORD *)(v0 + 56) = v4;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  if (*(_BYTE *)(v4 + 48) == 1)
  {
    swift_release();
  }
  else
  {
    swift_getKeyPath();
    v5 = swift_task_alloc();
    *(_QWORD *)(v5 + 16) = v4;
    *(_BYTE *)(v5 + 24) = 0;
    *(_QWORD *)(v0 + 64) = v4;
    sub_248AF4EE0();
    swift_release();
    swift_release();
    swift_task_dealloc();
  }
  v6 = (char *)(*(_QWORD *)(v0 + 72) + *(int *)(v0 + 160));
  v7 = *v6;
  v8 = *((_QWORD *)v6 + 1);
  *(_BYTE *)(v0 + 32) = v7;
  *(_QWORD *)(v0 + 40) = v8;
  *(_BYTE *)(v0 + 165) = 0;
  sub_248AF57F8();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AE2C64()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  _BOOL4 v3;
  void *v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8;

  swift_release();
  if (qword_2577B10D8 != -1)
    swift_once();
  v1 = (id)qword_2577B3500;
  v2 = sub_248AF5BDC();
  v3 = os_log_type_enabled(v1, v2);
  v4 = *(void **)(v0 + 152);
  if (v3)
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v8 = v6;
    *(_DWORD *)v5 = 136315138;
    *(_QWORD *)(v0 + 48) = sub_248AF3998(0xD000000000000023, 0x8000000248AF9160, &v8);
    sub_248AF5C54();
    _os_log_impl(&dword_248AB5000, v1, v2, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A581C](v6, -1, -1);
    MEMORY[0x2495A581C](v5, -1, -1);
  }

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AE2DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InstructionView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248AE2E3C()
{
  type metadata accessor for InstructionView();
  return sub_248AE25C4();
}

uint64_t sub_248AE2E80()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AE2EA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2BB0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_248AF560C();
  v39 = v5;
  v40 = v4;
  v41 = v6;
  v38 = v7 & 1;
  v8 = *(_BYTE *)(v0 + *(int *)(type metadata accessor for InstructionView() + 20) + 8);
  v9 = swift_retain();
  v10 = sub_248ADB034(v9, v8);
  swift_release();
  swift_getKeyPath();
  v42 = v10;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  v12 = *(_QWORD *)(v10 + 16);
  v11 = *(_QWORD *)(v10 + 24);
  swift_bridgeObjectRetain();
  swift_release();
  v42 = v12;
  v43 = v11;
  sub_248ABDD1C();
  v13 = sub_248AF5624();
  v15 = v14;
  v17 = v16 & 1;
  v18 = sub_248AF560C();
  v35 = v19;
  v36 = v18;
  v37 = v20;
  v22 = v21 & 1;
  sub_248ABF9B0(v13, v15, v17);
  swift_bridgeObjectRelease();
  v23 = sub_248AF55D0();
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56);
  v24(v3, 1, 1, v23);
  v25 = v39;
  v26 = v40;
  LOBYTE(v10) = v38;
  sub_248AF55DC();
  v28 = v27;
  sub_248AB89E8((uint64_t)v3, &qword_2577B2BB0);
  v24(v3, 1, 1, v23);
  v29 = v35;
  v30 = v36;
  sub_248AF55DC();
  v32 = v31;
  sub_248AB89E8((uint64_t)v3, &qword_2577B2BB0);
  v33 = round(v32 / v28);
  sub_248ABF9B0(v30, v29, v22);
  swift_bridgeObjectRelease();
  sub_248ABF9B0(v26, v25, v10);
  result = swift_bridgeObjectRelease();
  if ((~*(_QWORD *)&v33 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v33 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v33 < 9.22337204e18)
    return (uint64_t)v33;
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_248AE31AC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_248AF51EC();
  *a1 = v3;
  return result;
}

uint64_t sub_248AE31D4()
{
  return sub_248AF51F8();
}

uint64_t sub_248AE31F8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_248AF521C();
  *a1 = result;
  return result;
}

uint64_t sub_248AE3220@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_248AF521C();
  *a1 = result;
  return result;
}

uint64_t sub_248AE3248()
{
  return sub_248AF5228();
}

uint64_t sub_248AE326C()
{
  return sub_248AF5228();
}

void sub_248AE329C(uint64_t a1, _BYTE *a2)
{
  type metadata accessor for InstructionView();
  sub_248AE2638(a1, a2);
}

unint64_t sub_248AE32E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2AC8;
  if (!qword_2577B2AC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2A88);
    v2[0] = sub_248ABD838(&qword_2577B2AD0, &qword_2577B2A80, sub_248AE338C, MEMORY[0x24BDECC60]);
    v2[1] = sub_248AB8BE8(&qword_2577B2B00, &qword_2577B2B08, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2AC8);
  }
  return result;
}

uint64_t sub_248AE338C()
{
  return sub_248ABD838(&qword_2577B2AD8, &qword_2577B2A78, sub_248AE33B0, MEMORY[0x24BDECC60]);
}

uint64_t sub_248AE33B0()
{
  return sub_248ABD838(&qword_2577B2AE0, &qword_2577B1AB8, (uint64_t (*)(void))sub_248AE33D4, MEMORY[0x24BDEDBB8]);
}

unint64_t sub_248AE33D4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2AE8;
  if (!qword_2577B2AE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1AB0);
    v2[0] = sub_248AE3458();
    v2[1] = sub_248AB8BE8(&qword_2577B1C10, &qword_2577B1C18, MEMORY[0x24BDF09B0]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2AE8);
  }
  return result;
}

unint64_t sub_248AE3458()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2AF0;
  if (!qword_2577B2AF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2A68);
    v2[0] = sub_248AB8BE8(&qword_2577B2AF8, &qword_2577B2A70, MEMORY[0x24BDF4700]);
    v2[1] = sub_248AB8BE8(&qword_2577B1C00, &qword_2577B1C08, MEMORY[0x24BDEF370]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2AF0);
  }
  return result;
}

uint64_t sub_248AE34FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2AB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248AE3544()
{
  uint64_t v0;

  return sub_248AE26D0(*(_QWORD *)(v0 + 16));
}

uint64_t sub_248AE355C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for InstructionView();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_248AF5408();
    v4 = *(_QWORD *)(v3 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
      (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v5 = v0 + v2 + *(int *)(v1 + 48);
  v6 = sub_248AF55F4();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocObject();
}

uint64_t sub_248AE36D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for InstructionView() - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_248AC7858;
  return sub_248AE28D4(a1, v5, v6, v7);
}

uint64_t sub_248AE3764@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_248AF51EC();
  *a1 = v3;
  return result;
}

uint64_t sub_248AE378C()
{
  return sub_248AF51F8();
}

uint64_t sub_248AE37B4()
{
  return sub_248AE3B50(sub_248AE1F0C);
}

uint64_t sub_248AE37C4()
{
  return sub_248AE3B50((uint64_t (*)(uint64_t))sub_248AE255C);
}

uint64_t sub_248AE37D0()
{
  return sub_248ABD838(&qword_2577B2B70, &qword_2577B2B50, (uint64_t (*)(void))sub_248AE37F4, MEMORY[0x24BDECC38]);
}

unint64_t sub_248AE37F4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2B78;
  if (!qword_2577B2B78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2B48);
    v2[0] = sub_248ABD838(&qword_2577B2B80, &qword_2577B2B40, (uint64_t (*)(void))sub_248AE3898, MEMORY[0x24BDEBEE0]);
    v2[1] = sub_248AB8BE8(&qword_2577B2B98, &qword_2577B2BA0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2B78);
  }
  return result;
}

unint64_t sub_248AE3898()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2577B2B88;
  if (!qword_2577B2B88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2B38);
    v2 = sub_248AB80A8(&qword_2577B2B90, (uint64_t (*)(uint64_t))type metadata accessor for SystemFontScaledSupport, (uint64_t)&unk_248AF7608);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2577B2B88);
  }
  return result;
}

id sub_248AE391C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v6;
  id result;

  if (a3 != (void *)1)
  {
    swift_retain();
    swift_retain();
    v6 = a3;
    swift_retain();
    return a5;
  }
  return result;
}

uint64_t sub_248AE3980(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t result;

  if (a3 != (void *)1)
  {
    swift_release();

    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t objectdestroyTm_4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for InstructionView();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_248AF5408();
    v4 = *(_QWORD *)(v3 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
      (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v5 = v0 + v2 + *(int *)(v1 + 48);
  v6 = sub_248AF55F4();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocObject();
}

uint64_t sub_248AE3B44()
{
  return sub_248AE3B50((uint64_t (*)(uint64_t))sub_248AE2440);
}

uint64_t sub_248AE3B50(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for InstructionView() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_248AE3BA4()
{
  return sub_248AE24AC();
}

unint64_t sub_248AE3BC8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2BC0;
  if (!qword_2577B2BC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2AB0);
    v2[0] = sub_248AE3C34();
    v2[1] = sub_248AE3DA0();
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2BC0);
  }
  return result;
}

unint64_t sub_248AE3C34()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2BC8;
  if (!qword_2577B2BC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2AA8);
    v2[0] = sub_248AE3CB8();
    v2[1] = sub_248AB8BE8(&qword_2577B18F8, &qword_2577B1900, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2BC8);
  }
  return result;
}

unint64_t sub_248AE3CB8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  result = qword_2577B2BD0;
  if (!qword_2577B2BD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2AA0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2A90);
    v3 = sub_248ABD838(&qword_2577B2AC0, &qword_2577B2A90, (uint64_t (*)(void))sub_248AE32E8, MEMORY[0x24BDEC438]);
    v4[2] = v2;
    v4[3] = MEMORY[0x24BEE1328];
    v4[4] = v3;
    v4[5] = MEMORY[0x24BEE1340];
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = sub_248AB8BE8(&qword_2577B2BD8, &qword_2577B2BE0, MEMORY[0x24BDEF370]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2577B2BD0);
  }
  return result;
}

unint64_t sub_248AE3DA0()
{
  unint64_t result;

  result = qword_2577B2BE8;
  if (!qword_2577B2BE8)
  {
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDF08F0], MEMORY[0x24BDF0900]);
    atomic_store(result, (unint64_t *)&qword_2577B2BE8);
  }
  return result;
}

uint64_t sub_248AE3DE4(uint64_t a1)
{
  return sub_248AE3E30(0.992156863, 0.854901961, 1.0, a1, &qword_2577B5098);
}

uint64_t sub_248AE3E04(uint64_t a1)
{
  return sub_248AE3E30(0.231372549, 0.0274509804, 0.333333333, a1, &qword_2577B50A0);
}

uint64_t sub_248AE3E30(double a1, double a2, double a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v9 = sub_248AF5744();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v12 + 104))(v11, *MEMORY[0x24BDF3C28]);
  result = MEMORY[0x2495A4DC0](v11, a1, a2, a3, 1.0);
  *a5 = result;
  return result;
}

uint64_t sub_248AE3ED8@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, __int128 a11, uint64_t a12, uint64_t a13)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)a9 = a1;
  *(_BYTE *)(a9 + 8) = a2 & 1;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  sub_248AF57E0();
  *(_BYTE *)(a9 + 64) = v17;
  *(_QWORD *)(a9 + 72) = v18;
  sub_248AF57E0();
  *(_BYTE *)(a9 + 80) = v17;
  *(_QWORD *)(a9 + 88) = v18;
  sub_248AF57E0();
  *(_BYTE *)(a9 + 96) = v17;
  *(_QWORD *)(a9 + 104) = v18;
  sub_248AF57E0();
  *(_QWORD *)(a9 + 112) = v17;
  *(_QWORD *)(a9 + 120) = v18;
  sub_248AF57E0();
  *(_BYTE *)(a9 + 128) = v17;
  *(_QWORD *)(a9 + 136) = v18;
  *(_OWORD *)(a9 + 144) = a11;
  *(_QWORD *)(a9 + 160) = a12;
  v14 = a9 + *(int *)(type metadata accessor for DraggableLocationItem() + 56);
  v15 = sub_248AF5A2C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14, a13, v15);
}

uint64_t type metadata accessor for DraggableLocationItem()
{
  uint64_t result;

  result = qword_2577B2C48;
  if (!qword_2577B2C48)
    return swift_getSingletonMetadata();
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DraggableLocationItem.GestureState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DraggableLocationItem.GestureState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_248AE4178 + 4 * byte_248AF7B75[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_248AE41AC + 4 * byte_248AF7B70[v4]))();
}

uint64_t sub_248AE41AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_248AE41B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x248AE41BCLL);
  return result;
}

uint64_t sub_248AE41C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x248AE41D0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_248AE41D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248AE41DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248AE41E8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_248AE41F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DraggableLocationItem.GestureState()
{
  return &type metadata for DraggableLocationItem.GestureState;
}

_QWORD *sub_248AE4208(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = *((_BYTE *)a2 + 8);
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = v5;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    v7 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v7;
    v8 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v8;
    *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
    *(_QWORD *)(a1 + 72) = a2[9];
    *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
    *(_QWORD *)(a1 + 88) = a2[11];
    *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
    v9 = a2[14];
    *(_QWORD *)(a1 + 104) = a2[13];
    *(_QWORD *)(a1 + 112) = v9;
    *(_QWORD *)(a1 + 120) = a2[15];
    *(_BYTE *)(a1 + 128) = *((_BYTE *)a2 + 128);
    *(_QWORD *)(a1 + 136) = a2[17];
    *(_OWORD *)(a1 + 144) = *((_OWORD *)a2 + 9);
    v10 = *(int *)(a3 + 56);
    v15 = (uint64_t)a2 + v10;
    v16 = a1 + v10;
    *(_QWORD *)(a1 + 160) = a2[20];
    v11 = sub_248AF5A2C();
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v14(v16, v15, v11);
  }
  return v3;
}

uint64_t sub_248AE43AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 56);
  v5 = sub_248AF5A2C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_248AE4454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  v8 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v8;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  v9 = *(int *)(a3 + 56);
  v13 = a2 + v9;
  v14 = a1 + v9;
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  v10 = sub_248AF5A2C();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v12(v14, v13, v10);
  return a1;
}

uint64_t sub_248AE45CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v6;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 56);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_248AF5A2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_248AE47A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v6 = *(int *)(a3 + 56);
  v7 = a1 + v6;
  v8 = a2 + v6;
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  v9 = sub_248AF5A2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

uint64_t sub_248AE484C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v6;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_release();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_release();
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_release();
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 56);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_248AF5A2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_248AE49B0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AE49BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_248AF5A2C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 56), a2, v8);
  }
}

uint64_t sub_248AE4A38()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AE4A44(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = sub_248AF5A2C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 56), a2, a2, v7);
  }
  return result;
}

uint64_t sub_248AE4AB8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_248AF5A2C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_248AE4B64()
{
  unint64_t result;

  result = qword_2577B2CA8;
  if (!qword_2577B2CA8)
  {
    result = MEMORY[0x2495A57B0](&unk_248AF7C48, &type metadata for DraggableLocationItem.GestureState);
    atomic_store(result, (unint64_t *)&qword_2577B2CA8);
  }
  return result;
}

_QWORD *sub_248AE4BA8@<X0>(uint64_t a1@<X8>)
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
  _OWORD *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
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
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v47;
  uint64_t (*v48)(void);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *result;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t OpaqueTypeConformance2;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  char *v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  __int128 v174;
  uint64_t v175;
  _QWORD *v176;

  v2 = v1;
  v156 = a1;
  v152 = sub_248AF512C();
  v151 = *(_QWORD *)(v152 - 8);
  MEMORY[0x24BDAC7A8](v152);
  v150 = (char *)&v122 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1968);
  v154 = *(_QWORD *)(v155 - 8);
  MEMORY[0x24BDAC7A8](v155);
  v153 = (char *)&v122 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = sub_248AF53E4();
  MEMORY[0x24BDAC7A8](v130);
  v129 = (char *)&v122 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = sub_248AF4FC4();
  v132 = *(_QWORD *)(v133 - 8);
  MEMORY[0x24BDAC7A8](v133);
  v131 = (char *)&v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2CB0);
  v136 = *(_QWORD *)(v137 - 8);
  MEMORY[0x24BDAC7A8](v137);
  v135 = (char *)&v122 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2CB8);
  v139 = *(_QWORD *)(v140 - 8);
  MEMORY[0x24BDAC7A8](v140);
  v138 = (char *)&v122 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DraggableLocationItem();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64);
  v170 = *(_QWORD *)(v9 - 8);
  v171 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v168 = (uint64_t)&v122 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v169 = sub_248AF5150();
  MEMORY[0x24BDAC7A8](v169);
  v13 = (_OWORD *)((char *)&v122 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v160 = sub_248AF5474();
  v158 = *(_QWORD *)(v160 - 8);
  MEMORY[0x24BDAC7A8](v160);
  v15 = (char *)&v122 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LocationItemView();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v122 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2CC0);
  v161 = *(_QWORD *)(v162 - 8);
  MEMORY[0x24BDAC7A8](v162);
  v20 = (char *)&v122 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2CC8);
  MEMORY[0x24BDAC7A8](v157);
  v22 = (char *)&v122 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2CD0);
  MEMORY[0x24BDAC7A8](v159);
  v24 = (char *)&v122 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2CD8);
  MEMORY[0x24BDAC7A8](v164);
  v26 = (char *)&v122 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2CE0);
  MEMORY[0x24BDAC7A8](v165);
  v163 = (char *)&v122 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2CE8);
  MEMORY[0x24BDAC7A8](v166);
  v123 = (uint64_t)&v122 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2CF0);
  v126 = *(_QWORD *)(v127 - 8);
  MEMORY[0x24BDAC7A8](v127);
  v125 = (char *)&v122 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2CF8);
  MEMORY[0x24BDAC7A8](v124);
  v128 = (char *)&v122 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v167 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D00);
  MEMORY[0x24BDAC7A8](v167);
  v134 = (uint64_t)&v122 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D08);
  v142 = *(_QWORD *)(v144 - 8);
  MEMORY[0x24BDAC7A8](v144);
  v141 = (char *)&v122 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D10);
  v148 = *(_QWORD *)(v149 - 8);
  MEMORY[0x24BDAC7A8](v149);
  v147 = (char *)&v122 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D18);
  v145 = *(_QWORD *)(v146 - 8);
  MEMORY[0x24BDAC7A8](v146);
  v143 = (char *)&v122 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = v2 + *(int *)(v9 + 56);
  v36 = sub_248AF5A2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v18, v35, v36);
  v37 = *(_QWORD *)(v2 + 160);
  v38 = &v18[*(int *)(v16 + 20)];
  *(_QWORD *)v38 = *(_QWORD *)(v2 + 152);
  *((_QWORD *)v38 + 1) = v37;
  swift_bridgeObjectRetain();
  sub_248AF5468();
  sub_248AB80A8(&qword_2577B2D20, (uint64_t (*)(uint64_t))type metadata accessor for LocationItemView, (uint64_t)&unk_248AF69B0);
  sub_248AF56FC();
  (*(void (**)(char *, uint64_t))(v158 + 8))(v15, v160);
  sub_248AC75B8((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for LocationItemView);
  v39 = (char *)v13 + *(int *)(v169 + 20);
  v40 = *MEMORY[0x24BDEEB68];
  v41 = sub_248AF52DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 104))(v39, v40, v41);
  __asm { FMOV            V0.2D, #16.0 }
  *v13 = _Q0;
  v47 = (uint64_t)&v22[*(int *)(v157 + 36)];
  v48 = MEMORY[0x24BDED998];
  sub_248AC7574((uint64_t)v13, v47, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1690) + 36)) = 256;
  v49 = v161;
  v50 = v162;
  (*(void (**)(char *, char *, uint64_t))(v161 + 16))(v22, v20, v162);
  sub_248AC75B8((uint64_t)v13, (uint64_t (*)(_QWORD))v48);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v20, v50);
  v51 = sub_248AF58F4();
  v53 = v52;
  v54 = &v24[*(int *)(v159 + 36)];
  v55 = v168;
  sub_248AC7574(v2, v168, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  v56 = *(unsigned __int8 *)(v170 + 80);
  v57 = (v56 + 16) & ~v56;
  v170 = v56 | 7;
  v171 += v57;
  v58 = swift_allocObject();
  v169 = v57;
  sub_248AE7F8C(v55, v58 + v57);
  v172 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D28);
  sub_248AE7FE4();
  sub_248AF5828();
  v59 = (uint64_t *)&v54[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D78) + 36)];
  *v59 = v51;
  v59[1] = v53;
  v60 = (uint64_t)v22;
  v61 = (uint64_t)v163;
  sub_248AE8188(v60, (uint64_t)v24);
  v62 = *(_QWORD *)(v2 + 136);
  LOBYTE(v173) = *(_BYTE *)(v2 + 128);
  *(_QWORD *)&v174 = v62;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D80);
  sub_248AF57EC();
  if (v176 == 1)
    v63 = 1.03;
  else
    v63 = 1.0;
  sub_248AF5990();
  v65 = v64;
  v67 = v66;
  sub_248AB8870((uint64_t)v24, (uint64_t)v26, &qword_2577B2CD0);
  v68 = &v26[*(int *)(v164 + 36)];
  *(double *)v68 = v63;
  *((double *)v68 + 1) = v63;
  *((_QWORD *)v68 + 2) = v65;
  *((_QWORD *)v68 + 3) = v67;
  sub_248AB89E8((uint64_t)v24, &qword_2577B2CD0);
  v69 = sub_248AF5960();
  v70 = *(_QWORD *)(v2 + 136);
  LOBYTE(v173) = *(_BYTE *)(v2 + 128);
  *(_QWORD *)&v174 = v70;
  sub_248AF57EC();
  v71 = v176 == 1;
  sub_248AB8870((uint64_t)v26, v61, &qword_2577B2CD8);
  v72 = v61 + *(int *)(v165 + 36);
  *(_QWORD *)v72 = v69;
  *(_BYTE *)(v72 + 8) = v71;
  sub_248AB89E8((uint64_t)v26, &qword_2577B2CD8);
  v73 = *(_QWORD *)(v2 + 144);
  v173 = *(_QWORD *)(v2 + 40);
  v74 = v2;
  v174 = *(_OWORD *)(v2 + 48);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D88);
  result = MEMORY[0x2495A4E68](&v176, v75);
  if ((v73 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  result = v176;
  if (v73 >= v176[2])
  {
LABEL_13:
    __break(1u);
    return result;
  }
  v77 = v176[v73 + 4];
  swift_bridgeObjectRelease();
  v78 = v123;
  sub_248AB8870(v61, v123, &qword_2577B2CE0);
  v79 = (_QWORD *)(v78 + *(int *)(v166 + 36));
  *v79 = 0;
  v79[1] = v77;
  sub_248AB89E8(v61, &qword_2577B2CE0);
  sub_248AF5414();
  v80 = v131;
  sub_248AF4FA0();
  v81 = v168;
  sub_248AC7574(v2, v168, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  v82 = swift_allocObject();
  v83 = v169;
  sub_248AE7F8C(v81, v82 + v169);
  sub_248AB80A8(&qword_2577B20B8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB540], MEMORY[0x24BDEB530]);
  sub_248AB80A8(&qword_2577B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB500], MEMORY[0x24BDEB520]);
  v84 = v135;
  v85 = v133;
  sub_248AF587C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v132 + 8))(v80, v85);
  sub_248AC7574(v74, v81, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  v86 = swift_allocObject() + v83;
  sub_248AE7F8C(v81, v86);
  sub_248AB8BE8(&qword_2577B2D98, &qword_2577B2CB0, MEMORY[0x24BDED570]);
  v87 = v138;
  v88 = v137;
  sub_248AF5870();
  swift_release();
  (*(void (**)(char *, uint64_t))(v136 + 8))(v84, v88);
  sub_248AF4FE8();
  sub_248ABD838(&qword_2577B2DA0, &qword_2577B2CE8, (uint64_t (*)(void))sub_248AE823C, MEMORY[0x24BDEC438]);
  v89 = MEMORY[0x24BDEC410];
  sub_248AB8BE8(&qword_2577B2DD0, &qword_2577B2CB8, MEMORY[0x24BDEC410]);
  v90 = v125;
  v91 = v140;
  sub_248AF56F0();
  (*(void (**)(char *, uint64_t))(v139 + 8))(v87, v91);
  sub_248AB89E8(v78, &qword_2577B2CE8);
  v92 = *(_QWORD *)(v74 + 72);
  LOBYTE(v173) = *(_BYTE *)(v74 + 64);
  *(_QWORD *)&v174 = v92;
  v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57EC();
  v93 = 1.0;
  if ((_BYTE)v176)
    v94 = 1.0;
  else
    v94 = 0.0;
  v95 = v126;
  v96 = (uint64_t)v128;
  v97 = v127;
  (*(void (**)(char *, char *, uint64_t))(v126 + 16))(v128, v90, v127);
  *(double *)(v96 + *(int *)(v124 + 36)) = v94;
  (*(void (**)(char *, uint64_t))(v95 + 8))(v90, v97);
  v98 = *(_QWORD *)(v74 + 72);
  LOBYTE(v173) = *(_BYTE *)(v74 + 64);
  *(_QWORD *)&v174 = v98;
  sub_248AF57EC();
  if ((_BYTE)v176)
    v93 = 0.85;
  v99 = v134;
  sub_248AB8870(v96, v134, &qword_2577B2CF8);
  *(double *)(v99 + *(int *)(v167 + 36)) = v93;
  sub_248AB89E8(v96, &qword_2577B2CF8);
  v100 = v150;
  sub_248AF5120();
  sub_248AC7574(v74, v81, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  v101 = swift_allocObject();
  sub_248AE7F8C(v81, v101 + v169);
  sub_248AB80A8(&qword_2577B19C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDED7B8], MEMORY[0x24BDED7B0]);
  v102 = v153;
  v103 = v152;
  sub_248AF5870();
  swift_release();
  (*(void (**)(char *, uint64_t))(v151 + 8))(v100, v103);
  sub_248AF4FE8();
  v104 = sub_248ABD838(&qword_2577B2DD8, &qword_2577B2D00, (uint64_t (*)(void))sub_248AE8464, MEMORY[0x24BDECC38]);
  v105 = sub_248AB8BE8(&qword_2577B19C8, &qword_2577B1968, v89);
  v106 = v141;
  v107 = v167;
  v108 = v155;
  sub_248AF56F0();
  (*(void (**)(char *, uint64_t))(v154 + 8))(v102, v108);
  sub_248AB89E8(v99, &qword_2577B2D00);
  v109 = *(_QWORD *)(v74 + 104);
  LOBYTE(v173) = *(_BYTE *)(v74 + 96);
  *(_QWORD *)&v174 = v109;
  sub_248AF57EC();
  v110 = v168;
  sub_248AC7574(v74, v168, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  v111 = swift_allocObject();
  sub_248AE7F8C(v110, v111 + v169);
  v173 = v107;
  *(_QWORD *)&v174 = v108;
  *((_QWORD *)&v174 + 1) = v104;
  v175 = v105;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v113 = MEMORY[0x24BEE1328];
  v114 = v147;
  v115 = v144;
  sub_248AF5738();
  swift_release();
  (*(void (**)(char *, uint64_t))(v142 + 8))(v106, v115);
  LOBYTE(v100) = *(_BYTE *)(v74 + 8);
  v116 = swift_retain();
  v117 = sub_248ADB034(v116, (char)v100);
  swift_release();
  swift_getKeyPath();
  v173 = v117;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  v118 = *(_BYTE *)(v117 + 51);
  swift_release();
  LOBYTE(v176) = v118;
  sub_248AC7574(v74, v110, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  v119 = swift_allocObject();
  sub_248AE7F8C(v110, v119 + v169);
  v173 = v115;
  *(_QWORD *)&v174 = v113;
  *((_QWORD *)&v174 + 1) = OpaqueTypeConformance2;
  v175 = MEMORY[0x24BEE1340];
  swift_getOpaqueTypeConformance2();
  v120 = v143;
  v121 = v149;
  sub_248AF5738();
  swift_release();
  (*(void (**)(char *, uint64_t))(v148 + 8))(v114, v121);
  return (_QWORD *)(*(uint64_t (**)(uint64_t, char *, uint64_t))(v145 + 32))(v156, v120, v146);
}

uint64_t sub_248AE5D14(uint64_t a1)
{
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
  char v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  BOOL v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  uint64_t v57;

  v2 = type metadata accessor for DraggableLocationItem();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v54 = (uint64_t)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v53 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_248AF5A2C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_BYTE *)(a1 + 128);
  v15 = *(_QWORD *)(a1 + 136);
  LOBYTE(v56) = v14;
  v57 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D80);
  sub_248AF57EC();
  if (LOBYTE(v55))
  {
    v53 = v11;
    LOBYTE(v56) = v14;
    v57 = v15;
    sub_248AF57EC();
    v16 = LOBYTE(v55);
    sub_248AC7574(a1, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
    if (v16 == 1)
    {
      sub_248AC75B8((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
      v17 = v10;
      v18 = v53;
      v19 = (uint64_t)v13;
      v20 = (uint64_t)v9;
LABEL_4:
      v21 = *(_BYTE *)(a1 + 8);
      v22 = swift_retain();
      sub_248ADB034(v22, v21);
      swift_release();
      sub_248AF5A20();
      sub_248AF5A20();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v20, 0, 1, v17);
      sub_248AD6194(v19, 1, v20);
      swift_release();
      sub_248AB89E8(v20, &qword_2577B14B8);
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v17);
      goto LABEL_13;
    }
    v25 = *((_QWORD *)v6 + 17);
    LOBYTE(v56) = v6[128];
    v57 = v25;
    sub_248AF57EC();
    v26 = LOBYTE(v55);
    v27 = v54;
    sub_248AC7574((uint64_t)v6, v54, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
    v17 = v10;
    v19 = (uint64_t)v13;
    if (v26 == 2)
    {
      v28 = *(_QWORD *)(v27 + 88);
      LOBYTE(v56) = *(_BYTE *)(v27 + 80);
      v57 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
      sub_248AF57EC();
      v29 = v27;
      v30 = LOBYTE(v55);
      sub_248AC75B8(v29, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
      sub_248AC75B8((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
      v18 = v53;
      v20 = (uint64_t)v9;
      if ((v30 & 1) == 0)
        goto LABEL_4;
    }
    else
    {
      sub_248AC75B8(v27, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
      sub_248AC75B8((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
      v18 = v53;
      v20 = (uint64_t)v9;
    }
    v31 = *(_QWORD *)(a1 + 120);
    v56 = *(_QWORD *)(a1 + 112);
    v57 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1868);
    sub_248AF57EC();
    v32 = sub_248AE63B0(*(_QWORD *)(a1 + 144), v55);
    v33 = (_QWORD *)sub_248AF5B40();
    v33[2] = 3;
    v33[5] = 0;
    v33[6] = 0;
    v33[4] = 0;
    v34 = sub_248AD58E4(v32, (uint64_t)v33);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v34)
    {
      v35 = *(_QWORD *)(a1 + 88);
      LOBYTE(v56) = *(_BYTE *)(a1 + 80);
      v57 = v35;
      LOBYTE(v55) = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
      sub_248AF57F8();
      v36 = *(_BYTE *)(a1 + 8);
      v37 = swift_retain();
      v38 = sub_248ADB034(v37, v36);
      swift_release();
      v39 = v38 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys;
      *(_QWORD *)(v39 + 48) = 0;
      *(_QWORD *)(v39 + 56) = 0;
      swift_bridgeObjectRelease();
      sub_248AD76B0();
      v54 = v17;
      *(_QWORD *)(v39 + 48) = 0;
      *(_QWORD *)(v39 + 56) = 0;
      swift_release();
      swift_bridgeObjectRelease();
      v40 = swift_retain();
      sub_248ADB034(v40, v36);
      swift_release();
      sub_248AF5A20();
      v41 = v54;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v20, 1, 1, v54);
      sub_248AD6194(v19, 0, v20);
      swift_release();
      sub_248AB89E8(v20, &qword_2577B14B8);
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v41);
    }
    else
    {
      v42 = *(_BYTE *)(a1 + 8);
      v43 = swift_retain();
      sub_248ADB034(v43, v42);
      swift_release();
      sub_248AD5958(1, 1, 0);
      swift_release();
    }
    goto LABEL_13;
  }
  v23 = *(_BYTE *)(a1 + 8);
  v24 = swift_retain();
  sub_248ADB034(v24, v23);
  swift_release();
  sub_248AF5A20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  sub_248AD6194((uint64_t)v13, 1, (uint64_t)v9);
  swift_release();
  sub_248AB89E8((uint64_t)v9, &qword_2577B14B8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
LABEL_13:
  v44 = *(_BYTE *)(a1 + 8);
  v45 = swift_retain();
  v46 = sub_248ADB034(v45, v44);
  result = swift_release();
  v48 = *(_QWORD *)(v46 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64);
  v49 = __OFADD__(v48, 1);
  v50 = v48 + 1;
  if (v49)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v46 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 64) = v50;
    swift_release();
    v51 = *(_QWORD *)(a1 + 136);
    LOBYTE(v56) = *(_BYTE *)(a1 + 128);
    v57 = v51;
    LOBYTE(v55) = 0;
    sub_248AF57F8();
    sub_248AF5948();
    sub_248AF5924();
    v52 = swift_release();
    MEMORY[0x24BDAC7A8](v52);
    *(&v53 - 2) = a1;
    sub_248AF50B4();
    return swift_release();
  }
  return result;
}

uint64_t sub_248AE63B0(unint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  char v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  double *v40;
  unint64_t v41;
  unint64_t v42;
  double *v44;
  uint64_t result;
  double *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;

  v3 = v2;
  v6 = type metadata accessor for DraggableLocationItem();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v47 = (uint64_t)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v46 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v46 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v46 - v15;
  v48 = *(_QWORD *)(v2 + 16);
  v49 = *(_OWORD *)(v2 + 24);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D88);
  MEMORY[0x2495A4E68](&v50);
  v18 = *(_QWORD *)(v50 + 16);
  swift_bridgeObjectRelease();
  sub_248AC7574(v3, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  if (v18 <= (uint64_t)a1)
    goto LABEL_61;
  v48 = *((_QWORD *)v16 + 2);
  v49 = *(_OWORD *)(v16 + 24);
  MEMORY[0x2495A4E68](&v50, v17);
  v19 = *(_QWORD *)(v50 + 16);
  swift_bridgeObjectRelease();
  sub_248AC75B8((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  if (v19 == 3)
  {
    v16 = (char *)sub_248AF5B40();
    *((_QWORD *)v16 + 2) = 3;
    *((_QWORD *)v16 + 4) = 0;
    v46 = (double *)(v16 + 32);
    *((_QWORD *)v16 + 5) = 0;
    *((_QWORD *)v16 + 6) = 0;
    v21 = *(_QWORD *)(v3 + 16);
    v20 = *(_QWORD *)(v3 + 24);
    v22 = *(_QWORD *)(v3 + 32);
    v48 = v21;
    *(_QWORD *)&v49 = v20;
    *((_QWORD *)&v49 + 1) = v22;
    MEMORY[0x2495A4E68](&v50, v17);
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)(v50 + 16) > a1)
    {
      v23 = *(double *)(v50 + 8 * a1 + 32);
      swift_bridgeObjectRelease();
      v48 = v21;
      *(_QWORD *)&v49 = v20;
      *((_QWORD *)&v49 + 1) = v22;
      MEMORY[0x2495A4E68](&v50, v17);
      if (*(_QWORD *)(v50 + 16) > a1)
      {
        v24 = *(double *)(v50 + 8 * a1 + 32);
        swift_bridgeObjectRelease();
        v48 = v21;
        *(_QWORD *)&v49 = v20;
        *((_QWORD *)&v49 + 1) = v22;
        MEMORY[0x2495A4E68](&v50, v17);
        if (*(_QWORD *)(v50 + 16) >= 2uLL)
        {
          v25 = *(double *)(v50 + 40);
          swift_bridgeObjectRelease();
          v48 = v21;
          *(_QWORD *)&v49 = v20;
          *((_QWORD *)&v49 + 1) = v22;
          MEMORY[0x2495A4E68](&v50, v17);
          if (*(_QWORD *)(v50 + 16))
          {
            v26 = *(double *)(v50 + 32);
            swift_bridgeObjectRelease();
            sub_248AC7574(v3, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
            if (a1)
            {
              sub_248AC75B8((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
              sub_248AC7574(v3, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
              v27 = v47;
              sub_248AC7574((uint64_t)v11, v47, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
              if (a1 == 2)
              {
                v48 = *(_QWORD *)(v27 + 16);
                v49 = *(_OWORD *)(v27 + 24);
                MEMORY[0x2495A4E68](&v50, v17);
                if (*(_QWORD *)(v50 + 16) >= 3uLL)
                {
                  v28 = *(double *)(v50 + 48);
                  swift_bridgeObjectRelease();
                  sub_248AC75B8(v27, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
                  sub_248AC75B8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
                  if (v28 < a2)
                    return (uint64_t)v16;
                  v29 = 0;
                  goto LABEL_18;
                }
LABEL_51:
                __break(1u);
                goto LABEL_52;
              }
LABEL_17:
              sub_248AC75B8(v27, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
              sub_248AC75B8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
              v29 = 1;
LABEL_18:
              v31 = a2 + 55.0 - v23;
              v32 = a2 + -55.0 - v24;
              v33 = v25 - v26;
              v34 = fabs(v32);
              v35 = fabs(v31);
              if (v33 > v34 && v33 > v35)
                return (uint64_t)v16;
              v36 = *(_QWORD *)(v3 + 88);
              LOBYTE(v48) = *(_BYTE *)(v3 + 80);
              *(_QWORD *)&v49 = v36;
              LOBYTE(v50) = 1;
              __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
              sub_248AF57F8();
              v37 = *(_QWORD *)(v3 + 104);
              LOBYTE(v48) = *(_BYTE *)(v3 + 96);
              *(_QWORD *)&v49 = v37;
              LOBYTE(v50) = 1;
              sub_248AF57F8();
              if (v32 >= 0.0)
              {
LABEL_28:
                if (v31 > 0.0)
                {
                  v42 = *((_QWORD *)v16 + 2);
                  if (v35 / v33 >= 2.0 && a1 == 0)
                  {
                    if (v42)
                    {
                      *v46 = v33 + v33;
                      if (v42 != 1)
                      {
                        *((double *)v16 + 5) = -v33;
                        if (v42 >= 3)
                        {
                          *((double *)v16 + 6) = -v33;
                          return (uint64_t)v16;
                        }
                        goto LABEL_60;
                      }
LABEL_59:
                      __break(1u);
LABEL_60:
                      __break(1u);
LABEL_61:
                      sub_248AC75B8((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
                      goto LABEL_62;
                    }
                    goto LABEL_57;
                  }
                  v44 = v46;
                  if (v42 > a1)
                  {
                    v46[a1] = v33;
                    if (a1 + 1 < v42)
                    {
                      v44[a1 + 1] = -v33;
                      return (uint64_t)v16;
                    }
                    goto LABEL_58;
                  }
LABEL_56:
                  __break(1u);
LABEL_57:
                  __break(1u);
LABEL_58:
                  __break(1u);
                  goto LABEL_59;
                }
                return (uint64_t)v16;
              }
              if (v34 / v33 < 2.0)
                v38 = 1;
              else
                v38 = v29;
              v39 = *((_QWORD *)v16 + 2);
              if ((v38 & 1) == 0)
              {
                v40 = v46;
                if (v39 > a1)
                {
                  v46[a1] = v33 * -2.0;
                  if (a1 - 1 < v39)
                  {
                    v40[a1 - 1] = v33;
                    v41 = a1 - 2;
                    if (a1 - 2 < v39)
                      goto LABEL_39;
LABEL_55:
                    __break(1u);
                    goto LABEL_56;
                  }
LABEL_54:
                  __break(1u);
                  goto LABEL_55;
                }
LABEL_53:
                __break(1u);
                goto LABEL_54;
              }
              v40 = v46;
              if (v39 > a1)
              {
                v46[a1] = -v33;
                v41 = a1 - 1;
                if (a1 - 1 >= v39)
                {
                  __break(1u);
                  goto LABEL_28;
                }
LABEL_39:
                v40[v41] = v33;
                return (uint64_t)v16;
              }
LABEL_52:
              __break(1u);
              goto LABEL_53;
            }
            v48 = *((_QWORD *)v14 + 2);
            v49 = *(_OWORD *)(v14 + 24);
            MEMORY[0x2495A4E68](&v50, v17);
            if (*(_QWORD *)(v50 + 16))
            {
              v30 = *(double *)(v50 + 32);
              swift_bridgeObjectRelease();
              sub_248AC75B8((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
              sub_248AC7574(v3, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
              if (v30 > a2)
              {
                sub_248AC75B8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
                return (uint64_t)v16;
              }
              v27 = v47;
              sub_248AC7574((uint64_t)v11, v47, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
              goto LABEL_17;
            }
LABEL_50:
            __break(1u);
            goto LABEL_51;
          }
LABEL_49:
          __break(1u);
          goto LABEL_50;
        }
LABEL_48:
        __break(1u);
        goto LABEL_49;
      }
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }
    __break(1u);
    goto LABEL_47;
  }
LABEL_62:
  result = sub_248AF5CFC();
  __break(1u);
  return result;
}

uint64_t sub_248AE69C0(uint64_t a1)
{
  double v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1868);
  sub_248AF57EC();
  sub_248AE63B0(*(_QWORD *)(a1 + 144), v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D88);
  return sub_248AF5840();
}

uint64_t sub_248AE6A5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _OWORD *v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t (*v25)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t (**v26)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v35;
  uint64_t (*v36)(void);
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t (*v40)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t v41;
  uint64_t (**v42)@<X0>(uint64_t@<X0>, uint64_t *@<X8>);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v51 = a2;
  v50 = sub_248AF5150();
  MEMORY[0x24BDAC7A8](v50);
  v4 = (_OWORD *)((char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for DraggableLocationItem();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LocationItemView();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D50);
  MEMORY[0x24BDAC7A8](v45);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D40);
  MEMORY[0x24BDAC7A8](v48);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a1 + *(int *)(v5 + 56);
  v17 = sub_248AF5A2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v11, v16, v17);
  v49 = a1;
  v18 = *(_QWORD *)(a1 + 160);
  v19 = &v11[*(int *)(v9 + 20)];
  *(_QWORD *)v19 = *(_QWORD *)(a1 + 152);
  *((_QWORD *)v19 + 1) = v18;
  sub_248AC7574(a1, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  v20 = *(unsigned __int8 *)(v6 + 80);
  v21 = (v20 + 16) & ~v20;
  v46 = v20 | 7;
  v47 = v21 + v7;
  v22 = swift_allocObject();
  sub_248AE7F8C((uint64_t)v8, v22 + v21);
  swift_bridgeObjectRetain();
  v23 = sub_248AF58F4();
  v25 = v24;
  sub_248AC7574((uint64_t)v11, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for LocationItemView);
  v26 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))&v13[*(int *)(v45 + 36)];
  *v26 = sub_248AE87E0;
  v26[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v22;
  v26[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v23;
  v26[3] = v25;
  sub_248AC75B8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for LocationItemView);
  v27 = (char *)v4 + *(int *)(v50 + 20);
  v28 = *MEMORY[0x24BDEEB68];
  v29 = sub_248AF52DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v27, v28, v29);
  __asm { FMOV            V0.2D, #16.0 }
  *v4 = _Q0;
  v35 = (uint64_t)&v15[*(int *)(v48 + 36)];
  v36 = MEMORY[0x24BDED998];
  sub_248AC7574((uint64_t)v4, v35, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B1690) + 36)) = 256;
  sub_248AB8870((uint64_t)v13, (uint64_t)v15, &qword_2577B2D50);
  sub_248AC75B8((uint64_t)v4, (uint64_t (*)(_QWORD))v36);
  sub_248AB89E8((uint64_t)v13, &qword_2577B2D50);
  sub_248AC7574(v49, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  v37 = swift_allocObject();
  sub_248AE7F8C((uint64_t)v8, v37 + v21);
  v38 = sub_248AF58F4();
  v40 = v39;
  v41 = v51;
  sub_248AB8870((uint64_t)v15, v51, &qword_2577B2D40);
  v42 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))(v41
                                                                   + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D28)
                                                                            + 36));
  *v42 = sub_248AE891C;
  v42[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v37;
  v42[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v38;
  v42[3] = v40;
  return sub_248AB89E8((uint64_t)v15, &qword_2577B2D40);
}

uint64_t sub_248AE6DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  _QWORD aBlock[6];

  v22 = a2;
  v23 = a1;
  v29 = a3;
  v25 = sub_248AF599C();
  v28 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF59C0();
  v26 = *(_QWORD *)(v5 - 8);
  v27 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_248AF5078();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = type metadata accessor for DraggableLocationItem();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248ADA0E4();
  v24 = sub_248AF5C0C();
  sub_248AC7574(v22, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v8);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = (v13 + *(unsigned __int8 *)(v9 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = swift_allocObject();
  sub_248AE7F8C((uint64_t)v14, v17 + v15);
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v17 + v16, (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_248AE8AA8;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_248ADFE80;
  aBlock[3] = &block_descriptor_33;
  v18 = _Block_copy(aBlock);
  swift_release();
  sub_248AF59A8();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_248AB80A8((unint64_t *)&unk_2577B14A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11E0);
  sub_248AB8BE8(&qword_2577B14B0, &qword_2577B11E0, MEMORY[0x24BEE12C8]);
  v19 = v25;
  sub_248AF5C84();
  v20 = (void *)v24;
  MEMORY[0x2495A524C](0, v7, v4, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v19);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v27);
  result = sub_248AF575C();
  *v29 = result;
  return result;
}

uint64_t sub_248AE70B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat MidY;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];
  CGRect v19;

  v2 = sub_248AF53F0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AF5420();
  sub_248AF506C();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  MidY = CGRectGetMidY(v19);
  v15 = *(_QWORD *)(a1 + 112);
  v16 = *(_QWORD *)(a1 + 120);
  *(CGFloat *)&v18[1] = MidY;
  v18[2] = v15;
  v18[3] = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1868);
  return sub_248AF57F8();
}

uint64_t sub_248AE71B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;

  v18 = a1;
  v5 = sub_248AF5078();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = type metadata accessor for DraggableLocationItem();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_248AF575C();
  sub_248AC7574(a2, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v18, v5);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = (v10 + *(unsigned __int8 *)(v6 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v15 = swift_allocObject();
  sub_248AE7F8C((uint64_t)v11, v15 + v13);
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(v15 + v14, (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  *a3 = v12;
  a3[1] = (uint64_t)sub_248AE896C;
  a3[3] = 0;
  a3[4] = 0;
  a3[2] = v15;
  return result;
}

uint64_t sub_248AE7304(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat MidY;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t result;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  CGRect v26;

  v2 = sub_248AF53F0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1[18];
  sub_248AF5420();
  sub_248AF506C();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  MidY = CGRectGetMidY(v26);
  v16 = a1[2];
  v17 = a1[3];
  v18 = a1[4];
  v22 = v16;
  v23 = v17;
  v24 = v18;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D88);
  MEMORY[0x2495A4E68](&v25);
  v19 = v25;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0)
  {
    if ((v6 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  result = (uint64_t)sub_248AE87C8(v19);
  v19 = (_QWORD *)result;
  if ((v6 & 0x8000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if (v6 < v19[2])
  {
    *(CGFloat *)&v19[v6 + 4] = MidY;
    v22 = v16;
    v23 = v17;
    v24 = v18;
    v21[1] = v19;
    sub_248AF5840();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_248AE7494(uint64_t a1, uint64_t a2)
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
  char *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t aBlock;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  uint64_t (*v41)();
  uint64_t v42;
  double v43;

  v31 = a1;
  v3 = sub_248AF599C();
  v36 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v35 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF59C0();
  v33 = *(_QWORD *)(v5 - 8);
  v34 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v32 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_248AF4FB8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = type metadata accessor for DraggableLocationItem();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a2 + 136);
  LOBYTE(aBlock) = *(_BYTE *)(a2 + 128);
  v38 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D80);
  result = sub_248AF57EC();
  if (LOBYTE(v43) == 1)
  {
    v16 = *(_QWORD *)(a2 + 72);
    LOBYTE(aBlock) = *(_BYTE *)(a2 + 64);
    v38 = v16;
    LOBYTE(v43) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
    v30 = v3;
    sub_248AF57F8();
    v17 = *(_QWORD *)(a2 + 104);
    LOBYTE(aBlock) = *(_BYTE *)(a2 + 96);
    v38 = v17;
    LOBYTE(v43) = 0;
    sub_248AF57F8();
    v18 = *(_QWORD *)(a2 + 120);
    aBlock = *(_QWORD *)(a2 + 112);
    v38 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1868);
    sub_248AF57EC();
    v19 = sub_248AE63B0(*(_QWORD *)(a2 + 144), v43);
    sub_248ADA0E4();
    v29 = sub_248AF5C0C();
    sub_248AC7574(a2, (uint64_t)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for DraggableLocationItem);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v31, v7);
    v20 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v21 = (v12 + *(unsigned __int8 *)(v8 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v22 = swift_allocObject();
    sub_248AE7F8C((uint64_t)v13, v22 + v20);
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v22 + v21, (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
    *(_QWORD *)(v22 + ((v9 + v21 + 7) & 0xFFFFFFFFFFFFFFF8)) = v19;
    v41 = sub_248AE8720;
    v42 = v22;
    aBlock = MEMORY[0x24BDAC760];
    v38 = 1107296256;
    v39 = sub_248ADFE80;
    v40 = &block_descriptor_3;
    v23 = _Block_copy(&aBlock);
    swift_release();
    v24 = v32;
    sub_248AF59A8();
    aBlock = MEMORY[0x24BEE4AF8];
    sub_248AB80A8((unint64_t *)&unk_2577B14A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11E0);
    sub_248AB8BE8(&qword_2577B14B0, &qword_2577B11E0, MEMORY[0x24BEE12C8]);
    v25 = v35;
    v26 = v30;
    sub_248AF5C84();
    v27 = (void *)v29;
    MEMORY[0x2495A524C](0, v24, v25, v23);
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v26);
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v24, v34);
  }
  return result;
}

uint64_t sub_248AE784C()
{
  sub_248AF5948();
  sub_248AF5924();
  swift_release();
  sub_248AF50B4();
  return swift_release();
}

uint64_t sub_248AE78D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(a1 + 144);
  sub_248AF4FAC();
  v6 = v5;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D88);
  MEMORY[0x2495A4E68](&v12);
  v8 = v12;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0)
  {
    if ((v4 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
LABEL_14:
  result = (uint64_t)sub_248AE87C8(v8);
  v8 = (_QWORD *)result;
  if ((v4 & 0x8000000000000000) != 0)
    goto LABEL_15;
LABEL_3:
  if (v4 >= v8[2])
  {
LABEL_16:
    __break(1u);
    return result;
  }
  v8[v4 + 4] = v6;
  sub_248AF5840();
  swift_bridgeObjectRelease();
  swift_release();
  result = swift_release();
  v10 = *(_QWORD *)(a3 + 16);
  if (v10)
  {
    v11 = 0;
    a3 += 32;
    do
    {
      if (v4 != v11)
      {
        v6 = *(_QWORD *)(a3 + 8 * v11);
        swift_retain();
        swift_retain();
        swift_bridgeObjectRetain();
        MEMORY[0x2495A4E68](&v12, v7);
        v8 = v12;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = sub_248AE87C8(v8);
        if (v11 >= v8[2])
        {
          __break(1u);
          goto LABEL_14;
        }
        v8[v11 + 4] = v6;
        sub_248AF5840();
        swift_bridgeObjectRelease();
        swift_release();
        result = swift_release();
      }
      ++v11;
    }
    while (v10 != v11);
  }
  return result;
}

uint64_t sub_248AE7AC4()
{
  uint64_t result;
  char v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D80);
  result = sub_248AF57EC();
  if (v1 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
    sub_248AF57F8();
    sub_248AF57F8();
    return sub_248AF57F8();
  }
  return result;
}

uint64_t sub_248AE7BAC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D80);
  return sub_248AF57F8();
}

uint64_t sub_248AE7C00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248AF5A2C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 72);
  v15 = *(_BYTE *)(a1 + 64);
  v16 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  result = sub_248AF57EC();
  if (v17 == 1)
  {
    v11 = *(_QWORD *)(a1 + 104);
    v15 = *(_BYTE *)(a1 + 96);
    v16 = v11;
    sub_248AF57EC();
    v12 = *(_BYTE *)(a1 + 8);
    v13 = swift_retain();
    sub_248ADB034(v13, v12);
    swift_release();
    sub_248AF5A20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    sub_248AD6194((uint64_t)v8, 0, (uint64_t)v4);
    swift_release();
    sub_248AB89E8((uint64_t)v4, &qword_2577B14B8);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

uint64_t sub_248AE7DB0(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  _QWORD *v6;

  v1 = *(_BYTE *)(a1 + 8);
  v2 = swift_retain();
  v3 = sub_248ADB034(v2, v1);
  swift_release();
  swift_getKeyPath();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  v4 = *(unsigned __int8 *)(v3 + 51);
  result = swift_release();
  if (v4 == 1)
  {
    v6 = (_QWORD *)sub_248AF5B40();
    v6[2] = 3;
    v6[5] = 0;
    v6[6] = 0;
    v6[4] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2D88);
    return sub_248AF5840();
  }
  return result;
}

BOOL sub_248AE7EB8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_248AE7ECC()
{
  sub_248AF5D98();
  sub_248AF5DA4();
  return sub_248AF5DB0();
}

uint64_t sub_248AE7F10()
{
  return sub_248AF5DA4();
}

uint64_t sub_248AE7F38()
{
  sub_248AF5D98();
  sub_248AF5DA4();
  return sub_248AF5DB0();
}

uint64_t sub_248AE7F78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248AE7F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DraggableLocationItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248AE7FD0()
{
  return sub_248AE859C(sub_248AE5D14);
}

uint64_t sub_248AE7FDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_248AE6A5C(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_248AE7FE4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2D30;
  if (!qword_2577B2D30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2D28);
    v2[0] = sub_248AE8068();
    v2[1] = sub_248AB8BE8(&qword_2577B2D68, &qword_2577B2D70, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2D30);
  }
  return result;
}

unint64_t sub_248AE8068()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2D38;
  if (!qword_2577B2D38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2D40);
    v2[0] = sub_248AE80EC();
    v2[1] = sub_248AB8BE8(qword_2577B16D8, &qword_2577B1690, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2D38);
  }
  return result;
}

unint64_t sub_248AE80EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2D48;
  if (!qword_2577B2D48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2D50);
    v2[0] = sub_248AB80A8(&qword_2577B2D20, (uint64_t (*)(uint64_t))type metadata accessor for LocationItemView, (uint64_t)&unk_248AF69B0);
    v2[1] = sub_248AB8BE8(&qword_2577B2D58, &qword_2577B2D60, MEMORY[0x24BDEF370]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2D48);
  }
  return result;
}

uint64_t sub_248AE8188(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2CC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248AE81D4(uint64_t a1)
{
  return sub_248AE81F0(a1, sub_248AE7494);
}

uint64_t sub_248AE81E4(uint64_t a1)
{
  return sub_248AE81F0(a1, (uint64_t (*)(uint64_t, uint64_t))sub_248AE7AC4);
}

uint64_t sub_248AE81F0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DraggableLocationItem() - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

unint64_t sub_248AE823C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2DA8;
  if (!qword_2577B2DA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2CE0);
    v2[0] = sub_248ABD838(&qword_2577B2DB0, &qword_2577B2CD8, (uint64_t (*)(void))sub_248AE82E0, MEMORY[0x24BDEBF50]);
    v2[1] = sub_248AB8BE8(&qword_2577B18F8, &qword_2577B1900, MEMORY[0x24BDEEC10]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2DA8);
  }
  return result;
}

unint64_t sub_248AE82E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2DB8;
  if (!qword_2577B2DB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2CD0);
    v2[0] = sub_248AE8364();
    v2[1] = sub_248AB8BE8(&qword_2577B2DC8, &qword_2577B2D78, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2DB8);
  }
  return result;
}

unint64_t sub_248AE8364()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2577B2DC0;
  if (!qword_2577B2DC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2CC8);
    v2[2] = type metadata accessor for LocationItemView();
    v2[3] = sub_248AB80A8(&qword_2577B2D20, (uint64_t (*)(uint64_t))type metadata accessor for LocationItemView, (uint64_t)&unk_248AF69B0);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_248AB8BE8(qword_2577B16D8, &qword_2577B1690, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2DC0);
  }
  return result;
}

uint64_t sub_248AE8428()
{
  type metadata accessor for DraggableLocationItem();
  return sub_248AE7BAC();
}

unint64_t sub_248AE8464()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_2577B2DE0;
  if (!qword_2577B2DE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2CF8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2CE8);
    v2[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2CB8);
    v2[4] = sub_248ABD838(&qword_2577B2DA0, &qword_2577B2CE8, (uint64_t (*)(void))sub_248AE823C, MEMORY[0x24BDEC438]);
    v2[5] = sub_248AB8BE8(&qword_2577B2DD0, &qword_2577B2CB8, MEMORY[0x24BDEC410]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_248AB8BE8(&qword_2577B18D0, &qword_2577B18D8, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2DE0);
  }
  return result;
}

uint64_t sub_248AE8578()
{
  return sub_248AE859C(sub_248AE7C00);
}

uint64_t sub_248AE8590()
{
  return sub_248AE859C(sub_248AE7DB0);
}

uint64_t sub_248AE859C(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DraggableLocationItem() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_248AE85D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v1 = type metadata accessor for DraggableLocationItem();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_248AF4FB8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v8 = v0 + v3 + *(int *)(v1 + 56);
  v9 = sub_248AF5A2C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_248AE8720()
{
  type metadata accessor for DraggableLocationItem();
  sub_248AF4FB8();
  return sub_248AE784C();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_248AE87AC()
{
  uint64_t *v0;

  return sub_248AE78D8(v0[2], v0[3], v0[4]);
}

_QWORD *sub_248AE87C8(_QWORD *a1)
{
  return sub_248AF1BF8(0, a1[2], 0, a1);
}

uint64_t sub_248AE87E0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DraggableLocationItem() - 8) + 80);
  return sub_248AE6DD4(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t objectdestroyTm_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for DraggableLocationItem();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 56);
  v5 = sub_248AF5A2C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_248AE891C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for DraggableLocationItem() - 8) + 80);
  return sub_248AE71B0(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_248AE896C()
{
  return sub_248AE8AB4((uint64_t (*)(unint64_t, unint64_t))sub_248AE7304);
}

uint64_t objectdestroy_26Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v1 = type metadata accessor for DraggableLocationItem();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_248AF5078();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v8 = v0 + v3 + *(int *)(v1 + 56);
  v9 = sub_248AF5A2C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_248AE8AA8()
{
  return sub_248AE8AB4((uint64_t (*)(unint64_t, unint64_t))sub_248AE70B4);
}

uint64_t sub_248AE8AB4(uint64_t (*a1)(unint64_t, unint64_t))
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(type metadata accessor for DraggableLocationItem() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_248AF5078() - 8) + 80);
  return a1(v1 + v3, v1 + ((v3 + v4 + v5) & ~v5));
}

uint64_t sub_248AE8B24()
{
  uint64_t v0;

  return sub_248AE69C0(*(_QWORD *)(v0 + 16));
}

uint64_t sub_248AE8B3C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2D10);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2D08);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2D00);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B1968);
  sub_248ABD838(&qword_2577B2DD8, &qword_2577B2D00, (uint64_t (*)(void))sub_248AE8464, MEMORY[0x24BDECC38]);
  sub_248AB8BE8(&qword_2577B19C8, &qword_2577B1968, MEMORY[0x24BDEC410]);
  swift_getOpaqueTypeConformance2();
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248AE8C5C()
{
  return swift_deallocClassInstance();
}

id sub_248AE8C6C()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  _s11LookupClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2577B2DE8 = (uint64_t)result;
  return result;
}

id static NSBundle.tipsTryItFrameworkBundle.getter()
{
  if (qword_2577B10D0 != -1)
    swift_once();
  return (id)qword_2577B2DE8;
}

uint64_t _s11LookupClassCMa()
{
  return objc_opt_self();
}

uint64_t static ContentModeKey.defaultValue.getter()
{
  return 0;
}

void sub_248AE8D28(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_248AE8D30()
{
  sub_248AE9004();
  return sub_248AF50C0();
}

uint64_t EnvironmentValues.contentMode.getter()
{
  unsigned __int8 v1;

  sub_248AE8DB8();
  sub_248AF527C();
  return v1;
}

unint64_t sub_248AE8DB8()
{
  unint64_t result;

  result = qword_2577B2E88;
  if (!qword_2577B2E88)
  {
    result = MEMORY[0x2495A57B0](&protocol conformance descriptor for ContentModeKey, &type metadata for ContentModeKey);
    atomic_store(result, (unint64_t *)&qword_2577B2E88);
  }
  return result;
}

uint64_t sub_248AE8DFC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_248AE8DB8();
  result = sub_248AF527C();
  *a1 = v3;
  return result;
}

uint64_t sub_248AE8E48()
{
  sub_248AE8DB8();
  return sub_248AF5288();
}

uint64_t EnvironmentValues.contentMode.setter()
{
  sub_248AE8DB8();
  return sub_248AF5288();
}

uint64_t (*EnvironmentValues.contentMode.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = sub_248AE8DB8();
  sub_248AF527C();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 17);
  return sub_248AE8F2C;
}

uint64_t sub_248AE8F2C(uint64_t a1)
{
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  return sub_248AF5288();
}

uint64_t sub_248AE8F60@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_248AE8DB8();
  result = sub_248AF527C();
  *a1 = v3;
  return result;
}

uint64_t sub_248AE8FAC()
{
  sub_248AE8DB8();
  return sub_248AF5288();
}

ValueMetadata *type metadata accessor for ContentModeKey()
{
  return &type metadata for ContentModeKey;
}

unint64_t sub_248AE9004()
{
  unint64_t result;

  result = qword_2577B2E90;
  if (!qword_2577B2E90)
  {
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDEB468], MEMORY[0x24BDEB460]);
    atomic_store(result, (unint64_t *)&qword_2577B2E90);
  }
  return result;
}

uint64_t *sub_248AE9048(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(v4, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v4, a2, v7);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
      }
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v11 = a3[5];
    v12 = a3[6];
    v13 = (char *)v4 + v11;
    v14 = (char *)a2 + v11;
    v15 = *(_QWORD *)v14;
    LOBYTE(v14) = v14[8];
    *(_QWORD *)v13 = v15;
    v13[8] = (char)v14;
    v16 = (uint64_t *)((char *)v4 + v12);
    v17 = (uint64_t *)((char *)a2 + v12);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = a3[7];
    v20 = a3[8];
    v21 = (char *)v4 + v19;
    v22 = (char *)a2 + v19;
    *v21 = *v22;
    *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
    v23 = (char *)v4 + v20;
    v24 = (char *)a2 + v20;
    *v23 = *v24;
    *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
    v25 = a3[9];
    v26 = a3[10];
    v27 = (uint64_t *)((char *)v4 + v25);
    v28 = (uint64_t *)((char *)a2 + v25);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v27[2] = v28[2];
    v30 = (uint64_t *)((char *)v4 + v26);
    v31 = (uint64_t *)((char *)a2 + v26);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v33 = a3[11];
    v34 = a3[12];
    v35 = (uint64_t *)((char *)v4 + v33);
    v36 = (uint64_t *)((char *)a2 + v33);
    v37 = v36[1];
    *v35 = *v36;
    v35[1] = v37;
    *(uint64_t *)((char *)v4 + v34) = *(uint64_t *)((char *)a2 + v34);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_248AE926C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_248AF5408();
    v3 = *(_QWORD *)(v2 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2))
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *sub_248AE9370(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_248AF5408();
    v7 = *(_QWORD *)(v6 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    }
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
  v13 = *(_QWORD *)v12;
  LOBYTE(v12) = v12[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v12;
  v14 = (_QWORD *)((char *)a1 + v10);
  v15 = (_QWORD *)((char *)a2 + v10);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = a3[7];
  v18 = a3[8];
  v19 = (char *)a1 + v17;
  v20 = (char *)a2 + v17;
  *v19 = *v20;
  *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
  v21 = (char *)a1 + v18;
  v22 = (char *)a2 + v18;
  *v21 = *v22;
  *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
  v23 = a3[9];
  v24 = a3[10];
  v25 = (_QWORD *)((char *)a1 + v23);
  v26 = (_QWORD *)((char *)a2 + v23);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  v25[2] = v26[2];
  v28 = (_QWORD *)((char *)a1 + v24);
  v29 = (_QWORD *)((char *)a2 + v24);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v31 = a3[11];
  v32 = a3[12];
  v33 = (_QWORD *)((char *)a1 + v31);
  v34 = (_QWORD *)((char *)a2 + v31);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  *(_QWORD *)((char *)a1 + v32) = *(_QWORD *)((char *)a2 + v32);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_248AE956C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  char *v30;

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_248AF5408();
      v7 = *(_QWORD *)(v6 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(a1, a2, v6);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      }
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = *(_QWORD *)v11;
  LOBYTE(v11) = v11[8];
  *(_QWORD *)v10 = v12;
  v10[8] = (char)v11;
  swift_retain();
  swift_release();
  v13 = a3[6];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_retain();
  swift_release();
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  *v17 = *v18;
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_retain();
  swift_release();
  v19 = a3[8];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  *v20 = *v21;
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  swift_retain();
  swift_release();
  v22 = a3[9];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (char *)a2 + v22;
  *v23 = *(_QWORD *)((char *)a2 + v22);
  v23[1] = *(_QWORD *)((char *)a2 + v22 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23[2] = *((_QWORD *)v24 + 2);
  swift_retain();
  swift_release();
  v25 = a3[10];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_retain();
  swift_release();
  v28 = a3[11];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  *(_QWORD *)((char *)a1 + v28) = *(_QWORD *)((char *)a2 + v28);
  swift_retain();
  swift_release();
  *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  return a1;
}

char *sub_248AE97EC(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_248AF5408();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v10 = a3[5];
  v11 = a3[6];
  v12 = &a1[v10];
  v13 = &a2[v10];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  v14 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  v15 = a3[9];
  v16 = a3[10];
  v17 = &a1[v15];
  v18 = &a2[v15];
  *(_OWORD *)v17 = *(_OWORD *)v18;
  *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
  *(_OWORD *)&a1[v16] = *(_OWORD *)&a2[v16];
  v19 = a3[12];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  *(_QWORD *)&a1[v19] = *(_QWORD *)&a2[v19];
  return a1;
}

char *sub_248AE9958(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
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

  if (a1 != a2)
  {
    sub_248AB89E8((uint64_t)a1, &qword_2577B12F8);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248AF5408();
      v8 = *(_QWORD *)(v7 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v10 = a3[5];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = *(_QWORD *)v12;
  LOBYTE(v12) = v12[8];
  *(_QWORD *)v11 = v13;
  v11[8] = (char)v12;
  swift_release();
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v18 = *(_QWORD *)v16;
  v17 = *((_QWORD *)v16 + 1);
  *(_QWORD *)v15 = v18;
  *((_QWORD *)v15 + 1) = v17;
  swift_release();
  v19 = a3[7];
  v20 = &a1[v19];
  v21 = &a2[v19];
  *v20 = *v21;
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  swift_release();
  v22 = a3[8];
  v23 = &a1[v22];
  v24 = &a2[v22];
  *v23 = *v24;
  *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
  swift_release();
  v25 = a3[9];
  v26 = &a1[v25];
  v27 = &a2[v25];
  v28 = *(_QWORD *)&a2[v25 + 8];
  *(_QWORD *)v26 = *(_QWORD *)&a2[v25];
  *((_QWORD *)v26 + 1) = v28;
  swift_bridgeObjectRelease();
  *((_QWORD *)v26 + 2) = *((_QWORD *)v27 + 2);
  swift_release();
  v29 = a3[10];
  v30 = &a1[v29];
  v31 = &a2[v29];
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *((_QWORD *)v30 + 1) = *((_QWORD *)v31 + 1);
  swift_release();
  v32 = a3[11];
  v33 = &a1[v32];
  v34 = &a2[v32];
  *(_QWORD *)&a1[v32] = *(_QWORD *)&a2[v32];
  swift_release();
  *((_QWORD *)v33 + 1) = *((_QWORD *)v34 + 1);
  swift_release();
  *(_QWORD *)&a1[a3[12]] = *(_QWORD *)&a2[a3[12]];
  return a1;
}

uint64_t sub_248AE9B7C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AE9B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_248AE9C0C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248AE9C18(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_2577B1308);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for TouchHoldView()
{
  uint64_t result;

  result = qword_2577B2EF0;
  if (!qword_2577B2EF0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_248AE9CD4()
{
  unint64_t v0;

  sub_248ABCFE0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_248AE9D70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248AE9D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_248AF5B94();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_248AF5B88();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_248AB89E8(a1, &qword_2577B2550);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_248AF5B58();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_248AE9ECC(uint64_t *a1@<X8>)
{
  int *v2;
  char *v3;
  char v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  __int128 v21;
  uint64_t v22;
  CGRect v23;

  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  swift_storeEnumTagMultiPayload();
  v2 = (int *)type metadata accessor for TouchHoldView();
  v3 = (char *)a1 + v2[5];
  type metadata accessor for TrainingManager();
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  *(_QWORD *)v3 = sub_248AF4FDC();
  v3[8] = v4 & 1;
  v5 = v2[6];
  sub_248AF57E0();
  *(_OWORD *)((char *)a1 + v5) = v21;
  v6 = (char *)a1 + v2[7];
  sub_248AF57E0();
  *v6 = v21;
  *((_QWORD *)v6 + 1) = *((_QWORD *)&v21 + 1);
  v7 = (char *)a1 + v2[8];
  sub_248AF57E0();
  *v7 = v21;
  *((_QWORD *)v7 + 1) = *((_QWORD *)&v21 + 1);
  v8 = (char *)a1 + v2[9];
  sub_248AF57E0();
  *(_OWORD *)v8 = v21;
  *((_QWORD *)v8 + 2) = v22;
  v9 = (_OWORD *)((char *)a1 + v2[10]);
  sub_248AF57E0();
  *v9 = v21;
  v10 = v2[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2BB8);
  sub_248AF57E0();
  *(_OWORD *)((char *)a1 + v10) = v21;
  v11 = v2[12];
  v12 = objc_msgSend((id)objc_opt_self(), sel_mainScreen, 0, 0xE000000000000000);
  objc_msgSend(v12, sel_bounds);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  *(CGFloat *)((char *)a1 + v11) = CGRectGetHeight(v23);
}

uint64_t sub_248AEA104(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t result;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TouchHoldView();
  v8 = *(_BYTE *)(v1 + *(int *)(v7 + 20) + 8);
  v9 = swift_retain();
  v10 = sub_248ADB034(v9, v8);
  swift_release();
  swift_getKeyPath();
  v24 = v10;
  sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
  sub_248AF4EEC();
  swift_release();
  v11 = *(_BYTE *)(v10 + 48);
  result = swift_release();
  if ((v11 & 1) == 0)
  {
    v13 = (uint64_t *)(v2 + *(int *)(v7 + 24));
    v15 = *v13;
    v14 = v13[1];
    v24 = *v13;
    v25 = v14;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17C0);
    result = sub_248AF57EC();
    if (__OFADD__(v26, 1))
    {
      __break(1u);
    }
    else
    {
      v24 = v15;
      v25 = v14;
      v23 = v26 + 1;
      sub_248AF57F8();
      swift_release();
      v16 = swift_retain();
      v17 = sub_248ADB034(v16, v8);
      result = swift_release();
      v18 = *(_QWORD *)(v17 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 72);
      v19 = __OFADD__(v18, 1);
      v20 = v18 + 1;
      if (!v19)
      {
        *(_QWORD *)(v17 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 72) = v20;
        swift_release();
        v21 = swift_retain();
        sub_248ADB034(v21, v8);
        swift_release();
        v22 = sub_248AF5A2C();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v6, 1, 1, v22);
        sub_248AD6194(a1, 1, (uint64_t)v6);
        swift_release();
        return sub_248AB89E8((uint64_t)v6, &qword_2577B14B8);
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_248AEA330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v5;
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
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (**v38)();
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;

  v49 = a3;
  v5 = (int *)type metadata accessor for TouchHoldView();
  v46 = *((_QWORD *)v5 - 1);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v47 = v7;
  v48 = (uint64_t)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v41 = (char *)&v40 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2F48);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2F50);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2F58);
  v44 = *(_QWORD *)(v16 - 8);
  v45 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v43 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2F60);
  MEMORY[0x24BDAC7A8](v42);
  v40 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = a2;
  v51 = a1;
  sub_248AF5504();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2F68);
  sub_248AB8BE8(&qword_2577B2F70, &qword_2577B2F68, MEMORY[0x24BDF4700]);
  sub_248AF4F94();
  v19 = (uint64_t *)(a2 + v5[10]);
  v20 = *v19;
  v21 = v19[1];
  *(_QWORD *)&v52 = v20;
  *((_QWORD *)&v52 + 1) = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
  sub_248AF57EC();
  v22 = v53;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v15, v12, v9);
  v23 = &v15[*(int *)(v13 + 36)];
  *(_QWORD *)v23 = 0;
  *((_QWORD *)v23 + 1) = v22;
  v24 = v9;
  v25 = (uint64_t)v41;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v24);
  v52 = *(_OWORD *)(a2 + v5[6]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17C0);
  sub_248AF57EC();
  v26 = v53;
  sub_248AC7574(a2, v25, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  if (v26 >= 4)
  {
    v27 = *(_BYTE *)(v25 + v5[5] + 8);
    v28 = swift_retain();
    v29 = sub_248ADB034(v28, v27);
    swift_release();
    swift_getKeyPath();
    *(_QWORD *)&v52 = v29;
    sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
    sub_248AF4EEC();
    swift_release();
    swift_release();
  }
  sub_248AC75B8(v25, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  sub_248AEE080();
  v30 = v43;
  sub_248AF56B4();
  sub_248AB89E8((uint64_t)v15, &qword_2577B2F50);
  v31 = a2;
  v32 = v48;
  sub_248AC7574(v31, v48, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v33 = (*(unsigned __int8 *)(v46 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  v34 = swift_allocObject();
  sub_248AC72F4(v32, v34 + v33, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v36 = v44;
  v35 = v45;
  v37 = (uint64_t)v40;
  (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v40, v30, v45);
  v38 = (uint64_t (**)())(v37 + *(int *)(v42 + 36));
  *v38 = sub_248AEE108;
  v38[1] = (uint64_t (*)())v34;
  v38[2] = 0;
  v38[3] = 0;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v30, v35);
  return sub_248AB882C(v37, v49, &qword_2577B2F60);
}

uint64_t sub_248AEA764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  *(_QWORD *)a3 = sub_248AF5324();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2F88);
  return sub_248AEA7C0(a1, a2, (char *)(a3 + *(int *)(v6 + 44)));
}

uint64_t sub_248AEA7C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
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
  uint64_t v77;
  void (*v78)(char *, char *, uint64_t);
  char *v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;

  v97 = (char *)a2;
  v92 = a3;
  v84 = type metadata accessor for TouchAccommodationButtonView();
  v4 = MEMORY[0x24BDAC7A8](v84);
  v87 = (uint64_t *)((char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v85 = (uint64_t)&v84 - v6;
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17E0);
  v88 = *(_QWORD *)(v89 - 8);
  MEMORY[0x24BDAC7A8](v89);
  v86 = (uint64_t)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17E8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v91 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v90 = (char *)&v84 - v11;
  v12 = type metadata accessor for TouchHoldView();
  v94 = *(_QWORD *)(v12 - 8);
  v95 = v12;
  v13 = v12;
  v14 = *(_QWORD *)(v94 + 64);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v96 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v84 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2F90);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (uint64_t *)((char *)&v84 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2F98);
  v93 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2FA0);
  v25 = *(_QWORD *)(v24 - 8);
  v100 = v24;
  v101 = v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v98 = (char *)&v84 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v84 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v84 - v31;
  *v20 = sub_248AF58F4();
  v20[1] = v33;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2FA8);
  sub_248AEAF68(a1, (uint64_t)v97, (char *)v20 + *(int *)(v34 + 44));
  sub_248AB8870((uint64_t)v20, (uint64_t)v23, &qword_2577B2F90);
  v35 = &v23[*(int *)(v21 + 52)];
  *(_QWORD *)v35 = 0x7267206F746F6870;
  *((_QWORD *)v35 + 1) = 0xEA00000000006469;
  sub_248AB89E8((uint64_t)v20, &qword_2577B2F90);
  v36 = a1 + *(int *)(v13 + 32);
  v99 = a1;
  v37 = *(_BYTE *)v36;
  v38 = *(_QWORD *)(v36 + 8);
  LOBYTE(v102) = v37;
  v103 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF5804();
  sub_248AC7574(a1, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v39 = (*(unsigned __int8 *)(v94 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
  v40 = swift_allocObject();
  sub_248AC72F4((uint64_t)v17, v40 + v39, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2FB0);
  sub_248AB8BE8(&qword_2577B2FB8, &qword_2577B2F98, MEMORY[0x24BDF44C8]);
  sub_248AEEBB0(&qword_2577B2FC0, &qword_2577B2FB0, (uint64_t (*)(void))sub_248AEEAAC, MEMORY[0x24BDF5578]);
  v41 = (uint64_t)v96;
  sub_248AF5714();
  swift_release();
  swift_release();
  swift_release();
  sub_248AB89E8((uint64_t)v23, &qword_2577B2F98);
  v42 = *(void (**)(char *, char *, uint64_t))(v101 + 32);
  v97 = v32;
  v42(v32, v30, v100);
  v43 = v95;
  v44 = v99;
  v104 = *(_OWORD *)(v99 + *(int *)(v95 + 24));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B17C0);
  sub_248AF57EC();
  v45 = v44;
  v46 = v102;
  sub_248AC7574(v45, v41, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  if (v46 < 4)
  {
    sub_248AC75B8(v41, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
    v57 = 1;
    v53 = (uint64_t)v91;
    v52 = v92;
    v54 = (uint64_t)v90;
    v55 = v89;
    v56 = v88;
  }
  else
  {
    v47 = v87;
    v48 = *(_BYTE *)(v41 + *(int *)(v43 + 20) + 8);
    v49 = swift_retain();
    v50 = sub_248ADB034(v49, v48);
    swift_release();
    swift_getKeyPath();
    *(_QWORD *)&v104 = v50;
    sub_248AB80A8((unint64_t *)&qword_2577B11E8, (uint64_t (*)(uint64_t))type metadata accessor for TrainingManager, (uint64_t)&unk_248AF7298);
    sub_248AF4EEC();
    swift_release();
    v51 = *(_BYTE *)(v50 + 48);
    swift_release();
    sub_248AC75B8(v41, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
    v53 = (uint64_t)v91;
    v52 = v92;
    v54 = (uint64_t)v90;
    v55 = v89;
    v56 = v88;
    if ((v51 & 1) != 0)
    {
      v57 = 1;
    }
    else
    {
      *v47 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
      swift_storeEnumTagMultiPayload();
      v58 = (char *)v47 + *(int *)(v84 + 20);
      type metadata accessor for TrainingManager();
      *(_QWORD *)v58 = sub_248AF4FDC();
      v58[8] = v59 & 1;
      v60 = (uint64_t)v47;
      v61 = v85;
      sub_248AC72F4(v60, v85, (uint64_t (*)(_QWORD))type metadata accessor for TouchAccommodationButtonView);
      v62 = sub_248AF5534();
      v63 = (uint64_t *)(v99 + *(int *)(v43 + 40));
      v64 = *v63;
      v65 = v63[1];
      *(_QWORD *)&v104 = v64;
      *((_QWORD *)&v104 + 1) = v65;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
      sub_248AF57EC();
      sub_248AF4F88();
      v67 = v66;
      v69 = v68;
      v71 = v70;
      v73 = v72;
      v74 = v86;
      sub_248AC7574(v61, v86, (uint64_t (*)(_QWORD))type metadata accessor for TouchAccommodationButtonView);
      v75 = v74 + *(int *)(v55 + 36);
      *(_BYTE *)v75 = v62;
      *(_QWORD *)(v75 + 8) = v67;
      *(_QWORD *)(v75 + 16) = v69;
      *(_QWORD *)(v75 + 24) = v71;
      *(_QWORD *)(v75 + 32) = v73;
      *(_BYTE *)(v75 + 40) = 0;
      sub_248AC75B8(v61, (uint64_t (*)(_QWORD))type metadata accessor for TouchAccommodationButtonView);
      sub_248AB882C(v74, v54, &qword_2577B17E0);
      v57 = 0;
    }
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 56))(v54, v57, 1, v55);
  v76 = v100;
  v77 = v101;
  v78 = *(void (**)(char *, char *, uint64_t))(v101 + 16);
  v80 = (uint64_t)v97;
  v79 = v98;
  v78(v98, v97, v100);
  sub_248AB8870(v54, v53, &qword_2577B17E8);
  v78(v52, v79, v76);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2FC8);
  sub_248AB8870(v53, (uint64_t)&v52[*(int *)(v81 + 48)], &qword_2577B17E8);
  sub_248AB89E8(v54, &qword_2577B17E8);
  v82 = *(void (**)(uint64_t, uint64_t))(v77 + 8);
  v82(v80, v76);
  sub_248AB89E8(v53, &qword_2577B17E8);
  return ((uint64_t (*)(char *, uint64_t))v82)(v79, v76);
}

uint64_t sub_248AEAF68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  _OWORD *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void (*v55)(unint64_t, char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t (*v75)@<X0>(uint64_t *@<X8>);
  uint64_t (*v76)@<X0>(uint64_t *@<X8>);
  uint64_t v77;
  uint64_t (**v78)@<X0>(uint64_t *@<X8>);
  uint64_t v79;
  uint64_t v80;
  uint64_t (**v81)(double *);
  uint64_t v82;
  void (*v83)(char *, char *, uint64_t);
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  void (*v89)(char *, uint64_t);
  uint64_t v91;
  char *v92;
  char *v93;
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
  char *v104;
  _OWORD *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  char *v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _OWORD v131[8];
  _OWORD v132[9];

  v116 = a2;
  v124 = a3;
  v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2FD8);
  MEMORY[0x24BDAC7A8](v123);
  v122 = (uint64_t)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = sub_248AF53FC();
  MEMORY[0x24BDAC7A8](v114);
  v112 = (char *)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_248AF5894();
  v106 = *(_QWORD *)(v6 - 8);
  v107 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v105 = (_OWORD *)((char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = sub_248AF58A0();
  v9 = *(_QWORD *)(v8 - 8);
  v108 = v8;
  v109 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v104 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1AA0);
  v117 = *(_QWORD *)(v11 - 8);
  v118 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v111 = (char *)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1AA8);
  MEMORY[0x24BDAC7A8](v13);
  v110 = (uint64_t)&v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2FE0);
  MEMORY[0x24BDAC7A8](v115);
  v113 = (uint64_t)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2FE8);
  v16 = MEMORY[0x24BDAC7A8](v120);
  v119 = (uint64_t)&v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v121 = (uint64_t)&v91 - v18;
  v96 = sub_248AF512C();
  v98 = *(_QWORD *)(v96 - 8);
  MEMORY[0x24BDAC7A8](v96);
  v92 = (char *)&v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1968);
  v21 = *(_QWORD *)(v20 - 8);
  v99 = v20;
  v100 = v21;
  MEMORY[0x24BDAC7A8](v20);
  v93 = (char *)&v91 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for TouchHoldView();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(_QWORD *)(v24 + 64);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v91 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1970);
  v97 = *(_QWORD *)(v94 - 8);
  MEMORY[0x24BDAC7A8](v94);
  v125 = (char *)&v91 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1978);
  v95 = *(_QWORD *)(v128 - 8);
  v28 = MEMORY[0x24BDAC7A8](v128);
  v126 = (char *)&v91 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v127 = (char *)&v91 - v30;
  v31 = sub_248AF575C();
  v32 = sub_248AF58F4();
  sub_248AC0FF0(0.0, 0, 0.0, 1, 333.0, 0, 0.0, 0, (uint64_t)v131, 0.0, 1, 333.0, 0, v32, v33, v31, 0, 1, 0);
  swift_release();
  v91 = a1;
  sub_248AC7574(a1, (uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v34 = *(unsigned __int8 *)(v24 + 80);
  v35 = (v34 + 16) & ~v34;
  v101 = v34 | 7;
  v102 = v35 + v25;
  v36 = swift_allocObject();
  v103 = v35;
  sub_248AC72F4((uint64_t)v26, v36 + v35, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1980);
  v38 = sub_248ABD838(&qword_2577B1988, &qword_2577B1980, (uint64_t (*)(void))sub_248AC7FD4, MEMORY[0x24BDEDBB8]);
  sub_248AF569C();
  swift_release();
  v132[4] = v131[4];
  v132[5] = v131[5];
  v132[6] = v131[6];
  v132[7] = v131[7];
  v132[0] = v131[0];
  v132[1] = v131[1];
  v132[2] = v131[2];
  v132[3] = v131[3];
  sub_248AC8070((uint64_t)v132);
  v39 = v92;
  sub_248AF5120();
  sub_248AC7574(a1, (uint64_t)v26, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v40 = swift_allocObject() + v35;
  v41 = (uint64_t)v26;
  sub_248AC72F4((uint64_t)v26, v40, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  sub_248AB80A8(&qword_2577B19C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDED7B8], MEMORY[0x24BDED7B0]);
  v42 = v93;
  v43 = v96;
  sub_248AF5870();
  swift_release();
  (*(void (**)(char *, uint64_t))(v98 + 8))(v39, v43);
  sub_248AF4FE8();
  *(_QWORD *)&v131[0] = v37;
  *((_QWORD *)&v131[0] + 1) = v38;
  swift_getOpaqueTypeConformance2();
  sub_248AB8BE8(&qword_2577B19C8, &qword_2577B1968, MEMORY[0x24BDEC410]);
  v44 = v126;
  v45 = v94;
  v46 = v99;
  v47 = v125;
  sub_248AF56F0();
  (*(void (**)(char *, uint64_t))(v100 + 8))(v42, v46);
  (*(void (**)(char *, uint64_t))(v97 + 8))(v47, v45);
  v48 = v95;
  (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v127, v44, v128);
  v49 = v105;
  *v105 = xmmword_248AF6A10;
  (*(void (**)(_OWORD *, _QWORD, uint64_t))(v106 + 104))(v49, *MEMORY[0x24BDF4D40], v107);
  v50 = v104;
  sub_248AF58AC();
  v51 = v108;
  v52 = sub_248AF5B40();
  *(_QWORD *)(v52 + 16) = 3;
  v53 = v109;
  v54 = v52 + ((*(unsigned __int8 *)(v109 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80));
  v55 = *(void (**)(unint64_t, char *, uint64_t))(v109 + 16);
  v55(v54, v50, v51);
  v56 = *(_QWORD *)(v53 + 72);
  v55(v54 + v56, v50, v51);
  (*(void (**)(unint64_t, char *, uint64_t))(v53 + 32))(v54 + 2 * v56, v50, v51);
  sub_248AF5324();
  v57 = v91;
  v129 = v91;
  v130 = v116;
  LODWORD(v131[0]) = 0;
  sub_248AB80A8(&qword_2577B19D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF998], MEMORY[0x24BDEF9B8]);
  sub_248AF5DC8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2FF0);
  sub_248AEEBB0(&qword_2577B2FF8, &qword_2577B2FF0, (uint64_t (*)(void))sub_248AEEC14, MEMORY[0x24BDF4A08]);
  v58 = v111;
  sub_248AF5978();
  v59 = sub_248AF58F4();
  v60 = v110;
  v62 = sub_248AC18E4(0.0, 0, 0.0, 1, 333.0, 0, 0.0, 0, v110, 0.0, 1, 333.0, 0, v59, v61);
  (*(void (**)(char *, uint64_t, double))(v117 + 8))(v58, v118, v62);
  LOBYTE(v58) = sub_248AF5510();
  sub_248AF4F88();
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v71 = v113;
  sub_248AB8870(v60, v113, &qword_2577B1AA8);
  v72 = v71 + *(int *)(v115 + 36);
  *(_BYTE *)v72 = (_BYTE)v58;
  *(_QWORD *)(v72 + 8) = v64;
  *(_QWORD *)(v72 + 16) = v66;
  *(_QWORD *)(v72 + 24) = v68;
  *(_QWORD *)(v72 + 32) = v70;
  *(_BYTE *)(v72 + 40) = 0;
  sub_248AB89E8(v60, &qword_2577B1AA8);
  sub_248AC7574(v57, v41, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v73 = swift_allocObject();
  sub_248AC72F4(v41, v73 + v103, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v74 = sub_248AF58F4();
  v76 = v75;
  v77 = v122;
  sub_248AB8870(v71, v122, &qword_2577B2FE0);
  v78 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v77 + *(int *)(v123 + 36));
  *v78 = sub_248ACBF10;
  v78[1] = 0;
  v78[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v74;
  v78[3] = v76;
  v79 = swift_allocObject();
  *(_QWORD *)(v79 + 16) = sub_248AEEE94;
  *(_QWORD *)(v79 + 24) = v73;
  v80 = v119;
  sub_248AB8870(v77, v119, &qword_2577B2FD8);
  v81 = (uint64_t (**)(double *))(v80 + *(int *)(v120 + 36));
  *v81 = sub_248AC849C;
  v81[1] = (uint64_t (*)(double *))v79;
  sub_248AB89E8(v77, &qword_2577B2FD8);
  sub_248AB89E8(v71, &qword_2577B2FE0);
  v82 = v121;
  sub_248AB882C(v80, v121, &qword_2577B2FE8);
  v83 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
  v84 = v126;
  v85 = v127;
  v86 = v128;
  v83(v126, v127, v128);
  sub_248AB8870(v82, v80, &qword_2577B2FE8);
  v87 = v124;
  v83(v124, v84, v86);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3070);
  sub_248AB8870(v80, (uint64_t)&v87[*(int *)(v88 + 48)], &qword_2577B2FE8);
  sub_248AB89E8(v82, &qword_2577B2FE8);
  v89 = *(void (**)(char *, uint64_t))(v48 + 8);
  v89(v85, v86);
  sub_248AB89E8(v80, &qword_2577B2FE8);
  return ((uint64_t (*)(char *, uint64_t))v89)(v84, v86);
}

uint64_t sub_248AEB9E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_248AF5A2C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AF5A20();
  sub_248AEA104((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_248AEBA80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  __int128 v16;

  v15[1] = a3;
  v5 = sub_248AF5114();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = type metadata accessor for TouchHoldView();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v16 = xmmword_248AF6A20;
  v15[0] = swift_getKeyPath();
  sub_248AC7574(a1, (uint64_t)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v5);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = (v10 + *(unsigned __int8 *)(v6 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v13 = swift_allocObject();
  sub_248AC72F4((uint64_t)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v11, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v13 + v12, (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1A78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3008);
  sub_248AC84F4();
  sub_248AEEC14();
  return sub_248AF5864();
}

uint64_t sub_248AEBC3C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t KeyPath;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v41)(void);
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t result;
  _QWORD v68[2];
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  _OWORD v93[9];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _OWORD v102[2];
  _QWORD v103[2];

  v86 = a2;
  v87 = a3;
  v68[1] = a4;
  v5 = sub_248AF52C4();
  MEMORY[0x24BDAC7A8](v5);
  v90 = (char *)v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v7);
  v89 = (char *)v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v9);
  v88 = (char *)v68 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3078);
  MEMORY[0x24BDAC7A8](v11);
  v85 = (uint64_t)v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for TouchHoldView();
  v14 = *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64);
  v83 = *(_QWORD *)(v13 - 8);
  v84 = v14;
  MEMORY[0x24BDAC7A8](v13);
  v82 = (uint64_t)v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1690);
  MEMORY[0x24BDAC7A8](v75);
  v17 = (char *)v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_248AF52DC();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v68 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_248AF5150();
  MEMORY[0x24BDAC7A8](v69);
  v23 = (char *)v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3038);
  MEMORY[0x24BDAC7A8](v71);
  v25 = (_OWORD *)((char *)v68 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3020);
  MEMORY[0x24BDAC7A8](v73);
  v72 = (uint64_t)v68 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3080);
  v80 = *(_QWORD *)(v27 - 8);
  v81 = v27;
  MEMORY[0x24BDAC7A8](v27);
  v76 = (char *)v68 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3018);
  MEMORY[0x24BDAC7A8](v78);
  v77 = (char *)v68 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3008);
  MEMORY[0x24BDAC7A8](v68[0]);
  v79 = (char *)v68 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = *a1;
  strcpy((char *)v103, "TapTouchGrid");
  BYTE5(v103[1]) = 0;
  HIWORD(v103[1]) = -5120;
  *(_QWORD *)&v94 = v74;
  sub_248AF5D5C();
  sub_248AF5AB0();
  swift_bridgeObjectRelease();
  v31 = v103[0];
  v32 = v103[1];
  v70 = v103[0];
  KeyPath = swift_getKeyPath();
  swift_bridgeObjectRetain();
  v34 = sub_248AF58F4();
  sub_248AC1B18(0.0, 0, 0.0, 1, 103.0, 0, 0.0, 0, (uint64_t)&v94, 0.0, 1, 103.0, 0, v34, v35, KeyPath, 0, v31, v32);
  swift_bridgeObjectRelease();
  swift_release();
  v93[6] = v100;
  v93[7] = v101;
  v93[8] = v102[0];
  v93[2] = v96;
  v93[3] = v97;
  v93[4] = v98;
  v93[5] = v99;
  v93[0] = v94;
  v93[1] = v95;
  *(_QWORD *)&v102[1] = 0x3FF0000000000000;
  WORD4(v102[1]) = 256;
  (*(void (**)(char *, _QWORD, uint64_t))(v19 + 104))(v21, *MEMORY[0x24BDEEB68], v18);
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(&v23[*(int *)(v69 + 20)], v21, v18);
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)v23 = _Q0;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  v41 = MEMORY[0x24BDED998];
  sub_248AC7574((uint64_t)v23, (uint64_t)v17, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)&v17[*(int *)(v75 + 36)] = 256;
  sub_248AB8870((uint64_t)v17, (uint64_t)v25 + *(int *)(v71 + 36), &qword_2577B1690);
  v42 = v101;
  v25[6] = v100;
  v25[7] = v42;
  v25[8] = v102[0];
  *(_OWORD *)((char *)v25 + 138) = *(_OWORD *)((char *)v102 + 10);
  v43 = v97;
  v25[2] = v96;
  v25[3] = v43;
  v44 = v99;
  v25[4] = v98;
  v25[5] = v44;
  v45 = v95;
  *v25 = v94;
  v25[1] = v45;
  sub_248ABDC88((uint64_t)&v94);
  sub_248AB89E8((uint64_t)v17, &qword_2577B1690);
  sub_248AC75B8((uint64_t)v23, (uint64_t (*)(_QWORD))v41);
  sub_248ABDCC0((uint64_t)v93);
  v46 = swift_getKeyPath();
  v47 = v72;
  sub_248AB8870((uint64_t)v25, v72, &qword_2577B3038);
  v48 = v47 + *(int *)(v73 + 36);
  *(_QWORD *)v48 = v46;
  *(_BYTE *)(v48 + 8) = 1;
  sub_248AB89E8((uint64_t)v25, &qword_2577B3038);
  v49 = v86;
  v50 = v82;
  sub_248AC7574(v86, v82, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v51 = (*(unsigned __int8 *)(v83 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v83 + 80);
  v52 = swift_allocObject();
  sub_248AC72F4(v50, v52 + v51, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  sub_248AEED44();
  v53 = v76;
  sub_248AF569C();
  swift_release();
  sub_248AB89E8(v47, &qword_2577B3020);
  v54 = v85;
  v55 = v74;
  sub_248AEC4A4(v49, v70, v32, v87, v74, v85);
  swift_bridgeObjectRelease();
  v56 = sub_248AF58F4();
  v58 = v57;
  v59 = (uint64_t)v77;
  v60 = (uint64_t)&v77[*(int *)(v78 + 36)];
  v61 = v54;
  sub_248AB8870(v54, v60, &qword_2577B3078);
  v62 = (uint64_t *)(v60 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577B3068) + 36));
  *v62 = v56;
  v62[1] = v58;
  v64 = v80;
  v63 = v81;
  (*(void (**)(uint64_t, char *, uint64_t))(v80 + 16))(v59, v53, v81);
  v65 = (uint64_t)v79;
  sub_248AB89E8(v61, &qword_2577B3078);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v53, v63);
  sub_248AF5A20();
  sub_248AF4EC8();
  v91 = sub_248AF5A68();
  v92 = v66;
  sub_248AEEC98();
  sub_248ABDD1C();
  sub_248AF56CC();
  swift_bridgeObjectRelease();
  sub_248AB89E8(v59, &qword_2577B3018);
  sub_248AF52B8();
  result = sub_248AF52AC();
  if (__OFADD__(v55, 1))
  {
    __break(1u);
  }
  else
  {
    v91 = v55 + 1;
    sub_248AF52A0();
    sub_248AF52AC();
    sub_248AF52D0();
    sub_248AF50E4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_248AB89E8(v65, &qword_2577B3008);
  }
  return result;
}

uint64_t sub_248AEC4A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _OWORD *v23;
  uint64_t v24;
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
  char *v35;
  char v36;
  uint64_t v37;
  uint64_t KeyPath;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v47)(void);
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t OpaqueTypeConformance2;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t result;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;

  v102 = a2;
  v103 = a5;
  v97 = a4;
  v95 = a3;
  v101 = a6;
  v7 = sub_248AF52C4();
  MEMORY[0x24BDAC7A8](v7);
  v100 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v9);
  v99 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v11);
  v98 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for TouchHoldView();
  v85 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v86 = v14;
  v87 = (uint64_t *)((char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1690);
  MEMORY[0x24BDAC7A8](v81);
  v82 = (uint64_t)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_248AF52DC();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_248AF5150();
  MEMORY[0x24BDAC7A8](v79);
  v21 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3088);
  MEMORY[0x24BDAC7A8](v80);
  v23 = (_OWORD *)((char *)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3090);
  MEMORY[0x24BDAC7A8](v84);
  v83 = (uint64_t)&v76 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3098);
  v89 = *(_QWORD *)(v25 - 8);
  v90 = v25;
  MEMORY[0x24BDAC7A8](v25);
  v88 = (char *)&v76 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B30A0);
  v92 = *(_QWORD *)(v27 - 8);
  v93 = v27;
  MEMORY[0x24BDAC7A8](v27);
  v91 = (char *)&v76 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B30A8);
  v30 = *(_QWORD *)(v29 - 8);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v94 = (char *)&v76 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v78 = (char *)&v76 - v33;
  v34 = *(int *)(v13 + 28);
  v96 = a1;
  v35 = (char *)(a1 + v34);
  v36 = *v35;
  v37 = *((_QWORD *)v35 + 1);
  LOBYTE(v115) = v36;
  *((_QWORD *)&v115 + 1) = v37;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57EC();
  if (v106 != 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v101, 1, 1, v29);
  v76 = v30;
  v77 = v29;
  KeyPath = swift_getKeyPath();
  v39 = v95;
  swift_bridgeObjectRetain();
  v40 = sub_248AF58F4();
  sub_248AC1B18(0.0, 0, 0.0, 1, 103.0, 0, 0.0, 0, (uint64_t)&v106, 0.0, 1, 103.0, 0, v40, v41, KeyPath, 0, v102, v39);
  swift_bridgeObjectRelease();
  swift_release();
  v121 = v112;
  v122 = v113;
  v123 = v114;
  v117 = v108;
  v118 = v109;
  v119 = v110;
  v120 = v111;
  v115 = v106;
  v116 = v107;
  (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v19, *MEMORY[0x24BDEEB68], v16);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(&v21[*(int *)(v79 + 20)], v19, v16);
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)v21 = _Q0;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  v47 = MEMORY[0x24BDED998];
  v48 = v82;
  sub_248AC7574((uint64_t)v21, v82, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v48 + *(int *)(v81 + 36)) = 256;
  sub_248AB8870(v48, (uint64_t)v23 + *(int *)(v80 + 36), &qword_2577B1690);
  v49 = v122;
  v23[6] = v121;
  v23[7] = v49;
  v23[8] = v123;
  v50 = v118;
  v23[2] = v117;
  v23[3] = v50;
  v51 = v120;
  v23[4] = v119;
  v23[5] = v51;
  v52 = v116;
  *v23 = v115;
  v23[1] = v52;
  sub_248ABDC88((uint64_t)&v115);
  sub_248AB89E8(v48, &qword_2577B1690);
  sub_248AC75B8((uint64_t)v21, (uint64_t (*)(_QWORD))v47);
  sub_248ABDCC0((uint64_t)&v115);
  v53 = swift_getKeyPath();
  v54 = v83;
  sub_248AB8870((uint64_t)v23, v83, &qword_2577B3088);
  v55 = v84;
  v56 = v54 + *(int *)(v84 + 36);
  *(_QWORD *)v56 = v53;
  *(_BYTE *)(v56 + 8) = 1;
  sub_248AB89E8((uint64_t)v23, &qword_2577B3088);
  v57 = (uint64_t)v87;
  sub_248AC7574(v96, (uint64_t)v87, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v58 = (*(unsigned __int8 *)(v85 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80);
  v59 = swift_allocObject();
  sub_248AC72F4(v57, v59 + v58, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v60 = sub_248AEF138();
  v61 = v88;
  sub_248AF569C();
  swift_release();
  v62 = sub_248AB89E8(v54, &qword_2577B3090);
  v87 = &v76;
  v63 = MEMORY[0x24BDAC7A8](v62);
  MEMORY[0x24BDAC7A8](v63);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B30C0);
  *(_QWORD *)&v106 = v55;
  *((_QWORD *)&v106 + 1) = v60;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  *(_QWORD *)&v75 = sub_248AEF25C();
  *((_QWORD *)&v75 + 1) = sub_248AEF2A0();
  v66 = v90;
  v67 = v91;
  sub_248AF5684();
  (*(void (**)(char *, uint64_t))(v89 + 8))(v61, v66);
  sub_248AF5A20();
  sub_248AF4EC8();
  v104 = sub_248AF5A68();
  v105 = v68;
  *(_QWORD *)&v106 = v66;
  *((_QWORD *)&v106 + 1) = &type metadata for ContextMenuView;
  *(_QWORD *)&v107 = v64;
  *((_QWORD *)&v107 + 1) = OpaqueTypeConformance2;
  v108 = v75;
  swift_getOpaqueTypeConformance2();
  sub_248ABDD1C();
  v69 = v93;
  v70 = (uint64_t)v94;
  sub_248AF56CC();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v92 + 8))(v67, v69);
  sub_248AF52B8();
  result = sub_248AF52AC();
  if (__OFADD__(v103, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)&v106 = v103 + 1;
    sub_248AF52A0();
    sub_248AF52AC();
    sub_248AF52D0();
    v72 = v77;
    v73 = (uint64_t)v78;
    sub_248AF50E4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_248AB89E8(v70, &qword_2577B30A8);
    v74 = v101;
    sub_248AB882C(v73, v101, &qword_2577B30A8);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v76 + 56))(v74, 0, 1, v72);
  }
  return result;
}

uint64_t sub_248AECD98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_248AF5A2C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AF5A20();
  sub_248AEA104((uint64_t)v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_248AECE34@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  type metadata accessor for TouchHoldView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF5804();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2FD0);
  sub_248AF5804();
  *(_OWORD *)a3 = v7;
  *(_BYTE *)(a3 + 16) = v8;
  *(_OWORD *)(a3 + 24) = v7;
  *(_QWORD *)(a3 + 40) = v8;
  *(_QWORD *)(a3 + 48) = v9;
  *(_QWORD *)(a3 + 56) = a1;
  *(_QWORD *)(a3 + 64) = a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_248AECF1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t KeyPath;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)();
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t (*v55)();
  uint64_t v56;

  v44 = a5;
  v36 = a4;
  v41 = a1;
  v42 = a2;
  v35 = a6;
  v8 = sub_248AF52C4();
  MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v10);
  v40 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v12);
  v39 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for TouchHoldView();
  v15 = *(_QWORD *)(v14 - 8);
  v37 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_248AF5114();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_QWORD *)(v19 + 64);
  MEMORY[0x24BDAC7A8](v18);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B30C0);
  MEMORY[0x24BDAC7A8](v34);
  v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))((char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v18);
  sub_248AC7574(a4, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v23 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v24 = *(unsigned __int8 *)(v15 + 80);
  v25 = (v20 + v24 + v23) & ~v24;
  v26 = swift_allocObject();
  v27 = v26 + v23;
  v28 = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v27, (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
  sub_248AC72F4((uint64_t)v17, v28 + v25, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  sub_248AC7574(v36, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v29 = swift_allocObject();
  sub_248AC72F4((uint64_t)v17, v29 + ((v24 + 16) & ~v24), (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v30 = KeyPath;
  v47 = KeyPath;
  v48 = 0;
  v49 = v41;
  v50 = v42;
  v51 = sub_248AEF4CC;
  v52 = v28;
  v53 = 0u;
  v54 = 0u;
  v55 = sub_248AEF678;
  v56 = v29;
  swift_bridgeObjectRetain();
  sub_248AF5A20();
  sub_248AF4EC8();
  v45 = sub_248AF5A68();
  v46 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B30E0);
  sub_248ABD838(&qword_2577B30D8, &qword_2577B30E0, sub_248AC840C, MEMORY[0x24BDF0910]);
  sub_248ABDD1C();
  sub_248AF56CC();
  swift_bridgeObjectRelease();
  sub_248ABDC3C(v30, 0);
  swift_bridgeObjectRelease();
  sub_248ABDA14((uint64_t)sub_248AEF4CC);
  sub_248ABDA14(0);
  sub_248ABDA14(0);
  sub_248ABDA14((uint64_t)sub_248AEF678);
  sub_248AF52B8();
  result = sub_248AF52AC();
  if (__OFADD__(v44, 1))
  {
    __break(1u);
  }
  else
  {
    v47 = v44 + 1;
    sub_248AF52A0();
    sub_248AF52AC();
    sub_248AF52D0();
    sub_248AF50E4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_248AB89E8((uint64_t)v22, &qword_2577B30C0);
  }
  return result;
}

uint64_t sub_248AED3DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;

  v3 = type metadata accessor for TouchHoldView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = v3;
  v28 = v3;
  v29 = v4;
  v6 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2550);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B14B8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_248AF5A2C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v31 = 0x7267206F746F6870;
  *((_QWORD *)&v31 + 1) = 0xEA00000000006469;
  sub_248AF5108();
  v17 = a2 + *(int *)(v5 + 20);
  v18 = a2;
  LOBYTE(a2) = *(_BYTE *)(v17 + 8);
  v19 = swift_retain();
  sub_248ADB034(v19, a2);
  swift_release();
  sub_248AF5A20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  sub_248AD6194((uint64_t)v16, 0, (uint64_t)v12);
  swift_release();
  sub_248AB89E8((uint64_t)v12, &qword_2577B14B8);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v20 = sub_248AF5B94();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v9, 1, 1, v20);
  sub_248AC7574(v18, (uint64_t)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  sub_248AF5B70();
  v21 = sub_248AF5B64();
  v22 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  v23 = swift_allocObject();
  v24 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v23 + 16) = v21;
  *(_QWORD *)(v23 + 24) = v24;
  sub_248AC72F4((uint64_t)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v25 = sub_248AE9D80((uint64_t)v9, (uint64_t)&unk_2577B30F0, v23);
  v31 = *(_OWORD *)(v18 + *(int *)(v28 + 44));
  v30 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B18);
  return sub_248AF57F8();
}

uint64_t sub_248AED6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[4] = a4;
  v5 = sub_248AF5CD8();
  v4[5] = v5;
  v4[6] = *(_QWORD *)(v5 - 8);
  v4[7] = swift_task_alloc();
  sub_248AF5B70();
  v4[8] = sub_248AF5B64();
  v4[9] = sub_248AF5B58();
  v4[10] = v6;
  return swift_task_switch();
}

uint64_t sub_248AED748()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  sub_248AF5CCC();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2577B1918 + dword_2577B1918);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_248AED7C8;
  return v3(2000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_248AED7C8()
{
  void *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  v4 = v2[6];
  v3 = v2[7];
  v5 = v2[5];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(v2[7], v2[5]);
  }
  return swift_task_switch();
}

uint64_t sub_248AED868()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  char v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2 = (char *)(v1 + *(int *)(type metadata accessor for TouchHoldView() + 28));
  v3 = *v2;
  v4 = *((_QWORD *)v2 + 1);
  *(_BYTE *)(v0 + 16) = v3;
  *(_QWORD *)(v0 + 24) = v4;
  *(_BYTE *)(v0 + 96) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C0);
  sub_248AF57F8();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AED8F0(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v6;

  v2 = type metadata accessor for TouchHoldView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2B18);
  sub_248AF57EC();
  if (v6)
  {
    sub_248AF5BA0();
    swift_release();
  }
  v3 = *(_BYTE *)(a1 + *(int *)(v2 + 20) + 8);
  v4 = swift_retain();
  sub_248ADB034(v4, v3);
  swift_release();
  sub_248AD5958(1, 0, 1);
  return swift_release();
}

uint64_t sub_248AED9C4(uint64_t a1, double a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unsigned int (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  double v24;
  char v25;
  void (*v26)(char *, uint64_t);
  double v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;

  v5 = sub_248AF5408();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1470);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1300);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v37 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v37 - v19;
  v37 = a1;
  sub_248ADB6C8((uint64_t)&v37 - v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v18, *MEMORY[0x24BDEFEE8], v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v18, 0, 1, v5);
  v21 = (uint64_t)&v11[*(int *)(v9 + 48)];
  sub_248AB8870((uint64_t)v20, (uint64_t)v11, &qword_2577B1300);
  sub_248AB8870((uint64_t)v18, v21, &qword_2577B1300);
  v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v22((uint64_t)v11, 1, v5) == 1)
  {
    sub_248AB89E8((uint64_t)v18, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v20, &qword_2577B1300);
    if (v22(v21, 1, v5) == 1)
    {
      sub_248AB89E8((uint64_t)v11, &qword_2577B1300);
      v23 = v37;
LABEL_8:
      v24 = *(double *)(v23 + *(int *)(type metadata accessor for TouchHoldView() + 48)) * 0.5;
      goto LABEL_10;
    }
  }
  else
  {
    sub_248AB8870((uint64_t)v11, (uint64_t)v15, &qword_2577B1300);
    if (v22(v21, 1, v5) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v8, v21, v5);
      sub_248AB80A8(&qword_2577B1478, (uint64_t (*)(uint64_t))MEMORY[0x24BDEFEF8], MEMORY[0x24BDEFF08]);
      v25 = sub_248AF5A14();
      v26 = *(void (**)(char *, uint64_t))(v6 + 8);
      v26(v8, v5);
      sub_248AB89E8((uint64_t)v18, &qword_2577B1300);
      sub_248AB89E8((uint64_t)v20, &qword_2577B1300);
      v26(v15, v5);
      sub_248AB89E8((uint64_t)v11, &qword_2577B1300);
      v23 = v37;
      if ((v25 & 1) == 0)
      {
        v24 = 373.0;
        goto LABEL_10;
      }
      goto LABEL_8;
    }
    sub_248AB89E8((uint64_t)v18, &qword_2577B1300);
    sub_248AB89E8((uint64_t)v20, &qword_2577B1300);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v5);
  }
  sub_248AB89E8((uint64_t)v11, &qword_2577B1470);
  v24 = 373.0;
  v23 = v37;
LABEL_10:
  v27 = v24 + a3 * -0.5;
  v28 = type metadata accessor for TouchHoldView();
  v29 = (uint64_t *)(v23 + *(int *)(v28 + 40));
  v30 = *v29;
  v31 = v29[1];
  v38 = v27;
  v39 = v30;
  v40 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B13C8);
  sub_248AF57F8();
  LOBYTE(v28) = *(_BYTE *)(v23 + *(int *)(v28 + 20) + 8);
  v32 = swift_retain();
  v33 = sub_248ADB034(v32, v28);
  swift_release();
  v39 = v30;
  v40 = v31;
  sub_248AF57EC();
  *(double *)(v33 + 64) = v38;
  swift_release();
  v34 = swift_retain();
  v35 = sub_248ADB034(v34, v28);
  swift_release();
  v39 = v30;
  v40 = v31;
  sub_248AF57EC();
  *(double *)(v35 + 56) = v38;
  return swift_release();
}

void sub_248AEDDF4(_QWORD *a1@<X8>)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  type metadata accessor for TouchHoldView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B2FD0);
  sub_248AF57EC();
  v2 = (void *)sub_248AF5A38();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v2);

  v4 = (void *)sub_248AF5A38();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_withConfiguration_, v4, v3, 0);

  *a1 = v5;
}

uint64_t sub_248AEDF08(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_BYTE *)(a1 + *(int *)(type metadata accessor for TouchHoldView() + 20) + 8);
  v2 = swift_retain();
  v3 = sub_248ADB034(v2, v1);
  swift_release();
  *(_BYTE *)(v3 + OBJC_IVAR____TtC9TipsTryIt15TrainingManager_analyticsKeys + 93) = 1;
  return swift_release();
}

uint64_t sub_248AEDF74@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](a1);
  sub_248AC7574(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  result = sub_248AC72F4((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (uint64_t (*)(_QWORD))type metadata accessor for TouchHoldView);
  *a2 = sub_248AEE02C;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_248AEE02C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TouchHoldView() - 8) + 80);
  return sub_248AEA330(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_248AEE078@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_248AEA764(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_248AEE080()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B2F78;
  if (!qword_2577B2F78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B2F50);
    v2[0] = sub_248AB8BE8(&qword_2577B2F80, &qword_2577B2F48, MEMORY[0x24BDEB238]);
    v2[1] = MEMORY[0x24BDEC438];
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B2F78);
  }
  return result;
}

uint64_t sub_248AEE108()
{
  return sub_248AEF684(sub_248AEDF08);
}

uint64_t sub_248AEE114@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  void (*v22)(char *, char *, uint64_t);
  char *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v27;
  char *v28;

  v2 = v1;
  v28 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3118);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v27 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v27 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v27 - v14;
  v16 = swift_allocObject();
  v17 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v16 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v16 + 64) = v17;
  *(_QWORD *)(v16 + 80) = *(_QWORD *)(v2 + 64);
  v18 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v16 + 32) = v18;
  sub_248AEFCE4(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3120);
  sub_248AB8BE8(&qword_2577B3128, &qword_2577B3120, MEMORY[0x24BDF4498]);
  sub_248AF5828();
  v19 = swift_allocObject();
  v20 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v19 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v19 + 64) = v20;
  *(_QWORD *)(v19 + 80) = *(_QWORD *)(v2 + 64);
  v21 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v19 + 32) = v21;
  sub_248AEFCE4(v2);
  sub_248AF5828();
  v22 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v22(v10, v15, v3);
  v22(v7, v13, v3);
  v23 = v28;
  v22(v28, v10, v3);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3130);
  v22(&v23[*(int *)(v24 + 48)], v7, v3);
  v25 = *(void (**)(char *, uint64_t))(v4 + 8);
  v25(v13, v3);
  v25(v15, v3);
  v25(v7, v3);
  return ((uint64_t (*)(char *, uint64_t))v25)(v10, v3);
}

void sub_248AEE368()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_generalPasteboard);
  swift_bridgeObjectRetain();
  v1 = (void *)sub_248AF5A38();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v1);

  v3 = (void *)sub_248AF5A38();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_withConfiguration_, v3, v2, 0);

  objc_msgSend(v0, sel_setImage_, v4);
}

double sub_248AEE484@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_248AEE79C((void (*)(__int128 *__return_ptr))sub_248AEE490, a1).n128_u64[0];
  return result;
}

uint64_t sub_248AEE490@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
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
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v19;

  v2 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_248AF4E2C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v8);
  sub_248AF5A20();
  if (qword_2577B10B0 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v3, (uint64_t)qword_2577B5078);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_248AF4EC8();
  sub_248AF4E44();
  v10 = sub_248AF5618();
  v12 = v11;
  v14 = v13;
  v16 = v15 & 1;
  v17 = sub_248AF57A4();
  *(_QWORD *)a1 = v10;
  *(_QWORD *)(a1 + 8) = v12;
  *(_BYTE *)(a1 + 16) = v16;
  *(_QWORD *)(a1 + 24) = v14;
  *(_QWORD *)(a1 + 32) = v17;
  sub_248ABFA10(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_248ABF9B0(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_248AEE6B0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _QWORD v9[2];
  __int128 v10;
  __int128 v11;
  BOOL v12;
  uint64_t v13;

  v3 = *a1;
  v2 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v13 = v3;
  *(_QWORD *)&v10 = v3;
  *((_QWORD *)&v10 + 1) = v2;
  LOBYTE(v11) = v4;
  sub_248AB818C((uint64_t)&v13);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577B1480);
  MEMORY[0x2495A4E68](v9);
  *(_QWORD *)&v10 = v3;
  *((_QWORD *)&v10 + 1) = v2;
  LOBYTE(v11) = v4;
  v12 = (v9[0] & 1) == 0;
  sub_248AF5840();
  sub_248AC8070((uint64_t)&v13);
  swift_release();
  v6 = a1[7];
  v5 = a1[8];
  v7 = *(_OWORD *)(a1 + 5);
  v10 = *(_OWORD *)(a1 + 3);
  v11 = v7;
  v9[0] = v6;
  v9[1] = v5;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3138);
  return sub_248AF5840();
}

double sub_248AEE790@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_248AEE79C((void (*)(__int128 *__return_ptr))sub_248AEE800, a1).n128_u64[0];
  return result;
}

__n128 sub_248AEE79C@<Q0>(void (*a1)(__int128 *__return_ptr)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  __n128 result;
  __int128 v7;
  __int128 v8;
  char v9;
  __n128 v10;

  v4 = sub_248AF5294();
  a1(&v8);
  v5 = v9;
  result = v10;
  v7 = v8;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_OWORD *)(a2 + 24) = v7;
  *(_BYTE *)(a2 + 40) = v5;
  *(__n128 *)(a2 + 48) = result;
  return result;
}

uint64_t sub_248AEE800@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
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
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v19;

  v2 = sub_248AF4ED4();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_248AF4E2C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_248AF5A2C();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_248AF4E38();
  MEMORY[0x24BDAC7A8](v8);
  sub_248AF5A20();
  if (qword_2577B10B0 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v3, (uint64_t)qword_2577B5078);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_248AF4EC8();
  sub_248AF4E44();
  v10 = sub_248AF5618();
  v12 = v11;
  v14 = v13;
  v16 = v15 & 1;
  v17 = sub_248AF57A4();
  *(_QWORD *)a1 = v10;
  *(_QWORD *)(a1 + 8) = v12;
  *(_BYTE *)(a1 + 16) = v16;
  *(_QWORD *)(a1 + 24) = v14;
  *(_QWORD *)(a1 + 32) = v17;
  sub_248ABFA10(v10, v12, v16);
  swift_bridgeObjectRetain();
  sub_248ABF9B0(v10, v12, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_248AEEA24@<X0>(char *a1@<X8>)
{
  return sub_248AEE114(a1);
}

void sub_248AEEA70(_QWORD *a1@<X8>)
{
  type metadata accessor for TouchHoldView();
  sub_248AEDDF4(a1);
}

unint64_t sub_248AEEAAC()
{
  unint64_t result;

  result = qword_2577B36E0;
  if (!qword_2577B36E0)
  {
    result = MEMORY[0x2495A57B0](&unk_248AF81AC, &type metadata for ShareSheetView);
    atomic_store(result, (unint64_t *)&qword_2577B36E0);
  }
  return result;
}

uint64_t sub_248AEEAFC()
{
  return sub_248AEEB18();
}

uint64_t sub_248AEEB18()
{
  type metadata accessor for TouchHoldView();
  return sub_248AECD98();
}

uint64_t sub_248AEEB6C()
{
  type metadata accessor for TouchHoldView();
  return sub_248AEB9E8();
}

uint64_t sub_248AEEBA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_248AEBA80(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_248AEEBB0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x2495A57B0](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_248AEEC14()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B3000;
  if (!qword_2577B3000)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B3008);
    v2[0] = sub_248AEEC98();
    v2[1] = sub_248AB80A8(&qword_2577B1A58, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B3000);
  }
  return result;
}

unint64_t sub_248AEEC98()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2577B3010;
  if (!qword_2577B3010)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B3018);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B3020);
    v2[3] = sub_248AEED44();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_248AB8BE8(&qword_2577B3060, &qword_2577B3068, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B3010);
  }
  return result;
}

unint64_t sub_248AEED44()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B3028;
  if (!qword_2577B3028)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B3020);
    v2[0] = sub_248AEEDC8();
    v2[1] = sub_248AB8BE8(&qword_2577B18E0, &qword_2577B18E8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B3028);
  }
  return result;
}

unint64_t sub_248AEEDC8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B3030;
  if (!qword_2577B3030)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B3038);
    v2[0] = sub_248ABD838(&qword_2577B3040, &qword_2577B3048, sub_248AEEE6C, MEMORY[0x24BDEEC40]);
    v2[1] = sub_248AB8BE8(qword_2577B16D8, &qword_2577B1690, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B3030);
  }
  return result;
}

uint64_t sub_248AEEE6C()
{
  return sub_248ABD838(&qword_2577B3050, &qword_2577B3058, (uint64_t (*)(void))sub_248AC7BE0, MEMORY[0x24BDEDBB8]);
}

uint64_t sub_248AEEE94(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TouchHoldView() - 8) + 80);
  return sub_248AED9C4(v2 + ((v5 + 16) & ~v5), a1, a2);
}

uint64_t sub_248AEEED8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AEEEFC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(type metadata accessor for TouchHoldView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v8 = *(_QWORD *)(v1 + 64);
  v9 = sub_248AF5114();
  v3 = *(_QWORD *)(v9 - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_248AF5408();
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v2, 1, v5))
      (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v2, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + ((v2 + v8 + v4) & ~v4), v9);
  return swift_deallocObject();
}

uint64_t sub_248AEF094@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(type metadata accessor for TouchHoldView() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(sub_248AF5114() - 8) + 80);
  return sub_248AEBC3C(a1, v2 + v6, v2 + ((v6 + v7 + v8) & ~v8), a2);
}

uint64_t sub_248AEF118()
{
  return sub_248AEEB18();
}

unint64_t sub_248AEF138()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B30B0;
  if (!qword_2577B30B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B3090);
    v2[0] = sub_248AEF1BC();
    v2[1] = sub_248AB8BE8(&qword_2577B18E0, &qword_2577B18E8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B30B0);
  }
  return result;
}

unint64_t sub_248AEF1BC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B30B8;
  if (!qword_2577B30B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B3088);
    v2[0] = sub_248AEEE6C();
    v2[1] = sub_248AB8BE8(qword_2577B16D8, &qword_2577B1690, MEMORY[0x24BDEB950]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B30B8);
  }
  return result;
}

uint64_t sub_248AEF240@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_248AECE34(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), a1);
}

uint64_t sub_248AEF24C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_248AECF1C(v1[2], v1[3], v1[4], v1[5], v1[6], a1);
}

unint64_t sub_248AEF25C()
{
  unint64_t result;

  result = qword_2577B30C8;
  if (!qword_2577B30C8)
  {
    result = MEMORY[0x2495A57B0](&unk_248AF7EA8, &type metadata for ContextMenuView);
    atomic_store(result, (unint64_t *)&qword_2577B30C8);
  }
  return result;
}

unint64_t sub_248AEF2A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577B30D0;
  if (!qword_2577B30D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B30C0);
    v2[0] = sub_248ABD838(&qword_2577B30D8, &qword_2577B30E0, sub_248AC840C, MEMORY[0x24BDF0910]);
    v2[1] = sub_248AB80A8(&qword_2577B1A58, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577B30D0);
  }
  return result;
}

uint64_t sub_248AEF344()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = sub_248AF5114();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TouchHoldView() - 8) + 80);
  v6 = (v3 + v4 + v5) & ~v5;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_248AF5408();
    v8 = *(_QWORD *)(v7 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v0 + v6, 1, v7))
      (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AEF4CC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(sub_248AF5114() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TouchHoldView() - 8) + 80);
  return sub_248AED3DC(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

uint64_t objectdestroyTm_6()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for TouchHoldView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_248AF5408();
    v4 = *(_QWORD *)(v3 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
      (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AEF678()
{
  return sub_248AEF684(sub_248AED8F0);
}

uint64_t sub_248AEF684(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TouchHoldView() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_248AEF6C0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for TouchHoldView() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B12F8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_248AF5408();
    v4 = *(_QWORD *)(v3 - 8);
    if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
      (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AEF810(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TouchHoldView() - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_248AC7858;
  return sub_248AED6B4(a1, v5, v6, v7);
}

uint64_t sub_248AEF894(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_248AEF8F8;
  return v6(a1);
}

uint64_t sub_248AEF8F8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_248AEF944(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_248AC7858;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2577B30F8 + dword_2577B30F8))(a1, v4);
}

uint64_t destroy for ContextMenuView()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ContextMenuView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ContextMenuView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ContextMenuView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContextMenuView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContextMenuView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContextMenuView()
{
  return &type metadata for ContextMenuView;
}

uint64_t sub_248AEFC9C()
{
  return sub_248AB8BE8(&qword_2577B3108, &qword_2577B3110, MEMORY[0x24BDEDA10]);
}

uint64_t sub_248AEFCC8()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_248AEFCDC()
{
  sub_248AEE368();
}

uint64_t sub_248AEFCE4(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t objectdestroy_56Tm()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_248AEFDA4()
{
  uint64_t v0;

  return sub_248AEE6B0((uint64_t *)(v0 + 16));
}

uint64_t sub_248AEFDAC()
{
  return sub_248AB8BE8(&qword_2577B3140, &qword_2577B3148, MEMORY[0x24BDF5428]);
}

void sub_248AEFDE0()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_248AEFE0C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TryItLaunchAnalyticsEvent()
{
  return objc_opt_self();
}

void sub_248AEFE70(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_248AEFEA8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_248AEFF68 + 4 * byte_248AF7F27[a2]))(7364980);
}

uint64_t sub_248AEFF68(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 7364980 && v1 == 0xE300000000000000)
    v2 = 1;
  else
    v2 = sub_248AF5D68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_248AF007C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_248AF00B0()
{
  sub_248AF5A98();
  return swift_bridgeObjectRelease();
}

void sub_248AF0164(uint64_t a1, char a2)
{
  sub_248AF5D98();
  __asm { BR              X10 }
}

uint64_t sub_248AF01A4()
{
  sub_248AF5A98();
  swift_bridgeObjectRelease();
  return sub_248AF5DB0();
}

uint64_t sub_248AF026C(unsigned __int8 a1)
{
  return ((uint64_t (*)(_QWORD, unint64_t))((char *)sub_248AF0294 + 4 * byte_248AF7F3C[a1]))(0, 0xE000000000000000);
}

uint64_t sub_248AF0294()
{
  return 7364980;
}

uint64_t sub_248AF02A4()
{
  return 0x646E616863756F74;
}

uint64_t sub_248AF02C4()
{
  return 1734439524;
}

uint64_t sub_248AF02D4()
{
  return 0x7A6F7468636E6970;
}

uint64_t sub_248AF02F4()
{
  return 0x65747463656C6573;
}

uint64_t sub_248AF0310()
{
  return 0x6F6D7463656C6573;
}

uint64_t TryItAttemptAnalyticsEvent.__allocating_init(tipId:correlationId:collectionId:lessonId:error:success:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v17;
  uint64_t v18;

  v17 = swift_allocObject();
  if (a10)
    v18 = a9;
  else
    v18 = 0;
  *(_QWORD *)(v17 + 96) = v18;
  *(_QWORD *)(v17 + 104) = a10;
  *(_BYTE *)(v17 + 112) = a11;
  return TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x8000000248AF8AA0, a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_248AF03F0(char *a1)
{
  sub_248AEFE70(*a1);
}

void sub_248AF03FC()
{
  char *v0;

  sub_248AF0164(0, *v0);
}

void sub_248AF0408(uint64_t a1)
{
  char *v1;

  sub_248AF007C(a1, *v1);
}

void sub_248AF0410(uint64_t a1)
{
  char *v1;

  sub_248AF0164(a1, *v1);
}

uint64_t sub_248AF0418@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_248AF0BC4();
  *a1 = result;
  return result;
}

uint64_t sub_248AF0444@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_248AF026C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t TryItAttemptAnalyticsEvent.init(tipId:correlationId:collectionId:lessonId:error:success:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v11;

  if (!a10)
    a9 = 0;
  *(_QWORD *)(v11 + 96) = a9;
  *(_QWORD *)(v11 + 104) = a10;
  *(_BYTE *)(v11 + 112) = a11;
  return TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x8000000248AF8AA0, a1, a2, a3, a4, a5, a6, a7, a8);
}

unint64_t sub_248AF04C4()
{
  unint64_t v0;
  uint64_t v1;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v0 = sub_248ACC4D4();
  swift_bridgeObjectRetain();
  v1 = sub_248AF5A38();
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v1, 0x726F727265, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  v3 = sub_248AF5B4C();
  v4 = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v3, 0x73736563637573, 0xE700000000000000, v4);
  swift_bridgeObjectRelease();
  sub_248AF0608();
  v5 = sub_248AF5B4C();
  v6 = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v5, 0x72745F7473726966, 0xE900000000000079, v6);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_248AF0608()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _OWORD v8[2];

  if (*(_QWORD *)(v0 + 88))
  {
    v1 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_248AF5A38();
    v3 = objc_msgSend(v1, sel_persistedObjectForKey_, v2);

    if (!v3)
    {
      memset(v8, 0, sizeof(v8));
      sub_248AF09E0((uint64_t)v8);
      v4 = 1;
      v5 = (void *)sub_248AF5B4C();
      v6 = (void *)sub_248AF5A38();
      swift_bridgeObjectRelease();
      objc_msgSend(v1, sel_persistObject_forKey_, v5, v6);

      return v4;
    }
    sub_248AF5C78();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    sub_248AF09E0((uint64_t)v8);
  }
  return 0;
}

void TryItAttemptAnalyticsEvent.__allocating_init(identifier:tipId:correlationId:collectionId:lessonId:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void TryItAttemptAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_248AF0774()
{
  return swift_bridgeObjectRelease();
}

uint64_t TryItAttemptAnalyticsEvent.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TryItAttemptAnalyticsEvent.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TryItAttemptAnalyticsEvent()
{
  return objc_opt_self();
}

uint64_t method lookup function for TryItAttemptAnalyticsEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TryItAttemptAnalyticsEvent.__allocating_init(tipId:correlationId:collectionId:lessonId:error:success:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 320))();
}

_QWORD *initializeBufferWithCopyOfBuffer for TryItAttemptAnalyticsEvent.ErrorState(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TryItAttemptAnalyticsEvent.ErrorState()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for TryItAttemptAnalyticsEvent.ErrorState(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for TryItAttemptAnalyticsEvent.ErrorState(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TryItAttemptAnalyticsEvent.ErrorState(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TryItAttemptAnalyticsEvent.ErrorState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
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

uint64_t sub_248AF0998(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_248AF09B0(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for TryItAttemptAnalyticsEvent.ErrorState()
{
  return &type metadata for TryItAttemptAnalyticsEvent.ErrorState;
}

uint64_t sub_248AF09E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3428);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for TryItLessonStepId(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TryItLessonStepId(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_248AF0AFC + 4 * byte_248AF7F48[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_248AF0B30 + 4 * byte_248AF7F43[v4]))();
}

uint64_t sub_248AF0B30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_248AF0B38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x248AF0B40);
  return result;
}

uint64_t sub_248AF0B4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x248AF0B54);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_248AF0B58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248AF0B60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TryItLessonStepId()
{
  return &type metadata for TryItLessonStepId;
}

unint64_t sub_248AF0B80()
{
  unint64_t result;

  result = qword_2577B3430;
  if (!qword_2577B3430)
  {
    result = MEMORY[0x2495A57B0](&unk_248AF802C, &type metadata for TryItLessonStepId);
    atomic_store(result, (unint64_t *)&qword_2577B3430);
  }
  return result;
}

uint64_t sub_248AF0BC4()
{
  unint64_t v0;

  v0 = sub_248AF5D44();
  swift_bridgeObjectRelease();
  if (v0 >= 7)
    return 7;
  else
    return v0;
}

uint64_t sub_248AF0C10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD aBlock[6];

  v3 = sub_248AF599C();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_248AF59C0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = *(_QWORD *)(v1 + 16);
  aBlock[4] = sub_248AF10D0;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_248ADFE80;
  aBlock[3] = &block_descriptor_4;
  v12 = _Block_copy(aBlock);
  swift_retain();
  sub_248AF59A8();
  v14[1] = MEMORY[0x24BEE4AF8];
  sub_248AB80A8((unint64_t *)&unk_2577B14A0, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B11E0);
  sub_248AF1720(&qword_2577B14B0, &qword_2577B11E0);
  sub_248AF5C84();
  MEMORY[0x2495A524C](0, v11, v7, v12);
  _Block_release(v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

void sub_248AF0DDC(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t aBlock;
  unint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  uint64_t (*v13)();
  uint64_t v14;

  if (qword_2577B10E0 != -1)
    swift_once();
  v2 = (id)qword_2577B3508;
  sub_248AF5C9C();
  swift_bridgeObjectRelease();
  aBlock = 0xD000000000000018;
  v10 = 0x8000000248AF9560;
  swift_bridgeObjectRetain();
  sub_248AF5AB0();
  swift_bridgeObjectRelease();
  v3 = sub_248AF5AB0();
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 248))(v3);
  sub_248AB8A24(0, &qword_2577B34E0);
  sub_248AF5A08();
  sub_248AF5AB0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = sub_248AF5BB8();
  if (os_log_type_enabled(v2, v4))
  {
    swift_bridgeObjectRetain_n();
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    aBlock = v6;
    *(_DWORD *)v5 = 136315138;
    swift_bridgeObjectRetain();
    sub_248AF3998(0xD000000000000018, 0x8000000248AF9560, &aBlock);
    sub_248AF5C54();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_248AB5000, v2, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A581C](v6, -1, -1);
    MEMORY[0x2495A581C](v5, -1, -1);
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v7 = (void *)sub_248AF5A38();
  swift_bridgeObjectRelease();
  v13 = sub_248AF1714;
  v14 = a1;
  aBlock = MEMORY[0x24BDAC760];
  v10 = 1107296256;
  v11 = sub_248AF10D8;
  v12 = &block_descriptor_3;
  v8 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v8);

}

void sub_248AF10D0()
{
  uint64_t v0;

  sub_248AF0DDC(v0);
}

id sub_248AF10D8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_248AB8A24(0, &qword_2577B34E0);
    v4 = (void *)sub_248AF59F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t TryItAnalyticsManager.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t TryItAnalyticsManager.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TryItAnalyticsManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for TryItAnalyticsManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TryItAnalyticsManager.log(event:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t destroy for TryItAnalyticsLessonKeys()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TryItAnalyticsLessonKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_WORD *)(a1 + 92) = *(_WORD *)(a2 + 92);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TryItAnalyticsLessonKeys(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(_BYTE *)(a1 + 90) = *(_BYTE *)(a2 + 90);
  *(_BYTE *)(a1 + 91) = *(_BYTE *)(a2 + 91);
  *(_BYTE *)(a1 + 92) = *(_BYTE *)(a2 + 92);
  *(_BYTE *)(a1 + 93) = *(_BYTE *)(a2 + 93);
  return a1;
}

__n128 __swift_memcpy94_8(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)(a1 + 78) = *(_OWORD *)(a2 + 78);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for TryItAnalyticsLessonKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(_BYTE *)(a1 + 90) = *(_BYTE *)(a2 + 90);
  *(_BYTE *)(a1 + 91) = *(_BYTE *)(a2 + 91);
  *(_BYTE *)(a1 + 92) = *(_BYTE *)(a2 + 92);
  *(_BYTE *)(a1 + 93) = *(_BYTE *)(a2 + 93);
  return a1;
}

uint64_t getEnumTagSinglePayload for TryItAnalyticsLessonKeys(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 94))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TryItAnalyticsLessonKeys(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 92) = 0;
    *(_DWORD *)(result + 88) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 94) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 94) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for TryItAnalyticsLessonKeys()
{
  return &type metadata for TryItAnalyticsLessonKeys;
}

uint64_t sub_248AF1540()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v0 = sub_248AF5C00();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_248AF5BE8();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_248AF59C0();
  MEMORY[0x24BDAC7A8](v6);
  sub_248AB8A24(0, (unint64_t *)&qword_2577B11D8);
  sub_248AF59B4();
  v10[1] = MEMORY[0x24BEE4AF8];
  sub_248AB80A8(&qword_2577B34E8, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B34F0);
  sub_248AF1720(&qword_2577B34F8, &qword_2577B34F0);
  sub_248AF5C84();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  v7 = sub_248AF5C24();
  v8 = v10[0];
  *(_QWORD *)(v10[0] + 16) = v7;
  return v8;
}

uint64_t sub_248AF1714()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t sub_248AF1720(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

Swift::Void __swiftcall TryItLog.log(_:)(Swift::String a1)
{
  sub_248AF17A4(a1._countAndFlagsBits, (unint64_t)a1._object, MEMORY[0x24BEE7928]);
}

Swift::Void __swiftcall TryItLog.debug(_:)(Swift::String a1)
{
  sub_248AF17A4(a1._countAndFlagsBits, (unint64_t)a1._object, MEMORY[0x24BEE7908]);
}

Swift::Void __swiftcall TryItLog.info(_:)(Swift::String a1)
{
  sub_248AF17A4(a1._countAndFlagsBits, (unint64_t)a1._object, MEMORY[0x24BEE78F0]);
}

Swift::Void __swiftcall TryItLog.error(_:)(Swift::String a1)
{
  sub_248AF17A4(a1._countAndFlagsBits, (unint64_t)a1._object, MEMORY[0x24BEE7910]);
}

Swift::Void __swiftcall TryItLog.fault(_:)(Swift::String a1)
{
  sub_248AF17A4(a1._countAndFlagsBits, (unint64_t)a1._object, MEMORY[0x24BEE7920]);
}

uint64_t sub_248AF17A4(uint64_t a1, unint64_t a2, uint64_t (*a3)(void))
{
  NSObject **v3;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t result;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *v3;
  v7 = a3();
  result = os_log_type_enabled(v6, v7);
  if ((_DWORD)result)
  {
    swift_bridgeObjectRetain_n();
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v11 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_248AF3998(a1, a2, &v11);
    sub_248AF5C54();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_248AB5000, v6, v7, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A581C](v10, -1, -1);
    return MEMORY[0x2495A581C](v9, -1, -1);
  }
  return result;
}

uint64_t sub_248AF18E4(uint64_t a1)
{
  return sub_248AF1944(a1, 0x746C7561666544, 0xE700000000000000, &qword_2577B3500);
}

id static TryItLog.default.getter@<X0>(void **a1@<X8>)
{
  return sub_248AF19C4(&qword_2577B10D8, (void **)&qword_2577B3500, a1);
}

uint64_t sub_248AF1920(uint64_t a1)
{
  return sub_248AF1944(a1, 0x636974796C616E41, 0xE900000000000073, &qword_2577B3508);
}

uint64_t sub_248AF1944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result;

  sub_248AF1A14();
  result = sub_248AF5C3C();
  *a4 = result;
  return result;
}

id static TryItLog.analytics.getter@<X0>(void **a1@<X8>)
{
  return sub_248AF19C4(&qword_2577B10E0, (void **)&qword_2577B3508, a1);
}

id sub_248AF19C4@<X0>(_QWORD *a1@<X0>, void **a2@<X1>, void **a3@<X8>)
{
  void *v5;

  if (*a1 != -1)
    swift_once();
  v5 = *a2;
  *a3 = *a2;
  return v5;
}

ValueMetadata *type metadata accessor for TryItLog()
{
  return &type metadata for TryItLog;
}

unint64_t sub_248AF1A14()
{
  unint64_t result;

  result = qword_2577B3510;
  if (!qword_2577B3510)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2577B3510);
  }
  return result;
}

id sub_248AF1A50(void *a1, uint64_t a2)
{
  objc_msgSend(a1, sel_addSublayer_, a2);
  return objc_msgSend(a1, sel_setNeedsDisplay);
}

void sub_248AF1A88()
{
  qword_2577B3518 = 0x6E6F7373656CLL;
  unk_2577B3520 = 0xE600000000000000;
}

uint64_t TryItLauncher.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t TryItLauncher.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TryItLauncher()
{
  return objc_opt_self();
}

uint64_t method lookup function for TryItLauncher()
{
  return swift_lookUpClassMethod();
}

_QWORD *sub_248AF1AEC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577B35D0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_248AF2AD8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_248AF1BF8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577B35F0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_248AF2AD8(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_248AF1D04(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B35E0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_248AF1D68(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_248AF5AF8();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2495A5108](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unsigned __int8 *sub_248AF1DE0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v5 = sub_248AF5B04();
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
  v5 = sub_248AF2140();
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
    v7 = (unsigned __int8 *)sub_248AF5CB4();
  }
LABEL_7:
  v11 = sub_248AF1EC4(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_248AF1EC4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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

uint64_t sub_248AF2140()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_248AF5B10();
  v4 = sub_248AF21BC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_248AF21BC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_248AF2300(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_248AF1D04(v9, 0);
      v12 = sub_248AF23EC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x2495A50C0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x2495A50C0);
LABEL_9:
      sub_248AF5CB4();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2495A50C0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_248AF2300(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_248AF1D68(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_248AF1D68(a2, a3, a4);
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
    return sub_248AF5AE0();
  }
  __break(1u);
  return result;
}

unint64_t sub_248AF23EC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_248AF1D68(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_248AF5AEC();
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
          result = sub_248AF5CB4();
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
    result = sub_248AF1D68(v12, a6, a7);
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
    v12 = sub_248AF5AC8();
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

uint64_t sub_248AF25FC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_248AF279C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_248AF2618(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_248AF28F8(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_248AF2634(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B1190);
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
  result = sub_248AF5D2C();
  __break(1u);
  return result;
}

uint64_t sub_248AF279C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B35D8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_248AF5D2C();
  __break(1u);
  return result;
}

uint64_t sub_248AF28F8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B35E8);
  v10 = *(_QWORD *)(sub_248AF4DE4() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_248AF4DE4() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_248AF5D2C();
  __break(1u);
  return result;
}

char *sub_248AF2AD8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_248AF5D2C();
  __break(1u);
  return result;
}

_QWORD *sub_248AF2BC0(uint64_t a1)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t countAndFlagsBits;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned __int8 *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  unsigned __int8 *v53;
  unsigned int v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char *v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  unsigned __int8 *v63;
  unsigned int v64;
  uint64_t v65;
  char v66;
  id v67;
  Swift::String v68;
  id v70;
  int64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  Swift::String v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  unint64_t v88;
  Swift::String v89;

  v84 = sub_248AF4DE4();
  v2 = *(_QWORD *)(v84 - 8);
  v3 = MEMORY[0x24BDAC7A8](v84);
  v86 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v78 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B35C0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B35C8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_248AF4E08();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AF4DFC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_248AB89E8((uint64_t)v12, &qword_2577B35C8);
    goto LABEL_94;
  }
  v81 = v9;
  v82 = a1;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  v83 = v16;
  v17 = sub_248AF4DF0();
  if (!v17)
  {
LABEL_93:
    (*(void (**)(char *, uint64_t))(v14 + 8))(v83, v13);
LABEL_94:
    if (qword_2577B10D8 != -1)
      goto LABEL_109;
    goto LABEL_95;
  }
  v18 = v17;
  v19 = MEMORY[0x24BEE4AF8];
  v89._countAndFlagsBits = MEMORY[0x24BEE4AF8];
  v85 = *(char **)(v17 + 16);
  v79 = v14;
  v80 = v13;
  if (!v85)
  {
    v21 = v84;
LABEL_25:
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v19 + 16))
    {
      v34 = (uint64_t)v81;
      (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v81, v19 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80)), v21);
      v35 = 0;
    }
    else
    {
      v35 = 1;
      v34 = (uint64_t)v81;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v34, v35, 1, v21);
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v34, 1, v21) == 1)
    {
      sub_248AB89E8(v34, &qword_2577B35C0);
      goto LABEL_93;
    }
    v36 = sub_248AF4DD8();
    v38 = v37;
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v34, v21);
    if (!v38)
      goto LABEL_93;
    v89._countAndFlagsBits = v36;
    v89._object = v38;
    v87 = 44;
    v88 = 0xE100000000000000;
    sub_248ABDD1C();
    v39 = sub_248AF5C6C();
    swift_bridgeObjectRelease();
    v40 = *(_QWORD *)(v39 + 16);
    if (!v40)
    {
      swift_bridgeObjectRelease();
      v42 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_99:
      if (qword_2577B10D8 != -1)
LABEL_112:
        swift_once();
      v89._countAndFlagsBits = 0;
      v89._object = (void *)0xE000000000000000;
      v70 = (id)qword_2577B3500;
      sub_248AF5C9C();
      swift_bridgeObjectRelease();
      v89._countAndFlagsBits = 0xD00000000000001DLL;
      v89._object = (void *)0x8000000248AF95F0;
      v71 = v42[2];
      v72 = MEMORY[0x24BEE4AF8];
      if (v71)
      {
        v87 = MEMORY[0x24BEE4AF8];
        swift_bridgeObjectRetain();
        sub_248AF25FC(0, v71, 0);
        v73 = 0;
        v72 = v87;
        v74 = *(_QWORD *)(v87 + 16);
        do
        {
          v75 = v42[v73 + 4];
          v87 = v72;
          v76 = *(_QWORD *)(v72 + 24);
          if (v74 >= v76 >> 1)
          {
            sub_248AF25FC(v76 > 1, v74 + 1, 1);
            v72 = v87;
          }
          ++v73;
          *(_QWORD *)(v72 + 16) = v74 + 1;
          *(_QWORD *)(v72 + 8 * v74++ + 32) = v75;
        }
        while (v71 != v73);
        swift_bridgeObjectRelease();
      }
      MEMORY[0x2495A515C](v72, MEMORY[0x24BEE1768]);
      sub_248AF5AB0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v77 = v89;
      v89._countAndFlagsBits = (uint64_t)v70;
      TryItLog.debug(_:)(v77);

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v79 + 8))(v83, v80);
      return v42;
    }
    v41 = 0;
    v85 = (char *)&v89._countAndFlagsBits + 2;
    v86 = (char *)&v89._countAndFlagsBits + 3;
    v42 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      if (v41 >= *(_QWORD *)(v39 + 16))
        goto LABEL_108;
      v43 = (uint64_t *)(v39 + 32 + 16 * v41);
      v44 = *v43;
      v45 = v43[1];
      v46 = HIBYTE(v45) & 0xF;
      v47 = v44 & 0xFFFFFFFFFFFFLL;
      if ((v45 & 0x2000000000000000) != 0 ? HIBYTE(v45) & 0xF : v44 & 0xFFFFFFFFFFFFLL)
        break;
LABEL_34:
      if (++v41 == v40)
      {
        swift_bridgeObjectRelease();
        goto LABEL_99;
      }
    }
    if ((v45 & 0x1000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v50 = (uint64_t)sub_248AF1DE0(v44, v45, 10);
      LOBYTE(v44) = v66;
      swift_bridgeObjectRelease();
      goto LABEL_69;
    }
    if ((v45 & 0x2000000000000000) == 0)
    {
      if ((v44 & 0x1000000000000000) != 0)
        v49 = (unsigned __int8 *)((v45 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v49 = (unsigned __int8 *)sub_248AF5CB4();
      v50 = (uint64_t)sub_248AF1EC4(v49, v47, 10);
      LOBYTE(v44) = v51 & 1;
LABEL_69:
      if ((v44 & 1) == 0 && (unint64_t)v50 < 6)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v42 = sub_248AF1AEC(0, v42[2] + 1, 1, v42);
        v57 = v42[2];
        v56 = v42[3];
        if (v57 >= v56 >> 1)
          v42 = sub_248AF1AEC((_QWORD *)(v56 > 1), v57 + 1, 1, v42);
        v42[2] = v57 + 1;
        v42[v57 + 4] = v50;
      }
      goto LABEL_34;
    }
    v89._countAndFlagsBits = v44;
    v89._object = (void *)(v45 & 0xFFFFFFFFFFFFFFLL);
    if (v44 == 43)
    {
      if (!v46)
        goto LABEL_111;
      if (v46 == 1 || (BYTE1(v44) - 48) > 9u)
        goto LABEL_66;
      v50 = (BYTE1(v44) - 48);
      if (v46 == 2)
        goto LABEL_68;
      if ((BYTE2(v44) - 48) <= 9u)
      {
        v50 = 10 * (BYTE1(v44) - 48) + (BYTE2(v44) - 48);
        v52 = v46 - 3;
        if (v52)
        {
          v53 = (unsigned __int8 *)v86;
          while (1)
          {
            v54 = *v53 - 48;
            if (v54 > 9)
              goto LABEL_66;
            v55 = 10 * v50;
            if ((unsigned __int128)(v50 * (__int128)10) >> 64 != (10 * v50) >> 63)
              goto LABEL_66;
            v50 = v55 + v54;
            if (__OFADD__(v55, v54))
              goto LABEL_66;
            LOBYTE(v44) = 0;
            ++v53;
            if (!--v52)
              goto LABEL_69;
          }
        }
        goto LABEL_68;
      }
    }
    else if (v44 == 45)
    {
      if (!v46)
      {
        __break(1u);
LABEL_111:
        __break(1u);
        goto LABEL_112;
      }
      if (v46 != 1 && (BYTE1(v44) - 48) <= 9u)
      {
        if (v46 == 2)
        {
          LOBYTE(v44) = 0;
          v50 = -(uint64_t)(BYTE1(v44) - 48);
          goto LABEL_69;
        }
        if ((BYTE2(v44) - 48) <= 9u)
        {
          v50 = -10 * (BYTE1(v44) - 48) - (BYTE2(v44) - 48);
          v62 = v46 - 3;
          if (v62)
          {
            v63 = (unsigned __int8 *)v86;
            while (1)
            {
              v64 = *v63 - 48;
              if (v64 > 9)
                goto LABEL_66;
              v65 = 10 * v50;
              if ((unsigned __int128)(v50 * (__int128)10) >> 64 != (10 * v50) >> 63)
                goto LABEL_66;
              v50 = v65 - v64;
              if (__OFSUB__(v65, v64))
                goto LABEL_66;
              LOBYTE(v44) = 0;
              ++v63;
              if (!--v62)
                goto LABEL_69;
            }
          }
LABEL_68:
          LOBYTE(v44) = 0;
          goto LABEL_69;
        }
      }
    }
    else if (v46 && (v44 - 48) <= 9u)
    {
      v50 = (v44 - 48);
      if (v46 == 1)
        goto LABEL_68;
      if ((BYTE1(v44) - 48) <= 9u)
      {
        v50 = 10 * (v44 - 48) + (BYTE1(v44) - 48);
        v58 = v46 - 2;
        if (v58)
        {
          v59 = v85;
          while (1)
          {
            v60 = *v59 - 48;
            if (v60 > 9)
              goto LABEL_66;
            v61 = 10 * v50;
            if ((unsigned __int128)(v50 * (__int128)10) >> 64 != (10 * v50) >> 63)
              goto LABEL_66;
            v50 = v61 + v60;
            if (__OFADD__(v61, v60))
              goto LABEL_66;
            LOBYTE(v44) = 0;
            ++v59;
            if (!--v58)
              goto LABEL_69;
          }
        }
        goto LABEL_68;
      }
    }
LABEL_66:
    v50 = 0;
    LOBYTE(v44) = 1;
    goto LABEL_69;
  }
  v20 = 0;
  v21 = v84;
  while (v20 < *(_QWORD *)(v18 + 16))
  {
    v22 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
    v23 = *(_QWORD *)(v2 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v6, v18 + v22 + v23 * v20, v21);
    v24 = sub_248AF4DCC();
    v26 = v25;
    if (qword_2577B10E8 != -1)
      swift_once();
    if (v24 == qword_2577B3518 && v26 == unk_2577B3520)
    {
      swift_bridgeObjectRelease();
LABEL_18:
      v29 = *(void (**)(char *, char *, uint64_t))(v2 + 32);
      v29(v86, v6, v21);
      countAndFlagsBits = v89._countAndFlagsBits;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_248AF2618(0, *(_QWORD *)(countAndFlagsBits + 16) + 1, 1);
        countAndFlagsBits = v89._countAndFlagsBits;
      }
      v32 = *(_QWORD *)(countAndFlagsBits + 16);
      v31 = *(_QWORD *)(countAndFlagsBits + 24);
      if (v32 >= v31 >> 1)
      {
        sub_248AF2618(v31 > 1, v32 + 1, 1);
        countAndFlagsBits = v89._countAndFlagsBits;
      }
      *(_QWORD *)(countAndFlagsBits + 16) = v32 + 1;
      v33 = countAndFlagsBits + v22 + v32 * v23;
      v21 = v84;
      v29((char *)v33, v86, v84);
      v89._countAndFlagsBits = countAndFlagsBits;
      goto LABEL_7;
    }
    v28 = sub_248AF5D68();
    swift_bridgeObjectRelease();
    if ((v28 & 1) != 0)
      goto LABEL_18;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v21);
LABEL_7:
    if (v85 == (char *)++v20)
    {
      v19 = v89._countAndFlagsBits;
      v14 = v79;
      v13 = v80;
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_108:
  __break(1u);
LABEL_109:
  swift_once();
LABEL_95:
  v89._countAndFlagsBits = 0;
  v89._object = (void *)0xE000000000000000;
  v67 = (id)qword_2577B3500;
  sub_248AF5C9C();
  swift_bridgeObjectRelease();
  v89._countAndFlagsBits = 0xD00000000000002DLL;
  v89._object = (void *)0x8000000248AF95C0;
  sub_248AF4E50();
  sub_248AF5AB0();
  swift_bridgeObjectRelease();
  v68 = v89;
  v89._countAndFlagsBits = (uint64_t)v67;
  TryItLog.debug(_:)(v68);

  swift_bridgeObjectRelease();
  return (_QWORD *)MEMORY[0x24BEE4AF8];
}

double static CGFloat.flowerAssetCompactWidth.getter()
{
  return 80.0;
}

double static CGFloat.flowerAssetWidth.getter()
{
  return 120.0;
}

double static CGFloat.flowerAssetCompactHeight.getter()
{
  return 92.0;
}

double static CGFloat.flowerAssetHeight.getter()
{
  return 138.0;
}

double static CGFloat.horizontalButtonPadding.getter()
{
  return 12.0;
}

double static CGFloat.horizontalTextPadding.getter()
{
  return 20.0;
}

double static CGFloat.defaultHyphenationFactor.getter()
{
  return 0.2;
}

double static CGFloat.dragCellWidth.getter()
{
  return 353.0;
}

double static CGFloat.dragCellHeight.getter()
{
  return 110.0;
}

double static CGFloat.imageGridWidth.getter()
{
  return 333.0;
}

double static CGFloat.imageGridHeight.getter()
{
  return 333.0;
}

double static CGFloat.imageWidth.getter()
{
  return 103.0;
}

double static CGFloat.imageGridSpacing.getter()
{
  return 12.0;
}

double static CGFloat.preferredContentSizeHeight.getter()
{
  return 746.0;
}

double static CGFloat.practiceAgainMinimumCompactBottomPadding.getter()
{
  return 50.0;
}

double static CGFloat.practiceAgainMinimumBottomPadding.getter()
{
  return 70.0;
}

double static CGFloat.touchAccommodationsButtonPadding.getter()
{
  return 27.0;
}

double static CGFloat.touchAccommodationsCompactHeightPadding.getter()
{
  return 60.0;
}

double static CGFloat.touchAccommodationsHeightPadding.getter()
{
  return 50.0;
}

double static CGFloat.touchAccommodationsHorizontalCompactPadding.getter()
{
  return 30.0;
}

double static CGFloat.touchAccommodationsHorizontalPadding.getter()
{
  return 60.0;
}

double static CGFloat.verticalButtonPadding.getter()
{
  return 8.0;
}

double static CGFloat.preferredCompactContentSizeWidth.getter()
{
  return 644.0;
}

double static CGFloat.preferredCompactContentSizeHeight.getter()
{
  return 656.0;
}

double static CGFloat.preferredContentSizeWidth.getter()
{
  return 704.0;
}

double static CGFloat.dragCellCornerRadius.getter()
{
  return 16.0;
}

double static CGFloat.dragCellScaleDragging.getter()
{
  return 1.03;
}

double static CGFloat.closeButtonTrailingPadding.getter()
{
  return 18.0;
}

double static CGFloat.imageHeight.getter()
{
  return 103.0;
}

double static CGFloat.touchAccommodationsCompactOffset.getter()
{
  return 60.0;
}

double static CGFloat.touchAccommodationsOffset.getter()
{
  return 50.0;
}

uint64_t tryItLogError(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_248AF378C(a1, a2, a3, MEMORY[0x24BEE7910]);
}

uint64_t tryItLog(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_248AF378C(a1, a2, a3, MEMORY[0x24BEE7928]);
}

uint64_t tryItLogDebug(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_248AF378C(a1, a2, a3, MEMORY[0x24BEE7908]);
}

uint64_t tryItLog(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_248AF38D8(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x24BEE7928]);
}

uint64_t tryItLogDebug(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_248AF38D8(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x24BEE7908]);
}

uint64_t tryItLogInfo(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_248AF378C(a1, a2, a3, MEMORY[0x24BEE78F0]);
}

uint64_t tryItLogInfo(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_248AF38D8(a1, a2, a3, a4, a5, MEMORY[0x24BEE78F0]);
}

uint64_t tryItLogError(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_248AF38D8(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x24BEE7910]);
}

uint64_t tryItLogFault(_:_:)(NSObject **a1, uint64_t a2, unint64_t a3)
{
  return sub_248AF378C(a1, a2, a3, MEMORY[0x24BEE7920]);
}

uint64_t sub_248AF378C(NSObject **a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  NSObject *v6;
  os_log_type_t v7;
  uint64_t result;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *a1;
  v7 = a4();
  result = os_log_type_enabled(v6, v7);
  if ((_DWORD)result)
  {
    swift_bridgeObjectRetain_n();
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v11 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_248AF3998(a2, a3, &v11);
    sub_248AF5C54();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_248AB5000, v6, v7, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A581C](v10, -1, -1);
    return MEMORY[0x2495A581C](v9, -1, -1);
  }
  return result;
}

uint64_t tryItLogFault(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_248AF38D8(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x24BEE7920]);
}

uint64_t sub_248AF38D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  uint64_t v7;

  a6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577B35F8);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_248AF6EC0;
  *(_QWORD *)(v7 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2577B3600);
  *(_QWORD *)(v7 + 64) = sub_248AF3F74();
  *(_QWORD *)(v7 + 32) = a5;
  swift_bridgeObjectRetain();
  sub_248AF4F7C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_248AF3998(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_248AF3A68(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_248AF3FE0((uint64_t)v12, *a3);
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
      sub_248AF3FE0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_248AF3A68(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_248AF5C60();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_248AF3C20(a5, a6);
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
  v8 = sub_248AF5CB4();
  if (!v8)
  {
    sub_248AF5CF0();
    __break(1u);
LABEL_17:
    result = sub_248AF5D2C();
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

uint64_t sub_248AF3C20(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_248AF3CB4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_248AF3E28(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_248AF3E28(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_248AF3CB4(uint64_t a1, unint64_t a2)
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
      v3 = sub_248AF1D04(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_248AF5CA8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_248AF5CF0();
      __break(1u);
LABEL_10:
      v2 = sub_248AF5ABC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_248AF5D2C();
    __break(1u);
LABEL_14:
    result = sub_248AF5CF0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_248AF3E28(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577B35E0);
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
  result = sub_248AF5D2C();
  __break(1u);
  return result;
}

unint64_t sub_248AF3F74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577B3608;
  if (!qword_2577B3608)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577B3600);
    result = MEMORY[0x2495A57B0](MEMORY[0x24BDCFBF8], v1);
    atomic_store(result, (unint64_t *)&qword_2577B3608);
  }
  return result;
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

uint64_t sub_248AF3FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_248AF401C()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  v2 = objc_allocWithZone((Class)type metadata accessor for ActivityItemController());
  return sub_248AF4154(v1);
}

uint64_t sub_248AF4058()
{
  return sub_248AF54A4();
}

uint64_t sub_248AF4090()
{
  sub_248AF4894();
  return sub_248AF54E0();
}

uint64_t sub_248AF40E0()
{
  sub_248AF4894();
  return sub_248AF54B0();
}

void sub_248AF4130()
{
  sub_248AF4894();
  sub_248AF54D4();
  __break(1u);
}

id sub_248AF4154(void *a1)
{
  void *v1;
  objc_class *v3;
  char *v4;
  char *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  objc_super v15;
  objc_super v16;

  v3 = (objc_class *)type metadata accessor for UIImageActivityType();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtC9TipsTryIt19UIImageActivityType_image] = a1;
  v16.receiver = v4;
  v16.super_class = v3;
  v5 = v1;
  v6 = a1;
  v7 = objc_msgSendSuper2(&v16, sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577B36F0);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_248AF6EC0;
  *(_QWORD *)(v8 + 56) = v3;
  *(_QWORD *)(v8 + 32) = v7;
  v9 = objc_allocWithZone(MEMORY[0x24BDF67E0]);
  v10 = v7;
  v11 = (void *)sub_248AF5B1C();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v9, sel_initWithActivityItems_applicationActivities_, v11, 0);

  *(_QWORD *)&v5[OBJC_IVAR____TtC9TipsTryIt22ActivityItemController_hostingController] = v12;
  v15.receiver = v5;
  v15.super_class = (Class)type metadata accessor for ActivityItemController();
  v13 = objc_msgSendSuper2(&v15, sel_initWithNibName_bundle_, 0, 0);

  return v13;
}

void sub_248AF42EC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  objc_super v31;

  v1 = v0;
  v31.receiver = v0;
  v31.super_class = (Class)type metadata accessor for ActivityItemController();
  objc_msgSendSuper2(&v31, sel_loadView);
  v2 = OBJC_IVAR____TtC9TipsTryIt22ActivityItemController_hostingController;
  v3 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9TipsTryIt22ActivityItemController_hostingController], sel_view);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v0, sel_addChildViewController_, *(_QWORD *)&v0[v2]);
    v5 = objc_msgSend(v0, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_addSubview_, v4);

      objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      v7 = objc_msgSend(v1, sel_view);
      if (v7)
      {
        v8 = v7;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577B36D0);
        v9 = swift_allocObject();
        *(_OWORD *)(v9 + 16) = xmmword_248AF78F0;
        v10 = objc_msgSend(v4, sel_leadingAnchor);
        v11 = objc_msgSend(v1, sel_view);
        if (v11)
        {
          v12 = v11;
          v13 = objc_msgSend(v11, sel_leadingAnchor);

          v14 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v13);
          *(_QWORD *)(v9 + 32) = v14;
          v15 = objc_msgSend(v4, sel_topAnchor);
          v16 = objc_msgSend(v1, sel_view);
          if (v16)
          {
            v17 = v16;
            v18 = objc_msgSend(v16, sel_topAnchor);

            v19 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v18);
            *(_QWORD *)(v9 + 40) = v19;
            v20 = objc_msgSend(v4, sel_trailingAnchor);
            v21 = objc_msgSend(v1, sel_view);
            if (v21)
            {
              v22 = v21;
              v23 = objc_msgSend(v21, sel_trailingAnchor);

              v24 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v23);
              *(_QWORD *)(v9 + 48) = v24;
              v25 = objc_msgSend(v4, sel_bottomAnchor);
              v26 = objc_msgSend(v1, sel_view);
              if (v26)
              {
                v27 = v26;
                v28 = objc_msgSend(v26, sel_bottomAnchor);

                v29 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v28);
                *(_QWORD *)(v9 + 56) = v29;
                sub_248AF5B34();
                sub_248ADEE5C();
                v30 = (void *)sub_248AF5B1C();
                swift_bridgeObjectRelease();
                objc_msgSend(v8, sel_addConstraints_, v30);

                objc_msgSend(*(id *)&v1[v2], sel_didMoveToParentViewController_, v1);
                return;
              }
LABEL_15:
              __break(1u);
              return;
            }
LABEL_14:
            __break(1u);
            goto LABEL_15;
          }
LABEL_13:
          __break(1u);
          goto LABEL_14;
        }
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_12;
  }
}

id sub_248AF46D0()
{
  return sub_248AF4820(type metadata accessor for ActivityItemController);
}

uint64_t type metadata accessor for ActivityItemController()
{
  return objc_opt_self();
}

id sub_248AF4814()
{
  return sub_248AF4820(type metadata accessor for UIImageActivityType);
}

id sub_248AF4820(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for UIImageActivityType()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for ShareSheetView()
{
  return &type metadata for ShareSheetView;
}

unint64_t sub_248AF4894()
{
  unint64_t result;

  result = qword_2577B36E8;
  if (!qword_2577B36E8)
  {
    result = MEMORY[0x2495A57B0](&unk_248AF8134, &type metadata for ShareSheetView);
    atomic_store(result, (unint64_t *)&qword_2577B36E8);
  }
  return result;
}

uint64_t TryItSessionAnalyticsEvent.__allocating_init(tipId:correlationId:collectionId:lessonId:attempts:secondLessonAttempts:timeSpent:finishedLesson:finishedSecondLesson:replayed:linkTapped:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, char a11, char a12, char a13, char a14)
{
  uint64_t v18;

  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 96) = a9;
  *(_QWORD *)(v18 + 112) = a10;
  *(_BYTE *)(v18 + 120) = a11;
  *(_BYTE *)(v18 + 121) = a12;
  *(_BYTE *)(v18 + 122) = a13;
  *(_BYTE *)(v18 + 123) = a14;
  return TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x8000000248AF8BB0, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t TryItSessionAnalyticsEvent.init(tipId:correlationId:collectionId:lessonId:attempts:secondLessonAttempts:timeSpent:finishedLesson:finishedSecondLesson:replayed:linkTapped:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, char a11, char a12, char a13, char a14)
{
  uint64_t v14;

  *(_OWORD *)(v14 + 96) = a9;
  *(_QWORD *)(v14 + 112) = a10;
  *(_BYTE *)(v14 + 120) = a11;
  *(_BYTE *)(v14 + 121) = a12;
  *(_BYTE *)(v14 + 122) = a13;
  *(_BYTE *)(v14 + 123) = a14;
  return TryItAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)(0xD00000000000001CLL, 0x8000000248AF8BB0, a1, a2, a3, a4, a5, a6, a7, a8);
}

unint64_t sub_248AF4A1C()
{
  unint64_t v0;
  uint64_t v1;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;

  v0 = sub_248ACC4D4();
  v1 = sub_248AF5BAC();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v1, 0x7374706D65747461, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  v3 = sub_248AF5BAC();
  v4 = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v3, 0x7374706D65747461, 0xEB0000000032765FLL, v4);
  swift_bridgeObjectRelease();
  v5 = sub_248AF5BAC();
  v6 = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v5, 0x6570735F656D6974, 0xEA0000000000746ELL, v6);
  swift_bridgeObjectRelease();
  v7 = sub_248AF5B4C();
  v8 = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v7, 0x64656873696E6966, 0xEF6E6F7373656C5FLL, v8);
  swift_bridgeObjectRelease();
  v9 = sub_248AF5B4C();
  v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v9, 0xD000000000000012, 0x8000000248AF99A0, v10);
  swift_bridgeObjectRelease();
  v11 = sub_248AF5B4C();
  v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v11, 0x646579616C706572, 0xE800000000000000, v12);
  swift_bridgeObjectRelease();
  v13 = sub_248AF5B4C();
  v14 = swift_isUniquelyReferenced_nonNull_native();
  sub_248ACCE1C(v13, 0x7061745F6B6E696CLL, 0xEB00000000646570, v14);
  swift_bridgeObjectRelease();
  return v0;
}

void TryItSessionAnalyticsEvent.__allocating_init(identifier:tipId:correlationId:collectionId:lessonId:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void TryItSessionAnalyticsEvent.init(identifier:tipId:correlationId:collectionId:lessonId:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t TryItSessionAnalyticsEvent.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TryItSessionAnalyticsEvent.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TryItSessionAnalyticsEvent()
{
  return objc_opt_self();
}

uint64_t method lookup function for TryItSessionAnalyticsEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TryItSessionAnalyticsEvent.__allocating_init(tipId:correlationId:collectionId:lessonId:attempts:secondLessonAttempts:timeSpent:finishedLesson:finishedSecondLesson:replayed:linkTapped:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 480))();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_248AF4DCC()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_248AF4DD8()
{
  return MEMORY[0x24BDCB980]();
}

uint64_t sub_248AF4DE4()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_248AF4DF0()
{
  return MEMORY[0x24BDCBA58]();
}

uint64_t sub_248AF4DFC()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t sub_248AF4E08()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_248AF4E14()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_248AF4E20()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_248AF4E2C()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_248AF4E38()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_248AF4E44()
{
  return MEMORY[0x24BDCD3B0]();
}

uint64_t sub_248AF4E50()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_248AF4E5C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_248AF4E68()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_248AF4E74()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_248AF4E80()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_248AF4E8C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_248AF4E98()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_248AF4EA4()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_248AF4EB0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_248AF4EBC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_248AF4EC8()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_248AF4ED4()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_248AF4EE0()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_248AF4EEC()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_248AF4EF8()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_248AF4F04()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_248AF4F10()
{
  return MEMORY[0x24BDFBC60]();
}

uint64_t sub_248AF4F1C()
{
  return MEMORY[0x24BDFBCC8]();
}

uint64_t sub_248AF4F28()
{
  return MEMORY[0x24BDFBD08]();
}

uint64_t sub_248AF4F34()
{
  return MEMORY[0x24BDFBD10]();
}

uint64_t sub_248AF4F40()
{
  return MEMORY[0x24BDFBD20]();
}

uint64_t sub_248AF4F4C()
{
  return MEMORY[0x24BDFBD40]();
}

uint64_t sub_248AF4F58()
{
  return MEMORY[0x24BDFBD48]();
}

uint64_t sub_248AF4F64()
{
  return MEMORY[0x24BDFBD90]();
}

uint64_t sub_248AF4F70()
{
  return MEMORY[0x24BDFBD98]();
}

uint64_t sub_248AF4F7C()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_248AF4F88()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_248AF4F94()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_248AF4FA0()
{
  return MEMORY[0x24BDEB4C0]();
}

uint64_t sub_248AF4FAC()
{
  return MEMORY[0x24BDEB4D0]();
}

uint64_t sub_248AF4FB8()
{
  return MEMORY[0x24BDEB500]();
}

uint64_t sub_248AF4FC4()
{
  return MEMORY[0x24BDEB540]();
}

uint64_t sub_248AF4FD0()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_248AF4FDC()
{
  return MEMORY[0x24BDEB5B0]();
}

uint64_t sub_248AF4FE8()
{
  return MEMORY[0x24BDEB5B8]();
}

uint64_t sub_248AF4FF4()
{
  return MEMORY[0x24BDEBC10]();
}

uint64_t sub_248AF5000()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_248AF500C()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_248AF5018()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_248AF5024()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_248AF5030()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_248AF503C()
{
  return MEMORY[0x24BDEBEA8]();
}

uint64_t sub_248AF5048()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_248AF5054()
{
  return MEMORY[0x24BDEC110]();
}

uint64_t sub_248AF5060()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_248AF506C()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_248AF5078()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_248AF5084()
{
  return MEMORY[0x24BDEC158]();
}

uint64_t sub_248AF5090()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_248AF509C()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_248AF50A8()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_248AF50B4()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_248AF50C0()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_248AF50CC()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_248AF50D8()
{
  return MEMORY[0x24BDEC970]();
}

uint64_t sub_248AF50E4()
{
  return MEMORY[0x24BDED1F8]();
}

uint64_t sub_248AF50F0()
{
  return MEMORY[0x24BDED230]();
}

uint64_t sub_248AF50FC()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_248AF5108()
{
  return MEMORY[0x24BDED408]();
}

uint64_t sub_248AF5114()
{
  return MEMORY[0x24BDED420]();
}

uint64_t sub_248AF5120()
{
  return MEMORY[0x24BDED7A8]();
}

uint64_t sub_248AF512C()
{
  return MEMORY[0x24BDED7B8]();
}

uint64_t sub_248AF5138()
{
  return MEMORY[0x24BDED8C8]();
}

uint64_t sub_248AF5144()
{
  return MEMORY[0x24BDED8D0]();
}

uint64_t sub_248AF5150()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_248AF515C()
{
  return MEMORY[0x24BDEDAF8]();
}

uint64_t sub_248AF5168()
{
  return MEMORY[0x24BDEDB18]();
}

uint64_t sub_248AF5174()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_248AF5180()
{
  return MEMORY[0x24BDEDC80]();
}

uint64_t sub_248AF518C()
{
  return MEMORY[0x24BDEDCA8]();
}

uint64_t sub_248AF5198()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_248AF51A4()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_248AF51B0()
{
  return MEMORY[0x24BDEDF98]();
}

uint64_t sub_248AF51BC()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_248AF51C8()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_248AF51D4()
{
  return MEMORY[0x24BDEE0D0]();
}

uint64_t sub_248AF51E0()
{
  return MEMORY[0x24BDEE138]();
}

uint64_t sub_248AF51EC()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_248AF51F8()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_248AF5204()
{
  return MEMORY[0x24BDEE1D8]();
}

uint64_t sub_248AF5210()
{
  return MEMORY[0x24BDEE1F0]();
}

uint64_t sub_248AF521C()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_248AF5228()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_248AF5234()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_248AF5240()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_248AF524C()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_248AF5258()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_248AF5264()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_248AF5270()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_248AF527C()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_248AF5288()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_248AF5294()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_248AF52A0()
{
  return MEMORY[0x24BDEE9E8]();
}

uint64_t sub_248AF52AC()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_248AF52B8()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_248AF52C4()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_248AF52D0()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_248AF52DC()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_248AF52E8()
{
  return MEMORY[0x24BDEED50]();
}

uint64_t sub_248AF52F4()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_248AF5300()
{
  return MEMORY[0x24BDEEDC0]();
}

uint64_t sub_248AF530C()
{
  return MEMORY[0x24BDEEDC8]();
}

uint64_t sub_248AF5318()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_248AF5324()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_248AF5330()
{
  return MEMORY[0x24BDEF0D0]();
}

uint64_t sub_248AF533C()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_248AF5348()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_248AF5354()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_248AF5360()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_248AF536C()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_248AF5378()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_248AF5384()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_248AF5390()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_248AF539C()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_248AF53A8()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_248AF53B4()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_248AF53C0()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_248AF53CC()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_248AF53D8()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_248AF53E4()
{
  return MEMORY[0x24BDEF540]();
}

uint64_t sub_248AF53F0()
{
  return MEMORY[0x24BDEF950]();
}

uint64_t sub_248AF53FC()
{
  return MEMORY[0x24BDEF998]();
}

uint64_t sub_248AF5408()
{
  return MEMORY[0x24BDEFEF8]();
}

uint64_t sub_248AF5414()
{
  return MEMORY[0x24BDF0138]();
}

uint64_t sub_248AF5420()
{
  return MEMORY[0x24BDF0158]();
}

uint64_t sub_248AF542C()
{
  return MEMORY[0x24BDF0440]();
}

uint64_t sub_248AF5438()
{
  return MEMORY[0x24BDF0468]();
}

uint64_t sub_248AF5444()
{
  return MEMORY[0x24BDF0478]();
}

uint64_t sub_248AF5450()
{
  return MEMORY[0x24BDF0618]();
}

uint64_t sub_248AF545C()
{
  return MEMORY[0x24BDF0620]();
}

uint64_t sub_248AF5468()
{
  return MEMORY[0x24BDF09F8]();
}

uint64_t sub_248AF5474()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_248AF5480()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_248AF548C()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_248AF5498()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_248AF54A4()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_248AF54B0()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_248AF54BC()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_248AF54C8()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_248AF54D4()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_248AF54E0()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_248AF54EC()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_248AF54F8()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_248AF5504()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_248AF5510()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_248AF551C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_248AF5528()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_248AF5534()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_248AF5540()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_248AF554C()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_248AF5558()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_248AF5564()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_248AF5570()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_248AF557C()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_248AF5588()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_248AF5594()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_248AF55A0()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_248AF55AC()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_248AF55B8()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_248AF55C4()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_248AF55D0()
{
  return MEMORY[0x24BDF1C00]();
}

uint64_t sub_248AF55DC()
{
  return MEMORY[0x24BDF1C18]();
}

uint64_t sub_248AF55E8()
{
  return MEMORY[0x24BDF1C20]();
}

uint64_t sub_248AF55F4()
{
  return MEMORY[0x24BDF1C28]();
}

uint64_t sub_248AF5600()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_248AF560C()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_248AF5618()
{
  return MEMORY[0x24BDF1FE0]();
}

uint64_t sub_248AF5624()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_248AF5630()
{
  return MEMORY[0x24BDFBFC8]();
}

uint64_t sub_248AF563C()
{
  return MEMORY[0x24BDF2040]();
}

uint64_t sub_248AF5648()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_248AF5654()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_248AF5660()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_248AF566C()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_248AF5678()
{
  return MEMORY[0x24BDF22C8]();
}

uint64_t sub_248AF5684()
{
  return MEMORY[0x24BDF2320]();
}

uint64_t sub_248AF5690()
{
  return MEMORY[0x24BDF2348]();
}

uint64_t sub_248AF569C()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_248AF56A8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_248AF56B4()
{
  return MEMORY[0x24BDF2738]();
}

uint64_t sub_248AF56C0()
{
  return MEMORY[0x24BDF2AF0]();
}

uint64_t sub_248AF56CC()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_248AF56D8()
{
  return MEMORY[0x24BDF2C68]();
}

uint64_t sub_248AF56E4()
{
  return MEMORY[0x24BDF2CC8]();
}

uint64_t sub_248AF56F0()
{
  return MEMORY[0x24BDF2E80]();
}

uint64_t sub_248AF56FC()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_248AF5708()
{
  return MEMORY[0x24BDF3280]();
}

uint64_t sub_248AF5714()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_248AF5720()
{
  return MEMORY[0x24BDF3768]();
}

uint64_t sub_248AF572C()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_248AF5738()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_248AF5744()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_248AF5750()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_248AF575C()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_248AF5768()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_248AF5774()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_248AF5780()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_248AF578C()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_248AF5798()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_248AF57A4()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_248AF57B0()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_248AF57BC()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_248AF57C8()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_248AF57D4()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_248AF57E0()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_248AF57EC()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_248AF57F8()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_248AF5804()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_248AF5810()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_248AF581C()
{
  return MEMORY[0x24BDF4300]();
}

uint64_t sub_248AF5828()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_248AF5834()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_248AF5840()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_248AF584C()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_248AF5858()
{
  return MEMORY[0x24BDF48E8]();
}

uint64_t sub_248AF5864()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_248AF5870()
{
  return MEMORY[0x24BDF4A28]();
}

uint64_t sub_248AF587C()
{
  return MEMORY[0x24BDF4A40]();
}

uint64_t sub_248AF5888()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_248AF5894()
{
  return MEMORY[0x24BDF4D48]();
}

uint64_t sub_248AF58A0()
{
  return MEMORY[0x24BDF4D58]();
}

uint64_t sub_248AF58AC()
{
  return MEMORY[0x24BDF4D80]();
}

uint64_t sub_248AF58B8()
{
  return MEMORY[0x24BDF4E28]();
}

uint64_t sub_248AF58C4()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_248AF58D0()
{
  return MEMORY[0x24BDF4EC0]();
}

uint64_t sub_248AF58DC()
{
  return MEMORY[0x24BDF4EF0]();
}

uint64_t sub_248AF58E8()
{
  return MEMORY[0x24BDF4F00]();
}

uint64_t sub_248AF58F4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_248AF5900()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_248AF590C()
{
  return MEMORY[0x24BDF4F38]();
}

uint64_t sub_248AF5918()
{
  return MEMORY[0x24BDF4F58]();
}

uint64_t sub_248AF5924()
{
  return MEMORY[0x24BDF4FA0]();
}

uint64_t sub_248AF5930()
{
  return MEMORY[0x24BDF4FA8]();
}

uint64_t sub_248AF593C()
{
  return MEMORY[0x24BDF4FB0]();
}

uint64_t sub_248AF5948()
{
  return MEMORY[0x24BDF4FC0]();
}

uint64_t sub_248AF5954()
{
  return MEMORY[0x24BDF4FC8]();
}

uint64_t sub_248AF5960()
{
  return MEMORY[0x24BDF5000]();
}

uint64_t sub_248AF596C()
{
  return MEMORY[0x24BDF5010]();
}

uint64_t sub_248AF5978()
{
  return MEMORY[0x24BDF51E8]();
}

uint64_t sub_248AF5984()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_248AF5990()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_248AF599C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_248AF59A8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_248AF59B4()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_248AF59C0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_248AF59CC()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_248AF59D8()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_248AF59E4()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_248AF59F0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_248AF59FC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_248AF5A08()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_248AF5A14()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_248AF5A20()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_248AF5A2C()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_248AF5A38()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_248AF5A44()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_248AF5A50()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_248AF5A5C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_248AF5A68()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_248AF5A74()
{
  return MEMORY[0x24BDCFB28]();
}

uint64_t sub_248AF5A80()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_248AF5A8C()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_248AF5A98()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_248AF5AA4()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_248AF5AB0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_248AF5ABC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_248AF5AC8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_248AF5AD4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_248AF5AE0()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_248AF5AEC()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_248AF5AF8()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_248AF5B04()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_248AF5B10()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_248AF5B1C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_248AF5B28()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_248AF5B34()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_248AF5B40()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_248AF5B4C()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_248AF5B58()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_248AF5B64()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_248AF5B70()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_248AF5B7C()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_248AF5B88()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_248AF5B94()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_248AF5BA0()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_248AF5BAC()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_248AF5BB8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_248AF5BC4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_248AF5BD0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_248AF5BDC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_248AF5BE8()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_248AF5BF4()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_248AF5C00()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_248AF5C0C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_248AF5C18()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_248AF5C24()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_248AF5C30()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_248AF5C3C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_248AF5C48()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_248AF5C54()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_248AF5C60()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_248AF5C6C()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_248AF5C78()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_248AF5C84()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_248AF5C90()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_248AF5C9C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_248AF5CA8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_248AF5CB4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_248AF5CC0()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_248AF5CCC()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_248AF5CD8()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_248AF5CE4()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_248AF5CF0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_248AF5CFC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_248AF5D08()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_248AF5D14()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_248AF5D20()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_248AF5D2C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_248AF5D38()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_248AF5D44()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_248AF5D50()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_248AF5D5C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_248AF5D68()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_248AF5D74()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_248AF5D80()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_248AF5D8C()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_248AF5D98()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_248AF5DA4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_248AF5DB0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_248AF5DBC()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_248AF5DC8()
{
  return MEMORY[0x24BEE4A18]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

