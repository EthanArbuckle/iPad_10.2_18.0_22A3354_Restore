uint64_t sub_21FF8F0D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v40 = a5;
  v41 = a6;
  v38 = a3;
  v9 = sub_21FFC55D0();
  v35 = *(_QWORD *)(v9 - 8);
  v36 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v33 - v13;
  _s11ArtworkViewVMa(255, a2, a4, v15);
  sub_21FFC419C();
  _s9CellTitleVMa(255, a2, a4, v16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E2A0);
  sub_21FFC419C();
  swift_getTupleTypeMetadata2();
  sub_21FFC4EBC();
  sub_21FFC4C58();
  sub_21FFC419C();
  swift_getTupleTypeMetadata2();
  v17 = sub_21FFC4EBC();
  v33[1] = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v17);
  v18 = sub_21FFC4D54();
  v34 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)v33 - v22;
  v39 = a1;
  v24 = a2;
  v37 = a4;
  sub_21FFC39E0();
  v25 = v35;
  v26 = v36;
  (*(void (**)(char *, _QWORD, uint64_t))(v35 + 104))(v12, *MEMORY[0x24BE6ADD0], v36);
  LOBYTE(a1) = sub_21FFC55C4();
  v27 = *(void (**)(char *, uint64_t))(v25 + 8);
  v27(v12, v26);
  v27(v14, v26);
  if ((a1 & 1) != 0)
    v28 = sub_21FFC4478();
  else
    v28 = sub_21FFC4484();
  MEMORY[0x24BDAC7A8](v28);
  v29 = v38;
  v33[-6] = v24;
  v33[-5] = v29;
  v30 = v40;
  v33[-4] = v37;
  v33[-3] = v30;
  v33[-2] = v39;
  sub_21FFC4D48();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF4700], v18);
  sub_21FFB5D18((uint64_t)v21, v18, (uint64_t)v23);
  v31 = *(void (**)(char *, uint64_t))(v34 + 8);
  v31(v21, v18);
  sub_21FFB57EC((uint64_t)v23, v18, v41);
  return ((uint64_t (*)(char *, uint64_t))v31)(v23, v18);
}

void sub_21FF8F3EC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  _QWORD v29[17];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v34 = a3;
  v35 = a5;
  v37 = a1;
  v31 = a6;
  _s9CellTitleVMa(255, a2, a4, a4);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E2A0);
  sub_21FFC419C();
  swift_getTupleTypeMetadata2();
  v29[8] = sub_21FFC4EBC();
  v8 = sub_21FFC4C58();
  v29[12] = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v29[11] = (char *)v29 - v9;
  v29[13] = v10;
  v30 = sub_21FFC419C();
  v29[14] = *(_QWORD *)(v30 - 8);
  v11 = MEMORY[0x24BDAC7A8](v30);
  v29[16] = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v29[10] = (char *)v29 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v29[15] = (char *)v29 - v15;
  v16 = sub_21FFC55D0();
  v29[6] = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v19 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = _s11ArtworkViewVMa(0, a2, a4, v22);
  v29[4] = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v36 = sub_21FFC419C();
  v32 = *(_QWORD *)(v36 - 8);
  v24 = MEMORY[0x24BDAC7A8](v36);
  v29[9] = (char *)v29 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  MEMORY[0x24BDAC7A8](v26);
  v33 = (char *)v29 - v27;
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v29[3] = v21;
  v28(v21, v37, a2);
  v38 = a2;
  v39 = v34;
  v40 = a4;
  v41 = v35;
  _s9VItemCellVMa();
}

uint64_t sub_21FF8F704(uint64_t a1)
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
  void (*v10)(uint64_t);
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
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
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);

  *(_QWORD *)(v8 - 264) = *(int *)(a1 + 56);
  *(_QWORD *)(v8 - 360) = v7;
  sub_21FFC39E0();
  v9 = *(_QWORD *)(v8 - 368);
  v10 = *(void (**)(uint64_t))(v9 + 104);
  *(_DWORD *)(v8 - 396) = *MEMORY[0x24BE6ADD0];
  *(_QWORD *)(v8 - 408) = v10;
  v10(v2);
  sub_21FFC55C4();
  v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  *(_QWORD *)(v8 - 376) = v2;
  v11(v2, v3);
  *(_QWORD *)(v8 - 368) = v3;
  v11(v5, v3);
  sub_21FF89FC8();
  sub_21FFC4E5C();
  v12 = MEMORY[0x2207DB4B4](&unk_21FFCA0A0, v4);
  sub_21FFC4AFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 384) + 8))(v1, v4);
  v13 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v8 - 152) = v12;
  *(_QWORD *)(v8 - 144) = v13;
  v14 = *(_QWORD *)(v8 - 224);
  v15 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v14, v8 - 152);
  v16 = *(_QWORD *)(v8 - 248);
  *(_QWORD *)(v8 - 392) = v15;
  sub_21FFB5D18(v6, v14, v16);
  v17 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 256) + 8);
  *(_QWORD *)(v8 - 384) = v17;
  v18 = v17(v6, v14);
  MEMORY[0x24BDAC7A8](v18);
  v19 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], *(_QWORD *)(v8 - 352));
  v20 = *(_QWORD *)(v8 - 328);
  sub_21FFC4C4C();
  sub_21FFC39E0();
  v21 = *(_QWORD *)(v8 - 376);
  v22 = *(_QWORD *)(v8 - 368);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 - 408))(v21, *(unsigned int *)(v8 - 396), v22);
  LOBYTE(v14) = sub_21FFC55C4();
  v11(v21, v22);
  v11(v5, v22);
  if ((v14 & 1) != 0)
    sub_21FFC4E50();
  else
    sub_21FFC4E5C();
  *(_QWORD *)(v8 - 160) = v19;
  v23 = *(_QWORD *)(v8 - 312);
  v24 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF3F50], v23, v8 - 160);
  v25 = *(_QWORD *)(v8 - 336);
  sub_21FFC4AFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 320) + 8))(v20, v23);
  *(_QWORD *)(v8 - 176) = v24;
  *(_QWORD *)(v8 - 168) = MEMORY[0x24BDEBEE0];
  v26 = *(_QWORD *)(v8 - 280);
  v27 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v26, v8 - 176);
  v28 = *(_QWORD *)(v8 - 296);
  sub_21FFB5D18(v25, v26, v28);
  v29 = *(_QWORD *)(v8 - 304);
  v30 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  v30(v25, v26);
  v31 = *(_QWORD *)(v8 - 248);
  v32 = *(_QWORD *)(v8 - 344);
  v33 = *(_QWORD *)(v8 - 224);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 256) + 16))(v32, v31, v33);
  *(_QWORD *)(v8 - 136) = v32;
  v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16);
  v35 = *(_QWORD *)(v8 - 288);
  v34(v35, v28, v26);
  *(_QWORD *)(v8 - 128) = v35;
  *(_QWORD *)(v8 - 192) = v33;
  *(_QWORD *)(v8 - 184) = v26;
  *(_QWORD *)(v8 - 208) = *(_QWORD *)(v8 - 392);
  *(_QWORD *)(v8 - 200) = v27;
  sub_21FF51C7C(v8 - 136, 2, v8 - 192);
  v30(v28, v26);
  v36 = *(void (**)(uint64_t, uint64_t))(v8 - 384);
  v36(v31, v33);
  v30(v35, v26);
  return ((uint64_t (*)(uint64_t, uint64_t))v36)(v32, v33);
}

void sub_21FF8FB5C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
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
  _QWORD v36[2];

  v29 = a3;
  v30 = a5;
  v27 = a1;
  v31 = a6;
  v8 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _s9CellTitleVMa(0, v11, v12, v12);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v26 - v15;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E2A0);
  v17 = sub_21FFC419C();
  v28 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v26 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v27, a2);
  v23 = sub_21FF0E140();
  sub_21FF5EA94((uint64_t)v10, v23 & 1, 1, a2, a4, (uint64_t)v16);
  sub_21FFC4BBC();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v25 = sub_21FF900E4((uint64_t *)&qword_25558E298, &qword_25558E2A0);
  v36[0] = v24;
  v36[1] = v25;
  MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v17, v36);
  sub_21FFB5D18((uint64_t)v20, v17, (uint64_t)v22);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v20, v17);
  v32 = a2;
  v33 = v29;
  v34 = a4;
  v35 = v30;
  _s9VItemCellVMa();
}

uint64_t sub_21FF8FD5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  __int16 v13;

  v9 = sub_21FF8FE0C(a1);
  v11 = v10;
  v13 = v12;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v7, v2);
  *(_QWORD *)(v8 - 128) = v9;
  *(_QWORD *)(v8 - 120) = v11;
  *(_BYTE *)(v8 - 112) = v13 & 1;
  *(_BYTE *)(v8 - 111) = HIBYTE(v13) & 1;
  *(_QWORD *)(v8 - 144) = v3;
  *(_QWORD *)(v8 - 136) = v6;
  *(_QWORD *)(v8 - 160) = v2;
  *(_QWORD *)(v8 - 152) = &_s12CellSubtitleVN;
  *(_QWORD *)(v8 - 176) = v1;
  *(_QWORD *)(v8 - 168) = sub_21FF855F0();
  sub_21FF51C7C(v8 - 144, 2, v8 - 160);
  v5(v7, v2);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t, uint64_t))v5)(v3, v2);
}

uint64_t sub_21FF8FE0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t *)(v6 + *(int *)(v2 + 60));
  if (v7[1])
  {
    v8 = *v7;
  }
  else
  {
    (*(void (**)(char *))(v3 + 16))(v5);
    v8 = sub_21FF5BD44((uint64_t)v5, 0, 0, v1);
  }
  swift_bridgeObjectRetain();
  return v8;
}

BOOL sub_21FF8FED8(double a1, double a2, double a3, double a4, double a5, double a6)
{
  _BOOL4 v6;

  v6 = a1 == a4;
  if (a2 != a5)
    v6 = 0;
  return a3 == a6 && v6;
}

uint64_t sub_21FF8FEF4()
{
  sub_21FFC5D14();
  sub_21FFC5D14();
  return sub_21FFC5D14();
}

uint64_t sub_21FF8FF50()
{
  sub_21FFC5CF0();
  sub_21FF8FEF4();
  return sub_21FFC5D20();
}

BOOL sub_21FF8FFDC(double *a1, double *a2)
{
  return sub_21FF8FED8(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_21FF8FFFC()
{
  return sub_21FF8FF50();
}

uint64_t sub_21FF90014()
{
  return sub_21FF8FEF4();
}

uint64_t sub_21FF9002C()
{
  sub_21FFC5CF0();
  sub_21FF8FEF4();
  return sub_21FFC5D20();
}

uint64_t sub_21FF9007C()
{
  return sub_21FF364A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FF8E118);
}

uint64_t sub_21FF90088()
{
  return sub_21FF364A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FF8F0D4);
}

uint64_t sub_21FF90094(uint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    a2(255);
    OUTLINED_FUNCTION_89();
  }
  return result;
}

uint64_t sub_21FF900CC()
{
  return sub_21FF364A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FF8F3EC);
}

uint64_t sub_21FF900D8()
{
  return sub_21FF364A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FF8FB5C);
}

uint64_t sub_21FF900E4(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_89();
  }
  return result;
}

void _s9VItemCellV9ConstantsVMa()
{
  JUMPOUT(0x2207DB418);
}

void sub_21FF90128(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a1;
  v5 = a1[2];
  _s11ArtworkViewVMa(255, *a1, v5, a4);
  OUTLINED_FUNCTION_20_4();
  _s9CellTitleVMa(255, v4, v5, v6);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E2A0);
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_16_9();
  OUTLINED_FUNCTION_20_4();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_49();
}

void sub_21FF901DC()
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
  uint64_t v11;

  sub_21FFC4D54();
  v0 = OUTLINED_FUNCTION_8_0();
  _s15AlbumDetailViewVMa(v0, v1, v2, v3);
  v4 = OUTLINED_FUNCTION_8_0();
  _s16ArtistDetailViewVMa(v4, v5, v6, v7);
  sub_21FFC44CC();
  v8 = OUTLINED_FUNCTION_8_0();
  _s18PlaylistDetailViewVMa(v8, v9, v10, v11);
  sub_21FFC44CC();
  sub_21FFC44CC();
  OUTLINED_FUNCTION_49();
}

void sub_21FF90260()
{
  OUTLINED_FUNCTION_75();
}

void sub_21FF90270()
{
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF90280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  *(_QWORD *)(v24 - 80) = v21;
  *(_QWORD *)(v24 - 72) = a1;
  v25 = MEMORY[0x24BDEF3E0];
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEF3E0], v22, v24 - 80);
  a19 = MEMORY[0x2207DB4B4](&unk_21FFC69D0, v20);
  a20 = MEMORY[0x24BDF5138];
  MEMORY[0x2207DB4B4](v25, v23, &a19);
  OUTLINED_FUNCTION_20();
}

void sub_21FF902DC()
{
  sub_21FFC4130();
  OUTLINED_FUNCTION_6_5();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E548);
  OUTLINED_FUNCTION_104();
  sub_21FFC419C();
  sub_21FFC41D8();
  OUTLINED_FUNCTION_49();
}

void sub_21FF90344()
{
  OUTLINED_FUNCTION_75();
}

void sub_21FF90364()
{
  uint64_t *v0;

  sub_21FF900E4(&qword_25558E550, v0);
  OUTLINED_FUNCTION_20();
}

void sub_21FF90390()
{
  void (*v0)(uint64_t);

  sub_21FF90094(&qword_25558E098, v0);
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_21FF903D0()
{
  void (*v0)(uint64_t);

  sub_21FFC44D8();
  v0 = (void (*)(uint64_t))MEMORY[0x24BDEF428];
  OUTLINED_FUNCTION_58_0();
  sub_21FF90094(&qword_25558E558, v0);
  return OUTLINED_FUNCTION_58_0();
}

void sub_21FF9044C()
{
  JUMPOUT(0x2207DB4B4);
}

void OUTLINED_FUNCTION_0_21(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return sub_21FFC419C();
}

uint64_t OUTLINED_FUNCTION_13_9()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_16_9()
{
  return sub_21FFC4C58();
}

uint64_t OUTLINED_FUNCTION_20_4()
{
  return sub_21FFC419C();
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return sub_21FFC419C();
}

uint64_t sub_21FF904BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;

  v9 = sub_21FFC3974();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*v4 & 0x8000000000000000) != 0)
  {
    v19 = a1;
    MEMORY[0x24BDAC7A8](v11);
    v16 = OUTLINED_FUNCTION_1_21((uint64_t)v18);
    sub_21FFC38E4();
    MEMORY[0x2207DB4B4](MEMORY[0x24BEE12C8], v16);
    v17 = sub_21FFC5840();
    sub_21FF90EF4(v17);
    sub_21FFC3938();
    return sub_21FFC3944();
  }
  else
  {
    v18[1] = a2;
    v19 = a1;
    MEMORY[0x24BDAC7A8](v11);
    v14 = OUTLINED_FUNCTION_1_21((uint64_t)v18);
    sub_21FFC54BC();
    MEMORY[0x2207DB4B4](MEMORY[0x24BEE12C8], v14);
    v19 = sub_21FFC5840();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255590E40);
    sub_21FF9106C();
    sub_21FFC3950();
    if ((a3 & 1) == 0)
      sub_21FFC3944();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a4, v13, v9);
  }
}

uint64_t static MusicPicker.Reason.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v6;

  v2 = *a1;
  v3 = *a2;
  if ((*a1 & 0x8000000000000000) == 0)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      OUTLINED_FUNCTION_2_12();
      sub_21FF568A4(v3);
      sub_21FF568A4(v2);
      v4 = sub_21FFC3A88();
      OUTLINED_FUNCTION_0_22();
      return v4 & 1;
    }
    swift_retain();
    goto LABEL_7;
  }
  if ((v3 & 0x8000000000000000) == 0)
  {
LABEL_7:
    sub_21FF568A4(v3);
    OUTLINED_FUNCTION_0_22();
    v6 = 0;
    return v6 & 1;
  }
  OUTLINED_FUNCTION_0_22();
  v6 = ((v2 & 1) == 0) ^ v3;
  return v6 & 1;
}

BOOL static MusicPicker.Reason.PlaybackSessionAttributes.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t MusicPicker.Reason.hash(into:)()
{
  _QWORD *v0;

  if ((*v0 & 0x8000000000000000) != 0)
  {
    sub_21FFC5CFC();
    return sub_21FFC5D08();
  }
  else
  {
    sub_21FFC5CFC();
    OUTLINED_FUNCTION_2_12();
    sub_21FF50440(&qword_255590E28, (uint64_t (*)(uint64_t))MEMORY[0x24BE69C00], MEMORY[0x24BE69C10]);
    return sub_21FFC5720();
  }
}

void MusicPicker.Reason.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_7_9();
  sub_21FFC5CFC();
  if (v1 < 0)
  {
    sub_21FFC5D08();
  }
  else
  {
    OUTLINED_FUNCTION_2_12();
    sub_21FF50440(&qword_255590E28, (uint64_t (*)(uint64_t))MEMORY[0x24BE69C00], MEMORY[0x24BE69C10]);
    sub_21FFC5720();
  }
  sub_21FFC5D20();
  OUTLINED_FUNCTION_1_18();
}

uint64_t sub_21FF90888()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_21FFC5CF0();
  sub_21FFC5CFC();
  if (v1 < 0)
  {
    sub_21FFC5D08();
  }
  else
  {
    sub_21FFC3AC4();
    sub_21FF50440(&qword_255590E28, (uint64_t (*)(uint64_t))MEMORY[0x24BE69C00], MEMORY[0x24BE69C10]);
    sub_21FFC5720();
  }
  return sub_21FFC5D20();
}

uint64_t MusicPicker.Reason.PlaybackSessionAttributes.init(isCollaborative:)@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t MusicPicker.Reason.PlaybackSessionAttributes.isCollaborative.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t MusicPicker.Reason.PlaybackSessionAttributes.hash(into:)()
{
  return sub_21FFC5D08();
}

void MusicPicker.Reason.PlaybackSessionAttributes.hashValue.getter()
{
  OUTLINED_FUNCTION_7_9();
  sub_21FFC5D08();
  sub_21FFC5D20();
  OUTLINED_FUNCTION_1_18();
}

uint64_t sub_21FF9099C()
{
  sub_21FFC5CF0();
  sub_21FFC5D08();
  return sub_21FFC5D20();
}

unint64_t sub_21FF909E0()
{
  unint64_t result;

  result = qword_255590E30;
  if (!qword_255590E30)
  {
    atomic_store(result, (unint64_t *)&qword_255590E30);
  }
  return result;
}

unint64_t sub_21FF90A20()
{
  unint64_t result;

  result = qword_255590E38;
  if (!qword_255590E38)
  {
    result = MEMORY[0x2207DB4B4](&protocol conformance descriptor for MusicPicker.Reason.PlaybackSessionAttributes, &type metadata for MusicPicker.Reason.PlaybackSessionAttributes);
    atomic_store(result, (unint64_t *)&qword_255590E38);
  }
  return result;
}

uint64_t *_s6ReasonOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  sub_21FF568A4(*a2);
  *a1 = v3;
  return a1;
}

uint64_t _s6ReasonOwxx(uint64_t *a1)
{
  return sub_21FF567D8(*a1);
}

uint64_t *_s6ReasonOwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  sub_21FF568A4(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_21FF567D8(v4);
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t *_s6ReasonOwta(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_21FF567D8(v3);
  return a1;
}

uint64_t _s6ReasonOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x3F && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 62;
    }
    else
    {
      v2 = (*(_QWORD *)a1 & 6 | ((*(_QWORD *)a1 >> 58) >> 5) & 0xFFFFFFC7 | (8
                                                                                         * (((*(_QWORD *)a1 >> 58) >> 2) & 7))) ^ 0x3F;
      if (v2 >= 0x3E)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t _s6ReasonOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x3E)
  {
    *(_QWORD *)result = a2 - 63;
    if (a3 >= 0x3F)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x3F)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 1) & 0x1F | (32 * (-a2 & 0x3F));
      *(_QWORD *)result = ((v3 << 58) | (2 * v3)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_21FF90BB0(_QWORD *a1)
{
  return *a1 >> 63;
}

_QWORD *sub_21FF90BBC(_QWORD *result)
{
  *result &= ~0x8000000000000000;
  return result;
}

uint64_t *sub_21FF90BCC(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF9 | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for MusicPicker.Reason()
{
  return &type metadata for MusicPicker.Reason;
}

uint64_t _s6ReasonO25PlaybackSessionAttributesVwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s6ReasonO25PlaybackSessionAttributesVwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21FF90CD8 + 4 * byte_21FFCA355[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21FF90D0C + 4 * byte_21FFCA350[v4]))();
}

uint64_t sub_21FF90D0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FF90D14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FF90D1CLL);
  return result;
}

uint64_t sub_21FF90D28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FF90D30);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21FF90D34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FF90D3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MusicPicker.Reason.PlaybackSessionAttributes()
{
  return &type metadata for MusicPicker.Reason.PlaybackSessionAttributes;
}

uint64_t sub_21FF90D58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[32];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255590228);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_21FFC5444();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v11 = &v15[-v10];
  sub_21FFC3818();
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    sub_21FF910C8((uint64_t)v4);
    v12 = 1;
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16))(v9, v11, v5);
    v15[31] = 4;
    sub_21FF759F0();
    sub_21FFC38D8();
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v5);
    v12 = 0;
  }
  v13 = sub_21FFC38E4();
  return __swift_storeEnumTagSinglePayload(a1, v12, 1, v13);
}

uint64_t sub_21FF90EF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v2 = sub_21FFC38E4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - v7;
  sub_21FF50440(&qword_255590240, v9, MEMORY[0x24BE69930]);
  v10 = sub_21FFC599C();
  v18 = v10;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v13 = *(_QWORD *)(v3 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v14(v6, v12, v2);
      sub_21FF7730C();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v12 += v13;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    return v18;
  }
  else
  {
    v15 = v10;
    swift_bridgeObjectRelease();
  }
  return v15;
}

uint64_t sub_21FF9103C()
{
  return sub_21FFC3824();
}

unint64_t sub_21FF9106C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255590E48[0];
  if (!qword_255590E48[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255590E40);
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, qword_255590E48);
  }
  return result;
}

uint64_t sub_21FF910B0@<X0>(uint64_t a1@<X8>)
{
  return sub_21FF90D58(a1);
}

uint64_t sub_21FF910C8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255590228);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_22()
{
  uint64_t v0;
  uint64_t v1;

  sub_21FF567D8(v1);
  return sub_21FF567D8(v0);
}

uint64_t OUTLINED_FUNCTION_1_21@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(a1 - 16) = v2;
  *(_QWORD *)(a1 - 8) = v1;
  return sub_21FFC5918();
}

uint64_t OUTLINED_FUNCTION_2_12()
{
  return sub_21FFC3AC4();
}

void sub_21FF91140()
{
  _s13ItemShelfCellVMa();
}

void sub_21FF911BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  _s9ViewModelCMa(0, v5, v4, a4);
  OUTLINED_FUNCTION_20();
}

__n128 sub_21FF911E8()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  _OWORD *v10;
  uint64_t v11;
  __n128 result;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  __n128 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  *v3 = sub_21FFC4268();
  v3[1] = v8;
  v9 = (uint64_t *)(v1 + v6[19]);
  *v9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(qword_255590610);
  swift_storeEnumTagMultiPayload();
  v10 = (_OWORD *)(v1 + v6[20]);
  *v10 = xmmword_21FFC6C50;
  v10[1] = xmmword_21FFCA470;
  v10[2] = xmmword_21FFC9630;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v1, v5, v7);
  v11 = v1 + v6[13];
  *(_BYTE *)v11 = v0;
  result = v16;
  *(__n128 *)(v11 + 8) = v16;
  *(_QWORD *)(v11 + 24) = v2;
  v13 = (_QWORD *)(v1 + v6[14]);
  *v13 = v4;
  v13[1] = v17;
  *(_BYTE *)(v1 + v6[15]) = v18;
  v14 = v1 + v6[16];
  *(_QWORD *)v14 = v21;
  *(_BYTE *)(v14 + 8) = v22 & 1;
  v15 = (_QWORD *)(v1 + v6[17]);
  *v15 = v23;
  v15[1] = v19;
  v15[2] = v20;
  return result;
}

void _s13ItemShelfCellVMa()
{
  JUMPOUT(0x2207DB418);
}

uint64_t sub_21FF91304()
{
  return sub_21FF9F1DC();
}

uint64_t sub_21FF91324()
{
  return sub_21FF9F1DC();
}

uint64_t sub_21FF91344(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_21FFC4190();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return sub_21FF9F210((uint64_t)v4);
}

double sub_21FF913C4()
{
  return 1.0;
}

uint64_t sub_21FF913D0()
{
  uint64_t v0;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(qword_255590ED0);
  MEMORY[0x2207DA050](&v2, v0);
  return v2;
}

void sub_21FF91424()
{
  unint64_t v0;
  unint64_t v1;

  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_21FF7C288();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_21FF914E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  unsigned int v30;
  uint64_t v31;
  char v32;
  _OWORD *v33;
  __int128 *v34;
  __int128 v35;
  __int128 v36;
  uint64_t v38;
  uint64_t v39;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_21FFC4190();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v10 & 0xF8 | 7;
  if (*(_QWORD *)(v9 + 64) <= 8uLL)
    v12 = 8;
  else
    v12 = *(_QWORD *)(v9 + 64);
  v13 = v10 | *(_DWORD *)(v6 + 80);
  if ((v13 & 0x1000F8) != 0
    || ((v12
       + 8
       + ((v11 + ((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v11)) & 0xFFFFFFFFFFFFFFF8)
     + 48 > 0x18)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + (((v13 & 0xF8 | 7u) + 16) & ~(unint64_t)(v13 & 0xF8 | 7u)));
    swift_retain();
  }
  else
  {
    v38 = v8;
    v39 = v12 + 8;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    v16 = ((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    v17 = ((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v16 = *(_BYTE *)v17;
    *(_QWORD *)(v16 + 8) = *(_QWORD *)(v17 + 8);
    *(_QWORD *)(v16 + 16) = *(_QWORD *)(v17 + 16);
    v18 = *(_QWORD *)(v17 + 24);
    swift_bridgeObjectRetain();
    sub_21FF0E594(v18);
    *(_QWORD *)(v16 + 24) = v18;
    v19 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
    v20 = (v17 + 39) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)v19 = *(_QWORD *)v20;
    *(_QWORD *)(v19 + 8) = *(_QWORD *)(v20 + 8);
    *(_BYTE *)(v19 + 16) = *(_BYTE *)(v20 + 16);
    v21 = (v16 + 63) & 0xFFFFFFFFFFFFFFF8;
    v22 = (v17 + 63) & 0xFFFFFFFFFFFFFFF8;
    v23 = *(_QWORD *)v22;
    *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
    *(_QWORD *)v21 = v23;
    v24 = (_QWORD *)((v16 + 79) & 0xFFFFFFFFFFFFFFF8);
    v25 = (_QWORD *)((v17 + 79) & 0xFFFFFFFFFFFFFFF8);
    *v24 = *v25;
    v24[1] = v25[1];
    v24[2] = v25[2];
    v26 = (_QWORD *)(((unint64_t)v24 + 31) & 0xFFFFFFFFFFFFFFF8);
    v27 = (_QWORD *)(((unint64_t)v25 + 31) & 0xFFFFFFFFFFFFFFF8);
    *v26 = *v27;
    v26[1] = v27[1];
    v28 = (_QWORD *)(((unint64_t)v26 + v11 + 16) & ~v11);
    v29 = (_QWORD *)(((unint64_t)v27 + v11 + 16) & ~v11);
    v30 = *((unsigned __int8 *)v29 + v12);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (v30 >= 2)
    {
      if (v12 <= 3)
        v31 = v12;
      else
        v31 = 4;
      __asm { BR              X11 }
    }
    if (v30 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v9 + 16))(v28, v29, v38);
      v32 = 1;
    }
    else
    {
      *v28 = *v29;
      swift_retain();
      v32 = 0;
    }
    *((_BYTE *)v28 + v12) = v32;
    v33 = (_OWORD *)(((unint64_t)v28 + v39) & 0xFFFFFFFFFFFFFFF8);
    v34 = (__int128 *)(((unint64_t)v29 + v39) & 0xFFFFFFFFFFFFFFF8);
    v35 = *v34;
    v36 = v34[2];
    v33[1] = v34[1];
    v33[2] = v36;
    *v33 = v35;
  }
  return a1;
}

uint64_t sub_21FF917CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = (a1 + *(_QWORD *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v4 + 24));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v5 = *(_QWORD *)(sub_21FFC4190() - 8);
  v6 = *(_DWORD *)(v5 + 80) & 0xF8 | 7;
  v7 = (((((v4 + 79) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + v6 + 16) & ~v6;
  v8 = *(_QWORD *)(v5 + 64);
  if (v8 <= 8)
    v8 = 8;
  v9 = *(unsigned __int8 *)(v7 + v8);
  if (v9 >= 2)
  {
    if (v8 <= 3)
      v10 = v8;
    else
      v10 = 4;
    __asm { BR              X14 }
  }
  if (v9 == 1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  else
    return swift_release();
}

uint64_t sub_21FF91914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  char v30;
  _OWORD *v31;
  __int128 *v32;
  __int128 v33;
  __int128 v34;
  uint64_t v36;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v36 = a1;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v7 = *(_BYTE *)v8;
  *(_QWORD *)(v7 + 8) = *(_QWORD *)(v8 + 8);
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v8 + 16);
  v9 = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRetain();
  sub_21FF0E594(v9);
  *(_QWORD *)(v7 + 24) = v9;
  v10 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v11 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_QWORD *)(v10 + 8) = *(_QWORD *)(v11 + 8);
  *(_BYTE *)(v10 + 16) = *(_BYTE *)(v11 + 16);
  v12 = (v7 + 63) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v8 + 63) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v12 = v14;
  v15 = (_QWORD *)((v7 + 79) & 0xFFFFFFFFFFFFFFF8);
  v16 = (_QWORD *)((v8 + 79) & 0xFFFFFFFFFFFFFFF8);
  *v15 = *v16;
  v15[1] = v16[1];
  v15[2] = v16[2];
  v17 = (_QWORD *)(((unint64_t)v15 + 31) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_QWORD *)(((unint64_t)v16 + 31) & 0xFFFFFFFFFFFFFFF8);
  *v17 = *v18;
  v17[1] = v18[1];
  v19 = sub_21FFC4190();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_DWORD *)(v20 + 80) & 0xF8;
  v22 = v21 + 23;
  v23 = (unint64_t)v17 + v21 + 23;
  v24 = ~v21 & 0xFFFFFFFFFFFFFFF8;
  v25 = (_QWORD *)(v23 & v24);
  v26 = (_QWORD *)(((unint64_t)v18 + v22) & v24);
  if (*(_QWORD *)(v20 + 64) <= 8uLL)
    v27 = 8;
  else
    v27 = *(_QWORD *)(v20 + 64);
  v28 = *((unsigned __int8 *)v26 + v27);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v28 >= 2)
  {
    if (v27 <= 3)
      v29 = v27;
    else
      v29 = 4;
    __asm { BR              X11 }
  }
  if (v28 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v20 + 16))(v25, v26, v19);
    v30 = 1;
  }
  else
  {
    *v25 = *v26;
    swift_retain();
    v30 = 0;
  }
  *((_BYTE *)v25 + v27) = v30;
  v31 = (_OWORD *)(((unint64_t)v25 + v27 + 8) & 0xFFFFFFFFFFFFFFF8);
  v32 = (__int128 *)(((unint64_t)v26 + v27 + 8) & 0xFFFFFFFFFFFFFFF8);
  v33 = *v32;
  v34 = v32[2];
  v31[1] = v32[1];
  v31[2] = v34;
  *v31 = v33;
  return v36;
}

uint64_t sub_21FF91B78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v7 = *(_BYTE *)v8;
  *(_QWORD *)(v7 + 8) = *(_QWORD *)(v8 + 8);
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v8 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v8 + 24);
  sub_21FF0E594(v9);
  v10 = *(_QWORD *)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v9;
  sub_21FF0EAB8(v10);
  v11 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v12 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *(_QWORD *)(v11 + 8) = *(_QWORD *)(v12 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v11 + 16) = *(_BYTE *)(v12 + 16);
  v13 = (v7 + 63) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v8 + 63) & 0xFFFFFFFFFFFFFFF8;
  v15 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  *(_QWORD *)v13 = v15;
  v16 = (_QWORD *)((v7 + 79) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)((v8 + 79) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  swift_retain();
  swift_release();
  v16[1] = v17[1];
  swift_retain();
  swift_release();
  v16[2] = v17[2];
  v18 = (_QWORD *)(((unint64_t)v16 + 31) & 0xFFFFFFFFFFFFFFF8);
  v19 = (_QWORD *)(((unint64_t)v17 + 31) & 0xFFFFFFFFFFFFFFF8);
  *v18 = *v19;
  swift_retain();
  swift_release();
  v18[1] = v19[1];
  v20 = sub_21FFC4190();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(_DWORD *)(v21 + 80) & 0xF8;
  v23 = v22 + 23;
  v24 = (unint64_t)v18 + v22 + 23;
  v25 = ~v22 & 0xFFFFFFFFFFFFFFF8;
  v26 = v24 & v25;
  v27 = ((unint64_t)v19 + v23) & v25;
  if (*(_QWORD *)(v21 + 64) <= 8uLL)
    v28 = 8;
  else
    v28 = *(_QWORD *)(v21 + 64);
  if (v26 != v27)
  {
    v29 = v20;
    v30 = *(unsigned __int8 *)(v26 + v28);
    if (v30 >= 2)
    {
      if (v28 <= 3)
        v31 = v28;
      else
        v31 = 4;
      __asm { BR              X12 }
    }
    if (v30 == 1)
      (*(void (**)(unint64_t, uint64_t))(v21 + 8))(v26, v20);
    else
      swift_release();
    v32 = *(unsigned __int8 *)(v27 + v28);
    if (v32 >= 2)
    {
      if (v28 <= 3)
        v33 = v28;
      else
        v33 = 4;
      __asm { BR              X12 }
    }
    if (v32 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v21 + 16))(v26, v27, v29);
      *(_BYTE *)(v26 + v28) = 1;
    }
    else
    {
      *(_QWORD *)v26 = *(_QWORD *)v27;
      *(_BYTE *)(v26 + v28) = 0;
      swift_retain();
    }
  }
  v34 = (_QWORD *)(((v26 | 7) + v28 + 1) & 0xFFFFFFFFFFFFFFF8);
  v35 = (_QWORD *)(((v27 | 7) + v28 + 1) & 0xFFFFFFFFFFFFFFF8);
  *v34 = *v35;
  v34[1] = v35[1];
  v34[2] = v35[2];
  v34[3] = v35[3];
  v34[4] = v35[4];
  v34[5] = v35[5];
  return a1;
}

uint64_t sub_21FF91EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  char v31;
  _OWORD *v32;
  __int128 *v33;
  __int128 v34;
  __int128 v35;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = ((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v11 = ((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(_OWORD *)v10 = *(_OWORD *)v11;
  *(_BYTE *)(v10 + 16) = *(_BYTE *)(v11 + 16);
  v12 = ((unint64_t)v7 + 63) & 0xFFFFFFFFFFFFFFF8;
  v13 = ((unint64_t)v8 + 63) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = v14;
  v15 = ((unint64_t)v7 + 79) & 0xFFFFFFFFFFFFFFF8;
  v16 = ((unint64_t)v8 + 79) & 0xFFFFFFFFFFFFFFF8;
  v17 = *(_QWORD *)(v16 + 16);
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *(_QWORD *)(v15 + 16) = v17;
  v18 = (_OWORD *)((v15 + 31) & 0xFFFFFFFFFFFFFFF8);
  v19 = (_OWORD *)((v16 + 31) & 0xFFFFFFFFFFFFFFF8);
  *v18 = *v19;
  v20 = sub_21FFC4190();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(_DWORD *)(v21 + 80) & 0xF8;
  v23 = v22 + 23;
  v24 = (unint64_t)v18 + v22 + 23;
  v25 = ~v22 & 0xFFFFFFFFFFFFFFF8;
  v26 = (_QWORD *)(v24 & v25);
  v27 = (_QWORD *)(((unint64_t)v19 + v23) & v25);
  if (*(_QWORD *)(v21 + 64) <= 8uLL)
    v28 = 8;
  else
    v28 = *(_QWORD *)(v21 + 64);
  v29 = *((unsigned __int8 *)v27 + v28);
  if (v29 >= 2)
  {
    if (v28 <= 3)
      v30 = v28;
    else
      v30 = 4;
    __asm { BR              X13 }
  }
  if (v29 == 1)
  {
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v21 + 32))(v26, v27, v20);
    v31 = 1;
  }
  else
  {
    v31 = 0;
    *v26 = *v27;
  }
  *((_BYTE *)v26 + v28) = v31;
  v32 = (_OWORD *)(((unint64_t)v26 + v28 + 8) & 0xFFFFFFFFFFFFFFF8);
  v33 = (__int128 *)(((unint64_t)v27 + v28 + 8) & 0xFFFFFFFFFFFFFFF8);
  v34 = *v33;
  v35 = v33[2];
  v32[1] = v33[1];
  v32[2] = v35;
  *v32 = v34;
  return a1;
}

uint64_t sub_21FF92090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  char v33;
  _QWORD *v34;
  _QWORD *v35;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v7 = *(_BYTE *)v8;
  *(_QWORD *)(v7 + 8) = *(_QWORD *)(v8 + 8);
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v8 + 16);
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v7 + 24);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  sub_21FF0EAB8(v9);
  v10 = (v7 + 39) & 0xFFFFFFFFFFFFFFF8;
  v11 = (v8 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_QWORD *)(v10 + 8) = *(_QWORD *)(v11 + 8);
  swift_bridgeObjectRelease();
  *(_BYTE *)(v10 + 16) = *(_BYTE *)(v11 + 16);
  v12 = (v7 + 63) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v8 + 63) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_QWORD *)v12 = v14;
  v15 = (_QWORD *)((v7 + 79) & 0xFFFFFFFFFFFFFFF8);
  v16 = (_QWORD *)((v8 + 79) & 0xFFFFFFFFFFFFFFF8);
  *v15 = *v16;
  swift_release();
  v15[1] = v16[1];
  swift_release();
  v15[2] = v16[2];
  v17 = (_QWORD *)(((unint64_t)v15 + 31) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_QWORD *)(((unint64_t)v16 + 31) & 0xFFFFFFFFFFFFFFF8);
  *v17 = *v18;
  swift_release();
  v17[1] = v18[1];
  v19 = sub_21FFC4190();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_DWORD *)(v20 + 80) & 0xF8;
  v22 = v21 + 23;
  v23 = (unint64_t)v17 + v21 + 23;
  v24 = ~v21 & 0xFFFFFFFFFFFFFFF8;
  v25 = v23 & v24;
  v26 = ((unint64_t)v18 + v22) & v24;
  if (*(_QWORD *)(v20 + 64) <= 8uLL)
    v27 = 8;
  else
    v27 = *(_QWORD *)(v20 + 64);
  if (v25 != v26)
  {
    v28 = v19;
    v29 = *(unsigned __int8 *)(v25 + v27);
    if (v29 >= 2)
    {
      if (v27 <= 3)
        v30 = v27;
      else
        v30 = 4;
      __asm { BR              X12 }
    }
    if (v29 == 1)
      (*(void (**)(unint64_t, uint64_t))(v20 + 8))(v25, v19);
    else
      swift_release();
    v31 = *(unsigned __int8 *)(v26 + v27);
    if (v31 >= 2)
    {
      if (v27 <= 3)
        v32 = v27;
      else
        v32 = 4;
      __asm { BR              X12 }
    }
    if (v31 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v20 + 32))(v25, v26, v28);
      v33 = 1;
    }
    else
    {
      v33 = 0;
      *(_QWORD *)v25 = *(_QWORD *)v26;
    }
    *(_BYTE *)(v25 + v27) = v33;
  }
  v34 = (_QWORD *)(((v25 | 7) + v27 + 1) & 0xFFFFFFFFFFFFFFF8);
  v35 = (_QWORD *)(((v26 | 7) + v27 + 1) & 0xFFFFFFFFFFFFFFF8);
  *v34 = *v35;
  v34[1] = v35[1];
  v34[2] = v35[2];
  v34[3] = v35[3];
  v34[4] = v35[4];
  v34[5] = v35[5];
  return a1;
}

uint64_t sub_21FF9239C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v17;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF)
    v8 = 0x7FFFFFFF;
  else
    v8 = *(_DWORD *)(v6 + 84);
  v9 = *(_QWORD *)(sub_21FFC4190() - 8);
  v10 = 8;
  if (*(_QWORD *)(v9 + 64) > 8uLL)
    v10 = *(_QWORD *)(v9 + 64);
  if (!a2)
    return 0;
  v11 = *(_QWORD *)(v6 + 64);
  if (v8 < a2)
  {
    v12 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
    if (((((v10
           + ((v12
             + ((((((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8)
             + 16) & ~v12)
           + 8) & 0xFFFFFFFFFFFFFFF8)
         + 48) & 0xFFFFFFF8) != 0)
      v13 = 2;
    else
      v13 = a2 - v8 + 1;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v15 = v14;
    else
      v15 = 0;
    __asm { BR              X13 }
  }
  if (v7 >= 0x7FFFFFFF)
    return __swift_getEnumTagSinglePayload(a1, v7, v5);
  v17 = *(_QWORD *)(((((a1 + v11 + 7) & 0xFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFF8) + 8);
  if (v17 >= 0xFFFFFFFF)
    LODWORD(v17) = -1;
  return (v17 + 1);
}

void sub_21FF92534(_DWORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  unsigned int v13;
  int v14;
  int v15;

  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v7 + 84) <= 0x7FFFFFFFu)
    v8 = 0x7FFFFFFF;
  else
    v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(sub_21FFC4190() - 8);
  v10 = 8;
  if (*(_QWORD *)(v9 + 64) > 8uLL)
    v10 = *(_QWORD *)(v9 + 64);
  v11 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  v12 = ((v10
        + ((v11
          + ((((((*(_QWORD *)(v7 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8)
          + 16) & ~v11)
        + 8) & 0xFFFFFFFFFFFFFFF8)
      + 48;
  if (v8 >= a3)
  {
    v15 = 0;
  }
  else
  {
    if ((_DWORD)v12)
      v13 = 2;
    else
      v13 = a3 - v8 + 1;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v15 = v14;
    else
      v15 = 0;
  }
  if (a2 > v8)
  {
    if ((_DWORD)v12)
    {
      bzero(a1, v12);
      *a1 = ~v8 + a2;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_21FF92678@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _QWORD *v7;

  *(_BYTE *)(v1 + v5) = 0;
  if ((_DWORD)v2)
  {
    if (v4 < 0x7FFFFFFF)
    {
      v7 = (_QWORD *)((((v1 + a1 + 7) & 0xFFFFFFFFFFFFFFF8) + 79) & 0xFFFFFFFFFFFFFFF8);
      if ((v2 & 0x80000000) != 0)
      {
        v7[1] = 0;
        v7[2] = 0;
        *v7 = v2 ^ 0x80000000;
      }
      else
      {
        v7[1] = (v2 - 1);
      }
    }
    else
    {
      return __swift_storeEnumTagSinglePayload(v1, v2, v4, v3);
    }
  }
  return result;
}

uint64_t sub_21FF92728()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FF9275C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v4;
  char v5;

  v2 = *(unsigned __int8 *)(v1 + *(int *)(a1 + 60));
  if (v2 == 5)
    return 0;
  if (sub_21FFA7960(v2) == 0xD000000000000012 && v4 == 0x800000021FFCCD70)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_21FFC5C90();
    swift_bridgeObjectRelease();
    return v5 & 1;
  }
}

void sub_21FF927F8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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

  v18 = a2;
  v17 = sub_21FFC43DC();
  OUTLINED_FUNCTION_10_5(*(_QWORD *)(v17 - 8));
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_95(v4);
  v22 = sub_21FFC44D8();
  OUTLINED_FUNCTION_10_5(*(_QWORD *)(v22 - 8));
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_95(v6);
  v15 = *(a1 - 1);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_95((uint64_t)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = a1[2];
  v19 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0_7();
  v23 = v11;
  v12 = a1[4];
  v21 = a1[3];
  v20 = v12;
  _s11ArtworkViewVMa(255, v9, v12, v13);
  OUTLINED_FUNCTION_97();
  sub_21FFC419C();
  OUTLINED_FUNCTION_5_8();
  v24 = a1[5];
  OUTLINED_FUNCTION_20();
}

void sub_21FF92970(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = MEMORY[0x24BDEBF50];
  *(_QWORD *)(v2 - 120) = a1;
  *(_QWORD *)(v2 - 112) = v3;
  v4 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v1, v2 - 120);
  v5 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v2 - 136) = v4;
  *(_QWORD *)(v2 - 128) = v5;
  OUTLINED_FUNCTION_2_13();
}

void sub_21FF929A8(uint64_t a1)
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

  *(_QWORD *)(v8 - 152) = a1;
  *(_QWORD *)(v8 - 144) = v3;
  *(_QWORD *)(v8 - 552) = v4;
  v9 = MEMORY[0x2207DB4B4](v1, v4, v8 - 152);
  *(_QWORD *)(v8 - 560) = v9;
  *(_QWORD *)(v8 - 200) = v7;
  *(_QWORD *)(v8 - 192) = v2;
  *(_QWORD *)(v8 - 184) = v4;
  *(_QWORD *)(v8 - 176) = v6;
  *(_QWORD *)(v8 - 168) = v5;
  *(_QWORD *)(v8 - 160) = v9;
  _s9HItemCellVMa();
}

void sub_21FF929E4(uint64_t a1)
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

  OUTLINED_FUNCTION_0_21(*(_QWORD *)(a1 - 8));
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v4);
  *(_QWORD *)(v1 - 568) = a1;
  v5 = sub_21FFC419C();
  OUTLINED_FUNCTION_0_21(*(_QWORD *)(v5 - 8));
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v7);
  *(_QWORD *)(v1 - 512) = v5;
  v8 = sub_21FFC419C();
  OUTLINED_FUNCTION_0_21(*(_QWORD *)(v8 - 8));
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v10);
  OUTLINED_FUNCTION_13_1();
}

void sub_21FF92AA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 - 576) = a1;
  v2 = MEMORY[0x24BDEDBB8];
  *(_QWORD *)(v1 - 216) = a1;
  *(_QWORD *)(v1 - 208) = v2;
  OUTLINED_FUNCTION_2_13();
}

void sub_21FF92ABC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 - 520) = a1;
  v2 = MEMORY[0x24BDF0910];
  *(_QWORD *)(v1 - 232) = a1;
  *(_QWORD *)(v1 - 224) = v2;
  OUTLINED_FUNCTION_7_11();
}

void sub_21FF92AD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v2 - 200) = v1;
  *(_QWORD *)(v2 - 192) = v3;
  *(_QWORD *)(v2 - 464) = v1;
  v4 = MEMORY[0x24BEE1788];
  *(_QWORD *)(v2 - 184) = a1;
  *(_QWORD *)(v2 - 176) = v4;
  *(_QWORD *)(v2 - 472) = a1;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF92B28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v5 - 368) = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v7);
  *(_QWORD *)(v5 - 200) = v1;
  *(_QWORD *)(v5 - 192) = v2;
  *(_QWORD *)(v5 - 184) = v4;
  *(_QWORD *)(v5 - 176) = v3;
  v8 = OUTLINED_FUNCTION_58_0();
  v9 = sub_21FF4D384();
  *(_QWORD *)(v5 - 496) = a1;
  v10 = *(_QWORD *)(v5 - 280);
  *(_QWORD *)(v5 - 200) = a1;
  *(_QWORD *)(v5 - 192) = v10;
  *(_QWORD *)(v5 - 184) = v8;
  *(_QWORD *)(v5 - 176) = v9;
  *(_QWORD *)(v5 - 480) = v8;
  *(_QWORD *)(v5 - 488) = v9;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF92BC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v5 - 448) = a1;
  OUTLINED_FUNCTION_0_21(v6);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v9);
  *(_QWORD *)(v5 - 200) = v4;
  *(_QWORD *)(v5 - 192) = v2;
  *(_QWORD *)(v5 - 184) = v1;
  *(_QWORD *)(v5 - 176) = v3;
  v10 = OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v5 - 456) = v10;
  *(_QWORD *)(v5 - 200) = a1;
  *(_QWORD *)(v5 - 192) = v10;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF92C28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, int *);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, int *);

  *(_QWORD *)(v11 - 400) = a1;
  OUTLINED_FUNCTION_10_5(*(_QWORD *)(a1 - 8));
  v13 = MEMORY[0x24BDAC7A8](v12);
  *(_QWORD *)(v11 - 528) = (char *)&a9 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_95((uint64_t)&a9 - v15);
  v16 = *(_QWORD *)(v11 - 240);
  v17 = v10;
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 304) + 16))(*(_QWORD *)(v11 - 256), v16, v10);
  v18 = v16 + v9[13];
  v19 = v16;
  v21 = *(_QWORD *)(v18 + 8);
  v20 = *(_QWORD *)(v18 + 16);
  v22 = *(_QWORD *)(v18 + 24);
  *(_BYTE *)(v11 - 200) = *(_BYTE *)v18;
  *(_QWORD *)(v11 - 192) = v21;
  *(_QWORD *)(v11 - 184) = v20;
  *(_QWORD *)(v11 - 176) = v22;
  swift_bridgeObjectRetain();
  sub_21FF0E594(v22);
  *(_DWORD *)(v11 - 624) = sub_21FF9275C((uint64_t)v9);
  v23 = v9[15];
  *(_QWORD *)(v11 - 616) = *(_QWORD *)(v19 + v9[14]);
  *(_QWORD *)(v11 - 600) = v19 + v9[20];
  v24 = *(_QWORD *)(v11 - 416);
  v25 = *(void (**)(uint64_t, uint64_t, int *))(v24 + 16);
  *(_QWORD *)(v11 - 584) = v25;
  *(_DWORD *)(v11 - 620) = *(unsigned __int8 *)(v19 + v23);
  v26 = *(_QWORD *)(v11 - 264);
  *(_QWORD *)(v11 - 608) = v9;
  v25(v26, v19, v9);
  v27 = *(unsigned __int8 *)(v24 + 80);
  v28 = (v27 + 48) & ~v27;
  *(_QWORD *)(v11 - 408) += v28;
  *(_QWORD *)(v11 - 304) = v28;
  *(_QWORD *)(v11 - 592) = v27 | 7;
  v29 = (char *)swift_allocObject();
  v30 = *(_QWORD *)(v11 - 288);
  *((_QWORD *)v29 + 2) = v17;
  *((_QWORD *)v29 + 3) = v30;
  v31 = *(_QWORD *)(v11 - 248);
  *((_QWORD *)v29 + 4) = *(_QWORD *)(v11 - 296);
  *((_QWORD *)v29 + 5) = v31;
  v32 = *(void (**)(char *, uint64_t, int *))(v24 + 32);
  *(_QWORD *)(v11 - 416) = v32;
  v32(&v29[v28], v26, v9);
  sub_21FF0E148();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v11 - 632) = v17;
  sub_21FF7A384();
}

uint64_t sub_21FF92E8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, _QWORD);
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);

  sub_21FF47EAC();
  v5 = *(_QWORD *)(v4 - 536);
  sub_21FFC4B08();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_247(v2, v6);
  v7 = *(_QWORD *)(v4 - 264);
  v8 = *(_QWORD *)(v4 - 608);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 - 584);
  v9(v7, *(_QWORD *)(v4 - 240), v8);
  v10 = (char *)swift_allocObject();
  *((_QWORD *)v10 + 2) = v0;
  *((_QWORD *)v10 + 3) = v3;
  v11 = *(_QWORD *)(v4 - 248);
  *((_QWORD *)v10 + 4) = v1;
  *((_QWORD *)v10 + 5) = v11;
  v12 = v7;
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v4 - 416);
  v13(&v10[*(_QWORD *)(v4 - 304)], v7, v8);
  sub_21FFC4B80();
  swift_release();
  OUTLINED_FUNCTION_247(v5, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 384) + 8));
  v14 = *(_QWORD *)(v4 - 240);
  *(_QWORD *)(v4 - 200) = sub_21FF913D0();
  v9(v12, v14, v8);
  v15 = (char *)swift_allocObject();
  v16 = *(_QWORD *)(v4 - 288);
  *((_QWORD *)v15 + 2) = *(_QWORD *)(v4 - 632);
  *((_QWORD *)v15 + 3) = v16;
  v17 = *(_QWORD *)(v4 - 248);
  *((_QWORD *)v15 + 4) = *(_QWORD *)(v4 - 296);
  *((_QWORD *)v15 + 5) = v17;
  v13(&v15[*(_QWORD *)(v4 - 304)], v12, v8);
  v18 = *(_QWORD *)(v4 - 464);
  sub_21FF0E140();
  v19 = *(_QWORD *)(v4 - 440);
  v20 = *(_QWORD *)(v4 - 272);
  sub_21FFC4B8C();
  swift_release();
  OUTLINED_FUNCTION_5_7();
  v21(v20, v18);
  v22 = *(_QWORD *)(v4 - 352);
  sub_21FFC4238();
  v23 = *(_QWORD *)(v4 - 504);
  v24 = *(_QWORD *)(v4 - 496);
  sub_21FFC4994();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_247(v22, v25);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 368) + 8))(v19, v24);
  v26 = *(_QWORD *)(v4 - 336);
  v27 = *(_QWORD *)(v4 - 448);
  v28 = *(_QWORD *)(v4 - 456);
  sub_21FF939C0(v26);
  v29 = *(_QWORD *)(v4 - 528);
  sub_21FFC49DC();
  OUTLINED_FUNCTION_5_7();
  v30(v26, *(_QWORD *)(v4 - 320));
  OUTLINED_FUNCTION_5_7();
  v31(v23, v27);
  *(_QWORD *)(v4 - 200) = v27;
  *(_QWORD *)(v4 - 192) = v28;
  OUTLINED_FUNCTION_58_0();
  v32 = *(_QWORD *)(v4 - 432);
  v33 = *(_QWORD *)(v4 - 400);
  sub_21FFB5D18(v29, v33, v32);
  v34 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 392) + 8);
  v34(v29, v33);
  sub_21FFB57EC(v32, v33, *(_QWORD *)(v4 - 312));
  return ((uint64_t (*)(uint64_t, uint64_t))v34)(v32, v33);
}

void sub_21FF93280(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  _QWORD v28[2];
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v29 = a5;
  v43 = a6;
  v35 = sub_21FFC4190();
  v33 = *(_QWORD *)(v35 - 8);
  v10 = MEMORY[0x24BDAC7A8](v35);
  v30 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v13 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _s11ArtworkViewVMa(0, a2, a4, v16);
  v37 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v28[1] = (char *)v28 - v18;
  v19 = sub_21FFC419C();
  v20 = *(_QWORD *)(v19 - 8);
  v34 = v19;
  v40 = v20;
  MEMORY[0x24BDAC7A8](v19);
  v31 = (char *)v28 - v21;
  v22 = sub_21FFC419C();
  v41 = *(_QWORD *)(v22 - 8);
  v38 = v22;
  MEMORY[0x24BDAC7A8](v22);
  v32 = (char *)v28 - v23;
  v24 = sub_21FFC419C();
  v42 = *(_QWORD *)(v24 - 8);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v36 = (char *)v28 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v39 = (char *)v28 - v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, a2);
  v44 = a2;
  v45 = a3;
  v46 = a4;
  v47 = v29;
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FF934D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
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
  void (*v21)(uint64_t, uint64_t);

  v4 = *(_QWORD *)(v3 - 312);
  sub_21FF89BA4();
  sub_21FFB6048(v2);
  v5 = *(_QWORD *)(v3 - 272);
  v6 = *(_QWORD *)(v3 - 296);
  v7 = *(_QWORD *)(v3 - 256);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v6, *MEMORY[0x24BDED118], v7);
  sub_21FFC4184();
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(v6, v7);
  v8(v2, v7);
  v9 = MEMORY[0x2207DB4B4](&unk_21FFCA0A0, v0);
  sub_21FFC4ED4();
  v10 = *(_QWORD *)(v3 - 288);
  sub_21FFC49AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 240) + 8))(v4, v0);
  sub_21FFC4760();
  v11 = MEMORY[0x24BDEBF50];
  *(_QWORD *)(v3 - 152) = v9;
  *(_QWORD *)(v3 - 144) = v11;
  v12 = MEMORY[0x24BDED308];
  v13 = *(_QWORD *)(v3 - 264);
  v14 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v13, v3 - 152);
  v15 = *(_QWORD *)(v3 - 280);
  sub_21FFC4B50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 216) + 8))(v10, v13);
  sub_21FFC476C();
  v16 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v3 - 168) = v14;
  *(_QWORD *)(v3 - 160) = v16;
  v17 = *(_QWORD *)(v3 - 232);
  v18 = MEMORY[0x2207DB4B4](v12, v17, v3 - 168);
  v19 = *(_QWORD *)(v3 - 248);
  sub_21FFC4B50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 208) + 8))(v15, v17);
  *(_QWORD *)(v3 - 184) = v18;
  *(_QWORD *)(v3 - 176) = v16;
  MEMORY[0x2207DB4B4](v12, v1, v3 - 184);
  v20 = *(_QWORD *)(v3 - 224);
  sub_21FFB5D18(v19, v1, v20);
  v21 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 200) + 8);
  v21(v19, v1);
  sub_21FFB57EC(v20, v1, *(_QWORD *)(v3 - 192));
  return ((uint64_t (*)(uint64_t, uint64_t))v21)(v20, v1);
}

void sub_21FF93738()
{
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FF93760(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *(int *)(result + 64);
  if ((*(_BYTE *)(v2 + 8) & 1) == 0 && !*(_QWORD *)v2)
    return sub_21FF9378C(result);
  return result;
}

uint64_t sub_21FF9378C(uint64_t a1)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v20;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255590228);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21FFC5444();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v2, v8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v12);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v7, v12);
    v17 = *(unsigned __int8 *)(v2 + *(int *)(a1 + 60));
    if (v17 != 5)
    {
      v18 = _s9ViewModelCMa(0, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 40), v16);
      sub_21FFC4244();
      sub_21FF74B84((uint64_t)v15, v17);
      swift_release();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v12);
    return sub_21FF910C8((uint64_t)v7);
  }
}

void sub_21FF93964()
{
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FF93990(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = v2 + *(int *)(result + 64);
  if ((*(_BYTE *)(v3 + 8) & 1) == 0 && v1 == *(_QWORD *)v3)
    return sub_21FF9378C(result);
  return result;
}

uint64_t sub_21FF939C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BDEE8B0];
  v3 = sub_21FFC43DC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

BOOL sub_21FF93A04(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[3];
  _OWORD v8[3];

  v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  v3 = *a2;
  v4 = a2[1];
  v7[2] = a1[2];
  v8[0] = v3;
  v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_21FF0E150((double *)v7, (double *)v8);
}

void sub_21FF93A5C()
{
  OUTLINED_FUNCTION_9_9();
}

void sub_21FF93A90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_21FF93280(a1, v2, v3, v4, v5, v1);
}

void sub_21FF93AC0()
{
  OUTLINED_FUNCTION_9_9();
}

void sub_21FF93AF0()
{
  sub_21FF93738();
}

void objectdestroyTm_6()
{
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FF93B50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v4 = v1 + ((v3 + 48) & ~v3);
  (*(void (**)(uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v4);
  v5 = v4 + *(int *)(a1 + 52);
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v5 + 24));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v6 = v4 + *(int *)(a1 + 76);
  __swift_instantiateConcreteTypeFromMangledName(qword_255590610);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_21FFC4190();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

void sub_21FF93C4C()
{
  _s13ItemShelfCellVMa();
}

void sub_21FF93C8C()
{
  sub_21FF93964();
}

void _s13ItemShelfCellV9ConstantsVMa()
{
  JUMPOUT(0x2207DB418);
}

void sub_21FF93CE0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _s11ArtworkViewVMa(255, *a1, a1[2], a4);
  OUTLINED_FUNCTION_97();
  sub_21FFC419C();
  OUTLINED_FUNCTION_5_8();
  OUTLINED_FUNCTION_20();
}

void sub_21FF93D54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = MEMORY[0x24BDEBF50];
  *(_QWORD *)(v1 - 80) = a1;
  *(_QWORD *)(v1 - 72) = v2;
  OUTLINED_FUNCTION_13_1();
}

void sub_21FF93D74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v1 - 96) = a1;
  *(_QWORD *)(v1 - 88) = v2;
  OUTLINED_FUNCTION_2_13();
}

void sub_21FF93D88()
{
  OUTLINED_FUNCTION_7_11();
}

void sub_21FF93D94()
{
  _s9HItemCellVMa();
}

void sub_21FF93DB8()
{
  sub_21FFC419C();
  sub_21FFC419C();
  OUTLINED_FUNCTION_13_1();
}

void sub_21FF93DF8()
{
  OUTLINED_FUNCTION_7_11();
}

void sub_21FF93E0C()
{
  OUTLINED_FUNCTION_2_13();
}

void sub_21FF93E20()
{
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF93E54()
{
  sub_21FFC44D8();
  OUTLINED_FUNCTION_58_0();
  sub_21FF4D384();
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_21FF93EA4()
{
  OUTLINED_FUNCTION_58_0();
  return OUTLINED_FUNCTION_58_0();
}

void sub_21FF93EEC()
{
  JUMPOUT(0x2207DB4B4);
}

void OUTLINED_FUNCTION_2_13()
{
  JUMPOUT(0x2207DB4B4);
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return sub_21FFC419C();
}

void OUTLINED_FUNCTION_7_11()
{
  JUMPOUT(0x2207DB4B4);
}

void OUTLINED_FUNCTION_9_9()
{
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FF93F34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  return v1 + ((v2 + 48) & ~v2);
}

uint64_t _s5AlertVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s5AlertVwcp(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s5AlertVwca(_QWORD *a1, _QWORD *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *_s5AlertVwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5AlertVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s5AlertVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *_s5AlertVMa()
{
  return &_s5AlertVN;
}

unint64_t sub_21FF941A0()
{
  unint64_t result;

  result = qword_255590F58;
  if (!qword_255590F58)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCA6D0, &_s5AlertVN);
    atomic_store(result, (unint64_t *)&qword_255590F58);
  }
  return result;
}

void sub_21FF941DC(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 >= 2)
  {
    if (qword_25558DEF0 == -1)
      goto LABEL_12;
    goto LABEL_15;
  }
  if (a1 == 1 && a2 >= 2)
  {
    if (qword_25558DEF0 == -1)
      goto LABEL_12;
    goto LABEL_15;
  }
  if (qword_25558DEF0 != -1)
LABEL_15:
    swift_once();
LABEL_12:
  OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_4_5();
  sub_21FFC35F0();
  OUTLINED_FUNCTION_10_10();
  if (qword_25558DEF0 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_22();
  v7 = OUTLINED_FUNCTION_2_14();
  v9 = v8;
  OUTLINED_FUNCTION_1_22();
  v10 = OUTLINED_FUNCTION_2_14();
  *a3 = v3;
  a3[1] = v4;
  a3[2] = 0;
  a3[3] = 0;
  a3[4] = v7;
  a3[5] = v9;
  a3[6] = v10;
  a3[7] = v11;
  OUTLINED_FUNCTION_3_9();
}

uint64_t sub_21FF943AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  if (qword_25558DEF0 != -1)
    swift_once();
  sub_21FFC35F0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_1_22();
  result = OUTLINED_FUNCTION_0_23();
  qword_255598220 = v0;
  *(_QWORD *)algn_255598228 = v1;
  qword_255598230 = 0;
  unk_255598238 = 0;
  qword_255598240 = result;
  unk_255598248 = v3;
  qword_255598250 = 0;
  qword_255598258 = 0;
  return result;
}

double sub_21FF94494()
{
  double result;
  _OWORD v1[2];
  __int128 v2;
  __int128 v3;

  sub_21FF941DC(1, 1, v1);
  xmmword_255598260 = v1[0];
  xmmword_255598270 = v1[1];
  result = *(double *)&v2;
  xmmword_255598280 = v2;
  xmmword_255598290 = v3;
  return result;
}

uint64_t sub_21FF944D4(_QWORD *a1, _QWORD *a2)
{
  char v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;

  if (*a1 != *a2 || a1[1] != a2[1])
  {
    v5 = OUTLINED_FUNCTION_5_9();
    result = 0;
    if ((v5 & 1) == 0)
      return result;
  }
  v7 = a1[3];
  v8 = a2[3];
  if (!v7)
  {
    if (v8)
      return 0;
    goto LABEL_15;
  }
  if (!v8)
    return 0;
  v9 = a1[2] == a2[2] && v7 == v8;
  if (v9 || (v10 = OUTLINED_FUNCTION_5_9(), result = 0, (v10 & 1) != 0))
  {
LABEL_15:
    v11 = a1[5];
    v12 = a2[5];
    if (v11)
    {
      if (!v12)
        return 0;
      if (a1[4] != a2[4] || v11 != v12)
      {
        v14 = OUTLINED_FUNCTION_5_9();
        result = 0;
        if ((v14 & 1) == 0)
          return result;
      }
    }
    else if (v12)
    {
      return 0;
    }
    v15 = a1[7];
    v16 = a2[7];
    if (v15)
    {
      if (v16)
      {
        v17 = a1[6] == a2[6] && v15 == v16;
        if (v17 || (OUTLINED_FUNCTION_5_9() & 1) != 0)
          return 1;
      }
    }
    else if (!v16)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_21FF945D0()
{
  _QWORD *v0;

  swift_bridgeObjectRetain();
  sub_21FFC57EC();
  swift_bridgeObjectRelease();
  if (v0[3])
  {
    OUTLINED_FUNCTION_9_10();
    OUTLINED_FUNCTION_246();
    OUTLINED_FUNCTION_6_6();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_8_3();
  }
  if (v0[5])
  {
    OUTLINED_FUNCTION_9_10();
    OUTLINED_FUNCTION_246();
    OUTLINED_FUNCTION_6_6();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_8_3();
  }
  if (!v0[7])
    return OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_9_10();
  OUTLINED_FUNCTION_246();
  sub_21FFC57EC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FF946A8()
{
  sub_21FFC5CF0();
  sub_21FF945D0();
  return sub_21FFC5D20();
}

void sub_21FF946E4()
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

  if (qword_25558DEF0 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_0_23();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_1_22();
  v2 = OUTLINED_FUNCTION_0_23();
  v4 = v3;
  OUTLINED_FUNCTION_1_22();
  v5 = OUTLINED_FUNCTION_0_23();
  v7 = v6;
  OUTLINED_FUNCTION_1_22();
  v8 = OUTLINED_FUNCTION_0_23();
  *(_QWORD *)&xmmword_2555982A0 = v0;
  *((_QWORD *)&xmmword_2555982A0 + 1) = v1;
  *(_QWORD *)&xmmword_2555982B0 = v2;
  *((_QWORD *)&xmmword_2555982B0 + 1) = v4;
  *(_QWORD *)&xmmword_2555982C0 = v5;
  *((_QWORD *)&xmmword_2555982C0 + 1) = v7;
  *(_QWORD *)&xmmword_2555982D0 = v8;
  *((_QWORD *)&xmmword_2555982D0 + 1) = v9;
  OUTLINED_FUNCTION_3_9();
}

uint64_t sub_21FF9480C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  if (qword_25558DEF0 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_0_23();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_1_22();
  v2 = OUTLINED_FUNCTION_0_23();
  v4 = v3;
  OUTLINED_FUNCTION_1_22();
  result = OUTLINED_FUNCTION_0_23();
  *(_QWORD *)&xmmword_2555982E0 = v0;
  *((_QWORD *)&xmmword_2555982E0 + 1) = v1;
  qword_2555982F0 = 0;
  unk_2555982F8 = 0;
  *(_QWORD *)&xmmword_255598300 = v2;
  *((_QWORD *)&xmmword_255598300 + 1) = v4;
  qword_255598310 = result;
  qword_255598318 = v6;
  return result;
}

uint64_t sub_21FF94930()
{
  sub_21FFC5CF0();
  sub_21FF945D0();
  return sub_21FFC5D20();
}

uint64_t OUTLINED_FUNCTION_0_23()
{
  return sub_21FFC35F0();
}

uint64_t OUTLINED_FUNCTION_2_14()
{
  return sub_21FFC35F0();
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return sub_21FFC5C90();
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return sub_21FFC57EC();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return sub_21FFC5D08();
}

uint64_t OUTLINED_FUNCTION_9_10()
{
  return sub_21FFC5D08();
}

void sub_21FF94A04(uint64_t a1)
{
  void (*v1)(void);

  v1 = (void (*)(void))MEMORY[0x24BDAC7A8](a1);
  v1();
  sub_21FFC4124();
  OUTLINED_FUNCTION_24();
}

void sub_21FF94AA4()
{
  uint64_t v0;

  v0 = sub_21FFC5030();
  MEMORY[0x24BDAC7A8](v0);
  _s9ItemShelfVMa();
}

void _s9ItemShelfVMa()
{
  JUMPOUT(0x2207DB418);
}

uint64_t sub_21FF94E54()
{
  uint64_t v1;

  OUTLINED_FUNCTION_39_3();
  return v1;
}

uint64_t sub_21FF94E80()
{
  uint64_t v1;

  OUTLINED_FUNCTION_39_3();
  return v1;
}

uint64_t sub_21FF94EB0()
{
  return sub_21FFC42F8();
}

uint64_t sub_21FF94ED0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_21FFC4190();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_21FFC4304();
}

void sub_21FF94F50(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[39];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7[18] = a2;
  v7[9] = *(a1 - 1);
  MEMORY[0x24BDAC7A8](a1);
  v7[7] = v3;
  OUTLINED_FUNCTION_95((uint64_t)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255590FE8);
  v4 = a1[3];
  v5 = a1[4];
  v6 = a1[5];
  v8 = a1[2];
  v9 = v4;
  v7[21] = v8;
  v10 = v5;
  v11 = v6;
  v7[15] = v5;
  OUTLINED_FUNCTION_9_11();
  _s21AdditionalContentViewVMa();
}

void sub_21FF95004(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v8;
  uint64_t v9;

  v8 = sub_21FF997BC();
  *(_QWORD *)(v6 - 128) = v1;
  *(_QWORD *)(v6 - 120) = a1;
  *(_QWORD *)(v6 - 112) = v8;
  *(_QWORD *)(v6 - 104) = v9;
  OUTLINED_FUNCTION_9_11();
  sub_21FFC4130();
  OUTLINED_FUNCTION_21_4();
  sub_21FFC44CC();
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_1_23();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591008);
  *(_QWORD *)(v6 - 128) = v4;
  *(_QWORD *)(v6 - 120) = v2;
  *(_QWORD *)(v6 - 304) = v2;
  *(_QWORD *)(v6 - 112) = v5;
  *(_QWORD *)(v6 - 104) = v3;
  *(_QWORD *)(v6 - 312) = v3;
  OUTLINED_FUNCTION_9_11();
  _s12ItemShelfRowVMa();
}

void sub_21FF95090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = OUTLINED_FUNCTION_20_5();
  v3 = sub_21FF99840();
  v4 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v1 - 128) = v0;
  *(_QWORD *)(v1 - 120) = v4;
  *(_QWORD *)(v1 - 112) = v2;
  *(_QWORD *)(v1 - 104) = v3;
  *(_QWORD *)(v1 - 96) = MEMORY[0x24BEE1778];
  OUTLINED_FUNCTION_9_11();
  sub_21FFC4DE4();
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF950DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v2 - 144) = a1;
  *(_QWORD *)(v2 - 136) = v3;
  *(_QWORD *)(v2 - 152) = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v1, v2 - 144);
  OUTLINED_FUNCTION_63();
}

void sub_21FF95114()
{
  OUTLINED_FUNCTION_15_6();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558EFB8);
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF95140(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  sub_21FF1034C(&qword_25558EFB0, v1);
  *(_QWORD *)(v2 - 168) = a1;
  *(_QWORD *)(v2 - 160) = v4;
  OUTLINED_FUNCTION_63();
}

void sub_21FF9516C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = v1;
  *(_QWORD *)(v2 - 120) = a1;
  OUTLINED_FUNCTION_9_11();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF95188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = v1;
  *(_QWORD *)(v2 - 120) = v0;
  OUTLINED_FUNCTION_36_5();
  OUTLINED_FUNCTION_14_10();
  OUTLINED_FUNCTION_20_5();
  sub_21FFC46E8();
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF951C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 184) = a1;
  *(_QWORD *)(v2 - 176) = v1;
  OUTLINED_FUNCTION_49();
}

void sub_21FF951D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 - 128) = v1;
  *(_QWORD *)(v3 - 120) = v2;
  v4 = MEMORY[0x24BDF10F0];
  *(_QWORD *)(v3 - 112) = a1;
  *(_QWORD *)(v3 - 104) = v4;
  OUTLINED_FUNCTION_9_11();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF951F0()
{
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591020);
  OUTLINED_FUNCTION_86_1();
  sub_21FFC461C();
  OUTLINED_FUNCTION_86_1();
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF95250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  *(_QWORD *)(v10 - 464) = a1;
  v11 = sub_21FFC4D54();
  OUTLINED_FUNCTION_0_21(*(_QWORD *)(v11 - 8));
  MEMORY[0x24BDAC7A8](v12);
  v13 = sub_21FFC419C();
  OUTLINED_FUNCTION_0_21(*(_QWORD *)(v13 - 8));
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_95((uint64_t)&a9 - v15);
  *(_QWORD *)(v10 - 336) = v16;
  v17 = sub_21FFC419C();
  *(_QWORD *)(v10 - 416) = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_104_0();
  *(_QWORD *)(v10 - 440) = v18;
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_95((uint64_t)&a9 - v20);
  v21 = sub_21FFC5AC8();
  *(_QWORD *)(v10 - 352) = v21;
  *(_QWORD *)(v10 - 368) = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_104_0();
  *(_QWORD *)(v10 - 376) = v22;
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_95((uint64_t)&a9 - v24);
  *(_QWORD *)(v10 - 384) = v9;
  sub_21FFC5030();
  OUTLINED_FUNCTION_63();
}

void sub_21FF953EC()
{
  uint64_t v0;
  uint64_t v1;

  if (sub_21FFC59F0() >= 1)
  {
    v1 = sub_21FFC4484();
    MEMORY[0x24BDAC7A8](v1);
    sub_21FFC4D48();
    sub_21FFC4754();
    OUTLINED_FUNCTION_92();
  }
  OUTLINED_FUNCTION_34_4(*(_QWORD *)(v0 - 376), 1);
  OUTLINED_FUNCTION_92();
}

void sub_21FF95694(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 200) = a1;
  *(_QWORD *)(v2 - 192) = v1;
  OUTLINED_FUNCTION_20();
}

void sub_21FF956B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 216) = a1;
  *(_QWORD *)(v2 - 208) = v1;
  OUTLINED_FUNCTION_49_3();
}

void sub_21FF95710(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 232) = a1;
  *(_QWORD *)(v2 - 224) = v1;
  OUTLINED_FUNCTION_20();
}

void sub_21FF95728(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 248) = a1;
  *(_QWORD *)(v2 - 240) = v1;
  OUTLINED_FUNCTION_49_3();
}

void sub_21FF95738(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  OUTLINED_FUNCTION_75();
}

void sub_21FF9574C()
{
  void (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_21FFB57EC(v2, v1, *(_QWORD *)(v3 - 320));
  v0(v2, v1);
  OUTLINED_FUNCTION_24();
}

void sub_21FF9577C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591008);
  _s12ItemShelfRowVMa();
}

void sub_21FF957EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  unint64_t v16;
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

  v15 = sub_21FFC419C();
  v16 = sub_21FF99840();
  v17 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v13 - 128) = v10;
  *(_QWORD *)(v13 - 120) = v17;
  *(_QWORD *)(v13 - 112) = v15;
  *(_QWORD *)(v13 - 104) = v16;
  *(_QWORD *)(v13 - 96) = MEMORY[0x24BEE1778];
  v18 = sub_21FFC4DE4();
  v19 = MEMORY[0x2207DB4B4](&unk_21FFCBF38, a1);
  v20 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v13 - 144) = v19;
  *(_QWORD *)(v13 - 136) = v20;
  v21 = MEMORY[0x24BDED308];
  *(_QWORD *)(v13 - 152) = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v15, v13 - 144);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v18, v13 - 152);
  v22 = sub_21FFC4D30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558EFB8);
  v23 = sub_21FFC419C();
  v24 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4498], v22);
  sub_21FF1034C(&qword_25558EFB0, &qword_25558EFB8);
  *(_QWORD *)(v13 - 168) = v24;
  *(_QWORD *)(v13 - 160) = v25;
  v26 = MEMORY[0x2207DB4B4](v21, v23, v13 - 168);
  *(_QWORD *)(v13 - 128) = v23;
  *(_QWORD *)(v13 - 120) = v26;
  MEMORY[0x2207DB460](255, v13 - 128, MEMORY[0x24BDF2D58], 0);
  *(_QWORD *)(v13 - 128) = v23;
  *(_QWORD *)(v13 - 120) = v26;
  swift_getOpaqueTypeConformance2();
  v27 = sub_21FFC3FA4();
  v28 = sub_21FFC419C();
  v29 = sub_21FFC46E8();
  v9[11] = v29;
  *(_QWORD *)(v13 - 184) = MEMORY[0x2207DB4B4](MEMORY[0x24BDEB238], v27);
  *(_QWORD *)(v13 - 176) = MEMORY[0x24BDEBEE0];
  v9[12] = v28;
  v30 = MEMORY[0x2207DB4B4](v21, v28, v13 - 184);
  v9[10] = v30;
  *(_QWORD *)(v13 - 128) = v28;
  *(_QWORD *)(v13 - 120) = v29;
  v31 = MEMORY[0x24BDF10F0];
  *(_QWORD *)(v13 - 112) = v30;
  *(_QWORD *)(v13 - 104) = v31;
  MEMORY[0x2207DB460](255, v13 - 128, MEMORY[0x24BDF3000], 0);
  v9[8] = sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591020);
  v9[9] = sub_21FFC419C();
  sub_21FFC461C();
  v9[14] = sub_21FFC419C();
  v32 = sub_21FFC419C();
  v33 = *(_QWORD *)(v32 - 8);
  v9[15] = v32;
  v9[16] = v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v9[6] = (char *)&a9 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v34);
  v9[13] = (char *)&a9 - v36;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255590FE8);
  *(_QWORD *)(v13 - 128) = v9[7];
  *(_QWORD *)(v13 - 120) = v12;
  *(_QWORD *)(v13 - 112) = v9[19];
  *(_QWORD *)(v13 - 104) = v11;
  _s21AdditionalContentViewVMa();
}

void sub_21FF95AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v14 = sub_21FF997BC();
  *(_QWORD *)(v12 - 128) = v11;
  *(_QWORD *)(v12 - 120) = a1;
  *(_QWORD *)(v12 - 112) = v14;
  *(_QWORD *)(v12 - 104) = v15;
  sub_21FFC4130();
  sub_21FFC419C();
  v16 = sub_21FFC44CC();
  v9[3] = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v17 = sub_21FFC419C();
  v9[4] = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v18 = sub_21FFC419C();
  v9[5] = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  MEMORY[0x24BDAC7A8](v19);
  v9[18] = (char *)&a9 - v20;
  v21 = v9[1];
  *(_QWORD *)(v12 - 128) = v10;
  *(_QWORD *)(v12 - 120) = v21;
  v22 = v9[2];
  *(_QWORD *)(v12 - 112) = v9[19];
  *(_QWORD *)(v12 - 104) = v22;
  _s9ItemShelfVMa();
}

void sub_21FF95C18(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  sub_21FF95F24();
}

void sub_21FF95C28()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);

  sub_21FFC4748();
  v10 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEC8E0], v4);
  v11 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v9 - 200) = v10;
  *(_QWORD *)(v9 - 192) = v11;
  v12 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v8, v9 - 200);
  v13 = MEMORY[0x24BDF1F80];
  *(_QWORD *)(v9 - 216) = v12;
  *(_QWORD *)(v9 - 208) = v13;
  v14 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEF3E0], v1, v9 - 216);
  sub_21FFC4B50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 24) + 8))(v5, v1);
  sub_21FFC4754();
  *(_QWORD *)(v9 - 232) = v14;
  v15 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v9 - 224) = MEMORY[0x24BDECC60];
  v16 = MEMORY[0x24BDED308];
  v17 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v2, v9 - 232);
  sub_21FFC4B50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 32) + 8))(v3, v2);
  *(_QWORD *)(v9 - 248) = v17;
  *(_QWORD *)(v9 - 240) = v15;
  *(_QWORD *)(v0 + 56) = MEMORY[0x2207DB4B4](v16, v6, v9 - 248);
  sub_21FFB5D18(v7, v6, *(_QWORD *)(v0 + 144));
  v18 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 40) + 8);
  *(_QWORD *)(v0 + 152) = v18;
  v18(v7, v6);
  sub_21FF963F8(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 48));
}

uint64_t sub_21FF95D78()
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
  uint64_t OpaqueTypeConformance2;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);

  v8 = v0[11];
  *(_QWORD *)(v7 - 128) = v0[12];
  *(_QWORD *)(v7 - 120) = v8;
  *(_QWORD *)(v7 - 112) = v0[10];
  *(_QWORD *)(v7 - 104) = MEMORY[0x24BDF10F0];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v10 = sub_21FF9995C();
  v0[31] = OpaqueTypeConformance2;
  v0[32] = v10;
  v11 = MEMORY[0x2207DB4B4](v2, v0[8], v0 + 31);
  sub_21FF1034C(&qword_255591030, &qword_255591020);
  v0[29] = v11;
  v0[30] = v12;
  v13 = MEMORY[0x2207DB4B4](v2, v0[9], v0 + 29);
  sub_21FF0F7EC(&qword_255591038, (void (*)(uint64_t))MEMORY[0x24BDF02F8]);
  v0[27] = v13;
  v0[28] = v14;
  v0[25] = MEMORY[0x2207DB4B4](v2, v0[14], v0 + 27);
  v0[26] = v6;
  v15 = v2;
  v16 = v0[15];
  v17 = MEMORY[0x2207DB4B4](v15, v16, v0 + 25);
  v18 = v0[13];
  sub_21FFB5D18(v3, v16, v18);
  v19 = v0[16];
  v20 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  v20(v3, v16);
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  v22 = v0[18];
  v21(v5, v22, v4);
  *(_QWORD *)(v7 - 128) = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v3, v18, v16);
  *(_QWORD *)(v7 - 120) = v3;
  v0[23] = v4;
  v0[24] = v16;
  v0[21] = v0[7];
  v0[22] = v17;
  sub_21FF51C7C(v7 - 128, 2, (uint64_t)(v0 + 23));
  v20(v18, v16);
  v23 = (void (*)(uint64_t, uint64_t))v0[19];
  v23(v22, v4);
  v20(v3, v16);
  return ((uint64_t (*)(uint64_t, uint64_t))v23)(v5, v4);
}

void sub_21FF95F24()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255590FE8);
  _s21AdditionalContentViewVMa();
}

uint64_t sub_21FF95F84(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_BYTE *, uint64_t);
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
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  _BYTE v44[96];

  v8 = sub_21FF997BC();
  *(_QWORD *)(v6 - 232) = v2;
  *(_QWORD *)(v6 - 120) = v2;
  *(_QWORD *)(v6 - 112) = a1;
  *(_QWORD *)(v6 - 272) = v8;
  *(_QWORD *)(v6 - 104) = v8;
  *(_QWORD *)(v6 - 96) = v9;
  *(_QWORD *)(v6 - 280) = v9;
  v10 = sub_21FFC4130();
  *(_QWORD *)(v6 - 248) = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v44[-v11];
  v13 = sub_21FFC419C();
  *(_QWORD *)(v6 - 240) = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = &v44[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v14);
  v18 = &v44[-v17];
  v19 = sub_21FFC44CC();
  *(_QWORD *)(v6 - 216) = *(_QWORD *)(v19 - 8);
  *(_QWORD *)(v6 - 208) = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  *(_QWORD *)(v6 - 224) = &v44[-v21];
  if (*((_BYTE *)v1 + *(int *)(v5 + 72)) == 1)
  {
    *(_QWORD *)(v6 - 288) = v44;
    v22 = MEMORY[0x24BDAC7A8](v20);
    *(_QWORD *)&v44[-48] = v4;
    *(_QWORD *)&v44[-40] = v3;
    v23 = *(_QWORD *)(v6 - 264);
    *(_QWORD *)&v44[-32] = *(_QWORD *)(v6 - 256);
    *(_QWORD *)&v44[-24] = v23;
    *(_QWORD *)&v44[-16] = v1;
    MEMORY[0x24BDAC7A8](v22);
    *(_QWORD *)&v44[-48] = v4;
    *(_QWORD *)&v44[-40] = v3;
    *(_QWORD *)&v44[-32] = v24;
    *(_QWORD *)&v44[-24] = v25;
    *(_QWORD *)&v44[-16] = v1;
    sub_21FF94A04((uint64_t)sub_21FF99B84);
    sub_21FFC476C();
    v26 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEC8E0], v10);
    sub_21FFC4B50();
    (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v6 - 248) + 8))(v12, v10);
    *(_QWORD *)(v6 - 192) = v26;
    *(_QWORD *)(v6 - 184) = MEMORY[0x24BDECC60];
    MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v13, v6 - 192);
    sub_21FFB5D18((uint64_t)v16, v13, (uint64_t)v18);
    v27 = *(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v6 - 240) + 8);
    v27(v16, v13);
    sub_21FFB57EC((uint64_t)v18, v13, (uint64_t)v16);
    v28 = *(_QWORD *)(v6 - 224);
    sub_21FF51C10();
    v27(v16, v13);
    v27(v18, v13);
  }
  else
  {
    v29 = v1[1];
    *(_QWORD *)(v6 - 120) = *v1;
    *(_QWORD *)(v6 - 112) = v29;
    sub_21FF2E0A8();
    swift_bridgeObjectRetain();
    v30 = sub_21FFC48EC();
    v32 = v31;
    v34 = v33 & 1;
    v35 = sub_21FFC48A4();
    v37 = v36;
    v39 = v38;
    v41 = v40 & 1;
    sub_21FF2E3E4(v30, v32, v34);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v6 - 120) = v35;
    *(_QWORD *)(v6 - 112) = v37;
    *(_BYTE *)(v6 - 104) = v41;
    *(_QWORD *)(v6 - 96) = v39;
    *(_QWORD *)(v6 - 144) = MEMORY[0x2207DB4B4](MEMORY[0x24BDEC8E0], v10);
    *(_QWORD *)(v6 - 136) = MEMORY[0x24BDECC60];
    MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v13, v6 - 144);
    v28 = *(_QWORD *)(v6 - 224);
    sub_21FF51DA8();
    sub_21FF2E3E4(v35, v37, v41);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(v6 - 160) = MEMORY[0x2207DB4B4](MEMORY[0x24BDEC8E0], v10);
  *(_QWORD *)(v6 - 152) = MEMORY[0x24BDECC60];
  *(_QWORD *)(v6 - 176) = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v13, v6 - 160);
  *(_QWORD *)(v6 - 168) = MEMORY[0x24BDF1F80];
  v42 = *(_QWORD *)(v6 - 208);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEF3E0], v42, v6 - 176);
  sub_21FFB57EC(v28, v42, *(_QWORD *)(v6 - 200));
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 216) + 8))(v28, v42);
}

void sub_21FF963F8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v21 = a2;
  v20 = sub_21FFC4190();
  v19 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v18 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21FFC46D0();
  MEMORY[0x24BDAC7A8](v4);
  v16 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21FFC46E8();
  v17 = *(_QWORD *)(v6 - 8);
  v9[3] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v15 = (char *)v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591008);
  v14 = a1;
  v8 = a1[3];
  v10 = a1[2];
  v11 = v8;
  v13 = a1[4];
  v12 = a1[5];
  v22 = v10;
  v23 = v8;
  v24 = v13;
  v25 = v12;
  _s12ItemShelfRowVMa();
}

uint64_t sub_21FF9655C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
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
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
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
  uint64_t OpaqueTypeConformance2;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
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
  _BYTE v60[96];

  v5 = sub_21FFC419C();
  v6 = sub_21FF99840();
  v7 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v3 - 128) = v1;
  *(_QWORD *)(v3 - 120) = v7;
  *(_QWORD *)(v3 - 112) = v5;
  *(_QWORD *)(v3 - 104) = v6;
  *(_QWORD *)(v3 - 96) = MEMORY[0x24BEE1778];
  v8 = sub_21FFC4DE4();
  v9 = MEMORY[0x2207DB4B4](&unk_21FFCBF38, a1);
  v10 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v3 - 144) = v9;
  *(_QWORD *)(v3 - 136) = v10;
  v11 = MEMORY[0x24BDED308];
  *(_QWORD *)(v3 - 152) = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v5, v3 - 144);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v8, v3 - 152);
  v12 = sub_21FFC4D30();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558EFB8);
  v13 = sub_21FFC419C();
  v14 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4498], v12);
  sub_21FF1034C(&qword_25558EFB0, &qword_25558EFB8);
  *(_QWORD *)(v3 - 168) = v14;
  *(_QWORD *)(v3 - 160) = v15;
  v16 = MEMORY[0x2207DB4B4](v11, v13, v3 - 168);
  *(_QWORD *)(v3 - 128) = v13;
  *(_QWORD *)(v3 - 120) = v16;
  *(_QWORD *)(v3 - 472) = MEMORY[0x2207DB460](255, v3 - 128, MEMORY[0x24BDF2D58], 0);
  *(_QWORD *)(v3 - 128) = v13;
  *(_QWORD *)(v3 - 120) = v16;
  swift_getOpaqueTypeConformance2();
  v17 = sub_21FFC3FA4();
  *(_QWORD *)(v3 - 440) = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = &v60[-v18];
  v20 = sub_21FFC419C();
  *(_QWORD *)(v3 - 416) = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v3 - 504) = &v60[-v21];
  *(_QWORD *)(v3 - 184) = MEMORY[0x2207DB4B4](MEMORY[0x24BDEB238], v17);
  *(_QWORD *)(v3 - 176) = v10;
  v22 = MEMORY[0x2207DB4B4](v11, v20, v3 - 184);
  *(_QWORD *)(v3 - 128) = v20;
  *(_QWORD *)(v3 - 120) = v2;
  v23 = MEMORY[0x24BDF10F0];
  *(_QWORD *)(v3 - 112) = v22;
  *(_QWORD *)(v3 - 104) = v23;
  v24 = v22;
  v25 = MEMORY[0x2207DB460](0, v3 - 128, MEMORY[0x24BDF3000], 0);
  *(_QWORD *)(v3 - 456) = *(_QWORD *)(v25 - 8);
  *(_QWORD *)(v3 - 480) = v25;
  MEMORY[0x24BDAC7A8](v25);
  v27 = &v60[-v26];
  v28 = sub_21FFC419C();
  *(_QWORD *)(v3 - 408) = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  *(_QWORD *)(v3 - 512) = &v60[-v29];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591020);
  v30 = sub_21FFC419C();
  v31 = *(_QWORD *)(v30 - 8);
  *(_QWORD *)(v3 - 432) = v30;
  *(_QWORD *)(v3 - 400) = v31;
  MEMORY[0x24BDAC7A8](v30);
  *(_QWORD *)(v3 - 496) = &v60[-v32];
  sub_21FFC461C();
  v33 = sub_21FFC419C();
  *(_QWORD *)(v3 - 392) = v33;
  *(_QWORD *)(v3 - 384) = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  *(_QWORD *)(v3 - 464) = &v60[-v34];
  sub_21FFC4718();
  *(_QWORD *)(v3 - 272) = *(_QWORD *)(v3 - 448);
  *(_QWORD *)(v3 - 264) = *(_QWORD *)(v3 - 424);
  v35 = *(_QWORD *)(v3 - 376);
  *(_QWORD *)(v3 - 256) = *(_QWORD *)(v3 - 368);
  *(_QWORD *)(v3 - 248) = v35;
  *(_QWORD *)(v3 - 240) = *(_QWORD *)(v3 - 296);
  sub_21FFC3FB0();
  v36 = *(_QWORD *)(v3 - 360);
  sub_21FFC4E5C();
  v37 = *(_QWORD *)(v3 - 504);
  sub_21FFC4AFC();
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v3 - 440) + 8))(v19, v17);
  sub_21FFC46C4();
  v38 = *(_QWORD *)(v3 - 352);
  sub_21FFC46DC();
  v39 = *(_QWORD *)(v3 - 488);
  v40 = MEMORY[0x24BDF10F0];
  sub_21FFC4A78();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 336) + 8))(v38, v39);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 416) + 8))(v37, v20);
  *(_QWORD *)(v3 - 128) = v20;
  *(_QWORD *)(v3 - 120) = v39;
  *(_QWORD *)(v3 - 112) = v24;
  *(_QWORD *)(v3 - 104) = v40;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v42 = *(_QWORD *)(v3 - 512);
  v43 = *(_QWORD *)(v3 - 480);
  sub_21FFC4AD8();
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v3 - 456) + 8))(v27, v43);
  v44 = v36;
  v45 = *(_QWORD *)(v3 - 296);
  v46 = *(_QWORD *)(v3 - 328);
  sub_21FFB6048(v46);
  v47 = sub_21FF9995C();
  *(_QWORD *)(v3 - 200) = OpaqueTypeConformance2;
  *(_QWORD *)(v3 - 192) = v47;
  v48 = MEMORY[0x24BDED308];
  v49 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v28, v3 - 200);
  v50 = *(_QWORD *)(v3 - 496);
  sub_21FF9F374();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 320) + 8))(v46, *(_QWORD *)(v3 - 312));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 408) + 8))(v42, v28);
  v51 = sub_21FFC4730();
  v52 = *(_QWORD *)(v45 + *(int *)(v44 + 108) + 40);
  sub_21FF1034C(&qword_255591030, &qword_255591020);
  *(_QWORD *)(v3 - 216) = v49;
  *(_QWORD *)(v3 - 208) = v53;
  v54 = *(_QWORD *)(v3 - 432);
  v55 = MEMORY[0x2207DB4B4](v48, v54, v3 - 216);
  v56 = *(_QWORD *)(v3 - 464);
  sub_21FF981A0(v51, v52, 0, v54, v55);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 400) + 8))(v50, v54);
  sub_21FFC4730();
  sub_21FF0F7EC(&qword_255591038, (void (*)(uint64_t))MEMORY[0x24BDF02F8]);
  *(_QWORD *)(v3 - 232) = v55;
  *(_QWORD *)(v3 - 224) = v57;
  v58 = *(_QWORD *)(v3 - 392);
  MEMORY[0x2207DB4B4](v48, v58, v3 - 232);
  sub_21FFC4B50();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 384) + 8))(v56, v58);
}

void sub_21FF96C58()
{
  _s9ItemShelfVMa();
}

uint64_t sub_21FF96C80(uint64_t a1)
{
  return sub_21FF96C94(a1);
}

uint64_t sub_21FF96C94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = sub_21FFC5030();
  MEMORY[0x24BDAC7A8](v3);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v10 - v5, v1 + *(int *)(a1 + 52), v3);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAE8], v3);
  sub_21FFC5924();
  sub_21FFC5444();
  v6 = sub_21FFC5C00();
  result = swift_bridgeObjectRelease();
  if (v6)
  {
    if (*(_BYTE *)(v1 + *(int *)(a1 + 68)) == 5)
    {
      return swift_bridgeObjectRelease();
    }
    else
    {
      v9 = _s9ViewModelCMa(0, *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 40), v8);
      sub_21FFC4244();
      sub_21FF74A64();
      swift_bridgeObjectRelease();
      return swift_release();
    }
  }
  return result;
}

void sub_21FF96DF0()
{
  uint64_t v0;

  v0 = sub_21FFC5030();
  MEMORY[0x24BDAC7A8](v0);
  _s21AdditionalContentViewVMa();
}

void sub_21FF96E7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 - 128) = *(_QWORD *)(a1 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8](v7);
  *(_QWORD *)(v6 - 144) = *v5;
  *(_QWORD *)(v6 - 160) = v5[1];
  *(_QWORD *)(v6 - 112) = v1;
  *(_QWORD *)(v6 - 104) = v4;
  *(_QWORD *)(v6 - 96) = v3;
  *(_QWORD *)(v6 - 88) = v2;
  _s9ItemShelfVMa();
}

void sub_21FF96EF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v2, v3 + *(int *)(a1 + 52), *(_QWORD *)(v4 - 136));
  v6 = v3 + *(int *)(a1 + 96);
  v8 = *(_QWORD *)(v6 + 8);
  v7 = *(_QWORD *)(v6 + 16);
  v9 = *(_QWORD *)(v6 + 24);
  *(_BYTE *)(v4 - 112) = *(_BYTE *)v6;
  *(_QWORD *)(v4 - 104) = v8;
  *(_QWORD *)(v4 - 96) = v7;
  *(_QWORD *)(v4 - 88) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21FF0E594(v9);
  sub_21FF9A804();
}

uint64_t sub_21FF96F74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);

  sub_21FFB5D18(v2, v0, v1);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 128) + 8);
  v4(v2, v0);
  sub_21FFB57EC(v1, v0, *(_QWORD *)(v3 - 120));
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(v1, v0);
}

void sub_21FF96FF4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591000);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v13 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v12 = sub_21FFC43B8();
  *((_QWORD *)v12 + 1) = 0x4010000000000000;
  v12[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591048);
  sub_21FF9714C(a1, a2, a3, a4, a5);
}

void sub_21FF970AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_21FFC4760();
  *(_QWORD *)(v4 - 144) = v3;
  *(_QWORD *)(v4 - 136) = v2;
  *(_QWORD *)(v4 - 128) = v1;
  *(_QWORD *)(v4 - 120) = v0;
  _s9ItemShelfVMa();
}

void sub_21FF970C8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_21FFC3F80();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  sub_21FF99B9C(v2, v1);
  v12 = v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255590FE8) + 36);
  *(_BYTE *)v12 = v3;
  *(_QWORD *)(v12 + 8) = v5;
  *(_QWORD *)(v12 + 16) = v7;
  *(_QWORD *)(v12 + 24) = v9;
  *(_QWORD *)(v12 + 32) = v11;
  *(_BYTE *)(v12 + 40) = 0;
  sub_21FF103AC(v2, v0);
}

void sub_21FF9714C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[13];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v10 = sub_21FFC44D8();
  v11 = *(_QWORD *)(v10 - 8);
  v19[8] = v10;
  v19[9] = v11;
  MEMORY[0x24BDAC7A8](v10);
  v19[4] = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558F2B8);
  v19[6] = *(_QWORD *)(v13 - 8);
  v19[7] = v13;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v19[5] = (char *)v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v19[10] = (char *)v19 - v16;
  v17 = *a1;
  v18 = a1[1];
  v19[1] = a1;
  v20 = v17;
  v21 = v18;
  sub_21FF2E0A8();
  swift_bridgeObjectRetain();
  sub_21FFC48EC();
  v20 = a2;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  _s9ItemShelfVMa();
}

uint64_t sub_21FF9727C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);

  v5 = sub_21FFC48A4();
  v7 = v6;
  v9 = v8 & 1;
  sub_21FF2E3E4(v1, v2, v3);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v4 - 152) = sub_21FFC4C28();
  v10 = sub_21FFC4880();
  v12 = v11;
  *(_QWORD *)(v4 - 232) = v13;
  *(_DWORD *)(v4 - 236) = v14 & 1;
  sub_21FF2E3E4(v5, v7, v9);
  swift_release();
  swift_bridgeObjectRelease();
  *(_DWORD *)(v4 - 252) = sub_21FFC4760();
  sub_21FFC3F80();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = *(_QWORD *)(v4 - 224);
  sub_21FFC4238();
  sub_21FF4D348();
  sub_21FF0F7EC(&qword_25558E558, (void (*)(uint64_t))MEMORY[0x24BDEF428]);
  v24 = *(_QWORD *)(v4 - 216);
  v25 = *(_QWORD *)(v4 - 192);
  sub_21FFC4994();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 184) + 8))(v23, v25);
  v27 = *(_QWORD *)(v4 - 208);
  v26 = *(_QWORD *)(v4 - 200);
  v28 = *(_QWORD *)(v4 - 176);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v28, v24, v26);
  v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
  v30 = v27;
  v31 = v24;
  v32 = v24;
  v33 = v26;
  v29(v31, v28, v26);
  *(_QWORD *)v0 = v10;
  *(_QWORD *)(v0 + 8) = v12;
  LODWORD(v28) = *(_DWORD *)(v4 - 236);
  *(_BYTE *)(v0 + 16) = v28;
  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v4 - 232);
  *(_BYTE *)(v0 + 32) = *(_DWORD *)(v4 - 252);
  *(_QWORD *)(v0 + 40) = v16;
  *(_QWORD *)(v0 + 48) = v18;
  *(_QWORD *)(v0 + 56) = v20;
  *(_QWORD *)(v0 + 64) = v22;
  *(_BYTE *)(v0 + 72) = 0;
  v34 = __swift_instantiateConcreteTypeFromMangledName(qword_255591050);
  v29(v0 + *(int *)(v34 + 48), v32, v33);
  v35 = v0 + *(int *)(v34 + 64);
  *(_QWORD *)v35 = 0;
  *(_BYTE *)(v35 + 8) = 1;
  sub_21FF2E218(v10, v12, v28);
  v36 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
  swift_bridgeObjectRetain();
  v36(*(_QWORD *)(v4 - 176), v33);
  v36(v32, v33);
  sub_21FF2E3E4(v10, v12, v28);
  return swift_bridgeObjectRelease();
}

void sub_21FF974D4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591008);
  _s12ItemShelfRowVMa();
}

void sub_21FF97538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
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

  v14 = sub_21FFC419C();
  v15 = sub_21FF99840();
  v16 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v12 - 128) = v9;
  *(_QWORD *)(v12 - 120) = v16;
  *(_QWORD *)(v12 - 112) = v14;
  *(_QWORD *)(v12 - 104) = v15;
  *(_QWORD *)(v12 - 96) = MEMORY[0x24BEE1778];
  v17 = sub_21FFC4DE4();
  *(_QWORD *)(v12 - 280) = v17;
  v18 = MEMORY[0x2207DB4B4](&unk_21FFCBF38, a1);
  v19 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v12 - 144) = v18;
  *(_QWORD *)(v12 - 136) = v19;
  v20 = MEMORY[0x24BDED308];
  *(_QWORD *)(v12 - 152) = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v14, v12 - 144);
  *(_QWORD *)(v12 - 288) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v17, v12 - 152);
  v21 = sub_21FFC4D30();
  *(_QWORD *)(v12 - 264) = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  *(_QWORD *)(v12 - 296) = (char *)&a9 - v22;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558EFB8);
  v23 = sub_21FFC419C();
  *(_QWORD *)(v12 - 272) = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  *(_QWORD *)(v12 - 312) = (char *)&a9 - v24;
  v25 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4498], v21);
  *(_QWORD *)(v12 - 328) = v25;
  sub_21FF1034C(&qword_25558EFB0, &qword_25558EFB8);
  *(_QWORD *)(v12 - 168) = v25;
  *(_QWORD *)(v12 - 160) = v26;
  v27 = MEMORY[0x2207DB4B4](v20, v23, v12 - 168);
  *(_QWORD *)(v12 - 320) = v27;
  *(_QWORD *)(v12 - 128) = v23;
  *(_QWORD *)(v12 - 120) = v27;
  v28 = MEMORY[0x2207DB460](0, v12 - 128, MEMORY[0x24BDF2D58], 0);
  *(_QWORD *)(v12 - 304) = *(_QWORD *)(v28 - 8);
  v29 = MEMORY[0x24BDAC7A8](v28);
  MEMORY[0x24BDAC7A8](v29);
  sub_21FFC43C4();
  *(_QWORD *)(v12 - 128) = v11;
  *(_QWORD *)(v12 - 120) = v10;
  v30 = *(_QWORD *)(v12 - 248);
  *(_QWORD *)(v12 - 112) = *(_QWORD *)(v12 - 256);
  *(_QWORD *)(v12 - 104) = v30;
  _s9ItemShelfVMa();
}

uint64_t sub_21FF97770()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);

  v10 = *(_QWORD *)(v9 - 240);
  *(_QWORD *)(v9 - 208) = v3;
  *(_QWORD *)(v9 - 200) = v8;
  *(_QWORD *)(v9 - 192) = v5;
  *(_QWORD *)(v9 - 184) = v1;
  *(_QWORD *)(v9 - 176) = v10;
  v11 = *(_QWORD *)(v9 - 296);
  sub_21FFC4D24();
  sub_21FF84EA4();
  v12 = *(_QWORD *)(v9 - 312);
  sub_21FFC49D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 264) + 8))(v11, v6);
  v13 = *(_QWORD *)(v9 - 320);
  sub_21FFC4A60();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 272) + 8))(v12, v7);
  *(_QWORD *)(v9 - 128) = v7;
  *(_QWORD *)(v9 - 120) = v13;
  swift_getOpaqueTypeConformance2();
  sub_21FFB5D18(v0, v2, v4);
  v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 304) + 8);
  v14(v0, v2);
  sub_21FFB57EC(v4, v2, *(_QWORD *)(v9 - 232));
  return ((uint64_t (*)(uint64_t, uint64_t))v14)(v4, v2);
}

void sub_21FF978CC()
{
  _s9ItemShelfVMa();
}

void sub_21FF9791C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v5 - 168) = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591008);
  *(_QWORD *)(v5 - 120) = v3;
  *(_QWORD *)(v5 - 112) = v4;
  *(_QWORD *)(v5 - 104) = v2;
  *(_QWORD *)(v5 - 96) = v1;
  _s12ItemShelfRowVMa();
}

uint64_t sub_21FF97974(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_BYTE *, uint64_t);
  uint64_t v26;
  _BYTE v27[80];

  *(_QWORD *)(v6 - 216) = a1;
  v7 = sub_21FFC419C();
  v8 = sub_21FF99840();
  *(_QWORD *)(v6 - 176) = v8;
  v9 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v6 - 120) = v2;
  *(_QWORD *)(v6 - 112) = v9;
  *(_QWORD *)(v6 - 104) = v7;
  *(_QWORD *)(v6 - 96) = v8;
  *(_QWORD *)(v6 - 88) = MEMORY[0x24BEE1778];
  v10 = sub_21FFC4DE4();
  *(_QWORD *)(v6 - 160) = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = &v27[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v15 = &v27[-v14];
  v16 = *(_QWORD *)(v6 - 208);
  v17 = *(_QWORD *)(*(_QWORD *)(v16 + *(int *)(v5 + 104)) + 16);
  *(_QWORD *)(v6 - 120) = 0;
  *(_QWORD *)(v6 - 112) = v17;
  *(_QWORD *)(v6 - 224) = swift_getKeyPath();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v16, v5);
  v18 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v19 = (char *)swift_allocObject();
  v20 = *(_QWORD *)(v6 - 200);
  *((_QWORD *)v19 + 2) = v4;
  *((_QWORD *)v19 + 3) = v20;
  v21 = *(_QWORD *)(v6 - 184);
  *((_QWORD *)v19 + 4) = *(_QWORD *)(v6 - 192);
  *((_QWORD *)v19 + 5) = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(&v19[v18], v1, v5);
  v22 = MEMORY[0x2207DB4B4](&unk_21FFCBF38, *(_QWORD *)(v6 - 216));
  v23 = MEMORY[0x24BDEBEE0];
  *(_QWORD *)(v6 - 136) = v22;
  *(_QWORD *)(v6 - 128) = v23;
  v26 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v7, v6 - 136);
  sub_21FFC4DCC();
  *(_QWORD *)(v6 - 144) = v26;
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v10, v6 - 144);
  sub_21FFB5D18((uint64_t)v13, v10, (uint64_t)v15);
  v24 = *(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v6 - 160) + 8);
  v24(v13, v10);
  sub_21FFB57EC((uint64_t)v15, v10, *(_QWORD *)(v6 - 152));
  return ((uint64_t (*)(_BYTE *, uint64_t))v24)(v15, v10);
}

void sub_21FF97B80()
{
  uint64_t v0;

  v0 = sub_21FFC5030();
  MEMORY[0x24BDAC7A8](v0);
  _s12ItemShelfRowVMa();
}

void sub_21FF97C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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

  *(_QWORD *)(v13 - 296) = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v13 - 312) = (char *)&a9 - v14;
  *(_QWORD *)(v13 - 320) = v15;
  v16 = sub_21FFC419C();
  *(_QWORD *)(v13 - 248) = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  *(_QWORD *)(v13 - 304) = (char *)&a9 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  *(_QWORD *)(v13 - 256) = (char *)&a9 - v19;
  *(_QWORD *)(v13 - 288) = v11;
  *(_QWORD *)(v13 - 176) = v11;
  *(_QWORD *)(v13 - 168) = v10;
  *(_QWORD *)(v13 - 280) = v10;
  *(_QWORD *)(v13 - 272) = v9;
  *(_QWORD *)(v13 - 160) = v9;
  *(_QWORD *)(v13 - 152) = v12;
  _s9ItemShelfVMa();
}

uint64_t sub_21FF97CF4(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v1 + a1[13], v2);
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v9 = v1 + a1[26];
    if (v5 < *(_QWORD *)(*(_QWORD *)v9 + 16))
    {
      *(_QWORD *)(v6 - 328) = sub_21FF97F60(*(_QWORD *)(*(_QWORD *)v9 + 8 * v5 + 32), (uint64_t)a1);
      *(_QWORD *)(v6 - 336) = v10;
      *(_QWORD *)(v6 - 344) = v11;
      v12 = (char *)(v1 + a1[25]);
      v13 = *v12;
      v15 = *((_QWORD *)v12 + 1);
      v14 = *((_QWORD *)v12 + 2);
      *(_DWORD *)(v6 - 348) = *(unsigned __int8 *)(v1 + a1[17]);
      v16 = *((_QWORD *)v12 + 3);
      *(_BYTE *)(v6 - 208) = v13;
      *(_QWORD *)(v6 - 200) = v15;
      *(_QWORD *)(v6 - 192) = v14;
      *(_QWORD *)(v6 - 184) = v16;
      *(_OWORD *)(v6 - 224) = *(_OWORD *)(v1 + a1[22]);
      swift_bridgeObjectRetain();
      sub_21FF0E594(v16);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255591040);
      sub_21FFC4CDC();
      memcpy((void *)(v6 - 176), (const void *)(v1 + a1[27]), 0x58uLL);
      sub_21FFAF3E4();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21FF97F60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t);
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t result;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21FFC5030();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDDEB00], v8);
  v9 = sub_21FFC59F0();
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v27 = v2;
  v26(v7, v2, a2);
  if (v9 <= a1)
  {
    v11 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    v12 = MEMORY[0x24BEE4AF8];
LABEL_11:
    result = v11(v7, a2);
  }
  else
  {
    v10 = 0;
    v25 = v7 + 24;
    v11 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    v12 = MEMORY[0x24BEE4AF8];
    v13 = v11;
    while (1)
    {
      v14 = *(_QWORD *)&v25[*(int *)(a2 + 108)];
      result = v11(v7, a2);
      if (v10 >= v14)
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21FF750CC();
        v12 = v18;
      }
      v16 = *(_QWORD *)(v12 + 16);
      if (v16 >= *(_QWORD *)(v12 + 24) >> 1)
      {
        sub_21FF750CC();
        v12 = v19;
      }
      *(_QWORD *)(v12 + 16) = v16 + 1;
      *(_QWORD *)(v12 + 8 * v16 + 32) = a1 + v10++;
      MEMORY[0x2207DB4B4](MEMORY[0x24BDDEB00], v8);
      v17 = sub_21FFC59F0();
      v26(v7, v27, a2);
      v11 = v13;
      if (a1 + v10 >= v17)
        goto LABEL_11;
    }
  }
  v20 = *(_QWORD *)(v27 + *(int *)(a2 + 108) + 24);
  if (!v20)
  {
    __break(1u);
    goto LABEL_24;
  }
  v21 = *(_QWORD *)(v12 + 16) % v20;
  if (!v21)
    goto LABEL_17;
  v22 = v20 - v21;
  if (__OFSUB__(v20, v21))
  {
    __break(1u);
LABEL_17:
    v22 = 0;
  }
  result = sub_21FF98294(0, v22);
  if (a1 != 0x8000000000000000 || v20 != -1)
    return v12;
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_21FF981A0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[5];
  char v18;

  v8 = sub_21FFC461C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  if ((a3 & 1) == 0)
    sub_21FFC3F80();
  v17[1] = v12;
  v17[2] = v13;
  v17[3] = v14;
  v17[4] = v15;
  v18 = a3 & 1;
  sub_21FFC4610();
  MEMORY[0x2207D9E4C](v11, a4, v8, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_21FF98294(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  if (a2 < 0)
  {
    result = sub_21FFC5BC4();
    __break(1u);
  }
  else if (a2)
  {
    result = sub_21FFC58C4();
    v5 = 0;
    *(_QWORD *)(result + 16) = a2;
    do
    {
      v6 = result + 8 * v5++;
      *(_QWORD *)(v6 + 32) = a1;
    }
    while (a2 != v5);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

BOOL sub_21FF98344(_QWORD *a1, _QWORD *a2, double a3, double a4, double a5, double a6)
{
  _BOOL4 v8;

  v8 = sub_21FF987B4(a1, a2) && a3 == a5;
  return a4 == a6 && v8;
}

uint64_t sub_21FF9838C(uint64_t a1, uint64_t a2)
{
  sub_21FF9A0D8(a1, a2);
  OUTLINED_FUNCTION_0_24();
  return OUTLINED_FUNCTION_0_24();
}

uint64_t sub_21FF983CC(uint64_t a1)
{
  _BYTE v3[72];

  OUTLINED_FUNCTION_7_9();
  sub_21FF9838C((uint64_t)v3, a1);
  return OUTLINED_FUNCTION_6_3();
}

void sub_21FF9841C(_QWORD *a1, _QWORD *a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  if (sub_21FF987B4(a1, a4))
    sub_21FF987B4(a2, a5);
  OUTLINED_FUNCTION_22_2();
}

void sub_21FF98470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_21FF9A0D8(a1, a2);
  sub_21FF9A0D8(a1, a3);
  sub_21FFC5CFC();
  OUTLINED_FUNCTION_22_2();
}

uint64_t sub_21FF984B0(uint64_t a1, uint64_t a2)
{
  _BYTE v5[72];

  OUTLINED_FUNCTION_7_9();
  sub_21FF98470((uint64_t)v5, a1, a2);
  return OUTLINED_FUNCTION_6_3();
}

BOOL sub_21FF98500(uint64_t a1, uint64_t a2)
{
  return sub_21FF98344(*(_QWORD **)a1, *(_QWORD **)a2, *(double *)(a1 + 8), *(double *)(a1 + 16), *(double *)(a2 + 8), *(double *)(a2 + 16));
}

uint64_t sub_21FF9851C()
{
  uint64_t *v0;

  return sub_21FF983CC(*v0);
}

uint64_t sub_21FF98528(uint64_t a1)
{
  uint64_t *v1;

  return sub_21FF9838C(a1, *v1);
}

uint64_t sub_21FF98534()
{
  uint64_t *v0;
  _BYTE v2[72];

  sub_21FFC5CF0();
  sub_21FF9838C((uint64_t)v2, *v0);
  return sub_21FFC5D20();
}

uint64_t sub_21FF98574(uint64_t a1, _QWORD **a2)
{
  char v2;

  sub_21FF9841C(*(_QWORD **)a1, *(_QWORD **)(a1 + 8), *(_QWORD *)(a1 + 16), *a2, a2[1]);
  return v2 & 1;
}

uint64_t sub_21FF985AC()
{
  uint64_t *v0;

  return sub_21FF984B0(*v0, v0[1]);
}

void sub_21FF985B8(uint64_t a1)
{
  uint64_t *v1;

  sub_21FF98470(a1, *v1, v1[1]);
}

uint64_t sub_21FF985C4()
{
  uint64_t *v0;
  _BYTE v2[72];

  sub_21FFC5CF0();
  sub_21FF98470((uint64_t)v2, *v0, v0[1]);
  return sub_21FFC5D20();
}

BOOL sub_21FF98604(uint64_t a1, uint64_t a2)
{
  return *(double *)a1 == *(double *)a2
      && *(double *)(a1 + 8) == *(double *)(a2 + 8)
      && *(double *)(a1 + 16) == *(double *)(a2 + 16)
      && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24)
      && *(double *)(a1 + 32) == *(double *)(a2 + 32)
      && *(double *)(a1 + 40) == *(double *)(a2 + 40)
      && *(double *)(a1 + 48) == *(double *)(a2 + 48)
      && ((*(unsigned __int8 *)(a1 + 56) ^ *(unsigned __int8 *)(a2 + 56)) & 1) == 0
      && *(double *)(a1 + 64) == *(double *)(a2 + 64)
      && *(double *)(a1 + 72) == *(double *)(a2 + 72)
      && *(double *)(a1 + 80) == *(double *)(a2 + 80);
}

uint64_t sub_21FF986C0()
{
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_0_24();
  sub_21FFC5CFC();
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_0_24();
  sub_21FFC5D08();
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_0_24();
  return OUTLINED_FUNCTION_0_24();
}

uint64_t sub_21FF9873C()
{
  OUTLINED_FUNCTION_7_9();
  sub_21FF986C0();
  return OUTLINED_FUNCTION_6_3();
}

uint64_t sub_21FF98778()
{
  sub_21FFC5CF0();
  sub_21FF986C0();
  return sub_21FFC5D20();
}

BOOL sub_21FF987B4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  _BOOL8 result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (a1[4] != a2[4])
    return 0;
  v3 = a1 + 5;
  v4 = a2 + 5;
  v5 = v2 - 1;
  do
  {
    result = v5 == 0;
    if (!v5)
      break;
    v8 = *v3++;
    v7 = v8;
    v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

uint64_t sub_21FF98820()
{
  return swift_allocateGenericValueMetadata();
}

void sub_21FF98828()
{
  unint64_t v0;
  unint64_t v1;

  sub_21FFC5030();
  if (v0 <= 0x3F)
  {
    sub_21FF7C288();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

_QWORD *sub_21FF9892C(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v26 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[13];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21FFC5030();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[14];
    v14 = *(_QWORD *)((char *)a2 + v13);
    sub_21FF0E594(v14);
    *(_QWORD *)((char *)v4 + v13) = v14;
    v15 = a3[16];
    *(_QWORD *)((char *)v4 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
    *(_QWORD *)((char *)v4 + v15) = *(_QWORD *)((char *)a2 + v15);
    v16 = a3[18];
    *((_BYTE *)v4 + a3[17]) = *((_BYTE *)a2 + a3[17]);
    *((_BYTE *)v4 + v16) = *((_BYTE *)a2 + v16);
    v17 = a3[20];
    *((_BYTE *)v4 + a3[19]) = *((_BYTE *)a2 + a3[19]);
    v18 = (_QWORD *)((char *)v4 + v17);
    v19 = (_QWORD *)((char *)a2 + v17);
    v21 = *v19;
    v20 = v19[1];
    *v18 = v21;
    v18[1] = v20;
    v22 = a3[21];
    v23 = (_QWORD *)((char *)v4 + v22);
    v24 = (_QWORD *)((char *)a2 + v22);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(qword_255590610);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v25 = sub_21FFC4190();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
    }
    else
    {
      *v23 = *v24;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v27 = a3[22];
    v28 = a3[23];
    v29 = (_QWORD *)((char *)v4 + v27);
    v30 = (_QWORD *)((char *)a2 + v27);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    v32 = (_QWORD *)((char *)v4 + v28);
    v33 = (_QWORD *)((char *)a2 + v28);
    v34 = v33[1];
    *v32 = *v33;
    v32[1] = v34;
    v35 = a3[24];
    v36 = (char *)v4 + v35;
    v37 = (char *)a2 + v35;
    *v36 = *v37;
    v38 = *((_QWORD *)v37 + 2);
    *((_QWORD *)v36 + 1) = *((_QWORD *)v37 + 1);
    *((_QWORD *)v36 + 2) = v38;
    v39 = *((_QWORD *)v37 + 3);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_21FF0E594(v39);
    *((_QWORD *)v36 + 3) = v39;
    v40 = a3[25];
    v41 = (char *)v4 + v40;
    v42 = (char *)a2 + v40;
    *v41 = *v42;
    v43 = *((_QWORD *)v42 + 2);
    *((_QWORD *)v41 + 1) = *((_QWORD *)v42 + 1);
    *((_QWORD *)v41 + 2) = v43;
    v44 = *((_QWORD *)v42 + 3);
    swift_bridgeObjectRetain();
    sub_21FF0E594(v44);
    *((_QWORD *)v41 + 3) = v44;
    v45 = a3[26];
    v46 = a3[27];
    v47 = (char *)v4 + v45;
    v48 = (char *)a2 + v45;
    *(_QWORD *)v47 = *(_QWORD *)v48;
    *(_OWORD *)(v47 + 8) = *(_OWORD *)(v48 + 8);
    memcpy((char *)v4 + v46, (char *)a2 + v46, 0x58uLL);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_21FF98B84(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[13];
  v5 = sub_21FFC5030();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  sub_21FF0EAB8(*(_QWORD *)(a1 + a2[14]));
  swift_release();
  swift_release();
  v6 = a1 + a2[21];
  __swift_instantiateConcreteTypeFromMangledName(qword_255590610);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_21FFC4190();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  v8 = a1 + a2[24];
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v8 + 24));
  v9 = a1 + a2[25];
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v9 + 24));
  return swift_bridgeObjectRelease();
}

_QWORD *sub_21FF98CB0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[13];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21FFC5030();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[14];
  v13 = *(_QWORD *)((char *)a2 + v12);
  sub_21FF0E594(v13);
  *(_QWORD *)((char *)a1 + v12) = v13;
  v14 = a3[16];
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  *(_QWORD *)((char *)a1 + v14) = *(_QWORD *)((char *)a2 + v14);
  v15 = a3[18];
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  *((_BYTE *)a1 + v15) = *((_BYTE *)a2 + v15);
  v16 = a3[20];
  *((_BYTE *)a1 + a3[19]) = *((_BYTE *)a2 + a3[19]);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  v21 = a3[21];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(qword_255590610);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v24 = sub_21FFC4190();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  }
  else
  {
    *v22 = *v23;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v25 = a3[22];
  v26 = a3[23];
  v27 = (_QWORD *)((char *)a1 + v25);
  v28 = (_QWORD *)((char *)a2 + v25);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  v30 = (_QWORD *)((char *)a1 + v26);
  v31 = (_QWORD *)((char *)a2 + v26);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  v33 = a3[24];
  v34 = (char *)a1 + v33;
  v35 = (char *)a2 + v33;
  *v34 = *v35;
  v36 = *((_QWORD *)v35 + 2);
  *((_QWORD *)v34 + 1) = *((_QWORD *)v35 + 1);
  *((_QWORD *)v34 + 2) = v36;
  v37 = *((_QWORD *)v35 + 3);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_21FF0E594(v37);
  *((_QWORD *)v34 + 3) = v37;
  v38 = a3[25];
  v39 = (char *)a1 + v38;
  v40 = (char *)a2 + v38;
  *v39 = *v40;
  v41 = *((_QWORD *)v40 + 2);
  *((_QWORD *)v39 + 1) = *((_QWORD *)v40 + 1);
  *((_QWORD *)v39 + 2) = v41;
  v42 = *((_QWORD *)v40 + 3);
  swift_bridgeObjectRetain();
  sub_21FF0E594(v42);
  *((_QWORD *)v39 + 3) = v42;
  v43 = a3[26];
  v44 = a3[27];
  v45 = (char *)a1 + v43;
  v46 = (char *)a2 + v43;
  *(_QWORD *)v45 = *(_QWORD *)v46;
  *(_OWORD *)(v45 + 8) = *(_OWORD *)(v46 + 8);
  memcpy((char *)a1 + v44, (char *)a2 + v44, 0x58uLL);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_21FF98EDC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[13];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21FFC5030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[14];
  v11 = *(_QWORD *)((char *)a2 + v10);
  sub_21FF0E594(v11);
  v12 = *(_QWORD *)((char *)a1 + v10);
  *(_QWORD *)((char *)a1 + v10) = v11;
  sub_21FF0EAB8(v12);
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  *(_QWORD *)((char *)a1 + a3[16]) = *(_QWORD *)((char *)a2 + a3[16]);
  swift_retain();
  swift_release();
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  *((_BYTE *)a1 + a3[18]) = *((_BYTE *)a2 + a3[18]);
  *((_BYTE *)a1 + a3[19]) = *((_BYTE *)a2 + a3[19]);
  v13 = a3[20];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  swift_retain();
  swift_release();
  *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
  if (a1 != a2)
  {
    v16 = a3[21];
    v17 = (_QWORD *)((char *)a1 + v16);
    v18 = (_QWORD *)((char *)a2 + v16);
    sub_21FF103AC((uint64_t)a1 + v16, qword_255590610);
    __swift_instantiateConcreteTypeFromMangledName(qword_255590610);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v19 = sub_21FFC4190();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    }
    else
    {
      *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v20 = a3[22];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_retain();
  swift_release();
  v23 = a3[23];
  v24 = (_QWORD *)((char *)a1 + v23);
  v25 = (_QWORD *)((char *)a2 + v23);
  *v24 = *v25;
  v24[1] = v25[1];
  swift_retain();
  swift_release();
  v26 = a3[24];
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  *v27 = *((_BYTE *)a2 + v26);
  *((_QWORD *)v27 + 1) = *(_QWORD *)((char *)a2 + v26 + 8);
  *((_QWORD *)v27 + 2) = *(_QWORD *)((char *)a2 + v26 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = *((_QWORD *)v28 + 3);
  sub_21FF0E594(v29);
  v30 = *((_QWORD *)v27 + 3);
  *((_QWORD *)v27 + 3) = v29;
  sub_21FF0EAB8(v30);
  v31 = a3[25];
  v32 = (char *)a1 + v31;
  v33 = (char *)a2 + v31;
  *v32 = *((_BYTE *)a2 + v31);
  *((_QWORD *)v32 + 1) = *(_QWORD *)((char *)a2 + v31 + 8);
  *((_QWORD *)v32 + 2) = *(_QWORD *)((char *)a2 + v31 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = *((_QWORD *)v33 + 3);
  sub_21FF0E594(v34);
  v35 = *((_QWORD *)v32 + 3);
  *((_QWORD *)v32 + 3) = v34;
  sub_21FF0EAB8(v35);
  v36 = a3[26];
  v37 = (char *)a1 + v36;
  v38 = (char *)a2 + v36;
  *(_QWORD *)((char *)a1 + v36) = *(_QWORD *)((char *)a2 + v36);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v37 + 1) = *((_QWORD *)v38 + 1);
  *((_QWORD *)v37 + 2) = *((_QWORD *)v38 + 2);
  v39 = a3[27];
  v40 = (char *)a1 + v39;
  v41 = (char *)a2 + v39;
  *(_QWORD *)v40 = *(_QWORD *)v41;
  *((_QWORD *)v40 + 1) = *((_QWORD *)v41 + 1);
  *((_QWORD *)v40 + 2) = *((_QWORD *)v41 + 2);
  *((_QWORD *)v40 + 3) = *((_QWORD *)v41 + 3);
  *((_QWORD *)v40 + 4) = *((_QWORD *)v41 + 4);
  *((_QWORD *)v40 + 5) = *((_QWORD *)v41 + 5);
  *((_QWORD *)v40 + 6) = *((_QWORD *)v41 + 6);
  v40[56] = v41[56];
  *((_QWORD *)v40 + 8) = *((_QWORD *)v41 + 8);
  *((_QWORD *)v40 + 9) = *((_QWORD *)v41 + 9);
  *((_QWORD *)v40 + 10) = *((_QWORD *)v41 + 10);
  return a1;
}

_OWORD *sub_21FF99214(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
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
  __int128 v21;
  __int128 v22;
  _OWORD *v23;
  _OWORD *v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;

  *a1 = *a2;
  v6 = a3[13];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21FFC5030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[15];
  *(_QWORD *)((char *)a1 + a3[14]) = *(_QWORD *)((char *)a2 + a3[14]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  v11 = a3[17];
  *(_QWORD *)((char *)a1 + a3[16]) = *(_QWORD *)((char *)a2 + a3[16]);
  *((_BYTE *)a1 + v11) = *((_BYTE *)a2 + v11);
  v12 = a3[19];
  *((_BYTE *)a1 + a3[18]) = *((_BYTE *)a2 + a3[18]);
  *((_BYTE *)a1 + v12) = *((_BYTE *)a2 + v12);
  v13 = a3[21];
  *(_OWORD *)((char *)a1 + a3[20]) = *(_OWORD *)((char *)a2 + a3[20]);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(qword_255590610);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v17 = sub_21FFC4190();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  v18 = a3[23];
  *(_OWORD *)((char *)a1 + a3[22]) = *(_OWORD *)((char *)a2 + a3[22]);
  *(_OWORD *)((char *)a1 + v18) = *(_OWORD *)((char *)a2 + v18);
  v19 = a3[24];
  v20 = a3[25];
  v21 = *(_OWORD *)((char *)a2 + v19);
  v22 = *(_OWORD *)((char *)a2 + v19 + 16);
  v23 = (_OWORD *)((char *)a1 + v19);
  *v23 = v21;
  v23[1] = v22;
  v24 = (_OWORD *)((char *)a1 + v20);
  v25 = (_OWORD *)((char *)a2 + v20);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  v27 = a3[26];
  v28 = a3[27];
  v29 = (char *)a1 + v27;
  v30 = (char *)a2 + v27;
  *(_OWORD *)v29 = *(_OWORD *)v30;
  *((_QWORD *)v29 + 2) = *((_QWORD *)v30 + 2);
  memcpy((char *)a1 + v28, (char *)a2 + v28, 0x58uLL);
  return a1;
}

_QWORD *sub_21FF993AC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[13];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21FFC5030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[14];
  v12 = *(_QWORD *)((char *)a1 + v11);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  sub_21FF0EAB8(v12);
  v13 = a3[16];
  *(_QWORD *)((char *)a1 + a3[15]) = *(_QWORD *)((char *)a2 + a3[15]);
  *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
  swift_release();
  v14 = a3[18];
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  *((_BYTE *)a1 + v14) = *((_BYTE *)a2 + v14);
  v15 = a3[20];
  *((_BYTE *)a1 + a3[19]) = *((_BYTE *)a2 + a3[19]);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  *(_QWORD *)((char *)a1 + v15) = *(_QWORD *)((char *)a2 + v15);
  swift_release();
  *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
  if (a1 != a2)
  {
    v18 = a3[21];
    v19 = (char *)a1 + v18;
    v20 = (char *)a2 + v18;
    sub_21FF103AC((uint64_t)a1 + v18, qword_255590610);
    v21 = __swift_instantiateConcreteTypeFromMangledName(qword_255590610);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v22 = sub_21FFC4190();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v19, v20, v22);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
  }
  v23 = a3[22];
  v24 = (_QWORD *)((char *)a1 + v23);
  v25 = (_QWORD *)((char *)a2 + v23);
  v27 = *v25;
  v26 = v25[1];
  *v24 = v27;
  v24[1] = v26;
  swift_release();
  v28 = a3[23];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_release();
  v31 = a3[24];
  v32 = (char *)a1 + v31;
  v33 = (char *)a2 + v31;
  *v32 = *((_BYTE *)a2 + v31);
  v34 = *(_QWORD *)((char *)a2 + v31 + 16);
  *((_QWORD *)v32 + 1) = *(_QWORD *)((char *)a2 + v31 + 8);
  *((_QWORD *)v32 + 2) = v34;
  swift_bridgeObjectRelease();
  v35 = *((_QWORD *)v32 + 3);
  *((_QWORD *)v32 + 3) = *((_QWORD *)v33 + 3);
  sub_21FF0EAB8(v35);
  v36 = a3[25];
  v37 = (char *)a1 + v36;
  v38 = (char *)a2 + v36;
  *v37 = *((_BYTE *)a2 + v36);
  v39 = *(_QWORD *)((char *)a2 + v36 + 16);
  *((_QWORD *)v37 + 1) = *(_QWORD *)((char *)a2 + v36 + 8);
  *((_QWORD *)v37 + 2) = v39;
  swift_bridgeObjectRelease();
  v40 = *((_QWORD *)v37 + 3);
  *((_QWORD *)v37 + 3) = *((_QWORD *)v38 + 3);
  sub_21FF0EAB8(v40);
  v41 = a3[26];
  v42 = (char *)a1 + v41;
  v43 = (char *)a2 + v41;
  *(_QWORD *)((char *)a1 + v41) = *(_QWORD *)((char *)a2 + v41);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v42 + 8) = *(_OWORD *)(v43 + 8);
  v44 = a3[27];
  v45 = (char *)a1 + v44;
  v46 = (char *)a2 + v44;
  *(_OWORD *)v45 = *(_OWORD *)v46;
  *((_QWORD *)v45 + 2) = *((_QWORD *)v46 + 2);
  *((_QWORD *)v45 + 3) = *((_QWORD *)v46 + 3);
  *((_OWORD *)v45 + 2) = *((_OWORD *)v46 + 2);
  *((_QWORD *)v45 + 6) = *((_QWORD *)v46 + 6);
  v45[56] = v46[56];
  *((_OWORD *)v45 + 4) = *((_OWORD *)v46 + 4);
  *((_QWORD *)v45 + 10) = *((_QWORD *)v46 + 10);
  return a1;
}

uint64_t sub_21FF99644()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_21FF99650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_22_2();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_13_4();
    if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    {
      v7 = v6;
      v8 = *(int *)(a3 + 52);
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(qword_255590F60);
      v8 = *(int *)(a3 + 84);
    }
    __swift_getEnumTagSinglePayload(a1 + v8, a2, v7);
  }
}

uint64_t sub_21FF996E8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_21FF996F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_22_2();
  }
  else
  {
    v8 = OUTLINED_FUNCTION_13_4();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 52);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(qword_255590F60);
      v10 = *(int *)(a4 + 84);
    }
    __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
  }
}

uint64_t sub_21FF99788()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21FF997BC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255590FF0;
  if (!qword_255590FF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255590FE8);
    sub_21FF1034C(&qword_255590FF8, &qword_255591000);
    v3[0] = v2;
    v3[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255590FF0);
  }
  return result;
}

unint64_t sub_21FF99840()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_255591010;
  if (!qword_255591010)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591008);
    v2 = sub_21FF998AC();
    v3[0] = MEMORY[0x24BEE17A8];
    v3[1] = v2;
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BEE1BD0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255591010);
  }
  return result;
}

unint64_t sub_21FF998AC()
{
  unint64_t result;

  result = qword_255591018;
  if (!qword_255591018)
  {
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_255591018);
  }
  return result;
}

uint64_t sub_21FF998E8()
{
  return sub_21FF364A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FF9577C);
}

void sub_21FF998F8()
{
  _s9ItemShelfVMa();
}

void sub_21FF9992C()
{
  OUTLINED_FUNCTION_31_4();
  sub_21FF96C58();
}

unint64_t sub_21FF9995C()
{
  unint64_t result;

  result = qword_255591028;
  if (!qword_255591028)
  {
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDEE7F0], MEMORY[0x24BDEE800]);
    atomic_store(result, (unint64_t *)&qword_255591028);
  }
  return result;
}

uint64_t sub_21FF99998()
{
  return sub_21FF364A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FF974D4);
}

uint64_t sub_21FF999A4()
{
  return sub_21FF364A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FF978CC);
}

void objectdestroyTm_7()
{
  _s9ItemShelfVMa();
}

uint64_t sub_21FF999E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  swift_bridgeObjectRelease();
  v4 = sub_21FFC5030();
  OUTLINED_FUNCTION_34(v4);
  sub_21FF0EAB8(*(_QWORD *)(v1 + ((v3 + 48) & ~v3) + *(int *)(a1 + 56)));
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(qword_255590610);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_21FFC4190();
    OUTLINED_FUNCTION_34(v5);
  }
  else
  {
    swift_release();
  }
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_27_1();
  OUTLINED_FUNCTION_25_5();
  sub_21FF0EAB8(*(_QWORD *)(((v3 + 48) & ~v3) + 0x18));
  OUTLINED_FUNCTION_25_5();
  sub_21FF0EAB8(*(_QWORD *)(((v3 + 48) & ~v3) + 0x18));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21FF99B08()
{
  _s9ItemShelfVMa();
}

void sub_21FF99B48()
{
  OUTLINED_FUNCTION_31_4();
  sub_21FF97B80();
}

uint64_t sub_21FF99B84()
{
  return sub_21FF364A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FF96DF0);
}

uint64_t sub_21FF99B90()
{
  return sub_21FF364A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FF96FF4);
}

uint64_t sub_21FF99B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FF99BE4(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 88))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 56);
      v4 = v3 >= 2;
      v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21FF99C30(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 88) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 88) = 0;
    if (a2)
      *(_BYTE *)(result + 56) = a2 + 1;
  }
  return result;
}

void _s9ItemShelfV9ConstantsVMa()
{
  JUMPOUT(0x2207DB418);
}

uint64_t sub_21FF99C94(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21FF99CC8()
{
  return swift_bridgeObjectRelease();
}

_QWORD *sub_21FF99CD0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

uint64_t sub_21FF99D24(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

void _s9ItemShelfV6LayoutVMa()
{
  JUMPOUT(0x2207DB418);
}

void sub_21FF99D74()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255590FE8);
  OUTLINED_FUNCTION_7_12();
  _s21AdditionalContentViewVMa();
}

void sub_21FF99DBC(uint64_t a1)
{
  sub_21FF997BC();
  OUTLINED_FUNCTION_7_12();
  sub_21FFC4130();
  OUTLINED_FUNCTION_21_4();
  sub_21FFC44CC();
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_1_23();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591008);
  OUTLINED_FUNCTION_7_12();
  _s12ItemShelfRowVMa();
}

void sub_21FF99E38()
{
  OUTLINED_FUNCTION_21_5();
  sub_21FF99840();
  OUTLINED_FUNCTION_7_12();
  sub_21FFC4DE4();
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF99E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;

  a20 = a1;
  a21 = MEMORY[0x24BDEBEE0];
  MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v21, &a20);
  OUTLINED_FUNCTION_63();
}

void sub_21FF99EBC()
{
  OUTLINED_FUNCTION_15_6();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558EFB8);
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF99EE8()
{
  uint64_t *v0;

  sub_21FF1034C(&qword_25558EFB0, v0);
  OUTLINED_FUNCTION_63();
}

void sub_21FF99F14()
{
  OUTLINED_FUNCTION_7_12();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF99F30()
{
  OUTLINED_FUNCTION_36_5();
  OUTLINED_FUNCTION_14_10();
  OUTLINED_FUNCTION_21_5();
  sub_21FFC46E8();
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF99F68()
{
  OUTLINED_FUNCTION_75();
}

void sub_21FF99F78()
{
  OUTLINED_FUNCTION_7_12();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF99F98()
{
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591020);
  OUTLINED_FUNCTION_12_6();
  sub_21FFC461C();
  OUTLINED_FUNCTION_12_6();
  OUTLINED_FUNCTION_1_23();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_49();
}

void sub_21FF99FF8()
{
  sub_21FFC4D54();
  sub_21FFC419C();
  sub_21FFC419C();
  sub_21FFC5AC8();
  OUTLINED_FUNCTION_49();
}

void sub_21FF9A054()
{
  OUTLINED_FUNCTION_20();
}

void sub_21FF9A06C()
{
  OUTLINED_FUNCTION_75();
}

void sub_21FF9A084()
{
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF9A0B8()
{
  JUMPOUT(0x2207DB4B4);
}

void sub_21FF9A0C8()
{
  JUMPOUT(0x2207DB4B4);
}

uint64_t sub_21FF9A0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_21FFC5CFC();
  if (v3)
  {
    v5 = a2 + 32;
    do
    {
      v5 += 8;
      result = sub_21FFC5CFC();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_21FF9A128()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_21FF9A150(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31();
}

_QWORD *sub_21FF9A188(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t sub_21FF9A1EC(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t sub_21FF9A230(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21FF9A270(uint64_t result, int a2, int a3)
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

void _s9ItemShelfV12ColumnLayoutVMa()
{
  JUMPOUT(0x2207DB418);
}

void sub_21FF9A2BC()
{
  JUMPOUT(0x2207DB4B4);
}

uint64_t OUTLINED_FUNCTION_0_24()
{
  return sub_21FFC5D14();
}

uint64_t OUTLINED_FUNCTION_1_23()
{
  return sub_21FFC419C();
}

uint64_t OUTLINED_FUNCTION_7_12()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_9_11()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_12_6()
{
  return sub_21FFC419C();
}

uint64_t OUTLINED_FUNCTION_13_10()
{
  return sub_21FFC419C();
}

uint64_t OUTLINED_FUNCTION_14_10()
{
  return sub_21FFC3FA4();
}

uint64_t OUTLINED_FUNCTION_15_6()
{
  return sub_21FFC4D30();
}

uint64_t OUTLINED_FUNCTION_20_5()
{
  return sub_21FFC419C();
}

uint64_t OUTLINED_FUNCTION_21_5()
{
  return sub_21FFC419C();
}

uint64_t OUTLINED_FUNCTION_25_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_34_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_35_3()
{
  sub_21FF750CC();
}

uint64_t OUTLINED_FUNCTION_36_5()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_39_3()
{
  return sub_21FFC4CB8();
}

uint64_t sub_21FF9A3D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)(a3 + *(int *)(sub_21FFC4CE8() + 28)) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
}

void sub_21FF9A424()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
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
  char v32;

  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_43_4(v7, v8);
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6_7(v10, v29);
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_7_13(v12, v30);
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_29_3();
  v16 = MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_52_3(v16, v17, v18, v19, v20, v21, v22, v23, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255590338);
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_204();
  sub_21FFC54A4();
  OUTLINED_FUNCTION_75_3();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_9_12();
  OUTLINED_FUNCTION_71_1();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_30_3();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_4_6();
  sub_21FFC5474();
  OUTLINED_FUNCTION_101_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    sub_21FF1C7A4(v1, &qword_255590338);
  }
  else
  {
    OUTLINED_FUNCTION_27_2();
    if ((v32 & 1) != 0)
    {
      OUTLINED_FUNCTION_69_3();
      OUTLINED_FUNCTION_68_1();
      OUTLINED_FUNCTION_34_5();
      OUTLINED_FUNCTION_19_7();
      OUTLINED_FUNCTION_32_1();
      OUTLINED_FUNCTION_67_1(v4, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    }
    else
    {
      v28 = OUTLINED_FUNCTION_26_2();
      MEMORY[0x2207D8868](v28);
      sub_21FFC36BC();
      OUTLINED_FUNCTION_25_6();
      OUTLINED_FUNCTION_24_3();
      OUTLINED_FUNCTION_12_7();
      sub_21FF50440(qword_255591270, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE2A0], MEMORY[0x24BDCE290]);
      OUTLINED_FUNCTION_21_6();
      OUTLINED_FUNCTION_74_2();
      OUTLINED_FUNCTION_44_4(v5);
      OUTLINED_FUNCTION_44_4(v4);
    }
  }
  OUTLINED_FUNCTION_24();
}

void sub_21FF9A614()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
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
  char v32;

  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_43_4(v7, v8);
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6_7(v10, v29);
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_7_13(v12, v30);
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_29_3();
  v16 = MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_52_3(v16, v17, v18, v19, v20, v21, v22, v23, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255590338);
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_204();
  sub_21FFC5444();
  OUTLINED_FUNCTION_75_3();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_9_12();
  OUTLINED_FUNCTION_71_1();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_30_3();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_4_6();
  sub_21FFC5420();
  OUTLINED_FUNCTION_101_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    sub_21FF1C7A4(v1, &qword_255590338);
  }
  else
  {
    OUTLINED_FUNCTION_27_2();
    if ((v32 & 1) != 0)
    {
      OUTLINED_FUNCTION_69_3();
      OUTLINED_FUNCTION_68_1();
      OUTLINED_FUNCTION_34_5();
      OUTLINED_FUNCTION_19_7();
      OUTLINED_FUNCTION_32_1();
      OUTLINED_FUNCTION_67_1(v4, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    }
    else
    {
      v28 = OUTLINED_FUNCTION_26_2();
      MEMORY[0x2207D8868](v28);
      sub_21FFC36BC();
      OUTLINED_FUNCTION_25_6();
      OUTLINED_FUNCTION_24_3();
      OUTLINED_FUNCTION_12_7();
      sub_21FF50440(qword_255591270, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE2A0], MEMORY[0x24BDCE290]);
      OUTLINED_FUNCTION_21_6();
      OUTLINED_FUNCTION_74_2();
      OUTLINED_FUNCTION_44_4(v5);
      OUTLINED_FUNCTION_44_4(v4);
    }
  }
  OUTLINED_FUNCTION_24();
}

void sub_21FF9A804()
{
  OUTLINED_FUNCTION_17_2();
  _s21AdditionalContentViewVMa();
}

void sub_21FF9A850(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v3 - 128) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v4);
  _s9ViewModelCMa(0, v1, v2, v5);
  OUTLINED_FUNCTION_20();
}

void sub_21FF9A8A4()
{
  int *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _OWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)(v2 + 56) = sub_21FFC4268();
  *(_QWORD *)(v2 + 64) = v7;
  *(_QWORD *)(v2 + 72) = swift_getKeyPath();
  *(_BYTE *)(v2 + 112) = 0;
  v8 = v2 + v0[18];
  *(_BYTE *)v8 = sub_21FF0725C() & 1;
  *(_QWORD *)(v8 + 8) = v9;
  v10 = (uint64_t *)(v2 + v0[19]);
  *v10 = sub_21FF9A9F0();
  v10[1] = v11;
  v12 = (_OWORD *)(v2 + v0[22]);
  *v12 = xmmword_21FFCAAB0;
  v12[1] = xmmword_21FFCAAC0;
  v13 = *(_QWORD *)(v6 - 152);
  *(_QWORD *)v2 = *(_QWORD *)(v6 - 160);
  *(_QWORD *)(v2 + 8) = v13;
  v14 = v2 + v0[17];
  v15 = sub_21FFC5030();
  sub_21FF9A3D4(*(_QWORD *)(v6 - 144), v15, v14);
  *(_BYTE *)(v2 + 16) = v4;
  *(_QWORD *)(v2 + 24) = v5;
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v1;
  *(_BYTE *)(v2 + 48) = *(_DWORD *)(v6 - 132);
  v16 = swift_allocObject();
  *(_BYTE *)(v16 + 16) = v4;
  *(_QWORD *)(v16 + 24) = v5;
  *(_QWORD *)(v16 + 32) = v3;
  *(_QWORD *)(v16 + 40) = v1;
  *(_QWORD *)(v2 + v0[20]) = v16 | 0x4000000000000000;
  v17 = v2 + v0[21];
  *(_BYTE *)v17 = 1;
  *(_QWORD *)(v17 + 8) = 0;
  *(_QWORD *)(v17 + 16) = 0;
  *(_QWORD *)(v17 + 24) = v16 | 0x4000000000000000;
  (*(void (**)(_QWORD, uint64_t, int *))(*(_QWORD *)(v6 - 128) + 32))(*(_QWORD *)(v6 - 120), v2, v0);
  swift_bridgeObjectRetain();
  sub_21FF0E594(v1);
  swift_retain();
  OUTLINED_FUNCTION_24();
}

void _s21AdditionalContentViewVMa()
{
  JUMPOUT(0x2207DB418);
}

uint64_t sub_21FF9A9F0()
{
  uint64_t v1;

  sub_21FFC4CB8();
  return v1;
}

uint64_t sub_21FF9AA24()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_21FF9AA50()
{
  uint64_t result;
  unint64_t v1;

  sub_21FFC5030();
  result = sub_21FFC4CE8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_21FF9AB24(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _OWORD *v37;
  _OWORD *v38;
  __int128 v39;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v15 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v8 = a2[4];
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v8;
    v9 = a2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21FF0E594(v9);
    *(_QWORD *)(a1 + 40) = v9;
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    v10 = a2[8];
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_QWORD *)(a1 + 64) = v10;
    v11 = a2 + 9;
    LOBYTE(v9) = *((_BYTE *)a2 + 112);
    swift_retain();
    if ((v9 & 1) != 0)
    {
      v12 = (_OWORD *)(a1 + 72);
      v13 = a2[12];
      if (v13)
      {
        v14 = a2[13];
        *(_QWORD *)(a1 + 96) = v13;
        *(_QWORD *)(a1 + 104) = v14;
        (**(void (***)(_OWORD *, uint64_t))(v13 - 8))(v12, (uint64_t)(a2 + 9));
      }
      else
      {
        v16 = *(_OWORD *)(a2 + 11);
        *v12 = *v11;
        *(_OWORD *)(a1 + 88) = v16;
        *(_QWORD *)(a1 + 104) = a2[13];
      }
      *(_BYTE *)(a1 + 112) = 1;
    }
    else
    {
      *(_QWORD *)(a1 + 72) = *(_QWORD *)v11;
      *(_BYTE *)(a1 + 112) = 0;
      swift_retain();
    }
    v17 = a3[17];
    v18 = a1 + v17;
    v19 = (uint64_t)a2 + v17;
    v20 = sub_21FFC5030();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    v21 = sub_21FFC4CE8();
    *(_QWORD *)(v18 + *(int *)(v21 + 28)) = *(_QWORD *)(v19 + *(int *)(v21 + 28));
    v22 = a3[18];
    v23 = a3[19];
    v24 = a1 + v22;
    v25 = (uint64_t)a2 + v22;
    *(_BYTE *)v24 = *(_BYTE *)v25;
    *(_QWORD *)(v24 + 8) = *(_QWORD *)(v25 + 8);
    v26 = (_QWORD *)(a1 + v23);
    v27 = (uint64_t *)((char *)a2 + v23);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    v29 = a3[20];
    v30 = *(uint64_t *)((char *)a2 + v29);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_21FF0E594(v30);
    *(_QWORD *)(a1 + v29) = v30;
    v31 = a3[21];
    v32 = a1 + v31;
    v33 = (uint64_t)a2 + v31;
    *(_BYTE *)v32 = *(_BYTE *)v33;
    v34 = *(_QWORD *)(v33 + 16);
    *(_QWORD *)(v32 + 8) = *(_QWORD *)(v33 + 8);
    *(_QWORD *)(v32 + 16) = v34;
    v35 = *(_QWORD *)(v33 + 24);
    swift_bridgeObjectRetain();
    sub_21FF0E594(v35);
    *(_QWORD *)(v32 + 24) = v35;
    v36 = a3[22];
    v37 = (_OWORD *)(a1 + v36);
    v38 = (_OWORD *)((char *)a2 + v36);
    v39 = v38[1];
    *v37 = *v38;
    v37[1] = v39;
  }
  return a1;
}

unint64_t sub_21FF9AD24(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(a1 + 40));
  swift_release();
  if ((*(_BYTE *)(a1 + 112) & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 96))
      __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  }
  else
  {
    swift_release();
  }
  v4 = a1 + a2[17];
  v5 = sub_21FFC5030();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  sub_21FFC4CE8();
  swift_release();
  swift_release();
  swift_release();
  sub_21FF0EAB8(*(_QWORD *)(a1 + a2[20]));
  v6 = a1 + a2[21];
  swift_bridgeObjectRelease();
  return sub_21FF0EAB8(*(_QWORD *)(v6 + 24));
}

uint64_t sub_21FF9AE1C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _OWORD *v35;
  _OWORD *v36;
  __int128 v37;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21FF0E594(v8);
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v9 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v9;
  v10 = (_OWORD *)(a2 + 72);
  LOBYTE(v8) = *(_BYTE *)(a2 + 112);
  swift_retain();
  if ((v8 & 1) != 0)
  {
    v11 = (_OWORD *)(a1 + 72);
    v12 = *(_QWORD *)(a2 + 96);
    if (v12)
    {
      v13 = *(_QWORD *)(a2 + 104);
      *(_QWORD *)(a1 + 96) = v12;
      *(_QWORD *)(a1 + 104) = v13;
      (**(void (***)(_OWORD *, uint64_t))(v12 - 8))(v11, a2 + 72);
    }
    else
    {
      v14 = *(_OWORD *)(a2 + 88);
      *v11 = *v10;
      *(_OWORD *)(a1 + 88) = v14;
      *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    }
    *(_BYTE *)(a1 + 112) = 1;
  }
  else
  {
    *(_QWORD *)(a1 + 72) = *(_QWORD *)v10;
    *(_BYTE *)(a1 + 112) = 0;
    swift_retain();
  }
  v15 = a3[17];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = sub_21FFC5030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  v19 = sub_21FFC4CE8();
  *(_QWORD *)(v16 + *(int *)(v19 + 28)) = *(_QWORD *)(v17 + *(int *)(v19 + 28));
  v20 = a3[18];
  v21 = a3[19];
  v22 = a1 + v20;
  v23 = a2 + v20;
  *(_BYTE *)v22 = *(_BYTE *)v23;
  *(_QWORD *)(v22 + 8) = *(_QWORD *)(v23 + 8);
  v24 = (_QWORD *)(a1 + v21);
  v25 = (_QWORD *)(a2 + v21);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  v27 = a3[20];
  v28 = *(_QWORD *)(a2 + v27);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21FF0E594(v28);
  *(_QWORD *)(a1 + v27) = v28;
  v29 = a3[21];
  v30 = a1 + v29;
  v31 = a2 + v29;
  *(_BYTE *)v30 = *(_BYTE *)v31;
  v32 = *(_QWORD *)(v31 + 16);
  *(_QWORD *)(v30 + 8) = *(_QWORD *)(v31 + 8);
  *(_QWORD *)(v30 + 16) = v32;
  v33 = *(_QWORD *)(v31 + 24);
  swift_bridgeObjectRetain();
  sub_21FF0E594(v33);
  *(_QWORD *)(v30 + 24) = v33;
  v34 = a3[22];
  v35 = (_OWORD *)(a1 + v34);
  v36 = (_OWORD *)(a2 + v34);
  v37 = v36[1];
  *v35 = *v36;
  v35[1] = v37;
  return a1;
}

uint64_t sub_21FF9AFF0(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6;
  unint64_t v7;
  __int128 *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
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
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  sub_21FF0E594(v6);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v6;
  sub_21FF0EAB8(v7);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  if (a1 != a2)
  {
    v8 = (__int128 *)(a2 + 72);
    sub_21FF1C7A4(a1 + 72, qword_25558DFD0);
    if ((*(_BYTE *)(a2 + 112) & 1) != 0)
    {
      v9 = *(_QWORD *)(a2 + 96);
      if (v9)
      {
        *(_QWORD *)(a1 + 96) = v9;
        *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
        (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 72, a2 + 72);
      }
      else
      {
        v10 = *v8;
        v11 = *(_OWORD *)(a2 + 88);
        *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
        *(_OWORD *)(a1 + 72) = v10;
        *(_OWORD *)(a1 + 88) = v11;
      }
      *(_BYTE *)(a1 + 112) = 1;
    }
    else
    {
      *(_QWORD *)(a1 + 72) = *(_QWORD *)v8;
      *(_BYTE *)(a1 + 112) = 0;
      swift_retain();
    }
  }
  v12 = a3[17];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_21FFC5030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = sub_21FFC4CE8();
  *(_QWORD *)(v13 + *(int *)(v16 + 28)) = *(_QWORD *)(v14 + *(int *)(v16 + 28));
  swift_retain();
  swift_release();
  v17 = a3[18];
  v18 = a1 + v17;
  v19 = a2 + v17;
  *(_BYTE *)v18 = *(_BYTE *)v19;
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  swift_retain();
  swift_release();
  v20 = a3[19];
  v21 = (_QWORD *)(a1 + v20);
  v22 = (_QWORD *)(a2 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_retain();
  swift_release();
  v23 = a3[20];
  v24 = *(_QWORD *)(a2 + v23);
  sub_21FF0E594(v24);
  v25 = *(_QWORD *)(a1 + v23);
  *(_QWORD *)(a1 + v23) = v24;
  sub_21FF0EAB8(v25);
  v26 = a3[21];
  v27 = a1 + v26;
  v28 = a2 + v26;
  *(_BYTE *)v27 = *(_BYTE *)(a2 + v26);
  *(_QWORD *)(v27 + 8) = *(_QWORD *)(a2 + v26 + 8);
  *(_QWORD *)(v27 + 16) = *(_QWORD *)(a2 + v26 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = *(_QWORD *)(v28 + 24);
  sub_21FF0E594(v29);
  v30 = *(_QWORD *)(v27 + 24);
  *(_QWORD *)(v27 + 24) = v29;
  sub_21FF0EAB8(v30);
  v31 = a3[22];
  v32 = (_QWORD *)(a1 + v31);
  v33 = (_QWORD *)(a2 + v31);
  *v32 = *v33;
  v32[1] = v33[1];
  v32[2] = v33[2];
  v32[3] = v33[3];
  return a1;
}

uint64_t sub_21FF9B280(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  __int128 v20;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  v7 = a3[17];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_21FFC5030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = sub_21FFC4CE8();
  *(_QWORD *)(v8 + *(int *)(v11 + 28)) = *(_QWORD *)(v9 + *(int *)(v11 + 28));
  v12 = a3[19];
  *(_OWORD *)(a1 + a3[18]) = *(_OWORD *)(a2 + a3[18]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  v13 = a3[21];
  *(_QWORD *)(a1 + a3[20]) = *(_QWORD *)(a2 + a3[20]);
  v14 = (_OWORD *)(a1 + v13);
  v15 = (_OWORD *)(a2 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = a3[22];
  v18 = (_OWORD *)(a1 + v17);
  v19 = (_OWORD *)(a2 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  return a1;
}

uint64_t sub_21FF9B388(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _OWORD *v30;
  _OWORD *v31;
  __int128 v32;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  sub_21FF0EAB8(v8);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  if (a1 != a2)
  {
    sub_21FF1C7A4(a1 + 72, qword_25558DFD0);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a1 + 97) = *(_OWORD *)(a2 + 97);
  }
  v9 = a3[17];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_21FFC5030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = sub_21FFC4CE8();
  *(_QWORD *)(v10 + *(int *)(v13 + 28)) = *(_QWORD *)(v11 + *(int *)(v13 + 28));
  swift_release();
  v14 = a3[18];
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_BYTE *)v15 = *(_BYTE *)v16;
  *(_QWORD *)(v15 + 8) = *(_QWORD *)(v16 + 8);
  swift_release();
  v17 = a3[19];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_release();
  v22 = a3[20];
  v23 = *(_QWORD *)(a1 + v22);
  *(_QWORD *)(a1 + v22) = *(_QWORD *)(a2 + v22);
  sub_21FF0EAB8(v23);
  v24 = a3[21];
  v25 = a1 + v24;
  v26 = a2 + v24;
  *(_BYTE *)v25 = *(_BYTE *)(a2 + v24);
  v27 = *(_QWORD *)(a2 + v24 + 16);
  *(_QWORD *)(v25 + 8) = *(_QWORD *)(a2 + v24 + 8);
  *(_QWORD *)(v25 + 16) = v27;
  swift_bridgeObjectRelease();
  v28 = *(_QWORD *)(v25 + 24);
  *(_QWORD *)(v25 + 24) = *(_QWORD *)(v26 + 24);
  sub_21FF0EAB8(v28);
  v29 = a3[22];
  v30 = (_OWORD *)(a1 + v29);
  v31 = (_OWORD *)(a2 + v29);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  return a1;
}

uint64_t sub_21FF9B540()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FF9B54C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    OUTLINED_FUNCTION_58_2();
    v8 = OUTLINED_FUNCTION_77_2();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 68), a2, v8);
  }
}

uint64_t sub_21FF9B5C8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FF9B5D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    OUTLINED_FUNCTION_58_2();
    v7 = OUTLINED_FUNCTION_77_2();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 68), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21FF9B648()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21FF9B67C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[22];
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_17_2();
  v1 = v0;
  v12 = v2;
  v9 = *(_QWORD *)(v0 - 8);
  v11 = *(_QWORD *)(v9 + 64);
  v3 = MEMORY[0x24BDAC7A8](v0);
  v10 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v3 + 16);
  v6 = *(_QWORD *)(v3 + 32);
  sub_21FFC5030();
  OUTLINED_FUNCTION_26_0();
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  v8[19] = v1;
  v13 = *(_QWORD *)(v1 + 24);
  v7 = *(_QWORD *)(v1 + 40);
  v14 = v5;
  v15 = v13;
  v8[20] = v5;
  v16 = v6;
  v17 = v7;
  v8[21] = v6;
  _s13ItemShelfCellVMa();
}

void sub_21FF9B770()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_57_4();
  OUTLINED_FUNCTION_57_4();
  OUTLINED_FUNCTION_98();
  *(_QWORD *)(v1 - 96) = *(_QWORD *)(*(_QWORD *)(v0 + 32) + 8);
  OUTLINED_FUNCTION_20();
}

void sub_21FF9B7B8()
{
  sub_21FFC4448();
  OUTLINED_FUNCTION_104();
  sub_21FFC419C();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_20();
}

void sub_21FF9B7F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedConformanceWitness;

  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v4 - 168) = v1;
  *(_QWORD *)(v4 - 160) = v2;
  *(_QWORD *)(v4 - 152) = v3;
  *(_QWORD *)(v4 - 144) = a1;
  *(_QWORD *)(v4 - 136) = AssociatedConformanceWitness;
  sub_21FFC4DE4();
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF9B83C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  OUTLINED_FUNCTION_20();
}

void sub_21FF9B850()
{
  sub_21FFC3F98();
  OUTLINED_FUNCTION_20();
}

void sub_21FF9B870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v9 - 296) = *(_QWORD *)(sub_21FFC3FA4() - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v10);
  *(_QWORD *)(v9 - 352) = (char *)&a9 - v11;
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF9B8C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  uint64_t v5;

  v4 = sub_21FF2E0A8();
  v5 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 - 168) = v1;
  *(_QWORD *)(v2 - 160) = v5;
  *(_QWORD *)(v2 - 152) = a1;
  *(_QWORD *)(v2 - 144) = v4;
  OUTLINED_FUNCTION_39_4();
}

void sub_21FF9B8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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

  *(_QWORD *)(v13 - 320) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v13 - 360) = a1;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v14);
  v15 = *(_QWORD *)(v13 - 208);
  *(_QWORD *)(v13 - 224) = v10;
  _s18NavigationBarStyleVMa(255, v15, v10, v16);
  *(_QWORD *)(v13 - 288) = *(_QWORD *)(sub_21FFC419C() - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v17);
  *(_QWORD *)(v13 - 376) = (char *)&a9 - v18;
  *(_QWORD *)(v13 - 384) = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E0B0);
  _s10DoneButtonVMa(255, v15, v10, v19);
  *(_QWORD *)(v13 - 168) = v11;
  *(_QWORD *)(v13 - 160) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v13 - 152) = v12;
  *(_QWORD *)(v13 - 144) = v9;
  *(_QWORD *)(v13 - 416) = OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_49();
}

void sub_21FF9B9E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 120) = v1;
  *(_QWORD *)(v3 - 112) = a1;
  *(_QWORD *)(v3 - 392) = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v2, v3 - 120);
  *(_QWORD *)(v3 - 400) = sub_21FF9E38C();
  OUTLINED_FUNCTION_64();
}

void sub_21FF9BA28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 - 408) = a1;
  *(_QWORD *)(v6 - 168) = v5;
  *(_QWORD *)(v6 - 160) = v3;
  *(_QWORD *)(v6 - 152) = v4;
  *(_QWORD *)(v6 - 144) = v1;
  *(_QWORD *)(v6 - 136) = v2;
  *(_QWORD *)(v6 - 128) = a1;
  OUTLINED_FUNCTION_39_4();
}

void sub_21FF9BA4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v9 - 312) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v9 - 344) = a1;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v10);
  *(_QWORD *)(v9 - 424) = (char *)&a9 - v11;
  v12 = sub_21FFC419C();
  *(_QWORD *)(v9 - 328) = v12;
  *(_QWORD *)(v9 - 304) = *(_QWORD *)(v12 - 8);
  OUTLINED_FUNCTION_5_5();
  v14 = MEMORY[0x24BDAC7A8](v13);
  *(_QWORD *)(v9 - 368) = (char *)&a9 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  *(_QWORD *)(v9 - 336) = (char *)&a9 - v16;
  sub_21FF9BDB4();
}

void sub_21FF9BB1C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v3 = v1[1];
  *(_QWORD *)(v2 - 168) = *v1;
  *(_QWORD *)(v2 - 160) = v3;
  sub_21FFC4A18();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_101_0(v0, v4);
  sub_21FF9F64C(*(_QWORD *)(v2 - 208), *(_QWORD *)(v2 - 360), *(_QWORD *)(v2 - 208), *(_QWORD *)(v2 - 416), *(_QWORD *)(v2 - 224));
}

void sub_21FF9BB94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  unint64_t v29;

  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_101_0(v2, v7);
  *(_QWORD *)(v6 - 168) = sub_21FFC4E50();
  *(_QWORD *)(v6 - 160) = v8;
  *(_QWORD *)(v6 - 184) = sub_21FF5AAC4(v1, v0, v9, v10);
  *(_QWORD *)(v6 - 176) = v11;
  v12 = swift_checkMetadataState();
  *(_QWORD *)(v6 - 432) = v5;
  v13 = *(_QWORD *)(v6 - 384);
  v14 = *(_QWORD *)(v6 - 392);
  v15 = *(_QWORD *)(v6 - 400);
  v16 = *(_QWORD *)(v6 - 408);
  sub_21FFC4A54();
  swift_release();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_247(v3, v17);
  v18 = *(_QWORD *)(v6 - 256);
  v19 = *(_QWORD *)(v6 - 248);
  v20 = v4;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 16))(v19, *(_QWORD *)(v6 - 216), v4);
  v21 = v18;
  v22 = (*(unsigned __int8 *)(v18 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v23 = (char *)swift_allocObject();
  v24 = *(_QWORD *)(v6 - 208);
  *((_QWORD *)v23 + 2) = *(_QWORD *)(v6 - 272);
  *((_QWORD *)v23 + 3) = v24;
  v25 = *(_QWORD *)(v6 - 224);
  *((_QWORD *)v23 + 4) = *(_QWORD *)(v6 - 264);
  *((_QWORD *)v23 + 5) = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 32))(&v23[v22], v19, v20);
  *(_QWORD *)(v6 - 168) = *(_QWORD *)(v6 - 432);
  *(_QWORD *)(v6 - 160) = v13;
  *(_QWORD *)(v6 - 152) = v12;
  *(_QWORD *)(v6 - 144) = v14;
  *(_QWORD *)(v6 - 136) = v15;
  *(_QWORD *)(v6 - 128) = v16;
  v26 = OUTLINED_FUNCTION_58_0();
  v27 = *(_QWORD *)(v6 - 424);
  sub_21FF65C6C((uint64_t)sub_21FF9E3D4, (uint64_t)v23, *(_QWORD *)(v6 - 344), v26);
  swift_release();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_247(v27, v28);
  v29 = sub_21FF0F948();
  *(_QWORD *)(v6 - 200) = v26;
  *(_QWORD *)(v6 - 192) = v29;
  OUTLINED_FUNCTION_75();
}

void sub_21FF9BD50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(v2 - 336);
  sub_21FFB5D18(v1, v0, v3);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 304) + 8);
  v4(v1, v0);
  sub_21FFB57EC(v3, v0, *(_QWORD *)(v2 - 232));
  v4(v3, v0);
  OUTLINED_FUNCTION_24();
}

void sub_21FF9BDB4()
{
  sub_21FFC4724();
  sub_21FFC5030();
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FF9BE5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedConformanceWitness;

  sub_21FFC419C();
  sub_21FFC419C();
  sub_21FFC419C();
  *(_QWORD *)(v3 - 88) = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 8);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAE0], v0, v3 - 88);
  sub_21FFC4448();
  sub_21FFC419C();
  swift_getTupleTypeMetadata2();
  v8 = v0;
  v9 = v1;
  v10 = sub_21FFC4EBC();
  v11 = MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAF8], v0);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v4 = sub_21FFC4DE4();
  v7 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v10);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v4, &v7);
  v5 = sub_21FFC3F98();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEB188], v5);
  return sub_21FFC3FB0();
}

uint64_t sub_21FF9BFE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t *, uint64_t, uint64_t);
  unint64_t v21;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  v25 = a2;
  v9 = type metadata accessor for MusicPicker.Click.ControlID();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FFB5E88((uint64_t)v30);
  v12 = v31;
  if (v31)
  {
    v23 = a1 + 72;
    v13 = v32;
    __swift_project_boxed_opaque_existential_1(v30, v31);
    swift_storeEnumTagMultiPayload();
    v14 = *(_BYTE *)(a1 + 16);
    v15 = *(_QWORD *)(a1 + 24);
    v16 = *(_QWORD *)(a1 + 32);
    v24 = a5;
    v17 = *(_QWORD *)(a1 + 40);
    LOBYTE(v26) = v14;
    v27 = v15;
    v28 = v16;
    v29 = v17;
    v18 = a3;
    v19 = a4;
    v20 = *(void (**)(char *, uint64_t *, uint64_t, uint64_t))(v13 + 16);
    swift_bridgeObjectRetain();
    sub_21FF0E594(v17);
    v20(v11, &v26, v12, v13);
    a4 = v19;
    a3 = v18;
    swift_bridgeObjectRelease();
    v21 = v17;
    a5 = v24;
    sub_21FF0EAB8(v21);
    sub_21FF9E438((uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  }
  else
  {
    sub_21FF1C7A4((uint64_t)v30, &qword_25558E0E0);
  }
  sub_21FFB5E88((uint64_t)v30);
  if (v31)
  {
    __swift_project_boxed_opaque_existential_1(v30, v31);
    v26 = v25;
    v27 = a3;
    v28 = a4;
    v29 = a5;
    _s21AdditionalContentViewVMa();
  }
  return sub_21FF1C7A4((uint64_t)v30, &qword_25558E0E0);
}

void sub_21FF9C1C8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[22];

  v12[3] = a1;
  v12[5] = a6;
  v10 = sub_21FFC4580();
  MEMORY[0x24BDAC7A8](v10);
  v12[4] = (char *)v12 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FFC5030();
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  v12[15] = a2;
  v12[16] = a3;
  v12[17] = a4;
  v12[18] = a5;
  _s13ItemShelfCellVMa();
}

void sub_21FF9C298()
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
  uint64_t AssociatedConformanceWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_21FFC419C();
  sub_21FFC419C();
  sub_21FFC419C();
  *(_QWORD *)(v6 - 96) = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 8);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAE0], v5, v6 - 96);
  sub_21FFC4448();
  sub_21FFC419C();
  swift_getTupleTypeMetadata2();
  v7 = sub_21FFC4EBC();
  v8 = MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAF8], v5);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v6 - 136) = v5;
  *(_QWORD *)(v6 - 128) = v0;
  *(_QWORD *)(v6 - 120) = v7;
  *(_QWORD *)(v6 - 112) = v8;
  *(_QWORD *)(v6 - 104) = AssociatedConformanceWitness;
  v10 = sub_21FFC4DE4();
  *(_QWORD *)(v6 - 144) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v7);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v10, v6 - 144);
  v11 = sub_21FFC3F98();
  *(_QWORD *)(v6 - 240) = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  MEMORY[0x24BDAC7A8](v12);
  *(_QWORD *)(v6 - 248) = sub_21FFC4484();
  *(_QWORD *)(v6 - 136) = v1;
  *(_QWORD *)(v6 - 128) = v3;
  *(_QWORD *)(v6 - 120) = v4;
  *(_QWORD *)(v6 - 112) = v2;
  _s21AdditionalContentViewVMa();
}

uint64_t sub_21FF9C43C()
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
  void (*v9)(uint64_t, uint64_t);

  v8 = *(_QWORD *)(v7 - 232);
  *(_QWORD *)(v7 - 192) = v1;
  *(_QWORD *)(v7 - 184) = v3;
  *(_QWORD *)(v7 - 176) = v4;
  *(_QWORD *)(v7 - 168) = v2;
  *(_QWORD *)(v7 - 160) = v8;
  sub_21FF38FB0();
  sub_21FFC3F8C();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEB188], v0);
  sub_21FFB5D18(v6, v0, v5);
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 240) + 8);
  v9(v6, v0);
  sub_21FFB57EC(v5, v0, *(_QWORD *)(v7 - 216));
  return ((uint64_t (*)(uint64_t, uint64_t))v9)(v5, v0);
}

void sub_21FF9C514()
{
  _s21AdditionalContentViewVMa();
}

void sub_21FF9C564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v13 - 176) = a1;
  *(_QWORD *)(v13 - 160) = *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64);
  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v13 - 168) = (char *)&a9 - v14;
  v15 = sub_21FFC5030();
  MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v13 - 200) = (char *)&a9 - v16;
  *(_QWORD *)(v13 - 224) = *(_QWORD *)(v12 + 40);
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  *(_QWORD *)(v13 - 136) = v9;
  *(_QWORD *)(v13 - 128) = v11;
  *(_QWORD *)(v13 - 256) = v9;
  *(_QWORD *)(v13 - 120) = v12;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 208) = v12;
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FF9C630()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedConformanceWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, uint64_t);
  _BYTE v27[80];

  sub_21FFC419C();
  sub_21FFC419C();
  sub_21FFC419C();
  *(_QWORD *)(v5 - 96) = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 8);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAE0], v3, v5 - 96);
  sub_21FFC4448();
  sub_21FFC419C();
  swift_getTupleTypeMetadata2();
  v6 = sub_21FFC4EBC();
  *(_QWORD *)(v5 - 248) = v6;
  v7 = MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAF8], v3);
  *(_QWORD *)(v5 - 240) = v7;
  *(_QWORD *)(v5 - 232) = v0;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v5 - 136) = v3;
  *(_QWORD *)(v5 - 128) = v0;
  *(_QWORD *)(v5 - 120) = v6;
  *(_QWORD *)(v5 - 112) = v7;
  *(_QWORD *)(v5 - 104) = AssociatedConformanceWitness;
  v9 = sub_21FFC4DE4();
  *(_QWORD *)(v5 - 216) = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = &v27[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v14 = &v27[-v13];
  v15 = *(_QWORD *)(v5 - 176);
  sub_21FFC4CE8();
  sub_21FFC4CC4();
  v16 = v2;
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v18 = *(_QWORD *)(v5 - 168);
  v19 = v15;
  v17(v18, v1, v15);
  v20 = (*(unsigned __int8 *)(v16 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v21 = (char *)swift_allocObject();
  v22 = *(_QWORD *)(v5 - 192);
  *((_QWORD *)v21 + 2) = *(_QWORD *)(v5 - 256);
  *((_QWORD *)v21 + 3) = v22;
  v23 = *(_QWORD *)(v5 - 184);
  *((_QWORD *)v21 + 4) = *(_QWORD *)(v5 - 208);
  *((_QWORD *)v21 + 5) = v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(&v21[v20], v18, v19);
  v24 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], *(_QWORD *)(v5 - 248));
  sub_21FFC4DD8();
  *(_QWORD *)(v5 - 144) = v24;
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v9, v5 - 144);
  sub_21FFB5D18((uint64_t)v12, v9, (uint64_t)v14);
  v25 = *(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v5 - 216) + 8);
  v25(v12, v9);
  sub_21FFB57EC((uint64_t)v14, v9, *(_QWORD *)(v5 - 152));
  return ((uint64_t (*)(_BYTE *, uint64_t))v25)(v14, v9);
}

void sub_21FF9C8EC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[58];

  v13[39] = a2;
  v13[37] = a1;
  v13[32] = a7;
  v11 = sub_21FFC5030();
  v13[31] = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13[30] = (char *)v13 - v12;
  v13[53] = a3;
  v13[54] = a4;
  v13[3] = a3;
  v13[34] = a4;
  v13[55] = a5;
  v13[56] = a6;
  v13[35] = a6;
  _s21AdditionalContentViewVMa();
}

void sub_21FF9C9B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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

  v14 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v13 - 416) = v14;
  *(_QWORD *)(v13 - 376) = *(_QWORD *)(v14 + 64);
  v15 = MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v13 - 432) = (char *)&a9 - v16;
  v17 = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v13 - 272) = v17;
  *(_QWORD *)(v13 - 392) = *(_QWORD *)(v17 + 64);
  MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v13 - 544) = (char *)&a9 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v13 - 152) = v12;
  *(_QWORD *)(v13 - 144) = v10;
  *(_QWORD *)(v13 - 136) = v11;
  *(_QWORD *)(v13 - 128) = v9;
  *(_QWORD *)(v13 - 312) = v11;
  _s13ItemShelfCellVMa();
}

void sub_21FF9CA5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  void (*v50)(_QWORD, uint64_t, _QWORD);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;

  v13 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v12 - 520) = a1;
  *(_QWORD *)(v12 - 496) = v13;
  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v12 - 528) = (char *)&a9 - v14;
  v15 = sub_21FFC419C();
  *(_QWORD *)(v12 - 488) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v12 - 512) = v15;
  MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v12 - 536) = (char *)&a9 - v16;
  v17 = sub_21FFC419C();
  *(_QWORD *)(v12 - 400) = *(_QWORD *)(v17 - 8);
  *(_QWORD *)(v12 - 456) = v17;
  MEMORY[0x24BDAC7A8](v17);
  *(_QWORD *)(v12 - 288) = (char *)&a9 - v18;
  v19 = sub_21FFC419C();
  v20 = *(_QWORD *)(v19 - 8);
  *(_QWORD *)(v12 - 440) = v19;
  *(_QWORD *)(v12 - 344) = v20;
  MEMORY[0x24BDAC7A8](v19);
  *(_QWORD *)(v12 - 480) = (char *)&a9 - v21;
  *(_QWORD *)(v12 - 160) = *(_QWORD *)(*(_QWORD *)(v10 + 32) + 8);
  v22 = MEMORY[0x24BDDEAE0];
  *(_QWORD *)(v12 - 472) = v9;
  *(_QWORD *)(v12 - 408) = MEMORY[0x2207DB4B4](v22, v9, v12 - 160);
  *(_QWORD *)(v12 - 368) = sub_21FFC4448();
  v23 = sub_21FFC419C();
  *(_QWORD *)(v12 - 360) = v23;
  *(_QWORD *)(v12 - 352) = *(_QWORD *)(v23 - 8);
  v24 = MEMORY[0x24BDAC7A8](v23);
  *(_QWORD *)(v12 - 464) = (char *)&a9 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  *(_QWORD *)(v12 - 384) = (char *)&a9 - v26;
  v27 = sub_21FFC4DC0();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&a9 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E188);
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&a9 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558ECE8);
  *(_QWORD *)(v12 - 424) = v34;
  v35 = MEMORY[0x24BDAC7A8](v34);
  *(_QWORD *)(v12 - 448) = (char *)&a9 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&a9 - v37;
  sub_21FFC4DB4();
  v39 = sub_21FFC4760();
  v40 = *(_QWORD *)(v12 - 264);
  sub_21FFC3F80();
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v33, v30, v27);
  v49 = &v33[*(int *)(v31 + 36)];
  *v49 = v39;
  *((_QWORD *)v49 + 1) = v42;
  *((_QWORD *)v49 + 2) = v44;
  *((_QWORD *)v49 + 3) = v46;
  *((_QWORD *)v49 + 4) = v48;
  v49[40] = 0;
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  *(_QWORD *)(v12 - 504) = v38;
  sub_21FF9E5C8((uint64_t)v33, (uint64_t)v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v38, 0, 1, v31);
  v50 = *(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v12 - 272) + 16);
  *(_QWORD *)(v12 - 560) = v50;
  v51 = *(_QWORD *)(v12 - 280);
  v50(*(_QWORD *)(v12 - 544), v51, *(_QWORD *)(v12 - 552));
  *(_QWORD *)(v12 - 568) = v11;
  v52 = v40 + *(int *)(v11 + 84);
  v54 = *(_QWORD *)(v52 + 8);
  v53 = *(_QWORD *)(v52 + 16);
  v55 = *(_QWORD *)(v52 + 24);
  *(_BYTE *)(v12 - 152) = *(_BYTE *)v52;
  *(_QWORD *)(v12 - 144) = v54;
  *(_QWORD *)(v12 - 136) = v53;
  *(_QWORD *)(v12 - 128) = v55;
  swift_bridgeObjectRetain();
  sub_21FF0E594(v55);
  sub_21FF9D314(v51, v11);
  sub_21FF436E4();
  sub_21FF91140();
}

uint64_t sub_21FF9CECC()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
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
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;

  sub_21FFC4760();
  v4 = *(_QWORD *)(v3 - 520);
  v5 = MEMORY[0x2207DB4B4](&unk_21FFCA590, v4);
  v6 = *(_QWORD *)(v3 - 536);
  sub_21FFC4B50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 496) + 8))(v2, v4);
  sub_21FFC476C();
  v7 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v3 - 176) = v5;
  *(_QWORD *)(v3 - 168) = v7;
  v8 = *(_QWORD *)(v3 - 512);
  v9 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v8, v3 - 176);
  sub_21FFC4B50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 488) + 8))(v6, v8);
  v10 = *(_QWORD *)(v3 - 416);
  v11 = *(_QWORD *)(v3 - 432);
  v12 = *(_QWORD *)(v3 - 568);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 16))(v11, *(_QWORD *)(v3 - 264), v12);
  v13 = v0;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 - 560))(v0, *(_QWORD *)(v3 - 280), v1);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = *(_QWORD *)(v3 - 272);
  v16 = (*(_QWORD *)(v3 - 376) + *(unsigned __int8 *)(v15 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v17 = (char *)swift_allocObject();
  v18 = *(_QWORD *)(v3 - 304);
  *((_QWORD *)v17 + 2) = v1;
  *((_QWORD *)v17 + 3) = v18;
  v19 = *(_QWORD *)(v3 - 296);
  *((_QWORD *)v17 + 4) = *(_QWORD *)(v3 - 312);
  *((_QWORD *)v17 + 5) = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(&v17[v14], v11, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(&v17[v16], v13, v1);
  *(_QWORD *)(v3 - 192) = v9;
  *(_QWORD *)(v3 - 184) = MEMORY[0x24BDECC60];
  v20 = MEMORY[0x24BDED308];
  v21 = *(_QWORD *)(v3 - 456);
  v22 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v21, v3 - 192);
  v23 = *(_QWORD *)(v3 - 480);
  v24 = *(_QWORD *)(v3 - 288);
  sub_21FFC4B80();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 400) + 8))(v24, v21);
  sub_21FFC4E74();
  v25 = *(_QWORD *)(v3 - 472);
  sub_21FFC4CE8();
  v26 = *(_QWORD *)(v3 - 336);
  sub_21FFC4CC4();
  v27 = MEMORY[0x24BDF0910];
  *(_QWORD *)(v3 - 208) = v22;
  *(_QWORD *)(v3 - 200) = v27;
  v28 = *(_QWORD *)(v3 - 440);
  v29 = MEMORY[0x2207DB4B4](v20, v28, v3 - 208);
  v30 = *(_QWORD *)(v3 - 464);
  sub_21FFC4BB0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 328) + 8))(v26, v25);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 344) + 8))(v23, v28);
  v31 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEEC10], *(_QWORD *)(v3 - 368));
  *(_QWORD *)(v3 - 224) = v29;
  *(_QWORD *)(v3 - 216) = v31;
  v32 = *(_QWORD *)(v3 - 360);
  v33 = MEMORY[0x2207DB4B4](v20, v32, v3 - 224);
  v34 = *(_QWORD *)(v3 - 384);
  v35 = v30;
  sub_21FFB5D18(v30, v32, v34);
  v36 = *(_QWORD *)(v3 - 352);
  v37 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  v37(v30, v32);
  v38 = *(_QWORD *)(v3 - 504);
  v39 = *(_QWORD *)(v3 - 448);
  sub_21FF9E81C(v38, v39);
  *(_QWORD *)(v3 - 152) = v39;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v35, v34, v32);
  *(_QWORD *)(v3 - 144) = v35;
  *(_QWORD *)(v3 - 240) = *(_QWORD *)(v3 - 424);
  *(_QWORD *)(v3 - 232) = v32;
  *(_QWORD *)(v3 - 256) = sub_21FF9E864();
  *(_QWORD *)(v3 - 248) = v33;
  sub_21FF51C7C(v3 - 152, 2, v3 - 240);
  v37(v34, v32);
  sub_21FF1C7A4(v38, &qword_25558ECE8);
  v37(v35, v32);
  return sub_21FF1C7A4(v39, &qword_25558ECE8);
}

uint64_t sub_21FF9D314(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
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
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;

  v49 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_25558E778);
  MEMORY[0x24BDAC7A8](v4);
  v47 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_21FFC54A4();
  v46 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v45 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255590228);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a2 + 16);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v8);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v44 - v16;
  v18 = sub_21FFC5444();
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = 0;
  if (*(_BYTE *)(v2 + 48) != 1)
    return v22;
  v44 = v19;
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v24 = v49;
  v23(v17, v49, v11);
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v18);
    sub_21FF1C7A4((uint64_t)v10, &qword_255590228);
    goto LABEL_11;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v18);
  v25 = v44;
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v21, v10, v18);
  v26 = sub_21FFC5408();
  if (!v27)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v21, v18);
    goto LABEL_11;
  }
  v28 = v26;
  v29 = v27;
  sub_21FF9A614();
  if (!v31)
  {
    (*(void (**)(char *, uint64_t))(v44 + 8))(v21, v18);
    swift_bridgeObjectRelease();
LABEL_11:
    v23(v15, v24, v11);
    v38 = (uint64_t)v47;
    v39 = v48;
    if (swift_dynamicCast())
    {
      __swift_storeEnumTagSinglePayload(v38, 0, 1, v39);
      v41 = v45;
      v40 = v46;
      (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v45, v38, v39);
      sub_21FF9A424();
      v22 = v42;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v39);
    }
    else
    {
      __swift_storeEnumTagSinglePayload(v38, 1, 1, v39);
      sub_21FF1C7A4(v38, qword_25558E778);
      return 0;
    }
    return v22;
  }
  v32 = v31;
  v33 = v30;
  v34 = v28;
  if (qword_25558DEF0 != -1)
    swift_once();
  sub_21FFC35F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558E120);
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_21FFC6C20;
  v36 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v35 + 56) = MEMORY[0x24BEE0D00];
  v37 = sub_21FF2E3F4();
  *(_QWORD *)(v35 + 32) = v34;
  *(_QWORD *)(v35 + 40) = v29;
  *(_QWORD *)(v35 + 96) = v36;
  *(_QWORD *)(v35 + 104) = v37;
  *(_QWORD *)(v35 + 64) = v37;
  *(_QWORD *)(v35 + 72) = v33;
  *(_QWORD *)(v35 + 80) = v32;
  v22 = sub_21FFC57C8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v21, v18);
  return v22;
}

void sub_21FF9D74C()
{
  _s21AdditionalContentViewVMa();
}

uint64_t sub_21FF9D794(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[96];

  *(_QWORD *)(v4 - 168) = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v4 - 176) = &v24[-v6];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E1B8);
  MEMORY[0x24BDAC7A8](v7);
  *(_QWORD *)(v4 - 144) = &v24[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_21FFC5030();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = &v24[-v11];
  sub_21FFC4CE8();
  sub_21FFC4CC4();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDDEB00], v9);
  sub_21FFC5A14();
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
  v13 = *(_QWORD *)(v4 - 128);
  LOBYTE(v9) = *(_BYTE *)(v4 - 120);
  *(_OWORD *)(v4 - 112) = *(_OWORD *)(v3 + *(int *)(a1 + 76));
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591040);
  result = sub_21FFC4CC4();
  if ((v9 & 1) == 0 && v13 == *(_QWORD *)(v4 - 136))
  {
    v15 = sub_21FFC5984();
    __swift_storeEnumTagSinglePayload(*(_QWORD *)(v4 - 144), 1, 1, v15);
    v17 = *(_QWORD *)(v4 - 176);
    v16 = *(_QWORD *)(v4 - 168);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v17, v3, a1);
    sub_21FFC5960();
    v18 = sub_21FFC5954();
    v19 = (*(unsigned __int8 *)(v16 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    v20 = (char *)swift_allocObject();
    v21 = MEMORY[0x24BEE6930];
    *((_QWORD *)v20 + 2) = v18;
    *((_QWORD *)v20 + 3) = v21;
    v22 = *(_QWORD *)(v4 - 160);
    *((_QWORD *)v20 + 4) = v2;
    *((_QWORD *)v20 + 5) = v22;
    v23 = *(_QWORD *)(v4 - 152);
    *((_QWORD *)v20 + 6) = v1;
    *((_QWORD *)v20 + 7) = v23;
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(&v20[v19], v17, a1);
    sub_21FF66F9C(*(_QWORD *)(v4 - 144), (uint64_t)&unk_255591260, (uint64_t)v20);
    return swift_release();
  }
  return result;
}

void sub_21FF9D9B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[6] = sub_21FFC5960();
  v8[7] = sub_21FFC5954();
  v8[8] = swift_task_alloc();
  v8[2] = a5;
  v8[3] = a6;
  v8[4] = a7;
  v8[5] = a8;
  _s21AdditionalContentViewVMa();
}

uint64_t sub_21FF9DA24(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = v2;
  v1[1] = sub_21FF9DA50;
  return sub_21FF9DADC(a1);
}

uint64_t sub_21FF9DA50()
{
  OUTLINED_FUNCTION_73();
  sub_21FFC5930();
  return swift_task_switch();
}

uint64_t sub_21FF9DAB4()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_25(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21FF9DADC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[13] = a1;
  v2[14] = v1;
  v2[15] = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 32);
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 + 8);
  v4 = sub_21FFC5030();
  v2[18] = v4;
  v5 = sub_21FFC4CE8();
  v2[19] = v5;
  v2[20] = *(_QWORD *)(v5 - 8);
  v2[21] = swift_task_alloc();
  v6 = sub_21FFC5AC8();
  v2[22] = v6;
  v2[23] = *(_QWORD *)(v6 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = *(_QWORD *)(v4 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  sub_21FFC5960();
  v2[29] = sub_21FFC5954();
  v2[30] = sub_21FFC5930();
  v2[31] = v7;
  return swift_task_switch();
}

uint64_t sub_21FF9DC00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;

  v1 = *(_QWORD *)(v0 + 224);
  v2 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 144);
  *(_DWORD *)(v0 + 296) = *(_DWORD *)(*(_QWORD *)(v0 + 104) + 68);
  OUTLINED_FUNCTION_45_5();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDDEB00], v3);
  v4 = sub_21FFC5A08();
  v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(_QWORD *)(v0 + 256) = v5;
  v5(v1, v3);
  if ((v4 & 1) != 0)
    goto LABEL_9;
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(int *)(*(_QWORD *)(v0 + 104) + 72);
  *(_DWORD *)(v0 + 300) = v7;
  v8 = v6 + v7;
  LOBYTE(v6) = *(_BYTE *)(v6 + v7);
  v9 = *(_QWORD *)(v8 + 8);
  *(_BYTE *)(v0 + 32) = v6;
  *(_QWORD *)(v0 + 40) = v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E108);
  v11 = v10;
  *(_QWORD *)(v0 + 264) = v10;
  sub_21FFC4CC4();
  if ((*(_BYTE *)(v0 + 306) & 1) != 0
    || (v12 = *(_QWORD *)(v0 + 224),
        v13 = *(_QWORD *)(v0 + 144),
        OUTLINED_FUNCTION_45_5(),
        v14 = sub_21FFC5000(),
        v5(v12, v13),
        (v14 & 1) == 0))
  {
LABEL_9:
    swift_release();
    OUTLINED_FUNCTION_2_15();
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_70();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v15 = *(_QWORD *)(v8 + 8);
    *(_BYTE *)(v0 + 48) = *(_BYTE *)v8;
    *(_QWORD *)(v0 + 56) = v15;
    *(_BYTE *)(v0 + 304) = 1;
    sub_21FFC4CD0();
    if (qword_25558DF28 != -1)
      swift_once();
    v16 = sub_21FFC3EFC();
    *(_QWORD *)(v0 + 272) = __swift_project_value_buffer(v16, (uint64_t)qword_255598320);
    v17 = sub_21FFC3EE4();
    v18 = sub_21FFC5A5C();
    if (OUTLINED_FUNCTION_35_4(v18))
    {
      v19 = (uint8_t *)OUTLINED_FUNCTION_38_2();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21FF05000, v17, v11, "Fetching next batch of items in the expanded list.", v19, 2u);
      OUTLINED_FUNCTION_17();
    }
    v20 = *(_QWORD *)(v0 + 224);
    v21 = *(_QWORD *)(v0 + 144);
    v22 = *(_QWORD *)(v0 + 104);
    v23 = *(_QWORD *)(v0 + 112);

    OUTLINED_FUNCTION_45_5();
    v24 = sub_21FFC59F0();
    v5(v20, v21);
    *(_OWORD *)(v0 + 64) = *(_OWORD *)(v23 + *(int *)(v22 + 76));
    *(_QWORD *)(v0 + 88) = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255591040);
    sub_21FFC4CD0();
    OUTLINED_FUNCTION_45_5();
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v25;
    *v25 = v0;
    v25[1] = sub_21FF9DEE8;
    return sub_21FFC5024();
  }
}

uint64_t sub_21FF9DEE8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 256);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 208);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 144);
  *(_QWORD *)(*(_QWORD *)v1 + 288) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  return swift_task_switch();
}

uint64_t sub_21FF9DF70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 144);
  swift_release();
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
  {
    v4 = *(_QWORD *)(v0 + 184);
    v3 = *(_QWORD *)(v0 + 192);
    v5 = *(_QWORD *)(v0 + 176);
    sub_21FFC58B8();
    sub_21FFC4FF4();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 32))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 144));
  }
  v6 = *(void (**)(uint64_t, uint64_t))(v0 + 256);
  v7 = *(_QWORD *)(v0 + 216);
  v8 = *(_QWORD *)(v0 + 160);
  v9 = *(_QWORD *)(v0 + 168);
  v10 = *(_QWORD *)(v0 + 144);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v9, *(_QWORD *)(v0 + 112) + *(int *)(v0 + 296), *(_QWORD *)(v0 + 152));
  sub_21FFC4CC4();
  sub_21FFC500C();
  v6(v7, v10);
  sub_21FFC4CD0();
  OUTLINED_FUNCTION_67_1(v9, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  OUTLINED_FUNCTION_3_10();
  sub_21FFC4CD0();
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_70();
  return OUTLINED_FUNCTION_14_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21FF9E0CC()
{
  uint64_t v0;
  os_log_type_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_19();
  v2 = sub_21FFC3EE4();
  v3 = sub_21FFC5A44();
  if (OUTLINED_FUNCTION_35_4(v3))
  {
    v4 = *(_QWORD *)(v0 + 288);
    v5 = (uint8_t *)OUTLINED_FUNCTION_38_2();
    v6 = OUTLINED_FUNCTION_38_2();
    *(_DWORD *)v5 = 136315138;
    v10 = v6;
    *(_QWORD *)(v0 + 96) = v4;
    OUTLINED_FUNCTION_19();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25558E118);
    v7 = sub_21FFC57E0();
    *(_QWORD *)(v0 + 80) = sub_21FFB76CC(v7, v8, &v10);
    sub_21FFC5AD4();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    _os_log_impl(&dword_21FF05000, v2, v1, "Failed to fetch next batch of items in the expanded list with error: %s.", v5, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
  }
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3();

  OUTLINED_FUNCTION_3_10();
  sub_21FFC4CD0();
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_70();
  return OUTLINED_FUNCTION_14_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21FF9E258()
{
  sub_21FFC5CF0();
  sub_21FF1C978();
  return sub_21FFC5D20();
}

BOOL sub_21FF9E2EC(double *a1, double *a2)
{
  return sub_21FF1C954(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_21FF9E30C()
{
  return sub_21FF9E258();
}

uint64_t sub_21FF9E324()
{
  return sub_21FF1C978();
}

uint64_t sub_21FF9E33C()
{
  sub_21FFC5CF0();
  sub_21FF1C978();
  return sub_21FFC5D20();
}

unint64_t sub_21FF9E38C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25558E0C0;
  if (!qword_25558E0C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E0B0);
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4750], v1);
    atomic_store(result, (unint64_t *)&qword_25558E0C0);
  }
  return result;
}

void sub_21FF9E3D4()
{
  _s21AdditionalContentViewVMa();
}

uint64_t sub_21FF9E408()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_31_4();
  return sub_21FF9BFE0(v1 + v5, v0, v2, v3, v4);
}

uint64_t sub_21FF9E438(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MusicPicker.Click.ControlID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21FF9E474()
{
  return sub_21FF364A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FF9C1C8);
}

uint64_t sub_21FF9E480()
{
  return sub_21FF364A4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FF9C514);
}

void objectdestroy_2Tm()
{
  _s21AdditionalContentViewVMa();
}

void sub_21FF9E4C8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_48_2();
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v0 + 40));
  swift_release();
  if ((*(_BYTE *)(v0 + 112) & 1) != 0)
  {
    if (*(_QWORD *)(v0 + 96))
      __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  }
  else
  {
    OUTLINED_FUNCTION_102();
  }
  v1 = OUTLINED_FUNCTION_0_25();
  OUTLINED_FUNCTION_20_6(v1);
  OUTLINED_FUNCTION_65_3();
  OUTLINED_FUNCTION_66_2();
  OUTLINED_FUNCTION_10_11();
  OUTLINED_FUNCTION_10_11();
  OUTLINED_FUNCTION_31_5();
  OUTLINED_FUNCTION_40_3();
  OUTLINED_FUNCTION_16_7();
}

void sub_21FF9E54C()
{
  _s21AdditionalContentViewVMa();
}

void sub_21FF9E58C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_31_4();
  sub_21FF9C8EC(v0, v1 + v7, v3, v4, v5, v6, v2);
}

uint64_t sub_21FF9E5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E188);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21FF9E610()
{
  _s21AdditionalContentViewVMa();
}

uint64_t sub_21FF9E648(int *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = *((_QWORD *)a1 - 1);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = *(_QWORD *)(v13 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = v1 + v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v1 + v4 + 40));
  swift_release();
  if ((*(_BYTE *)(v1 + v4 + 112) & 1) != 0)
  {
    if (*(_QWORD *)(v8 + 96))
      __swift_destroy_boxed_opaque_existential_1(v1 + v4 + 72);
  }
  else
  {
    OUTLINED_FUNCTION_102();
  }
  v9 = v8 + a1[17];
  v10 = sub_21FFC5030();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  sub_21FFC4CE8();
  swift_release();
  OUTLINED_FUNCTION_61_2();
  OUTLINED_FUNCTION_61_2();
  sub_21FF0EAB8(*(_QWORD *)(v8 + a1[20]));
  v11 = v8 + a1[21];
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v11 + 24));
  OUTLINED_FUNCTION_247(v1 + ((v4 + v5 + v7) & ~v7), *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  return swift_deallocObject();
}

void sub_21FF9E790()
{
  _s21AdditionalContentViewVMa();
}

void sub_21FF9E7C4()
{
  sub_21FF9D74C();
}

uint64_t sub_21FF9E81C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558ECE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21FF9E864()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25558EE38;
  if (!qword_25558EE38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
    v2 = sub_21FF10048();
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25558EE38);
  }
  return result;
}

void sub_21FF9E8C8()
{
  _s21AdditionalContentViewVMa();
}

void sub_21FF9E900()
{
  uint64_t v0;
  uint64_t v1;

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_48_2();
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v0 + 40));
  swift_release();
  if ((*(_BYTE *)(v0 + 112) & 1) != 0)
  {
    if (*(_QWORD *)(v0 + 96))
      __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  }
  else
  {
    OUTLINED_FUNCTION_102();
  }
  v1 = OUTLINED_FUNCTION_0_25();
  OUTLINED_FUNCTION_20_6(v1);
  OUTLINED_FUNCTION_65_3();
  OUTLINED_FUNCTION_66_2();
  OUTLINED_FUNCTION_10_11();
  OUTLINED_FUNCTION_10_11();
  OUTLINED_FUNCTION_31_5();
  OUTLINED_FUNCTION_40_3();
  OUTLINED_FUNCTION_16_7();
}

void sub_21FF9E98C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v0[5];
  v3 = v0[6];
  v4 = v0[7];
  v1[2] = v0[4];
  v1[3] = v2;
  v1[4] = v3;
  v1[5] = v4;
  _s21AdditionalContentViewVMa();
}

void sub_21FF9E9D0(uint64_t a1)
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
  _QWORD *v12;

  v8 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v9 = *(_QWORD *)(v2 + 16);
  v10 = *(_QWORD *)(v2 + 24);
  v11 = v2 + ((v8 + 64) & ~v8);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 48) = v12;
  *v12 = v4;
  v12[1] = sub_21FF9EA48;
  sub_21FF9D9B0(v1, v9, v10, v11, v3, v5, v6, v7);
}

uint64_t sub_21FF9EA48()
{
  uint64_t v0;

  OUTLINED_FUNCTION_73();
  return OUTLINED_FUNCTION_25(*(uint64_t (**)(void))(v0 + 8));
}

void _s21AdditionalContentViewV9ConstantsVMa()
{
  JUMPOUT(0x2207DB418);
}

void sub_21FF9EA88()
{
  OUTLINED_FUNCTION_26_0();
  sub_21FFC5030();
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  _s13ItemShelfCellVMa();
}

void sub_21FF9EB10()
{
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_51_4();
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_75();
}

void sub_21FF9EB60()
{
  OUTLINED_FUNCTION_104();
  sub_21FFC4448();
  OUTLINED_FUNCTION_104();
  sub_21FFC419C();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_75();
}

void sub_21FF9EB98()
{
  uint64_t v0;

  swift_getAssociatedConformanceWitness();
  sub_21FFC4DE4();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v0);
  OUTLINED_FUNCTION_49();
}

void sub_21FF9EBF8()
{
  OUTLINED_FUNCTION_26_0();
  sub_21FFC3F98();
  OUTLINED_FUNCTION_49();
}

void sub_21FF9EC14()
{
  OUTLINED_FUNCTION_26_0();
  sub_21FFC3FA4();
  OUTLINED_FUNCTION_44_1();
}

void sub_21FF9EC30()
{
  sub_21FF2E0A8();
  OUTLINED_FUNCTION_23_6();
}

void sub_21FF9EC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  _s18NavigationBarStyleVMa(255, v4, v5, a4);
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_51_4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E0B0);
  _s10DoneButtonVMa(255, v4, v5, v6);
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_64();
}

void sub_21FF9ECC4()
{
  OUTLINED_FUNCTION_49();
}

void sub_21FF9ECDC()
{
  sub_21FF9E38C();
  OUTLINED_FUNCTION_20();
}

void sub_21FF9ECF4()
{
  OUTLINED_FUNCTION_23_6();
}

void sub_21FF9ED10()
{
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_58_0();
  sub_21FF0F948();
  OUTLINED_FUNCTION_64();
}

void sub_21FF9ED74()
{
  JUMPOUT(0x2207DB4B4);
}

uint64_t OUTLINED_FUNCTION_0_25()
{
  return sub_21FFC5030();
}

uint64_t OUTLINED_FUNCTION_2_15()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_3_10()
{
  uint64_t v0;
  char *v1;
  char v2;
  uint64_t v3;

  v1 = (char *)(*(_QWORD *)(v0 + 112) + *(int *)(v0 + 300));
  v2 = *v1;
  v3 = *((_QWORD *)v1 + 1);
  *(_BYTE *)(v0 + 16) = v2;
  *(_QWORD *)(v0 + 24) = v3;
  *(_BYTE *)(v0 + 305) = 0;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v0, *(_QWORD *)(v3 - 104), v1);
}

uint64_t OUTLINED_FUNCTION_6_7@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_21FFC36A4();
}

uint64_t OUTLINED_FUNCTION_7_13@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_21FFC36C8();
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  return sub_21FFC36D4();
}

uint64_t OUTLINED_FUNCTION_9_12()
{
  return sub_21FFC3704();
}

uint64_t OUTLINED_FUNCTION_10_11()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_12_7()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 200) + 8))(v0, *(_QWORD *)(v1 - 152));
}

uint64_t OUTLINED_FUNCTION_14_11(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_19_7()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 128) + 8))(v0, *(_QWORD *)(v1 - 120));
}

uint64_t OUTLINED_FUNCTION_20_6(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_21_6()
{
  return sub_21FFC36F8();
}

void OUTLINED_FUNCTION_23_6()
{
  JUMPOUT(0x2207DB460);
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 192) + 8))(v0, *(_QWORD *)(v1 - 176));
}

uint64_t OUTLINED_FUNCTION_25_6()
{
  return sub_21FFC36B0();
}

uint64_t OUTLINED_FUNCTION_26_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v3, v2, v0);
}

uint64_t OUTLINED_FUNCTION_27_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v3, v0, v1);
}

uint64_t OUTLINED_FUNCTION_31_5()
{
  uint64_t v0;
  uint64_t v1;

  sub_21FF0EAB8(*(_QWORD *)(v1 + *(int *)(v0 + 80)));
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 160) + 8))(v0, *(_QWORD *)(v1 - 144));
}

uint64_t OUTLINED_FUNCTION_34_5()
{
  return sub_21FFC36EC();
}

BOOL OUTLINED_FUNCTION_35_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_39_4()
{
  JUMPOUT(0x2207DB460);
}

uint64_t OUTLINED_FUNCTION_40_3()
{
  uint64_t v0;

  sub_21FF0EAB8(*(_QWORD *)(v0 + 24));
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_43_4(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_DWORD *)(v2 - 108) = a2;
  *(_QWORD *)(v2 - 104) = a1;
  return sub_21FFC368C();
}

uint64_t OUTLINED_FUNCTION_44_4(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_45_5()
{
  return sub_21FFC4CC4();
}

uint64_t OUTLINED_FUNCTION_48_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_51_4()
{
  return sub_21FFC419C();
}

void OUTLINED_FUNCTION_52_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 184) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_57_4()
{
  return sub_21FFC419C();
}

uint64_t OUTLINED_FUNCTION_58_2()
{
  return sub_21FFC5030();
}

uint64_t OUTLINED_FUNCTION_61_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_65_3()
{
  return sub_21FFC4CE8();
}

uint64_t OUTLINED_FUNCTION_66_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_68_1()
{
  return sub_21FFC3680();
}

uint64_t OUTLINED_FUNCTION_69_3()
{
  return sub_21FFC3698();
}

uint64_t OUTLINED_FUNCTION_74_2()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_77_2()
{
  return sub_21FFC4CE8();
}

uint64_t sub_21FF9F100()
{
  return sub_21FF9F13C((void (*)(void))sub_21FF9F5EC);
}

uint64_t sub_21FF9F114(uint64_t a1)
{
  return sub_21FF9F190(a1, (void (*)(void))sub_21FF9F5EC);
}

uint64_t sub_21FF9F128()
{
  return sub_21FF9F13C((void (*)(void))sub_21FF9F510);
}

uint64_t sub_21FF9F13C(void (*a1)(void))
{
  unsigned __int8 v2;

  a1();
  sub_21FFC4394();
  return v2;
}

uint64_t sub_21FF9F17C(uint64_t a1)
{
  return sub_21FF9F190(a1, (void (*)(void))sub_21FF9F510);
}

uint64_t sub_21FF9F190(uint64_t a1, void (*a2)(void))
{
  a2();
  return sub_21FFC43A0();
}

uint64_t sub_21FF9F1D0()
{
  return sub_21FF9F310();
}

uint64_t sub_21FF9F1DC()
{
  sub_21FF9F2B8();
  return sub_21FFC4394();
}

uint64_t sub_21FF9F210(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_21FFC4190();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_21FF9F2B8();
  sub_21FFC43A0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

unint64_t sub_21FF9F2B8()
{
  unint64_t result;
  double vars0;

  result = qword_255591310;
  if (!qword_255591310)
  {
    atomic_store(result, (unint64_t *)&qword_255591310);
  }
  return result;
}

ValueMetadata *type metadata accessor for PickerLayoutDirectionKey()
{
  return &type metadata for PickerLayoutDirectionKey;
}

uint64_t sub_21FF9F304()
{
  return sub_21FF9F310();
}

uint64_t sub_21FF9F310()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_0_26();
  return swift_release();
}

uint64_t sub_21FF9F374()
{
  swift_getKeyPath();
  OUTLINED_FUNCTION_0_26();
  return swift_release();
}

void sub_21FF9F3CC(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_21FF9F3D4()
{
  return sub_21FFC4100();
}

uint64_t sub_21FF9F3E0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_21FFC4190();
  __swift_allocate_value_buffer(v0, qword_2555912F8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2555912F8);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, *MEMORY[0x24BDED100], v0);
}

uint64_t sub_21FF9F438()
{
  uint64_t v0;

  if (qword_25558DF18 != -1)
    swift_once();
  v0 = sub_21FFC4190();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555912F8);
}

uint64_t sub_21FF9F480@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_21FF9F438();
  v3 = sub_21FFC4190();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_21FF9F4C0()
{
  sub_21FF9F54C();
  return sub_21FFC4100();
}

unint64_t sub_21FF9F510()
{
  unint64_t result;

  result = qword_255591318;
  if (!qword_255591318)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCAD60, &type metadata for LibraryDownloadedPageParameters);
    atomic_store(result, (unint64_t *)&qword_255591318);
  }
  return result;
}

unint64_t sub_21FF9F54C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255591320;
  if (!qword_255591320)
  {
    v1 = sub_21FFC4190();
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDED158], v1);
    atomic_store(result, (unint64_t *)&qword_255591320);
  }
  return result;
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

ValueMetadata *type metadata accessor for LibraryDownloadedPageParameters()
{
  return &type metadata for LibraryDownloadedPageParameters;
}

unint64_t sub_21FF9F5EC()
{
  unint64_t result;

  result = qword_255591328[0];
  if (!qword_255591328[0])
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCADE0, &type metadata for ContainerDetailPageParameters);
    atomic_store(result, qword_255591328);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContainerDetailPageParameters()
{
  return &type metadata for ContainerDetailPageParameters;
}

uint64_t OUTLINED_FUNCTION_0_26()
{
  return sub_21FFC4988();
}

void sub_21FF9F64C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_21FF9F6DC(a1, a3, a5, a4);
}

uint64_t sub_21FF9F688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[12];

  v10[0] = a1;
  v10[1] = a2;
  v8 = _s18NavigationBarStyleVMa(0, v6, v4, a4);
  MEMORY[0x2207D9E4C](v10, v7, v8, v5);
  return swift_release();
}

void sub_21FF9F6DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _s9ViewModelCMa(0, a2, a3, a4);
  OUTLINED_FUNCTION_20();
}

uint64_t sub_21FF9F700()
{
  return sub_21FFC4268();
}

uint64_t _s18NavigationBarStyleVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s18NavigationBarStyleVMn);
}

uint64_t sub_21FF9F720()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21FF9F754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = sub_21FFC404C();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0_7();
  v8 = sub_21FFC4E38();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0_7();
  _s18NavigationBarStyleVMa(255, a4, a5, v9);
  OUTLINED_FUNCTION_20();
}

void sub_21FF9F810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_5_10();
  v2 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEFB78], v1);
  *(_QWORD *)(v0 - 120) = v1;
  *(_QWORD *)(v0 - 112) = v2;
  *(_QWORD *)(v0 - 288) = v2;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF9F850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)(v12 - 224) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v14);
  *(_QWORD *)(v12 - 296) = (char *)&a9 - v15;
  *(_QWORD *)(v12 - 120) = v9;
  *(_QWORD *)(v12 - 112) = v11;
  v16 = OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v12 - 120) = a1;
  *(_QWORD *)(v12 - 112) = v10;
  *(_QWORD *)(v12 - 312) = v10;
  v17 = MEMORY[0x24BDF4E40];
  *(_QWORD *)(v12 - 104) = v16;
  *(_QWORD *)(v12 - 96) = v17;
  *(_QWORD *)(v12 - 304) = v16;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF9F8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)(v13 - 240) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v13 - 320) = (char *)&a9 - v16;
  *(_QWORD *)(v13 - 120) = v10;
  *(_QWORD *)(v13 - 112) = v9;
  *(_QWORD *)(v13 - 104) = v12;
  *(_QWORD *)(v13 - 96) = v11;
  v17 = OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v13 - 120) = a1;
  *(_QWORD *)(v13 - 112) = v17;
  *(_QWORD *)(v13 - 328) = v17;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF9F93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v12 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v11 - 248) = a1;
  *(_QWORD *)(v11 - 216) = v12;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v14);
  *(_QWORD *)(v11 - 336) = (char *)&a9 - v15;
  *(_QWORD *)(v11 - 120) = v10;
  *(_QWORD *)(v11 - 112) = v9;
  v16 = OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v11 - 264) = v16;
  v17 = sub_21FF9FCCC();
  *(_QWORD *)(v11 - 272) = v17;
  *(_QWORD *)(v11 - 120) = a1;
  *(_QWORD *)(v11 - 112) = &_s27PickerNavigationItemAdaptorVN;
  *(_QWORD *)(v11 - 104) = v16;
  *(_QWORD *)(v11 - 96) = v17;
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_21FF9F9BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 *v12;
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
  void (*v27)(uint64_t, uint64_t);
  _BYTE v29[96];

  *(_QWORD *)(v3 - 232) = *(_QWORD *)(a1 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v3 - 280) = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  *(_QWORD *)(v3 - 256) = &v29[-v7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555913B8);
  sub_21FFC4214();
  v8 = (__n128 *)OUTLINED_FUNCTION_4_7();
  *(_OWORD *)(v3 - 352) = xmmword_21FFC63F0;
  OUTLINED_FUNCTION_6_8(v8, (__n128)xmmword_21FFC63F0);
  v9 = swift_checkMetadataState();
  v10 = *(_QWORD *)(v3 - 296);
  MEMORY[0x2207D9D08](1, v8, v9, *(_QWORD *)(v3 - 288));
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v3 - 208);
  sub_21FFC4E20();
  v12 = (__n128 *)OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_6_8(v12, *(__n128 *)(v3 - 352));
  v13 = *(_QWORD *)(v3 - 320);
  v14 = *(_QWORD *)(v3 - 312);
  MEMORY[0x2207D9D14](v11, v12, v1, v14, *(_QWORD *)(v3 - 304), MEMORY[0x24BDF4E40]);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 192) + 8))(v11, v14);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 224) + 8))(v10, v1);
  v15 = *(_QWORD *)(v3 - 184);
  sub_21FFC4040();
  v16 = *(_QWORD *)(v3 - 336);
  sub_21FFC49C4();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 160) + 8))(v15, *(_QWORD *)(v3 - 152));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 240) + 8))(v13, v2);
  v18 = _s9ViewModelCMa(0, *(_QWORD *)(v3 - 176), *(_QWORD *)(v3 - 168), v17);
  sub_21FFC4244();
  v19 = sub_21FF6D0F8();
  v21 = v20;
  swift_release();
  *(_QWORD *)(v3 - 120) = v19;
  *(_QWORD *)(v3 - 112) = v21;
  v22 = *(_QWORD *)(v3 - 280);
  v23 = *(_QWORD *)(v3 - 248);
  v24 = *(_QWORD *)(v3 - 264);
  v25 = *(_QWORD *)(v3 - 272);
  sub_21FFC4A90();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 216) + 8))(v16, v23);
  *(_QWORD *)(v3 - 120) = v23;
  *(_QWORD *)(v3 - 112) = &_s27PickerNavigationItemAdaptorVN;
  *(_QWORD *)(v3 - 104) = v24;
  *(_QWORD *)(v3 - 96) = v25;
  OUTLINED_FUNCTION_58_0();
  v26 = *(_QWORD *)(v3 - 256);
  sub_21FFB5D18(v22, a1, v26);
  v27 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 232) + 8);
  v27(v22, a1);
  sub_21FFB57EC(v26, a1, *(_QWORD *)(v3 - 128));
  return ((uint64_t (*)(uint64_t, uint64_t))v27)(v26, a1);
}

void sub_21FF9FCBC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_21FF9F754(a1, *v2, v2[1], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

unint64_t sub_21FF9FCCC()
{
  unint64_t result;

  result = qword_2555913B0;
  if (!qword_2555913B0)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFC6F2C, &_s27PickerNavigationItemAdaptorVN);
    atomic_store(result, (unint64_t *)&qword_2555913B0);
  }
  return result;
}

void sub_21FF9FD08(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _s18NavigationBarStyleVMa(255, *a1, a1[1], a4);
  OUTLINED_FUNCTION_20();
}

void sub_21FF9FD3C()
{
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_20();
}

void sub_21FF9FD50()
{
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF9FD70()
{
  sub_21FFC4E38();
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FF9FDBC()
{
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_21FF9FDF4()
{
  OUTLINED_FUNCTION_58_0();
  sub_21FF9FCCC();
  return OUTLINED_FUNCTION_58_0();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_10()
{
  return sub_21FFC458C();
}

uint64_t OUTLINED_FUNCTION_6_8(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_21FFC4208();
}

uint64_t sub_21FF9FE74(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
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
  char v34;
  uint64_t v35;
  char v36;

  v6 = *a1;
  v17 = a1[1];
  v7 = a1[2];
  v8 = a1[3];
  v9 = a1[4];
  v10 = a1[5];
  v12 = a1[6];
  v11 = a1[7];
  v13 = a1[8];
  v18 = a1[9];
  v36 = 0;
  sub_21FF9FF94((uint64_t)a1);
  swift_retain();
  sub_21FFC4CB8();
  v14 = v22;
  v15 = v23;
  v22 = v6;
  v23 = v17;
  v24 = v7;
  v25 = v8;
  v26 = v9;
  v27 = v10;
  v28 = v12;
  v29 = v11;
  v30 = v13;
  v31 = v18;
  v32 = a2;
  v33 = a3;
  v34 = v14;
  v35 = v15;
  MEMORY[0x2207D9E4C](&v22, a4, &_s20FailureAlertModifierVN, a5);
  swift_release();
  swift_release();
  sub_21FF0FBFC(v7, v8);
  swift_release();
  return swift_release();
}

uint64_t sub_21FF9FF94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  swift_retain();
  swift_retain();
  sub_21FF78E08(v2, v3);
  return a1;
}

uint64_t _s20FailureAlertModifierVwxx(uint64_t a1)
{
  swift_release();
  swift_release();
  if (*(_QWORD *)(a1 + 24))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();
  return swift_release();
}

uint64_t _s20FailureAlertModifierVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_retain();
  if (v5)
  {
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v5;
    v6 = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = v6;
    v7 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = v7;
    v8 = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v9;
    v10 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v10;
  }
  v11 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v11;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s20FailureAlertModifierVwca(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  __int128 *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  v4 = (_OWORD *)(a1 + 16);
  v5 = (__int128 *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v6)
    {
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
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21FF0F218(a1 + 16);
      v7 = *(_OWORD *)(a2 + 64);
      v9 = *v5;
      v8 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 64) = v7;
      *v4 = v9;
      *(_OWORD *)(a1 + 32) = v8;
    }
  }
  else if (v6)
  {
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v10 = *v5;
    v11 = *(_OWORD *)(a2 + 32);
    v12 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v12;
    *v4 = v10;
    *(_OWORD *)(a1 + 32) = v11;
  }
  v13 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v13;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t _s20FailureAlertModifierVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  if (!*(_QWORD *)(a1 + 24))
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 24);
  if (!v4)
  {
    sub_21FF0F218(a1 + 16);
LABEL_5:
    v8 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a1 + 32) = v8;
    v9 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v9;
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  swift_bridgeObjectRelease();
LABEL_6:
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_release();
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_release();
  return a1;
}

uint64_t _s20FailureAlertModifierVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s20FailureAlertModifierVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
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
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s20FailureAlertModifierVMa()
{
  return &_s20FailureAlertModifierVN;
}

uint64_t sub_21FFA04A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FFA04B4(uint64_t a1)
{
  const void *v1;
  const void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD __dst[5];
  _OWORD v11[4];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555913C0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)__dst - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FFA0624(a1, (uint64_t)v6);
  memcpy(__dst, v2, sizeof(__dst));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555913C8);
  MEMORY[0x2207DA050](v11, v7);
  __dst[0] = v11[0];
  __dst[1] = v11[1];
  __dst[2] = v11[2];
  __dst[3] = v11[3];
  v8 = swift_allocObject();
  memcpy((void *)(v8 + 16), v2, 0x70uLL);
  sub_21FFA10A0((uint64_t)v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558DFC8);
  sub_21FFA114C();
  sub_21FFA126C();
  sub_21FFC4B8C();
  swift_release();
  sub_21FF0FBFC(*(uint64_t *)&__dst[0], *((uint64_t *)&__dst[0] + 1));
  return sub_21FF1C7A4((uint64_t)v6, &qword_2555913C0);
}

uint64_t sub_21FFA0624@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _OWORD *v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD v32[4];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  int v39;
  uint64_t *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD __dst[10];
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;

  v53 = a1;
  v52 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555913D8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591400);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591408);
  v51 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v50 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(__dst, v2, sizeof(__dst));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555913C8);
  MEMORY[0x2207DA050](&v59, v11);
  v12 = v60;
  if (v60)
  {
    v43 = v59;
    v49 = v61;
    v48 = v62;
    v47 = v63;
    v46 = v64;
    v45 = v65;
    v44 = v66;
    __dst[0] = v59;
    __dst[1] = v60;
    __dst[2] = v61;
    __dst[3] = v62;
    __dst[4] = v63;
    __dst[5] = v64;
    __dst[6] = v65;
    __dst[7] = v66;
    v56 = v59;
    v57 = v60;
    v55 = v2[6];
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25558E108);
    v13 = sub_21FFC4CDC();
    v40 = &v33;
    v38 = v59;
    v42 = v7;
    v39 = v61;
    v14 = MEMORY[0x24BDAC7A8](v13);
    v37 = v32;
    MEMORY[0x24BDAC7A8](v14);
    v41 = v9;
    v34 = v3;
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555913E0);
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E890);
    v16 = sub_21FF4D118(&qword_2555913E8, &qword_2555913D8, MEMORY[0x24BDEFB78]);
    v17 = sub_21FF2E0A8();
    v18 = sub_21FF4D118(&qword_2555913F0, &qword_2555913E0, MEMORY[0x24BDF5428]);
    v36 = v18;
    v19 = sub_21FF365D4();
    v32[2] = v18;
    v32[3] = v19;
    v32[0] = v16;
    v32[1] = v17;
    v20 = v16;
    v21 = v50;
    sub_21FFC4AF0();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_21FF0FBFC(v43, v12);
    v22 = v51;
    v23 = v54;
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v41, v21, v54);
    swift_storeEnumTagMultiPayload();
    v59 = v34;
    v60 = MEMORY[0x24BEE0D00];
    v61 = v15;
    v62 = v35;
    v63 = v20;
    v64 = v17;
    v65 = v36;
    v66 = v19;
    swift_getOpaqueTypeConformance2();
    sub_21FFC44C0();
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v21, v23);
  }
  else
  {
    v25 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v25(v6, v53, v3);
    v25(v9, (uint64_t)v6, v3);
    swift_storeEnumTagMultiPayload();
    v26 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555913E0);
    v27 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E890);
    v28 = sub_21FF4D118(&qword_2555913E8, &qword_2555913D8, MEMORY[0x24BDEFB78]);
    v29 = sub_21FF2E0A8();
    v30 = sub_21FF4D118(&qword_2555913F0, &qword_2555913E0, MEMORY[0x24BDF5428]);
    v31 = sub_21FF365D4();
    __dst[0] = v3;
    __dst[1] = MEMORY[0x24BEE0D00];
    __dst[2] = v26;
    __dst[3] = v27;
    __dst[4] = v28;
    __dst[5] = v29;
    __dst[6] = v30;
    __dst[7] = v31;
    swift_getOpaqueTypeConformance2();
    sub_21FFC44C0();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_21FFA0BA8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558E108);
  return sub_21FFC4CD0();
}

uint64_t sub_21FFA0BFC@<X0>(uint64_t a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
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
  __int128 v32;
  _BYTE v33[16];
  __int128 v34;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558EEC0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v33[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591410);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = &v33[-v14 - 16];
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = &v33[-v17 - 16];
  MEMORY[0x24BDAC7A8](v16);
  v20 = &v33[-v19 - 16];
  v21 = *(_QWORD *)(a1 + 40);
  if (v21)
  {
    *(_QWORD *)&v34 = *(_QWORD *)(a1 + 32);
    *((_QWORD *)&v34 + 1) = v21;
    swift_bridgeObjectRetain();
    sub_21FFC3F68();
    v22 = sub_21FFC3F74();
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v22);
    v23 = swift_allocObject();
    memcpy((void *)(v23 + 16), a2, 0x70uLL);
    sub_21FFA10A0((uint64_t)a2);
    sub_21FF2E0A8();
    sub_21FFC4D0C();
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558F650);
    v25 = (uint64_t)v20;
    v26 = 0;
  }
  else
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558F650);
    v25 = (uint64_t)v20;
    v26 = 1;
  }
  __swift_storeEnumTagSinglePayload(v25, v26, 1, v24);
  sub_21FFA12E0(a1 + 48, (uint64_t)v33);
  sub_21FFA12E0((uint64_t)v33, (uint64_t)&v34);
  if (*((_QWORD *)&v34 + 1))
  {
    v32 = v34;
    v27 = swift_allocObject();
    memcpy((void *)(v27 + 16), a2, 0x70uLL);
    sub_21FFA10A0((uint64_t)a2);
    sub_21FFA137C((uint64_t)v33);
    sub_21FF2E0A8();
    sub_21FFC4D18();
    v28 = 0;
  }
  else
  {
    v28 = 1;
  }
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558F650);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, v28, 1, v29);
  sub_21FFA1328((uint64_t)v20, (uint64_t)v15);
  sub_21FFA1328((uint64_t)v18, (uint64_t)v12);
  sub_21FFA1328((uint64_t)v15, a3);
  v30 = __swift_instantiateConcreteTypeFromMangledName(qword_255591418);
  sub_21FFA1328((uint64_t)v12, a3 + *(int *)(v30 + 48));
  sub_21FF1C7A4((uint64_t)v18, &qword_255591410);
  sub_21FF1C7A4((uint64_t)v20, &qword_255591410);
  sub_21FF1C7A4((uint64_t)v12, &qword_255591410);
  return sub_21FF1C7A4((uint64_t)v15, &qword_255591410);
}

uint64_t sub_21FFA0F08(void *__src)
{
  _BYTE __dst[80];

  memcpy(__dst, __src, sizeof(__dst));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555913C8);
  return sub_21FFC4D84();
}

uint64_t sub_21FFA0F60(void (**a1)(void))
{
  _BYTE __dst[80];

  a1[10]();
  memcpy(__dst, a1, sizeof(__dst));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555913C8);
  return sub_21FFC4D84();
}

uint64_t sub_21FFA0FC4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_21FF2E0A8();
    swift_bridgeObjectRetain();
    result = sub_21FFC48EC();
    v7 = v6 & 1;
  }
  else
  {
    result = 0;
    v4 = 0;
    v7 = 0;
    v5 = 0;
  }
  *a2 = result;
  a2[1] = v4;
  a2[2] = v7;
  a2[3] = v5;
  return result;
}

uint64_t sub_21FFA1044(uint64_t a1)
{
  const void *v1;
  _BYTE v4[112];

  memcpy(v4, v1, sizeof(v4));
  return sub_21FFA04B4(a1);
}

uint64_t sub_21FFA1098()
{
  return sub_21FFA0BA8();
}

uint64_t sub_21FFA10A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  swift_retain();
  swift_retain();
  sub_21FF78E08(v2, v3);
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_21FFA114C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v9[10];

  result = qword_2555913D0;
  if (!qword_2555913D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555913C0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555913D8);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555913E0);
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E890);
    v5 = sub_21FF4D118(&qword_2555913E8, &qword_2555913D8, MEMORY[0x24BDEFB78]);
    v6 = sub_21FF2E0A8();
    v7 = sub_21FF4D118(&qword_2555913F0, &qword_2555913E0, MEMORY[0x24BDF5428]);
    v8 = sub_21FF365D4();
    v9[2] = v2;
    v9[3] = MEMORY[0x24BEE0D00];
    v9[4] = v3;
    v9[5] = v4;
    v9[6] = v5;
    v9[7] = v6;
    v9[8] = v7;
    v9[9] = v8;
    v9[0] = swift_getOpaqueTypeConformance2();
    v9[1] = v5;
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDEF3E0], v1, v9);
    atomic_store(result, (unint64_t *)&qword_2555913D0);
  }
  return result;
}

unint64_t sub_21FFA126C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2555913F8;
  if (!qword_2555913F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558DFC8);
    v2 = sub_21FF941A0();
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2555913F8);
  }
  return result;
}

uint64_t sub_21FFA12D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21FFA0BFC(*(_QWORD *)(v1 + 16), *(const void **)(v1 + 24), a1);
}

uint64_t sub_21FFA12D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_21FFA0FC4(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_21FFA12E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558DFC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FFA1328(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FFA1374()
{
  uint64_t v0;

  return sub_21FFA0F60((void (**)(void))(v0 + 16));
}

uint64_t sub_21FFA137C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t objectdestroyTm_8()
{
  uint64_t v0;

  swift_release();
  swift_release();
  if (*(_QWORD *)(v0 + 40))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21FFA1408()
{
  uint64_t v0;

  return sub_21FFA0F08((void *)(v0 + 16));
}

uint64_t sub_21FFA1410()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555913C0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558DFC8);
  sub_21FFA114C();
  sub_21FFA126C();
  return swift_getOpaqueTypeConformance2();
}

void sub_21FFA1480(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v23 = a4;
  v24 = a5;
  v25 = a3;
  v7 = sub_21FFC37F4();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_21FFC3AE8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v20 - v13;
  v22 = *(unsigned __int8 *)a2;
  v16 = a2[1];
  v15 = a2[2];
  v20 = a2[3];
  v21 = v15;
  sub_21FFC3AF4();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v12, *MEMORY[0x24BE69C48], v8);
  v17 = sub_21FF869C0();
  v18 = *(void (**)(char *, uint64_t))(v9 + 8);
  v18(v12, v8);
  v18(v14, v8);
  if ((v17 & 1) != 0)
  {
    if (qword_25558DEF0 != -1)
      swift_once();
    sub_21FFC35F0();
  }
  sub_21FFC3ADC();
  v19 = sub_21FFC3B00();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(a1, v19);
  v26 = v22;
  v27 = v16;
  v28 = v21;
  v29 = v20;
  sub_21FFA1778();
  sub_21FFA16AC();
}

void sub_21FFA16AC()
{
  OUTLINED_FUNCTION_2_16();
}

__n128 sub_21FFA16FC(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  __n128 result;
  _QWORD *v12;
  __n128 v13;

  v9 = v5 + a1[15];
  *(_OWORD *)v9 = xmmword_21FFCAF40;
  *(_OWORD *)(v9 + 16) = xmmword_21FFCAF50;
  *(_QWORD *)(v9 + 32) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v5, v4, v1);
  v10 = v5 + a1[13];
  *(_BYTE *)v10 = v6;
  result = v13;
  *(__n128 *)(v10 + 8) = v13;
  *(_QWORD *)(v10 + 24) = v7;
  v12 = (_QWORD *)(v5 + a1[14]);
  *v12 = v3;
  v12[1] = v2;
  return result;
}

unint64_t sub_21FFA1778()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25558ECF0;
  if (!qword_25558ECF0)
  {
    v1 = sub_21FFC37F4();
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BE695C8], v1);
    atomic_store(result, (unint64_t *)&qword_25558ECF0);
  }
  return result;
}

void _s16SearchResultCellVMa()
{
  JUMPOUT(0x2207DB418);
}

uint64_t sub_21FFA17C4()
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

uint64_t *sub_21FFA184C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 40 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v10 = *(_BYTE *)v11;
    *(_QWORD *)(v10 + 8) = *(_QWORD *)(v11 + 8);
    *(_QWORD *)(v10 + 16) = *(_QWORD *)(v11 + 16);
    v12 = *(_QWORD *)(v11 + 24);
    swift_bridgeObjectRetain();
    sub_21FF0E594(v12);
    *(_QWORD *)(v10 + 24) = v12;
    v13 = (_QWORD *)((v10 + 39) & 0xFFFFFFFFFFFFFFF8);
    v14 = (_QWORD *)((v11 + 39) & 0xFFFFFFFFFFFFFFF8);
    *v13 = *v14;
    v13[1] = v14[1];
    v15 = ((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8;
    v16 = ((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8;
    v17 = *(_OWORD *)v16;
    v18 = *(_OWORD *)(v16 + 16);
    *(_QWORD *)(v15 + 32) = *(_QWORD *)(v16 + 32);
    *(_OWORD *)v15 = v17;
    *(_OWORD *)(v15 + 16) = v18;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_21FFA1974(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = (a1 + *(_QWORD *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v4 + 24));
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FFA19CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v7 = *(_BYTE *)v8;
  *(_QWORD *)(v7 + 8) = *(_QWORD *)(v8 + 8);
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v8 + 16);
  v9 = *(_QWORD *)(v8 + 24);
  swift_bridgeObjectRetain();
  sub_21FF0E594(v9);
  *(_QWORD *)(v7 + 24) = v9;
  v10 = (_QWORD *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v10 = *v11;
  v10[1] = v11[1];
  v12 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  v13 = ((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_OWORD *)v13;
  v15 = *(_OWORD *)(v13 + 16);
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v13 + 32);
  *(_OWORD *)v12 = v14;
  *(_OWORD *)(v12 + 16) = v15;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21FFA1A90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v7 = *(_BYTE *)v8;
  *(_QWORD *)(v7 + 8) = *(_QWORD *)(v8 + 8);
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v8 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v8 + 24);
  sub_21FF0E594(v9);
  v10 = *(_QWORD *)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v9;
  sub_21FF0EAB8(v10);
  v11 = (_QWORD *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v13[1] = v14[1];
  v13[2] = v14[2];
  v13[3] = v14[3];
  v13[4] = v14[4];
  return a1;
}

uint64_t sub_21FFA1B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  __int128 v9;
  _OWORD *v10;
  _OWORD *v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v10 = *v11;
  v12 = ((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8;
  v13 = ((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8;
  v15 = *(_OWORD *)v13;
  v14 = *(_OWORD *)(v13 + 16);
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v13 + 32);
  *(_OWORD *)v12 = v15;
  *(_OWORD *)(v12 + 16) = v14;
  return a1;
}

uint64_t sub_21FFA1C18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v7 = *(_BYTE *)v8;
  *(_QWORD *)(v7 + 8) = *(_QWORD *)(v8 + 8);
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v8 + 16);
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v7 + 24);
  *(_QWORD *)(v7 + 24) = *(_QWORD *)(v8 + 24);
  sub_21FF0EAB8(v9);
  v10 = (_QWORD *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)((v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRelease();
  v12 = (_QWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v12 = *v13;
  v12[1] = v13[1];
  v12[2] = v13[2];
  v12[3] = v13[3];
  v12[4] = v13[4];
  return a1;
}

uint64_t sub_21FFA1CFC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;
  int v14;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFE)
    v7 = 2147483646;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 >= a2)
  {
    if (v6 < 0x7FFFFFFE)
    {
      v13 = *(_QWORD *)(((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      v14 = v13 - 1;
      if (v14 < 0)
        v14 = -1;
      return (v14 + 1);
    }
    else
    {
      return __swift_getEnumTagSinglePayload(a1, v6, v4);
    }
  }
  else
  {
    if (((((((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 40) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_21FFA1D88 + 4 * byte_21FFCAF60[v11]))();
  }
}

void sub_21FFA1E10(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFEu)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
  }
  else
  {
    if (((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFD8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
  }
  if (a2 > v6)
  {
    if (((((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFD8)
    {
      v10 = ~v6 + a2;
      bzero(a1, ((((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 40);
      *a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_21FFA1F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a2)
  {
    if (a3 < 0x7FFFFFFE)
    {
      v8 = (_QWORD *)((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
      if (a2 > 0x7FFFFFFE)
      {
        v8[2] = 0;
        v8[3] = 0;
        *v8 = (a2 - 0x7FFFFFFF);
        v8[1] = 0;
      }
      else
      {
        v8[2] = a2;
      }
    }
    else
    {
      return __swift_storeEnumTagSinglePayload(v5, a2, a3, a4);
    }
  }
  return result;
}

uint64_t sub_21FFA1FA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FFA1FDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_21FFC3D10();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FFC3A40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558FAE8);
  v4 = swift_dynamicCast();
  if ((_DWORD)v4)
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

void sub_21FFA2098(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD v16[5];
  uint64_t v17;
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
  _QWORD v31[3];

  v23 = a2;
  v21 = *(_QWORD *)(a1 - 8);
  v22 = *(_QWORD *)(v21 + 64);
  v3 = MEMORY[0x24BDAC7A8](a1);
  v20 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v16[3] = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v5 + 32);
  v17 = *(_QWORD *)(v5 + 24);
  v7 = v17;
  v10 = v9;
  v16[4] = v8;
  v12 = _s11ArtworkViewVMa(255, v9, v8, v11);
  v13 = sub_21FFC419C();
  v14 = sub_21FFC5AC8();
  v15 = *(_QWORD *)(a1 + 40);
  v31[0] = MEMORY[0x2207DB4B4](&unk_21FFCA0A0, v12);
  v31[1] = MEMORY[0x24BDECC60];
  v30 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v13, v31);
  v19 = v14;
  v18 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5578], v14, &v30);
  v24 = v10;
  v25 = v7;
  v26 = v14;
  v27 = v8;
  v28 = v15;
  v29 = v18;
  _s9HItemCellVMa();
}

void sub_21FFA2204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  void (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;

  v15 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v14 - 344) = a1;
  *(_QWORD *)(v14 - 280) = v15;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v16);
  *(_QWORD *)(v14 - 352) = (char *)&a9 - v17;
  v18 = sub_21FFC419C();
  v19 = *(_QWORD *)(v18 - 8);
  *(_QWORD *)(v14 - 296) = v18;
  *(_QWORD *)(v14 - 248) = v19;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v14 - 336) = (char *)&a9 - v21;
  v22 = sub_21FFC419C();
  v23 = *(_QWORD *)(v22 - 8);
  *(_QWORD *)(v14 - 264) = v22;
  *(_QWORD *)(v14 - 240) = v23;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v24);
  *(_QWORD *)(v14 - 320) = (char *)&a9 - v25;
  v26 = sub_21FFC419C();
  *(_QWORD *)(v14 - 272) = v26;
  *(_QWORD *)(v14 - 232) = *(_QWORD *)(v26 - 8);
  v27 = MEMORY[0x24BDAC7A8](v26);
  *(_QWORD *)(v14 - 288) = (char *)&a9 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  *(_QWORD *)(v14 - 256) = (char *)&a9 - v29;
  v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v31 = *(_QWORD *)(v14 - 216);
  *(_QWORD *)(v14 - 416) = v13;
  v30(v11, v31, v13);
  v32 = *(int *)(v9 + 56);
  v33 = v31 + *(int *)(v9 + 52);
  v34 = *(_QWORD *)(v33 + 8);
  v35 = *(_QWORD *)(v33 + 16);
  v36 = *(_QWORD *)(v33 + 24);
  *(_BYTE *)(v14 - 160) = *(_BYTE *)v33;
  *(_QWORD *)(v14 - 152) = v34;
  *(_QWORD *)(v14 - 144) = v35;
  *(_QWORD *)(v14 - 136) = v36;
  v37 = *(_QWORD *)(v31 + v32 + 8);
  *(_QWORD *)(v14 - 400) = *(_QWORD *)(v31 + v32);
  *(_QWORD *)(v14 - 408) = v37;
  v38 = *(_QWORD *)(v14 - 312);
  v39 = *(_QWORD *)(v14 - 328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v39, v31, v9);
  v40 = (*(unsigned __int8 *)(v38 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  v41 = (char *)swift_allocObject();
  *((_QWORD *)v41 + 2) = v13;
  v42 = *(_QWORD *)(v14 - 384);
  *((_QWORD *)v41 + 3) = *(_QWORD *)(v14 - 376);
  *((_QWORD *)v41 + 4) = v42;
  *((_QWORD *)v41 + 5) = v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(&v41[v40], v39, v9);
  swift_bridgeObjectRetain();
  sub_21FF0E594(v36);
  swift_bridgeObjectRetain();
  sub_21FF7A384();
}

void sub_21FFA24B8()
{
  OUTLINED_FUNCTION_44_1();
}

void sub_21FFA24E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_21FFC4E50();
  sub_21FFC4B08();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 280) + 8))(v1, v2);
  sub_21FFC4760();
  v4 = MEMORY[0x24BDEDBB8];
  *(_QWORD *)(v3 - 176) = a1;
  *(_QWORD *)(v3 - 168) = v4;
  OUTLINED_FUNCTION_49();
}

void sub_21FFA2588(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = *(_QWORD *)(v4 - 320);
  sub_21FFC4B50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 248) + 8))(v3, v1);
  sub_21FFC476C();
  *(_QWORD *)(v4 - 192) = a1;
  v7 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v4 - 184) = MEMORY[0x24BDECC60];
  v8 = *(_QWORD *)(v4 - 264);
  v9 = MEMORY[0x2207DB4B4](v2, v8, v4 - 192);
  sub_21FFC4B50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 240) + 8))(v6, v8);
  *(_QWORD *)(v4 - 208) = v9;
  *(_QWORD *)(v4 - 200) = v7;
  OUTLINED_FUNCTION_44_1();
}

void sub_21FFA2654()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(v2 - 256);
  sub_21FFB5D18(v1, v0, v3);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 232) + 8);
  v4(v1, v0);
  sub_21FFB57EC(v3, v0, *(_QWORD *)(v2 - 224));
  v4(v3, v0);
  OUTLINED_FUNCTION_24();
}

void sub_21FFA26B0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
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
  _QWORD v21[22];

  v21[9] = a6;
  v21[1] = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v21[3] = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _s11ArtworkViewVMa(0, v11, v12, v12);
  v21[4] = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v14 = sub_21FFC419C();
  v21[6] = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v21[2] = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v21[5] = (char *)v21 - v17;
  v18 = sub_21FFC5AC8();
  v21[7] = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  MEMORY[0x24BDAC7A8](v19);
  v21[8] = (char *)v21 - v20;
  v21[17] = a2;
  v21[18] = a3;
  v21[19] = a4;
  v21[20] = a5;
  _s16SearchResultCellVMa();
}

uint64_t sub_21FFA2838()
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
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);

  if ((sub_21FFA1FDC() & 1) != 0)
  {
    __swift_storeEnumTagSinglePayload(v5, 1, 1, v3);
    *(_QWORD *)(v7 - 176) = MEMORY[0x2207DB4B4](&unk_21FFCA0A0, v2);
    v8 = MEMORY[0x24BDECC60];
    *(_QWORD *)(v7 - 168) = MEMORY[0x24BDECC60];
    MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v3, v7 - 176);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 248) + 16))(*(_QWORD *)(v7 - 232), v1, v0);
    sub_21FF89BA4();
    sub_21FFC476C();
    v9 = MEMORY[0x2207DB4B4](&unk_21FFCA0A0, v2);
    v10 = *(_QWORD *)(v7 - 240);
    sub_21FFC4B50();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 224) + 8))(v6, v2);
    *(_QWORD *)(v7 - 136) = v9;
    v8 = MEMORY[0x24BDECC60];
    *(_QWORD *)(v7 - 128) = MEMORY[0x24BDECC60];
    MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v3, v7 - 136);
    v11 = *(_QWORD *)(v7 - 216);
    sub_21FFB5D18(v10, v3, v11);
    v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 208) + 8);
    v12(v10, v3);
    sub_21FFB57EC(v11, v3, v5);
    v12(v11, v3);
    __swift_storeEnumTagSinglePayload(v5, 0, 1, v3);
  }
  v13 = *(_QWORD *)(v7 - 192);
  sub_21FF47E70(v5, v13);
  v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 200) + 8);
  v14(v5, v4);
  *(_QWORD *)(v7 - 152) = MEMORY[0x2207DB4B4](&unk_21FFCA0A0, v2);
  *(_QWORD *)(v7 - 144) = v8;
  *(_QWORD *)(v7 - 160) = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v3, v7 - 152);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF5578], v4, v7 - 160);
  sub_21FFB57EC(v13, v4, *(_QWORD *)(v7 - 184));
  return ((uint64_t (*)(uint64_t, uint64_t))v14)(v13, v4);
}

BOOL sub_21FFA2A5C(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[2];
  uint64_t v6;
  _OWORD v7[2];
  uint64_t v8;

  v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v8 = *(_QWORD *)(a2 + 32);
  return sub_21FF19E78((double *)v5, (double *)v7);
}

void sub_21FFA2AB4()
{
  OUTLINED_FUNCTION_2_16();
}

uint64_t sub_21FFA2ADC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v4 = v1 + ((v3 + 48) & ~v3);
  (*(void (**)(uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v4);
  v5 = v4 + *(int *)(a1 + 52);
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v5 + 24));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21FFA2B68()
{
  _s16SearchResultCellVMa();
}

void sub_21FFA2BA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  sub_21FFA26B0(v2 + ((v7 + 48) & ~v7), v3, v4, v5, v6, v1);
}

void _s16SearchResultCellV9ConstantsVMa()
{
  JUMPOUT(0x2207DB418);
}

void sub_21FFA2BEC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = _s11ArtworkViewVMa(255, *a1, a1[2], a4);
  OUTLINED_FUNCTION_38_4();
  sub_21FFC5AC8();
  MEMORY[0x2207DB4B4](&unk_21FFCA0A0, v4);
  OUTLINED_FUNCTION_49();
}

void sub_21FFA2C78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 72) = a1;
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF5578], v1, v2 - 72);
  _s9HItemCellVMa();
}

void sub_21FFA2CB4()
{
  sub_21FFC419C();
  OUTLINED_FUNCTION_38_4();
  OUTLINED_FUNCTION_38_4();
  OUTLINED_FUNCTION_49();
}

void sub_21FFA2CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;

  a17 = a1;
  a18 = MEMORY[0x24BDEDBB8];
  MEMORY[0x2207DB4B4](v18, v19, &a17);
  OUTLINED_FUNCTION_44_1();
}

uint64_t sub_21FFA2D28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = a1;
  v6 = v3;
  return MEMORY[0x2207DB4B4](v1, v2, &v5);
}

void sub_21FFA2D54()
{
  JUMPOUT(0x2207DB4B4);
}

void OUTLINED_FUNCTION_2_16()
{
  _s16SearchResultCellVMa();
}

void sub_21FFA2D70()
{
  _s15LibraryMenuCellVMa();
}

uint64_t sub_21FFA2DE8(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t (*v13)(uint64_t);

  v9 = v7 + *(int *)(a1 + 80);
  *(_OWORD *)v9 = xmmword_21FFCB0E0;
  *(_QWORD *)(v9 + 16) = 0x4022000000000000;
  *(_QWORD *)v7 = v6;
  *(_QWORD *)(v7 + 8) = v5;
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v3;
  *(_QWORD *)(v7 + 32) = v2;
  *(_QWORD *)(v7 + 40) = v8;
  *(_BYTE *)(v7 + 48) = v12;
  *(_BYTE *)(v7 + 49) = v1;
  v10 = v7 + *(int *)(a1 + 76);
  sub_21FFC50D8();
  return v13(v10);
}

void _s15LibraryMenuCellVMa()
{
  JUMPOUT(0x2207DB418);
}

uint64_t sub_21FFA2E6C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21FFC50E4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_21FFA2F08(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    v9 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v9;
    *(_WORD *)(a1 + 48) = *((_WORD *)a2 + 24);
    v10 = *(int *)(a3 + 76);
    v11 = a1 + v10;
    v12 = (uint64_t)a2 + v10;
    v13 = sub_21FFC50E4();
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    v15 = *(int *)(a3 + 80);
    v16 = (char *)v4 + v15;
    v17 = (uint64_t)a2 + v15;
    *(_OWORD *)v16 = *(_OWORD *)v17;
    *((_QWORD *)v16 + 2) = *(_QWORD *)(v17 + 16);
  }
  return v4;
}

uint64_t sub_21FFA3008(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 76);
  v5 = sub_21FFC50E4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_21FFA3068(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  v9 = *(int *)(a3 + 76);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_21FFC50E4();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  v14 = *(int *)(a3 + 80);
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_OWORD *)v15 = *(_OWORD *)v16;
  *(_QWORD *)(v15 + 16) = *(_QWORD *)(v16 + 16);
  return a1;
}

uint64_t sub_21FFA313C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

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
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  v6 = *(int *)(a3 + 76);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_21FFC50E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 80);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  return a1;
}

uint64_t sub_21FFA323C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  v7 = *(int *)(a3 + 76);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_21FFC50E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(a3 + 80);
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v13 + 16);
  return a1;
}

uint64_t sub_21FFA32DC(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  v9 = *(int *)(a3 + 76);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_21FFC50E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = *(int *)(a3 + 80);
  v14 = a1 + v13;
  v15 = a2 + v13;
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_QWORD *)(v14 + 16) = *(_QWORD *)(v15 + 16);
  return a1;
}

uint64_t sub_21FFA33A4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFA33B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21FFC50E4();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 76), a2, v8);
  }
}

uint64_t sub_21FFA342C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFA3438(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_21FFC50E4();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 76), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21FFA34AC()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21FFA34E8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char v37[8];
  char v38[16];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];
  uint64_t v43;

  v35 = a2;
  v27 = sub_21FFC4DC0();
  OUTLINED_FUNCTION_10_5(*(_QWORD *)(v27 - 8));
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_95(v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E188);
  v6 = OUTLINED_FUNCTION_1_24(v5, (uint64_t)v37);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_95(v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558FF58);
  v9 = OUTLINED_FUNCTION_1_24(v8, (uint64_t)&v43);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_95(v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558FF50);
  v12 = OUTLINED_FUNCTION_1_24(v11, (uint64_t)v42);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_104_0();
  v34 = v13;
  MEMORY[0x24BDAC7A8](v14);
  v36 = (char *)&v26 - v15;
  v16 = sub_21FFC44D8();
  v17 = *(_QWORD *)(v16 - 8);
  v28 = v16;
  OUTLINED_FUNCTION_10_5(v17);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_0_7();
  v33 = v19;
  v20 = sub_21FFC41FC();
  v21 = OUTLINED_FUNCTION_1_24(v20, (uint64_t)v38);
  MEMORY[0x24BDAC7A8](v21);
  v29 = _s8MenuCellVMa();
  v22 = a1;
  v32 = a1;
  v24 = a1[2];
  v23 = a1[3];
  v25 = v22[4];
  v31 = v22[5];
  v30 = v22[6];
  v39 = v24;
  v40 = v23;
  v41 = v25;
  v42[0] = v31;
  v42[1] = v30;
  _s25LibrarySectionContentViewVMa();
}

uint64_t sub_21FFA36D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t OpaqueTypeConformance2;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE v62[128];

  *(_QWORD *)(v9 - 504) = a1;
  sub_21FF38EA0(&qword_2555915A0, v2, (uint64_t)&unk_21FFCC1D8);
  v12 = v11;
  *(_QWORD *)(v9 - 512) = v11;
  v13 = MEMORY[0x2207DB4B4](&unk_21FFCBDB0, a1);
  *(_QWORD *)(v9 - 520) = v13;
  *(_QWORD *)(v9 - 160) = v7;
  *(_QWORD *)(v9 - 152) = a1;
  *(_QWORD *)(v9 - 144) = v12;
  *(_QWORD *)(v9 - 136) = v13;
  v14 = sub_21FFC4130();
  OUTLINED_FUNCTION_0_21(*(_QWORD *)(v14 - 8));
  MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v9 - 544) = &v62[-v16];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E548);
  v17 = sub_21FFC419C();
  OUTLINED_FUNCTION_0_21(*(_QWORD *)(v17 - 8));
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_95((uint64_t)&v62[-v19]);
  v20 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEC8E0], v14);
  *(_QWORD *)(v9 - 536) = v20;
  v21 = sub_21FFA40D4();
  *(_QWORD *)(v9 - 176) = v20;
  *(_QWORD *)(v9 - 168) = v21;
  v22 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v17, v9 - 176);
  sub_21FF38EA0((unint64_t *)&qword_25558E558, v6, MEMORY[0x24BDEF420]);
  v24 = v23;
  *(_QWORD *)(v9 - 160) = v17;
  *(_QWORD *)(v9 - 152) = v8;
  *(_QWORD *)(v9 - 144) = v22;
  *(_QWORD *)(v9 - 136) = v23;
  v25 = MEMORY[0x2207DB460](0, v9 - 160, MEMORY[0x24BDF2380], 0);
  *(_QWORD *)(v9 - 464) = v25;
  OUTLINED_FUNCTION_10_5(*(_QWORD *)(v25 - 8));
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_104_0();
  *(_QWORD *)(v9 - 400) = v27;
  v29 = MEMORY[0x24BDAC7A8](v28);
  v31 = &v62[-v30];
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_95((uint64_t)&v62[-v32]);
  *(_QWORD *)(v9 - 256) = v5;
  *(_QWORD *)(v9 - 248) = v1;
  v33 = *(_QWORD *)(v9 - 472);
  *(_QWORD *)(v9 - 240) = v4;
  *(_QWORD *)(v9 - 232) = v33;
  v34 = *(_QWORD *)(v9 - 480);
  v35 = *(_QWORD *)(v9 - 352);
  *(_QWORD *)(v9 - 224) = v34;
  *(_QWORD *)(v9 - 216) = v35;
  *(_QWORD *)(v9 - 320) = v5;
  *(_QWORD *)(v9 - 312) = v1;
  *(_QWORD *)(v9 - 304) = v4;
  *(_QWORD *)(v9 - 296) = v33;
  *(_QWORD *)(v9 - 288) = v34;
  *(_QWORD *)(v9 - 280) = v35;
  v36 = v35;
  sub_21FF94A04((uint64_t)sub_21FFA4118);
  v37 = v36 + *(int *)(*(_QWORD *)(v9 - 448) + 80);
  *(_QWORD *)(v9 - 448) = v37;
  v38 = *(_QWORD *)(v37 + 16);
  v39 = (char *)v3 + *(int *)(*(_QWORD *)(v9 - 432) + 20);
  v40 = *MEMORY[0x24BDEEB68];
  v41 = sub_21FFC443C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 104))(v39, v40, v41);
  *v3 = v38;
  v3[1] = v38;
  sub_21FF38EA0((unint64_t *)&qword_25558E738, (uint64_t (*)(uint64_t))MEMORY[0x24BDED998], MEMORY[0x24BDED990]);
  sub_21FF0E140();
  v42 = *(_QWORD *)(v9 - 488);
  v43 = *(_QWORD *)(v9 - 544);
  sub_21FFC49D0();
  sub_21FF2EC8C((uint64_t)v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 440) + 8))(v43, v14);
  v44 = *(_QWORD *)(v9 - 416);
  v45 = *(_QWORD *)(v9 - 528);
  sub_21FF9113C();
  sub_21FF0E148();
  sub_21FFC4994();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 408) + 8))(v44, v45);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 424) + 8))(v42, v17);
  *(_QWORD *)(v9 - 160) = v17;
  *(_QWORD *)(v9 - 152) = v45;
  *(_QWORD *)(v9 - 144) = v22;
  *(_QWORD *)(v9 - 136) = v24;
  v46 = *(_QWORD *)(v9 - 464);
  v47 = 1;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_21FFB5D18((uint64_t)v31, v46, *(_QWORD *)(v9 - 344));
  v49 = *(_QWORD *)(v9 - 456);
  OUTLINED_FUNCTION_9_13((uint64_t)v31);
  if ((*(_BYTE *)(*(_QWORD *)(v9 - 352) + 48) & 1) == 0)
  {
    v50 = *(_QWORD *)(v9 - 584);
    sub_21FFC4DB4();
    sub_21FFC4760();
    sub_21FFC3F80();
    OUTLINED_FUNCTION_4_8();
    v51 = *(_QWORD *)(v9 - 568);
    v52 = *(_QWORD *)(v9 - 552);
    v53 = *(_QWORD *)(v9 - 560);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16))(v52, v50, v53);
    OUTLINED_FUNCTION_7_14(v52 + *(int *)(*(_QWORD *)(v9 - 592) + 36));
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v53);
    sub_21FFC476C();
    sub_21FFC3F80();
    OUTLINED_FUNCTION_4_8();
    v54 = *(_QWORD *)(v9 - 576);
    sub_21FF5A2F4(v52, v54, &qword_25558E188);
    OUTLINED_FUNCTION_7_14(v54 + *(int *)(*(_QWORD *)(v9 - 360) + 36));
    sub_21FF103AC(v52, &qword_25558E188);
    sub_21FF6597C(v54, *(_QWORD *)(v9 - 368));
    v47 = 0;
  }
  v55 = *(_QWORD *)(v9 - 368);
  __swift_storeEnumTagSinglePayload(v55, v47, 1, *(_QWORD *)(v9 - 360));
  v56 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
  v57 = *(_QWORD *)(v9 - 400);
  v58 = *(_QWORD *)(v9 - 344);
  v56(v57, v58, v46);
  *(_QWORD *)(v9 - 160) = v57;
  v59 = *(_QWORD *)(v9 - 384);
  sub_21FF5A2F4(v55, v59, &qword_25558FF50);
  *(_QWORD *)(v9 - 152) = v59;
  v60 = *(_QWORD *)(v9 - 392);
  *(_QWORD *)(v9 - 192) = v46;
  *(_QWORD *)(v9 - 184) = v60;
  *(_QWORD *)(v9 - 208) = OpaqueTypeConformance2;
  *(_QWORD *)(v9 - 200) = sub_21FF65A08();
  sub_21FF51C7C(v9 - 160, 2, v9 - 192);
  sub_21FF103AC(v55, &qword_25558FF50);
  OUTLINED_FUNCTION_9_13(v58);
  sub_21FF103AC(v59, &qword_25558FF50);
  return OUTLINED_FUNCTION_9_13(v57);
}

void sub_21FFA3CE0(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[16];

  v13[1] = a4;
  v13[9] = a6;
  v11 = sub_21FFC50E4();
  v13[6] = *(_QWORD *)(v11 - 8);
  v13[7] = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13[5] = (char *)v13 - v12;
  v13[11] = a1;
  v13[12] = a2;
  v13[2] = a2;
  v13[13] = a3;
  v13[14] = a4;
  v13[15] = a5;
  _s25LibrarySectionContentViewVMa();
}

void sub_21FFA3D7C(uint64_t a1)
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

  *(_QWORD *)(v6 - 144) = *(_QWORD *)(a1 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  MEMORY[0x24BDAC7A8](v7);
  v8 = *v1;
  *(_QWORD *)(v6 - 184) = v1[4];
  *(_QWORD *)(v6 - 176) = v8;
  *(_BYTE *)(v6 - 121) = *((_BYTE *)v1 + 49);
  *(_QWORD *)(v6 - 120) = v2;
  *(_QWORD *)(v6 - 112) = v5;
  v9 = *(_QWORD *)(v6 - 200);
  *(_QWORD *)(v6 - 104) = v3;
  *(_QWORD *)(v6 - 96) = v9;
  *(_QWORD *)(v6 - 88) = v4;
  _s15LibraryMenuCellVMa();
}

void sub_21FFA3DFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v2 - 160) + 16))(*(_QWORD *)(v2 - 168), v1 + *(int *)(a1 + 76), *(_QWORD *)(v2 - 152));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21FFA7FCC();
}

uint64_t sub_21FFA3E5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);

  MEMORY[0x2207DB4B4](&unk_21FFCBDB0, v0);
  sub_21FFB5D18(v2, v0, v1);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8);
  v4(v2, v0);
  sub_21FFB57EC(v1, v0, *(_QWORD *)(v3 - 136));
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(v1, v0);
}

uint64_t sub_21FFA3EDC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t result;

  v4 = *a1;
  v3 = a1[1];
  v6 = a1[2];
  v5 = a1[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = sub_21FFC4820();
  *(_OWORD *)(a2 + 40) = xmmword_21FFCA470;
  *(_OWORD *)(a2 + 56) = xmmword_21FFCB0F0;
  *(_QWORD *)(a2 + 72) = v7;
  v8 = (uint64_t *)(a2 + *(int *)(_s8MenuCellVMa() + 32));
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(qword_2555915A8);
  result = swift_storeEnumTagMultiPayload();
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v5;
  *(_BYTE *)(a2 + 32) = 0;
  return result;
}

uint64_t sub_21FFA3F88()
{
  sub_21FFC5CF0();
  sub_21FF8FEF4();
  return sub_21FFC5D20();
}

BOOL sub_21FFA4024(double *a1, double *a2)
{
  return sub_21FF8FED8(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_21FFA4048()
{
  return sub_21FFA3F88();
}

uint64_t sub_21FFA4064()
{
  return sub_21FF8FEF4();
}

uint64_t sub_21FFA4080()
{
  sub_21FFC5CF0();
  sub_21FF8FEF4();
  return sub_21FFC5D20();
}

unint64_t sub_21FFA40D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25558E550;
  if (!qword_25558E550)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E548);
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDEFAD8], v1);
    atomic_store(result, (unint64_t *)&qword_25558E550);
  }
  return result;
}

uint64_t sub_21FFA4118()
{
  return sub_21FFA4130((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FFA3CE0);
}

uint64_t sub_21FFA4124()
{
  return sub_21FFA4130((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FFA3EDC);
}

uint64_t sub_21FFA4130(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[7], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_21FFA4144()
{
  return sub_21FFC42A4();
}

uint64_t sub_21FFA4164(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_21FFC4454();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_21FFC42B0();
}

void _s15LibraryMenuCellV9ConstantsVMa()
{
  JUMPOUT(0x2207DB418);
}

void sub_21FFA41F0()
{
  _s8MenuCellVMa();
  _s25LibrarySectionContentViewVMa();
}

uint64_t sub_21FFA4238(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_21FF38EA0(&qword_2555915A0, v2, (uint64_t)&unk_21FFCC1D8);
  v14 = v1;
  v15 = a1;
  v16 = v4;
  v17 = MEMORY[0x2207DB4B4](&unk_21FFCBDB0, a1);
  v5 = sub_21FFC4130();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E548);
  v6 = sub_21FFC419C();
  v7 = sub_21FFC44D8();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEF428];
  v13[0] = MEMORY[0x2207DB4B4](MEMORY[0x24BDEC8E0], v5);
  v13[1] = sub_21FFA40D4();
  v9 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v6, v13);
  sub_21FF38EA0((unint64_t *)&qword_25558E558, v8, MEMORY[0x24BDEF420]);
  v14 = v6;
  v15 = v7;
  v16 = v9;
  v17 = v10;
  MEMORY[0x2207DB460](255, &v14, MEMORY[0x24BDF2380], 0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558FF50);
  swift_getTupleTypeMetadata2();
  v11 = sub_21FFC4EBC();
  return MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v11);
}

void sub_21FFA4378()
{
  JUMPOUT(0x2207DB4B4);
}

uint64_t OUTLINED_FUNCTION_1_24@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

void OUTLINED_FUNCTION_7_14(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = 0;
}

uint64_t OUTLINED_FUNCTION_9_13(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_21FFA43CC()
{
  sub_21FFA6528();
  return sub_21FFC4394();
}

void sub_21FFA4400()
{
  sub_21FFA43CC();
  OUTLINED_FUNCTION_31();
}

void sub_21FFA441C(uint64_t a1)
{
  _BYTE v1[40];

  sub_21FFA64E0(a1, (uint64_t)v1);
  sub_21FFA444C((uint64_t)v1);
  OUTLINED_FUNCTION_13_11();
}

void sub_21FFA444C(uint64_t a1)
{
  _BYTE v2[40];

  sub_21FFA64E0(a1, (uint64_t)v2);
  sub_21FFA6528();
  sub_21FFC43A0();
  sub_21FF103AC(a1, &qword_25558E0E0);
  OUTLINED_FUNCTION_13_11();
}

void static MusicPicker.PageID.== infix(_:_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_21FFC37F4();
  v3 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

void sub_21FFA4540()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  unint64_t v7;

  if (v0 >> 61)
  {
    swift_retain();
    v7 = v0;
LABEL_5:
    sub_21FF0E594(v7);
    OUTLINED_FUNCTION_9_14();
    goto LABEL_6;
  }
  if (*(unsigned __int8 *)(v1 + 16) != *(unsigned __int8 *)(v0 + 16))
  {
    sub_21FF0E594(v0);
    v7 = v1;
    goto LABEL_5;
  }
  v3 = *(_OWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 48);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v2 - 112) = *(_BYTE *)(v1 + 24);
  *(_OWORD *)(v2 - 104) = v3;
  *(_QWORD *)(v2 - 88) = v4;
  *(_BYTE *)(v2 - 144) = v6;
  *(_OWORD *)(v2 - 136) = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v2 - 120) = v5;
  sub_21FF0E594(v0);
  sub_21FF0E594(v1);
  OUTLINED_FUNCTION_17_5();
  OUTLINED_FUNCTION_9_14();
LABEL_6:
  OUTLINED_FUNCTION_24();
}

uint64_t static MusicPicker.Click.SourceContext.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  char v9;
  uint64_t v11;
  uint64_t v12;

  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2)
    goto LABEL_11;
  v3 = a1[2];
  v4 = a1[3];
  v5 = a2[2];
  v6 = a2[3];
  if (!v3)
  {
    if (!v5)
    {
LABEL_12:
      v11 = v6;
      v12 = v4;
      v9 = static MusicPicker.PageID.== infix(_:_:)(&v12, &v11);
      return v9 & 1;
    }
LABEL_11:
    v9 = 0;
    return v9 & 1;
  }
  if (!v5)
    goto LABEL_11;
  if (a1[1] == a2[1] && v3 == v5)
    goto LABEL_12;
  v8 = sub_21FFC5C90();
  v9 = 0;
  if ((v8 & 1) != 0)
    goto LABEL_12;
  return v9 & 1;
}

void MusicPicker.PageID.hash(into:)()
{
  uint64_t v1;

  v1 = sub_21FFC37F4();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_1_13();
  __asm { BR              X10 }
}

unint64_t sub_21FFA4914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  OUTLINED_FUNCTION_5_11();
  sub_21FFC5CFC();
  sub_21FFC5CFC();
  OUTLINED_FUNCTION_6_9();
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_21FF0E594(v3);
    swift_bridgeObjectRetain();
    sub_21FFC57EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21FF0E594(v3);
  }
  *(_QWORD *)(v1 - 88) = v3;
  OUTLINED_FUNCTION_16_10();
  swift_bridgeObjectRelease();
  return sub_21FF0EAB8(v3);
}

void MusicPicker.PageID.hashValue.getter()
{
  sub_21FFC5CF0();
  MusicPicker.PageID.hash(into:)();
  sub_21FFC5D20();
  OUTLINED_FUNCTION_1_18();
}

uint64_t sub_21FFA4B54()
{
  sub_21FFC5CF0();
  MusicPicker.PageID.hash(into:)();
  return sub_21FFC5D20();
}

void MusicPicker.Click.SourceContext.controlKind.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t MusicPicker.Click.SourceContext.sectionTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t MusicPicker.Click.SourceContext.pageID.getter@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = v2;
  return sub_21FF0E594(v2);
}

void MusicPicker.Click.SourceContext.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_6_9();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21FFC57EC();
    swift_bridgeObjectRelease();
  }
  MusicPicker.PageID.hash(into:)();
  OUTLINED_FUNCTION_13_11();
}

uint64_t MusicPicker.Click.SourceContext.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  OUTLINED_FUNCTION_7_9();
  sub_21FFC5CFC();
  sub_21FFC5D08();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21FFC57EC();
    swift_bridgeObjectRelease();
  }
  MusicPicker.PageID.hash(into:)();
  return OUTLINED_FUNCTION_6_3();
}

uint64_t sub_21FFA4D0C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_21FFC5CF0();
  sub_21FFC5CFC();
  sub_21FFC5D08();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21FFC57EC();
    swift_bridgeObjectRelease();
  }
  MusicPicker.PageID.hash(into:)();
  return sub_21FFC5D20();
}

void static MusicPicker.Click.ControlID.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = sub_21FFC5234();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_1_25();
  OUTLINED_FUNCTION_1_5();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591660);
  OUTLINED_FUNCTION_1_5();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 + *(int *)(v8 + 48) - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FFA5224(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21FFA5224(a2, (uint64_t)v10);
  v11 = (char *)sub_21FFA4ED8 + 4 * byte_21FFCB2AA[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_21FFA4ED8()
{
  uint64_t v0;
  uint64_t v1;

  sub_21FFA5224(v0, v1);
  if (OUTLINED_FUNCTION_4_9())
    sub_21FF103AC(v0, &qword_255591660);
  else
    sub_21FF9E438(v0);
  OUTLINED_FUNCTION_24();
}

void MusicPicker.Click.ControlID.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;

  v2 = sub_21FFC5234();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_1_25();
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1_13();
  sub_21FFA5224(v0, v1);
  v4 = (char *)sub_21FFA506C + 4 * byte_21FFCB2AE[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_21FFA506C()
{
  sub_21FFC5CFC();
  return sub_21FFC5CFC();
}

void MusicPicker.Click.ControlID.hashValue.getter()
{
  OUTLINED_FUNCTION_7_9();
  MusicPicker.Click.ControlID.hash(into:)();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_1_18();
}

uint64_t sub_21FFA5144()
{
  sub_21FFC5CF0();
  MusicPicker.Click.ControlID.hash(into:)();
  return sub_21FFC5D20();
}

void *static MusicPicker.Click.LibraryMenuItemID.allCases.getter()
{
  return &unk_24E5CB2E0;
}

void sub_21FFA518C(_QWORD *a1@<X8>)
{
  *a1 = &unk_24E5CB2E0;
}

void *static MusicPicker.Click.SearchGroupID.allCases.getter()
{
  return &unk_24E5CB308;
}

void sub_21FFA51BC(_QWORD *a1@<X8>)
{
  *a1 = &unk_24E5CB308;
}

void *static MusicPicker.Click.ControlKind.allCases.getter()
{
  return &unk_24E5CB338;
}

void sub_21FFA51DC(_QWORD *a1@<X8>)
{
  *a1 = &unk_24E5CB338;
}

uint64_t type metadata accessor for MusicPicker.Click.ControlID()
{
  uint64_t result;

  result = qword_255591760;
  if (!qword_255591760)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21FFA5224(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MusicPicker.Click.ControlID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

BOOL static MusicPicker.Click.ActionKind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void MusicPicker.Click.ActionKind.hash(into:)()
{
  sub_21FFC5CFC();
  OUTLINED_FUNCTION_31();
}

void *static MusicPicker.Click.ActionKind.allCases.getter()
{
  return &unk_24E5CB360;
}

void _s25_MusicKitInternal_SwiftUI0A6PickerV5ClickV17LibraryMenuItemIDO9hashValueSivg_0()
{
  OUTLINED_FUNCTION_7_9();
  OUTLINED_FUNCTION_10_8();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_1_18();
}

void sub_21FFA52D8(_QWORD *a1@<X8>)
{
  *a1 = &unk_24E5CB360;
}

void sub_21FFA52E8()
{
  sub_21FFC5CF0();
  OUTLINED_FUNCTION_10_8();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_1_18();
}

uint64_t static MusicPicker.Click.== infix(_:_:)()
{
  return 1;
}

void MusicPicker.Click.hashValue.getter()
{
  OUTLINED_FUNCTION_7_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_1_18();
}

void sub_21FFA5340()
{
  MusicPicker.Click.hashValue.getter();
}

uint64_t sub_21FFA5354()
{
  sub_21FFC5CF0();
  return sub_21FFC5D20();
}

double sub_21FFA5384()
{
  double result;

  qword_255591650 = 0;
  result = 0.0;
  xmmword_255591630 = 0u;
  unk_255591640 = 0u;
  return result;
}

__int128 *sub_21FFA539C()
{
  if (qword_25558DF20 != -1)
    swift_once();
  return &xmmword_255591630;
}

uint64_t sub_21FFA53DC@<X0>(uint64_t a1@<X8>)
{
  __int128 *v2;

  v2 = sub_21FFA539C();
  return sub_21FFA64E0((uint64_t)v2, a1);
}

void View.musicPickerUserExperienceObserver<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9[5];

  swift_getKeyPath();
  v9[3] = a3;
  v9[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v9);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))(boxed_opaque_existential_1, a1, a3);
  sub_21FFC4988();
  swift_release();
  sub_21FF103AC((uint64_t)v9, &qword_25558E0E0);
}

void sub_21FFA54B4()
{
  sub_21FFA43CC();
  OUTLINED_FUNCTION_31();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

unint64_t sub_21FFA5514()
{
  unint64_t result;

  result = qword_255591670;
  if (!qword_255591670)
  {
    result = MEMORY[0x2207DB4B4](&protocol conformance descriptor for MusicPicker.PageID, &type metadata for MusicPicker.PageID);
    atomic_store(result, (unint64_t *)&qword_255591670);
  }
  return result;
}

unint64_t sub_21FFA5554()
{
  unint64_t result;

  result = qword_255591678;
  if (!qword_255591678)
  {
    result = MEMORY[0x2207DB4B4](&protocol conformance descriptor for MusicPicker.Click.SourceContext, &type metadata for MusicPicker.Click.SourceContext);
    atomic_store(result, (unint64_t *)&qword_255591678);
  }
  return result;
}

void sub_21FFA5590()
{
  sub_21FF0F7EC(&qword_255591680, (void (*)(uint64_t))type metadata accessor for MusicPicker.Click.ControlID);
}

void sub_21FFA55BC()
{
  sub_21FF1034C(&qword_255591688, &qword_255591690);
}

unint64_t sub_21FFA55EC()
{
  unint64_t result;

  result = qword_255591698;
  if (!qword_255591698)
  {
    result = MEMORY[0x2207DB4B4](&protocol conformance descriptor for MusicPicker.Click.LibraryMenuItemID, &type metadata for MusicPicker.Click.LibraryMenuItemID);
    atomic_store(result, (unint64_t *)&qword_255591698);
  }
  return result;
}

void sub_21FFA5628()
{
  sub_21FF1034C(&qword_2555916A0, &qword_2555916A8);
}

unint64_t sub_21FFA5658()
{
  unint64_t result;

  result = qword_2555916B0;
  if (!qword_2555916B0)
  {
    atomic_store(result, (unint64_t *)&qword_2555916B0);
  }
  return result;
}

void sub_21FFA5694()
{
  sub_21FF1034C(&qword_2555916B8, &qword_2555916C0);
}

unint64_t sub_21FFA56C4()
{
  unint64_t result;

  result = qword_2555916C8;
  if (!qword_2555916C8)
  {
    result = MEMORY[0x2207DB4B4](&protocol conformance descriptor for MusicPicker.Click.ControlKind, &type metadata for MusicPicker.Click.ControlKind);
    atomic_store(result, (unint64_t *)&qword_2555916C8);
  }
  return result;
}

void sub_21FFA5700()
{
  sub_21FF1034C(&qword_2555916D0, &qword_2555916D8);
}

unint64_t sub_21FFA5730()
{
  unint64_t result;

  result = qword_2555916E0;
  if (!qword_2555916E0)
  {
    result = MEMORY[0x2207DB4B4](&protocol conformance descriptor for MusicPicker.Click.ActionKind, &type metadata for MusicPicker.Click.ActionKind);
    atomic_store(result, (unint64_t *)&qword_2555916E0);
  }
  return result;
}

unint64_t sub_21FFA5770()
{
  unint64_t result;

  result = qword_2555916E8;
  if (!qword_2555916E8)
  {
    result = MEMORY[0x2207DB4B4](&protocol conformance descriptor for MusicPicker.Click, &type metadata for MusicPicker.Click);
    atomic_store(result, (unint64_t *)&qword_2555916E8);
  }
  return result;
}

uint64_t dispatch thunk of MusicPickerUserExperienceObserver.didLoadPage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of MusicPickerUserExperienceObserver.didClick(_:sourceContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of MusicPickerUserExperienceObserver.didClick(_:actionKind:sourceContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

unint64_t *_s6PageIDOwCP(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_21FF0E594(*a2);
  *a1 = v3;
  return a1;
}

unint64_t _s6PageIDOwxx(unint64_t *a1)
{
  return sub_21FF0EAB8(*a1);
}

unint64_t *_s6PageIDOwca(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_21FF0E594(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_21FF0EAB8(v4);
  return a1;
}

unint64_t *_s6PageIDOwta(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_21FF0EAB8(v3);
  return a1;
}

uint64_t _s6PageIDOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0xC && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 11;
    }
    else
    {
      v2 = (((*(_QWORD *)a1 >> 60) >> 1) & 0xFFFFFFF7 | (8 * ((*(_QWORD *)a1 & 0x1000000000000000) != 0))) ^ 0xF;
      if (v2 >= 0xB)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t _s6PageIDOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(_QWORD *)result = a2 - 12;
    if (a3 >= 0xC)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0xC)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = (unint64_t)(((-a2 >> 3) & 1) - 2 * a2) << 60;
  }
  return result;
}

uint64_t sub_21FFA58FC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 61;
  if (v1 <= 3)
    return v1;
  else
    return *a1 + 4;
}

_QWORD *sub_21FFA5914(_QWORD *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_21FFA5924(unint64_t *result, uint64_t a2)
{
  unint64_t v2;

  if (a2 < 4)
    v2 = *result & 0xFFFFFFFFFFFFFFFLL | (a2 << 61);
  else
    v2 = (a2 - 4) | 0x8000000000000000;
  *result = v2;
  return result;
}

void type metadata accessor for MusicPicker.PageID()
{
  OUTLINED_FUNCTION_2_17();
}

void type metadata accessor for MusicPicker.Click()
{
  OUTLINED_FUNCTION_2_17();
}

unint64_t _s5ClickV13SourceContextVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_21FF0EAB8(*(_QWORD *)(a1 + 24));
}

uint64_t _s5ClickV13SourceContextVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  sub_21FF0E594(v4);
  *(_QWORD *)(a1 + 24) = v4;
  return a1;
}

uint64_t _s5ClickV13SourceContextVwca(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  sub_21FF0E594(v4);
  v5 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  sub_21FF0EAB8(v5);
  return a1;
}

uint64_t _s5ClickV13SourceContextVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  sub_21FF0EAB8(v5);
  return a1;
}

uint64_t _s5ClickV13SourceContextVwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s5ClickV13SourceContextVwst(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

void type metadata accessor for MusicPicker.Click.SourceContext()
{
  OUTLINED_FUNCTION_2_17();
}

uint64_t *_s5ClickV9ControlIDOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  else if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_21FFC5234();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t _s5ClickV9ControlIDOwxx(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    v3 = sub_21FFC5234();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *_s5ClickV9ControlIDOwcp(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_21FFC5234();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *_s5ClickV9ControlIDOwca(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_21FF9E438((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_21FFC5234();
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

void *_s5ClickV9ControlIDOwtk(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_21FFC5234();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *_s5ClickV9ControlIDOwta(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_21FF9E438((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_21FFC5234();
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

uint64_t sub_21FFA5E94()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21FFA5EA4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21FFC5234();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t _s5ClickV17LibraryMenuItemIDOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 5) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s5ClickV17LibraryMenuItemIDOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_21FFA5FF0 + 4 * byte_21FFCB2B7[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_21FFA6024 + 4 * byte_21FFCB2B2[v4]))();
}

uint64_t sub_21FFA6024(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA602C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FFA6034);
  return result;
}

uint64_t sub_21FFA6040(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FFA6048);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_21FFA604C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA6054(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for MusicPicker.Click.LibraryMenuItemID()
{
  OUTLINED_FUNCTION_2_17();
}

uint64_t _s5ClickV13SearchGroupIDOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v5 = v6 - 10;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s5ClickV13SearchGroupIDOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21FFA6140 + 4 * byte_21FFCB2C1[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_21FFA6174 + 4 * byte_21FFCB2BC[v4]))();
}

uint64_t sub_21FFA6174(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA617C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FFA6184);
  return result;
}

uint64_t sub_21FFA6190(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FFA6198);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_21FFA619C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA61A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for MusicPicker.Click.SearchGroupID()
{
  OUTLINED_FUNCTION_2_17();
}

uint64_t _s5ClickV11ControlKindOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s5ClickV11ControlKindOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21FFA6290 + 4 * byte_21FFCB2CB[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21FFA62C4 + 4 * byte_21FFCB2C6[v4]))();
}

uint64_t sub_21FFA62C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA62CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FFA62D4);
  return result;
}

uint64_t sub_21FFA62E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FFA62E8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21FFA62EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA62F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for MusicPicker.Click.ControlKind()
{
  OUTLINED_FUNCTION_2_17();
}

uint64_t _s8ModuleIDOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s5ClickV10ActionKindOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21FFA63E0 + 4 * byte_21FFCB2D5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_21FFA6414 + 4 * byte_21FFCB2D0[v4]))();
}

uint64_t sub_21FFA6414(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA641C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FFA6424);
  return result;
}

uint64_t sub_21FFA6430(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FFA6438);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_21FFA643C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA6444(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for MusicPicker.Click.ActionKind()
{
  OUTLINED_FUNCTION_2_17();
}

uint64_t sub_21FFA645C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v1 = *(_QWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591798);
  v2 = sub_21FFC419C();
  sub_21FF1034C(&qword_2555917A0, &qword_255591798);
  v5[0] = v1;
  v5[1] = v3;
  return MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v2, v5);
}

uint64_t sub_21FFA64E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E0E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21FFA6528()
{
  unint64_t result;

  result = qword_2555917A8;
  if (!qword_2555917A8)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCB8AC, &type metadata for UserExperienceObserverKey);
    atomic_store(result, (unint64_t *)&qword_2555917A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for UserExperienceObserverKey()
{
  return &type metadata for UserExperienceObserverKey;
}

uint64_t OUTLINED_FUNCTION_1_25()
{
  return type metadata accessor for MusicPicker.Click.ControlID();
}

uint64_t OUTLINED_FUNCTION_4_9()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_5_11()
{
  return sub_21FFC5CFC();
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return sub_21FFC5D08();
}

unint64_t OUTLINED_FUNCTION_9_14()
{
  unint64_t v0;
  unint64_t v1;

  sub_21FF0EAB8(v1);
  return sub_21FF0EAB8(v0);
}

uint64_t OUTLINED_FUNCTION_12_8(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_16_10()
{
  uint64_t v0;

  return MusicPicker.PageID.hash(into:)(v0);
}

uint64_t OUTLINED_FUNCTION_17_5()
{
  uint64_t v0;

  return static MusicPicker.Click.SourceContext.== infix(_:_:)((_QWORD *)(v0 - 112), (_QWORD *)(v0 - 144));
}

uint64_t *sub_21FFA6618(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
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
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = a2[2];
    v3[1] = a2[1];
    v3[2] = v5;
    v6 = *(int *)(a3 + 24);
    v7 = (char *)v3 + v6;
    v8 = (char *)a2 + v6;
    swift_bridgeObjectRetain();
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E770);
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E768);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t sub_21FFA6700(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E770);
  result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return result;
}

uint64_t sub_21FFA6770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  swift_bridgeObjectRetain();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E770);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E768);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_21FFA682C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E770);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    v12 = *(_QWORD *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E768);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t sub_21FFA6954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E770);
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E768);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_21FFA6A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 24);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E770);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    v13 = *(_QWORD *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E768);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  return a1;
}

uint64_t sub_21FFA6B24()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFA6B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E768);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_21FFA6BA8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFA6BB4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E768);
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t _s6ModuleVMa()
{
  uint64_t result;

  result = qword_255591808;
  if (!qword_255591808)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21FFA6C5C()
{
  unint64_t v0;

  sub_21FFA6CD8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21FFA6CD8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255591818[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E770);
    v0 = sub_21FFC5AC8();
    if (!v1)
      atomic_store(v0, qword_255591818);
  }
}

uint64_t _s8ModuleIDOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21FFA6D7C + 4 * byte_21FFCB8ED[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_21FFA6DB0 + 4 * byte_21FFCB8E8[v4]))();
}

uint64_t sub_21FFA6DB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA6DB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FFA6DC0);
  return result;
}

uint64_t sub_21FFA6DCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FFA6DD4);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_21FFA6DD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA6DE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s8ModuleIDOMa()
{
  return &_s8ModuleIDON;
}

unint64_t sub_21FFA6E00()
{
  unint64_t result;

  result = qword_255591850;
  if (!qword_255591850)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCB984, &_s8ModuleIDON);
    atomic_store(result, (unint64_t *)&qword_255591850);
  }
  return result;
}

BOOL sub_21FFA6E3C(uint64_t a1, uint64_t a2)
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
  char *v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  char v26;
  _BOOL8 result;
  BOOL v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E770);
  v41 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_0();
  v39 = v6 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555918A0);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0_0();
  v11 = v10 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558E768);
  OUTLINED_FUNCTION_1_5();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v40 = (uint64_t)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v38 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v38 - v18;
  v20 = *(_BYTE *)a2;
  v21 = sub_21FFA7960(*(_BYTE *)a1);
  v23 = v22;
  v25 = v21 == sub_21FFA7960(v20) && v23 == v24;
  if (v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v26 = sub_21FFC5C90();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v26 & 1) == 0)
      return result;
  }
  v28 = *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8) && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16);
  if (v28 || (v29 = sub_21FFC5C90(), result = 0, (v29 & 1) != 0))
  {
    v30 = _s6ModuleVMa();
    sub_21FF4797C(a1 + *(int *)(v30 + 24), (uint64_t)v19);
    sub_21FF4797C(a2 + *(int *)(v30 + 24), (uint64_t)v17);
    v31 = v11 + *(int *)(v7 + 48);
    sub_21FF4797C((uint64_t)v19, v11);
    sub_21FF4797C((uint64_t)v17, v31);
    OUTLINED_FUNCTION_4_10(v11);
    if (v25)
    {
      OUTLINED_FUNCTION_3_11((uint64_t)v17);
      OUTLINED_FUNCTION_3_11((uint64_t)v19);
      OUTLINED_FUNCTION_4_10(v31);
      if (v25)
      {
        sub_21FF1C7A4(v11, &qword_25558E768);
        return 1;
      }
    }
    else
    {
      v32 = v40;
      sub_21FF4797C(v11, v40);
      OUTLINED_FUNCTION_4_10(v31);
      if (!v33)
      {
        v34 = v41;
        v35 = v39;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v39, v31, v4);
        sub_21FFA7D08(&qword_2555918A8, &qword_25558FD48, MEMORY[0x24BDDF520], MEMORY[0x24BDDEAE0]);
        v36 = sub_21FFC575C();
        v37 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
        v37(v35, v4);
        OUTLINED_FUNCTION_6_10((uint64_t)v17);
        OUTLINED_FUNCTION_6_10((uint64_t)v19);
        v37(v32, v4);
        OUTLINED_FUNCTION_6_10(v11);
        return (v36 & 1) != 0;
      }
      OUTLINED_FUNCTION_3_11((uint64_t)v17);
      OUTLINED_FUNCTION_3_11((uint64_t)v19);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v32, v4);
    }
    sub_21FF1C7A4(v11, &qword_2555918A0);
    return 0;
  }
  return result;
}

uint64_t sub_21FFA7180()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E770);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_0();
  v6 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558E768);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_102_2();
  sub_21FFA7960(*v0);
  sub_21FFC57EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21FFC57EC();
  swift_bridgeObjectRelease();
  v8 = _s6ModuleVMa();
  sub_21FF4797C((uint64_t)&v0[*(int *)(v8 + 24)], v1);
  if (__swift_getEnumTagSinglePayload(v1, 1, v2) == 1)
    return sub_21FFC5D08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v6, v1, v2);
  sub_21FFC5D08();
  sub_21FFA7D08(&qword_2555918B0, qword_25558F898, MEMORY[0x24BDDF518], MEMORY[0x24BDDEAD0]);
  sub_21FFC5720();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_21FFA7300(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_21FFC5C90() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
    if (v6 || (sub_21FFC5C90() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x736D657469 && a2 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_21FFC5C90();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_21FFA741C()
{
  return 3;
}

uint64_t sub_21FFA7424()
{
  return 0;
}

uint64_t sub_21FFA7430(char a1)
{
  return qword_21FFCBC38[a1];
}

uint64_t sub_21FFA7450()
{
  char *v0;

  return sub_21FFA7430(*v0);
}

uint64_t sub_21FFA7458@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21FFA7300(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21FFA747C()
{
  return sub_21FFA7424();
}

uint64_t sub_21FFA7498@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21FFA741C();
  *a1 = result;
  return result;
}

uint64_t sub_21FFA74BC()
{
  sub_21FFA7BC8();
  return sub_21FFC5D44();
}

uint64_t sub_21FFA74E4()
{
  sub_21FFA7BC8();
  return sub_21FFC5D50();
}

uint64_t sub_21FFA750C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591880);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0_0();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FFA7BC8();
  sub_21FFC5D38();
  sub_21FFA7CCC();
  sub_21FFC5C54();
  if (!v1)
  {
    sub_21FFC5C48();
    _s6ModuleVMa();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25558E770);
    sub_21FFA7D08(&qword_255591890, &qword_255591898, MEMORY[0x24BDDF510], MEMORY[0x24BDDEAC8]);
    sub_21FFC5C3C();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_21FFA76A4()
{
  sub_21FFC5CF0();
  sub_21FFA7180();
  return sub_21FFC5D20();
}

uint64_t sub_21FFA76E0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  uint64_t v14;
  char v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25558E768);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_0();
  v7 = v6 - v5;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591860);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_0_0();
  v8 = _s6ModuleVMa();
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_102_2();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21FFA7BC8();
  sub_21FFC5D2C();
  if (v14)
    return OUTLINED_FUNCTION_7_15();
  sub_21FFA7C04();
  sub_21FFC5C30();
  *(_BYTE *)v2 = v15;
  *(_QWORD *)(v2 + 8) = sub_21FFC5C24();
  *(_QWORD *)(v2 + 16) = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558E770);
  sub_21FFA7D08(&qword_255591878, &qword_2555903F8, MEMORY[0x24BDDF528], MEMORY[0x24BDDEAF0]);
  sub_21FFC5C18();
  OUTLINED_FUNCTION_2_18();
  sub_21FFA7C40(v7, v2 + *(int *)(v8 + 24));
  sub_21FFA7C88(v2, a2);
  OUTLINED_FUNCTION_7_15();
  return sub_21FF787A0(v2);
}

uint64_t sub_21FFA7918()
{
  unint64_t v0;

  v0 = sub_21FFC5C0C();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_21FFA7960(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21FFA7998 + 4 * byte_21FFCB8F2[a1]))(0xD000000000000012, 0x800000021FFCCD70);
}

uint64_t sub_21FFA7998()
{
  return 0x6574736567677573;
}

uint64_t sub_21FFA79B4()
{
  return 0x796C746E65636572;
}

uint64_t sub_21FFA79D8()
{
  return 0x79616C706572;
}

uint64_t sub_21FFA79EC()
{
  return 0x6575657571;
}

uint64_t sub_21FFA7A00@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21FFA76E0(a1, a2);
}

uint64_t sub_21FFA7A14(_QWORD *a1)
{
  return sub_21FFA750C(a1);
}

uint64_t sub_21FFA7A34()
{
  sub_21FFC5CF0();
  sub_21FFA7180();
  return sub_21FFC5D20();
}

void sub_21FFA7A6C(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t sub_21FFA7A78@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21FFA7918();
  *a1 = result;
  return result;
}

uint64_t sub_21FFA7AA4@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21FFA7960(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21FFA7ACC()
{
  sub_21FF759F0();
  return sub_21FFC5870();
}

uint64_t sub_21FFA7B28()
{
  sub_21FF759F0();
  return sub_21FFC5864();
}

uint64_t sub_21FFA7B74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21FF868D0(*a1, *a2);
}

void sub_21FFA7B80()
{
  unsigned __int8 *v0;

  sub_21FF86CAC(*v0);
}

uint64_t sub_21FFA7B88(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_21FF86D34(a1, *v1);
}

void sub_21FFA7B90(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_21FF86E30(a1, *v1);
}

uint64_t sub_21FFA7B9C()
{
  return sub_21FF50440(&qword_255591858, (uint64_t (*)(uint64_t))_s6ModuleVMa, (uint64_t)&unk_21FFCBA74);
}

unint64_t sub_21FFA7BC8()
{
  unint64_t result;

  result = qword_255591868;
  if (!qword_255591868)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCBBE8, &_s6ModuleV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255591868);
  }
  return result;
}

unint64_t sub_21FFA7C04()
{
  unint64_t result;

  result = qword_255591870;
  if (!qword_255591870)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCB9D4, &_s8ModuleIDON);
    atomic_store(result, (unint64_t *)&qword_255591870);
  }
  return result;
}

uint64_t sub_21FFA7C40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E768);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FFA7C88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = _s6ModuleVMa();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21FFA7CCC()
{
  unint64_t result;

  result = qword_255591888;
  if (!qword_255591888)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCB9AC, &_s8ModuleIDON);
    atomic_store(result, (unint64_t *)&qword_255591888);
  }
  return result;
}

uint64_t sub_21FFA7D08(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E770);
    v10 = sub_21FF50440(a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDDF500], a3);
    result = MEMORY[0x2207DB4B4](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _s6ModuleV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21FFA7DD8 + 4 * byte_21FFCB8FC[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21FFA7E0C + 4 * byte_21FFCB8F7[v4]))();
}

uint64_t sub_21FFA7E0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA7E14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FFA7E1CLL);
  return result;
}

uint64_t sub_21FFA7E28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FFA7E30);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21FFA7E34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FFA7E3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s6ModuleV10CodingKeysOMa()
{
  return &_s6ModuleV10CodingKeysON;
}

unint64_t sub_21FFA7E5C()
{
  unint64_t result;

  result = qword_2555918B8;
  if (!qword_2555918B8)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCBBC0, &_s6ModuleV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2555918B8);
  }
  return result;
}

unint64_t sub_21FFA7E9C()
{
  unint64_t result;

  result = qword_2555918C0;
  if (!qword_2555918C0)
  {
    atomic_store(result, (unint64_t *)&qword_2555918C0);
  }
  return result;
}

unint64_t sub_21FFA7EDC()
{
  unint64_t result;

  result = qword_2555918C8[0];
  if (!qword_2555918C8[0])
  {
    atomic_store(result, qword_2555918C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_3_11(uint64_t a1)
{
  uint64_t *v1;

  return sub_21FF1C7A4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_4_10(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_6_10(uint64_t a1)
{
  uint64_t *v1;

  return sub_21FF1C7A4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_7_15()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t sub_21FFA7F5C()
{
  uint64_t v0;

  v0 = sub_21FFC3EFC();
  __swift_allocate_value_buffer(v0, qword_255598320);
  __swift_project_value_buffer(v0, (uint64_t)qword_255598320);
  return sub_21FFC3EF0();
}

void sub_21FFA7FCC()
{
  uint64_t v0;

  sub_21FFC5030();
  sub_21FFC5AC8();
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v0);
  _s25LibrarySectionContentViewVMa();
}

void sub_21FFA8064(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 - 152) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v5);
  *(_DWORD *)(v4 - 180) = *v1;
  _s9ViewModelCMa(0, v3, v2, v6);
  OUTLINED_FUNCTION_98_0();
}

void sub_21FFA80BC()
{
  int *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _OWORD *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void (*v17)(uint64_t, _QWORD);
  uint64_t v18;
  uint64_t v19;

  *v1 = sub_21FFC4268();
  v1[1] = v4;
  v5 = v2 + v0[20];
  *(_QWORD *)v5 = swift_getKeyPath();
  *(_BYTE *)(v5 + 40) = 0;
  v6 = (uint64_t *)(v2 + v0[21]);
  *v6 = sub_21FFA8290();
  v6[1] = v7;
  v6[2] = v8;
  OUTLINED_FUNCTION_15_7();
  OUTLINED_FUNCTION_15_7();
  v9 = v0[26];
  if (qword_25558DEF0 != -1)
    swift_once();
  v10 = (uint64_t *)(v2 + v9);
  *v10 = sub_21FFC35F0();
  v10[1] = v11;
  v12 = (_OWORD *)(v2 + v0[27]);
  *v12 = xmmword_21FFCBC70;
  v12[1] = xmmword_21FFCBC80;
  v13 = *(_QWORD *)(v3 - 168);
  *(_QWORD *)v2 = *(_QWORD *)(v3 - 176);
  *(_QWORD *)(v2 + 8) = v13;
  v14 = *(_QWORD *)(v3 - 144);
  *(_QWORD *)(v2 + 16) = *(_QWORD *)(v3 - 160);
  *(_QWORD *)(v2 + 24) = v14;
  v15 = *(_DWORD *)(v3 - 180);
  *(_BYTE *)(v2 + 32) = v15;
  *(_BYTE *)(v2 + 40) = 1;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 64) = 0x8000000000000000;
  sub_21FFC50E4();
  v16 = OUTLINED_FUNCTION_60_2();
  v17(v16, *(_QWORD *)(v3 - 136));
  v18 = swift_allocObject();
  *(_BYTE *)(v18 + 16) = v15;
  *(_BYTE *)(v18 + 24) = 1;
  *(_QWORD *)(v18 + 32) = 0;
  *(_QWORD *)(v18 + 40) = 0;
  *(_QWORD *)(v18 + 48) = 0x8000000000000000;
  *(_QWORD *)(v2 + v0[24]) = v18;
  v19 = v2 + v0[25];
  *(_BYTE *)v19 = 1;
  *(_QWORD *)(v19 + 8) = 0;
  *(_QWORD *)(v19 + 16) = 0;
  *(_QWORD *)(v19 + 24) = v18;
  (*(void (**)(_QWORD, uint64_t, int *))(*(_QWORD *)(v3 - 152) + 32))(*(_QWORD *)(v3 - 128), v2, v0);
  swift_retain();
  OUTLINED_FUNCTION_24();
}

void _s25LibrarySectionContentViewVMa()
{
  JUMPOUT(0x2207DB418);
}

uint64_t sub_21FFA8290()
{
  uint64_t v1;

  sub_21FFC4CB8();
  return v1;
}

void sub_21FFA82C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);

  sub_21FFC5030();
  v2 = sub_21FFC5AC8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_55_4();
  v4();
  sub_21FFC4CB8();
  OUTLINED_FUNCTION_51_3(a1, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_43_2();
}

uint64_t sub_21FFA8360()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_21FFA838C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_21FFC50E4();
  if (v1 <= 0x3F)
  {
    sub_21FFC5030();
    sub_21FFC5AC8();
    result = sub_21FFC4CE8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_21FFA84A4(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  _OWORD *v54;
  _OWORD *v55;
  __int128 v56;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v26 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v26 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = a2[8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21FF0E594(v10);
    *(_QWORD *)(a1 + 64) = v10;
    v11 = a3[18];
    v12 = a1 + v11;
    v13 = (uint64_t)a2 + v11;
    v14 = sub_21FFC50E4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    v15 = a3[19];
    v16 = a3[20];
    v17 = (_QWORD *)(a1 + v15);
    v18 = (uint64_t *)((char *)a2 + v15);
    v19 = *v18;
    v20 = v18[1];
    *v17 = v19;
    v17[1] = v20;
    v21 = a1 + v16;
    v22 = (uint64_t)a2 + v16;
    v23 = *((_BYTE *)a2 + v16 + 40);
    swift_retain();
    if ((v23 & 1) != 0)
    {
      v24 = *(_QWORD *)(v22 + 24);
      if (v24)
      {
        v25 = *(_QWORD *)(v22 + 32);
        *(_QWORD *)(v21 + 24) = v24;
        *(_QWORD *)(v21 + 32) = v25;
        (**(void (***)(uint64_t, uint64_t))(v24 - 8))(v21, v22);
      }
      else
      {
        v27 = *(_OWORD *)(v22 + 16);
        *(_OWORD *)v21 = *(_OWORD *)v22;
        *(_OWORD *)(v21 + 16) = v27;
        *(_QWORD *)(v21 + 32) = *(_QWORD *)(v22 + 32);
      }
      *(_BYTE *)(v21 + 40) = 1;
    }
    else
    {
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *(_BYTE *)(v21 + 40) = 0;
      swift_retain();
    }
    v28 = a3[21];
    v29 = a3[22];
    v30 = (_QWORD *)(a1 + v28);
    v31 = (uint64_t *)((char *)a2 + v28);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v30[2] = v31[2];
    v33 = (char *)(a1 + v29);
    v34 = (char *)a2 + v29;
    v35 = sub_21FFC5030();
    swift_bridgeObjectRetain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v34, 1, v35))
    {
      v36 = sub_21FFC5AC8();
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v33, v34, v35);
      __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v35);
    }
    v37 = sub_21FFC5AC8();
    v38 = sub_21FFC4CE8();
    *(_QWORD *)&v33[*(int *)(v38 + 28)] = *(_QWORD *)&v34[*(int *)(v38 + 28)];
    v39 = a3[23];
    v40 = (char *)(a1 + v39);
    v41 = (char *)a2 + v39;
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v41, 1, v35))
    {
      memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v40, v41, v35);
      __swift_storeEnumTagSinglePayload((uint64_t)v40, 0, 1, v35);
    }
    *(_QWORD *)&v40[*(int *)(v38 + 28)] = *(_QWORD *)&v41[*(int *)(v38 + 28)];
    v42 = a3[24];
    v43 = *(uint64_t *)((char *)a2 + v42);
    swift_retain();
    sub_21FF0E594(v43);
    *(_QWORD *)(a1 + v42) = v43;
    v44 = a3[25];
    v45 = a1 + v44;
    v46 = (uint64_t)a2 + v44;
    *(_BYTE *)v45 = *(_BYTE *)v46;
    v47 = *(_QWORD *)(v46 + 16);
    *(_QWORD *)(v45 + 8) = *(_QWORD *)(v46 + 8);
    *(_QWORD *)(v45 + 16) = v47;
    v48 = *(_QWORD *)(v46 + 24);
    swift_bridgeObjectRetain();
    sub_21FF0E594(v48);
    *(_QWORD *)(v45 + 24) = v48;
    v49 = a3[26];
    v50 = a3[27];
    v51 = (_QWORD *)(a1 + v49);
    v52 = (uint64_t *)((char *)a2 + v49);
    v53 = v52[1];
    *v51 = *v52;
    v51[1] = v53;
    v54 = (_OWORD *)(a1 + v50);
    v55 = (_OWORD *)((char *)a2 + v50);
    v56 = v55[1];
    *v54 = *v55;
    v54[1] = v56;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_21FFA87D8(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(a1 + 64));
  v4 = a1 + a2[18];
  v5 = sub_21FFC50E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  v6 = a1 + a2[20];
  if ((*(_BYTE *)(v6 + 40) & 1) != 0)
  {
    if (*(_QWORD *)(v6 + 24))
      __swift_destroy_boxed_opaque_existential_1(v6);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  v7 = a1 + a2[22];
  v8 = sub_21FFC5030();
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  sub_21FFC5AC8();
  sub_21FFC4CE8();
  swift_release();
  v9 = a1 + a2[23];
  if (!__swift_getEnumTagSinglePayload(v9, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v9, v8);
  swift_release();
  sub_21FF0EAB8(*(_QWORD *)(a1 + a2[24]));
  v10 = a1 + a2[25];
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v10 + 24));
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FFA8980(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  _OWORD *v52;
  _OWORD *v53;
  __int128 v54;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21FF0E594(v9);
  *(_QWORD *)(a1 + 64) = v9;
  v10 = a3[18];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_21FFC50E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  v14 = a3[19];
  v15 = a3[20];
  v16 = (_QWORD *)(a1 + v14);
  v17 = (uint64_t *)(a2 + v14);
  v18 = *v17;
  v19 = v17[1];
  *v16 = v18;
  v16[1] = v19;
  v20 = a1 + v15;
  v21 = a2 + v15;
  v22 = *(_BYTE *)(a2 + v15 + 40);
  swift_retain();
  if ((v22 & 1) != 0)
  {
    v23 = *(_QWORD *)(v21 + 24);
    if (v23)
    {
      v24 = *(_QWORD *)(v21 + 32);
      *(_QWORD *)(v20 + 24) = v23;
      *(_QWORD *)(v20 + 32) = v24;
      (**(void (***)(uint64_t, uint64_t))(v23 - 8))(v20, v21);
    }
    else
    {
      v25 = *(_OWORD *)(v21 + 16);
      *(_OWORD *)v20 = *(_OWORD *)v21;
      *(_OWORD *)(v20 + 16) = v25;
      *(_QWORD *)(v20 + 32) = *(_QWORD *)(v21 + 32);
    }
    *(_BYTE *)(v20 + 40) = 1;
  }
  else
  {
    *(_QWORD *)v20 = *(_QWORD *)v21;
    *(_BYTE *)(v20 + 40) = 0;
    swift_retain();
  }
  v26 = a3[21];
  v27 = a3[22];
  v28 = (_QWORD *)(a1 + v26);
  v29 = (_QWORD *)(a2 + v26);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v28[2] = v29[2];
  v31 = (char *)(a1 + v27);
  v32 = (char *)(a2 + v27);
  v33 = sub_21FFC5030();
  swift_bridgeObjectRetain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v33))
  {
    v34 = sub_21FFC5AC8();
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v31, v32, v33);
    __swift_storeEnumTagSinglePayload((uint64_t)v31, 0, 1, v33);
  }
  v35 = sub_21FFC5AC8();
  v36 = sub_21FFC4CE8();
  *(_QWORD *)&v31[*(int *)(v36 + 28)] = *(_QWORD *)&v32[*(int *)(v36 + 28)];
  v37 = a3[23];
  v38 = (char *)(a1 + v37);
  v39 = (char *)(a2 + v37);
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v39, 1, v33))
  {
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v38, v39, v33);
    __swift_storeEnumTagSinglePayload((uint64_t)v38, 0, 1, v33);
  }
  *(_QWORD *)&v38[*(int *)(v36 + 28)] = *(_QWORD *)&v39[*(int *)(v36 + 28)];
  v40 = a3[24];
  v41 = *(_QWORD *)(a2 + v40);
  swift_retain();
  sub_21FF0E594(v41);
  *(_QWORD *)(a1 + v40) = v41;
  v42 = a3[25];
  v43 = a1 + v42;
  v44 = a2 + v42;
  *(_BYTE *)v43 = *(_BYTE *)v44;
  v45 = *(_QWORD *)(v44 + 16);
  *(_QWORD *)(v43 + 8) = *(_QWORD *)(v44 + 8);
  *(_QWORD *)(v43 + 16) = v45;
  v46 = *(_QWORD *)(v44 + 24);
  swift_bridgeObjectRetain();
  sub_21FF0E594(v46);
  *(_QWORD *)(v43 + 24) = v46;
  v47 = a3[26];
  v48 = a3[27];
  v49 = (_QWORD *)(a1 + v47);
  v50 = (_QWORD *)(a2 + v47);
  v51 = v50[1];
  *v49 = *v50;
  v49[1] = v51;
  v52 = (_OWORD *)(a1 + v48);
  v53 = (_OWORD *)(a2 + v48);
  v54 = v53[1];
  *v52 = *v53;
  v52[1] = v54;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21FFA8C88(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  int EnumTagSinglePayload;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  sub_21FF0E594(v6);
  v7 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v6;
  sub_21FF0EAB8(v7);
  v8 = a3[18];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_21FFC50E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[19];
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  swift_retain();
  swift_release();
  *(_QWORD *)(v13 + 8) = *(_QWORD *)(v14 + 8);
  if (a1 != a2)
  {
    v15 = a3[20];
    v16 = a1 + v15;
    v17 = (__int128 *)(a2 + v15);
    sub_21FF103AC(a1 + v15, qword_25558DFD0);
    if ((*((_BYTE *)v17 + 40) & 1) != 0)
    {
      v18 = *((_QWORD *)v17 + 3);
      if (v18)
      {
        *(_QWORD *)(v16 + 24) = v18;
        *(_QWORD *)(v16 + 32) = *((_QWORD *)v17 + 4);
        (**(void (***)(uint64_t, __int128 *))(v18 - 8))(v16, v17);
      }
      else
      {
        v19 = *v17;
        v20 = v17[1];
        *(_QWORD *)(v16 + 32) = *((_QWORD *)v17 + 4);
        *(_OWORD *)v16 = v19;
        *(_OWORD *)(v16 + 16) = v20;
      }
      *(_BYTE *)(v16 + 40) = 1;
    }
    else
    {
      *(_QWORD *)v16 = *(_QWORD *)v17;
      *(_BYTE *)(v16 + 40) = 0;
      swift_retain();
    }
  }
  v21 = a3[21];
  v22 = (_QWORD *)(a1 + v21);
  v23 = a2 + v21;
  *v22 = *(_QWORD *)(a2 + v21);
  v22[1] = *(_QWORD *)(a2 + v21 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v22[2] = *(_QWORD *)(v23 + 16);
  swift_retain();
  swift_release();
  v24 = a3[22];
  v25 = (char *)(a1 + v24);
  v26 = (char *)(a2 + v24);
  v27 = sub_21FFC5030();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v25, 1, v27);
  v29 = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27);
  if (EnumTagSinglePayload)
  {
    if (!v29)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
      __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v27);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v30 = *(_QWORD *)(v27 - 8);
  if (v29)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v25, v27);
LABEL_13:
    v31 = sub_21FFC5AC8();
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v30 + 24))(v25, v26, v27);
LABEL_14:
  v32 = sub_21FFC5AC8();
  v33 = sub_21FFC4CE8();
  *(_QWORD *)&v25[*(int *)(v33 + 28)] = *(_QWORD *)&v26[*(int *)(v33 + 28)];
  swift_retain();
  swift_release();
  v34 = a3[23];
  v35 = (char *)(a1 + v34);
  v36 = (char *)(a2 + v34);
  v37 = __swift_getEnumTagSinglePayload(a1 + v34, 1, v27);
  v38 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v27);
  if (!v37)
  {
    v39 = *(_QWORD *)(v27 - 8);
    if (!v38)
    {
      (*(void (**)(char *, char *, uint64_t))(v39 + 24))(v35, v36, v27);
      goto LABEL_20;
    }
    (*(void (**)(char *, uint64_t))(v39 + 8))(v35, v27);
    goto LABEL_19;
  }
  if (v38)
  {
LABEL_19:
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_20;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v35, v36, v27);
  __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v27);
LABEL_20:
  *(_QWORD *)&v35[*(int *)(v33 + 28)] = *(_QWORD *)&v36[*(int *)(v33 + 28)];
  swift_retain();
  swift_release();
  v40 = a3[24];
  v41 = *(_QWORD *)(a2 + v40);
  sub_21FF0E594(v41);
  v42 = *(_QWORD *)(a1 + v40);
  *(_QWORD *)(a1 + v40) = v41;
  sub_21FF0EAB8(v42);
  v43 = a3[25];
  v44 = a1 + v43;
  v45 = a2 + v43;
  *(_BYTE *)v44 = *(_BYTE *)(a2 + v43);
  *(_QWORD *)(v44 + 8) = *(_QWORD *)(a2 + v43 + 8);
  *(_QWORD *)(v44 + 16) = *(_QWORD *)(a2 + v43 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v46 = *(_QWORD *)(v45 + 24);
  sub_21FF0E594(v46);
  v47 = *(_QWORD *)(v44 + 24);
  *(_QWORD *)(v44 + 24) = v46;
  sub_21FF0EAB8(v47);
  v48 = a3[26];
  v49 = (_QWORD *)(a1 + v48);
  v50 = (_QWORD *)(a2 + v48);
  *v49 = *v50;
  v49[1] = v50[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v51 = a3[27];
  v52 = (_QWORD *)(a1 + v51);
  v53 = (_QWORD *)(a2 + v51);
  *v52 = *v53;
  v52[1] = v53[1];
  v52[2] = v53[2];
  v52[3] = v53[3];
  return a1;
}

uint64_t sub_21FFA9118(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 *v18;
  __int128 v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  _OWORD *v30;
  _OWORD *v31;
  __int128 v32;
  uint64_t v33;
  _OWORD *v34;
  _OWORD *v35;
  __int128 v36;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v7 = a3[18];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_21FFC50E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[20];
  *(_OWORD *)(a1 + a3[19]) = *(_OWORD *)(a2 + a3[19]);
  v12 = (_OWORD *)(a1 + v11);
  v13 = (_OWORD *)(a2 + v11);
  *(_OWORD *)((char *)v12 + 25) = *(_OWORD *)((char *)v13 + 25);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = a3[21];
  v16 = a3[22];
  v17 = a1 + v15;
  v18 = (__int128 *)(a2 + v15);
  v19 = *v18;
  *(_QWORD *)(v17 + 16) = *((_QWORD *)v18 + 2);
  *(_OWORD *)v17 = v19;
  v20 = (char *)(a1 + v16);
  v21 = (char *)(a2 + v16);
  v22 = sub_21FFC5030();
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, v22))
  {
    v23 = sub_21FFC5AC8();
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
    __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v22);
  }
  v24 = sub_21FFC5AC8();
  v25 = sub_21FFC4CE8();
  *(_QWORD *)&v20[*(int *)(v25 + 28)] = *(_QWORD *)&v21[*(int *)(v25 + 28)];
  v26 = a3[23];
  v27 = (char *)(a1 + v26);
  v28 = (char *)(a2 + v26);
  if (__swift_getEnumTagSinglePayload(a2 + v26, 1, v22))
  {
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v27, v28, v22);
    __swift_storeEnumTagSinglePayload((uint64_t)v27, 0, 1, v22);
  }
  *(_QWORD *)&v27[*(int *)(v25 + 28)] = *(_QWORD *)&v28[*(int *)(v25 + 28)];
  v29 = a3[25];
  *(_QWORD *)(a1 + a3[24]) = *(_QWORD *)(a2 + a3[24]);
  v30 = (_OWORD *)(a1 + v29);
  v31 = (_OWORD *)(a2 + v29);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  v33 = a3[27];
  *(_OWORD *)(a1 + a3[26]) = *(_OWORD *)(a2 + a3[26]);
  v34 = (_OWORD *)(a1 + v33);
  v35 = (_OWORD *)(a2 + v33);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  return a1;
}

uint64_t sub_21FFA9348(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  __int128 v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  int EnumTagSinglePayload;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _OWORD *v54;
  _OWORD *v55;
  __int128 v56;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  sub_21FF0EAB8(v9);
  v10 = a3[18];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_21FFC50E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  v14 = a3[19];
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  swift_release();
  *(_QWORD *)(v15 + 8) = *(_QWORD *)(v16 + 8);
  if (a1 != a2)
  {
    v17 = a3[20];
    v18 = (_OWORD *)(a2 + v17);
    v19 = (_OWORD *)(a1 + v17);
    sub_21FF103AC(a1 + v17, qword_25558DFD0);
    v20 = v18[1];
    *v19 = *v18;
    v19[1] = v20;
    *(_OWORD *)((char *)v19 + 25) = *(_OWORD *)((char *)v18 + 25);
  }
  v21 = a3[21];
  v22 = (_QWORD *)(a1 + v21);
  v23 = a2 + v21;
  v24 = *(_QWORD *)(a2 + v21 + 8);
  *v22 = *(_QWORD *)(a2 + v21);
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v22[2] = *(_QWORD *)(v23 + 16);
  swift_release();
  v25 = a3[22];
  v26 = (char *)(a1 + v25);
  v27 = (char *)(a2 + v25);
  v28 = sub_21FFC5030();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, v28);
  v30 = __swift_getEnumTagSinglePayload((uint64_t)v27, 1, v28);
  if (EnumTagSinglePayload)
  {
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v26, v27, v28);
      __swift_storeEnumTagSinglePayload((uint64_t)v26, 0, 1, v28);
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v31 = *(_QWORD *)(v28 - 8);
  if (v30)
  {
    (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v28);
LABEL_8:
    v32 = sub_21FFC5AC8();
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_9;
  }
  (*(void (**)(char *, char *, uint64_t))(v31 + 40))(v26, v27, v28);
LABEL_9:
  v33 = sub_21FFC5AC8();
  v34 = sub_21FFC4CE8();
  *(_QWORD *)&v26[*(int *)(v34 + 28)] = *(_QWORD *)&v27[*(int *)(v34 + 28)];
  swift_release();
  v35 = a3[23];
  v36 = (char *)(a1 + v35);
  v37 = (char *)(a2 + v35);
  v38 = __swift_getEnumTagSinglePayload(a1 + v35, 1, v28);
  v39 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v28);
  if (!v38)
  {
    v40 = *(_QWORD *)(v28 - 8);
    if (!v39)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 40))(v36, v37, v28);
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v36, v28);
    goto LABEL_14;
  }
  if (v39)
  {
LABEL_14:
    memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    goto LABEL_15;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v36, v37, v28);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v28);
LABEL_15:
  *(_QWORD *)&v36[*(int *)(v34 + 28)] = *(_QWORD *)&v37[*(int *)(v34 + 28)];
  swift_release();
  v41 = a3[24];
  v42 = *(_QWORD *)(a1 + v41);
  *(_QWORD *)(a1 + v41) = *(_QWORD *)(a2 + v41);
  sub_21FF0EAB8(v42);
  v43 = a3[25];
  v44 = a1 + v43;
  v45 = a2 + v43;
  *(_BYTE *)v44 = *(_BYTE *)(a2 + v43);
  v46 = *(_QWORD *)(a2 + v43 + 16);
  *(_QWORD *)(v44 + 8) = *(_QWORD *)(a2 + v43 + 8);
  *(_QWORD *)(v44 + 16) = v46;
  swift_bridgeObjectRelease();
  v47 = *(_QWORD *)(v44 + 24);
  *(_QWORD *)(v44 + 24) = *(_QWORD *)(v45 + 24);
  sub_21FF0EAB8(v47);
  v48 = a3[26];
  v49 = (_QWORD *)(a1 + v48);
  v50 = (uint64_t *)(a2 + v48);
  v52 = *v50;
  v51 = v50[1];
  *v49 = v52;
  v49[1] = v51;
  swift_bridgeObjectRelease();
  v53 = a3[27];
  v54 = (_OWORD *)(a1 + v53);
  v55 = (_OWORD *)(a2 + v53);
  v56 = v55[1];
  *v54 = *v55;
  v54[1] = v56;
  return a1;
}

uint64_t sub_21FFA96D8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFA96E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21FFC50E4();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = *(int *)(a3 + 72);
    }
    else
    {
      OUTLINED_FUNCTION_46_2();
      OUTLINED_FUNCTION_14();
      v9 = OUTLINED_FUNCTION_77_2();
      v10 = *(int *)(a3 + 88);
    }
    return __swift_getEnumTagSinglePayload(a1 + v10, a2, v9);
  }
}

uint64_t sub_21FFA97A4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_21FFA97B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_43_2();
  }
  else
  {
    v8 = sub_21FFC50E4();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 72);
    }
    else
    {
      OUTLINED_FUNCTION_46_2();
      OUTLINED_FUNCTION_14();
      v9 = OUTLINED_FUNCTION_77_2();
      v10 = *(int *)(a4 + 88);
    }
    __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
  }
}

uint64_t sub_21FFA9860()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_21FFA989C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  return v1 == sub_21FFC37DC();
}

void sub_21FFA98C8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD v25[66];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v27 = a2;
  v26 = sub_21FFC43AC();
  v25[65] = *(_QWORD *)(v26 - 8);
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_0_7();
  v25[64] = v4;
  OUTLINED_FUNCTION_52_2();
  v5 = sub_21FFC4700();
  v25[62] = *(_QWORD *)(v5 - 8);
  v25[63] = v5;
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0_7();
  v25[61] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558F628);
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_0_7();
  v25[60] = v9;
  OUTLINED_FUNCTION_52_2();
  v10 = sub_21FFC4508();
  v25[56] = *(_QWORD *)(v10 - 8);
  v25[57] = v10;
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0_7();
  v25[55] = v12;
  OUTLINED_FUNCTION_52_2();
  v13 = sub_21FFC4514();
  v25[58] = *(_QWORD *)(v13 - 8);
  v25[59] = v13;
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_0_7();
  v25[54] = v15;
  OUTLINED_FUNCTION_52_2();
  v16 = sub_21FFC5984();
  v25[52] = *(_QWORD *)(v16 - 8);
  v25[53] = v16;
  OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_0_7();
  v25[51] = v18;
  v28 = *(a1 - 1);
  v29 = *(_QWORD *)(v28 + 64);
  MEMORY[0x24BDAC7A8](v19);
  v31 = (char *)v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a1[2];
  v32 = a1[4];
  sub_21FFC5030();
  v34 = a1[5];
  v22 = v34;
  swift_getAssociatedTypeWitness();
  v30 = a1;
  v23 = a1[3];
  v24 = a1[6];
  v35 = v21;
  v36 = v23;
  v33 = v21;
  v37 = v22;
  v38 = v24;
  _s13ItemShelfCellVMa();
}

void sub_21FFA9AB0()
{
  OUTLINED_FUNCTION_56_5();
  OUTLINED_FUNCTION_56_5();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_13_1();
}

void sub_21FFA9AF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedConformanceWitness;

  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v4 - 200) = v1;
  *(_QWORD *)(v4 - 192) = v2;
  *(_QWORD *)(v4 - 184) = v3;
  *(_QWORD *)(v4 - 176) = a1;
  *(_QWORD *)(v4 - 168) = AssociatedConformanceWitness;
  sub_21FFC4DE4();
  sub_21FFC5AC8();
  *(_QWORD *)(v4 - 96) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v3);
  OUTLINED_FUNCTION_13_1();
}

void sub_21FFA9B68(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  OUTLINED_FUNCTION_49();
}

void sub_21FFA9B7C()
{
  OUTLINED_FUNCTION_104();
  sub_21FFC3F98();
  OUTLINED_FUNCTION_13_1();
}

void sub_21FFA9B98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_104();
  sub_21FFC3FA4();
  _s27DismissAlertTriggerModifierVMa(255, v1, v0, v2);
  sub_21FFC419C();
  OUTLINED_FUNCTION_13_1();
}

void sub_21FFA9BE4()
{
  OUTLINED_FUNCTION_49();
}

void sub_21FFA9BF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = v1;
  *(_QWORD *)(v2 - 112) = a1;
  OUTLINED_FUNCTION_75();
}

void sub_21FFA9C08()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v2 = sub_21FFC4118();
  v3 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEC6F8], v2);
  v4 = sub_21FF2E0A8();
  v5 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v1 - 200) = v2;
  *(_QWORD *)(v1 - 192) = v5;
  v0[1] = v2;
  *(_QWORD *)(v1 - 184) = v3;
  *(_QWORD *)(v1 - 176) = v4;
  v0[3] = v3;
  v0[68] = v4;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFA9C68(uint64_t a1)
{
  _QWORD *v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1[73] = *(_QWORD *)(a1 - 8);
  v1[70] = a1;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8_1();
  v1[72] = v11;
  v1[76] = v8;
  v1[77] = v3;
  _s18NavigationBarStyleVMa(255, v8, v3, v12);
  v13 = sub_21FFC419C();
  v1[33] = *(_QWORD *)(v13 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_8_1();
  v1[74] = v15;
  sub_21FFC40E8();
  v1[11] = v13;
  v1[39] = *(_QWORD *)(sub_21FFC419C() - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_8_1();
  v1[21] = v17;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E0B0);
  _s10DoneButtonVMa(255, v5, v4, v18);
  *(_QWORD *)(v9 - 200) = v7;
  *(_QWORD *)(v9 - 192) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v9 - 184) = v2;
  *(_QWORD *)(v9 - 176) = v6;
  v1[2] = OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_75();
}

void sub_21FFA9D88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = v1;
  *(_QWORD *)(v2 - 128) = a1;
  OUTLINED_FUNCTION_49();
}

void sub_21FFA9DA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  *(_QWORD *)(v1 + 40) = a1;
  sub_21FF0F7EC(&qword_25558E0B8, (void (*)(uint64_t))MEMORY[0x24BDEC4E0]);
  *(_QWORD *)(v4 - 152) = a1;
  *(_QWORD *)(v4 - 144) = v6;
  MEMORY[0x2207DB4B4](v2, v3, v4 - 152);
  sub_21FFAE490(&qword_25558E0C0, &qword_25558E0B0);
  OUTLINED_FUNCTION_98_0();
}

void sub_21FFA9E08(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v7 - 200) = v6;
  *(_QWORD *)(v7 - 192) = v4;
  v1[6] = v6;
  v1[7] = a1;
  v1[9] = v2;
  v1[10] = v4;
  *(_QWORD *)(v7 - 184) = v5;
  *(_QWORD *)(v7 - 176) = v2;
  v1[4] = v5;
  *(_QWORD *)(v7 - 168) = v3;
  *(_QWORD *)(v7 - 160) = a1;
  v1[8] = v3;
  OUTLINED_FUNCTION_2_19();
}

void sub_21FFA9E40(uint64_t a1)
{
  _QWORD *v1;
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

  v1[36] = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8_1();
  v1[75] = v11;
  *(_QWORD *)(v8 - 200) = v7;
  *(_QWORD *)(v8 - 192) = v3;
  *(_QWORD *)(v8 - 184) = v6;
  *(_QWORD *)(v8 - 176) = v2;
  *(_QWORD *)(v8 - 168) = v4;
  *(_QWORD *)(v8 - 160) = v5;
  v12 = OUTLINED_FUNCTION_1_26();
  *(_QWORD *)(v8 - 200) = a1;
  v1[17] = a1;
  *(_QWORD *)(v8 - 192) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v8 - 184) = v12;
  v1[12] = v12;
  *(_QWORD *)(v8 - 176) = v1[68];
  OUTLINED_FUNCTION_2_19();
}

void sub_21FFA9EB0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[35] = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8_1();
  v1[16] = v9;
  *(_QWORD *)(v6 - 200) = v4;
  *(_QWORD *)(v6 - 192) = v3;
  *(_QWORD *)(v6 - 184) = v2;
  *(_QWORD *)(v6 - 176) = v5;
  v10 = OUTLINED_FUNCTION_1_26();
  v1[25] = a1;
  v1[26] = v10;
  *(_QWORD *)(v6 - 200) = a1;
  *(_QWORD *)(v6 - 192) = v10;
  OUTLINED_FUNCTION_2_19();
}

void sub_21FFA9F00(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1[32] = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_1();
  v1[24] = v7;
  *(_QWORD *)(v4 - 200) = v3;
  *(_QWORD *)(v4 - 192) = v2;
  v8 = OUTLINED_FUNCTION_1_26();
  v1[19] = a1;
  v1[20] = v8;
  *(_QWORD *)(v4 - 200) = a1;
  *(_QWORD *)(v4 - 192) = v8;
  OUTLINED_FUNCTION_2_19();
}

void sub_21FFA9F4C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1[29] = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_1();
  v1[18] = v7;
  *(_QWORD *)(v4 - 200) = v3;
  *(_QWORD *)(v4 - 192) = v2;
  v8 = OUTLINED_FUNCTION_1_26();
  v1[13] = a1;
  *(_QWORD *)(v4 - 200) = a1;
  *(_QWORD *)(v4 - 192) = v8;
  v1[15] = v8;
  OUTLINED_FUNCTION_2_19();
}

void sub_21FFA9F9C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[40] = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_1();
  v1[14] = v8;
  *(_QWORD *)(v5 - 200) = v2;
  *(_QWORD *)(v5 - 192) = v4;
  v9 = OUTLINED_FUNCTION_1_26();
  *(_QWORD *)(v5 - 200) = a1;
  *(_QWORD *)(v5 - 192) = v3;
  v1[23] = a1;
  v10 = MEMORY[0x24BEE0D28];
  *(_QWORD *)(v5 - 184) = v9;
  *(_QWORD *)(v5 - 176) = v10;
  v1[22] = v9;
  OUTLINED_FUNCTION_2_19();
}

void sub_21FFAA000(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1[38] = *(_QWORD *)(a1 - 8);
  v1[31] = a1;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8_1();
  v1[27] = v9;
  *(_QWORD *)(v6 - 200) = v2;
  *(_QWORD *)(v6 - 192) = v3;
  *(_QWORD *)(v6 - 184) = v5;
  *(_QWORD *)(v6 - 176) = v4;
  v10 = OUTLINED_FUNCTION_1_26();
  v1[30] = v10;
  *(_QWORD *)(v6 - 200) = a1;
  *(_QWORD *)(v6 - 192) = v10;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFAA058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  *(_QWORD *)(v9 + 336) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v9 + 296) = a1;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8_1();
  *(_QWORD *)(v9 + 224) = v12;
  v13 = sub_21FFC419C();
  *(_QWORD *)(v9 + 376) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v9 + 328) = v13;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_8_1();
  *(_QWORD *)(v9 + 272) = v15;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591950);
  v16 = OUTLINED_FUNCTION_42_1();
  v17 = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v9 + 360) = v16;
  *(_QWORD *)(v9 + 392) = v17;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_8_1();
  *(_QWORD *)(v9 + 344) = v19;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E578);
  v20 = OUTLINED_FUNCTION_42_1();
  *(_QWORD *)(v9 + 384) = v20;
  *(_QWORD *)(v9 + 400) = *(_QWORD *)(v20 - 8);
  OUTLINED_FUNCTION_5_5();
  v22 = MEMORY[0x24BDAC7A8](v21);
  *(_QWORD *)(v9 + 352) = (char *)&a9 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  *(_QWORD *)(v9 + 368) = (char *)&a9 - v24;
  sub_21FFAA928(*(_QWORD **)(v9 + 624), v10 - 200);
}

void sub_21FFAA178()
{
  uint64_t *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 - 192);
  *(_QWORD *)(v2 - 240) = *(_QWORD *)(v2 - 200);
  *(_QWORD *)(v2 - 232) = v3;
  v4 = v1[1];
  *(_QWORD *)(v2 - 216) = *v1;
  *(_QWORD *)(v2 - 208) = v4;
  swift_checkMetadataState();
  sub_21FFC4A18();
  OUTLINED_FUNCTION_62_2();
  sub_21FF9F64C(v0[76], v0[70], v0[76], v0[2], v0[77]);
}

void sub_21FFAA1E8()
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
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
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
  uint64_t v46;
  _QWORD *v47;
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
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;

  (*(void (**)(uint64_t, uint64_t))(v0[73] + 8))(v5, v3);
  v8 = v0[69];
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v0[73] = v9;
  v10 = v0[79];
  v11 = v4;
  v9(v10, v1, v4);
  v12 = *(unsigned __int8 *)(v8 + 80);
  v13 = (v12 + 56) & ~v12;
  v0[71] += v13;
  v14 = v13;
  v0[72] = v13;
  v0[70] = v12 | 7;
  v15 = (char *)swift_allocObject();
  *((_QWORD *)v15 + 2) = v0[81];
  *((_QWORD *)v15 + 3) = v6;
  v16 = v0[82];
  *((_QWORD *)v15 + 4) = v0[80];
  *((_QWORD *)v15 + 5) = v16;
  *((_QWORD *)v15 + 6) = v2;
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 32);
  v0[69] = v17;
  v18 = v10;
  v19 = v11;
  v17(&v15[v14], v18, v11);
  v20 = v0[11];
  sub_21FF09BB0();
  v21 = v0[74];
  sub_21FFC4AE4();
  OUTLINED_FUNCTION_62_2();
  OUTLINED_FUNCTION_64_1(v0[52]);
  (*(void (**)(uint64_t, uint64_t))(v0[33] + 8))(v21, v20);
  *(_QWORD *)(v7 - 200) = sub_21FFC4E50();
  *(_QWORD *)(v7 - 192) = v22;
  *(_QWORD *)(v7 - 240) = sub_21FF5AAC4(v6, v2, v23, v24);
  *(_QWORD *)(v7 - 232) = v25;
  swift_checkMetadataState();
  sub_21FFC4A54();
  swift_release();
  OUTLINED_FUNCTION_5_12(v0[39]);
  v26 = v0[83];
  v27 = (_QWORD *)(v26 + *(int *)(v19 + 84));
  v28 = v27[1];
  v29 = v27[2];
  *(_QWORD *)(v7 - 240) = *v27;
  *(_QWORD *)(v7 - 232) = v28;
  *(_QWORD *)(v7 - 224) = v29;
  v0[74] = __swift_instantiateConcreteTypeFromMangledName(&qword_255591968);
  sub_21FFC4CDC();
  v30 = v0[55];
  sub_21FFC44FC();
  v31 = v0[54];
  sub_21FFC44E4();
  (*(void (**)(uint64_t, _QWORD))(v0[56] + 8))(v30, v0[57]);
  v32 = (_QWORD *)(v26 + *(int *)(v19 + 104));
  v33 = v32[1];
  *(_QWORD *)(v7 - 200) = *v32;
  *(_QWORD *)(v7 - 192) = v33;
  swift_bridgeObjectRetain();
  v34 = v0[16];
  v35 = v0[75];
  sub_21FFC494C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_62_2();
  swift_release();
  (*(void (**)(uint64_t, _QWORD))(v0[58] + 8))(v31, v0[59]);
  OUTLINED_FUNCTION_157(v35, *(uint64_t (**)(uint64_t, uint64_t))(v0[36] + 8));
  v36 = v0[60];
  sub_21FFC4694();
  v37 = sub_21FFC46A0();
  __swift_storeEnumTagSinglePayload(v36, 0, 1, v37);
  v38 = v0[24];
  v39 = v0[25];
  sub_21FFC4AB4();
  sub_21FF103AC(v36, &qword_25558F628);
  (*(void (**)(uint64_t, uint64_t))(v0[35] + 8))(v34, v39);
  sub_21FFC46F4();
  v40 = v0[19];
  sub_21FFC4ACC();
  OUTLINED_FUNCTION_64_1(v0[62]);
  (*(void (**)(uint64_t, uint64_t))(v0[32] + 8))(v38, v40);
  v41 = v0[14];
  MEMORY[0x2207D9D5C](1, v0[13], v0[15]);
  OUTLINED_FUNCTION_5_12(v0[29]);
  v42 = v27[1];
  v43 = v27[2];
  *(_QWORD *)(v7 - 200) = *v27;
  *(_QWORD *)(v7 - 192) = v42;
  *(_QWORD *)(v7 - 184) = v43;
  sub_21FFC4CC4();
  v44 = *(_QWORD *)(v7 - 232);
  *(_QWORD *)(v7 - 200) = *(_QWORD *)(v7 - 240);
  *(_QWORD *)(v7 - 192) = v44;
  v45 = v0[79];
  v46 = v0[78];
  ((void (*)(uint64_t, _QWORD, uint64_t))v0[73])(v45, v0[83], v46);
  v47 = (_QWORD *)OUTLINED_FUNCTION_58_3();
  v48 = v0[76];
  v47[2] = v0[81];
  v47[3] = v48;
  v49 = v0[82];
  v47[4] = v0[80];
  v47[5] = v49;
  v50 = (char *)v47 + v0[72];
  v47[6] = v0[77];
  ((void (*)(char *, uint64_t, uint64_t))v0[69])(v50, v45, v46);
  v51 = v0[23];
  sub_21FF0E140();
  v52 = v0[27];
  sub_21FFC4B98();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v0[40] + 8))(v41, v51);
  v53 = v0[65];
  v54 = v0[64];
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v53 + 104))(v54, *MEMORY[0x24BDEE5F0], v0[66]);
  v55 = v0[28];
  v56 = v0[30];
  v57 = v0[31];
  sub_21FFC4AC0();
  OUTLINED_FUNCTION_51_3(v54, *(uint64_t (**)(uint64_t, uint64_t))(v53 + 8));
  (*(void (**)(uint64_t, uint64_t))(v0[38] + 8))(v52, v57);
  v58 = v0[79];
  v59 = v0[78];
  ((void (*)(uint64_t, _QWORD, uint64_t))v0[73])(v58, v0[83], v59);
  v60 = (_QWORD *)OUTLINED_FUNCTION_58_3();
  v61 = v0[76];
  v60[2] = v0[81];
  v60[3] = v61;
  v62 = v0[80];
  v63 = v0[82];
  v60[4] = v62;
  v60[5] = v63;
  v64 = (char *)v60 + v0[72];
  v65 = v0[77];
  v60[6] = v65;
  ((void (*)(char *, uint64_t, uint64_t))v0[69])(v64, v58, v59);
  *(_QWORD *)(v7 - 200) = v57;
  *(_QWORD *)(v7 - 192) = v56;
  v66 = OUTLINED_FUNCTION_58_0();
  sub_21FF65C6C((uint64_t)sub_21FFAE35C, (uint64_t)v60, v0[37], v66);
  swift_release();
  OUTLINED_FUNCTION_157(v55, *(uint64_t (**)(uint64_t, uint64_t))(v0[42] + 8));
  sub_21FFC4E50();
  v0[86] = v0[81];
  v0[87] = v61;
  v0[88] = v62;
  v0[89] = v0[82];
  v0[90] = v65;
  v0[91] = v0[83];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591970);
  v67 = sub_21FF0F948();
  *(_QWORD *)(v7 - 256) = v66;
  *(_QWORD *)(v7 - 248) = v67;
  OUTLINED_FUNCTION_92();
}

void sub_21FFAA7C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;

  sub_21FFAEB94(&qword_255591978, v2);
  sub_21FFC4B2C();
  OUTLINED_FUNCTION_157(v3, *(uint64_t (**)(uint64_t, uint64_t))(v1[47] + 8));
  sub_21FFAE490(&qword_2555919A0, &qword_255591950);
  v1[94] = a1;
  v1[95] = v5;
  OUTLINED_FUNCTION_75();
}

void sub_21FFAA864(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_21FF9F304();
  (*(void (**)(uint64_t, uint64_t))(v1[49] + 8))(v3, v2);
  sub_21FFAE490(&qword_25558E588, &qword_25558E578);
  v1[92] = a1;
  v1[93] = v5;
  OUTLINED_FUNCTION_75();
}

void sub_21FFAA8CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);

  v3 = v0[46];
  sub_21FFB5D18(v2, v1, v3);
  v4 = *(void (**)(uint64_t, uint64_t))(v0[50] + 8);
  v4(v2, v1);
  sub_21FFB57EC(v3, v1, v0[67]);
  v4(v3, v1);
  OUTLINED_FUNCTION_24();
}

void sub_21FFAA928(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[12];

  v11[0] = a2;
  v3 = *(a1 - 1);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v3 + 16))((char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (char *)swift_allocObject();
  v8 = a1[2];
  v7 = a1[3];
  *((_QWORD *)v6 + 2) = v8;
  *((_QWORD *)v6 + 3) = v7;
  v9 = a1[5];
  *((_QWORD *)v6 + 4) = a1[4];
  *((_QWORD *)v6 + 5) = v9;
  v10 = a1[6];
  *((_QWORD *)v6 + 6) = v10;
  (*(void (**)(char *, char *, _QWORD *))(v3 + 32))(&v6[v5], (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_21FFC5030();
  swift_getAssociatedTypeWitness();
  v11[7] = v8;
  v11[8] = v7;
  v11[9] = v9;
  v11[10] = v10;
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FFAAA34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedConformanceWitness;
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

  sub_21FFC419C();
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  swift_getTupleTypeMetadata2();
  v5 = sub_21FFC4EBC();
  v6 = MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAF8], v2);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v4 - 120) = v2;
  *(_QWORD *)(v4 - 112) = v3;
  *(_QWORD *)(v4 - 104) = v5;
  *(_QWORD *)(v4 - 96) = v6;
  *(_QWORD *)(v4 - 88) = AssociatedConformanceWitness;
  v8 = sub_21FFC4DE4();
  v9 = sub_21FFC5AC8();
  *(_QWORD *)(v4 - 128) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v5);
  *(_QWORD *)(v4 - 136) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v8, v4 - 128);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF5578], v9, v4 - 136);
  v10 = sub_21FFC3F98();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEB188], v10);
  v11 = sub_21FFC3FA4();
  v13 = _s27DismissAlertTriggerModifierVMa(255, v0, v1, v12);
  v14 = sub_21FFC419C();
  v15 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEB238], v11);
  v16 = MEMORY[0x2207DB4B4](&unk_21FFC8558, v13);
  *(_QWORD *)(v4 - 152) = v15;
  *(_QWORD *)(v4 - 144) = v16;
  MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v14, v4 - 152);
  *(_QWORD *)(v4 - 168) = sub_21FFC410C();
  *(_QWORD *)(v4 - 160) = v17;
  v18 = sub_21FFC4118();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEC6F8], v18);
  sub_21FFB5D18(v4 - 168, v18, v4 - 120);
  swift_release();
  v19 = *(_QWORD *)(v4 - 112);
  *(_QWORD *)(v4 - 168) = *(_QWORD *)(v4 - 120);
  *(_QWORD *)(v4 - 160) = v19;
  sub_21FFB57EC(v4 - 168, v18, *(_QWORD *)(v4 - 176));
  return swift_release();
}

void sub_21FFAAC78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[7] = sub_21FFC5960();
  v6[8] = sub_21FFC5954();
  v6[9] = swift_task_alloc();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a4;
  v6[5] = a5;
  v6[6] = a6;
  _s25LibrarySectionContentViewVMa();
}

uint64_t sub_21FFAACF4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = v2;
  v1[1] = sub_21FFAAD24;
  return sub_21FFAADA0(a1);
}

uint64_t sub_21FFAAD24()
{
  OUTLINED_FUNCTION_44_5();
  OUTLINED_FUNCTION_73();
  sub_21FFC5930();
  return OUTLINED_FUNCTION_19_4();
}

uint64_t sub_21FFAAD78()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_25(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21FFAADA0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;

  v2[7] = a1;
  v2[8] = v1;
  v2[9] = sub_21FFC5960();
  v2[10] = sub_21FFC5954();
  v4 = (_QWORD *)swift_task_alloc();
  v2[11] = v4;
  *v4 = v2;
  v4[1] = sub_21FFAAE18;
  return sub_21FFAB7CC(a1);
}

uint64_t sub_21FFAAE18()
{
  OUTLINED_FUNCTION_44_5();
  OUTLINED_FUNCTION_73();
  sub_21FFC5930();
  return OUTLINED_FUNCTION_19_4();
}

uint64_t sub_21FFAAE6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t *, uint64_t, uint64_t);
  unint64_t v8;

  swift_release();
  sub_21FFB5E88(v0 + 16);
  v1 = *(_QWORD *)(v0 + 40);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 56);
    v2 = *(_QWORD *)(v0 + 64);
    v4 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    v5 = *(_QWORD *)(v2 + *(int *)(v3 + 96));
    v8 = v5;
    v6 = *(void (**)(unint64_t *, uint64_t, uint64_t))(v4 + 8);
    sub_21FF0E594(v5);
    v6(&v8, v1, v4);
    sub_21FF0EAB8(v5);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  else
  {
    sub_21FF103AC(v0 + 16, &qword_25558E0E0);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_21FFAAF38()
{
  _s25LibrarySectionContentViewVMa();
}

uint64_t sub_21FFAAF84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  _BYTE *v17;
  __int128 *v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v34[96];

  v6 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v4 - 200) = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v4 - 184) = &v34[-v7];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E1B8);
  MEMORY[0x24BDAC7A8](v8);
  *(_QWORD *)(v4 - 192) = &v34[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)(v4 - 160) = v1;
  *(_QWORD *)(v4 - 176) = v2;
  v10 = sub_21FFC5030();
  v11 = sub_21FFC5AC8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = &v34[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v13);
  v17 = &v34[-v16];
  v18 = (__int128 *)(v3 + *(int *)(a1 + 84));
  v19 = *v18;
  v20 = *((_QWORD *)v18 + 2);
  *(_OWORD *)(v4 - 120) = v19;
  *(_QWORD *)(v4 - 104) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591968);
  sub_21FFC4CC4();
  v22 = *(_QWORD *)(v4 - 136);
  v21 = *(_QWORD *)(v4 - 128);
  swift_bridgeObjectRelease();
  v23 = HIBYTE(v21) & 0xF;
  if ((v21 & 0x2000000000000000) == 0)
    v23 = v22 & 0xFFFFFFFFFFFFLL;
  if (!v23)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v10);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v12 + 16))(v15, v17, v11);
    sub_21FFC4CE8();
    sub_21FFC4CD0();
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v17, v11);
  }
  v24 = sub_21FFC5984();
  v25 = *(_QWORD *)(v4 - 192);
  __swift_storeEnumTagSinglePayload(v25, 1, 1, v24);
  v26 = *(_QWORD *)(v4 - 184);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v26, v3, a1);
  sub_21FFC5960();
  v27 = sub_21FFC5954();
  v28 = (*(unsigned __int8 *)(v6 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v29 = (char *)swift_allocObject();
  v30 = MEMORY[0x24BEE6930];
  *((_QWORD *)v29 + 2) = v27;
  *((_QWORD *)v29 + 3) = v30;
  v31 = *(_QWORD *)(v4 - 168);
  *((_QWORD *)v29 + 4) = *(_QWORD *)(v4 - 176);
  *((_QWORD *)v29 + 5) = v31;
  v32 = *(_QWORD *)(v4 - 152);
  *((_QWORD *)v29 + 6) = *(_QWORD *)(v4 - 160);
  *((_QWORD *)v29 + 7) = v32;
  *((_QWORD *)v29 + 8) = *(_QWORD *)(v4 - 144);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(&v29[v28], v26, a1);
  sub_21FF66F9C(v25, (uint64_t)&unk_2555919C8, (uint64_t)v29);
  return swift_release();
}

uint64_t sub_21FFAB1FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  v8[11] = a8;
  v8[12] = v11;
  v8[9] = a6;
  v8[10] = a7;
  v8[7] = a4;
  v8[8] = a5;
  sub_21FFC5960();
  v8[13] = sub_21FFC5954();
  v8[14] = sub_21FFC5930();
  v8[15] = v9;
  return swift_task_switch();
}

void sub_21FFAB278()
{
  uint64_t v0;
  uint64_t v1;

  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 96);
  *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 48) = v1;
  _s25LibrarySectionContentViewVMa();
}

uint64_t sub_21FFAB2B4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v4;

  if (sub_21FFA989C(a1))
  {
    swift_release();
    sub_21FFAB394(a1);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  else
  {
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 128) = v4;
    *v4 = v1;
    v4[1] = sub_21FFAB320;
    return sub_21FFAB7CC(a1);
  }
}

uint64_t sub_21FFAB320()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21FFAB36C()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_25(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21FFAB394(uint64_t a1)
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
  __int128 *v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;

  v2 = v1;
  v4 = *(_QWORD *)(a1 + 16);
  v52 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v52 + 8);
  v60 = v4;
  v56 = v5;
  v6 = sub_21FFC5030();
  v50 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v51 = (char *)&v49 - v7;
  v57 = v8;
  v9 = sub_21FFC5AC8();
  v10 = *(_QWORD *)(v9 - 8);
  v58 = v9;
  v59 = v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v55 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v54 = (char *)&v49 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v53 = (char *)&v49 - v15;
  v16 = sub_21FFC35A8();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = (__int128 *)(v1 + *(int *)(a1 + 84));
  v25 = *v24;
  v26 = *((_QWORD *)v24 + 2);
  v61 = v25;
  v62 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591968);
  sub_21FFC4CC4();
  v27 = v63;
  swift_bridgeObjectRelease();
  v28 = v1;
  if ((*((_QWORD *)&v27 + 1) & 0x2000000000000000) != 0)
    v29 = HIBYTE(*((_QWORD *)&v27 + 1)) & 0xFLL;
  else
    v29 = v27 & 0xFFFFFFFFFFFFLL;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, v2, a1);
  if (!v29)
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, a1);
  v30 = &v23[*(int *)(a1 + 84)];
  v31 = *(_OWORD *)v30;
  v32 = *((_QWORD *)v30 + 2);
  v61 = v31;
  v62 = v32;
  sub_21FFC4CC4();
  v61 = v63;
  sub_21FFC359C();
  sub_21FF2E0A8();
  v33 = sub_21FFC5AEC();
  v35 = v34;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v35 & 0x2000000000000000) != 0)
    v36 = HIBYTE(v35) & 0xF;
  else
    v36 = v33 & 0xFFFFFFFFFFFFLL;
  result = (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, a1);
  if (v36)
  {
    v38 = v58;
    v39 = sub_21FFC4CE8();
    v40 = (uint64_t)v53;
    v49 = v39;
    sub_21FFC4CC4();
    v41 = v57;
    if (__swift_getEnumTagSinglePayload(v40, 1, v57))
    {
      v42 = v59;
      v43 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
      v43(v40, v38);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v51, v40, v41);
      v42 = v59;
      v43 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
      v44 = ((uint64_t (*)(uint64_t, uint64_t))v43)(v40, v38);
      MEMORY[0x24BDAC7A8](v44);
      v45 = *(_QWORD *)(a1 + 24);
      *(&v49 - 6) = v60;
      *(&v49 - 5) = v45;
      *(&v49 - 4) = v52;
      *(_OWORD *)(&v49 - 3) = *(_OWORD *)(a1 + 40);
      *(&v49 - 1) = v28;
      MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAE8], v41);
      v46 = sub_21FFC584C();
      if (v46)
      {
LABEL_14:
        *(_QWORD *)&v61 = v46;
        v47 = sub_21FFC5918();
        MEMORY[0x2207DB4B4](MEMORY[0x24BEE12C8], v47);
        v48 = (uint64_t)v54;
        sub_21FFC503C();
        __swift_storeEnumTagSinglePayload(v48, 0, 1, v41);
        (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v55, v48, v38);
        sub_21FFC4CD0();
        return ((uint64_t (*)(uint64_t, uint64_t))v43)(v48, v38);
      }
    }
    v46 = sub_21FFC58B8();
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_21FFAB7CC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[22] = a1;
  v2[23] = v1;
  v2[24] = *(_QWORD *)(a1 + 16);
  v2[25] = sub_21FFC5030();
  v4 = sub_21FFC5AC8();
  v2[26] = v4;
  v2[27] = *(_QWORD *)(v4 - 8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v5 = sub_21FFC5108();
  v2[30] = v5;
  v2[31] = *(_QWORD *)(v5 - 8);
  v2[32] = swift_task_alloc();
  v6 = sub_21FFC35A8();
  v2[33] = v6;
  v2[34] = *(_QWORD *)(v6 - 8);
  v2[35] = swift_task_alloc();
  v2[36] = *(_QWORD *)(a1 - 8);
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v7 = sub_21FFC50E4();
  v2[39] = v7;
  v2[40] = *(_QWORD *)(v7 - 8);
  v2[41] = swift_task_alloc();
  sub_21FFC5960();
  v2[42] = sub_21FFC5954();
  v2[43] = sub_21FFC5930();
  v2[44] = v8;
  return swift_task_switch();
}

uint64_t sub_21FFAB960()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  void (*v6)(void);
  _BOOL4 v7;
  __int128 *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  __int128 *v28;
  __int128 v29;
  uint64_t v30;
  _QWORD *v31;

  v1 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 184);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 320) + 16))(*(_QWORD *)(v0 + 328), v3 + *(int *)(v4 + 72), *(_QWORD *)(v0 + 312));
  v5 = sub_21FFA989C(v4);
  v6 = *(void (**)(void))(v2 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v6)(v1, v3, v4);
  if (v5)
  {
    v7 = 0;
  }
  else
  {
    v8 = (__int128 *)(*(_QWORD *)(v0 + 304) + *(int *)(*(_QWORD *)(v0 + 176) + 84));
    v9 = *v8;
    v10 = *((_QWORD *)v8 + 2);
    *(_OWORD *)(v0 + 40) = v9;
    *(_QWORD *)(v0 + 56) = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255591968);
    sub_21FFC4CC4();
    v11 = *(_QWORD *)(v0 + 88);
    v12 = *(_QWORD *)(v0 + 96);
    swift_bridgeObjectRelease();
    v13 = HIBYTE(v12) & 0xF;
    if ((v12 & 0x2000000000000000) == 0)
      v13 = v11 & 0xFFFFFFFFFFFFLL;
    v7 = v13 != 0;
  }
  v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 288) + 8);
  v14(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 176));
  OUTLINED_FUNCTION_55_4();
  v6();
  v15 = *(_QWORD *)(v0 + 296);
  if (v7)
  {
    v16 = *(_QWORD *)(v0 + 272);
    v17 = *(_QWORD *)(v0 + 280);
    v18 = *(_QWORD *)(v0 + 264);
    v19 = *(_QWORD *)(v0 + 176);
    v20 = (__int128 *)(v15 + *(int *)(v19 + 84));
    v21 = *v20;
    v22 = *((_QWORD *)v20 + 2);
    *(_OWORD *)(v0 + 64) = v21;
    *(_QWORD *)(v0 + 80) = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255591968);
    sub_21FFC4CC4();
    v23 = *(_QWORD *)(v0 + 144);
    *(_QWORD *)(v0 + 104) = *(_QWORD *)(v0 + 136);
    *(_QWORD *)(v0 + 112) = v23;
    sub_21FFC359C();
    sub_21FF2E0A8();
    v24 = sub_21FFC5AEC();
    v26 = v25;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v26 & 0x2000000000000000) != 0)
      v27 = HIBYTE(v26) & 0xF;
    else
      v27 = v24 & 0xFFFFFFFFFFFFLL;
    v14(v15, v19);
    if (v27)
    {
      v28 = (__int128 *)(*(_QWORD *)(v0 + 184) + *(int *)(v19 + 84));
      v29 = *v28;
      v30 = *((_QWORD *)v28 + 2);
      *(_OWORD *)(v0 + 16) = v29;
      *(_QWORD *)(v0 + 32) = v30;
      sub_21FFC4CC4();
      sub_21FFC50B4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v14(*(_QWORD *)(v0 + 296), *(_QWORD *)(v0 + 176));
  }
  v31 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v31;
  *v31 = v0;
  v31[1] = sub_21FFABBCC;
  return sub_21FFC50CC();
}

uint64_t sub_21FFABBCC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 368) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_19_4();
}

uint64_t sub_21FFABC24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v0 + 312);
  v9 = *(_QWORD *)(v0 + 328);
  v6 = *(_QWORD *)(v0 + 248);
  v7 = *(_QWORD *)(v0 + 320);
  v1 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 256);
  v5 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 200);
  swift_release();
  sub_21FFC50FC();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v2);
  OUTLINED_FUNCTION_43_5();
  sub_21FFC4CE8();
  OUTLINED_FUNCTION_61_3();
  OUTLINED_FUNCTION_53_3();
  sub_21FFC4CC4();
  OUTLINED_FUNCTION_43_5();
  OUTLINED_FUNCTION_61_3();
  OUTLINED_FUNCTION_53_3();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v8);
  OUTLINED_FUNCTION_20_7();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21FFABD5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 312);
  v3 = *(_QWORD *)(v0 + 320);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  if (qword_25558DF28 != -1)
    swift_once();
  v4 = *(void **)(v0 + 368);
  v5 = sub_21FFC3EFC();
  __swift_project_value_buffer(v5, (uint64_t)qword_255598320);
  v6 = v4;
  v7 = v4;
  v8 = sub_21FFC3EE4();
  v9 = sub_21FFC5A44();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 368);
  if (v10)
  {
    v12 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    *(_DWORD *)v12 = 136315394;
    v13 = sub_21FFC5D68();
    *(_QWORD *)(v0 + 168) = sub_21FFB76CC(v13, v14, &v19);
    sub_21FFC5AD4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    *(_QWORD *)(v0 + 160) = v11;
    v15 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25558E118);
    v16 = sub_21FFC57E0();
    *(_QWORD *)(v0 + 152) = sub_21FFB76CC(v16, v17, &v19);
    sub_21FFC5AD4();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    _os_log_impl(&dword_21FF05000, v8, v9, "Failed to request items of type %s from the user's music library. Error = %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
  }
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3();

  OUTLINED_FUNCTION_20_7();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_21FFABFBC()
{
  uint64_t v0;

  v0 = type metadata accessor for MusicPicker.Click.ControlID();
  MEMORY[0x24BDAC7A8](v0);
  _s25LibrarySectionContentViewVMa();
}

void sub_21FFAC040()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void (*v9)(_BYTE *, uint64_t, uint64_t, uint64_t);

  sub_21FFB5E88(v2 - 104);
  v3 = *(_QWORD *)(v2 - 80);
  if (v3)
  {
    v4 = *(_QWORD *)(v2 - 72);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 - 104), *(_QWORD *)(v2 - 80));
    *v0 = *(_BYTE *)(v1 + 32);
    swift_storeEnumTagMultiPayload();
    v5 = *(_BYTE *)(v1 + 40);
    v6 = *(_QWORD *)(v1 + 48);
    v7 = *(_QWORD *)(v1 + 56);
    v8 = *(_QWORD *)(v1 + 64);
    *(_BYTE *)(v2 - 136) = v5;
    *(_QWORD *)(v2 - 128) = v6;
    *(_QWORD *)(v2 - 120) = v7;
    *(_QWORD *)(v2 - 112) = v8;
    v9 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v4 + 16);
    swift_bridgeObjectRetain();
    sub_21FF0E594(v8);
    v9(v0, v2 - 136, v3, v4);
    swift_bridgeObjectRelease();
    sub_21FF0EAB8(v8);
    sub_21FF9E438((uint64_t)v0);
    __swift_destroy_boxed_opaque_existential_1(v2 - 104);
  }
  else
  {
    sub_21FF103AC(v2 - 104, &qword_25558E0E0);
  }
}

void sub_21FFAC114(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[9];
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v25 = a1;
  v26 = a6;
  v24 = a7;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591998);
  v17[6] = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v17[5] = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555919A8);
  MEMORY[0x24BDAC7A8](v18);
  v17[8] = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558ED48);
  v17[7] = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v21 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591988);
  MEMORY[0x24BDAC7A8](v23);
  v19 = (char *)v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FFC5030();
  v15 = sub_21FFC5AC8();
  v16 = MEMORY[0x24BDAC7A8](v15);
  MEMORY[0x24BDAC7A8](v16);
  v17[1] = a2;
  v27 = a2;
  v28 = a3;
  v17[2] = a3;
  v17[3] = a4;
  v29 = a4;
  v30 = a5;
  v17[4] = a5;
  v31 = v26;
  _s25LibrarySectionContentViewVMa();
}

uint64_t sub_21FFAC300(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  __int128 v14;
  uint64_t v15;
  unint64_t v16;
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
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;

  v9 = *(_QWORD *)(v7 - 160);
  sub_21FFC4CE8();
  sub_21FFC4CC4();
  if (__swift_getEnumTagSinglePayload(v6, 1, v1) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v3);
LABEL_9:
    v24 = 1;
    v25 = *(_QWORD *)(v7 - 168);
    return __swift_storeEnumTagSinglePayload(v25, v24, 1, *(_QWORD *)(v7 - 176));
  }
  v11 = *(_QWORD *)(v7 - 192);
  v10 = *(_QWORD *)(v7 - 184);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v5, v6, v1);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDDEB00], v1);
  v12 = v1;
  if ((sub_21FFC5A08() & 1) == 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
    goto LABEL_9;
  }
  *(_QWORD *)(v7 - 288) = v2;
  v13 = (__int128 *)(v9 + *(int *)(a1 + 84));
  v14 = *v13;
  v15 = *((_QWORD *)v13 + 2);
  *(_OWORD *)(v7 - 128) = v14;
  *(_QWORD *)(v7 - 112) = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591968);
  sub_21FFC4CC4();
  v17 = *(_QWORD *)(v7 - 144);
  v16 = *(_QWORD *)(v7 - 136);
  v18 = swift_bridgeObjectRelease();
  v19 = HIBYTE(v16) & 0xF;
  if ((v16 & 0x2000000000000000) == 0)
    v19 = v17 & 0xFFFFFFFFFFFFLL;
  if (v19)
  {
    v20 = v11;
    sub_21FFC45A4();
    v21 = *(_QWORD *)(v7 - 232);
    v22 = *(_QWORD *)(v7 - 200);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v21 + 16))(*(_QWORD *)(v7 - 224), v20, v22);
    swift_storeEnumTagMultiPayload();
    sub_21FFAE490(&qword_25558ED40, &qword_25558ED48);
    sub_21FFAE490(&qword_255591990, &qword_255591998);
    v23 = *(_QWORD *)(v7 - 208);
    sub_21FFC44C0();
    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  }
  else
  {
    MEMORY[0x24BDAC7A8](v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555919B0);
    sub_21FFAE490(&qword_2555919B8, &qword_2555919B0);
    v26 = *(_QWORD *)(v7 - 248);
    sub_21FFC4598();
    v27 = v5;
    v28 = *(_QWORD *)(v7 - 240);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v28 + 16))(*(_QWORD *)(v7 - 224), v26, v10);
    swift_storeEnumTagMultiPayload();
    sub_21FFAE490(&qword_25558ED40, &qword_25558ED48);
    sub_21FFAE490(&qword_255591990, &qword_255591998);
    v23 = *(_QWORD *)(v7 - 208);
    sub_21FFC44C0();
    v29 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v5 = v27;
    v30 = v26;
    v12 = v1;
    v29(v30, v10);
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 288) + 8))(v5, v12);
  v25 = *(_QWORD *)(v7 - 168);
  sub_21FFAEB60(v23, v25, &qword_255591988);
  v24 = 0;
  return __swift_storeEnumTagSinglePayload(v25, v24, 1, *(_QWORD *)(v7 - 176));
}

uint64_t sub_21FFAC694()
{
  return sub_21FFC4CAC();
}

uint64_t sub_21FFAC6D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21FFC4C7C();
  *a1 = result;
  return result;
}

uint64_t sub_21FFAC704@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;

  sub_21FF2E0A8();
  swift_bridgeObjectRetain();
  result = sub_21FFC48EC();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4 & 1;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

void sub_21FFAC76C()
{
  sub_21FFC5030();
  swift_getAssociatedTypeWitness();
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FFAC808()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedConformanceWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  void (*v27)(_BYTE *, uint64_t);
  _BYTE v29[96];

  sub_21FFC419C();
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  swift_getTupleTypeMetadata2();
  v5 = sub_21FFC4EBC();
  v6 = MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAF8], v0);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v4 - 128) = v0;
  *(_QWORD *)(v4 - 120) = v2;
  *(_QWORD *)(v4 - 112) = v5;
  *(_QWORD *)(v4 - 104) = v6;
  *(_QWORD *)(v4 - 96) = AssociatedConformanceWitness;
  v8 = sub_21FFC4DE4();
  v9 = sub_21FFC5AC8();
  *(_QWORD *)(v4 - 136) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v5);
  *(_QWORD *)(v4 - 144) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v8, v4 - 136);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF5578], v9, v4 - 144);
  v10 = sub_21FFC3F98();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEB188], v10);
  v11 = sub_21FFC3FA4();
  *(_QWORD *)(v4 - 288) = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = &v29[-v12];
  v15 = _s27DismissAlertTriggerModifierVMa(255, v1, v3, v14);
  v16 = sub_21FFC419C();
  *(_QWORD *)(v4 - 280) = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = &v29[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v17);
  v21 = &v29[-v20];
  sub_21FFC4724();
  *(_QWORD *)(v4 - 208) = *(_QWORD *)(v4 - 272);
  *(_QWORD *)(v4 - 200) = v1;
  v22 = *(_QWORD *)(v4 - 264);
  *(_QWORD *)(v4 - 192) = *(_QWORD *)(v4 - 256);
  *(_QWORD *)(v4 - 184) = v22;
  v23 = *(_QWORD *)(v4 - 248);
  *(_QWORD *)(v4 - 176) = v3;
  *(_QWORD *)(v4 - 168) = v23;
  sub_21FFC3FB0();
  v24 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEB238], v11);
  v25 = sub_21FF436DC();
  sub_21FF5AF74(*(_QWORD *)(v4 - 240), v25, v1, v11, v1, v24, v3);
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v4 - 288) + 8))(v13, v11);
  v26 = MEMORY[0x2207DB4B4](&unk_21FFC8558, v15);
  *(_QWORD *)(v4 - 160) = v24;
  *(_QWORD *)(v4 - 152) = v26;
  MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v16, v4 - 160);
  sub_21FFB5D18((uint64_t)v19, v16, (uint64_t)v21);
  v27 = *(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v4 - 280) + 8);
  v27(v19, v16);
  sub_21FFB57EC((uint64_t)v21, v16, *(_QWORD *)(v4 - 232));
  return ((uint64_t (*)(_BYTE *, uint64_t))v27)(v21, v16);
}

void sub_21FFACB28(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[24];

  v12[4] = a4;
  v12[5] = a1;
  v12[7] = a6;
  v10 = sub_21FFC4580();
  MEMORY[0x24BDAC7A8](v10);
  v12[6] = (char *)v12 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FFC5030();
  swift_getAssociatedTypeWitness();
  v12[18] = a2;
  v12[19] = a3;
  v12[20] = a4;
  v12[21] = a5;
  _s13ItemShelfCellVMa();
}

void sub_21FFACBF0()
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
  uint64_t AssociatedConformanceWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_21FFC419C();
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  swift_getTupleTypeMetadata2();
  v7 = sub_21FFC4EBC();
  v8 = MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAF8], v5);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v6 - 128) = v5;
  *(_QWORD *)(v6 - 120) = v2;
  *(_QWORD *)(v6 - 112) = v7;
  *(_QWORD *)(v6 - 104) = v8;
  *(_QWORD *)(v6 - 96) = AssociatedConformanceWitness;
  v10 = sub_21FFC4DE4();
  v11 = sub_21FFC5AC8();
  *(_QWORD *)(v6 - 136) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v7);
  *(_QWORD *)(v6 - 144) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v10, v6 - 136);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF5578], v11, v6 - 144);
  v12 = sub_21FFC3F98();
  *(_QWORD *)(v6 - 248) = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v13);
  *(_QWORD *)(v6 - 256) = sub_21FFC4484();
  *(_QWORD *)(v6 - 128) = v0;
  *(_QWORD *)(v6 - 120) = v1;
  v14 = *(_QWORD *)(v6 - 240);
  *(_QWORD *)(v6 - 112) = v4;
  *(_QWORD *)(v6 - 104) = v14;
  *(_QWORD *)(v6 - 96) = v3;
  _s25LibrarySectionContentViewVMa();
}

uint64_t sub_21FFACD78(uint64_t a1)
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
  void (*v11)(uint64_t, uint64_t);

  v10 = *(_QWORD *)(v9 - 232);
  *(_QWORD *)(v9 - 264) = *(_QWORD *)(v10 + *(int *)(a1 + 108) + 24);
  *(_QWORD *)(v9 - 192) = v7;
  *(_QWORD *)(v9 - 184) = v3;
  *(_QWORD *)(v9 - 176) = v6;
  *(_QWORD *)(v9 - 168) = v2;
  *(_QWORD *)(v9 - 160) = v5;
  *(_QWORD *)(v9 - 152) = v10;
  sub_21FF38FB0();
  sub_21FFC3F8C();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEB188], v8);
  sub_21FFB5D18(v4, v8, v1);
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 248) + 8);
  v11(v4, v8);
  sub_21FFB57EC(v1, v8, *(_QWORD *)(v9 - 216));
  return ((uint64_t (*)(uint64_t, uint64_t))v11)(v1, v8);
}

void sub_21FFACE5C()
{
  _s25LibrarySectionContentViewVMa();
}

void sub_21FFACEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v15 = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v14 - 272) = v15;
  *(_QWORD *)(v14 - 304) = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v14 - 296) = (char *)&a9 - v16;
  *(_QWORD *)(v14 - 240) = v9;
  sub_21FFC5030();
  swift_getAssociatedTypeWitness();
  *(_QWORD *)(v14 - 128) = v13;
  *(_QWORD *)(v14 - 120) = v12;
  *(_QWORD *)(v14 - 248) = v12;
  *(_QWORD *)(v14 - 232) = v11;
  *(_QWORD *)(v14 - 224) = v10;
  *(_QWORD *)(v14 - 112) = v11;
  *(_QWORD *)(v14 - 104) = v10;
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FFACF50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedConformanceWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v33;
  void (*v34)(uint64_t, _BYTE *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(_QWORD, uint64_t);
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  _BYTE v54[80];

  sub_21FFC419C();
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  swift_getTupleTypeMetadata2();
  v6 = sub_21FFC4EBC();
  v7 = MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAF8], v0);
  *(_QWORD *)(v5 - 264) = v1;
  *(_QWORD *)(v5 - 288) = v3;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v5 - 128) = v0;
  *(_QWORD *)(v5 - 120) = v2;
  *(_QWORD *)(v5 - 280) = v2;
  *(_QWORD *)(v5 - 184) = v6;
  *(_QWORD *)(v5 - 112) = v6;
  *(_QWORD *)(v5 - 104) = v7;
  *(_QWORD *)(v5 - 328) = v7;
  *(_QWORD *)(v5 - 96) = AssociatedConformanceWitness;
  v9 = sub_21FFC4DE4();
  *(_QWORD *)(v5 - 312) = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  *(_QWORD *)(v5 - 336) = &v54[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  *(_QWORD *)(v5 - 320) = &v54[-v12];
  v13 = sub_21FFC5AC8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = &v54[-v16];
  v18 = *(_QWORD *)(v0 - 8);
  *(_QWORD *)(v5 - 344) = v18;
  v19 = *(_QWORD *)(v18 + 64);
  v20 = MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v5 - 352) = &v54[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v5 - 216) = &v54[-v22];
  MEMORY[0x24BDAC7A8](v21);
  v24 = &v54[-v23];
  v25 = sub_21FFC5AC8();
  *(_QWORD *)(v5 - 192) = v25;
  *(_QWORD *)(v5 - 208) = *(_QWORD *)(v25 - 8);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v28 = &v54[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v26);
  *(_QWORD *)(v5 - 200) = &v54[-v29];
  *(_QWORD *)(v5 - 256) = v4;
  sub_21FFC4CE8();
  sub_21FFC4CC4();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v0) == 1)
  {
    (*(void (**)(_BYTE *, uint64_t))(v14 + 8))(v17, v13);
    __swift_storeEnumTagSinglePayload((uint64_t)v28, 1, 1, v9);
    v30 = *(_QWORD *)(v5 - 184);
    *(_QWORD *)(v5 - 136) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v30);
    MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v9, v5 - 136);
  }
  else
  {
    *(_QWORD *)(v5 - 360) = v28;
    v31 = *(_QWORD *)(v5 - 344);
    v32 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v31 + 32);
    *(_QWORD *)(v5 - 376) = v32;
    v33 = v24;
    v32(v24, v17, v0);
    v34 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v31 + 16);
    v35 = *(_QWORD *)(v5 - 216);
    *(_QWORD *)(v5 - 368) = v24;
    v34(v35, v24, v0);
    v36 = *(_QWORD *)(v5 - 272);
    v37 = *(_QWORD *)(v5 - 296);
    v38 = *(_QWORD *)(v5 - 256);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v36 + 16))(v37, *(_QWORD *)(v5 - 168), v38);
    v39 = *(_QWORD *)(v5 - 352);
    v34(v39, v33, v0);
    v40 = (*(unsigned __int8 *)(v36 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    v41 = (*(_QWORD *)(v5 - 304) + v40 + *(unsigned __int8 *)(v31 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
    v42 = (char *)swift_allocObject();
    v43 = *(_QWORD *)(v5 - 248);
    *((_QWORD *)v42 + 2) = *(_QWORD *)(v5 - 288);
    *((_QWORD *)v42 + 3) = v43;
    v44 = *(_QWORD *)(v5 - 232);
    *((_QWORD *)v42 + 4) = *(_QWORD *)(v5 - 240);
    *((_QWORD *)v42 + 5) = v44;
    *((_QWORD *)v42 + 6) = *(_QWORD *)(v5 - 224);
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 32))(&v42[v40], v37, v38);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 - 376))(&v42[v41], v39, v0);
    v30 = *(_QWORD *)(v5 - 184);
    v45 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v30);
    v46 = *(_QWORD *)(v5 - 336);
    sub_21FFC4DD8();
    v47 = *(void (**)(_QWORD, uint64_t))(v31 + 8);
    v28 = *(_BYTE **)(v5 - 360);
    v47(*(_QWORD *)(v5 - 368), v0);
    *(_QWORD *)(v5 - 160) = v45;
    MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v9, v5 - 160);
    v48 = *(_QWORD *)(v5 - 320);
    sub_21FFB5D18(v46, v9, v48);
    v49 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 312) + 8);
    v49(v46, v9);
    sub_21FFB57EC(v48, v9, (uint64_t)v28);
    v49(v48, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v28, 0, 1, v9);
  }
  v50 = *(_QWORD *)(v5 - 200);
  sub_21FF47E70((uint64_t)v28, v50);
  v51 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 208) + 8);
  v52 = *(_QWORD *)(v5 - 192);
  v51((uint64_t)v28, v52);
  *(_QWORD *)(v5 - 144) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v30);
  *(_QWORD *)(v5 - 152) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v9, v5 - 144);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF5578], v52, v5 - 152);
  sub_21FFB57EC(v50, v52, *(_QWORD *)(v5 - 176));
  return v51(v50, v52);
}

void sub_21FFAD4F8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
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
  _QWORD v27[9];
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t TupleTypeMetadata2;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v42 = a6;
  v34 = a3;
  v43 = a1;
  v44 = a2;
  v40 = a9;
  v28 = sub_21FFC4DC0();
  v27[8] = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v27[7] = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E188);
  MEMORY[0x24BDAC7A8](v39);
  v27[6] = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_21FFC5AC8();
  v31 = v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v27[4] = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v16 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v33 = (char *)v27 - v17;
  v29 = *(_QWORD *)(v15 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v35 = (char *)v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v30 = (char *)v27 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v41 = (char *)v27 - v22;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558ECE8);
  v23 = MEMORY[0x24BDAC7A8](v36);
  v38 = (char *)v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v37 = (char *)v27 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v45 = a4;
  v46 = a5;
  v47 = a7;
  v48 = a8;
  _s13ItemShelfCellVMa();
}

void sub_21FFAD788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, _QWORD, uint64_t);

  *(_QWORD *)(v15 - 344) = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v15 - 352) = (char *)&a9 - v16;
  v17 = sub_21FFC419C();
  *(_QWORD *)(v15 - 320) = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  *(_QWORD *)(v15 - 416) = (char *)&a9 - v18;
  v19 = sub_21FFC419C();
  *(_QWORD *)(v15 - 408) = v19;
  *(_QWORD *)(v15 - 256) = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v15 - 248) = (char *)&a9 - v21;
  *(_QWORD *)(v15 - 472) = v14;
  v22 = *(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 16);
  *(_QWORD *)(v15 - 400) = v22;
  v22(v11, *(_QWORD *)(v15 - 240), v9);
  *(_QWORD *)(v15 - 160) = v9;
  *(_QWORD *)(v15 - 152) = v12;
  *(_QWORD *)(v15 - 144) = *(_QWORD *)(v15 - 264);
  *(_QWORD *)(v15 - 136) = v10;
  *(_QWORD *)(v15 - 128) = v13;
  _s25LibrarySectionContentViewVMa();
}

void sub_21FFAD8C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)(v3 - 232) + *(int *)(a1 + 100);
  v6 = *(_QWORD *)(v4 + 8);
  v5 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 24);
  *(_BYTE *)(v3 - 160) = *(_BYTE *)v4;
  *(_QWORD *)(v3 - 152) = v6;
  *(_QWORD *)(v3 - 144) = v5;
  *(_QWORD *)(v3 - 136) = v7;
  swift_bridgeObjectRetain();
  sub_21FF0E594(v7);
  sub_21FF436E4();
  *(_QWORD *)(v3 - 480) = v1;
  *(_QWORD *)(v3 - 488) = v2;
  sub_21FF91140();
}

uint64_t sub_21FFAD964()
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
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  void (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t);

  sub_21FFC4760();
  v7 = MEMORY[0x2207DB4B4](&unk_21FFCA590, v4);
  v8 = *(_QWORD *)(v6 - 416);
  sub_21FFC4B50();
  v9 = v4;
  v10 = *(_QWORD *)(v6 - 392);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 344) + 8))(v1, v9);
  sub_21FFC476C();
  *(_QWORD *)(v6 - 456) = v2;
  v11 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v6 - 176) = v7;
  *(_QWORD *)(v6 - 168) = v11;
  v12 = MEMORY[0x24BDED308];
  v13 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v5, v6 - 176);
  v14 = *(_QWORD *)(v6 - 272);
  sub_21FFC4B50();
  v15 = v8;
  v16 = *(_QWORD *)(v6 - 368);
  v17 = v5;
  v18 = *(_QWORD *)(v6 - 408);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 320) + 8))(v15, v17);
  *(_QWORD *)(v6 - 192) = v13;
  *(_QWORD *)(v6 - 184) = v11;
  v19 = *(_QWORD *)(v6 - 384);
  v20 = v12;
  v21 = *(_QWORD *)(v6 - 376);
  v22 = MEMORY[0x2207DB4B4](v20, v18, v6 - 192);
  v23 = *(_QWORD *)(v6 - 248);
  *(_QWORD *)(v6 - 352) = v22;
  sub_21FFB5D18(v3, v18, v23);
  v24 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 256) + 8);
  *(_QWORD *)(v6 - 320) = v3;
  v25 = v3;
  v26 = *(_QWORD *)(v6 - 360);
  *(_QWORD *)(v6 - 344) = v24;
  v24(v25, v18);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 - 400))(v14, *(_QWORD *)(v6 - 240), v0);
  __swift_storeEnumTagSinglePayload(v14, 0, 1, v0);
  v27 = sub_21FFC5030();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDDEAD8], v27);
  sub_21FFC5744();
  v28 = v26 + *(int *)(v16 + 48);
  v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v29(v26, v14, v21);
  v29(v28, v19, v21);
  if (__swift_getEnumTagSinglePayload(v26, 1, v0) != 1)
  {
    v29(*(_QWORD *)(v6 - 328), v26, v21);
    if (__swift_getEnumTagSinglePayload(v28, 1, v0) != 1)
    {
      v32 = *(_QWORD *)(v6 - 472);
      v33 = *(_QWORD *)(v6 - 488);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v33, v28, v0);
      v34 = v10;
      v35 = *(_QWORD *)(v6 - 328);
      v36 = sub_21FFC575C();
      v37 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      v37(v33, v0);
      v38 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      v38(v19, v21);
      v38(*(_QWORD *)(v6 - 272), v21);
      v37(v35, v0);
      v38(v26, v21);
      if ((v36 & 1) != 0)
        goto LABEL_8;
LABEL_9:
      v42 = *(_QWORD *)(v6 - 440);
      sub_21FFC4DB4();
      v43 = sub_21FFC4760();
      sub_21FFADEC4(*(_QWORD *)(v6 - 240), *(_QWORD *)(v6 - 456));
      sub_21FFC3F80();
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      v52 = *(_QWORD *)(v6 - 432);
      v53 = *(_QWORD *)(v6 - 448);
      v54 = *(_QWORD *)(v6 - 424);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v52 + 16))(v53, v42, v54);
      v40 = *(_QWORD *)(v6 - 288);
      v55 = v53 + *(int *)(v40 + 36);
      *(_BYTE *)v55 = v43;
      *(_QWORD *)(v55 + 8) = v45;
      *(_QWORD *)(v55 + 16) = v47;
      *(_QWORD *)(v55 + 24) = v49;
      *(_QWORD *)(v55 + 32) = v51;
      *(_BYTE *)(v55 + 40) = 0;
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v42, v54);
      v41 = *(_QWORD *)(v6 - 304);
      sub_21FFAEB60(v53, v41, &qword_25558E188);
      v39 = 0;
      goto LABEL_10;
    }
    v31 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v31(v19, v21);
    v31(*(_QWORD *)(v6 - 272), v21);
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v6 - 472) + 8))(*(_QWORD *)(v6 - 328), v0);
LABEL_6:
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 464) + 8))(v26, v16);
    goto LABEL_9;
  }
  v30 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v30(v19, v21);
  v30(v14, v21);
  if (__swift_getEnumTagSinglePayload(v28, 1, v0) != 1)
    goto LABEL_6;
  v30(v26, v21);
LABEL_8:
  v39 = 1;
  v40 = *(_QWORD *)(v6 - 288);
  v41 = *(_QWORD *)(v6 - 304);
LABEL_10:
  __swift_storeEnumTagSinglePayload(v41, v39, 1, v40);
  v56 = *(_QWORD *)(v6 - 248);
  v57 = *(_QWORD *)(v6 - 320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 256) + 16))(v57, v56, v18);
  *(_QWORD *)(v6 - 160) = v57;
  v58 = *(_QWORD *)(v6 - 296);
  sub_21FF9E81C(v41, v58);
  *(_QWORD *)(v6 - 152) = v58;
  v59 = *(_QWORD *)(v6 - 312);
  *(_QWORD *)(v6 - 208) = v18;
  *(_QWORD *)(v6 - 200) = v59;
  *(_QWORD *)(v6 - 224) = *(_QWORD *)(v6 - 352);
  *(_QWORD *)(v6 - 216) = sub_21FFAEB94(&qword_25558EE38, &qword_25558ECE8);
  sub_21FF51C7C(v6 - 160, 2, v6 - 208);
  sub_21FF103AC(v41, &qword_25558ECE8);
  v60 = *(void (**)(uint64_t, uint64_t))(v6 - 344);
  v60(v56, v18);
  sub_21FF103AC(v58, &qword_25558ECE8);
  return ((uint64_t (*)(uint64_t, uint64_t))v60)(v57, v18);
}

double sub_21FFADEC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double v4;
  double v5;
  _QWORD v7[4];

  sub_21FFC3A40();
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  sub_21FFC39EC();
  v5 = v4 * 48.0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5 + *(double *)(v2 + *(int *)(a2 + 108));
}

uint64_t sub_21FFADF58()
{
  uint64_t v0;
  uint64_t v1;

  sub_21FFC39B0();
  if (v0)
    _s25LibrarySectionContentViewVMa();
  sub_21FFC39D4();
  if (v1)
    _s25LibrarySectionContentViewVMa();
  return 0;
}

uint64_t sub_21FFAE138()
{
  sub_21FFC5CF0();
  sub_21FF1C978();
  return sub_21FFC5D20();
}

BOOL sub_21FFAE1DC(double *a1, double *a2)
{
  return sub_21FF1C954(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_21FFAE200()
{
  return sub_21FFAE138();
}

uint64_t sub_21FFAE21C()
{
  return sub_21FF1C978();
}

uint64_t sub_21FFAE238()
{
  sub_21FFC5CF0();
  sub_21FF1C978();
  return sub_21FFC5D20();
}

void sub_21FFAE290()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[5];
  v5 = v0[6];
  v1[2] = v0[2];
  v1[3] = v2;
  v1[4] = v3;
  v1[5] = v4;
  v1[6] = v5;
  OUTLINED_FUNCTION_16_11();
}

void sub_21FFAE2CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_21FFAE31C;
  OUTLINED_FUNCTION_55_4();
  sub_21FFAAC78(v5, v6, v7, v1, v2, v3);
}

uint64_t sub_21FFAE31C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_44_5();
  OUTLINED_FUNCTION_73();
  return OUTLINED_FUNCTION_25(*(uint64_t (**)(void))(v0 + 8));
}

void sub_21FFAE34C()
{
  sub_21FFAE368();
}

void sub_21FFAE35C()
{
  sub_21FFAE368();
}

void sub_21FFAE368()
{
  OUTLINED_FUNCTION_16_11();
}

uint64_t sub_21FFAE3A0()
{
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_55_4();
  return v1();
}

uint64_t sub_21FFAE3D0()
{
  return sub_21FFA4130((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FFAC114);
}

unint64_t sub_21FFAE3DC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_255591980;
  if (!qword_255591980)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591988);
    sub_21FFAE490(&qword_25558ED40, &qword_25558ED48);
    v3 = v2;
    sub_21FFAE490(&qword_255591990, &qword_255591998);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_255591980);
  }
  return result;
}

uint64_t sub_21FFAE480@<X0>(uint64_t a1@<X8>)
{
  return sub_21FFAC704(a1);
}

void sub_21FFAE490(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    OUTLINED_FUNCTION_98_1(0, a2);
    OUTLINED_FUNCTION_89();
  }
  OUTLINED_FUNCTION_31();
}

void sub_21FFAE4BC()
{
  _s25LibrarySectionContentViewVMa();
}

void sub_21FFAE4FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_66_3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v3 + 64));
  v5 = OUTLINED_FUNCTION_13_12();
  OUTLINED_FUNCTION_26_3(v5);
  OUTLINED_FUNCTION_63_1();
  v6 = v3 + *(int *)(a1 + 80);
  if ((*(_BYTE *)(v6 + 40) & 1) != 0)
  {
    if (*(_QWORD *)(v6 + 24))
      __swift_destroy_boxed_opaque_existential_1(v6);
  }
  else
  {
    OUTLINED_FUNCTION_102();
  }
  OUTLINED_FUNCTION_40_4();
  swift_release();
  v7 = OUTLINED_FUNCTION_23_7();
  if (!OUTLINED_FUNCTION_12_5(v2))
    OUTLINED_FUNCTION_5_12(*(_QWORD *)(v7 - 8));
  OUTLINED_FUNCTION_28_4();
  OUTLINED_FUNCTION_77_2();
  OUTLINED_FUNCTION_37_2();
  if (!OUTLINED_FUNCTION_12_5(v3 + *(int *)(a1 + 92)))
    OUTLINED_FUNCTION_5_12(*(_QWORD *)(v7 - 8));
  OUTLINED_FUNCTION_29_4();
  OUTLINED_FUNCTION_27_3();
  sub_21FF0EAB8(*(_QWORD *)(v1 + 24));
  OUTLINED_FUNCTION_38_5();
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_18_6();
}

void sub_21FFAE5D8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v0[5];
  v3 = v0[6];
  v4 = v0[7];
  v5 = v0[8];
  v1[2] = v0[4];
  v1[3] = v2;
  v1[4] = v3;
  v1[5] = v4;
  v1[6] = v5;
  _s25LibrarySectionContentViewVMa();
}

uint64_t sub_21FFAE624(uint64_t a1)
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
  uint64_t v13;
  _QWORD *v14;

  v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v11 = *(_QWORD *)(v2 + 16);
  v12 = *(_QWORD *)(v2 + 24);
  v13 = v2 + ((v10 + 72) & ~v10);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 56) = v14;
  *v14 = v4;
  v14[1] = sub_21FFAF178;
  *(_QWORD *)(v9 + 16) = v8;
  return sub_21FFAB1FC(v1, v11, v12, v13, v3, v5, v6, v7);
}

uint64_t sub_21FFAE6A4()
{
  return sub_21FFADF58() & 1;
}

void objectdestroy_2Tm_0()
{
  _s25LibrarySectionContentViewVMa();
}

void sub_21FFAE70C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_66_3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v3 + 64));
  v5 = OUTLINED_FUNCTION_13_12();
  OUTLINED_FUNCTION_26_3(v5);
  OUTLINED_FUNCTION_63_1();
  v6 = v3 + *(int *)(a1 + 80);
  if ((*(_BYTE *)(v6 + 40) & 1) != 0)
  {
    if (*(_QWORD *)(v6 + 24))
      __swift_destroy_boxed_opaque_existential_1(v6);
  }
  else
  {
    OUTLINED_FUNCTION_102();
  }
  OUTLINED_FUNCTION_40_4();
  swift_release();
  v7 = OUTLINED_FUNCTION_23_7();
  if (!OUTLINED_FUNCTION_12_5(v2))
    OUTLINED_FUNCTION_5_12(*(_QWORD *)(v7 - 8));
  OUTLINED_FUNCTION_28_4();
  OUTLINED_FUNCTION_77_2();
  OUTLINED_FUNCTION_37_2();
  if (!OUTLINED_FUNCTION_12_5(v3 + *(int *)(a1 + 92)))
    OUTLINED_FUNCTION_5_12(*(_QWORD *)(v7 - 8));
  OUTLINED_FUNCTION_29_4();
  OUTLINED_FUNCTION_27_3();
  sub_21FF0EAB8(*(_QWORD *)(v1 + 24));
  OUTLINED_FUNCTION_38_5();
  OUTLINED_FUNCTION_33_3();
  OUTLINED_FUNCTION_18_6();
}

void sub_21FFAE7E0()
{
  OUTLINED_FUNCTION_16_11();
}

void sub_21FFAE824()
{
  sub_21FFAC76C();
}

uint64_t sub_21FFAE860()
{
  return sub_21FFA4130((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FFACB28);
}

uint64_t sub_21FFAE86C()
{
  return sub_21FFA4130((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21FFACE5C);
}

void sub_21FFAE878()
{
  _s25LibrarySectionContentViewVMa();
}

uint64_t sub_21FFAE8BC(int *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  unint64_t v16;

  v3 = *((_QWORD *)a1 - 1);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v15 = *(_QWORD *)(v3 + 64);
  v5 = *(_QWORD *)(sub_21FFC5030() - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v16 = v4;
  v7 = v1 + v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v1 + v4 + 64));
  v8 = v1 + v4 + a1[18];
  v9 = sub_21FFC50E4();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_release();
  v10 = v7 + a1[20];
  if ((*(_BYTE *)(v10 + 40) & 1) != 0)
  {
    if (*(_QWORD *)(v10 + 24))
      __swift_destroy_boxed_opaque_existential_1(v10);
  }
  else
  {
    OUTLINED_FUNCTION_102();
  }
  swift_bridgeObjectRelease();
  swift_release();
  v11 = v7 + a1[22];
  if (!OUTLINED_FUNCTION_12_5(v11))
    OUTLINED_FUNCTION_51_3(v11, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_28_4();
  OUTLINED_FUNCTION_77_2();
  swift_release();
  v12 = v7 + a1[23];
  if (!OUTLINED_FUNCTION_12_5(v12))
    OUTLINED_FUNCTION_51_3(v12, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  swift_release();
  sub_21FF0EAB8(*(_QWORD *)(v7 + a1[24]));
  v13 = v7 + a1[25];
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v13 + 24));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_51_3(v1 + ((v16 + v15 + v6) & ~v6), *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  return swift_deallocObject();
}

void sub_21FFAEA9C()
{
  _s25LibrarySectionContentViewVMa();
}

void sub_21FFAEAE8(uint64_t a1)
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v9 = *(_QWORD *)(a1 - 8);
  v10 = (*(unsigned __int8 *)(v9 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = v10 + *(_QWORD *)(v9 + 64);
  v12 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_46_2() - 8) + 80);
  sub_21FFAD4F8(v1, v2 + v10, v2 + ((v11 + v12) & ~v12), v4, v5, v6, v7, v8, v3);
}

void sub_21FFAEB60(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v4 = OUTLINED_FUNCTION_60_2();
  v5(v4, a1);
  OUTLINED_FUNCTION_31();
}

uint64_t sub_21FFAEB94(uint64_t *a1, uint64_t *a2)
{
  void (*v2)(void);
  uint64_t result;

  result = *a1;
  if (!result)
  {
    OUTLINED_FUNCTION_98_1(0, a2);
    v2();
    OUTLINED_FUNCTION_49();
  }
  return result;
}

void _s25LibrarySectionContentViewV9ConstantsVMa()
{
  JUMPOUT(0x2207DB418);
}

void sub_21FFAEBF8()
{
  sub_21FFC5030();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_35_5();
  _s13ItemShelfCellVMa();
}

void sub_21FFAEC74()
{
  OUTLINED_FUNCTION_57_5();
  OUTLINED_FUNCTION_57_5();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_75();
}

void sub_21FFAECC0()
{
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_35_5();
  sub_21FFC4DE4();
  sub_21FFC5AC8();
  OUTLINED_FUNCTION_92();
}

void sub_21FFAED14(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  OUTLINED_FUNCTION_20();
}

void sub_21FFAED28(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  OUTLINED_FUNCTION_75();
}

void sub_21FFAED3C()
{
  sub_21FFC3F98();
  OUTLINED_FUNCTION_20();
}

void sub_21FFAED5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_104();
  sub_21FFC3FA4();
  _s27DismissAlertTriggerModifierVMa(255, v1, v0, v2);
  sub_21FFC419C();
  OUTLINED_FUNCTION_20();
}

void sub_21FFAEDA4()
{
  OUTLINED_FUNCTION_75();
}

void sub_21FFAEDB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 - 120) = v1;
  *(_QWORD *)(v3 - 112) = a1;
  MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v2, v3 - 120);
  OUTLINED_FUNCTION_104();
  v4 = sub_21FFC4118();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEC6F8], v4);
  sub_21FF2E0A8();
  OUTLINED_FUNCTION_35_5();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFAEE1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  _s18NavigationBarStyleVMa(255, v5, v4, a4);
  sub_21FFC419C();
  sub_21FFC40E8();
  OUTLINED_FUNCTION_79_0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E0B0);
  _s10DoneButtonVMa(255, v5, v4, v6);
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_20();
}

void sub_21FFAEEA8()
{
  OUTLINED_FUNCTION_92();
}

void sub_21FFAEEC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;

  sub_21FF0F7EC(&qword_25558E0B8, (void (*)(uint64_t))MEMORY[0x24BDEC4E0]);
  a22 = a1;
  a23 = v26;
  MEMORY[0x2207DB4B4](v24, v23, &a22);
  sub_21FFAE490(&qword_25558E0C0, &qword_25558E0B0);
  OUTLINED_FUNCTION_13_1();
}

void sub_21FFAEF24()
{
  OUTLINED_FUNCTION_35_5();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFAEF48()
{
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_3_12();
}

void sub_21FFAEF88()
{
  OUTLINED_FUNCTION_1_26();
  OUTLINED_FUNCTION_3_12();
}

void sub_21FFAEFB8()
{
  OUTLINED_FUNCTION_1_26();
  OUTLINED_FUNCTION_3_12();
}

void sub_21FFAEFE4()
{
  OUTLINED_FUNCTION_1_26();
  OUTLINED_FUNCTION_3_12();
}

void sub_21FFAF010()
{
  OUTLINED_FUNCTION_1_26();
  OUTLINED_FUNCTION_3_12();
}

void sub_21FFAF048()
{
  OUTLINED_FUNCTION_1_26();
  OUTLINED_FUNCTION_35_5();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFAF078()
{
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591950);
  OUTLINED_FUNCTION_104();
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E578);
  OUTLINED_FUNCTION_79_0();
  OUTLINED_FUNCTION_58_0();
  sub_21FF0F948();
  OUTLINED_FUNCTION_98_0();
}

void sub_21FFAF0F0()
{
  uint64_t *v0;

  sub_21FFAE490(&qword_2555919A0, v0);
  OUTLINED_FUNCTION_92();
}

void sub_21FFAF11C()
{
  uint64_t *v0;

  sub_21FFAE490(&qword_25558E588, v0);
  OUTLINED_FUNCTION_13_1();
}

void sub_21FFAF168()
{
  JUMPOUT(0x2207DB4B4);
}

uint64_t OUTLINED_FUNCTION_1_26()
{
  return swift_getOpaqueTypeConformance2();
}

void OUTLINED_FUNCTION_2_19()
{
  JUMPOUT(0x2207DB460);
}

void OUTLINED_FUNCTION_3_12()
{
  JUMPOUT(0x2207DB460);
}

uint64_t OUTLINED_FUNCTION_5_12@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_13_12()
{
  return sub_21FFC50E4();
}

void OUTLINED_FUNCTION_15_7()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
  sub_21FFA82C8(v1);
}

void OUTLINED_FUNCTION_16_11()
{
  _s25LibrarySectionContentViewVMa();
}

uint64_t OUTLINED_FUNCTION_20_7()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_23_7()
{
  return sub_21FFC5030();
}

uint64_t OUTLINED_FUNCTION_26_3(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_27_3()
{
  uint64_t v0;
  uint64_t v1;

  sub_21FF0EAB8(*(_QWORD *)(v1 + *(int *)(v0 + 96)));
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_28_4()
{
  return sub_21FFC5AC8();
}

uint64_t OUTLINED_FUNCTION_29_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_33_3()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_35_5()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_37_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_38_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_40_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_42_1()
{
  return sub_21FFC419C();
}

uint64_t OUTLINED_FUNCTION_43_5()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v3, v1, v2);
}

void OUTLINED_FUNCTION_44_5()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_46_2()
{
  return sub_21FFC5030();
}

uint64_t OUTLINED_FUNCTION_53_3()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_56_5()
{
  return sub_21FFC419C();
}

uint64_t OUTLINED_FUNCTION_57_5()
{
  return sub_21FFC419C();
}

uint64_t OUTLINED_FUNCTION_58_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_60_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_61_3()
{
  return sub_21FFC4CD0();
}

uint64_t OUTLINED_FUNCTION_62_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_63_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_64_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_66_3()
{
  return swift_bridgeObjectRelease();
}

void sub_21FFAF3E4()
{
  _s12ItemShelfRowVMa();
}

void *sub_21FFAF46C(int *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, uint64_t a10, int a11, int a12, void *__src, int a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  _QWORD *v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  char *v45;
  void *result;
  __int128 v47;
  uint64_t v48;
  char v49;
  const void *v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v42 = (char *)v35 + a1[13];
  v43 = sub_21FFC5030();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 32))(v42, v40, v43);
  v44 = (_QWORD *)((char *)v35 + a1[14]);
  *v44 = v39;
  v44[1] = v38;
  v44[2] = v48;
  *((_BYTE *)v35 + a1[15]) = v49;
  v45 = (char *)v35 + a1[16];
  *v45 = v36;
  *(_OWORD *)(v45 + 8) = v47;
  *((_QWORD *)v45 + 3) = v37;
  *((_BYTE *)v35 + a1[17]) = v51;
  result = memcpy((char *)v35 + a1[18], v50, 0x58uLL);
  *v35 = v54;
  v35[1] = v52;
  v35[2] = v53;
  return result;
}

void _s12ItemShelfRowVMa()
{
  JUMPOUT(0x2207DB418);
}

uint64_t sub_21FFAF538()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21FFC5030();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_21FFAF5E0(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (_QWORD *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a2[2];
    a1[1] = a2[1];
    a1[2] = v8;
    v9 = a3[13];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_21FFC5030();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_retain();
    swift_retain();
    v13(v10, v11, v12);
    v14 = a3[14];
    v15 = a3[15];
    v16 = (_QWORD *)((char *)v7 + v14);
    v17 = (_QWORD *)((char *)a2 + v14);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v16[2] = v17[2];
    *((_BYTE *)v7 + v15) = *((_BYTE *)a2 + v15);
    v19 = a3[16];
    v20 = (char *)v7 + v19;
    v21 = (char *)a2 + v19;
    *v20 = *v21;
    v22 = *((_QWORD *)v21 + 2);
    *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
    *((_QWORD *)v20 + 2) = v22;
    v23 = *((_QWORD *)v21 + 3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21FF0E594(v23);
    *((_QWORD *)v20 + 3) = v23;
    v24 = a3[18];
    *((_BYTE *)v7 + a3[17]) = *((_BYTE *)a2 + a3[17]);
    memcpy((char *)v7 + v24, (char *)a2 + v24, 0x58uLL);
  }
  return v7;
}

unint64_t sub_21FFAF72C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 52);
  v5 = sub_21FFC5030();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 64);
  swift_bridgeObjectRelease();
  return sub_21FF0EAB8(*(_QWORD *)(v6 + 24));
}

_QWORD *sub_21FFAF7C0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = a3[13];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21FFC5030();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_retain();
  swift_retain();
  v11(v8, v9, v10);
  v12 = a3[14];
  v13 = a3[15];
  v14 = (_QWORD *)((char *)a1 + v12);
  v15 = (_QWORD *)((char *)a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v14[2] = v15[2];
  *((_BYTE *)a1 + v13) = *((_BYTE *)a2 + v13);
  v17 = a3[16];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  *v18 = *v19;
  v20 = *((_QWORD *)v19 + 2);
  *((_QWORD *)v18 + 1) = *((_QWORD *)v19 + 1);
  *((_QWORD *)v18 + 2) = v20;
  v21 = *((_QWORD *)v19 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21FF0E594(v21);
  *((_QWORD *)v18 + 3) = v21;
  v22 = a3[18];
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  memcpy((char *)a1 + v22, (char *)a2 + v22, 0x58uLL);
  return a1;
}

_QWORD *sub_21FFAF8E4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  v6 = a3[13];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21FFC5030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[14];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v11 + 2) = *((_QWORD *)v12 + 2);
  *((_BYTE *)a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
  v13 = a3[16];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *v14 = *((_BYTE *)a2 + v13);
  *((_QWORD *)v14 + 1) = *(_QWORD *)((char *)a2 + v13 + 8);
  *((_QWORD *)v14 + 2) = *(_QWORD *)((char *)a2 + v13 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = *((_QWORD *)v15 + 3);
  sub_21FF0E594(v16);
  v17 = *((_QWORD *)v14 + 3);
  *((_QWORD *)v14 + 3) = v16;
  sub_21FF0EAB8(v17);
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  v18 = a3[18];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
  *((_QWORD *)v19 + 2) = *((_QWORD *)v20 + 2);
  *((_QWORD *)v19 + 3) = *((_QWORD *)v20 + 3);
  *((_QWORD *)v19 + 4) = *((_QWORD *)v20 + 4);
  *((_QWORD *)v19 + 5) = *((_QWORD *)v20 + 5);
  *((_QWORD *)v19 + 6) = *((_QWORD *)v20 + 6);
  v19[56] = v20[56];
  *((_QWORD *)v19 + 8) = *((_QWORD *)v20 + 8);
  *((_QWORD *)v19 + 9) = *((_QWORD *)v20 + 9);
  *((_QWORD *)v19 + 10) = *((_QWORD *)v20 + 10);
  return a1;
}

uint64_t sub_21FFAFA98(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = a3[13];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_21FFC5030();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[14];
  v11 = a3[15];
  v12 = a1 + v10;
  v13 = (__int128 *)(a2 + v10);
  v14 = *v13;
  *(_QWORD *)(v12 + 16) = *((_QWORD *)v13 + 2);
  LOBYTE(v13) = *(_BYTE *)(a2 + v11);
  *(_OWORD *)v12 = v14;
  *(_BYTE *)(a1 + v11) = (_BYTE)v13;
  v15 = a3[16];
  v16 = a3[17];
  v17 = (_OWORD *)(a1 + v15);
  v18 = (__int128 *)(a2 + v15);
  v19 = *v18;
  v20 = v18[1];
  LOBYTE(v18) = *(_BYTE *)(a2 + v16);
  *v17 = v19;
  v17[1] = v20;
  *(_BYTE *)(a1 + v16) = (_BYTE)v18;
  memcpy((void *)(a1 + a3[18]), (const void *)(a2 + a3[18]), 0x58uLL);
  return a1;
}

_QWORD *sub_21FFAFB6C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  v6 = a3[13];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21FFC5030();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[14];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  swift_bridgeObjectRelease();
  *((_QWORD *)v11 + 1) = *((_QWORD *)v12 + 1);
  swift_bridgeObjectRelease();
  v13 = a3[15];
  v14 = a3[16];
  v15 = *((_BYTE *)a2 + v13);
  *((_QWORD *)v11 + 2) = *((_QWORD *)v12 + 2);
  *((_BYTE *)a1 + v13) = v15;
  v16 = (char *)a1 + v14;
  v17 = (char *)a2 + v14;
  *v16 = *((_BYTE *)a2 + v14);
  v18 = *(_QWORD *)((char *)a2 + v14 + 16);
  *((_QWORD *)v16 + 1) = *(_QWORD *)((char *)a2 + v14 + 8);
  *((_QWORD *)v16 + 2) = v18;
  swift_bridgeObjectRelease();
  v19 = *((_QWORD *)v16 + 3);
  *((_QWORD *)v16 + 3) = *((_QWORD *)v17 + 3);
  sub_21FF0EAB8(v19);
  v20 = a3[18];
  *((_BYTE *)a1 + a3[17]) = *((_BYTE *)a2 + a3[17]);
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
  *((_QWORD *)v21 + 3) = *((_QWORD *)v22 + 3);
  *((_OWORD *)v21 + 2) = *((_OWORD *)v22 + 2);
  *((_QWORD *)v21 + 6) = *((_QWORD *)v22 + 6);
  v21[56] = v22[56];
  *((_OWORD *)v21 + 4) = *((_OWORD *)v22 + 4);
  *((_QWORD *)v21 + 10) = *((_QWORD *)v22 + 10);
  return a1;
}

uint64_t sub_21FFAFCC8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFAFCD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_13_4();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 52), a2, v8);
  }
}

uint64_t sub_21FFAFD4C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFAFD58(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = OUTLINED_FUNCTION_13_4();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 52), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21FFAFDC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FFAFDFC()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(qword_255590ED0);
  sub_21FFC4D90();
  return v1;
}

void sub_21FFAFE4C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  uint64_t v8;
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

  v14 = a2;
  v3 = sub_21FFC41D8();
  v13 = *(_QWORD *)(v3 - 8);
  v7[1] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v12 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591008);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  v5 = a1[2];
  v10 = a1[3];
  v11 = v5;
  v6 = a1[4];
  v8 = a1[5];
  v9 = v6;
  v15 = v5;
  v16 = v10;
  v17 = v6;
  v18 = v8;
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FFAFF0C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
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
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, uint64_t);
  _BYTE v27[96];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591AE0);
  OUTLINED_FUNCTION_86_1();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558EFB8);
  OUTLINED_FUNCTION_86_1();
  OUTLINED_FUNCTION_15();
  v4 = OUTLINED_FUNCTION_4();
  v5 = sub_21FF99840();
  v6 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v3 - 128) = v0;
  *(_QWORD *)(v3 - 120) = v6;
  *(_QWORD *)(v3 - 112) = v4;
  *(_QWORD *)(v3 - 104) = v5;
  *(_QWORD *)(v3 - 96) = MEMORY[0x24BEE1778];
  v7 = sub_21FFC4DE4();
  *(_QWORD *)(v3 - 136) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v4);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v7, v3 - 136);
  v8 = sub_21FFC4D54();
  *(_QWORD *)(v3 - 264) = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v27[-v9];
  v11 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4700], v8);
  sub_21FF0F7EC(&qword_25558E098, v2);
  v13 = v12;
  *(_QWORD *)(v3 - 128) = v8;
  *(_QWORD *)(v3 - 120) = v1;
  *(_QWORD *)(v3 - 112) = v11;
  *(_QWORD *)(v3 - 104) = v12;
  v14 = MEMORY[0x2207DB460](0, v3 - 128, MEMORY[0x24BDF22B8], 0);
  *(_QWORD *)(v3 - 272) = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = &v27[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v19 = &v27[-v18];
  sub_21FFC4484();
  v20 = *(_QWORD *)(v3 - 224);
  v21 = *(_QWORD *)(v3 - 240);
  *(_QWORD *)(v3 - 176) = *(_QWORD *)(v3 - 232);
  *(_QWORD *)(v3 - 168) = v21;
  v22 = *(_QWORD *)(v3 - 256);
  *(_QWORD *)(v3 - 160) = *(_QWORD *)(v3 - 248);
  *(_QWORD *)(v3 - 152) = v22;
  *(_QWORD *)(v3 - 144) = v20;
  sub_21FFC4D48();
  v23 = *(_QWORD *)(v3 - 216);
  sub_21FFC41CC();
  v24 = *(_QWORD *)(v3 - 280);
  sub_21FFC4964();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 208) + 8))(v23, v24);
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v3 - 264) + 8))(v10, v8);
  *(_QWORD *)(v3 - 128) = v8;
  *(_QWORD *)(v3 - 120) = v24;
  *(_QWORD *)(v3 - 112) = v11;
  *(_QWORD *)(v3 - 104) = v13;
  swift_getOpaqueTypeConformance2();
  sub_21FFB5D18((uint64_t)v17, v14, (uint64_t)v19);
  v25 = *(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v3 - 272) + 8);
  v25(v17, v14);
  sub_21FFB57EC((uint64_t)v19, v14, *(_QWORD *)(v3 - 200));
  return ((uint64_t (*)(_BYTE *, uint64_t))v25)(v19, v14);
}

void sub_21FFB01CC()
{
  _s12ItemShelfRowVMa();
}

void sub_21FFB021C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v13 - 184) = (char *)&a9 - v14;
  *(_QWORD *)(v13 - 200) = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591008);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  *(_QWORD *)(v13 - 120) = v12;
  *(_QWORD *)(v13 - 112) = v11;
  *(_QWORD *)(v13 - 104) = v10;
  *(_QWORD *)(v13 - 96) = v9;
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FFB0288()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_BYTE *, uint64_t);
  uint64_t v22;
  _BYTE v23[80];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591AE0);
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558EFB8);
  sub_21FFC419C();
  swift_getTupleTypeMetadata2();
  v4 = sub_21FFC4EBC();
  v5 = sub_21FF99840();
  *(_QWORD *)(v3 - 208) = v5;
  v6 = MEMORY[0x24BEE1768];
  *(_QWORD *)(v3 - 120) = v0;
  *(_QWORD *)(v3 - 112) = v6;
  *(_QWORD *)(v3 - 104) = v4;
  *(_QWORD *)(v3 - 96) = v5;
  *(_QWORD *)(v3 - 88) = MEMORY[0x24BEE1778];
  v7 = sub_21FFC4DE4();
  *(_QWORD *)(v3 - 192) = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = &v23[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v23[-v11];
  v13 = *(_QWORD *)(v3 - 144);
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + *(int *)(v2 + 56)) + 16);
  *(_QWORD *)(v3 - 120) = 0;
  *(_QWORD *)(v3 - 112) = v14;
  swift_getKeyPath();
  v15 = *(_QWORD *)(v3 - 184);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v15, v13, v2);
  v16 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v17 = (char *)swift_allocObject();
  v18 = *(_QWORD *)(v3 - 168);
  *((_QWORD *)v17 + 2) = *(_QWORD *)(v3 - 176);
  *((_QWORD *)v17 + 3) = v18;
  v19 = *(_QWORD *)(v3 - 152);
  *((_QWORD *)v17 + 4) = *(_QWORD *)(v3 - 160);
  *((_QWORD *)v17 + 5) = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(&v17[v16], v15, v2);
  v22 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v4);
  sub_21FFC4DCC();
  *(_QWORD *)(v3 - 128) = v22;
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v7, v3 - 128);
  sub_21FFB5D18((uint64_t)v10, v7, (uint64_t)v12);
  v20 = *(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v3 - 192) + 8);
  v20(v10, v7);
  sub_21FFB57EC((uint64_t)v12, v7, *(_QWORD *)(v3 - 136));
  return ((uint64_t (*)(_BYTE *, uint64_t))v20)(v12, v7);
}

void sub_21FFB04C8(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v24 = a1;
  v23 = a6;
  v22 = sub_21FFC41FC();
  MEMORY[0x24BDAC7A8](v22);
  v21 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_21FFC4E38();
  v17[7] = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v17[6] = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591AE8);
  v12 = MEMORY[0x24BDAC7A8](v19);
  v20 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[4] = *(_QWORD *)(a2 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v17[3] = (char *)v17 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v25 = (char *)v17 - v16;
  v26 = a4;
  v27 = a2;
  v28 = a3;
  v29 = a4;
  v30 = a5;
  _s13ItemShelfCellVMa();
}

void sub_21FFB0658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
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

  *(_QWORD *)(v13 - 384) = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  *(_QWORD *)(v13 - 240) = (char *)&a9 - v15;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591AE0);
  *(_QWORD *)(v13 - 376) = a1;
  v16 = sub_21FFC419C();
  *(_QWORD *)(v13 - 336) = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  *(_QWORD *)(v13 - 360) = (char *)&a9 - v17;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558EFB8);
  *(_QWORD *)(v13 - 320) = v16;
  v18 = sub_21FFC419C();
  *(_QWORD *)(v13 - 272) = v18;
  *(_QWORD *)(v13 - 312) = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)(v13 - 280) = (char *)&a9 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  *(_QWORD *)(v13 - 352) = (char *)&a9 - v22;
  MEMORY[0x24BDAC7A8](v21);
  *(_QWORD *)(v13 - 304) = (char *)&a9 - v23;
  v24 = sub_21FFC4DC0();
  MEMORY[0x24BDAC7A8](v24);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E188);
  MEMORY[0x24BDAC7A8](v25);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558ECE8);
  *(_QWORD *)(v13 - 392) = v26;
  v27 = MEMORY[0x24BDAC7A8](v26);
  *(_QWORD *)(v13 - 368) = (char *)&a9 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v30 = *v12;
  *(_QWORD *)(v13 - 256) = (char *)&a9 - v29;
  if (v30)
  {
    sub_21FFC4DB4();
    sub_21FFC4760();
    *(_QWORD *)(v13 - 152) = v10;
    *(_QWORD *)(v13 - 144) = v9;
    *(_QWORD *)(v13 - 136) = *(_QWORD *)(v13 - 224);
    *(_QWORD *)(v13 - 128) = v11;
    _s12ItemShelfRowVMa();
  }
  __swift_storeEnumTagSinglePayload((uint64_t)&a9 - v29, 1, 1, v25);
  *(_QWORD *)(v13 - 152) = v10;
  *(_QWORD *)(v13 - 144) = v9;
  *(_QWORD *)(v13 - 136) = *(_QWORD *)(v13 - 224);
  *(_QWORD *)(v13 - 128) = v11;
  *(_QWORD *)(v13 - 424) = v11;
  _s12ItemShelfRowVMa();
}

uint64_t sub_21FFB0958(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if ((v3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  v5 = result;
  v6 = v2;
  *(_QWORD *)(v4 - 448) = v1;
  v7 = *(_QWORD *)(v4 - 248);
  v8 = (uint64_t *)(v7 + *(int *)(result + 56));
  v9 = *v8;
  if (v3 >= *(_QWORD *)(*v8 + 16))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  *(_QWORD *)(v4 - 456) = v8;
  sub_21FFC5030();
  sub_21FFC5048();
  v10 = v7 + *(int *)(v5 + 64);
  v11 = *(_QWORD *)(v10 + 8);
  result = *(_QWORD *)(v10 + 16);
  v12 = *(_QWORD *)(v10 + 24);
  *(_BYTE *)(v4 - 152) = *(_BYTE *)v10;
  *(_QWORD *)(v4 - 144) = v11;
  *(_QWORD *)(v4 - 136) = result;
  *(_QWORD *)(v4 - 128) = v12;
  if (v3 < *(_QWORD *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    sub_21FF0E594(v12);
    v13 = *(_QWORD *)(v4 - 440);
    sub_21FFC5048();
    *(_QWORD *)(v4 - 464) = sub_21FFB0E50(v13, *(_BYTE *)(v7 + *(int *)(v5 + 68)), v6);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 432) + 8))(v13, v6);
    sub_21FFAFDFC();
    sub_21FF91140();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_21FFB0E50(uint64_t a1, char a2, uint64_t a3)
{
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255590228);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_21FFC5444();
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = 0;
  if ((a2 & 1) == 0)
    return v17;
  v18 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, a3);
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v13);
    sub_21FF103AC((uint64_t)v9, &qword_255590228);
    return 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v13);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v16, v9, v13);
  v19 = sub_21FFC5408();
  if (!v20)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v16, v13);
    return 0;
  }
  v21 = v19;
  v22 = v20;
  sub_21FF9A614();
  if (!v24)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v16, v13);
    swift_bridgeObjectRelease();
    return 0;
  }
  v25 = v24;
  v32 = v23;
  if (qword_25558DEF0 != -1)
    swift_once();
  sub_21FFC35F0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558E120);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_21FFC6C20;
  v27 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v26 + 56) = MEMORY[0x24BEE0D00];
  v28 = sub_21FF2E3F4();
  *(_QWORD *)(v26 + 32) = v21;
  *(_QWORD *)(v26 + 40) = v22;
  *(_QWORD *)(v26 + 96) = v27;
  *(_QWORD *)(v26 + 104) = v28;
  v29 = v32;
  *(_QWORD *)(v26 + 64) = v28;
  *(_QWORD *)(v26 + 72) = v29;
  *(_QWORD *)(v26 + 80) = v25;
  v17 = sub_21FFC57C8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v16, v13);
  return v17;
}

void sub_21FFB1138()
{
  sub_21FFB01CC();
}

void sub_21FFB1148()
{
  _s12ItemShelfRowVMa();
}

uint64_t sub_21FFB1178(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v4 = v1 + ((v3 + 48) & ~v3);
  swift_release();
  swift_release();
  v5 = v4 + *(int *)(a1 + 52);
  v6 = sub_21FFC5030();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = v4 + *(int *)(a1 + 64);
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v7 + 24));
  return swift_deallocObject();
}

void sub_21FFB123C()
{
  _s12ItemShelfRowVMa();
}

void sub_21FFB127C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  sub_21FFB04C8(v1 + ((v7 + 48) & ~v7), v3, v4, v5, v6, v2);
}

void sub_21FFB12C4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591008);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FFB1310()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591AE0);
  OUTLINED_FUNCTION_2_1();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558EFB8);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_15();
  v1 = OUTLINED_FUNCTION_4();
  v2 = sub_21FF99840();
  v11 = v0;
  v12 = MEMORY[0x24BEE1768];
  v13 = v1;
  v14 = v2;
  v15 = MEMORY[0x24BEE1778];
  v3 = sub_21FFC4DE4();
  v10 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v1);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v3, &v10);
  v4 = sub_21FFC4D54();
  v5 = sub_21FFC41D8();
  v6 = (void (*)(uint64_t))MEMORY[0x24BDED868];
  v7 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4700], v4);
  sub_21FF0F7EC(&qword_25558E098, v6);
  v11 = v4;
  v12 = v5;
  v13 = v7;
  v14 = v8;
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FFB142C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;

  v12 = _s9ViewModelCMa(0, a4, a5, a4);
  *a6 = sub_21FFC4268();
  a6[1] = v13;
  v15 = _s11ColumnsViewVMa(0, a4, a5, v14);
  v16 = (uint64_t)a6 + *(int *)(v15 + 36);
  *(_QWORD *)(v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(qword_255591B08) + 28)) = 0;
  result = sub_21FF4251C(a1, v16);
  v18 = (uint64_t *)((char *)a6 + *(int *)(v15 + 40));
  *v18 = a2;
  v18[1] = a3;
  return result;
}

uint64_t _s11ColumnsViewVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s11ColumnsViewVMn);
}

void sub_21FFB14FC()
{
  unint64_t v0;

  sub_21FFB1AB4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *sub_21FFB157C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    v7 = a1;
    a1[1] = a2[1];
    v8 = *(int *)(a3 + 36);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21FFC38B4();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_retain();
    v12(v9, v10, v11);
    v13 = __swift_instantiateConcreteTypeFromMangledName(qword_255591B08);
    *(_QWORD *)&v9[*(int *)(v13 + 28)] = *(_QWORD *)&v10[*(int *)(v13 + 28)];
    v14 = *(int *)(a3 + 40);
    v15 = (uint64_t *)((char *)v7 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_21FFB165C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 36);
  v5 = sub_21FFC38B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  __swift_instantiateConcreteTypeFromMangledName(qword_255591B08);
  swift_release();
  return swift_release();
}

_QWORD *sub_21FFB16D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 36);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21FFC38B4();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_retain();
  v11(v8, v9, v10);
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_255591B08);
  *(_QWORD *)&v8[*(int *)(v12 + 28)] = *(_QWORD *)&v9[*(int *)(v12 + 28)];
  v13 = *(int *)(a3 + 40);
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_21FFB178C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  v6 = *(int *)(a3 + 36);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21FFC38B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_255591B08);
  *(_QWORD *)&v7[*(int *)(v10 + 28)] = *(_QWORD *)&v8[*(int *)(v10 + 28)];
  swift_retain();
  swift_release();
  v11 = *(int *)(a3 + 40);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_21FFB185C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = *(int *)(a3 + 36);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21FFC38B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_255591B08);
  *(_QWORD *)&v7[*(int *)(v10 + 28)] = *(_QWORD *)&v8[*(int *)(v10 + 28)];
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 40)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 40));
  return a1;
}

_QWORD *sub_21FFB18EC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  v6 = *(int *)(a3 + 36);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21FFC38B4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_255591B08);
  *(_QWORD *)&v7[*(int *)(v10 + 28)] = *(_QWORD *)&v8[*(int *)(v10 + 28)];
  swift_release();
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 40)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 40));
  swift_release();
  return a1;
}

uint64_t sub_21FFB19A0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFB19AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_255591B08);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 36), a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 40));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t sub_21FFB1A2C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFB1A38(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = __swift_instantiateConcreteTypeFromMangledName(qword_255591B08);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 36), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 40)) = (a2 - 1);
  return result;
}

void sub_21FFB1AB4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255591B90)
  {
    _s12SearchColumnVMa();
    v0 = sub_21FFC4CE8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255591B90);
  }
}

uint64_t sub_21FFB1B08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FFB1B3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = a2;
  v26 = *(_QWORD *)(a1 - 8);
  v28 = *(_QWORD *)(v26 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v25 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = _s12SearchColumnVMa();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_0_0();
  v23 = v6 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591B98);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0_0();
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591BA0);
  v29 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_0_0();
  v10 = v9 - v8;
  __swift_instantiateConcreteTypeFromMangledName(qword_255591B08);
  sub_21FFC4CDC();
  v11 = *(_QWORD *)(a1 + 24);
  v22 = *(_QWORD *)(a1 + 16);
  v13 = _s9ViewModelCMa(0, v22, v11, v12);
  sub_21FFC4244();
  sub_21FF67CFC();
  swift_release();
  sub_21FFB1FA0(&qword_255591BA8, (uint64_t)&unk_21FFC8288);
  sub_21FFC3794();
  v14 = v23;
  sub_21FFC4CC4();
  v16 = v25;
  v15 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v25, v2, a1);
  v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v22;
  *(_QWORD *)(v18 + 24) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v18 + v17, v16, a1);
  sub_21FFB1F5C();
  sub_21FFB1FA0(&qword_25558F778, (uint64_t)&unk_21FFC8260);
  v19 = v27;
  sub_21FFC4B8C();
  swift_release();
  sub_21FF585E4(v14);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8))(v10, v19);
}

uint64_t sub_21FFB1DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;

  v7 = _s11ColumnsViewVMa(0, a4, a5, a4);
  return (*(uint64_t (**)(uint64_t))(a3 + *(int *)(v7 + 40)))(a2);
}

uint64_t sub_21FFB1E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = _s11ColumnsViewVMa(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  v7 = v4 + ((v6 + 32) & ~v6);
  swift_release();
  v8 = v7 + *(int *)(v5 + 36);
  v9 = sub_21FFC38B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  __swift_instantiateConcreteTypeFromMangledName(qword_255591B08);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21FFB1EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(v4 + 16);
  v8 = *(_QWORD *)(v4 + 24);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(_s11ColumnsViewVMa(0, v7, v8, a4) - 8) + 80);
  return sub_21FFB1DEC(a1, a2, v4 + ((v9 + 32) & ~v9), v7, v8);
}

unint64_t sub_21FFB1F5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255591BB0;
  if (!qword_255591BB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591BA0);
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BE64390], v1);
    atomic_store(result, (unint64_t *)&qword_255591BB0);
  }
  return result;
}

uint64_t sub_21FFB1FA0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = _s12SearchColumnVMa();
    result = MEMORY[0x2207DB4B4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21FFB1FE0()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591BA0);
  _s12SearchColumnVMa();
  sub_21FFB1F5C();
  sub_21FFB1FA0(&qword_25558F778, (uint64_t)&unk_21FFC8260);
  return swift_getOpaqueTypeConformance2();
}

void sub_21FFB205C(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_BYTE *)(a9 + 40) = a6;
  _s9ViewModelCMa(0, a7, a8, a4);
  OUTLINED_FUNCTION_75();
}

uint64_t sub_21FFB20A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;

  *(_QWORD *)(v2 + 48) = sub_21FFC4268();
  *(_QWORD *)(v2 + 56) = v3;
  *(_QWORD *)(v2 + 64) = swift_getKeyPath();
  *(_BYTE *)(v2 + 104) = 0;
  *(_QWORD *)(v2 + 112) = swift_getKeyPath();
  *(_BYTE *)(v2 + 120) = 0;
  v5 = (uint64_t *)(v2 + *(int *)(_s11ContentViewVMa(0, v1, v0, v4) + 52));
  *v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591BB8);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21FFB2138()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_25558FA48);
  return sub_21FFC4D84();
}

uint64_t sub_21FFB2188()
{
  uint64_t v0;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(qword_25558FA48);
  MEMORY[0x2207DA050](&v2, v0);
  return v2;
}

void sub_21FFB21D4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[63];

  v8[16] = a2;
  v8[14] = *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64);
  v2 = MEMORY[0x24BDAC7A8](a1);
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v2 + 24);
  v8[17] = v4;
  v8[10] = v5;
  v8[11] = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s17SearchResultsViewVMa(255, v4, v5, v6);
  sub_21FFC419C();
  _s15LandingPageViewVMa(255, v4, v5, v7);
  sub_21FFC44CC();
  OUTLINED_FUNCTION_75();
}

void sub_21FFB22A0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = MEMORY[0x24BDECC60];
  v4[2] = a1;
  v4[3] = v7;
  v8 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v2, v6 - 104);
  v9 = MEMORY[0x2207DB4B4](&unk_21FFC7898, v5);
  *v4 = v8;
  v4[1] = v9;
  v10 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEF3E0], v3, v6 - 120);
  v11 = MEMORY[0x24BEE1328];
  v1[19] = v3;
  v1[20] = v11;
  v12 = MEMORY[0x24BEE1340];
  v1[21] = v10;
  v1[22] = v12;
  v1[5] = v10;
  OUTLINED_FUNCTION_2_20();
}

void sub_21FFB2328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v9[15] = *(_QWORD *)(a1 - 8);
  v9[8] = a1;
  MEMORY[0x24BDAC7A8](a1);
  v9[4] = (char *)&a9 - v15;
  v9[19] = v11;
  v9[20] = v10;
  v9[21] = v13;
  v9[22] = v12;
  v16 = OUTLINED_FUNCTION_1_27();
  v9[7] = v16;
  v9[19] = a1;
  v9[20] = v10;
  v9[21] = v16;
  v9[22] = v12;
  OUTLINED_FUNCTION_2_20();
}

void sub_21FFB2388(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[96];

  v3 = *(_QWORD *)(a1 - 8);
  v1[12] = a1;
  v1[13] = v3;
  v4 = MEMORY[0x24BDAC7A8](a1);
  v1[6] = &v7[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v1[9] = &v7[-v6];
  sub_21FFB264C(v2);
}

void sub_21FFB264C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(v1 + 112);
  v4 = *(_BYTE *)(v1 + 120);
  sub_21FF0E95C(v3, v4);
  v5 = sub_21FFB5D20(v3, v4);
  sub_21FF0EADC(v3, v4);
  if ((v5 & 1) != 0)
    sub_21FF39030(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v6, v7);
  sub_21FF470AC(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v6, v7);
}

void sub_21FFB2808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  void (*v59)(unint64_t *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v58 = _s15LandingPageViewVMa(0, v55, v56, a4);
  MEMORY[0x2207DB4B4](&unk_21FFC7898, v58);
  sub_21FFB5D18((uint64_t)&STACK[0x300], v58, (uint64_t)&a55);
  v59 = *(void (**)(unint64_t *, uint64_t))(*(_QWORD *)(v58 - 8) + 8);
  v59(&STACK[0x300], v58);
  sub_21FFB57EC((uint64_t)&a55, v58, (uint64_t)&a9);
  v61 = _s17SearchResultsViewVMa(255, v55, v56, v60);
  v62 = sub_21FFC419C();
  STACK[0x2F0] = MEMORY[0x2207DB4B4](&unk_21FFC75F0, v61);
  STACK[0x2F8] = v57;
  MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v62, &STACK[0x2F0]);
  sub_21FF51DA8();
  v59((unint64_t *)&a9, v58);
  v59((unint64_t *)&a55, v58);
  JUMPOUT(0x21FFB28F8);
}

uint64_t sub_21FFB29F0()
{
  return sub_21FFB2138();
}

uint64_t sub_21FFB2A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v7 = sub_21FFC446C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s11ContentViewVMa(0, a4, a5, v11);
  sub_21FFB6248((uint64_t)v10);
  sub_21FFC4460();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_21FFB2ABC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21FFC4298();
  *a1 = result & 1;
  return result;
}

uint64_t _s11ContentViewVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s11ContentViewVMn);
}

uint64_t sub_21FFB2AF4()
{
  return MEMORY[0x2207D9594]();
}

void sub_21FFB2B14()
{
  unint64_t v0;

  sub_21FFB3528();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_21FFB2BA8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  char v11;
  _OWORD *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;

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
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v8 = a2[4];
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v8;
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    v9 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v9;
    v10 = a2 + 8;
    v11 = *((_BYTE *)a2 + 104);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    if ((v11 & 1) != 0)
    {
      v12 = (_OWORD *)(a1 + 64);
      v13 = a2[11];
      if (v13)
      {
        v14 = a2[12];
        *(_QWORD *)(a1 + 88) = v13;
        *(_QWORD *)(a1 + 96) = v14;
        (**(void (***)(_OWORD *, uint64_t))(v13 - 8))(v12, (uint64_t)v10);
      }
      else
      {
        v15 = *((_OWORD *)v10 + 1);
        *v12 = *(_OWORD *)v10;
        *(_OWORD *)(a1 + 80) = v15;
        *(_QWORD *)(a1 + 96) = v10[4];
      }
      *(_BYTE *)(a1 + 104) = 1;
    }
    else
    {
      *(_QWORD *)(a1 + 64) = *v10;
      *(_BYTE *)(a1 + 104) = 0;
      swift_retain();
    }
    v16 = a2[14];
    v17 = *((_BYTE *)a2 + 120);
    sub_21FF0E95C(v16, v17);
    *(_QWORD *)(a1 + 112) = v16;
    *(_BYTE *)(a1 + 120) = v17;
    v18 = *(int *)(a3 + 52);
    v19 = (_QWORD *)(a1 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255591BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v21 = sub_21FFC446C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    }
    else
    {
      *v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21FFB2D60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if ((*(_BYTE *)(a1 + 104) & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 88))
      __swift_destroy_boxed_opaque_existential_1(a1 + 64);
  }
  else
  {
    swift_release();
  }
  sub_21FF0EADC(*(_QWORD *)(a1 + 112), *(_BYTE *)(a1 + 120));
  v4 = a1 + *(int *)(a2 + 52);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591BB8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_21FFC446C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_21FFB2E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = a2 + 64;
  v10 = *(_BYTE *)(a2 + 104);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if ((v10 & 1) != 0)
  {
    v11 = (_OWORD *)(a1 + 64);
    v12 = *(_QWORD *)(a2 + 88);
    if (v12)
    {
      v13 = *(_QWORD *)(a2 + 96);
      *(_QWORD *)(a1 + 88) = v12;
      *(_QWORD *)(a1 + 96) = v13;
      (**(void (***)(_OWORD *, uint64_t))(v12 - 8))(v11, v9);
    }
    else
    {
      v14 = *(_OWORD *)(v9 + 16);
      *v11 = *(_OWORD *)v9;
      *(_OWORD *)(a1 + 80) = v14;
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(v9 + 32);
    }
    *(_BYTE *)(a1 + 104) = 1;
  }
  else
  {
    *(_QWORD *)(a1 + 64) = *(_QWORD *)v9;
    *(_BYTE *)(a1 + 104) = 0;
    swift_retain();
  }
  v15 = *(_QWORD *)(a2 + 112);
  v16 = *(_BYTE *)(a2 + 120);
  sub_21FF0E95C(v15, v16);
  *(_QWORD *)(a1 + 112) = v15;
  *(_BYTE *)(a1 + 120) = v16;
  v17 = *(int *)(a3 + 52);
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v20 = sub_21FFC446C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  }
  else
  {
    *v18 = *v19;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_21FFB2FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

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
  if (a1 != a2)
  {
    v6 = (__int128 *)(a2 + 64);
    sub_21FFB31A8(a1 + 64, qword_25558DFD0);
    if ((*(_BYTE *)(a2 + 104) & 1) != 0)
    {
      v7 = *(_QWORD *)(a2 + 88);
      if (v7)
      {
        *(_QWORD *)(a1 + 88) = v7;
        *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
        (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 64, a2 + 64);
      }
      else
      {
        v8 = *v6;
        v9 = *(_OWORD *)(a2 + 80);
        *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
        *(_OWORD *)(a1 + 64) = v8;
        *(_OWORD *)(a1 + 80) = v9;
      }
      *(_BYTE *)(a1 + 104) = 1;
    }
    else
    {
      *(_QWORD *)(a1 + 64) = *(_QWORD *)v6;
      *(_BYTE *)(a1 + 104) = 0;
      swift_retain();
    }
  }
  v10 = *(_QWORD *)(a2 + 112);
  v11 = *(_BYTE *)(a2 + 120);
  sub_21FF0E95C(v10, v11);
  v12 = *(_QWORD *)(a1 + 112);
  v13 = *(_BYTE *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = v10;
  *(_BYTE *)(a1 + 120) = v11;
  sub_21FF0EADC(v12, v13);
  if (a1 != a2)
  {
    v14 = *(int *)(a3 + 52);
    v15 = (_QWORD *)(a1 + v14);
    v16 = (_QWORD *)(a2 + v14);
    sub_21FFB31A8(a1 + v14, &qword_255591BB8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255591BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_21FFC446C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21FFB31A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_13_3(v3);
  return a1;
}

uint64_t sub_21FFB31D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 89) = *(_OWORD *)(a2 + 89);
  v5 = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  v6 = *(int *)(a3 + 52);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  *(_QWORD *)(a1 + 112) = v5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_21FFC446C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  return a1;
}

uint64_t sub_21FFB32BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  if (a1 != a2)
  {
    sub_21FFB31A8(a1 + 64, qword_25558DFD0);
    v6 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v6;
    *(_OWORD *)(a1 + 89) = *(_OWORD *)(a2 + 89);
  }
  v7 = *(_BYTE *)(a2 + 120);
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_BYTE *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = v7;
  sub_21FF0EADC(v8, v9);
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 52);
    v11 = (void *)(a1 + v10);
    v12 = (const void *)(a2 + v10);
    sub_21FFB31A8(a1 + v10, &qword_255591BB8);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591BB8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_21FFC446C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_21FFB3428()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFB3434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_255591BC0);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 52), a2, v8);
  }
}

uint64_t sub_21FFB34AC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFB34B8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_255591BC0);
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 52), a2, a2, v7);
  }
  return result;
}

void sub_21FFB3528()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255591C48)
  {
    sub_21FFC446C();
    v0 = sub_21FFC3FD4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255591C48);
  }
}

uint64_t sub_21FFB357C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FFB35B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21FFB36C8(a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_21FFB29F0, a4);
}

uint64_t objectdestroyTm_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(_s11ContentViewVMa(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4) - 8)
                          + 80);
  v6 = v4 + ((v5 + 32) & ~v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if ((*(_BYTE *)(v6 + 104) & 1) != 0)
  {
    if (*(_QWORD *)(v6 + 88))
      __swift_destroy_boxed_opaque_existential_1(v6 + 64);
  }
  else
  {
    swift_release();
  }
  sub_21FF0EADC(*(_QWORD *)(v6 + 112), *(_BYTE *)(v6 + 120));
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591BB8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_21FFC446C();
    OUTLINED_FUNCTION_13_3(v7);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_21FFB36BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21FFB36C8(a1, a2, sub_21FFB2A14, a4);
}

uint64_t sub_21FFB36C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(v4 + 16);
  v8 = *(_QWORD *)(v4 + 24);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(_s11ContentViewVMa(0, v7, v8, a4) - 8) + 80);
  return a3(a1, a2, v4 + ((v9 + 32) & ~v9), v7, v8);
}

void sub_21FFB3740(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a1;
  v5 = a1[1];
  v6 = _s17SearchResultsViewVMa(255, *a1, v5, a4);
  sub_21FFC419C();
  _s15LandingPageViewVMa(255, v4, v5, v7);
  sub_21FFC44CC();
  MEMORY[0x2207DB4B4](&unk_21FFC75F0, v6);
  OUTLINED_FUNCTION_75();
}

void sub_21FFB37DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v17 = MEMORY[0x2207DB4B4](&unk_21FFC7898, v14);
  a13 = a1;
  a14 = v17;
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEF3E0], v15, &a13);
  OUTLINED_FUNCTION_2_20();
}

uint64_t sub_21FFB3838()
{
  OUTLINED_FUNCTION_1_27();
  return OUTLINED_FUNCTION_1_27();
}

uint64_t OUTLINED_FUNCTION_1_27()
{
  return swift_getOpaqueTypeConformance2();
}

void OUTLINED_FUNCTION_2_20()
{
  JUMPOUT(0x2207DB460);
}

uint64_t sub_21FFB388C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v11 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    v6 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v6;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    v7 = *(int *)(a3 + 32);
    v8 = (_QWORD *)(a1 + v7);
    v9 = (uint64_t *)((char *)a2 + v7);
    *(_QWORD *)(a1 + 72) = a2[9];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(qword_2555915A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_21FFC4454();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21FFB39A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v4 = a1 + *(int *)(a2 + 32);
  __swift_instantiateConcreteTypeFromMangledName(qword_2555915A8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_21FFC4454();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_21FFB3A30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v6 = *(int *)(a3 + 32);
  v7 = (_QWORD *)(a1 + v6);
  v8 = (_QWORD *)(a2 + v6);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(qword_2555915A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_21FFC4454();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  }
  else
  {
    *v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_21FFB3B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v6 = *(int *)(a3 + 32);
    v7 = (_QWORD *)(a1 + v6);
    v8 = (_QWORD *)(a2 + v6);
    sub_21FF103AC(a1 + v6, qword_2555915A8);
    __swift_instantiateConcreteTypeFromMangledName(qword_2555915A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v9 = sub_21FFC4454();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21FFB3C54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v5 = *(int *)(a3 + 32);
  v6 = (const void *)(a2 + v5);
  v7 = (void *)(a1 + v5);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2555915A8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_21FFC4454();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v6, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  return a1;
}

uint64_t sub_21FFB3D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 32);
    v9 = (void *)(a1 + v8);
    v10 = (const void *)(a2 + v8);
    sub_21FF103AC(a1 + v8, qword_2555915A8);
    v11 = __swift_instantiateConcreteTypeFromMangledName(qword_2555915A8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_21FFC4454();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_21FFB3E24()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFB3E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591C50);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t sub_21FFB3EA8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFB3EB4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591C50);
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t _s8MenuCellVMa()
{
  uint64_t result;

  result = qword_255591CB0;
  if (!qword_255591CB0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21FFB3F5C()
{
  unint64_t v0;

  sub_21FFB3FE4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21FFB3FE4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255591CC0)
  {
    sub_21FFC4454();
    v0 = sub_21FFC3FD4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255591CC0);
  }
}

uint64_t sub_21FFB4038()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21FFB4048(uint64_t a1@<X8>)
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
  _BYTE __src[112];

  __swift_instantiateConcreteTypeFromMangledName(&qword_255591D00);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_0();
  v5 = v4 - v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591D08);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_0_0();
  v10 = v9 - v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591D10);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_0_0();
  v15 = v14 - v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591D18);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_0_0();
  v20 = v19 - v18;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591D20);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_0_0();
  v24 = v23 - v22;
  *(_QWORD *)v5 = sub_21FFC43D0();
  *(_QWORD *)(v5 + 8) = 0;
  *(_BYTE *)(v5 + 16) = 1;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591D28);
  sub_21FFB4344(v1, v5 + *(int *)(v25 + 44));
  sub_21FF0FF4C(v5, v10, &qword_255591D00);
  *(_BYTE *)(v10 + *(int *)(v6 + 36)) = 0;
  sub_21FF103AC(v5, &qword_255591D00);
  sub_21FFC4778();
  sub_21FFC3F80();
  OUTLINED_FUNCTION_4_8();
  sub_21FF0FF4C(v10, v15, &qword_255591D08);
  OUTLINED_FUNCTION_6_11(v15 + *(int *)(v11 + 36));
  sub_21FF103AC(v10, &qword_255591D08);
  sub_21FFC4E50();
  sub_21FFC4220();
  sub_21FF0FF4C(v15, v20, &qword_255591D10);
  memcpy((void *)(v20 + *(int *)(v16 + 36)), __src, 0x70uLL);
  sub_21FF103AC(v15, &qword_255591D10);
  sub_21FFC4730();
  sub_21FFC3F80();
  OUTLINED_FUNCTION_4_8();
  sub_21FF0FF4C(v20, v24, &qword_255591D18);
  OUTLINED_FUNCTION_6_11(v24 + *(int *)(v26 + 36));
  sub_21FF103AC(v20, &qword_255591D18);
  sub_21FF10380(v24, a1, &qword_255591D20);
}

void sub_21FFB4344(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t KeyPath;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD *v42;
  __int128 v43;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61[2];
  char *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
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
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;

  v76 = a2;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E968);
  MEMORY[0x24BDAC7A8](v67);
  v66 = (uint64_t *)((char *)v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v65 = sub_21FFC4C94();
  v64 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v62 = (char *)v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E938);
  MEMORY[0x24BDAC7A8](v77);
  v63 = (uint64_t *)((char *)v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_255590760);
  MEMORY[0x24BDAC7A8](v70);
  v68 = (uint64_t)v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591D30);
  MEMORY[0x24BDAC7A8](v72);
  v69 = (uint64_t)v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591D38);
  v8 = MEMORY[0x24BDAC7A8](v74);
  v75 = (uint64_t)v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v71 = (uint64_t)v61 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v73 = (uint64_t)v61 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591D40);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591D48);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591D50);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v61 - v25;
  v61[1] = a1;
  v79 = a1;
  v78 = a1;
  sub_21FF35EA8();
  sub_21FFC4CAC();
  sub_21FF51B24(&qword_255591D58, &qword_255591D40, MEMORY[0x24BDF41A8]);
  sub_21FFB5440();
  sub_21FFC4940();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  sub_21FFC4E5C();
  sub_21FFC40B8();
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v24, v20, v17);
  v27 = &v24[*(int *)(v21 + 36)];
  v61[0] = (uint64_t)v24;
  v28 = v81;
  *(_OWORD *)v27 = v80;
  *((_OWORD *)v27 + 1) = v28;
  *((_OWORD *)v27 + 2) = v82;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  sub_21FF10380((uint64_t)v24, (uint64_t)v26, &qword_255591D50);
  v29 = sub_21FFC4C64();
  v30 = sub_21FFC4844();
  KeyPath = swift_getKeyPath();
  v32 = v64;
  v33 = v62;
  v34 = v65;
  (*(void (**)(char *, _QWORD, uint64_t))(v64 + 104))(v62, *MEMORY[0x24BDF40B0], v65);
  v35 = swift_getKeyPath();
  v36 = v66;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))((char *)v66 + *(int *)(v67 + 28), v33, v34);
  v37 = (uint64_t)v36;
  *v36 = v35;
  v38 = v63;
  v39 = v37;
  sub_21FF0FF4C(v37, (uint64_t)v63 + *(int *)(v77 + 36), &qword_25558E968);
  *v38 = v29;
  v38[1] = KeyPath;
  v38[2] = v30;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21FF103AC(v39, &qword_25558E968);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v34);
  swift_release();
  swift_release();
  swift_release();
  LODWORD(v29) = sub_21FFC45B0();
  v40 = v68;
  sub_21FF0FF4C((uint64_t)v38, v68, &qword_25558E938);
  *(_DWORD *)(v40 + *(int *)(v70 + 36)) = v29;
  sub_21FF103AC((uint64_t)v38, &qword_25558E938);
  sub_21FFC4E68();
  sub_21FFC40B8();
  v41 = v69;
  sub_21FF0FF4C(v40, v69, &qword_255590760);
  v42 = (_OWORD *)(v41 + *(int *)(v72 + 36));
  v43 = v84;
  *v42 = v83;
  v42[1] = v43;
  v42[2] = v85;
  sub_21FF103AC(v40, &qword_255590760);
  LOBYTE(v29) = sub_21FFC4730();
  sub_21FFC3F80();
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v52 = v71;
  sub_21FF0FF4C(v41, v71, &qword_255591D30);
  v53 = v52 + *(int *)(v74 + 36);
  *(_BYTE *)v53 = v29;
  *(_QWORD *)(v53 + 8) = v45;
  *(_QWORD *)(v53 + 16) = v47;
  *(_QWORD *)(v53 + 24) = v49;
  *(_QWORD *)(v53 + 32) = v51;
  *(_BYTE *)(v53 + 40) = 0;
  sub_21FF103AC(v41, &qword_255591D30);
  v54 = v52;
  v55 = v73;
  sub_21FF10380(v54, v73, &qword_255591D38);
  v56 = v61[0];
  sub_21FF0FF4C((uint64_t)v26, v61[0], &qword_255591D50);
  v57 = v75;
  sub_21FF0FF4C(v55, v75, &qword_255591D38);
  v58 = v76;
  sub_21FF0FF4C(v56, v76, &qword_255591D50);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591D68);
  v60 = v58 + *(int *)(v59 + 48);
  *(_QWORD *)v60 = 0;
  *(_BYTE *)(v60 + 8) = 1;
  sub_21FF0FF4C(v57, v58 + *(int *)(v59 + 64), &qword_255591D38);
  sub_21FF103AC(v55, &qword_255591D38);
  sub_21FF103AC((uint64_t)v26, &qword_255591D50);
  sub_21FF103AC(v57, &qword_255591D38);
  sub_21FF103AC(v56, &qword_255591D50);
}

uint64_t sub_21FFB4ACC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  sub_21FF2E0A8();
  swift_bridgeObjectRetain();
  v2 = sub_21FFC48EC();
  v4 = v3;
  v6 = v5 & 1;
  v7 = sub_21FFC48A4();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  sub_21FF2E3E4(v2, v4, v6);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v9;
  *(_BYTE *)(a1 + 16) = v11 & 1;
  *(_QWORD *)(a1 + 24) = v13;
  return result;
}

void sub_21FFB4BA0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  BOOL v21;
  void (*v22)(char *, uint64_t);
  unsigned int *v23;
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

  v34 = a2;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E968);
  MEMORY[0x24BDAC7A8](v33);
  v4 = (uint64_t *)((char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_21FFC4454();
  v30 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v27 - v9;
  v11 = sub_21FFC4C94();
  v31 = *(_QWORD *)(v11 - 8);
  v32 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E938);
  MEMORY[0x24BDAC7A8](v28);
  v15 = (uint64_t *)((char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = *(unsigned __int8 *)(a1 + 32);
  swift_bridgeObjectRetain();
  if (v16 == 1)
    v17 = sub_21FFC4C7C();
  else
    v17 = sub_21FFC4C64();
  v29 = v17;
  v18 = sub_21FFC479C();
  KeyPath = swift_getKeyPath();
  _s8MenuCellVMa();
  sub_21FFB626C((uint64_t)v10);
  v20 = v30;
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v8, *MEMORY[0x24BDEEE88], v5);
  v21 = sub_21FFB4E8C((uint64_t)v10, (uint64_t)v8);
  v22 = *(void (**)(char *, uint64_t))(v20 + 8);
  v22(v8, v5);
  v22(v10, v5);
  v23 = (unsigned int *)MEMORY[0x24BDF40A8];
  v24 = v31;
  if (!v21)
    v23 = (unsigned int *)MEMORY[0x24BDF40B8];
  v25 = v32;
  (*(void (**)(char *, _QWORD, uint64_t))(v31 + 104))(v13, *v23, v32);
  v26 = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))((char *)v4 + *(int *)(v33 + 28), v13, v25);
  *v4 = v26;
  sub_21FF0FF4C((uint64_t)v4, (uint64_t)v15 + *(int *)(v28 + 36), &qword_25558E968);
  *v15 = v29;
  v15[1] = KeyPath;
  v15[2] = v18;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21FF103AC((uint64_t)v4, &qword_25558E968);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v25);
  swift_release();
  swift_release();
  swift_release();
  sub_21FF10380((uint64_t)v15, v34, &qword_25558E938);
}

BOOL sub_21FFB4E8C(uint64_t a1, uint64_t a2)
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
  _DWORD *v15;
  int v16;
  int v17;
  unint64_t v18;
  uint64_t v20;

  v4 = sub_21FFC4454();
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
  v15 = (_DWORD *)MEMORY[0x24BDEEE90];
  v16 = *MEMORY[0x24BDEEE58];
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
  if (v17 == v16)
  {
    v18 = 0;
  }
  else if (v17 == *v15)
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
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE60])
      {
        v18 = 5;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE30])
      {
        v18 = 6;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE70])
      {
        v18 = 7;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE68])
      {
        v18 = 8;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE78])
      {
        v18 = 9;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE40])
      {
        v18 = 10;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE48])
      {
        v18 = 11;
        return v14 >= v18;
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v18 = 3;
  }
  return v14 >= v18;
}

uint64_t sub_21FFB5214(double *a1, double *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3])
    return sub_21FFC4790();
  else
    return 0;
}

uint64_t sub_21FFB5268()
{
  uint64_t v0;

  sub_21FFC5D14();
  sub_21FFC5D14();
  sub_21FFC5D14();
  sub_21FFC5D14();
  swift_retain();
  sub_21FFC47B4();
  return sub_21FFB57B0(v0);
}

uint64_t sub_21FFB52EC()
{
  sub_21FFC5CF0();
  sub_21FFB5268();
  return sub_21FFC5D20();
}

uint64_t sub_21FFB5328(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[2];
  uint64_t v6;
  _OWORD v7[2];
  uint64_t v8;

  v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v8 = *(_QWORD *)(a2 + 32);
  return sub_21FFB5214((double *)v5, (double *)v7) & 1;
}

uint64_t sub_21FFB5370()
{
  return sub_21FFB52EC();
}

uint64_t sub_21FFB53A8()
{
  return sub_21FFB5268();
}

uint64_t sub_21FFB53E0()
{
  sub_21FFC5CF0();
  sub_21FFB5268();
  return sub_21FFC5D20();
}

uint64_t sub_21FFB5430@<X0>(uint64_t a1@<X8>)
{
  return sub_21FFB4ACC(a1);
}

void sub_21FFB5438(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_21FFB4BA0(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_21FFB5440()
{
  unint64_t result;

  result = qword_255591D60;
  if (!qword_255591D60)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFC7380, &_s14MenuLabelStyleVN);
    atomic_store(result, (unint64_t *)&qword_255591D60);
  }
  return result;
}

uint64_t _s8MenuCellV9ConstantsVwxx()
{
  return swift_release();
}

uint64_t _s8MenuCellV9ConstantsVwcp(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  return a1;
}

_QWORD *_s8MenuCellV9ConstantsVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s8MenuCellV9ConstantsVwta(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t _s8MenuCellV9ConstantsVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 32);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s8MenuCellV9ConstantsVwst(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s8MenuCellV9ConstantsVMa()
{
  return &_s8MenuCellV9ConstantsVN;
}

uint64_t sub_21FFB55F0()
{
  return sub_21FFB5648(&qword_255591D70, &qword_255591D20, sub_21FFB5624, MEMORY[0x24BDECC60]);
}

uint64_t sub_21FFB5624()
{
  return sub_21FFB5648(&qword_255591D78, &qword_255591D18, sub_21FFB56B0, MEMORY[0x24BDEDBB8]);
}

uint64_t sub_21FFB5648(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
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
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21FFB56B0()
{
  return sub_21FFB5648(&qword_255591D80, &qword_255591D10, (uint64_t (*)(void))sub_21FFB56D4, MEMORY[0x24BDECC60]);
}

unint64_t sub_21FFB56D4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_255591D88;
  if (!qword_255591D88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591D08);
    sub_21FF51B24(&qword_255591D90, &qword_255591D00, MEMORY[0x24BDF4498]);
    v3 = v2;
    sub_21FF51B24(&qword_25558EFB0, &qword_25558EFB8, MEMORY[0x24BDEFAD8]);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_255591D88);
  }
  return result;
}

unint64_t sub_21FFB5774()
{
  unint64_t result;

  result = qword_255591D98[0];
  if (!qword_255591D98[0])
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCC2EC, &_s8MenuCellV9ConstantsVN);
    atomic_store(result, qword_255591D98);
  }
  return result;
}

uint64_t sub_21FFB57B0(uint64_t a1)
{
  swift_release();
  return a1;
}

void OUTLINED_FUNCTION_6_11(uint64_t a1@<X8>)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = 0;
}

uint64_t sub_21FFB57EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t ArtworkImageReader.init(content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t ArtworkImageReader.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t *v2;
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
  _QWORD *v15;
  void (*v16)(char *, char *, uint64_t);
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = sub_21FFC3E9C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v19 - v11;
  v14 = *v2;
  v13 = v2[1];
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v14;
  v15[5] = v13;
  swift_retain();
  sub_21FFC3E90();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDFC1B0], v6);
  v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v16(v12, v10, v6);
  v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v10, v6);
  v16(a2, v12, v6);
  return ((uint64_t (*)(char *, uint64_t))v17)(v12, v6);
}

uint64_t sub_21FFB5944@<X0>(uint64_t a1@<X0>, void (*a2)(_QWORD)@<X1>, uint64_t a3@<X3>, char *a4@<X8>)
{
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
  char *v18;
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, char *, uint64_t);
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  void (*v39)(_QWORD);

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591E20);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591E28);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a3 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v38 - v19;
  sub_21FFB5CD0(a1, (uint64_t)v10);
  v21 = sub_21FFC3E00();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v21) == 1)
  {
    sub_21FF1C7A4((uint64_t)v10, &qword_255591E20);
    v22 = type metadata accessor for ArtworkImage.Proxy();
    v23 = (uint64_t)v14;
    v24 = 1;
  }
  else
  {
    sub_21FFC3DF4();
    sub_21FFC3DDC();
    v26 = v25;
    v28 = v27;
    v29 = sub_21FFC3DE8();
    v38 = v15;
    v30 = a4;
    v31 = v29;
    v32 = type metadata accessor for ArtworkImage.Proxy();
    v39 = a2;
    v33 = v32;
    v34 = &v14[*(int *)(v32 + 20)];
    *(_QWORD *)v34 = v26;
    *((_QWORD *)v34 + 1) = v28;
    *(_QWORD *)&v14[*(int *)(v32 + 24)] = v31;
    a4 = v30;
    v15 = v38;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v10, v21);
    v23 = (uint64_t)v14;
    v24 = 0;
    v22 = v33;
    a2 = v39;
  }
  __swift_storeEnumTagSinglePayload(v23, v24, 1, v22);
  a2(v14);
  sub_21FF1C7A4((uint64_t)v14, &qword_255591E28);
  v35 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v35(v20, v18, a3);
  v36 = *(void (**)(char *, uint64_t))(v15 + 8);
  v36(v18, a3);
  v35(a4, v20, a3);
  return ((uint64_t (*)(char *, uint64_t))v36)(v20, a3);
}

uint64_t sub_21FFB5B98()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21FFB5BBC@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_21FFB5944(a1, *(void (**)(_QWORD))(v2 + 32), *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_21FFB5BC8()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *_s10BackButtonVwCP(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t _s10BackButtonVwxx()
{
  return swift_release();
}

_QWORD *_s10BackButtonVwca(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *_s10BackButtonVwta(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for ArtworkImageReader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ArtworkImageReader);
}

void sub_21FFB5CA8()
{
  sub_21FFC3E9C();
  JUMPOUT(0x2207DB4B4);
}

uint64_t sub_21FFB5CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591E20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FFB5D20(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v12;

  v4 = OUTLINED_FUNCTION_13_13();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3_6();
  if ((a2 & 1) != 0)
    return a1 & 1;
  OUTLINED_FUNCTION_18_2();
  v6 = sub_21FFC5A50();
  v7 = sub_21FFC470C();
  v8 = v6;
  if (os_log_type_enabled(v7, v6))
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_38_2();
    v12 = OUTLINED_FUNCTION_38_2();
    *(_DWORD *)v9 = 136315138;
    v10 = sub_21FFB76CC(1819242306, 0xE400000000000000, &v12);
    OUTLINED_FUNCTION_20_8(v10);
    sub_21FFC5AD4();
    OUTLINED_FUNCTION_129(&dword_21FF05000, v7, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v9);
    OUTLINED_FUNCTION_100_2();
    OUTLINED_FUNCTION_17();
  }

  OUTLINED_FUNCTION_12_9();
  swift_getAtKeyPath();
  sub_21FF0EADC(a1, 0);
  OUTLINED_FUNCTION_10_12(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  return v12;
}

void sub_21FFB5E88(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  _QWORD v12[5];
  char v13;

  v3 = v1;
  v5 = OUTLINED_FUNCTION_13_13();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3_6();
  sub_21FF5A2F4(v3, (uint64_t)v12, qword_25558DFD0);
  if (v13 == 1)
  {
    sub_21FFB815C((uint64_t)v12, a1);
  }
  else
  {
    v7 = sub_21FFC5A50();
    v8 = sub_21FFC470C();
    v9 = v7;
    if (os_log_type_enabled(v8, v7))
    {
      v10 = (uint8_t *)OUTLINED_FUNCTION_38_2();
      v11 = OUTLINED_FUNCTION_38_2();
      *(_DWORD *)v10 = 136315138;
      sub_21FFB76CC(0xD00000000000002BLL, 0x800000021FFCF370, &v11);
      sub_21FFC5AD4();
      OUTLINED_FUNCTION_129(&dword_21FF05000, v8, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v10);
      OUTLINED_FUNCTION_100_2();
      OUTLINED_FUNCTION_17();
    }

    OUTLINED_FUNCTION_12_9();
    OUTLINED_FUNCTION_9_15();
    OUTLINED_FUNCTION_40_1();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
  }
  OUTLINED_FUNCTION_24();
}

void sub_21FFB6014(uint64_t a1@<X8>)
{
  sub_21FFB607C(&qword_25558EB18, (uint64_t (*)(_QWORD))MEMORY[0x24BDECF50], 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

void sub_21FFB6048(uint64_t a1@<X8>)
{
  sub_21FFB607C(qword_255590610, (uint64_t (*)(_QWORD))MEMORY[0x24BDED130], 0x694474756F79614CLL, 0xEF6E6F6974636572, a1);
}

void sub_21FFB607C(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  os_log_type_t v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v24 = a3;
  v10 = OUTLINED_FUNCTION_13_13();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_3_6();
  v12 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FF5A2F4(v5, (uint64_t)v14, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = a2(0);
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(a5, v14, v15);
  }
  else
  {
    v16 = sub_21FFC5A50();
    v17 = sub_21FFC470C();
    if (os_log_type_enabled(v17, v16))
    {
      v22 = a4;
      v18 = OUTLINED_FUNCTION_38_2();
      v23 = a5;
      v19 = (uint8_t *)v18;
      v25 = OUTLINED_FUNCTION_38_2();
      *(_DWORD *)v19 = 136315138;
      v20 = sub_21FFB76CC(v24, v22, &v25);
      OUTLINED_FUNCTION_20_8(v20);
      sub_21FFC5AD4();
      OUTLINED_FUNCTION_129(&dword_21FF05000, v17, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v19);
      OUTLINED_FUNCTION_100_2();
      OUTLINED_FUNCTION_17();
    }

    OUTLINED_FUNCTION_12_9();
    OUTLINED_FUNCTION_9_15();
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_10_12(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  }
  OUTLINED_FUNCTION_24();
}

void sub_21FFB6248(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_3_13(&qword_255591BB8, (uint64_t (*)(_QWORD))MEMORY[0x24BDEEEC8], 0x800000021FFCF350, a1);
}

void sub_21FFB626C(uint64_t a1@<X8>)
{
  OUTLINED_FUNCTION_3_13(qword_2555915A8, (uint64_t (*)(_QWORD))MEMORY[0x24BDEEEA0], 0x800000021FFCF3A0, a1);
}

uint64_t sub_21FFB6290(uint64_t a1, char a2)
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

  v4 = sub_21FFC4388();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v8 = sub_21FFC5A50();
    v9 = sub_21FFC470C();
    v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v15 = v12;
      *(_DWORD *)v11 = 136315138;
      v14 = sub_21FFB76CC(0x6C616E6F6974704FLL, 0xEE003E65646F4E3CLL, &v15);
      sub_21FFC5AD4();
      _os_log_impl(&dword_21FF05000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207DB550](v12, -1, -1);
      MEMORY[0x2207DB550](v11, -1, -1);
    }

    sub_21FFC437C();
    swift_getAtKeyPath();
    j__swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

uint64_t sub_21FFB6458()
{
  uint64_t v1;

  sub_21FFB7EAC();
  sub_21FFC4394();
  return v1;
}

uint64_t sub_21FFB6490(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  sub_21FFB7EAC();
  result = OUTLINED_FUNCTION_17_6();
  if (v3)
  {
    swift_unknownObjectRelease();
    if (a1 && v3 == a1)
      return swift_unknownObjectRelease();
  }
  else if (!a1)
  {
    return result;
  }
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_19_8();
  sub_21FFB6820();
  return swift_unknownObjectRelease();
}

void sub_21FFB6530(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v5 = sub_21FFC3ECC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3_6();
  sub_21FFC3EC0();
  sub_21FFB7F24();
  if (swift_dynamicCast())
  {
    if (a2)
    {
      OUTLINED_FUNCTION_18_2();
      sub_21FFC0BA4();
      OUTLINED_FUNCTION_18_2();
      swift_bridgeObjectRetain();
      v7 = (void *)sub_21FFC57B0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_18_2();
      objc_msgSend(v8, sel_setCacheIdentifier_forCacheReference_, v7, a2);

      swift_release_n();
    }

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a1, v5);
    v9[0] = 0;
    v9[1] = 0xE000000000000000;
    sub_21FFC5B4C();
    sub_21FFC57F8();
    sub_21FFC3EC0();
    sub_21FFC5BB8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    sub_21FFC57F8();
    sub_21FFC5BD0();
    __break(1u);
  }
}

void sub_21FFB6708(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_21FFB6710()
{
  sub_21FFB75A0();
  return sub_21FFC4100();
}

void sub_21FFB6760(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

uint64_t sub_21FFB6768()
{
  uint64_t v1;

  sub_21FFB7E70();
  OUTLINED_FUNCTION_11_8();
  return v1;
}

uint64_t sub_21FFB6798(uint64_t a1)
{
  uint64_t v3;

  sub_21FFB7E70();
  OUTLINED_FUNCTION_17_6();
  if (v3)
  {
    OUTLINED_FUNCTION_40_1();
    if (!a1 || v3 != a1)
      goto LABEL_6;
  }
  else if (a1)
  {
LABEL_6:
    OUTLINED_FUNCTION_18_2();
    OUTLINED_FUNCTION_19_8();
    sub_21FFB6820();
  }
  return swift_release();
}

uint64_t sub_21FFB6820()
{
  uint64_t ObjectType;
  uint64_t v2;
  uint64_t v3;

  sub_21FFB7EAC();
  OUTLINED_FUNCTION_11_8();
  if (v2)
  {
    ObjectType = swift_getObjectType();
    sub_21FF4D704(ObjectType, v3);
    sub_21FFB7EE8();
    OUTLINED_FUNCTION_5_13();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_21FFB7E70();
    sub_21FFC4394();
    sub_21FFB7EE8();
    return OUTLINED_FUNCTION_5_13();
  }
}

void sub_21FFB68FC(uint64_t a1)
{
  uint64_t *v1;

  sub_21FFB6530(a1, *v1);
}

uint64_t sub_21FFB6904(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v7;

  v7 = a4 & 1;
  _s4NodeCMa();
  swift_allocObject();
  swift_bridgeObjectRetain();
  return sub_21FFC1110(a1, a2, a3, v7);
}

uint64_t sub_21FFB6974()
{
  uint64_t v0;

  v0 = swift_retain();
  return sub_21FFB6798(v0);
}

uint64_t sub_21FFB699C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (**v22)();
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v33[2];
  int v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _OWORD v46[2];
  _BYTE v47[25];

  v3 = v2;
  v40 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6998);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C69A8);
  MEMORY[0x24BDAC7A8](v41);
  v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C69E8);
  v11 = *(_QWORD *)(v10 - 8);
  v38 = v10;
  v39 = v11;
  MEMORY[0x24BDAC7A8](v10);
  v37 = (char *)v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath();
  v14 = *((_QWORD *)v3 + 4);
  v15 = *((_QWORD *)v3 + 5);
  v16 = v3[48];
  _s4NodeCMa();
  sub_21FFB7614(&qword_2540C6A60);
  v17 = sub_21FFC3FF8();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C69C8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v7, a1, v18);
  v19 = (uint64_t *)&v7[*(int *)(v5 + 36)];
  *v19 = KeyPath;
  v19[1] = v17;
  *(_OWORD *)v47 = *(_OWORD *)v3;
  *(_OWORD *)&v47[9] = *(_OWORD *)(v3 + 9);
  v20 = *((_QWORD *)v3 + 7);
  LOBYTE(a1) = v3[64];
  v21 = swift_allocObject();
  memcpy((void *)(v21 + 16), v3, 0x41uLL);
  sub_21FF5A2F4((uint64_t)v7, (uint64_t)v9, &qword_2540C6998);
  v22 = (uint64_t (**)())&v9[*(int *)(v41 + 36)];
  *v22 = sub_21FFB7484;
  v22[1] = (uint64_t (*)())v21;
  v22[2] = 0;
  v22[3] = 0;
  v36 = *(_QWORD *)&v47[8];
  sub_21FFA137C((uint64_t)v47);
  v33[1] = v14;
  v35 = v15;
  v34 = v16;
  sub_21FF56C70();
  j__swift_retain();
  sub_21FF103AC((uint64_t)v7, &qword_2540C6998);
  j__swift_retain();
  v23 = sub_21FFB6290(v20, a1);
  j__swift_release();
  v42 = v23;
  v24 = swift_allocObject();
  memcpy((void *)(v24 + 16), v3, 0x41uLL);
  sub_21FFA137C((uint64_t)v47);
  sub_21FF56C70();
  j__swift_retain();
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A80);
  v26 = sub_21FFB7498();
  v27 = sub_21FFB75A0();
  v28 = v37;
  v29 = v41;
  sub_21FFC4B8C();
  swift_release();
  swift_release();
  sub_21FF103AC((uint64_t)v9, &qword_2540C69A8);
  v46[0] = *(_OWORD *)v47;
  *(_OWORD *)((char *)v46 + 9) = *(_OWORD *)&v47[9];
  v30 = swift_allocObject();
  memcpy((void *)(v30 + 16), v3, 0x41uLL);
  swift_bridgeObjectRetain();
  sub_21FFA137C((uint64_t)v47);
  sub_21FF56C70();
  j__swift_retain();
  v42 = v29;
  v43 = v25;
  v44 = v26;
  v45 = v27;
  swift_getOpaqueTypeConformance2();
  sub_21FFB7690();
  v31 = v38;
  sub_21FFC4B8C();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v28, v31);
}

uint64_t sub_21FFB6DB8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  _s4NodeCMa();
  sub_21FFB7614(&qword_2540C6A60);
  sub_21FFC3FF8();
  v2 = *(_QWORD *)(a1 + 56);
  LOBYTE(a1) = *(_BYTE *)(a1 + 64);
  j__swift_retain();
  v3 = sub_21FFB6290(v2, a1);
  j__swift_release();
  sub_21FFC0D14(v3);
  return swift_release();
}

uint64_t sub_21FFB6E64()
{
  uint64_t v0;

  _s4NodeCMa();
  sub_21FFB7614(&qword_2540C6A60);
  sub_21FFC3FF8();
  v0 = swift_retain();
  sub_21FFC0D14(v0);
  return swift_release();
}

uint64_t sub_21FFB6EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_BYTE *)(a2 + 24);
  _s4NodeCMa();
  sub_21FFB7614(&qword_2540C6A60);
  sub_21FFC3FF8();
  swift_bridgeObjectRetain();
  sub_21FFC0E58(v2, v3, v4, v5);
  return swift_release();
}

uint64_t sub_21FFB6F88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  const void *v2;
  _BYTE __dst[65];

  memcpy(__dst, v2, sizeof(__dst));
  return sub_21FFB699C(a1, a2);
}

uint64_t View.artworkCaching(id:limit:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t KeyPath;
  uint64_t v13;
  _QWORD v15[3];
  char v16;
  uint64_t (*v17)();
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;

  KeyPath = swift_getKeyPath();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  *(_QWORD *)(v13 + 32) = a3;
  *(_BYTE *)(v13 + 40) = a4 & 1;
  v15[0] = a1;
  v15[1] = a2;
  v15[2] = a3;
  v16 = a4 & 1;
  v17 = sub_21FFB7114;
  v18 = v13;
  v19 = 0;
  v20 = KeyPath;
  v21 = 0;
  swift_bridgeObjectRetain();
  MEMORY[0x2207D9E4C](v15, a5, &_s7CachingV8ModifierVN, a6);
  swift_release();
  return swift_release();
}

uint64_t sub_21FFB70C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21FFB6768();
  *a1 = result;
  return result;
}

uint64_t sub_21FFB70F0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21FFB7114()
{
  uint64_t v0;

  return sub_21FFB6904(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
}

uint64_t sub_21FFB7124(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_21FFC419C();
  v4[0] = v1;
  v4[1] = sub_21FFB7178();
  return MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_21FFB7178()
{
  unint64_t result;

  result = qword_2540C6938;
  if (!qword_2540C6938)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCC424, &_s7CachingV8ModifierVN);
    atomic_store(result, (unint64_t *)&qword_2540C6938);
  }
  return result;
}

uint64_t _s7CachingV8ModifierVwxx()
{
  swift_bridgeObjectRelease();
  sub_21FF47610();
  return j__swift_release();
}

uint64_t _s7CachingV8ModifierVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v2 = a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_21FF56C70();
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = v7;
  v8 = *(_QWORD *)(v2 + 56);
  LOBYTE(v2) = *(_BYTE *)(v2 + 64);
  j__swift_retain();
  *(_QWORD *)(a1 + 56) = v8;
  *(_BYTE *)(a1 + 64) = v2;
  return a1;
}

uint64_t _s7CachingV8ModifierVwca(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = v2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)v2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v2[4];
  v6 = v2[5];
  v7 = *((_BYTE *)v2 + 48);
  sub_21FF56C70();
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = v7;
  sub_21FF47610();
  v8 = v2[7];
  LOBYTE(v2) = *((_BYTE *)v2 + 64);
  j__swift_retain();
  *(_QWORD *)(a1 + 56) = v8;
  *(_BYTE *)(a1 + 64) = (_BYTE)v2;
  j__swift_release();
  return a1;
}

void *__swift_memcpy65_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x41uLL);
}

uint64_t _s7CachingV8ModifierVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  char v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = v5;
  sub_21FF47610();
  v6 = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = v6;
  j__swift_release();
  return a1;
}

uint64_t _s7CachingV8ModifierVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 65))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s7CachingV8ModifierVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s7CachingV8ModifierVMa()
{
  return &_s7CachingV8ModifierVN;
}

ValueMetadata *_s7CachingVMa()
{
  return &_s7CachingVN;
}

uint64_t sub_21FFB7470()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FFB7484()
{
  uint64_t v0;

  return sub_21FFB6DB8(v0 + 16);
}

uint64_t sub_21FFB7490()
{
  return sub_21FFB6E64();
}

unint64_t sub_21FFB7498()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2540C69A0;
  if (!qword_2540C69A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2540C69A8);
    v2[0] = sub_21FFB7504();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2540C69A0);
  }
  return result;
}

unint64_t sub_21FFB7504()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  result = qword_2540C6990;
  if (!qword_2540C6990)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2540C6998);
    sub_21FF1034C(&qword_2540C69C0, &qword_2540C69C8);
    v3 = v2;
    sub_21FF1034C(&qword_2540C69D8, &qword_2540C69E0);
    v5[0] = v3;
    v5[1] = v4;
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2540C6990);
  }
  return result;
}

unint64_t sub_21FFB75A0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_2540C6A88;
  if (!qword_2540C6A88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2540C6A80);
    sub_21FFB7614(&qword_2540C6A68);
    v3 = v2;
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BEE4AB8], v1, &v3);
    atomic_store(result, (unint64_t *)&qword_2540C6A88);
  }
  return result;
}

void sub_21FFB7614(_QWORD *a1)
{
  if (!*a1)
  {
    _s4NodeCMa();
    OUTLINED_FUNCTION_89();
  }
  OUTLINED_FUNCTION_31();
}

uint64_t objectdestroy_3Tm()
{
  swift_bridgeObjectRelease();
  sub_21FF47610();
  j__swift_release();
  return swift_deallocObject();
}

uint64_t sub_21FFB7688(uint64_t a1, uint64_t a2)
{
  return sub_21FFB6EE4(a1, a2);
}

unint64_t sub_21FFB7690()
{
  unint64_t result;
  double vars0;

  result = qword_2540C6A90;
  if (!qword_2540C6A90)
  {
    atomic_store(result, (unint64_t *)&qword_2540C6A90);
  }
  return result;
}

uint64_t sub_21FFB76CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_21FFB779C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21FFB78F0((uint64_t)v12, *a3);
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
      sub_21FFB78F0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_21FFB779C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_21FFB792C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_21FFC5AE0();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_21FFB79F0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_21FFC5B7C();
    if (!v8)
    {
      result = sub_21FFC5BC4();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_21FFB78F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_21FFB792C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_21FFC5BF4();
  __break(1u);
  return result;
}

uint64_t sub_21FFB79F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21FFB7A84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_21FFB7C58(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_21FFB7C58((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21FFB7A84(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_21FFC5804();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_21FFB7BF4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_21FFC5B58();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_21FFC5BF4();
  __break(1u);
LABEL_14:
  result = sub_21FFC5BC4();
  __break(1u);
  return result;
}

_QWORD *sub_21FFB7BF4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_255591E30);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_21FFB7C58(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_255591E30);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_21FFB7DF0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21FFB7D2C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_21FFB7D2C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_21FFC5BF4();
  __break(1u);
  return result;
}

char *sub_21FFB7DF0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_21FFC5BF4();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_21FFB7E70()
{
  unint64_t result;

  result = qword_2540C6A40;
  if (!qword_2540C6A40)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCC51C, &_s7CachingV24PolicyNodeEnvironmentKeyVN);
    atomic_store(result, (unint64_t *)&qword_2540C6A40);
  }
  return result;
}

unint64_t sub_21FFB7EAC()
{
  unint64_t result;
  double vars0;

  result = qword_2540C6A38;
  if (!qword_2540C6A38)
  {
    atomic_store(result, (unint64_t *)&qword_2540C6A38);
  }
  return result;
}

unint64_t sub_21FFB7EE8()
{
  unint64_t result;

  result = qword_2540C6988;
  if (!qword_2540C6988)
  {
    result = MEMORY[0x2207DB4B4](&unk_21FFCC4BC, &type metadata for ArtworkCachingConfigurationHandler);
    atomic_store(result, (unint64_t *)&qword_2540C6988);
  }
  return result;
}

unint64_t sub_21FFB7F24()
{
  unint64_t result;

  result = qword_2540C6AA0;
  if (!qword_2540C6AA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2540C6AA0);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ArtworkCachingConfigurationHandler(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ArtworkCachingConfigurationHandler(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for ArtworkCachingConfigurationHandler(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ArtworkCachingConfigurationHandler(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ArtworkCachingConfigurationHandler(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ArtworkCachingConfigurationHandler()
{
  return &type metadata for ArtworkCachingConfigurationHandler;
}

ValueMetadata *_s7CachingV19OwnerEnvironmentKeyVMa()
{
  return &_s7CachingV19OwnerEnvironmentKeyVN;
}

ValueMetadata *_s7CachingV24PolicyNodeEnvironmentKeyVMa()
{
  return &_s7CachingV24PolicyNodeEnvironmentKeyVN;
}

uint64_t sub_21FFB80C8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2540C69E8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2540C69A8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2540C6A80);
  sub_21FFB7498();
  sub_21FFB75A0();
  OUTLINED_FUNCTION_8_6();
  sub_21FFB7690();
  return OUTLINED_FUNCTION_8_6();
}

uint64_t sub_21FFB815C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E0E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void OUTLINED_FUNCTION_3_13(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, unint64_t a3@<X3>, uint64_t a4@<X8>)
{
  sub_21FFB607C(a1, a2, 0xD000000000000013, a3, a4);
}

uint64_t OUTLINED_FUNCTION_5_13()
{
  return sub_21FFC4274();
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t OUTLINED_FUNCTION_9_15()
{
  return swift_getAtKeyPath();
}

uint64_t OUTLINED_FUNCTION_10_12@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_11_8()
{
  return sub_21FFC4394();
}

uint64_t OUTLINED_FUNCTION_12_9()
{
  return sub_21FFC437C();
}

uint64_t OUTLINED_FUNCTION_13_13()
{
  return sub_21FFC4388();
}

uint64_t OUTLINED_FUNCTION_17_6()
{
  return sub_21FFC4394();
}

uint64_t OUTLINED_FUNCTION_19_8()
{
  return sub_21FFC43A0();
}

uint64_t OUTLINED_FUNCTION_20_8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t _s6PolicyVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s6PolicyVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s6PolicyVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t _s6PolicyVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 25))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s6PolicyVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s6PolicyVMa()
{
  return &_s6PolicyVN;
}

uint64_t sub_21FFB83BC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  BOOL v12;
  char v13;
  uint64_t result;

  v12 = a1 == a5 && a2 == a6;
  if (v12 || (v13 = sub_21FFC5C90(), result = 0, (v13 & 1) != 0))
  {
    if ((a4 & 1) != 0)
    {
      if ((a8 & 1) != 0)
        return 1;
    }
    else if ((a8 & 1) == 0 && a3 == a7)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_21FFB8434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  swift_bridgeObjectRetain();
  sub_21FFC57EC();
  OUTLINED_FUNCTION_4_0();
  if ((a5 & 1) != 0)
    return sub_21FFC5D08();
  sub_21FFC5D08();
  return sub_21FFC5CFC();
}

uint64_t sub_21FFB84AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_21FFC5CF0();
  swift_bridgeObjectRetain();
  sub_21FFC57EC();
  swift_bridgeObjectRelease();
  sub_21FFC5D08();
  if ((a4 & 1) == 0)
    sub_21FFC5CFC();
  return sub_21FFC5D20();
}

uint64_t sub_21FFB8544(uint64_t a1, uint64_t a2)
{
  return sub_21FFB83BC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_BYTE *)(a2 + 24));
}

uint64_t sub_21FFB8568()
{
  uint64_t v0;

  return sub_21FFB84AC(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_21FFB8578(uint64_t a1)
{
  uint64_t v1;

  return sub_21FFB8434(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24));
}

uint64_t sub_21FFB8588()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 24);
  sub_21FFC5CF0();
  swift_bridgeObjectRetain();
  sub_21FFC57EC();
  swift_bridgeObjectRelease();
  sub_21FFC5D08();
  if (v1 != 1)
    sub_21FFC5CFC();
  return sub_21FFC5D20();
}

uint64_t sub_21FFB861C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_21FFB862C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  swift_bridgeObjectRetain();
  sub_21FFC57F8();
  OUTLINED_FUNCTION_4_0();
  sub_21FFC57F8();
  sub_21FFC57F8();
  OUTLINED_FUNCTION_4_0();
  if ((a4 & 1) == 0)
  {
    sub_21FFC5C6C();
    sub_21FFC57F8();
    swift_bridgeObjectRelease();
    sub_21FFC57F8();
    swift_bridgeObjectRelease();
  }
  sub_21FFC57F8();
  return 0xD000000000000017;
}

unint64_t sub_21FFB8758()
{
  uint64_t v0;

  return sub_21FFB862C(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_21FFB8768()
{
  uint64_t v0;

  v0 = sub_21FFC3EFC();
  __swift_allocate_value_buffer(v0, qword_2540C7038);
  __swift_project_value_buffer(v0, (uint64_t)qword_2540C7038);
  return sub_21FFC3EF0();
}

uint64_t sub_21FFB87DC()
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

_QWORD *sub_21FFB8850(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if (v7 <= 7 && (unint64_t)(v6 + 1) <= 0x18 && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(_QWORD *, _QWORD *))(v5 + 16))(a1, a2);
    *((_BYTE *)v4 + v6) = *((_BYTE *)a2 + v6);
  }
  else
  {
    v10 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return v4;
}

uint64_t sub_21FFB88DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  *(_BYTE *)(*(_QWORD *)(v5 + 64) + a1) = *(_BYTE *)(*(_QWORD *)(v5 + 64) + a2);
  return a1;
}

uint64_t sub_21FFB8924(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  *(_BYTE *)(*(_QWORD *)(v5 + 64) + a1) = *(_BYTE *)(*(_QWORD *)(v5 + 64) + a2);
  return a1;
}

uint64_t sub_21FFB896C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_BYTE *)(*(_QWORD *)(v5 + 64) + a1) = *(_BYTE *)(*(_QWORD *)(v5 + 64) + a2);
  return a1;
}

uint64_t sub_21FFB89B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_BYTE *)(*(_QWORD *)(v5 + 64) + a1) = *(_BYTE *)(*(_QWORD *)(v5 + 64) + a2);
  return a1;
}

uint64_t sub_21FFB89FC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char v11;
  int v12;
  unsigned int v13;
  int v14;
  unsigned int v16;
  int v17;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0xFE)
    v7 = 254;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  v9 = a2 - v7;
  if (a2 <= v7)
    goto LABEL_21;
  v10 = v8 + 1;
  v11 = 8 * (v8 + 1);
  if ((v8 + 1) > 3)
    goto LABEL_7;
  v13 = ((v9 + ~(-1 << v11)) >> v11) + 1;
  if (HIWORD(v13))
  {
    v12 = *(_DWORD *)(a1 + v10);
    if (v12)
      goto LABEL_14;
    goto LABEL_21;
  }
  if (v13 > 0xFF)
  {
    v12 = *(unsigned __int16 *)(a1 + v10);
    if (*(_WORD *)(a1 + v10))
      goto LABEL_14;
LABEL_21:
    if (v6 >= 0xFE)
      return __swift_getEnumTagSinglePayload(a1, v6, v4);
    v16 = *(unsigned __int8 *)(v8 + a1);
    if (v16 < 2)
      return 0;
    v17 = (v16 + 2147483646) & 0x7FFFFFFF;
    return (v17 + 1);
  }
  if (v13 < 2)
    goto LABEL_21;
LABEL_7:
  v12 = *(unsigned __int8 *)(a1 + v10);
  if (!*(_BYTE *)(a1 + v10))
    goto LABEL_21;
LABEL_14:
  v14 = (v12 - 1) << v11;
  if (v10 > 3)
    v14 = 0;
  if (!(_DWORD)v10)
  {
    v17 = v7 + v14;
    return (v17 + 1);
  }
  if (v10 > 3)
    LODWORD(v10) = 4;
  return ((uint64_t (*)(void))((char *)&loc_21FFB8ABC + 4 * byte_21FFCC630[(v10 - 1)]))();
}

void sub_21FFB8B28(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  char v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  int v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0xFEu)
    v6 = 254;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(v5 + 64);
  v8 = v7 + 1;
  v9 = 8 * (v7 + 1);
  if (a3 > v6)
  {
    if (v8 <= 3)
    {
      v12 = ((a3 - v6 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v12))
      {
        v10 = 4u;
      }
      else if (v12 >= 0x100)
      {
        v10 = 2;
      }
      else
      {
        v10 = v12 > 1;
      }
    }
    else
    {
      v10 = 1u;
    }
  }
  else
  {
    v10 = 0;
  }
  if (v6 < a2)
  {
    v11 = ~v6 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v7 != -1)
      {
        v13 = v11 & ~(-1 << v9);
        bzero(a1, v7 + 1);
        if (v8 == 3)
        {
          *a1 = v13;
          *((_BYTE *)a1 + 2) = BYTE2(v13);
        }
        else if (v8 == 2)
        {
          *a1 = v13;
        }
        else
        {
          *(_BYTE *)a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v7 + 1);
      *(_DWORD *)a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t _s23FavoriteStatusIndicatorVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s23FavoriteStatusIndicatorVMn);
}

uint64_t sub_21FFB8D04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FFB8D38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char v10;
  void (*v11)(char *, uint64_t);
  __int128 v13[2];
  uint64_t v14;
  _QWORD v15[4];

  v3 = sub_21FFC3854();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v13 - v8;
  if ((*(_BYTE *)(v1 + *(int *)(a1 + 36)) & 1) != 0)
    goto LABEL_5;
  sub_21FFC3A40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558FAE8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558FAF0);
  if (!swift_dynamicCast())
  {
    v14 = 0;
    memset(v13, 0, sizeof(v13));
    sub_21FF103AC((uint64_t)v13, &qword_25558FAF8);
LABEL_5:
    v10 = 0;
    return v10 & 1;
  }
  sub_21FF5FE94(v13, (uint64_t)v15);
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  sub_21FFC37D0();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x24BE696D0], v3);
  v10 = sub_21FFC3848();
  v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v7, v3);
  v11(v9, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v10 & 1;
}

uint64_t sub_21FFB8EC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
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
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t KeyPath;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E968);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_0();
  v5 = (uint64_t *)(v4 - v3);
  v6 = sub_21FFC4C94();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_0_0();
  v10 = v9 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558E648);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0_0();
  v14 = v13 - v12;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E938);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_0_0();
  v18 = (uint64_t *)(v17 - v16);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558F7E8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_0_0();
  v22 = v21 - v20;
  v23 = sub_21FFC4C64();
  v24 = sub_21FFC47CC();
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v24);
  sub_21FFC4808();
  sub_21FF103AC(v14, &qword_25558E648);
  v25 = sub_21FFC47A8();
  swift_release();
  KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v10, *MEMORY[0x24BDF40B8], v6);
  v27 = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v33 + 28), v10, v6);
  *v5 = v27;
  sub_21FF5A2F4((uint64_t)v5, (uint64_t)v18 + *(int *)(v32 + 36), &qword_25558E968);
  *v18 = v23;
  v18[1] = KeyPath;
  v18[2] = v25;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21FF103AC((uint64_t)v5, &qword_25558E968);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  swift_release();
  swift_release();
  swift_release();
  if ((sub_21FFB8D38(a1) & 1) != 0)
  {
    if (qword_25558DEC0 != -1)
      swift_once();
    v28 = qword_255598128;
    swift_retain();
  }
  else
  {
    v28 = sub_21FFC4C04();
  }
  v29 = swift_getKeyPath();
  sub_21FF5A2F4((uint64_t)v18, v22, &qword_25558E938);
  v30 = (uint64_t *)(v22 + *(int *)(v34 + 36));
  *v30 = v29;
  v30[1] = v28;
  sub_21FF103AC((uint64_t)v18, &qword_25558E938);
  return sub_21FFB91E8(v22, a2);
}

uint64_t sub_21FFB91E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558F7E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_21FFB9234@<D0>(uint64_t a1@<X0>, char *a2@<X1>, int a3@<W2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double result;
  uint64_t v43;
  uint64_t v44;

  HIDWORD(v43) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591EB8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *a2;
  v15 = *((_QWORD *)a2 + 1);
  v16 = *((_QWORD *)a2 + 2);
  v17 = *((_QWORD *)a2 + 3);
  v19 = (int *)_s24PlaylistFolderDetailViewVMa(0, a4, a5, v18);
  v20 = a6 + v19[11];
  *(_QWORD *)v20 = swift_getKeyPath();
  *(_BYTE *)(v20 + 40) = 0;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v21);
  sub_21FFB9554((uint64_t)v13);
  v22 = (uint64_t *)(a6 + v19[13]);
  *v22 = sub_21FFA8290();
  v22[1] = v23;
  v22[2] = v24;
  v25 = (double *)(a6 + v19[19]);
  *(_OWORD *)v25 = xmmword_21FFCC760;
  *((_OWORD *)v25 + 1) = xmmword_21FFCC770;
  v26 = OUTLINED_FUNCTION_17_7();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
  v44 = a1;
  v28(a6, a1, v26);
  v29 = a6 + v19[9];
  *(_BYTE *)v29 = v14;
  *(_QWORD *)(v29 + 8) = v15;
  *(_QWORD *)(v29 + 16) = v16;
  *(_QWORD *)(v29 + 24) = v17;
  *(_BYTE *)(a6 + v19[10]) = BYTE4(v43);
  v30 = swift_allocObject();
  *(_BYTE *)(v30 + 16) = v14;
  *(_QWORD *)(v30 + 24) = v15;
  *(_QWORD *)(v30 + 32) = v16;
  *(_QWORD *)(v30 + 40) = v17;
  *(_QWORD *)(a6 + v19[14]) = v30 | 0x4000000000000000;
  v31 = a6 + v19[15];
  *(_BYTE *)v31 = 1;
  *(_QWORD *)(v31 + 8) = 0;
  *(_QWORD *)(v31 + 16) = 0;
  *(_QWORD *)(v31 + 24) = v30 | 0x4000000000000000;
  swift_bridgeObjectRetain();
  sub_21FF0E594(v17);
  v32 = qword_25558DEF0;
  swift_retain();
  if (v32 != -1)
    swift_once();
  OUTLINED_FUNCTION_40_5();
  v33 = sub_21FFC35F0();
  v34 = (uint64_t *)(a6 + v19[16]);
  *v34 = v33;
  v34[1] = v35;
  OUTLINED_FUNCTION_40_5();
  v36 = sub_21FFC35F0();
  v37 = (uint64_t *)(a6 + v19[17]);
  *v37 = v36;
  v37[1] = v38;
  sub_21FF0F7EC(&qword_255591EC8, (void (*)(uint64_t))MEMORY[0x24BE6AF70]);
  v39 = v44;
  sub_21FFC3A58();
  v41 = v40;
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v39, v26);
  result = v41 * 48.0 + v25[2];
  *(double *)(a6 + v19[18]) = result;
  return result;
}

uint64_t _s24PlaylistFolderDetailViewVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s24PlaylistFolderDetailViewVMn);
}

void sub_21FFB9554(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255591EB8);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v2);
  sub_21FF0FF4C(a1, (uint64_t)&v4 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_255591EB8);
  sub_21FFC4CB8();
  sub_21FF103AC(a1, &qword_255591EB8);
}

uint64_t sub_21FFB95EC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v0 + 40));
  return swift_deallocObject();
}

void sub_21FFB9618()
{
  unint64_t v0;
  unint64_t v1;

  sub_21FFC5660();
  if (v0 <= 0x3F)
  {
    sub_21FFBA5C4();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

_QWORD *sub_21FFB96F0(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD *v48;
  _OWORD *v49;
  __int128 v50;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_21FFC5660();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[9];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    *v9 = *v10;
    v11 = *((_QWORD *)v10 + 2);
    *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
    *((_QWORD *)v9 + 2) = v11;
    v12 = *((_QWORD *)v10 + 3);
    swift_bridgeObjectRetain();
    sub_21FF0E594(v12);
    v13 = a3[10];
    v14 = a3[11];
    v15 = *((_BYTE *)a2 + v13);
    *((_QWORD *)v9 + 3) = v12;
    *((_BYTE *)a1 + v13) = v15;
    v16 = (char *)a1 + v14;
    v17 = (char *)a2 + v14;
    if ((*((_BYTE *)a2 + v14 + 40) & 1) != 0)
    {
      v18 = *((_QWORD *)v17 + 3);
      if (v18)
      {
        v19 = *((_QWORD *)v17 + 4);
        *((_QWORD *)v16 + 3) = v18;
        *((_QWORD *)v16 + 4) = v19;
        (**(void (***)(char *))(v18 - 8))((char *)a1 + v14);
      }
      else
      {
        v21 = *((_OWORD *)v17 + 1);
        *(_OWORD *)v16 = *(_OWORD *)v17;
        *((_OWORD *)v16 + 1) = v21;
        *((_QWORD *)v16 + 4) = *((_QWORD *)v17 + 4);
      }
      v16[40] = 1;
    }
    else
    {
      *(_QWORD *)v16 = *(_QWORD *)v17;
      v16[40] = 0;
      swift_retain();
    }
    v22 = a3[12];
    v23 = (char *)a1 + v22;
    v24 = (char *)a2 + v22;
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v25))
    {
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EB8);
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
      __swift_storeEnumTagSinglePayload((uint64_t)v23, 0, 1, v25);
    }
    v27 = __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
    *(_QWORD *)&v23[*(int *)(v27 + 28)] = *(_QWORD *)&v24[*(int *)(v27 + 28)];
    v28 = a3[13];
    v29 = a3[14];
    v30 = (_QWORD *)((char *)a1 + v28);
    v31 = (_QWORD *)((char *)a2 + v28);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    v30[2] = v31[2];
    v33 = *(_QWORD *)((char *)a2 + v29);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_21FF0E594(v33);
    *(_QWORD *)((char *)a1 + v29) = v33;
    v34 = a3[15];
    v35 = (char *)a1 + v34;
    v36 = (char *)a2 + v34;
    *v35 = *v36;
    v37 = *((_QWORD *)v36 + 2);
    *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
    *((_QWORD *)v35 + 2) = v37;
    v38 = *((_QWORD *)v36 + 3);
    swift_bridgeObjectRetain();
    sub_21FF0E594(v38);
    *((_QWORD *)v35 + 3) = v38;
    v39 = a3[16];
    v40 = a3[17];
    v41 = (_QWORD *)((char *)a1 + v39);
    v42 = (_QWORD *)((char *)a2 + v39);
    v43 = v42[1];
    *v41 = *v42;
    v41[1] = v43;
    v44 = (_QWORD *)((char *)a1 + v40);
    v45 = (_QWORD *)((char *)a2 + v40);
    v46 = v45[1];
    *v44 = *v45;
    v44[1] = v46;
    v47 = a3[19];
    *(_QWORD *)((char *)a1 + a3[18]) = *(_QWORD *)((char *)a2 + a3[18]);
    v48 = (_OWORD *)((char *)a1 + v47);
    v49 = (_OWORD *)((char *)a2 + v47);
    v50 = v49[1];
    *v48 = *v49;
    v48[1] = v50;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_21FFB996C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_21FFC5660();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[9];
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v5 + 24));
  v6 = a1 + a2[11];
  if ((*(_BYTE *)(v6 + 40) & 1) != 0)
  {
    if (*(_QWORD *)(v6 + 24))
      __swift_destroy_boxed_opaque_existential_1(v6);
  }
  else
  {
    swift_release();
  }
  v7 = a1 + a2[12];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
  if (!__swift_getEnumTagSinglePayload(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_21FF0EAB8(*(_QWORD *)(a1 + a2[14]));
  v9 = a1 + a2[15];
  swift_bridgeObjectRelease();
  sub_21FF0EAB8(*(_QWORD *)(v9 + 24));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FFB9AA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  _OWORD *v46;
  _OWORD *v47;
  __int128 v48;

  v6 = sub_21FFC5660();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_BYTE *)v8 = *(_BYTE *)v9;
  v10 = *(_QWORD *)(v9 + 16);
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
  *(_QWORD *)(v8 + 16) = v10;
  v11 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  sub_21FF0E594(v11);
  v12 = a3[10];
  v13 = a3[11];
  v14 = *(_BYTE *)(a2 + v12);
  *(_QWORD *)(v8 + 24) = v11;
  *(_BYTE *)(a1 + v12) = v14;
  v15 = a1 + v13;
  v16 = a2 + v13;
  if ((*(_BYTE *)(a2 + v13 + 40) & 1) != 0)
  {
    v17 = *(_QWORD *)(v16 + 24);
    if (v17)
    {
      v18 = *(_QWORD *)(v16 + 32);
      *(_QWORD *)(v15 + 24) = v17;
      *(_QWORD *)(v15 + 32) = v18;
      (**(void (***)(uint64_t))(v17 - 8))(a1 + v13);
    }
    else
    {
      v19 = *(_OWORD *)(v16 + 16);
      *(_OWORD *)v15 = *(_OWORD *)v16;
      *(_OWORD *)(v15 + 16) = v19;
      *(_QWORD *)(v15 + 32) = *(_QWORD *)(v16 + 32);
    }
    *(_BYTE *)(v15 + 40) = 1;
  }
  else
  {
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *(_BYTE *)(v15 + 40) = 0;
    swift_retain();
  }
  v20 = a3[12];
  v21 = (char *)(a1 + v20);
  v22 = (char *)(a2 + v20);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v23))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EB8);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v23);
  }
  v25 = __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  *(_QWORD *)&v21[*(int *)(v25 + 28)] = *(_QWORD *)&v22[*(int *)(v25 + 28)];
  v26 = a3[13];
  v27 = a3[14];
  v28 = (_QWORD *)(a1 + v26);
  v29 = (_QWORD *)(a2 + v26);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  v28[2] = v29[2];
  v31 = *(_QWORD *)(a2 + v27);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21FF0E594(v31);
  *(_QWORD *)(a1 + v27) = v31;
  v32 = a3[15];
  v33 = a1 + v32;
  v34 = a2 + v32;
  *(_BYTE *)v33 = *(_BYTE *)v34;
  v35 = *(_QWORD *)(v34 + 16);
  *(_QWORD *)(v33 + 8) = *(_QWORD *)(v34 + 8);
  *(_QWORD *)(v33 + 16) = v35;
  v36 = *(_QWORD *)(v34 + 24);
  swift_bridgeObjectRetain();
  sub_21FF0E594(v36);
  *(_QWORD *)(v33 + 24) = v36;
  v37 = a3[16];
  v38 = a3[17];
  v39 = (_QWORD *)(a1 + v37);
  v40 = (_QWORD *)(a2 + v37);
  v41 = v40[1];
  *v39 = *v40;
  v39[1] = v41;
  v42 = (_QWORD *)(a1 + v38);
  v43 = (_QWORD *)(a2 + v38);
  v44 = v43[1];
  *v42 = *v43;
  v42[1] = v44;
  v45 = a3[19];
  *(_QWORD *)(a1 + a3[18]) = *(_QWORD *)(a2 + a3[18]);
  v46 = (_OWORD *)(a1 + v45);
  v47 = (_OWORD *)(a2 + v45);
  v48 = v47[1];
  *v46 = *v47;
  v46[1] = v48;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21FFB9CF0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  int EnumTagSinglePayload;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;

  v6 = sub_21FFC5660();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_BYTE *)v8 = *(_BYTE *)(a2 + v7);
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(a2 + v7 + 8);
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(a2 + v7 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(v9 + 24);
  sub_21FF0E594(v10);
  v11 = *(_QWORD *)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v10;
  sub_21FF0EAB8(v11);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  if (a1 != a2)
  {
    v12 = a3[11];
    v13 = a1 + v12;
    v14 = (__int128 *)(a2 + v12);
    sub_21FF103AC(a1 + v12, qword_25558DFD0);
    if ((*((_BYTE *)v14 + 40) & 1) != 0)
    {
      v15 = *((_QWORD *)v14 + 3);
      if (v15)
      {
        *(_QWORD *)(v13 + 24) = v15;
        *(_QWORD *)(v13 + 32) = *((_QWORD *)v14 + 4);
        (**(void (***)(uint64_t, __int128 *))(v15 - 8))(v13, v14);
      }
      else
      {
        v16 = *v14;
        v17 = v14[1];
        *(_QWORD *)(v13 + 32) = *((_QWORD *)v14 + 4);
        *(_OWORD *)v13 = v16;
        *(_OWORD *)(v13 + 16) = v17;
      }
      *(_BYTE *)(v13 + 40) = 1;
    }
    else
    {
      *(_QWORD *)v13 = *(_QWORD *)v14;
      *(_BYTE *)(v13 + 40) = 0;
      swift_retain();
    }
  }
  v18 = a3[12];
  v19 = (char *)(a1 + v18);
  v20 = (char *)(a2 + v18);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v19, 1, v21);
  v23 = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, v21);
  if (!EnumTagSinglePayload)
  {
    v24 = *(_QWORD *)(v21 - 8);
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 24))(v19, v20, v21);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v19, v21);
    goto LABEL_13;
  }
  if (v23)
  {
LABEL_13:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EB8);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v21);
LABEL_14:
  v26 = __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  *(_QWORD *)&v19[*(int *)(v26 + 28)] = *(_QWORD *)&v20[*(int *)(v26 + 28)];
  swift_retain();
  swift_release();
  v27 = a3[13];
  v28 = (_QWORD *)(a1 + v27);
  v29 = a2 + v27;
  *v28 = *(_QWORD *)(a2 + v27);
  v28[1] = *(_QWORD *)(a2 + v27 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28[2] = *(_QWORD *)(v29 + 16);
  swift_retain();
  swift_release();
  v30 = a3[14];
  v31 = *(_QWORD *)(a2 + v30);
  sub_21FF0E594(v31);
  v32 = *(_QWORD *)(a1 + v30);
  *(_QWORD *)(a1 + v30) = v31;
  sub_21FF0EAB8(v32);
  v33 = a3[15];
  v34 = a1 + v33;
  v35 = a2 + v33;
  *(_BYTE *)v34 = *(_BYTE *)(a2 + v33);
  *(_QWORD *)(v34 + 8) = *(_QWORD *)(a2 + v33 + 8);
  *(_QWORD *)(v34 + 16) = *(_QWORD *)(a2 + v33 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v36 = *(_QWORD *)(v35 + 24);
  sub_21FF0E594(v36);
  v37 = *(_QWORD *)(v34 + 24);
  *(_QWORD *)(v34 + 24) = v36;
  sub_21FF0EAB8(v37);
  v38 = a3[16];
  v39 = (_QWORD *)(a1 + v38);
  v40 = (_QWORD *)(a2 + v38);
  *v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v41 = a3[17];
  v42 = (_QWORD *)(a1 + v41);
  v43 = (_QWORD *)(a2 + v41);
  *v42 = *v43;
  v42[1] = v43[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[18]) = *(_QWORD *)(a2 + a3[18]);
  v44 = a3[19];
  v45 = (_QWORD *)(a1 + v44);
  v46 = (_QWORD *)(a2 + v44);
  *v45 = *v46;
  v45[1] = v46[1];
  v45[2] = v46[2];
  v45[3] = v46[3];
  return a1;
}

uint64_t sub_21FFBA058(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  __int128 v16;
  char *v17;
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
  _OWORD *v28;
  _OWORD *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  _OWORD *v34;
  __int128 v35;

  v6 = sub_21FFC5660();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[9];
  v8 = a3[10];
  v9 = (_OWORD *)(a1 + v7);
  v10 = (_OWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v12 = a3[11];
  v13 = a3[12];
  v14 = (_OWORD *)(a1 + v12);
  v15 = (_OWORD *)(a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  *(_OWORD *)((char *)v14 + 25) = *(_OWORD *)((char *)v15 + 25);
  v17 = (char *)(a1 + v13);
  v18 = (char *)(a2 + v13);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EB8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  }
  v21 = __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  *(_QWORD *)&v17[*(int *)(v21 + 28)] = *(_QWORD *)&v18[*(int *)(v21 + 28)];
  v22 = a3[13];
  v23 = a3[14];
  v24 = a1 + v22;
  v25 = a2 + v22;
  *(_QWORD *)(v24 + 16) = *(_QWORD *)(v25 + 16);
  *(_OWORD *)v24 = *(_OWORD *)v25;
  *(_QWORD *)(a1 + v23) = *(_QWORD *)(a2 + v23);
  v26 = a3[15];
  v27 = a3[16];
  v28 = (_OWORD *)(a1 + v26);
  v29 = (_OWORD *)(a2 + v26);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  *(_OWORD *)(a1 + v27) = *(_OWORD *)(a2 + v27);
  v31 = a3[18];
  *(_OWORD *)(a1 + a3[17]) = *(_OWORD *)(a2 + a3[17]);
  *(_QWORD *)(a1 + v31) = *(_QWORD *)(a2 + v31);
  v32 = a3[19];
  v33 = (_OWORD *)(a1 + v32);
  v34 = (_OWORD *)(a2 + v32);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  return a1;
}

uint64_t sub_21FFBA1E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  int EnumTagSinglePayload;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  _OWORD *v48;
  __int128 v49;

  v6 = sub_21FFC5660();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_BYTE *)v8 = *(_BYTE *)(a2 + v7);
  v10 = *(_QWORD *)(a2 + v7 + 16);
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(a2 + v7 + 8);
  *(_QWORD *)(v8 + 16) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v8 + 24);
  *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
  sub_21FF0EAB8(v11);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  if (a1 != a2)
  {
    v12 = a3[11];
    v13 = (_OWORD *)(a2 + v12);
    v14 = (_OWORD *)(a1 + v12);
    sub_21FF103AC(a1 + v12, qword_25558DFD0);
    v15 = v13[1];
    *v14 = *v13;
    v14[1] = v15;
    *(_OWORD *)((char *)v14 + 25) = *(_OWORD *)((char *)v13 + 25);
  }
  v16 = a3[12];
  v17 = (char *)(a1 + v16);
  v18 = (char *)(a2 + v16);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v17, 1, v19);
  v21 = __swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19);
  if (!EnumTagSinglePayload)
  {
    v22 = *(_QWORD *)(v19 - 8);
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 40))(v17, v18, v19);
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v19);
    goto LABEL_8;
  }
  if (v21)
  {
LABEL_8:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EB8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_9;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
LABEL_9:
  v24 = __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  *(_QWORD *)&v17[*(int *)(v24 + 28)] = *(_QWORD *)&v18[*(int *)(v24 + 28)];
  swift_release();
  v25 = a3[13];
  v26 = (_QWORD *)(a1 + v25);
  v27 = a2 + v25;
  v28 = *(_QWORD *)(a2 + v25 + 8);
  *v26 = *(_QWORD *)(a2 + v25);
  v26[1] = v28;
  swift_bridgeObjectRelease();
  v26[2] = *(_QWORD *)(v27 + 16);
  swift_release();
  v29 = a3[14];
  v30 = *(_QWORD *)(a1 + v29);
  *(_QWORD *)(a1 + v29) = *(_QWORD *)(a2 + v29);
  sub_21FF0EAB8(v30);
  v31 = a3[15];
  v32 = a1 + v31;
  v33 = a2 + v31;
  *(_BYTE *)v32 = *(_BYTE *)(a2 + v31);
  v34 = *(_QWORD *)(a2 + v31 + 16);
  *(_QWORD *)(v32 + 8) = *(_QWORD *)(a2 + v31 + 8);
  *(_QWORD *)(v32 + 16) = v34;
  swift_bridgeObjectRelease();
  v35 = *(_QWORD *)(v32 + 24);
  *(_QWORD *)(v32 + 24) = *(_QWORD *)(v33 + 24);
  sub_21FF0EAB8(v35);
  v36 = a3[16];
  v37 = (_QWORD *)(a1 + v36);
  v38 = (uint64_t *)(a2 + v36);
  v40 = *v38;
  v39 = v38[1];
  *v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  v41 = a3[17];
  v42 = (_QWORD *)(a1 + v41);
  v43 = (uint64_t *)(a2 + v41);
  v45 = *v43;
  v44 = v43[1];
  *v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  v46 = a3[19];
  *(_QWORD *)(a1 + a3[18]) = *(_QWORD *)(a2 + a3[18]);
  v47 = (_OWORD *)(a1 + v46);
  v48 = (_OWORD *)(a2 + v46);
  v49 = v48[1];
  *v47 = *v48;
  v47[1] = v49;
  return a1;
}

uint64_t sub_21FFBA468()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFBA474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;

  v6 = OUTLINED_FUNCTION_17_7();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v9;
    v8 = a1 + *(int *)(a3 + 48);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 52) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_21FFBA518()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FFBA524(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = OUTLINED_FUNCTION_17_7();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a1 + *(int *)(a4 + 48);
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 52) + 8) = (a2 - 1);
  return result;
}

void sub_21FFBA5C4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255591F58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591EB8);
    v0 = sub_21FFC4CE8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255591F58);
  }
}

uint64_t sub_21FFBA61C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21FFBA650(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[67];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[8];
  _BYTE v36[8];
  _BYTE v37[8];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[8];

  v34 = a1;
  v31[66] = a2;
  v3 = sub_21FFC43AC();
  OUTLINED_FUNCTION_47_3(v3, (uint64_t)v42);
  OUTLINED_FUNCTION_10_5(v4);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_11_3(v6);
  v7 = sub_21FFC4700();
  OUTLINED_FUNCTION_47_3(v7, (uint64_t)&v41);
  OUTLINED_FUNCTION_10_5(v8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_95(v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558F628);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_11_3(v12);
  v13 = sub_21FFC4508();
  OUTLINED_FUNCTION_47_3(v13, (uint64_t)v36);
  OUTLINED_FUNCTION_10_5(v14);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_11_3(v16);
  v17 = sub_21FFC4514();
  OUTLINED_FUNCTION_47_3(v17, (uint64_t)v37);
  OUTLINED_FUNCTION_10_5(v18);
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_11_3(v20);
  v21 = sub_21FFC5984();
  OUTLINED_FUNCTION_47_3(v21, (uint64_t)v35);
  OUTLINED_FUNCTION_10_5(v22);
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_95(v24);
  v32 = *(_QWORD *)(a1 - 8);
  v33 = *(_QWORD *)(v32 + 64);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_95((uint64_t)v31 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555905F0);
  v27 = sub_21FFC5648();
  v28 = *(_QWORD *)(a1 + 16);
  sub_21FF0F7EC(&qword_25558F3D8, (void (*)(uint64_t))MEMORY[0x24BE6AF30]);
  v29 = *(_QWORD *)(a1 + 24);
  v38 = v27;
  v39 = v28;
  v40 = v30;
  v41 = v29;
  _s13ItemShelfCellVMa();
}

void sub_21FFBA830()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_52_4();
  OUTLINED_FUNCTION_52_4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_4();
  sub_21FFAE490(&qword_255591F60, v1);
  v5 = v4;
  v6 = sub_21FF0F864();
  v7 = MEMORY[0x24BDDEE98];
  *(_QWORD *)(v2 - 184) = v0;
  *(_QWORD *)(v2 - 176) = v7;
  *(_QWORD *)(v2 - 168) = v3;
  *(_QWORD *)(v2 - 160) = v5;
  *(_QWORD *)(v2 - 152) = v6;
  sub_21FFC4DE4();
  sub_21FFC5AC8();
  OUTLINED_FUNCTION_49();
}

void sub_21FFBA8D0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  OUTLINED_FUNCTION_20();
}

void sub_21FFBA8E4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  OUTLINED_FUNCTION_75();
}

void sub_21FFBA8F8()
{
  OUTLINED_FUNCTION_32_2();
  OUTLINED_FUNCTION_20();
}

void sub_21FFBA90C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = sub_21FFC3FA4();
  *(_QWORD *)(v0 - 344) = *(_QWORD *)(v1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v3);
  v4 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEB238], v1);
  v5 = sub_21FF2E0A8();
  v6 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 - 184) = v1;
  *(_QWORD *)(v0 - 176) = v6;
  *(_QWORD *)(v0 - 168) = v4;
  *(_QWORD *)(v0 - 160) = v5;
  *(_QWORD *)(v0 - 912) = v4;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFBA990(uint64_t a1)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v6 - 352) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v6 - 776) = a1;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_1();
  *(_QWORD *)(v6 - 808) = v8;
  *(_QWORD *)(v6 - 312) = v3;
  *(_QWORD *)(v6 - 304) = v2;
  _s18NavigationBarStyleVMa(255, v3, v2, v9);
  v10 = sub_21FFC419C();
  *(_QWORD *)(v6 - 624) = *(_QWORD *)(v10 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8_1();
  *(_QWORD *)(v6 - 824) = v12;
  sub_21FFC40E8();
  *(_QWORD *)(v6 - 832) = v10;
  *(_QWORD *)(v6 - 568) = *(_QWORD *)(sub_21FFC419C() - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v14);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E0B0);
  _s10DoneButtonVMa(255, v3, v2, v15);
  *(_QWORD *)(v6 - 184) = v5;
  *(_QWORD *)(v6 - 176) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 - 168) = v1;
  *(_QWORD *)(v6 - 160) = v4;
  *(_QWORD *)(v6 - 904) = OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_75();
}

void sub_21FFBAADC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = v1;
  *(_QWORD *)(v2 - 112) = a1;
  OUTLINED_FUNCTION_63();
}

void sub_21FFBAAF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)(v1 - 888) = a1;
  sub_21FF0F7EC(&qword_25558E0B8, (void (*)(uint64_t))MEMORY[0x24BDEC4E0]);
  *(_QWORD *)(v1 - 136) = a1;
  *(_QWORD *)(v1 - 128) = v3;
  OUTLINED_FUNCTION_47_5();
}

void sub_21FFBAB28(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_21FFAE490(&qword_25558E0C0, v1);
  v8 = v7;
  v9 = MEMORY[0x2207DB4B4](&unk_21FFC8488, v3);
  *(_QWORD *)(v5 - 184) = v4;
  *(_QWORD *)(v5 - 176) = v2;
  *(_QWORD *)(v5 - 880) = v4;
  *(_QWORD *)(v5 - 848) = v2;
  *(_QWORD *)(v5 - 168) = v3;
  *(_QWORD *)(v5 - 160) = a1;
  *(_QWORD *)(v5 - 896) = v3;
  *(_QWORD *)(v5 - 856) = a1;
  *(_QWORD *)(v5 - 152) = v8;
  *(_QWORD *)(v5 - 144) = v9;
  *(_QWORD *)(v5 - 864) = v8;
  *(_QWORD *)(v5 - 872) = v9;
  OUTLINED_FUNCTION_1_28();
}

void sub_21FFBABB0(uint64_t a1)
{
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

  *(_QWORD *)(v8 - 592) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v11);
  *(_QWORD *)(v8 - 184) = v7;
  *(_QWORD *)(v8 - 176) = v1;
  *(_QWORD *)(v8 - 168) = v5;
  *(_QWORD *)(v8 - 160) = v2;
  *(_QWORD *)(v8 - 152) = v3;
  *(_QWORD *)(v8 - 144) = v4;
  v12 = OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v8 - 184) = a1;
  *(_QWORD *)(v8 - 760) = a1;
  *(_QWORD *)(v8 - 176) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v8 - 168) = v12;
  *(_QWORD *)(v8 - 816) = v12;
  *(_QWORD *)(v8 - 336) = v6;
  *(_QWORD *)(v8 - 160) = v6;
  OUTLINED_FUNCTION_1_28();
}

void sub_21FFBAC30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v5 - 608) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v8);
  *(_QWORD *)(v5 - 184) = v1;
  *(_QWORD *)(v5 - 176) = v3;
  *(_QWORD *)(v5 - 168) = v2;
  *(_QWORD *)(v5 - 160) = v4;
  v9 = OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v5 - 696) = a1;
  *(_QWORD *)(v5 - 184) = a1;
  *(_QWORD *)(v5 - 176) = v9;
  *(_QWORD *)(v5 - 688) = v9;
  OUTLINED_FUNCTION_1_28();
}

void sub_21FFBAC94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v3 - 632) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v6);
  *(_QWORD *)(v3 - 184) = v1;
  *(_QWORD *)(v3 - 176) = v2;
  v7 = OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v3 - 744) = a1;
  *(_QWORD *)(v3 - 184) = a1;
  *(_QWORD *)(v3 - 176) = v7;
  *(_QWORD *)(v3 - 736) = v7;
  OUTLINED_FUNCTION_1_28();
}

void sub_21FFBACF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v3 - 648) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_1();
  *(_QWORD *)(v3 - 752) = v6;
  *(_QWORD *)(v3 - 184) = v1;
  *(_QWORD *)(v3 - 176) = v2;
  v7 = OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v3 - 800) = a1;
  *(_QWORD *)(v3 - 184) = a1;
  *(_QWORD *)(v3 - 176) = v7;
  *(_QWORD *)(v3 - 784) = v7;
  OUTLINED_FUNCTION_1_28();
}

void sub_21FFBAD5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v4 - 584) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_1();
  *(_QWORD *)(v4 - 792) = v7;
  *(_QWORD *)(v4 - 184) = v1;
  *(_QWORD *)(v4 - 176) = v2;
  v8 = OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v4 - 184) = a1;
  *(_QWORD *)(v4 - 176) = v3;
  *(_QWORD *)(v4 - 680) = a1;
  v9 = MEMORY[0x24BEE0D28];
  *(_QWORD *)(v4 - 168) = v8;
  *(_QWORD *)(v4 - 160) = v9;
  *(_QWORD *)(v4 - 672) = v8;
  OUTLINED_FUNCTION_1_28();
}

void sub_21FFBADD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v5 - 600) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v5 - 656) = a1;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v8);
  *(_QWORD *)(v5 - 184) = v1;
  *(_QWORD *)(v5 - 176) = v4;
  *(_QWORD *)(v5 - 168) = v3;
  *(_QWORD *)(v5 - 160) = v2;
  v9 = OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v5 - 664) = v9;
  *(_QWORD *)(v5 - 184) = a1;
  *(_QWORD *)(v5 - 176) = v9;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFBAE3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  uint64_t v20;

  *(_QWORD *)(v9 - 552) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v9 - 616) = a1;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v11);
  v12 = sub_21FFC419C();
  *(_QWORD *)(v9 - 528) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v9 - 576) = v12;
  OUTLINED_FUNCTION_72();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_95(v14);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591950);
  v15 = sub_21FFC419C();
  OUTLINED_FUNCTION_47_3(v15, v9 - 280);
  OUTLINED_FUNCTION_10_5(v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  *(_QWORD *)(v9 - 560) = (char *)&a9 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_95((uint64_t)&a9 - v20);
  OUTLINED_FUNCTION_42_2();
  sub_21FFBB784();
}

void sub_21FFBAF48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 - 184) = sub_21FFC5654();
  *(_QWORD *)(v2 - 176) = v3;
  sub_21FFC4A18();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 344) + 8))(v0, v1);
  OUTLINED_FUNCTION_42_2();
  sub_21FF9F64C(*(_QWORD *)(v2 - 312), *(_QWORD *)(v2 - 776), *(_QWORD *)(v2 - 312), *(_QWORD *)(v2 - 904), *(_QWORD *)(v2 - 304));
}

void sub_21FFBAFE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, _QWORD);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, _QWORD);
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, _QWORD);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, _QWORD);
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  unint64_t v57;

  OUTLINED_FUNCTION_12_10(*(_QWORD *)(v4 - 352));
  v5 = *(_QWORD *)(v4 - 376);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  *(_QWORD *)(v4 - 344) = v6;
  v7 = *(_QWORD *)(v4 - 320);
  v6(v7, v1, v2);
  v8 = *(unsigned __int8 *)(v5 + 80);
  v9 = (v8 + 32) & ~v8;
  *(_QWORD *)(v4 - 360) += v9;
  v10 = v9;
  *(_QWORD *)(v4 - 352) = v9;
  *(_QWORD *)(v4 - 368) = v8 | 7;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v3;
  *(_QWORD *)(v11 + 24) = v0;
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
  *(_QWORD *)(v4 - 376) = v12;
  v12(v11 + v10, v7, v2);
  v13 = *(_QWORD *)(v4 - 512);
  sub_21FF09BB0();
  v14 = *(_QWORD *)(v4 - 728);
  sub_21FFC4AE4();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_37_3(v13, v15);
  OUTLINED_FUNCTION_20_9(v4 - 368);
  *(_QWORD *)(v4 - 184) = sub_21FFC4E50();
  *(_QWORD *)(v4 - 176) = v16;
  *(_QWORD *)(v4 - 208) = sub_21FF5AAC4(v3, v0, v17, v18);
  *(_QWORD *)(v4 - 200) = v19;
  swift_checkMetadataState();
  v20 = *(_QWORD *)(v4 - 840);
  sub_21FFC4A54();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_247(v14, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 568) + 8));
  v21 = v2;
  v22 = *(_QWORD *)(v4 - 296);
  v23 = (_QWORD *)(v22 + *(int *)(v2 + 52));
  v24 = v23[1];
  v25 = v23[2];
  *(_QWORD *)(v4 - 208) = *v23;
  *(_QWORD *)(v4 - 200) = v24;
  *(_QWORD *)(v4 - 192) = v25;
  *(_QWORD *)(v4 - 496) = __swift_instantiateConcreteTypeFromMangledName(&qword_255591968);
  sub_21FFC4CDC();
  v26 = *(_QWORD *)(v4 - 480);
  sub_21FFC44FC();
  sub_21FFC44E4();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_37_3(v26, v27);
  v28 = (_QWORD *)(v22 + *(int *)(v21 + 64));
  v29 = v28[1];
  *(_QWORD *)(v4 - 184) = *v28;
  *(_QWORD *)(v4 - 176) = v29;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_42_2();
  sub_21FFC494C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_40_1();
  swift_release();
  v30 = OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_37_3(v30, v31);
  OUTLINED_FUNCTION_101_0(v20, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 592) + 8));
  v32 = *(_QWORD *)(v4 - 440);
  sub_21FFC4694();
  v33 = sub_21FFC46A0();
  __swift_storeEnumTagSinglePayload(v32, 0, 1, v33);
  sub_21FFC4AB4();
  sub_21FF103AC(v32, &qword_25558F628);
  OUTLINED_FUNCTION_51_3(v22, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 608) + 8));
  v34 = *(_QWORD *)(v4 - 432);
  sub_21FFC46F4();
  v35 = *(_QWORD *)(v4 - 752);
  sub_21FFC4ACC();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_37_3(v34, v36);
  v37 = OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_247(v37, v38);
  MEMORY[0x2207D9D5C](1, *(_QWORD *)(v4 - 800), *(_QWORD *)(v4 - 784));
  OUTLINED_FUNCTION_247(v35, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 648) + 8));
  v39 = v23[1];
  v40 = v23[2];
  *(_QWORD *)(v4 - 184) = *v23;
  *(_QWORD *)(v4 - 176) = v39;
  *(_QWORD *)(v4 - 168) = v40;
  sub_21FFC4CC4();
  v41 = *(_QWORD *)(v4 - 200);
  *(_QWORD *)(v4 - 184) = *(_QWORD *)(v4 - 208);
  *(_QWORD *)(v4 - 176) = v41;
  OUTLINED_FUNCTION_30_4(v4 - 88);
  v42 = OUTLINED_FUNCTION_25_7();
  v43 = *(_QWORD *)(v4 - 304);
  *(_QWORD *)(v42 + 16) = *(_QWORD *)(v4 - 312);
  *(_QWORD *)(v42 + 24) = v43;
  OUTLINED_FUNCTION_30_4(v4 - 120);
  OUTLINED_FUNCTION_42_2();
  sub_21FFC4B98();
  swift_release();
  swift_bridgeObjectRelease();
  v44 = OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_101_0(v44, v45);
  v46 = *(_QWORD *)(v4 - 400);
  v47 = *(_QWORD *)(v4 - 408);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v46 + 104))(v47, *MEMORY[0x24BDEE5F0], *(_QWORD *)(v4 - 392));
  v48 = *(_QWORD *)(v4 - 704);
  v49 = *(_QWORD *)(v4 - 656);
  v50 = *(_QWORD *)(v4 - 664);
  sub_21FFC4AC0();
  OUTLINED_FUNCTION_51_3(v47, *(uint64_t (**)(uint64_t, uint64_t))(v46 + 8));
  OUTLINED_FUNCTION_20_9(v4 - 344);
  v51 = *(_QWORD *)(v4 - 296);
  OUTLINED_FUNCTION_30_4(v4 - 88);
  v52 = OUTLINED_FUNCTION_25_7();
  v53 = *(_QWORD *)(v4 - 312);
  v54 = *(_QWORD *)(v4 - 304);
  *(_QWORD *)(v52 + 16) = v53;
  *(_QWORD *)(v52 + 24) = v54;
  OUTLINED_FUNCTION_30_4(v4 - 120);
  *(_QWORD *)(v4 - 184) = v49;
  *(_QWORD *)(v4 - 176) = v50;
  v55 = OUTLINED_FUNCTION_58_0();
  sub_21FF65C6C((uint64_t)sub_21FFBE15C, v52, *(_QWORD *)(v4 - 616), v55);
  swift_release();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_101_0(v48, v56);
  sub_21FFC4E50();
  *(_QWORD *)(v4 - 272) = v53;
  *(_QWORD *)(v4 - 264) = v54;
  *(_QWORD *)(v4 - 256) = v51;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591970);
  v57 = sub_21FF0F948();
  *(_QWORD *)(v4 - 224) = v55;
  *(_QWORD *)(v4 - 216) = v57;
  OUTLINED_FUNCTION_63();
}

void sub_21FFBB66C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  sub_21FFAEB94(&qword_255591978, v1);
  sub_21FFC4B2C();
  OUTLINED_FUNCTION_5_7();
  v6(v3, v2);
  sub_21FFAE490(&qword_2555919A0, &qword_255591950);
  *(_QWORD *)(v4 - 240) = a1;
  *(_QWORD *)(v4 - 232) = v7;
  OUTLINED_FUNCTION_20();
}

uint64_t sub_21FFBB708()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(v2 - 544);
  sub_21FFB5D18(v1, v0, v3);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 520) + 8);
  v4(v1, v0);
  sub_21FFB57EC(v3, v0, *(_QWORD *)(v2 - 384));
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(v3, v0);
}

void sub_21FFBB784()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555905F0);
  sub_21FFC5648();
  sub_21FF0F7EC(&qword_25558F3D8, (void (*)(uint64_t))MEMORY[0x24BE6AF30]);
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FFBB804()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  void (*v22)(_BYTE *, uint64_t);
  _BYTE v24[96];

  sub_21FFC419C();
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  swift_getTupleTypeMetadata2();
  v7 = sub_21FFC4EBC();
  sub_21FFAE490(&qword_255591F60, v3);
  v9 = v8;
  v10 = sub_21FF0F864();
  v11 = MEMORY[0x24BDDEE98];
  *(_QWORD *)(v6 - 120) = v2;
  *(_QWORD *)(v6 - 112) = v11;
  *(_QWORD *)(v6 - 104) = v7;
  *(_QWORD *)(v6 - 96) = v9;
  *(_QWORD *)(v6 - 88) = v10;
  v12 = sub_21FFC4DE4();
  v13 = sub_21FFC5AC8();
  *(_QWORD *)(v6 - 128) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v7);
  *(_QWORD *)(v6 - 136) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v12, v6 - 128);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF5578], v13, v6 - 136);
  v14 = sub_21FFC3F98();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEB188], v14);
  v15 = sub_21FFC3FA4();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = &v24[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v17);
  v21 = &v24[-v20];
  sub_21FFC4724();
  *(_QWORD *)(v6 - 160) = v4;
  *(_QWORD *)(v6 - 152) = v5;
  *(_QWORD *)(v6 - 144) = v1;
  sub_21FFC3FB0();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEB238], v15);
  sub_21FFB5D18((uint64_t)v19, v15, (uint64_t)v21);
  v22 = *(void (**)(_BYTE *, uint64_t))(v16 + 8);
  v22(v19, v15);
  sub_21FFB57EC((uint64_t)v21, v15, v0);
  return ((uint64_t (*)(_BYTE *, uint64_t))v22)(v21, v15);
}

uint64_t sub_21FFBBA20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v3[2] = sub_21FFC5960();
  v3[3] = sub_21FFC5954();
  v6 = (_QWORD *)swift_task_alloc();
  v3[4] = v6;
  v8 = _s24PlaylistFolderDetailViewVMa(0, a2, a3, v7);
  *v6 = v3;
  v6[1] = sub_21FFBBAA8;
  return sub_21FFBBB00(v8);
}

uint64_t sub_21FFBBAA8()
{
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_45_6();
  return OUTLINED_FUNCTION_19_4();
}

uint64_t sub_21FFBBB00(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;

  v2[7] = a1;
  v2[8] = v1;
  v2[9] = sub_21FFC5960();
  v2[10] = sub_21FFC5954();
  v4 = (_QWORD *)swift_task_alloc();
  v2[11] = v4;
  *v4 = v2;
  v4[1] = sub_21FFBBB78;
  return sub_21FFBBFE8(a1);
}

uint64_t sub_21FFBBB78()
{
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_45_6();
  return OUTLINED_FUNCTION_19_4();
}

uint64_t sub_21FFBBBD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t *, uint64_t, uint64_t);
  unint64_t v8;

  swift_release();
  sub_21FFB5E88(v0 + 16);
  v1 = *(_QWORD *)(v0 + 40);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 56);
    v2 = *(_QWORD *)(v0 + 64);
    v4 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    v5 = *(_QWORD *)(v2 + *(int *)(v3 + 56));
    v8 = v5;
    v6 = *(void (**)(unint64_t *, uint64_t, uint64_t))(v4 + 8);
    sub_21FF0E594(v5);
    v6(&v8, v1, v4);
    sub_21FF0EAB8(v5);
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  else
  {
    sub_21FF103AC(v0 + 16, &qword_25558E0E0);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21FFBBC9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v17;
  __int128 *v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  v33 = a2;
  v34 = a3;
  v5 = _s24PlaylistFolderDetailViewVMa(0, a2, a3, a4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v32 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E1B8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EB8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  v18 = (__int128 *)(a1 + *(int *)(v5 + 52));
  v19 = *v18;
  v20 = *((_QWORD *)v18 + 2);
  v35 = v19;
  v36 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591968);
  sub_21FFC4CC4();
  v22 = v37;
  v21 = v38;
  swift_bridgeObjectRelease();
  v23 = HIBYTE(v21) & 0xF;
  if ((v21 & 0x2000000000000000) == 0)
    v23 = v22 & 0xFFFFFFFFFFFFLL;
  if (!v23)
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v24);
    sub_21FF0FF4C((uint64_t)v17, (uint64_t)v15, &qword_255591EB8);
    __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
    sub_21FFC4CD0();
    sub_21FF103AC((uint64_t)v17, &qword_255591EB8);
  }
  v25 = sub_21FFC5984();
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v25);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  sub_21FFC5960();
  v26 = sub_21FFC5954();
  v27 = (*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v28 = (char *)swift_allocObject();
  v29 = MEMORY[0x24BEE6930];
  *((_QWORD *)v28 + 2) = v26;
  *((_QWORD *)v28 + 3) = v29;
  v30 = v34;
  *((_QWORD *)v28 + 4) = v33;
  *((_QWORD *)v28 + 5) = v30;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v28[v27], v8, v5);
  sub_21FF66F9C((uint64_t)v11, (uint64_t)&unk_255591F80, (uint64_t)v28);
  return swift_release();
}

uint64_t sub_21FFBBF08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6[2] = sub_21FFC5960();
  v6[3] = sub_21FFC5954();
  v9 = (_QWORD *)swift_task_alloc();
  v6[4] = v9;
  v11 = _s24PlaylistFolderDetailViewVMa(0, a5, a6, v10);
  *v9 = v6;
  v9[1] = sub_21FFBBF90;
  return sub_21FFBBFE8(v11);
}

uint64_t sub_21FFBBF90()
{
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_45_6();
  return OUTLINED_FUNCTION_19_4();
}

uint64_t sub_21FFBBFE8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[22] = a1;
  v2[23] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591EB8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
  v2[26] = v4;
  v2[27] = *(_QWORD *)(v4 - 8);
  v2[28] = swift_task_alloc();
  v5 = sub_21FFC35A8();
  v2[29] = v5;
  v2[30] = *(_QWORD *)(v5 - 8);
  v2[31] = swift_task_alloc();
  v2[32] = *(_QWORD *)(a1 - 8);
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591F90);
  v2[35] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558F400);
  v2[36] = v6;
  v2[37] = *(_QWORD *)(v6 - 8);
  v2[38] = swift_task_alloc();
  sub_21FFC5960();
  v2[39] = sub_21FFC5954();
  v2[40] = sub_21FFC5930();
  v2[41] = v7;
  return swift_task_switch();
}

uint64_t sub_21FFBC15C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  _QWORD *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = *(_QWORD *)(v0 + 280);
  v29 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 184);
  sub_21FFC5648();
  sub_21FF0F7EC(&qword_25558F3D0, (void (*)(uint64_t))MEMORY[0x24BE6AF30]);
  sub_21FFC50D8();
  swift_getKeyPath();
  v5 = OUTLINED_FUNCTION_17_7();
  v6 = (void (*)(uint64_t))MEMORY[0x24BE6AF70];
  *(_QWORD *)(v0 + 336) = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v1, v4, v5);
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v5);
  sub_21FF0F7EC(&qword_255591F98, v6);
  sub_21FFC50C0();
  swift_release();
  sub_21FF103AC(v1, &qword_255591F90);
  v7 = v4 + *(int *)(v3 + 52);
  v8 = *(_QWORD *)(v7 + 16);
  *(_OWORD *)(v0 + 40) = *(_OWORD *)v7;
  *(_QWORD *)(v0 + 56) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591968);
  sub_21FFC4CC4();
  v10 = *(_QWORD *)(v0 + 136);
  v9 = *(_QWORD *)(v0 + 144);
  swift_bridgeObjectRelease();
  if ((v9 & 0x2000000000000000) != 0)
    v11 = HIBYTE(v9) & 0xF;
  else
    v11 = v10 & 0xFFFFFFFFFFFFLL;
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  *(_QWORD *)(v0 + 344) = v12;
  v12(v29, v4, v3);
  if (v11)
  {
    v13 = *(_QWORD *)(v0 + 272);
    v14 = *(_QWORD *)(v0 + 248);
    v15 = *(_QWORD *)(v0 + 240);
    v27 = *(_QWORD *)(v0 + 232);
    v28 = *(_QWORD *)(v0 + 176);
    v30 = *(_QWORD *)(v0 + 256);
    v16 = (__int128 *)(v13 + *(int *)(v3 + 52));
    v17 = *v16;
    v18 = *((_QWORD *)v16 + 2);
    *(_OWORD *)(v0 + 64) = v17;
    *(_QWORD *)(v0 + 80) = v18;
    sub_21FFC4CC4();
    *(_QWORD *)(v0 + 104) = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 112) = *(_QWORD *)(v0 + 96);
    sub_21FFC359C();
    sub_21FF2E0A8();
    v19 = sub_21FFC5AEC();
    v21 = v20;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 0x2000000000000000) != 0)
      v22 = HIBYTE(v21) & 0xF;
    else
      v22 = v19 & 0xFFFFFFFFFFFFLL;
    v23 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v23(v13, v28);
    if (v22)
    {
      v24 = *(_QWORD *)(v7 + 16);
      *(_OWORD *)(v0 + 16) = *(_OWORD *)v7;
      *(_QWORD *)(v0 + 32) = v24;
      sub_21FFC4CC4();
      sub_21FFC50B4();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v23 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 256) + 8);
    v23(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 176));
  }
  *(_QWORD *)(v0 + 352) = v23;
  v25 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v25;
  *v25 = v0;
  v25[1] = sub_21FFBC44C;
  return sub_21FFC50CC();
}

uint64_t sub_21FFBC44C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 368) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_19_4();
}

uint64_t sub_21FFBC4A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v8 = *(_QWORD *)(v0 + 304);
  v1 = *(_QWORD *)(v0 + 296);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 224);
  v5 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 208);
  v6 = *(_QWORD *)(v0 + 192);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v5, v3, v4);
  __swift_storeEnumTagSinglePayload(v5, 0, 1, v4);
  sub_21FF0FF4C(v5, v6, &qword_255591EB8);
  __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  sub_21FFC4CD0();
  sub_21FF103AC(v5, &qword_255591EB8);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  OUTLINED_FUNCTION_51_3(v8, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_14_12();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21FFBC5D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  void *v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
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
  uint64_t v38;
  os_log_type_t type;

  v1 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 296);
  swift_release();
  OUTLINED_FUNCTION_247(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  if (qword_25558DF28 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 176);
  v4 = *(void **)(v0 + 368);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 344);
  v6 = *(_QWORD *)(v0 + 264);
  v7 = *(_QWORD *)(v0 + 184);
  v8 = sub_21FFC3EFC();
  __swift_project_value_buffer(v8, (uint64_t)qword_255598320);
  v5(v6, v7, v3);
  v9 = v4;
  v10 = v4;
  v11 = sub_21FFC3EE4();
  v12 = sub_21FFC5A44();
  v13 = os_log_type_enabled(v11, v12);
  v14 = *(void **)(v0 + 368);
  v15 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
  if (v13)
  {
    type = v12;
    v16 = *(_QWORD *)(v0 + 264);
    v38 = *(_QWORD *)(v0 + 176);
    v17 = swift_slowAlloc();
    swift_slowAlloc();
    *(_DWORD *)v17 = 136315394;
    sub_21FF0F7EC(&qword_255591FA0, (void (*)(uint64_t))MEMORY[0x24BE6AF70]);
    v18 = sub_21FFC5C6C();
    *(_QWORD *)(v0 + 152) = OUTLINED_FUNCTION_41_2(v18, v19, v20, v21, v22, v23, v24, v25);
    sub_21FFC5AD4();
    swift_bridgeObjectRelease();
    v15(v16, v38);
    *(_WORD *)(v17 + 12) = 2080;
    *(_QWORD *)(v0 + 160) = v14;
    v26 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25558E118);
    v27 = sub_21FFC57E0();
    *(_QWORD *)(v0 + 168) = OUTLINED_FUNCTION_41_2(v27, v28, v29, v30, v31, v32, v33, v34);
    sub_21FFC5AD4();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_14_7();
    OUTLINED_FUNCTION_14_7();
    _os_log_impl(&dword_21FF05000, v11, type, "Failed to load content for %s. Error = %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
  }
  v35 = *(_QWORD *)(v0 + 264);
  v36 = *(_QWORD *)(v0 + 176);
  OUTLINED_FUNCTION_14_7();
  v15(v35, v36);
  OUTLINED_FUNCTION_14_7();
  OUTLINED_FUNCTION_14_7();

  OUTLINED_FUNCTION_14_12();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_21FFBC898(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  unint64_t v16;
  void (*v17)(char *, _BYTE *, uint64_t, uint64_t);
  _BYTE v19[8];
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;

  v6 = type metadata accessor for MusicPicker.Click.ControlID();
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v10 = _s24PlaylistFolderDetailViewVMa(0, a2, a3, v9);
  sub_21FFB5E88((uint64_t)v23);
  v11 = v24;
  if (v24)
  {
    v12 = v25;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    swift_storeEnumTagMultiPayload();
    v13 = a1 + *(int *)(v10 + 36);
    v14 = *(_QWORD *)(v13 + 8);
    v15 = *(_QWORD *)(v13 + 16);
    v16 = *(_QWORD *)(v13 + 24);
    v19[0] = *(_BYTE *)v13;
    v20 = v14;
    v21 = v15;
    v22 = v16;
    v17 = *(void (**)(char *, _BYTE *, uint64_t, uint64_t))(v12 + 16);
    swift_bridgeObjectRetain();
    sub_21FF0E594(v16);
    v17(v8, v19, v11, v12);
    swift_bridgeObjectRelease();
    sub_21FF0EAB8(v16);
    sub_21FF9E438((uint64_t)v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  else
  {
    sub_21FF103AC((uint64_t)v23, &qword_25558E0E0);
  }
}

uint64_t sub_21FFBC9E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 *v28;
  __int128 v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;

  v58 = a4;
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591998);
  v46 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v45 = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555919A8);
  MEMORY[0x24BDAC7A8](v49);
  v50 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558ED48);
  v48 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v47 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591988);
  MEMORY[0x24BDAC7A8](v57);
  v51 = (char *)v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
  v56 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EB8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555905F0);
  v54 = *(_QWORD *)(v17 - 8);
  v55 = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v42 - v21;
  v24 = _s24PlaylistFolderDetailViewVMa(0, a2, a3, v23);
  __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  sub_21FFC4CC4();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v11))
  {
    sub_21FF103AC((uint64_t)v16, &qword_255591EB8);
LABEL_9:
    v39 = 1;
    v40 = v58;
    return __swift_storeEnumTagSinglePayload(v40, v39, 1, v57);
  }
  v43 = v24;
  v42[0] = a2;
  v44 = a1;
  v42[1] = a3;
  v25 = v56;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v13, v16, v11);
  sub_21FF103AC((uint64_t)v16, &qword_255591EB8);
  sub_21FFC50FC();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v11);
  v27 = v54;
  v26 = v55;
  (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v22, v20, v55);
  if (!sub_21FF67CE8())
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v26);
    goto LABEL_9;
  }
  v28 = (__int128 *)(v44 + *(int *)(v43 + 52));
  v29 = *v28;
  v30 = *((_QWORD *)v28 + 2);
  v59 = v29;
  v60 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255591968);
  sub_21FFC4CC4();
  v32 = v61;
  v31 = v62;
  v33 = swift_bridgeObjectRelease();
  v34 = HIBYTE(v31) & 0xF;
  if ((v31 & 0x2000000000000000) == 0)
    v34 = v32 & 0xFFFFFFFFFFFFLL;
  if (v34)
  {
    v35 = v47;
    sub_21FFC45A4();
    v36 = v48;
    v37 = v52;
    (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v50, v35, v52);
  }
  else
  {
    MEMORY[0x24BDAC7A8](v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555919B0);
    sub_21FFAE490(&qword_2555919B8, &qword_2555919B0);
    v35 = v45;
    sub_21FFC4598();
    v36 = v46;
    v37 = v53;
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v50, v35, v53);
  }
  swift_storeEnumTagMultiPayload();
  sub_21FFAE490(&qword_25558ED40, &qword_25558ED48);
  sub_21FFAE490(&qword_255591990, &qword_255591998);
  v38 = (uint64_t)v51;
  sub_21FFC44C0();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v26);
  v40 = v58;
  sub_21FF10380(v38, v58, &qword_255591988);
  v39 = 0;
  return __swift_storeEnumTagSinglePayload(v40, v39, 1, v57);
}

uint64_t sub_21FFBCF94@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;

  _s24PlaylistFolderDetailViewVMa(0, a1, a2, a3);
  sub_21FF2E0A8();
  swift_bridgeObjectRetain();
  result = sub_21FFC48EC();
  *(_QWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = v6;
  *(_BYTE *)(a4 + 16) = v7 & 1;
  *(_QWORD *)(a4 + 24) = v8;
  return result;
}

void sub_21FFBD010(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[14];

  v9[1] = a3;
  v5 = sub_21FFC4580();
  MEMORY[0x24BDAC7A8](v5);
  v9[0] = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555905F0);
  v7 = sub_21FFC5648();
  sub_21FF0F7EC(&qword_25558F3D8, (void (*)(uint64_t))MEMORY[0x24BE6AF30]);
  v9[9] = v7;
  v9[10] = a1;
  v9[11] = v8;
  v9[12] = a2;
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FFBD0C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  void (*v21)(_BYTE *, uint64_t);
  _BYTE v23[96];

  sub_21FFC419C();
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  swift_getTupleTypeMetadata2();
  v6 = sub_21FFC4EBC();
  sub_21FFAE490(&qword_255591F60, v4);
  v8 = v7;
  v9 = sub_21FF0F864();
  v10 = MEMORY[0x24BDDEE98];
  *(_QWORD *)(v5 - 120) = v3;
  *(_QWORD *)(v5 - 112) = v10;
  *(_QWORD *)(v5 - 104) = v6;
  *(_QWORD *)(v5 - 96) = v8;
  *(_QWORD *)(v5 - 88) = v9;
  v11 = sub_21FFC4DE4();
  v12 = sub_21FFC5AC8();
  *(_QWORD *)(v5 - 128) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v6);
  *(_QWORD *)(v5 - 136) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v11, v5 - 128);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF5578], v12, v5 - 136);
  v13 = sub_21FFC3F98();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = &v23[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v15);
  v19 = &v23[-v18];
  sub_21FFC4484();
  _s24PlaylistFolderDetailViewVMa(0, v2, v0, v20);
  *(_QWORD *)(v5 - 160) = v2;
  *(_QWORD *)(v5 - 152) = v0;
  *(_QWORD *)(v5 - 144) = v1;
  sub_21FF38FB0();
  sub_21FFC3F8C();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEB188], v13);
  sub_21FFB5D18((uint64_t)v17, v13, (uint64_t)v19);
  v21 = *(void (**)(_BYTE *, uint64_t))(v14 + 8);
  v21(v17, v13);
  sub_21FFB57EC((uint64_t)v19, v13, *(_QWORD *)(v5 - 184));
  return ((uint64_t (*)(_BYTE *, uint64_t))v21)(v19, v13);
}

void sub_21FFBD304(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v15 = a1;
  v16 = a5;
  v7 = _s24PlaylistFolderDetailViewVMa(0, a2, a3, a4);
  v12 = *(_QWORD *)(v7 - 8);
  v11[5] = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v11[6] = (char *)v11 - v8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555905F0);
  v9 = sub_21FFC5648();
  sub_21FF0F7EC(&qword_25558F3D8, (void (*)(uint64_t))MEMORY[0x24BE6AF30]);
  v17 = v9;
  v18 = a2;
  v13 = a2;
  v14 = a3;
  v19 = v10;
  v20 = a3;
  _s13ItemShelfCellVMa();
}

uint64_t sub_21FFBD3D4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  _BYTE v50[80];

  sub_21FFC419C();
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  swift_getTupleTypeMetadata2();
  v4 = sub_21FFC4EBC();
  sub_21FFAE490(&qword_255591F60, v0);
  v6 = v5;
  v7 = sub_21FF0F864();
  v8 = MEMORY[0x24BDDEE98];
  *(_QWORD *)(v3 - 128) = v1;
  *(_QWORD *)(v3 - 120) = v8;
  *(_QWORD *)(v3 - 176) = v4;
  *(_QWORD *)(v3 - 112) = v4;
  *(_QWORD *)(v3 - 104) = v6;
  *(_QWORD *)(v3 - 312) = v6;
  *(_QWORD *)(v3 - 96) = v7;
  v9 = sub_21FFC4DE4();
  *(_QWORD *)(v3 - 288) = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  *(_QWORD *)(v3 - 304) = &v50[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  *(_QWORD *)(v3 - 296) = &v50[-v12];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = &v50[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EB8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = &v50[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)(v3 - 232) = v1;
  *(_QWORD *)(v3 - 208) = *(_QWORD *)(v1 - 8);
  v21 = MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)(v3 - 216) = &v50[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = &v50[-v24];
  MEMORY[0x24BDAC7A8](v23);
  *(_QWORD *)(v3 - 224) = &v50[-v26];
  v27 = sub_21FFC5AC8();
  *(_QWORD *)(v3 - 192) = *(_QWORD *)(v27 - 8);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v30 = &v50[-((v29 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v28);
  *(_QWORD *)(v3 - 184) = &v50[-v31];
  *(_QWORD *)(v3 - 256) = v2;
  v32 = *(_QWORD *)(v3 - 200);
  __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  sub_21FFC4CC4();
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v13))
  {
    sub_21FF103AC((uint64_t)v20, &qword_255591EB8);
    __swift_storeEnumTagSinglePayload((uint64_t)v30, 1, 1, v9);
    v33 = *(_QWORD *)(v3 - 176);
    *(_QWORD *)(v3 - 136) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v33);
    MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v9, v3 - 136);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v14 + 16))(v16, v20, v13);
    sub_21FF103AC((uint64_t)v20, &qword_255591EB8);
    sub_21FFC50FC();
    (*(void (**)(_BYTE *, uint64_t))(v14 + 8))(v16, v13);
    v34 = *(_QWORD *)(v3 - 208);
    v36 = *(_QWORD *)(v3 - 232);
    v35 = *(_QWORD *)(v3 - 224);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v34 + 32))(v35, v25, v36);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v34 + 16))(*(_QWORD *)(v3 - 216), v35, v36);
    v37 = *(_QWORD *)(v3 - 264);
    v38 = *(_QWORD *)(v3 - 272);
    v39 = *(_QWORD *)(v3 - 256);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v38, v32, v39);
    v40 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
    v41 = swift_allocObject();
    v42 = *(_QWORD *)(v3 - 240);
    *(_QWORD *)(v41 + 16) = *(_QWORD *)(v3 - 248);
    *(_QWORD *)(v41 + 24) = v42;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v37 + 32))(v41 + v40, v38, v39);
    v33 = *(_QWORD *)(v3 - 176);
    v43 = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v33);
    sub_21FF0F7EC(qword_255591FB0, (void (*)(uint64_t))MEMORY[0x24BE6AF30]);
    v44 = *(_QWORD *)(v3 - 304);
    sub_21FFC4DD8();
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v3 - 208) + 8))(*(_QWORD *)(v3 - 224), v36);
    *(_QWORD *)(v3 - 160) = v43;
    MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v9, v3 - 160);
    v45 = *(_QWORD *)(v3 - 296);
    sub_21FFB5D18(v44, v9, v45);
    v46 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 288) + 8);
    v46(v44, v9);
    sub_21FFB57EC(v45, v9, (uint64_t)v30);
    v46(v45, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v9);
  }
  v47 = *(_QWORD *)(v3 - 184);
  sub_21FF47E70((uint64_t)v30, v47);
  v48 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 192) + 8);
  v48((uint64_t)v30, v27);
  *(_QWORD *)(v3 - 144) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v33);
  *(_QWORD *)(v3 - 152) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF4A08], v9, v3 - 144);
  MEMORY[0x2207DB4B4](MEMORY[0x24BDF5578], v27, v3 - 152);
  sub_21FFB57EC(v47, v27, *(_QWORD *)(v3 - 168));
  return v48(v47, v27);
}

void sub_21FFBD960(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  _QWORD v16[11];
  uint64_t v17;
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

  v16[2] = a3;
  v23 = a2;
  v16[5] = a1;
  v22 = a5;
  v20 = sub_21FFC4DC0();
  v18 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v16[9] = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558E188);
  MEMORY[0x24BDAC7A8](v17);
  v16[10] = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558ECE8);
  v9 = MEMORY[0x24BDAC7A8](v21);
  v19 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v16[8] = (char *)v16 - v11;
  v12 = sub_21FFC5648();
  MEMORY[0x24BDAC7A8](v12);
  v16[1] = (char *)v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FF0F7EC(&qword_25558F3D8, v14);
  v24 = v12;
  v25 = a3;
  v26 = v15;
  v27 = a4;
  _s13ItemShelfCellVMa();
}

void sub_21FFBDB14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  *(_QWORD *)(v13 - 336) = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v14 = sub_21FFC419C();
  *(_QWORD *)(v13 - 320) = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v15 = sub_21FFC419C();
  *(_QWORD *)(v13 - 312) = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v13 - 232) = (char *)&a9 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  *(_QWORD *)(v13 - 344) = (char *)&a9 - v18;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 16))(v11, *(_QWORD *)(v13 - 328), v12);
  v20 = _s24PlaylistFolderDetailViewVMa(0, *(_QWORD *)(v13 - 352), v10, v19);
  *(_QWORD *)(v13 - 328) = v20;
  v21 = *(_QWORD *)(v13 - 224) + *(int *)(v20 + 60);
  v23 = *(_QWORD *)(v21 + 8);
  v22 = *(_QWORD *)(v21 + 16);
  v24 = *(_QWORD *)(v21 + 24);
  *(_BYTE *)(v13 - 152) = *(_BYTE *)v21;
  *(_QWORD *)(v13 - 144) = v23;
  *(_QWORD *)(v13 - 136) = v22;
  *(_QWORD *)(v13 - 128) = v24;
  swift_bridgeObjectRetain();
  sub_21FF0E594(v24);
  sub_21FF436E4();
  sub_21FF91140();
}

uint64_t sub_21FFBDCC4()
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
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
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
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_21FFC4760();
  v6 = MEMORY[0x2207DB4B4](&unk_21FFCA590, v0);
  sub_21FFC4B50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 336) + 8))(v1, v0);
  sub_21FFC476C();
  v7 = MEMORY[0x24BDECC60];
  *(_QWORD *)(v5 - 168) = v6;
  *(_QWORD *)(v5 - 160) = v7;
  v8 = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v4, v5 - 168);
  v9 = *(_QWORD *)(v5 - 232);
  sub_21FFC4B50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 320) + 8))(v3, v4);
  *(_QWORD *)(v5 - 184) = v8;
  *(_QWORD *)(v5 - 176) = v7;
  *(_QWORD *)(v5 - 320) = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v2, v5 - 184);
  v10 = *(_QWORD *)(v5 - 344);
  v11 = v9;
  sub_21FFB5D18(v9, v2, v10);
  v12 = *(_QWORD *)(v5 - 312);
  v13 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  v13(v11, v2);
  v14 = *(_QWORD *)(v5 - 296);
  sub_21FFC4DB4();
  LOBYTE(v11) = sub_21FFC4760();
  sub_21FFC3F80();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = *(_QWORD *)(v5 - 272);
  v24 = *(_QWORD *)(v5 - 288);
  v25 = *(_QWORD *)(v5 - 256);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v24, v14, v25);
  v26 = *(_QWORD *)(v5 - 280);
  v27 = v24 + *(int *)(v26 + 36);
  *(_BYTE *)v27 = v11;
  *(_QWORD *)(v27 + 8) = v16;
  *(_QWORD *)(v27 + 16) = v18;
  *(_QWORD *)(v27 + 24) = v20;
  *(_QWORD *)(v27 + 32) = v22;
  *(_BYTE *)(v27 + 40) = 0;
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v14, v25);
  v28 = *(_QWORD *)(v5 - 304);
  sub_21FF10380(v24, v28, &qword_25558E188);
  __swift_storeEnumTagSinglePayload(v28, 0, 1, v26);
  v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  v30 = *(_QWORD *)(v5 - 232);
  v29(v30, v10, v2);
  *(_QWORD *)(v5 - 152) = v30;
  v31 = *(_QWORD *)(v5 - 264);
  sub_21FF0FF4C(v28, v31, &qword_25558ECE8);
  *(_QWORD *)(v5 - 144) = v31;
  v32 = *(_QWORD *)(v5 - 248);
  *(_QWORD *)(v5 - 200) = v2;
  *(_QWORD *)(v5 - 192) = v32;
  *(_QWORD *)(v5 - 216) = *(_QWORD *)(v5 - 320);
  *(_QWORD *)(v5 - 208) = sub_21FFAEB94(&qword_25558EE38, &qword_25558ECE8);
  sub_21FF51C7C(v5 - 152, 2, v5 - 200);
  sub_21FF103AC(v28, &qword_25558ECE8);
  v13(v10, v2);
  sub_21FF103AC(v31, &qword_25558ECE8);
  return ((uint64_t (*)(uint64_t, uint64_t))v13)(v30, v2);
}

uint64_t sub_21FFBDF88(_QWORD *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  return sub_21FFC3CF8();
}

uint64_t sub_21FFBDFCC()
{
  sub_21FFC5CF0();
  sub_21FF1C978();
  return sub_21FFC5D20();
}

BOOL sub_21FFBE048(double *a1, double *a2)
{
  return sub_21FF1C954(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t sub_21FFBE060()
{
  return sub_21FFBDFCC();
}

uint64_t sub_21FFBE074()
{
  return sub_21FF1C978();
}

uint64_t sub_21FFBE088()
{
  sub_21FFC5CF0();
  sub_21FF1C978();
  return sub_21FFC5D20();
}

uint64_t sub_21FFBE0D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 24);
  OUTLINED_FUNCTION_16_12(0, v6, v7, a4);
  v9 = v4 + v8;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_21FF0F904;
  return sub_21FFBBA20(v9, v6, v7);
}

uint64_t sub_21FFBE14C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21FFBE168((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21FFBBC9C, a2, a3, a4);
}

uint64_t sub_21FFBE15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21FFBE168((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_21FFBC898, a2, a3, a4);
}

uint64_t sub_21FFBE168(uint64_t (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  OUTLINED_FUNCTION_16_12(0, v5, v6, a4);
  return a1(v4 + v7, v5, v6);
}

uint64_t sub_21FFBE1B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_21FFBC9E0(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_21FFBE1C4@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21FFBCF94(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a1, a2);
}

uint64_t sub_21FFBE1D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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

  v6 = _s24PlaylistFolderDetailViewVMa(0, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  swift_unknownObjectRelease();
  v8 = v4 + ((v7 + 48) & ~v7);
  v9 = OUTLINED_FUNCTION_17_7();
  OUTLINED_FUNCTION_34(v9);
  OUTLINED_FUNCTION_35_6();
  sub_21FF0EAB8(*(_QWORD *)(v5 + 24));
  v10 = v8 + *(int *)(v6 + 44);
  if ((*(_BYTE *)(v10 + 40) & 1) != 0)
  {
    if (*(_QWORD *)(v10 + 24))
      __swift_destroy_boxed_opaque_existential_1(v10);
  }
  else
  {
    swift_release();
  }
  v11 = v8 + *(int *)(v6 + 48);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
  if (!OUTLINED_FUNCTION_22_3(v12))
    OUTLINED_FUNCTION_12_10(*(_QWORD *)(v5 - 8));
  __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  OUTLINED_FUNCTION_66_2();
  OUTLINED_FUNCTION_36_6();
  swift_release();
  OUTLINED_FUNCTION_21_7();
  sub_21FF0EAB8(*(_QWORD *)(v11 + 24));
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_12();
}

uint64_t sub_21FFBE2CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v7 = v4[4];
  v8 = v4[5];
  v9 = *(unsigned __int8 *)(*(_QWORD *)(_s24PlaylistFolderDetailViewVMa(0, v7, v8, a4) - 8) + 80);
  v10 = v4[2];
  v11 = v4[3];
  v12 = (uint64_t)v4 + ((v9 + 48) & ~v9);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v13;
  *v13 = v5;
  v13[1] = sub_21FF10994;
  return sub_21FFBBF08(a1, v10, v11, v12, v7, v8);
}

void sub_21FFBE370(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_21FFBD010(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

void sub_21FFBE37C(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  sub_21FFBD304(v2[4], v2[2], v2[3], a1, a2);
}

uint64_t objectdestroy_2Tm_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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

  v6 = _s24PlaylistFolderDetailViewVMa(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  v9 = OUTLINED_FUNCTION_17_7();
  OUTLINED_FUNCTION_34(v9);
  OUTLINED_FUNCTION_35_6();
  sub_21FF0EAB8(*(_QWORD *)(v5 + 24));
  v10 = v8 + *(int *)(v6 + 44);
  if ((*(_BYTE *)(v10 + 40) & 1) != 0)
  {
    if (*(_QWORD *)(v10 + 24))
      __swift_destroy_boxed_opaque_existential_1(v10);
  }
  else
  {
    swift_release();
  }
  v11 = v8 + *(int *)(v6 + 48);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255591EC0);
  if (!OUTLINED_FUNCTION_22_3(v12))
    OUTLINED_FUNCTION_12_10(*(_QWORD *)(v5 - 8));
  __swift_instantiateConcreteTypeFromMangledName(qword_255591ED0);
  OUTLINED_FUNCTION_66_2();
  OUTLINED_FUNCTION_36_6();
  swift_release();
  OUTLINED_FUNCTION_21_7();
  sub_21FF0EAB8(*(_QWORD *)(v11 + 24));
  OUTLINED_FUNCTION_13_7();
  OUTLINED_FUNCTION_13_7();
  return OUTLINED_FUNCTION_12();
}

void sub_21FFBE480(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  OUTLINED_FUNCTION_16_12(0, v6, v7, a2);
  sub_21FFBD960(a1, v3 + v8, v6, v7, a3);
}

uint64_t _s24PlaylistFolderDetailViewV9ConstantsVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s24PlaylistFolderDetailViewV9ConstantsVMn);
}

void sub_21FFBE4E4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555905F0);
  sub_21FFC5648();
  sub_21FF0F7EC(&qword_25558F3D8, (void (*)(uint64_t))MEMORY[0x24BE6AF30]);
  OUTLINED_FUNCTION_39_5();
  _s13ItemShelfCellVMa();
}

void sub_21FFBE554()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_20_4();
  OUTLINED_FUNCTION_20_4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558ECE8);
  OUTLINED_FUNCTION_15();
  v2 = OUTLINED_FUNCTION_4();
  sub_21FFAE490(&qword_255591F60, v0);
  sub_21FF0F864();
  OUTLINED_FUNCTION_39_5();
  sub_21FFC4DE4();
  sub_21FFC5AC8();
  *(_QWORD *)(v1 - 88) = MEMORY[0x2207DB4B4](MEMORY[0x24BDF5428], v2);
  OUTLINED_FUNCTION_49();
}

void sub_21FFBE608(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  OUTLINED_FUNCTION_75();
}

void sub_21FFBE61C()
{
  OUTLINED_FUNCTION_32_2();
  OUTLINED_FUNCTION_49();
}

void sub_21FFBE630()
{
  uint64_t v0;

  v0 = sub_21FFC3FA4();
  MEMORY[0x2207DB4B4](MEMORY[0x24BDEB238], v0);
  sub_21FF2E0A8();
  OUTLINED_FUNCTION_39_5();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFBE680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = _s18NavigationBarStyleVMa(255, v5, v4, a4);
  sub_21FFC419C();
  sub_21FFC40E8();
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25558E0B0);
  _s10DoneButtonVMa(255, v5, v4, v7);
  OUTLINED_FUNCTION_58_0();
  MEMORY[0x2207DB4B4](&unk_21FFCAE80, v6);
  OUTLINED_FUNCTION_47_5();
}

void sub_21FFBE72C()
{
  sub_21FF0F7EC(&qword_25558E0B8, (void (*)(uint64_t))MEMORY[0x24BDEC4E0]);
  OUTLINED_FUNCTION_75();
}

void sub_21FFBE75C()
{
  uint64_t v0;

  sub_21FFAE490(&qword_25558E0C0, &qword_25558E0B0);
  MEMORY[0x2207DB4B4](&unk_21FFC8488, v0);
  OUTLINED_FUNCTION_39_5();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFBE7B4()
{
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_39_5();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFBE7FC()
{
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_2_21();
}

void sub_21FFBE828()
{
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_2_21();
}

void sub_21FFBE850()
{
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_2_21();
}

void sub_21FFBE878()
{
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_2_21();
}

void sub_21FFBE8AC()
{
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_2_21();
}

void sub_21FFBE8D8()
{
  sub_21FFC419C();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255591950);
  sub_21FFC419C();
  OUTLINED_FUNCTION_58_0();
  sub_21FF0F948();
  OUTLINED_FUNCTION_75();
}

void sub_21FFBE93C()
{
  uint64_t *v0;

  sub_21FFAE490(&qword_2555919A0, v0);
  OUTLINED_FUNCTION_63();
}

void sub_21FFBE988()
{
  JUMPOUT(0x2207DB4B4);
}

void OUTLINED_FUNCTION_1_28()
{
  JUMPOUT(0x2207DB460);
}

void OUTLINED_FUNCTION_2_21()
{
  JUMPOUT(0x2207DB460);
}

uint64_t OUTLINED_FUNCTION_12_10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_14_12()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_16_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _s24PlaylistFolderDetailViewVMa(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_17_7()
{
  return sub_21FFC5660();
}

uint64_t OUTLINED_FUNCTION_20_9@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 256) + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_21_7()
{
  uint64_t v0;
  uint64_t v1;

  sub_21FF0EAB8(*(_QWORD *)(v1 + *(int *)(v0 + 56)));
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_22_3(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_25_7()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_29_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_30_4@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 - 256))();
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return sub_21FFC3F98();
}

uint64_t OUTLINED_FUNCTION_35_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_36_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_37_3@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 256));
}

uint64_t OUTLINED_FUNCTION_39_5()
{
  return 255;
}

uint64_t OUTLINED_FUNCTION_41_2(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return sub_21FFB76CC(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_45_6()
{
  return sub_21FFC5930();
}

void OUTLINED_FUNCTION_47_5()
{
  JUMPOUT(0x2207DB4B4);
}

uint64_t OUTLINED_FUNCTION_52_4()
{
  return sub_21FFC419C();
}

uint64_t sub_21FFBEB24@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void (*v20)(char *, uint64_t);
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;

  v23 = a1;
  v1 = sub_21FFC5558();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v22 - v6;
  v8 = sub_21FFC5564();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v22 - v13;
  OUTLINED_FUNCTION_4_11((uint64_t)&v22 - v13);
  result = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v14, v8);
  if ((_DWORD)result == *MEMORY[0x24BDFC220])
  {
    result = OUTLINED_FUNCTION_0_27();
    v16 = 0;
    v17 = *(_QWORD *)v14;
LABEL_11:
    v21 = v23;
    *v23 = v17;
    *((_BYTE *)v21 + 8) = v16;
    return result;
  }
  if ((_DWORD)result == *MEMORY[0x24BDFC210])
  {
    OUTLINED_FUNCTION_0_27();
    v17 = *(_QWORD *)v14;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6880);
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v7, &v14[*(int *)(v18 + 48)], v1);
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
    v19 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v5, v1);
    v20 = *(void (**)(char *, uint64_t))(v2 + 8);
    if (v19 != *MEMORY[0x24BDFC1F0])
      v20(v5, v1);
    result = ((uint64_t (*)(char *, uint64_t))v20)(v7, v1);
    v16 = 1;
    goto LABEL_11;
  }
  if ((_DWORD)result == *MEMORY[0x24BDFC228])
  {
    result = OUTLINED_FUNCTION_0_27();
    v17 = *(_QWORD *)v14;
    v16 = 2;
    goto LABEL_11;
  }
  if ((_DWORD)result == *MEMORY[0x24BDFC218])
  {
    v17 = 0;
    v16 = 3;
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_4_11((uint64_t)v12);
  v24 = 0;
  v25 = 0xE000000000000000;
  sub_21FFC5B4C();
  sub_21FFC57F8();
  sub_21FFC5BB8();
  sub_21FFC57F8();
  result = sub_21FFC5BD0();
  __break(1u);
  return result;
}

uint64_t static Artwork.LoadingStatus.== infix(_:_:)(uint64_t a1)
{
  return ((uint64_t (*)(void))((char *)sub_21FFBEE10 + 4 * byte_21FFCC9A0[*(unsigned __int8 *)(a1 + 8)]))();
}

BOOL sub_21FFBEE10@<W0>(double a1@<X8>)
{
  double v1;
  int v2;

  return !v2 && v1 == a1;
}

void Artwork.LoadingStatus.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_21FFBEE94()
{
  sub_21FFC5CFC();
  return sub_21FFC5D14();
}

uint64_t Artwork.LoadingStatus.hashValue.getter()
{
  sub_21FFC5CF0();
  Artwork.LoadingStatus.hash(into:)();
  return sub_21FFC5D20();
}

uint64_t sub_21FFBEF38()
{
  sub_21FFC5CF0();
  Artwork.LoadingStatus.hash(into:)();
  return sub_21FFC5D20();
}

void Artwork.LoadingStatus.description.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_21FFBEFCC()
{
  uint64_t v1;

  OUTLINED_FUNCTION_1_29();
  sub_21FFC5B4C();
  OUTLINED_FUNCTION_3_14();
  sub_21FFC57F8();
  OUTLINED_FUNCTION_2_22();
  sub_21FFC57F8();
  return v1;
}

void Artwork.LoadingStatus.debugDescription.getter()
{
  Artwork.LoadingStatus.description.getter();
}

unint64_t sub_21FFBF118()
{
  unint64_t result;

  result = qword_255592038[0];
  if (!qword_255592038[0])
  {
    result = MEMORY[0x2207DB4B4](&protocol conformance descriptor for Artwork.LoadingStatus, &type metadata for Artwork.LoadingStatus);
    atomic_store(result, qword_255592038);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s13LoadingStatusOwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 3)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t _s13LoadingStatusOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_21FFBF1F4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_21FFBF20C(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for Artwork.LoadingStatus()
{
  return &type metadata for Artwork.LoadingStatus;
}

uint64_t OUTLINED_FUNCTION_0_27()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2_22()
{
  return sub_21FFC5990();
}

uint64_t OUTLINED_FUNCTION_4_11(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v3, v2);
}

void sub_21FFBF284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_21FFBF32C(a1, a3, a5, a4);
}

uint64_t sub_21FFBF2C0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];
  char v11;
  uint64_t v12;

  v10[0] = a1;
  v10[1] = a2;
  v11 = a3 & 1;
  v12 = a4;
  v8 = _s20DismissAlertModifierVMa(0, v6, v4, a4);
  MEMORY[0x2207D9E4C](v10, v7, v8, v5);
  swift_release();
  return swift_release();
}

void sub_21FFBF32C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _s9ViewModelCMa(0, a2, a3, a4);
  OUTLINED_FUNCTION_20();
}

uint64_t sub_21FFBF350()
{
  uint64_t v0;

  v0 = sub_21FFC4268();
  sub_21FF0725C();
  return v0;
}

uint64_t _s20DismissAlertModifierVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s20DismissAlertModifierVMn);
}

uint64_t sub_21FFBF394()
{
  swift_release();
  return swift_release();
}

uint64_t sub_21FFBF3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_21FFBF400(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_21FFBF46C(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t sub_21FFBF4C0(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 32))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21FFBF514(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_21FFBF568()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21FFBF59C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _s20DismissAlertModifierVMa(255, a6, a7, a4);
  OUTLINED_FUNCTION_20();
}

void sub_21FFBF60C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_21FFC458C();
  v3 = sub_21FFC5918();
  v4 = MEMORY[0x2207DB4B4](MEMORY[0x24BDEFB78], v2);
  *(_QWORD *)(v1 - 176) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 8);
  v5 = MEMORY[0x2207DB4B4](MEMORY[0x24BEE12C0], v3, v1 - 176);
  *(_QWORD *)(v1 - 168) = v2;
  *(_QWORD *)(v1 - 160) = v3;
  *(_QWORD *)(v1 - 152) = v4;
  *(_QWORD *)(v1 - 144) = v5;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFBF688(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  *(_QWORD *)(v5 - 480) = v4;
  *(_QWORD *)(v5 - 168) = v4;
  *(_QWORD *)(v5 - 160) = v3;
  *(_QWORD *)(v5 - 472) = v3;
  *(_QWORD *)(v5 - 456) = v1;
  *(_QWORD *)(v5 - 152) = v1;
  *(_QWORD *)(v5 - 144) = v2;
  *(_QWORD *)(v5 - 464) = v2;
  v7 = OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v5 - 168) = a1;
  *(_QWORD *)(v5 - 160) = v7;
  *(_QWORD *)(v5 - 344) = v7;
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFBF6E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t);
  unint64_t v62;

  v15 = sub_21FFC419C();
  *(_QWORD *)(v13 - 528) = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v13 - 512) = (char *)&a9 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  *(_QWORD *)(v13 - 520) = (char *)&a9 - v18;
  v19 = swift_checkMetadataState();
  *(_QWORD *)(v13 - 408) = v19;
  OUTLINED_FUNCTION_0_21(*(_QWORD *)(v19 - 8));
  v21 = MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v13 - 496) = (char *)&a9 - v22;
  *(_QWORD *)(v13 - 440) = *(_QWORD *)(a1 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&a9 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  *(_QWORD *)(v13 - 352) = (char *)&a9 - v26;
  *(_QWORD *)(v13 - 424) = a1;
  *(_QWORD *)(v13 - 384) = v15;
  v27 = sub_21FFC44CC();
  *(_QWORD *)(v13 - 392) = v27;
  OUTLINED_FUNCTION_0_21(*(_QWORD *)(v27 - 8));
  MEMORY[0x24BDAC7A8](v28);
  *(_QWORD *)(v13 - 416) = (char *)&a9 - v29;
  *(_DWORD *)(v13 - 356) = v9 & 1;
  *(_BYTE *)(v13 - 168) = v9;
  *(_QWORD *)(v13 - 432) = v12;
  *(_QWORD *)(v13 - 160) = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558E108);
  sub_21FFC4CC4();
  LODWORD(v15) = *(unsigned __int8 *)(v13 - 256);
  v30 = v10;
  v32 = _s9ViewModelCMa(0, v10, v11, v31);
  v33 = *(_QWORD *)(v13 - 504);
  sub_21FFC4244();
  v34 = sub_21FF6AAB8();
  OUTLINED_FUNCTION_24_1();
  if ((_DWORD)v15 == 1)
  {
    *(_QWORD *)(v13 - 168) = v34;
    v35 = (_QWORD *)OUTLINED_FUNCTION_2_23();
    v35[2] = v30;
    v35[3] = v11;
    OUTLINED_FUNCTION_6_12((uint64_t)v35);
    v35[7] = *(_QWORD *)(v36 - 256);
    swift_retain();
    OUTLINED_FUNCTION_10_13();
    OUTLINED_FUNCTION_8_7();
    OUTLINED_FUNCTION_4_12();
    v37 = *(_QWORD *)(v13 - 496);
    OUTLINED_FUNCTION_0_28();
    OUTLINED_FUNCTION_40_1();
    swift_bridgeObjectRelease();
    v38 = *(_QWORD *)(v13 - 408);
    v39 = *(_QWORD *)(v13 - 344);
    sub_21FFC4AA8();
    OUTLINED_FUNCTION_5_7();
    v40(v37, v38);
    *(_QWORD *)(v13 - 168) = v38;
    *(_QWORD *)(v13 - 160) = v39;
    v41 = OUTLINED_FUNCTION_58_0();
    v42 = *(_QWORD *)(v13 - 352);
    v43 = *(_QWORD *)(v13 - 424);
    sub_21FFB5D18((uint64_t)v25, v43, v42);
    OUTLINED_FUNCTION_9_16();
    sub_21FFB57EC(v42, v43, (uint64_t)v25);
    v44 = sub_21FF0FC4C();
    *(_QWORD *)(v13 - 336) = v41;
    *(_QWORD *)(v13 - 328) = v44;
    OUTLINED_FUNCTION_75();
  }
  *(_QWORD *)(v13 - 168) = v34;
  v45 = OUTLINED_FUNCTION_2_23();
  *(_QWORD *)(v13 - 544) = v30;
  *(_QWORD *)(v45 + 16) = v30;
  *(_QWORD *)(v45 + 24) = v11;
  *(_QWORD *)(v13 - 536) = v11;
  v46 = OUTLINED_FUNCTION_6_12(v45);
  v48 = *(_QWORD *)(v47 - 256);
  *(_QWORD *)(v46 + 56) = v48;
  OUTLINED_FUNCTION_10_13();
  swift_retain();
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_4_12();
  v49 = *(_QWORD *)(v13 - 496);
  OUTLINED_FUNCTION_0_28();
  OUTLINED_FUNCTION_40_1();
  swift_bridgeObjectRelease();
  v50 = *(_QWORD *)(v13 - 408);
  sub_21FFC4AA8();
  OUTLINED_FUNCTION_5_7();
  v51(v49, v50);
  v52 = sub_21FFC4250();
  MEMORY[0x24BDAC7A8](v52);
  v53 = *(_QWORD *)(v13 - 544);
  v54 = *(_QWORD *)(v13 - 536);
  *(&a9 - 2) = v53;
  *(&a9 - 1) = v54;
  swift_getKeyPath();
  sub_21FFC425C();
  OUTLINED_FUNCTION_24_1();
  swift_release();
  memcpy((void *)(v13 - 168), (const void *)(v13 - 256), 0x50uLL);
  v55 = OUTLINED_FUNCTION_2_23();
  *(_QWORD *)(v55 + 16) = v53;
  *(_QWORD *)(v55 + 24) = v54;
  v56 = *(_QWORD *)(v13 - 344);
  v57 = *(_QWORD *)(v13 - 368);
  *(_QWORD *)(v55 + 32) = v33;
  *(_QWORD *)(v55 + 40) = v57;
  *(_BYTE *)(v55 + 48) = *(_DWORD *)(v13 - 356);
  *(_QWORD *)(v55 + 56) = v48;
  swift_retain();
  OUTLINED_FUNCTION_10_13();
  *(_QWORD *)(v13 - 272) = v50;
  *(_QWORD *)(v13 - 264) = v56;
  v58 = OUTLINED_FUNCTION_58_0();
  v59 = *(_QWORD *)(v13 - 424);
  v60 = *(_QWORD *)(v13 - 352);
  sub_21FF9FE74((uint64_t *)(v13 - 168), (uint64_t)sub_21FFC00D0, v55, v59, v58);
  OUTLINED_FUNCTION_40_1();
  sub_21FF0FB78(v13 - 168);
  OUTLINED_FUNCTION_5_7();
  v61(v60, v59);
  v62 = sub_21FF0FC4C();
  *(_QWORD *)(v13 - 288) = v58;
  *(_QWORD *)(v13 - 280) = v62;
  OUTLINED_FUNCTION_75();
}

void sub_21FFBFC78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 - 520);
  sub_21FFB5D18(v1, v0, v3);
  OUTLINED_FUNCTION_16_13(v1);
  sub_21FFB57EC(v3, v0, v1);
  sub_21FF51DA8();
  OUTLINED_FUNCTION_16_13(v1);
  OUTLINED_FUNCTION_16_13(v3);
  JUMPOUT(0x21FFBFCF4);
}

void sub_21FFBFD30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 320) = v1;
  *(_QWORD *)(v2 - 312) = a1;
  OUTLINED_FUNCTION_20();
}

uint64_t sub_21FFBFD58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  sub_21FFB57EC(v1, v0, *(_QWORD *)(v2 - 376));
  OUTLINED_FUNCTION_5_7();
  return v3(v1, v0);
}

void sub_21FFBFDA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  v6 = _s9ViewModelCMa(0, a5, a6, a4);
  sub_21FFC4244();
  sub_21FF6AAB8();
  OUTLINED_FUNCTION_24_1();
  sub_21FFC5918();
  OUTLINED_FUNCTION_75();
}

uint64_t sub_21FFBFE38()
{
  sub_21FFC5A08();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25558E108);
  return sub_21FFC4CD0();
}

uint64_t *sub_21FFBFE98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t *result;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[8];
  uint64_t v44;
  _OWORD v45[5];

  v6 = _s9ViewModelCMa(0, a5, a6, a4);
  sub_21FFC4244();
  sub_21FF6B440(&v36);
  v7 = v36;
  v17 = v37;
  v18 = v38;
  v19 = v39;
  v20 = v40;
  v21 = v41;
  v22 = v42;
  swift_release();
  if (qword_25558DF10 != -1)
    swift_once();
  v45[0] = xmmword_2555982E0;
  v45[1] = *(_OWORD *)&qword_2555982F0;
  v45[2] = xmmword_255598300;
  v45[3] = *(_OWORD *)&qword_255598310;
  v8 = xmmword_2555982E0;
  v9 = qword_2555982F0;
  v10 = qword_2555982F8;
  v11 = xmmword_255598300;
  v12 = qword_255598310;
  v13 = qword_255598318;
  sub_21FFC0138((uint64_t)&v36, (uint64_t)v43);
  if (v44)
  {
    v23 = v7;
    v24 = v17;
    v25 = v18;
    v26 = v19;
    v27 = v20;
    v28 = v21;
    v29 = v22;
    v14 = sub_21FF944D4(&v23, v45);
    result = sub_21FFC0180((uint64_t *)&v36);
    if ((v14 & 1) != 0)
    {
      sub_21FFC4244();
      v16 = sub_21FF0E140();
      sub_21FF6DFBC(v16 & 1);
      return (uint64_t *)swift_release();
    }
  }
  else
  {
    v23 = v7;
    v24 = v17;
    v25 = v18;
    v26 = v19;
    v27 = v20;
    v28 = v21;
    v29 = v22;
    v30 = v8;
    v31 = v9;
    v32 = v10;
    v33 = v11;
    v34 = v12;
    v35 = v13;
    sub_21FF100CC((uint64_t)v45);
    return sub_21FF10120((uint64_t *)&v23);
  }
  return result;
}

void sub_21FFC008C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_21FFBF59C(a1, *(_QWORD *)v2, *(_QWORD *)(v2 + 8), *(unsigned __int8 *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t sub_21FFC00B4()
{
  return 16;
}

__n128 sub_21FFC00C0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t *sub_21FFC00D0()
{
  uint64_t v0;

  return sub_21FFBFE98(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(unsigned __int8 *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t objectdestroyTm_10()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_21FFC0114()
{
  uint64_t v0;

  sub_21FFBFDA4(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(unsigned __int8 *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21FFC0138(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25558DFC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_21FFC0180(uint64_t *a1)
{
  sub_21FF0FBFC(*a1, a1[1]);
  return a1;
}

void sub_21FFC01B8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _s20DismissAlertModifierVMa(255, *a1, a1[1], a4);
  OUTLINED_FUNCTION_49();
}

void sub_21FFC01F4()
{
  sub_21FFC458C();
  sub_21FFC5918();
  OUTLINED_FUNCTION_49();
}

void sub_21FFC0224()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 56) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 8);
  OUTLINED_FUNCTION_20();
}

void sub_21FFC0244()
{
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFC0268()
{
  OUTLINED_FUNCTION_58_0();
  OUTLINED_FUNCTION_7_1();
}

void sub_21FFC02A0()
{
  sub_21FFC419C();
  sub_21FFC44CC();
  OUTLINED_FUNCTION_58_0();
  sub_21FF0FC4C();
  OUTLINED_FUNCTION_75();
}

void sub_21FFC02FC()
{
  OUTLINED_FUNCTION_49();
}

uint64_t OUTLINED_FUNCTION_0_28()
{
  return sub_21FFC4B98();
}

uint64_t OUTLINED_FUNCTION_2_23()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_12()
{
  return swift_checkMetadataState();
}

uint64_t OUTLINED_FUNCTION_6_12(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(result + 32) = v2;
  *(_QWORD *)(result + 40) = v1;
  *(_BYTE *)(result + 48) = *(_DWORD *)(v3 - 356);
  return result;
}

uint64_t OUTLINED_FUNCTION_8_7()
{
  return swift_checkMetadataState();
}

uint64_t OUTLINED_FUNCTION_9_16()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_10_13()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_16_13(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

void ArtworkImage.init(_:width:height:)()
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6860);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v1);
  v2 = OUTLINED_FUNCTION_5_14();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v9 - v7;
  OUTLINED_FUNCTION_12_11();
  if (__swift_getEnumTagSinglePayload(v0, 1, v2) == 1)
  {
    sub_21FFC55DC();
    sub_21FF5E9E8(v0);
  }
  else
  {
    OUTLINED_FUNCTION_171((uint64_t)v8, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
  }
  OUTLINED_FUNCTION_171((uint64_t)v6, (uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  sub_21FFC3E3C();
  OUTLINED_FUNCTION_11_9();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  OUTLINED_FUNCTION_6_13();
}

uint64_t ArtworkImage.artworkIdealAspectRatio(_:contentMode:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6968);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FFC3E30();
  OUTLINED_FUNCTION_4_13();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v0);
  v7 = sub_21FFC3D7C();
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v7);
  return OUTLINED_FUNCTION_9_17();
}

void ArtworkImage.init(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6860);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21FFC5630();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FF49B88(a1, (uint64_t)v4);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    sub_21FFC55DC();
    sub_21FF5E9E8((uint64_t)v4);
  }
  else
  {
    OUTLINED_FUNCTION_171((uint64_t)v8, (uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32));
  }
  sub_21FFC3DB8();
  OUTLINED_FUNCTION_11_9();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  OUTLINED_FUNCTION_43_2();
}

void ArtworkImage.init(_:width:)(uint64_t a1, double a2)
{
  sub_21FFC06E0(a2, a1, MEMORY[0x24BDFC150]);
}

void ArtworkImage.init(_:height:)(uint64_t a1, double a2)
{
  sub_21FFC06E0(a2, a1, MEMORY[0x24BDFC158]);
}

void sub_21FFC06E0(double a1, uint64_t a2, void (*a3)(char *, double))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6860);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v6);
  v7 = OUTLINED_FUNCTION_5_14();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v14 - v12;
  OUTLINED_FUNCTION_12_11();
  if (__swift_getEnumTagSinglePayload(v3, 1, v7) == 1)
  {
    sub_21FFC55DC();
    sub_21FF5E9E8(v3);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v13, v3, v7);
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  a3(v11, a1);
  OUTLINED_FUNCTION_11_9();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  OUTLINED_FUNCTION_6_13();
}

void ArtworkImage.artworkCropStyle(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6968);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0_29();
  OUTLINED_FUNCTION_4_13();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3_15(v3, v5);
  sub_21FFC55AC();
  v4 = OUTLINED_FUNCTION_8_8();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v4);
  OUTLINED_FUNCTION_13_14();
  OUTLINED_FUNCTION_7_16();
  sub_21FFC3DC4();
  OUTLINED_FUNCTION_43_2();
}

void ArtworkImage.artworkImageFormat(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6968);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0_29();
  OUTLINED_FUNCTION_4_13();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3_15(v3, v5);
  sub_21FFC5588();
  v4 = OUTLINED_FUNCTION_8_8();
  __swift_storeEnumTagSinglePayload(v0, 1, 1, v4);
  OUTLINED_FUNCTION_7_16();
  sub_21FFC3DC4();
  OUTLINED_FUNCTION_43_2();
}

void ArtworkImage.artworkBackgroundColor(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6968);
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_29();
  OUTLINED_FUNCTION_4_13();
  MEMORY[0x24BDAC7A8](v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v0);
  v6 = sub_21FFC3D7C();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v6);
  swift_retain();
  OUTLINED_FUNCTION_13_14();
  OUTLINED_FUNCTION_9_17();
  OUTLINED_FUNCTION_43_2();
}

uint64_t OUTLINED_FUNCTION_0_29()
{
  return sub_21FFC3E30();
}

uint64_t OUTLINED_FUNCTION_3_15@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 16))((char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
}

uint64_t OUTLINED_FUNCTION_5_14()
{
  return sub_21FFC5630();
}

uint64_t OUTLINED_FUNCTION_7_16()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_8()
{
  return sub_21FFC3D7C();
}

uint64_t OUTLINED_FUNCTION_9_17()
{
  return sub_21FFC3DC4();
}

uint64_t OUTLINED_FUNCTION_11_9()
{
  uint64_t v0;

  return sub_21FF5E9E8(v0);
}

uint64_t OUTLINED_FUNCTION_12_11()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21FF49B88(v0, v1);
}

uint64_t sub_21FFC0AF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A20);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_0();
  if ((*(_BYTE *)(v0 + 40) & 1) != 0)
  {
    sub_21FFC1970(v5 - v4);
    OUTLINED_FUNCTION_23_8();
    OUTLINED_FUNCTION_22_4(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    if (v7)
      return v7;
  }
  swift_retain();
  return v1;
}

void sub_21FFC0BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;

  v1 = OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_isPolicyApplied;
  if ((*(_BYTE *)(v0
                 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_isPolicyApplied) & 1) == 0)
  {
    v2 = v0;
    if (qword_2540C6928 != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_101_1();
    __swift_project_value_buffer(v3, (uint64_t)qword_2540C7038);
    OUTLINED_FUNCTION_5_15();
    v4 = (void *)sub_21FFC3EE4();
    v5 = sub_21FFC5A5C();
    if (OUTLINED_FUNCTION_80(v5))
    {
      OUTLINED_FUNCTION_38_2();
      OUTLINED_FUNCTION_38_2();
      OUTLINED_FUNCTION_6_14(4.8149e-34);
      OUTLINED_FUNCTION_8_9();
      v6 = OUTLINED_FUNCTION_30_1();
      OUTLINED_FUNCTION_15_8(v6);
      OUTLINED_FUNCTION_4_14();
      OUTLINED_FUNCTION_1_30();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_7_17(&dword_21FF05000, v7, v8, "Applying artwork caching policy for %s.");
      OUTLINED_FUNCTION_9_18();
      OUTLINED_FUNCTION_17();
    }

    OUTLINED_FUNCTION_1_30();
    v9 = *(_QWORD *)(v0 + 16);
    v10 = *(_QWORD *)(v2 + 24);
    v11 = *(_QWORD *)(v2 + 32);
    v12 = *(_BYTE *)(v2 + 40);
    swift_bridgeObjectRetain();
    sub_21FFC0E84(v2, v9, v10, v11, v12);
    swift_bridgeObjectRelease();
    *(_BYTE *)(v2 + v1) = 1;
  }
}

uint64_t sub_21FFC0D14(uint64_t a1)
{
  uint64_t Strong;
  uint64_t v3;

  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v3 = Strong;
    swift_release();
    if (a1 && v3 == a1)
      return swift_release();
  }
  else if (!a1)
  {
    return swift_release();
  }
  if (swift_weakLoadStrong())
  {
    OUTLINED_FUNCTION_25_3();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A18);
    sub_21FFC533C();
    swift_endAccess();
    swift_release();
  }
  swift_weakAssign();
  if (swift_weakLoadStrong())
  {
    OUTLINED_FUNCTION_25_3();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A18);
    sub_21FFC5330();
    swift_endAccess();
    swift_release();
  }
  sub_21FFC1794();
  return OUTLINED_FUNCTION_30_1();
}

uint64_t sub_21FFC0E58(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = a3;
  *(_BYTE *)(v4 + 40) = a4 & 1;
  swift_bridgeObjectRelease();
  return sub_21FFC1794();
}

void sub_21FFC0E84(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  if ((a5 & 1) == 0)
  {
    if (qword_2540C6928 != -1)
      swift_once();
    v9 = sub_21FFC3EFC();
    __swift_project_value_buffer(v9, (uint64_t)qword_2540C7038);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v10 = sub_21FFC3EE4();
    v11 = sub_21FFC5A5C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v19 = swift_slowAlloc();
      v20 = v19;
      *(_DWORD *)v12 = 134218498;
      sub_21FFC5AD4();
      *(_WORD *)(v12 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_21FFB76CC(a2, a3, &v20);
      sub_21FFC5AD4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 22) = 2080;
      v13 = sub_21FFC20C0(0);
      v14 = a4;
      v16 = v15;
      swift_release();
      sub_21FFB76CC(v13, v16, &v20);
      sub_21FFC5AD4();
      swift_release();
      a4 = v14;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21FF05000, v10, v11, "Setting cache limit %ld for cache identifier: \"%s\" and cache reference: %s.", (uint8_t *)v12, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2207DB550](v19, -1, -1);
      MEMORY[0x2207DB550](v12, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
    v17 = (void *)objc_opt_self();
    v18 = (void *)sub_21FFC57B0();
    objc_msgSend(v17, sel_setCacheLimit_forCacheIdentifier_cacheReference_, a4, v18, a1);

  }
}

uint64_t sub_21FFC1110(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = v4;
  v10 = v5
      + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_cachedActivePolicyNodes;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A20);
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  *(_BYTE *)(v5 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_isPolicyApplied) = 0;
  swift_weakInit();
  sub_21FFC5318();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a3;
  *(_BYTE *)(v5 + 40) = a4 & 1;
  if (qword_2540C6928 != -1)
    swift_once();
  v12 = OUTLINED_FUNCTION_101_1();
  __swift_project_value_buffer(v12, (uint64_t)qword_2540C7038);
  OUTLINED_FUNCTION_5_15();
  v13 = (void *)sub_21FFC3EE4();
  v14 = sub_21FFC5A5C();
  if (OUTLINED_FUNCTION_80(v14))
  {
    OUTLINED_FUNCTION_38_2();
    OUTLINED_FUNCTION_38_2();
    OUTLINED_FUNCTION_6_14(4.8149e-34);
    OUTLINED_FUNCTION_8_9();
    v15 = OUTLINED_FUNCTION_30_1();
    OUTLINED_FUNCTION_15_8(v15);
    OUTLINED_FUNCTION_4_14();
    OUTLINED_FUNCTION_1_30();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7_17(&dword_21FF05000, v16, v17, "Initialized %s.");
    OUTLINED_FUNCTION_9_18();
    OUTLINED_FUNCTION_17();
  }

  OUTLINED_FUNCTION_1_30();
  return v5;
}

uint64_t sub_21FFC12C4()
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
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22[3];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A18);
  v21 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_0_0();
  v20 = v3 - v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A10);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0_0();
  v8 = v7 - v6;
  if (qword_2540C6928 != -1)
    swift_once();
  v9 = OUTLINED_FUNCTION_101_1();
  __swift_project_value_buffer(v9, (uint64_t)qword_2540C7038);
  OUTLINED_FUNCTION_5_15();
  v10 = sub_21FFC3EE4();
  v11 = sub_21FFC5A5C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_38_2();
    v22[0] = OUTLINED_FUNCTION_38_2();
    *(_DWORD *)v12 = 136315138;
    swift_retain();
    v13 = OUTLINED_FUNCTION_8_9();
    v15 = v14;
    OUTLINED_FUNCTION_30_1();
    sub_21FFB76CC(v13, v15, v22);
    sub_21FFC5AD4();
    OUTLINED_FUNCTION_1_30();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21FF05000, v10, v11, "Deallocating %s.", v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_17();
  }

  OUTLINED_FUNCTION_1_30();
  if (swift_weakLoadStrong())
  {
    OUTLINED_FUNCTION_25_3();
    swift_retain();
    sub_21FFC533C();
    swift_endAccess();
    OUTLINED_FUNCTION_18_7();
  }
  v16 = v0 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_children;
  OUTLINED_FUNCTION_25_3();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v16, v1);
  sub_21FFC5324();
  v17 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  v17(v20, v1);
  while (OUTLINED_FUNCTION_21_8())
  {
    v18 = swift_retain();
    sub_21FFC0D14(v18);
    swift_release();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
  OUTLINED_FUNCTION_18_7();
  swift_bridgeObjectRelease();
  sub_21FFC26B4(v0 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_cachedActivePolicyNodes);
  swift_weakDestroy();
  v17(v16, v1);
  return v0;
}

uint64_t sub_21FFC15DC()
{
  sub_21FFC12C4();
  return swift_deallocClassInstance();
}

uint64_t sub_21FFC1600()
{
  return _s4NodeCMa();
}

uint64_t _s4NodeCMa()
{
  uint64_t result;

  result = qword_2540C6A70;
  if (!qword_2540C6A70)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21FFC1640()
{
  unint64_t v0;
  unint64_t v1;

  sub_21FFC16E8();
  if (v0 <= 0x3F)
  {
    sub_21FFC1740();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_21FFC16E8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2555920C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2540C6A20);
    v0 = sub_21FFC5AC8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2555920C0);
  }
}

void sub_21FFC1740()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2555920C8)
  {
    _s4NodeCMa();
    v0 = sub_21FFC5354();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2555920C8);
  }
}

uint64_t sub_21FFC1794()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A18);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A10);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A28);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A20);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v12);
  v13 = v0
      + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_cachedActivePolicyNodes;
  swift_beginAccess();
  sub_21FFC2628((uint64_t)v11, v13);
  swift_endAccess();
  v14 = v0 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_children;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v14, v1);
  sub_21FFC5324();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  while (sub_21FFC5348())
  {
    sub_21FFC1794();
    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_21FFC1970@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A28);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v29 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A20);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v29 - v14;
  v16 = v1
      + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_cachedActivePolicyNodes;
  OUTLINED_FUNCTION_25_3();
  sub_21FFC26F4(v16, (uint64_t)v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_21FFC26B4((uint64_t)v8);
    if (swift_weakLoadStrong())
    {
      sub_21FFC1970();
      OUTLINED_FUNCTION_18_7();
    }
    else
    {
      sub_21FFC5384();
    }
    v19 = *(_QWORD *)(v1 + 16);
    v18 = *(_QWORD *)(v1 + 24);
    v33 = v19;
    v34 = v18;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_23_8();
    if (v32 && (swift_release(), (*(_BYTE *)(v1 + 40) & 1) != 0))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v32 = v1;
      v33 = v19;
      v34 = v18;
      swift_retain();
      sub_21FFC539C();
    }
    OUTLINED_FUNCTION_24_4((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v9);
    OUTLINED_FUNCTION_25_3();
    sub_21FFC2628((uint64_t)v6, v16);
    swift_endAccess();
    if (qword_2540C6928 != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_101_1();
    __swift_project_value_buffer(v20, (uint64_t)qword_2540C7038);
    swift_retain_n();
    v21 = sub_21FFC3EE4();
    v22 = sub_21FFC5A5C();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = OUTLINED_FUNCTION_38_2();
      v30 = OUTLINED_FUNCTION_38_2();
      v33 = v30;
      *(_DWORD *)v23 = 136315394;
      v24 = OUTLINED_FUNCTION_20_10();
      v32 = OUTLINED_FUNCTION_19_9(v24, v25);
      sub_21FFC5AD4();
      OUTLINED_FUNCTION_17_8();
      OUTLINED_FUNCTION_1_10();
      *(_WORD *)(v23 + 12) = 2080;
      OUTLINED_FUNCTION_25_3();
      v26 = sub_21FFC1D58();
      v31 = OUTLINED_FUNCTION_19_9(v26, v27);
      sub_21FFC5AD4();
      OUTLINED_FUNCTION_1_10();
      _os_log_impl(&dword_21FF05000, v21, v22, "%s did update cached active policy nodes: %s", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_17();
    }

    OUTLINED_FUNCTION_17_8();
  }
  else
  {
    v17 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v17(v13, v8, v9);
    v17(v15, v13, v9);
  }
  OUTLINED_FUNCTION_25_3();
  OUTLINED_FUNCTION_24_4(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
  return OUTLINED_FUNCTION_22_4(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
}

uint64_t sub_21FFC1D58()
{
  uint64_t v0;
  char *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v11 = 0;
  v12 = 0xE000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A20);
  v8 = sub_21FFC5378();
  swift_bridgeObjectRetain();
  sub_21FFC273C((char **)&v8);
  OUTLINED_FUNCTION_1_10();
  v0 = *(_QWORD *)(v8 + 16);
  if (v0)
  {
    v1 = (char *)(v8 + 40);
    do
    {
      v2 = *(_QWORD *)v1;
      v8 = *((_QWORD *)v1 - 1);
      v9 = v2;
      swift_bridgeObjectRetain();
      sub_21FFC5390();
      if (v10)
      {
        v3 = v11 & 0xFFFFFFFFFFFFLL;
        if ((v12 & 0x2000000000000000) != 0)
          v3 = HIBYTE(v12) & 0xF;
        if (v3)
          sub_21FFC57F8();
        v8 = 0x22202020200ALL;
        v9 = 0xE600000000000000;
        sub_21FFC57F8();
        OUTLINED_FUNCTION_16_14();
        sub_21FFC57F8();
        OUTLINED_FUNCTION_20_10();
        sub_21FFC57F8();
        OUTLINED_FUNCTION_16_14();
        sub_21FFC57F8();
        swift_release();
      }
      OUTLINED_FUNCTION_16_14();
      v1 += 16;
      --v0;
    }
    while (v0);
    swift_release();
    v4 = v11;
    v5 = v12;
  }
  else
  {
    swift_release();
    v4 = 0;
    v5 = 0xE000000000000000;
  }
  v6 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0)
    v6 = v4 & 0xFFFFFFFFFFFFLL;
  if (v6)
  {
    v8 = 91;
    v9 = 0xE100000000000000;
    sub_21FFC57F8();
    swift_bridgeObjectRelease();
    sub_21FFC57F8();
    return v8;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 6109787;
  }
}

uint64_t sub_21FFC1F40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21FFC3F08();
  *a1 = result;
  return result;
}

BOOL sub_21FFC1F68(uint64_t *a1, uint64_t *a2)
{
  return sub_21FF868C4(*a1, *a2);
}

uint64_t sub_21FFC1F88()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 40);
  swift_bridgeObjectRetain();
  sub_21FFC57EC();
  sub_21FFC5D08();
  if (v1 != 1)
    sub_21FFC5CFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FFC2008()
{
  sub_21FFC5CF0();
  sub_21FFC1F88();
  return sub_21FFC5D20();
}

uint64_t sub_21FFC2044()
{
  return sub_21FFC2008();
}

uint64_t sub_21FFC2064()
{
  return sub_21FFC1F88();
}

uint64_t sub_21FFC2084()
{
  sub_21FFC5CF0();
  sub_21FFC1F88();
  return sub_21FFC5D20();
}

uint64_t sub_21FFC20C0(char a1)
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
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A18);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = 0;
  v26 = 0xE000000000000000;
  sub_21FFC5B4C();
  sub_21FFC57F8();
  v27 = v1;
  sub_21FFC5BB8();
  v27 = v25;
  v28 = v26;
  v25 = 0x7963696C6F70203BLL;
  v26 = 0xEB00000000203D20;
  v8 = *(_QWORD *)(v1 + 16);
  v9 = *(_QWORD *)(v2 + 24);
  v10 = *(_QWORD *)(v2 + 32);
  v11 = *(_BYTE *)(v2 + 40);
  swift_bridgeObjectRetain();
  sub_21FFB862C(v8, v9, v10, v11);
  sub_21FFC57F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21FFC57F8();
  swift_bridgeObjectRelease();
  if (a1 != 1)
  {
    if (a1 != 2)
    {
LABEL_24:
      sub_21FFC57F8();
      return v27;
    }
    v12 = v2 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_children;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v12, v4);
    sub_21FFC2670();
    v13 = sub_21FFC5834();
    if (v13 < 0 || (v13 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v21 = sub_21FFC5BDC();
      swift_release();
      if (v21)
      {
        swift_bridgeObjectRetain();
        v14 = sub_21FFC5BDC();
        swift_release();
LABEL_6:
        if (v14 >= 2)
        {
          v23 = 0;
          v24 = 0xE000000000000000;
          sub_21FFC5B4C();
          swift_release();
          swift_bridgeObjectRelease();
          v23 = 0x1000000000000012;
          v24 = 0x800000021FFCF620;
          v22 = v14;
          sub_21FFC5C6C();
          sub_21FFC57F8();
          swift_bridgeObjectRelease();
          sub_21FFC57F8();
          sub_21FFC57F8();
          swift_bridgeObjectRelease();
          goto LABEL_24;
        }
LABEL_19:
        swift_release();
        sub_21FFC57F8();
        goto LABEL_24;
      }
    }
    else
    {
      v14 = *(_QWORD *)(v13 + 16);
      if (v14)
        goto LABEL_6;
    }
LABEL_23:
    swift_release();
    goto LABEL_24;
  }
  if (swift_weakLoadStrong())
  {
    v25 = 0x746E65726170203BLL;
    v26 = 0xEB00000000203D20;
    sub_21FFC20C0(0);
    sub_21FFC57F8();
    swift_bridgeObjectRelease();
    sub_21FFC57F8();
    swift_release();
    swift_bridgeObjectRelease();
  }
  v15 = v2 + OBJC_IVAR____TtCVVE25_MusicKitInternal_SwiftUIV8MusicKit7Artwork7Caching6Policy4Node_children;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
  sub_21FFC2670();
  v16 = sub_21FFC5834();
  v17 = v16;
  if (v16 < 0 || (v16 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v18 = sub_21FFC5BDC();
    swift_release();
    if (!v18)
      goto LABEL_23;
  }
  else
  {
    v18 = *(_QWORD *)(v16 + 16);
    if (!v18)
      goto LABEL_23;
  }
  result = sub_21FFC57F8();
  if (v18 >= 1)
  {
    v20 = 0;
    do
    {
      if ((v17 & 0xC000000000000001) != 0)
        MEMORY[0x2207DAE48](v20, v17);
      else
        swift_retain();
      ++v20;
      v23 = 0x202020200ALL;
      v24 = 0xE500000000000000;
      sub_21FFC20C0(0);
      sub_21FFC57F8();
      swift_bridgeObjectRelease();
      sub_21FFC57F8();
      sub_21FFC57F8();
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v18 != v20);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_21FFC2594()
{
  return sub_21FFC20C0(0);
}

uint64_t sub_21FFC259C()
{
  return sub_21FFC20C0(1);
}

uint64_t sub_21FFC25A4()
{
  return sub_21FFC2594();
}

uint64_t sub_21FFC25C4()
{
  return sub_21FFC259C();
}

unint64_t sub_21FFC25E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2540C6A68;
  if (!qword_2540C6A68)
  {
    v1 = _s4NodeCMa();
    result = MEMORY[0x2207DB4B4](&unk_21FFCCC58, v1);
    atomic_store(result, (unint64_t *)&qword_2540C6A68);
  }
  return result;
}

uint64_t sub_21FFC2628(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_21FFC2670()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255592130;
  if (!qword_255592130)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2540C6A18);
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDDF100], v1);
    atomic_store(result, (unint64_t *)&qword_255592130);
  }
  return result;
}

uint64_t sub_21FFC26B4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21FFC26F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540C6A28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_21FFC273C(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21FF788A8((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v4[0] = (uint64_t)(v2 + 32);
  v4[1] = v3;
  sub_21FFC27A4(v4);
  *a1 = v2;
}

void sub_21FFC27A4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  unint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  char v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  unint64_t v78;
  _QWORD *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  BOOL v85;
  _QWORD *v86;
  _QWORD *v87;
  uint64_t v88;
  unint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  unint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  _QWORD *v102;

  v3 = a1[1];
  v4 = sub_21FFC5C60();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_21FFC2E08(0, v3, 1, a1);
      return;
    }
    goto LABEL_144;
  }
  v5 = v4;
  v99 = sub_21FF74F74(v3 / 2);
  v100 = v3;
  v101 = v6;
  v97 = a1;
  if (v3 <= 0)
  {
    v102 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v31 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_110:
    if (v31 < 2)
    {
LABEL_121:
      swift_bridgeObjectRelease();
      if (v3 >= -1)
      {
        *(_QWORD *)(v99 + 16) = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_149;
    }
    v88 = *v97;
    while (1)
    {
      v89 = v31 - 2;
      if (v31 < 2)
        break;
      if (!v88)
        goto LABEL_153;
      v90 = v102;
      v91 = v102[2 * v89 + 4];
      v92 = v102[2 * v31 + 3];
      sub_21FFC2ECC((char *)(v88 + 16 * v91), (char *)(v88 + 16 * v102[2 * v31 + 2]), v88 + 16 * v92, v101);
      if (v1)
        goto LABEL_106;
      if (v92 < v91)
        goto LABEL_139;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21FF770C8();
        v90 = v95;
      }
      if (v89 >= v90[2])
        goto LABEL_140;
      v93 = &v90[2 * v89 + 4];
      *v93 = v91;
      v93[1] = v92;
      v94 = v90[2];
      if (v31 > v94)
        goto LABEL_141;
      memmove(&v90[2 * v31 + 2], &v90[2 * v31 + 4], 16 * (v94 - v31));
      v102 = v90;
      v90[2] = v94 - 1;
      v31 = v94 - 1;
      v3 = v100;
      if (v94 <= 2)
        goto LABEL_121;
    }
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
    return;
  }
  v98 = v5;
  v7 = 0;
  v8 = *a1;
  v96 = *a1 + 8;
  v102 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v9 = v7++;
    if (v7 >= v3)
      goto LABEL_32;
    v10 = (uint64_t *)(v8 + 16 * v7);
    v11 = *v10;
    v12 = v10[1];
    v13 = (_QWORD *)(v8 + 16 * v9);
    if (v11 == *v13 && v12 == v13[1])
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v3)
        goto LABEL_31;
      v15 = 0;
LABEL_13:
      v17 = (_QWORD *)(v96 + 16 * v16);
      do
      {
        v18 = (_QWORD *)(v8 + 16 * v7);
        if (*(v17 - 1) == *v18 && *v17 == v18[1])
        {
          if ((v15 & 1) != 0)
            goto LABEL_24;
        }
        else if (((v15 ^ sub_21FFC5C90()) & 1) != 0)
        {
          goto LABEL_23;
        }
        v17 += 2;
        v20 = v16 + 1;
        v7 = v16;
        v16 = v20;
      }
      while (v20 < v3);
      v16 = v20;
      goto LABEL_23;
    }
    v15 = sub_21FFC5C90();
    v16 = v9 + 2;
    if (v9 + 2 < v3)
      goto LABEL_13;
LABEL_23:
    v7 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_32;
LABEL_24:
    if (v16 < v9)
      goto LABEL_148;
    if (v9 < v16)
    {
      v21 = 16 * v16;
      v22 = 16 * v9;
      v23 = v16;
      v24 = v9;
      do
      {
        if (v24 != --v23)
        {
          if (!v8)
            goto LABEL_152;
          v25 = v8 + v21;
          v26 = *(_QWORD *)(v8 + v22);
          v27 = *(_QWORD *)(v8 + v22 + 8);
          *(_OWORD *)(v8 + v22) = *(_OWORD *)(v8 + v21 - 16);
          *(_QWORD *)(v25 - 16) = v26;
          *(_QWORD *)(v25 - 8) = v27;
        }
        ++v24;
        v21 -= 16;
        v22 += 16;
      }
      while (v24 < v23);
    }
LABEL_31:
    v7 = v16;
LABEL_32:
    if (v7 >= v3)
      goto LABEL_41;
    if (__OFSUB__(v7, v9))
      goto LABEL_143;
    if (v7 - v9 >= v98)
      goto LABEL_41;
    if (__OFADD__(v9, v98))
      goto LABEL_146;
    if (v9 + v98 >= v3)
      v28 = v3;
    else
      v28 = v9 + v98;
    if (v28 < v9)
      goto LABEL_147;
    if (v7 == v28)
    {
LABEL_41:
      v29 = v102;
    }
    else
    {
      v79 = (_QWORD *)(v8 + 16 * v7);
      v29 = v102;
      do
      {
        v80 = (uint64_t *)(v8 + 16 * v7);
        v81 = *v80;
        v82 = v80[1];
        v83 = v9;
        v84 = v79;
        do
        {
          v85 = v81 == *(v84 - 2) && v82 == *(v84 - 1);
          if (v85 || (sub_21FFC5C90() & 1) == 0)
            break;
          if (!v8)
            goto LABEL_150;
          v81 = *v84;
          v82 = v84[1];
          *(_OWORD *)v84 = *((_OWORD *)v84 - 1);
          *(v84 - 1) = v82;
          *(v84 - 2) = v81;
          v84 -= 2;
          ++v83;
        }
        while (v7 != v83);
        ++v7;
        v79 += 2;
      }
      while (v7 != v28);
      v7 = v28;
    }
    if (v7 < v9)
      goto LABEL_142;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_21FF76FFC();
      v29 = v86;
    }
    v30 = v29[2];
    v31 = v30 + 1;
    if (v30 >= v29[3] >> 1)
    {
      sub_21FF76FFC();
      v29 = v87;
    }
    v29[2] = v31;
    v32 = v29 + 4;
    v33 = &v29[2 * v30 + 4];
    *v33 = v9;
    v33[1] = v7;
    v102 = v29;
    if (v30)
      break;
    v31 = 1;
LABEL_90:
    v3 = v100;
    if (v7 >= v100)
      goto LABEL_110;
  }
  while (1)
  {
    v34 = v31 - 1;
    if (v31 >= 4)
    {
      v39 = &v32[2 * v31];
      v40 = *(v39 - 8);
      v41 = *(v39 - 7);
      v45 = __OFSUB__(v41, v40);
      v42 = v41 - v40;
      if (v45)
        goto LABEL_127;
      v44 = *(v39 - 6);
      v43 = *(v39 - 5);
      v45 = __OFSUB__(v43, v44);
      v37 = v43 - v44;
      v38 = v45;
      if (v45)
        goto LABEL_128;
      v46 = v31 - 2;
      v47 = &v32[2 * v31 - 4];
      v49 = *v47;
      v48 = v47[1];
      v45 = __OFSUB__(v48, v49);
      v50 = v48 - v49;
      if (v45)
        goto LABEL_129;
      v45 = __OFADD__(v37, v50);
      v51 = v37 + v50;
      if (v45)
        goto LABEL_131;
      if (v51 >= v42)
      {
        v69 = &v32[2 * v34];
        v71 = *v69;
        v70 = v69[1];
        v45 = __OFSUB__(v70, v71);
        v72 = v70 - v71;
        if (v45)
          goto LABEL_137;
        v62 = v37 < v72;
        goto LABEL_79;
      }
    }
    else
    {
      if (v31 != 3)
      {
        v63 = v29[4];
        v64 = v29[5];
        v45 = __OFSUB__(v64, v63);
        v56 = v64 - v63;
        v57 = v45;
        goto LABEL_73;
      }
      v36 = v29[4];
      v35 = v29[5];
      v45 = __OFSUB__(v35, v36);
      v37 = v35 - v36;
      v38 = v45;
    }
    if ((v38 & 1) != 0)
      goto LABEL_130;
    v46 = v31 - 2;
    v52 = &v32[2 * v31 - 4];
    v54 = *v52;
    v53 = v52[1];
    v55 = __OFSUB__(v53, v54);
    v56 = v53 - v54;
    v57 = v55;
    if (v55)
      goto LABEL_132;
    v58 = &v32[2 * v34];
    v60 = *v58;
    v59 = v58[1];
    v45 = __OFSUB__(v59, v60);
    v61 = v59 - v60;
    if (v45)
      goto LABEL_134;
    if (__OFADD__(v56, v61))
      goto LABEL_136;
    if (v56 + v61 >= v37)
    {
      v62 = v37 < v61;
LABEL_79:
      if (v62)
        v34 = v46;
      goto LABEL_81;
    }
LABEL_73:
    if ((v57 & 1) != 0)
      goto LABEL_133;
    v65 = &v32[2 * v34];
    v67 = *v65;
    v66 = v65[1];
    v45 = __OFSUB__(v66, v67);
    v68 = v66 - v67;
    if (v45)
      goto LABEL_135;
    if (v68 < v56)
      goto LABEL_90;
LABEL_81:
    v73 = v34 - 1;
    if (v34 - 1 >= v31)
    {
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
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (!v8)
      goto LABEL_151;
    v74 = &v32[2 * v73];
    v75 = *v74;
    v76 = &v32[2 * v34];
    v77 = v76[1];
    sub_21FFC2ECC((char *)(v8 + 16 * *v74), (char *)(v8 + 16 * *v76), v8 + 16 * v77, v101);
    if (v1)
      break;
    if (v77 < v75)
      goto LABEL_124;
    if (v34 > v102[2])
      goto LABEL_125;
    *v74 = v75;
    v32[2 * v73 + 1] = v77;
    v78 = v102[2];
    if (v34 >= v78)
      goto LABEL_126;
    v29 = v102;
    v31 = v78 - 1;
    memmove(&v32[2 * v34], v76 + 2, 16 * (v78 - 1 - v34));
    v102[2] = v78 - 1;
    if (v78 <= 2)
      goto LABEL_90;
  }
LABEL_106:
  swift_bridgeObjectRelease();
  if (v100 < -1)
    goto LABEL_145;
  *(_QWORD *)(v99 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_21FFC2E08(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
    while (2)
    {
      v9 = (uint64_t *)(v7 + 16 * v4);
      result = *v9;
      v10 = v9[1];
      v11 = v6;
      v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1))
          break;
        result = sub_21FFC5C90();
        if ((result & 1) == 0)
          break;
        if (!v7)
        {
          __break(1u);
          return result;
        }
        result = *v12;
        v10 = v12[1];
        *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_21FFC2ECC(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v14;
  char *v15;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 16;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 16;
  if (v9 >= v11)
  {
    sub_21FF75764(a2, (uint64_t)(a3 - (_QWORD)a2) / 16, a4);
    v12 = (unint64_t)&v4[16 * v11];
    if (v7 >= v6 || v10 < 16)
      goto LABEL_47;
    v18 = (char *)(a3 - 16);
    while (1)
    {
      v19 = v18 + 16;
      v20 = (char *)(v12 - 16);
      v21 = *(_QWORD *)(v12 - 16) == *((_QWORD *)v6 - 2) && *(_QWORD *)(v12 - 8) == *((_QWORD *)v6 - 1);
      if (v21 || (sub_21FFC5C90() & 1) == 0)
      {
        v23 = v19 != (char *)v12 || (unint64_t)v18 >= v12;
        v12 -= 16;
        if (!v23)
          goto LABEL_43;
      }
      else
      {
        v22 = v19 != v6 || v18 >= v6;
        v20 = v6 - 16;
        v6 -= 16;
        if (!v22)
          goto LABEL_43;
      }
      *(_OWORD *)v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= (unint64_t)v4)
        goto LABEL_47;
    }
  }
  sub_21FF75764(a1, (a2 - a1) / 16, a4);
  v12 = (unint64_t)&v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      v14 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (!v14 && (sub_21FFC5C90() & 1) != 0)
        break;
      v15 = v4;
      v14 = v7 == v4;
      v4 += 16;
      if (!v14)
        goto LABEL_15;
LABEL_16:
      v7 += 16;
      if ((unint64_t)v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_21;
    }
    v15 = v6;
    v14 = v7 == v6;
    v6 += 16;
    if (v14)
      goto LABEL_16;
LABEL_15:
    *(_OWORD *)v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  v6 = v7;
LABEL_47:
  sub_21FF75764(v4, (uint64_t)(v12 - (_QWORD)v4) / 16, v6);
  return 1;
}

uint64_t OUTLINED_FUNCTION_1_30()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_4_14()
{
  return sub_21FFC5AD4();
}

uint64_t OUTLINED_FUNCTION_5_15()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_6_14(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_retain();
}

void OUTLINED_FUNCTION_7_17(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_8_9()
{
  return sub_21FFC20C0(0);
}

uint64_t OUTLINED_FUNCTION_9_18()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_15_8(uint64_t a1, ...)
{
  uint64_t v1;
  unint64_t v2;
  va_list va;

  va_start(va, a1);
  return sub_21FFB76CC(v1, v2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_16_14()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_17_8()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_18_7()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_19_9(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_21FFB76CC(a1, a2, (uint64_t *)(v2 - 128));
}

uint64_t OUTLINED_FUNCTION_20_10()
{
  return sub_21FFC20C0(2);
}

uint64_t OUTLINED_FUNCTION_21_8()
{
  return sub_21FFC5348();
}

uint64_t OUTLINED_FUNCTION_22_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_23_8()
{
  return sub_21FFC5390();
}

uint64_t OUTLINED_FUNCTION_24_4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

ValueMetadata *_s10BackButtonVMa()
{
  return &_s10BackButtonVN;
}

uint64_t sub_21FFC3170()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FFC3180()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255592138);
  sub_21FFC342C();
  return sub_21FFC4D00();
}

uint64_t sub_21FFC31E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;
  char v16;
  uint64_t v17;

  v2 = sub_21FFC43B8();
  sub_21FFC3298((uint64_t)v14);
  v3 = v15;
  v4 = v16;
  v5 = v17;
  v12 = v14[0];
  v13 = v14[1];
  v6 = sub_21FFC4760();
  result = sub_21FFC3F80();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0x4014000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = v13;
  *(_QWORD *)(a1 + 56) = v3;
  *(_BYTE *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 72) = v5;
  *(_BYTE *)(a1 + 80) = v6;
  *(_QWORD *)(a1 + 88) = v8;
  *(_QWORD *)(a1 + 96) = v9;
  *(_QWORD *)(a1 + 104) = v10;
  *(_QWORD *)(a1 + 112) = v11;
  *(_BYTE *)(a1 + 120) = 0;
  return result;
}

uint64_t sub_21FFC3298@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;

  v2 = sub_21FFC4C64();
  v3 = sub_21FFC4844();
  KeyPath = swift_getKeyPath();
  sub_21FFC4424();
  if (qword_25558DEF0 != -1)
    swift_once();
  v5 = (id)qword_255598218;
  v6 = sub_21FFC48D4();
  v8 = v7;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = KeyPath;
  v10 = v9 & 1;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v9 & 1;
  *(_QWORD *)(a1 + 48) = v11;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21FF2E218(v6, v8, v10);
  swift_bridgeObjectRetain();
  sub_21FF2E3E4(v6, v8, v10);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21FFC3424()
{
  return sub_21FFC3180();
}

unint64_t sub_21FFC342C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255592140;
  if (!qword_255592140)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255592138);
    v2[0] = sub_21FF4D118(&qword_255592148, &qword_255592150, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2207DB4B4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255592140);
  }
  return result;
}

void sub_21FFC34B0()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_0_30();
  OUTLINED_FUNCTION_31();
}

void sub_21FFC34CC()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_0_30();
  OUTLINED_FUNCTION_31();
}

void sub_21FFC34E8()
{
  swift_retain();
  sub_21FFC4340();
  OUTLINED_FUNCTION_31();
}

uint64_t sub_21FFC3510()
{
  return sub_21FF4D118(&qword_255592158, &qword_255592160, MEMORY[0x24BDF43B0]);
}

uint64_t OUTLINED_FUNCTION_0_30()
{
  return sub_21FFC4334();
}

uint64_t sub_21FFC3548()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_21FFC3578()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_21FFC3584()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_21FFC3590()
{
  return MEMORY[0x24BDCB148]();
}

uint64_t sub_21FFC359C()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_21FFC35A8()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_21FFC35B4()
{
  return MEMORY[0x24BDEAD50]();
}

uint64_t sub_21FFC35C0()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_21FFC35CC()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_21FFC35D8()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_21FFC35E4()
{
  return MEMORY[0x24BDCC608]();
}

uint64_t sub_21FFC35F0()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_21FFC35FC()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_21FFC3608()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_21FFC3614()
{
  return MEMORY[0x24BDCC978]();
}

uint64_t sub_21FFC3620()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_21FFC362C()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_21FFC3638()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21FFC3644()
{
  return MEMORY[0x24BDCD3F0]();
}

uint64_t sub_21FFC3650()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_21FFC365C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21FFC3668()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21FFC3674()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21FFC3680()
{
  return MEMORY[0x24BDCDEB0]();
}

uint64_t sub_21FFC368C()
{
  return MEMORY[0x24BDCDEE8]();
}

uint64_t sub_21FFC3698()
{
  return MEMORY[0x24BDCDEF8]();
}

uint64_t sub_21FFC36A4()
{
  return MEMORY[0x24BDCDF30]();
}

uint64_t sub_21FFC36B0()
{
  return MEMORY[0x24BDCE038]();
}

uint64_t sub_21FFC36BC()
{
  return MEMORY[0x24BDCE110]();
}

uint64_t sub_21FFC36C8()
{
  return MEMORY[0x24BDCE130]();
}

uint64_t sub_21FFC36D4()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_21FFC36E0()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_21FFC36EC()
{
  return MEMORY[0x24BDCE8C0]();
}

uint64_t sub_21FFC36F8()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_21FFC3704()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21FFC3710()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_21FFC371C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21FFC3728()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_21FFC3734()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_21FFC3740()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_21FFC374C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_21FFC3758()
{
  return MEMORY[0x24BDCF588]();
}

uint64_t sub_21FFC3764()
{
  return MEMORY[0x24BDCF5A8]();
}

uint64_t sub_21FFC3770()
{
  return MEMORY[0x24BDCF5D8]();
}

uint64_t sub_21FFC377C()
{
  return MEMORY[0x24BDCF5F8]();
}

uint64_t sub_21FFC3788()
{
  return MEMORY[0x24BDCF610]();
}

uint64_t sub_21FFC3794()
{
  return MEMORY[0x24BE64380]();
}

uint64_t sub_21FFC37A0()
{
  return MEMORY[0x24BE64650]();
}

uint64_t sub_21FFC37AC()
{
  return MEMORY[0x24BE64660]();
}

uint64_t sub_21FFC37B8()
{
  return MEMORY[0x24BE64668]();
}

uint64_t sub_21FFC37C4()
{
  return MEMORY[0x24BEDF408]();
}

uint64_t sub_21FFC37D0()
{
  return MEMORY[0x24BE69420]();
}

uint64_t sub_21FFC37DC()
{
  return MEMORY[0x24BE69498]();
}

uint64_t sub_21FFC37E8()
{
  return MEMORY[0x24BE69548]();
}

uint64_t sub_21FFC37F4()
{
  return MEMORY[0x24BE695D0]();
}

uint64_t sub_21FFC3800()
{
  return MEMORY[0x24BE695F8]();
}

uint64_t sub_21FFC380C()
{
  return MEMORY[0x24BE69620]();
}

uint64_t sub_21FFC3818()
{
  return MEMORY[0x24BE69628]();
}

uint64_t sub_21FFC3824()
{
  return MEMORY[0x24BE69630]();
}

uint64_t sub_21FFC3830()
{
  return MEMORY[0x24BE69638]();
}

uint64_t sub_21FFC383C()
{
  return MEMORY[0x24BE69640]();
}

uint64_t sub_21FFC3848()
{
  return MEMORY[0x24BE696C8]();
}

uint64_t sub_21FFC3854()
{
  return MEMORY[0x24BE696D8]();
}

uint64_t sub_21FFC3860()
{
  return MEMORY[0x24BE69758]();
}

uint64_t sub_21FFC386C()
{
  return MEMORY[0x24BE69768]();
}

uint64_t sub_21FFC3878()
{
  return MEMORY[0x24BE69770]();
}

uint64_t sub_21FFC3884()
{
  return MEMORY[0x24BE69780]();
}

uint64_t sub_21FFC3890()
{
  return MEMORY[0x24BE69788]();
}

uint64_t sub_21FFC389C()
{
  return MEMORY[0x24BE69790]();
}

uint64_t sub_21FFC38A8()
{
  return MEMORY[0x24BE69798]();
}

uint64_t sub_21FFC38B4()
{
  return MEMORY[0x24BE697A0]();
}

uint64_t sub_21FFC38C0()
{
  return MEMORY[0x24BE697C0]();
}

uint64_t sub_21FFC38CC()
{
  return MEMORY[0x24BE697C8]();
}

uint64_t sub_21FFC38D8()
{
  return MEMORY[0x24BE69918]();
}

uint64_t sub_21FFC38E4()
{
  return MEMORY[0x24BE69920]();
}

uint64_t sub_21FFC38F0()
{
  return MEMORY[0x24BE69940]();
}

uint64_t sub_21FFC38FC()
{
  return MEMORY[0x24BE69960]();
}

uint64_t sub_21FFC3908()
{
  return MEMORY[0x24BE69988]();
}

uint64_t sub_21FFC3914()
{
  return MEMORY[0x24BE69998]();
}

uint64_t sub_21FFC3920()
{
  return MEMORY[0x24BE699A0]();
}

uint64_t sub_21FFC392C()
{
  return MEMORY[0x24BE699B0]();
}

uint64_t sub_21FFC3938()
{
  return MEMORY[0x24BE69A78]();
}

uint64_t sub_21FFC3944()
{
  return MEMORY[0x24BE69A80]();
}

uint64_t sub_21FFC3950()
{
  return MEMORY[0x24BE69A88]();
}

uint64_t sub_21FFC395C()
{
  return MEMORY[0x24BE69A90]();
}

uint64_t sub_21FFC3968()
{
  return MEMORY[0x24BE69A98]();
}

uint64_t sub_21FFC3974()
{
  return MEMORY[0x24BE69AA8]();
}

uint64_t sub_21FFC3980()
{
  return MEMORY[0x24BE69B10]();
}

uint64_t sub_21FFC398C()
{
  return MEMORY[0x24BE69B18]();
}

uint64_t sub_21FFC3998()
{
  return MEMORY[0x24BE69B28]();
}

uint64_t sub_21FFC39A4()
{
  return MEMORY[0x24BE69B30]();
}

uint64_t sub_21FFC39B0()
{
  return MEMORY[0x24BE69B38]();
}

uint64_t sub_21FFC39BC()
{
  return MEMORY[0x24BE69B40]();
}

uint64_t sub_21FFC39C8()
{
  return MEMORY[0x24BE69B48]();
}

uint64_t sub_21FFC39D4()
{
  return MEMORY[0x24BE69B50]();
}

uint64_t sub_21FFC39E0()
{
  return MEMORY[0x24BE69B58]();
}

uint64_t sub_21FFC39EC()
{
  return MEMORY[0x24BE69B60]();
}

uint64_t sub_21FFC39F8()
{
  return MEMORY[0x24BE69B68]();
}

uint64_t sub_21FFC3A04()
{
  return MEMORY[0x24BE69B70]();
}

uint64_t sub_21FFC3A10()
{
  return MEMORY[0x24BE69B78]();
}

uint64_t sub_21FFC3A1C()
{
  return MEMORY[0x24BE69B80]();
}

uint64_t sub_21FFC3A28()
{
  return MEMORY[0x24BE69B88]();
}

uint64_t sub_21FFC3A34()
{
  return MEMORY[0x24BE69B90]();
}

uint64_t sub_21FFC3A40()
{
  return MEMORY[0x24BE69B98]();
}

uint64_t sub_21FFC3A4C()
{
  return MEMORY[0x24BE69BA0]();
}

uint64_t sub_21FFC3A58()
{
  return MEMORY[0x24BE69BA8]();
}

uint64_t sub_21FFC3A64()
{
  return MEMORY[0x24BE69BB0]();
}

uint64_t sub_21FFC3A70()
{
  return MEMORY[0x24BE69BB8]();
}

uint64_t sub_21FFC3A7C()
{
  return MEMORY[0x24BE69BC0]();
}

uint64_t sub_21FFC3A88()
{
  return MEMORY[0x24BE69BD8]();
}

uint64_t sub_21FFC3A94()
{
  return MEMORY[0x24BE69BE0]();
}

uint64_t sub_21FFC3AA0()
{
  return MEMORY[0x24BE69BE8]();
}

uint64_t sub_21FFC3AAC()
{
  return MEMORY[0x24BE69BF0]();
}

uint64_t sub_21FFC3AB8()
{
  return MEMORY[0x24BE69BF8]();
}

uint64_t sub_21FFC3AC4()
{
  return MEMORY[0x24BE69C00]();
}

uint64_t sub_21FFC3AD0()
{
  return MEMORY[0x24BE69C20]();
}

uint64_t sub_21FFC3ADC()
{
  return MEMORY[0x24BE69C38]();
}

uint64_t sub_21FFC3AE8()
{
  return MEMORY[0x24BE69C50]();
}

uint64_t sub_21FFC3AF4()
{
  return MEMORY[0x24BE69C60]();
}

uint64_t sub_21FFC3B00()
{
  return MEMORY[0x24BE69C68]();
}

uint64_t sub_21FFC3B0C()
{
  return MEMORY[0x24BE69C80]();
}

uint64_t sub_21FFC3B18()
{
  return MEMORY[0x24BE69C90]();
}

uint64_t sub_21FFC3B24()
{
  return MEMORY[0x24BE69C98]();
}

uint64_t sub_21FFC3B30()
{
  return MEMORY[0x24BE69CB8]();
}

uint64_t sub_21FFC3B3C()
{
  return MEMORY[0x24BE69CC8]();
}

uint64_t sub_21FFC3B48()
{
  return MEMORY[0x24BE69CD0]();
}

uint64_t sub_21FFC3B54()
{
  return MEMORY[0x24BE69CE0]();
}

uint64_t sub_21FFC3B60()
{
  return MEMORY[0x24BE69CF8]();
}

uint64_t sub_21FFC3B6C()
{
  return MEMORY[0x24BE69D00]();
}

uint64_t sub_21FFC3B78()
{
  return MEMORY[0x24BE69DF8]();
}

uint64_t sub_21FFC3B84()
{
  return MEMORY[0x24BE69E28]();
}

uint64_t sub_21FFC3B90()
{
  return MEMORY[0x24BE69E30]();
}

uint64_t sub_21FFC3B9C()
{
  return MEMORY[0x24BE69E38]();
}

uint64_t sub_21FFC3BA8()
{
  return MEMORY[0x24BE69E48]();
}

uint64_t sub_21FFC3BB4()
{
  return MEMORY[0x24BE69E58]();
}

uint64_t sub_21FFC3BC0()
{
  return MEMORY[0x24BE69E60]();
}

uint64_t sub_21FFC3BCC()
{
  return MEMORY[0x24BE69E68]();
}

uint64_t sub_21FFC3BD8()
{
  return MEMORY[0x24BE69E70]();
}

uint64_t sub_21FFC3BE4()
{
  return MEMORY[0x24BE69E98]();
}

uint64_t sub_21FFC3BF0()
{
  return MEMORY[0x24BE69EA8]();
}

uint64_t sub_21FFC3BFC()
{
  return MEMORY[0x24BE69EB8]();
}

uint64_t sub_21FFC3C08()
{
  return MEMORY[0x24BE69ED0]();
}

uint64_t sub_21FFC3C14()
{
  return MEMORY[0x24BE69ED8]();
}

uint64_t sub_21FFC3C20()
{
  return MEMORY[0x24BE69EE0]();
}

uint64_t sub_21FFC3C2C()
{
  return MEMORY[0x24BE69EF0]();
}

uint64_t sub_21FFC3C38()
{
  return MEMORY[0x24BE6A368]();
}

uint64_t sub_21FFC3C44()
{
  return MEMORY[0x24BE6A370]();
}

uint64_t sub_21FFC3C50()
{
  return MEMORY[0x24BE6A378]();
}

uint64_t sub_21FFC3C5C()
{
  return MEMORY[0x24BE6A380]();
}

uint64_t sub_21FFC3C68()
{
  return MEMORY[0x24BE6A388]();
}

uint64_t sub_21FFC3C74()
{
  return MEMORY[0x24BE6A390]();
}

uint64_t sub_21FFC3C80()
{
  return MEMORY[0x24BE6A398]();
}

uint64_t sub_21FFC3C8C()
{
  return MEMORY[0x24BE6A3A0]();
}

uint64_t sub_21FFC3C98()
{
  return MEMORY[0x24BE6A3A8]();
}

uint64_t sub_21FFC3CA4()
{
  return MEMORY[0x24BE6A3B0]();
}

uint64_t sub_21FFC3CB0()
{
  return MEMORY[0x24BE6A3B8]();
}

uint64_t sub_21FFC3CBC()
{
  return MEMORY[0x24BE6A3C8]();
}

uint64_t sub_21FFC3CC8()
{
  return MEMORY[0x24BE6A3D0]();
}

uint64_t sub_21FFC3CD4()
{
  return MEMORY[0x24BE6A3E0]();
}

uint64_t sub_21FFC3CE0()
{
  return MEMORY[0x24BE6A3F0]();
}

uint64_t sub_21FFC3CEC()
{
  return MEMORY[0x24BE6A3F8]();
}

uint64_t sub_21FFC3CF8()
{
  return MEMORY[0x24BE6A4D0]();
}

uint64_t sub_21FFC3D04()
{
  return MEMORY[0x24BE6A4E8]();
}

uint64_t sub_21FFC3D10()
{
  return MEMORY[0x24BE6A580]();
}

uint64_t sub_21FFC3D1C()
{
  return MEMORY[0x24BE6A698]();
}

uint64_t _s17_MusicKit_SwiftUI0A17SubscriptionOfferV7OptionsV01_ab9Internal_cD0E19figaroCampaignGroupSSSgvg_0()
{
  return MEMORY[0x24BDFC060]();
}

uint64_t _s17_MusicKit_SwiftUI0A17SubscriptionOfferV7OptionsV01_ab9Internal_cD0E19figaroCampaignGroupSSSgvs_0()
{
  return MEMORY[0x24BDFC068]();
}

uint64_t _s17_MusicKit_SwiftUI0A17SubscriptionOfferV7OptionsV01_ab9Internal_cD0E19figaroCampaignTokenSSSgvg_0()
{
  return MEMORY[0x24BDFC070]();
}

uint64_t _s17_MusicKit_SwiftUI0A17SubscriptionOfferV7OptionsV01_ab9Internal_cD0E19figaroCampaignTokenSSSgvs_0()
{
  return MEMORY[0x24BDFC078]();
}

uint64_t sub_21FFC3D58()
{
  return MEMORY[0x24BDFC080]();
}

uint64_t sub_21FFC3D64()
{
  return MEMORY[0x24BDFC090]();
}

uint64_t sub_21FFC3D70()
{
  return MEMORY[0x24BDFC098]();
}

uint64_t sub_21FFC3D7C()
{
  return MEMORY[0x24BDFC0B0]();
}

uint64_t sub_21FFC3D88()
{
  return MEMORY[0x24BDFC0C0]();
}

uint64_t sub_21FFC3D94()
{
  return MEMORY[0x24BDFC0C8]();
}

uint64_t sub_21FFC3DA0()
{
  return MEMORY[0x24BDFC0D0]();
}

uint64_t sub_21FFC3DAC()
{
  return MEMORY[0x24BDFC0D8]();
}

uint64_t sub_21FFC3DB8()
{
  return MEMORY[0x24BDFC0E0]();
}

uint64_t sub_21FFC3DC4()
{
  return MEMORY[0x24BDFC0E8]();
}

uint64_t sub_21FFC3DD0()
{
  return MEMORY[0x24BDFC0F0]();
}

uint64_t sub_21FFC3DDC()
{
  return MEMORY[0x24BDFC0F8]();
}

uint64_t sub_21FFC3DE8()
{
  return MEMORY[0x24BDFC100]();
}

uint64_t sub_21FFC3DF4()
{
  return MEMORY[0x24BDFC108]();
}

uint64_t sub_21FFC3E00()
{
  return MEMORY[0x24BDFC110]();
}

uint64_t sub_21FFC3E0C()
{
  return MEMORY[0x24BDFC120]();
}

uint64_t sub_21FFC3E18()
{
  return MEMORY[0x24BDFC128]();
}

uint64_t sub_21FFC3E24()
{
  return MEMORY[0x24BDFC130]();
}

uint64_t sub_21FFC3E30()
{
  return MEMORY[0x24BDFC138]();
}

uint64_t sub_21FFC3E3C()
{
  return MEMORY[0x24BDFC148]();
}

uint64_t sub_21FFC3E48()
{
  return MEMORY[0x24BDFC160]();
}

uint64_t sub_21FFC3E54()
{
  return MEMORY[0x24BDFC168]();
}

uint64_t sub_21FFC3E60()
{
  return MEMORY[0x24BDFC170]();
}

uint64_t sub_21FFC3E6C()
{
  return MEMORY[0x24BDFC178]();
}

uint64_t sub_21FFC3E78()
{
  return MEMORY[0x24BDFC180]();
}

uint64_t sub_21FFC3E84()
{
  return MEMORY[0x24BDFC188]();
}

uint64_t sub_21FFC3E90()
{
  return MEMORY[0x24BDFC198]();
}

uint64_t sub_21FFC3E9C()
{
  return MEMORY[0x24BDFC1A0]();
}

uint64_t sub_21FFC3EA8()
{
  return MEMORY[0x24BDFC1C0]();
}

uint64_t sub_21FFC3EB4()
{
  return MEMORY[0x24BDFC1C8]();
}

uint64_t sub_21FFC3EC0()
{
  return MEMORY[0x24BDFC1D8]();
}

uint64_t sub_21FFC3ECC()
{
  return MEMORY[0x24BDFC1E0]();
}

uint64_t sub_21FFC3ED8()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_21FFC3EE4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21FFC3EF0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21FFC3EFC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21FFC3F08()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_21FFC3F14()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_21FFC3F20()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_21FFC3F2C()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_21FFC3F38()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_21FFC3F44()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_21FFC3F50()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_21FFC3F5C()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_21FFC3F68()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_21FFC3F74()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_21FFC3F80()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_21FFC3F8C()
{
  return MEMORY[0x24BDEB170]();
}

uint64_t sub_21FFC3F98()
{
  return MEMORY[0x24BDEB178]();
}

uint64_t sub_21FFC3FA4()
{
  return MEMORY[0x24BDEB210]();
}

uint64_t sub_21FFC3FB0()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_21FFC3FBC()
{
  return MEMORY[0x24BDEB2A0]();
}

uint64_t sub_21FFC3FC8()
{
  return MEMORY[0x24BDEB2B0]();
}

uint64_t sub_21FFC3FD4()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_21FFC3FE0()
{
  return MEMORY[0x24BDEB5B8]();
}

uint64_t sub_21FFC3FEC()
{
  return MEMORY[0x24BDEB780]();
}

uint64_t sub_21FFC3FF8()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_21FFC4004()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_21FFC4010()
{
  return MEMORY[0x24BDEB7F8]();
}

uint64_t sub_21FFC401C()
{
  return MEMORY[0x24BDEB800]();
}

uint64_t sub_21FFC4028()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_21FFC4034()
{
  return MEMORY[0x24BDEB830]();
}

uint64_t sub_21FFC4040()
{
  return MEMORY[0x24BDEB858]();
}

uint64_t sub_21FFC404C()
{
  return MEMORY[0x24BDEB868]();
}

uint64_t sub_21FFC4058()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_21FFC4064()
{
  return MEMORY[0x24BDEBC10]();
}

uint64_t sub_21FFC4070()
{
  return MEMORY[0x24BDEBC28]();
}

uint64_t sub_21FFC407C()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_21FFC4088()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_21FFC4094()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_21FFC40A0()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_21FFC40AC()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_21FFC40B8()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_21FFC40C4()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_21FFC40D0()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_21FFC40DC()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_21FFC40E8()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_21FFC40F4()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_21FFC4100()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_21FFC410C()
{
  return MEMORY[0x24BDEC6D8]();
}

uint64_t sub_21FFC4118()
{
  return MEMORY[0x24BDEC6E0]();
}

uint64_t sub_21FFC4124()
{
  return MEMORY[0x24BDEC888]();
}

uint64_t sub_21FFC4130()
{
  return MEMORY[0x24BDEC8C8]();
}

uint64_t sub_21FFC413C()
{
  return MEMORY[0x24BDEC958]();
}

uint64_t sub_21FFC4148()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_21FFC4154()
{
  return MEMORY[0x24BDECB28]();
}

uint64_t sub_21FFC4160()
{
  return MEMORY[0x24BDECB30]();
}

uint64_t sub_21FFC416C()
{
  return MEMORY[0x24BDECE88]();
}

uint64_t sub_21FFC4178()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_21FFC4184()
{
  return MEMORY[0x24BDED128]();
}

uint64_t sub_21FFC4190()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_21FFC419C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_21FFC41A8()
{
  return MEMORY[0x24BDED330]();
}

uint64_t sub_21FFC41B4()
{
  return MEMORY[0x24BDED338]();
}

uint64_t sub_21FFC41C0()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_21FFC41CC()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_21FFC41D8()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_21FFC41E4()
{
  return MEMORY[0x24BDED8D0]();
}

uint64_t sub_21FFC41F0()
{
  return MEMORY[0x24BDED970]();
}

uint64_t sub_21FFC41FC()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_21FFC4208()
{
  return MEMORY[0x24BDEDAF8]();
}

uint64_t sub_21FFC4214()
{
  return MEMORY[0x24BDEDB18]();
}

uint64_t sub_21FFC4220()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_21FFC422C()
{
  return MEMORY[0x24BDEDBF0]();
}

uint64_t sub_21FFC4238()
{
  return MEMORY[0x24BDEDDF0]();
}

uint64_t sub_21FFC4244()
{
  return MEMORY[0x24BDEDE38]();
}

uint64_t sub_21FFC4250()
{
  return MEMORY[0x24BDEDE40]();
}

uint64_t sub_21FFC425C()
{
  return MEMORY[0x24BDEDE58]();
}

uint64_t sub_21FFC4268()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_21FFC4274()
{
  return MEMORY[0x24BDFC1E8]();
}

uint64_t sub_21FFC4280()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_21FFC428C()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_21FFC4298()
{
  return MEMORY[0x24BDEDF20]();
}

uint64_t sub_21FFC42A4()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_21FFC42B0()
{
  return MEMORY[0x24BDEDF98]();
}

uint64_t sub_21FFC42BC()
{
  return MEMORY[0x24BDEDFB0]();
}

uint64_t sub_21FFC42C8()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_21FFC42D4()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t sub_21FFC42E0()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_21FFC42EC()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_21FFC42F8()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_21FFC4304()
{
  return MEMORY[0x24BDEE080]();
}

uint64_t sub_21FFC4310()
{
  return MEMORY[0x24BDEE0D0]();
}

uint64_t sub_21FFC431C()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_21FFC4328()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_21FFC4334()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_21FFC4340()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_21FFC434C()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_21FFC4358()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_21FFC4364()
{
  return MEMORY[0x24BDEE4C0]();
}

uint64_t sub_21FFC4370()
{
  return MEMORY[0x24BDEE4D8]();
}

uint64_t sub_21FFC437C()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_21FFC4388()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_21FFC4394()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_21FFC43A0()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_21FFC43AC()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_21FFC43B8()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_21FFC43C4()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_21FFC43D0()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_21FFC43DC()
{
  return MEMORY[0x24BDEE8B8]();
}

uint64_t sub_21FFC43E8()
{
  return MEMORY[0x24BDEEA08]();
}

uint64_t sub_21FFC43F4()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_21FFC4400()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_21FFC440C()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_21FFC4418()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_21FFC4424()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_21FFC4430()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_21FFC443C()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_21FFC4448()
{
  return MEMORY[0x24BDEEBF0]();
}

uint64_t sub_21FFC4454()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_21FFC4460()
{
  return MEMORY[0x24BDEEEC0]();
}

uint64_t sub_21FFC446C()
{
  return MEMORY[0x24BDEEEC8]();
}

uint64_t sub_21FFC4478()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_21FFC4484()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_21FFC4490()
{
  return MEMORY[0x24BDEEF80]();
}

uint64_t sub_21FFC449C()
{
  return MEMORY[0x24BDEF158]();
}

uint64_t sub_21FFC44A8()
{
  return MEMORY[0x24BDEF168]();
}

uint64_t sub_21FFC44B4()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_21FFC44C0()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_21FFC44CC()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_21FFC44D8()
{
  return MEMORY[0x24BDEF428]();
}

uint64_t sub_21FFC44E4()
{
  return MEMORY[0x24BDEF610]();
}

uint64_t sub_21FFC44F0()
{
  return MEMORY[0x24BDEF618]();
}

uint64_t sub_21FFC44FC()
{
  return MEMORY[0x24BDEF620]();
}

uint64_t sub_21FFC4508()
{
  return MEMORY[0x24BDEF628]();
}

uint64_t sub_21FFC4514()
{
  return MEMORY[0x24BDEF648]();
}

uint64_t sub_21FFC4520()
{
  return MEMORY[0x24BDEF6A8]();
}

uint64_t sub_21FFC452C()
{
  return MEMORY[0x24BDEF6B0]();
}

uint64_t sub_21FFC4538()
{
  return MEMORY[0x24BDEF710]();
}

uint64_t sub_21FFC4544()
{
  return MEMORY[0x24BDEF718]();
}

uint64_t sub_21FFC4550()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_21FFC455C()
{
  return MEMORY[0x24BDEF8C0]();
}

uint64_t sub_21FFC4568()
{
  return MEMORY[0x24BDEF8D0]();
}

uint64_t sub_21FFC4574()
{
  return MEMORY[0x24BDEF950]();
}

uint64_t sub_21FFC4580()
{
  return MEMORY[0x24BDEF998]();
}

uint64_t sub_21FFC458C()
{
  return MEMORY[0x24BDEFB50]();
}

uint64_t sub_21FFC4598()
{
  return MEMORY[0x24BDEFBF0]();
}

uint64_t sub_21FFC45A4()
{
  return MEMORY[0x24BDEFC00]();
}

uint64_t sub_21FFC45B0()
{
  return MEMORY[0x24BDEFCB8]();
}

uint64_t sub_21FFC45BC()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_21FFC45C8()
{
  return MEMORY[0x24BDF0158]();
}

uint64_t sub_21FFC45D4()
{
  return MEMORY[0x24BDF0200]();
}

uint64_t sub_21FFC45E0()
{
  return MEMORY[0x24BDF0210]();
}

uint64_t sub_21FFC45EC()
{
  return MEMORY[0x24BDF0220]();
}

uint64_t sub_21FFC45F8()
{
  return MEMORY[0x24BDF0230]();
}

uint64_t sub_21FFC4604()
{
  return MEMORY[0x24BDF0238]();
}

uint64_t sub_21FFC4610()
{
  return MEMORY[0x24BDF02E8]();
}

uint64_t sub_21FFC461C()
{
  return MEMORY[0x24BDF02F8]();
}

uint64_t sub_21FFC4628()
{
  return MEMORY[0x24BDF0348]();
}

uint64_t sub_21FFC4634()
{
  return MEMORY[0x24BDF0350]();
}

uint64_t sub_21FFC4640()
{
  return MEMORY[0x24BDF0440]();
}

uint64_t sub_21FFC464C()
{
  return MEMORY[0x24BDF0468]();
}

uint64_t sub_21FFC4658()
{
  return MEMORY[0x24BDF07B8]();
}

uint64_t sub_21FFC4664()
{
  return MEMORY[0x24BDF07C8]();
}

uint64_t sub_21FFC4670()
{
  return MEMORY[0x24BDF0C98]();
}

uint64_t sub_21FFC467C()
{
  return MEMORY[0x24BDF0CB0]();
}

uint64_t sub_21FFC4688()
{
  return MEMORY[0x24BDF0D00]();
}

uint64_t sub_21FFC4694()
{
  return MEMORY[0x24BDF0D10]();
}

uint64_t sub_21FFC46A0()
{
  return MEMORY[0x24BDF0D18]();
}

uint64_t sub_21FFC46AC()
{
  return MEMORY[0x24BDF0FD0]();
}

uint64_t sub_21FFC46B8()
{
  return MEMORY[0x24BDF1008]();
}

uint64_t sub_21FFC46C4()
{
  return MEMORY[0x24BDF10D8]();
}

uint64_t sub_21FFC46D0()
{
  return MEMORY[0x24BDF10E0]();
}

uint64_t sub_21FFC46DC()
{
  return MEMORY[0x24BDF10E8]();
}

uint64_t sub_21FFC46E8()
{
  return MEMORY[0x24BDF10F8]();
}

uint64_t sub_21FFC46F4()
{
  return MEMORY[0x24BDF12F8]();
}

uint64_t sub_21FFC4700()
{
  return MEMORY[0x24BDF1300]();
}

uint64_t sub_21FFC470C()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_21FFC4718()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_21FFC4724()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_21FFC4730()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_21FFC473C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_21FFC4748()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_21FFC4754()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_21FFC4760()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_21FFC476C()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_21FFC4778()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_21FFC4784()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_21FFC4790()
{
  return MEMORY[0x24BDF15E8]();
}

uint64_t sub_21FFC479C()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_21FFC47A8()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_21FFC47B4()
{
  return MEMORY[0x24BDF1608]();
}

uint64_t sub_21FFC47C0()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_21FFC47CC()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_21FFC47D8()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_21FFC47E4()
{
  return MEMORY[0x24BDF16D0]();
}

uint64_t sub_21FFC47F0()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_21FFC47FC()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_21FFC4808()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_21FFC4814()
{
  return MEMORY[0x24BDF1768]();
}

uint64_t sub_21FFC4820()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_21FFC482C()
{
  return MEMORY[0x24BDF1820]();
}

uint64_t sub_21FFC4838()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_21FFC4844()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_21FFC4850()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_21FFC485C()
{
  return MEMORY[0x24BDF1A68]();
}

uint64_t sub_21FFC4868()
{
  return MEMORY[0x24BDF1CF0]();
}

uint64_t sub_21FFC4874()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_21FFC4880()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_21FFC488C()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_21FFC4898()
{
  return MEMORY[0x24BDF1DB8]();
}

uint64_t sub_21FFC48A4()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_21FFC48B0()
{
  return MEMORY[0x24BDF1E80]();
}

uint64_t sub_21FFC48BC()
{
  return MEMORY[0x24BDF1E88]();
}

uint64_t sub_21FFC48C8()
{
  return MEMORY[0x24BDF1E98]();
}

uint64_t sub_21FFC48D4()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_21FFC48E0()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_21FFC48EC()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_21FFC48F8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_21FFC4904()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_21FFC4910()
{
  return MEMORY[0x24BDF20B0]();
}

uint64_t sub_21FFC491C()
{
  return MEMORY[0x24BDF20E8]();
}

uint64_t sub_21FFC4928()
{
  return MEMORY[0x24BDF20F0]();
}

uint64_t sub_21FFC4934()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_21FFC4940()
{
  return MEMORY[0x24BDF2170]();
}

uint64_t sub_21FFC494C()
{
  return MEMORY[0x24BDF2218]();
}

uint64_t sub_21FFC4958()
{
  return MEMORY[0x24BDF2248]();
}

uint64_t sub_21FFC4964()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_21FFC4970()
{
  return MEMORY[0x24BDF22C8]();
}

uint64_t sub_21FFC497C()
{
  return MEMORY[0x24BDF2348]();
}

uint64_t sub_21FFC4988()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_21FFC4994()
{
  return MEMORY[0x24BDF2378]();
}

uint64_t sub_21FFC49A0()
{
  return MEMORY[0x24BDF23E0]();
}

uint64_t sub_21FFC49AC()
{
  return MEMORY[0x24BDF2410]();
}

uint64_t sub_21FFC49B8()
{
  return MEMORY[0x24BDF2440]();
}

uint64_t sub_21FFC49C4()
{
  return MEMORY[0x24BDF2470]();
}

uint64_t sub_21FFC49D0()
{
  return MEMORY[0x24BDF24A8]();
}

uint64_t sub_21FFC49DC()
{
  return MEMORY[0x24BDF24D0]();
}

uint64_t sub_21FFC49E8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_21FFC49F4()
{
  return MEMORY[0x24BDF27A8]();
}

uint64_t sub_21FFC4A00()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_21FFC4A0C()
{
  return MEMORY[0x24BDF2858]();
}

uint64_t sub_21FFC4A18()
{
  return MEMORY[0x24BDF28B8]();
}

uint64_t sub_21FFC4A24()
{
  return MEMORY[0x24BDF2A70]();
}

uint64_t sub_21FFC4A30()
{
  return MEMORY[0x24BDF2AF0]();
}

uint64_t sub_21FFC4A3C()
{
  return MEMORY[0x24BDF2B00]();
}

uint64_t sub_21FFC4A48()
{
  return MEMORY[0x24BDF2C40]();
}

uint64_t sub_21FFC4A54()
{
  return MEMORY[0x24BDF2C48]();
}

uint64_t sub_21FFC4A60()
{
  return MEMORY[0x24BDF2D50]();
}

uint64_t sub_21FFC4A6C()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_21FFC4A78()
{
  return MEMORY[0x24BDF2FF8]();
}

uint64_t sub_21FFC4A84()
{
  return MEMORY[0x24BDF3020]();
}

uint64_t sub_21FFC4A90()
{
  return MEMORY[0x24BDF3088]();
}

uint64_t sub_21FFC4A9C()
{
  return MEMORY[0x24BDF31C8]();
}

uint64_t sub_21FFC4AA8()
{
  return MEMORY[0x24BDF32E8]();
}

uint64_t sub_21FFC4AB4()
{
  return MEMORY[0x24BDF3320]();
}

uint64_t sub_21FFC4AC0()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_21FFC4ACC()
{
  return MEMORY[0x24BDF3408]();
}

uint64_t sub_21FFC4AD8()
{
  return MEMORY[0x24BDF3418]();
}

uint64_t sub_21FFC4AE4()
{
  return MEMORY[0x24BDF34D0]();
}

uint64_t sub_21FFC4AF0()
{
  return MEMORY[0x24BDF35B0]();
}

uint64_t sub_21FFC4AFC()
{
  return MEMORY[0x24BDF3628]();
}

uint64_t sub_21FFC4B08()
{
  return MEMORY[0x24BDF3630]();
}

uint64_t sub_21FFC4B14()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_21FFC4B20()
{
  return MEMORY[0x24BDF3768]();
}

uint64_t sub_21FFC4B2C()
{
  return MEMORY[0x24BDF37B0]();
}

uint64_t sub_21FFC4B38()
{
  return MEMORY[0x24BDF37C8]();
}

uint64_t sub_21FFC4B44()
{
  return MEMORY[0x24BDF37D0]();
}

uint64_t sub_21FFC4B50()
{
  return MEMORY[0x24BDF37E0]();
}

uint64_t sub_21FFC4B5C()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_21FFC4B68()
{
  return MEMORY[0x24BDF3890]();
}

uint64_t sub_21FFC4B74()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_21FFC4B80()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_21FFC4B8C()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_21FFC4B98()
{
  return MEMORY[0x24BDF3900]();
}

uint64_t sub_21FFC4BA4()
{
  return MEMORY[0x24BDF3920]();
}

uint64_t sub_21FFC4BB0()
{
  return MEMORY[0x24BDF3970]();
}

uint64_t sub_21FFC4BBC()
{
  return MEMORY[0x24BDF3A40]();
}

uint64_t sub_21FFC4BC8()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_21FFC4BD4()
{
  return MEMORY[0x24BDF3C50]();
}

uint64_t sub_21FFC4BE0()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_21FFC4BEC()
{
  return MEMORY[0x24BDF3CB8]();
}

uint64_t sub_21FFC4BF8()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_21FFC4C04()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_21FFC4C10()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_21FFC4C1C()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_21FFC4C28()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_21FFC4C34()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_21FFC4C40()
{
  return MEMORY[0x24BDF3E88]();
}

uint64_t sub_21FFC4C4C()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_21FFC4C58()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_21FFC4C64()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_21FFC4C70()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_21FFC4C7C()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_21FFC4C88()
{
  return MEMORY[0x24BDF40A0]();
}

uint64_t sub_21FFC4C94()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_21FFC4CA0()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_21FFC4CAC()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_21FFC4CB8()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_21FFC4CC4()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_21FFC4CD0()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_21FFC4CDC()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_21FFC4CE8()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_21FFC4CF4()
{
  return MEMORY[0x24BDF4330]();
}

uint64_t sub_21FFC4D00()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_21FFC4D0C()
{
  return MEMORY[0x24BDF4368]();
}

uint64_t sub_21FFC4D18()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_21FFC4D24()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_21FFC4D30()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_21FFC4D3C()
{
  return MEMORY[0x24BDF4550]();
}

uint64_t sub_21FFC4D48()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_21FFC4D54()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_21FFC4D60()
{
  return MEMORY[0x24BDF4728]();
}

uint64_t sub_21FFC4D6C()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_21FFC4D78()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_21FFC4D84()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_21FFC4D90()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_21FFC4D9C()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_21FFC4DA8()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_21FFC4DB4()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_21FFC4DC0()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_21FFC4DCC()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_21FFC4DD8()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_21FFC4DE4()
{
  return MEMORY[0x24BDF49C8]();
}

uint64_t sub_21FFC4DF0()
{
  return MEMORY[0x24BDF4A28]();
}

uint64_t sub_21FFC4DFC()
{
  return MEMORY[0x24BDF4D48]();
}

uint64_t sub_21FFC4E08()
{
  return MEMORY[0x24BDF4D58]();
}

uint64_t sub_21FFC4E14()
{
  return MEMORY[0x24BDF4D80]();
}

uint64_t sub_21FFC4E20()
{
  return MEMORY[0x24BDF4E00]();
}

uint64_t sub_21FFC4E2C()
{
  return MEMORY[0x24BDF4E30]();
}

uint64_t sub_21FFC4E38()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_21FFC4E44()
{
  return MEMORY[0x24BDF4F00]();
}

uint64_t sub_21FFC4E50()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_21FFC4E5C()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_21FFC4E68()
{
  return MEMORY[0x24BDF4F38]();
}

uint64_t sub_21FFC4E74()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_21FFC4E80()
{
  return MEMORY[0x24BDF51A0]();
}

uint64_t sub_21FFC4E8C()
{
  return MEMORY[0x24BDF51A8]();
}

uint64_t sub_21FFC4E98()
{
  return MEMORY[0x24BDF51B8]();
}

uint64_t sub_21FFC4EA4()
{
  return MEMORY[0x24BDF51E8]();
}

uint64_t sub_21FFC4EB0()
{
  return MEMORY[0x24BDF51F0]();
}

uint64_t sub_21FFC4EBC()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_21FFC4EC8()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_21FFC4ED4()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_21FFC4EE0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21FFC4EEC()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_21FFC4EF8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21FFC4F04()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21FFC4F10()
{
  return MEMORY[0x24BDDE788]();
}

uint64_t sub_21FFC4F1C()
{
  return MEMORY[0x24BDDE798]();
}

uint64_t sub_21FFC4F28()
{
  return MEMORY[0x24BDDE7A0]();
}

uint64_t sub_21FFC4F34()
{
  return MEMORY[0x24BDDE7A8]();
}

uint64_t sub_21FFC4F40()
{
  return MEMORY[0x24BDDE7B0]();
}

uint64_t sub_21FFC4F4C()
{
  return MEMORY[0x24BDDE7B8]();
}

uint64_t sub_21FFC4F58()
{
  return MEMORY[0x24BDDE7C0]();
}

uint64_t sub_21FFC4F64()
{
  return MEMORY[0x24BDDE7C8]();
}

uint64_t sub_21FFC4F70()
{
  return MEMORY[0x24BDDE7D0]();
}

uint64_t sub_21FFC4F7C()
{
  return MEMORY[0x24BDDE7D8]();
}

uint64_t sub_21FFC4F88()
{
  return MEMORY[0x24BDDE7E0]();
}

uint64_t sub_21FFC4F94()
{
  return MEMORY[0x24BDDE7E8]();
}

uint64_t sub_21FFC4FA0()
{
  return MEMORY[0x24BDDE7F0]();
}

uint64_t sub_21FFC4FAC()
{
  return MEMORY[0x24BDDE7F8]();
}

uint64_t sub_21FFC4FB8()
{
  return MEMORY[0x24BDDE800]();
}

uint64_t sub_21FFC4FC4()
{
  return MEMORY[0x24BDDE808]();
}

uint64_t sub_21FFC4FD0()
{
  return MEMORY[0x24BDDE8A0]();
}

uint64_t sub_21FFC4FDC()
{
  return MEMORY[0x24BDDE980]();
}

uint64_t sub_21FFC4FE8()
{
  return MEMORY[0x24BDDE9C0]();
}

uint64_t sub_21FFC4FF4()
{
  return MEMORY[0x24BDDEA80]();
}

uint64_t sub_21FFC5000()
{
  return MEMORY[0x24BDDEA88]();
}

uint64_t sub_21FFC500C()
{
  return MEMORY[0x24BDDEA90]();
}

uint64_t sub_21FFC5018()
{
  return MEMORY[0x24BDDEA98]();
}

uint64_t sub_21FFC5024()
{
  return MEMORY[0x24BDDEAA0]();
}

uint64_t sub_21FFC5030()
{
  return MEMORY[0x24BDDEAB0]();
}

uint64_t sub_21FFC503C()
{
  return MEMORY[0x24BDDEAC0]();
}

uint64_t sub_21FFC5048()
{
  return MEMORY[0x24BDDEB08]();
}

uint64_t sub_21FFC5054()
{
  return MEMORY[0x24BE6A738]();
}

uint64_t sub_21FFC5060()
{
  return MEMORY[0x24BE6A740]();
}

uint64_t sub_21FFC506C()
{
  return MEMORY[0x24BE6A748]();
}

uint64_t sub_21FFC5078()
{
  return MEMORY[0x24BE6A750]();
}

uint64_t sub_21FFC5084()
{
  return MEMORY[0x24BE6A758]();
}

uint64_t sub_21FFC5090()
{
  return MEMORY[0x24BDDEB48]();
}

uint64_t sub_21FFC509C()
{
  return MEMORY[0x24BDDEB50]();
}

uint64_t sub_21FFC50A8()
{
  return MEMORY[0x24BDDEB58]();
}

uint64_t sub_21FFC50B4()
{
  return MEMORY[0x24BDDEB60]();
}

uint64_t sub_21FFC50C0()
{
  return MEMORY[0x24BDDEB68]();
}

uint64_t sub_21FFC50CC()
{
  return MEMORY[0x24BDDEB78]();
}

uint64_t sub_21FFC50D8()
{
  return MEMORY[0x24BDDEB88]();
}

uint64_t sub_21FFC50E4()
{
  return MEMORY[0x24BDDEB90]();
}

uint64_t sub_21FFC50F0()
{
  return MEMORY[0x24BDDEBB0]();
}

uint64_t sub_21FFC50FC()
{
  return MEMORY[0x24BDDEBC0]();
}

uint64_t sub_21FFC5108()
{
  return MEMORY[0x24BDDEBC8]();
}

uint64_t sub_21FFC5114()
{
  return MEMORY[0x24BDDEBF8]();
}

uint64_t sub_21FFC5120()
{
  return MEMORY[0x24BE6A788]();
}

uint64_t sub_21FFC512C()
{
  return MEMORY[0x24BDDEC08]();
}

uint64_t sub_21FFC5138()
{
  return MEMORY[0x24BDDEC10]();
}

uint64_t sub_21FFC5144()
{
  return MEMORY[0x24BDDEC20]();
}

uint64_t sub_21FFC5150()
{
  return MEMORY[0x24BDDEC30]();
}

uint64_t sub_21FFC515C()
{
  return MEMORY[0x24BE6A798]();
}

uint64_t sub_21FFC5168()
{
  return MEMORY[0x24BDDEC40]();
}

uint64_t sub_21FFC5174()
{
  return MEMORY[0x24BDDEC48]();
}

uint64_t sub_21FFC5180()
{
  return MEMORY[0x24BDDEC58]();
}

uint64_t sub_21FFC518C()
{
  return MEMORY[0x24BDDEC70]();
}

uint64_t sub_21FFC5198()
{
  return MEMORY[0x24BDDEC78]();
}

uint64_t sub_21FFC51A4()
{
  return MEMORY[0x24BDDEC88]();
}

uint64_t sub_21FFC51B0()
{
  return MEMORY[0x24BDDEC98]();
}

uint64_t sub_21FFC51BC()
{
  return MEMORY[0x24BDDECA0]();
}

uint64_t sub_21FFC51C8()
{
  return MEMORY[0x24BDDECA8]();
}

uint64_t sub_21FFC51D4()
{
  return MEMORY[0x24BDDECD0]();
}

uint64_t sub_21FFC51E0()
{
  return MEMORY[0x24BDDECE0]();
}

uint64_t sub_21FFC51EC()
{
  return MEMORY[0x24BE6A7B0]();
}

uint64_t sub_21FFC51F8()
{
  return MEMORY[0x24BDDED18]();
}

uint64_t sub_21FFC5204()
{
  return MEMORY[0x24BDDED20]();
}

uint64_t sub_21FFC5210()
{
  return MEMORY[0x24BDDED30]();
}

uint64_t sub_21FFC521C()
{
  return MEMORY[0x24BDDED38]();
}

uint64_t sub_21FFC5228()
{
  return MEMORY[0x24BDDED40]();
}

uint64_t sub_21FFC5234()
{
  return MEMORY[0x24BDDED48]();
}

uint64_t sub_21FFC5240()
{
  return MEMORY[0x24BDDED68]();
}

uint64_t sub_21FFC524C()
{
  return MEMORY[0x24BDDED70]();
}

uint64_t sub_21FFC5258()
{
  return MEMORY[0x24BDDED78]();
}

uint64_t sub_21FFC5264()
{
  return MEMORY[0x24BE6A7B8]();
}

uint64_t sub_21FFC5270()
{
  return MEMORY[0x24BE6A7C8]();
}

uint64_t sub_21FFC527C()
{
  return MEMORY[0x24BDDED98]();
}

uint64_t sub_21FFC5288()
{
  return MEMORY[0x24BDDEDC8]();
}

uint64_t sub_21FFC5294()
{
  return MEMORY[0x24BE6A7E8]();
}

uint64_t sub_21FFC52A0()
{
  return MEMORY[0x24BDDEE48]();
}

uint64_t sub_21FFC52AC()
{
  return MEMORY[0x24BE6A900]();
}

uint64_t sub_21FFC52B8()
{
  return MEMORY[0x24BE6AA78]();
}

uint64_t sub_21FFC52C4()
{
  return MEMORY[0x24BE6AB20]();
}

uint64_t sub_21FFC52D0()
{
  return MEMORY[0x24BDDEEE8]();
}

uint64_t sub_21FFC52DC()
{
  return MEMORY[0x24BDDEEF0]();
}

uint64_t sub_21FFC52E8()
{
  return MEMORY[0x24BDDEF68]();
}

uint64_t sub_21FFC52F4()
{
  return MEMORY[0x24BDDEFF0]();
}

uint64_t sub_21FFC5300()
{
  return MEMORY[0x24BDDEFF8]();
}

uint64_t sub_21FFC530C()
{
  return MEMORY[0x24BDDF000]();
}

uint64_t sub_21FFC5318()
{
  return MEMORY[0x24BDDF0C0]();
}

uint64_t sub_21FFC5324()
{
  return MEMORY[0x24BDDF0C8]();
}

uint64_t sub_21FFC5330()
{
  return MEMORY[0x24BDDF0D0]();
}

uint64_t sub_21FFC533C()
{
  return MEMORY[0x24BDDF0D8]();
}

uint64_t sub_21FFC5348()
{
  return MEMORY[0x24BDDF0E0]();
}

uint64_t sub_21FFC5354()
{
  return MEMORY[0x24BDDF0F0]();
}

uint64_t sub_21FFC5360()
{
  return MEMORY[0x24BDDF118]();
}

uint64_t sub_21FFC536C()
{
  return MEMORY[0x24BDDF168]();
}

uint64_t sub_21FFC5378()
{
  return MEMORY[0x24BDDF1A8]();
}

uint64_t sub_21FFC5384()
{
  return MEMORY[0x24BDDF1B0]();
}

uint64_t sub_21FFC5390()
{
  return MEMORY[0x24BDDF1C0]();
}

uint64_t sub_21FFC539C()
{
  return MEMORY[0x24BDDF1C8]();
}

uint64_t sub_21FFC53A8()
{
  return MEMORY[0x24BDDF1E8]();
}

uint64_t sub_21FFC53B4()
{
  return MEMORY[0x24BDDF1F0]();
}

uint64_t sub_21FFC53C0()
{
  return MEMORY[0x24BDDF218]();
}

uint64_t sub_21FFC53CC()
{
  return MEMORY[0x24BDDF220]();
}

uint64_t sub_21FFC53D8()
{
  return MEMORY[0x24BDDF228]();
}

uint64_t sub_21FFC53E4()
{
  return MEMORY[0x24BDDF230]();
}

uint64_t sub_21FFC53F0()
{
  return MEMORY[0x24BE6AC78]();
}

uint64_t sub_21FFC53FC()
{
  return MEMORY[0x24BE6AC88]();
}

uint64_t sub_21FFC5408()
{
  return MEMORY[0x24BDDF400]();
}

uint64_t sub_21FFC5414()
{
  return MEMORY[0x24BDDF420]();
}

uint64_t sub_21FFC5420()
{
  return MEMORY[0x24BDDF430]();
}

uint64_t sub_21FFC542C()
{
  return MEMORY[0x24BDDF450]();
}

uint64_t sub_21FFC5438()
{
  return MEMORY[0x24BDDF460]();
}

uint64_t sub_21FFC5444()
{
  return MEMORY[0x24BDDF500]();
}

uint64_t sub_21FFC5450()
{
  return MEMORY[0x24BE6ACD0]();
}

uint64_t sub_21FFC545C()
{
  return MEMORY[0x24BE6ACD8]();
}

uint64_t sub_21FFC5468()
{
  return MEMORY[0x24BDDF548]();
}

uint64_t sub_21FFC5474()
{
  return MEMORY[0x24BDDF550]();
}

uint64_t sub_21FFC5480()
{
  return MEMORY[0x24BDDF578]();
}

uint64_t sub_21FFC548C()
{
  return MEMORY[0x24BDDF5B8]();
}

uint64_t sub_21FFC5498()
{
  return MEMORY[0x24BDDF5C0]();
}

uint64_t sub_21FFC54A4()
{
  return MEMORY[0x24BDDF618]();
}

uint64_t sub_21FFC54B0()
{
  return MEMORY[0x24BDDF6A8]();
}

uint64_t sub_21FFC54BC()
{
  return MEMORY[0x24BDDF718]();
}

uint64_t sub_21FFC54C8()
{
  return MEMORY[0x24BDDF740]();
}

uint64_t sub_21FFC54D4()
{
  return MEMORY[0x24BDDF748]();
}

uint64_t sub_21FFC54E0()
{
  return MEMORY[0x24BDDF750]();
}

uint64_t sub_21FFC54EC()
{
  return MEMORY[0x24BDDF758]();
}

uint64_t sub_21FFC54F8()
{
  return MEMORY[0x24BDDF760]();
}

uint64_t sub_21FFC5504()
{
  return MEMORY[0x24BDDF768]();
}

uint64_t sub_21FFC5510()
{
  return MEMORY[0x24BDDF788]();
}

uint64_t sub_21FFC551C()
{
  return MEMORY[0x24BDDF790]();
}

uint64_t sub_21FFC5528()
{
  return MEMORY[0x24BDDF798]();
}

uint64_t sub_21FFC5534()
{
  return MEMORY[0x24BDDF7A8]();
}

uint64_t sub_21FFC5540()
{
  return MEMORY[0x24BDDF7B0]();
}

uint64_t sub_21FFC554C()
{
  return MEMORY[0x24BDDF7E0]();
}

uint64_t sub_21FFC5558()
{
  return MEMORY[0x24BDFC1F8]();
}

uint64_t sub_21FFC5564()
{
  return MEMORY[0x24BDFC230]();
}

uint64_t sub_21FFC5570()
{
  return MEMORY[0x24BDDF820]();
}

uint64_t sub_21FFC557C()
{
  return MEMORY[0x24BDDF828]();
}

uint64_t sub_21FFC5588()
{
  return MEMORY[0x24BE6AD68]();
}

uint64_t sub_21FFC5594()
{
  return MEMORY[0x24BE6AD70]();
}

uint64_t sub_21FFC55A0()
{
  return MEMORY[0x24BE6AD80]();
}

uint64_t sub_21FFC55AC()
{
  return MEMORY[0x24BE6ADA0]();
}

uint64_t sub_21FFC55B8()
{
  return MEMORY[0x24BE6ADA8]();
}

uint64_t sub_21FFC55C4()
{
  return MEMORY[0x24BE6ADC8]();
}

uint64_t sub_21FFC55D0()
{
  return MEMORY[0x24BE6ADD8]();
}

uint64_t sub_21FFC55DC()
{
  return MEMORY[0x24BDDF830]();
}

uint64_t sub_21FFC55E8()
{
  return MEMORY[0x24BDDF858]();
}

uint64_t sub_21FFC55F4()
{
  return MEMORY[0x24BDDF868]();
}

uint64_t sub_21FFC5600()
{
  return MEMORY[0x24BDDF870]();
}

uint64_t sub_21FFC560C()
{
  return MEMORY[0x24BDDF878]();
}

uint64_t sub_21FFC5618()
{
  return MEMORY[0x24BDDF880]();
}

uint64_t sub_21FFC5624()
{
  return MEMORY[0x24BDDF890]();
}

uint64_t sub_21FFC5630()
{
  return MEMORY[0x24BDDF898]();
}

uint64_t sub_21FFC563C()
{
  return MEMORY[0x24BE6AEE8]();
}

uint64_t sub_21FFC5648()
{
  return MEMORY[0x24BE6AF30]();
}

uint64_t sub_21FFC5654()
{
  return MEMORY[0x24BE6AF48]();
}

uint64_t sub_21FFC5660()
{
  return MEMORY[0x24BE6AF70]();
}

uint64_t sub_21FFC566C()
{
  return MEMORY[0x24BE6AFB0]();
}

uint64_t sub_21FFC5678()
{
  return MEMORY[0x24BE6AFC0]();
}

uint64_t sub_21FFC5684()
{
  return MEMORY[0x24BDDF9C8]();
}

uint64_t sub_21FFC5690()
{
  return MEMORY[0x24BDDFA28]();
}

uint64_t sub_21FFC569C()
{
  return MEMORY[0x24BE6B018]();
}

uint64_t sub_21FFC56A8()
{
  return MEMORY[0x24BE6B030]();
}

uint64_t sub_21FFC56B4()
{
  return MEMORY[0x24BE6B038]();
}

uint64_t sub_21FFC56C0()
{
  return MEMORY[0x24BDDFA48]();
}

uint64_t sub_21FFC56CC()
{
  return MEMORY[0x24BDDFAA8]();
}

uint64_t sub_21FFC56D8()
{
  return MEMORY[0x24BDDFAD0]();
}

uint64_t sub_21FFC56E4()
{
  return MEMORY[0x24BDDFAF0]();
}

uint64_t sub_21FFC56F0()
{
  return MEMORY[0x24BDDFB00]();
}

uint64_t sub_21FFC56FC()
{
  return MEMORY[0x24BDDFB58]();
}

uint64_t sub_21FFC5708()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_21FFC5714()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21FFC5720()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21FFC572C()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_21FFC5738()
{
  return MEMORY[0x24BEE0740]();
}

uint64_t sub_21FFC5744()
{
  return MEMORY[0x24BEE0780]();
}

uint64_t sub_21FFC5750()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_21FFC575C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21FFC5768()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_21FFC5774()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_21FFC5780()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_21FFC578C()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_21FFC5798()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_21FFC57A4()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_21FFC57B0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21FFC57BC()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_21FFC57C8()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_21FFC57D4()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_21FFC57E0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21FFC57EC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21FFC57F8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21FFC5804()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21FFC5810()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_21FFC581C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21FFC5828()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_21FFC5834()
{
  return MEMORY[0x24BEE0E00]();
}

uint64_t sub_21FFC5840()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_21FFC584C()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t sub_21FFC5858()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_21FFC5864()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_21FFC5870()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_21FFC587C()
{
  return MEMORY[0x24BEE1118]();
}

uint64_t sub_21FFC5888()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21FFC5894()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_21FFC58A0()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_21FFC58AC()
{
  return MEMORY[0x24BEE1170]();
}

uint64_t sub_21FFC58B8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_21FFC58C4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21FFC58D0()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_21FFC58DC()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_21FFC58E8()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_21FFC58F4()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_21FFC5900()
{
  return MEMORY[0x24BEE1230]();
}

uint64_t sub_21FFC590C()
{
  return MEMORY[0x24BEE1240]();
}

uint64_t sub_21FFC5918()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21FFC5924()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_21FFC5930()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21FFC593C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_21FFC5948()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_21FFC5954()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21FFC5960()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_21FFC596C()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_21FFC5978()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21FFC5984()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21FFC5990()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_21FFC599C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21FFC59A8()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_21FFC59B4()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_21FFC59C0()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t sub_21FFC59CC()
{
  return MEMORY[0x24BEE1908]();
}

uint64_t sub_21FFC59D8()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_21FFC59E4()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_21FFC59F0()
{
  return MEMORY[0x24BEE1978]();
}

uint64_t sub_21FFC59FC()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_21FFC5A08()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_21FFC5A14()
{
  return MEMORY[0x24BEE1A00]();
}

uint64_t sub_21FFC5A20()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_21FFC5A2C()
{
  return MEMORY[0x24BEE1B28]();
}

uint64_t sub_21FFC5A38()
{
  return MEMORY[0x24BDCFED8]();
}

uint64_t sub_21FFC5A44()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21FFC5A50()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_21FFC5A5C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21FFC5A68()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21FFC5A74()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21FFC5A80()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_21FFC5A8C()
{
  return MEMORY[0x24BEDF468]();
}

uint64_t sub_21FFC5A98()
{
  return MEMORY[0x24BEE5320]();
}

uint64_t sub_21FFC5AA4()
{
  return MEMORY[0x24BEE5328]();
}

uint64_t sub_21FFC5AB0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21FFC5ABC()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_21FFC5AC8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21FFC5AD4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21FFC5AE0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21FFC5AEC()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_21FFC5AF8()
{
  return MEMORY[0x24BDD05D0]();
}

uint64_t sub_21FFC5B04()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21FFC5B10()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21FFC5B1C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21FFC5B28()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_21FFC5B34()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21FFC5B40()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21FFC5B4C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21FFC5B58()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21FFC5B64()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_21FFC5B70()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21FFC5B7C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21FFC5B88()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_21FFC5B94()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_21FFC5BA0()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_21FFC5BAC()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_21FFC5BB8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21FFC5BC4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21FFC5BD0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21FFC5BDC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21FFC5BE8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21FFC5BF4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21FFC5C00()
{
  return MEMORY[0x24BEE3280]();
}

uint64_t sub_21FFC5C0C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21FFC5C18()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_21FFC5C24()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_21FFC5C30()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_21FFC5C3C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_21FFC5C48()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_21FFC5C54()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21FFC5C60()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_21FFC5C6C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21FFC5C78()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_21FFC5C84()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_21FFC5C90()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21FFC5C9C()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_21FFC5CA8()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_21FFC5CB4()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21FFC5CC0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21FFC5CCC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21FFC5CD8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21FFC5CE4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21FFC5CF0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21FFC5CFC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21FFC5D08()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_21FFC5D14()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_21FFC5D20()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21FFC5D2C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21FFC5D38()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21FFC5D44()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21FFC5D50()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_21FFC5D5C()
{
  return MEMORY[0x24BEE4A18]();
}

uint64_t sub_21FFC5D68()
{
  return MEMORY[0x24BEE4A98]();
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAA8](red, green, blue, alpha);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

