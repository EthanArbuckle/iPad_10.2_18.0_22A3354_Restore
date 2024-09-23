BOOL sub_100002D84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100002D98()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100002DDC()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100002E04(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100002E44(uint64_t a1)
{
  return sub_100002E6C(0.129411765, a1, &qword_100051108);
}

uint64_t sub_100002E58(uint64_t a1)
{
  return sub_100002E6C(0.478431373, a1, &qword_100051118);
}

uint64_t sub_100002E6C(double a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  type metadata accessor for Color.RGBColorSpace(0);
  __chkstk_darwin();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v7 + 104))(v6, enum case for Color.RGBColorSpace.sRGB(_:));
  result = Color.init(_:red:green:blue:opacity:)(v6, a1, a1, a1, 1.0);
  *a3 = result;
  return result;
}

uint64_t sub_100002F04@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  __int128 v38;
  double v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  _OWORD v52[3];

  v51 = a2;
  v50 = a1;
  v2 = a1;
  v47 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin();
  v4 = (_OWORD *)((char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v45 = type metadata accessor for Divider(0);
  v5 = *(_QWORD *)(v45 - 8);
  __chkstk_darwin();
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_1000033B8(&qword_100051200);
  __chkstk_darwin();
  v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_1000033B8(&qword_100051208);
  __chkstk_darwin();
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_1000033B8(&qword_100051210);
  __chkstk_darwin();
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_1000033B8(&qword_100051218);
  __chkstk_darwin();
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_1000033B8(&qword_100051220);
  v16 = __chkstk_darwin();
  v44 = (uint64_t)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  Divider.init()(v16);
  if (v2 == 2)
  {
    if (qword_100051110 != -1)
      swift_once(&qword_100051110, sub_100002E58);
    v18 = &qword_100051118;
  }
  else
  {
    if (qword_100051100 != -1)
      swift_once(&qword_100051100, sub_100002E44);
    v18 = &qword_100051108;
  }
  v19 = *v18;
  v20 = swift_retain(*v18);
  v21 = static Edge.Set.all.getter(v20);
  v22 = v45;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v9, v7, v45);
  v23 = &v9[*(int *)(v42 + 36)];
  *(_QWORD *)v23 = v19;
  v23[8] = v21;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v22);
  v24 = (char *)v4 + *(int *)(v47 + 20);
  v25 = enum case for RoundedCornerStyle.continuous(_:);
  v26 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v24, v25, v26);
  __asm { FMOV            V0.2D, #0.5 }
  *v4 = _Q0;
  v32 = (uint64_t)&v11[*(int *)(v43 + 36)];
  sub_1000033F8((uint64_t)v4, v32);
  *(_WORD *)(v32 + *(int *)(sub_1000033B8(&qword_100051228) + 36)) = 256;
  sub_100003478((uint64_t)v9, (uint64_t)v11, &qword_100051200);
  sub_10000343C((uint64_t)v4);
  v33 = sub_1000034BC((uint64_t)v9, &qword_100051200);
  LOBYTE(v32) = static Edge.Set.horizontal.getter(v33);
  sub_100003478((uint64_t)v11, (uint64_t)v13, &qword_100051208);
  v13[*(int *)(v46 + 36)] = v32;
  v34 = sub_1000034BC((uint64_t)v11, &qword_100051208);
  v35 = static Alignment.center.getter(v34);
  _FrameLayout.init(width:height:alignment:)(v52, 0x3FF0000000000000, 0, 0, 1, v35, v36);
  sub_100003478((uint64_t)v13, (uint64_t)v15, &qword_100051210);
  v37 = &v15[*(int *)(v48 + 36)];
  v38 = v52[1];
  *(_OWORD *)v37 = v52[0];
  *((_OWORD *)v37 + 1) = v38;
  *((_OWORD *)v37 + 2) = v52[2];
  sub_1000034BC((uint64_t)v13, &qword_100051210);
  if ((_BYTE)v50)
    v39 = 1.0;
  else
    v39 = 0.0;
  v40 = v44;
  sub_100003478((uint64_t)v15, v44, &qword_100051218);
  *(double *)(v40 + *(int *)(v49 + 36)) = v39;
  sub_1000034BC((uint64_t)v15, &qword_100051218);
  return sub_1000034F8(v40, v51);
}

uint64_t sub_100003354()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10000336C@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  return sub_100002F04(*v1, a1);
}

void sub_100003374(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_BYTE *initializeBufferWithCopyOfBuffer for ChartSeparatorType(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ChartSeparator()
{
  return &type metadata for ChartSeparator;
}

uint64_t sub_1000033A8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100041B38, 1);
}

uint64_t sub_1000033B8(uint64_t *a1)
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

uint64_t sub_1000033F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000343C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100003478(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000033B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000034BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000033B8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000034F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8(&qword_100051220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s13FitnessWidget18ChartSeparatorTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s13FitnessWidget18ChartSeparatorTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000361C + 4 * byte_10003FBC5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100003650 + 4 * byte_10003FBC0[v4]))();
}

uint64_t sub_100003650(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003658(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100003660);
  return result;
}

uint64_t sub_10000366C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100003674);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100003678(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100003680(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000368C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100003698(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ChartSeparatorType()
{
  return &type metadata for ChartSeparatorType;
}

uint64_t sub_1000036B0()
{
  return sub_10000374C(&qword_100051230, &qword_100051220, (void (*)(void))sub_100003728);
}

uint64_t sub_1000036E4(uint64_t *a1)
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

uint64_t sub_100003728()
{
  return sub_10000374C(&qword_100051238, &qword_100051218, (void (*)(void))sub_1000037B4);
}

uint64_t sub_10000374C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000036E4(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000037B4()
{
  return sub_10000374C(&qword_100051240, &qword_100051210, (void (*)(void))sub_1000037D8);
}

unint64_t sub_1000037D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051248;
  if (!qword_100051248)
  {
    v1 = sub_1000036E4(&qword_100051208);
    sub_10000385C();
    sub_100003928(&qword_100051270, &qword_100051228, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051248);
  }
  return result;
}

unint64_t sub_10000385C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051250;
  if (!qword_100051250)
  {
    v1 = sub_1000036E4(&qword_100051200);
    sub_1000038E0();
    sub_100003928(&qword_100051260, &qword_100051268, (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051250);
  }
  return result;
}

unint64_t sub_1000038E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051258;
  if (!qword_100051258)
  {
    v1 = type metadata accessor for Divider(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for Divider, v1);
    atomic_store(result, (unint64_t *)&qword_100051258);
  }
  return result;
}

uint64_t sub_100003928(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000036E4(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000396C()
{
  unint64_t result;

  result = qword_100051278;
  if (!qword_100051278)
  {
    result = swift_getWitnessTable(&unk_10003FC94, &type metadata for ChartSeparatorType);
    atomic_store(result, (unint64_t *)&qword_100051278);
  }
  return result;
}

char *sub_1000039B4(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  char *v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v16);
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = a3[5];
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = type metadata accessor for TimelineEntryRelevance(0);
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      v15 = sub_1000033B8(&qword_100051280);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    v17 = a3[6];
    v18 = a3[7];
    v19 = *(void **)&a2[v17];
    *(_QWORD *)&a1[v17] = v19;
    v20 = &a1[v18];
    v21 = &a2[v18];
    v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    v23 = v19;
    if (v22(v21, 1, v7))
    {
      v24 = sub_1000033B8((uint64_t *)&unk_100051980);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    }
    else
    {
      v9(v20, v21, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v20, 0, 1, v7);
    }
    v25 = a3[8];
    v26 = a3[9];
    v27 = *(void **)&a2[v25];
    *(_QWORD *)&a1[v25] = v27;
    a1[v26] = a2[v26];
    a1[a3[10]] = a2[a3[10]];
    v28 = v27;
  }
  return a1;
}

void sub_100003B70(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v7 = a1 + a2[5];
  v8 = type metadata accessor for TimelineEntryRelevance(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);

  v10 = a1 + a2[7];
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
    v6(v10, v4);

}

char *sub_100003C48(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;
  char *v19;
  unsigned int (*v20)(const void *, uint64_t, uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = type metadata accessor for TimelineEntryRelevance(0);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = sub_1000033B8(&qword_100051280);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v15 = a3[6];
  v16 = a3[7];
  v17 = *(void **)&a2[v15];
  *(_QWORD *)&a1[v15] = v17;
  v18 = &a1[v16];
  v19 = &a2[v16];
  v20 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v21 = v17;
  if (v20(v19, 1, v6))
  {
    v22 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v8(v18, v19, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v18, 0, 1, v6);
  }
  v23 = a3[8];
  v24 = a3[9];
  v25 = *(void **)&a2[v23];
  *(_QWORD *)&a1[v23] = v25;
  a1[v24] = a2[v24];
  a1[a3[10]] = a2[a3[10]];
  v26 = v25;
  return a1;
}

uint64_t sub_100003DD8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;

  v6 = type metadata accessor for Date(0);
  v33 = *(_QWORD *)(v6 - 8);
  v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 24);
  v32(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = sub_1000033B8(&qword_100051280);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  v16 = a3[6];
  v17 = *(void **)(a1 + v16);
  v18 = *(void **)(a2 + v16);
  *(_QWORD *)(a1 + v16) = v18;
  v19 = v18;

  v20 = a3[7];
  v21 = (void *)(a1 + v20);
  v22 = (const void *)(a2 + v20);
  v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
  v24 = v23(a1 + v20, 1, v6);
  v25 = v23((uint64_t)v22, 1, v6);
  if (!v24)
  {
    if (!v25)
    {
      v32((uint64_t)v21, (uint64_t)v22, v6);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v33 + 8))(v21, v6);
    goto LABEL_12;
  }
  if (v25)
  {
LABEL_12:
    v26 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(v33 + 16))(v21, v22, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v21, 0, 1, v6);
LABEL_13:
  v27 = a3[8];
  v28 = *(void **)(a1 + v27);
  v29 = *(void **)(a2 + v27);
  *(_QWORD *)(a1 + v27) = v29;
  v30 = v29;

  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  return a1;
}

char *sub_100004020(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = type metadata accessor for TimelineEntryRelevance(0);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = sub_1000033B8(&qword_100051280);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  v15 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  v16 = &a1[v15];
  v17 = &a2[v15];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v15], 1, v6))
  {
    v18 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    v8(v16, v17, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
  }
  v19 = a3[9];
  *(_QWORD *)&a1[a3[8]] = *(_QWORD *)&a2[a3[8]];
  a1[v19] = a2[v19];
  a1[a3[10]] = a2[a3[10]];
  return a1;
}

uint64_t sub_1000041A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;

  v6 = type metadata accessor for Date(0);
  v30 = *(_QWORD *)(v6 - 8);
  v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 40);
  v29(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = sub_1000033B8(&qword_100051280);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = a3[6];
  v17 = *(void **)(a1 + v16);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);

  v18 = a3[7];
  v19 = (void *)(a1 + v18);
  v20 = (const void *)(a2 + v18);
  v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48);
  v22 = v21(a1 + v18, 1, v6);
  v23 = v21((uint64_t)v20, 1, v6);
  if (!v22)
  {
    if (!v23)
    {
      v29((uint64_t)v19, (uint64_t)v20, v6);
      goto LABEL_13;
    }
    (*(void (**)(void *, uint64_t))(v30 + 8))(v19, v6);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    v24 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, const void *, uint64_t))(v30 + 32))(v19, v20, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v19, 0, 1, v6);
LABEL_13:
  v25 = a3[8];
  v26 = *(void **)(a1 + v25);
  *(_QWORD *)(a1 + v25) = *(_QWORD *)(a2 + v25);

  v27 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v27) = *(_BYTE *)(a2 + v27);
  return a1;
}

uint64_t sub_1000043E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000043F0);
}

uint64_t sub_1000043F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = sub_1000033B8(&qword_100051280);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v11 = sub_1000033B8((uint64_t *)&unk_100051980);
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

uint64_t sub_1000044D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000044DC);
}

uint64_t sub_1000044DC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_1000033B8(&qword_100051280);
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
      v10 = sub_1000033B8((uint64_t *)&unk_100051980);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[7];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for FitnessWidgetProvider.ActivityEntry(uint64_t a1)
{
  uint64_t result;

  result = qword_1000512E0;
  if (!qword_1000512E0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FitnessWidgetProvider.ActivityEntry);
  return result;
}

void sub_1000045E8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[7];

  v2 = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_1000046BC(319, (unint64_t *)&unk_1000512F0, (uint64_t (*)(uint64_t))&type metadata accessor for TimelineEntryRelevance);
    if (v5 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(v4 - 8) + 64;
      v8[2] = "\b";
      sub_1000046BC(319, (unint64_t *)&qword_100051720, (uint64_t (*)(uint64_t))&type metadata accessor for Date);
      if (v7 <= 0x3F)
      {
        v8[3] = *(_QWORD *)(v6 - 8) + 64;
        v8[4] = "\b";
        v8[5] = &unk_10003FD18;
        v8[6] = &unk_10003FD18;
        swift_initStructMetadata(a1, 256, 7, v8, a1 + 16);
      }
    }
  }
}

void sub_1000046BC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Optional(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for FitnessWidgetProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

void destroy for FitnessWidgetProvider(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));

}

uint64_t initializeWithCopy for FitnessWidgetProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v5;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v4);
  v6 = v5;
  return a1;
}

uint64_t assignWithCopy for FitnessWidgetProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = *(void **)(a1 + 40);
  v9 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v9;
  v10 = v9;

  return a1;
}

__n128 initializeWithTake for FitnessWidgetProvider(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for FitnessWidgetProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
  v6 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for FitnessWidgetProvider(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FitnessWidgetProvider(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FitnessWidgetProvider()
{
  return &type metadata for FitnessWidgetProvider;
}

uint64_t sub_10000495C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_100004994@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100008620(v2 + *(int *)(a1 + 20), a2);
}

uint64_t sub_1000049A4()
{
  return sub_100008304(qword_100051338, type metadata accessor for FitnessWidgetProvider.ActivityEntry, (uint64_t)&unk_10003FD58);
}

uint64_t sub_1000049D0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
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
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, char *, uint64_t);
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  _OWORD *v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  void *v57;
  id *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v66;
  void (*v67)(uint64_t, char *, uint64_t);
  uint64_t v68;
  void (*v69)(char *, char *, uint64_t);
  uint64_t v70;
  uint64_t v71;
  _OWORD *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  void *v82;
  _QWORD aBlock[5];
  uint64_t v84;
  id v85;
  __int128 v86;
  __int128 v87;

  v73 = a3;
  v71 = a2;
  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v78 = *(_QWORD *)(v3 - 8);
  v79 = v3;
  __chkstk_darwin(v3);
  v77 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v75 = *(_QWORD *)(v5 - 8);
  v76 = v5;
  __chkstk_darwin(v5);
  v74 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v66 - v13;
  v15 = static os_log_type_t.debug.getter(v12);
  v16 = HKLogActivity;
  os_log(_:dso:log:_:_:)(v15, &_mh_execute_header, v16, "Retrieving snapshot.", 20, 2, &_swiftEmptyArrayStorage);

  Date.init()();
  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v19 = static os_log_type_t.default.getter(v18);
  v20 = HKLogActivity;
  os_log(_:dso:log:_:_:)(v19, &_mh_execute_header, v20, "Retrieving summary for snapshot.", 32, 2, &_swiftEmptyArrayStorage);

  if (qword_1000511F8 != -1)
    swift_once(&qword_1000511F8, sub_10003D32C);
  v69 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v69(v11, v14, v7);
  v21 = *(unsigned __int8 *)(v8 + 80);
  v22 = v8;
  v70 = v8;
  v23 = (v21 + 16) & ~v21;
  v24 = v21 | 7;
  v25 = v9 + v23;
  v26 = v23;
  v68 = v23;
  v27 = v7;
  v28 = (v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  v80 = v28;
  v81 = v28 + 8;
  v29 = v24;
  v66 = v24;
  v30 = (uint64_t)v14;
  v31 = swift_allocObject(&unk_10004E238, v28 + 8, v24);
  v67 = *(void (**)(uint64_t, char *, uint64_t))(v22 + 32);
  v67(v31 + v26, v11, v27);
  *(_QWORD *)(v31 + v28) = v17;
  v32 = v17;
  sub_10000D800(v30, 1, (uint64_t)sub_10000841C, v31);
  swift_release(v31);
  dispatch_group_enter(v32);
  v34 = static os_log_type_t.default.getter(v33);
  v35 = HKLogActivity;
  os_log(_:dso:log:_:_:)(v34, &_mh_execute_header, v35, "Retrieving statistics for snapshot.", 35, 2, &_swiftEmptyArrayStorage);

  v36 = (void (*)(char *, uint64_t, uint64_t))v69;
  v69(v11, (char *)v30, v27);
  v37 = swift_allocObject(&unk_10004E260, v81, v29);
  v38 = v68;
  v39 = v27;
  v40 = v27;
  v41 = v67;
  v67(v37 + v68, v11, v39);
  *(_QWORD *)(v37 + v80) = v32;
  v42 = v32;
  sub_10000EE38(v30, 1, sub_1000084B0, v37);
  swift_release(v37);
  dispatch_group_enter(v42);
  v44 = static os_log_type_t.default.getter(v43);
  v45 = HKLogActivity;
  os_log(_:dso:log:_:_:)(v44, &_mh_execute_header, v45, "Retrieving pause rings for snapshot.", 36, 2, &_swiftEmptyArrayStorage);

  v46 = v30;
  v47 = v30;
  v48 = v40;
  v36(v11, v47, v40);
  v49 = swift_allocObject(&unk_10004E288, v81, v66);
  v41(v49 + v38, v11, v40);
  *(_QWORD *)(v49 + v80) = v42;
  v50 = v42;
  sub_10000DF94(v46, 1, (uint64_t)sub_100008300, v49);
  swift_release(v49);
  sub_100008158();
  v51 = (void *)static OS_dispatch_queue.main.getter();
  v52 = v72;
  v53 = *(_OWORD *)((char *)v72 + 8);
  v86 = *(_OWORD *)((char *)v72 + 24);
  v87 = v53;
  sub_1000082A0((uint64_t)v72 + 40, (uint64_t)&v85, &qword_100051358);
  v54 = swift_allocObject(&unk_10004E2B0, 80, 7);
  v55 = v73;
  *(_QWORD *)(v54 + 16) = v71;
  *(_QWORD *)(v54 + 24) = v55;
  v56 = v52[1];
  *(_OWORD *)(v54 + 32) = *v52;
  *(_OWORD *)(v54 + 48) = v56;
  *(_OWORD *)(v54 + 64) = v52[2];
  aBlock[4] = sub_1000085D8;
  v84 = v54;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CBA8;
  aBlock[3] = &unk_10004E2C8;
  v57 = _Block_copy(aBlock);
  swift_retain(v55);
  sub_100007728((uint64_t)&v87);
  sub_100007728((uint64_t)&v86);
  v58 = sub_100007750(&v85);
  v59 = v74;
  static DispatchQoS.unspecified.getter(v58);
  v82 = &_swiftEmptyArrayStorage;
  v60 = sub_100008304(&qword_100051370, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v61 = sub_1000033B8((uint64_t *)&unk_100051960);
  v62 = sub_100008210();
  v63 = v77;
  v64 = v79;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v82, v61, v62, v79, v60);
  OS_dispatch_group.notify(qos:flags:queue:execute:)(v59, v63, v51, v57);
  _Block_release(v57);

  (*(void (**)(char *, uint64_t))(v78 + 8))(v63, v64);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v59, v76);
  (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v46, v48);
  return swift_release(v84);
}

uint64_t sub_100004FF8(void (*a1)(char *), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  _QWORD *v22;
  char v23;
  uint64_t v24;
  id v25;
  char *v26;
  uint64_t v27;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *);
  void *v35;

  v33 = a2;
  v34 = a1;
  v2 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin();
  v31 = (uint64_t *)((char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000033B8(&qword_100051280);
  __chkstk_darwin();
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v32 - 8);
  __chkstk_darwin();
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry(0);
  __chkstk_darwin();
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000511F8 != -1)
    swift_once(&qword_1000511F8, sub_10003D32C);
  v12 = qword_100054900;
  v13 = sub_1000033B8((uint64_t *)&unk_100051990);
  v14 = OS_dispatch_queue.sync<A>(execute:)(&v35, sub_1000083D0, v12, v13);
  v15 = v35;
  if (v35 && (v16 = sub_100017D8C(), v15, v16))
  {
    Date.init()();
    v17 = type metadata accessor for TimelineEntryRelevance(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v5, 1, 1, v17);
    OS_dispatch_queue.sync<A>(execute:)(&v35, sub_1000083D0, qword_100054900, v13);
    v30 = v35;
    OS_dispatch_queue.sync<A>(execute:)(v31, sub_1000083E8, qword_100054900, v2);
    v18 = qword_100054900;
    v19 = sub_1000033B8(&qword_1000513A0);
    OS_dispatch_queue.sync<A>(execute:)(&v35, sub_100008400, v18, v19);
    v20 = v35;
    v21 = *(_BYTE *)(qword_100054900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v8, v32);
    sub_1000082A0((uint64_t)v5, (uint64_t)&v11[v9[5]], &qword_100051280);
    v22 = v31;
    *(_QWORD *)&v11[v9[6]] = v30;
    sub_1000082A0((uint64_t)v22, (uint64_t)&v11[v9[7]], (uint64_t *)&unk_100051980);
    v23 = 0;
  }
  else
  {
    v24 = static os_log_type_t.default.getter(v14);
    v25 = HKLogActivity;
    os_log(_:dso:log:_:_:)(v24, &_mh_execute_header, v25, "Activity summary doesn't have a valid move goal, return placeholder", 67, 2, &_swiftEmptyArrayStorage);

    Date.init()();
    v26 = &v11[v9[5]];
    v27 = type metadata accessor for TimelineEntryRelevance(0);
    v23 = 1;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v26, 1, 1, v27);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(&v11[v9[7]], 1, 1, v32);
    v20 = 0;
    v21 = *(_BYTE *)(qword_100054900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
    *(_QWORD *)&v11[v9[6]] = 0;
  }
  *(_QWORD *)&v11[v9[8]] = v20;
  v11[v9[9]] = v23;
  v11[v9[10]] = v21;
  v34(v11);
  return sub_1000085E4((uint64_t)v11);
}

uint64_t sub_100005394(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  __int128 *v3;
  __int128 *v4;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  NSString v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void (**v47)(char *);
  uint64_t v48;
  uint64_t v49;
  _OWORD *v50;
  __int128 v51;
  __int128 v52;
  void *v53;
  id v54;
  void *v55;
  unsigned __int8 v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  double v67;
  uint64_t (*v68)(char *, uint64_t);
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  _QWORD *v73;
  void *v74;
  _QWORD *v75;
  id v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id (**v89)();
  void *v90;
  _QWORD *v91;
  id v92;
  char *v93;
  uint64_t v94;
  void **v95;
  Class isa;
  NSString v97;
  void (*v98)(char *, uint64_t);
  uint64_t v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(char *);
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  void **aBlock;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  _QWORD *v118;
  __int128 v119;
  id v120;
  void *v121;

  v4 = v3;
  v108 = a2;
  v109 = a3;
  v106 = a1;
  v5 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v5);
  v104 = (uint64_t)&v99 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = type metadata accessor for Date(0);
  v103 = *(_QWORD *)(v107 - 8);
  v7 = *(_QWORD *)(v103 + 64);
  __chkstk_darwin(v107);
  v100 = (char *)&v99 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v102 = (char *)&v99 - v9;
  __chkstk_darwin(v10);
  v101 = (char *)&v99 - v11;
  __chkstk_darwin(v12);
  v105 = (char *)&v99 - v13;
  v112 = type metadata accessor for TimelineProviderContext(0);
  v110 = *(_QWORD *)(v112 - 8);
  v14 = *(_QWORD *)(v110 + 64);
  __chkstk_darwin(v112);
  v111 = (char *)&v99 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v17 = (char *)&v99 - v16;
  v18 = type metadata accessor for TimelineReloadPolicy(0);
  __chkstk_darwin(v18);
  v20 = (char *)&v99 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1000033B8(&qword_100051350);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v99 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = static os_log_type_t.default.getter(v25);
  v27 = HKLogActivity;
  os_log(_:dso:log:_:_:)(v26, &_mh_execute_header, v27, "Retrieving timeline entries.", 28, 2, &_swiftEmptyArrayStorage);

  sub_1000082A0((uint64_t)v4 + 40, (uint64_t)&v120, &qword_100051358);
  sub_1000082A0((uint64_t)&v120, (uint64_t)&v121, &qword_100051358);
  v28 = v121;
  if (v121)
  {
    v29 = String._bridgeToObjectiveC()();
    v30 = objc_msgSend(v28, "BOOLForKey:", v29);

    if (v30)
    {
      v32 = static os_log_type_t.default.getter(v31);
      v33 = HKLogActivity;
      os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Returning demo data for timeline entries.", 41, 2, &_swiftEmptyArrayStorage);

      v34 = sub_100007CDC(5);
      static TimelineReloadPolicy.atEnd.getter(v34);
      v35 = type metadata accessor for FitnessWidgetProvider.ActivityEntry(0);
      v36 = sub_100008304(qword_100051338, type metadata accessor for FitnessWidgetProvider.ActivityEntry, (uint64_t)&unk_10003FD58);
      Timeline.init(entries:policy:)(v34, v20, v35, v36);
      v108(v24);
      return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
    }
  }
  v38 = v110;
  v39 = *(void (**)(char *, uint64_t, uint64_t))(v110 + 16);
  v40 = v112;
  v39(v17, v106, v112);
  v39(v111, (uint64_t)v17, v40);
  v41 = *((_QWORD *)v4 + 2);
  v106 = *((_QWORD *)v4 + 1);
  v119 = *(__int128 *)((char *)v4 + 24);
  v42 = *(unsigned __int8 *)(v38 + 80);
  v43 = (v42 + 16) & ~v42;
  v44 = (v14 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
  v45 = (v44 + 23) & 0xFFFFFFFFFFFFFFF8;
  v46 = swift_allocObject(&unk_10004E058, v45 + 48, v42 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v46 + v43, v17, v40);
  v47 = (void (**)(char *))(v46 + v44);
  v49 = (uint64_t)v108;
  v48 = v109;
  *v47 = v108;
  v47[1] = (void (*)(char *))v48;
  v50 = (_OWORD *)(v46 + v45);
  v51 = v4[2];
  v52 = *v4;
  v50[1] = v4[1];
  v50[2] = v51;
  *v50 = v52;
  v53 = (void *)objc_opt_self(_HKBehavior);
  v99 = v41;
  swift_bridgeObjectRetain(v41);
  sub_100007728((uint64_t)&v119);
  swift_retain(v48);
  sub_100007750(&v120);
  v54 = objc_msgSend(v53, "sharedBehavior");
  if (v54)
  {
    v55 = v54;
    v56 = objc_msgSend(v54, "isStandalonePhoneFitnessMode");

    v58 = v107;
    v59 = v105;
    v60 = v104;
    if ((v56 & 1) != 0)
    {
      v61 = static os_log_type_t.default.getter(v57);
      v62 = HKLogActivity;
      os_log(_:dso:log:_:_:)(v61, &_mh_execute_header, v62, "User is in StandalonePhoneFitnessMode, skip data sync and start the queries.", 76, 2, &_swiftEmptyArrayStorage);

      v63 = (uint64_t)v111;
      sub_100005CD0((uint64_t)v111, v49, v48, v4);
      swift_release(v46);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v110 + 8))(v63, v112);
    }
    sub_100006D5C(v104);
    v64 = v103;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v103 + 48))(v60, 1, v58) == 1)
    {
      (*(void (**)(char *, uint64_t))(v110 + 8))(v111, v112);
      sub_1000034BC(v60, (uint64_t *)&unk_100051980);
    }
    else
    {
      v65 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v64 + 32))(v59, v60, v58);
      v66 = v101;
      Date.init()(v65);
      v67 = Date.timeIntervalSince(_:)(v59);
      v68 = *(uint64_t (**)(char *, uint64_t))(v64 + 8);
      v69 = v68(v66, v58);
      if (v67 < 300.0)
      {
        v70 = static os_log_type_t.default.getter(v69);
        v71 = HKLogActivity;
        os_log(_:dso:log:_:_:)(v70, &_mh_execute_header, v71, "Less than 5 minutes from the last data sync date, skip data sync and start the queries.", 87, 2, &_swiftEmptyArrayStorage);

        v63 = (uint64_t)v111;
        sub_100005CD0((uint64_t)v111, v49, v48, v4);
        swift_release(v46);
        v68(v59, v58);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v110 + 8))(v63, v112);
      }
      v68(v59, v58);
      (*(void (**)(char *, uint64_t))(v110 + 8))(v111, v112);
    }
    v72 = (void *)objc_opt_self(NSTimer);
    v73 = (_QWORD *)swift_allocObject(&unk_10004E080, 40, 7);
    v73[2] = 0x4010000000000000;
    v73[3] = sub_1000076D8;
    v73[4] = v46;
    v117 = sub_10000779C;
    v118 = v73;
    aBlock = _NSConcreteStackBlock;
    v114 = 1107296256;
    v115 = sub_100006F80;
    v116 = &unk_10004E098;
    v74 = _Block_copy(&aBlock);
    v75 = v118;
    swift_retain(v46);
    swift_release(v75);
    v76 = objc_msgSend(v72, "scheduledTimerWithTimeInterval:repeats:block:", 0, v74, 4.0);
    _Block_release(v74);
    v77 = v102;
    Date.init()(v78);
    v79 = v103;
    if (qword_1000511E8 != -1)
      swift_once(&qword_1000511E8, sub_10003D244);
    v80 = objc_msgSend(objc_allocWithZone((Class)HKNanoSyncControl), "initWithHealthStore:", qword_1000548F0);
    v81 = v101;
    (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v101, v77, v58);
    v82 = *(unsigned __int8 *)(v79 + 80);
    v83 = (v82 + 16) & ~v82;
    v84 = (v7 + v83 + 7) & 0xFFFFFFFFFFFFFFF8;
    v85 = (v84 + 15) & 0xFFFFFFFFFFFFFFF8;
    v86 = swift_allocObject(&unk_10004E0D0, v85 + 16, v82 | 7);
    v87 = v86 + v83;
    v88 = v107;
    (*(void (**)(uint64_t, char *, uint64_t))(v79 + 32))(v87, v81, v107);
    *(_QWORD *)(v86 + v84) = v76;
    v89 = (id (**)())(v86 + v85);
    *v89 = sub_1000076D8;
    v89[1] = (id (*)())v46;
    v117 = sub_100007850;
    v118 = (_QWORD *)v86;
    aBlock = _NSConcreteStackBlock;
    v114 = 1107296256;
    v115 = sub_100007354;
    v116 = &unk_10004E0E8;
    v90 = _Block_copy(&aBlock);
    v91 = v118;
    swift_retain(v46);
    v92 = v76;
    swift_release(v91);
    objc_msgSend(v80, "forceNanoSyncWithOptions:completion:", 1, v90);
    _Block_release(v90);
    v93 = v100;
    Date.init()(v94);
    sub_1000082A0((uint64_t)&v120, (uint64_t)&aBlock, &qword_100051358);
    v95 = aBlock;
    if (aBlock)
    {
      isa = Date._bridgeToObjectiveC()().super.isa;
      v97 = String._bridgeToObjectiveC()();
      objc_msgSend(v95, "setObject:forKey:", isa, v97);
      swift_release(v46);

    }
    else
    {
      swift_release(v46);

    }
    v98 = *(void (**)(char *, uint64_t))(v79 + 8);
    v98(v93, v88);
    return ((uint64_t (*)(char *, uint64_t))v98)(v102, v88);
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v110 + 8))(v111, v112);
    __break(1u);
  }
  return result;
}

id sub_100005CD0(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
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
  char *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, char *, uint64_t);
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  NSObject *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  id result;
  void *v46;
  unsigned __int8 v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  _OWORD *v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  void *v60;
  id *v61;
  char *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  void (*v69)(uint64_t, char *, uint64_t);
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _OWORD *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, char *, uint64_t);
  uint64_t v89;
  char *v90;
  void *v91;
  _QWORD aBlock[5];
  uint64_t v93;
  id v94;
  __int128 v95;
  __int128 v96;

  v74 = a4;
  v75 = a3;
  v73 = a2;
  v86 = a1;
  v82 = type metadata accessor for DispatchWorkItemFlags(0);
  v81 = *(_QWORD *)(v82 - 8);
  __chkstk_darwin(v82);
  v80 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = type metadata accessor for DispatchQoS(0);
  v78 = *(_QWORD *)(v79 - 8);
  __chkstk_darwin(v79);
  v77 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = type metadata accessor for WidgetFamily(0);
  v87 = *(_QWORD *)(v83 - 8);
  __chkstk_darwin(v83);
  v85 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v84 = (char *)&v69 - v8;
  v89 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v89 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v89);
  __chkstk_darwin(v11);
  v13 = (char *)&v69 - v12;
  Date.init()(v14);
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  v17 = static os_log_type_t.default.getter(v16);
  v18 = HKLogActivity;
  os_log(_:dso:log:_:_:)(v17, &_mh_execute_header, v18, "Retrieving summary for timeline.", 32, 2, &_swiftEmptyArrayStorage);

  if (qword_1000511F8 != -1)
    swift_once(&qword_1000511F8, sub_10003D32C);
  v88 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v19 = v89;
  v88((char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v13, v89);
  v20 = *(unsigned __int8 *)(v9 + 80);
  v90 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (v20 + 16) & ~v20;
  v22 = v20 | 7;
  v23 = (v10 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = swift_allocObject(&unk_10004E170, v23 + 8, v20 | 7);
  v76 = v9;
  v25 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v25(v24 + v21, v90, v19);
  *(_QWORD *)(v24 + v23) = v15;
  v26 = v15;
  sub_10000D800((uint64_t)v13, 0, (uint64_t)sub_1000082E8, v24);
  v27 = swift_release(v24);
  v28 = static os_log_type_t.default.getter(v27);
  v29 = HKLogActivity;
  os_log(_:dso:log:_:_:)(v28, &_mh_execute_header, v29, "Retrieving pause rings for snapshot.", 36, 2, &_swiftEmptyArrayStorage);

  dispatch_group_enter(v26);
  v88(v90, v13, v19);
  v70 = v23 + 8;
  v30 = v23;
  v71 = v22;
  v31 = swift_allocObject(&unk_10004E198, v23 + 8, v22);
  v72 = v21;
  v32 = v31 + v21;
  v33 = v90;
  v69 = v25;
  v25(v32, v90, v19);
  *(_QWORD *)(v31 + v23) = v26;
  v34 = v26;
  sub_10000DF94((uint64_t)v13, 0, (uint64_t)sub_100008300, v31);
  v35 = swift_release(v31);
  v36 = v84;
  TimelineProviderContext.family.getter(v35);
  v37 = v87;
  v38 = v85;
  v39 = v83;
  (*(void (**)(char *, _QWORD, uint64_t))(v87 + 104))(v85, enum case for WidgetFamily.systemMedium(_:), v83);
  v40 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(aBlock, v39, v40);
  dispatch thunk of RawRepresentable.rawValue.getter(&v96, v39, v40);
  v41 = aBlock[0];
  v42 = v96;
  v43 = *(void (**)(char *, uint64_t))(v37 + 8);
  v43(v38, v39);
  v43(v36, v39);
  v44 = (uint64_t)v13;
  if (v41 != v42)
    goto LABEL_7;
  result = objc_msgSend((id)objc_opt_self(_HKBehavior), "sharedBehavior");
  if (result)
  {
    v46 = result;
    v47 = objc_msgSend(result, "isStandalonePhoneFitnessMode");

    if ((v47 & 1) == 0)
    {
      dispatch_group_enter(v34);
      v49 = static os_log_type_t.default.getter(v48);
      v50 = HKLogActivity;
      os_log(_:dso:log:_:_:)(v49, &_mh_execute_header, v50, "Retrieving statistics for timeline.", 35, 2, &_swiftEmptyArrayStorage);

      v51 = v89;
      v88(v33, (char *)v44, v89);
      v52 = swift_allocObject(&unk_10004E210, v70, v71);
      v69(v52 + v72, v33, v51);
      *(_QWORD *)(v52 + v30) = v34;
      v53 = v34;
      sub_10000EE38(v44, 0, sub_100008358, v52);
      swift_release(v52);
    }
LABEL_7:
    sub_100008158();
    v54 = (void *)static OS_dispatch_queue.main.getter();
    v55 = v74;
    v56 = *(_OWORD *)((char *)v74 + 8);
    v95 = *(_OWORD *)((char *)v74 + 24);
    v96 = v56;
    sub_1000082A0((uint64_t)v74 + 40, (uint64_t)&v94, &qword_100051358);
    v57 = swift_allocObject(&unk_10004E1C0, 80, 7);
    v58 = v75;
    *(_QWORD *)(v57 + 16) = v73;
    *(_QWORD *)(v57 + 24) = v58;
    v59 = v55[1];
    *(_OWORD *)(v57 + 32) = *v55;
    *(_OWORD *)(v57 + 48) = v59;
    *(_OWORD *)(v57 + 64) = v55[2];
    aBlock[4] = sub_100008348;
    v93 = v57;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000CBA8;
    aBlock[3] = &unk_10004E1D8;
    v60 = _Block_copy(aBlock);
    swift_retain(v58);
    sub_100007728((uint64_t)&v96);
    sub_100007728((uint64_t)&v95);
    v61 = sub_100007750(&v94);
    v62 = v77;
    static DispatchQoS.unspecified.getter(v61);
    v91 = &_swiftEmptyArrayStorage;
    v63 = v34;
    v64 = sub_100008304(&qword_100051370, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v65 = sub_1000033B8((uint64_t *)&unk_100051960);
    v66 = sub_100008210();
    v67 = v80;
    v68 = v82;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v91, v65, v66, v82, v64);
    OS_dispatch_group.notify(qos:flags:queue:execute:)(v62, v67, v54, v60);
    _Block_release(v60);

    (*(void (**)(char *, uint64_t))(v81 + 8))(v67, v68);
    (*(void (**)(char *, uint64_t))(v78 + 8))(v62, v79);
    (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v44, v89);
    return (id)swift_release(v93);
  }
  __break(1u);
  return result;
}

void sub_100006438(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v9 = ((uint64_t (*)(void))static os_log_type_t.default.getter)();
  v10 = (void *)HKLogActivity;
  v11 = sub_1000033B8(&qword_100051368);
  v12 = swift_allocObject(v11, 112, 7);
  *(_OWORD *)(v12 + 16) = xmmword_10003FCD0;
  v13 = v10;
  v14 = Date.timeIntervalSinceNow.getter();
  *(_QWORD *)(v12 + 56) = &type metadata for Double;
  *(_QWORD *)(v12 + 64) = &protocol witness table for Double;
  *(double *)(v12 + 32) = -v14;
  v15 = sub_1000033B8(&qword_100051380);
  v16 = Optional.debugDescription.getter(v15);
  v18 = v17;
  *(_QWORD *)(v12 + 96) = &type metadata for String;
  *(_QWORD *)(v12 + 104) = sub_10000825C();
  *(_QWORD *)(v12 + 72) = v16;
  *(_QWORD *)(v12 + 80) = v18;
  os_log(_:dso:log:_:_:)(v9, &_mh_execute_header, v13, a5, 75, 2, v12);

  v19 = swift_bridgeObjectRelease(v12);
  v20 = static os_log_type_t.default.getter(v19);
  v21 = HKLogActivity;
  os_log(_:dso:log:_:_:)(v20, &_mh_execute_header, v21, a6, 45, 2, &_swiftEmptyArrayStorage);

  dispatch_group_leave(a4);
}

void sub_1000065A0(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = static os_log_type_t.default.getter(a1);
  v6 = (void *)HKLogActivity;
  v7 = sub_1000033B8(&qword_100051368);
  v8 = swift_allocObject(v7, 112, 7);
  *(_OWORD *)(v8 + 16) = xmmword_10003FCD0;
  v9 = v6;
  v10 = Date.timeIntervalSinceNow.getter();
  *(_QWORD *)(v8 + 56) = &type metadata for Double;
  *(_QWORD *)(v8 + 64) = &protocol witness table for Double;
  *(double *)(v8 + 32) = -v10;
  v11 = sub_1000033B8(&qword_100051380);
  v12 = Optional.debugDescription.getter(v11);
  v14 = v13;
  *(_QWORD *)(v8 + 96) = &type metadata for String;
  *(_QWORD *)(v8 + 104) = sub_10000825C();
  *(_QWORD *)(v8 + 72) = v12;
  *(_QWORD *)(v8 + 80) = v14;
  os_log(_:dso:log:_:_:)(v5, &_mh_execute_header, v9, "Pause Rings query for snapshot returned after %f seconds with error: %{public}@", 79, 2, v8);

  swift_bridgeObjectRelease(v8);
  dispatch_group_leave(a4);
}

void sub_1000066B4(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4, uint64_t a5)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = static os_log_type_t.default.getter(a1);
  v8 = (void *)HKLogActivity;
  v9 = sub_1000033B8(&qword_100051368);
  v10 = swift_allocObject(v9, 112, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10003FCD0;
  v11 = v8;
  v12 = Date.timeIntervalSinceNow.getter();
  *(_QWORD *)(v10 + 56) = &type metadata for Double;
  *(_QWORD *)(v10 + 64) = &protocol witness table for Double;
  *(double *)(v10 + 32) = -v12;
  v13 = sub_1000033B8(&qword_100051380);
  v14 = Optional.debugDescription.getter(v13);
  v16 = v15;
  *(_QWORD *)(v10 + 96) = &type metadata for String;
  *(_QWORD *)(v10 + 104) = sub_10000825C();
  *(_QWORD *)(v10 + 72) = v14;
  *(_QWORD *)(v10 + 80) = v16;
  os_log(_:dso:log:_:_:)(v7, &_mh_execute_header, v11, a5, 78, 2, v10);

  swift_bridgeObjectRelease(v10);
  dispatch_group_leave(a4);
}

uint64_t sub_1000067D0(void (*a1)(char *), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
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
  void *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  int *v45;
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
  char *v56;
  uint64_t v57;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  void (*v65)(char *);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;

  v68 = a2;
  v65 = a1;
  v2 = type metadata accessor for TimelineReloadPolicy(0);
  __chkstk_darwin(v2);
  v64 = (char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v4);
  v6 = (void **)((char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_1000033B8(&qword_100051280);
  __chkstk_darwin(v7);
  v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Date(0);
  v62 = *(_QWORD *)(v10 - 8);
  v63 = v10;
  __chkstk_darwin(v10);
  v12 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000033B8(&qword_100051350);
  v66 = *(_QWORD *)(v13 - 8);
  v67 = v13;
  __chkstk_darwin(v13);
  v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000511F8 != -1)
    swift_once(&qword_1000511F8, sub_10003D32C);
  v16 = qword_100054900;
  v17 = sub_1000033B8((uint64_t *)&unk_100051990);
  v18 = OS_dispatch_queue.sync<A>(execute:)(&v69, sub_1000083D0, v16, v17);
  v19 = v69;
  if (v69 && (v20 = sub_100017D8C(), v19, v20))
  {
    v21 = sub_1000033B8(&qword_100051360);
    v22 = type metadata accessor for FitnessWidgetProvider.ActivityEntry(0);
    v60 = v4;
    v23 = (int *)v22;
    v24 = *(_QWORD *)(v22 - 8);
    v25 = *(_QWORD *)(v24 + 72);
    v26 = *(unsigned __int8 *)(v24 + 80);
    v27 = (v26 + 32) & ~v26;
    v28 = swift_allocObject(v21, v27 + v25, v26 | 7);
    v61 = v28;
    *(_OWORD *)(v28 + 16) = xmmword_10003FCE0;
    v29 = v28 + v27;
    Date.init()(v28);
    v30 = qword_100054900;
    sub_10000FB8C((uint64_t)v9);
    v31 = type metadata accessor for TimelineEntryRelevance(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v9, 0, 1, v31);
    OS_dispatch_queue.sync<A>(execute:)(&v69, sub_1000083D0, v30, v17);
    v59 = v69;
    v32 = (uint64_t)v6;
    OS_dispatch_queue.sync<A>(execute:)(v6, sub_1000083E8, qword_100054900, v60);
    v33 = qword_100054900;
    v34 = sub_1000033B8(&qword_1000513A0);
    OS_dispatch_queue.sync<A>(execute:)(&v69, sub_100008400, v33, v34);
    v35 = v69;
    LOBYTE(v21) = *(_BYTE *)(qword_100054900
                           + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
    (*(void (**)(uint64_t, char *, uint64_t))(v62 + 32))(v29, v12, v63);
    sub_1000082A0((uint64_t)v9, v29 + v23[5], &qword_100051280);
    *(_QWORD *)(v29 + v23[6]) = v59;
    v36 = sub_1000082A0(v32, v29 + v23[7], (uint64_t *)&unk_100051980);
    *(_QWORD *)(v29 + v23[8]) = v35;
    *(_BYTE *)(v29 + v23[9]) = 0;
    *(_BYTE *)(v29 + v23[10]) = v21;
    v37 = v64;
    static TimelineReloadPolicy.atEnd.getter(v36);
    v38 = sub_100008304(qword_100051338, type metadata accessor for FitnessWidgetProvider.ActivityEntry, (uint64_t)&unk_10003FD58);
    v39 = Timeline.init(entries:policy:)(v61, v37, v23, v38);
    v40 = static os_log_type_t.default.getter(v39);
    v41 = HKLogActivity;
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v41, "Returning the latest data to the widget!", 40, 2, &_swiftEmptyArrayStorage);

  }
  else
  {
    v42 = static os_log_type_t.default.getter(v18);
    v43 = HKLogActivity;
    os_log(_:dso:log:_:_:)(v42, &_mh_execute_header, v43, "Activity summary doesn't have a valid move goal, return placeholder", 67, 2, &_swiftEmptyArrayStorage);

    v44 = sub_1000033B8(&qword_100051360);
    v45 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry(0);
    v46 = *((_QWORD *)v45 - 1);
    v47 = *(_QWORD *)(v46 + 72);
    v48 = *(unsigned __int8 *)(v46 + 80);
    v49 = (v48 + 32) & ~v48;
    v50 = swift_allocObject(v44, v49 + v47, v48 | 7);
    *(_OWORD *)(v50 + 16) = xmmword_10003FCE0;
    v51 = v50 + v49;
    Date.init()(v50);
    v52 = v51 + v45[5];
    v53 = type metadata accessor for TimelineEntryRelevance(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v52, 1, 1, v53);
    v54 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v62 + 56))(v51 + v45[7], 1, 1, v63);
    v55 = *(_BYTE *)(qword_100054900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
    *(_QWORD *)(v51 + v45[6]) = 0;
    *(_QWORD *)(v51 + v45[8]) = 0;
    *(_BYTE *)(v51 + v45[9]) = 1;
    *(_BYTE *)(v51 + v45[10]) = v55;
    v56 = v64;
    static TimelineReloadPolicy.atEnd.getter(v54);
    v57 = sub_100008304(qword_100051338, type metadata accessor for FitnessWidgetProvider.ActivityEntry, (uint64_t)&unk_10003FD58);
    Timeline.init(entries:policy:)(v50, v56, v45, v57);
  }
  v65(v15);
  return (*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v15, v67);
}

uint64_t sub_100006D5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  NSString v4;
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;
  _BYTE v13[8];
  void *v14;

  sub_1000082A0(v1 + 40, (uint64_t)v13, &qword_100051358);
  sub_1000082A0((uint64_t)v13, (uint64_t)&v14, &qword_100051358);
  v3 = v14;
  if (v14)
  {
    v4 = String._bridgeToObjectiveC()();
    v5 = objc_msgSend(v3, "objectForKey:", v4);

    if (v5)
    {
      _bridgeAnyObjectToAny(_:)(v10, v5);
      swift_unknownObjectRelease(v5);
    }
    else
    {
      memset(v10, 0, sizeof(v10));
    }
    sub_1000082A0((uint64_t)v10, (uint64_t)&v11, &qword_100051390);
    if (*((_QWORD *)&v12 + 1))
    {
      v6 = type metadata accessor for Date(0);
      v7 = swift_dynamicCast(a1, &v11, (char *)&type metadata for Any + 8, v6, 6);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v7 ^ 1u, 1, v6);
    }
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }
  sub_1000034BC((uint64_t)&v11, &qword_100051390);
  v9 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a1, 1, 1, v9);
}

uint64_t sub_100006EB0(uint64_t a1, uint64_t (*a2)(__n128), double a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __n128 v10;
  double v12;

  v5 = static os_log_type_t.default.getter(a1);
  v6 = (void *)HKLogActivity;
  v7 = sub_1000033B8(&qword_100051368);
  v8 = swift_allocObject(v7, 72, 7);
  *(_OWORD *)(v8 + 16) = xmmword_10003FCE0;
  *(_QWORD *)(v8 + 56) = &type metadata for Double;
  *(_QWORD *)(v8 + 64) = &protocol witness table for Double;
  *(double *)(v8 + 32) = a3;
  v9 = v6;
  os_log(_:dso:log:_:_:)(v5, &_mh_execute_header, v9, "Starting the queries because it took over %f seconds to data sync.", v12);

  v10 = swift_bridgeObjectRelease(v8);
  return a2(v10);
}

void sub_100006F80(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

uint64_t sub_100006FD0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
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
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  double v33;
  void *v34;
  _QWORD *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  _QWORD aBlock[5];
  _QWORD *v55;

  v52 = a4;
  v53 = a6;
  v50 = a5;
  v51 = type metadata accessor for DispatchWorkItemFlags(0);
  v7 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v15 = static os_log_type_t.error.getter(v12);
    v49 = v11;
    v16 = v10;
    v17 = v7;
    v18 = v15;
    v19 = (void *)HKLogActivity;
    v20 = sub_1000033B8(&qword_100051368);
    v21 = swift_allocObject(v20, 112, 7);
    *(_OWORD *)(v21 + 16) = xmmword_10003FCD0;
    v22 = v19;
    v23 = Date.timeIntervalSinceNow.getter();
    *(_QWORD *)(v21 + 56) = &type metadata for Double;
    *(_QWORD *)(v21 + 64) = &protocol witness table for Double;
    *(double *)(v21 + 32) = -v23;
    aBlock[0] = a2;
    v24 = sub_1000033B8(&qword_100051380);
    v25 = Optional.debugDescription.getter(v24);
    v27 = v26;
    *(_QWORD *)(v21 + 96) = &type metadata for String;
    *(_QWORD *)(v21 + 104) = sub_10000825C();
    *(_QWORD *)(v21 + 72) = v25;
    *(_QWORD *)(v21 + 80) = v27;
    v28 = v18;
    v7 = v17;
    v10 = v16;
    v11 = v49;
    os_log(_:dso:log:_:_:)(v28, &_mh_execute_header, v22, "Data sync request failed after %f seconds with error: %{public}@", 64, 2, v21);

  }
  else
  {
    v29 = static os_log_type_t.default.getter(v12);
    v30 = (void *)HKLogActivity;
    v31 = sub_1000033B8(&qword_100051368);
    v21 = swift_allocObject(v31, 72, 7);
    *(_OWORD *)(v21 + 16) = xmmword_10003FCE0;
    v32 = v30;
    v33 = Date.timeIntervalSinceNow.getter();
    *(_QWORD *)(v21 + 56) = &type metadata for Double;
    *(_QWORD *)(v21 + 64) = &protocol witness table for Double;
    *(double *)(v21 + 32) = -v33;
    os_log(_:dso:log:_:_:)(v29, &_mh_execute_header, v32, "Data sync request completed after %f seconds.", v48);

  }
  swift_bridgeObjectRelease(v21);
  sub_100008158();
  v34 = (void *)static OS_dispatch_queue.main.getter();
  v35 = (_QWORD *)swift_allocObject(&unk_10004E120, 40, 7);
  v36 = v52;
  v37 = v53;
  v38 = v50;
  v35[2] = v52;
  v35[3] = v38;
  v35[4] = v37;
  aBlock[4] = sub_1000081C0;
  v55 = v35;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CBA8;
  aBlock[3] = &unk_10004E138;
  v39 = _Block_copy(aBlock);
  v40 = v55;
  v41 = v36;
  swift_retain(v37);
  v42 = swift_release(v40);
  static DispatchQoS.unspecified.getter(v42);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v43 = sub_100008304(&qword_100051370, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v44 = sub_1000033B8((uint64_t *)&unk_100051960);
  v45 = sub_100008210();
  v46 = v51;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v44, v45, v51, v43);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v14, v9, v39);
  _Block_release(v39);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v46);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

void sub_100007354(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  id v7;

  v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

uint64_t sub_1000073B4@<X0>(uint64_t a1@<X8>)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  char v8;

  Date.init()();
  v2 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry(0);
  v3 = a1 + v2[5];
  v4 = type metadata accessor for TimelineEntryRelevance(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = a1 + v2[7];
  v6 = type metadata accessor for Date(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  if (qword_1000511F8 != -1)
    result = swift_once(&qword_1000511F8, sub_10003D32C);
  v8 = *(_BYTE *)(qword_100054900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
  *(_QWORD *)(a1 + v2[6]) = 0;
  *(_QWORD *)(a1 + v2[8]) = 0;
  *(_BYTE *)(a1 + v2[9]) = 1;
  *(_BYTE *)(a1 + v2[10]) = v8;
  return result;
}

uint64_t sub_1000074A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000049D0(a1, a2, a3);
}

uint64_t sub_1000074DC(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  return sub_100005394(a1, a2, a3);
}

uint64_t sub_100007514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to TimelineProvider.relevances()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100007580;
  return TimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_100007580()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000075C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to TimelineProvider.relevance()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100008668;
  return TimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_100007634()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for TimelineProviderContext(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v7 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v7 + 32));

  return swift_deallocObject(v0, v7 + 48, v5);
}

id sub_1000076D8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(type metadata accessor for TimelineProviderContext(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_100005CD0(v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8), (_OWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_100007728(uint64_t a1)
{
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 8));
  return a1;
}

id *sub_100007750(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

uint64_t sub_100007778()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000779C(uint64_t a1)
{
  uint64_t v1;

  return sub_100006EB0(a1, *(uint64_t (**)(__n128))(v1 + 24), *(double *)(v1 + 16));
}

uint64_t sub_1000077A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000077B8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000077C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v1 = type metadata accessor for Date(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  swift_release(*(_QWORD *)(v0 + v7 + 8));
  return swift_deallocObject(v0, v7 + 16, v5);
}

uint64_t sub_100007850(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = *(_QWORD *)(type metadata accessor for Date(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_100006FD0(a1, a2, v2 + v6, *(void **)(v2 + v7), *(_QWORD *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

size_t sub_1000078C0(size_t a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_1000078D4(a1, a2, a3, a4, &qword_1000513C0, (uint64_t (*)(_QWORD))&type metadata accessor for Date);
}

size_t sub_1000078D4(size_t result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
  if (!v12)
  {
    v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_1000033B8(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  result = j__malloc_size(v18);
  if (!v15)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v17 == 0x8000000000000000 && v15 == -1)
    goto LABEL_29;
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(result - v17) / v15);
LABEL_19:
  v20 = a6(0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v23 = (char *)v18 + v22;
  v24 = (char *)a4 + v22;
  if ((v8 & 1) != 0)
  {
    if (v18 < a4 || v23 >= &v24[*(_QWORD *)(v21 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack(v23, v24, v11, v20);
    }
    else if (v18 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v23, v24, v11, v20);
  }
  swift_bridgeObjectRelease(a4);
  return (size_t)v18;
}

size_t sub_100007A48(size_t a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_100007A70(a1, a2, a3, a4, &qword_1000513C8, (uint64_t *)&unk_100051980);
}

size_t sub_100007A5C(size_t a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_100007A70(a1, a2, a3, a4, &qword_1000513B0, &qword_1000513B8);
}

size_t sub_100007A70(size_t result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
  if (!v12)
  {
    v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_1000033B8(a5);
  v14 = *(_QWORD *)(sub_1000033B8(a6) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  result = j__malloc_size(v18);
  if (!v15)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v17 == 0x8000000000000000 && v15 == -1)
    goto LABEL_29;
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(result - v17) / v15);
LABEL_19:
  v20 = sub_1000033B8(a6);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v23 = (char *)v18 + v22;
  v24 = (char *)a4 + v22;
  if ((v8 & 1) != 0)
  {
    if (v18 < a4 || v23 >= &v24[*(_QWORD *)(v21 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack(v23, v24, v11, v20);
    }
    else if (v18 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v23, v24, v11, v20);
  }
  swift_bridgeObjectRelease(a4);
  return (size_t)v18;
}

char *sub_100007BE4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

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
    v10 = sub_1000033B8(&qword_1000513A8);
    v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8])
      memmove(v14, v15, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_100007CDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  _QWORD *v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;

  v2 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v2);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000033B8(&qword_100051280);
  __chkstk_darwin(v5);
  v43 = (uint64_t)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry(0);
  v39 = *((_QWORD *)v7 - 1);
  __chkstk_darwin(v7);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v40 - 8);
  __chkstk_darwin(v40);
  v42 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v36 - v13;
  result = Date.init()(v15);
  if (a1 < 0)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  if (a1)
  {
    v41 = v4;
    v17 = 0;
    v18 = &_swiftEmptyArrayStorage;
    v19 = 0.0;
    v37 = a1;
    while (v17 != a1)
    {
      v20 = 0;
      v38 = v17 + 1;
      v21 = v19;
      do
      {
        v22 = *(double *)((char *)&off_10004DA28 + v20 + 32);
        v23 = *(double *)((char *)&off_10004DA28 + v20 + 40);
        v24 = *(double *)((char *)&off_10004DA28 + v20 + 48);
        v25 = *(double *)((char *)&off_10004DA28 + v20 + 56);
        v26 = *(double *)((char *)&off_10004DA28 + v20 + 64);
        v19 = v21 + 1.0;
        Date.addingTimeInterval(_:)(result, (v21 + 1.0) * 5.0);
        v27 = type metadata accessor for TimelineEntryRelevance(0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v43, 1, 1, v27);
        if (v22 >= 0.0)
        {
          v30 = sub_1000185CC(v22, v23, v24, v25, v26);
          v28 = v40;
          result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v41, 1, 1, v40);
          if ((~*(_QWORD *)&v21 & 0x7FF0000000000000) == 0)
          {
            __break(1u);
LABEL_22:
            __break(1u);
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
          if (v21 <= -9.22337204e18)
            goto LABEL_22;
          if (v21 >= 9.22337204e18)
            goto LABEL_23;
          v33 = sub_100018B70((uint64_t)v21 % 14);
          v31 = v10;
          v32 = v33;
          v29 = (uint64_t)v41;
        }
        else
        {
          v28 = v40;
          v29 = (uint64_t)v41;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v41, 1, 1, v40);
          v30 = 0;
          v31 = v10;
          v32 = 0;
        }
        v10 = v31;
        (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v9, v42, v28);
        sub_1000082A0(v43, (uint64_t)&v9[v7[5]], &qword_100051280);
        *(_QWORD *)&v9[v7[6]] = v30;
        sub_1000082A0(v29, (uint64_t)&v9[v7[7]], (uint64_t *)&unk_100051980);
        *(_QWORD *)&v9[v7[8]] = v32;
        v9[v7[9]] = 0;
        v9[v7[10]] = 0;
        if ((swift_isUniquelyReferenced_nonNull_native(v18) & 1) == 0)
          v18 = (_QWORD *)sub_1000078D4(0, v18[2] + 1, 1, v18, &qword_100051360, type metadata accessor for FitnessWidgetProvider.ActivityEntry);
        v35 = v18[2];
        v34 = v18[3];
        if (v35 >= v34 >> 1)
          v18 = (_QWORD *)sub_1000078D4(v34 > 1, v35 + 1, 1, v18, &qword_100051360, type metadata accessor for FitnessWidgetProvider.ActivityEntry);
        v18[2] = v35 + 1;
        result = sub_100008110((uint64_t)v9, (uint64_t)v18+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(_QWORD *)(v39 + 72) * v35);
        v20 += 40;
        v21 = v21 + 1.0;
      }
      while (v20 != 560);
      a1 = v37;
      v17 = v38;
      if (v38 == v37)
        goto LABEL_20;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v18 = &_swiftEmptyArrayStorage;
LABEL_20:
  (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v40);
  return (uint64_t)v18;
}

uint64_t sub_100008110(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FitnessWidgetProvider.ActivityEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100008158()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051950;
  if (!qword_100051950)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100051950);
  }
  return result;
}

uint64_t sub_100008194()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

id sub_1000081C0()
{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(id);
  id result;

  v1 = *(void **)(v0 + 16);
  v2 = *(uint64_t (**)(id))(v0 + 24);
  result = objc_msgSend(v1, "isValid");
  if ((_DWORD)result)
    return (id)v2(objc_msgSend(v1, "invalidate"));
  return result;
}

unint64_t sub_100008210()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051378;
  if (!qword_100051378)
  {
    v1 = sub_1000036E4((uint64_t *)&unk_100051960);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100051378);
  }
  return result;
}

unint64_t sub_10000825C()
{
  unint64_t result;

  result = qword_100051388;
  if (!qword_100051388)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100051388);
  }
  return result;
}

uint64_t sub_1000082A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000033B8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_1000082E8(uint64_t a1, uint64_t a2)
{
  sub_100008430(a1, a2, (uint64_t)"Summary query for timeline returned after %f seconds with error: %{public}@", (uint64_t)"Skipping retrieving rings image for timeline.");
}

uint64_t sub_100008304(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100008348()
{
  uint64_t v0;

  return sub_1000067D0(*(void (**)(char *))(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_100008358(uint64_t a1, uint64_t a2)
{
  sub_100008364(a1, a2, (uint64_t)"Statistics query for timeline returned after %f seconds with error: %{public}@");
}

void sub_100008364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;

  v7 = *(_QWORD *)(type metadata accessor for Date(0) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  sub_1000066B4(a1, a2, v3 + v8, *(NSObject **)(v3 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFF8)), a3);
}

id sub_1000083D0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_10000CBF4(v1, a1);
}

uint64_t sub_1000083E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000CCD4(v1, a1);
}

id sub_100008400@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_10000D0B4(v1, a1);
}

void sub_10000841C(uint64_t a1, uint64_t a2)
{
  sub_100008430(a1, a2, (uint64_t)"Summary query for snapshot returned after %f seconds with error: %{public}@", (uint64_t)"Skipping retrieving rings image for snapshot.");
}

void sub_100008430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  unint64_t v10;

  v9 = *(_QWORD *)(type metadata accessor for Date(0) - 8);
  v10 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  sub_100006438(a1, a2, v4 + v10, *(NSObject **)(v4 + ((*(_QWORD *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFF8)), a3, a4);
}

void sub_1000084B0(uint64_t a1, uint64_t a2)
{
  sub_100008364(a1, a2, (uint64_t)"Statistics query for snapshot returned after %f seconds with error: %{public}@");
}

uint64_t sub_1000084C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for Date(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_100008534(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(type metadata accessor for Date(0) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_1000065A0(a1, a2, v2 + v6, *(NSObject **)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_10000859C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));

  return swift_deallocObject(v0, 80, 7);
}

uint64_t sub_1000085D8()
{
  uint64_t v0;

  return sub_100004FF8(*(void (**)(char *))(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1000085E4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FitnessWidgetProvider.ActivityEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008620(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8(&qword_100051280);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10000868C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_1000033B8(&qword_1000513D0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (uint64_t *)((char *)v4 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = *(uint64_t *)((char *)a2 + v9);
    *(uint64_t *)((char *)v4 + v9) = v13;
    swift_bridgeObjectRetain(v12);
  }
  swift_retain(v13);
  return v4;
}

uint64_t sub_100008730(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(a2 + 20) + 8));
  return swift_release(*(_QWORD *)(a1 + *(int *)(a2 + 24)));
}

uint64_t sub_100008788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + v8) = v12;
  swift_bridgeObjectRetain(v11);
  swift_retain(v12);
  return a1;
}

uint64_t sub_100008804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v10 = v9[1];
  v11 = v8[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  v12 = *(int *)(a3 + 24);
  v13 = *(_QWORD *)(a2 + v12);
  v14 = *(_QWORD *)(a1 + v12);
  *(_QWORD *)(a1 + v12) = v13;
  swift_retain(v13);
  swift_release(v14);
  return a1;
}

uint64_t sub_1000088A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_100008908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  v12 = v8[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  v13 = *(int *)(a3 + 24);
  v14 = *(_QWORD *)(a1 + v13);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  swift_release(v14);
  return a1;
}

uint64_t sub_10000898C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100008998);
}

uint64_t sub_100008998(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1000033B8(&qword_1000513D0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_100008A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100008A28);
}

uint64_t sub_100008A28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1000033B8(&qword_1000513D0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for HeaderLabel(uint64_t a1)
{
  uint64_t result;

  result = qword_100051430;
  if (!qword_100051430)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for HeaderLabel);
  return result;
}

void sub_100008AE4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  sub_100008B64(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_10003FE08;
    v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

void sub_100008B64(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100051440)
  {
    v2 = sub_100008BBC();
    v3 = type metadata accessor for ScaledMetric(a1, &type metadata for CGFloat, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100051440);
  }
}

unint64_t sub_100008BBC()
{
  unint64_t result;

  result = qword_100051448;
  if (!qword_100051448)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_100051448);
  }
  return result;
}

uint64_t sub_100008C00(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100041BCC, 1);
}

uint64_t sub_100008C10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  __n128 v41;
  uint64_t result;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v2 = v1;
  v4 = sub_1000033B8(&qword_100051480);
  __chkstk_darwin(v4);
  v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for HeaderLabel(0);
  v8 = (uint64_t *)(v1 + *(int *)(v7 + 20));
  v10 = *v8;
  v9 = v8[1];
  v45 = v10;
  v46 = v9;
  v11 = sub_100008E40();
  v45 = StringProtocol.localizedUppercase.getter(&type metadata for String, v11);
  v46 = v12;
  v13 = Text.init<A>(_:)(&v45, &type metadata for String, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18 & 1;
  v20 = Text.foregroundColor(_:)(*(_QWORD *)(v2 + *(int *)(v7 + 24)), v13, v14, v19, v16);
  v22 = v21;
  v44 = v23;
  v25 = v24 & 1;
  sub_100008E84(v13, v15, v19);
  swift_bridgeObjectRelease(v17);
  v26 = sub_1000033B8(&qword_1000513D0);
  v27 = ScaledMetric.wrappedValue.getter(&v45, v26);
  v28 = *(double *)&v45;
  v29 = static Font.Weight.semibold.getter(v27);
  v30 = enum case for Font.Design.rounded(_:);
  v31 = type metadata accessor for Font.Design(0);
  v32 = *(_QWORD *)(v31 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 104))(v6, v30, v31);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v6, 0, 1, v31);
  v33 = static Font.system(size:weight:design:)(*(_QWORD *)&v29, 0, v6, v28);
  sub_100008E94((uint64_t)v6);
  v34 = v44;
  v35 = Text.font(_:)(v33, v20, v22, v25, v44);
  v37 = v36;
  LOBYTE(v31) = v38;
  v40 = v39;
  swift_release(v33);
  sub_100008E84(v20, v22, v25);
  v41 = swift_bridgeObjectRelease(v34);
  result = swift_getKeyPath(&unk_10003FE70, v41);
  *(_QWORD *)a1 = v35;
  *(_QWORD *)(a1 + 8) = v37;
  *(_BYTE *)(a1 + 16) = v31 & 1;
  *(_QWORD *)(a1 + 24) = v40;
  *(_QWORD *)(a1 + 32) = result;
  *(_QWORD *)(a1 + 40) = 1;
  *(_BYTE *)(a1 + 48) = 0;
  return result;
}

unint64_t sub_100008E40()
{
  unint64_t result;

  result = qword_100051488;
  if (!qword_100051488)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100051488);
  }
  return result;
}

uint64_t sub_100008E84(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100008E94(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000033B8(&qword_100051480);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100008EE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051490;
  if (!qword_100051490)
  {
    v1 = sub_1000036E4(&qword_100051498);
    sub_100008F4C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051490);
  }
  return result;
}

unint64_t sub_100008F4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000514A0;
  if (!qword_1000514A0)
  {
    v1 = sub_1000036E4(&qword_1000514A8);
    result = swift_getWitnessTable(&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000514A0);
  }
  return result;
}

uint64_t destroy for StandChart(_QWORD *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t initializeWithCopy for StandChart(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)a1 = *a2;
  *(_WORD *)(a1 + 8) = *((_WORD *)a2 + 4);
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t *assignWithCopy for StandChart(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRelease(v4);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  *((_BYTE *)a1 + 9) = *((_BYTE *)a2 + 9);
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

__n128 initializeWithTake for StandChart(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t *assignWithTake for StandChart(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  *((_BYTE *)a1 + 9) = *((_BYTE *)a2 + 9);
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  return a1;
}

uint64_t getEnumTagSinglePayload for StandChart(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StandChart(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for StandChart()
{
  return &type metadata for StandChart;
}

uint64_t sub_100009158(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100041C64, 1);
}

void sub_100009168(uint64_t a1)
{
  sub_100009190(a1, (SEL *)&selRef_gradientLightColor, &qword_1000514B0);
}

void sub_10000917C(uint64_t a1)
{
  sub_100009190(a1, (SEL *)&selRef_gradientDarkColor, &qword_1000514B8);
}

void sub_100009190(uint64_t a1, SEL *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_msgSend((id)objc_opt_self(ARUIMetricColors), "sedentaryColors");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, *a2);

    if (v7)
    {
      *a3 = Color.init(_:)(v7);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_100009210()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  type metadata accessor for Color.RGBColorSpace(0);
  __chkstk_darwin();
  v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v2 + 104))(v1, enum case for Color.RGBColorSpace.sRGB(_:));
  result = Color.init(_:white:opacity:)(v1, 0.956862745, 1.0);
  qword_1000514C0 = result;
  return result;
}

uint64_t sub_100009298@<X0>(int a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  __n128 v32;
  uint64_t KeyPath;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t OpaqueTypeConformance2;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __n128 v57;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  int v64;
  int v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;

  v76 = a6;
  v77 = a5;
  v64 = a3;
  v65 = a1;
  v8 = type metadata accessor for AccessibilityChildBehavior(0);
  v74 = *(_QWORD *)(v8 - 8);
  v75 = v8;
  v9 = __chkstk_darwin(v8);
  v73 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ColorRenderingMode(0, v9);
  v69 = *(_QWORD *)(v11 - 8);
  v70 = v11;
  __chkstk_darwin(v11);
  v67 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for LayoutDirection(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1000033B8(&qword_1000514C8);
  __chkstk_darwin(v17);
  v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1000033B8(&qword_1000514D0);
  __chkstk_darwin(v20);
  v22 = (char *)&v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_1000033B8(&qword_1000514D8);
  v68 = *(_QWORD *)(v66 - 8);
  __chkstk_darwin(v66);
  v59 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_1000033B8(&qword_1000514E0);
  v25 = *(_QWORD *)(v24 - 8);
  v71 = v24;
  v72 = v25;
  __chkstk_darwin(v24);
  v63 = (char *)&v59 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B174(a2, a4);
  v28 = v27;
  v61 = a2;
  v62 = a4;
  sub_10000ACD8(a2, a4);
  v30 = v29;
  v60 = v29;
  *(_QWORD *)v19 = static HorizontalAlignment.leading.getter();
  *((_QWORD *)v19 + 1) = 0x4008000000000000;
  v19[16] = 0;
  v31 = &v19[*(int *)(sub_1000033B8(&qword_1000514E8) + 44)];
  v64 &= 0x101u;
  sub_10000970C(a2, v64, a4, v77, v28, v30, v65, v31);
  v32 = swift_bridgeObjectRelease(v28);
  KeyPath = swift_getKeyPath(&unk_10003FF20, v32);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, enum case for LayoutDirection.leftToRight(_:), v13);
  v34 = (uint64_t *)&v22[*(int *)(v20 + 36)];
  v35 = sub_1000033B8(&qword_1000514F0);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))((char *)v34 + *(int *)(v35 + 28), v16, v13);
  *v34 = KeyPath;
  sub_100003478((uint64_t)v19, (uint64_t)v22, &qword_1000514C8);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  sub_1000034BC((uint64_t)v19, &qword_1000514C8);
  v37 = v69;
  v36 = v70;
  v38 = v67;
  (*(void (**)(char *, _QWORD, uint64_t))(v69 + 104))(v67, enum case for ColorRenderingMode.nonLinear(_:), v70);
  v39 = sub_10000B3E0();
  v40 = v59;
  View.drawingGroup(opaque:colorMode:)(0, v38, v20, v39);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v36);
  v41 = sub_1000034BC((uint64_t)v22, &qword_1000514D0);
  v42 = v73;
  static AccessibilityChildBehavior.ignore.getter(v41);
  v78 = v20;
  v79 = v39;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v78, &opaque type descriptor for <<opaque return type of View.drawingGroup(opaque:colorMode:)>>, 1);
  v44 = v63;
  v45 = v66;
  View.accessibilityElement(children:)(v42, v66, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v42, v75);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v40, v45);
  v46 = v60;
  sub_10000A168(v60, v61, v64, v62);
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53 & 1;
  swift_bridgeObjectRelease(v46);
  v78 = v45;
  v79 = OpaqueTypeConformance2;
  v55 = swift_getOpaqueTypeConformance2(&v78, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  v56 = v71;
  View.accessibility(label:)(v48, v50, v54, v52, v71, v55);
  sub_100008E84(v48, v50, v54);
  v57 = swift_bridgeObjectRelease(v52);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v72 + 8))(v44, v56, v57);
}

uint64_t sub_10000970C@<X0>(uint64_t a1@<X0>, __int16 a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, _QWORD *a8@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _BYTE v28[12];
  int v29;
  uint64_t v30;
  _QWORD *v31;

  v29 = a7;
  v30 = a6;
  v31 = a8;
  v13 = sub_1000033B8(&qword_100051528);
  __chkstk_darwin(v13);
  v15 = &v28[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v16);
  v18 = &v28[-v17];
  v19 = swift_allocObject(&unk_10004E428, 56, 7);
  *(_QWORD *)(v19 + 16) = a1;
  *(_BYTE *)(v19 + 24) = a2 & 1;
  *(_BYTE *)(v19 + 25) = HIBYTE(a2) & 1;
  *(_QWORD *)(v19 + 32) = a3;
  *(_QWORD *)(v19 + 40) = a4;
  *(_QWORD *)(v19 + 48) = a5;
  swift_bridgeObjectRetain(a5);
  v20 = swift_bridgeObjectRetain(a1);
  result = static VerticalAlignment.bottom.getter(v20);
  *(_QWORD *)v18 = result;
  *((_QWORD *)v18 + 1) = 0;
  v18[16] = 0;
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1000033B8(&qword_100051530);
    v22 = swift_allocObject(&unk_10004E450, 57, 7);
    *(_QWORD *)(v22 + 16) = a1;
    *(_BYTE *)(v22 + 24) = a2 & 1;
    *(_BYTE *)(v22 + 25) = HIBYTE(a2) & 1;
    *(_QWORD *)(v22 + 32) = a3;
    *(_QWORD *)(v22 + 40) = a4;
    v23 = v30;
    *(_QWORD *)(v22 + 48) = v30;
    *(_BYTE *)(v22 + 56) = v29 & 1;
    swift_bridgeObjectRetain(v23);
    swift_bridgeObjectRetain(a1);
    v24 = sub_1000033B8(&qword_100051538);
    v25 = sub_10000BCD8();
    ForEach<>.init(_:content:)(0, a3, sub_10000BCAC, v22, v24, v25);
    sub_100003478((uint64_t)v18, (uint64_t)v15, &qword_100051528);
    v26 = v31;
    *v31 = sub_10000BC44;
    v26[1] = v19;
    v27 = sub_1000033B8(&qword_100051550);
    sub_100003478((uint64_t)v15, (uint64_t)v26 + *(int *)(v27 + 48), &qword_100051528);
    swift_retain(v19);
    sub_1000034BC((uint64_t)v18, &qword_100051528);
    sub_1000034BC((uint64_t)v15, &qword_100051528);
    return swift_release(v19);
  }
  return result;
}

_QWORD *sub_100009918@<X0>(char *a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14;

  *(_QWORD *)a7 = static VerticalAlignment.center.getter();
  *(_QWORD *)(a7 + 8) = 0;
  *(_BYTE *)(a7 + 16) = 0;
  v14 = sub_1000033B8(&qword_100051558);
  return sub_1000099A4(a2, a3 & 0x101, a4, a5, a1, a6, a7 + *(int *)(v14 + 44));
}

_QWORD *sub_1000099A4@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int8 v58;
  uint64_t v59;
  unsigned __int8 v60;
  uint64_t v61;
  uint64_t v62;

  v52 = a5;
  v53 = a6;
  v55 = a4;
  v56 = a1;
  v54 = a2;
  v9 = type metadata accessor for GeometryProxy(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  __chkstk_darwin(v9);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000033B8(&qword_100051560);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v19 = (char *)&v42 - v18;
  v21 = static Alignment.center.getter(v20);
  result = _FrameLayout.init(width:height:alignment:)(&v57, 0x3FF0000000000000, 0, 0x401C000000000000, 0, v21, v22);
  if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    v50 = v61;
    v51 = v62;
    v49 = v60;
    v48 = v59;
    v47 = v58;
    v46 = v57;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v52, v9);
    v24 = *(unsigned __int8 *)(v10 + 80);
    v52 = v16;
    v43 = v19;
    v44 = v13;
    v25 = v53;
    v26 = (v24 + 48) & ~v24;
    v45 = v14;
    v27 = (v11 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
    v28 = swift_allocObject(&unk_10004E478, v27 + 8, v24 | 7);
    v29 = v56;
    *(_QWORD *)(v28 + 16) = v56;
    v30 = BYTE1(v54);
    *(_BYTE *)(v28 + 24) = v54 & 1;
    *(_BYTE *)(v28 + 25) = v30 & 1;
    v31 = v55;
    *(_QWORD *)(v28 + 32) = a3;
    *(_QWORD *)(v28 + 40) = v31;
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v28 + v26, v12, v9);
    *(_QWORD *)(v28 + v27) = v25;
    swift_bridgeObjectRetain(v25);
    swift_bridgeObjectRetain(v29);
    v32 = sub_1000033B8(&qword_100051568);
    v33 = sub_100003928(&qword_100051570, &qword_100051568, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v34 = v43;
    ForEach<>.init(_:content:)(0, a3, sub_10000BE64, v28, v32, v33);
    v35 = v44;
    v36 = v45;
    v37 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
    v38 = v52;
    v37(v52, v34, v44);
    *(_BYTE *)a7 = 2;
    *(_QWORD *)(a7 + 8) = v46;
    *(_BYTE *)(a7 + 16) = v47;
    *(_QWORD *)(a7 + 24) = v48;
    *(_BYTE *)(a7 + 32) = v49;
    v39 = v51;
    *(_QWORD *)(a7 + 40) = v50;
    *(_QWORD *)(a7 + 48) = v39;
    v40 = sub_1000033B8(&qword_100051578);
    v37((char *)(a7 + *(int *)(v40 + 48)), v38, v35);
    v41 = *(void (**)(char *, uint64_t))(v36 + 8);
    v41(v34, v35);
    return (_QWORD *)((uint64_t (*)(char *, uint64_t))v41)(v38, v35);
  }
  return result;
}

void sub_100009C68(unint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  __int128 v31;

  if (qword_100051128 != -1)
    swift_once(&qword_100051128, sub_10000917C);
  v10 = qword_1000514B8;
  v11 = qword_100051120;
  swift_retain(qword_1000514B8);
  if (v11 != -1)
    swift_once(&qword_100051120, sub_100009168);
  v12 = qword_1000514B0;
  v13 = swift_retain(qword_1000514B0);
  v15 = GeometryProxy.size.getter(v13);
  v16 = 0.0;
  if (a4)
  {
    if ((a1 & 0x8000000000000000) != 0)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (*(_QWORD *)(a4 + 16) <= a1)
    {
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
      return;
    }
    v14 = *(id *)(a4 + 8 * a1 + 32);
    if (v14)
    {
      v14 = objc_msgSend(v14, "state");
      v17 = 0.4;
      if (v14 != (id)1)
        v17 = 0.0;
      if (v14)
        v16 = v17;
      else
        v16 = 1.0;
    }
  }
  if (__OFADD__(a1, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (!a3)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (a2 == 0x8000000000000000 && a3 == -1)
    goto LABEL_30;
  v18 = a2 / a3;
  if (!(a2 / a3))
    goto LABEL_27;
  if (a1 == 0x7FFFFFFFFFFFFFFFLL && v18 == -1)
    goto LABEL_31;
  v19 = (v15 + -2.0 - (double)a2 + 1.0) / (double)a2;
  if ((uint64_t)(a1 + 1) % v18)
    v20 = 1;
  else
    v20 = 2;
  v21 = static Alignment.center.getter(v14);
  _FrameLayout.init(width:height:alignment:)(&v27, 0x3FF0000000000000, 0, 0x401C000000000000, 0, v21, v22);
  v23 = v27;
  v24 = v28;
  v25 = v29;
  v26 = v30;
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v12;
  *(double *)(a5 + 16) = v19;
  *(double *)(a5 + 24) = v16;
  *(_BYTE *)(a5 + 32) = v20;
  *(_QWORD *)(a5 + 40) = v23;
  *(_BYTE *)(a5 + 48) = v24;
  *(_QWORD *)(a5 + 56) = v25;
  *(_BYTE *)(a5 + 64) = v26;
  *(_OWORD *)(a5 + 72) = v31;
}

void sub_100009E68(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, int a5@<W6>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  __n128 v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[4];
  int v37;
  uint64_t v38;

  v37 = a5;
  v38 = a6;
  v10 = sub_1000033B8(&qword_100051480);
  __chkstk_darwin(v10);
  v12 = &v36[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v13);
  v15 = &v36[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = type metadata accessor for StandChart.LegendLabel(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = &v36[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = __chkstk_darwin(v20);
  v23 = &v36[-v22];
  if (!a3)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (a2 == 0x8000000000000000 && a3 == -1)
    goto LABEL_17;
  v24 = a2 / a3;
  if (!(a2 / a3))
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (a1 == 0x8000000000000000 && v24 == -1)
    goto LABEL_18;
  if (a1 % v24)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v17 + 56))(v38, 1, 1, v16, v21);
    return;
  }
  if (!a4)
  {
    v27 = type metadata accessor for Date(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v15, 1, 1, v27);
    goto LABEL_14;
  }
  if (a1 < 0)
    goto LABEL_19;
  if (*(_QWORD *)(a4 + 16) > (unint64_t)a1)
  {
    v25 = type metadata accessor for Date(0);
    v26 = *(_QWORD *)(v25 - 8);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v26 + 16))(v15, a4+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(_QWORD *)(v26 + 72) * a1, v25);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v15, 0, 1, v25);
LABEL_14:
    v28 = sub_10000BBF4((uint64_t)v15, (uint64_t)v19);
    v19[*(int *)(v16 + 20)] = v37 & 1;
    v29 = *(int *)(v16 + 24);
    v30 = static Font.Weight.semibold.getter(v28);
    v31 = enum case for Font.Design.rounded(_:);
    v32 = type metadata accessor for Font.Design(0);
    v33 = *(_QWORD *)(v32 - 8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v33 + 104))(v12, v31, v32);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v12, 0, 1, v32);
    v34 = static Font.system(size:weight:design:)(*(_QWORD *)&v30, 0, v12, 8.0);
    sub_1000034BC((uint64_t)v12, &qword_100051480);
    *(_QWORD *)&v19[v29] = v34;
    sub_10000BD90((uint64_t)v19, (uint64_t)v23);
    v35 = v38;
    sub_10000BD90((uint64_t)v23, v38);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(v35, 0, 1, v16);
    return;
  }
LABEL_20:
  __break(1u);
}

void sub_10000A168(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  id v25;
  NSString v26;
  NSString v27;
  id v28;
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
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  _QWORD v47[3];

  v8 = sub_1000033B8((uint64_t *)&unk_100051980);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain(a1);
    swift_bridgeObjectRetain(a2);
    sub_10000B47C(0, a4, a1, a2);
    v13 = v12;
    swift_bridgeObjectRelease(a1);
    swift_bridgeObjectRelease(a2);
    v14 = *(_QWORD *)(v13 + 16);
    if (v14)
    {
      v45 = a3;
      v47[0] = &_swiftEmptyArrayStorage;
      sub_100021CD8(0, v14, 0);
      v15 = *(unsigned __int8 *)(v9 + 80);
      v44 = v13;
      v16 = v13 + ((v15 + 32) & ~v15);
      v17 = *(_QWORD *)(v9 + 72);
      v18 = (_QWORD *)v47[0];
      v46 = v17;
      do
      {
        sub_100003478(v16, (uint64_t)v11, (uint64_t *)&unk_100051980);
        v19 = sub_10000B8A8((uint64_t)v11);
        v21 = v20;
        sub_1000034BC((uint64_t)v11, (uint64_t *)&unk_100051980);
        if ((swift_isUniquelyReferenced_nonNull_native(v18) & 1) == 0)
        {
          sub_100021CD8(0, v18[2] + 1, 1);
          v17 = v46;
          v18 = (_QWORD *)v47[0];
        }
        v23 = v18[2];
        v22 = v18[3];
        if (v23 >= v22 >> 1)
        {
          sub_100021CD8((char *)(v22 > 1), v23 + 1, 1);
          v17 = v46;
          v18 = (_QWORD *)v47[0];
        }
        v18[2] = v23 + 1;
        v24 = (char *)&v18[2 * v23];
        *((_QWORD *)v24 + 4) = v19;
        *((_QWORD *)v24 + 5) = v21;
        v16 += v17;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease(v44);
    }
    else
    {
      swift_bridgeObjectRelease(v13);
      v18 = &_swiftEmptyArrayStorage;
    }
    v25 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v26 = String._bridgeToObjectiveC()();
    v27 = String._bridgeToObjectiveC()();
    v28 = objc_msgSend(v25, "localizedStringForKey:value:table:", v26, 0, v27);

    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
    v31 = v30;

    v32 = sub_1000033B8(&qword_100051368);
    v33 = swift_allocObject(v32, 72, 7);
    *(_OWORD *)(v33 + 16) = xmmword_10003FCE0;
    v47[0] = v18;
    v34 = sub_1000033B8(&qword_100051510);
    v35 = sub_100003928(&qword_100051518, &qword_100051510, (uint64_t)&protocol conformance descriptor for [A]);
    v36 = BidirectionalCollection<>.joined(separator:)(44, 0xE100000000000000, v34, v35);
    v38 = v37;
    swift_bridgeObjectRelease(v18);
    *(_QWORD *)(v33 + 56) = &type metadata for String;
    *(_QWORD *)(v33 + 64) = sub_10000825C();
    *(_QWORD *)(v33 + 32) = v36;
    *(_QWORD *)(v33 + 40) = v38;
    v39 = static String.localizedStringWithFormat(_:_:)(v29, v31, v33);
    v41 = v40;
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(v31);
    v47[0] = v39;
    v47[1] = v41;
    v42 = sub_100008E40();
    Text.init<A>(_:)(v47, &type metadata for String, v42);
  }
}

void sub_10000A514(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  __n128 v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;

  if (a4 <= 5.0)
    v8 = a4;
  else
    v8 = 5.0;
  v9 = sub_1000033B8(&qword_100051630);
  v10 = swift_allocObject(v9, 48, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10003FCD0;
  *(_QWORD *)(v10 + 32) = a1;
  *(_QWORD *)(v10 + 40) = a2;
  v41 = v10;
  specialized Array._endMutation()(v10);
  swift_retain(a1);
  swift_retain(a2);
  v11 = Gradient.init(colors:)(v41);
  v12 = static UnitPoint.bottom.getter();
  v14 = v13;
  v15 = static UnitPoint.top.getter();
  v17 = LinearGradient.init(gradient:startPoint:endPoint:)(&v37, v11, v12, v14, v15, v16);
  v18 = v37;
  v36 = v38;
  v19 = v39;
  v20 = v40;
  v21 = static Alignment.center.getter(v17);
  v23 = _FrameLayout.init(width:height:alignment:)(&v41, *(_QWORD *)&v8, 0, *(_QWORD *)&v8, 0, v21, v22);
  v24 = v41;
  v25 = v42;
  v26 = v43;
  v27 = v44;
  v28 = v45;
  v29 = v46;
  v30 = static Edge.Set.all.getter(v23);
  v31.n128_f64[0] = (a4 - v8) * 0.5;
  if (v31.n128_f64[0] <= 0.0)
    v31.n128_f64[0] = 0.0;
  v32 = EdgeInsets.init(_all:)(v31);
  *(double *)a3 = v8;
  *(double *)(a3 + 8) = v8;
  *(_QWORD *)(a3 + 16) = v18;
  *(_OWORD *)(a3 + 24) = v36;
  *(_QWORD *)(a3 + 40) = v19;
  *(_QWORD *)(a3 + 48) = v20;
  *(_WORD *)(a3 + 56) = 256;
  *(_QWORD *)(a3 + 64) = v24;
  *(_BYTE *)(a3 + 72) = v25;
  *(_QWORD *)(a3 + 80) = v26;
  *(_BYTE *)(a3 + 88) = v27;
  *(_QWORD *)(a3 + 96) = v28;
  *(_QWORD *)(a3 + 104) = v29;
  *(_BYTE *)(a3 + 112) = v30;
  *(double *)(a3 + 120) = v32;
  *(_QWORD *)(a3 + 128) = v33;
  *(_QWORD *)(a3 + 136) = v34;
  *(_QWORD *)(a3 + 144) = v35;
  *(_BYTE *)(a3 + 152) = 0;
}

void sub_10000A6C0(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_10000A514(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), a1, *(double *)(v1 + 16));
}

double sub_10000A6CC@<D0>(uint64_t a1@<X8>)
{
  double *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v8;
  double v9;
  char v10;
  double result;
  __int128 v12;
  _OWORD v13[2];
  char v14;
  _QWORD v15[6];

  v3 = type metadata accessor for RoundedCornerStyle(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin();
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = v1[1];
  Path.init()(v13, v5);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, enum case for RoundedCornerStyle.continuous(_:), v3);
  v15[0] = 0x3FF0000000000000;
  v15[1] = 0;
  v15[2] = 0;
  v15[3] = 0x3FF0000000000000;
  v15[4] = 0;
  v15[5] = 0;
  Path.addRoundedRect(in:cornerSize:style:transform:)(v7, v15, 0.0, 0.0, v8, v9, v8 * 0.5, v9 * 0.5);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  v10 = v14;
  result = *(double *)v13;
  v12 = v13[1];
  *(_OWORD *)a1 = v13[0];
  *(_OWORD *)(a1 + 16) = v12;
  *(_BYTE *)(a1 + 32) = v10;
  return result;
}

uint64_t sub_10000A7DC()
{
  return Shape.sizeThatFits(_:)();
}

void (*sub_10000A7F4(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = Animatable<>.animatableData.modify();
  return sub_10000A850;
}

void sub_10000A850(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_10000A880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000CB60();
  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000A8D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000CB60();
  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10000A920(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000CB60();
  return Shape.body.getter(a1, v2);
}

double sub_10000A958@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  id v5;
  NSString v6;
  NSString v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  __n128 v19;
  uint64_t v20;
  __n128 v21;
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  double result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t KeyPath;
  _QWORD v36[2];

  v4 = type metadata accessor for StandChart.LegendLabel(0);
  if (*(_BYTE *)(a1 + *(int *)(v4 + 20)) == 1)
  {
    v5 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v6 = String._bridgeToObjectiveC()();
    v7 = String._bridgeToObjectiveC()();
    v8 = objc_msgSend(v5, "localizedStringForKey:value:table:", v6, 0, v7);

    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v11 = v10;

  }
  else
  {
    v9 = sub_10000B8A8(a1);
    v11 = v12;
  }
  v36[0] = v9;
  v36[1] = v11;
  v13 = sub_100008E40();
  v14 = Text.init<A>(_:)(v36, &type metadata for String, v13);
  v33 = v15;
  v34 = v14;
  v17 = v16;
  v32 = v18;
  KeyPath = swift_getKeyPath(&unk_100040020, v19);
  v20 = *(_QWORD *)(a1 + *(int *)(v4 + 24));
  v22 = swift_getKeyPath(&unk_100040050, v21);
  v23 = qword_100051130;
  swift_retain(v20);
  if (v23 != -1)
    swift_once(&qword_100051130, sub_100009210);
  v25 = v17 & 1;
  v26 = qword_1000514C0;
  v31 = qword_1000514C0;
  v27 = swift_getKeyPath(&unk_100040080, v24);
  v29 = swift_getKeyPath(&unk_1000400B0, v28);
  *(_QWORD *)a2 = v34;
  *(_QWORD *)(a2 + 8) = v33;
  *(_BYTE *)(a2 + 16) = v25;
  *(_QWORD *)(a2 + 24) = v32;
  *(_QWORD *)(a2 + 32) = KeyPath;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v22;
  *(_QWORD *)(a2 + 56) = v20;
  *(_QWORD *)(a2 + 64) = v27;
  *(_QWORD *)(a2 + 72) = v26;
  *(_QWORD *)(a2 + 80) = v29;
  *(_QWORD *)(a2 + 88) = 0x3FEB333333333333;
  *(_QWORD *)(a2 + 96) = 0;
  *(_BYTE *)(a2 + 104) = 1;
  sub_10000C8C8(v34, v33, v25);
  swift_bridgeObjectRetain(v32);
  swift_retain(KeyPath);
  swift_retain(v22);
  swift_retain(v20);
  swift_retain(v27);
  swift_retain_n(v31, 2);
  swift_retain(v29);
  sub_100008E84(v34, v33, v25);
  swift_release(v29);
  swift_release(v31);
  swift_release(v27);
  swift_release(v20);
  swift_release(v22);
  swift_release(KeyPath);
  *(_QWORD *)&result = swift_bridgeObjectRelease(v32).n128_u64[0];
  return result;
}

__n128 sub_10000AC10@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  char v5;
  __n128 result;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  __int128 v16;
  char v17;
  __n128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v3 = static VerticalAlignment.center.getter();
  sub_10000A958(v1, (uint64_t)&v14);
  v4 = v15;
  v5 = v17;
  result = v18;
  v7 = v19;
  v8 = v20;
  v9 = v21;
  v10 = v22;
  v11 = v23;
  v12 = v16;
  v13 = v14;
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 24) = v13;
  *(_BYTE *)(a1 + 40) = v4;
  *(_OWORD *)(a1 + 48) = v12;
  *(_BYTE *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 72) = result;
  *(_OWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 104) = v8;
  *(_QWORD *)(a1 + 112) = v9;
  *(_QWORD *)(a1 + 120) = v10;
  *(_BYTE *)(a1 + 128) = v11;
  return result;
}

uint64_t sub_10000ACB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  if (*(_BYTE *)(v1 + 9))
    v2 = 256;
  else
    v2 = 0;
  return sub_100009298(*(unsigned __int8 *)(v1 + 8), *(_QWORD *)v1, v2 | *(unsigned __int8 *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

void sub_10000ACD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id i;
  void *v27;
  id v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  char *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, _QWORD, uint64_t);
  unsigned int v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;

  v60 = type metadata accessor for Calendar.Component(0);
  v4 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v59 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v6);
  v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Date(0);
  v63 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v58 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v57 = (char *)&v50 - v12;
  __chkstk_darwin(v13);
  v61 = (char *)&v50 - v14;
  __chkstk_darwin(v15);
  v17 = (char *)&v50 - v16;
  v18 = type metadata accessor for Calendar(0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = static Calendar.current.getter(v22);
  v65 = v17;
  v24 = Date.init()(v23);
  v62 = v4;
  if (!a1)
    goto LABEL_9;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 >= 0)
      v49 = a1 & 0xFFFFFFFFFFFFFF8;
    else
      v49 = a1;
    swift_bridgeObjectRetain(a1);
    if (_CocoaArrayWrapper.endIndex.getter(v49))
    {
      swift_bridgeObjectRetain(a1);
      v25 = _CocoaArrayWrapper.endIndex.getter(v49);
      swift_bridgeObjectRelease(a1);
      if ((v25 & 0x8000000000000000) != 0)
        goto LABEL_34;
      if (v25)
      {
LABEL_4:
        v24 = sub_100021C50(v25);
        if ((a1 & 0xC000000000000001) != 0)
          goto LABEL_31;
        if ((v24 & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (v24 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          for (i = *(id *)(a1 + 8 * v24 + 32);
                ;
                i = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v24, a1))
          {
            v27 = i;
            v28 = objc_msgSend(i, "timeStamp", swift_bridgeObjectRelease(a1).n128_f64[0]);
            v29 = v61;
            Date.init(timeIntervalSinceReferenceDate:)(v28);

            v30 = v63;
            v31 = v65;
            (*(void (**)(char *, uint64_t))(v63 + 8))(v65, v9);
            v24 = (*(uint64_t (**)(char *, char *, uint64_t))(v30 + 32))(v31, v29, v9);
LABEL_9:
            if ((a2 & 0x8000000000000000) == 0)
              break;
LABEL_30:
            __break(1u);
LABEL_31:
            ;
          }
          goto LABEL_10;
        }
        __break(1u);
LABEL_34:
        __break(1u);
        return;
      }
      __break(1u);
    }
  }
  else
  {
    v25 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
    if (v25)
      goto LABEL_4;
  }
  swift_bridgeObjectRelease(a1);
  if (a2 < 0)
    goto LABEL_30;
LABEL_10:
  v32 = a2;
  v64 = v9;
  v51 = v19;
  v52 = v18;
  if (a2)
  {
    v56 = v8;
    v33 = 0;
    v55 = enum case for Calendar.Component.hour(_:);
    v34 = v63;
    v54 = *(void (**)(char *, _QWORD, uint64_t))(v62 + 104);
    v35 = (char *)&_swiftEmptyArrayStorage;
    v53 = a2;
    v36 = v60;
    do
    {
      v37 = v59;
      v54(v59, v55, v36);
      v38 = v61;
      Calendar.startOfDay(for:)(v65);
      v39 = (uint64_t)v56;
      Calendar.date(byAdding:value:to:wrappingComponents:)(v37, v33, v38, 0);
      v40 = *(void (**)(char *, uint64_t))(v34 + 8);
      v41 = v38;
      v42 = v64;
      v40(v41, v64);
      v43 = v37;
      v44 = v39;
      (*(void (**)(char *, uint64_t))(v62 + 8))(v43, v36);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v39, 1, v42) == 1)
      {
        sub_1000034BC(v39, (uint64_t *)&unk_100051980);
      }
      else
      {
        v45 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 32);
        v46 = v57;
        v45(v57, v44, v42);
        (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v58, v46, v42);
        if ((swift_isUniquelyReferenced_nonNull_native(v35) & 1) == 0)
          v35 = (char *)sub_1000078C0(0, *((_QWORD *)v35 + 2) + 1, 1, v35);
        v48 = *((_QWORD *)v35 + 2);
        v47 = *((_QWORD *)v35 + 3);
        if (v48 >= v47 >> 1)
          v35 = (char *)sub_1000078C0(v47 > 1, v48 + 1, 1, v35);
        *((_QWORD *)v35 + 2) = v48 + 1;
        v45(&v35[((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(_QWORD *)(v34 + 72) * v48], (uint64_t)v58, v42);
        v40(v57, v42);
        v32 = v53;
      }
      ++v33;
    }
    while (v32 != v33);
  }
  else
  {
    v40 = *(void (**)(char *, uint64_t))(v63 + 8);
  }
  v40(v65, v64);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v21, v52);
}

void sub_10000B174(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;

  v30 = type metadata accessor for Date(0);
  v4 = *(_QWORD *)(v30 - 8);
  __chkstk_darwin(v30);
  v29 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000ACD8(a1, a2);
  if (!v6)
    return;
  v8 = v6;
  v31 = *(_QWORD *)(v6 + 16);
  v32 = &_swiftEmptyArrayStorage;
  if (!v31)
  {
    swift_bridgeObjectRelease(v6);
    return;
  }
  v9 = 0;
  v10 = a1 & 0xFFFFFFFFFFFFFF8;
  v26 = v6;
  v27 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 < 0)
    v10 = a1;
  v25 = v10;
  v28 = (unint64_t)a1 >> 62;
  while (!a1)
  {
    v19 = 0;
LABEL_20:
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v7);
    v23 = v32[2];
    v22 = v32[3];
    if (v23 >= v22 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v22 > 1, v23 + 1, 1);
    ++v9;
    v24 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v19);
    specialized Array._endMutation()(v24);
    if (v9 == v31)
    {
      swift_bridgeObjectRelease(v8);
      return;
    }
  }
  if (v9 >= *(_QWORD *)(v8 + 16))
    goto LABEL_29;
  v11 = v8
      + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
      + *(_QWORD *)(v4 + 72) * v9;
  v12 = v29;
  v13 = v30;
  (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v29, v11, v30);
  v14 = swift_bridgeObjectRetain(a1);
  v15 = Date.timeIntervalSinceReferenceDate.getter(v14);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v13);
  if (!v28)
  {
    v16 = *(_QWORD *)(v27 + 16);
    if (v16)
      goto LABEL_10;
    goto LABEL_17;
  }
  swift_bridgeObjectRetain(a1);
  v16 = _CocoaArrayWrapper.endIndex.getter(v25);
  swift_bridgeObjectRelease(a1);
  if (!v16)
  {
LABEL_17:
    v19 = 0;
LABEL_18:
    v8 = v26;
    v7 = swift_bridgeObjectRelease(a1);
    goto LABEL_20;
  }
LABEL_10:
  v17 = 4;
  while (1)
  {
    v18 = (a1 & 0xC000000000000001) != 0
        ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v17 - 4, a1)
        : *(id *)(a1 + 8 * v17);
    v19 = v18;
    v20 = v17 - 3;
    if (__OFADD__(v17 - 4, 1))
      break;
    objc_msgSend(v18, "timeStamp");
    if (vabdd_f64(v21, v15) < 2.22044605e-16)
      goto LABEL_18;

    ++v17;
    if (v20 == v16)
      goto LABEL_17;
  }
  __break(1u);
LABEL_29:
  __break(1u);
}

unint64_t sub_10000B3E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000514F8;
  if (!qword_1000514F8)
  {
    v1 = sub_1000036E4(&qword_1000514D0);
    sub_100003928(&qword_100051500, &qword_1000514C8, (uint64_t)&protocol conformance descriptor for VStack<A>);
    sub_100003928(&qword_100051508, &qword_1000514F0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000514F8);
  }
  return result;
}

void sub_10000B47C(int64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  double v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;

  v46 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v46 - 8);
  __chkstk_darwin(v46);
  v45 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000033B8(&qword_100051520);
  __chkstk_darwin(v10);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_1000033B8((uint64_t *)&unk_100051980);
  v47 = *(_QWORD *)(v43 - 8);
  __chkstk_darwin(v43);
  v42 = (uint64_t)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v14);
  v37 = (uint64_t)&v35 - v16;
  if (a1 == a2)
  {
    v44 = &_swiftEmptyArrayStorage;
    return;
  }
  if (a2 < a1)
    goto LABEL_41;
  v17 = a4 & 0xFFFFFFFFFFFFFF8;
  v40 = a4 & 0xFFFFFFFFFFFFFF8;
  if (a4 < 0)
    v17 = a4;
  v36 = v17;
  v44 = &_swiftEmptyArrayStorage;
  v41 = (unint64_t)a4 >> 62;
  v38 = a2;
  v39 = a3;
  while (a1 < a2)
  {
    if (!a3)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v12, 1, 1, v43);
      goto LABEL_9;
    }
    if (a1 < 0)
      goto LABEL_39;
    if ((unint64_t)a1 >= *(_QWORD *)(a3 + 16))
      goto LABEL_40;
    (*(void (**)(char *, unint64_t, uint64_t, __n128))(v8 + 16))(v45, a3+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * a1, v46, v15);
    if (!a4)
      goto LABEL_27;
    v18 = swift_bridgeObjectRetain(a4);
    v19 = Date.timeIntervalSinceReferenceDate.getter(v18);
    if (v41)
    {
      swift_bridgeObjectRetain(a4);
      v20 = _CocoaArrayWrapper.endIndex.getter(v36);
      swift_bridgeObjectRelease(a4);
      if (!v20)
      {
LABEL_25:
        swift_bridgeObjectRelease(a4);
        a2 = v38;
        a3 = v39;
LABEL_27:
        (*(void (**)(char *, uint64_t))(v8 + 8))(v45, v46);
        v27 = 1;
        goto LABEL_28;
      }
    }
    else
    {
      v20 = *(_QWORD *)(v40 + 16);
      if (!v20)
        goto LABEL_25;
    }
    v21 = 4;
    while (1)
    {
      if ((a4 & 0xC000000000000001) != 0)
        v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v21 - 4, a4);
      else
        v22 = *(id *)(a4 + 8 * v21);
      v23 = v22;
      v24 = v21 - 3;
      if (__OFADD__(v21 - 4, 1))
      {
        __break(1u);
        goto LABEL_38;
      }
      objc_msgSend(v22, "timeStamp");
      if (vabdd_f64(v25, v19) < 2.22044605e-16)
        break;

      ++v21;
      if (v24 == v20)
        goto LABEL_25;
    }
    v26 = objc_msgSend(v23, "state", swift_bridgeObjectRelease(a4).n128_f64[0]);

    a2 = v38;
    a3 = v39;
    if (v26)
      goto LABEL_27;
    v34 = v46;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v12, v45, v46);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v12, 0, 1, v34);
    v27 = 0;
LABEL_28:
    v28 = v47;
    v29 = v43;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v12, v27, 1, v43);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v12, 1, v29) != 1)
    {
      v30 = v37;
      sub_10000BBF4((uint64_t)v12, v37);
      sub_10000BBF4(v30, v42);
      if ((swift_isUniquelyReferenced_nonNull_native(v44) & 1) == 0)
        v44 = (_QWORD *)sub_100007A48(0, v44[2] + 1, 1, v44);
      v32 = v44[2];
      v31 = v44[3];
      if (v32 >= v31 >> 1)
        v44 = (_QWORD *)sub_100007A48(v31 > 1, v32 + 1, 1, v44);
      v33 = v44;
      v44[2] = v32 + 1;
      sub_10000BBF4(v42, (uint64_t)v33+ ((*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80))+ *(_QWORD *)(v47 + 72) * v32);
      goto LABEL_10;
    }
LABEL_9:
    sub_1000034BC((uint64_t)v12, &qword_100051520);
LABEL_10:
    if (++a1 == a2)
      return;
  }
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
}

uint64_t sub_10000B8A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  NSString v14;
  NSString v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSString v24;
  Class isa;
  id v26;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = type metadata accessor for Locale(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003478(a1, (uint64_t)v8, (uint64_t *)&unk_100051980);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_1000034BC((uint64_t)v8, (uint64_t *)&unk_100051980);
    v13 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v14 = String._bridgeToObjectiveC()();
    v15 = String._bridgeToObjectiveC()();
    v16 = objc_msgSend(v13, "localizedStringForKey:value:table:", v14, 0, v15);

    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    v18 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
    v19 = static Locale.current.getter();
    v20 = Locale.languageCode.getter(v19);
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (v22)
    {
      v30 = v20;
      v31 = v22;
      v28 = 26746;
      v29 = 0xE200000000000000;
      v23 = sub_100008E40();
      if ((StringProtocol.contains<A>(_:)(&v28, &type metadata for String, &type metadata for String, v23, v23) & 1) != 0)
      {
        swift_bridgeObjectRelease(v22);
      }
      else
      {
        v30 = v20;
        v31 = v22;
        v28 = 24938;
        v29 = 0xE200000000000000;
        StringProtocol.contains<A>(_:)(&v28, &type metadata for String, &type metadata for String, v23, v23);
        swift_bridgeObjectRelease(v22);
      }
    }
    v24 = String._bridgeToObjectiveC()();
    objc_msgSend(v18, "setLocalizedDateFormatFromTemplate:", v24);

    isa = Date._bridgeToObjectiveC()().super.isa;
    v26 = objc_msgSend(v18, "stringFromDate:", isa);

    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v17;
}

uint64_t sub_10000BBF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8((uint64_t *)&unk_100051980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BC3C()
{
  return sub_10000BC74(56);
}

_QWORD *sub_10000BC44@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int16 v3;

  if (*(_BYTE *)(v2 + 25))
    v3 = 256;
  else
    v3 = 0;
  return sub_100009918(a1, *(_QWORD *)(v2 + 16), v3 | *(unsigned __int8 *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), a2);
}

uint64_t sub_10000BC6C()
{
  return sub_10000BC74(57);
}

uint64_t sub_10000BC74(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 48));
  return swift_deallocObject(v1, a1, 7);
}

void sub_10000BCAC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_100009E68(a1, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(unsigned __int8 *)(v2 + 56), a2);
}

unint64_t sub_10000BCD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051540;
  if (!qword_100051540)
  {
    v1 = sub_1000036E4(&qword_100051538);
    sub_100008304(&qword_100051548, type metadata accessor for StandChart.LegendLabel, (uint64_t)&unk_10003FFD0);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100051540);
  }
  return result;
}

uint64_t type metadata accessor for StandChart.LegendLabel(uint64_t a1)
{
  uint64_t result;

  result = qword_1000515D8;
  if (!qword_1000515D8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StandChart.LegendLabel);
  return result;
}

uint64_t sub_10000BD90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StandChart.LegendLabel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BDD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for GeometryProxy(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 48) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_10000BE64(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = type metadata accessor for GeometryProxy(0);
  sub_100009C68(a1, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2+ ((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64)+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80))+ 7) & 0xFFFFFFFFFFFFF8)), a2);
}

uint64_t *sub_10000BEE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = sub_1000033B8((uint64_t *)&unk_100051980);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v10 = *(uint64_t *)((char *)a2 + v11);
    *(uint64_t *)((char *)a1 + v11) = v10;
  }
  swift_retain(v10);
  return a1;
}

uint64_t sub_10000BFD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return swift_release(*(_QWORD *)(a1 + *(int *)(a2 + 24)));
}

char *sub_10000C03C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  v10 = *(_QWORD *)&a2[v9];
  *(_QWORD *)&a1[v9] = v10;
  swift_retain(v10);
  return a1;
}

char *sub_10000C104(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  v12 = *(int *)(a3 + 24);
  v13 = *(_QWORD *)&a2[v12];
  v14 = *(_QWORD *)&a1[v12];
  *(_QWORD *)&a1[v12] = v13;
  swift_retain(v13);
  swift_release(v14);
  return a1;
}

char *sub_10000C228(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  return a1;
}

char *sub_10000C2EC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  v13 = *(_QWORD *)&a1[v12];
  *(_QWORD *)&a1[v12] = *(_QWORD *)&a2[v12];
  swift_release(v13);
  return a1;
}

uint64_t sub_10000C404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000C410);
}

uint64_t sub_10000C410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1000033B8((uint64_t *)&unk_100051980);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_10000C490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000C49C);
}

uint64_t sub_10000C49C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1000033B8((uint64_t *)&unk_100051980);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

void sub_10000C518(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  sub_10000C598(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_10003FF60;
    v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

void sub_10000C598(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100051720)
  {
    v2 = type metadata accessor for Date(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100051720);
  }
}

uint64_t destroy for StandChart.DotView(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t *_s13FitnessWidget10StandChartV7DotViewVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t *assignWithCopy for StandChart.DotView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  a1[2] = a2[2];
  return a1;
}

__n128 initializeWithTake for StandChart.DotView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for StandChart.DotView(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  a1[2] = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for StandChart.DotView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for StandChart.DotView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for StandChart.DotView()
{
  return &type metadata for StandChart.DotView;
}

unint64_t sub_10000C7AC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  unint64_t v5;

  result = qword_100051618;
  if (!qword_100051618)
  {
    v1 = sub_1000036E4(&qword_100051620);
    v2 = sub_1000036E4(&qword_1000514D8);
    v4 = sub_1000036E4(&qword_1000514D0);
    v5 = sub_10000B3E0();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.drawingGroup(opaque:colorMode:)>>, 1);
    v4 = v2;
    v5 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    sub_100008304((unint64_t *)&qword_100051628, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051618);
  }
  return result;
}

uint64_t sub_10000C888(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100041CD8, 1);
}

uint64_t sub_10000C898(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100041CB0, 1);
}

uint64_t sub_10000C8C8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

__n128 initializeBufferWithCopyOfBuffer for StandChart.Dot(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StandChart.Dot(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for StandChart.Dot(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for StandChart.Dot()
{
  return &type metadata for StandChart.Dot;
}

uint64_t sub_10000C93C()
{
  return sub_100003928(&qword_100051638, &qword_100051640, (uint64_t)&protocol conformance descriptor for HStack<A>);
}

unint64_t sub_10000C96C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051648;
  if (!qword_100051648)
  {
    v1 = sub_1000036E4(&qword_100051650);
    sub_10000C9D8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051648);
  }
  return result;
}

unint64_t sub_10000C9D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051658;
  if (!qword_100051658)
  {
    v1 = sub_1000036E4(&qword_100051660);
    sub_100003928(&qword_100051668, &qword_100051670, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051658);
  }
  return result;
}

uint64_t sub_10000CA5C()
{
  return sub_100003928(&qword_100051678, &qword_100051680, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
}

unint64_t sub_10000CA8C()
{
  unint64_t result;

  result = qword_100051688;
  if (!qword_100051688)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for EmptyAnimatableData, &type metadata for EmptyAnimatableData);
    atomic_store(result, (unint64_t *)&qword_100051688);
  }
  return result;
}

unint64_t sub_10000CAD4()
{
  unint64_t result;

  result = qword_100051690;
  if (!qword_100051690)
  {
    result = swift_getWitnessTable(&unk_100040134, &type metadata for StandChart.Dot);
    atomic_store(result, (unint64_t *)&qword_100051690);
  }
  return result;
}

unint64_t sub_10000CB1C()
{
  unint64_t result;

  result = qword_100051698;
  if (!qword_100051698)
  {
    result = swift_getWitnessTable(&unk_1000400E4, &type metadata for StandChart.Dot);
    atomic_store(result, (unint64_t *)&qword_100051698);
  }
  return result;
}

unint64_t sub_10000CB60()
{
  unint64_t result;

  result = qword_1000516A0;
  if (!qword_1000516A0)
  {
    result = swift_getWitnessTable(&unk_100040184, &type metadata for StandChart.Dot);
    atomic_store(result, (unint64_t *)&qword_1000516A0);
  }
  return result;
}

uint64_t sub_10000CBAC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

id sub_10000CBF4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(a1 + 56);
  *a2 = v2;
  return v2;
}

uint64_t sub_10000CC20(void *a1)
{
  return sub_10000D104(a1, (uint64_t)&unk_10004EAF0, (uint64_t)sub_100012954, (uint64_t)&unk_10004EB08);
}

void sub_10000CC3C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  void *v6;
  id v7;
  _BYTE v8[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_weakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    v6 = *(void **)(Strong + 56);
    *(_QWORD *)(Strong + 56) = a2;
    v7 = a2;
    swift_release(v5);

  }
}

uint64_t sub_10000CCA8(uint64_t a1)
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

uint64_t sub_10000CCD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _BYTE v5[24];

  v3 = a1 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalPauseRingsResumeDate;
  swift_beginAccess(a1 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalPauseRingsResumeDate, v5, 0, 0);
  return sub_100003478(v3, a2, (uint64_t *)&unk_100051980);
}

uint64_t sub_10000CD3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD aBlock[5];
  uint64_t v31;

  v2 = v1;
  v25[0] = a1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v28 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v26 = *(_QWORD *)(v7 - 8);
  v27 = v7;
  __chkstk_darwin(v7);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000033B8((uint64_t *)&unk_100051980);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  __chkstk_darwin(v10);
  v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[1] = *(_QWORD *)(v2 + 16);
  v14 = swift_allocObject(&unk_10004E708, 24, 7);
  swift_weakInit(v14 + 16, v2);
  sub_100003478(a1, (uint64_t)v13, (uint64_t *)&unk_100051980);
  v15 = *(unsigned __int8 *)(v11 + 80);
  v16 = (v15 + 24) & ~v15;
  v17 = swift_allocObject(&unk_10004EAA0, v16 + v12, v15 | 7);
  *(_QWORD *)(v17 + 16) = v14;
  sub_1000082A0((uint64_t)v13, v17 + v16, (uint64_t *)&unk_100051980);
  aBlock[4] = sub_1000128A8;
  v31 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CBA8;
  aBlock[3] = &unk_10004EAB8;
  v18 = _Block_copy(aBlock);
  v19 = swift_retain(v14);
  static DispatchQoS.unspecified.getter(v19);
  v29 = &_swiftEmptyArrayStorage;
  v20 = sub_100008304(&qword_100051370, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v21 = sub_1000033B8((uint64_t *)&unk_100051960);
  v22 = sub_100012AA0((unint64_t *)&qword_100051378, (uint64_t *)&unk_100051960);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v29, v21, v22, v4, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v6, v18);
  _Block_release(v18);
  sub_1000034BC(v25[0], (uint64_t *)&unk_100051980);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
  v23 = v31;
  swift_release(v14);
  return swift_release(v23);
}

uint64_t sub_10000CFD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];
  _BYTE v11[24];

  v4 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v4);
  v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  a1 += 16;
  swift_beginAccess(a1, v11, 0, 0);
  result = swift_weakLoadStrong(a1);
  if (result)
  {
    v8 = result;
    sub_100003478(a2, (uint64_t)v6, (uint64_t *)&unk_100051980);
    v9 = v8 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalPauseRingsResumeDate;
    swift_beginAccess(v8 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalPauseRingsResumeDate, v10, 33, 0);
    sub_1000128DC((uint64_t)v6, v9);
    swift_endAccess(v10);
    return swift_release(v8);
  }
  return result;
}

id sub_10000D0B4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalLatestStatistics);
  *a2 = v2;
  return v2;
}

uint64_t sub_10000D0E8(void *a1)
{
  return sub_10000D104(a1, (uint64_t)&unk_10004EA50, (uint64_t)sub_100012800, (uint64_t)&unk_10004EA68);
}

uint64_t sub_10000D104(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD aBlock[5];
  uint64_t v30;

  v9 = type metadata accessor for DispatchWorkItemFlags(0);
  v27 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for DispatchQoS(0);
  v12 = *(_QWORD *)(v26 - 8);
  __chkstk_darwin();
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *(_QWORD *)(v4 + 16);
  v15 = swift_allocObject(&unk_10004E708, 24, 7);
  swift_weakInit(v15 + 16, v4);
  v16 = swift_allocObject(a2, 32, 7);
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = a1;
  aBlock[4] = a3;
  v30 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CBA8;
  aBlock[3] = a4;
  v17 = _Block_copy(aBlock);
  v18 = a1;
  v19 = swift_retain(v15);
  static DispatchQoS.unspecified.getter(v19);
  v28 = &_swiftEmptyArrayStorage;
  v20 = sub_100008304(&qword_100051370, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v21 = sub_1000033B8((uint64_t *)&unk_100051960);
  v22 = sub_100012AA0((unint64_t *)&qword_100051378, (uint64_t *)&unk_100051960);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v28, v21, v22, v9, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v14, v11, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v26);
  v23 = v30;
  swift_release(v15);
  return swift_release(v23);
}

void sub_10000D320(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  void *v6;
  id v7;
  _BYTE v8[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_weakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    v6 = *(void **)(Strong + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalLatestStatistics);
    *(_QWORD *)(Strong + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalLatestStatistics) = a2;
    v7 = a2;
    swift_release(v5);

  }
}

uint64_t sub_10000D394(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  __objc2_prot *v42;
  void *v43;

  v2 = v1;
  v41 = a1;
  v40 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v3 = *(_QWORD *)(v40 - 8);
  __chkstk_darwin();
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin();
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS(0);
  __chkstk_darwin();
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000127C4(0, (unint64_t *)&qword_100051950, OS_dispatch_queue_ptr);
  static DispatchQoS.unspecified.getter(v11);
  v43 = &_swiftEmptyArrayStorage;
  v12 = sub_100008304(&qword_1000519F8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v39 = v12;
  v13 = sub_1000033B8(&qword_100051A00);
  v38 = v13;
  v37 = sub_100012AA0(&qword_100051A08, &qword_100051A00);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v43, v13, v37, v6, v12);
  v14 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v16 = v5;
  v17 = v5;
  v18 = v40;
  v15(v17, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v40);
  v19 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0x6563634161746164, 0xEF65756575517373, v10, v8, v16, 0);
  *(_QWORD *)(v1 + 16) = v19;
  static DispatchQoS.unspecified.getter(v19);
  v43 = &_swiftEmptyArrayStorage;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v43, v38, v37, v6, v39);
  v15(v16, v14, v18);
  *(_QWORD *)(v1 + 24) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0x5173656972657571, 0xEC00000065756575, v10, v8, v16, 0);
  *(_OWORD *)(v1 + 32) = xmmword_1000401E0;
  *(_QWORD *)(v1 + 48) = &_swiftEmptySetSingleton;
  *(_QWORD *)(v1 + 56) = 0;
  v20 = v1 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalPauseRingsResumeDate;
  v21 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 1, 1, v21);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalLatestStatistics) = 0;
  *(_BYTE *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser) = 0;
  v22 = (_OWORD *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_layout);
  *v22 = xmmword_1000401F0;
  v22[1] = xmmword_100040200;
  v22[2] = xmmword_100040210;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_ringsRenderer) = 0;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_timeIntervalForRelevantWorkout) = 0x409C200000000000;
  v23 = v41;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore) = v41;
  v24 = objc_allocWithZone((Class)_HKWheelchairUseCharacteristicCache);
  v25 = v23;
  v26 = objc_msgSend(v24, "initWithHealthStore:", v25);
  if (!v26)
  {
    __break(1u);
    goto LABEL_9;
  }
  *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_wheelchairCache) = v26;
  v27 = MTLCreateSystemDefaultDevice();
  if (!v27)
  {
LABEL_9:
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000011, 0x8000000100049110, "FitnessWidget/FitnessWidgetDataProvider.swift", 45, 2, 106, 0);
    __break(1u);
    return result;
  }
  v28 = v27;
  v29 = objc_msgSend(v27, "newCommandQueue");
  if (v29)
  {
    v30 = v29;
    v42 = &OBJC_PROTOCOL___MTLCommandQueueSPI;
    v31 = (void *)swift_dynamicCastObjCProtocolConditional(v29, 1, &v42);
    if (v31)
    {
      v32 = v31;
      objc_msgSend(v31, "setBackgroundGPUPriority:", 2);
      v33 = objc_msgSend(objc_allocWithZone((Class)ARUIRenderer), "initWithCommandQueue:", v32);
      swift_unknownObjectRelease(v30);
      v34 = *(void **)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_ringsRenderer);
      *(_QWORD *)(v2 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_ringsRenderer) = v33;

    }
    else
    {
      swift_unknownObjectRelease(v30);
    }
  }
  sub_100010BD0();
  swift_unknownObjectRelease(v28);

  return v2;
}

uint64_t sub_10000D800(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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
  _QWORD *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD *v22;
  id v23;
  NSString v24;
  double v25;
  void *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v44;
  uint64_t v45;
  int v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void **aBlock;
  uint64_t v53;
  uint64_t (*v54)(uint64_t);
  void *v55;
  void *v56;
  _QWORD *v57;

  v5 = v4;
  v46 = a2;
  v48 = type metadata accessor for DispatchWorkItemFlags(0);
  v51 = *(_QWORD *)(v48 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v47 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v49 = *(_QWORD *)(v9 - 8);
  v50 = v9;
  ((void (*)(void))__chkstk_darwin)();
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = type metadata accessor for DispatchTime(0);
  v12 = *(_QWORD *)(v45 - 8);
  v13 = ((uint64_t (*)(void))__chkstk_darwin)();
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v44 = (char *)&v44 - v16;
  v17 = swift_allocObject(&unk_10004E708, 24, 7);
  swift_weakInit(v17 + 16, v5);
  v18 = (_QWORD *)swift_allocObject(&unk_10004E9B0, 40, 7);
  v18[2] = v17;
  v18[3] = a3;
  v18[4] = a4;
  v19 = objc_allocWithZone((Class)_HKCurrentActivitySummaryQuery);
  v56 = sub_100012778;
  v57 = v18;
  aBlock = _NSConcreteStackBlock;
  v53 = 1107296256;
  v54 = (uint64_t (*)(uint64_t))sub_10001112C;
  v55 = &unk_10004E9C8;
  v20 = _Block_copy(&aBlock);
  swift_retain(v17);
  swift_retain(a4);
  v21 = objc_msgSend(v19, "initWithUpdateHandler:", v20);
  _Block_release(v20);
  v22 = v57;
  swift_release(v17);
  swift_release(v22);
  v23 = v21;
  v24 = String._bridgeToObjectiveC()();
  objc_msgSend(v23, "setDebugIdentifier:", v24);

  sub_100010528(v23);
  objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore), "executeQuery:", v23);
  if ((v46 & 1) != 0)
    v25 = 8.0;
  else
    v25 = 18.0;
  sub_1000127C4(0, (unint64_t *)&qword_100051950, OS_dispatch_queue_ptr);
  v26 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)(v15, v25);
  v27 = *(void (**)(char *, uint64_t))(v12 + 8);
  v28 = v45;
  v27(v15, v45);
  v29 = swift_allocObject(&unk_10004E708, 24, 7);
  swift_weakInit(v29 + 16, v5);
  v30 = (_QWORD *)swift_allocObject(&unk_10004EA00, 48, 7);
  v30[2] = v29;
  v30[3] = v23;
  v30[4] = a3;
  v30[5] = a4;
  v56 = sub_1000127B8;
  v57 = v30;
  aBlock = _NSConcreteStackBlock;
  v53 = 1107296256;
  v54 = sub_10000CBA8;
  v55 = &unk_10004EA18;
  v31 = _Block_copy(&aBlock);
  v32 = v57;
  swift_retain(a4);
  v33 = v23;
  v34 = swift_release(v32);
  v35 = v11;
  static DispatchQoS.unspecified.getter(v34);
  aBlock = (void **)&_swiftEmptyArrayStorage;
  v36 = sub_100008304(&qword_100051370, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v37 = sub_1000033B8((uint64_t *)&unk_100051960);
  v38 = sub_100012AA0((unint64_t *)&qword_100051378, (uint64_t *)&unk_100051960);
  v39 = v47;
  v40 = v37;
  v41 = v48;
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v40, v38, v48, v36);
  v42 = v44;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v44, v35, v39, v31);
  _Block_release(v31);

  (*(void (**)(char *, uint64_t))(v51 + 8))(v39, v41);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v35, v50);
  return ((uint64_t (*)(char *, uint64_t))v27)(v42, v28);
}

uint64_t sub_10000DC4C(void *a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(void *, uint64_t))
{
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  _BYTE v19[24];

  v9 = a4 + 16;
  swift_beginAccess(a4 + 16, v19, 0, 0);
  result = swift_weakLoadStrong(v9);
  if (result)
  {
    v11 = result;
    if ((sub_100010894(a1) & 1) == 0)
      return swift_release(v11);
    objc_msgSend(*(id *)(v11 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore), "stopQuery:", a1);
    sub_1000105D8(a1);
    v12 = sub_1000033B8((uint64_t *)&unk_100051990);
    OS_dispatch_queue.sync<A>(execute:)(&v18, sub_100012AE0, v11, v12);
    v13 = v18;
    if (v18)
    {
      if (a2)
      {
        sub_1000127C4(0, &qword_1000519F0, HKActivitySummary_ptr);
        v14 = a2;
        v15 = v13;
        v16 = static NSObject.== infix(_:_:)(v15, v14);

        if ((v16 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
    }
    else if (!a2)
    {
      goto LABEL_11;
    }
    v17 = a2;
    sub_10000CC20(a2);
LABEL_11:
    a5(a2, a3);
    return swift_release(v11);
  }
  return result;
}

void sub_10000DDB0(uint64_t a1, void *a2, void (*a3)(id, _QWORD))
{
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  _BYTE v18[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v18, 0, 0);
  Strong = swift_weakLoadStrong(v5);
  if (Strong)
  {
    v7 = Strong;
    v8 = sub_100010894(a2);
    if ((v8 & 1) == 0)
    {
      swift_release(v7);
      return;
    }
    v9 = static os_log_type_t.default.getter(v8);
    v10 = HKLogActivity;
    os_log(_:dso:log:_:_:)(v9, &_mh_execute_header, v10, "Timed out retrieving summary data. Bailing from query and returning latest data to widget…", 92, 0, &_swiftEmptyArrayStorage);

    objc_msgSend(*(id *)(v7 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore), "stopQuery:", a2);
    sub_1000105D8(a2);
    v11 = sub_1000033B8((uint64_t *)&unk_100051990);
    OS_dispatch_queue.sync<A>(execute:)(&v17, sub_100012AE0, v7, v11);
    v12 = v17;
    OS_dispatch_queue.sync<A>(execute:)(&v17, sub_100012AE0, v7, v11);
    v13 = v17;
    if (v17)
    {
      if (v12)
      {
        sub_1000127C4(0, &qword_1000519F0, HKActivitySummary_ptr);
        v14 = v12;
        v15 = v13;
        v16 = static NSObject.== infix(_:_:)(v15, v14);

        if ((v16 & 1) != 0)
          goto LABEL_12;
      }
      else
      {

      }
    }
    else if (!v12)
    {
      v14 = 0;
LABEL_12:
      a3(v12, 0);
      swift_release(v7);

      return;
    }
    v14 = v12;
    sub_10000CC20(v12);
    goto LABEL_12;
  }
}

id sub_10000DF94(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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
  id v18;
  NSString v19;
  id v20;
  uint64_t v21;
  id result;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void **v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;
  Class isa;
  void *v31;
  id v32;
  _QWORD *v33;
  id v34;
  NSString v35;
  double v36;
  void *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _QWORD *v44;
  id v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  void **aBlock;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD *v70;

  v5 = v4;
  LODWORD(v56) = a2;
  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v63 = *(_QWORD *)(v8 - 8);
  v64 = v8;
  __chkstk_darwin(v8);
  v62 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS(0);
  v60 = *(_QWORD *)(v10 - 8);
  v61 = v10;
  __chkstk_darwin(v10);
  v59 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = type metadata accessor for DispatchTime(0);
  v55 = *(_QWORD *)(v58 - 8);
  v12 = __chkstk_darwin(v58);
  v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v57 = (char *)&v54 - v15;
  static String._unconditionallyBridgeFromObjectiveC(_:)(HKPauseRingsScheduleSortIdentifierStartDateIndex);
  v17 = v16;
  v18 = objc_allocWithZone((Class)NSSortDescriptor);
  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  v20 = objc_msgSend(v18, "initWithKey:ascending:", v19, 0);

  v21 = sub_1000127C4(0, &qword_1000519C8, HKSampleType_ptr);
  result = objc_msgSend((id)swift_getObjCClassFromMetadata(v21), "pauseRingsScheduleType");
  if (result)
  {
    v23 = result;
    v24 = sub_1000033B8(&qword_1000519D0);
    v25 = swift_allocObject(v24, 40, 7);
    *(_OWORD *)(v25 + 16) = xmmword_100040220;
    *(_QWORD *)(v25 + 32) = v20;
    aBlock = (void **)v25;
    specialized Array._endMutation()(v25);
    v26 = aBlock;
    v27 = swift_allocObject(&unk_10004E708, 24, 7);
    swift_weakInit(v27 + 16, v5);
    v28 = (_QWORD *)swift_allocObject(&unk_10004E910, 40, 7);
    v28[2] = v27;
    v28[3] = a3;
    v28[4] = a4;
    v29 = objc_allocWithZone((Class)HKSampleQuery);
    sub_1000127C4(0, &qword_1000519D8, NSSortDescriptor_ptr);
    v54 = v20;
    swift_retain(v27);
    swift_retain(a4);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v26);
    v69 = sub_100012730;
    v70 = v28;
    aBlock = _NSConcreteStackBlock;
    v66 = 1107296256;
    v67 = sub_100011130;
    v68 = &unk_10004E928;
    v31 = _Block_copy(&aBlock);
    v32 = objc_msgSend(v29, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v23, 0, 1, isa, v31);

    _Block_release(v31);
    v33 = v70;
    swift_release(v27);
    swift_release(v33);
    v34 = v32;
    v35 = String._bridgeToObjectiveC()();
    objc_msgSend(v34, "setDebugIdentifier:", v35);

    sub_100010528(v34);
    objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore), "executeQuery:", v34);
    if ((v56 & 1) != 0)
      v36 = 8.0;
    else
      v36 = 18.0;
    sub_1000127C4(0, (unint64_t *)&qword_100051950, OS_dispatch_queue_ptr);
    v37 = (void *)static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    v38 = v57;
    + infix(_:_:)(v14, v36);
    v56 = *(void (**)(char *, uint64_t))(v55 + 8);
    v39 = v14;
    v40 = v58;
    v56(v39, v58);
    v41 = swift_allocObject(&unk_10004E708, 24, 7);
    swift_weakInit(v41 + 16, v5);
    v42 = swift_allocObject(&unk_10004E960, 32, 7);
    *(_QWORD *)(v42 + 16) = v41;
    *(_QWORD *)(v42 + 24) = v34;
    v69 = sub_100012740;
    v70 = (_QWORD *)v42;
    aBlock = _NSConcreteStackBlock;
    v66 = 1107296256;
    v67 = sub_10000CBA8;
    v68 = &unk_10004E978;
    v43 = _Block_copy(&aBlock);
    v44 = v70;
    v45 = v34;
    v46 = swift_release(v44);
    v47 = v59;
    static DispatchQoS.unspecified.getter(v46);
    aBlock = (void **)&_swiftEmptyArrayStorage;
    v48 = sub_100008304(&qword_100051370, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v49 = sub_1000033B8((uint64_t *)&unk_100051960);
    v50 = sub_100012AA0((unint64_t *)&qword_100051378, (uint64_t *)&unk_100051960);
    v51 = v62;
    v52 = v49;
    v53 = v64;
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v52, v50, v64, v48);
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v38, v47, v51, v43);
    _Block_release(v43);

    (*(void (**)(char *, uint64_t))(v63 + 8))(v51, v53);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v47, v61);
    return (id)((uint64_t (*)(char *, uint64_t))v56)(v38, v40);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000E50C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t), uint64_t a6)
{
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  Class isa;
  Class v47;
  id v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  void *v57;
  Class v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  id v62;
  void *v63;
  char *v64;
  uint64_t v65;
  void (*v66)(char *, char *, uint64_t);
  uint64_t v67;
  int v68;
  char *v69;
  uint64_t v70;
  char *v71;
  void (*v72)(char *, char *, uint64_t);
  void (*v73)(char *, _QWORD, uint64_t, uint64_t);
  void (*v74)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v75;
  void (*v76)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v77;
  uint64_t (*v78)(char *, uint64_t, uint64_t);
  void (*v79)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v80)(char *, uint64_t);
  void *v81;
  id v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t);
  uint64_t v96;
  char v97[32];

  v94 = a6;
  v95 = a5;
  v93 = a3;
  v9 = type metadata accessor for DateComponents(0);
  v10 = *(_QWORD *)(v9 - 8);
  v89 = v9;
  v90 = v10;
  v11 = __chkstk_darwin(v9);
  v84 = (char *)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v86 = (char *)&v77 - v13;
  v14 = type metadata accessor for Date(0);
  v96 = *(_QWORD *)(v14 - 8);
  v15 = __chkstk_darwin(v14);
  v85 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v18 = (char *)&v77 - v17;
  v19 = sub_1000033B8(&qword_1000519E8);
  v20 = __chkstk_darwin(v19);
  v83 = (char *)&v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __chkstk_darwin(v20);
  v24 = (char *)&v77 - v23;
  v25 = __chkstk_darwin(v22);
  v27 = (char *)&v77 - v26;
  __chkstk_darwin(v25);
  v91 = (uint64_t)&v77 - v28;
  v29 = type metadata accessor for Calendar(0);
  v87 = *(_QWORD *)(v29 - 8);
  v88 = v29;
  __chkstk_darwin(v29);
  v92 = (char *)&v77 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_1000033B8((uint64_t *)&unk_100051980);
  v32 = __chkstk_darwin(v31);
  v34 = (char *)&v77 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  v36 = (char *)&v77 - v35;
  a4 += 16;
  swift_beginAccess(a4, v97, 0, 0);
  result = swift_weakLoadStrong(a4);
  if (result)
  {
    v38 = result;
    if ((sub_100010894(a1) & 1) == 0)
      return swift_release(v38);
    objc_msgSend(*(id *)(v38 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore), "stopQuery:", a1);
    sub_1000105D8(a1);
    if (a2)
    {
      if ((unint64_t)a2 >> 62)
      {
        if (a2 >= 0)
          v75 = a2 & 0xFFFFFFFFFFFFFF8;
        else
          v75 = a2;
        swift_bridgeObjectRetain(a2);
        v39 = _CocoaArrayWrapper.endIndex.getter(v75);
        if (v39)
        {
LABEL_6:
          v40 = v39 - 1;
          if (__OFSUB__(v39, 1))
          {
            __break(1u);
          }
          else if ((a2 & 0xC000000000000001) == 0)
          {
            if ((v40 & 0x8000000000000000) != 0)
            {
              __break(1u);
            }
            else if (v40 < *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              v41 = *(id *)(a2 + 8 * v40 + 32);
LABEL_11:
              v42 = v41;
              swift_bridgeObjectRelease(a2);
              v43 = objc_opt_self(HKPauseRingsSchedule);
              v44 = swift_dynamicCastObjCClass(v42, v43);
              if (v44)
              {
                v81 = (void *)v44;
                v82 = v42;
                v45 = objc_msgSend((id)objc_opt_self(NSCalendar), "hk_gregorianCalendar");
                static Calendar._unconditionallyBridgeFromObjectiveC(_:)();

                Date.init()();
                isa = Date._bridgeToObjectiveC()().super.isa;
                v80 = *(void (**)(char *, uint64_t))(v96 + 8);
                v80(v18, v14);
                v47 = Calendar._bridgeToObjectiveC()().super.isa;
                v48 = (id)_HKActivityCacheDateComponentsFromDate(isa, v47);

                if (v48)
                {
                  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(v48);

                  v49 = v90;
                  v50 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v90 + 56);
                  v51 = v27;
                  v52 = 0;
                }
                else
                {
                  v49 = v90;
                  v50 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v90 + 56);
                  v51 = v27;
                  v52 = 1;
                }
                v53 = v89;
                v79 = v50;
                v50((uint64_t)v51, v52, 1, v89);
                v54 = (uint64_t)v27;
                v55 = v91;
                sub_1000082A0(v54, v91, &qword_1000519E8);
                sub_100003478(v55, (uint64_t)v24, &qword_1000519E8);
                v78 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48);
                v56 = v78(v24, 1, v53);
                v57 = v81;
                if (v56 == 1)
                {
                  v58 = 0;
                }
                else
                {
                  v59 = v53;
                  v58 = DateComponents._bridgeToObjectiveC()().super.isa;
                  (*(void (**)(char *, uint64_t))(v49 + 8))(v24, v59);
                }
                v60 = v92;
                v61 = _HKCacheIndexFromDateComponents(v58);

                if (v61 < (uint64_t)objc_msgSend(v57, "startDateIndex")
                  || v61 >= (uint64_t)objc_msgSend(v57, "endDateIndex"))
                {
                  v74 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v96 + 56);
                  v74(v36, 1, 1, v14);
                  sub_10000CD3C((uint64_t)v36);
                  v74(v36, 1, 1, v14);
                  v95(v36, v93);
                  swift_release(v38);

                  sub_1000034BC((uint64_t)v36, (uint64_t *)&unk_100051980);
                  goto LABEL_27;
                }
                v62 = (id)_HKActivityCacheDateComponentsFromCacheIndex(objc_msgSend(v57, "endDateIndex"));
                if (v62)
                {
                  v63 = v62;
                  v64 = v84;
                  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)(v62);

                  v65 = v89;
                  v66 = *(void (**)(char *, char *, uint64_t))(v90 + 32);
                  v67 = (uint64_t)v83;
                  v66(v83, v64, v89);
                  v79(v67, 0, 1, v65);
                  v68 = v78((char *)v67, 1, v65);
                  v69 = v86;
                  if (v68 != 1)
                  {
                    v66(v86, (char *)v67, v65);
                    Calendar.date(from:)(v69);
                    v70 = v96;
                    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v96 + 48))(v34, 1, v14) != 1)
                    {
                      v71 = v85;
                      (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v85, v34, v14);
                      v72 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
                      v72(v36, v71, v14);
                      v73 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v70 + 56);
                      v73(v36, 0, 1, v14);
                      sub_10000CD3C((uint64_t)v36);
                      v72(v36, v71, v14);
                      v73(v36, 0, 1, v14);
                      v95(v36, v93);
                      swift_release(v38);

                      sub_1000034BC((uint64_t)v36, (uint64_t *)&unk_100051980);
                      v80(v71, v14);
                      (*(void (**)(char *, uint64_t))(v90 + 8))(v69, v65);
LABEL_27:
                      sub_1000034BC(v91, &qword_1000519E8);
                      return (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v60, v88);
                    }
                    sub_1000034BC((uint64_t)v34, (uint64_t *)&unk_100051980);
                    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000037, 0x8000000100048FF0, "FitnessWidget/FitnessWidgetDataProvider.swift", 45, 2, 201, 0);
                    goto LABEL_42;
                  }
LABEL_40:
                  sub_1000034BC(v67, &qword_1000519E8);
                  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000033, 0x8000000100048FB0, "FitnessWidget/FitnessWidgetDataProvider.swift", 45, 2, 197, 0);
LABEL_42:
                  __break(1u);
                  return result;
                }
LABEL_39:
                v67 = (uint64_t)v83;
                v79((uint64_t)v83, 1, 1, v89);
                goto LABEL_40;
              }

              goto LABEL_33;
            }
            __break(1u);
            goto LABEL_39;
          }
          v41 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v40, a2);
          goto LABEL_11;
        }
      }
      else
      {
        v39 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain(a2);
        if (v39)
          goto LABEL_6;
      }
      swift_bridgeObjectRelease(a2);
    }
LABEL_33:
    v76 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v96 + 56);
    v76(v36, 1, 1, v14);
    sub_10000CD3C((uint64_t)v36);
    v76(v36, 1, 1, v14);
    v95(v36, v93);
    swift_release(v38);
    return sub_1000034BC((uint64_t)v36, (uint64_t *)&unk_100051980);
  }
  return result;
}

uint64_t sub_10000ED60(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _BYTE v9[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v9, 0, 0);
  result = swift_weakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    v6 = sub_100010894(a2);
    if ((v6 & 1) != 0)
    {
      v7 = static os_log_type_t.default.getter(v6);
      v8 = HKLogActivity;
      os_log(_:dso:log:_:_:)(v7, &_mh_execute_header, v8, "Timed out retrieving pause rings data. Bailing from query and returning latest data to widget…", 96, 0, &_swiftEmptyArrayStorage);

      objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore), "stopQuery:", a2);
      sub_1000105D8(a2);
    }
    return swift_release(v5);
  }
  return result;
}

uint64_t sub_10000EE38(uint64_t a1, int a2, void (*a3)(_QWORD, uint64_t), uint64_t a4)
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
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void (**v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  void (**v44)(char *, uint64_t);
  void (*v45)(char *, uint64_t);
  id v46;
  NSString v47;
  NSString v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  void (*v56)(char *, uint64_t);
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  void (*v72)(_QWORD, _QWORD);
  uint64_t v73;
  id v74;
  id v75;
  NSString v76;
  double v77;
  void *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  _QWORD *v82;
  void *v83;
  _QWORD *v84;
  id v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  void (*v93)(char *, uint64_t);
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  void (*v104)(char *, uint64_t);
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  void (*v118)(_QWORD, uint64_t);
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  _QWORD aBlock[5];
  _QWORD *v125;

  v118 = a3;
  v119 = a4;
  LODWORD(v104) = a2;
  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v111 = *(_QWORD *)(v5 - 8);
  v112 = v5;
  __chkstk_darwin(v5);
  v110 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = type metadata accessor for DispatchQoS(0);
  v108 = *(_QWORD *)(v109 - 8);
  __chkstk_darwin(v109);
  v107 = (char *)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = type metadata accessor for DispatchTime(0);
  v103 = *(_QWORD *)(v117 - 8);
  v8 = __chkstk_darwin(v117);
  v102 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v106 = (char *)&v95 - v10;
  v11 = sub_1000033B8(&qword_1000519A8);
  __chkstk_darwin(v11);
  v99 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000033B8(&qword_1000519B0);
  __chkstk_darwin(v13);
  v98 = (char *)&v95 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for DateComponents(0);
  v114 = *(_QWORD *)(v15 - 8);
  v115 = v15;
  v16 = __chkstk_darwin(v15);
  v101 = (char *)&v95 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v16);
  v100 = (char *)&v95 - v19;
  __chkstk_darwin(v18);
  v113 = (char *)&v95 - v20;
  v21 = type metadata accessor for Calendar.Component(0);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v24 = (char *)&v95 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v25);
  v27 = (char *)&v95 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = type metadata accessor for Date(0);
  v29 = *(void (***)(char *, uint64_t))(v28 - 8);
  v30 = __chkstk_darwin(v28);
  v97 = (char *)&v95 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __chkstk_darwin(v30);
  v96 = (char *)&v95 - v33;
  v34 = __chkstk_darwin(v32);
  v36 = (char *)&v95 - v35;
  __chkstk_darwin(v34);
  v38 = (char *)&v95 - v37;
  v39 = type metadata accessor for Calendar(0);
  v120 = *(_QWORD *)(v39 - 8);
  v121 = v39;
  v40 = __chkstk_darwin(v39);
  v42 = (char *)&v95 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar.current.getter(v40);
  Calendar.startOfDay(for:)(a1);
  (*(void (**)(char *, _QWORD, uint64_t))(v22 + 104))(v24, enum case for Calendar.Component.day(_:), v21);
  v122 = v38;
  v116 = v42;
  Calendar.date(byAdding:value:to:wrappingComponents:)(v24, 1, v38, 0);
  v43 = *(void (**)(char *, uint64_t))(v22 + 8);
  v44 = v29;
  v43(v24, v21);
  v45 = v29[6];
  v123 = v28;
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v45)(v27, 1, v28) == 1)
  {
    sub_1000034BC((uint64_t)v27, (uint64_t *)&unk_100051980);
    v46 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v47 = String._bridgeToObjectiveC()();
    v48 = String._bridgeToObjectiveC()();
    v49 = objc_msgSend(v46, "localizedStringForKey:value:table:", v47, 0, v48);

    v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
    v52 = v51;

    v53 = sub_10001268C();
    v54 = swift_allocError(&type metadata for DataProviderError, v53, 0, 0);
    *v55 = v50;
    v55[1] = v52;
    v118(0, v54);
    swift_errorRelease(v54);
    v44[1](v122, v123);
  }
  else
  {
    v56 = v29[4];
    v57 = v36;
    v95 = v36;
    v58 = v123;
    ((void (*)(char *, char *, uint64_t))v56)(v36, v27, v123);
    v59 = v98;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v120 + 56))(v98, 1, 1, v121);
    v60 = type metadata accessor for TimeZone(0);
    v61 = v99;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v99, 1, 1, v60);
    v62 = v113;
    DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)(v59, v61, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0,
      1,
      0,
      1,
      0,
      1,
      0,
      1,
      0,
      1,
      0,
      1);
    DateComponents.minute.setter(30, 0);
    v63 = v44[2];
    v64 = (uint64_t)v96;
    ((void (*)(char *, char *, uint64_t))v63)(v96, v122, v58);
    v65 = (uint64_t)v97;
    ((void (*)(char *, char *, uint64_t))v63)(v97, v57, v58);
    v66 = v115;
    v67 = *(void (**)(char *, char *, uint64_t))(v114 + 16);
    v68 = (uint64_t)v100;
    v67(v100, v62, v115);
    v69 = (uint64_t)v101;
    v67(v101, v62, v66);
    v70 = (_QWORD *)swift_allocObject(&unk_10004E870, 40, 7);
    v71 = v105;
    v70[2] = v105;
    v72 = v118;
    v99 = (char *)v44;
    v73 = v119;
    v70[3] = v118;
    v70[4] = v73;
    v74 = objc_allocWithZone((Class)_HKActivityStatisticsQuery);
    swift_retain(v71);
    swift_retain(v73);
    v75 = sub_1000111D0(v64, v65, v68, v69, (uint64_t)sub_1000126D4, (uint64_t)v70);
    v76 = String._bridgeToObjectiveC()();
    objc_msgSend(v75, "setDebugIdentifier:", v76);

    sub_100010528(v75);
    objc_msgSend(*(id *)(v71 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore), "executeQuery:", v75);
    if ((v104 & 1) != 0)
      v77 = 8.0;
    else
      v77 = 18.0;
    sub_1000127C4(0, (unint64_t *)&qword_100051950, OS_dispatch_queue_ptr);
    v78 = (void *)static OS_dispatch_queue.main.getter();
    v79 = v102;
    static DispatchTime.now()();
    v80 = v106;
    + infix(_:_:)(v79, v77);
    v104 = *(void (**)(char *, uint64_t))(v103 + 8);
    v104(v79, v117);
    v81 = swift_allocObject(&unk_10004E708, 24, 7);
    swift_weakInit(v81 + 16, v71);
    v82 = (_QWORD *)swift_allocObject(&unk_10004E898, 56, 7);
    v82[2] = v81;
    v82[3] = v75;
    v82[4] = v71;
    v82[5] = v72;
    v82[6] = v73;
    aBlock[4] = sub_10001271C;
    v125 = v82;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000CBA8;
    aBlock[3] = &unk_10004E8B0;
    v83 = _Block_copy(aBlock);
    v84 = v125;
    swift_retain(v71);
    swift_retain(v73);
    v85 = v75;
    v86 = swift_release(v84);
    v87 = v107;
    static DispatchQoS.unspecified.getter(v86);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v88 = sub_100008304(&qword_100051370, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v89 = sub_1000033B8((uint64_t *)&unk_100051960);
    v90 = sub_100012AA0((unint64_t *)&qword_100051378, (uint64_t *)&unk_100051960);
    v91 = v110;
    v92 = v112;
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v89, v90, v112, v88);
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v80, v87, v91, v83);
    _Block_release(v83);

    (*(void (**)(char *, uint64_t))(v111 + 8))(v91, v92);
    (*(void (**)(char *, uint64_t))(v108 + 8))(v87, v109);
    v104(v80, v117);
    (*(void (**)(char *, uint64_t))(v114 + 8))(v113, v115);
    v93 = (void (*)(char *, uint64_t))*((_QWORD *)v99 + 1);
    v93(v95, v123);
    v93(v122, v123);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v116, v121);
}

uint64_t sub_10000F838(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void *, uint64_t))
{
  uint64_t result;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;

  result = sub_100010894(a1);
  if ((result & 1) != 0)
  {
    objc_msgSend(*(id *)(a4 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore), "stopQuery:", a1);
    sub_1000105D8(a1);
    v11 = sub_1000033B8(&qword_1000513A0);
    OS_dispatch_queue.sync<A>(execute:)(&v17, sub_100012B54, a4, v11);
    v12 = v17;
    if (v17)
    {
      if (a2)
      {
        sub_1000127C4(0, &qword_1000519C0, _HKActivityStatisticsQueryResult_ptr);
        v13 = a2;
        v14 = v12;
        v15 = static NSObject.== infix(_:_:)(v14, v13);

        if ((v15 & 1) != 0)
          goto LABEL_10;
      }
      else
      {

      }
    }
    else if (!a2)
    {
      goto LABEL_10;
    }
    v16 = a2;
    sub_10000D0E8(a2);
LABEL_10:
    sub_100010BD0();
    return a5(a2, a3);
  }
  return result;
}

void sub_10000F974(uint64_t a1, void *a2, uint64_t a3, void (*a4)(id, _QWORD))
{
  uint64_t v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  _BYTE v20[24];

  v7 = a1 + 16;
  swift_beginAccess(a1 + 16, v20, 0, 0);
  Strong = swift_weakLoadStrong(v7);
  if (Strong)
  {
    v9 = Strong;
    v10 = sub_100010894(a2);
    if ((v10 & 1) == 0)
    {
      swift_release(v9);
      return;
    }
    v11 = static os_log_type_t.default.getter(v10);
    v12 = HKLogActivity;
    os_log(_:dso:log:_:_:)(v11, &_mh_execute_header, v12, "Timed out retrieving statistics data. Bailing from query and returning latest data to widget…", 95, 0, &_swiftEmptyArrayStorage);

    v13 = sub_1000033B8(&qword_1000513A0);
    OS_dispatch_queue.sync<A>(execute:)(&v19, sub_100012B54, v9, v13);
    v14 = v19;
    if ((sub_100010894(a2) & 1) == 0)
    {
      swift_release(v9);

      return;
    }
    objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_healthStore), "stopQuery:", a2);
    sub_1000105D8(a2);
    OS_dispatch_queue.sync<A>(execute:)(&v19, sub_100012B54, a3, v13);
    v15 = v19;
    if (v19)
    {
      if (v14)
      {
        sub_1000127C4(0, &qword_1000519C0, _HKActivityStatisticsQueryResult_ptr);
        v16 = v14;
        v17 = v15;
        v18 = static NSObject.== infix(_:_:)(v17, v16);

        if ((v18 & 1) != 0)
          goto LABEL_14;
      }
      else
      {

      }
    }
    else if (!v14)
    {
      v16 = 0;
LABEL_14:
      sub_100010BD0();
      a4(v14, 0);
      swift_release(v9);

      return;
    }
    v16 = v14;
    sub_10000D0E8(v14);
    goto LABEL_14;
  }
}

void sub_10000FB8C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  char **v16;
  double v17;
  double v18;
  id v19;
  double v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  id v31;
  double v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  double v47;
  id v48;

  v3 = type metadata accessor for Date(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000033B8((uint64_t *)&unk_100051990);
  v8 = OS_dispatch_queue.sync<A>(execute:)(&v48, sub_10001262C, v1, v7);
  v9 = v48;
  if (!v48)
  {
    v13 = static os_log_type_t.default.getter(v8);
    v14 = HKLogActivity;
    os_log(_:dso:log:_:_:)(v13, &_mh_execute_header, v14, "Entry relevance is zero because there is no summary.", 52, 2, &_swiftEmptyArrayStorage);

    TimelineEntryRelevance.init(score:duration:)(0.0, 0.0);
    return;
  }
  v10 = objc_msgSend(v48, "paused");
  if ((v10 & 1) != 0)
  {
    v11 = static os_log_type_t.default.getter(v10);
    v12 = HKLogActivity;
    os_log(_:dso:log:_:_:)(v11, &_mh_execute_header, v12, "Entry relevance is zero because rings are paused.", 49, 2, &_swiftEmptyArrayStorage);
LABEL_4:

    TimelineEntryRelevance.init(score:duration:)(0.0, 0.0);
LABEL_31:

    return;
  }
  v15 = objc_msgSend(v9, "activityMoveMode");
  v16 = &selRef__moveMinutesCompletionPercentage;
  if (v15 != (id)2)
    v16 = &selRef__activeEnergyCompletionPercentage;
  objc_msgSend(v9, *v16);
  if (v17 <= 0.0)
  {
    objc_msgSend(v9, "_exerciseTimeCompletionPercentage");
    if (v18 <= 0.0)
    {
      v19 = objc_msgSend(v9, "_standHoursCompletionPercentage");
      if (v20 <= 0.0)
      {
        v37 = static os_log_type_t.default.getter(v19);
        v12 = HKLogActivity;
        os_log(_:dso:log:_:_:)(v37, &_mh_execute_header, v12, "Entry relevance is zero because all completion percentages are zero.", 68, 2, &_swiftEmptyArrayStorage);
        goto LABEL_4;
      }
    }
  }
  v21 = sub_1000033B8(&qword_1000513A0);
  v22 = OS_dispatch_queue.sync<A>(execute:)(&v48, sub_100012658, v1, v21);
  v23 = v48;
  if (!v48 || (v24 = objc_msgSend(v48, "workoutResults"), v23, !v24))
  {
LABEL_30:
    v45 = static os_log_type_t.default.getter(v22);
    v46 = HKLogActivity;
    os_log(_:dso:log:_:_:)(v45, &_mh_execute_header, v46, "Using time-based relevance because there was no workout during the day.", 71, 2, &_swiftEmptyArrayStorage);

    sub_10001009C(a1);
    goto LABEL_31;
  }
  v25 = sub_1000127C4(0, &qword_1000519A0, _HKActivityStatisticsWorkoutInfo_ptr);
  v26 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v24, v25);

  if (!((unint64_t)v26 >> 62))
  {
    v27 = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v27)
      goto LABEL_15;
    goto LABEL_29;
  }
  if (v26 < 0)
    v44 = v26;
  else
    v44 = v26 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v26);
  v27 = _CocoaArrayWrapper.endIndex.getter(v44);
  swift_bridgeObjectRelease(v26);
  if (!v27)
  {
LABEL_29:
    swift_bridgeObjectRelease(v26);
    goto LABEL_30;
  }
LABEL_15:
  v28 = v27 - 1;
  if (__OFSUB__(v27, 1))
  {
    __break(1u);
    goto LABEL_33;
  }
  if ((v26 & 0xC000000000000001) != 0)
  {
LABEL_33:
    v29 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v28, v26);
    goto LABEL_20;
  }
  if ((v28 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_35;
  }
  if (v28 >= *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_35:
    __break(1u);
    return;
  }
  v29 = *(id *)(v26 + 8 * v28 + 32);
LABEL_20:
  v30 = v29;
  v31 = objc_msgSend(v29, "endDate", swift_bridgeObjectRelease(v26).n128_f64[0]);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v32 = Date.timeIntervalSinceNow.getter();
  v33 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v34 = fabs(v32);
  if (v34 <= 1800.0)
  {
    v38 = 1800.0 - v34;
    v39 = static os_log_type_t.default.getter(v33);
    v40 = (void *)HKLogActivity;
    v41 = sub_1000033B8(&qword_100051368);
    v42 = swift_allocObject(v41, 72, 7);
    *(_OWORD *)(v42 + 16) = xmmword_10003FCE0;
    *(_QWORD *)(v42 + 56) = &type metadata for Double;
    *(_QWORD *)(v42 + 64) = &protocol witness table for Double;
    *(double *)(v42 + 32) = v38;
    v43 = v40;
    os_log(_:dso:log:_:_:)(v39, &_mh_execute_header, v43, "Entry relevance is high because of recent workout. Relevance duration: %f", v47);

    swift_bridgeObjectRelease(v42);
    TimelineEntryRelevance.init(score:duration:)(1.0, v38);
  }
  else
  {
    v35 = static os_log_type_t.default.getter(v33);
    v36 = HKLogActivity;
    os_log(_:dso:log:_:_:)(v35, &_mh_execute_header, v36, "Using time-based relevance because the most recent workout was too old.", 71, 2, &_swiftEmptyArrayStorage);

    sub_10001009C(a1);
  }

}

uint64_t sub_10001009C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  double v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v53 = a1;
  v51 = type metadata accessor for Date(0);
  v1 = *(_QWORD *)(v51 - 8);
  v2 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v51);
  v4 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v46 - v5;
  v7 = type metadata accessor for Calendar.Component(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000033B8((uint64_t *)&unk_100051980);
  v12 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v11);
  v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v46 - v15;
  v46 = COERCE_DOUBLE(type metadata accessor for Calendar(0));
  v52 = *(_QWORD *)(*(_QWORD *)&v46 - 8);
  __chkstk_darwin(*(_QWORD *)&v46);
  v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for TimelineEntryRelevance(0);
  v48 = *(_QWORD *)(v19 - 8);
  v49 = v19;
  __chkstk_darwin(v19);
  v47 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = TimelineEntryRelevance.init(score:duration:)(0.1, 0.0);
  static Calendar.current.getter(v21);
  v22 = v7;
  v23 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for Calendar.Component.day(_:), v7);
  Date.init()(v23);
  Calendar.startOfDay(for:)(v4);
  v24 = *(void (**)(char *, uint64_t))(v1 + 8);
  v25 = v4;
  v26 = (uint64_t)v16;
  v27 = v51;
  v24(v25, v51);
  v50 = v18;
  Calendar.date(byAdding:value:to:wrappingComponents:)(v10, 1, v6, 0);
  v24(v6, v27);
  v28 = v10;
  v29 = v27;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v28, v22);
  sub_100003478(v26, (uint64_t)v14, (uint64_t *)&unk_100051980);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v14, 1, v27) == 1)
  {
    v30 = sub_1000034BC((uint64_t)v14, (uint64_t *)&unk_100051980);
    v31 = static os_log_type_t.error.getter(v30);
    v32 = HKLogActivity;
    os_log(_:dso:log:_:_:)(v31, &_mh_execute_header, v32, "Time-based relevance is default because time until tomorrow could not be determined.", 84, 2, &_swiftEmptyArrayStorage);

    sub_1000034BC(v26, (uint64_t *)&unk_100051980);
    (*(void (**)(char *, double))(v52 + 8))(v50, COERCE_DOUBLE(*(_QWORD *)&v46));
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v48 + 32))(v53, v47, v49);
  }
  else
  {
    v34 = v50;
    v35 = v26;
    v37 = v52;
    v36 = v53;
    v38 = Date.timeIntervalSinceNow.getter();
    v39 = ((uint64_t (*)(char *, uint64_t))v24)(v14, v29);
    v40 = static os_log_type_t.default.getter(v39);
    v41 = (void *)HKLogActivity;
    if (v38 < 0.0 || v38 >= 7200.0)
    {
      v45 = HKLogActivity;
      os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v45, "Time-based relevance is default because current time is not approaching midnight.", 81, 2, &_swiftEmptyArrayStorage);

      sub_1000034BC(v35, (uint64_t *)&unk_100051980);
      (*(void (**)(char *, double))(v37 + 8))(v34, COERCE_DOUBLE(*(_QWORD *)&v46));
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v48 + 32))(v36, v47, v49);
    }
    else
    {
      v42 = sub_1000033B8(&qword_100051368);
      v43 = swift_allocObject(v42, 72, 7);
      *(_OWORD *)(v43 + 16) = xmmword_10003FCE0;
      *(_QWORD *)(v43 + 56) = &type metadata for Double;
      *(_QWORD *)(v43 + 64) = &protocol witness table for Double;
      *(double *)(v43 + 32) = v38;
      v44 = v41;
      os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v44, "Time-based relevance is 0.5 because the current time is approaching midnight. Relevance duration: %f", v46);

      swift_bridgeObjectRelease(v43);
      TimelineEntryRelevance.init(score:duration:)(0.5, v38);
      sub_1000034BC(v35, (uint64_t *)&unk_100051980);
      (*(void (**)(char *, double))(v37 + 8))(v34, COERCE_DOUBLE(*(_QWORD *)&v46));
      return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v47, v49);
    }
  }
}

uint64_t sub_100010528(void *a1)
{
  return sub_1000105F4(a1, (uint64_t)&unk_10004E820, (uint64_t)sub_100012624, (uint64_t)&unk_10004E838);
}

void sub_100010544(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  _BYTE v6[24];
  _BYTE v7[24];
  id v8;

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v7, 0, 0);
  Strong = swift_weakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    swift_beginAccess(Strong + 48, v6, 33, 0);
    sub_1000113C4((Swift::Int *)&v8, a2);
    swift_endAccess(v6);
    swift_release(v5);

  }
}

uint64_t sub_1000105D8(void *a1)
{
  return sub_1000105F4(a1, (uint64_t)&unk_10004E7D0, (uint64_t)sub_100011124, (uint64_t)&unk_10004E7E8);
}

uint64_t sub_1000105F4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD aBlock[5];
  uint64_t v28;

  v9 = type metadata accessor for DispatchWorkItemFlags(0);
  v25 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for DispatchQoS(0);
  v12 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin();
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = *(_QWORD *)(v4 + 24);
  v15 = swift_allocObject(&unk_10004E708, 24, 7);
  swift_weakInit(v15 + 16, v4);
  v16 = swift_allocObject(a2, 32, 7);
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = a1;
  aBlock[4] = a3;
  v28 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CBA8;
  aBlock[3] = a4;
  v17 = _Block_copy(aBlock);
  swift_retain(v15);
  static DispatchQoS.unspecified.getter(a1);
  v26 = &_swiftEmptyArrayStorage;
  v18 = sub_100008304(&qword_100051370, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v19 = sub_1000033B8((uint64_t *)&unk_100051960);
  v20 = sub_100012AA0((unint64_t *)&qword_100051378, (uint64_t *)&unk_100051960);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v19, v20, v9, v18);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v14, v11, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v24);
  v21 = v28;
  swift_release(v15);
  return swift_release(v21);
}

void sub_100010808(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  void *v6;
  _BYTE v7[24];
  _BYTE v8[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_weakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    swift_beginAccess(Strong + 48, v7, 33, 0);
    v6 = (void *)sub_100012114(a2);
    swift_endAccess(v7);
    swift_release(v5);

  }
}

uint64_t sub_100010894(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t result;
  uint64_t v11;
  _QWORD aBlock[5];
  uint64_t v13;
  unsigned __int8 v14;

  v2 = v1;
  v14 = 0;
  v4 = *(NSObject **)(v1 + 24);
  v5 = (_QWORD *)swift_allocObject(&unk_10004E758, 40, 7);
  v5[2] = &v14;
  v5[3] = v2;
  v5[4] = a1;
  v6 = swift_allocObject(&unk_10004E780, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_1000110E4;
  *(_QWORD *)(v6 + 24) = v5;
  aBlock[4] = sub_100011100;
  v13 = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100010BB0;
  aBlock[3] = &unk_10004E798;
  v7 = _Block_copy(aBlock);
  v8 = v13;
  swift_retain(v2);
  v9 = a1;
  swift_retain(v6);
  swift_release(v8);
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation(v6, "", 110, 376, 27, 1);
  result = swift_release(v6);
  if ((v4 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v11 = v14;
    swift_release(v5);
    return v11;
  }
  return result;
}

uint64_t sub_1000109E0(_BYTE *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t result;
  _BYTE v8[24];

  swift_beginAccess(a2 + 48, v8, 0, 0);
  v6 = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain(v6);
  LOBYTE(a3) = sub_100010A54(a3, v6);
  result = swift_bridgeObjectRelease(v6);
  *a1 = a3 & 1;
  return result;
}

uint64_t sub_100010A54(void *a1, uint64_t a2)
{
  id v4;
  char v5;
  Swift::Int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  id v16;

  if ((a2 & 0xC000000000000001) != 0)
  {
    v4 = a1;
    v5 = __CocoaSet.contains(_:)();

    return v5 & 1;
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v7 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40)),
        v8 = -1 << *(_BYTE *)(a2 + 32),
        v9 = v7 & ~v8,
        v10 = a2 + 56,
        ((*(_QWORD *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0))
  {
LABEL_11:
    v13 = 0;
    return v13 & 1;
  }
  sub_1000127C4(0, &qword_100051970, HKQuery_ptr);
  v11 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v9);
  v12 = static NSObject.== infix(_:_:)(v11, a1);

  if ((v12 & 1) == 0)
  {
    v14 = ~v8;
    v15 = (v9 + 1) & v14;
    if (((*(_QWORD *)(v10 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
    {
      do
      {
        v16 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v15);
        v13 = static NSObject.== infix(_:_:)(v16, a1);

        if ((v13 & 1) != 0)
          break;
        v15 = (v15 + 1) & v14;
      }
      while (((*(_QWORD *)(v10 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0);
      return v13 & 1;
    }
    goto LABEL_11;
  }
  v13 = 1;
  return v13 & 1;
}

uint64_t sub_100010BB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100010BD0()
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
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[5];
  uint64_t v20;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v18 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000127C4(0, (unint64_t *)&qword_100051950, OS_dispatch_queue_ptr);
  v9 = (void *)static OS_dispatch_queue.main.getter();
  v10 = swift_allocObject(&unk_10004E708, 24, 7);
  swift_weakInit(v10 + 16, v1);
  aBlock[4] = sub_100011098;
  v20 = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000CBA8;
  aBlock[3] = &unk_10004E720;
  v11 = _Block_copy(aBlock);
  v12 = swift_release(v20);
  static DispatchQoS.unspecified.getter(v12);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v13 = sub_100008304(&qword_100051370, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v14 = sub_1000033B8((uint64_t *)&unk_100051960);
  v15 = sub_100012AA0((unint64_t *)&qword_100051378, (uint64_t *)&unk_100051960);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v14, v15, v2, v13);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100010DE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  unsigned __int8 v4;
  _BYTE v5[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v5, 0, 0);
  result = swift_weakLoadStrong(v1);
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_wheelchairCache), "isWheelchairUser");
    *(_BYTE *)(v3 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser) = v4;
    return swift_release(v3);
  }
  return result;
}

uint64_t sub_100010E54()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  sub_1000034BC(v0 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalPauseRingsResumeDate, (uint64_t *)&unk_100051980);

  return v0;
}

uint64_t sub_100010EE0()
{
  uint64_t v0;

  sub_100010E54();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100010F04()
{
  return type metadata accessor for FitnessWidgetDataProvider(0);
}

uint64_t type metadata accessor for FitnessWidgetDataProvider(uint64_t a1)
{
  uint64_t result;

  result = qword_100051710;
  if (!qword_100051710)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FitnessWidgetDataProvider);
  return result;
}

void sub_100010F48(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[14];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[2] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[5] = "\b";
  sub_10000C598(319);
  if (v3 <= 0x3F)
  {
    v4[6] = *(_QWORD *)(v2 - 8) + 64;
    v4[7] = "\b";
    v4[8] = &unk_1000402A8;
    v4[9] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[10] = &unk_1000402C0;
    v4[11] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[12] = "\b";
    v4[13] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_updateClassMetadata2(a1, 256, 14, v4, a1 + 80);
  }
}

uint64_t getEnumTagSinglePayload for FitnessWidgetDataProvider.Layout(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FitnessWidgetDataProvider.Layout(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for FitnessWidgetDataProvider.Layout()
{
  return &type metadata for FitnessWidgetDataProvider.Layout;
}

uint64_t sub_100011074()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100011098()
{
  uint64_t v0;

  return sub_100010DE0(v0);
}

uint64_t sub_1000110A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000110B0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000110B8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000110E4()
{
  uint64_t v0;

  return sub_1000109E0(*(_BYTE **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1000110F0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100011100()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_100011124()
{
  uint64_t v0;

  sub_100010808(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100011130(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v7;
  void (*v8)(id, uint64_t, void *);
  uint64_t v9;
  id v10;
  id v11;

  v5 = a3;
  v8 = *(void (**)(id, uint64_t, void *))(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    v9 = sub_1000127C4(0, &qword_1000519E0, HKSample_ptr);
    v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v9);
  }
  swift_retain(v7);
  v10 = a2;
  v11 = a4;
  v8(v10, v5, a4);
  swift_release(v7);

  return swift_bridgeObjectRelease(v5);
}

id sub_1000111D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v7;
  Class isa;
  Class v14;
  Class v15;
  Class v16;
  void *v17;
  id v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  _QWORD aBlock[5];
  uint64_t v26;

  v7 = v6;
  isa = Date._bridgeToObjectiveC()().super.isa;
  v14 = Date._bridgeToObjectiveC()().super.isa;
  v15 = DateComponents._bridgeToObjectiveC()().super.isa;
  v16 = DateComponents._bridgeToObjectiveC()().super.isa;
  aBlock[4] = a5;
  v26 = a6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001112C;
  aBlock[3] = &unk_10004E8D8;
  v17 = _Block_copy(aBlock);
  v18 = objc_msgSend(v7, "initWithStartDate:endDate:moveIntervalComponents:exerciseIntervalComponents:initialQueryResultsHandler:", isa, v14, v15, v16, v17);
  _Block_release(v17);

  v19 = type metadata accessor for DateComponents(0);
  v20 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8);
  v20(a4, v19);
  v20(a3, v19);
  v21 = type metadata accessor for Date(0);
  v22 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8);
  v22(a2, v21);
  v22(a1, v21);
  swift_release(v26);
  return v18;
}

void sub_10001133C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  void (*v8)(id, void *, void *);
  id v9;
  id v10;
  id v11;

  v8 = *(void (**)(id, void *, void *))(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  swift_retain(v7);
  v11 = a2;
  v9 = a3;
  v10 = a4;
  v8(v11, a3, a4);
  swift_release(v7);

}

uint64_t sub_1000113C4(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  Swift::Int v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  Swift::Int v32;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      v31 = v9;
      v10 = sub_1000127C4(0, &qword_100051970, HKQuery_ptr);
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v23 = sub_100011660(v7, result + 1);
    v32 = v23;
    v24 = *(_QWORD *)(v23 + 16);
    if (*(_QWORD *)(v23 + 24) <= v24)
    {
      v29 = v24 + 1;
      v30 = v8;
      sub_100011854(v29);
      v25 = v32;
    }
    else
    {
      v25 = v23;
      v26 = v8;
    }
    sub_100011AF0((uint64_t)v8, v25);
    v28 = *v3;
    *v3 = v25;
  }
  else
  {
    v12 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v13 = NSObject._rawHashValue(seed:)(v12);
    v14 = -1 << *(_BYTE *)(v6 + 32);
    v15 = v13 & ~v14;
    if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
    {
      sub_1000127C4(0, &qword_100051970, HKQuery_ptr);
      v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
      v17 = static NSObject.== infix(_:_:)();

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v21 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        v22 = v21;
        return 0;
      }
      v18 = ~v14;
      while (1)
      {
        v15 = (v15 + 1) & v18;
        if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
          break;
        v19 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
        v20 = static NSObject.== infix(_:_:)();

        if ((v20 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_100011B70((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    v28 = *v3;
    *v3 = v32;
  }
  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1;
}

Swift::Int sub_100011660(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_1000033B8(&qword_100051978);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      v7 = v6;
      v8 = sub_1000127C4(0, &qword_100051970, HKQuery_ptr);
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_100011854(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()();
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

Swift::Int sub_100011854(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000033B8(&qword_100051978);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_100011AF0(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_100011B70(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100011854(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_100011CF4();
      goto LABEL_14;
    }
    sub_100011E9C(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_1000127C4(0, &qword_100051970, HKQuery_ptr);
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v19 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * a2) = a1;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v22;
}

id sub_100011CF4()
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
  sub_1000033B8(&qword_100051978);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
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

Swift::Int sub_100011E9C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000033B8(&qword_100051978);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v30 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    v21 = *(_QWORD *)(v6 + 40);
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    result = NSObject._rawHashValue(seed:)(v21);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100012114(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  char v7;
  uint64_t v8;
  Swift::Int v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v2 = v1;
  v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    if (v4 < 0)
      v5 = *v1;
    else
      v5 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v6 = a1;
    v7 = __CocoaSet.contains(_:)();

    if ((v7 & 1) != 0)
    {
      v8 = sub_1000122E8(v5, (uint64_t)v6);
      swift_bridgeObjectRelease(v4);
      return v8;
    }
LABEL_15:
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  v9 = *(_QWORD *)(v4 + 40);
  swift_bridgeObjectRetain(v4);
  v10 = NSObject._rawHashValue(seed:)(v9);
  v11 = -1 << *(_BYTE *)(v4 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
    goto LABEL_15;
  sub_1000127C4(0, &qword_100051970, HKQuery_ptr);
  v13 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v12);
  v14 = static NSObject.== infix(_:_:)(v13, a1);

  if ((v14 & 1) == 0)
  {
    v15 = ~v11;
    do
    {
      v12 = (v12 + 1) & v15;
      if (((*(_QWORD *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
        goto LABEL_15;
      v16 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v12);
      v17 = static NSObject.== infix(_:_:)(v16, a1);

    }
    while ((v17 & 1) == 0);
  }
  swift_bridgeObjectRelease(v4);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v19 = *v2;
  v22 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100011CF4();
    v19 = v22;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * v12);
  sub_100012480(v12);
  v20 = *v2;
  *v2 = v22;
  swift_bridgeObjectRelease(v20);
  return v8;
}

uint64_t sub_1000122E8(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  uint64_t v6;
  uint64_t v7;
  Swift::Int v8;
  Swift::Int v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  uint64_t result;
  Swift::Int v19;

  v3 = v2;
  swift_bridgeObjectRelease(*v3);
  v6 = __CocoaSet.count.getter(a1);
  v7 = swift_unknownObjectRetain(a1);
  v8 = sub_100011660(v7, v6);
  v19 = v8;
  v9 = *(_QWORD *)(v8 + 40);
  swift_retain(v8);
  v10 = NSObject._rawHashValue(seed:)(v9);
  v11 = -1 << *(_BYTE *)(v8 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
  {
    sub_1000127C4(0, &qword_100051970, HKQuery_ptr);
    v13 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * v12);
    v14 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

    if ((v14 & 1) != 0)
    {
LABEL_6:
      swift_release(v8);
      v8 = *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v12);
      sub_100012480(v12);
      if ((static NSObject.== infix(_:_:)(a2, v8) & 1) != 0)
      {
        *v3 = v19;
        return v8;
      }
      __break(1u);
    }
    else
    {
      v15 = ~v11;
      while (1)
      {
        v12 = (v12 + 1) & v15;
        if (((*(_QWORD *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
          break;
        v16 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * v12);
        v17 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

        if ((v17 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release(v8);
    __break(1u);
  }
  result = swift_release(v8);
  __break(1u);
  return result;
}

unint64_t sub_100012480(unint64_t result)
{
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  Swift::Int v10;
  id v11;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain(*v1);
    v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 40);
        v11 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v12 = NSObject._rawHashValue(seed:)(v10);

        v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            v16 = *(_QWORD *)(v3 + 48);
            v17 = (_QWORD *)(v16 + 8 * v2);
            v18 = (_QWORD *)(v16 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v17 >= v18 + 1))
            {
              *v17 = *v18;
              v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release(v3);
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v19 = *(_QWORD *)(v3 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void sub_100012624()
{
  uint64_t v0;

  sub_100010544(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

id sub_10001262C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 56);
  *a1 = v2;
  return v2;
}

id sub_100012658@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_internalLatestStatistics);
  *a1 = v2;
  return v2;
}

unint64_t sub_10001268C()
{
  unint64_t result;

  result = qword_1000519B8;
  if (!qword_1000519B8)
  {
    result = swift_getWitnessTable(&unk_10004033C, &type metadata for DataProviderError);
    atomic_store(result, (unint64_t *)&qword_1000519B8);
  }
  return result;
}

uint64_t sub_1000126D4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  return sub_10000F838(a1, a2, a3, *(_QWORD *)(v3 + 16), *(uint64_t (**)(void *, uint64_t))(v3 + 24));
}

uint64_t sub_1000126E0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

void sub_10001271C()
{
  uint64_t v0;

  sub_10000F974(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(id, _QWORD))(v0 + 40));
}

uint64_t sub_100012730(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_10000E50C(a1, a2, a3, *(_QWORD *)(v3 + 16), *(void (**)(char *, uint64_t))(v3 + 24), *(_QWORD *)(v3 + 32));
}

uint64_t sub_100012740()
{
  uint64_t v0;

  return sub_10000ED60(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10001274C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100012778(void *a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  return sub_10000DC4C(a1, a2, a3, *(_QWORD *)(v3 + 16), *(void (**)(void *, uint64_t))(v3 + 24));
}

uint64_t sub_100012784()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

void sub_1000127B8()
{
  uint64_t v0;

  sub_10000DDB0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id, _QWORD))(v0 + 32));
}

uint64_t sub_1000127C4(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void sub_100012800()
{
  uint64_t v0;

  sub_10000D320(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100012808()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(sub_1000033B8((uint64_t *)&unk_100051980) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 24) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  swift_release(*(_QWORD *)(v0 + 16));
  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0 + v3, v5);
  return swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_1000128A8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_1000033B8((uint64_t *)&unk_100051980) - 8) + 80);
  return sub_10000CFD4(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_1000128DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8((uint64_t *)&unk_100051980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012928()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

void sub_100012954()
{
  uint64_t v0;

  sub_10000CC3C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

_QWORD *initializeBufferWithCopyOfBuffer for DataProviderError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for DataProviderError(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for DataProviderError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

_QWORD *assignWithTake for DataProviderError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DataProviderError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataProviderError(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_100012A84()
{
  return 0;
}

ValueMetadata *type metadata accessor for DataProviderError()
{
  return &type metadata for DataProviderError;
}

uint64_t sub_100012AA0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_1000036E4(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

id sub_100012AE0@<X0>(_QWORD *a1@<X8>)
{
  return sub_10001262C(a1);
}

id sub_100012B54@<X0>(_QWORD *a1@<X8>)
{
  return sub_100012658(a1);
}

uint64_t destroy for CircularView(uint64_t a1)
{

  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
}

uint64_t initializeWithCopy for CircularView(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  swift_bridgeObjectRetain(v6);
  return a1;
}

uint64_t assignWithCopy for CircularView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v7 = *(void **)(a2 + 16);
  v8 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v7;
  v9 = v7;

  v10 = *(void **)(a1 + 24);
  v11 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v11;
  v12 = v11;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v13 = *(_QWORD *)(a2 + 40);
  v14 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14);
  return a1;
}

uint64_t assignWithTake for CircularView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

ValueMetadata *type metadata accessor for CircularView()
{
  return &type metadata for CircularView;
}

uint64_t sub_100012D04(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100041EEC, 1);
}

uint64_t sub_100012D14@<X0>(uint64_t a1@<X8>)
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
  void *v10;
  void *v11;
  _OWORD *v12;
  __int128 v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _OWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t OpaqueTypeConformance2;
  __n128 v29;
  _QWORD v31[2];
  uint64_t v32;
  _OWORD *v33;
  __int128 v34;
  id v35;

  v31[0] = a1;
  v2 = type metadata accessor for AccessibilityChildBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000033B8(&qword_100051B30);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000134A0(v1, (uint64_t)&v35);
  v11 = *(void **)(v1 + 16);
  v10 = *(void **)(v1 + 24);
  v34 = *(_OWORD *)(v1 + 32);
  v12 = (_OWORD *)swift_allocObject(&unk_10004ECB0, 64, 7);
  v13 = *(_OWORD *)(v1 + 16);
  v12[1] = *(_OWORD *)v1;
  v12[2] = v13;
  v12[3] = *(_OWORD *)(v1 + 32);
  v32 = (uint64_t)sub_100013524;
  v33 = v12;
  sub_100007750(&v35);
  v14 = v10;
  v15 = v11;
  v16 = sub_100007728((uint64_t)&v34);
  static AccessibilityChildBehavior.ignore.getter(v16);
  v17 = sub_1000033B8(&qword_100051B38);
  v18 = sub_10001352C();
  View.accessibilityElement(children:)(v5, v17, v18);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_release(v33);
  v32 = (uint64_t)sub_10003B264(v10);
  v33 = v19;
  v20 = sub_100008E40();
  v21 = Text.init<A>(_:)(&v32, &type metadata for String, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26 & 1;
  v32 = v17;
  v33 = (_OWORD *)v18;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v32, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  View.accessibility(label:)(v21, v23, v27, v25, v6, OpaqueTypeConformance2);
  sub_100008E84(v21, v23, v27);
  v29 = swift_bridgeObjectRelease(v25);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v7 + 8))(v9, v6, v29);
}

id sub_100012F14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  *a3 = static Alignment.center.getter(a1);
  a3[1] = v6;
  v7 = sub_1000033B8(&qword_100051B48);
  return sub_100012F68(a2, a1, (uint64_t)a3 + *(int *)(v7 + 44));
}

id sub_100012F68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
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
  void *v16;
  id result;
  void *v18;
  unsigned int v19;
  void *v20;
  char v21;
  uint64_t v22;
  __n128 v23;
  uint64_t v24;
  unint64_t v25;
  __int128 v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __n128 v38;
  uint64_t KeyPath;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _OWORD v64[2];
  uint64_t v65;
  uint64_t v66;
  unsigned __int8 v67;
  uint64_t v68;
  unsigned __int8 v69;
  uint64_t v70;
  char *v71;

  v59 = a2;
  v60 = type metadata accessor for Image.ResizingMode(0);
  v58 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v57 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000033B8(&qword_100051B50);
  __chkstk_darwin(v6);
  v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for StandalonePhoneRingView(0);
  __chkstk_darwin(v9);
  v11 = (char **)((char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = sub_1000033B8(&qword_100051B58);
  __chkstk_darwin(v12);
  v62 = (uint64_t)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v63 = (uint64_t)&v57 - v15;
  v16 = (void *)objc_opt_self(_HKBehavior);
  result = objc_msgSend(v16, "sharedBehavior");
  if (!result)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return result;
  }
  v18 = result;
  v19 = objc_msgSend(result, "isStandalonePhoneFitnessMode");

  v20 = *(void **)a1;
  v21 = *(_BYTE *)(a1 + 8);
  v22 = static Color.black.getter(v20);
  if (v19)
  {
    sub_100022AAC(v20, v21, 0, v22, v11, v23);
    sub_100013758((uint64_t)v11, (uint64_t)v8);
    swift_storeEnumTagMultiPayload(v8, v6, 0);
    v24 = sub_100008304(&qword_100051B60, type metadata accessor for StandalonePhoneRingView, (uint64_t)&unk_100040BB4);
    v25 = sub_1000135C8();
    _ConditionalContent<>.init(storage:)(v8, v9, &type metadata for ActivityRingsView, v24, v25);
    sub_10001379C((uint64_t)v11);
  }
  else
  {
    sub_1000253D0(v20, v21, v22, (uint64_t)v64);
    swift_release(v22);
    v26 = v64[1];
    *(_OWORD *)v8 = v64[0];
    *((_OWORD *)v8 + 1) = v26;
    *((_QWORD *)v8 + 4) = v65;
    swift_storeEnumTagMultiPayload(v8, v6, 1);
    v27 = sub_100008304(&qword_100051B60, type metadata accessor for StandalonePhoneRingView, (uint64_t)&unk_100040BB4);
    v28 = sub_1000135C8();
    _ConditionalContent<>.init(storage:)(v8, v9, &type metadata for ActivityRingsView, v27, v28);
  }
  result = objc_msgSend(v16, "sharedBehavior");
  if (!result)
    goto LABEL_11;
  v29 = result;
  v30 = a3;
  v31 = objc_msgSend(result, "isStandalonePhoneFitnessMode");

  if (v31)
  {
    v32 = Image.init(_internalSystemName:)(0x7974697669746361, 0xED000065766F6D2ELL);
    v34 = v57;
    v33 = v58;
    v35 = v60;
    (*(void (**)(char *, _QWORD, uint64_t))(v58 + 104))(v57, enum case for Image.ResizingMode.stretch(_:), v60);
    v61 = Image.resizable(capInsets:resizingMode:)(v34, v32, 0.0, 0.0, 0.0, 0.0);
    swift_release(v32);
    v36 = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v34, v35);
    v37 = static Font.title.getter(v36);
    static Font.Weight.bold.getter();
    v60 = Font.weight(_:)(v37);
    swift_release(v37);
    KeyPath = swift_getKeyPath(&unk_1000403F0, v38);
    GeometryProxy.size.getter(KeyPath);
    v41 = v40 / 3.0;
    v43 = static Alignment.center.getter(v42);
    v44 = 1;
    _FrameLayout.init(width:height:alignment:)(&v66, 0, 1, *(_QWORD *)&v41, 0, v43, v45);
    v46 = v66;
    v47 = v67;
    v48 = v68;
    v59 = v69;
    v57 = v71;
    v58 = v70;
  }
  else
  {
    v60 = 0;
    v61 = 0;
    v44 = 0;
    KeyPath = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v58 = 0;
    v59 = 0;
    v57 = 0;
  }
  v49 = v62;
  sub_10001360C(v63, v62);
  sub_10001360C(v49, v30);
  v50 = (uint64_t *)(v30 + *(int *)(sub_1000033B8(&qword_100051B70) + 48));
  v51 = v61;
  *v50 = v61;
  v50[1] = 0;
  v50[2] = v44;
  v50[3] = KeyPath;
  v52 = KeyPath;
  v54 = v59;
  v53 = v60;
  v50[4] = v60;
  v50[5] = v46;
  v50[6] = v47;
  v50[7] = v48;
  v55 = v57;
  v56 = v58;
  v50[8] = v54;
  v50[9] = v56;
  v50[10] = (uint64_t)v55;
  sub_100013654(v51, 0, v44, v52, v53);
  sub_100013690(v63);
  sub_1000136D0(v51, 0, v44, v52, v53);
  return (id)sub_100013690(v62);
}

uint64_t sub_100013468@<X0>(uint64_t a1@<X8>)
{
  return sub_100012D14(a1);
}

uint64_t sub_1000134A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8((uint64_t *)&unk_100051990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000134E8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

id sub_100013524@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_100012F14(a1, v2 + 16, a2);
}

unint64_t sub_10001352C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051B40;
  if (!qword_100051B40)
  {
    v1 = sub_1000036E4(&qword_100051B38);
    result = swift_getWitnessTable(&protocol conformance descriptor for GeometryReader<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100051B40);
  }
  return result;
}

uint64_t sub_100013578@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000135A0(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

unint64_t sub_1000135C8()
{
  unint64_t result;

  result = qword_100051B68;
  if (!qword_100051B68)
  {
    result = swift_getWitnessTable(&unk_100040B64, &type metadata for ActivityRingsView);
    atomic_store(result, (unint64_t *)&qword_100051B68);
  }
  return result;
}

uint64_t sub_10001360C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8(&qword_100051B58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013654(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;

  if (result)
  {
    v6 = result;
    swift_retain(a5);
    swift_retain(v6);
    return swift_retain(a4);
  }
  return result;
}

uint64_t sub_100013690(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000033B8(&qword_100051B58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000136D0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (result)
  {
    swift_release(result);
    swift_release(a4);
    return swift_release(a5);
  }
  return result;
}

uint64_t sub_100013708@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100013730(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_100013758(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StandalonePhoneRingView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001379C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for StandalonePhoneRingView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000137DC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_100051B78;
  if (!qword_100051B78)
  {
    v1 = sub_1000036E4(&qword_100051B80);
    v2[0] = sub_1000036E4(&qword_100051B38);
    v2[1] = sub_10001352C();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    sub_100008304((unint64_t *)&qword_100051628, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051B78);
  }
  return result;
}

_QWORD *sub_100013888(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int (*v35)(char *, uint64_t, uint64_t);
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = (_QWORD *)((char *)a1 + v14);
    v16 = (_QWORD *)((char *)a2 + v14);
    v17 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = a3[6];
    v24 = (char *)a1 + v23;
    v25 = (char *)a2 + v23;
    v26 = *(_QWORD *)v25;
    v27 = v25[8];
    sub_100013AB8(*(_QWORD *)v25, v27);
    *(_QWORD *)v24 = v26;
    v24[8] = v27;
    v28 = a3[7];
    v29 = a3[8];
    v30 = *(void **)((char *)a2 + v28);
    *(_QWORD *)((char *)a1 + v28) = v30;
    v31 = (char *)a1 + v29;
    v32 = (char *)a2 + v29;
    v33 = type metadata accessor for Date(0);
    v34 = *(_QWORD *)(v33 - 8);
    v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
    v36 = v30;
    if (v35(v32, 1, v33))
    {
      v37 = sub_1000033B8((uint64_t *)&unk_100051980);
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
    }
    v38 = a3[9];
    v39 = a3[10];
    v40 = *(void **)((char *)a2 + v38);
    *(_QWORD *)((char *)a1 + v38) = v40;
    *((_BYTE *)a1 + v39) = *((_BYTE *)a2 + v39);
    v41 = v40;
  }
  return a1;
}

uint64_t sub_100013AB8(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_retain(result);
  return result;
}

void sub_100013AC4(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + a2[5]);
  v7 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  sub_100013BF4(*(_QWORD *)((char *)a1 + a2[6]), *((_BYTE *)a1 + a2[6] + 8));

  v9 = (char *)a1 + a2[8];
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);

}

uint64_t sub_100013BF4(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_release(result);
  return result;
}

_QWORD *sub_100013C00(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(char *, uint64_t, uint64_t);
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;

  v6 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = a3[6];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = *(_QWORD *)v23;
  v25 = v23[8];
  sub_100013AB8(*(_QWORD *)v23, v25);
  *(_QWORD *)v22 = v24;
  v22[8] = v25;
  v26 = a3[7];
  v27 = a3[8];
  v28 = *(void **)((char *)a2 + v26);
  *(_QWORD *)((char *)a1 + v26) = v28;
  v29 = (char *)a1 + v27;
  v30 = (char *)a2 + v27;
  v31 = type metadata accessor for Date(0);
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48);
  v34 = v28;
  if (v33(v30, 1, v31))
  {
    v35 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  }
  v36 = a3[9];
  v37 = a3[10];
  v38 = *(void **)((char *)a2 + v36);
  *(_QWORD *)((char *)a1 + v36) = v38;
  *((_BYTE *)a1 + v37) = *((_BYTE *)a2 + v37);
  v39 = v38;
  return a1;
}

_QWORD *sub_100013E04(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(char *, uint64_t, uint64_t);
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B88);
    v6 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = a3[5];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    sub_1000034BC((uint64_t)a1 + v12, &qword_100051B90);
    v15 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  v21 = a3[6];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = *(_QWORD *)v23;
  v25 = v23[8];
  sub_100013AB8(*(_QWORD *)v23, v25);
  v26 = *(_QWORD *)v22;
  v27 = v22[8];
  *(_QWORD *)v22 = v24;
  v22[8] = v25;
  sub_100013BF4(v26, v27);
  v28 = a3[7];
  v29 = *(void **)((char *)a1 + v28);
  v30 = *(void **)((char *)a2 + v28);
  *(_QWORD *)((char *)a1 + v28) = v30;
  v31 = v30;

  v32 = a3[8];
  v33 = (char *)a1 + v32;
  v34 = (char *)a2 + v32;
  v35 = type metadata accessor for Date(0);
  v36 = *(_QWORD *)(v35 - 8);
  v37 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48);
  v38 = v37(v33, 1, v35);
  v39 = v37(v34, 1, v35);
  if (!v38)
  {
    if (!v39)
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 24))(v33, v34, v35);
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v36 + 8))(v33, v35);
    goto LABEL_14;
  }
  if (v39)
  {
LABEL_14:
    v40 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
    goto LABEL_15;
  }
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
LABEL_15:
  v41 = a3[9];
  v42 = *(void **)((char *)a1 + v41);
  v43 = *(void **)((char *)a2 + v41);
  *(_QWORD *)((char *)a1 + v41) = v43;
  v44 = v43;

  *((_BYTE *)a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  return a1;
}

char *sub_100014098(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
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
  uint64_t v23;
  uint64_t v24;

  v6 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[6];
  v14 = a3[7];
  v15 = &a1[v13];
  v16 = &a2[v13];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v17 = *(_QWORD *)&a2[v14];
  v15[8] = v16[8];
  *(_QWORD *)&a1[v14] = v17;
  v18 = a3[8];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = type metadata accessor for Date(0);
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  v24 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  a1[v24] = a2[v24];
  return a1;
}

char *sub_100014278(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B88);
    v6 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_1000034BC((uint64_t)&a1[v8], &qword_100051B90);
    v11 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *(_QWORD *)v15;
  LOBYTE(v15) = v15[8];
  v17 = *(_QWORD *)v14;
  v18 = v14[8];
  *(_QWORD *)v14 = v16;
  v14[8] = (char)v15;
  sub_100013BF4(v17, v18);
  v19 = a3[7];
  v20 = *(void **)&a1[v19];
  *(_QWORD *)&a1[v19] = *(_QWORD *)&a2[v19];

  v21 = a3[8];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = type metadata accessor for Date(0);
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48);
  v27 = v26(v22, 1, v24);
  v28 = v26(v23, 1, v24);
  if (!v27)
  {
    if (!v28)
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 40))(v22, v23, v24);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v24);
    goto LABEL_13;
  }
  if (v28)
  {
LABEL_13:
    v29 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
LABEL_14:
  v30 = a3[9];
  v31 = *(void **)&a1[v30];
  *(_QWORD *)&a1[v30] = *(_QWORD *)&a2[v30];

  a1[a3[10]] = a2[a3[10]];
  return a1;
}

uint64_t sub_1000144F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000144FC);
}

uint64_t sub_1000144FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;

  v6 = sub_1000033B8(&qword_100051B98);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = sub_1000033B8(&qword_100051BA0);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  if ((_DWORD)a2 != 2147483646)
  {
    v11 = sub_1000033B8((uint64_t *)&unk_100051980);
    v10 = *(_QWORD *)(v11 - 8);
    v12 = a3[8];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1 + v12, a2, v11);
  }
  v13 = *(_QWORD *)(a1 + a3[7]);
  if (v13 >= 0xFFFFFFFF)
    LODWORD(v13) = -1;
  v14 = v13 - 1;
  if (v14 < 0)
    v14 = -1;
  return (v14 + 1);
}

uint64_t sub_1000145E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000145EC);
}

uint64_t sub_1000145EC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_1000033B8(&qword_100051B98);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_1000033B8(&qword_100051BA0);
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
        *(_QWORD *)(a1 + a4[7]) = a2;
        return result;
      }
      v10 = sub_1000033B8((uint64_t *)&unk_100051980);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[8];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for FitnessWidgetView(uint64_t a1)
{
  uint64_t result;

  result = qword_100051C00;
  if (!qword_100051C00)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FitnessWidgetView);
  return result;
}

void sub_1000146FC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[7];

  sub_100014804(319, &qword_100051C10, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100014804(319, (unint64_t *)&unk_100051C18, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v5 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(v4 - 8) + 64;
      v8[2] = "\t";
      v8[3] = &unk_100040470;
      sub_100014804(319, (unint64_t *)&qword_100051720, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v7 <= 0x3F)
      {
        v8[4] = *(_QWORD *)(v6 - 8) + 64;
        v8[5] = &unk_100040470;
        v8[6] = &unk_100040488;
        swift_initStructMetadata(a1, 256, 7, v8, a1 + 16);
      }
    }
  }
}

void sub_100014804(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_10001485C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100041F3C, 1);
}

uint64_t sub_10001486C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  double v24;
  char v25;
  __n128 v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t OpaqueTypeConformance2;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[4];

  v2 = v1;
  v51 = a1;
  v3 = type metadata accessor for ContainerBackgroundPlacement(0);
  v49 = *(_QWORD *)(v3 - 8);
  v50 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000033B8(&qword_100051C60);
  __chkstk_darwin(v6);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000033B8(&qword_100051C68);
  __chkstk_darwin(v9);
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000033B8(&qword_100051C70);
  v13 = *(_QWORD *)(v12 - 8);
  v47 = v12;
  v48 = v13;
  __chkstk_darwin(v12);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1000033B8(&qword_100051C78);
  v45 = *(_QWORD *)(v16 - 8);
  v46 = v16;
  __chkstk_darwin(v16);
  v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100014B78(v2, (uint64_t)v8);
  v19 = v2 + *(int *)(type metadata accessor for FitnessWidgetView(0) + 24);
  v20 = *(_QWORD *)v19;
  v21 = *(_BYTE *)(v19 + 8);
  sub_100013AB8(*(_QWORD *)v19, v21);
  v22 = sub_100016B18(v20, v21);
  v23 = sub_100013BF4(v20, v21);
  if ((v22 & 1) != 0)
    v24 = 16.0;
  else
    v24 = 0.0;
  v25 = static Edge.Set.all.getter(v23);
  v26.n128_f64[0] = v24;
  v27 = EdgeInsets.init(_all:)(v26);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  sub_100003478((uint64_t)v8, (uint64_t)v11, &qword_100051C60);
  v34 = &v11[*(int *)(v9 + 36)];
  *v34 = v25;
  *((double *)v34 + 1) = v27;
  *((_QWORD *)v34 + 2) = v29;
  *((_QWORD *)v34 + 3) = v31;
  *((_QWORD *)v34 + 4) = v33;
  v34[40] = 0;
  v35 = sub_1000034BC((uint64_t)v8, &qword_100051C60);
  v36 = static ContainerBackgroundPlacement.widget.getter(v35);
  v37 = static Alignment.center.getter(v36);
  v39 = v38;
  v40 = sub_100016CA4();
  View.containerBackground<A>(for:alignment:content:)(v5, v37, v39, sub_100016A28, 0, v9, &type metadata for Color, v40, &protocol witness table for Color);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v5, v50);
  sub_1000034BC((uint64_t)v11, &qword_100051C68);
  v52[0] = v9;
  v52[1] = &type metadata for Color;
  v52[2] = v40;
  v52[3] = &protocol witness table for Color;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v52, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
  v42 = v47;
  View.unredacted()(v47, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v42);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v45 + 32))(v51, v18, v46);
}

uint64_t sub_100014B78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t result;
  void *v27;
  unsigned int v28;
  char v29;
  char v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  __n128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t);
  uint64_t (*v52)(uint64_t);
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  uint64_t v55;
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
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t OpaqueTypeConformance2;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t);
  uint64_t v117;
  uint64_t v118;
  ValueMetadata *v119;
  unint64_t v120;
  uint64_t (*v121[2])(uint64_t);

  v115 = a1;
  v113 = a2;
  v114 = sub_1000033B8(&qword_100051CF0);
  v98 = *(_QWORD *)(v114 - 8);
  __chkstk_darwin(v114);
  v96 = (char *)&v95 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v97 = (char *)&v95 - v4;
  v112 = sub_1000033B8(&qword_100051CC0);
  __chkstk_darwin(v112);
  v101 = (uint64_t)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (int *)type metadata accessor for FitnessWidgetView(0);
  v102 = *((_QWORD *)v6 - 1);
  v7 = *(_QWORD *)(v102 + 64);
  __chkstk_darwin(v6);
  v103 = (uint64_t)&v95 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = sub_1000033B8(&qword_100051CF8);
  v100 = *(_QWORD *)(v108 - 8);
  __chkstk_darwin(v108);
  v95 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v99 = (char *)&v95 - v10;
  v11 = type metadata accessor for WidgetFamily(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v95 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v17 = (char *)&v95 - v16;
  v109 = sub_1000033B8(&qword_100051D00);
  __chkstk_darwin(v109);
  v111 = (uint64_t)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = sub_1000033B8(&qword_100051D08);
  __chkstk_darwin(v104);
  v106 = (uint64_t)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = sub_1000033B8(&qword_100051CA8);
  __chkstk_darwin(v110);
  v107 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v21);
  v23 = (char *)&v95 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = type metadata accessor for StandaloneSummaryView(0);
  __chkstk_darwin(v105);
  v25 = (char **)((char *)&v95 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = (uint64_t)objc_msgSend((id)objc_opt_self(_HKBehavior), "sharedBehavior");
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  v27 = (void *)result;
  v28 = objc_msgSend((id)result, "isStandalonePhoneFitnessMode");

  if (!v28)
  {
    v49 = v115;
    sub_100016FD0(&qword_100051B88, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, (char *)0x6146746567646957, (char *)0xEC000000796C696DLL, (uint64_t)v17);
    (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, enum case for WidgetFamily.systemMedium(_:), v11);
    v50 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(&v116, v11, v50);
    dispatch thunk of RawRepresentable.rawValue.getter(v121, v11, v50);
    v51 = v116;
    v52 = v121[0];
    v53 = *(void (**)(char *, uint64_t))(v12 + 8);
    v53(v14, v11);
    v53(v17, v11);
    v54 = v103;
    sub_100017970(v49, v103, type metadata accessor for FitnessWidgetView);
    v55 = *(unsigned __int8 *)(v102 + 80);
    v56 = (v55 + 16) & ~v55;
    v57 = v56 + v7;
    v58 = v55 | 7;
    if (v51 == v52)
    {
      v59 = swift_allocObject(&unk_10004ED40, v57, v58);
      sub_10001792C(v54, v59 + v56, type metadata accessor for FitnessWidgetView);
      v116 = sub_100017838;
      v117 = v59;
      v60 = v101;
      sub_1000165AC(v101);
      v61 = type metadata accessor for DynamicTypeSize(0);
      v62 = sub_100008304(&qword_100051D10, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
      result = dispatch thunk of static Equatable.== infix(_:_:)(v60, v60, v61, v62);
      if ((result & 1) != 0)
      {
        v63 = sub_1000033B8(&qword_100051CB8);
        v64 = sub_100003928(&qword_100051CC8, &qword_100051CB8, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
        v65 = sub_100003928(&qword_100051CD0, &qword_100051CC0, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
        v66 = v95;
        v67 = v112;
        View.dynamicTypeSize<A>(_:)(v60, v63, v112, v64, v65);
        sub_1000034BC(v60, &qword_100051CC0);
        swift_release(v117);
        v68 = v100;
        v69 = v99;
        v70 = v108;
        (*(void (**)(char *, char *, uint64_t))(v100 + 32))(v99, v66, v108);
        v71 = v106;
        (*(void (**)(uint64_t, char *, uint64_t))(v68 + 16))(v106, v69, v70);
        swift_storeEnumTagMultiPayload(v71, v104, 1);
        v72 = sub_100008304(&qword_100051CB0, type metadata accessor for StandaloneSummaryView, (uint64_t)&unk_100041010);
        v116 = (uint64_t (*)(uint64_t))v63;
        v117 = v67;
        v118 = v64;
        v119 = (ValueMetadata *)v65;
        OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v116, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
        v74 = (uint64_t)v107;
        _ConditionalContent<>.init(storage:)(v71, v105, v70, v72, OpaqueTypeConformance2);
        v75 = v111;
        sub_100003478(v74, v111, &qword_100051CA8);
        swift_storeEnumTagMultiPayload(v75, v109, 0);
        v76 = sub_100016E64();
        v77 = sub_1000036E4(&qword_100051CD8);
        v78 = sub_100003928(&qword_100051CE0, &qword_100051CD8, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
        v116 = (uint64_t (*)(uint64_t))v77;
        v117 = v67;
        v118 = v78;
        v119 = (ValueMetadata *)v65;
        v79 = swift_getOpaqueTypeConformance2(&v116, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
        _ConditionalContent<>.init(storage:)(v75, v110, v114, v76, v79);
        sub_1000034BC(v74, &qword_100051CA8);
        return (*(uint64_t (**)(char *, uint64_t))(v100 + 8))(v99, v70);
      }
      __break(1u);
    }
    else
    {
      v80 = swift_allocObject(&unk_10004ED18, v57, v58);
      sub_10001792C(v54, v80 + v56, type metadata accessor for FitnessWidgetView);
      v116 = sub_1000176B4;
      v117 = v80;
      v81 = v101;
      sub_1000165AC(v101);
      v82 = type metadata accessor for DynamicTypeSize(0);
      v83 = sub_100008304(&qword_100051D10, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
      result = dispatch thunk of static Equatable.== infix(_:_:)(v81, v81, v82, v83);
      if ((result & 1) != 0)
      {
        v84 = sub_1000033B8(&qword_100051CD8);
        v85 = sub_100003928(&qword_100051CE0, &qword_100051CD8, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
        v86 = sub_100003928(&qword_100051CD0, &qword_100051CC0, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
        v87 = v96;
        v88 = v112;
        View.dynamicTypeSize<A>(_:)(v81, v84, v112, v85, v86);
        sub_1000034BC(v81, &qword_100051CC0);
        swift_release(v117);
        v89 = v98;
        v90 = v97;
        v91 = v114;
        (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v97, v87, v114);
        v92 = v111;
        (*(void (**)(uint64_t, char *, uint64_t))(v89 + 16))(v111, v90, v91);
        swift_storeEnumTagMultiPayload(v92, v109, 1);
        v93 = sub_100016E64();
        v116 = (uint64_t (*)(uint64_t))v84;
        v117 = v88;
        v118 = v85;
        v119 = (ValueMetadata *)v86;
        v94 = swift_getOpaqueTypeConformance2(&v116, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
        _ConditionalContent<>.init(storage:)(v92, v110, v91, v93, v94);
        return (*(uint64_t (**)(char *, uint64_t))(v89 + 8))(v90, v91);
      }
    }
    __break(1u);
    goto LABEL_13;
  }
  v119 = &type metadata for WidgetFeatureFlags;
  v120 = sub_1000178A0();
  v29 = isFeatureEnabled(_:)(&v116);
  sub_1000178E4(&v116);
  if (qword_1000511F0 != -1)
    swift_once(&qword_1000511F0, sub_10003D274);
  v30 = *(_BYTE *)(v115 + v6[10]);
  v31 = (void *)qword_1000548F8;
  v32 = *(void **)(v115 + v6[7]);
  sub_100003478(v115 + v6[8], (uint64_t)v23, (uint64_t *)&unk_100051980);
  v33 = v32;
  v34 = v31;
  sub_1000284F8(v29 & 1, v34, v30, v32, (uint64_t)v23, v25, v35);
  v36 = v106;
  sub_100017970((uint64_t)v25, v106, type metadata accessor for StandaloneSummaryView);
  swift_storeEnumTagMultiPayload(v36, v104, 0);
  v37 = sub_100008304(&qword_100051CB0, type metadata accessor for StandaloneSummaryView, (uint64_t)&unk_100041010);
  v38 = sub_1000036E4(&qword_100051CB8);
  v39 = sub_100003928(&qword_100051CC8, &qword_100051CB8, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
  v40 = sub_100003928(&qword_100051CD0, &qword_100051CC0, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
  v41 = v112;
  v116 = (uint64_t (*)(uint64_t))v38;
  v117 = v112;
  v118 = v39;
  v119 = (ValueMetadata *)v40;
  v42 = swift_getOpaqueTypeConformance2(&v116, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
  v43 = (uint64_t)v107;
  _ConditionalContent<>.init(storage:)(v36, v105, v108, v37, v42);
  v44 = v111;
  sub_100003478(v43, v111, &qword_100051CA8);
  swift_storeEnumTagMultiPayload(v44, v109, 0);
  v45 = sub_100016E64();
  v46 = sub_1000036E4(&qword_100051CD8);
  v47 = sub_100003928(&qword_100051CE0, &qword_100051CD8, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
  v116 = (uint64_t (*)(uint64_t))v46;
  v117 = v41;
  v118 = v47;
  v119 = (ValueMetadata *)v40;
  v48 = swift_getOpaqueTypeConformance2(&v116, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
  _ConditionalContent<>.init(storage:)(v44, v110, v114, v45, v48);
  sub_1000034BC(v43, &qword_100051CA8);
  return sub_1000179B4((uint64_t)v25, type metadata accessor for StandaloneSummaryView);
}

uint64_t sub_100015648@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = static VerticalAlignment.top.getter();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v4 = sub_1000033B8(&qword_100051D20);
  return sub_1000156A4(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_1000156A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  void *v40;
  id v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  __n128 v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t (*v53)(char *, uint64_t, uint64_t);
  int v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _OWORD *v67;
  __int128 v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  __n128 v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  char v85;
  __n128 v86;
  double v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  __n128 v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  __n128 v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  char v123;
  uint64_t KeyPath;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v140;
  uint64_t v141;
  int *v142;
  uint64_t *v143;
  uint64_t v144;
  char *v145;
  uint64_t *v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  _QWORD *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;

  v155 = a2;
  v152 = type metadata accessor for ChartsSection(0);
  __chkstk_darwin(v152);
  v143 = (uint64_t *)((char *)&v140 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  v144 = (uint64_t)&v140 - v5;
  v149 = sub_1000033B8(&qword_100051D28);
  __chkstk_darwin(v149);
  v151 = (uint64_t)&v140 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v150 = type metadata accessor for PauseRingsLabel(0);
  __chkstk_darwin(v150);
  v146 = (uint64_t *)((char *)&v140 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  v148 = (uint64_t)&v140 - v9;
  v158 = type metadata accessor for Date(0);
  v169 = *(_QWORD *)(v158 - 8);
  __chkstk_darwin(v158);
  v147 = (char *)&v140 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000033B8(&qword_100051D30);
  __chkstk_darwin(v11);
  v154 = (char *)&v140 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v153 = (uint64_t)&v140 - v14;
  v15 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v15);
  v167 = (uint64_t)&v140 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v166 = (uint64_t)&v140 - v18;
  __chkstk_darwin(v19);
  v162 = (uint64_t)&v140 - v20;
  __chkstk_darwin(v21);
  v156 = (uint64_t)&v140 - v22;
  __chkstk_darwin(v23);
  v25 = (char *)&v140 - v24;
  __chkstk_darwin(v26);
  v28 = (char *)&v140 - v27;
  v29 = type metadata accessor for SummarySection(0);
  __chkstk_darwin(v29);
  v31 = (uint64_t *)((char *)&v140 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  v159 = sub_1000033B8(&qword_100051D38);
  __chkstk_darwin(v159);
  v161 = (uint64_t)&v140 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v160 = sub_1000033B8(&qword_100051D40);
  __chkstk_darwin(v160);
  v165 = (uint64_t)&v140 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v164 = sub_1000033B8(&qword_100051D48);
  __chkstk_darwin(v164);
  v168 = (uint64_t)&v140 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  v163 = (uint64_t)&v140 - v36;
  __chkstk_darwin(v37);
  v170 = (char *)&v140 - v38;
  v39 = (int *)type metadata accessor for FitnessWidgetView(0);
  v141 = v39[7];
  v40 = *(void **)(a1 + v141);
  *((_QWORD *)&v172 + 1) = &type metadata for WidgetFeatureFlags;
  *(_QWORD *)&v173 = sub_1000178A0();
  v41 = v40;
  v42 = isFeatureEnabled(_:)(&v171);
  v43 = sub_1000178E4(&v171);
  GeometryProxy.size.getter(v43);
  v45 = v44;
  v140 = v39[10];
  v46 = *(_BYTE *)(a1 + v140);
  v142 = v39;
  v47 = a1 + v39[8];
  sub_100003478(v47, (uint64_t)v28, (uint64_t *)&unk_100051980);
  v157 = v31;
  v48.n128_u64[0] = v45;
  v49 = v46;
  v50 = v158;
  v145 = v28;
  v51 = sub_10001A69C(v40, v42 & 1, v49, (uint64_t)v28, v31, v48);
  v52 = GeometryProxy.size.getter(v51);
  sub_100003478(v47, (uint64_t)v25, (uint64_t *)&unk_100051980);
  v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v169 + 48);
  v54 = v53(v25, 1, v50);
  v55 = a1;
  sub_1000034BC((uint64_t)v25, (uint64_t *)&unk_100051980);
  v56 = 0.5;
  if (v54 == 1)
  {
    if ((sub_1000162EC() & 1) != 0)
      v56 = 1.0;
    else
      v56 = 0.5;
  }
  v57 = v156;
  sub_100003478(v47, v156, (uint64_t *)&unk_100051980);
  v58 = v53((char *)v57, 1, v50);
  v59 = sub_1000034BC(v57, (uint64_t *)&unk_100051980);
  v60 = 0.0;
  v61 = 0.0;
  if (v58 == 1)
  {
    v59 = sub_1000162EC();
    v61 = 8.0;
    if ((v59 & 1) != 0)
      v61 = 0.0;
  }
  v62 = v52 * v56 - v61;
  v63 = static Alignment.center.getter(v59);
  _FrameLayout.init(width:height:alignment:)(&v171, *(_QWORD *)&v62, 0, 0, 1, v63, v64);
  v65 = (uint64_t)v157;
  v66 = v161;
  sub_100017970((uint64_t)v157, v161, type metadata accessor for SummarySection);
  v67 = (_OWORD *)(v66 + *(int *)(v159 + 36));
  v68 = v172;
  *v67 = v171;
  v67[1] = v68;
  v67[2] = v173;
  v69 = sub_1000179B4(v65, type metadata accessor for SummarySection);
  v70 = static Edge.Set.trailing.getter(v69);
  v71 = v162;
  sub_100003478(v47, v162, (uint64_t *)&unk_100051980);
  LODWORD(v62) = v53((char *)v71, 1, v50);
  sub_1000034BC(v71, (uint64_t *)&unk_100051980);
  v73 = (uint64_t)v170;
  if (LODWORD(v62) == 1)
  {
    if ((sub_1000162EC() & 1) != 0)
      v60 = 0.0;
    else
      v60 = 8.0;
  }
  v72.n128_f64[0] = v60;
  v74 = EdgeInsets.init(_all:)(v72);
  v76 = v75;
  v78 = v77;
  v80 = v79;
  v81 = v165;
  sub_100003478(v66, v165, &qword_100051D38);
  v82 = v81 + *(int *)(v160 + 36);
  *(_BYTE *)v82 = v70;
  *(double *)(v82 + 8) = v74;
  *(_QWORD *)(v82 + 16) = v76;
  *(_QWORD *)(v82 + 24) = v78;
  *(_QWORD *)(v82 + 32) = v80;
  *(_BYTE *)(v82 + 40) = 0;
  v83 = sub_1000034BC(v66, &qword_100051D38);
  v84 = static Edge.Set.bottom.getter(v83);
  v85 = sub_1000162EC();
  v86.n128_u64[0] = -4.0;
  if ((v85 & 1) != 0)
    v86.n128_f64[0] = 0.0;
  v87 = EdgeInsets.init(_all:)(v86);
  v89 = v88;
  v91 = v90;
  v93 = v92;
  v94 = v163;
  sub_100003478(v81, v163, &qword_100051D40);
  v95 = v94 + *(int *)(v164 + 36);
  *(_BYTE *)v95 = v84;
  *(double *)(v95 + 8) = v87;
  *(_QWORD *)(v95 + 16) = v89;
  *(_QWORD *)(v95 + 24) = v91;
  *(_QWORD *)(v95 + 32) = v93;
  *(_BYTE *)(v95 + 40) = 0;
  sub_1000034BC(v81, &qword_100051D40);
  sub_1000082A0(v94, v73, &qword_100051D48);
  v96 = v166;
  sub_100003478(v47, v166, (uint64_t *)&unk_100051980);
  v97 = v53((char *)v96, 1, v50);
  sub_1000034BC(v96, (uint64_t *)&unk_100051980);
  v98 = v47;
  v99 = v167;
  sub_100003478(v98, v167, (uint64_t *)&unk_100051980);
  if (v53((char *)v99, 1, v50) == 1)
  {
    sub_1000034BC(v99, (uint64_t *)&unk_100051980);
    v100 = sub_1000162EC();
    v102 = v155;
    v103 = (uint64_t)v154;
    v104 = v153;
    if ((v100 & 1) != 0)
    {
      v105 = sub_1000033B8(&qword_100051D68);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v105 - 8) + 56))(v104, 1, 1, v105);
    }
    else
    {
      LODWORD(v169) = v97;
      v121 = *(void **)(v55 + v141);
      v122 = *(void **)(v55 + v142[9]);
      v123 = *(_BYTE *)(v55 + v140);
      KeyPath = swift_getKeyPath(&unk_1000404F0, v101);
      v125 = (uint64_t)v143;
      *v143 = KeyPath;
      v126 = sub_1000033B8(&qword_100051D50);
      swift_storeEnumTagMultiPayload(v125, v126, 0);
      v127 = v152;
      *(_QWORD *)(v125 + *(int *)(v152 + 20)) = v121;
      *(_QWORD *)(v125 + *(int *)(v127 + 24)) = v122;
      *(_BYTE *)(v125 + *(int *)(v127 + 28)) = v123;
      v128 = v144;
      sub_10001792C(v125, v144, type metadata accessor for ChartsSection);
      v129 = v151;
      sub_100017970(v128, v151, type metadata accessor for ChartsSection);
      swift_storeEnumTagMultiPayload(v129, v149, 1);
      v130 = sub_100008304(&qword_100051D58, type metadata accessor for PauseRingsLabel, (uint64_t)&unk_100040590);
      v131 = sub_100008304(&qword_100051D60, type metadata accessor for ChartsSection, (uint64_t)&unk_100041188);
      v132 = v121;
      v97 = v169;
      v133 = v122;
      v73 = (uint64_t)v170;
      _ConditionalContent<>.init(storage:)(v129, v150, v127, v130, v131);
      sub_1000179B4(v128, type metadata accessor for ChartsSection);
      v134 = sub_1000033B8(&qword_100051D68);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v134 - 8) + 56))(v103, 0, 1, v134);
      sub_1000082A0(v103, v104, &qword_100051D30);
    }
  }
  else
  {
    v106 = v169;
    v107 = v147;
    (*(void (**)(char *, uint64_t, uint64_t))(v169 + 32))(v147, v99, v50);
    v108 = (uint64_t)v145;
    (*(void (**)(char *, char *, uint64_t))(v106 + 16))(v145, v107, v50);
    v109.n128_f64[0] = (*(double (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v106 + 56))(v108, 0, 1, v50);
    v110 = swift_getKeyPath(&unk_100040520, v109);
    v111 = (uint64_t)v146;
    *v146 = v110;
    v112 = sub_1000033B8(&qword_100051B88);
    swift_storeEnumTagMultiPayload(v111, v112, 0);
    v113 = v150;
    sub_1000082A0(v108, v111 + *(int *)(v150 + 20), (uint64_t *)&unk_100051980);
    v114 = v97;
    v115 = v148;
    sub_10001792C(v111, v148, type metadata accessor for PauseRingsLabel);
    v116 = v151;
    sub_100017970(v115, v151, type metadata accessor for PauseRingsLabel);
    swift_storeEnumTagMultiPayload(v116, v149, 0);
    v117 = sub_100008304(&qword_100051D58, type metadata accessor for PauseRingsLabel, (uint64_t)&unk_100040590);
    v118 = sub_100008304(&qword_100051D60, type metadata accessor for ChartsSection, (uint64_t)&unk_100041188);
    v103 = (uint64_t)v154;
    _ConditionalContent<>.init(storage:)(v116, v113, v152, v117, v118);
    v119 = v115;
    v97 = v114;
    v73 = (uint64_t)v170;
    sub_1000179B4(v119, type metadata accessor for PauseRingsLabel);
    (*(void (**)(char *, uint64_t))(v106 + 8))(v107, v50);
    v120 = sub_1000033B8(&qword_100051D68);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v120 - 8) + 56))(v103, 0, 1, v120);
    v104 = v153;
    sub_1000082A0(v103, v153, &qword_100051D30);
    v102 = v155;
  }
  if (v97 == 1)
    v135 = 0x4034000000000000;
  else
    v135 = 0x4024000000000000;
  v136 = v168;
  sub_100003478(v73, v168, &qword_100051D48);
  sub_100003478(v104, v103, &qword_100051D30);
  sub_100003478(v136, v102, &qword_100051D48);
  v137 = sub_1000033B8(&qword_100051D70);
  v138 = v102 + *(int *)(v137 + 48);
  *(_QWORD *)v138 = v135;
  *(_BYTE *)(v138 + 8) = 0;
  sub_100003478(v103, v102 + *(int *)(v137 + 64), &qword_100051D30);
  sub_1000034BC(v104, &qword_100051D30);
  sub_1000034BC(v73, &qword_100051D48);
  sub_1000034BC(v103, &qword_100051D30);
  return sub_1000034BC(v136, &qword_100051D48);
}

uint64_t sub_1000162EC()
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];

  v0 = type metadata accessor for DynamicTypeSize(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v6 = (char *)&v26 - v5;
  v7 = type metadata accessor for WidgetFamily(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v26 - v12;
  v29[3] = &type metadata for WidgetFeatureFlags;
  v29[4] = sub_1000178A0();
  v14 = isFeatureEnabled(_:)(v29);
  sub_1000178E4(v29);
  if ((v14 & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    v26 = v3;
    v27 = v1;
    sub_100016FD0(&qword_100051B88, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, (char *)0x6146746567646957, (char *)0xEC000000796C696DLL, (uint64_t)v13);
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for WidgetFamily.systemSmall(_:), v7);
    v16 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(v29, v7, v16);
    dispatch thunk of RawRepresentable.rawValue.getter(&v28, v7, v16);
    v17 = v28;
    v18 = v29[0];
    v19 = *(void (**)(char *, uint64_t))(v8 + 8);
    v19(v10, v7);
    v19(v13, v7);
    type metadata accessor for FitnessWidgetView(0);
    v20 = sub_100016FD0(&qword_100051B90, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicTypeSize, (char *)0x5463696D616E7944, (char *)0xEF657A6953657079, (uint64_t)v6);
    if (v18 == v17)
    {
      v15 = DynamicTypeSize.isAccessibilitySize.getter(v20);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v0);
    }
    else
    {
      v21 = v26;
      v22 = v27;
      (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v26, enum case for DynamicTypeSize.accessibility2(_:), v0);
      v23 = sub_100008304(&qword_100051D78, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
      v15 = dispatch thunk of static Comparable.< infix(_:_:)(v6, v21, v0, v23) ^ 1;
      v24 = *(void (**)(char *, uint64_t))(v22 + 8);
      v24(v21, v0);
      v24(v6, v0);
    }
  }
  return v15 & 1;
}

uint64_t sub_1000165AC@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  char v18;
  char v19;
  uint64_t v20;
  unsigned int *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unsigned int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;

  v2 = v1;
  v4 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for WidgetFamily(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v29 - v12;
  sub_100016FD0(&qword_100051B88, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, (char *)0x6146746567646957, (char *)0xEC000000796C696DLL, (uint64_t)&v29 - v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for WidgetFamily.systemSmall(_:), v7);
  v14 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(&v30, v7, v14);
  dispatch thunk of RawRepresentable.rawValue.getter(&v29, v7, v14);
  v16 = v29;
  v15 = v30;
  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v10, v7);
  v17(v13, v7);
  v18 = sub_1000162EC();
  v19 = v18;
  if (v15 == v16)
  {
    v20 = type metadata accessor for DynamicTypeSize(0);
    if ((v19 & 1) != 0)
      v21 = (unsigned int *)&enum case for DynamicTypeSize.accessibility5(_:);
    else
      v21 = (unsigned int *)&enum case for DynamicTypeSize.xLarge(_:);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(a1, *v21, v20);
  }
  else
  {
    if ((v18 & 1) != 0
      && (v22 = type metadata accessor for FitnessWidgetView(0),
          sub_100003478(v2 + *(int *)(v22 + 32), (uint64_t)v6, (uint64_t *)&unk_100051980),
          v23 = type metadata accessor for Date(0),
          v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48))(v6, 1, v23),
          sub_1000034BC((uint64_t)v6, (uint64_t *)&unk_100051980),
          v24 == 1))
    {
      v25 = (unsigned int *)&enum case for DynamicTypeSize.accessibility2(_:);
    }
    else
    {
      v25 = (unsigned int *)&enum case for DynamicTypeSize.xxLarge(_:);
    }
    v26 = *v25;
    v27 = type metadata accessor for DynamicTypeSize(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(a1, v26, v27);
  }
}

uint64_t sub_10001681C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  void *v13;
  id v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  __n128 v20;
  uint64_t v21;
  char v22;
  char v23;
  __n128 v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v34;
  _QWORD v35[5];

  v34 = a2;
  v3 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v3);
  v5 = (char *)&v35[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SummarySection(0);
  __chkstk_darwin(v6);
  v8 = (_QWORD *)((char *)&v35[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_1000033B8(&qword_100051D80);
  __chkstk_darwin(v9);
  v11 = (char *)&v35[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (int *)type metadata accessor for FitnessWidgetView(0);
  v13 = *(void **)(a1 + v12[7]);
  v35[3] = &type metadata for WidgetFeatureFlags;
  v35[4] = sub_1000178A0();
  v14 = v13;
  v15 = isFeatureEnabled(_:)(v35);
  v16 = sub_1000178E4(v35);
  GeometryProxy.size.getter(v16);
  v18 = v17;
  v19 = *(_BYTE *)(a1 + v12[10]);
  sub_100003478(a1 + v12[8], (uint64_t)v5, (uint64_t *)&unk_100051980);
  v20.n128_u64[0] = v18;
  v21 = sub_10001A69C(v13, v15 & 1, v19, (uint64_t)v5, v8, v20);
  v22 = static Edge.Set.bottom.getter(v21);
  v23 = sub_1000162EC();
  v24.n128_u64[0] = -4.0;
  if ((v23 & 1) != 0)
    v24.n128_f64[0] = 0.0;
  v25 = EdgeInsets.init(_all:)(v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  sub_100017970((uint64_t)v8, (uint64_t)v11, type metadata accessor for SummarySection);
  v32 = &v11[*(int *)(v9 + 36)];
  *v32 = v22;
  *((double *)v32 + 1) = v25;
  *((_QWORD *)v32 + 2) = v27;
  *((_QWORD *)v32 + 3) = v29;
  *((_QWORD *)v32 + 4) = v31;
  v32[40] = 0;
  sub_1000179B4((uint64_t)v8, type metadata accessor for SummarySection);
  return sub_1000082A0((uint64_t)v11, v34, &qword_100051D80);
}

uint64_t sub_100016A28@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_100051138 != -1)
    swift_once(&qword_100051138, sub_100017A78);
  v2 = qword_100054860;
  *a1 = qword_100054860;
  return swift_retain(v2);
}

uint64_t sub_100016A7C()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_100016A9C(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ContentSizeCategory(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.sizeCategory.setter(v3);
}

uint64_t sub_100016B18(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unsigned __int8 v15;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  v8 = swift_retain(a1);
  v9 = static os_log_type_t.fault.getter(v8);
  v10 = static Log.runtimeIssuesLog.getter();
  if (os_log_type_enabled(v10, v9))
  {
    v11 = swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v14 = v12;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v11 + 4) = sub_100017230((char *)0x6C6F6F42, (char *)0xE400000000000000, &v14);
    _os_log_impl((void *)&_mh_execute_header, v10, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(v7, a1);
  sub_100013BF4(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

unint64_t sub_100016CA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051C80;
  if (!qword_100051C80)
  {
    v1 = sub_1000036E4(&qword_100051C68);
    sub_100016D10();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051C80);
  }
  return result;
}

unint64_t sub_100016D10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051C88;
  if (!qword_100051C88)
  {
    v1 = sub_1000036E4(&qword_100051C60);
    sub_100016D74();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100051C88);
  }
  return result;
}

unint64_t sub_100016D74()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_100051C90;
  if (!qword_100051C90)
  {
    v1 = sub_1000036E4(&qword_100051C98);
    sub_100016E64();
    v2[0] = sub_1000036E4(&qword_100051CD8);
    v2[1] = sub_1000036E4(&qword_100051CC0);
    v2[2] = sub_100003928(&qword_100051CE0, &qword_100051CD8, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    v2[3] = sub_100003928(&qword_100051CD0, &qword_100051CC0, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051C90);
  }
  return result;
}

unint64_t sub_100016E64()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_100051CA0;
  if (!qword_100051CA0)
  {
    v1 = sub_1000036E4(&qword_100051CA8);
    sub_100008304(&qword_100051CB0, type metadata accessor for StandaloneSummaryView, (uint64_t)&unk_100041010);
    v2[0] = sub_1000036E4(&qword_100051CB8);
    v2[1] = sub_1000036E4(&qword_100051CC0);
    v2[2] = sub_100003928(&qword_100051CC8, &qword_100051CB8, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    v2[3] = sub_100003928(&qword_100051CD0, &qword_100051CC0, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051CA0);
  }
  return result;
}

uint64_t sub_100016F6C@<X0>(uint64_t a1@<X8>)
{
  return sub_100016FD0(&qword_100051B88, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, (char *)0x6146746567646957, (char *)0xEC000000796C696DLL, a1);
}

uint64_t sub_100016F9C@<X0>(uint64_t a1@<X8>)
{
  return sub_100016FD0(&qword_100051B90, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicTypeSize, (char *)0x5463696D616E7944, (char *)0xEF657A6953657079, a1);
}

uint64_t sub_100016FD0@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v25 = a4;
  v9 = v5;
  v11 = type metadata accessor for EnvironmentValues(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000033B8(a1);
  __chkstk_darwin(v15);
  v17 = (uint64_t *)((char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100003478(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload(v17, v15) == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = *v17;
    v21 = static os_log_type_t.fault.getter();
    v22 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v22, v21))
    {
      v23 = swift_slowAlloc(12, -1);
      v24 = swift_slowAlloc(32, -1);
      v26 = v24;
      *(_DWORD *)v23 = 136315138;
      *(_QWORD *)(v23 + 4) = sub_100017230(a3, v25, &v26);
      _os_log_impl((void *)&_mh_execute_header, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v23, 0xCu);
      swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v14, v20);
    swift_release(v20);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1000171D8@<X0>(uint64_t a1@<X8>)
{
  return sub_100016FD0(&qword_100051D88, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, (char *)0xD000000000000013, (char *)0x8000000100049150, a1);
}

uint64_t sub_100017204@<X0>(uint64_t a1@<X8>)
{
  return sub_100016FD0(&qword_100051D50, (uint64_t (*)(_QWORD))&type metadata accessor for ContentSizeCategory, (char *)0xD000000000000013, (char *)0x8000000100049130, a1);
}

char *sub_100017230(char *a1, char *a2, uint64_t *a3)
{
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v12[3];
  void *ObjectType;

  v6 = sub_100017300(v12, 0, 0, 1, (uint64_t)a1, (unint64_t)a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000173FC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1000173FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000178E4(v12);
  return v7;
}

char *sub_100017300(char **a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  char *result;
  uint64_t v10;
  char *v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (char *)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_100017438(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (char *)((a6 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    result = (char *)_StringObject.sharedUTF8.getter(a5, a6);
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return (char *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000173FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_100017438(uint64_t a1, unint64_t a2)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (char *)sub_1000174CC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_1000175C8(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_1000175C8((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

_QWORD *sub_1000174CC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *result;
  char v7;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100017564(v4, 0);
      result = (_QWORD *)_StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v7 & 1) != 0)
        break;
      if (result == (_QWORD *)v4)
        return v5;
      __break(1u);
LABEL_9:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100017564(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000033B8(&qword_100051CE8);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1000175C8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_1000033B8(&qword_100051CE8);
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
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_1000176B4(uint64_t a1)
{
  return sub_100017844(a1, (uint64_t (*)(uint64_t, uint64_t))sub_10001681C);
}

uint64_t sub_1000176C4()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v1 = (int *)type metadata accessor for FitnessWidgetView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (_QWORD *)((char *)v6 + v1[5]);
  v10 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
  }
  else
  {
    swift_release(*v9);
  }
  sub_100013BF4(*(_QWORD *)((char *)v6 + v1[6]), *((_BYTE *)v6 + v1[6] + 8));

  v12 = (char *)v6 + v1[8];
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);

  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100017838(uint64_t a1)
{
  return sub_100017844(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100015648);
}

uint64_t sub_100017844(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for FitnessWidgetView(0) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

unint64_t sub_1000178A0()
{
  unint64_t result;

  result = qword_100051D18;
  if (!qword_100051D18)
  {
    result = swift_getWitnessTable(&unk_1000409FC, &type metadata for WidgetFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_100051D18);
  }
  return result;
}

uint64_t sub_1000178E4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100017904()
{
  return EnvironmentValues.sizeCategory.getter();
}

uint64_t sub_10001792C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100017970(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000179B4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000179F0()
{
  uint64_t v0;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v0 = sub_1000036E4(&qword_100051C70);
  v3 = sub_1000036E4(&qword_100051C68);
  v4 = &type metadata for Color;
  v5 = sub_100016CA4();
  v6 = &protocol witness table for Color;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v3, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
  v3 = v0;
  v4 = (void *)OpaqueTypeConformance2;
  return swift_getOpaqueTypeConformance2(&v3, &opaque type descriptor for <<opaque return type of View.unredacted()>>, 1);
}

uint64_t sub_100017A78(uint64_t a1)
{
  return sub_100017C10(0.101960784, 0.101960784, 0.109803922, a1, &qword_100054860);
}

uint64_t sub_100017A9C()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  type metadata accessor for Color.RGBColorSpace(0);
  __chkstk_darwin();
  v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v2 + 104))(v1, enum case for Color.RGBColorSpace.sRGB(_:));
  result = Color.init(_:white:opacity:)(v1, 0.97254902, 1.0);
  qword_100054868 = result;
  return result;
}

void sub_100017B28(uint64_t a1)
{
  sub_100017D0C(a1, (SEL *)&selRef_energyColors, (SEL *)&selRef_nonGradientTextColor, &qword_100054870);
}

void sub_100017B44(uint64_t a1)
{
  sub_100017D0C(a1, (SEL *)&selRef_briskColors, (SEL *)&selRef_nonGradientTextColor, &qword_100054878);
}

void sub_100017B60(uint64_t a1)
{
  sub_100017D0C(a1, (SEL *)&selRef_sedentaryColors, (SEL *)&selRef_nonGradientTextColor, &qword_100054880);
}

void sub_100017B7C(uint64_t a1)
{
  sub_100017D0C(a1, (SEL *)&selRef_energyColors, (SEL *)&selRef_gradientDarkColor, &qword_100054888);
}

void sub_100017B98(uint64_t a1)
{
  sub_100017D0C(a1, (SEL *)&selRef_energyColors, (SEL *)&selRef_gradientLightColor, &qword_100054890);
}

void sub_100017BB4(uint64_t a1)
{
  sub_100017D0C(a1, (SEL *)&selRef_briskColors, (SEL *)&selRef_gradientDarkColor, &qword_100054898);
}

void sub_100017BD0(uint64_t a1)
{
  sub_100017D0C(a1, (SEL *)&selRef_briskColors, (SEL *)&selRef_gradientLightColor, &qword_1000548A0);
}

uint64_t sub_100017BEC(uint64_t a1)
{
  return sub_100017C10(0.678431372, 0.705882353, 0.749019608, a1, &qword_1000548A8);
}

uint64_t sub_100017C10(double a1, double a2, double a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  type metadata accessor for Color.RGBColorSpace(0);
  __chkstk_darwin();
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v11 + 104))(v10, enum case for Color.RGBColorSpace.sRGB(_:));
  result = Color.init(_:red:green:blue:opacity:)(v10, a1, a2, a3, 1.0);
  *a5 = result;
  return result;
}

void sub_100017CB8(uint64_t a1)
{
  sub_100017D0C(a1, (SEL *)&selRef_grayColors, (SEL *)&selRef_gradientDarkColor, &qword_1000548B0);
}

void sub_100017CD4(uint64_t a1)
{
  sub_100017D0C(a1, (SEL *)&selRef_grayColors, (SEL *)&selRef_gradientLightColor, &qword_1000548B8);
}

void sub_100017CF0(uint64_t a1)
{
  sub_100017D0C(a1, (SEL *)&selRef_grayColors, (SEL *)&selRef_nonGradientTextColor, &qword_1000548C0);
}

void sub_100017D0C(uint64_t a1, SEL *a2, SEL *a3, _QWORD *a4)
{
  id v6;
  void *v7;
  id v8;

  v6 = objc_msgSend((id)objc_opt_self(ARUIMetricColors), *a2);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, *a3);

    if (v8)
    {
      *a4 = Color.init(_:)(v8);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

BOOL sub_100017D8C()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  double v4;
  double v5;

  if (objc_msgSend(v0, "activityMoveMode") == (id)2)
  {
    v1 = objc_msgSend(v0, "appleMoveTimeGoal");
    v2 = objc_msgSend((id)objc_opt_self(HKUnit), "minuteUnit");
  }
  else
  {
    v1 = objc_msgSend(v0, "activeEnergyBurnedGoal");
    v2 = objc_msgSend((id)objc_opt_self(HKUnit), "smallCalorieUnit");
  }
  v3 = v2;
  objc_msgSend(v1, "doubleValueForUnit:", v3);
  v5 = v4;

  return v5 > 0.0;
}

void sub_100017E68()
{
  qword_1000548C8 = (uint64_t)&off_10004D468;
}

void sub_100017E7C()
{
  qword_1000548D0 = (uint64_t)&off_10004D6E8;
}

void sub_100017E90()
{
  qword_1000548D8 = (uint64_t)&off_10004D968;
}

int64_t sub_100017EA4(int64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = *(_QWORD *)(a2 + 16);
    if ((uint64_t)v2 >= result)
      v3 = result;
    else
      v3 = *(_QWORD *)(a2 + 16);
    if (!result)
      v3 = 0;
    if (v2 >= v3)
      return a2;
  }
  __break(1u);
  return result;
}

uint64_t sub_100017EE8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(char *, _QWORD, uint64_t), uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  id v25;
  unsigned int v26;
  uint64_t (*v27)(char *, _QWORD, uint64_t, __n128);
  uint64_t result;
  void (*v29)(char *, uint64_t);
  unsigned int (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, char *, uint64_t);
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  Class isa;
  Class v44;
  void *v45;
  id v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t, char *, uint64_t);
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  char *v52;
  double v53;
  uint64_t v54;
  void (*v55)(char *, _QWORD, uint64_t);
  uint64_t v56;
  uint64_t v57;

  v54 = a7;
  v55 = a6;
  v56 = a4;
  v53 = *(double *)&a2;
  v10 = type metadata accessor for Calendar.Component(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v14);
  v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v19 = (char *)&v48 - v18;
  v57 = type metadata accessor for Date(0);
  v20 = *(_QWORD *)(v57 - 8);
  __chkstk_darwin(v57);
  v24 = __chkstk_darwin(v21);
  v25 = 0;
  if ((a3 & 1) != 0)
    return (uint64_t)v25;
  v49 = v23;
  v52 = (char *)&v48 - v22;
  v26 = enum case for Calendar.Component.minute(_:);
  v27 = *(uint64_t (**)(char *, _QWORD, uint64_t, __n128))(v11 + 104);
  result = v27(v13, enum case for Calendar.Component.minute(_:), v10, v24);
  if ((unsigned __int128)(a1 * (__int128)a5) >> 64 == (a1 * a5) >> 63)
  {
    v50 = v26;
    v51 = a5;
    Calendar.date(byAdding:value:to:wrappingComponents:)(v13, a1 * a5, v55, 0);
    v29 = *(void (**)(char *, uint64_t))(v11 + 8);
    v29(v13, v10);
    v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
    v31 = v57;
    if (v30(v19, 1, v57) == 1)
    {
      v32 = (uint64_t)v19;
    }
    else
    {
      v33 = *(void (**)(uint64_t, char *, uint64_t))(v20 + 32);
      v55 = (void (*)(char *, _QWORD, uint64_t))v27;
      v34 = v52;
      v48 = v33;
      v33((uint64_t)v52, v19, v31);
      v55(v13, v50, v10);
      v35 = v34;
      v36 = v34;
      v37 = v20;
      Calendar.date(byAdding:value:to:wrappingComponents:)(v13, v51, v36, 0);
      v38 = v57;
      v29(v13, v10);
      if (v30(v16, 1, v38) != 1)
      {
        v39 = v53;
        v40 = v49;
        v48(v49, v16, v38);
        v41 = v37;
        v42 = objc_allocWithZone((Class)_HKActivityStatisticsQuantityInfo);
        isa = Date._bridgeToObjectiveC()().super.isa;
        v44 = Date._bridgeToObjectiveC()().super.isa;
        v25 = objc_msgSend(v42, "initWithStartDate:endDate:", isa, v44);

        v45 = (void *)objc_opt_self(HKQuantity);
        v46 = objc_msgSend(v45, "quantityWithUnit:doubleValue:", v54, v39);
        objc_msgSend(v25, "setQuantityValue:", v46);

        v47 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
        v47(v40, v38);
        v47((uint64_t)v35, v38);
        return (uint64_t)v25;
      }
      (*(void (**)(char *, uint64_t))(v37 + 8))(v35, v38);
      v32 = (uint64_t)v16;
    }
    sub_100019300(v32);
    return 0;
  }
  __break(1u);
  return result;
}

id sub_100018234(uint64_t a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  double v21;
  id v22;
  uint64_t v24;

  v7 = type metadata accessor for Calendar.Component(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Date(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v8 + 104))(v10, enum case for Calendar.Component.hour(_:), v7, v16);
  Calendar.date(byAdding:value:to:wrappingComponents:)(v10, a1, a4, 0);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
  {
    v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v18, v13, v14);
    v21 = Date.timeIntervalSinceReferenceDate.getter(v20);
    if (a2 == 1.0)
    {
      v22 = objc_msgSend(objc_allocWithZone((Class)_HKActivityStatisticsStandHourInfo), "initWithTimeStamp:state:", 0, v21);
    }
    else
    {
      if (a2 != 2.0)
      {
        (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
        return 0;
      }
      v22 = objc_msgSend(objc_allocWithZone((Class)_HKActivityStatisticsStandHourInfo), "initWithTimeStamp:state:", 1, v21);
    }
    v19 = v22;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    return v19;
  }
  sub_100019300((uint64_t)v13);
  return 0;
}

void sub_100018444(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      v9 = &_swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        memcpy(v9 + 4, (const void *)(a2 + 8 * a3), 8 * v5);
        return;
      }
    }
    else
    {
      v8 = sub_1000033B8(&qword_1000513A8);
      v9 = (_QWORD *)swift_allocObject(v8, 8 * v5 + 32, 7);
      v10 = j__malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 25;
      v9[2] = v5;
      v9[3] = 2 * (v11 >> 3);
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
    goto LABEL_11;
  }
}

void sub_100018508(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      v9 = &_swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        memcpy(v9 + 4, (const void *)(a2 + 16 * a3), 16 * v5);
        return;
      }
    }
    else
    {
      v8 = sub_1000033B8(&qword_100051DA0);
      v9 = (_QWORD *)swift_allocObject(v8, 16 * v5 + 32, 7);
      v10 = j__malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 17;
      v9[2] = v5;
      v9[3] = 2 * (v11 >> 4);
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
    goto LABEL_11;
  }
}

id sub_1000185CC(double a1, double a2, double a3, double a4, double a5)
{
  id result;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  result = objc_msgSend((id)objc_opt_self(_HKBehavior), "sharedBehavior");
  if (result)
  {
    v11 = result;
    v12 = objc_msgSend(result, "isStandalonePhoneFitnessMode");

    v13 = objc_msgSend(objc_allocWithZone((Class)HKActivitySummary), "init");
    v14 = (void *)objc_opt_self(HKUnit);
    v15 = objc_msgSend(v14, "kilocalorieUnit");
    v16 = (void *)objc_opt_self(HKQuantity);
    v17 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v15, 500.0);

    objc_msgSend(v13, "setActiveEnergyBurnedGoal:", v17);
    v18 = objc_msgSend(v14, "kilocalorieUnit");
    v19 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v18, a1);

    objc_msgSend(v13, "setActiveEnergyBurned:", v19);
    v20 = objc_msgSend(v14, "minuteUnit");
    v21 = 30.0;
    if (v12)
    {
      v21 = 0.0;
      v22 = 0.0;
    }
    else
    {
      v22 = a2;
    }
    if (v12)
      v23 = 0.0;
    else
      v23 = 8.0;
    if (v12)
      a3 = 0.0;
    v24 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v20, v21);

    objc_msgSend(v13, "setAppleExerciseTimeGoal:", v24);
    v25 = objc_msgSend(v14, "minuteUnit");
    v26 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v25, v22);

    objc_msgSend(v13, "setAppleExerciseTime:", v26);
    v27 = objc_msgSend(v14, "countUnit");
    v28 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v27, v23);

    objc_msgSend(v13, "setAppleStandHoursGoal:", v28);
    v29 = objc_msgSend(v14, "countUnit");
    v30 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v29, a3);

    objc_msgSend(v13, "setAppleStandHours:", v30);
    v31 = objc_msgSend(v14, "countUnit");
    v32 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v31, a4);

    objc_msgSend(v13, "setStepCount:", v32);
    v33 = objc_msgSend(v14, "mileUnit");
    v34 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v33, a5);

    objc_msgSend(v13, "setDistanceWalkingRunning:", v34);
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_100018978(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD))
{
  void *result;
  uint64_t v4;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  result = &_swiftEmptyArrayStorage;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain(a1);
    v6 = 0;
    v7 = (unsigned __int8 *)(a1 + 40);
    do
    {
      v9 = a2(v6, *((_QWORD *)v7 - 1), *v7);
      if (v9)
      {
        v10 = v9;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v12 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
        v11 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v12 >= v11 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v12 + 1, 1);
        v8 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v12, v10);
        specialized Array._endMutation()(v8);
      }
      ++v6;
      v7 += 16;
    }
    while (v4 != v6);
    swift_bridgeObjectRelease(a1);
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100018A7C(uint64_t a1, uint64_t (*a2)(uint64_t, double))
{
  void *result;
  uint64_t v4;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = &_swiftEmptyArrayStorage;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain(a1);
    for (i = 0; i != v4; ++i)
    {
      v8 = a2(i, *(double *)(a1 + 8 * i + 32));
      if (v8)
      {
        v9 = v8;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v11 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
        v10 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v11 >= v10 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, v11 + 1, 1);
        v7 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v9);
        specialized Array._endMutation()(v7);
      }
    }
    swift_bridgeObjectRelease(a1);
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

id sub_100018B70(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t (*v59)(char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t);
  id v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t (*v69)(char *, uint64_t);
  uint64_t v70;
  void (*v71)(char *, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  id v78;
  _QWORD *v79;
  Class isa;
  _QWORD *v81;
  Class v82;
  Class v83;
  uint64_t v85;
  void (*v86)(char *, uint64_t);
  void *v87;
  void *v88;
  _QWORD *v89;
  _QWORD *v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;

  v92 = type metadata accessor for Date(0);
  v2 = *(_QWORD *)(v92 - 8);
  __chkstk_darwin(v92);
  v4 = (char *)&v85 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v7 = (char *)&v85 - v6;
  v8 = type metadata accessor for Calendar(0);
  v9 = *(_QWORD **)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1 + 7;
  if (__OFADD__(a1, 7))
  {
    __break(1u);
  }
  else if (qword_1000511A0 == -1)
  {
    goto LABEL_3;
  }
  swift_once(&qword_1000511A0, sub_100017E68);
LABEL_3:
  if (a1 + 0x4000000000000007 >= 0)
  {
    v89 = (_QWORD *)v2;
    v90 = v9;
    v91 = v4;
    v93 = v8;
    v13 = qword_1000548C8;
    v2 = 2 * v12;
    v14 = sub_100017EA4(2 * v12, qword_1000548C8);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    if ((v19 & 1) != 0)
    {
      v22 = type metadata accessor for __ContiguousArrayStorageBase(0);
      swift_unknownObjectRetain_n(v14, 2);
      swift_bridgeObjectRetain(v13);
      v23 = (_QWORD *)swift_dynamicCastClass(v14, v22);
      if (!v23)
      {
        swift_unknownObjectRelease(v14);
        v23 = &_swiftEmptyArrayStorage;
      }
      v24 = v23[2];
      v25 = swift_release(v23);
      if (__OFSUB__(v20 >> 1, v18))
      {
        __break(1u);
      }
      else
      {
        v25 = v14;
        if (v24 == (v20 >> 1) - v18)
        {
          v9 = (_QWORD *)swift_dynamicCastClass(v14, v22);
          if (!v9)
          {
            swift_unknownObjectRelease(v14);
            v9 = &_swiftEmptyArrayStorage;
          }
LABEL_13:
          swift_unknownObjectRelease(v14);
          if (qword_1000511A8 == -1)
            goto LABEL_14;
          goto LABEL_38;
        }
      }
      swift_unknownObjectRelease(v25);
    }
    else
    {
      swift_bridgeObjectRetain(v13);
    }
    sub_100018508(v14, v16, v18, v20);
    v9 = v21;
    goto LABEL_13;
  }
  __break(1u);
LABEL_38:
  swift_once(&qword_1000511A8, sub_100017E7C);
LABEL_14:
  v26 = qword_1000548D0;
  v27 = sub_100017EA4(v2, qword_1000548D0);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  if ((v32 & 1) == 0)
  {
    swift_bridgeObjectRetain(v26);
LABEL_16:
    v34 = v12;
    sub_100018508(v27, v29, v31, v33);
    v36 = v35;
    goto LABEL_23;
  }
  v37 = type metadata accessor for __ContiguousArrayStorageBase(0);
  swift_unknownObjectRetain_n(v27, 2);
  swift_bridgeObjectRetain(v26);
  v38 = (_QWORD *)swift_dynamicCastClass(v27, v37);
  if (!v38)
  {
    swift_unknownObjectRelease(v27);
    v38 = &_swiftEmptyArrayStorage;
  }
  v39 = v38[2];
  swift_release(v38);
  if (__OFSUB__(v33 >> 1, v31))
  {
    __break(1u);
    goto LABEL_42;
  }
  if (v39 != (v33 >> 1) - v31)
  {
LABEL_42:
    swift_unknownObjectRelease(v27);
    goto LABEL_16;
  }
  v34 = v12;
  v36 = (void *)swift_dynamicCastClass(v27, v37);
  if (!v36)
  {
    swift_unknownObjectRelease(v27);
    v36 = &_swiftEmptyArrayStorage;
  }
LABEL_23:
  v40 = v9;
  swift_unknownObjectRelease(v27);
  if (qword_1000511B0 != -1)
    swift_once(&qword_1000511B0, sub_100017E90);
  v41 = qword_1000548D8;
  v42 = sub_100017EA4(v34, qword_1000548D8);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v88 = v36;
  if ((v47 & 1) == 0)
  {
    swift_bridgeObjectRetain(v41);
LABEL_27:
    sub_100018444(v42, v44, v46, v48);
    goto LABEL_34;
  }
  v50 = type metadata accessor for __ContiguousArrayStorageBase(0);
  swift_unknownObjectRetain_n(v42, 2);
  swift_bridgeObjectRetain(v41);
  v51 = (_QWORD *)swift_dynamicCastClass(v42, v50);
  if (!v51)
  {
    swift_unknownObjectRelease(v42);
    v51 = &_swiftEmptyArrayStorage;
  }
  v52 = v51[2];
  v53 = swift_release(v51);
  if (__OFSUB__(v48 >> 1, v46))
  {
    __break(1u);
    goto LABEL_44;
  }
  v53 = v42;
  if (v52 != (v48 >> 1) - v46)
  {
LABEL_44:
    swift_unknownObjectRelease(v53);
    goto LABEL_27;
  }
  v49 = (void *)swift_dynamicCastClass(v42, v50);
  if (!v49)
  {
    swift_unknownObjectRelease(v42);
    v49 = &_swiftEmptyArrayStorage;
  }
LABEL_34:
  v87 = v49;
  swift_unknownObjectRelease(v42);
  v54 = (void *)objc_opt_self(HKUnit);
  v55 = objc_msgSend(v54, "kilocalorieUnit");
  v56 = static Calendar.current.getter(v55);
  v57 = v91;
  Date.init()(v56);
  v58 = v11;
  Calendar.startOfDay(for:)(v57);
  v59 = (uint64_t (*)(char *, uint64_t))v89[1];
  v60 = v92;
  v61 = v59(v57, v92);
  __chkstk_darwin(v61);
  *(&v85 - 4) = (uint64_t)v58;
  *(&v85 - 3) = 30;
  *(&v85 - 2) = (uint64_t)v7;
  *(&v85 - 1) = (uint64_t)v55;
  v62 = swift_retain(v40);
  v89 = sub_100018978(v62, (uint64_t (*)(uint64_t, _QWORD, _QWORD))sub_1000192E4);
  swift_release(v40);
  v59(v7, v60);
  v63 = (void (*)(char *, uint64_t))v59;
  v86 = (void (*)(char *, uint64_t))v90[1];
  v86(v58, v93);

  swift_release(v40);
  v64 = objc_msgSend(v54, "minuteUnit");
  v65 = static Calendar.current.getter(v64);
  Date.init()(v65);
  Calendar.startOfDay(for:)(v57);
  v66 = v59(v57, v60);
  __chkstk_darwin(v66);
  *(&v85 - 4) = (uint64_t)v58;
  *(&v85 - 3) = 30;
  *(&v85 - 2) = (uint64_t)v7;
  *(&v85 - 1) = (uint64_t)v64;
  v67 = v88;
  v68 = swift_retain(v88);
  v90 = sub_100018978(v68, (uint64_t (*)(uint64_t, _QWORD, _QWORD))sub_1000192E4);
  swift_release(v67);
  v63(v7, v60);
  v69 = (uint64_t (*)(char *, uint64_t))v63;
  v70 = v93;
  v71 = v86;
  v86(v58, v93);

  v72 = swift_release(v67);
  v73 = static Calendar.current.getter(v72);
  Date.init()(v73);
  Calendar.startOfDay(for:)(v57);
  v74 = v69(v57, v60);
  __chkstk_darwin(v74);
  *(&v85 - 2) = (uint64_t)v58;
  *(&v85 - 1) = (uint64_t)v7;
  v75 = v87;
  v76 = swift_retain(v87);
  v77 = sub_100018A7C(v76, (uint64_t (*)(uint64_t, double))sub_1000192F8);
  swift_release(v75);
  v69(v7, v60);
  v71(v58, v70);
  swift_release(v75);
  v78 = objc_msgSend(objc_allocWithZone((Class)_HKActivityStatisticsQueryResult), "init");
  sub_1000127C4(0, &qword_100051D90, _HKActivityStatisticsQuantityInfo_ptr);
  v79 = v89;
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v78, "setActiveEnergyResults:", isa, swift_bridgeObjectRelease(v79).n128_f64[0]);

  v81 = v90;
  v82 = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v78, "setAppleExerciseTimeResults:", v82, swift_bridgeObjectRelease(v81).n128_f64[0]);

  sub_1000127C4(0, &qword_100051D98, _HKActivityStatisticsStandHourInfo_ptr);
  v83 = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v78, "setAppleStandHourResults:", v83, swift_bridgeObjectRelease(v77).n128_f64[0]);

  return v78;
}

uint64_t sub_1000192E8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  return sub_100017EE8(a1, a2, a3 & 1, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(void (**)(char *, _QWORD, uint64_t))(v3 + 32), *(_QWORD *)(v3 + 40));
}

id sub_1000192F8(uint64_t a1, double a2)
{
  uint64_t v2;

  return sub_100018234(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_100019300(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000033B8((uint64_t *)&unk_100051980);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_100019340(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 20);
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    v17 = type metadata accessor for Date(0);
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = sub_1000033B8((uint64_t *)&unk_100051980);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
  }
  return a1;
}

uint64_t sub_100019498(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (char *)a1 + *(int *)(a2 + 20);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

uint64_t *sub_100019554(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for Date(0);
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

uint64_t *sub_100019680(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B88);
    v6 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = *(int *)(a3 + 20);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for Date(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_11;
  }
  if (v19)
  {
LABEL_11:
    v20 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

char *sub_100019810(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

char *sub_100019938(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B88);
    v6 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_10;
  }
  if (v15)
  {
LABEL_10:
    v16 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t sub_100019AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100019AD0);
}

uint64_t sub_100019AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_1000033B8(&qword_100051B98);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_1000033B8((uint64_t *)&unk_100051980);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_100019B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100019B58);
}

uint64_t sub_100019B58(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_1000033B8(&qword_100051B98);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_1000033B8((uint64_t *)&unk_100051980);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for PauseRingsLabel(uint64_t a1)
{
  uint64_t result;

  result = qword_100051E00;
  if (!qword_100051E00)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PauseRingsLabel);
  return result;
}

void sub_100019C18(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[2];

  sub_100014804(319, &qword_100051C10, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100014804(319, (unint64_t *)&qword_100051720, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 2, v6, a1 + 16);
    }
  }
}

uint64_t sub_100019CCC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100041F8C, 1);
}

void sub_100019CDC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  __n128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __n128 v60;
  double v61;
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
  uint64_t v74;
  uint64_t v75;
  id v76;
  NSString v77;
  NSString v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  NSString v86;
  Class isa;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t v114;
  char v115;
  __n128 v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  int v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD v128[2];
  char v129;
  char v130;
  uint64_t v131[3];

  v127 = a1;
  v3 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v3);
  v124 = (uint64_t)&v119 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v119 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for WidgetFamily(0);
  v123 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v11 = (char *)&v119 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v119 - v13;
  v15 = objc_msgSend((id)objc_opt_self(_HKBehavior), "sharedBehavior");
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(v15, "isStandalonePhoneFitnessMode");

    v125 = v6;
    v126 = v5;
    v122 = v8;
    if (v17)
    {
      v18 = 0xD000000000000016;
      v19 = 0x80000001000491B0;
    }
    else
    {
      v19 = 0x8000000100049170;
      v18 = 0xD000000000000017;
    }
    v20 = LocalizedStringKey.init(stringLiteral:)(v18, v19);
    v21 = Text.init(_:tableName:bundle:comment:)(v20);
    v23 = v22;
    v121 = v24;
    v26 = v25;
    sub_100016F6C((uint64_t)v14);
    v27 = v123;
    (*(void (**)(char *, _QWORD, uint64_t))(v123 + 104))(v11, enum case for WidgetFamily.systemMedium(_:), v9);
    v28 = sub_10001A55C();
    dispatch thunk of RawRepresentable.rawValue.getter(v128, v9, v28);
    dispatch thunk of RawRepresentable.rawValue.getter(v131, v9, v28);
    v29 = v128[0];
    v30 = v131[0];
    v31 = *(void (**)(char *, uint64_t))(v27 + 8);
    v31(v11, v9);
    v32 = ((uint64_t (*)(char *, uint64_t))v31)(v14, v9);
    if (v29 == v30)
      v33 = static Font.body.getter(v32);
    else
      v33 = static Font.subheadline.getter(v32);
    v34 = v33;
    v35 = v121 & 1;
    v36 = Text.font(_:)(v33, v21, v23, v121 & 1, v26);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    swift_release(v34);
    LOBYTE(v34) = v40 & 1;
    sub_100008E84(v21, v23, v35);
    swift_bridgeObjectRelease(v26);
    v44 = static Font.Weight.semibold.getter(v43);
    v45 = Text.fontWeight(_:)(*(_QWORD *)&v44, 0, v36, v38, v40 & 1, v42);
    v47 = v46;
    v49 = v48;
    v51 = v50 & 1;
    sub_100008E84(v36, v38, v34);
    v52 = swift_bridgeObjectRelease(v42);
    v53 = static Color.white.getter(v52);
    v128[0] = v53;
    v54 = Text.foregroundStyle<A>(_:)(v128, v45, v47, v51, v49, &type metadata for Color, &protocol witness table for Color);
    v123 = v55;
    v121 = v56;
    v58 = v57;
    sub_100008E84(v45, v47, v51);
    swift_release(v53);
    swift_bridgeObjectRelease(v49);
    v120 = static Edge.Set.bottom.getter(v59);
    v60.n128_u64[0] = 4.0;
    v61 = EdgeInsets.init(_all:)(v60);
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v68 = type metadata accessor for PauseRingsLabel(0);
    v69 = v124;
    sub_10001A5A4(v127 + *(int *)(v68 + 20), v124);
    v71 = v125;
    v70 = v126;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v125 + 48))(v69, 1, v126) == 1)
    {
      sub_1000034BC(v69, (uint64_t *)&unk_100051980);
      v72 = 0;
      v73 = 0;
      v74 = 0;
      v75 = 0;
    }
    else
    {
      v119 = v54;
      v127 = v58;
      (*(void (**)(char *, uint64_t, uint64_t))(v71 + 32))(v122, v69, v70);
      v76 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v77 = String._bridgeToObjectiveC()();
      v78 = String._bridgeToObjectiveC()();
      v79 = objc_msgSend(v76, "localizedStringForKey:value:table:", v77, 0, v78);

      v80 = static String._unconditionallyBridgeFromObjectiveC(_:)(v79);
      v82 = v81;

      v83 = sub_1000033B8(&qword_100051368);
      v84 = swift_allocObject(v83, 72, 7);
      *(_OWORD *)(v84 + 16) = xmmword_10003FCE0;
      v85 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
      v86 = String._bridgeToObjectiveC()();
      objc_msgSend(v85, "setDateFormat:", v86);

      isa = Date._bridgeToObjectiveC()().super.isa;
      v88 = objc_msgSend(v85, "stringFromDate:", isa);

      v89 = static String._unconditionallyBridgeFromObjectiveC(_:)(v88);
      v91 = v90;

      *(_QWORD *)(v84 + 56) = &type metadata for String;
      *(_QWORD *)(v84 + 64) = sub_10000825C();
      *(_QWORD *)(v84 + 32) = v89;
      *(_QWORD *)(v84 + 40) = v91;
      v92 = String.init(format:_:)(v80, v82, v84);
      v94 = v93;
      swift_bridgeObjectRelease(v82);
      v128[0] = v92;
      v128[1] = v94;
      v95 = sub_100008E40();
      v96 = Text.init<A>(_:)(v128, &type metadata for String, v95);
      v98 = v97;
      v100 = v99;
      v102 = v101 & 1;
      v103 = static Font.footnote.getter();
      v104 = Text.font(_:)(v103, v96, v98, v102, v100);
      v106 = v105;
      v108 = v107;
      v110 = v109;
      swift_release(v103);
      sub_100008E84(v96, v98, v102);
      swift_bridgeObjectRelease(v100);
      if (qword_100051198 != -1)
        swift_once(&qword_100051198, sub_100017CF0);
      v111 = qword_1000548C0;
      v128[0] = qword_1000548C0;
      swift_retain(qword_1000548C0);
      v112 = v108 & 1;
      v72 = Text.foregroundStyle<A>(_:)(v128, v104, v106, v108 & 1, v110, &type metadata for Color, &protocol witness table for Color);
      v73 = v113;
      v75 = v114;
      v74 = v115 & 1;
      sub_100008E84(v104, v106, v112);
      swift_release(v111);
      v116 = swift_bridgeObjectRelease(v110);
      (*(void (**)(char *, uint64_t, __n128))(v125 + 8))(v122, v126, v116);
      v58 = v127;
      v54 = v119;
    }
    LOBYTE(v128[0]) = 1;
    v117 = v121 & 1;
    LOBYTE(v131[0]) = v121 & 1;
    v130 = 0;
    v129 = 1;
    *(_QWORD *)a2 = 0;
    *(_BYTE *)(a2 + 8) = 1;
    v118 = v123;
    *(_QWORD *)(a2 + 16) = v54;
    *(_QWORD *)(a2 + 24) = v118;
    *(_BYTE *)(a2 + 32) = v117;
    *(_QWORD *)(a2 + 40) = v58;
    *(_BYTE *)(a2 + 48) = v120;
    *(double *)(a2 + 56) = v61;
    *(_QWORD *)(a2 + 64) = v63;
    *(_QWORD *)(a2 + 72) = v65;
    *(_QWORD *)(a2 + 80) = v67;
    *(_BYTE *)(a2 + 88) = 0;
    *(_QWORD *)(a2 + 96) = v72;
    *(_QWORD *)(a2 + 104) = v73;
    *(_QWORD *)(a2 + 112) = v74;
    *(_QWORD *)(a2 + 120) = v75;
    *(_QWORD *)(a2 + 128) = 0;
    *(_BYTE *)(a2 + 136) = 1;
    sub_10000C8C8(v54, v118, v117);
    swift_bridgeObjectRetain(v58);
    sub_10001A5EC(v72, v73, v74, v75);
    sub_10001A61C(v72, v73, v74, v75);
    sub_100008E84(v54, v118, v117);
    swift_bridgeObjectRelease(v58);
  }
  else
  {
    __break(1u);
  }
}

double sub_10001A494@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  double result;
  __int128 v8;
  _OWORD v9[7];
  _OWORD v10[2];
  _BYTE v11[144];

  v3 = static HorizontalAlignment.leading.getter();
  sub_100019CDC(v1, (uint64_t)v9);
  *(_OWORD *)&v11[103] = v9[6];
  *(_OWORD *)&v11[87] = v9[5];
  *(_OWORD *)&v11[39] = v9[2];
  *(_OWORD *)&v11[23] = v9[1];
  *(_OWORD *)&v11[119] = v10[0];
  *(_OWORD *)&v11[128] = *(_OWORD *)((char *)v10 + 9);
  *(_OWORD *)&v11[55] = v9[3];
  *(_OWORD *)&v11[71] = v9[4];
  *(_OWORD *)&v11[7] = v9[0];
  v4 = *(_OWORD *)&v11[64];
  *(_OWORD *)(a1 + 97) = *(_OWORD *)&v11[80];
  v5 = *(_OWORD *)&v11[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v11[96];
  *(_OWORD *)(a1 + 129) = v5;
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v11[128];
  v6 = *(_OWORD *)v11;
  *(_OWORD *)(a1 + 33) = *(_OWORD *)&v11[16];
  result = *(double *)&v11[32];
  v8 = *(_OWORD *)&v11[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v11[32];
  *(_OWORD *)(a1 + 65) = v8;
  *(_OWORD *)(a1 + 81) = v4;
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 17) = v6;
  return result;
}

unint64_t sub_10001A55C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051398;
  if (!qword_100051398)
  {
    v1 = type metadata accessor for WidgetFamily(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for WidgetFamily, v1);
    atomic_store(result, (unint64_t *)&qword_100051398);
  }
  return result;
}

uint64_t sub_10001A5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8((uint64_t *)&unk_100051980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001A5EC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000C8C8(result, a2, a3 & 1);
    return swift_bridgeObjectRetain(a4);
  }
  return result;
}

double sub_10001A61C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  double result;

  if (a4)
  {
    sub_100008E84(a1, a2, a3 & 1);
    *(_QWORD *)&result = swift_bridgeObjectRelease(a4).n128_u64[0];
  }
  return result;
}

unint64_t sub_10001A650()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051E38;
  if (!qword_100051E38)
  {
    v1 = sub_1000036E4(&qword_100051E40);
    result = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100051E38);
  }
  return result;
}

uint64_t sub_10001A69C@<X0>(void *a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, _QWORD *a5@<X8>, __n128 a6@<Q0>)
{
  unint64_t v8;
  uint64_t v12;
  int *v13;
  _QWORD *v14;
  __n128 v15;
  uint64_t v16;
  _QWORD *v17;
  __n128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSString v27;
  NSString v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  _QWORD *v34;

  v8 = a6.n128_u64[0];
  *a5 = swift_getKeyPath(&unk_1000405E8, a6);
  v12 = sub_1000033B8(&qword_100051B88);
  swift_storeEnumTagMultiPayload(a5, v12, 0);
  v13 = (int *)type metadata accessor for SummarySection(0);
  v14 = (_QWORD *)((char *)a5 + v13[5]);
  *v14 = swift_getKeyPath(&unk_100040618, v15);
  v16 = sub_1000033B8(&qword_100051B90);
  swift_storeEnumTagMultiPayload(v14, v16, 0);
  v17 = (_QWORD *)((char *)a5 + v13[6]);
  *v17 = swift_getKeyPath(&unk_100040648, v18);
  v19 = sub_1000033B8(&qword_100051D88);
  swift_storeEnumTagMultiPayload(v17, v19, 0);
  *(_QWORD *)((char *)a5 + v13[7]) = a1;
  *((_BYTE *)a5 + v13[8]) = a2;
  *(_QWORD *)((char *)a5 + v13[9]) = v8;
  *((_BYTE *)a5 + v13[10]) = a3;
  v20 = type metadata accessor for Date(0);
  *((_BYTE *)a5 + v13[11]) = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48))(a4, 1, v20) != 1;
  sub_100003478(a4, (uint64_t)a5 + v13[12], (uint64_t *)&unk_100051980);
  v21 = qword_1000511F0;
  v22 = a1;
  if (v21 != -1)
    swift_once(&qword_1000511F0, sub_10003D274);
  v23 = (void *)qword_1000548F8;
  v24 = (void *)objc_opt_self(NSBundle);
  v25 = v23;
  v26 = objc_msgSend(v24, "mainBundle");
  v27 = String._bridgeToObjectiveC()();
  v28 = String._bridgeToObjectiveC()();
  v29 = objc_msgSend(v26, "localizedStringForKey:value:table:", v27, 0, v28);

  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
  v32 = v31;

  result = sub_1000034BC(a4, (uint64_t *)&unk_100051980);
  v34 = (_QWORD *)((char *)a5 + v13[13]);
  *v34 = v25;
  v34[1] = a1;
  v34[2] = v30;
  v34[3] = v32;
  return result;
}

uint64_t type metadata accessor for SummarySection(uint64_t a1)
{
  uint64_t result;

  result = qword_100051EA8;
  if (!qword_100051EA8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SummarySection);
  return result;
}

uint64_t sub_10001A950()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = v0;
  v2 = type metadata accessor for DynamicTypeSize(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v8 = (char *)&v28 - v7;
  v9 = type metadata accessor for WidgetFamily(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v28 - v14;
  if ((*(_BYTE *)(v1 + *(int *)(type metadata accessor for SummarySection(0) + 32)) & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    v29 = v5;
    v30 = v3;
    v31 = v2;
    sub_100016F6C((uint64_t)v15);
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for WidgetFamily.systemSmall(_:), v9);
    v17 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(&v33, v9, v17);
    dispatch thunk of RawRepresentable.rawValue.getter(&v32, v9, v17);
    v18 = v32;
    v19 = v33;
    v20 = *(void (**)(char *, uint64_t))(v10 + 8);
    v20(v12, v9);
    v20(v15, v9);
    v21 = sub_100016F9C((uint64_t)v8);
    if (v19 == v18)
    {
      v16 = DynamicTypeSize.isAccessibilitySize.getter(v21);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v31);
    }
    else
    {
      v23 = v29;
      v22 = v30;
      v24 = v31;
      (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v29, enum case for DynamicTypeSize.accessibility2(_:), v31);
      v25 = sub_100008304(&qword_100051D78, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
      v16 = dispatch thunk of static Comparable.< infix(_:_:)(v8, v23, v24, v25) ^ 1;
      v26 = *(void (**)(char *, uint64_t))(v22 + 8);
      v26(v23, v24);
      v26(v8, v24);
    }
  }
  return v16 & 1;
}

uint64_t sub_10001ABA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  unsigned int *v14;
  __n128 v15;
  __n128 v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = a1;
  v2 = type metadata accessor for SummarySection(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = __chkstk_darwin(v2);
  v6 = type metadata accessor for AdaptiveStackType(0, v5);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_1000033B8(&qword_100051F08);
  v10 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10001A950();
  v14 = (unsigned int *)&enum case for AdaptiveStackType.horizontal(_:);
  if ((v13 & 1) == 0)
    v14 = (unsigned int *)&enum case for AdaptiveStackType.vertical(_:);
  v15.n128_f64[0] = (*(double (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *v14, v6);
  v26 = static VerticalAlignment.center.getter(v15);
  v17 = static HorizontalAlignment.leading.getter(v16);
  if ((sub_10001A950() & 1) != 0)
    v18 = 0xC030000000000000;
  else
    v18 = 0;
  sub_100017970(v1, (uint64_t)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SummarySection);
  v19 = *(unsigned __int8 *)(v3 + 80);
  v20 = (v19 + 16) & ~v19;
  v21 = swift_allocObject(&unk_10004EDE8, v20 + v4, v19 | 7);
  sub_10001792C((uint64_t)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20, type metadata accessor for SummarySection);
  v22 = sub_1000033B8(&qword_100051F10);
  v23 = sub_100003928(&qword_100051F18, &qword_100051F10, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  AdaptiveStack.init(type:verticalAlignment:horizontalAlignment:spacing:content:)(v9, v26, v17, v18, 0, sub_10001ED28, v21, v22, v23);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(v28, v12, v27);
}

uint64_t sub_10001AD98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 v3;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __n128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  __int128 v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t OpaqueTypeConformance2;
  uint64_t v72;
  uint64_t v73;
  __n128 v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  void (*v100)(char *, uint64_t);
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  void (*v117)(char *, char *, uint64_t);
  uint64_t v118;
  uint64_t v119;
  void (*v120)(char *, uint64_t);
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  __n128 v128;
  uint64_t KeyPath;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v142;
  uint64_t *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  char *v162;
  char *v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  _OWORD v184[3];

  v167 = a2;
  v161 = sub_1000033B8(&qword_100051F20);
  v3 = __chkstk_darwin(v161);
  v156 = (uint64_t *)((char *)&v142 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v151 = type metadata accessor for ColorRenderingMode(0, v3);
  v150 = *(_QWORD *)(v151 - 8);
  __chkstk_darwin(v151);
  v149 = (char *)&v142 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v155 = sub_1000033B8(&qword_100051F28);
  v153 = *(_QWORD *)(v155 - 8);
  __chkstk_darwin(v155);
  v152 = (char *)&v142 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v154 = (char *)&v142 - v8;
  v157 = sub_1000033B8(&qword_100051F30);
  __chkstk_darwin(v157);
  v159 = (uint64_t)&v142 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v10);
  v144 = (uint64_t)&v142 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v158 = type metadata accessor for PauseRingsLabel(0);
  __chkstk_darwin(v158);
  v143 = (uint64_t *)((char *)&v142 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v13);
  v145 = (uint64_t)&v142 - v14;
  v166 = sub_1000033B8(&qword_100051F38);
  v165 = *(_QWORD *)(v166 - 8);
  __chkstk_darwin(v166);
  v160 = (char *)&v142 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v162 = (char *)&v142 - v17;
  v18 = type metadata accessor for WidgetFamily(0);
  v170 = *(_QWORD *)(v18 - 8);
  v171 = v18;
  __chkstk_darwin(v18);
  v169 = (char *)&v142 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v168 = (uint64_t)&v142 - v21;
  v22 = type metadata accessor for SummarySection(0);
  v146 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v148 = (uint64_t)&v142 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v147 = v23;
  __chkstk_darwin(v24);
  v179 = (char *)&v142 - v25;
  v26 = sub_1000033B8(&qword_100051F40);
  __chkstk_darwin(v26);
  v164 = (char *)&v142 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  v172 = (uint64_t)&v142 - v29;
  v176 = type metadata accessor for AccessibilityChildBehavior(0);
  v30 = *(_QWORD *)(v176 - 8);
  __chkstk_darwin(v176);
  v32 = (char *)&v142 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_1000033B8(&qword_100051F48);
  __chkstk_darwin(v33);
  v35 = (char *)&v142 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_1000033B8(&qword_100051F50);
  __chkstk_darwin(v36);
  v38 = (char *)&v142 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v177 = sub_1000033B8(&qword_100051F58);
  v180 = *(_QWORD *)(v177 - 8);
  __chkstk_darwin(v177);
  v40 = (char *)&v142 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v178 = sub_1000033B8(&qword_100051F60);
  __chkstk_darwin(v178);
  v163 = (char *)&v142 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v42);
  v174 = (char *)&v142 - v43;
  __chkstk_darwin(v44);
  v175 = (char *)&v142 - v45;
  v47 = __chkstk_darwin(v46);
  v49 = (uint64_t)&v142 - v48;
  *(_QWORD *)v35 = static VerticalAlignment.center.getter(v47);
  *((_QWORD *)v35 + 1) = 0;
  v35[16] = 1;
  v50 = sub_1000033B8(&qword_100051F68);
  sub_10001BBE4(a1, (uint64_t)&v35[*(int *)(v50 + 44)]);
  v51 = *(double *)(a1 + *(int *)(v22 + 36));
  v52 = a1;
  v173 = a1;
  v53 = sub_10001C0D0(v51);
  v55 = static Alignment.center.getter(v54);
  _FrameLayout.init(width:height:alignment:)(v184, 0, 1, *(_QWORD *)&v53, 0, v55, v56);
  sub_100003478((uint64_t)v35, (uint64_t)v38, &qword_100051F48);
  v57 = &v38[*(int *)(v36 + 36)];
  v58 = v184[1];
  *(_OWORD *)v57 = v184[0];
  *((_OWORD *)v57 + 1) = v58;
  *((_OWORD *)v57 + 2) = v184[2];
  v59 = sub_1000034BC((uint64_t)v35, &qword_100051F48);
  static AccessibilityChildBehavior.ignore.getter(v59);
  v60 = sub_10001ED64();
  View.accessibilityElement(children:)(v32, v36, v60);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v176);
  sub_1000034BC((uint64_t)v38, &qword_100051F50);
  v176 = v22;
  v182 = (uint64_t)sub_10003B264(*(id *)(v52 + *(int *)(v22 + 52) + 8));
  v183 = v61;
  v62 = sub_100008E40();
  v63 = Text.init<A>(_:)(&v182, &type metadata for String, v62);
  v65 = v64;
  v67 = v66;
  v69 = v68 & 1;
  v182 = v36;
  v183 = v60;
  v70 = (uint64_t)v179;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v182, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  v72 = (uint64_t)v174;
  v73 = v177;
  View.accessibility(label:)(v63, v65, v69, v67, v177, OpaqueTypeConformance2);
  sub_100008E84(v63, v65, v69);
  v74 = swift_bridgeObjectRelease(v67);
  v75 = v40;
  v76 = v173;
  (*(void (**)(char *, uint64_t, __n128))(v180 + 8))(v75, v73, v74);
  v77 = (uint64_t)v175;
  ModifiedContent<>.accessibility(sortPriority:)(v178, 3.0);
  sub_1000034BC(v72, &qword_100051F60);
  v180 = v49;
  sub_1000082A0(v77, v49, &qword_100051F60);
  LOBYTE(v49) = sub_10001A950();
  v78 = v70;
  sub_100017970(v76, v70, type metadata accessor for SummarySection);
  if ((v49 & 1) == 0)
  {
    v87 = v168;
    sub_1000179B4(v78, type metadata accessor for SummarySection);
    v81 = v170;
    v80 = v171;
    v82 = v169;
LABEL_5:
    v95 = v176;
    v96 = *(int *)(v176 + 44);
    v97 = (uint64_t)v162;
    if (*(_BYTE *)(v76 + v96) == 1)
    {
      sub_100016F6C(v87);
      (*(void (**)(char *, _QWORD, uint64_t))(v81 + 104))(v82, enum case for WidgetFamily.systemMedium(_:), v80);
      v98 = sub_100008304(&qword_100051FB0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
      v99 = dispatch thunk of static Equatable.== infix(_:_:)(v87, v82, v80, v98);
      v100 = *(void (**)(char *, uint64_t))(v81 + 8);
      v100(v82, v80);
      v100((char *)v87, v80);
      if ((v99 & 1) == 0)
      {
        v127 = v144;
        sub_100003478(v76 + *(int *)(v95 + 48), v144, (uint64_t *)&unk_100051980);
        KeyPath = swift_getKeyPath(&unk_1000405E8, v128);
        v130 = (uint64_t)v143;
        *v143 = KeyPath;
        v131 = sub_1000033B8(&qword_100051B88);
        swift_storeEnumTagMultiPayload(v130, v131, 0);
        v132 = v158;
        sub_1000082A0(v127, v130 + *(int *)(v158 + 20), (uint64_t *)&unk_100051980);
        v133 = v145;
        sub_10001792C(v130, v145, type metadata accessor for PauseRingsLabel);
        v134 = v159;
        sub_100017970(v133, v159, type metadata accessor for PauseRingsLabel);
        swift_storeEnumTagMultiPayload(v134, v157, 0);
        v135 = sub_100008304(&qword_100051D58, type metadata accessor for PauseRingsLabel, (uint64_t)&unk_100040590);
        v136 = sub_100003928(&qword_100051F98, &qword_100051F20, (uint64_t)&protocol conformance descriptor for TupleView<A>);
        v137 = v160;
        _ConditionalContent<>.init(storage:)(v134, v132, v161, v135, v136);
        sub_1000179B4(v133, type metadata accessor for PauseRingsLabel);
        v138 = sub_1000033B8(&qword_100051FA0);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v138 - 8) + 56))(v137, 0, 1, v138);
        v126 = (uint64_t)v137;
LABEL_14:
        sub_1000082A0(v126, v97, &qword_100051F38);
        goto LABEL_15;
      }
      if ((*(_BYTE *)(v76 + v96) & 1) != 0)
      {
        v101 = sub_1000033B8(&qword_100051FA0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v101 - 8) + 56))(v97, 1, 1, v101);
LABEL_15:
        v89 = v167;
        v90 = v166;
        v91 = v165;
        v92 = (uint64_t)v164;
        v94 = (uint64_t)v163;
        v93 = v172;
        sub_1000082A0(v97, v172, &qword_100051F38);
        v88 = 0;
        goto LABEL_16;
      }
    }
    if ((sub_10001A950() & 1) != 0)
      v102 = 0;
    else
      v102 = 0x4010000000000000;
    v103 = v76;
    v104 = v148;
    sub_100017970(v103, v148, type metadata accessor for SummarySection);
    v105 = *(unsigned __int8 *)(v146 + 80);
    v106 = (v105 + 16) & ~v105;
    v107 = swift_allocObject(&unk_10004EE10, v106 + v147, v105 | 7);
    sub_10001792C(v104, v107 + v106, type metadata accessor for SummarySection);
    v182 = (uint64_t)sub_10001EFB0;
    v183 = v107;
    v108 = v150;
    v109 = v149;
    v110 = v151;
    (*(void (**)(char *, _QWORD, uint64_t))(v150 + 104))(v149, enum case for ColorRenderingMode.nonLinear(_:), v151);
    v111 = sub_1000033B8(&qword_100051F80);
    v112 = sub_100003928(&qword_100051F88, &qword_100051F80, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    v113 = v152;
    View.drawingGroup(opaque:colorMode:)(0, v109, v111, v112);
    (*(void (**)(char *, uint64_t))(v108 + 8))(v109, v110);
    swift_release(v183);
    v114 = v153;
    v115 = v154;
    v116 = v155;
    (*(void (**)(char *, char *, uint64_t))(v153 + 32))(v154, v113, v155);
    v117 = *(void (**)(char *, char *, uint64_t))(v114 + 16);
    v117(v113, v115, v116);
    v118 = (uint64_t)v156;
    *v156 = v102;
    *(_BYTE *)(v118 + 8) = 0;
    v119 = sub_1000033B8(&qword_100051F90);
    v117((char *)(v118 + *(int *)(v119 + 48)), v113, v116);
    v120 = *(void (**)(char *, uint64_t))(v114 + 8);
    v120(v113, v116);
    v121 = v159;
    sub_100003478(v118, v159, &qword_100051F20);
    swift_storeEnumTagMultiPayload(v121, v157, 1);
    v122 = sub_100008304(&qword_100051D58, type metadata accessor for PauseRingsLabel, (uint64_t)&unk_100040590);
    v123 = sub_100003928(&qword_100051F98, &qword_100051F20, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v124 = v160;
    _ConditionalContent<>.init(storage:)(v121, v158, v161, v122, v123);
    sub_1000034BC(v118, &qword_100051F20);
    v120(v115, v116);
    v125 = sub_1000033B8(&qword_100051FA0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v125 - 8) + 56))(v124, 0, 1, v125);
    v126 = (uint64_t)v124;
    goto LABEL_14;
  }
  v79 = v168;
  sub_100016F6C(v168);
  v81 = v170;
  v80 = v171;
  v82 = v169;
  (*(void (**)(char *, _QWORD, uint64_t))(v170 + 104))(v169, enum case for WidgetFamily.systemMedium(_:), v171);
  v83 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(&v182, v80, v83);
  dispatch thunk of RawRepresentable.rawValue.getter(&v181, v80, v83);
  v84 = v182;
  v85 = v181;
  v86 = *(void (**)(char *, uint64_t))(v81 + 8);
  v86(v82, v80);
  v87 = v79;
  v86((char *)v79, v80);
  sub_1000179B4(v78, type metadata accessor for SummarySection);
  if (v84 == v85)
    goto LABEL_5;
  v88 = 1;
  v89 = v167;
  v90 = v166;
  v91 = v165;
  v92 = (uint64_t)v164;
  v93 = v172;
  v94 = (uint64_t)v163;
LABEL_16:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v91 + 56))(v93, v88, 1, v90);
  v139 = v180;
  sub_100003478(v180, v94, &qword_100051F60);
  sub_100003478(v93, v92, &qword_100051F40);
  sub_100003478(v94, v89, &qword_100051F60);
  v140 = sub_1000033B8(&qword_100051FA8);
  sub_100003478(v92, v89 + *(int *)(v140 + 48), &qword_100051F40);
  sub_1000034BC(v93, &qword_100051F40);
  sub_1000034BC(v139, &qword_100051F60);
  sub_1000034BC(v92, &qword_100051F40);
  return sub_1000034BC(v94, &qword_100051F60);
}

uint64_t sub_10001BBE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  int *v16;
  uint64_t v17;
  _BYTE *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_BYTE *, uint64_t);
  BOOL v24;
  uint64_t v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  _BYTE *v47;
  char v48;
  void (*v49)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(_BYTE *, uint64_t);
  _BYTE v55[12];
  int v56;
  _BYTE *v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  _BYTE *v61;
  uint64_t v62;
  __int16 v63;
  __int128 v64;
  uint64_t v65;
  char v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  char v72;
  __int128 v73;
  double v74;
  __int128 v75;
  uint64_t v76;
  char v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  char v83;
  __int128 v84;

  v58 = a2;
  v3 = sub_1000033B8(&qword_100052000);
  v60 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v57 = &v55[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  *(_QWORD *)&v59 = &v55[-v6];
  __chkstk_darwin(v7);
  v61 = &v55[-v8];
  v9 = type metadata accessor for WidgetFamily(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = &v55[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v13);
  v15 = &v55[-v14];
  v16 = (int *)type metadata accessor for SummarySection(0);
  __chkstk_darwin(v16);
  v18 = &v55[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = sub_10001A950();
  sub_100017970(a1, (uint64_t)v18, type metadata accessor for SummarySection);
  if ((v19 & 1) != 0)
  {
    sub_100016F6C((uint64_t)v15);
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for WidgetFamily.systemSmall(_:), v9);
    v20 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(&v64, v9, v20);
    dispatch thunk of RawRepresentable.rawValue.getter(&v80, v9, v20);
    v21 = v64;
    v22 = v80;
    v23 = *(void (**)(_BYTE *, uint64_t))(v10 + 8);
    v23(v12, v9);
    v23(v15, v9);
    sub_1000179B4((uint64_t)v18, type metadata accessor for SummarySection);
    v24 = v21 == v22;
    v25 = v59;
    if (v24)
    {
      v56 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    sub_1000179B4((uint64_t)v18, type metadata accessor for SummarySection);
    v25 = v59;
  }
  v56 = 1;
LABEL_7:
  v26 = *(void **)(a1 + v16[7]);
  v27 = *(unsigned __int8 *)(a1 + v16[11]);
  v28 = v26;
  sub_1000253D0(v26, v27, 0, (uint64_t)&v75);
  v59 = v75;
  v29 = v76;
  v30 = v77;
  v31 = v78;
  v32 = v79;
  v33 = *(double *)(a1 + v16[9]);
  v34 = sub_10001C0D0(v33);
  v35 = sub_10001C0D0(v33);
  v37 = static Alignment.center.getter(v36);
  _FrameLayout.init(width:height:alignment:)(&v80, *(_QWORD *)&v34, 0, *(_QWORD *)&v35, 0, v37, v38);
  v39 = 0.36;
  if (!v27)
    v39 = 1.0;
  v64 = v59;
  v65 = v29;
  v66 = v30;
  v67 = v31;
  v68 = v32;
  v69 = v80;
  v70 = v81;
  v71 = v82;
  v72 = v83;
  v73 = v84;
  v74 = v39;
  v40 = sub_1000033B8(&qword_100052008);
  v41 = sub_10000374C(&qword_100052010, &qword_100052008, (void (*)(void))sub_10001F088);
  View.widgetAccentable(_:)(1, v40, v41);
  sub_10001F0AC((uint64_t)&v75);
  v42 = v60;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v60 + 32))(v61, v25, v3);
  if ((sub_10001A950() & 1) != 0)
  {
    v62 = 0;
    v63 = 0;
  }
  else
  {
    v62 = 0;
    v63 = 257;
  }
  _ConditionalContent<>.init(storage:)(&v62, &type metadata for Spacer, &type metadata for Spacer, &protocol witness table for Spacer, &protocol witness table for Spacer);
  v43 = v64;
  v44 = BYTE8(v64);
  v45 = BYTE9(v64);
  v46 = v58;
  v47 = v57;
  v48 = v56;
  v49 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v42 + 16);
  v50 = v61;
  v49(v57, v61, v3);
  *(_QWORD *)v46 = 0;
  *(_BYTE *)(v46 + 8) = 0;
  *(_BYTE *)(v46 + 9) = v48;
  v51 = sub_1000033B8(&qword_100052028);
  v49((_BYTE *)(v46 + *(int *)(v51 + 48)), v47, v3);
  v52 = v46 + *(int *)(v51 + 64);
  *(_QWORD *)v52 = v43;
  *(_BYTE *)(v52 + 8) = v44;
  *(_BYTE *)(v52 + 9) = v45;
  v53 = *(void (**)(_BYTE *, uint64_t))(v42 + 8);
  v53(v50, v3);
  return ((uint64_t (*)(_BYTE *, uint64_t))v53)(v47, v3);
}

double sub_10001C0D0(double a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  int v26;
  BOOL v27;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v2 = v1;
  v4 = type metadata accessor for DynamicTypeSize(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for WidgetFamily(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v31 - v13;
  v15 = type metadata accessor for SummarySection(0);
  __chkstk_darwin(v15);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v2 + *(int *)(v18 + 32)) & 1) == 0)
  {
    v32 = v5;
    v19 = *(unsigned __int8 *)(v2 + *(int *)(v15 + 44));
    sub_100017970(v2, (uint64_t)v17, type metadata accessor for SummarySection);
    if (v19 == 1)
    {
      sub_100016F6C((uint64_t)v14);
      (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for WidgetFamily.systemMedium(_:), v8);
      v20 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
      v31 = v4;
      v21 = v20;
      dispatch thunk of RawRepresentable.rawValue.getter(&v34, v8, v20);
      dispatch thunk of RawRepresentable.rawValue.getter(&v33, v8, v21);
      v23 = v33;
      v22 = v34;
      v24 = *(void (**)(char *, uint64_t))(v9 + 8);
      v24(v11, v8);
      v24(v14, v8);
      sub_1000179B4((uint64_t)v17, type metadata accessor for SummarySection);
      v27 = v22 == v23;
      v4 = v31;
      if (v27)
        return a1;
    }
    else
    {
      sub_1000179B4((uint64_t)v17, type metadata accessor for SummarySection);
    }
    sub_100016F9C((uint64_t)v7);
    v25 = v32;
    v26 = (*(uint64_t (**)(char *, uint64_t))(v32 + 88))(v7, v4);
    v27 = v26 == enum case for DynamicTypeSize.xSmall(_:) || v26 == enum case for DynamicTypeSize.small(_:);
    if (v27 || v26 == enum case for DynamicTypeSize.medium(_:))
      return 54.5;
    if (v26 == enum case for DynamicTypeSize.large(_:))
      return 50.5;
    if (v26 == enum case for DynamicTypeSize.xLarge(_:))
      return 46.5;
    if (v26 != enum case for DynamicTypeSize.accessibility1(_:)
      && v26 != enum case for DynamicTypeSize.accessibility2(_:)
      && v26 != enum case for DynamicTypeSize.accessibility3(_:)
      && v26 != enum case for DynamicTypeSize.accessibility4(_:)
      && v26 != enum case for DynamicTypeSize.accessibility5(_:))
    {
      (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v4);
      return 42.5;
    }
  }
  return a1;
}

uint64_t sub_10001C404@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;
  _OWORD v20[3];

  v6 = sub_1000033B8(&qword_100051FB8);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = static HorizontalAlignment.leading.getter(v7);
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 0;
  v10 = sub_1000033B8(&qword_100051FC0);
  v11 = sub_10001C518(a2, a1, (uint64_t)&v9[*(int *)(v10 + 44)]);
  GeometryProxy.size.getter(v11);
  v13 = v12;
  v15 = static Alignment.center.getter(v14);
  _FrameLayout.init(width:height:alignment:)(v20, 0, 1, v13, 0, v15, v16);
  sub_100003478((uint64_t)v9, a3, &qword_100051FB8);
  v17 = (_OWORD *)(a3 + *(int *)(sub_1000033B8(&qword_100051FC8) + 36));
  v18 = v20[1];
  *v17 = v20[0];
  v17[1] = v18;
  v17[2] = v20[2];
  return sub_1000034BC((uint64_t)v9, &qword_100051FB8);
}

id sub_10001C518@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
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
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(_QWORD, _QWORD);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __n128 v59;
  int v60;
  id v61;
  unint64_t v62;
  unint64_t v63;
  char v64;
  _QWORD *v65;
  __n128 v66;
  uint64_t v67;
  _QWORD *v68;
  void (*v69)(_QWORD, _QWORD);
  _QWORD *v70;
  _QWORD *v71;
  double v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _OWORD *v79;
  __int128 v80;
  uint64_t v81;
  char *v82;
  unint64_t v83;
  char *v84;
  id *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t OpaqueTypeConformance2;
  uint64_t v96;
  uint64_t v97;
  __n128 v98;
  void (*v99)(char *, uint64_t, __n128);
  uint64_t v100;
  uint64_t v101;
  id v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  id v108;
  uint64_t v109;
  id v110;
  id result;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  __n128 v119;
  uint64_t KeyPath;
  uint64_t v121;
  _QWORD *v122;
  __n128 v123;
  uint64_t v124;
  _QWORD *v125;
  char *v126;
  uint64_t *v127;
  uint64_t *v128;
  double v129;
  double v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _OWORD *v136;
  __int128 v137;
  uint64_t v138;
  char *v139;
  char *v140;
  id *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char v149;
  char v150;
  uint64_t v151;
  uint64_t v152;
  __n128 v153;
  uint64_t v154;
  uint64_t v155;
  id v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  __n128 v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD *v169;
  __n128 v170;
  uint64_t v171;
  _QWORD *v172;
  char *v173;
  _QWORD *v174;
  uint64_t *v175;
  double v176;
  double v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  _OWORD *v183;
  __int128 v184;
  uint64_t v185;
  char *v186;
  char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  char v194;
  uint64_t v195;
  uint64_t v196;
  __n128 v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t *v206;
  char *v207;
  char *v208;
  uint64_t v209;
  char *v210;
  uint64_t v211;
  uint64_t *v212;
  char *v213;
  uint64_t v214;
  char *v215;
  char *v216;
  uint64_t v217;
  uint64_t v218;
  char *v219;
  char *v220;
  char *v221;
  void (*v222)(char *, uint64_t, __n128);
  uint64_t v223;
  unint64_t v224;
  void (*v225)(_QWORD, _QWORD);
  unint64_t v226;
  unint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  id *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  char *v238;
  uint64_t v239;
  uint64_t v240;
  _QWORD v241[2];
  _OWORD v242[3];
  _OWORD v243[3];
  _OWORD v244[3];

  v237 = a2;
  v218 = a3;
  v239 = type metadata accessor for AccessibilityChildBehavior(0);
  v226 = *(_QWORD *)(v239 - 8);
  __chkstk_darwin(v239);
  v238 = (char *)&v205 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (int *)type metadata accessor for SummarySection(0);
  __chkstk_darwin(v5);
  v230 = (uint64_t)&v205 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (int *)type metadata accessor for FractionView(0);
  __chkstk_darwin(v7);
  v212 = (uint64_t *)((char *)&v205 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v9);
  v206 = (uint64_t *)((char *)&v205 - v10);
  __chkstk_darwin(v11);
  v13 = (uint64_t *)((char *)&v205 - v12);
  v235 = sub_1000033B8(&qword_100051FD0);
  __chkstk_darwin(v235);
  v211 = (uint64_t)&v205 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v209 = (uint64_t)&v205 - v16;
  __chkstk_darwin(v17);
  v224 = (unint64_t)&v205 - v18;
  v236 = sub_1000033B8(&qword_100051FD8);
  v222 = *(void (**)(char *, uint64_t, __n128))(v236 - 8);
  __chkstk_darwin(v236);
  v213 = (char *)&v205 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v210 = (char *)&v205 - v21;
  __chkstk_darwin(v22);
  v219 = (char *)&v205 - v23;
  v234 = sub_1000033B8(&qword_100051FE0);
  __chkstk_darwin(v234);
  v217 = (uint64_t)&v205 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v216 = (char *)&v205 - v26;
  __chkstk_darwin(v27);
  v215 = (char *)&v205 - v28;
  __chkstk_darwin(v29);
  v214 = (uint64_t)&v205 - v30;
  __chkstk_darwin(v31);
  v208 = (char *)&v205 - v32;
  __chkstk_darwin(v33);
  v207 = (char *)&v205 - v34;
  __chkstk_darwin(v35);
  v231 = (uint64_t)&v205 - v36;
  __chkstk_darwin(v37);
  v221 = (char *)&v205 - v38;
  __chkstk_darwin(v39);
  v220 = (char *)&v205 - v40;
  __chkstk_darwin(v41);
  v232 = (uint64_t)&v205 - v42;
  v43 = sub_10001D67C(&qword_100051148, &qword_100054870, (uint64_t)sub_100017B28);
  v44 = a1 + v5[13];
  v45 = *(id *)v44;
  v46 = *(void **)(v44 + 8);
  v48 = *(_QWORD *)(v44 + 16);
  v47 = *(_QWORD *)(v44 + 24);
  v233 = (id *)v44;
  sub_10003AEBC(v45, v46, v48, v47);
  v50 = v49;
  v225 = v51;
  v52 = v47;
  v53 = v230;
  sub_10003AED0(v45, v46, v48, v52);
  v55 = v54;
  v57 = v56;
  LODWORD(v45) = *(unsigned __int8 *)(a1 + v5[10]);
  v240 = a1;
  sub_100017970(a1, v53, type metadata accessor for SummarySection);
  v58 = v55;
  if ((_DWORD)v45 == 1)
  {
    sub_1000179B4(v53, type metadata accessor for SummarySection);
LABEL_4:
    v61 = 0;
    v62 = 0xE000000000000000;
    goto LABEL_6;
  }
  v60 = *(unsigned __int8 *)(v53 + v5[11]);
  sub_1000179B4(v53, type metadata accessor for SummarySection);
  if (v60 == 1)
    goto LABEL_4;
  v61 = sub_10003BDC4(*v233, v233[1]);
  v62 = v63;
LABEL_6:
  v230 = v5[8];
  v64 = *(_BYTE *)(v240 + v230);
  *v13 = swift_getKeyPath(&unk_100040730, v59);
  v229 = sub_1000033B8(&qword_100051D50);
  swift_storeEnumTagMultiPayload(v13, v229, 0);
  v65 = (_QWORD *)((char *)v13 + v7[5]);
  *v65 = swift_getKeyPath(&unk_100040648, v66);
  v228 = sub_1000033B8(&qword_100051D88);
  swift_storeEnumTagMultiPayload(v65, v228, 0);
  *(_QWORD *)&v244[0] = 0x4034000000000000;
  v227 = sub_100008BBC();
  v67 = ScaledMetric.init(wrappedValue:)(v244, &type metadata for CGFloat);
  *(_QWORD *)((char *)v13 + v7[7]) = v43;
  v68 = (_QWORD *)((char *)v13 + v7[8]);
  v69 = v225;
  *v68 = v50;
  v68[1] = v69;
  v70 = (_QWORD *)((char *)v13 + v7[9]);
  *v70 = v58;
  v70[1] = v57;
  v71 = (_QWORD *)((char *)v13 + v7[10]);
  *v71 = v61;
  v71[1] = v62;
  *((_BYTE *)v13 + v7[11]) = v64;
  *(_QWORD *)((char *)v13 + v7[12]) = 0;
  GeometryProxy.size.getter(v67);
  v73 = v72 / 3.0;
  v75 = static Alignment.center.getter(v74);
  _FrameLayout.init(width:height:alignment:)(v242, 0, 1, *(_QWORD *)&v73, 0, v75, v76);
  v77 = v224;
  sub_100017970((uint64_t)v13, v224, type metadata accessor for FractionView);
  v78 = v235;
  v79 = (_OWORD *)(v77 + *(int *)(v235 + 36));
  v80 = v242[1];
  *v79 = v242[0];
  v79[1] = v80;
  v79[2] = v242[2];
  v81 = sub_1000179B4((uint64_t)v13, type metadata accessor for FractionView);
  v82 = v238;
  static AccessibilityChildBehavior.ignore.getter(v81);
  v83 = sub_10001F004();
  v84 = v219;
  View.accessibilityElement(children:)(v82, v78, v83);
  v225 = *(void (**)(_QWORD, _QWORD))(v226 + 8);
  v225(v82, v239);
  sub_1000034BC(v77, &qword_100051FD0);
  v85 = v233;
  sub_10003B75C(v233[1]);
  *(_QWORD *)&v244[0] = v86;
  *((_QWORD *)&v244[0] + 1) = v87;
  v224 = sub_100008E40();
  v88 = Text.init<A>(_:)(v244, &type metadata for String, v224);
  v90 = v89;
  v92 = v91;
  v94 = v93 & 1;
  *(_QWORD *)&v244[0] = v78;
  *((_QWORD *)&v244[0] + 1) = v83;
  v226 = v83;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v244, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  v96 = (uint64_t)v221;
  v97 = v236;
  v223 = OpaqueTypeConformance2;
  View.accessibility(label:)(v88, v90, v94, v92, v236, OpaqueTypeConformance2);
  sub_100008E84(v88, v90, v94);
  v98 = swift_bridgeObjectRelease(v92);
  v99 = (void (*)(char *, uint64_t, __n128))*((_QWORD *)v222 + 1);
  v99(v84, v97, v98);
  v100 = (uint64_t)v220;
  ModifiedContent<>.accessibility(sortPriority:)(v234, 2.0);
  sub_1000034BC(v96, &qword_100051FE0);
  sub_1000082A0(v100, v232, &qword_100051FE0);
  v101 = sub_10001D67C(&qword_100051150, &qword_100054878, (uint64_t)sub_100017B44);
  v103 = *v85;
  v102 = v85[1];
  v105 = (uint64_t)v85[2];
  v104 = (uint64_t)v85[3];
  v106 = (char *)sub_10003B00C(*v85, v102, v105, v104);
  v222 = v99;
  v221 = v106;
  v220 = v107;
  if (!v102)
  {
LABEL_9:
    v109 = v101;
    swift_bridgeObjectRetain(v104);
LABEL_12:
    v114 = v240;
    v115 = sub_10001D504();
    v117 = v116;
    v118 = *(_BYTE *)(v114 + v230);
    KeyPath = swift_getKeyPath(&unk_100040730, v119);
    v121 = (uint64_t)v206;
    *v206 = KeyPath;
    swift_storeEnumTagMultiPayload(v121, v229, 0);
    v122 = (_QWORD *)(v121 + v7[5]);
    *v122 = swift_getKeyPath(&unk_100040648, v123);
    swift_storeEnumTagMultiPayload(v122, v228, 0);
    *(_QWORD *)&v244[0] = 0x4034000000000000;
    v124 = ScaledMetric.init(wrappedValue:)(v244, &type metadata for CGFloat);
    *(_QWORD *)(v121 + v7[7]) = v109;
    v125 = (_QWORD *)(v121 + v7[8]);
    v126 = v220;
    *v125 = v221;
    v125[1] = v126;
    v127 = (uint64_t *)(v121 + v7[9]);
    *v127 = v105;
    v127[1] = v104;
    v128 = (uint64_t *)(v121 + v7[10]);
    *v128 = v115;
    v128[1] = v117;
    *(_BYTE *)(v121 + v7[11]) = v118;
    *(_QWORD *)(v121 + v7[12]) = 0x3FC3333333333333;
    GeometryProxy.size.getter(v124);
    v130 = v129 / 3.0;
    v132 = static Alignment.center.getter(v131);
    _FrameLayout.init(width:height:alignment:)(v243, 0, 1, *(_QWORD *)&v130, 0, v132, v133);
    v134 = v209;
    sub_100017970(v121, v209, type metadata accessor for FractionView);
    v135 = v235;
    v136 = (_OWORD *)(v134 + *(int *)(v235 + 36));
    v137 = v243[1];
    *v136 = v243[0];
    v136[1] = v137;
    v136[2] = v243[2];
    v138 = sub_1000179B4(v121, type metadata accessor for FractionView);
    v139 = v238;
    static AccessibilityChildBehavior.ignore.getter(v138);
    v140 = v210;
    View.accessibilityElement(children:)(v139, v135, v226);
    v225(v139, v239);
    sub_1000034BC(v134, &qword_100051FD0);
    v141 = v233;
    sub_10003BEE8(v233[1]);
    *(_QWORD *)&v244[0] = v142;
    *((_QWORD *)&v244[0] + 1) = v143;
    v144 = Text.init<A>(_:)(v244, &type metadata for String, v224);
    v146 = v145;
    v148 = v147;
    v150 = v149 & 1;
    v151 = (uint64_t)v208;
    v152 = v236;
    View.accessibility(label:)(v144, v145, v149 & 1, v147, v236, v223);
    sub_100008E84(v144, v146, v150);
    v153 = swift_bridgeObjectRelease(v148);
    v222(v140, v152, v153);
    v154 = (uint64_t)v207;
    ModifiedContent<>.accessibility(sortPriority:)(v234, 2.0);
    sub_1000034BC(v151, &qword_100051FE0);
    sub_1000082A0(v154, v231, &qword_100051FE0);
    v155 = v240;
    v221 = (char *)sub_10001D67C(&qword_100051158, &qword_100054880, (uint64_t)sub_100017B60);
    v157 = *v141;
    v156 = v141[1];
    v158 = (uint64_t)v141[2];
    v159 = (uint64_t)v141[3];
    v220 = (char *)sub_10003B020(*v141, v156, v158, v159);
    v219 = v160;
    v210 = (char *)sub_10003B034(v157, v156, v158, v159);
    v162 = v161;
    v163 = sub_10001D7D4();
    v165 = v164;
    LOBYTE(v157) = *(_BYTE *)(v155 + v230);
    v167 = swift_getKeyPath(&unk_100040730, v166);
    v168 = (uint64_t)v212;
    *v212 = v167;
    swift_storeEnumTagMultiPayload(v168, v229, 0);
    v169 = (_QWORD *)(v168 + v7[5]);
    *v169 = swift_getKeyPath(&unk_100040648, v170);
    swift_storeEnumTagMultiPayload(v169, v228, 0);
    *(_QWORD *)&v244[0] = 0x4034000000000000;
    v171 = ScaledMetric.init(wrappedValue:)(v244, &type metadata for CGFloat);
    *(_QWORD *)(v168 + v7[7]) = v221;
    v172 = (_QWORD *)(v168 + v7[8]);
    v173 = v219;
    *v172 = v220;
    v172[1] = v173;
    v174 = (_QWORD *)(v168 + v7[9]);
    *v174 = v210;
    v174[1] = v162;
    v175 = (uint64_t *)(v168 + v7[10]);
    *v175 = v163;
    v175[1] = v165;
    *(_BYTE *)(v168 + v7[11]) = (_BYTE)v157;
    *(_QWORD *)(v168 + v7[12]) = 0x3FD3333333333333;
    GeometryProxy.size.getter(v171);
    v177 = v176 / 3.0;
    v179 = static Alignment.center.getter(v178);
    _FrameLayout.init(width:height:alignment:)(v244, 0, 1, *(_QWORD *)&v177, 0, v179, v180);
    v181 = v211;
    sub_100017970(v168, v211, type metadata accessor for FractionView);
    v182 = v235;
    v183 = (_OWORD *)(v181 + *(int *)(v235 + 36));
    v184 = v244[1];
    *v183 = v244[0];
    v183[1] = v184;
    v183[2] = v244[2];
    v185 = sub_1000179B4(v168, type metadata accessor for FractionView);
    v186 = v238;
    static AccessibilityChildBehavior.ignore.getter(v185);
    v187 = v213;
    View.accessibilityElement(children:)(v186, v182, v226);
    v225(v186, v239);
    sub_1000034BC(v181, &qword_100051FD0);
    v241[0] = sub_10003C1C0(v141[1]);
    v241[1] = v188;
    v189 = Text.init<A>(_:)(v241, &type metadata for String, v224);
    v191 = v190;
    v193 = v192;
    LOBYTE(v157) = v194 & 1;
    v195 = (uint64_t)v216;
    v196 = v236;
    View.accessibility(label:)(v189, v190, v194 & 1, v192, v236, v223);
    sub_100008E84(v189, v191, (char)v157);
    v197 = swift_bridgeObjectRelease(v193);
    v222(v187, v196, v197);
    v198 = (uint64_t)v215;
    ModifiedContent<>.accessibility(sortPriority:)(v234, 2.0);
    sub_1000034BC(v195, &qword_100051FE0);
    v199 = v214;
    sub_1000082A0(v198, v214, &qword_100051FE0);
    v200 = v232;
    sub_100003478(v232, v198, &qword_100051FE0);
    v201 = v231;
    sub_100003478(v231, v195, &qword_100051FE0);
    v202 = v217;
    sub_100003478(v199, v217, &qword_100051FE0);
    v203 = v218;
    sub_100003478(v198, v218, &qword_100051FE0);
    v204 = sub_1000033B8(&qword_100051FF8);
    sub_100003478(v195, v203 + *(int *)(v204 + 48), &qword_100051FE0);
    sub_100003478(v202, v203 + *(int *)(v204 + 64), &qword_100051FE0);
    sub_1000034BC(v199, &qword_100051FE0);
    sub_1000034BC(v201, &qword_100051FE0);
    sub_1000034BC(v200, &qword_100051FE0);
    sub_1000034BC(v202, &qword_100051FE0);
    sub_1000034BC(v195, &qword_100051FE0);
    return (id)sub_1000034BC(v198, &qword_100051FE0);
  }
  v108 = v102;
  if ((objc_msgSend(v108, "paused") & 1) != 0)
  {

    goto LABEL_9;
  }
  v110 = objc_msgSend(v108, "exerciseTimeGoal");
  result = objc_msgSend(v103, "localizedStringWithBriskMinutes:", v110);
  if (result)
  {
    v112 = result;
    v109 = v101;
    v105 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    v104 = v113;

    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001D504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  int v6;
  uint64_t (*v7)(_QWORD);
  char v8;
  uint64_t v9;
  id v10;
  NSString v11;
  NSString v12;
  id v13;
  uint64_t v15;

  v1 = v0;
  v2 = type metadata accessor for SummarySection(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(unsigned __int8 *)(v1 + *(int *)(v5 + 40));
  sub_100017970(v1, (uint64_t)v4, v7);
  if (v6 == 1)
  {
    sub_1000179B4((uint64_t)v4, type metadata accessor for SummarySection);
  }
  else
  {
    v8 = v4[*(int *)(v2 + 44)];
    sub_1000179B4((uint64_t)v4, type metadata accessor for SummarySection);
    if ((v8 & 1) == 0)
    {
      v10 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v11 = String._bridgeToObjectiveC()();
      v12 = String._bridgeToObjectiveC()();
      v13 = objc_msgSend(v10, "localizedStringForKey:value:table:", v11, 0, v12);

      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      return v9;
    }
  }
  return 0;
}

uint64_t sub_10001D67C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;
  char v16;
  void (*v17)(char *, uint64_t);
  __n128 v18;
  uint64_t v19;

  v7 = type metadata accessor for WidgetRenderingMode(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v19 - v12;
  if (*(_BYTE *)(v3 + *(int *)(type metadata accessor for SummarySection(0) + 44)) == 1)
  {
    if (qword_100051198 != -1)
      swift_once(&qword_100051198, sub_100017CF0);
    return swift_retain(qword_1000548C0);
  }
  else
  {
    v15 = sub_1000171D8((uint64_t)v13);
    static WidgetRenderingMode.fullColor.getter(v15);
    v16 = static WidgetRenderingMode.== infix(_:_:)(v13, v10);
    v17 = *(void (**)(char *, uint64_t))(v8 + 8);
    v17(v10, v7);
    v17(v13, v7);
    if ((v16 & 1) != 0)
    {
      if (*a1 != -1)
        swift_once(a1, a3);
      return swift_retain(*a2);
    }
    else
    {
      return static Color.white.getter(v18);
    }
  }
}

uint64_t sub_10001D7D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  int v6;
  uint64_t (*v7)(_QWORD);
  char v8;
  uint64_t v9;
  id v10;
  NSString v11;
  NSString v12;
  id v13;
  uint64_t v15;

  v1 = v0;
  v2 = type metadata accessor for SummarySection(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(unsigned __int8 *)(v1 + *(int *)(v5 + 40));
  sub_100017970(v1, (uint64_t)v4, v7);
  if (v6 == 1)
  {
    sub_1000179B4((uint64_t)v4, type metadata accessor for SummarySection);
  }
  else
  {
    v8 = v4[*(int *)(v2 + 44)];
    sub_1000179B4((uint64_t)v4, type metadata accessor for SummarySection);
    if ((v8 & 1) == 0)
    {
      v10 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v11 = String._bridgeToObjectiveC()();
      v12 = String._bridgeToObjectiveC()();
      v13 = objc_msgSend(v10, "localizedStringForKey:value:table:", v11, 0, v12);

      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      return v9;
    }
  }
  return 0;
}

uint64_t sub_10001D958()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_10001D978()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_10001D998(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for WidgetRenderingMode(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.widgetRenderingMode.setter(v3);
}

_QWORD *sub_10001DA18(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(char *, uint64_t, uint64_t);
  id v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  char *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = (_QWORD *)((char *)a1 + v14);
    v16 = (_QWORD *)((char *)a2 + v14);
    v17 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = a3[6];
    v24 = (_QWORD *)((char *)a1 + v23);
    v25 = (_QWORD *)((char *)a2 + v23);
    v26 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v25, v26) == 1)
    {
      v27 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v24, v25, v27);
      v28 = v24;
      v29 = v26;
      v30 = 1;
    }
    else
    {
      v31 = *v25;
      *v24 = *v25;
      swift_retain(v31);
      v28 = v24;
      v29 = v26;
      v30 = 0;
    }
    swift_storeEnumTagMultiPayload(v28, v29, v30);
    v32 = a3[7];
    v33 = a3[8];
    v34 = *(void **)((char *)a2 + v32);
    *(_QWORD *)((char *)a1 + v32) = v34;
    *((_BYTE *)a1 + v33) = *((_BYTE *)a2 + v33);
    v35 = a3[10];
    *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
    *((_BYTE *)a1 + v35) = *((_BYTE *)a2 + v35);
    v36 = a3[12];
    *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
    v37 = (char *)a1 + v36;
    v38 = (char *)a2 + v36;
    v39 = type metadata accessor for Date(0);
    v40 = *(_QWORD *)(v39 - 8);
    v41 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48);
    v42 = v34;
    if (v41(v38, 1, v39))
    {
      v43 = sub_1000033B8((uint64_t *)&unk_100051980);
      memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v37, v38, v39);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
    }
    v44 = a3[13];
    v45 = (_QWORD *)((char *)a1 + v44);
    v46 = (char *)a2 + v44;
    v47 = *(void **)v46;
    v48 = (void *)*((_QWORD *)v46 + 1);
    *v45 = *(_QWORD *)v46;
    v45[1] = v48;
    v49 = *((_QWORD *)v46 + 3);
    v45[2] = *((_QWORD *)v46 + 2);
    v45[3] = v49;
    v50 = v47;
    v51 = v48;
    swift_bridgeObjectRetain(v49);
  }
  return a1;
}

double sub_10001DCD8(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  double result;

  v4 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + a2[5]);
  v7 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (_QWORD *)((char *)a1 + a2[6]);
  v10 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
  }
  else
  {
    swift_release(*v9);
  }

  v12 = (char *)a1 + a2[12];
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
  v15 = (id *)((char *)a1 + a2[13]);

  *(_QWORD *)&result = swift_bridgeObjectRelease(v15[3]).n128_u64[0];
  return result;
}

_QWORD *sub_10001DE58(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int (*v39)(char *, uint64_t, uint64_t);
  id v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;

  v6 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = a3[6];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v24 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v23, v24) == 1)
  {
    v25 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v22, v23, v25);
    v26 = v22;
    v27 = v24;
    v28 = 1;
  }
  else
  {
    v29 = *v23;
    *v22 = *v23;
    swift_retain(v29);
    v26 = v22;
    v27 = v24;
    v28 = 0;
  }
  swift_storeEnumTagMultiPayload(v26, v27, v28);
  v30 = a3[7];
  v31 = a3[8];
  v32 = *(void **)((char *)a2 + v30);
  *(_QWORD *)((char *)a1 + v30) = v32;
  *((_BYTE *)a1 + v31) = *((_BYTE *)a2 + v31);
  v33 = a3[10];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  *((_BYTE *)a1 + v33) = *((_BYTE *)a2 + v33);
  v34 = a3[12];
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  v35 = (char *)a1 + v34;
  v36 = (char *)a2 + v34;
  v37 = type metadata accessor for Date(0);
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48);
  v40 = v32;
  if (v39(v36, 1, v37))
  {
    v41 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v35, v36, v37);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
  }
  v42 = a3[13];
  v43 = (_QWORD *)((char *)a1 + v42);
  v44 = (char *)a2 + v42;
  v45 = *(void **)v44;
  v46 = (void *)*((_QWORD *)v44 + 1);
  *v43 = *(_QWORD *)v44;
  v43[1] = v46;
  v47 = *((_QWORD *)v44 + 3);
  v43[2] = *((_QWORD *)v44 + 2);
  v43[3] = v47;
  v48 = v45;
  v49 = v46;
  swift_bridgeObjectRetain(v47);
  return a1;
}

_QWORD *sub_10001E0EC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(char *, uint64_t, uint64_t);
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B88);
    v6 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = a3[5];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    sub_1000034BC((uint64_t)a1 + v12, &qword_100051B90);
    v15 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
    v21 = a3[6];
    v22 = (_QWORD *)((char *)a1 + v21);
    v23 = (_QWORD *)((char *)a2 + v21);
    sub_1000034BC((uint64_t)a1 + v21, &qword_100051D88);
    v24 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v23, v24) == 1)
    {
      v25 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v22, v23, v25);
      v26 = v22;
      v27 = v24;
      v28 = 1;
    }
    else
    {
      v29 = *v23;
      *v22 = *v23;
      swift_retain(v29);
      v26 = v22;
      v27 = v24;
      v28 = 0;
    }
    swift_storeEnumTagMultiPayload(v26, v27, v28);
  }
  v30 = a3[7];
  v31 = *(void **)((char *)a1 + v30);
  v32 = *(void **)((char *)a2 + v30);
  *(_QWORD *)((char *)a1 + v30) = v32;
  v33 = v32;

  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  *((_BYTE *)a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  v34 = a3[12];
  v35 = (char *)a1 + v34;
  v36 = (char *)a2 + v34;
  v37 = type metadata accessor for Date(0);
  v38 = *(_QWORD *)(v37 - 8);
  v39 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48);
  v40 = v39(v35, 1, v37);
  v41 = v39(v36, 1, v37);
  if (!v40)
  {
    if (!v41)
    {
      (*(void (**)(char *, char *, uint64_t))(v38 + 24))(v35, v36, v37);
      goto LABEL_18;
    }
    (*(void (**)(char *, uint64_t))(v38 + 8))(v35, v37);
    goto LABEL_17;
  }
  if (v41)
  {
LABEL_17:
    v42 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    goto LABEL_18;
  }
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v35, v36, v37);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
LABEL_18:
  v43 = a3[13];
  v44 = (char *)a1 + v43;
  v45 = (char *)a2 + v43;
  v46 = *(void **)v45;
  v47 = *(void **)v44;
  *(_QWORD *)v44 = *(_QWORD *)v45;
  v48 = v46;

  v49 = (void *)*((_QWORD *)v44 + 1);
  v50 = (void *)*((_QWORD *)v45 + 1);
  *((_QWORD *)v44 + 1) = v50;
  v51 = v50;

  *((_QWORD *)v44 + 2) = *((_QWORD *)v45 + 2);
  v52 = *((_QWORD *)v45 + 3);
  v53 = *((_QWORD *)v44 + 3);
  *((_QWORD *)v44 + 3) = v52;
  swift_bridgeObjectRetain(v52);
  swift_bridgeObjectRelease(v53);
  return a1;
}

char *sub_10001E438(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  __int128 v29;

  v6 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v15, v16) == 1)
  {
    v17 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload(v14, v16, 1);
  }
  else
  {
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  v18 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  a1[v18] = a2[v18];
  v19 = a3[10];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  a1[v19] = a2[v19];
  v20 = a3[12];
  a1[a3[11]] = a2[a3[11]];
  v21 = &a1[v20];
  v22 = &a2[v20];
  v23 = type metadata accessor for Date(0);
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  v26 = a3[13];
  v27 = &a1[v26];
  v28 = &a2[v26];
  v29 = *((_OWORD *)v28 + 1);
  *(_OWORD *)v27 = *(_OWORD *)v28;
  *((_OWORD *)v27 + 1) = v29;
  return a1;
}

char *sub_10001E69C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(char *, uint64_t, uint64_t);
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B88);
    v6 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_1000034BC((uint64_t)&a1[v8], &qword_100051B90);
    v11 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    v13 = a3[6];
    v14 = &a1[v13];
    v15 = &a2[v13];
    sub_1000034BC((uint64_t)&a1[v13], &qword_100051D88);
    v16 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v15, v16) == 1)
    {
      v17 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload(v14, v16, 1);
    }
    else
    {
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
  }
  v18 = a3[7];
  v19 = *(void **)&a1[v18];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];

  v20 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  *(_QWORD *)&a1[v20] = *(_QWORD *)&a2[v20];
  v21 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  a1[v21] = a2[v21];
  v22 = a3[12];
  v23 = &a1[v22];
  v24 = &a2[v22];
  v25 = type metadata accessor for Date(0);
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  v28 = v27(v23, 1, v25);
  v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 40))(v23, v24, v25);
      goto LABEL_17;
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v23, v25);
    goto LABEL_16;
  }
  if (v29)
  {
LABEL_16:
    v30 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_17;
  }
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v23, v24, v25);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
LABEL_17:
  v31 = a3[13];
  v32 = &a1[v31];
  v33 = &a2[v31];
  v34 = *(void **)&a1[v31];
  *(_QWORD *)&a1[v31] = *(_QWORD *)v33;

  v35 = (void *)*((_QWORD *)v32 + 1);
  *((_QWORD *)v32 + 1) = *((_QWORD *)v33 + 1);

  v36 = *((_QWORD *)v33 + 3);
  v37 = *((_QWORD *)v32 + 3);
  *((_QWORD *)v32 + 2) = *((_QWORD *)v33 + 2);
  *((_QWORD *)v32 + 3) = v36;
  swift_bridgeObjectRelease(v37);
  return a1;
}

uint64_t sub_10001E9B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001E9C4);
}

uint64_t sub_10001E9C4(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = sub_1000033B8(&qword_100051B98);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_1000033B8(&qword_100051BA0);
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
  v14 = sub_1000033B8(&qword_100051E48);
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_9;
  }
  v15 = sub_1000033B8((uint64_t *)&unk_100051980);
  v12 = *(_QWORD *)(v15 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v15;
    v13 = a3[12];
    goto LABEL_9;
  }
  v17 = *(_QWORD *)(a1 + a3[13]);
  if (v17 >= 0xFFFFFFFF)
    LODWORD(v17) = -1;
  return (v17 + 1);
}

uint64_t sub_10001EAC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001EAD0);
}

uint64_t sub_10001EAD0(uint64_t a1, uint64_t a2, int a3, int *a4)
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

  v8 = sub_1000033B8(&qword_100051B98);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = sub_1000033B8(&qword_100051BA0);
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
  v16 = sub_1000033B8(&qword_100051E48);
  v14 = *(_QWORD *)(v16 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v16;
    v15 = a4[6];
    goto LABEL_9;
  }
  result = sub_1000033B8((uint64_t *)&unk_100051980);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[12];
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + a4[13]) = (a2 - 1);
  return result;
}

void sub_10001EBCC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v10[10];

  sub_100014804(319, &qword_100051C10, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v3 <= 0x3F)
  {
    v10[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100014804(319, (unint64_t *)&unk_100051C18, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v5 <= 0x3F)
    {
      v10[1] = *(_QWORD *)(v4 - 8) + 64;
      sub_100014804(319, (unint64_t *)&qword_100051EB8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
      if (v7 <= 0x3F)
      {
        v10[2] = *(_QWORD *)(v6 - 8) + 64;
        v10[3] = "\b";
        v10[4] = &unk_1000406B0;
        v10[5] = (char *)&value witness table for Builtin.Int64 + 64;
        v10[6] = &unk_1000406B0;
        v10[7] = &unk_1000406B0;
        sub_100014804(319, (unint64_t *)&qword_100051720, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
        if (v9 <= 0x3F)
        {
          v10[8] = *(_QWORD *)(v8 - 8) + 64;
          v10[9] = &unk_1000406C8;
          swift_initStructMetadata(a1, 256, 10, v10, a1 + 16);
        }
      }
    }
  }
}

uint64_t sub_10001ED14(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100041FDC, 1);
}

uint64_t sub_10001ED28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SummarySection(0) - 8) + 80);
  return sub_10001AD98(v1 + ((v3 + 16) & ~v3), a1);
}

unint64_t sub_10001ED64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051F70;
  if (!qword_100051F70)
  {
    v1 = sub_1000036E4(&qword_100051F50);
    sub_100003928(&qword_100051F78, &qword_100051F48, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051F70);
  }
  return result;
}

uint64_t sub_10001EDEC()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;

  v1 = (int *)type metadata accessor for SummarySection(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (_QWORD *)((char *)v6 + v1[5]);
  v10 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
  }
  else
  {
    swift_release(*v9);
  }
  v12 = (_QWORD *)((char *)v6 + v1[6]);
  v13 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
  {
    v14 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v12, v14);
  }
  else
  {
    swift_release(*v12);
  }

  v15 = (char *)v6 + v1[12];
  v16 = type metadata accessor for Date(0);
  v17 = *(_QWORD *)(v16 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    (*(void (**)(char *, uint64_t))(v17 + 8))(v15, v16);
  v18 = (id *)((char *)v6 + v1[13]);

  swift_bridgeObjectRelease(v18[3]);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10001EFB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SummarySection(0) - 8) + 80);
  return sub_10001C404(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_10001F004()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051FE8;
  if (!qword_100051FE8)
  {
    v1 = sub_1000036E4(&qword_100051FD0);
    sub_100008304(&qword_100051FF0, type metadata accessor for FractionView, (uint64_t)&unk_1000414B8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100051FE8);
  }
  return result;
}

uint64_t sub_10001F088()
{
  return sub_10000374C(&qword_100052018, &qword_100052020, (void (*)(void))sub_1000135C8);
}

uint64_t sub_10001F0AC(uint64_t a1)
{
  swift_release(*(_QWORD *)(a1 + 32));
  return a1;
}

uint64_t sub_10001F0D4()
{
  return sub_100003928(&qword_100052030, &qword_100051F08, (uint64_t)&protocol conformance descriptor for AdaptiveStack<A>);
}

uint64_t destroy for QuantityChart(uint64_t a1)
{
  swift_release(*(_QWORD *)a1);
  swift_release(*(_QWORD *)(a1 + 8));

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
}

uint64_t initializeWithCopy for QuantityChart(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = (void *)a2[2];
  v5 = a2[3];
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v5;
  v7 = a2[4];
  v8 = a2[5];
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
  swift_retain(v3);
  swift_retain(v4);
  v9 = v6;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  return a1;
}

uint64_t *assignWithCopy for QuantityChart(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = (void *)a2[2];
  v9 = (void *)a1[2];
  a1[2] = (uint64_t)v8;
  v10 = v8;

  a1[3] = a2[3];
  v11 = a2[4];
  v12 = a1[4];
  a1[4] = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v12);
  v13 = a1[5];
  v14 = a2[5];
  a1[5] = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v13);
  a1[6] = a2[6];
  a1[7] = a2[7];
  return a1;
}

__n128 initializeWithTake for QuantityChart(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for QuantityChart(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  swift_release(*(_QWORD *)a1);
  v4 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v6);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for QuantityChart(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QuantityChart(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for QuantityChart()
{
  return &type metadata for QuantityChart;
}

uint64_t sub_10001F398(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100042044, 1);
}

uint64_t sub_10001F3A8()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_10001F3C8(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for LayoutDirection(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.layoutDirection.setter(v3);
}

uint64_t sub_10001F444@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
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
  double v24;
  double v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  double v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __n128 v37;
  __int128 v38;
  uint64_t KeyPath;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t OpaqueTypeConformance2;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __n128 v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;

  v2 = v1;
  v4 = type metadata accessor for AccessibilityChildBehavior(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = type metadata accessor for ColorRenderingMode(0, v6);
  v76 = *(_QWORD *)(v78 - 8);
  __chkstk_darwin(v78);
  v74 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_1000033B8(&qword_1000514F0);
  __chkstk_darwin(v64);
  v67 = (uint64_t *)((char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v66 = type metadata accessor for LayoutDirection(0);
  v65 = *(_QWORD *)(v66 - 8);
  __chkstk_darwin(v66);
  v68 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_1000033B8(&qword_100052038);
  __chkstk_darwin(v70);
  v13 = (uint64_t *)((char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = sub_1000033B8(&qword_100052040);
  v71 = *(_QWORD *)(v14 - 8);
  v72 = v14;
  __chkstk_darwin(v14);
  v69 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_1000033B8(&qword_100052048);
  v16 = *(_QWORD *)(v77 - 8);
  __chkstk_darwin(v77);
  v18 = (char *)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F97C(v1[5], v1[6]);
  v20 = v19;
  v81 = v4;
  v82 = a1;
  v79 = v8;
  v80 = v5;
  v75 = v16;
  v73 = v18;
  if (v19)
  {
    v21 = *(_QWORD *)(v19 + 16);
    if (v21)
    {
      v22 = v1[2];
      swift_bridgeObjectRetain(v19);
      v23 = 0;
      v24 = 0.0;
      while (1)
      {
        v25 = v24;
        v26 = *(void **)(v20 + 8 * v23 + 32);
        if (v26)
        {
          v27 = v26;
          v28 = objc_msgSend(v27, "quantityValue");
          if (v28)
          {
            v29 = v28;
            objc_msgSend(v28, "doubleValueForUnit:", v22);
            v24 = v30;

            if (v25 < v24)
              goto LABEL_6;
          }
          else
          {

          }
        }
        v24 = v25;
LABEL_6:
        if (v21 == ++v23)
        {
          swift_bridgeObjectRelease(v20);
          goto LABEL_13;
        }
      }
    }
  }
  v24 = 0.0;
LABEL_13:
  v31 = v67;
  v32 = v66;
  v33 = v65;
  v34 = v64;
  v35 = swift_allocObject(&unk_10004EF28, 96, 7);
  v36 = *((_OWORD *)v2 + 1);
  *(_OWORD *)(v35 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v35 + 32) = v36;
  v37 = *((__n128 *)v2 + 2);
  v38 = *((_OWORD *)v2 + 3);
  *(__n128 *)(v35 + 48) = v37;
  *(_OWORD *)(v35 + 64) = v38;
  *(_QWORD *)(v35 + 80) = v20;
  *(double *)(v35 + 88) = v24;
  KeyPath = swift_getKeyPath(&unk_1000407E0, v37);
  v40 = v68;
  (*(void (**)(char *, _QWORD, uint64_t))(v33 + 104))(v68, enum case for LayoutDirection.leftToRight(_:), v32);
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))((char *)v31 + *(int *)(v34 + 28), v40, v32);
  *v31 = KeyPath;
  v41 = v70;
  sub_100003478((uint64_t)v31, (uint64_t)v13 + *(int *)(v70 + 36), &qword_1000514F0);
  *v13 = sub_100020FFC;
  v13[1] = v35;
  swift_bridgeObjectRetain(v20);
  sub_100021030(v2);
  swift_retain(v35);
  sub_1000034BC((uint64_t)v31, &qword_1000514F0);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v40, v32);
  swift_release(v35);
  v42 = v76;
  v43 = v74;
  v44 = v78;
  (*(void (**)(char *, _QWORD, uint64_t))(v76 + 104))(v74, enum case for ColorRenderingMode.nonLinear(_:), v78);
  v45 = sub_10002108C();
  v46 = v69;
  View.drawingGroup(opaque:colorMode:)(0, v43, v41, v45);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
  v47 = sub_1000034BC((uint64_t)v13, &qword_100052038);
  v48 = v79;
  static AccessibilityChildBehavior.ignore.getter(v47);
  v83 = v41;
  v84 = v45;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v83, &opaque type descriptor for <<opaque return type of View.drawingGroup(opaque:colorMode:)>>, 1);
  v51 = v72;
  v50 = v73;
  View.accessibilityElement(children:)(v48, v72, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v48, v81);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v46, v51);
  sub_100020748(v20);
  v53 = v52;
  v55 = v54;
  LOBYTE(v35) = v56;
  v58 = v57;
  swift_bridgeObjectRelease(v20);
  v83 = v51;
  v84 = OpaqueTypeConformance2;
  v59 = swift_getOpaqueTypeConformance2(&v83, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  v60 = v77;
  View.accessibility(label:)(v53, v55, v35 & 1, v58, v77, v59);
  sub_100008E84(v53, v55, v35 & 1);
  v61 = swift_bridgeObjectRelease(v58);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v75 + 8))(v50, v60, v61);
}

void sub_10001F97C(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
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
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  void *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, _QWORD *, uint64_t);
  char *v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  void *v44;
  unint64_t v45;
  __n128 v46;
  uint64_t v47;
  char *v48;
  _QWORD *v49;
  double v50;
  char *v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t (*v70)(char *, _QWORD, char *);
  unsigned int v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;

  v5 = (char *)type metadata accessor for Calendar.Component(0);
  v79 = *((_QWORD *)v5 - 1);
  __chkstk_darwin(v5);
  v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v8);
  v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (char *)type metadata accessor for Date(0);
  v12 = *((_QWORD *)v11 - 1);
  __chkstk_darwin(v11);
  v75 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v80 = (char *)&v63 - v15;
  __chkstk_darwin(v16);
  v74 = (char *)&v63 - v17;
  __chkstk_darwin(v18);
  v77 = (char *)&v63 - v19;
  v20 = type metadata accessor for Calendar(0);
  v21 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v76 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return;
  v72 = v10;
  v73 = v7;
  v24 = a1 & 0xFFFFFFFFFFFFFF8;
  if ((unint64_t)a1 >> 62)
    goto LABEL_49;
  v25 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v25)
    return;
  while (2)
  {
    v65 = v21;
    v66 = v22;
    v26 = sub_100021C50(v25);
    v64 = v2;
    if ((a1 & 0xC000000000000001) != 0)
    {
      v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v26, a1);
    }
    else
    {
      if ((v26 & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_59:
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
        return;
      }
      if (v26 >= *(_QWORD *)(v24 + 16))
        goto LABEL_59;
      v27 = *(id *)(a1 + 8 * v26 + 32);
    }
    v28 = v27;
    static Calendar.current.getter(v27);
    v2 = (char *)objc_msgSend(v28, "startDate");
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    if (a2 < 0)
      goto LABEL_60;
    v68 = v28;
    if (a2)
    {
      v24 = 0;
      v21 = 0;
      v71 = enum case for Calendar.Component.minute(_:);
      v70 = *(uint64_t (**)(char *, _QWORD, char *))(v79 + 104);
      v78 = (char *)&_swiftEmptyArrayStorage;
      a1 = (uint64_t)v11;
      v69 = a2;
      do
      {
        v29 = v73;
        v22 = (id)v70(v73, v71, v5);
        if (v21 == 0x16C16C16C16C17)
          goto LABEL_48;
        v30 = v24 / a2;
        v31 = a1;
        v32 = v80;
        v2 = v76;
        Calendar.startOfDay(for:)(v77);
        v11 = (char *)v72;
        Calendar.date(byAdding:value:to:wrappingComponents:)(v29, v30, v32, 0);
        v33 = *(void (**)(char *, uint64_t))(v12 + 8);
        v34 = v32;
        a1 = v31;
        v33(v34, v31);
        (*(void (**)(char *, char *))(v79 + 8))(v29, v5);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, v31) == 1)
        {
          sub_1000034BC((uint64_t)v11, (uint64_t *)&unk_100051980);
          a2 = v69;
        }
        else
        {
          v35 = v5;
          v36 = v69;
          v37 = *(void (**)(char *, _QWORD *, uint64_t))(v12 + 32);
          v38 = v74;
          v37(v74, v11, a1);
          v11 = (char *)a1;
          (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v75, v38, a1);
          if ((swift_isUniquelyReferenced_nonNull_native(v78) & 1) == 0)
            v78 = (char *)sub_1000078C0(0, *((_QWORD *)v78 + 2) + 1, 1, v78);
          v40 = *((_QWORD *)v78 + 2);
          v39 = *((_QWORD *)v78 + 3);
          v2 = (char *)(v40 + 1);
          if (v40 >= v39 >> 1)
            v78 = (char *)sub_1000078C0(v39 > 1, v40 + 1, 1, v78);
          v41 = v78;
          *((_QWORD *)v78 + 2) = v2;
          v37(&v41[((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v40], v75, (uint64_t)v11);
          v33(v74, (uint64_t)v11);
          a2 = v36;
          v5 = v35;
          a1 = (uint64_t)v11;
        }
        ++v21;
        v24 += 1440;
      }
      while (a2 != v21);
    }
    else
    {
      v78 = (char *)&_swiftEmptyArrayStorage;
      a1 = (uint64_t)v11;
    }
    v42 = a1;
    v81 = &_swiftEmptyArrayStorage;
    v43 = v78;
    v5 = (char *)*((_QWORD *)v78 + 2);
    v44 = v68;
    if (!v5)
    {
LABEL_46:
      swift_bridgeObjectRelease(v43);

      (*(void (**)(char *, uint64_t))(v12 + 8))(v77, v42);
      (*(void (**)(char *, id))(v65 + 8))(v76, v66);
      return;
    }
    sub_1000082A0((uint64_t)(v64 + 40), (uint64_t)&v82, &qword_1000520B0);
    v45 = 0;
    v67 = v12;
    v75 = v5;
    while (1)
    {
      sub_1000082A0((uint64_t)&v82, (uint64_t)&v83, &qword_1000520B0);
      v47 = v83;
      if (v83)
      {
        if (v45 < *((_QWORD *)v43 + 2))
          break;
      }
      v24 = 0;
LABEL_43:
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v46);
      v56 = v81[2];
      v55 = v81[3];
      if (v56 >= v55 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v55 > 1, v56 + 1, 1);
      ++v45;
      v57 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v56, v24);
      specialized Array._endMutation()(v57);
      if ((char *)v45 == v5)
        goto LABEL_46;
    }
    v48 = v80;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v80, &v43[((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v45], v42);
    swift_bridgeObjectRetain(v43);
    v49 = sub_10002233C(&v82);
    v50 = Date.timeIntervalSinceReferenceDate.getter(v49);
    v79 = *(_QWORD *)(v12 + 8);
    ((void (*)(char *, uint64_t))v79)(v48, v42);
    if (!((unint64_t)v47 >> 62))
    {
      v21 = *(_QWORD *)((v47 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v21)
        goto LABEL_27;
      goto LABEL_42;
    }
    if (v47 < 0)
      v54 = v47;
    else
      v54 = v47 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v47);
    v21 = _CocoaArrayWrapper.endIndex.getter(v54);
    sub_100022364(&v82);
    if (!v21)
    {
LABEL_42:
      sub_100022364(&v82);
      v43 = v78;
      v46 = swift_bridgeObjectRelease(v78);
      v24 = 0;
      v44 = v68;
      goto LABEL_43;
    }
LABEL_27:
    v12 = v42;
    v11 = (char *)(v47 & 0xC000000000000001);
    a2 = 4;
    while (1)
    {
      v2 = (char *)(a2 - 4);
      v22 = v11 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2 - 4, v47) : *(id *)(v47 + 8 * a2);
      v24 = (uint64_t)v22;
      a1 = a2 - 3;
      if (__OFADD__(v2, 1))
        break;
      v5 = (char *)objc_msgSend(v22, "startDate");
      v51 = v80;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v53 = Date.timeIntervalSinceReferenceDate.getter(v52);
      ((void (*)(char *, uint64_t))v79)(v51, v12);
      if (vabdd_f64(v53, v50) < 2.22044605e-16)
      {
        sub_100022364(&v82);
        v43 = v78;
        v46 = swift_bridgeObjectRelease(v78);
        goto LABEL_37;
      }

      ++a2;
      if (a1 == v21)
      {
        sub_100022364(&v82);
        v43 = v78;
        v46 = swift_bridgeObjectRelease(v78);
        v24 = 0;
LABEL_37:
        v42 = v12;
        v12 = v67;
        v44 = v68;
        v5 = v75;
        goto LABEL_43;
      }
    }
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    v78 = v11;
    v58 = v5;
    v59 = a2;
    v64 = v2;
    v60 = v22;
    if (a1 >= 0)
      v61 = v24;
    else
      v61 = a1;
    swift_bridgeObjectRetain(a1);
    v62 = _CocoaArrayWrapper.endIndex.getter(v61);
    swift_bridgeObjectRelease(a1);
    if (v62)
    {
      swift_bridgeObjectRetain(a1);
      v25 = _CocoaArrayWrapper.endIndex.getter(v61);
      swift_bridgeObjectRelease(a1);
      if ((v25 & 0x8000000000000000) != 0)
        goto LABEL_61;
      v22 = v60;
      v2 = v64;
      a2 = v59;
      v5 = v58;
      v11 = v78;
      if (!v25)
      {
        __break(1u);
        return;
      }
      continue;
    }
    break;
  }
}

_QWORD *sub_1000200E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v10;

  *(_QWORD *)a4 = static VerticalAlignment.top.getter();
  *(_QWORD *)(a4 + 8) = 0;
  *(_BYTE *)(a4 + 16) = 0;
  v10 = sub_1000033B8(&qword_100052070);
  return sub_100020154(a2, a1, a3, a4 + *(int *)(v10 + 44), a5);
}

_QWORD *sub_100020154@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v9;
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
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  unsigned __int8 v56;
  uint64_t v57;
  unsigned __int8 v58;
  uint64_t v59;
  uint64_t v60;

  v52 = a3;
  v9 = type metadata accessor for GeometryProxy(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  __chkstk_darwin(v9);
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000033B8(&qword_100052078);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v54 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v53 = (char *)&v44 - v17;
  GeometryProxy.size.getter(v18);
  v21 = 19.0;
  if (v20 <= 19.0)
    v21 = v20;
  v22 = v21;
  v23 = static Alignment.center.getter(v19);
  result = _FrameLayout.init(width:height:alignment:)(&v55, 0, 1, *(_QWORD *)&v22, 0, v23, v24);
  v26 = *(_QWORD *)(a1 + 48);
  if (v26 < 0)
  {
    __break(1u);
  }
  else
  {
    v50 = v59;
    v51 = v60;
    v49 = v58;
    v48 = v57;
    v47 = v56;
    v45 = v26;
    v46 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v9);
    v27 = *(unsigned __int8 *)(v10 + 80);
    v28 = (v27 + 80) & ~v27;
    v29 = (v11 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
    v44 = v14;
    v30 = (v29 + 15) & 0xFFFFFFFFFFFFFFF8;
    v31 = (char *)swift_allocObject(&unk_10004EF50, v30 + 8, v27 | 7);
    v32 = *(_OWORD *)(a1 + 16);
    *((_OWORD *)v31 + 1) = *(_OWORD *)a1;
    *((_OWORD *)v31 + 2) = v32;
    v33 = *(_OWORD *)(a1 + 48);
    *((_OWORD *)v31 + 3) = *(_OWORD *)(a1 + 32);
    *((_OWORD *)v31 + 4) = v33;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v31[v28], v12, v9);
    v34 = v52;
    *(_QWORD *)&v31[v29] = v52;
    *(double *)&v31[v30] = a5;
    sub_100021030((uint64_t *)a1);
    swift_bridgeObjectRetain(v34);
    v35 = sub_1000033B8(&qword_100052080);
    v36 = sub_100003928(&qword_100052088, &qword_100052080, (uint64_t)&protocol conformance descriptor for TupleView<A>);
    v37 = v53;
    ForEach<>.init(_:content:)(0, v45, sub_10002221C, v31, v35, v36);
    v38 = v44;
    v39 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
    v40 = v54;
    v39(v54, v37, v13);
    *(_BYTE *)a4 = 2;
    *(_QWORD *)(a4 + 8) = v46;
    *(_BYTE *)(a4 + 16) = v47;
    *(_QWORD *)(a4 + 24) = v48;
    *(_BYTE *)(a4 + 32) = v49;
    v41 = v51;
    *(_QWORD *)(a4 + 40) = v50;
    *(_QWORD *)(a4 + 48) = v41;
    v42 = sub_1000033B8(&qword_100052090);
    v39((char *)(a4 + *(int *)(v42 + 48)), v40, v13);
    v43 = *(void (**)(char *, uint64_t))(v38 + 8);
    v43(v37, v13);
    return (_QWORD *)((uint64_t (*)(char *, uint64_t))v43)(v40, v13);
  }
  return result;
}

void sub_100020428(unint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>, double a5@<D0>)
{
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v10 = GeometryProxy.size.getter(a1);
  GeometryProxy.size.getter(v11);
  v13 = v12;
  if (a3)
  {
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)(a3 + 16) > a1)
    {
      v14 = *(void **)(a3 + 8 * a1 + 32);
      v15 = (void *)a2[2];
      v16 = 0.0;
      if (v14)
      {
        v17 = v14;
        v18 = objc_msgSend(v17, "quantityValue");
        if (v18)
        {
          v19 = v18;
          if (a5 == 0.0)
          {

          }
          else
          {
            objc_msgSend(v18, "doubleValueForUnit:", v15);
            v21 = v20;

            v16 = v21 / a5;
          }
        }
        else
        {

        }
      }
      goto LABEL_11;
    }
    __break(1u);
    return;
  }
  v15 = (void *)a2[2];
  v16 = 0.0;
LABEL_11:
  if (v13 > 19.0)
    v13 = 19.0;
  v22 = (v10 - (double)(uint64_t)a2[6] + 1.0) / (double)(uint64_t)a2[6];
  v23 = *a2;
  v24 = a2[1];
  swift_retain(*a2);
  swift_retain(v24);
  v25 = v15;
  GeometryProxy.size.getter(v25);
  sub_1000205C0(a1, &v29, v26);
  v27 = v29;
  *(double *)a4 = v22;
  *(double *)(a4 + 8) = v13;
  *(double *)(a4 + 16) = v16;
  *(_QWORD *)(a4 + 24) = v23;
  *(_QWORD *)(a4 + 32) = v24;
  *(_QWORD *)(a4 + 40) = v25;
  *(_QWORD *)(a4 + 48) = v27;
  swift_retain(v23);
  v28 = swift_retain(v24);
  swift_release(v28);
  swift_release(v23);
}

uint64_t sub_1000205C0@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  ValueMetadata *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18[8];
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  __int128 v28;

  v5 = result + 1;
  if (__OFADD__(result, 1))
  {
    __break(1u);
    goto LABEL_25;
  }
  v6 = *(_QWORD *)(v3 + 48);
  if ((unint64_t)(v6 + 1) < 3)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v6 >= 0)
    v7 = *(_QWORD *)(v3 + 48);
  else
    v7 = v6 + 1;
  v8 = v6 / (v7 >> 1);
  if (!v8)
    goto LABEL_26;
  if (result == 0x7FFFFFFFFFFFFFFFLL && v8 == -1)
    goto LABEL_27;
  if (v5 % v8)
  {
    v18[0] = 0;
    v9 = sub_10002228C();
    v10 = &type metadata for ChartSeparator;
LABEL_23:
    result = AnyView.init<A>(_:)(v18, v10, v9);
    *a2 = result;
    return result;
  }
  v11 = *(_QWORD *)(v3 + 56);
  if (!v11)
    goto LABEL_28;
  if (v6 == 0x8000000000000000 && v11 == -1)
    goto LABEL_30;
  v12 = v6 / v11;
  if (!v12)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (result != 0x7FFFFFFFFFFFFFFFLL || v12 != -1)
  {
    if (v5 % v12)
      v13 = 1;
    else
      v13 = 2;
    if (a3 > 19.0)
      a3 = 19.0;
    v14 = a3;
    v15 = static Alignment.center.getter(result);
    _FrameLayout.init(width:height:alignment:)(&v24, 0, 1, *(_QWORD *)&v14, 0, v15, v16);
    v18[0] = v13;
    v19 = v24;
    v20 = v25;
    v21 = v26;
    v22 = v27;
    v23 = v28;
    v17 = sub_1000033B8(&qword_1000520A0);
    v9 = sub_1000222D0();
    v10 = (ValueMetadata *)v17;
    goto LABEL_23;
  }
LABEL_31:
  __break(1u);
  return result;
}

void sub_100020748(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  Swift::String v37;
  __n128 v38;
  Swift::String v39;
  __n128 v40;
  Swift::String v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  int64_t v46;
  uint64_t v47;
  char *v48;
  _QWORD v49[2];
  char *v50;

  v3 = type metadata accessor for LocalizedStringKey.StringInterpolation(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021128(v1[5]);
  v50 = (char *)&_swiftEmptyArrayStorage;
  v7 = v1[7];
  if (!v7)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v8 = v1[6];
  if (v8 == 0x8000000000000000 && v7 == -1)
    goto LABEL_44;
  if (v8 < 0)
    goto LABEL_41;
  v45 = v5;
  v46 = v7;
  v47 = v6;
  if (v8)
  {
    v10 = v8 / v7;
    if (v8 / v7)
    {
      if (!__OFSUB__(v10, 1))
      {
        v11 = 0;
        v44 = v8 - 1;
        v48 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          if (v11 <= v8)
            v12 = v8;
          else
            v12 = v11;
          v13 = 0.0;
          v14 = v11;
          while (1)
          {
            if (v12 == v14)
            {
              __break(1u);
LABEL_39:
              __break(1u);
              goto LABEL_40;
            }
            if (a1)
            {
              if ((unint64_t)v14 >= *(_QWORD *)(a1 + 16))
                goto LABEL_39;
              v15 = *(void **)(a1 + 32 + 8 * v14);
              if (v15)
              {
                v16 = v15;
                v17 = objc_msgSend(v16, "quantityValue");
                if (v17)
                {
                  v18 = v17;
                  objc_msgSend(v17, "doubleValueForUnit:", v1[2]);
                  v20 = v19;

                }
                else
                {
                  v20 = 0.0;
                }

                v13 = v13 + v20;
              }
            }
            if (v14 % v10 == v10 - 1)
              break;
            if (v8 == ++v14)
              goto LABEL_33;
          }
          if ((swift_isUniquelyReferenced_nonNull_native(v48) & 1) == 0)
            v48 = sub_100007BE4(0, *((_QWORD *)v48 + 2) + 1, 1, v48);
          v22 = *((_QWORD *)v48 + 2);
          v21 = *((_QWORD *)v48 + 3);
          if (v22 >= v21 >> 1)
            v48 = sub_100007BE4((char *)(v21 > 1), v22 + 1, 1, v48);
          v11 = v14 + 1;
          v23 = v48;
          *((_QWORD *)v48 + 2) = v22 + 1;
          *(double *)&v23[8 * v22 + 32] = v13;
          v50 = v23;
        }
        while (v44 != v14);
        goto LABEL_33;
      }
      goto LABEL_43;
    }
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    return;
  }
  v48 = (char *)&_swiftEmptyArrayStorage;
LABEL_33:
  v24 = v46;
  v25 = v47;
  v26 = *(_QWORD *)(v47 + 16);
  v27 = v48;
  if (v26 == v46 && v26 == *((_QWORD *)v48 + 2))
  {
    sub_100021030(v1);
    sub_100021FB0(0, v24, (uint64_t)v1, v25, (uint64_t)&v50);
    v29 = v28;
    swift_bridgeObjectRelease(v25);
    sub_100022104(v1);
    v49[0] = v29;
    v30 = sub_1000033B8(&qword_100051510);
    v31 = sub_100003928(&qword_100051518, &qword_100051510, (uint64_t)&protocol conformance descriptor for [A]);
    v32 = BidirectionalCollection<>.joined(separator:)(44, 0xE100000000000000, v30, v31);
    v34 = v33;
    swift_bridgeObjectRelease(v29);
    v49[0] = v32;
    v49[1] = v34;
    v35 = sub_100008E40();
    Text.init<A>(_:)(v49, &type metadata for String, v35);
  }
  else
  {
    v36 = v45;
    LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)(28, 2);
    v37._object = (void *)0x8000000100049230;
    v37._countAndFlagsBits = 0xD000000000000015;
    LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v37);
    v38 = swift_bridgeObjectRelease(v25);
    v49[0] = v26;
    LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)(v49, 1684827173, 0xE400000000000000, &type metadata for Int, &protocol witness table for Int, v38);
    v39._countAndFlagsBits = 0x20736D7573202CLL;
    v39._object = (void *)0xE700000000000000;
    LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v39);
    v49[0] = *((_QWORD *)v27 + 2);
    LocalizedStringKey.StringInterpolation.appendInterpolation<A>(_:specifier:)(v49, 1684827173, 0xE400000000000000, &type metadata for Int, &protocol witness table for Int, v40);
    v41._countAndFlagsBits = 0;
    v41._object = (void *)0xE000000000000000;
    LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v41);
    v42 = LocalizedStringKey.init(stringInterpolation:)(v36);
    Text.init(_:tableName:bundle:comment:)(v42);
  }
  swift_bridgeObjectRelease(v27);
}

_QWORD *sub_100020B60@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *result;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  double v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v4 = *(double *)(a1 + 8);
  v5 = fmax(*(double *)a1, 1.0);
  v6 = *(double *)(a1 + 16);
  if (v4 * v6 >= 2.0)
    v7 = v4 * v6;
  else
    v7 = 2.0;
  v8 = sub_1000033B8(&qword_100051630);
  v9 = swift_allocObject(v8, 48, 7);
  *(_OWORD *)(v9 + 16) = xmmword_10003FCD0;
  v10 = *(_QWORD *)(a1 + 32);
  v40 = *(_QWORD *)(a1 + 24);
  v39 = v10;
  *(_QWORD *)(v9 + 32) = v40;
  *(_QWORD *)(v9 + 40) = v10;
  v34 = v9;
  specialized Array._endMutation()(v9);
  sub_1000226F0(&v40);
  sub_1000226F0(&v39);
  v11 = Gradient.init(colors:)(v34);
  v12 = static UnitPoint.bottom.getter();
  v14 = v13;
  v15 = static UnitPoint.top.getter();
  v17 = LinearGradient.init(gradient:startPoint:endPoint:)(&v30, v11, v12, v14, v15, v16);
  v18 = v30;
  v29 = v31;
  v19 = v32;
  v20 = v33;
  v21 = static Alignment.center.getter(v17);
  result = _FrameLayout.init(width:height:alignment:)(&v34, *(_QWORD *)&v5, 0, *(_QWORD *)&v4, 0, v21, v22);
  v24 = v34;
  v25 = v35;
  v26 = v36;
  v27 = v37;
  v28 = 0.3;
  if (v6 != 0.0)
    v28 = 1.0;
  *(double *)a2 = v5;
  *(double *)(a2 + 8) = v7;
  *(double *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 24) = v18;
  *(_OWORD *)(a2 + 32) = v29;
  *(_QWORD *)(a2 + 48) = v19;
  *(_QWORD *)(a2 + 56) = v20;
  *(_WORD *)(a2 + 64) = 256;
  *(_QWORD *)(a2 + 72) = v24;
  *(_BYTE *)(a2 + 80) = v25;
  *(_QWORD *)(a2 + 88) = v26;
  *(_BYTE *)(a2 + 96) = v27;
  *(_OWORD *)(a2 + 104) = v38;
  *(double *)(a2 + 120) = v28;
  return result;
}

id sub_100020D0C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(v1 + 32);
  v7 = *(id *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 24);
  v3 = v8;
  v9 = v4;
  v5 = swift_allocObject(&unk_10004F008, 64, 7);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)v1;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v5 + 40) = v3;
  *(_QWORD *)(v5 + 48) = v4;
  *(_QWORD *)(v5 + 56) = v7;
  *a1 = sub_1000226E8;
  a1[1] = v5;
  sub_1000226F0(&v8);
  sub_1000226F0(&v9);
  return v7;
}

double sub_100020D94@<D0>(uint64_t a1@<X8>)
{
  double *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v8;
  double v9;
  double v10;
  char v11;
  double result;
  __int128 v13;
  _OWORD v14[2];
  char v15;
  _QWORD v16[6];

  v3 = type metadata accessor for RoundedCornerStyle(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin();
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = v1[1];
  v10 = v1[2];
  Path.init()(v14, v5);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, enum case for RoundedCornerStyle.continuous(_:), v3);
  v16[0] = 0x3FF0000000000000;
  v16[1] = 0;
  v16[2] = 0;
  v16[3] = 0x3FF0000000000000;
  v16[4] = 0;
  v16[5] = 0;
  Path.addRoundedRect(in:cornerSize:style:transform:)(v7, v16, 0.0, v10 - v9, v8, v9, v8 * 0.5, v8 * 0.5);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  v11 = v15;
  result = *(double *)v14;
  v13 = v14[1];
  *(_OWORD *)a1 = v14[0];
  *(_OWORD *)(a1 + 16) = v13;
  *(_BYTE *)(a1 + 32) = v11;
  return result;
}

uint64_t sub_100020EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10002285C();
  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100020EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10002285C();
  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100020F40(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002285C();
  return Shape.body.getter(a1, v2);
}

uint64_t sub_100020F78@<X0>(uint64_t a1@<X8>)
{
  return sub_10001F444(a1);
}

uint64_t sub_100020FB0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 80));
  return swift_deallocObject(v0, 96, 7);
}

_QWORD *sub_100020FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1000200E4(a1, v2 + 16, *(_QWORD *)(v2 + 80), a2, *(double *)(v2 + 88));
}

uint64_t sub_10002100C()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t *sub_100021030(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = (void *)a1[2];
  v5 = a1[4];
  swift_bridgeObjectRetain(a1[5]);
  swift_retain(v2);
  swift_retain(v3);
  v6 = v4;
  swift_bridgeObjectRetain(v5);
  return a1;
}

unint64_t sub_10002108C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052050;
  if (!qword_100052050)
  {
    v1 = sub_1000036E4(&qword_100052038);
    sub_100003928(&qword_100052058, &qword_100052060, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    sub_100003928(&qword_100051508, &qword_1000514F0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052050);
  }
  return result;
}

void sub_100021128(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id i;
  void *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  void (*v55)(char *, uint64_t);
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int (*v68)(char *, uint64_t, uint64_t);
  void (*v69)(char *, char *, uint64_t);
  char *v70;
  uint64_t v71;
  void (*v72)(void);
  _QWORD *v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  void (*v84)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  _QWORD *v90;
  unsigned int v91;
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  v2 = v1;
  v4 = sub_1000033B8(&qword_1000513B8);
  v85 = *(_QWORD *)(v4 - 8);
  v86 = v4;
  __chkstk_darwin(v4);
  v89 = (uint64_t)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Calendar.Component(0);
  v95 = *(_QWORD *)(v6 - 8);
  v96 = v6;
  __chkstk_darwin(v6);
  v94 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v8);
  v10 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v82 - v12;
  __chkstk_darwin(v14);
  v93 = (char *)&v82 - v15;
  __chkstk_darwin(v16);
  v102 = (uint64_t)&v82 - v17;
  __chkstk_darwin(v18);
  v103 = (uint64_t)&v82 - v19;
  v20 = type metadata accessor for Date(0);
  v21 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v88 = (char *)&v82 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  v25 = (char *)&v82 - v24;
  __chkstk_darwin(v26);
  v97 = (char *)&v82 - v27;
  __chkstk_darwin(v28);
  v30 = (char *)&v82 - v29;
  v31 = type metadata accessor for Calendar(0);
  v83 = *(_QWORD *)(v31 - 8);
  __chkstk_darwin(v31);
  v33 = (char *)&v82 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = static Calendar.current.getter(v34);
  v99 = v30;
  v36 = Date.init()(v35);
  v87 = v13;
  v98 = v25;
  if (!a1)
    goto LABEL_18;
  if (!((unint64_t)a1 >> 62))
  {
    v37 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(a1);
    if (v37)
      goto LABEL_4;
LABEL_16:
    swift_bridgeObjectRelease(a1);
    goto LABEL_17;
  }
  if (a1 >= 0)
    v42 = a1 & 0xFFFFFFFFFFFFFF8;
  else
    v42 = a1;
  swift_bridgeObjectRetain(a1);
  if (!_CocoaArrayWrapper.endIndex.getter(v42))
    goto LABEL_16;
  swift_bridgeObjectRetain(a1);
  v37 = _CocoaArrayWrapper.endIndex.getter(v42);
  swift_bridgeObjectRelease(a1);
  if ((v37 & 0x8000000000000000) != 0)
    goto LABEL_42;
  if (!v37)
  {
    __break(1u);
    goto LABEL_16;
  }
LABEL_4:
  v36 = sub_100021C50(v37);
  if ((a1 & 0xC000000000000001) != 0)
    goto LABEL_39;
  if ((v36 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v36 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    for (i = *(id *)(a1 + 8 * v36 + 32); ; i = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v36, a1))
    {
      v39 = i;
      a1 = (uint64_t)objc_msgSend(i, "startDate", swift_bridgeObjectRelease(a1).n128_f64[0]);
      v40 = v97;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v41 = v99;
      (*(void (**)(char *, uint64_t))(v21 + 8))(v99, v20);
      v36 = (*(uint64_t (**)(char *, char *, uint64_t))(v21 + 32))(v41, v40, v20);
LABEL_17:
      v13 = v87;
      v25 = v98;
LABEL_18:
      v43 = *(_QWORD *)(v2 + 56);
      if (v43)
      {
        v44 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
        v2 = 24 / v43;
        v44(v103, 1, 1, v20);
        v84 = v44;
        v36 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v44)(v102, 1, 1, v20);
        if (v2)
        {
          v82 = v31;
          v100 = v2 - 1;
          v101 = v2;
          v90 = &_swiftEmptyArrayStorage;
          v91 = enum case for Calendar.Component.hour(_:);
          v45 = 1;
          v104 = v21;
          v92 = v20;
          while (1)
          {
            v47 = (v45 - 1) % v101;
            if (!v47)
            {
              v48 = v10;
              v49 = v94;
              v50 = v95;
              v51 = v96;
              (*(void (**)(char *, _QWORD, uint64_t))(v95 + 104))(v94, v91, v96);
              v52 = v97;
              Calendar.startOfDay(for:)(v99);
              v53 = v93;
              Calendar.date(byAdding:value:to:wrappingComponents:)(v49, v45 - 1, v52, 0);
              v54 = v52;
              v20 = v92;
              (*(void (**)(char *, uint64_t))(v104 + 8))(v54, v92);
              v55 = *(void (**)(char *, uint64_t))(v50 + 8);
              v10 = v48;
              v13 = v87;
              v56 = v49;
              v21 = v104;
              v55(v56, v51);
              v57 = v103;
              sub_1000034BC(v103, (uint64_t *)&unk_100051980);
              v58 = (uint64_t)v53;
              v25 = v98;
              sub_1000082A0(v58, v57, (uint64_t *)&unk_100051980);
            }
            if (v47 == v100)
            {
              v60 = v94;
              v59 = v95;
              v61 = v96;
              (*(void (**)(char *, _QWORD, uint64_t))(v95 + 104))(v94, v91, v96);
              v62 = v97;
              Calendar.startOfDay(for:)(v99);
              v63 = v93;
              Calendar.date(byAdding:value:to:wrappingComponents:)(v60, v45, v62, 0);
              v64 = v62;
              v20 = v92;
              (*(void (**)(char *, uint64_t))(v104 + 8))(v64, v92);
              v65 = v60;
              v21 = v104;
              (*(void (**)(char *, uint64_t))(v59 + 8))(v65, v61);
              v66 = v102;
              sub_1000034BC(v102, (uint64_t *)&unk_100051980);
              v67 = (uint64_t)v63;
              v25 = v98;
              sub_1000082A0(v67, v66, (uint64_t *)&unk_100051980);
            }
            sub_100003478(v103, (uint64_t)v13, (uint64_t *)&unk_100051980);
            v68 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
            if (v68(v13, 1, v20) == 1)
            {
              v46 = (uint64_t)v13;
            }
            else
            {
              v69 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
              v69(v25, v13, v20);
              sub_100003478(v102, (uint64_t)v10, (uint64_t *)&unk_100051980);
              if (v68(v10, 1, v20) != 1)
              {
                v70 = v88;
                v69(v88, v10, v20);
                v71 = v89 + *(int *)(v86 + 48);
                v72 = *(void (**)(void))(v21 + 16);
                v72();
                ((void (*)(uint64_t, char *, uint64_t))v72)(v71, v70, v20);
                v73 = v90;
                if ((swift_isUniquelyReferenced_nonNull_native(v90) & 1) == 0)
                  v73 = (_QWORD *)sub_100007A5C(0, v73[2] + 1, 1, v73);
                v75 = v73[2];
                v74 = v73[3];
                if (v75 >= v74 >> 1)
                  v73 = (_QWORD *)sub_100007A5C(v74 > 1, v75 + 1, 1, v73);
                v73[2] = v75 + 1;
                v76 = (*(unsigned __int8 *)(v85 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v85 + 80);
                v90 = v73;
                sub_1000082A0(v89, (uint64_t)v73 + v76 + *(_QWORD *)(v85 + 72) * v75, &qword_1000513B8);
                v77 = *(void (**)(char *, uint64_t))(v21 + 8);
                v77(v88, v20);
                v77(v25, v20);
                v78 = v102;
                sub_1000034BC(v102, (uint64_t *)&unk_100051980);
                v79 = v103;
                sub_1000034BC(v103, (uint64_t *)&unk_100051980);
                v80 = v79;
                v81 = v84;
                v84(v80, 1, 1, v20);
                v81(v78, 1, 1, v20);
                goto LABEL_23;
              }
              (*(void (**)(char *, uint64_t))(v21 + 8))(v25, v20);
              v46 = (uint64_t)v10;
            }
            sub_1000034BC(v46, (uint64_t *)&unk_100051980);
LABEL_23:
            if (++v45 == 25)
            {
              sub_1000034BC(v102, (uint64_t *)&unk_100051980);
              sub_1000034BC(v103, (uint64_t *)&unk_100051980);
              (*(void (**)(char *, uint64_t))(v21 + 8))(v99, v20);
              (*(void (**)(char *, uint64_t))(v83 + 8))(v33, v82);
              return;
            }
          }
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
LABEL_39:
      ;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
}

void sub_1000218EC(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  id v12;
  NSString v13;
  NSString v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  double v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  __int128 v52;
  uint64_t v53;

  v46 = a5;
  v50 = a4;
  v49 = sub_1000033B8(&qword_1000513B8);
  v8 = *(_QWORD *)(v49 - 8);
  __chkstk_darwin(v49);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v12 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v13 = String._bridgeToObjectiveC()();
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v12, "localizedStringForKey:value:table:", v13, 0, v14);

  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v18 = v17;

  v19 = sub_1000033B8(&qword_100051368);
  v20 = swift_allocObject(v19, 192, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100040760;
  v52 = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(v20 + 56) = &type metadata for String;
  v51 = sub_10000825C();
  *(_QWORD *)(v20 + 64) = v51;
  *(_OWORD *)(v20 + 32) = *(_OWORD *)(a2 + 24);
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v11 >= *(_QWORD *)(a3 + 16))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v44 = v16;
  v45 = v18;
  v21 = a3
      + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
      + *(_QWORD *)(v8 + 72) * v11;
  v48 = v11;
  sub_100003478(v21, (uint64_t)v10, &qword_1000513B8);
  v22 = v49;
  v23 = &v10[*(int *)(v49 + 48)];
  sub_100007728((uint64_t)&v52);
  v47 = sub_100021DF4();
  v25 = v24;
  v26 = type metadata accessor for Date(0);
  v27 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v26 - 8) + 8);
  v27(v23, v26);
  v27(v10, v26);
  v28 = v51;
  *(_QWORD *)(v20 + 96) = &type metadata for String;
  *(_QWORD *)(v20 + 104) = v28;
  *(_QWORD *)(v20 + 72) = v47;
  *(_QWORD *)(v20 + 80) = v25;
  sub_100003478(v21, (uint64_t)v10, &qword_1000513B8);
  v29 = &v10[*(int *)(v22 + 48)];
  v30 = sub_100021DF4();
  v32 = v31;
  v27(v29, v26);
  v27(v10, v26);
  v33 = v48;
  *(_QWORD *)(v20 + 136) = &type metadata for String;
  *(_QWORD *)(v20 + 144) = v28;
  *(_QWORD *)(v20 + 112) = v30;
  *(_QWORD *)(v20 + 120) = v32;
  if (v33 >= *(_QWORD *)(*(_QWORD *)v50 + 16))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v34 = *(double *)(*(_QWORD *)v50 + 8 * v33 + 32);
  if ((~*(_QWORD *)&v34 & 0x7FF0000000000000) == 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v34 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v34 < 9.22337204e18)
  {
    v53 = (uint64_t)v34;
    v35 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v36 = v51;
    *(_QWORD *)(v20 + 176) = &type metadata for String;
    *(_QWORD *)(v20 + 184) = v36;
    *(_QWORD *)(v20 + 152) = v35;
    *(_QWORD *)(v20 + 160) = v37;
    v38 = v45;
    v39 = static String.localizedStringWithFormat(_:_:)(v44, v45, v20);
    v41 = v40;
    swift_bridgeObjectRelease(v38);
    swift_bridgeObjectRelease(v20);
    v42 = v46;
    *v46 = v39;
    v42[1] = v41;
    return;
  }
LABEL_13:
  __break(1u);
}

unint64_t sub_100021C50(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    swift_stdlib_random(&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          swift_stdlib_random(&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_100021CD8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_100021CF4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_100021CF4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

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
    v10 = sub_1000033B8(&qword_100052068);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_release(a4);
  return v11;
}

uint64_t sub_100021DF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSString v10;
  Class isa;
  id v12;
  uint64_t v13;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v0 = type metadata accessor for Locale(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
  v5 = static Locale.current.getter();
  v6 = Locale.languageCode.getter(v5);
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v8)
  {
    v17 = v6;
    v18 = v8;
    v15 = 26746;
    v16 = 0xE200000000000000;
    v9 = sub_100008E40();
    if ((StringProtocol.contains<A>(_:)(&v15, &type metadata for String, &type metadata for String, v9, v9) & 1) != 0)
    {
      swift_bridgeObjectRelease(v8);
    }
    else
    {
      v17 = v6;
      v18 = v8;
      v15 = 24938;
      v16 = 0xE200000000000000;
      StringProtocol.contains<A>(_:)(&v15, &type metadata for String, &type metadata for String, v9, v9);
      swift_bridgeObjectRelease(v8);
    }
  }
  v10 = String._bridgeToObjectiveC()();
  objc_msgSend(v4, "setLocalizedDateFormatFromTemplate:", v10);

  isa = Date._bridgeToObjectiveC()().super.isa;
  v12 = objc_msgSend(v4, "stringFromDate:", isa);

  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  return v13;
}

void sub_100021FB0(int64_t a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  int64_t v18;
  unint64_t v22;
  uint64_t v23[2];
  _QWORD *v24;

  v6 = a2 - a1;
  if (__OFSUB__(a2, a1))
    goto LABEL_21;
  v7 = v5;
  if (v6)
  {
    v24 = &_swiftEmptyArrayStorage;
    sub_100021CD8(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0)
    {
LABEL_22:
      __break(1u);
      return;
    }
    v10 = v24;
    if (a2 <= a1)
      v11 = a1;
    else
      v11 = a2;
    v18 = v11;
    v12 = a1;
    while (a2 != v12)
    {
      v22 = v12;
      sub_1000218EC(&v22, a3, a4, a5, v23);
      if (v7)
      {
        swift_release(v10);
        return;
      }
      v7 = 0;
      v13 = v23[0];
      v14 = v23[1];
      v24 = v10;
      v16 = v10[2];
      v15 = v10[3];
      if (v16 >= v15 >> 1)
      {
        sub_100021CD8((char *)(v15 > 1), v16 + 1, 1);
        v10 = v24;
      }
      v10[2] = v16 + 1;
      v17 = &v10[2 * v16];
      v17[4] = v13;
      v17[5] = v14;
      if (a2 < a1)
        goto LABEL_19;
      if (v18 == v12)
        goto LABEL_20;
      if (a2 == ++v12)
        return;
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
}

uint64_t *sub_100022104(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = *a1;
  v3 = a1[1];
  v4 = (void *)a1[2];
  v5 = a1[5];
  swift_bridgeObjectRelease(a1[4]);

  swift_release(v3);
  swift_release(v2);
  swift_bridgeObjectRelease(v5);
  return a1;
}

uint64_t sub_100022164()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for GeometryProxy(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 80) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6));
  return swift_deallocObject(v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

void sub_10002221C(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = type metadata accessor for GeometryProxy(0);
  v6 = (*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64)
      + ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_100020428(a1, (_QWORD *)(v2 + 16), *(_QWORD *)(v2 + v6), a2, *(double *)(v2 + ((v6 + 15) & 0xFFFFFFFFFFFFF8)));
}

unint64_t sub_10002228C()
{
  unint64_t result;

  result = qword_100052098;
  if (!qword_100052098)
  {
    result = swift_getWitnessTable(&unk_10003FBE8, &type metadata for ChartSeparator);
    atomic_store(result, (unint64_t *)&qword_100052098);
  }
  return result;
}

unint64_t sub_1000222D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000520A8;
  if (!qword_1000520A8)
  {
    v1 = sub_1000036E4(&qword_1000520A0);
    sub_10002228C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000520A8);
  }
  return result;
}

_QWORD *sub_10002233C(_QWORD *a1)
{
  swift_bridgeObjectRetain(*a1);
  return a1;
}

_QWORD *sub_100022364(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

void destroy for QuantityChart.BarView(uint64_t a1)
{
  swift_release(*(_QWORD *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 32));

}

uint64_t initializeWithCopy for QuantityChart.BarView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  swift_retain(v3);
  swift_retain(v4);
  v6 = v5;
  return a1;
}

_QWORD *assignWithCopy for QuantityChart.BarView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v4 = a2[3];
  v5 = a1[3];
  a1[3] = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[4];
  v7 = a1[4];
  a1[4] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = (void *)a2[5];
  v9 = (void *)a1[5];
  a1[5] = v8;
  v10 = v8;

  return a1;
}

uint64_t assignWithTake for QuantityChart.BarView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release(*(_QWORD *)(a1 + 24));
  v4 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release(v4);
  v5 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for QuantityChart.BarView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for QuantityChart.BarView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for QuantityChart.BarView()
{
  return &type metadata for QuantityChart.BarView;
}

unint64_t sub_100022598()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  unint64_t v5;

  result = qword_1000520B8;
  if (!qword_1000520B8)
  {
    v1 = sub_1000036E4(&qword_1000520C0);
    v2 = sub_1000036E4(&qword_100052040);
    v4 = sub_1000036E4(&qword_100052038);
    v5 = sub_10002108C();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.drawingGroup(opaque:colorMode:)>>, 1);
    v4 = v2;
    v5 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    sub_10002265C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000520B8);
  }
  return result;
}

unint64_t sub_10002265C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100051628;
  if (!qword_100051628)
  {
    v1 = type metadata accessor for AccessibilityAttachmentModifier(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for AccessibilityAttachmentModifier, v1);
    atomic_store(result, (unint64_t *)&qword_100051628);
  }
  return result;
}

uint64_t sub_1000226A4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100042090, 1);
}

uint64_t sub_1000226B4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));

  return swift_deallocObject(v0, 64, 7);
}

_QWORD *sub_1000226E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100020B60(v1 + 16, a1);
}

_QWORD *sub_1000226F0(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

uint64_t getEnumTagSinglePayload for QuantityChart.Bar(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for QuantityChart.Bar(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for QuantityChart.Bar()
{
  return &type metadata for QuantityChart.Bar;
}

uint64_t sub_100022774()
{
  return sub_100003928(&qword_1000520C8, &qword_1000520D0, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t sub_1000227A0()
{
  return sub_100003928(&qword_1000520D8, &qword_1000520E0, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
}

unint64_t sub_1000227D0()
{
  unint64_t result;

  result = qword_1000520E8;
  if (!qword_1000520E8)
  {
    result = swift_getWitnessTable(&unk_1000408BC, &type metadata for QuantityChart.Bar);
    atomic_store(result, (unint64_t *)&qword_1000520E8);
  }
  return result;
}

unint64_t sub_100022818()
{
  unint64_t result;

  result = qword_1000520F0;
  if (!qword_1000520F0)
  {
    result = swift_getWitnessTable(&unk_10004086C, &type metadata for QuantityChart.Bar);
    atomic_store(result, (unint64_t *)&qword_1000520F0);
  }
  return result;
}

unint64_t sub_10002285C()
{
  unint64_t result;

  result = qword_1000520F8;
  if (!qword_1000520F8)
  {
    result = swift_getWitnessTable(&unk_10004090C, &type metadata for QuantityChart.Bar);
    atomic_store(result, (unint64_t *)&qword_1000520F8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WidgetFeatureFlags(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WidgetFeatureFlags(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100022938 + 4 * byte_100040960[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100022958 + 4 * byte_100040965[v4]))();
}

_BYTE *sub_100022938(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100022958(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100022960(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100022968(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100022970(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100022978(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for WidgetFeatureFlags()
{
  return &type metadata for WidgetFeatureFlags;
}

unint64_t sub_100022998()
{
  unint64_t result;

  result = qword_100052100;
  if (!qword_100052100)
  {
    result = swift_getWitnessTable(&unk_1000409D4, &type metadata for WidgetFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_100052100);
  }
  return result;
}

uint64_t sub_1000229DC()
{
  return 1;
}

Swift::Int sub_1000229E4()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_100022A24()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_100022A48(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

const char *sub_100022A84()
{
  return "Fitness";
}

const char *sub_100022A98()
{
  return "ForceAccessibilityLayout";
}

void sub_100022AAC(void *a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, _QWORD *a5@<X8>, __n128 a6@<Q0>)
{
  uint64_t v11;
  int *v12;
  int *v13;
  uint64_t v14;
  int *v15;
  char v16;
  char v17;
  double v18;
  uint64_t v19;
  uint64_t v20;

  *a5 = swift_getKeyPath(&unk_100040AA8, a6);
  v11 = sub_1000033B8(&qword_100051D88);
  swift_storeEnumTagMultiPayload(a5, v11, 0);
  v12 = (int *)type metadata accessor for StandalonePhoneRingView(0);
  v13 = v12;
  v14 = v12[9];
  *((_BYTE *)a5 + v12[6]) = a3;
  *(_QWORD *)((char *)a5 + v14) = a4;
  if (a1)
  {
    *((_BYTE *)a5 + v12[7]) = 0;
    v15 = v12 + 8;
    if ((a2 & 1) != 0)
    {

      *(_QWORD *)((char *)a5 + v13[5]) = 0x3FF0000000000000;
      v16 = 4;
    }
    else
    {
      swift_retain(a4);
      if (objc_msgSend(a1, "activityMoveMode") == (id)2)
        objc_msgSend(a1, "_moveMinutesCompletionPercentage");
      else
        objc_msgSend(a1, "_activeEnergyCompletionPercentage");
      v20 = v19;

      swift_release(a4);
      *(_QWORD *)((char *)a5 + v13[5]) = v20;
      v16 = 3;
    }
  }
  else
  {
    if ((a2 & 1) != 0)
      v17 = 4;
    else
      v17 = 3;
    v18 = 0.0;
    *((_BYTE *)a5 + v12[8]) = v17;
    if ((a2 & 1) != 0)
      v18 = 1.0;
    *(double *)((char *)a5 + v12[5]) = v18;
    v15 = v12 + 7;
    v16 = 1;
  }
  *((_BYTE *)a5 + *v15) = v16;
}

uint64_t sub_100022BF8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;
  _OWORD v20[3];

  v4 = sub_1000033B8(&qword_100052200);
  __chkstk_darwin(v4);
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = GeometryProxy.size.getter(v7);
  GeometryProxy.size.getter(v9);
  if (v10 < v8)
    v8 = v10;
  v11 = (v8 + -29.0) / 114.0;
  v12 = v11 * -0.0288461538 + 0.0432692308;
  if (v11 >= 1.0)
    v12 = 0.0144230769;
  if (v11 > 0.0)
    v13 = v12;
  else
    v13 = 0.0432692308;
  v14 = sub_100022D64(a1, (uint64_t)v6, v8 * 0.105769231, v8, v8 * 0.105769231 + v8 * v13);
  v15 = static Alignment.center.getter(v14);
  _FrameLayout.init(width:height:alignment:)(v20, *(_QWORD *)&v8, 0, *(_QWORD *)&v8, 0, v15, v16);
  sub_100003478((uint64_t)v6, a2, &qword_100052200);
  v17 = (_OWORD *)(a2 + *(int *)(sub_1000033B8(&qword_100052208) + 36));
  v18 = v20[1];
  *v17 = v20[0];
  v17[1] = v18;
  v17[2] = v20[2];
  return sub_1000034BC((uint64_t)v6, &qword_100052200);
}

uint64_t sub_100022D64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>)
{
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
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  char v34;
  char v35;
  double v36;
  int v37;
  __n128 v38;
  uint64_t v39;
  uint64_t v40;
  __n128 v41;
  char v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  _QWORD *v46;
  char v47;
  __n128 v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __n128 v58;
  uint64_t v59;
  double v60;
  char v61;
  double v62;
  _QWORD *v63;
  char v64;
  __n128 v65;
  double v66;
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
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD v96[2];

  v90 = a2;
  v87 = sub_1000033B8(&qword_100052210);
  __chkstk_darwin(v87);
  v92 = (uint64_t)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v91 = (uint64_t)&v84 - v11;
  __chkstk_darwin(v12);
  v86 = (uint64_t)&v84 - v13;
  __chkstk_darwin(v14);
  v89 = (uint64_t)&v84 - v15;
  __chkstk_darwin(v16);
  v85 = (uint64_t)&v84 - v17;
  __chkstk_darwin(v18);
  v95 = (uint64_t)&v84 - v19;
  v20 = (int *)type metadata accessor for ActivityRing(0);
  __chkstk_darwin(v20);
  v88 = (uint64_t)&v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v24 = (uint64_t *)((char *)&v84 - v23);
  __chkstk_darwin(v25);
  v27 = (uint64_t *)((char *)&v84 - v26);
  __chkstk_darwin(v28);
  v30 = (uint64_t *)((char *)&v84 - v29);
  __chkstk_darwin(v31);
  v94 = (uint64_t)&v84 - v32;
  v33 = 1.0;
  v34 = *(_BYTE *)(a1 + 25);
  if ((v34 & 1) != 0)
  {
    v35 = 4;
    v36 = 1.0;
  }
  else
  {
    v35 = 0;
    v36 = *(double *)a1;
  }
  v37 = *(unsigned __int8 *)(a1 + 24);
  sub_1000082A0(a1 + 32, (uint64_t)v96, &qword_1000521F8);
  *v30 = swift_getKeyPath(&unk_100040AA8, v38);
  v39 = sub_1000033B8(&qword_100051D88);
  swift_storeEnumTagMultiPayload(v30, v39, 0);
  *((_BYTE *)v30 + v20[5]) = v35;
  *(double *)((char *)v30 + v20[6]) = v36;
  *(double *)((char *)v30 + v20[7]) = a3;
  *(double *)((char *)v30 + v20[8]) = a4;
  v40 = v20[9];
  v93 = v37;
  *((_BYTE *)v30 + v40) = v37;
  sub_1000082A0((uint64_t)v96, (uint64_t)v30 + v20[10], &qword_1000521F8);
  sub_10001792C((uint64_t)v30, v94, type metadata accessor for ActivityRing);
  v42 = v34;
  v43 = a1;
  if ((v34 & 1) != 0)
  {
    v44 = 4;
  }
  else
  {
    v33 = *(double *)(a1 + 8);
    v44 = 1;
  }
  v45 = v87;
  *v27 = swift_getKeyPath(&unk_100040AA8, v41);
  swift_storeEnumTagMultiPayload(v27, v39, 0);
  *((_BYTE *)v27 + v20[5]) = v44;
  *(double *)((char *)v27 + v20[6]) = v33;
  *(double *)((char *)v27 + v20[7]) = a3;
  *(double *)((char *)v27 + v20[8]) = a4 - a5;
  *((_BYTE *)v27 + v20[9]) = v93;
  sub_1000082A0((uint64_t)v96, (uint64_t)v27 + v20[10], &qword_1000521F8);
  sub_1000226F0(v96);
  v46 = sub_1000226F0(v96);
  v47 = static Edge.Set.all.getter(v46);
  v48.n128_f64[0] = a5;
  v49 = EdgeInsets.init(_all:)(v48);
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v56 = v85;
  sub_100017970((uint64_t)v27, v85, type metadata accessor for ActivityRing);
  v57 = v56 + *(int *)(v45 + 36);
  *(_BYTE *)v57 = v47;
  *(double *)(v57 + 8) = v49;
  *(_QWORD *)(v57 + 16) = v51;
  *(_QWORD *)(v57 + 24) = v53;
  *(_QWORD *)(v57 + 32) = v55;
  *(_BYTE *)(v57 + 40) = 0;
  sub_1000179B4((uint64_t)v27, type metadata accessor for ActivityRing);
  sub_1000082A0(v56, v95, &qword_100052210);
  v59 = v45;
  if ((v42 & 1) != 0)
  {
    v61 = 4;
    v60 = 1.0;
  }
  else
  {
    v60 = *(double *)(v43 + 16);
    v61 = 2;
  }
  v62 = a5 + a5;
  *v24 = swift_getKeyPath(&unk_100040AA8, v58);
  swift_storeEnumTagMultiPayload(v24, v39, 0);
  *((_BYTE *)v24 + v20[5]) = v61;
  *(double *)((char *)v24 + v20[6]) = v60;
  *(double *)((char *)v24 + v20[7]) = a3;
  *(double *)((char *)v24 + v20[8]) = a4 - v62;
  *((_BYTE *)v24 + v20[9]) = v93;
  sub_1000082A0((uint64_t)v96, (uint64_t)v24 + v20[10], &qword_1000521F8);
  v63 = sub_1000226F0(v96);
  v64 = static Edge.Set.all.getter(v63);
  v65.n128_f64[0] = v62;
  v66 = EdgeInsets.init(_all:)(v65);
  v68 = v67;
  v70 = v69;
  v72 = v71;
  v73 = v86;
  sub_100017970((uint64_t)v24, v86, type metadata accessor for ActivityRing);
  v74 = v73 + *(int *)(v59 + 36);
  *(_BYTE *)v74 = v64;
  *(double *)(v74 + 8) = v66;
  *(_QWORD *)(v74 + 16) = v68;
  *(_QWORD *)(v74 + 24) = v70;
  *(_QWORD *)(v74 + 32) = v72;
  *(_BYTE *)(v74 + 40) = 0;
  sub_1000179B4((uint64_t)v24, type metadata accessor for ActivityRing);
  v75 = v89;
  sub_1000082A0(v73, v89, &qword_100052210);
  v76 = v94;
  v77 = v88;
  sub_100017970(v94, v88, type metadata accessor for ActivityRing);
  v78 = v95;
  v79 = v91;
  sub_100003478(v95, v91, &qword_100052210);
  v80 = v92;
  sub_100003478(v75, v92, &qword_100052210);
  v81 = v90;
  sub_100017970(v77, v90, type metadata accessor for ActivityRing);
  v82 = sub_1000033B8(&qword_100052218);
  sub_100003478(v79, v81 + *(int *)(v82 + 48), &qword_100052210);
  sub_100003478(v80, v81 + *(int *)(v82 + 64), &qword_100052210);
  sub_1000034BC(v75, &qword_100052210);
  sub_1000034BC(v78, &qword_100052210);
  sub_1000179B4(v76, type metadata accessor for ActivityRing);
  sub_1000034BC(v80, &qword_100052210);
  sub_1000034BC(v79, &qword_100052210);
  return sub_1000179B4(v77, type metadata accessor for ActivityRing);
}

_QWORD *sub_100023320@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(v1 + 32);
  v3 = swift_allocObject(&unk_10004F2F8, 56, 7);
  v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(v1 + 32);
  *a1 = sub_100025F48;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v3;
  sub_1000082A0((uint64_t)&v6, (uint64_t)&v7, &qword_1000521F8);
  return sub_1000226F0(&v7);
}

uint64_t sub_1000233B0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  __n128 v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;
  _OWORD v20[3];

  v4 = sub_1000033B8(&qword_1000521A8);
  __chkstk_darwin(v4);
  v6 = (_QWORD *)((char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = GeometryProxy.size.getter(v7);
  v10.n128_f64[0] = GeometryProxy.size.getter(v9);
  if (v11 < v8)
    v8 = v11;
  *v6 = static Alignment.top.getter(v10);
  v6[1] = v12;
  v13 = sub_1000033B8(&qword_1000521B0);
  v14 = sub_1000234D4(a1, (uint64_t)v6 + *(int *)(v13 + 44), v8);
  v15 = static Alignment.center.getter(v14);
  _FrameLayout.init(width:height:alignment:)(v20, *(_QWORD *)&v8, 0, *(_QWORD *)&v8, 0, v15, v16);
  sub_100003478((uint64_t)v6, a2, &qword_1000521A8);
  v17 = (_OWORD *)(a2 + *(int *)(sub_1000033B8(&qword_1000521B8) + 36));
  v18 = v20[1];
  *v17 = v20[0];
  v17[1] = v18;
  v17[2] = v20[2];
  return sub_1000034BC((uint64_t)v6, &qword_1000521A8);
}

uint64_t sub_1000234D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v5;
  __n128 v6;
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
  int *v17;
  uint64_t v18;
  _QWORD *v19;
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
  double v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  __n128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  __int128 v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __n128 v56;
  uint64_t KeyPath;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _OWORD *v67;
  __int128 v68;
  uint64_t v69;
  char v70;
  __n128 v71;
  double v72;
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
  uint64_t v85;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _OWORD v108[3];
  _OWORD v109[3];

  v106 = a2;
  v5 = type metadata accessor for _BlendModeEffect(0);
  v6 = __chkstk_darwin(v5);
  v96 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = type metadata accessor for BlendMode(0, v6);
  v94 = *(_QWORD *)(v95 - 8);
  __chkstk_darwin(v95);
  v92 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = type metadata accessor for Image.ResizingMode(0);
  v89 = *(_QWORD *)(v90 - 8);
  __chkstk_darwin(v90);
  v88 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = sub_1000033B8(&qword_1000521C0);
  __chkstk_darwin(v91);
  v97 = (char *)&v87 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = sub_1000033B8(&qword_1000521C8);
  __chkstk_darwin(v93);
  v99 = (uint64_t)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = sub_1000033B8(&qword_1000521D0);
  v104 = *(_QWORD *)(v107 - 8);
  __chkstk_darwin(v107);
  v98 = (uint64_t)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000033B8(&qword_1000521D8);
  __chkstk_darwin(v13);
  v105 = (uint64_t)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v101 = (char *)&v87 - v16;
  v17 = (int *)type metadata accessor for ActivityRing(0);
  __chkstk_darwin(v17);
  v19 = (uint64_t *)((char *)&v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = sub_1000033B8(&qword_1000521E0);
  __chkstk_darwin(v20);
  v22 = (char *)&v87 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = (char *)sub_1000033B8(&qword_1000521E8);
  __chkstk_darwin(v102);
  v103 = (uint64_t)&v87 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v26 = (char *)&v87 - v25;
  __chkstk_darwin(v27);
  v29 = (char *)&v87 - v28;
  v30 = a3 * 0.2;
  v31 = (int *)type metadata accessor for StandalonePhoneRingView(0);
  v33 = v31[7];
  v32 = v31[8];
  v100 = a1;
  v34 = *(unsigned __int8 *)(a1 + v32);
  v35 = *(_QWORD *)(a1 + v31[5]);
  v36 = *(_BYTE *)(a1 + v33);
  v37 = *(_QWORD *)(a1 + v31[9]);
  *v19 = swift_getKeyPath(&unk_100040AA8, v38);
  v39 = sub_1000033B8(&qword_100051D88);
  swift_storeEnumTagMultiPayload(v19, v39, 0);
  *((_BYTE *)v19 + v17[5]) = v34;
  *(_QWORD *)((char *)v19 + v17[6]) = v35;
  *(double *)((char *)v19 + v17[7]) = a3 * 0.2;
  *(double *)((char *)v19 + v17[8]) = a3;
  *((_BYTE *)v19 + v17[9]) = v36;
  *(_QWORD *)((char *)v19 + v17[10]) = v37;
  v40 = swift_retain(v37);
  v41 = static Alignment.center.getter(v40);
  _FrameLayout.init(width:height:alignment:)(v108, *(_QWORD *)&a3, 0, *(_QWORD *)&a3, 0, v41, v42);
  sub_100017970((uint64_t)v19, (uint64_t)v22, type metadata accessor for ActivityRing);
  v43 = &v22[*(int *)(v20 + 36)];
  v44 = v108[1];
  *(_OWORD *)v43 = v108[0];
  *((_OWORD *)v43 + 1) = v44;
  *((_OWORD *)v43 + 2) = v108[2];
  sub_1000179B4((uint64_t)v19, type metadata accessor for ActivityRing);
  if (v34 == 4)
    v45 = 0.36;
  else
    v45 = 1.0;
  sub_100003478((uint64_t)v22, (uint64_t)v26, &qword_1000521E0);
  *(double *)&v26[*((int *)v102 + 9)] = v45;
  v46 = (uint64_t)v22;
  v47 = (uint64_t)v101;
  sub_1000034BC(v46, &qword_1000521E0);
  v102 = v29;
  sub_1000082A0((uint64_t)v26, (uint64_t)v29, &qword_1000521E8);
  v48 = 1;
  if (*(_BYTE *)(v100 + v31[6]) == 1)
  {
    v49 = Image.init(_internalSystemName:)(0x7974697669746361, 0xED000065766F6D2ELL);
    v50 = v89;
    v51 = v88;
    v52 = v90;
    (*(void (**)(char *, _QWORD, uint64_t))(v89 + 104))(v88, enum case for Image.ResizingMode.stretch(_:), v90);
    v53 = Image.resizable(capInsets:resizingMode:)(v51, v49, 0.0, 0.0, 0.0, 0.0);
    swift_release(v49);
    v54 = (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v51, v52);
    v55 = static Color.black.getter(v54);
    KeyPath = swift_getKeyPath(&unk_100040C08, v56);
    v58 = v94;
    v59 = v92;
    v60 = v95;
    (*(void (**)(char *, _QWORD, uint64_t))(v94 + 104))(v92, enum case for BlendMode.destinationOut(_:), v95);
    v61 = (uint64_t)v96;
    (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v96, v59, v60);
    v62 = (uint64_t)v97;
    sub_100017970(v61, (uint64_t)&v97[*(int *)(v91 + 36)], (uint64_t (*)(_QWORD))&type metadata accessor for _BlendModeEffect);
    *(_QWORD *)v62 = v53;
    *(_QWORD *)(v62 + 8) = 0;
    *(_WORD *)(v62 + 16) = 1;
    *(_QWORD *)(v62 + 24) = KeyPath;
    *(_QWORD *)(v62 + 32) = v55;
    swift_retain(v53);
    swift_retain(KeyPath);
    swift_retain(v55);
    sub_1000179B4(v61, (uint64_t (*)(_QWORD))&type metadata accessor for _BlendModeEffect);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v60);
    swift_release(v55);
    swift_release(KeyPath);
    v63 = swift_release(v53);
    v64 = static Alignment.center.getter(v63);
    ((void (*)(_QWORD *__return_ptr, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))_FrameLayout.init(width:height:alignment:))(v109, 0, 1, v30 * 0.583333333, 0, v64, v65);
    v66 = v99;
    sub_100003478(v62, v99, &qword_1000521C0);
    v67 = (_OWORD *)(v66 + *(int *)(v93 + 36));
    v68 = v109[1];
    *v67 = v109[0];
    v67[1] = v68;
    v67[2] = v109[2];
    v69 = sub_1000034BC(v62, &qword_1000521C0);
    v70 = static Edge.Set.top.getter(v69);
    v71.n128_f64[0] = v30 * 0.208333333;
    v72 = EdgeInsets.init(_all:)(v71);
    v74 = v73;
    v76 = v75;
    v78 = v77;
    v79 = v98;
    sub_100003478(v66, v98, &qword_1000521C8);
    v80 = v79 + *(int *)(v107 + 36);
    *(_BYTE *)v80 = v70;
    *(double *)(v80 + 8) = v72;
    *(_QWORD *)(v80 + 16) = v74;
    *(_QWORD *)(v80 + 24) = v76;
    *(_QWORD *)(v80 + 32) = v78;
    *(_BYTE *)(v80 + 40) = 0;
    sub_1000034BC(v66, &qword_1000521C8);
    sub_1000082A0(v79, v47, &qword_1000521D0);
    v48 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56))(v47, v48, 1, v107);
  v81 = (uint64_t)v102;
  v82 = v103;
  sub_100003478((uint64_t)v102, v103, &qword_1000521E8);
  v83 = v105;
  sub_100003478(v47, v105, &qword_1000521D8);
  v84 = v106;
  sub_100003478(v82, v106, &qword_1000521E8);
  v85 = sub_1000033B8(&qword_1000521F0);
  sub_100003478(v83, v84 + *(int *)(v85 + 48), &qword_1000521D8);
  sub_1000034BC(v47, &qword_1000521D8);
  sub_1000034BC(v81, &qword_1000521E8);
  sub_1000034BC(v83, &qword_1000521D8);
  return sub_1000034BC(v82, &qword_1000521E8);
}

uint64_t sub_100023D0C@<X0>(uint64_t a1@<X0>, uint64_t (**a2)(uint64_t a1)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(a1);
  sub_100017970(v2, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for StandalonePhoneRingView);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_10004F2D0, v7 + v5, v6 | 7);
  result = sub_10001792C((uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, type metadata accessor for StandalonePhoneRingView);
  *a2 = sub_100025E78;
  a2[1] = (uint64_t (*)(uint64_t))v8;
  return result;
}

void sub_100023DC8(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
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
  unint64_t v15;
  char v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __n128 v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[5];

  v2 = v1;
  v4 = (int *)type metadata accessor for ActivityRing(0);
  v42 = *((_QWORD *)v4 - 1);
  v5 = *(_QWORD *)(v42 + 64);
  __chkstk_darwin(v4);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for WidgetRenderingMode(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v40 - v12;
  v14 = sub_1000171D8((uint64_t)&v40 - v12);
  static WidgetRenderingMode.fullColor.getter(v14);
  v15 = sub_10002684C();
  v16 = dispatch thunk of static Equatable.== infix(_:_:)(v13, v10, v7, v15);
  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v10, v7);
  v17(v13, v7);
  if ((v16 & 1) != 0 || (v18 = v4[10], (v19 = *(_QWORD *)(v2 + v18)) == 0))
  {
    sub_10002489C();
    v21 = v20;
    v19 = Color.opacity(_:)(0.2);
    swift_release(v21);
  }
  else
  {
    swift_retain(*(_QWORD *)(v2 + v18));
  }
  v22 = StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(v43, 0, 0, &_swiftEmptyArrayStorage, *(double *)(v2 + v4[7]), 10.0, 0.0);
  v23 = *(double *)v43;
  v24 = v43[1];
  v25 = v43[2];
  v26 = v43[3];
  v27 = v43[4];
  v28 = static Alignment.center.getter(v22);
  v30 = v29;
  if ((*(_BYTE *)(v2 + v4[9]) & 1) != 0)
  {
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0.0;
  }
  else
  {
    v41 = v28;
    sub_100017970(v2, (uint64_t)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityRing);
    v35 = *(unsigned __int8 *)(v42 + 80);
    v36 = (v35 + 16) & ~v35;
    v32 = swift_allocObject(&unk_10004F3B0, v36 + v5, v35 | 7);
    v37 = sub_10001792C((uint64_t)v6, v32 + v36, type metadata accessor for ActivityRing);
    v39 = *(double *)(v2 + v4[6]);
    if (v39 <= 1.0)
      v38.n128_u64[0] = qword_100040E68[*(char *)(v2 + v4[5])];
    else
      v38.n128_f64[0] = ((v39 + -1.0) * 0.6 + 1.0) * 1.1;
    v33 = static Animation.timingCurve(_:_:_:_:duration:)(v37, 0.333, 0.0, 0.0, 1.0, v38);
    v34 = v39;
    v31 = sub_100026948;
    v28 = v41;
  }
  *(double *)a1 = v23 * 0.5;
  *(double *)(a1 + 8) = v23;
  *(_QWORD *)(a1 + 16) = v24;
  *(_QWORD *)(a1 + 24) = v25;
  *(_QWORD *)(a1 + 32) = v26;
  *(_QWORD *)(a1 + 40) = v27;
  *(_QWORD *)(a1 + 48) = v19;
  *(_WORD *)(a1 + 56) = 256;
  *(_QWORD *)(a1 + 64) = v28;
  *(_QWORD *)(a1 + 72) = v30;
  *(_QWORD *)(a1 + 80) = v31;
  *(_QWORD *)(a1 + 88) = v32;
  *(_QWORD *)(a1 + 96) = v33;
  *(double *)(a1 + 104) = v34;
  swift_bridgeObjectRetain(v26);
  swift_retain(v19);
  sub_1000269B8((uint64_t)v31, v32, v33);
  sub_1000269E8((uint64_t)v31, v32, v33);
  swift_release(v19);
  swift_bridgeObjectRelease(v26);
}

void sub_1000240F4(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int *v26;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char v64;
  double v65;
  char *v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  v95 = type metadata accessor for Color.RGBColorSpace(0);
  v93 = *(_QWORD *)(v95 - 8);
  __chkstk_darwin(v95);
  v94 = (char *)&v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for _BlendModeEffect(0);
  v6 = __chkstk_darwin(v5);
  v89 = (char *)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = type metadata accessor for BlendMode(0, v6);
  v87 = *(_QWORD *)(v88 - 8);
  __chkstk_darwin(v88);
  v86 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = sub_1000033B8(&qword_1000522F8);
  v90 = *(_QWORD *)(v91 - 8);
  __chkstk_darwin(v91);
  v85 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for WidgetRenderingMode(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v16 = (char *)&v76 - v15;
  v17 = sub_1000033B8(&qword_100052300);
  __chkstk_darwin(v17);
  v92 = (uint64_t)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v99 = (uint64_t)&v76 - v20;
  v21 = sub_1000033B8(&qword_100052308);
  __chkstk_darwin(v21);
  v98 = (uint64_t)&v76 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  v25 = (char *)&v76 - v24;
  v26 = (int *)type metadata accessor for ActivityRing(0);
  v27 = v26[6];
  v96 = v26[7];
  v97 = v27;
  v28 = *(_QWORD *)(a1 + v27);
  v29 = *(_QWORD *)(a1 + v96);
  v30 = sub_1000033B8(&qword_100051630);
  v31 = swift_allocObject(v30, 48, 7);
  *(_OWORD *)(v31 + 16) = xmmword_10003FCD0;
  sub_10002489C();
  *(_QWORD *)(v31 + 32) = v32;
  sub_10002489C();
  *(_QWORD *)(v31 + 40) = v33;
  v100 = v31;
  specialized Array._endMutation()(v33);
  v34 = Gradient.init(colors:)(v100);
  static UnitPoint.center.getter();
  AngularGradient.init(gradient:center:startAngle:endAngle:)(&v100, v34);
  v35 = v100;
  v36 = v101;
  v37 = v102;
  v38 = v103;
  v39 = v104;
  if (*(_BYTE *)(a1 + v26[5]) == 4)
  {
    v40 = sub_1000033B8(&qword_100052318);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v25, 1, 1, v40);
    v41 = v98;
  }
  else
  {
    v78 = v26;
    v80 = v102;
    v81 = v101;
    v82 = v100;
    v83 = v29;
    v84 = v25;
    v42 = sub_1000171D8((uint64_t)v16);
    static WidgetRenderingMode.fullColor.getter(v42);
    v43 = sub_10002684C();
    v44 = dispatch thunk of static Equatable.== infix(_:_:)(v16, v13, v10, v43);
    v45 = *(void (**)(char *, uint64_t))(v11 + 8);
    v79 = v13;
    v45(v13, v10);
    v45(v16, v10);
    v46 = 1;
    v47 = v91;
    if ((v44 & 1) == 0)
    {
      v48 = *(_QWORD *)(a1 + v97);
      v49 = *(_QWORD *)(a1 + v96);
      v77 = v10;
      v50 = v87;
      v51 = v86;
      v52 = v88;
      (*(void (**)(char *, _QWORD, uint64_t))(v87 + 104))(v86, enum case for BlendMode.destinationOut(_:), v88);
      v53 = (uint64_t)v89;
      (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v89, v51, v52);
      v54 = (uint64_t)v85;
      sub_100017970(v53, (uint64_t)&v85[*(int *)(v47 + 36)], (uint64_t (*)(_QWORD))&type metadata accessor for _BlendModeEffect);
      *(_QWORD *)v54 = v48;
      *(_QWORD *)(v54 + 8) = v49;
      *(_BYTE *)(v54 + 16) = 3;
      *(_QWORD *)(v54 + 24) = v48;
      *(_QWORD *)(v54 + 32) = v49;
      *(_WORD *)(v54 + 40) = 2;
      *(_BYTE *)(v54 + 42) = 0;
      sub_1000179B4(v53, (uint64_t (*)(_QWORD))&type metadata accessor for _BlendModeEffect);
      v55 = *(void (**)(char *, uint64_t))(v50 + 8);
      v10 = v77;
      v55(v51, v52);
      sub_1000082A0(v54, v99, &qword_1000522F8);
      v46 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v90 + 56))(v99, v46, 1, v47);
    v57 = v96;
    v56 = v97;
    v58 = *(_QWORD *)(a1 + v97);
    v59 = *(_QWORD *)(a1 + v96);
    sub_10002489C();
    v61 = v60;
    v62 = sub_1000171D8((uint64_t)v16);
    v63 = v79;
    static WidgetRenderingMode.fullColor.getter(v62);
    v64 = static WidgetRenderingMode.== infix(_:_:)(v16, v63);
    v45(v63, v10);
    v45(v16, v10);
    if ((v64 & 1) != 0)
      v65 = 1.2;
    else
      v65 = 0.0;
    v66 = v94;
    (*(void (**)(char *, _QWORD, uint64_t))(v93 + 104))(v94, enum case for Color.RGBColorSpace.sRGB(_:), v95);
    v67 = Color.init(_:white:opacity:)(v66, 0.0, v65);
    v68 = *(double *)(a1 + v78[8]) / 15.0;
    v69 = *(_QWORD *)(a1 + v56);
    v70 = *(_QWORD *)(a1 + v57);
    v71 = v99;
    v72 = v92;
    sub_100003478(v99, v92, &qword_100052300);
    v41 = v98;
    sub_100003478(v72, v98, &qword_100052300);
    v73 = v41 + *(int *)(sub_1000033B8(&qword_100052310) + 48);
    *(_QWORD *)v73 = v58;
    *(_QWORD *)(v73 + 8) = v59;
    *(_BYTE *)(v73 + 16) = 1;
    *(_QWORD *)(v73 + 24) = v61;
    *(_WORD *)(v73 + 32) = 256;
    *(_QWORD *)(v73 + 40) = v67;
    *(double *)(v73 + 48) = v68;
    *(_QWORD *)(v73 + 56) = 0;
    *(_QWORD *)(v73 + 64) = 0;
    *(_QWORD *)(v73 + 72) = v69;
    *(_QWORD *)(v73 + 80) = v70;
    *(_WORD *)(v73 + 88) = 2;
    *(_BYTE *)(v73 + 90) = 0;
    swift_retain(v61);
    swift_retain(v67);
    sub_1000034BC(v71, &qword_100052300);
    swift_release(v67);
    swift_release(v61);
    sub_1000034BC(v72, &qword_100052300);
    v74 = sub_1000033B8(&qword_100052318);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 56))(v41, 0, 1, v74);
    v25 = v84;
    sub_1000082A0(v41, (uint64_t)v84, &qword_100052308);
    v29 = v83;
    v35 = v82;
    v36 = v81;
    v37 = v80;
  }
  sub_100003478((uint64_t)v25, v41, &qword_100052308);
  *(_QWORD *)a2 = v28;
  *(_QWORD *)(a2 + 8) = v29;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = v35;
  *(_QWORD *)(a2 + 32) = v36;
  *(_QWORD *)(a2 + 40) = v37;
  *(_QWORD *)(a2 + 48) = v38;
  *(_QWORD *)(a2 + 56) = v39;
  *(_WORD *)(a2 + 64) = 256;
  v75 = sub_1000033B8(&qword_100052320);
  sub_100003478(v41, a2 + *(int *)(v75 + 48), &qword_100052308);
  swift_bridgeObjectRetain(v35);
  sub_1000034BC((uint64_t)v25, &qword_100052308);
  sub_1000034BC(v41, &qword_100052308);
  swift_bridgeObjectRelease(v35);
}

void sub_10002489C()
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
  uint64_t v9;
  unint64_t v10;
  char v11;
  void (*v12)(char *, uint64_t);
  __n128 v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;

  v1 = v0;
  v2 = type metadata accessor for WidgetRenderingMode(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v8 = (char *)&v17 - v7;
  v9 = sub_1000171D8((uint64_t)&v17 - v7);
  static WidgetRenderingMode.fullColor.getter(v9);
  v10 = sub_10002684C();
  v11 = dispatch thunk of static Equatable.== infix(_:_:)(v5, v8, v2, v10);
  v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v5, v2);
  v12(v8, v2);
  if ((v11 & 1) != 0)
  {
    sub_100024A04();
    return;
  }
  if (*(_BYTE *)(v1 + *(int *)(type metadata accessor for ActivityRing(0) + 20)) == 4)
  {
    v14 = objc_msgSend((id)objc_opt_self(ARUIMetricColors), "grayColors");
    if (v14)
    {
      v15 = v14;
      v16 = objc_msgSend(v14, "gradientDarkColor");

      if (v16)
      {
        Color.init(uiColor:)(v16);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    static Color.white.getter(v13);
  }
}

void sub_100024A04()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;

  v1 = type metadata accessor for Color.RGBColorSpace(0);
  __chkstk_darwin(v1);
  v2 = (char *)&loc_100024A9C
     + *((int *)qword_100024F18 + *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for ActivityRing(0) + 20)));
  __asm { BR              X10 }
}

uint64_t sub_100024AB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  double v15;

  v6 = (void *)objc_opt_self(ARUIMetricColors);
  v7 = objc_msgSend(v6, "energyColors");
  if (!v7)
  {
    __break(1u);
    goto LABEL_8;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "gradientDarkColor");

  if (!v9)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  objc_msgSend(v9, *(SEL *)(v1 + 4024), v4 - 128, v4 - 136, v4 - 144, 0);

  v10 = objc_msgSend(v6, "energyColors");
  if (!v10)
  {
LABEL_9:
    __break(1u);
    JUMPOUT(0x100024EE4);
  }
  v11 = v10;
  v12 = objc_msgSend(v10, "gradientLightColor");

  if (!v12)
  {
    __break(1u);
    JUMPOUT(0x100024B5CLL);
  }
  objc_msgSend(v12, *(SEL *)(v1 + 4024), v4 - 152, v4 - 160, v4 - 168, 0);

  v13 = *(double *)(v4 - 128) + (*(double *)(v4 - 152) - *(double *)(v4 - 128)) * v5;
  v14 = *(double *)(v4 - 136) + (*(double *)(v4 - 160) - *(double *)(v4 - 136)) * v5;
  v15 = *(double *)(v4 - 144) + (*(double *)(v4 - 168) - *(double *)(v4 - 144)) * v5;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, enum case for Color.RGBColorSpace.sRGB(_:), v0);
  return Color.init(_:red:green:blue:opacity:)(v2, v13, v14, v15, 1.0);
}

void sub_100024F2C(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGRect v10;
  CGRect v11;
  CGRect v12;

  CGRectGetMidX(*(CGRect *)&a2);
  v10.origin.x = a2;
  v10.origin.y = a3;
  v10.size.width = a4;
  v10.size.height = a5;
  CGRectGetMidY(v10);
  v11.origin.x = a2;
  v11.origin.y = a3;
  v11.size.width = a4;
  v11.size.height = a5;
  CGRectGetWidth(v11);
  v12.origin.x = a2;
  v12.origin.y = a3;
  v12.size.width = a4;
  v12.size.height = a5;
  CGRectGetHeight(v12);
  __asm { BR              X10 }
}

double sub_100024FDC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;
  __int128 v14;
  double v15;
  _OWORD v16[2];
  char v17;
  _QWORD v18[5];
  _OWORD v19[2];
  char v20;
  _OWORD v21[2];
  char v22;
  _QWORD v23[25];

  v9 = -89.99;
  if (v8 * 360.0 > 0.01)
    v9 = v8 * 360.0 + -90.0;
  v10 = v6;
  v11 = v9 * *(double *)(a2 + 2680);
  if (a3 >= v7)
    a3 = v7;
  v12 = (a3 - v6) * 0.5;
  Path.init()(v16, a1);
  v23[0] = 0x3FF0000000000000;
  v23[1] = 0;
  v23[2] = 0;
  v23[3] = 0x3FF0000000000000;
  v23[4] = 0;
  v23[5] = 0;
  ((void (*)(_QWORD, _QWORD *, double, double, double, double, double))Path.addArc(center:radius:startAngle:endAngle:clockwise:transform:))(0, v23, v5, v15, v12, -1.57079633, v11);
  v21[0] = v16[0];
  v21[1] = v16[1];
  v22 = v17;
  sub_100026BAC((uint64_t)v21, v4 - 136);
  sub_100026C28(v4 - 136, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100026BE8);
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)(v18, 1, 0, &_swiftEmptyArrayStorage, v10, 10.0, 0.0);
  ((void (*)(_OWORD *__return_ptr, _QWORD *))Path.strokedPath(_:))(v19, v18);
  sub_100026C00((uint64_t)v18);
  sub_100026C28((uint64_t)v21, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100026C60);
  sub_100026C28((uint64_t)v21, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100026C60);
  result = *(double *)v19;
  v14 = v19[1];
  *(_OWORD *)v3 = v19[0];
  *(_OWORD *)(v3 + 16) = v14;
  *(_BYTE *)(v3 + 32) = v20;
  return result;
}

double sub_1000251FC@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  uint64_t v5;
  double result;
  __int128 v8;
  __int128 v9;
  char v10;

  sub_100024F2C(*(_BYTE *)(v5 + 16), a2, a3, a4, a5);
  result = *(double *)&v8;
  *(_OWORD *)a1 = v8;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v10;
  return result;
}

uint64_t sub_100025244@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = enum case for LayoutDirectionBehavior.fixed(_:);
  v3 = type metadata accessor for LayoutDirectionBehavior(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_100025288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100026C78();
  return static Shape._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000252D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100026C78();
  return static Shape._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100025328(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100026C78();
  return Shape.body.getter(a1, v2);
}

uint64_t type metadata accessor for StandalonePhoneRingView(uint64_t a1)
{
  return sub_100025EA0(a1, qword_100052160, (uint64_t)&nominal type descriptor for StandalonePhoneRingView);
}

uint64_t sub_100025380@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000253A8(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

void sub_1000253D0(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  id v8;
  char **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1)
  {
    swift_retain(a3);
    v8 = objc_msgSend(a1, "activityMoveMode");
    v9 = &selRef__moveMinutesCompletionPercentage;
    if (v8 != (id)2)
      v9 = &selRef__activeEnergyCompletionPercentage;
    objc_msgSend(a1, *v9);
    v11 = v10;
    objc_msgSend(a1, "_exerciseTimeCompletionPercentage");
    v13 = v12;
    objc_msgSend(a1, "_standHoursCompletionPercentage");
    v15 = v14;

  }
  else
  {
    swift_retain(a3);
    v15 = 0;
    v13 = 0;
    v11 = 0;
  }
  *(_QWORD *)a4 = v11;
  *(_QWORD *)(a4 + 8) = v13;
  *(_QWORD *)(a4 + 16) = v15;
  *(_BYTE *)(a4 + 24) = a1 == 0;
  *(_BYTE *)(a4 + 25) = a2 & 1;
  *(_QWORD *)(a4 + 32) = a3;
}

_QWORD *sub_1000254B8(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[6];
    *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
    *((_BYTE *)a1 + v14) = *((_BYTE *)a2 + v14);
    v15 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    *((_BYTE *)a1 + v15) = *((_BYTE *)a2 + v15);
    v16 = a3[9];
    v12 = *(_QWORD *)((char *)a2 + v16);
    *(_QWORD *)((char *)a1 + v16) = v12;
  }
  swift_retain(v12);
  return a1;
}

double sub_1000255B8(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  double result;

  v4 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  *(_QWORD *)&result = swift_release(*(_QWORD *)((char *)a1 + *(int *)(a2 + 36))).n128_u64[0];
  return result;
}

_QWORD *sub_100025628(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[6];
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  *((_BYTE *)a1 + v12) = *((_BYTE *)a2 + v12);
  v13 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *((_BYTE *)a1 + v13) = *((_BYTE *)a2 + v13);
  v14 = a3[9];
  v15 = *(_QWORD *)((char *)a2 + v14);
  *(_QWORD *)((char *)a1 + v14) = v15;
  swift_retain(v15);
  return a1;
}

_QWORD *sub_100025700(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051D88);
    v6 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  v12 = a3[9];
  v13 = *(_QWORD *)((char *)a1 + v12);
  v14 = *(_QWORD *)((char *)a2 + v12);
  *(_QWORD *)((char *)a1 + v12) = v14;
  swift_retain(v14);
  swift_release(v13);
  return a1;
}

char *sub_100025804(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  a1[v8] = a2[v8];
  v9 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v9] = a2[v9];
  *(_QWORD *)&a1[a3[9]] = *(_QWORD *)&a2[a3[9]];
  return a1;
}

char *sub_1000258D4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051D88);
    v6 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  a1[v8] = a2[v8];
  v9 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  a1[v9] = a2[v9];
  v10 = a3[9];
  v11 = *(_QWORD *)&a1[v10];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];
  swift_release(v11);
  return a1;
}

uint64_t sub_1000259C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000259D0);
}

uint64_t sub_1000259D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_1000033B8(&qword_100051E48);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_100025A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100025A68);
}

uint64_t sub_100025A68(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1000033B8(&qword_100051E48);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36)) = a2;
  return result;
}

void sub_100025AE4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[6];

  sub_100025B78(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[2] = &unk_100040B08;
    v4[3] = &unk_100040B08;
    v4[4] = &unk_100040B20;
    v4[5] = &unk_100040B38;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
  }
}

void sub_100025B78(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100051EB8)
  {
    v2 = type metadata accessor for WidgetRenderingMode(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100051EB8);
  }
}

uint64_t destroy for ActivityRingsView(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 32));
}

uint64_t initializeWithCopy for ActivityRingsView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v3;
  swift_retain(v3);
  return a1;
}

uint64_t assignWithCopy for ActivityRingsView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  swift_retain(v4);
  swift_release(v3);
  return a1;
}

__n128 initializeWithTake for ActivityRingsView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ActivityRingsView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v3 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityRingsView(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityRingsView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityRingsView()
{
  return &type metadata for ActivityRingsView;
}

uint64_t sub_100025DA4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004218C, 1);
}

uint64_t sub_100025DB4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100042164, 1);
}

uint64_t sub_100025DC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for StandalonePhoneRingView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  swift_release(*(_QWORD *)((char *)v6 + *(int *)(v1 + 36)));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100025E78(uint64_t a1)
{
  return sub_10002695C(a1, type metadata accessor for StandalonePhoneRingView, (uint64_t (*)(uint64_t, uint64_t))sub_1000233B0);
}

uint64_t type metadata accessor for ActivityRing(uint64_t a1)
{
  return sub_100025EA0(a1, qword_100052278, (uint64_t)&nominal type descriptor for ActivityRing);
}

uint64_t sub_100025EA0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_100025ED4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100025EFC(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100025F24()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100025F48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100022BF8(v1 + 16, a1);
}

_QWORD *sub_100025F50(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *(_QWORD *)((char *)a1 + v14) = *(_QWORD *)((char *)a2 + v14);
    v15 = a3[8];
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    *(_QWORD *)((char *)a1 + v15) = *(_QWORD *)((char *)a2 + v15);
    v16 = a3[10];
    *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    v12 = *(_QWORD *)((char *)a2 + v16);
    *(_QWORD *)((char *)a1 + v16) = v12;
  }
  swift_retain(v12);
  return a1;
}

double sub_100026058(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  double result;

  v4 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  *(_QWORD *)&result = swift_release(*(_QWORD *)((char *)a1 + *(int *)(a2 + 40))).n128_u64[0];
  return result;
}

_QWORD *sub_1000260C8(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  v13 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  v14 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  v15 = *(_QWORD *)((char *)a2 + v14);
  *(_QWORD *)((char *)a1 + v14) = v15;
  swift_retain(v15);
  return a1;
}

_QWORD *sub_1000261A8(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051D88);
    v6 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  v12 = a3[10];
  v13 = *(_QWORD *)((char *)a1 + v12);
  v14 = *(_QWORD *)((char *)a2 + v12);
  *(_QWORD *)((char *)a1 + v12) = v14;
  swift_retain(v14);
  swift_release(v13);
  return a1;
}

char *sub_1000262B8(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  v9 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  v10 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];
  return a1;
}

char *sub_100026390(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051D88);
    v6 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  v9 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  v10 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  v11 = *(_QWORD *)&a1[v10];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];
  swift_release(v11);
  return a1;
}

uint64_t sub_100026488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100026494);
}

uint64_t sub_100026494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_1000033B8(&qword_100051E48);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 40));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_100026520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002652C);
}

uint64_t sub_10002652C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1000033B8(&qword_100051E48);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 40)) = a2;
  return result;
}

void sub_1000265A8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[7];

  sub_100025B78(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = &unk_100040B20;
    v4[2] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[5] = &unk_100040B08;
    v4[6] = &unk_100040B38;
    swift_initStructMetadata(a1, 256, 7, v4, a1 + 16);
  }
}

uint64_t getEnumTagSinglePayload for ActivityRing.Kind(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ActivityRing.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10002671C + 4 * byte_100040A99[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100026750 + 4 * byte_100040A94[v4]))();
}

uint64_t sub_100026750(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100026758(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100026760);
  return result;
}

uint64_t sub_10002676C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100026774);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100026778(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100026780(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActivityRing.Kind()
{
  return &type metadata for ActivityRing.Kind;
}

uint64_t sub_10002679C()
{
  return sub_100003928(&qword_1000522C8, &qword_1000522D0, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t sub_1000267C8()
{
  return sub_100003928(&qword_1000522D8, &qword_1000522E0, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

unint64_t sub_1000267F8()
{
  unint64_t result;

  result = qword_1000522E8;
  if (!qword_1000522E8)
  {
    result = swift_getWitnessTable(&unk_100040C8C, &type metadata for ActivityRing.Kind);
    atomic_store(result, (unint64_t *)&qword_1000522E8);
  }
  return result;
}

uint64_t sub_10002683C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000421D0, 1);
}

unint64_t sub_10002684C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000522F0;
  if (!qword_1000522F0)
  {
    v1 = type metadata accessor for WidgetRenderingMode(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for WidgetRenderingMode, v1);
    atomic_store(result, (unint64_t *)&qword_1000522F0);
  }
  return result;
}

uint64_t sub_100026894()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for ActivityRing(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  swift_release(*(_QWORD *)((char *)v6 + *(int *)(v1 + 40)));
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100026948(uint64_t a1)
{
  return sub_10002695C(a1, type metadata accessor for ActivityRing, (uint64_t (*)(uint64_t, uint64_t))sub_1000240F4);
}

uint64_t sub_10002695C(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(a2(0) - 8) + 80);
  return a3(a1, v3 + ((v5 + 16) & ~v5));
}

uint64_t sub_1000269B8(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    swift_retain(a3);
    return swift_retain(a2);
  }
  return result;
}

uint64_t sub_1000269E8(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    swift_release(a2);
    return swift_release(a3);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for ActivityRing.Arc(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ActivityRing.Arc(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 4;
  v5 = v3 - 4;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityRing.Arc(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityRing.Arc()
{
  return &type metadata for ActivityRing.Arc;
}

uint64_t sub_100026AC4()
{
  return sub_100003928(&qword_100052328, &qword_100052330, (uint64_t)&protocol conformance descriptor for TupleView<A>);
}

uint64_t sub_100026AF0()
{
  return sub_100003928(&qword_100052338, &qword_100052340, (uint64_t)&protocol conformance descriptor for _ShapeView<A, B>);
}

unint64_t sub_100026B20()
{
  unint64_t result;

  result = qword_100052348;
  if (!qword_100052348)
  {
    result = swift_getWitnessTable(&unk_100040D58, &type metadata for ActivityRing.Arc);
    atomic_store(result, (unint64_t *)&qword_100052348);
  }
  return result;
}

unint64_t sub_100026B68()
{
  unint64_t result;

  result = qword_100052350;
  if (!qword_100052350)
  {
    result = swift_getWitnessTable(&unk_100040D08, &type metadata for ActivityRing.Arc);
    atomic_store(result, (unint64_t *)&qword_100052350);
  }
  return result;
}

uint64_t sub_100026BAC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for Path.Storage - 1) + 32))(a2, a1);
  return a2;
}

uint64_t sub_100026BE8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3)
    return swift_retain(result);
  return result;
}

uint64_t sub_100026C00(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  return a1;
}

uint64_t sub_100026C28(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  return a1;
}

uint64_t sub_100026C60(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3)
    return swift_release(result);
  return result;
}

unint64_t sub_100026C78()
{
  unint64_t result;

  result = qword_100052358;
  if (!qword_100052358)
  {
    result = swift_getWitnessTable(&unk_100040DA8, &type metadata for ActivityRing.Arc);
    atomic_store(result, (unint64_t *)&qword_100052358);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ActivityRing.Arc.Kind(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ActivityRing.Arc.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100026D98 + 4 * byte_100040AA3[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100026DCC + 4 * byte_100040A9E[v4]))();
}

uint64_t sub_100026DCC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100026DD4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100026DDCLL);
  return result;
}

uint64_t sub_100026DE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100026DF0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100026DF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100026DFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActivityRing.Arc.Kind()
{
  return &type metadata for ActivityRing.Arc.Kind;
}

unint64_t sub_100026E1C()
{
  unint64_t result;

  result = qword_100052360;
  if (!qword_100052360)
  {
    result = swift_getWitnessTable(&unk_100040E38, &type metadata for ActivityRing.Arc.Kind);
    atomic_store(result, (unint64_t *)&qword_100052360);
  }
  return result;
}

_QWORD *sub_100026E70(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  id v25;
  id v26;
  uint64_t v27;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = a3[6];
    v16 = *(void **)((char *)a2 + v14);
    *(_QWORD *)((char *)a1 + v14) = v16;
    *((_BYTE *)a1 + v15) = *((_BYTE *)a2 + v15);
    v17 = a3[7];
    v18 = a3[8];
    v19 = *(void **)((char *)a2 + v17);
    *(_QWORD *)((char *)a1 + v17) = v19;
    v20 = (char *)a1 + v18;
    v21 = (char *)a2 + v18;
    v22 = type metadata accessor for Date(0);
    v23 = *(_QWORD *)(v22 - 8);
    v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
    v25 = v16;
    v26 = v19;
    if (v24(v21, 1, v22))
    {
      v27 = sub_1000033B8((uint64_t *)&unk_100051980);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
    }
  }
  return a1;
}

uint64_t sub_100026FF4(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }

  v6 = (char *)a1 + a2[8];
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

_QWORD *sub_1000270C8(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  id v23;
  id v24;
  uint64_t v25;

  v6 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = a3[6];
  v14 = *(void **)((char *)a2 + v12);
  *(_QWORD *)((char *)a1 + v12) = v14;
  *((_BYTE *)a1 + v13) = *((_BYTE *)a2 + v13);
  v15 = a3[7];
  v16 = a3[8];
  v17 = *(void **)((char *)a2 + v15);
  *(_QWORD *)((char *)a1 + v15) = v17;
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  v20 = type metadata accessor for Date(0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  v23 = v14;
  v24 = v17;
  if (v22(v19, 1, v20))
  {
    v25 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  }
  return a1;
}

_QWORD *sub_100027220(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t, uint64_t);
  int v26;
  int v27;
  uint64_t v28;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B88);
    v6 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = a3[5];
  v13 = *(void **)((char *)a2 + v12);
  v14 = *(void **)((char *)a1 + v12);
  *(_QWORD *)((char *)a1 + v12) = v13;
  v15 = v13;

  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v16 = a3[7];
  v17 = *(void **)((char *)a1 + v16);
  v18 = *(void **)((char *)a2 + v16);
  *(_QWORD *)((char *)a1 + v16) = v18;
  v19 = v18;

  v20 = a3[8];
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = type metadata accessor for Date(0);
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  v26 = v25(v21, 1, v23);
  v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 24))(v21, v22, v23);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_11;
  }
  if (v27)
  {
LABEL_11:
    v28 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

char *sub_1000273EC(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  a1[v8] = a2[v8];
  v9 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = type metadata accessor for Date(0);
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    v14 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  return a1;
}

char *sub_100027530(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B88);
    v6 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = *(void **)&a1[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];

  v10 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  v11 = *(void **)&a1[v10];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];

  v12 = a3[8];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = type metadata accessor for Date(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_10;
  }
  if (v19)
  {
LABEL_10:
    v20 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_1000276EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000276F8);
}

uint64_t sub_1000276F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_1000033B8(&qword_100051B98);
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
    v8 = sub_1000033B8((uint64_t *)&unk_100051980);
    v10 = a1 + *(int *)(a3 + 32);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_1000277A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000277B4);
}

uint64_t sub_1000277B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_1000033B8(&qword_100051B98);
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
    v10 = sub_1000033B8((uint64_t *)&unk_100051980);
    v12 = a1 + *(int *)(a4 + 32);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for FitnessComplicationView(uint64_t a1)
{
  uint64_t result;

  result = qword_1000523C0;
  if (!qword_1000523C0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FitnessComplicationView);
  return result;
}

void sub_10002789C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[5];

  sub_100014804(319, &qword_100051C10, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    v6[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v6[2] = &unk_100040EB8;
    v6[3] = &unk_100040ED0;
    sub_100014804(319, (unint64_t *)&qword_100051720, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v5 <= 0x3F)
    {
      v6[4] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 5, v6, a1 + 16);
    }
  }
}

uint64_t sub_100027970(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004223C, 1);
}

void sub_100027980(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  int *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  NSString v22;
  NSString v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  int *v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  unint64_t v41;
  unint64_t v42;
  int *v43;
  void *v44;
  char v45;
  void *v46;
  id v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  char v58;
  char v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  __int16 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  unsigned __int8 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  char v86;
  char v87;
  uint64_t v88;
  unsigned __int8 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;

  v4 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v4);
  v6 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for WidgetFamily(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016F6C((uint64_t)v10);
  v11 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v10, v7);
  if (v11 == enum case for WidgetFamily.accessoryCircular(_:))
  {
    v12 = (int *)type metadata accessor for FitnessComplicationView(0);
    v13 = *(void **)(a1 + v12[5]);
    v14 = *(void **)(a1 + v12[7]);
    sub_10001A5A4(a1 + v12[8], (uint64_t)v6);
    v15 = type metadata accessor for Date(0);
    v16 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48))(v6, 1, v15) != 1;
    v17 = v14;
    v18 = v13;
    sub_1000034BC((uint64_t)v6, (uint64_t *)&unk_100051980);
    v19 = (void *)objc_opt_self(NSBundle);
    v20 = v17;
    v21 = objc_msgSend(v19, "mainBundle");
    v22 = String._bridgeToObjectiveC()();
    v23 = String._bridgeToObjectiveC()();
    v24 = objc_msgSend(v21, "localizedStringForKey:value:table:", v22, 0, v23);

    v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    v27 = v26;

    *(_QWORD *)&v81 = v14;
    *((_QWORD *)&v81 + 1) = v16;
    *(_QWORD *)&v82 = v18;
    *((_QWORD *)&v82 + 1) = v14;
    *(_QWORD *)&v83 = v25;
    *((_QWORD *)&v83 + 1) = v27;
    v85 = 0;
    v84 = 0uLL;
    v86 = 0;
    v28 = sub_100028180();
    v29 = sub_1000281C4();
    v30 = v18;
    v31 = v20;
    swift_bridgeObjectRetain(v27);
    _ConditionalContent<>.init(storage:)(&v81, &type metadata for CircularView, &type metadata for RectangularView, v28, v29);
    v69 = v75;
    v70 = v76;
    v71 = v77;
    v72 = v78;
    v73 = v79;
    v74 = v80;
    v32 = sub_1000033B8(&qword_100052430);
    v33 = sub_1000033B8(&qword_100052450);
    v34 = sub_1000280EC();
    v35 = sub_100028208();
    _ConditionalContent<>.init(storage:)(&v69, v32, v33, v34, v35);
    swift_bridgeObjectRelease(v27);

  }
  else
  {
    if (v11 == enum case for WidgetFamily.accessoryRectangular(_:))
    {
      v36 = (int *)type metadata accessor for FitnessComplicationView(0);
      v37 = *(void **)(a1 + v36[5]);
      v38 = *(_BYTE *)(a1 + v36[6]);
      v39 = *(void **)(a1 + v36[7]);
      v40 = v39;
      sub_10002E658(v37, v38, v39, (uint64_t)&v88);
      *(_QWORD *)&v81 = v88;
      *((_QWORD *)&v81 + 1) = v89;
      v82 = v90;
      v83 = v91;
      v84 = v92;
      v85 = v93;
      v86 = 1;
      sub_1000283E8((uint64_t)&v88);
      v41 = sub_100028180();
      v42 = sub_1000281C4();
      _ConditionalContent<>.init(storage:)(&v81, &type metadata for CircularView, &type metadata for RectangularView, v41, v42);
      v69 = v75;
      v70 = v76;
      v71 = v77;
      v72 = v78;
      v73 = v79;
      v74 = v80;
    }
    else
    {
      if (v11 != enum case for WidgetFamily.accessoryInline(_:))
      {
        v85 = 0;
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v86 = 1;
        v60 = sub_100028274();
        _ConditionalContent<>.init(storage:)(&v81, &type metadata for InlineView, &type metadata for EmptyView, v60, &protocol witness table for EmptyView);
        v69 = v75;
        v70 = v76;
        v71 = v77;
        v72 = v78;
        v73 = v79;
        LOBYTE(v74) = v80;
        HIBYTE(v74) = 1;
        v61 = sub_1000033B8(&qword_100052430);
        v62 = sub_1000033B8(&qword_100052450);
        v63 = sub_1000280EC();
        v64 = sub_100028208();
        _ConditionalContent<>.init(storage:)(&v69, v61, v62, v63, v64);
        v67 = v82;
        v68 = v81;
        v65 = v84;
        v66 = v83;
        v57 = v85;
        v58 = v86;
        v59 = v87;
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        v56 = v65;
        v55 = v66;
        v54 = v67;
        v53 = v68;
        goto LABEL_9;
      }
      v43 = (int *)type metadata accessor for FitnessComplicationView(0);
      v44 = *(void **)(a1 + v43[5]);
      v45 = *(_BYTE *)(a1 + v43[6]);
      v46 = *(void **)(a1 + v43[7]);
      v47 = v46;
      sub_10002E658(v44, v45, v46, (uint64_t)&v88);
      *(_QWORD *)&v81 = v88;
      *((_QWORD *)&v81 + 1) = v89;
      v82 = v90;
      v83 = v91;
      v84 = v92;
      v85 = v93;
      v86 = 0;
      sub_1000283E8((uint64_t)&v88);
      v48 = sub_100028274();
      _ConditionalContent<>.init(storage:)(&v81, &type metadata for InlineView, &type metadata for EmptyView, v48, &protocol witness table for EmptyView);
      v69 = v75;
      v70 = v76;
      v71 = v77;
      v72 = v78;
      v73 = v79;
      LOBYTE(v74) = v80;
      HIBYTE(v74) = 1;
    }
    v49 = sub_1000033B8(&qword_100052430);
    v50 = sub_1000033B8(&qword_100052450);
    v51 = sub_1000280EC();
    v52 = sub_100028208();
    _ConditionalContent<>.init(storage:)(&v69, v49, v50, v51, v52);
    sub_10002844C((uint64_t)&v88);
  }
  v53 = v81;
  v54 = v82;
  v55 = v83;
  v56 = v84;
  v57 = v85;
  v58 = v86;
  v59 = v87;
LABEL_9:
  *(_OWORD *)a2 = v53;
  *(_OWORD *)(a2 + 16) = v54;
  *(_OWORD *)(a2 + 32) = v55;
  *(_OWORD *)(a2 + 48) = v56;
  *(_QWORD *)(a2 + 64) = v57;
  *(_BYTE *)(a2 + 72) = v58;
  *(_BYTE *)(a2 + 73) = v59;
}

void sub_100027F84()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[9];
  char v15;
  char v16;

  sub_100027980(v0, (uint64_t)v14);
  v12 = v14[1];
  v13 = (void *)v14[0];
  v1 = (void *)v14[3];
  v11 = (void *)v14[2];
  v2 = (void *)v14[4];
  v3 = v14[5];
  v4 = v14[6];
  v5 = v14[7];
  v6 = v14[8];
  v7 = v15;
  v8 = v16;
  v9 = sub_1000033B8(&qword_100052408);
  v10 = sub_100028068();
  View.unredacted()(v9, v10);
  sub_1000282B8(v13, v12, v11, v1, v2, v3, v4, v5, v6, v7, v8);
}

unint64_t sub_100028068()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052410;
  if (!qword_100052410)
  {
    v1 = sub_1000036E4(&qword_100052408);
    sub_100028110(&qword_100052418, &qword_100052420, (void (*)(void))sub_1000280EC, (void (*)(void))sub_100028208);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100052410);
  }
  return result;
}

uint64_t sub_1000280EC()
{
  return sub_100028110(&qword_100052428, &qword_100052430, (void (*)(void))sub_100028180, (void (*)(void))sub_1000281C4);
}

uint64_t sub_100028110(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_1000036E4(a2);
    a3();
    a4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100028180()
{
  unint64_t result;

  result = qword_100052438;
  if (!qword_100052438)
  {
    result = swift_getWitnessTable(&unk_10004039C, &type metadata for CircularView);
    atomic_store(result, (unint64_t *)&qword_100052438);
  }
  return result;
}

unint64_t sub_1000281C4()
{
  unint64_t result;

  result = qword_100052440;
  if (!qword_100052440)
  {
    result = swift_getWitnessTable(&unk_100041610, &type metadata for RectangularView);
    atomic_store(result, (unint64_t *)&qword_100052440);
  }
  return result;
}

unint64_t sub_100028208()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052448;
  if (!qword_100052448)
  {
    v1 = sub_1000036E4(&qword_100052450);
    sub_100028274();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052448);
  }
  return result;
}

unint64_t sub_100028274()
{
  unint64_t result;

  result = qword_100052458;
  if (!qword_100052458)
  {
    result = swift_getWitnessTable(&unk_10004107C, &type metadata for InlineView);
    atomic_store(result, (unint64_t *)&qword_100052458);
  }
  return result;
}

void sub_1000282B8(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char a11)
{
  if ((a11 & 1) != 0)
    sub_100028370(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 & 1);
  else
    sub_1000282E8(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 & 1);
}

void sub_1000282E8(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  void *v11;

  v11 = a1;
  if ((a10 & 1) != 0)
  {

    swift_bridgeObjectRelease(a7);
    v11 = a3;
    a4 = a5;
  }
  else
  {
    a9 = a6;

  }
  swift_bridgeObjectRelease(a9);

}

void sub_100028370(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if ((a10 & 1) == 0)
  {

    swift_bridgeObjectRelease(a7);
    swift_bridgeObjectRelease(a9);

  }
}

uint64_t sub_1000283E8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 16);
  v4 = *(void **)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(id *)(a1 + 32);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  v8 = v2;
  v9 = v3;
  v10 = v4;
  return a1;
}

uint64_t sub_10002844C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 16);
  v4 = *(void **)(a1 + 24);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 64));
  swift_bridgeObjectRelease(v6);

  return a1;
}

uint64_t sub_1000284AC()
{
  _QWORD v1[2];

  v1[0] = sub_1000036E4(&qword_100052408);
  v1[1] = sub_100028068();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.unredacted()>>, 1);
}

uint64_t sub_1000284F8@<X0>(char a1@<W0>, void *a2@<X1>, char a3@<W2>, void *a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>, __n128 a7@<Q0>)
{
  uint64_t v13;
  int *v14;
  _QWORD *v15;
  __n128 v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSString v22;
  NSString v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  _QWORD *v29;

  *a6 = swift_getKeyPath(&unk_100040F40, a7);
  v13 = sub_1000033B8(&qword_100051B88);
  swift_storeEnumTagMultiPayload(a6, v13, 0);
  v14 = (int *)type metadata accessor for StandaloneSummaryView(0);
  v15 = (_QWORD *)((char *)a6 + v14[5]);
  *v15 = swift_getKeyPath(&unk_100040F70, v16);
  v17 = sub_1000033B8(&qword_100051B90);
  swift_storeEnumTagMultiPayload(v15, v17, 0);
  *((_BYTE *)a6 + v14[6]) = a1;
  *(_QWORD *)((char *)a6 + v14[7]) = a2;
  *((_BYTE *)a6 + v14[8]) = a3;
  *(_QWORD *)((char *)a6 + v14[9]) = a4;
  sub_100003478(a5, (uint64_t)a6 + v14[10], (uint64_t *)&unk_100051980);
  v18 = (void *)objc_opt_self(NSBundle);
  v19 = a4;
  v20 = a2;
  v21 = objc_msgSend(v18, "mainBundle");
  v22 = String._bridgeToObjectiveC()();
  v23 = String._bridgeToObjectiveC()();
  v24 = objc_msgSend(v21, "localizedStringForKey:value:table:", v22, 0, v23);

  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
  v27 = v26;

  result = sub_1000034BC(a5, (uint64_t *)&unk_100051980);
  v29 = (_QWORD *)((char *)a6 + v14[11]);
  *v29 = v20;
  v29[1] = a4;
  v29[2] = v25;
  v29[3] = v27;
  return result;
}

uint64_t type metadata accessor for StandaloneSummaryView(uint64_t a1)
{
  uint64_t result;

  result = qword_1000524B8;
  if (!qword_1000524B8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StandaloneSummaryView);
  return result;
}

uint64_t sub_100028714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
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
  char *v21;
  __n128 v22;
  __n128 v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v45 = a1;
  v47 = a3;
  v42 = type metadata accessor for GeometryProxy(0);
  v4 = *(_QWORD *)(v42 - 8);
  v44 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(v42);
  v41 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for StandaloneSummaryView(0);
  v40 = *(_QWORD *)(v6 - 8);
  v7 = *(_QWORD *)(v40 + 64);
  v8 = __chkstk_darwin(v6);
  v9 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for AdaptiveStackType(0, v8);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v16 = (char *)&v36 - v15;
  __chkstk_darwin(v17);
  v19 = (uint64_t)&v36 - v18;
  v39 = (char *)&v36 - v18;
  v46 = sub_1000033B8(&qword_100052508);
  v43 = *(_QWORD *)(v46 - 8);
  __chkstk_darwin(v46);
  v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000289FC(v19);
  v38 = static VerticalAlignment.center.getter(v22);
  v37 = static HorizontalAlignment.leading.getter(v23);
  sub_1000289FC((uint64_t)v16);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, enum case for AdaptiveStackType.vertical(_:), v10);
  LOBYTE(v19) = static AdaptiveStackType.== infix(_:_:)(v16, v13);
  v24 = *(void (**)(char *, uint64_t))(v11 + 8);
  v24(v13, v10);
  v24(v16, v10);
  if ((v19 & 1) != 0)
    v25 = 0x4014000000000000;
  else
    v25 = 0;
  sub_100017970(a2, (uint64_t)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for StandaloneSummaryView);
  v27 = v41;
  v26 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v41, v45, v42);
  v28 = *(unsigned __int8 *)(v40 + 80);
  v29 = (v28 + 16) & ~v28;
  v30 = *(unsigned __int8 *)(v4 + 80);
  v31 = (v7 + v30 + v29) & ~v30;
  v32 = swift_allocObject(&unk_10004F640, v31 + v44, v28 | v30 | 7);
  sub_10002BF68((uint64_t)v9, v32 + v29);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v32 + v31, v27, v26);
  v33 = sub_1000033B8(&qword_100052510);
  v34 = sub_100003928(&qword_100052518, &qword_100052510, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  AdaptiveStack.init(type:verticalAlignment:horizontalAlignment:spacing:content:)(v39, v38, v37, v25, 0, sub_10002C1D0, v32, v33, v34);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v43 + 32))(v47, v21, v46);
}

uint64_t sub_1000289FC@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  char v18;
  __n128 v19;
  unsigned int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v2 = v1;
  v4 = type metadata accessor for StandaloneSummaryView(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for WidgetFamily(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - v12;
  sub_100016F6C((uint64_t)&v24 - v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for WidgetFamily.systemSmall(_:), v7);
  v14 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(&v25, v7, v14);
  dispatch thunk of RawRepresentable.rawValue.getter(&v24, v7, v14);
  v16 = v24;
  v15 = v25;
  v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v10, v7);
  v17(v13, v7);
  sub_100017970(v2, (uint64_t)v6, type metadata accessor for StandaloneSummaryView);
  if (v15 != v16)
  {
    sub_1000179B4((uint64_t)v6, type metadata accessor for StandaloneSummaryView);
    goto LABEL_5;
  }
  v18 = sub_10002A2A0();
  sub_1000179B4((uint64_t)v6, type metadata accessor for StandaloneSummaryView);
  if ((v18 & 1) != 0)
  {
LABEL_5:
    v20 = (unsigned int *)&enum case for AdaptiveStackType.horizontal(_:);
    goto LABEL_6;
  }
  v20 = (unsigned int *)&enum case for AdaptiveStackType.vertical(_:);
LABEL_6:
  v21 = *v20;
  v22 = type metadata accessor for AdaptiveStackType(0, v19);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(a1, v21, v22);
}

uint64_t sub_100028BE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, __n128 a4@<Q0>)
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
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __n128 v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t OpaqueTypeConformance2;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __n128 v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  BOOL v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(char *, uint64_t);
  char v103;
  char *v104;
  uint64_t v105;
  __n128 v106;
  uint64_t KeyPath;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  char v117;
  char v118;
  void *v119;
  id v120;
  char v121;
  __n128 v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  double v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  double v135;
  double v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  _OWORD *v143;
  __int128 v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t result;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t *v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  _QWORD *v173;
  uint64_t v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  char *v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  _OWORD v196[3];

  v190 = a3;
  v162 = type metadata accessor for AdaptiveStackType(0, a4);
  v159 = *(_QWORD *)(v162 - 8);
  __chkstk_darwin(v162);
  v157 = (uint64_t)&v152 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v153 = sub_1000033B8(&qword_100051CC0);
  __chkstk_darwin(v153);
  v174 = (uint64_t)&v152 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v172 = type metadata accessor for WidgetFamily(0);
  v171 = *(_QWORD *)(v172 - 8);
  __chkstk_darwin(v172);
  v170 = (char *)&v152 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v169 = (uint64_t)&v152 - v10;
  v152 = type metadata accessor for StandaloneMetricsStack(0);
  __chkstk_darwin(v152);
  v173 = (uint64_t *)((char *)&v152 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v158 = sub_1000033B8(&qword_100052520);
  v156 = *(_QWORD *)(v158 - 8);
  __chkstk_darwin(v158);
  v155 = (char *)&v152 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v179 = sub_1000033B8(&qword_100052528);
  __chkstk_darwin(v179);
  v154 = (char *)&v152 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v161 = (uint64_t)&v152 - v15;
  v177 = sub_1000033B8(&qword_100052530);
  __chkstk_darwin(v177);
  v178 = (uint64_t)&v152 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v166 = type metadata accessor for PauseRingsLabel(0);
  __chkstk_darwin(v166);
  v167 = (uint64_t *)((char *)&v152 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v176 = sub_1000033B8(&qword_100052538);
  __chkstk_darwin(v176);
  v165 = (uint64_t)&v152 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v168 = (uint64_t)&v152 - v20;
  v21 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v21);
  v163 = (char *)&v152 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  v181 = (uint64_t)&v152 - v24;
  v183 = type metadata accessor for Date(0);
  v182 = *(_QWORD *)(v183 - 8);
  __chkstk_darwin(v183);
  v164 = (char *)&v152 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_1000033B8(&qword_100052540);
  v193 = *(_QWORD *)(v26 - 8);
  v194 = v26;
  __chkstk_darwin(v26);
  v175 = (char *)&v152 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_1000033B8(&qword_100052548);
  __chkstk_darwin(v28);
  v192 = (char *)&v152 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  v189 = (uint64_t)&v152 - v31;
  v32 = type metadata accessor for AccessibilityChildBehavior(0);
  v33 = *(_QWORD *)(v32 - 8);
  __chkstk_darwin(v32);
  v35 = (char *)&v152 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_1000033B8(&qword_100052550);
  __chkstk_darwin(v36);
  v38 = (char *)&v152 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_1000033B8(&qword_100052558);
  __chkstk_darwin(v39);
  v41 = (char *)&v152 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v185 = sub_1000033B8(&qword_100052560);
  v187 = *(_QWORD *)(v185 - 8);
  __chkstk_darwin(v185);
  v43 = (char *)&v152 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v186 = sub_1000033B8(&qword_100052568);
  __chkstk_darwin(v186);
  v191 = (char *)&v152 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v45);
  v47 = (char *)&v152 - v46;
  __chkstk_darwin(v48);
  v184 = (char *)&v152 - v49;
  v51 = __chkstk_darwin(v50);
  v188 = (char *)&v152 - v52;
  *(_QWORD *)v38 = static VerticalAlignment.center.getter(v51);
  *((_QWORD *)v38 + 1) = 0;
  v38[16] = 0;
  v53 = &v38[*(int *)(sub_1000033B8(&qword_100052570) + 44)];
  v160 = a2;
  v54 = sub_100029AB4(a1, a2, v53);
  v55 = static Alignment.center.getter(v54);
  sub_10002A4F0(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v41, 0.0, 1, INFINITY, 0, v55, v56);
  v57 = sub_1000034BC((uint64_t)v38, &qword_100052550);
  static AccessibilityChildBehavior.ignore.getter(v57);
  v58 = sub_10002C238();
  View.accessibilityElement(children:)(v35, v39, v58);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v32);
  sub_1000034BC((uint64_t)v41, &qword_100052558);
  v180 = type metadata accessor for StandaloneSummaryView(0);
  v59 = a1;
  *(_QWORD *)&v196[0] = sub_10003B264(*(id *)(a1 + *(int *)(v180 + 44) + 8));
  *((_QWORD *)&v196[0] + 1) = v60;
  v61 = sub_100008E40();
  v62 = Text.init<A>(_:)(v196, &type metadata for String, v61);
  v64 = v63;
  v66 = v65;
  v68 = v67 & 1;
  *(_QWORD *)&v196[0] = v39;
  *((_QWORD *)&v196[0] + 1) = v58;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v196, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  v70 = v185;
  View.accessibility(label:)(v62, v64, v68, v66, v185, OpaqueTypeConformance2);
  v71 = v62;
  v72 = v64;
  v73 = v190;
  v74 = (uint64_t)v191;
  sub_100008E84(v71, v72, v68);
  v75 = v66;
  v76 = (uint64_t)v188;
  v77 = swift_bridgeObjectRelease(v75);
  v78 = v43;
  v79 = (uint64_t)v192;
  v80 = v59;
  (*(void (**)(char *, uint64_t, __n128))(v187 + 8))(v78, v70, v77);
  v81 = (uint64_t)v184;
  ModifiedContent<>.accessibility(sortPriority:)(v186, 3.0);
  sub_1000034BC((uint64_t)v47, &qword_100052568);
  sub_1000082A0(v81, v76, &qword_100052568);
  v82 = sub_10002AA64();
  v83 = 1;
  v85 = v193;
  v84 = v194;
  if (v82)
    goto LABEL_13;
  v86 = (int *)v180;
  v87 = v181;
  sub_100003478(v80 + *(int *)(v180 + 40), v181, (uint64_t *)&unk_100051980);
  v88 = v182;
  v89 = v183;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v182 + 48))(v87, 1, v183) != 1)
  {
    v104 = v164;
    (*(void (**)(char *, uint64_t, uint64_t))(v88 + 32))(v164, v87, v89);
    v105 = (uint64_t)v163;
    (*(void (**)(char *, char *, uint64_t))(v88 + 16))(v163, v104, v89);
    v106.n128_f64[0] = (*(double (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v88 + 56))(v105, 0, 1, v89);
    KeyPath = swift_getKeyPath(&unk_100040F40, v106);
    v108 = (uint64_t)v167;
    *v167 = KeyPath;
    v109 = sub_1000033B8(&qword_100051B88);
    swift_storeEnumTagMultiPayload(v108, v109, 0);
    sub_1000082A0(v105, v108 + *(int *)(v166 + 20), (uint64_t *)&unk_100051980);
    v110 = v165;
    sub_100017970(v108, v165, type metadata accessor for PauseRingsLabel);
    v111 = v176;
    *(_WORD *)(v110 + *(int *)(v176 + 36)) = 256;
    sub_1000179B4(v108, type metadata accessor for PauseRingsLabel);
    v112 = v168;
    sub_1000082A0(v110, v168, &qword_100052538);
    v113 = v178;
    sub_100003478(v112, v178, &qword_100052538);
    swift_storeEnumTagMultiPayload(v113, v177, 0);
    v114 = sub_10002C2BC();
    v115 = sub_10002C340();
    v116 = (uint64_t)v175;
    _ConditionalContent<>.init(storage:)(v113, v111, v179, v114, v115);
    sub_1000034BC(v112, &qword_100052538);
    (*(void (**)(char *, uint64_t))(v88 + 8))(v104, v89);
LABEL_12:
    sub_1000082A0(v116, v189, &qword_100052540);
    v83 = 0;
    v73 = v190;
    v74 = (uint64_t)v191;
    v79 = (uint64_t)v192;
    v85 = v193;
    v84 = v194;
LABEL_13:
    v149 = v189;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v85 + 56))(v189, v83, 1, v84);
    sub_100003478(v76, v74, &qword_100052568);
    sub_100003478(v149, v79, &qword_100052548);
    sub_100003478(v74, v73, &qword_100052568);
    v150 = sub_1000033B8(&qword_1000525A0);
    sub_100003478(v79, v73 + *(int *)(v150 + 48), &qword_100052548);
    sub_1000034BC(v149, &qword_100052548);
    sub_1000034BC(v76, &qword_100052568);
    sub_1000034BC(v79, &qword_100052548);
    return sub_1000034BC(v74, &qword_100052568);
  }
  sub_1000034BC(v87, (uint64_t *)&unk_100051980);
  v90 = v86[7];
  LODWORD(v187) = *(unsigned __int8 *)(v80 + v86[6]);
  v91 = *(void **)(v80 + v90);
  LODWORD(v186) = *(unsigned __int8 *)(v80 + v86[8]);
  v92 = v91;
  LOBYTE(v93) = sub_10002A2A0();
  v94 = v169;
  v95 = v80;
  sub_100016F6C(v169);
  v96 = v171;
  v97 = v170;
  v98 = v172;
  (*(void (**)(char *, _QWORD, uint64_t))(v171 + 104))(v170, enum case for WidgetFamily.systemMedium(_:), v172);
  v99 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(v196, v98, v99);
  dispatch thunk of RawRepresentable.rawValue.getter(&v195, v98, v99);
  v100 = *(_QWORD *)&v196[0];
  v101 = v195;
  v102 = *(void (**)(char *, uint64_t))(v96 + 8);
  v102(v97, v98);
  v102((char *)v94, v98);
  if (v100 != v101)
  {
    v103 = 0;
    goto LABEL_8;
  }
  if (qword_1000511F8 != -1)
    goto LABEL_15;
  while (1)
  {
    v103 = *(_BYTE *)(qword_100054900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser) ^ 1;
LABEL_8:
    v117 = v187;
    v118 = v186;
    v119 = *(void **)(v95 + v86[9]);
    v120 = v119;
    v121 = (v93 & 1) == 0;
    v93 = (uint64_t)v173;
    sub_100037E68(v117, v92, v118, v121, v103 & 1, v119, v173, v122);
    v123 = v174;
    sub_10002ABFC(v174);
    v124 = type metadata accessor for DynamicTypeSize(0);
    v125 = sub_100008304(&qword_100051D10, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
    if ((dispatch thunk of static Equatable.== infix(_:_:)(v123, v123, v124, v125) & 1) != 0)
      break;
    __break(1u);
LABEL_15:
    swift_once(&qword_1000511F8, sub_10003D32C);
  }
  v126 = sub_100008304(&qword_100052588, type metadata accessor for StandaloneMetricsStack, (uint64_t)&unk_100041898);
  v127 = sub_100003928(&qword_100051CD0, &qword_100051CC0, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
  v128 = v155;
  View.dynamicTypeSize<A>(_:)(v123, v152, v153, v126, v127);
  sub_1000034BC(v123, &qword_100051CC0);
  v129 = sub_1000179B4(v93, type metadata accessor for StandaloneMetricsStack);
  v130 = GeometryProxy.size.getter(v129);
  v131 = v157;
  sub_1000289FC(v157);
  v132 = v131;
  v133 = v162;
  v134 = (*(uint64_t (**)(uint64_t, uint64_t))(v159 + 88))(v132, v162);
  v135 = 0.5;
  if ((_DWORD)v134 == enum case for AdaptiveStackType.horizontal(_:)
    || (v135 = 1.0, (_DWORD)v134 == enum case for AdaptiveStackType.vertical(_:)))
  {
    v136 = v130 * v135;
    v137 = static Alignment.center.getter(v134);
    _FrameLayout.init(width:height:alignment:)(v196, *(_QWORD *)&v136, 0, 0, 1, v137, v138);
    v139 = v156;
    v140 = (uint64_t)v154;
    v141 = v158;
    (*(void (**)(char *, char *, uint64_t))(v156 + 16))(v154, v128, v158);
    v142 = v179;
    v143 = (_OWORD *)(v140 + *(int *)(v179 + 36));
    v144 = v196[1];
    *v143 = v196[0];
    v143[1] = v144;
    v143[2] = v196[2];
    (*(void (**)(char *, uint64_t))(v139 + 8))(v128, v141);
    v145 = v161;
    sub_1000082A0(v140, v161, &qword_100052528);
    v146 = v178;
    sub_100003478(v145, v178, &qword_100052528);
    swift_storeEnumTagMultiPayload(v146, v177, 1);
    v147 = sub_10002C2BC();
    v148 = sub_10002C340();
    v116 = (uint64_t)v175;
    _ConditionalContent<>.init(storage:)(v146, v176, v142, v147, v148);
    sub_1000034BC(v145, &qword_100052528);
    v76 = (uint64_t)v188;
    goto LABEL_12;
  }
  result = _diagnoseUnexpectedEnumCase<A>(type:)(v133, v133, 1.0);
  __break(1u);
  return result;
}

uint64_t sub_100029AB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
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
  char *v20;
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
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(uint64_t, uint64_t, uint64_t);
  char v43;
  id v44;
  uint64_t v45;
  __n128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  _OWORD *v67;
  __int128 v68;
  unint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  __int16 v79;
  uint64_t v80;
  char v81;
  char v82;
  void (*v83)(char *, char *, uint64_t);
  char *v84;
  _QWORD *v85;
  uint64_t v86;
  char *v87;
  void (*v88)(char *, uint64_t);
  _QWORD v90[2];
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  _QWORD *v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  char v111;
  char v112;
  _OWORD v113[3];

  v90[1] = a2;
  v106 = a3;
  v4 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v4);
  v94 = (uint64_t)v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v92 = (uint64_t)v90 - v7;
  v8 = type metadata accessor for StandalonePhoneRingView(0);
  __chkstk_darwin(v8);
  v107 = (_QWORD *)((char *)v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v98 = sub_1000033B8(&qword_1000525A8);
  __chkstk_darwin(v98);
  v97 = (uint64_t)v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = sub_1000033B8(&qword_1000525B0);
  v11 = *(_QWORD *)(v105 - 8);
  __chkstk_darwin(v105);
  v103 = (char *)v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v95 = (char *)v90 - v14;
  __chkstk_darwin(v15);
  v102 = (char *)v90 - v16;
  v17 = type metadata accessor for WidgetFamily(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)v90 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v23 = (char *)v90 - v22;
  v24 = type metadata accessor for StandaloneSummaryView(0);
  __chkstk_darwin(v24);
  v99 = (uint64_t)v90 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  v91 = (uint64_t)v90 - v27;
  __chkstk_darwin(v28);
  v30 = (char *)v90 - v29;
  v31 = sub_10002A2A0();
  v32 = a1;
  sub_100017970(a1, (uint64_t)v30, type metadata accessor for StandaloneSummaryView);
  v100 = v20;
  v101 = v18;
  v104 = v11;
  v93 = v23;
  if ((v31 & 1) != 0)
  {
    sub_100016F6C((uint64_t)v23);
    (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, enum case for WidgetFamily.systemSmall(_:), v17);
    v33 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(v113, v17, v33);
    dispatch thunk of RawRepresentable.rawValue.getter(&v110, v17, v33);
    v34 = *(_QWORD *)&v113[0];
    v35 = v110;
    v36 = *(void (**)(char *, uint64_t))(v18 + 8);
    v36(v20, v17);
    v36(v23, v17);
    sub_1000179B4((uint64_t)v30, type metadata accessor for StandaloneSummaryView);
    if (v34 == v35)
    {
      v96 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    sub_1000179B4((uint64_t)v30, type metadata accessor for StandaloneSummaryView);
  }
  v96 = 1;
LABEL_6:
  v37 = v32;
  v38 = *(void **)(v32 + *(int *)(v24 + 36));
  v39 = v32 + *(int *)(v24 + 40);
  v40 = v92;
  sub_100003478(v39, v92, (uint64_t *)&unk_100051980);
  v41 = type metadata accessor for Date(0);
  v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 48);
  v43 = v42(v40, 1, v41) != 1;
  v44 = v38;
  sub_1000034BC(v40, (uint64_t *)&unk_100051980);
  v45 = v94;
  sub_100003478(v39, v94, (uint64_t *)&unk_100051980);
  LOBYTE(v39) = v42(v45, 1, v41) == 1;
  sub_1000034BC(v45, (uint64_t *)&unk_100051980);
  sub_100022AAC(v38, v43, v39, 0, v107, v46);
  LOBYTE(v38) = sub_10002A2A0();
  v47 = v91;
  sub_100017970(v32, v91, type metadata accessor for StandaloneSummaryView);
  if ((v38 & 1) != 0)
  {
    v48 = sub_1000179B4(v47, type metadata accessor for StandaloneSummaryView);
    v50 = v104;
    v49 = v105;
    v51 = v102;
    v52 = v100;
  }
  else
  {
    v53 = (uint64_t)v93;
    sub_100016F6C((uint64_t)v93);
    v52 = v100;
    v54 = v101;
    (*(void (**)(char *, _QWORD, uint64_t))(v101 + 104))(v100, enum case for WidgetFamily.systemSmall(_:), v17);
    v55 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(v113, v17, v55);
    dispatch thunk of RawRepresentable.rawValue.getter(&v110, v17, v55);
    v56 = *(_QWORD *)&v113[0];
    v57 = v110;
    v58 = *(void (**)(char *, uint64_t))(v54 + 8);
    v58(v52, v17);
    v58((char *)v53, v17);
    v48 = sub_1000179B4(v47, type metadata accessor for StandaloneSummaryView);
    v50 = v104;
    v49 = v105;
    v51 = v102;
    if (v56 == v57)
    {
      v59 = 0;
      v60 = 1;
      goto LABEL_11;
    }
  }
  GeometryProxy.size.getter(v48);
  v60 = 0;
  v59 = v61;
LABEL_11:
  v62 = static Alignment.center.getter(v48);
  _FrameLayout.init(width:height:alignment:)(v113, v59, v60, 0, 1, v62, v63);
  v64 = v107;
  v65 = v97;
  sub_100017970((uint64_t)v107, v97, type metadata accessor for StandalonePhoneRingView);
  v66 = v98;
  v67 = (_OWORD *)(v65 + *(int *)(v98 + 36));
  v68 = v113[1];
  *v67 = v113[0];
  v67[1] = v68;
  v67[2] = v113[2];
  sub_1000179B4((uint64_t)v64, type metadata accessor for StandalonePhoneRingView);
  v69 = sub_10002C430();
  v70 = v95;
  View.widgetAccentable(_:)(1, v66, v69);
  sub_1000034BC(v65, &qword_1000525A8);
  (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v51, v70, v49);
  LOBYTE(v70) = sub_10002A2A0();
  v71 = v37;
  v72 = v99;
  sub_100017970(v71, v99, type metadata accessor for StandaloneSummaryView);
  if ((v70 & 1) != 0)
  {
    sub_1000179B4(v72, type metadata accessor for StandaloneSummaryView);
LABEL_15:
    v108 = 0;
    v79 = 256;
    goto LABEL_16;
  }
  v73 = (uint64_t)v93;
  sub_100016F6C((uint64_t)v93);
  v74 = v101;
  (*(void (**)(char *, _QWORD, uint64_t))(v101 + 104))(v52, enum case for WidgetFamily.systemSmall(_:), v17);
  v75 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(&v110, v17, v75);
  dispatch thunk of RawRepresentable.rawValue.getter(&v108, v17, v75);
  v76 = v110;
  v77 = v108;
  v78 = *(void (**)(char *, uint64_t))(v74 + 8);
  v78(v52, v17);
  v78((char *)v73, v17);
  sub_1000179B4(v72, type metadata accessor for StandaloneSummaryView);
  if (v76 != v77)
    goto LABEL_15;
  v108 = 0;
  v79 = 1;
LABEL_16:
  v109 = v79;
  _ConditionalContent<>.init(storage:)(&v108, &type metadata for Spacer, &type metadata for Spacer, &protocol witness table for Spacer, &protocol witness table for Spacer);
  v80 = v110;
  v81 = v111;
  v82 = v112;
  v83 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
  v84 = v103;
  v83(v103, v51, v49);
  v85 = v106;
  *v106 = 0;
  *((_BYTE *)v85 + 8) = 0;
  *((_BYTE *)v85 + 9) = v96;
  v86 = sub_1000033B8(&qword_1000525C0);
  v83((char *)v85 + *(int *)(v86 + 48), v84, v49);
  v87 = (char *)v85 + *(int *)(v86 + 64);
  *(_QWORD *)v87 = v80;
  v87[8] = v81;
  v87[9] = v82;
  v88 = *(void (**)(char *, uint64_t))(v50 + 8);
  v88(v51, v49);
  return ((uint64_t (*)(char *, uint64_t))v88)(v84, v49);
}

uint64_t sub_10002A2A0()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = v0;
  v2 = type metadata accessor for DynamicTypeSize(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v8 = (char *)&v28 - v7;
  v9 = type metadata accessor for WidgetFamily(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v28 - v14;
  if ((*(_BYTE *)(v1 + *(int *)(type metadata accessor for StandaloneSummaryView(0) + 24)) & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    v29 = v5;
    v30 = v3;
    v31 = v2;
    sub_100016F6C((uint64_t)v15);
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for WidgetFamily.systemSmall(_:), v9);
    v17 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(&v33, v9, v17);
    dispatch thunk of RawRepresentable.rawValue.getter(&v32, v9, v17);
    v18 = v32;
    v19 = v33;
    v20 = *(void (**)(char *, uint64_t))(v10 + 8);
    v20(v12, v9);
    v20(v15, v9);
    v21 = sub_100016F9C((uint64_t)v8);
    if (v19 == v18)
    {
      v16 = DynamicTypeSize.isAccessibilitySize.getter(v21);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v31);
    }
    else
    {
      v23 = v29;
      v22 = v30;
      v24 = v31;
      (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v29, enum case for DynamicTypeSize.accessibility2(_:), v31);
      v25 = sub_100008304(&qword_100051D78, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t)&protocol conformance descriptor for DynamicTypeSize);
      v16 = dispatch thunk of static Comparable.< infix(_:_:)(v8, v23, v24, v25) ^ 1;
      v26 = *(void (**)(char *, uint64_t))(v22 + 8);
      v26(v23, v24);
      v26(v8, v24);
    }
  }
  return v16 & 1;
}

__n128 sub_10002A4F0@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __n128 result;
  unsigned int v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _OWORD v44[7];

  v16 = v15;
  v18 = a15;
  v19 = a12;
  v20 = a10;
  v21 = a2 & 1;
  v22 = a1;
  if ((_DWORD)v21)
    v22 = -INFINITY;
  v23 = a4 & 1;
  v24 = a3;
  if ((a4 & 1) != 0)
    v24 = v22;
  v25 = a6 & 1;
  v26 = a8 & 1;
  v27 = a5;
  if ((a6 & 1) != 0)
    v27 = v24;
  if (v22 > v24 || v24 > v27)
    goto LABEL_22;
  v29 = a7;
  if ((a8 & 1) != 0)
    v29 = -INFINITY;
  v30 = a10;
  if ((a11 & 1) != 0)
    v30 = v29;
  v31 = a12;
  if ((a13 & 1) != 0)
    v31 = v30;
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    v42 = a5;
    v43 = a7;
    v41 = a3;
    v40 = a1;
    v39 = v21;
    v33 = static os_log_type_t.fault.getter(*(_QWORD *)&a1);
    v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v34, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v18 = a15;
    v21 = v39;
    a1 = v40;
    v20 = a10;
    a3 = v41;
    v19 = a12;
    a5 = v42;
    a7 = v43;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v44, *(_QWORD *)&a1, v21, *(_QWORD *)&a3, v23, *(_QWORD *)&a5, v25, *(_QWORD *)&a7, v26, *(_QWORD *)&v20, a11 & 1, *(_QWORD *)&v19, a13 & 1, a14, v18);
  sub_100003478(v16, a9, &qword_100052550);
  v35 = a9 + *(int *)(sub_1000033B8(&qword_100052558) + 36);
  v36 = v44[5];
  *(_OWORD *)(v35 + 64) = v44[4];
  *(_OWORD *)(v35 + 80) = v36;
  *(_OWORD *)(v35 + 96) = v44[6];
  v37 = v44[1];
  *(_OWORD *)v35 = v44[0];
  *(_OWORD *)(v35 + 16) = v37;
  result = (__n128)v44[3];
  *(_OWORD *)(v35 + 32) = v44[2];
  *(__n128 *)(v35 + 48) = result;
  return result;
}

uint64_t sub_10002A6AC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v33;
  double v34;
  double v35;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  unsigned int v43;
  unsigned int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _OWORD v49[7];

  v20 = a17;
  v19 = a18;
  v21 = a15;
  v22 = a14;
  v23 = a12;
  v24 = a10;
  v25 = a2 & 1;
  v26 = a1;
  if ((_DWORD)v25)
    v26 = -INFINITY;
  v27 = a4 & 1;
  v28 = a3;
  if ((_DWORD)v27)
    v28 = v26;
  v29 = a6 & 1;
  v30 = a8 & 1;
  v31 = a5;
  if ((a6 & 1) != 0)
    v31 = v28;
  if (v26 > v28 || v28 > v31)
    goto LABEL_22;
  v33 = a7;
  if ((a8 & 1) != 0)
    v33 = -INFINITY;
  v34 = a10;
  if ((a11 & 1) != 0)
    v34 = v33;
  v35 = a12;
  if ((a13 & 1) != 0)
    v35 = v34;
  if (v33 > v34 || v34 > v35)
  {
LABEL_22:
    v47 = a5;
    v48 = a7;
    v45 = a3;
    v46 = a1;
    v44 = v25;
    v43 = v27;
    v37 = static os_log_type_t.fault.getter();
    v38 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v37, &_mh_execute_header, v38, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v27 = v43;
    v22 = a14;
    v21 = a15;
    v25 = v44;
    v24 = a10;
    v23 = a12;
    a3 = v45;
    a1 = v46;
    a5 = v47;
    a7 = v48;
    v20 = a17;
    v19 = a18;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v49, *(_QWORD *)&a1, v25, *(_QWORD *)&a3, v27, *(_QWORD *)&a5, v29, *(_QWORD *)&a7, v30, *(_QWORD *)&v24, a11 & 1, *(_QWORD *)&v23, a13 & 1, v22, v21);
  v39 = v49[2];
  *(_OWORD *)(a9 + 72) = v49[3];
  v40 = v49[5];
  *(_OWORD *)(a9 + 88) = v49[4];
  *(_OWORD *)(a9 + 104) = v40;
  *(_OWORD *)(a9 + 120) = v49[6];
  v41 = v49[1];
  *(_OWORD *)(a9 + 24) = v49[0];
  *(_OWORD *)(a9 + 40) = v41;
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v20;
  *(_QWORD *)(a9 + 16) = v19;
  *(_OWORD *)(a9 + 56) = v39;
  swift_retain(v19);
  swift_retain(a16);
  return swift_retain(v20);
}

_QWORD *sub_10002A880@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  __int128 *v15;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v28;
  double v29;
  double v30;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unsigned int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _OWORD v46[7];
  __int128 v47;
  char v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  _BYTE v52[32];

  v17 = a15;
  v18 = a12;
  v19 = a10;
  v20 = a2 & 1;
  v21 = a1;
  if ((_DWORD)v20)
    v21 = -INFINITY;
  v22 = a4 & 1;
  v23 = a3;
  if ((a4 & 1) != 0)
    v23 = v21;
  v24 = a6 & 1;
  v25 = a8 & 1;
  v26 = a5;
  if ((a6 & 1) != 0)
    v26 = v23;
  if (v21 > v23 || v23 > v26)
    goto LABEL_22;
  v28 = a7;
  if ((a8 & 1) != 0)
    v28 = -INFINITY;
  v29 = a10;
  if ((a11 & 1) != 0)
    v29 = v28;
  v30 = a12;
  if ((a13 & 1) != 0)
    v30 = v29;
  if (v28 > v29 || v29 > v30)
  {
LABEL_22:
    v44 = a5;
    v45 = a7;
    v43 = a3;
    v42 = a1;
    v41 = v20;
    v32 = static os_log_type_t.fault.getter(*(_QWORD *)&a1);
    v33 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)(v32, &_mh_execute_header, v33, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v17 = a15;
    v20 = v41;
    v19 = a10;
    a1 = v42;
    a3 = v43;
    v18 = a12;
    a5 = v44;
    a7 = v45;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(v46, *(_QWORD *)&a1, v20, *(_QWORD *)&a3, v22, *(_QWORD *)&a5, v24, *(_QWORD *)&a7, v25, *(_QWORD *)&v19, a11 & 1, *(_QWORD *)&v18, a13 & 1, a14, v17);
  v34 = v15[1];
  v49 = *v15;
  v50 = v34;
  sub_10002C4E0((uint64_t)&v49, (uint64_t)v52);
  v36 = v15[1];
  v47 = v15[2];
  v35 = v47;
  *(_OWORD *)a9 = *v15;
  *(_OWORD *)(a9 + 16) = v36;
  *(_OWORD *)(a9 + 32) = v35;
  *(_OWORD *)(a9 + 152) = v46[6];
  v37 = v46[4];
  *(_OWORD *)(a9 + 136) = v46[5];
  *(_OWORD *)(a9 + 120) = v37;
  v38 = v46[2];
  *(_OWORD *)(a9 + 104) = v46[3];
  v39 = v46[1];
  *(_OWORD *)(a9 + 56) = v46[0];
  v51 = *((_QWORD *)&v50 + 1);
  v48 = *((_BYTE *)v15 + 48);
  *(_BYTE *)(a9 + 48) = v48;
  *(_OWORD *)(a9 + 72) = v39;
  *(_OWORD *)(a9 + 88) = v38;
  sub_10002C51C((uint64_t)v52);
  sub_10002233C(&v51);
  return sub_1000226F0(&v47);
}

BOOL sub_10002AA64()
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
  char *v10;
  char v11;
  uint64_t v12;
  _BOOL8 v13;
  void (*v14)(char *, uint64_t);
  uint64_t v16;
  uint64_t v17;

  v1 = type metadata accessor for WidgetFamily(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - v6;
  v8 = type metadata accessor for StandaloneSummaryView(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10002A2A0();
  sub_100017970(v0, (uint64_t)v10, type metadata accessor for StandaloneSummaryView);
  if ((v11 & 1) != 0)
  {
    sub_100016F6C((uint64_t)v7);
    (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for WidgetFamily.systemSmall(_:), v1);
    v12 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(&v17, v1, v12);
    dispatch thunk of RawRepresentable.rawValue.getter(&v16, v1, v12);
    v13 = v17 == v16;
    v14 = *(void (**)(char *, uint64_t))(v2 + 8);
    v14(v4, v1);
    v14(v7, v1);
  }
  else
  {
    v13 = 0;
  }
  sub_1000179B4((uint64_t)v10, type metadata accessor for StandaloneSummaryView);
  return v13;
}

uint64_t sub_10002ABFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  char v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int *v16;
  uint64_t v18;
  uint64_t v19;

  v2 = type metadata accessor for WidgetFamily(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v8 = (char *)&v18 - v7;
  sub_100016F6C((uint64_t)&v18 - v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for WidgetFamily.systemSmall(_:), v2);
  v9 = sub_100008304((unint64_t *)&qword_100051398, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(&v19, v2, v9);
  dispatch thunk of RawRepresentable.rawValue.getter(&v18, v2, v9);
  v11 = v18;
  v10 = v19;
  v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v5, v2);
  v12(v8, v2);
  v13 = sub_10002A2A0();
  v14 = type metadata accessor for DynamicTypeSize(0);
  v15 = (unsigned int *)&enum case for DynamicTypeSize.accessibility5(_:);
  if ((v13 & 1) == 0)
    v15 = (unsigned int *)&enum case for DynamicTypeSize.large(_:);
  v16 = (unsigned int *)&enum case for DynamicTypeSize.accessibility1(_:);
  if ((v13 & 1) == 0)
    v16 = (unsigned int *)&enum case for DynamicTypeSize.xxLarge(_:);
  if (v10 != v11)
    v15 = v16;
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(a1, *v15, v14);
}

uint64_t sub_10002AD88@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(a1);
  sub_100017970(v2, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for StandaloneSummaryView);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_10004F618, v7 + v5, v6 | 7);
  result = sub_10002BF68((uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  *a2 = sub_10002BFAC;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v8;
  return result;
}

_QWORD *sub_10002AE3C(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int (*v32)(char *, uint64_t, uint64_t);
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  char *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = (_QWORD *)((char *)a1 + v14);
    v16 = (_QWORD *)((char *)a2 + v14);
    v17 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = a3[7];
    *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    v24 = *(void **)((char *)a2 + v23);
    *(_QWORD *)((char *)a1 + v23) = v24;
    v25 = a3[9];
    *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
    v26 = *(void **)((char *)a2 + v25);
    *(_QWORD *)((char *)a1 + v25) = v26;
    v27 = a3[10];
    v28 = (char *)a1 + v27;
    v29 = (char *)a2 + v27;
    v30 = type metadata accessor for Date(0);
    v31 = *(_QWORD *)(v30 - 8);
    v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48);
    v33 = v24;
    v34 = v26;
    if (v32(v29, 1, v30))
    {
      v35 = sub_1000033B8((uint64_t *)&unk_100051980);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
    }
    v36 = a3[11];
    v37 = (_QWORD *)((char *)a1 + v36);
    v38 = (char *)a2 + v36;
    v39 = *(void **)v38;
    v40 = (void *)*((_QWORD *)v38 + 1);
    *v37 = *(_QWORD *)v38;
    v37[1] = v40;
    v41 = *((_QWORD *)v38 + 3);
    v37[2] = *((_QWORD *)v38 + 2);
    v37[3] = v41;
    v42 = v39;
    v43 = v40;
    swift_bridgeObjectRetain(v41);
  }
  return a1;
}

double sub_10002B07C(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  double result;

  v4 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + a2[5]);
  v7 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }

  v9 = (char *)a1 + a2[10];
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  v12 = (id *)((char *)a1 + a2[11]);

  *(_QWORD *)&result = swift_bridgeObjectRelease(v12[3]).n128_u64[0];
  return result;
}

_QWORD *sub_10002B1B8(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(char *, uint64_t, uint64_t);
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;

  v6 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = a3[7];
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v22 = *(void **)((char *)a2 + v21);
  *(_QWORD *)((char *)a1 + v21) = v22;
  v23 = a3[9];
  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  v24 = *(void **)((char *)a2 + v23);
  *(_QWORD *)((char *)a1 + v23) = v24;
  v25 = a3[10];
  v26 = (char *)a1 + v25;
  v27 = (char *)a2 + v25;
  v28 = type metadata accessor for Date(0);
  v29 = *(_QWORD *)(v28 - 8);
  v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  v31 = v22;
  v32 = v24;
  if (v30(v27, 1, v28))
  {
    v33 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  v34 = a3[11];
  v35 = (_QWORD *)((char *)a1 + v34);
  v36 = (char *)a2 + v34;
  v37 = *(void **)v36;
  v38 = (void *)*((_QWORD *)v36 + 1);
  *v35 = *(_QWORD *)v36;
  v35[1] = v38;
  v39 = *((_QWORD *)v36 + 3);
  v35[2] = *((_QWORD *)v36 + 2);
  v35[3] = v39;
  v40 = v37;
  v41 = v38;
  swift_bridgeObjectRetain(v39);
  return a1;
}

_QWORD *sub_10002B3CC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B88);
    v6 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = a3[5];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    sub_1000034BC((uint64_t)a1 + v12, &qword_100051B90);
    v15 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v21 = a3[7];
  v22 = *(void **)((char *)a2 + v21);
  v23 = *(void **)((char *)a1 + v21);
  *(_QWORD *)((char *)a1 + v21) = v22;
  v24 = v22;

  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  v25 = a3[9];
  v26 = *(void **)((char *)a1 + v25);
  v27 = *(void **)((char *)a2 + v25);
  *(_QWORD *)((char *)a1 + v25) = v27;
  v28 = v27;

  v29 = a3[10];
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = type metadata accessor for Date(0);
  v33 = *(_QWORD *)(v32 - 8);
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
  v35 = v34(v30, 1, v32);
  v36 = v34(v31, 1, v32);
  if (!v35)
  {
    if (!v36)
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 24))(v30, v31, v32);
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v33 + 8))(v30, v32);
    goto LABEL_14;
  }
  if (v36)
  {
LABEL_14:
    v37 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    goto LABEL_15;
  }
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
LABEL_15:
  v38 = a3[11];
  v39 = (char *)a1 + v38;
  v40 = (char *)a2 + v38;
  v41 = *(void **)v40;
  v42 = *(void **)v39;
  *(_QWORD *)v39 = *(_QWORD *)v40;
  v43 = v41;

  v44 = (void *)*((_QWORD *)v39 + 1);
  v45 = (void *)*((_QWORD *)v40 + 1);
  *((_QWORD *)v39 + 1) = v45;
  v46 = v45;

  *((_QWORD *)v39 + 2) = *((_QWORD *)v40 + 2);
  v47 = *((_QWORD *)v40 + 3);
  v48 = *((_QWORD *)v39 + 3);
  *((_QWORD *)v39 + 3) = v47;
  swift_bridgeObjectRetain(v47);
  swift_bridgeObjectRelease(v48);
  return a1;
}

char *sub_10002B68C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  __int128 v24;

  v6 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];
  v14 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  *(_QWORD *)&a1[v14] = *(_QWORD *)&a2[v14];
  v15 = a3[10];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = type metadata accessor for Date(0);
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  v21 = a3[11];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = *((_OWORD *)v23 + 1);
  *(_OWORD *)v22 = *(_OWORD *)v23;
  *((_OWORD *)v22 + 1) = v24;
  return a1;
}

char *sub_10002B870(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B88);
    v6 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_1000034BC((uint64_t)&a1[v8], &qword_100051B90);
    v11 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  v14 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];

  v15 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  v16 = *(void **)&a1[v15];
  *(_QWORD *)&a1[v15] = *(_QWORD *)&a2[v15];

  v17 = a3[10];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = type metadata accessor for Date(0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  v23 = v22(v18, 1, v20);
  v24 = v22(v19, 1, v20);
  if (!v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v18, v19, v20);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
    goto LABEL_13;
  }
  if (v24)
  {
LABEL_13:
    v25 = sub_1000033B8((uint64_t *)&unk_100051980);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
LABEL_14:
  v26 = a3[11];
  v27 = &a1[v26];
  v28 = &a2[v26];
  v29 = *(void **)&a1[v26];
  *(_QWORD *)&a1[v26] = *(_QWORD *)v28;

  v30 = (void *)*((_QWORD *)v27 + 1);
  *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);

  v31 = *((_QWORD *)v28 + 3);
  v32 = *((_QWORD *)v27 + 3);
  *((_QWORD *)v27 + 2) = *((_QWORD *)v28 + 2);
  *((_QWORD *)v27 + 3) = v31;
  swift_bridgeObjectRelease(v32);
  return a1;
}

uint64_t sub_10002BB00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002BB0C);
}

uint64_t sub_10002BB0C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v6 = sub_1000033B8(&qword_100051B98);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_1000033B8(&qword_100051BA0);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_10:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_1000033B8((uint64_t *)&unk_100051980);
    v12 = *(_QWORD *)(v8 - 8);
    v13 = a3[10];
    goto LABEL_10;
  }
  v14 = *(_QWORD *)(a1 + a3[7]);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_10002BBE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002BBF0);
}

uint64_t sub_10002BBF0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_1000033B8(&qword_100051B98);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_1000033B8(&qword_100051BA0);
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(_QWORD *)(a1 + a4[7]) = (a2 - 1);
        return result;
      }
      v10 = sub_1000033B8((uint64_t *)&unk_100051980);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[10];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_10002BCC4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[8];

  sub_100014804(319, &qword_100051C10, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100014804(319, (unint64_t *)&unk_100051C18, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v5 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(v4 - 8) + 64;
      v8[2] = &unk_100040FC8;
      v8[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
      v8[4] = &unk_100040FC8;
      v8[5] = &unk_100040FE0;
      sub_100014804(319, (unint64_t *)&qword_100051720, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
      if (v7 <= 0x3F)
      {
        v8[6] = *(_QWORD *)(v6 - 8) + 64;
        v8[7] = &unk_100040FF8;
        swift_initStructMetadata(a1, 256, 8, v8, a1 + 16);
      }
    }
  }
}

uint64_t sub_10002BDD8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004228C, 1);
}

uint64_t sub_10002BDE8()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;

  v1 = (int *)type metadata accessor for StandaloneSummaryView(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (_QWORD *)((char *)v6 + v1[5]);
  v10 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
  }
  else
  {
    swift_release(*v9);
  }

  v12 = (char *)v6 + v1[10];
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
  v15 = (id *)((char *)v6 + v1[11]);

  swift_bridgeObjectRelease(v15[3]);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10002BF68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StandaloneSummaryView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002BFAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for StandaloneSummaryView(0) - 8) + 80);
  return sub_100028714(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_10002BFF8()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  __n128 v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = (int *)type metadata accessor for StandaloneSummaryView(0);
  v3 = *((_QWORD *)v2 - 1);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = (v4 + 16) & ~v4;
  v6 = *(_QWORD *)(v3 + 64);
  v7 = type metadata accessor for GeometryProxy(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 64);
  v11 = (_QWORD *)(v1 + v5);
  v12 = sub_1000033B8(&qword_100051B88);
  v25 = v6;
  if (swift_getEnumCaseMultiPayload(v1 + v5, v12) == 1)
  {
    v13 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v1 + v5, v13);
  }
  else
  {
    swift_release(*v11);
  }
  v14 = (_QWORD *)((char *)v11 + v2[5]);
  v15 = sub_1000033B8(&qword_100051B90);
  v26 = v7;
  v24 = v1;
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v14, v16);
  }
  else
  {
    swift_release(*v14);
  }

  v17 = (char *)v11 + v2[10];
  v18 = type metadata accessor for Date(0);
  v19 = *(_QWORD *)(v18 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
  v20 = (v5 + v25 + v9) & ~v9;
  v21 = (id *)((char *)v11 + v2[11]);

  v22 = swift_bridgeObjectRelease(v21[3]);
  (*(void (**)(uint64_t, uint64_t, __n128))(v8 + 8))(v24 + v20, v26, v22);
  return swift_deallocObject(v24, v20 + v10, v4 | v9 | 7);
}

uint64_t sub_10002C1D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;

  v3 = *(_QWORD *)(type metadata accessor for StandaloneSummaryView(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for GeometryProxy(0) - 8) + 80);
  return sub_100028BE4(v1 + v4, v1 + ((v4 + v5 + v6) & ~v6), a1, v7);
}

unint64_t sub_10002C238()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052578;
  if (!qword_100052578)
  {
    v1 = sub_1000036E4(&qword_100052558);
    sub_100003928(&qword_100052580, &qword_100052550, (uint64_t)&protocol conformance descriptor for HStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052578);
  }
  return result;
}

unint64_t sub_10002C2BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052590;
  if (!qword_100052590)
  {
    v1 = sub_1000036E4(&qword_100052538);
    sub_100008304(&qword_100051D58, type metadata accessor for PauseRingsLabel, (uint64_t)&unk_100040590);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052590);
  }
  return result;
}

unint64_t sub_10002C340()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_100052598;
  if (!qword_100052598)
  {
    v1 = sub_1000036E4(&qword_100052528);
    v2[0] = type metadata accessor for StandaloneMetricsStack(255);
    v2[1] = sub_1000036E4(&qword_100051CC0);
    v2[2] = sub_100008304(&qword_100052588, type metadata accessor for StandaloneMetricsStack, (uint64_t)&unk_100041898);
    v2[3] = sub_100003928(&qword_100051CD0, &qword_100051CC0, (uint64_t)&protocol conformance descriptor for PartialRangeThrough<A>);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.dynamicTypeSize<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052598);
  }
  return result;
}

unint64_t sub_10002C430()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000525B8;
  if (!qword_1000525B8)
  {
    v1 = sub_1000036E4(&qword_1000525A8);
    sub_100008304(&qword_100051B60, type metadata accessor for StandalonePhoneRingView, (uint64_t)&unk_100040BB4);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000525B8);
  }
  return result;
}

uint64_t sub_10002C4B4()
{
  return sub_100003928(&qword_1000525C8, &qword_1000525D0, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t sub_10002C4E0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for Text.Storage - 1) + 32))(a2, a1);
  return a2;
}

uint64_t sub_10002C51C(uint64_t a1)
{
  sub_10000C8C8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  return a1;
}

id sub_10002C54C@<X0>(uint64_t a1@<X8>)
{
  __n128 v2;
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
  uint64_t v17;
  uint64_t v18;
  id result;
  void *v20;
  unsigned int v21;
  __n128 v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t OpaqueTypeConformance2;
  uint64_t v48;
  _QWORD *v49;
  __n128 v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  __n128 v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  __n128 v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  void *v110;
  id v111;
  NSString v112;
  NSString v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  void *v119;
  void *v120;
  Swift::String v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _QWORD *v140;
  char v141;
  id v142;
  NSString v143;
  NSString v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char v165;
  uint64_t v166;
  __n128 v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char v174;
  uint64_t v175;
  __n128 v176;
  uint64_t v177;
  uint64_t v178;
  _QWORD *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  char v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  char v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  char v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  char v206;
  uint64_t v207;
  __n128 v208;
  char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  char v216;
  __n128 v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  char v224;
  uint64_t v225;
  uint64_t v226;
  unint64_t v227;
  unint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  uint64_t v235;
  uint64_t v236;
  char *v237;
  char *v238;
  _QWORD *v239;
  uint64_t v240;
  char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  char *v247;
  uint64_t v248;
  uint64_t v249;
  unint64_t v250;
  _QWORD *v251;
  __int128 v252;
  _BYTE v253[24];
  __int128 v254;
  uint64_t v255;
  char v256;
  uint64_t v257;
  _QWORD v258[2];

  v243 = type metadata accessor for ContentTransition(0);
  v242 = *(_QWORD *)(v243 - 8);
  v2 = __chkstk_darwin(v243);
  v241 = (char *)&v229 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v248 = type metadata accessor for Text.Scale(0, v2);
  v240 = *(_QWORD *)(v248 - 8);
  __chkstk_darwin(v248);
  v247 = (char *)&v229 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000033B8(&qword_1000525D8);
  __chkstk_darwin(v5);
  v7 = (char *)&v229 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000033B8(&qword_1000525E0);
  __chkstk_darwin(v8);
  v10 = (char *)&v229 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for AccessibilityChildBehavior(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v229 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v239 = (_QWORD *)sub_1000033B8(&qword_1000525E8);
  v238 = (char *)*(v239 - 1);
  __chkstk_darwin(v239);
  v237 = (char *)&v229 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v249 = sub_1000033B8(&qword_1000525F0);
  __chkstk_darwin(v249);
  v236 = (uint64_t)&v229 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v250 = (unint64_t)&v229 - v18;
  result = objc_msgSend((id)objc_opt_self(_HKBehavior), "sharedBehavior");
  if (result)
  {
    v20 = result;
    v21 = objc_msgSend(result, "isStandalonePhoneFitnessMode");

    v246 = a1;
    v245 = v5;
    v244 = v8;
    if (v21)
    {
      v23 = static VerticalAlignment.center.getter(v22);
      sub_10002D498((uint64_t)v251, (uint64_t *)&v252);
      v24 = *(_QWORD *)&v253[16];
      v25 = v254;
      v26 = *((_QWORD *)&v254 + 1);
      v27 = *(_OWORD *)v253;
      v28 = v252;
      v252 = (unint64_t)v23;
      v253[0] = 0;
      *(_OWORD *)&v253[8] = v28;
      v254 = v27;
      v255 = v24;
      v256 = v25;
      v257 = v26;
      static AccessibilityChildBehavior.ignore.getter(v29);
      v30 = sub_1000033B8(&qword_100052600);
      v31 = sub_10002EBA4();
      v32 = v237;
      View.accessibilityElement(children:)(v14, v30, v31);
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      v33 = *(_QWORD *)&v253[8];
      v34 = v254;
      v35 = v255;
      v36 = v256;
      v37 = v257;
      swift_release(*(_QWORD *)&v253[16]);
      swift_release(v33);
      swift_release(v34);
      sub_100008E84(*((uint64_t *)&v34 + 1), v35, v36);
      swift_bridgeObjectRelease(v37);
      *(_QWORD *)&v252 = sub_10002DA60();
      *((_QWORD *)&v252 + 1) = v38;
      v39 = sub_100008E40();
      v40 = Text.init<A>(_:)(&v252, &type metadata for String, v39);
      v42 = v41;
      v44 = v43;
      v46 = v45 & 1;
      *(_QWORD *)&v252 = v30;
      *((_QWORD *)&v252 + 1) = v31;
      OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v252, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
      v48 = v236;
      v49 = v239;
      View.accessibility(label:)(v40, v42, v46, v44, v239, OpaqueTypeConformance2);
      sub_100008E84(v40, v42, v46);
      v50 = swift_bridgeObjectRelease(v44);
      (*((void (**)(char *, _QWORD *, __n128))v238 + 1))(v32, v49, v50);
      v51 = v250;
      sub_1000082A0(v48, v250, &qword_1000525F0);
      sub_100003478(v51, (uint64_t)v10, &qword_1000525F0);
      swift_storeEnumTagMultiPayload(v10, v244, 0);
      v52 = sub_10002EB10();
      v53 = sub_10002EBF0();
      _ConditionalContent<>.init(storage:)(v10, v249, v245, v52, v53);
      v54 = v51;
      v55 = &qword_1000525F0;
    }
    else
    {
      v238 = v10;
      v56 = (void *)v251[3];
      v57 = v251[5];
      v58 = v251[6];
      v239 = (_QWORD *)v251[4];
      v236 = v57;
      v235 = v58;
      sub_10003AEBC(v56, v239, v57, v58);
      *(_QWORD *)&v252 = v59;
      *((_QWORD *)&v252 + 1) = v60;
      v61 = sub_100008E40();
      v62 = Text.init<A>(_:)(&v252, &type metadata for String, v61);
      v64 = v63;
      v66 = v65;
      v68 = v67;
      if (qword_1000511C0 != -1)
        swift_once(&qword_1000511C0, sub_10002E4F4);
      v237 = v7;
      v69 = Text.font(_:)(qword_1000548E8, v62, v64, v66 & 1, v68);
      v229 = v70;
      LODWORD(v233) = v71;
      v230 = v72;
      sub_100008E84(v62, v64, v66 & 1);
      swift_bridgeObjectRelease(v68);
      v73 = sub_10003BDC4(v56, v239);
      v75 = v74;
      *(_QWORD *)&v252 = v73;
      *((_QWORD *)&v252 + 1) = v74;
      v76 = StringProtocol.localizedUppercase.getter(&type metadata for String, v61);
      v78 = v77;
      swift_bridgeObjectRelease(v75);
      *(_QWORD *)&v252 = v76;
      *((_QWORD *)&v252 + 1) = v78;
      v79 = Text.init<A>(_:)(&v252, &type metadata for String, v61);
      v81 = v80;
      v83 = v82;
      v85 = v84;
      v250 = v61;
      v234 = v56;
      if (qword_1000511B8 != -1)
        swift_once(&qword_1000511B8, sub_10002E3AC);
      v86 = v83 & 1;
      v87 = Text.font(_:)(qword_1000548E0, v79, v81, v86, v85);
      v89 = v88;
      v91 = v90;
      v93 = v92 & 1;
      sub_100008E84(v79, v81, v86);
      v94 = swift_bridgeObjectRelease(v85);
      v95 = v247;
      static Text.Scale.secondary.getter(v94);
      v96 = Text.textScale(_:isEnabled:)(v95, 1, v87, v89, v93, v91);
      v98 = v97;
      v100 = v99;
      v102 = v101 & 1;
      sub_100008E84(v87, v89, v93);
      v103 = swift_bridgeObjectRelease(v91);
      v240 = *(_QWORD *)(v240 + 8);
      ((void (*)(char *, uint64_t, __n128))v240)(v95, v248, v103);
      LOBYTE(v93) = v233 & 1;
      v104 = v229;
      v105 = v230;
      v232 = static Text.+ infix(_:_:)(v69, v229, v233 & 1, v230, v96, v98, v102, v100);
      v231 = v106;
      v233 = v107;
      v109 = v108 & 1;
      sub_100008E84(v96, v98, v102);
      swift_bridgeObjectRelease(v100);
      sub_100008E84(v69, v104, v93);
      swift_bridgeObjectRelease(v105);
      v110 = (void *)objc_opt_self(NSBundle);
      v111 = objc_msgSend(v110, "mainBundle");
      v112 = String._bridgeToObjectiveC()();
      v113 = String._bridgeToObjectiveC()();
      v114 = objc_msgSend(v111, "localizedStringForKey:value:table:", v112, 0, v113);

      v115 = static String._unconditionallyBridgeFromObjectiveC(_:)(v114);
      v117 = v116;

      v118 = sub_10003B00C(v234, v239, v236, v235);
      v120 = v119;
      *(_QWORD *)&v252 = v115;
      *((_QWORD *)&v252 + 1) = v117;
      swift_bridgeObjectRetain(v117);
      v121._countAndFlagsBits = (uint64_t)v118;
      v121._object = v120;
      String.append(_:)(v121);
      swift_bridgeObjectRelease(v117);
      swift_bridgeObjectRelease(v120);
      v122 = Text.init<A>(_:)(&v252, &type metadata for String, v250);
      v124 = v123;
      v126 = v125;
      v128 = v127 & 1;
      v129 = Text.font(_:)(qword_1000548E8, v122, v123, v128, v125);
      v131 = v130;
      v133 = v132;
      v135 = v134 & 1;
      sub_100008E84(v122, v124, v128);
      swift_bridgeObjectRelease(v126);
      v136 = v232;
      v137 = v231;
      v138 = v233;
      v236 = static Text.+ infix(_:_:)(v232, v231, v109, v233, v129, v131, v135, v133);
      v235 = v139;
      v239 = v140;
      LODWORD(v234) = v141 & 1;
      sub_100008E84(v129, v131, v135);
      swift_bridgeObjectRelease(v133);
      sub_100008E84(v136, v137, v109);
      v142 = objc_msgSend(v110, "mainBundle", swift_bridgeObjectRelease(v138).n128_f64[0]);
      v143 = String._bridgeToObjectiveC()();
      v144 = String._bridgeToObjectiveC()();
      v145 = objc_msgSend(v142, "localizedStringForKey:value:table:", v143, 0, v144);

      v146 = static String._unconditionallyBridgeFromObjectiveC(_:)(v145);
      v148 = v147;

      *(_QWORD *)&v252 = v146;
      *((_QWORD *)&v252 + 1) = v148;
      v149 = v250;
      v150 = StringProtocol.localizedUppercase.getter(&type metadata for String, v250);
      v152 = v151;
      swift_bridgeObjectRelease(v148);
      *(_QWORD *)&v252 = v150;
      *((_QWORD *)&v252 + 1) = v152;
      v153 = Text.init<A>(_:)(&v252, &type metadata for String, v149);
      v155 = v154;
      v157 = v156;
      v159 = v158 & 1;
      v160 = Text.font(_:)(qword_1000548E0, v153, v154, v159, v156);
      v162 = v161;
      v164 = v163;
      v166 = v165 & 1;
      sub_100008E84(v153, v155, v159);
      v167 = swift_bridgeObjectRelease(v157);
      v168 = v247;
      static Text.Scale.secondary.getter(v167);
      v169 = Text.textScale(_:isEnabled:)(v168, 1, v160, v162, v166, v164);
      v171 = v170;
      v173 = v172;
      v175 = v174 & 1;
      sub_100008E84(v160, v162, v166);
      v176 = swift_bridgeObjectRelease(v164);
      ((void (*)(char *, uint64_t, __n128))v240)(v168, v248, v176);
      v177 = v236;
      v178 = v235;
      LOBYTE(v166) = (_BYTE)v234;
      v179 = v239;
      v180 = static Text.+ infix(_:_:)(v236, v235, v234, v239, v169, v171, v175, v173);
      v233 = v180;
      v182 = v181;
      v248 = v183;
      LODWORD(v247) = v184 & 1;
      sub_100008E84(v169, v171, v175);
      swift_bridgeObjectRelease(v173);
      sub_100008E84(v177, v178, v166);
      swift_bridgeObjectRelease(v179);
      *(_QWORD *)&v252 = sub_10002DC80();
      *((_QWORD *)&v252 + 1) = v185;
      v186 = Text.init<A>(_:)(&v252, &type metadata for String, v250);
      v188 = v187;
      v190 = v189;
      v192 = v191 & 1;
      v193 = Text.font(_:)(qword_1000548E8, v186, v187, v192, v189);
      v195 = v194;
      v197 = v196;
      v199 = v198 & 1;
      sub_100008E84(v186, v188, v192);
      swift_bridgeObjectRelease(v190);
      v200 = v180;
      LOBYTE(v192) = (_BYTE)v247;
      v201 = v248;
      v202 = static Text.+ infix(_:_:)(v200, v182, v247, v248, v193, v195, v199, v197);
      v204 = v203;
      v240 = v205;
      v207 = v206 & 1;
      sub_100008E84(v193, v195, v199);
      swift_bridgeObjectRelease(v197);
      sub_100008E84(v233, v182, v192);
      v208 = swift_bridgeObjectRelease(v201);
      v209 = v241;
      static ContentTransition.numericText(countsDown:)(0, v208);
      v210 = v240;
      v211 = Text.contentTransition(_:)(v209, v202, v204, v207, v240);
      v213 = v212;
      v215 = v214;
      LOBYTE(v182) = v216 & 1;
      sub_100008E84(v202, v204, v207);
      v217 = swift_bridgeObjectRelease(v210);
      (*(void (**)(char *, uint64_t, __n128))(v242 + 8))(v209, v243, v217);
      *(_QWORD *)&v252 = v211;
      *((_QWORD *)&v252 + 1) = v213;
      v253[0] = v182;
      *(_QWORD *)&v253[8] = v215;
      v258[0] = sub_10002DEF0();
      v258[1] = v218;
      v219 = Text.init<A>(_:)(v258, &type metadata for String, v250);
      v221 = v220;
      v223 = v222;
      LOBYTE(v209) = v224 & 1;
      v225 = (uint64_t)v237;
      View.accessibility(label:)(v219, v220, v224 & 1, v222, &type metadata for Text, &protocol witness table for Text);
      sub_100008E84(v219, v221, (char)v209);
      swift_bridgeObjectRelease(v223);
      sub_100008E84(v211, v213, v182);
      swift_bridgeObjectRelease(v215);
      v226 = (uint64_t)v238;
      sub_100003478(v225, (uint64_t)v238, &qword_1000525D8);
      swift_storeEnumTagMultiPayload(v226, v244, 1);
      v227 = sub_10002EB10();
      v228 = sub_10002EBF0();
      _ConditionalContent<>.init(storage:)(v226, v249, v245, v227, v228);
      v54 = v225;
      v55 = &qword_1000525D8;
    }
    return (id)sub_1000034BC(v54, v55);
  }
  else
  {
    __break(1u);
  }
  return result;
}

double sub_10002D498@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  __n128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  __n128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  __n128 v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  __n128 v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  double result;
  _BYTE v79[4];
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t KeyPath;
  uint64_t v88;
  _BYTE *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v84 = a2;
  v3 = type metadata accessor for ContentTransition(0);
  v90 = *(_QWORD *)(v3 - 8);
  v91 = v3;
  v4 = __chkstk_darwin(v3);
  v89 = &v79[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for Text.Scale(0, v4);
  v85 = *(_QWORD *)(v6 - 8);
  v86 = v6;
  __chkstk_darwin(v6);
  v8 = &v79[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v92 = Image.init(_internalSystemName:)(0x7974697669746361, 0xED000065766F6D2ELL);
  v9 = static Font.title.getter(v92);
  static Font.Weight.bold.getter();
  v88 = Font.weight(_:)(v9);
  v10 = swift_release(v9);
  KeyPath = swift_getKeyPath(&unk_1000410D0, v10);
  v93 = sub_10002D8D0();
  v94 = v11;
  v12 = sub_100008E40();
  v13 = Text.init<A>(_:)(&v93, &type metadata for String, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (qword_1000511C0 != -1)
    swift_once(&qword_1000511C0, sub_10002E4F4);
  v20 = v17 & 1;
  v21 = Text.font(_:)(qword_1000548E8, v13, v15, v20, v19);
  v81 = v22;
  v82 = v21;
  v24 = v23;
  v83 = v25;
  sub_100008E84(v13, v15, v20);
  swift_bridgeObjectRelease(v19);
  v26 = sub_10003BDC4(*(id *)(a1 + 24), *(id *)(a1 + 32));
  v28 = v27;
  v93 = (uint64_t)v26;
  v94 = v27;
  v29 = StringProtocol.localizedUppercase.getter(&type metadata for String, v12);
  v31 = v30;
  swift_bridgeObjectRelease(v28);
  v93 = v29;
  v94 = v31;
  v32 = Text.init<A>(_:)(&v93, &type metadata for String, v12);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  if (qword_1000511B8 != -1)
    swift_once(&qword_1000511B8, sub_10002E3AC);
  v80 = v24 & 1;
  v39 = Text.font(_:)(qword_1000548E0, v32, v34, v36 & 1, v38);
  v41 = v40;
  v43 = v42;
  v45 = v44 & 1;
  sub_100008E84(v32, v34, v36 & 1);
  v46 = swift_bridgeObjectRelease(v38);
  static Text.Scale.secondary.getter(v46);
  v47 = Text.textScale(_:isEnabled:)(v8, 1, v39, v41, v45, v43);
  v49 = v48;
  v51 = v50;
  v53 = v52 & 1;
  sub_100008E84(v39, v41, v45);
  v54 = swift_bridgeObjectRelease(v43);
  (*(void (**)(_BYTE *, uint64_t, __n128))(v85 + 8))(v8, v86, v54);
  v56 = v81;
  v55 = v82;
  LOBYTE(v43) = v80;
  v57 = v83;
  v85 = static Text.+ infix(_:_:)(v82, v81, v80, v83, v47, v49, v53, v51);
  v86 = v58;
  v60 = v59;
  v62 = v61 & 1;
  sub_100008E84(v47, v49, v53);
  swift_bridgeObjectRelease(v51);
  sub_100008E84(v55, v56, v43);
  v63 = swift_bridgeObjectRelease(v57);
  v64 = v89;
  static ContentTransition.numericText(countsDown:)(0, v63);
  v66 = v85;
  v65 = v86;
  v67 = Text.contentTransition(_:)(v64, v85, v60, v62, v86);
  v69 = v68;
  v71 = v70;
  LOBYTE(v51) = v72 & 1;
  sub_100008E84(v66, v60, v62);
  v73 = swift_bridgeObjectRelease(v65);
  (*(void (**)(_BYTE *, uint64_t, __n128))(v90 + 8))(v64, v91, v73);
  v74 = v92;
  v75 = v84;
  v77 = KeyPath;
  v76 = v88;
  *v84 = v92;
  v75[1] = v77;
  v75[2] = v76;
  v75[3] = v67;
  v75[4] = v69;
  *((_BYTE *)v75 + 40) = v51;
  v75[6] = v71;
  swift_retain(v74);
  swift_retain(v77);
  swift_retain(v76);
  sub_10000C8C8(v67, v69, v51);
  swift_bridgeObjectRetain(v71);
  sub_100008E84(v67, v69, v51);
  swift_release(v76);
  swift_release(v77);
  swift_release(v74);
  *(_QWORD *)&result = swift_bridgeObjectRelease(v71).n128_u64[0];
  return result;
}

uint64_t sub_10002D8D0()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSString v10;
  NSString v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Swift::String v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  Swift::String v21;

  v1 = (void *)v0[3];
  v2 = (void *)v0[4];
  v3 = v0[5];
  v4 = v0[6];
  sub_10003AEBC(v1, v2, v3, v4);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v10 = String._bridgeToObjectiveC()();
  v11 = String._bridgeToObjectiveC()();
  v12 = objc_msgSend(v9, "localizedStringForKey:value:table:", v10, 0, v11);

  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v15 = v14;

  swift_bridgeObjectRetain(v8);
  v16._countAndFlagsBits = v13;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v15);
  sub_10003AED0(v1, v2, v3, v4);
  v18 = v17;
  v20 = v19;
  swift_bridgeObjectRetain(v8);
  v21._countAndFlagsBits = v18;
  v21._object = v20;
  String.append(_:)(v21);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v20);
  return v6;
}

uint64_t sub_10002DA60()
{
  uint64_t v0;
  id v1;
  NSString v2;
  NSString v3;
  id v4;
  uint64_t v5;
  id v6;
  NSString v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Swift::String v16;
  _BYTE v18[8];
  id v19;

  sub_1000082A0(v0 + 16, (uint64_t)v18, (uint64_t *)&unk_100051990);
  sub_1000082A0((uint64_t)v18, (uint64_t)&v19, (uint64_t *)&unk_100051990);
  if (v19 && objc_msgSend(v19, "paused"))
  {
    v1 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v2 = String._bridgeToObjectiveC()();
    v3 = String._bridgeToObjectiveC()();
    v4 = objc_msgSend(v1, "localizedStringForKey:value:table:", v2, 0, v3);

    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  }
  else
  {
    v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v7 = String._bridgeToObjectiveC()();
    v8 = String._bridgeToObjectiveC()();
    v9 = objc_msgSend(v6, "localizedStringForKey:value:table:", v7, 0, v8);

    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v11 = v10;

    sub_10003B75C(*(id *)(v0 + 32));
    v13 = v12;
    v15 = v14;
    swift_bridgeObjectRetain(v11);
    v16._countAndFlagsBits = v13;
    v16._object = v15;
    String.append(_:)(v16);
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease(v15);
  }
  return v5;
}

uint64_t sub_10002DC80()
{
  _QWORD *v0;
  void *v1;
  id v2;
  NSString v3;
  NSString v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  Swift::String v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSString v21;
  NSString v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  Swift::String v27;
  id v28;
  void *v29;
  void *v30;
  Swift::String v31;

  v1 = (void *)objc_opt_self(NSBundle);
  v2 = objc_msgSend(v1, "mainBundle");
  v3 = String._bridgeToObjectiveC()();
  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(v2, "localizedStringForKey:value:table:", v3, 0, v4);

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  v9 = (void *)v0[3];
  v10 = (void *)v0[4];
  v11 = v0[5];
  v12 = v0[6];
  v13 = sub_10003B020(v9, v10, v11, v12);
  v15 = v14;
  swift_bridgeObjectRetain(v8);
  v16._countAndFlagsBits = (uint64_t)v13;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v8);
  *(_QWORD *)&v17 = swift_bridgeObjectRelease(v15).n128_u64[0];
  v19 = v6;
  v18 = v8;
  v20 = objc_msgSend(v1, "mainBundle", v17);
  v21 = String._bridgeToObjectiveC()();
  v22 = String._bridgeToObjectiveC()();
  v23 = objc_msgSend(v20, "localizedStringForKey:value:table:", v21, 0, v22);

  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
  v26 = v25;

  swift_bridgeObjectRetain(v18);
  v27._countAndFlagsBits = v24;
  v27._object = v26;
  String.append(_:)(v27);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v26);
  v28 = sub_10003B034(v9, v10, v11, v12);
  v30 = v29;
  swift_bridgeObjectRetain(v18);
  v31._countAndFlagsBits = (uint64_t)v28;
  v31._object = v30;
  String.append(_:)(v31);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v30);
  return v19;
}

uint64_t sub_10002DEF0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  NSString v3;
  NSString v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSString v9;
  NSString v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  uint64_t v21;
  id v22;
  NSString v23;
  NSString v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  Swift::String v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  Swift::String v34;
  id v35;
  NSString v36;
  NSString v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  Swift::String v42;
  uint64_t v43;
  void *v44;
  void *v45;
  Swift::String v46;
  _BYTE v48[8];
  id v49;

  v1 = v0;
  sub_1000082A0(v0 + 16, (uint64_t)v48, (uint64_t *)&unk_100051990);
  sub_1000082A0((uint64_t)v48, (uint64_t)&v49, (uint64_t *)&unk_100051990);
  if (v49 && objc_msgSend(v49, "paused"))
  {
    v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v3 = String._bridgeToObjectiveC()();
    v4 = String._bridgeToObjectiveC()();
    v5 = objc_msgSend(v2, "localizedStringForKey:value:table:", v3, 0, v4);

    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  }
  else
  {
    v7 = (void *)objc_opt_self(NSBundle);
    v8 = objc_msgSend(v7, "mainBundle");
    v9 = String._bridgeToObjectiveC()();
    v10 = String._bridgeToObjectiveC()();
    v11 = objc_msgSend(v8, "localizedStringForKey:value:table:", v9, 0, v10);

    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    v14 = v13;

    v15 = *(void **)(v1 + 32);
    sub_10003C4F8(v15);
    v17 = v16;
    v19 = v18;
    swift_bridgeObjectRetain(v14);
    v20._countAndFlagsBits = v17;
    v20._object = v19;
    String.append(_:)(v20);
    swift_bridgeObjectRelease(v14);
    v21 = v12;
    v22 = objc_msgSend(v7, "mainBundle", swift_bridgeObjectRelease(v19).n128_f64[0]);
    v23 = String._bridgeToObjectiveC()();
    v24 = String._bridgeToObjectiveC()();
    v25 = objc_msgSend(v22, "localizedStringForKey:value:table:", v23, 0, v24);

    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
    v28 = v27;

    swift_bridgeObjectRetain(v14);
    v29._countAndFlagsBits = v26;
    v29._object = v28;
    String.append(_:)(v29);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v28);
    sub_10003C9B8(v15);
    v31 = v30;
    v33 = v32;
    swift_bridgeObjectRetain(v14);
    v34._countAndFlagsBits = v31;
    v34._object = v33;
    String.append(_:)(v34);
    swift_bridgeObjectRelease(v14);
    v35 = objc_msgSend(v7, "mainBundle", swift_bridgeObjectRelease(v33).n128_f64[0]);
    v36 = String._bridgeToObjectiveC()();
    v37 = String._bridgeToObjectiveC()();
    v38 = objc_msgSend(v35, "localizedStringForKey:value:table:", v36, 0, v37);

    v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
    v41 = v40;

    swift_bridgeObjectRetain(v14);
    v42._countAndFlagsBits = v39;
    v42._object = v41;
    String.append(_:)(v42);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v41);
    v43 = sub_10003C1C0(v15);
    v45 = v44;
    swift_bridgeObjectRetain(v14);
    v46._countAndFlagsBits = v43;
    v46._object = v45;
    String.append(_:)(v46);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v45);
    return v21;
  }
  return v6;
}

id sub_10002E36C@<X0>(uint64_t a1@<X8>)
{
  return sub_10002C54C(a1);
}

uint64_t sub_10002E3AC()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v0 = sub_1000033B8(&qword_100051480);
  v1 = __chkstk_darwin(v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Font.TextStyle(0, v1);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v5 + 104))(v8, enum case for Font.TextStyle.body(_:), v4, v6);
  v9 = enum case for Font.Design.rounded(_:);
  v10 = type metadata accessor for Font.Design(0);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v3, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v3, 0, 1, v10);
  v12 = static Font.system(_:design:weight:)(v8, v3, 0, 1);
  sub_1000034BC((uint64_t)v3, &qword_100051480);
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  qword_1000548E0 = v12;
  return result;
}

void sub_10002E4F4()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v0 = sub_1000033B8(&qword_100051480);
  v1 = __chkstk_darwin(v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Font.TextStyle(0, v1);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v5 + 104))(v8, enum case for Font.TextStyle.body(_:), v4, v6);
  v9 = enum case for Font.Design.rounded(_:);
  v10 = type metadata accessor for Font.Design(0);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v3, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v3, 0, 1, v10);
  v12 = static Font.system(_:design:weight:)(v8, v3, 0, 1);
  sub_1000034BC((uint64_t)v3, &qword_100051480);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v13 = Font.feature(_:)(&off_10004DC78, v12);
  swift_release(v12);
  qword_1000548E8 = v13;
}

void sub_10002E658(void *a1@<X0>, char a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  void *v7;
  id v8;
  NSString v9;
  NSString v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  NSString v18;
  NSString v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v7 = (void *)objc_opt_self(NSBundle);
  v8 = objc_msgSend(v7, "mainBundle");
  v9 = String._bridgeToObjectiveC()();
  v10 = String._bridgeToObjectiveC()();
  v11 = objc_msgSend(v8, "localizedStringForKey:value:table:", v9, 0, v10);

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v14 = v13;

  v15 = a3;
  v16 = a1;
  v17 = objc_msgSend(v7, "mainBundle");
  v18 = String._bridgeToObjectiveC()();
  v19 = String._bridgeToObjectiveC()();
  v20 = objc_msgSend(v17, "localizedStringForKey:value:table:", v18, 0, v19);

  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  v23 = v22;

  *(_QWORD *)a4 = v16;
  *(_BYTE *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  *(_QWORD *)(a4 + 24) = v16;
  *(_QWORD *)(a4 + 32) = a3;
  *(_QWORD *)(a4 + 40) = v21;
  *(_QWORD *)(a4 + 48) = v23;
  *(_QWORD *)(a4 + 56) = v12;
  *(_QWORD *)(a4 + 64) = v14;
}

uint64_t destroy for InlineView(uint64_t a1)
{

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 48));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 64));
}

uint64_t initializeWithCopy for InlineView(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v7 = *(void **)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v6;
  v9 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v8;
  v10 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v10;
  v11 = v3;
  v12 = v4;
  v13 = v5;
  v14 = v7;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  return a1;
}

uint64_t assignWithCopy for InlineView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v7 = *(void **)(a1 + 16);
  v8 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v8;

  v10 = *(void **)(a2 + 24);
  v11 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v10;
  v12 = v10;

  v13 = *(void **)(a1 + 32);
  v14 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v14;
  v15 = v14;

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v16 = *(_QWORD *)(a2 + 48);
  v17 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v18 = *(_QWORD *)(a2 + 64);
  v19 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  return a1;
}

__n128 initializeWithTake for InlineView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for InlineView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease(v8);
  v9 = *(_QWORD *)(a2 + 64);
  v10 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v9;
  swift_bridgeObjectRelease(v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for InlineView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InlineView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InlineView()
{
  return &type metadata for InlineView;
}

uint64_t sub_10002EB00(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000422D0, 1);
}

unint64_t sub_10002EB10()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1000525F8;
  if (!qword_1000525F8)
  {
    v1 = sub_1000036E4(&qword_1000525F0);
    v2[0] = sub_1000036E4(&qword_100052600);
    v2[1] = sub_10002EBA4();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    sub_10002265C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000525F8);
  }
  return result;
}

unint64_t sub_10002EBA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052608;
  if (!qword_100052608)
  {
    v1 = sub_1000036E4(&qword_100052600);
    result = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100052608);
  }
  return result;
}

unint64_t sub_10002EBF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052610;
  if (!qword_100052610)
  {
    v1 = sub_1000036E4(&qword_1000525D8);
    sub_10002265C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052610);
  }
  return result;
}

unint64_t sub_10002EC68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052618;
  if (!qword_100052618)
  {
    v1 = sub_1000036E4(&qword_100052620);
    sub_10002EB10();
    sub_10002EBF0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052618);
  }
  return result;
}

_QWORD *sub_10002ECD4(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000033B8(&qword_100051D50);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = a3[6];
    v16 = *(void **)((char *)a2 + v14);
    *(_QWORD *)((char *)a1 + v14) = v16;
    v17 = *(void **)((char *)a2 + v15);
    *(_QWORD *)((char *)a1 + v15) = v17;
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    v18 = v16;
    v19 = v17;
  }
  return a1;
}

void sub_10002EDC8(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1000033B8(&qword_100051D50);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }

}

_QWORD *sub_10002EE44(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v6 = sub_1000033B8(&qword_100051D50);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = a3[6];
  v14 = *(void **)((char *)a2 + v12);
  *(_QWORD *)((char *)a1 + v12) = v14;
  v15 = *(void **)((char *)a2 + v13);
  *(_QWORD *)((char *)a1 + v13) = v15;
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  v16 = v14;
  v17 = v15;
  return a1;
}

_QWORD *sub_10002EF0C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051D50);
    v6 = sub_1000033B8(&qword_100051D50);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  v12 = a3[5];
  v13 = *(void **)((char *)a1 + v12);
  v14 = *(void **)((char *)a2 + v12);
  *(_QWORD *)((char *)a1 + v12) = v14;
  v15 = v14;

  v16 = a3[6];
  v17 = *(void **)((char *)a1 + v16);
  v18 = *(void **)((char *)a2 + v16);
  *(_QWORD *)((char *)a1 + v16) = v18;
  v19 = v18;

  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

char *sub_10002F000(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1000033B8(&qword_100051D50);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *sub_10002F0BC(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051D50);
    v6 = sub_1000033B8(&qword_100051D50);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = *(void **)&a1[v8];
  *(_QWORD *)&a1[v8] = *(_QWORD *)&a2[v8];

  v10 = a3[6];
  v11 = *(void **)&a1[v10];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];

  a1[a3[7]] = a2[a3[7]];
  return a1;
}

uint64_t sub_10002F1A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002F1B0);
}

uint64_t sub_10002F1B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_1000033B8(&qword_100052648);
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

uint64_t sub_10002F23C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002F248);
}

uint64_t sub_10002F248(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1000033B8(&qword_100052648);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for ChartsSection(uint64_t a1)
{
  uint64_t result;

  result = qword_1000526A8;
  if (!qword_1000526A8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ChartsSection);
  return result;
}

void sub_10002F300(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  sub_10002F37C(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = "\b";
    v4[2] = "\b";
    v4[3] = &unk_100041170;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
  }
}

void sub_10002F37C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000526B8)
  {
    v2 = type metadata accessor for ContentSizeCategory(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000526B8);
  }
}

uint64_t sub_10002F3D0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004233C, 1);
}

void sub_10002F3E0()
{
  qword_100052628 = 0x4042000000000000;
}

void sub_10002F3F0()
{
  qword_100052630 = 0x4043800000000000;
}

void sub_10002F404()
{
  qword_100052638 = 0x4044800000000000;
}

void sub_10002F418()
{
  qword_100052640 = 0x4045000000000000;
}

uint64_t sub_10002F428@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, __n128 a4@<Q0>)
{
  uint64_t v7;

  *(_QWORD *)a3 = static HorizontalAlignment.leading.getter(a4);
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  v7 = sub_1000033B8(&qword_1000526F0);
  return sub_10002F480(a2, a1, a3 + *(int *)(v7 + 44));
}

uint64_t sub_10002F480@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSString v31;
  NSString v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  char v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  char **v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  void *v60;
  void *v61;
  uint64_t OpaqueTypeConformance2;
  uint64_t v63;
  uint64_t v64;
  id v65;
  NSString v66;
  NSString v67;
  id v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  void *v72;
  char v73;
  uint64_t v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  double v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  char *v87;
  char *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  unint64_t v95;
  char v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  char *v111;
  char *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  int *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v127;
  id v128;
  char *v129;
  char *v130;
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
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void (*v148)(char *, uint64_t);
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  char v157;
  void *v158;
  void *v159;
  uint64_t v160;
  BOOL v161;
  char v162;
  uint64_t v163;
  char v164;
  uint64_t v165;
  char v166;
  __int128 v167;
  uint64_t v168;
  char v169;
  uint64_t v170;
  char v171;
  __int128 v172;
  uint64_t v173;
  char v174;
  uint64_t v175;
  char v176;
  __int128 v177;
  uint64_t v178;
  char v179;
  uint64_t v180;
  char v181;
  __int128 v182;

  v150 = a2;
  v142 = a3;
  v134 = type metadata accessor for ContentSizeCategory(0);
  v133 = *(_QWORD *)(v134 - 8);
  __chkstk_darwin(v134);
  v132 = (uint64_t)&v127 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v153 = type metadata accessor for AccessibilityChildBehavior(0);
  v149 = *(_QWORD *)(v153 - 8);
  __chkstk_darwin(v153);
  v152 = (char *)&v127 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v154 = sub_1000033B8(&qword_1000526F8);
  v146 = *(_QWORD *)(v154 - 8);
  __chkstk_darwin(v154);
  v138 = (char *)&v127 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v131 = (char *)&v127 - v8;
  __chkstk_darwin(v9);
  v11 = (char *)&v127 - v10;
  v12 = sub_1000033B8(&qword_100052700);
  __chkstk_darwin(v12);
  v141 = (uint64_t)&v127 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v140 = (uint64_t)&v127 - v15;
  __chkstk_darwin(v16);
  v139 = (uint64_t)&v127 - v17;
  __chkstk_darwin(v18);
  v135 = (char *)&v127 - v19;
  __chkstk_darwin(v20);
  v137 = (uint64_t)&v127 - v21;
  __chkstk_darwin(v22);
  v130 = (char *)&v127 - v23;
  __chkstk_darwin(v24);
  v136 = (uint64_t)&v127 - v25;
  __chkstk_darwin(v26);
  v129 = (char *)&v127 - v27;
  __chkstk_darwin(v28);
  v151 = (uint64_t)&v127 - v29;
  v128 = (id)objc_opt_self(NSBundle);
  v30 = objc_msgSend(v128, "mainBundle");
  v31 = String._bridgeToObjectiveC()();
  v32 = String._bridgeToObjectiveC()();
  v33 = objc_msgSend(v30, "localizedStringForKey:value:table:", v31, 0, v32);

  v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
  v36 = v35;

  v37 = type metadata accessor for ChartsSection(0);
  v38 = v37;
  v144 = *(int *)(v37 + 20);
  v39 = *(void **)(a1 + v144);
  if (v39)
  {
    if (objc_msgSend(v39, "paused"))
      v40 = 3;
    else
      v40 = 0;
    v41 = *(void **)(a1 + *(int *)(v38 + 24));
    v42 = v41;
    v43 = v39;
    v44 = objc_msgSend(v43, "activityMoveMode");
    v45 = &selRef__moveMinutesCompletionPercentage;
    if (v44 != (id)2)
      v45 = &selRef__activeEnergyCompletionPercentage;
    v46 = objc_msgSend(v43, *v45);
    v48 = v47;
  }
  else
  {
    v41 = *(void **)(a1 + *(int *)(v37 + 24));
    v46 = v41;
    v40 = 0;
    v48 = 0;
  }
  v49 = *(int *)(v38 + 28);
  v127 = v38;
  v143 = v49;
  v50 = *(_BYTE *)(a1 + v49);
  GeometryProxy.size.getter(v46);
  v52 = sub_100030208(v51) + -6.5;
  v54 = static Alignment.center.getter(v53);
  v56 = _FrameLayout.init(width:height:alignment:)(&v168, 0, 1, *(_QWORD *)&v52, 0, v54, v55);
  v155 = v34;
  v156 = v36;
  v157 = v40;
  v158 = v39;
  v159 = v41;
  v160 = v48;
  v161 = v39 == 0;
  v162 = v50;
  v163 = v168;
  v164 = v169;
  v165 = v170;
  v166 = v171;
  v167 = v172;
  v57 = v152;
  static AccessibilityChildBehavior.combine.getter(v56);
  v58 = sub_1000033B8(&qword_100052708);
  v59 = sub_10003058C();
  View.accessibilityElement(children:)(v57, v58, v59);
  v148 = *(void (**)(char *, uint64_t))(v149 + 8);
  v148(v57, v153);
  v60 = v158;
  v61 = v159;
  swift_bridgeObjectRelease(v156);

  v149 = v58;
  v155 = v58;
  v145 = v59;
  v156 = v59;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v155, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  v63 = (uint64_t)v129;
  v64 = v154;
  v147 = OpaqueTypeConformance2;
  View.accessibility(sortPriority:)(v154, 1.0);
  v146 = *(_QWORD *)(v146 + 8);
  ((void (*)(char *, uint64_t))v146)(v11, v64);
  sub_10003063C(v63, v151);
  v65 = objc_msgSend(v128, "mainBundle");
  v66 = String._bridgeToObjectiveC()();
  v67 = String._bridgeToObjectiveC()();
  v68 = objc_msgSend(v65, "localizedStringForKey:value:table:", v66, 0, v67);

  v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(v68);
  v71 = v70;

  v72 = *(void **)(a1 + v144);
  if (v72)
  {
    if (objc_msgSend(v72, "paused"))
      v73 = 3;
    else
      v73 = 1;
    v74 = v127;
    v75 = *(void **)(a1 + *(int *)(v127 + 24));
    v76 = v75;
    v77 = objc_msgSend(v72, "_exerciseTimeCompletionPercentage");
    v79 = v78;
  }
  else
  {
    v74 = v127;
    v75 = *(void **)(a1 + *(int *)(v127 + 24));
    v77 = v75;
    v73 = 1;
    v79 = 0;
  }
  v80 = *(_BYTE *)(a1 + v143);
  GeometryProxy.size.getter(v77);
  v82 = sub_100030208(v81) + -6.5;
  v84 = static Alignment.center.getter(v83);
  v86 = _FrameLayout.init(width:height:alignment:)(&v173, 0, 1, *(_QWORD *)&v82, 0, v84, v85);
  v155 = v69;
  v156 = v71;
  v157 = v73;
  v158 = v72;
  v159 = v75;
  v160 = v79;
  v161 = v72 == 0;
  v162 = v80;
  v163 = v173;
  v164 = v174;
  v165 = v175;
  v166 = v176;
  v167 = v177;
  v87 = v152;
  static AccessibilityChildBehavior.combine.getter(v86);
  v88 = v131;
  View.accessibilityElement(children:)(v87, v149, v145);
  v148(v87, v153);
  v89 = v158;
  v90 = v159;
  swift_bridgeObjectRelease(v156);

  v91 = (uint64_t)v130;
  v92 = v154;
  View.accessibility(sortPriority:)(v154, 1.0);
  ((void (*)(char *, uint64_t))v146)(v88, v92);
  v93 = v136;
  sub_10003063C(v91, v136);
  v94 = *(void **)(a1 + v144);
  v150 = sub_100030FF0();
  v144 = v95;
  if (v94)
  {
    if (objc_msgSend(v94, "paused"))
      v96 = 3;
    else
      v96 = 2;
    v97 = *(void **)(a1 + *(int *)(v74 + 24));
    v98 = v97;
    objc_msgSend(v94, "_standHoursCompletionPercentage");
    v100 = v99;
  }
  else
  {
    v97 = *(void **)(a1 + *(int *)(v74 + 24));
    v101 = v97;
    v96 = 2;
    v100 = 0;
  }
  v102 = v132;
  v103 = *(_BYTE *)(a1 + v143);
  sub_100017204(v132);
  v104 = v133;
  v105 = v134;
  v106 = (*(uint64_t (**)(uint64_t, uint64_t))(v133 + 88))(v102, v134);
  if ((_DWORD)v106 == enum case for ContentSizeCategory.extraSmall(_:)
    || (_DWORD)v106 == enum case for ContentSizeCategory.small(_:)
    || (_DWORD)v106 == enum case for ContentSizeCategory.medium(_:))
  {
    if (qword_1000511C8 != -1)
      v106 = swift_once(&qword_1000511C8, sub_10002F3E0);
    v107 = qword_100052628;
  }
  else if ((_DWORD)v106 == enum case for ContentSizeCategory.large(_:))
  {
    if (qword_1000511D0 != -1)
      v106 = swift_once(&qword_1000511D0, sub_10002F3F0);
    v107 = qword_100052630;
  }
  else if ((_DWORD)v106 == enum case for ContentSizeCategory.extraLarge(_:))
  {
    if (qword_1000511D8 != -1)
      v106 = swift_once(&qword_1000511D8, sub_10002F404);
    v107 = qword_100052638;
  }
  else
  {
    if (qword_1000511E0 != -1)
      swift_once(&qword_1000511E0, sub_10002F418);
    v107 = qword_100052640;
    v106 = (*(uint64_t (**)(uint64_t, uint64_t))(v104 + 8))(v102, v105);
  }
  v108 = static Alignment.center.getter(v106);
  v110 = _FrameLayout.init(width:height:alignment:)(&v178, 0, 1, v107, 0, v108, v109);
  v155 = v150;
  v156 = v144;
  v157 = v96;
  v158 = v94;
  v159 = v97;
  v160 = v100;
  v161 = v94 == 0;
  v162 = v103;
  v163 = v178;
  v164 = v179;
  v165 = v180;
  v166 = v181;
  v167 = v182;
  v111 = v152;
  static AccessibilityChildBehavior.combine.getter(v110);
  v112 = v138;
  View.accessibilityElement(children:)(v111, v149, v145);
  v148(v111, v153);
  v113 = v158;
  v114 = v159;
  swift_bridgeObjectRelease(v156);

  v115 = (uint64_t)v135;
  v116 = v154;
  View.accessibility(sortPriority:)(v154, 1.0);
  ((void (*)(char *, uint64_t))v146)(v112, v116);
  v117 = v137;
  sub_10003063C(v115, v137);
  v118 = v151;
  v119 = v139;
  sub_10003112C(v151, v139);
  v120 = v140;
  sub_10003112C(v93, v140);
  v121 = v141;
  sub_10003112C(v117, v141);
  v122 = v142;
  sub_10003112C(v119, v142);
  v123 = (int *)sub_1000033B8(&qword_100052720);
  v124 = v122 + v123[12];
  *(_QWORD *)v124 = 0x401A000000000000;
  *(_BYTE *)(v124 + 8) = 0;
  sub_10003112C(v120, v122 + v123[16]);
  v125 = v122 + v123[20];
  *(_QWORD *)v125 = 0x401A000000000000;
  *(_BYTE *)(v125 + 8) = 0;
  sub_10003112C(v121, v122 + v123[24]);
  sub_1000034BC(v117, &qword_100052700);
  sub_1000034BC(v93, &qword_100052700);
  sub_1000034BC(v118, &qword_100052700);
  sub_1000034BC(v121, &qword_100052700);
  sub_1000034BC(v120, &qword_100052700);
  return sub_1000034BC(v119, &qword_100052700);
}

double sub_100030208(double a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t v9;
  uint64_t v11;

  v2 = type metadata accessor for ContentSizeCategory(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017204((uint64_t)v5);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == enum case for ContentSizeCategory.extraSmall(_:)
    || v6 == enum case for ContentSizeCategory.small(_:)
    || v6 == enum case for ContentSizeCategory.medium(_:))
  {
    if (qword_1000511C8 != -1)
      swift_once(&qword_1000511C8, sub_10002F3E0);
    v9 = qword_100052628;
  }
  else if (v6 == enum case for ContentSizeCategory.large(_:))
  {
    if (qword_1000511D0 != -1)
      swift_once(&qword_1000511D0, sub_10002F3F0);
    v9 = qword_100052630;
  }
  else if (v6 == enum case for ContentSizeCategory.extraLarge(_:))
  {
    if (qword_1000511D8 != -1)
      swift_once(&qword_1000511D8, sub_10002F404);
    v9 = qword_100052638;
  }
  else
  {
    if (qword_1000511E0 != -1)
      swift_once(&qword_1000511E0, sub_10002F418);
    v9 = qword_100052640;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return (a1 - *(double *)&v9) * 0.5;
}

uint64_t sub_1000303CC@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(a1);
  sub_100017970(v2, (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ChartsSection);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_10004F780, v7 + v5, v6 | 7);
  result = sub_10001792C((uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, type metadata accessor for ChartsSection);
  *a2 = sub_100030540;
  a2[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v8;
  return result;
}

uint64_t sub_100030480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for ChartsSection(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = (_QWORD *)(v0 + v4);
  v7 = sub_1000033B8(&qword_100051D50);
  if (swift_getEnumCaseMultiPayload(v0 + v4, v7) == 1)
  {
    v8 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v0 + v4, v8);
  }
  else
  {
    swift_release(*v6);
  }

  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100030540@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  __n128 v6;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ChartsSection(0) - 8) + 80);
  return sub_10002F428(a1, v2 + ((v5 + 16) & ~v5), a2, v6);
}

unint64_t sub_10003058C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052710;
  if (!qword_100052710)
  {
    v1 = sub_1000036E4(&qword_100052708);
    sub_1000305F8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052710);
  }
  return result;
}

unint64_t sub_1000305F8()
{
  unint64_t result;

  result = qword_100052718;
  if (!qword_100052718)
  {
    result = swift_getWitnessTable(&unk_1000411E8, &type metadata for ChartContainer);
    atomic_store(result, (unint64_t *)&qword_100052718);
  }
  return result;
}

uint64_t sub_10003063C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8(&qword_100052700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100030684@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  id v12;
  NSString v13;
  NSString v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  char v27;
  __n128 v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  _BYTE v41[12];
  int v42;
  uint64_t v43;
  uint64_t v44;

  v43 = a2;
  v3 = type metadata accessor for HeaderLabel(0);
  __chkstk_darwin(v3);
  v5 = &v41[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  v8 = &v41[-v7];
  __chkstk_darwin(v9);
  v11 = &v41[-v10];
  v42 = *(unsigned __int8 *)(a1 + 49);
  if (v42 == 1)
  {
    v12 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v13 = String._bridgeToObjectiveC()();
    v14 = String._bridgeToObjectiveC()();
    v15 = objc_msgSend(v12, "localizedStringForKey:value:table:", v13, 0, v14);

    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    v18 = v17;

  }
  else
  {
    v16 = *(_QWORD *)a1;
    v18 = *(_QWORD *)(a1 + 8);
    swift_bridgeObjectRetain(v18);
  }
  v19 = *(unsigned __int8 *)(a1 + 16);
  if (v19 == 3)
  {
    if (qword_100051198 != -1)
      swift_once(&qword_100051198, sub_100017CF0);
    v20 = &qword_1000548C0;
  }
  else
  {
    if (qword_100051140 != -1)
      swift_once(&qword_100051140, sub_100017A9C);
    v20 = &qword_100054868;
  }
  v21 = *v20;
  swift_retain(*v20);
  v44 = 0x4026000000000000;
  sub_100008BBC();
  ScaledMetric.init(wrappedValue:)(&v44, &type metadata for CGFloat);
  v22 = (uint64_t *)&v8[*(int *)(v3 + 20)];
  *v22 = v16;
  v22[1] = v18;
  *(_QWORD *)&v8[*(int *)(v3 + 24)] = v21;
  sub_10001792C((uint64_t)v8, (uint64_t)v11, type metadata accessor for HeaderLabel);
  v23 = *(void **)(a1 + 24);
  v24 = *(void **)(a1 + 32);
  v25 = v24;
  v26 = v23;
  v27 = static Edge.Set.leading.getter();
  v28.n128_u64[0] = 1.0;
  v29 = EdgeInsets.init(_all:)(v28);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  sub_100017970((uint64_t)v11, (uint64_t)v5, type metadata accessor for HeaderLabel);
  v36 = v43;
  sub_100017970((uint64_t)v5, v43, type metadata accessor for HeaderLabel);
  v37 = v36 + *(int *)(sub_1000033B8(&qword_100052740) + 48);
  *(_BYTE *)v37 = v19;
  *(_QWORD *)(v37 + 8) = v23;
  *(_QWORD *)(v37 + 16) = v24;
  *(_BYTE *)(v37 + 24) = v42;
  *(_BYTE *)(v37 + 32) = v27;
  *(double *)(v37 + 40) = v29;
  *(_QWORD *)(v37 + 48) = v31;
  *(_QWORD *)(v37 + 56) = v33;
  *(_QWORD *)(v37 + 64) = v35;
  *(_BYTE *)(v37 + 72) = 0;
  v38 = v26;
  v39 = v25;
  sub_100031400((uint64_t)v11);

  return sub_100031400((uint64_t)v5);
}

uint64_t sub_10003099C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v3;
  uint64_t v4;
  _OWORD v6[2];
  __n128 v7;
  __int16 v8;

  v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  v7 = *(__n128 *)(v1 + 32);
  v8 = *(_WORD *)(v1 + 48);
  *(_QWORD *)a1 = static HorizontalAlignment.leading.getter(v7);
  *(_QWORD *)(a1 + 8) = 0x4008000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  v4 = sub_1000033B8(&qword_100052738);
  return sub_100030684((uint64_t)v6, a1 + *(int *)(v4 + 44));
}

void sub_100030A04(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_100030A50()
{
  uint64_t *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  _QWORD v15[6];
  __int128 v16;

  if (qword_100051160 != -1)
    swift_once(&qword_100051160, sub_100017B7C);
  v3 = qword_100054888;
  v4 = qword_100051168;
  swift_retain(qword_100054888);
  if (v4 != -1)
    swift_once(&qword_100051168, sub_100017B98);
  v5 = qword_100054890;
  v6 = qword_1000511F0;
  swift_retain(qword_100054890);
  if (v6 != -1)
    swift_once(&qword_1000511F0, sub_10003D274);
  v7 = objc_msgSend((id)qword_1000548F8, "unitManager");
  if (!v7)
  {
    __break(1u);
    JUMPOUT(0x100030F1CLL);
  }
  v8 = v7;
  v9 = objc_msgSend(v7, "userActiveEnergyBurnedUnit");

  if (v1 && objc_msgSend(v1, "activityMoveMode") == (id)2)
  {
    v10 = objc_msgSend((id)objc_opt_self(HKUnit), "minuteUnit");

    v9 = v10;
  }
  sub_10003177C(0);
  v15[0] = v3;
  v15[1] = v5;
  v15[2] = v9;
  v15[3] = v11;
  v15[4] = v12;
  v15[5] = sub_100030F2C(0, v1, v2);
  v16 = xmmword_100041120;
  v13 = sub_1000319DC();
  result = AnyView.init<A>(_:)(v15, &type metadata for QuantityChart, v13);
  *v0 = result;
  return result;
}

uint64_t sub_100030F2C(int a1, id a2, id a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  if (a2 && objc_msgSend(a2, "activityMoveMode") == (id)2)
  {
    if (a3)
    {
      v4 = objc_msgSend(a3, "appleMoveTimeResults");
      goto LABEL_7;
    }
    return 0;
  }
  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "activeEnergyResults");
LABEL_7:
  v5 = v4;
  if (!v5)
    return 0;
  v6 = sub_1000127C4(0, &qword_100051D90, _HKActivityStatisticsQuantityInfo_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  return v7;
}

void sub_100030FE0()
{
  char *v0;

  sub_100030A04(*v0);
}

uint64_t sub_100030FF0()
{
  id v0;
  NSString v1;
  NSString v2;
  id v3;
  uint64_t v4;

  if (qword_1000511F8 != -1)
    swift_once(&qword_1000511F8, sub_10003D32C);
  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v1 = String._bridgeToObjectiveC()();
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v0, "localizedStringForKey:value:table:", v1, 0, v2);

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  return v4;
}

uint64_t sub_10003112C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8(&qword_100052700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void destroy for ChartContainer(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));

}

uint64_t initializeWithCopy for ChartContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(void **)(a2 + 24);
  v5 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  swift_bridgeObjectRetain(v3);
  v6 = v4;
  v7 = v5;
  return a1;
}

uint64_t assignWithCopy for ChartContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(void **)(a1 + 24);
  v7 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = v7;

  v9 = *(void **)(a1 + 32);
  v10 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v10;
  v11 = v10;

  v12 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v12;
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

__n128 initializeWithTake for ChartContainer(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ChartContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);

  v6 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for ChartContainer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 50))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChartContainer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 50) = 1;
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
    *(_BYTE *)(result + 50) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ChartContainer()
{
  return &type metadata for ChartContainer;
}

uint64_t sub_1000313C4()
{
  return sub_100003928(&qword_100052728, &qword_100052730, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t sub_1000313F0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004239C, 1);
}

uint64_t sub_100031400(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HeaderLabel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void destroy for Chart(uint64_t a1)
{

}

uint64_t initializeWithCopy for Chart(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 8);
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = v3;
  v6 = v4;
  return a1;
}

uint64_t assignWithCopy for Chart(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a1 + 8);
  v5 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v5;
  v6 = v5;

  v7 = *(void **)(a1 + 16);
  v8 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v8;

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

__n128 initializeWithTake for Chart(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Chart(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;

  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for Chart(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Chart(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Chart()
{
  return &type metadata for Chart;
}

uint64_t storeEnumTagSinglePayload for ChartType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100031678 + 4 * byte_100041135[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1000316AC + 4 * byte_100041130[v4]))();
}

uint64_t sub_1000316AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000316B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000316BCLL);
  return result;
}

uint64_t sub_1000316C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000316D0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1000316D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000316DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ChartType()
{
  return &type metadata for ChartType;
}

uint64_t sub_1000316F8()
{
  return sub_100003928(&qword_100052748, &qword_100052750, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

unint64_t sub_100031728()
{
  unint64_t result;

  result = qword_100052758;
  if (!qword_100052758)
  {
    result = swift_getWitnessTable(&unk_100041288, &type metadata for ChartType);
    atomic_store(result, (unint64_t *)&qword_100052758);
  }
  return result;
}

uint64_t sub_10003176C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000423C4, 1);
}

void sub_10003177C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1000317B0(int a1, id a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  id v14;
  uint64_t v15;

  if (a2 && objc_msgSend(a2, "activityMoveMode") == (id)2)
  {
    if (qword_1000511F0 != -1)
      swift_once(&qword_1000511F0, sub_10003D274);
    v14 = objc_msgSend((id)qword_1000548F8, "localizedLongMoveMinutesUnitString");
    if (!v14)
    {
      __break(1u);
      JUMPOUT(0x100031808);
    }
  }
  else
  {
    if (qword_1000511F0 != -1)
      swift_once(&qword_1000511F0, sub_10003D274);
    v14 = objc_msgSend((id)qword_1000548F8, "localizedLongActiveEnergyUnitString");
    if (!v14)
    {
      __break(1u);
      JUMPOUT(0x1000319CCLL);
    }
  }
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);

  return v15;
}

unint64_t sub_1000319DC()
{
  unint64_t result;

  result = qword_100052760;
  if (!qword_100052760)
  {
    result = swift_getWitnessTable(&unk_10004078C, &type metadata for QuantityChart);
    atomic_store(result, (unint64_t *)&qword_100052760);
  }
  return result;
}

unint64_t sub_100031A20()
{
  unint64_t result;

  result = qword_100052768;
  if (!qword_100052768)
  {
    result = swift_getWitnessTable(&unk_10003FECC, &type metadata for StandChart);
    atomic_store(result, (unint64_t *)&qword_100052768);
  }
  return result;
}

void *sub_100031A64()
{
  return &protocol witness table for AnyView;
}

_QWORD *sub_100031A70(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = (_QWORD *)((char *)a1 + v14);
    v16 = (_QWORD *)((char *)a2 + v14);
    v17 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = a3[6];
    v24 = (char *)a1 + v23;
    v25 = (char *)a2 + v23;
    v26 = sub_1000033B8(&qword_1000513D0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
    v27 = a3[7];
    v28 = a3[8];
    v29 = *(_QWORD *)((char *)a2 + v27);
    *(_QWORD *)((char *)a1 + v27) = v29;
    v30 = (_QWORD *)((char *)a1 + v28);
    v31 = (_QWORD *)((char *)a2 + v28);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v33 = a3[9];
    v34 = a3[10];
    v35 = (_QWORD *)((char *)a1 + v33);
    v36 = (_QWORD *)((char *)a2 + v33);
    v37 = v36[1];
    *v35 = *v36;
    v35[1] = v37;
    *((_BYTE *)a1 + v34) = *((_BYTE *)a2 + v34);
    swift_retain(v29);
    swift_bridgeObjectRetain(v32);
    swift_bridgeObjectRetain(v37);
  }
  return a1;
}

double sub_100031C3C(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double result;

  v4 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + a2[5]);
  v7 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (char *)a1 + a2[6];
  v10 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_release(*(_QWORD *)((char *)a1 + a2[7]));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[8] + 8));
  *(_QWORD *)&result = swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[9] + 8)).n128_u64[0];
  return result;
}

_QWORD *sub_100031D4C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;

  v6 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = a3[6];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  v25 = a3[7];
  v26 = a3[8];
  v27 = *(_QWORD *)((char *)a2 + v25);
  *(_QWORD *)((char *)a1 + v25) = v27;
  v28 = (_QWORD *)((char *)a1 + v26);
  v29 = (_QWORD *)((char *)a2 + v26);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v31 = a3[9];
  v32 = a3[10];
  v33 = (_QWORD *)((char *)a1 + v31);
  v34 = (_QWORD *)((char *)a2 + v31);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  *((_BYTE *)a1 + v32) = *((_BYTE *)a2 + v32);
  swift_retain(v27);
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRetain(v35);
  return a1;
}

_QWORD *sub_100031EEC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B90);
    v6 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = a3[5];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    sub_1000034BC((uint64_t)a1 + v12, &qword_100051D88);
    v15 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  v21 = a3[6];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  v25 = a3[7];
  v26 = *(_QWORD *)((char *)a2 + v25);
  v27 = *(_QWORD *)((char *)a1 + v25);
  *(_QWORD *)((char *)a1 + v25) = v26;
  swift_retain(v26);
  swift_release(v27);
  v28 = a3[8];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *v30;
  v31 = v30[1];
  v32 = v29[1];
  v29[1] = v31;
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRelease(v32);
  v33 = a3[9];
  v34 = (_QWORD *)((char *)a1 + v33);
  v35 = (_QWORD *)((char *)a2 + v33);
  *v34 = *v35;
  v36 = v35[1];
  v37 = v34[1];
  v34[1] = v36;
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRelease(v37);
  *((_BYTE *)a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  return a1;
}

char *sub_1000320E8(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  v17 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v17] = *(_OWORD *)&a2[v17];
  v18 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  a1[v18] = a2[v18];
  return a1;
}

char *sub_10003225C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B90);
    v6 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_1000034BC((uint64_t)&a1[v8], &qword_100051D88);
    v11 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  v17 = a3[7];
  v18 = *(_QWORD *)&a1[v17];
  *(_QWORD *)&a1[v17] = *(_QWORD *)&a2[v17];
  swift_release(v18);
  v19 = a3[8];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v23 = *(_QWORD *)v21;
  v22 = *((_QWORD *)v21 + 1);
  v24 = *((_QWORD *)v20 + 1);
  *(_QWORD *)v20 = v23;
  *((_QWORD *)v20 + 1) = v22;
  swift_bridgeObjectRelease(v24);
  v25 = a3[9];
  v26 = &a1[v25];
  v27 = &a2[v25];
  v29 = *(_QWORD *)v27;
  v28 = *((_QWORD *)v27 + 1);
  v30 = *((_QWORD *)v26 + 1);
  *(_QWORD *)v26 = v29;
  *((_QWORD *)v26 + 1) = v28;
  swift_bridgeObjectRelease(v30);
  a1[a3[10]] = a2[a3[10]];
  return a1;
}

uint64_t sub_100032428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100032434);
}

uint64_t sub_100032434(uint64_t a1, uint64_t a2, int *a3)
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
  unint64_t v16;

  v6 = sub_1000033B8(&qword_100051BA0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_1000033B8(&qword_100051E48);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_7:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = sub_1000033B8(&qword_1000513D0);
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_7;
  }
  v16 = *(_QWORD *)(a1 + a3[7]);
  if (v16 >= 0xFFFFFFFF)
    LODWORD(v16) = -1;
  return (v16 + 1);
}

uint64_t sub_10003250C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100032518);
}

uint64_t sub_100032518(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  v8 = sub_1000033B8(&qword_100051BA0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = sub_1000033B8(&qword_100051E48);
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_7:
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  result = sub_1000033B8(&qword_1000513D0);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[6];
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + a4[7]) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for StandaloneMetricView(uint64_t a1)
{
  uint64_t result;

  result = qword_1000527C8;
  if (!qword_1000527C8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StandaloneMetricView);
  return result;
}

void sub_100032628(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[7];

  sub_10003270C(319, (unint64_t *)&unk_100051C18, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10003270C(319, (unint64_t *)&qword_100051EB8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v5 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(v4 - 8) + 64;
      sub_100008B64(319);
      if (v7 <= 0x3F)
      {
        v8[2] = *(_QWORD *)(v6 - 8) + 64;
        v8[3] = (char *)&value witness table for Builtin.NativeObject + 64;
        v8[4] = &unk_100041328;
        v8[5] = &unk_100041328;
        v8[6] = &unk_100041340;
        swift_initStructMetadata(a1, 256, 7, v8, a1 + 16);
      }
    }
  }
}

void sub_10003270C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Environment.Content(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_100032758(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100042414, 1);
}

uint64_t sub_100032768@<X0>(uint64_t a1@<X8>)
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
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  __n128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  __n128 v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  double v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  __n128 v95;
  char *v96;
  __n128 v97;
  uint64_t KeyPath;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __n128 v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  __n128 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  __n128 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD v116[2];
  int v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;

  v2 = v1;
  v142 = a1;
  v137 = sub_1000033B8(&qword_100052818);
  __chkstk_darwin(v137);
  v141 = (_QWORD *)((char *)v116 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = type metadata accessor for ContentTransition(0);
  v139 = *(_QWORD *)(v4 - 8);
  v140 = v4;
  __chkstk_darwin(v4);
  v138 = (char *)v116 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000033B8(&qword_100051480);
  __chkstk_darwin(v6);
  v128 = (char *)v116 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = type metadata accessor for WidgetRenderingMode(0);
  v127 = *(_QWORD *)(v125 - 8);
  __chkstk_darwin(v125);
  v124 = (char *)v116 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v9);
  v123 = (uint64_t)v116 - v11;
  v126 = type metadata accessor for Text.Scale(0, v10);
  v122 = *(_QWORD *)(v126 - 8);
  __chkstk_darwin(v126);
  v13 = (char *)v116 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = sub_1000033B8(&qword_100052820);
  __chkstk_darwin(v129);
  v134 = (char *)v116 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v130 = sub_1000033B8(&qword_100052828);
  __chkstk_darwin(v130);
  v135 = (uint64_t)v116 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = sub_1000033B8(&qword_100052830);
  __chkstk_darwin(v131);
  v136 = (uint64_t)v116 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = sub_1000033B8(&qword_100052838);
  __chkstk_darwin(v132);
  v133 = (uint64_t)v116 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (int *)type metadata accessor for StandaloneMetricView(0);
  v19 = (uint64_t *)(v1 + v18[8]);
  v20 = v19[1];
  v143 = *v19;
  v144 = v20;
  v21 = sub_100008E40();
  swift_bridgeObjectRetain(v20);
  v22 = Text.init<A>(_:)(&v143, &type metadata for String, v21);
  v24 = v23;
  v26 = v25;
  v28 = v27 & 1;
  v116[0] = v18[7];
  v120 = Text.foregroundColor(_:)(*(_QWORD *)(v2 + v116[0]), v22, v23, v28, v25);
  v119 = v29;
  v118 = v30;
  v121 = v31;
  sub_100008E84(v22, v24, v28);
  swift_bridgeObjectRelease(v26);
  v32 = (uint64_t *)(v2 + v18[9]);
  v34 = *v32;
  v33 = v32[1];
  v143 = v34;
  v144 = v33;
  v143 = StringProtocol.localizedUppercase.getter(&type metadata for String, v21);
  v144 = v35;
  v36 = Text.init<A>(_:)(&v143, &type metadata for String, v21);
  v38 = v37;
  v40 = v39;
  v42 = v41 & 1;
  static Text.Scale.secondary.getter(v43);
  v44 = Text.textScale(_:isEnabled:)(v13, 1, v36, v38, v42, v40);
  v46 = v45;
  v117 = v47;
  v49 = v48;
  sub_100008E84(v36, v38, v42);
  v50 = swift_bridgeObjectRelease(v40);
  (*(void (**)(char *, uint64_t, __n128))(v122 + 8))(v13, v126, v50);
  v126 = (uint64_t)v18;
  v51 = v123;
  v52 = sub_1000171D8(v123);
  v53 = v124;
  static WidgetRenderingMode.fullColor.getter(v52);
  v54 = sub_10002684C();
  v55 = v53;
  v56 = v125;
  LOBYTE(v53) = dispatch thunk of static Equatable.== infix(_:_:)(v51, v53, v125, v54);
  v57 = *(void (**)(char *, uint64_t))(v127 + 8);
  v57(v55, v56);
  v58 = ((uint64_t (*)(uint64_t, uint64_t))v57)(v51, v56);
  v116[1] = v2;
  if ((v53 & 1) != 0)
  {
    v59 = *(_QWORD *)(v2 + v116[0]);
    swift_retain(v59);
  }
  else
  {
    v59 = static Color.secondary.getter(v58);
  }
  v60 = v117 & 1;
  v61 = v118 & 1;
  v62 = Text.foregroundColor(_:)(v59, v44, v46, v117 & 1, v49);
  v64 = v63;
  v66 = v65;
  v68 = v67;
  swift_release(v59);
  v69 = v66 & 1;
  sub_100008E84(v44, v46, v60);
  swift_bridgeObjectRelease(v49);
  v70 = v120;
  v71 = v119;
  v72 = v121;
  v73 = static Text.+ infix(_:_:)(v120, v119, v61, v121, v62, v64, v66 & 1, v68);
  v125 = v74;
  v127 = v75;
  v77 = v76 & 1;
  sub_100008E84(v62, v64, v69);
  swift_bridgeObjectRelease(v68);
  sub_100008E84(v70, v71, v61);
  swift_bridgeObjectRelease(v72);
  v78 = sub_1000033B8(&qword_1000513D0);
  v79 = ScaledMetric.wrappedValue.getter(&v143, v78);
  v80 = *(double *)&v143;
  v81 = static Font.Weight.semibold.getter(v79);
  v82 = enum case for Font.Design.rounded(_:);
  v83 = type metadata accessor for Font.Design(0);
  v84 = *(_QWORD *)(v83 - 8);
  v85 = (uint64_t)v128;
  (*(void (**)(char *, uint64_t, uint64_t))(v84 + 104))(v128, v82, v83);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v84 + 56))(v85, 0, 1, v83);
  v86 = static Font.system(size:weight:design:)(*(_QWORD *)&v81, 0, v85, v80);
  sub_1000034BC(v85, &qword_100051480);
  v87 = v125;
  v88 = v127;
  v89 = Text.font(_:)(v86, v73, v125, v77, v127);
  v91 = v90;
  LOBYTE(v85) = v92;
  v94 = v93;
  swift_release(v86);
  LOBYTE(v86) = v85 & 1;
  sub_100008E84(v73, v87, v77);
  v95 = swift_bridgeObjectRelease(v88);
  v96 = v138;
  static ContentTransition.numericText(countsDown:)(0, v95);
  KeyPath = swift_getKeyPath(&unk_1000413A8, v97);
  v100 = v140;
  v99 = v141;
  v101 = v139;
  (*(void (**)(char *, char *, uint64_t))(v139 + 16))((char *)v141 + *(int *)(v137 + 28), v96, v140);
  *v99 = KeyPath;
  v102 = (uint64_t)v134;
  sub_100003478((uint64_t)v99, (uint64_t)&v134[*(int *)(v129 + 36)], &qword_100052818);
  *(_QWORD *)v102 = v89;
  *(_QWORD *)(v102 + 8) = v91;
  *(_BYTE *)(v102 + 16) = v86;
  *(_QWORD *)(v102 + 24) = v94;
  sub_10000C8C8(v89, v91, v86);
  swift_bridgeObjectRetain(v94);
  sub_1000034BC((uint64_t)v99, &qword_100052818);
  (*(void (**)(char *, uint64_t))(v101 + 8))(v96, v100);
  sub_100008E84(v89, v91, v86);
  v103 = swift_bridgeObjectRelease(v94);
  v104 = swift_getKeyPath(&unk_1000413D8, v103);
  v105 = v135;
  sub_100003478(v102, v135, &qword_100052820);
  v106 = (uint64_t *)(v105 + *(int *)(v130 + 36));
  *v106 = v104;
  v106[1] = 0x3FE3333333333333;
  sub_1000034BC(v102, &qword_100052820);
  v108 = swift_getKeyPath(&unk_100041408, v107);
  v109 = v136;
  sub_100003478(v105, v136, &qword_100052828);
  v110 = v109 + *(int *)(v131 + 36);
  *(_QWORD *)v110 = v108;
  *(_BYTE *)(v110 + 8) = 1;
  sub_1000034BC(v105, &qword_100052828);
  v112 = swift_getKeyPath(&unk_100041438, v111);
  v113 = v133;
  sub_100003478(v109, v133, &qword_100052830);
  v114 = v113 + *(int *)(v132 + 36);
  *(_QWORD *)v114 = v112;
  *(_QWORD *)(v114 + 8) = 1;
  *(_BYTE *)(v114 + 16) = 0;
  sub_1000034BC(v109, &qword_100052830);
  return sub_100033020(v113, v142);
}

uint64_t sub_100033020(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8(&qword_100052838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10003306C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052840;
  if (!qword_100052840)
  {
    v1 = sub_1000036E4(&qword_100052838);
    sub_1000330E8();
    sub_10003325C((unint64_t *)&qword_1000514A0, &qword_1000514A8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052840);
  }
  return result;
}

unint64_t sub_1000330E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052848;
  if (!qword_100052848)
  {
    v1 = sub_1000036E4(&qword_100052830);
    sub_100033164();
    sub_10003325C(&qword_100052878, &qword_100052880);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052848);
  }
  return result;
}

unint64_t sub_100033164()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052850;
  if (!qword_100052850)
  {
    v1 = sub_1000036E4(&qword_100052828);
    sub_1000331E0();
    sub_10003325C(&qword_100052868, &qword_100052870);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052850);
  }
  return result;
}

unint64_t sub_1000331E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052858;
  if (!qword_100052858)
  {
    v1 = sub_1000036E4(&qword_100052820);
    sub_10003325C(&qword_100052860, &qword_100052818);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052858);
  }
  return result;
}

uint64_t sub_10003325C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_1000036E4(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>, v4);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *sub_10003329C(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000033B8(&qword_100051D50);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = (_QWORD *)((char *)a1 + v14);
    v16 = (_QWORD *)((char *)a2 + v14);
    v17 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = a3[6];
    v24 = (char *)a1 + v23;
    v25 = (char *)a2 + v23;
    v26 = sub_1000033B8(&qword_1000513D0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
    v27 = a3[7];
    v28 = a3[8];
    v29 = *(_QWORD *)((char *)a2 + v27);
    *(_QWORD *)((char *)a1 + v27) = v29;
    v30 = (_QWORD *)((char *)a1 + v28);
    v31 = (_QWORD *)((char *)a2 + v28);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v33 = a3[9];
    v34 = a3[10];
    v35 = (_QWORD *)((char *)a1 + v33);
    v36 = (_QWORD *)((char *)a2 + v33);
    v37 = v36[1];
    *v35 = *v36;
    v35[1] = v37;
    v38 = (_QWORD *)((char *)a1 + v34);
    v39 = (_QWORD *)((char *)a2 + v34);
    v40 = v39[1];
    *v38 = *v39;
    v38[1] = v40;
    v41 = a3[12];
    *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
    *(_QWORD *)((char *)a1 + v41) = *(_QWORD *)((char *)a2 + v41);
    swift_retain(v29);
    swift_bridgeObjectRetain(v32);
    swift_bridgeObjectRetain(v37);
    swift_bridgeObjectRetain(v40);
  }
  return a1;
}

double sub_10003348C(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  double result;

  v4 = sub_1000033B8(&qword_100051D50);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + a2[5]);
  v7 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (char *)a1 + a2[6];
  v10 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_release(*(_QWORD *)((char *)a1 + a2[7]));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[8] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[9] + 8));
  *(_QWORD *)&result = swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[10] + 8)).n128_u64[0];
  return result;
}

_QWORD *sub_1000335AC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;

  v6 = sub_1000033B8(&qword_100051D50);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = a3[6];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  v25 = a3[7];
  v26 = a3[8];
  v27 = *(_QWORD *)((char *)a2 + v25);
  *(_QWORD *)((char *)a1 + v25) = v27;
  v28 = (_QWORD *)((char *)a1 + v26);
  v29 = (_QWORD *)((char *)a2 + v26);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v31 = a3[9];
  v32 = a3[10];
  v33 = (_QWORD *)((char *)a1 + v31);
  v34 = (_QWORD *)((char *)a2 + v31);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  v36 = (_QWORD *)((char *)a1 + v32);
  v37 = (_QWORD *)((char *)a2 + v32);
  v38 = v37[1];
  *v36 = *v37;
  v36[1] = v38;
  v39 = a3[12];
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *(_QWORD *)((char *)a1 + v39) = *(_QWORD *)((char *)a2 + v39);
  swift_retain(v27);
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRetain(v35);
  swift_bridgeObjectRetain(v38);
  return a1;
}

_QWORD *sub_100033770(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051D50);
    v6 = sub_1000033B8(&qword_100051D50);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = a3[5];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    sub_1000034BC((uint64_t)a1 + v12, &qword_100051D88);
    v15 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  v21 = a3[6];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  v25 = a3[7];
  v26 = *(_QWORD *)((char *)a2 + v25);
  v27 = *(_QWORD *)((char *)a1 + v25);
  *(_QWORD *)((char *)a1 + v25) = v26;
  swift_retain(v26);
  swift_release(v27);
  v28 = a3[8];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *v30;
  v31 = v30[1];
  v32 = v29[1];
  v29[1] = v31;
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRelease(v32);
  v33 = a3[9];
  v34 = (_QWORD *)((char *)a1 + v33);
  v35 = (_QWORD *)((char *)a2 + v33);
  *v34 = *v35;
  v36 = v35[1];
  v37 = v34[1];
  v34[1] = v36;
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRelease(v37);
  v38 = a3[10];
  v39 = (_QWORD *)((char *)a1 + v38);
  v40 = (_QWORD *)((char *)a2 + v38);
  *v39 = *v40;
  v41 = v40[1];
  v42 = v39[1];
  v39[1] = v41;
  swift_bridgeObjectRetain(v41);
  swift_bridgeObjectRelease(v42);
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  return a1;
}

char *sub_1000339A4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_1000033B8(&qword_100051D50);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  v17 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v17] = *(_OWORD *)&a2[v17];
  v18 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  *(_OWORD *)&a1[v18] = *(_OWORD *)&a2[v18];
  v19 = a3[12];
  a1[a3[11]] = a2[a3[11]];
  *(_QWORD *)&a1[v19] = *(_QWORD *)&a2[v19];
  return a1;
}

char *sub_100033B2C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051D50);
    v6 = sub_1000033B8(&qword_100051D50);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_1000034BC((uint64_t)&a1[v8], &qword_100051D88);
    v11 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = sub_1000033B8(&qword_1000513D0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  v17 = a3[7];
  v18 = *(_QWORD *)&a1[v17];
  *(_QWORD *)&a1[v17] = *(_QWORD *)&a2[v17];
  swift_release(v18);
  v19 = a3[8];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v23 = *(_QWORD *)v21;
  v22 = *((_QWORD *)v21 + 1);
  v24 = *((_QWORD *)v20 + 1);
  *(_QWORD *)v20 = v23;
  *((_QWORD *)v20 + 1) = v22;
  swift_bridgeObjectRelease(v24);
  v25 = a3[9];
  v26 = &a1[v25];
  v27 = &a2[v25];
  v29 = *(_QWORD *)v27;
  v28 = *((_QWORD *)v27 + 1);
  v30 = *((_QWORD *)v26 + 1);
  *(_QWORD *)v26 = v29;
  *((_QWORD *)v26 + 1) = v28;
  swift_bridgeObjectRelease(v30);
  v31 = a3[10];
  v32 = &a1[v31];
  v33 = &a2[v31];
  v35 = *(_QWORD *)v33;
  v34 = *((_QWORD *)v33 + 1);
  v36 = *((_QWORD *)v32 + 1);
  *(_QWORD *)v32 = v35;
  *((_QWORD *)v32 + 1) = v34;
  swift_bridgeObjectRelease(v36);
  v37 = a3[12];
  a1[a3[11]] = a2[a3[11]];
  *(_QWORD *)&a1[v37] = *(_QWORD *)&a2[v37];
  return a1;
}

uint64_t sub_100033D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100033D28);
}

uint64_t sub_100033D28(uint64_t a1, uint64_t a2, int *a3)
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
  unint64_t v16;

  v6 = sub_1000033B8(&qword_100052648);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_1000033B8(&qword_100051E48);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_7:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = sub_1000033B8(&qword_1000513D0);
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_7;
  }
  v16 = *(_QWORD *)(a1 + a3[7]);
  if (v16 >= 0xFFFFFFFF)
    LODWORD(v16) = -1;
  return (v16 + 1);
}

uint64_t sub_100033E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100033E0C);
}

uint64_t sub_100033E0C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  v8 = sub_1000033B8(&qword_100052648);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = sub_1000033B8(&qword_100051E48);
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_7:
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  result = sub_1000033B8(&qword_1000513D0);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[6];
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + a4[7]) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for FractionView(uint64_t a1)
{
  uint64_t result;

  result = qword_1000528E0;
  if (!qword_1000528E0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FractionView);
  return result;
}

void sub_100033F1C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[9];

  sub_10003270C(319, (unint64_t *)&qword_1000526B8, (uint64_t (*)(uint64_t))&type metadata accessor for ContentSizeCategory);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10003270C(319, (unint64_t *)&qword_100051EB8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v5 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(v4 - 8) + 64;
      sub_100008B64(319);
      if (v7 <= 0x3F)
      {
        v8[2] = *(_QWORD *)(v6 - 8) + 64;
        v8[3] = (char *)&value witness table for Builtin.NativeObject + 64;
        v8[4] = &unk_100041488;
        v8[5] = &unk_100041488;
        v8[6] = &unk_100041488;
        v8[7] = &unk_1000414A0;
        v8[8] = (char *)&value witness table for Builtin.Int64 + 64;
        swift_initStructMetadata(a1, 256, 9, v8, a1 + 16);
      }
    }
  }
}

uint64_t sub_100034010(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100042464, 1);
}

uint64_t sub_100034020@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  int *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  char *v84;
  __n128 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  char v90;
  unint64_t v91;
  __n128 v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  unint64_t v96;
  uint64_t v97;
  void (*v98)(char *, uint64_t);
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD *v121;
  double v122;
  double v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  uint64_t v136;
  __n128 v137;
  char *v138;
  __n128 v139;
  uint64_t KeyPath;
  uint64_t *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  __n128 v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t *v151;
  __n128 v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t *v155;
  __n128 v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  __n128 v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unsigned int v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t *v187;
  uint64_t v188;
  char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t *v203;
  uint64_t v204;
  int *v205;
  uint64_t v206;
  uint64_t v207;
  unint64_t v208;

  v204 = a1;
  v198 = sub_1000033B8(&qword_100052818);
  __chkstk_darwin(v198);
  v203 = (uint64_t *)((char *)&v165 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = type metadata accessor for ContentTransition(0);
  v201 = *(_QWORD *)(v3 - 8);
  v202 = v3;
  __chkstk_darwin(v3);
  v200 = (char *)&v165 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000033B8(&qword_100051480);
  __chkstk_darwin(v5);
  v189 = (char *)&v165 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v186 = type metadata accessor for WidgetRenderingMode(0);
  v185 = *(_QWORD *)(v186 - 8);
  __chkstk_darwin(v186);
  v184 = (char *)&v165 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v8);
  v183 = (uint64_t)&v165 - v10;
  v182 = type metadata accessor for Text.Scale(0, v9);
  v181 = *(_QWORD *)(v182 - 8);
  __chkstk_darwin(v182);
  v180 = (char *)&v165 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v188 = sub_1000033B8(&qword_100052820);
  __chkstk_darwin(v188);
  v193 = (char *)&v165 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v190 = sub_1000033B8(&qword_100052938);
  __chkstk_darwin(v190);
  v196 = (uint64_t)&v165 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v191 = sub_1000033B8(&qword_100052940);
  __chkstk_darwin(v191);
  v197 = (uint64_t)&v165 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v192 = sub_1000033B8(&qword_100052948);
  __chkstk_darwin(v192);
  v199 = (uint64_t)&v165 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v194 = sub_1000033B8(&qword_100052950);
  __chkstk_darwin(v194);
  v195 = (uint64_t)&v165 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v205 = (int *)type metadata accessor for FractionView(0);
  v17 = (uint64_t *)(v1 + v205[8]);
  v18 = v17[1];
  v175 = *v17;
  v187 = v17;
  v174 = v18;
  v207 = v175;
  v208 = v18;
  v19 = sub_100008E40();
  swift_bridgeObjectRetain(v18);
  v178 = Text.init<A>(_:)(&v207, &type metadata for String, v19);
  v177 = v20;
  v179 = v21;
  v23 = v22 & 1;
  v24 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000022, 0x8000000100049360);
  v25 = Text.init(_:tableName:bundle:comment:)(v24);
  v27 = v26;
  v29 = v28;
  v31 = v30 & 1;
  v32 = Text.baselineOffset(_:)(1.0);
  v34 = v33;
  v36 = v35;
  v38 = v37 & 1;
  sub_100008E84(v25, v27, v31);
  swift_bridgeObjectRelease(v29);
  v39 = v178;
  v40 = v177;
  v41 = v179;
  v173 = static Text.+ infix(_:_:)(v178, v177, v23, v179, v32, v34, v38, v36);
  v170 = v42;
  v44 = v43;
  v168 = v43;
  v169 = v45 & 1;
  sub_100008E84(v32, v34, v38);
  swift_bridgeObjectRelease(v36);
  sub_100008E84(v39, v40, v23);
  swift_bridgeObjectRelease(v41);
  v46 = v205;
  v47 = (uint64_t *)(v206 + v205[9]);
  v48 = v47[1];
  v172 = *v47;
  v207 = v172;
  v208 = v48;
  v171 = v48;
  swift_bridgeObjectRetain(v48);
  v176 = v19;
  v49 = Text.init<A>(_:)(&v207, &type metadata for String, v19);
  v51 = v50;
  v53 = v52;
  v55 = v54 & 1;
  v56 = v173;
  v57 = v170;
  LOBYTE(v41) = v169;
  v58 = static Text.+ infix(_:_:)(v173, v170, v169, v44, v49, v50, v55, v52);
  v166 = v59;
  v167 = v60;
  v62 = v61 & 1;
  sub_100008E84(v49, v51, v55);
  v63 = v53;
  v64 = v206;
  swift_bridgeObjectRelease(v63);
  sub_100008E84(v56, v57, v41);
  swift_bridgeObjectRelease(v168);
  v170 = v46[7];
  v65 = v166;
  v66 = v167;
  v178 = Text.foregroundColor(_:)(*(_QWORD *)(v64 + v170), v58, v166, v62, v167);
  v177 = v67;
  LODWORD(v173) = v68;
  v179 = v69;
  sub_100008E84(v58, v65, v62);
  swift_bridgeObjectRelease(v66);
  if (sub_100034C28(v175, v174, v172, v171))
  {
    v70 = (uint64_t *)(v64 + v46[10]);
    v72 = *v70;
    v71 = v70[1];
    v207 = v72;
    v208 = v71;
    v73 = v176;
    v74 = StringProtocol.localizedUppercase.getter(&type metadata for String, v176);
    v76 = v73;
  }
  else
  {
    v74 = 0;
    v75 = 0xE000000000000000;
    v76 = v176;
  }
  v207 = v74;
  v208 = v75;
  v77 = Text.init<A>(_:)(&v207, &type metadata for String, v76);
  v79 = v78;
  v81 = v80;
  v83 = v82 & 1;
  v84 = v180;
  static Text.Scale.secondary.getter(v85);
  v86 = Text.textScale(_:isEnabled:)(v84, 1, v77, v79, v83, v81);
  v88 = v87;
  v90 = v89;
  v176 = v91;
  sub_100008E84(v77, v79, v83);
  v92 = swift_bridgeObjectRelease(v81);
  (*(void (**)(char *, uint64_t, __n128))(v181 + 8))(v84, v182, v92);
  v93 = v183;
  v94 = sub_1000171D8(v183);
  v95 = v184;
  static WidgetRenderingMode.fullColor.getter(v94);
  v96 = sub_10002684C();
  v97 = v186;
  LOBYTE(v77) = dispatch thunk of static Equatable.== infix(_:_:)(v93, v95, v186, v96);
  v98 = *(void (**)(char *, uint64_t))(v185 + 8);
  v98(v95, v97);
  v99 = ((uint64_t (*)(uint64_t, uint64_t))v98)(v93, v97);
  if ((v77 & 1) != 0)
  {
    v100 = *(_QWORD *)(v64 + v170);
    swift_retain(v100);
  }
  else
  {
    v100 = static Color.secondary.getter(v99);
  }
  v101 = v90 & 1;
  v102 = v173 & 1;
  v103 = v176;
  v104 = Text.foregroundColor(_:)(v100, v86, v88, v101, v176);
  v106 = v105;
  v108 = v107;
  v110 = v109;
  swift_release(v100);
  v111 = v108 & 1;
  sub_100008E84(v86, v88, v101);
  swift_bridgeObjectRelease(v103);
  v112 = v178;
  v113 = v177;
  v114 = v179;
  v185 = static Text.+ infix(_:_:)(v178, v177, v102, v179, v104, v106, v108 & 1, v110);
  v116 = v115;
  v186 = v117;
  v119 = v118 & 1;
  sub_100008E84(v104, v106, v111);
  swift_bridgeObjectRelease(v110);
  sub_100008E84(v112, v113, v102);
  swift_bridgeObjectRelease(v114);
  v120 = sub_1000033B8(&qword_1000513D0);
  v121 = ScaledMetric.wrappedValue.getter(&v207, v120);
  v122 = *(double *)&v207;
  v123 = static Font.Weight.semibold.getter(v121);
  v124 = enum case for Font.Design.rounded(_:);
  v125 = type metadata accessor for Font.Design(0);
  v126 = *(_QWORD *)(v125 - 8);
  v127 = (uint64_t)v189;
  (*(void (**)(char *, uint64_t, uint64_t))(v126 + 104))(v189, v124, v125);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v126 + 56))(v127, 0, 1, v125);
  v128 = static Font.system(size:weight:design:)(*(_QWORD *)&v123, 0, v127, v122);
  sub_1000034BC(v127, &qword_100051480);
  v129 = v185;
  v130 = v186;
  v131 = Text.font(_:)(v128, v185, v116, v119, v186);
  v133 = v132;
  LOBYTE(v127) = v134;
  v136 = v135;
  swift_release(v128);
  LOBYTE(v128) = v127 & 1;
  sub_100008E84(v129, v116, v119);
  v137 = swift_bridgeObjectRelease(v130);
  v138 = v200;
  static ContentTransition.numericText(countsDown:)(0, v137);
  KeyPath = swift_getKeyPath(&unk_100041508, v139);
  v142 = v202;
  v141 = v203;
  v143 = v201;
  (*(void (**)(char *, char *, uint64_t))(v201 + 16))((char *)v203 + *(int *)(v198 + 28), v138, v202);
  *v141 = KeyPath;
  v144 = (uint64_t)v193;
  sub_100003478((uint64_t)v141, (uint64_t)&v193[*(int *)(v188 + 36)], &qword_100052818);
  *(_QWORD *)v144 = v131;
  *(_QWORD *)(v144 + 8) = v133;
  *(_BYTE *)(v144 + 16) = v128;
  *(_QWORD *)(v144 + 24) = v136;
  sub_10000C8C8(v131, v133, v128);
  swift_bridgeObjectRetain(v136);
  sub_1000034BC((uint64_t)v141, &qword_100052818);
  (*(void (**)(char *, uint64_t))(v143 + 8))(v138, v142);
  sub_100008E84(v131, v133, v128);
  v145 = swift_bridgeObjectRelease(v136);
  v146 = static Animation.easeInOut.getter(v145);
  v147 = Animation.delay(_:)(*(double *)(v206 + v205[12]));
  swift_release(v146);
  v149 = *v187;
  v148 = v187[1];
  v150 = v196;
  sub_100003478(v144, v196, &qword_100052820);
  v151 = (uint64_t *)(v150 + *(int *)(v190 + 36));
  *v151 = v147;
  v151[1] = v149;
  v151[2] = v148;
  swift_bridgeObjectRetain(v148);
  sub_1000034BC(v144, &qword_100052820);
  v153 = swift_getKeyPath(&unk_100041538, v152);
  v154 = v197;
  sub_100003478(v150, v197, &qword_100052938);
  v155 = (uint64_t *)(v154 + *(int *)(v191 + 36));
  *v155 = v153;
  v155[1] = 0x3FE3333333333333;
  sub_1000034BC(v150, &qword_100052938);
  v157 = swift_getKeyPath(&unk_100041568, v156);
  v158 = v199;
  sub_100003478(v154, v199, &qword_100052940);
  v159 = v158 + *(int *)(v192 + 36);
  *(_QWORD *)v159 = v157;
  *(_BYTE *)(v159 + 8) = 1;
  sub_1000034BC(v154, &qword_100052940);
  v161 = swift_getKeyPath(&unk_100041598, v160);
  v162 = v195;
  sub_100003478(v158, v195, &qword_100052948);
  v163 = v162 + *(int *)(v194 + 36);
  *(_QWORD *)v163 = v161;
  *(_QWORD *)(v163 + 8) = 1;
  *(_BYTE *)(v163 + 16) = 0;
  sub_1000034BC(v158, &qword_100052948);
  return sub_100034ED8(v162, v204);
}

BOOL sub_100034C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v20 = a1;
  v21 = a2;
  v18 = 0x5D392D305E5BLL;
  v19 = 0xE600000000000000;
  v16 = 0;
  v17 = 0xE000000000000000;
  v6 = sub_100008E40();
  v7 = ((uint64_t (*)(uint64_t *, uint64_t *, uint64_t, _QWORD, _QWORD, uint64_t, void *, void *, void *, unint64_t, unint64_t, unint64_t))StringProtocol.replacingOccurrences<A, B>(of:with:options:range:))(&v18, &v16, 1024, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v6, v6, v6);
  v9 = v8;
  v20 = a3;
  v21 = a4;
  v18 = 0x5D392D305E5BLL;
  v19 = 0xE600000000000000;
  v16 = 0;
  v17 = 0xE000000000000000;
  v10 = ((uint64_t (*)(uint64_t *, uint64_t *, uint64_t, _QWORD, _QWORD, uint64_t, void *, void *, void *, unint64_t, unint64_t, unint64_t))StringProtocol.replacingOccurrences<A, B>(of:with:options:range:))(&v18, &v16, 1024, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v6, v6, v6);
  v12 = v11;
  v13 = String.count.getter(v7, v9);
  swift_bridgeObjectRelease(v9);
  if (v13 < 6)
  {
    v15 = String.count.getter(v10, v12);
    swift_bridgeObjectRelease(v12);
    return v15 < 6;
  }
  else
  {
    swift_bridgeObjectRelease(v12);
    return 0;
  }
}

uint64_t sub_100034D78@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100034DA8(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_100034DD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.allowsTightening.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100034E00(unsigned __int8 *a1)
{
  return EnvironmentValues.allowsTightening.setter(*a1);
}

uint64_t sub_100034E2C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.allowsTightening.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100034E58(unsigned __int8 *a1)
{
  return EnvironmentValues.allowsTightening.setter(*a1);
}

uint64_t sub_100034E7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100034EAC(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_100034ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000033B8(&qword_100052950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100034F24()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052958;
  if (!qword_100052958)
  {
    v1 = sub_1000036E4(&qword_100052950);
    sub_100034FA8();
    sub_100003928((unint64_t *)&qword_1000514A0, &qword_1000514A8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052958);
  }
  return result;
}

unint64_t sub_100034FA8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052960;
  if (!qword_100052960)
  {
    v1 = sub_1000036E4(&qword_100052948);
    sub_10003502C();
    sub_100003928(&qword_100052878, &qword_100052880, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052960);
  }
  return result;
}

unint64_t sub_10003502C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052968;
  if (!qword_100052968)
  {
    v1 = sub_1000036E4(&qword_100052940);
    sub_1000350B0();
    sub_100003928(&qword_100052868, &qword_100052870, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052968);
  }
  return result;
}

unint64_t sub_1000350B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052970;
  if (!qword_100052970)
  {
    v1 = sub_1000036E4(&qword_100052938);
    sub_1000331E0();
    sub_100003928(&qword_100052978, &qword_100052980, (uint64_t)&protocol conformance descriptor for _AnimationModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052970);
  }
  return result;
}

id sub_100035134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (**v3)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id result;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = sub_1000033B8(&qword_100052988);
  __chkstk_darwin(v1);
  v3 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))((char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_1000033B8(&qword_100052990);
  __chkstk_darwin(v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend((id)objc_opt_self(_HKBehavior), "sharedBehavior");
  if (result)
  {
    v8 = result;
    v9 = objc_msgSend(result, "isStandalonePhoneFitnessMode");

    if (v9)
    {
      sub_100035358((uint64_t)v6);
      sub_100003478((uint64_t)v6, (uint64_t)v3, &qword_100052990);
      swift_storeEnumTagMultiPayload(v3, v1, 0);
      v10 = sub_1000033B8(&qword_100052998);
      v11 = sub_100037744();
      v12 = sub_100003928(&qword_1000529B8, &qword_100052998, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
      _ConditionalContent<>.init(storage:)(v3, v4, v10, v11, v12);
      return (id)sub_1000034BC((uint64_t)v6, &qword_100052990);
    }
    else
    {
      v13 = swift_allocObject(&unk_10004FB00, 88, 7);
      v14 = *(_OWORD *)(v0 + 48);
      *(_OWORD *)(v13 + 48) = *(_OWORD *)(v0 + 32);
      *(_OWORD *)(v13 + 64) = v14;
      *(_QWORD *)(v13 + 80) = *(_QWORD *)(v0 + 64);
      v15 = *(_OWORD *)(v0 + 16);
      *(_OWORD *)(v13 + 16) = *(_OWORD *)v0;
      *(_OWORD *)(v13 + 32) = v15;
      *v3 = sub_10003773C;
      v3[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v13;
      swift_storeEnumTagMultiPayload(v3, v1, 1);
      sub_1000283E8(v0);
      v16 = sub_1000033B8(&qword_100052998);
      v17 = sub_100037744();
      v18 = sub_100003928(&qword_1000529B8, &qword_100052998, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
      return (id)_ConditionalContent<>.init(storage:)(v3, v4, v16, v17, v18);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100035358@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t OpaqueTypeConformance2;
  __n128 v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a1;
  v1 = type metadata accessor for AccessibilityChildBehavior(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000033B8(&qword_1000529A8);
  __chkstk_darwin(v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000033B8(&qword_1000529C0);
  v28 = *(_QWORD *)(v8 - 8);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v7 = static HorizontalAlignment.leading.getter(v9);
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v12 = sub_1000033B8(&qword_1000529C8);
  sub_100035574((uint64_t)&v7[*(int *)(v12 + 44)]);
  static AccessibilityChildBehavior.ignore.getter(v13);
  v14 = sub_100003928(&qword_1000529B0, &qword_1000529A8, (uint64_t)&protocol conformance descriptor for VStack<A>);
  View.accessibilityElement(children:)(v4, v5, v14);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_1000034BC((uint64_t)v7, &qword_1000529A8);
  v30 = sub_10002DA60();
  v31 = v15;
  v16 = sub_100008E40();
  v17 = Text.init<A>(_:)(&v30, &type metadata for String, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22 & 1;
  v30 = v5;
  v31 = v14;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v30, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  View.accessibility(label:)(v17, v19, v23, v21, v8, OpaqueTypeConformance2);
  sub_100008E84(v17, v19, v23);
  v25 = swift_bridgeObjectRelease(v21);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v28 + 8))(v11, v8, v25);
}

double sub_100035574@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  __n128 v25;
  uint64_t KeyPath;
  char *v27;
  __n128 v28;
  __n128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
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
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double result;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int8 v82;

  v61 = sub_1000033B8(&qword_100052818);
  __chkstk_darwin(v61);
  v60 = (uint64_t *)((char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v59 = type metadata accessor for ContentTransition(0);
  v58 = *(_QWORD *)(v59 - 8);
  __chkstk_darwin(v59);
  v72 = (char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_1000033B8(&qword_1000529D0);
  __chkstk_darwin(v57);
  v5 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v6);
  v73 = (uint64_t)&v55 - v8;
  v71 = static VerticalAlignment.center.getter(v7);
  sub_100035AF4((uint64_t)&v74);
  v64 = v75;
  v65 = v74;
  v63 = v76;
  v67 = v78;
  v68 = v77;
  v66 = v79;
  v62 = v80;
  v70 = v81;
  v69 = v82;
  v74 = sub_100036F90((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10003AEBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10003AED0);
  v75 = v9;
  v10 = sub_100008E40();
  v11 = Text.init<A>(_:)(&v74, &type metadata for String, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16 & 1;
  v18 = static Font.title.getter(v11);
  v19 = Font.feature(_:)(&off_10004DCA8, v18);
  swift_release(v18);
  v20 = Text.font(_:)(v19, v11, v13, v17, v15);
  v55 = v21;
  v23 = v22;
  v56 = v24;
  swift_release(v19);
  LOBYTE(v19) = v23 & 1;
  sub_100008E84(v11, v13, v17);
  v25 = swift_bridgeObjectRelease(v15);
  KeyPath = swift_getKeyPath(&unk_100041660, v25);
  v27 = v72;
  static ContentTransition.numericText(countsDown:)(0, v28);
  v30 = swift_getKeyPath(&unk_100041690, v29);
  v31 = v60;
  v32 = v58;
  v33 = v59;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))((char *)v60 + *(int *)(v61 + 28), v27, v59);
  *v31 = v30;
  v34 = (uint64_t)v31;
  sub_100003478((uint64_t)v31, (uint64_t)&v5[*(int *)(v57 + 36)], &qword_100052818);
  v35 = v55;
  *(_QWORD *)v5 = v20;
  *((_QWORD *)v5 + 1) = v35;
  v5[16] = v19;
  v36 = v56;
  *((_QWORD *)v5 + 3) = v56;
  *((_QWORD *)v5 + 4) = KeyPath;
  *((_QWORD *)v5 + 5) = 0x3FE3333333333333;
  sub_10000C8C8(v20, v35, v19);
  swift_bridgeObjectRetain(v36);
  swift_retain(KeyPath);
  sub_1000034BC(v34, &qword_100052818);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v72, v33);
  sub_100008E84(v20, v35, v19);
  swift_release(KeyPath);
  swift_bridgeObjectRelease(v36);
  v37 = v73;
  sub_1000082A0((uint64_t)v5, v73, &qword_1000529D0);
  v38 = objc_msgSend((id)objc_opt_self(UIFont), "preferredFontForTextStyle:", UIFontTextStyleTitle1);
  objc_msgSend(v38, "descender");
  v40 = v39;

  v42 = static Alignment.center.getter(v41);
  _FrameLayout.init(width:height:alignment:)(&v74, 0, 1, v40 & 0x7FFFFFFFFFFFFFFFLL, 0, v42, v43);
  v72 = (char *)v74;
  LODWORD(v61) = v75;
  v60 = (uint64_t *)v76;
  LODWORD(v59) = v77;
  v58 = v78;
  v57 = v79;
  sub_100003478(v37, (uint64_t)v5, &qword_1000529D0);
  *(_QWORD *)a1 = v71;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  v45 = v64;
  v44 = v65;
  *(_QWORD *)(a1 + 24) = v65;
  *(_QWORD *)(a1 + 32) = v45;
  v46 = v63;
  v48 = v67;
  v47 = v68;
  *(_QWORD *)(a1 + 40) = v63;
  *(_QWORD *)(a1 + 48) = v47;
  *(_QWORD *)(a1 + 56) = v48;
  LOBYTE(KeyPath) = v66;
  *(_BYTE *)(a1 + 64) = v66;
  v49 = v62;
  v50 = v70;
  *(_QWORD *)(a1 + 72) = v62;
  *(_QWORD *)(a1 + 80) = v50;
  *(_BYTE *)(a1 + 88) = v69;
  *(_QWORD *)(a1 + 96) = 0;
  *(_BYTE *)(a1 + 104) = 0;
  v51 = sub_1000033B8(&qword_1000529D8);
  sub_100003478((uint64_t)v5, a1 + *(int *)(v51 + 64), &qword_1000529D0);
  v52 = a1 + *(int *)(v51 + 80);
  *(_QWORD *)v52 = 0;
  *(_BYTE *)(v52 + 8) = 1;
  *(_QWORD *)(v52 + 16) = v72;
  *(_BYTE *)(v52 + 24) = v61;
  *(_QWORD *)(v52 + 32) = v60;
  *(_BYTE *)(v52 + 40) = v59;
  v53 = v57;
  *(_QWORD *)(v52 + 48) = v58;
  *(_QWORD *)(v52 + 56) = v53;
  swift_retain(v46);
  swift_retain(v44);
  swift_retain(v45);
  sub_10000C8C8(v47, v48, KeyPath);
  swift_bridgeObjectRetain(v49);
  sub_1000034BC(v73, &qword_1000529D0);
  sub_1000034BC((uint64_t)v5, &qword_1000529D0);
  swift_release(v46);
  swift_release(v45);
  swift_release(v44);
  sub_100008E84(v47, v48, KeyPath);
  *(_QWORD *)&result = swift_bridgeObjectRelease(v49).n128_u64[0];
  return result;
}

double sub_100035AF4@<D0>(uint64_t a1@<X8>)
{
  __n128 v2;
  void *v3;
  id v4;
  NSString v5;
  NSString v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSString v12;
  NSString v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  double result;
  uint64_t KeyPath;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];

  v40 = Image.init(_internalSystemName:)(0x7974697669746361, 0xED000065766F6D2ELL);
  v39 = static Font.headline.getter();
  KeyPath = swift_getKeyPath(&unk_1000416C0, v2);
  v3 = (void *)objc_opt_self(NSBundle);
  v4 = objc_msgSend(v3, "mainBundle");
  v5 = String._bridgeToObjectiveC()();
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v4, "localizedStringForKey:value:table:", v5, 0, v6);

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v10 = v9;

  v11 = objc_msgSend(v3, "mainBundle");
  v12 = String._bridgeToObjectiveC()();
  v13 = String._bridgeToObjectiveC()();
  v14 = objc_msgSend(v11, "localizedStringForKey:value:table:", v12, 0, v13);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v16 = v15;

  v17 = sub_100008E40();
  v18 = StringProtocol.localizedUppercase.getter(&type metadata for String, v17);
  v20 = v19;
  swift_bridgeObjectRelease(v16);
  v41[0] = v8;
  v41[1] = v10;
  swift_bridgeObjectRetain(v10);
  v21._countAndFlagsBits = v18;
  v21._object = v20;
  String.append(_:)(v21);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v20);
  v22 = Text.init<A>(_:)(v41, &type metadata for String, v17);
  v24 = v23;
  v26 = v25;
  v28 = v27 & 1;
  v29 = static Font.headline.getter();
  v30 = Text.font(_:)(v29, v22, v24, v28, v26);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  swift_release(v29);
  v34 &= 1u;
  sub_100008E84(v22, v24, v28);
  swift_bridgeObjectRelease(v26);
  *(_QWORD *)a1 = v40;
  *(_QWORD *)(a1 + 8) = KeyPath;
  *(_QWORD *)(a1 + 16) = v39;
  *(_QWORD *)(a1 + 24) = v30;
  *(_QWORD *)(a1 + 32) = v32;
  *(_BYTE *)(a1 + 40) = v34;
  *(_QWORD *)(a1 + 48) = v36;
  *(_QWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 64) = 1;
  swift_retain(v40);
  swift_retain(KeyPath);
  swift_retain(v39);
  sub_10000C8C8(v30, v32, v34);
  swift_bridgeObjectRetain(v36);
  sub_100008E84(v30, v32, v34);
  swift_release(v39);
  swift_release(KeyPath);
  swift_release(v40);
  *(_QWORD *)&result = swift_bridgeObjectRelease(v36).n128_u64[0];
  return result;
}

uint64_t *sub_100035E2C@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
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
  __n128 v13;
  uint64_t KeyPath;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  __n128 v34;
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
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  unint64_t v53;
  __n128 v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  __n128 v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __n128 v71;
  __n128 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _OWORD *v87;
  _OWORD *v88;
  __int128 v89;
  __n128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _OWORD *v114;
  double *v115;
  double v116;
  uint64_t v117;
  uint64_t v118;
  char v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  uint64_t v125;
  char v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __n128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  uint64_t v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __n128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint64_t v161;
  _OWORD v162[8];
  uint64_t v163;
  _OWORD v164[10];
  uint64_t v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __n128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  uint64_t v176;
  _OWORD v177[8];
  uint64_t v178;

  v114 = a1;
  v110 = sub_1000033B8(&qword_100052818);
  __chkstk_darwin(v110);
  v109 = (uint64_t *)((char *)&v100 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = type metadata accessor for ContentTransition(0);
  v107 = *(_QWORD *)(v3 - 8);
  v108 = v3;
  __chkstk_darwin(v3);
  v104 = (char *)&v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = sub_1000033B8(&qword_100052A28);
  __chkstk_darwin(v106);
  v105 = (char *)&v100 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = sub_1000033B8(&qword_100052A30);
  __chkstk_darwin(v113);
  v111 = (uint64_t)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v112 = (uint64_t)&v100 - v8;
  v9 = *v1;
  v10 = v1[1];
  swift_bridgeObjectRetain(v10);
  v11 = Image.init(_internalSystemName:)(v9, v10);
  v12 = static Font.headline.getter();
  KeyPath = swift_getKeyPath(&unk_1000416C0, v13);
  *(_QWORD *)&v116 = v1[6];
  v15 = v116;
  v16 = static Alignment.center.getter(KeyPath);
  sub_10002A6AC(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)&v131, 0.0, 1, v15, 0, v16, v17, v11, KeyPath, v12);
  swift_release(v12);
  swift_release(KeyPath);
  swift_release(v11);
  v115 = (double *)v1;
  v18 = v1[2];
  v19 = v1[3];
  *(_QWORD *)&v166 = v18;
  *((_QWORD *)&v166 + 1) = v19;
  v20 = sub_100008E40();
  v101 = v20;
  swift_bridgeObjectRetain(v19);
  v21 = Text.init<A>(_:)(&v166, &type metadata for String, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26 & 1;
  v28 = static Font.headline.getter();
  v29 = Text.font(_:)(v28, v21, v23, v27, v25);
  v31 = v30;
  LOBYTE(v20) = v32;
  v103 = v33;
  swift_release(v28);
  LOBYTE(v28) = v20 & 1;
  sub_100008E84(v21, v23, v27);
  v34 = swift_bridgeObjectRelease(v25);
  v35 = swift_getKeyPath(&unk_100041748, v34);
  v124 = v29;
  v125 = v31;
  v126 = v28;
  v36 = v103;
  v127 = v103;
  v128 = v35;
  v129 = 1;
  v130 = 0;
  v37 = static Alignment.center.getter(v35);
  sub_10002A880(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)&v166, 0.0, 1, v116, 0, v37, v38);
  sub_100008E84(v29, v31, v28);
  swift_release(v35);
  swift_bridgeObjectRelease(v36);
  v148 = v174;
  v149 = v175;
  v150 = v176;
  v144 = v170;
  v145 = v171;
  v146 = v172;
  v147 = v173;
  v140 = v166;
  v141 = v167;
  v142 = v168;
  v143 = v169;
  v39 = *((_QWORD *)v115 + 4);
  v102 = *((_QWORD *)v115 + 5);
  v103 = v39;
  *(_QWORD *)&v166 = v39;
  *((_QWORD *)&v166 + 1) = v102;
  swift_bridgeObjectRetain(v102);
  v40 = Text.init<A>(_:)(&v166, &type metadata for String, v101);
  v42 = v41;
  v44 = v43;
  v46 = v45 & 1;
  v47 = static Font.body.getter(v40);
  v48 = Font.feature(_:)(&off_10004DCD8, v47);
  swift_release(v47);
  v49 = Text.font(_:)(v48, v40, v42, v46, v44);
  v51 = v50;
  LOBYTE(v29) = v52;
  v101 = v53;
  swift_release(v48);
  sub_100008E84(v40, v42, v46);
  v54 = swift_bridgeObjectRelease(v44);
  v55 = swift_getKeyPath(&unk_100041748, v54);
  v117 = v49;
  v118 = v51;
  v119 = v29 & 1;
  v56 = v101;
  v120 = v101;
  v121 = v55;
  v122 = 1;
  v123 = 0;
  v57 = static Alignment.center.getter(v55);
  sub_10002A880(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)&v166, 0.0, 1, v116, 0, v57, v58);
  sub_100008E84(v49, v51, v29 & 1);
  swift_release(v55);
  swift_bridgeObjectRelease(v56);
  v159 = v174;
  v160 = v175;
  v161 = v176;
  v155 = v170;
  v156 = v171;
  v157 = v172;
  v158 = v173;
  v151 = v166;
  v152 = v167;
  v153 = v168;
  v154 = v169;
  v59 = v104;
  static ContentTransition.numericText(countsDown:)(0, v169);
  v61 = swift_getKeyPath(&unk_100041690, v60);
  v62 = v109;
  v64 = v107;
  v63 = v108;
  (*(void (**)(char *, char *, uint64_t))(v107 + 16))((char *)v109 + *(int *)(v110 + 28), v59, v108);
  v65 = (uint64_t)v62;
  *v62 = v61;
  v66 = (uint64_t)v105;
  sub_100003478(v65, (uint64_t)&v105[*(int *)(v106 + 36)], &qword_100052818);
  v67 = v160;
  *(_OWORD *)(v66 + 128) = v159;
  *(_OWORD *)(v66 + 144) = v67;
  *(_QWORD *)(v66 + 160) = v161;
  v68 = v156;
  *(_OWORD *)(v66 + 64) = v155;
  *(_OWORD *)(v66 + 80) = v68;
  v69 = v158;
  *(_OWORD *)(v66 + 96) = v157;
  *(_OWORD *)(v66 + 112) = v69;
  v70 = v152;
  *(_OWORD *)v66 = v151;
  *(_OWORD *)(v66 + 16) = v70;
  v71 = v154;
  *(_OWORD *)(v66 + 32) = v153;
  *(__n128 *)(v66 + 48) = v71;
  sub_100037D1C((uint64_t)&v151);
  sub_1000034BC(v65, &qword_100052818);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v59, v63);
  sub_100037D68((uint64_t)&v151);
  v73 = static Animation.easeInOut.getter(v72);
  v74 = Animation.delay(_:)(v115[7]);
  swift_release(v73);
  v75 = v111;
  sub_100003478(v66, v111, &qword_100052A28);
  v76 = (uint64_t *)(v75 + *(int *)(v113 + 36));
  v77 = v102;
  v78 = v103;
  *v76 = v74;
  v76[1] = v78;
  v76[2] = v77;
  swift_bridgeObjectRetain(v77);
  sub_1000034BC(v66, &qword_100052A28);
  v79 = v112;
  sub_1000082A0(v75, v112, &qword_100052A30);
  sub_100003478(v79, v75, &qword_100052A30);
  v80 = v138;
  v162[6] = v137;
  v162[7] = v138;
  v81 = v133;
  v82 = v134;
  v162[2] = v133;
  v162[3] = v134;
  v83 = v136;
  v84 = v135;
  v162[4] = v135;
  v162[5] = v136;
  v85 = v132;
  v86 = v131;
  v162[0] = v131;
  v162[1] = v132;
  v87 = v114;
  v114[6] = v137;
  v87[7] = v80;
  v87[2] = v81;
  v87[3] = v82;
  v87[4] = v84;
  v87[5] = v83;
  *v87 = v86;
  v87[1] = v85;
  v88 = v87;
  v89 = v148;
  v164[8] = v148;
  v164[9] = v149;
  v90 = v143;
  v91 = v144;
  v164[4] = v144;
  v164[5] = v145;
  v92 = v145;
  v93 = v146;
  v164[6] = v146;
  v164[7] = v147;
  v164[0] = v140;
  v164[1] = v141;
  v95 = v140;
  v94 = v141;
  v96 = v142;
  v164[2] = v142;
  v164[3] = v143;
  v87 = (_OWORD *)((char *)v87 + 136);
  *(_OWORD *)((char *)v88 + 248) = v147;
  v97 = v149;
  v87[8] = v89;
  v87[9] = v97;
  *(__n128 *)((char *)v88 + 184) = v90;
  *(_OWORD *)((char *)v88 + 200) = v91;
  *(_OWORD *)((char *)v88 + 216) = v92;
  *(_OWORD *)((char *)v88 + 232) = v93;
  *(_OWORD *)((char *)v88 + 136) = v95;
  *(_OWORD *)((char *)v88 + 152) = v94;
  v163 = v139;
  *((_QWORD *)v88 + 16) = v139;
  v165 = v150;
  *((_QWORD *)v88 + 37) = v150;
  *(_OWORD *)((char *)v88 + 168) = v96;
  v98 = sub_1000033B8(&qword_100052A38);
  sub_100003478(v75, (uint64_t)v88 + *(int *)(v98 + 64), &qword_100052A30);
  sub_100037DB4((uint64_t *)v162);
  sub_100037D1C((uint64_t)v164);
  sub_1000034BC(v79, &qword_100052A30);
  sub_1000034BC(v75, &qword_100052A30);
  v174 = v148;
  v175 = v149;
  v176 = v150;
  v170 = v144;
  v171 = v145;
  v172 = v146;
  v173 = v147;
  v166 = v140;
  v167 = v141;
  v168 = v142;
  v169 = v143;
  sub_100037D68((uint64_t)&v166);
  v177[6] = v137;
  v177[7] = v138;
  v178 = v139;
  v177[2] = v133;
  v177[3] = v134;
  v177[4] = v135;
  v177[5] = v136;
  v177[0] = v131;
  v177[1] = v132;
  return sub_100037DF8((uint64_t *)v177);
}

uint64_t *sub_10003667C@<X0>(_OWORD *a1@<X8>)
{
  return sub_100035E2C(a1);
}

uint64_t sub_1000366B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  __n128 v6;
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t OpaqueTypeConformance2;
  uint64_t v39;
  __n128 v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48[16];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v42 = a2;
  v47 = a3;
  v5 = type metadata accessor for AccessibilityChildBehavior(0);
  v43 = *(_QWORD *)(v5 - 8);
  v44 = v5;
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PinnedScrollableViews(0, v6);
  __chkstk_darwin(v9);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000033B8(&qword_1000529E0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1000033B8(&qword_1000529E8);
  v17 = *(_QWORD *)(v16 - 8);
  v45 = v16;
  v46 = v17;
  __chkstk_darwin(v16);
  v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = GeometryProxy.size.getter(v20);
  v22 = sub_100037888(v21);
  v49 = a2;
  v50 = a1;
  v23 = static HorizontalAlignment.center.getter(v22);
  LODWORD(v51) = 0;
  v24 = sub_100008304(&qword_1000529F0, (uint64_t (*)(uint64_t))&type metadata accessor for PinnedScrollableViews, (uint64_t)&protocol conformance descriptor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)(&v51, v9, v24);
  v25 = sub_1000033B8(&qword_1000529F8);
  v26 = sub_100003928(&qword_100052A00, &qword_1000529F8, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  v27 = LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)(v22, v23, 0, 0, v11, sub_100037A48, v48, v25, v26);
  static AccessibilityChildBehavior.ignore.getter(v27);
  v28 = sub_100003928(&qword_100052A08, &qword_1000529E0, (uint64_t)&protocol conformance descriptor for LazyVGrid<A>);
  View.accessibilityElement(children:)(v8, v12, v28);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v8, v44);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v51 = sub_10003712C();
  v52 = v29;
  v30 = sub_100008E40();
  v31 = Text.init<A>(_:)(&v51, &type metadata for String, v30);
  v33 = v32;
  v35 = v34;
  v37 = v36 & 1;
  v51 = v12;
  v52 = v28;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v51, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  v39 = v45;
  View.accessibility(label:)(v31, v33, v37, v35, v45, OpaqueTypeConformance2);
  sub_100008E84(v31, v33, v37);
  v40 = swift_bridgeObjectRelease(v35);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v46 + 8))(v19, v39, v40);
}

void sub_10003699C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  NSString v15;
  NSString v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  double v24;
  double v25;
  unint64_t v26;
  double v27;
  id v28;
  NSString v29;
  NSString v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  unint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  sub_10003BDC4(*(id *)(a1 + 24), *(id *)(a1 + 32));
  v5 = v4;
  v6 = sub_100008E40();
  v7 = StringProtocol.localizedUppercase.getter(&type metadata for String, v6);
  v46 = v8;
  v47 = v7;
  swift_bridgeObjectRelease(v5);
  v45 = sub_100036F90((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10003AEBC, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10003AED0);
  v10 = v9;
  GeometryProxy.size.getter(v45);
  v12 = v11;
  v13 = (void *)objc_opt_self(NSBundle);
  v14 = objc_msgSend(v13, "mainBundle");
  v15 = String._bridgeToObjectiveC()();
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend(v14, "localizedStringForKey:value:table:", v15, 0, v16);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v19 = v18;

  v44 = StringProtocol.localizedUppercase.getter(&type metadata for String, v6);
  v21 = v20;
  swift_bridgeObjectRelease(v19);
  v22 = sub_100036D94();
  v42 = v23;
  v43 = v22;
  v24 = GeometryProxy.size.getter(v22);
  v26 = 0xED00006C6C6F722ELL;
  if ((*(_BYTE *)(a1 + 8) & 1) == 0)
    v26 = 0xEE00646E6174732ELL;
  v41 = v26;
  v27 = v25 / 3.0;
  v28 = objc_msgSend(v13, "mainBundle", v24);
  v29 = String._bridgeToObjectiveC()();
  v30 = String._bridgeToObjectiveC()();
  v31 = objc_msgSend(v28, "localizedStringForKey:value:table:", v29, 0, v30);

  static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
  v33 = v32;

  v34 = StringProtocol.localizedUppercase.getter(&type metadata for String, v6);
  v36 = v35;
  swift_bridgeObjectRelease(v33);
  v37 = sub_100036F90((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10003B020, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_10003B034);
  v39 = v38;
  GeometryProxy.size.getter(v37);
  strcpy((char *)a2, "activity.move");
  *(_WORD *)(a2 + 14) = -4864;
  *(_QWORD *)(a2 + 16) = v47;
  *(_QWORD *)(a2 + 24) = v46;
  *(_QWORD *)(a2 + 32) = v45;
  *(_QWORD *)(a2 + 40) = v10;
  *(double *)(a2 + 48) = v12 / 3.0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0xD000000000000011;
  *(_QWORD *)(a2 + 72) = 0x8000000100049430;
  *(_QWORD *)(a2 + 80) = v44;
  *(_QWORD *)(a2 + 88) = v21;
  *(_QWORD *)(a2 + 96) = v43;
  *(_QWORD *)(a2 + 104) = v42;
  *(double *)(a2 + 112) = v27;
  *(_QWORD *)(a2 + 120) = 0x3FC3333333333333;
  *(_QWORD *)(a2 + 128) = 0x7974697669746361;
  *(_QWORD *)(a2 + 136) = v41;
  *(_QWORD *)(a2 + 144) = v34;
  *(_QWORD *)(a2 + 152) = v36;
  *(_QWORD *)(a2 + 160) = v37;
  *(_QWORD *)(a2 + 168) = v39;
  *(double *)(a2 + 176) = v40 / 3.0;
  *(_QWORD *)(a2 + 184) = 0x3FD3333333333333;
  swift_bridgeObjectRetain(0xED000065766F6D2ELL);
  swift_bridgeObjectRetain(v46);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(0x8000000100049430);
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v46);
  swift_bridgeObjectRelease(0xED000065766F6D2ELL);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(0x8000000100049430);
}

id sub_100036D94()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  NSString v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  Swift::String v15;
  id v16;
  id v17;
  id v18;
  id result;
  void *v20;
  void *v21;
  Swift::String v22;

  v1 = (void *)v0[3];
  v2 = (void *)v0[4];
  v4 = v0[5];
  v3 = (void *)v0[6];
  v5 = sub_10003B00C(v1, v2, v4, (uint64_t)v3);
  v7 = v6;
  v8 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v9 = String._bridgeToObjectiveC()();
  v10 = String._bridgeToObjectiveC()();
  v11 = objc_msgSend(v8, "localizedStringForKey:value:table:", v9, 0, v10);

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v14 = v13;

  swift_bridgeObjectRetain(v7);
  v15._countAndFlagsBits = v12;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v14);
  v16 = v5;
  if (!v2)
    goto LABEL_4;
  v17 = v2;
  if (objc_msgSend(v17, "paused"))
  {

LABEL_4:
    swift_bridgeObjectRetain(v3);
LABEL_7:
    swift_bridgeObjectRetain(v7);
    v22._countAndFlagsBits = v4;
    v22._object = v3;
    String.append(_:)(v22);
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v3);
    return v16;
  }
  v18 = objc_msgSend(v17, "exerciseTimeGoal");
  result = objc_msgSend(v1, "localizedStringWithBriskMinutes:", v18);
  if (result)
  {
    v20 = result;
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    v3 = v21;

    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_100036F90(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSString v11;
  NSString v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  Swift::String v17;
  uint64_t v18;
  void *v19;
  void *v20;
  Swift::String v21;

  v3 = v2[3];
  v4 = v2[4];
  v5 = v2[5];
  v6 = v2[6];
  v7 = a1(v3, v4, v5, v6);
  v9 = v8;
  v10 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v11 = String._bridgeToObjectiveC()();
  v12 = String._bridgeToObjectiveC()();
  v13 = objc_msgSend(v10, "localizedStringForKey:value:table:", v11, 0, v12);

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  v16 = v15;

  swift_bridgeObjectRetain(v9);
  v17._countAndFlagsBits = v14;
  v17._object = v16;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v16);
  v18 = a2(v3, v4, v5, v6);
  v20 = v19;
  swift_bridgeObjectRetain(v9);
  v21._countAndFlagsBits = v18;
  v21._object = v20;
  String.append(_:)(v21);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v20);
  return v7;
}

uint64_t sub_10003712C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  NSString v3;
  NSString v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSString v9;
  NSString v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  uint64_t v21;
  id v22;
  NSString v23;
  NSString v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  Swift::String v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  Swift::String v34;
  id v35;
  NSString v36;
  NSString v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  Swift::String v42;
  uint64_t v43;
  void *v44;
  void *v45;
  Swift::String v46;
  _BYTE v48[8];
  id v49;

  v1 = v0;
  sub_1000082A0(v0 + 16, (uint64_t)v48, (uint64_t *)&unk_100051990);
  sub_1000082A0((uint64_t)v48, (uint64_t)&v49, (uint64_t *)&unk_100051990);
  if (v49 && objc_msgSend(v49, "paused"))
  {
    v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v3 = String._bridgeToObjectiveC()();
    v4 = String._bridgeToObjectiveC()();
    v5 = objc_msgSend(v2, "localizedStringForKey:value:table:", v3, 0, v4);

    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  }
  else
  {
    v7 = (void *)objc_opt_self(NSBundle);
    v8 = objc_msgSend(v7, "mainBundle");
    v9 = String._bridgeToObjectiveC()();
    v10 = String._bridgeToObjectiveC()();
    v11 = objc_msgSend(v8, "localizedStringForKey:value:table:", v9, 0, v10);

    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    v14 = v13;

    v15 = *(void **)(v1 + 32);
    sub_10003B75C(v15);
    v17 = v16;
    v19 = v18;
    swift_bridgeObjectRetain(v14);
    v20._countAndFlagsBits = v17;
    v20._object = v19;
    String.append(_:)(v20);
    swift_bridgeObjectRelease(v14);
    v21 = v12;
    v22 = objc_msgSend(v7, "mainBundle", swift_bridgeObjectRelease(v19).n128_f64[0]);
    v23 = String._bridgeToObjectiveC()();
    v24 = String._bridgeToObjectiveC()();
    v25 = objc_msgSend(v22, "localizedStringForKey:value:table:", v23, 0, v24);

    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
    v28 = v27;

    swift_bridgeObjectRetain(v14);
    v29._countAndFlagsBits = v26;
    v29._object = v28;
    String.append(_:)(v29);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v28);
    sub_10003BEE8(v15);
    v31 = v30;
    v33 = v32;
    swift_bridgeObjectRetain(v14);
    v34._countAndFlagsBits = v31;
    v34._object = v33;
    String.append(_:)(v34);
    swift_bridgeObjectRelease(v14);
    v35 = objc_msgSend(v7, "mainBundle", swift_bridgeObjectRelease(v33).n128_f64[0]);
    v36 = String._bridgeToObjectiveC()();
    v37 = String._bridgeToObjectiveC()();
    v38 = objc_msgSend(v35, "localizedStringForKey:value:table:", v36, 0, v37);

    v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
    v41 = v40;

    swift_bridgeObjectRetain(v14);
    v42._countAndFlagsBits = v39;
    v42._object = v41;
    String.append(_:)(v42);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v41);
    v43 = sub_10003C1C0(v15);
    v45 = v44;
    swift_bridgeObjectRetain(v14);
    v46._countAndFlagsBits = v43;
    v46._object = v45;
    String.append(_:)(v46);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v45);
    return v21;
  }
  return v6;
}

id sub_1000375A8()
{
  return sub_100035134();
}

uint64_t sub_1000375E8()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_100037608(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ContentTransition(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.contentTransition.setter(v3);
}

void sub_100037684(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_1000376AC(double *a1)
{
  return EnvironmentValues.minimumScaleFactor.setter(*a1);
}

ValueMetadata *type metadata accessor for RectangularView()
{
  return &type metadata for RectangularView;
}

uint64_t sub_1000376E0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000424CC, 1);
}

uint64_t sub_1000376F0()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 80));
  return swift_deallocObject(v0, 88, 7);
}

uint64_t sub_10003773C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1000366B4(a1, v2 + 16, a2);
}

unint64_t sub_100037744()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1000529A0;
  if (!qword_1000529A0)
  {
    v1 = sub_1000036E4(&qword_100052990);
    v2[0] = sub_1000036E4(&qword_1000529A8);
    v2[1] = sub_100003928(&qword_1000529B0, &qword_1000529A8, (uint64_t)&protocol conformance descriptor for VStack<A>);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    sub_100008304((unint64_t *)&qword_100051628, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000529A0);
  }
  return result;
}

void sub_100037810(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100037838(double *a1)
{
  return EnvironmentValues.minimumScaleFactor.setter(*a1);
}

uint64_t sub_10003785C()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_100037888(double a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v2 = type metadata accessor for GridItem.Size(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (uint64_t *)((char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_1000033B8(&qword_100052A10);
  v7 = *(_QWORD *)(type metadata accessor for GridItem(0) - 8);
  v8 = swift_allocObject(v6, ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ 3 * *(_QWORD *)(v7 + 72), *(unsigned __int8 *)(v7 + 80) | 7);
  *(_OWORD *)(v8 + 16) = xmmword_1000415D0;
  *v5 = 0x4034000000000000;
  v9 = enum case for GridItem.Size.fixed(_:);
  v10 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v3 + 104);
  v11 = v10(v5, enum case for GridItem.Size.fixed(_:), v2);
  v12 = static Alignment.leading.getter(v11);
  GridItem.init(_:spacing:alignment:)(v5, 0, 0, v12, v13, 0);
  *(_OWORD *)v5 = xmmword_1000415E0;
  v14 = v10(v5, enum case for GridItem.Size.flexible(_:), v2);
  v15 = static Alignment.leading.getter(v14);
  GridItem.init(_:spacing:alignment:)(v5, 0x4008000000000000, 0, v15, v16, 0);
  *(double *)v5 = a1 * 0.5 + 6.0;
  v17 = v10(v5, v9, v2);
  v18 = static Alignment.leading.getter(v17);
  GridItem.init(_:spacing:alignment:)(v5, 0, 0, v18, v19, 0);
  return v8;
}

void sub_100037A48(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_10003699C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t destroy for RectangularView.GridRow(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  return swift_bridgeObjectRelease(a1[5]);
}

uint64_t initializeWithCopy for RectangularView.GridRow(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

_QWORD *assignWithCopy for RectangularView.GridRow(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[6] = a2[6];
  a1[7] = a2[7];
  return a1;
}

uint64_t assignWithTake for RectangularView.GridRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease(v9);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for RectangularView.GridRow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RectangularView.GridRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RectangularView.GridRow()
{
  return &type metadata for RectangularView.GridRow;
}

unint64_t sub_100037C80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052A18;
  if (!qword_100052A18)
  {
    v1 = sub_1000036E4(&qword_100052A20);
    sub_100037744();
    sub_100003928(&qword_1000529B8, &qword_100052998, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100052A18);
  }
  return result;
}

uint64_t sub_100037D04(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000424F4, 1);
}

uint64_t sub_100037D1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  sub_10000C8C8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain(v2);
  swift_retain(v3);
  return a1;
}

uint64_t sub_100037D68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  sub_100008E84(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t *sub_100037DB4(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  swift_retain(a1[2]);
  swift_retain(v2);
  swift_retain(v3);
  return a1;
}

uint64_t *sub_100037DF8(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[2];
  swift_release(a1[1]);
  swift_release(v2);
  swift_release(v3);
  return a1;
}

uint64_t sub_100037E3C()
{
  return sub_100003928(&qword_100052A40, &qword_100052A48, (uint64_t)&protocol conformance descriptor for TupleView<A>);
}

void sub_100037E68(char a1@<W0>, void *a2@<X1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, void *a6@<X5>, _QWORD *a7@<X8>, __n128 a8@<Q0>)
{
  uint64_t v10;
  int *v11;
  _QWORD *v12;
  __n128 v13;
  uint64_t v14;
  _QWORD *v15;
  __n128 v16;
  uint64_t v17;
  uint64_t *v18;
  void *v19;
  id v20;
  NSString v21;
  NSString v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unsigned __int8 v28;
  id v29;
  id v30;
  NSString v31;
  NSString v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;

  *a7 = swift_getKeyPath(&unk_100041780, a8);
  v10 = sub_1000033B8(&qword_100051B90);
  swift_storeEnumTagMultiPayload(a7, v10, 0);
  v11 = (int *)type metadata accessor for StandaloneMetricsStack(0);
  v12 = (_QWORD *)((char *)a7 + v11[5]);
  *v12 = swift_getKeyPath(&unk_1000417B0, v13);
  v14 = sub_1000033B8(&qword_100051B88);
  swift_storeEnumTagMultiPayload(v12, v14, 0);
  v15 = (_QWORD *)((char *)a7 + v11[6]);
  *v15 = swift_getKeyPath(&unk_1000417E0, v16);
  v17 = sub_1000033B8(&qword_100051D88);
  swift_storeEnumTagMultiPayload(v15, v17, 0);
  v18 = (_QWORD *)((char *)a7 + v11[14]);
  v19 = (void *)objc_opt_self(NSBundle);
  v20 = objc_msgSend(v19, "mainBundle");
  v21 = String._bridgeToObjectiveC()();
  v22 = String._bridgeToObjectiveC()();
  v23 = objc_msgSend(v20, "localizedStringForKey:value:table:", v21, 0, v22);

  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
  v26 = v25;

  *v18 = v24;
  v18[1] = v26;
  *((_BYTE *)a7 + v11[7]) = a1;
  *(_QWORD *)((char *)a7 + v11[8]) = a2;
  *((_BYTE *)a7 + v11[12]) = a5;
  *((_BYTE *)a7 + v11[9]) = a3;
  v27 = a2;
  if (a6)
    v28 = objc_msgSend(a6, "paused");
  else
    v28 = 0;
  *((_BYTE *)a7 + v11[10]) = v28;
  *((_BYTE *)a7 + v11[11]) = a4 & 1;
  *(_QWORD *)((char *)a7 + v11[13]) = a6;
  v29 = a6;
  v30 = objc_msgSend(v19, "mainBundle");
  v31 = String._bridgeToObjectiveC()();
  v32 = String._bridgeToObjectiveC()();
  v33 = objc_msgSend(v30, "localizedStringForKey:value:table:", v31, 0, v32);

  v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
  v36 = v35;

  v37 = (_QWORD *)((char *)a7 + v11[15]);
  *v37 = v27;
  v37[1] = a6;
  v37[2] = v34;
  v37[3] = v36;
}

uint64_t sub_100038148@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = sub_1000033B8(&qword_100052B10);
  __chkstk_darwin(v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v14 - v9;
  *(_QWORD *)v10 = static HorizontalAlignment.leading.getter(v8);
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 0;
  v11 = sub_1000033B8(&qword_100052B18);
  sub_100038250(a1, (uint64_t)&v10[*(int *)(v11 + 44)]);
  sub_100003478((uint64_t)v10, (uint64_t)v6, &qword_100052B10);
  sub_100003478((uint64_t)v6, a2, &qword_100052B10);
  v12 = a2 + *(int *)(sub_1000033B8(&qword_100052B20) + 48);
  *(_QWORD *)v12 = 0;
  *(_BYTE *)(v12 + 8) = 0;
  sub_1000034BC((uint64_t)v10, &qword_100052B10);
  return sub_1000034BC((uint64_t)v6, &qword_100052B10);
}

uint64_t sub_100038250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int *v3;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __n128 v62;
  uint64_t v63;
  char *v64;
  BOOL v65;
  id v66;
  NSString v67;
  NSString v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  __n128 v97;
  uint64_t v98;
  _QWORD *v99;
  __n128 v100;
  uint64_t v101;
  _QWORD *v102;
  unint64_t v103;
  _QWORD *v104;
  _QWORD *v105;
  char *v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t OpaqueTypeConformance2;
  uint64_t v119;
  _QWORD *v120;
  uint64_t v121;
  int *v122;
  __n128 v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  NSString v129;
  NSString v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  char v148;
  void (*v149)(char *, uint64_t);
  char *v150;
  uint64_t v151;
  __n128 v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  id v157;
  id v158;
  id v159;
  double v160;
  double v161;
  void *v162;
  id v163;
  id v164;
  uint64_t v165;
  __n128 v166;
  char v167;
  uint64_t KeyPath;
  uint64_t v169;
  int *v170;
  _QWORD *v171;
  __n128 v172;
  uint64_t *v173;
  _QWORD *v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  uint64_t v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  char v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  __n128 v193;
  uint64_t v194;
  uint64_t v195;
  id v196;
  NSString v197;
  NSString v198;
  id v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t *v206;
  uint64_t v207;
  uint64_t v208;
  char *v209;
  char v210;
  char *v211;
  uint64_t v212;
  void (*v213)(uint64_t, uint64_t);
  __n128 v214;
  uint64_t v215;
  uint64_t v216;
  id v217;
  uint64_t v218;
  uint64_t v219;
  int *v220;
  int v221;
  __n128 v222;
  int v223;
  id v224;
  unint64_t v225;
  unint64_t v226;
  char v227;
  uint64_t v228;
  uint64_t v229;
  int *v230;
  _QWORD *v231;
  __n128 v232;
  _QWORD *v233;
  _QWORD *v234;
  uint64_t v235;
  uint64_t v236;
  char *v237;
  char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  char v245;
  char v246;
  uint64_t v247;
  uint64_t v248;
  __n128 v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  int *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v265;
  char *v266;
  char *v267;
  uint64_t v268;
  char *v269;
  uint64_t v270;
  uint64_t v271;
  char *v272;
  char *v273;
  char *v274;
  uint64_t v275;
  char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  char *v280;
  uint64_t v281;
  char *v282;
  uint64_t v283;
  _QWORD *v284;
  void (*v285)(char *, uint64_t, uint64_t, uint64_t, __n128);
  uint64_t v286;
  unint64_t v287;
  void (*v288)(char *, uint64_t);
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  char *v292;
  uint64_t v293;
  uint64_t *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  _QWORD *v300;
  uint64_t v301;
  uint64_t v302;
  unint64_t v303;
  uint64_t v304;
  char *v305;
  uint64_t v306;
  uint64_t v307;
  char *v308;
  uint64_t v309;
  char *v310;
  uint64_t v311;
  uint64_t v312;
  int *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;

  v301 = a2;
  v3 = (int *)type metadata accessor for StandaloneMetricsStack(0);
  __chkstk_darwin(v3);
  v272 = (char *)&v265 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v293 = type metadata accessor for WidgetRenderingMode(0);
  v265 = *(_QWORD *)(v293 - 8);
  __chkstk_darwin(v293);
  v292 = (char *)&v265 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v291 = (uint64_t)&v265 - v7;
  v295 = type metadata accessor for StandaloneMetricView(0);
  __chkstk_darwin(v295);
  v275 = (uint64_t)&v265 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v294 = (uint64_t *)((char *)&v265 - v10);
  __chkstk_darwin(v11);
  v268 = (uint64_t)&v265 - v12;
  v297 = sub_1000033B8(&qword_100052B28);
  v270 = *(_QWORD *)(v297 - 8);
  __chkstk_darwin(v297);
  v276 = (char *)&v265 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v269 = (char *)&v265 - v15;
  v296 = sub_1000033B8(&qword_100052B30);
  __chkstk_darwin(v296);
  v278 = (uint64_t)&v265 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v279 = (uint64_t)&v265 - v18;
  __chkstk_darwin(v19);
  v274 = (char *)&v265 - v20;
  __chkstk_darwin(v21);
  v273 = (char *)&v265 - v22;
  __chkstk_darwin(v23);
  v277 = (uint64_t)&v265 - v24;
  __chkstk_darwin(v25);
  v267 = (char *)&v265 - v26;
  __chkstk_darwin(v27);
  v266 = (char *)&v265 - v28;
  __chkstk_darwin(v29);
  v306 = (uint64_t)&v265 - v30;
  v31 = sub_1000033B8(&qword_100052B38);
  __chkstk_darwin(v31);
  v33 = (char *)&v265 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  v299 = (uint64_t)&v265 - v35;
  v36 = type metadata accessor for AccessibilityChildBehavior(0);
  v37 = *(_QWORD *)(v36 - 8);
  v311 = v36;
  v312 = v37;
  __chkstk_darwin(v36);
  v310 = (char *)&v265 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = (int *)type metadata accessor for FractionView(0);
  __chkstk_darwin(v39);
  v41 = (uint64_t *)((char *)&v265 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0));
  v284 = (_QWORD *)sub_1000033B8(&qword_100052B40);
  v283 = *(v284 - 1);
  __chkstk_darwin(v284);
  v282 = (char *)&v265 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v281 = sub_1000033B8(&qword_100052B48);
  __chkstk_darwin(v281);
  v280 = (char *)&v265 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v44);
  v308 = (char *)&v265 - v45;
  __chkstk_darwin(v46);
  v307 = (uint64_t)&v265 - v47;
  v48 = type metadata accessor for HeaderLabel(0);
  v303 = *(_QWORD *)(v48 - 8);
  __chkstk_darwin(v48);
  v50 = (char *)&v265 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v51);
  v290 = (uint64_t)&v265 - v52;
  v53 = sub_1000033B8(&qword_100052B50);
  __chkstk_darwin(v53);
  v271 = (uint64_t)&v265 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v55);
  v298 = (uint64_t)&v265 - v56;
  __chkstk_darwin(v57);
  v302 = (uint64_t)&v265 - v58;
  __chkstk_darwin(v59);
  v304 = (uint64_t)&v265 - v60;
  v62 = __chkstk_darwin(v61);
  v64 = (char *)&v265 - v63;
  v286 = v3[11];
  v65 = *(_BYTE *)(a1 + v286) == 1;
  v313 = v3;
  v314 = a1;
  v309 = v48;
  v300 = v33;
  v305 = (char *)&v265 - v63;
  if (v65)
  {
    v66 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v67 = String._bridgeToObjectiveC()();
    v68 = String._bridgeToObjectiveC()();
    v69 = objc_msgSend(v66, "localizedStringForKey:value:table:", v67, 0, v68);

    v3 = v313;
    v70 = static String._unconditionallyBridgeFromObjectiveC(_:)(v69);
    v71 = a1;
    v73 = v72;

    if (*(_BYTE *)(v71 + v3[10]) == 1)
    {
      if (qword_100051198 != -1)
        swift_once(&qword_100051198, sub_100017CF0);
      v74 = &qword_1000548C0;
    }
    else
    {
      if (qword_100051140 != -1)
        swift_once(&qword_100051140, sub_100017A9C);
      v74 = &qword_100054868;
    }
    v64 = v305;
    v76 = *v74;
    swift_retain(*v74);
    v315 = 0x4026000000000000;
    sub_100008BBC();
    ScaledMetric.init(wrappedValue:)(&v315, &type metadata for CGFloat);
    v77 = v309;
    v78 = (uint64_t *)&v50[*(int *)(v309 + 20)];
    *v78 = v70;
    v78[1] = v73;
    v48 = v77;
    *(_QWORD *)&v50[*(int *)(v77 + 24)] = v76;
    v79 = (uint64_t)v50;
    v80 = v290;
    sub_10001792C(v79, v290, type metadata accessor for HeaderLabel);
    sub_10001792C(v80, (uint64_t)v64, type metadata accessor for HeaderLabel);
    v75 = 0;
    a1 = v314;
  }
  else
  {
    v75 = 1;
  }
  v285 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, __n128))(v303 + 56);
  v285(v64, v75, 1, v48, v62);
  v288 = (void (*)(char *, uint64_t))sub_100039A40();
  v81 = a1 + v3[15];
  v82 = *(void **)v81;
  v83 = *(void **)(v81 + 8);
  v84 = *(_QWORD *)(v81 + 16);
  v85 = *(_QWORD *)(v81 + 24);
  sub_10003AEBC(*(void **)v81, v83, v84, v85);
  v87 = v86;
  v287 = v88;
  sub_10003AED0(v82, v83, v84, v85);
  v90 = v89;
  v92 = v91;
  v93 = sub_100039B94();
  v95 = v94;
  v290 = v313[7];
  v96 = *(_BYTE *)(v314 + v290);
  *v41 = swift_getKeyPath(&unk_1000418E8, v97);
  v98 = sub_1000033B8(&qword_100051D50);
  swift_storeEnumTagMultiPayload(v41, v98, 0);
  v99 = (_QWORD *)((char *)v41 + v39[5]);
  *v99 = swift_getKeyPath(&unk_1000417E0, v100);
  v289 = sub_1000033B8(&qword_100051D88);
  swift_storeEnumTagMultiPayload(v99, v289, 0);
  v315 = 0x4034000000000000;
  v303 = sub_100008BBC();
  v101 = ScaledMetric.init(wrappedValue:)(&v315, &type metadata for CGFloat);
  *(_QWORD *)((char *)v41 + v39[7]) = v288;
  v102 = (_QWORD *)((char *)v41 + v39[8]);
  v103 = v287;
  *v102 = v87;
  v102[1] = v103;
  v104 = (_QWORD *)((char *)v41 + v39[9]);
  *v104 = v90;
  v104[1] = v92;
  v105 = (_QWORD *)((char *)v41 + v39[10]);
  *v105 = v93;
  v105[1] = v95;
  *((_BYTE *)v41 + v39[11]) = v96;
  *(_QWORD *)((char *)v41 + v39[12]) = 0;
  v106 = v310;
  static AccessibilityChildBehavior.ignore.getter(v101);
  v107 = sub_100008304(&qword_100051FF0, type metadata accessor for FractionView, (uint64_t)&unk_1000414B8);
  v108 = v282;
  View.accessibilityElement(children:)(v106, v39, v107);
  v288 = *(void (**)(char *, uint64_t))(v312 + 8);
  v288(v106, v311);
  sub_1000179B4((uint64_t)v41, type metadata accessor for FractionView);
  v312 = v81;
  sub_10003B75C(*(id *)(v81 + 8));
  v315 = v109;
  v316 = v110;
  v287 = sub_100008E40();
  v111 = Text.init<A>(_:)(&v315, &type metadata for String, v287);
  v113 = v112;
  v115 = v114;
  v117 = v116 & 1;
  v315 = (uint64_t)v39;
  v316 = v107;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v315, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  v119 = (uint64_t)v280;
  v120 = v284;
  View.accessibility(label:)(v111, v113, v117, v115, v284, OpaqueTypeConformance2);
  v121 = v113;
  v122 = v313;
  sub_100008E84(v111, v121, v117);
  v123 = swift_bridgeObjectRelease(v115);
  v124 = v108;
  v125 = v314;
  (*(void (**)(char *, _QWORD *, __n128))(v283 + 8))(v124, v120, v123);
  v126 = (uint64_t)v308;
  ModifiedContent<>.accessibility(sortPriority:)(v281, 2.0);
  sub_1000034BC(v119, &qword_100052B48);
  v127 = v307;
  sub_1000082A0(v126, v307, &qword_100052B48);
  if (*(_BYTE *)(v125 + v122[12]) == 1)
  {
    if (*(_BYTE *)(v125 + v286) == 1)
    {
      v128 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v129 = String._bridgeToObjectiveC()();
      v130 = String._bridgeToObjectiveC()();
      v131 = objc_msgSend(v128, "localizedStringForKey:value:table:", v129, 0, v130);

      v132 = static String._unconditionallyBridgeFromObjectiveC(_:)(v131);
      v134 = v133;

      v135 = v304;
      if (qword_100051140 != -1)
        swift_once(&qword_100051140, sub_100017A9C);
      v136 = qword_100054868;
      v315 = 0x4026000000000000;
      swift_retain(qword_100054868);
      ScaledMetric.init(wrappedValue:)(&v315, &type metadata for CGFloat);
      v137 = 0;
      v138 = v309;
      v139 = (uint64_t *)(v135 + *(int *)(v309 + 20));
      *v139 = v132;
      v139[1] = v134;
      *(_QWORD *)(v135 + *(int *)(v138 + 24)) = v136;
    }
    else
    {
      v137 = 1;
      v135 = v304;
      v138 = v309;
    }
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v285)(v135, v137, 1, v138);
    v144 = v125 + v122[6];
    v145 = v291;
    v146 = sub_1000171D8(v291);
    v147 = v292;
    static WidgetRenderingMode.fullColor.getter(v146);
    v148 = static WidgetRenderingMode.== infix(_:_:)(v145, v147);
    v149 = *(void (**)(char *, uint64_t))(v265 + 8);
    v150 = v147;
    v151 = v293;
    v149(v150, v293);
    v149((char *)v145, v151);
    if ((v148 & 1) != 0)
    {
      if (qword_100051180 != -1)
        swift_once(&qword_100051180, sub_100017BEC);
      v153 = qword_1000548A8;
      swift_retain(qword_1000548A8);
    }
    else
    {
      v153 = static Color.white.getter(v152);
    }
    v154 = *(void **)(v312 + 8);
    v155 = *(_QWORD *)(v312 + 16);
    v156 = *(_QWORD *)(v312 + 24);
    v284 = v149;
    v283 = v144;
    if (v154)
    {
      v157 = v154;
      v158 = objc_msgSend(v157, "stepCount");
      v159 = objc_msgSend((id)objc_opt_self(HKUnit), "countUnit");
      objc_msgSend(v158, "doubleValueForUnit:", v159);
      v161 = v160;

      v162 = (void *)objc_opt_self(FIUIFormattingManager);
      v163 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", v161);
      v164 = objc_msgSend(v162, "stringWithNumber:decimalPrecision:roundingMode:", v163, 1, 4);

      if (v164)
      {
        v155 = static String._unconditionallyBridgeFromObjectiveC(_:)(v164);
        v156 = v165;

        goto LABEL_28;
      }

    }
    swift_bridgeObjectRetain(v156);
LABEL_28:
    v167 = *(_BYTE *)(v314 + v290);
    KeyPath = swift_getKeyPath(&unk_100041780, v166);
    v169 = (uint64_t)v294;
    *v294 = KeyPath;
    v282 = (char *)sub_1000033B8(&qword_100051B90);
    swift_storeEnumTagMultiPayload(v169, v282, 0);
    v170 = (int *)v295;
    v171 = (_QWORD *)(v169 + *(int *)(v295 + 20));
    *v171 = swift_getKeyPath(&unk_1000417E0, v172);
    swift_storeEnumTagMultiPayload(v171, v289, 0);
    v315 = 0x4034000000000000;
    ScaledMetric.init(wrappedValue:)(&v315, &type metadata for CGFloat);
    *(_QWORD *)(v169 + v170[7]) = v153;
    v173 = (uint64_t *)(v169 + v170[8]);
    *v173 = v155;
    v173[1] = v156;
    v174 = (_QWORD *)(v169 + v170[9]);
    *v174 = 0;
    v174[1] = 0xE000000000000000;
    *(_BYTE *)(v169 + v170[10]) = v167;
    v175 = v268;
    v176 = sub_10001792C(v169, v268, type metadata accessor for StandaloneMetricView);
    v177 = v310;
    static AccessibilityChildBehavior.ignore.getter(v176);
    v178 = sub_100008304(&qword_100052B68, type metadata accessor for StandaloneMetricView, (uint64_t)&unk_100041358);
    v179 = v269;
    View.accessibilityElement(children:)(v177, v170, v178);
    v288(v177, v311);
    sub_1000179B4(v175, type metadata accessor for StandaloneMetricView);
    sub_10003CD48(*(void **)(v312 + 8));
    v315 = v180;
    v316 = v181;
    v182 = Text.init<A>(_:)(&v315, &type metadata for String, v287);
    v184 = v183;
    v186 = v185;
    v188 = v187 & 1;
    v315 = (uint64_t)v170;
    v316 = v178;
    v281 = v178;
    v189 = 1;
    v190 = swift_getOpaqueTypeConformance2(&v315, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    v191 = (uint64_t)v267;
    v192 = v297;
    v280 = (char *)v190;
    View.accessibility(label:)(v182, v184, v188, v186, v297, v190);
    sub_100008E84(v182, v184, v188);
    v193 = swift_bridgeObjectRelease(v186);
    v270 = *(_QWORD *)(v270 + 8);
    ((void (*)(char *, uint64_t, __n128))v270)(v179, v192, v193);
    v194 = (uint64_t)v266;
    ModifiedContent<>.accessibility(sortPriority:)(v296, 2.0);
    sub_1000034BC(v191, &qword_100052B30);
    sub_1000082A0(v194, v306, &qword_100052B30);
    v195 = (uint64_t)v272;
    if (*(_BYTE *)(v314 + v286) == 1)
    {
      v196 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v197 = String._bridgeToObjectiveC()();
      v198 = String._bridgeToObjectiveC()();
      v199 = objc_msgSend(v196, "localizedStringForKey:value:table:", v197, 0, v198);

      v200 = static String._unconditionallyBridgeFromObjectiveC(_:)(v199);
      v202 = v201;

      if (qword_100051140 != -1)
        swift_once(&qword_100051140, sub_100017A9C);
      v203 = qword_100054868;
      v315 = 0x4026000000000000;
      swift_retain(qword_100054868);
      v204 = v302;
      ScaledMetric.init(wrappedValue:)(&v315, &type metadata for CGFloat);
      v189 = 0;
      v205 = v309;
      v206 = (uint64_t *)(v204 + *(int *)(v309 + 20));
      *v206 = v200;
      v206[1] = v202;
      *(_QWORD *)(v204 + *(int *)(v205 + 24)) = v203;
    }
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v285)(v302, v189, 1, v309);
    v207 = v291;
    v208 = sub_1000171D8(v291);
    v209 = v292;
    static WidgetRenderingMode.fullColor.getter(v208);
    v210 = static WidgetRenderingMode.== infix(_:_:)(v207, v209);
    v211 = v209;
    v212 = v293;
    v213 = (void (*)(uint64_t, uint64_t))v284;
    ((void (*)(char *, uint64_t))v284)(v211, v293);
    v213(v207, v212);
    if ((v210 & 1) != 0)
    {
      v215 = v314;
      if (qword_100051180 != -1)
        swift_once(&qword_100051180, sub_100017BEC);
      v216 = qword_1000548A8;
      swift_retain(qword_1000548A8);
    }
    else
    {
      v216 = static Color.white.getter(v214);
      v215 = v314;
    }
    v217 = sub_10003B10C(*(void **)v312, *(void **)(v312 + 8), *(_QWORD *)(v312 + 16), *(_QWORD *)(v312 + 24));
    v219 = v218;
    v220 = v313;
    v221 = *(unsigned __int8 *)(v215 + v313[9]);
    sub_10003AE28(v215, v195);
    if (v221 == 1)
    {
      sub_1000179B4(v195, type metadata accessor for StandaloneMetricsStack);
    }
    else
    {
      v223 = *(unsigned __int8 *)(v195 + v220[10]);
      sub_1000179B4(v195, type metadata accessor for StandaloneMetricsStack);
      if (v223 != 1)
      {
        v224 = sub_10003D14C(*(void **)v312);
        v225 = v226;
        goto LABEL_42;
      }
    }
    v224 = 0;
    v225 = 0xE000000000000000;
LABEL_42:
    v227 = *(_BYTE *)(v215 + v290);
    v228 = swift_getKeyPath(&unk_100041780, v222);
    v229 = (uint64_t)v294;
    *v294 = v228;
    swift_storeEnumTagMultiPayload(v229, v282, 0);
    v230 = (int *)v295;
    v231 = (_QWORD *)(v229 + *(int *)(v295 + 20));
    *v231 = swift_getKeyPath(&unk_1000417E0, v232);
    swift_storeEnumTagMultiPayload(v231, v289, 0);
    v315 = 0x4034000000000000;
    ScaledMetric.init(wrappedValue:)(&v315, &type metadata for CGFloat);
    *(_QWORD *)(v229 + v230[7]) = v216;
    v233 = (_QWORD *)(v229 + v230[8]);
    *v233 = v217;
    v233[1] = v219;
    v234 = (_QWORD *)(v229 + v230[9]);
    *v234 = v224;
    v234[1] = v225;
    *(_BYTE *)(v229 + v230[10]) = v227;
    v235 = v275;
    v236 = sub_10001792C(v229, v275, type metadata accessor for StandaloneMetricView);
    v237 = v310;
    static AccessibilityChildBehavior.ignore.getter(v236);
    v238 = v276;
    View.accessibilityElement(children:)(v237, v230, v281);
    v288(v237, v311);
    sub_1000179B4(v235, type metadata accessor for StandaloneMetricView);
    v315 = (uint64_t)sub_10003CEFC(*(void **)v312, *(void **)(v312 + 8));
    v316 = v239;
    v240 = Text.init<A>(_:)(&v315, &type metadata for String, v287);
    v242 = v241;
    v244 = v243;
    v246 = v245 & 1;
    v247 = (uint64_t)v274;
    v248 = v297;
    View.accessibility(label:)(v240, v241, v245 & 1, v243, v297, v280);
    sub_100008E84(v240, v242, v246);
    v249 = swift_bridgeObjectRelease(v244);
    ((void (*)(char *, uint64_t, __n128))v270)(v238, v248, v249);
    v250 = (uint64_t)v273;
    ModifiedContent<>.accessibility(sortPriority:)(v296, 2.0);
    sub_1000034BC(v247, &qword_100052B30);
    v251 = v277;
    sub_1000082A0(v250, v277, &qword_100052B30);
    v252 = v298;
    sub_100003478(v304, v298, &qword_100052B50);
    v253 = v279;
    sub_100003478(v306, v279, &qword_100052B30);
    v254 = v302;
    v255 = v271;
    sub_100003478(v302, v271, &qword_100052B50);
    v256 = v278;
    sub_100003478(v251, v278, &qword_100052B30);
    v142 = (uint64_t)v300;
    *v300 = 0;
    *(_BYTE *)(v142 + 8) = 0;
    v257 = (int *)sub_1000033B8(&qword_100052B70);
    sub_100003478(v252, v142 + v257[12], &qword_100052B50);
    sub_100003478(v253, v142 + v257[16], &qword_100052B30);
    v258 = v142 + v257[20];
    *(_QWORD *)v258 = 0;
    *(_BYTE *)(v258 + 8) = 0;
    sub_100003478(v255, v142 + v257[24], &qword_100052B50);
    v259 = v257[28];
    v143 = v252;
    sub_100003478(v256, v142 + v259, &qword_100052B30);
    sub_1000034BC(v251, &qword_100052B30);
    sub_1000034BC(v254, &qword_100052B50);
    sub_1000034BC(v306, &qword_100052B30);
    sub_1000034BC(v304, &qword_100052B50);
    sub_1000034BC(v256, &qword_100052B30);
    sub_1000034BC(v255, &qword_100052B50);
    sub_1000034BC(v253, &qword_100052B30);
    sub_1000034BC(v252, &qword_100052B50);
    v260 = sub_1000033B8(&qword_100052B58);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v260 - 8) + 56))(v142, 0, 1, v260);
    v141 = v299;
    sub_1000082A0(v142, v299, &qword_100052B38);
    v127 = v307;
    v126 = (uint64_t)v308;
    goto LABEL_43;
  }
  v140 = sub_1000033B8(&qword_100052B58);
  v141 = v299;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v140 - 8) + 56))(v299, 1, 1, v140);
  v142 = (uint64_t)v300;
  v143 = v298;
LABEL_43:
  v261 = (uint64_t)v305;
  sub_100003478((uint64_t)v305, v143, &qword_100052B50);
  sub_100003478(v127, v126, &qword_100052B48);
  sub_100003478(v141, v142, &qword_100052B38);
  v262 = v301;
  sub_100003478(v143, v301, &qword_100052B50);
  v263 = sub_1000033B8(&qword_100052B60);
  sub_100003478(v126, v262 + *(int *)(v263 + 48), &qword_100052B48);
  sub_100003478(v142, v262 + *(int *)(v263 + 64), &qword_100052B38);
  sub_1000034BC(v141, &qword_100052B38);
  sub_1000034BC(v127, &qword_100052B48);
  sub_1000034BC(v261, &qword_100052B50);
  sub_1000034BC(v142, &qword_100052B38);
  sub_1000034BC(v126, &qword_100052B48);
  return sub_1000034BC(v143, &qword_100052B50);
}

uint64_t sub_100039A40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  char v10;
  void (*v11)(char *, uint64_t);
  __n128 v12;
  uint64_t v13;

  v1 = type metadata accessor for WidgetRenderingMode(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - v6;
  if (*(_BYTE *)(v0 + *(int *)(type metadata accessor for StandaloneMetricsStack(0) + 40)) == 1)
  {
    if (qword_100051198 != -1)
      swift_once(&qword_100051198, sub_100017CF0);
    return swift_retain(qword_1000548C0);
  }
  else
  {
    v9 = sub_1000171D8((uint64_t)v7);
    static WidgetRenderingMode.fullColor.getter(v9);
    v10 = static WidgetRenderingMode.== infix(_:_:)(v7, v4);
    v11 = *(void (**)(char *, uint64_t))(v2 + 8);
    v11(v4, v1);
    v11(v7, v1);
    if ((v10 & 1) != 0)
    {
      if (qword_100051148 != -1)
        swift_once(&qword_100051148, sub_100017B28);
      return swift_retain(qword_100054870);
    }
    else
    {
      return static Color.white.getter(v12);
    }
  }
}

id sub_100039B94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;

  v1 = v0;
  v2 = type metadata accessor for DynamicTypeSize(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (int *)type metadata accessor for StandaloneMetricsStack(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v11 = (char *)&v23 - v10;
  __chkstk_darwin(v12);
  v14 = (char *)&v23 - v13;
  v16 = *(_BYTE *)(v1 + *(int *)(v15 + 36));
  sub_10003AE28(v1, (uint64_t)&v23 - v13);
  if ((v16 & 1) != 0)
  {
    sub_1000179B4((uint64_t)v14, type metadata accessor for StandaloneMetricsStack);
    sub_10003AE28(v1, (uint64_t)v11);
LABEL_4:
    v18 = (uint64_t)v11;
LABEL_5:
    sub_1000179B4(v18, type metadata accessor for StandaloneMetricsStack);
    return 0;
  }
  v17 = v14[v6[10]];
  sub_1000179B4((uint64_t)v14, type metadata accessor for StandaloneMetricsStack);
  sub_10003AE28(v1, (uint64_t)v11);
  if ((v17 & 1) != 0)
    goto LABEL_4;
  v20 = sub_100016F9C((uint64_t)v5);
  v21 = DynamicTypeSize.isAccessibilitySize.getter(v20);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10003AE28((uint64_t)v11, (uint64_t)v8);
  if ((v21 & 1) != 0)
  {
    sub_1000179B4((uint64_t)v8, type metadata accessor for StandaloneMetricsStack);
    v18 = (uint64_t)v11;
    goto LABEL_5;
  }
  v22 = v8[v6[7]];
  sub_1000179B4((uint64_t)v8, type metadata accessor for StandaloneMetricsStack);
  sub_1000179B4((uint64_t)v11, type metadata accessor for StandaloneMetricsStack);
  if ((v22 & 1) == 0)
    return sub_10003BDC4(*(id *)(v1 + v6[15]), *(id *)(v1 + v6[15] + 8));
  return 0;
}

uint64_t sub_100039D8C@<X0>(uint64_t a1@<X8>, __n128 a2@<Q0>)
{
  uint64_t v2;
  uint64_t v4;

  *(_QWORD *)a1 = static VerticalAlignment.center.getter(a2);
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
  v4 = sub_1000033B8(&qword_100052B08);
  return sub_100038148(v2, a1 + *(int *)(v4 + 44));
}

uint64_t type metadata accessor for StandaloneMetricsStack(uint64_t a1)
{
  uint64_t result;

  result = qword_100052AA8;
  if (!qword_100052AA8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StandaloneMetricsStack);
  return result;
}

_QWORD *sub_100039E20(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v7 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = a3[5];
    v15 = (_QWORD *)((char *)a1 + v14);
    v16 = (_QWORD *)((char *)a2 + v14);
    v17 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = a3[6];
    v24 = (_QWORD *)((char *)a1 + v23);
    v25 = (_QWORD *)((char *)a2 + v23);
    v26 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v25, v26) == 1)
    {
      v27 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v24, v25, v27);
      v28 = v24;
      v29 = v26;
      v30 = 1;
    }
    else
    {
      v31 = *v25;
      *v24 = *v25;
      swift_retain(v31);
      v28 = v24;
      v29 = v26;
      v30 = 0;
    }
    swift_storeEnumTagMultiPayload(v28, v29, v30);
    v32 = a3[8];
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    v33 = *(void **)((char *)a2 + v32);
    *(_QWORD *)((char *)a1 + v32) = v33;
    v34 = a3[10];
    *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
    *((_BYTE *)a1 + v34) = *((_BYTE *)a2 + v34);
    v35 = a3[12];
    *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
    *((_BYTE *)a1 + v35) = *((_BYTE *)a2 + v35);
    v36 = a3[13];
    v37 = a3[14];
    v38 = *(void **)((char *)a2 + v36);
    *(_QWORD *)((char *)a1 + v36) = v38;
    v39 = (_QWORD *)((char *)a1 + v37);
    v40 = (_QWORD *)((char *)a2 + v37);
    v41 = v40[1];
    *v39 = *v40;
    v39[1] = v41;
    v42 = a3[15];
    v43 = (_QWORD *)((char *)a1 + v42);
    v44 = (char *)a2 + v42;
    v45 = *(void **)v44;
    v46 = (void *)*((_QWORD *)v44 + 1);
    *v43 = *(_QWORD *)v44;
    v43[1] = v46;
    v47 = *((_QWORD *)v44 + 3);
    v43[2] = *((_QWORD *)v44 + 2);
    v43[3] = v47;
    v48 = v33;
    v49 = v38;
    swift_bridgeObjectRetain(v41);
    v50 = v45;
    v51 = v46;
    swift_bridgeObjectRetain(v47);
  }
  return a1;
}

double sub_10003A080(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  double result;

  v4 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + a2[5]);
  v7 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (_QWORD *)((char *)a1 + a2[6]);
  v10 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v9, v11);
  }
  else
  {
    swift_release(*v9);
  }

  swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[14] + 8));
  v12 = (id *)((char *)a1 + a2[15]);

  *(_QWORD *)&result = swift_bridgeObjectRelease(v12[3]).n128_u64[0];
  return result;
}

_QWORD *sub_10003A1D4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  char *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v6 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = a3[5];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = a3[6];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v24 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v23, v24) == 1)
  {
    v25 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v22, v23, v25);
    v26 = v22;
    v27 = v24;
    v28 = 1;
  }
  else
  {
    v29 = *v23;
    *v22 = *v23;
    swift_retain(v29);
    v26 = v22;
    v27 = v24;
    v28 = 0;
  }
  swift_storeEnumTagMultiPayload(v26, v27, v28);
  v30 = a3[8];
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  v31 = *(void **)((char *)a2 + v30);
  *(_QWORD *)((char *)a1 + v30) = v31;
  v32 = a3[10];
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *((_BYTE *)a1 + v32) = *((_BYTE *)a2 + v32);
  v33 = a3[12];
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *((_BYTE *)a1 + v33) = *((_BYTE *)a2 + v33);
  v34 = a3[13];
  v35 = a3[14];
  v36 = *(void **)((char *)a2 + v34);
  *(_QWORD *)((char *)a1 + v34) = v36;
  v37 = (_QWORD *)((char *)a1 + v35);
  v38 = (_QWORD *)((char *)a2 + v35);
  v39 = v38[1];
  *v37 = *v38;
  v37[1] = v39;
  v40 = a3[15];
  v41 = (_QWORD *)((char *)a1 + v40);
  v42 = (char *)a2 + v40;
  v43 = *(void **)v42;
  v44 = (void *)*((_QWORD *)v42 + 1);
  *v41 = *(_QWORD *)v42;
  v41[1] = v44;
  v45 = *((_QWORD *)v42 + 3);
  v41[2] = *((_QWORD *)v42 + 2);
  v41[3] = v45;
  v46 = v31;
  v47 = v36;
  swift_bridgeObjectRetain(v39);
  v48 = v43;
  v49 = v44;
  swift_bridgeObjectRetain(v45);
  return a1;
}

_QWORD *sub_10003A408(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B90);
    v6 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = a3[5];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    sub_1000034BC((uint64_t)a1 + v12, &qword_100051B88);
    v15 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
    v21 = a3[6];
    v22 = (_QWORD *)((char *)a1 + v21);
    v23 = (_QWORD *)((char *)a2 + v21);
    sub_1000034BC((uint64_t)a1 + v21, &qword_100051D88);
    v24 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v23, v24) == 1)
    {
      v25 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v22, v23, v25);
      v26 = v22;
      v27 = v24;
      v28 = 1;
    }
    else
    {
      v29 = *v23;
      *v22 = *v23;
      swift_retain(v29);
      v26 = v22;
      v27 = v24;
      v28 = 0;
    }
    swift_storeEnumTagMultiPayload(v26, v27, v28);
  }
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  v30 = a3[8];
  v31 = *(void **)((char *)a2 + v30);
  v32 = *(void **)((char *)a1 + v30);
  *(_QWORD *)((char *)a1 + v30) = v31;
  v33 = v31;

  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  *((_BYTE *)a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *((_BYTE *)a1 + a3[12]) = *((_BYTE *)a2 + a3[12]);
  v34 = a3[13];
  v35 = *(void **)((char *)a1 + v34);
  v36 = *(void **)((char *)a2 + v34);
  *(_QWORD *)((char *)a1 + v34) = v36;
  v37 = v36;

  v38 = a3[14];
  v39 = (_QWORD *)((char *)a1 + v38);
  v40 = (_QWORD *)((char *)a2 + v38);
  *v39 = *v40;
  v41 = v40[1];
  v42 = v39[1];
  v39[1] = v41;
  swift_bridgeObjectRetain(v41);
  swift_bridgeObjectRelease(v42);
  v43 = a3[15];
  v44 = (char *)a1 + v43;
  v45 = (char *)a2 + v43;
  v46 = *(void **)v45;
  v47 = *(void **)v44;
  *(_QWORD *)v44 = *(_QWORD *)v45;
  v48 = v46;

  v49 = (void *)*((_QWORD *)v44 + 1);
  v50 = (void *)*((_QWORD *)v45 + 1);
  *((_QWORD *)v44 + 1) = v50;
  v51 = v50;

  *((_QWORD *)v44 + 2) = *((_QWORD *)v45 + 2);
  v52 = *((_QWORD *)v45 + 3);
  v53 = *((_QWORD *)v44 + 3);
  *((_QWORD *)v44 + 3) = v52;
  swift_bridgeObjectRetain(v52);
  swift_bridgeObjectRelease(v53);
  return a1;
}

char *sub_10003A6CC(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;

  v6 = sub_1000033B8(&qword_100051B90);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_1000033B8(&qword_100051B88);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = sub_1000033B8(&qword_100051D88);
  if (swift_getEnumCaseMultiPayload(v15, v16) == 1)
  {
    v17 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload(v14, v16, 1);
  }
  else
  {
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  v18 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];
  v19 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  a1[v19] = a2[v19];
  v20 = a3[12];
  a1[a3[11]] = a2[a3[11]];
  a1[v20] = a2[v20];
  v21 = a3[14];
  *(_QWORD *)&a1[a3[13]] = *(_QWORD *)&a2[a3[13]];
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  v22 = a3[15];
  v23 = &a1[v22];
  v24 = &a2[v22];
  v25 = *((_OWORD *)v24 + 1);
  *(_OWORD *)v23 = *(_OWORD *)v24;
  *((_OWORD *)v23 + 1) = v25;
  return a1;
}

char *sub_10003A8C4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;

  if (a1 != a2)
  {
    sub_1000034BC((uint64_t)a1, &qword_100051B90);
    v6 = sub_1000033B8(&qword_100051B90);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_1000034BC((uint64_t)&a1[v8], &qword_100051B88);
    v11 = sub_1000033B8(&qword_100051B88);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    v13 = a3[6];
    v14 = &a1[v13];
    v15 = &a2[v13];
    sub_1000034BC((uint64_t)&a1[v13], &qword_100051D88);
    v16 = sub_1000033B8(&qword_100051D88);
    if (swift_getEnumCaseMultiPayload(v15, v16) == 1)
    {
      v17 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload(v14, v16, 1);
    }
    else
    {
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
  }
  v18 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  v19 = *(void **)&a1[v18];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];

  v20 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  a1[v20] = a2[v20];
  v21 = a3[12];
  a1[a3[11]] = a2[a3[11]];
  a1[v21] = a2[v21];
  v22 = a3[13];
  v23 = *(void **)&a1[v22];
  *(_QWORD *)&a1[v22] = *(_QWORD *)&a2[v22];

  v24 = a3[14];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v28 = *(_QWORD *)v26;
  v27 = *((_QWORD *)v26 + 1);
  v29 = *((_QWORD *)v25 + 1);
  *(_QWORD *)v25 = v28;
  *((_QWORD *)v25 + 1) = v27;
  swift_bridgeObjectRelease(v29);
  v30 = a3[15];
  v31 = &a1[v30];
  v32 = &a2[v30];
  v33 = *(void **)&a1[v30];
  *(_QWORD *)&a1[v30] = *(_QWORD *)v32;

  v34 = (void *)*((_QWORD *)v31 + 1);
  *((_QWORD *)v31 + 1) = *((_QWORD *)v32 + 1);

  v35 = *((_QWORD *)v32 + 3);
  v36 = *((_QWORD *)v31 + 3);
  *((_QWORD *)v31 + 2) = *((_QWORD *)v32 + 2);
  *((_QWORD *)v31 + 3) = v35;
  swift_bridgeObjectRelease(v36);
  return a1;
}

uint64_t sub_10003AB40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003AB4C);
}

uint64_t sub_10003AB4C(uint64_t a1, uint64_t a2, int *a3)
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
  unint64_t v16;

  v6 = sub_1000033B8(&qword_100051BA0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_1000033B8(&qword_100051B98);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_7:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = sub_1000033B8(&qword_100051E48);
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_7;
  }
  v16 = *(_QWORD *)(a1 + a3[8]);
  if (v16 >= 0xFFFFFFFF)
    LODWORD(v16) = -1;
  return (v16 + 1);
}

uint64_t sub_10003AC24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003AC30);
}

uint64_t sub_10003AC30(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  v8 = sub_1000033B8(&qword_100051BA0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = sub_1000033B8(&qword_100051B98);
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_7:
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  result = sub_1000033B8(&qword_100051E48);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[6];
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + a4[8]) = (a2 - 1);
  return result;
}

void sub_10003AD04(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[12];

  sub_10003270C(319, (unint64_t *)&unk_100051C18, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10003270C(319, &qword_100051C10, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    if (v5 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(v4 - 8) + 64;
      sub_10003270C(319, (unint64_t *)&qword_100051EB8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
      if (v7 <= 0x3F)
      {
        v8[2] = *(_QWORD *)(v6 - 8) + 64;
        v8[3] = &unk_100041838;
        v8[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
        v8[5] = &unk_100041838;
        v8[6] = &unk_100041838;
        v8[7] = &unk_100041838;
        v8[8] = &unk_100041838;
        v8[9] = &unk_100041850;
        v8[10] = &unk_100041868;
        v8[11] = &unk_100041880;
        swift_initStructMetadata(a1, 256, 12, v8, a1 + 16);
      }
    }
  }
}

uint64_t sub_10003AE10(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100042544, 1);
}

uint64_t sub_10003AE28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StandaloneMetricsStack(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10003AE70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052B78;
  if (!qword_100052B78)
  {
    v1 = sub_1000036E4(&qword_100052B80);
    result = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100052B78);
  }
  return result;
}

void sub_10003AEBC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  sub_10003AEE4(a1, a2, a3, a4, (SEL *)&selRef_appleMoveTime, (SEL *)&selRef_activeEnergyBurned);
}

void sub_10003AED0(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  sub_10003AEE4(a1, a2, a3, a4, (SEL *)&selRef_appleMoveTimeGoal, (SEL *)&selRef_activeEnergyBurnedGoal);
}

void sub_10003AEE4(id a1, void *a2, uint64_t a3, uint64_t a4, SEL *a5, SEL *a6)
{
  id v10;
  id v11;
  id v12;

  if (!a2)
    goto LABEL_4;
  v10 = a2;
  if ((objc_msgSend(v10, "paused") & 1) != 0)
  {

LABEL_4:
    swift_bridgeObjectRetain(a4);
    return;
  }
  if (objc_msgSend(v10, "activityMoveMode") == (id)2)
  {
    v11 = objc_msgSend(v10, *a5);
    a1 = objc_msgSend(a1, "localizedStringWithMoveMinutes:", v11);

    if (a1)
    {
LABEL_9:
      static String._unconditionallyBridgeFromObjectiveC(_:)(a1);

      return;
    }
    __break(1u);
  }
  v12 = objc_msgSend(v10, *a6);
  a1 = objc_msgSend(a1, "localizedStringWithActiveEnergy:", v12);

  if (a1)
    goto LABEL_9;
  __break(1u);
}

id sub_10003B00C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_10003B048(a1, a2, a3, a4, (SEL *)&selRef_appleExerciseTime, (SEL *)&selRef_localizedStringWithBriskMinutes_);
}

id sub_10003B020(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_10003B048(a1, a2, a3, a4, (SEL *)&selRef_appleStandHours, (SEL *)&selRef_localizedStringWithActiveHours_);
}

id sub_10003B034(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_10003B048(a1, a2, a3, a4, (SEL *)&selRef_appleStandHoursGoal, (SEL *)&selRef_localizedStringWithActiveHours_);
}

id sub_10003B048(void *a1, void *a2, uint64_t a3, uint64_t a4, SEL *a5, SEL *a6)
{
  id v11;
  id v12;
  id result;
  void *v14;

  if (!a2)
    goto LABEL_4;
  v11 = a2;
  if ((objc_msgSend(v11, "paused") & 1) != 0)
  {

LABEL_4:
    swift_bridgeObjectRetain(a4);
    return (id)a3;
  }
  v12 = objc_msgSend(v11, *a5);
  result = objc_msgSend(a1, *a6, v12);
  if (result)
  {
    v14 = result;
    a3 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);

    return (id)a3;
  }
  __break(1u);
  return result;
}

id sub_10003B10C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id result;
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;

  if (!a2)
    goto LABEL_6;
  v7 = a2;
  result = objc_msgSend(a1, "unitManager");
  if (result)
  {
    v9 = result;
    v10 = objc_msgSend(result, "userDistanceHKUnitForDistanceType:", 1);

    v11 = objc_msgSend(v7, "distanceWalkingRunning");
    objc_msgSend(v11, "doubleValueForUnit:", v10);
    v13 = v12;

    v14 = (void *)objc_opt_self(FIUIFormattingManager);
    v15 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", v13);
    v16 = objc_msgSend(v14, "stringWithNumber:decimalPrecision:roundingMode:", v15, 2, 4);

    if (v16)
    {
      a3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);

      return (id)a3;
    }

LABEL_6:
    swift_bridgeObjectRetain(a4);
    return (id)a3;
  }
  __break(1u);
  return result;
}

id sub_10003B264(id a1)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  id v5;
  Swift::String v6;
  Swift::String v7;
  uint64_t countAndFlagsBits;
  id result;
  double v10;
  id v11;
  char **v12;
  double v13;
  id v14;
  unsigned int v15;
  id v16;
  NSString v17;
  NSString v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  id v28;
  NSString v29;
  NSString v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;

  if (a1)
  {
    if (objc_msgSend(a1, "paused"))
    {
      v5 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v35._object = (void *)0xE000000000000000;
      v6._object = (void *)0x8000000100049330;
      v6._countAndFlagsBits = 0xD000000000000020;
      v7._countAndFlagsBits = 0;
      v7._object = (void *)0xE000000000000000;
      v35._countAndFlagsBits = 0;
      countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v35)._countAndFlagsBits;

      return (id)countAndFlagsBits;
    }
    v11 = objc_msgSend(a1, "activityMoveMode");
    v12 = &selRef__moveMinutesCompletionPercentage;
    if (v11 != (id)2)
      v12 = &selRef__activeEnergyCompletionPercentage;
    objc_msgSend(a1, *v12);
    v10 = v13 * 100.0;
  }
  else
  {
    v10 = 0.0;
  }
  if ((~*(_QWORD *)&v10 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v10 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = objc_msgSend((id)objc_opt_self(_HKBehavior), "sharedBehavior");
  if (result)
  {
    v14 = result;
    v1 = (uint64_t)v10;
    v15 = objc_msgSend(result, "isStandalonePhoneFitnessMode");

    if (v15)
    {
      v16 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v17 = String._bridgeToObjectiveC()();
      v18 = String._bridgeToObjectiveC()();
      v19 = objc_msgSend(v16, "localizedStringForKey:value:table:", v17, 0, v18);

      v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
      v22 = v21;

      v23 = sub_1000033B8(&qword_100051368);
      v24 = swift_allocObject(v23, 72, 7);
      *(_OWORD *)(v24 + 16) = xmmword_10003FCE0;
      *(_QWORD *)(v24 + 56) = &type metadata for Int;
      *(_QWORD *)(v24 + 64) = &protocol witness table for Int;
      *(_QWORD *)(v24 + 32) = v1;
LABEL_25:
      v34 = static String.localizedStringWithFormat(_:_:)(v20, v22, v24);
      swift_bridgeObjectRelease(v22);
      swift_bridgeObjectRelease(v24);
      return (id)v34;
    }
    if (!a1)
    {
      v2 = 0;
      v3 = 0.0;
LABEL_23:
      if (qword_1000511F8 == -1)
      {
LABEL_24:
        v28 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v29 = String._bridgeToObjectiveC()();
        v30 = String._bridgeToObjectiveC()();
        v31 = objc_msgSend(v28, "localizedStringForKey:value:table:", v29, 0, v30);

        v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
        v22 = v32;

        v33 = sub_1000033B8(&qword_100051368);
        v24 = swift_allocObject(v33, 152, 7);
        *(_OWORD *)(v24 + 16) = xmmword_1000415D0;
        *(_QWORD *)(v24 + 56) = &type metadata for Int;
        *(_QWORD *)(v24 + 64) = &protocol witness table for Int;
        *(_QWORD *)(v24 + 32) = v1;
        *(_QWORD *)(v24 + 96) = &type metadata for Int;
        *(_QWORD *)(v24 + 104) = &protocol witness table for Int;
        *(_QWORD *)(v24 + 72) = v2;
        *(_QWORD *)(v24 + 136) = &type metadata for Int;
        *(_QWORD *)(v24 + 144) = &protocol witness table for Int;
        *(_QWORD *)(v24 + 112) = (uint64_t)v3;
        goto LABEL_25;
      }
LABEL_33:
      swift_once(&qword_1000511F8, sub_10003D32C);
      goto LABEL_24;
    }
    result = objc_msgSend(a1, "_exerciseTimeCompletionPercentage");
    v26 = v25 * 100.0;
    if ((~COERCE__INT64(v25 * 100.0) & 0x7FF0000000000000) == 0)
    {
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    if (v26 > -9.22337204e18)
    {
      if (v26 < 9.22337204e18)
      {
        result = objc_msgSend(a1, "_standHoursCompletionPercentage");
        v3 = v27 * 100.0;
        if ((~COERCE__INT64(v27 * 100.0) & 0x7FF0000000000000) != 0)
        {
          if (v3 > -9.22337204e18)
          {
            if (v3 < 9.22337204e18)
            {
              v2 = (uint64_t)v26;
              goto LABEL_23;
            }
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
        goto LABEL_35;
      }
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
LABEL_36:
  __break(1u);
  return result;
}

void sub_10003B75C(id a1)
{
  id v2;
  Swift::String v3;
  Swift::String v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  double v24;
  double v25;
  id v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  id v31;
  char v32;
  uint64_t v33;
  void *v34;
  id v35;
  char v36;
  id v37;
  Swift::String v38;
  Swift::String v39;
  Swift::String v40;
  uint64_t v41;
  uint64_t v42;
  Swift::String v43;
  Swift::String v44;
  Swift::String v45;

  if (a1)
  {
    if (objc_msgSend(a1, "paused"))
    {
      v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v3._countAndFlagsBits = 0xD000000000000024;
      v43._object = (void *)0xE000000000000000;
      v3._object = (void *)0x80000001000495D0;
      v4._countAndFlagsBits = 0;
      v4._object = (void *)0xE000000000000000;
      v43._countAndFlagsBits = 0;
      NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v43);

      return;
    }
    if (objc_msgSend(a1, "activityMoveMode") == (id)2)
    {
      v5 = objc_msgSend(a1, "appleMoveTime");
      v6 = (void *)objc_opt_self(HKUnit);
      v7 = objc_msgSend(v6, "minuteUnit");
      objc_msgSend(v5, "doubleValueForUnit:", v7);
      v9 = v8;

      if ((~*(_QWORD *)&v9 & 0x7FF0000000000000) != 0)
      {
        if (v9 > -9.22337204e18)
        {
          if (v9 < 9.22337204e18)
          {
            v10 = objc_msgSend(a1, "appleMoveTimeGoal");
            v11 = objc_msgSend(v6, "minuteUnit");
            objc_msgSend(v10, "doubleValueForUnit:", v11);
            v13 = v12;

            if ((~*(_QWORD *)&v13 & 0x7FF0000000000000) != 0)
            {
              if (v13 > -9.22337204e18)
              {
                if (v13 < 9.22337204e18)
                {
                  v14 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
                  v44._object = (void *)0xE000000000000000;
                  v15._object = (void *)0x80000001000495B0;
                  v15._countAndFlagsBits = 0xD00000000000001BLL;
                  v16._countAndFlagsBits = 0;
                  v16._object = (void *)0xE000000000000000;
                  v44._countAndFlagsBits = 0;
                  v17 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v44);

                  v18 = sub_1000033B8(&qword_100051368);
                  v19 = swift_allocObject(v18, 112, 7);
                  *(_OWORD *)(v19 + 16) = xmmword_10003FCD0;
                  *(_QWORD *)(v19 + 56) = &type metadata for Int;
                  *(_QWORD *)(v19 + 64) = &protocol witness table for Int;
                  *(_QWORD *)(v19 + 32) = (uint64_t)v9;
                  *(_QWORD *)(v19 + 96) = &type metadata for Int;
                  *(_QWORD *)(v19 + 104) = &protocol witness table for Int;
                  *(_QWORD *)(v19 + 72) = (uint64_t)v13;
                  static String.localizedStringWithFormat(_:_:)(v17._countAndFlagsBits, v17._object, v19);
                  swift_bridgeObjectRelease(v17._object);
                  swift_bridgeObjectRelease(v19);
                  return;
                }
                goto LABEL_44;
              }
LABEL_43:
              __break(1u);
LABEL_44:
              __break(1u);
LABEL_45:
              __break(1u);
              return;
            }
LABEL_42:
            __break(1u);
            goto LABEL_43;
          }
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
  }
  if (qword_1000511F0 != -1)
    swift_once(&qword_1000511F0, sub_10003D274);
  v20 = objc_msgSend((id)qword_1000548F8, "unitManager");
  if (!v20)
    goto LABEL_45;
  v21 = v20;
  v22 = objc_msgSend(v20, "userActiveEnergyBurnedUnit");

  if (!a1)
  {
    v29 = 0;
    v28 = 0.0;
    goto LABEL_24;
  }
  v23 = objc_msgSend(a1, "activeEnergyBurned");
  objc_msgSend(v23, "doubleValueForUnit:", v22);
  v25 = v24;

  if ((~*(_QWORD *)&v25 & 0x7FF0000000000000) == 0)
    goto LABEL_37;
  if (v25 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_34;
  }
  if (v25 >= 9.22337204e18)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v26 = objc_msgSend(a1, "activeEnergyBurnedGoal");
  objc_msgSend(v26, "doubleValueForUnit:", v22);
  v28 = v27;

  if ((~*(_QWORD *)&v28 & 0x7FF0000000000000) == 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if (v28 <= -9.22337204e18)
    goto LABEL_35;
  if (v28 >= 9.22337204e18)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v29 = (uint64_t)v25;
LABEL_24:
  sub_10003BD88();
  v30 = (void *)objc_opt_self(HKUnit);
  v31 = objc_msgSend(v30, "kilocalorieUnit");
  v32 = static NSObject.== infix(_:_:)(v22, v31);

  if ((v32 & 1) != 0)
  {
    v33 = 0xD000000000000025;
    v34 = (void *)0x8000000100049580;
  }
  else
  {
    v35 = objc_msgSend(v30, "jouleUnitWithMetricPrefix:", 9);
    v36 = static NSObject.== infix(_:_:)(v22, v35);

    if ((v36 & 1) != 0)
      v33 = 0xD000000000000023;
    else
      v33 = 0xD000000000000021;
    if ((v36 & 1) != 0)
      v34 = (void *)0x8000000100049550;
    else
      v34 = (void *)0x8000000100049520;
  }
  v37 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v45._object = (void *)0xE000000000000000;
  v38._countAndFlagsBits = v33;
  v38._object = v34;
  v39._countAndFlagsBits = 0;
  v39._object = (void *)0xE000000000000000;
  v45._countAndFlagsBits = 0;
  v40 = NSLocalizedString(_:tableName:bundle:value:comment:)(v38, (Swift::String_optional)0, (NSBundle)v37, v39, v45);
  swift_bridgeObjectRelease(v34);

  v41 = sub_1000033B8(&qword_100051368);
  v42 = swift_allocObject(v41, 112, 7);
  *(_OWORD *)(v42 + 16) = xmmword_10003FCD0;
  *(_QWORD *)(v42 + 56) = &type metadata for Int;
  *(_QWORD *)(v42 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v42 + 32) = v29;
  *(_QWORD *)(v42 + 96) = &type metadata for Int;
  *(_QWORD *)(v42 + 104) = &protocol witness table for Int;
  *(_QWORD *)(v42 + 72) = (uint64_t)v28;
  static String.localizedStringWithFormat(_:_:)(v40._countAndFlagsBits, v40._object, v42);
  swift_bridgeObjectRelease(v40._object);
  swift_bridgeObjectRelease(v42);

}

unint64_t sub_10003BD88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100052B88;
  if (!qword_100052B88)
  {
    v1 = objc_opt_self(NSObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100052B88);
  }
  return result;
}

id sub_10003BDC4(id a1, id a2)
{
  id v3;
  NSString v4;
  NSString v5;
  id v6;
  id result;
  uint64_t v8;

  if (a2 && objc_msgSend(a2, "activityMoveMode") == (id)2)
  {
    v3 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v4 = String._bridgeToObjectiveC()();
    v5 = String._bridgeToObjectiveC()();
    v6 = objc_msgSend(v3, "localizedStringForKey:value:table:", v4, 0, v5);

LABEL_5:
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);

    return (id)v8;
  }
  result = objc_msgSend(a1, "localizedShortActiveEnergyUnitString");
  v6 = result;
  if (result)
    goto LABEL_5;
  __break(1u);
  return result;
}

void sub_10003BEE8(id a1)
{
  id v2;
  Swift::String v3;
  Swift::String v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  id v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  uint64_t v17;
  uint64_t v18;
  Swift::String v19;
  Swift::String v20;

  if (a1 && objc_msgSend(a1, "paused"))
  {
    v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v3._countAndFlagsBits = 0xD000000000000028;
    v19._object = (void *)0xE000000000000000;
    v3._object = (void *)0x8000000100049680;
    v4._countAndFlagsBits = 0;
    v4._object = (void *)0xE000000000000000;
    v19._countAndFlagsBits = 0;
    NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v19);

    return;
  }
  v5 = objc_msgSend((id)objc_opt_self(HKUnit), "minuteUnit");
  if (!a1)
  {
    v12 = 0;
    v11 = 0.0;
    goto LABEL_13;
  }
  v6 = objc_msgSend(a1, "appleExerciseTime");
  objc_msgSend(v6, "doubleValueForUnit:", v5);
  v8 = v7;

  if ((~*(_QWORD *)&v8 & 0x7FF0000000000000) == 0)
    goto LABEL_18;
  if (v8 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v8 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v9 = objc_msgSend(a1, "appleExerciseTimeGoal");
  objc_msgSend(v9, "doubleValueForUnit:", v5);
  v11 = v10;

  if ((~*(_QWORD *)&v11 & 0x7FF0000000000000) != 0)
  {
    if (v11 > -9.22337204e18)
    {
      if (v11 < 9.22337204e18)
      {
        v12 = (uint64_t)v8;
LABEL_13:
        v13 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v20._object = (void *)0xE000000000000000;
        v14._object = (void *)0x80000001000495B0;
        v14._countAndFlagsBits = 0xD00000000000001BLL;
        v15._countAndFlagsBits = 0;
        v15._object = (void *)0xE000000000000000;
        v20._countAndFlagsBits = 0;
        v16 = NSLocalizedString(_:tableName:bundle:value:comment:)(v14, (Swift::String_optional)0, (NSBundle)v13, v15, v20);

        v17 = sub_1000033B8(&qword_100051368);
        v18 = swift_allocObject(v17, 112, 7);
        *(_OWORD *)(v18 + 16) = xmmword_10003FCD0;
        *(_QWORD *)(v18 + 56) = &type metadata for Int;
        *(_QWORD *)(v18 + 64) = &protocol witness table for Int;
        *(_QWORD *)(v18 + 32) = v12;
        *(_QWORD *)(v18 + 96) = &type metadata for Int;
        *(_QWORD *)(v18 + 104) = &protocol witness table for Int;
        *(_QWORD *)(v18 + 72) = (uint64_t)v11;
        static String.localizedStringWithFormat(_:_:)(v16._countAndFlagsBits, v16._object, v18);

        swift_bridgeObjectRelease(v16._object);
        swift_bridgeObjectRelease(v18);
        return;
      }
      goto LABEL_17;
    }
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_10003C1C0(id a1)
{
  int v2;
  id v3;
  unint64_t v4;
  const char *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t countAndFlagsBits;
  unint64_t v26;
  Swift::String v27;

  if (!a1 || !objc_msgSend(a1, "paused"))
  {
    v6 = objc_msgSend((id)objc_opt_self(HKUnit), "countUnit");
    if (!a1)
    {
      v13 = 0;
      v12 = 0.0;
      goto LABEL_15;
    }
    v7 = objc_msgSend(a1, "appleStandHours");
    objc_msgSend(v7, "doubleValueForUnit:", v6);
    v9 = v8;

    if ((~*(_QWORD *)&v9 & 0x7FF0000000000000) == 0)
      goto LABEL_22;
    if (v9 <= -9.22337204e18)
    {
      __break(1u);
    }
    else if (v9 < 9.22337204e18)
    {
      v10 = objc_msgSend(a1, "appleStandHoursGoal");
      objc_msgSend(v10, "doubleValueForUnit:", v6);
      v12 = v11;

      if ((~*(_QWORD *)&v12 & 0x7FF0000000000000) == 0)
      {
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      if (v12 > -9.22337204e18)
      {
        if (v12 < 9.22337204e18)
        {
          v13 = (uint64_t)v9;
LABEL_15:
          v14 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
          v27._object = (void *)0xE000000000000000;
          v15._object = (void *)0x8000000100049600;
          v15._countAndFlagsBits = 0xD000000000000019;
          v16._countAndFlagsBits = 0;
          v16._object = (void *)0xE000000000000000;
          v27._countAndFlagsBits = 0;
          v17 = NSLocalizedString(_:tableName:bundle:value:comment:)(v15, (Swift::String_optional)0, (NSBundle)v14, v16, v27);

          v18 = sub_1000033B8(&qword_100051368);
          v19 = swift_allocObject(v18, 112, 7);
          *(_OWORD *)(v19 + 16) = xmmword_10003FCD0;
          *(_QWORD *)(v19 + 56) = &type metadata for Int;
          *(_QWORD *)(v19 + 64) = &protocol witness table for Int;
          *(_QWORD *)(v19 + 32) = v13;
          *(_QWORD *)(v19 + 96) = &type metadata for Int;
          *(_QWORD *)(v19 + 104) = &protocol witness table for Int;
          *(_QWORD *)(v19 + 72) = (uint64_t)v12;
          v20 = static String.localizedStringWithFormat(_:_:)(v17._countAndFlagsBits, v17._object, v19);

          swift_bridgeObjectRelease(v17._object);
          swift_bridgeObjectRelease(v19);
          return v20;
        }
        goto LABEL_21;
      }
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    __break(1u);
    goto LABEL_20;
  }
  if (qword_1000511F8 != -1)
LABEL_24:
    swift_once(&qword_1000511F8, sub_10003D32C);
  v2 = *(unsigned __int8 *)(qword_100054900 + OBJC_IVAR____TtC13FitnessWidget25FitnessWidgetDataProvider_isWheelchairUser);
  v3 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  if (v2 == 1)
  {
    v4 = 0xD00000000000002ALL;
    v26 = 0xE000000000000000;
    v5 = "ACCESSIBILITY_PAUSED_WHEELCHAIR_DATA_LABEL";
  }
  else
  {
    v4 = 0xD000000000000025;
    v26 = 0xE000000000000000;
    v5 = "ACCESSIBILITY_PAUSED_STAND_DATA_LABEL";
  }
  v22 = (unint64_t)(v5 - 32) | 0x8000000000000000;
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  v24 = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v4, (Swift::String_optional)0, (NSBundle)v3, v23, *(Swift::String *)(&v26 - 1))._countAndFlagsBits;

  return countAndFlagsBits;
}

void sub_10003C4F8(id a1)
{
  id v2;
  id v3;
  double v4;
  double v5;
  id v6;
  NSString v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  char v23;
  uint64_t v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  uint64_t v32;
  uint64_t v33;
  Swift::String v34;

  if (a1 && objc_msgSend(a1, "activityMoveMode") == (id)2)
  {
    v2 = objc_msgSend(a1, "appleMoveTime");
    v3 = objc_msgSend((id)objc_opt_self(HKUnit), "minuteUnit");
    objc_msgSend(v2, "doubleValueForUnit:", v3);
    v5 = v4;

    if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) != 0)
    {
      if (v5 > -9.22337204e18)
      {
        if (v5 < 9.22337204e18)
        {
          v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
          v7 = String._bridgeToObjectiveC()();
          v8 = String._bridgeToObjectiveC()();
          v9 = objc_msgSend(v6, "localizedStringForKey:value:table:", v7, 0, v8);

          v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
          v12 = v11;

          v13 = sub_1000033B8(&qword_100051368);
          v14 = swift_allocObject(v13, 72, 7);
          *(_OWORD *)(v14 + 16) = xmmword_10003FCE0;
          *(_QWORD *)(v14 + 56) = &type metadata for Int;
          *(_QWORD *)(v14 + 64) = &protocol witness table for Int;
          *(_QWORD *)(v14 + 32) = (uint64_t)v5;
          static String.localizedStringWithFormat(_:_:)(v10, v12, v14);
          swift_bridgeObjectRelease(v12);
          swift_bridgeObjectRelease(v14);
          return;
        }
        goto LABEL_29;
      }
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
      return;
    }
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (qword_1000511F0 != -1)
    swift_once(&qword_1000511F0, sub_10003D274);
  v15 = objc_msgSend((id)qword_1000548F8, "unitManager");
  if (!v15)
    goto LABEL_30;
  v16 = v15;
  v17 = objc_msgSend(v15, "userActiveEnergyBurnedUnit");

  if (!a1)
    goto LABEL_15;
  v18 = objc_msgSend(a1, "activeEnergyBurned");
  objc_msgSend(v18, "doubleValueForUnit:", v17);
  v20 = v19;

  if ((~*(_QWORD *)&v20 & 0x7FF0000000000000) == 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v20 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v20 >= 9.22337204e18)
  {
    __break(1u);
LABEL_15:
    v20 = 0.0;
  }
  sub_10003BD88();
  v21 = (void *)objc_opt_self(HKUnit);
  v22 = objc_msgSend(v21, "kilocalorieUnit");
  v23 = static NSObject.== infix(_:_:)(v17, v22);

  if ((v23 & 1) != 0)
  {
    v24 = 0xD00000000000002ELL;
    v25 = (void *)0x8000000100049740;
  }
  else
  {
    v26 = objc_msgSend(v21, "jouleUnitWithMetricPrefix:", 9);
    v27 = static NSObject.== infix(_:_:)(v17, v26);

    if ((v27 & 1) != 0)
      v24 = 0xD00000000000002CLL;
    else
      v24 = 0xD00000000000002ALL;
    if ((v27 & 1) != 0)
      v25 = (void *)0x8000000100049710;
    else
      v25 = (void *)0x80000001000496E0;
  }
  v28 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v34._object = (void *)0xE000000000000000;
  v29._countAndFlagsBits = v24;
  v29._object = v25;
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  v34._countAndFlagsBits = 0;
  v31 = NSLocalizedString(_:tableName:bundle:value:comment:)(v29, (Swift::String_optional)0, (NSBundle)v28, v30, v34);
  swift_bridgeObjectRelease(v25);

  v32 = sub_1000033B8(&qword_100051368);
  v33 = swift_allocObject(v32, 72, 7);
  *(_OWORD *)(v33 + 16) = xmmword_10003FCE0;
  *(_QWORD *)(v33 + 56) = &type metadata for Int;
  *(_QWORD *)(v33 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v33 + 32) = (uint64_t)v20;
  static String.localizedStringWithFormat(_:_:)(v31._countAndFlagsBits, v31._object, v33);
  swift_bridgeObjectRelease(v31._object);
  swift_bridgeObjectRelease(v33);

}

void sub_10003C9B8(void *a1)
{
  id v2;
  id v3;
  double v4;
  double v5;
  id v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;

  v2 = objc_msgSend((id)objc_opt_self(HKUnit), "minuteUnit");
  if (!a1)
    goto LABEL_6;
  v3 = objc_msgSend(a1, "appleExerciseTime");
  objc_msgSend(v3, "doubleValueForUnit:", v2);
  v5 = v4;

  if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) != 0)
  {
    if (v5 > -9.22337204e18)
    {
      if (v5 < 9.22337204e18)
      {
LABEL_7:
        v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v12._object = (void *)0xE000000000000000;
        v7._object = (void *)0x80000001000496B0;
        v7._countAndFlagsBits = 0xD000000000000024;
        v8._countAndFlagsBits = 0;
        v8._object = (void *)0xE000000000000000;
        v12._countAndFlagsBits = 0;
        v9 = NSLocalizedString(_:tableName:bundle:value:comment:)(v7, (Swift::String_optional)0, (NSBundle)v6, v8, v12);

        v10 = sub_1000033B8(&qword_100051368);
        v11 = swift_allocObject(v10, 72, 7);
        *(_OWORD *)(v11 + 16) = xmmword_10003FCE0;
        *(_QWORD *)(v11 + 56) = &type metadata for Int;
        *(_QWORD *)(v11 + 64) = &protocol witness table for Int;
        *(_QWORD *)(v11 + 32) = (uint64_t)v5;
        static String.localizedStringWithFormat(_:_:)(v9._countAndFlagsBits, v9._object, v11);

        swift_bridgeObjectRelease(v9._object);
        swift_bridgeObjectRelease(v11);
        return;
      }
      __break(1u);
LABEL_6:
      v5 = 0.0;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t destroy for SummaryFormattingHelper(uint64_t a1)
{

  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for SummaryFormattingHelper(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  v6 = v3;
  v7 = v4;
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t assignWithCopy for SummaryFormattingHelper(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

uint64_t assignWithTake for SummaryFormattingHelper(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SummaryFormattingHelper(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SummaryFormattingHelper(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SummaryFormattingHelper()
{
  return &type metadata for SummaryFormattingHelper;
}

void sub_10003CD48(void *a1)
{
  id v1;
  id v2;
  double v3;
  double v4;
  id v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;

  if (!a1)
    goto LABEL_6;
  v1 = objc_msgSend(a1, "stepCount");
  v2 = objc_msgSend((id)objc_opt_self(HKUnit), "countUnit");
  objc_msgSend(v1, "doubleValueForUnit:", v2);
  v4 = v3;

  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) != 0)
  {
    if (v4 > -9.22337204e18)
    {
      if (v4 < 9.22337204e18)
      {
LABEL_7:
        v5 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v11._object = (void *)0xE000000000000000;
        v6._object = (void *)0x80000001000497D0;
        v6._countAndFlagsBits = 0xD000000000000019;
        v7._countAndFlagsBits = 0;
        v7._object = (void *)0xE000000000000000;
        v11._countAndFlagsBits = 0;
        v8 = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v11);

        v9 = sub_1000033B8(&qword_100051368);
        v10 = swift_allocObject(v9, 72, 7);
        *(_OWORD *)(v10 + 16) = xmmword_10003FCE0;
        *(_QWORD *)(v10 + 56) = &type metadata for Int;
        *(_QWORD *)(v10 + 64) = &protocol witness table for Int;
        *(_QWORD *)(v10 + 32) = (uint64_t)v4;
        static String.localizedStringWithFormat(_:_:)(v8._countAndFlagsBits, v8._object, v10);
        swift_bridgeObjectRelease(v8._object);
        swift_bridgeObjectRelease(v10);
        return;
      }
      __break(1u);
LABEL_6:
      v4 = 0.0;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
}

id sub_10003CEFC(void *a1, void *a2)
{
  id result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char v10;
  unint64_t v11;
  id v12;
  NSString v13;
  NSString v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  result = objc_msgSend(a1, "unitManager");
  if (result)
  {
    v4 = result;
    v5 = objc_msgSend(result, "userDistanceHKUnitForDistanceType:", 1);

    if (a2)
    {
      v6 = objc_msgSend(a2, "distanceWalkingRunning");
      objc_msgSend(v6, "doubleValueForUnit:", v5);
      v8 = v7;

    }
    else
    {
      v8 = 0;
    }
    sub_10003BD88();
    v9 = objc_msgSend((id)objc_opt_self(HKUnit), "mileUnit");
    v10 = static NSObject.== infix(_:_:)(v5, v9);

    if ((v10 & 1) != 0)
      v11 = 0x80000001000497A0;
    else
      v11 = 0x8000000100049770;
    v12 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v13 = String._bridgeToObjectiveC()();
    v14 = String._bridgeToObjectiveC()();
    v15 = objc_msgSend(v12, "localizedStringForKey:value:table:", v13, 0, v14);

    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    v18 = v17;
    swift_bridgeObjectRelease(v11);

    v19 = sub_1000033B8(&qword_100051368);
    v20 = swift_allocObject(v19, 72, 7);
    *(_OWORD *)(v20 + 16) = xmmword_10003FCE0;
    *(_QWORD *)(v20 + 56) = &type metadata for Double;
    *(_QWORD *)(v20 + 64) = &protocol witness table for Double;
    *(_QWORD *)(v20 + 32) = v8;
    v21 = static String.localizedStringWithFormat(_:_:)(v16, v18, v20);

    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v20);
    return (id)v21;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10003D14C(void *a1)
{
  id result;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  result = objc_msgSend(a1, "unitManager");
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, "userDistanceUnitForDistanceType:", 1);

    v5 = objc_msgSend(a1, "localizedShortUnitStringForDistanceUnit:", v4);
    v6 = v5;
    if (v5)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
      v8 = v7;

      v9 = sub_100008E40();
      v6 = (void *)StringProtocol.localizedUppercase.getter(&type metadata for String, v9);
      swift_bridgeObjectRelease(v8);
    }
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003D224()
{
  return EnvironmentValues.widgetFamily.getter();
}

id sub_10003D244()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)HKHealthStore), "init");
  qword_1000548F0 = (uint64_t)result;
  return result;
}

void sub_10003D274()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;

  if (qword_1000511E8 != -1)
    swift_once(&qword_1000511E8, sub_10003D244);
  v0 = (void *)qword_1000548F0;
  v1 = objc_allocWithZone((Class)FIUIUnitManager);
  v2 = v0;
  v3 = objc_msgSend(v1, "initWithHealthStore:", v2);

  v4 = objc_msgSend(objc_allocWithZone((Class)FIUIFormattingManager), "initWithUnitManager:", v3);
  if (v4)
    qword_1000548F8 = (uint64_t)v4;
  else
    __break(1u);
}

uint64_t sub_10003D32C()
{
  void *v0;
  uint64_t v1;
  uint64_t result;

  if (qword_1000511E8 != -1)
    swift_once(&qword_1000511E8, sub_10003D244);
  v0 = (void *)qword_1000548F0;
  v1 = type metadata accessor for FitnessWidgetDataProvider(0);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  result = sub_10000D394(v0);
  qword_100054900 = result;
  return result;
}

uint64_t sub_10003D39C()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  char *v3;
  uint64_t DayWidget;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, char *, uint64_t);
  void (*v12)(char *, uint64_t);
  uint64_t v14;

  v0 = sub_1000033B8(&qword_100052B98);
  v1 = __chkstk_darwin(v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  DayWidget = type metadata accessor for TrainingLoadDayWidget(0, v1);
  v5 = *(_QWORD *)(DayWidget - 8);
  __chkstk_darwin(DayWidget);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v10 = (char *)&v14 - v9;
  if (qword_1000511E8 != -1)
    swift_once(&qword_1000511E8, sub_10003D244);
  TrainingLoadDayWidget.init(healthStore:)((id)qword_1000548F0);
  v11 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v11(v7, v10, DayWidget);
  v11(v3, v7, DayWidget);
  TupleWidget.init(_:)(v3, v0);
  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v10, DayWidget);
  return ((uint64_t (*)(char *, uint64_t))v12)(v7, DayWidget);
}

uint64_t sub_10003D4F4@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSString v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  __n128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t OpaqueTypeConformance2;
  uint64_t v48;
  __n128 v49;
  _OWORD *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  __n128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _OWORD *v59;
  uint64_t v60;
  uint64_t v61;
  __n128 v62;
  int v64;
  uint64_t v65;
  __int128 v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  id v80;

  v74 = a1;
  v1 = sub_1000033B8(&qword_100052BB0);
  v65 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000033B8(&qword_100052BB8);
  v5 = *(_QWORD *)(v4 - 8);
  v68 = v4;
  v69 = v5;
  __chkstk_darwin(v4);
  v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000033B8(&qword_100052BC0);
  v9 = *(_QWORD *)(v8 - 8);
  v70 = v8;
  v71 = v9;
  __chkstk_darwin(v8);
  v11 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000033B8(&qword_100052BC8);
  v13 = *(_QWORD *)(v12 - 8);
  v72 = v12;
  v73 = v13;
  __chkstk_darwin(v12);
  v67 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(FINanoLifestylePreferencesDomain);
  v16 = v15;
  v17 = objc_allocWithZone((Class)NSUserDefaults);
  v18 = String._bridgeToObjectiveC()();
  v19 = objc_msgSend(v17, "initWithSuiteName:", v18, swift_bridgeObjectRelease(v16).n128_f64[0]);

  v21 = static os_log_type_t.default.getter(v20);
  v22 = (void *)HKLogActivity;
  v23 = sub_1000033B8(&qword_100051368);
  v24 = swift_allocObject(v23, 72, 7);
  v66 = xmmword_10003FCE0;
  *(_OWORD *)(v24 + 16) = xmmword_10003FCE0;
  *(_QWORD *)(v24 + 56) = &type metadata for Bool;
  *(_QWORD *)(v24 + 64) = &protocol witness table for Bool;
  *(_BYTE *)(v24 + 32) = 1;
  v25 = v22;
  os_log(_:dso:log:_:_:)(v21, &_mh_execute_header, v25, "FitnessWidgetProvider init isWidget %d", v64);

  swift_bridgeObjectRelease(v24);
  LOBYTE(v75) = 1;
  v76 = 0xD00000000000001ELL;
  v77 = 0x8000000100049810;
  v78 = 0xD000000000000011;
  v79 = 0x8000000100049830;
  v80 = v19;
  v26 = type metadata accessor for FitnessWidgetView(0);
  v27 = sub_100008304(&qword_100052BD0, type metadata accessor for FitnessWidgetView, (uint64_t)&unk_1000404A0);
  v28 = sub_10003E304();
  StaticConfiguration.init<A>(kind:provider:content:)(0xD000000000000011, 0x80000001000497F0, &v75, sub_10003DA90, 0, v26, &type metadata for FitnessWidgetProvider, v27, v28);
  v29 = LocalizedStringKey.init(stringLiteral:)(0x545F544547444957, 0xEC000000454C5449);
  v30 = Text.init(_:tableName:bundle:comment:)(v29);
  v32 = v31;
  v34 = v33;
  v36 = v35 & 1;
  v37 = sub_100003928(&qword_100052BE0, &qword_100052BB0, (uint64_t)&protocol conformance descriptor for StaticConfiguration<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v30, v32, v36, v34, v1, v37);
  sub_100008E84(v30, v32, v36);
  v38 = swift_bridgeObjectRelease(v34);
  (*(void (**)(char *, uint64_t, __n128))(v65 + 8))(v3, v1, v38);
  v39 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000012, 0x80000001000498B0);
  v40 = Text.init(_:tableName:bundle:comment:)(v39);
  v42 = v41;
  v44 = v43;
  v46 = v45 & 1;
  v75 = v1;
  v76 = v37;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v75, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v48 = v68;
  WidgetConfiguration.description(_:)(v40, v42, v46, v44, v68, OpaqueTypeConformance2);
  sub_100008E84(v40, v42, v46);
  v49 = swift_bridgeObjectRelease(v44);
  (*(void (**)(char *, uint64_t, __n128))(v69 + 8))(v7, v48, v49);
  v50 = sub_10003E4B8();
  v75 = v48;
  v76 = OpaqueTypeConformance2;
  v51 = swift_getOpaqueTypeConformance2(&v75, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v52 = v67;
  v53 = v70;
  WidgetConfiguration.supportedFamilies(_:)(v50, v70, v51);
  v54 = swift_bridgeObjectRelease(v50);
  v55 = v53;
  (*(void (**)(char *, uint64_t, __n128))(v71 + 8))(v11, v53, v54);
  v56 = sub_1000033B8(&qword_100052BE8);
  v57 = type metadata accessor for WidgetLocation(0);
  v58 = swift_allocObject(v56, ((*(unsigned __int8 *)(*(_QWORD *)(v57 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v57 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v57 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v57 - 8) + 80) | 7);
  *(_OWORD *)(v58 + 16) = v66;
  static WidgetLocation.standBy.getter();
  v59 = sub_10003E4B8();
  v75 = v55;
  v76 = v51;
  v60 = swift_getOpaqueTypeConformance2(&v75, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
  v61 = v72;
  WidgetConfiguration.disfavoredLocations(_:for:)(v58, v59, v72, v60);
  swift_bridgeObjectRelease(v58);
  v62 = swift_bridgeObjectRelease(v59);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v73 + 8))(v52, v61, v62);
}

id sub_10003DA90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  int *v10;
  uint64_t v11;
  void *v12;
  char v13;
  __n128 v14;
  uint64_t KeyPath;
  __n128 v16;
  uint64_t v17;
  _QWORD *v18;
  __n128 v19;
  uint64_t v20;
  char *v21;
  id v22;
  uint64_t v24;
  id v25;

  v4 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (int *)type metadata accessor for FitnessWidgetView(0);
  __chkstk_darwin(v7);
  v9 = (uint64_t *)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry(0);
  v11 = v10[7];
  v25 = *(id *)(a1 + v10[6]);
  sub_10001A5A4(a1 + v11, (uint64_t)v6);
  v12 = *(void **)(a1 + v10[8]);
  v13 = *(_BYTE *)(a1 + v10[9]);
  KeyPath = swift_getKeyPath(&unk_100041A48, v14);
  *v9 = swift_getKeyPath(&unk_100041A70, v16);
  v17 = sub_1000033B8(&qword_100051B88);
  swift_storeEnumTagMultiPayload(v9, v17, 0);
  v18 = (_QWORD *)((char *)v9 + v7[5]);
  *v18 = swift_getKeyPath(&unk_100041AA0, v19);
  v20 = sub_1000033B8(&qword_100051B90);
  swift_storeEnumTagMultiPayload(v18, v20, 0);
  v21 = (char *)v9 + v7[6];
  *(_QWORD *)v21 = KeyPath;
  v21[8] = 0;
  *(_QWORD *)((char *)v9 + v7[7]) = v25;
  sub_10000BBF4((uint64_t)v6, (uint64_t)v9 + v7[8]);
  *(_QWORD *)((char *)v9 + v7[9]) = v12;
  *((_BYTE *)v9 + v7[10]) = v13;
  sub_10003E604((uint64_t)v9, a2);
  v22 = v12;
  return v25;
}

uint64_t sub_10003DC34@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSString v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  __n128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t OpaqueTypeConformance2;
  __n128 v44;
  _OWORD *v45;
  uint64_t v46;
  uint64_t v47;
  __n128 v48;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  id v61;

  v55 = a1;
  v1 = sub_1000033B8(&qword_100052C00);
  v51 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000033B8(&qword_100052C08);
  v52 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000033B8(&qword_100052C10);
  v8 = *(_QWORD *)(v7 - 8);
  v53 = v7;
  v54 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(FINanoLifestylePreferencesDomain);
  v12 = v11;
  v13 = objc_allocWithZone((Class)NSUserDefaults);
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "initWithSuiteName:", v14, swift_bridgeObjectRelease(v12).n128_f64[0]);

  v17 = static os_log_type_t.default.getter(v16);
  v18 = (void *)HKLogActivity;
  v19 = sub_1000033B8(&qword_100051368);
  v20 = swift_allocObject(v19, 72, 7);
  *(_OWORD *)(v20 + 16) = xmmword_10003FCE0;
  *(_QWORD *)(v20 + 56) = &type metadata for Bool;
  *(_QWORD *)(v20 + 64) = &protocol witness table for Bool;
  *(_BYTE *)(v20 + 32) = 0;
  v21 = v18;
  os_log(_:dso:log:_:_:)(v17, &_mh_execute_header, v21, "FitnessWidgetProvider init isWidget %d", v50);

  swift_bridgeObjectRelease(v20);
  LOBYTE(v56) = 0;
  v57 = 0xD00000000000001ELL;
  v58 = 0x8000000100049810;
  v59 = 0xD000000000000011;
  v60 = 0x8000000100049830;
  v61 = v15;
  v22 = type metadata accessor for FitnessComplicationView(0);
  v23 = sub_100008304(&qword_100052C18, type metadata accessor for FitnessComplicationView, (uint64_t)&unk_100040EE8);
  v24 = sub_10003E304();
  StaticConfiguration.init<A>(kind:provider:content:)(0xD00000000000001ELL, 0x8000000100049920, &v56, sub_10003E0CC, 0, v22, &type metadata for FitnessWidgetProvider, v23, v24);
  v25 = LocalizedStringKey.init(stringLiteral:)(0x545F544547444957, 0xEC000000454C5449);
  v26 = Text.init(_:tableName:bundle:comment:)(v25);
  v28 = v27;
  v30 = v29;
  v32 = v31 & 1;
  v33 = sub_100003928(&qword_100052C20, &qword_100052C00, (uint64_t)&protocol conformance descriptor for StaticConfiguration<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v26, v28, v32, v30, v1, v33);
  sub_100008E84(v26, v28, v32);
  v34 = swift_bridgeObjectRelease(v30);
  (*(void (**)(char *, uint64_t, __n128))(v51 + 8))(v3, v1, v34);
  v35 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000012, 0x80000001000498B0);
  v36 = Text.init(_:tableName:bundle:comment:)(v35);
  v38 = v37;
  v40 = v39;
  v42 = v41 & 1;
  v56 = v1;
  v57 = v33;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v56, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v36, v38, v42, v40, v4, OpaqueTypeConformance2);
  sub_100008E84(v36, v38, v42);
  v44 = swift_bridgeObjectRelease(v40);
  (*(void (**)(char *, uint64_t, __n128))(v52 + 8))(v6, v4, v44);
  v45 = sub_10003E648();
  v56 = v4;
  v57 = OpaqueTypeConformance2;
  v46 = swift_getOpaqueTypeConformance2(&v56, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v47 = v53;
  WidgetConfiguration.supportedFamilies(_:)(v45, v53, v46);
  v48 = swift_bridgeObjectRelease(v45);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v54 + 8))(v10, v47, v48);
}

id sub_10003E0CC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int *v7;
  char v8;
  void *v9;
  __n128 v10;
  uint64_t v11;
  int *v12;
  id v13;
  uint64_t v15;
  id v16;

  v4 = sub_1000033B8((uint64_t *)&unk_100051980);
  __chkstk_darwin(v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000511F0 != -1)
    swift_once(&qword_1000511F0, sub_10003D274);
  v16 = (id)qword_1000548F8;
  v7 = (int *)type metadata accessor for FitnessWidgetProvider.ActivityEntry(0);
  v8 = *(_BYTE *)(a1 + v7[10]);
  v9 = *(void **)(a1 + v7[6]);
  sub_10001A5A4(a1 + v7[7], (uint64_t)v6);
  *a2 = swift_getKeyPath(&unk_100041A70, v10);
  v11 = sub_1000033B8(&qword_100051B88);
  swift_storeEnumTagMultiPayload(a2, v11, 0);
  v12 = (int *)type metadata accessor for FitnessComplicationView(0);
  *(_QWORD *)((char *)a2 + v12[5]) = v16;
  *((_BYTE *)a2 + v12[6]) = v8;
  *(_QWORD *)((char *)a2 + v12[7]) = v9;
  sub_10000BBF4((uint64_t)v6, (uint64_t)a2 + v12[8]);
  v13 = v9;
  return v16;
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10003E234();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_10003E234()
{
  unint64_t result;

  result = qword_100052B90;
  if (!qword_100052B90)
  {
    result = swift_getWitnessTable(&unk_10004196C, &type metadata for WidgetGroup);
    atomic_store(result, (unint64_t *)&qword_100052B90);
  }
  return result;
}

ValueMetadata *type metadata accessor for WidgetGroup()
{
  return &type metadata for WidgetGroup;
}

uint64_t sub_10003E288(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000425DC, 1);
}

ValueMetadata *type metadata accessor for FitnessWidget()
{
  return &type metadata for FitnessWidget;
}

ValueMetadata *type metadata accessor for FitnessComplication()
{
  return &type metadata for FitnessComplication;
}

uint64_t sub_10003E2B8()
{
  return sub_100003928(&qword_100052BA0, &qword_100052BA8, (uint64_t)&protocol conformance descriptor for TupleWidget<A>);
}

uint64_t sub_10003E2E4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10004262C, 1);
}

uint64_t sub_10003E2F4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100042604, 1);
}

unint64_t sub_10003E304()
{
  unint64_t result;

  result = qword_100052BD8;
  if (!qword_100052BD8)
  {
    result = swift_getWitnessTable(&unk_10003FD88, &type metadata for FitnessWidgetProvider);
    atomic_store(result, (unint64_t *)&qword_100052BD8);
  }
  return result;
}

uint64_t sub_10003E348()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_10003E368(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for DynamicTypeSize(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.dynamicTypeSize.setter(v3);
}

uint64_t sub_10003E3E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v0 = type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey(0);
  v1 = sub_100008304(&qword_100052BF8, (uint64_t (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey, (uint64_t)&protocol conformance descriptor for EnvironmentValues.ShowsWidgetBackgroundKey);
  EnvironmentValues.subscript.getter(&v3, v0, v0, v1);
  return v3;
}

_QWORD *sub_10003E444@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;

  v2 = type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey(0);
  v3 = sub_100008304(&qword_100052BF8, (uint64_t (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey, (uint64_t)&protocol conformance descriptor for EnvironmentValues.ShowsWidgetBackgroundKey);
  result = EnvironmentValues.subscript.getter(&v5, v2, v2, v3);
  *a1 = v5;
  return result;
}

_OWORD *sub_10003E4B8()
{
  NSString v0;
  int v1;
  id v2;
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, _QWORD, uint64_t);

  v0 = String._bridgeToObjectiveC()();
  v1 = MGGetSInt32Answer(v0, 0xFFFFFFFFLL);

  v2 = MTLCreateSystemDefaultDevice();
  swift_unknownObjectRelease(v2);
  v3 = &_swiftEmptyArrayStorage;
  if (v2 && v1 != 3)
  {
    v4 = sub_1000033B8(&qword_100052BF0);
    v5 = type metadata accessor for WidgetFamily(0);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 72);
    v8 = *(unsigned __int8 *)(v6 + 80);
    v9 = (v8 + 32) & ~v8;
    v3 = (_OWORD *)swift_allocObject(v4, v9 + 2 * v7, v8 | 7);
    v3[1] = xmmword_10003FCD0;
    v10 = (char *)v3 + v9;
    v11 = *(void (**)(char *, _QWORD, uint64_t))(v6 + 104);
    v11(v10, enum case for WidgetFamily.systemSmall(_:), v5);
    v11(&v10[v7], enum case for WidgetFamily.systemMedium(_:), v5);
  }
  return v3;
}

uint64_t sub_10003E5C0()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_10003E5E0()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_10003E604(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FitnessWidgetView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10003E648()
{
  NSString v0;
  int v1;
  id v2;
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, _QWORD, uint64_t);

  v0 = String._bridgeToObjectiveC()();
  v1 = MGGetSInt32Answer(v0, 0xFFFFFFFFLL);

  v2 = MTLCreateSystemDefaultDevice();
  swift_unknownObjectRelease(v2);
  v3 = &_swiftEmptyArrayStorage;
  if (v2 && v1 != 3)
  {
    v4 = sub_1000033B8(&qword_100052BF0);
    v5 = type metadata accessor for WidgetFamily(0);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 72);
    v8 = *(unsigned __int8 *)(v6 + 80);
    v9 = (v8 + 32) & ~v8;
    v3 = (_OWORD *)swift_allocObject(v4, v9 + 3 * v7, v8 | 7);
    v3[1] = xmmword_1000415D0;
    v10 = (char *)v3 + v9;
    v11 = *(void (**)(char *, _QWORD, uint64_t))(v6 + 104);
    v11(v10, enum case for WidgetFamily.accessoryCircular(_:), v5);
    v11(&v10[v7], enum case for WidgetFamily.accessoryInline(_:), v5);
    v11(&v10[2 * v7], enum case for WidgetFamily.accessoryRectangular(_:), v5);
  }
  return v3;
}

uint64_t sub_10003E76C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v0 = sub_1000036E4(&qword_100052BC8);
  v1 = sub_1000036E4(&qword_100052BC0);
  v2 = sub_1000036E4(&qword_100052BB8);
  v7 = sub_1000036E4(&qword_100052BB0);
  v8 = sub_100003928(&qword_100052BE0, &qword_100052BB0, (uint64_t)&protocol conformance descriptor for StaticConfiguration<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v7 = v2;
  v8 = OpaqueTypeConformance2;
  v4 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v7 = v1;
  v8 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
  v7 = v0;
  v8 = v5;
  return swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disfavoredLocations(_:for:)>>, 1);
}

uint64_t sub_10003E858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000036E4(&qword_100052C10);
  v1 = sub_1000036E4(&qword_100052C08);
  v5 = sub_1000036E4(&qword_100052C00);
  v6 = sub_100003928(&qword_100052C20, &qword_100052C00, (uint64_t)&protocol conformance descriptor for StaticConfiguration<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v5 = v1;
  v6 = OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v5 = v0;
  v6 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
}

uint64_t sub_10003E914()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC13FitnessWidgetP33_C3E7AD715A58107B335B0DFC1680E01419ResourceBundleClass);
}
