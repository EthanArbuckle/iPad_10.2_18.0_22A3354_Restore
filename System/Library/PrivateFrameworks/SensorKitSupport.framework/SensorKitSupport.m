unint64_t sub_21C87A074()
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
  char *v9;
  uint64_t inited;
  int *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double *v43;
  double v44;
  uint64_t v45;
  double *v46;
  double v47;
  char *v48;
  int v49;
  uint64_t v50;
  char v51;
  unint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char *v61;
  int64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  _QWORD *v74;
  int64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  char v84;
  unint64_t v85;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  _OWORD v96[2];
  __int128 v97;
  uint64_t v98;

  v1 = type metadata accessor for StreamBlock.EventBlock(0);
  v89 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v94 = (uint64_t)&v87 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for StreamBlock.PCMBlock(0);
  v88 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v93 = (uint64_t)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_21C8880A4();
  v5 = *(_QWORD *)(v92 - 8);
  v6 = MEMORY[0x24BDAC7A8](v92);
  v90 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v87 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C47F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C888610;
  *(_QWORD *)(inited + 32) = 0x6F4D726F736E6573;
  *(_QWORD *)(inited + 40) = 0xEB000000006C6564;
  v11 = (int *)type metadata accessor for StreamBlock(0);
  v12 = (_QWORD *)((char *)v0 + v11[7]);
  v13 = v12[1];
  if (v13)
  {
    v14 = *v12;
    v15 = v13;
  }
  else
  {
    v14 = 0;
    v15 = 0xE000000000000000;
  }
  v16 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v14;
  *(_QWORD *)(inited + 56) = v15;
  *(_QWORD *)(inited + 72) = v16;
  *(_QWORD *)(inited + 80) = 0x4449726F736E6573;
  *(_QWORD *)(inited + 88) = 0xE800000000000000;
  v17 = (_QWORD *)((char *)v0 + v11[10]);
  v18 = *v17;
  v19 = v17[1];
  v91 = v0;
  if (v19 >> 60 == 15)
    v20 = 0;
  else
    v20 = v18;
  if (v19 >> 60 == 15)
    v21 = 0xC000000000000000;
  else
    v21 = v19;
  swift_bridgeObjectRetain();
  v22 = v19;
  v23 = v91;
  sub_21C87A864(v18, v22);
  sub_21C8874BC(v20, v21);
  v24 = sub_21C88808C();
  v26 = v25;
  v27 = *(void (**)(char *, uint64_t))(v5 + 8);
  v28 = v9;
  v29 = MEMORY[0x24BEE0D00];
  v27(v28, v92);
  *(_QWORD *)(inited + 96) = v24;
  *(_QWORD *)(inited + 104) = v26;
  *(_QWORD *)(inited + 120) = v29;
  *(_QWORD *)(inited + 128) = 0x656E6F5A656D6974;
  *(_QWORD *)(inited + 136) = 0xE800000000000000;
  v30 = (_QWORD *)((char *)v23 + v11[11]);
  v31 = v30[1];
  if (v31)
  {
    v32 = *v30;
    v33 = v31;
  }
  else
  {
    v32 = 0;
    v33 = 0xE000000000000000;
  }
  *(_QWORD *)(inited + 144) = v32;
  *(_QWORD *)(inited + 152) = v33;
  *(_QWORD *)(inited + 168) = v29;
  *(_QWORD *)(inited + 176) = 0x496E6F6973736573;
  *(_QWORD *)(inited + 184) = 0xE900000000000044;
  v34 = (_QWORD *)((char *)v23 + v11[12]);
  v35 = *v34;
  v36 = v34[1];
  if (v36 >> 60 == 15)
    v37 = 0;
  else
    v37 = *v34;
  if (v36 >> 60 == 15)
    v38 = 0xC000000000000000;
  else
    v38 = v34[1];
  swift_bridgeObjectRetain();
  sub_21C87A864(v35, v36);
  v39 = v90;
  sub_21C8874BC(v37, v38);
  v40 = sub_21C88808C();
  v42 = v41;
  v27(v39, v92);
  *(_QWORD *)(inited + 192) = v40;
  *(_QWORD *)(inited + 200) = v42;
  *(_QWORD *)(inited + 216) = v29;
  *(_QWORD *)(inited + 224) = 0xD000000000000010;
  *(_QWORD *)(inited + 232) = 0x800000021C8892F0;
  v43 = (double *)((char *)v23 + v11[13]);
  v44 = *v43;
  if (*((_BYTE *)v43 + 8))
    v44 = 0.0;
  v45 = MEMORY[0x24BEE13C8];
  *(double *)(inited + 240) = v44;
  *(_QWORD *)(inited + 264) = v45;
  *(_QWORD *)(inited + 272) = 0xD000000000000010;
  *(_QWORD *)(inited + 280) = 0x800000021C889310;
  v46 = (double *)((char *)v23 + v11[14]);
  v47 = *v46;
  if (*((_BYTE *)v46 + 8))
    v47 = 0.0;
  *(double *)(inited + 288) = v47;
  *(_QWORD *)(inited + 312) = v45;
  *(_QWORD *)(inited + 320) = 0x646E496B636F6C62;
  *(_QWORD *)(inited + 328) = 0xEA00000000007865;
  v48 = (char *)v23 + v11[15];
  if (v48[4])
    v49 = 0;
  else
    v49 = *(_DWORD *)v48;
  v50 = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 336) = v49;
  *(_QWORD *)(inited + 360) = v50;
  *(_QWORD *)(inited + 368) = 0x6C427473614C7369;
  *(_QWORD *)(inited + 376) = 0xEB000000006B636FLL;
  v51 = *((_BYTE *)v23 + v11[16]) & 1;
  *(_QWORD *)(inited + 408) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 384) = v51;
  v52 = sub_21C87A8BC(inited);
  v53 = (_QWORD *)((char *)v23 + v11[8]);
  v54 = v53[1];
  if (v54)
  {
    v55 = *v53;
    v98 = v29;
    *(_QWORD *)&v97 = v55;
    *((_QWORD *)&v97 + 1) = v54;
    sub_21C87C358(&v97, v96);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v95 = v52;
    sub_21C87BEE0(v96, 0x6552726F736E6573, 0xEE006E6F69736976, isUniquelyReferenced_nonNull_native);
    v52 = v95;
    swift_bridgeObjectRelease();
  }
  v57 = (_QWORD *)((char *)v23 + v11[9]);
  v58 = v57[1];
  if (v58)
  {
    v59 = *v57;
    v98 = v29;
    *(_QWORD *)&v97 = v59;
    *((_QWORD *)&v97 + 1) = v58;
    sub_21C87C358(&v97, v96);
    swift_bridgeObjectRetain();
    v60 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v52;
    sub_21C87BEE0(v96, 0x614E726F736E6573, 0xEA0000000000656DLL, v60);
    v52 = v95;
    swift_bridgeObjectRelease();
  }
  v61 = (char *)*v23;
  v62 = *(_QWORD *)(*v23 + 16);
  v63 = MEMORY[0x24BEE4AF8];
  if (v62)
  {
    v92 = v52;
    *(_QWORD *)&v97 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_21C87C33C(0, v62, 0);
    v64 = *(unsigned __int8 *)(v88 + 80);
    v90 = v61;
    v65 = (uint64_t)&v61[(v64 + 32) & ~v64];
    v66 = *(_QWORD *)(v88 + 72);
    v63 = v97;
    do
    {
      v67 = v93;
      sub_21C87C368(v65, v93, type metadata accessor for StreamBlock.PCMBlock);
      v68 = sub_21C87A9E4();
      sub_21C87C3AC(v67, type metadata accessor for StreamBlock.PCMBlock);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21C87C33C(0, *(_QWORD *)(v63 + 16) + 1, 1);
        v63 = v97;
      }
      v70 = *(_QWORD *)(v63 + 16);
      v69 = *(_QWORD *)(v63 + 24);
      if (v70 >= v69 >> 1)
      {
        sub_21C87C33C((_QWORD *)(v69 > 1), v70 + 1, 1);
        v63 = v97;
      }
      *(_QWORD *)(v63 + 16) = v70 + 1;
      *(_QWORD *)(v63 + 8 * v70 + 32) = v68;
      v65 += v66;
      --v62;
    }
    while (v62);
    swift_bridgeObjectRelease();
    v23 = v91;
    v52 = v92;
  }
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C47F8);
  v98 = v71;
  *(_QWORD *)&v97 = v63;
  sub_21C87C358(&v97, v96);
  v72 = swift_isUniquelyReferenced_nonNull_native();
  v95 = v52;
  sub_21C87BEE0(v96, 0x6B636F6C426D6370, 0xE900000000000073, v72);
  v73 = v95;
  swift_bridgeObjectRelease();
  v74 = (_QWORD *)v23[1];
  v75 = v74[2];
  v76 = MEMORY[0x24BEE4AF8];
  if (v75)
  {
    v92 = v73;
    v93 = v71;
    *(_QWORD *)&v97 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_21C87C33C(0, v75, 0);
    v77 = *(unsigned __int8 *)(v89 + 80);
    v91 = v74;
    v78 = (uint64_t)v74 + ((v77 + 32) & ~v77);
    v79 = *(_QWORD *)(v89 + 72);
    v76 = v97;
    do
    {
      v80 = v94;
      sub_21C87C368(v78, v94, type metadata accessor for StreamBlock.EventBlock);
      v81 = sub_21C87B0D4();
      sub_21C87C3AC(v80, type metadata accessor for StreamBlock.EventBlock);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21C87C33C(0, *(_QWORD *)(v76 + 16) + 1, 1);
        v76 = v97;
      }
      v83 = *(_QWORD *)(v76 + 16);
      v82 = *(_QWORD *)(v76 + 24);
      if (v83 >= v82 >> 1)
      {
        sub_21C87C33C((_QWORD *)(v82 > 1), v83 + 1, 1);
        v76 = v97;
      }
      *(_QWORD *)(v76 + 16) = v83 + 1;
      *(_QWORD *)(v76 + 8 * v83 + 32) = v81;
      v78 += v79;
      --v75;
    }
    while (v75);
    swift_bridgeObjectRelease();
    v73 = v92;
    v71 = v93;
  }
  v98 = v71;
  *(_QWORD *)&v97 = v76;
  sub_21C87C358(&v97, v96);
  v84 = swift_isUniquelyReferenced_nonNull_native();
  v95 = v73;
  sub_21C87BEE0(v96, 0x6F6C42746E657665, 0xEB00000000736B63, v84);
  v85 = v95;
  swift_bridgeObjectRelease();
  return v85;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220783F10]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21C87A864(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21C87A878(a1, a2);
  return a1;
}

uint64_t sub_21C87A878(uint64_t a1, unint64_t a2)
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

unint64_t sub_21C87A8BC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4818);
  v2 = sub_21C8882A8();
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
    sub_21C87C788(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_21C87B8BC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21C87C358(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_21C87A9E4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  int *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t inited;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int v19;
  uint64_t v20;
  char *v21;
  int v22;
  unsigned int *v23;
  uint64_t v24;
  double *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double *v29;
  double v30;
  double *v31;
  double v32;
  char *v33;
  int v34;
  char *v35;
  int v36;
  unint64_t v37;
  uint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v44;
  unint64_t v46;
  _OWORD v47[2];
  __int128 v48;
  uint64_t v49;
  unint64_t v50;

  v1 = v0;
  v2 = sub_21C888260();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_21C888080();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2552C47B8 != -1)
    swift_once();
  v7 = (void *)qword_2552C47C0;
  v8 = (int *)type metadata accessor for StreamBlock.PCMBlock(0);
  v9 = v7;
  sub_21C888068();
  v10 = (void *)sub_21C888074();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11 = objc_msgSend(v9, sel_stringFromDate_, v10);

  v12 = sub_21C88823C();
  v14 = v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C47F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C888620;
  strcpy((char *)(inited + 32), "channelNames");
  *(_BYTE *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  v16 = *v1;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4800);
  *(_QWORD *)(inited + 48) = v16;
  *(_QWORD *)(inited + 72) = v17;
  strcpy((char *)(inited + 80), "bitsPerChannel");
  *(_BYTE *)(inited + 95) = -18;
  v18 = (char *)v1 + v8[6];
  if (v18[4])
    v19 = 0;
  else
    v19 = *(_DWORD *)v18;
  v20 = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 96) = v19;
  *(_QWORD *)(inited + 120) = v20;
  strcpy((char *)(inited + 128), "bytesPerFrame");
  *(_WORD *)(inited + 142) = -4864;
  v21 = (char *)v1 + v8[7];
  if (v21[4])
    v22 = 0;
  else
    v22 = *(_DWORD *)v21;
  *(_DWORD *)(inited + 144) = v22;
  *(_QWORD *)(inited + 168) = v20;
  *(_QWORD *)(inited + 176) = 0x6C4674616D726F66;
  *(_QWORD *)(inited + 184) = 0xEB00000000736761;
  v23 = (unsigned int *)((char *)v1 + v8[8]);
  if (*((_BYTE *)v23 + 4))
    v24 = 0;
  else
    v24 = *v23;
  *(_DWORD *)(inited + 192) = v24;
  *(_QWORD *)(inited + 216) = v20;
  *(_QWORD *)(inited + 224) = 0xD000000000000011;
  *(_QWORD *)(inited + 232) = 0x800000021C889370;
  v25 = (double *)((char *)v1 + v8[9]);
  v26 = *v25;
  if (*((_BYTE *)v25 + 8))
    v26 = 0.0;
  v27 = MEMORY[0x24BEE13C8];
  *(double *)(inited + 240) = v26;
  *(_QWORD *)(inited + 264) = v27;
  *(_QWORD *)(inited + 272) = 0x7461447472617473;
  v28 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 280) = 0xE900000000000065;
  *(_QWORD *)(inited + 288) = v12;
  *(_QWORD *)(inited + 296) = v14;
  *(_QWORD *)(inited + 312) = v28;
  *(_QWORD *)(inited + 320) = 0x6D69547472617473;
  *(_QWORD *)(inited + 328) = 0xE900000000000065;
  v29 = (double *)((char *)v1 + v8[11]);
  v30 = *v29;
  if (*((_BYTE *)v29 + 8))
    v30 = 0.0;
  *(double *)(inited + 336) = v30;
  *(_QWORD *)(inited + 360) = v27;
  *(_QWORD *)(inited + 368) = 0x656D6954646E65;
  *(_QWORD *)(inited + 376) = 0xE700000000000000;
  v31 = (double *)((char *)v1 + v8[12]);
  v32 = *v31;
  if (*((_BYTE *)v31 + 8))
    v32 = 0.0;
  *(double *)(inited + 384) = v32;
  *(_QWORD *)(inited + 408) = v27;
  *(_QWORD *)(inited + 416) = 0x646E49656D617266;
  *(_QWORD *)(inited + 424) = 0xEA00000000007865;
  v33 = (char *)v1 + v8[13];
  if (v33[4])
    v34 = 0;
  else
    v34 = *(_DWORD *)v33;
  *(_DWORD *)(inited + 432) = v34;
  *(_QWORD *)(inited + 456) = v20;
  *(_QWORD *)(inited + 464) = 0x756F43656D617266;
  *(_QWORD *)(inited + 472) = 0xEA0000000000746ELL;
  v35 = (char *)v1 + v8[14];
  if (v35[4])
    v36 = 0;
  else
    v36 = *(_DWORD *)v35;
  *(_QWORD *)(inited + 504) = v20;
  *(_DWORD *)(inited + 480) = v36;
  swift_bridgeObjectRetain();
  v37 = sub_21C87A8BC(inited);
  v50 = v37;
  v38 = (uint64_t *)((char *)v1 + v8[15]);
  v39 = v38[1];
  if (v39 >> 60 == 15)
    v40 = 0;
  else
    v40 = *v38;
  if (v39 >> 60 == 15)
    v41 = 0xC000000000000000;
  else
    v41 = v38[1];
  sub_21C87A864(*v38, v39);
  v42 = sub_21C884488(v19, v24, v40, v41);
  sub_21C87C464(v40, v41);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4810);
  *(_QWORD *)&v48 = v42;
  sub_21C87C358(&v48, v47);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v46 = v37;
  sub_21C87BEE0(v47, 0x73656D617266, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
  v44 = v46;
  swift_bridgeObjectRelease();
  return v44;
}

uint64_t sub_21C87AFB8(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_21C87C33C(0, v5, 0);
    v6 = v17;
    v8 = *(_QWORD *)(type metadata accessor for StreamBlock.Event(0) - 8);
    v9 = a3 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v10 = *(_QWORD *)(v8 + 72);
    while (1)
    {
      a1(&v16, v9);
      if (v4)
        break;
      v4 = 0;
      v11 = v16;
      v17 = v6;
      v13 = *(_QWORD *)(v6 + 16);
      v12 = *(_QWORD *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_21C87C33C((_QWORD *)(v12 > 1), v13 + 1, 1);
        v6 = v17;
      }
      *(_QWORD *)(v6 + 16) = v13 + 1;
      *(_QWORD *)(v6 + 8 * v13 + 32) = v11;
      v9 += v10;
      if (!--v5)
        return v6;
    }
    swift_release();
  }
  return v6;
}

unint64_t sub_21C87B0D4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  int *v9;
  char *v10;
  int v11;
  uint64_t v12;
  char *v13;
  int v14;
  unsigned int *v15;
  uint64_t v16;
  char *v17;
  int v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  char *v33;
  unint64_t v34;
  _OWORD v35[3];
  __int128 v36;
  uint64_t v37;
  unint64_t v38;

  v1 = v0;
  v2 = sub_21C888260();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C47F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C888630;
  strcpy((char *)(inited + 32), "channelNames");
  *(_BYTE *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  v6 = *v1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4800);
  *(_QWORD *)(inited + 48) = v6;
  *(_QWORD *)(inited + 72) = v7;
  strcpy((char *)(inited + 80), "bitsPerChannel");
  *(_BYTE *)(inited + 95) = -18;
  v8 = (int *)type metadata accessor for StreamBlock.EventBlock(0);
  v9 = v8;
  v10 = (char *)v1 + v8[7];
  if (v10[4])
    v11 = 0;
  else
    v11 = *(_DWORD *)v10;
  v12 = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 96) = v11;
  *(_QWORD *)(inited + 120) = v12;
  *(_QWORD *)(inited + 128) = 0x7265507365747962;
  *(_QWORD *)(inited + 136) = 0xEF64616F6C796150;
  v13 = (char *)v1 + v8[8];
  if (v13[4])
    v14 = 0;
  else
    v14 = *(_DWORD *)v13;
  *(_DWORD *)(inited + 144) = v14;
  *(_QWORD *)(inited + 168) = v12;
  *(_QWORD *)(inited + 176) = 0x6C4674616D726F66;
  *(_QWORD *)(inited + 184) = 0xEB00000000736761;
  v15 = (unsigned int *)((char *)v1 + v8[9]);
  if (*((_BYTE *)v15 + 4))
    v16 = 0;
  else
    v16 = *v15;
  *(_DWORD *)(inited + 192) = v16;
  *(_QWORD *)(inited + 216) = v12;
  *(_QWORD *)(inited + 224) = 0x646E49746E657665;
  *(_QWORD *)(inited + 232) = 0xEA00000000007865;
  v17 = (char *)v1 + v8[10];
  if (v17[4])
    v18 = 0;
  else
    v18 = *(_DWORD *)v17;
  *(_DWORD *)(inited + 240) = v18;
  *(_QWORD *)(inited + 264) = v12;
  *(_QWORD *)(inited + 272) = 0x6E65736572706572;
  *(_QWORD *)(inited + 280) = 0xEF65746174537374;
  v19 = *((_BYTE *)v1 + v8[11]);
  *(_QWORD *)(inited + 312) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 288) = v19 & 1;
  swift_bridgeObjectRetain();
  v20 = sub_21C87A8BC(inited);
  v21 = v20;
  v38 = v20;
  if ((v19 & 1) != 0)
  {
    v33 = v4;
    v22 = (_QWORD *)((char *)v1 + v9[12]);
    v23 = v22[1];
    if (v23 >> 60 == 15)
      v24 = 0;
    else
      v24 = *v22;
    if (v23 >> 60 == 15)
      v25 = 0xC000000000000000;
    else
      v25 = v22[1];
    sub_21C87A864(*v22, v23);
    v26 = sub_21C884488(v11, v16, v24, v25);
    sub_21C87C464(v24, v25);
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4810);
    *(_QWORD *)&v36 = v26;
    sub_21C87C358(&v36, v35);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v34 = v21;
    sub_21C87BEE0(v35, 0xD000000000000015, 0x800000021C889350, isUniquelyReferenced_nonNull_native);
    v21 = v34;
    v38 = v34;
    v20 = swift_bridgeObjectRelease();
  }
  v28 = v1[1];
  MEMORY[0x24BDAC7A8](v20);
  *(&v33 - 2) = (char *)v1;
  swift_bridgeObjectRetain();
  v29 = sub_21C87AFB8((void (*)(uint64_t *__return_ptr, uint64_t))sub_21C87C3E8, (uint64_t)(&v33 - 4), v28);
  swift_bridgeObjectRelease();
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C47F8);
  *(_QWORD *)&v36 = v29;
  sub_21C87C358(&v36, v35);
  v30 = swift_isUniquelyReferenced_nonNull_native();
  v34 = v21;
  sub_21C87BEE0(v35, 0x73746E657665, 0xE600000000000000, v30);
  v31 = v34;
  swift_bridgeObjectRelease();
  return v31;
}

id sub_21C87B5B0()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15D0]), sel_init);
  result = objc_msgSend(v0, sel_setFormatOptions_, 1907);
  qword_2552C47C0 = (uint64_t)v0;
  return result;
}

unint64_t sub_21C87B5FC(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  double v9;
  unint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v18[2];
  __int128 v19;
  uint64_t v20;
  unint64_t v21;

  v5 = sub_21C888260();
  MEMORY[0x24BDAC7A8](v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C47F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C888640;
  *(_QWORD *)(inited + 32) = 0x6D6954746E657665;
  *(_QWORD *)(inited + 40) = 0xE900000000000065;
  v7 = type metadata accessor for StreamBlock.Event(0);
  v8 = v2 + *(int *)(v7 + 20);
  v9 = *(double *)v8;
  if (*(_BYTE *)(v8 + 8))
    v9 = 0.0;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE13C8];
  *(double *)(inited + 48) = v9;
  v10 = sub_21C87A8BC(inited);
  v21 = v10;
  v11 = (uint64_t *)(v2 + *(int *)(v7 + 24));
  v12 = v11[1];
  if (v12 >> 60 == 15)
    v13 = 0;
  else
    v13 = *v11;
  if (v12 >> 60 == 15)
    v14 = 0xC000000000000000;
  else
    v14 = v11[1];
  sub_21C87A864(*v11, v12);
  v15 = sub_21C884488(a1, a2, v13, v14);
  sub_21C87C464(v13, v14);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4810);
  *(_QWORD *)&v19 = v15;
  sub_21C87C358(&v19, v18);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_21C87BEE0(v18, 0x736C656E6E616863, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_21C87B8BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C8882FC();
  sub_21C88826C();
  v4 = sub_21C888314();
  return sub_21C87C078(a1, a2, v4);
}

double sub_21C87B920@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_21C87B8BC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21C87C158();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_21C87C358((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_21C87BD0C(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_21C87BA10(uint64_t a1, char a2)
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
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4818);
  v6 = sub_21C88829C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_21C87C358(v24, v35);
      }
      else
      {
        sub_21C87C4E8((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_21C8882FC();
      sub_21C88826C();
      result = sub_21C888314();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_21C87C358(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_21C87BD0C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21C888284();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_21C8882FC();
        swift_bridgeObjectRetain();
        sub_21C88826C();
        v10 = sub_21C888314();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_21C87BEE0(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_21C87B8BC(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_21C87C358(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_21C87C158();
      goto LABEL_7;
    }
    sub_21C87BA10(v15, a4 & 1);
    v21 = sub_21C87B8BC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21C87C010(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_21C8882C0();
  __break(1u);
  return result;
}

_OWORD *sub_21C87C010(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_21C87C358(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_21C87C078(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21C8882B4() & 1) == 0)
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
      while (!v14 && (sub_21C8882B4() & 1) == 0);
    }
  }
  return v6;
}

void *sub_21C87C158()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4818);
  v2 = *v0;
  v3 = sub_21C888290();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
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
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_21C87C4E8(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_21C87C358(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
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
LABEL_30:
  __break(1u);
  return result;
}

_QWORD *sub_21C87C33C(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_21C87C540(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_OWORD *sub_21C87C358(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21C87C368(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21C87C3AC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_21C87C3E8@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int *v7;
  uint64_t v8;
  unint64_t result;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = type metadata accessor for StreamBlock.EventBlock(0);
  v5 = v3 + *(int *)(v4 + 28);
  if (*(_BYTE *)(v5 + 4))
    v6 = 0;
  else
    v6 = *(_DWORD *)v5;
  v7 = (unsigned int *)(v3 + *(int *)(v4 + 36));
  if (*((_BYTE *)v7 + 4))
    v8 = 0;
  else
    v8 = *v7;
  result = sub_21C87B5FC(v6, v8);
  *a1 = result;
  return result;
}

uint64_t sub_21C87C464(uint64_t a1, unint64_t a2)
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

uint64_t sub_21C87C4A8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4808);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C87C4E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_21C87C524(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21C87C660(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_21C87C540(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4828);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4830);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_21C87C660(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4820);
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
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

uint64_t sub_21C87C788(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2552C4838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *sub_21C87C7D0(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v7;
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
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  char *v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  char *v35;
  _OWORD *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;

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
    a1[1] = a2[1];
    v8 = a3[6];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21C8880C8();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[7];
    v14 = a3[8];
    v15 = (_QWORD *)((char *)v7 + v13);
    v16 = (_QWORD *)((char *)a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = (_QWORD *)((char *)v7 + v14);
    v19 = (_QWORD *)((char *)a2 + v14);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = a3[9];
    v22 = a3[10];
    v23 = (_QWORD *)((char *)v7 + v21);
    v24 = (_QWORD *)((char *)a2 + v21);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    v26 = (char *)v7 + v22;
    v27 = (_QWORD *)((char *)a2 + v22);
    v28 = *(_QWORD *)((char *)a2 + v22 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v28 >> 60 == 15)
    {
      *(_OWORD *)v26 = *(_OWORD *)v27;
    }
    else
    {
      v29 = *v27;
      sub_21C87A878(*v27, v28);
      *(_QWORD *)v26 = v29;
      *((_QWORD *)v26 + 1) = v28;
    }
    v30 = a3[11];
    v31 = a3[12];
    v32 = (_QWORD *)((char *)v7 + v30);
    v33 = (_QWORD *)((char *)a2 + v30);
    v34 = v33[1];
    *v32 = *v33;
    v32[1] = v34;
    v35 = (char *)v7 + v31;
    v36 = (_OWORD *)((char *)a2 + v31);
    v37 = *(_QWORD *)((char *)a2 + v31 + 8);
    swift_bridgeObjectRetain();
    if (v37 >> 60 == 15)
    {
      *(_OWORD *)v35 = *v36;
    }
    else
    {
      v38 = *(_QWORD *)v36;
      sub_21C87A878(v38, v37);
      *(_QWORD *)v35 = v38;
      *((_QWORD *)v35 + 1) = v37;
    }
    v39 = a3[13];
    v40 = a3[14];
    v41 = (char *)v7 + v39;
    v42 = (char *)a2 + v39;
    *(_QWORD *)v41 = *(_QWORD *)v42;
    v41[8] = v42[8];
    v43 = (char *)v7 + v40;
    v44 = (char *)a2 + v40;
    *(_QWORD *)v43 = *(_QWORD *)v44;
    v43[8] = v44[8];
    v45 = a3[15];
    v46 = a3[16];
    v47 = (char *)v7 + v45;
    v48 = (char *)a2 + v45;
    *(_DWORD *)v47 = *(_DWORD *)v48;
    v47[4] = v48[4];
    *((_BYTE *)v7 + v46) = *((_BYTE *)a2 + v46);
  }
  return v7;
}

uint64_t sub_21C87C9BC(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t result;
  uint64_t *v9;
  unint64_t v10;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[6];
  v5 = sub_21C8880C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = (uint64_t *)(a1 + a2[10]);
  v7 = v6[1];
  if (v7 >> 60 != 15)
    sub_21C87C464(*v6, v7);
  result = swift_bridgeObjectRelease();
  v9 = (uint64_t *)(a1 + a2[12]);
  v10 = v9[1];
  if (v10 >> 60 != 15)
    return sub_21C87C464(*v9, v10);
  return result;
}

_QWORD *sub_21C87CAA4(_QWORD *a1, _QWORD *a2, int *a3)
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
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  char *v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  _OWORD *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21C8880C8();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[7];
  v13 = a3[8];
  v14 = (_QWORD *)((char *)a1 + v12);
  v15 = (_QWORD *)((char *)a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = (_QWORD *)((char *)a1 + v13);
  v18 = (_QWORD *)((char *)a2 + v13);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = a3[9];
  v21 = a3[10];
  v22 = (_QWORD *)((char *)a1 + v20);
  v23 = (_QWORD *)((char *)a2 + v20);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = (char *)a1 + v21;
  v26 = (_QWORD *)((char *)a2 + v21);
  v27 = *(_QWORD *)((char *)a2 + v21 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v27 >> 60 == 15)
  {
    *(_OWORD *)v25 = *(_OWORD *)v26;
  }
  else
  {
    v28 = *v26;
    sub_21C87A878(*v26, v27);
    *(_QWORD *)v25 = v28;
    *((_QWORD *)v25 + 1) = v27;
  }
  v29 = a3[11];
  v30 = a3[12];
  v31 = (_QWORD *)((char *)a1 + v29);
  v32 = (_QWORD *)((char *)a2 + v29);
  v33 = v32[1];
  *v31 = *v32;
  v31[1] = v33;
  v34 = (char *)a1 + v30;
  v35 = (_OWORD *)((char *)a2 + v30);
  v36 = *(_QWORD *)((char *)a2 + v30 + 8);
  swift_bridgeObjectRetain();
  if (v36 >> 60 == 15)
  {
    *(_OWORD *)v34 = *v35;
  }
  else
  {
    v37 = *(_QWORD *)v35;
    sub_21C87A878(v37, v36);
    *(_QWORD *)v34 = v37;
    *((_QWORD *)v34 + 1) = v36;
  }
  v38 = a3[13];
  v39 = a3[14];
  v40 = (char *)a1 + v38;
  v41 = (char *)a2 + v38;
  *(_QWORD *)v40 = *(_QWORD *)v41;
  v40[8] = v41[8];
  v42 = (char *)a1 + v39;
  v43 = (char *)a2 + v39;
  *(_QWORD *)v42 = *(_QWORD *)v43;
  v42[8] = v43[8];
  v44 = a3[15];
  v45 = a3[16];
  v46 = (char *)a1 + v44;
  v47 = (char *)a2 + v44;
  *(_DWORD *)v46 = *(_DWORD *)v47;
  v46[4] = v47[4];
  *((_BYTE *)a1 + v45) = *((_BYTE *)a2 + v45);
  return a1;
}

_QWORD *sub_21C87CC60(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21C8880C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[7];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[8];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = a3[9];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = a3[10];
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  v22 = *(_QWORD *)((char *)a2 + v19 + 8);
  if (*(_QWORD *)((char *)a1 + v19 + 8) >> 60 == 15)
  {
    if (v22 >> 60 != 15)
    {
      v23 = *v21;
      sub_21C87A878(v23, v22);
      *v20 = v23;
      v20[1] = v22;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v22 >> 60 == 15)
  {
    sub_21C87CF04((uint64_t)v20);
LABEL_6:
    *(_OWORD *)v20 = *(_OWORD *)v21;
    goto LABEL_8;
  }
  v24 = *v21;
  sub_21C87A878(v24, v22);
  v25 = *v20;
  v26 = v20[1];
  *v20 = v24;
  v20[1] = v22;
  sub_21C87C464(v25, v26);
LABEL_8:
  v27 = a3[11];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  *v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30 = a3[12];
  v31 = (_QWORD *)((char *)a1 + v30);
  v32 = (_QWORD *)((char *)a2 + v30);
  v33 = *(_QWORD *)((char *)a2 + v30 + 8);
  if (*(_QWORD *)((char *)a1 + v30 + 8) >> 60 != 15)
  {
    if (v33 >> 60 != 15)
    {
      v35 = *v32;
      sub_21C87A878(v35, v33);
      v36 = *v31;
      v37 = v31[1];
      *v31 = v35;
      v31[1] = v33;
      sub_21C87C464(v36, v37);
      goto LABEL_15;
    }
    sub_21C87CF04((uint64_t)v31);
    goto LABEL_13;
  }
  if (v33 >> 60 == 15)
  {
LABEL_13:
    *(_OWORD *)v31 = *(_OWORD *)v32;
    goto LABEL_15;
  }
  v34 = *v32;
  sub_21C87A878(v34, v33);
  *v31 = v34;
  v31[1] = v33;
LABEL_15:
  v38 = a3[13];
  v39 = (char *)a1 + v38;
  v40 = (char *)a2 + v38;
  v41 = *(_QWORD *)v40;
  v39[8] = v40[8];
  *(_QWORD *)v39 = v41;
  v42 = a3[14];
  v43 = (char *)a1 + v42;
  v44 = (char *)a2 + v42;
  v45 = *(_QWORD *)v44;
  v43[8] = v44[8];
  *(_QWORD *)v43 = v45;
  v46 = a3[15];
  v47 = (char *)a1 + v46;
  v48 = (char *)a2 + v46;
  LODWORD(v45) = *(_DWORD *)v48;
  v47[4] = v48[4];
  *(_DWORD *)v47 = v45;
  *((_BYTE *)a1 + a3[16]) = *((_BYTE *)a2 + a3[16]);
  return a1;
}

uint64_t sub_21C87CF04(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

_OWORD *sub_21C87CF38(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;

  *a1 = *a2;
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21C8880C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  v11 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  *(_OWORD *)((char *)a1 + v11) = *(_OWORD *)((char *)a2 + v11);
  v12 = a3[12];
  *(_OWORD *)((char *)a1 + a3[11]) = *(_OWORD *)((char *)a2 + a3[11]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  v13 = a3[13];
  v14 = a3[14];
  v15 = (char *)a1 + v13;
  v16 = (char *)a2 + v13;
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  v17 = (char *)a1 + v14;
  v18 = (char *)a2 + v14;
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v17[8] = v18[8];
  v19 = a3[15];
  v20 = a3[16];
  v21 = (char *)a1 + v19;
  v22 = (char *)a2 + v19;
  *(_DWORD *)v21 = *(_DWORD *)v22;
  v21[4] = v22[4];
  *((_BYTE *)a1 + v20) = *((_BYTE *)a2 + v20);
  return a1;
}

_QWORD *sub_21C87D038(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21C8880C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[7];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  v15 = a3[8];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v19 = *v17;
  v18 = v17[1];
  *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  v20 = a3[9];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  v24 = *v22;
  v23 = v22[1];
  *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease();
  v25 = a3[10];
  v26 = (uint64_t)a1 + v25;
  v27 = (char *)a2 + v25;
  v28 = *(_QWORD *)((char *)a1 + v25 + 8);
  if (v28 >> 60 == 15)
    goto LABEL_4;
  v29 = *((_QWORD *)v27 + 1);
  if (v29 >> 60 == 15)
  {
    sub_21C87CF04(v26);
LABEL_4:
    *(_OWORD *)v26 = *(_OWORD *)v27;
    goto LABEL_6;
  }
  v30 = *(_QWORD *)v26;
  *(_QWORD *)v26 = *(_QWORD *)v27;
  *(_QWORD *)(v26 + 8) = v29;
  sub_21C87C464(v30, v28);
LABEL_6:
  v31 = a3[11];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  v35 = *v33;
  v34 = v33[1];
  *v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  v36 = a3[12];
  v37 = (_QWORD *)((char *)a1 + v36);
  v38 = (_QWORD *)((char *)a2 + v36);
  v39 = *(_QWORD *)((char *)a1 + v36 + 8);
  if (v39 >> 60 != 15)
  {
    v40 = v38[1];
    if (v40 >> 60 != 15)
    {
      v41 = *v37;
      *v37 = *v38;
      v37[1] = v40;
      sub_21C87C464(v41, v39);
      goto LABEL_11;
    }
    sub_21C87CF04((uint64_t)v37);
  }
  *(_OWORD *)v37 = *(_OWORD *)v38;
LABEL_11:
  v42 = a3[13];
  v43 = a3[14];
  v44 = (char *)a1 + v42;
  v45 = (char *)a2 + v42;
  *(_QWORD *)v44 = *(_QWORD *)v45;
  v44[8] = v45[8];
  v46 = (char *)a1 + v43;
  v47 = (char *)a2 + v43;
  *(_QWORD *)v46 = *(_QWORD *)v47;
  v46[8] = v47[8];
  v48 = a3[15];
  v49 = a3[16];
  v50 = (char *)a1 + v48;
  v51 = (char *)a2 + v48;
  *(_DWORD *)v50 = *(_DWORD *)v51;
  v50[4] = v51[4];
  *((_BYTE *)a1 + v49) = *((_BYTE *)a2 + v49);
  return a1;
}

uint64_t sub_21C87D224()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C87D234()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for StreamBlock(uint64_t a1)
{
  return sub_21C87FDBC(a1, qword_2552C4898);
}

uint64_t sub_21C87D258()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C8880C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

BOOL sub_21C87D30C(char *a1, char *a2)
{
  return qword_21C888E90[*a1] == qword_21C888E90[*a2];
}

uint64_t sub_21C87D330()
{
  sub_21C8882FC();
  sub_21C888224();
  return sub_21C888314();
}

uint64_t sub_21C87D390()
{
  sub_21C883EDC();
  return sub_21C888104();
}

uint64_t sub_21C87D3C8()
{
  sub_21C8882FC();
  sub_21C888224();
  return sub_21C888314();
}

void sub_21C87D424(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_21C87D42C@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_21C881180(a1);
  *a2 = result;
  return result;
}

uint64_t sub_21C87D450()
{
  char *v0;

  return qword_21C888E90[*v0];
}

uint64_t sub_21C87D464@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_21C881180(*a1);
  *a2 = result;
  return result;
}

void sub_21C87D48C(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_21C888E90[*v1];
}

void sub_21C87D4A4(_QWORD *a1@<X8>)
{
  *a1 = &unk_24E08A450;
}

uint64_t sub_21C87D4B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  unint64_t v10;
  _QWORD *v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  _QWORD *v15;
  char *v16;
  _QWORD *v17;
  char *v18;
  _QWORD *v19;
  char *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  _QWORD *v26;
  char *v27;
  _QWORD *v28;
  char *v29;
  uint64_t v31;

  v0 = sub_21C88820C();
  __swift_allocate_value_buffer(v0, qword_2552C4E00);
  __swift_project_value_buffer(v0, (uint64_t)qword_2552C4E00);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4998);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C49A0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_21C888650;
  v5 = v31 + v4;
  v6 = v31 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v31 + v4) = 1;
  *(_QWORD *)v6 = "sensorModel";
  *(_QWORD *)(v6 + 8) = 11;
  *(_BYTE *)(v6 + 16) = 2;
  v7 = *MEMORY[0x24BE5C318];
  v8 = sub_21C8881F4();
  v9 = *(void (**)(void))(*(_QWORD *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  v10 = v5 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v3) = 2;
  *(_QWORD *)v10 = "sensorRevision";
  *(_QWORD *)(v10 + 8) = 14;
  *(_BYTE *)(v10 + 16) = 2;
  v9();
  v11 = (_QWORD *)(v5 + 2 * v3);
  v12 = (char *)v11 + *(int *)(v1 + 48);
  *v11 = 3;
  *(_QWORD *)v12 = "sensorName";
  *((_QWORD *)v12 + 1) = 10;
  v12[16] = 2;
  v9();
  v13 = (_QWORD *)(v5 + 3 * v3);
  v14 = (char *)v13 + *(int *)(v1 + 48);
  *v13 = 4;
  *(_QWORD *)v14 = "sensorID";
  *((_QWORD *)v14 + 1) = 8;
  v14[16] = 2;
  v9();
  v15 = (_QWORD *)(v5 + 4 * v3);
  v16 = (char *)v15 + *(int *)(v1 + 48);
  *v15 = 5;
  *(_QWORD *)v16 = "timeZone";
  *((_QWORD *)v16 + 1) = 8;
  v16[16] = 2;
  v9();
  v17 = (_QWORD *)(v5 + 5 * v3);
  v18 = (char *)v17 + *(int *)(v1 + 48);
  *v17 = 6;
  *(_QWORD *)v18 = "sessionID";
  *((_QWORD *)v18 + 1) = 9;
  v18[16] = 2;
  v9();
  v19 = (_QWORD *)(v5 + 6 * v3);
  v20 = (char *)v19 + *(int *)(v1 + 48);
  *v19 = 7;
  *(_QWORD *)v20 = "sessionStartDate";
  *((_QWORD *)v20 + 1) = 16;
  v20[16] = 2;
  v9();
  v21 = (_QWORD *)(v5 + 7 * v3);
  v22 = (char *)v21 + *(int *)(v1 + 48);
  *v21 = 8;
  *(_QWORD *)v22 = "sessionStartTime";
  *((_QWORD *)v22 + 1) = 16;
  v22[16] = 2;
  v9();
  v23 = v5 + 8 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + 8 * v3) = 9;
  *(_QWORD *)v23 = "blockIndex";
  *(_QWORD *)(v23 + 8) = 10;
  *(_BYTE *)(v23 + 16) = 2;
  v9();
  v24 = (_QWORD *)(v5 + 9 * v3);
  v25 = (char *)v24 + *(int *)(v1 + 48);
  *v24 = 10;
  *(_QWORD *)v25 = "isLastBlock";
  *((_QWORD *)v25 + 1) = 11;
  v25[16] = 2;
  v9();
  v26 = (_QWORD *)(v5 + 10 * v3);
  v27 = (char *)v26 + *(int *)(v1 + 48);
  *v26 = 11;
  *(_QWORD *)v27 = "pcmBlocks";
  *((_QWORD *)v27 + 1) = 9;
  v27[16] = 2;
  v9();
  v28 = (_QWORD *)(v5 + 11 * v3);
  v29 = (char *)v28 + *(int *)(v1 + 48);
  *v28 = 12;
  *(_QWORD *)v29 = "eventBlocks";
  *((_QWORD *)v29 + 1) = 11;
  v29[16] = 2;
  v9();
  return sub_21C888200();
}

uint64_t sub_21C87D820()
{
  uint64_t v0;
  uint64_t result;
  char v2;
  uint64_t v3;
  uint64_t v4;

  result = sub_21C888110();
  v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
        case 2:
        case 3:
        case 5:
          type metadata accessor for StreamBlock(0);
          v4 = v3;
          sub_21C88814C();
          goto LABEL_13;
        case 4:
        case 6:
          type metadata accessor for StreamBlock(0);
          v4 = v3;
          sub_21C888128();
          goto LABEL_13;
        case 7:
        case 8:
          type metadata accessor for StreamBlock(0);
          v4 = v3;
          sub_21C888140();
          goto LABEL_13;
        case 9:
          type metadata accessor for StreamBlock(0);
          v4 = v3;
          sub_21C888158();
          goto LABEL_13;
        case 10:
          type metadata accessor for StreamBlock(0);
          v4 = v3;
          sub_21C88811C();
          goto LABEL_13;
        case 11:
          type metadata accessor for StreamBlock.PCMBlock(0);
          sub_21C87FC20(&qword_2552C4948, type metadata accessor for StreamBlock.PCMBlock, (uint64_t)&unk_21C888B38);
          goto LABEL_12;
        case 12:
          type metadata accessor for StreamBlock.EventBlock(0);
          sub_21C87FC20(&qword_2552C4908, type metadata accessor for StreamBlock.EventBlock, (uint64_t)&unk_21C888868);
LABEL_12:
          v4 = v3;
          sub_21C888164();
LABEL_13:
          v3 = v4;
          break;
        default:
          break;
      }
      result = sub_21C888110();
    }
  }
  return result;
}

uint64_t sub_21C87DA50()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  uint64_t result;
  char *v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;

  v2 = (int *)type metadata accessor for StreamBlock(0);
  if (!*(_QWORD *)((char *)v0 + v2[7] + 8) || (result = sub_21C8881D0(), !v1))
  {
    if (!*(_QWORD *)((char *)v0 + v2[8] + 8) || (result = sub_21C8881D0(), !v1))
    {
      if (!*(_QWORD *)((char *)v0 + v2[9] + 8) || (result = sub_21C8881D0(), !v1))
      {
        v4 = (char *)v0 + v2[10];
        v5 = *((_QWORD *)v4 + 1);
        if (v5 >> 60 == 15
          || (v6 = *(_QWORD *)v4,
              sub_21C87A878(*(_QWORD *)v4, *((_QWORD *)v4 + 1)),
              sub_21C8881AC(),
              result = sub_21C87FFB8(v6, v5),
              !v1))
        {
          if (!*(_QWORD *)((char *)v0 + v2[11] + 8) || (result = sub_21C8881D0(), !v1))
          {
            v7 = (char *)v0 + v2[12];
            v8 = *((_QWORD *)v7 + 1);
            if (v8 >> 60 == 15
              || (v9 = *(_QWORD *)v7,
                  sub_21C87A878(*(_QWORD *)v7, *((_QWORD *)v7 + 1)),
                  sub_21C8881AC(),
                  result = sub_21C87FFB8(v9, v8),
                  !v1))
            {
              if ((*((_BYTE *)v0 + v2[13] + 8) & 1) != 0 || (result = sub_21C8881C4(), !v1))
              {
                if ((*((_BYTE *)v0 + v2[14] + 8) & 1) != 0 || (result = sub_21C8881C4(), !v1))
                {
                  if ((*((_BYTE *)v0 + v2[15] + 4) & 1) != 0 || (result = sub_21C8881DC(), !v1))
                  {
                    if (*((_BYTE *)v0 + v2[16]) == 2 || (result = sub_21C8881A0(), !v1))
                    {
                      if (!*(_QWORD *)(*v0 + 16)
                        || (type metadata accessor for StreamBlock.PCMBlock(0),
                            sub_21C87FC20(&qword_2552C4948, type metadata accessor for StreamBlock.PCMBlock, (uint64_t)&unk_21C888B38), result = sub_21C8881E8(), !v1))
                      {
                        if (!*(_QWORD *)(v0[1] + 16))
                          return sub_21C8880B0();
                        type metadata accessor for StreamBlock.EventBlock(0);
                        sub_21C87FC20(&qword_2552C4908, type metadata accessor for StreamBlock.EventBlock, (uint64_t)&unk_21C888868);
                        result = sub_21C8881E8();
                        if (!v1)
                          return sub_21C8880B0();
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

double sub_21C87DDB0@<D0>(int *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  double result;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;

  v4 = MEMORY[0x24BEE4AF8];
  *a2 = MEMORY[0x24BEE4AF8];
  a2[1] = v4;
  sub_21C8880BC();
  v5 = a1[8];
  v6 = (_QWORD *)((char *)a2 + a1[7]);
  *v6 = 0;
  v6[1] = 0;
  v7 = (_QWORD *)((char *)a2 + v5);
  *v7 = 0;
  v7[1] = 0;
  v8 = a1[10];
  v9 = (_QWORD *)((char *)a2 + a1[9]);
  *v9 = 0;
  v9[1] = 0;
  result = 0.0;
  *(_OWORD *)((char *)a2 + v8) = xmmword_21C888660;
  v11 = a1[12];
  v12 = (_QWORD *)((char *)a2 + a1[11]);
  *v12 = 0;
  v12[1] = 0;
  *(_OWORD *)((char *)a2 + v11) = xmmword_21C888660;
  v13 = a1[14];
  v14 = (char *)a2 + a1[13];
  *(_QWORD *)v14 = 0;
  v14[8] = 1;
  v15 = (char *)a2 + v13;
  *(_QWORD *)v15 = 0;
  v15[8] = 1;
  v16 = a1[16];
  v17 = (char *)a2 + a1[15];
  v17[4] = 1;
  *(_DWORD *)v17 = 0;
  *((_BYTE *)a2 + v16) = 2;
  return result;
}

uint64_t sub_21C87DE5C()
{
  return 0x6C426D6165727453;
}

uint64_t (*sub_21C87DE88())()
{
  return nullsub_1;
}

uint64_t sub_21C87DEA0()
{
  return sub_21C87D820();
}

uint64_t sub_21C87DEB4()
{
  return sub_21C87DA50();
}

uint64_t sub_21C87DECC()
{
  sub_21C87FC20(&qword_2552C4990, type metadata accessor for StreamBlock, (uint64_t)&unk_21C888C90);
  return sub_21C8880F8();
}

uint64_t sub_21C87DF20@<X0>(uint64_t a1@<X8>)
{
  return sub_21C87FA10(&qword_2552C47C8, (uint64_t)qword_2552C4E00, a1);
}

uint64_t sub_21C87DF3C()
{
  sub_21C87FC20((unint64_t *)&qword_2552C4968, type metadata accessor for StreamBlock, (uint64_t)&unk_21C888D00);
  return sub_21C888188();
}

uint64_t sub_21C87DF80()
{
  sub_21C87FC20((unint64_t *)&qword_2552C4968, type metadata accessor for StreamBlock, (uint64_t)&unk_21C888D00);
  return sub_21C888194();
}

uint64_t sub_21C87DFD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;

  v0 = sub_21C88820C();
  __swift_allocate_value_buffer(v0, qword_2552C4E18);
  __swift_project_value_buffer(v0, (uint64_t)qword_2552C4E18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4998);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C49A0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21C888670;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "FormatFlagIsFloat";
  *(_QWORD *)(v7 + 8) = 17;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21C8881F4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "FormatFlagIsBigEndian";
  *(_QWORD *)(v11 + 8) = 21;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 4;
  *(_QWORD *)v13 = "FormatFlagIsSignedInteger";
  *((_QWORD *)v13 + 1) = 25;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 8;
  *(_QWORD *)v15 = "FormatFlagIsPacked";
  *((_QWORD *)v15 + 1) = 18;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 16;
  *(_QWORD *)v17 = "FormatFlagIsAlignedHigh";
  *((_QWORD *)v17 + 1) = 23;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 256;
  *(_QWORD *)v19 = "FormatFlagVarint";
  *((_QWORD *)v19 + 1) = 16;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 512;
  *(_QWORD *)v21 = "FormatFlagALAC";
  *((_QWORD *)v21 + 1) = 14;
  v21[16] = 2;
  v10();
  return sub_21C888200();
}

uint64_t sub_21C87E248@<X0>(uint64_t a1@<X8>)
{
  return sub_21C87FA10(&qword_2552C47D0, (uint64_t)qword_2552C4E18, a1);
}

uint64_t sub_21C87E264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  unint64_t v10;
  _QWORD *v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  _QWORD *v15;
  char *v16;
  _QWORD *v17;
  char *v18;
  _QWORD *v19;
  char *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  _QWORD *v26;
  char *v27;
  uint64_t v29;

  v0 = sub_21C88820C();
  __swift_allocate_value_buffer(v0, qword_2552C4E30);
  __swift_project_value_buffer(v0, (uint64_t)qword_2552C4E30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4998);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C49A0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_21C888680;
  v5 = v29 + v4;
  v6 = v29 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v29 + v4) = 1;
  *(_QWORD *)v6 = "channelNames";
  *(_QWORD *)(v6 + 8) = 12;
  *(_BYTE *)(v6 + 16) = 2;
  v7 = *MEMORY[0x24BE5C318];
  v8 = sub_21C8881F4();
  v9 = *(void (**)(void))(*(_QWORD *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  v10 = v5 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v3) = 2;
  *(_QWORD *)v10 = "bitsPerChannel";
  *(_QWORD *)(v10 + 8) = 14;
  *(_BYTE *)(v10 + 16) = 2;
  v9();
  v11 = (_QWORD *)(v5 + 2 * v3);
  v12 = (char *)v11 + *(int *)(v1 + 48);
  *v11 = 3;
  *(_QWORD *)v12 = "bytesPerFrame";
  *((_QWORD *)v12 + 1) = 13;
  v12[16] = 2;
  v9();
  v13 = (_QWORD *)(v5 + 3 * v3);
  v14 = (char *)v13 + *(int *)(v1 + 48);
  *v13 = 4;
  *(_QWORD *)v14 = "formatFlags";
  *((_QWORD *)v14 + 1) = 11;
  v14[16] = 2;
  v9();
  v15 = (_QWORD *)(v5 + 4 * v3);
  v16 = (char *)v15 + *(int *)(v1 + 48);
  *v15 = 5;
  *(_QWORD *)v16 = "nominalSampleRate";
  *((_QWORD *)v16 + 1) = 17;
  v16[16] = 2;
  v9();
  v17 = (_QWORD *)(v5 + 5 * v3);
  v18 = (char *)v17 + *(int *)(v1 + 48);
  *v17 = 6;
  *(_QWORD *)v18 = "startDate";
  *((_QWORD *)v18 + 1) = 9;
  v18[16] = 2;
  v9();
  v19 = (_QWORD *)(v5 + 6 * v3);
  v20 = (char *)v19 + *(int *)(v1 + 48);
  *v19 = 7;
  *(_QWORD *)v20 = "startTime";
  *((_QWORD *)v20 + 1) = 9;
  v20[16] = 2;
  v9();
  v21 = (_QWORD *)(v5 + 7 * v3);
  v22 = (char *)v21 + *(int *)(v1 + 48);
  *v21 = 8;
  *(_QWORD *)v22 = "endTime";
  *((_QWORD *)v22 + 1) = 7;
  v22[16] = 2;
  v9();
  v23 = v5 + 8 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + 8 * v3) = 9;
  *(_QWORD *)v23 = "frameIndex";
  *(_QWORD *)(v23 + 8) = 10;
  *(_BYTE *)(v23 + 16) = 2;
  v9();
  v24 = (_QWORD *)(v5 + 9 * v3);
  v25 = (char *)v24 + *(int *)(v1 + 48);
  *v24 = 10;
  *(_QWORD *)v25 = "frameCount";
  *((_QWORD *)v25 + 1) = 10;
  v25[16] = 2;
  v9();
  v26 = (_QWORD *)(v5 + 10 * v3);
  v27 = (char *)v26 + *(int *)(v1 + 48);
  *v26 = 11;
  *(_QWORD *)v27 = "frameData";
  *((_QWORD *)v27 + 1) = 9;
  v27[16] = 2;
  v9();
  return sub_21C888200();
}

uint64_t sub_21C87E594()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_21C888110();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_21C888134();
          break;
        case 2:
        case 3:
        case 4:
        case 9:
        case 10:
          type metadata accessor for StreamBlock.PCMBlock(0);
          sub_21C888158();
          break;
        case 5:
        case 6:
        case 7:
        case 8:
          type metadata accessor for StreamBlock.PCMBlock(0);
          sub_21C888140();
          break;
        case 11:
          type metadata accessor for StreamBlock.PCMBlock(0);
          sub_21C888128();
          break;
        default:
          break;
      }
      result = sub_21C888110();
    }
  }
  return result;
}

uint64_t sub_21C87E738()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  int *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!*(_QWORD *)(*(_QWORD *)v0 + 16) || (result = sub_21C8881B8(), !v1))
  {
    v3 = (int *)type metadata accessor for StreamBlock.PCMBlock(0);
    if ((*(_BYTE *)(v0 + v3[6] + 4) & 1) != 0 || (result = sub_21C8881DC(), !v1))
    {
      if ((*(_BYTE *)(v0 + v3[7] + 4) & 1) != 0 || (result = sub_21C8881DC(), !v1))
      {
        if ((*(_BYTE *)(v0 + v3[8] + 4) & 1) != 0 || (result = sub_21C8881DC(), !v1))
        {
          if ((*(_BYTE *)(v0 + v3[9] + 8) & 1) != 0 || (result = sub_21C8881C4(), !v1))
          {
            if ((*(_BYTE *)(v0 + v3[10] + 8) & 1) != 0 || (result = sub_21C8881C4(), !v1))
            {
              if ((*(_BYTE *)(v0 + v3[11] + 8) & 1) != 0 || (result = sub_21C8881C4(), !v1))
              {
                if ((*(_BYTE *)(v0 + v3[12] + 8) & 1) != 0 || (result = sub_21C8881C4(), !v1))
                {
                  if ((*(_BYTE *)(v0 + v3[13] + 4) & 1) != 0 || (result = sub_21C8881DC(), !v1))
                  {
                    if ((*(_BYTE *)(v0 + v3[14] + 4) & 1) != 0 || (result = sub_21C8881DC(), !v1))
                    {
                      v4 = v0 + v3[15];
                      v5 = *(_QWORD *)(v4 + 8);
                      if (v5 >> 60 == 15)
                        return sub_21C8880B0();
                      v6 = *(_QWORD *)v4;
                      sub_21C87A878(*(_QWORD *)v4, *(_QWORD *)(v4 + 8));
                      sub_21C8881AC();
                      result = sub_21C87FFB8(v6, v5);
                      if (!v1)
                        return sub_21C8880B0();
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

double sub_21C87E9E0@<D0>(int *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  double result;

  *a2 = MEMORY[0x24BEE4AF8];
  sub_21C8880BC();
  v4 = a1[7];
  v5 = (char *)a2 + a1[6];
  *(_DWORD *)v5 = 0;
  v5[4] = 1;
  v6 = (char *)a2 + v4;
  *(_DWORD *)v6 = 0;
  v6[4] = 1;
  v7 = a1[9];
  v8 = (char *)a2 + a1[8];
  *(_DWORD *)v8 = 0;
  v8[4] = 1;
  v9 = (char *)a2 + v7;
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = a1[11];
  v11 = (char *)a2 + a1[10];
  *(_QWORD *)v11 = 0;
  v11[8] = 1;
  v12 = (char *)a2 + v10;
  *(_QWORD *)v12 = 0;
  v12[8] = 1;
  v13 = a1[13];
  v14 = (char *)a2 + a1[12];
  *(_QWORD *)v14 = 0;
  v14[8] = 1;
  v15 = (char *)a2 + v13;
  *(_DWORD *)v15 = 0;
  v15[4] = 1;
  v16 = a1[15];
  v17 = (char *)a2 + a1[14];
  *(_DWORD *)v17 = 0;
  v17[4] = 1;
  result = 0.0;
  *(_OWORD *)((char *)a2 + v16) = xmmword_21C888660;
  return result;
}

unint64_t sub_21C87EAA8()
{
  return 0xD000000000000014;
}

uint64_t sub_21C87EAC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_21C8880C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_21C87EB04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 20);
  v5 = sub_21C8880C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_21C87EB44())()
{
  return nullsub_1;
}

uint64_t sub_21C87EB58()
{
  return sub_21C87E594();
}

uint64_t sub_21C87EB6C()
{
  return sub_21C87E738();
}

uint64_t sub_21C87EB80()
{
  sub_21C87FC20(&qword_2552C49B0, type metadata accessor for StreamBlock.PCMBlock, (uint64_t)&unk_21C888B00);
  return sub_21C8880F8();
}

uint64_t sub_21C87EBD0@<X0>(uint64_t a1@<X8>)
{
  return sub_21C87FA10(&qword_2552C47D8, (uint64_t)qword_2552C4E30, a1);
}

uint64_t sub_21C87EBEC()
{
  sub_21C87FC20(&qword_2552C4948, type metadata accessor for StreamBlock.PCMBlock, (uint64_t)&unk_21C888B38);
  return sub_21C888188();
}

uint64_t sub_21C87EC2C()
{
  sub_21C87FC20(&qword_2552C4948, type metadata accessor for StreamBlock.PCMBlock, (uint64_t)&unk_21C888B38);
  return sub_21C888194();
}

uint64_t sub_21C87EC80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_21C88820C();
  __swift_allocate_value_buffer(v0, qword_2552C4E48);
  __swift_project_value_buffer(v0, (uint64_t)qword_2552C4E48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4998);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C49A0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21C888690;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "eventTime";
  *(_QWORD *)(v7 + 8) = 9;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21C8881F4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "payload";
  *((_QWORD *)v11 + 1) = 7;
  v11[16] = 2;
  v10();
  return sub_21C888200();
}

uint64_t sub_21C87EDD0()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_21C888110();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 2)
    {
      type metadata accessor for StreamBlock.Event(0);
      sub_21C888128();
    }
    else if (result == 1)
    {
      type metadata accessor for StreamBlock.Event(0);
      sub_21C888140();
    }
    v0 = 0;
  }
  return result;
}

uint64_t sub_21C87EE9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v2 = type metadata accessor for StreamBlock.Event(0);
  if ((*(_BYTE *)(v0 + *(int *)(v2 + 20) + 8) & 1) != 0 || (result = sub_21C8881C4(), !v1))
  {
    v4 = v0 + *(int *)(v2 + 24);
    v5 = *(_QWORD *)(v4 + 8);
    if (v5 >> 60 == 15)
      return sub_21C8880B0();
    v6 = *(_QWORD *)v4;
    sub_21C87A878(*(_QWORD *)v4, *(_QWORD *)(v4 + 8));
    sub_21C8881AC();
    result = sub_21C87FFB8(v6, v5);
    if (!v1)
      return sub_21C8880B0();
  }
  return result;
}

double sub_21C87EF94@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  double result;

  sub_21C8880BC();
  v4 = *(int *)(a1 + 24);
  v5 = a2 + *(int *)(a1 + 20);
  *(_QWORD *)v5 = 0;
  *(_BYTE *)(v5 + 8) = 1;
  result = 0.0;
  *(_OWORD *)(a2 + v4) = xmmword_21C888660;
  return result;
}

unint64_t sub_21C87EFD8()
{
  return 0xD000000000000011;
}

uint64_t sub_21C87EFF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21C8880C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_21C87F02C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21C8880C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*sub_21C87F064())()
{
  return nullsub_1;
}

uint64_t sub_21C87F074()
{
  return sub_21C87EDD0();
}

uint64_t sub_21C87F088()
{
  return sub_21C87EE9C();
}

uint64_t sub_21C87F09C()
{
  sub_21C87FC20(&qword_2552C49B8, type metadata accessor for StreamBlock.Event, (uint64_t)&unk_21C888998);
  return sub_21C8880F8();
}

uint64_t sub_21C87F0EC@<X0>(uint64_t a1@<X8>)
{
  return sub_21C87FA10(&qword_2552C47E0, (uint64_t)qword_2552C4E48, a1);
}

uint64_t sub_21C87F108()
{
  sub_21C87FC20(&qword_2552C4928, type metadata accessor for StreamBlock.Event, (uint64_t)&unk_21C8889D0);
  return sub_21C888188();
}

uint64_t sub_21C87F148()
{
  sub_21C87FC20(&qword_2552C4928, type metadata accessor for StreamBlock.Event, (uint64_t)&unk_21C8889D0);
  return sub_21C888194();
}

uint64_t sub_21C87F19C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;
  _QWORD *v22;
  char *v23;

  v0 = sub_21C88820C();
  __swift_allocate_value_buffer(v0, qword_2552C4E60);
  __swift_project_value_buffer(v0, (uint64_t)qword_2552C4E60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552C4998);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552C49A0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21C888610;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "channelNames";
  *(_QWORD *)(v7 + 8) = 12;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_21C8881F4();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "bitsPerChannel";
  *(_QWORD *)(v11 + 8) = 14;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "bytesPerPayload";
  *((_QWORD *)v13 + 1) = 15;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "formatFlags";
  *((_QWORD *)v15 + 1) = 11;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 5;
  *(_QWORD *)v17 = "eventIndex";
  *((_QWORD *)v17 + 1) = 10;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 6;
  *(_QWORD *)v19 = "representsState";
  *((_QWORD *)v19 + 1) = 15;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 7;
  *(_QWORD *)v21 = "startingStatePayload";
  *((_QWORD *)v21 + 1) = 20;
  v21[16] = 2;
  v10();
  v22 = (_QWORD *)(v6 + 7 * v3);
  v23 = (char *)v22 + *(int *)(v1 + 48);
  *v22 = 8;
  *(_QWORD *)v23 = "events";
  *((_QWORD *)v23 + 1) = 6;
  v23[16] = 2;
  v10();
  return sub_21C888200();
}

uint64_t sub_21C87F444()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_21C888110();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          sub_21C888134();
          break;
        case 2:
        case 3:
        case 4:
        case 5:
          type metadata accessor for StreamBlock.EventBlock(0);
          sub_21C888158();
          break;
        case 6:
          type metadata accessor for StreamBlock.EventBlock(0);
          sub_21C88811C();
          break;
        case 7:
          type metadata accessor for StreamBlock.EventBlock(0);
          sub_21C888128();
          break;
        case 8:
          type metadata accessor for StreamBlock.Event(0);
          sub_21C87FC20(&qword_2552C4928, type metadata accessor for StreamBlock.Event, (uint64_t)&unk_21C8889D0);
          sub_21C888164();
          break;
        default:
          break;
      }
      result = sub_21C888110();
    }
  }
  return result;
}

uint64_t sub_21C87F610()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;
  int *v3;
  char *v4;
  unint64_t v5;
  uint64_t v6;

  if (!*(_QWORD *)(*v0 + 16) || (result = sub_21C8881B8(), !v1))
  {
    v3 = (int *)type metadata accessor for StreamBlock.EventBlock(0);
    if ((*((_BYTE *)v0 + v3[7] + 4) & 1) != 0 || (result = sub_21C8881DC(), !v1))
    {
      if ((*((_BYTE *)v0 + v3[8] + 4) & 1) != 0 || (result = sub_21C8881DC(), !v1))
      {
        if ((*((_BYTE *)v0 + v3[9] + 4) & 1) != 0 || (result = sub_21C8881DC(), !v1))
        {
          if ((*((_BYTE *)v0 + v3[10] + 4) & 1) != 0 || (result = sub_21C8881DC(), !v1))
          {
            if (*((_BYTE *)v0 + v3[11]) == 2 || (result = sub_21C8881A0(), !v1))
            {
              v4 = (char *)v0 + v3[12];
              v5 = *((_QWORD *)v4 + 1);
              if (v5 >> 60 == 15
                || (v6 = *(_QWORD *)v4,
                    sub_21C87A878(*(_QWORD *)v4, *((_QWORD *)v4 + 1)),
                    sub_21C8881AC(),
                    result = sub_21C87FFB8(v6, v5),
                    !v1))
              {
                if (!*(_QWORD *)(v0[1] + 16))
                  return sub_21C8880B0();
                type metadata accessor for StreamBlock.Event(0);
                sub_21C87FC20(&qword_2552C4928, type metadata accessor for StreamBlock.Event, (uint64_t)&unk_21C8889D0);
                result = sub_21C8881E8();
                if (!v1)
                  return sub_21C8880B0();
              }
            }
          }
        }
      }
    }
  }
  return result;
}

double sub_21C87F854@<D0>(int *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  double result;

  v4 = MEMORY[0x24BEE4AF8];
  *a2 = MEMORY[0x24BEE4AF8];
  a2[1] = v4;
  sub_21C8880BC();
  v5 = a1[8];
  v6 = (char *)a2 + a1[7];
  *(_DWORD *)v6 = 0;
  v6[4] = 1;
  v7 = (char *)a2 + v5;
  *(_DWORD *)v7 = 0;
  v7[4] = 1;
  v8 = a1[10];
  v9 = (char *)a2 + a1[9];
  *(_DWORD *)v9 = 0;
  v9[4] = 1;
  v10 = (char *)a2 + v8;
  *(_DWORD *)v10 = 0;
  v10[4] = 1;
  v11 = a1[12];
  *((_BYTE *)a2 + a1[11]) = 2;
  result = 0.0;
  *(_OWORD *)((char *)a2 + v11) = xmmword_21C888660;
  return result;
}

unint64_t sub_21C87F8E0()
{
  return 0xD000000000000016;
}

uint64_t sub_21C87F8FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 24);
  v5 = sub_21C8880C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_21C87F93C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 24);
  v5 = sub_21C8880C8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t sub_21C87F97C()
{
  return sub_21C87F444();
}

uint64_t sub_21C87F990()
{
  return sub_21C87F610();
}

uint64_t sub_21C87F9A4()
{
  sub_21C87FC20(qword_2552C49C0, type metadata accessor for StreamBlock.EventBlock, (uint64_t)&unk_21C888830);
  return sub_21C8880F8();
}

uint64_t sub_21C87F9F4@<X0>(uint64_t a1@<X8>)
{
  return sub_21C87FA10(&qword_2552C47E8, (uint64_t)qword_2552C4E60, a1);
}

uint64_t sub_21C87FA10@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_21C88820C();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_21C87FA7C()
{
  sub_21C87FC20(&qword_2552C4908, type metadata accessor for StreamBlock.EventBlock, (uint64_t)&unk_21C888868);
  return sub_21C888188();
}

uint64_t sub_21C87FABC()
{
  sub_21C8882FC();
  sub_21C888224();
  return sub_21C888314();
}

uint64_t sub_21C87FB10()
{
  sub_21C87FC20(&qword_2552C4908, type metadata accessor for StreamBlock.EventBlock, (uint64_t)&unk_21C888868);
  return sub_21C888194();
}

uint64_t sub_21C87FB60()
{
  sub_21C8882FC();
  sub_21C888224();
  return sub_21C888314();
}

uint64_t sub_21C87FBB4()
{
  return sub_21C87FC20(&qword_2552C4900, type metadata accessor for StreamBlock.EventBlock, (uint64_t)&unk_21C888778);
}

uint64_t type metadata accessor for StreamBlock.EventBlock(uint64_t a1)
{
  return sub_21C87FDBC(a1, qword_2552C4AB8);
}

uint64_t sub_21C87FBF4()
{
  return sub_21C87FC20(&qword_2552C4908, type metadata accessor for StreamBlock.EventBlock, (uint64_t)&unk_21C888868);
}

uint64_t sub_21C87FC20(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x220783F28](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21C87FC60()
{
  return sub_21C87FC20(&qword_2552C4910, type metadata accessor for StreamBlock.EventBlock, (uint64_t)&unk_21C8887A0);
}

uint64_t sub_21C87FC8C()
{
  return sub_21C87FC20(&qword_2552C4918, type metadata accessor for StreamBlock.EventBlock, (uint64_t)&unk_21C8887E0);
}

uint64_t sub_21C87FCB8()
{
  return sub_21C87FC20(&qword_2552C4920, type metadata accessor for StreamBlock.Event, (uint64_t)&unk_21C8888E0);
}

uint64_t type metadata accessor for StreamBlock.Event(uint64_t a1)
{
  return sub_21C87FDBC(a1, qword_2552C4A20);
}

uint64_t sub_21C87FCF8()
{
  return sub_21C87FC20(&qword_2552C4928, type metadata accessor for StreamBlock.Event, (uint64_t)&unk_21C8889D0);
}

uint64_t sub_21C87FD24()
{
  return sub_21C87FC20(&qword_2552C4930, type metadata accessor for StreamBlock.Event, (uint64_t)&unk_21C888908);
}

uint64_t sub_21C87FD50()
{
  return sub_21C87FC20(&qword_2552C4938, type metadata accessor for StreamBlock.Event, (uint64_t)&unk_21C888948);
}

uint64_t sub_21C87FD7C()
{
  return sub_21C87FC20(&qword_2552C4940, type metadata accessor for StreamBlock.PCMBlock, (uint64_t)&unk_21C888A48);
}

uint64_t type metadata accessor for StreamBlock.PCMBlock(uint64_t a1)
{
  return sub_21C87FDBC(a1, qword_2552C4B68);
}

uint64_t sub_21C87FDBC(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21C87FDF0()
{
  return sub_21C87FC20(&qword_2552C4948, type metadata accessor for StreamBlock.PCMBlock, (uint64_t)&unk_21C888B38);
}

uint64_t sub_21C87FE1C()
{
  return sub_21C87FC20(&qword_2552C4950, type metadata accessor for StreamBlock.PCMBlock, (uint64_t)&unk_21C888A70);
}

uint64_t sub_21C87FE48()
{
  return sub_21C87FC20(&qword_2552C4958, type metadata accessor for StreamBlock.PCMBlock, (uint64_t)&unk_21C888AB0);
}

uint64_t sub_21C87FE74()
{
  return sub_21C87FC20(&qword_2552C4960, type metadata accessor for StreamBlock, (uint64_t)&unk_21C888BD8);
}

uint64_t sub_21C87FEA0()
{
  return sub_21C87FC20((unint64_t *)&qword_2552C4968, type metadata accessor for StreamBlock, (uint64_t)&unk_21C888D00);
}

uint64_t sub_21C87FECC()
{
  return sub_21C87FC20(&qword_2552C4970, type metadata accessor for StreamBlock, (uint64_t)&unk_21C888C00);
}

unint64_t sub_21C87FEFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552C4978;
  if (!qword_2552C4978)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2552C4980);
    result = MEMORY[0x220783F28](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2552C4978);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220783F1C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21C87FF8C()
{
  return sub_21C87FC20(&qword_2552C4988, type metadata accessor for StreamBlock, (uint64_t)&unk_21C888C40);
}

uint64_t sub_21C87FFB8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21C87C464(a1, a2);
  return a1;
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

uint64_t sub_21C880024(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t (*a4)(char *, char *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  BOOL v20;
  uint64_t v22;

  a3(0);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v22 - v12;
  v14 = *(_QWORD *)(a1 + 16);
  if (v14 == *(_QWORD *)(a2 + 16))
  {
    if (!v14 || a1 == a2)
    {
      v18 = 1;
    }
    else
    {
      v15 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
      v16 = *(_QWORD *)(v11 + 72);
      v17 = v14 - 1;
      do
      {
        sub_21C87C368(a1 + v15, (uint64_t)v13, (uint64_t (*)(_QWORD))a3);
        sub_21C87C368(a2 + v15, (uint64_t)v10, (uint64_t (*)(_QWORD))a3);
        v18 = a4(v13, v10);
        sub_21C87C3AC((uint64_t)v10, (uint64_t (*)(_QWORD))a3);
        sub_21C87C3AC((uint64_t)v13, (uint64_t (*)(_QWORD))a3);
        v20 = v17-- != 0;
        if ((v18 & 1) == 0)
          break;
        v15 += v16;
      }
      while (v20);
    }
  }
  else
  {
    v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_21C880160(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  BOOL v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  BOOL v11;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_21C8882B4(), result = 0, (v6 & 1) != 0))
  {
    v8 = v2 - 1;
    if (!v8)
      return 1;
    v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_21C8882B4() & 1) == 0)
        break;
      v9 += 2;
      if (!--v8)
        return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_21C880224(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  char v16;
  double *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  char v24;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[9];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v32 = type metadata accessor for StreamBlock.Event(0);
  v4 = MEMORY[0x24BDAC7A8](v32);
  v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)v30 - v8;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10 != *(_QWORD *)(a2 + 16))
  {
LABEL_25:
    v24 = 0;
    return v24 & 1;
  }
  if (v10 && a1 != a2)
  {
    v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v12 = *(_QWORD *)(v7 + 72);
    v30[8] = a1;
    v31 = v12;
    v13 = v10 - 1;
    v30[4] = (char *)v30 - v8;
    v30[5] = v6;
    v30[3] = a2;
    while (1)
    {
      sub_21C87C368(a1 + v11, (uint64_t)v9, type metadata accessor for StreamBlock.Event);
      sub_21C87C368(a2 + v11, (uint64_t)v6, type metadata accessor for StreamBlock.Event);
      v14 = *(int *)(v32 + 20);
      v15 = (double *)&v9[v14];
      v16 = v9[v14 + 8];
      v17 = (double *)&v6[v14];
      v18 = v6[v14 + 8];
      if ((v16 & 1) != 0)
      {
        if (!v18)
          goto LABEL_24;
      }
      else
      {
        if (*v15 != *v17)
          LOBYTE(v18) = 1;
        if ((v18 & 1) != 0)
          goto LABEL_24;
      }
      v19 = *(int *)(v32 + 24);
      v20 = *(_QWORD *)&v9[v19];
      v21 = *(_QWORD *)&v9[v19 + 8];
      v22 = (uint64_t *)&v6[v19];
      v23 = v22[1];
      if (v21 >> 60 != 15)
        break;
      if (v23 >> 60 != 15)
        goto LABEL_23;
      sub_21C8880C8();
      sub_21C87FC20(&qword_2552C49A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v24 = sub_21C888230();
      sub_21C87C3AC((uint64_t)v6, type metadata accessor for StreamBlock.Event);
      sub_21C87C3AC((uint64_t)v9, type metadata accessor for StreamBlock.Event);
      v26 = v13-- != 0;
      if ((v24 & 1) != 0)
      {
        v11 += v31;
        if (v26)
          continue;
      }
      return v24 & 1;
    }
    if (v23 >> 60 != 15)
      __asm { BR              X8 }
LABEL_23:
    v27 = v20;
    v28 = *v22;
    sub_21C87A864(v20, v21);
    sub_21C87A864(v28, v23);
    sub_21C87FFB8(v27, v21);
    sub_21C87FFB8(v28, v23);
LABEL_24:
    sub_21C87C3AC((uint64_t)v6, type metadata accessor for StreamBlock.Event);
    sub_21C87C3AC((uint64_t)v9, type metadata accessor for StreamBlock.Event);
    goto LABEL_25;
  }
  v24 = 1;
  return v24 & 1;
}

void sub_21C880F18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_21C880F78(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x21C88115CLL);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_21C881180(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 - 1;
  result = 0;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 1;
      break;
    case 3:
      result = 2;
      break;
    case 7:
      result = 3;
      break;
    case 15:
      result = 4;
      break;
    default:
      result = 7;
      break;
  }
  return result;
}

uint64_t sub_21C8811F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_21C880F18((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_21C8812C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_21C888008();
  v11 = result;
  if (result)
  {
    result = sub_21C888020();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_21C888014();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_21C880F18(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_21C881378(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21C8813C4()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_21C8813F8 + *((int *)qword_21C8815D0 + (v0 >> 62))))();
}

uint64_t sub_21C881408@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_21C8815F0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  char v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  int v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  int v51;
  uint64_t v52;
  double *v53;
  char v54;
  double *v55;
  uint64_t v56;
  double *v57;
  char v58;
  double *v59;
  uint64_t v60;
  _DWORD *v61;
  char v62;
  _DWORD *v63;
  uint64_t v64;
  int v65;
  int v66;
  char *v67;
  void (*v68)(_BYTE *, char *, uint64_t);
  char v69;
  void (*v70)(_BYTE *, uint64_t);
  _BYTE v71[4];
  int v72;
  uint64_t v73;

  v4 = sub_21C8880C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = &v71[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v71[-v9];
  v11 = (int *)type metadata accessor for StreamBlock(0);
  v12 = v11[7];
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = *(uint64_t *)((char *)a1 + v12 + 8);
  v15 = (uint64_t *)((char *)a2 + v12);
  v16 = v15[1];
  if (!v14)
  {
    if (v16)
      goto LABEL_33;
    goto LABEL_10;
  }
  if (!v16)
    goto LABEL_33;
  v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (v18 = sub_21C8882B4(), LOBYTE(v19) = 0, (v18 & 1) != 0))
  {
LABEL_10:
    v20 = v11[8];
    v21 = (uint64_t *)((char *)a1 + v20);
    v22 = *(uint64_t *)((char *)a1 + v20 + 8);
    v23 = (uint64_t *)((char *)a2 + v20);
    v24 = v23[1];
    if (v22)
    {
      if (!v24)
        goto LABEL_33;
      if (*v21 != *v23 || v22 != v24)
      {
        v26 = sub_21C8882B4();
        LOBYTE(v19) = 0;
        if ((v26 & 1) == 0)
          return v19 & 1;
      }
    }
    else if (v24)
    {
      goto LABEL_33;
    }
    v27 = v11[9];
    v28 = (uint64_t *)((char *)a1 + v27);
    v29 = *(uint64_t *)((char *)a1 + v27 + 8);
    v30 = (uint64_t *)((char *)a2 + v27);
    v31 = v30[1];
    if (v29)
    {
      if (!v31)
        goto LABEL_33;
      if (*v28 != *v30 || v29 != v31)
      {
        v33 = sub_21C8882B4();
        LOBYTE(v19) = 0;
        if ((v33 & 1) == 0)
          return v19 & 1;
      }
    }
    else if (v31)
    {
      goto LABEL_33;
    }
    v34 = v11[10];
    v35 = *(uint64_t *)((char *)a1 + v34);
    v36 = *(uint64_t *)((char *)a1 + v34 + 8);
    v37 = (uint64_t *)((char *)a2 + v34);
    v38 = *v37;
    v39 = v37[1];
    if (v36 >> 60 == 15)
    {
      if (v39 >> 60 != 15)
        goto LABEL_32;
    }
    else
    {
      if (v39 >> 60 == 15)
        goto LABEL_32;
      v73 = v35;
      sub_21C87A864(v35, v36);
      sub_21C87A864(v38, v39);
      sub_21C881378(v73, v36);
      v72 = v42;
      sub_21C87FFB8(v38, v39);
      sub_21C87FFB8(v73, v36);
      if ((v72 & 1) == 0)
        goto LABEL_33;
    }
    v43 = v11[11];
    v44 = (uint64_t *)((char *)a1 + v43);
    v45 = *(uint64_t *)((char *)a1 + v43 + 8);
    v46 = (uint64_t *)((char *)a2 + v43);
    v47 = v46[1];
    if (v45)
    {
      if (!v47)
        goto LABEL_33;
      if (*v44 != *v46 || v45 != v47)
      {
        v48 = sub_21C8882B4();
        LOBYTE(v19) = 0;
        if ((v48 & 1) == 0)
          return v19 & 1;
      }
    }
    else if (v47)
    {
      goto LABEL_33;
    }
    v49 = v11[12];
    v35 = *(uint64_t *)((char *)a1 + v49);
    v36 = *(uint64_t *)((char *)a1 + v49 + 8);
    v50 = (uint64_t *)((char *)a2 + v49);
    v38 = *v50;
    v39 = v50[1];
    if (v36 >> 60 == 15)
    {
      if (v39 >> 60 == 15)
      {
LABEL_48:
        v52 = v11[13];
        v53 = (double *)((char *)a1 + v52);
        v54 = *((_BYTE *)a1 + v52 + 8);
        v55 = (double *)((char *)a2 + v52);
        v19 = *((unsigned __int8 *)a2 + v52 + 8);
        if ((v54 & 1) != 0)
        {
          if (!v19)
            return v19 & 1;
        }
        else
        {
          if (*v53 != *v55)
            LOBYTE(v19) = 1;
          if ((v19 & 1) != 0)
            goto LABEL_33;
        }
        v56 = v11[14];
        v57 = (double *)((char *)a1 + v56);
        v58 = *((_BYTE *)a1 + v56 + 8);
        v59 = (double *)((char *)a2 + v56);
        v19 = *((unsigned __int8 *)a2 + v56 + 8);
        if ((v58 & 1) != 0)
        {
          if (!v19)
            return v19 & 1;
        }
        else
        {
          if (*v57 != *v59)
            LOBYTE(v19) = 1;
          if ((v19 & 1) != 0)
            goto LABEL_33;
        }
        v60 = v11[15];
        v61 = (_DWORD *)((char *)a1 + v60);
        v62 = *((_BYTE *)a1 + v60 + 4);
        v63 = (_DWORD *)((char *)a2 + v60);
        v19 = *((unsigned __int8 *)a2 + v60 + 4);
        if ((v62 & 1) != 0)
        {
          if (!v19)
            return v19 & 1;
        }
        else
        {
          if (*v61 != *v63)
            LOBYTE(v19) = 1;
          if ((v19 & 1) != 0)
            goto LABEL_33;
        }
        v64 = v11[16];
        v65 = *((unsigned __int8 *)a1 + v64);
        v66 = *((unsigned __int8 *)a2 + v64);
        if (v65 == 2)
        {
          if (v66 == 2)
            goto LABEL_71;
        }
        else if (v66 != 2 && ((((v66 & 1) == 0) ^ v65) & 1) != 0)
        {
LABEL_71:
          if ((sub_21C880024(*a1, *a2, (void (*)(_QWORD))type metadata accessor for StreamBlock.PCMBlock, (uint64_t (*)(char *, char *))sub_21C881AB0) & 1) != 0&& (sub_21C880024(a1[1], a2[1], (void (*)(_QWORD))type metadata accessor for StreamBlock.EventBlock, (uint64_t (*)(char *, char *))sub_21C88209C) & 1) != 0)
          {
            v67 = (char *)a1 + v11[6];
            v68 = *(void (**)(_BYTE *, char *, uint64_t))(v5 + 16);
            v68(v10, v67, v4);
            v68(v8, (char *)a2 + v11[6], v4);
            sub_21C87FC20(&qword_2552C49A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
            v69 = sub_21C888230();
            v70 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
            v70(v8, v4);
            v70(v10, v4);
            LOBYTE(v19) = v69;
            return v19 & 1;
          }
        }
LABEL_33:
        LOBYTE(v19) = 0;
        return v19 & 1;
      }
    }
    else if (v39 >> 60 != 15)
    {
      v73 = v35;
      sub_21C87A864(v35, v36);
      sub_21C87A864(v38, v39);
      sub_21C881378(v73, v36);
      v72 = v51;
      sub_21C87FFB8(v38, v39);
      sub_21C87FFB8(v73, v36);
      if ((v72 & 1) == 0)
        goto LABEL_33;
      goto LABEL_48;
    }
LABEL_32:
    v40 = v35;
    sub_21C87A864(v35, v36);
    sub_21C87A864(v38, v39);
    sub_21C87FFB8(v40, v36);
    sub_21C87FFB8(v38, v39);
    goto LABEL_33;
  }
  return v19 & 1;
}

uint64_t sub_21C881AB0(_QWORD **a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  int *v11;
  int *v12;
  uint64_t v13;
  _DWORD *v14;
  char v15;
  char *v16;
  int v17;
  uint64_t v18;
  _DWORD *v19;
  char v20;
  char *v21;
  int v22;
  uint64_t v23;
  _DWORD *v24;
  char v25;
  char *v26;
  int v27;
  uint64_t v28;
  double *v29;
  char v30;
  double *v31;
  int v32;
  uint64_t v33;
  double *v34;
  char v35;
  double *v36;
  int v37;
  uint64_t v38;
  double *v39;
  char v40;
  double *v41;
  int v42;
  uint64_t v43;
  double *v44;
  char v45;
  double *v46;
  int v47;
  uint64_t v48;
  _DWORD *v49;
  char v50;
  char *v51;
  int v52;
  uint64_t v53;
  _DWORD *v54;
  char v55;
  char *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char v65;
  int v67;
  char *v68;
  void (*v69)(_BYTE *, char *, uint64_t);
  void (*v70)(_BYTE *, uint64_t);
  _BYTE v71[4];
  int v72;
  uint64_t v73;

  v4 = sub_21C8880C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = &v71[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v71[-v9];
  if ((sub_21C880160(*a1, *(_QWORD **)a2) & 1) == 0)
    goto LABEL_61;
  v11 = (int *)type metadata accessor for StreamBlock.PCMBlock(0);
  v12 = v11;
  v13 = v11[6];
  v14 = (_DWORD *)((char *)a1 + v13);
  v15 = *((_BYTE *)a1 + v13 + 4);
  v16 = &a2[v13];
  v17 = a2[v13 + 4];
  if ((v15 & 1) != 0)
  {
    if (!v17)
      goto LABEL_61;
  }
  else
  {
    if (*v14 != *(_DWORD *)v16)
      LOBYTE(v17) = 1;
    if ((v17 & 1) != 0)
      goto LABEL_61;
  }
  v18 = v11[7];
  v19 = (_DWORD *)((char *)a1 + v18);
  v20 = *((_BYTE *)a1 + v18 + 4);
  v21 = &a2[v18];
  v22 = a2[v18 + 4];
  if ((v20 & 1) != 0)
  {
    if (!v22)
      goto LABEL_61;
  }
  else
  {
    if (*v19 != *(_DWORD *)v21)
      LOBYTE(v22) = 1;
    if ((v22 & 1) != 0)
      goto LABEL_61;
  }
  v23 = v11[8];
  v24 = (_DWORD *)((char *)a1 + v23);
  v25 = *((_BYTE *)a1 + v23 + 4);
  v26 = &a2[v23];
  v27 = a2[v23 + 4];
  if ((v25 & 1) != 0)
  {
    if (!v27)
      goto LABEL_61;
  }
  else
  {
    if (*v24 != *(_DWORD *)v26)
      LOBYTE(v27) = 1;
    if ((v27 & 1) != 0)
      goto LABEL_61;
  }
  v28 = v11[9];
  v29 = (double *)((char *)a1 + v28);
  v30 = *((_BYTE *)a1 + v28 + 8);
  v31 = (double *)&a2[v28];
  v32 = a2[v28 + 8];
  if ((v30 & 1) != 0)
  {
    if (!v32)
      goto LABEL_61;
  }
  else
  {
    if (*v29 != *v31)
      LOBYTE(v32) = 1;
    if ((v32 & 1) != 0)
      goto LABEL_61;
  }
  v33 = v11[10];
  v34 = (double *)((char *)a1 + v33);
  v35 = *((_BYTE *)a1 + v33 + 8);
  v36 = (double *)&a2[v33];
  v37 = a2[v33 + 8];
  if ((v35 & 1) != 0)
  {
    if (!v37)
      goto LABEL_61;
  }
  else
  {
    if (*v34 != *v36)
      LOBYTE(v37) = 1;
    if ((v37 & 1) != 0)
      goto LABEL_61;
  }
  v38 = v11[11];
  v39 = (double *)((char *)a1 + v38);
  v40 = *((_BYTE *)a1 + v38 + 8);
  v41 = (double *)&a2[v38];
  v42 = a2[v38 + 8];
  if ((v40 & 1) != 0)
  {
    if (!v42)
      goto LABEL_61;
  }
  else
  {
    if (*v39 != *v41)
      LOBYTE(v42) = 1;
    if ((v42 & 1) != 0)
      goto LABEL_61;
  }
  v43 = v11[12];
  v44 = (double *)((char *)a1 + v43);
  v45 = *((_BYTE *)a1 + v43 + 8);
  v46 = (double *)&a2[v43];
  v47 = a2[v43 + 8];
  if ((v45 & 1) != 0)
  {
    if (!v47)
      goto LABEL_61;
  }
  else
  {
    if (*v44 != *v46)
      LOBYTE(v47) = 1;
    if ((v47 & 1) != 0)
      goto LABEL_61;
  }
  v48 = v11[13];
  v49 = (_DWORD *)((char *)a1 + v48);
  v50 = *((_BYTE *)a1 + v48 + 4);
  v51 = &a2[v48];
  v52 = a2[v48 + 4];
  if ((v50 & 1) != 0)
  {
    if (!v52)
      goto LABEL_61;
  }
  else
  {
    if (*v49 != *(_DWORD *)v51)
      LOBYTE(v52) = 1;
    if ((v52 & 1) != 0)
      goto LABEL_61;
  }
  v53 = v11[14];
  v54 = (_DWORD *)((char *)a1 + v53);
  v55 = *((_BYTE *)a1 + v53 + 4);
  v56 = &a2[v53];
  v57 = a2[v53 + 4];
  if ((v55 & 1) != 0)
  {
    if (!v57)
      goto LABEL_61;
  }
  else
  {
    if (*v54 != *(_DWORD *)v56)
      LOBYTE(v57) = 1;
    if ((v57 & 1) != 0)
      goto LABEL_61;
  }
  v58 = v11[15];
  v59 = *(uint64_t *)((char *)a1 + v58);
  v60 = *(unint64_t *)((char *)a1 + v58 + 8);
  v61 = (uint64_t *)&a2[v58];
  v62 = *v61;
  v63 = v61[1];
  if (v60 >> 60 == 15)
  {
    if (v63 >> 60 == 15)
      goto LABEL_64;
    goto LABEL_60;
  }
  if (v63 >> 60 == 15)
  {
LABEL_60:
    v64 = v59;
    sub_21C87A864(v59, v60);
    sub_21C87A864(v62, v63);
    sub_21C87FFB8(v64, v60);
    sub_21C87FFB8(v62, v63);
    goto LABEL_61;
  }
  v73 = v59;
  sub_21C87A864(v59, v60);
  sub_21C87A864(v62, v63);
  sub_21C881378(v73, v60);
  v72 = v67;
  sub_21C87FFB8(v62, v63);
  sub_21C87FFB8(v73, v60);
  if ((v72 & 1) != 0)
  {
LABEL_64:
    v68 = (char *)a1 + v12[5];
    v69 = *(void (**)(_BYTE *, char *, uint64_t))(v5 + 16);
    v69(v10, v68, v4);
    v69(v8, &a2[v12[5]], v4);
    sub_21C87FC20(&qword_2552C49A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v65 = sub_21C888230();
    v70 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
    v70(v8, v4);
    v70(v10, v4);
    return v65 & 1;
  }
LABEL_61:
  v65 = 0;
  return v65 & 1;
}

uint64_t sub_21C881E88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  char v14;
  double *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v25;
  void (*v26)(_BYTE *, uint64_t, uint64_t);
  void (*v27)(_BYTE *, uint64_t);
  _BYTE v28[12];
  int v29;

  v4 = sub_21C8880C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = &v28[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v28[-v9];
  v11 = type metadata accessor for StreamBlock.Event(0);
  v12 = *(int *)(v11 + 20);
  v13 = (double *)(a1 + v12);
  v14 = *(_BYTE *)(a1 + v12 + 8);
  v15 = (double *)(a2 + v12);
  v16 = *(unsigned __int8 *)(a2 + v12 + 8);
  if ((v14 & 1) != 0)
  {
    if (!v16)
      goto LABEL_12;
  }
  else
  {
    if (*v13 != *v15)
      LOBYTE(v16) = 1;
    if ((v16 & 1) != 0)
      goto LABEL_12;
  }
  v17 = *(int *)(v11 + 24);
  v18 = *(_QWORD *)(a1 + v17);
  v19 = *(_QWORD *)(a1 + v17 + 8);
  v20 = (uint64_t *)(a2 + v17);
  v21 = *v20;
  v22 = v20[1];
  if (v19 >> 60 == 15)
  {
    if (v22 >> 60 == 15)
      goto LABEL_15;
    goto LABEL_11;
  }
  if (v22 >> 60 == 15)
  {
LABEL_11:
    sub_21C87A864(v18, v19);
    sub_21C87A864(v21, v22);
    sub_21C87FFB8(v18, v19);
    sub_21C87FFB8(v21, v22);
    goto LABEL_12;
  }
  sub_21C87A864(v18, v19);
  sub_21C87A864(v21, v22);
  sub_21C881378(v18, v19);
  v29 = v25;
  sub_21C87FFB8(v21, v22);
  sub_21C87FFB8(v18, v19);
  if ((v29 & 1) != 0)
  {
LABEL_15:
    v26 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
    v26(v10, a1, v4);
    v26(v8, a2, v4);
    sub_21C87FC20(&qword_2552C49A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v23 = sub_21C888230();
    v27 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
    v27(v8, v4);
    v27(v10, v4);
    return v23 & 1;
  }
LABEL_12:
  v23 = 0;
  return v23 & 1;
}

uint64_t sub_21C88209C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  int *v11;
  int *v12;
  uint64_t v13;
  _DWORD *v14;
  char v15;
  _DWORD *v16;
  int v17;
  uint64_t v18;
  _DWORD *v19;
  char v20;
  _DWORD *v21;
  int v22;
  uint64_t v23;
  _DWORD *v24;
  char v25;
  _DWORD *v26;
  int v27;
  uint64_t v28;
  _DWORD *v29;
  char v30;
  _DWORD *v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  void (*v45)(_BYTE *, uint64_t, uint64_t);
  char v46;
  void (*v47)(_BYTE *, uint64_t);
  _BYTE v49[4];
  int v50;
  uint64_t v51;

  v4 = sub_21C8880C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = &v49[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v49[-v9];
  if ((sub_21C880160(*(_QWORD **)a1, *(_QWORD **)a2) & 1) == 0)
    goto LABEL_39;
  v11 = (int *)type metadata accessor for StreamBlock.EventBlock(0);
  v12 = v11;
  v13 = v11[7];
  v14 = (_DWORD *)(a1 + v13);
  v15 = *(_BYTE *)(a1 + v13 + 4);
  v16 = (_DWORD *)(a2 + v13);
  v17 = *(unsigned __int8 *)(a2 + v13 + 4);
  if ((v15 & 1) != 0)
  {
    if (!v17)
      goto LABEL_39;
  }
  else
  {
    if (*v14 != *v16)
      LOBYTE(v17) = 1;
    if ((v17 & 1) != 0)
      goto LABEL_39;
  }
  v18 = v11[8];
  v19 = (_DWORD *)(a1 + v18);
  v20 = *(_BYTE *)(a1 + v18 + 4);
  v21 = (_DWORD *)(a2 + v18);
  v22 = *(unsigned __int8 *)(a2 + v18 + 4);
  if ((v20 & 1) != 0)
  {
    if (!v22)
      goto LABEL_39;
  }
  else
  {
    if (*v19 != *v21)
      LOBYTE(v22) = 1;
    if ((v22 & 1) != 0)
      goto LABEL_39;
  }
  v23 = v11[9];
  v24 = (_DWORD *)(a1 + v23);
  v25 = *(_BYTE *)(a1 + v23 + 4);
  v26 = (_DWORD *)(a2 + v23);
  v27 = *(unsigned __int8 *)(a2 + v23 + 4);
  if ((v25 & 1) != 0)
  {
    if (!v27)
      goto LABEL_39;
  }
  else
  {
    if (*v24 != *v26)
      LOBYTE(v27) = 1;
    if ((v27 & 1) != 0)
      goto LABEL_39;
  }
  v28 = v11[10];
  v29 = (_DWORD *)(a1 + v28);
  v30 = *(_BYTE *)(a1 + v28 + 4);
  v31 = (_DWORD *)(a2 + v28);
  v32 = *(unsigned __int8 *)(a2 + v28 + 4);
  if ((v30 & 1) != 0)
  {
    if (!v32)
      goto LABEL_39;
  }
  else
  {
    if (*v29 != *v31)
      LOBYTE(v32) = 1;
    if ((v32 & 1) != 0)
      goto LABEL_39;
  }
  v33 = v11[11];
  v34 = *(unsigned __int8 *)(a1 + v33);
  v35 = *(unsigned __int8 *)(a2 + v33);
  if (v34 == 2)
  {
    if (v35 != 2)
      goto LABEL_39;
  }
  else if (v35 == 2 || ((((v35 & 1) == 0) ^ v34) & 1) == 0)
  {
    goto LABEL_39;
  }
  v36 = v11[12];
  v37 = *(_QWORD *)(a1 + v36);
  v38 = *(_QWORD *)(a1 + v36 + 8);
  v39 = (uint64_t *)(a2 + v36);
  v40 = *v39;
  v41 = v39[1];
  if (v38 >> 60 != 15)
  {
    if (v41 >> 60 == 15)
      goto LABEL_35;
    v51 = v37;
    sub_21C87A864(v37, v38);
    sub_21C87A864(v40, v41);
    sub_21C881378(v51, v38);
    v50 = v43;
    sub_21C87FFB8(v40, v41);
    sub_21C87FFB8(v51, v38);
    if ((v50 & 1) != 0)
      goto LABEL_37;
LABEL_39:
    v46 = 0;
    return v46 & 1;
  }
  if (v41 >> 60 != 15)
  {
LABEL_35:
    v42 = v37;
    sub_21C87A864(v37, v38);
    sub_21C87A864(v40, v41);
    sub_21C87FFB8(v42, v38);
    sub_21C87FFB8(v40, v41);
    goto LABEL_39;
  }
LABEL_37:
  if ((sub_21C880224(*(_QWORD *)(a1 + 8), *(_QWORD *)(a2 + 8)) & 1) == 0)
    goto LABEL_39;
  v44 = a1 + v12[6];
  v45 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
  v45(v10, v44, v4);
  v45(v8, a2 + v12[6], v4);
  sub_21C87FC20(&qword_2552C49A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
  v46 = sub_21C888230();
  v47 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v47(v8, v4);
  v47(v10, v4);
  return v46 & 1;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StreamBlock.FormatFlag(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StreamBlock.FormatFlag(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C8824A8 + 4 * byte_21C8886D4[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_21C8824DC + 4 * byte_21C8886CF[v4]))();
}

uint64_t sub_21C8824DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C8824E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C8824ECLL);
  return result;
}

uint64_t sub_21C8824F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C882500);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_21C882504(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C88250C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C882518(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21C882520(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StreamBlock.FormatFlag()
{
  return &type metadata for StreamBlock.FormatFlag;
}

uint64_t *sub_21C882538(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_21C8880C8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v8;
    v11 = (char *)a2 + v8;
    *(_QWORD *)v10 = *(_QWORD *)v11;
    v10[8] = v11[8];
    v12 = (char *)a1 + v9;
    v13 = (uint64_t *)((char *)a2 + v9);
    v14 = *(uint64_t *)((char *)a2 + v9 + 8);
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)v12 = *(_OWORD *)v13;
    }
    else
    {
      v16 = *v13;
      sub_21C87A878(*v13, v14);
      *(_QWORD *)v12 = v16;
      *((_QWORD *)v12 + 1) = v14;
    }
  }
  return a1;
}

uint64_t sub_21C882608(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  unint64_t v7;

  v4 = sub_21C8880C8();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v6 = (uint64_t *)(a1 + *(int *)(a2 + 24));
  v7 = v6[1];
  if (v7 >> 60 != 15)
    return sub_21C87C464(*v6, v7);
  return result;
}

uint64_t sub_21C88266C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;

  v6 = sub_21C8880C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  v11 = a1 + v8;
  v12 = (uint64_t *)(a2 + v8);
  v13 = *(_QWORD *)(a2 + v8 + 8);
  if (v13 >> 60 == 15)
  {
    *(_OWORD *)v11 = *(_OWORD *)v12;
  }
  else
  {
    v14 = *v12;
    sub_21C87A878(*v12, v13);
    *(_QWORD *)v11 = v14;
    *(_QWORD *)(v11 + 8) = v13;
  }
  return a1;
}

uint64_t sub_21C882710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v6 = sub_21C8880C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  *(_BYTE *)(v8 + 8) = *((_BYTE *)v9 + 8);
  *(_QWORD *)v8 = v10;
  v11 = *(int *)(a3 + 24);
  v12 = (uint64_t *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *(_QWORD *)(a2 + v11 + 8);
  if (*(_QWORD *)(a1 + v11 + 8) >> 60 != 15)
  {
    if (v14 >> 60 != 15)
    {
      v16 = *v13;
      sub_21C87A878(v16, v14);
      v17 = *v12;
      v18 = v12[1];
      *v12 = v16;
      v12[1] = v14;
      sub_21C87C464(v17, v18);
      return a1;
    }
    sub_21C87CF04((uint64_t)v12);
    goto LABEL_6;
  }
  if (v14 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)v12 = *(_OWORD *)v13;
    return a1;
  }
  v15 = *v13;
  sub_21C87A878(v15, v14);
  *v12 = v15;
  v12[1] = v14;
  return a1;
}

uint64_t sub_21C8827FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_21C8880C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t sub_21C882870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v6 = sub_21C8880C8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v7;
  v10 = a2 + v7;
  *(_BYTE *)(v9 + 8) = *(_BYTE *)(v10 + 8);
  *(_QWORD *)v9 = *(_QWORD *)v10;
  v11 = (uint64_t *)(a1 + v8);
  v12 = (uint64_t *)(a2 + v8);
  v13 = *(_QWORD *)(a1 + v8 + 8);
  if (v13 >> 60 != 15)
  {
    v14 = v12[1];
    if (v14 >> 60 != 15)
    {
      v15 = *v11;
      *v11 = *v12;
      v11[1] = v14;
      sub_21C87C464(v15, v13);
      return a1;
    }
    sub_21C87CF04((uint64_t)v11);
  }
  *(_OWORD *)v11 = *(_OWORD *)v12;
  return a1;
}

uint64_t sub_21C882928()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C882934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;

  v6 = sub_21C8880C8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8) >> 60;
  v10 = ((4 * (_DWORD)v9) & 0xC) == 0;
  v11 = ((4 * v9) & 0xC | (v9 >> 2)) ^ 0xF;
  if (v10)
    return 0;
  else
    return v11;
}

uint64_t sub_21C8829BC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C8829C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;

  result = sub_21C8880C8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  v10 = (_QWORD *)(a1 + *(int *)(a4 + 24));
  *v10 = 0;
  v10[1] = (unint64_t)((~(_DWORD)a2 >> 2) & 3 | (4 * ~(_DWORD)a2)) << 60;
  return result;
}

uint64_t sub_21C882A50()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C8880C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_21C882ACC(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;

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
    a1[1] = a2[1];
    v8 = a3[6];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21C8880C8();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[7];
    v14 = a3[8];
    v15 = (char *)v7 + v13;
    v16 = (char *)a2 + v13;
    *(_DWORD *)v15 = *(_DWORD *)v16;
    v15[4] = v16[4];
    v17 = (char *)v7 + v14;
    v18 = (char *)a2 + v14;
    *(_DWORD *)v17 = *(_DWORD *)v18;
    v17[4] = v18[4];
    v19 = a3[9];
    v20 = a3[10];
    v21 = (char *)v7 + v19;
    v22 = (char *)a2 + v19;
    *(_DWORD *)v21 = *(_DWORD *)v22;
    v21[4] = v22[4];
    v23 = (char *)v7 + v20;
    v24 = (char *)a2 + v20;
    v23[4] = v24[4];
    *(_DWORD *)v23 = *(_DWORD *)v24;
    v25 = a3[12];
    v26 = (char *)v7 + v25;
    v27 = (char *)a2 + v25;
    *((_BYTE *)v7 + a3[11]) = *((_BYTE *)a2 + a3[11]);
    v28 = *((_QWORD *)v27 + 1);
    if (v28 >> 60 == 15)
    {
      *(_OWORD *)v26 = *(_OWORD *)v27;
    }
    else
    {
      v29 = *(_QWORD *)v27;
      sub_21C87A878(*(_QWORD *)v27, *((_QWORD *)v27 + 1));
      *(_QWORD *)v26 = v29;
      *((_QWORD *)v26 + 1) = v28;
    }
  }
  return v7;
}

uint64_t sub_21C882C38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t *v7;
  unint64_t v8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_21C8880C8();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v7 = (uint64_t *)(a1 + *(int *)(a2 + 48));
  v8 = v7[1];
  if (v8 >> 60 != 15)
    return sub_21C87C464(*v7, v8);
  return result;
}

_QWORD *sub_21C882CC0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21C8880C8();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[7];
  v13 = a3[8];
  v14 = (char *)a1 + v12;
  v15 = (char *)a2 + v12;
  *(_DWORD *)v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  v16 = (char *)a1 + v13;
  v17 = (char *)a2 + v13;
  *(_DWORD *)v16 = *(_DWORD *)v17;
  v16[4] = v17[4];
  v18 = a3[9];
  v19 = a3[10];
  v20 = (char *)a1 + v18;
  v21 = (char *)a2 + v18;
  *(_DWORD *)v20 = *(_DWORD *)v21;
  v20[4] = v21[4];
  v22 = (char *)a1 + v19;
  v23 = (char *)a2 + v19;
  v22[4] = v23[4];
  *(_DWORD *)v22 = *(_DWORD *)v23;
  v24 = a3[12];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  v27 = *((_QWORD *)v26 + 1);
  if (v27 >> 60 == 15)
  {
    *(_OWORD *)v25 = *(_OWORD *)v26;
  }
  else
  {
    v28 = *(_QWORD *)v26;
    sub_21C87A878(*(_QWORD *)v26, *((_QWORD *)v26 + 1));
    *(_QWORD *)v25 = v28;
    *((_QWORD *)v25 + 1) = v27;
  }
  return a1;
}

_QWORD *sub_21C882DFC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  int v13;
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
  uint64_t *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21C8880C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[7];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = *(_DWORD *)v12;
  v11[4] = v12[4];
  *(_DWORD *)v11 = v13;
  v14 = a3[8];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  LOBYTE(v13) = v16[4];
  *(_DWORD *)v15 = *(_DWORD *)v16;
  v15[4] = v13;
  v17 = a3[9];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  LOBYTE(v13) = v19[4];
  *(_DWORD *)v18 = *(_DWORD *)v19;
  v18[4] = v13;
  v20 = a3[10];
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  LOBYTE(v13) = v22[4];
  *(_DWORD *)v21 = *(_DWORD *)v22;
  v21[4] = v13;
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  v23 = a3[12];
  v24 = (_QWORD *)((char *)a1 + v23);
  v25 = (_QWORD *)((char *)a2 + v23);
  v26 = *(_QWORD *)((char *)a2 + v23 + 8);
  if (*(_QWORD *)((char *)a1 + v23 + 8) >> 60 != 15)
  {
    if (v26 >> 60 != 15)
    {
      v28 = *v25;
      sub_21C87A878(v28, v26);
      v29 = *v24;
      v30 = v24[1];
      *v24 = v28;
      v24[1] = v26;
      sub_21C87C464(v29, v30);
      return a1;
    }
    sub_21C87CF04((uint64_t)v24);
    goto LABEL_6;
  }
  if (v26 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)v24 = *(_OWORD *)v25;
    return a1;
  }
  v27 = *v25;
  sub_21C87A878(v27, v26);
  *v24 = v27;
  v24[1] = v26;
  return a1;
}

_OWORD *sub_21C882F8C(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
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
  char *v20;
  char *v21;
  uint64_t v22;

  *a1 = *a2;
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21C8880C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  v11 = a3[8];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  *(_DWORD *)v12 = *(_DWORD *)v13;
  v12[4] = v13[4];
  v14 = (char *)a1 + v11;
  v15 = (char *)a2 + v11;
  *(_DWORD *)v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  v16 = a3[9];
  v17 = a3[10];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *(_DWORD *)v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  v20 = (char *)a1 + v17;
  v21 = (char *)a2 + v17;
  v20[4] = v21[4];
  *(_DWORD *)v20 = *(_DWORD *)v21;
  v22 = a3[12];
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  *(_OWORD *)((char *)a1 + v22) = *(_OWORD *)((char *)a2 + v22);
  return a1;
}

_QWORD *sub_21C883074(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
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
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21C8880C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[7];
  v11 = a3[8];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  *(_DWORD *)v12 = *(_DWORD *)v13;
  v12[4] = v13[4];
  v14 = (char *)a1 + v11;
  v15 = (char *)a2 + v11;
  *(_DWORD *)v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  v16 = a3[9];
  v17 = a3[10];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *(_DWORD *)v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  v20 = (char *)a1 + v17;
  v21 = (char *)a2 + v17;
  v20[4] = v21[4];
  *(_DWORD *)v20 = *(_DWORD *)v21;
  v22 = a3[12];
  *((_BYTE *)a1 + a3[11]) = *((_BYTE *)a2 + a3[11]);
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  v25 = *(_QWORD *)((char *)a1 + v22 + 8);
  if (v25 >> 60 != 15)
  {
    v26 = v24[1];
    if (v26 >> 60 != 15)
    {
      v27 = *v23;
      *v23 = *v24;
      v23[1] = v26;
      sub_21C87C464(v27, v25);
      return a1;
    }
    sub_21C87CF04((uint64_t)v23);
  }
  *(_OWORD *)v23 = *(_OWORD *)v24;
  return a1;
}

uint64_t sub_21C8831B8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_21C8880C8();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t sub_21C883244()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *__swift_store_extra_inhabitant_indexTm(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_21C8880C8();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_21C8832C8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C8880C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21C883364(uint64_t *a1, uint64_t *a2, int *a3)
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
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t *v43;
  unint64_t v44;
  uint64_t v45;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21C8880C8();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = a3[7];
    v15 = (char *)v7 + v13;
    v16 = (char *)a2 + v13;
    *(_DWORD *)v15 = *(_DWORD *)v16;
    v15[4] = v16[4];
    v17 = (char *)v7 + v14;
    v18 = (char *)a2 + v14;
    *(_DWORD *)v17 = *(_DWORD *)v18;
    v17[4] = v18[4];
    v19 = a3[8];
    v20 = a3[9];
    v21 = (char *)v7 + v19;
    v22 = (char *)a2 + v19;
    *(_DWORD *)v21 = *(_DWORD *)v22;
    v21[4] = v22[4];
    v23 = (char *)v7 + v20;
    v24 = (char *)a2 + v20;
    *(_QWORD *)v23 = *(_QWORD *)v24;
    v23[8] = v24[8];
    v25 = a3[10];
    v26 = a3[11];
    v27 = (char *)v7 + v25;
    v28 = (char *)a2 + v25;
    v29 = *(_QWORD *)v28;
    v27[8] = v28[8];
    *(_QWORD *)v27 = v29;
    v30 = (char *)v7 + v26;
    v31 = (char *)a2 + v26;
    v30[8] = v31[8];
    *(_QWORD *)v30 = *(_QWORD *)v31;
    v32 = a3[12];
    v33 = a3[13];
    v34 = (char *)v7 + v32;
    v35 = (char *)a2 + v32;
    v34[8] = v35[8];
    *(_QWORD *)v34 = *(_QWORD *)v35;
    v36 = (char *)v7 + v33;
    v37 = (char *)a2 + v33;
    v36[4] = v37[4];
    *(_DWORD *)v36 = *(_DWORD *)v37;
    v38 = a3[14];
    v39 = a3[15];
    v40 = (char *)v7 + v38;
    v41 = (char *)a2 + v38;
    v40[4] = v41[4];
    LODWORD(v29) = *(_DWORD *)v41;
    v42 = (char *)v7 + v39;
    v43 = (uint64_t *)((char *)a2 + v39);
    *(_DWORD *)v40 = v29;
    v44 = *(uint64_t *)((char *)a2 + v39 + 8);
    if (v44 >> 60 == 15)
    {
      *(_OWORD *)v42 = *(_OWORD *)v43;
    }
    else
    {
      v45 = *v43;
      sub_21C87A878(*v43, v44);
      *(_QWORD *)v42 = v45;
      *((_QWORD *)v42 + 1) = v44;
    }
  }
  return v7;
}

uint64_t sub_21C883530(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t *v7;
  unint64_t v8;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_21C8880C8();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v7 = (uint64_t *)(a1 + *(int *)(a2 + 60));
  v8 = v7[1];
  if (v8 >> 60 != 15)
    return sub_21C87C464(*v7, v8);
  return result;
}

_QWORD *sub_21C8835B0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t *v41;
  unint64_t v42;
  uint64_t v43;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21C8880C8();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = a3[6];
  v12 = a3[7];
  v13 = (char *)a1 + v11;
  v14 = (char *)a2 + v11;
  *(_DWORD *)v13 = *(_DWORD *)v14;
  v13[4] = v14[4];
  v15 = (char *)a1 + v12;
  v16 = (char *)a2 + v12;
  *(_DWORD *)v15 = *(_DWORD *)v16;
  v15[4] = v16[4];
  v17 = a3[8];
  v18 = a3[9];
  v19 = (char *)a1 + v17;
  v20 = (char *)a2 + v17;
  *(_DWORD *)v19 = *(_DWORD *)v20;
  v19[4] = v20[4];
  v21 = (char *)a1 + v18;
  v22 = (char *)a2 + v18;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  v23 = a3[10];
  v24 = a3[11];
  v25 = (char *)a1 + v23;
  v26 = (char *)a2 + v23;
  v27 = *(_QWORD *)v26;
  v25[8] = v26[8];
  *(_QWORD *)v25 = v27;
  v28 = (char *)a1 + v24;
  v29 = (char *)a2 + v24;
  v28[8] = v29[8];
  *(_QWORD *)v28 = *(_QWORD *)v29;
  v30 = a3[12];
  v31 = a3[13];
  v32 = (char *)a1 + v30;
  v33 = (char *)a2 + v30;
  v32[8] = v33[8];
  *(_QWORD *)v32 = *(_QWORD *)v33;
  v34 = (char *)a1 + v31;
  v35 = (char *)a2 + v31;
  v34[4] = v35[4];
  *(_DWORD *)v34 = *(_DWORD *)v35;
  v36 = a3[14];
  v37 = a3[15];
  v38 = (char *)a1 + v36;
  v39 = (char *)a2 + v36;
  v38[4] = v39[4];
  LODWORD(v27) = *(_DWORD *)v39;
  v40 = (char *)a1 + v37;
  v41 = (_QWORD *)((char *)a2 + v37);
  *(_DWORD *)v38 = v27;
  v42 = *(_QWORD *)((char *)a2 + v37 + 8);
  if (v42 >> 60 == 15)
  {
    *(_OWORD *)v40 = *(_OWORD *)v41;
  }
  else
  {
    v43 = *v41;
    sub_21C87A878(*v41, v42);
    *(_QWORD *)v40 = v43;
    *((_QWORD *)v40 + 1) = v42;
  }
  return a1;
}

_QWORD *sub_21C883754(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char v17;
  uint64_t v18;
  char *v19;
  char *v20;
  int v21;
  uint64_t v22;
  char *v23;
  char *v24;
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
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21C8880C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = v12[4];
  *(_DWORD *)v11 = *(_DWORD *)v12;
  v11[4] = v13;
  v14 = a3[7];
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = v16[4];
  *(_DWORD *)v15 = *(_DWORD *)v16;
  v15[4] = v17;
  v18 = a3[8];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = *(_DWORD *)v20;
  v19[4] = v20[4];
  *(_DWORD *)v19 = v21;
  v22 = a3[9];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = *(_QWORD *)v24;
  v23[8] = v24[8];
  *(_QWORD *)v23 = v25;
  v26 = a3[10];
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  v29 = *(_QWORD *)v28;
  v27[8] = v28[8];
  *(_QWORD *)v27 = v29;
  v30 = a3[11];
  v31 = (char *)a1 + v30;
  v32 = (char *)a2 + v30;
  LOBYTE(v29) = v32[8];
  *(_QWORD *)v31 = *(_QWORD *)v32;
  v31[8] = v29;
  v33 = a3[12];
  v34 = (char *)a1 + v33;
  v35 = (char *)a2 + v33;
  LOBYTE(v29) = v35[8];
  *(_QWORD *)v34 = *(_QWORD *)v35;
  v34[8] = v29;
  v36 = a3[13];
  v37 = (char *)a1 + v36;
  v38 = (char *)a2 + v36;
  LOBYTE(v29) = v38[4];
  *(_DWORD *)v37 = *(_DWORD *)v38;
  v37[4] = v29;
  v39 = a3[14];
  v40 = (char *)a1 + v39;
  v41 = (char *)a2 + v39;
  LOBYTE(v29) = v41[4];
  *(_DWORD *)v40 = *(_DWORD *)v41;
  v40[4] = v29;
  v42 = a3[15];
  v43 = (_QWORD *)((char *)a1 + v42);
  v44 = (_QWORD *)((char *)a2 + v42);
  v45 = *(_QWORD *)((char *)a2 + v42 + 8);
  if (*(_QWORD *)((char *)a1 + v42 + 8) >> 60 != 15)
  {
    if (v45 >> 60 != 15)
    {
      v47 = *v44;
      sub_21C87A878(v47, v45);
      v48 = *v43;
      v49 = v43[1];
      *v43 = v47;
      v43[1] = v45;
      sub_21C87C464(v48, v49);
      return a1;
    }
    sub_21C87CF04((uint64_t)v43);
    goto LABEL_6;
  }
  if (v45 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)v43 = *(_OWORD *)v44;
    return a1;
  }
  v46 = *v44;
  sub_21C87A878(v46, v45);
  *v43 = v46;
  v43[1] = v45;
  return a1;
}

_QWORD *sub_21C88394C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
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
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21C8880C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  *(_DWORD *)v12 = *(_DWORD *)v13;
  v12[4] = v13[4];
  v14 = (char *)a1 + v11;
  v15 = (char *)a2 + v11;
  *(_DWORD *)v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  v16 = a3[8];
  v17 = a3[9];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *(_DWORD *)v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  v20 = (char *)a1 + v17;
  v21 = (char *)a2 + v17;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v21[8];
  v22 = a3[10];
  v23 = a3[11];
  v24 = (char *)a1 + v22;
  v25 = (char *)a2 + v22;
  v26 = *(_QWORD *)v25;
  v24[8] = v25[8];
  *(_QWORD *)v24 = v26;
  v27 = (char *)a1 + v23;
  v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(_QWORD *)v27 = *(_QWORD *)v28;
  v29 = a3[12];
  v30 = a3[13];
  v31 = (char *)a1 + v29;
  v32 = (char *)a2 + v29;
  v31[8] = v32[8];
  *(_QWORD *)v31 = *(_QWORD *)v32;
  v33 = (char *)a1 + v30;
  v34 = (char *)a2 + v30;
  v33[4] = v34[4];
  *(_DWORD *)v33 = *(_DWORD *)v34;
  v35 = a3[14];
  v36 = a3[15];
  v37 = (char *)a1 + v35;
  v38 = (char *)a2 + v35;
  v37[4] = v38[4];
  *(_DWORD *)v37 = *(_DWORD *)v38;
  *(_OWORD *)((char *)a1 + v36) = *(_OWORD *)((char *)a2 + v36);
  return a1;
}

_QWORD *sub_21C883AAC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
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
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t *v39;
  uint64_t *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21C8880C8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  *(_DWORD *)v12 = *(_DWORD *)v13;
  v12[4] = v13[4];
  v14 = (char *)a1 + v11;
  v15 = (char *)a2 + v11;
  *(_DWORD *)v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  v16 = a3[8];
  v17 = a3[9];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *(_DWORD *)v18 = *(_DWORD *)v19;
  v18[4] = v19[4];
  v20 = (char *)a1 + v17;
  v21 = (char *)a2 + v17;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v21[8];
  v22 = a3[10];
  v23 = a3[11];
  v24 = (char *)a1 + v22;
  v25 = (char *)a2 + v22;
  v26 = *(_QWORD *)v25;
  v24[8] = v25[8];
  *(_QWORD *)v24 = v26;
  v27 = (char *)a1 + v23;
  v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(_QWORD *)v27 = *(_QWORD *)v28;
  v29 = a3[12];
  v30 = a3[13];
  v31 = (char *)a1 + v29;
  v32 = (char *)a2 + v29;
  v31[8] = v32[8];
  *(_QWORD *)v31 = *(_QWORD *)v32;
  v33 = (char *)a1 + v30;
  v34 = (char *)a2 + v30;
  v33[4] = v34[4];
  *(_DWORD *)v33 = *(_DWORD *)v34;
  v35 = a3[14];
  v36 = a3[15];
  v37 = (char *)a1 + v35;
  v38 = (char *)a2 + v35;
  v37[4] = v38[4];
  v39 = (_QWORD *)((char *)a1 + v36);
  v40 = (_QWORD *)((char *)a2 + v36);
  *(_DWORD *)v37 = *(_DWORD *)v38;
  v41 = *(_QWORD *)((char *)a1 + v36 + 8);
  if (v41 >> 60 != 15)
  {
    v42 = v40[1];
    if (v42 >> 60 != 15)
    {
      v43 = *v39;
      *v39 = *v40;
      v39[1] = v42;
      sub_21C87C464(v43, v41);
      return a1;
    }
    sub_21C87CF04((uint64_t)v39);
  }
  *(_OWORD *)v39 = *(_OWORD *)v40;
  return a1;
}

uint64_t sub_21C883C58()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21C883C64(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_21C8880C8();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_21C883CE0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_21C883CEC(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_21C8880C8();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_21C883D60()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C8880C8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_21C883E08()
{
  unint64_t result;

  result = qword_2552C4BC8;
  if (!qword_2552C4BC8)
  {
    result = MEMORY[0x220783F28](&unk_21C888E20, &type metadata for StreamBlock.FormatFlag);
    atomic_store(result, (unint64_t *)&qword_2552C4BC8);
  }
  return result;
}

unint64_t sub_21C883E50()
{
  unint64_t result;

  result = qword_2552C4BD0;
  if (!qword_2552C4BD0)
  {
    result = MEMORY[0x220783F28](&unk_21C888DA0, &type metadata for StreamBlock.FormatFlag);
    atomic_store(result, (unint64_t *)&qword_2552C4BD0);
  }
  return result;
}

unint64_t sub_21C883E98()
{
  unint64_t result;

  result = qword_2552C4BD8;
  if (!qword_2552C4BD8)
  {
    result = MEMORY[0x220783F28](&unk_21C888E60, &type metadata for StreamBlock.FormatFlag);
    atomic_store(result, (unint64_t *)&qword_2552C4BD8);
  }
  return result;
}

unint64_t sub_21C883EDC()
{
  unint64_t result;

  result = qword_2552C4BE0;
  if (!qword_2552C4BE0)
  {
    result = MEMORY[0x220783F28](&unk_21C888DD8, &type metadata for StreamBlock.FormatFlag);
    atomic_store(result, (unint64_t *)&qword_2552C4BE0);
  }
  return result;
}

BOOL sub_21C883F20(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21C883F38()
{
  sub_21C8882FC();
  sub_21C888308();
  return sub_21C888314();
}

uint64_t sub_21C883F7C()
{
  return sub_21C888308();
}

uint64_t sub_21C883FA4()
{
  sub_21C8882FC();
  sub_21C888308();
  return sub_21C888314();
}

void sub_21C883FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X8 }
}

unint64_t sub_21C884294()
{
  unint64_t result;

  result = qword_2552C4BE8;
  if (!qword_2552C4BE8)
  {
    result = MEMORY[0x220783F28](&unk_21C888F58, &type metadata for VarIntError);
    atomic_store(result, (unint64_t *)&qword_2552C4BE8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for VarIntError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for VarIntError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C8843B4 + 4 * byte_21C888ED5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21C8843E8 + 4 * byte_21C888ED0[v4]))();
}

uint64_t sub_21C8843E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C8843F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C8843F8);
  return result;
}

uint64_t sub_21C884404(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C88440CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21C884410(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C884418(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21C884424(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for VarIntError()
{
  return &type metadata for VarIntError;
}

unint64_t sub_21C884444()
{
  unint64_t result;

  result = qword_2552C4BF0;
  if (!qword_2552C4BF0)
  {
    result = MEMORY[0x220783F28](&unk_21C888F30, &type metadata for VarIntError);
    atomic_store(result, (unint64_t *)&qword_2552C4BF0);
  }
  return result;
}

uint64_t sub_21C884488(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if ((a2 & 1) == 0)
  {
    HIDWORD(v7) = a1;
    LODWORD(v7) = a1 - 8;
    v6 = v7 >> 3;
    if ((a2 & 4) == 0)
    {
      switch(v6)
      {
        case 0:
          v8 = sub_21C885CB4(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_21C884E4C);
          if (v5)
            return v4;
          v9 = v8;
          goto LABEL_14;
        case 1:
          v19 = sub_21C885E28(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_21C884C30);
          if (v5)
            return v4;
          v20 = v19;
          goto LABEL_29;
        case 3:
          v21 = sub_21C885FA8(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_21C884A14);
          if (v5)
            return v4;
          v22 = v21;
          goto LABEL_32;
        case 7:
          v23 = sub_21C88612C(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_21C8847FC);
          if (v5)
            return v4;
          v24 = v23;
          goto LABEL_36;
        default:
          goto LABEL_15;
      }
    }
    switch(v6)
    {
      case 0:
        v12 = sub_21C885CB4(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_21C885674);
        if (v5)
          return v4;
        v9 = v12;
LABEL_14:
        v13 = sub_21C886AFC(v9);
        break;
      case 1:
        v25 = sub_21C885E28(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_21C885458);
        if (v5)
          return v4;
        v20 = v25;
LABEL_29:
        v13 = sub_21C886C14(v20);
        break;
      case 3:
        v26 = sub_21C885FA8(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_21C88523C);
        if (v5)
          return v4;
        v22 = v26;
LABEL_32:
        v13 = sub_21C886D2C(v22);
        break;
      case 7:
        v27 = sub_21C88612C(a2, 0, 1, a3, a4, (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))sub_21C885068);
        if (v5)
          return v4;
        v24 = v27;
LABEL_36:
        v13 = sub_21C886E44(v24);
        break;
      default:
        goto LABEL_15;
    }
    v4 = v13;
    swift_bridgeObjectRelease();
    return v4;
  }
  switch(a1)
  {
    case 64:
      sub_21C885B58(a2, 0, 1, a3, a4);
      if (!v5)
      {
        v11 = sub_21C8869DC(v15);
        goto LABEL_20;
      }
      break;
    case 32:
      sub_21C8859FC(a2, 0, 1, a3, a4);
      if (!v5)
      {
        v11 = sub_21C8868BC(v16);
        goto LABEL_20;
      }
      break;
    case 16:
      sub_21C8858A4(a2, 0, 1, a3, a4);
      if (!v5)
      {
        v11 = sub_21C88679C(v10);
LABEL_20:
        v17 = v11;
        swift_bridgeObjectRelease();
        return v17;
      }
      break;
    default:
LABEL_15:
      sub_21C8847B8();
      swift_allocError();
      *v14 = 1;
      swift_willThrow();
      break;
  }
  return v4;
}

unint64_t sub_21C8847B8()
{
  unint64_t result;

  result = qword_2552C4BF8;
  if (!qword_2552C4BF8)
  {
    result = MEMORY[0x220783F28](&unk_21C889038, &type metadata for FormatError);
    atomic_store(result, (unint64_t *)&qword_2552C4BF8);
  }
  return result;
}

void sub_21C8847FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X9 }
}

char *sub_21C88488C()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;

  if ((v17 & 1) != 0)
  {
LABEL_20:
    __break(1u);
    JUMPOUT(0x21C884A00);
  }
  if (v5 < v16 && ((v19 & 1) != 0 || *((_QWORD *)v1 + 2) != v18))
  {
    sub_21C883FF4(v5, v3, v2);
    if (v0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = -(uint64_t)(v6 & 1) ^ (v6 >> 1);
      v9 = __OFADD__(v8, v4);
      v10 = v8 + v4;
      if (v9)
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if ((v10 & 0x8000000000000000) == 0)
      {
        v11 = v7;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v1 = sub_21C886F5C(0, *((_QWORD *)v1 + 2) + 1, 1, v1, &qword_2552C4C38);
        v13 = *((_QWORD *)v1 + 2);
        v12 = *((_QWORD *)v1 + 3);
        if (v13 >= v12 >> 1)
          v1 = sub_21C886F5C((char *)(v12 > 1), v13 + 1, 1, v1, &qword_2552C4C38);
        *((_QWORD *)v1 + 2) = v13 + 1;
        *(_QWORD *)&v1[8 * v13 + 32] = v10;
        if (!__OFADD__(v5, v11))
          JUMPOUT(0x21C88486CLL);
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
      sub_21C884294();
      swift_allocError();
      *v14 = 0;
      swift_willThrow();
    }
  }
  return v1;
}

void sub_21C884A14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X9 }
}

char *sub_21C884AA4()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;

  if ((v17 & 1) != 0)
  {
LABEL_20:
    __break(1u);
    JUMPOUT(0x21C884C1CLL);
  }
  if (v5 < v16 && ((v19 & 1) != 0 || *((_QWORD *)v1 + 2) != v18))
  {
    sub_21C883FF4(v5, v3, v2);
    if (v0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = -(uint64_t)(v6 & 1) ^ (v6 >> 1);
      v9 = __OFADD__(v8, v4);
      v10 = v8 + v4;
      if (v9)
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (!HIDWORD(v10))
      {
        v11 = v7;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v1 = sub_21C887050(0, *((_QWORD *)v1 + 2) + 1, 1, v1, &qword_2552C4C30);
        v13 = *((_QWORD *)v1 + 2);
        v12 = *((_QWORD *)v1 + 3);
        if (v13 >= v12 >> 1)
          v1 = sub_21C887050((char *)(v12 > 1), v13 + 1, 1, v1, &qword_2552C4C30);
        *((_QWORD *)v1 + 2) = v13 + 1;
        *(_DWORD *)&v1[4 * v13 + 32] = v10;
        if (!__OFADD__(v5, v11))
          JUMPOUT(0x21C884A84);
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
      sub_21C884294();
      swift_allocError();
      *v14 = 0;
      swift_willThrow();
    }
  }
  return v1;
}

void sub_21C884C30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X9 }
}

char *sub_21C884CC0()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;

  if ((v17 & 1) != 0)
  {
LABEL_20:
    __break(1u);
    JUMPOUT(0x21C884E38);
  }
  if (v5 < v16 && ((v19 & 1) != 0 || *((_QWORD *)v1 + 2) != v18))
  {
    sub_21C883FF4(v5, v3, v2);
    if (v0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = -(uint64_t)(v6 & 1) ^ (v6 >> 1);
      v9 = __OFADD__(v8, v4);
      v10 = v8 + v4;
      if (v9)
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (!(v10 >> 16))
      {
        v11 = v7;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v1 = sub_21C887144(0, *((_QWORD *)v1 + 2) + 1, 1, v1, &qword_2552C4C28);
        v13 = *((_QWORD *)v1 + 2);
        v12 = *((_QWORD *)v1 + 3);
        if (v13 >= v12 >> 1)
          v1 = sub_21C887144((char *)(v12 > 1), v13 + 1, 1, v1, &qword_2552C4C28);
        *((_QWORD *)v1 + 2) = v13 + 1;
        *(_WORD *)&v1[2 * v13 + 32] = v10;
        if (!__OFADD__(v5, v11))
          JUMPOUT(0x21C884CA0);
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
      sub_21C884294();
      swift_allocError();
      *v14 = 0;
      swift_willThrow();
    }
  }
  return v1;
}

void sub_21C884E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X9 }
}

char *sub_21C884EDC()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;

  if ((v17 & 1) != 0)
  {
LABEL_20:
    __break(1u);
    JUMPOUT(0x21C885054);
  }
  if (v5 < v16 && ((v19 & 1) != 0 || *((_QWORD *)v1 + 2) != v18))
  {
    sub_21C883FF4(v5, v3, v2);
    if (v0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = -(uint64_t)(v6 & 1) ^ (v6 >> 1);
      v9 = __OFADD__(v8, v4);
      v10 = v8 + v4;
      if (v9)
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (v10 <= 0xFF)
      {
        v11 = v7;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v1 = sub_21C887234(0, *((_QWORD *)v1 + 2) + 1, 1, v1, &qword_2552C4C20);
        v13 = *((_QWORD *)v1 + 2);
        v12 = *((_QWORD *)v1 + 3);
        if (v13 >= v12 >> 1)
          v1 = sub_21C887234((char *)(v12 > 1), v13 + 1, 1, v1, &qword_2552C4C20);
        *((_QWORD *)v1 + 2) = v13 + 1;
        v1[v13 + 32] = v10;
        if (!__OFADD__(v5, v11))
          JUMPOUT(0x21C884EBCLL);
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
      sub_21C884294();
      swift_allocError();
      *v14 = 0;
      swift_willThrow();
    }
  }
  return v1;
}

void sub_21C885068(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X9 }
}

char *sub_21C8850F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  if ((v15 & 1) != 0)
    goto LABEL_18;
  if (v3 < v14 && ((v18 & 1) != 0 || *((_QWORD *)v4 + 2) != v16))
  {
    sub_21C883FF4(v3, v1, v17);
    if (!v0)
    {
      v7 = -(uint64_t)(v5 & 1) ^ (v5 >> 1);
      v8 = __OFADD__(v7, v2);
      v9 = v7 + v2;
      if (v8)
      {
        __break(1u);
      }
      else
      {
        v10 = v6;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v4 = sub_21C886F5C(0, *((_QWORD *)v4 + 2) + 1, 1, v4, &qword_2552C4C18);
        v12 = *((_QWORD *)v4 + 2);
        v11 = *((_QWORD *)v4 + 3);
        if (v12 >= v11 >> 1)
          v4 = sub_21C886F5C((char *)(v11 > 1), v12 + 1, 1, v4, &qword_2552C4C18);
        *((_QWORD *)v4 + 2) = v12 + 1;
        *(_QWORD *)&v4[8 * v12 + 32] = v9;
        if (!__OFADD__(v3, v10))
          JUMPOUT(0x21C8850D4);
      }
      __break(1u);
LABEL_18:
      __break(1u);
      JUMPOUT(0x21C885228);
    }
    swift_bridgeObjectRelease();
  }
  return v4;
}

void sub_21C88523C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X9 }
}

char *sub_21C8852CC()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;

  if ((v17 & 1) != 0)
  {
LABEL_20:
    __break(1u);
    JUMPOUT(0x21C885444);
  }
  if (v5 < v16 && ((v19 & 1) != 0 || *((_QWORD *)v1 + 2) != v18))
  {
    sub_21C883FF4(v5, v3, v2);
    if (v0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = -(uint64_t)(v6 & 1) ^ (v6 >> 1);
      v9 = __OFADD__(v8, v4);
      v10 = v8 + v4;
      if (v9)
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (v10 == (int)v10)
      {
        v11 = v7;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v1 = sub_21C887050(0, *((_QWORD *)v1 + 2) + 1, 1, v1, &qword_2552C4C10);
        v13 = *((_QWORD *)v1 + 2);
        v12 = *((_QWORD *)v1 + 3);
        if (v13 >= v12 >> 1)
          v1 = sub_21C887050((char *)(v12 > 1), v13 + 1, 1, v1, &qword_2552C4C10);
        *((_QWORD *)v1 + 2) = v13 + 1;
        *(_DWORD *)&v1[4 * v13 + 32] = v10;
        if (!__OFADD__(v5, v11))
          JUMPOUT(0x21C8852ACLL);
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
      sub_21C884294();
      swift_allocError();
      *v14 = 0;
      swift_willThrow();
    }
  }
  return v1;
}

void sub_21C885458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X9 }
}

char *sub_21C8854E8()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;

  if ((v17 & 1) != 0)
  {
LABEL_20:
    __break(1u);
    JUMPOUT(0x21C885660);
  }
  if (v5 < v16 && ((v19 & 1) != 0 || *((_QWORD *)v1 + 2) != v18))
  {
    sub_21C883FF4(v5, v3, v2);
    if (v0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = -(uint64_t)(v6 & 1) ^ (v6 >> 1);
      v9 = __OFADD__(v8, v4);
      v10 = v8 + v4;
      if (v9)
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (v10 == (__int16)v10)
      {
        v11 = v7;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v1 = sub_21C887144(0, *((_QWORD *)v1 + 2) + 1, 1, v1, &qword_2552C4C08);
        v13 = *((_QWORD *)v1 + 2);
        v12 = *((_QWORD *)v1 + 3);
        if (v13 >= v12 >> 1)
          v1 = sub_21C887144((char *)(v12 > 1), v13 + 1, 1, v1, &qword_2552C4C08);
        *((_QWORD *)v1 + 2) = v13 + 1;
        *(_WORD *)&v1[2 * v13 + 32] = v10;
        if (!__OFADD__(v5, v11))
          JUMPOUT(0x21C8854C8);
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
      sub_21C884294();
      swift_allocError();
      *v14 = 0;
      swift_willThrow();
    }
  }
  return v1;
}

void sub_21C885674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X9 }
}

char *sub_21C885704()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;

  if ((v17 & 1) != 0)
  {
LABEL_20:
    __break(1u);
    JUMPOUT(0x21C88587CLL);
  }
  if (v5 < v16 && ((v19 & 1) != 0 || *((_QWORD *)v1 + 2) != v18))
  {
    sub_21C883FF4(v5, v3, v2);
    if (v0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = -(uint64_t)(v6 & 1) ^ (v6 >> 1);
      v9 = __OFADD__(v8, v4);
      v10 = v8 + v4;
      if (v9)
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      if (v10 == (char)v10)
      {
        v11 = v7;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v1 = sub_21C887234(0, *((_QWORD *)v1 + 2) + 1, 1, v1, &qword_2552C4C00);
        v13 = *((_QWORD *)v1 + 2);
        v12 = *((_QWORD *)v1 + 3);
        if (v13 >= v12 >> 1)
          v1 = sub_21C887234((char *)(v12 > 1), v13 + 1, 1, v1, &qword_2552C4C00);
        *((_QWORD *)v1 + 2) = v13 + 1;
        v1[v13 + 32] = v10;
        if (!__OFADD__(v5, v11))
          JUMPOUT(0x21C8856E4);
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
      sub_21C884294();
      swift_allocError();
      *v14 = 0;
      swift_willThrow();
    }
  }
  return v1;
}

BOOL sub_21C885890(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_21C8858A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BR              X11 }
}

uint64_t sub_21C8858EC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;

  if ((uint64_t)BYTE6(v4) >> 1 > a2 && (a3 & 1) == 0)
    v8 = a2;
  else
    v8 = (uint64_t)BYTE6(v4) >> 1;
  v13 = v8;
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (v8)
  {
    v9 = sub_21C888278();
    *(_QWORD *)(v9 + 16) = v8;
  }
  else
  {
    v9 = MEMORY[0x24BEE4AF8];
  }
  v11[1] = v8;
  v12 = 0;
  v11[0] = v9 + 32;
  sub_21C886538((uint64_t)v11, &v12, v6, &v13, v5, v4);
  if (!v3)
  {
    if (v8 >= v12)
    {
      *(_QWORD *)(v9 + 16) = v12;
      return v9;
    }
LABEL_19:
    __break(1u);
    JUMPOUT(0x21C8859E4);
  }
  if (v8 < v12)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *(_QWORD *)(v9 + 16) = v12;
  swift_bridgeObjectRelease();
  return v9;
}

void sub_21C8859FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BR              X11 }
}

uint64_t sub_21C885A44(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;

  if ((uint64_t)BYTE6(v4) >> 2 > a2 && (a3 & 1) == 0)
    v8 = a2;
  else
    v8 = (uint64_t)BYTE6(v4) >> 2;
  v13 = v8;
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (v8)
  {
    v9 = sub_21C888278();
    *(_QWORD *)(v9 + 16) = v8;
  }
  else
  {
    v9 = MEMORY[0x24BEE4AF8];
  }
  v11[1] = v8;
  v12 = 0;
  v11[0] = v9 + 32;
  sub_21C8863F4((uint64_t)v11, &v12, v6, &v13, v5, v4);
  if (!v3)
  {
    if (v8 >= v12)
    {
      *(_QWORD *)(v9 + 16) = v12;
      return v9;
    }
LABEL_19:
    __break(1u);
    JUMPOUT(0x21C885B40);
  }
  if (v8 < v12)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *(_QWORD *)(v9 + 16) = v12;
  swift_bridgeObjectRelease();
  return v9;
}

void sub_21C885B58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __asm { BR              X11 }
}

uint64_t sub_21C885BA0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;

  if ((uint64_t)BYTE6(v4) >> 3 > a2 && (a3 & 1) == 0)
    v8 = a2;
  else
    v8 = (uint64_t)BYTE6(v4) >> 3;
  v13 = v8;
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (v8)
  {
    v9 = sub_21C888278();
    *(_QWORD *)(v9 + 16) = v8;
  }
  else
  {
    v9 = MEMORY[0x24BEE4AF8];
  }
  v11[1] = v8;
  v12 = 0;
  v11[0] = v9 + 32;
  sub_21C8862B0((uint64_t)v11, &v12, v6, &v13, v5, v4);
  if (!v3)
  {
    if (v8 >= v12)
    {
      *(_QWORD *)(v9 + 16) = v12;
      return v9;
    }
LABEL_19:
    __break(1u);
    JUMPOUT(0x21C885C9CLL);
  }
  if (v8 < v12)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *(_QWORD *)(v9 + 16) = v12;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_21C885CB4(__int16 a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, _QWORD, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((a1 & 0x100) == 0)
    __asm { BR              X12 }
  v8 = a6(a2, a3 & 1, a4, a5);
  if (!v6)
    return v8;
  return v7;
}

uint64_t sub_21C885E28(__int16 a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, _QWORD, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((a1 & 0x100) == 0)
    __asm { BR              X12 }
  v8 = a6(a2, a3 & 1, a4, a5);
  if (!v6)
    return v8;
  return v7;
}

uint64_t sub_21C885FA8(__int16 a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, _QWORD, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((a1 & 0x100) == 0)
    __asm { BR              X12 }
  v8 = a6(a2, a3 & 1, a4, a5);
  if (!v6)
    return v8;
  return v7;
}

uint64_t sub_21C88612C(__int16 a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, _QWORD, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((a1 & 0x100) == 0)
    __asm { BR              X12 }
  v8 = a6(a2, a3 & 1, a4, a5);
  if (!v6)
    return v8;
  return v7;
}

uint64_t sub_21C8862B0(uint64_t a1, _QWORD *a2, char a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  _BYTE *v6;

  if ((a3 & 2) == 0)
  {
    *a2 = *a4;
    __asm { BR              X11 }
  }
  sub_21C8847B8();
  swift_allocError();
  *v6 = 0;
  return swift_willThrow();
}

uint64_t sub_21C8863F4(uint64_t a1, _QWORD *a2, char a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  _BYTE *v6;

  if ((a3 & 2) == 0)
  {
    *a2 = *a4;
    __asm { BR              X11 }
  }
  sub_21C8847B8();
  swift_allocError();
  *v6 = 0;
  return swift_willThrow();
}

uint64_t sub_21C886538(uint64_t a1, _QWORD *a2, char a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  _BYTE *v6;

  if ((a3 & 2) == 0)
  {
    *a2 = *a4;
    __asm { BR              X11 }
  }
  sub_21C8847B8();
  swift_allocError();
  *v6 = 0;
  return swift_willThrow();
}

uint64_t sub_21C886674(uint64_t a1, _QWORD *a2, char a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  _BYTE *v6;

  if ((a3 & 2) == 0)
  {
    *a2 = *a4;
    __asm { BR              X11 }
  }
  sub_21C8847B8();
  swift_allocError();
  *v6 = 0;
  return swift_willThrow();
}

uint64_t sub_21C88679C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_21C87C524(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21C87C524(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_21C87C524((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_21C87C358(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 2;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_21C8868BC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_21C87C524(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21C87C524(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_21C87C524((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_21C87C358(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_21C8869DC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_21C87C524(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21C87C524(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_21C87C524((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_21C87C358(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_21C886AFC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_21C87C524(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      ++v4;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21C87C524(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_21C87C524((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_21C87C358(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_21C886C14(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_21C87C524(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      v4 += 2;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21C87C524(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_21C87C524((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_21C87C358(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_21C886D2C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_21C87C524(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      v4 += 4;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21C87C524(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_21C87C524((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_21C87C358(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_21C886E44(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_21C87C524(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      v4 += 8;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21C87C524(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_21C87C524((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_21C87C358(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

char *sub_21C886F5C(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9])
      memmove(v14, v15, 8 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_21C887050(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 29;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 2);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[4 * v9])
      memmove(v14, v15, 4 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 4 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_21C887144(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  int64_t v13;
  char *v14;
  char *v15;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 31;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = v13 & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[2 * v9])
      memmove(v14, v15, 2 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 2 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_21C887234(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v9])
      memmove(v13, v14, v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t getEnumTagSinglePayload for FormatError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FormatError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C8873F4 + 4 * byte_21C888FB5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21C887428 + 4 * byte_21C888FB0[v4]))();
}

uint64_t sub_21C887428(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C887430(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C887438);
  return result;
}

uint64_t sub_21C887444(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C88744CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21C887450(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C887458(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FormatError()
{
  return &type metadata for FormatError;
}

unint64_t sub_21C887478()
{
  unint64_t result;

  result = qword_2552C4C40;
  if (!qword_2552C4C40)
  {
    result = MEMORY[0x220783F28](&unk_21C889010, &type metadata for FormatError);
    atomic_store(result, (unint64_t *)&qword_2552C4C40);
  }
  return result;
}

void sub_21C8874BC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21C887500()
{
  unint64_t v0;
  uint64_t v1;

  if (BYTE6(v0) != 16)
  {
    __break(1u);
    JUMPOUT(0x21C8876E0);
  }
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C88805C();
  sub_21C888098();
  return sub_21C87C464(v1, v0);
}

void SRStreamBlock.__allocating_init(binaryRep:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  SRStreamBlock.init(binaryRep:)(a1, a2);
}

void SRStreamBlock.init(binaryRep:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_21C8880E0();
  MEMORY[0x24BDAC7A8](v3);
  v4 = type metadata accessor for StreamBlock(0);
  MEMORY[0x24BDAC7A8](v4);
  __asm { BR              X9 }
}

id sub_21C8877E4()
{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v26;

  if (BYTE6(v1) <= 3uLL)
    goto LABEL_19;
  if (!v4)
  {
    v11 = BYTE6(v1);
    v12 = v0;
    v10 = v2;
    goto LABEL_13;
  }
  if (v4 != 1)
  {
    v13 = *(_QWORD *)(v2 + 16);
    v14 = v0;
    swift_retain();
    swift_retain();
    v15 = sub_21C888008();
    if (!v15)
    {
LABEL_32:
      sub_21C888014();
      __break(1u);
      goto LABEL_33;
    }
    v16 = v15;
    v17 = sub_21C888020();
    v18 = __OFSUB__(v13, v17);
    v19 = v13 - v17;
    if (!v18)
    {
      sub_21C888014();
      v10 = *(_DWORD *)(v16 + v19);
      swift_release();
      swift_release();
      v21 = *(_QWORD *)(v2 + 16);
      v20 = *(_QWORD *)(v2 + 24);
      v11 = v20 - v21;
      if (!__OFSUB__(v20, v21))
        goto LABEL_13;
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  if ((int)v2 > v2 >> 32)
  {
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v6 = v0;
  v7 = sub_21C888008();
  if (!v7)
  {
LABEL_33:
    sub_21C888014();
    __break(1u);
    goto LABEL_34;
  }
  v8 = v7;
  v9 = sub_21C888020();
  *(_QWORD *)(v5 - 160) = (int)v2 - v9;
  if (__OFSUB__((int)v2, v9))
    goto LABEL_29;
  sub_21C888014();
  if (__OFSUB__(HIDWORD(v2), (_DWORD)v2))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v10 = *(_DWORD *)(v8 + *(_QWORD *)(v5 - 160));
  v11 = HIDWORD(v2) - (int)v2;
LABEL_13:
  if (v10 >= 0xFFFFFFFC)
  {
    __break(1u);
    JUMPOUT(0x21C887A50);
  }
  if (v11 == v10 + 4)
  {
    if (v4)
    {
      if (v4 == 1)
      {
        v22 = (int)v2;
        v23 = v2 >> 32;
      }
      else
      {
        v22 = *(_QWORD *)(v2 + 16);
        v23 = *(_QWORD *)(v2 + 24);
      }
    }
    else
    {
      v22 = 0;
      v23 = BYTE6(v1);
    }
    if (v23 >= 4 && v23 >= v22)
    {
      sub_21C888038();
      *(_QWORD *)(v5 - 96) = 0;
      *(_OWORD *)(v5 - 128) = 0u;
      *(_OWORD *)(v5 - 112) = 0u;
      sub_21C8880D4();
      sub_21C887CA4();
      sub_21C88817C();
      sub_21C887CEC(v3, (uint64_t)v0 + OBJC_IVAR____TtC16SensorKitSupport13SRStreamBlock_streamBlock);

      v26 = type metadata accessor for SRStreamBlock();
      *(_QWORD *)(v5 - 152) = v0;
      *(_QWORD *)(v5 - 144) = v26;
      v24 = objc_msgSendSuper2((objc_super *)(v5 - 152), sel_init);
      sub_21C87C464(v2, v1);
      return v24;
    }
LABEL_34:
    __break(1u);
    JUMPOUT(0x21C887A80);
  }

LABEL_19:
  sub_21C87C464(v2, v1);
  type metadata accessor for SRStreamBlock();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t type metadata accessor for SRStreamBlock()
{
  uint64_t result;

  result = qword_2552C4C70;
  if (!qword_2552C4C70)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21C887B8C()
{
  uint64_t v0;

  sub_21C87A074();
  v0 = sub_21C888218();
  swift_bridgeObjectRelease();
  return v0;
}

id SRStreamBlock.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SRStreamBlock.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SRStreamBlock.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRStreamBlock();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_21C887CA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2552C4968;
  if (!qword_2552C4968)
  {
    v1 = type metadata accessor for StreamBlock(255);
    result = MEMORY[0x220783F28](&unk_21C888D00, v1);
    atomic_store(result, (unint64_t *)&qword_2552C4968);
  }
  return result;
}

uint64_t sub_21C887CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StreamBlock(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C887D30()
{
  return type metadata accessor for SRStreamBlock();
}

uint64_t sub_21C887D38()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for StreamBlock(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SRStreamBlock()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SRStreamBlock.__allocating_init(binaryRep:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SRStreamBlock.dictionary.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t sub_21C887DD4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for StreamBlock(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C888008()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_21C888014()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_21C888020()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_21C88802C()
{
  return MEMORY[0x24BDCDB50]();
}

uint64_t sub_21C888038()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_21C888044()
{
  return MEMORY[0x24BDCDC88]();
}

uint64_t sub_21C888050()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21C88805C()
{
  return MEMORY[0x24BDCDE70]();
}

uint64_t sub_21C888068()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_21C888074()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_21C888080()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21C88808C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21C888098()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_21C8880A4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21C8880B0()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t sub_21C8880BC()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_21C8880C8()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_21C8880D4()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_21C8880E0()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_21C8880EC()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_21C8880F8()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_21C888104()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_21C888110()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_21C88811C()
{
  return MEMORY[0x24BE5C060]();
}

uint64_t sub_21C888128()
{
  return MEMORY[0x24BE5C0A0]();
}

uint64_t sub_21C888134()
{
  return MEMORY[0x24BE5C0E8]();
}

uint64_t sub_21C888140()
{
  return MEMORY[0x24BE5C100]();
}

uint64_t sub_21C88814C()
{
  return MEMORY[0x24BE5C118]();
}

uint64_t sub_21C888158()
{
  return MEMORY[0x24BE5C128]();
}

uint64_t sub_21C888164()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t sub_21C888170()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_21C88817C()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_21C888188()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_21C888194()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_21C8881A0()
{
  return MEMORY[0x24BE5C270]();
}

uint64_t sub_21C8881AC()
{
  return MEMORY[0x24BE5C298]();
}

uint64_t sub_21C8881B8()
{
  return MEMORY[0x24BE5C2C0]();
}

uint64_t sub_21C8881C4()
{
  return MEMORY[0x24BE5C2D8]();
}

uint64_t sub_21C8881D0()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_21C8881DC()
{
  return MEMORY[0x24BE5C2F0]();
}

uint64_t sub_21C8881E8()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t sub_21C8881F4()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_21C888200()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_21C88820C()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_21C888218()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21C888224()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21C888230()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21C88823C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21C888248()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_21C888254()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21C888260()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21C88826C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21C888278()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21C888284()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21C888290()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21C88829C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21C8882A8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21C8882B4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21C8882C0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21C8882CC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21C8882D8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21C8882E4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21C8882F0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21C8882FC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21C888308()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21C888314()
{
  return MEMORY[0x24BEE4328]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

