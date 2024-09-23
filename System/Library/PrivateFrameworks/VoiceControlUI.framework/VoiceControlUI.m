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

uint64_t sub_24A25D940(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24A25D960(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_24A25DA30(a1, &qword_25791E6D8);
}

void type metadata accessor for VCUIOverlayTextOverlayType(uint64_t a1)
{
  sub_24A25DA30(a1, &qword_25791E6E0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24A25D9C0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24A25D9E0(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_24A25DA30(a1, &qword_25791E6E8);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_24A25DA30(a1, &qword_25791E6F0);
}

void sub_24A25DA30(uint64_t a1, unint64_t *a2)
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

uint64_t initializeBufferWithCopyOfBuffer for VCUIHorizontalFlowLayout(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for VCUIHorizontalFlowLayout()
{
  return swift_release();
}

uint64_t initializeWithCopy for VCUIHorizontalFlowLayout(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for VCUIHorizontalFlowLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v3;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for VCUIHorizontalFlowLayout(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for VCUIHorizontalFlowLayout(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VCUIHorizontalFlowLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)(result + 48) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for VCUIHorizontalFlowLayout()
{
  return &type metadata for VCUIHorizontalFlowLayout;
}

unint64_t sub_24A25DC8C()
{
  unint64_t result;

  result = qword_25791E6F8;
  if (!qword_25791E6F8)
  {
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDEEF18], MEMORY[0x24BDEEF38]);
    atomic_store(result, (unint64_t *)&qword_25791E6F8);
  }
  return result;
}

double sub_24A25DCD0(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  double *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;

  v6 = (double *)sub_24A25E4F0(a5, a1, a2 & 1, a3, a4 & 1, *(double *)(v5 + 16), *(CGFloat *)(v5 + 24));
  v7 = *((_QWORD *)v6 + 2);
  if (v7)
  {
    v8 = v6 + 7;
    v9 = *((_QWORD *)v6 + 7);
    v10 = *((_QWORD *)v6 + 4);
    v11 = *((_QWORD *)v6 + 5);
    v12 = v6[6];
    do
    {
      v13 = v12;
      v14 = v9;
      *(CGRect *)&v10 = CGRectUnion(*(CGRect *)&v10, *(CGRect *)(v8 - 3));
      v12 = v15;
      v9 = v16;
      v8 += 4;
      --v7;
    }
    while (v7);
  }
  else
  {
    v12 = *MEMORY[0x24BDBF148];
  }
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_24A25DD94(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, CGFloat a6, double a7, CGFloat a8, CGFloat a9)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  double v27;
  double v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  CGFloat *v32;
  CGFloat v33;
  char v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  char *v42;
  char v43;
  char *v44;
  double v45;
  double v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  char *v58;
  int v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  double MinY;
  double MinX;
  uint64_t v70;
  char v71;
  char v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v18 = sub_24A2665E0();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v67 = (char *)&v52 - v23;
  v24 = sub_24A266580();
  v65 = *(_QWORD *)(v24 - 8);
  v66 = v24;
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = *(double *)&a1;
  LODWORD(MinX) = a2;
  v28 = 1.79769313e308;
  if ((a2 & 1) != 0)
    v27 = 1.79769313e308;
  LODWORD(v70) = a4;
  if ((a4 & 1) == 0)
    v28 = *(double *)&a3;
  v72 = a2 & 1;
  v71 = a4 & 1;
  v52 = sub_24A25E4F0(a5, a1, a2 & 1, a3, a4 & 1, v27, v28);
  sub_24A26658C();
  sub_24A25EB50();
  sub_24A266868();
  sub_24A266880();
  result = sub_24A266874();
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v30 = result;
    if (!result)
      return swift_bridgeObjectRelease();
    if ((unint64_t)(result - 1) < *(_QWORD *)(v52 + 16))
    {
      v31 = 0;
      v32 = (CGFloat *)(v52 + 56);
      v59 = LOBYTE(MinX) & 1;
      v62 = a1;
      v63 = a3;
      v61 = v70 & 1;
      v57 = a9;
      v54 = a8;
      v56 = a7;
      v55 = a6;
      v53 = v18;
      v58 = v22;
      v64 = v30;
      v60 = a5;
      v33 = a7;
      v34 = LOBYTE(MinX) & 1;
      do
      {
        v70 = v31 + 1;
        sub_24A266598();
        v35 = *(v32 - 3);
        v36 = *(v32 - 2);
        v37 = *(v32 - 1);
        v38 = *v32;
        v73.origin.x = v35;
        v73.origin.y = v36;
        v73.size.width = v37;
        v73.size.height = *v32;
        MinX = CGRectGetMinX(v73);
        v39 = v55;
        v74.origin.x = v55;
        v74.origin.y = v33;
        v40 = v54;
        v74.size.width = v54;
        v74.size.height = a9;
        MinX = MinX + CGRectGetMinX(v74);
        v75.origin.x = v35;
        v75.origin.y = v36;
        v75.size.width = v37;
        v75.size.height = v38;
        MinY = CGRectGetMinY(v75);
        v76.origin.x = v39;
        v76.origin.y = v33;
        v76.size.width = v40;
        v76.size.height = a9;
        v41 = MinY + CGRectGetMinY(v76);
        v77.origin.x = v35;
        v77.origin.y = v36;
        v77.size.width = v37;
        v77.size.height = v38;
        CGRectGetWidth(v77);
        v78.origin.x = v35;
        v78.origin.y = v36;
        v78.size.width = v37;
        v78.size.height = v38;
        CGRectGetHeight(v78);
        CGRectMake(MinX, v41);
        sub_24A2667F0();
        v72 = v34;
        v42 = v26;
        v43 = v61;
        v71 = v61;
        v44 = v67;
        sub_24A26655C();
        sub_24A2665C8();
        v46 = v45;
        v47 = v19;
        v48 = *(void (**)(char *, uint64_t))(v19 + 8);
        v49 = v44;
        v50 = v53;
        v48(v49, v53);
        MinX = v46;
        v72 = v34;
        v71 = v43;
        v26 = v42;
        v51 = v58;
        sub_24A26655C();
        sub_24A2665D4();
        v48(v51, v50);
        v19 = v47;
        v72 = 0;
        v71 = 0;
        sub_24A266574();
        (*(void (**)(char *, uint64_t))(v65 + 8))(v26, v66);
        v32 += 4;
        v31 = v70;
      }
      while (v64 != v70);
      return swift_bridgeObjectRelease();
    }
  }
  __break(1u);
  return result;
}

double sub_24A25E1EC(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_24A25DCD0(a1, a2 & 1, a3, a4 & 1, a5);
}

uint64_t sub_24A25E23C(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, CGFloat a6, double a7, CGFloat a8, CGFloat a9)
{
  return sub_24A25DD94(a1, a2 & 1, a3, a4 & 1, a5, a6, a7, a8, a9);
}

uint64_t sub_24A25E28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_24A25E2E4(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF44F8]);
}

uint64_t sub_24A25E2B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_24A25E2E4(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF4500]);
}

uint64_t sub_24A25E2E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_24A25E324(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_24A266520();
  return sub_24A25E380;
}

void sub_24A25E380(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t sub_24A25E3B4()
{
  unint64_t result;

  result = qword_25791E700;
  if (!qword_25791E700)
  {
    result = MEMORY[0x24BD0B8C8](&unk_24A26704C, &type metadata for VCUIHorizontalFlowLayout);
    atomic_store(result, (unint64_t *)&qword_25791E700);
  }
  return result;
}

char *sub_24A25E3F8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791E728);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 32 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24A25E4F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, char a5, double a6, CGFloat a7)
{
  double *v7;
  double *v8;
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
  char *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  double v29;
  unint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  void (*v34)(__int128 *, _QWORD);
  char *v35;
  char *v36;
  char *v37;
  void (*v38)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  char isUniquelyReferenced_nonNull_native;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  char *v45;
  double v46;
  double v47;
  double v48;
  char v49;
  double v50;
  double Height;
  double *v52;
  uint64_t v53;
  uint64_t result;
  char v55;
  unint64_t v56;
  unint64_t v57;
  double *v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  double *v63;
  int v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  CGFloat v69;
  void (*v70)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v71;
  double *v72;
  char *v73;
  void (*v74)(char *, uint64_t, uint64_t);
  char *v75;
  uint64_t v76;
  char *v77;
  int v78;
  char *v79;
  uint64_t v80;
  char v81;
  __int128 v82;
  uint64_t v83;
  CGRect v84;
  CGRect v85;

  v8 = v7;
  v69 = a7;
  v68 = a6;
  v67 = a4;
  LODWORD(v72) = a3;
  v66 = a2;
  v62 = sub_24A266580();
  v11 = *(_QWORD *)(v62 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v79 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24A26658C();
  v14 = *(_QWORD *)(v13 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v75 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E710);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v77 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E718);
  v18 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v20 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v61 - v21;
  v76 = v14;
  v74 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v74(v20, a1, v13);
  v23 = sub_24A25EB50();
  sub_24A266868();
  *(_QWORD *)&v20[*(int *)(v17 + 36)] = v82;
  v24 = (uint64_t)v20;
  v25 = v23;
  sub_24A25EBD8(v24, (uint64_t)v22);
  v26 = &v22[*(int *)(v17 + 36)];
  v27 = *(_QWORD *)v26;
  sub_24A266880();
  if (v27 == (_QWORD)v82)
  {
    v28 = (char *)MEMORY[0x24BEE4AF8];
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v77, 1, 1, v62);
LABEL_30:
    sub_24A25EC20((uint64_t)v22);
    return (uint64_t)v28;
  }
  v78 = 0;
  v63 = v8 + 4;
  v29 = 0.0;
  v30 = v25;
  v28 = (char *)MEMORY[0x24BEE4AF8];
  v65 = v72 & 1;
  v64 = a5 & 1;
  v31 = 0.0;
  v32 = 0.0;
  v72 = v8;
  v33 = v62;
  v73 = v22;
  v71 = v30;
  while (1)
  {
    v34 = (void (*)(__int128 *, _QWORD))sub_24A266898();
    v35 = v77;
    (*(void (**)(char *))(v11 + 16))(v77);
    v34(&v82, 0);
    v36 = v75;
    v74(v75, (uint64_t)v22, v13);
    v37 = v26;
    sub_24A26688C();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v36, v13);
    v38 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v38(v35, 0, 1, v33);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v35, 1, v33) == 1)
    {
      v22 = v73;
      goto LABEL_30;
    }
    v70 = v38;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v79, v35, v33);
    v39 = v33;
    if ((v78 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v41 = 0.0;
      v78 = 1;
      v42 = 0.0;
      v43 = 0.0;
      v44 = 0.0;
      v45 = v37;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        goto LABEL_28;
      v46 = 0.0;
      goto LABEL_23;
    }
    LOBYTE(v82) = v65;
    LOBYTE(v80) = v64;
    sub_24A266568();
    v43 = v47;
    v44 = v48;
    v45 = v37;
    if (v29 + v47 <= v68)
    {
      v46 = v29;
    }
    else
    {
      v31 = v31 + v32 + v8[1];
      v32 = 0.0;
      v46 = 0.0;
    }
    v84.origin.x = v46;
    v84.origin.y = v31;
    v84.size.width = v43;
    v84.size.height = v44;
    if (CGRectGetMaxY(v84) > v69)
    {
      v49 = swift_isUniquelyReferenced_nonNull_native();
      v41 = 0.0;
      v78 = 1;
      v29 = v46;
      v42 = 0.0;
      v43 = 0.0;
      v44 = 0.0;
      if ((v49 & 1) == 0)
        goto LABEL_28;
      v29 = v46;
      v46 = 0.0;
      goto LABEL_23;
    }
    v50 = *v8;
    v85.origin.x = v46;
    v85.origin.y = v31;
    v85.size.width = v43;
    v85.size.height = v44;
    Height = CGRectGetHeight(v85);
    if (v32 <= Height)
      v32 = Height;
    v52 = v63;
    v82 = *(_OWORD *)v63;
    v83 = *((_QWORD *)v63 + 2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791E720);
    sub_24A266778();
    if ((v81 & 1) == 0)
      break;
    v53 = 1;
LABEL_21:
    v29 = v46 + v43 + v50;
    v82 = *(_OWORD *)v52;
    v83 = *((_QWORD *)v52 + 2);
    v80 = v53;
    v81 = 0;
    sub_24A266784();
    v55 = swift_isUniquelyReferenced_nonNull_native();
    v78 = 0;
    v41 = v46;
    v42 = v31;
    if ((v55 & 1) == 0)
    {
LABEL_28:
      v28 = sub_24A25E3F8(0, *((_QWORD *)v28 + 2) + 1, 1, v28);
      v46 = v41;
      v41 = v42;
      goto LABEL_23;
    }
    v41 = v31;
LABEL_23:
    v57 = *((_QWORD *)v28 + 2);
    v56 = *((_QWORD *)v28 + 3);
    if (v57 >= v56 >> 1)
      v28 = sub_24A25E3F8((char *)(v56 > 1), v57 + 1, 1, v28);
    *((_QWORD *)v28 + 2) = v57 + 1;
    v58 = (double *)&v28[32 * v57];
    v58[4] = v46;
    v58[5] = v41;
    v58[6] = v43;
    v58[7] = v44;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v79, v39);
    v59 = *(_QWORD *)v45;
    v22 = v73;
    v26 = v45;
    v33 = v39;
    sub_24A266880();
    v60 = v59 == (_QWORD)v82;
    v8 = v72;
    if (v60)
    {
      v70(v77, 1, 1, v62);
      goto LABEL_30;
    }
  }
  v82 = *(_OWORD *)v52;
  v83 = *((_QWORD *)v52 + 2);
  result = sub_24A266778();
  if ((v81 & 1) != 0)
    goto LABEL_32;
  v53 = v80 + 1;
  if (!__OFADD__(v80, 1))
  {
    v52 = v63;
    goto LABEL_21;
  }
  __break(1u);
LABEL_32:
  __break(1u);
  return result;
}

unint64_t sub_24A25EB50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25791E708;
  if (!qword_25791E708)
  {
    v1 = sub_24A26658C();
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDEC7A0], v1);
    atomic_store(result, (unint64_t *)&qword_25791E708);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD0B8B0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24A25EBD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A25EC20(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E718);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for VCUIBadgedHorizontalTextSegmentView()
{
  return &type metadata for VCUIBadgedHorizontalTextSegmentView;
}

uint64_t sub_24A25EC80()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_24A25EC90@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v4;
  unsigned __int8 v5;
  char v6;
  char v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  __n128 result;
  __int128 v17;
  __int128 v18;
  __n128 v19;
  char v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  __int128 v30;

  v4 = sub_24A2666D0();
  v5 = sub_24A2666E8();
  v6 = sub_24A2666DC();
  sub_24A2666DC();
  if (sub_24A2666DC() != v4)
    v6 = sub_24A2666DC();
  sub_24A2666DC();
  if (sub_24A2666DC() != v5)
    v6 = sub_24A2666DC();
  sub_24A25EDA8(a1, (uint64_t)&v19);
  v7 = v20;
  v8 = v21;
  v9 = v22;
  v10 = v24;
  v11 = v25;
  v12 = v26;
  v13 = v27;
  v14 = v28;
  v15 = v29;
  result = v19;
  v17 = v23;
  v18 = v30;
  *(_BYTE *)a2 = v6;
  *(__n128 *)(a2 + 8) = result;
  *(_BYTE *)(a2 + 24) = v7;
  *(_QWORD *)(a2 + 32) = v8;
  *(_BYTE *)(a2 + 40) = v9;
  *(_OWORD *)(a2 + 48) = v17;
  *(_BYTE *)(a2 + 64) = v10;
  *(_QWORD *)(a2 + 72) = v11;
  *(_QWORD *)(a2 + 80) = v12;
  *(_BYTE *)(a2 + 88) = v13;
  *(_QWORD *)(a2 + 96) = v14;
  *(_BYTE *)(a2 + 104) = v15;
  *(_OWORD *)(a2 + 112) = v18;
  return result;
}

uint64_t sub_24A25EDA8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  char v12;
  uint64_t v13;
  char v14;
  id v15;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;

  v4 = sub_24A2665EC();
  sub_24A25EEB0(a1, (uint64_t)&v17);
  v5 = v17;
  v6 = v18;
  v7 = v19;
  v8 = v20;
  v9 = v21;
  v10 = *((_QWORD *)&v21 + 1);
  sub_24A2667E4();
  sub_24A266550();
  v11 = v17;
  v12 = v18;
  v13 = v19;
  v14 = v20;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0x3FF0000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = v5;
  *(_BYTE *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 40) = v7;
  *(_QWORD *)(a2 + 48) = v8;
  *(_BYTE *)(a2 + 56) = v9;
  *(_QWORD *)(a2 + 64) = v10;
  *(_QWORD *)(a2 + 72) = v11;
  *(_BYTE *)(a2 + 80) = v12;
  *(_QWORD *)(a2 + 88) = v13;
  *(_BYTE *)(a2 + 96) = v14;
  *(_OWORD *)(a2 + 104) = v21;
  v15 = v5;
  sub_24A25EFF8(v7, v8, v9);
  swift_bridgeObjectRetain();

  sub_24A25F008(v7, v8, v9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A25EEB0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  id v14;

  if ((objc_msgSend(a1, sel_isWhiteSpace) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = a1;
    v4 = a1;
  }
  v6 = objc_msgSend(a1, sel_displayedText);
  v7 = objc_msgSend(v6, sel_string);

  sub_24A266814();
  sub_24A25F018();
  v8 = sub_24A266724();
  v10 = v9;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = 0;
  v12 = v11 & 1;
  *(_QWORD *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 24) = v9;
  *(_BYTE *)(a2 + 32) = v11 & 1;
  *(_QWORD *)(a2 + 40) = v13;
  v14 = v4;
  sub_24A25EFF8(v8, v10, v12);
  swift_bridgeObjectRetain();
  sub_24A25F008(v8, v10, v12);

  return swift_bridgeObjectRelease();
}

uint64_t sub_24A25EFD8()
{
  return sub_24A266748();
}

double sub_24A25EFF0@<D0>(uint64_t a1@<X8>)
{
  void **v1;
  double result;

  *(_QWORD *)&result = sub_24A25EC90(*v1, a1).n128_u64[0];
  return result;
}

uint64_t sub_24A25EFF8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_24A25F008(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_24A25F018()
{
  unint64_t result;

  result = qword_25791E730;
  if (!qword_25791E730)
  {
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25791E730);
  }
  return result;
}

unint64_t sub_24A25F060()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25791E738;
  if (!qword_25791E738)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E740);
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDEBE40], v1);
    atomic_store(result, (unint64_t *)&qword_25791E738);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD0B8BC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t destroy for VCUIBadgedTextOverlayView()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for VCUIBadgedTextOverlayView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for VCUIBadgedTextOverlayView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for VCUIBadgedTextOverlayView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_release();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for VCUIBadgedTextOverlayView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VCUIBadgedTextOverlayView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for VCUIBadgedTextOverlayView()
{
  return &type metadata for VCUIBadgedTextOverlayView;
}

uint64_t sub_24A25F310()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A25F320@<X0>(uint64_t a1@<X8>)
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
  char *v17;
  CGPoint v18;
  CGFloat v19;
  CGFloat x;
  CGFloat MinX;
  CGFloat MaxY;
  uint64_t v23;
  uint64_t v24;
  char x_low;
  char v26;
  CGPoint v27;
  void (*v28)(char *, uint64_t);
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *OpaqueTypeConformance2;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t *v68;
  char *v69;
  uint64_t v70;
  char *v71;
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
  char *v82;
  uint64_t v83;
  unsigned __int8 v84;
  CGPoint v85;
  CGFloat v86;
  CGPoint v87;
  uint64_t v88;
  char v89;
  char v90;
  CGRect v91;
  CGRect v92;

  v2 = v1;
  v79 = a1;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E748);
  MEMORY[0x24BDAC7A8](v80);
  v65 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E750);
  MEMORY[0x24BDAC7A8](v76);
  v78 = (uint64_t)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_24A2666C4();
  v72 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v68 = (uint64_t *)((char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E758);
  v67 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v71 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E760);
  v70 = *(_QWORD *)(v77 - 8);
  v7 = MEMORY[0x24BDAC7A8](v77);
  v66 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v69 = (char *)&v62 - v9;
  v10 = sub_24A2666B8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E768);
  v74 = *(_QWORD *)(v81 - 8);
  v14 = *(_QWORD *)(v74 + 64);
  v15 = MEMORY[0x24BDAC7A8](v81);
  OpaqueTypeConformance2 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v62 - v16;
  v63 = *(_QWORD *)(v1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24A2664FC();
  swift_release();
  swift_release();
  swift_release();
  v18 = v85;
  v19 = v86;
  x = v87.x;
  v91.origin = v85;
  v91.size.width = v86;
  v91.size.height = v87.x;
  MinX = CGRectGetMinX(v91);
  v92.origin = v18;
  v92.size.width = v19;
  v92.size.height = x;
  MaxY = CGRectGetMaxY(v92);
  v23 = sub_24A2665EC();
  sub_24A25FB48(v2, (uint64_t)&v85);
  v24 = *(_QWORD *)&v86;
  x_low = LOBYTE(v87.x);
  v26 = BYTE1(v87.x);
  v27 = v85;
  v85 = (CGPoint)(unint64_t)v23;
  LOBYTE(v86) = 1;
  v87 = v27;
  v88 = v24;
  v89 = x_low;
  v90 = v26;
  sub_24A2666AC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E770);
  sub_24A260028(&qword_25791E778, &qword_25791E770);
  v82 = v17;
  sub_24A266754();
  v28 = *(void (**)(char *, uint64_t))(v11 + 8);
  v28(v13, v10);
  sub_24A25FF50(*(uint64_t *)&v87.x, *(uint64_t *)&v87.y, v88, v89, v90);
  if ((*(_BYTE *)(v2 + 48) & 1) != 0)
  {
    v85 = (CGPoint)(unint64_t)sub_24A2665EC();
    LOBYTE(v86) = 1;
    v87.x = MinX;
    v87.y = MaxY;
    sub_24A2666AC();
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E780);
    v45 = sub_24A25FFAC();
    sub_24A266754();
    v28(v13, v10);
    type metadata accessor for VCUIBadgedTextOverlayModel();
    sub_24A260154();
    sub_24A2665B0();
    swift_getKeyPath();
    sub_24A2665BC();
    swift_release();
    swift_release();
    v63 = v83;
    LODWORD(v65) = v84;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_24A2664FC();
    swift_release();
    swift_release();
    swift_release();
    v46 = sub_24A266790();
    v47 = v68;
    *v68 = v46;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v72 + 104))(v47, *MEMORY[0x24BDF02C0], v73);
    v30 = v74;
    v48 = OpaqueTypeConformance2;
    v49 = v81;
    (*(void (**)(char *, char *, uint64_t))(v74 + 16))(OpaqueTypeConformance2, v82, v81);
    v50 = (*(unsigned __int8 *)(v30 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    v51 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v51 + v50, v48, v49);
    *(_QWORD *)&v85.x = v44;
    *(_QWORD *)&v85.y = v45;
    OpaqueTypeConformance2 = (char *)swift_getOpaqueTypeConformance2();
    v61 = sub_24A260068();
    v52 = v80;
    v53 = v66;
    v54 = v75;
    v55 = v71;
    sub_24A266760();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t *, uint64_t))(v72 + 8))(v47, v73);
    (*(void (**)(char *, uint64_t))(v67 + 8))(v55, v54);
    v56 = v70;
    v57 = v69;
    v58 = v53;
    v59 = v77;
    (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v69, v58, v77);
    (*(void (**)(uint64_t, char *, uint64_t))(v56 + 16))(v78, v57, v59);
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)&v85.x = v54;
    *(_QWORD *)&v85.y = v52;
    v86 = *(double *)&OpaqueTypeConformance2;
    *(_QWORD *)&v87.x = v61;
    swift_getOpaqueTypeConformance2();
    v32 = v81;
    sub_24A2666A0();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v59);
  }
  else
  {
    v29 = sub_24A2666F4();
    v30 = v74;
    v31 = (uint64_t)v65;
    v32 = v81;
    (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v65, v82, v81);
    v33 = v80;
    v34 = v31 + *(int *)(v80 + 36);
    *(_BYTE *)v34 = v29;
    __asm { FMOV            V0.2D, #5.0 }
    *(_OWORD *)(v34 + 8) = _Q0;
    *(_OWORD *)(v34 + 24) = _Q0;
    *(_BYTE *)(v34 + 40) = 0;
    sub_24A25FF64(v31, v78);
    swift_storeEnumTagMultiPayload();
    v40 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E780);
    v41 = sub_24A25FFAC();
    *(_QWORD *)&v85.x = v40;
    *(_QWORD *)&v85.y = v41;
    v42 = swift_getOpaqueTypeConformance2();
    v43 = sub_24A260068();
    *(_QWORD *)&v85.x = v75;
    *(_QWORD *)&v85.y = v33;
    v86 = *(double *)&v42;
    *(_QWORD *)&v87.x = v43;
    swift_getOpaqueTypeConformance2();
    sub_24A2666A0();
    sub_24A260114(v31);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v82, v32);
}

uint64_t sub_24A25FB48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  __int128 v4;
  uint64_t v5;
  char v6;
  char v7;
  __int128 v8;

  v8 = *(_OWORD *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24A2664FC();
  swift_release();
  swift_release();
  sub_24A260250((uint64_t)&v8);
  if ((_QWORD)v4 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_24A2664FC();
    swift_release();
    swift_release();
    sub_24A260250((uint64_t)&v8);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_24A2664FC();
    swift_release();
    swift_release();
    sub_24A260250((uint64_t)&v8);
    sub_24A260B48(3, 1, 0, 1, *((uint64_t *)&v4 + 1));
    swift_bridgeObjectRelease();
LABEL_5:
    sub_24A260288();
    sub_24A2602CC();
    sub_24A2666A0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791E7C0);
    sub_24A260310();
    result = sub_24A2666A0();
    *(_OWORD *)a2 = v4;
    *(_QWORD *)(a2 + 16) = v5;
    *(_BYTE *)(a2 + 24) = v6;
    *(_BYTE *)(a2 + 25) = v7;
    return result;
  }
  if (!(_QWORD)v4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_24A2664FC();
    swift_release();
    swift_release();
    sub_24A260250((uint64_t)&v8);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_24A2664FC();
    swift_release();
    swift_release();
    sub_24A260250((uint64_t)&v8);
    sub_24A260B48(2, 0, 1, 0, *((uint64_t *)&v4 + 1));
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  result = sub_24A2668F8();
  __break(1u);
  return result;
}

__n128 sub_24A25FE8C@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  __n128 result;

  v4 = sub_24A2666F4();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  v6 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25791E748) + 36);
  *(_BYTE *)v6 = v4;
  __asm { FMOV            V0.2D, #5.0 }
  *(__n128 *)(v6 + 8) = result;
  *(__n128 *)(v6 + 24) = result;
  *(_BYTE *)(v6 + 40) = 0;
  return result;
}

uint64_t sub_24A25FF08@<X0>(uint64_t a1@<X8>)
{
  return sub_24A25F320(a1);
}

uint64_t sub_24A25FF50(uint64_t result, uint64_t a2, uint64_t a3, char a4, char a5)
{
  if ((a5 & 1) == 0)
    return j__swift_bridgeObjectRelease(result, a2, a3, a4 & 1);
  return result;
}

uint64_t sub_24A25FF64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E748);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24A25FFAC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25791E788;
  if (!qword_25791E788)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E780);
    v2[0] = sub_24A260028(&qword_25791E790, &qword_25791E798);
    v2[1] = MEMORY[0x24BDEC438];
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25791E788);
  }
  return result;
}

uint64_t sub_24A260028(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDF4498], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24A260068()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_25791E7A0;
  if (!qword_25791E7A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E748);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E770);
    v2[3] = sub_24A260028(&qword_25791E778, &qword_25791E770);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25791E7A0);
  }
  return result;
}

uint64_t sub_24A260114(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E748);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24A260154()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25791E7A8;
  if (!qword_25791E7A8)
  {
    v1 = type metadata accessor for VCUIBadgedTextOverlayModel();
    result = MEMORY[0x24BD0B8C8](&protocol conformance descriptor for VCUIBadgedTextOverlayModel, v1);
    atomic_store(result, (unint64_t *)&qword_25791E7A8);
  }
  return result;
}

uint64_t sub_24A2601A4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E768);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

double sub_24A260208@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  double result;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25791E768) - 8) + 80);
  *(_QWORD *)&result = sub_24A25FE8C(v1 + ((v3 + 16) & (unint64_t)~v3), a1).n128_u64[0];
  return result;
}

uint64_t sub_24A260250(uint64_t a1)
{
  swift_release();
  return a1;
}

unint64_t sub_24A260288()
{
  unint64_t result;

  result = qword_25791E7B0;
  if (!qword_25791E7B0)
  {
    result = MEMORY[0x24BD0B8C8](&unk_24A2673B8, &type metadata for VCUIVerticalBadgedText);
    atomic_store(result, (unint64_t *)&qword_25791E7B0);
  }
  return result;
}

unint64_t sub_24A2602CC()
{
  unint64_t result;

  result = qword_25791E7B8;
  if (!qword_25791E7B8)
  {
    result = MEMORY[0x24BD0B8C8](&unk_24A26745C, &type metadata for VCUIHorizontalBadgedText);
    atomic_store(result, (unint64_t *)&qword_25791E7B8);
  }
  return result;
}

unint64_t sub_24A260310()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25791E7C8;
  if (!qword_25791E7C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E7C0);
    v2[0] = sub_24A260288();
    v2[1] = sub_24A2602CC();
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25791E7C8);
  }
  return result;
}

unint64_t sub_24A260380()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[5];
  unint64_t v5;

  result = qword_25791E7D0;
  if (!qword_25791E7D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E7D8);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E758);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E748);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E780);
    sub_24A25FFAC();
    v4[2] = v2;
    v4[3] = v3;
    v4[4] = swift_getOpaqueTypeConformance2();
    v5 = sub_24A260068();
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = v5;
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDEF3E0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_25791E7D0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for VCUIVerticalBadgedText(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for VCUIVerticalBadgedText()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for VCUIVerticalBadgedText(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
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

uint64_t assignWithTake for VCUIVerticalBadgedText(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for VCUIVerticalBadgedText(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for VCUIVerticalBadgedText(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for VCUIVerticalBadgedText()
{
  return &type metadata for VCUIVerticalBadgedText;
}

uint64_t sub_24A2605DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A2605EC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E828);
  sub_24A26676C();
  *(_OWORD *)a2 = xmmword_24A267380;
  *(double *)(a2 + 16) = a3;
  *(double *)(a2 + 24) = a4;
  *(_QWORD *)(a2 + 32) = v11;
  *(_BYTE *)(a2 + 40) = v12;
  *(_QWORD *)(a2 + 48) = v13;
  if (!(a1 >> 62))
  {
    swift_retain();
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791E7E0);
    swift_getKeyPath();
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = a1;
    *(double *)(v8 + 24) = a3;
    *(double *)(v8 + 32) = a4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791E830);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791E818);
    sub_24A260A28();
    sub_24A26092C();
    sub_24A2667D8();
    return swift_release();
  }
  swift_retain();
  swift_bridgeObjectRetain();
  v10 = sub_24A266904();
  result = swift_bridgeObjectRelease();
  if ((v10 & 0x8000000000000000) == 0)
    goto LABEL_3;
  __break(1u);
  return result;
}

uint64_t sub_24A260794@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = *a1;
  if (result > 49)
  {
    result = 0;
    goto LABEL_7;
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
    result = MEMORY[0x24BD0B5B0]();
    goto LABEL_7;
  }
  if (result < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)result < *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    result = (uint64_t)*(id *)(a2 + 8 * result + 32);
LABEL_7:
    *a3 = result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A260800()
{
  sub_24A2666E8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E7E0);
  sub_24A260888();
  return sub_24A266544();
}

uint64_t sub_24A26087C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24A2605EC(*(_QWORD *)(v1 + 16), a1, *(double *)(v1 + 24), *(double *)(v1 + 32));
}

unint64_t sub_24A260888()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25791E7E8;
  if (!qword_25791E7E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E7E0);
    v2[0] = sub_24A260B04(&qword_25791E7F0, &qword_25791E7F8, MEMORY[0x24BDEB9A8]);
    v2[1] = sub_24A260950(&qword_25791E800, &qword_25791E808, sub_24A26092C, MEMORY[0x24BDF4A08]);
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDEC550], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25791E7E8);
  }
  return result;
}

uint64_t sub_24A26092C()
{
  return sub_24A260950(&qword_25791E810, &qword_25791E818, (uint64_t (*)(void))sub_24A2609B4, MEMORY[0x24BDF5578]);
}

uint64_t sub_24A260950(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x24BD0B8C8](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24A2609B4()
{
  unint64_t result;

  result = qword_25791E820;
  if (!qword_25791E820)
  {
    result = MEMORY[0x24BD0B8C8](&unk_24A267514, &type metadata for VCUIBadgedVerticalTextSegmentView);
    atomic_store(result, (unint64_t *)&qword_25791E820);
  }
  return result;
}

uint64_t sub_24A2609F8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24A260A1C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_24A260794(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_24A260A28()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_25791E838;
  if (!qword_25791E838)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E830);
    v2 = sub_24A260A94();
    v3[0] = MEMORY[0x24BEE17A8];
    v3[1] = v2;
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BEE1BD0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25791E838);
  }
  return result;
}

unint64_t sub_24A260A94()
{
  unint64_t result;

  result = qword_25791E840;
  if (!qword_25791E840)
  {
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_25791E840);
  }
  return result;
}

uint64_t sub_24A260AD8()
{
  return sub_24A260B04(&qword_25791E848, &qword_25791E850, MEMORY[0x24BDEB238]);
}

uint64_t sub_24A260B04(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BD0B8C8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A260B48(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = MEMORY[0x24BEE4AF8];
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = 15;
  v12 = swift_allocObject();
  *(_BYTE *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = v11;
  *(_QWORD *)(v12 + 32) = a4;
  *(_QWORD *)(v12 + 40) = a5;
  *(_QWORD *)(v12 + 48) = v10;
  *(_QWORD *)(v12 + 56) = v9;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E858);
  sub_24A25F018();
  sub_24A260B04((unint64_t *)&qword_25791E860, &qword_25791E858, MEMORY[0x24BEE1BC0]);
  sub_24A2668C8();
  swift_release();
  swift_beginAccess();
  v13 = *(_QWORD *)(v9 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  swift_release();
  return v13;
}

uint64_t sub_24A260D24()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24A260D48()
{
  return swift_deallocObject();
}

void sub_24A260D58(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  char *v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  char *v44;
  char *v45;
  unint64_t v46;
  char *v47;
  void **v48;
  void *v49;
  char *v50;
  void **v51;
  void *v52;
  _QWORD *v53;
  char *v54;
  unint64_t v55;
  id v56;
  void *v57;
  char *v58;
  uint64_t v59;
  id v60;
  void *v61;
  id v62;
  char *v63;
  char *v64;
  unint64_t v65;
  char *v66;
  void **v67;
  void *v68;
  char *v69;
  void **v70;
  void *v71;
  uint64_t v72;
  unint64_t *v73;
  _QWORD *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t *v78;
  id v79;
  unint64_t *v80;
  _QWORD *v81;
  char *v82;
  unint64_t v83;
  char *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;

  v85 = a4;
  v17 = sub_24A2664D8();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25791E868);
  v86 = *(_QWORD *)(v20 - 8);
  v87 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v75 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_24A2664B4();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v75 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if ((a8 & 1) != 0)
      goto LABEL_6;
    v92 = a1;
    v93 = a2;
    sub_24A26649C();
    sub_24A25F018();
    v27 = sub_24A2668BC();
    v29 = v28;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    swift_bridgeObjectRelease();
    v30 = HIBYTE(v29) & 0xF;
    if ((v29 & 0x2000000000000000) == 0)
      v30 = v27 & 0xFFFFFFFFFFFFLL;
    if (v30)
    {
LABEL_6:
      v82 = v22;
      v84 = v19;
      v31 = (unint64_t *)(a9 + 16);
      v32 = a3;
      v33 = (uint64_t *)(a12 + 16);
      v81 = (_QWORD *)(a13 + 16);
      swift_beginAccess();
      v34 = *(_QWORD *)(a9 + 16);
      v83 = v32;
      v80 = (unint64_t *)(a9 + 16);
      if ((v34 ^ v32) >= 0x4000)
      {
        v77 = a10;
        v90 = a10;
        v91 = a11;
        v79 = a11;
        v35 = v34;
        sub_24A2664A8();
        sub_24A25F018();
        v36 = sub_24A2668B0();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
        v90 = v36;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25791E870);
        sub_24A260B04((unint64_t *)&unk_25791E878, (uint64_t *)&unk_25791E870, MEMORY[0x24BEE12B0]);
        sub_24A2667FC();
        swift_bridgeObjectRelease();
        v37 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        v38 = (void *)sub_24A266808();
        swift_bridgeObjectRelease();
        v76 = objc_msgSend(v37, (SEL)&selRef_initWithNibName_bundle_, v38);

        swift_beginAccess();
        v78 = (uint64_t *)(a12 + 16);
        v89 = *v33;
        sub_24A2664CC();
        sub_24A2615B0();
        v39 = v82;
        sub_24A2664C0();
        sub_24A260B04((unint64_t *)&unk_25791E888, (uint64_t *)&unk_25791E868, MEMORY[0x24BDCC928]);
        v40 = v87;
        sub_24A2668D4();
        (*(void (**)(char *, uint64_t))(v86 + 8))(v39, v40);
        v41 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        v42 = (void *)sub_24A266808();
        swift_bridgeObjectRelease();
        v43 = objc_msgSend(v41, (SEL)&selRef_initWithNibName_bundle_, v42);

        v44 = (char *)objc_msgSend(objc_allocWithZone((Class)VCUIBadgedTextSegmentModel), sel_init);
        v45 = &v44[OBJC_IVAR___VCUIBadgedTextSegmentModel_range];
        swift_beginAccess();
        v46 = v83;
        *(_QWORD *)v45 = v35;
        *((_QWORD *)v45 + 1) = v46;
        v47 = &v44[OBJC_IVAR___VCUIBadgedTextSegmentModel_displayedRange];
        swift_beginAccess();
        *(_QWORD *)v47 = v35;
        *((_QWORD *)v47 + 1) = v46;
        v48 = (void **)&v44[OBJC_IVAR___VCUIBadgedTextSegmentModel_text];
        swift_beginAccess();
        v49 = *v48;
        *v48 = v76;
        v50 = v44;

        v51 = (void **)&v50[OBJC_IVAR___VCUIBadgedTextSegmentModel_label];
        swift_beginAccess();
        v52 = *v51;
        *v51 = v43;

        objc_msgSend(v50, sel_setIsWhiteSpace_, 1);
        v53 = v81;
        swift_beginAccess();
        v54 = v50;
        MEMORY[0x24BD0B4F0]();
        if (*(_QWORD *)((*v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_24A266850();
        sub_24A26685C();
        sub_24A266844();
        swift_endAccess();

        v31 = v80;
        v33 = v78;
      }
      swift_beginAccess();
      v55 = v83;
      *v31 = v83;
      v56 = objc_allocWithZone(MEMORY[0x24BDD1458]);
      swift_bridgeObjectRetain();
      v57 = (void *)sub_24A266808();
      swift_bridgeObjectRelease();
      v79 = objc_msgSend(v56, sel_initWithString_, v57);

      swift_beginAccess();
      v88 = *v33;
      sub_24A2664CC();
      sub_24A2615B0();
      v58 = v82;
      sub_24A2664C0();
      sub_24A260B04((unint64_t *)&unk_25791E888, (uint64_t *)&unk_25791E868, MEMORY[0x24BDCC928]);
      v59 = v87;
      sub_24A2668D4();
      (*(void (**)(char *, uint64_t))(v86 + 8))(v58, v59);
      v60 = objc_allocWithZone(MEMORY[0x24BDD1458]);
      v61 = (void *)sub_24A266808();
      swift_bridgeObjectRelease();
      v62 = objc_msgSend(v60, (SEL)&selRef_initWithNibName_bundle_, v61);

      v63 = (char *)objc_msgSend(objc_allocWithZone((Class)VCUIBadgedTextSegmentModel), sel_init);
      v64 = &v63[OBJC_IVAR___VCUIBadgedTextSegmentModel_range];
      swift_beginAccess();
      v65 = v85;
      *(_QWORD *)v64 = v55;
      *((_QWORD *)v64 + 1) = v65;
      v66 = &v63[OBJC_IVAR___VCUIBadgedTextSegmentModel_displayedRange];
      swift_beginAccess();
      *(_QWORD *)v66 = v55;
      *((_QWORD *)v66 + 1) = v65;
      v67 = (void **)&v63[OBJC_IVAR___VCUIBadgedTextSegmentModel_text];
      swift_beginAccess();
      v68 = *v67;
      *v67 = v79;
      v69 = v63;

      v70 = (void **)&v69[OBJC_IVAR___VCUIBadgedTextSegmentModel_label];
      swift_beginAccess();
      v71 = *v70;
      *v70 = v62;

      swift_beginAccess();
      v72 = *v33 + 1;
      if (__OFADD__(*v33, 1))
      {
        __break(1u);
      }
      else
      {
        swift_beginAccess();
        *v33 = v72;
        v73 = v80;
        swift_beginAccess();
        *v73 = v65;
        v74 = v81;
        swift_beginAccess();
        v69 = v69;
        MEMORY[0x24BD0B4F0]();
        if (*(_QWORD *)((*v74 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((*v74 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        {
LABEL_12:
          sub_24A26685C();
          sub_24A266844();
          swift_endAccess();

          return;
        }
      }
      sub_24A266850();
      goto LABEL_12;
    }
  }
}

uint64_t sub_24A261540()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_24A26157C(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  sub_24A260D58(a1, a2, a3, a4, a5, a6, a7, *(_BYTE *)(v7 + 16), *(_QWORD *)(v7 + 24), *(_QWORD *)(v7 + 32), *(void **)(v7 + 40), *(_QWORD *)(v7 + 48), *(_QWORD *)(v7 + 56));
}

unint64_t sub_24A2615B0()
{
  unint64_t result;

  result = qword_25791E880;
  if (!qword_25791E880)
  {
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_25791E880);
  }
  return result;
}

uint64_t VCUIBadgedTextSegmentModel.range.getter()
{
  return sub_24A26165C(&OBJC_IVAR___VCUIBadgedTextSegmentModel_range);
}

uint64_t VCUIBadgedTextSegmentModel.range.setter(uint64_t a1, uint64_t a2)
{
  return sub_24A2616A8(a1, a2, &OBJC_IVAR___VCUIBadgedTextSegmentModel_range);
}

uint64_t (*VCUIBadgedTextSegmentModel.range.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t VCUIBadgedTextSegmentModel.displayedRange.getter()
{
  return sub_24A26165C(&OBJC_IVAR___VCUIBadgedTextSegmentModel_displayedRange);
}

uint64_t sub_24A26165C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return *(_QWORD *)v2;
}

uint64_t VCUIBadgedTextSegmentModel.displayedRange.setter(uint64_t a1, uint64_t a2)
{
  return sub_24A2616A8(a1, a2, &OBJC_IVAR___VCUIBadgedTextSegmentModel_displayedRange);
}

uint64_t sub_24A2616A8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t result;

  v6 = (_QWORD *)(v3 + *a3);
  result = swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*VCUIBadgedTextSegmentModel.displayedRange.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id VCUIBadgedTextSegmentModel.text.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___VCUIBadgedTextSegmentModel_text);
  swift_beginAccess();
  return *v1;
}

void VCUIBadgedTextSegmentModel.text.setter(void *a1)
{
  sub_24A2618E0(a1, &OBJC_IVAR___VCUIBadgedTextSegmentModel_text);
}

id VCUIBadgedTextSegmentModel.label.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___VCUIBadgedTextSegmentModel_label);
  swift_beginAccess();
  return *v1;
}

void sub_24A26187C(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void **v5;
  void *v6;
  id v7;

  v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;

}

void VCUIBadgedTextSegmentModel.label.setter(void *a1)
{
  sub_24A2618E0(a1, &OBJC_IVAR___VCUIBadgedTextSegmentModel_label);
}

void sub_24A2618E0(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

uint64_t VCUIBadgedTextSegmentModel.isWhiteSpace.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___VCUIBadgedTextSegmentModel_isWhiteSpace);
  swift_beginAccess();
  return *v1;
}

uint64_t VCUIBadgedTextSegmentModel.isWhiteSpace.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___VCUIBadgedTextSegmentModel_isWhiteSpace);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t VCUIBadgedTextSegmentModel.nsRange.getter()
{
  void *v0;
  id v1;
  id v2;

  swift_beginAccess();
  v1 = objc_msgSend(v0, sel_text);
  v2 = objc_msgSend(v1, sel_string);

  sub_24A266814();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E858);
  sub_24A261C18();
  sub_24A25F018();
  return sub_24A2668A4();
}

unint64_t sub_24A261C18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25791E860;
  if (!qword_25791E860)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E858);
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BEE1BC0], v1);
    atomic_store(result, (unint64_t *)&qword_25791E860);
  }
  return result;
}

id VCUIBadgedTextSegmentModel.representedText.getter()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  id v4;

  v1 = objc_msgSend(v0, sel_text);
  v2 = objc_msgSend(v0, sel_nsRange);
  v4 = objc_msgSend(v1, sel_attributedSubstringFromRange_, v2, v3);

  return v4;
}

id VCUIBadgedTextSegmentModel.displayedText.getter()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v1 = objc_msgSend(v0, sel_text);
  swift_beginAccess();
  v2 = objc_msgSend(v0, sel_text);
  v3 = objc_msgSend(v2, sel_string);

  v4 = sub_24A266814();
  v6 = v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E858);
  sub_24A261C18();
  sub_24A25F018();
  v7 = sub_24A2668A4();
  v9 = objc_msgSend(v1, sel_attributedSubstringFromRange_, v7, v8, v4, v6);

  return v9;
}

char *keypath_get_selector_text()
{
  return sel_text;
}

id sub_24A261EB0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_text);
  *a2 = result;
  return result;
}

id sub_24A261EE8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setText_, *a1);
}

char *keypath_get_selector_label()
{
  return sel_label;
}

id sub_24A261F08@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_label);
  *a2 = result;
  return result;
}

id sub_24A261F40(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLabel_, *a1);
}

char *keypath_get_selector_isWhiteSpace()
{
  return sel_isWhiteSpace;
}

id sub_24A261F60@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isWhiteSpace);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24A261F90(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsWhiteSpace_, *a1);
}

unint64_t type metadata accessor for VCUIBadgedTextSegmentModel()
{
  unint64_t result;

  result = qword_25791E8E0;
  if (!qword_25791E8E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25791E8E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for VCUIHorizontalBadgedText()
{
  return &type metadata for VCUIHorizontalBadgedText;
}

uint64_t sub_24A26202C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A26203C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E828);
  sub_24A26676C();
  *(_OWORD *)a2 = xmmword_24A267380;
  *(double *)(a2 + 16) = a3;
  *(double *)(a2 + 24) = a4;
  *(_QWORD *)(a2 + 32) = v11;
  *(_BYTE *)(a2 + 40) = v12;
  *(_QWORD *)(a2 + 48) = v13;
  if (!(a1 >> 62))
  {
    swift_retain();
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791E8E8);
    swift_getKeyPath();
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = a1;
    *(double *)(v8 + 24) = a3;
    *(double *)(v8 + 32) = a4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791E830);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791E910);
    sub_24A260A28();
    sub_24A262310();
    sub_24A2667D8();
    return swift_release();
  }
  swift_retain();
  swift_bridgeObjectRetain();
  v10 = sub_24A266904();
  result = swift_bridgeObjectRelease();
  if ((v10 & 0x8000000000000000) == 0)
    goto LABEL_3;
  __break(1u);
  return result;
}

uint64_t sub_24A2621E4()
{
  sub_24A2666E8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E8E8);
  sub_24A26226C();
  return sub_24A266544();
}

uint64_t sub_24A262260@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24A26203C(*(_QWORD *)(v1 + 16), a1, *(double *)(v1 + 24), *(double *)(v1 + 32));
}

unint64_t sub_24A26226C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25791E8F0;
  if (!qword_25791E8F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E8E8);
    v2[0] = sub_24A260B04(&qword_25791E7F0, &qword_25791E7F8, MEMORY[0x24BDEB9A8]);
    v2[1] = sub_24A260950(&qword_25791E8F8, &qword_25791E900, sub_24A262310, MEMORY[0x24BDF4A08]);
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDEC550], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25791E8F0);
  }
  return result;
}

uint64_t sub_24A262310()
{
  return sub_24A260950(&qword_25791E908, &qword_25791E910, (uint64_t (*)(void))sub_24A262334, MEMORY[0x24BDF5578]);
}

unint64_t sub_24A262334()
{
  unint64_t result;

  result = qword_25791E918;
  if (!qword_25791E918)
  {
    result = MEMORY[0x24BD0B8C8](&unk_24A267154, &type metadata for VCUIBadgedHorizontalTextSegmentView);
    atomic_store(result, (unint64_t *)&qword_25791E918);
  }
  return result;
}

uint64_t sub_24A262378()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24A26239C()
{
  return sub_24A260B04(&qword_25791E920, &qword_25791E928, MEMORY[0x24BDEB238]);
}

ValueMetadata *type metadata accessor for VCUIBadgedVerticalTextSegmentView()
{
  return &type metadata for VCUIBadgedVerticalTextSegmentView;
}

uint64_t sub_24A2623D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A2623E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  id v26;

  if ((objc_msgSend(a1, sel_isWhiteSpace) & 1) != 0)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v4 = a1;
    v11 = sub_24A266700();
    v12 = sub_24A266718();
    v13 = sub_24A26670C();
    sub_24A26670C();
    if (sub_24A26670C() != v11)
      v13 = sub_24A26670C();
    sub_24A26670C();
    if (sub_24A26670C() != v12)
      v13 = sub_24A26670C();
    sub_24A266538();
    v7 = v14;
    v8 = v15;
    v9 = v16;
    v10 = v17;
    v6 = v13;
    v5 = 1;
  }
  v18 = objc_msgSend(a1, sel_displayedText);
  v19 = objc_msgSend(v18, sel_string);

  sub_24A266814();
  sub_24A25F018();
  v20 = sub_24A266724();
  v22 = v21;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  v24 = v23 & 1;
  *(_QWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v7;
  *(_QWORD *)(a2 + 32) = v8;
  *(_QWORD *)(a2 + 40) = v9;
  *(_QWORD *)(a2 + 48) = v10;
  *(_BYTE *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = v20;
  *(_QWORD *)(a2 + 72) = v21;
  *(_BYTE *)(a2 + 80) = v23 & 1;
  *(_QWORD *)(a2 + 88) = v25;
  v26 = v4;
  sub_24A25EFF8(v20, v22, v24);
  swift_bridgeObjectRetain();
  sub_24A25F008(v20, v22, v24);

  return swift_bridgeObjectRelease();
}

__n128 sub_24A2625CC@<Q0>(uint64_t a1@<X8>)
{
  void **v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  __n128 result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  uint64_t v14;
  char v15;
  __int128 v16;
  char v17;
  uint64_t v18;

  v3 = *v1;
  v4 = sub_24A2665F8();
  sub_24A2623E8(v3, (uint64_t)v13);
  v5 = v14;
  v6 = v15;
  v7 = v17;
  v8 = v18;
  result = (__n128)v13[0];
  v10 = v13[1];
  v11 = v13[2];
  v12 = v16;
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_OWORD *)(a1 + 40) = v10;
  *(_OWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 72) = v5;
  *(_BYTE *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 88) = v12;
  *(_BYTE *)(a1 + 104) = v7;
  *(_QWORD *)(a1 + 112) = v8;
  return result;
}

unint64_t sub_24A26265C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25791E930;
  if (!qword_25791E930)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E938);
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_25791E930);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for VCUILabeledBadgeView(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = v3;
  return a1;
}

void destroy for VCUILabeledBadgeView(id *a1)
{

}

uint64_t assignWithCopy for VCUILabeledBadgeView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
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

uint64_t assignWithTake for VCUILabeledBadgeView(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for VCUILabeledBadgeView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 9))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VCUILabeledBadgeView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 9) = 1;
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
    *(_BYTE *)(result + 9) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for VCUILabeledBadgeView()
{
  return &type metadata for VCUILabeledBadgeView;
}

uint64_t sub_24A262814()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_24A262824@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  id v4;
  double result;
  __int128 v6;
  uint64_t v7;
  char v8;

  v3 = objc_msgSend(a1, sel_label);
  v4 = objc_msgSend(v3, sel_string);

  sub_24A266814();
  sub_24A26676C();
  sub_24A26295C();
  sub_24A2629A0();
  sub_24A2666A0();
  result = *(double *)&v6;
  *(_OWORD *)a2 = v6;
  *(_QWORD *)(a2 + 16) = v7;
  *(_BYTE *)(a2 + 24) = v8;
  return result;
}

double sub_24A262950@<D0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_24A262824(*v1, a1);
}

unint64_t sub_24A26295C()
{
  unint64_t result;

  result = qword_25791E940;
  if (!qword_25791E940)
  {
    result = MEMORY[0x24BD0B8C8](&unk_24A2677D0, &type metadata for VCUIVerticalLabeledBadgeView_CommandAndControl);
    atomic_store(result, (unint64_t *)&qword_25791E940);
  }
  return result;
}

unint64_t sub_24A2629A0()
{
  unint64_t result;

  result = qword_25791E948;
  if (!qword_25791E948)
  {
    result = MEMORY[0x24BD0B8C8](&unk_24A267780, &type metadata for VCUIHorizontalLabeledBadgeView_CommandAndControl);
    atomic_store(result, (unint64_t *)&qword_25791E948);
  }
  return result;
}

ValueMetadata *type metadata accessor for VCUIHorizontalLabeledBadgeView_CommandAndControl()
{
  return &type metadata for VCUIHorizontalLabeledBadgeView_CommandAndControl;
}

uint64_t _s14VoiceControlUI48VCUIHorizontalLabeledBadgeView_CommandAndControlVwxx_0()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *_s14VoiceControlUI48VCUIHorizontalLabeledBadgeView_CommandAndControlVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *_s14VoiceControlUI48VCUIHorizontalLabeledBadgeView_CommandAndControlVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s14VoiceControlUI48VCUIHorizontalLabeledBadgeView_CommandAndControlVwta_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t _s14VoiceControlUI48VCUIHorizontalLabeledBadgeView_CommandAndControlVwet_0(uint64_t a1, int a2)
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

uint64_t sub_24A262B60(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for VCUIVerticalLabeledBadgeView_CommandAndControl()
{
  return &type metadata for VCUIVerticalLabeledBadgeView_CommandAndControl;
}

unint64_t sub_24A262BB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_25791E950;
  if (!qword_25791E950)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25791E958);
    v2[0] = sub_24A26295C();
    v2[1] = sub_24A2629A0();
    result = MEMORY[0x24BD0B8C8](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25791E950);
  }
  return result;
}

id sub_24A262C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24A262D70(a1, a2, a3, a4, (SEL *)&selRef_downBadgeViewForText);
}

id sub_24A262C30(uint64_t a1)
{
  uint64_t *v1;

  return sub_24A262D70(a1, *v1, v1[1], v1[2], (SEL *)&selRef_downBadgeViewForText);
}

uint64_t sub_24A262C64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_24A263014(a1, a2, a3, a4, a5, a6, a7, a8, (SEL *)&selRef_downBadgeSizeForDigits);
}

uint64_t sub_24A262CA0()
{
  sub_24A26310C();
  return sub_24A266688();
}

uint64_t sub_24A262CF0()
{
  sub_24A26310C();
  return sub_24A266634();
}

void sub_24A262D40()
{
  sub_24A26310C();
  sub_24A26667C();
  __break(1u);
}

id sub_24A262D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24A262D70(a1, a2, a3, a4, (SEL *)&selRef_rightBadgeViewForText);
}

id sub_24A262D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  id v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;

  v8 = objc_msgSend((id)objc_opt_self(), *a5);
  if (v8)
  {
    v9 = (uint64_t (**)(_QWORD, _QWORD))v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791E970);
    sub_24A266778();
    v10 = (void *)sub_24A266808();
    v11 = (id)((uint64_t (**)(_QWORD, void *))v9)[2](v9, v10);

    sub_24A2668E0();
    swift_unknownObjectRelease();
    _Block_release(v9);
    swift_bridgeObjectRelease();
    sub_24A263268();
    swift_dynamicCast();
    return (id)v20;
  }
  else
  {
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, 20.0, 20.0);
    v13 = (void *)objc_opt_self();
    v14 = objc_msgSend(v13, sel_blackColor);
    objc_msgSend(v12, sel_setBackgroundColor_, v14);

    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_initWithFrame_, 0.0, 0.0, 20.0, 20.0);
    v19 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791E970);
    sub_24A266778();
    v16 = (void *)sub_24A266808();
    swift_bridgeObjectRelease();
    objc_msgSend(v15, sel_setText_, v16, a2, v19, a4);

    v17 = objc_msgSend(v13, sel_whiteColor);
    objc_msgSend(v15, sel_setTextColor_, v17);

    objc_msgSend(v15, sel_setTextAlignment_, 1);
    objc_msgSend(v12, sel_addSubview_, v15);

  }
  return v12;
}

id sub_24A262FC8(uint64_t a1)
{
  uint64_t *v1;

  return sub_24A262D70(a1, *v1, v1[1], v1[2], (SEL *)&selRef_rightBadgeViewForText);
}

uint64_t sub_24A262FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_24A263014(a1, a2, a3, a4, a5, a6, a7, a8, (SEL *)&selRef_rightBadgeSizeForDigits);
}

uint64_t sub_24A263014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, SEL *a9)
{
  uint64_t *v9;

  return sub_24A263194(a6, *v9, v9[1], v9[2], a9);
}

uint64_t sub_24A26303C()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_24A263048()
{
  sub_24A263150();
  return sub_24A266688();
}

uint64_t sub_24A263098()
{
  sub_24A263150();
  return sub_24A266634();
}

void sub_24A2630E8()
{
  sub_24A263150();
  sub_24A26667C();
  __break(1u);
}

unint64_t sub_24A26310C()
{
  unint64_t result;

  result = qword_25791E960;
  if (!qword_25791E960)
  {
    result = MEMORY[0x24BD0B8C8](&unk_24A267660, &type metadata for VCUIVerticalLabeledBadgeView_CommandAndControl);
    atomic_store(result, (unint64_t *)&qword_25791E960);
  }
  return result;
}

unint64_t sub_24A263150()
{
  unint64_t result;

  result = qword_25791E968;
  if (!qword_25791E968)
  {
    result = MEMORY[0x24BD0B8C8](&unk_24A2676F0, &type metadata for VCUIHorizontalLabeledBadgeView_CommandAndControl);
    atomic_store(result, (unint64_t *)&qword_25791E968);
  }
  return result;
}

uint64_t sub_24A263194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  id v5;
  double (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  double v8;

  v5 = objc_msgSend((id)objc_opt_self(), *a5);
  if (!v5)
    return 0x4034000000000000;
  v6 = (double (**)(_QWORD, _QWORD))v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E970);
  sub_24A266778();
  v7 = sub_24A266820();
  swift_bridgeObjectRelease();
  v8 = v6[2](v6, v7);
  _Block_release(v6);
  return *(_QWORD *)&v8;
}

unint64_t sub_24A263268()
{
  unint64_t result;

  result = qword_25791E978;
  if (!qword_25791E978)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25791E978);
  }
  return result;
}

uint64_t sub_24A2632AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A2664FC();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24A263328()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_24A266508();
}

uint64_t sub_24A263398()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A2664FC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24A263408()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A2664FC();
  swift_release();
  swift_release();
  return v1;
}

double sub_24A263478()
{
  double v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A2664FC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24A2634EC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A2664FC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24A26355C()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A2664FC();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24A2635CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, double a6, double a7, double a8, double a9)
{
  uint64_t v9;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  __int128 v49;
  __int128 v50;

  v48 = a5;
  v46 = a3;
  v47 = a4;
  *(_QWORD *)&v45 = a1;
  *((_QWORD *)&v45 + 1) = a2;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E9C8);
  v43 = *(_QWORD *)(v14 - 8);
  v44 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v42 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E9B8);
  v40 = *(_QWORD *)(v16 - 8);
  v41 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E9A8);
  v38 = *(_QWORD *)(v19 - 8);
  v39 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E998);
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v38 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E988);
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v38 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = v9 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__text;
  *(_QWORD *)&v49 = 0;
  *((_QWORD *)&v49 + 1) = 0xE000000000000000;
  sub_24A2664F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v30, v29, v26);
  v31 = v9 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__type;
  *(_QWORD *)&v49 = 1;
  type metadata accessor for VCUIOverlayTextOverlayType(0);
  sub_24A2664F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v31, v25, v22);
  v32 = v9 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__focusRect;
  v33 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v49 = *MEMORY[0x24BDBF090];
  v50 = v33;
  type metadata accessor for CGRect(0);
  sub_24A2664F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v32, v21, v39);
  v34 = v9 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__startIndex;
  *(_QWORD *)&v49 = 1;
  sub_24A2664F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v34, v18, v41);
  v35 = v9 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__popoverShowing;
  LOBYTE(v49) = 1;
  v36 = v42;
  sub_24A2664F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v35, v36, v44);
  swift_getKeyPath();
  swift_getKeyPath();
  v49 = v45;
  swift_retain();
  sub_24A266508();
  swift_getKeyPath();
  swift_getKeyPath();
  *(_QWORD *)&v49 = v46;
  swift_retain();
  sub_24A266508();
  swift_getKeyPath();
  swift_getKeyPath();
  *(double *)&v49 = a6;
  *((double *)&v49 + 1) = a7;
  *(double *)&v50 = a8;
  *((double *)&v50 + 1) = a9;
  swift_retain();
  sub_24A266508();
  swift_getKeyPath();
  swift_getKeyPath();
  *(_QWORD *)&v49 = v47;
  swift_retain();
  sub_24A266508();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v49) = v48;
  swift_retain();
  sub_24A266508();
  return v9;
}

uint64_t sub_24A2639FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  if (a1 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24A2664FC();
    swift_release();
    swift_release();
    v1 = v7;
    v2 = v8;
    v3 = 3;
    v4 = 0;
LABEL_5:
    v5 = sub_24A260B48(v3, 1, v4, v1, v2);
    swift_bridgeObjectRelease();
    return v5;
  }
  if (!a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24A2664FC();
    swift_release();
    swift_release();
    v1 = v7;
    v2 = v8;
    v3 = 2;
    v4 = 1;
    goto LABEL_5;
  }
  result = sub_24A2668F8();
  __break(1u);
  return result;
}

uint64_t VCUIBadgedTextOverlayModel.deinit()
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

  v1 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__text;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E988);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__type;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E998);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__focusRect;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E9A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__startIndex;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E9B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__popoverShowing;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E9C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return v0;
}

uint64_t VCUIBadgedTextOverlayModel.__deallocating_deinit()
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

  v1 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__text;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E988);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__type;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E998);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__focusRect;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E9A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__startIndex;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E9B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = v0 + OBJC_IVAR____TtC14VoiceControlUI26VCUIBadgedTextOverlayModel__popoverShowing;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791E9C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_deallocClassInstance();
}

uint64_t sub_24A263D2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for VCUIBadgedTextOverlayModel();
  result = sub_24A2664E4();
  *a1 = result;
  return result;
}

id sub_24A263D68()
{
  char *v0;
  void *v1;
  void *v2;
  id result;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  objc_super v32;

  v1 = v0;
  v32.receiver = v0;
  v32.super_class = (Class)type metadata accessor for VCUIBadgedTextOverlayController_Swift();
  objc_msgSendSuper2(&v32, sel_viewDidLoad);
  v2 = *(void **)&v0[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController];
  objc_msgSend(v0, sel_addChildViewController_, v2);
  result = objc_msgSend(v2, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_15;
  }
  v4 = result;
  objc_msgSend(result, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v5 = result;
  v6 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v5, sel_setBackgroundColor_, v6);

  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v7 = result;
  result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v8 = result;
  objc_msgSend(v7, sel_addSubview_, result);

  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E9D8);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_24A267820;
  result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v10 = result;
  v11 = objc_msgSend(result, sel_leadingAnchor);

  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v12 = result;
  v13 = objc_msgSend(result, sel_leadingAnchor);

  v14 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v13);
  *(_QWORD *)(v9 + 32) = v14;
  result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v15 = result;
  v16 = objc_msgSend(result, sel_trailingAnchor);

  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v17 = result;
  v18 = objc_msgSend(result, sel_trailingAnchor);

  v19 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v18);
  *(_QWORD *)(v9 + 40) = v19;
  result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v20 = result;
  v21 = objc_msgSend(result, sel_topAnchor);

  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v22 = result;
  v23 = objc_msgSend(result, sel_topAnchor);

  v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v23);
  *(_QWORD *)(v9 + 48) = v24;
  result = objc_msgSend(v2, sel_view);
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v25 = result;
  v26 = objc_msgSend(result, sel_bottomAnchor);

  result = objc_msgSend(v1, sel_view);
  if (result)
  {
    v27 = result;
    v28 = (void *)objc_opt_self();
    v29 = objc_msgSend(v27, sel_bottomAnchor);

    v30 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v29);
    *(_QWORD *)(v9 + 56) = v30;
    sub_24A266844();
    sub_24A264204();
    v31 = (void *)sub_24A266838();
    swift_bridgeObjectRelease();
    objc_msgSend(v28, sel_activateConstraints_, v31);

    return objc_msgSend(v2, sel_didMoveToParentViewController_, v1);
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for VCUIBadgedTextOverlayController_Swift()
{
  return objc_opt_self();
}

unint64_t sub_24A264204()
{
  unint64_t result;

  result = qword_25791E9E0;
  if (!qword_25791E9E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25791E9E0);
  }
  return result;
}

void sub_24A2642F0()
{
  uint64_t v0;
  id v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController), sel_view);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_intrinsicContentSize);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24A2643AC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24A264440(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text);
  *v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRelease();
  sub_24A266610();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_24A266508();
  swift_release();
  return swift_release();
}

void (*sub_24A264504(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v3 = malloc(0x58uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text;
  v3[9] = v1;
  v3[10] = v4;
  v5 = (uint64_t *)(v1 + v4);
  v6 = *v5;
  v3[8] = v5[1];
  v3[7] = v6;
  swift_bridgeObjectRetain();
  return sub_24A264564;
}

void sub_24A264564(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 56);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 72);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 64);
  v7 = (_QWORD *)(v5 + v4);
  *v7 = v3;
  v7[1] = v6;
  v8 = v2[9];
  v9 = v2[10];
  if ((a2 & 1) != 0)
  {
    v10 = (uint64_t *)(v8 + v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_24A266610();
    v12 = *v10;
    v11 = v10[1];
    swift_getKeyPath();
    swift_getKeyPath();
    *v2 = v12;
    v2[1] = v11;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_24A266508();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v13 = (uint64_t *)(v8 + v9);
    sub_24A266610();
    v15 = *v13;
    v14 = v13[1];
    swift_getKeyPath();
    swift_getKeyPath();
    *v2 = v15;
    v2[1] = v14;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_24A266508();
    swift_release();
    swift_release();
  }
  free(v2);
}

uint64_t sub_24A2646E8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type);
}

uint64_t sub_24A264738(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type) = a1;
  sub_24A266610();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24A266508();
  swift_release();
  return swift_release();
}

void (*sub_24A2647E8(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x50uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type;
  v3[8] = v1;
  v3[9] = v4;
  v3[7] = *(_QWORD *)(v1 + v4);
  return sub_24A264830;
}

void sub_24A264830(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 64) + *(_QWORD *)(*(_QWORD *)a1 + 72)) = *(_QWORD *)(*(_QWORD *)a1 + 56);
  v3 = v1[8];
  v2 = v1[9];
  sub_24A266610();
  v4 = *(_QWORD *)(v3 + v2);
  swift_getKeyPath();
  swift_getKeyPath();
  *v1 = v4;
  swift_retain();
  sub_24A266508();
  swift_release();
  swift_release();
  free(v1);
}

double sub_24A2648F8()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
}

uint64_t sub_24A264974(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  double *v5;

  v5 = (double *)(v4 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  *v5 = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  sub_24A266610();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24A266508();
  swift_release();
  return swift_release();
}

void (*sub_24A264A40(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  char *v3;
  uint64_t v4;
  __int128 v5;

  v3 = (char *)malloc(0x68uLL);
  v4 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect;
  v5 = *(_OWORD *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect);
  *(_OWORD *)(v3 + 72) = *(_OWORD *)(v1
                                   + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect
                                   + 16);
  *a1 = v3;
  *((_QWORD *)v3 + 11) = v1;
  *((_QWORD *)v3 + 12) = v4;
  *(_OWORD *)(v3 + 56) = v5;
  return sub_24A264A90;
}

void sub_24A264A90(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD **)a1;
  v2 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 88) + *(_QWORD *)(*(_QWORD *)a1 + 96));
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 64);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 72);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  *v2 = v3;
  v2[1] = v4;
  v2[2] = v5;
  v2[3] = v6;
  sub_24A266610();
  swift_getKeyPath();
  swift_getKeyPath();
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v5;
  v1[3] = v6;
  swift_retain();
  sub_24A266508();
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_24A264B68()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex);
}

uint64_t sub_24A264BB8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex) = a1;
  sub_24A266610();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24A266508();
  swift_release();
  return swift_release();
}

void (*sub_24A264C64(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x50uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex;
  v3[8] = v1;
  v3[9] = v4;
  v3[7] = *(_QWORD *)(v1 + v4);
  return sub_24A264CAC;
}

void sub_24A264CAC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = *(_QWORD **)a1;
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 56);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 64) + *(_QWORD *)(*(_QWORD *)a1 + 72)) = v2;
  sub_24A266610();
  swift_getKeyPath();
  swift_getKeyPath();
  *v1 = v2;
  swift_retain();
  sub_24A266508();
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_24A264D64()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing);
}

uint64_t sub_24A264DB4(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing) = a1;
  sub_24A266610();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24A266508();
  swift_release();
  return swift_release();
}

void (*sub_24A264E60(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing;
  v3[7] = v1;
  v3[8] = v4;
  *((_BYTE *)v3 + 49) = *(_BYTE *)(v1 + v4);
  return sub_24A264EA8;
}

void sub_24A264EA8(uint64_t a1)
{
  _BYTE *v1;
  char v2;

  v1 = *(_BYTE **)a1;
  v2 = *(_BYTE *)(*(_QWORD *)a1 + 49);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)a1 + 56) + *(_QWORD *)(*(_QWORD *)a1 + 64)) = v2;
  sub_24A266610();
  swift_getKeyPath();
  swift_getKeyPath();
  *v1 = v2;
  swift_retain();
  sub_24A266508();
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_24A264F94()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_24A265020(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_24A265068())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24A2650F0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_24A26517C(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_24A2651C4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_24A265208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t result;

  if (a3 == 1)
  {
    v7 = 3;
    v8 = a4;
    v9 = 0;
    return sub_24A260B48(v7, v8, v9, a1, a2);
  }
  if (!a3)
  {
    v7 = 2;
    v8 = a4;
    v9 = 1;
    return sub_24A260B48(v7, v8, v9, a1, a2);
  }
  result = sub_24A2668F8();
  __break(1u);
  return result;
}

uint64_t sub_24A265364()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_24A266610();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type);
  swift_retain();
  v2 = sub_24A2639FC(v1);
  swift_release_n();
  swift_release();
  return v2;
}

uint64_t sub_24A26548C()
{
  return 1;
}

id VCUIBadgedTextOverlayController_Swift.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_24A266808();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id VCUIBadgedTextOverlayController_Swift.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  char *v7;
  id v8;
  char *v9;
  char *v10;
  void *v11;
  id v12;
  objc_super v14;
  char v15[56];

  v6 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController;
  v7 = v3;
  sub_24A265C88((uint64_t)v15);
  v8 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25791EA20));
  *(_QWORD *)&v3[v6] = sub_24A266604();
  v9 = &v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0xE000000000000000;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type] = 1;
  v10 = &v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect];
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex] = 1;
  v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder] = 10;
  v7[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay] = 1;

  if (a2)
  {
    v11 = (void *)sub_24A266808();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v14.receiver = v7;
  v14.super_class = (Class)type metadata accessor for VCUIBadgedTextOverlayController_Swift();
  v12 = objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, v11, a3);

  return v12;
}

id VCUIBadgedTextOverlayController_Swift.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id VCUIBadgedTextOverlayController_Swift.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  char *v6;
  char *v7;
  id v8;
  objc_super v10;
  char v11[56];

  v3 = OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_hostingController;
  v4 = v1;
  sub_24A265C88((uint64_t)v11);
  v5 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25791EA20));
  *(_QWORD *)&v1[v3] = sub_24A266604();
  v6 = &v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0xE000000000000000;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type] = 1;
  v7 = &v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect];
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex] = 1;
  v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder] = 10;
  v4[OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay] = 1;

  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for VCUIBadgedTextOverlayController_Swift();
  v8 = objc_msgSendSuper2(&v10, sel_initWithCoder_, a1);

  return v8;
}

id VCUIBadgedTextOverlayController_Swift.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VCUIBadgedTextOverlayController_Swift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24A265888@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A2664FC();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24A265908()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_24A266508();
}

uint64_t sub_24A26598C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A2664FC();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24A265A0C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_24A266508();
}

double sub_24A265A80@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A2664FC();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24A265B00()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_24A266508();
}

uint64_t sub_24A265B8C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24A2664FC();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24A265C0C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_24A266508();
}

double sub_24A265C88@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;
  char v6;
  uint64_t v7;

  type metadata accessor for VCUIBadgedTextOverlayModel();
  swift_allocObject();
  sub_24A2635CC(0, 0xE000000000000000, 1, 1, 1, 0.0, 0.0, 0.0, 0.0);
  sub_24A260154();
  v2 = sub_24A2665A4();
  v4 = v3;
  sub_24A26676C();
  result = 300.0;
  *(_OWORD *)a1 = xmmword_24A267830;
  *(_QWORD *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_BYTE *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_24A265D54()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_24A265D60@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)(*a1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__text);
  v3 = v2[1];
  *a2 = *v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A265D7C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_24A264440(v1, v2);
}

_QWORD *sub_24A265DB8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(*result + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__type);
  return result;
}

uint64_t sub_24A265DD0(uint64_t *a1)
{
  return sub_24A264738(*a1);
}

__n128 sub_24A265DF4@<Q0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;

  v2 = *a1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__focusRect;
  result = *(__n128 *)v2;
  v4 = *(_OWORD *)(v2 + 16);
  *a2 = *(_OWORD *)v2;
  a2[1] = v4;
  return result;
}

uint64_t sub_24A265E10(double *a1)
{
  return sub_24A264974(*a1, a1[1], a1[2], a1[3]);
}

_QWORD *sub_24A265E38@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(*result + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__startIndex);
  return result;
}

uint64_t sub_24A265E50(uint64_t *a1)
{
  return sub_24A264BB8(*a1);
}

_QWORD *sub_24A265E74@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*result + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift__popoverShowing);
  return result;
}

uint64_t sub_24A265E8C(char *a1)
{
  return sub_24A264DB4(*a1);
}

uint64_t sub_24A265EB0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_24A265F00(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_zOrder);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_24A265F4C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_24A265F9C(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC14VoiceControlUI37VCUIBadgedTextOverlayController_Swift_isOverlay);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_24A265FE8()
{
  return type metadata accessor for VCUIBadgedTextOverlayModel();
}

uint64_t type metadata accessor for VCUIBadgedTextOverlayModel()
{
  uint64_t result;

  result = qword_25791EA50;
  if (!qword_25791EA50)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24A26602C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_24A2661AC(319, &qword_25791EA60);
  if (v0 <= 0x3F)
  {
    sub_24A266160(319, &qword_25791EA68, type metadata accessor for VCUIOverlayTextOverlayType);
    if (v1 <= 0x3F)
    {
      sub_24A266160(319, &qword_25791EA70, type metadata accessor for CGRect);
      if (v2 <= 0x3F)
      {
        sub_24A2661AC(319, &qword_25791EA78);
        if (v3 <= 0x3F)
        {
          sub_24A2661AC(319, qword_25791EA80);
          if (v4 <= 0x3F)
            swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for VCUIBadgedTextOverlayModel()
{
  return swift_lookUpClassMethod();
}

void sub_24A266160(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_24A266514();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_24A2661AC(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_24A266514();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t method lookup function for VCUIBadgedTextOverlayController_Swift()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.text.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.text.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.text.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.type.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.type.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.type.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.focusRect.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.focusRect.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.focusRect.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.startIndex.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.startIndex.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.startIndex.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.popoverShowing.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.popoverShowing.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.popoverShowing.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.zOrder.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.zOrder.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.zOrder.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.isOverlay.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.isOverlay.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.isOverlay.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of static VCUIBadgedTextOverlayController_Swift.textSegmentModels(forText:type:start:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 432))();
}

uint64_t dispatch thunk of VCUIBadgedTextOverlayController_Swift.displayedTextSegmentModels()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t sub_24A26646C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_24A26649C()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_24A2664A8()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_24A2664B4()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_24A2664C0()
{
  return MEMORY[0x24BDCC8D0]();
}

uint64_t sub_24A2664CC()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_24A2664D8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_24A2664E4()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_24A2664F0()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_24A2664FC()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_24A266508()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_24A266514()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_24A266520()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_24A26652C()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_24A266538()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_24A266544()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_24A266550()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_24A26655C()
{
  return MEMORY[0x24BDEC258]();
}

uint64_t sub_24A266568()
{
  return MEMORY[0x24BDEC260]();
}

uint64_t sub_24A266574()
{
  return MEMORY[0x24BDEC268]();
}

uint64_t sub_24A266580()
{
  return MEMORY[0x24BDEC280]();
}

uint64_t sub_24A26658C()
{
  return MEMORY[0x24BDEC778]();
}

uint64_t sub_24A266598()
{
  return MEMORY[0x24BDEC7A8]();
}

uint64_t sub_24A2665A4()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_24A2665B0()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_24A2665BC()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_24A2665C8()
{
  return MEMORY[0x24BDECBD0]();
}

uint64_t sub_24A2665D4()
{
  return MEMORY[0x24BDECBD8]();
}

uint64_t sub_24A2665E0()
{
  return MEMORY[0x24BDECBE8]();
}

uint64_t sub_24A2665EC()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_24A2665F8()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_24A266604()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_24A266610()
{
  return MEMORY[0x24BDEF1E0]();
}

uint64_t sub_24A26661C()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_24A266628()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_24A266634()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_24A266640()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_24A26664C()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_24A266658()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_24A266664()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_24A266670()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_24A26667C()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_24A266688()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_24A266694()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_24A2666A0()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_24A2666AC()
{
  return MEMORY[0x24BDEFDD8]();
}

uint64_t sub_24A2666B8()
{
  return MEMORY[0x24BDEFDE0]();
}

uint64_t sub_24A2666C4()
{
  return MEMORY[0x24BDF02D0]();
}

uint64_t sub_24A2666D0()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_24A2666DC()
{
  return MEMORY[0x24BDF1458]();
}

uint64_t sub_24A2666E8()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_24A2666F4()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_24A266700()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_24A26670C()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_24A266718()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_24A266724()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_24A266730()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_24A26673C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_24A266748()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_24A266754()
{
  return MEMORY[0x24BDF33B0]();
}

uint64_t sub_24A266760()
{
  return MEMORY[0x24BDF3800]();
}

uint64_t sub_24A26676C()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_24A266778()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_24A266784()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_24A266790()
{
  return MEMORY[0x24BDF42F8]();
}

uint64_t sub_24A26679C()
{
  return MEMORY[0x24BDF44E0]();
}

uint64_t sub_24A2667A8()
{
  return MEMORY[0x24BDF44E8]();
}

uint64_t sub_24A2667B4()
{
  return MEMORY[0x24BDF44F0]();
}

uint64_t sub_24A2667C0()
{
  return MEMORY[0x24BDF4508]();
}

uint64_t sub_24A2667CC()
{
  return MEMORY[0x24BDF4510]();
}

uint64_t sub_24A2667D8()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_24A2667E4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_24A2667F0()
{
  return MEMORY[0x24BDF5448]();
}

uint64_t sub_24A2667FC()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_24A266808()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24A266814()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24A266820()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_24A26682C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24A266838()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_24A266844()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24A266850()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24A26685C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_24A266868()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_24A266874()
{
  return MEMORY[0x24BEE1908]();
}

uint64_t sub_24A266880()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_24A26688C()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_24A266898()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_24A2668A4()
{
  return MEMORY[0x24BDD0278]();
}

uint64_t sub_24A2668B0()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_24A2668BC()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_24A2668C8()
{
  return MEMORY[0x24BDD0550]();
}

uint64_t sub_24A2668D4()
{
  return MEMORY[0x24BDD0668]();
}

uint64_t sub_24A2668E0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24A2668EC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24A2668F8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24A266904()
{
  return MEMORY[0x24BEE3068]();
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

