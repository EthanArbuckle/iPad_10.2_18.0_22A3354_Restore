uint64_t sub_2289D6414@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char v12;
  char v13;
  double v14;
  uint64_t result;
  _QWORD v16[4];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA448);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a3, sel_cellType) == (id)8)
  {
    *(_QWORD *)v10 = sub_2289EA858();
    *((_QWORD *)v10 + 1) = 0;
    v10[16] = 1;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA450);
    v12 = a2 & 1;
    sub_2289D6624(a3, (uint64_t)&v10[*(int *)(v11 + 44)]);
    sub_2289D6BCC(a1, v12);
    v13 = sub_2289E8AA4(a1, v12);
    sub_2289D6C04(a1, v12);
    if ((v13 & 1) != 0)
      v14 = 1.0;
    else
      v14 = 0.5;
    sub_2289D6E6C((uint64_t)v10, a4);
    *(double *)(a4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559DA458) + 36)) = v14;
    return sub_2289D6EB4((uint64_t)v10);
  }
  else
  {
    v16[2] = 0;
    v16[3] = 0xE000000000000000;
    sub_2289EACE4();
    sub_2289EABF4();
    v16[1] = objc_msgSend(a3, sel_cellType);
    type metadata accessor for PSTableCellType();
    sub_2289EAD50();
    sub_2289EABF4();
    result = sub_2289EAD68();
    __break(1u);
  }
  return result;
}

uint64_t sub_2289D6624@<X0>(void *a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  id v24;
  _BYTE *v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t OpaqueTypeConformance2;
  _BYTE *v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  void (*v39)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(_BYTE *, uint64_t);
  _BYTE v49[12];
  int v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA460);
  v54 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v52 = &v49[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA468);
  v56 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v55 = &v49[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA470);
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v58 = &v49[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA478);
  v64 = *(_QWORD *)(v7 - 8);
  v65 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v63 = &v49[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v62 = &v49[-v10];
  v11 = a1;
  v12 = sub_2289D8928();
  v14 = v13;

  if (v14)
  {
    v69 = v12;
    v70 = v14;
    sub_2289D6FBC();
    v15 = sub_2289EA9F0();
    v17 = v16;
    v19 = v18 & 1;
    sub_2289EA9A8();
    v67 = sub_2289EA9E4();
    v68 = v20;
    v22 = v21;
    v66 = v23;
    swift_release();
    v53 = v22 & 1;
    sub_2289D6FAC(v15, v17, v19);
    swift_bridgeObjectRelease();
    LOBYTE(v51) = sub_2289EA99C();
    v51 = v51;
    v50 = 1;
  }
  else
  {
    v67 = 0;
    v68 = 0;
    v53 = 0;
    v66 = 0;
    v51 = 0;
    v50 = 0;
  }
  sub_2289EA864();
  v24 = v11;
  sub_2289D8A84();

  v25 = v52;
  sub_2289EAB94();
  objc_msgSend(v24, sel_suikp_keyboardType);
  v26 = sub_2289D7088(&qword_2559DA480, &qword_2559DA460, MEMORY[0x24BDF53E0]);
  v27 = v55;
  v28 = v57;
  sub_2289EAA20();
  (*(void (**)(_BYTE *, uint64_t))(v54 + 8))(v25, v28);
  objc_msgSend(v24, sel_suikp_autoCapsType);
  v69 = v28;
  v70 = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v30 = v58;
  v31 = v60;
  sub_2289EAA50();
  (*(void (**)(_BYTE *, uint64_t))(v56 + 8))(v27, v31);
  v32 = objc_msgSend(v24, sel_suikp_autoCorrectionType) == (id)1;
  v69 = v31;
  v70 = OpaqueTypeConformance2;
  v33 = swift_getOpaqueTypeConformance2();
  v34 = v63;
  v35 = v61;
  MEMORY[0x22E2B7ED8](v32, v61, v33);
  (*(void (**)(_BYTE *, uint64_t))(v59 + 8))(v30, v35);
  v37 = v64;
  v36 = v65;
  v38 = v62;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v64 + 32))(v62, v34, v65);
  v39 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v37 + 16);
  v39(v34, v38, v36);
  v40 = v68;
  *(_QWORD *)a2 = v67;
  *(_QWORD *)(a2 + 8) = v40;
  v68 = v40;
  v41 = v53;
  v42 = v66;
  *(_QWORD *)(a2 + 16) = v53;
  *(_QWORD *)(a2 + 24) = v42;
  *(_QWORD *)(a2 + 32) = v51;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_BYTE *)(a2 + 72) = v50;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA488);
  v39((_BYTE *)(a2 + *(int *)(v43 + 48)), v34, v36);
  v44 = v67;
  v45 = v40;
  v46 = v66;
  sub_2289D6F3C(v67, v45, v41, v66);
  v47 = *(void (**)(_BYTE *, uint64_t))(v37 + 8);
  v47(v38, v36);
  v47(v34, v36);
  return sub_2289D6F7C(v44, v68, v41, v46);
}

uint64_t sub_2289D6B3C()
{
  return sub_2289EAA44();
}

uint64_t sub_2289D6B54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2289D6414(*(_QWORD *)v1, *(_BYTE *)(v1 + 8), *(void **)(v1 + 24), a1);
}

_QWORD *sub_2289D6B6C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2289D6B7C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_2289D6B88(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t initializeBufferWithCopyOfBuffer for SUIKPTextFieldCell(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_2289D6BCC(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

void destroy for SUIKPTextFieldCell(uint64_t a1)
{
  sub_2289D6C04(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));

}

uint64_t sub_2289D6C04(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for SUIKPTextFieldCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_2289D6BCC(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = v6;
  return a1;
}

uint64_t assignWithCopy for SUIKPTextFieldCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_2289D6BCC(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_2289D6C04(v6, v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(void **)(a2 + 24);
  v9 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  v10 = v8;

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

uint64_t assignWithTake for SUIKPTextFieldCell(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_2289D6C04(v6, v7);
  v8 = a2[3];
  v9 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v8;

  return a1;
}

uint64_t getEnumTagSinglePayload for SUIKPTextFieldCell(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SUIKPTextFieldCell(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SUIKPTextFieldCell()
{
  return &type metadata for SUIKPTextFieldCell;
}

uint64_t sub_2289D6DC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2B85A4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void type metadata accessor for PSTableCellType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2559DA498)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2559DA498);
  }
}

uint64_t sub_2289D6E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2289D6EB4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA448);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2B85B0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2289D6F3C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2289D6F6C(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2289D6F6C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_2289D6F7C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_2289D6FAC(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2289D6FAC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_2289D6FBC()
{
  unint64_t result;

  result = qword_2559DA490;
  if (!qword_2559DA490)
  {
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2559DA490);
  }
  return result;
}

unint64_t sub_2289D7004()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DA4A0;
  if (!qword_2559DA4A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA458);
    v2[0] = sub_2289D7088(&qword_2559DA4A8, &qword_2559DA448, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DA4A0);
  }
  return result;
}

uint64_t sub_2289D7088(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E2B85BC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for SUIKPThirdPartyAppListController()
{
  uint64_t result;

  result = qword_2559DA588;
  if (!qword_2559DA588)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2289D7104()
{
  return swift_initClassMetadata2();
}

void sub_2289D7150()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  char *v9;
  void (*v10)(_BYTE *, _QWORD);
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t (*v14)();
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[40];

  *(_QWORD *)&v0[qword_2559DA570] = 0;
  *(_QWORD *)&v0[qword_2559DA578] = 0;
  v1 = qword_2559DA580;
  *(_QWORD *)&v0[qword_2559DA580] = 0;
  v2 = objc_allocWithZone(MEMORY[0x24BE75600]);
  v3 = v0;
  v4 = objc_msgSend(v2, sel_init);
  v5 = *(void **)&v0[v1];
  *(_QWORD *)&v0[v1] = v4;

  v6 = *(void **)&v0[v1];
  if (v6)
  {
    swift_unknownObjectWeakInit();
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v14 = sub_2289D8514;
    v15 = v7;
    LOBYTE(v16) = 0;
    v17 = 0;
    swift_unknownObjectWeakAssign();
    sub_2289D84D4((uint64_t)&v14, (uint64_t)v18);
    v8 = v6;
    v9 = (char *)(id)sub_2289EA8C4();
    v10 = (void (*)(_BYTE *, _QWORD))sub_2289EA8D0();
    *(_QWORD *)(v11 + 32) = &off_24F151DC0;
    swift_unknownObjectWeakAssign();
    v10(v18, 0);
    v12 = *(void **)&v9[qword_2559DA580];
    if (v12)
    {
      objc_msgSend(v12, sel_setViewController_, v9, v14, v15, v16);
      v13 = objc_msgSend(v9, sel_navigationItem);
      objc_msgSend(v13, sel_setLargeTitleDisplayMode_, 2);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_2289D72E4(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  char *v13;
  void (*v14)(_BYTE *, _QWORD);
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t (*v18)();
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[40];

  *(_QWORD *)&v1[qword_2559DA570] = 0;
  *(_QWORD *)&v1[qword_2559DA578] = 0;
  v3 = qword_2559DA580;
  *(_QWORD *)&v1[qword_2559DA580] = 0;
  v4 = objc_allocWithZone(MEMORY[0x24BE75600]);
  v5 = v1;
  v6 = objc_msgSend(v4, sel_init);
  v7 = *(void **)&v1[v3];
  *(_QWORD *)&v1[v3] = v6;

  v8 = *(void **)&v1[v3];
  if (v8)
  {
    swift_unknownObjectWeakInit();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v18 = sub_2289D84CC;
    v19 = v9;
    LOBYTE(v20) = 0;
    v21 = 0;
    swift_unknownObjectWeakAssign();
    sub_2289D84D4((uint64_t)&v18, (uint64_t)v22);
    v10 = a1;
    v11 = v8;
    v12 = (void *)sub_2289EA8B8();
    if (!v12)
    {
LABEL_5:

      return;
    }
    v13 = v12;
    v14 = (void (*)(_BYTE *, _QWORD))sub_2289EA8D0();
    *(_QWORD *)(v15 + 32) = &off_24F151DC0;
    swift_unknownObjectWeakAssign();
    v14(v22, 0);
    v16 = *(void **)&v13[qword_2559DA580];
    if (v16)
    {
      objc_msgSend(v16, sel_setViewController_, v13, v18, v19, v20);
      v17 = objc_msgSend(v13, sel_navigationItem);
      objc_msgSend(v17, sel_setLargeTitleDisplayMode_, 2);

      goto LABEL_5;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_2289D7494(uint64_t a1, uint64_t a2, void *a3)
{
  sub_2289D72E4(a3);
}

void sub_2289D74B8(char *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  char *v5;
  objc_super v6;

  v3 = *(void **)&a1[qword_2559DA580];
  if (v3)
  {
    v5 = a1;
    objc_msgSend(v3, sel_viewWillAppear_, a3);
    v6.receiver = v5;
    v6.super_class = (Class)type metadata accessor for SUIKPThirdPartyAppListController();
    objc_msgSendSuper2(&v6, sel_viewWillAppear_, a3);

  }
  else
  {
    __break(1u);
  }
}

void sub_2289D7534()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2289D7560()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2289D758C()
{
  uint64_t v0;

}

id sub_2289D75C8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SUIKPThirdPartyAppListController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2289D75FC(uint64_t a1)
{

}

uint64_t sub_2289D7644()
{
  return type metadata accessor for SUIKPThirdPartyAppListController();
}

void sub_2289D764C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v1 = v0;
  v2 = sub_2289EA720();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2559DA3D8 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_2559DB968);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_2289EA708();
  v8 = sub_2289EAC48();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v13 = v10;
    *(_DWORD *)v9 = 136315138;
    v12 = sub_2289E49DC(0xD000000000000015, 0x80000002289EEF30, &v13);
    sub_2289EAC84();
    _os_log_impl(&dword_2289D4000, v7, v8, "SUIKPThirdPartyAppListController %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2B8634](v10, -1, -1);
    MEMORY[0x22E2B8634](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_2559DA3C0 != -1)
    swift_once();
  objc_msgSend(v11, sel_postNotificationName_object_, qword_2559DB940, *(_QWORD *)(v1 + qword_2559DA580));

}

void sub_2289D7890(void *a1)
{
  id v1;

  v1 = a1;
  sub_2289D764C();

}

void sub_2289D78C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = *(id *)(a1 + qword_2559DA578);
  *(_QWORD *)(a1 + qword_2559DA578) = a3;
  v3 = a3;

}

void sub_2289D78F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = *(id *)(a1 + qword_2559DA570);
  *(_QWORD *)(a1 + qword_2559DA570) = a3;
  v3 = a3;

}

id sub_2289D792C(uint64_t a1)
{
  return *(id *)(a1 + qword_2559DA570);
}

id sub_2289D793C(uint64_t a1)
{
  return *(id *)(a1 + qword_2559DA578);
}

void sub_2289D794C(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = qword_2559DA580;
  v4 = *(void **)&v1[qword_2559DA580];
  if (!v4)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (!a1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  objc_msgSend(v4, sel_setSpecifier_);
  v5 = *(void **)&v1[v3];
  if (v5)
  {
    v6 = objc_msgSend(v5, sel_specifier);
    v7 = objc_msgSend(v6, sel_name);

    objc_msgSend(v1, sel_setTitle_, v7);
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_2289D79F0(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  sub_2289D794C((uint64_t)a3);

}

id sub_2289D7A48(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + qword_2559DA580);
  if (result)
    return objc_msgSend(result, sel_specifier);
  __break(1u);
  return result;
}

id sub_2289D7A80(void *a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(a1, sel_showController_animate_, a3, 1);
}

void sub_2289D7A90(void *a1, uint64_t a2, void *a3, int a4)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  if (a4)
  {
    if (a3)
    {
      objc_msgSend(a1, sel_showViewController_sender_, a3, a1);
      return;
    }
    __break(1u);
    goto LABEL_10;
  }
  v9 = a1;
  v5 = a3;
  v6 = objc_msgSend(v9, sel_navigationController);
  if (!v6)
  {

    v7 = v9;
    goto LABEL_8;
  }
  if (v5)
  {
    v8 = v6;
    objc_msgSend(v6, sel_pushViewController_animated_, v5, 0);

    v7 = v8;
LABEL_8:

    return;
  }
LABEL_10:
  __break(1u);
}

uint64_t sub_2289D7B48(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;

  v3 = *(void **)(v2 + qword_2559DA580);
  if (!v3)
  {
    __break(1u);
    goto LABEL_6;
  }
  result = sub_2289D8448(result, (uint64_t)v12);
  v5 = v13;
  if (!v13)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v6 = __swift_project_boxed_opaque_existential_0(v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = v3;
  v11 = sub_2289EAD8C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  if (a2)
  {
    objc_msgSend(v10, sel_setPreferenceValue_specifier_, v11, a2);

    return swift_unknownObjectRelease();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2289D7C5C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _OWORD v11[2];

  if (a3)
  {
    v6 = a4;
    v7 = a1;
    swift_unknownObjectRetain();
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v8 = a4;
    v9 = a1;
  }
  sub_2289D7B48((uint64_t)v11, (uint64_t)a4);

  return sub_2289D8378((uint64_t)v11);
}

char *sub_2289D7CE4(char *result, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD v14[3];
  uint64_t v15;

  v3 = *(void **)&result[qword_2559DA580];
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (!a3)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v4 = result;
  v5 = a3;
  v6 = v4;
  v7 = objc_msgSend(v3, sel_readPreferenceValue_, v5);
  sub_2289EAC9C();

  swift_unknownObjectRelease();
  v8 = v15;
  if (v15)
  {
    v9 = __swift_project_boxed_opaque_existential_0(v14, v15);
    v10 = *(_QWORD *)(v8 - 8);
    MEMORY[0x24BDAC7A8](v9);
    v12 = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    v13 = (void *)sub_2289EAD8C();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  else
  {
    v13 = 0;
  }
  return (char *)v13;
}

uint64_t sub_2289D7E0C(void *a1, int a2, uint64_t a3, void *aBlock)
{
  _QWORD *v6;
  void (*v7)(_QWORD *);
  id v8;

  v6 = _Block_copy(aBlock);
  if (a3)
    sub_2289EABA0();
  if (v6)
  {
    v7 = (void (*)(_QWORD *))v6[2];
    v8 = a1;
    v7(v6);
    _Block_release(v6);

  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2289D7E94()
{
  return 1;
}

id sub_2289D7E9C(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + qword_2559DA580);
  if (result)
    return objc_msgSend(result, sel_reloadSpecifiers);
  __break(1u);
  return result;
}

void sub_2289D7EBC(int a1, id a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a2, sel_buttonAction))
  {
    objc_msgSend(a2, sel_performButtonAction);
    return;
  }
  if (objc_msgSend(a2, sel_cellType) == (id)3)
  {
    v19 = -1;
    v20 = -1;
    v4 = qword_2559DA580;
    v5 = *(void **)(v2 + qword_2559DA580);
    if (v5)
    {
      if (!objc_msgSend(v5, sel_getGroup_row_ofSpecifier_, &v20, &v19, a2))
        return;
      v6 = *(void **)(v2 + v4);
      if (v6)
      {
        v7 = v20;
        v8 = v6;
        v9 = objc_msgSend(v8, sel_specifierAtIndex_, objc_msgSend(v8, sel_indexOfGroup_, v7));

        if (objc_msgSend(v9, sel_propertyForKey_, *MEMORY[0x24BE75B28]))
        {
          sub_2289EAC9C();
          swift_unknownObjectRelease();
        }
        else
        {
          v21 = 0u;
          v22 = 0u;
        }
        sub_2289D8330((uint64_t)&v21, (uint64_t)&v23);
        if (!*((_QWORD *)&v24 + 1))
        {
          sub_2289D8378((uint64_t)&v23);
LABEL_16:

          return;
        }
        if (!swift_dynamicCast() || (v18 & 1) == 0)
          goto LABEL_16;
        v10 = *MEMORY[0x24BE75C20];
        if (objc_msgSend(v9, sel_propertyForKey_, *MEMORY[0x24BE75C20]))
        {
          sub_2289EAC9C();
          swift_unknownObjectRelease();
        }
        else
        {
          v21 = 0u;
          v22 = 0u;
        }
        sub_2289D8330((uint64_t)&v21, (uint64_t)&v23);
        if (!*((_QWORD *)&v24 + 1))
        {

          sub_2289D8378((uint64_t)&v23);
          return;
        }
        sub_2289D83B8();
        if ((swift_dynamicCast() & 1) == 0)
          goto LABEL_16;
        if ((objc_msgSend(v18, sel_isEqualToSpecifier_, a2) & 1) != 0)
        {

          goto LABEL_16;
        }
        objc_msgSend(v9, sel_setProperty_forKey_, a2, v10);
        v11 = *(void **)(v2 + v4);
        if (v11)
        {
          v12 = v11;
          if (objc_msgSend(v9, sel_propertyForKey_, v10))
          {
            sub_2289EAC9C();
            swift_unknownObjectRelease();
            sub_2289D83F4(&v21, &v23);
            swift_dynamicCast();
            v13 = objc_msgSend(v18, sel_propertyForKey_, *MEMORY[0x24BE75DA0]);

            if (v13)
            {
              sub_2289EAC9C();
              swift_unknownObjectRelease();
            }
            else
            {
              v23 = 0u;
              v24 = 0u;
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA638);
            v14 = sub_2289EAC78();
            sub_2289D8378((uint64_t)&v23);
            objc_msgSend(v12, sel_setPreferenceValue_specifier_, v14, v9);

            swift_unknownObjectRelease();
            v15 = (void *)objc_opt_self();
            v16 = objc_msgSend(v15, sel_defaultCenter);
            if (qword_2559DA3C8 != -1)
              swift_once();
            objc_msgSend(v16, sel_postNotificationName_object_, qword_2559DB948, v9);

            v17 = objc_msgSend(v15, sel_defaultCenter);
            objc_msgSend(v17, sel_postNotificationName_object_, qword_2559DB948, a2);

            return;
          }
LABEL_35:
          __break(1u);
          return;
        }
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_34;
  }
}

uint64_t sub_2289D8330(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2289D8378(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA638);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2289D83B8()
{
  unint64_t result;

  result = qword_2559DA640;
  if (!qword_2559DA640)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2559DA640);
  }
  return result;
}

_OWORD *sub_2289D83F4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

uint64_t sub_2289D8448(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2289D84A8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2289D84CC()
{
  uint64_t v0;

  return sub_2289DFE18(*(void **)(v0 + 16));
}

uint64_t sub_2289D84D4(uint64_t a1, uint64_t a2)
{
  initializeWithTake for SUIKPThirdPartyAppListView(a2, a1);
  return a2;
}

uint64_t sub_2289D8518()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2289EA744();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2289D8588()
{
  uint64_t result;

  result = sub_2289EABAC();
  qword_2559DB940 = result;
  return result;
}

uint64_t sub_2289D85BC(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage) = a1;
  v2 = a1;
  v3 = objc_msgSend(v2, sel_numberOfSections);
  swift_beginAccess();
  sub_2289EA738();
  swift_endAccess();
  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter, v3);
  v5 = qword_2559DA3C0;
  swift_retain();
  if (v5 != -1)
    swift_once();
  objc_msgSend(v4, sel_addObserver_selector_name_object_, v1, sel_reloadWithNotification_, qword_2559DB940, 0);

  swift_release();
  return v1;
}

uint64_t sub_2289D8778()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__numberOfSections;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA720);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_2289D87DC()
{
  return type metadata accessor for SpecifierController();
}

uint64_t type metadata accessor for SpecifierController()
{
  uint64_t result;

  result = qword_2559DA688;
  if (!qword_2559DA688)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2289D8820()
{
  unint64_t v0;

  sub_2289D8898();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_2289D8898()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2559DA698[0])
  {
    v0 = sub_2289EA75C();
    if (!v1)
      atomic_store(v0, qword_2559DA698);
  }
}

uint64_t sub_2289D88EC()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_2289D88F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2289EA72C();
  *a1 = result;
  return result;
}

uint64_t sub_2289D8928()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];

  v1 = objc_msgSend(v0, sel_name);
  if (v1)
  {
    v2 = v1;
    v3 = sub_2289EABC4();

  }
  else
  {
    v4 = (unint64_t)objc_msgSend(v0, sel_cellType);
    v5 = v4 > 0xD || ((1 << v4) & 0x200A) == 0;
    if (v5 && objc_msgSend(v0, sel_hasValidGetter))
    {
      if (objc_msgSend(v0, sel_performGetter))
      {
        sub_2289EAC9C();
        swift_unknownObjectRelease();
      }
      else
      {
        v8 = 0u;
        v9 = 0u;
      }
      sub_2289D8330((uint64_t)&v8, (uint64_t)v10);
    }
    else
    {
      memset(v10, 0, sizeof(v10));
    }
    sub_2289D8330((uint64_t)v10, (uint64_t)&v8);
    if (*((_QWORD *)&v9 + 1))
    {
      if (swift_dynamicCast())
        return v7;
      else
        return 0;
    }
    else
    {
      sub_2289DBD50((uint64_t)&v8, &qword_2559DA638);
      return 0;
    }
  }
  return v3;
}

uint64_t sub_2289D8A84()
{
  void *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;

  if ((objc_msgSend(v0, sel_cellType) == (id)8 || objc_msgSend(v0, sel_cellType) == (id)12)
    && objc_msgSend(v0, sel_hasValidGetter)
    && objc_msgSend(v0, sel_hasValidSetter))
  {
    v1 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v2 = (_QWORD *)swift_allocObject();
    v2[2] = 0;
    v2[3] = 0;
    v2[4] = v1;
    v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v4 = (_QWORD *)swift_allocObject();
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = v3;
    sub_2289EAB64();
  }
  else
  {
    sub_2289EAB70();
  }
  return v6;
}

uint64_t sub_2289D8BD4()
{
  uint64_t result;

  result = sub_2289EABAC();
  qword_2559DB948 = result;
  return result;
}

void PSSpecifier.objectWillChange.getter()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_2559DA3C8 != -1)
    swift_once();
  sub_2289EAC60();

}

void sub_2289D8C9C()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_2559DA3C8 != -1)
    swift_once();
  sub_2289EAC60();

}

id PSSpecifier.id.getter()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;

  result = objc_msgSend(v0, sel_identifier);
  if (result)
  {
    v2 = result;
    v3 = sub_2289EABC4();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2289D8D90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559DA728;
  if (!qword_2559DA728)
  {
    v1 = sub_2289EAC54();
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDD0070], v1);
    atomic_store(result, (unint64_t *)&qword_2559DA728);
  }
  return result;
}

uint64_t sub_2289D8DD8()
{
  return MEMORY[0x24BEE0D10];
}

void sub_2289D8DE4(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*v1, sel_identifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2289EABC4();
    v7 = v6;

    *a1 = v5;
    a1[1] = v7;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2289D8E40()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  _BYTE v9[40];
  __int128 v10;
  __int128 v11;

  v1 = objc_msgSend(v0, sel_properties);
  if (!v1)
  {
    v10 = 0u;
    v11 = 0u;
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  v2 = v1;
  v3 = sub_2289EABA0();

  *(_QWORD *)&v10 = sub_2289EABC4();
  *((_QWORD *)&v10 + 1) = v4;
  sub_2289EACCC();
  if (*(_QWORD *)(v3 + 16) && (v5 = sub_2289DBDC0((uint64_t)v9), (v6 & 1) != 0))
  {
    sub_2289DBDF0(*(_QWORD *)(v3 + 56) + 32 * v5, (uint64_t)&v10);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2289DBD8C((uint64_t)v9);
  if (!*((_QWORD *)&v11 + 1))
    goto LABEL_9;
  v7 = 1;
LABEL_10:
  sub_2289DBD50((uint64_t)&v10, &qword_2559DA638);
  return v7;
}

uint64_t sub_2289D8F48()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD v10[4];
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[2];

  v1 = v0;
  memset(v17, 0, sizeof(v17));
  if (objc_msgSend(v0, sel_hasValidGetter))
  {
    if (objc_msgSend(v0, sel_performGetter))
    {
      sub_2289EAC9C();
      swift_unknownObjectRelease();
      sub_2289DBD50((uint64_t)v17, &qword_2559DA638);
    }
    else
    {
      sub_2289DBD50((uint64_t)v17, &qword_2559DA638);
      v14 = 0u;
      v15 = 0u;
    }
    sub_2289D8330((uint64_t)&v14, (uint64_t)v17);
  }
  sub_2289D8448((uint64_t)v17, (uint64_t)&v14);
  v2 = *((_QWORD *)&v15 + 1);
  sub_2289DBD50((uint64_t)&v14, &qword_2559DA638);
  if (v2 && objc_msgSend(v1, sel_cellType) != (id)9)
  {
    if (objc_msgSend(v1, sel_cellType) == (id)2 || objc_msgSend(v1, sel_cellType) == (id)4)
      v3 = objc_msgSend(v1, sel_shortTitleDictionary);
    else
      v3 = objc_msgSend(v1, sel_titleDictionary);
    v4 = v3;
    if (v4)
    {
      v5 = sub_2289EABA0();

    }
    else
    {
      v5 = 0;
    }
    sub_2289D8448((uint64_t)v17, (uint64_t)v10);
    if (v10[3])
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        if (*((_QWORD *)&v12 + 1))
        {
          v14 = v11;
          v15 = v12;
          v16 = v13;
          if (v5)
          {
            if (*(_QWORD *)(v5 + 16) && (v6 = sub_2289DBDC0((uint64_t)&v14), (v7 & 1) != 0))
            {
              sub_2289DBDF0(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v11);
            }
            else
            {
              v11 = 0u;
              v12 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_2289DBD8C((uint64_t)&v14);
            sub_2289DBD50((uint64_t)v17, &qword_2559DA638);
            sub_2289D8330((uint64_t)&v11, (uint64_t)v17);
          }
          else
          {
            sub_2289DBD8C((uint64_t)&v14);
          }
          goto LABEL_25;
        }
      }
      else
      {
        v13 = 0;
        v11 = 0u;
        v12 = 0u;
      }
    }
    else
    {
      sub_2289DBD50((uint64_t)v10, &qword_2559DA638);
      v11 = 0u;
      v12 = 0u;
      v13 = 0;
    }
    swift_bridgeObjectRelease();
    sub_2289DBD50((uint64_t)&v11, &qword_2559DA730);
  }
LABEL_25:
  sub_2289D8448((uint64_t)v17, (uint64_t)&v14);
  v8 = *((_QWORD *)&v15 + 1);
  sub_2289DBD50((uint64_t)&v14, &qword_2559DA638);
  if (!v8)
  {
    if (objc_msgSend(v1, sel_propertyForKey_, *MEMORY[0x24BE75DA0]))
    {
      sub_2289EAC9C();
      swift_unknownObjectRelease();
      sub_2289DBD50((uint64_t)v17, &qword_2559DA638);
    }
    else
    {
      sub_2289DBD50((uint64_t)v17, &qword_2559DA638);
      v14 = 0u;
      v15 = 0u;
    }
    sub_2289D8330((uint64_t)&v14, (uint64_t)v17);
  }
  sub_2289D8330((uint64_t)v17, (uint64_t)&v14);
  if (*((_QWORD *)&v15 + 1))
  {
    if (swift_dynamicCast())
      return v11;
    else
      return 0;
  }
  else
  {
    sub_2289DBD50((uint64_t)&v14, &qword_2559DA638);
    return 0;
  }
}

uint64_t sub_2289D92C4()
{
  void *v0;
  uint64_t v2;
  _OWORD v3[2];
  _BYTE v4[24];
  uint64_t v5;

  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x24BE75AC8]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_2289D8330((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    sub_2289DC110(0, &qword_2559DA758);
    if ((swift_dynamicCast() & 1) != 0)
      return v2;
  }
  else
  {
    sub_2289DBD50((uint64_t)v4, &qword_2559DA638);
  }
  return 0;
}

uint64_t sub_2289D9398()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v4;
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  sub_2289EABC4();
  v1 = (void *)sub_2289EABAC();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_propertyForKey_, v1);

  if (v2)
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_2289D8330((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    sub_2289DC110(0, &qword_2559DA758);
    if ((swift_dynamicCast() & 1) != 0)
      return v4;
  }
  else
  {
    sub_2289DBD50((uint64_t)v6, &qword_2559DA638);
  }
  return 0;
}

uint64_t sub_2289D94A8()
{
  void *v0;
  uint64_t v2;
  _OWORD v3[2];
  _BYTE v4[24];
  uint64_t v5;

  if (objc_msgSend(v0, sel_cellType))
    return 0;
  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x24BE75A68]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_2289D8330((uint64_t)v3, (uint64_t)v4);
  if (!v5)
  {
    sub_2289DBD50((uint64_t)v4, &qword_2559DA638);
    return 0;
  }
  if (swift_dynamicCast())
    return v2;
  else
    return 0;
}

uint64_t sub_2289D958C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
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
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[24];
  uint64_t v32;

  v1 = v0;
  if (objc_msgSend(v0, sel_cellType))
    return 0;
  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x24BE75A58]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
  }
  sub_2289D8330((uint64_t)&v29, (uint64_t)v31);
  if (v32)
  {
    if (swift_dynamicCast())
    {
      v2 = v27;
      v4 = v28;
      goto LABEL_12;
    }
  }
  else
  {
    sub_2289DBD50((uint64_t)v31, &qword_2559DA638);
  }
  v2 = 0;
  v4 = 0xE000000000000000;
LABEL_12:
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if (objc_msgSend(v1, sel_propertyForKey_, *MEMORY[0x24BE75A40]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
  }
  sub_2289D8330((uint64_t)&v29, (uint64_t)v31);
  if (v32)
    swift_dynamicCast();
  else
    sub_2289DBD50((uint64_t)v31, &qword_2559DA638);
  v6 = (NSString *)sub_2289EABAC();
  swift_bridgeObjectRelease();
  NSRangeFromString(v6);

  v7 = sub_2289EAC24();
  if ((v9 & 1) != 0)
    return v2;
  v10 = v7;
  v11 = v8;
  swift_bridgeObjectRetain();
  v12 = sub_2289EAC0C();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  swift_bridgeObjectRelease();
  v19 = MEMORY[0x22E2B8040](v12, v14, v16, v18);
  result = swift_bridgeObjectRelease();
  if (v11 >> 14 >= v10 >> 14)
  {
    v20 = sub_2289EAC0C();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    swift_bridgeObjectRelease();
    MEMORY[0x22E2B8040](v20, v22, v24, v26);
    swift_bridgeObjectRelease();
    return v19;
  }
  __break(1u);
  return result;
}

uint64_t sub_2289D9864()
{
  void *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;

  if (objc_msgSend(v0, sel_cellType) == (id)6
    && objc_msgSend(v0, sel_hasValidGetter)
    && objc_msgSend(v0, sel_hasValidSetter))
  {
    v1 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v2 = (_QWORD *)swift_allocObject();
    v2[2] = 0;
    v2[3] = 0;
    v2[4] = v1;
    v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v4 = (_QWORD *)swift_allocObject();
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = v3;
    sub_2289EAB64();
  }
  else
  {
    sub_2289EAB70();
  }
  return v6;
}

void sub_2289D999C(uint64_t a1@<X2>, unsigned __int8 *a2@<X8>)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t inited;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  unsigned __int8 v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  NSObject *v56;
  _QWORD *v57;
  uint8_t *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint8_t *v65;
  uint64_t v66;
  _QWORD *v67;
  uint8_t *v68;
  unsigned __int8 *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;

  v4 = sub_2289EA720();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v67 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v67 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v67 - v15;
  v17 = a1 + 16;
  swift_beginAccess();
  v18 = (void *)MEMORY[0x22E2B86AC](v17);
  if (!v18)
  {
    v72 = 0u;
    v73 = 0u;
LABEL_12:
    sub_2289DBD50((uint64_t)&v72, &qword_2559DA638);
LABEL_13:
    swift_beginAccess();
    v31 = MEMORY[0x22E2B86AC](v17);
    if (v31)
    {
      v32 = (void *)v31;
      v33 = (void *)sub_2289EABAC();
      v34 = objc_msgSend(v32, sel_propertyForKey_, v33);

      if (v34)
      {
        sub_2289EAC9C();
        swift_unknownObjectRelease();
      }
      else
      {
        v71 = 0u;
        v70 = 0u;
      }
      v35 = v5;
      sub_2289D8330((uint64_t)&v70, (uint64_t)&v72);
      if (*((_QWORD *)&v73 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v36 = v70;
          v37 = HIBYTE(*((_QWORD *)&v70 + 1)) & 0xFLL;
          if ((*((_QWORD *)&v70 + 1) & 0x2000000000000000) == 0)
            v37 = v70 & 0xFFFFFFFFFFFFLL;
          if (v37)
          {
            if (qword_2559DA3D0 != -1)
              swift_once();
            v38 = __swift_project_value_buffer(v4, (uint64_t)qword_2559DB950);
            (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v38, v4);
            swift_bridgeObjectRetain();
            v39 = sub_2289EA708();
            v40 = sub_2289EAC48();
            if (os_log_type_enabled(v39, v40))
            {
              v41 = (uint8_t *)swift_slowAlloc();
              v42 = swift_slowAlloc();
              v69 = a2;
              v43 = v42;
              *(_QWORD *)&v72 = v42;
              v68 = (uint8_t *)v5;
              *(_DWORD *)v41 = 136315138;
              swift_bridgeObjectRetain();
              *(_QWORD *)&v70 = sub_2289E49DC(v36, *((unint64_t *)&v36 + 1), (uint64_t *)&v72);
              sub_2289EAC84();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_2289D4000, v39, v40, "No value returned from some getter of specifier for bundleIdentifier '%s.", v41, 0xCu);
              swift_arrayDestroy();
              v44 = v43;
              a2 = v69;
              MEMORY[0x22E2B8634](v44, -1, -1);
              MEMORY[0x22E2B8634](v41, -1, -1);

              (*((void (**)(char *, uint64_t))v68 + 1))(v11, v4);
            }
            else
            {

              swift_bridgeObjectRelease_n();
              (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
            }
LABEL_33:
            v30 = 0;
            goto LABEL_34;
          }
          swift_bridgeObjectRelease();
        }
LABEL_28:
        if (qword_2559DA3D0 != -1)
          swift_once();
        v45 = __swift_project_value_buffer(v4, (uint64_t)qword_2559DB950);
        (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v8, v45, v4);
        v46 = sub_2289EA708();
        v47 = sub_2289EAC48();
        if (os_log_type_enabled(v46, v47))
        {
          v48 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v48 = 0;
          _os_log_impl(&dword_2289D4000, v46, v47, "No value returned from getter of specifier (no bundleIdentifier found).", v48, 2u);
          MEMORY[0x22E2B8634](v48, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v4);
        goto LABEL_33;
      }
    }
    else
    {
      v72 = 0u;
      v73 = 0u;
      v35 = v5;
    }
    sub_2289DBD50((uint64_t)&v72, &qword_2559DA638);
    goto LABEL_28;
  }
  v19 = v18;
  v69 = a2;
  v20 = objc_msgSend(v18, sel_performGetter);

  if (v20)
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    v71 = 0u;
    v70 = 0u;
  }
  sub_2289D8330((uint64_t)&v70, (uint64_t)&v72);
  a2 = v69;
  if (!*((_QWORD *)&v73 + 1))
    goto LABEL_12;
  sub_2289DC110(0, &qword_2559DA760);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_13;
  v21 = (void *)v70;
  objc_opt_self();
  if (!swift_dynamicCastObjCClass()
    || (v72 = 0uLL, v22 = v21, sub_2289EABB8(), v22, (v23 = *((_QWORD *)&v72 + 1)) == 0))
  {
    objc_opt_self();
    v49 = (void *)swift_dynamicCastObjCClass();
    if (v49)
    {
      v30 = objc_msgSend(v49, sel_BOOLValue);

      goto LABEL_34;
    }
    v50 = v5;
    if (qword_2559DA3D0 != -1)
      swift_once();
    v51 = __swift_project_value_buffer(v4, (uint64_t)qword_2559DB950);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v14, v51, v4);
    v52 = v21;
    v53 = sub_2289EA708();
    v54 = sub_2289EAC48();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      v67 = (_QWORD *)swift_slowAlloc();
      v68 = v55;
      *(_DWORD *)v55 = 138543362;
      *(_QWORD *)&v72 = v52;
      v56 = v52;
      v50 = v5;
      a2 = v69;
      sub_2289EAC84();
      v57 = v67;
      *v67 = v52;

      v58 = v68;
      _os_log_impl(&dword_2289D4000, v53, v54, "Could not resolve value of type '%{public}@' to a BOOLean.", v68, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA768);
      swift_arrayDestroy();
      MEMORY[0x22E2B8634](v57, -1, -1);
      MEMORY[0x22E2B8634](v58, -1, -1);
    }
    else
    {

      v53 = v52;
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v14, v4);
    goto LABEL_33;
  }
  v24 = v72;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA770);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2289EB680;
  *(_QWORD *)(inited + 32) = 1702195828;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  *(_QWORD *)(inited + 48) = 7562617;
  *(_QWORD *)(inited + 56) = 0xE300000000000000;
  *(_QWORD *)(inited + 64) = 49;
  *(_QWORD *)(inited + 72) = 0xE100000000000000;
  *(_QWORD *)(inited + 80) = 121;
  *(_QWORD *)(inited + 88) = 0xE100000000000000;
  v26 = sub_2289DBF70(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v27 = sub_2289EABD0();
  v29 = sub_2289DA3BC(v27, v28, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v29 & 1) != 0)
  {
    swift_bridgeObjectRelease();

    v30 = 1;
LABEL_53:
    a2 = v69;
    goto LABEL_34;
  }
  v59 = (void *)sub_2289EABAC();
  v60 = (uint64_t)objc_msgSend(v59, sel_integerValue);

  a2 = v69;
  if (v60 < 1)
  {
    if (qword_2559DA3D0 != -1)
      swift_once();
    v61 = __swift_project_value_buffer(v4, (uint64_t)qword_2559DB950);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v16, v61, v4);
    swift_bridgeObjectRetain();
    v62 = sub_2289EA708();
    v63 = sub_2289EAC48();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = swift_slowAlloc();
      v68 = (uint8_t *)v5;
      v65 = (uint8_t *)v64;
      v66 = swift_slowAlloc();
      *(_QWORD *)&v72 = v66;
      *(_DWORD *)v65 = 136446210;
      v67 = v65 + 4;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v70 = sub_2289E49DC(v24, v23, (uint64_t *)&v72);
      sub_2289EAC84();
      swift_bridgeObjectRelease_n();
      swift_arrayDestroy();
      MEMORY[0x22E2B8634](v66, -1, -1);
      MEMORY[0x22E2B8634](v65, -1, -1);

      (*((void (**)(char *, uint64_t))v68 + 1))(v16, v4);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
    }
    v30 = 0;
    goto LABEL_53;
  }
  swift_bridgeObjectRelease();

  v30 = 1;
LABEL_34:
  *a2 = v30;
}

uint64_t sub_2289DA3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
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

  if (*(_QWORD *)(a3 + 16))
  {
    sub_2289EADB0();
    sub_2289EABE8();
    v6 = sub_2289EADBC();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_2289EAD98() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_2289EAD98() & 1) != 0)
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

void sub_2289DA4F0(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v4 = *a1;
  v5 = a4 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x22E2B86AC](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v4);
    objc_msgSend(v7, sel_performSetterWithValue_, v8);

  }
  v9 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_2559DA3C8 != -1)
    swift_once();
  v10 = qword_2559DB948;
  swift_beginAccess();
  v11 = (void *)MEMORY[0x22E2B86AC](v5);
  objc_msgSend(v9, sel_postNotificationName_object_, v10, v11);

}

double sub_2289DA614()
{
  void *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  double v6;

  if (objc_msgSend(v0, sel_cellType) == (id)5
    && objc_msgSend(v0, sel_hasValidGetter)
    && objc_msgSend(v0, sel_hasValidSetter))
  {
    v1 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v2 = (_QWORD *)swift_allocObject();
    v2[2] = 0;
    v2[3] = 0;
    v2[4] = v1;
    v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v4 = (_QWORD *)swift_allocObject();
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = v3;
    sub_2289EAB64();
  }
  else
  {
    sub_2289EAB70();
  }
  return v6;
}

void sub_2289DA74C(uint64_t a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v4;
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
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint8_t *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  NSObject *v42;
  _QWORD *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint8_t *v46;
  _QWORD *v47;
  uint8_t *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v4 = sub_2289EA720();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v46 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v46 - v12;
  v14 = a1 + 16;
  swift_beginAccess();
  v15 = (void *)MEMORY[0x22E2B86AC](v14);
  if (!v15)
  {
    v51 = 0u;
    v52 = 0u;
LABEL_11:
    sub_2289DBD50((uint64_t)&v51, &qword_2559DA638);
LABEL_12:
    swift_beginAccess();
    v22 = MEMORY[0x22E2B86AC](v14);
    if (v22)
    {
      v23 = (void *)v22;
      v24 = (void *)sub_2289EABAC();
      v25 = objc_msgSend(v23, sel_propertyForKey_, v24);

      if (v25)
      {
        sub_2289EAC9C();
        swift_unknownObjectRelease();
      }
      else
      {
        v49 = 0u;
        v50 = 0u;
      }
      sub_2289D8330((uint64_t)&v49, (uint64_t)&v51);
      if (*((_QWORD *)&v52 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v26 = v49;
          v27 = HIBYTE(*((_QWORD *)&v49 + 1)) & 0xFLL;
          if ((*((_QWORD *)&v49 + 1) & 0x2000000000000000) == 0)
            v27 = v49 & 0xFFFFFFFFFFFFLL;
          if (v27)
          {
            if (qword_2559DA3D0 != -1)
              swift_once();
            v28 = __swift_project_value_buffer(v4, (uint64_t)qword_2559DB950);
            (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v28, v4);
            swift_bridgeObjectRetain();
            v29 = sub_2289EA708();
            v30 = sub_2289EAC48();
            if (os_log_type_enabled(v29, v30))
            {
              v31 = (uint8_t *)swift_slowAlloc();
              v48 = (uint8_t *)swift_slowAlloc();
              *(_QWORD *)&v51 = v48;
              *(_DWORD *)v31 = 136315138;
              v47 = v31 + 4;
              swift_bridgeObjectRetain();
              *(_QWORD *)&v49 = sub_2289E49DC(v26, *((unint64_t *)&v26 + 1), (uint64_t *)&v51);
              sub_2289EAC84();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_2289D4000, v29, v30, "No value returned from some getter of specifier for bundleIdentifier '%s.", v31, 0xCu);
              v32 = v48;
              swift_arrayDestroy();
              MEMORY[0x22E2B8634](v32, -1, -1);
              MEMORY[0x22E2B8634](v31, -1, -1);

            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
            goto LABEL_32;
          }
          swift_bridgeObjectRelease();
        }
LABEL_27:
        if (qword_2559DA3D0 != -1)
          swift_once();
        v33 = __swift_project_value_buffer(v4, (uint64_t)qword_2559DB950);
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v33, v4);
        v34 = sub_2289EA708();
        v35 = sub_2289EAC48();
        if (os_log_type_enabled(v34, v35))
        {
          v36 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_2289D4000, v34, v35, "No value returned from getter of specifier (no bundleIdentifier found).", v36, 2u);
          MEMORY[0x22E2B8634](v36, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        goto LABEL_32;
      }
    }
    else
    {
      v51 = 0u;
      v52 = 0u;
    }
    sub_2289DBD50((uint64_t)&v51, &qword_2559DA638);
    goto LABEL_27;
  }
  v16 = v15;
  v17 = objc_msgSend(v15, sel_performGetter);

  if (v17)
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    v49 = 0u;
    v50 = 0u;
  }
  sub_2289D8330((uint64_t)&v49, (uint64_t)&v51);
  if (!*((_QWORD *)&v52 + 1))
    goto LABEL_11;
  sub_2289DC110(0, &qword_2559DA760);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_12;
  v18 = (void *)v49;
  objc_opt_self();
  v19 = (void *)swift_dynamicCastObjCClass();
  if (!v19)
  {
    objc_opt_self();
    v19 = (void *)swift_dynamicCastObjCClass();
    if (!v19)
    {
      if (qword_2559DA3D0 != -1)
        swift_once();
      v37 = __swift_project_value_buffer(v4, (uint64_t)qword_2559DB950);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v37, v4);
      v38 = v18;
      v39 = sub_2289EA708();
      v40 = sub_2289EAC48();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        v47 = (_QWORD *)swift_slowAlloc();
        v48 = v41;
        *(_DWORD *)v41 = 138543362;
        v46 = v41 + 4;
        *(_QWORD *)&v51 = v38;
        v42 = v38;
        sub_2289EAC84();
        v43 = v47;
        *v47 = v38;

        v44 = v40;
        v45 = v48;
        _os_log_impl(&dword_2289D4000, v39, v44, "Could not resolve value of type '%{public}@' to a double.", v48, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA768);
        swift_arrayDestroy();
        MEMORY[0x22E2B8634](v43, -1, -1);
        MEMORY[0x22E2B8634](v45, -1, -1);
      }
      else
      {

        v39 = v38;
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
LABEL_32:
      v21 = 0;
      goto LABEL_33;
    }
  }
  objc_msgSend(v19, sel_doubleValue);
  v21 = v20;

LABEL_33:
  *a2 = v21;
}

void sub_2289DAE0C(double *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v4 = *a1;
  v5 = a4 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x22E2B86AC](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v4);
    objc_msgSend(v7, sel_performSetterWithValue_, v8);

  }
  v9 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_2559DA3C8 != -1)
    swift_once();
  v10 = qword_2559DB948;
  swift_beginAccess();
  v11 = (void *)MEMORY[0x22E2B86AC](v5);
  objc_msgSend(v9, sel_postNotificationName_object_, v10, v11);

}

uint64_t sub_2289DAF38@<X0>(uint64_t a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t result;
  id v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = (void *)MEMORY[0x22E2B86AC](v3);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_performGetter);

    if (v6)
    {
      sub_2289EAC9C();
      swift_unknownObjectRelease();
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
    }
    sub_2289D8330((uint64_t)&v14, (uint64_t)v16);
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_2289D8448((uint64_t)v16, (uint64_t)&v14);
  if (!*((_QWORD *)&v15 + 1))
  {
    sub_2289DBD50((uint64_t)&v14, &qword_2559DA638);
LABEL_11:
    sub_2289D8448((uint64_t)v16, (uint64_t)&v14);
    if (*((_QWORD *)&v15 + 1))
    {
      sub_2289DC110(0, &qword_2559DA780);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v9 = objc_msgSend(v12, sel_stringValue);
        v7 = sub_2289EABC4();
        v8 = v10;

        goto LABEL_16;
      }
    }
    else
    {
      sub_2289DBD50((uint64_t)&v14, &qword_2559DA638);
    }
    v7 = 0;
    v8 = 0xE000000000000000;
    goto LABEL_16;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_11;
  v7 = (uint64_t)v12;
  v8 = v13;
LABEL_16:
  result = sub_2289DBD50((uint64_t)v16, &qword_2559DA638);
  *a2 = v7;
  a2[1] = v8;
  return result;
}

void sub_2289DB0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v4 = a4 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x22E2B86AC](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)sub_2289EABAC();
    objc_msgSend(v6, sel_performSetterWithValue_, v7);

  }
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_2559DA3C8 != -1)
    swift_once();
  v9 = qword_2559DB948;
  swift_beginAccess();
  v10 = (void *)MEMORY[0x22E2B86AC](v4);
  objc_msgSend(v8, sel_postNotificationName_object_, v9, v10);

}

id sub_2289DB200()
{
  void *v0;
  id v1;
  objc_class *ObjCClassFromMetadata;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  if (!objc_msgSend((id)objc_opt_self(), sel_cellClassForSpecifier_, v0))
    return 0;
  swift_getObjCClassMetadata();
  sub_2289DC110(0, &qword_2559DA740);
  v1 = (id)swift_dynamicCastMetatype();
  if (!v1)
    return v1;
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  sub_2289DC110(0, &qword_2559DA748);
  if (!-[objc_class isSubclassOfClass:](ObjCClassFromMetadata, sel_isSubclassOfClass_, swift_getObjCClassFromMetadata()))return objc_msgSend(objc_allocWithZone(ObjCClassFromMetadata), sel_initWithStyle_reuseIdentifier_, 1, 0);
  if (!swift_dynamicCastMetatype())
    return 0;
  v3 = (void *)swift_getObjCClassFromMetadata();
  v4 = objc_msgSend(v3, sel_cellStyle);
  v5 = objc_msgSend(v3, sel_reuseIdentifierForSpecifier_, v0);
  if (v5)
  {
    sub_2289EABC4();

    v6 = v0;
    v5 = (id)sub_2289EABAC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = v0;
  }
  v1 = objc_msgSend(objc_allocWithZone((Class)v3), sel_initWithStyle_reuseIdentifier_specifier_, v4, v5, v0);

  return v1;
}

double sub_2289DB3A0()
{
  void *v0;
  uint64_t v1;
  id v2;
  double v3;
  double v4;
  id v6;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  *(_QWORD *)&v7[0] = sub_2289EABC4();
  *((_QWORD *)&v7[0] + 1) = v1;
  v2 = objc_msgSend(v0, sel_objectForKeyedSubscript_, sub_2289EADA4());
  swift_unknownObjectRelease();
  if (v2)
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_2289D8330((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    sub_2289DBD50((uint64_t)v8, &qword_2559DA638);
    return 0.0;
  }
  sub_2289DC110(0, &qword_2559DA780);
  if ((swift_dynamicCast() & 1) == 0)
    return 0.0;
  objc_msgSend(v6, sel_doubleValue);
  v4 = v3;

  return v4;
}

double sub_2289DB4CC()
{
  void *v0;
  uint64_t v1;
  id v2;
  double v3;
  double v4;
  id v6;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  *(_QWORD *)&v7[0] = sub_2289EABC4();
  *((_QWORD *)&v7[0] + 1) = v1;
  v2 = objc_msgSend(v0, sel_objectForKeyedSubscript_, sub_2289EADA4());
  swift_unknownObjectRelease();
  if (v2)
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_2289D8330((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    sub_2289DBD50((uint64_t)v8, &qword_2559DA638);
    return 1.0;
  }
  sub_2289DC110(0, &qword_2559DA780);
  if ((swift_dynamicCast() & 1) == 0)
    return 1.0;
  objc_msgSend(v6, sel_doubleValue);
  v4 = v3;

  return v4;
}

uint64_t sub_2289DB5F8()
{
  void *v0;
  uint64_t result;
  unsigned __int8 v2;
  _OWORD v3[2];
  _BYTE v4[24];
  uint64_t v5;

  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x24BE75B28]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_2289D8330((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    result = swift_dynamicCast();
    if ((_DWORD)result)
      return v2;
  }
  else
  {
    sub_2289DBD50((uint64_t)v4, &qword_2559DA638);
    return 0;
  }
  return result;
}

uint64_t sub_2289DB6B8()
{
  void *v0;
  unsigned __int8 v2;
  _OWORD v3[2];
  _BYTE v4[24];
  uint64_t v5;

  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x24BE75A18]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_2289D8330((uint64_t)v3, (uint64_t)v4);
  if (v5)
  {
    if (swift_dynamicCast())
      return v2;
  }
  else
  {
    sub_2289DBD50((uint64_t)v4, &qword_2559DA638);
  }
  return 1;
}

uint64_t sub_2289DB778()
{
  void *v0;
  objc_class *ObjCClassFromMetadata;
  NSString *v2;
  uint64_t v3;
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x24BE75948]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_2289D8330((uint64_t)v5, (uint64_t)v6);
  if (!v7)
  {
    sub_2289DBD50((uint64_t)v6, &qword_2559DA638);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA738);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v2 = NSStringFromClass(ObjCClassFromMetadata);
  v3 = sub_2289EABC4();

  return v3;
}

uint64_t sub_2289DB878()
{
  void *v0;
  objc_class *ObjCClassFromMetadata;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[2];
  _BYTE v11[24];
  uint64_t v12;

  if (!objc_msgSend(v0, sel_cellType))
  {
    if (objc_msgSend(v0, sel_propertyForKey_, *MEMORY[0x24BE75A30]))
    {
      sub_2289EAC9C();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v10, 0, sizeof(v10));
    }
    sub_2289D8330((uint64_t)v10, (uint64_t)v11);
    if (v12)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2289DC110(0, &qword_2559DA750);
        ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
        v3 = NSStringFromClass(ObjCClassFromMetadata);
        v4 = sub_2289EABC4();
        v6 = v5;

        if (v8 == v4 && v9 == v6)
        {
          swift_bridgeObjectRelease_n();
          return 1;
        }
        v7 = sub_2289EAD98();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v7 & 1) != 0)
          return 1;
      }
    }
    else
    {
      sub_2289DBD50((uint64_t)v11, &qword_2559DA638);
    }
  }
  return 0;
}

uint64_t sub_2289DB9F4()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v1 = objc_msgSend(v0, sel_identifier);
  if (!v1)
    goto LABEL_9;
  v2 = v1;
  v3 = sub_2289EABC4();
  v5 = v4;

  if (!v5)
    goto LABEL_9;
  if (v3 == 0x4143494649544F4ELL && v5 == 0xED0000534E4F4954)
    goto LABEL_12;
  v7 = sub_2289EAD98();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0)
  {
LABEL_9:
    v9 = sub_2289DB778();
    if (!v10)
    {
      v8 = 0;
      return v8 & 1;
    }
    if (v9 != 0xD00000000000002BLL || v10 != 0x80000002289EF050)
    {
      v8 = sub_2289EAD98();
      goto LABEL_15;
    }
LABEL_12:
    v8 = 1;
LABEL_15:
    swift_bridgeObjectRelease();
    return v8 & 1;
  }
  v8 = 1;
  return v8 & 1;
}

void sub_2289DBB2C()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;

  v1 = objc_msgSend(v0, sel_identifier);
  if (!v1 || (v2 = v1, v3 = sub_2289EABC4(), v5 = v4, v2, !v5))
  {
LABEL_8:
    v8 = sub_2289DB778();
    if (!v9)
      return;
    if (v8 != 0xD00000000000002BLL || v9 != 0x80000002289EF050)
    {
      v10 = sub_2289EAD98();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
        return;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 != 0x4143494649544F4ELL || v5 != 0xED0000534E4F4954)
  {
    v7 = sub_2289EAD98();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      goto LABEL_13;
    goto LABEL_8;
  }
LABEL_11:
  swift_bridgeObjectRelease();
LABEL_13:
  v11 = sub_2289DB200();
  if (v11)
  {
    v19 = v11;
    objc_opt_self();
    v12 = (void *)swift_dynamicCastObjCClass();
    if (v12
      && (v13 = v12,
          objc_msgSend(v12, sel_refreshCellContentsWithSpecifier_, v0),
          (v14 = objc_msgSend(v13, sel_detailTextLabel)) != 0)
      && (v15 = v14, v16 = objc_msgSend(v14, sel_text), v15, v16))
    {
      sub_2289EABC4();

      v17 = sub_2289EABAC();
      swift_bridgeObjectRelease();
      objc_msgSend(v0, sel_setProperty_forKey_, v17, *MEMORY[0x24BE75DA0]);

      v18 = (void *)v17;
    }
    else
    {
      v18 = v19;
    }

  }
}

uint64_t sub_2289DBD50(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2289DBD8C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

unint64_t sub_2289DBDC0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2289EACB4();
  return sub_2289DBE2C(a1, v2);
}

uint64_t sub_2289DBDF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2289DBE2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_2289DBEF0(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x22E2B8124](v9, a1);
      sub_2289DBD8C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_2289DBEF0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_2289DBF2C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2289DBF54(unsigned __int8 *a1@<X8>)
{
  uint64_t v1;

  sub_2289D999C(*(_QWORD *)(v1 + 32), a1);
}

void sub_2289DBF64(unsigned __int8 *a1)
{
  uint64_t *v1;

  sub_2289DA4F0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2289DBF70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA778);
    v3 = sub_2289EACD8();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_2289EADB0();
      swift_bridgeObjectRetain();
      sub_2289EABE8();
      result = sub_2289EADBC();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_2289EAD98(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_2289EAD98();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_2289DC110(uint64_t a1, unint64_t *a2)
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

void sub_2289DC14C(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_2289DA74C(*(_QWORD *)(v1 + 32), a1);
}

void sub_2289DC15C(double *a1)
{
  uint64_t *v1;

  sub_2289DAE0C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2289DC16C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_2289DAF38(*(_QWORD *)(v1 + 32), a1);
}

uint64_t objectdestroy_2Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_2289DC1A8(uint64_t a1)
{
  uint64_t *v1;

  sub_2289DB0EC(a1, v1[2], v1[3], v1[4]);
}

uint64_t View.then(_:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, v3);
  return a1(a3);
}

ValueMetadata *type metadata accessor for SUIKPSecureTextFieldCell()
{
  return &type metadata for SUIKPSecureTextFieldCell;
}

uint64_t sub_2289DC210()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2289DC220@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  double v21;
  uint64_t result;
  _QWORD v23[4];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA788);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA790);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a3, sel_cellType) == (id)12)
  {
    *(_QWORD *)v10 = sub_2289EA858();
    *((_QWORD *)v10 + 1) = 0;
    v10[16] = 1;
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA798);
    v15 = a2 & 1;
    sub_2289DC4E4(a3, (uint64_t)&v10[*(int *)(v14 + 44)]);
    KeyPath = swift_getKeyPath();
    v17 = sub_2289EABC4();
    v19 = v18;
    sub_2289DCA60((uint64_t)v10, (uint64_t)v13, &qword_2559DA788);
    v20 = (uint64_t *)&v13[*(int *)(v11 + 36)];
    *v20 = KeyPath;
    v20[1] = v17;
    v20[2] = v19;
    sub_2289DBD50((uint64_t)v10, &qword_2559DA788);
    sub_2289D6BCC(a1, v15);
    LOBYTE(v17) = sub_2289E8AA4(a1, v15);
    sub_2289D6C04(a1, v15);
    if ((v17 & 1) != 0)
      v21 = 1.0;
    else
      v21 = 0.5;
    sub_2289DCA60((uint64_t)v13, a4, &qword_2559DA790);
    *(double *)(a4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559DA7A0) + 36)) = v21;
    return sub_2289DBD50((uint64_t)v13, &qword_2559DA790);
  }
  else
  {
    v23[2] = 0;
    v23[3] = 0xE000000000000000;
    sub_2289EACE4();
    sub_2289EABF4();
    v23[1] = objc_msgSend(a3, sel_cellType);
    type metadata accessor for PSTableCellType();
    sub_2289EAD50();
    sub_2289EABF4();
    result = sub_2289EAD68();
    __break(1u);
  }
  return result;
}

uint64_t sub_2289DC4E4@<X0>(void *a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  id v24;
  _BYTE *v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t OpaqueTypeConformance2;
  _BYTE *v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  void (*v39)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(_BYTE *, uint64_t);
  _BYTE v49[12];
  int v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA7A8);
  v54 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v52 = &v49[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA7B0);
  v56 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v55 = &v49[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA7B8);
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v58 = &v49[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA7C0);
  v64 = *(_QWORD *)(v7 - 8);
  v65 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v63 = &v49[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v62 = &v49[-v10];
  v11 = a1;
  v12 = sub_2289D8928();
  v14 = v13;

  if (v14)
  {
    v69 = v12;
    v70 = v14;
    sub_2289D6FBC();
    v15 = sub_2289EA9F0();
    v17 = v16;
    v19 = v18 & 1;
    sub_2289EA9A8();
    v67 = sub_2289EA9E4();
    v68 = v20;
    v22 = v21;
    v66 = v23;
    swift_release();
    v53 = v22 & 1;
    sub_2289D6FAC(v15, v17, v19);
    swift_bridgeObjectRelease();
    LOBYTE(v51) = sub_2289EA99C();
    v51 = v51;
    v50 = 1;
  }
  else
  {
    v67 = 0;
    v68 = 0;
    v53 = 0;
    v66 = 0;
    v51 = 0;
    v50 = 0;
  }
  sub_2289EA864();
  v24 = v11;
  sub_2289D8A84();

  v25 = v52;
  sub_2289EA774();
  objc_msgSend(v24, sel_suikp_keyboardType);
  v26 = sub_2289D7088(&qword_2559DA7C8, &qword_2559DA7A8, MEMORY[0x24BDEB760]);
  v27 = v55;
  v28 = v57;
  sub_2289EAA20();
  (*(void (**)(_BYTE *, uint64_t))(v54 + 8))(v25, v28);
  objc_msgSend(v24, sel_suikp_autoCapsType);
  v69 = v28;
  v70 = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v30 = v58;
  v31 = v60;
  sub_2289EAA50();
  (*(void (**)(_BYTE *, uint64_t))(v56 + 8))(v27, v31);
  v32 = objc_msgSend(v24, sel_suikp_autoCorrectionType) == (id)1;
  v69 = v31;
  v70 = OpaqueTypeConformance2;
  v33 = swift_getOpaqueTypeConformance2();
  v34 = v63;
  v35 = v61;
  MEMORY[0x22E2B7ED8](v32, v61, v33);
  (*(void (**)(_BYTE *, uint64_t))(v59 + 8))(v30, v35);
  v37 = v64;
  v36 = v65;
  v38 = v62;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v64 + 32))(v62, v34, v65);
  v39 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v37 + 16);
  v39(v34, v38, v36);
  v40 = v68;
  *(_QWORD *)a2 = v67;
  *(_QWORD *)(a2 + 8) = v40;
  v68 = v40;
  v41 = v53;
  v42 = v66;
  *(_QWORD *)(a2 + 16) = v53;
  *(_QWORD *)(a2 + 24) = v42;
  *(_QWORD *)(a2 + 32) = v51;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_BYTE *)(a2 + 72) = v50;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA7D0);
  v39((_BYTE *)(a2 + *(int *)(v43 + 48)), v34, v36);
  v44 = v67;
  v45 = v40;
  v46 = v66;
  sub_2289D6F3C(v67, v45, v41, v66);
  v47 = *(void (**)(_BYTE *, uint64_t))(v37 + 8);
  v47(v38, v36);
  v47(v34, v36);
  return sub_2289D6F7C(v44, v68, v41, v46);
}

uint64_t sub_2289DC9E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2289DC220(*(_QWORD *)v1, *(_BYTE *)(v1 + 8), *(void **)(v1 + 24), a1);
}

uint64_t sub_2289DC9FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2289EA7EC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2289DCA24()
{
  swift_bridgeObjectRetain();
  return sub_2289EA7F8();
}

uint64_t sub_2289DCA60(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_2289DCAA8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DA7D8;
  if (!qword_2559DA7D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA7A0);
    v2[0] = sub_2289DCB14();
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DA7D8);
  }
  return result;
}

unint64_t sub_2289DCB14()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DA7E0;
  if (!qword_2559DA7E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA790);
    v2[0] = sub_2289D7088(&qword_2559DA7E8, &qword_2559DA788, MEMORY[0x24BDF4498]);
    v2[1] = sub_2289D7088(&qword_2559DA7F0, &qword_2559DA7F8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DA7E0);
  }
  return result;
}

uint64_t *sub_2289DCBB0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  id v17;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_2289EA894();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    swift_unknownObjectWeakCopyInit();
    v9 = *(int *)(a3 + 24);
    v10 = *(int *)(a3 + 28);
    v11 = (uint64_t *)((char *)a1 + v9);
    v12 = (uint64_t *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = (uint64_t *)((char *)a1 + v10);
    v15 = (uint64_t *)((char *)a2 + v10);
    v16 = (void *)v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
    v17 = v16;
  }
  return a1;
}

void sub_2289DCCB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_2289EA894();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

}

_QWORD *sub_2289DCD48(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  id v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_2289EA894();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  swift_unknownObjectWeakCopyInit();
  v7 = *(int *)(a3 + 24);
  v8 = *(int *)(a3 + 28);
  v9 = (_QWORD *)((char *)a1 + v7);
  v10 = (_QWORD *)((char *)a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)((char *)a1 + v8);
  v13 = (_QWORD *)((char *)a2 + v8);
  v14 = (void *)v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  v15 = v14;
  return a1;
}

_QWORD *sub_2289DCE24(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;

  if (a1 != a2)
  {
    sub_2289DBD50((uint64_t)a1, &qword_2559DA800);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_2289EA894();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  swift_unknownObjectWeakCopyAssign();
  v7 = *(int *)(a3 + 24);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 28);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v13 = (void *)v12[1];
  v14 = (void *)v11[1];
  v11[1] = v13;
  v15 = v13;

  return a1;
}

char *sub_2289DCF40(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_2289EA894();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  swift_unknownObjectWeakTakeInit();
  v8 = *(int *)(a3 + 28);
  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  return a1;
}

char *sub_2289DD000(char *a1, char *a2, uint64_t a3)
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
  void *v18;

  if (a1 != a2)
  {
    sub_2289DBD50((uint64_t)a1, &qword_2559DA800);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_2289EA894();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  swift_unknownObjectWeakTakeAssign();
  v8 = *(int *)(a3 + 24);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  v13 = *(int *)(a3 + 28);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v17 = *(_QWORD *)v15;
  v16 = *((_QWORD *)v15 + 1);
  v18 = (void *)*((_QWORD *)v14 + 1);
  *(_QWORD *)v14 = v17;
  *((_QWORD *)v14 + 1) = v16;

  return a1;
}

uint64_t sub_2289DD0FC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2289DD108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2559DA808);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2289DD18C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2289DD198(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_2559DA808);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for SUIKPFooterHyperlinkView()
{
  uint64_t result;

  result = qword_2559DA868;
  if (!qword_2559DA868)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2289DD254()
{
  unint64_t v0;

  sub_2289DD2D8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2289DD2D8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2559DA878[0])
  {
    sub_2289EA894();
    v0 = sub_2289EA768();
    if (!v1)
      atomic_store(v0, qword_2559DA878);
  }
}

uint64_t sub_2289DD32C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2289DD33C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t result;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t KeyPath;
  _QWORD *v29;
  id v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v1 = v0 + *(int *)(type metadata accessor for SUIKPFooterHyperlinkView() + 28);
  v2 = *(id *)(v1 + 8);
  sub_2289D958C();
  v4 = v3;
  v6 = v5;

  if (objc_msgSend(v2, sel_propertyForKey_, *MEMORY[0x24BE75A50]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
  }
  sub_2289D8330((uint64_t)&v43, (uint64_t)&v45);
  if (!v46)
  {
    sub_2289DBD50((uint64_t)&v45, &qword_2559DA638);
    goto LABEL_23;
  }
  sub_2289D83F4(&v45, &v37);
  sub_2289DC110(0, &qword_2559DA8D0);
  swift_dynamicCast();
  if (!v35)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_24:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_25;
  }
  if (objc_msgSend(v35, sel_nonretainedObjectValue))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
  }
  sub_2289D8330((uint64_t)&v43, (uint64_t)&v45);
  if (v46)
  {
    sub_2289D83F4(&v45, &v37);
    sub_2289DC110(0, &qword_2559DA760);
    swift_dynamicCast();
    v34 = v35;
  }
  else
  {
    sub_2289DBD50((uint64_t)&v45, &qword_2559DA638);
    v34 = 0;
  }
  if (objc_msgSend(*(id *)(v1 + 8), sel_propertyForKey_, *MEMORY[0x24BE75A38]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
  }
  sub_2289D8330((uint64_t)&v43, (uint64_t)&v45);
  v7 = v6;
  if (v46)
  {
    sub_2289D83F4(&v45, &v37);
    swift_dynamicCast();
    v8 = v35;
    v33 = v36;
  }
  else
  {
    sub_2289DBD50((uint64_t)&v45, &qword_2559DA638);
    v8 = 0;
    v33 = 0;
  }
  v9 = objc_msgSend((id)objc_opt_self(), sel_appearance);
  v10 = objc_msgSend(v9, sel_footerHyperlinkColor);

  if (!v10)
    goto LABEL_24;
  MEMORY[0x22E2B7F14](v10);
  if (!v4)
  {
LABEL_25:
    result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_26;
  }
  sub_2289EAAA4();
  v11 = sub_2289EA9CC();
  v13 = v12;
  v15 = v14;
  swift_bridgeObjectRelease();
  result = swift_release();
  if (v7)
  {
    v17 = v15 & 1;
    swift_retain();
    v18 = sub_2289EA9CC();
    v20 = v19;
    v22 = v21;
    swift_bridgeObjectRelease();
    swift_release();
    v23 = sub_2289EA9D8();
    v32 = v24;
    v26 = v25;
    v31 = v27;
    sub_2289D6FAC(v18, v20, v22 & 1);
    swift_bridgeObjectRelease();
    sub_2289D6FAC(v11, v13, v17);
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    *(_QWORD *)&v37 = v23;
    *((_QWORD *)&v37 + 1) = v26;
    v38 = v31 & 1;
    v39 = v32;
    v40 = KeyPath;
    v41 = 0;
    v42 = 1;
    v29 = (_QWORD *)swift_allocObject();
    v29[2] = v34;
    v29[3] = v8;
    v29[4] = v33;
    v30 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA8B0);
    sub_2289DD8CC();
    sub_2289EAA2C();

    swift_release();
    swift_release();
    sub_2289D6FAC(v37, *((uint64_t *)&v37 + 1), v38);
    swift_bridgeObjectRelease();
    return swift_release();
  }
LABEL_26:
  __break(1u);
  return result;
}

id sub_2289DD824(id result, uint64_t a2, uint64_t a3)
{
  void *v3;
  NSString *v4;
  SEL v5;

  if (result)
  {
    if (a3)
    {
      v3 = result;
      v4 = (NSString *)sub_2289EABAC();
      v5 = NSSelectorFromString(v4);

      return objc_msgSend(objc_retainAutorelease(v3), sel_performSelector_, v5);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_2289DD894()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_2289DD8C0()
{
  uint64_t v0;

  return sub_2289DD824(*(id *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

unint64_t sub_2289DD8CC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_2559DA8B8;
  if (!qword_2559DA8B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA8B0);
    v2 = sub_2289DD938();
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2559DA8B8);
  }
  return result;
}

unint64_t sub_2289DD938()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559DA8C0;
  if (!qword_2559DA8C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA8C8);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_2559DA8C0);
  }
  return result;
}

uint64_t sub_2289DD984()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA8B0);
  sub_2289DD8CC();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2289DD9D0(uint64_t a1)
{
  return sub_2289DDA20(a1, qword_2559DB950);
}

uint64_t sub_2289DD9F4(uint64_t a1)
{
  return sub_2289DDA20(a1, qword_2559DB968);
}

uint64_t sub_2289DDA20(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2289EA720();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2289EA714();
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

uint64_t ContentSizeCategory.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2289DDDAC((uint64_t (*)(_QWORD))MEMORY[0x24BDEEEA0], a1);
}

uint64_t ContentSizeCategory.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  uint64_t v6;
  uint64_t v8;

  v1 = sub_2289EA894();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
  v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == *MEMORY[0x24BDEEE58])
    return 0x6D53206172747845;
  if (v5 == *MEMORY[0x24BDEEE90])
    return 0x6C6C616D53;
  if (v5 == *MEMORY[0x24BDEEE98])
    return 0x6D756964654DLL;
  if (v5 == *MEMORY[0x24BDEEE88])
    return 0x656772614CLL;
  if (v5 == *MEMORY[0x24BDEEE50])
    return 0x614C206172747845;
  v6 = 0xD000000000000011;
  if (v5 != *MEMORY[0x24BDEEE60])
  {
    if (v5 == *MEMORY[0x24BDEEE30])
    {
      return 0xD000000000000017;
    }
    else if (v5 == *MEMORY[0x24BDEEE70])
    {
      return 0x756964654D205841;
    }
    else if (v5 == *MEMORY[0x24BDEEE68])
    {
      return 0x656772614C205841;
    }
    else if (v5 == *MEMORY[0x24BDEEE78])
    {
      return 0x6172747845205841;
    }
    else if (v5 == *MEMORY[0x24BDEEE40])
    {
      return 0xD000000000000014;
    }
    else if (v5 == *MEMORY[0x24BDEEE48])
    {
      return 0xD00000000000001ALL;
    }
    else
    {
      v6 = ContentSizeCategory.description.getter();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    }
  }
  return v6;
}

uint64_t ColorScheme.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2289DDDAC(MEMORY[0x24BDEB418], a1);
}

uint64_t sub_2289DDDAC@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v2, v4);
}

uint64_t sub_2289DDDE8()
{
  return sub_2289DDE40(&qword_2559DA8D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEEA0], MEMORY[0x24BDEEEB0]);
}

uint64_t sub_2289DDE14()
{
  return sub_2289DDE40((unint64_t *)&unk_2559DA8E0, MEMORY[0x24BDEB418], MEMORY[0x24BDEB438]);
}

uint64_t sub_2289DDE40(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2B85BC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2289DDE80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(a2, v2);
}

_QWORD *initializeBufferWithCopyOfBuffer for SUIKPDestinationViewControllerRepresentable(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = v3;
  return a1;
}

void destroy for SUIKPDestinationViewControllerRepresentable(uint64_t a1)
{

}

_QWORD *assignWithCopy for SUIKPDestinationViewControllerRepresentable(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  v3 = (void *)a2[1];
  v4 = (void *)a1[1];
  a1[1] = v3;
  v5 = v3;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for SUIKPDestinationViewControllerRepresentable(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;

  v3 = a2[1];
  v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for SUIKPDestinationViewControllerRepresentable(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SUIKPDestinationViewControllerRepresentable(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SUIKPDestinationViewControllerRepresentable()
{
  return &type metadata for SUIKPDestinationViewControllerRepresentable;
}

unint64_t sub_2289DDFE0()
{
  unint64_t result;

  result = qword_2559DA8F0;
  if (!qword_2559DA8F0)
  {
    result = MEMORY[0x22E2B85BC](&unk_2289EBA44, &type metadata for SUIKPDestinationViewControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_2559DA8F0);
  }
  return result;
}

id sub_2289DE024(int a1, int a2, id a3)
{
  uint64_t ObjCClassMetadata;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id result;

  if (!objc_msgSend(a3, sel_detailControllerClass))
  {
    result = (id)sub_2289EAD68();
    __break(1u);
    return result;
  }
  ObjCClassMetadata = swift_getObjCClassMetadata();
  if (ObjCClassMetadata == sub_2289DE2B0())
    goto LABEL_5;
  v5 = (id)CreateDetailControllerInstanceWithClass();
  if (!v5)
  {
    __break(1u);
LABEL_5:
    v6 = objc_allocWithZone((Class)type metadata accessor for SUIKPThirdPartyAppListController());
    v7 = a3;
    sub_2289D7150();
    v5 = v8;
    objc_msgSend(v8, sel_setSpecifier_, v7);

  }
  v9 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v9)
    objc_msgSend(v9, sel_setSpecifier_, a3);
  return v5;
}

id sub_2289DE150(int a1, int a2)
{
  uint64_t v2;

  return sub_2289DE024(a1, a2, *(id *)(v2 + 8));
}

uint64_t sub_2289DE164()
{
  return sub_2289EA930();
}

uint64_t sub_2289DE19C()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_2289DE1A8()
{
  sub_2289DE26C();
  return sub_2289EA96C();
}

uint64_t sub_2289DE1F8()
{
  sub_2289DE26C();
  return sub_2289EA93C();
}

void sub_2289DE248()
{
  sub_2289DE26C();
  sub_2289EA960();
  __break(1u);
}

unint64_t sub_2289DE26C()
{
  unint64_t result;

  result = qword_2559DA8F8;
  if (!qword_2559DA8F8)
  {
    result = MEMORY[0x22E2B85BC](&unk_2289EB9CC, &type metadata for SUIKPDestinationViewControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_2559DA8F8);
  }
  return result;
}

unint64_t sub_2289DE2B0()
{
  unint64_t result;

  result = qword_2559DA900;
  if (!qword_2559DA900)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2559DA900);
  }
  return result;
}

uint64_t sub_2289DE2F0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  int *v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (**v51)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>);
  uint64_t *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  void (*v56)(char *, char *, uint64_t);
  char *v57;
  uint64_t v58;
  char v59;
  _QWORD *v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  id v79;
  void *v80;
  char *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  id v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
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
  uint64_t *v105;
  uint64_t v106;
  uint64_t *v107;
  char *v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  char *v112;
  _QWORD *v113;
  uint64_t v114;
  uint64_t (**v115)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>);
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  __int128 v121;

  v109 = a2;
  v99 = sub_2289EA90C();
  v100 = *(_QWORD *)(v99 - 8);
  v3 = MEMORY[0x24BDAC7A8](v99);
  v102 = (char *)&v96 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v101 = (char *)&v96 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA928);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v113 = (char **)((char *)&v96 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v7);
  v114 = (uint64_t)&v96 - v9;
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA930);
  v10 = MEMORY[0x24BDAC7A8](v106);
  v115 = (uint64_t (**)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))((char *)&v96
                                                                          - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v10);
  v108 = (char *)&v96 - v12;
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA938);
  MEMORY[0x24BDAC7A8](v98);
  v14 = (char *)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA940);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v96 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA948);
  v19 = MEMORY[0x24BDAC7A8](v104);
  v21 = (char *)&v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v96 - v22;
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA950);
  MEMORY[0x24BDAC7A8](v103);
  v105 = (uint64_t *)((char *)&v96 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA958);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v96 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA960);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v111 = (uint64_t)&v96 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v96 - v31;
  v107 = a1;
  v121 = *((_OWORD *)a1 + 1);
  v33 = *((id *)&v121 + 1);
  v34 = (void *)sub_2289D92C4();
  sub_2289DF818((uint64_t)&v121);
  v112 = v32;
  v110 = v33;
  if (v34)
  {
    v35 = v34;
    sub_2289EAAD4();
    v36 = *MEMORY[0x24BDF4060];
    v37 = sub_2289EAAF8();
    v38 = *(_QWORD *)(v37 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 104))(v27, v36, v37);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v27, 0, 1, v37);
    v39 = sub_2289EAAEC();
    swift_release();
    sub_2289DBD50((uint64_t)v27, &qword_2559DA958);
    *v105 = v39;
    swift_storeEnumTagMultiPayload();
    sub_2289DF8D4();
    swift_retain();
    sub_2289EA8E8();
    swift_release();

    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA968);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v32, 0, 1, v40);
LABEL_7:
    v44 = (uint64_t)v108;
    v45 = v107;
    v46 = (int *)v106;
    goto LABEL_8;
  }
  v97 = v14;
  v96 = v21;
  v41 = v33;
  v42 = sub_2289D8E40();
  sub_2289DF818((uint64_t)&v121);
  if ((v42 & 1) == 0)
  {
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA968);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v112, 1, 1, v43);
    goto LABEL_7;
  }
  if (objc_msgSend(v41, sel_propertyForKey_, *MEMORY[0x24BE75AE0]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    v116 = 0u;
    v117 = 0u;
  }
  v76 = v15;
  sub_2289DF9B4((uint64_t)&v116, (uint64_t)&v118, &qword_2559DA638);
  v77 = v16;
  if (!v120)
  {
    sub_2289DBD50((uint64_t)&v118, &qword_2559DA638);
    v78 = v18;
LABEL_19:
    if (objc_msgSend(v41, sel_propertyForKey_, *MEMORY[0x24BE75B70]))
    {
      sub_2289EAC9C();
      swift_unknownObjectRelease();
    }
    else
    {
      v116 = 0u;
      v117 = 0u;
    }
    v84 = (uint64_t)v105;
    v85 = (uint64_t)v23;
    v86 = v97;
    sub_2289DF9B4((uint64_t)&v116, (uint64_t)&v118, &qword_2559DA638);
    if (v120)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v87 = objc_allocWithZone(MEMORY[0x24BE51A90]);
        v88 = (void *)sub_2289EABAC();
        swift_bridgeObjectRelease();
        objc_msgSend(v87, sel_initWithBundleIdentifier_, v88);

        if (qword_2559DA3E0 != -1)
          swift_once();
        v89 = (id)qword_2559DB980;
        sub_2289EA6F0();
        (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v86, v78, v76);
        swift_storeEnumTagMultiPayload();
        sub_2289D7088(&qword_2559DA9A0, &qword_2559DA940, MEMORY[0x24BEC6520]);
        v83 = (uint64_t)v96;
        goto LABEL_27;
      }
    }
    else
    {
      sub_2289DBD50((uint64_t)&v118, &qword_2559DA638);
    }
    v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA988);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v93 - 8) + 56))(v23, 1, 1, v93);
    v44 = (uint64_t)v108;
    v92 = (uint64_t)v112;
    v45 = v107;
    v46 = (int *)v106;
    goto LABEL_30;
  }
  v78 = v18;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_19;
  v79 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  v80 = (void *)sub_2289EABAC();
  swift_bridgeObjectRelease();
  objc_msgSend(v79, sel_initWithType_, v80);

  v81 = v97;
  if (qword_2559DA3E0 != -1)
    swift_once();
  v82 = (id)qword_2559DB980;
  sub_2289EA6F0();
  (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v81, v18, v76);
  swift_storeEnumTagMultiPayload();
  sub_2289D7088(&qword_2559DA9A0, &qword_2559DA940, MEMORY[0x24BEC6520]);
  v83 = (uint64_t)v96;
LABEL_27:
  sub_2289EA8E8();
  (*(void (**)(char *, uint64_t))(v77 + 8))(v78, v76);
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA988);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 56))(v83, 0, 1, v90);
  v91 = v83;
  v85 = (uint64_t)v23;
  sub_2289DF9B4(v91, (uint64_t)v23, &qword_2559DA948);
  v44 = (uint64_t)v108;
  v92 = (uint64_t)v112;
  v45 = v107;
  v46 = (int *)v106;
  v84 = (uint64_t)v105;
LABEL_30:
  sub_2289DCA60(v85, v84, &qword_2559DA948);
  swift_storeEnumTagMultiPayload();
  sub_2289DF8D4();
  v94 = v111;
  sub_2289EA8E8();
  sub_2289DBD50(v85, &qword_2559DA948);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA968);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v95 - 8) + 56))(v94, 0, 1, v95);
  sub_2289DF9B4(v94, v92, &qword_2559DA960);
LABEL_8:
  v118 = *v45;
  v119 = *((_BYTE *)v45 + 8);
  v47 = swift_allocObject();
  v48 = *((_OWORD *)v45 + 1);
  *(_OWORD *)(v47 + 16) = *(_OWORD *)v45;
  *(_OWORD *)(v47 + 32) = v48;
  *(_BYTE *)(v47 + 48) = *((_BYTE *)v45 + 32);
  sub_2289DF878((uint64_t)&v121);
  sub_2289DF8A0((uint64_t)&v118);
  v49 = sub_2289EA858();
  v50 = sub_2289EA8A0();
  v51 = v115;
  v52 = (uint64_t *)((char *)v115 + v46[9]);
  *v52 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
  swift_storeEnumTagMultiPayload();
  *(uint64_t (**)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))((char *)v51 + v46[10]) = (uint64_t (*)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))v49;
  *(uint64_t (**)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))((char *)v51 + v46[11]) = (uint64_t (*)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))v50;
  v53 = (char *)v51 + v46[12];
  *(_QWORD *)v53 = 0;
  v53[8] = 1;
  *v51 = sub_2289DF870;
  v51[1] = (uint64_t (*)@<X0>(unsigned __int8@<W0>, uint64_t@<X8>))v47;
  sub_2289DF9B4((uint64_t)v51, v44, &qword_2559DA930);
  if (objc_msgSend(v110, sel_buttonAction))
  {
    v54 = v101;
    sub_2289EA900();
    LOBYTE(v116) = 1;
    v55 = v100;
    v56 = *(void (**)(char *, char *, uint64_t))(v100 + 16);
    v57 = v102;
    v58 = v99;
    v56(v102, v54, v99);
    v59 = v116;
    v60 = v113;
    *v113 = 0;
    *((_BYTE *)v60 + 8) = v59;
    v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA980);
    v56((char *)v60 + *(int *)(v61 + 48), v57, v58);
    v62 = *(void (**)(char *, uint64_t))(v55 + 8);
    v62(v54, v58);
    v62(v57, v58);
    v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA970);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56))(v60, 0, 1, v63);
    sub_2289DF9B4((uint64_t)v60, v114, &qword_2559DA928);
  }
  else
  {
    v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA970);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v114, 1, 1, v64);
  }
  v65 = v109;
  v67 = v111;
  v66 = (uint64_t)v112;
  sub_2289DCA60((uint64_t)v112, v111, &qword_2559DA960);
  v68 = v44;
  v69 = v44;
  v70 = (uint64_t)v115;
  sub_2289DCA60(v68, (uint64_t)v115, &qword_2559DA930);
  v71 = v113;
  v72 = v114;
  sub_2289DCA60(v114, (uint64_t)v113, &qword_2559DA928);
  sub_2289DCA60(v67, v65, &qword_2559DA960);
  v73 = v66;
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA978);
  sub_2289DCA60(v70, v65 + *(int *)(v74 + 48), &qword_2559DA930);
  sub_2289DCA60((uint64_t)v71, v65 + *(int *)(v74 + 64), &qword_2559DA928);
  sub_2289DBD50(v72, &qword_2559DA928);
  sub_2289DBD50(v69, &qword_2559DA930);
  sub_2289DBD50(v73, &qword_2559DA960);
  sub_2289DBD50((uint64_t)v71, &qword_2559DA928);
  sub_2289DBD50(v70, &qword_2559DA930);
  return sub_2289DBD50(v67, &qword_2559DA960);
}

uint64_t sub_2289DEF30@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t KeyPath;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  char v39;

  sub_2289DF170(a2, (uint64_t)&v36);
  v29 = *((_QWORD *)&v36 + 1);
  v30 = v36;
  v31 = v38;
  v32 = v37;
  v33 = v39;
  v35 = sub_2289EAA98();
  KeyPath = swift_getKeyPath();
  v6 = *(_BYTE *)(a2 + 32);
  if ((v6 & 1) != 0
    && (v36 = *(_OWORD *)(a2 + 16),
        v7 = *((id *)&v36 + 1),
        sub_2289D8F48(),
        v9 = v8,
        sub_2289DF818((uint64_t)&v36),
        v9))
  {
    sub_2289D6FBC();
    v10 = sub_2289EA9F0();
    v12 = v11;
    v14 = v13 & 1;
    sub_2289EAAA4();
    v15 = sub_2289EA9CC();
    v17 = v16;
    v28 = v18;
    v20 = v19;
    swift_release();
    sub_2289D6FAC(v10, v12, v14);
    swift_bridgeObjectRelease();
    v21 = v28 & 1;
    v22 = v20;
    v23 = v17;
    v24 = v15;
  }
  else
  {
    v24 = 0;
    v23 = 0;
    v21 = 0;
    v22 = 0;
  }
  *(_QWORD *)a3 = v30;
  *(_QWORD *)(a3 + 8) = v29;
  *(_QWORD *)(a3 + 16) = v32;
  *(_QWORD *)(a3 + 24) = v31;
  *(_BYTE *)(a3 + 32) = v33;
  *(_QWORD *)(a3 + 40) = KeyPath;
  *(_QWORD *)(a3 + 48) = v35;
  *(_QWORD *)(a3 + 56) = 0;
  *(_BYTE *)(a3 + 64) = (((v6 & 1) == 0) | (a1 ^ 1) & 1) == 0;
  *(_BYTE *)(a3 + 65) = ((v6 & 1) == 0) | (a1 ^ 1) & 1;
  *(_QWORD *)(a3 + 72) = v24;
  *(_QWORD *)(a3 + 80) = v23;
  *(_QWORD *)(a3 + 88) = v21;
  *(_QWORD *)(a3 + 96) = v22;
  v25 = v24;
  v26 = v21;
  sub_2289DFA48(v30, v29, v32, v31, v33);
  swift_retain();
  swift_retain();
  sub_2289D6F3C(v25, v23, v26, v22);
  sub_2289D6F7C(v25, v23, v26, v22);
  sub_2289DFA84(v30, v29, v32, v31, v33);
  swift_release();
  return swift_release();
}

double sub_2289DF170@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  double result;
  __int128 v23;
  __int128 v24;
  char v25;
  __int128 v26;

  v26 = *(_OWORD *)(a1 + 16);
  v3 = *((id *)&v26 + 1);
  v4 = sub_2289D8928();
  v6 = v5;
  sub_2289DF818((uint64_t)&v26);
  if (v6)
  {
    v7 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0)
      v7 = v4 & 0xFFFFFFFFFFFFLL;
    if (v7)
    {
      *(_QWORD *)&v23 = v4;
      *((_QWORD *)&v23 + 1) = v6;
      sub_2289D6FBC();
      v8 = sub_2289EA9F0();
      v10 = v9;
      v12 = v11 & 1;
      sub_2289EA9A8();
      sub_2289EA9E4();
      swift_release();
      sub_2289D6FAC(v8, v10, v12);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();
  }
  v13 = v3;
  v14 = sub_2289D8F48();
  v16 = v15;
  sub_2289DF818((uint64_t)&v26);
  if (v16)
  {
    *(_QWORD *)&v23 = v14;
    *((_QWORD *)&v23 + 1) = v16;
    sub_2289D6FBC();
    v17 = sub_2289EA9F0();
    v19 = v18;
    v21 = v20 & 1;
    sub_2289EA9A8();
    sub_2289EA9E4();
    swift_release();
    sub_2289D6FAC(v17, v19, v21);
    swift_bridgeObjectRelease();
  }
LABEL_9:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA9A8);
  sub_2289DFAC0();
  sub_2289EA8E8();
  result = *(double *)&v23;
  *(_OWORD *)a2 = v23;
  *(_OWORD *)(a2 + 16) = v24;
  *(_BYTE *)(a2 + 32) = v25;
  return result;
}

uint64_t sub_2289DF38C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  double v11;
  _OWORD v13[2];
  char v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA910);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_OWORD *)(v1 + 16);
  v13[0] = *(_OWORD *)v1;
  v13[1] = v6;
  v14 = *(_BYTE *)(v1 + 32);
  *(_QWORD *)v5 = sub_2289EA858();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA918);
  sub_2289DE2F0((uint64_t *)v13, (uint64_t)&v5[*(int *)(v7 + 44)]);
  v8 = *(_QWORD *)&v13[0];
  v9 = BYTE8(v13[0]);
  sub_2289D6BCC(*(uint64_t *)&v13[0], SBYTE8(v13[0]));
  v10 = sub_2289E8AA4(v8, v9);
  sub_2289D6C04(v8, v9);
  if ((v10 & 1) != 0)
    v11 = 1.0;
  else
    v11 = 0.5;
  sub_2289DCA60((uint64_t)v5, a1, &qword_2559DA910);
  *(double *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559DA920) + 36)) = v11;
  return sub_2289DBD50((uint64_t)v5, &qword_2559DA910);
}

uint64_t sub_2289DF4B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2289EA7D4();
  *a1 = result;
  return result;
}

uint64_t sub_2289DF4D8()
{
  swift_retain();
  return sub_2289EA7E0();
}

void sub_2289DF500(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t KeyPath;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  KeyPath = swift_getKeyPath();
  sub_2289D83B8();
  sub_2289DF5E4();
  v5 = a1;
  v6 = sub_2289EA798();
  v8 = v7;
  v9 = sub_2289D8928();
  if (!v10)
    goto LABEL_7;
  v11 = v9;
  v12 = v10;
  swift_bridgeObjectRelease();
  v13 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0)
    v13 = v11 & 0xFFFFFFFFFFFFLL;
  if (!v13)
  {
LABEL_7:

    goto LABEL_8;
  }
  sub_2289D8F48();
  v15 = v14;

  if (!v15)
  {
LABEL_8:
    v16 = 0;
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  v16 = 1;
LABEL_9:
  *(_QWORD *)a2 = KeyPath;
  *(_BYTE *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v8;
  *(_BYTE *)(a2 + 32) = v16;
}

unint64_t sub_2289DF5E4()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2559DA908;
  if (!qword_2559DA908)
  {
    v1 = sub_2289D83B8();
    result = MEMORY[0x22E2B85BC](&protocol conformance descriptor for PSSpecifier, v1);
    atomic_store(result, (unint64_t *)&qword_2559DA908);
  }
  return result;
}

uint64_t initializeWithCopy for SUIKPTitleValueCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_2289D6BCC(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v7 = v6;
  return a1;
}

uint64_t assignWithCopy for SUIKPTitleValueCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_2289D6BCC(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_2289D6C04(v6, v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(void **)(a2 + 24);
  v9 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  v10 = v8;

  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SUIKPTitleValueCell(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_2289D6C04(v6, v7);
  v8 = a2[3];
  v9 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v8;

  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SUIKPTitleValueCell(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SUIKPTitleValueCell(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SUIKPTitleValueCell()
{
  return &type metadata for SUIKPTitleValueCell;
}

uint64_t sub_2289DF808()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2289DF818(uint64_t a1)
{

  return a1;
}

uint64_t sub_2289DF840()
{
  uint64_t v0;

  sub_2289D6C04(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));

  return swift_deallocObject();
}

uint64_t sub_2289DF870@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2289DEF30(a1, v2 + 16, a2);
}

uint64_t sub_2289DF878(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_2289DF8A0(uint64_t a1)
{
  sub_2289D6BCC(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

unint64_t sub_2289DF8D4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2559DA990;
  if (!qword_2559DA990)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA948);
    v2 = sub_2289DF938();
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559DA990);
  }
  return result;
}

unint64_t sub_2289DF938()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DA998;
  if (!qword_2559DA998)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA988);
    v2[0] = sub_2289D7088(&qword_2559DA9A0, &qword_2559DA940, MEMORY[0x24BEC6520]);
    v2[1] = v2[0];
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DA998);
  }
  return result;
}

uint64_t sub_2289DF9B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2289DF9F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2289EA7D4();
  *a1 = result;
  return result;
}

uint64_t sub_2289DFA20()
{
  swift_retain();
  return sub_2289EA7E0();
}

uint64_t sub_2289DFA48(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
    return sub_2289D6F3C(a1, a2, a3, a4);
  sub_2289D6F6C(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2289DFA84(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5)
{
  if ((a5 & 1) != 0)
    return sub_2289D6F7C(a1, a2, a3, a4);
  sub_2289D6FAC(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_2289DFAC0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559DA9B0;
  if (!qword_2559DA9B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA9A8);
    v2 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559DA9B0);
  }
  return result;
}

unint64_t sub_2289DFB20()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DA9B8;
  if (!qword_2559DA9B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA920);
    v2[0] = sub_2289D7088(&qword_2559DA9C0, &qword_2559DA910, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DA9B8);
  }
  return result;
}

uint64_t sub_2289DFBA4()
{
  return swift_retain();
}

uint64_t destroy for SUIKPThirdPartyAppListView()
{
  sub_2289DFBDC();
  return swift_unknownObjectWeakDestroy();
}

uint64_t sub_2289DFBDC()
{
  return swift_release();
}

uint64_t initializeWithCopy for SUIKPThirdPartyAppListView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_2289DFBA4();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  swift_unknownObjectWeakCopyInit();
  *(_QWORD *)(a1 + 32) = a2[4];
  return a1;
}

uint64_t assignWithCopy for SUIKPThirdPartyAppListView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = *a2;
  v5 = a2[1];
  v6 = *((_BYTE *)a2 + 16);
  sub_2289DFBA4();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_2289DFBDC();
  swift_unknownObjectWeakCopyAssign();
  *(_QWORD *)(a1 + 32) = a2[4];
  return a1;
}

uint64_t initializeWithTake for SUIKPThirdPartyAppListView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for SUIKPThirdPartyAppListView(uint64_t a1, uint64_t a2)
{
  char v4;

  v4 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_2289DFBDC();
  swift_unknownObjectWeakTakeAssign();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SUIKPThirdPartyAppListView(uint64_t a1, int a2)
{
  int v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  if ((*(_QWORD *)(a1 + 32) & 0xF000000000000007) != 0)
    v2 = *(_DWORD *)(a1 + 24) & 0x7FFFFFFF;
  else
    v2 = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SUIKPThirdPartyAppListView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      *(_QWORD *)(result + 32) = 1;
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SUIKPThirdPartyAppListView()
{
  return &type metadata for SUIKPThirdPartyAppListView;
}

uint64_t sub_2289DFE08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2289DFE18(void *a1)
{
  type metadata accessor for SpecifierController();
  swift_allocObject();
  return sub_2289D85BC(a1);
}

uint64_t sub_2289DFE54@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
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
  char *v13;
  uint64_t v14;
  void (**v15)();
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;

  v2 = v1;
  v31 = a1;
  v30 = sub_2289EA84C();
  v3 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v28 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA9C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA9D0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA9D8);
  v29 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA9E0);
  sub_2289D7088(&qword_2559DA9E8, &qword_2559DA9E0, MEMORY[0x24BEB6DE0]);
  sub_2289EA9C0();
  sub_2289E45FC(v2, (uint64_t)&v33);
  v14 = swift_allocObject();
  sub_2289D84D4((uint64_t)&v33, v14 + 16);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v11, v8, v5);
  v15 = (void (**)())&v11[*(int *)(v9 + 36)];
  *v15 = sub_2289E4634;
  v15[1] = (void (*)())v14;
  v15[2] = 0;
  v15[3] = 0;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = sub_2289E463C();
  sub_2289EA9FC();
  sub_2289DBD50((uint64_t)v11, &qword_2559DA9D0);
  v33 = sub_2289E1D58();
  v34 = v17;
  sub_2289D6FBC();
  v18 = sub_2289EA9F0();
  v20 = v19;
  LOBYTE(v8) = v21 & 1;
  v22 = v28;
  v23 = v30;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v28, *MEMORY[0x24BDEE5F0], v30);
  v33 = v9;
  v34 = v16;
  swift_getOpaqueTypeConformance2();
  v24 = v27;
  sub_2289EAA5C();
  sub_2289D6FAC(v18, v20, (char)v8);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v22, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v13, v24);
}

uint64_t sub_2289E014C(uint64_t *a1)
{
  uint64_t v2;
  _BYTE v4[40];

  sub_2289E0218();
  sub_2289E45FC(a1, (uint64_t)v4);
  v2 = swift_allocObject();
  sub_2289D84D4((uint64_t)v4, v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAA10);
  sub_2289E510C(&qword_2559DAA18, &qword_2559DAA10, (uint64_t (*)(void))sub_2289E502C, MEMORY[0x24BDF4A08]);
  return sub_2289EA6FC();
}

void sub_2289E0218()
{
  id v0;
  uint64_t v1;
  id v2;
  __int128 v3;
  __int128 v4;

  type metadata accessor for SpecifierController();
  sub_2289DDE40(&qword_2559DAA00, (uint64_t (*)(uint64_t))type metadata accessor for SpecifierController, (uint64_t)&unk_2289EB5F4);
  v0 = objc_msgSend(*(id *)(sub_2289EA780() + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage), sel_specifier);
  swift_release();
  *(_QWORD *)&v4 = sub_2289EABC4();
  *((_QWORD *)&v4 + 1) = v1;
  v2 = objc_msgSend(v0, sel_objectForKeyedSubscript_, sub_2289EADA4());
  swift_unknownObjectRelease();

  if (v2)
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
    sub_2289D83F4(&v3, &v4);
    swift_dynamicCast();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2289E035C(uint64_t *a1)
{
  uint64_t v2;
  _BYTE v4[40];
  id v5;

  v5 = sub_2289E0464();
  sub_2289E45FC(a1, (uint64_t)v4);
  v2 = swift_allocObject();
  sub_2289D84D4((uint64_t)v4, v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAC10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAA28);
  sub_2289D7088(&qword_2559DAC18, &qword_2559DAC10, MEMORY[0x24BEE12D8]);
  sub_2289E502C();
  sub_2289DDE40(&qword_2559DAC20, (uint64_t (*)(uint64_t))sub_2289D83B8, (uint64_t)&protocol conformance descriptor for PSSpecifier);
  return sub_2289EAB7C();
}

id sub_2289E0464()
{
  id result;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int64_t v17;
  uint64_t v18;

  type metadata accessor for SpecifierController();
  sub_2289DDE40(&qword_2559DAA00, (uint64_t (*)(uint64_t))type metadata accessor for SpecifierController, (uint64_t)&unk_2289EB5F4);
  sub_2289EA780();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2289EA744();
  swift_release();
  swift_release();
  result = (id)swift_release();
  v1 = v17;
  if (v17 < 0)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  v2 = sub_2289EA780();
  v3 = MEMORY[0x24BEE4AF8];
  v4 = 0x2559DA000uLL;
  if (v17)
  {
    v18 = MEMORY[0x24BEE4AF8];
    result = (id)sub_2289E5A30(0, v1, 0);
    v5 = 0;
    v6 = v18;
    v7 = OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage;
    while (v1 != v5)
    {
      result = objc_msgSend(*(id *)(v2 + v7), sel_indexOfGroup_, v5);
      v8 = result;
      v10 = *(_QWORD *)(v18 + 16);
      v9 = *(_QWORD *)(v18 + 24);
      if (v10 >= v9 >> 1)
        result = (id)sub_2289E5A30(v9 > 1, v10 + 1, 1);
      ++v5;
      *(_QWORD *)(v18 + 16) = v10 + 1;
      *(_QWORD *)(v18 + 8 * v10 + 32) = v8;
      if (v1 == v5)
      {
        swift_release();
        v4 = 0x2559DA000;
        v3 = MEMORY[0x24BEE4AF8];
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
  swift_release();
  v6 = MEMORY[0x24BEE4AF8];
LABEL_10:
  v11 = sub_2289EA780();
  v12 = *(_QWORD *)(v6 + 16);
  if (v12)
  {
    sub_2289EAD2C();
    v13 = 0;
    v14 = *(_QWORD *)(v4 + 1624);
    do
    {
      v15 = v13 + 1;
      v16 = objc_msgSend(*(id *)(v11 + v14), sel_specifierAtIndex_, *(_QWORD *)(v6 + 8 * v13 + 32));
      sub_2289EAD14();
      sub_2289EAD38();
      sub_2289EAD44();
      sub_2289EAD20();
      v13 = v15;
    }
    while (v12 != v15);
  }
  swift_release();
  swift_bridgeObjectRelease();
  return (id)v3;
}

uint64_t sub_2289E0714@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  void *v3;
  id v4;

  v3 = *a1;
  v4 = sub_2289E0464();
  sub_2289E075C(v3, (unint64_t)v4, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2289E075C@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  unsigned int v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  _QWORD *v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  unsigned int v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  BOOL v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  NSObject *v91;
  os_log_type_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t result;
  uint64_t *v105;
  void *v106;
  id v107;
  unsigned int v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  id v112;
  NSObject *v113;
  os_log_type_t v114;
  uint64_t v115;
  _QWORD *v116;
  uint64_t v117;
  unint64_t v118;
  id v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  id v129;
  NSObject *v130;
  os_log_type_t v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  id v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  __int128 v161;
  __int128 v162;
  _QWORD *v163;
  _OWORD v164[3];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DABD0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v143 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v153 = (uint64_t)&v143 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAA38);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v147 = (uint64_t)&v143 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v156 = (uint64_t)&v143 - v15;
  v16 = sub_2289EA720();
  v152 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v146 = (char *)&v143 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v158 = (char *)&v143 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v143 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v154 = (char *)&v143 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v143 - v26;
  sub_2289E2104((uint64_t)a1, a2);
  if ((v28 & 1) != 0)
    goto LABEL_65;
  v148 = v12;
  v149 = v10;
  v150 = v7;
  v151 = a3;
  v155 = a1;
  v157 = a2;
  sub_2289E2104((uint64_t)a1, a2);
  if ((v30 & 1) != 0)
  {
    __break(1u);
LABEL_65:
    v105 = v3;
    v106 = a1;
    v145 = v16;
    v107 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v108 = objc_msgSend(v107, sel_sf_isInternalInstall);

    if (v108)
    {
      if (qword_2559DA3D8 != -1)
        swift_once();
      v109 = v145;
      v110 = __swift_project_value_buffer(v145, (uint64_t)qword_2559DB968);
      (*(void (**)(char *, uint64_t, uint64_t))(v152 + 16))(v27, v110, v109);
      sub_2289E45FC(v105, (uint64_t)v164);
      v111 = v106;
      swift_bridgeObjectRetain_n();
      v112 = v111;
      v113 = sub_2289EA708();
      v114 = sub_2289EAC3C();
      LODWORD(v158) = v114;
      if (os_log_type_enabled(v113, v114))
      {
        v115 = swift_slowAlloc();
        v116 = (_QWORD *)swift_slowAlloc();
        v157 = swift_slowAlloc();
        *(_QWORD *)&v161 = v157;
        *(_DWORD *)v115 = 136315906;
        v159 = sub_2289E49DC(0xD00000000000001FLL, 0x80000002289EF540, (uint64_t *)&v161);
        sub_2289EAC84();
        *(_WORD *)(v115 + 12) = 2080;
        sub_2289E0218();
        v159 = sub_2289E49DC(v117, v118, (uint64_t *)&v161);
        sub_2289EAC84();
        swift_bridgeObjectRelease();
        sub_2289E46C0((uint64_t)v164);
        *(_WORD *)(v115 + 22) = 2114;
        v159 = (uint64_t)v112;
        v119 = v112;
        sub_2289EAC84();
        *v116 = v112;

        *(_WORD *)(v115 + 32) = 2082;
        v120 = sub_2289D83B8();
        v121 = swift_bridgeObjectRetain();
        v122 = MEMORY[0x22E2B807C](v121, v120);
        v124 = v123;
        swift_bridgeObjectRelease();
        v159 = sub_2289E49DC(v122, v124, (uint64_t *)&v161);
        sub_2289EAC84();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2289D4000, v113, (os_log_type_t)v158, "%s: app: %s s: %{public}@ not in [s]: %{public}s'", (uint8_t *)v115, 0x2Au);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA768);
        swift_arrayDestroy();
        MEMORY[0x22E2B8634](v116, -1, -1);
        v125 = v157;
        swift_arrayDestroy();
        MEMORY[0x22E2B8634](v125, -1, -1);
        MEMORY[0x22E2B8634](v115, -1, -1);

      }
      else
      {
        sub_2289E46C0((uint64_t)v164);

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v152 + 8))(v27, v145);
    }
    LODWORD(v142) = 0;
    v141 = 78;
    goto LABEL_79;
  }
  v31 = v29;
  v32 = (uint64_t)v3;
  type metadata accessor for SpecifierController();
  sub_2289DDE40(&qword_2559DAA00, (uint64_t (*)(uint64_t))type metadata accessor for SpecifierController, (uint64_t)&unk_2289EB5F4);
  v33 = (uint64_t)objc_msgSend(*(id *)(sub_2289EA780() + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage), sel_numberOfRowsInSection_, v31);
  v34 = swift_release();
  v35 = v152;
  if ((v33 & 0x8000000000000000) == 0)
    goto LABEL_10;
  v36 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v37 = objc_msgSend(v36, sel_sf_isInternalInstall);

  if (!v37)
  {
    if (qword_2559DA3D8 != -1)
      swift_once();
    v38 = __swift_project_value_buffer(v16, (uint64_t)qword_2559DB968);
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v23, v38, v16);
    v39 = sub_2289EA708();
    v40 = sub_2289EAC30();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_2289D4000, v39, v40, "numberOfItemsInSection < 0", v41, 2u);
      MEMORY[0x22E2B8634](v41, -1, -1);
    }

    v34 = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v23, v16);
    v33 = 0;
LABEL_10:
    MEMORY[0x24BDAC7A8](v34);
    v142 = v31;
    v42 = sub_2289E1ED0(sub_2289E5990, (uint64_t)(&v143 - 4), 0, v33);
    MEMORY[0x24BDAC7A8](v42);
    v141 = v32;
    v43 = sub_2289E201C((void (*)(uint64_t *__return_ptr, uint64_t *))sub_2289E59AC, (uint64_t)(&v143 - 4), (uint64_t)v42);
    swift_bridgeObjectRelease();
    v44 = v155;
    objc_msgSend(v155, sel_loadValuesAndTitlesFromDataSource);
    v45 = v156;
    sub_2289E2498(v44, v156);
    v46 = v153;
    sub_2289E2804(v44, v153);
    v47 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v48 = objc_msgSend(v47, sel_sf_isInternalInstall);

    if (!v48)
    {
LABEL_60:
      sub_2289DCA60(v45, v147, &qword_2559DAA38);
      v99 = sub_2289DCA60(v46, (uint64_t)v149, &qword_2559DABD0);
      v158 = (char *)&v143;
      MEMORY[0x24BDAC7A8](v99);
      *(&v143 - 4) = v43;
      *(&v143 - 3) = v32;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAA90);
      v100 = v46;
      v101 = MEMORY[0x24BDF3F50];
      sub_2289E510C(&qword_2559DAA30, &qword_2559DAA38, (uint64_t (*)(void))sub_2289E5170, MEMORY[0x24BDF3F50]);
      v102 = sub_2289E510C(&qword_2559DAA88, &qword_2559DAA90, (uint64_t (*)(void))sub_2289E52F4, MEMORY[0x24BDF4A08]);
      v103 = sub_2289E510C(&qword_2559DABC8, &qword_2559DABD0, sub_2289E5810, v101);
      v141 = v102;
      v142 = v103;
      sub_2289EAB88();
      swift_bridgeObjectRelease();
      sub_2289DBD50(v100, &qword_2559DABD0);
      return sub_2289DBD50(v156, &qword_2559DAA38);
    }
    v163 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v145 = v16;
    v144 = v32;
    if (v43 >> 62)
    {
      swift_bridgeObjectRetain();
      v49 = sub_2289EAD74();
    }
    else
    {
      v49 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v50 = v158;
    v157 = v43;
    if (v49)
    {
      if (v49 >= 1)
      {
        v51 = 0;
        v52 = v43 & 0xC000000000000001;
        v53 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v154 = (char *)(MEMORY[0x24BEE4AD8] + 8);
        while (1)
        {
          v55 = v52 ? (id)MEMORY[0x22E2B8160](v51, v43) : *(id *)(v43 + 8 * v51 + 32);
          v56 = v55;
          v57 = objc_msgSend(v55, sel_name);
          if (v57)
            break;
          v64 = (unint64_t)objc_msgSend(v56, sel_cellType);
          v65 = v64 > 0xD || ((1 << v64) & 0x200A) == 0;
          if (v65 && objc_msgSend(v56, sel_hasValidGetter))
          {
            if (objc_msgSend(v56, sel_performGetter))
            {
              sub_2289EAC9C();
              swift_unknownObjectRelease();
            }
            else
            {
              v161 = 0u;
              v162 = 0u;
            }
            sub_2289DF9B4((uint64_t)&v161, (uint64_t)v164, &qword_2559DA638);
          }
          else
          {
            memset(v164, 0, 32);
          }
          sub_2289DF9B4((uint64_t)v164, (uint64_t)&v161, &qword_2559DA638);
          if (*((_QWORD *)&v162 + 1))
          {
            if ((swift_dynamicCast() & 1) != 0)
            {
              v59 = v159;
              v61 = v160;
              goto LABEL_24;
            }
          }
          else
          {
            sub_2289DBD50((uint64_t)&v161, &qword_2559DA638);
          }
          v66 = objc_msgSend(v56, sel_identifier);
          if (!v66)
          {

            goto LABEL_18;
          }
          v67 = v66;
          v68 = sub_2289EABC4();
          v70 = v69;

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v53 = sub_2289E48D0(0, v53[2] + 1, 1, v53);
          v72 = v53[2];
          v71 = v53[3];
          if (v72 >= v71 >> 1)
            v53 = sub_2289E48D0((_QWORD *)(v71 > 1), v72 + 1, 1, v53);
          v53[2] = v72 + 1;
          v73 = &v53[2 * v72];
          v73[4] = v68;
          v73[5] = v70;
LABEL_17:

          v163 = v53;
          v43 = v157;
          v50 = v158;
LABEL_18:
          if (v49 == ++v51)
            goto LABEL_49;
        }
        v58 = v57;
        v59 = sub_2289EABC4();
        v61 = v60;

LABEL_24:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v53 = sub_2289E48D0(0, v53[2] + 1, 1, v53);
        v63 = v53[2];
        v62 = v53[3];
        if (v63 >= v62 >> 1)
          v53 = sub_2289E48D0((_QWORD *)(v62 > 1), v63 + 1, 1, v53);
        v53[2] = v63 + 1;
        v54 = &v53[2 * v63];
        v54[4] = v59;
        v54[5] = v61;
        goto LABEL_17;
      }
      __break(1u);
    }
    else
    {
LABEL_49:
      swift_bridgeObjectRelease();
      v74 = sub_2289D8928();
      if (!v75)
      {
        if (qword_2559DA3D8 != -1)
          swift_once();
        v87 = v145;
        v88 = __swift_project_value_buffer(v145, (uint64_t)qword_2559DB968);
        v89 = v152;
        v90 = v146;
        (*(void (**)(char *, uint64_t, uint64_t))(v152 + 16))(v146, v88, v87);
        v91 = sub_2289EA708();
        v92 = sub_2289EAC48();
        if (os_log_type_enabled(v91, v92))
        {
          v93 = swift_slowAlloc();
          v94 = swift_slowAlloc();
          *(_QWORD *)&v161 = v94;
          *(_DWORD *)v93 = 136315394;
          *(_QWORD *)&v164[0] = sub_2289E49DC(0xD00000000000001FLL, 0x80000002289EF540, (uint64_t *)&v161);
          sub_2289EAC84();
          *(_WORD *)(v93 + 12) = 2082;
          swift_beginAccess();
          v95 = swift_bridgeObjectRetain();
          v96 = MEMORY[0x22E2B807C](v95, MEMORY[0x24BEE0D00]);
          v98 = v97;
          swift_bridgeObjectRelease();
          v159 = sub_2289E49DC(v96, v98, (uint64_t *)&v161);
          sub_2289EAC84();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2289D4000, v91, v92, "%s: creating section with specifiers: '%{public}s'", (uint8_t *)v93, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x22E2B8634](v94, -1, -1);
          MEMORY[0x22E2B8634](v93, -1, -1);

          (*(void (**)(char *, uint64_t))(v89 + 8))(v146, v87);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v89 + 8))(v90, v87);
        }
        goto LABEL_59;
      }
      v16 = v74;
      v46 = v75;
      if (qword_2559DA3D8 == -1)
      {
LABEL_51:
        v76 = v145;
        v77 = __swift_project_value_buffer(v145, (uint64_t)qword_2559DB968);
        v78 = v152;
        (*(void (**)(char *, uint64_t, uint64_t))(v152 + 16))(v50, v77, v76);
        swift_bridgeObjectRetain();
        v79 = sub_2289EA708();
        v80 = sub_2289EAC48();
        if (os_log_type_enabled(v79, v80))
        {
          v81 = swift_slowAlloc();
          v82 = swift_slowAlloc();
          *(_QWORD *)&v161 = v82;
          *(_DWORD *)v81 = 136315650;
          *(_QWORD *)&v164[0] = sub_2289E49DC(0xD00000000000001FLL, 0x80000002289EF540, (uint64_t *)&v161);
          sub_2289EAC84();
          *(_WORD *)(v81 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(_QWORD *)&v164[0] = sub_2289E49DC(v16, v46, (uint64_t *)&v161);
          sub_2289EAC84();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v81 + 22) = 2082;
          swift_beginAccess();
          v83 = swift_bridgeObjectRetain();
          v84 = MEMORY[0x22E2B807C](v83, MEMORY[0x24BEE0D00]);
          v86 = v85;
          swift_bridgeObjectRelease();
          v159 = sub_2289E49DC(v84, v86, (uint64_t *)&v161);
          sub_2289EAC84();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2289D4000, v79, v80, "%s: creating section '%s' with specifiers: '%{public}s'", (uint8_t *)v81, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x22E2B8634](v82, -1, -1);
          MEMORY[0x22E2B8634](v81, -1, -1);

          (*(void (**)(char *, uint64_t))(v78 + 8))(v158, v76);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v78 + 8))(v50, v76);
        }
LABEL_59:
        swift_bridgeObjectRelease();
        v45 = v156;
        v32 = v144;
        v46 = v153;
        v43 = v157;
        goto LABEL_60;
      }
    }
    swift_once();
    goto LABEL_51;
  }
  v145 = v16;
  if (qword_2559DA3D8 != -1)
    swift_once();
  v126 = v145;
  v127 = __swift_project_value_buffer(v145, (uint64_t)qword_2559DB968);
  (*(void (**)(char *, uint64_t, uint64_t))(v152 + 16))(v154, v127, v126);
  v128 = v155;
  swift_bridgeObjectRetain_n();
  v129 = v128;
  v130 = sub_2289EA708();
  v131 = sub_2289EAC3C();
  if (os_log_type_enabled(v130, v131))
  {
    v132 = swift_slowAlloc();
    v133 = (_QWORD *)swift_slowAlloc();
    v134 = swift_slowAlloc();
    *(_QWORD *)&v164[0] = v134;
    *(_DWORD *)v132 = 136315650;
    *(_QWORD *)&v161 = sub_2289E49DC(0xD00000000000001FLL, 0x80000002289EF540, (uint64_t *)v164);
    sub_2289EAC84();
    *(_WORD *)(v132 + 12) = 2114;
    *(_QWORD *)&v161 = v129;
    v135 = v129;
    sub_2289EAC84();
    *v133 = v129;

    *(_WORD *)(v132 + 22) = 2082;
    v136 = sub_2289D83B8();
    v137 = swift_bridgeObjectRetain();
    v138 = MEMORY[0x22E2B807C](v137, v136);
    v140 = v139;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v161 = sub_2289E49DC(v138, v140, (uint64_t *)v164);
    sub_2289EAC84();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2289D4000, v130, v131, "%s: s: %{public}@ not in [s]: %{public}s'", (uint8_t *)v132, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA768);
    swift_arrayDestroy();
    MEMORY[0x22E2B8634](v133, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22E2B8634](v134, -1, -1);
    MEMORY[0x22E2B8634](v132, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v152 + 8))(v154, v145);
  LODWORD(v142) = 0;
  v141 = 87;
LABEL_79:
  result = sub_2289EAD68();
  __break(1u);
  return result;
}

void sub_2289E1B2C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v15[2];
  uint64_t v16;
  _BYTE v17[40];

  v2 = sub_2289EA720();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v7 = objc_msgSend(v6, sel_sf_isInternalInstall);

  if (v7)
  {
    if (qword_2559DA3D8 != -1)
      swift_once();
    v8 = __swift_project_value_buffer(v2, (uint64_t)qword_2559DB968);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_2289E45FC(a1, (uint64_t)v17);
    v9 = sub_2289EA708();
    v10 = sub_2289EAC48();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v16 = v12;
      *(_DWORD *)v11 = 136315138;
      sub_2289E0218();
      v15[1] = sub_2289E49DC(v13, v14, &v16);
      sub_2289EAC84();
      swift_bridgeObjectRelease();
      sub_2289E46C0((uint64_t)v17);
      _os_log_impl(&dword_2289D4000, v9, v10, "SUIKPThirdPartyAppListView onAppear for %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E2B8634](v12, -1, -1);
      MEMORY[0x22E2B8634](v11, -1, -1);
    }
    else
    {
      sub_2289E46C0((uint64_t)v17);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_2289E1D58()
{
  uint64_t *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  type metadata accessor for SpecifierController();
  sub_2289DDE40(&qword_2559DAA00, (uint64_t (*)(uint64_t))type metadata accessor for SpecifierController, (uint64_t)&unk_2289EB5F4);
  v1 = objc_msgSend(*(id *)(sub_2289EA780() + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage), sel_specifier);
  swift_release();
  v2 = objc_msgSend(v1, sel_name);

  if (v2)
  {
    v3 = sub_2289EABC4();
    v5 = v4;

    sub_2289E45FC(v0, (uint64_t)&v11);
    if (v5)
      goto LABEL_8;
  }
  else
  {
    sub_2289E45FC(v0, (uint64_t)&v11);
  }
  v6 = objc_msgSend(*(id *)(sub_2289EA780() + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage), sel_specifier);
  swift_release();
  v7 = sub_2289D8928();
  v9 = v8;

  if (v9)
    v3 = v7;
  else
    v3 = 0;
LABEL_8:
  sub_2289E46C0((uint64_t)&v11);
  return v3;
}

_QWORD *sub_2289E1ED0(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *(*v16)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v16 = (_QWORD *(*)(uint64_t *__return_ptr, uint64_t *))result;
  v5 = a4 - a3;
  if (__OFSUB__(a4, a3))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v6 = v4;
  v7 = MEMORY[0x24BEE4AF8];
  if (!v5)
    return (_QWORD *)v7;
  v19 = MEMORY[0x24BEE4AF8];
  result = (_QWORD *)sub_2289E5A30(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v7 = v19;
    if (a4 <= a3)
      v10 = a3;
    else
      v10 = a4;
    v15 = v10;
    v11 = a3;
    while (a4 != v11)
    {
      v17 = v11;
      result = v16(&v18, &v17);
      if (v6)
      {
        swift_release();
        return (_QWORD *)v7;
      }
      v6 = 0;
      v12 = v18;
      v19 = v7;
      v14 = *(_QWORD *)(v7 + 16);
      v13 = *(_QWORD *)(v7 + 24);
      if (v14 >= v13 >> 1)
      {
        result = (_QWORD *)sub_2289E5A30(v13 > 1, v14 + 1, 1);
        v7 = v19;
      }
      *(_QWORD *)(v7 + 16) = v14 + 1;
      *(_QWORD *)(v7 + 8 * v14 + 32) = v12;
      if (a4 < a3)
        goto LABEL_19;
      if (v15 == v11)
        goto LABEL_20;
      if (a4 == ++v11)
        return (_QWORD *)v7;
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_2289E201C(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t result;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = v3;
  v6 = *(_QWORD *)(a3 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_2289EAD2C();
    v9 = (uint64_t *)(a3 + 32);
    while (1)
    {
      v10 = *v9++;
      v11 = v10;
      a1(&v12, &v11);
      if (v4)
        break;
      v4 = 0;
      sub_2289EAD14();
      sub_2289EAD38();
      sub_2289EAD44();
      sub_2289EAD20();
      if (!--v6)
        return v13;
    }
    return swift_release();
  }
  return result;
}

void sub_2289E2104(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;
  uint64_t i;
  id v8;
  void *v9;
  char v10;
  unint64_t v11;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x22E2B8160](0, a2);
      }
      else
      {
        if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        v4 = *(id *)(a2 + 32);
      }
      v5 = v4;
      sub_2289D83B8();
      v6 = sub_2289EAC6C();

      if ((v6 & 1) == 0)
      {
        for (i = 0; ; ++i)
        {
          v11 = i + 1;
          if (__OFADD__(i, 1))
            break;
          if (v11 == v3)
            return;
          if ((a2 & 0xC000000000000001) != 0)
          {
            v8 = (id)MEMORY[0x22E2B8160](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0)
              goto LABEL_18;
            if (v11 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_19;
            v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          v9 = v8;
          v10 = sub_2289EAC6C();

          if ((v10 & 1) != 0)
            return;
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        v3 = sub_2289EAD74();
        swift_bridgeObjectRelease();
        if (v3)
          continue;
      }
      return;
    }
  }
}

uint64_t sub_2289E228C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t result;
  uint64_t v15;
  _QWORD *v16;

  v16 = a3;
  v5 = sub_2289EA6E4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  type metadata accessor for SpecifierController();
  sub_2289DDE40(&qword_2559DAA00, (uint64_t (*)(uint64_t))type metadata accessor for SpecifierController, (uint64_t)&unk_2289EB5F4);
  v10 = sub_2289EA780();
  MEMORY[0x22E2B7B3C](v9, a2);
  v11 = *(id *)(v10 + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage);
  v12 = (void *)sub_2289EA6CC();
  v13 = objc_msgSend(v11, sel_indexForIndexPath_, v12);
  swift_release();

  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *v16 = v13;
  return result;
}

uint64_t sub_2289E23D8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  id v4;
  uint64_t result;

  v3 = *a1;
  type metadata accessor for SpecifierController();
  sub_2289DDE40(&qword_2559DAA00, (uint64_t (*)(uint64_t))type metadata accessor for SpecifierController, (uint64_t)&unk_2289EB5F4);
  v4 = objc_msgSend(*(id *)(sub_2289EA780() + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage), sel_specifierAtIndex_, v3);
  result = swift_release();
  *a2 = v4;
  return result;
}

id sub_2289E2498@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  unint64_t v19;
  uint64_t v20;
  uint64_t KeyPath;
  char *v22;
  id result;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;

  v37 = a2;
  v3 = sub_2289EA888();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAA78);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAA68);
  MEMORY[0x24BDAC7A8](v33);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAA58);
  v35 = *(_QWORD *)(v12 - 8);
  v36 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  v34 = a1;
  v18 = sub_2289D8928();
  if (!v19)
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v37, 1, 1, v36);
  v20 = HIBYTE(v19) & 0xF;
  if ((v19 & 0x2000000000000000) == 0)
    v20 = v18 & 0xFFFFFFFFFFFFLL;
  if (!v20)
  {
    swift_bridgeObjectRelease();
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v37, 1, 1, v36);
  }
  v38 = v18;
  v39 = v19;
  v40 = 0;
  v41 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  sub_2289EA87C();
  sub_2289EAA38();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_2289D6FAC(v38, v39, v40);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  sub_2289DCA60((uint64_t)v9, (uint64_t)v11, &qword_2559DAA78);
  v22 = &v11[*(int *)(v33 + 36)];
  *(_QWORD *)v22 = KeyPath;
  *((_QWORD *)v22 + 1) = 0;
  v22[16] = 1;
  sub_2289DBD50((uint64_t)v9, &qword_2559DAA78);
  result = objc_msgSend(v34, sel_identifier);
  if (result)
  {
    v24 = result;
    v25 = sub_2289EABC4();
    v27 = v26;

    swift_bridgeObjectRelease();
    v28 = HIBYTE(v27) & 0xF;
    if ((v27 & 0x2000000000000000) == 0)
      v28 = v25 & 0xFFFFFFFFFFFFLL;
    if (!v28)
      goto LABEL_11;
    swift_bridgeObjectRelease();
    result = objc_msgSend(v34, sel_identifier);
    if (result)
    {
      v29 = result;
      sub_2289EABC4();

LABEL_11:
      v31 = v36;
      v30 = v37;
      sub_2289E51EC();
      sub_2289EAA80();
      swift_bridgeObjectRelease();
      sub_2289DBD50((uint64_t)v11, &qword_2559DAA68);
      sub_2289DF9B4((uint64_t)v15, (uint64_t)v17, &qword_2559DAA58);
      sub_2289DF9B4((uint64_t)v17, v30, &qword_2559DAA58);
      return (id)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v35 + 56))(v30, 0, 1, v31);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2289E2804@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;

  v43 = a2;
  v3 = type metadata accessor for SUIKPFooterHyperlinkView();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (uint64_t *)((char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v38 - v7;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAC68);
  MEMORY[0x24BDAC7A8](v41);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DABE0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAC00);
  MEMORY[0x24BDAC7A8](v42);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2289D94A8();
  if (v17)
  {
    v18 = HIBYTE(v17) & 0xF;
    if ((v17 & 0x2000000000000000) == 0)
      v18 = v16 & 0xFFFFFFFFFFFFLL;
    if (v18)
    {
      swift_bridgeObjectRetain();
      sub_2289EAAA4();
      v19 = sub_2289EA9CC();
      v39 = v13;
      v40 = v3;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v38 = v24;
      swift_bridgeObjectRelease();
      swift_release();
      v23 &= 1u;
      KeyPath = swift_getKeyPath();
      v44 = v19;
      v45 = v21;
      v46 = v23;
      v47 = v25;
      v48 = KeyPath;
      v49 = 0;
      v50 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA8B0);
      sub_2289DD8CC();
      sub_2289EAA80();
      swift_bridgeObjectRelease();
      sub_2289D6FAC(v19, v21, v23);
      swift_release();
      swift_bridgeObjectRelease();
      sub_2289DCA60((uint64_t)v15, (uint64_t)v10, &qword_2559DAC00);
      swift_storeEnumTagMultiPayload();
      sub_2289E58D0(&qword_2559DABF8, &qword_2559DAC00, (uint64_t (*)(void))sub_2289DD8CC);
      sub_2289DDE40(&qword_2559DAC08, (uint64_t (*)(uint64_t))type metadata accessor for SUIKPFooterHyperlinkView, (uint64_t)&unk_2289EB868);
      v27 = (uint64_t)v39;
      sub_2289EA8E8();
      sub_2289DBD50((uint64_t)v15, &qword_2559DAC00);
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DABF0);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v27, 0, 1, v28);
      v29 = v27;
      return sub_2289DF9B4(v29, v43, &qword_2559DABE0);
    }
    swift_bridgeObjectRelease();
  }
  if ((sub_2289DB878() & 1) != 0)
  {
    *v6 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
    swift_storeEnumTagMultiPayload();
    swift_unknownObjectWeakInit();
    v30 = (uint64_t *)((char *)v6 + *(int *)(v3 + 24));
    *v30 = 0;
    v30[1] = 0;
    v31 = (uint64_t)v10;
    v32 = (uint64_t *)((char *)v6 + *(int *)(v3 + 28));
    sub_2289D83B8();
    sub_2289DDE40((unint64_t *)&qword_2559DA908, (uint64_t (*)(uint64_t))sub_2289D83B8, (uint64_t)&protocol conformance descriptor for PSSpecifier);
    v33 = a1;
    *v32 = sub_2289EA798();
    v32[1] = v34;
    sub_2289E5EB0((uint64_t)v6, (uint64_t)v8);
    sub_2289E5EF4((uint64_t)v8, v31);
    swift_storeEnumTagMultiPayload();
    sub_2289E58D0(&qword_2559DABF8, &qword_2559DAC00, (uint64_t (*)(void))sub_2289DD8CC);
    sub_2289DDE40(&qword_2559DAC08, (uint64_t (*)(uint64_t))type metadata accessor for SUIKPFooterHyperlinkView, (uint64_t)&unk_2289EB868);
    sub_2289EA8E8();
    sub_2289E5F38((uint64_t)v8);
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DABF0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v13, 0, 1, v35);
    v29 = (uint64_t)v13;
    return sub_2289DF9B4(v29, v43, &qword_2559DABE0);
  }
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DABF0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v43, 1, 1, v37);
}

uint64_t sub_2289E2CBC(uint64_t a1, uint64_t *a2, void *a3)
{
  uint64_t v4;
  id v5;
  _BYTE v7[40];
  uint64_t v8;

  v8 = a1;
  sub_2289E45FC(a2, (uint64_t)v7);
  v4 = swift_allocObject();
  sub_2289D84D4((uint64_t)v7, v4 + 16);
  *(_QWORD *)(v4 + 56) = a3;
  swift_bridgeObjectRetain();
  v5 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAC10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAA0);
  sub_2289D7088(&qword_2559DAC18, &qword_2559DAC10, MEMORY[0x24BEE12D8]);
  sub_2289E52F4();
  sub_2289DDE40(&qword_2559DAC20, (uint64_t (*)(uint64_t))sub_2289D83B8, (uint64_t)&protocol conformance descriptor for PSSpecifier);
  return sub_2289EAB7C();
}

id sub_2289E2DD8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  uint64_t *v17;
  uint64_t v18;
  id v19;
  id result;
  void *v21;
  uint64_t KeyPath;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  _BOOL4 v30;
  int v31;
  _BYTE v32[40];

  v28 = a3;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAC0);
  MEMORY[0x24BDAC7A8](v27);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAB0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a2;
  v31 = sub_2289DB5F8();
  v11 = sub_2289DB6B8();
  v12 = objc_msgSend(a1, sel_buttonAction);
  v13 = objc_msgSend(a1, sel_controllerLoadAction);
  v14 = objc_msgSend(a1, sel_editPaneClass);
  v15 = objc_msgSend(a1, sel_detailControllerClass);
  v30 = v15 != 0;
  if (objc_msgSend(a1, sel_cellType) == (id)13
    || objc_msgSend(a1, sel_cellType) == (id)3
    || objc_msgSend(a1, sel_cellType) == (id)4)
  {
    v16 = 0;
    v17 = v29;
    if (!v12)
      goto LABEL_10;
  }
  else
  {
    v16 = objc_msgSend(a1, sel_cellType) != (id)15;
    v17 = v29;
    if (!v12)
      goto LABEL_10;
  }
  if (!v13 || !v14 || !v15)
  {
LABEL_10:
    if ((v11 & 1) == 0)
      goto LABEL_12;
  }
  v16 = 0;
LABEL_12:
  sub_2289E45FC(v17, (uint64_t)v32);
  v18 = swift_allocObject();
  sub_2289D84D4((uint64_t)v32, v18 + 16);
  *(_QWORD *)(v18 + 56) = a1;
  v19 = a1;
  objc_msgSend(v19, sel_loadValuesAndTitlesFromDataSource);
  sub_2289DBB2C();
  sub_2289E314C(v19, v31 & 1, (uint64_t)sub_2289E5D04, v18, v10, v30, v12 != 0, (uint64_t)v6);
  result = objc_msgSend(v19, sel_identifier);
  if (result)
  {
    v21 = result;
    sub_2289EABC4();

    sub_2289E5390();
    sub_2289EAA80();
    swift_bridgeObjectRelease();
    sub_2289DBD50((uint64_t)v6, &qword_2559DAAC0);
    KeyPath = swift_getKeyPath();
    v23 = swift_allocObject();
    *(_BYTE *)(v23 + 16) = v16;
    v24 = v28;
    sub_2289DCA60((uint64_t)v9, v28, &qword_2559DAAB0);
    swift_release();
    v25 = (uint64_t *)(v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAA0) + 36));
    *v25 = KeyPath;
    v25[1] = (uint64_t)sub_2289E5D70;
    v25[2] = v23;
    return (id)sub_2289DBD50((uint64_t)v9, &qword_2559DAAB0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2289E30F0(uint64_t a1, void *a2)
{
  int v3;
  uint64_t result;

  v3 = a1;
  result = MEMORY[0x22E2B86AC](a1 + 24);
  if (result)
  {
    sub_2289D7EBC(v3, a2);
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_2289E314C@<X0>(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, int a7@<W6>, uint64_t a8@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
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
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t KeyPath;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  unsigned __int8 v39;
  char v40;
  __int128 v41;
  uint64_t v42;
  id result;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  unsigned __int8 v60;
  char v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _BYTE *v82;
  uint64_t v83;
  _BYTE *v84;
  uint64_t v85;
  _BYTE *v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE *v93;
  char v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  unsigned __int8 v101;
  char v102;
  _OWORD *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _BYTE v107[16];
  uint64_t v108;
  _BYTE *v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  uint64_t v113;
  _BYTE *v114;
  _BYTE *v115;
  uint64_t v116;
  _BYTE *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _BYTE *v123;
  _BYTE *v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  _OWORD *v129;
  _BYTE *v130;
  uint64_t v131;
  _BYTE *v132;
  uint64_t v133;
  uint64_t v134;
  _BYTE *v135;
  _BYTE *v136;
  int v137;
  __int128 v138;
  __int128 v139;
  __int16 v140;
  __int128 v141;
  __int128 v142;
  unsigned __int8 v143;
  char v144;
  uint64_t v145;
  unsigned __int8 v146;
  __int128 v147;
  char v148;

  v112 = a7;
  v126 = a6;
  v111 = a5;
  v120 = a4;
  v119 = a3;
  v137 = a2;
  v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAB90);
  v110 = *(_QWORD *)(v125 - 8);
  MEMORY[0x24BDAC7A8](v125);
  v109 = &v107[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAC28);
  MEMORY[0x24BDAC7A8](v127);
  v129 = &v107[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAC30);
  MEMORY[0x24BDAC7A8](v121);
  v123 = &v107[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAB70);
  MEMORY[0x24BDAC7A8](v128);
  v124 = &v107[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAC38);
  v113 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = &v107[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAC40);
  MEMORY[0x24BDAC7A8](v116);
  v115 = &v107[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAB80);
  v118 = *(_QWORD *)(v122 - 8);
  v18 = MEMORY[0x24BDAC7A8](v122);
  v114 = &v107[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v18);
  v117 = &v107[-v20];
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAB60);
  MEMORY[0x24BDAC7A8](v134);
  v130 = &v107[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAC48);
  MEMORY[0x24BDAC7A8](v131);
  v132 = &v107[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAB40);
  MEMORY[0x24BDAC7A8](v23);
  v135 = &v107[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAD0);
  MEMORY[0x24BDAC7A8](v25);
  v136 = &v107[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAB50);
  v27 = *(_QWORD *)(v133 - 8);
  MEMORY[0x24BDAC7A8](v133);
  v29 = &v107[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAC50);
  MEMORY[0x24BDAC7A8](v30);
  v32 = &v107[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (objc_msgSend(a1, sel_cellType) == (id)6)
  {
    KeyPath = swift_getKeyPath();
    sub_2289D83B8();
    sub_2289DDE40((unint64_t *)&qword_2559DA908, (uint64_t (*)(uint64_t))sub_2289D83B8, (uint64_t)&protocol conformance descriptor for PSSpecifier);
    v34 = a1;
    v35 = sub_2289EA798();
    v37 = v36;
    v138 = (unint64_t)KeyPath;
    *(_QWORD *)&v139 = v35;
    *((_QWORD *)&v139 + 1) = v36;
    LOBYTE(v140) = 0;
    sub_2289E5480();
    sub_2289E54C4();
    swift_retain();
    v38 = v37;
    sub_2289EA8E8();
    v138 = v141;
    v139 = v142;
    v140 = v143;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAB00);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAB20);
    sub_2289E545C();
    sub_2289E5508();
    sub_2289EA8E8();
    v39 = v143;
    v40 = v144;
    v41 = v142;
    *(_OWORD *)v32 = v141;
    *((_OWORD *)v32 + 1) = v41;
    v32[32] = v39;
    v32[33] = v40;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAF0);
    sub_2289E5438();
    sub_2289E55B4();
    sub_2289EA8E8();

    swift_release();
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAE0);
    return (id)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v42 - 8) + 56))(a8, 0, 1, v42);
  }
  v108 = a8;
  if (objc_msgSend(a1, sel_cellType, v30, v23) == (id)5)
  {
    v44 = swift_getKeyPath();
    sub_2289D83B8();
    sub_2289DDE40((unint64_t *)&qword_2559DA908, (uint64_t (*)(uint64_t))sub_2289D83B8, (uint64_t)&protocol conformance descriptor for PSSpecifier);
    v45 = a1;
    v46 = sub_2289EA798();
    v48 = v47;
    v138 = (unint64_t)v44;
    *(_QWORD *)&v139 = v46;
    *((_QWORD *)&v139 + 1) = v47;
    LOBYTE(v140) = 1;
    sub_2289E5480();
    sub_2289E54C4();
    swift_retain();
    v49 = v48;
    sub_2289EA8E8();
    v138 = v141;
    v139 = v142;
    v140 = v143;
LABEL_9:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAB00);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAB20);
    sub_2289E545C();
    sub_2289E5508();
    sub_2289EA8E8();
    v60 = v143;
    v61 = v144;
    v62 = v142;
    *(_OWORD *)v32 = v141;
    *((_OWORD *)v32 + 1) = v62;
    v32[32] = v60;
    v32[33] = v61;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAF0);
    sub_2289E5438();
    sub_2289E55B4();
    v63 = v108;
    sub_2289EA8E8();

    swift_release();
    v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAE0);
    return (id)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v63, 0, 1, v64);
  }
  if (objc_msgSend(a1, sel_cellType) == (id)8)
  {
    v50 = swift_getKeyPath();
    sub_2289D83B8();
    sub_2289DDE40((unint64_t *)&qword_2559DA908, (uint64_t (*)(uint64_t))sub_2289D83B8, (uint64_t)&protocol conformance descriptor for PSSpecifier);
    v51 = a1;
    v52 = sub_2289EA798();
    v54 = v53;
    v138 = (unint64_t)v50;
    *(_QWORD *)&v139 = v52;
    *((_QWORD *)&v139 + 1) = v53;
    LOBYTE(v140) = 0;
    sub_2289E552C();
    sub_2289E5570();
    swift_retain();
    v49 = v54;
    sub_2289EA8E8();
    v138 = v141;
    v139 = v142;
    LOBYTE(v140) = v143;
    HIBYTE(v140) = 1;
    goto LABEL_9;
  }
  if (objc_msgSend(a1, sel_cellType) == (id)12)
  {
    v55 = swift_getKeyPath();
    sub_2289D83B8();
    sub_2289DDE40((unint64_t *)&qword_2559DA908, (uint64_t (*)(uint64_t))sub_2289D83B8, (uint64_t)&protocol conformance descriptor for PSSpecifier);
    v56 = a1;
    v57 = sub_2289EA798();
    v59 = v58;
    v138 = (unint64_t)v55;
    *(_QWORD *)&v139 = v57;
    *((_QWORD *)&v139 + 1) = v58;
    LOBYTE(v140) = 1;
    sub_2289E552C();
    sub_2289E5570();
    swift_retain();
    v49 = v59;
    sub_2289EA8E8();
    v138 = v141;
    v139 = v142;
    LOBYTE(v140) = v143;
    HIBYTE(v140) = 1;
    goto LABEL_9;
  }
  if ((v137 & 1) != 0 && objc_msgSend(a1, sel_cellType) == (id)3)
  {
    MEMORY[0x24BDAC7A8](3);
    v65 = v111;
    *(_QWORD *)&v107[-16] = a1;
    *(_QWORD *)&v107[-8] = v65;
    sub_2289E5E48();
    swift_retain();
    sub_2289EAB10();
    v66 = v133;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v27 + 16))(v132, v29, v133);
    swift_storeEnumTagMultiPayload();
    sub_2289D7088(&qword_2559DAB48, &qword_2559DAB50, MEMORY[0x24BDF43B0]);
    sub_2289E5658(&qword_2559DAB58, &qword_2559DAB60, (uint64_t (*)(void))sub_2289E56C8, sub_2289E5764);
    v67 = (uint64_t)v135;
    sub_2289EA8E8();
    sub_2289DCA60(v67, (uint64_t)v32, &qword_2559DAB40);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAF0);
    sub_2289E5438();
    sub_2289E55B4();
    v68 = v136;
    sub_2289EA8E8();
    sub_2289DBD50(v67, &qword_2559DAB40);
    (*(void (**)(_BYTE *, uint64_t))(v27 + 8))(v29, v66);
    v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAE0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v68, 0, 1, v69);
    v70 = (uint64_t)v68;
    return (id)sub_2289DF9B4(v70, v108, &qword_2559DAAD0);
  }
  v71 = objc_msgSend(a1, sel_cellType);
  if (v71 != (id)1)
  {
    v71 = objc_msgSend(a1, sel_cellType);
    if (v71 != (id)2)
    {
      v71 = objc_msgSend(a1, sel_cellType);
      if (v71 != (id)4)
      {
        v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAE0);
        return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v99 - 8) + 56))(v108, 1, 1, v99);
      }
    }
  }
  if ((v126 & 1) == 0)
  {
    v76 = (uint64_t)v130;
    if ((v112 & 1) == 0)
    {
      v94 = sub_2289DB9F4();
      v93 = v136;
      if ((v94 & 1) != 0)
      {
        v95 = swift_getKeyPath();
        sub_2289D83B8();
        sub_2289DDE40((unint64_t *)&qword_2559DA908, (uint64_t (*)(uint64_t))sub_2289D83B8, (uint64_t)&protocol conformance descriptor for PSSpecifier);
        v96 = a1;
        v97 = sub_2289EA798();
        v138 = (unint64_t)v95;
        *(_QWORD *)&v139 = v97;
        *((_QWORD *)&v139 + 1) = v98;
        v140 = 0;
      }
      else
      {
        sub_2289DF500(a1, (uint64_t)&v145);
        *(_QWORD *)&v138 = v145;
        *((_QWORD *)&v138 + 1) = v146;
        v139 = v147;
        LOBYTE(v140) = v148;
        HIBYTE(v140) = 1;
      }
      sub_2289E5788();
      sub_2289E57CC();
      sub_2289EA8E8();
      v100 = v142;
      v101 = v143;
      v102 = v144;
      v103 = v129;
      *v129 = v141;
      v103[1] = v100;
      *((_BYTE *)v103 + 32) = v101;
      *((_BYTE *)v103 + 33) = v102;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559DABA0);
      sub_2289E56C8();
      sub_2289E5764();
      sub_2289EA8E8();
      goto LABEL_27;
    }
    MEMORY[0x24BDAC7A8](v71);
    *(_QWORD *)&v107[-16] = a1;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DABA0);
    sub_2289E5764();
    v89 = v109;
    sub_2289EAB10();
    v90 = v110;
    v91 = v125;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v110 + 16))(v123, v89, v125);
    swift_storeEnumTagMultiPayload();
    sub_2289D7088(&qword_2559DAB78, &qword_2559DAB80, MEMORY[0x24BDEC8E0]);
    sub_2289D7088(&qword_2559DAB88, &qword_2559DAB90, MEMORY[0x24BDF43B0]);
    v92 = (uint64_t)v124;
    sub_2289EA8E8();
    sub_2289DCA60(v92, (uint64_t)v129, &qword_2559DAB70);
    swift_storeEnumTagMultiPayload();
    sub_2289E56C8();
    sub_2289EA8E8();
    sub_2289DBD50(v92, &qword_2559DAB70);
    (*(void (**)(_BYTE *, uint64_t))(v90 + 8))(v89, v91);
LABEL_21:
    v93 = v136;
LABEL_27:
    sub_2289DCA60(v76, (uint64_t)v132, &qword_2559DAB60);
    swift_storeEnumTagMultiPayload();
    sub_2289D7088(&qword_2559DAB48, &qword_2559DAB50, MEMORY[0x24BDF43B0]);
    sub_2289E5658(&qword_2559DAB58, &qword_2559DAB60, (uint64_t (*)(void))sub_2289E56C8, sub_2289E5764);
    v104 = v76;
    v105 = (uint64_t)v135;
    sub_2289EA8E8();
    sub_2289DCA60(v105, (uint64_t)v32, &qword_2559DAB40);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAF0);
    sub_2289E5438();
    sub_2289E55B4();
    sub_2289EA8E8();
    sub_2289DBD50(v105, &qword_2559DAB40);
    sub_2289DBD50(v104, &qword_2559DAB60);
    v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAAE0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v106 - 8) + 56))(v93, 0, 1, v106);
    v70 = (uint64_t)v93;
    return (id)sub_2289DF9B4(v70, v108, &qword_2559DAAD0);
  }
  sub_2289D83B8();
  sub_2289DDE40((unint64_t *)&qword_2559DA908, (uint64_t (*)(uint64_t))sub_2289D83B8, (uint64_t)&protocol conformance descriptor for PSSpecifier);
  v72 = a1;
  v73 = sub_2289EA798();
  v75 = v74;
  *(_QWORD *)&v141 = v73;
  *((_QWORD *)&v141 + 1) = v74;
  result = objc_msgSend(v72, sel_name);
  v76 = (uint64_t)v130;
  if (result)
  {
    v77 = result;
    v78 = sub_2289EABC4();
    v80 = v79;

    *(_QWORD *)&v138 = v78;
    *((_QWORD *)&v138 + 1) = v80;
    sub_2289DDFE0();
    sub_2289D6FBC();
    sub_2289EAA68();

    swift_bridgeObjectRelease();
    LOBYTE(v77) = sub_2289EA990();
    v81 = v113;
    v82 = v115;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v113 + 16))(v115, v16, v14);
    v82[*(int *)(v116 + 36)] = (_BYTE)v77;
    v83 = (*(uint64_t (**)(_BYTE *, uint64_t))(v81 + 8))(v16, v14);
    MEMORY[0x24BDAC7A8](v83);
    *(_QWORD *)&v107[-16] = v72;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DABA0);
    sub_2289E5764();
    sub_2289E5DA0();
    v84 = v114;
    sub_2289EA78C();
    v85 = v118;
    v86 = v117;
    v87 = v122;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v118 + 32))(v117, v84, v122);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v85 + 16))(v123, v86, v87);
    swift_storeEnumTagMultiPayload();
    sub_2289D7088(&qword_2559DAB78, &qword_2559DAB80, MEMORY[0x24BDEC8E0]);
    sub_2289D7088(&qword_2559DAB88, &qword_2559DAB90, MEMORY[0x24BDF43B0]);
    v88 = (uint64_t)v124;
    sub_2289EA8E8();
    sub_2289DCA60(v88, (uint64_t)v129, &qword_2559DAB70);
    swift_storeEnumTagMultiPayload();
    sub_2289E56C8();
    sub_2289EA8E8();
    sub_2289DBD50(v88, &qword_2559DAB70);
    (*(void (**)(_BYTE *, uint64_t))(v85 + 8))(v86, v87);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_2289E441C@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t KeyPath;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  KeyPath = swift_getKeyPath();
  sub_2289D83B8();
  sub_2289DDE40((unint64_t *)&qword_2559DA908, (uint64_t (*)(uint64_t))sub_2289D83B8, (uint64_t)&protocol conformance descriptor for PSSpecifier);
  v7 = a1;
  v8 = a2;
  v9 = sub_2289EA798();
  v11 = v10;
  result = sub_2289EA798();
  *(_QWORD *)a3 = KeyPath;
  *(_BYTE *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = v9;
  *(_QWORD *)(a3 + 24) = v11;
  *(_QWORD *)(a3 + 32) = result;
  *(_QWORD *)(a3 + 40) = v13;
  return result;
}

double sub_2289E44DC@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  double result;
  __int128 v6;
  __int128 v7;
  char v8;
  char v9;
  uint64_t v10;

  if ((sub_2289DB9F4() & 1) != 0)
  {
    swift_getKeyPath();
    sub_2289D83B8();
    sub_2289DDE40((unint64_t *)&qword_2559DA908, (uint64_t (*)(uint64_t))sub_2289D83B8, (uint64_t)&protocol conformance descriptor for PSSpecifier);
    v4 = a1;
    sub_2289EA798();
  }
  else
  {
    sub_2289DF500(a1, (uint64_t)&v10);
  }
  sub_2289E5788();
  sub_2289E57CC();
  sub_2289EA8E8();
  result = *(double *)&v6;
  *(_OWORD *)a2 = v6;
  *(_OWORD *)(a2 + 16) = v7;
  *(_BYTE *)(a2 + 32) = v8;
  *(_BYTE *)(a2 + 33) = v9;
  return result;
}

uint64_t sub_2289E45F4()
{
  uint64_t v0;

  return sub_2289E014C(*(uint64_t **)(v0 + 16));
}

uint64_t sub_2289E45FC(uint64_t *a1, uint64_t a2)
{
  initializeWithCopy for SUIKPThirdPartyAppListView(a2, a1);
  return a2;
}

void sub_2289E4634()
{
  uint64_t v0;

  sub_2289E1B2C((uint64_t *)(v0 + 16));
}

unint64_t sub_2289E463C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DA9F0;
  if (!qword_2559DA9F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA9D0);
    v2[0] = sub_2289D7088(&qword_2559DA9F8, &qword_2559DA9C8, MEMORY[0x24BDF1A30]);
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DA9F0);
  }
  return result;
}

uint64_t sub_2289E46C0(uint64_t a1)
{
  sub_2289DFBDC();
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_2289E46F8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2289EA744();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2289E4774()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2289EA750();
}

uint64_t sub_2289E47E4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2289EA804();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2289E4810()
{
  return sub_2289EA810();
}

uint64_t sub_2289E4834()
{
  return sub_2289EA7BC();
}

uint64_t sub_2289E4854(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2289EA894();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2289EA7C8();
}

_QWORD *sub_2289E48D0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA770);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2289E5BA8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2289E49DC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2289E4AAC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2289DBDF0((uint64_t)v12, *a3);
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
      sub_2289DBDF0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2289E4AAC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2289EAC90();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2289E4C64(a5, a6);
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
  v8 = sub_2289EAD08();
  if (!v8)
  {
    sub_2289EAD5C();
    __break(1u);
LABEL_17:
    result = sub_2289EAD80();
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

uint64_t sub_2289E4C64(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2289E4CF8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2289E4ED0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2289E4ED0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2289E4CF8(uint64_t a1, unint64_t a2)
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
      v3 = sub_2289E4E6C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2289EACF0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2289EAD5C();
      __break(1u);
LABEL_10:
      v2 = sub_2289EAC00();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2289EAD80();
    __break(1u);
LABEL_14:
    result = sub_2289EAD5C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2289E4E6C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAA08);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2289E4ED0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAA08);
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
  result = sub_2289EAD80();
  __break(1u);
  return result;
}

uint64_t sub_2289E5024()
{
  uint64_t v0;

  return sub_2289E035C((uint64_t *)(v0 + 16));
}

unint64_t sub_2289E502C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];

  result = qword_2559DAA20;
  if (!qword_2559DAA20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAA28);
    v2 = MEMORY[0x24BDF3F50];
    v3[0] = sub_2289E510C(&qword_2559DAA30, &qword_2559DAA38, (uint64_t (*)(void))sub_2289E5170, MEMORY[0x24BDF3F50]);
    v3[1] = sub_2289E510C(&qword_2559DAA88, &qword_2559DAA90, (uint64_t (*)(void))sub_2289E52F4, MEMORY[0x24BDF4A08]);
    v3[2] = sub_2289E510C(&qword_2559DABC8, &qword_2559DABD0, sub_2289E5810, v2);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2559DAA20);
  }
  return result;
}

uint64_t sub_2289E510C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x22E2B85BC](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2289E5170()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559DAA40;
  if (!qword_2559DAA40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAA48);
    v2 = sub_2289E58D0(&qword_2559DAA50, &qword_2559DAA58, (uint64_t (*)(void))sub_2289E51EC);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559DAA40);
  }
  return result;
}

unint64_t sub_2289E51EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DAA60;
  if (!qword_2559DAA60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAA68);
    v2[0] = sub_2289E5270();
    v2[1] = sub_2289D7088((unint64_t *)&qword_2559DA8C0, &qword_2559DA8C8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DAA60);
  }
  return result;
}

unint64_t sub_2289E5270()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2559DAA70;
  if (!qword_2559DAA70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAA78);
    v2 = sub_2289DDE40(&qword_2559DAA80, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2559DAA70);
  }
  return result;
}

unint64_t sub_2289E52F4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DAA98;
  if (!qword_2559DAA98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAAA0);
    v2[0] = sub_2289E58D0(&qword_2559DAAA8, &qword_2559DAAB0, sub_2289E5390);
    v2[1] = sub_2289D7088(&qword_2559DABB8, &qword_2559DABC0, MEMORY[0x24BDF1248]);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DAA98);
  }
  return result;
}

uint64_t sub_2289E5390()
{
  return sub_2289E510C(&qword_2559DAAB8, &qword_2559DAAC0, (uint64_t (*)(void))sub_2289E53B4, MEMORY[0x24BDF3F50]);
}

unint64_t sub_2289E53B4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2559DAAC8;
  if (!qword_2559DAAC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAAD0);
    v2 = sub_2289E5658(&qword_2559DAAD8, &qword_2559DAAE0, sub_2289E5438, (uint64_t (*)(void))sub_2289E55B4);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2559DAAC8);
  }
  return result;
}

uint64_t sub_2289E5438()
{
  return sub_2289E5658(&qword_2559DAAE8, &qword_2559DAAF0, sub_2289E545C, sub_2289E5508);
}

uint64_t sub_2289E545C()
{
  return sub_2289E5658(&qword_2559DAAF8, &qword_2559DAB00, (uint64_t (*)(void))sub_2289E5480, (uint64_t (*)(void))sub_2289E54C4);
}

unint64_t sub_2289E5480()
{
  unint64_t result;

  result = qword_2559DAB08;
  if (!qword_2559DAB08)
  {
    result = MEMORY[0x22E2B85BC](&unk_2289EBF38, &type metadata for SUIKPToggleCell);
    atomic_store(result, (unint64_t *)&qword_2559DAB08);
  }
  return result;
}

unint64_t sub_2289E54C4()
{
  unint64_t result;

  result = qword_2559DAB10;
  if (!qword_2559DAB10)
  {
    result = MEMORY[0x22E2B85BC](&unk_2289EC028, &type metadata for SUIKPSliderCell);
    atomic_store(result, (unint64_t *)&qword_2559DAB10);
  }
  return result;
}

uint64_t sub_2289E5508()
{
  return sub_2289E5658(&qword_2559DAB18, &qword_2559DAB20, (uint64_t (*)(void))sub_2289E552C, (uint64_t (*)(void))sub_2289E5570);
}

unint64_t sub_2289E552C()
{
  unint64_t result;

  result = qword_2559DAB28;
  if (!qword_2559DAB28)
  {
    result = MEMORY[0x22E2B85BC](&unk_2289EB464, &type metadata for SUIKPTextFieldCell);
    atomic_store(result, (unint64_t *)&qword_2559DAB28);
  }
  return result;
}

unint64_t sub_2289E5570()
{
  unint64_t result;

  result = qword_2559DAB30;
  if (!qword_2559DAB30)
  {
    result = MEMORY[0x22E2B85BC](&unk_2289EB76C, &type metadata for SUIKPSecureTextFieldCell);
    atomic_store(result, (unint64_t *)&qword_2559DAB30);
  }
  return result;
}

unint64_t sub_2289E55B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DAB38;
  if (!qword_2559DAB38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAB40);
    v2[0] = sub_2289D7088(&qword_2559DAB48, &qword_2559DAB50, MEMORY[0x24BDF43B0]);
    v2[1] = sub_2289E5658(&qword_2559DAB58, &qword_2559DAB60, (uint64_t (*)(void))sub_2289E56C8, sub_2289E5764);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DAB38);
  }
  return result;
}

uint64_t sub_2289E5658(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
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
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDEF3E0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2289E56C8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DAB68;
  if (!qword_2559DAB68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAB70);
    v2[0] = sub_2289D7088(&qword_2559DAB78, &qword_2559DAB80, MEMORY[0x24BDEC8E0]);
    v2[1] = sub_2289D7088(&qword_2559DAB88, &qword_2559DAB90, MEMORY[0x24BDF43B0]);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DAB68);
  }
  return result;
}

uint64_t sub_2289E5764()
{
  return sub_2289E5658(&qword_2559DAB98, &qword_2559DABA0, (uint64_t (*)(void))sub_2289E5788, (uint64_t (*)(void))sub_2289E57CC);
}

unint64_t sub_2289E5788()
{
  unint64_t result;

  result = qword_2559DABA8;
  if (!qword_2559DABA8)
  {
    result = MEMORY[0x22E2B85BC](&unk_2289EBFB4, &type metadata for SUIKPSubtitleCell);
    atomic_store(result, (unint64_t *)&qword_2559DABA8);
  }
  return result;
}

unint64_t sub_2289E57CC()
{
  unint64_t result;

  result = qword_2559DABB0;
  if (!qword_2559DABB0)
  {
    result = MEMORY[0x22E2B85BC](&unk_2289EBAF4, &type metadata for SUIKPTitleValueCell);
    atomic_store(result, (unint64_t *)&qword_2559DABB0);
  }
  return result;
}

uint64_t sub_2289E5810()
{
  return sub_2289E510C(&qword_2559DABD8, &qword_2559DABE0, (uint64_t (*)(void))sub_2289E5834, MEMORY[0x24BDF5578]);
}

unint64_t sub_2289E5834()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DABE8;
  if (!qword_2559DABE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DABF0);
    v2[0] = sub_2289E58D0(&qword_2559DABF8, &qword_2559DAC00, (uint64_t (*)(void))sub_2289DD8CC);
    v2[1] = sub_2289DDE40(&qword_2559DAC08, (uint64_t (*)(uint64_t))type metadata accessor for SUIKPFooterHyperlinkView, (uint64_t)&unk_2289EB868);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DABE8);
  }
  return result;
}

uint64_t sub_2289E58D0(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = sub_2289DDE40(&qword_2559DAA80, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  sub_2289DFBDC();
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2289E5988@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2289E0714(a1, a2);
}

uint64_t sub_2289E5990@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_2289E228C(a1, *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_2289E59AC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_2289E23D8(a1, a2);
}

uint64_t sub_2289E59C8()
{
  uint64_t v0;

  return sub_2289E2CBC(*(_QWORD *)(v0 + 16), *(uint64_t **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_2289E59D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2289EA81C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2289E5A04()
{
  return sub_2289EA828();
}

uint64_t sub_2289E5A30(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2289E5A4C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2289E5A4C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_2559DAC70);
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
  result = sub_2289EAD80();
  __break(1u);
  return result;
}

uint64_t sub_2289E5BA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2289EAD80();
  __break(1u);
  return result;
}

id sub_2289E5C9C@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2289E2DD8(*a1, *(_QWORD *)(v2 + 56), a2);
}

uint64_t objectdestroy_9Tm()
{
  uint64_t v0;

  sub_2289DFBDC();
  swift_unknownObjectWeakDestroy();

  return swift_deallocObject();
}

uint64_t sub_2289E5D04()
{
  uint64_t v0;

  return sub_2289E30F0(v0 + 16, *(void **)(v0 + 56));
}

uint64_t sub_2289E5D10@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2289EA804();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2289E5D3C()
{
  return sub_2289EA810();
}

uint64_t sub_2289E5D60()
{
  return swift_deallocObject();
}

_BYTE *sub_2289E5D70(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

double sub_2289E5D88@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2289E44DC(*(void **)(v1 + 16), a1);
}

unint64_t sub_2289E5DA0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  _QWORD v4[6];

  result = qword_2559DAC58;
  if (!qword_2559DAC58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAC40);
    v2 = sub_2289DDFE0();
    v3 = sub_2289D6FBC();
    v4[2] = &type metadata for SUIKPDestinationViewControllerRepresentable;
    v4[3] = MEMORY[0x24BEE0D00];
    v4[4] = v2;
    v4[5] = v3;
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = MEMORY[0x24BDF0420];
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2559DAC58);
  }
  return result;
}

uint64_t sub_2289E5E40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2289E441C(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

unint64_t sub_2289E5E48()
{
  unint64_t result;

  result = qword_2559DAC60;
  if (!qword_2559DAC60)
  {
    result = MEMORY[0x22E2B85BC](&unk_2289EBE54, &type metadata for SUIKPCheckmarkCell);
    atomic_store(result, (unint64_t *)&qword_2559DAC60);
  }
  return result;
}

uint64_t sub_2289E5E8C()
{
  return sub_2289EA7BC();
}

uint64_t sub_2289E5EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SUIKPFooterHyperlinkView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2289E5EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SUIKPFooterHyperlinkView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2289E5F38(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SUIKPFooterHyperlinkView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2289E5F74@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2289EA81C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2289E5FA4()
{
  return sub_2289EA828();
}

uint64_t sub_2289E5FD8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA9D8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DA9D0);
  sub_2289E463C();
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2289E6058()
{
  return swift_allocateGenericValueMetadata();
}

void sub_2289E6060()
{
  unint64_t v0;

  sub_2289DD2D8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

_QWORD *sub_2289E60F0(_QWORD *a1, uint64_t *a2, int *a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    a1 = (_QWORD *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v8 = a2[1];
    *a1 = v5;
    a1[1] = v8;
    v9 = a3[9];
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_2289EA894();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = a3[11];
    *(_QWORD *)((char *)a1 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    *(_QWORD *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    v14 = a3[12];
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    *(_QWORD *)v15 = *(_QWORD *)v16;
    v15[8] = v16[8];
  }
  return a1;
}

uint64_t sub_2289E6208(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_2289EA894();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_2289E6280(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[9];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_2289EA894();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[11];
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  v12 = a3[12];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  v13[8] = v14[8];
  return a1;
}

_QWORD *sub_2289E6368(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v7 = a3[9];
    v8 = (_QWORD *)((char *)a1 + v7);
    v9 = (_QWORD *)((char *)a2 + v7);
    sub_2289E6470((uint64_t)a1 + v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_2289EA894();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  v11 = a3[12];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = *(_QWORD *)v13;
  v12[8] = v13[8];
  *(_QWORD *)v12 = v14;
  return a1;
}

uint64_t sub_2289E6470(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_2289E64B0(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  *a1 = *a2;
  v6 = a3[9];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_2289EA894();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  v11 = a3[11];
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  v12 = a3[12];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  v13[8] = v14[8];
  return a1;
}

_OWORD *sub_2289E6598(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  *a1 = *a2;
  swift_release();
  if (a1 != a2)
  {
    v6 = a3[9];
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    sub_2289E6470((uint64_t)a1 + v6);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_2289EA894();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
  }
  v11 = a3[11];
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  v12 = a3[12];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(_QWORD *)v13 = *(_QWORD *)v14;
  v13[8] = v14[8];
  return a1;
}

uint64_t sub_2289E6698()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2289E66A4(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2559DA808);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 36)], a2, v8);
  }
}

uint64_t sub_2289E6724()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2289E6730(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2559DA808);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 36)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AdaptiveStack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AdaptiveStack);
}

uint64_t sub_2289E67B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2289E67E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_2289EA8DC();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_2289EA8E8();
}

uint64_t sub_2289E68AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_2289EA8DC();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_2289EA8E8();
}

uint64_t sub_2289E6970@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  void (*v19)(char *, uint64_t);
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v22 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = sub_2289EAB58();
  v6 = sub_2289EAB28();
  v7 = sub_2289EA8F4();
  v8 = sub_2289EAAC8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - v13;
  v23 = v3;
  v24 = v4;
  v25 = v2;
  v15 = MEMORY[0x22E2B85BC](MEMORY[0x24BDF4700], v5);
  v16 = MEMORY[0x22E2B85BC](MEMORY[0x24BDF4498], v6);
  v27[0] = v15;
  v27[1] = v16;
  v17 = MEMORY[0x22E2B85BC](MEMORY[0x24BDEF3E0], v7, v27);
  sub_2289EAABC();
  v26 = v17;
  MEMORY[0x22E2B85BC](MEMORY[0x24BDF3F50], v8, &v26);
  v18 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v18(v14, v12, v8);
  v19 = *(void (**)(char *, uint64_t))(v9 + 8);
  v19(v12, v8);
  v18(v22, v14, v8);
  return ((uint64_t (*)(char *, uint64_t))v19)(v14, v8);
}

uint64_t sub_2289E6B08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t);
  int v25;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void (*v37)(char *, uint64_t, uint64_t);
  void (*v38)(uint64_t, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[2];

  v56 = a4;
  v7 = sub_2289EAB28();
  v50 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v48 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v51 = (char *)&v45 - v10;
  v11 = sub_2289EAB58();
  v45 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v47 = (char *)&v45 - v15;
  v16 = sub_2289EA894();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = v7;
  v20 = sub_2289EA8F4();
  v54 = *(_QWORD *)(v20 - 8);
  v55 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v53 = (char *)&v45 - v21;
  v23 = type metadata accessor for AdaptiveStack(0, a2, a3, v22);
  sub_2289E8C5C((uint64_t)v19);
  v46 = v17;
  v24 = *(uint64_t (**)(char *, uint64_t))(v17 + 88);
  v49 = v16;
  v25 = v24(v19, v16);
  if (v25 == *MEMORY[0x24BDEEE68]
    || v25 == *MEMORY[0x24BDEEE78]
    || v25 == *MEMORY[0x24BDEEE40]
    || v25 == *MEMORY[0x24BDEEE48])
  {
    MEMORY[0x24BDAC7A8](*(_QWORD *)(a1 + *(int *)(v23 + 44)));
    *(&v45 - 4) = a2;
    *(&v45 - 3) = a3;
    *(&v45 - 2) = a1;
    sub_2289EAB4C();
    MEMORY[0x22E2B85BC](MEMORY[0x24BDF4700], v11);
    v29 = v45;
    v30 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
    v31 = v47;
    v30(v47, v14, v11);
    v32 = *(void (**)(char *, uint64_t))(v29 + 8);
    v32(v14, v11);
    v30(v14, v31, v11);
    v34 = v52;
    MEMORY[0x22E2B85BC](MEMORY[0x24BDF4498], v52);
    v39 = v53;
    sub_2289E67E8((uint64_t)v14, v11);
    v32(v14, v11);
    v32(v31, v11);
  }
  else
  {
    MEMORY[0x24BDAC7A8](*(_QWORD *)(a1 + *(int *)(v23 + 40)));
    *(&v45 - 4) = a2;
    *(&v45 - 3) = a3;
    *(&v45 - 2) = a1;
    v33 = (uint64_t)v48;
    sub_2289EAB1C();
    v34 = v52;
    MEMORY[0x22E2B85BC](MEMORY[0x24BDF4498], v52);
    v35 = v50;
    v36 = v51;
    v37 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
    v37(v51, v33, v34);
    v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    v38(v33, v34);
    v37((char *)v33, (uint64_t)v36, v34);
    MEMORY[0x22E2B85BC](MEMORY[0x24BDF4700], v11);
    v39 = v53;
    sub_2289E68AC(v33, v11, v34);
    v38(v33, v34);
    v38((uint64_t)v36, v34);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v19, v49);
  }
  v40 = MEMORY[0x22E2B85BC](MEMORY[0x24BDF4700], v11);
  v41 = MEMORY[0x22E2B85BC](MEMORY[0x24BDF4498], v34);
  v57[0] = v40;
  v57[1] = v41;
  v42 = v55;
  MEMORY[0x22E2B85BC](MEMORY[0x24BDEF3E0], v55, v57);
  v43 = v54;
  (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v56, v39, v42);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v39, v42);
}

uint64_t sub_2289E6F74@<X0>(uint64_t a1@<X1>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (**v8)(uint64_t);
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void (**)(uint64_t))MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v15 - v9;
  (*v8)(v11);
  v12 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v12(v10, v7, a1);
  v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v7, a1);
  v12(a2, v10, a1);
  return ((uint64_t (*)(char *, uint64_t))v13)(v10, a1);
}

uint64_t sub_2289E7044@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_2289E6B08(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_2289E7050@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_2289E6F74(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2289E7070@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_2289E6F74(*(_QWORD *)(v1 + 16), a1);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E2B8550](a1, v6, a5);
}

uint64_t sub_2289E70BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD v6[2];

  v0 = sub_2289EAB58();
  v1 = sub_2289EAB28();
  v2 = sub_2289EA8F4();
  v3 = sub_2289EAAC8();
  v6[0] = MEMORY[0x22E2B85BC](MEMORY[0x24BDF4700], v0);
  v6[1] = MEMORY[0x22E2B85BC](MEMORY[0x24BDF4498], v1);
  v5 = MEMORY[0x22E2B85BC](MEMORY[0x24BDEF3E0], v2, v6);
  return MEMORY[0x22E2B85BC](MEMORY[0x24BDF3F50], v3, &v5);
}

void destroy for SUIKPCheckmarkCell(uint64_t a1)
{
  sub_2289D6C04(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));

}

uint64_t initializeWithCopy for SUIKPCheckmarkCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_2289D6BCC(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  v6 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v9 = v6;
  v10 = v8;
  return a1;
}

uint64_t assignWithCopy for SUIKPCheckmarkCell(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a2 + 8);
  sub_2289D6BCC(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_2289D6C04(v6, v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(void **)(a2 + 24);
  v9 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  v10 = v8;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v11 = *(void **)(a2 + 40);
  v12 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v11;
  v13 = v11;

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

uint64_t assignWithTake for SUIKPCheckmarkCell(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = *a2;
  v5 = *((_BYTE *)a2 + 8);
  v6 = *(_QWORD *)a1;
  v7 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = v5;
  sub_2289D6C04(v6, v7);
  v8 = a2[3];
  v9 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v8;

  v10 = a2[5];
  v11 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 32) = a2[4];
  *(_QWORD *)(a1 + 40) = v10;

  return a1;
}

uint64_t getEnumTagSinglePayload for SUIKPCheckmarkCell(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SUIKPCheckmarkCell(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SUIKPCheckmarkCell()
{
  return &type metadata for SUIKPCheckmarkCell;
}

uint64_t sub_2289E73C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2289E73D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
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
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
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
  id v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD10);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v41 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v38 - v7;
  v44 = *(_OWORD *)(a1 + 16);
  v9 = *((id *)&v44 + 1);
  v10 = sub_2289D8928();
  v12 = v11;
  sub_2289DF818((uint64_t)&v44);
  if (v12)
  {
    v42 = v10;
    v43 = v12;
    sub_2289D6FBC();
    v13 = sub_2289EA9F0();
    v15 = v14;
    v17 = v16 & 1;
    sub_2289EA9A8();
    v18 = sub_2289EA9E4();
    v38 = v9;
    v39 = a1;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v40 = v8;
    swift_release();
    sub_2289D6FAC(v13, v15, v17);
    swift_bridgeObjectRelease();
    sub_2289EAA98();
    v24 = sub_2289EA9CC();
    v12 = v25;
    v27 = v26;
    v29 = v28;
    swift_release();
    v30 = v27 & 1;
    v31 = v19;
    v32 = v21;
    v9 = v38;
    a1 = v39;
    sub_2289D6FAC(v31, v32, v23 & 1);
    v8 = v40;
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = 0;
    v30 = 0;
    v29 = 0;
  }
  if ((sub_2289E7B68((uint64_t)v9, *(id *)(a1 + 40)) & 1) != 0)
  {
    sub_2289E7684((uint64_t)v8);
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v8, 0, 1, v33);
  }
  else
  {
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD18);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v8, 1, 1, v34);
  }
  v35 = v41;
  sub_2289DCA60((uint64_t)v8, v41, &qword_2559DAD10);
  *(_QWORD *)a2 = v24;
  *(_QWORD *)(a2 + 8) = v12;
  *(_QWORD *)(a2 + 16) = v30;
  *(_QWORD *)(a2 + 24) = v29;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD20);
  sub_2289DCA60(v35, a2 + *(int *)(v36 + 64), &qword_2559DAD10);
  sub_2289D6F3C(v24, v12, v30, v29);
  sub_2289DBD50((uint64_t)v8, &qword_2559DAD10);
  sub_2289DBD50(v35, &qword_2559DAD10);
  return sub_2289D6F7C(v24, v12, v30, v29);
}

uint64_t sub_2289E7684@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t KeyPath;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v29 = a1;
  v26 = sub_2289EA888();
  v28 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v27 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD28);
  MEMORY[0x24BDAC7A8](v24);
  v3 = (uint64_t *)((char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_2289EAB04();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD30);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD38);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2289EAAE0();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDF40B8], v4);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)v3 + *(int *)(v24 + 28), v7, v4);
  *v3 = KeyPath;
  sub_2289DCA60((uint64_t)v3, (uint64_t)v10 + *(int *)(v8 + 36), &qword_2559DAD28);
  *v10 = v14;
  swift_retain();
  sub_2289DBD50((uint64_t)v3, &qword_2559DAD28);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
  v16 = sub_2289EAA8C();
  v17 = swift_getKeyPath();
  sub_2289DCA60((uint64_t)v10, (uint64_t)v13, &qword_2559DAD30);
  v18 = (uint64_t *)&v13[*(int *)(v11 + 36)];
  *v18 = v17;
  v18[1] = v16;
  sub_2289DBD50((uint64_t)v10, &qword_2559DAD30);
  if ((sub_2289E7B68(*(_QWORD *)(v25 + 24), *(id *)(v25 + 40)) & 1) != 0)
  {
    v19 = v27;
    sub_2289EA870();
    v20 = v26;
  }
  else
  {
    v30 = MEMORY[0x24BEE4AF8];
    sub_2289E7C80();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD48);
    sub_2289D7088(&qword_2559DAD50, &qword_2559DAD48, MEMORY[0x24BEE12C8]);
    v21 = v26;
    v19 = v27;
    sub_2289EACA8();
    v20 = v21;
  }
  sub_2289E7CC8();
  sub_2289EAA38();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v19, v20);
  return sub_2289DBD50((uint64_t)v13, &qword_2559DAD38);
}

uint64_t sub_2289E79C8@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  double v11;
  _OWORD v13[3];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DACF8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v1[1];
  v13[0] = *v1;
  v13[1] = v6;
  v13[2] = v1[2];
  *(_QWORD *)v5 = sub_2289EA858();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD00);
  sub_2289E73D0((uint64_t)v13, (uint64_t)&v5[*(int *)(v7 + 44)]);
  v8 = *(_QWORD *)&v13[0];
  v9 = BYTE8(v13[0]);
  sub_2289D6BCC(*(uint64_t *)&v13[0], SBYTE8(v13[0]));
  v10 = sub_2289E8AA4(v8, v9);
  sub_2289D6C04(v8, v9);
  if ((v10 & 1) != 0)
    v11 = 1.0;
  else
    v11 = 0.5;
  sub_2289DCA60((uint64_t)v5, a1, &qword_2559DACF8);
  *(double *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD08) + 36)) = v11;
  return sub_2289DBD50((uint64_t)v5, &qword_2559DACF8);
}

uint64_t sub_2289E7AEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2289EAB04();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2289EA7B0();
}

id sub_2289E7B68(uint64_t a1, id a2)
{
  id v3;
  id v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;

  if (objc_msgSend(a2, sel_propertyForKey_, *MEMORY[0x24BE75C20]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_2289D8330((uint64_t)v6, (uint64_t)v7);
  if (!v8)
  {
    sub_2289DBD50((uint64_t)v7, &qword_2559DA638);
    return 0;
  }
  sub_2289D83B8();
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v3 = objc_msgSend(v5, sel_isEqualToSpecifier_, a1);

  return v3;
}

uint64_t sub_2289E7C54()
{
  return sub_2289EA7A4();
}

unint64_t sub_2289E7C80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559DAD40;
  if (!qword_2559DAD40)
  {
    v1 = sub_2289EA888();
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDEEDA8], v1);
    atomic_store(result, (unint64_t *)&qword_2559DAD40);
  }
  return result;
}

unint64_t sub_2289E7CC8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DAD58;
  if (!qword_2559DAD58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAD38);
    v2[0] = sub_2289E7D4C();
    v2[1] = sub_2289D7088(&qword_2559DAD70, &qword_2559DAD78, MEMORY[0x24BDF1028]);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DAD58);
  }
  return result;
}

unint64_t sub_2289E7D4C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2559DAD60;
  if (!qword_2559DAD60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAD30);
    v2 = sub_2289D7088(&qword_2559DAD68, &qword_2559DAD28, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2559DAD60);
  }
  return result;
}

unint64_t sub_2289E7DD4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DAD80;
  if (!qword_2559DAD80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAD08);
    v2[0] = sub_2289D7088(&qword_2559DAD88, &qword_2559DACF8, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DAD80);
  }
  return result;
}

ValueMetadata *type metadata accessor for SUIKPToggleCell()
{
  return &type metadata for SUIKPToggleCell;
}

uint64_t sub_2289E7E68()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_2289E7E78()
{
  id v0;
  id v1;
  double v2;
  double v3;
  id result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AF0]);
  v1 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v1, sel_scale);
  v3 = v2;

  objc_msgSend(v0, sel_setScale_, v3);
  result = objc_msgSend(v0, sel_setDrawBorder_, 1);
  qword_2559DB980 = (uint64_t)v0;
  return result;
}

uint64_t sub_2289E7F34@<X0>(uint64_t a1@<X0>, char a2@<W1>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  double v15;
  _BYTE v17[16];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DADA8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD90);
  MEMORY[0x24BDAC7A8](v11);
  v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)v10 = sub_2289EA858();
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DADB0);
  a2 &= 1u;
  sub_2289E80B4(a3, (uint64_t)&v10[*(int *)(v14 + 44)]);
  sub_2289D6BCC(a1, a2);
  LOBYTE(a3) = sub_2289E8AA4(a1, a2);
  sub_2289D6C04(a1, a2);
  if ((a3 & 1) != 0)
    v15 = 1.0;
  else
    v15 = 0.5;
  sub_2289DCA60((uint64_t)v10, (uint64_t)v13, &qword_2559DADA8);
  *(double *)&v13[*(int *)(v11 + 36)] = v15;
  sub_2289DBD50((uint64_t)v10, &qword_2559DADA8);
  return sub_2289DF9B4((uint64_t)v13, a4, &qword_2559DAD90);
}

uint64_t sub_2289E80B4@<X0>(void *a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t *v71;
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[3];
  uint64_t v84;

  v79 = a2;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA938);
  MEMORY[0x24BDAC7A8](v75);
  v76 = (char *)&v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA940);
  v4 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v6 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA948);
  v7 = MEMORY[0x24BDAC7A8](v78);
  v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v71 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA950);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t *)((char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA958);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA960);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v80 = (uint64_t)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v71 - v21;
  v23 = a1;
  v24 = (void *)sub_2289D92C4();

  if (v24)
  {
    v25 = v24;
    sub_2289EAAD4();
    v26 = *MEMORY[0x24BDF4060];
    v27 = sub_2289EAAF8();
    v28 = *(_QWORD *)(v27 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 104))(v17, v26, v27);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v17, 0, 1, v27);
    v29 = sub_2289EAAEC();
    swift_release();
    sub_2289DBD50((uint64_t)v17, &qword_2559DA958);
    *v14 = v29;
    swift_storeEnumTagMultiPayload();
    sub_2289DF8D4();
    swift_retain();
    sub_2289EA8E8();
    swift_release();

    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA968);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v22, 0, 1, v30);
    goto LABEL_23;
  }
  v71 = v14;
  v72 = v11;
  v73 = v12;
  v74 = v22;
  v31 = v23;
  v32 = v23;
  v33 = sub_2289D8E40();

  if ((v33 & 1) == 0)
  {
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA968);
    v22 = v74;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v74, 1, 1, v34);
    goto LABEL_23;
  }
  if (objc_msgSend(v32, sel_propertyForKey_, *MEMORY[0x24BE75AE0]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    v81 = 0u;
    v82 = 0u;
  }
  v35 = (uint64_t)v9;
  v36 = v6;
  sub_2289DF9B4((uint64_t)&v81, (uint64_t)v83, &qword_2559DA638);
  v37 = v4;
  v38 = v77;
  if (v84)
  {
    v39 = swift_dynamicCast();
    v40 = v76;
    if ((v39 & 1) != 0)
    {
      v41 = objc_allocWithZone(MEMORY[0x24BE51A90]);
      v42 = (void *)sub_2289EABAC();
      swift_bridgeObjectRelease();
      objc_msgSend(v41, sel_initWithType_, v42);

      if (qword_2559DA3E0 == -1)
        goto LABEL_19;
      goto LABEL_27;
    }
  }
  else
  {
    sub_2289DBD50((uint64_t)v83, &qword_2559DA638);
    v40 = v76;
  }
  if (objc_msgSend(v32, (SEL)0x24F1536C8, *MEMORY[0x24BE75B70]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    v81 = 0u;
    v82 = 0u;
  }
  sub_2289DF9B4((uint64_t)&v81, (uint64_t)v83, &qword_2559DA638);
  if (!v84)
  {
    sub_2289DBD50((uint64_t)v83, &qword_2559DA638);
    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:
    v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA988);
    v47 = (uint64_t)v72;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v72, 1, 1, v48);
    goto LABEL_22;
  }
  v43 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  v44 = (void *)sub_2289EABAC();
  swift_bridgeObjectRelease();
  objc_msgSend(v43, sel_initWithBundleIdentifier_, v44);

  if (qword_2559DA3E0 != -1)
LABEL_27:
    swift_once();
LABEL_19:
  v45 = (id)qword_2559DB980;
  sub_2289EA6F0();
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v40, v36, v38);
  swift_storeEnumTagMultiPayload();
  sub_2289D7088(&qword_2559DA9A0, &qword_2559DA940, MEMORY[0x24BEC6520]);
  sub_2289EA8E8();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v38);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA988);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v35, 0, 1, v46);
  v47 = (uint64_t)v72;
  sub_2289DF9B4(v35, (uint64_t)v72, &qword_2559DA948);
LABEL_22:
  v23 = v31;
  sub_2289DCA60(v47, (uint64_t)v71, &qword_2559DA948);
  swift_storeEnumTagMultiPayload();
  sub_2289DF8D4();
  v49 = v80;
  sub_2289EA8E8();
  sub_2289DBD50(v47, &qword_2559DA948);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA968);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v49, 0, 1, v50);
  v22 = v74;
  sub_2289DF9B4(v49, (uint64_t)v74, &qword_2559DA960);
LABEL_23:
  v51 = v23;
  v52 = sub_2289D8928();
  v54 = v53;

  if (v54)
  {
    v83[0] = v52;
    v83[1] = v54;
    sub_2289D6FBC();
    v55 = sub_2289EA9F0();
    v57 = v56;
    v59 = v58 & 1;
    sub_2289EA9A8();
    v60 = sub_2289EA9E4();
    v54 = v61;
    v63 = v62;
    v65 = v64;
    swift_release();
    v66 = v63 & 1;
    sub_2289D6FAC(v55, v57, v59);
    swift_bridgeObjectRelease();
  }
  else
  {
    v60 = 0;
    v66 = 0;
    v65 = 0;
  }
  v67 = v80;
  sub_2289DCA60((uint64_t)v22, v80, &qword_2559DA960);
  v68 = v79;
  sub_2289DCA60(v67, v79, &qword_2559DA960);
  v69 = (uint64_t *)(v68 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559DADB8) + 48));
  *v69 = v60;
  v69[1] = v54;
  v69[2] = v66;
  v69[3] = v65;
  sub_2289D6F3C(v60, v54, v66, v65);
  sub_2289DBD50((uint64_t)v22, &qword_2559DA960);
  sub_2289D6F7C(v60, v54, v66, v65);
  return sub_2289DBD50(v67, &qword_2559DA960);
}

uint64_t sub_2289E895C()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 24);
  sub_2289D9864();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAD90);
  sub_2289E8A20();
  return sub_2289EAB40();
}

uint64_t sub_2289E8A08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2289E7F34(*(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24), *(void **)(v1 + 40), a1);
}

unint64_t sub_2289E8A20()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DAD98;
  if (!qword_2559DAD98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAD90);
    v2[0] = sub_2289D7088(&qword_2559DADA0, &qword_2559DADA8, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DAD98);
  }
  return result;
}

uint64_t sub_2289E8AA4(uint64_t a1, char a2)
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

  v4 = sub_2289EA840();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  swift_retain();
  v8 = sub_2289EAC3C();
  v9 = sub_2289EA984();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_2289E49DC(1819242306, 0xE400000000000000, &v15);
    sub_2289EAC84();
    _os_log_impl(&dword_2289D4000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2B8634](v12, -1, -1);
    MEMORY[0x22E2B8634](v11, -1, -1);
  }

  sub_2289EA834();
  swift_getAtKeyPath();
  sub_2289D6C04(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_2289E8C5C@<X0>(uint64_t a1@<X8>)
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
  v4 = sub_2289EA840();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA800);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2289DCA60(v2, (uint64_t)v10, &qword_2559DA800);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_2289EA894();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_2289EAC3C();
    v14 = sub_2289EA984();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_2289E49DC(0xD000000000000013, 0x80000002289EF5C0, &v20);
      sub_2289EAC84();
      _os_log_impl(&dword_2289D4000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E2B8634](v18, -1, -1);
      MEMORY[0x22E2B8634](v16, -1, -1);
    }

    sub_2289EA834();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_2289E8E98()
{
  return sub_2289D7088(&qword_2559DADC0, &qword_2559DADC8, MEMORY[0x24BDF46D0]);
}

ValueMetadata *type metadata accessor for SUIKPSubtitleCell()
{
  return &type metadata for SUIKPSubtitleCell;
}

uint64_t sub_2289E8ED4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2289E8EE4@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, char *, uint64_t);
  char *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  char *v61;
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
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  char *v82;
  char *v83;
  id v84;
  uint64_t v85;
  char *v86;
  id v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118[3];
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;

  v111 = a3;
  LODWORD(v108) = a2;
  v109 = a1;
  v113 = a5;
  v101 = sub_2289EA90C();
  v102 = *(_QWORD *)(v101 - 8);
  v6 = MEMORY[0x24BDAC7A8](v101);
  v100 = (char *)&v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v99 = (char *)&v96 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA928);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v112 = (char *)&v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v114 = (uint64_t)&v96 - v12;
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA938);
  MEMORY[0x24BDAC7A8](v104);
  v105 = (char *)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA940);
  v14 = *(_QWORD *)(v106 - 8);
  MEMORY[0x24BDAC7A8](v106);
  v16 = (char *)&v96 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA948);
  v17 = MEMORY[0x24BDAC7A8](v107);
  v19 = (char *)&v96 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v96 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA950);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (uint64_t *)((char *)&v96 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA958);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v96 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA960);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v115 = (uint64_t)&v96 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v96 - v31;
  v33 = a4;
  v34 = (void *)sub_2289D92C4();

  v110 = v33;
  if (v34)
  {
    v35 = v34;
    sub_2289EAAD4();
    v36 = *MEMORY[0x24BDF4060];
    v37 = sub_2289EAAF8();
    v38 = *(_QWORD *)(v37 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 104))(v27, v36, v37);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v27, 0, 1, v37);
    v39 = sub_2289EAAEC();
    swift_release();
    sub_2289DBD50((uint64_t)v27, &qword_2559DA958);
    *v24 = v39;
    swift_storeEnumTagMultiPayload();
    sub_2289DF8D4();
    swift_retain();
    sub_2289EA8E8();
    swift_release();

    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA968);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v32, 0, 1, v40);
    goto LABEL_7;
  }
  v97 = v16;
  v41 = v106;
  v96 = v19;
  v98 = v22;
  v42 = v33;
  v43 = sub_2289D8E40();

  if ((v43 & 1) == 0)
  {
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA968);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v32, 1, 1, v44);
    goto LABEL_7;
  }
  if (objc_msgSend(v42, sel_propertyForKey_, *MEMORY[0x24BE75AE0]))
  {
    sub_2289EAC9C();
    swift_unknownObjectRelease();
  }
  else
  {
    v116 = 0u;
    v117 = 0u;
  }
  v76 = v41;
  sub_2289DF9B4((uint64_t)&v116, (uint64_t)v118, &qword_2559DA638);
  v77 = (uint64_t)v24;
  if (!v119)
  {
    sub_2289DBD50((uint64_t)v118, &qword_2559DA638);
    v78 = v14;
LABEL_18:
    if (objc_msgSend(v42, sel_propertyForKey_, *MEMORY[0x24BE75B70]))
    {
      sub_2289EAC9C();
      swift_unknownObjectRelease();
    }
    else
    {
      v116 = 0u;
      v117 = 0u;
    }
    v86 = v97;
    sub_2289DF9B4((uint64_t)&v116, (uint64_t)v118, &qword_2559DA638);
    if (v119)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v79 = (uint64_t)v21;
        v87 = objc_allocWithZone(MEMORY[0x24BE51A90]);
        v88 = (void *)sub_2289EABAC();
        swift_bridgeObjectRelease();
        objc_msgSend(v87, sel_initWithBundleIdentifier_, v88);

        if (qword_2559DA3E0 != -1)
          swift_once();
        v89 = (id)qword_2559DB980;
        sub_2289EA6F0();
        (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v105, v86, v76);
        swift_storeEnumTagMultiPayload();
        sub_2289D7088(&qword_2559DA9A0, &qword_2559DA940, MEMORY[0x24BEC6520]);
        v85 = (uint64_t)v96;
        sub_2289EA8E8();
        (*(void (**)(char *, uint64_t))(v78 + 8))(v86, v76);
        goto LABEL_26;
      }
    }
    else
    {
      sub_2289DBD50((uint64_t)v118, &qword_2559DA638);
    }
    v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA988);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v93 - 8) + 56))(v21, 1, 1, v93);
    v92 = (uint64_t)v21;
    goto LABEL_29;
  }
  v78 = v14;
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_18;
  v79 = (uint64_t)v21;
  v80 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  v81 = (void *)sub_2289EABAC();
  swift_bridgeObjectRelease();
  objc_msgSend(v80, sel_initWithType_, v81);

  v82 = v97;
  v83 = v105;
  if (qword_2559DA3E0 != -1)
    swift_once();
  v84 = (id)qword_2559DB980;
  sub_2289EA6F0();
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v83, v82, v76);
  swift_storeEnumTagMultiPayload();
  sub_2289D7088(&qword_2559DA9A0, &qword_2559DA940, MEMORY[0x24BEC6520]);
  v85 = (uint64_t)v96;
  sub_2289EA8E8();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v82, v76);
LABEL_26:
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA988);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 56))(v85, 0, 1, v90);
  v91 = v85;
  v92 = v79;
  sub_2289DF9B4(v91, v79, &qword_2559DA948);
LABEL_29:
  sub_2289DCA60(v92, v77, &qword_2559DA948);
  swift_storeEnumTagMultiPayload();
  sub_2289DF8D4();
  v94 = v115;
  sub_2289EA8E8();
  sub_2289DBD50(v92, &qword_2559DA948);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA968);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v95 - 8) + 56))(v94, 0, 1, v95);
  sub_2289DF9B4(v94, (uint64_t)v32, &qword_2559DA960);
LABEL_7:
  v45 = sub_2289EA8AC();
  v46 = v110;
  sub_2289E9AE4(v110, v118);
  v108 = v118[0];
  v107 = v118[1];
  v106 = v118[2];
  v105 = v119;
  v109 = v120;
  v47 = v122;
  v104 = v121;
  v111 = v123;
  v48 = objc_msgSend(v46, sel_buttonAction);
  v49 = (uint64_t)v112;
  v50 = v114;
  if (v48)
  {
    v51 = v32;
    v52 = v99;
    sub_2289EA900();
    LOBYTE(v118[0]) = 1;
    v53 = v102;
    v54 = v45;
    v55 = *(void (**)(char *, char *, uint64_t))(v102 + 16);
    v56 = v100;
    v57 = v101;
    v55(v100, v52, v101);
    v58 = v118[0];
    *(_QWORD *)v49 = 0;
    *(_BYTE *)(v49 + 8) = v58;
    v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA980);
    v55((char *)(v49 + *(int *)(v59 + 48)), v56, v57);
    v60 = *(void (**)(char *, uint64_t))(v53 + 8);
    v61 = v52;
    v32 = v51;
    v60(v61, v57);
    v60(v56, v57);
    v45 = v54;
    v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA970);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 56))(v49, 0, 1, v62);
    sub_2289DF9B4(v49, v50, &qword_2559DA928);
  }
  else
  {
    v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA970);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56))(v50, 1, 1, v63);
  }
  v103 = v32;
  v64 = v115;
  sub_2289DCA60((uint64_t)v32, v115, &qword_2559DA960);
  sub_2289DCA60(v50, v49, &qword_2559DA928);
  v65 = v49;
  v66 = v113;
  sub_2289DCA60(v64, v113, &qword_2559DA960);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DADE8);
  v68 = v66 + *(int *)(v67 + 48);
  *(_QWORD *)v68 = v45;
  *(_QWORD *)(v68 + 8) = 0;
  *(_BYTE *)(v68 + 16) = 1;
  v69 = v108;
  v70 = v107;
  *(_QWORD *)(v68 + 24) = v108;
  *(_QWORD *)(v68 + 32) = v70;
  LOBYTE(v64) = v106;
  v71 = (uint64_t)v105;
  *(_QWORD *)(v68 + 40) = v106;
  *(_QWORD *)(v68 + 48) = v71;
  v72 = v109;
  v73 = v104;
  *(_QWORD *)(v68 + 56) = v109;
  *(_QWORD *)(v68 + 64) = v73;
  v74 = v111;
  *(_QWORD *)(v68 + 72) = v47;
  *(_QWORD *)(v68 + 80) = v74;
  sub_2289DCA60(v65, v66 + *(int *)(v67 + 64), &qword_2559DA928);
  sub_2289D6F3C(v69, v70, v64, v71);
  sub_2289D6F3C(v72, v73, v47, v74);
  sub_2289DBD50(v114, &qword_2559DA928);
  sub_2289DBD50((uint64_t)v103, &qword_2559DA960);
  sub_2289DBD50(v65, &qword_2559DA928);
  sub_2289D6F7C(v69, v70, v64, v71);
  sub_2289D6F7C(v72, v73, v47, v74);
  return sub_2289DBD50(v115, &qword_2559DA960);
}

uint64_t sub_2289E9AE4@<X0>(void *a1@<X3>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v3 = a1;
  sub_2289D8928();
  v5 = v4;

  if (v5)
  {
    sub_2289D6FBC();
    v6 = sub_2289EA9F0();
    v8 = v7;
    v10 = v9 & 1;
    sub_2289EA9A8();
    v5 = sub_2289EA9E4();
    v12 = v11;
    v14 = v13;
    v42 = v15;
    swift_release();
    v16 = v14 & 1;
    sub_2289D6FAC(v6, v8, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
    v16 = 0;
    v42 = 0;
  }
  v17 = v3;
  sub_2289D8F48();
  v19 = v18;

  if (v19)
  {
    sub_2289D6FBC();
    v20 = sub_2289EA9F0();
    v22 = v21;
    v24 = v23 & 1;
    sub_2289EAAA4();
    v25 = sub_2289EA9CC();
    v40 = v12;
    v41 = v5;
    v27 = v26;
    v29 = v28;
    swift_release();
    sub_2289D6FAC(v20, v22, v24);
    swift_bridgeObjectRelease();
    sub_2289EA9B4();
    v30 = sub_2289EA9E4();
    v19 = v31;
    v33 = v32;
    v35 = v34;
    swift_release();
    v36 = v33 & 1;
    v37 = v27;
    v38 = v29 & 1;
    v12 = v40;
    v5 = v41;
    sub_2289D6FAC(v25, v37, v38);
    swift_bridgeObjectRelease();
  }
  else
  {
    v30 = 0;
    v36 = 0;
    v35 = 0;
  }
  *a2 = v5;
  a2[1] = v12;
  a2[2] = v16;
  a2[3] = v42;
  a2[4] = v30;
  a2[5] = v19;
  a2[6] = v36;
  a2[7] = v35;
  sub_2289D6F3C(v5, v12, v16, v42);
  sub_2289D6F3C(v30, v19, v36, v35);
  sub_2289D6F7C(v30, v19, v36, v35);
  return sub_2289D6F7C(v5, v12, v16, v42);
}

uint64_t sub_2289E9D40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DADD0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)v1;
  v7 = *(unsigned __int8 *)(v1 + 8);
  v9 = *(_QWORD *)(v1 + 16);
  v8 = *(void **)(v1 + 24);
  *(_QWORD *)v5 = sub_2289EA858();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DADD8);
  sub_2289E8EE4(v6, v7, v9, v8, (uint64_t)&v5[*(int *)(v10 + 44)]);
  sub_2289D6BCC(v6, v7);
  LOBYTE(v8) = sub_2289E8AA4(v6, v7);
  sub_2289D6C04(v6, v7);
  if ((v8 & 1) != 0)
    v11 = 1.0;
  else
    v11 = 0.5;
  sub_2289DCA60((uint64_t)v5, a1, &qword_2559DADD0);
  *(double *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559DADE0) + 36)) = v11;
  return sub_2289DBD50((uint64_t)v5, &qword_2559DADD0);
}

unint64_t sub_2289E9E70()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DADF0;
  if (!qword_2559DADF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DADE0);
    v2[0] = sub_2289D7088(&qword_2559DADF8, &qword_2559DADD0, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DADF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SUIKPSliderCell()
{
  return &type metadata for SUIKPSliderCell;
}

uint64_t sub_2289E9F04()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2289E9F14(void *a1@<X3>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  unsigned int *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  id v26;
  double v27;
  id v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  double v48;

  v43 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAE18);
  v42 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v41 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DA958);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1;
  v13 = (void *)sub_2289D9398();

  v14 = (unsigned int *)MEMORY[0x24BDF4060];
  if (v13)
  {
    v15 = v13;
    sub_2289EAAD4();
    v16 = *v14;
    v17 = sub_2289EAAF8();
    v18 = *(_QWORD *)(v17 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 104))(v11, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v11, 0, 1, v17);
    v13 = (void *)sub_2289EAAEC();

    swift_release();
    sub_2289DBD50((uint64_t)v11, &qword_2559DA958);
  }
  v19 = v12;
  v20 = sub_2289DA614();
  v22 = v21;
  v24 = v23;
  v25 = v20;

  v46 = v22;
  v47 = v24;
  v48 = v25;
  v26 = v19;
  v27 = sub_2289DB3A0();

  v28 = v26;
  v29 = sub_2289DB4CC();

  if (v27 > v29)
  {
    __break(1u);
  }
  else
  {
    v44 = v27;
    v45 = v29;
    sub_2289EA3C0();
    sub_2289EAB34();
    v30 = v28;
    v31 = (void *)sub_2289D9398();

    if (v31)
    {
      v32 = v31;
      sub_2289EAAD4();
      v33 = *MEMORY[0x24BDF4060];
      v34 = sub_2289EAAF8();
      v35 = *(_QWORD *)(v34 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v35 + 104))(v11, v33, v34);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v11, 0, 1, v34);
      v31 = (void *)sub_2289EAAEC();

      swift_release();
      sub_2289DBD50((uint64_t)v11, &qword_2559DA958);
    }
    v36 = v42;
    v37 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
    v37(v6, v8, v3);
    v38 = v43;
    *(_QWORD *)v43 = v13;
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAE28);
    v37(&v38[*(int *)(v39 + 48)], v6, v3);
    *(_QWORD *)&v38[*(int *)(v39 + 64)] = v31;
    v40 = *(void (**)(char *, uint64_t))(v36 + 8);
    swift_retain();
    swift_retain();
    v40(v8, v3);
    swift_release();
    v40(v6, v3);
    swift_release();
  }
}

uint64_t sub_2289EA250@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAE00);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)v1;
  v7 = *(_BYTE *)(v1 + 8);
  v8 = *(void **)(v1 + 24);
  *(_QWORD *)v5 = sub_2289EA858();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAE08);
  sub_2289E9F14(v8, &v5[*(int *)(v9 + 44)]);
  sub_2289D6BCC(v6, v7);
  LOBYTE(v8) = sub_2289E8AA4(v6, v7);
  sub_2289D6C04(v6, v7);
  if ((v8 & 1) != 0)
    v10 = 1.0;
  else
    v10 = 0.5;
  sub_2289EA378((uint64_t)v5, a1);
  *(double *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2559DAE10) + 36)) = v10;
  return sub_2289DBD50((uint64_t)v5, &qword_2559DAE00);
}

uint64_t sub_2289EA378(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2559DAE00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2289EA3C0()
{
  unint64_t result;

  result = qword_2559DAE20;
  if (!qword_2559DAE20)
  {
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_2559DAE20);
  }
  return result;
}

unint64_t sub_2289EA408()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2559DAE30;
  if (!qword_2559DAE30)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAE10);
    v2[0] = sub_2289EA474();
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2559DAE30);
  }
  return result;
}

unint64_t sub_2289EA474()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2559DAE38;
  if (!qword_2559DAE38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2559DAE00);
    result = MEMORY[0x22E2B85BC](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_2559DAE38);
  }
  return result;
}

void *static _ControllerFactory.thirdPartySettingsControllerForSpecifier(specifier:)(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_allocWithZone((Class)type metadata accessor for SUIKPThirdPartyAppListController());
  sub_2289D7150();
  v4 = v3;
  objc_msgSend(v3, sel_setSpecifier_, a1);
  return v4;
}

id _ControllerFactory.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id _ControllerFactory.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _ControllerFactory();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for _ControllerFactory()
{
  return objc_opt_self();
}

id _ControllerFactory.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _ControllerFactory();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2289EA678()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BundleClass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BundleClass()
{
  return objc_opt_self();
}

uint64_t sub_2289EA6CC()
{
  return MEMORY[0x24BDCF638]();
}

uint64_t sub_2289EA6D8()
{
  return MEMORY[0x24BEBBE78]();
}

uint64_t sub_2289EA6E4()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_2289EA6F0()
{
  return MEMORY[0x24BEC6500]();
}

uint64_t sub_2289EA6FC()
{
  return MEMORY[0x24BEB6DD0]();
}

uint64_t sub_2289EA708()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2289EA714()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2289EA720()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2289EA72C()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2289EA738()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_2289EA744()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2289EA750()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2289EA75C()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2289EA768()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_2289EA774()
{
  return MEMORY[0x24BDEB748]();
}

uint64_t sub_2289EA780()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_2289EA78C()
{
  return MEMORY[0x24BDEC888]();
}

uint64_t sub_2289EA798()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_2289EA7A4()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_2289EA7B0()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_2289EA7BC()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_2289EA7C8()
{
  return MEMORY[0x24BDEDF98]();
}

uint64_t sub_2289EA7D4()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_2289EA7E0()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_2289EA7EC()
{
  return MEMORY[0x24BDEE090]();
}

uint64_t sub_2289EA7F8()
{
  return MEMORY[0x24BDEE098]();
}

uint64_t sub_2289EA804()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_2289EA810()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_2289EA81C()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_2289EA828()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_2289EA834()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_2289EA840()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_2289EA84C()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_2289EA858()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_2289EA864()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_2289EA870()
{
  return MEMORY[0x24BDEECF8]();
}

uint64_t sub_2289EA87C()
{
  return MEMORY[0x24BDEED70]();
}

uint64_t sub_2289EA888()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_2289EA894()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_2289EA8A0()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_2289EA8AC()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_2289EA8B8()
{
  return MEMORY[0x24BDEF1A0]();
}

uint64_t sub_2289EA8C4()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_2289EA8D0()
{
  return MEMORY[0x24BDEF1D8]();
}

uint64_t sub_2289EA8DC()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_2289EA8E8()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_2289EA8F4()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_2289EA900()
{
  return MEMORY[0x24BDEF7A0]();
}

uint64_t sub_2289EA90C()
{
  return MEMORY[0x24BDEF7A8]();
}

uint64_t sub_2289EA918()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_2289EA924()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_2289EA930()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_2289EA93C()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_2289EA948()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_2289EA954()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_2289EA960()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_2289EA96C()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_2289EA978()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_2289EA984()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2289EA990()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2289EA99C()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_2289EA9A8()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_2289EA9B4()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_2289EA9C0()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_2289EA9CC()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_2289EA9D8()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_2289EA9E4()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_2289EA9F0()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_2289EA9FC()
{
  return MEMORY[0x24BE85518]();
}

uint64_t sub_2289EAA08()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2289EAA14()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2289EAA20()
{
  return MEMORY[0x24BDF2500]();
}

uint64_t sub_2289EAA2C()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_2289EAA38()
{
  return MEMORY[0x24BDF2600]();
}

uint64_t sub_2289EAA44()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2289EAA50()
{
  return MEMORY[0x24BDF2B78]();
}

uint64_t sub_2289EAA5C()
{
  return MEMORY[0x24BDF2C78]();
}

uint64_t sub_2289EAA68()
{
  return MEMORY[0x24BDF2C98]();
}

uint64_t sub_2289EAA74()
{
  return MEMORY[0x24BDF3020]();
}

uint64_t sub_2289EAA80()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_2289EAA8C()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_2289EAA98()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_2289EAAA4()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_2289EAAB0()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_2289EAABC()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_2289EAAC8()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_2289EAAD4()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_2289EAAE0()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_2289EAAEC()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_2289EAAF8()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_2289EAB04()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_2289EAB10()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_2289EAB1C()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_2289EAB28()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_2289EAB34()
{
  return MEMORY[0x24BDF45D8]();
}

uint64_t sub_2289EAB40()
{
  return MEMORY[0x24BDF4678]();
}

uint64_t sub_2289EAB4C()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_2289EAB58()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_2289EAB64()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_2289EAB70()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_2289EAB7C()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_2289EAB88()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_2289EAB94()
{
  return MEMORY[0x24BDF5380]();
}

uint64_t sub_2289EABA0()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2289EABAC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2289EABB8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2289EABC4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2289EABD0()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2289EABDC()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2289EABE8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2289EABF4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2289EAC00()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2289EAC0C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2289EAC18()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2289EAC24()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_2289EAC30()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2289EAC3C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2289EAC48()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2289EAC54()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_2289EAC60()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_2289EAC6C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2289EAC78()
{
  return MEMORY[0x24BEE1C60]();
}

uint64_t sub_2289EAC84()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2289EAC90()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2289EAC9C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2289EACA8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2289EACB4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2289EACC0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2289EACCC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2289EACD8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2289EACE4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2289EACF0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2289EACFC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2289EAD08()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2289EAD14()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2289EAD20()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2289EAD2C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2289EAD38()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2289EAD44()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2289EAD50()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2289EAD5C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2289EAD68()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2289EAD74()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2289EAD80()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2289EAD8C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2289EAD98()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2289EADA4()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_2289EADB0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2289EADBC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t CreateDetailControllerInstanceWithClass()
{
  return MEMORY[0x24BE75420]();
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x24BDD11C8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

