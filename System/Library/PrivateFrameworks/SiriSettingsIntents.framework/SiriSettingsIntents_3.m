uint64_t sub_220693960(uint64_t a1, char a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 64) = v4;
  *(_QWORD *)(v5 + 56) = a4;
  *(_BYTE *)(v5 + 106) = a3 & 1;
  *(_BYTE *)(v5 + 105) = a2;
  *(_QWORD *)(v5 + 48) = a1;
  *(_QWORD *)(v5 + 16) = v5;
  *(_QWORD *)(v5 + 24) = 0;
  *(_BYTE *)(v5 + 104) = 0;
  *(_BYTE *)(v5 + 112) = 0;
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 40) = 0;
  *(_QWORD *)(v5 + 24) = a1;
  *(_BYTE *)(v5 + 104) = a2;
  *(_BYTE *)(v5 + 112) = a3 & 1;
  *(_QWORD *)(v5 + 32) = a4;
  *(_QWORD *)(v5 + 40) = v4;
  return swift_task_switch();
}

uint64_t sub_2206939E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  char v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;

  v21 = v0[6];
  v0[2] = v0;
  v18 = sub_2206DAC30();
  v19 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v20 = v2;
  *v2 = sub_2206DAC30();
  v20[1] = v3;
  swift_retain();
  if (v21)
  {
    v16 = *(_QWORD *)(v17 + 48);
    v20[5] = type metadata accessor for SettingsMultiSetting();
    v20[2] = v16;
  }
  else
  {
    v20[2] = 0;
    v20[3] = 0;
    v20[4] = 0;
    v20[5] = 0;
  }
  v15 = *(unsigned __int8 *)(v17 + 105);
  v20[6] = sub_2206DAC30();
  v20[7] = v4;
  if (v15 == 2)
  {
    v20[8] = 0;
    v20[9] = 0;
    v20[10] = 0;
    v20[11] = 0;
  }
  else
  {
    v5 = *(_BYTE *)(v17 + 105);
    v20[11] = MEMORY[0x24BEE1328];
    *((_BYTE *)v20 + 64) = v5 & 1;
  }
  v14 = *(_QWORD *)(v17 + 56);
  v13 = *(_BYTE *)(v17 + 106);
  v20[12] = sub_2206DAC30();
  v20[13] = v6;
  v20[17] = MEMORY[0x24BEE1328];
  *((_BYTE *)v20 + 112) = v13 & 1;
  v20[18] = sub_2206DAC30();
  v20[19] = v7;
  swift_retain();
  if (v14)
  {
    v12 = *(_QWORD *)(v17 + 56);
    v20[23] = sub_2206DA8C4();
    v20[20] = v12;
  }
  else
  {
    v20[20] = 0;
    v20[21] = 0;
    v20[22] = 0;
    v20[23] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v10 = sub_2206DB0B0();
  *(_QWORD *)(v17 + 80) = v10;
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92A08] + (int)*MEMORY[0x24BE92A08]);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v17 + 88) = v8;
  *v8 = *(_QWORD *)(v17 + 16);
  v8[1] = sub_2206928C0;
  return v11(v18, v19, v10);
}

uint64_t sub_220693DE4()
{
  uint64_t v0;
  uint64_t v3;
  unsigned __int8 v4;

  sub_2206DB260();
  *(_QWORD *)v0 = "first1#dialog1";
  *(_QWORD *)(v0 + 8) = 14;
  *(_BYTE *)(v0 + 16) = 2;
  *(_QWORD *)(v0 + 24) = "first1#dialog2";
  *(_QWORD *)(v0 + 32) = 14;
  *(_BYTE *)(v0 + 40) = 2;
  *(_QWORD *)(v0 + 48) = "first2#dialog1";
  *(_QWORD *)(v0 + 56) = 14;
  *(_BYTE *)(v0 + 64) = 2;
  *(_QWORD *)(v0 + 72) = "first2#dialog2";
  *(_QWORD *)(v0 + 80) = 14;
  *(_BYTE *)(v0 + 88) = 2;
  *(_QWORD *)(v0 + 96) = "first3#all1#dialog1";
  *(_QWORD *)(v0 + 104) = 19;
  *(_BYTE *)(v0 + 112) = 2;
  *(_QWORD *)(v0 + 120) = "first3#all1#dialog2";
  *(_QWORD *)(v0 + 128) = 19;
  *(_BYTE *)(v0 + 136) = 2;
  *(_QWORD *)(v0 + 144) = "first3#all2#dialog1";
  *(_QWORD *)(v0 + 152) = 19;
  *(_BYTE *)(v0 + 160) = 2;
  *(_QWORD *)(v0 + 168) = "first3#all2#dialog2";
  *(_QWORD *)(v0 + 176) = 19;
  *(_BYTE *)(v0 + 184) = 2;
  *(_QWORD *)(v0 + 192) = "first4#dialog1";
  *(_QWORD *)(v0 + 200) = 14;
  *(_BYTE *)(v0 + 208) = 2;
  *(_QWORD *)(v0 + 216) = "first4#dialog2";
  *(_QWORD *)(v0 + 224) = 14;
  *(_BYTE *)(v0 + 232) = 2;
  sub_22045A844();
  v3 = sub_2206DB14C();
  swift_bridgeObjectRelease();
  switch(v3)
  {
    case 0:
      v4 = 0;
LABEL_22:
      swift_bridgeObjectRelease();
      return v4;
    case 1:
      v4 = 1;
      goto LABEL_22;
    case 2:
      v4 = 2;
      goto LABEL_22;
    case 3:
      v4 = 3;
      goto LABEL_22;
    case 4:
      v4 = 4;
      goto LABEL_22;
    case 5:
      v4 = 5;
      goto LABEL_22;
    case 6:
      v4 = 6;
      goto LABEL_22;
    case 7:
      v4 = 7;
      goto LABEL_22;
    case 8:
      v4 = 8;
      goto LABEL_22;
    case 9:
      v4 = 9;
      goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  return 10;
}

void sub_220694120(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_220694160()
{
  return sub_2206DAC30();
}

uint64_t sub_22069432C()
{
  sub_220694374();
  return sub_2206DB284() & 1;
}

unint64_t sub_220694374()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8050;
  if (!qword_2555E8050)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9024, &unk_24E64ACE0);
    atomic_store(v0, (unint64_t *)&qword_2555E8050);
    return v0;
  }
  return v2;
}

uint64_t sub_2206943E0()
{
  sub_220694374();
  return sub_2206DACB4();
}

uint64_t sub_22069441C()
{
  sub_220694374();
  return sub_2206DACCC();
}

uint64_t sub_220694460()
{
  sub_220694374();
  return sub_2206DACC0();
}

uint64_t sub_2206944A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_220693DE4();
  *a1 = result;
  return result;
}

void sub_2206944D8(_QWORD *a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;

  sub_220694120(*v1);
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_220694508(uint64_t a1, char a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 64) = v4;
  *(_QWORD *)(v5 + 56) = a4;
  *(_BYTE *)(v5 + 106) = a3 & 1;
  *(_BYTE *)(v5 + 105) = a2;
  *(_QWORD *)(v5 + 48) = a1;
  *(_QWORD *)(v5 + 16) = v5;
  *(_QWORD *)(v5 + 24) = 0;
  *(_BYTE *)(v5 + 104) = 0;
  *(_BYTE *)(v5 + 112) = 0;
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 40) = 0;
  *(_QWORD *)(v5 + 24) = a1;
  *(_BYTE *)(v5 + 104) = a2;
  *(_BYTE *)(v5 + 112) = a3 & 1;
  *(_QWORD *)(v5 + 32) = a4;
  *(_QWORD *)(v5 + 40) = v4;
  return swift_task_switch();
}

uint64_t sub_220694590()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, void *, unint64_t);
  uint64_t v13;
  char v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = v0[6];
  v0[2] = v0;
  v19 = sub_2206DAC30();
  v20 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v21 = v2;
  *v2 = sub_2206DAC30();
  v21[1] = v3;
  swift_retain();
  if (v22)
  {
    v17 = *(_QWORD *)(v18 + 48);
    v21[5] = type metadata accessor for SettingsMultiSetting();
    v21[2] = v17;
  }
  else
  {
    v21[2] = 0;
    v21[3] = 0;
    v21[4] = 0;
    v21[5] = 0;
  }
  v16 = *(unsigned __int8 *)(v18 + 105);
  v21[6] = sub_2206DAC30();
  v21[7] = v4;
  if (v16 == 2)
  {
    v21[8] = 0;
    v21[9] = 0;
    v21[10] = 0;
    v21[11] = 0;
  }
  else
  {
    v5 = *(_BYTE *)(v18 + 105);
    v21[11] = MEMORY[0x24BEE1328];
    *((_BYTE *)v21 + 64) = v5 & 1;
  }
  v15 = *(_QWORD *)(v18 + 56);
  v14 = *(_BYTE *)(v18 + 106);
  v21[12] = sub_2206DAC30();
  v21[13] = v6;
  v21[17] = MEMORY[0x24BEE1328];
  *((_BYTE *)v21 + 112) = v14 & 1;
  v21[18] = sub_2206DAC30();
  v21[19] = v7;
  swift_retain();
  if (v15)
  {
    v13 = *(_QWORD *)(v18 + 56);
    v21[23] = sub_2206DA8C4();
    v21[20] = v13;
  }
  else
  {
    v21[20] = 0;
    v21[21] = 0;
    v21[22] = 0;
    v21[23] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v11 = sub_2206DB0B0();
  *(_QWORD *)(v18 + 80) = v11;
  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x24BE929F8]
                                                                                    + (int)*MEMORY[0x24BE929F8]);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v18 + 88) = v8;
  v9 = sub_220694374();
  *v8 = *(_QWORD *)(v18 + 16);
  v8[1] = sub_2206928C0;
  return v12(v19, v20, v11, &unk_24E64ACE0, v9);
}

uint64_t sub_2206949A4(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 64) = v5;
  *(_BYTE *)(v6 + 107) = a5 & 1;
  *(_BYTE *)(v6 + 106) = a4 & 1;
  *(_BYTE *)(v6 + 105) = a3 & 1;
  *(_QWORD *)(v6 + 56) = a2;
  *(_QWORD *)(v6 + 48) = a1;
  *(_QWORD *)(v6 + 16) = v6;
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 32) = 0;
  *(_BYTE *)(v6 + 104) = 0;
  *(_BYTE *)(v6 + 112) = 0;
  *(_BYTE *)(v6 + 120) = 0;
  *(_QWORD *)(v6 + 40) = 0;
  *(_QWORD *)(v6 + 24) = a1;
  *(_QWORD *)(v6 + 32) = a2;
  *(_BYTE *)(v6 + 104) = a3 & 1;
  *(_BYTE *)(v6 + 112) = a4 & 1;
  *(_BYTE *)(v6 + 120) = a5 & 1;
  *(_QWORD *)(v6 + 40) = v5;
  return swift_task_switch();
}

uint64_t sub_220694A5C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;

  v23 = v0[6];
  v0[2] = v0;
  v20 = sub_2206DAC30();
  v21 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v22 = v2;
  *v2 = sub_2206DAC30();
  v22[1] = v3;
  swift_retain();
  if (v23)
  {
    v18 = *(_QWORD *)(v19 + 48);
    v22[5] = type metadata accessor for SettingsNumericSetting();
    v22[2] = v18;
  }
  else
  {
    v22[2] = 0;
    v22[3] = 0;
    v22[4] = 0;
    v22[5] = 0;
  }
  v17 = *(_QWORD *)(v19 + 56);
  v22[6] = sub_2206DAC30();
  v22[7] = v4;
  swift_retain();
  if (v17)
  {
    v16 = *(_QWORD *)(v19 + 56);
    v22[11] = sub_2206DA8C4();
    v22[8] = v16;
  }
  else
  {
    v22[8] = 0;
    v22[9] = 0;
    v22[10] = 0;
    v22[11] = 0;
  }
  v13 = *(_BYTE *)(v19 + 107);
  v11 = *(_BYTE *)(v19 + 106);
  v10 = *(_BYTE *)(v19 + 105);
  v22[12] = sub_2206DAC30();
  v22[13] = v5;
  v12 = MEMORY[0x24BEE1328];
  v22[17] = MEMORY[0x24BEE1328];
  *((_BYTE *)v22 + 112) = v10 & 1;
  v22[18] = sub_2206DAC30();
  v22[19] = v6;
  v22[23] = v12;
  *((_BYTE *)v22 + 160) = v11 & 1;
  v22[24] = sub_2206DAC30();
  v22[25] = v7;
  v22[29] = v12;
  *((_BYTE *)v22 + 208) = v13 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v14 = sub_2206DB0B0();
  *(_QWORD *)(v19 + 80) = v14;
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92A08] + (int)*MEMORY[0x24BE92A08]);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v19 + 88) = v8;
  *v8 = *(_QWORD *)(v19 + 16);
  v8[1] = sub_220694E40;
  return v15(v20, v21, v14);
}

_QWORD *sub_220694E40(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v6;

  v3 = *v2;
  *(_QWORD *)(v3 + 16) = *v2;
  v6 = (_QWORD *)(v3 + 16);
  *(_QWORD *)(v3 + 96) = v1;
  swift_task_dealloc();
  if (v1)
    return (_QWORD *)swift_task_switch();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(*v6 + 8))(v6, a1);
}

uint64_t sub_220694F54()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t sub_220694FD0()
{
  uint64_t v0;
  uint64_t v3;
  unsigned __int8 v4;

  sub_2206DB260();
  *(_QWORD *)v0 = "dialog1";
  *(_QWORD *)(v0 + 8) = 7;
  *(_BYTE *)(v0 + 16) = 2;
  *(_QWORD *)(v0 + 24) = "dialog2";
  *(_QWORD *)(v0 + 32) = 7;
  *(_BYTE *)(v0 + 40) = 2;
  *(_QWORD *)(v0 + 48) = "dialog3";
  *(_QWORD *)(v0 + 56) = 7;
  *(_BYTE *)(v0 + 64) = 2;
  *(_QWORD *)(v0 + 72) = "dialog4";
  *(_QWORD *)(v0 + 80) = 7;
  *(_BYTE *)(v0 + 88) = 2;
  *(_QWORD *)(v0 + 96) = "dialog5";
  *(_QWORD *)(v0 + 104) = 7;
  *(_BYTE *)(v0 + 112) = 2;
  *(_QWORD *)(v0 + 120) = "dialog6";
  *(_QWORD *)(v0 + 128) = 7;
  *(_BYTE *)(v0 + 136) = 2;
  *(_QWORD *)(v0 + 144) = "dialog7";
  *(_QWORD *)(v0 + 152) = 7;
  *(_BYTE *)(v0 + 160) = 2;
  sub_22045A844();
  v3 = sub_2206DB14C();
  swift_bridgeObjectRelease();
  switch(v3)
  {
    case 0:
      v4 = 0;
LABEL_16:
      swift_bridgeObjectRelease();
      return v4;
    case 1:
      v4 = 1;
      goto LABEL_16;
    case 2:
      v4 = 2;
      goto LABEL_16;
    case 3:
      v4 = 3;
      goto LABEL_16;
    case 4:
      v4 = 4;
      goto LABEL_16;
    case 5:
      v4 = 5;
      goto LABEL_16;
    case 6:
      v4 = 6;
      goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  return 7;
}

void sub_220695244(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_220695284()
{
  return sub_2206DAC30();
}

uint64_t sub_2206953CC()
{
  sub_220695414();
  return sub_2206DB284() & 1;
}

unint64_t sub_220695414()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8068;
  if (!qword_2555E8068)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8FEC, &unk_24E64AD70);
    atomic_store(v0, (unint64_t *)&qword_2555E8068);
    return v0;
  }
  return v2;
}

uint64_t sub_220695480()
{
  sub_220695414();
  return sub_2206DACB4();
}

uint64_t sub_2206954BC()
{
  sub_220695414();
  return sub_2206DACCC();
}

uint64_t sub_220695500()
{
  sub_220695414();
  return sub_2206DACC0();
}

uint64_t sub_220695544@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_220694FD0();
  *a1 = result;
  return result;
}

void sub_220695578(_QWORD *a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;

  sub_220695244(*v1);
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_2206955A8(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 64) = v5;
  *(_BYTE *)(v6 + 107) = a5 & 1;
  *(_BYTE *)(v6 + 106) = a4 & 1;
  *(_BYTE *)(v6 + 105) = a3 & 1;
  *(_QWORD *)(v6 + 56) = a2;
  *(_QWORD *)(v6 + 48) = a1;
  *(_QWORD *)(v6 + 16) = v6;
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 32) = 0;
  *(_BYTE *)(v6 + 104) = 0;
  *(_BYTE *)(v6 + 112) = 0;
  *(_BYTE *)(v6 + 120) = 0;
  *(_QWORD *)(v6 + 40) = 0;
  *(_QWORD *)(v6 + 24) = a1;
  *(_QWORD *)(v6 + 32) = a2;
  *(_BYTE *)(v6 + 104) = a3 & 1;
  *(_BYTE *)(v6 + 112) = a4 & 1;
  *(_BYTE *)(v6 + 120) = a5 & 1;
  *(_QWORD *)(v6 + 40) = v5;
  return swift_task_switch();
}

uint64_t sub_220695660()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  char v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, void *, unint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = v0[6];
  v0[2] = v0;
  v21 = sub_2206DAC30();
  v22 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v23 = v2;
  *v2 = sub_2206DAC30();
  v23[1] = v3;
  swift_retain();
  if (v24)
  {
    v19 = *(_QWORD *)(v20 + 48);
    v23[5] = type metadata accessor for SettingsNumericSetting();
    v23[2] = v19;
  }
  else
  {
    v23[2] = 0;
    v23[3] = 0;
    v23[4] = 0;
    v23[5] = 0;
  }
  v18 = *(_QWORD *)(v20 + 56);
  v23[6] = sub_2206DAC30();
  v23[7] = v4;
  swift_retain();
  if (v18)
  {
    v17 = *(_QWORD *)(v20 + 56);
    v23[11] = sub_2206DA8C4();
    v23[8] = v17;
  }
  else
  {
    v23[8] = 0;
    v23[9] = 0;
    v23[10] = 0;
    v23[11] = 0;
  }
  v14 = *(_BYTE *)(v20 + 107);
  v12 = *(_BYTE *)(v20 + 106);
  v11 = *(_BYTE *)(v20 + 105);
  v23[12] = sub_2206DAC30();
  v23[13] = v5;
  v13 = MEMORY[0x24BEE1328];
  v23[17] = MEMORY[0x24BEE1328];
  *((_BYTE *)v23 + 112) = v11 & 1;
  v23[18] = sub_2206DAC30();
  v23[19] = v6;
  v23[23] = v13;
  *((_BYTE *)v23 + 160) = v12 & 1;
  v23[24] = sub_2206DAC30();
  v23[25] = v7;
  v23[29] = v13;
  *((_BYTE *)v23 + 208) = v14 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v15 = sub_2206DB0B0();
  *(_QWORD *)(v20 + 80) = v15;
  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x24BE929F8]
                                                                                    + (int)*MEMORY[0x24BE929F8]);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v20 + 88) = v8;
  v9 = sub_220695414();
  *v8 = *(_QWORD *)(v20 + 16);
  v8[1] = sub_220694E40;
  return v16(v21, v22, v15, &unk_24E64AD70, v9);
}

uint64_t sub_220695A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[8] = v2;
  v3[7] = a2;
  v3[6] = a1;
  v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[5] = 0;
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = v2;
  return swift_task_switch();
}

uint64_t sub_220695AB0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = v0[6];
  v0[2] = v0;
  v13 = sub_2206DAC30();
  v14 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v15 = v2;
  *v2 = sub_2206DAC30();
  v15[1] = v3;
  swift_retain();
  if (v16)
  {
    v11 = v12[6];
    v15[5] = type metadata accessor for SettingsNumericSetting();
    v15[2] = v11;
  }
  else
  {
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = 0;
    v15[5] = 0;
  }
  v10 = v12[7];
  v15[6] = sub_2206DAC30();
  v15[7] = v4;
  swift_retain();
  if (v10)
  {
    v9 = v12[7];
    v15[11] = sub_2206DA8C4();
    v15[8] = v9;
  }
  else
  {
    v15[8] = 0;
    v15[9] = 0;
    v15[10] = 0;
    v15[11] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v7 = sub_2206DB0B0();
  v12[10] = v7;
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92A08] + (int)*MEMORY[0x24BE92A08]);
  v5 = (_QWORD *)swift_task_alloc();
  v12[11] = v5;
  *v5 = v12[2];
  v5[1] = sub_22056565C;
  return v8(v13, v14, v7);
}

uint64_t sub_220695D58()
{
  sub_220695DA0();
  return sub_2206DB284() & 1;
}

unint64_t sub_220695DA0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8080;
  if (!qword_2555E8080)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8FB4, &unk_24E64AE00);
    atomic_store(v0, (unint64_t *)&qword_2555E8080);
    return v0;
  }
  return v2;
}

uint64_t sub_220695E0C()
{
  sub_220695DA0();
  return sub_2206DACB4();
}

uint64_t sub_220695E48()
{
  sub_220695DA0();
  return sub_2206DACCC();
}

uint64_t sub_220695E8C()
{
  sub_220695DA0();
  return sub_2206DACC0();
}

uint64_t sub_220695ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[8] = v2;
  v3[7] = a2;
  v3[6] = a1;
  v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[5] = 0;
  v3[3] = a1;
  v3[4] = a2;
  v3[5] = v2;
  return swift_task_switch();
}

uint64_t sub_220695F24()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, void *, unint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = v0[6];
  v0[2] = v0;
  v14 = sub_2206DAC30();
  v15 = v1;
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v16 = v2;
  *v2 = sub_2206DAC30();
  v16[1] = v3;
  swift_retain();
  if (v17)
  {
    v12 = v13[6];
    v16[5] = type metadata accessor for SettingsNumericSetting();
    v16[2] = v12;
  }
  else
  {
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = 0;
    v16[5] = 0;
  }
  v11 = v13[7];
  v16[6] = sub_2206DAC30();
  v16[7] = v4;
  swift_retain();
  if (v11)
  {
    v10 = v13[7];
    v16[11] = sub_2206DA8C4();
    v16[8] = v10;
  }
  else
  {
    v16[8] = 0;
    v16[9] = 0;
    v16[10] = 0;
    v16[11] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v8 = sub_2206DB0B0();
  v13[10] = v8;
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x24BE929F8]
                                                                                   + (int)*MEMORY[0x24BE929F8]);
  v5 = (_QWORD *)swift_task_alloc();
  v13[11] = v5;
  v6 = sub_220695DA0();
  *v5 = v13[2];
  v5[1] = sub_22056565C;
  return v9(v14, v15, v8, &unk_24E64AE00, v6);
}

uint64_t sub_2206961E4()
{
  uint64_t v0;
  _QWORD *v1;

  v1[4] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  return swift_task_switch();
}

uint64_t sub_220696218()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v0[2] = v0;
  v8 = sub_2206DAC30();
  v5 = v1;
  v0[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v6 = sub_2206DB0B0();
  v0[6] = v6;
  v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92A08] + (int)*MEMORY[0x24BE92A08]);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 56) = v2;
  *v2 = *(_QWORD *)(v4 + 16);
  v2[1] = sub_2204DC6DC;
  return v7(v8, v5, v6);
}

uint64_t sub_220696314()
{
  sub_22069635C();
  return sub_2206DB284() & 1;
}

unint64_t sub_22069635C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8098[0];
  if (!qword_2555E8098[0])
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8F7C, &unk_24E64AE90);
    atomic_store(v0, qword_2555E8098);
    return v0;
  }
  return v2;
}

uint64_t sub_2206963C8()
{
  sub_22069635C();
  return sub_2206DACB4();
}

uint64_t sub_220696404()
{
  sub_22069635C();
  return sub_2206DACCC();
}

uint64_t sub_220696448()
{
  sub_22069635C();
  return sub_2206DACC0();
}

uint64_t sub_22069648C()
{
  uint64_t v0;
  _QWORD *v1;

  v1[4] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  return swift_task_switch();
}

uint64_t sub_2206964C0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  unint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, void *, unint64_t);
  uint64_t v9;

  v0[2] = v0;
  v9 = sub_2206DAC30();
  v6 = v1;
  v0[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v7 = sub_2206DB0B0();
  v0[6] = v7;
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x24BE929F8]
                                                                                   + (int)*MEMORY[0x24BE929F8]);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 56) = v2;
  v3 = sub_22069635C();
  *v2 = *(_QWORD *)(v5 + 16);
  v2[1] = sub_2204DC6DC;
  return v8(v9, v6, v7, &unk_24E64AE90, v3);
}

uint64_t sub_2206965D4(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 48) = v3;
  *(_BYTE *)(v4 + 90) = a3 & 1;
  *(_BYTE *)(v4 + 89) = a2 & 1;
  *(_QWORD *)(v4 + 40) = a1;
  *(_QWORD *)(v4 + 16) = v4;
  *(_QWORD *)(v4 + 24) = 0;
  *(_BYTE *)(v4 + 88) = 0;
  *(_BYTE *)(v4 + 96) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 24) = a1;
  *(_BYTE *)(v4 + 88) = a2 & 1;
  *(_BYTE *)(v4 + 96) = a3 & 1;
  *(_QWORD *)(v4 + 32) = v3;
  return swift_task_switch();
}

uint64_t sub_22069665C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = v0[5];
  v0[2] = v0;
  v15 = sub_2206DAC30();
  v16 = v1;
  v0[7] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v17 = v2;
  *v2 = sub_2206DAC30();
  v17[1] = v3;
  swift_retain();
  if (v18)
  {
    v13 = *(_QWORD *)(v14 + 40);
    v17[5] = type metadata accessor for SettingsBinarySetting();
    v17[2] = v13;
  }
  else
  {
    v17[2] = 0;
    v17[3] = 0;
    v17[4] = 0;
    v17[5] = 0;
  }
  v10 = *(_BYTE *)(v14 + 90);
  v8 = *(_BYTE *)(v14 + 89);
  v17[6] = sub_2206DAC30();
  v17[7] = v4;
  v9 = MEMORY[0x24BEE1328];
  v17[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v17 + 64) = v8 & 1;
  v17[12] = sub_2206DAC30();
  v17[13] = v5;
  v17[17] = v9;
  *((_BYTE *)v17 + 112) = v10 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v11 = sub_2206DB0B0();
  *(_QWORD *)(v14 + 64) = v11;
  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92A08] + (int)*MEMORY[0x24BE92A08]);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v14 + 72) = v6;
  *v6 = *(_QWORD *)(v14 + 16);
  v6[1] = sub_2206968F4;
  return v12(v15, v16, v11);
}

_QWORD *sub_2206968F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v6;

  v3 = *v2;
  *(_QWORD *)(v3 + 16) = *v2;
  v6 = (_QWORD *)(v3 + 16);
  *(_QWORD *)(v3 + 80) = v1;
  swift_task_dealloc();
  if (v1)
    return (_QWORD *)swift_task_switch();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(_QWORD *(**)(_QWORD *__return_ptr, uint64_t))(*v6 + 8))(v6, a1);
}

uint64_t sub_2206969F0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t sub_220696A64()
{
  sub_220696AAC();
  return sub_2206DB284() & 1;
}

unint64_t sub_220696AAC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E80B0;
  if (!qword_2555E80B0)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8F44, &unk_24E64AF20);
    atomic_store(v0, (unint64_t *)&qword_2555E80B0);
    return v0;
  }
  return v2;
}

uint64_t sub_220696B18()
{
  sub_220696AAC();
  return sub_2206DACB4();
}

uint64_t sub_220696B54()
{
  sub_220696AAC();
  return sub_2206DACCC();
}

uint64_t sub_220696B98()
{
  sub_220696AAC();
  return sub_2206DACC0();
}

uint64_t sub_220696BDC(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 48) = v3;
  *(_BYTE *)(v4 + 90) = a3 & 1;
  *(_BYTE *)(v4 + 89) = a2 & 1;
  *(_QWORD *)(v4 + 40) = a1;
  *(_QWORD *)(v4 + 16) = v4;
  *(_QWORD *)(v4 + 24) = 0;
  *(_BYTE *)(v4 + 88) = 0;
  *(_BYTE *)(v4 + 96) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 24) = a1;
  *(_BYTE *)(v4 + 88) = a2 & 1;
  *(_BYTE *)(v4 + 96) = a3 & 1;
  *(_QWORD *)(v4 + 32) = v3;
  return swift_task_switch();
}

uint64_t sub_220696C64()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, void *, unint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = v0[5];
  v0[2] = v0;
  v16 = sub_2206DAC30();
  v17 = v1;
  v0[7] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v18 = v2;
  *v2 = sub_2206DAC30();
  v18[1] = v3;
  swift_retain();
  if (v19)
  {
    v14 = *(_QWORD *)(v15 + 40);
    v18[5] = type metadata accessor for SettingsBinarySetting();
    v18[2] = v14;
  }
  else
  {
    v18[2] = 0;
    v18[3] = 0;
    v18[4] = 0;
    v18[5] = 0;
  }
  v11 = *(_BYTE *)(v15 + 90);
  v9 = *(_BYTE *)(v15 + 89);
  v18[6] = sub_2206DAC30();
  v18[7] = v4;
  v10 = MEMORY[0x24BEE1328];
  v18[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v18 + 64) = v9 & 1;
  v18[12] = sub_2206DAC30();
  v18[13] = v5;
  v18[17] = v10;
  *((_BYTE *)v18 + 112) = v11 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v12 = sub_2206DB0B0();
  *(_QWORD *)(v15 + 64) = v12;
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x24BE929F8]
                                                                                    + (int)*MEMORY[0x24BE929F8]);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v15 + 72) = v6;
  v7 = sub_220696AAC();
  *v6 = *(_QWORD *)(v15 + 16);
  v6[1] = sub_2206968F4;
  return v13(v16, v17, v12, &unk_24E64AF20, v7);
}

uint64_t sub_220696F14(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[6] = v1;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
  v2[7] = swift_task_alloc();
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t sub_220696FB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v5;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  const void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v15 = (void *)v0[7];
  v14 = (const void *)v0[5];
  v0[2] = v0;
  v11 = sub_2206DAC30();
  v12 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v13 = v2;
  *v2 = sub_2206DAC30();
  v13[1] = v3;
  sub_2204A395C(v14, v15);
  v16 = sub_2206DA870();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v17 + 48))(v15, 1) == 1)
  {
    sub_2204A2148(v10[7]);
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = 0;
    v13[5] = 0;
  }
  else
  {
    v9 = v10[7];
    v13[5] = v16;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13 + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 32))(boxed_opaque_existential_1, v9, v16);
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v7 = sub_2206DB0B0();
  v10[9] = v7;
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92A08] + (int)*MEMORY[0x24BE92A08]);
  v5 = (_QWORD *)swift_task_alloc();
  v10[10] = v5;
  *v5 = v10[2];
  v5[1] = sub_220563494;
  return v8(v11, v12, v7);
}

uint64_t sub_2206971DC()
{
  sub_220697224();
  return sub_2206DB284() & 1;
}

unint64_t sub_220697224()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E80C8;
  if (!qword_2555E80C8)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8F0C, &unk_24E64AFB0);
    atomic_store(v0, (unint64_t *)&qword_2555E80C8);
    return v0;
  }
  return v2;
}

uint64_t sub_220697290()
{
  sub_220697224();
  return sub_2206DACB4();
}

uint64_t sub_2206972CC()
{
  sub_220697224();
  return sub_2206DACCC();
}

uint64_t sub_220697310()
{
  sub_220697224();
  return sub_2206DACC0();
}

uint64_t sub_220697354(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[6] = v1;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
  v2[7] = swift_task_alloc();
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t sub_2206973F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, void *, unint64_t);
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  const void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v16 = (void *)v0[7];
  v15 = (const void *)v0[5];
  v0[2] = v0;
  v12 = sub_2206DAC30();
  v13 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v14 = v2;
  *v2 = sub_2206DAC30();
  v14[1] = v3;
  sub_2204A395C(v15, v16);
  v17 = sub_2206DA870();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v18 + 48))(v16, 1) == 1)
  {
    sub_2204A2148(v11[7]);
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = 0;
    v14[5] = 0;
  }
  else
  {
    v10 = v11[7];
    v14[5] = v17;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14 + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v18 + 32))(boxed_opaque_existential_1, v10, v17);
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v8 = sub_2206DB0B0();
  v11[9] = v8;
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x24BE929F8]
                                                                                   + (int)*MEMORY[0x24BE929F8]);
  v5 = (_QWORD *)swift_task_alloc();
  v11[10] = v5;
  v6 = sub_220697224();
  *v5 = v11[2];
  v5[1] = sub_220563494;
  return v9(v12, v13, v8, &unk_24E64AFB0, v6);
}

uint64_t type metadata accessor for GetSettingIntentCATsSimple()
{
  uint64_t v1;

  v1 = qword_2555E80D8;
  if (!qword_2555E80D8)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_220697698()
{
  uint64_t inited;

  inited = swift_initClassMetadata2();
  if (!inited)
    return 0;
  return inited;
}

uint64_t sub_220697708()
{
  return type metadata accessor for GetSettingIntentCATsSimple();
}

void *type metadata accessor for GetSettingIntentCATsSimple.Properties()
{
  return &unk_24E64ABC0;
}

uint64_t sub_220697734(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xEE)
      goto LABEL_15;
    v7 = ((a2 + 17) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 238;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 18;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *sub_2206978E4(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xEE)
  {
    v5 = ((a3 + 17) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xEE)
  {
    v4 = ((a2 - 239) >> 8) + 1;
    *result = a2 + 17;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 17;
  }
  return result;
}

void *type metadata accessor for GetSettingIntentCATsSimple.DescribeBinarySettingStateDialogIds()
{
  return &unk_24E64AC50;
}

void *type metadata accessor for GetSettingIntentCATsSimple.DescribeMultiSettingStateDialogIds()
{
  return &unk_24E64ACE0;
}

void *type metadata accessor for GetSettingIntentCATsSimple.DescribeNumericSettingStateDialogIds()
{
  return &unk_24E64AD70;
}

void *type metadata accessor for GetSettingIntentCATsSimple.DescribeNumericSettingStateSpokenOnlyDialogIds()
{
  return &unk_24E64AE00;
}

void *type metadata accessor for GetSettingIntentCATsSimple.HotspotDiscoverabilityPromptDialogIds()
{
  return &unk_24E64AE90;
}

void *type metadata accessor for GetSettingIntentCATsSimple.SiriCannotChangeSettingDialogIds()
{
  return &unk_24E64AF20;
}

void *type metadata accessor for GetSettingIntentCATsSimple.TargetDeviceNotFoundReadBatteryDialogIds()
{
  return &unk_24E64AFB0;
}

unint64_t sub_220697BB4()
{
  return sub_220697BC8();
}

unint64_t sub_220697BC8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8128;
  if (!qword_2555E8128)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8C0C, &unk_24E64AFB0);
    atomic_store(v0, (unint64_t *)&qword_2555E8128);
    return v0;
  }
  return v2;
}

unint64_t sub_220697C34()
{
  return sub_220697C48();
}

unint64_t sub_220697C48()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8130;
  if (!qword_2555E8130)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8C74, &unk_24E64AF20);
    atomic_store(v0, (unint64_t *)&qword_2555E8130);
    return v0;
  }
  return v2;
}

unint64_t sub_220697CB4()
{
  return sub_220697CC8();
}

unint64_t sub_220697CC8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8138;
  if (!qword_2555E8138)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8CDC, &unk_24E64AE90);
    atomic_store(v0, (unint64_t *)&qword_2555E8138);
    return v0;
  }
  return v2;
}

unint64_t sub_220697D34()
{
  return sub_220697D48();
}

unint64_t sub_220697D48()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8140;
  if (!qword_2555E8140)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8D44, &unk_24E64AE00);
    atomic_store(v0, (unint64_t *)&qword_2555E8140);
    return v0;
  }
  return v2;
}

unint64_t sub_220697DB4()
{
  return sub_220697DC8();
}

unint64_t sub_220697DC8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8148;
  if (!qword_2555E8148)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8DAC, &unk_24E64AD70);
    atomic_store(v0, (unint64_t *)&qword_2555E8148);
    return v0;
  }
  return v2;
}

unint64_t sub_220697E34()
{
  return sub_220697E48();
}

unint64_t sub_220697E48()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8150;
  if (!qword_2555E8150)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8E14, &unk_24E64ACE0);
    atomic_store(v0, (unint64_t *)&qword_2555E8150);
    return v0;
  }
  return v2;
}

unint64_t sub_220697EB4()
{
  return sub_220697EC8();
}

unint64_t sub_220697EC8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8158;
  if (!qword_2555E8158)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8E7C, &unk_24E64AC50);
    atomic_store(v0, (unint64_t *)&qword_2555E8158);
    return v0;
  }
  return v2;
}

unint64_t sub_220697F34()
{
  return sub_220697F48();
}

unint64_t sub_220697F48()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8160;
  if (!qword_2555E8160)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E8EE4, &unk_24E64ABC0);
    atomic_store(v0, (unint64_t *)&qword_2555E8160);
    return v0;
  }
  return v2;
}

uint64_t sub_220697FB4()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetAXMotionCuesHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE358 = result;
  return result;
}

uint64_t type metadata accessor for SetAXMotionCuesHandler()
{
  return objc_opt_self();
}

uint64_t *sub_220698014()
{
  if (qword_2555DC620 != -1)
    swift_once();
  return &qword_2555FE358;
}

void sub_220698068(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v13;
  int v14;
  id v15;
  char v16;
  _BYTE v17[16];
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = a1;
  v23 = a2;
  v24 = a3;
  v22 = v3;
  sub_2206DAED0();
  v8 = (id)*sub_22053C880();
  v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v5 = sub_2205350C8();
  v9 = *v5;
  v13 = v5[1];
  v14 = *((unsigned __int8 *)v5 + 16);
  v15 = (id)*sub_22053C880();
  v6 = v15;
  v16 = *(_BYTE *)(v3 + 24);
  swift_retain();
  v7 = a1;
  swift_retain();
  v18 = v3;
  v19 = a1;
  v20 = a2;
  v21 = a3;
  sub_220531F08(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22069833C, (uint64_t)v17, MEMORY[0x24BEE4AE0] + 8, v3);
  swift_release();

  swift_release();
}

uint64_t sub_22069821C(uint64_t a1, void *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t *v4;
  BOOL v6;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;

  swift_retain();
  v6 = sub_2204B50E0();
  swift_release();
  v4 = sub_2205350C8();
  v9 = *v4;
  v10 = v4[1];
  v11 = *((unsigned __int8 *)v4 + 16);
  v12 = *(_BYTE *)(a1 + 24);
  swift_retain();
  sub_220524C7C(v6, a2, v9, v10, v11, v12 & 1, a3, a4, (uint64_t)sub_2206983F8, a1, 0, 1, 0, 0);
  return sub_2204614E0((uint64_t)sub_2206983F8);
}

uint64_t sub_22069833C()
{
  uint64_t v0;

  return sub_22069821C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(void))(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_22069836C()
{
  swift_retain();
  sub_2204B5110();
  return swift_release();
}

void sub_2206983D8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_220698068(a1, a2, a3);
}

uint64_t sub_2206983F8()
{
  return sub_22069836C();
}

uint64_t sub_22069841C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = a1;
  v12 = 0;
  v11 = 0;
  v8 = sub_2206DA870();
  v7 = *(_QWORD *)(v8 - 8);
  v5 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v8);
  v6 = (char *)&v5 - v5;
  v12 = v2;
  v11 = v1;
  (*(void (**)(void))(v3 + 16))();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v1 + OBJC_IVAR____TtCC19SiriSettingsIntents15SettingsSetting7Builder_identifier, v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v8);
  return v10;
}

uint64_t sub_2206984E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = OBJC_IVAR____TtCC19SiriSettingsIntents15SettingsSetting7Builder_identifier;
  v1 = sub_2206DA870();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3);
  return v4;
}

uint64_t sub_220698534@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents15SettingsSetting7Builder_identifier;
  swift_beginAccess();
  v2 = sub_2206DA870();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v4);
  return swift_endAccess();
}

uint64_t sub_2206985A0(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v10 = a1;
  v11 = sub_2206DA870();
  v9 = *(_QWORD *)(v11 - 8);
  v5 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v11);
  v7 = (char *)&v5 - v5;
  (*(void (**)(double))(v3 + 16))(v2);
  v6 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents15SettingsSetting7Builder_identifier;
  v8 = &v12;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v6, v7, v11);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t (*sub_220698670())()
{
  swift_beginAccess();
  return sub_220464E08;
}

uint64_t sub_2206986B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;

  v11 = a1;
  v15 = 0;
  v14 = 0;
  v10 = sub_2206DA870();
  v8 = *(_QWORD *)(v10 - 8);
  v5 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v11);
  v9 = (char *)&v4 - v5;
  v15 = v2;
  v14 = v1;
  *(_QWORD *)(v1 + 16) = 0;
  v6 = v2 + OBJC_IVAR____TtCC19SiriSettingsIntents15SettingsSetting7Builder_identifier;
  v7 = &v13;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v9, v6, v10);
  swift_endAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v1 + OBJC_IVAR____TtC19SiriSettingsIntents15SettingsSetting_identifier, v9, v10);
  swift_release();
  return v12;
}

uint64_t sub_2206987B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char v7;

  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v7 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v3 = v6 + OBJC_IVAR____TtC19SiriSettingsIntents15SettingsSetting_identifier;
    v4 = sub_2206DA870();
    a1[3] = v4;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(boxed_opaque_existential_1, v3);
  }
  else
  {
    result = swift_bridgeObjectRelease();
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    a1[3] = 0;
  }
  return result;
}

uint64_t SettingsSetting.init(from:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  v18 = a1;
  v29 = 0;
  v28 = 0;
  v14 = sub_2206DA870();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v6 - v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8218);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = (*(_QWORD *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v6 - v21;
  v29 = v2;
  v28 = v1;
  *(_QWORD *)(v1 + 16) = 0;
  v24 = v2[3];
  v25 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v24);
  sub_220698B54();
  v3 = v23;
  sub_2206DB32C();
  v26 = v3;
  v27 = v3;
  if (v3)
  {
    v8 = v27;
    v9 = v13;
  }
  else
  {
    sub_22054BDB0();
    v4 = v26;
    sub_2206DB1B8();
    v11 = v4;
    v12 = v4;
    if (!v4)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v13 + OBJC_IVAR____TtC19SiriSettingsIntents15SettingsSetting_identifier, v17, v14);
      (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
      __swift_destroy_boxed_opaque_existential_0(v18);
      return v13;
    }
    v7 = v12;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    v8 = v7;
    v9 = v13;
  }
  v6[1] = v9;
  v6[2] = v8;
  sub_2204ACB4C((id *)(v9 + 16));
  type metadata accessor for SettingsSetting();
  swift_deallocPartialClassInstance();
  __swift_destroy_boxed_opaque_existential_0(v18);
  return v10;
}

unint64_t sub_220698B54()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8220;
  if (!qword_2555E8220)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9344, &unk_24E64B0F0);
    atomic_store(v0, (unint64_t *)&qword_2555E8220);
    return v0;
  }
  return v2;
}

uint64_t type metadata accessor for SettingsSetting()
{
  uint64_t v1;

  v1 = qword_2555E8270;
  if (!qword_2555E8270)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_220698C24(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD v5[2];
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;

  v7 = a1;
  v22 = 0;
  v21 = 0;
  v16 = sub_2206DA870();
  v13 = *(_QWORD *)(v16 - 8);
  v6 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v5 - v6;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8228);
  v8 = *(_QWORD *)(v15 - 8);
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v5 - v9;
  v22 = v2;
  v21 = v1;
  v10 = v2[3];
  v11 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v10);
  sub_220698B54();
  sub_2206DB338();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v14 + OBJC_IVAR____TtC19SiriSettingsIntents15SettingsSetting_identifier, v16);
  sub_22054C0F0();
  v3 = v17;
  sub_2206DB224();
  v19 = v3;
  v20 = v3;
  if (v3)
    v5[1] = v20;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v12, v15);
}

uint64_t SettingsSetting.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  sub_2204ACB4C((id *)(v0 + 16));
  v3 = OBJC_IVAR____TtC19SiriSettingsIntents15SettingsSetting_identifier;
  v1 = sub_2206DA870();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3);
  return v4;
}

void *sub_220698E70()
{
  uint64_t v0;
  id v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v0 + 16);
  v1 = v3;
  swift_endAccess();
  return v3;
}

void sub_220698EC8(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v2 = a1;
  swift_beginAccess();
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

  swift_endAccess();
}

uint64_t (*sub_220698F38())()
{
  swift_beginAccess();
  return sub_22052EE4C;
}

uint64_t sub_220698F80(uint64_t a1)
{
  swift_allocObject();
  return sub_22069841C(a1);
}

uint64_t sub_220698FC8()
{
  uint64_t v1;

  type metadata accessor for SettingsSetting();
  swift_retain();
  return sub_220699010(v1);
}

uint64_t sub_220699010(uint64_t a1)
{
  swift_allocObject();
  return sub_2206986B8(a1);
}

uint64_t sub_220699058()
{
  sub_2206984E0();
  return swift_deallocClassInstance();
}

uint64_t sub_220699098()
{
  return sub_2206DAC30();
}

uint64_t sub_2206990D4@<X0>(void **a1@<X8>)
{
  swift_retain();
  *a1 = sub_220698E70();
  return swift_release();
}

uint64_t sub_22069912C(id *a1)
{
  void *v2;
  void *v3;

  sub_220699F08(a1, &v3);
  v2 = v3;
  swift_retain();
  sub_220698EC8(v2);
  return swift_release();
}

uint64_t sub_220699190(uint64_t a1)
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

  v11 = a1;
  v15 = 0;
  v14 = 0;
  v5 = 0;
  v12 = sub_2206DA870();
  v10 = *(_QWORD *)(v12 - 8);
  v6 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v7 = (uint64_t)&v5 - v6;
  v15 = v1;
  type metadata accessor for SettingsSetting.Builder();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v7, v11, v12);
  v2 = sub_220698F80(v7);
  v3 = v8;
  v9 = v2;
  v14 = v2;
  swift_retain();
  v13 = (*(uint64_t (**)(uint64_t))(v3 + 136))(v9);
  swift_retain();
  v16 = v13;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
  swift_release();
  return v13;
}

uint64_t type metadata accessor for SettingsSetting.Builder()
{
  uint64_t v1;

  v1 = qword_2555E8368;
  if (!qword_2555E8368)
    return swift_getSingletonMetadata();
  return v1;
}

BOOL sub_220699300()
{
  uint64_t v0;
  uint64_t v2;

  sub_2206DB260();
  *(_QWORD *)v0 = "identifier";
  *(_QWORD *)(v0 + 8) = 10;
  *(_BYTE *)(v0 + 16) = 2;
  sub_22045A844();
  v2 = sub_2206DB14C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 != 0;
}

uint64_t sub_2206993E0()
{
  char v1;

  swift_bridgeObjectRetain();
  if (sub_220699300())
  {
    swift_bridgeObjectRelease();
    v1 = 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    v1 = 0;
  }
  return v1 & 1;
}

uint64_t sub_220699464()
{
  return sub_2206DAC30();
}

uint64_t sub_220699494()
{
  return sub_220699464();
}

uint64_t sub_2206994A8()
{
  sub_2206994F0();
  return sub_2206DB284() & 1;
}

unint64_t sub_2206994F0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8230;
  if (!qword_2555E8230)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E930C, &unk_24E64B0F0);
    atomic_store(v0, (unint64_t *)&qword_2555E8230);
    return v0;
  }
  return v2;
}

uint64_t sub_22069955C()
{
  sub_2206994F0();
  return sub_2206DACB4();
}

uint64_t sub_220699598()
{
  sub_2206994F0();
  return sub_2206DACCC();
}

uint64_t sub_2206995DC()
{
  sub_2206994F0();
  return sub_2206DACC0();
}

BOOL sub_220699620@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_220699300();
  *a1 = result;
  return result;
}

uint64_t sub_22069965C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  result = sub_220699464();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_220699688()
{
  return sub_220699494();
}

uint64_t sub_22069969C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2206993E0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2206996CC()
{
  sub_220698B54();
  return sub_2206DB344();
}

uint64_t sub_2206996F8()
{
  sub_220698B54();
  return sub_2206DB350();
}

uint64_t SettingsSetting.__deallocating_deinit()
{
  SettingsSetting.deinit();
  return swift_deallocClassInstance();
}

uint64_t SettingsSetting.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  swift_allocObject();
  v5 = SettingsSetting.init(from:)(a1);
  if (v3)
    return v2;
  else
    return v5;
}

uint64_t sub_2206997F0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_220699808()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))() & 1;
}

void *sub_220699824()
{
  return sub_220698E70();
}

void sub_220699844(void *a1)
{
  sub_220698EC8(a1);
}

void (*sub_220699864(_QWORD *a1))(void **a1, char a2)
{
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = sub_220698F38();
  return sub_2205F4E50;
}

uint64_t sub_2206998BC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 144))();
}

unint64_t sub_2206998E4()
{
  return sub_2206998F8();
}

unint64_t sub_2206998F8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2555E8238;
  if (!qword_2555E8238)
  {
    v0 = type metadata accessor for SettingsSetting();
    v1 = MEMORY[0x2207E69C0](&protocol conformance descriptor for SettingsSetting, v0);
    atomic_store(v1, (unint64_t *)&qword_2555E8238);
    return v1;
  }
  return v3;
}

unint64_t sub_220699968()
{
  return sub_22069997C();
}

unint64_t sub_22069997C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2555E8240;
  if (!qword_2555E8240)
  {
    v0 = type metadata accessor for SettingsSetting();
    v1 = MEMORY[0x2207E69C0](&protocol conformance descriptor for SettingsSetting, v0);
    atomic_store(v1, (unint64_t *)&qword_2555E8240);
    return v1;
  }
  return v3;
}

uint64_t sub_2206999EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 160))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_220699A4C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 152))();
}

uint64_t sub_220699AAC@<X0>(void **a1@<X8>)
{
  return sub_2206990D4(a1);
}

uint64_t sub_220699AC0(id *a1)
{
  return sub_22069912C(a1);
}

uint64_t sub_220699AD4()
{
  return type metadata accessor for SettingsSetting();
}

uint64_t sub_220699AEC()
{
  unint64_t v0;
  uint64_t updated;

  updated = sub_2206DA870();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

uint64_t method lookup function for SettingsSetting()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static SettingsSetting.catTypeName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of static SettingsSetting.isDialogType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))() & 1;
}

uint64_t dispatch thunk of SettingsSetting.mockGlobals.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of SettingsSetting.mockGlobals.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of SettingsSetting.mockGlobals.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of SettingsSetting.getProperty(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of SettingsSetting.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of SettingsSetting.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_220699CA4()
{
  return type metadata accessor for SettingsSetting.Builder();
}

uint64_t sub_220699CBC()
{
  unint64_t v0;
  uint64_t updated;

  updated = sub_2206DA870();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

void *type metadata accessor for SettingsSetting.CodingKeys()
{
  return &unk_24E64B0F0;
}

unint64_t sub_220699D88()
{
  return sub_220699D9C();
}

unint64_t sub_220699D9C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8410;
  if (!qword_2555E8410)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E92E4, &unk_24E64B0F0);
    atomic_store(v0, (unint64_t *)&qword_2555E8410);
    return v0;
  }
  return v2;
}

unint64_t sub_220699E08()
{
  return sub_220699E1C();
}

unint64_t sub_220699E1C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8418;
  if (!qword_2555E8418)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9254, &unk_24E64B0F0);
    atomic_store(v0, (unint64_t *)&qword_2555E8418);
    return v0;
  }
  return v2;
}

unint64_t sub_220699E88()
{
  return sub_220699E9C();
}

unint64_t sub_220699E9C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8420;
  if (!qword_2555E8420)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E927C, &unk_24E64B0F0);
    atomic_store(v0, (unint64_t *)&qword_2555E8420);
    return v0;
  }
  return v2;
}

_QWORD *sub_220699F08(id *a1, _QWORD *a2)
{
  id v2;
  _QWORD *result;
  id v4;

  v4 = *a1;
  v2 = *a1;
  result = a2;
  *a2 = v4;
  return result;
}

uint64_t *sub_220699F3C()
{
  if (qword_2555DC628 != -1)
    swift_once();
  return &qword_2555FE370;
}

uint64_t sub_220699F90()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for GetAXColorFiltersBlueYellowHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE370 = result;
  return result;
}

uint64_t type metadata accessor for GetAXColorFiltersBlueYellowHandler()
{
  return objc_opt_self();
}

void sub_220699FF0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v13;
  int v14;
  id v15;
  char v16;
  _BYTE v17[16];
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = a1;
  v23 = a2;
  v24 = a3;
  v22 = v3;
  sub_2206DAED0();
  v8 = (id)*sub_22053C880();
  v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v5 = sub_220533170();
  v9 = *v5;
  v13 = v5[1];
  v14 = *((unsigned __int8 *)v5 + 16);
  v15 = (id)*sub_22053C880();
  v6 = v15;
  v16 = *(_BYTE *)(v3 + 24);
  v7 = a1;
  swift_retain();
  swift_retain();
  v18 = a1;
  v19 = v3;
  v20 = a2;
  v21 = a3;
  sub_220531F08(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22069A3D8, (uint64_t)v17, MEMORY[0x24BEE4AE0] + 8, v3);

  swift_release();
  swift_release();

}

void sub_22069A1A8(void *a1, uint64_t a2, void (*a3)(id))
{
  id v3;
  uint64_t *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v14;
  BOOL v15;

  v14 = objc_msgSend(a1, sel_settingMetadata);
  swift_retain();
  v15 = sub_2204B4FC8();
  swift_release();
  if (v15)
    v12 = 1;
  else
    v12 = 2;
  v11 = sub_2205AF118(v14, 0, 0, v12, 0, 0);

  sub_2206DAED0();
  v10 = (id)*sub_22053C880();
  v3 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  v9 = v4;
  v5 = v11;
  sub_220464B68();
  sub_220464C30();
  v7 = sub_2206DABDC();
  v8 = v6;
  v9[3] = MEMORY[0x24BEE0D00];
  v9[4] = sub_220464CA0();
  *v9 = v7;
  v9[1] = v8;
  sub_22045A844();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v11);
  swift_release();

}

void sub_22069A3D8()
{
  uint64_t v0;

  sub_22069A1A8(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22069A408(void *a1, uint64_t a2, uint64_t a3)
{
  sub_220699FF0(a1, a2, a3);
}

uint64_t sub_22069A428()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetAXAutoBrightnessHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE378 = result;
  return result;
}

uint64_t type metadata accessor for SetAXAutoBrightnessHandler()
{
  return objc_opt_self();
}

uint64_t *sub_22069A488()
{
  if (qword_2555DC630 != -1)
    swift_once();
  return &qword_2555FE378;
}

uint64_t sub_22069A4DC(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  uint64_t *v4;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;

  sub_2206DAED0();
  v6 = (id)*sub_22053C880();
  v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  v8 = sub_2204B7B68();
  swift_release();
  v4 = sub_2205349FC();
  v10 = *v4;
  v11 = v4[1];
  v12 = *((unsigned __int8 *)v4 + 16);
  v13 = *(_BYTE *)(v7 + 24);
  swift_retain();
  sub_220524C7C(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_22069A6D8, v7, 0, 1, 0, 0);
  return sub_2204614E0((uint64_t)sub_22069A6D8);
}

uint64_t sub_22069A66C()
{
  swift_retain();
  sub_2204B0BE4();
  return swift_release();
}

uint64_t sub_22069A6D8()
{
  return sub_22069A66C();
}

uint64_t sub_22069A6FC(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22069A4DC(a1, a2, a3);
}

uint64_t *sub_22069A71C()
{
  if (qword_2555DC638 != -1)
    swift_once();
  return &qword_2555FE380;
}

uint64_t sub_22069A770()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for GetSmartSiriVolumeHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE380 = result;
  return result;
}

uint64_t type metadata accessor for GetSmartSiriVolumeHandler()
{
  return objc_opt_self();
}

void sub_22069A7D0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v13;
  int v14;
  id v15;
  char v16;
  _BYTE v17[16];
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = a1;
  v23 = a2;
  v24 = a3;
  v22 = v3;
  sub_2206DAED0();
  v8 = (id)*sub_22053C880();
  v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v5 = sub_220533E70();
  v9 = *v5;
  v13 = v5[1];
  v14 = *((unsigned __int8 *)v5 + 16);
  v15 = (id)*sub_22053C880();
  v6 = v15;
  v16 = *(_BYTE *)(v3 + 24);
  swift_retain();
  v7 = a1;
  swift_retain();
  v18 = v3;
  v19 = a1;
  v20 = a2;
  v21 = a3;
  sub_220531F08(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22069AC50, (uint64_t)v17, MEMORY[0x24BEE4AE0] + 8, v3);
  swift_release();

  swift_release();
}

void sub_22069A984(uint64_t a1, void *a2, void (*a3)(id))
{
  id *v3;
  id v4;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  id v15;
  id *v17;
  char v18;
  id v19;

  swift_retain();
  v18 = sub_2204B9B6C();
  swift_release();
  sub_220464B68();
  v15 = sub_22045CFB4(3, 0);
  sub_220464BCC();
  sub_2206DB260();
  v17 = v3;
  v19 = objc_msgSend(a2, sel_settingMetadata);
  if ((v18 & 1) != 0)
    v13 = 1;
  else
    v13 = 2;
  *v17 = sub_2205AF06C(v19, 0, 0, v13, 0, 0);
  sub_22045A844();
  v8 = (id)sub_2206DACE4();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setSettingResponseDatas_, v8);

  sub_2206DAED0();
  v12 = (id)*sub_22053C880();
  v4 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  v11 = v5;
  v6 = v15;
  sub_220464C30();
  v9 = sub_2206DABDC();
  v10 = v7;
  v11[3] = MEMORY[0x24BEE0D00];
  v11[4] = sub_220464CA0();
  *v11 = v9;
  v11[1] = v10;
  sub_22045A844();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v15);
  swift_release();

}

void sub_22069AC50()
{
  uint64_t v0;

  sub_22069A984(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22069AC80(void *a1, uint64_t a2, uint64_t a3)
{
  sub_22069A7D0(a1, a2, a3);
}

uint64_t sub_22069ACA0()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069AD68(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return swift_task_switch();
}

uint64_t sub_22069ADA0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, uint64_t, uint64_t, uint64_t);

  v0[2] = v0;
  v5 = sub_2206DAC30();
  v6 = v1;
  v0[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v7 = sub_2206DB0B0();
  v0[7] = v7;
  v8 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92870] + (int)*MEMORY[0x24BE92870]);
  v2 = (_QWORD *)swift_task_alloc();
  v4[8] = v2;
  *v2 = v4[2];
  v2[1] = sub_22052DFE4;
  return v8(v4[4], v5, v6, v7);
}

uint64_t sub_22069AEA0()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069AF50(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v10;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v10 = v3;
  *v3 = sub_2206DAC30();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsBinarySetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_2206DAC30();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = sub_2206DA8C4();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_2206DAC30();
  v10[13] = v6;
  if (a3 == 2)
  {
    v10[14] = 0;
    v10[15] = 0;
    v10[16] = 0;
    v10[17] = 0;
  }
  else
  {
    v10[17] = MEMORY[0x24BEE1328];
    *((_BYTE *)v10 + 112) = a3 & 1;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069B20C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 72) = v4;
  *(_BYTE *)(v5 + 113) = a4;
  *(_QWORD *)(v5 + 64) = a3;
  *(_QWORD *)(v5 + 56) = a2;
  *(_QWORD *)(v5 + 48) = a1;
  *(_QWORD *)(v5 + 16) = v5;
  *(_QWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 32) = 0;
  *(_BYTE *)(v5 + 112) = 0;
  *(_QWORD *)(v5 + 40) = 0;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a3;
  *(_BYTE *)(v5 + 112) = a4;
  *(_QWORD *)(v5 + 40) = v4;
  return swift_task_switch();
}

uint64_t sub_22069B274()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t (*v10)(_QWORD, uint64_t, uint64_t, uint64_t);
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = v0[7];
  v0[2] = v0;
  v16 = sub_2206DAC30();
  v17 = v1;
  v0[10] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v18 = v2;
  *v2 = sub_2206DAC30();
  v18[1] = v3;
  swift_retain();
  if (v19)
  {
    v14 = *(_QWORD *)(v15 + 56);
    v18[5] = type metadata accessor for SettingsBinarySetting();
    v18[2] = v14;
  }
  else
  {
    v18[2] = 0;
    v18[3] = 0;
    v18[4] = 0;
    v18[5] = 0;
  }
  v13 = *(_QWORD *)(v15 + 64);
  v18[6] = sub_2206DAC30();
  v18[7] = v4;
  swift_retain();
  if (v13)
  {
    v12 = *(_QWORD *)(v15 + 64);
    v18[11] = sub_2206DA8C4();
    v18[8] = v12;
  }
  else
  {
    v18[8] = 0;
    v18[9] = 0;
    v18[10] = 0;
    v18[11] = 0;
  }
  v11 = *(unsigned __int8 *)(v15 + 113);
  v18[12] = sub_2206DAC30();
  v18[13] = v5;
  if (v11 == 2)
  {
    v18[14] = 0;
    v18[15] = 0;
    v18[16] = 0;
    v18[17] = 0;
  }
  else
  {
    v6 = *(_BYTE *)(v15 + 113);
    v18[17] = MEMORY[0x24BEE1328];
    *((_BYTE *)v18 + 112) = v6 & 1;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v9 = sub_2206DB0B0();
  *(_QWORD *)(v15 + 88) = v9;
  v10 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92870] + (int)*MEMORY[0x24BE92870]);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v15 + 96) = v7;
  *v7 = *(_QWORD *)(v15 + 16);
  v7[1] = sub_22069B5F8;
  return v10(*(_QWORD *)(v15 + 48), v16, v17, v9);
}

_QWORD *sub_22069B5F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v4 = (_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 104) = v0;
  swift_task_dealloc();
  if (v0)
    return (_QWORD *)swift_task_switch();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v4 + 8))(v4);
}

uint64_t sub_22069B6EC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t sub_22069B75C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v10;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v10 = v3;
  *v3 = sub_2206DAC30();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsBinarySetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_2206DAC30();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = sub_2206DA8C4();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_2206DAC30();
  v10[13] = v6;
  if (a3 == 2)
  {
    v10[14] = 0;
    v10[15] = 0;
    v10[16] = 0;
    v10[17] = 0;
  }
  else
  {
    v10[17] = MEMORY[0x24BEE1328];
    *((_BYTE *)v10 + 112) = a3 & 1;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069BA00(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v4;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v4 = v1;
  *v1 = sub_2206DAC30();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_2206DA8C4();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069BB90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[3] = a2;
  v3[4] = v2;
  return swift_task_switch();
}

uint64_t sub_22069BBD8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;

  v13 = v0[6];
  v0[2] = v0;
  v10 = sub_2206DAC30();
  v11 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v12 = v2;
  *v2 = sub_2206DAC30();
  v12[1] = v3;
  swift_retain();
  if (v13)
  {
    v8 = v9[6];
    v12[5] = sub_2206DA8C4();
    v12[2] = v8;
  }
  else
  {
    v12[2] = 0;
    v12[3] = 0;
    v12[4] = 0;
    v12[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v6 = sub_2206DB0B0();
  v9[9] = v6;
  v7 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92870] + (int)*MEMORY[0x24BE92870]);
  v4 = (_QWORD *)swift_task_alloc();
  v9[10] = v4;
  *v4 = v9[2];
  v4[1] = sub_22052E4E0;
  return v7(v9[5], v10, v11, v6);
}

uint64_t sub_22069BDB0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v4;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v4 = v1;
  *v1 = sub_2206DAC30();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_2206DA8C4();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069BF28()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069BFF0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return swift_task_switch();
}

uint64_t sub_22069C028()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, uint64_t, uint64_t, uint64_t);

  v0[2] = v0;
  v5 = sub_2206DAC30();
  v6 = v1;
  v0[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v7 = sub_2206DB0B0();
  v0[7] = v7;
  v8 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92870] + (int)*MEMORY[0x24BE92870]);
  v2 = (_QWORD *)swift_task_alloc();
  v4[8] = v2;
  *v2 = v4[2];
  v2[1] = sub_22052DFE4;
  return v8(v4[4], v5, v6, v7);
}

uint64_t sub_22069C128()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069C1D8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v4;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v4 = v1;
  *v1 = sub_2206DAC30();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = type metadata accessor for SettingsBinarySetting();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069C368(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[3] = a2;
  v3[4] = v2;
  return swift_task_switch();
}

uint64_t sub_22069C3B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;

  v13 = v0[6];
  v0[2] = v0;
  v10 = sub_2206DAC30();
  v11 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v12 = v2;
  *v2 = sub_2206DAC30();
  v12[1] = v3;
  swift_retain();
  if (v13)
  {
    v8 = v9[6];
    v12[5] = type metadata accessor for SettingsBinarySetting();
    v12[2] = v8;
  }
  else
  {
    v12[2] = 0;
    v12[3] = 0;
    v12[4] = 0;
    v12[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v6 = sub_2206DB0B0();
  v9[9] = v6;
  v7 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92870] + (int)*MEMORY[0x24BE92870]);
  v4 = (_QWORD *)swift_task_alloc();
  v9[10] = v4;
  *v4 = v9[2];
  v4[1] = sub_22052E4E0;
  return v7(v9[5], v10, v11, v6);
}

uint64_t sub_22069C588(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v4;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v4 = v1;
  *v1 = sub_2206DAC30();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = type metadata accessor for SettingsBinarySetting();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069C700()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069C7C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return swift_task_switch();
}

uint64_t sub_22069C800()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, uint64_t, uint64_t, uint64_t);

  v0[2] = v0;
  v5 = sub_2206DAC30();
  v6 = v1;
  v0[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v7 = sub_2206DB0B0();
  v0[7] = v7;
  v8 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92870] + (int)*MEMORY[0x24BE92870]);
  v2 = (_QWORD *)swift_task_alloc();
  v4[8] = v2;
  *v2 = v4[2];
  v2[1] = sub_22052DFE4;
  return v8(v4[4], v5, v6, v7);
}

uint64_t sub_22069C900()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069C9B0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsNumericSetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  if (a2 == 2)
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  else
  {
    v7[11] = MEMORY[0x24BEE1328];
    *((_BYTE *)v7 + 64) = a2 & 1;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069CBD0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 56) = v3;
  *(_BYTE *)(v4 + 97) = a3;
  *(_QWORD *)(v4 + 48) = a2;
  *(_QWORD *)(v4 + 40) = a1;
  *(_QWORD *)(v4 + 16) = v4;
  *(_QWORD *)(v4 + 24) = 0;
  *(_BYTE *)(v4 + 96) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 24) = a2;
  *(_BYTE *)(v4 + 96) = a3;
  *(_QWORD *)(v4 + 32) = v3;
  return swift_task_switch();
}

uint64_t sub_22069CC28()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t (*v9)(_QWORD, uint64_t, uint64_t, uint64_t);
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;

  v16 = v0[6];
  v0[2] = v0;
  v13 = sub_2206DAC30();
  v14 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v15 = v2;
  *v2 = sub_2206DAC30();
  v15[1] = v3;
  swift_retain();
  if (v16)
  {
    v11 = *(_QWORD *)(v12 + 48);
    v15[5] = type metadata accessor for SettingsNumericSetting();
    v15[2] = v11;
  }
  else
  {
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = 0;
    v15[5] = 0;
  }
  v10 = *(unsigned __int8 *)(v12 + 97);
  v15[6] = sub_2206DAC30();
  v15[7] = v4;
  if (v10 == 2)
  {
    v15[8] = 0;
    v15[9] = 0;
    v15[10] = 0;
    v15[11] = 0;
  }
  else
  {
    v5 = *(_BYTE *)(v12 + 97);
    v15[11] = MEMORY[0x24BEE1328];
    *((_BYTE *)v15 + 64) = v5 & 1;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v8 = sub_2206DB0B0();
  *(_QWORD *)(v12 + 72) = v8;
  v9 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92870] + (int)*MEMORY[0x24BE92870]);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v12 + 80) = v6;
  *v6 = *(_QWORD *)(v12 + 16);
  v6[1] = sub_22069CEC0;
  return v9(*(_QWORD *)(v12 + 40), v13, v14, v8);
}

_QWORD *sub_22069CEC0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v4 = (_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
    return (_QWORD *)swift_task_switch();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v4 + 8))(v4);
}

uint64_t sub_22069CFA4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t sub_22069D010(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsNumericSetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  if (a2 == 2)
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  else
  {
    v7[11] = MEMORY[0x24BEE1328];
    *((_BYTE *)v7 + 64) = a2 & 1;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069D218(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v10;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v10 = v3;
  *v3 = sub_2206DAC30();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsBinarySetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_2206DAC30();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = type metadata accessor for SettingsMultiSetting();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_2206DAC30();
  v10[13] = v6;
  v10[17] = MEMORY[0x24BEE1328];
  *((_BYTE *)v10 + 112) = a3 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069D4A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 72) = v4;
  *(_BYTE *)(v5 + 113) = a4 & 1;
  *(_QWORD *)(v5 + 64) = a3;
  *(_QWORD *)(v5 + 56) = a2;
  *(_QWORD *)(v5 + 48) = a1;
  *(_QWORD *)(v5 + 16) = v5;
  *(_QWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 32) = 0;
  *(_BYTE *)(v5 + 112) = 0;
  *(_QWORD *)(v5 + 40) = 0;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a3;
  *(_BYTE *)(v5 + 112) = a4 & 1;
  *(_QWORD *)(v5 + 40) = v4;
  return swift_task_switch();
}

uint64_t sub_22069D524()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;

  v18 = v0[7];
  v0[2] = v0;
  v15 = sub_2206DAC30();
  v16 = v1;
  v0[10] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v17 = v2;
  *v2 = sub_2206DAC30();
  v17[1] = v3;
  swift_retain();
  if (v18)
  {
    v13 = *(_QWORD *)(v14 + 56);
    v17[5] = type metadata accessor for SettingsBinarySetting();
    v17[2] = v13;
  }
  else
  {
    v17[2] = 0;
    v17[3] = 0;
    v17[4] = 0;
    v17[5] = 0;
  }
  v12 = *(_QWORD *)(v14 + 64);
  v17[6] = sub_2206DAC30();
  v17[7] = v4;
  swift_retain();
  if (v12)
  {
    v11 = *(_QWORD *)(v14 + 64);
    v17[11] = type metadata accessor for SettingsMultiSetting();
    v17[8] = v11;
  }
  else
  {
    v17[8] = 0;
    v17[9] = 0;
    v17[10] = 0;
    v17[11] = 0;
  }
  v8 = *(_BYTE *)(v14 + 113);
  v17[12] = sub_2206DAC30();
  v17[13] = v5;
  v17[17] = MEMORY[0x24BEE1328];
  *((_BYTE *)v17 + 112) = v8 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v9 = sub_2206DB0B0();
  *(_QWORD *)(v14 + 88) = v9;
  v10 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92870] + (int)*MEMORY[0x24BE92870]);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v14 + 96) = v6;
  *v6 = *(_QWORD *)(v14 + 16);
  v6[1] = sub_22069B5F8;
  return v10(*(_QWORD *)(v14 + 48), v15, v16, v9);
}

uint64_t sub_22069D848(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v10;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v10 = v3;
  *v3 = sub_2206DAC30();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsBinarySetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_2206DAC30();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = type metadata accessor for SettingsMultiSetting();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_2206DAC30();
  v10[13] = v6;
  v10[17] = MEMORY[0x24BEE1328];
  *((_BYTE *)v10 + 112) = a3 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069DAC0()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069DB88(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return swift_task_switch();
}

uint64_t sub_22069DBC0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, uint64_t, uint64_t, uint64_t);

  v0[2] = v0;
  v5 = sub_2206DAC30();
  v6 = v1;
  v0[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v7 = sub_2206DB0B0();
  v0[7] = v7;
  v8 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92870] + (int)*MEMORY[0x24BE92870]);
  v2 = (_QWORD *)swift_task_alloc();
  v4[8] = v2;
  *v2 = v4[2];
  v2[1] = sub_22052DFE4;
  return v8(v4[4], v5, v6, v7);
}

uint64_t sub_22069DCC0()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069DD70(char a1, char a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t *v12;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v12 = v3;
  *v3 = sub_2206DAC30();
  v12[1] = v4;
  v10 = MEMORY[0x24BEE1328];
  v12[5] = MEMORY[0x24BEE1328];
  *((_BYTE *)v12 + 16) = a1 & 1;
  v12[6] = sub_2206DAC30();
  v12[7] = v5;
  v12[11] = v10;
  *((_BYTE *)v12 + 64) = a2 & 1;
  v12[12] = sub_2206DAC30();
  v12[13] = v6;
  v12[17] = v10;
  *((_BYTE *)v12 + 112) = a3 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069DF68(uint64_t a1, char a2, char a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 83) = a4 & 1;
  *(_BYTE *)(v5 + 82) = a3 & 1;
  *(_BYTE *)(v5 + 81) = a2 & 1;
  *(_QWORD *)(v5 + 32) = a1;
  *(_QWORD *)(v5 + 16) = v5;
  *(_BYTE *)(v5 + 80) = 0;
  *(_BYTE *)(v5 + 88) = 0;
  *(_BYTE *)(v5 + 96) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  *(_BYTE *)(v5 + 80) = a2 & 1;
  *(_BYTE *)(v5 + 88) = a3 & 1;
  *(_BYTE *)(v5 + 96) = a4 & 1;
  *(_QWORD *)(v5 + 24) = v4;
  return swift_task_switch();
}

uint64_t sub_22069E004()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(_QWORD, uint64_t, uint64_t, uint64_t);

  v11 = *(_BYTE *)(v0 + 83);
  v9 = *(_BYTE *)(v0 + 82);
  v8 = *(_BYTE *)(v0 + 81);
  *(_QWORD *)(v0 + 16) = v0;
  v14 = sub_2206DAC30();
  v15 = v1;
  *(_QWORD *)(v0 + 48) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v12 = v2;
  *v2 = sub_2206DAC30();
  v12[1] = v3;
  v10 = MEMORY[0x24BEE1328];
  v12[5] = MEMORY[0x24BEE1328];
  *((_BYTE *)v12 + 16) = v8 & 1;
  v12[6] = sub_2206DAC30();
  v12[7] = v4;
  v12[11] = v10;
  *((_BYTE *)v12 + 64) = v9 & 1;
  v12[12] = sub_2206DAC30();
  v12[13] = v5;
  v12[17] = v10;
  *((_BYTE *)v12 + 112) = v11 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v16 = sub_2206DB0B0();
  *(_QWORD *)(v0 + 56) = v16;
  v17 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92870] + (int)*MEMORY[0x24BE92870]);
  v6 = (_QWORD *)swift_task_alloc();
  v13[8] = v6;
  *v6 = v13[2];
  v6[1] = sub_22069E218;
  return v17(v13[4], v14, v15, v16);
}

_QWORD *sub_22069E218()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v4 = (_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return (_QWORD *)swift_task_switch();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v4 + 8))(v4);
}

uint64_t sub_22069E30C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t sub_22069E37C(char a1, char a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t *v12;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v12 = v3;
  *v3 = sub_2206DAC30();
  v12[1] = v4;
  v10 = MEMORY[0x24BEE1328];
  v12[5] = MEMORY[0x24BEE1328];
  *((_BYTE *)v12 + 16) = a1 & 1;
  v12[6] = sub_2206DAC30();
  v12[7] = v5;
  v12[11] = v10;
  *((_BYTE *)v12 + 64) = a2 & 1;
  v12[12] = sub_2206DAC30();
  v12[13] = v6;
  v12[17] = v10;
  *((_BYTE *)v12 + 112) = a3 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069E55C(char a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t *v9;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v9 = v2;
  *v2 = sub_2206DAC30();
  v9[1] = v3;
  v7 = MEMORY[0x24BEE1328];
  v9[5] = MEMORY[0x24BEE1328];
  *((_BYTE *)v9 + 16) = a1 & 1;
  v9[6] = sub_2206DAC30();
  v9[7] = v4;
  v9[11] = v7;
  *((_BYTE *)v9 + 64) = a2 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SettingIntentCATs()
{
  uint64_t v1;

  v1 = qword_2555E8688;
  if (!qword_2555E8688)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_22069E74C()
{
  uint64_t inited;

  inited = swift_initClassMetadata2();
  if (!inited)
    return 0;
  return inited;
}

uint64_t sub_22069E7BC()
{
  return type metadata accessor for SettingIntentCATs();
}

BOOL sub_22069E7D4()
{
  uint64_t v0;
  uint64_t v2;

  sub_2206DB260();
  *(_QWORD *)v0 = "ClarityUIIntent#CannotDo";
  *(_QWORD *)(v0 + 8) = 24;
  *(_BYTE *)(v0 + 16) = 2;
  sub_22045A844();
  v2 = sub_2206DB14C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 != 0;
}

uint64_t sub_22069E8B4()
{
  return sub_2206DAC30();
}

uint64_t sub_22069E8E4()
{
  sub_22069E92C();
  return sub_2206DB284() & 1;
}

unint64_t sub_22069E92C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E86D8[0];
  if (!qword_2555E86D8[0])
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E95E4, &unk_24E64B340);
    atomic_store(v0, qword_2555E86D8);
    return v0;
  }
  return v2;
}

uint64_t sub_22069E998()
{
  sub_22069E92C();
  return sub_2206DACB4();
}

uint64_t sub_22069E9D4()
{
  sub_22069E92C();
  return sub_2206DACCC();
}

uint64_t sub_22069EA18()
{
  sub_22069E92C();
  return sub_2206DACC0();
}

BOOL sub_22069EA5C@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_22069E7D4();
  *a1 = result;
  return result;
}

uint64_t sub_22069EA98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  result = sub_22069E8B4();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_22069EAC4()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069EB8C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[5] = v1;
  v2[4] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[3] = v1;
  return swift_task_switch();
}

uint64_t sub_22069EBC4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, uint64_t, uint64_t, uint64_t);

  v0[2] = v0;
  v5 = sub_2206DAC30();
  v6 = v1;
  v0[6] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v7 = sub_2206DB0B0();
  v0[7] = v7;
  v8 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92870] + (int)*MEMORY[0x24BE92870]);
  v2 = (_QWORD *)swift_task_alloc();
  v4[8] = v2;
  *v2 = v4[2];
  v2[1] = sub_22052DFE4;
  return v8(v4[4], v5, v6, v7);
}

uint64_t sub_22069ECC4()
{
  uint64_t v0;
  _QWORD *v1;

  v1[4] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  return swift_task_switch();
}

uint64_t sub_22069ECF8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v0[2] = v0;
  v8 = sub_2206DAC30();
  v5 = v1;
  v0[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v6 = sub_2206DB0B0();
  v0[6] = v6;
  v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92858] + (int)*MEMORY[0x24BE92858]);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 56) = v2;
  *v2 = *(_QWORD *)(v4 + 16);
  v2[1] = sub_2204DC6DC;
  return v7(v8, v5, v6);
}

uint64_t sub_22069EDF4()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for ClarityUIIntentCATs()
{
  uint64_t v1;

  v1 = qword_2555E86F0;
  if (!qword_2555E86F0)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_22069EF08()
{
  uint64_t inited;

  inited = swift_initClassMetadata2();
  if (!inited)
    return 0;
  return inited;
}

uint64_t sub_22069EF78()
{
  return type metadata accessor for ClarityUIIntentCATs();
}

void *type metadata accessor for ClarityUIIntentCATs.Properties()
{
  return &unk_24E64B340;
}

unint64_t sub_22069EFA4()
{
  return sub_22069EFB8();
}

unint64_t sub_22069EFB8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8740;
  if (!qword_2555E8740)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E95BC, &unk_24E64B340);
    atomic_store(v0, (unint64_t *)&qword_2555E8740);
    return v0;
  }
  return v2;
}

uint64_t *sub_22069F024()
{
  if (qword_2555DC640 != -1)
    swift_once();
  return &qword_2555FE3A8;
}

uint64_t sub_22069F078()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for GetAXOnOffLabelsHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE3A8 = result;
  return result;
}

uint64_t type metadata accessor for GetAXOnOffLabelsHandler()
{
  return objc_opt_self();
}

void sub_22069F0D8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v13;
  int v14;
  id v15;
  char v16;
  _BYTE v17[16];
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = a1;
  v23 = a2;
  v24 = a3;
  v22 = v3;
  sub_2206DAED0();
  v8 = (id)*sub_22053C880();
  v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v5 = sub_220533468();
  v9 = *v5;
  v13 = v5[1];
  v14 = *((unsigned __int8 *)v5 + 16);
  v15 = (id)*sub_22053C880();
  v6 = v15;
  v16 = *(_BYTE *)(v3 + 24);
  v7 = a1;
  swift_retain();
  swift_retain();
  v18 = a1;
  v19 = v3;
  v20 = a2;
  v21 = a3;
  sub_220531F08(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22069F4C0, (uint64_t)v17, MEMORY[0x24BEE4AE0] + 8, v3);

  swift_release();
  swift_release();

}

void sub_22069F290(void *a1, uint64_t a2, void (*a3)(id))
{
  id v3;
  uint64_t *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v14;
  BOOL v15;

  v14 = objc_msgSend(a1, sel_settingMetadata);
  swift_retain();
  v15 = sub_2204B49B0();
  swift_release();
  if (v15)
    v12 = 1;
  else
    v12 = 2;
  v11 = sub_2205AF118(v14, 0, 0, v12, 0, 0);

  sub_2206DAED0();
  v10 = (id)*sub_22053C880();
  v3 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  v9 = v4;
  v5 = v11;
  sub_220464B68();
  sub_220464C30();
  v7 = sub_2206DABDC();
  v8 = v6;
  v9[3] = MEMORY[0x24BEE0D00];
  v9[4] = sub_220464CA0();
  *v9 = v7;
  v9[1] = v8;
  sub_22045A844();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v11);
  swift_release();

}

void sub_22069F4C0()
{
  uint64_t v0;

  sub_22069F290(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22069F4F0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_22069F0D8(a1, a2, a3);
}

uint64_t sub_22069F510()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetAXButtonShapesHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE3B0 = result;
  return result;
}

uint64_t type metadata accessor for SetAXButtonShapesHandler()
{
  return objc_opt_self();
}

uint64_t *sub_22069F570()
{
  if (qword_2555DC648 != -1)
    swift_once();
  return &qword_2555FE3B0;
}

uint64_t sub_22069F5C4(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  uint64_t *v4;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;

  sub_2206DAED0();
  v6 = (id)*sub_22053C880();
  v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  v8 = sub_2204B48E8();
  swift_release();
  v4 = sub_220534B2C();
  v10 = *v4;
  v11 = v4[1];
  v12 = *((unsigned __int8 *)v4 + 16);
  v13 = *(_BYTE *)(v7 + 24);
  swift_retain();
  sub_220524C7C(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_22069F7C0, v7, 0, 1, 0, 0);
  return sub_2204614E0((uint64_t)sub_22069F7C0);
}

uint64_t sub_22069F754()
{
  swift_retain();
  sub_2204B4918();
  return swift_release();
}

uint64_t sub_22069F7C0()
{
  return sub_22069F754();
}

uint64_t sub_22069F7E4(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_22069F5C4(a1, a2, a3);
}

uint64_t *sub_22069F804()
{
  if (qword_2555DC650 != -1)
    swift_once();
  return &qword_2555FE3B8;
}

uint64_t sub_22069F858()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for GetAXInvertColorsHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE3B8 = result;
  return result;
}

uint64_t type metadata accessor for GetAXInvertColorsHandler()
{
  return objc_opt_self();
}

void sub_22069F8B8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v13;
  int v14;
  id v15;
  char v16;
  _BYTE v17[16];
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = a1;
  v23 = a2;
  v24 = a3;
  v22 = v3;
  sub_2206DAED0();
  v8 = (id)*sub_22053C880();
  v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v5 = sub_2205333D0();
  v9 = *v5;
  v13 = v5[1];
  v14 = *((unsigned __int8 *)v5 + 16);
  v15 = (id)*sub_22053C880();
  v6 = v15;
  v16 = *(_BYTE *)(v3 + 24);
  swift_retain();
  v7 = a1;
  swift_retain();
  v18 = v3;
  v19 = a1;
  v20 = a2;
  v21 = a3;
  sub_220531F08(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_22069FD38, (uint64_t)v17, MEMORY[0x24BEE4AE0] + 8, v3);
  swift_release();

  swift_release();
}

void sub_22069FA6C(uint64_t a1, void *a2, void (*a3)(id))
{
  id *v3;
  id v4;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  id v15;
  id *v17;
  BOOL v18;
  id v19;

  swift_retain();
  v18 = sub_2204B4C94();
  swift_release();
  sub_220464B68();
  v15 = sub_22045CFB4(3, 0);
  sub_220464BCC();
  sub_2206DB260();
  v17 = v3;
  v19 = objc_msgSend(a2, sel_settingMetadata);
  if (v18)
    v13 = 1;
  else
    v13 = 2;
  *v17 = sub_2205AF06C(v19, 0, 0, v13, 0, 0);
  sub_22045A844();
  v8 = (id)sub_2206DACE4();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setSettingResponseDatas_, v8);

  sub_2206DAED0();
  v12 = (id)*sub_22053C880();
  v4 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  v11 = v5;
  v6 = v15;
  sub_220464C30();
  v9 = sub_2206DABDC();
  v10 = v7;
  v11[3] = MEMORY[0x24BEE0D00];
  v11[4] = sub_220464CA0();
  *v11 = v9;
  v11[1] = v10;
  sub_22045A844();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v15);
  swift_release();

}

void sub_22069FD38()
{
  uint64_t v0;

  sub_22069FA6C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_22069FD68(void *a1, uint64_t a2, uint64_t a3)
{
  sub_22069F8B8(a1, a2, a3);
}

uint64_t sub_22069FD88(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v4;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v4 = v1;
  *v1 = sub_2206DAC30();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_2206DA84C();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22069FF18(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v4;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v4 = v1;
  *v1 = sub_2206DAC30();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_2206DA84C();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A0090()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A0158()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A0208(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  v7[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v7 + 64) = a2 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A03FC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  v7[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v7 + 64) = a2 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A05D8()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A06A0()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A0750(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v4;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v4 = v1;
  *v1 = sub_2206DAC30();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = type metadata accessor for SettingsMultiSetting();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A08E0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v4;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v4 = v1;
  *v1 = sub_2206DAC30();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = type metadata accessor for SettingsMultiSetting();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A0A58(uint64_t a1, int a2, int a3, uint64_t a4, const void *a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  const void *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t *v52;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t *v70;
  _QWORD v71[3];
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t *v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  int v86;
  uint64_t v87;
  const void *v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  char v111;
  uint64_t v112;

  v102 = a1;
  v85 = a2;
  v86 = a3;
  v87 = a4;
  v88 = a5;
  v89 = a6;
  v90 = a7;
  v91 = a8;
  v92 = a9;
  v112 = 0;
  v111 = 0;
  v110 = 0;
  v109 = 0;
  v108 = 0;
  v107 = 0;
  v106 = 0;
  v104 = 0;
  v105 = 0;
  v103 = 0;
  v93 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v102);
  v94 = (char *)v71 - v93;
  v112 = v10;
  v98 = 1;
  v111 = v11 & 1;
  v110 = v12 & 1;
  v109 = v13;
  v108 = v14;
  v107 = v15 & 1;
  v106 = v16;
  v104 = v17;
  v105 = v18;
  v103 = v9;
  sub_2204D0BB0(0);
  v95 = v19;
  v96 = v20;
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v100 = 7;
  v99 = sub_2206DB260();
  v101 = v21;
  v22 = sub_2206DAC30();
  v23 = v101;
  *v101 = v22;
  v23[1] = v24;
  swift_retain();
  if (v102)
  {
    v84 = v102;
    v83 = v102;
    v25 = type metadata accessor for SettingsBinarySetting();
    v26 = v101;
    v27 = v83;
    v101[5] = v25;
    v26[2] = v27;
  }
  else
  {
    v70 = v101;
    v101[2] = 0;
    v70[3] = 0;
    v70[4] = 0;
    v70[5] = 0;
  }
  v82 = 1;
  v28 = sub_2206DAC30();
  v29 = v85;
  v30 = v82;
  v31 = v101;
  v101[6] = v28;
  v31[7] = v32;
  v81 = MEMORY[0x24BEE1328];
  v31[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v31 + 64) = v29 & v30;
  v33 = sub_2206DAC30();
  v34 = v81;
  v35 = v86;
  v36 = v82;
  v37 = v101;
  v101[12] = v33;
  v37[13] = v38;
  v37[17] = v34;
  *((_BYTE *)v37 + 112) = v35 & v36;
  v39 = sub_2206DAC30();
  v40 = v101;
  v101[18] = v39;
  v40[19] = v41;
  swift_retain();
  if (v87)
  {
    v80 = v87;
    v79 = v87;
    v42 = sub_2206DA8C4();
    v43 = v101;
    v44 = v79;
    v101[23] = v42;
    v43[20] = v44;
  }
  else
  {
    v69 = v101;
    v101[20] = 0;
    v69[21] = 0;
    v69[22] = 0;
    v69[23] = 0;
  }
  v75 = v101 + 26;
  v76 = 1;
  v45 = sub_2206DAC30();
  v46 = v101;
  v47 = v45;
  v48 = v88;
  v50 = v49;
  v51 = v94;
  v101[24] = v47;
  v46[25] = v50;
  sub_2204A395C(v48, v51);
  v77 = sub_2206DA870();
  v78 = *(_QWORD *)(v77 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v78 + 48))(v94, v76) == 1)
  {
    sub_2204A2148((uint64_t)v94);
    v68 = v101;
    v101[26] = 0;
    v68[27] = 0;
    v68[28] = 0;
    v68[29] = 0;
  }
  else
  {
    v52 = v75;
    v101[29] = v77;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v52);
    (*(void (**)(uint64_t *, char *, uint64_t))(v78 + 32))(boxed_opaque_existential_1, v94, v77);
  }
  v74 = 1;
  v54 = sub_2206DAC30();
  v55 = v89;
  v56 = v74;
  v57 = v101;
  v101[30] = v54;
  v57[31] = v58;
  v57[35] = MEMORY[0x24BEE1328];
  *((_BYTE *)v57 + 256) = v55 & v56;
  v59 = sub_2206DAC30();
  v60 = v101;
  v101[36] = v59;
  v60[37] = v61;
  swift_retain();
  if (v90)
  {
    v73 = v90;
    v72 = v90;
    v62 = sub_2206DA84C();
    v63 = v101;
    v64 = v72;
    v101[41] = v62;
    v63[38] = v64;
  }
  else
  {
    v67 = v101;
    v101[38] = 0;
    v67[39] = 0;
    v67[40] = 0;
    v67[41] = 0;
  }
  v65 = v99;
  sub_22045A844();
  v71[1] = v65;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v71[2] = sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A0FD4@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X3>, const void *a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  const void *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t *v48;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t *v66;
  _QWORD v67[2];
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t *v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  int v83;
  uint64_t v84;
  const void *v85;
  int v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  char v104;
  uint64_t v105;

  v81 = a8;
  v97 = a1;
  v82 = a2;
  v83 = a3;
  v84 = a4;
  v85 = a5;
  v86 = a6;
  v87 = a7;
  v105 = 0;
  v104 = 0;
  v103 = 0;
  v102 = 0;
  v101 = 0;
  v100 = 0;
  v99 = 0;
  v98 = 0;
  v88 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v89 = (char *)v67 - v88;
  v105 = MEMORY[0x24BDAC7A8](v97);
  v93 = 1;
  v104 = v9 & 1;
  v103 = v10 & 1;
  v102 = v11;
  v101 = v12;
  v100 = v13 & 1;
  v99 = v14;
  v98 = v8;
  sub_2204D0BB0(0);
  v90 = v15;
  v91 = v16;
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v95 = 7;
  v94 = sub_2206DB260();
  v96 = v17;
  v18 = sub_2206DAC30();
  v19 = v96;
  *v96 = v18;
  v19[1] = v20;
  swift_retain();
  if (v97)
  {
    v80 = v97;
    v79 = v97;
    v21 = type metadata accessor for SettingsBinarySetting();
    v22 = v96;
    v23 = v79;
    v96[5] = v21;
    v22[2] = v23;
  }
  else
  {
    v66 = v96;
    v96[2] = 0;
    v66[3] = 0;
    v66[4] = 0;
    v66[5] = 0;
  }
  v78 = 1;
  v24 = sub_2206DAC30();
  v25 = v82;
  v26 = v78;
  v27 = v96;
  v96[6] = v24;
  v27[7] = v28;
  v77 = MEMORY[0x24BEE1328];
  v27[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v27 + 64) = v25 & v26;
  v29 = sub_2206DAC30();
  v30 = v77;
  v31 = v83;
  v32 = v78;
  v33 = v96;
  v96[12] = v29;
  v33[13] = v34;
  v33[17] = v30;
  *((_BYTE *)v33 + 112) = v31 & v32;
  v35 = sub_2206DAC30();
  v36 = v96;
  v96[18] = v35;
  v36[19] = v37;
  swift_retain();
  if (v84)
  {
    v76 = v84;
    v75 = v84;
    v38 = sub_2206DA8C4();
    v39 = v96;
    v40 = v75;
    v96[23] = v38;
    v39[20] = v40;
  }
  else
  {
    v65 = v96;
    v96[20] = 0;
    v65[21] = 0;
    v65[22] = 0;
    v65[23] = 0;
  }
  v71 = v96 + 26;
  v72 = 1;
  v41 = sub_2206DAC30();
  v42 = v96;
  v43 = v41;
  v44 = v85;
  v46 = v45;
  v47 = v89;
  v96[24] = v43;
  v42[25] = v46;
  sub_2204A395C(v44, v47);
  v73 = sub_2206DA870();
  v74 = *(_QWORD *)(v73 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v74 + 48))(v89, v72) == 1)
  {
    sub_2204A2148((uint64_t)v89);
    v64 = v96;
    v96[26] = 0;
    v64[27] = 0;
    v64[28] = 0;
    v64[29] = 0;
  }
  else
  {
    v48 = v71;
    v96[29] = v73;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v48);
    (*(void (**)(uint64_t *, char *, uint64_t))(v74 + 32))(boxed_opaque_existential_1, v89, v73);
  }
  v70 = 1;
  v50 = sub_2206DAC30();
  v51 = v86;
  v52 = v70;
  v53 = v96;
  v96[30] = v50;
  v53[31] = v54;
  v53[35] = MEMORY[0x24BEE1328];
  *((_BYTE *)v53 + 256) = v51 & v52;
  v55 = sub_2206DAC30();
  v56 = v96;
  v96[36] = v55;
  v56[37] = v57;
  swift_retain();
  if (v87)
  {
    v69 = v87;
    v68 = v87;
    v58 = sub_2206DA84C();
    v59 = v96;
    v60 = v68;
    v96[41] = v58;
    v59[38] = v60;
  }
  else
  {
    v63 = v96;
    v96[38] = 0;
    v63[39] = 0;
    v63[40] = 0;
    v63[41] = 0;
  }
  v61 = v94;
  sub_22045A844();
  v67[0] = v61;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v67[1] = sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A1510(uint64_t a1, int a2, int a3, uint64_t a4, const void *a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  const void *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t *v50;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v52;
  char v53;
  char v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t *v68;
  _QWORD v69[3];
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t *v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t v85;
  const void *v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  char v109;
  uint64_t v110;

  v100 = a1;
  v83 = a2;
  v84 = a3;
  v85 = a4;
  v86 = a5;
  v87 = a6;
  v88 = a7;
  v89 = a8;
  v91 = a9;
  v110 = 0;
  v109 = 0;
  v108 = 0;
  v107 = 0;
  v106 = 0;
  v105 = 0;
  v104 = 0;
  v102 = 0;
  v103 = 0;
  v101 = 0;
  v90 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v100);
  v92 = (char *)v69 - v90;
  v110 = v10;
  v96 = 1;
  v109 = v11 & 1;
  v108 = v12 & 1;
  v107 = v13;
  v106 = v14;
  v105 = v15 & 1;
  v104 = v16;
  v102 = v17;
  v103 = a9;
  v101 = v9;
  v93 = sub_2206DAC30();
  v94 = v18;
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v98 = 7;
  v97 = sub_2206DB260();
  v99 = v19;
  v20 = sub_2206DAC30();
  v21 = v99;
  *v99 = v20;
  v21[1] = v22;
  swift_retain();
  if (v100)
  {
    v82 = v100;
    v81 = v100;
    v23 = type metadata accessor for SettingsBinarySetting();
    v24 = v99;
    v25 = v81;
    v99[5] = v23;
    v24[2] = v25;
  }
  else
  {
    v68 = v99;
    v99[2] = 0;
    v68[3] = 0;
    v68[4] = 0;
    v68[5] = 0;
  }
  v80 = 1;
  v26 = sub_2206DAC30();
  v27 = v83;
  v28 = v80;
  v29 = v99;
  v99[6] = v26;
  v29[7] = v30;
  v79 = MEMORY[0x24BEE1328];
  v29[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v29 + 64) = v27 & v28;
  v31 = sub_2206DAC30();
  v32 = v79;
  v33 = v84;
  v34 = v80;
  v35 = v99;
  v99[12] = v31;
  v35[13] = v36;
  v35[17] = v32;
  *((_BYTE *)v35 + 112) = v33 & v34;
  v37 = sub_2206DAC30();
  v38 = v99;
  v99[18] = v37;
  v38[19] = v39;
  swift_retain();
  if (v85)
  {
    v78 = v85;
    v77 = v85;
    v40 = sub_2206DA8C4();
    v41 = v99;
    v42 = v77;
    v99[23] = v40;
    v41[20] = v42;
  }
  else
  {
    v67 = v99;
    v99[20] = 0;
    v67[21] = 0;
    v67[22] = 0;
    v67[23] = 0;
  }
  v73 = v99 + 26;
  v74 = 1;
  v43 = sub_2206DAC30();
  v44 = v99;
  v45 = v43;
  v46 = v86;
  v48 = v47;
  v49 = v92;
  v99[24] = v45;
  v44[25] = v48;
  sub_2204A395C(v46, v49);
  v75 = sub_2206DA870();
  v76 = *(_QWORD *)(v75 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v76 + 48))(v92, v74) == 1)
  {
    sub_2204A2148((uint64_t)v92);
    v66 = v99;
    v99[26] = 0;
    v66[27] = 0;
    v66[28] = 0;
    v66[29] = 0;
  }
  else
  {
    v50 = v73;
    v99[29] = v75;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v50);
    (*(void (**)(uint64_t *, char *, uint64_t))(v76 + 32))(boxed_opaque_existential_1, v92, v75);
  }
  v72 = 1;
  v52 = sub_2206DAC30();
  v53 = v87;
  v54 = v72;
  v55 = v99;
  v99[30] = v52;
  v55[31] = v56;
  v55[35] = MEMORY[0x24BEE1328];
  *((_BYTE *)v55 + 256) = v53 & v54;
  v57 = sub_2206DAC30();
  v58 = v99;
  v99[36] = v57;
  v58[37] = v59;
  swift_retain();
  if (v88)
  {
    v71 = v88;
    v70 = v88;
    v60 = sub_2206DA84C();
    v61 = v99;
    v62 = v70;
    v99[41] = v60;
    v61[38] = v62;
  }
  else
  {
    v65 = v99;
    v99[38] = 0;
    v65[39] = 0;
    v65[40] = 0;
    v65[41] = 0;
  }
  v63 = v97;
  sub_22045A844();
  v69[1] = v63;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v69[2] = sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A1A9C@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X3>, const void *a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  const void *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t *v47;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  _QWORD v66[2];
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t *v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  int v82;
  uint64_t v83;
  const void *v84;
  int v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  char v103;
  uint64_t v104;

  v80 = a8;
  v96 = a1;
  v81 = a2;
  v82 = a3;
  v83 = a4;
  v84 = a5;
  v85 = a6;
  v86 = a7;
  v104 = 0;
  v103 = 0;
  v102 = 0;
  v101 = 0;
  v100 = 0;
  v99 = 0;
  v98 = 0;
  v97 = 0;
  v87 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v88 = (char *)v66 - v87;
  v104 = MEMORY[0x24BDAC7A8](v96);
  v92 = 1;
  v103 = v9 & 1;
  v102 = v10 & 1;
  v101 = v11;
  v100 = v12;
  v99 = v13 & 1;
  v98 = v14;
  v97 = v8;
  v89 = sub_2206DAC30();
  v90 = v15;
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v94 = 7;
  v93 = sub_2206DB260();
  v95 = v16;
  v17 = sub_2206DAC30();
  v18 = v95;
  *v95 = v17;
  v18[1] = v19;
  swift_retain();
  if (v96)
  {
    v79 = v96;
    v78 = v96;
    v20 = type metadata accessor for SettingsBinarySetting();
    v21 = v95;
    v22 = v78;
    v95[5] = v20;
    v21[2] = v22;
  }
  else
  {
    v65 = v95;
    v95[2] = 0;
    v65[3] = 0;
    v65[4] = 0;
    v65[5] = 0;
  }
  v77 = 1;
  v23 = sub_2206DAC30();
  v24 = v81;
  v25 = v77;
  v26 = v95;
  v95[6] = v23;
  v26[7] = v27;
  v76 = MEMORY[0x24BEE1328];
  v26[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v26 + 64) = v24 & v25;
  v28 = sub_2206DAC30();
  v29 = v76;
  v30 = v82;
  v31 = v77;
  v32 = v95;
  v95[12] = v28;
  v32[13] = v33;
  v32[17] = v29;
  *((_BYTE *)v32 + 112) = v30 & v31;
  v34 = sub_2206DAC30();
  v35 = v95;
  v95[18] = v34;
  v35[19] = v36;
  swift_retain();
  if (v83)
  {
    v75 = v83;
    v74 = v83;
    v37 = sub_2206DA8C4();
    v38 = v95;
    v39 = v74;
    v95[23] = v37;
    v38[20] = v39;
  }
  else
  {
    v64 = v95;
    v95[20] = 0;
    v64[21] = 0;
    v64[22] = 0;
    v64[23] = 0;
  }
  v70 = v95 + 26;
  v71 = 1;
  v40 = sub_2206DAC30();
  v41 = v95;
  v42 = v40;
  v43 = v84;
  v45 = v44;
  v46 = v88;
  v95[24] = v42;
  v41[25] = v45;
  sub_2204A395C(v43, v46);
  v72 = sub_2206DA870();
  v73 = *(_QWORD *)(v72 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v73 + 48))(v88, v71) == 1)
  {
    sub_2204A2148((uint64_t)v88);
    v63 = v95;
    v95[26] = 0;
    v63[27] = 0;
    v63[28] = 0;
    v63[29] = 0;
  }
  else
  {
    v47 = v70;
    v95[29] = v72;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v47);
    (*(void (**)(uint64_t *, char *, uint64_t))(v73 + 32))(boxed_opaque_existential_1, v88, v72);
  }
  v69 = 1;
  v49 = sub_2206DAC30();
  v50 = v85;
  v51 = v69;
  v52 = v95;
  v95[30] = v49;
  v52[31] = v53;
  v52[35] = MEMORY[0x24BEE1328];
  *((_BYTE *)v52 + 256) = v50 & v51;
  v54 = sub_2206DAC30();
  v55 = v95;
  v95[36] = v54;
  v55[37] = v56;
  swift_retain();
  if (v86)
  {
    v68 = v86;
    v67 = v86;
    v57 = sub_2206DA84C();
    v58 = v95;
    v59 = v67;
    v95[41] = v57;
    v58[38] = v59;
  }
  else
  {
    v62 = v95;
    v95[38] = 0;
    v62[39] = 0;
    v62[40] = 0;
    v62[41] = 0;
  }
  v60 = v93;
  sub_22045A844();
  v66[0] = v60;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v66[1] = sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A1FE8(uint64_t a1, int a2, int a3, uint64_t a4, const void *a5, int a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  const void *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t *v51;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t *v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  int v94;
  uint64_t v95;
  const void *v96;
  int v97;
  uint64_t v98;
  int v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  char v119;
  char v120;
  uint64_t v121;

  v110 = a1;
  v93 = a2;
  v94 = a3;
  v95 = a4;
  v96 = a5;
  v97 = a6;
  v98 = a7;
  v99 = a8;
  v101 = a9;
  v102 = a10;
  v121 = 0;
  v120 = 0;
  v119 = 0;
  v118 = 0;
  v117 = 0;
  v116 = 0;
  v115 = 0;
  v114 = 0;
  v112 = 0;
  v113 = 0;
  v111 = 0;
  v100 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v110);
  v103 = (char *)&v76 - v100;
  v121 = v11;
  v107 = 1;
  v120 = v12 & 1;
  v119 = v13 & 1;
  v118 = v14;
  v117 = v15;
  v116 = v16 & 1;
  v115 = v17;
  v114 = v18 & 1;
  v112 = a9;
  v113 = a10;
  v111 = v10;
  v104 = sub_2206DAC30();
  v105 = v19;
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v108 = sub_2206DB260();
  v109 = v20;
  v21 = sub_2206DAC30();
  v22 = v109;
  *v109 = v21;
  v22[1] = v23;
  swift_retain();
  if (v110)
  {
    v92 = v110;
    v91 = v110;
    v24 = type metadata accessor for SettingsMultiSetting();
    v25 = v109;
    v26 = v91;
    v109[5] = v24;
    v25[2] = v26;
  }
  else
  {
    v75 = v109;
    v109[2] = 0;
    v75[3] = 0;
    v75[4] = 0;
    v75[5] = 0;
  }
  v90 = 1;
  v27 = sub_2206DAC30();
  v28 = v93;
  v29 = v90;
  v30 = v109;
  v109[6] = v27;
  v30[7] = v31;
  v89 = MEMORY[0x24BEE1328];
  v30[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v30 + 64) = v28 & v29;
  v32 = sub_2206DAC30();
  v33 = v89;
  v34 = v94;
  v35 = v90;
  v36 = v109;
  v109[12] = v32;
  v36[13] = v37;
  v36[17] = v33;
  *((_BYTE *)v36 + 112) = v34 & v35;
  v38 = sub_2206DAC30();
  v39 = v109;
  v109[18] = v38;
  v39[19] = v40;
  swift_retain();
  if (v95)
  {
    v88 = v95;
    v87 = v95;
    v41 = sub_2206DA8C4();
    v42 = v109;
    v43 = v87;
    v109[23] = v41;
    v42[20] = v43;
  }
  else
  {
    v74 = v109;
    v109[20] = 0;
    v74[21] = 0;
    v74[22] = 0;
    v74[23] = 0;
  }
  v83 = v109 + 26;
  v84 = 1;
  v44 = sub_2206DAC30();
  v45 = v109;
  v46 = v44;
  v47 = v96;
  v49 = v48;
  v50 = v103;
  v109[24] = v46;
  v45[25] = v49;
  sub_2204A395C(v47, v50);
  v85 = sub_2206DA870();
  v86 = *(_QWORD *)(v85 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v86 + 48))(v103, v84) == 1)
  {
    sub_2204A2148((uint64_t)v103);
    v73 = v109;
    v109[26] = 0;
    v73[27] = 0;
    v73[28] = 0;
    v73[29] = 0;
  }
  else
  {
    v51 = v83;
    v109[29] = v85;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v51);
    (*(void (**)(uint64_t *, char *, uint64_t))(v86 + 32))(boxed_opaque_existential_1, v103, v85);
  }
  v82 = 1;
  v53 = sub_2206DAC30();
  v54 = v97;
  v55 = v82;
  v56 = v109;
  v109[30] = v53;
  v56[31] = v57;
  v56[35] = MEMORY[0x24BEE1328];
  *((_BYTE *)v56 + 256) = v54 & v55;
  v58 = sub_2206DAC30();
  v59 = v109;
  v109[36] = v58;
  v59[37] = v60;
  swift_retain();
  if (v98)
  {
    v81 = v98;
    v80 = v98;
    v61 = sub_2206DA84C();
    v62 = v109;
    v63 = v80;
    v109[41] = v61;
    v62[38] = v63;
  }
  else
  {
    v72 = v109;
    v109[38] = 0;
    v72[39] = 0;
    v72[40] = 0;
    v72[41] = 0;
  }
  v77 = 1;
  v64 = sub_2206DAC30();
  v65 = v77;
  v66 = v99;
  v67 = v109;
  v68 = v64;
  v69 = v108;
  v109[42] = v68;
  v67[43] = v70;
  v67[47] = MEMORY[0x24BEE1328];
  *((_BYTE *)v67 + 352) = v66 & v65;
  sub_22045A844();
  v78 = v69;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v79 = sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A25EC@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X3>, const void *a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>)
{
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  const void *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t *v49;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t *v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  int v92;
  uint64_t v93;
  const void *v94;
  int v95;
  uint64_t v96;
  int v97;
  unint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  char v114;
  uint64_t v115;

  v90 = a9;
  v106 = a1;
  v91 = a2;
  v92 = a3;
  v93 = a4;
  v94 = a5;
  v95 = a6;
  v96 = a7;
  v97 = a8;
  v115 = 0;
  v114 = 0;
  v113 = 0;
  v112 = 0;
  v111 = 0;
  v110 = 0;
  v109 = 0;
  v108 = 0;
  v107 = 0;
  v98 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v99 = (char *)&v74 - v98;
  v115 = MEMORY[0x24BDAC7A8](v106);
  v103 = 1;
  v114 = v10 & 1;
  v113 = v11 & 1;
  v112 = v12;
  v111 = v13;
  v110 = v14 & 1;
  v109 = v15;
  v108 = v16 & 1;
  v107 = v9;
  v100 = sub_2206DAC30();
  v101 = v17;
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v104 = sub_2206DB260();
  v105 = v18;
  v19 = sub_2206DAC30();
  v20 = v105;
  *v105 = v19;
  v20[1] = v21;
  swift_retain();
  if (v106)
  {
    v89 = v106;
    v88 = v106;
    v22 = type metadata accessor for SettingsMultiSetting();
    v23 = v105;
    v24 = v88;
    v105[5] = v22;
    v23[2] = v24;
  }
  else
  {
    v73 = v105;
    v105[2] = 0;
    v73[3] = 0;
    v73[4] = 0;
    v73[5] = 0;
  }
  v87 = 1;
  v25 = sub_2206DAC30();
  v26 = v91;
  v27 = v87;
  v28 = v105;
  v105[6] = v25;
  v28[7] = v29;
  v86 = MEMORY[0x24BEE1328];
  v28[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v28 + 64) = v26 & v27;
  v30 = sub_2206DAC30();
  v31 = v86;
  v32 = v92;
  v33 = v87;
  v34 = v105;
  v105[12] = v30;
  v34[13] = v35;
  v34[17] = v31;
  *((_BYTE *)v34 + 112) = v32 & v33;
  v36 = sub_2206DAC30();
  v37 = v105;
  v105[18] = v36;
  v37[19] = v38;
  swift_retain();
  if (v93)
  {
    v85 = v93;
    v84 = v93;
    v39 = sub_2206DA8C4();
    v40 = v105;
    v41 = v84;
    v105[23] = v39;
    v40[20] = v41;
  }
  else
  {
    v72 = v105;
    v105[20] = 0;
    v72[21] = 0;
    v72[22] = 0;
    v72[23] = 0;
  }
  v80 = v105 + 26;
  v81 = 1;
  v42 = sub_2206DAC30();
  v43 = v105;
  v44 = v42;
  v45 = v94;
  v47 = v46;
  v48 = v99;
  v105[24] = v44;
  v43[25] = v47;
  sub_2204A395C(v45, v48);
  v82 = sub_2206DA870();
  v83 = *(_QWORD *)(v82 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v83 + 48))(v99, v81) == 1)
  {
    sub_2204A2148((uint64_t)v99);
    v71 = v105;
    v105[26] = 0;
    v71[27] = 0;
    v71[28] = 0;
    v71[29] = 0;
  }
  else
  {
    v49 = v80;
    v105[29] = v82;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v49);
    (*(void (**)(uint64_t *, char *, uint64_t))(v83 + 32))(boxed_opaque_existential_1, v99, v82);
  }
  v79 = 1;
  v51 = sub_2206DAC30();
  v52 = v95;
  v53 = v79;
  v54 = v105;
  v105[30] = v51;
  v54[31] = v55;
  v54[35] = MEMORY[0x24BEE1328];
  *((_BYTE *)v54 + 256) = v52 & v53;
  v56 = sub_2206DAC30();
  v57 = v105;
  v105[36] = v56;
  v57[37] = v58;
  swift_retain();
  if (v96)
  {
    v78 = v96;
    v77 = v96;
    v59 = sub_2206DA84C();
    v60 = v105;
    v61 = v77;
    v105[41] = v59;
    v60[38] = v61;
  }
  else
  {
    v70 = v105;
    v105[38] = 0;
    v70[39] = 0;
    v70[40] = 0;
    v70[41] = 0;
  }
  HIDWORD(v74) = 1;
  v62 = sub_2206DAC30();
  v63 = BYTE4(v74);
  v64 = v97;
  v65 = v105;
  v66 = v62;
  v67 = v104;
  v105[42] = v66;
  v65[43] = v68;
  v65[47] = MEMORY[0x24BEE1328];
  *((_BYTE *)v65 + 352) = v64 & v63;
  sub_22045A844();
  v75 = v67;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v76 = sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A2BAC(uint64_t a1, int a2, int a3, uint64_t a4, const void *a5, int a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  const void *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t *v51;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t *v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  int v94;
  uint64_t v95;
  const void *v96;
  int v97;
  uint64_t v98;
  int v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  char v119;
  char v120;
  uint64_t v121;

  v110 = a1;
  v93 = a2;
  v94 = a3;
  v95 = a4;
  v96 = a5;
  v97 = a6;
  v98 = a7;
  v99 = a8;
  v101 = a9;
  v102 = a10;
  v121 = 0;
  v120 = 0;
  v119 = 0;
  v118 = 0;
  v117 = 0;
  v116 = 0;
  v115 = 0;
  v114 = 0;
  v112 = 0;
  v113 = 0;
  v111 = 0;
  v100 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v110);
  v103 = (char *)&v76 - v100;
  v121 = v11;
  v107 = 1;
  v120 = v12 & 1;
  v119 = v13 & 1;
  v118 = v14;
  v117 = v15;
  v116 = v16 & 1;
  v115 = v17;
  v114 = v18 & 1;
  v112 = a9;
  v113 = a10;
  v111 = v10;
  v104 = sub_2206DAC30();
  v105 = v19;
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v108 = sub_2206DB260();
  v109 = v20;
  v21 = sub_2206DAC30();
  v22 = v109;
  *v109 = v21;
  v22[1] = v23;
  swift_retain();
  if (v110)
  {
    v92 = v110;
    v91 = v110;
    v24 = type metadata accessor for SettingsMultiSetting();
    v25 = v109;
    v26 = v91;
    v109[5] = v24;
    v25[2] = v26;
  }
  else
  {
    v75 = v109;
    v109[2] = 0;
    v75[3] = 0;
    v75[4] = 0;
    v75[5] = 0;
  }
  v90 = 1;
  v27 = sub_2206DAC30();
  v28 = v93;
  v29 = v90;
  v30 = v109;
  v109[6] = v27;
  v30[7] = v31;
  v89 = MEMORY[0x24BEE1328];
  v30[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v30 + 64) = v28 & v29;
  v32 = sub_2206DAC30();
  v33 = v89;
  v34 = v94;
  v35 = v90;
  v36 = v109;
  v109[12] = v32;
  v36[13] = v37;
  v36[17] = v33;
  *((_BYTE *)v36 + 112) = v34 & v35;
  v38 = sub_2206DAC30();
  v39 = v109;
  v109[18] = v38;
  v39[19] = v40;
  swift_retain();
  if (v95)
  {
    v88 = v95;
    v87 = v95;
    v41 = sub_2206DA8C4();
    v42 = v109;
    v43 = v87;
    v109[23] = v41;
    v42[20] = v43;
  }
  else
  {
    v74 = v109;
    v109[20] = 0;
    v74[21] = 0;
    v74[22] = 0;
    v74[23] = 0;
  }
  v83 = v109 + 26;
  v84 = 1;
  v44 = sub_2206DAC30();
  v45 = v109;
  v46 = v44;
  v47 = v96;
  v49 = v48;
  v50 = v103;
  v109[24] = v46;
  v45[25] = v49;
  sub_2204A395C(v47, v50);
  v85 = sub_2206DA870();
  v86 = *(_QWORD *)(v85 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v86 + 48))(v103, v84) == 1)
  {
    sub_2204A2148((uint64_t)v103);
    v73 = v109;
    v109[26] = 0;
    v73[27] = 0;
    v73[28] = 0;
    v73[29] = 0;
  }
  else
  {
    v51 = v83;
    v109[29] = v85;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v51);
    (*(void (**)(uint64_t *, char *, uint64_t))(v86 + 32))(boxed_opaque_existential_1, v103, v85);
  }
  v82 = 1;
  v53 = sub_2206DAC30();
  v54 = v97;
  v55 = v82;
  v56 = v109;
  v109[30] = v53;
  v56[31] = v57;
  v56[35] = MEMORY[0x24BEE1328];
  *((_BYTE *)v56 + 256) = v54 & v55;
  v58 = sub_2206DAC30();
  v59 = v109;
  v109[36] = v58;
  v59[37] = v60;
  swift_retain();
  if (v98)
  {
    v81 = v98;
    v80 = v98;
    v61 = sub_2206DA84C();
    v62 = v109;
    v63 = v80;
    v109[41] = v61;
    v62[38] = v63;
  }
  else
  {
    v72 = v109;
    v109[38] = 0;
    v72[39] = 0;
    v72[40] = 0;
    v72[41] = 0;
  }
  v77 = 1;
  v64 = sub_2206DAC30();
  v65 = v77;
  v66 = v99;
  v67 = v109;
  v68 = v64;
  v69 = v108;
  v109[42] = v68;
  v67[43] = v70;
  v67[47] = MEMORY[0x24BEE1328];
  *((_BYTE *)v67 + 352) = v66 & v65;
  sub_22045A844();
  v78 = v69;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v79 = sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A31B0@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X3>, const void *a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>)
{
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  const void *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t *v49;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t *v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  int v92;
  uint64_t v93;
  const void *v94;
  int v95;
  uint64_t v96;
  int v97;
  unint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  char v113;
  char v114;
  uint64_t v115;

  v90 = a9;
  v106 = a1;
  v91 = a2;
  v92 = a3;
  v93 = a4;
  v94 = a5;
  v95 = a6;
  v96 = a7;
  v97 = a8;
  v115 = 0;
  v114 = 0;
  v113 = 0;
  v112 = 0;
  v111 = 0;
  v110 = 0;
  v109 = 0;
  v108 = 0;
  v107 = 0;
  v98 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v99 = (char *)&v74 - v98;
  v115 = MEMORY[0x24BDAC7A8](v106);
  v103 = 1;
  v114 = v10 & 1;
  v113 = v11 & 1;
  v112 = v12;
  v111 = v13;
  v110 = v14 & 1;
  v109 = v15;
  v108 = v16 & 1;
  v107 = v9;
  v100 = sub_2206DAC30();
  v101 = v17;
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v104 = sub_2206DB260();
  v105 = v18;
  v19 = sub_2206DAC30();
  v20 = v105;
  *v105 = v19;
  v20[1] = v21;
  swift_retain();
  if (v106)
  {
    v89 = v106;
    v88 = v106;
    v22 = type metadata accessor for SettingsMultiSetting();
    v23 = v105;
    v24 = v88;
    v105[5] = v22;
    v23[2] = v24;
  }
  else
  {
    v73 = v105;
    v105[2] = 0;
    v73[3] = 0;
    v73[4] = 0;
    v73[5] = 0;
  }
  v87 = 1;
  v25 = sub_2206DAC30();
  v26 = v91;
  v27 = v87;
  v28 = v105;
  v105[6] = v25;
  v28[7] = v29;
  v86 = MEMORY[0x24BEE1328];
  v28[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v28 + 64) = v26 & v27;
  v30 = sub_2206DAC30();
  v31 = v86;
  v32 = v92;
  v33 = v87;
  v34 = v105;
  v105[12] = v30;
  v34[13] = v35;
  v34[17] = v31;
  *((_BYTE *)v34 + 112) = v32 & v33;
  v36 = sub_2206DAC30();
  v37 = v105;
  v105[18] = v36;
  v37[19] = v38;
  swift_retain();
  if (v93)
  {
    v85 = v93;
    v84 = v93;
    v39 = sub_2206DA8C4();
    v40 = v105;
    v41 = v84;
    v105[23] = v39;
    v40[20] = v41;
  }
  else
  {
    v72 = v105;
    v105[20] = 0;
    v72[21] = 0;
    v72[22] = 0;
    v72[23] = 0;
  }
  v80 = v105 + 26;
  v81 = 1;
  v42 = sub_2206DAC30();
  v43 = v105;
  v44 = v42;
  v45 = v94;
  v47 = v46;
  v48 = v99;
  v105[24] = v44;
  v43[25] = v47;
  sub_2204A395C(v45, v48);
  v82 = sub_2206DA870();
  v83 = *(_QWORD *)(v82 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v83 + 48))(v99, v81) == 1)
  {
    sub_2204A2148((uint64_t)v99);
    v71 = v105;
    v105[26] = 0;
    v71[27] = 0;
    v71[28] = 0;
    v71[29] = 0;
  }
  else
  {
    v49 = v80;
    v105[29] = v82;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v49);
    (*(void (**)(uint64_t *, char *, uint64_t))(v83 + 32))(boxed_opaque_existential_1, v99, v82);
  }
  v79 = 1;
  v51 = sub_2206DAC30();
  v52 = v95;
  v53 = v79;
  v54 = v105;
  v105[30] = v51;
  v54[31] = v55;
  v54[35] = MEMORY[0x24BEE1328];
  *((_BYTE *)v54 + 256) = v52 & v53;
  v56 = sub_2206DAC30();
  v57 = v105;
  v105[36] = v56;
  v57[37] = v58;
  swift_retain();
  if (v96)
  {
    v78 = v96;
    v77 = v96;
    v59 = sub_2206DA84C();
    v60 = v105;
    v61 = v77;
    v105[41] = v59;
    v60[38] = v61;
  }
  else
  {
    v70 = v105;
    v105[38] = 0;
    v70[39] = 0;
    v70[40] = 0;
    v70[41] = 0;
  }
  HIDWORD(v74) = 1;
  v62 = sub_2206DAC30();
  v63 = BYTE4(v74);
  v64 = v97;
  v65 = v105;
  v66 = v62;
  v67 = v104;
  v105[42] = v66;
  v65[43] = v68;
  v65[47] = MEMORY[0x24BEE1328];
  *((_BYTE *)v65 + 352) = v64 & v63;
  sub_22045A844();
  v75 = v67;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v76 = sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A3770(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v13;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v13 = v4;
  *v4 = sub_2206DAC30();
  v13[1] = v5;
  swift_retain();
  if (a1)
  {
    v13[5] = type metadata accessor for SettingsBinarySetting();
    v13[2] = a1;
  }
  else
  {
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = 0;
    v13[5] = 0;
  }
  v13[6] = sub_2206DAC30();
  v13[7] = v6;
  v13[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v13 + 64) = a2 & 1;
  v13[12] = sub_2206DAC30();
  v13[13] = v7;
  swift_retain();
  if (a3)
  {
    v13[17] = sub_2206DA8C4();
    v13[14] = a3;
  }
  else
  {
    v13[14] = 0;
    v13[15] = 0;
    v13[16] = 0;
    v13[17] = 0;
  }
  v13[18] = sub_2206DAC30();
  v13[19] = v8;
  v13[23] = MEMORY[0x24BEE1328];
  *((_BYTE *)v13 + 160) = a4 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A3A58(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v13;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v13 = v4;
  *v4 = sub_2206DAC30();
  v13[1] = v5;
  swift_retain();
  if (a1)
  {
    v13[5] = type metadata accessor for SettingsBinarySetting();
    v13[2] = a1;
  }
  else
  {
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = 0;
    v13[5] = 0;
  }
  v13[6] = sub_2206DAC30();
  v13[7] = v6;
  v13[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v13 + 64) = a2 & 1;
  v13[12] = sub_2206DAC30();
  v13[13] = v7;
  swift_retain();
  if (a3)
  {
    v13[17] = sub_2206DA8C4();
    v13[14] = a3;
  }
  else
  {
    v13[14] = 0;
    v13[15] = 0;
    v13[16] = 0;
    v13[17] = 0;
  }
  v13[18] = sub_2206DAC30();
  v13[19] = v8;
  v13[23] = MEMORY[0x24BEE1328];
  *((_BYTE *)v13 + 160) = a4 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A3D28(uint64_t a1, int a2, uint64_t a3, const void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  char v8;
  uint64_t v9;
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  const void *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t *v40;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  _QWORD v54[3];
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  const void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;

  v80 = a1;
  v66 = a2;
  v67 = a3;
  v68 = a4;
  v69 = a5;
  v70 = a6;
  v71 = a7;
  v88 = 0;
  v87 = 0;
  v86 = 0;
  v85 = 0;
  v84 = 0;
  v82 = 0;
  v83 = 0;
  v81 = 0;
  v72 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v73 = (char *)v54 - v72;
  v88 = MEMORY[0x24BDAC7A8](v80);
  v77 = 1;
  v87 = v8 & 1;
  v86 = v9;
  v85 = v10;
  v84 = v11;
  v82 = v12;
  v83 = v13;
  v81 = v7;
  v74 = sub_2206DAC30();
  v75 = v14;
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v78 = sub_2206DB260();
  v79 = v15;
  v16 = sub_2206DAC30();
  v17 = v79;
  *v79 = v16;
  v17[1] = v18;
  swift_retain();
  if (v80)
  {
    v65 = v80;
    v64 = v80;
    v19 = type metadata accessor for SettingsBinarySetting();
    v20 = v79;
    v21 = v64;
    v79[5] = v19;
    v20[2] = v21;
  }
  else
  {
    v53 = v79;
    v79[2] = 0;
    v53[3] = 0;
    v53[4] = 0;
    v53[5] = 0;
  }
  v63 = 1;
  v22 = sub_2206DAC30();
  v23 = v66;
  v24 = v63;
  v25 = v79;
  v79[6] = v22;
  v25[7] = v26;
  v25[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v25 + 64) = v23 & v24;
  v27 = sub_2206DAC30();
  v28 = v79;
  v79[12] = v27;
  v28[13] = v29;
  swift_retain();
  if (v67)
  {
    v62 = v67;
    v61 = v67;
    v30 = sub_2206DA8C4();
    v31 = v79;
    v32 = v61;
    v79[17] = v30;
    v31[14] = v32;
  }
  else
  {
    v52 = v79;
    v79[14] = 0;
    v52[15] = 0;
    v52[16] = 0;
    v52[17] = 0;
  }
  v57 = v79 + 20;
  v58 = 1;
  v33 = sub_2206DAC30();
  v34 = v79;
  v35 = v33;
  v36 = v68;
  v38 = v37;
  v39 = v73;
  v79[18] = v35;
  v34[19] = v38;
  sub_2204A395C(v36, v39);
  v59 = sub_2206DA870();
  v60 = *(_QWORD *)(v59 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v60 + 48))(v73, v58) == 1)
  {
    sub_2204A2148((uint64_t)v73);
    v51 = v79;
    v79[20] = 0;
    v51[21] = 0;
    v51[22] = 0;
    v51[23] = 0;
  }
  else
  {
    v40 = v57;
    v79[23] = v59;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v40);
    (*(void (**)(uint64_t *, char *, uint64_t))(v60 + 32))(boxed_opaque_existential_1, v73, v59);
  }
  v42 = sub_2206DAC30();
  v43 = v79;
  v79[24] = v42;
  v43[25] = v44;
  swift_retain();
  if (v69)
  {
    v56 = v69;
    v55 = v69;
    v45 = sub_2206DA84C();
    v46 = v79;
    v47 = v55;
    v79[29] = v45;
    v46[26] = v47;
  }
  else
  {
    v50 = v79;
    v79[26] = 0;
    v50[27] = 0;
    v50[28] = 0;
    v50[29] = 0;
  }
  v48 = v78;
  sub_22045A844();
  v54[1] = v48;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v54[2] = sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A41C4@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, const void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  const void *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  _QWORD v52[2];
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  const void *v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;

  v64 = a6;
  v77 = a1;
  v65 = a2;
  v66 = a3;
  v67 = a4;
  v68 = a5;
  v83 = 0;
  v82 = 0;
  v81 = 0;
  v80 = 0;
  v79 = 0;
  v78 = 0;
  v69 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v77);
  v70 = (char *)v52 - v69;
  v83 = v7;
  v74 = 1;
  v82 = v8 & 1;
  v81 = v9;
  v80 = v10;
  v79 = v11;
  v78 = v6;
  v71 = sub_2206DAC30();
  v72 = v12;
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v75 = sub_2206DB260();
  v76 = v13;
  v14 = sub_2206DAC30();
  v15 = v76;
  *v76 = v14;
  v15[1] = v16;
  swift_retain();
  if (v77)
  {
    v63 = v77;
    v62 = v77;
    v17 = type metadata accessor for SettingsBinarySetting();
    v18 = v76;
    v19 = v62;
    v76[5] = v17;
    v18[2] = v19;
  }
  else
  {
    v51 = v76;
    v76[2] = 0;
    v51[3] = 0;
    v51[4] = 0;
    v51[5] = 0;
  }
  v61 = 1;
  v20 = sub_2206DAC30();
  v21 = v65;
  v22 = v61;
  v23 = v76;
  v76[6] = v20;
  v23[7] = v24;
  v23[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v23 + 64) = v21 & v22;
  v25 = sub_2206DAC30();
  v26 = v76;
  v76[12] = v25;
  v26[13] = v27;
  swift_retain();
  if (v66)
  {
    v60 = v66;
    v59 = v66;
    v28 = sub_2206DA8C4();
    v29 = v76;
    v30 = v59;
    v76[17] = v28;
    v29[14] = v30;
  }
  else
  {
    v50 = v76;
    v76[14] = 0;
    v50[15] = 0;
    v50[16] = 0;
    v50[17] = 0;
  }
  v55 = v76 + 20;
  v56 = 1;
  v31 = sub_2206DAC30();
  v32 = v76;
  v33 = v31;
  v34 = v67;
  v36 = v35;
  v37 = v70;
  v76[18] = v33;
  v32[19] = v36;
  sub_2204A395C(v34, v37);
  v57 = sub_2206DA870();
  v58 = *(_QWORD *)(v57 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v58 + 48))(v70, v56) == 1)
  {
    sub_2204A2148((uint64_t)v70);
    v49 = v76;
    v76[20] = 0;
    v49[21] = 0;
    v49[22] = 0;
    v49[23] = 0;
  }
  else
  {
    v38 = v55;
    v76[23] = v57;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v38);
    (*(void (**)(uint64_t *, char *, uint64_t))(v58 + 32))(boxed_opaque_existential_1, v70, v57);
  }
  v40 = sub_2206DAC30();
  v41 = v76;
  v76[24] = v40;
  v41[25] = v42;
  swift_retain();
  if (v68)
  {
    v54 = v68;
    v53 = v68;
    v43 = sub_2206DA84C();
    v44 = v76;
    v45 = v53;
    v76[29] = v43;
    v44[26] = v45;
  }
  else
  {
    v48 = v76;
    v76[26] = 0;
    v48[27] = 0;
    v48[28] = 0;
    v48[29] = 0;
  }
  v46 = v75;
  sub_22045A844();
  v52[0] = v46;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v52[1] = sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A4624(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v4;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v4 = v1;
  *v1 = sub_2206DAC30();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_2206DA8C4();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A47B4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v4;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v4 = v1;
  *v1 = sub_2206DAC30();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_2206DA8C4();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A492C(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t *v14;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v14 = v4;
  *v4 = sub_2206DAC30();
  v14[1] = v5;
  swift_bridgeObjectRetain();
  v14[5] = MEMORY[0x24BEE0D00];
  v14[2] = a1;
  v14[3] = a2;
  v14[6] = sub_2206DAC30();
  v14[7] = v6;
  v12 = MEMORY[0x24BEE1328];
  v14[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v14 + 64) = a3 & 1;
  v14[12] = sub_2206DAC30();
  v14[13] = v7;
  v14[17] = v12;
  *((_BYTE *)v14 + 112) = a4 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A4B38(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t *v14;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v14 = v4;
  *v4 = sub_2206DAC30();
  v14[1] = v5;
  swift_bridgeObjectRetain();
  v14[5] = MEMORY[0x24BEE0D00];
  v14[2] = a1;
  v14[3] = a2;
  v14[6] = sub_2206DAC30();
  v14[7] = v6;
  v12 = MEMORY[0x24BEE1328];
  v14[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v14 + 64) = a3 & 1;
  v14[12] = sub_2206DAC30();
  v14[13] = v7;
  v14[17] = v12;
  *((_BYTE *)v14 + 112) = a4 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A4D2C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = sub_2206DA8C4();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  if (a2 == 2)
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  else
  {
    v7[11] = MEMORY[0x24BEE1328];
    *((_BYTE *)v7 + 64) = a2 & 1;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A4F34(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_bridgeObjectRetain();
  v7[5] = MEMORY[0x24BEE0D00];
  v7[2] = a1;
  v7[3] = a2;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A5088(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_bridgeObjectRetain();
  v7[5] = MEMORY[0x24BEE0D00];
  v7[2] = a1;
  v7[3] = a2;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A51C4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_2206DA8C4();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A53F0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_2206DA8C4();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A5604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v10;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v10 = v3;
  *v3 = sub_2206DAC30();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsMultiSetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_2206DAC30();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = sub_2206DA8C4();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_2206DAC30();
  v10[13] = v6;
  swift_retain();
  if (a3)
  {
    v10[17] = sub_2206DA84C();
    v10[14] = a3;
  }
  else
  {
    v10[14] = 0;
    v10[15] = 0;
    v10[16] = 0;
    v10[17] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A58CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v10;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v10 = v3;
  *v3 = sub_2206DAC30();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsMultiSetting();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_2206DAC30();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = sub_2206DA8C4();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_2206DAC30();
  v10[13] = v6;
  swift_retain();
  if (a3)
  {
    v10[17] = sub_2206DA84C();
    v10[14] = a3;
  }
  else
  {
    v10[14] = 0;
    v10[15] = 0;
    v10[16] = 0;
    v10[17] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A5B7C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_2206DA8C4();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A5DA8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_2206DA8C4();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A5FBC()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A6084()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A6134()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A61FC()
{
  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A62AC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_2206DA8C4();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A64D8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsBinarySetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_2206DA8C4();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A66EC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsMultiSetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_2206DA8C4();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7C8();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206A6918(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v7;

  sub_2206DAC30();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v7 = v2;
  *v2 = sub_2206DAC30();
  v7[1] = v3;
  swift_retain();
  if (a1)
  {
    v7[5] = type metadata accessor for SettingsMultiSetting();
    v7[2] = a1;
  }
  else
  {
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = 0;
    v7[5] = 0;
  }
  v7[6] = sub_2206DAC30();
  v7[7] = v4;
  swift_retain();
  if (a2)
  {
    v7[11] = sub_2206DA8C4();
    v7[8] = a2;
  }
  else
  {
    v7[8] = 0;
    v7[9] = 0;
    v7[10] = 0;
    v7[11] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  sub_2206DB0B0();
  sub_2206DA7D4();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SetBinarySettingIntentCATs()
{
  uint64_t v1;

  v1 = qword_2555E8958;
  if (!qword_2555E8958)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_2206A6B90()
{
  uint64_t inited;

  inited = swift_initClassMetadata2();
  if (!inited)
    return 0;
  return inited;
}

uint64_t sub_2206A6C00()
{
  return type metadata accessor for SetBinarySettingIntentCATs();
}

void __swiftcall BinarySettingModel.init(settingId:graphicIcon:label:secondLabel:oldValue:updatedValue:url:directInvocationId:deviceCategoryInt:)(SiriSettingsIntents::BinarySettingModel *__return_ptr retstr, Swift::String settingId, Swift::String graphicIcon, Swift::String label, Swift::String secondLabel, Swift::Bool oldValue, Swift::Bool updatedValue, Swift::String_optional url, Swift::String_optional directInvocationId, Swift::Int deviceCategoryInt)
{
  uint64_t countAndFlagsBits;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  void *object;
  _QWORD __b[14];

  countAndFlagsBits = settingId._countAndFlagsBits;
  object = settingId._object;
  v11 = graphicIcon._countAndFlagsBits;
  v17 = graphicIcon._object;
  v12 = label._countAndFlagsBits;
  v16 = label._object;
  v13 = secondLabel._countAndFlagsBits;
  v15 = secondLabel._object;
  memset(__b, 0, sizeof(__b));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[0] = countAndFlagsBits;
  __b[1] = object;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[2] = v11;
  __b[3] = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[4] = v12;
  __b[5] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[6] = v13;
  __b[7] = v15;
  LOWORD(__b[8]) = __PAIR16__(updatedValue, oldValue) & 0x101;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(Swift::String_optional *)&__b[9] = url;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(Swift::String_optional *)&__b[11] = directInvocationId;
  __b[13] = deviceCategoryInt;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  retstr->settingId._countAndFlagsBits = countAndFlagsBits;
  retstr->settingId._object = object;
  retstr->graphicIcon._countAndFlagsBits = v11;
  retstr->graphicIcon._object = v17;
  retstr->label._countAndFlagsBits = v12;
  retstr->label._object = v16;
  retstr->secondLabel._countAndFlagsBits = v13;
  retstr->secondLabel._object = v15;
  retstr->oldValue = oldValue;
  retstr->updatedValue = updatedValue;
  retstr->url = url;
  retstr->directInvocationId = directInvocationId;
  retstr->deviceCategoryInt = deviceCategoryInt;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2206A6F78();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2206A6F78()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void __swiftcall NumericSettingModel.init(settingId:graphicIcon:leftIconName:rightIconName:label:oldValue:updatedValue:minValue:maxValue:step:url:deviceCategoryInt:)(SiriSettingsIntents::NumericSettingModel *__return_ptr retstr, Swift::String settingId, Swift::String graphicIcon, Swift::String leftIconName, Swift::String rightIconName, Swift::String label, Swift::Double oldValue, Swift::Double updatedValue, Swift::Double minValue, Swift::Double maxValue, Swift::Double step, Swift::String_optional url, Swift::Int deviceCategoryInt)
{
  uint64_t countAndFlagsBits;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  Swift::String v18;
  void *v21;
  void *v22;
  void *v23;
  void *object;
  Swift::String __b[9];
  Swift::String v26[9];

  countAndFlagsBits = settingId._countAndFlagsBits;
  object = settingId._object;
  v14 = graphicIcon._countAndFlagsBits;
  v23 = graphicIcon._object;
  v15 = leftIconName._countAndFlagsBits;
  v22 = leftIconName._object;
  v16 = rightIconName._countAndFlagsBits;
  v21 = rightIconName._object;
  *(Swift::Double *)&v17._countAndFlagsBits = oldValue;
  *(Swift::Double *)&v17._object = updatedValue;
  *(Swift::Double *)&v18._countAndFlagsBits = minValue;
  *(Swift::Double *)&v18._object = maxValue;
  memset(__b, 0, sizeof(__b));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[0]._countAndFlagsBits = countAndFlagsBits;
  __b[0]._object = object;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[1]._countAndFlagsBits = v14;
  __b[1]._object = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[2]._countAndFlagsBits = v15;
  __b[2]._object = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[3]._countAndFlagsBits = v16;
  __b[3]._object = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __b[4] = label;
  __b[5] = v17;
  __b[6] = v18;
  *(Swift::Double *)&__b[7]._countAndFlagsBits = step;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(Swift::String_optional *)&__b[7]._object = url;
  __b[8]._object = (void *)deviceCategoryInt;
  v26[0]._countAndFlagsBits = countAndFlagsBits;
  v26[0]._object = object;
  v26[1]._countAndFlagsBits = v14;
  v26[1]._object = v23;
  v26[2]._countAndFlagsBits = v15;
  v26[2]._object = v22;
  v26[3]._countAndFlagsBits = v16;
  v26[3]._object = v21;
  v26[4] = label;
  v26[5] = v17;
  v26[6] = v18;
  *(Swift::Double *)&v26[7]._countAndFlagsBits = step;
  *(Swift::String_optional *)&v26[7]._object = url;
  v26[8]._object = (void *)deviceCategoryInt;
  sub_2204AC7A0((uint64_t)v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(retstr, v26, sizeof(SiriSettingsIntents::NumericSettingModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2206A7348();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2206A7348()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_2206A73AC()
{
  uint64_t result;
  uint64_t v1;

  result = sub_2206DAC30();
  qword_2555E89A8 = result;
  qword_2555E89B0 = v1;
  return result;
}

uint64_t *sub_2206A73EC()
{
  if (qword_2555DC658 != -1)
    swift_once();
  return &qword_2555E89A8;
}

uint64_t static SnippetModels.bundleName.getter()
{
  uint64_t v1;

  v1 = *sub_2206A73EC();
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_2206A7478()
{
  char v1;

  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v1 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (v1 & 1) == 0;
}

uint64_t sub_2206A756C()
{
  sub_2206A75A0();
  return sub_2206DB080();
}

unint64_t sub_2206A75A0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E89B8;
  if (!qword_2555E89B8)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA188, &unk_24E64B658);
    atomic_store(v0, (unint64_t *)&qword_2555E89B8);
    return v0;
  }
  return v2;
}

uint64_t sub_2206A760C()
{
  return sub_2206DAC30();
}

uint64_t sub_2206A763C()
{
  char v2;
  char v3;
  char v4;

  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v3 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v2 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_2206A77D8()
{
  sub_2206A7830();
  return sub_2206DB080();
}

unint64_t sub_2206A7830()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E89C0;
  if (!qword_2555E89C0)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA148, &unk_24E64B5C8);
    atomic_store(v0, (unint64_t *)&qword_2555E89C0);
    return v0;
  }
  return v2;
}

uint64_t sub_2206A789C()
{
  return sub_2206DAC30();
}

uint64_t sub_2206A7924()
{
  sub_2206A7958();
  return sub_2206DB080();
}

unint64_t sub_2206A7958()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E89C8;
  if (!qword_2555E89C8)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA108, &unk_24E64B6E8);
    atomic_store(v0, (unint64_t *)&qword_2555E89C8);
    return v0;
  }
  return v2;
}

uint64_t sub_2206A79C4()
{
  return sub_2206A756C();
}

uint64_t sub_2206A79D8()
{
  return sub_2206A760C();
}

BOOL sub_2206A79EC@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_2206A7478();
  *a1 = result;
  return result;
}

uint64_t sub_2206A7A1C()
{
  sub_2206A7A48();
  return sub_2206DB344();
}

unint64_t sub_2206A7A48()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E89D0;
  if (!qword_2555E89D0)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA0B8, &unk_24E64B658);
    atomic_store(v0, (unint64_t *)&qword_2555E89D0);
    return v0;
  }
  return v2;
}

uint64_t sub_2206A7AB4()
{
  sub_2206A7A48();
  return sub_2206DB350();
}

uint64_t sub_2206A7AE0()
{
  return sub_2206A77D8();
}

uint64_t sub_2206A7AFC()
{
  return sub_2206A789C();
}

uint64_t sub_2206A7B18@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2206A763C();
  *a1 = result;
  return result;
}

uint64_t sub_2206A7B40()
{
  sub_2206A7B6C();
  return sub_2206DB344();
}

unint64_t sub_2206A7B6C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E89D8;
  if (!qword_2555E89D8)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA068, &unk_24E64B5C8);
    atomic_store(v0, (unint64_t *)&qword_2555E89D8);
    return v0;
  }
  return v2;
}

uint64_t sub_2206A7BD8()
{
  sub_2206A7B6C();
  return sub_2206DB350();
}

uint64_t sub_2206A7C04()
{
  return sub_2206A7924();
}

uint64_t sub_2206A7C18()
{
  sub_2206A7C44();
  return sub_2206DB344();
}

unint64_t sub_2206A7C44()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E89E0;
  if (!qword_2555E89E0)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA018, &unk_24E64B6E8);
    atomic_store(v0, (unint64_t *)&qword_2555E89E0);
    return v0;
  }
  return v2;
}

uint64_t sub_2206A7CB0()
{
  sub_2206A7C44();
  return sub_2206DB350();
}

uint64_t SnippetModels.encode(to:)(_QWORD *a1)
{
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  const void *v11;
  _BYTE *v12;
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
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  _BYTE *v53;
  _QWORD v54[8];
  char v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  _BYTE v63[151];
  char v64;
  const void *v65;
  uint64_t v66;
  _BYTE v67[152];
  _BYTE __dst[152];

  v48 = a1;
  v66 = 0;
  v65 = 0;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E89E8);
  v38 = *(_QWORD *)(v37 - 8);
  v39 = (*(_QWORD *)(v38 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v37);
  v40 = (char *)&v6 - v39;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E89F0);
  v42 = *(_QWORD *)(v41 - 8);
  v43 = (*(_QWORD *)(v42 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v41);
  v44 = (char *)&v6 - v43;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E89F8);
  v46 = *(_QWORD *)(v45 - 8);
  v47 = (*(_QWORD *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v48);
  v49 = (char *)&v6 - v47;
  v66 = v2;
  v52 = v67;
  sub_2204ACA20(v1, v67);
  v65 = v1;
  v50 = v48[3];
  v51 = v48[4];
  __swift_project_boxed_opaque_existential_1(v48, v50);
  sub_2206A7B6C();
  sub_2206DB338();
  v53 = __dst;
  sub_2204ACA20(v52, __dst);
  if (sub_2206A824C((uint64_t)v53) == 1)
  {
    v11 = (const void *)nullsub_1(__dst);
    sub_2204AC7A0((uint64_t)v11);
    v10 = &v64;
    v64 = 1;
    sub_2206A7C44();
    sub_2206DB1D0();
    v12 = v63;
    memcpy(v63, v11, 0x90uLL);
    sub_2206A8258();
    v4 = v36;
    sub_2206DB224();
    v13 = v4;
    v14 = v4;
    if (!v4)
    {
      (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v37);
      sub_2204ACA58((uint64_t)v11);
      v15 = v13;
      goto LABEL_6;
    }
    v6 = v14;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v37);
    sub_2204ACA58((uint64_t)v11);
    return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v49, v45);
  }
  else
  {
    v16 = nullsub_1(__dst);
    v18 = *(_QWORD *)v16;
    v19 = *(_QWORD *)(v16 + 8);
    v20 = *(_QWORD *)(v16 + 16);
    v21 = *(_QWORD *)(v16 + 24);
    v22 = *(_QWORD *)(v16 + 32);
    v23 = *(_QWORD *)(v16 + 40);
    v24 = *(_QWORD *)(v16 + 48);
    v25 = *(_QWORD *)(v16 + 56);
    v26 = *(unsigned __int8 *)(v16 + 64);
    v27 = *(unsigned __int8 *)(v16 + 65);
    v28 = *(_QWORD *)(v16 + 72);
    v29 = *(_QWORD *)(v16 + 80);
    v30 = *(_QWORD *)(v16 + 88);
    v31 = *(_QWORD *)(v16 + 96);
    v32 = *(_QWORD *)(v16 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17 = &v62;
    v62 = 0;
    sub_2206A7A48();
    sub_2206DB1D0();
    v33 = v54;
    v54[0] = v18;
    v54[1] = v19;
    v54[2] = v20;
    v54[3] = v21;
    v54[4] = v22;
    v54[5] = v23;
    v54[6] = v24;
    v54[7] = v25;
    v55 = v26 & 1;
    v56 = v27 & 1;
    v57 = v28;
    v58 = v29;
    v59 = v30;
    v60 = v31;
    v61 = v32;
    sub_2206A82C4();
    v3 = v36;
    sub_2206DB224();
    v34 = v3;
    v35 = v3;
    if (!v3)
    {
      (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v41);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v15 = v34;
LABEL_6:
      v9 = v15;
      return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v49, v45);
    }
    v7 = v35;
    (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v41);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v49, v45);
    v8 = v7;
  }
  return result;
}

uint64_t sub_2206A824C(uint64_t a1)
{
  return *(_BYTE *)(a1 + 144) & 1;
}

unint64_t sub_2206A8258()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8A00;
  if (!qword_2555E8A00)
  {
    v0 = MEMORY[0x2207E69C0](&protocol conformance descriptor for NumericSettingModel, &type metadata for NumericSettingModel);
    atomic_store(v0, (unint64_t *)&qword_2555E8A00);
    return v0;
  }
  return v2;
}

unint64_t sub_2206A82C4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8A08;
  if (!qword_2555E8A08)
  {
    v0 = MEMORY[0x2207E69C0](&protocol conformance descriptor for BinarySettingModel, &type metadata for BinarySettingModel);
    atomic_store(v0, (unint64_t *)&qword_2555E8A08);
    return v0;
  }
  return v2;
}

uint64_t SnippetModels.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  unint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[8];
  char v79;
  char v80;
  uint64_t v81;
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
  uint64_t v92;
  uint64_t v93;
  char v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  _BYTE v102[144];
  _BYTE v103[152];
  _BYTE v104[144];
  char v105;
  _QWORD v106[4];
  unsigned __int8 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  uint64_t __dst[19];

  v59 = a2;
  v68 = a1;
  v113 = 0;
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8A10);
  v61 = *(_QWORD *)(v60 - 8);
  v62 = (*(_QWORD *)(v61 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v60);
  v63 = (char *)v15 - v62;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8A18);
  v65 = *(_QWORD *)(v64 - 8);
  v66 = (*(_QWORD *)(v65 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v64);
  v67 = (char *)v15 - v66;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8A20);
  v70 = *(_QWORD *)(v69 - 8);
  v71 = (*(_QWORD *)(v70 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v68);
  v72 = (char *)v15 - v71;
  v113 = v2;
  v74 = v2[3];
  v75 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v74);
  sub_2206A7B6C();
  v3 = v73;
  sub_2206DB32C();
  v76 = v3;
  v77 = v3;
  if (v3)
  {
    v28 = v77;
  }
  else
  {
    v4 = sub_2206DB1C4();
    v55 = &v108;
    v108 = v4;
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8A28);
    sub_2206A8AE4();
    v109 = sub_2206DAFFC();
    v110 = v5;
    v111 = v6;
    v112 = v7;
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8A38);
    v57 = sub_2206A8B54();
    sub_2206DAE88();
    v58 = v107;
    if (v107 == 2)
      goto LABEL_14;
    v53 = v58;
    v46 = v58;
    v51 = v109;
    v47 = v110;
    v48 = v111;
    v49 = v112;
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v50 = v106;
    v106[0] = v51;
    v106[1] = v47;
    v106[2] = v48;
    v106[3] = v49;
    v52 = sub_2206DAEA0();
    sub_2206A8BC4();
    swift_unknownObjectRelease();
    if ((v52 & 1) == 0)
    {
LABEL_14:
      v22 = 0;
      v26 = sub_2206DB0A4();
      v20 = 1;
      v27 = swift_allocError();
      v25 = v13;
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8A48);
      v21 = (char *)v25 + *(int *)(v14 + 48);
      *v25 = &type metadata for SnippetModels;
      v23 = sub_2206DB164();
      v24 = sub_2206DAC30();
      sub_2206DB098();
      (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v26 - 8) + 104))(v25, *MEMORY[0x24BEE26D0]);
      swift_willThrow();
      sub_2206A8BC4();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v69);
      v28 = v27;
    }
    else if ((v46 & 1) != 0)
    {
      v36 = &v105;
      v105 = v46 & 1;
      sub_2206A7C44();
      v10 = v76;
      sub_2206DB158();
      v37 = v10;
      v38 = v10;
      if (v10)
      {
        v17 = v38;
        sub_2206A8BC4();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v69);
        v28 = v17;
      }
      else
      {
        sub_2206A8BEC();
        v11 = v37;
        sub_2206DB1B8();
        v34 = v11;
        v35 = v11;
        if (!v11)
        {
          v31 = v102;
          v32 = 144;
          memcpy(v102, v104, sizeof(v102));
          v33 = v103;
          memcpy(v103, v102, 0x90uLL);
          sub_2204AC81C((uint64_t)v103);
          sub_2204ACA20(v33, __dst);
          (*(void (**)(char *, uint64_t))(v61 + 8))(v63, v60);
          v40 = v34;
          goto LABEL_13;
        }
        v16 = v35;
        (*(void (**)(char *, uint64_t))(v61 + 8))(v63, v60);
        sub_2206A8BC4();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v69);
        v28 = v16;
      }
    }
    else
    {
      v43 = &v101;
      v101 = v46 & 1;
      sub_2206A7A48();
      v8 = v76;
      sub_2206DB158();
      v44 = v8;
      v45 = v8;
      if (v8)
      {
        v19 = v45;
        sub_2206A8BC4();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v69);
        v28 = v19;
      }
      else
      {
        sub_2206A8F6C();
        v9 = v44;
        sub_2206DB1B8();
        v41 = v9;
        v42 = v9;
        if (!v9)
        {
          v39 = v78;
          v78[0] = v86;
          v78[1] = v87;
          v78[2] = v88;
          v78[3] = v89;
          v78[4] = v90;
          v78[5] = v91;
          v78[6] = v92;
          v78[7] = v93;
          v79 = v94 & 1;
          v80 = v95 & 1;
          v81 = v96;
          v82 = v97;
          v83 = v98;
          v84 = v99;
          v85 = v100;
          sub_2204ACAD4((uint64_t)v78);
          sub_2204ACA20(v39, __dst);
          (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v64);
          v40 = v41;
LABEL_13:
          v30 = v40;
          sub_2206A8BC4();
          (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v69);
          v29 = __dst;
          sub_2206A8C58(__dst, v59);
          __swift_destroy_boxed_opaque_existential_0(v68);
          result = (uint64_t)v29;
          sub_2206A8EBC();
          return result;
        }
        v18 = v42;
        (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v64);
        sub_2206A8BC4();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v69);
        v28 = v18;
      }
    }
  }
  v15[1] = v28;
  return __swift_destroy_boxed_opaque_existential_0(v68);
}

unint64_t sub_2206A8AE4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2555E8A30;
  if (!qword_2555E8A30)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555E8A28);
    v1 = MEMORY[0x2207E69C0](MEMORY[0x24BEE12C8], v0);
    atomic_store(v1, (unint64_t *)&qword_2555E8A30);
    return v1;
  }
  return v3;
}

unint64_t sub_2206A8B54()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2555E8A40;
  if (!qword_2555E8A40)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2555E8A38);
    v1 = MEMORY[0x2207E69C0](MEMORY[0x24BEE2190], v0);
    atomic_store(v1, (unint64_t *)&qword_2555E8A40);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2206A8BC4()
{
  swift_unknownObjectRelease();
}

unint64_t sub_2206A8BEC()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8A50;
  if (!qword_2555E8A50)
  {
    v0 = MEMORY[0x2207E69C0](&protocol conformance descriptor for NumericSettingModel, &type metadata for NumericSettingModel);
    atomic_store(v0, (unint64_t *)&qword_2555E8A50);
    return v0;
  }
  return v2;
}

uint64_t sub_2206A8C58(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  char v5;
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

  v2 = *a1;
  v3 = a1[1];
  v6 = a1[2];
  v7 = a1[3];
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v11 = a1[7];
  v12 = a1[8];
  v13 = a1[9];
  v14 = a1[10];
  v15 = a1[11];
  v16 = a1[12];
  v17 = a1[13];
  v18 = a1[14];
  v19 = a1[15];
  v20 = a1[16];
  v21 = a1[17];
  v5 = a1[18] & 1;
  sub_2206A8DF8();
  result = a2;
  *(_QWORD *)a2 = v2;
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v7;
  *(_QWORD *)(a2 + 32) = v8;
  *(_QWORD *)(a2 + 40) = v9;
  *(_QWORD *)(a2 + 48) = v10;
  *(_QWORD *)(a2 + 56) = v11;
  *(_QWORD *)(a2 + 64) = v12;
  *(_QWORD *)(a2 + 72) = v13;
  *(_QWORD *)(a2 + 80) = v14;
  *(_QWORD *)(a2 + 88) = v15;
  *(_QWORD *)(a2 + 96) = v16;
  *(_QWORD *)(a2 + 104) = v17;
  *(_QWORD *)(a2 + 112) = v18;
  *(_QWORD *)(a2 + 120) = v19;
  *(_QWORD *)(a2 + 128) = v20;
  *(_QWORD *)(a2 + 136) = v21;
  *(_BYTE *)(a2 + 144) = v5;
  return result;
}

uint64_t sub_2206A8DF8()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2206A8EBC()
{
  sub_2204AC95C();
}

unint64_t sub_2206A8F6C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8A58;
  if (!qword_2555E8A58)
  {
    v0 = MEMORY[0x2207E69C0](&protocol conformance descriptor for BinarySettingModel, &type metadata for BinarySettingModel);
    atomic_store(v0, (unint64_t *)&qword_2555E8A58);
    return v0;
  }
  return v2;
}

uint64_t sub_2206A8FD8()
{
  return static SnippetModels.bundleName.getter();
}

uint64_t sub_2206A8FEC()
{
  return sub_2206D9808() & 1;
}

uint64_t sub_2206A9004@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return SnippetModels.init(from:)(a1, a2);
}

uint64_t sub_2206A9058(_QWORD *a1)
{
  return SnippetModels.encode(to:)(a1);
}

uint64_t BinarySettingModel.settingId.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.graphicIcon.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.label.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.secondLabel.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.oldValue.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 64) & 1;
}

uint64_t BinarySettingModel.updatedValue.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 65) & 1;
}

uint64_t BinarySettingModel.url.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.directInvocationId.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BinarySettingModel.deviceCategoryInt.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 104);
}

void sub_2206A9258(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_2206A929C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_2206A9324
                                                                                       + dword_2206A93DC[a12]))(a1, a2, a3, a4, a5, a6);
}

BOOL sub_2206A9334()
{
  uint64_t v1;

  return v1 == 0;
}

void sub_2206A9400(uint64_t a1, char a2)
{
  __asm { BR              X8 }
}

uint64_t sub_2206A9450()
{
  return sub_2206DB314();
}

uint64_t sub_2206A9510()
{
  char v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  unsigned __int8 v11;

  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v10 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = 0;
LABEL_20:
    swift_bridgeObjectRelease();
    return v11;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v9 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = 1;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v8 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = 2;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v7 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = 3;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v6 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = 4;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v5 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = 5;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v4 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = 6;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v3 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = 7;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v2 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v11 = 8;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 9;
}

uint64_t sub_2206A9AD8()
{
  return 9;
}

uint64_t sub_2206A9AF0()
{
  sub_2206A9B38();
  return sub_2206DB080();
}

unint64_t sub_2206A9B38()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8A60;
  if (!qword_2555E8A60)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9FD8, &unk_24E64B818);
    atomic_store(v0, (unint64_t *)&qword_2555E8A60);
    return v0;
  }
  return v2;
}

void sub_2206A9BA4(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_2206A9BE4()
{
  return sub_2206DAC30();
}

uint64_t sub_2206A9D84(char *a1)
{
  char v1;

  sub_2206A9258(*a1);
  return v1 & 1;
}

uint64_t sub_2206A9DA4()
{
  return sub_2206A9AF0();
}

void sub_2206A9DBC(uint64_t a1)
{
  char *v1;

  sub_2206A9400(a1, *v1);
}

void sub_2206A9DD4()
{
  char *v0;

  sub_2206A9BA4(*v0);
}

uint64_t sub_2206A9DEC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2206A9510();
  *a1 = result;
  return result;
}

uint64_t sub_2206A9E14@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2206A9AD8();
  *a1 = result;
  return result;
}

uint64_t sub_2206A9E3C()
{
  sub_2206A9E68();
  return sub_2206DB344();
}

unint64_t sub_2206A9E68()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8A68;
  if (!qword_2555E8A68)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9F88, &unk_24E64B818);
    atomic_store(v0, (unint64_t *)&qword_2555E8A68);
    return v0;
  }
  return v2;
}

uint64_t sub_2206A9ED4()
{
  sub_2206A9E68();
  return sub_2206DB350();
}

uint64_t BinarySettingModel.encode(to:)(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[5];
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
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
  uint64_t *v68;
  _QWORD *v69;

  v34 = a1;
  v69 = 0;
  v68 = 0;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8A70);
  v35 = *(_QWORD *)(v56 - 8);
  v36 = (*(_QWORD *)(v35 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v34);
  v52 = (char *)v11 - v36;
  v69 = v2;
  v54 = *v1;
  v55 = v1[1];
  v37 = v1[2];
  v38 = v1[3];
  v39 = v1[4];
  v40 = v1[5];
  v41 = v1[6];
  v42 = v1[7];
  v43 = *((unsigned __int8 *)v1 + 64);
  v44 = *((unsigned __int8 *)v1 + 65);
  v45 = v1[9];
  v46 = v1[10];
  v47 = v1[11];
  v48 = v1[12];
  v49 = v1[13];
  v68 = v1;
  v50 = v2[3];
  v51 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v50);
  sub_2206A9E68();
  sub_2206DB338();
  v3 = v53;
  swift_bridgeObjectRetain();
  v67 = 0;
  sub_2206DB1F4();
  v57 = v3;
  v58 = v3;
  if (v3)
  {
    v16 = v58;
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v52, v56);
    v17 = v16;
  }
  else
  {
    swift_bridgeObjectRelease();
    v4 = v57;
    swift_bridgeObjectRetain();
    v66 = 1;
    sub_2206DB1F4();
    v32 = v4;
    v33 = v4;
    if (v4)
    {
      v15 = v33;
      swift_bridgeObjectRelease();
      result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v52, v56);
      v17 = v15;
    }
    else
    {
      swift_bridgeObjectRelease();
      v5 = v32;
      swift_bridgeObjectRetain();
      v65 = 2;
      sub_2206DB1F4();
      v30 = v5;
      v31 = v5;
      if (v5)
      {
        v14 = v31;
        swift_bridgeObjectRelease();
        result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v52, v56);
        v17 = v14;
      }
      else
      {
        swift_bridgeObjectRelease();
        v6 = v30;
        swift_bridgeObjectRetain();
        v64 = 3;
        sub_2206DB1F4();
        v28 = v6;
        v29 = v6;
        if (v6)
        {
          v13 = v29;
          swift_bridgeObjectRelease();
          result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v52, v56);
          v17 = v13;
        }
        else
        {
          swift_bridgeObjectRelease();
          v7 = v28;
          v63 = 4;
          sub_2206DB200();
          v26 = v7;
          v27 = v7;
          if (v7)
          {
            v12 = v27;
            result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v52, v56);
            v17 = v12;
          }
          else
          {
            v62 = 5;
            sub_2206DB200();
            v24 = 0;
            v25 = 0;
            swift_bridgeObjectRetain();
            v61 = 6;
            sub_2206DB1DC();
            v22 = 0;
            v23 = 0;
            swift_bridgeObjectRelease();
            v8 = v22;
            swift_bridgeObjectRetain();
            v60 = 7;
            sub_2206DB1DC();
            v20 = v8;
            v21 = v8;
            if (v8)
            {
              v11[2] = v21;
              swift_bridgeObjectRelease();
              return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v52, v56);
            }
            else
            {
              swift_bridgeObjectRelease();
              v9 = v20;
              v59 = 8;
              sub_2206DB218();
              v18 = v9;
              v19 = v9;
              if (v9)
                v11[1] = v19;
              return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v52, v56);
            }
          }
        }
      }
    }
  }
  return result;
}

_QWORD *BinarySettingModel.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  _WORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
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
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *result;
  _QWORD v37[11];
  uint64_t v38;
  _QWORD *v39;
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
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
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
  uint64_t v78;
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
  uint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  char v106;
  char v107;
  _QWORD *v108;
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  char v113;
  char v114;
  _QWORD v115[2];
  _QWORD v116[3];
  char v117;

  v88 = &v117;
  v87 = a2;
  v89 = a1;
  v108 = 0;
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8A78);
  v91 = *(_QWORD *)(v90 - 8);
  v92 = (*(_QWORD *)(v91 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v89);
  v93 = (char *)v37 - v92;
  *v2 = 0;
  v108 = v3;
  v95 = v3[3];
  v96 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v95);
  sub_2206A9E68();
  v4 = v94;
  sub_2206DB32C();
  v97 = v4;
  v98 = v4;
  if (v4)
  {
    v37[10] = v98;
    v37[0] = v98;
    result = (_QWORD *)__swift_destroy_boxed_opaque_existential_0(v89);
    if ((*(_WORD *)v88 & 1) != 0)
    {
      result = v109;
      sub_220461C68();
    }
    if ((*(_WORD *)v88 & 2) != 0)
    {
      result = v110;
      sub_220461C68();
    }
    if ((*(_WORD *)v88 & 4) != 0)
    {
      result = v111;
      sub_220461C68();
    }
    if ((*(_WORD *)v88 & 8) != 0)
    {
      result = v112;
      sub_220461C68();
    }
    if ((*(_WORD *)v88 & 0x40) != 0)
    {
      result = v115;
      sub_220461C68();
    }
    if ((*(_WORD *)v88 & 0x80) != 0)
    {
      result = v116;
      sub_220461C68();
    }
  }
  else
  {
    v107 = 0;
    v5 = sub_2206DB188();
    v83 = 0;
    v84 = v5;
    v85 = v6;
    v86 = 0;
    v78 = v6;
    v77 = v5;
    *(_WORD *)v88 = 1;
    swift_bridgeObjectRetain();
    v109[0] = v77;
    v109[1] = v78;
    v106 = 1;
    v7 = sub_2206DB188();
    v79 = 0;
    v80 = v7;
    v81 = v8;
    v82 = 0;
    v72 = v8;
    v71 = v7;
    *(_WORD *)v88 = 3;
    swift_bridgeObjectRetain();
    v110[0] = v71;
    v110[1] = v72;
    v105 = 2;
    v9 = sub_2206DB188();
    v73 = 0;
    v74 = v9;
    v75 = v10;
    v76 = 0;
    v66 = v10;
    v65 = v9;
    *(_WORD *)v88 = 7;
    swift_bridgeObjectRetain();
    v111[0] = v65;
    v111[1] = v66;
    v104 = 3;
    v11 = sub_2206DB188();
    v67 = 0;
    v68 = v11;
    v69 = v12;
    v70 = 0;
    v61 = v12;
    v60 = v11;
    *(_WORD *)v88 = 15;
    swift_bridgeObjectRetain();
    v112[0] = v60;
    v112[1] = v61;
    v103 = 4;
    v13 = sub_2206DB194();
    v62 = 0;
    v63 = v13;
    v64 = 0;
    v56 = v13;
    v113 = v13 & 1;
    v102 = 5;
    v14 = sub_2206DB194();
    v57 = 0;
    v58 = v14;
    v59 = 0;
    v51 = v14;
    v114 = v14 & 1;
    v101 = 6;
    v15 = sub_2206DB170();
    v52 = 0;
    v53 = v15;
    v54 = v16;
    v55 = 0;
    v46 = v16;
    v45 = v15;
    *(_WORD *)v88 = 79;
    swift_bridgeObjectRetain();
    v115[0] = v45;
    v115[1] = v46;
    v100 = 7;
    v17 = sub_2206DB170();
    v47 = 0;
    v48 = v17;
    v49 = v18;
    v50 = 0;
    v41 = v18;
    v40 = v17;
    *(_WORD *)v88 = 207;
    swift_bridgeObjectRetain();
    v116[0] = v40;
    v116[1] = v41;
    v99 = 8;
    v19 = sub_2206DB1AC();
    v42 = 0;
    v43 = v19;
    v44 = 0;
    v38 = v19;
    v39 = v109;
    v116[2] = v19;
    (*(void (**)(char *, uint64_t))(v91 + 8))(v93, v90);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v20 = v78;
    v21 = v71;
    v22 = v72;
    v23 = v65;
    v24 = v66;
    v25 = v60;
    v26 = v61;
    v27 = v56;
    v28 = v51;
    v29 = v45;
    v30 = v46;
    v31 = v40;
    v32 = v41;
    v33 = v87;
    v34 = v38;
    v35 = v89;
    *v87 = v77;
    v33[1] = v20;
    v33[2] = v21;
    v33[3] = v22;
    v33[4] = v23;
    v33[5] = v24;
    v33[6] = v25;
    v33[7] = v26;
    *((_BYTE *)v33 + 64) = v27 & 1;
    *((_BYTE *)v33 + 65) = v28 & 1;
    v33[9] = v29;
    v33[10] = v30;
    v33[11] = v31;
    v33[12] = v32;
    v33[13] = v34;
    __swift_destroy_boxed_opaque_existential_0(v35);
    result = v39;
    sub_2206A6F78();
  }
  return result;
}

uint64_t sub_2206AB138()
{
  return BinarySettingModel.settingId.getter();
}

uint64_t sub_2206AB14C()
{
  return BinarySettingModel.graphicIcon.getter();
}

uint64_t sub_2206AB160()
{
  return BinarySettingModel.label.getter();
}

uint64_t sub_2206AB174()
{
  return BinarySettingModel.url.getter();
}

_QWORD *sub_2206AB188@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return BinarySettingModel.init(from:)(a1, a2);
}

uint64_t sub_2206AB1DC(uint64_t a1)
{
  return BinarySettingModel.encode(to:)(a1);
}

uint64_t NumericSettingModel.settingId.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t NumericSettingModel.graphicIcon.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t NumericSettingModel.leftIconName.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t NumericSettingModel.rightIconName.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t NumericSettingModel.label.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v2;
}

double NumericSettingModel.oldValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 80);
}

double NumericSettingModel.updatedValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 88);
}

double NumericSettingModel.minValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 96);
}

double NumericSettingModel.maxValue.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 104);
}

double NumericSettingModel.step.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 112);
}

uint64_t NumericSettingModel.url.getter()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t NumericSettingModel.deviceCategoryInt.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 136);
}

void sub_2206AB41C(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_2206AB460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned __int8 a12)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_2206AB50C
                                                                                       + dword_2206AB5F4[a12]))(a1, a2, a3, a4, a5, a6);
}

BOOL sub_2206AB51C()
{
  uint64_t v1;

  return v1 == 0;
}

void sub_2206AB624(uint64_t a1, char a2)
{
  __asm { BR              X8 }
}

uint64_t sub_2206AB674()
{
  return sub_2206DB314();
}

uint64_t sub_2206AB764()
{
  char v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  unsigned __int8 v14;

  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v13 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v13 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 0;
LABEL_26:
    swift_bridgeObjectRelease();
    return v14;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v12 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 1;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v11 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 2;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v10 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 3;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v9 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 4;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v8 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 5;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v7 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 6;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v6 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 7;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v5 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 8;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v4 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 9;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v3 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 10;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v2 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v14 = 11;
    goto LABEL_26;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 12;
}

uint64_t sub_2206ABEF4()
{
  return 12;
}

uint64_t sub_2206ABF0C()
{
  sub_2206ABF54();
  return sub_2206DB080();
}

unint64_t sub_2206ABF54()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8A80;
  if (!qword_2555E8A80)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9F48, &unk_24E64B950);
    atomic_store(v0, (unint64_t *)&qword_2555E8A80);
    return v0;
  }
  return v2;
}

void sub_2206ABFC0(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_2206AC000()
{
  return sub_2206DAC30();
}

uint64_t sub_2206AC224(char *a1)
{
  char v1;

  sub_2206AB41C(*a1);
  return v1 & 1;
}

uint64_t sub_2206AC244()
{
  return sub_2206ABF0C();
}

void sub_2206AC25C(uint64_t a1)
{
  char *v1;

  sub_2206AB624(a1, *v1);
}

void sub_2206AC274()
{
  char *v0;

  sub_2206ABFC0(*v0);
}

uint64_t sub_2206AC28C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2206AB764();
  *a1 = result;
  return result;
}

uint64_t sub_2206AC2B4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2206ABEF4();
  *a1 = result;
  return result;
}

uint64_t sub_2206AC2DC()
{
  sub_2206AC308();
  return sub_2206DB344();
}

unint64_t sub_2206AC308()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8A88;
  if (!qword_2555E8A88)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9EF8, &unk_24E64B950);
    atomic_store(v0, (unint64_t *)&qword_2555E8A88);
    return v0;
  }
  return v2;
}

uint64_t sub_2206AC374()
{
  sub_2206AC308();
  return sub_2206DB350();
}

uint64_t NumericSettingModel.encode(to:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
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
  unint64_t v42;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;
  char v75;
  char v76;
  char v77;
  char v78;
  char v79;
  _QWORD *v80;
  _QWORD *v81;

  v40 = a1;
  v81 = 0;
  v80 = 0;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8A90);
  v41 = *(_QWORD *)(v65 - 8);
  v42 = (*(_QWORD *)(v41 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v40);
  v61 = (char *)v11 - v42;
  v81 = v2;
  v63 = *v1;
  v64 = v1[1];
  v43 = v1[2];
  v44 = v1[3];
  v45 = v1[4];
  v46 = v1[5];
  v47 = v1[6];
  v48 = v1[7];
  v49 = v1[8];
  v50 = v1[9];
  v51 = v1[10];
  v52 = v1[11];
  v53 = v1[12];
  v54 = v1[13];
  v55 = v1[14];
  v56 = v1[15];
  v57 = v1[16];
  v58 = v1[17];
  v80 = v1;
  v59 = v2[3];
  v60 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v59);
  sub_2206AC308();
  sub_2206DB338();
  v3 = v62;
  swift_bridgeObjectRetain();
  v79 = 0;
  sub_2206DB1F4();
  v66 = v3;
  v67 = v3;
  if (v3)
  {
    v16 = v67;
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v61, v65);
    v17 = v16;
  }
  else
  {
    swift_bridgeObjectRelease();
    v4 = v66;
    swift_bridgeObjectRetain();
    v78 = 1;
    sub_2206DB1F4();
    v38 = v4;
    v39 = v4;
    if (v4)
    {
      v15 = v39;
      swift_bridgeObjectRelease();
      result = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v61, v65);
      v17 = v15;
    }
    else
    {
      swift_bridgeObjectRelease();
      v5 = v38;
      swift_bridgeObjectRetain();
      v77 = 2;
      sub_2206DB1F4();
      v36 = v5;
      v37 = v5;
      if (v5)
      {
        v14 = v37;
        swift_bridgeObjectRelease();
        result = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v61, v65);
        v17 = v14;
      }
      else
      {
        swift_bridgeObjectRelease();
        v6 = v36;
        swift_bridgeObjectRetain();
        v76 = 3;
        sub_2206DB1F4();
        v34 = v6;
        v35 = v6;
        if (v6)
        {
          v13 = v35;
          swift_bridgeObjectRelease();
          result = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v61, v65);
          v17 = v13;
        }
        else
        {
          swift_bridgeObjectRelease();
          v7 = v34;
          swift_bridgeObjectRetain();
          v75 = 4;
          sub_2206DB1F4();
          v32 = v7;
          v33 = v7;
          if (v7)
          {
            v12 = v33;
            swift_bridgeObjectRelease();
            result = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v61, v65);
            v17 = v12;
          }
          else
          {
            swift_bridgeObjectRelease();
            v8 = v32;
            v74 = 5;
            sub_2206DB20C();
            v30 = v8;
            v31 = v8;
            if (v8)
            {
              v11[6] = v31;
              return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v61, v65);
            }
            else
            {
              v73 = 6;
              sub_2206DB20C();
              v28 = 0;
              v29 = 0;
              v72 = 7;
              sub_2206DB20C();
              v26 = 0;
              v27 = 0;
              v71 = 8;
              sub_2206DB20C();
              v24 = 0;
              v25 = 0;
              v70 = 9;
              sub_2206DB20C();
              v22 = 0;
              v23 = 0;
              swift_bridgeObjectRetain();
              v69 = 10;
              sub_2206DB1DC();
              v20 = 0;
              v21 = 0;
              swift_bridgeObjectRelease();
              v9 = v20;
              v68 = 11;
              sub_2206DB218();
              v18 = v9;
              v19 = v9;
              if (v9)
                v11[0] = v19;
              return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v61, v65);
            }
          }
        }
      }
    }
  }
  return result;
}

_QWORD *NumericSettingModel.init(from:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  _QWORD *v2;
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
  _QWORD *result;
  _QWORD v23[15];
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
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
  uint64_t v61;
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
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[18];
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  char v106;
  char v107;
  char v108;
  char v109;
  _QWORD *v110;
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[7];
  _QWORD v116[3];
  __int16 v117;

  v86 = a2;
  v87 = a1;
  v110 = 0;
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E8A98);
  v89 = *(_QWORD *)(v88 - 8);
  v90 = (*(_QWORD *)(v89 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v87);
  v91 = (char *)v23 - v90;
  v117 = 0;
  v110 = v2;
  v93 = v2[3];
  v94 = v2[4];
  __swift_project_boxed_opaque_existential_1(v2, v93);
  sub_2206AC308();
  v3 = v92;
  sub_2206DB32C();
  v95 = v3;
  v96 = v3;
  if (v3)
  {
    v23[14] = v96;
    v23[1] = v96;
    result = (_QWORD *)__swift_destroy_boxed_opaque_existential_0(v87);
    if ((v117 & 1) != 0)
    {
      result = v111;
      sub_220461C68();
    }
    if ((v117 & 2) != 0)
    {
      result = v112;
      sub_220461C68();
    }
    if ((v117 & 4) != 0)
    {
      result = v113;
      sub_220461C68();
    }
    if ((v117 & 8) != 0)
    {
      result = v114;
      sub_220461C68();
    }
    if ((v117 & 0x10) != 0)
    {
      result = v115;
      sub_220461C68();
    }
    if ((v117 & 0x400) != 0)
    {
      result = v116;
      sub_220461C68();
    }
  }
  else
  {
    v109 = 0;
    v4 = sub_2206DB188();
    v82 = 0;
    v83 = v4;
    v84 = v5;
    v85 = 0;
    v77 = v5;
    v76 = v4;
    v117 = 1;
    swift_bridgeObjectRetain();
    v111[0] = v76;
    v111[1] = v77;
    v108 = 1;
    v6 = sub_2206DB188();
    v78 = 0;
    v79 = v6;
    v80 = v7;
    v81 = 0;
    v71 = v7;
    v70 = v6;
    v117 = 3;
    swift_bridgeObjectRetain();
    v112[0] = v70;
    v112[1] = v71;
    v107 = 2;
    v8 = sub_2206DB188();
    v72 = 0;
    v73 = v8;
    v74 = v9;
    v75 = 0;
    v65 = v9;
    v64 = v8;
    v117 = 7;
    swift_bridgeObjectRetain();
    v113[0] = v64;
    v113[1] = v65;
    v106 = 3;
    v10 = sub_2206DB188();
    v66 = 0;
    v67 = v10;
    v68 = v11;
    v69 = 0;
    v59 = v11;
    v58 = v10;
    v117 = 15;
    swift_bridgeObjectRetain();
    v114[0] = v58;
    v114[1] = v59;
    v105 = 4;
    v12 = sub_2206DB188();
    v60 = 0;
    v61 = v12;
    v62 = v13;
    v63 = 0;
    v54 = v13;
    v53 = v12;
    v117 = 31;
    swift_bridgeObjectRetain();
    v115[0] = v53;
    v115[1] = v54;
    v104 = 5;
    sub_2206DB1A0();
    v55 = 0;
    v56 = v14;
    v57 = 0;
    v49 = v14;
    v115[2] = v14;
    v103 = 6;
    sub_2206DB1A0();
    v50 = 0;
    v51 = v15;
    v52 = 0;
    v45 = v15;
    v115[3] = v15;
    v102 = 7;
    sub_2206DB1A0();
    v46 = 0;
    v47 = v16;
    v48 = 0;
    v41 = v16;
    v115[4] = v16;
    v101 = 8;
    sub_2206DB1A0();
    v42 = 0;
    v43 = v17;
    v44 = 0;
    v37 = v17;
    v115[5] = v17;
    v100 = 9;
    sub_2206DB1A0();
    v38 = 0;
    v39 = v18;
    v40 = 0;
    v32 = v18;
    v115[6] = v18;
    v99 = 10;
    v19 = sub_2206DB170();
    v33 = 0;
    v34 = v19;
    v35 = v20;
    v36 = 0;
    v28 = v20;
    v27 = v19;
    v117 = 1055;
    swift_bridgeObjectRetain();
    v116[0] = v27;
    v116[1] = v28;
    v98 = 11;
    v21 = sub_2206DB1AC();
    v29 = 0;
    v30 = v21;
    v31 = 0;
    v24 = v21;
    v26 = v111;
    v116[2] = v21;
    (*(void (**)(char *, uint64_t))(v89 + 8))(v91, v88);
    v25 = v97;
    v97[0] = v76;
    v97[1] = v77;
    v97[2] = v70;
    v97[3] = v71;
    v97[4] = v64;
    v97[5] = v65;
    v97[6] = v58;
    v97[7] = v59;
    v97[8] = v53;
    v97[9] = v54;
    v97[10] = v49;
    v97[11] = v45;
    v97[12] = v41;
    v97[13] = v37;
    v97[14] = v32;
    v97[15] = v27;
    v97[16] = v28;
    v97[17] = v24;
    sub_2204AC7A0((uint64_t)v97);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memcpy(v86, v25, 0x90uLL);
    __swift_destroy_boxed_opaque_existential_0(v87);
    result = v26;
    sub_2206A7348();
  }
  return result;
}

uint64_t sub_2206AD68C()
{
  return NumericSettingModel.settingId.getter();
}

uint64_t sub_2206AD6A0()
{
  return NumericSettingModel.graphicIcon.getter();
}

uint64_t sub_2206AD6B4()
{
  return NumericSettingModel.label.getter();
}

uint64_t sub_2206AD6C8()
{
  return NumericSettingModel.url.getter();
}

unint64_t sub_2206AD6DC()
{
  return sub_2206AD6F0();
}

unint64_t sub_2206AD6F0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AA0;
  if (!qword_2555E8AA0)
  {
    v0 = MEMORY[0x2207E69C0](&protocol conformance descriptor for SnippetModels, &type metadata for SnippetModels);
    atomic_store(v0, (unint64_t *)&qword_2555E8AA0);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AD75C()
{
  return sub_2206AD770();
}

unint64_t sub_2206AD770()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AA8;
  if (!qword_2555E8AA8)
  {
    v0 = MEMORY[0x2207E69C0](&protocol conformance descriptor for SnippetModels, &type metadata for SnippetModels);
    atomic_store(v0, (unint64_t *)&qword_2555E8AA8);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AD7DC(uint64_t a1)
{
  unint64_t result;

  result = sub_2206AD804();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2206AD804()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AB0;
  if (!qword_2555E8AB0)
  {
    v0 = MEMORY[0x2207E69C0](&protocol conformance descriptor for BinarySettingModel, &type metadata for BinarySettingModel);
    atomic_store(v0, (unint64_t *)&qword_2555E8AB0);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AD870()
{
  return sub_2206A8F6C();
}

unint64_t sub_2206AD884()
{
  return sub_2206A82C4();
}

unint64_t sub_2206AD898(uint64_t a1)
{
  unint64_t result;

  result = sub_2206AD8C0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2206AD8C0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AB8;
  if (!qword_2555E8AB8)
  {
    v0 = MEMORY[0x2207E69C0](&protocol conformance descriptor for NumericSettingModel, &type metadata for NumericSettingModel);
    atomic_store(v0, (unint64_t *)&qword_2555E8AB8);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AD92C()
{
  return sub_2206A8BEC();
}

unint64_t sub_2206AD940()
{
  return sub_2206A8258();
}

_QWORD *sub_2206AD954@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return NumericSettingModel.init(from:)(a1, a2);
}

uint64_t sub_2206AD9A8(uint64_t a1)
{
  return NumericSettingModel.encode(to:)(a1);
}

uint64_t destroy for SnippetModels()
{
  return sub_2204AC95C();
}

uint64_t initializeWithCopy for SnippetModels(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  char v5;
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

  v2 = *a2;
  v3 = a2[1];
  v6 = a2[2];
  v7 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  v10 = a2[6];
  v11 = a2[7];
  v12 = a2[8];
  v13 = a2[9];
  v14 = a2[10];
  v15 = a2[11];
  v16 = a2[12];
  v17 = a2[13];
  v18 = a2[14];
  v19 = a2[15];
  v20 = a2[16];
  v21 = a2[17];
  v5 = a2[18] & 1;
  sub_2206A8DF8();
  result = a1;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = v17;
  *(_QWORD *)(a1 + 112) = v18;
  *(_QWORD *)(a1 + 120) = v19;
  *(_QWORD *)(a1 + 128) = v20;
  *(_QWORD *)(a1 + 136) = v21;
  *(_BYTE *)(a1 + 144) = v5;
  return result;
}

uint64_t assignWithCopy for SnippetModels(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
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

  v11 = *a2;
  v13 = a2[1];
  v14 = a2[2];
  v15 = a2[3];
  v16 = a2[4];
  v17 = a2[5];
  v18 = a2[6];
  v19 = a2[7];
  v20 = a2[8];
  v21 = a2[9];
  v2 = a2[10];
  v12 = a2[11];
  v3 = a2[12];
  v4 = a2[13];
  v5 = a2[14];
  v6 = a2[15];
  v7 = a2[16];
  v8 = a2[17];
  v9 = *((_BYTE *)a2 + 144);
  sub_2206A8DF8();
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + 8) = v13;
  *(_QWORD *)(a1 + 16) = v14;
  *(_QWORD *)(a1 + 24) = v15;
  *(_QWORD *)(a1 + 32) = v16;
  *(_QWORD *)(a1 + 40) = v17;
  *(_QWORD *)(a1 + 48) = v18;
  *(_QWORD *)(a1 + 56) = v19;
  *(_QWORD *)(a1 + 64) = v20;
  *(_QWORD *)(a1 + 72) = v21;
  *(_QWORD *)(a1 + 80) = v2;
  *(_QWORD *)(a1 + 88) = v12;
  *(_QWORD *)(a1 + 96) = v3;
  *(_QWORD *)(a1 + 104) = v4;
  *(_QWORD *)(a1 + 112) = v5;
  *(_QWORD *)(a1 + 120) = v6;
  *(_QWORD *)(a1 + 128) = v7;
  *(_QWORD *)(a1 + 136) = v8;
  *(_BYTE *)(a1 + 144) = v9 & 1;
  sub_2204AC95C();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy145_8(void *a1, const void *a2)
{
  memcpy(a1, a2, 0x91uLL);
}

uint64_t assignWithTake for SnippetModels(uint64_t a1, uint64_t a2)
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
  char v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v13 = *(_QWORD *)(a2 + 8);
  v14 = *(_QWORD *)(a2 + 16);
  v15 = *(_QWORD *)(a2 + 24);
  v16 = *(_QWORD *)(a2 + 32);
  v17 = *(_QWORD *)(a2 + 40);
  v18 = *(_QWORD *)(a2 + 48);
  v19 = *(_QWORD *)(a2 + 56);
  v20 = *(_QWORD *)(a2 + 64);
  v2 = *(_QWORD *)(a2 + 72);
  v3 = *(_QWORD *)(a2 + 80);
  v4 = *(_QWORD *)(a2 + 88);
  v5 = *(_QWORD *)(a2 + 96);
  v6 = *(_QWORD *)(a2 + 104);
  v7 = *(_QWORD *)(a2 + 112);
  v8 = *(_QWORD *)(a2 + 120);
  v9 = *(_QWORD *)(a2 + 128);
  v10 = *(_QWORD *)(a2 + 136);
  v11 = *(_BYTE *)(a2 + 144);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v13;
  *(_QWORD *)(a1 + 16) = v14;
  *(_QWORD *)(a1 + 24) = v15;
  *(_QWORD *)(a1 + 32) = v16;
  *(_QWORD *)(a1 + 40) = v17;
  *(_QWORD *)(a1 + 48) = v18;
  *(_QWORD *)(a1 + 56) = v19;
  *(_QWORD *)(a1 + 64) = v20;
  *(_QWORD *)(a1 + 72) = v2;
  *(_QWORD *)(a1 + 80) = v3;
  *(_QWORD *)(a1 + 88) = v4;
  *(_QWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 104) = v6;
  *(_QWORD *)(a1 + 112) = v7;
  *(_QWORD *)(a1 + 120) = v8;
  *(_QWORD *)(a1 + 128) = v9;
  *(_QWORD *)(a1 + 136) = v10;
  *(_BYTE *)(a1 + 144) = v11 & 1;
  sub_2204AC95C();
  return a1;
}

uint64_t getEnumTagSinglePayload for SnippetModels(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  int v4;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 145))
    {
      v4 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v2 = *(unsigned __int8 *)(a1 + 144) ^ 0xFF;
      if (v2 >= 0xFE)
        v2 = -1;
      v4 = v2;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SnippetModels(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BYTE *v3;

  v3 = (_BYTE *)(result + 145);
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_QWORD *)(result + 112) = 0;
    *(_QWORD *)(result + 104) = 0;
    *(_QWORD *)(result + 96) = 0;
    *(_QWORD *)(result + 88) = 0;
    *(_QWORD *)(result + 80) = 0;
    *(_QWORD *)(result + 72) = 0;
    *(_QWORD *)(result + 64) = 0;
    *(_QWORD *)(result + 56) = 0;
    *(_QWORD *)(result + 48) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 136) = 0;
    *(_QWORD *)(result + 128) = 0;
    *(_BYTE *)(result + 144) = 0;
    if (a3 >= 0xFF)
      *v3 = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *v3 = 0;
    if (a2)
      *(_BYTE *)(result + 144) = -(char)a2;
  }
  return result;
}

uint64_t sub_2206AE398(uint64_t result, char a2)
{
  *(_BYTE *)(result + 144) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SnippetModels()
{
  return &type metadata for SnippetModels;
}

void *type metadata accessor for SnippetModels.CodingKeys()
{
  return &unk_24E64B5C8;
}

void *type metadata accessor for SnippetModels.BinarySettingCodingKeys()
{
  return &unk_24E64B658;
}

void *type metadata accessor for SnippetModels.NumericSettingCodingKeys()
{
  return &unk_24E64B6E8;
}

uint64_t sub_2206AE3F8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t destroy for BinarySettingModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BinarySettingModel(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v7 = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 80) = v7;
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v9 = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  result = a1;
  *(_QWORD *)(a1 + 96) = v9;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  return result;
}

uint64_t assignWithCopy for BinarySettingModel(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64) & 1;
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65) & 1;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v7 = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v8 = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  result = a1;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy112_8(void *a1, const void *a2)
{
  memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for BinarySettingModel(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64) & 1;
  *(_BYTE *)(a1 + 65) = *(_BYTE *)(a2 + 65) & 1;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  result = a1;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  return result;
}

uint64_t getEnumTagSinglePayload for BinarySettingModel(uint64_t a1, int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 112))
    {
      v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (!HIDWORD(*(_QWORD *)(a1 + 8)))
        v3 = *(_QWORD *)(a1 + 8);
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BinarySettingModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(_QWORD *)result = a2 + 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
    *(_QWORD *)(result + 40) = 0;
    *(_QWORD *)(result + 48) = 0;
    *(_QWORD *)(result + 56) = 0;
    *(_QWORD *)(result + 64) = 0;
    *(_QWORD *)(result + 72) = 0;
    *(_QWORD *)(result + 80) = 0;
    *(_QWORD *)(result + 88) = 0;
    *(_QWORD *)(result + 96) = 0;
    *(_QWORD *)(result + 104) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 112) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3)
        *(_BYTE *)(result + 112) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)(result + 8) = a2 - 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for BinarySettingModel()
{
  return &type metadata for BinarySettingModel;
}

void *type metadata accessor for BinarySettingModel.CodingKeys()
{
  return &unk_24E64B818;
}

uint64_t destroy for NumericSettingModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for NumericSettingModel(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  *a1 = *a2;
  v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  a1[2] = a2[2];
  v4 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v4;
  a1[4] = a2[4];
  v5 = a2[5];
  swift_bridgeObjectRetain();
  a1[5] = v5;
  a1[6] = a2[6];
  v6 = a2[7];
  swift_bridgeObjectRetain();
  a1[7] = v6;
  a1[8] = a2[8];
  v7 = a2[9];
  swift_bridgeObjectRetain();
  a1[9] = v7;
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  v9 = a2[16];
  swift_bridgeObjectRetain();
  result = a1;
  a1[16] = v9;
  a1[17] = a2[17];
  return result;
}

_QWORD *assignWithCopy for NumericSettingModel(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v3 = a2[1];
  swift_bridgeObjectRetain();
  a1[1] = v3;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v4 = a2[3];
  swift_bridgeObjectRetain();
  a1[3] = v4;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  v5 = a2[5];
  swift_bridgeObjectRetain();
  a1[5] = v5;
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  v6 = a2[7];
  swift_bridgeObjectRetain();
  a1[7] = v6;
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  v7 = a2[9];
  swift_bridgeObjectRetain();
  a1[9] = v7;
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  v8 = a2[16];
  swift_bridgeObjectRetain();
  a1[16] = v8;
  swift_bridgeObjectRelease();
  result = a1;
  a1[17] = a2[17];
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy144_8(void *a1, const void *a2)
{
  memcpy(a1, a2, 0x90uLL);
}

_QWORD *assignWithTake for NumericSettingModel(_QWORD *a1, _QWORD *a2)
{
  _QWORD *result;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  a1[15] = a2[15];
  a1[16] = a2[16];
  swift_bridgeObjectRelease();
  result = a1;
  a1[17] = a2[17];
  return result;
}

uint64_t getEnumTagSinglePayload for NumericSettingModel(uint64_t a1, int a2)
{
  int v3;
  int v4;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 144))
    {
      v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v3 = -1;
      if (!HIDWORD(*(_QWORD *)(a1 + 8)))
        v3 = *(_QWORD *)(a1 + 8);
      v4 = v3;
    }
  }
  else
  {
    v4 = -1;
  }
  return (v4 + 1);
}

_QWORD *storeEnumTagSinglePayload for NumericSettingModel(_QWORD *result, int a2, int a3)
{
  _BYTE *v3;

  v3 = result + 18;
  if (a2 < 0)
  {
    result[15] = 0;
    result[14] = 0;
    result[13] = 0;
    result[12] = 0;
    result[11] = 0;
    result[10] = 0;
    result[9] = 0;
    result[8] = 0;
    result[7] = 0;
    result[6] = 0;
    result[5] = 0;
    result[4] = 0;
    result[3] = 0;
    result[2] = 0;
    result[1] = 0;
    *result = a2 + 0x80000000;
    result[17] = 0;
    result[16] = 0;
    if (a3 < 0)
      *v3 = 1;
  }
  else
  {
    if (a3 < 0)
      *v3 = 0;
    if (a2)
      result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for NumericSettingModel()
{
  return &type metadata for NumericSettingModel;
}

void *type metadata accessor for NumericSettingModel.CodingKeys()
{
  return &unk_24E64B950;
}

unint64_t sub_2206AF2F4()
{
  return sub_2206AF308();
}

unint64_t sub_2206AF308()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AC0;
  if (!qword_2555E8AC0)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9CA0, &unk_24E64B950);
    atomic_store(v0, (unint64_t *)&qword_2555E8AC0);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF374()
{
  return sub_2206AF388();
}

unint64_t sub_2206AF388()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AC8;
  if (!qword_2555E8AC8)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9CC8, &unk_24E64B950);
    atomic_store(v0, (unint64_t *)&qword_2555E8AC8);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF3F4()
{
  return sub_2206AF408();
}

unint64_t sub_2206AF408()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AD0;
  if (!qword_2555E8AD0)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9CF0, &unk_24E64B950);
    atomic_store(v0, (unint64_t *)&qword_2555E8AD0);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF474()
{
  return sub_2206AF488();
}

unint64_t sub_2206AF488()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AD8;
  if (!qword_2555E8AD8)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9D18, &unk_24E64B818);
    atomic_store(v0, (unint64_t *)&qword_2555E8AD8);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF4F4()
{
  return sub_2206AF508();
}

unint64_t sub_2206AF508()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AE0;
  if (!qword_2555E8AE0)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9D40, &unk_24E64B818);
    atomic_store(v0, (unint64_t *)&qword_2555E8AE0);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF574()
{
  return sub_2206AF588();
}

unint64_t sub_2206AF588()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AE8;
  if (!qword_2555E8AE8)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9D68, &unk_24E64B818);
    atomic_store(v0, (unint64_t *)&qword_2555E8AE8);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF5F4()
{
  return sub_2206AF608();
}

unint64_t sub_2206AF608()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AF0;
  if (!qword_2555E8AF0)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9D90, &unk_24E64B6E8);
    atomic_store(v0, (unint64_t *)&qword_2555E8AF0);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF674()
{
  return sub_2206AF688();
}

unint64_t sub_2206AF688()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8AF8;
  if (!qword_2555E8AF8)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9DB8, &unk_24E64B6E8);
    atomic_store(v0, (unint64_t *)&qword_2555E8AF8);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF6F4()
{
  return sub_2206AF708();
}

unint64_t sub_2206AF708()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8B00;
  if (!qword_2555E8B00)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9E80, &unk_24E64B5C8);
    atomic_store(v0, (unint64_t *)&qword_2555E8B00);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF774()
{
  return sub_2206AF788();
}

unint64_t sub_2206AF788()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8B08;
  if (!qword_2555E8B08)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9EA8, &unk_24E64B5C8);
    atomic_store(v0, (unint64_t *)&qword_2555E8B08);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF7F4()
{
  return sub_2206AF808();
}

unint64_t sub_2206AF808()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8B10;
  if (!qword_2555E8B10)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9E08, &unk_24E64B658);
    atomic_store(v0, (unint64_t *)&qword_2555E8B10);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF874()
{
  return sub_2206AF888();
}

unint64_t sub_2206AF888()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8B18;
  if (!qword_2555E8B18)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9E30, &unk_24E64B658);
    atomic_store(v0, (unint64_t *)&qword_2555E8B18);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF8F4()
{
  return sub_2206AF908();
}

unint64_t sub_2206AF908()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8B20;
  if (!qword_2555E8B20)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9DE0, &unk_24E64B6E8);
    atomic_store(v0, (unint64_t *)&qword_2555E8B20);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF974()
{
  return sub_2206AF988();
}

unint64_t sub_2206AF988()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8B28;
  if (!qword_2555E8B28)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9ED0, &unk_24E64B5C8);
    atomic_store(v0, (unint64_t *)&qword_2555E8B28);
    return v0;
  }
  return v2;
}

unint64_t sub_2206AF9F4()
{
  return sub_2206AFA08();
}

unint64_t sub_2206AFA08()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E8B30;
  if (!qword_2555E8B30)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206E9E58, &unk_24E64B658);
    atomic_store(v0, (unint64_t *)&qword_2555E8B30);
    return v0;
  }
  return v2;
}

uint64_t *sub_2206AFA74()
{
  if (qword_2555DC660 != -1)
    swift_once();
  return &qword_2555FE3D0;
}

uint64_t sub_2206AFAC8()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for GetBatteryHandler();
  v0 = sub_220464198();
  result = sub_2206AFB2C(v0, 1, 2);
  qword_2555FE3D0 = result;
  return result;
}

uint64_t type metadata accessor for GetBatteryHandler()
{
  return objc_opt_self();
}

uint64_t sub_2206AFB2C(uint64_t a1, char a2, char a3)
{
  swift_allocObject();
  return sub_2206AFB88(a1, a2 & 1, a3);
}

uint64_t sub_2206AFB88(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  uint64_t v8;

  swift_retain();
  *(_QWORD *)(v3 + 16) = a1;
  *(_BYTE *)(v3 + 24) = a2 & 1;
  *(_BYTE *)(v3 + 25) = a3;
  swift_release();
  return v8;
}

void sub_2206AFC18(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  uint64_t *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[6];
  _DWORD v56[4];
  uint64_t v57;
  id v58;
  id v59;
  int v60;
  uint64_t v61;
  id v62;
  id v63;
  int v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  uint32_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  os_log_t v88;
  int v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  int v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint8_t *v106;
  uint64_t v107;
  uint64_t v108;
  _BYTE **v109;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t *v115;
  unint64_t v116;
  uint32_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD *v127;
  uint64_t v128;
  os_log_t v129;
  int v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  int v134;
  id v135;
  _DWORD *v136;
  id v137;
  int v138;
  id v139;
  uint64_t v140;
  id v141;
  int v142;
  int v143;
  uint64_t v144;
  id v145;
  id v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  id v153;
  id v154;
  uint64_t v155;
  int v156;
  id v157;
  id v158;
  id v159;
  id v160;
  void (*v161)(void);
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  const char *v165;
  const char *v166;
  const char *v167;
  uint64_t v168;
  unint64_t v169;
  _QWORD *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  int v177;
  uint64_t v178;
  id v179;
  id v180;
  id v181;
  id v182;
  uint64_t (*v183)(uint64_t, uint64_t, uint64_t);
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  _BYTE *v187;
  uint64_t (*v188)(uint64_t, uint64_t, uint64_t);
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  _BYTE *v192[2];
  uint32_t v193;
  id v194;
  uint64_t v195;
  uint32_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  id v200;
  _QWORD v201[5];

  v180 = a1;
  v161 = a2;
  v162 = a3;
  v176 = "GetBatteryHandler handling intent %@";
  v164 = "Missing device category.";
  v165 = "Attempting to read battery from a HomePod. Returning.";
  v166 = "Missing target device deviceCategory";
  v167 = "Missing setting metadata";
  v201[1] = 0;
  v200 = 0;
  v199 = 0;
  v194 = 0;
  v168 = 0;
  v182 = 0;
  v201[4] = a1;
  v201[2] = a2;
  v201[3] = a3;
  v177 = sub_2206DAED0();
  v179 = (id)*sub_22053C880();
  v3 = v179;
  v174 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  v175 = sub_2206DB260();
  v173 = v4;
  v5 = v180;
  v170 = v201;
  v201[0] = v180;
  v169 = sub_2204A7234();
  sub_2204CC8D8();
  v171 = sub_2206DABDC();
  v172 = v6;
  v173[3] = MEMORY[0x24BEE0D00];
  v7 = sub_220464CA0();
  v8 = v171;
  v9 = v172;
  v10 = v173;
  v11 = v7;
  v12 = v175;
  v173[4] = v11;
  *v10 = v8;
  v10[1] = v9;
  sub_22045A844();
  v178 = v12;
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v181 = objc_msgSend(v180, sel_settingMetadata);
  if (v181)
  {
    v160 = v181;
    v158 = v181;
    v200 = v181;
    v159 = objc_msgSend(v181, sel_targetDevice);
    if (v159)
    {
      v157 = v159;
      v153 = v159;
      v154 = objc_msgSend(v159, sel_deviceCategory);

      v155 = (uint64_t)v154;
      v156 = 0;
    }
    else
    {
      v155 = 0;
      v156 = 1;
    }
    v152 = v155;
    if ((v156 & 1) != 0)
    {
      v60 = sub_2206DAEDC();
      v62 = (id)*sub_22053C880();
      v53 = v62;
      v61 = sub_2206DB260();
      sub_2206DAA14();
      swift_bridgeObjectRelease();

      swift_retain();
      sub_220464B68();
      v63 = sub_22045CFB4(6, 0);
      v161();

      swift_release();
    }
    else
    {
      v151 = v152;
      v147 = v152;
      v199 = v152;
      v150 = &v198;
      v198 = v152;
      v148 = &v197;
      v197 = 6;
      v149 = type metadata accessor for INDeviceCategory();
      sub_220460B48();
      if ((sub_2206DB284() & 1) != 0)
      {
        v143 = sub_2206DAEDC();
        v145 = (id)*sub_22053C880();
        v13 = v145;
        v144 = sub_2206DB260();
        sub_2206DAA14();
        swift_bridgeObjectRelease();

        swift_retain();
        sub_220464B68();
        v146 = sub_22045CFB4(6, 0);
        v161();

        swift_release();
      }
      else
      {
        v140 = *(_QWORD *)(v163 + 16);
        swift_retain();
        v141 = sub_2204BCBA4(v147, 0);
        v142 = v14;
        swift_release();
        if ((v142 & 1) != 0)
        {
          v130 = sub_2206DAEDC();
          v129 = (os_log_t)*sub_22053C880();
          v26 = v129;
          v27 = v158;
          v120 = 7;
          v121 = swift_allocObject();
          *(_QWORD *)(v121 + 16) = v158;
          v115 = &v195;
          v195 = 12;
          v113 = sub_22045DF24();
          v114 = sub_22045DF8C();
          v116 = sub_22045DFF4();
          sub_2206DACA8();
          v117 = v196;
          v118 = 17;
          v123 = swift_allocObject();
          *(_BYTE *)(v123 + 16) = 32;
          v124 = swift_allocObject();
          *(_BYTE *)(v124 + 16) = 8;
          v119 = 32;
          v28 = swift_allocObject();
          v29 = v121;
          v122 = v28;
          *(_QWORD *)(v28 + 16) = sub_2206B1338;
          *(_QWORD *)(v28 + 24) = v29;
          v30 = swift_allocObject();
          v31 = v122;
          v126 = v30;
          *(_QWORD *)(v30 + 16) = sub_22045F1E8;
          *(_QWORD *)(v30 + 24) = v31;
          v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DC7F0);
          v125 = sub_2206DB260();
          v127 = v32;
          swift_retain();
          v33 = v123;
          v34 = v127;
          *v127 = sub_22045F17C;
          v34[1] = v33;
          swift_retain();
          v35 = v124;
          v36 = v127;
          v127[2] = sub_22045F17C;
          v36[3] = v35;
          swift_retain();
          v37 = v126;
          v38 = v127;
          v127[4] = sub_22045F230;
          v38[5] = v37;
          sub_22045A844();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v129, (os_log_type_t)v130))
          {
            v106 = (uint8_t *)sub_2206DAFA8();
            v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DC830);
            v107 = sub_22045E05C(0);
            v108 = sub_22045E05C(1);
            v109 = &v187;
            v187 = v106;
            v110 = &v186;
            v186 = v107;
            v111 = &v185;
            v185 = v108;
            sub_22045E0B4(2, &v187);
            sub_22045E0B4(1, &v187);
            v183 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
            v184 = v123;
            sub_22045E0C8(&v183, (uint64_t)&v187, (uint64_t)&v186, (uint64_t)&v185);
            v112 = v168;
            if (v168)
            {
              __break(1u);
            }
            else
            {
              v183 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
              v184 = v124;
              sub_22045E0C8(&v183, (uint64_t)&v187, (uint64_t)&v186, (uint64_t)&v185);
              v103 = 0;
              v183 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F230;
              v184 = v126;
              sub_22045E0C8(&v183, (uint64_t)&v187, (uint64_t)&v186, (uint64_t)&v185);
              v102 = 0;
              _os_log_impl(&dword_220456000, v129, (os_log_type_t)v130, "Unable to determine the device's battery level from setting metadata%s", v106, v117);
              sub_22045E10C(v107);
              sub_22045E10C(v108);
              sub_2206DAF90();
              swift_release();
              swift_release();
              swift_release();
              v104 = 0;
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
            v104 = v168;
          }
          v100 = v104;

          v101 = objc_msgSend(v180, sel_settingMetadata);
          if (v101
            && (v99 = v101,
                v97 = v101,
                v98 = objc_msgSend(v101, sel_targetDevice),
                v101,
                v98))
          {
            v96 = v98;
            v92 = v98;
            v93 = objc_msgSend(v98, sel_deviceCategory);

            v94 = v93;
            v95 = 0;
          }
          else
          {
            v94 = 0;
            v95 = 1;
          }
          v91 = v94;
          if ((v95 & 1) != 0)
          {
            v64 = sub_2206DAEDC();
            v66 = (id)*sub_22053C880();
            v52 = v66;
            v65 = sub_2206DB260();
            sub_2206DAA14();
            swift_bridgeObjectRelease();

            swift_retain();
            sub_220464B68();
            v67 = sub_22045CFB4(6, 0);
            v161();

            swift_release();
          }
          else
          {
            v90 = v91;
            v76 = v91;
            v194 = v91;
            v89 = sub_2206DAEDC();
            v88 = (os_log_t)*sub_22053C880();
            v39 = v88;
            v80 = 7;
            v81 = swift_allocObject();
            *(_QWORD *)(v81 + 16) = v91;
            v192[1] = (_BYTE *)12;
            sub_2206DACA8();
            v77 = v193;
            v78 = 17;
            v83 = swift_allocObject();
            *(_BYTE *)(v83 + 16) = 32;
            v84 = swift_allocObject();
            *(_BYTE *)(v84 + 16) = 8;
            v79 = 32;
            v40 = swift_allocObject();
            v41 = v81;
            v82 = v40;
            *(_QWORD *)(v40 + 16) = sub_2206B16B8;
            *(_QWORD *)(v40 + 24) = v41;
            v42 = swift_allocObject();
            v43 = v82;
            v86 = v42;
            *(_QWORD *)(v42 + 16) = sub_22045F1E8;
            *(_QWORD *)(v42 + 24) = v43;
            v85 = sub_2206DB260();
            v87 = v44;
            swift_retain();
            v45 = v83;
            v46 = v87;
            *v87 = sub_22045F17C;
            v46[1] = v45;
            swift_retain();
            v47 = v84;
            v48 = v87;
            v87[2] = sub_22045F17C;
            v48[3] = v47;
            swift_retain();
            v49 = v86;
            v50 = v87;
            v87[4] = sub_22045F230;
            v50[5] = v49;
            sub_22045A844();
            swift_bridgeObjectRelease();
            if (os_log_type_enabled(v88, (os_log_type_t)v89))
            {
              v72 = (uint8_t *)sub_2206DAFA8();
              v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DC830);
              v73 = sub_22045E05C(0);
              v74 = sub_22045E05C(1);
              v192[0] = v72;
              v191 = v73;
              v190 = v74;
              sub_22045E0B4(2, v192);
              sub_22045E0B4(1, v192);
              v188 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
              v189 = v83;
              sub_22045E0C8(&v188, (uint64_t)v192, (uint64_t)&v191, (uint64_t)&v190);
              v75 = v100;
              if (v100)
              {
                __break(1u);
              }
              else
              {
                v188 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
                v189 = v84;
                sub_22045E0C8(&v188, (uint64_t)v192, (uint64_t)&v191, (uint64_t)&v190);
                v70 = 0;
                v188 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F230;
                v189 = v86;
                sub_22045E0C8(&v188, (uint64_t)v192, (uint64_t)&v191, (uint64_t)&v190);
                _os_log_impl(&dword_220456000, v88, (os_log_type_t)v89, "Can not find connected device category%s", v72, v77);
                sub_22045E10C(v73);
                sub_22045E10C(v74);
                sub_2206DAF90();
                swift_release();
                swift_release();
                swift_release();
              }
            }
            else
            {
              swift_release();
              swift_release();
              swift_release();
            }

            swift_retain();
            sub_2205F5A2C(9);
            v68 = v51;
            v69 = sub_2205AF264();
            swift_bridgeObjectRelease();
            ((void (*)(id))v161)(v69);

            swift_release();
          }
        }
        else
        {
          v139 = v141;
          v15 = v168;
          v16 = v131;
          v137 = v141;
          v182 = v141;
          v17 = sub_220533CA8();
          v132 = *v17;
          v133 = v17[1];
          v134 = *((unsigned __int8 *)v17 + 16);
          v135 = (id)*sub_22053C880();
          v18 = v135;
          v138 = *(unsigned __int8 *)(v163 + 24);
          v19 = v180;
          swift_retain();
          v136 = v56;
          MEMORY[0x24BDAC7A8](v132);
          v55[2] = v20;
          v55[3] = v137;
          v55[4] = v161;
          v55[5] = v21;
          sub_220531F08(v22, v23, v24, v25, v138 & 1, (void (*)(uint64_t))sub_2206B1788, (uint64_t)v55, MEMORY[0x24BEE4AE0] + 8, v16);
          if (v15)
          {
            __break(1u);
          }
          else
          {

            swift_release();
          }
        }
      }
    }
  }
  else
  {
    v56[3] = sub_2206DAEDC();
    v58 = (id)*sub_22053C880();
    v54 = v58;
    v57 = sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_220464B68();
    v59 = sub_22045CFB4(6, 0);
    v161();

    swift_release();
  }
}

uint64_t sub_2206B12AC(void *a1)
{
  id v1;

  v1 = a1;
  sub_2204A2940();
  sub_2204A29A4();
  return sub_2206DABDC();
}

uint64_t sub_2206B12FC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2206B1338()
{
  uint64_t v0;

  return sub_2206B12AC(*(void **)(v0 + 16));
}

uint64_t sub_2206B1340()
{
  type metadata accessor for INDeviceCategory();
  return sub_2206DABD0();
}

void sub_2206B1378(void *a1, uint64_t a2, void (*a3)(id))
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t *v6;
  id v7;
  uint64_t v8;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  void *v16;
  id v18;

  v12 = objc_msgSend(a1, sel_settingMetadata);
  sub_220545F80();
  sub_2204ACAE8();
  v3 = sub_220678F30(a2);
  v11 = sub_2205ABFC4(v3);
  v10 = sub_2204BF680();
  v4 = sub_2204BF680();
  v18 = sub_2205AF118(v12, v11, v10, v4, 0, 0);

  sub_2206DAED0();
  v16 = (void *)*sub_22053C880();
  v5 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  v15 = v6;
  v7 = v18;
  sub_220464B68();
  sub_220464C30();
  v13 = sub_2206DABDC();
  v14 = v8;
  v15[3] = MEMORY[0x24BEE0D00];
  v15[4] = sub_220464CA0();
  *v15 = v13;
  v15[1] = v14;
  sub_22045A844();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v18);
  swift_release();

}

void sub_2206B15A8(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_2206AFC18(a1, a2, a3);
}

uint64_t sub_2206B15C8()
{
  return swift_deallocObject();
}

uint64_t sub_2206B15F0()
{
  return swift_deallocObject();
}

uint64_t sub_2206B1618()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206B1654()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206B1690()
{
  return swift_deallocObject();
}

uint64_t sub_2206B16B8()
{
  return sub_2206B1340();
}

uint64_t sub_2206B16C0()
{
  return swift_deallocObject();
}

uint64_t sub_2206B16E8()
{
  return swift_deallocObject();
}

uint64_t sub_2206B1710()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206B174C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_2206B1788()
{
  uint64_t v0;

  sub_2206B1378(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(id))(v0 + 32));
}

uint64_t *sub_2206B17B8()
{
  if (qword_2555DC668 != -1)
    swift_once();
  return &qword_2555FE3D8;
}

uint64_t sub_2206B180C()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for GetAXDifferentiateWithoutColorHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE3D8 = result;
  return result;
}

uint64_t type metadata accessor for GetAXDifferentiateWithoutColorHandler()
{
  return objc_opt_self();
}

void sub_2206B186C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v13;
  int v14;
  id v15;
  char v16;
  _BYTE v17[16];
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = a1;
  v23 = a2;
  v24 = a3;
  v22 = v3;
  sub_2206DAED0();
  v8 = (id)*sub_22053C880();
  v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v5 = sub_2205332A0();
  v9 = *v5;
  v13 = v5[1];
  v14 = *((unsigned __int8 *)v5 + 16);
  v15 = (id)*sub_22053C880();
  v6 = v15;
  v16 = *(_BYTE *)(v3 + 24);
  v7 = a1;
  swift_retain();
  swift_retain();
  v18 = a1;
  v19 = v3;
  v20 = a2;
  v21 = a3;
  sub_220531F08(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_2206B1C54, (uint64_t)v17, MEMORY[0x24BEE4AE0] + 8, v3);

  swift_release();
  swift_release();

}

void sub_2206B1A24(void *a1, uint64_t a2, void (*a3)(id))
{
  id v3;
  uint64_t *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v14;
  BOOL v15;

  v14 = objc_msgSend(a1, sel_settingMetadata);
  swift_retain();
  v15 = sub_2204B4C08();
  swift_release();
  if (v15)
    v12 = 1;
  else
    v12 = 2;
  v11 = sub_2205AF118(v14, 0, 0, v12, 0, 0);

  sub_2206DAED0();
  v10 = (id)*sub_22053C880();
  v3 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  v9 = v4;
  v5 = v11;
  sub_220464B68();
  sub_220464C30();
  v7 = sub_2206DABDC();
  v8 = v6;
  v9[3] = MEMORY[0x24BEE0D00];
  v9[4] = sub_220464CA0();
  *v9 = v7;
  v9[1] = v8;
  sub_22045A844();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v11);
  swift_release();

}

void sub_2206B1C54()
{
  uint64_t v0;

  sub_2206B1A24(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_2206B1C84(void *a1, uint64_t a2, uint64_t a3)
{
  sub_2206B186C(a1, a2, a3);
}

uint64_t sub_2206B1CA4()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetAXReduceWhitePointHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE3E0 = result;
  return result;
}

uint64_t type metadata accessor for SetAXReduceWhitePointHandler()
{
  return objc_opt_self();
}

uint64_t *sub_2206B1D04()
{
  if (qword_2555DC670 != -1)
    swift_once();
  return &qword_2555FE3E0;
}

uint64_t sub_2206B1D58(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  char v4;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  id v11;
  uint64_t *v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  id v19;
  id v20;
  char v21;
  id v22;
  char v23;
  char v24;
  id v25;
  char v26;
  char v27;
  uint64_t v30;
  unint64_t v32;
  id v33;
  char v34;
  _QWORD v35[4];
  _QWORD v36[4];
  uint64_t v37;
  id v38;
  char v39;
  uint64_t v40;
  char v41;
  id v42;
  id v43;
  char v44;
  uint64_t v45;
  char v46;
  id v47;
  id v48;
  char v49;
  uint64_t v50;
  char v51;
  void *v52;
  uint64_t v53;
  void (*v54)(void);
  uint64_t v55;
  void *v56;

  v53 = 0;
  v56 = a1;
  v54 = a2;
  v55 = a3;
  v3 = a1;
  v52 = a1;
  v32 = sub_22045F23C();
  v33 = SettingIntent.deviceCategory.getter(v32, (uint64_t)&protocol witness table for INSetBinarySettingIntent);
  v34 = v4;

  v48 = v33;
  v49 = v34 & 1;
  v50 = 1;
  v51 = 0;
  if ((v34 & 1) != 0 || (sub_220465AC4((uint64_t)&v48, (uint64_t)v35), (v51 & 1) != 0))
  {
    v27 = 0;
  }
  else
  {
    type metadata accessor for INDeviceCategory();
    sub_22045F400();
    v27 = sub_2206DAB88();
  }
  if ((v27 & 1) != 0)
    goto LABEL_26;
  v5 = a1;
  v47 = a1;
  v25 = SettingIntent.deviceCategory.getter(v32, (uint64_t)&protocol witness table for INSetBinarySettingIntent);
  v26 = v6;

  v43 = v25;
  v44 = v26 & 1;
  v45 = 2;
  v46 = 0;
  if ((v26 & 1) != 0 || (sub_220465AC4((uint64_t)&v43, (uint64_t)v36), (v46 & 1) != 0))
  {
    v24 = 0;
  }
  else
  {
    v35[3] = v36[0];
    v35[2] = v45;
    type metadata accessor for INDeviceCategory();
    sub_22045F400();
    v24 = sub_2206DAB88();
  }
  if ((v24 & 1) != 0)
    goto LABEL_26;
  v7 = a1;
  v42 = a1;
  v22 = SettingIntent.deviceCategory.getter(v32, (uint64_t)&protocol witness table for INSetBinarySettingIntent);
  v23 = v8;

  v38 = v22;
  v39 = v23 & 1;
  v40 = 4;
  v41 = 0;
  if ((v23 & 1) != 0 || (sub_220465AC4((uint64_t)&v38, (uint64_t)&v37), (v41 & 1) != 0))
  {
    v21 = 0;
  }
  else
  {
    v36[3] = v37;
    v36[2] = v40;
    type metadata accessor for INDeviceCategory();
    sub_22045F400();
    v21 = sub_2206DAB88();
  }
  if ((v21 & 1) != 0)
  {
LABEL_26:
    sub_2206DAED0();
    v13 = (id)*sub_22053C880();
    v11 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    v14 = sub_2204B51A4();
    swift_release();
    v12 = sub_22053523C();
    v15 = *v12;
    v16 = v12[1];
    v17 = *((unsigned __int8 *)v12 + 16);
    v18 = *(_BYTE *)(v30 + 24);
    swift_retain();
    sub_220524C7C(v14, a1, v15, v16, v17, v18 & 1, a2, a3, (uint64_t)sub_2206B238C, v30, 0, 1, 0, 0);
    return sub_2204614E0((uint64_t)sub_2206B238C);
  }
  else
  {
    sub_2206DAED0();
    v19 = (id)*sub_22053C880();
    v9 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_2205F5A2C(3);
    v20 = sub_2205251B4();
    swift_bridgeObjectRelease();
    ((void (*)(id))a2)(v20);

    return swift_release();
  }
}

uint64_t sub_2206B2320()
{
  swift_retain();
  sub_2204B51D4();
  return swift_release();
}

uint64_t sub_2206B238C()
{
  return sub_2206B2320();
}

uint64_t sub_2206B23B0(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_2206B1D58(a1, a2, a3);
}

uint64_t sub_2206B23D0()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetAXSwitchControlHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE3E8 = result;
  return result;
}

uint64_t type metadata accessor for SetAXSwitchControlHandler()
{
  return objc_opt_self();
}

uint64_t *sub_2206B2430()
{
  if (qword_2555DC678 != -1)
    swift_once();
  return &qword_2555FE3E8;
}

void sub_2206B2484(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v13;
  int v14;
  id v15;
  char v16;
  _BYTE v17[16];
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = a1;
  v23 = a2;
  v24 = a3;
  v22 = v3;
  sub_2206DAED0();
  v8 = (id)*sub_22053C880();
  v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v5 = sub_220535E94();
  v9 = *v5;
  v13 = v5[1];
  v14 = *((unsigned __int8 *)v5 + 16);
  v15 = (id)*sub_22053C880();
  v6 = v15;
  v16 = *(_BYTE *)(v3 + 24);
  swift_retain();
  v7 = a1;
  swift_retain();
  v18 = v3;
  v19 = a1;
  v20 = a2;
  v21 = a3;
  sub_220531F08(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_2206B2758, (uint64_t)v17, MEMORY[0x24BEE4AE0] + 8, v3);
  swift_release();

  swift_release();
}

uint64_t sub_2206B2638(uint64_t a1, void *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t *v4;
  BOOL v6;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;

  swift_retain();
  v6 = sub_2204B538C();
  swift_release();
  v4 = sub_220534F98();
  v9 = *v4;
  v10 = v4[1];
  v11 = *((unsigned __int8 *)v4 + 16);
  v12 = *(_BYTE *)(a1 + 24);
  swift_retain();
  sub_220524C7C(v6, a2, v9, v10, v11, v12 & 1, a3, a4, (uint64_t)sub_2206B2814, a1, 0, 1, 0, 0);
  return sub_2204614E0((uint64_t)sub_2206B2814);
}

uint64_t sub_2206B2758()
{
  uint64_t v0;

  return sub_2206B2638(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(void))(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_2206B2788()
{
  swift_retain();
  sub_2204B53BC();
  return swift_release();
}

void sub_2206B27F4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_2206B2484(a1, a2, a3);
}

uint64_t sub_2206B2814()
{
  return sub_2206B2788();
}

id sub_2206B2838()
{
  id result;
  void *v1;

  v1 = (void *)*sub_220546738();
  result = v1;
  qword_2555FE3F0 = (uint64_t)v1;
  return result;
}

uint64_t *sub_2206B286C()
{
  if (qword_2555DC680 != -1)
    swift_once();
  return &qword_2555FE3F0;
}

void *sub_2206B28C0()
{
  id v0;
  void *v2;

  v2 = (void *)*sub_2206B286C();
  v0 = v2;
  return v2;
}

uint64_t sub_2206B28EC()
{
  const void *v0;
  _QWORD v2[2];
  unint64_t v3;
  uint64_t v4;
  char *v5;
  const void *v6;

  v6 = 0;
  v4 = type metadata accessor for FlowStrategy.IntentConversionError();
  v3 = (*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v2[1]);
  v5 = (char *)v2 - v3;
  v6 = v0;
  sub_2206B29DC(v0, (char *)v2 - v3);
  return sub_2206DABD0();
}

uint64_t type metadata accessor for FlowStrategy.IntentConversionError()
{
  uint64_t v1;

  v1 = qword_2555E8F70;
  if (!qword_2555E8F70)
    return swift_getSingletonMetadata();
  return v1;
}

void *sub_2206B29DC(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;

  v6 = type metadata accessor for FlowStrategy.IntentConversionError();
  if (swift_getEnumCaseMultiPayload() < 2)
  {
    v2 = sub_2206D9E74();
    (*(void (**)(void *, const void *))(*(_QWORD *)(v2 - 8) + 16))(a2, a1);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  return a2;
}

uint64_t sub_2206B2AC4()
{
  uint64_t *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v6;
  id v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD600);
  sub_2206DB260();
  v6 = v0;
  v7 = (id)*MEMORY[0x24BDD0FC8];
  v1 = (id)*MEMORY[0x24BDD0FC8];
  *v6 = sub_2206DABA0();
  v6[1] = v2;
  v3 = sub_2206B28EC();
  v6[5] = MEMORY[0x24BEE0D00];
  v6[2] = v3;
  v6[3] = v4;
  sub_22045A844();

  return sub_2206DAB40();
}

uint64_t sub_2206B2B9C()
{
  sub_2206B2BC8();
  return sub_2206DB2CC();
}

unint64_t sub_2206B2BC8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2555E8E00;
  if (!qword_2555E8E00)
  {
    v0 = type metadata accessor for FlowStrategy.IntentConversionError();
    v1 = MEMORY[0x2207E69C0](&unk_2206EA48C, v0);
    atomic_store(v1, (unint64_t *)&qword_2555E8E00);
    return v1;
  }
  return v3;
}

uint64_t sub_2206B2C38()
{
  sub_2206B2BC8();
  return sub_2206DB2C0();
}

uint64_t sub_2206B2C64()
{
  return sub_2206B2AC4();
}

uint64_t sub_2206B2C78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  _DWORD v37[4];
  uint64_t v38;
  id v39;
  int v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  id v50;
  _BOOL4 v51;
  uint64_t v52;
  uint64_t *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  char *v61;
  uint64_t *v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  id v71;
  _BOOL4 v72;
  uint64_t v73;
  uint64_t *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  id v80;
  uint64_t *v81;
  _QWORD *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  const char *v87;
  const char *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  int v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  int v113;
  BOOL v114;
  id v115;
  uint64_t v116;
  _QWORD v117[5];
  BOOL v118;
  id v119;
  id v120;
  uint64_t v121;
  char v122[8];
  uint64_t v123;
  uint64_t v124;
  char *v125;
  char *v126;

  v84 = a2;
  v85 = a1;
  v3 = v2;
  v4 = v85;
  v102 = v3;
  v106 = "FlowStrategy: actionForInput.";
  v86 = "FlowStrategy: not a compatible type of parse. Ignoring.";
  v87 = "FlowStrategy: %@ handling NLV3Intent.";
  v88 = "FlowStrategy: Error parsing uso parse.";
  v124 = 0;
  v123 = 0;
  v126 = 0;
  v89 = 0;
  v120 = 0;
  v119 = 0;
  v118 = 0;
  v125 = 0;
  v115 = 0;
  v114 = 0;
  v104 = 0;
  v90 = sub_2206D9ED4();
  v91 = *(_QWORD *)(v90 - 8);
  v92 = (*(_QWORD *)(v91 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v93 = (uint64_t)v37 - v92;
  v94 = sub_2206D9E98();
  v95 = *(_QWORD *)(v94 - 8);
  v96 = (*(_QWORD *)(v95 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v104);
  v97 = (char *)v37 - v96;
  v126 = (char *)v37 - v96;
  v98 = sub_2206DA690();
  v99 = *(_QWORD *)(v98 - 8);
  v100 = (*(_QWORD *)(v99 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v104);
  v101 = (char *)v37 - v100;
  v125 = (char *)v37 - v100;
  v112 = sub_2206D9E74();
  v110 = *(_QWORD *)(v112 - 8);
  v103 = (*(_QWORD *)(v110 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v112);
  v111 = (char *)v37 - v103;
  v124 = v4;
  v123 = v5;
  v107 = sub_2206DAED0();
  v109 = (id)*sub_22053DBE8();
  v6 = v109;
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  v108 = sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  sub_2206D9E38();
  v113 = (*(uint64_t (**)(char *, uint64_t))(v110 + 88))(v111, v112);
  if (v113 == *MEMORY[0x24BE98E08])
  {
    (*(void (**)(char *, uint64_t))(v110 + 96))(v111, v112);
    (*(void (**)(char *, char *, uint64_t))(v99 + 32))(v101, v111, v98);
    v125 = v101;
    v82 = v117;
    memset(v117, 0, sizeof(v117));
    v81 = &v116;
    sub_22050B9EC(&v116);
    v83 = sub_220522058((uint64_t)v101, (uint64_t)v82, (uint64_t)v81);
    sub_2204A1FA8((uint64_t)v81);
    sub_2204A1FA8((uint64_t)v82);
    v115 = v83;
    v7 = v83;
    if (v83)
    {
      v80 = v83;
      v78 = v83;
      objc_opt_self();
      v79 = swift_dynamicCastObjCClass();
      if (v79)
      {
        v77 = (void *)v79;
      }
      else
      {
        v76 = 0;

        v77 = v76;
      }
      v75 = v77;
    }
    else
    {
      v75 = 0;
    }
    v72 = v75 != 0;
    v114 = v75 != 0;

    v70 = sub_2206DAED0();
    v71 = (id)*sub_22053DBE8();
    v8 = v71;
    v73 = sub_2206DB260();
    v74 = v9;
    if (v72)
    {
      v69 = sub_2206DAC30();
      v68 = v10;
      v74[3] = MEMORY[0x24BEE0D00];
      v11 = sub_220464CA0();
      v12 = v68;
      v13 = v74;
      v14 = v11;
      v15 = v69;
    }
    else
    {
      v67 = sub_2206DAC30();
      v66 = v16;
      v74[3] = MEMORY[0x24BEE0D00];
      v17 = sub_220464CA0();
      v12 = v66;
      v13 = v74;
      v14 = v17;
      v15 = v67;
    }
    v74[4] = v14;
    *v13 = v15;
    v13[1] = v12;
    v18 = v73;
    sub_22045A844();
    v65 = v18;
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    if (v72)
      sub_2206D9BBC();
    else
      sub_2206D9BC8();

    return (*(uint64_t (**)(char *, uint64_t))(v99 + 8))(v101, v98);
  }
  else if (v113 == *MEMORY[0x24BE98E98])
  {
    v19 = v89;
    v20 = v97;
    (*(void (**)(char *, uint64_t))(v110 + 96))(v111, v112);
    (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v20, v111, v94);
    v126 = v20;
    sub_2206D9E8C();
    v61 = v122;
    sub_2206D9E80();
    v62 = &v121;
    sub_22050B9EC(&v121);
    v63 = sub_220585324(v93, v61, v62);
    v64 = v19;
    if (v19)
    {
      v43 = v64;
      sub_2204A1FA8((uint64_t)&v121);
      sub_2204A1FA8((uint64_t)v122);
      (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v93, v90);
      v33 = v43;
      v120 = v43;
      v40 = sub_2206DAEDC();
      v42 = (id)*sub_22053DBE8();
      v34 = v42;
      v41 = sub_2206DB260();
      sub_2206DAA14();
      swift_bridgeObjectRelease();

      sub_2206D9BC8();
      return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v97, v94);
    }
    else
    {
      v60 = v63;
      sub_2204A1FA8((uint64_t)&v121);
      sub_2204A1FA8((uint64_t)v122);
      (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v93, v90);
      v119 = v60;
      v21 = v60;
      if (v60)
      {
        v59 = v60;
        v57 = v60;
        objc_opt_self();
        v58 = swift_dynamicCastObjCClass();
        if (v58)
        {
          v56 = (void *)v58;
        }
        else
        {
          v55 = 0;

          v56 = v55;
        }
        v54 = v56;
      }
      else
      {
        v54 = 0;
      }
      v51 = v54 != 0;
      v118 = v54 != 0;

      v49 = sub_2206DAED0();
      v50 = (id)*sub_22053DBE8();
      v22 = v50;
      v52 = sub_2206DB260();
      v53 = v23;
      if (v51)
      {
        v48 = sub_2206DAC30();
        v47 = v24;
        v53[3] = MEMORY[0x24BEE0D00];
        v25 = sub_220464CA0();
        v26 = v47;
        v27 = v53;
        v28 = v25;
        v29 = v48;
      }
      else
      {
        v46 = sub_2206DAC30();
        v45 = v30;
        v53[3] = MEMORY[0x24BEE0D00];
        v31 = sub_220464CA0();
        v26 = v45;
        v27 = v53;
        v28 = v31;
        v29 = v46;
      }
      v53[4] = v28;
      *v27 = v29;
      v27[1] = v26;
      v32 = v52;
      sub_22045A844();
      v44 = v32;
      sub_2206DAA14();
      swift_bridgeObjectRelease();

      if (v51)
        sub_2206D9BBC();
      else
        sub_2206D9BC8();

      return (*(uint64_t (**)(char *, uint64_t))(v95 + 8))(v97, v94);
    }
  }
  else
  {
    v37[3] = sub_2206DAED0();
    v39 = (id)*sub_22053DBE8();
    v35 = v39;
    v38 = sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    sub_2206D9BC8();
    return (*(uint64_t (**)(char *, uint64_t))(v110 + 8))(v111, v112);
  }
}

uint64_t sub_2206B39C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[32] = a1;
  v3[22] = v3;
  v3[23] = 0;
  v3[24] = 0;
  v3[25] = 0;
  v3[26] = 0;
  v3[27] = 0;
  v3[29] = 0;
  v3[30] = 0;
  v3[31] = 0;
  v4 = sub_2206D9ED4();
  v3[33] = v4;
  v3[34] = *(_QWORD *)(v4 - 8);
  v3[35] = swift_task_alloc();
  v5 = sub_2206D9E98();
  v3[36] = v5;
  v3[37] = *(_QWORD *)(v5 - 8);
  v3[38] = swift_task_alloc();
  v6 = sub_2206DA690();
  v3[39] = v6;
  v3[40] = *(_QWORD *)(v6 - 8);
  v3[41] = swift_task_alloc();
  v3[42] = swift_task_alloc();
  v7 = sub_2206D9E74();
  v3[43] = v7;
  v3[44] = *(_QWORD *)(v7 - 8);
  v3[45] = swift_task_alloc();
  v3[46] = swift_task_alloc();
  v3[23] = a1;
  v3[24] = a2;
  v3[25] = v2;
  return swift_task_switch();
}

uint64_t sub_2206B3B68()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
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
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  id v53;
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
  id v65;
  _QWORD *v66;
  void *v67;
  uint64_t v68;
  void (*v69)(void);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;

  v72 = v0[46];
  v70 = v0[44];
  v71 = v0[43];
  v68 = v0[32];
  v0[22] = v0;
  sub_2206DAED0();
  v67 = (void *)*sub_22053DBE8();
  v1 = v67;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v69 = *(void (**)(void))(v70 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v69)(v72, v68, v71);
  v73 = (*(uint64_t (**)(uint64_t, uint64_t))(v70 + 88))(v72, v71);
  if (v73 == *MEMORY[0x24BE98E08])
  {
    v62 = v66[46];
    v64 = v66[42];
    v61 = v66[40];
    v63 = v66[39];
    (*(void (**)(void))(v66[44] + 96))();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 32))(v64, v62, v63);
    v66[30] = v64;
    v66[12] = 0;
    v66[13] = 0;
    v66[14] = 0;
    v66[15] = 0;
    v66[16] = 0;
    sub_22050B9EC(v66 + 17);
    v65 = sub_220522058(v64, (uint64_t)(v66 + 12), (uint64_t)(v66 + 17));
    sub_2204A1FA8((uint64_t)(v66 + 17));
    sub_2204A1FA8((uint64_t)(v66 + 12));
    if (v65)
    {
      objc_opt_self();
      v60 = swift_dynamicCastObjCClass();
      if (v60)
      {
        v59 = v60;
      }
      else
      {

        v59 = 0;
      }
      v58 = v59;
    }
    else
    {
      v58 = 0;
    }
    if (!v58)
    {
      v55 = v66[42];
      v49 = v66[41];
      v54 = v66[40];
      v56 = v66[39];
      v53 = (id)*sub_22053DBE8();
      v5 = v53;
      sub_2206DAEDC();
      sub_2206DB260();
      v52 = v6;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 16))(v49, v55, v56);
      sub_22052243C();
      v50 = sub_2206DABDC();
      v51 = v7;
      v52[3] = MEMORY[0x24BEE0D00];
      v52[4] = sub_220464CA0();
      *v52 = v50;
      v52[1] = v51;
      sub_22045A844();
      sub_2206DAA08();
      swift_bridgeObjectRelease();

      type metadata accessor for FlowStrategy.IntentConversionError();
      sub_2205CED4C();
      swift_allocError();
      v69();
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v55, v56);
      goto LABEL_23;
    }
    v2 = v66[42];
    v3 = v66[40];
    v4 = v66[39];
    v66[31] = v58;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    v57 = v58;
LABEL_22:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v66[22] + 8))(v57);
  }
  if (v73 == *MEMORY[0x24BE98E98])
  {
    v45 = v66[46];
    v8 = v66[38];
    v44 = v66[37];
    v46 = v66[36];
    v47 = v66[35];
    (*(void (**)(void))(v66[44] + 96))();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v8, v45, v46);
    v66[26] = v8;
    sub_2206D9E8C();
    sub_2206D9E80();
    sub_22050B9EC(v66 + 7);
    v48 = sub_220585324(v47, v66 + 2, v66 + 7);
    v43 = v66[35];
    v41 = v66[34];
    v42 = v66[33];
    sub_2204A1FA8((uint64_t)(v66 + 7));
    sub_2204A1FA8((uint64_t)(v66 + 2));
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v43, v42);
    if (v48)
    {
      objc_opt_self();
      v40 = swift_dynamicCastObjCClass();
      if (v40)
      {
        v39 = v40;
      }
      else
      {

        v39 = 0;
      }
      v38 = v39;
    }
    else
    {
      v38 = 0;
    }
    if (!v38)
    {
      type metadata accessor for FlowStrategy.IntentConversionError();
      sub_2205CED4C();
      v37 = (void *)swift_allocError();
      v69();
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      v26 = v66[38];
      v25 = v66[37];
      v27 = v66[36];
      v16 = v37;
      v66[27] = v37;
      v24 = (id)*sub_22053DBE8();
      v17 = v24;
      sub_2206DAEDC();
      sub_2206DB260();
      v23 = v18;
      v19 = v37;
      v66[28] = v37;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD288);
      v21 = sub_2206DABD0();
      v22 = v20;
      v23[3] = MEMORY[0x24BEE0D00];
      v23[4] = sub_220464CA0();
      *v23 = v21;
      v23[1] = v22;
      sub_22045A844();
      sub_2206DAA08();
      swift_bridgeObjectRelease();

      type metadata accessor for FlowStrategy.IntentConversionError();
      sub_2205CED4C();
      swift_allocError();
      v69();
      swift_storeEnumTagMultiPayload();
      swift_willThrow();

      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
      goto LABEL_23;
    }
    v9 = v66[38];
    v10 = v66[37];
    v11 = v66[36];
    v66[29] = v38;
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    v57 = v38;
    goto LABEL_22;
  }
  v35 = v66[46];
  v28 = v66[45];
  v34 = v66[44];
  v36 = v66[43];
  v33 = v66[32];
  v32 = (id)*sub_22053DBE8();
  v12 = v32;
  sub_2206DAEDC();
  sub_2206DB260();
  v31 = v13;
  ((void (*)(uint64_t, uint64_t, uint64_t))v69)(v28, v33, v36);
  v29 = sub_2206DABD0();
  v30 = v14;
  v31[3] = MEMORY[0x24BEE0D00];
  v31[4] = sub_220464CA0();
  *v31 = v29;
  v31[1] = v30;
  sub_22045A844();
  sub_2206DAA08();
  swift_bridgeObjectRelease();

  type metadata accessor for FlowStrategy.IntentConversionError();
  sub_2205CED4C();
  swift_allocError();
  v69();
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v36);
LABEL_23:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(v66[22] + 8))();
}

uint64_t sub_2206B48FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2206B2C78(a1, a2);
}

uint64_t sub_2206B491C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_2204E62D4;
  return sub_2206B39C0(a1, a2);
}

uint64_t sub_2206B499C()
{
  type metadata accessor for FlowStrategy();
  return sub_2206D9D78();
}

uint64_t type metadata accessor for FlowStrategy()
{
  return objc_opt_self();
}

void *sub_2206B49F8()
{
  return sub_2206B28C0();
}

uint64_t sub_2206B4A0C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  v3 = v0;
  *(_QWORD *)(v0 + 16) = v0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v1;
  type metadata accessor for FlowStrategy();
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_2204ABFCC;
  return sub_2206D994C();
}

uint64_t sub_2206B4AA8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  v3 = v0;
  *(_QWORD *)(v0 + 16) = v0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v1;
  type metadata accessor for FlowStrategy();
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_2204ABFCC;
  return sub_2206D9940();
}

uint64_t sub_2206B4B44()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  v3 = v0;
  *(_QWORD *)(v0 + 16) = v0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v1;
  type metadata accessor for FlowStrategy();
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_2204ABFCC;
  return sub_2206D9934();
}

uint64_t sub_2206B4BE0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  v3 = v0;
  *(_QWORD *)(v0 + 16) = v0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v1;
  type metadata accessor for FlowStrategy();
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_2204ABFCC;
  return sub_2206D9928();
}

uint64_t sub_2206B4C84(uint64_t a1, void *a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v8;

  v6 = type metadata accessor for FlowStrategy();
  v2 = sub_2206B4CE4();
  v3 = sub_220572F14(a1, a2, v6, v2);
  return (*(uint64_t (**)(uint64_t))(v8 + 8))(v3);
}

unint64_t sub_2206B4CE4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2555E8E48;
  if (!qword_2555E8E48)
  {
    v0 = type metadata accessor for FlowStrategy();
    v1 = MEMORY[0x2207E69C0](&unk_2206EA470, v0);
    atomic_store(v1, (unint64_t *)&qword_2555E8E48);
    return v1;
  }
  return v3;
}

uint64_t sub_2206B4D54()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  v3 = v0;
  *(_QWORD *)(v0 + 16) = v0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v1;
  type metadata accessor for FlowStrategy();
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_2204ABFCC;
  return sub_2206D9958();
}

void *sub_2206B4DF8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v3;

  if (a1 != a2)
  {
    sub_2206B4EF4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() < 2)
    {
      v3 = sub_2206D9E74();
      (*(void (**)(void *, const void *))(*(_QWORD *)(v3 - 8) + 16))(a1, a2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_2206B4EF4(uint64_t a1)
{
  uint64_t v1;

  type metadata accessor for FlowStrategy.IntentConversionError();
  if (swift_getEnumCaseMultiPayload() < 2)
  {
    v1 = sub_2206D9E74();
    (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(a1);
  }
  return a1;
}

void *sub_2206B4F90(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v3;

  if (a1 != a2)
  {
    sub_2206B4EF4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() < 2)
    {
      v3 = sub_2206D9E74();
      (*(void (**)(void *, const void *))(*(_QWORD *)(v3 - 8) + 32))(a1, a2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

unint64_t sub_2206B508C()
{
  return sub_2206B50A0();
}

unint64_t sub_2206B50A0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2555E8FA8;
  if (!qword_2555E8FA8)
  {
    v0 = type metadata accessor for FlowStrategy();
    v1 = MEMORY[0x2207E69C0](&unk_2206EA3F0, v0);
    atomic_store(v1, (unint64_t *)&qword_2555E8FA8);
    return v1;
  }
  return v3;
}

unint64_t sub_2206B5110()
{
  return sub_2206B5124();
}

unint64_t sub_2206B5124()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2555E8FB0;
  if (!qword_2555E8FB0)
  {
    v0 = type metadata accessor for FlowStrategy();
    v1 = MEMORY[0x2207E69C0](&unk_2206EA3B8, v0);
    atomic_store(v1, (unint64_t *)&qword_2555E8FB0);
    return v1;
  }
  return v3;
}

unint64_t sub_2206B5194(uint64_t a1)
{
  unint64_t result;

  result = sub_2206B50A0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2206B51BC()
{
  return sub_2205CED4C();
}

unint64_t sub_2206B51D0()
{
  return sub_2206B51E4();
}

unint64_t sub_2206B51E4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2555E8FE0;
  if (!qword_2555E8FE0)
  {
    v0 = type metadata accessor for FlowStrategy();
    v1 = MEMORY[0x2207E69C0](&unk_2206EA420, v0);
    atomic_store(v1, (unint64_t *)&qword_2555E8FE0);
    return v1;
  }
  return v3;
}

uint64_t *sub_2206B5254()
{
  if (qword_2555DC688 != -1)
    swift_once();
  return &qword_2555FE3F8;
}

uint64_t sub_2206B52A8()
{
  uint64_t result;

  type metadata accessor for MacNavigationHandler();
  result = sub_220462004();
  qword_2555FE3F8 = result;
  return result;
}

uint64_t type metadata accessor for MacNavigationHandler()
{
  return objc_opt_self();
}

uint64_t sub_2206B52FC()
{
  id v0;
  id v2;

  sub_2206DAED0();
  v2 = (id)*sub_22053C880();
  v0 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  return 0;
}

uint64_t sub_2206B53B8(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  uint64_t v36;
  _QWORD v37[3];
  uint64_t v38;
  uint64_t v39;
  void *v40;

  v39 = 0;
  v40 = a1;
  v1 = a1;
  if (a1 && (v31 = objc_msgSend(a1, sel_settingMetadata), a1, v31))
  {
    v26 = objc_msgSend(v31, sel_settingId);
    v27 = sub_2206DABA0();
    v28 = v2;

    v29 = v27;
    v30 = v28;
  }
  else
  {
    v29 = 0;
    v30 = 0;
  }
  swift_bridgeObjectRetain();
  sub_220626678(0);
  v24 = v3;
  v25 = v4;
  swift_bridgeObjectRetain();
  v37[0] = v29;
  v37[1] = v30;
  v37[2] = v24;
  v38 = v25;
  if (v30)
  {
    sub_2204A2364(v37, &v33);
    if (v38)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v22 = sub_2206DAC3C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_220461C68();
      v23 = v22;
      goto LABEL_13;
    }
    sub_220461C68();
    goto LABEL_15;
  }
  if (v38)
  {
LABEL_15:
    sub_2204A2114();
    v23 = 0;
    goto LABEL_13;
  }
  sub_220461C68();
  v23 = 1;
LABEL_13:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = a1;
  if ((v23 & 1) == 0)
  {
    v6 = a1;
    if (a1 && (v20 = objc_msgSend(a1, sel_settingMetadata), a1, v20))
    {
      v15 = objc_msgSend(v20, sel_settingId);
      v16 = sub_2206DABA0();
      v17 = v7;

      v18 = v16;
      v19 = v17;
    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
    swift_bridgeObjectRetain();
    sub_220626678(1);
    v13 = v8;
    v14 = v9;
    swift_bridgeObjectRetain();
    v35[0] = v18;
    v35[1] = v19;
    v35[2] = v13;
    v36 = v14;
    if (v19)
    {
      sub_2204A2364(v35, &v34);
      if (v36)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v11 = sub_2206DAC3C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_220461C68();
        v12 = v11;
LABEL_29:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v21 = v12;
        goto LABEL_33;
      }
      sub_220461C68();
    }
    else if (!v36)
    {
      sub_220461C68();
      v12 = 1;
      goto LABEL_29;
    }
    sub_2204A2114();
    v12 = 0;
    goto LABEL_29;
  }
  v21 = 1;
LABEL_33:

  return v21 & 1;
}

BOOL sub_2206B58BC(void *a1)
{
  uint64_t v1;
  id v2;
  BOOL v4;
  char v6;
  char v7;
  uint64_t v8;
  void *v9;

  v9 = a1;
  v8 = v1;
  v6 = sub_2206B53B8(a1);
  swift_retain();
  v2 = a1;
  if ((v6 & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    sub_2206B599C(a1, &v7);
    v4 = v7 != 62;
  }
  swift_release();

  return v4;
}

void sub_2206B599C(void *a1@<X0>, char *a2@<X8>)
{
  id v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  char v15;
  _QWORD *v16;
  id v17;
  Swift::String v18;
  Swift::String v19;
  id v20;
  char v23;

  v2 = a1;
  if (a1 && (v20 = objc_msgSend(a1, sel_settingMetadata), a1, v20))
  {
    v17 = objc_msgSend(v20, sel_settingId);
    v18._countAndFlagsBits = sub_2206DABA0();
    v18._object = v3;

    v19 = v18;
  }
  else
  {
    v19 = (Swift::String)0;
  }
  if (v19._object)
  {
    sub_2206DB260();
    v16 = v4;
    BinarySettingIdentifier.rawValue.getter();
    *v16 = v5;
    v16[1] = v6;
    BinarySettingIdentifier.rawValue.getter();
    v16[2] = v7;
    v16[3] = v8;
    BinarySettingIdentifier.rawValue.getter();
    v16[4] = v9;
    v16[5] = v10;
    BinarySettingIdentifier.rawValue.getter();
    v16[6] = v11;
    v16[7] = v12;
    sub_22045A844();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DEF08);
    sub_220520674();
    if ((sub_2206DAC9C() & 1) != 0)
    {
      swift_bridgeObjectRetain();
      BinarySettingIdentifier.init(rawValue:)(v19);
      v15 = v23;
    }
    else
    {
      v15 = 62;
    }
    *a2 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2206DAED0();
    v14 = (id)*sub_22053C880();
    v13 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    *a2 = 62;
  }
}

uint64_t sub_2206B5CEC()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetVoiceOverHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE400 = result;
  return result;
}

uint64_t type metadata accessor for SetVoiceOverHandler()
{
  return objc_opt_self();
}

uint64_t *sub_2206B5D4C()
{
  if (qword_2555DC690 != -1)
    swift_once();
  return &qword_2555FE400;
}

uint64_t sub_2206B5DA0(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  uint64_t *v4;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  uint64_t v16;
  void *v17;
  id v19;
  uint64_t v20;

  sub_2206DAED0();
  v17 = (void *)*sub_22053C880();
  v3 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  sub_2205BB7F8();
  swift_retain();
  v19 = objc_msgSend(a1, sel_settingMetadata);
  v20 = sub_2205BB8A0(v19);

  swift_release();
  if ((v20 & 1) != 0)
  {
    sub_2206DAEDC();
    v7 = (id)*sub_22053C880();
    v6 = v7;
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_2205F5A2C(3);
    v8 = sub_2205251B4();
    swift_bridgeObjectRelease();
    ((void (*)(id))a2)(v8);

    return swift_release();
  }
  else
  {
    swift_retain();
    v9 = sub_2204B4110();
    swift_release();
    v4 = sub_220535908();
    v10 = *v4;
    v11 = v4[1];
    v12 = *((unsigned __int8 *)v4 + 16);
    v13 = *(_BYTE *)(v16 + 24);
    swift_retain();
    sub_220524C7C(v9, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_2206B60D4, v16, 0, 1, 0, 0);
    return sub_2204614E0((uint64_t)sub_2206B60D4);
  }
}

uint64_t sub_2206B6068()
{
  swift_retain();
  sub_2204B4140();
  return swift_release();
}

uint64_t sub_2206B60D4()
{
  return sub_2206B6068();
}

uint64_t sub_2206B60F8(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_2206B5DA0(a1, a2, a3);
}

uint64_t sub_2206B6118(void *a1)
{
  id v1;
  id v2;
  id v3;
  char v5;
  BOOL v6;
  BOOL v7;
  id v8;
  char v10;
  id v11[6];

  v11[5] = a1;
  sub_2206DAED0();
  v8 = (id)*sub_22053C880();
  v1 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v11[4] = objc_msgSend(a1, sel_action);
  v11[3] = (id)1;
  type metadata accessor for INSettingAction();
  sub_220545DB0();
  v10 = sub_2206DB284();
  v2 = a1;
  if ((v10 & 1) != 0)
  {
    v11[0] = objc_msgSend(a1, sel_numericValue);
    v7 = v11[0] == 0;
    sub_2204ACB4C(v11);
    v6 = v7;
  }
  else
  {
    v6 = 0;
  }

  v3 = a1;
  if (v6)
  {
    v11[2] = objc_msgSend(a1, sel_boundedValue);
    v11[1] = 0;
    type metadata accessor for INBoundedSettingValue();
    sub_220460E50();
    v5 = sub_2206DB284();
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

id sub_2206B6348(uint64_t a1, char a2)
{
  id v4;
  id v5;

  sub_2204621C0();
  v5 = sub_22045CFB4(9, 0);
  sub_2205F5A2C(a2);
  v4 = (id)sub_2206DAB94();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setErrorDetail_, v4);

  return v5;
}

void sub_2206B63EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, void (*a7)(void), uint64_t a8, double a9, double a10, double a11, double a12, uint64_t a13, uint64_t a14)
{
  char v14;
  uint64_t v15;
  id v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  id v28;
  _QWORD v29[12];
  _DWORD v30[4];
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _DWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46;
  void (*v47)(void);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(void);
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;

  v39 = a9;
  v40 = a10;
  v41 = a11;
  v42 = a2;
  v43 = a3;
  v44 = a4;
  v45 = a5;
  v46 = a6;
  v47 = a7;
  v48 = a8;
  v49 = a13;
  v50 = a14;
  v51 = "[handleNumericSettingIntent] Unable to determine the requested value of the setting";
  v54 = 0;
  v52 = 0;
  v68 = a1;
  v67 = a9;
  v66 = a10;
  v65 = a11;
  v64 = a12;
  v63 = a2;
  v60 = a3;
  v61 = a4;
  v62 = a5;
  v59 = a6 & 1;
  v57 = a7;
  v58 = a8;
  v55 = a13;
  v56 = a14;
  v53 = sub_2206B676C(a1, a9, a10, a11, a12);
  if ((v14 & 1) != 0)
  {
    v30[1] = sub_2206DAEDC();
    v31 = (id)*sub_22053C880();
    v28 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    v32 = sub_2206B671C(0, 8);
    v47();

    swift_release();
  }
  else
  {
    v38 = v53;
    v15 = v33;
    v34 = v53;
    v54 = v53;
    v35 = (id)*sub_22053C880();
    v16 = v35;
    swift_retain();
    swift_retain();
    v36 = v30;
    v17 = MEMORY[0x24BDAC7A8](v43);
    v37 = v29;
    v29[2] = v18;
    v29[3] = v19;
    v29[4] = v20;
    v29[5] = v21;
    v29[6] = v47;
    v29[7] = v48;
    v29[8] = v22;
    v29[9] = v23;
    *(double *)&v29[10] = v17;
    sub_220531F08(v24, v25, v26, v27, v46 & 1, (void (*)(uint64_t))sub_2206BA0E4, (uint64_t)v29, MEMORY[0x24BEE4AE0] + 8, v15);
    swift_release();
    swift_release();

  }
}

id sub_2206B671C(uint64_t a1, uint64_t a2)
{
  sub_2204621C0();
  return sub_22045CFB4(a2, 0);
}

uint64_t sub_2206B676C(void *a1, double a2, double a3, double a4, double a5)
{
  char v5;
  NSObject *v6;
  _QWORD *v7;
  double v8;
  NSObject *v9;
  id v10;
  _QWORD *v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  char v18;
  uint64_t v19;
  double v20;
  char v21;
  id v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint32_t v26;
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
  _QWORD *v57;
  os_log_t log;
  os_log_type_t v59;
  double v60;
  id v61;
  uint64_t v62;
  id v63;
  uint8_t *buf;
  uint64_t v66;
  uint64_t v67;
  uint32_t size;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  os_log_t oslog;
  os_log_type_t v76;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _BYTE *v87[2];
  uint32_t v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _BYTE *v94[2];
  double v95;
  char v96;
  double v97;
  double v98;
  uint64_t v99;
  double v100;
  double v101;
  char v102;
  double v103;
  double v104;
  uint64_t v105;
  uint64_t v106;
  uint32_t v107;
  uint64_t v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;

  v108 = 0;
  v89 = 0;
  v113 = a1;
  v112 = a2;
  v111 = a3;
  v110 = a4;
  v109 = a5;
  v82 = sub_22054FD78(a3, a4);
  if ((v5 & 1) != 0)
  {
    v62 = swift_allocObject();
    v108 = v62 + 16;
    v63 = objc_msgSend(a1, sel_numericValue);
    if (v63 && (v61 = objc_msgSend(v63, sel_value), v63, v61))
    {
      objc_msgSend(v61, sel_doubleValue);
      v60 = v8;

      *(double *)(v62 + 16) = sub_2205BF6C4(v60);
      *(_BYTE *)(v62 + 24) = 0;
    }
    else
    {
      *(_QWORD *)(v62 + 16) = 0;
      *(_BYTE *)(v62 + 24) = 1;
    }
    v59 = sub_2206DAED0();
    log = (os_log_t)*sub_22053C880();
    v9 = log;
    swift_retain();
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = v62;
    *(double *)(v27 + 24) = a5;
    v29 = swift_allocObject();
    *(double *)(v29 + 16) = a2;
    v10 = a1;
    v31 = swift_allocObject();
    *(_QWORD *)(v31 + 16) = a1;
    v33 = swift_allocObject();
    *(double *)(v33 + 16) = a5;
    v35 = swift_allocObject();
    *(double *)(v35 + 16) = a3;
    v37 = swift_allocObject();
    *(double *)(v37 + 16) = a4;
    v106 = 62;
    sub_22045DF24();
    sub_22045DF8C();
    sub_22045DFF4();
    sub_2206DACA8();
    v26 = v107;
    v39 = swift_allocObject();
    *(_BYTE *)(v39 + 16) = 0;
    v40 = swift_allocObject();
    *(_BYTE *)(v40 + 16) = 8;
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = sub_2206BA224;
    *(_QWORD *)(v28 + 24) = v27;
    v41 = swift_allocObject();
    *(_QWORD *)(v41 + 16) = sub_22045F1E8;
    *(_QWORD *)(v41 + 24) = v28;
    v42 = swift_allocObject();
    *(_BYTE *)(v42 + 16) = 0;
    v43 = swift_allocObject();
    *(_BYTE *)(v43 + 16) = 8;
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = sub_220544C1C;
    *(_QWORD *)(v30 + 24) = v29;
    v44 = swift_allocObject();
    *(_QWORD *)(v44 + 16) = sub_22045F1E8;
    *(_QWORD *)(v44 + 24) = v30;
    v45 = swift_allocObject();
    *(_BYTE *)(v45 + 16) = 0;
    v46 = swift_allocObject();
    *(_BYTE *)(v46 + 16) = 8;
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = sub_2206BA2B4;
    *(_QWORD *)(v32 + 24) = v31;
    v47 = swift_allocObject();
    *(_QWORD *)(v47 + 16) = sub_2206BA918;
    *(_QWORD *)(v47 + 24) = v32;
    v48 = swift_allocObject();
    *(_BYTE *)(v48 + 16) = 0;
    v49 = swift_allocObject();
    *(_BYTE *)(v49 + 16) = 8;
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = sub_220544C1C;
    *(_QWORD *)(v34 + 24) = v33;
    v50 = swift_allocObject();
    *(_QWORD *)(v50 + 16) = sub_22045F1E8;
    *(_QWORD *)(v50 + 24) = v34;
    v51 = swift_allocObject();
    *(_BYTE *)(v51 + 16) = 0;
    v52 = swift_allocObject();
    *(_BYTE *)(v52 + 16) = 8;
    v36 = swift_allocObject();
    *(_QWORD *)(v36 + 16) = sub_220544C1C;
    *(_QWORD *)(v36 + 24) = v35;
    v53 = swift_allocObject();
    *(_QWORD *)(v53 + 16) = sub_22045F1E8;
    *(_QWORD *)(v53 + 24) = v36;
    v54 = swift_allocObject();
    *(_BYTE *)(v54 + 16) = 0;
    v55 = swift_allocObject();
    *(_BYTE *)(v55 + 16) = 8;
    v38 = swift_allocObject();
    *(_QWORD *)(v38 + 16) = sub_220544C1C;
    *(_QWORD *)(v38 + 24) = v37;
    v56 = swift_allocObject();
    *(_QWORD *)(v56 + 16) = sub_22045F1E8;
    *(_QWORD *)(v56 + 24) = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DC7F0);
    sub_2206DB260();
    v57 = v11;
    swift_retain();
    *v57 = sub_22045F17C;
    v57[1] = v39;
    swift_retain();
    v57[2] = sub_22045F17C;
    v57[3] = v40;
    swift_retain();
    v57[4] = sub_220545BC4;
    v57[5] = v41;
    swift_retain();
    v57[6] = sub_22045F17C;
    v57[7] = v42;
    swift_retain();
    v57[8] = sub_22045F17C;
    v57[9] = v43;
    swift_retain();
    v57[10] = sub_220545BC4;
    v57[11] = v44;
    swift_retain();
    v57[12] = sub_22045F17C;
    v57[13] = v45;
    swift_retain();
    v57[14] = sub_22045F17C;
    v57[15] = v46;
    swift_retain();
    v57[16] = sub_2206BA960;
    v57[17] = v47;
    swift_retain();
    v57[18] = sub_22045F17C;
    v57[19] = v48;
    swift_retain();
    v57[20] = sub_22045F17C;
    v57[21] = v49;
    swift_retain();
    v57[22] = sub_220545BC4;
    v57[23] = v50;
    swift_retain();
    v57[24] = sub_22045F17C;
    v57[25] = v51;
    swift_retain();
    v57[26] = sub_22045F17C;
    v57[27] = v52;
    swift_retain();
    v57[28] = sub_220545BC4;
    v57[29] = v53;
    swift_retain();
    v57[30] = sub_22045F17C;
    v57[31] = v54;
    swift_retain();
    v57[32] = sub_22045F17C;
    v57[33] = v55;
    swift_retain();
    v57[34] = sub_220545BC4;
    v57[35] = v56;
    sub_22045A844();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(log, v59))
    {
      v23 = (uint8_t *)sub_2206DAFA8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2555DC830);
      v24 = sub_22045E05C(0);
      v25 = sub_22045E05C(0);
      v94[0] = v23;
      v93 = v24;
      v92 = v25;
      sub_22045E0B4(0, v94);
      sub_22045E0B4(6, v94);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v39;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v40;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_220545BC4;
      v91 = v41;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v42;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v43;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_220545BC4;
      v91 = v44;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v45;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v46;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2206BA960;
      v91 = v47;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v48;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v49;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_220545BC4;
      v91 = v50;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v51;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v52;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_220545BC4;
      v91 = v53;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v54;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v91 = v55;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_220545BC4;
      v91 = v56;
      sub_22045E0C8(&v90, (uint64_t)v94, (uint64_t)&v93, (uint64_t)&v92);
      _os_log_impl(&dword_220456000, log, v59, "[getRequestedValue] specified value: %f, currentValue: %f, indent.action: %ld, defaultAdjustment: %f, min: %f, max: %f", v23, v26);
      sub_22045E10C(v24);
      sub_22045E10C(v25);
      sub_2206DAF90();
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
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
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
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }

    v22 = objc_msgSend(a1, sel_action);
    if (v22 == (id)2)
    {
      v98 = a4;
      swift_beginAccess();
      v20 = *(double *)(v62 + 16);
      v21 = *(_BYTE *)(v62 + 24);
      swift_endAccess();
      v95 = v20;
      v96 = v21 & 1;
      if ((v21 & 1) != 0)
        v97 = a5;
      else
        v97 = v95;
      *(double *)&v94[1] = a2 + v97;
      sub_2206DB2B4();
      v19 = v99;
      swift_release();
      return v19;
    }
    else if (v22 == (id)3)
    {
      v104 = a3;
      swift_beginAccess();
      v17 = *(double *)(v62 + 16);
      v18 = *(_BYTE *)(v62 + 24);
      swift_endAccess();
      v101 = v17;
      v102 = v18 & 1;
      if ((v18 & 1) != 0)
        v103 = a5;
      else
        v103 = v101;
      v100 = a2 - v103;
      sub_2206DB2A8();
      v16 = v105;
      swift_release();
      return v16;
    }
    else
    {
      swift_beginAccess();
      v13 = *(_QWORD *)(v62 + 16);
      v14 = *(_BYTE *)(v62 + 24);
      swift_endAccess();
      v15 = sub_2206BA334(v13, v14 & 1);
      swift_release();
      return v15;
    }
  }
  else
  {
    v89 = v82;
    v76 = sub_2206DAEDC();
    oslog = (os_log_t)*sub_22053C880();
    v6 = oslog;
    v69 = swift_allocObject();
    *(_QWORD *)(v69 + 16) = v82;
    v87[1] = (_BYTE *)12;
    sub_22045DF24();
    sub_22045DF8C();
    sub_22045DFF4();
    sub_2206DACA8();
    size = v88;
    v71 = swift_allocObject();
    *(_BYTE *)(v71 + 16) = 0;
    v72 = swift_allocObject();
    *(_BYTE *)(v72 + 16) = 8;
    v70 = swift_allocObject();
    *(_QWORD *)(v70 + 16) = sub_220544C1C;
    *(_QWORD *)(v70 + 24) = v69;
    v73 = swift_allocObject();
    *(_QWORD *)(v73 + 16) = sub_22045F1E8;
    *(_QWORD *)(v73 + 24) = v70;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DC7F0);
    sub_2206DB260();
    v74 = v7;
    swift_retain();
    *v74 = sub_22045F17C;
    v74[1] = v71;
    swift_retain();
    v74[2] = sub_22045F17C;
    v74[3] = v72;
    swift_retain();
    v74[4] = sub_220545BC4;
    v74[5] = v73;
    sub_22045A844();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(oslog, v76))
    {
      buf = (uint8_t *)sub_2206DAFA8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2555DC830);
      v66 = sub_22045E05C(0);
      v67 = sub_22045E05C(0);
      v87[0] = buf;
      v86 = v66;
      v85 = v67;
      sub_22045E0B4(0, v87);
      sub_22045E0B4(1, v87);
      v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v84 = v71;
      sub_22045E0C8(&v83, (uint64_t)v87, (uint64_t)&v86, (uint64_t)&v85);
      v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v84 = v72;
      sub_22045E0C8(&v83, (uint64_t)v87, (uint64_t)&v86, (uint64_t)&v85);
      v83 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_220545BC4;
      v84 = v73;
      sub_22045E0C8(&v83, (uint64_t)v87, (uint64_t)&v86, (uint64_t)&v85);
      _os_log_impl(&dword_220456000, oslog, v76, "[getRequestedValue] use boundedValue: %f", buf, size);
      sub_22045E10C(v66);
      sub_22045E10C(v67);
      sub_2206DAF90();
      swift_release();
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    return v82;
  }
}

id sub_2206B7F4C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v5;
  id v6;
  id v12;

  sub_2204621C0();
  v12 = sub_22045CFB4(3, 0);
  objc_msgSend(v12, sel_setOldValue_, a2);
  objc_msgSend(v12, sel_setUpdatedValue_, a3);
  v5 = a4;
  objc_msgSend(v12, sel_setMinValue_, a4);

  v6 = a5;
  objc_msgSend(v12, sel_setMaxValue_, a5);

  return v12;
}

SiriSettingsIntents::NumericSettingIdentifier_optional sub_2206B8044(void *a1)
{
  id v1;
  unint64_t v2;
  void *v3;
  void *v4;
  Swift::String v7;
  Swift::String v8;

  v1 = a1;
  v2 = sub_2204CB808();
  v7._countAndFlagsBits = SettingIntent.settingIdentifier.getter(v2, (uint64_t)&protocol witness table for INSetNumericSettingIntent);
  v7._object = v3;

  if (v7._object)
  {
    v8 = v7;
  }
  else
  {
    v8._countAndFlagsBits = sub_2206DAC30();
    v8._object = v4;
    sub_220461C68();
  }
  return NumericSettingIdentifier.init(rawValue:)(v8);
}

BOOL sub_2206B8120(void *a1, void *a2)
{
  double v2;
  id v3;
  double v4;
  id v5;
  id v7;
  double v9;
  double v10;
  char v11;
  id v12;
  id v13;
  double v14;
  double v15;
  char v16;
  id v17;
  id v19;
  id v20;
  double v21;
  void *v22;
  void *v23;

  v21 = 0.0;
  v23 = a1;
  v22 = a2;
  v19 = objc_msgSend(a1, sel_numericValue);
  if (v19 && (v17 = objc_msgSend(v19, sel_value), v19, v17))
  {
    objc_msgSend(v17, sel_doubleValue);
    v14 = v2;

    v15 = v14;
    v16 = 0;
  }
  else
  {
    v15 = 0.0;
    v16 = 1;
  }
  if ((v16 & 1) != 0)
    goto LABEL_20;
  v21 = v15;
  v20 = objc_msgSend(a2, sel_maxValue);
  if (v20)
  {
    v12 = v20;
    v3 = v20;
    sub_2204ACB4C(&v20);
    v13 = objc_msgSend(v12, sel_value);

    if (v13)
    {
      objc_msgSend(v13, sel_doubleValue);
      v9 = v4;

      v10 = v9;
      v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    sub_2204ACB4C(&v20);
  }
  v10 = 0.0;
  v11 = 1;
LABEL_15:
  if ((v11 & 1) != 0)
  {
LABEL_20:
    sub_2206DAEDC();
    v7 = (id)*sub_22053C880();
    v5 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    return 0;
  }
  return v10 < v15;
}

BOOL sub_2206B842C(void *a1, void *a2)
{
  double v2;
  id v3;
  double v4;
  id v5;
  id v7;
  double v9;
  double v10;
  char v11;
  id v12;
  id v13;
  double v14;
  double v15;
  char v16;
  id v17;
  id v19;
  id v20;
  double v21;
  void *v22;
  void *v23;

  v21 = 0.0;
  v23 = a1;
  v22 = a2;
  v19 = objc_msgSend(a1, sel_numericValue);
  if (v19 && (v17 = objc_msgSend(v19, sel_value), v19, v17))
  {
    objc_msgSend(v17, sel_doubleValue);
    v14 = v2;

    v15 = v14;
    v16 = 0;
  }
  else
  {
    v15 = 0.0;
    v16 = 1;
  }
  if ((v16 & 1) != 0)
    goto LABEL_20;
  v21 = v15;
  v20 = objc_msgSend(a2, sel_minValue);
  if (v20)
  {
    v12 = v20;
    v3 = v20;
    sub_2204ACB4C(&v20);
    v13 = objc_msgSend(v12, sel_value);

    if (v13)
    {
      objc_msgSend(v13, sel_doubleValue);
      v9 = v4;

      v10 = v9;
      v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    sub_2204ACB4C(&v20);
  }
  v10 = 0.0;
  v11 = 1;
LABEL_15:
  if ((v11 & 1) != 0)
  {
LABEL_20:
    sub_2206DAEDC();
    v7 = (id)*sub_22053C880();
    v5 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    return 0;
  }
  return v15 < v10;
}

uint64_t sub_2206B8738(void (*a1)(void), uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
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
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  _QWORD *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t result;
  id v64;
  id v65;
  uint64_t *v66;
  id v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  id v84;
  id v85;
  id v86;
  uint64_t v87;
  double v88;
  id v89;
  id v90;
  uint64_t v91;
  double v92;
  id v93;
  double v94;
  _DWORD *v95;
  int v96;
  double v97;
  id v98;
  double v99;
  _DWORD *v100;
  int v101;
  void (*v102)(char *, uint64_t);
  double v103;
  id v104;
  double v105;
  _DWORD *v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  void (*v112)(char *, uint64_t, uint64_t);
  double v113;
  void (*v114)(char *, char *, uint64_t);
  uint64_t (*v115)(char *, uint64_t);
  _DWORD *v116;
  int v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint8_t *v132;
  uint64_t v133;
  uint64_t v134;
  _BYTE **v135;
  uint64_t *v136;
  uint64_t *v137;
  void *v138;
  void *v139;
  const char *v140;
  void (*v141)(void);
  uint64_t v142;
  uint64_t v143;
  double v144;
  double v145;
  uint64_t v146;
  void (*v147)(void);
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  char *v152;
  unint64_t v153;
  char *v154;
  unint64_t v155;
  char *v156;
  unint64_t v157;
  char *v158;
  unint64_t v159;
  char *v160;
  unint64_t v161;
  char *v162;
  unint64_t v163;
  char *v164;
  unint64_t v165;
  char *v166;
  double v167;
  uint64_t v168;
  double v169;
  unint64_t v170;
  unint64_t v171;
  uint64_t *v172;
  uint32_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  int v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  _QWORD *v189;
  uint64_t v190;
  os_log_t v191;
  int v192;
  uint64_t (*v193)(uint64_t, uint64_t, uint64_t);
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  _BYTE *v197;
  id v198;
  id v199;
  double v200;
  double v201;
  double v202;
  double v203;
  uint64_t v204;
  uint32_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  double v214;

  v167 = a6;
  v169 = a7;
  v147 = a1;
  v146 = a2;
  v141 = a3;
  v142 = a4;
  v143 = a5;
  v144 = a8;
  v145 = a9;
  v140 = "[handleNumericSettingIntent] Failed to execute set value callback.";
  v214 = 0.0;
  v213 = 0;
  v211 = 0;
  v212 = 0;
  v209 = 0;
  v210 = 0;
  v208 = 0;
  v207 = 0;
  v206 = 0;
  v199 = 0;
  v148 = sub_2206DB230();
  v149 = *(_QWORD *)(v148 - 8);
  v150 = *(_QWORD *)(v149 + 64);
  v151 = (v150 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v147);
  v152 = (char *)&v76 - v151;
  v153 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v10);
  v154 = (char *)&v76 - v153;
  v155 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v12);
  v156 = (char *)&v76 - v155;
  v157 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v14);
  v158 = (char *)&v76 - v157;
  v159 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v16);
  v160 = (char *)&v76 - v159;
  v161 = (v17 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v18);
  v162 = (char *)&v76 - v161;
  v163 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v20);
  v164 = (char *)&v76 - v163;
  v165 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  v23 = MEMORY[0x24BDAC7A8](v22);
  v166 = (char *)&v76 - v165;
  v214 = v23;
  v213 = v24;
  v211 = v25;
  v212 = v26;
  v209 = v27;
  v210 = v28;
  v208 = v29;
  v207 = v30;
  v206 = v31;
  v192 = sub_2206DAED0();
  v191 = (os_log_t)*sub_22053C880();
  v32 = v191;
  v168 = 24;
  v179 = 7;
  v174 = swift_allocObject();
  *(double *)(v174 + 16) = v167;
  v180 = swift_allocObject();
  *(double *)(v180 + 16) = v169;
  v172 = &v204;
  v204 = 22;
  v170 = sub_22045DF24();
  v171 = sub_22045DF8C();
  sub_22045DFF4();
  sub_2206DACA8();
  v173 = v205;
  v176 = 17;
  v182 = swift_allocObject();
  *(_BYTE *)(v182 + 16) = 0;
  v183 = swift_allocObject();
  v177 = 8;
  *(_BYTE *)(v183 + 16) = 8;
  v178 = 32;
  v33 = swift_allocObject();
  v34 = v174;
  v175 = v33;
  *(_QWORD *)(v33 + 16) = sub_220544C1C;
  *(_QWORD *)(v33 + 24) = v34;
  v35 = swift_allocObject();
  v36 = v175;
  v184 = v35;
  *(_QWORD *)(v35 + 16) = sub_22045F1E8;
  *(_QWORD *)(v35 + 24) = v36;
  v185 = swift_allocObject();
  *(_BYTE *)(v185 + 16) = 0;
  v186 = swift_allocObject();
  *(_BYTE *)(v186 + 16) = v177;
  v37 = swift_allocObject();
  v38 = v180;
  v181 = v37;
  *(_QWORD *)(v37 + 16) = sub_220544C1C;
  *(_QWORD *)(v37 + 24) = v38;
  v39 = swift_allocObject();
  v40 = v181;
  v188 = v39;
  *(_QWORD *)(v39 + 16) = sub_22045F1E8;
  *(_QWORD *)(v39 + 24) = v40;
  v190 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DC7F0);
  v187 = sub_2206DB260();
  v189 = v41;
  swift_retain();
  v42 = v182;
  v43 = v189;
  *v189 = sub_22045F17C;
  v43[1] = v42;
  swift_retain();
  v44 = v183;
  v45 = v189;
  v189[2] = sub_22045F17C;
  v45[3] = v44;
  swift_retain();
  v46 = v184;
  v47 = v189;
  v189[4] = sub_220545BC4;
  v47[5] = v46;
  swift_retain();
  v48 = v185;
  v49 = v189;
  v189[6] = sub_22045F17C;
  v49[7] = v48;
  swift_retain();
  v50 = v186;
  v51 = v189;
  v189[8] = sub_22045F17C;
  v51[9] = v50;
  swift_retain();
  v52 = v188;
  v53 = v189;
  v189[10] = sub_220545BC4;
  v53[11] = v52;
  sub_22045A844();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v191, (os_log_type_t)v192))
  {
    v132 = (uint8_t *)sub_2206DAFA8();
    v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DC830);
    v131 = 0;
    v133 = sub_22045E05C(0);
    v134 = sub_22045E05C(v131);
    v135 = &v197;
    v197 = v132;
    v136 = &v196;
    v196 = v133;
    v137 = &v195;
    v195 = v134;
    sub_22045E0B4(0, &v197);
    sub_22045E0B4(2, v135);
    v54 = v139;
    v193 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
    v194 = v182;
    sub_22045E0C8(&v193, (uint64_t)v135, (uint64_t)v136, (uint64_t)v137);
    v138 = v54;
    if (v54)
    {
      __break(1u);
    }
    else
    {
      v193 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v194 = v183;
      sub_22045E0C8(&v193, (uint64_t)&v197, (uint64_t)&v196, (uint64_t)&v195);
      v128 = 0;
      v55 = v128;
      v193 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_220545BC4;
      v194 = v184;
      sub_22045E0C8(&v193, (uint64_t)&v197, (uint64_t)&v196, (uint64_t)&v195);
      v127 = v55;
      v193 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v194 = v185;
      sub_22045E0C8(&v193, (uint64_t)&v197, (uint64_t)&v196, (uint64_t)&v195);
      v126 = 0;
      v193 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22045F17C;
      v194 = v186;
      sub_22045E0C8(&v193, (uint64_t)&v197, (uint64_t)&v196, (uint64_t)&v195);
      v125 = 0;
      v193 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_220545BC4;
      v194 = v188;
      sub_22045E0C8(&v193, (uint64_t)&v197, (uint64_t)&v196, (uint64_t)&v195);
      v124 = 0;
      _os_log_impl(&dword_220456000, v191, (os_log_type_t)v192, "[handleNumericSettingIntent] Requested value: %f, current value: %f", v132, v173);
      v123 = 0;
      sub_22045E10C(v133);
      sub_22045E10C(v134);
      sub_2206DAF90();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v129 = v124;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v129 = v139;
  }
  v122 = v129;

  if (v167 == v169)
  {
    v118 = (uint64_t)v122;
    goto LABEL_14;
  }
  swift_retain();
  sub_2204ACAE8();
  v56 = sub_2205ABF88();
  v57 = v122;
  v119 = v56;
  v147();
  v120 = (uint64_t)v57;
  v121 = v57;
  if (!v57)
  {

    swift_release();
    v118 = v120;
LABEL_14:
    v108 = v118;
    swift_retain();
    v109 = 0;
    v110 = sub_220545F80();
    v111 = sub_2204ACAE8();
    v113 = sub_2205BF5D0(v169);
    v116 = (_DWORD *)MEMORY[0x24BEE38D0];
    v58 = *MEMORY[0x24BEE38D0];
    v112 = *(void (**)(char *, uint64_t, uint64_t))(v149 + 104);
    v112(v166, v58, v148);
    v203 = v113;
    v114 = *(void (**)(char *, char *, uint64_t))(v149 + 16);
    v114(v164, v166, v148);
    v115 = *(uint64_t (**)(char *, uint64_t))(v149 + 88);
    v117 = v115(v164, v148);
    if (v117 == *v116)
    {
      v203 = round(v113);
      goto LABEL_28;
    }
    if (v117 == *MEMORY[0x24BEE38C8])
    {
      v203 = rint(v113);
      goto LABEL_28;
    }
    if (v117 == *MEMORY[0x24BEE38E0])
      goto LABEL_25;
    if (v117 == *MEMORY[0x24BEE38E8])
      goto LABEL_27;
    if (v117 == *MEMORY[0x24BEE38B8])
    {
      v203 = trunc(v113);
      goto LABEL_28;
    }
    if (v117 != *MEMORY[0x24BEE38C0])
    {
      sub_2206DADBC();
      (*(void (**)(char *, uint64_t))(v149 + 8))(v164, v148);
      goto LABEL_28;
    }
    if ((sub_2206DADC8() & 1) != 0)
LABEL_27:
      v203 = floor(v113);
    else
LABEL_25:
      v203 = ceil(v113);
LABEL_28:
    v103 = v203;
    v102 = *(void (**)(char *, uint64_t))(v149 + 8);
    v102(v166, v148);
    v59 = sub_2205ABF88();
    v104 = sub_2205ABFC4(v59);
    v105 = sub_2205BF5D0(v167);
    v106 = (_DWORD *)MEMORY[0x24BEE38D0];
    v112(v162, *MEMORY[0x24BEE38D0], v148);
    v202 = v105;
    v114(v160, v162, v148);
    v107 = v115(v160, v148);
    if (v107 != *v106)
    {
      if (v107 == *MEMORY[0x24BEE38C8])
      {
        v202 = rint(v105);
        goto LABEL_43;
      }
      if (v107 == *MEMORY[0x24BEE38E0])
        goto LABEL_40;
      if (v107 != *MEMORY[0x24BEE38E8])
      {
        if (v107 == *MEMORY[0x24BEE38B8])
        {
          v202 = trunc(v105);
          goto LABEL_43;
        }
        if (v107 != *MEMORY[0x24BEE38C0])
        {
          sub_2206DADBC();
          v102(v160, v148);
LABEL_43:
          v97 = v202;
          v102(v162, v148);
          v60 = sub_2205ABF88();
          v98 = sub_2205ABFC4(v60);
          v99 = sub_2205BF5D0(v144);
          v100 = (_DWORD *)MEMORY[0x24BEE38D0];
          v112(v158, *MEMORY[0x24BEE38D0], v148);
          v201 = v99;
          v114(v156, v158, v148);
          v101 = v115(v156, v148);
          if (v101 == *v100)
          {
            v201 = round(v99);
            goto LABEL_58;
          }
          if (v101 == *MEMORY[0x24BEE38C8])
          {
            v201 = rint(v99);
            goto LABEL_58;
          }
          if (v101 == *MEMORY[0x24BEE38E0])
            goto LABEL_55;
          if (v101 == *MEMORY[0x24BEE38E8])
            goto LABEL_57;
          if (v101 == *MEMORY[0x24BEE38B8])
          {
            v201 = trunc(v99);
            goto LABEL_58;
          }
          if (v101 != *MEMORY[0x24BEE38C0])
          {
            sub_2206DADBC();
            v102(v156, v148);
            goto LABEL_58;
          }
          if ((sub_2206DADC8() & 1) != 0)
LABEL_57:
            v201 = floor(v99);
          else
LABEL_55:
            v201 = ceil(v99);
LABEL_58:
          v92 = v201;
          v102(v158, v148);
          v61 = sub_2205ABF88();
          v93 = sub_2205ABFC4(v61);
          v94 = sub_2205BF5D0(v145);
          v95 = (_DWORD *)MEMORY[0x24BEE38D0];
          v112(v154, *MEMORY[0x24BEE38D0], v148);
          v200 = v94;
          v114(v152, v154, v148);
          v96 = v115(v152, v148);
          if (v96 != *v95)
          {
            if (v96 == *MEMORY[0x24BEE38C8])
            {
              v200 = rint(v94);
              goto LABEL_73;
            }
            if (v96 == *MEMORY[0x24BEE38E0])
              goto LABEL_70;
            if (v96 != *MEMORY[0x24BEE38E8])
            {
              if (v96 == *MEMORY[0x24BEE38B8])
              {
                v200 = trunc(v94);
                goto LABEL_73;
              }
              if (v96 != *MEMORY[0x24BEE38C0])
              {
                sub_2206DADBC();
                v102(v152, v148);
LABEL_73:
                v88 = v200;
                v102(v154, v148);
                v62 = sub_2205ABF88();
                v89 = sub_2205ABFC4(v62);
                v90 = sub_2206B7F4C(0, (uint64_t)v104, (uint64_t)v98, v93, v89);

                ((void (*)(id))v141)(v90);
                swift_release();
                result = v108;
                v91 = v108;
                return result;
              }
              if ((sub_2206DADC8() & 1) == 0)
              {
LABEL_70:
                v200 = ceil(v94);
                goto LABEL_73;
              }
            }
            v200 = floor(v94);
            goto LABEL_73;
          }
          v200 = round(v94);
          goto LABEL_73;
        }
        if ((sub_2206DADC8() & 1) == 0)
        {
LABEL_40:
          v202 = ceil(v105);
          goto LABEL_43;
        }
      }
      v202 = floor(v105);
      goto LABEL_43;
    }
    v202 = round(v105);
    goto LABEL_43;
  }
  v86 = v121;
  v87 = 0;

  swift_release();
  v64 = v86;
  v199 = v86;
  v82 = sub_2206DAEDC();
  v84 = (id)*sub_22053C880();
  v65 = v84;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  v81 = sub_2206DB260();
  v79 = v66;
  v67 = v86;
  v76 = &v198;
  v198 = v86;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD288);
  v77 = sub_2206DABD0();
  v78 = v68;
  v79[3] = MEMORY[0x24BEE0D00];
  v69 = sub_220464CA0();
  v70 = v77;
  v71 = v78;
  v72 = v79;
  v73 = v69;
  v74 = v81;
  v79[4] = v73;
  *v72 = v70;
  v72[1] = v71;
  sub_22045A844();
  v83 = v74;
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  v75 = sub_220525344();
  v85 = sub_2206B671C(0, v75);
  v141();

  swift_release();
  return v87;
}

uint64_t sub_2206BA0E4()
{
  uint64_t v0;

  return sub_2206B8738(*(void (**)(void))(v0 + 32), *(_QWORD *)(v0 + 40), *(void (**)(void))(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(double *)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 72), *(double *)(v0 + 80));
}

uint64_t sub_2206BA128()
{
  return swift_deallocObject();
}

double sub_2206BA150(uint64_t a1, double a2)
{
  double v5;
  char v6;

  swift_beginAccess();
  v5 = *(double *)(a1 + 16);
  v6 = *(_BYTE *)(a1 + 24);
  swift_endAccess();
  if ((v6 & 1) != 0)
    return a2;
  else
    return v5;
}

uint64_t sub_2206BA1E8()
{
  swift_release();
  return swift_deallocObject();
}

double sub_2206BA224()
{
  uint64_t v0;

  return sub_2206BA150(*(_QWORD *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_2206BA230()
{
  return swift_deallocObject();
}

void sub_2206BA258(void *a1)
{
  objc_msgSend(a1, sel_action);
  sub_22045D030();
}

uint64_t sub_2206BA278()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2206BA2B4()
{
  uint64_t v0;

  sub_2206BA258(*(void **)(v0 + 16));
}

uint64_t sub_2206BA2BC()
{
  return swift_deallocObject();
}

uint64_t sub_2206BA2E4()
{
  return swift_deallocObject();
}

uint64_t sub_2206BA30C()
{
  return swift_deallocObject();
}

uint64_t sub_2206BA334(uint64_t a1, char a2)
{
  uint64_t v4;

  if ((a2 & 1) != 0)
    return a1;
  sub_2206DB2B4();
  sub_2206DB2A8();
  return v4;
}

uint64_t sub_2206BA440()
{
  return swift_deallocObject();
}

uint64_t sub_2206BA468()
{
  return swift_deallocObject();
}

uint64_t sub_2206BA490(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v15 = a1;
  v18 = a6;
  v13[1] = a7;
  v22 = a6;
  v16 = *(_QWORD *)(a6 - 8);
  v13[0] = (*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x24BDAC7A8](a1);
  v17 = (uint64_t)v13 - v13[0];
  v8(v7);
  v14 = sub_2206DB110() >> 3;
  v20 = *v15;
  v21 = v20 + v14;
  sub_2206BA5D0(v17, sub_2206BAD1C, (uint64_t)v19, v18, MEMORY[0x24BEE4078], MEMORY[0x24BEE4AE0] + 8, MEMORY[0x24BEE40A8], v13[2]);
  v9 = v16;
  v10 = v17;
  v11 = v18;
  *v15 += v14;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t sub_2206BA5AC()
{
  return sub_2206DAFC0();
}

uint64_t sub_2206BA5D0(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t (*v17)(void);
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v17 = a2;
  v13 = a5;
  v14 = a8;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  v15 = *(_QWORD *)(a5 - 8);
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v12 - v16;
  v20 = v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64);
  result = v17();
  v19 = v8;
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v14, v18, v13);
  return result;
}

uint64_t sub_2206BA6B4()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_2206BA6F0(_QWORD *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  _QWORD *result;
  uint64_t v5;

  a4();
  v5 = *a1;
  sub_2206DAFC0();
  result = a1;
  *a1 = v5 + 8;
  return result;
}

uint64_t sub_2206BA754()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BA790()
{
  return swift_deallocObject();
}

uint64_t sub_2206BA7B8()
{
  return swift_deallocObject();
}

uint64_t sub_2206BA7E0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BA81C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BA858()
{
  return swift_deallocObject();
}

uint64_t sub_2206BA880()
{
  return swift_deallocObject();
}

uint64_t sub_2206BA8A8@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_2206BA8DC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BA918@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_2206BA8A8(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_2206BA924()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BA960(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = sub_22059E000();
  return sub_2206BA490(a1, a2, a3, v8, v9, MEMORY[0x24BEE1768], v4);
}

uint64_t sub_2206BA9C0()
{
  return swift_deallocObject();
}

uint64_t sub_2206BA9E8()
{
  return swift_deallocObject();
}

uint64_t sub_2206BAA10()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BAA4C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BAA88()
{
  return swift_deallocObject();
}

uint64_t sub_2206BAAB0()
{
  return swift_deallocObject();
}

uint64_t sub_2206BAAD8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BAB14()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BAB50()
{
  return swift_deallocObject();
}

uint64_t sub_2206BAB78()
{
  return swift_deallocObject();
}

uint64_t sub_2206BABA0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BABDC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BAC18()
{
  return swift_deallocObject();
}

uint64_t sub_2206BAC40()
{
  return swift_deallocObject();
}

uint64_t sub_2206BAC68()
{
  return swift_deallocObject();
}

uint64_t sub_2206BAC90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BACCC()
{
  swift_release();
  return swift_deallocObject();
}

void *type metadata accessor for SetNumericIntentHandlerUtil()
{
  return &unk_24E64C378;
}

uint64_t sub_2206BAD1C()
{
  return sub_2206BA5AC();
}

uint64_t sub_2206BAD48()
{
  return swift_deallocObject();
}

uint64_t sub_2206BAD70()
{
  return swift_deallocObject();
}

uint64_t sub_2206BAD98()
{
  return swift_deallocObject();
}

uint64_t sub_2206BADC0()
{
  return swift_deallocObject();
}

uint64_t sub_2206BADE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BAE24()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BAE60()
{
  return swift_deallocObject();
}

uint64_t sub_2206BAE88()
{
  return swift_deallocObject();
}

uint64_t sub_2206BAEB0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BAEEC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206BAF28()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetAXColorFiltersGrayscaleHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE408 = result;
  return result;
}

uint64_t type metadata accessor for SetAXColorFiltersGrayscaleHandler()
{
  return objc_opt_self();
}

uint64_t *sub_2206BAF88()
{
  if (qword_2555DC698 != -1)
    swift_once();
  return &qword_2555FE408;
}

uint64_t sub_2206BAFDC(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  uint64_t *v4;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;

  sub_2206DAED0();
  v6 = (id)*sub_22053C880();
  v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  v8 = sub_2204B4DE8();
  swift_release();
  v4 = sub_220534C5C();
  v10 = *v4;
  v11 = v4[1];
  v12 = *((unsigned __int8 *)v4 + 16);
  v13 = *(_BYTE *)(v7 + 24);
  swift_retain();
  sub_220524C7C(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_2206BB1D8, v7, 0, 1, 0, 0);
  return sub_2204614E0((uint64_t)sub_2206BB1D8);
}

uint64_t sub_2206BB16C()
{
  swift_retain();
  sub_2204B4E18();
  return swift_release();
}

uint64_t sub_2206BB1D8()
{
  return sub_2206BB16C();
}

uint64_t sub_2206BB1FC(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_2206BAFDC(a1, a2, a3);
}

uint64_t sub_2206BB21C()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetAXIncreaseContrastHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE410 = result;
  return result;
}

uint64_t type metadata accessor for SetAXIncreaseContrastHandler()
{
  return objc_opt_self();
}

uint64_t *sub_2206BB27C()
{
  if (qword_2555DC6A0 != -1)
    swift_once();
  return &qword_2555FE410;
}

uint64_t sub_2206BB2D0(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  uint64_t *v4;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;

  sub_2206DAED0();
  v6 = (id)*sub_22053C880();
  v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  v8 = sub_2204B4B40();
  swift_release();
  v4 = sub_220534F98();
  v10 = *v4;
  v11 = v4[1];
  v12 = *((unsigned __int8 *)v4 + 16);
  v13 = *(_BYTE *)(v7 + 24);
  swift_retain();
  sub_220524C7C(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_2206BB4CC, v7, 0, 1, 0, 0);
  return sub_2204614E0((uint64_t)sub_2206BB4CC);
}

uint64_t sub_2206BB460()
{
  swift_retain();
  sub_2204B4B70();
  return swift_release();
}

uint64_t sub_2206BB4CC()
{
  return sub_2206BB460();
}

uint64_t sub_2206BB4F0(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_2206BB2D0(a1, a2, a3);
}

uint64_t sub_2206BB510()
{
  uint64_t v0;
  uint64_t v3;
  char v4;

  sub_2206DB260();
  *(_QWORD *)v0 = "SetLabeledSettingIntent#ConnectToWifi";
  *(_QWORD *)(v0 + 8) = 37;
  *(_BYTE *)(v0 + 16) = 2;
  *(_QWORD *)(v0 + 24) = "SetLabeledSettingIntent#EnvironmentErrors";
  *(_QWORD *)(v0 + 32) = 41;
  *(_BYTE *)(v0 + 40) = 2;
  sub_22045A844();
  v3 = sub_2206DB14C();
  swift_bridgeObjectRelease();
  if (!v3)
  {
    v4 = 0;
LABEL_6:
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  if (v3 == 1)
  {
    v4 = 1;
    goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t sub_2206BB644()
{
  return sub_2206DAC30();
}

uint64_t sub_2206BB6CC()
{
  sub_2206BB714();
  return sub_2206DB284() & 1;
}

unint64_t sub_2206BB714()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E92B0;
  if (!qword_2555E92B0)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA964, &unk_24E64C5F8);
    atomic_store(v0, (unint64_t *)&qword_2555E92B0);
    return v0;
  }
  return v2;
}

uint64_t sub_2206BB780()
{
  sub_2206BB714();
  return sub_2206DACB4();
}

uint64_t sub_2206BB7BC()
{
  sub_2206BB714();
  return sub_2206DACCC();
}

uint64_t sub_2206BB800()
{
  sub_2206BB714();
  return sub_2206DACC0();
}

uint64_t sub_2206BB844@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2206BB510();
  *a1 = result;
  return result;
}

uint64_t sub_2206BB878@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  result = sub_2206BB644();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_2206BB8AC()
{
  uint64_t v0;
  _QWORD *v1;

  v1[4] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  return swift_task_switch();
}

uint64_t sub_2206BB8E0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v0[2] = v0;
  v8 = sub_2206DAC30();
  v5 = v1;
  v0[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v6 = sub_2206DB0B0();
  v0[6] = v6;
  v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92A08] + (int)*MEMORY[0x24BE92A08]);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 56) = v2;
  *v2 = *(_QWORD *)(v4 + 16);
  v2[1] = sub_2204DC6DC;
  return v7(v8, v5, v6);
}

uint64_t sub_2206BB9DC()
{
  sub_2206BBA24();
  return sub_2206DB284() & 1;
}

unint64_t sub_2206BBA24()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E92C0[0];
  if (!qword_2555E92C0[0])
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA92C, &unk_24E64C688);
    atomic_store(v0, qword_2555E92C0);
    return v0;
  }
  return v2;
}

uint64_t sub_2206BBA90()
{
  sub_2206BBA24();
  return sub_2206DACB4();
}

uint64_t sub_2206BBACC()
{
  sub_2206BBA24();
  return sub_2206DACCC();
}

uint64_t sub_2206BBB10()
{
  sub_2206BBA24();
  return sub_2206DACC0();
}

uint64_t sub_2206BBB54()
{
  uint64_t v0;
  _QWORD *v1;

  v1[4] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = v0;
  return swift_task_switch();
}

uint64_t sub_2206BBB88()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  unint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, void *, unint64_t);
  uint64_t v9;

  v0[2] = v0;
  v9 = sub_2206DAC30();
  v6 = v1;
  v0[5] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v7 = sub_2206DB0B0();
  v0[6] = v7;
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x24BE929F8]
                                                                                   + (int)*MEMORY[0x24BE929F8]);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 56) = v2;
  v3 = sub_2206BBA24();
  *v2 = *(_QWORD *)(v5 + 16);
  v2[1] = sub_2204DC6DC;
  return v8(v9, v6, v7, &unk_24E64C688, v3);
}

uint64_t sub_2206BBC9C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[6] = v1;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
  v2[7] = swift_task_alloc();
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t sub_2206BBD40()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v5;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  const void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v15 = (void *)v0[7];
  v14 = (const void *)v0[5];
  v0[2] = v0;
  v11 = sub_2206DAC30();
  v12 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v13 = v2;
  *v2 = sub_2206DAC30();
  v13[1] = v3;
  sub_2204A395C(v14, v15);
  v16 = sub_2206DA870();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v17 + 48))(v15, 1) == 1)
  {
    sub_2204A2148(v10[7]);
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = 0;
    v13[5] = 0;
  }
  else
  {
    v9 = v10[7];
    v13[5] = v16;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13 + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 32))(boxed_opaque_existential_1, v9, v16);
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v7 = sub_2206DB0B0();
  v10[9] = v7;
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92A08] + (int)*MEMORY[0x24BE92A08]);
  v5 = (_QWORD *)swift_task_alloc();
  v10[10] = v5;
  *v5 = v10[2];
  v5[1] = sub_220563494;
  return v8(v11, v12, v7);
}

uint64_t sub_2206BBF64()
{
  uint64_t v0;
  uint64_t v3;
  unsigned __int8 v4;

  sub_2206DB260();
  *(_QWORD *)v0 = "Status";
  *(_QWORD *)(v0 + 8) = 6;
  *(_BYTE *)(v0 + 16) = 2;
  *(_QWORD *)(v0 + 24) = "dialog1";
  *(_QWORD *)(v0 + 32) = 7;
  *(_BYTE *)(v0 + 40) = 2;
  *(_QWORD *)(v0 + 48) = "dialog2";
  *(_QWORD *)(v0 + 56) = 7;
  *(_BYTE *)(v0 + 64) = 2;
  sub_22045A844();
  v3 = sub_2206DB14C();
  swift_bridgeObjectRelease();
  switch(v3)
  {
    case 0:
      v4 = 0;
LABEL_8:
      swift_bridgeObjectRelease();
      return v4;
    case 1:
      v4 = 1;
      goto LABEL_8;
    case 2:
      v4 = 2;
      goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  return 3;
}

uint64_t sub_2206BC0D8()
{
  return sub_2206DAC30();
}

uint64_t sub_2206BC1A8()
{
  sub_2206BC1F0();
  return sub_2206DB284() & 1;
}

unint64_t sub_2206BC1F0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E92D8;
  if (!qword_2555E92D8)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA8F4, &unk_24E64C718);
    atomic_store(v0, (unint64_t *)&qword_2555E92D8);
    return v0;
  }
  return v2;
}

uint64_t sub_2206BC25C()
{
  sub_2206BC1F0();
  return sub_2206DACB4();
}

uint64_t sub_2206BC298()
{
  sub_2206BC1F0();
  return sub_2206DACCC();
}

uint64_t sub_2206BC2DC()
{
  sub_2206BC1F0();
  return sub_2206DACC0();
}

uint64_t sub_2206BC320@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2206BBF64();
  *a1 = result;
  return result;
}

uint64_t sub_2206BC354@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v2;

  result = sub_2206BC0D8();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_2206BC384(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[6] = v1;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
  v2[7] = swift_task_alloc();
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t sub_2206BC428()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, void *, unint64_t);
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  const void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v16 = (void *)v0[7];
  v15 = (const void *)v0[5];
  v0[2] = v0;
  v12 = sub_2206DAC30();
  v13 = v1;
  v0[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v14 = v2;
  *v2 = sub_2206DAC30();
  v14[1] = v3;
  sub_2204A395C(v15, v16);
  v17 = sub_2206DA870();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v18 + 48))(v16, 1) == 1)
  {
    sub_2204A2148(v11[7]);
    v14[2] = 0;
    v14[3] = 0;
    v14[4] = 0;
    v14[5] = 0;
  }
  else
  {
    v10 = v11[7];
    v14[5] = v17;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14 + 2);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v18 + 32))(boxed_opaque_existential_1, v10, v17);
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  v8 = sub_2206DB0B0();
  v11[9] = v8;
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void *, unint64_t))(MEMORY[0x24BE929F8]
                                                                                   + (int)*MEMORY[0x24BE929F8]);
  v5 = (_QWORD *)swift_task_alloc();
  v11[10] = v5;
  v6 = sub_2206BC1F0();
  *v5 = v11[2];
  v5[1] = sub_220563494;
  return v9(v12, v13, v8, &unk_24E64C718, v6);
}

uint64_t type metadata accessor for SetLabeledSettingIntentCATsSimple()
{
  uint64_t v1;

  v1 = qword_2555E92E8;
  if (!qword_2555E92E8)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_2206BC6C8()
{
  uint64_t inited;

  inited = swift_initClassMetadata2();
  if (!inited)
    return 0;
  return inited;
}

uint64_t sub_2206BC738()
{
  return type metadata accessor for SetLabeledSettingIntentCATsSimple();
}

void *type metadata accessor for SetLabeledSettingIntentCATsSimple.Properties()
{
  return &unk_24E64C5F8;
}

void *type metadata accessor for SetLabeledSettingIntentCATsSimple.ConnectToWifiDialogIds()
{
  return &unk_24E64C688;
}

void *type metadata accessor for SetLabeledSettingIntentCATsSimple.EnvironmentErrorsDialogIds()
{
  return &unk_24E64C718;
}

unint64_t sub_2206BC78C()
{
  return sub_2206BC7A0();
}

unint64_t sub_2206BC7A0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9338;
  if (!qword_2555E9338)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA7FC, &unk_24E64C718);
    atomic_store(v0, (unint64_t *)&qword_2555E9338);
    return v0;
  }
  return v2;
}

unint64_t sub_2206BC80C()
{
  return sub_2206BC820();
}

unint64_t sub_2206BC820()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9340;
  if (!qword_2555E9340)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA864, &unk_24E64C688);
    atomic_store(v0, (unint64_t *)&qword_2555E9340);
    return v0;
  }
  return v2;
}

unint64_t sub_2206BC88C()
{
  return sub_2206BC8A0();
}

unint64_t sub_2206BC8A0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9348;
  if (!qword_2555E9348)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EA8CC, &unk_24E64C5F8);
    atomic_store(v0, (unint64_t *)&qword_2555E9348);
    return v0;
  }
  return v2;
}

uint64_t sub_2206BC90C()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetAssistiveTouchHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE428 = result;
  return result;
}

uint64_t type metadata accessor for SetAssistiveTouchHandler()
{
  return objc_opt_self();
}

uint64_t *sub_2206BC96C()
{
  if (qword_2555DC6A8 != -1)
    swift_once();
  return &qword_2555FE428;
}

uint64_t sub_2206BC9C0(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  uint64_t *v4;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;

  sub_2206DAED0();
  v6 = (id)*sub_22053C880();
  v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  v8 = sub_2204AE918();
  swift_release();
  v4 = sub_2205348CC();
  v10 = *v4;
  v11 = v4[1];
  v12 = *((unsigned __int8 *)v4 + 16);
  v13 = *(_BYTE *)(v7 + 24);
  swift_retain();
  sub_220524C7C(v8, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_2206BCBBC, v7, 0, 1, 0, 0);
  return sub_2204614E0((uint64_t)sub_2206BCBBC);
}

uint64_t sub_2206BCB50(char a1)
{
  swift_retain();
  sub_2204AE948(a1 & 1);
  return swift_release();
}

uint64_t sub_2206BCBBC(char a1)
{
  return sub_2206BCB50(a1 & 1);
}

uint64_t sub_2206BCBE0(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_2206BC9C0(a1, a2, a3);
}

uint64_t sub_2206BCC00(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return sub_2206BD090(a1, a2);
}

uint64_t sub_2206BCC50(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;

  v20 = a1;
  v15 = a2;
  v19 = a3;
  v27 = 0;
  v26 = 0;
  v25 = 0;
  v24 = 0;
  v8 = 0;
  v21 = sub_2206DA870();
  v18 = *(_QWORD **)(v21 - 8);
  v10 = v18[8];
  v9 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](0);
  v13 = (uint64_t)&v8 - v9;
  v11 = v9;
  MEMORY[0x24BDAC7A8](v3);
  v14 = (uint64_t)&v8 - v11;
  v27 = v4;
  v26 = v5 & 1;
  v25 = v6;
  type metadata accessor for SettingsBinarySetting.Builder();
  v12 = (void (*)(uint64_t, uint64_t, uint64_t))v18[2];
  v12(v14, v20, v21);
  v12(v13, v19, v21);
  v16 = sub_2206BCC00(v14, v13);
  v17 = sub_2206BD25C(v15 & 1);
  swift_release();
  v24 = v17;
  swift_retain();
  v23 = sub_2206BD344(v17);
  swift_retain();
  v28 = v23;
  swift_release();
  v22 = (void (*)(uint64_t, uint64_t))v18[1];
  v22(v19, v21);
  v22(v20, v21);
  swift_release();
  return v23;
}

uint64_t sub_2206BCE0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name;
  swift_beginAccess();
  v2 = sub_2206DA870();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v4);
  return swift_endAccess();
}

uint64_t sub_2206BCE78(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v10 = a1;
  v11 = sub_2206DA870();
  v9 = *(_QWORD *)(v11 - 8);
  v5 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v11);
  v7 = (char *)&v5 - v5;
  (*(void (**)(double))(v3 + 16))(v2);
  v6 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name;
  v8 = &v12;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v6, v7, v11);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t (*sub_2206BCF48())()
{
  swift_beginAccess();
  return sub_220464E08;
}

uint64_t sub_2206BCF90()
{
  uint64_t v0;
  char *v2;
  char v3;

  v2 = (char *)(v0 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_value);
  swift_beginAccess();
  v3 = *v2;
  swift_endAccess();
  return v3 & 1;
}

uint64_t sub_2206BCFEC(char a1)
{
  uint64_t v1;
  _BYTE *v4;

  v4 = (_BYTE *)(v1 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_value);
  swift_beginAccess();
  *v4 = a1 & 1;
  return swift_endAccess();
}

uint64_t (*sub_2206BD048())()
{
  swift_beginAccess();
  return sub_220464E08;
}

uint64_t sub_2206BD090(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v11 = a1;
  v9 = a2;
  v17 = 0;
  v16 = 0;
  v15 = 0;
  v12 = sub_2206DA870();
  v10 = *(_QWORD *)(v12 - 8);
  v6 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (uint64_t)&v5 - v6;
  v16 = MEMORY[0x24BDAC7A8](v11);
  v15 = v3;
  swift_retain();
  swift_retain();
  v17 = v2;
  *(_BYTE *)(v2 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_value) = 0;
  swift_release();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v7(v8, v11, v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v2 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name, v8, v12);
  swift_release();
  v7(v8, v9, v12);
  v14 = sub_22069841C(v8);
  swift_retain();
  v17 = v14;
  v13 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v13(v9, v12);
  v13(v11, v12);
  swift_release();
  return v14;
}

uint64_t type metadata accessor for SettingsBinarySetting.Builder()
{
  uint64_t v1;

  v1 = qword_2555E9558;
  if (!qword_2555E9558)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_2206BD25C(char a1)
{
  uint64_t v1;
  _BYTE *v4;
  uint64_t v5;

  swift_retain();
  v4 = (_BYTE *)(v1 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_value);
  swift_beginAccess();
  *v4 = a1 & 1;
  swift_endAccess();
  swift_release();
  swift_retain();
  return v5;
}

uint64_t sub_2206BD2FC()
{
  uint64_t v1;

  type metadata accessor for SettingsBinarySetting();
  swift_retain();
  return sub_2206BD344(v1);
}

uint64_t sub_2206BD344(uint64_t a1)
{
  swift_allocObject();
  return sub_2206BD6CC(a1);
}

uint64_t type metadata accessor for SettingsBinarySetting()
{
  uint64_t v1;

  v1 = qword_2555E9448;
  if (!qword_2555E9448)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_2206BD3F0()
{
  swift_allocObject();
  return sub_2206BD438();
}

uint64_t sub_2206BD438()
{
  uint64_t result;
  uint64_t v1;

  if (!"SiriSettingsIntents.Builder")
  {
    sub_2206DB11C();
    __break(1u);
  }
  result = sub_220530DAC((uint64_t)"SiriSettingsIntents.Builder", 27, (unint64_t)"init(identifier:)", 17, 2, (unint64_t)"SiriSettingsIntents/SettingsBinarySetting.swift", 47, 2, v1, 0xDuLL, 0xBuLL);
  __break(1u);
  return result;
}

uint64_t sub_2206BD550()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v3 = OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name;
  v1 = sub_2206DA870();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3);
}

uint64_t sub_2206BD59C()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  v3 = sub_2206984E0();
  v2 = OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name;
  v0 = sub_2206DA870();
  (*(void (**)(uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v3 + v2);
  return v3;
}

uint64_t sub_2206BD5FC()
{
  sub_2206BD59C();
  return swift_deallocClassInstance();
}

uint64_t sub_2206BD63C()
{
  return sub_2206DAC30();
}

uint64_t SettingsBinarySetting.name.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name;
  v2 = sub_2206DA870();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t sub_2206BD6CC(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  char *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;

  v15 = a1;
  v20 = 0;
  v19 = 0;
  v8 = sub_2206DA870();
  v6 = *(_QWORD *)(v8 - 8);
  v3 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (char *)&v3 - v3;
  v19 = MEMORY[0x24BDAC7A8](v15);
  swift_retain();
  swift_retain();
  v20 = v1;
  v4 = v15 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_name;
  v5 = &v18;
  v9 = 32;
  v10 = 0;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v7, v4, v8);
  swift_endAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v1 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name, v7, v8);
  swift_release();
  v11 = (unsigned __int8 *)(v15 + OBJC_IVAR____TtCC19SiriSettingsIntents21SettingsBinarySetting7Builder_value);
  v12 = &v17;
  swift_beginAccess();
  v13 = *v11;
  swift_endAccess();
  *(_BYTE *)(v14 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_value) = v13 & 1;
  swift_release();
  swift_retain();
  v16 = sub_2206986B8(v15);
  swift_retain();
  v20 = v16;
  swift_release();
  swift_release();
  return v16;
}

uint64_t sub_2206BD874@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;

  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v9 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = v8 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name;
    v6 = sub_2206DA870();
    a1[3] = v6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(boxed_opaque_existential_1, v5);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2206DAC30();
    swift_bridgeObjectRetain();
    v4 = sub_2206DAC3C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v4 & 1) != 0)
    {
      result = swift_bridgeObjectRelease();
      v3 = *(_BYTE *)(v8 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_value);
      a1[3] = MEMORY[0x24BEE1328];
      *(_BYTE *)a1 = v3 & 1;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_retain();
      sub_2206987B4(a1);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2206BDA7C()
{
  sub_2206BDAC4();
  return sub_2206DB284() & 1;
}

unint64_t sub_2206BDAC4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9400;
  if (!qword_2555E9400)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EAB7C, &unk_24E64C850);
    atomic_store(v0, (unint64_t *)&qword_2555E9400);
    return v0;
  }
  return v2;
}

uint64_t sub_2206BDB30()
{
  sub_2206BDAC4();
  return sub_2206DACB4();
}

uint64_t sub_2206BDB6C()
{
  sub_2206BDAC4();
  return sub_2206DACCC();
}

uint64_t sub_2206BDBB0()
{
  sub_2206BDAC4();
  return sub_2206DACC0();
}

uint64_t sub_2206BDBF4()
{
  sub_2206BDC20();
  return sub_2206DB344();
}

unint64_t sub_2206BDC20()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9408;
  if (!qword_2555E9408)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EAB2C, &unk_24E64C850);
    atomic_store(v0, (unint64_t *)&qword_2555E9408);
    return v0;
  }
  return v2;
}

uint64_t sub_2206BDC8C()
{
  sub_2206BDC20();
  return sub_2206DB350();
}

uint64_t sub_2206BDCB8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  swift_allocObject();
  v5 = sub_2206BDD44(a1);
  if (v3)
    return v2;
  else
    return v5;
}

uint64_t sub_2206BDD44(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
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
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[47];
  char v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char *v48;

  v36 = a1;
  v48 = 0;
  v46 = 0;
  v45 = 0;
  v29 = sub_2206DA870();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = (*(_QWORD *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)v10 - v31;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E9410);
  v34 = *(_QWORD *)(v33 - 8);
  v35 = (*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v36);
  v37 = (char *)v10 - v35;
  v48 = (char *)v10 - v35;
  v47 = 0;
  v45 = v2;
  swift_retain();
  swift_retain();
  v46 = v1;
  v39 = v36[3];
  v40 = v36[4];
  __swift_project_boxed_opaque_existential_1(v36, v39);
  sub_2206BDC20();
  v3 = v38;
  sub_2206DB32C();
  v41 = v3;
  v42 = v3;
  if (v3)
  {
    v14 = v42;
    swift_release();
    swift_release();
    v15 = v14;
  }
  else
  {
    v25 = &v44;
    v44 = 0;
    sub_22054BDB0();
    v4 = v41;
    sub_2206DB1B8();
    v26 = v4;
    v27 = v4;
    if (v4)
    {
      v13 = v27;
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
      v15 = v13;
    }
    else
    {
      v21 = 1;
      v47 = 1;
      (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v28 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name, v32, v29);
      swift_release();
      v5 = v26;
      v43[46] = v21;
      v6 = sub_2206DB194();
      v22 = v5;
      v23 = v6;
      v24 = v5;
      if (v5)
      {
        v12 = v24;
        swift_release();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
        v15 = v12;
      }
      else
      {
        *(_BYTE *)(v28 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_value) = v23 & 1;
        swift_release();
        v17 = v43;
        sub_220466BAC((uint64_t)v36, (uint64_t)v43);
        v7 = v22;
        v47 = 7;
        v8 = SettingsSetting.init(from:)((uint64_t)v17);
        v18 = v7;
        v19 = v8;
        v20 = v7;
        if (!v7)
        {
          v16 = v19;
          swift_retain();
          v46 = v16;
          (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
          swift_release();
          return v16;
        }
        v11 = v20;
        (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
        v15 = v11;
      }
    }
  }
  v10[3] = v15;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
  if ((v47 & 4) == 0)
  {
    if ((v47 & 1) != 0)
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v46 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name, v29);
    v10[2] = v46;
    type metadata accessor for SettingsBinarySetting();
    swift_deallocPartialClassInstance();
  }
  return v10[1];
}

uint64_t sub_2206BE1E4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];
  uint64_t v9;
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
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;

  v28 = a1;
  v35 = 0;
  v34 = 0;
  v33 = 0;
  v19 = sub_2206DA870();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = (*(_QWORD *)(v20 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v8 - v21;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E9418);
  v3 = v23;
  v24 = v2;
  v25 = *(_QWORD *)(v2 - 8);
  v26 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v28);
  v27 = (char *)v8 - v26;
  v35 = (char *)v8 - v26;
  v34 = v4;
  v33 = v1;
  swift_retain();
  sub_220698C24((uint64_t)v28);
  v29 = v3;
  v30 = v3;
  if (v3)
  {
    v9 = v30;
    result = swift_release();
    v10 = v9;
  }
  else
  {
    swift_release();
    v13 = v28[3];
    v14 = v28[4];
    __swift_project_boxed_opaque_existential_1(v28, v13);
    sub_2206BDC20();
    sub_2206DB338();
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, v18 + OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name, v19);
    v15 = &v32;
    v32 = 0;
    sub_22054C0F0();
    v5 = v29;
    sub_2206DB224();
    v16 = v5;
    v17 = v5;
    if (v5)
    {
      v8[1] = v17;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
      return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v27, v24);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
      v6 = v16;
      v31 = 1;
      sub_2206DB200();
      v11 = v6;
      v12 = v6;
      if (v6)
        v8[0] = v12;
      return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v27, v24);
    }
  }
  return result;
}

uint64_t sub_2206BE4B4()
{
  swift_allocObject();
  return sub_2206BE4FC();
}

uint64_t sub_2206BE4FC()
{
  uint64_t result;
  uint64_t v1;

  if (!"SiriSettingsIntents.SettingsBinarySetting")
  {
    sub_2206DB11C();
    __break(1u);
  }
  result = sub_220530DAC((uint64_t)"SiriSettingsIntents.SettingsBinarySetting", 41, (unint64_t)"init(builder:)", 14, 2, (unint64_t)"SiriSettingsIntents/SettingsBinarySetting.swift", 47, 2, v1, 0xBuLL, 0xEuLL);
  __break(1u);
  return result;
}

uint64_t sub_2206BE610()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v3 = OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name;
  v1 = sub_2206DA870();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3);
}

uint64_t SettingsBinarySetting.deinit()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  v3 = SettingsSetting.deinit();
  v2 = OBJC_IVAR____TtC19SiriSettingsIntents21SettingsBinarySetting_name;
  v0 = sub_2206DA870();
  (*(void (**)(uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v3 + v2);
  return v3;
}

uint64_t SettingsBinarySetting.__deallocating_deinit()
{
  SettingsBinarySetting.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2206BE6FC()
{
  return type metadata accessor for SettingsBinarySetting();
}

uint64_t sub_2206BE714()
{
  unint64_t v0;
  uint64_t updated;

  updated = sub_2206DA870();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

uint64_t method lookup function for SettingsBinarySetting()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2206BE7F4()
{
  return type metadata accessor for SettingsBinarySetting.Builder();
}

uint64_t sub_2206BE80C()
{
  unint64_t v0;
  uint64_t updated;

  updated = sub_2206DA870();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

void *type metadata accessor for SettingsBinarySetting.CodingKeys()
{
  return &unk_24E64C850;
}

unint64_t sub_2206BE8E4()
{
  return sub_2206BE8F8();
}

unint64_t sub_2206BE8F8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9650;
  if (!qword_2555E9650)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EAB04, &unk_24E64C850);
    atomic_store(v0, (unint64_t *)&qword_2555E9650);
    return v0;
  }
  return v2;
}

unint64_t sub_2206BE964()
{
  return sub_2206BE978();
}

unint64_t sub_2206BE978()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9658;
  if (!qword_2555E9658)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EAA74, &unk_24E64C850);
    atomic_store(v0, (unint64_t *)&qword_2555E9658);
    return v0;
  }
  return v2;
}

unint64_t sub_2206BE9E4()
{
  return sub_2206BE9F8();
}

unint64_t sub_2206BE9F8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9660;
  if (!qword_2555E9660)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EAA9C, &unk_24E64C850);
    atomic_store(v0, (unint64_t *)&qword_2555E9660);
    return v0;
  }
  return v2;
}

uint64_t static SirikitLocalizedAppName.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  id v11;
  id v12;
  _BYTE v14[4];
  int v15;
  int v16;
  int v17;
  void (*v18)(_BYTE *, char *, uint64_t);
  void (*v19)(_BYTE *, uint64_t);
  int v20;
  int v21;
  char *v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  int v26;
  void (*v27)(_BYTE *, char *, uint64_t);
  void (*v28)(_BYTE *, uint64_t);
  int v29;
  int v30;
  char *v31;
  unsigned int (*v32)(char *, uint64_t, uint64_t);
  int v33;
  id *v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  _BYTE *v41;
  unint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  _BYTE *v51;
  unint64_t v52;
  _BYTE *v53;
  unint64_t v54;
  _BYTE *v55;
  unint64_t v56;
  _BYTE *v57;
  unint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  unint64_t v61;
  _BYTE *v62;
  uint64_t v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v37 = a1;
  v63 = a2;
  v3 = v2;
  v4 = v37;
  v49 = v3;
  v73 = 0;
  v72 = 0;
  v71 = 0;
  v38 = sub_2206DA870();
  v39 = *(_QWORD *)(v38 - 8);
  v40 = (*(_QWORD *)(v39 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v38);
  v41 = &v14[-v40];
  v42 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](&v14[-v40]);
  v43 = &v14[-v42];
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E0BB0);
  v45 = (*(_QWORD *)(*(_QWORD *)(v44 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v44);
  v46 = &v14[-v45];
  v47 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7);
  v48 = &v14[-v47];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
  v59 = *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64);
  v50 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v8);
  v51 = &v14[-v50];
  v52 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](&v14[-v50]);
  v53 = &v14[-v52];
  v54 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](&v14[-v52]);
  v55 = &v14[-v54];
  v56 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](&v14[-v54]);
  v57 = &v14[-v56];
  v58 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](&v14[-v56]);
  v60 = &v14[-v58];
  v61 = (v59 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](&v14[-v58]);
  v62 = &v14[-v61];
  v73 = v4;
  v72 = v9;
  v71 = v10;
  v64 = (id)sub_2206DA8DC();
  v11 = v64;
  v65 = (id)sub_2206DA8DC();
  v12 = v65;
  v69 = v64;
  v70 = v65;
  if (v64)
  {
    sub_220699F08(&v69, &v68);
    if (v70)
    {
      v67 = v68;
      v34 = &v69;
      v66 = v70;
      sub_2206DA7B0();
      v35 = sub_2206DAF48();

      sub_2204ACB4C(v34);
      v36 = v35;
      goto LABEL_7;
    }

    goto LABEL_9;
  }
  if (v70)
  {
LABEL_9:
    sub_2206BF3D4(&v69);
    v36 = 0;
    goto LABEL_7;
  }
  sub_2204ACB4C(&v69);
  v36 = 1;
LABEL_7:
  v33 = v36;

  swift_retain();
  swift_retain();
  if ((v33 & 1) == 0)
  {
    v26 = 0;
    goto LABEL_20;
  }
  sub_2206DA8E8();
  sub_2206DA8E8();
  v31 = &v48[*(int *)(v44 + 48)];
  sub_2204A395C(v62, v48);
  sub_2204A395C(v60, v31);
  v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  if (v32(v48, 1, v38) == 1)
  {
    if (v32(v31, 1, v38) != 1)
      goto LABEL_18;
    sub_2204A2148((uint64_t)v48);
    v30 = 1;
  }
  else
  {
    sub_2204A395C(v48, v57);
    if (v32(v31, 1, v38) == 1)
    {
      (*(void (**)(_BYTE *, uint64_t))(v39 + 8))(v57, v38);
LABEL_18:
      sub_220554CB4((uint64_t)v48);
      v30 = 0;
      goto LABEL_17;
    }
    v27 = *(void (**)(_BYTE *, char *, uint64_t))(v39 + 32);
    v27(v43, v57, v38);
    v27(v41, v31, v38);
    sub_220554DEC();
    v29 = sub_2206DAB88();
    v28 = *(void (**)(_BYTE *, uint64_t))(v39 + 8);
    v28(v41, v38);
    v28(v43, v38);
    sub_2204A2148((uint64_t)v48);
    v30 = v29;
  }
LABEL_17:
  v25 = v30;
  sub_2204A2148((uint64_t)v60);
  sub_2204A2148((uint64_t)v62);
  v26 = v25;
LABEL_20:
  v24 = v26;
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  if ((v24 & 1) == 0)
  {
    v17 = 0;
    goto LABEL_31;
  }
  sub_2206DA8D0();
  sub_2206DA8D0();
  v22 = &v46[*(int *)(v44 + 48)];
  sub_2204A395C(v55, v46);
  sub_2204A395C(v53, v22);
  v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  if (v23(v46, 1, v38) == 1)
  {
    if (v23(v22, 1, v38) != 1)
      goto LABEL_28;
    sub_2204A2148((uint64_t)v46);
    v21 = 1;
  }
  else
  {
    sub_2204A395C(v46, v51);
    if (v23(v22, 1, v38) == 1)
    {
      (*(void (**)(_BYTE *, uint64_t))(v39 + 8))(v51, v38);
LABEL_28:
      sub_220554CB4((uint64_t)v46);
      v21 = 0;
      goto LABEL_27;
    }
    v18 = *(void (**)(_BYTE *, char *, uint64_t))(v39 + 32);
    v18(v43, v51, v38);
    v18(v41, v22, v38);
    sub_220554DEC();
    v20 = sub_2206DAB88();
    v19 = *(void (**)(_BYTE *, uint64_t))(v39 + 8);
    v19(v41, v38);
    v19(v43, v38);
    sub_2204A2148((uint64_t)v46);
    v21 = v20;
  }
LABEL_27:
  v16 = v21;
  sub_2204A2148((uint64_t)v53);
  sub_2204A2148((uint64_t)v55);
  v17 = v16;
LABEL_31:
  v15 = v17;
  swift_release();
  swift_release();
  return v15 & 1;
}

id *sub_2206BF3D4(id *a1)
{

  return a1;
}

uint64_t sub_2206BF408(uint64_t *a1, uint64_t *a2)
{
  return static SirikitLocalizedAppName.== infix(_:_:)(*a1, *a2) & 1;
}

uint64_t *sub_2206BF428()
{
  if (qword_2555DC6B0 != -1)
    swift_once();
  return &qword_2555FE450;
}

uint64_t sub_2206BF47C()
{
  uint64_t result;

  type metadata accessor for SetHandlerProvider();
  result = sub_2206BF4D0();
  qword_2555FE450 = result;
  return result;
}

uint64_t type metadata accessor for SetHandlerProvider()
{
  return objc_opt_self();
}

uint64_t sub_2206BF4D0()
{
  swift_allocObject();
  return sub_2206BF740();
}

uint64_t sub_2206BF508()
{
  uint64_t v0;
  uint64_t v2;

  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_2206BF554(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206BF5B0()
{
  uint64_t v0;
  uint64_t v2;

  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_2206BF5FC(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206BF658()
{
  uint64_t v0;
  uint64_t v2;

  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v2;
}

uint64_t sub_2206BF6A4(uint64_t a1)
{
  uint64_t v1;

  swift_bridgeObjectRetain();
  swift_beginAccess();
  *(_QWORD *)(v1 + 32) = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2206BF700())()
{
  swift_beginAccess();
  return sub_220464E08;
}

uint64_t sub_2206BF740()
{
  _QWORD *v0;
  _BYTE *v1;
  _BYTE *v2;
  _BYTE *v3;
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
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2555E9668);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555E3868);
  sub_2205C0CE4();
  v0[3] = sub_2206DAB40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555E9670);
  sub_2206DB260();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2555E5058);
  sub_2205BC27C();
  v0[4] = sub_2206DAB40();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555E9678);
  sub_2206DB260();
  v67 = v1;
  *v1 = 0;
  v5 = *sub_2205C8F64();
  swift_retain();
  *((_QWORD *)v67 + 4) = type metadata accessor for SetAirplaneModeHandler();
  *((_QWORD *)v67 + 5) = &off_24E646040;
  *((_QWORD *)v67 + 1) = v5;
  v67[48] = 1;
  v6 = *sub_2205BA7DC();
  swift_retain();
  v8 = type metadata accessor for SetAppearanceHandler();
  *((_QWORD *)v67 + 10) = v8;
  *((_QWORD *)v67 + 11) = &off_24E645820;
  *((_QWORD *)v67 + 7) = v6;
  v67[96] = 2;
  v7 = *sub_2205BA7DC();
  swift_retain();
  *((_QWORD *)v67 + 16) = v8;
  *((_QWORD *)v67 + 17) = &off_24E645820;
  *((_QWORD *)v67 + 13) = v7;
  v67[144] = 3;
  v9 = *sub_2205BA7DC();
  swift_retain();
  *((_QWORD *)v67 + 22) = v8;
  *((_QWORD *)v67 + 23) = &off_24E645820;
  *((_QWORD *)v67 + 19) = v9;
  v67[192] = 4;
  v10 = *sub_2206BC96C();
  swift_retain();
  *((_QWORD *)v67 + 28) = type metadata accessor for SetAssistiveTouchHandler();
  *((_QWORD *)v67 + 29) = &off_24E64C798;
  *((_QWORD *)v67 + 25) = v10;
  v67[240] = 7;
  v11 = *sub_2206C9410();
  swift_retain();
  *((_QWORD *)v67 + 34) = type metadata accessor for SetAutoAnswerHandler();
  *((_QWORD *)v67 + 35) = &off_24E64CD48;
  *((_QWORD *)v67 + 31) = v11;
  v67[288] = 8;
  v12 = *sub_22069A488();
  swift_retain();
  *((_QWORD *)v67 + 40) = type metadata accessor for SetAXAutoBrightnessHandler();
  *((_QWORD *)v67 + 41) = &off_24E64B250;
  *((_QWORD *)v67 + 37) = v12;
  v67[336] = 9;
  v13 = *sub_2206706D4();
  swift_retain();
  *((_QWORD *)v67 + 46) = type metadata accessor for SetAutoCorrectHandler();
  *((_QWORD *)v67 + 47) = &off_24E649820;
  *((_QWORD *)v67 + 43) = v13;
  v67[384] = 10;
  v14 = *sub_2205C5E58();
  swift_retain();
  *((_QWORD *)v67 + 52) = type metadata accessor for SetBassHandler();
  *((_QWORD *)v67 + 53) = &off_24E645FD8;
  *((_QWORD *)v67 + 49) = v14;
  v67[432] = 11;
  v15 = *sub_2206C3EC0();
  swift_retain();
  *((_QWORD *)v67 + 58) = type metadata accessor for SetBassReduceHandler();
  *((_QWORD *)v67 + 59) = &off_24E64CA40;
  *((_QWORD *)v67 + 55) = v15;
  v67[480] = 12;
  v16 = *sub_2205EF678();
  swift_retain();
  *((_QWORD *)v67 + 64) = type metadata accessor for SetBluetoothHandler();
  *((_QWORD *)v67 + 65) = &off_24E647128;
  *((_QWORD *)v67 + 61) = v16;
  v67[528] = 13;
  v17 = *sub_22067DCC8();
  swift_retain();
  *((_QWORD *)v67 + 70) = type metadata accessor for SetAXColorFiltersBlueYellowHandler();
  *((_QWORD *)v67 + 71) = &off_24E6499B0;
  *((_QWORD *)v67 + 67) = v17;
  v67[576] = 14;
  v18 = *sub_22054CC50();
  swift_retain();
  *((_QWORD *)v67 + 76) = type metadata accessor for SetAXBoldTextHandler();
  *((_QWORD *)v67 + 77) = &off_24E642478;
  *((_QWORD *)v67 + 73) = v18;
  v67[624] = 15;
  v19 = *sub_22069F570();
  swift_retain();
  *((_QWORD *)v67 + 82) = type metadata accessor for SetAXButtonShapesHandler();
  *((_QWORD *)v67 + 83) = &off_24E64B3E8;
  *((_QWORD *)v67 + 79) = v19;
  v67[672] = 16;
  v20 = *sub_2206C0C04();
  swift_retain();
  *((_QWORD *)v67 + 88) = type metadata accessor for SetCellularDataHandler();
  *((_QWORD *)v67 + 89) = &off_24E64C970;
  *((_QWORD *)v67 + 85) = v20;
  v67[720] = 17;
  v21 = *sub_2205F5360();
  swift_retain();
  *((_QWORD *)v67 + 94) = type metadata accessor for SetAXClassicInvertColorsHandler();
  *((_QWORD *)v67 + 95) = &off_24E6473C8;
  *((_QWORD *)v67 + 91) = v21;
  v67[768] = 18;
  v22 = *sub_2205BF0FC();
  swift_retain();
  *((_QWORD *)v67 + 100) = type metadata accessor for SetAXColorFiltersColorTintHandler();
  *((_QWORD *)v67 + 101) = &off_24E645D88;
  *((_QWORD *)v67 + 97) = v22;
  v67[816] = 19;
  v23 = *sub_22050B050();
  swift_retain();
  *((_QWORD *)v67 + 106) = type metadata accessor for SetConversationAwarenessHandler();
  *((_QWORD *)v67 + 107) = &off_24E63FA40;
  *((_QWORD *)v67 + 103) = v23;
  v67[864] = 20;
  v24 = *sub_2205BF3F0();
  swift_retain();
  *((_QWORD *)v67 + 112) = type metadata accessor for SetDictationHandler();
  *((_QWORD *)v67 + 113) = &off_24E645DB8;
  *((_QWORD *)v67 + 109) = v24;
  v67[912] = 21;
  v25 = *sub_2205E8598();
  swift_retain();
  *((_QWORD *)v67 + 118) = type metadata accessor for SetAXDifferentiateWithoutColorHandler();
  *((_QWORD *)v67 + 119) = &off_24E646E38;
  *((_QWORD *)v67 + 115) = v25;
  v67[960] = 23;
  v26 = *sub_2206C6A1C();
  swift_retain();
  *((_QWORD *)v67 + 124) = type metadata accessor for SetFlashlightHandler();
  *((_QWORD *)v67 + 125) = &off_24E64CC58;
  *((_QWORD *)v67 + 121) = v26;
  v67[1008] = 24;
  v27 = *sub_2206BAF88();
  swift_retain();
  *((_QWORD *)v67 + 130) = type metadata accessor for SetAXColorFiltersGrayscaleHandler();
  *((_QWORD *)v67 + 131) = &off_24E64C518;
  *((_QWORD *)v67 + 127) = v27;
  v67[1056] = 25;
  v28 = *sub_220688DBC();
  swift_retain();
  *((_QWORD *)v67 + 136) = type metadata accessor for SetAXColorFiltersGreenRedHandler();
  *((_QWORD *)v67 + 137) = &off_24E64A390;
  *((_QWORD *)v67 + 133) = v28;
  v67[1104] = 26;
  v29 = *sub_220572710();
  swift_retain();
  *((_QWORD *)v67 + 142) = type metadata accessor for SetHeySiriHandler();
  *((_QWORD *)v67 + 143) = &off_24E643BC0;
  *((_QWORD *)v67 + 139) = v29;
  v67[1152] = 27;
  v30 = *sub_2206BB27C();
  swift_retain();
  *((_QWORD *)v67 + 148) = type metadata accessor for SetAXIncreaseContrastHandler();
  *((_QWORD *)v67 + 149) = &off_24E64C548;
  *((_QWORD *)v67 + 145) = v30;
  v67[1200] = 28;
  v31 = *sub_2205DBBEC();
  swift_retain();
  *((_QWORD *)v67 + 154) = type metadata accessor for SetAXInvertColorsHandler();
  *((_QWORD *)v67 + 155) = &off_24E6469A8;
  *((_QWORD *)v67 + 151) = v31;
  v67[1248] = 29;
  v32 = *sub_2206720B8();
  swift_retain();
  *((_QWORD *)v67 + 160) = type metadata accessor for SetLocationServicesHandler();
  *((_QWORD *)v67 + 161) = &off_24E6498E0;
  *((_QWORD *)v67 + 157) = v32;
  v67[1296] = 31;
  v33 = *sub_220691784();
  swift_retain();
  *((_QWORD *)v67 + 166) = type metadata accessor for SetNightShiftHandler();
  *((_QWORD *)v67 + 167) = &off_24E64AB10;
  *((_QWORD *)v67 + 163) = v33;
  v67[1344] = 34;
  v34 = *sub_2205DC318();
  swift_retain();
  *((_QWORD *)v67 + 172) = type metadata accessor for SetAXOnOffLabelsHandler();
  *((_QWORD *)v67 + 173) = &off_24E6469D8;
  *((_QWORD *)v67 + 169) = v34;
  v67[1392] = 35;
  v35 = *sub_2204CE3D0();
  swift_retain();
  v36 = type metadata accessor for SetPersonalHotspotHandler();
  *((_QWORD *)v67 + 178) = v36;
  *((_QWORD *)v67 + 179) = &off_24E63F648;
  *((_QWORD *)v67 + 175) = v35;
  v67[1440] = 36;
  v37 = *sub_2204CE3D0();
  swift_retain();
  *((_QWORD *)v67 + 184) = v36;
  *((_QWORD *)v67 + 185) = &off_24E63F648;
  *((_QWORD *)v67 + 181) = v37;
  v67[1488] = 37;
  v38 = *sub_220672400();
  swift_retain();
  *((_QWORD *)v67 + 190) = type metadata accessor for SetPersonalizedVolumeHandler();
  *((_QWORD *)v67 + 191) = &off_24E649938;
  *((_QWORD *)v67 + 187) = v38;
  v67[1536] = 38;
  v39 = *sub_220465340();
  swift_retain();
  *((_QWORD *)v67 + 196) = type metadata accessor for SetLowPowerModeHandler();
  *((_QWORD *)v67 + 197) = &off_24E63E810;
  *((_QWORD *)v67 + 193) = v39;
  v67[1584] = 39;
  v40 = *sub_220465B40();
  swift_retain();
  *((_QWORD *)v67 + 202) = type metadata accessor for SetAXColorFiltersRedGreenHandler();
  *((_QWORD *)v67 + 203) = &off_24E63E840;
  *((_QWORD *)v67 + 199) = v40;
  v67[1632] = 40;
  v41 = *sub_22050B424();
  swift_retain();
  *((_QWORD *)v67 + 208) = type metadata accessor for SetAXReduceTransparencyHandler();
  *((_QWORD *)v67 + 209) = &off_24E63FA98;
  *((_QWORD *)v67 + 205) = v41;
  v67[1680] = 41;
  v42 = *sub_2206B1D04();
  swift_retain();
  *((_QWORD *)v67 + 214) = type metadata accessor for SetAXReduceWhitePointHandler();
  *((_QWORD *)v67 + 215) = &off_24E64BC40;
  *((_QWORD *)v67 + 211) = v42;
  v67[1728] = 42;
  v43 = *sub_2205BEEFC();
  swift_retain();
  *((_QWORD *)v67 + 220) = type metadata accessor for SetSiriHandler();
  *((_QWORD *)v67 + 221) = &off_24E645D58;
  *((_QWORD *)v67 + 217) = v43;
  v67[1776] = 43;
  v44 = *sub_22054DD34();
  swift_retain();
  *((_QWORD *)v67 + 226) = type metadata accessor for SetSmartSiriVolumeHandler();
  *((_QWORD *)v67 + 227) = &off_24E6424C8;
  *((_QWORD *)v67 + 223) = v44;
  v67[1824] = 45;
  v45 = *sub_22056BE5C();
  swift_retain();
  *((_QWORD *)v67 + 232) = type metadata accessor for SetAnnounceNotificationsHandler();
  *((_QWORD *)v67 + 233) = &off_24E643890;
  *((_QWORD *)v67 + 229) = v45;
  v67[1872] = 47;
  v46 = *sub_2206B2430();
  swift_retain();
  *((_QWORD *)v67 + 238) = type metadata accessor for SetAXSwitchControlHandler();
  *((_QWORD *)v67 + 239) = &off_24E64BC70;
  *((_QWORD *)v67 + 235) = v46;
  v67[1920] = 48;
  v47 = *sub_2205BF744();
  swift_retain();
  *((_QWORD *)v67 + 244) = type metadata accessor for SetAXVoiceControlHandler();
  *((_QWORD *)v67 + 245) = &off_24E645E10;
  *((_QWORD *)v67 + 241) = v47;
  v67[1968] = 49;
  v48 = *sub_2206B5D4C();
  swift_retain();
  *((_QWORD *)v67 + 250) = type metadata accessor for SetVoiceOverHandler();
  *((_QWORD *)v67 + 251) = &off_24E64BD98;
  *((_QWORD *)v67 + 247) = v48;
  v67[2016] = 50;
  v49 = *sub_2206273E0();
  swift_retain();
  *((_QWORD *)v67 + 256) = type metadata accessor for SetVpnHandler();
  *((_QWORD *)v67 + 257) = &off_24E648F70;
  *((_QWORD *)v67 + 253) = v49;
  v67[2064] = 51;
  v50 = *sub_220527D2C();
  swift_retain();
  *((_QWORD *)v67 + 262) = type metadata accessor for SetWifiHandler();
  *((_QWORD *)v67 + 263) = &off_24E640D18;
  *((_QWORD *)v67 + 259) = v50;
  v67[2112] = 52;
  v51 = *sub_22054C758();
  swift_retain();
  *((_QWORD *)v67 + 268) = type metadata accessor for SetZoomHandler();
  *((_QWORD *)v67 + 269) = &off_24E642410;
  *((_QWORD *)v67 + 265) = v51;
  v67[2160] = 53;
  v52 = *sub_22068DF24();
  swift_retain();
  *((_QWORD *)v67 + 274) = type metadata accessor for SetShakeMouseHandler();
  *((_QWORD *)v67 + 275) = &off_24E64A5A0;
  *((_QWORD *)v67 + 271) = v52;
  v67[2208] = 58;
  v53 = *sub_22066C68C();
  swift_retain();
  v60 = type metadata accessor for SetFocusModeHandler();
  *((_QWORD *)v67 + 280) = v60;
  *((_QWORD *)v67 + 281) = &off_24E6496E0;
  *((_QWORD *)v67 + 277) = v53;
  v67[2256] = 60;
  v54 = *sub_22066C68C();
  swift_retain();
  *((_QWORD *)v67 + 286) = v60;
  *((_QWORD *)v67 + 287) = &off_24E6496E0;
  *((_QWORD *)v67 + 283) = v54;
  v67[2304] = 57;
  v55 = *sub_22066C68C();
  swift_retain();
  *((_QWORD *)v67 + 292) = v60;
  *((_QWORD *)v67 + 293) = &off_24E6496E0;
  *((_QWORD *)v67 + 289) = v55;
  v67[2352] = 56;
  v56 = *sub_22066C68C();
  swift_retain();
  *((_QWORD *)v67 + 298) = v60;
  *((_QWORD *)v67 + 299) = &off_24E6496E0;
  *((_QWORD *)v67 + 295) = v56;
  v67[2400] = 54;
  v57 = *sub_22066C68C();
  swift_retain();
  *((_QWORD *)v67 + 304) = v60;
  *((_QWORD *)v67 + 305) = &off_24E6496E0;
  *((_QWORD *)v67 + 301) = v57;
  v67[2448] = 59;
  v58 = *sub_22066C68C();
  swift_retain();
  *((_QWORD *)v67 + 310) = v60;
  *((_QWORD *)v67 + 311) = &off_24E6496E0;
  *((_QWORD *)v67 + 307) = v58;
  v67[2496] = 55;
  v59 = *sub_22066C68C();
  swift_retain();
  *((_QWORD *)v67 + 316) = v60;
  *((_QWORD *)v67 + 317) = &off_24E6496E0;
  *((_QWORD *)v67 + 313) = v59;
  v67[2544] = 22;
  v61 = *sub_22066C68C();
  swift_retain();
  *((_QWORD *)v67 + 322) = v60;
  *((_QWORD *)v67 + 323) = &off_24E6496E0;
  *((_QWORD *)v67 + 319) = v61;
  v67[2592] = 5;
  v62 = *sub_2206CB000();
  swift_retain();
  v64 = type metadata accessor for SetNoiseManagementHandler();
  *((_QWORD *)v67 + 328) = v64;
  *((_QWORD *)v67 + 329) = &off_24E64CE78;
  *((_QWORD *)v67 + 325) = v62;
  v67[2640] = 6;
  v63 = *sub_2206CB000();
  swift_retain();
  *((_QWORD *)v67 + 334) = v64;
  *((_QWORD *)v67 + 335) = &off_24E64CE78;
  *((_QWORD *)v67 + 331) = v63;
  v67[2688] = 32;
  v65 = *sub_2206CB000();
  swift_retain();
  *((_QWORD *)v67 + 340) = v64;
  *((_QWORD *)v67 + 341) = &off_24E64CE78;
  *((_QWORD *)v67 + 337) = v65;
  v67[2736] = 46;
  v66 = *sub_2205286C4();
  swift_retain();
  *((_QWORD *)v67 + 346) = type metadata accessor for SetStandByHandler();
  *((_QWORD *)v67 + 347) = &off_24E640D48;
  *((_QWORD *)v67 + 343) = v66;
  v67[2784] = 61;
  v68 = *sub_22062720C();
  swift_retain();
  *((_QWORD *)v67 + 352) = type metadata accessor for SetReduceLoudSoundsHandler();
  *((_QWORD *)v67 + 353) = &off_24E648F40;
  *((_QWORD *)v67 + 349) = v68;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2555DFCE8);
  sub_220580FE4();
  v0[2] = sub_2206DAB40();
  sub_2205C3B44();
  swift_retain();
  type metadata accessor for SetSoundAnalysisHandler();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555E9680);
  sub_2206DAB64();
  swift_endAccess();
  sub_220698014();
  swift_retain();
  type metadata accessor for SetAXMotionCuesHandler();
  swift_beginAccess();
  sub_2206DAB64();
  swift_endAccess();
  sub_2206DB260();
  v74 = v2;
  *v2 = 1;
  v69 = *sub_2205EEF70();
  swift_retain();
  v70 = type metadata accessor for SetDisplayBrightnessHandler();
  *((_QWORD *)v74 + 4) = v70;
  *((_QWORD *)v74 + 5) = &off_24E6470B8;
  *((_QWORD *)v74 + 1) = v69;
  v74[48] = 2;
  v71 = *sub_2205EEF70();
  swift_retain();
  *((_QWORD *)v74 + 10) = v70;
  *((_QWORD *)v74 + 11) = &off_24E6470B8;
  *((_QWORD *)v74 + 7) = v71;
  v74[96] = 7;
  v72 = *sub_22053EB94();
  swift_retain();
  v73 = type metadata accessor for SetSiriVolumeHandler();
  *((_QWORD *)v74 + 16) = v73;
  *((_QWORD *)v74 + 17) = &off_24E641D18;
  *((_QWORD *)v74 + 13) = v72;
  v74[144] = 8;
  v75 = *sub_22053EB94();
  swift_retain();
  *((_QWORD *)v74 + 22) = v73;
  *((_QWORD *)v74 + 23) = &off_24E641D18;
  *((_QWORD *)v74 + 19) = v75;
  sub_22045A844();
  v76 = sub_2206DAB40();
  swift_beginAccess();
  *(_QWORD *)(v80 + 24) = v76;
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_2206DB260();
  v77 = v3;
  *v3 = 1;
  v78 = *sub_220554EDC();
  swift_retain();
  v77[4] = type metadata accessor for SetWifiNetworkHandler();
  v77[5] = &off_24E6426E0;
  v77[1] = v78;
  sub_22045A844();
  v79 = sub_2206DAB40();
  swift_beginAccess();
  *(_QWORD *)(v80 + 32) = v79;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return v80;
}

uint64_t sub_2206C0950(char *a1)
{
  uint64_t v1;
  unint64_t v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;

  v9 = 0;
  v8 = 0;
  v9 = *a1;
  v4 = v9;
  v8 = v1;
  swift_beginAccess();
  v6 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_endAccess();
  v7 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2555DFCE8);
  v2 = sub_220580FE4();
  MEMORY[0x2207E5BBC](&v7, v6, &type metadata for BinarySettingIdentifier, v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206C0A04(char *a1)
{
  uint64_t v1;
  unint64_t v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;

  v9 = 0;
  v8 = 0;
  v9 = *a1;
  v4 = v9;
  v8 = v1;
  swift_beginAccess();
  v6 = *(_QWORD *)(v1 + 24);
  swift_bridgeObjectRetain();
  swift_endAccess();
  v7 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E3868);
  v2 = sub_2205C0CE4();
  MEMORY[0x2207E5BBC](&v7, v6, &type metadata for NumericSettingIdentifier, v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206C0AB8(char a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;

  v9 = a1 & 1;
  v8 = v1;
  swift_beginAccess();
  v6 = *(_QWORD *)(v1 + 32);
  swift_bridgeObjectRetain();
  swift_endAccess();
  v7 = a1 & 1;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2555E5058);
  v2 = sub_2205BC27C();
  MEMORY[0x2207E5BBC](&v7, v6, &unk_24E645A48, v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2206C0B80()
{
  uint64_t v1;

  sub_22045F510();
  sub_22045F510();
  sub_22045F510();
  return v1;
}

uint64_t sub_2206C0BC8()
{
  sub_2206C0B80();
  return swift_deallocClassInstance();
}

uint64_t *sub_2206C0C04()
{
  if (qword_2555DC6B8 != -1)
    swift_once();
  return &qword_2555FE458;
}

uint64_t sub_2206C0C58()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetCellularDataHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE458 = result;
  return result;
}

uint64_t type metadata accessor for SetCellularDataHandler()
{
  return objc_opt_self();
}

uint64_t sub_2206C0CB8(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  uint64_t *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  id v22;
  id v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  uint64_t v34;
  void *v35;
  char v36;

  sub_2206DAED0();
  v35 = (void *)*sub_22053C880();
  v3 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  v36 = sub_2204AFDC0();
  swift_release();
  if ((v36 & 1) != 0)
  {
    swift_retain();
    v30 = sub_2204AE000();
    swift_release();
    v4 = a1;
    if ((v30 & 1) != 0)
    {
      objc_msgSend(a1, sel_binaryValue);
      type metadata accessor for INBinarySettingValue();
      sub_220460C28();
      v29 = sub_2206DB284();
      v5 = a1;
      if ((v29 & 1) != 0)
      {
        v28 = 1;
      }
      else
      {
        objc_msgSend(a1, sel_binaryValue);
        v28 = sub_2206DB284();
      }

      v27 = v28;
    }
    else
    {
      v27 = 0;
    }

    if ((v27 & 1) != 0)
    {
      sub_2206DAEDC();
      v14 = (id)*sub_22053C880();
      v10 = v14;
      sub_2206DB260();
      sub_2206DAA14();
      swift_bridgeObjectRelease();

      swift_retain();
      v15 = sub_220523EEC(7, 0);
      a2();

      return swift_release();
    }
    else
    {
      swift_retain();
      v26 = sub_2204AF560();
      swift_release();
      swift_retain();
      if ((v26 & 1) != 0)
      {
        v25 = 1;
      }
      else
      {
        swift_retain();
        v24 = sub_2204AF2A8();
        swift_release();
        v25 = v24;
      }
      swift_release();
      if ((v25 & 1) != 0)
      {
        sub_2206DAED0();
        v16 = (id)*sub_22053C880();
        v8 = v16;
        sub_2206DB260();
        sub_2206DAA14();
        swift_bridgeObjectRelease();

        swift_retain();
        v17 = sub_2204AFDFC();
        swift_release();
        v9 = sub_220535534();
        v18 = *v9;
        v19 = v9[1];
        v20 = *((unsigned __int8 *)v9 + 16);
        v21 = *(_BYTE *)(v34 + 24);
        swift_retain();
        sub_220524C7C(v17 & 1, a1, v18, v19, v20, v21 & 1, a2, a3, (uint64_t)sub_2206C1364, v34, 0, 1, 0, 0);
        return sub_2204614E0((uint64_t)sub_2206C1364);
      }
      else
      {
        sub_2206DAEDC();
        v22 = (id)*sub_22053C880();
        v6 = v22;
        sub_2206DB260();
        sub_2206DAA14();
        swift_bridgeObjectRelease();

        swift_retain();
        v23 = sub_220523EEC(6, 0);
        a2();

        return swift_release();
      }
    }
  }
  else
  {
    sub_2206DAEDC();
    v12 = (id)*sub_22053C880();
    v11 = v12;
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    v13 = sub_220523EEC(7, 0);
    a2();

    return swift_release();
  }
}

uint64_t sub_2206C12F8(char a1)
{
  swift_retain();
  sub_2204B00C8(a1 & 1);
  return swift_release();
}

uint64_t sub_2206C1364(char a1)
{
  return sub_2206C12F8(a1 & 1);
}

uint64_t sub_2206C1388(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_2206C0CB8(a1, a2, a3);
}

uint64_t sub_2206C13A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  id v12;
  id v13;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _DWORD v20[4];
  uint64_t v21;
  id v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  id v27;
  int v28;
  uint64_t v29;
  id v30;
  void (*v31)(char *, uint64_t);
  int v32;
  int v33;
  uint64_t v34;
  id v35;
  int v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  unint64_t v50;
  char *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int *v69;
  int v70;
  const char *v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;

  v39 = a3;
  v40 = a1;
  v65 = a2;
  v4 = v3;
  v5 = v40;
  v64 = v4;
  v71 = "ConfirmNumericSettingIntentStrategy actionForInput.";
  v69 = &dword_220456000;
  v41 = "ConfirmNumericSettingIntentStrategy actionForInput is not uso, treating it as CANCEL.";
  v42 = "ConfirmNumericSettingIntentStrategy actionForInput is ignore: no applicable action.";
  v43 = "ConfirmNumericSettingIntentStrategy actionForInput is ignore.";
  v44 = "ConfirmNumericSettingIntentStrategy actionForInput is handle.";
  v45 = "ConfirmSettingsIntentStrategy actionForInput is handle.";
  v80 = 0;
  v79 = 0;
  v78 = 0;
  v82 = 0;
  v81 = 0;
  v67 = 0;
  v46 = sub_2206D9A90();
  v47 = *(_QWORD *)(v46 - 8);
  v48 = (*(_QWORD *)(v47 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v49 = (char *)v20 - v48;
  v50 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v7);
  v51 = (char *)v20 - v50;
  v52 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SettingsNLIntent() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v67);
  v53 = (uint64_t)v20 - v52;
  v54 = sub_2206DA690();
  v55 = *(_QWORD *)(v54 - 8);
  v56 = (*(_QWORD *)(v55 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v67);
  v57 = (uint64_t)v20 - v56;
  v58 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v9);
  v59 = (char *)v20 - v58;
  v82 = (char *)v20 - v58;
  v60 = sub_2206D9E98();
  v61 = *(_QWORD *)(v60 - 8);
  v62 = (*(_QWORD *)(v61 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v67);
  v63 = (char *)v20 - v62;
  v81 = (char *)v20 - v62;
  v76 = sub_2206D9E74();
  v74 = *(_QWORD *)(v76 - 8);
  v66 = (*(_QWORD *)(v74 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v76);
  v75 = (char *)v20 - v66;
  v80 = v5;
  v79 = v10;
  v78 = v11;
  v73 = (id)*sub_22053DFA0();
  v12 = v73;
  v70 = sub_2206DAED0();
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  v72 = sub_2206DB260();
  sub_2206DAA08();
  swift_bridgeObjectRelease();

  sub_2206D9E38();
  v77 = (*(uint64_t (**)(char *, uint64_t))(v74 + 88))(v75, v76);
  if (v77 == *MEMORY[0x24BE98E08])
  {
    v16 = v53;
    (*(void (**)(char *, uint64_t))(v74 + 96))(v75, v76);
    (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v59, v75, v54);
    v82 = v59;
    v30 = (id)*sub_22053DFA0();
    v17 = v30;
    v28 = sub_2206DAED0();
    v29 = sub_2206DB260();
    sub_2206DAA08();
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, char *, uint64_t))(v55 + 16))(v57, v59, v54);
    sub_2205AF9FC(v57, v16);
    sub_2205AFA3C((uint64_t)v51);
    sub_220506220(v53);
    (*(void (**)(char *, _QWORD, uint64_t))(v47 + 104))(v49, *MEMORY[0x24BE97108], v46);
    sub_22050625C();
    v32 = sub_2206DB284();
    v31 = *(void (**)(char *, uint64_t))(v47 + 8);
    v31(v49, v46);
    v31(v51, v46);
    if ((v32 & 1) != 0)
      sub_2206D9BC8();
    else
      sub_2206D9BBC();
    return (*(uint64_t (**)(char *, uint64_t))(v55 + 8))(v59, v54);
  }
  else if (v77 == *MEMORY[0x24BE98E98])
  {
    (*(void (**)(char *, uint64_t))(v74 + 96))(v75, v76);
    (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v63, v75, v60);
    v81 = v63;
    if ((sub_2205062CC((uint64_t)v63) & 1) != 0)
    {
      v38 = (id)*sub_22053DFA0();
      v13 = v38;
      v36 = sub_2206DAED0();
      v37 = sub_2206DB260();
      sub_2206DAA08();
      swift_bridgeObjectRelease();

      sub_2206D9BBC();
    }
    else
    {
      v35 = (id)*sub_22053DFA0();
      v15 = v35;
      v33 = sub_2206DAED0();
      v34 = sub_2206DB260();
      sub_2206DAA08();
      swift_bridgeObjectRelease();

      sub_2206D9BC8();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v63, v60);
  }
  else
  {
    v22 = (id)*sub_22053DFA0();
    v18 = v22;
    v20[3] = sub_2206DAED0();
    v23 = 0;
    v21 = sub_2206DB260();
    v24 = 2;
    sub_2206DAA08();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v74 + 8))(v75, v76);
    v27 = (id)*sub_22053DFA0();
    v19 = v27;
    v25 = sub_2206DAED0();
    v26 = sub_2206DB260();
    sub_2206DAA08();
    swift_bridgeObjectRelease();

    return sub_2206D9BC8();
  }
}

uint64_t sub_2206C1C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[9] = v3;
  v4[8] = a3;
  v4[7] = a2;
  v4[6] = a1;
  v4[2] = v4;
  v4[3] = 0;
  v4[4] = 0;
  v4[5] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DEAA0);
  v4[10] = swift_task_alloc();
  v5 = sub_2206D9A90();
  v4[11] = v5;
  v4[12] = *(_QWORD *)(v5 - 8);
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  v6 = sub_2206D9E74();
  v4[15] = v6;
  v4[16] = *(_QWORD *)(v6 - 8);
  v4[17] = swift_task_alloc();
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = v3;
  return swift_task_switch();
}

uint64_t sub_2206C1D4C()
{
  _QWORD *v0;
  id v1;
  uint64_t *v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(void);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  char v42;

  v34 = v0[17];
  v33 = v0[16];
  v35 = v0[15];
  v37 = v0[14];
  v40 = v0[13];
  v38 = v0[12];
  v39 = v0[11];
  v0[2] = v0;
  v32 = (void *)*sub_22053DFA0();
  v1 = v32;
  sub_2206DAED0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  v31 = v2;
  sub_2206D9E38();
  v29 = sub_2206DABD0();
  v30 = v3;
  v31[3] = MEMORY[0x24BEE0D00];
  v31[4] = sub_220464CA0();
  *v31 = v29;
  v31[1] = v30;
  sub_22045A844();
  sub_2206DAA08();
  swift_bridgeObjectRelease();

  sub_2206D9E38();
  sub_2206C2434(v34, v37);
  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v34, v35);
  v36 = *(void (**)(void))(v38 + 104);
  ((void (*)(uint64_t, _QWORD, uint64_t))v36)(v40, *MEMORY[0x24BE97108], v39);
  sub_2206C2F90();
  v42 = sub_2206DAB88();
  v41 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
  v41(v40, v39);
  if ((v42 & 1) != 0)
  {
    v10 = v28[14];
    v9 = v28[11];
    v8 = (id)*sub_22053DFA0();
    v6 = v8;
    sub_2206DAEDC();
    sub_2206DB260();
    sub_2206DAA08();
    swift_bridgeObjectRelease();

    type metadata accessor for FlowStrategy.IntentConversionError();
    sub_2205CED4C();
    swift_allocError();
    sub_2206D9E38();
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    v41(v10, v9);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v28[2] + 8))();
  }
  else
  {
    v26 = v28[13];
    v25 = v28[11];
    v36();
    sub_22050625C();
    v27 = sub_2206DB284();
    v41(v26, v25);
    if ((v27 & 1) != 0)
    {
      v23 = v28[14];
      v24 = v28[11];
      v22 = v28[10];
      v18 = (id)*sub_22053DFA0();
      v4 = v18;
      sub_2206DAED0();
      sub_2206DB260();
      sub_2206DAA08();
      swift_bridgeObjectRelease();

      v19 = *MEMORY[0x24BE98400];
      v21 = sub_2206D9D3C();
      v20 = *(_QWORD *)(v21 - 8);
      (*(void (**)(uint64_t, _QWORD))(v20 + 104))(v22, v19);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v20 + 56))(v22, 0, 1, v21);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2555E6688);
      sub_2206D9DC0();
      sub_2204CB808();
      sub_2206D9D30();
      v41(v23, v24);
    }
    else
    {
      v16 = v28[14];
      v17 = v28[11];
      v15 = v28[10];
      v11 = (id)*sub_22053DFA0();
      v5 = v11;
      sub_2206DAED0();
      sub_2206DB260();
      sub_2206DAA08();
      swift_bridgeObjectRelease();

      v12 = *MEMORY[0x24BE983F8];
      v14 = sub_2206D9D3C();
      v13 = *(_QWORD *)(v14 - 8);
      (*(void (**)(uint64_t, _QWORD))(v13 + 104))(v15, v12);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v14);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2555E6688);
      sub_2206D9DC0();
      sub_2204CB808();
      sub_2206D9D30();
      v41(v16, v17);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v28[2] + 8))();
  }
}

uint64_t sub_2206C2434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t result;
  uint64_t v14;
  _BYTE *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[12];
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  id v43;
  int v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  uint64_t v50;
  int v51;
  int v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  unsigned int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  unsigned int v65;
  int v66;
  void (*v67)(_BYTE *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  _BYTE *v82;
  unint64_t v83;
  _BYTE *v84;
  unint64_t v85;
  _BYTE *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  _BYTE *v90;
  unint64_t v91;
  _BYTE *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  _BYTE *v97;
  unint64_t v98;
  _BYTE *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  _BYTE *v103;
  unint64_t v104;
  void (*v105)(double);
  uint64_t v106;
  uint64_t v107;
  _BYTE *v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _BYTE *v115;
  _BYTE *v116;

  v73 = a2;
  v100 = a1;
  v74 = "ConfirmNumericSettingIntentStrategy received unsupported parse object: %@.";
  v75 = "ConfirmNumericSettingIntentStrategy userDialogAct is UserCancelled";
  v76 = "ConfirmNumericSettingIntentStrategy userDialogAct is UserRejected";
  v77 = "ConfirmNumericSettingIntentStrategy userDialogAct is UserAccepted";
  v114 = 0;
  v113 = 0;
  v116 = 0;
  v78 = 0;
  v115 = 0;
  v93 = 0;
  v79 = sub_2206D9ED4();
  v80 = *(_QWORD *)(v79 - 8);
  v81 = (*(_QWORD *)(v80 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v82 = &v34[-v81];
  v83 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v4);
  v84 = &v34[-v83];
  v85 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v6);
  v86 = &v34[-v85];
  v87 = sub_2206D9E98();
  v88 = *(_QWORD *)(v87 - 8);
  v89 = (*(_QWORD *)(v88 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v93);
  v90 = &v34[-v89];
  v116 = &v34[-v89];
  v91 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SettingsNLIntent() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v93);
  v92 = &v34[-v91];
  v94 = sub_2206DA690();
  v95 = *(_QWORD *)(v94 - 8);
  v96 = (*(_QWORD *)(v95 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v93);
  v97 = &v34[-v96];
  v98 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v8);
  v99 = &v34[-v98];
  v115 = &v34[-v98];
  v107 = sub_2206D9E74();
  v106 = *(_QWORD *)(v107 - 8);
  v102 = *(_QWORD *)(v106 + 64);
  v101 = (v102 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v107);
  v103 = &v34[-v101];
  v104 = (v102 + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x24BDAC7A8](&v34[-v101]);
  v108 = &v34[-v104];
  v114 = v10;
  v113 = v2;
  v105 = *(void (**)(double))(v11 + 16);
  v105(v9);
  v109 = (*(uint64_t (**)(_BYTE *, uint64_t))(v106 + 88))(v108, v107);
  if (v109 == *MEMORY[0x24BE98E08])
  {
    v12 = v92;
    (*(void (**)(_BYTE *, uint64_t))(v106 + 96))(v108, v107);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v95 + 32))(v99, v108, v94);
    v115 = v99;
    (*(void (**)(_BYTE *))(v95 + 16))(v97);
    sub_2205AF9FC((uint64_t)v97, (uint64_t)v12);
    sub_2205AFA3C(v73);
    sub_220506220((uint64_t)v92);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v95 + 8))(v99, v94);
  }
  if (v109 == *MEMORY[0x24BE98E98])
  {
    v14 = v78;
    v15 = v90;
    (*(void (**)(_BYTE *, uint64_t))(v106 + 96))(v108, v107);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v88 + 32))(v15, v108, v87);
    v116 = v15;
    sub_2206D9E8C();
    v68 = sub_2206D9EC8();
    v67 = *(void (**)(_BYTE *, uint64_t))(v80 + 8);
    v67(v86, v79);
    v112 = v68;
    v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DEA88);
    v70 = sub_220507CE4();
    result = sub_2206DAC90();
    v71 = v14;
    v72 = result;
    if (v14)
    {
      __break(1u);
    }
    else
    {
      v66 = v72;
      sub_22045F510();
      if ((v66 & 1) != 0)
      {
        v61 = sub_2206DAED0();
        v63 = (id)*sub_22053DFA0();
        v16 = v63;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
        v64 = 0;
        v62 = sub_2206DB260();
        sub_2206DAA14();
        swift_bridgeObjectRelease();

        v65 = *MEMORY[0x24BE97128];
        v17 = sub_2206D9A90();
        (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v17 - 8) + 104))(v73, v65);
        return (*(uint64_t (**)(_BYTE *, uint64_t))(v88 + 8))(v90, v87);
      }
      v18 = v71;
      sub_2206D9E8C();
      v58 = sub_2206D9EC8();
      v67(v84, v79);
      v111 = v58;
      result = sub_2206DAC90();
      v59 = v18;
      v60 = result;
      if (!v18)
      {
        v57 = v60;
        sub_22045F510();
        if ((v57 & 1) != 0)
        {
          v52 = sub_2206DAED0();
          v54 = (id)*sub_22053DFA0();
          v19 = v54;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
          v55 = 0;
          v53 = sub_2206DB260();
          sub_2206DAA14();
          swift_bridgeObjectRelease();

          v56 = *MEMORY[0x24BE97118];
          v20 = sub_2206D9A90();
          (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v20 - 8) + 104))(v73, v56);
          return (*(uint64_t (**)(_BYTE *, uint64_t))(v88 + 8))(v90, v87);
        }
        v21 = v59;
        sub_2206D9E8C();
        v50 = sub_2206D9EC8();
        v67(v82, v79);
        v110 = v50;
        result = sub_2206DAC90();
        v51 = result;
        if (!v21)
        {
          v49 = v51;
          sub_22045F510();
          if ((v49 & 1) != 0)
          {
            v44 = sub_2206DAED0();
            v46 = (id)*sub_22053DFA0();
            v22 = v46;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
            v47 = 0;
            v45 = sub_2206DB260();
            sub_2206DAA14();
            swift_bridgeObjectRelease();

            v48 = *MEMORY[0x24BE97120];
            v23 = sub_2206D9A90();
            (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v23 - 8) + 104))(v73, v48);
            return (*(uint64_t (**)(_BYTE *, uint64_t))(v88 + 8))(v90, v87);
          }
          (*(void (**)(_BYTE *, uint64_t))(v88 + 8))(v90, v87);
          goto LABEL_15;
        }
LABEL_19:
        __break(1u);
        return result;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
  v41 = sub_2206DAEDC();
  v43 = (id)*sub_22053DFA0();
  v24 = v43;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  v40 = sub_2206DB260();
  v38 = v25;
  ((void (*)(_BYTE *, uint64_t, uint64_t))v105)(v103, v100, v107);
  v36 = sub_2206DABD0();
  v37 = v26;
  v38[3] = MEMORY[0x24BEE0D00];
  v27 = sub_220464CA0();
  v28 = v36;
  v29 = v37;
  v30 = v38;
  v31 = v27;
  v32 = v40;
  v38[4] = v31;
  *v30 = v28;
  v30[1] = v29;
  sub_22045A844();
  v42 = v32;
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  (*(void (**)(_BYTE *, uint64_t))(v106 + 8))(v108, v107);
LABEL_15:
  v35 = *MEMORY[0x24BE97108];
  v33 = sub_2206D9A90();
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v33 - 8) + 104))(v73, v35);
}

unint64_t sub_2206C2F90()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_2555E9850;
  if (!qword_2555E9850)
  {
    v0 = sub_2206D9A90();
    v1 = MEMORY[0x2207E69C0](MEMORY[0x24BE97140], v0);
    atomic_store(v1, (unint64_t *)&qword_2555E9850);
    return v1;
  }
  return v3;
}

uint64_t sub_2206C3000(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[13] = v2;
  v3[12] = a2;
  v3[11] = a1;
  v3[7] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[10] = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E6688);
  v3[14] = v4;
  v3[15] = *(_QWORD *)(v4 - 8);
  v3[16] = swift_task_alloc();
  sub_2206D9B8C();
  v3[17] = swift_task_alloc();
  v5 = sub_2206D9E20();
  v3[18] = v5;
  v3[19] = *(_QWORD *)(v5 - 8);
  v3[20] = swift_task_alloc();
  v3[8] = a2;
  v3[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2206C3110()
{
  _QWORD *v0;
  id v1;
  _QWORD *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = v0[13];
  v0[7] = v0;
  v4 = (id)*sub_22053DFA0();
  v1 = v4;
  sub_2206DAED0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA08();
  swift_bridgeObjectRelease();

  v0[21] = *(_QWORD *)(v5 + 104);
  swift_retain();
  v9 = sub_2206D9DB4();
  v0[22] = v9;
  v7 = sub_2206D9DC0();
  v0[23] = v7;
  v8 = sub_2206D9DA8();
  v0[24] = v8;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 200) = v2;
  *v2 = *(_QWORD *)(v6 + 56);
  v2[1] = sub_2206C3280;
  return sub_220631368(v9, v7, v8);
}

uint64_t sub_2206C3280(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v5;
  _QWORD *v6;

  v3 = (_QWORD *)*v2;
  v3[7] = *v2;
  v3 += 7;
  v6 = v3 - 5;
  v3[19] = a1;
  v3[20] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    v5 = (void *)v6[21];

    swift_release();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_2206C3370()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0[26];
  v7 = v0[16];
  v6 = v0[15];
  v8 = v0[14];
  v9 = v0[13];
  v4 = v0[12];
  v0[7] = v0;
  v0[10] = v1;
  sub_2206D9B74();
  swift_retain();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v4, v8);
  v5 = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v9;
  *(_QWORD *)(v5 + 24) = v7;
  sub_2206D9DFC();
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  sub_220466BAC(v9 + 152, (uint64_t)(v0 + 2));
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 224) = v2;
  *v2 = *(_QWORD *)(v10 + 56);
  v2[1] = sub_2205EA64C;
  return sub_2206D9CF4();
}

uint64_t sub_2206C34F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD);
  _QWORD v8[2];
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v16 = a1;
  v8[1] = a2;
  v10 = a3;
  v20 = 0;
  v19 = 0;
  v18 = 0;
  v9 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD728) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v16);
  v15 = (uint64_t)v8 - v9;
  v20 = v4;
  v19 = v5;
  v18 = a3;
  v14 = *(_QWORD *)(v5 + 96);
  swift_retain();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E6688);
  v13 = (void *)sub_2206D9DC0();
  v12 = (id)sub_2206D9DA8();
  sub_2205734B4(v13, (uint64_t)v12, v15);

  swift_release();
  v6 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(sub_2206D9C88() - 8) + 56);
  v17 = 1;
  v6(v15, 0);
  sub_2206D9E08();
  return sub_2206D9E14();
}

uint64_t sub_2206C3638(uint64_t a1)
{
  uint64_t v1;

  return sub_2206C34F0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2206C3644(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[7] = v2;
  v3[6] = a2;
  v3[5] = a1;
  v3[2] = v3;
  v3[3] = 0;
  v3[4] = 0;
  v3[3] = a2;
  v3[4] = v2;
  return swift_task_switch();
}

uint64_t sub_2206C3690()
{
  uint64_t v0;
  id v1;
  _QWORD *v2;
  void *v4;
  _QWORD *v5;

  *(_QWORD *)(v0 + 16) = v0;
  v4 = (void *)*sub_22053DFA0();
  v1 = v4;
  sub_2206DAED0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA08();
  swift_bridgeObjectRelease();

  v2 = (_QWORD *)swift_task_alloc();
  v5[8] = v2;
  *v2 = v5[2];
  v2[1] = sub_220509878;
  return sub_2206C3790(v5[5], v5[6]);
}

uint64_t sub_2206C3790(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[13] = v2;
  v3[12] = a2;
  v3[11] = a1;
  v3[7] = v3;
  v3[8] = 0;
  v3[9] = 0;
  v3[10] = 0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E6688);
  v3[14] = v4;
  v3[15] = *(_QWORD *)(v4 - 8);
  v3[16] = swift_task_alloc();
  sub_2206D9B8C();
  v3[17] = swift_task_alloc();
  v5 = sub_2206D9E20();
  v3[18] = v5;
  v3[19] = *(_QWORD *)(v5 - 8);
  v3[20] = swift_task_alloc();
  v3[8] = a2;
  v3[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2206C38A0()
{
  _QWORD *v0;
  id v1;
  _QWORD *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = v0[13];
  v0[7] = v0;
  v4 = (id)*sub_22053DFA0();
  v1 = v4;
  sub_2206DAED0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA08();
  swift_bridgeObjectRelease();

  v0[21] = *(_QWORD *)(v5 + 104);
  swift_retain();
  v9 = sub_2206D9DB4();
  v0[22] = v9;
  v7 = sub_2206D9DC0();
  v0[23] = v7;
  v8 = sub_2206D9DA8();
  v0[24] = v8;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 200) = v2;
  *v2 = *(_QWORD *)(v6 + 56);
  v2[1] = sub_2206C3280;
  return sub_220631D50(v9, v7, v8);
}

uint64_t sub_2206C3A10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2206C13A8(a1, a2, a3);
}

uint64_t sub_2206C3A30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v3 + 16) = v3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = *(_QWORD *)(v3 + 16);
  v4[1] = sub_2204ABFCC;
  return sub_2206C1C08(a1, a2, a3);
}

uint64_t sub_2206C3AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_2204ABFCC;
  return sub_2206C3000(a1, a2);
}

uint64_t sub_2206C3B38()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  v3 = v0;
  *(_QWORD *)(v0 + 16) = v0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v1;
  type metadata accessor for ConfirmNumericSettingIntentStrategy();
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_2204ABFCC;
  return sub_2206D9910();
}

uint64_t type metadata accessor for ConfirmNumericSettingIntentStrategy()
{
  return objc_opt_self();
}

uint64_t sub_2206C3BF0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  v3 = v0;
  *(_QWORD *)(v0 + 16) = v0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v1;
  type metadata accessor for ConfirmNumericSettingIntentStrategy();
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_2204ABFCC;
  return sub_2206D991C();
}

uint64_t sub_2206C3C84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_2204ABFCC;
  return sub_2206C3790(a1, a2);
}

uint64_t sub_2206C3D04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_2204ABFCC;
  return sub_2206C3644(a1, a2);
}

uint64_t sub_2206C3D84()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  v3 = v0;
  *(_QWORD *)(v0 + 16) = v0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v1;
  type metadata accessor for ConfirmNumericSettingIntentStrategy();
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_2204ABFCC;
  return sub_2206D9904();
}

uint64_t sub_2206C3E20(void *a1, uint64_t a2)
{
  uint64_t v2;
  char v6;
  _BYTE v7[40];
  uint64_t v8;
  void *v9;

  v9 = a1;
  v8 = a2;
  type metadata accessor for AuthenticationHandler();
  sub_220466BAC(a2, (uint64_t)v7);
  v2 = sub_220464198();
  sub_2205B8850((uint64_t)v7, v2);
  v6 = sub_2205B8ABC(a1);
  swift_release();
  return v6 & 1;
}

void *type metadata accessor for SettingsDeviceUnlockUtil()
{
  return &unk_24E64CA08;
}

uint64_t *sub_2206C3EC0()
{
  if (qword_2555DC6C0 != -1)
    swift_once();
  return &qword_2555FE460;
}

uint64_t sub_2206C3F14()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetBassReduceHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE460 = result;
  return result;
}

uint64_t type metadata accessor for SetBassReduceHandler()
{
  return objc_opt_self();
}

uint64_t sub_2206C3F74(void *a1, void (*a2)(_QWORD), uint64_t a3)
{
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  char v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  uint64_t v21;
  void *v22;
  id v24;
  char v25;
  uint64_t v26;
  id v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  void (*v32)(_QWORD);
  uint64_t v33;
  void *v34;

  v31 = 0;
  v34 = a1;
  v32 = a2;
  v33 = a3;
  sub_2206DAED0();
  v22 = (void *)*sub_22053C880();
  v3 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  sub_2205BB7F8();
  swift_retain();
  v24 = objc_msgSend(a1, sel_settingMetadata);
  v25 = sub_2205BB8A0(v24);

  swift_release();
  if ((v25 & 1) != 0)
  {
    sub_2206DAEDC();
    v8 = (id)*sub_22053C880();
    v7 = v8;
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_2205F5A2C(3);
    v9 = sub_2205251B4();
    swift_bridgeObjectRelease();
    a2(v9);

    return swift_release();
  }
  else
  {
    v18 = objc_msgSend(a1, sel_settingMetadata);
    if (v18 && (v17 = objc_msgSend(v18, sel_targetDevice), v18, v17))
    {
      v14 = objc_msgSend(v17, sel_deviceCategory);

      v15 = v14;
      v16 = 0;
    }
    else
    {
      v15 = 0;
      v16 = 1;
    }
    v27 = v15;
    v28 = v16 & 1;
    v29 = 6;
    v30 = 0;
    if ((v16 & 1) != 0 || (sub_220465AC4((uint64_t)&v27, (uint64_t)&v26), (v30 & 1) != 0))
    {
      v13 = 0;
    }
    else
    {
      type metadata accessor for INDeviceCategory();
      sub_22045F400();
      v13 = sub_2206DAB88();
    }
    if ((v13 & 1) != 0)
    {
      swift_retain();
      swift_retain();
      swift_retain();
      v4 = a1;
      v12 = (_QWORD *)swift_allocObject();
      v12[2] = v21;
      v12[3] = a2;
      v12[4] = a3;
      v12[5] = a1;
      sub_2204BC798();
      swift_release();
    }
    else
    {
      sub_2206DAEDC();
      v10 = (id)*sub_22053C880();
      v5 = v10;
      sub_2206DB260();
      sub_2206DAA14();
      swift_bridgeObjectRelease();

      swift_retain();
      sub_2205F5A2C(3);
      v11 = sub_2205251B4();
      swift_bridgeObjectRelease();
      a2(v11);

    }
    return swift_release();
  }
}

uint64_t sub_2206C4490(char a1, uint64_t a2, void (*a3)(void), uint64_t a4, void *a5)
{
  id v5;
  uint64_t *v6;
  id v7;
  uint64_t v8;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  id v22;
  id v23;
  id v24;
  char v25;
  BOOL v26;
  uint64_t v32;
  char v34;

  v26 = a1 == 2;
  swift_retain();
  if (a1 == 2)
  {
    swift_retain();
    v25 = sub_2204BC7BC();
    swift_release();
    v34 = v25;
  }
  else
  {
    v34 = a1;
  }
  swift_release();
  if (v34 == 2)
  {
    sub_2206DAEDC();
    v13 = (id)*sub_22053C880();
    v12 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    v14 = sub_220523EEC(7, 0);
    a3();

    return swift_release();
  }
  else
  {
    v24 = objc_msgSend(a5, sel_binaryValue);
    if (v24 == (id)1)
    {
      v32 = 2;
    }
    else if (v24 == (id)2)
    {
      v32 = 1;
    }
    else
    {
      if (v24 != (id)3)
      {
        sub_2206DAEDC();
        v22 = (id)*sub_22053C880();
        v5 = v22;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
        sub_2206DB260();
        v21 = v6;
        v7 = a5;
        sub_22045F23C();
        sub_2204A23A0();
        v19 = sub_2206DABDC();
        v20 = v8;
        v21[3] = MEMORY[0x24BEE0D00];
        v21[4] = sub_220464CA0();
        *v21 = v19;
        v21[1] = v20;
        sub_22045A844();
        sub_2206DAA14();
        swift_bridgeObjectRelease();

        swift_retain();
        v23 = sub_220523EEC(7, 0);
        a3();

        return swift_release();
      }
      v32 = 3;
    }
    v10 = sub_22053536C();
    v15 = *v10;
    v16 = v10[1];
    v17 = *((unsigned __int8 *)v10 + 16);
    v18 = *(_BYTE *)(a2 + 24);
    swift_retain();
    v11 = swift_allocObject();
    *(_BYTE *)(v11 + 16) = v26;
    *(_QWORD *)(v11 + 24) = a2;
    sub_220524C7C(v34 & 1, a5, v15, v16, v17, v18 & 1, a3, a4, (uint64_t)sub_2206C4AE0, v11, v32, 0, 0, 0);
    return sub_2204614E0((uint64_t)sub_2206C4AE0);
  }
}

uint64_t sub_2206C4968()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2206C49B4(char a1)
{
  uint64_t v1;

  return sub_2206C4490(a1, *(_QWORD *)(v1 + 16), *(void (**)(void))(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_2206C49C8(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    swift_retain();
    sub_2204BC920();
  }
  else
  {
    swift_retain();
    sub_2204ADA1C();
  }
  return swift_release();
}

uint64_t sub_2206C4A84(void *a1, void (*a2)(_QWORD), uint64_t a3)
{
  return sub_2206C3F74(a1, a2, a3);
}

uint64_t sub_2206C4AA4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206C4AE0(char a1)
{
  uint64_t v1;

  return sub_2206C49C8(a1 & 1, *(_BYTE *)(v1 + 16) & 1);
}

uint64_t sub_2206C4B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v19 = a1;
  v18 = a2;
  v17 = a3;
  v26 = 0;
  v25 = 0;
  v24 = 0;
  v23 = 0;
  v8[1] = 0;
  v20 = sub_2206DA870();
  v16 = *(_QWORD **)(v20 - 8);
  v10 = v16[8];
  v9 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x24BDAC7A8](0);
  v13 = (uint64_t)v8 - v9;
  v11 = v9;
  MEMORY[0x24BDAC7A8](v3);
  v14 = (uint64_t)v8 - v11;
  v26 = v4;
  v25 = v5;
  v24 = v6;
  type metadata accessor for SettingsNumericSetting.Builder();
  v12 = (void (*)(uint64_t, uint64_t, uint64_t))v16[2];
  v12(v14, v19, v20);
  swift_retain();
  v12(v13, v17, v20);
  v15 = sub_2206C4D18(v14, v18, v13);
  v23 = v15;
  swift_retain();
  v22 = sub_2206C51D8(v15);
  swift_retain();
  v27 = v22;
  swift_release();
  v21 = (void (*)(uint64_t, uint64_t))v16[1];
  v21(v17, v20);
  swift_release();
  v21(v19, v20);
  swift_release();
  return v22;
}

uint64_t type metadata accessor for SettingsNumericSetting.Builder()
{
  uint64_t v1;

  v1 = qword_2555E9BB0;
  if (!qword_2555E9BB0)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_2206C4D18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  return sub_2206C5004(a1, a2, a3);
}

uint64_t sub_2206C4D70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name;
  swift_beginAccess();
  v2 = sub_2206DA870();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v4);
  return swift_endAccess();
}

uint64_t sub_2206C4DDC(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v10 = a1;
  v11 = sub_2206DA870();
  v9 = *(_QWORD *)(v11 - 8);
  v5 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x24BDAC7A8](v11);
  v7 = (char *)&v5 - v5;
  (*(void (**)(double))(v3 + 16))(v2);
  v6 = v1 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name;
  v8 = &v12;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v6, v7, v11);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t (*sub_2206C4EAC())()
{
  swift_beginAccess();
  return sub_220464E08;
}

uint64_t sub_2206C4EF4()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_value);
  swift_beginAccess();
  v3 = *v2;
  swift_retain();
  swift_endAccess();
  return v3;
}

uint64_t sub_2206C4F50(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_retain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_value);
  swift_beginAccess();
  *v3 = a1;
  swift_release();
  swift_endAccess();
  return swift_release();
}

uint64_t (*sub_2206C4FBC())()
{
  swift_beginAccess();
  return sub_220464E08;
}

uint64_t sub_2206C5004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v15 = a1;
  v14 = a2;
  v12 = a3;
  v22 = 0;
  v21 = 0;
  v20 = 0;
  v19 = 0;
  v16 = sub_2206DA870();
  v13 = *(_QWORD *)(v16 - 8);
  v8 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = (uint64_t)&v7 - v8;
  v21 = MEMORY[0x24BDAC7A8](v15);
  v20 = v4;
  v19 = v5;
  swift_retain();
  swift_retain();
  v22 = v3;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  v10(v11, v15, v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v3 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name, v11, v16);
  swift_release();
  swift_retain();
  *(_QWORD *)(v9 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_value) = v14;
  swift_release();
  v10(v11, v12, v16);
  v18 = sub_22069841C(v11);
  swift_retain();
  v22 = v18;
  v17 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v17(v12, v16);
  swift_release();
  v17(v15, v16);
  swift_release();
  return v18;
}

uint64_t sub_2206C5190()
{
  uint64_t v1;

  type metadata accessor for SettingsNumericSetting();
  swift_retain();
  return sub_2206C51D8(v1);
}

uint64_t sub_2206C51D8(uint64_t a1)
{
  swift_allocObject();
  return sub_2206C558C(a1);
}

uint64_t type metadata accessor for SettingsNumericSetting()
{
  uint64_t v1;

  v1 = qword_2555E9AA0;
  if (!qword_2555E9AA0)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_2206C5284()
{
  swift_allocObject();
  return sub_2206C52CC();
}

uint64_t sub_2206C52CC()
{
  uint64_t result;
  uint64_t v1;

  if (!"SiriSettingsIntents.Builder")
  {
    sub_2206DB11C();
    __break(1u);
  }
  result = sub_220530DAC((uint64_t)"SiriSettingsIntents.Builder", 27, (unint64_t)"init(identifier:)", 17, 2, (unint64_t)"SiriSettingsIntents/SettingsNumericSetting.swift", 48, 2, v1, 0xDuLL, 0xBuLL);
  __break(1u);
  return result;
}

uint64_t sub_2206C53E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v3 = OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name;
  v1 = sub_2206DA870();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3);
  return swift_release();
}

uint64_t sub_2206C5448()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  v3 = sub_2206984E0();
  v2 = OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name;
  v0 = sub_2206DA870();
  (*(void (**)(uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v3 + v2);
  swift_release();
  return v3;
}

uint64_t sub_2206C54BC()
{
  sub_2206C5448();
  return swift_deallocClassInstance();
}

uint64_t sub_2206C54FC()
{
  return sub_2206DAC30();
}

uint64_t SettingsNumericSetting.name.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name;
  v2 = sub_2206DA870();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t sub_2206C558C(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;

  v15 = a1;
  v20 = 0;
  v19 = 0;
  v8 = sub_2206DA870();
  v6 = *(_QWORD *)(v8 - 8);
  v3 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (char *)&v3 - v3;
  v19 = MEMORY[0x24BDAC7A8](v15);
  swift_retain();
  swift_retain();
  v20 = v1;
  v4 = v15 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_name;
  v5 = &v18;
  v9 = 32;
  v10 = 0;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v7, v4, v8);
  swift_endAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v1 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name, v7, v8);
  swift_release();
  v11 = (uint64_t *)(v15 + OBJC_IVAR____TtCC19SiriSettingsIntents22SettingsNumericSetting7Builder_value);
  v12 = &v17;
  swift_beginAccess();
  v13 = *v11;
  swift_retain();
  swift_endAccess();
  *(_QWORD *)(v14 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_value) = v13;
  swift_release();
  swift_retain();
  v16 = sub_2206986B8(v15);
  swift_retain();
  v20 = v16;
  swift_release();
  swift_release();
  return v16;
}

uint64_t sub_2206C5734@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;

  swift_bridgeObjectRetain();
  sub_2206DAC30();
  swift_bridgeObjectRetain();
  v9 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = v8 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name;
    v6 = sub_2206DA870();
    a1[3] = v6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(boxed_opaque_existential_1, v5);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2206DAC30();
    swift_bridgeObjectRetain();
    v4 = sub_2206DAC3C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v4 & 1) != 0)
    {
      v3 = *(_QWORD *)(v8 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_value);
      swift_retain();
      result = sub_2206DA774();
      a1[3] = result;
      *a1 = v3;
    }
    else
    {
      swift_retain();
      sub_2206987B4(a1);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2206C5940()
{
  sub_2206C5988();
  return sub_2206DB284() & 1;
}

unint64_t sub_2206C5988()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9A58;
  if (!qword_2555E9A58)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EAFB4, &unk_24E64CB20);
    atomic_store(v0, (unint64_t *)&qword_2555E9A58);
    return v0;
  }
  return v2;
}

uint64_t sub_2206C59F4()
{
  sub_2206C5988();
  return sub_2206DACB4();
}

uint64_t sub_2206C5A30()
{
  sub_2206C5988();
  return sub_2206DACCC();
}

uint64_t sub_2206C5A74()
{
  sub_2206C5988();
  return sub_2206DACC0();
}

uint64_t sub_2206C5AB8()
{
  sub_2206C5AE4();
  return sub_2206DB344();
}

unint64_t sub_2206C5AE4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9A60;
  if (!qword_2555E9A60)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EAF64, &unk_24E64CB20);
    atomic_store(v0, (unint64_t *)&qword_2555E9A60);
    return v0;
  }
  return v2;
}

uint64_t sub_2206C5B50()
{
  sub_2206C5AE4();
  return sub_2206DB350();
}

uint64_t sub_2206C5B7C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  swift_allocObject();
  v5 = sub_2206C5C08(a1);
  if (v3)
    return v2;
  else
    return v5;
}

uint64_t sub_2206C5C08(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
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
  int v20;
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
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43[8];
  char v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char *v50;

  v36 = a1;
  v50 = 0;
  v48 = 0;
  v47 = 0;
  v29 = sub_2206DA870();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = (*(_QWORD *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)v9 - v31;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E9A68);
  v34 = *(_QWORD *)(v33 - 8);
  v35 = (*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v36);
  v37 = (char *)v9 - v35;
  v50 = (char *)v9 - v35;
  v49 = 0;
  v47 = v2;
  swift_retain();
  swift_retain();
  v48 = v1;
  v39 = v36[3];
  v40 = v36[4];
  __swift_project_boxed_opaque_existential_1(v36, v39);
  sub_2206C5AE4();
  v3 = v38;
  sub_2206DB32C();
  v41 = v3;
  v42 = v3;
  if (v3)
  {
    v13 = v42;
    swift_release();
    swift_release();
    v14 = v13;
  }
  else
  {
    v25 = &v46;
    v46 = 0;
    sub_22054BDB0();
    v4 = v41;
    sub_2206DB1B8();
    v26 = v4;
    v27 = v4;
    if (v4)
    {
      v12 = v27;
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
      v14 = v12;
    }
    else
    {
      v20 = 1;
      v49 = 1;
      (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v28 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name, v32, v29);
      swift_release();
      v22 = sub_2206DA774();
      v21 = &v44;
      v44 = v20;
      sub_2205F5220();
      v5 = v26;
      sub_2206DB1B8();
      v23 = v5;
      v24 = v5;
      if (v5)
      {
        v11 = v24;
        swift_release();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
        v14 = v11;
      }
      else
      {
        v49 = 3;
        *(_QWORD *)(v28 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_value) = v45;
        swift_release();
        v16 = v43;
        sub_220466BAC((uint64_t)v36, (uint64_t)v43);
        v6 = v23;
        v49 = 7;
        v7 = SettingsSetting.init(from:)((uint64_t)v16);
        v17 = v6;
        v18 = v7;
        v19 = v6;
        if (!v6)
        {
          v15 = v18;
          swift_retain();
          v48 = v15;
          (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
          swift_release();
          return v15;
        }
        v10 = v19;
        (*(void (**)(char *, uint64_t))(v34 + 8))(v37, v33);
        v14 = v10;
      }
    }
  }
  v9[2] = v14;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
  if ((v49 & 4) == 0)
  {
    if ((v49 & 1) != 0)
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v48 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name, v29);
    if ((v49 & 2) != 0)
      swift_release();
    v9[1] = v48;
    type metadata accessor for SettingsNumericSetting();
    swift_deallocPartialClassInstance();
  }
  return v9[0];
}

uint64_t sub_2206C60F8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;

  v32 = a1;
  v40 = 0;
  v39 = 0;
  v38 = 0;
  v23 = sub_2206DA870();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = (*(_QWORD *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)v8 - v25;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555E9A70);
  v3 = v27;
  v28 = v2;
  v29 = *(_QWORD *)(v2 - 8);
  v30 = (*(_QWORD *)(v29 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v32);
  v31 = (char *)v8 - v30;
  v40 = (char *)v8 - v30;
  v39 = v4;
  v38 = v1;
  swift_retain();
  sub_220698C24((uint64_t)v32);
  v33 = v3;
  v34 = v3;
  if (v3)
  {
    v9 = v34;
    result = swift_release();
    v10 = v9;
  }
  else
  {
    swift_release();
    v17 = v32[3];
    v18 = v32[4];
    __swift_project_boxed_opaque_existential_1(v32, v17);
    sub_2206C5AE4();
    sub_2206DB338();
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, v22 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name, v23);
    v19 = &v37;
    v37 = 0;
    sub_22054C0F0();
    v5 = v33;
    sub_2206DB224();
    v20 = v5;
    v21 = v5;
    if (v5)
    {
      v8[1] = v21;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v31, v28);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      v11 = *(_QWORD *)(v22 + OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_value);
      swift_retain();
      v14 = &v36;
      v36 = v11;
      v12 = &v35;
      v35 = 1;
      v13 = sub_2206DA774();
      sub_2205F5290();
      v6 = v20;
      sub_2206DB224();
      v15 = v6;
      v16 = v6;
      if (v6)
        v8[0] = v16;
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v31, v28);
    }
  }
  return result;
}

uint64_t sub_2206C6438()
{
  swift_allocObject();
  return sub_2206C6480();
}

uint64_t sub_2206C6480()
{
  uint64_t result;
  uint64_t v1;

  if (!"SiriSettingsIntents.SettingsNumericSetting")
  {
    sub_2206DB11C();
    __break(1u);
  }
  result = sub_220530DAC((uint64_t)"SiriSettingsIntents.SettingsNumericSetting", 42, (unint64_t)"init(builder:)", 14, 2, (unint64_t)"SiriSettingsIntents/SettingsNumericSetting.swift", 48, 2, v1, 0xBuLL, 0xEuLL);
  __break(1u);
  return result;
}

uint64_t sub_2206C6594()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v3 = OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name;
  v1 = sub_2206DA870();
  (*(void (**)(uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3);
  return swift_release();
}

uint64_t SettingsNumericSetting.deinit()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  v3 = SettingsSetting.deinit();
  v2 = OBJC_IVAR____TtC19SiriSettingsIntents22SettingsNumericSetting_name;
  v0 = sub_2206DA870();
  (*(void (**)(uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v3 + v2);
  swift_release();
  return v3;
}

uint64_t SettingsNumericSetting.__deallocating_deinit()
{
  SettingsNumericSetting.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2206C66AC()
{
  return type metadata accessor for SettingsNumericSetting();
}

uint64_t sub_2206C66C4()
{
  unint64_t v0;
  uint64_t updated;

  updated = sub_2206DA870();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

uint64_t method lookup function for SettingsNumericSetting()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2206C67A8()
{
  return type metadata accessor for SettingsNumericSetting.Builder();
}

uint64_t sub_2206C67C0()
{
  unint64_t v0;
  uint64_t updated;

  updated = sub_2206DA870();
  if (v0 <= 0x3F)
  {
    updated = swift_updateClassMetadata2();
    if (!updated)
      return 0;
  }
  return updated;
}

void *type metadata accessor for SettingsNumericSetting.CodingKeys()
{
  return &unk_24E64CB20;
}

unint64_t sub_2206C689C()
{
  return sub_2206C68B0();
}

unint64_t sub_2206C68B0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9CA0;
  if (!qword_2555E9CA0)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EAF3C, &unk_24E64CB20);
    atomic_store(v0, (unint64_t *)&qword_2555E9CA0);
    return v0;
  }
  return v2;
}

unint64_t sub_2206C691C()
{
  return sub_2206C6930();
}

unint64_t sub_2206C6930()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9CA8;
  if (!qword_2555E9CA8)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EAEAC, &unk_24E64CB20);
    atomic_store(v0, (unint64_t *)&qword_2555E9CA8);
    return v0;
  }
  return v2;
}

unint64_t sub_2206C699C()
{
  return sub_2206C69B0();
}

unint64_t sub_2206C69B0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555E9CB0;
  if (!qword_2555E9CB0)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EAED4, &unk_24E64CB20);
    atomic_store(v0, (unint64_t *)&qword_2555E9CB0);
    return v0;
  }
  return v2;
}

uint64_t *sub_2206C6A1C()
{
  if (qword_2555DC6C8 != -1)
    swift_once();
  return &qword_2555FE488;
}

uint64_t sub_2206C6A70()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetFlashlightHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE488 = result;
  return result;
}

uint64_t type metadata accessor for SetFlashlightHandler()
{
  return objc_opt_self();
}

uint64_t sub_2206C6AD0(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  id v4;
  id v5;
  id v6;
  float v8;
  uint64_t *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char v20;
  float v21;
  float v22;
  char v23;
  id v24;
  id v25;
  id v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  BOOL v32;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  float v39;

  sub_2206DAED0();
  v37 = (void *)*sub_22053C880();
  v3 = v37;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  v38 = sub_2204B425C();
  swift_release();
  usleep(0x30D40u);
  if ((sub_2204B4374() & 1) != 0)
  {
    if ((sub_2204B447C() & 1) != 0)
    {
      v32 = sub_2204B4548() > 0.0;
      v31 = sub_2204B43B0();
      v4 = a1;
      if (v32)
      {
        v28 = 0;
      }
      else
      {
        objc_msgSend(a1, sel_binaryValue);
        type metadata accessor for INBinarySettingValue();
        sub_220460C28();
        v30 = sub_2206DB284();
        v5 = a1;
        if ((v30 & 1) != 0)
        {
          v29 = 1;
        }
        else
        {
          objc_msgSend(a1, sel_binaryValue);
          v29 = sub_2206DB284();
        }

        v28 = v29;
      }

      if ((v28 & 1) != 0)
        v27 = v31;
      else
        v27 = 0;
      if ((v27 & 1) != 0)
      {
        sub_2206DAED0();
        v25 = (id)*sub_22053C880();
        v6 = v25;
        sub_2206DB260();
        sub_2206DAA14();
        swift_bridgeObjectRelease();

        swift_retain();
        sub_2205F5A2C(5);
        v26 = sub_2205251B4();
        swift_bridgeObjectRelease();
        ((void (*)(id))a2)(v26);

        swift_release();
        return swift_release();
      }
      else
      {
        v24 = sub_2204B4624();
        if (v24)
        {
          objc_msgSend(v24, sel_floatValue);
          v21 = v8;

          v22 = v21;
          v23 = 0;
        }
        else
        {
          v22 = 0.0;
          v23 = 1;
        }
        if ((v23 & 1) != 0)
          v39 = 1.0;
        else
          v39 = v22;
        v9 = sub_2205355CC();
        v17 = *v9;
        v18 = v9[1];
        v19 = *((unsigned __int8 *)v9 + 16);
        v20 = *(_BYTE *)(v36 + 24);
        swift_retain();
        v10 = swift_allocObject();
        *(_QWORD *)(v10 + 16) = v38;
        *(float *)(v10 + 24) = v39;
        sub_220524C7C(v32, a1, v17, v18, v19, v20 & 1, a2, a3, (uint64_t)sub_2206C728C, v10, 0, 1, 0, 0);
        sub_2204614E0((uint64_t)sub_2206C728C);
        return swift_release();
      }
    }
    else
    {
      sub_2206DAED0();
      v15 = (id)*sub_22053C880();
      v11 = v15;
      sub_2206DB260();
      sub_2206DAA14();
      swift_bridgeObjectRelease();

      swift_retain();
      v16 = sub_220523EEC(7, 0);
      a2();

      swift_release();
      return swift_release();
    }
  }
  else
  {
    sub_2206DAED0();
    v13 = (id)*sub_22053C880();
    v12 = v13;
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_2205F5A2C(3);
    v14 = sub_2205251B4();
    swift_bridgeObjectRelease();
    ((void (*)(id))a2)(v14);

    swift_release();
    return swift_release();
  }
}

uint64_t sub_2206C71A4(char a1, float a2)
{
  if ((a1 & 1) != 0)
    return sub_2204B464C(a2);
  else
    return sub_2204B464C(0.0);
}

uint64_t sub_2206C7250()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206C728C(char a1)
{
  uint64_t v1;

  return sub_2206C71A4(a1 & 1, *(float *)(v1 + 24));
}

uint64_t sub_2206C72B8(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_2206C6AD0(a1, a2, a3);
}

uint64_t *sub_2206C72D8()
{
  if (qword_2555DC6D8 != -1)
    swift_once();
  return &qword_2555E9D68;
}

uint64_t *sub_2206C732C()
{
  if (qword_2555DC6D0 != -1)
    swift_once();
  return &qword_2555FE490;
}

uint64_t sub_2206C7380()
{
  uint64_t result;
  _BYTE v1[40];

  type metadata accessor for GetStandByHandler();
  sub_2204CBB6C((uint64_t)v1);
  result = sub_220528670(1, (uint64_t)v1);
  qword_2555FE490 = result;
  return result;
}

void sub_2206C73D0(void *a1, void (*a2)(_QWORD), uint64_t a3)
{
  id v3;
  unint64_t v4;
  char v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  uint64_t v18;
  id v19;
  id v21;
  char v22;
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;
  id v27;
  char v28;
  uint64_t v29;
  char v30;
  void *v31;
  id v32;
  uint64_t v33;
  void (*v34)(_QWORD);
  uint64_t v35;
  void *v36;

  v33 = 0;
  v36 = a1;
  v34 = a2;
  v35 = a3;
  sub_220464B68();
  v19 = sub_22045CFB4(7, 0);
  v32 = v19;
  v3 = a1;
  v31 = a1;
  v4 = sub_2204A7234();
  v21 = SettingIntent.deviceCategory.getter(v4, (uint64_t)&protocol witness table for INGetSettingIntent);
  v22 = v5;

  v27 = v21;
  v28 = v22 & 1;
  v29 = 1;
  v30 = 0;
  if ((v22 & 1) != 0 || (sub_220465AC4((uint64_t)&v27, (uint64_t)&v23), (v30 & 1) != 0))
  {
    v16 = 0;
  }
  else
  {
    type metadata accessor for INDeviceCategory();
    sub_22045F400();
    v16 = sub_2206DAB88();
  }
  swift_retain();
  if ((v16 & 1) != 0)
  {
    sub_220466BAC(v18 + 24, (uint64_t)v24);
    v13 = v25;
    v12 = v26;
    __swift_project_boxed_opaque_existential_1(v24, v25);
    v14 = (*(uint64_t (**)(uint64_t))(v12 + 48))(v13);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v24);
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  swift_release();
  sub_2206DAED0();
  if ((v15 & 1) != 0)
  {
    v10 = (id)*sub_22053C880();
    v6 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    sub_2205F5A2C(22);
    v11 = (id)sub_2206DAB94();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setErrorDetail_, v11);

  }
  else
  {
    v8 = (id)*sub_22053C880();
    v7 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    sub_2205F5A2C(16);
    v9 = (id)sub_2206DAB94();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setErrorDetail_, v9);

  }
  swift_retain();
  a2(v19);
  swift_release();

}

void sub_2206C77C4(void *a1, void (*a2)(_QWORD), uint64_t a3)
{
  sub_2206C73D0(a1, a2, a3);
}

uint64_t sub_2206C77E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  type metadata accessor for StandBySettings();
  v0 = sub_2206C7860();
  result = sub_2206C788C(v0, v1);
  qword_2555E9D68 = result;
  return result;
}

uint64_t type metadata accessor for GetStandByHandler()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for StandBySettings()
{
  return objc_opt_self();
}

uint64_t sub_2206C7860()
{
  return sub_2206DAC30();
}

uint64_t sub_2206C788C(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return sub_2206C79A4(a1, a2);
}

uint64_t static StandBySettings.shared.getter()
{
  uint64_t v1;

  v1 = *sub_2206C72D8();
  swift_retain();
  return v1;
}

uint64_t sub_2206C7910()
{
  uint64_t result;
  uint64_t v1;

  result = sub_2206DAC30();
  qword_2555FE498 = result;
  qword_2555FE4A0 = v1;
  return result;
}

uint64_t *sub_2206C7950()
{
  if (qword_2555DC6E0 != -1)
    swift_once();
  return &qword_2555FE498;
}

uint64_t sub_2206C79A4(uint64_t a1, uint64_t a2)
{
  uint64_t v5;

  sub_2204C8B54();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v5 + 16) = sub_2204BC8DC(a1, a2);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2206C7A20(uint64_t a1)
{
  id v1;
  id v3;
  unsigned __int8 v4;
  char v5;
  BOOL v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  _BYTE v11[32];
  _QWORD v12[3];
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v17 = 0;
  v14 = 0;
  v18 = a1;
  v16 = a1;
  v15 = 1;
  type metadata accessor for INDeviceCategory();
  sub_220460B48();
  if ((sub_2206DB284() & 1) == 0)
  {
    v5 = 0;
    return v5 & 1;
  }
  v9 = *(void **)(v10 + 16);
  v1 = v9;
  if (!v9)
    goto LABEL_11;
  v14 = v9;
  sub_2206C7950();
  swift_bridgeObjectRetain();
  v7 = (id)sub_2206DAB94();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v9, sel_objectForKey_, v7);

  if (v8)
  {
    sub_2206DAFF0();
    sub_2204C911C((uint64_t)v11, (uint64_t)v12);
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v13 = 0;
  }
  v6 = v13 != 0;
  sub_2204A1FA8((uint64_t)v12);
  if (!v6)
  {

LABEL_11:
    v5 = 1;
    return v5 & 1;
  }
  sub_2206C7950();
  swift_bridgeObjectRetain();
  v3 = (id)sub_2206DAB94();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v9, sel_BOOLForKey_, v3);

  v5 = v4;
  return v5 & 1;
}

uint64_t StandBySettings.deinit()
{
  uint64_t v0;
  uint64_t v2;

  sub_2204ACB4C((id *)(v0 + 16));
  return v2;
}

uint64_t StandBySettings.__deallocating_deinit()
{
  StandBySettings.deinit();
  return swift_deallocClassInstance();
}

uint64_t method lookup function for StandBySettings()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StandBySettings.standByEnabled(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))() & 1;
}

uint64_t *sub_2206C7D30()
{
  if (qword_2555DC6E8 != -1)
    swift_once();
  return &qword_2555FE4A8;
}

uint64_t sub_2206C7D84()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for GetAssistiveTouchHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE4A8 = result;
  return result;
}

uint64_t type metadata accessor for GetAssistiveTouchHandler()
{
  return objc_opt_self();
}

void sub_2206C7DE4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v13;
  int v14;
  id v15;
  char v16;
  _BYTE v17[16];
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = a1;
  v23 = a2;
  v24 = a3;
  v22 = v3;
  sub_2206DAED0();
  v8 = (id)*sub_22053C880();
  v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v5 = sub_220532D78();
  v9 = *v5;
  v13 = v5[1];
  v14 = *((unsigned __int8 *)v5 + 16);
  v15 = (id)*sub_22053C880();
  v6 = v15;
  v16 = *(_BYTE *)(v3 + 24);
  swift_retain();
  v7 = a1;
  swift_retain();
  v18 = v3;
  v19 = a1;
  v20 = a2;
  v21 = a3;
  sub_220531F08(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_2206C8264, (uint64_t)v17, MEMORY[0x24BEE4AE0] + 8, v3);
  swift_release();

  swift_release();
}

void sub_2206C7F98(uint64_t a1, void *a2, void (*a3)(id))
{
  id *v3;
  id v4;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  id v15;
  id *v17;
  BOOL v18;
  id v19;

  swift_retain();
  v18 = sub_2204AE918();
  swift_release();
  sub_220464B68();
  v15 = sub_22045CFB4(3, 0);
  sub_220464BCC();
  sub_2206DB260();
  v17 = v3;
  v19 = objc_msgSend(a2, sel_settingMetadata);
  if (v18)
    v13 = 1;
  else
    v13 = 2;
  *v17 = sub_2205AF06C(v19, 0, 0, v13, 0, 0);
  sub_22045A844();
  v8 = (id)sub_2206DACE4();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setSettingResponseDatas_, v8);

  sub_2206DAED0();
  v12 = (id)*sub_22053C880();
  v4 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  v11 = v5;
  v6 = v15;
  sub_220464C30();
  v9 = sub_2206DABDC();
  v10 = v7;
  v11[3] = MEMORY[0x24BEE0D00];
  v11[4] = sub_220464CA0();
  *v11 = v9;
  v11[1] = v10;
  sub_22045A844();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v15);
  swift_release();

}

void sub_2206C8264()
{
  uint64_t v0;

  sub_2206C7F98(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_2206C8294(void *a1, uint64_t a2, uint64_t a3)
{
  sub_2206C7DE4(a1, a2, a3);
}

uint64_t *sub_2206C82B4()
{
  if (qword_2555DC6F0 != -1)
    swift_once();
  return &qword_2555FE4B0;
}

uint64_t sub_2206C8308()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for GetPersonalHotspotHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE4B0 = result;
  return result;
}

uint64_t type metadata accessor for GetPersonalHotspotHandler()
{
  return objc_opt_self();
}

void sub_2206C8368(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[6];
  _DWORD v18[6];
  id v19;
  id v20;
  int v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  id v29;
  _DWORD *v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  int v37;
  id v38;
  void (*v39)(void);
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(void);
  uint64_t v48;
  void *v49;

  v38 = a1;
  v39 = a2;
  v40 = a3;
  v41 = v3;
  v42 = "GetPersonalHotspotHandler handling intent; Siri cannot change setting: Personal Hotspot";
  v43 = "GetPersonalHotspotHandler handling intent";
  v44 = "Device doesn't support personal hotspot.";
  v45 = 0;
  v49 = a1;
  v47 = a2;
  v48 = a3;
  v46 = v3;
  sub_2205BDCCC();
  if (SettingsFeatureFlagsImpl.isGetSetHotspotEnabled()())
  {
    v33 = sub_2206DAED0();
    v35 = (id)*sub_22053C880();
    v4 = v35;
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    v34 = sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v36 = *(_QWORD *)(v41 + 16);
    swift_retain();
    v37 = sub_2204AE618();
    swift_release();
    if ((v37 & 1) != 0)
    {
      v5 = v25;
      v6 = sub_220532CE0();
      v26 = *v6;
      v27 = v6[1];
      v28 = *((unsigned __int8 *)v6 + 16);
      v29 = (id)*sub_22053C880();
      v7 = v29;
      v31 = *(unsigned __int8 *)(v41 + 24);
      v8 = v38;
      swift_retain();
      swift_retain();
      v30 = v18;
      MEMORY[0x24BDAC7A8](v26);
      v17[2] = v9;
      v17[3] = v41;
      v17[4] = v39;
      v17[5] = v10;
      sub_220531F08(v11, v12, v13, v14, v31 & 1, (void (*)(uint64_t))sub_2206C8E3C, (uint64_t)v17, MEMORY[0x24BEE4AE0] + 8, v5);

      swift_release();
      swift_release();

    }
    else
    {
      v21 = sub_2206DAEDC();
      v23 = (id)*sub_22053C880();
      v15 = v23;
      v22 = sub_2206DB260();
      sub_2206DAA14();
      swift_bridgeObjectRelease();

      swift_retain();
      sub_220464B68();
      v24 = sub_22045CFB4(6, 0);
      v39();

      swift_release();
    }
  }
  else
  {
    v18[3] = sub_2206DAED0();
    v19 = (id)*sub_22053C880();
    v16 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_2205F5A2C(16);
    v20 = sub_2205AF264();
    swift_bridgeObjectRelease();
    ((void (*)(id))v39)(v20);

    swift_release();
  }
}

void sub_2206C8768(void *a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id *v12;
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  id v23;
  id *v24;
  id v25;
  char v26;
  id v27;
  id v28;
  char v29;
  char v30;
  char v31;
  id v32;
  char v33;
  char v34;
  char v35;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  _QWORD v47[3];
  uint64_t v48;
  char v49;
  void *v50;
  void (*v51)(void);
  uint64_t v52;
  uint64_t v53;
  void *v54;

  v46 = 0;
  v43 = 0;
  v44 = 0;
  v54 = a1;
  v53 = a2;
  v51 = a3;
  v52 = a4;
  v4 = a1;
  v50 = a1;
  v5 = sub_2204A7234();
  v39 = SettingIntent.settingIdentifier.getter(v5, (uint64_t)&protocol witness table for INGetSettingIntent);
  v40 = v6;

  swift_bridgeObjectRetain();
  v49 = 36;
  BinarySettingIdentifier.rawValue.getter();
  v38 = v7;
  v41 = v8;
  swift_bridgeObjectRetain();
  v47[0] = v39;
  v47[1] = v40;
  v47[2] = v38;
  v48 = v41;
  if (v40)
  {
    sub_2204A2364(v47, &v42);
    if (v48)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v34 = sub_2206DAC3C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_220461C68();
      v35 = v34;
      goto LABEL_7;
    }
    sub_220461C68();
    goto LABEL_9;
  }
  if (v48)
  {
LABEL_9:
    sub_2204A2114();
    v35 = 0;
    goto LABEL_7;
  }
  sub_220461C68();
  v35 = 1;
LABEL_7:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v35 & 1) != 0)
  {
    swift_retain();
    v33 = sub_2204AE3A8();
    swift_release();
    if ((v33 & 1) != 0)
      sub_2205F5A2C(15);
    else
      sub_2205F5A2C(11);
    v43 = v9;
    v44 = v10;
    swift_retain();
    sub_2204AE2C4(1);
    swift_release();
    swift_retain();
    v32 = sub_2205AF264();
    a3();

    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_retain();
    v31 = sub_2204AE318();
    swift_release();
    swift_retain();
    if ((v31 & 1) != 0)
    {
      swift_retain();
      v29 = sub_2204AE3A8();
      swift_release();
      v30 = v29 ^ 1;
    }
    else
    {
      v30 = 0;
    }
    swift_release();
    if ((v30 & 1) != 0)
    {
      sub_2206DAED0();
      v27 = (id)*sub_22053C880();
      v11 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
      sub_2206DB260();
      sub_2206DAA14();
      swift_bridgeObjectRelease();

      swift_retain();
      sub_2204AE354(1);
      swift_release();
      swift_retain();
      sub_2205F5A2C(11);
      v28 = sub_2205AF264();
      swift_bridgeObjectRelease();
      ((void (*)(id))a3)(v28);

      swift_release();
    }
    else
    {
      sub_220464B68();
      v23 = sub_22045CFB4(3, 0);
      v46 = v23;
      sub_220464BCC();
      sub_2206DB260();
      v24 = v12;
      v25 = objc_msgSend(a1, sel_settingMetadata);
      swift_retain();
      v26 = sub_2204AE318();
      swift_release();
      if ((v26 & 1) != 0)
        v22 = 1;
      else
        v22 = 2;
      *v24 = sub_2205AF06C(v25, 0, 0, v22, 0, 0);
      sub_22045A844();
      v17 = (id)sub_2206DACE4();
      swift_bridgeObjectRelease();
      objc_msgSend(v23, sel_setSettingResponseDatas_, v17);

      sub_2206DAED0();
      v21 = (id)*sub_22053C880();
      v13 = v21;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
      sub_2206DB260();
      v20 = v14;
      v15 = v23;
      v45 = v23;
      sub_220464C30();
      v18 = sub_2206DABDC();
      v19 = v16;
      v20[3] = MEMORY[0x24BEE0D00];
      v20[4] = sub_220464CA0();
      *v20 = v18;
      v20[1] = v19;
      sub_22045A844();
      sub_2206DAA14();
      swift_bridgeObjectRelease();

      swift_retain();
      ((void (*)(id))a3)(v23);
      swift_release();

    }
  }
}

void sub_2206C8E3C()
{
  uint64_t v0;

  sub_2206C8768(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(void))(v0 + 32), *(_QWORD *)(v0 + 40));
}

void sub_2206C8E6C(void *a1, void (*a2)(void), uint64_t a3)
{
  sub_2206C8368(a1, a2, a3);
}

uint64_t *sub_2206C8E8C()
{
  if (qword_2555DC6F8 != -1)
    swift_once();
  return &qword_2555FE4B8;
}

uint64_t sub_2206C8EE0()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for GetAirplaneModeHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE4B8 = result;
  return result;
}

uint64_t type metadata accessor for GetAirplaneModeHandler()
{
  return objc_opt_self();
}

void sub_2206C8F40(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v4;
  uint64_t *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v13;
  int v14;
  id v15;
  char v16;
  _BYTE v17[16];
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = a1;
  v23 = a2;
  v24 = a3;
  v22 = v3;
  sub_2206DAED0();
  v8 = (id)*sub_22053C880();
  v4 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v5 = sub_220532C48();
  v9 = *v5;
  v13 = v5[1];
  v14 = *((unsigned __int8 *)v5 + 16);
  v15 = (id)*sub_22053C880();
  v6 = v15;
  v16 = *(_BYTE *)(v3 + 24);
  swift_retain();
  v7 = a1;
  swift_retain();
  v18 = v3;
  v19 = a1;
  v20 = a2;
  v21 = a3;
  sub_220531F08(v9, v13, v14, (uint64_t)v15, v16 & 1, (void (*)(uint64_t))sub_2206C93C0, (uint64_t)v17, MEMORY[0x24BEE4AE0] + 8, v3);
  swift_release();

  swift_release();
}

void sub_2206C90F4(uint64_t a1, void *a2, void (*a3)(id))
{
  id *v3;
  id v4;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  id v15;
  id *v17;
  char v18;
  id v19;

  swift_retain();
  v18 = sub_2204AE000();
  swift_release();
  sub_220464B68();
  v15 = sub_22045CFB4(3, 0);
  sub_220464BCC();
  sub_2206DB260();
  v17 = v3;
  v19 = objc_msgSend(a2, sel_settingMetadata);
  if ((v18 & 1) != 0)
    v13 = 1;
  else
    v13 = 2;
  *v17 = sub_2205AF06C(v19, 0, 0, v13, 0, 0);
  sub_22045A844();
  v8 = (id)sub_2206DACE4();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setSettingResponseDatas_, v8);

  sub_2206DAED0();
  v12 = (id)*sub_22053C880();
  v4 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  v11 = v5;
  v6 = v15;
  sub_220464C30();
  v9 = sub_2206DABDC();
  v10 = v7;
  v11[3] = MEMORY[0x24BEE0D00];
  v11[4] = sub_220464CA0();
  *v11 = v9;
  v11[1] = v10;
  sub_22045A844();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  a3(v15);
  swift_release();

}

void sub_2206C93C0()
{
  uint64_t v0;

  sub_2206C90F4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(id))(v0 + 32));
}

void sub_2206C93F0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_2206C8F40(a1, a2, a3);
}

uint64_t *sub_2206C9410()
{
  if (qword_2555DC700 != -1)
    swift_once();
  return &qword_2555FE4C0;
}

uint64_t sub_2206C9464()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetAutoAnswerHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE4C0 = result;
  return result;
}

uint64_t type metadata accessor for SetAutoAnswerHandler()
{
  return objc_opt_self();
}

uint64_t sub_2206C94C4(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  uint64_t *v4;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;

  sub_2206DAED0();
  v6 = (id)*sub_22053C880();
  v3 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  v8 = sub_2204B5454();
  swift_release();
  v4 = sub_220534704();
  v10 = *v4;
  v11 = v4[1];
  v12 = *((unsigned __int8 *)v4 + 16);
  v13 = *(_BYTE *)(v7 + 24);
  swift_retain();
  sub_220524C7C(v8 & 1, a1, v10, v11, v12, v13 & 1, a2, a3, (uint64_t)sub_2206C96C0, v7, 0, 1, 0, 0);
  return sub_2204614E0((uint64_t)sub_2206C96C0);
}

uint64_t sub_2206C9654(char a1)
{
  swift_retain();
  sub_2204B54BC(a1 & 1);
  return swift_release();
}

uint64_t sub_2206C96C0(char a1)
{
  return sub_2206C9654(a1 & 1);
}

uint64_t sub_2206C96E4(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_2206C94C4(a1, a2, a3);
}

uint64_t sub_2206C9704()
{
  return sub_2206C971C() & 1;
}

uint64_t sub_2206C971C()
{
  return 0;
}

uint64_t *sub_2206C973C()
{
  if (qword_2555DC708 != -1)
    swift_once();
  return &qword_2555EA190;
}

id sub_2206C9790()
{
  uint64_t v0;
  id result;
  uint64_t v2;
  uint64_t v3;

  type metadata accessor for SetNumericIntentHandler();
  v3 = sub_220546830();
  v2 = sub_22054685C();
  v0 = sub_2206C980C();
  result = sub_2206C9838(v3, v2, v0);
  qword_2555EA190 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for SetNumericIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_2206C980C()
{
  uint64_t v1;

  v1 = *sub_22046203C();
  swift_retain();
  return v1;
}

id sub_2206C9838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v4;

  v4 = objc_allocWithZone(v3);
  return sub_2206C98B4(a1, a2, a3);
}

void *static SetNumericIntentHandler.shared.getter()
{
  id v0;
  void *v2;

  v2 = (void *)*sub_2206C973C();
  v0 = v2;
  return v2;
}

id sub_2206C98B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char *v9;
  id v13;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v17 = a1;
  v16 = a2;
  v15 = a3;
  v4 = v3;
  v5 = v3;
  v6 = v3;
  v18 = v3;
  swift_retain();
  *(_QWORD *)&v9[OBJC_IVAR____TtC19SiriSettingsIntents23SetNumericIntentHandler_setHandlerProvider] = a1;

  swift_retain();
  *(_QWORD *)&v9[OBJC_IVAR____TtC19SiriSettingsIntents23SetNumericIntentHandler_confirmationConfigProvider] = a2;

  swift_retain();
  *(_QWORD *)&v9[OBJC_IVAR____TtC19SiriSettingsIntents23SetNumericIntentHandler_setupHandler] = a3;

  v14.receiver = v18;
  v14.super_class = (Class)type metadata accessor for SetNumericIntentHandler();
  v13 = objc_msgSendSuper2(&v14, sel_init);
  v7 = v13;
  v18 = v13;
  swift_release();
  swift_release();
  swift_release();

  return v13;
}

uint64_t sub_2206C99D8(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  id v4;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  uint64_t *v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  char v39;
  id v42;
  char v44[40];
  _QWORD v45[3];
  uint64_t v46;
  uint64_t v47;
  char v48;
  _BYTE v49[24];
  uint64_t v50;
  _QWORD __dst[5];
  char v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  char v56;
  uint64_t v57;
  void (*v58)(void);
  uint64_t v59;
  void *v60;

  v57 = 0;
  v52 = 0;
  v60 = a1;
  v58 = a2;
  v59 = a3;
  sub_2206DAED0();
  v42 = (id)*sub_22053C880();
  v3 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  sub_2206B8044(a1);
  if (v56 == 11)
    goto LABEL_12;
  v52 = v56;
  swift_retain();
  v48 = v56;
  sub_2206C0A04(&v48);
  swift_release();
  if (!v50)
  {
    sub_2204A1FA8((uint64_t)v49);
LABEL_12:
    v23 = (id)*sub_22053C880();
    v12 = v23;
    sub_2206DAEC4();
    sub_2206DB260();
    v22 = v13;
    v14 = a1;
    v55 = a1;
    v15 = sub_2204CB808();
    v18 = SettingIntent.settingIdentifier.getter(v15, (uint64_t)&protocol witness table for INSetNumericSettingIntent);
    v19 = v16;

    v53 = v18;
    v54 = v19;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2555DF760);
    v20 = sub_2206DABD0();
    v21 = v17;
    v22[3] = MEMORY[0x24BEE0D00];
    v22[4] = sub_220464CA0();
    *v22 = v20;
    v22[1] = v21;
    sub_22045A844();
    sub_2206DAA08();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_2204621C0();
    v24 = sub_22045CFB4(8, 0);
    a2();

    return swift_release();
  }
  sub_220466BF8(v49, __dst);
  v39 = sub_2206B6118(a1);
  sub_220466BAC((uint64_t)__dst, (uint64_t)v45);
  if ((v39 & 1) != 0)
  {
    v37 = v46;
    v36 = v47;
    __swift_project_boxed_opaque_existential_1(v45, v46);
    v38 = (*(uint64_t (**)(uint64_t))(v36 + 16))(v37) ^ 1;
  }
  else
  {
    LOBYTE(v38) = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
  if ((v38 & 1) != 0)
  {
    v34 = (id)*sub_22053C880();
    v4 = v34;
    sub_2206DAEDC();
    sub_2206DB260();
    v33 = v5;
    v6 = a1;
    sub_2204CB808();
    sub_22053F0D4();
    v31 = sub_2206DABDC();
    v32 = v7;
    v33[3] = MEMORY[0x24BEE0D00];
    v33[4] = sub_220464CA0();
    *v33 = v31;
    v33[1] = v32;
    sub_22045A844();
    sub_2206DAA08();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_2204621C0();
    v35 = sub_22045CFB4(8, 0);
    a2();

    swift_release();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)__dst);
  }
  else
  {
    sub_2206DAED0();
    v28 = (id)*sub_22053C880();
    v9 = v28;
    sub_2206DB260();
    v27 = v10;
    sub_220466BAC((uint64_t)__dst, (uint64_t)v44);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555E3868);
    v25 = sub_2206DABD0();
    v26 = v11;
    v27[3] = MEMORY[0x24BEE0D00];
    v27[4] = sub_220464CA0();
    *v27 = v25;
    v27[1] = v26;
    sub_22045A844();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v29 = __dst[4];
    __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
    swift_retain();
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = a2;
    *(_QWORD *)(v30 + 24) = a3;
    (*(void (**)(void *, uint64_t (*)(void *)))(v29 + 8))(a1, sub_2206CA1E0);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)__dst);
  }
}

uint64_t sub_2206CA02C(void *a1, void (*a2)(void *))
{
  id v2;
  uint64_t *v3;
  id v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  id v10;

  sub_2206DAED0();
  v10 = (id)*sub_22053C880();
  v2 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  v9 = v3;
  v4 = a1;
  sub_2204621C0();
  sub_22063EBAC();
  v7 = sub_2206DABDC();
  v8 = v5;
  v9[3] = MEMORY[0x24BEE0D00];
  v9[4] = sub_220464CA0();
  *v9 = v7;
  v9[1] = v8;
  sub_22045A844();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  swift_retain();
  a2(a1);
  return swift_release();
}

uint64_t sub_2206CA1A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206CA1E0(void *a1)
{
  uint64_t v1;

  return sub_2206CA02C(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t sub_2206CA290()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2206CA2CC(void *a1, void (*a2)(void))
{
  id v5;

  swift_retain();
  v5 = sub_2206CA3F8(a1);
  a2();

  return swift_release();
}

id sub_2206CA3F8(void *a1)
{
  uint64_t *v1;
  id v2;
  char has_malloc_size;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  id v7;
  uint64_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  id v18;
  id v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  id v23;
  id v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  id v31;
  void (*v32)(uint64_t);
  id v33;
  id v34;
  id v36;
  id v37;
  char v38;
  char v39;
  void *v40;
  char v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[8];
  _QWORD __src[8];
  _QWORD __dst[8];

  v42 = 0;
  v39 = 0;
  v37 = 0;
  v43 = a1;
  sub_2206B8044(a1);
  if (v41 == 11
    || (v39 = v41,
        swift_retain(),
        v38 = v41,
        sub_220680168(&v38, v44),
        swift_release(),
        sub_2206759E8(v44, __src),
        !__src[3]))
  {
    sub_2206DAED0();
    v18 = (id)*sub_22053C880();
    v7 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    v17 = v8;
    v9 = a1;
    v40 = a1;
    sub_2204CB808();
    sub_22053F0D4();
    v15 = sub_2206DABDC();
    v16 = v10;
    v17[3] = MEMORY[0x24BEE0D00];
    v17[4] = sub_220464CA0();
    *v17 = v15;
    v17[1] = v16;
    sub_22045A844();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    sub_2204621C0();
    return sub_22045CFB4(2, 0);
  }
  else
  {
    memcpy(__dst, __src, sizeof(__dst));
    v1 = sub_22053618C();
    v30 = *v1;
    v28 = v1[1];
    v29 = *((unsigned __int8 *)v1 + 16);
    v31 = (id)*sub_22053C880();
    v2 = v31;
    has_malloc_size = _swift_stdlib_has_malloc_size();
    sub_220532350(v30, v28, v29, (uint64_t)v31, has_malloc_size & 1);

    sub_2204621C0();
    v34 = sub_22045CFB4(2, 0);
    v37 = v34;
    sub_220545F80();
    sub_2204ACAE8();
    v32 = (void (*)(uint64_t))__dst[6];
    v4 = swift_retain();
    v32(v4);
    v33 = sub_2206117E8();
    swift_release();
    v36 = objc_msgSend(v34, sel_oldValue);
    v27 = v36 != 0;
    sub_2204ACB4C(&v36);
    if (v27)
    {
      v26 = objc_msgSend(v34, sel_oldValue);
      if (v26)
      {
        v25 = v26;
      }
      else
      {
        LOBYTE(v12) = 2;
        v13 = 85;
        LODWORD(v14) = 0;
        sub_2206DB11C();
        __break(1u);
      }
      objc_msgSend(v25, sel_unit, v12, v13, v14);

    }
    v19 = sub_2205ABFC4(v33);
    objc_msgSend(v34, sel_setOldValue_);

    v5 = sub_22053618C();
    v22 = *v5;
    v20 = v5[1];
    v21 = *((unsigned __int8 *)v5 + 16);
    v23 = (id)*sub_22053C880();
    v6 = v23;
    sub_220532544(v22, v20, v21, v23);

    sub_220675AA8((uint64_t)__dst);
    return v34;
  }
}

uint64_t sub_2206CA8D0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

id SetNumericIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SetNumericIntentHandler.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"SiriSettingsIntents.SetNumericIntentHandler")
  {
    sub_2206DB11C();
    __break(1u);
  }
  result = sub_220530DAC((uint64_t)"SiriSettingsIntents.SetNumericIntentHandler", 43, (unint64_t)"init()", 6, 2, (unint64_t)"SiriSettingsIntents/SetNumericIntentHandler.swift", 49, 2, v1, 0xCuLL, 0xEuLL);
  __break(1u);
  return result;
}

id SetNumericIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetNumericIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SetNumericIntentHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SetNumericIntentHandler.handle(intent:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x24BEE4EA0]) + 0x70))();
}

uint64_t dispatch thunk of SetNumericIntentHandler.confirm(intent:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x24BEE4EA0]) + 0x78))();
}

uint64_t *sub_2206CAB7C()
{
  if (qword_2555DC710 != -1)
    swift_once();
  return &qword_2555EA260;
}

uint64_t *sub_2206CABD0()
{
  if (qword_2555DC718 != -1)
    swift_once();
  return &qword_2555EA268;
}

uint64_t *sub_2206CAC24()
{
  if (qword_2555DC720 != -1)
    swift_once();
  return &qword_2555FE4C8;
}

uint64_t *sub_2206CAC78()
{
  if (qword_2555DC728 != -1)
    swift_once();
  return &qword_2555FE4D8;
}

uint64_t sub_2206CACCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  type metadata accessor for SettingsUserDefaultsProvider();
  v0 = sub_2206CAD00();
  result = sub_2206C788C(v0, v1);
  qword_2555EA260 = result;
  return result;
}

uint64_t sub_2206CAD00()
{
  return sub_2206DAC30();
}

uint64_t static SettingsUserDefaultsProvider.shared.getter()
{
  uint64_t v1;

  v1 = *sub_2206CAB7C();
  swift_retain();
  return v1;
}

void *sub_2206CAD60()
{
  uint64_t v0;
  id v1;
  void *v3;

  v3 = *(void **)(v0 + 16);
  v1 = v3;
  return v3;
}

uint64_t SettingsUserDefaultsProvider.deinit()
{
  uint64_t v0;
  uint64_t v2;

  sub_2204ACB4C((id *)(v0 + 16));
  return v2;
}

uint64_t SettingsUserDefaultsProvider.__deallocating_deinit()
{
  SettingsUserDefaultsProvider.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2206CAE00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  type metadata accessor for NotificationsUserDefaultsProvider();
  v0 = sub_2206CAE34();
  result = sub_2206C788C(v0, v1);
  qword_2555EA268 = result;
  return result;
}

uint64_t sub_2206CAE34()
{
  return sub_2206DAC30();
}

uint64_t static NotificationsUserDefaultsProvider.shared.getter()
{
  uint64_t v1;

  v1 = *sub_2206CABD0();
  swift_retain();
  return v1;
}

uint64_t sub_2206CAE94()
{
  uint64_t result;
  uint64_t v1;

  result = sub_2206DAC30();
  qword_2555FE4C8 = result;
  qword_2555FE4D0 = v1;
  return result;
}

uint64_t sub_2206CAED4()
{
  uint64_t result;
  uint64_t v1;

  result = sub_2206DAC30();
  qword_2555FE4D8 = result;
  qword_2555FE4E0 = v1;
  return result;
}

uint64_t type metadata accessor for SettingsUserDefaultsProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for NotificationsUserDefaultsProvider()
{
  return objc_opt_self();
}

uint64_t NotificationsUserDefaultsProvider.deinit()
{
  uint64_t v0;
  uint64_t v2;

  sub_2204ACB4C((id *)(v0 + 16));
  return v2;
}

uint64_t NotificationsUserDefaultsProvider.__deallocating_deinit()
{
  NotificationsUserDefaultsProvider.deinit();
  return swift_deallocClassInstance();
}

uint64_t method lookup function for SettingsUserDefaultsProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for NotificationsUserDefaultsProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t *sub_2206CB000()
{
  if (qword_2555DC730 != -1)
    swift_once();
  return &qword_2555FE4E8;
}

uint64_t sub_2206CB054()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SetNoiseManagementHandler();
  v0 = sub_220464198();
  result = sub_2204641C4(v0, 1);
  qword_2555FE4E8 = result;
  return result;
}

uint64_t type metadata accessor for SetNoiseManagementHandler()
{
  return objc_opt_self();
}

uint64_t sub_2206CB0B4(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_2206CB100(a1, a2, a3);
}

uint64_t sub_2206CB100(void *a1, void (*a2)(void), uint64_t a3)
{
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t *v25;
  id v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  char v47;
  id v48;
  id v49;
  char v50;
  id v51;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[4];
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[2];
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[2];
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[2];
  char v77;
  id v78;
  char v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  void (*v83)(void);
  uint64_t v84;
  void *v85;

  v82 = 0;
  v85 = a1;
  v83 = a2;
  v84 = a3;
  v55 = objc_msgSend(a1, sel_settingMetadata);
  if (v55 && (v51 = objc_msgSend(v55, sel_targetDevice), v55, v51))
  {
    v48 = objc_msgSend(v51, sel_deviceCategory);

    v49 = v48;
    v50 = 0;
  }
  else
  {
    v49 = 0;
    v50 = 1;
  }
  v78 = v49;
  v79 = v50 & 1;
  v80 = 6;
  v81 = 0;
  if ((v50 & 1) != 0 || (sub_220465AC4((uint64_t)&v78, (uint64_t)&v56), (v81 & 1) != 0))
  {
    v47 = 0;
  }
  else
  {
    type metadata accessor for INDeviceCategory();
    sub_22045F400();
    v47 = sub_2206DAB88();
  }
  if ((v47 & 1) != 0)
  {
    sub_2206DAEDC();
    v45 = (id)*sub_22053C880();
    v3 = v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_22045F670();
    v46 = sub_22045CFB4(7, 0);
    a2();

    return swift_release();
  }
  v44 = objc_msgSend(a1, sel_settingMetadata);
  if (v44)
  {
    v39 = objc_msgSend(v44, sel_settingId);
    v40 = sub_2206DABA0();
    v41 = v5;

    v42 = v40;
    v43 = v41;
  }
  else
  {
    v42 = 0;
    v43 = 0;
  }
  swift_bridgeObjectRetain();
  v77 = 32;
  BinarySettingIdentifier.rawValue.getter();
  v37 = v6;
  v38 = v7;
  swift_bridgeObjectRetain();
  v76[0] = v42;
  v76[1] = v43;
  v72 = v37;
  v73 = v38;
  sub_2204A2364(v76, &v74);
  if (v73)
  {
    sub_2204A2364(&v72, &v57);
    if (v75)
    {
      swift_bridgeObjectRetain();
      v35 = sub_2206DAC3C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_220461C68();
      sub_220461C68();
      v36 = v35;
      goto LABEL_25;
    }
    sub_220461C68();
    goto LABEL_27;
  }
  if (v75)
  {
LABEL_27:
    sub_2204A2114();
    v36 = 0;
    goto LABEL_25;
  }
  sub_220461C68();
  v36 = 1;
LABEL_25:
  swift_bridgeObjectRelease();
  if ((v36 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_2206CBB38(a1, (uint64_t)a2, a3);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v71 = 5;
  BinarySettingIdentifier.rawValue.getter();
  v33 = v8;
  v34 = v9;
  swift_bridgeObjectRetain();
  v70[0] = v42;
  v70[1] = v43;
  v66 = v33;
  v67 = v34;
  sub_2204A2364(v70, &v68);
  if (v67)
  {
    sub_2204A2364(&v66, &v58);
    if (v69)
    {
      swift_bridgeObjectRetain();
      v31 = sub_2206DAC3C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_220461C68();
      sub_220461C68();
      v32 = v31;
      goto LABEL_36;
    }
    sub_220461C68();
    goto LABEL_38;
  }
  if (v69)
  {
LABEL_38:
    sub_2204A2114();
    v32 = 0;
    goto LABEL_36;
  }
  sub_220461C68();
  v32 = 1;
LABEL_36:
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_2206CC484(a1, (uint64_t)a2, a3);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v65 = 6;
  BinarySettingIdentifier.rawValue.getter();
  v29 = v10;
  v30 = v11;
  swift_bridgeObjectRetain();
  v64[0] = v42;
  v64[1] = v43;
  v60 = v29;
  v61 = v30;
  sub_2204A2364(v64, &v62);
  if (v61)
  {
    sub_2204A2364(&v60, v59);
    if (v63)
    {
      swift_bridgeObjectRetain();
      v27 = sub_2206DAC3C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_220461C68();
      sub_220461C68();
      v28 = v27;
      goto LABEL_47;
    }
    sub_220461C68();
    goto LABEL_49;
  }
  if (v63)
  {
LABEL_49:
    sub_2204A2114();
    v28 = 0;
    goto LABEL_47;
  }
  sub_220461C68();
  v28 = 1;
LABEL_47:
  swift_bridgeObjectRelease();
  if ((v28 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_2206CCBEC(a1, (uint64_t)a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2206DAED0();
    v24 = (id)*sub_22053C880();
    v12 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    v25 = v13;
    v26 = objc_msgSend(a1, sel_settingMetadata);
    if (v26)
    {
      v19 = objc_msgSend(v26, sel_settingId);
      v20 = sub_2206DABA0();
      v21 = v14;

      v22 = v20;
      v23 = v21;
    }
    else
    {
      v22 = 0;
      v23 = 0;
    }
    v59[2] = v22;
    v59[3] = v23;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2555DF760);
    v16 = sub_2206DABD0();
    v17 = v15;
    v25[3] = MEMORY[0x24BEE0D00];
    v25[4] = sub_220464CA0();
    *v25 = v16;
    v25[1] = v17;
    sub_22045A844();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    sub_2205F5A2C(16);
    v18 = sub_2205251B4();
    swift_bridgeObjectRelease();
    ((void (*)(id))a2)(v18);

    swift_release();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2206CBB38(void *a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v7;
  _QWORD *v9;

  swift_retain();
  swift_retain();
  v3 = a1;
  swift_retain();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a1;
  v9[5] = v7;
  sub_2204C4464((uint64_t)sub_2206CCD18, (uint64_t)v9);
  swift_release();
  return swift_release();
}

uint64_t sub_2206CBC18(unsigned int a1, void (*a2)(void), uint64_t a3, void *a4, uint64_t a5)
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  char v22;
  char v23;
  id v24;
  uint64_t v25;
  void (*v26)(void);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  _DWORD v32[2];
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  id v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  const char *v49;
  const char *v50;
  void (*v51)(void);
  uint64_t v52;
  id v53;
  uint64_t v54;
  unsigned int v55;
  unint64_t v56;
  char *v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;

  v55 = a1;
  v51 = a2;
  v52 = a3;
  v53 = a4;
  v54 = a5;
  v49 = "SetNoiseManagementHandler noise cancellation state: %@.";
  v50 = "SetNoiseManagementHandler failed to read noise cancellation.";
  v64 = 0;
  v62 = 0;
  v63 = 0;
  v61 = 0;
  v60 = 0;
  v59 = 0;
  v56 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2555DC7D0) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v55);
  v57 = (char *)v32 - v56;
  v64 = v5;
  v62 = v6;
  v63 = v7;
  v61 = v8;
  v60 = v9;
  if (v5 == 2)
  {
    v32[1] = sub_2206DAEDC();
    v34 = (id)*sub_22053C880();
    v31 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    v35 = 0;
    v33 = sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    v36 = sub_220523EEC(7, v35);
    v51();

  }
  else
  {
    v48 = v55;
    v46 = v55;
    v45 = 1;
    v59 = v55 & 1;
    v42 = sub_2206DAED0();
    v44 = (id)*sub_22053C880();
    v10 = v44;
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    v41 = sub_2206DB260();
    v39 = v11;
    v58 = v46 & v45;
    v37 = sub_2206DABDC();
    v38 = v12;
    v39[3] = MEMORY[0x24BEE0D00];
    v13 = sub_220464CA0();
    v14 = v37;
    v15 = v38;
    v16 = v39;
    v17 = v13;
    v18 = v41;
    v39[4] = v17;
    *v16 = v14;
    v16[1] = v15;
    sub_22045A844();
    v43 = v18;
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v19 = sub_2206DAD98();
    (*(void (**)(char *, _QWORD))(*(_QWORD *)(v19 - 8) + 56))(v57, v45);
    v20 = v53;
    swift_retain();
    swift_retain();
    v21 = swift_allocObject();
    v22 = v45;
    v23 = v46;
    v24 = v53;
    v25 = v54;
    v26 = v51;
    v27 = v52;
    v28 = v21;
    v29 = (uint64_t)v57;
    v47 = v28;
    *(_QWORD *)(v28 + 16) = 0;
    *(_QWORD *)(v28 + 24) = 0;
    *(_BYTE *)(v28 + 32) = v23 & v22;
    *(_QWORD *)(v28 + 40) = v24;
    *(_QWORD *)(v28 + 48) = v25;
    *(_QWORD *)(v28 + 56) = v26;
    *(_QWORD *)(v28 + 64) = v27;
    sub_22045CD8C(v29, (uint64_t)&unk_2555EA558, v28, MEMORY[0x24BEE4AE0] + 8);
  }
  return swift_release();
}

uint64_t sub_2206CBF98(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 88) = a8;
  *(_QWORD *)(v8 + 80) = a7;
  *(_QWORD *)(v8 + 72) = a6;
  *(_QWORD *)(v8 + 64) = a5;
  *(_BYTE *)(v8 + 113) = a4 & 1;
  *(_QWORD *)(v8 + 32) = v8;
  *(_BYTE *)(v8 + 112) = 0;
  *(_QWORD *)(v8 + 40) = 0;
  *(_QWORD *)(v8 + 48) = 0;
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 56) = 0;
  *(_BYTE *)(v8 + 112) = a4 & 1;
  *(_QWORD *)(v8 + 40) = a5;
  *(_QWORD *)(v8 + 48) = a6;
  *(_QWORD *)(v8 + 16) = a7;
  *(_QWORD *)(v8 + 24) = a8;
  return swift_task_switch();
}

uint64_t sub_2206CC02C()
{
  uint64_t v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;

  v4 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v0 + 32) = v0;
  v1 = sub_220535BF0();
  v5 = *v1;
  v6 = v1[1];
  v7 = *((_BYTE *)v1 + 16);
  v8 = *(_BYTE *)(v4 + 24);
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v2;
  *v2 = *(_QWORD *)(v0 + 32);
  v2[1] = sub_2206CC130;
  return sub_220523F44(*(_BYTE *)(v0 + 113) & 1, *(_QWORD *)(v0 + 64), v5, v6, v7, v8 & 1, (uint64_t)&unk_2555EA568, v4);
}

uint64_t sub_2206CC130(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 32) = *v1;
  *(_QWORD *)(v3 + 104) = a1;
  swift_task_dealloc();
  sub_2204614E0((uint64_t)&unk_2555EA568);
  return swift_task_switch();
}

uint64_t sub_2206CC1BC()
{
  _QWORD *v0;
  void (*v2)(id);
  id v3;

  v3 = (id)v0[13];
  v2 = (void (*)(id))v0[10];
  v0[4] = v0;
  v0[7] = v3;
  swift_retain();
  v2(v3);
  swift_release();

  return (*(uint64_t (**)(void))(v0[4] + 8))();
}

uint64_t sub_2206CC250(char a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a2;
  *(_BYTE *)(v2 + 65) = a1 & 1;
  *(_QWORD *)(v2 + 16) = v2;
  *(_BYTE *)(v2 + 64) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 64) = a1 & 1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_2206CC2A8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = v0[4];
  v0[2] = v0;
  v0[5] = *(_QWORD *)(v1 + 16);
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 48) = v2;
  *v2 = *(_QWORD *)(v4 + 16);
  v2[1] = sub_2206CC334;
  return sub_2204C4110(*(_BYTE *)(v4 + 65) & 1);
}

_QWORD *sub_2206CC334()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v4 = (_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return (_QWORD *)swift_task_switch();
  swift_release();
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v4 + 8))(v4);
}

uint64_t sub_2206CC3FC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = v0;
  swift_release();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 8))();
}

id sub_2206CC454()
{
  return sub_220523EEC(7, 0);
}

uint64_t sub_2206CC484(void *a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v7;
  _QWORD *v9;

  swift_retain();
  swift_retain();
  v3 = a1;
  swift_retain();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a1;
  v9[5] = v7;
  sub_2204C4848((uint64_t)sub_2206CCD78, (uint64_t)v9);
  swift_release();
  return swift_release();
}

uint64_t sub_2206CC564(unsigned int a1, void (*a2)(void), uint64_t a3, void *a4, uint64_t a5)
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  char v22;
  char v23;
  id v24;
  uint64_t v25;
  void (*v26)(void);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  _DWORD v32[2];
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  id v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  const char *v49;
  const char *v50;
  void (*v51)(void);
  uint64_t v52;
  id v53;
  uint64_t v54;
  unsigned int v55;
  unint64_t v56;
  char *v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;

  v55 = a1;
  v51 = a2;
  v52 = a3;
  v53 = a4;
  v54 = a5;
  v49 = "SetNoiseManagementHandler audio transparency state: %@.";
  v50 = "SetNoiseManagementHandler failed to read audio transparency";
  v64 = 0;
  v62 = 0;
  v63 = 0;
  v61 = 0;
  v60 = 0;
  v59 = 0;
  v56 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2555DC7D0) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v55);
  v57 = (char *)v32 - v56;
  v64 = v5;
  v62 = v6;
  v63 = v7;
  v61 = v8;
  v60 = v9;
  if (v5 == 2)
  {
    v32[1] = sub_2206DAEDC();
    v34 = (id)*sub_22053C880();
    v31 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    v35 = 0;
    v33 = sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    v36 = sub_220523EEC(7, v35);
    v51();

  }
  else
  {
    v48 = v55;
    v46 = v55;
    v45 = 1;
    v59 = v55 & 1;
    v42 = sub_2206DAED0();
    v44 = (id)*sub_22053C880();
    v10 = v44;
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    v41 = sub_2206DB260();
    v39 = v11;
    v58 = v46 & v45;
    v37 = sub_2206DABDC();
    v38 = v12;
    v39[3] = MEMORY[0x24BEE0D00];
    v13 = sub_220464CA0();
    v14 = v37;
    v15 = v38;
    v16 = v39;
    v17 = v13;
    v18 = v41;
    v39[4] = v17;
    *v16 = v14;
    v16[1] = v15;
    sub_22045A844();
    v43 = v18;
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v19 = sub_2206DAD98();
    (*(void (**)(char *, _QWORD))(*(_QWORD *)(v19 - 8) + 56))(v57, v45);
    v20 = v53;
    swift_retain();
    swift_retain();
    v21 = swift_allocObject();
    v22 = v45;
    v23 = v46;
    v24 = v53;
    v25 = v54;
    v26 = v51;
    v27 = v52;
    v28 = v21;
    v29 = (uint64_t)v57;
    v47 = v28;
    *(_QWORD *)(v28 + 16) = 0;
    *(_QWORD *)(v28 + 24) = 0;
    *(_BYTE *)(v28 + 32) = v23 & v22;
    *(_QWORD *)(v28 + 40) = v24;
    *(_QWORD *)(v28 + 48) = v25;
    *(_QWORD *)(v28 + 56) = v26;
    *(_QWORD *)(v28 + 64) = v27;
    sub_22045CD8C(v29, (uint64_t)&unk_2555EA538, v28, MEMORY[0x24BEE4AE0] + 8);
  }
  return swift_release();
}

uint64_t sub_2206CC8E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 88) = a8;
  *(_QWORD *)(v8 + 80) = a7;
  *(_QWORD *)(v8 + 72) = a6;
  *(_QWORD *)(v8 + 64) = a5;
  *(_BYTE *)(v8 + 113) = a4 & 1;
  *(_QWORD *)(v8 + 32) = v8;
  *(_BYTE *)(v8 + 112) = 0;
  *(_QWORD *)(v8 + 40) = 0;
  *(_QWORD *)(v8 + 48) = 0;
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 56) = 0;
  *(_BYTE *)(v8 + 112) = a4 & 1;
  *(_QWORD *)(v8 + 40) = a5;
  *(_QWORD *)(v8 + 48) = a6;
  *(_QWORD *)(v8 + 16) = a7;
  *(_QWORD *)(v8 + 24) = a8;
  return swift_task_switch();
}

uint64_t sub_2206CC978()
{
  uint64_t v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;

  v4 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v0 + 32) = v0;
  v1 = sub_220535D64();
  v5 = *v1;
  v6 = v1[1];
  v7 = *((_BYTE *)v1 + 16);
  v8 = *(_BYTE *)(v4 + 24);
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v2;
  *v2 = *(_QWORD *)(v0 + 32);
  v2[1] = sub_2206CCA7C;
  return sub_220523F44(*(_BYTE *)(v0 + 113) & 1, *(_QWORD *)(v0 + 64), v5, v6, v7, v8 & 1, (uint64_t)&unk_2555EA548, v4);
}

uint64_t sub_2206CCA7C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 32) = *v1;
  *(_QWORD *)(v3 + 104) = a1;
  swift_task_dealloc();
  sub_2204614E0((uint64_t)&unk_2555EA548);
  return swift_task_switch();
}

uint64_t sub_2206CCB08(char a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a2;
  *(_BYTE *)(v2 + 65) = a1 & 1;
  *(_QWORD *)(v2 + 16) = v2;
  *(_BYTE *)(v2 + 64) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 64) = a1 & 1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_2206CCB60()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = v0[4];
  v0[2] = v0;
  v0[5] = *(_QWORD *)(v1 + 16);
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 48) = v2;
  *v2 = *(_QWORD *)(v4 + 16);
  v2[1] = sub_2206CC334;
  return sub_2204C4644(*(_BYTE *)(v4 + 65) & 1);
}

uint64_t sub_2206CCBEC(void *a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v7;
  _QWORD *v9;

  swift_retain();
  swift_retain();
  v3 = a1;
  swift_retain();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a1;
  v9[5] = v7;
  sub_2204C4B98((uint64_t)sub_2206CD158, (uint64_t)v9);
  swift_release();
  return swift_release();
}

uint64_t sub_2206CCCCC()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206CCD18(unsigned int a1)
{
  uint64_t v1;

  return sub_2206CBC18(a1, *(void (**)(void))(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_2206CCD2C()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206CCD78(unsigned int a1)
{
  uint64_t v1;

  return sub_2206CC564(a1, *(void (**)(void))(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_2206CCD8C(unsigned int a1, void (*a2)(void), uint64_t a3, void *a4, uint64_t a5)
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  char v22;
  char v23;
  id v24;
  uint64_t v25;
  void (*v26)(void);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  _DWORD v32[2];
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  id v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  const char *v49;
  const char *v50;
  void (*v51)(void);
  uint64_t v52;
  id v53;
  uint64_t v54;
  unsigned int v55;
  unint64_t v56;
  char *v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;

  v55 = a1;
  v51 = a2;
  v52 = a3;
  v53 = a4;
  v54 = a5;
  v49 = "SetNoiseManagementHandler auto ANC state: %@.";
  v50 = "SetNoiseManagementHandler failed to read auto ANC";
  v64 = 0;
  v62 = 0;
  v63 = 0;
  v61 = 0;
  v60 = 0;
  v59 = 0;
  v56 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2555DC7D0) - 8) + 64)
       + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v55);
  v57 = (char *)v32 - v56;
  v64 = v5;
  v62 = v6;
  v63 = v7;
  v61 = v8;
  v60 = v9;
  if (v5 == 2)
  {
    v32[1] = sub_2206DAEDC();
    v34 = (id)*sub_22053C880();
    v31 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    v35 = 0;
    v33 = sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    swift_retain();
    v36 = sub_220523EEC(7, v35);
    v51();

  }
  else
  {
    v48 = v55;
    v46 = v55;
    v45 = 1;
    v59 = v55 & 1;
    v42 = sub_2206DAED0();
    v44 = (id)*sub_22053C880();
    v10 = v44;
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    v41 = sub_2206DB260();
    v39 = v11;
    v58 = v46 & v45;
    v37 = sub_2206DABDC();
    v38 = v12;
    v39[3] = MEMORY[0x24BEE0D00];
    v13 = sub_220464CA0();
    v14 = v37;
    v15 = v38;
    v16 = v39;
    v17 = v13;
    v18 = v41;
    v39[4] = v17;
    *v16 = v14;
    v16[1] = v15;
    sub_22045A844();
    v43 = v18;
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v19 = sub_2206DAD98();
    (*(void (**)(char *, _QWORD))(*(_QWORD *)(v19 - 8) + 56))(v57, v45);
    v20 = v53;
    swift_retain();
    swift_retain();
    v21 = swift_allocObject();
    v22 = v45;
    v23 = v46;
    v24 = v53;
    v25 = v54;
    v26 = v51;
    v27 = v52;
    v28 = v21;
    v29 = (uint64_t)v57;
    v47 = v28;
    *(_QWORD *)(v28 + 16) = 0;
    *(_QWORD *)(v28 + 24) = 0;
    *(_BYTE *)(v28 + 32) = v23 & v22;
    *(_QWORD *)(v28 + 40) = v24;
    *(_QWORD *)(v28 + 48) = v25;
    *(_QWORD *)(v28 + 56) = v26;
    *(_QWORD *)(v28 + 64) = v27;
    sub_22045CD8C(v29, (uint64_t)&unk_2555EA518, v28, MEMORY[0x24BEE4AE0] + 8);
  }
  return swift_release();
}

uint64_t sub_2206CD10C()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206CD158(unsigned int a1)
{
  uint64_t v1;

  return sub_2206CCD8C(a1, *(void (**)(void))(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_2206CD16C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 88) = a8;
  *(_QWORD *)(v8 + 80) = a7;
  *(_QWORD *)(v8 + 72) = a6;
  *(_QWORD *)(v8 + 64) = a5;
  *(_BYTE *)(v8 + 113) = a4 & 1;
  *(_QWORD *)(v8 + 32) = v8;
  *(_BYTE *)(v8 + 112) = 0;
  *(_QWORD *)(v8 + 40) = 0;
  *(_QWORD *)(v8 + 48) = 0;
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 56) = 0;
  *(_BYTE *)(v8 + 112) = a4 & 1;
  *(_QWORD *)(v8 + 40) = a5;
  *(_QWORD *)(v8 + 48) = a6;
  *(_QWORD *)(v8 + 16) = a7;
  *(_QWORD *)(v8 + 24) = a8;
  return swift_task_switch();
}

uint64_t sub_2206CD200()
{
  uint64_t v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;

  v4 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v0 + 32) = v0;
  v1 = sub_220535DFC();
  v5 = *v1;
  v6 = v1[1];
  v7 = *((_BYTE *)v1 + 16);
  v8 = *(_BYTE *)(v4 + 24);
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v2;
  *v2 = *(_QWORD *)(v0 + 32);
  v2[1] = sub_2206CD304;
  return sub_220523F44(*(_BYTE *)(v0 + 113) & 1, *(_QWORD *)(v0 + 64), v5, v6, v7, v8 & 1, (uint64_t)&unk_2555EA528, v4);
}

uint64_t sub_2206CD304(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 32) = *v1;
  *(_QWORD *)(v3 + 104) = a1;
  swift_task_dealloc();
  sub_2204614E0((uint64_t)&unk_2555EA528);
  return swift_task_switch();
}

uint64_t sub_2206CD390(char a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a2;
  *(_BYTE *)(v2 + 65) = a1 & 1;
  *(_QWORD *)(v2 + 16) = v2;
  *(_BYTE *)(v2 + 64) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  *(_BYTE *)(v2 + 64) = a1 & 1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_2206CD3E8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = v0[4];
  v0[2] = v0;
  v0[5] = *(_QWORD *)(v1 + 16);
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 48) = v2;
  *v2 = *(_QWORD *)(v4 + 16);
  v2[1] = sub_2206CC334;
  return sub_2204C4994(*(_BYTE *)(v4 + 65) & 1);
}

uint64_t sub_2206CD474(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[40] = v1;
  v2[39] = a1;
  v2[34] = v2;
  v2[35] = 0;
  v2[36] = 0;
  v2[35] = a1;
  v2[36] = v1;
  return swift_task_switch();
}

uint64_t sub_2206CD4C4()
{
  uint64_t v0;
  void *v1;
  char v2;
  id v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t *v29;
  id v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  char v50;
  id v51;
  uint64_t v52;
  id v53;

  v1 = *(void **)(v0 + 312);
  *(_QWORD *)(v0 + 272) = v0;
  v53 = objc_msgSend(v1, sel_settingMetadata);
  if (v53 && (v51 = objc_msgSend(v53, sel_targetDevice), v53, v51))
  {
    v48 = objc_msgSend(v51, sel_deviceCategory);

    v49 = v48;
    v50 = 0;
  }
  else
  {
    v49 = 0;
    v50 = 1;
  }
  *(_QWORD *)(v52 + 112) = v49;
  *(_BYTE *)(v52 + 120) = v50 & 1;
  *(_QWORD *)(v52 + 128) = 6;
  *(_BYTE *)(v52 + 136) = 0;
  if ((*(_BYTE *)(v52 + 120) & 1) == 0)
  {
    sub_220465AC4(v52 + 112, v52 + 256);
    if ((*(_BYTE *)(v52 + 136) & 1) != 0)
      goto LABEL_16;
    *(_QWORD *)(v52 + 296) = *(_QWORD *)(v52 + 256);
    *(_QWORD *)(v52 + 304) = *(_QWORD *)(v52 + 128);
    type metadata accessor for INDeviceCategory();
    sub_22045F400();
    v2 = sub_2206DAB88();
    if ((v2 & 1) == 0)
      goto LABEL_16;
LABEL_14:
    sub_2206DAEDC();
    v46 = (void *)*sub_22053C880();
    v3 = v46;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v47 = sub_220523EEC(7, 0);
    return (*(uint64_t (**)(id))(*(_QWORD *)(v52 + 272) + 8))(v47);
  }
  if ((*(_BYTE *)(v52 + 136) & 1) != 0)
    goto LABEL_14;
LABEL_16:
  v45 = objc_msgSend(*(id *)(v52 + 312), sel_settingMetadata);
  if (v45)
  {
    v40 = objc_msgSend(v45, sel_settingId);
    v41 = sub_2206DABA0();
    v42 = v5;

    v43 = v41;
    v44 = v42;
  }
  else
  {
    v43 = 0;
    v44 = 0;
  }
  *(_QWORD *)(v52 + 328) = v44;
  swift_bridgeObjectRetain();
  BinarySettingIdentifier.rawValue.getter();
  v38 = v6;
  v39 = v7;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v52 + 144) = v43;
  *(_QWORD *)(v52 + 152) = v44;
  *(_QWORD *)(v52 + 16) = v38;
  *(_QWORD *)(v52 + 24) = v39;
  sub_2204A2364((_QWORD *)(v52 + 144), (_QWORD *)(v52 + 32));
  if (!*(_QWORD *)(v52 + 24))
  {
    if (!*(_QWORD *)(v52 + 40))
    {
      sub_220461C68();
      swift_bridgeObjectRelease();
LABEL_28:
      swift_bridgeObjectRelease();
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v52 + 336) = v8;
      *v8 = *(_QWORD *)(v52 + 272);
      v8[1] = sub_2206CE1D4;
      return sub_2206CE42C(*(_QWORD *)(v52 + 312));
    }
LABEL_26:
    sub_2204A2114();
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  sub_2204A2364((_QWORD *)(v52 + 16), (_QWORD *)(v52 + 240));
  if (!*(_QWORD *)(v52 + 40))
  {
    sub_220461C68();
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  v37 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_220461C68();
  sub_220461C68();
  swift_bridgeObjectRelease();
  if ((v37 & 1) != 0)
    goto LABEL_28;
LABEL_29:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  BinarySettingIdentifier.rawValue.getter();
  v35 = v9;
  v36 = v10;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v52 + 160) = v43;
  *(_QWORD *)(v52 + 168) = v44;
  *(_QWORD *)(v52 + 48) = v35;
  *(_QWORD *)(v52 + 56) = v36;
  sub_2204A2364((_QWORD *)(v52 + 160), (_QWORD *)(v52 + 64));
  if (!*(_QWORD *)(v52 + 56))
  {
    if (!*(_QWORD *)(v52 + 72))
    {
      sub_220461C68();
      swift_bridgeObjectRelease();
LABEL_39:
      swift_bridgeObjectRelease();
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v52 + 352) = v11;
      *v11 = *(_QWORD *)(v52 + 272);
      v11[1] = sub_2206CE29C;
      return sub_2206CE954(*(_QWORD *)(v52 + 312));
    }
LABEL_37:
    sub_2204A2114();
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  sub_2204A2364((_QWORD *)(v52 + 48), (_QWORD *)(v52 + 224));
  if (!*(_QWORD *)(v52 + 72))
  {
    sub_220461C68();
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  v34 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_220461C68();
  sub_220461C68();
  swift_bridgeObjectRelease();
  if ((v34 & 1) != 0)
    goto LABEL_39;
LABEL_40:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  BinarySettingIdentifier.rawValue.getter();
  v32 = v12;
  v33 = v13;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v52 + 176) = v43;
  *(_QWORD *)(v52 + 184) = v44;
  *(_QWORD *)(v52 + 80) = v32;
  *(_QWORD *)(v52 + 88) = v33;
  sub_2204A2364((_QWORD *)(v52 + 176), (_QWORD *)(v52 + 96));
  if (!*(_QWORD *)(v52 + 88))
  {
    if (!*(_QWORD *)(v52 + 104))
    {
      sub_220461C68();
      swift_bridgeObjectRelease();
LABEL_50:
      swift_bridgeObjectRelease();
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v52 + 368) = v14;
      *v14 = *(_QWORD *)(v52 + 272);
      v14[1] = sub_2206CE364;
      return sub_2206CEE7C(*(_QWORD *)(v52 + 312));
    }
LABEL_48:
    sub_2204A2114();
    swift_bridgeObjectRelease();
    goto LABEL_51;
  }
  sub_2204A2364((_QWORD *)(v52 + 80), (_QWORD *)(v52 + 208));
  if (!*(_QWORD *)(v52 + 104))
  {
    sub_220461C68();
    goto LABEL_48;
  }
  swift_bridgeObjectRetain();
  v31 = sub_2206DAC3C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_220461C68();
  sub_220461C68();
  swift_bridgeObjectRelease();
  if ((v31 & 1) != 0)
    goto LABEL_50;
LABEL_51:
  v28 = *(id *)(v52 + 312);
  swift_bridgeObjectRelease();
  sub_2206DAED0();
  v27 = (id)*sub_22053C880();
  v15 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
  sub_2206DB260();
  v29 = v16;
  v30 = objc_msgSend(v28, sel_settingMetadata);
  if (v30)
  {
    v22 = objc_msgSend(v30, sel_settingId);
    v23 = sub_2206DABA0();
    v24 = v17;

    v25 = v23;
    v26 = v24;
  }
  else
  {
    v25 = 0;
    v26 = 0;
  }
  *(_QWORD *)(v52 + 192) = v25;
  *(_QWORD *)(v52 + 200) = v26;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2555DF760);
  v19 = sub_2206DABD0();
  v20 = v18;
  v29[3] = MEMORY[0x24BEE0D00];
  v29[4] = sub_220464CA0();
  *v29 = v19;
  v29[1] = v20;
  sub_22045A844();
  sub_2206DAA14();
  swift_bridgeObjectRelease();

  v21 = sub_220523EEC(7, 0);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(id))(*(_QWORD *)(v52 + 272) + 8))(v21);
}

uint64_t sub_2206CE1D4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 272) = *v1;
  *(_QWORD *)(v3 + 344) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2206CE248()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 272) = v0;
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 272) + 8))(*(_QWORD *)(v0 + 344));
}

uint64_t sub_2206CE29C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 272) = *v1;
  *(_QWORD *)(v3 + 360) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2206CE310()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 272) = v0;
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 272) + 8))(*(_QWORD *)(v0 + 360));
}

uint64_t sub_2206CE364(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 272) = *v1;
  *(_QWORD *)(v3 + 376) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2206CE3D8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 272) = v0;
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 272) + 8))(*(_QWORD *)(v0 + 376));
}

uint64_t sub_2206CE42C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = v1;
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 16) = v2;
  *(_QWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_BYTE *)(v2 + 80) = 0;
  *(_BYTE *)(v2 + 88) = 0;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_2206CE47C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = v0[6];
  v0[2] = v0;
  v0[7] = *(_QWORD *)(v1 + 16);
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 64) = v2;
  *v2 = *(_QWORD *)(v4 + 16);
  v2[1] = sub_2206CE4F8;
  return sub_2204C44DC();
}

uint64_t sub_2206CE4F8(char a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 16) = *v1;
  *(_BYTE *)(v3 + 82) = a1;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2206CE57C()
{
  uint64_t v0;
  int v1;
  id v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  _QWORD *v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;

  v1 = *(unsigned __int8 *)(v0 + 82);
  *(_QWORD *)(v0 + 16) = v0;
  *(_BYTE *)(v0 + 80) = v1;
  if (v1 == 2)
  {
    sub_2206DAEDC();
    v10 = (id)*sub_22053C880();
    v8 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v9 = sub_220523EEC(7, 0);
    return (*(uint64_t (**)(id))(*(_QWORD *)(v21 + 16) + 8))(v9);
  }
  else
  {
    v16 = *(_BYTE *)(v21 + 82);
    v15 = *(_QWORD *)(v21 + 48);
    *(_BYTE *)(v21 + 88) = v16 & 1;
    sub_2206DAED0();
    v14 = (id)*sub_22053C880();
    v2 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    v13 = v3;
    *(_BYTE *)(v21 + 81) = v16 & 1;
    v11 = sub_2206DABDC();
    v12 = v4;
    v13[3] = MEMORY[0x24BEE0D00];
    v13[4] = sub_220464CA0();
    *v13 = v11;
    v13[1] = v12;
    sub_22045A844();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v5 = sub_220535BF0();
    v17 = *v5;
    v18 = v5[1];
    v19 = *((_BYTE *)v5 + 16);
    v20 = *(_BYTE *)(v15 + 24);
    swift_retain();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v21 + 72) = v6;
    *v6 = *(_QWORD *)(v21 + 16);
    v6[1] = sub_2206CE898;
    return sub_220523F44(v16 & 1, *(_QWORD *)(v21 + 40), v17, v18, v19, v20 & 1, (uint64_t)&unk_2555EA3E8, v15);
  }
}

uint64_t sub_2206CE898(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  sub_2204614E0((uint64_t)&unk_2555EA3E8);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t sub_2206CE954(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = v1;
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 16) = v2;
  *(_QWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_BYTE *)(v2 + 80) = 0;
  *(_BYTE *)(v2 + 88) = 0;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_2206CE9A4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = v0[6];
  v0[2] = v0;
  v0[7] = *(_QWORD *)(v1 + 16);
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 64) = v2;
  *v2 = *(_QWORD *)(v4 + 16);
  v2[1] = sub_2206CEA20;
  return sub_2204C48C0();
}

uint64_t sub_2206CEA20(char a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 16) = *v1;
  *(_BYTE *)(v3 + 82) = a1;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2206CEAA4()
{
  uint64_t v0;
  int v1;
  id v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  _QWORD *v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;

  v1 = *(unsigned __int8 *)(v0 + 82);
  *(_QWORD *)(v0 + 16) = v0;
  *(_BYTE *)(v0 + 80) = v1;
  if (v1 == 2)
  {
    sub_2206DAEDC();
    v10 = (id)*sub_22053C880();
    v8 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v9 = sub_220523EEC(7, 0);
    return (*(uint64_t (**)(id))(*(_QWORD *)(v21 + 16) + 8))(v9);
  }
  else
  {
    v16 = *(_BYTE *)(v21 + 82);
    v15 = *(_QWORD *)(v21 + 48);
    *(_BYTE *)(v21 + 88) = v16 & 1;
    sub_2206DAED0();
    v14 = (id)*sub_22053C880();
    v2 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    v13 = v3;
    *(_BYTE *)(v21 + 81) = v16 & 1;
    v11 = sub_2206DABDC();
    v12 = v4;
    v13[3] = MEMORY[0x24BEE0D00];
    v13[4] = sub_220464CA0();
    *v13 = v11;
    v13[1] = v12;
    sub_22045A844();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v5 = sub_220535D64();
    v17 = *v5;
    v18 = v5[1];
    v19 = *((_BYTE *)v5 + 16);
    v20 = *(_BYTE *)(v15 + 24);
    swift_retain();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v21 + 72) = v6;
    *v6 = *(_QWORD *)(v21 + 16);
    v6[1] = sub_2206CEDC0;
    return sub_220523F44(v16 & 1, *(_QWORD *)(v21 + 40), v17, v18, v19, v20 & 1, (uint64_t)&unk_2555EA3F8, v15);
  }
}

uint64_t sub_2206CEDC0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  sub_2204614E0((uint64_t)&unk_2555EA3F8);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t sub_2206CEE7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = v1;
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 16) = v2;
  *(_QWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_BYTE *)(v2 + 80) = 0;
  *(_BYTE *)(v2 + 88) = 0;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_2206CEECC()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = v0[6];
  v0[2] = v0;
  v0[7] = *(_QWORD *)(v1 + 16);
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 64) = v2;
  *v2 = *(_QWORD *)(v4 + 16);
  v2[1] = sub_2206CEF48;
  return sub_2204C4C10();
}

uint64_t sub_2206CEF48(char a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v3 + 16) = *v1;
  *(_BYTE *)(v3 + 82) = a1;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2206CEFCC()
{
  uint64_t v0;
  int v1;
  id v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  _QWORD *v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;

  v1 = *(unsigned __int8 *)(v0 + 82);
  *(_QWORD *)(v0 + 16) = v0;
  *(_BYTE *)(v0 + 80) = v1;
  if (v1 == 2)
  {
    sub_2206DAEDC();
    v10 = (id)*sub_22053C880();
    v8 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v9 = sub_220523EEC(7, 0);
    return (*(uint64_t (**)(id))(*(_QWORD *)(v21 + 16) + 8))(v9);
  }
  else
  {
    v16 = *(_BYTE *)(v21 + 82);
    v15 = *(_QWORD *)(v21 + 48);
    *(_BYTE *)(v21 + 88) = v16 & 1;
    sub_2206DAED0();
    v14 = (id)*sub_22053C880();
    v2 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2555DF7C0);
    sub_2206DB260();
    v13 = v3;
    *(_BYTE *)(v21 + 81) = v16 & 1;
    v11 = sub_2206DABDC();
    v12 = v4;
    v13[3] = MEMORY[0x24BEE0D00];
    v13[4] = sub_220464CA0();
    *v13 = v11;
    v13[1] = v12;
    sub_22045A844();
    sub_2206DAA14();
    swift_bridgeObjectRelease();

    v5 = sub_220535DFC();
    v17 = *v5;
    v18 = v5[1];
    v19 = *((_BYTE *)v5 + 16);
    v20 = *(_BYTE *)(v15 + 24);
    swift_retain();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v21 + 72) = v6;
    *v6 = *(_QWORD *)(v21 + 16);
    v6[1] = sub_2206CF2E8;
    return sub_220523F44(v16 & 1, *(_QWORD *)(v21 + 40), v17, v18, v19, v20 & 1, (uint64_t)&unk_2555EA408, v15);
  }
}

uint64_t sub_2206CF2E8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  sub_2204614E0((uint64_t)&unk_2555EA408);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t sub_2206CF3A4(char a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)(v1 + 16) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_22045F8BC;
  return sub_2206CC250(a1 & 1, v4);
}

uint64_t sub_2206CF424(char a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)(v1 + 16) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_22045F8BC;
  return sub_2206CCB08(a1 & 1, v4);
}

uint64_t sub_2206CF4A4(char a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)(v1 + 16) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_22045F8BC;
  return sub_2206CD390(a1 & 1, v4);
}

uint64_t sub_2206CF524(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_2206CB0B4(a1, a2, a3);
}

uint64_t sub_2206CF544(void *a1, void (*a2)(void), uint64_t a3)
{
  return sub_2206CB100(a1, a2, a3);
}

uint64_t sub_2206CF564(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_220503110;
  return sub_2206CD474(a1);
}

uint64_t sub_2206CF5DC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206CF630(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = *(_BYTE *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 40);
  v9 = *(_QWORD *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v11 = *(_QWORD *)(v1 + 64);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_22045F8BC;
  return sub_2206CD16C(a1, v5, v6, v7 & 1, v8, v9, v10, v11);
}

uint64_t sub_2206CF6FC(char a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)(v1 + 16) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_22045F8BC;
  return sub_2206CD390(a1 & 1, v4);
}

uint64_t sub_2206CF77C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206CF7D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = *(_BYTE *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 40);
  v9 = *(_QWORD *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v11 = *(_QWORD *)(v1 + 64);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_22045F8BC;
  return sub_2206CC8E4(a1, v5, v6, v7 & 1, v8, v9, v10, v11);
}

uint64_t sub_2206CF89C(char a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)(v1 + 16) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_22045F8BC;
  return sub_2206CCB08(a1 & 1, v4);
}

uint64_t sub_2206CF91C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2206CF970(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = *(_BYTE *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 40);
  v9 = *(_QWORD *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v11 = *(_QWORD *)(v1 + 64);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_22045F8BC;
  return sub_2206CBF98(a1, v5, v6, v7 & 1, v8, v9, v10, v11);
}

uint64_t sub_2206CFA3C(char a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)(v1 + 16) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_22045F8BC;
  return sub_2206CC250(a1 & 1, v4);
}

uint64_t sub_2206CFABC()
{
  uint64_t v0;
  uint64_t v3;
  unsigned __int8 v4;

  sub_2206DB260();
  *(_QWORD *)v0 = "SetNumericSettingIntent#ConfirmMaximumVolume";
  *(_QWORD *)(v0 + 8) = 44;
  *(_BYTE *)(v0 + 16) = 2;
  *(_QWORD *)(v0 + 24) = "SetNumericSettingIntent#RetainingCurrentNumericValue";
  *(_QWORD *)(v0 + 32) = 52;
  *(_BYTE *)(v0 + 40) = 2;
  *(_QWORD *)(v0 + 48) = "SetNumericSettingIntent#NoNeedToChangeNumericValueTo";
  *(_QWORD *)(v0 + 56) = 52;
  *(_BYTE *)(v0 + 64) = 2;
  *(_QWORD *)(v0 + 72) = "SetNumericSettingIntent#UnspecifiedActionForSupportedNumericSetting";
  *(_QWORD *)(v0 + 80) = 67;
  *(_BYTE *)(v0 + 88) = 2;
  *(_QWORD *)(v0 + 96) = "SetNumericSettingIntent#ConfirmDisableSmartVolume";
  *(_QWORD *)(v0 + 104) = 49;
  *(_BYTE *)(v0 + 112) = 2;
  *(_QWORD *)(v0 + 120) = "SetNumericSettingIntent#ChangedNumericValueToSpokenOnly";
  *(_QWORD *)(v0 + 128) = 55;
  *(_BYTE *)(v0 + 136) = 2;
  *(_QWORD *)(v0 + 144) = "SetNumericSettingIntent#ChangedNumericValueTo";
  *(_QWORD *)(v0 + 152) = 45;
  *(_BYTE *)(v0 + 160) = 2;
  sub_22045A844();
  v3 = sub_2206DB14C();
  swift_bridgeObjectRelease();
  switch(v3)
  {
    case 0:
      v4 = 0;
LABEL_16:
      swift_bridgeObjectRelease();
      return v4;
    case 1:
      v4 = 1;
      goto LABEL_16;
    case 2:
      v4 = 2;
      goto LABEL_16;
    case 3:
      v4 = 3;
      goto LABEL_16;
    case 4:
      v4 = 4;
      goto LABEL_16;
    case 5:
      v4 = 5;
      goto LABEL_16;
    case 6:
      v4 = 6;
      goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  return 7;
}

void sub_2206CFD40(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_2206CFD80()
{
  return sub_2206DAC30();
}

uint64_t sub_2206CFEC8()
{
  sub_2206CFF10();
  return sub_2206DB284() & 1;
}

unint64_t sub_2206CFF10()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555EA570;
  if (!qword_2555EA570)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EB730, &unk_24E64CFA0);
    atomic_store(v0, (unint64_t *)&qword_2555EA570);
    return v0;
  }
  return v2;
}

uint64_t sub_2206CFF7C()
{
  sub_2206CFF10();
  return sub_2206DACB4();
}

uint64_t sub_2206CFFB8()
{
  sub_2206CFF10();
  return sub_2206DACCC();
}

uint64_t sub_2206CFFFC()
{
  sub_2206CFF10();
  return sub_2206DACC0();
}

uint64_t sub_2206D0040@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2206CFABC();
  *a1 = result;
  return result;
}

void sub_2206D0074(_QWORD *a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;

  sub_2206CFD40(*v1);
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_2206D00A4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v4 = v1;
  *v1 = sub_2206DAC30();
  v4[1] = v2;
  swift_retain();
  if (a1)
  {
    v4[5] = sub_2206DA8C4();
    v4[2] = a1;
  }
  else
  {
    v4[2] = 0;
    v4[3] = 0;
    v4[4] = 0;
    v4[5] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  return sub_2206DB0B0();
}

uint64_t sub_2206D01B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v29;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  unsigned int v38;
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
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  _QWORD *v56;

  v56 = 0;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
  v50 = (*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v1);
  v51 = (char *)&v35 - v50;
  v56 = v0;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v53 = sub_2206DB260();
  v54 = v2;
  v3 = sub_2206DAC30();
  v4 = v54;
  *v54 = v3;
  v4[1] = v5;
  v55 = *v0;
  swift_retain();
  if (v55)
  {
    v48 = v55;
    v47 = v55;
    v6 = type metadata accessor for SettingsNumericSettingAction();
    v7 = v54;
    v8 = v47;
    v54[5] = v6;
    v7[2] = v8;
  }
  else
  {
    v34 = v54;
    v54[2] = 0;
    v34[3] = 0;
    v34[4] = 0;
    v34[5] = 0;
  }
  v9 = sub_2206DAC30();
  v10 = v54;
  v11 = v49;
  v54[6] = v9;
  v10[7] = v12;
  v46 = *(_QWORD *)(v11 + 8);
  swift_retain();
  if (v46)
  {
    v45 = v46;
    v44 = v46;
    v13 = sub_2206DA8C4();
    v14 = v54;
    v15 = v44;
    v54[11] = v13;
    v14[8] = v15;
  }
  else
  {
    v33 = v54;
    v54[8] = 0;
    v33[9] = 0;
    v33[10] = 0;
    v33[11] = 0;
  }
  v16 = sub_2206DAC30();
  v17 = v54;
  v18 = v49;
  v54[12] = v16;
  v17[13] = v19;
  v43 = *(_QWORD *)(v18 + 16);
  swift_retain();
  if (v43)
  {
    v42 = v43;
    v41 = v43;
    v20 = type metadata accessor for SettingsNumericSetting();
    v21 = v54;
    v22 = v41;
    v54[17] = v20;
    v21[14] = v22;
  }
  else
  {
    v32 = v54;
    v54[14] = 0;
    v32[15] = 0;
    v32[16] = 0;
    v32[17] = 0;
  }
  v36 = v54 + 20;
  v38 = 1;
  v23 = sub_2206DAC30();
  v24 = v54;
  v54[18] = v23;
  v24[19] = v25;
  v37 = 0;
  v26 = type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters();
  sub_2204A395C((const void *)(v49 + *(int *)(v26 + 28)), v51);
  v39 = sub_2206DA870();
  v40 = *(_QWORD *)(v39 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v40 + 48))(v51, v38) == 1)
  {
    sub_2204A2148((uint64_t)v51);
    v31 = v54;
    v54[20] = 0;
    v31[21] = 0;
    v31[22] = 0;
    v31[23] = 0;
  }
  else
  {
    v27 = v36;
    v54[23] = v39;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v27);
    (*(void (**)(uint64_t *, char *, uint64_t))(v40 + 32))(boxed_opaque_existential_1, v51, v39);
  }
  v29 = v53;
  sub_22045A844();
  v35 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  return sub_2206DB0B0();
}

uint64_t type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters()
{
  uint64_t v1;

  v1 = qword_2555EA640;
  if (!qword_2555EA640)
    return swift_getSingletonMetadata();
  return v1;
}

char *sub_2206D056C@<X0>(char *a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;

  v9 = a1;
  v10 = 0;
  v5 = 0;
  v6 = (*(_QWORD *)(*(_QWORD *)(type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters()
                              - 8)
                  + 64)
      + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v1 = (char *)&v5 - v6;
  v8 = v1;
  v10 = (char *)&v5 - v6;
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  *((_QWORD *)v1 + 2) = 0;
  v7 = *(int *)(v2 + 28);
  v3 = sub_2206DA870();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(&v8[v7], 1);
  return sub_2206D7D6C(v8, v9);
}

uint64_t sub_2206D0628()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v34;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unsigned int v43;
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
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  _QWORD *v61;

  v61 = 0;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
  v55 = (*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v1);
  v56 = (char *)&v40 - v55;
  v61 = v0;
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v58 = sub_2206DB260();
  v59 = v2;
  v3 = sub_2206DAC30();
  v4 = v59;
  *v59 = v3;
  v4[1] = v5;
  v60 = *v0;
  swift_retain();
  if (v60)
  {
    v53 = v60;
    v52 = v60;
    v6 = type metadata accessor for SettingsNumericSettingAction();
    v7 = v59;
    v8 = v52;
    v59[5] = v6;
    v7[2] = v8;
  }
  else
  {
    v39 = v59;
    v59[2] = 0;
    v39[3] = 0;
    v39[4] = 0;
    v39[5] = 0;
  }
  v9 = sub_2206DAC30();
  v10 = v59;
  v11 = v54;
  v59[6] = v9;
  v10[7] = v12;
  v51 = *(_QWORD *)(v11 + 8);
  swift_retain();
  if (v51)
  {
    v50 = v51;
    v49 = v51;
    v13 = sub_2206DA8C4();
    v14 = v59;
    v15 = v49;
    v59[11] = v13;
    v14[8] = v15;
  }
  else
  {
    v38 = v59;
    v59[8] = 0;
    v38[9] = 0;
    v38[10] = 0;
    v38[11] = 0;
  }
  v16 = sub_2206DAC30();
  v17 = v59;
  v18 = v54;
  v59[12] = v16;
  v17[13] = v19;
  v48 = *(_QWORD *)(v18 + 16);
  swift_retain();
  if (v48)
  {
    v47 = v48;
    v46 = v48;
    v20 = type metadata accessor for SettingsNumericSetting();
    v21 = v59;
    v22 = v46;
    v59[17] = v20;
    v21[14] = v22;
  }
  else
  {
    v37 = v59;
    v59[14] = 0;
    v37[15] = 0;
    v37[16] = 0;
    v37[17] = 0;
  }
  v43 = 1;
  v23 = sub_2206DAC30();
  v24 = v59;
  v25 = v54;
  v26 = v43;
  v59[18] = v23;
  v24[19] = v27;
  LOBYTE(v25) = *(_BYTE *)(v25 + 24);
  v24[23] = MEMORY[0x24BEE1328];
  *((_BYTE *)v24 + 160) = v25 & v26;
  v41 = v24 + 26;
  v28 = sub_2206DAC30();
  v29 = v59;
  v59[24] = v28;
  v29[25] = v30;
  v42 = 0;
  v31 = type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters();
  sub_2204A395C((const void *)(v54 + *(int *)(v31 + 32)), v56);
  v44 = sub_2206DA870();
  v45 = *(_QWORD *)(v44 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v45 + 48))(v56, v43) == 1)
  {
    sub_2204A2148((uint64_t)v56);
    v36 = v59;
    v59[26] = 0;
    v36[27] = 0;
    v36[28] = 0;
    v36[29] = 0;
  }
  else
  {
    v32 = v41;
    v59[29] = v44;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v32);
    (*(void (**)(uint64_t *, char *, uint64_t))(v45 + 32))(boxed_opaque_existential_1, v56, v44);
  }
  v34 = v58;
  sub_22045A844();
  v40 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  return sub_2206DB0B0();
}

uint64_t type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters()
{
  uint64_t v1;

  v1 = qword_2555EA6D8;
  if (!qword_2555EA6D8)
    return swift_getSingletonMetadata();
  return v1;
}

void *sub_2206D0A24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, const void *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;

  *(_QWORD *)a6 = a1;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_BYTE *)(a6 + 24) = a4 & 1;
  v6 = type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters();
  return sub_22050453C(a5, (void *)(a6 + *(int *)(v6 + 32)));
}

uint64_t sub_2206D0A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v10 = v3;
  *v3 = sub_2206DAC30();
  v10[1] = v4;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsNumericSettingAction();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_2206DAC30();
  v10[7] = v5;
  swift_retain();
  if (a2)
  {
    v10[11] = sub_2206DA8C4();
    v10[8] = a2;
  }
  else
  {
    v10[8] = 0;
    v10[9] = 0;
    v10[10] = 0;
    v10[11] = 0;
  }
  v10[12] = sub_2206DAC30();
  v10[13] = v6;
  swift_retain();
  if (a3)
  {
    v10[17] = type metadata accessor for SettingsNumericSetting();
    v10[14] = a3;
  }
  else
  {
    v10[14] = 0;
    v10[15] = 0;
    v10[16] = 0;
    v10[17] = 0;
  }
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  return sub_2206DB0B0();
}

uint64_t sub_2206D0CC0()
{
  sub_2206D2A24();
  return 0;
}

uint64_t sub_2206D0D0C(uint64_t a1, __int16 a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t *v10;

  v8 = a2;
  v9 = HIBYTE(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  sub_2206DB260();
  v10 = v2;
  *v2 = sub_2206DAC30();
  v10[1] = v3;
  swift_retain();
  if (a1)
  {
    v10[5] = type metadata accessor for SettingsNumericSettingAction();
    v10[2] = a1;
  }
  else
  {
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = 0;
    v10[5] = 0;
  }
  v10[6] = sub_2206DAC30();
  v10[7] = v4;
  v7 = MEMORY[0x24BEE1328];
  v10[11] = MEMORY[0x24BEE1328];
  *((_BYTE *)v10 + 64) = v8 & 1;
  v10[12] = sub_2206DAC30();
  v10[13] = v5;
  v10[17] = v7;
  *((_BYTE *)v10 + 112) = v9 & 1;
  sub_22045A844();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  return sub_2206DB0B0();
}

uint64_t sub_2206D0F0C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v29;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  unsigned int v38;
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
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  _QWORD *v56;

  v56 = 0;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
  v50 = (*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v1);
  v51 = (char *)&v35 - v50;
  v56 = v0;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v53 = sub_2206DB260();
  v54 = v2;
  v3 = sub_2206DAC30();
  v4 = v54;
  *v54 = v3;
  v4[1] = v5;
  v55 = *v0;
  swift_retain();
  if (v55)
  {
    v48 = v55;
    v47 = v55;
    v6 = type metadata accessor for SettingsNumericSettingAction();
    v7 = v54;
    v8 = v47;
    v54[5] = v6;
    v7[2] = v8;
  }
  else
  {
    v34 = v54;
    v54[2] = 0;
    v34[3] = 0;
    v34[4] = 0;
    v34[5] = 0;
  }
  v9 = sub_2206DAC30();
  v10 = v54;
  v11 = v49;
  v54[6] = v9;
  v10[7] = v12;
  v46 = *(_QWORD *)(v11 + 8);
  swift_retain();
  if (v46)
  {
    v45 = v46;
    v44 = v46;
    v13 = sub_2206DA8C4();
    v14 = v54;
    v15 = v44;
    v54[11] = v13;
    v14[8] = v15;
  }
  else
  {
    v33 = v54;
    v54[8] = 0;
    v33[9] = 0;
    v33[10] = 0;
    v33[11] = 0;
  }
  v16 = sub_2206DAC30();
  v17 = v54;
  v18 = v49;
  v54[12] = v16;
  v17[13] = v19;
  v43 = *(_QWORD *)(v18 + 16);
  swift_retain();
  if (v43)
  {
    v42 = v43;
    v41 = v43;
    v20 = type metadata accessor for SettingsNumericSetting();
    v21 = v54;
    v22 = v41;
    v54[17] = v20;
    v21[14] = v22;
  }
  else
  {
    v32 = v54;
    v54[14] = 0;
    v32[15] = 0;
    v32[16] = 0;
    v32[17] = 0;
  }
  v36 = v54 + 20;
  v38 = 1;
  v23 = sub_2206DAC30();
  v24 = v54;
  v54[18] = v23;
  v24[19] = v25;
  v37 = 0;
  v26 = type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  sub_2204A395C((const void *)(v49 + *(int *)(v26 + 40)), v51);
  v39 = sub_2206DA870();
  v40 = *(_QWORD *)(v39 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v40 + 48))(v51, v38) == 1)
  {
    sub_2204A2148((uint64_t)v51);
    v31 = v54;
    v54[20] = 0;
    v31[21] = 0;
    v31[22] = 0;
    v31[23] = 0;
  }
  else
  {
    v27 = v36;
    v54[23] = v39;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v27);
    (*(void (**)(uint64_t *, char *, uint64_t))(v40 + 32))(boxed_opaque_existential_1, v51, v39);
  }
  v29 = v53;
  sub_22045A844();
  v35 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  return sub_2206DB0B0();
}

uint64_t type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters()
{
  uint64_t v1;

  v1 = qword_2555EA778;
  if (!qword_2555EA778)
    return swift_getSingletonMetadata();
  return v1;
}

char *sub_2206D12C8@<X0>(char *a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int *v7;
  unsigned int v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  char *v11;
  char *v12;
  char *v13;

  v12 = a1;
  v13 = 0;
  v4 = 0;
  v7 = (int *)type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  v5 = (*(_QWORD *)(*((_QWORD *)v7 - 1) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](0);
  v1 = (char *)&v4 - v5;
  v11 = v1;
  v13 = (char *)&v4 - v5;
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  *((_QWORD *)v1 + 2) = 0;
  v6 = *(int *)(v2 + 28);
  v9 = sub_2206DA870();
  v10 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 56);
  v8 = 1;
  v10(&v11[v6], 1);
  ((void (*)(char *, _QWORD, _QWORD, uint64_t))v10)(&v11[v7[8]], v8, v8, v9);
  ((void (*)(char *, _QWORD, _QWORD, uint64_t))v10)(&v11[v7[9]], v8, v8, v9);
  ((void (*)(char *, _QWORD, _QWORD, uint64_t))v10)(&v11[v7[10]], v8, v8, v9);
  return sub_2206D7A5C(v11, v12);
}

uint64_t sub_2206D1400()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v45;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  _QWORD *v74;

  v74 = 0;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
  v68 = (*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x24BDAC7A8](v1);
  v69 = (char *)&v51 - v68;
  v74 = v0;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE00);
  v71 = sub_2206DB260();
  v72 = v2;
  v3 = sub_2206DAC30();
  v4 = v72;
  *v72 = v3;
  v4[1] = v5;
  v73 = *v0;
  swift_retain();
  if (v73)
  {
    v66 = v73;
    v65 = v73;
    v6 = type metadata accessor for SettingsNumericSettingAction();
    v7 = v72;
    v8 = v65;
    v72[5] = v6;
    v7[2] = v8;
  }
  else
  {
    v50 = v72;
    v72[2] = 0;
    v50[3] = 0;
    v50[4] = 0;
    v50[5] = 0;
  }
  v9 = sub_2206DAC30();
  v10 = v72;
  v11 = v67;
  v72[6] = v9;
  v10[7] = v12;
  v64 = *(_QWORD *)(v11 + 8);
  swift_retain();
  if (v64)
  {
    v63 = v64;
    v62 = v64;
    v13 = sub_2206DA8C4();
    v14 = v72;
    v15 = v62;
    v72[11] = v13;
    v14[8] = v15;
  }
  else
  {
    v49 = v72;
    v72[8] = 0;
    v49[9] = 0;
    v49[10] = 0;
    v49[11] = 0;
  }
  v60 = 1;
  v16 = sub_2206DAC30();
  v17 = v60;
  v18 = v72;
  v19 = v67;
  v72[12] = v16;
  v18[13] = v20;
  LOBYTE(v19) = *(_BYTE *)(v19 + 16);
  v59 = MEMORY[0x24BEE1328];
  v18[17] = MEMORY[0x24BEE1328];
  *((_BYTE *)v18 + 112) = v19 & v17;
  v21 = sub_2206DAC30();
  v22 = v59;
  v23 = v60;
  v24 = v72;
  v25 = v67;
  v72[18] = v21;
  v24[19] = v26;
  LOBYTE(v25) = *(_BYTE *)(v25 + 17);
  v24[23] = v22;
  *((_BYTE *)v24 + 160) = v25 & v23;
  v27 = sub_2206DAC30();
  v28 = v72;
  v29 = v67;
  v72[24] = v27;
  v28[25] = v30;
  v61 = *(_QWORD *)(v29 + 24);
  swift_retain();
  if (v61)
  {
    v58 = v61;
    v57 = v61;
    v31 = type metadata accessor for SettingsNumericSetting();
    v32 = v72;
    v33 = v57;
    v72[29] = v31;
    v32[26] = v33;
  }
  else
  {
    v48 = v72;
    v72[26] = 0;
    v48[27] = 0;
    v48[28] = 0;
    v48[29] = 0;
  }
  v54 = 1;
  v34 = sub_2206DAC30();
  v35 = v72;
  v36 = v67;
  v37 = v54;
  v72[30] = v34;
  v35[31] = v38;
  LOBYTE(v36) = *(_BYTE *)(v36 + 32);
  v35[35] = MEMORY[0x24BEE1328];
  *((_BYTE *)v35 + 256) = v36 & v37;
  v52 = v35 + 38;
  v39 = sub_2206DAC30();
  v40 = v72;
  v72[36] = v39;
  v40[37] = v41;
  v53 = 0;
  v42 = type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters();
  sub_2204A395C((const void *)(v67 + *(int *)(v42 + 40)), v69);
  v55 = sub_2206DA870();
  v56 = *(_QWORD *)(v55 - 8);
  if ((*(unsigned int (**)(char *, _QWORD))(v56 + 48))(v69, v54) == 1)
  {
    sub_2204A2148((uint64_t)v69);
    v47 = v72;
    v72[38] = 0;
    v47[39] = 0;
    v47[40] = 0;
    v47[41] = 0;
  }
  else
  {
    v43 = v52;
    v72[41] = v55;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v43);
    (*(void (**)(uint64_t *, char *, uint64_t))(v56 + 32))(boxed_opaque_existential_1, v69, v55);
  }
  v45 = v71;
  sub_22045A844();
  v51 = v45;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DCE08);
  return sub_2206DB0B0();
}

uint64_t type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters()
{
  uint64_t v1;

  v1 = qword_2555EA820;
  if (!qword_2555EA820)
    return swift_getSingletonMetadata();
  return v1;
}

void *sub_2206D1888@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, char a6@<W5>, const void *a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v8;

  *(_QWORD *)a8 = a1;
  *(_QWORD *)(a8 + 8) = a2;
  *(_BYTE *)(a8 + 16) = a3 & 1;
  *(_BYTE *)(a8 + 17) = a4 & 1;
  *(_QWORD *)(a8 + 24) = a5;
  *(_BYTE *)(a8 + 32) = a6 & 1;
  v8 = type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters();
  return sub_22050453C(a7, (void *)(a8 + *(int *)(v8 + 40)));
}

uint64_t sub_2206D18F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[9] = v2;
  v3[8] = a2;
  v3[7] = a1;
  v3[4] = v3;
  v3[2] = 0;
  v3[3] = 0;
  v3[5] = 0;
  v3[6] = 0;
  v3[2] = a1;
  v3[3] = a2;
  v3[5] = v2;
  return swift_task_switch();
}

uint64_t sub_2206D1950()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  void (*v4)(_QWORD *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v4 = (void (*)(_QWORD *))v0[7];
  v0[4] = v0;
  v0[6] = sub_2204D3F80();
  v4(v0 + 6);
  v10 = sub_2206DAC30();
  v7 = v1;
  v0[10] = v1;
  v5 = v0[6];
  swift_retain();
  v8 = sub_2206D00A4(v5);
  v0[11] = v8;
  swift_release();
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92868] + (int)*MEMORY[0x24BE92868]);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 96) = v2;
  *v2 = *(_QWORD *)(v6 + 32);
  v2[1] = sub_2204DDCC4;
  return v9(v10, v7, v8);
}

uint64_t sub_2206D1A58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[8] = v2;
  v3[7] = a2;
  v3[6] = a1;
  v3[4] = v3;
  v3[2] = 0;
  v3[3] = 0;
  v3[5] = 0;
  type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[2] = a1;
  v3[3] = a2;
  v3[5] = v2;
  return swift_task_switch();
}

uint64_t sub_2206D1B28()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;
  _QWORD *v3;
  void (*v5)(char *);
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v1 = (char *)v0[10];
  v6 = v1;
  v7 = (char *)v0[9];
  v5 = (void (*)(char *))v0[6];
  v0[4] = v0;
  sub_2206D056C(v1);
  v5(v6);
  v12 = sub_2206DAC30();
  v9 = v2;
  v0[11] = v2;
  sub_2206D1E18(v6, v7);
  v10 = sub_2206D01B0();
  v0[12] = v10;
  sub_2206D1F6C((uint64_t)v7);
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92868] + (int)*MEMORY[0x24BE92868]);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 104) = v3;
  *v3 = *(_QWORD *)(v8 + 32);
  v3[1] = sub_2206D1C3C;
  return v11(v12, v9, v10);
}

uint64_t sub_2206D1C3C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[4] = *v2;
  v3 += 4;
  v3[10] = a1;
  v3[11] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2206D1D0C()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[10];
  v0[4] = v0;
  sub_2206D1F6C(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0[4] + 8))(v0[14]);
}

uint64_t sub_2206D1D84()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2206D1F6C(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 32) + 8))();
}

char *sub_2206D1E18(char *a1, char *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)a1;
  swift_retain();
  *(_QWORD *)a2 = v4;
  v5 = *((_QWORD *)a1 + 1);
  swift_retain();
  *((_QWORD *)a2 + 1) = v5;
  v7 = *((_QWORD *)a1 + 2);
  swift_retain();
  *((_QWORD *)a2 + 2) = v7;
  v8 = *(int *)(type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters() + 28);
  v10 = sub_2206DA870();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v11 + 48))(&a1[v8], 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(&a2[v8], &a1[v8], *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v11 + 16))();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(&a2[v8], 0, 1, v10);
  }
  return a2;
}

uint64_t sub_2206D1F6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  swift_release();
  v2 = *(int *)(type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters() + 28);
  v4 = sub_2206DA870();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v5 + 48))(a1 + v2, 1))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1 + v2, v4);
  return a1;
}

uint64_t sub_2206D2024(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 64) = v3;
  *(_QWORD *)(v4 + 56) = a3;
  *(_QWORD *)(v4 + 48) = a2;
  *(_BYTE *)(v4 + 137) = a1 & 1;
  *(_QWORD *)(v4 + 32) = v4;
  *(_BYTE *)(v4 + 136) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
  *(_QWORD *)(v4 + 72) = swift_task_alloc();
  type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters();
  *(_QWORD *)(v4 + 80) = swift_task_alloc();
  *(_QWORD *)(v4 + 88) = swift_task_alloc();
  *(_BYTE *)(v4 + 136) = a1 & 1;
  *(_QWORD *)(v4 + 16) = a2;
  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 40) = v3;
  return swift_task_switch();
}

uint64_t sub_2206D2154()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char v5;
  const void *v6;
  void (*v7)(uint64_t *);
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;

  v8 = *(uint64_t **)(v0 + 88);
  v9 = *(_QWORD *)(v0 + 80);
  v6 = *(const void **)(v0 + 72);
  v7 = *(void (**)(uint64_t *))(v0 + 48);
  v5 = *(_BYTE *)(v0 + 137);
  *(_QWORD *)(v0 + 32) = v0;
  v1 = sub_2206DA870();
  (*(void (**)(const void *, uint64_t))(*(_QWORD *)(v1 - 8) + 56))(v6, 1);
  sub_2206D0A24(0, 0, 0, v5 & 1, v6, (uint64_t)v8);
  v7(v8);
  v14 = sub_2206DAC30();
  v11 = v2;
  *(_QWORD *)(v0 + 96) = v2;
  sub_2206D24C8(v8, v9);
  v12 = sub_2206D0628();
  *(_QWORD *)(v0 + 104) = v12;
  sub_2206D2628(v9);
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92868] + (int)*MEMORY[0x24BE92868]);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 112) = v3;
  *v3 = *(_QWORD *)(v10 + 32);
  v3[1] = sub_2206D22C4;
  return v13(v14, v11, v12);
}

uint64_t sub_2206D22C4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[4] = *v2;
  v3 += 4;
  v3[11] = a1;
  v3[12] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2206D2394()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[11];
  v0[4] = v0;
  sub_2206D2628(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0[4] + 8))(v0[15]);
}

uint64_t sub_2206D2420()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2206D2628(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 32) + 8))();
}

uint64_t sub_2206D24C8(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v4 = *a1;
  swift_retain();
  *(_QWORD *)a2 = v4;
  v5 = a1[1];
  swift_retain();
  *(_QWORD *)(a2 + 8) = v5;
  v6 = a1[2];
  swift_retain();
  *(_QWORD *)(a2 + 16) = v6;
  *(_BYTE *)(a2 + 24) = *((_BYTE *)a1 + 24);
  v8 = *(int *)(type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters() + 32);
  v10 = sub_2206DA870();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v11 + 48))((uint64_t)a1 + v8, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy((void *)(a2 + v8), (char *)a1 + v8, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v11 + 16))();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(a2 + v8, 0, 1, v10);
  }
  return a2;
}

uint64_t sub_2206D2628(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  swift_release();
  v2 = *(int *)(type metadata accessor for SetNumericSettingIntentNoNeedToChangeNumericValueToParameters() + 32);
  v4 = sub_2206DA870();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v5 + 48))(a1 + v2, 1))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1 + v2, v4);
  return a1;
}

uint64_t sub_2206D26E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[11] = v2;
  v3[10] = a2;
  v3[9] = a1;
  v3[7] = v3;
  v3[5] = 0;
  v3[6] = 0;
  v3[8] = 0;
  v3[2] = 0;
  v3[3] = 0;
  v3[4] = 0;
  v3[5] = a1;
  v3[6] = a2;
  v3[8] = v2;
  return swift_task_switch();
}

uint64_t sub_2206D2744()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void (*v6)(_QWORD *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;

  v6 = (void (*)(_QWORD *))v0[9];
  v0[7] = v0;
  v0[2] = sub_2206D0CC0();
  v0[3] = v1;
  v0[4] = v2;
  v6(v0 + 2);
  v14 = sub_2206DAC30();
  v11 = v3;
  v0[12] = v3;
  v7 = v0[2];
  v8 = v0[3];
  v9 = v0[4];
  swift_retain();
  swift_retain();
  swift_retain();
  v12 = sub_2206D0A7C(v7, v8, v9);
  v0[13] = v12;
  swift_release();
  swift_release();
  swift_release();
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92868] + (int)*MEMORY[0x24BE92868]);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 112) = v4;
  *v4 = *(_QWORD *)(v10 + 56);
  v4[1] = sub_2206D288C;
  return v13(v14, v11, v12);
}

uint64_t sub_2206D288C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[7] = *v2;
  v3 += 7;
  v3[8] = a1;
  v3[9] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2206D295C()
{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  sub_2206D2A24();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v2 + 56) + 8))(*(_QWORD *)(v2 + 120));
}

uint64_t sub_2206D29B4()
{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2206D2A24();
  return (*(uint64_t (**)())(*(_QWORD *)(v2 + 56) + 8))();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2206D2A24()
{
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_2206D2A64(char a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 80) = v4;
  *(_QWORD *)(v5 + 72) = a4;
  *(_QWORD *)(v5 + 64) = a3;
  *(_BYTE *)(v5 + 43) = a2 & 1;
  *(_BYTE *)(v5 + 42) = a1 & 1;
  *(_QWORD *)(v5 + 48) = v5;
  *(_BYTE *)(v5 + 128) = 0;
  *(_BYTE *)(v5 + 136) = 0;
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 56) = 0;
  *(_QWORD *)(v5 + 32) = 0;
  *(_WORD *)(v5 + 40) = 0;
  *(_BYTE *)(v5 + 128) = a1 & 1;
  *(_BYTE *)(v5 + 136) = a2 & 1;
  *(_QWORD *)(v5 + 16) = a3;
  *(_QWORD *)(v5 + 24) = a4;
  *(_QWORD *)(v5 + 56) = v4;
  return swift_task_switch();
}

uint64_t sub_2206D2B10()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  _QWORD *v5;
  void (*v7)(uint64_t);
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  __int16 v16;

  v7 = *(void (**)(uint64_t))(v0 + 64);
  *(_QWORD *)(v0 + 48) = v0;
  sub_2206D0EE0();
  *(_QWORD *)(v0 + 32) = v1;
  *(_BYTE *)(v0 + 40) = v2 & 1;
  *(_BYTE *)(v0 + 41) = v3 & 1;
  v7(v0 + 32);
  v15 = sub_2206DAC30();
  v12 = v4;
  *(_QWORD *)(v0 + 88) = v4;
  v10 = *(_QWORD *)(v0 + 32);
  v8 = *(_BYTE *)(v0 + 40);
  v9 = *(_BYTE *)(v0 + 41);
  swift_retain();
  LOBYTE(v16) = v8 & 1;
  HIBYTE(v16) = v9 & 1;
  v13 = sub_2206D0D0C(v10, v16);
  *(_QWORD *)(v0 + 96) = v13;
  swift_release();
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92868] + (int)*MEMORY[0x24BE92868]);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v11 + 104) = v5;
  *v5 = *(_QWORD *)(v11 + 48);
  v5[1] = sub_2206D2C98;
  return v14(v15, v12, v13);
}

uint64_t sub_2206D2C98(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[6] = *v2;
  v3 += 6;
  v3[8] = a1;
  v3[9] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2206D2D68()
{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 48) = v0;
  sub_2204A2314();
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v2 + 48) + 8))(*(_QWORD *)(v2 + 112));
}

uint64_t sub_2206D2DC8()
{
  uint64_t v0;
  uint64_t v2;

  *(_QWORD *)(v0 + 48) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2204A2314();
  return (*(uint64_t (**)())(*(_QWORD *)(v2 + 48) + 8))();
}

uint64_t sub_2206D2E40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[8] = v2;
  v3[7] = a2;
  v3[6] = a1;
  v3[4] = v3;
  v3[2] = 0;
  v3[3] = 0;
  v3[5] = 0;
  type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[2] = a1;
  v3[3] = a2;
  v3[5] = v2;
  return swift_task_switch();
}

uint64_t sub_2206D2F10()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;
  _QWORD *v3;
  void (*v5)(uint64_t *);
  uint64_t *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v1 = (char *)v0[10];
  v6 = (uint64_t *)v1;
  v7 = (char *)v0[9];
  v5 = (void (*)(uint64_t *))v0[6];
  v0[4] = v0;
  sub_2206D12C8(v1);
  v5(v6);
  v12 = sub_2206DAC30();
  v9 = v2;
  v0[11] = v2;
  sub_2206D3200(v6, v7);
  v10 = sub_2206D0F0C();
  v0[12] = v10;
  sub_2206D3548((uint64_t)v7);
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92868] + (int)*MEMORY[0x24BE92868]);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 104) = v3;
  *v3 = *(_QWORD *)(v8 + 32);
  v3[1] = sub_2206D3024;
  return v11(v12, v9, v10);
}

uint64_t sub_2206D3024(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[4] = *v2;
  v3 += 4;
  v3[10] = a1;
  v3[11] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2206D30F4()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[10];
  v0[4] = v0;
  sub_2206D3548(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0[4] + 8))(v0[14]);
}

uint64_t sub_2206D316C()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2206D3548(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 32) + 8))();
}

char *sub_2206D3200(uint64_t *a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *__dst;
  char *__src;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(void);

  v13 = *a1;
  swift_retain();
  *(_QWORD *)a2 = v13;
  v14 = a1[1];
  swift_retain();
  *((_QWORD *)a2 + 1) = v14;
  v16 = a1[2];
  swift_retain();
  *((_QWORD *)a2 + 2) = v16;
  v17 = (int *)type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  v18 = v17[7];
  v20 = sub_2206DA870();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned int (**)(void))(v21 + 48);
  if (((unsigned int (*)(char *, uint64_t))v22)((char *)a1 + v18, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(&a2[v18], (char *)a1 + v18, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v21 + 16))();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(&a2[v18], 0, 1, v20);
  }
  __dst = &a2[v17[8]];
  __src = (char *)a1 + v17[8];
  if (v22())
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(__dst, __src, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(__dst, __src, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
  }
  v9 = &a2[v17[9]];
  v10 = (char *)a1 + v17[9];
  if (v22())
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v9, v10, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v9, 0, 1, v20);
  }
  v7 = &a2[v17[10]];
  v8 = (char *)a1 + v17[10];
  if (v22())
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v7, v8, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v7, 0, 1, v20);
  }
  return a2;
}

uint64_t sub_2206D3548(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(void);

  swift_release();
  swift_release();
  swift_release();
  v5 = (int *)type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  v6 = v5[7];
  v8 = sub_2206DA870();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(void))(v9 + 48);
  if (!((unsigned int (*)(uint64_t, uint64_t))v10)(a1 + v6, 1))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1 + v6, v8);
  v4 = a1 + v5[8];
  if (!v10())
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v8);
  v3 = a1 + v5[9];
  if (!v10())
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v8);
  v2 = a1 + v5[10];
  if (!v10())
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v8);
  return a1;
}

uint64_t sub_2206D36EC(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 + 64) = v5;
  *(_QWORD *)(v6 + 56) = a5;
  *(_QWORD *)(v6 + 48) = a4;
  *(_BYTE *)(v6 + 139) = a3 & 1;
  *(_BYTE *)(v6 + 138) = a2 & 1;
  *(_BYTE *)(v6 + 137) = a1 & 1;
  *(_QWORD *)(v6 + 32) = v6;
  *(_BYTE *)(v6 + 136) = 0;
  *(_BYTE *)(v6 + 144) = 0;
  *(_BYTE *)(v6 + 152) = 0;
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
  *(_QWORD *)(v6 + 72) = swift_task_alloc();
  type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters();
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_BYTE *)(v6 + 136) = a1 & 1;
  *(_BYTE *)(v6 + 144) = a2 & 1;
  *(_BYTE *)(v6 + 152) = a3 & 1;
  *(_QWORD *)(v6 + 16) = a4;
  *(_QWORD *)(v6 + 24) = a5;
  *(_QWORD *)(v6 + 40) = v5;
  return swift_task_switch();
}

uint64_t sub_2206D387C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char v5;
  char v6;
  char v7;
  const void *v8;
  void (*v9)(uint64_t *);
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;

  v10 = *(uint64_t **)(v0 + 88);
  v11 = *(_QWORD *)(v0 + 80);
  v8 = *(const void **)(v0 + 72);
  v9 = *(void (**)(uint64_t *))(v0 + 48);
  v7 = *(_BYTE *)(v0 + 139);
  v6 = *(_BYTE *)(v0 + 138);
  v5 = *(_BYTE *)(v0 + 137);
  *(_QWORD *)(v0 + 32) = v0;
  v1 = sub_2206DA870();
  (*(void (**)(const void *, uint64_t))(*(_QWORD *)(v1 - 8) + 56))(v8, 1);
  sub_2206D1888(0, 0, v5 & 1, v6 & 1, 0, v7 & 1, v8, (uint64_t)v10);
  v9(v10);
  v16 = sub_2206DAC30();
  v13 = v2;
  *(_QWORD *)(v0 + 96) = v2;
  sub_2206D3C28(v10, v11);
  v14 = sub_2206D1400();
  *(_QWORD *)(v0 + 104) = v14;
  sub_2206D3D98(v11);
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(MEMORY[0x24BE92868] + (int)*MEMORY[0x24BE92868]);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v12 + 112) = v3;
  *v3 = *(_QWORD *)(v12 + 32);
  v3[1] = sub_2206D3A14;
  return v15(v16, v13, v14);
}

uint64_t sub_2206D3A14(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[4] = *v2;
  v3 += 4;
  v3[11] = a1;
  v3[12] = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2206D3AE4()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[11];
  v0[4] = v0;
  sub_2206D3D98(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0[4] + 8))(v0[15]);
}

uint64_t sub_2206D3B78()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 32) = v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2206D3D98(v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 32) + 8))();
}

uint64_t sub_2206D3C28(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v4 = *a1;
  swift_retain();
  *(_QWORD *)a2 = v4;
  v5 = a1[1];
  swift_retain();
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = *((_BYTE *)a1 + 16);
  *(_BYTE *)(a2 + 17) = *((_BYTE *)a1 + 17);
  v6 = a1[3];
  swift_retain();
  *(_QWORD *)(a2 + 24) = v6;
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  v8 = *(int *)(type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters() + 40);
  v10 = sub_2206DA870();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v11 + 48))((uint64_t)a1 + v8, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy((void *)(a2 + v8), (char *)a1 + v8, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v11 + 16))();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(a2 + v8, 0, 1, v10);
  }
  return a2;
}

uint64_t sub_2206D3D98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  swift_release();
  v2 = *(int *)(type metadata accessor for SetNumericSettingIntentChangedNumericValueToParameters() + 40);
  v4 = sub_2206DA870();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v5 + 48))(a1 + v2, 1))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1 + v2, v4);
  return a1;
}

uint64_t sub_2206D3E50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_2204E62D4;
  return sub_2206D18F4(a1, a2);
}

uint64_t sub_2206D3ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_2204E62D4;
  return sub_2206D1A58(a1, a2);
}

uint64_t sub_2206D3F50(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  *(_QWORD *)(v3 + 16) = v3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = *(_QWORD *)(v3 + 16);
  v4[1] = sub_2204E62D4;
  return sub_2206D2024(a1 & 1, a2, a3);
}

uint64_t sub_2206D3FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_2204E62D4;
  return sub_2206D26E0(a1, a2);
}

uint64_t sub_2206D405C(char a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  *(_QWORD *)(v4 + 16) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v5;
  *v5 = *(_QWORD *)(v4 + 16);
  v5[1] = sub_2204E62D4;
  return sub_2206D2A64(a1 & 1, a2 & 1, a3, a4);
}

uint64_t sub_2206D40F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  *(_QWORD *)(v2 + 16) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_2204E62D4;
  return sub_2206D2E40(a1, a2);
}

uint64_t sub_2206D4174(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  *(_QWORD *)(v5 + 16) = v5;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 24) = v6;
  *v6 = *(_QWORD *)(v5 + 16);
  v6[1] = sub_2204E62D4;
  return sub_2206D36EC(a1 & 1, a2 & 1, a3 & 1, a4, a5);
}

void *type metadata accessor for SetNumericSettingIntentCATPatternsIdentifiers()
{
  return &unk_24E64CFA0;
}

void *type metadata accessor for SetNumericSettingIntentConfirmMaximumVolumeParameters()
{
  return &unk_24E64D018;
}

uint64_t sub_2206D4240()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2206D425C(char *a1, unsigned int a2, uint64_t a3)
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;

  if (a2 == 2147483646)
  {
    v8 = -1;
    if (*(_QWORD *)a1 < 0x100000000uLL)
      v8 = *(_QWORD *)a1;
    v3 = v8 - 1;
    if (v8 - 1 < 0)
      v3 = -1;
    return (v3 + 1);
  }
  else
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    v6 = *(_QWORD *)(v5 - 8);
    if (a2 == *(_DWORD *)(v6 + 84))
      return (*(unsigned int (**)(char *, _QWORD, uint64_t))(v6 + 48))(&a1[*(int *)(a3 + 28)], a2, v5);
    else
      __break(1u);
  }
  return v7;
}

uint64_t sub_2206D4354()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2206D4370(char *result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4;
  char *v5;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    result = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    v4 = *((_QWORD *)result - 1);
    if (a3 == *(_DWORD *)(v4 + 84))
      return (char *)(*(uint64_t (**)(char *, _QWORD, _QWORD, char *))(v4 + 56))(&v5[*(int *)(a4 + 28)], a2, a2, result);
    else
      __break(1u);
  }
  return result;
}

uint64_t sub_2206D4428()
{
  unint64_t v0;
  uint64_t v2;

  v2 = sub_2204EA65C();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

unint64_t sub_2206D44F0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *__dst;
  char *__src;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v17;

  v17 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v17 & 0x20000) != 0)
  {
    v12 = *a2;
    swift_retain();
    *(_QWORD *)a1 = v12;
    return *(_QWORD *)a1 + ((v17 + 16) & ~(unint64_t)v17);
  }
  else
  {
    v5 = *a2;
    swift_retain();
    *(_QWORD *)a1 = v5;
    v6 = a2[1];
    swift_retain();
    *(_QWORD *)(a1 + 8) = v6;
    v7 = a2[2];
    swift_retain();
    *(_QWORD *)(a1 + 16) = v7;
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    __dst = (void *)(a1 + *(int *)(a3 + 32));
    __src = (char *)a2 + *(int *)(a3 + 32);
    v10 = sub_2206DA870();
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t))(v11 + 48))(__src, 1))
    {
      v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(__dst, __src, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(__dst, __src, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
    }
    return a1;
  }
}

uint64_t sub_2206D4690(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  swift_release();
  swift_release();
  swift_release();
  v4 = *(int *)(a2 + 32);
  v6 = sub_2206DA870();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 48))(a1 + v4, 1);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1 + v4, v6);
  return result;
}

uint64_t sub_2206D473C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v5 = *a2;
  swift_retain();
  *(_QWORD *)a1 = v5;
  v6 = a2[1];
  swift_retain();
  *(_QWORD *)(a1 + 8) = v6;
  v8 = a2[2];
  swift_retain();
  *(_QWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  v10 = *(int *)(a3 + 32);
  v12 = sub_2206DA870();
  v13 = *(_QWORD *)(v12 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v13 + 48))((uint64_t)a2 + v10, 1))
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy((void *)(a1 + v10), (char *)a2 + v10, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v13 + 16))();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(a1 + v10, 0, 1, v12);
  }
  return a1;
}

uint64_t sub_2206D4894(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);

  v6 = *a2;
  swift_retain();
  *(_QWORD *)a1 = v6;
  swift_release();
  v7 = a2[1];
  swift_retain();
  *(_QWORD *)(a1 + 8) = v7;
  swift_release();
  v8 = a2[2];
  swift_retain();
  *(_QWORD *)(a1 + 16) = v8;
  swift_release();
  *(_BYTE *)(a1 + 24) = a2[3] & 1;
  v11 = *(int *)(a3 + 32);
  v13 = sub_2206DA870();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t))v15)(a1 + v11, 1))
  {
    if (v15((char *)a2 + v11, 1, v13))
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy((void *)(a1 + v11), (char *)a2 + v11, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(void))(v14 + 16))();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a1 + v11, 0, 1, v13);
    }
  }
  else if (v15((char *)a2 + v11, 1, v13))
  {
    (*(void (**)(void))(v14 + 8))();
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy((void *)(a1 + v11), (char *)a2 + v11, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 24))(a1 + v11, (uint64_t)a2 + v11, v13);
  }
  return a1;
}

uint64_t sub_2206D4B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = *(int *)(a3 + 32);
  v8 = sub_2206DA870();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v9 + 48))(a2 + v6, 1))
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy((void *)(a1 + v6), (const void *)(a2 + v6), *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v9 + 32))();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1 + v6, 0, 1, v8);
  }
  return a1;
}

uint64_t sub_2206D4C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24) & 1;
  v8 = *(int *)(a3 + 32);
  v10 = sub_2206DA870();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t))v12)(a1 + v8, 1))
  {
    if (v12(a2 + v8, 1, v10))
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy((void *)(a1 + v8), (const void *)(a2 + v8), *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(void))(v11 + 32))();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(a1 + v8, 0, 1, v10);
    }
  }
  else if (v12(a2 + v8, 1, v10))
  {
    (*(void (**)(void))(v11 + 8))();
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy((void *)(a1 + v8), (const void *)(a2 + v8), *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 40))(a1 + v8, a2 + v8, v10);
  }
  return a1;
}

uint64_t sub_2206D4E54()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2206D4E70(char *a1, unsigned int a2, uint64_t a3)
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;

  if (a2 == 2147483646)
  {
    v8 = -1;
    if (*(_QWORD *)a1 < 0x100000000uLL)
      v8 = *(_QWORD *)a1;
    v3 = v8 - 1;
    if (v8 - 1 < 0)
      v3 = -1;
    return (v3 + 1);
  }
  else
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    v6 = *(_QWORD *)(v5 - 8);
    if (a2 == *(_DWORD *)(v6 + 84))
      return (*(unsigned int (**)(char *, _QWORD, uint64_t))(v6 + 48))(&a1[*(int *)(a3 + 32)], a2, v5);
    else
      __break(1u);
  }
  return v7;
}

uint64_t sub_2206D4F68()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2206D4F84(char *result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4;
  char *v5;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    result = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    v4 = *((_QWORD *)result - 1);
    if (a3 == *(_DWORD *)(v4 + 84))
      return (char *)(*(uint64_t (**)(char *, _QWORD, _QWORD, char *))(v4 + 56))(&v5[*(int *)(a4 + 32)], a2, a2, result);
    else
      __break(1u);
  }
  return result;
}

uint64_t sub_2206D503C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = sub_2204EA65C();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

_QWORD *sub_2206D5110(_QWORD *a1, uint64_t *a2)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;

  v3 = *a2;
  swift_retain();
  *a1 = v3;
  v4 = a2[1];
  swift_retain();
  a1[1] = v4;
  v7 = a2[2];
  swift_retain();
  result = a1;
  a1[2] = v7;
  return result;
}

uint64_t sub_2206D5180()
{
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *sub_2206D51BC(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v3 = *a2;
  swift_retain();
  *a1 = v3;
  swift_release();
  v4 = a2[1];
  swift_retain();
  a1[1] = v4;
  swift_release();
  v6 = a2[2];
  swift_retain();
  a1[2] = v6;
  swift_release();
  return a1;
}

_QWORD *sub_2206D5268(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t sub_2206D52D0(uint64_t a1, unsigned int a2)
{
  int v2;
  int v4;
  int v5;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    {
      v5 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v4 = -1;
      if (!HIDWORD(*(_QWORD *)a1))
        v4 = *(_QWORD *)a1;
      v2 = v4 - 1;
      if (v4 - 1 < 0)
        v2 = -1;
      v5 = v2;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_2206D5400(uint64_t result, unsigned int a2, unsigned int a3)
{
  _BOOL4 v3;

  v3 = a3 > 0x7FFFFFFE;
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    if (a3 > 0x7FFFFFFE)
    {
      if (v3)
        *(_BYTE *)(result + 24) = 1;
      else
        __break(1u);
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFE)
    {
      if (v3)
        *(_BYTE *)(result + 24) = 0;
      else
        __break(1u);
    }
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

void *type metadata accessor for SetNumericSettingIntentUnspecifiedActionForSupportedNumericSettingParameters()
{
  return &unk_24E64D098;
}

uint64_t sub_2206D561C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  v4 = *a2;
  swift_retain();
  result = a1;
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_BYTE *)(a1 + 9) = *((_BYTE *)a2 + 9);
  return result;
}

uint64_t sub_2206D5668(uint64_t a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v3;

  v3 = *a2;
  swift_retain();
  *(_QWORD *)a1 = v3;
  swift_release();
  result = a1;
  *(_BYTE *)(a1 + 8) = a2[1] & 1;
  *(_BYTE *)(a1 + 9) = *((_BYTE *)a2 + 9) & 1;
  return result;
}

uint64_t sub_2206D56D4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  result = a1;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8) & 1;
  *(_BYTE *)(a1 + 9) = *(_BYTE *)(a2 + 9) & 1;
  return result;
}

uint64_t sub_2206D572C(uint64_t a1, unsigned int a2)
{
  int v2;
  int v4;
  int v5;

  if (a2)
  {
    if (a2 > 0x7FFFFFFE && *(_BYTE *)(a1 + 10))
    {
      v5 = *(_QWORD *)a1 + 2147483646;
    }
    else
    {
      v4 = -1;
      if (*(_QWORD *)a1 < 0x100000000uLL)
        v4 = *(_QWORD *)a1;
      v2 = v4 - 1;
      if (v4 - 1 < 0)
        v2 = -1;
      v5 = v2;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_QWORD *sub_2206D58A8(_QWORD *result, unsigned int a2, unsigned int a3)
{
  _QWORD *v3;
  _BYTE *v4;

  v3 = result;
  v4 = (char *)result + 10;
  if (a2 > 0x7FFFFFFE)
  {
    result = 0;
    *((_WORD *)v3 + 4) = 0;
    *v3 = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *v4 = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *v4 = 0;
    if (a2)
      *result = a2;
  }
  return result;
}

void *type metadata accessor for SetNumericSettingIntentConfirmDisableSmartVolumeParameters()
{
  return &unk_24E64D120;
}

unint64_t sub_2206D5A78(_QWORD *a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *__dst;
  char *__src;
  uint64_t v19;
  uint64_t v20;
  unsigned int (*v21)(void);
  uint64_t v22;
  int v27;

  v27 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v27 & 0x20000) != 0)
  {
    v22 = *a2;
    swift_retain();
    *a1 = v22;
    return *a1 + ((v27 + 16) & ~(unint64_t)v27);
  }
  else
  {
    v14 = *a2;
    swift_retain();
    *a1 = v14;
    v15 = a2[1];
    swift_retain();
    a1[1] = v15;
    v16 = a2[2];
    swift_retain();
    a1[2] = v16;
    __dst = (char *)a1 + a3[7];
    __src = (char *)a2 + a3[7];
    v19 = sub_2206DA870();
    v20 = *(_QWORD *)(v19 - 8);
    v21 = *(unsigned int (**)(void))(v20 + 48);
    if (((unsigned int (*)(char *, uint64_t))v21)(__src, 1))
    {
      v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(__dst, __src, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(__dst, __src, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
    }
    v12 = (char *)a1 + a3[8];
    v13 = (char *)a2 + a3[8];
    if (v21())
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v12, v13, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v12, 0, 1, v19);
    }
    v10 = (char *)a1 + a3[9];
    v11 = (char *)a2 + a3[9];
    if (v21())
    {
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v10, v11, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v10, 0, 1, v19);
    }
    v8 = (char *)a1 + a3[10];
    v9 = (char *)a2 + a3[10];
    if (v21())
    {
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v8, v9, v19);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v8, 0, 1, v19);
    }
    return (unint64_t)a1;
  }
}

uint64_t sub_2206D5E00(uint64_t a1, int *a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(void);

  swift_release();
  swift_release();
  swift_release();
  v7 = a2[7];
  v9 = sub_2206DA870();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(void))(v10 + 48);
  if (!((unsigned int (*)(uint64_t, uint64_t))v11)(a1 + v7, 1))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1 + v7, v9);
  v5 = a1 + a2[8];
  if (!v11())
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v5, v9);
  v4 = a1 + a2[9];
  if (!v11())
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v4, v9);
  v3 = a1 + a2[10];
  result = ((uint64_t (*)(void))v11)();
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v3, v9);
  return result;
}

char *sub_2206D5F94(char *a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *__dst;
  char *__src;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(void);

  v14 = *a2;
  swift_retain();
  *(_QWORD *)a1 = v14;
  v15 = a2[1];
  swift_retain();
  *((_QWORD *)a1 + 1) = v15;
  v17 = a2[2];
  swift_retain();
  *((_QWORD *)a1 + 2) = v17;
  v19 = a3[7];
  v21 = sub_2206DA870();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(unsigned int (**)(void))(v22 + 48);
  if (((unsigned int (*)(char *, uint64_t))v23)((char *)a2 + v19, 1))
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(&a1[v19], (char *)a2 + v19, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v22 + 16))();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(&a1[v19], 0, 1, v21);
  }
  __dst = &a1[a3[8]];
  __src = (char *)a2 + a3[8];
  if (v23())
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(__dst, __src, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(__dst, __src, v21);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
  }
  v10 = &a1[a3[9]];
  v11 = (char *)a2 + a3[9];
  if (v23())
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v10, v11, v21);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v10, 0, 1, v21);
  }
  v8 = &a1[a3[10]];
  v9 = (char *)a2 + a3[10];
  if (v23())
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v8, v9, v21);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v8, 0, 1, v21);
  }
  return a1;
}

char *sub_2206D62D0(char *a1, char *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *__src;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(char *, uint64_t, uint64_t);

  v18 = *(_QWORD *)a2;
  swift_retain();
  *(_QWORD *)a1 = v18;
  swift_release();
  v19 = *((_QWORD *)a2 + 1);
  swift_retain();
  *((_QWORD *)a1 + 1) = v19;
  swift_release();
  v21 = *((_QWORD *)a2 + 2);
  swift_retain();
  *((_QWORD *)a1 + 2) = v21;
  swift_release();
  v23 = a3[7];
  v25 = sub_2206DA870();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (((unsigned int (*)(char *, uint64_t))v27)(&a1[v23], 1))
  {
    if (v27(&a2[v23], 1, v25))
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(&a1[v23], &a2[v23], *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(void))(v26 + 16))();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(&a1[v23], 0, 1, v25);
    }
  }
  else if (v27(&a2[v23], 1, v25))
  {
    (*(void (**)(void))(v26 + 8))();
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(&a1[v23], &a2[v23], *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 24))(&a1[v23], &a2[v23], v25);
  }
  v16 = &a1[a3[8]];
  __src = &a2[a3[8]];
  if (((unsigned int (*)(void))v27)())
  {
    if (v27(__src, 1, v25))
    {
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(v16, __src, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v16, __src, v25);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v16, 0, 1, v25);
    }
  }
  else if (v27(__src, 1, v25))
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v16, v25);
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v16, __src, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 24))(v16, __src, v25);
  }
  v14 = &a1[a3[9]];
  v15 = &a2[a3[9]];
  if (((unsigned int (*)(void))v27)())
  {
    if (v27(v15, 1, v25))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v14, v15, v25);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v14, 0, 1, v25);
    }
  }
  else if (v27(v15, 1, v25))
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v25);
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 24))(v14, v15, v25);
  }
  v12 = &a1[a3[10]];
  v13 = &a2[a3[10]];
  if (((unsigned int (*)(void))v27)())
  {
    if (v27(v13, 1, v25))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v12, v13, v25);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v12, 0, 1, v25);
    }
  }
  else if (v27(v13, 1, v25))
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v25);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 24))(v12, v13, v25);
  }
  return a1;
}

char *sub_2206D68F8(char *a1, _QWORD *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *__dst;
  char *__src;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  unsigned int (*v20)(void);

  *(_QWORD *)a1 = *a2;
  *((_QWORD *)a1 + 1) = a2[1];
  *((_QWORD *)a1 + 2) = a2[2];
  v16 = a3[7];
  v18 = sub_2206DA870();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(unsigned int (**)(void))(v19 + 48);
  if (((unsigned int (*)(char *, uint64_t))v20)((char *)a2 + v16, 1))
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(&a1[v16], (char *)a2 + v16, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v19 + 32))();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(&a1[v16], 0, 1, v18);
  }
  __dst = &a1[a3[8]];
  __src = (char *)a2 + a3[8];
  if (v20())
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(__dst, __src, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(__dst, __src, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
  }
  v10 = &a1[a3[9]];
  v11 = (char *)a2 + a3[9];
  if (v20())
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v10, v11, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  }
  v8 = &a1[a3[10]];
  v9 = (char *)a2 + a3[10];
  if (v20())
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v8, v9, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v8, 0, 1, v18);
  }
  return a1;
}

char *sub_2206D6BF8(char *a1, char *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *__src;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_release();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  swift_release();
  v20 = a3[7];
  v22 = sub_2206DA870();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  if (((unsigned int (*)(char *, uint64_t))v24)(&a1[v20], 1))
  {
    if (v24(&a2[v20], 1, v22))
    {
      v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(&a1[v20], &a2[v20], *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
    else
    {
      (*(void (**)(void))(v23 + 32))();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(&a1[v20], 0, 1, v22);
    }
  }
  else if (v24(&a2[v20], 1, v22))
  {
    (*(void (**)(void))(v23 + 8))();
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(&a1[v20], &a2[v20], *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 40))(&a1[v20], &a2[v20], v22);
  }
  v16 = &a1[a3[8]];
  __src = &a2[a3[8]];
  if (((unsigned int (*)(void))v24)())
  {
    if (v24(__src, 1, v22))
    {
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(v16, __src, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v16, __src, v22);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v16, 0, 1, v22);
    }
  }
  else if (v24(__src, 1, v22))
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v22);
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v16, __src, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v16, __src, v22);
  }
  v14 = &a1[a3[9]];
  v15 = &a2[a3[9]];
  if (((unsigned int (*)(void))v24)())
  {
    if (v24(v15, 1, v22))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v14, v15, v22);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v14, 0, 1, v22);
    }
  }
  else if (v24(v15, 1, v22))
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v22);
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v14, v15, v22);
  }
  v12 = &a1[a3[10]];
  v13 = &a2[a3[10]];
  if (((unsigned int (*)(void))v24)())
  {
    if (v24(v13, 1, v22))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v12, v13, v22);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v12, 0, 1, v22);
    }
  }
  else if (v24(v13, 1, v22))
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v22);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v12, v13, v22);
  }
  return a1;
}

uint64_t sub_2206D71DC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2206D71F8(char *a1, unsigned int a2, uint64_t a3)
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;

  if (a2 == 2147483646)
  {
    v8 = -1;
    if (*(_QWORD *)a1 < 0x100000000uLL)
      v8 = *(_QWORD *)a1;
    v3 = v8 - 1;
    if (v8 - 1 < 0)
      v3 = -1;
    return (v3 + 1);
  }
  else
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    v6 = *(_QWORD *)(v5 - 8);
    if (a2 == *(_DWORD *)(v6 + 84))
      return (*(unsigned int (**)(char *, _QWORD, uint64_t))(v6 + 48))(&a1[*(int *)(a3 + 28)], a2, v5);
    else
      __break(1u);
  }
  return v7;
}

uint64_t sub_2206D72F0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2206D730C(char *result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4;
  char *v5;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    result = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    v4 = *((_QWORD *)result - 1);
    if (a3 == *(_DWORD *)(v4 + 84))
      return (char *)(*(uint64_t (**)(char *, _QWORD, _QWORD, char *))(v4 + 56))(&v5[*(int *)(a4 + 28)], a2, a2, result);
    else
      __break(1u);
  }
  return result;
}

uint64_t sub_2206D73C4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = sub_2204EA65C();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t sub_2206D74B0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2206D74CC(char *a1, unsigned int a2, uint64_t a3)
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;

  if (a2 == 2147483646)
  {
    v8 = -1;
    if (*(_QWORD *)a1 < 0x100000000uLL)
      v8 = *(_QWORD *)a1;
    v3 = v8 - 1;
    if (v8 - 1 < 0)
      v3 = -1;
    return (v3 + 1);
  }
  else
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    v6 = *(_QWORD *)(v5 - 8);
    if (a2 == *(_DWORD *)(v6 + 84))
      return (*(unsigned int (**)(char *, _QWORD, uint64_t))(v6 + 48))(&a1[*(int *)(a3 + 40)], a2, v5);
    else
      __break(1u);
  }
  return v7;
}

uint64_t sub_2206D75C4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2206D75E0(char *result, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v4;
  char *v5;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    result = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    v4 = *((_QWORD *)result - 1);
    if (a3 == *(_DWORD *)(v4 + 84))
      return (char *)(*(uint64_t (**)(char *, _QWORD, _QWORD, char *))(v4 + 56))(&v5[*(int *)(a4 + 40)], a2, a2, result);
    else
      __break(1u);
  }
  return result;
}

uint64_t sub_2206D7698()
{
  unint64_t v0;
  uint64_t v2;

  v2 = sub_2204EA65C();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

uint64_t sub_2206D777C(char a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v14)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v6 + 16) = v6;
  v14 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a6 + 40)
                                                                                   + **(int **)(a6 + 40));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 24) = v7;
  *v7 = *(_QWORD *)(v6 + 16);
  v7[1] = sub_220503110;
  return v14(a1 & 1, a2 & 1, a3, a4, a5, a6);
}

uint64_t sub_2206D7830(char a1, char a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v16)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v7 + 16) = v7;
  v16 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a7 + 56)
                                                                                           + **(int **)(a7 + 56));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 24) = v8;
  *v8 = *(_QWORD *)(v7 + 16);
  v8[1] = sub_220503110;
  return v16(a1 & 1, a2 & 1, a3 & 1, a4, a5, a6, a7);
}

uint64_t type metadata accessor for SetNumericSettingIntentCATPatternsExecutor()
{
  uint64_t v1;

  v1 = qword_2555EA8A8;
  if (!qword_2555EA8A8)
    return swift_getSingletonMetadata();
  return v1;
}

uint64_t sub_2206D7954()
{
  uint64_t inited;

  inited = swift_initClassMetadata2();
  if (!inited)
    return 0;
  return inited;
}

uint64_t sub_2206D79C4()
{
  return type metadata accessor for SetNumericSettingIntentCATPatternsExecutor();
}

unint64_t sub_2206D79DC()
{
  return sub_2206D79F0();
}

unint64_t sub_2206D79F0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_2555EA8F8;
  if (!qword_2555EA8F8)
  {
    v0 = MEMORY[0x2207E69C0](&unk_2206EB708, &unk_24E64CFA0);
    atomic_store(v0, (unint64_t *)&qword_2555EA8F8);
    return v0;
  }
  return v2;
}

char *sub_2206D7A5C(_QWORD *a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *__dst;
  char *__src;
  int *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(void);

  *(_QWORD *)a2 = *a1;
  *((_QWORD *)a2 + 1) = a1[1];
  *((_QWORD *)a2 + 2) = a1[2];
  v14 = (int *)type metadata accessor for SetNumericSettingIntentChangedNumericValueToSpokenOnlyParameters();
  v15 = v14[7];
  v17 = sub_2206DA870();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(unsigned int (**)(void))(v18 + 48);
  if (((unsigned int (*)(char *, uint64_t))v19)((char *)a1 + v15, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(&a2[v15], (char *)a1 + v15, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v18 + 32))();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(&a2[v15], 0, 1, v17);
  }
  __dst = &a2[v14[8]];
  __src = (char *)a1 + v14[8];
  if (v19())
  {
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(__dst, __src, *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(__dst, __src, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(__dst, 0, 1, v17);
  }
  v9 = &a2[v14[9]];
  v10 = (char *)a1 + v14[9];
  if (v19())
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v9, v10, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v9, 0, 1, v17);
  }
  v7 = &a2[v14[10]];
  v8 = (char *)a1 + v14[10];
  if (v19())
  {
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v7, v8, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v7, 0, 1, v17);
  }
  return a2;
}

char *sub_2206D7D6C(char *a1, char *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a2 = *(_QWORD *)a1;
  *((_QWORD *)a2 + 1) = *((_QWORD *)a1 + 1);
  *((_QWORD *)a2 + 2) = *((_QWORD *)a1 + 2);
  v5 = *(int *)(type metadata accessor for SetNumericSettingIntentRetainingCurrentNumericValueParameters() + 28);
  v7 = sub_2206DA870();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v8 + 48))(&a1[v5], 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2555DD240);
    memcpy(&a2[v5], &a1[v5], *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void))(v8 + 32))();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(&a2[v5], 0, 1, v7);
  }
  return a2;
}

id sub_2206D7E88()
{
  id result;

  sub_2205E0FB8();
  type metadata accessor for ResourceBundleClass();
  result = sub_2205E1F80();
  qword_2555EA900 = (uint64_t)result;
  return result;
}

uint64_t *sub_2206D7ECC()
{
  if (qword_2555DC738 != -1)
    swift_once();
  return &qword_2555EA900;
}

uint64_t sub_2206D7F20()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE500);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE500);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D7FAC()
{
  uint64_t v0;

  if (qword_2555DC740 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE500);
}

uint64_t sub_2206D800C()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE518);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE518);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8098()
{
  uint64_t v0;

  if (qword_2555DC748 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE518);
}

uint64_t sub_2206D80F8()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE530);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE530);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8184()
{
  uint64_t v0;

  if (qword_2555DC750 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE530);
}

uint64_t sub_2206D81E4()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE548);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE548);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8270()
{
  uint64_t v0;

  if (qword_2555DC758 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE548);
}

uint64_t sub_2206D82D0()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE560);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE560);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D835C()
{
  uint64_t v0;

  if (qword_2555DC760 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE560);
}

uint64_t sub_2206D83BC()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE578);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE578);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8448()
{
  uint64_t v0;

  if (qword_2555DC768 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE578);
}

uint64_t sub_2206D84A8()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE590);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE590);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8534()
{
  uint64_t v0;

  if (qword_2555DC770 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE590);
}

uint64_t sub_2206D8594()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE5A8);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE5A8);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8620()
{
  uint64_t v0;

  if (qword_2555DC778 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE5A8);
}

uint64_t sub_2206D8680()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE5C0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE5C0);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D870C()
{
  uint64_t v0;

  if (qword_2555DC780 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE5C0);
}

uint64_t sub_2206D876C()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE5D8);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE5D8);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D87F8()
{
  uint64_t v0;

  if (qword_2555DC788 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE5D8);
}

uint64_t sub_2206D8858()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE5F0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE5F0);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D88E4()
{
  uint64_t v0;

  if (qword_2555DC790 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE5F0);
}

uint64_t sub_2206D8944()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE608);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE608);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D89D0()
{
  uint64_t v0;

  if (qword_2555DC798 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE608);
}

uint64_t sub_2206D8A30()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE620);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE620);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8ABC()
{
  uint64_t v0;

  if (qword_2555DC7A0 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE620);
}

uint64_t sub_2206D8B1C()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE638);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE638);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8BA8()
{
  uint64_t v0;

  if (qword_2555DC7A8 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE638);
}

uint64_t sub_2206D8C08()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE650);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE650);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8C94()
{
  uint64_t v0;

  if (qword_2555DC7B0 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE650);
}

uint64_t sub_2206D8CF4()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE668);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE668);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8D80()
{
  uint64_t v0;

  if (qword_2555DC7B8 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE668);
}

uint64_t sub_2206D8DE0()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE680);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE680);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8E6C()
{
  uint64_t v0;

  if (qword_2555DC7C0 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE680);
}

uint64_t sub_2206D8ECC()
{
  id v0;
  uint64_t v2;

  v2 = sub_2206DA9C0();
  __swift_allocate_value_buffer(v2, qword_2555FE698);
  __swift_project_value_buffer(v2, (uint64_t)qword_2555FE698);
  sub_2206DAC30();
  v0 = (id)*sub_2206D7ECC();
  return sub_2206DA9B4();
}

uint64_t sub_2206D8F58()
{
  uint64_t v0;

  if (qword_2555DC7C8 != -1)
    swift_once();
  v0 = sub_2206DA9C0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2555FE698);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

BOOL __isOSVersionAtLeast(int a1, int a2, int a3)
{
  BOOL v6;

  if (qword_2555FD030 == -1)
  {
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_2555FD030, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1)
      return 1;
  }
  if (v6)
    return 0;
  if (dword_2555FD024 > a2)
    return 1;
  return dword_2555FD024 >= a2 && dword_2555FD028 >= a3;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  BOOL v8;

  if (qword_2555FD038 == -1)
  {
    if (qword_2555FD040)
      return _availability_version_check();
  }
  else
  {
    dispatch_once_f(&qword_2555FD038, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_2555FD040)
      return _availability_version_check();
  }
  if (qword_2555FD030 == -1)
  {
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_2555FD030, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2)
      return 1;
  }
  if (v8)
    return 0;
  if (dword_2555FD024 > a3)
    return 1;
  return dword_2555FD024 >= a3 && dword_2555FD028 >= a4;
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
  v1 = (uint64_t (*)(void))qword_2555FD040;
  if (qword_2555FD040)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (MEMORY[0x24BDAC970])
    {
      qword_2555FD040 = (uint64_t)MEMORY[0x24BDAC970];
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
                          v14 = MEMORY[0x2207E6768](v13);
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
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_2555FD024, &dword_2555FD028);
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

uint64_t sub_2206D958C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2206D9598()
{
  return MEMORY[0x24BDCB250]();
}

uint64_t sub_2206D95A4()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2206D95B0()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2206D95BC()
{
  return MEMORY[0x24BDCB3E8]();
}

uint64_t sub_2206D95C8()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2206D95D4()
{
  return MEMORY[0x24BDCB9D8]();
}

uint64_t sub_2206D95E0()
{
  return MEMORY[0x24BDCB9E8]();
}

uint64_t sub_2206D95EC()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_2206D95F8()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_2206D9604()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_2206D9610()
{
  return MEMORY[0x24BDCBD18]();
}

uint64_t sub_2206D961C()
{
  return MEMORY[0x24BDCBD60]();
}

uint64_t sub_2206D9628()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_2206D9634()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_2206D9640()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2206D964C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2206D9658()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2206D9664()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2206D9670()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2206D967C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2206D9688()
{
  return MEMORY[0x24BDCDB38]();
}

uint64_t sub_2206D9694()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2206D96A0()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_2206D96AC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2206D96B8()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_2206D96C4()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_2206D96D0()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_2206D96DC()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_2206D96E8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2206D96F4()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2206D9700()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2206D970C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2206D9718()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2206D9724()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2206D9730()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2206D973C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2206D9748()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_2206D9754()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2206D9760()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2206D976C()
{
  return MEMORY[0x24BDCF028]();
}

uint64_t sub_2206D9778()
{
  return MEMORY[0x24BDCF078]();
}

uint64_t sub_2206D9784()
{
  return MEMORY[0x24BDCF0B8]();
}

uint64_t sub_2206D9790()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_2206D979C()
{
  return MEMORY[0x24BDCF138]();
}

uint64_t sub_2206D97A8()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_2206D97B4()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_2206D97C0()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_2206D97CC()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_2206D97D8()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2206D97E4()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_2206D97F0()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_2206D97FC()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2206D9808()
{
  return MEMORY[0x24BEAA5D8]();
}

uint64_t sub_2206D9814()
{
  return MEMORY[0x24BEAAC48]();
}

uint64_t sub_2206D9820()
{
  return MEMORY[0x24BEAACB8]();
}

uint64_t sub_2206D982C()
{
  return MEMORY[0x24BEAAD48]();
}

uint64_t sub_2206D9838()
{
  return MEMORY[0x24BEAADE0]();
}

uint64_t sub_2206D9844()
{
  return MEMORY[0x24BEAAFA0]();
}

uint64_t sub_2206D9850()
{
  return MEMORY[0x24BEAB1C0]();
}

uint64_t sub_2206D985C()
{
  return MEMORY[0x24BEAB1E0]();
}

uint64_t sub_2206D9868()
{
  return MEMORY[0x24BEAB3D8]();
}

uint64_t sub_2206D9874()
{
  return MEMORY[0x24BEACEE0]();
}

uint64_t sub_2206D9880()
{
  return MEMORY[0x24BEACF00]();
}

uint64_t sub_2206D988C()
{
  return MEMORY[0x24BEAD0C8]();
}

uint64_t sub_2206D9898()
{
  return MEMORY[0x24BEAD110]();
}

uint64_t sub_2206D98A4()
{
  return MEMORY[0x24BEAD200]();
}

uint64_t sub_2206D98B0()
{
  return MEMORY[0x24BE95F80]();
}

uint64_t sub_2206D98BC()
{
  return MEMORY[0x24BE95FF0]();
}

uint64_t sub_2206D98C8()
{
  return MEMORY[0x24BE96000]();
}

uint64_t sub_2206D98D4()
{
  return MEMORY[0x24BE96008]();
}

uint64_t sub_2206D98E0()
{
  return MEMORY[0x24BE96018]();
}

uint64_t sub_2206D98EC()
{
  return MEMORY[0x24BE96028]();
}

uint64_t sub_2206D98F8()
{
  return MEMORY[0x24BE96038]();
}

uint64_t sub_2206D9904()
{
  return MEMORY[0x24BE96120]();
}

uint64_t sub_2206D9910()
{
  return MEMORY[0x24BE96130]();
}

uint64_t sub_2206D991C()
{
  return MEMORY[0x24BE96140]();
}

uint64_t sub_2206D9928()
{
  return MEMORY[0x24BE96200]();
}

uint64_t sub_2206D9934()
{
  return MEMORY[0x24BE96210]();
}

uint64_t sub_2206D9940()
{
  return MEMORY[0x24BE96220]();
}

uint64_t sub_2206D994C()
{
  return MEMORY[0x24BE96230]();
}

uint64_t sub_2206D9958()
{
  return MEMORY[0x24BE96738]();
}

uint64_t sub_2206D9964()
{
  return MEMORY[0x24BE968E0]();
}

uint64_t sub_2206D9970()
{
  return MEMORY[0x24BE96928]();
}

uint64_t sub_2206D997C()
{
  return MEMORY[0x24BE96A68]();
}

uint64_t sub_2206D9988()
{
  return MEMORY[0x24BE96A70]();
}

uint64_t sub_2206D9994()
{
  return MEMORY[0x24BE96A90]();
}

uint64_t sub_2206D99A0()
{
  return MEMORY[0x24BE96BA8]();
}

uint64_t sub_2206D99AC()
{
  return MEMORY[0x24BE96BB8]();
}

uint64_t sub_2206D99B8()
{
  return MEMORY[0x24BE96C18]();
}

uint64_t sub_2206D99C4()
{
  return MEMORY[0x24BE96C70]();
}

uint64_t sub_2206D99D0()
{
  return MEMORY[0x24BE96C78]();
}

uint64_t sub_2206D99DC()
{
  return MEMORY[0x24BE96C80]();
}

uint64_t sub_2206D99E8()
{
  return MEMORY[0x24BE96CB8]();
}

uint64_t sub_2206D99F4()
{
  return MEMORY[0x24BE96CC8]();
}

uint64_t sub_2206D9A00()
{
  return MEMORY[0x24BE96E78]();
}

uint64_t sub_2206D9A0C()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_2206D9A18()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_2206D9A24()
{
  return MEMORY[0x24BE96EA8]();
}

uint64_t sub_2206D9A30()
{
  return MEMORY[0x24BE96EB8]();
}

uint64_t sub_2206D9A3C()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_2206D9A48()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t sub_2206D9A54()
{
  return MEMORY[0x24BE96FC0]();
}

uint64_t sub_2206D9A60()
{
  return MEMORY[0x24BE96FE8]();
}

uint64_t sub_2206D9A6C()
{
  return MEMORY[0x24BE97000]();
}

uint64_t sub_2206D9A78()
{
  return MEMORY[0x24BE97008]();
}

uint64_t sub_2206D9A84()
{
  return MEMORY[0x24BE970F8]();
}

uint64_t sub_2206D9A90()
{
  return MEMORY[0x24BE97130]();
}

uint64_t sub_2206D9A9C()
{
  return MEMORY[0x24BE97240]();
}

uint64_t sub_2206D9AA8()
{
  return MEMORY[0x24BE97250]();
}

uint64_t sub_2206D9AB4()
{
  return MEMORY[0x24BE97338]();
}

uint64_t sub_2206D9AC0()
{
  return MEMORY[0x24BE97340]();
}

uint64_t sub_2206D9ACC()
{
  return MEMORY[0x24BE97358]();
}

uint64_t sub_2206D9AD8()
{
  return MEMORY[0x24BE97360]();
}

uint64_t sub_2206D9AE4()
{
  return MEMORY[0x24BE97388]();
}

uint64_t sub_2206D9AF0()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_2206D9AFC()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_2206D9B08()
{
  return MEMORY[0x24BE973E8]();
}

uint64_t sub_2206D9B14()
{
  return MEMORY[0x24BE97540]();
}

uint64_t sub_2206D9B20()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_2206D9B2C()
{
  return MEMORY[0x24BE97558]();
}

uint64_t sub_2206D9B38()
{
  return MEMORY[0x24BE97570]();
}

uint64_t sub_2206D9B44()
{
  return MEMORY[0x24BE97588]();
}

uint64_t sub_2206D9B50()
{
  return MEMORY[0x24BE975A8]();
}

uint64_t sub_2206D9B5C()
{
  return MEMORY[0x24BE97600]();
}

uint64_t sub_2206D9B68()
{
  return MEMORY[0x24BE976A8]();
}

uint64_t sub_2206D9B74()
{
  return MEMORY[0x24BE976C0]();
}

uint64_t sub_2206D9B80()
{
  return MEMORY[0x24BE976D0]();
}

uint64_t sub_2206D9B8C()
{
  return MEMORY[0x24BE97700]();
}

uint64_t sub_2206D9B98()
{
  return MEMORY[0x24BE97890]();
}

uint64_t sub_2206D9BA4()
{
  return MEMORY[0x24BE978C0]();
}

uint64_t sub_2206D9BB0()
{
  return MEMORY[0x24BE97918]();
}

uint64_t sub_2206D9BBC()
{
  return MEMORY[0x24BE97AB0]();
}

uint64_t sub_2206D9BC8()
{
  return MEMORY[0x24BE97AB8]();
}

uint64_t sub_2206D9BD4()
{
  return MEMORY[0x24BE97C18]();
}

uint64_t sub_2206D9BE0()
{
  return MEMORY[0x24BE97C20]();
}

uint64_t sub_2206D9BEC()
{
  return MEMORY[0x24BE97CA0]();
}

uint64_t sub_2206D9BF8()
{
  return MEMORY[0x24BE97D40]();
}

uint64_t sub_2206D9C04()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_2206D9C10()
{
  return MEMORY[0x24BE97D78]();
}

uint64_t sub_2206D9C1C()
{
  return MEMORY[0x24BE97DA0]();
}

uint64_t sub_2206D9C28()
{
  return MEMORY[0x24BE97DC8]();
}

uint64_t sub_2206D9C34()
{
  return MEMORY[0x24BE97DD8]();
}

uint64_t sub_2206D9C40()
{
  return MEMORY[0x24BE97DE0]();
}

uint64_t sub_2206D9C4C()
{
  return MEMORY[0x24BE97DF0]();
}

uint64_t sub_2206D9C58()
{
  return MEMORY[0x24BE97E08]();
}

uint64_t sub_2206D9C64()
{
  return MEMORY[0x24BE97E20]();
}

uint64_t sub_2206D9C70()
{
  return MEMORY[0x24BE97E30]();
}

uint64_t sub_2206D9C7C()
{
  return MEMORY[0x24BE97E50]();
}

uint64_t sub_2206D9C88()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t sub_2206D9C94()
{
  return MEMORY[0x24BE97F20]();
}

uint64_t sub_2206D9CA0()
{
  return MEMORY[0x24BE97F30]();
}

uint64_t sub_2206D9CAC()
{
  return MEMORY[0x24BE97F80]();
}

uint64_t sub_2206D9CB8()
{
  return MEMORY[0x24BE97F98]();
}

uint64_t sub_2206D9CC4()
{
  return MEMORY[0x24BE97FE0]();
}

uint64_t sub_2206D9CD0()
{
  return MEMORY[0x24BE98018]();
}

uint64_t sub_2206D9CDC()
{
  return MEMORY[0x24BE98020]();
}

uint64_t sub_2206D9CE8()
{
  return MEMORY[0x24BE98030]();
}

uint64_t sub_2206D9CF4()
{
  return MEMORY[0x24BE98288]();
}

uint64_t sub_2206D9D00()
{
  return MEMORY[0x24BE982E8]();
}

uint64_t sub_2206D9D0C()
{
  return MEMORY[0x24BE98308]();
}

uint64_t sub_2206D9D18()
{
  return MEMORY[0x24BE98310]();
}

uint64_t sub_2206D9D24()
{
  return MEMORY[0x24BE98320]();
}

uint64_t sub_2206D9D30()
{
  return MEMORY[0x24BE98388]();
}

uint64_t sub_2206D9D3C()
{
  return MEMORY[0x24BE98408]();
}

uint64_t sub_2206D9D48()
{
  return MEMORY[0x24BE984C0]();
}

uint64_t sub_2206D9D54()
{
  return MEMORY[0x24BE984D0]();
}

uint64_t sub_2206D9D60()
{
  return MEMORY[0x24BE984E0]();
}

uint64_t sub_2206D9D6C()
{
  return MEMORY[0x24BE984F0]();
}

uint64_t sub_2206D9D78()
{
  return MEMORY[0x24BE98500]();
}

uint64_t sub_2206D9D84()
{
  return MEMORY[0x24BE98640]();
}

uint64_t sub_2206D9D90()
{
  return MEMORY[0x24BE98680]();
}

uint64_t sub_2206D9D9C()
{
  return MEMORY[0x24BE98690]();
}

uint64_t sub_2206D9DA8()
{
  return MEMORY[0x24BE98698]();
}

uint64_t sub_2206D9DB4()
{
  return MEMORY[0x24BE986A0]();
}

uint64_t sub_2206D9DC0()
{
  return MEMORY[0x24BE986B0]();
}

uint64_t sub_2206D9DCC()
{
  return MEMORY[0x24BE986B8]();
}

uint64_t sub_2206D9DD8()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t sub_2206D9DE4()
{
  return MEMORY[0x24BE987E8]();
}

uint64_t sub_2206D9DF0()
{
  return MEMORY[0x24BE987F8]();
}

uint64_t sub_2206D9DFC()
{
  return MEMORY[0x24BE98808]();
}

uint64_t sub_2206D9E08()
{
  return MEMORY[0x24BE98868]();
}

uint64_t sub_2206D9E14()
{
  return MEMORY[0x24BE98898]();
}

uint64_t sub_2206D9E20()
{
  return MEMORY[0x24BE988E0]();
}

uint64_t sub_2206D9E2C()
{
  return MEMORY[0x24BE98938]();
}

uint64_t sub_2206D9E38()
{
  return MEMORY[0x24BE98DC0]();
}

uint64_t sub_2206D9E44()
{
  return MEMORY[0x24BE98E28]();
}

uint64_t sub_2206D9E50()
{
  return MEMORY[0x24BE98E30]();
}

uint64_t sub_2206D9E5C()
{
  return MEMORY[0x24BE98E38]();
}

uint64_t sub_2206D9E68()
{
  return MEMORY[0x24BE98E40]();
}

uint64_t sub_2206D9E74()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_2206D9E80()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_2206D9E8C()
{
  return MEMORY[0x24BE99040]();
}

uint64_t sub_2206D9E98()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_2206D9EA4()
{
  return MEMORY[0x24BE99090]();
}

uint64_t sub_2206D9EB0()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2206D9EBC()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_2206D9EC8()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_2206D9ED4()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_2206D9EE0()
{
  return MEMORY[0x24BE9C570]();
}

uint64_t sub_2206D9EEC()
{
  return MEMORY[0x24BE9C578]();
}

uint64_t sub_2206D9EF8()
{
  return MEMORY[0x24BE9C598]();
}

uint64_t sub_2206D9F04()
{
  return MEMORY[0x24BE9C5A0]();
}

uint64_t sub_2206D9F10()
{
  return MEMORY[0x24BE9C6D0]();
}

uint64_t sub_2206D9F1C()
{
  return MEMORY[0x24BE9C6D8]();
}

uint64_t sub_2206D9F28()
{
  return MEMORY[0x24BE9C6E0]();
}

uint64_t sub_2206D9F34()
{
  return MEMORY[0x24BE9C700]();
}

uint64_t sub_2206D9F40()
{
  return MEMORY[0x24BE9C708]();
}

uint64_t sub_2206D9F4C()
{
  return MEMORY[0x24BE9C710]();
}

uint64_t sub_2206D9F58()
{
  return MEMORY[0x24BE9C720]();
}

uint64_t sub_2206D9F64()
{
  return MEMORY[0x24BE9C728]();
}

uint64_t sub_2206D9F70()
{
  return MEMORY[0x24BE9C740]();
}

uint64_t sub_2206D9F7C()
{
  return MEMORY[0x24BE9C768]();
}

uint64_t sub_2206D9F88()
{
  return MEMORY[0x24BE9C7D8]();
}

uint64_t sub_2206D9F94()
{
  return MEMORY[0x24BE9C7F0]();
}

uint64_t sub_2206D9FA0()
{
  return MEMORY[0x24BE9C808]();
}

uint64_t sub_2206D9FAC()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t sub_2206D9FB8()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_2206D9FC4()
{
  return MEMORY[0x24BE9CB10]();
}

uint64_t sub_2206D9FD0()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_2206D9FDC()
{
  return MEMORY[0x24BE9CD40]();
}

uint64_t sub_2206D9FE8()
{
  return MEMORY[0x24BE9CD68]();
}

uint64_t sub_2206D9FF4()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_2206DA000()
{
  return MEMORY[0x24BE9E018]();
}

uint64_t sub_2206DA00C()
{
  return MEMORY[0x24BE9EAF0]();
}

uint64_t sub_2206DA018()
{
  return MEMORY[0x24BE9EB10]();
}

uint64_t sub_2206DA024()
{
  return MEMORY[0x24BE9EB38]();
}

uint64_t sub_2206DA030()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_2206DA03C()
{
  return MEMORY[0x24BE9EB60]();
}

uint64_t sub_2206DA048()
{
  return MEMORY[0x24BE9EBB0]();
}

uint64_t sub_2206DA054()
{
  return MEMORY[0x24BE9EE50]();
}

uint64_t sub_2206DA060()
{
  return MEMORY[0x24BE9EE60]();
}

uint64_t sub_2206DA06C()
{
  return MEMORY[0x24BE9EF10]();
}

uint64_t sub_2206DA078()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_2206DA084()
{
  return MEMORY[0x24BE9F758]();
}

uint64_t sub_2206DA090()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_2206DA09C()
{
  return MEMORY[0x24BE9F8E8]();
}

uint64_t sub_2206DA0A8()
{
  return MEMORY[0x24BE9F950]();
}

uint64_t sub_2206DA0B4()
{
  return MEMORY[0x24BE9F988]();
}

uint64_t sub_2206DA0C0()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_2206DA0CC()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_2206DA0D8()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_2206DA0E4()
{
  return MEMORY[0x24BE9FAB0]();
}

uint64_t sub_2206DA0F0()
{
  return MEMORY[0x24BE9FAB8]();
}

uint64_t sub_2206DA0FC()
{
  return MEMORY[0x24BE9FAC0]();
}

uint64_t sub_2206DA108()
{
  return MEMORY[0x24BE9FB60]();
}

uint64_t sub_2206DA114()
{
  return MEMORY[0x24BE9FB68]();
}

uint64_t sub_2206DA120()
{
  return MEMORY[0x24BE9FB78]();
}

uint64_t sub_2206DA12C()
{
  return MEMORY[0x24BE9FB80]();
}

uint64_t sub_2206DA138()
{
  return MEMORY[0x24BE9FBC0]();
}

uint64_t sub_2206DA144()
{
  return MEMORY[0x24BE9FC78]();
}

uint64_t sub_2206DA150()
{
  return MEMORY[0x24BE9FC88]();
}

uint64_t sub_2206DA15C()
{
  return MEMORY[0x24BE9FC90]();
}

uint64_t sub_2206DA168()
{
  return MEMORY[0x24BE9FCA8]();
}

uint64_t sub_2206DA174()
{
  return MEMORY[0x24BE9FCC0]();
}

uint64_t sub_2206DA180()
{
  return MEMORY[0x24BE9FCC8]();
}

uint64_t sub_2206DA18C()
{
  return MEMORY[0x24BE9FCD0]();
}

uint64_t sub_2206DA198()
{
  return MEMORY[0x24BE9FE70]();
}

uint64_t sub_2206DA1A4()
{
  return MEMORY[0x24BE9FF28]();
}

uint64_t sub_2206DA1B0()
{
  return MEMORY[0x24BE9FF38]();
}

uint64_t sub_2206DA1BC()
{
  return MEMORY[0x24BE9FF40]();
}

uint64_t sub_2206DA1C8()
{
  return MEMORY[0x24BE9FF60]();
}

uint64_t sub_2206DA1D4()
{
  return MEMORY[0x24BE9FFC8]();
}

uint64_t sub_2206DA1E0()
{
  return MEMORY[0x24BEA0038]();
}

uint64_t sub_2206DA1EC()
{
  return MEMORY[0x24BEA0058]();
}

uint64_t sub_2206DA1F8()
{
  return MEMORY[0x24BEA00D8]();
}

uint64_t sub_2206DA204()
{
  return MEMORY[0x24BEA0168]();
}

uint64_t sub_2206DA210()
{
  return MEMORY[0x24BEA0180]();
}

uint64_t sub_2206DA21C()
{
  return MEMORY[0x24BEA01A8]();
}

uint64_t sub_2206DA228()
{
  return MEMORY[0x24BEA0398]();
}

uint64_t sub_2206DA234()
{
  return MEMORY[0x24BEA03A8]();
}

uint64_t sub_2206DA240()
{
  return MEMORY[0x24BEA0428]();
}

uint64_t sub_2206DA24C()
{
  return MEMORY[0x24BEA0450]();
}

uint64_t sub_2206DA258()
{
  return MEMORY[0x24BEA0550]();
}

uint64_t sub_2206DA264()
{
  return MEMORY[0x24BEA0568]();
}

uint64_t sub_2206DA270()
{
  return MEMORY[0x24BEA0588]();
}

uint64_t sub_2206DA27C()
{
  return MEMORY[0x24BEA0590]();
}

uint64_t sub_2206DA288()
{
  return MEMORY[0x24BEA0598]();
}

uint64_t sub_2206DA294()
{
  return MEMORY[0x24BEA05A0]();
}

uint64_t sub_2206DA2A0()
{
  return MEMORY[0x24BEA0648]();
}

uint64_t sub_2206DA2AC()
{
  return MEMORY[0x24BEA0658]();
}

uint64_t sub_2206DA2B8()
{
  return MEMORY[0x24BEA0660]();
}

uint64_t sub_2206DA2C4()
{
  return MEMORY[0x24BEA0668]();
}

uint64_t sub_2206DA2D0()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_2206DA2DC()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_2206DA2E8()
{
  return MEMORY[0x24BE930C8]();
}

uint64_t sub_2206DA2F4()
{
  return MEMORY[0x24BEA0708]();
}

uint64_t sub_2206DA300()
{
  return MEMORY[0x24BEA0718]();
}

uint64_t sub_2206DA30C()
{
  return MEMORY[0x24BEA0738]();
}

uint64_t sub_2206DA318()
{
  return MEMORY[0x24BEA0780]();
}

uint64_t sub_2206DA324()
{
  return MEMORY[0x24BEA0798]();
}

uint64_t sub_2206DA330()
{
  return MEMORY[0x24BEA0800]();
}

uint64_t sub_2206DA33C()
{
  return MEMORY[0x24BEA0870]();
}

uint64_t sub_2206DA348()
{
  return MEMORY[0x24BEA08D0]();
}

uint64_t sub_2206DA354()
{
  return MEMORY[0x24BEA0968]();
}

uint64_t sub_2206DA360()
{
  return MEMORY[0x24BEA0980]();
}

uint64_t sub_2206DA36C()
{
  return MEMORY[0x24BEA0990]();
}

uint64_t sub_2206DA378()
{
  return MEMORY[0x24BEA0A48]();
}

uint64_t sub_2206DA384()
{
  return MEMORY[0x24BEA0A90]();
}

uint64_t sub_2206DA390()
{
  return MEMORY[0x24BEA0AF8]();
}

uint64_t sub_2206DA39C()
{
  return MEMORY[0x24BEA0B20]();
}

uint64_t sub_2206DA3A8()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_2206DA3B4()
{
  return MEMORY[0x24BEA0C18]();
}

uint64_t sub_2206DA3C0()
{
  return MEMORY[0x24BEA0C60]();
}

uint64_t sub_2206DA3CC()
{
  return MEMORY[0x24BEA0D08]();
}

uint64_t sub_2206DA3D8()
{
  return MEMORY[0x24BEA10B0]();
}

uint64_t sub_2206DA3E4()
{
  return MEMORY[0x24BEA10E0]();
}

uint64_t sub_2206DA3F0()
{
  return MEMORY[0x24BEA12F8]();
}

uint64_t sub_2206DA3FC()
{
  return MEMORY[0x24BEA1370]();
}

uint64_t sub_2206DA408()
{
  return MEMORY[0x24BEA13A8]();
}

uint64_t sub_2206DA414()
{
  return MEMORY[0x24BEA1418]();
}

uint64_t sub_2206DA420()
{
  return MEMORY[0x24BEA15B8]();
}

uint64_t sub_2206DA42C()
{
  return MEMORY[0x24BEA15D0]();
}

uint64_t sub_2206DA438()
{
  return MEMORY[0x24BEA1740]();
}

uint64_t sub_2206DA444()
{
  return MEMORY[0x24BEA1748]();
}

uint64_t sub_2206DA450()
{
  return MEMORY[0x24BEA1750]();
}

uint64_t sub_2206DA45C()
{
  return MEMORY[0x24BEA1758]();
}

uint64_t sub_2206DA468()
{
  return MEMORY[0x24BEA17F0]();
}

uint64_t sub_2206DA474()
{
  return MEMORY[0x24BEA1808]();
}

uint64_t sub_2206DA480()
{
  return MEMORY[0x24BEA18B0]();
}

uint64_t sub_2206DA48C()
{
  return MEMORY[0x24BEA18E0]();
}

uint64_t sub_2206DA498()
{
  return MEMORY[0x24BEA19F0]();
}

uint64_t sub_2206DA4A4()
{
  return MEMORY[0x24BEA19F8]();
}

uint64_t sub_2206DA4B0()
{
  return MEMORY[0x24BEA1A08]();
}

uint64_t sub_2206DA4BC()
{
  return MEMORY[0x24BEA1A18]();
}

uint64_t sub_2206DA4C8()
{
  return MEMORY[0x24BEA1CD8]();
}

uint64_t sub_2206DA4D4()
{
  return MEMORY[0x24BEA1CE0]();
}

uint64_t sub_2206DA4E0()
{
  return MEMORY[0x24BEA1E18]();
}

uint64_t sub_2206DA4EC()
{
  return MEMORY[0x24BEA1E30]();
}

uint64_t sub_2206DA4F8()
{
  return MEMORY[0x24BEA1F58]();
}

uint64_t sub_2206DA504()
{
  return MEMORY[0x24BEA1F60]();
}

uint64_t sub_2206DA510()
{
  return MEMORY[0x24BEA1F68]();
}

uint64_t sub_2206DA51C()
{
  return MEMORY[0x24BEA1FE0]();
}

uint64_t sub_2206DA528()
{
  return MEMORY[0x24BEA2028]();
}

uint64_t sub_2206DA534()
{
  return MEMORY[0x24BEA2040]();
}

uint64_t sub_2206DA540()
{
  return MEMORY[0x24BEA2050]();
}

uint64_t sub_2206DA54C()
{
  return MEMORY[0x24BEA21B8]();
}

uint64_t sub_2206DA558()
{
  return MEMORY[0x24BEA21C0]();
}

uint64_t sub_2206DA564()
{
  return MEMORY[0x24BEA21C8]();
}

uint64_t sub_2206DA570()
{
  return MEMORY[0x24BEA2250]();
}

uint64_t sub_2206DA57C()
{
  return MEMORY[0x24BEA2270]();
}

uint64_t sub_2206DA588()
{
  return MEMORY[0x24BEA2330]();
}

uint64_t sub_2206DA594()
{
  return MEMORY[0x24BEA2338]();
}

uint64_t sub_2206DA5A0()
{
  return MEMORY[0x24BEA2340]();
}

uint64_t sub_2206DA5AC()
{
  return MEMORY[0x24BEA2460]();
}

uint64_t sub_2206DA5B8()
{
  return MEMORY[0x24BEA2468]();
}

uint64_t sub_2206DA5C4()
{
  return MEMORY[0x24BEA2BC8]();
}

uint64_t sub_2206DA5D0()
{
  return MEMORY[0x24BEA2BD8]();
}

uint64_t sub_2206DA5DC()
{
  return MEMORY[0x24BEA2BE8]();
}

uint64_t sub_2206DA5E8()
{
  return MEMORY[0x24BEA2CA8]();
}

uint64_t sub_2206DA5F4()
{
  return MEMORY[0x24BEA2CE0]();
}

uint64_t sub_2206DA600()
{
  return MEMORY[0x24BEA2FF8]();
}

uint64_t sub_2206DA60C()
{
  return MEMORY[0x24BEA3000]();
}

uint64_t sub_2206DA618()
{
  return MEMORY[0x24BEA3010]();
}

uint64_t sub_2206DA624()
{
  return MEMORY[0x24BEA3310]();
}

uint64_t sub_2206DA630()
{
  return MEMORY[0x24BEA3318]();
}

uint64_t sub_2206DA63C()
{
  return MEMORY[0x24BEA3328]();
}

uint64_t sub_2206DA648()
{
  return MEMORY[0x24BEA3338]();
}

uint64_t sub_2206DA654()
{
  return MEMORY[0x24BEA35F0]();
}

uint64_t sub_2206DA660()
{
  return MEMORY[0x24BEA3600]();
}

uint64_t sub_2206DA66C()
{
  return MEMORY[0x24BEA3638]();
}

uint64_t sub_2206DA678()
{
  return MEMORY[0x24BEA3650]();
}

uint64_t sub_2206DA684()
{
  return MEMORY[0x24BEA3670]();
}

uint64_t sub_2206DA690()
{
  return MEMORY[0x24BEA3710]();
}

uint64_t sub_2206DA69C()
{
  return MEMORY[0x24BEA3820]();
}

uint64_t sub_2206DA6A8()
{
  return MEMORY[0x24BE941F0]();
}

uint64_t sub_2206DA6B4()
{
  return MEMORY[0x24BE92EC0]();
}

uint64_t sub_2206DA6C0()
{
  return MEMORY[0x24BEA87F0]();
}

uint64_t sub_2206DA6CC()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_2206DA6D8()
{
  return MEMORY[0x24BEA88F8]();
}

uint64_t sub_2206DA6E4()
{
  return MEMORY[0x24BEA8900]();
}

uint64_t sub_2206DA6F0()
{
  return MEMORY[0x24BEA8A48]();
}

uint64_t sub_2206DA6FC()
{
  return MEMORY[0x24BEA8AB8]();
}

uint64_t sub_2206DA708()
{
  return MEMORY[0x24BEA8AE8]();
}

uint64_t sub_2206DA714()
{
  return MEMORY[0x24BEA8BD0]();
}

uint64_t sub_2206DA720()
{
  return MEMORY[0x24BEA8BD8]();
}

uint64_t sub_2206DA72C()
{
  return MEMORY[0x24BEA8DC8]();
}

uint64_t sub_2206DA738()
{
  return MEMORY[0x24BE92390]();
}

uint64_t sub_2206DA744()
{
  return MEMORY[0x24BE92398]();
}

uint64_t sub_2206DA750()
{
  return MEMORY[0x24BE923B8]();
}

uint64_t sub_2206DA75C()
{
  return MEMORY[0x24BE925B8]();
}

uint64_t sub_2206DA768()
{
  return MEMORY[0x24BE925C8]();
}

uint64_t sub_2206DA774()
{
  return MEMORY[0x24BE925D8]();
}

uint64_t sub_2206DA780()
{
  return MEMORY[0x24BE927E8]();
}

uint64_t sub_2206DA78C()
{
  return MEMORY[0x24BE927F0]();
}

uint64_t sub_2206DA798()
{
  return MEMORY[0x24BE92808]();
}

uint64_t sub_2206DA7A4()
{
  return MEMORY[0x24BE92828]();
}

uint64_t sub_2206DA7B0()
{
  return MEMORY[0x24BE92848]();
}

uint64_t sub_2206DA7BC()
{
  return MEMORY[0x24BE92860]();
}

uint64_t sub_2206DA7C8()
{
  return MEMORY[0x24BE92878]();
}

uint64_t sub_2206DA7D4()
{
  return MEMORY[0x24BE92880]();
}

uint64_t sub_2206DA7E0()
{
  return MEMORY[0x24BE92888]();
}

uint64_t sub_2206DA7EC()
{
  return MEMORY[0x24BE92898]();
}

uint64_t sub_2206DA7F8()
{
  return MEMORY[0x24BE928A0]();
}

uint64_t sub_2206DA804()
{
  return MEMORY[0x24BE928A8]();
}

uint64_t sub_2206DA810()
{
  return MEMORY[0x24BE928B0]();
}

uint64_t sub_2206DA81C()
{
  return MEMORY[0x24BE928C0]();
}

uint64_t sub_2206DA828()
{
  return MEMORY[0x24BE928D0]();
}

uint64_t sub_2206DA834()
{
  return MEMORY[0x24BE928E0]();
}

uint64_t sub_2206DA840()
{
  return MEMORY[0x24BE928E8]();
}

uint64_t sub_2206DA84C()
{
  return MEMORY[0x24BE928F8]();
}

uint64_t sub_2206DA858()
{
  return MEMORY[0x24BE929A8]();
}

uint64_t sub_2206DA864()
{
  return MEMORY[0x24BE929B0]();
}

uint64_t sub_2206DA870()
{
  return MEMORY[0x24BE929C8]();
}

uint64_t sub_2206DA87C()
{
  return MEMORY[0x24BE929F0]();
}

uint64_t sub_2206DA888()
{
  return MEMORY[0x24BE92A00]();
}

uint64_t sub_2206DA894()
{
  return MEMORY[0x24BE92A10]();
}

uint64_t sub_2206DA8A0()
{
  return MEMORY[0x24BE92A28]();
}

uint64_t sub_2206DA8AC()
{
  return MEMORY[0x24BE92A38]();
}

uint64_t sub_2206DA8B8()
{
  return MEMORY[0x24BE92AF8]();
}

uint64_t sub_2206DA8C4()
{
  return MEMORY[0x24BE92B00]();
}

uint64_t sub_2206DA8D0()
{
  return MEMORY[0x24BE92B18]();
}

uint64_t sub_2206DA8DC()
{
  return MEMORY[0x24BE92B20]();
}

uint64_t sub_2206DA8E8()
{
  return MEMORY[0x24BE92B28]();
}

uint64_t sub_2206DA8F4()
{
  return MEMORY[0x24BE92B30]();
}

uint64_t sub_2206DA900()
{
  return MEMORY[0x24BE92B38]();
}

uint64_t sub_2206DA90C()
{
  return MEMORY[0x24BE92B40]();
}

uint64_t sub_2206DA918()
{
  return MEMORY[0x24BE92B48]();
}

uint64_t sub_2206DA924()
{
  return MEMORY[0x24BE92B58]();
}

uint64_t sub_2206DA930()
{
  return MEMORY[0x24BE92B60]();
}

uint64_t sub_2206DA93C()
{
  return MEMORY[0x24BE92B78]();
}

uint64_t sub_2206DA948()
{
  return MEMORY[0x24BE92BF8]();
}

uint64_t sub_2206DA954()
{
  return MEMORY[0x24BE92C08]();
}

uint64_t sub_2206DA960()
{
  return MEMORY[0x24BE92C10]();
}

uint64_t sub_2206DA96C()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t sub_2206DA978()
{
  return MEMORY[0x24BE90B78]();
}

uint64_t sub_2206DA984()
{
  return MEMORY[0x24BE90B88]();
}

uint64_t sub_2206DA990()
{
  return MEMORY[0x24BE90BB8]();
}

uint64_t sub_2206DA99C()
{
  return MEMORY[0x24BE92F00]();
}

uint64_t sub_2206DA9A8()
{
  return MEMORY[0x24BE94658]();
}

uint64_t sub_2206DA9B4()
{
  return MEMORY[0x24BDC6D30]();
}

uint64_t sub_2206DA9C0()
{
  return MEMORY[0x24BDC6D48]();
}

uint64_t sub_2206DA9CC()
{
  return MEMORY[0x24BE946F0]();
}

uint64_t sub_2206DA9D8()
{
  return MEMORY[0x24BEA54A8]();
}

uint64_t sub_2206DA9E4()
{
  return MEMORY[0x24BEA54B0]();
}

uint64_t sub_2206DA9F0()
{
  return MEMORY[0x24BEA54E8]();
}

uint64_t sub_2206DA9FC()
{
  return MEMORY[0x24BEA54F8]();
}

uint64_t sub_2206DAA08()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_2206DAA14()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_2206DAA20()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_2206DAA2C()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_2206DAA38()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_2206DAA44()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_2206DAA50()
{
  return MEMORY[0x24BEA5578]();
}

uint64_t sub_2206DAA5C()
{
  return MEMORY[0x24BEA5580]();
}

uint64_t sub_2206DAA68()
{
  return MEMORY[0x24BEA5680]();
}

uint64_t sub_2206DAA74()
{
  return MEMORY[0x24BEA59D8]();
}

uint64_t sub_2206DAA80()
{
  return MEMORY[0x24BEA59F0]();
}

uint64_t sub_2206DAA8C()
{
  return MEMORY[0x24BEA5A18]();
}

uint64_t sub_2206DAA98()
{
  return MEMORY[0x24BEA5A40]();
}

uint64_t sub_2206DAAA4()
{
  return MEMORY[0x24BEA5A68]();
}

uint64_t sub_2206DAAB0()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_2206DAABC()
{
  return MEMORY[0x24BEA5AD0]();
}

uint64_t sub_2206DAAC8()
{
  return MEMORY[0x24BEE5370]();
}

uint64_t sub_2206DAAD4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2206DAAE0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2206DAAEC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2206DAAF8()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2206DAB04()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2206DAB10()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_2206DAB1C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2206DAB28()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2206DAB34()
{
  return MEMORY[0x24BEE02A8]();
}

uint64_t sub_2206DAB40()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2206DAB4C()
{
  return MEMORY[0x24BEE03E8]();
}

uint64_t sub_2206DAB58()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_2206DAB64()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_2206DAB70()
{
  return MEMORY[0x24BEE0630]();
}

uint64_t sub_2206DAB7C()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t sub_2206DAB88()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2206DAB94()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2206DABA0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2206DABAC()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_2206DABB8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2206DABC4()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2206DABD0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2206DABDC()
{
  return MEMORY[0x24BEE09F8]();
}

uint64_t sub_2206DABE8()
{
  return MEMORY[0x24BEE0A00]();
}

uint64_t sub_2206DABF4()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2206DAC00()
{
  return MEMORY[0x24BE92C48]();
}

uint64_t sub_2206DAC0C()
{
  return MEMORY[0x24BEE0A78]();
}

uint64_t sub_2206DAC18()
{
  return MEMORY[0x24BEE0AE0]();
}

uint64_t sub_2206DAC24()
{
  return MEMORY[0x24BEE0AF0]();
}

uint64_t sub_2206DAC30()
{
  return MEMORY[0x24BEE0AF8]();
}

uint64_t sub_2206DAC3C()
{
  return MEMORY[0x24BEE0B08]();
}

uint64_t sub_2206DAC48()
{
  return MEMORY[0x24BEE0BF8]();
}

uint64_t sub_2206DAC54()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2206DAC60()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_2206DAC6C()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_2206DAC78()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_2206DAC84()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_2206DAC90()
{
  return MEMORY[0x24BEE0EE8]();
}

uint64_t sub_2206DAC9C()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t sub_2206DACA8()
{
  return MEMORY[0x24BEE0F48]();
}

uint64_t sub_2206DACB4()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_2206DACC0()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_2206DACCC()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_2206DACD8()
{
  return MEMORY[0x24BEE1108]();
}

uint64_t sub_2206DACE4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2206DACF0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2206DACFC()
{
  return MEMORY[0x24BEE1170]();
}

uint64_t sub_2206DAD08()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2206DAD14()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2206DAD20()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t sub_2206DAD2C()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_2206DAD38()
{
  return MEMORY[0x24BEE5F00]();
}

uint64_t sub_2206DAD44()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2206DAD50()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_2206DAD5C()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_2206DAD68()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_2206DAD74()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2206DAD80()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2206DAD8C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2206DAD98()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2206DADA4()
{
  return MEMORY[0x24BDCFC40]();
}

uint64_t sub_2206DADB0()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_2206DADBC()
{
  return MEMORY[0x24BEE1380]();
}

uint64_t sub_2206DADC8()
{
  return MEMORY[0x24BEE13A0]();
}

uint64_t sub_2206DADD4()
{
  return MEMORY[0x24BEE1450]();
}

uint64_t sub_2206DADE0()
{
  return MEMORY[0x24BEE1458]();
}

uint64_t sub_2206DADEC()
{
  return MEMORY[0x24BDCFC78]();
}

uint64_t sub_2206DADF8()
{
  return MEMORY[0x24BEE1498]();
}

uint64_t sub_2206DAE04()
{
  return MEMORY[0x24BEE14C0]();
}

uint64_t sub_2206DAE10()
{
  return MEMORY[0x24BEE1578]();
}

uint64_t sub_2206DAE1C()
{
  return MEMORY[0x24BEE1580]();
}

uint64_t sub_2206DAE28()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_2206DAE34()
{
  return MEMORY[0x24BEE15B8]();
}

uint64_t sub_2206DAE40()
{
  return MEMORY[0x24BEE15D0]();
}

uint64_t sub_2206DAE4C()
{
  return MEMORY[0x24BEE1670]();
}

uint64_t sub_2206DAE58()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t sub_2206DAE64()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2206DAE70()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_2206DAE7C()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_2206DAE88()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_2206DAE94()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_2206DAEA0()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_2206DAEAC()
{
  return MEMORY[0x24BEE1A10]();
}

uint64_t sub_2206DAEB8()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_2206DAEC4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2206DAED0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2206DAEDC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2206DAEE8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2206DAEF4()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_2206DAF00()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2206DAF0C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2206DAF18()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_2206DAF24()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_2206DAF30()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2206DAF3C()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_2206DAF48()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2206DAF54()
{
  return MEMORY[0x24BE99138]();
}

uint64_t sub_2206DAF60()
{
  return MEMORY[0x24BDD02D8]();
}

uint64_t sub_2206DAF6C()
{
  return MEMORY[0x24BDD02E8]();
}

uint64_t sub_2206DAF78()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_2206DAF84()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2206DAF90()
{
  return MEMORY[0x24BEE1BE0]();
}

uint64_t sub_2206DAF9C()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t sub_2206DAFA8()
{
  return MEMORY[0x24BEE1C20]();
}

uint64_t sub_2206DAFB4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2206DAFC0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2206DAFCC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2206DAFD8()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_2206DAFE4()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_2206DAFF0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2206DAFFC()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_2206DB008()
{
  return MEMORY[0x24BEE2278]();
}

uint64_t sub_2206DB014()
{
  return MEMORY[0x24BEE2280]();
}

uint64_t sub_2206DB020()
{
  return MEMORY[0x24BEE2288]();
}

uint64_t sub_2206DB02C()
{
  return MEMORY[0x24BEE2290]();
}

uint64_t sub_2206DB038()
{
  return MEMORY[0x24BEE2298]();
}

uint64_t sub_2206DB044()
{
  return MEMORY[0x24BEE22A0]();
}

uint64_t sub_2206DB050()
{
  return MEMORY[0x24BEE22A8]();
}

uint64_t sub_2206DB05C()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_2206DB068()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2206DB074()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_2206DB080()
{
  return MEMORY[0x24BEE2380]();
}

uint64_t sub_2206DB08C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2206DB098()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2206DB0A4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2206DB0B0()
{
  return MEMORY[0x24BEE2768]();
}

uint64_t sub_2206DB0BC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2206DB0C8()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_2206DB0D4()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_2206DB0E0()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_2206DB0EC()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_2206DB0F8()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_2206DB104()
{
  return MEMORY[0x24BEE2BF8]();
}

uint64_t sub_2206DB110()
{
  return MEMORY[0x24BEE2D18]();
}

uint64_t sub_2206DB11C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2206DB128()
{
  return MEMORY[0x24BEE2F60]();
}

uint64_t sub_2206DB134()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2206DB140()
{
  return MEMORY[0x24BEE3280]();
}

uint64_t sub_2206DB14C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2206DB158()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2206DB164()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2206DB170()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2206DB17C()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2206DB188()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2206DB194()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2206DB1A0()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_2206DB1AC()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2206DB1B8()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2206DB1C4()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2206DB1D0()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2206DB1DC()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2206DB1E8()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2206DB1F4()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2206DB200()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2206DB20C()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_2206DB218()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2206DB224()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2206DB230()
{
  return MEMORY[0x24BEE38F0]();
}

uint64_t sub_2206DB23C()
{
  return MEMORY[0x24BEE3940]();
}

uint64_t sub_2206DB248()
{
  return MEMORY[0x24BEE3948]();
}

uint64_t sub_2206DB254()
{
  return MEMORY[0x24BEE3950]();
}

uint64_t sub_2206DB260()
{
  return MEMORY[0x24BEE3A18]();
}

uint64_t sub_2206DB26C()
{
  return MEMORY[0x24BEE5F58]();
}

uint64_t sub_2206DB278()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2206DB284()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_2206DB290()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2206DB29C()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_2206DB2A8()
{
  return MEMORY[0x24BEE3DF8]();
}

uint64_t sub_2206DB2B4()
{
  return MEMORY[0x24BEE3E08]();
}

uint64_t sub_2206DB2C0()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_2206DB2CC()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_2206DB2D8()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2206DB2E4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2206DB2F0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2206DB2FC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2206DB308()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2206DB314()
{
  return MEMORY[0x24BEE42F0]();
}

uint64_t sub_2206DB320()
{
  return MEMORY[0x24BE92C58]();
}

uint64_t sub_2206DB32C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2206DB338()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2206DB344()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2206DB350()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2206DB35C()
{
  return MEMORY[0x24BEE4A20]();
}

uint64_t sub_2206DB368()
{
  return MEMORY[0x24BEE4A28]();
}

uint64_t sub_2206DB374()
{
  return MEMORY[0x24BEE4A30]();
}

uint64_t sub_2206DB380()
{
  return MEMORY[0x24BEE4A38]();
}

uint64_t sub_2206DB38C()
{
  return MEMORY[0x24BEE4A40]();
}

uint64_t sub_2206DB398()
{
  return MEMORY[0x24BEE4A48]();
}

uint64_t sub_2206DB3A4()
{
  return MEMORY[0x24BEE4A50]();
}

uint64_t sub_2206DB3B0()
{
  return MEMORY[0x24BEE4A58]();
}

uint64_t sub_2206DB3BC()
{
  return MEMORY[0x24BEE4A60]();
}

uint64_t sub_2206DB3C8()
{
  return MEMORY[0x24BEE4A68]();
}

uint64_t sub_2206DB3D4()
{
  return MEMORY[0x24BEE4A70]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x24BE08CC8]();
}

uint64_t AFGetFlashlightLevel()
{
  return MEMORY[0x24BE08D20]();
}

uint64_t BKSDisplayBrightnessIsBrightnessLevelControlAvailable()
{
  return MEMORY[0x24BE0B500]();
}

uint64_t BKSDisplayBrightnessSetAutoBrightnessEnabled()
{
  return MEMORY[0x24BE0B510]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x24BDD9900]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x24BDD9918]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t UISUserInterfaceStyleModeValueIsAutomatic()
{
  return MEMORY[0x24BEBECA8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientSetInCarState()
{
  return MEMORY[0x24BE67AF8]();
}

uint64_t _AXDarkenSystemColors()
{
  return MEMORY[0x24BED1FF8]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x24BED2050]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x24BED2070]();
}

uint64_t _AXSAssistiveTouchScannerSetEnabled()
{
  return MEMORY[0x24BED2078]();
}

uint64_t _AXSAutoBrightnessEnabled()
{
  return MEMORY[0x24BED20B8]();
}

uint64_t _AXSBlueYellowFilterEnabled()
{
  return MEMORY[0x24BED20F0]();
}

uint64_t _AXSBlueYellowFilterSetEnabled()
{
  return MEMORY[0x24BED20F8]();
}

uint64_t _AXSButtonShapesEnabled()
{
  return MEMORY[0x24BED2100]();
}

uint64_t _AXSClassicInvertColorsEnabled()
{
  return MEMORY[0x24BED2138]();
}

uint64_t _AXSClassicInvertColorsSetEnabled()
{
  return MEMORY[0x24BED2140]();
}

uint64_t _AXSColorTintFilterEnabled()
{
  return MEMORY[0x24BED2150]();
}

uint64_t _AXSColorTintSetEnabled()
{
  return MEMORY[0x24BED2158]();
}

uint64_t _AXSCommandAndControlCarPlayEnabled()
{
  return MEMORY[0x24BED2160]();
}

uint64_t _AXSCommandAndControlCarPlaySetEnabled()
{
  return MEMORY[0x24BED2168]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

uint64_t _AXSCommandAndControlSetEnabled()
{
  return MEMORY[0x24BED2178]();
}

uint64_t _AXSDifferentiateWithoutColorEnabled()
{
  return MEMORY[0x24BED21C0]();
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return MEMORY[0x24BED21D0]();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x24BED21D8]();
}

uint64_t _AXSGrayscaleEnabled()
{
  return MEMORY[0x24BED2218]();
}

uint64_t _AXSGrayscaleSetEnabled()
{
  return MEMORY[0x24BED2220]();
}

uint64_t _AXSGreenRedFilterEnabled()
{
  return MEMORY[0x24BED2228]();
}

uint64_t _AXSGreenRedFilterSetEnabled()
{
  return MEMORY[0x24BED2230]();
}

uint64_t _AXSIncreaseButtonLegibility()
{
  return MEMORY[0x24BED22D8]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x24BED22E0]();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return MEMORY[0x24BED22F8]();
}

uint64_t _AXSMotionCuesEnabled()
{
  return MEMORY[0x24BED2350]();
}

uint64_t _AXSRedGreenFilterEnabled()
{
  return MEMORY[0x24BED23D8]();
}

uint64_t _AXSRedGreenFilterSetEnabled()
{
  return MEMORY[0x24BED23E0]();
}

uint64_t _AXSReduceWhitePointEnabled()
{
  return MEMORY[0x24BED23F0]();
}

uint64_t _AXSSetButtonShapesEnabled()
{
  return MEMORY[0x24BED2438]();
}

uint64_t _AXSSetDarkenSystemColors()
{
  return MEMORY[0x24BED2448]();
}

uint64_t _AXSSetDifferentiateWithoutColorEnabled()
{
  return MEMORY[0x24BED2450]();
}

uint64_t _AXSSetEnhanceBackgroundContrastEnabled()
{
  return MEMORY[0x24BED2458]();
}

uint64_t _AXSSetEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x24BED2460]();
}

uint64_t _AXSSetIncreaseButtonLegibility()
{
  return MEMORY[0x24BED2478]();
}

uint64_t _AXSSetMotionCuesMode()
{
  return MEMORY[0x24BED2488]();
}

uint64_t _AXSSetReduceWhitePointEnabled()
{
  return MEMORY[0x24BED24B0]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x24BED25B8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _availability_version_check()
{
  return MEMORY[0x24BDAC970]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x24BEE4B40]();
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

long double round(long double __x)
{
  long double result;

  MEMORY[0x24BDAFBC8](__x);
  return result;
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

