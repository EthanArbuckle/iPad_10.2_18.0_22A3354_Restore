uint64_t sub_249BABBE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_249BAD2A0(0, &qword_2578C8C68);
  result = sub_249BAD92C();
  *a1 = result;
  return result;
}

uint64_t sub_249BABC30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_249BAD2A0(0, &qword_2578C8C60);
  result = sub_249BAD92C();
  *a1 = result;
  return result;
}

uint64_t USUIMoreHelpContextMenuSwiftUI.USUIHelpMenuActions.init(messageSomeoneAction:blockContactAction:blockContactsAction:moreHelpAction:leaveChatAction:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  return result;
}

uint64_t USUIMoreHelpContextMenuSwiftUI.init(options:contentView:showTitle:actions:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, _OWORD *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __n128 v20;
  _OWORD v22[5];

  v14 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend((id)objc_opt_self(), sel_getCurrentInterventionType);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a2, a5);
  v18 = a4[1];
  v22[0] = *a4;
  v22[1] = v18;
  v19 = a4[3];
  v22[2] = a4[2];
  v22[3] = v19;
  v22[4] = a4[4];
  v20 = USUIMoreHelpContextMenuSwiftUI.init(options:interventionType:contentView:showTitle:actions:)(a1, (uint64_t)v17, (uint64_t)v16, a3, (uint64_t)v22, a5, a6, a7);
  return (*(uint64_t (**)(uint64_t, uint64_t, __n128))(v14 + 8))(a2, a5, v20);
}

__n128 USUIMoreHelpContextMenuSwiftUI.init(options:interventionType:contentView:showTitle:actions:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X8>)
{
  uint64_t v14;
  int *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  __n128 result;

  *(_QWORD *)a8 = objc_msgSend((id)objc_opt_self(), sel_modelWithOptions_interventionType_, a1, a2);
  v15 = (int *)type metadata accessor for USUIMoreHelpContextMenuSwiftUI(0, a6, a7, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(&a8[v15[9]], a3, a6);
  a8[v15[10]] = a4;
  v16 = &a8[v15[11]];
  v17 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)v16 = *(_OWORD *)a5;
  *((_OWORD *)v16 + 1) = v17;
  v18 = *(_OWORD *)(a5 + 48);
  *((_OWORD *)v16 + 2) = *(_OWORD *)(a5 + 32);
  *((_OWORD *)v16 + 3) = v18;
  result = *(__n128 *)(a5 + 64);
  *((__n128 *)v16 + 4) = result;
  return result;
}

uint64_t type metadata accessor for USUIMoreHelpContextMenuSwiftUI(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for USUIMoreHelpContextMenuSwiftUI);
}

uint64_t USUIMoreHelpContextMenuSwiftUI.body.getter@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  void (*v15)(_BYTE *, _BYTE *, uint64_t);
  void (*v16)(_BYTE *, uint64_t);
  _BYTE v18[16];
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

  v5 = *(_QWORD *)(a1 + 16);
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2578C8C50);
  v7 = *(_QWORD *)(a1 + 24);
  v25 = v5;
  v26 = v6;
  v27 = v7;
  v28 = sub_249BAD438(&qword_2578C8C58, &qword_2578C8C50, MEMORY[0x24BDF5428]);
  v8 = sub_249BAD8C0();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v14 = &v18[-v13];
  v22 = v5;
  v23 = v7;
  v24 = v2;
  v19 = v5;
  v20 = v7;
  v21 = v2;
  sub_249BAD8B4();
  MEMORY[0x24BD00070](MEMORY[0x24BDF1A70], v8);
  v15 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 16);
  v15(v14, v12, v8);
  v16 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
  v16(v12, v8);
  v15(a2, v14, v8);
  return ((uint64_t (*)(_BYTE *, uint64_t))v16)(v14, v8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD00064](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_249BAC034@<X0>(id *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  int v43;
  uint64_t KeyPath;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v5 = a3;
  v42 = a5;
  v45 = a2;
  v7 = type metadata accessor for USUIMoreHelpContextMenuSwiftUI(0, a2, a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v40 - v9;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C8C70);
  v51 = *(_QWORD *)(v41 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v49 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v50 = (char *)&v40 - v13;
  v14 = *a1;
  if (*((_BYTE *)a1 + *(int *)(v7 + 40)) == 1)
  {
    v15 = objc_msgSend(*a1, sel_title);
    v16 = v5;
    v17 = sub_249BAD914();
    v19 = v18;

    v52 = v17;
    v53 = v19;
    v5 = v16;
    sub_249BAD568();
    v20 = sub_249BAD8CC();
    v47 = v21;
    v48 = v20;
    v46 = v22;
    v24 = v23 & 1;
    KeyPath = swift_getKeyPath();
    v43 = 1;
  }
  else
  {
    v47 = 0;
    v48 = 0;
    v24 = 0;
    v46 = 0;
    KeyPath = 0;
    v43 = 0;
  }
  v25 = objc_msgSend(v14, sel_actions);
  sub_249BAD2A0(0, &qword_2578C8C60);
  v26 = sub_249BAD920();

  v52 = v26;
  (*(void (**)(char *, id *, uint64_t))(v8 + 16))(v10, a1, v7);
  v27 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = v45;
  *(_QWORD *)(v28 + 24) = v5;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v28 + v27, v10, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578C8C78);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578C8C80);
  sub_249BAD438(&qword_2578C8C88, &qword_2578C8C78, MEMORY[0x24BEE12D8]);
  sub_249BAD438(&qword_2578C8C90, &qword_2578C8C80, MEMORY[0x24BDF43B0]);
  sub_249BAD478();
  v29 = v50;
  sub_249BAD908();
  v30 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
  v31 = v49;
  v32 = v41;
  v30(v49, v29, v41);
  v34 = v47;
  v33 = v48;
  v35 = v42;
  *v42 = v48;
  v35[1] = v34;
  v36 = v46;
  v35[2] = v24;
  v35[3] = v36;
  v35[4] = KeyPath;
  v35[5] = 0;
  *((_BYTE *)v35 + 48) = v43;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C8CA0);
  v30((char *)v35 + *(int *)(v37 + 48), v31, v32);
  sub_249BAD4D0(v33, v34, v24, v36);
  v38 = *(void (**)(char *, uint64_t))(v51 + 8);
  v38(v50, v32);
  v38(v31, v32);
  return sub_249BAD51C(v33, v34, v24, v36);
}

uint64_t sub_249BAC3C0@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_249BAC034(*(id **)(v2 + 32), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a1, a2);
}

uint64_t sub_249BAC3CC@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v26 = a2;
  v30 = a4;
  v31 = a5;
  v29 = a3;
  v6 = type metadata accessor for USUIMoreHelpContextMenuSwiftUI(0, a3, a4, a4);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v26 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578C8CB0);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578C8C80);
  v27 = *(_QWORD *)(v12 - 8);
  v28 = v12;
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *a1;
  v16 = objc_msgSend(v15, sel_title);
  v17 = sub_249BAD914();
  v19 = v18;

  v32 = v17;
  v33 = v19;
  if (objc_msgSend(v15, sel_destructive))
    sub_249BAD878();
  else
    sub_249BAD884();
  v20 = sub_249BAD890();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v11, 0, 1, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v26, v6);
  v21 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v22 = (char *)swift_allocObject();
  v23 = v30;
  *((_QWORD *)v22 + 2) = v29;
  *((_QWORD *)v22 + 3) = v23;
  *((_QWORD *)v22 + 4) = v15;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v22[v21], v9, v6);
  sub_249BAD568();
  v24 = v15;
  sub_249BAD8FC();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v31, v14, v28);
}

uint64_t sub_249BAC5F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v15;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1 + *(int *)(type metadata accessor for USUIMoreHelpContextMenuSwiftUI(0, v9, v10, v11) + 36);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v13(v8, v12, a2);
  v13(a3, (uint64_t)v8, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

uint64_t sub_249BAC694@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_249BAC5F0(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_249BAC6A0()
{
  return MEMORY[0x24BEE0948];
}

uint64_t sub_249BAC6AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_249BAC6E8()
{
  return sub_249BAD8F0();
}

uint64_t sub_249BAC704()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_249BAC70C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void **sub_249BAC79C(void **a1, void **a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char *v8;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  char *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = *(_QWORD *)(a3 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_DWORD *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(_DWORD *)(v4 + 80) & 0x100000;
  v8 = (char *)*a2;
  *a1 = *a2;
  if (v5 > 7 || v7 != 0 || ((((v5 + 8) & ~v5) + v6) & 0xFFFFFFFFFFFFFFF8) + 88 > 0x18)
  {
    v11 = (void **)&v8[(v5 & 0xF8 ^ 0x1F8) & (v5 + 16)];
  }
  else
  {
    v11 = a1;
    v12 = ((unint64_t)a1 + v5 + 8) & ~v5;
    v13 = ((unint64_t)a2 + v5 + 8) & ~v5;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v15 = v8;
    v14(v12, v13, v3);
    *(_BYTE *)(v12 + v6) = *(_BYTE *)(v13 + v6);
    v16 = (_QWORD *)((v12 + v6) & 0xFFFFFFFFFFFFFFF8);
    v17 = (_QWORD *)((v13 + v6) & 0xFFFFFFFFFFFFFFF8);
    v18 = v17[2];
    v16[1] = v17[1];
    v16[2] = v18;
    v19 = v17[4];
    v16[3] = v17[3];
    v16[4] = v19;
    v20 = v17[6];
    v16[5] = v17[5];
    v16[6] = v20;
    v21 = v17[8];
    v16[7] = v17[7];
    v16[8] = v21;
    v22 = v17[10];
    v16[9] = v17[9];
    v16[10] = v22;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v11;
}

uint64_t sub_249BAC8C8(id *a1, uint64_t a2)
{

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))(((unint64_t)a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)
                                                                                            + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void **sub_249BAC94C(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *a2;
  *a1 = *a2;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 8) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 8) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v11 = v4;
  v10(v8, v9, v5);
  v12 = *(_QWORD *)(v6 + 64);
  v13 = v8 + v12;
  v14 = v9 + v12;
  *(_BYTE *)v13 = *(_BYTE *)v14;
  v13 &= 0xFFFFFFFFFFFFFFF8;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  v15 = *(_QWORD *)(v14 + 16);
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(v14 + 8);
  *(_QWORD *)(v13 + 16) = v15;
  v16 = *(_QWORD *)(v14 + 32);
  *(_QWORD *)(v13 + 24) = *(_QWORD *)(v14 + 24);
  *(_QWORD *)(v13 + 32) = v16;
  v17 = *(_QWORD *)(v14 + 48);
  *(_QWORD *)(v13 + 40) = *(_QWORD *)(v14 + 40);
  *(_QWORD *)(v13 + 48) = v17;
  v18 = *(_QWORD *)(v14 + 64);
  *(_QWORD *)(v13 + 56) = *(_QWORD *)(v14 + 56);
  *(_QWORD *)(v13 + 64) = v18;
  v19 = *(_QWORD *)(v14 + 80);
  *(_QWORD *)(v13 + 72) = *(_QWORD *)(v14 + 72);
  *(_QWORD *)(v13 + 80) = v19;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void **sub_249BACA24(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = ((unint64_t)a1 + v10 + 8) & ~v10;
  v12 = ((unint64_t)a2 + v10 + 8) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v9 + 24))(v11, v12);
  v13 = *(_QWORD *)(v9 + 64);
  v14 = v11 + v13;
  v15 = v12 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  v16 = (_QWORD *)(v14 & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)(v15 & 0xFFFFFFFFFFFFFFF8);
  v18 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFFF8) + 16);
  v16[1] = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFFF8) + 8);
  v16[2] = v18;
  swift_retain();
  swift_release();
  v19 = v17[4];
  v16[3] = v17[3];
  v16[4] = v19;
  swift_retain();
  swift_release();
  v20 = v17[6];
  v16[5] = v17[5];
  v16[6] = v20;
  swift_retain();
  swift_release();
  v21 = v17[8];
  v16[7] = v17[7];
  v16[8] = v21;
  swift_retain();
  swift_release();
  v22 = v17[10];
  v16[9] = v17[9];
  v16[10] = v22;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_249BACB2C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = ((unint64_t)a1 + v5 + 8) & ~v5;
  v7 = ((unint64_t)a2 + v5 + 8) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  v8 = *(_QWORD *)(v4 + 64);
  v9 = v6 + v8;
  v10 = v7 + v8;
  *(_BYTE *)v9 = *(_BYTE *)v10;
  v9 &= 0xFFFFFFFFFFFFFFF8;
  v10 &= 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + 8);
  v11 = *(_OWORD *)(v10 + 72);
  v12 = *(_OWORD *)(v10 + 56);
  v13 = *(_OWORD *)(v10 + 40);
  *(_OWORD *)(v9 + 24) = *(_OWORD *)(v10 + 24);
  *(_OWORD *)(v9 + 40) = v13;
  *(_OWORD *)(v9 + 56) = v12;
  *(_OWORD *)(v9 + 72) = v11;
  return a1;
}

void **sub_249BACBD0(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 8) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v9, v10);
  v11 = *(_QWORD *)(v7 + 64);
  v12 = v9 + v11;
  v13 = v10 + v11;
  *(_BYTE *)v12 = *(_BYTE *)v13;
  v14 = v12 & 0xFFFFFFFFFFFFFFF8;
  v15 = v13 & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)((v12 & 0xFFFFFFFFFFFFFFF8) + 8) = *(_OWORD *)((v13 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_release();
  *(_OWORD *)(v14 + 24) = *(_OWORD *)(v15 + 24);
  swift_release();
  *(_OWORD *)(v14 + 40) = *(_OWORD *)(v15 + 40);
  swift_release();
  *(_OWORD *)(v14 + 56) = *(_OWORD *)(v15 + 56);
  swift_release();
  *(_OWORD *)(v14 + 72) = *(_OWORD *)(v15 + 72);
  swift_release();
  return a1;
}

uint64_t sub_249BACCAC(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  if (v6 >= a2)
  {
    if ((v5 & 0x80000000) != 0)
    {
      return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v7 + 8) & ~v7);
    }
    else
    {
      v12 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
  }
  else
  {
    if (((((((v7 + 8) & ~v7) + *(_QWORD *)(v4 + 64)) & 0xFFFFFFFFFFFFFFF8) + 88) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_249BACD34 + 4 * byte_249BADFD0[v10]))();
  }
}

void sub_249BACDB4(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(unsigned __int8 *)(v5 + 80);
  if (v6 >= a3)
  {
    v10 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if ((((((_DWORD)v7 + 8) & ~(_DWORD)v7) + *(_DWORD *)(v5 + 64)) & 0xFFFFFFF8) == 0xFFFFFFA8)
      v8 = a3 - v6 + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X13 }
  }
  if ((((((_DWORD)v7 + 8) & ~(_DWORD)v7) + *(_DWORD *)(v5 + 64)) & 0xFFFFFFF8) != 0xFFFFFFA8)
  {
    v11 = ~v6 + a2;
    bzero(a1, ((((v7 + 8) & ~v7) + *(_QWORD *)(v5 + 64)) & 0xFFFFFFFFFFFFFFF8) + 88);
    *a1 = v11;
  }
  __asm { BR              X10 }
}

void sub_249BACEB8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x249BACF20);
}

void sub_249BACEC0(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x249BACEC8);
  JUMPOUT(0x249BACF20);
}

void sub_249BACED8()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x249BACF20);
}

void sub_249BACEE0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x249BACF20);
}

void sub_249BACEE8(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_WORD *)(v3 + v4) = 0;
  if (a2)
  {
    if ((a3 & 0x80000000) == 0)
    {
      if ((a2 & 0x80000000) == 0)
        JUMPOUT(0x249BACF1CLL);
      JUMPOUT(0x249BACF18);
    }
    JUMPOUT(0x249BACEF4);
  }
  JUMPOUT(0x249BACF20);
}

uint64_t sub_249BACF38()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_249BACF40(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_249BACF70()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_249BACFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v3 = *(_QWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_249BAD048(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

_OWORD *sub_249BAD108(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  return a1;
}

uint64_t sub_249BAD17C(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_249BAD1C4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for USUIMoreHelpContextMenuSwiftUI.USUIHelpMenuActions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for USUIMoreHelpContextMenuSwiftUI.USUIHelpMenuActions);
}

uint64_t sub_249BAD224()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2578C8C50);
  sub_249BAD438(&qword_2578C8C58, &qword_2578C8C50, MEMORY[0x24BDF5428]);
  v0 = sub_249BAD8C0();
  return MEMORY[0x24BD00070](MEMORY[0x24BDF1A70], v0);
}

uint64_t sub_249BAD2A0(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD00058]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_249BAD318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for USUIMoreHelpContextMenuSwiftUI(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = (id *)(v4 + ((v7 + 32) & ~v7));

  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))((char *)v8 + *(int *)(v6 + 36), v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_249BAD3D0@<X0>(void **a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for USUIMoreHelpContextMenuSwiftUI(0, v6, v7, a2) - 8)
                          + 80);
  return sub_249BAC3CC(a1, v3 + ((v8 + 32) & ~v8), v6, v7, a3);
}

uint64_t sub_249BAD438(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BD00070](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_249BAD478()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578C8C98;
  if (!qword_2578C8C98)
  {
    v1 = sub_249BAD2A0(255, &qword_2578C8C60);
    result = MEMORY[0x24BD00070](&protocol conformance descriptor for USUIMoreHelpMenuAction, v1);
    atomic_store(result, (unint64_t *)&qword_2578C8C98);
  }
  return result;
}

uint64_t sub_249BAD4D0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_249BAD50C(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_249BAD50C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_249BAD51C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_249BAD558(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_249BAD558(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_249BAD568()
{
  unint64_t result;

  result = qword_2578C8CA8;
  if (!qword_2578C8CA8)
  {
    result = MEMORY[0x24BD00070](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2578C8CA8);
  }
  return result;
}

uint64_t sub_249BAD5AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_249BAD89C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_249BAD5DC()
{
  return sub_249BAD8A8();
}

uint64_t sub_249BAD608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for USUIMoreHelpContextMenuSwiftUI(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = (v7 + 40) & ~v7;

  v9 = (id *)(v4 + v8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))((char *)v9 + *(int *)(v6 + 36), v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

id sub_249BAD6C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id result;
  uint64_t v8;
  uint64_t (**v9)(void);

  v5 = type metadata accessor for USUIMoreHelpContextMenuSwiftUI(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  result = objc_msgSend(*(id *)(v4 + 32), sel_actionID);
  v8 = v4 + ((v6 + 40) & ~v6);
  switch((unint64_t)result)
  {
    case 1uLL:
      v9 = (uint64_t (**)(void))(v8 + *(int *)(v5 + 44));
      goto LABEL_7;
    case 2uLL:
      v9 = (uint64_t (**)(void))(v8 + *(int *)(v5 + 44) + 48);
      goto LABEL_7;
    case 3uLL:
      v9 = (uint64_t (**)(void))(v8 + *(int *)(v5 + 44) + 64);
      goto LABEL_7;
    case 4uLL:
      v9 = (uint64_t (**)(void))(v8 + *(int *)(v5 + 44) + 16);
      goto LABEL_7;
    case 5uLL:
      v9 = (uint64_t (**)(void))(v8 + *(int *)(v5 + 44) + 32);
LABEL_7:
      result = (id)(*v9)();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24BD00028](a1, v6, a5);
}

uint64_t sub_249BAD7D4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_249BAD878()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_249BAD884()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_249BAD890()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_249BAD89C()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_249BAD8A8()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_249BAD8B4()
{
  return MEMORY[0x24BDF1A48]();
}

uint64_t sub_249BAD8C0()
{
  return MEMORY[0x24BDF1A58]();
}

uint64_t sub_249BAD8CC()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_249BAD8D8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_249BAD8E4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_249BAD8F0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_249BAD8FC()
{
  return MEMORY[0x24BDF4368]();
}

uint64_t sub_249BAD908()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_249BAD914()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_249BAD920()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_249BAD92C()
{
  return MEMORY[0x24BEE2578]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

