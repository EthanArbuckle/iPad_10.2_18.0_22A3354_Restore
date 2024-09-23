id STMGestaltTotalDiskCapacity()
{
  if (STMGestaltTotalDiskCapacity_onceToken[0] != -1)
    dispatch_once(STMGestaltTotalDiskCapacity_onceToken, &__block_literal_global);
  return (id)STMGestaltTotalDiskCapacity_totalDiskCapacity;
}

uint64_t Array<A>.winingIdentifier.getter(uint64_t a1)
{
  uint64_t v1;

  if (!*(_QWORD *)(a1 + 16))
    return 0;
  v1 = *(_QWORD *)(a1 + 32);
  sub_247AB9ECC(v1, *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
  return v1;
}

uint64_t sub_247AB9ECC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

double variable initialization expression of StorageGaugeView._gaugeHeight()
{
  return sub_247AB9F30(&qword_2576DAE68, (uint64_t)&qword_2576DC9A8);
}

double variable initialization expression of StorageGaugeLegendView._spacingX()
{
  return sub_247AB9F30(&qword_2576DAEA8, (uint64_t)&qword_2576DC9E8);
}

double variable initialization expression of StorageGaugeLegendView._spacingY()
{
  return sub_247AB9F30(&qword_2576DAEA0, (uint64_t)&qword_2576DC9E0);
}

double sub_247AB9F30(_QWORD *a1, uint64_t a2)
{
  if (*a1 != -1)
    swift_once();
  return *(double *)a2;
}

id variable initialization expression of FollowupMonitor.controller()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1B3A8]), sel_init);
}

uint64_t variable initialization expression of Volume.otherVolumesInContainer()
{
  return 0;
}

uint64_t _s9StorageUI9TimeStatsV15startMonitoring8Dispatch0gC0VSgvpfi_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_247ACE248();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

void type metadata accessor for URLResourceKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2576DAF10)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2576DAF10);
  }
}

uint64_t sub_247ABA034(uint64_t a1, uint64_t a2)
{
  return sub_247ABA17C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_247ABA040(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_247ACE260();
  *a2 = 0;
  return result;
}

uint64_t sub_247ABA0B4(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_247ACE26C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_247ABA130@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_247ACE278();
  v2 = sub_247ACE254();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_247ABA170(uint64_t a1, uint64_t a2)
{
  return sub_247ABA17C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_247ABA17C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_247ACE278();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_247ABA1B8()
{
  sub_247ACE278();
  sub_247ACE284();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247ABA1F8()
{
  uint64_t v0;

  sub_247ACE278();
  sub_247ACE464();
  sub_247ACE284();
  v0 = sub_247ACE488();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_247ABA268()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_247ACE278();
  v2 = v1;
  if (v0 == sub_247ACE278() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_247ACE440();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_247ABA2F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_247ACE254();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_247ABA334@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_247ACE278();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_247ABA35C()
{
  sub_247ABA434(&qword_2576DAF30, (uint64_t)&unk_247ACEA88);
  sub_247ABA434(&qword_2576DAF38, (uint64_t)&unk_247ACEA28);
  return sub_247ACE41C();
}

uint64_t sub_247ABA3C8()
{
  return sub_247ABA434(&qword_2576DAF18, (uint64_t)&unk_247ACE9EC);
}

uint64_t sub_247ABA3EC()
{
  return sub_247ABA434(&qword_2576DAF20, (uint64_t)&unk_247ACE9C0);
}

uint64_t sub_247ABA410()
{
  return sub_247ABA434(&qword_2576DAF28, (uint64_t)&unk_247ACEA5C);
}

uint64_t sub_247ABA434(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey();
    result = MEMORY[0x24958B524](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247ABA474(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v12 + ((v4 + 16) & ~(unint64_t)v4);
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
    v7 = a2[5];
    *(_QWORD *)(a1 + 32) = a2[4];
    *(_QWORD *)(a1 + 40) = v7;
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    *(_BYTE *)(a1 + 49) = *((_BYTE *)a2 + 49);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    *(_QWORD *)(a1 + 72) = a2[9];
    *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
    v8 = *(int *)(a3 + 24);
    v9 = (uint64_t)a2 + v8;
    v10 = a1 + v8;
    *(_QWORD *)(a1 + 88) = a2[11];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v11 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v10, v9, v11);
  }
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24958B50C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_247ABA5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_247ABA608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v7 = *(int *)(a3 + 24);
  v8 = a2 + v7;
  v9 = a1 + v7;
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v9, v8, v10);
  return a1;
}

uint64_t sub_247ABA6CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_247ABA7D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  v6 = *(int *)(a3 + 24);
  v7 = a2 + v6;
  v8 = a1 + v6;
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, v7, v9);
  return a1;
}

uint64_t sub_247ABA854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v9 = *(int *)(a3 + 24);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_247ABA924()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247ABA930(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_247ABA9B0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247ABA9BC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for StorageGaugeLegendItemView()
{
  uint64_t result;

  result = qword_2576DAFA0;
  if (!qword_2576DAFA0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_247ABAA70()
{
  unint64_t v0;

  sub_247ABAAF0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_247ABAAF0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576DAFB0)
  {
    sub_247ABAB48();
    v0 = sub_247ACDE28();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576DAFB0);
  }
}

unint64_t sub_247ABAB48()
{
  unint64_t result;

  result = qword_2576DAFB8[0];
  if (!qword_2576DAFB8[0])
  {
    result = MEMORY[0x24958B524](MEMORY[0x24BEE50B8], MEMORY[0x24BEE50B0]);
    atomic_store(result, qword_2576DAFB8);
  }
  return result;
}

uint64_t sub_247ABAB8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247ABAB9C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void (*v20)(char *, _QWORD, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char *v29;
  uint64_t KeyPath;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  int v65;
  int v66;
  _DWORD v67[2];
  _DWORD v68[2];
  int v69;
  char v70;
  _DWORD v71[2];
  int v72;
  __int16 v73;
  uint64_t v74;
  unsigned __int8 v75;
  uint64_t v76;
  unsigned __int8 v77;
  uint64_t v78;
  unint64_t v79;
  unsigned __int8 v80;
  unsigned __int8 v81;
  unsigned __int8 v82;
  _BYTE v83[7];
  _BYTE v84[7];
  int v85;
  char v86;
  _BYTE v87[7];
  int v88;
  __int16 v89;
  _OWORD v90[2];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int16 v99;
  char v100;
  _BYTE v101[7];
  char v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  char v109;
  int v110;
  __int16 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char v115;
  _BYTE v116[7];
  uint64_t v117;
  char v118;
  __int16 v119;
  int v120;
  char v121;
  uint64_t v122;
  char v123;
  _BYTE v124[7];
  uint64_t v125;
  char v126;
  _BYTE v127[7];
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  __int16 v131;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DAFF0);
  MEMORY[0x24BDAC7A8]();
  v49 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_247ACE014();
  v5 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[1];
  v9 = a1[2];
  v10 = a1[3];
  v52 = *a1;
  *(_QWORD *)&v53 = v9;
  v11 = a1[4];
  v12 = a1[5];
  v50 = v8;
  v51 = v12;
  v54 = *((unsigned __int8 *)a1 + 48);
  v13 = *((unsigned __int8 *)a1 + 49);
  v14 = a1[7];
  v55 = v11;
  v56 = v14;
  v15 = a1[8];
  v63 = a1[9];
  LODWORD(v14) = *((unsigned __int8 *)a1 + 80);
  v65 = v13;
  v66 = v14;
  swift_retain();
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v64 = sub_247ACDFC0();
  type metadata accessor for StorageGaugeLegendItemView();
  __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  sub_247ACDE1C();
  sub_247ACDE1C();
  sub_247ACE218();
  sub_247ACDE34();
  v59 = v74;
  v60 = v76;
  v57 = v75;
  v58 = v77;
  v61 = v79;
  v62 = v78;
  v81 = v75;
  v80 = v77;
  v82 = 1;
  v103 = v9;
  *((_QWORD *)&v53 + 1) = v10;
  v104 = v10;
  sub_247ABB360();
  swift_bridgeObjectRetain();
  v16 = sub_247ACE05C();
  v45 = v17;
  v46 = v18;
  LOBYTE(v10) = v19 & 1;
  v20 = *(void (**)(char *, _QWORD, uint64_t))(v5 + 104);
  v21 = v5;
  v22 = v48;
  v20(v7, *MEMORY[0x24BDF18C8], v48);
  v23 = sub_247ACDFF0();
  v24 = (uint64_t)v49;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v49, 1, 1, v23);
  sub_247ACDFFC();
  sub_247ABB3A4(v24);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v22);
  v25 = v45;
  v26 = sub_247ACE050();
  v47 = v27;
  LOBYTE(v24) = v28;
  v49 = v29;
  swift_release();
  LOBYTE(v7) = v24 & 1;
  sub_247ABB3E4(v16, v25, v10);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath();
  v72 = v88;
  v73 = v89;
  v71[0] = *(_DWORD *)v87;
  *(_DWORD *)((char *)v71 + 3) = *(_DWORD *)&v87[3];
  v69 = v85;
  v70 = v86;
  *(_DWORD *)((char *)v68 + 3) = *(_DWORD *)&v84[3];
  v68[0] = *(_DWORD *)v84;
  *(_DWORD *)((char *)v67 + 3) = *(_DWORD *)&v83[3];
  v67[0] = *(_DWORD *)v83;
  LODWORD(v48) = v82;
  v31 = v52;
  v32 = v50;
  v33 = v51;
  *(_QWORD *)&v90[0] = v52;
  *((_QWORD *)&v90[0] + 1) = v50;
  v90[1] = v53;
  *(_QWORD *)&v91 = v55;
  *((_QWORD *)&v91 + 1) = v51;
  LOBYTE(v92) = v54;
  BYTE1(v92) = v65;
  WORD3(v92) = v89;
  *(_DWORD *)((char *)&v92 + 2) = v88;
  *((_QWORD *)&v92 + 1) = v56;
  *(_QWORD *)&v93 = v15;
  *((_QWORD *)&v93 + 1) = v63;
  LOBYTE(v94) = v66;
  DWORD1(v94) = *(_DWORD *)&v87[3];
  *(_DWORD *)((char *)&v94 + 1) = *(_DWORD *)v87;
  *((_QWORD *)&v94 + 1) = v51;
  LOBYTE(v95) = v64;
  BYTE7(v95) = v86;
  *(_DWORD *)((char *)&v95 + 3) = v85;
  DWORD1(v96) = *(_DWORD *)&v84[3];
  *(_WORD *)((char *)&v95 + 1) = 256;
  *((_QWORD *)&v95 + 1) = v59;
  LOBYTE(v96) = v57;
  *(_DWORD *)((char *)&v96 + 1) = *(_DWORD *)v84;
  *((_QWORD *)&v96 + 1) = v60;
  LOBYTE(v97) = v58;
  DWORD1(v97) = *(_DWORD *)&v83[3];
  *(_DWORD *)((char *)&v97 + 1) = *(_DWORD *)v83;
  *((_QWORD *)&v97 + 1) = v62;
  v98 = v61;
  v99 = v82;
  v34 = v53;
  v35 = v91;
  *(_OWORD *)a2 = v90[0];
  *(_OWORD *)(a2 + 16) = v34;
  v36 = v92;
  v37 = v94;
  v38 = v95;
  *(_OWORD *)(a2 + 64) = v93;
  *(_OWORD *)(a2 + 80) = v37;
  *(_OWORD *)(a2 + 32) = v35;
  *(_OWORD *)(a2 + 48) = v36;
  v39 = v96;
  v40 = v97;
  v41 = v98;
  *(_WORD *)(a2 + 160) = v99;
  *(_OWORD *)(a2 + 128) = v40;
  *(_OWORD *)(a2 + 144) = v41;
  *(_OWORD *)(a2 + 96) = v38;
  *(_OWORD *)(a2 + 112) = v39;
  v102 = (char)v7;
  v100 = 0;
  *(_DWORD *)(a2 + 185) = *(_DWORD *)v101;
  *(_DWORD *)(a2 + 188) = *(_DWORD *)&v101[3];
  v42 = v47;
  *(_QWORD *)(a2 + 168) = v26;
  *(_QWORD *)(a2 + 176) = v42;
  *(_BYTE *)(a2 + 184) = (_BYTE)v7;
  *(_QWORD *)(a2 + 192) = v49;
  *(_QWORD *)(a2 + 200) = KeyPath;
  *(_QWORD *)(a2 + 208) = 1;
  *(_BYTE *)(a2 + 216) = 0;
  sub_247ABB450((uint64_t)v90);
  sub_247ABB4B8(v26, v42, (char)v7);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_247ABB3E4(v26, v42, (char)v7);
  swift_release();
  swift_bridgeObjectRelease();
  v103 = v31;
  v104 = v32;
  v105 = v53;
  v106 = v55;
  v107 = v33;
  v108 = v54;
  v109 = v65;
  v110 = v72;
  v111 = v73;
  v112 = v56;
  v113 = v15;
  v114 = v63;
  v115 = v66;
  *(_DWORD *)v116 = v71[0];
  *(_DWORD *)&v116[3] = *(_DWORD *)((char *)v71 + 3);
  v117 = v33;
  v118 = v64;
  v119 = 256;
  v121 = v70;
  v120 = v69;
  v122 = v59;
  v123 = v57;
  *(_DWORD *)&v124[3] = *(_DWORD *)((char *)v68 + 3);
  *(_DWORD *)v124 = v68[0];
  v125 = v60;
  v126 = v58;
  *(_DWORD *)v127 = v67[0];
  *(_DWORD *)&v127[3] = *(_DWORD *)((char *)v67 + 3);
  v128 = v62;
  v129 = v61;
  v130 = 0;
  v131 = v48;
  return sub_247ABB4C8((uint64_t)&v103);
}

uint64_t sub_247ABB1A4()
{
  return sub_247ACE08C();
}

double sub_247ABB1BC@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  double result;
  __int128 v13;
  _OWORD v14[12];
  _OWORD v15[2];
  _BYTE v16[224];

  v2 = v1;
  if (qword_2576DAE98 != -1)
    swift_once();
  v4 = qword_2576DC9D8;
  v5 = sub_247ACDF3C();
  sub_247ABAB9C(v2, (uint64_t)v14);
  *(_OWORD *)&v16[167] = v14[10];
  *(_OWORD *)&v16[183] = v14[11];
  *(_OWORD *)&v16[199] = v15[0];
  *(_OWORD *)&v16[208] = *(_OWORD *)((char *)v15 + 9);
  *(_OWORD *)&v16[103] = v14[6];
  *(_OWORD *)&v16[119] = v14[7];
  *(_OWORD *)&v16[135] = v14[8];
  *(_OWORD *)&v16[151] = v14[9];
  *(_OWORD *)&v16[39] = v14[2];
  *(_OWORD *)&v16[55] = v14[3];
  *(_OWORD *)&v16[71] = v14[4];
  *(_OWORD *)&v16[87] = v14[5];
  *(_OWORD *)&v16[7] = v14[0];
  *(_OWORD *)&v16[23] = v14[1];
  v6 = *(_OWORD *)&v16[176];
  *(_OWORD *)(a1 + 177) = *(_OWORD *)&v16[160];
  *(_OWORD *)(a1 + 193) = v6;
  v7 = *(_OWORD *)&v16[208];
  *(_OWORD *)(a1 + 209) = *(_OWORD *)&v16[192];
  *(_OWORD *)(a1 + 225) = v7;
  v8 = *(_OWORD *)&v16[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v16[96];
  *(_OWORD *)(a1 + 129) = v8;
  v9 = *(_OWORD *)&v16[144];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v16[128];
  *(_OWORD *)(a1 + 161) = v9;
  v10 = *(_OWORD *)&v16[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v16[32];
  *(_OWORD *)(a1 + 65) = v10;
  v11 = *(_OWORD *)&v16[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v16[64];
  *(_OWORD *)(a1 + 97) = v11;
  result = *(double *)v16;
  v13 = *(_OWORD *)&v16[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v16;
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 33) = v13;
  return result;
}

unint64_t sub_247ABB360()
{
  unint64_t result;

  result = qword_2576DAFF8;
  if (!qword_2576DAFF8)
  {
    result = MEMORY[0x24958B524](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2576DAFF8);
  }
  return result;
}

uint64_t sub_247ABB3A4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DAFF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247ABB3E4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_247ABB3F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_247ACDF0C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_247ABB424()
{
  return sub_247ACDF18();
}

uint64_t sub_247ABB450(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_247ABB4B8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_247ABB4C8(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

unint64_t sub_247ABB534()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576DB000;
  if (!qword_2576DB000)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB008);
    result = MEMORY[0x24958B524](MEMORY[0x24BDF4498], v1);
    atomic_store(result, (unint64_t *)&qword_2576DB000);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24958B518](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_247ABB5C4()
{
  if (qword_2576DAEC0 != -1)
    swift_once();
  qword_2576DC9A0 = qword_2576DCA00;
  return swift_retain();
}

void sub_247ABB60C()
{
  qword_2576DC9A8 = 0x4035000000000000;
}

void sub_247ABB61C()
{
  qword_2576DC9B0 = 0x3FF0000000000000;
}

void sub_247ABB62C()
{
  qword_2576DC9B8 = 0x4024000000000000;
}

void sub_247ABB63C()
{
  qword_2576DC9C0 = 0x3FF0000000000000;
}

void sub_247ABB64C()
{
  qword_2576DC9C8 = 0x3FF0000000000000;
}

void sub_247ABB65C()
{
  qword_2576DC9D0 = 0x4008000000000000;
}

void sub_247ABB66C()
{
  qword_2576DC9D8 = 0x4010000000000000;
}

void sub_247ABB67C()
{
  qword_2576DC9E0 = 0x4024000000000000;
}

void sub_247ABB68C()
{
  qword_2576DC9E8 = 0x4024000000000000;
}

void sub_247ABB69C()
{
  qword_2576DC9F0 = 0x4020000000000000;
}

uint64_t sub_247ABB6AC()
{
  uint64_t v0;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB010);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_247ACEBF0;
  *(_QWORD *)(v0 + 32) = sub_247ACE0E0();
  *(_QWORD *)(v0 + 40) = sub_247ACE164();
  *(_QWORD *)(v0 + 48) = sub_247ACE17C();
  *(_QWORD *)(v0 + 56) = sub_247ACE140();
  *(_QWORD *)(v0 + 64) = sub_247ACE110();
  *(_QWORD *)(v0 + 72) = sub_247ACE128();
  *(_QWORD *)(v0 + 80) = sub_247ACE0F8();
  *(_QWORD *)(v0 + 88) = sub_247ACE0EC();
  *(_QWORD *)(v0 + 96) = sub_247ACE158();
  *(_QWORD *)(v0 + 104) = sub_247ACE170();
  *(_QWORD *)(v0 + 112) = sub_247ACE11C();
  result = sub_247ACE2C0();
  qword_2576DC9F8 = v0;
  return result;
}

uint64_t sub_247ABB764(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (qword_2576DAEB8 != -1)
    goto LABEL_13;
  while (1)
  {
    v2 = qword_2576DC9F8;
    v3 = *(_QWORD *)(qword_2576DC9F8 + 16);
    if (!v3)
    {
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
    }
    v4 = a1 % v3;
    if (a1 / v3 >= 1)
      break;
    if ((v4 & 0x8000000000000000) != 0)
      goto LABEL_16;
    if (v4 < v3)
      goto LABEL_9;
LABEL_12:
    __break(1u);
LABEL_13:
    swift_once();
  }
  if ((v4 & 0x8000000000000000) != 0)
    goto LABEL_15;
  swift_retain();
  a1 = sub_247ACE0B0();
  swift_release();
  if (a1)
  {
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithCGColor_, a1);
    v9 = 0;
    v10[0] = 0;
    v8 = 0;
    objc_msgSend(v5, sel_getHue_saturation_brightness_alpha_, &v8, &v9, v10, 0);
    v6 = sub_247ACE0D4();

    return v6;
  }
  v2 = qword_2576DC9F8;
  if (v4 >= *(_QWORD *)(qword_2576DC9F8 + 16))
    goto LABEL_12;
LABEL_9:
  v6 = *(_QWORD *)(v2 + 8 * v4 + 32);
  swift_retain();
  return v6;
}

uint64_t sub_247ABB8F8(uint64_t a1)
{
  return sub_247ABB934(a1, (SEL *)&selRef_systemGroupedBackgroundColor, &qword_2576DCA00);
}

uint64_t sub_247ABB90C(uint64_t a1)
{
  return sub_247ABB934(a1, (SEL *)&selRef_opaqueSeparatorColor, &qword_2576DCA08);
}

uint64_t sub_247ABB920(uint64_t a1)
{
  return sub_247ABB934(a1, (SEL *)&selRef_opaqueSeparatorColor, &qword_2576DCA10);
}

uint64_t sub_247ABB934(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v4;
  uint64_t result;

  v4 = objc_msgSend((id)objc_opt_self(), *a2);
  result = MEMORY[0x24958ADD4](v4);
  *a3 = result;
  return result;
}

uint64_t StorageGaugeView.init(capacity:categories:available:onSelect:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD v45[5];
  char v46;

  type metadata accessor for StorageGaugeView();
  if (qword_2576DAE68 != -1)
LABEL_31:
    swift_once();
  *(_QWORD *)&v45[0] = qword_2576DC9A8;
  sub_247ABAB48();
  sub_247ACDE10();
  *a6 = a1;
  a6[2] = a4;
  a6[3] = a5;
  *(_QWORD *)&v45[0] = a2;
  sub_247ABD53C(a4);
  swift_bridgeObjectRetain();
  sub_247ABD4D4((uint64_t *)v45);
  swift_bridgeObjectRelease();
  a2 = *(_QWORD *)&v45[0];
  v14 = swift_bridgeObjectRetain();
  v15 = (_QWORD *)sub_247ABCDA8(v14);
  swift_release_n();
  v17 = v15[2];
  if (v17)
  {
    v18 = 0;
    v19 = v15 + 8;
    do
    {
      v20 = *v19;
      v19 += 11;
      v21 = __OFADD__(v18, v20);
      v18 += v20;
      if (v21)
      {
        __break(1u);
        goto LABEL_31;
      }
      --v17;
    }
    while (v17);
    v22 = v18 + a3;
    if (!__OFADD__(v18, a3))
      goto LABEL_7;
    __break(1u);
LABEL_18:
    v28 = 0;
    goto LABEL_20;
  }
  v18 = 0;
  v22 = a3;
LABEL_7:
  v6 = a1 - v22;
  if (__OFSUB__(a1, v22))
  {
    __break(1u);
    goto LABEL_33;
  }
  v16 = 0x2576DA000uLL;
  if (!v6)
    goto LABEL_18;
  v43 = a3;
  if (qword_2576DAEE0 != -1)
    swift_once();
  v23 = sub_247ACDDB0();
  __swift_project_value_buffer(v23, (uint64_t)qword_2576DCA30);
  v24 = sub_247ACDD98();
  v25 = sub_247ACE32C();
  if (os_log_type_enabled(v24, v25))
  {
    v42 = a4;
    v26 = swift_slowAlloc();
    *(_DWORD *)v26 = 134218752;
    *(_QWORD *)&v45[0] = v18;
    v7 = (uint64_t)v45 + 8;
    sub_247ACE35C();
    *(_WORD *)(v26 + 12) = 2048;
    *(_QWORD *)&v45[0] = v43;
    sub_247ACE35C();
    *(_WORD *)(v26 + 22) = 2048;
    *(_QWORD *)&v45[0] = a1;
    sub_247ACE35C();
    *(_WORD *)(v26 + 32) = 2048;
    *(_QWORD *)&v45[0] = v6;
    sub_247ACE35C();
    _os_log_impl(&dword_247AB7000, v24, v25, "Sum of all categories and available space doe not match capacity of the volume, the proportions of the gauge will be adjusted. Sum of categories: %lld, available: %lld, capacity: %lld. Difference is %lld", (uint8_t *)v26, 0x2Au);
    v27 = v26;
    a4 = v42;
    MEMORY[0x24958B5A8](v27, -1, -1);
  }

  a3 = a1 - v18;
  if (__OFSUB__(a1, v18))
  {
    __break(1u);
LABEL_36:
    swift_once();
    goto LABEL_23;
  }
  if (v6 < 0)
  {
    v28 = -v6;
    v16 = 0x2576DA000uLL;
    if (__OFSUB__(0, v6))
    {
      __break(1u);
      result = swift_release();
      __break(1u);
      return result;
    }
  }
  else
  {
    v28 = v6;
    v16 = 0x2576DA000;
  }
LABEL_20:
  v7 = a1 / 999;
  v18 = a1 / 999 - v28;
  if (__OFSUB__(a1 / 999, v28))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v18 < 1)
    goto LABEL_26;
  if (*(_QWORD *)(v16 + 3808) != -1)
    goto LABEL_36;
LABEL_23:
  v29 = sub_247ACDDB0();
  __swift_project_value_buffer(v29, (uint64_t)qword_2576DCA30);
  v30 = sub_247ACDD98();
  v31 = sub_247ACE32C();
  if (os_log_type_enabled(v30, v31))
  {
    v44 = a3;
    v32 = swift_slowAlloc();
    *(_DWORD *)v32 = 134218240;
    *(_QWORD *)&v45[0] = v6;
    sub_247ACE35C();
    *(_WORD *)(v32 + 12) = 2048;
    *(_QWORD *)&v45[0] = v7;
    sub_247ACE35C();
    _os_log_impl(&dword_247AB7000, v30, v31, "As the diff %lld is superior to the threshold (%lld), the available space will not be displayed in the gauge to prevent displaying a wrong value", (uint8_t *)v32, 0x16u);
    v33 = v32;
    a3 = v44;
    MEMORY[0x24958B5A8](v33, -1, -1);
  }

LABEL_26:
  sub_247AC2D9C(a3, v18 > 0, (uint64_t)v45);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
LABEL_34:
    v15 = sub_247ABD0CC(0, v15[2] + 1, 1, v15);
  v35 = v15[2];
  v34 = v15[3];
  if (v35 >= v34 >> 1)
    v15 = sub_247ABD0CC((_QWORD *)(v34 > 1), v35 + 1, 1, v15);
  v15[2] = v35 + 1;
  v36 = &v15[11 * v35];
  v37 = v45[1];
  *((_OWORD *)v36 + 2) = v45[0];
  *((_OWORD *)v36 + 3) = v37;
  v38 = v45[2];
  v39 = v45[3];
  v40 = v45[4];
  *((_BYTE *)v36 + 112) = v46;
  *((_OWORD *)v36 + 5) = v39;
  *((_OWORD *)v36 + 6) = v40;
  *((_OWORD *)v36 + 4) = v38;
  result = sub_247ABE10C(a4);
  a6[1] = v15;
  a6[4] = a3;
  return result;
}

uint64_t type metadata accessor for StorageGaugeView()
{
  uint64_t result;

  result = qword_2576DB070;
  if (!qword_2576DB070)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t property wrapper backing initializer of StorageGaugeView.gaugeHeight()
{
  sub_247ABAB48();
  return sub_247ACDE10();
}

double StorageGaugeView.body.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  double result;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  __int128 v17;

  v3 = *(_QWORD *)(type metadata accessor for StorageGaugeView() - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247ABEE38(v1, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for StorageGaugeView);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  sub_247ABEFB0((uint64_t)v5, v7 + v6, (uint64_t (*)(_QWORD))type metadata accessor for StorageGaugeView);
  __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  sub_247ACDE1C();
  sub_247ACE218();
  sub_247ACDE34();
  v8 = v13;
  v9 = v14;
  v10 = v15;
  v11 = v16;
  *(_QWORD *)a1 = sub_247ABE120;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  *(_BYTE *)(a1 + 40) = v11;
  result = *(double *)&v17;
  *(_OWORD *)(a1 + 48) = v17;
  return result;
}

uint64_t sub_247ABC004@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v15;
  char *v16;
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
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  uint64_t (*v45)(void);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(void);
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(void);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t (*v80)(void);
  _QWORD v82[3];
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
  char *v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;

  v88 = a1;
  v98 = a3;
  v101 = sub_247ACDEE8();
  MEMORY[0x24BDAC7A8](v101);
  v99 = (_QWORD *)((char *)v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v89 = sub_247ACDEDC();
  MEMORY[0x24BDAC7A8](v89);
  v91 = (uint64_t)v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB0E8);
  MEMORY[0x24BDAC7A8](v6);
  v95 = (char *)v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB0F0);
  MEMORY[0x24BDAC7A8](v92);
  v96 = (uint64_t)v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB0F8);
  MEMORY[0x24BDAC7A8](v93);
  v97 = (char *)v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_247ACDE4C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v85 = v12;
  v13 = (char *)v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for StorageGaugeView();
  v84 = *(_QWORD *)(v14 - 8);
  v15 = *(_QWORD *)(v84 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB100);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB108);
  MEMORY[0x24BDAC7A8](v86);
  v21 = (char *)v82 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB110);
  MEMORY[0x24BDAC7A8](v87);
  v100 = (uint64_t)v82 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB118);
  MEMORY[0x24BDAC7A8](v90);
  v94 = (char *)v82 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576DAE70 != -1)
    swift_once();
  v24 = qword_2576DC9B0;
  *(_QWORD *)v19 = sub_247ACDF3C();
  *((_QWORD *)v19 + 1) = v24;
  v19[16] = 0;
  v82[2] = &v19[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576DB120) + 44)];
  v25 = swift_bridgeObjectRetain();
  v26 = sub_247AC67A8(v25);
  v83 = a2;
  v27 = v26;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v102 = v27;
  v82[1] = swift_getKeyPath();
  sub_247ABEE38(a2, (uint64_t)v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for StorageGaugeView);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v88, v10);
  v28 = (*(unsigned __int8 *)(v84 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80);
  v29 = (v15 + *(unsigned __int8 *)(v11 + 80) + v28) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v30 = swift_allocObject();
  sub_247ABEFB0((uint64_t)v16, v30 + v28, (uint64_t (*)(_QWORD))type metadata accessor for StorageGaugeView);
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v30 + v29, v13, v10);
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = sub_247ABEC08;
  *(_QWORD *)(v31 + 24) = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB130);
  sub_247ABED08(&qword_2576DB138, &qword_2576DB128, MEMORY[0x24BEE12D8]);
  sub_247ABED48();
  sub_247ABED8C();
  sub_247ACE20C();
  if (qword_2576DAE60 != -1)
    swift_once();
  v32 = qword_2576DC9A0;
  swift_retain();
  v33 = sub_247ACDFC0();
  sub_247ABEEB8((uint64_t)v19, (uint64_t)v21, &qword_2576DB100);
  v34 = &v21[*(int *)(v86 + 36)];
  *(_QWORD *)v34 = v32;
  v34[8] = v33;
  sub_247ABEEFC((uint64_t)v19, &qword_2576DB100);
  v35 = sub_247ACE224();
  v36 = *(_QWORD *)(v83 + 8);
  v37 = v100;
  sub_247ABEEB8((uint64_t)v21, v100, &qword_2576DB108);
  v38 = (uint64_t *)(v37 + *(int *)(v87 + 36));
  *v38 = v35;
  v38[1] = v36;
  swift_bridgeObjectRetain();
  sub_247ABEEFC((uint64_t)v21, &qword_2576DB108);
  if (qword_2576DAE90 != -1)
    swift_once();
  v39 = qword_2576DC9D0;
  v40 = v99;
  v41 = (char *)v99 + *(int *)(v101 + 20);
  v42 = *MEMORY[0x24BDEEB68];
  v43 = sub_247ACDF54();
  v44 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 104);
  v44(v41, v42, v43);
  *v40 = v39;
  v40[1] = v39;
  v45 = MEMORY[0x24BDED998];
  v46 = v91;
  sub_247ABEE38((uint64_t)v40, v91, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_QWORD *)(v46 + *(int *)(v89 + 20)) = 0xBFF0000000000000;
  sub_247ABEE7C((uint64_t)v40, (uint64_t (*)(_QWORD))v45);
  v47 = (uint64_t)v95;
  if (qword_2576DAEC0 != -1)
    swift_once();
  v48 = sub_247ACE188();
  sub_247ACDE04();
  v49 = MEMORY[0x24BDED970];
  sub_247ABEE38(v46, v47, (uint64_t (*)(_QWORD))MEMORY[0x24BDED970]);
  v50 = v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576DB158) + 36);
  v51 = v103;
  *(_OWORD *)v50 = v102;
  *(_OWORD *)(v50 + 16) = v51;
  *(_QWORD *)(v50 + 32) = v104;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB160);
  *(_QWORD *)(v47 + *(int *)(v52 + 52)) = v48;
  *(_WORD *)(v47 + *(int *)(v52 + 56)) = 256;
  v53 = sub_247ACE218();
  v55 = v54;
  v56 = (uint64_t *)(v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576DB168) + 36));
  *v56 = v53;
  v56[1] = v55;
  sub_247ABEE7C(v46, (uint64_t (*)(_QWORD))v49);
  if (qword_2576DAEC8 != -1)
    swift_once();
  v57 = qword_2576DCA08;
  if (qword_2576DAE80 != -1)
    swift_once();
  v58 = qword_2576DC9C0;
  if (qword_2576DAE88 != -1)
    swift_once();
  v59 = qword_2576DC9C8;
  v60 = v96;
  sub_247ABEEB8(v47, v96, &qword_2576DB0E8);
  v61 = (uint64_t *)(v60 + *(int *)(v92 + 36));
  *v61 = v57;
  v61[1] = v58;
  v61[2] = v59;
  v61[3] = v59;
  swift_retain();
  sub_247ABEEFC(v47, &qword_2576DB0E8);
  v62 = qword_2576DC9D0;
  v63 = v99;
  v44((char *)v99 + *(int *)(v101 + 20), v42, v43);
  *v63 = v62;
  v63[1] = v62;
  v64 = (uint64_t)v97;
  v65 = (uint64_t)&v97[*(int *)(v93 + 36)];
  v66 = MEMORY[0x24BDED998];
  sub_247ABEE38((uint64_t)v63, v65, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  v95 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_2576DB170);
  *(_WORD *)(v65 + *((int *)v95 + 9)) = 256;
  sub_247ABEEB8(v60, v64, &qword_2576DB0F0);
  sub_247ABEE7C((uint64_t)v63, (uint64_t (*)(_QWORD))v66);
  sub_247ABEEFC(v60, &qword_2576DB0F0);
  v67 = sub_247ACE218();
  v69 = v68;
  v70 = v44;
  v71 = v43;
  v72 = (uint64_t)v94;
  v73 = (uint64_t)&v94[*(int *)(v90 + 36)];
  sub_247ABEEB8(v64, v73, &qword_2576DB0F8);
  v74 = (uint64_t *)(v73 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576DB178) + 36));
  *v74 = v67;
  v74[1] = v69;
  v75 = v100;
  sub_247ABEEB8(v100, v72, &qword_2576DB110);
  sub_247ABEEFC(v64, &qword_2576DB0F8);
  sub_247ABEEFC(v75, &qword_2576DB110);
  v76 = qword_2576DC9D0;
  v70((char *)v63 + *(int *)(v101 + 20), v42, v71);
  *v63 = v76;
  v63[1] = v76;
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB180);
  v78 = v98;
  v79 = v98 + *(int *)(v77 + 36);
  v80 = MEMORY[0x24BDED998];
  sub_247ABEE38((uint64_t)v63, v79, (uint64_t (*)(_QWORD))MEMORY[0x24BDED998]);
  *(_WORD *)(v79 + *((int *)v95 + 9)) = 256;
  sub_247ABEEB8(v72, v78, &qword_2576DB118);
  sub_247ABEE7C((uint64_t)v63, (uint64_t (*)(_QWORD))v80);
  return sub_247ABEEFC(v72, &qword_2576DB118);
}

uint64_t sub_247ABC9E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  float v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _BYTE v26[16];
  uint64_t v27;
  uint64_t v28;

  v8 = type metadata accessor for StorageGaugeItemView();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v14 = &v26[-v13];
  v15 = (float)*(uint64_t *)(a2 + 32) / (float)*a3;
  if (v15 <= 0.001)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a4, 1, 1, v8);
  sub_247ABEF38(a2);
  sub_247ACDE40();
  v17 = v16;
  if (qword_2576DAE70 != -1)
    swift_once();
  if (*(double *)&qword_2576DC9B0 > v17 * v15 - *(double *)&qword_2576DC9B0)
    v18 = *(double *)&qword_2576DC9B0;
  else
    v18 = v17 * v15 - *(double *)&qword_2576DC9B0;
  v19 = a3[2];
  v20 = a3[3];
  *(_QWORD *)&v12[*(int *)(v8 + 36)] = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB188);
  swift_storeEnumTagMultiPayload();
  sub_247ABD53C(v19);
  if (qword_2576DAE68 != -1)
    swift_once();
  v21 = qword_2576DC9A8;
  v22 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v12 + 2) = *(_OWORD *)(a2 + 32);
  *((_OWORD *)v12 + 3) = v22;
  *((_OWORD *)v12 + 4) = *(_OWORD *)(a2 + 64);
  v12[80] = *(_BYTE *)(a2 + 80);
  v23 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v12 = *(_OWORD *)a2;
  *((_OWORD *)v12 + 1) = v23;
  *((_QWORD *)v12 + 11) = a1;
  *((double *)v12 + 12) = v18;
  *((_QWORD *)v12 + 13) = v19;
  *((_QWORD *)v12 + 14) = v20;
  v26[15] = 0;
  sub_247ACE194();
  v24 = v28;
  v12[120] = v27;
  *((_QWORD *)v12 + 16) = v24;
  v27 = v21;
  sub_247ABAB48();
  sub_247ACDE10();
  sub_247ABEFB0((uint64_t)v12, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for StorageGaugeItemView);
  sub_247ABEFB0((uint64_t)v14, a4, (uint64_t (*)(_QWORD))type metadata accessor for StorageGaugeItemView);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a4, 0, 1, v8);
}

double sub_247ABCC78@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  double result;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  __int128 v18;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247ABEE38(v2, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for StorageGaugeView);
  v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v8 = swift_allocObject();
  sub_247ABEFB0((uint64_t)v6, v8 + v7, (uint64_t (*)(_QWORD))type metadata accessor for StorageGaugeView);
  __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  sub_247ACDE1C();
  sub_247ACE218();
  sub_247ACDE34();
  v9 = v14;
  v10 = v15;
  v11 = v16;
  v12 = v17;
  *(_QWORD *)a2 = sub_247ABE120;
  *(_QWORD *)(a2 + 8) = v8;
  *(_QWORD *)(a2 + 16) = v9;
  *(_BYTE *)(a2 + 24) = v10;
  *(_QWORD *)(a2 + 32) = v11;
  *(_BYTE *)(a2 + 40) = v12;
  result = *(double *)&v18;
  *(_OWORD *)(a2 + 48) = v18;
  return result;
}

uint64_t sub_247ABCDA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = MEMORY[0x24BEE4AF8];
  sub_247AC9A44(0, 0, 0);
  v2 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v17 = v2;
  if (v2)
  {
    v3 = 0;
    v4 = (uint64_t *)(a1 + 56);
    do
    {
      v5 = *(v4 - 2);
      v6 = *v4;
      v23 = *(v4 - 1);
      v24 = *(v4 - 3);
      v22 = v4[1];
      v7 = *((_BYTE *)v4 + 24);
      v19 = *((_BYTE *)v4 + 25);
      v18 = v4[4];
      v8 = v4[5];
      v9 = v4[6];
      v21 = *((_BYTE *)v4 + 56);
      if (v9)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        swift_retain();
        v10 = v9;
        v20 = v7;
        if ((v7 & 1) != 0)
          goto LABEL_5;
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        v10 = sub_247ABB764(v3);
        v20 = v7;
        if ((v7 & 1) != 0)
        {
LABEL_5:
          v11 = qword_2576DAEC0;
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if (v11 != -1)
            swift_once();
          v12 = qword_2576DCA00;
          swift_retain();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_10;
        }
      }
      swift_retain();
      swift_retain();
      swift_release();
      swift_release();
      v12 = v10;
LABEL_10:
      v14 = *(_QWORD *)(v25 + 16);
      v13 = *(_QWORD *)(v25 + 24);
      if (v14 >= v13 >> 1)
        sub_247AC9A44(v13 > 1, v14 + 1, 1);
      ++v3;
      *(_QWORD *)(v25 + 16) = v14 + 1;
      v15 = v25 + 88 * v14;
      *(_QWORD *)(v15 + 32) = v24;
      *(_QWORD *)(v15 + 40) = v5;
      *(_QWORD *)(v15 + 48) = v23;
      *(_QWORD *)(v15 + 56) = v6;
      *(_QWORD *)(v15 + 64) = v22;
      *(_QWORD *)(v15 + 72) = v12;
      *(_BYTE *)(v15 + 80) = v20;
      *(_BYTE *)(v15 + 81) = v19;
      *(_QWORD *)(v15 + 88) = v18;
      *(_QWORD *)(v15 + 96) = v8;
      *(_QWORD *)(v15 + 104) = v10;
      v4 += 11;
      *(_BYTE *)(v15 + 112) = v21;
    }
    while (v17 != v3);
  }
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_247ABD00C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_247ACDDEC();
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_247ACDF00();
}

uint64_t sub_247ABD088(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_247ABD098(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_QWORD *sub_247ABD0CC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB190);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 88);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[11 * v8 + 4])
          memmove(v12, a4 + 4, 88 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_247ABE76C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_247ABD1F0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB0D8);
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
    sub_247ABE944(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_247ABD2FC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB0E0);
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
    sub_247ABE85C(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_247ABD408@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

void *sub_247ABD430(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_247ACE410();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

_BYTE **sub_247ABD4C4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_247ABD4D4(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_247AC2300(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_247ABD564(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_247ABD53C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_247ABD564(uint64_t *a1)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  int v21;
  _QWORD *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
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
  _BOOL4 v41;
  _OWORD *v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  BOOL v80;
  uint64_t v81;
  char v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  BOOL v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  unint64_t v104;
  char *v105;
  char *v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  uint64_t v122;
  uint64_t v123;
  char v124;
  char v125;
  __int128 v126;
  __int128 v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;

  v3 = a1[1];
  result = sub_247ACE428();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_138;
    if (v3)
      return sub_247ABDD2C(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_146;
  v119 = result;
  v130 = v1;
  v116 = a1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    v128 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_104:
      v106 = v11;
      v118 = v8;
      if (v12 >= 2)
      {
        v107 = *v116;
        do
        {
          v108 = v12 - 2;
          if (v12 < 2)
            goto LABEL_133;
          if (!v107)
            goto LABEL_145;
          v109 = v106;
          v110 = *(_QWORD *)&v106[16 * v108 + 32];
          v111 = *(_QWORD *)&v106[16 * v12 + 24];
          sub_247ABDE18((char *)(v107 + 88 * v110), (char *)(v107 + 88 * *(_QWORD *)&v106[16 * v12 + 16]), v107 + 88 * v111, v128);
          if (v130)
            break;
          if (v111 < v110)
            goto LABEL_134;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v109 = sub_247AC1D50((uint64_t)v109);
          if (v108 >= *((_QWORD *)v109 + 2))
            goto LABEL_135;
          v112 = &v109[16 * v108 + 32];
          *(_QWORD *)v112 = v110;
          *((_QWORD *)v112 + 1) = v111;
          v113 = *((_QWORD *)v109 + 2);
          if (v12 > v113)
            goto LABEL_136;
          memmove(&v109[16 * v12 + 16], &v109[16 * v12 + 32], 16 * (v113 - v12));
          v106 = v109;
          *((_QWORD *)v109 + 2) = v113 - 1;
          v12 = v113 - 1;
        }
        while (v113 > 2);
      }
LABEL_101:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v118 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v118 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_247ACE2D8();
    *(_QWORD *)(v7 + 16) = v6;
    v118 = v7;
    v128 = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *a1;
  v117 = *a1 + 232;
  v115 = *a1 - 88;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v120 = v3;
  v129 = *a1;
  while (1)
  {
    v13 = v9++;
    if (v9 < v3)
    {
      v14 = v10 + 88 * v9;
      v15 = *(_QWORD *)(v14 + 32);
      v16 = *(_QWORD *)(v14 + 56);
      v17 = v10 + 88 * v13;
      v18 = *(_QWORD *)(v17 + 32);
      v19 = *(_QWORD *)(v17 + 56);
      v20 = v18 < v15;
      if (v16 == v19)
        v21 = v20;
      else
        v21 = v19 < v16;
      v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        v22 = (_QWORD *)(v117 + 88 * v13);
        while (1)
        {
          v23 = *(v22 - 11);
          v24 = *(v22 - 14) < *(v22 - 3);
          if (*v22 != v23)
            v24 = v23 < *v22;
          if (v21 != v24)
            break;
          v22 += 11;
          if (v3 == ++v9)
          {
            v9 = v3;
            break;
          }
        }
      }
      if (v21)
      {
        if (v9 < v13)
          goto LABEL_139;
        if (v13 < v9)
        {
          v25 = 88 * v9;
          v26 = v9;
          v27 = v13;
          v114 = v13;
          v28 = 88 * v13;
          do
          {
            if (v27 != --v26)
            {
              if (!v10)
                goto LABEL_144;
              v29 = v11;
              v30 = v10 + v25;
              v126 = *(_OWORD *)(v10 + v28 + 16);
              v127 = *(_OWORD *)(v10 + v28);
              v31 = *(_QWORD *)(v10 + v28 + 32);
              v32 = *(_QWORD *)(v10 + v28 + 40);
              v124 = *(_BYTE *)(v10 + v28 + 49);
              v125 = *(_BYTE *)(v10 + v28 + 48);
              v33 = *(_QWORD *)(v10 + v28 + 64);
              v122 = *(_QWORD *)(v10 + v28 + 72);
              v123 = *(_QWORD *)(v10 + v28 + 56);
              v121 = *(_BYTE *)(v10 + v28 + 80);
              memmove((void *)(v10 + v28), (const void *)(v10 + v25 - 88), 0x58uLL);
              v10 = v129;
              *(_OWORD *)(v30 - 88) = v127;
              *(_OWORD *)(v30 - 72) = v126;
              *(_QWORD *)(v30 - 56) = v31;
              *(_QWORD *)(v30 - 48) = v32;
              *(_BYTE *)(v30 - 40) = v125;
              *(_BYTE *)(v30 - 39) = v124;
              *(_QWORD *)(v30 - 32) = v123;
              *(_QWORD *)(v30 - 24) = v33;
              *(_QWORD *)(v30 - 16) = v122;
              *(_BYTE *)(v30 - 8) = v121;
              v11 = v29;
            }
            ++v27;
            v25 -= 88;
            v28 += 88;
          }
          while (v27 < v26);
          v3 = v120;
          v13 = v114;
        }
      }
    }
    if (v9 >= v3)
      goto LABEL_54;
    if (__OFSUB__(v9, v13))
      goto LABEL_137;
    if (v9 - v13 >= v119)
      goto LABEL_54;
    v34 = v13 + v119;
    if (__OFADD__(v13, v119))
      goto LABEL_140;
    if (v34 >= v3)
      v34 = v3;
    if (v34 < v13)
      break;
    if (v9 != v34)
    {
      v35 = v115 + 88 * v9;
      do
      {
        v36 = v13;
        v37 = v35;
        do
        {
          v38 = *(_QWORD *)(v37 + 120);
          v39 = *(_QWORD *)(v37 + 144);
          v40 = *(_QWORD *)(v37 + 56);
          v41 = *(_QWORD *)(v37 + 32) < v38;
          if (v39 != v40)
            v41 = v40 < v39;
          if (!v41)
            break;
          if (!v10)
            goto LABEL_142;
          v42 = (_OWORD *)(v37 + 88);
          v43 = *(_OWORD *)(v37 + 88);
          v44 = *(_QWORD *)(v37 + 104);
          v45 = *(_QWORD *)(v37 + 112);
          v46 = *(_QWORD *)(v37 + 128);
          v47 = *(_BYTE *)(v37 + 136);
          v48 = *(_BYTE *)(v37 + 137);
          v49 = *(_QWORD *)(v37 + 152);
          v50 = *(_QWORD *)(v37 + 160);
          v51 = *(_OWORD *)(v37 + 48);
          *(_OWORD *)(v37 + 120) = *(_OWORD *)(v37 + 32);
          *(_OWORD *)(v37 + 136) = v51;
          *(_OWORD *)(v37 + 152) = *(_OWORD *)(v37 + 64);
          v52 = *(_OWORD *)v37;
          v53 = *(_OWORD *)(v37 + 16);
          *(_OWORD *)v37 = v43;
          v54 = *(_BYTE *)(v37 + 168);
          *(_QWORD *)(v37 + 168) = *(_QWORD *)(v37 + 80);
          *(_QWORD *)(v37 + 16) = v44;
          *(_QWORD *)(v37 + 24) = v45;
          *(_QWORD *)(v37 + 32) = v38;
          *(_QWORD *)(v37 + 40) = v46;
          *(_BYTE *)(v37 + 48) = v47;
          *(_BYTE *)(v37 + 49) = v48;
          *(_QWORD *)(v37 + 56) = v39;
          *(_QWORD *)(v37 + 64) = v49;
          *(_QWORD *)(v37 + 72) = v50;
          *(_BYTE *)(v37 + 80) = v54;
          v37 -= 88;
          ++v36;
          *v42 = v52;
          v42[1] = v53;
        }
        while (v9 != v36);
        ++v9;
        v35 += 88;
      }
      while (v9 != v34);
      v9 = v34;
    }
LABEL_54:
    if (v9 < v13)
      goto LABEL_132;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_247AC1A4C(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v56 = *((_QWORD *)v11 + 2);
    v55 = *((_QWORD *)v11 + 3);
    v12 = v56 + 1;
    v10 = v129;
    if (v56 >= v55 >> 1)
    {
      v105 = sub_247AC1A4C((char *)(v55 > 1), v56 + 1, 1, v11);
      v10 = v129;
      v11 = v105;
    }
    *((_QWORD *)v11 + 2) = v12;
    v57 = v11 + 32;
    v58 = &v11[16 * v56 + 32];
    *(_QWORD *)v58 = v13;
    *((_QWORD *)v58 + 1) = v9;
    if (v56)
    {
      while (1)
      {
        v59 = v12 - 1;
        if (v12 >= 4)
        {
          v64 = &v57[16 * v12];
          v65 = *((_QWORD *)v64 - 8);
          v66 = *((_QWORD *)v64 - 7);
          v70 = __OFSUB__(v66, v65);
          v67 = v66 - v65;
          if (v70)
            goto LABEL_121;
          v69 = *((_QWORD *)v64 - 6);
          v68 = *((_QWORD *)v64 - 5);
          v70 = __OFSUB__(v68, v69);
          v62 = v68 - v69;
          v63 = v70;
          if (v70)
            goto LABEL_122;
          v71 = v12 - 2;
          v72 = &v57[16 * v12 - 32];
          v74 = *(_QWORD *)v72;
          v73 = *((_QWORD *)v72 + 1);
          v70 = __OFSUB__(v73, v74);
          v75 = v73 - v74;
          if (v70)
            goto LABEL_124;
          v70 = __OFADD__(v62, v75);
          v76 = v62 + v75;
          if (v70)
            goto LABEL_127;
          if (v76 >= v67)
          {
            v94 = &v57[16 * v59];
            v96 = *(_QWORD *)v94;
            v95 = *((_QWORD *)v94 + 1);
            v70 = __OFSUB__(v95, v96);
            v97 = v95 - v96;
            if (v70)
              goto LABEL_131;
            v87 = v62 < v97;
            goto LABEL_91;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v88 = *((_QWORD *)v11 + 4);
            v89 = *((_QWORD *)v11 + 5);
            v70 = __OFSUB__(v89, v88);
            v81 = v89 - v88;
            v82 = v70;
            goto LABEL_85;
          }
          v61 = *((_QWORD *)v11 + 4);
          v60 = *((_QWORD *)v11 + 5);
          v70 = __OFSUB__(v60, v61);
          v62 = v60 - v61;
          v63 = v70;
        }
        if ((v63 & 1) != 0)
          goto LABEL_123;
        v71 = v12 - 2;
        v77 = &v57[16 * v12 - 32];
        v79 = *(_QWORD *)v77;
        v78 = *((_QWORD *)v77 + 1);
        v80 = __OFSUB__(v78, v79);
        v81 = v78 - v79;
        v82 = v80;
        if (v80)
          goto LABEL_126;
        v83 = &v57[16 * v59];
        v85 = *(_QWORD *)v83;
        v84 = *((_QWORD *)v83 + 1);
        v70 = __OFSUB__(v84, v85);
        v86 = v84 - v85;
        if (v70)
          goto LABEL_129;
        if (__OFADD__(v81, v86))
          goto LABEL_130;
        if (v81 + v86 >= v62)
        {
          v87 = v62 < v86;
LABEL_91:
          if (v87)
            v59 = v71;
          goto LABEL_93;
        }
LABEL_85:
        if ((v82 & 1) != 0)
          goto LABEL_125;
        v90 = &v57[16 * v59];
        v92 = *(_QWORD *)v90;
        v91 = *((_QWORD *)v90 + 1);
        v70 = __OFSUB__(v91, v92);
        v93 = v91 - v92;
        if (v70)
          goto LABEL_128;
        if (v93 < v81)
          goto LABEL_15;
LABEL_93:
        v98 = v59 - 1;
        if (v59 - 1 >= v12)
        {
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
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
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
          goto LABEL_141;
        }
        if (!v10)
          goto LABEL_143;
        v99 = v11;
        v100 = &v57[16 * v98];
        v101 = *(_QWORD *)v100;
        v102 = &v57[16 * v59];
        v103 = *((_QWORD *)v102 + 1);
        sub_247ABDE18((char *)(v10 + 88 * *(_QWORD *)v100), (char *)(v10 + 88 * *(_QWORD *)v102), v10 + 88 * v103, v128);
        if (v130)
          goto LABEL_101;
        if (v103 < v101)
          goto LABEL_118;
        if (v59 > *((_QWORD *)v99 + 2))
          goto LABEL_119;
        *(_QWORD *)v100 = v101;
        *(_QWORD *)&v57[16 * v98 + 8] = v103;
        v104 = *((_QWORD *)v99 + 2);
        if (v59 >= v104)
          goto LABEL_120;
        v11 = v99;
        v12 = v104 - 1;
        memmove(&v57[16 * v59], v102 + 16, 16 * (v104 - 1 - v59));
        *((_QWORD *)v99 + 2) = v104 - 1;
        v10 = v129;
        if (v104 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v120;
    if (v9 >= v120)
    {
      v8 = v118;
      goto LABEL_104;
    }
  }
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
  result = sub_247ACE3EC();
  __break(1u);
  return result;
}

uint64_t sub_247ABDD2C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  _OWORD *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 88 * a3 - 88;
LABEL_5:
    v6 = result;
    v7 = v5;
    while (1)
    {
      v8 = *(_QWORD *)(v7 + 120);
      v9 = *(_QWORD *)(v7 + 144);
      v10 = *(_QWORD *)(v7 + 56);
      v11 = *(_QWORD *)(v7 + 32) < v8;
      if (v9 != v10)
        v11 = v10 < v9;
      if (!v11)
      {
LABEL_4:
        ++a3;
        v5 += 88;
        if (a3 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v4)
        break;
      v12 = (_OWORD *)(v7 + 88);
      v13 = *(_OWORD *)(v7 + 88);
      v14 = *(_QWORD *)(v7 + 104);
      v15 = *(_QWORD *)(v7 + 112);
      v16 = *(_QWORD *)(v7 + 128);
      v17 = *(_BYTE *)(v7 + 136);
      v18 = *(_BYTE *)(v7 + 137);
      v19 = *(_QWORD *)(v7 + 152);
      v20 = *(_QWORD *)(v7 + 160);
      v21 = *(_OWORD *)(v7 + 48);
      *(_OWORD *)(v7 + 120) = *(_OWORD *)(v7 + 32);
      *(_OWORD *)(v7 + 136) = v21;
      *(_OWORD *)(v7 + 152) = *(_OWORD *)(v7 + 64);
      v22 = *(_OWORD *)v7;
      v23 = *(_OWORD *)(v7 + 16);
      *(_OWORD *)v7 = v13;
      v24 = *(_BYTE *)(v7 + 168);
      *(_QWORD *)(v7 + 168) = *(_QWORD *)(v7 + 80);
      *(_QWORD *)(v7 + 16) = v14;
      *(_QWORD *)(v7 + 24) = v15;
      *(_QWORD *)(v7 + 32) = v8;
      *(_QWORD *)(v7 + 40) = v16;
      *(_BYTE *)(v7 + 48) = v17;
      *(_BYTE *)(v7 + 49) = v18;
      *(_QWORD *)(v7 + 56) = v9;
      *(_QWORD *)(v7 + 64) = v19;
      *(_QWORD *)(v7 + 72) = v20;
      *(_BYTE *)(v7 + 80) = v24;
      v7 -= 88;
      ++v6;
      *v12 = v22;
      v12[1] = v23;
      if (a3 == v6)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_247ABDE18(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  char *v27;
  uint64_t result;
  char *v29;
  const void *v30;
  char *v31;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = (__src - __dst) / 88;
  v10 = a3 - (_QWORD)__src;
  v11 = (uint64_t)(a3 - (_QWORD)__src) / 88;
  v31 = __dst;
  v30 = a4;
  if (v9 >= v11)
  {
    if (v10 >= -87)
    {
      v20 = 88 * v11;
      if (a4 != __src || &__src[v20] <= a4)
        memmove(a4, __src, 88 * v11);
      v21 = &v4[v20];
      v29 = &v4[v20];
      v31 = v6;
      if (v7 < v6 && v10 >= 88)
      {
        v22 = (char *)(a3 - 88);
        do
        {
          v23 = v22 + 88;
          v24 = *((_QWORD *)v21 - 4);
          v25 = *((_QWORD *)v6 - 4);
          v26 = *((_QWORD *)v6 - 7) < *((_QWORD *)v21 - 7);
          if (v24 != v25)
            v26 = v25 < v24;
          if (v26)
          {
            v27 = v6 - 88;
            if (v23 != v6 || v22 >= v6)
              memmove(v22, v6 - 88, 0x58uLL);
            v31 = v6 - 88;
            if (v27 <= v7)
              break;
          }
          else
          {
            v29 = v21 - 88;
            if (v23 < v21 || v22 >= v21 || v23 != v21)
              memmove(v22, v21 - 88, 0x58uLL);
            v27 = v6;
            v21 -= 88;
            if (v6 <= v7)
              break;
          }
          v22 -= 88;
          v6 = v27;
        }
        while (v21 > v4);
      }
LABEL_44:
      sub_247AC1B44((void **)&v31, &v30, &v29);
      return 1;
    }
  }
  else if (v8 >= -87)
  {
    v12 = 88 * v9;
    if (a4 != __dst || &__dst[v12] <= a4)
      memmove(a4, __dst, v12);
    v13 = &v4[v12];
    v29 = v13;
    if ((unint64_t)v6 < a3 && v8 >= 88)
    {
      v14 = v4;
      while (1)
      {
        v15 = *((_QWORD *)v6 + 7);
        v16 = *((_QWORD *)v14 + 7);
        v17 = *((_QWORD *)v14 + 4) < *((_QWORD *)v6 + 4);
        if (v15 != v16)
          v17 = v16 < v15;
        if (v17)
        {
          v18 = v6 + 88;
          v19 = v6;
          if (v7 == v6 && v7 < v18)
            goto LABEL_20;
        }
        else
        {
          v4 = v14 + 88;
          v19 = v14;
          v18 = v6;
          if (v7 == v14)
          {
            v14 += 88;
            if (v7 < v4)
              goto LABEL_20;
          }
          else
          {
            v14 += 88;
          }
        }
        memmove(v7, v19, 0x58uLL);
LABEL_20:
        v7 += 88;
        if (v14 < v13)
        {
          v6 = v18;
          if ((unint64_t)v18 < a3)
            continue;
        }
        v30 = v4;
        v31 = v7;
        goto LABEL_44;
      }
    }
    goto LABEL_44;
  }
  result = sub_247ACE410();
  __break(1u);
  return result;
}

uint64_t sub_247ABE10C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_247ABE124()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *initializeBufferWithCopyOfBuffer for StorageGaugeView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v9 = a2 + 2;
    v8 = a2[2];
    swift_bridgeObjectRetain();
    if (v8)
    {
      v10 = a2[3];
      a1[2] = v8;
      a1[3] = v10;
      swift_retain();
    }
    else
    {
      *((_OWORD *)a1 + 1) = *v9;
    }
    a1[4] = a2[4];
    v12 = *(int *)(a3 + 32);
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for StorageGaugeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16))
    swift_release();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for StorageGaugeView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v8 = a2 + 2;
  v7 = a2[2];
  swift_bridgeObjectRetain();
  if (v7)
  {
    v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v8;
  }
  a1[4] = a2[4];
  v10 = *(int *)(a3 + 32);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

_QWORD *assignWithCopy for StorageGaugeView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a2[2];
  if (!a1[2])
  {
    if (v6)
    {
      v8 = a2[3];
      a1[2] = v6;
      a1[3] = v8;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    goto LABEL_8;
  }
  if (!v6)
  {
    swift_release();
    goto LABEL_7;
  }
  v7 = a2[3];
  a1[2] = v6;
  a1[3] = v7;
  swift_retain();
  swift_release();
LABEL_8:
  a1[4] = a2[4];
  v9 = *(int *)(a3 + 32);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t initializeWithTake for StorageGaugeView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v5;
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  }
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v6 = *(int *)(a3 + 32);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

_QWORD *assignWithTake for StorageGaugeView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[2];
  if (!a1[2])
  {
    if (v7)
    {
      v9 = a2[3];
      a1[2] = v7;
      a1[3] = v9;
      goto LABEL_8;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    goto LABEL_8;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  v8 = a2[3];
  a1[2] = v7;
  a1[3] = v8;
  swift_release();
LABEL_8:
  a1[4] = a2[4];
  v10 = *(int *)(a3 + 32);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorageGaugeView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247ABE550(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for StorageGaugeView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247ABE5DC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

void sub_247ABE654()
{
  unint64_t v0;

  sub_247ABAAF0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_247ABE6E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576DB0B8;
  if (!qword_2576DB0B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB0C0);
    v2[0] = sub_247ABED08(&qword_2576DB0C8, &qword_2576DB0D0, MEMORY[0x24BDEC6F8]);
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x24958B524](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576DB0B8);
  }
  return result;
}

uint64_t sub_247ABE76C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 88 * a1 + 32;
    v6 = a3 + 88 * v4;
    if (v5 >= v6 || v5 + 88 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_247ACE410();
  __break(1u);
  return result;
}

char *sub_247ABE85C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_247ACE410();
  __break(1u);
  return result;
}

char *sub_247ABE944(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  result = (char *)sub_247ACE410();
  __break(1u);
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for StorageGaugeView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v3 + 16))
    swift_release();
  v4 = v3 + *(int *)(v1 + 32);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_247ABEAD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for StorageGaugeView() - 8) + 80);
  return sub_247ABC004(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_247ABEB20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v1 = type metadata accessor for StorageGaugeView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_247ACDE4C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + v3 + 16))
    swift_release();
  v8 = v0 + v3 + *(int *)(v1 + 32);
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + ((v3 + v4 + v7) & ~v7), v5);
  return swift_deallocObject();
}

uint64_t sub_247ABEC08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;

  v7 = type metadata accessor for StorageGaugeView();
  v8 = (*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80);
  sub_247ACDE4C();
  return sub_247ABC9E4(a1, a2, (uint64_t *)(v3 + v8), a3);
}

uint64_t sub_247ABEC88()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247ABECAC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, _OWORD *);
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[5];
  char v8;

  v2 = *(uint64_t (**)(uint64_t, _OWORD *))(v1 + 16);
  v3 = *a1;
  v4 = *(_OWORD *)(a1 + 7);
  v7[2] = *(_OWORD *)(a1 + 5);
  v7[3] = v4;
  v7[4] = *(_OWORD *)(a1 + 9);
  v8 = *((_BYTE *)a1 + 88);
  v5 = *(_OWORD *)(a1 + 3);
  v7[0] = *(_OWORD *)(a1 + 1);
  v7[1] = v5;
  return v2(v3, v7);
}

uint64_t sub_247ABED08(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24958B524](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247ABED48()
{
  unint64_t result;

  result = qword_2576DB140;
  if (!qword_2576DB140)
  {
    result = MEMORY[0x24958B524](&protocol conformance descriptor for GaugeCategory, &type metadata for GaugeCategory);
    atomic_store(result, (unint64_t *)&qword_2576DB140);
  }
  return result;
}

unint64_t sub_247ABED8C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2576DB148;
  if (!qword_2576DB148)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB130);
    v2 = sub_247ABEDF0();
    result = MEMORY[0x24958B524](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2576DB148);
  }
  return result;
}

unint64_t sub_247ABEDF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576DB150;
  if (!qword_2576DB150)
  {
    v1 = type metadata accessor for StorageGaugeItemView();
    result = MEMORY[0x24958B524](&unk_247ACF548, v1);
    atomic_store(result, (unint64_t *)&qword_2576DB150);
  }
  return result;
}

uint64_t sub_247ABEE38(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247ABEE7C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247ABEEB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247ABEEFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247ABEF38(uint64_t a1)
{
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_247ABEF8C()
{
  return sub_247ACDEF4();
}

uint64_t sub_247ABEFB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for GaugeCategory(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for GaugeCategory()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for GaugeCategory(uint64_t a1, uint64_t a2)
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
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GaugeCategory(uint64_t a1, uint64_t a2)
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
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
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
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for GaugeCategory(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

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
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for GaugeCategory(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 81))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GaugeCategory(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 81) = 1;
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
    *(_BYTE *)(result + 81) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StorageGaugeItemPopoverView()
{
  return &type metadata for StorageGaugeItemPopoverView;
}

uint64_t sub_247ABF30C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247ABF31C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
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
  char v17;
  id v18;
  id v19;
  uint64_t v20;
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
  char v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v39[12];
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DAFF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v39[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_247ACE014();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v39[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = a1[2];
  v12 = a1[3];
  v13 = a1[4];
  v44 = v11;
  v45 = v12;
  sub_247ABB360();
  swift_bridgeObjectRetain();
  v14 = sub_247ACE05C();
  v41 = v15;
  v42 = v14;
  v43 = v16;
  v40 = v17 & 1;
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1490]), sel_init);
  objc_msgSend(v18, sel_setCountStyle_, 0);
  v19 = objc_msgSend(v18, sel_stringFromByteCount_, v13);
  v20 = sub_247ACE278();
  v22 = v21;

  v44 = v20;
  v45 = v22;
  v23 = sub_247ACE05C();
  v25 = v24;
  LOBYTE(v18) = v26 & 1;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDF18E8], v7);
  v27 = sub_247ACDFF0();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v6, 1, 1, v27);
  sub_247ACDFFC();
  sub_247ABB3A4((uint64_t)v6);
  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
  v28 = sub_247ACE050();
  v30 = v29;
  LOBYTE(v10) = v31;
  v33 = v32;
  swift_release();
  sub_247ABB3E4(v23, v25, (char)v18);
  swift_bridgeObjectRelease();
  v34 = v40;
  LOBYTE(v44) = v40;
  v36 = v41;
  v35 = v42;
  *(_QWORD *)a2 = v42;
  *(_QWORD *)(a2 + 8) = v36;
  *(_BYTE *)(a2 + 16) = v34;
  *(_QWORD *)(a2 + 24) = v43;
  *(_QWORD *)(a2 + 32) = v28;
  *(_QWORD *)(a2 + 40) = v30;
  *(_BYTE *)(a2 + 48) = v10 & 1;
  *(_QWORD *)(a2 + 56) = v33;
  v37 = v35;
  sub_247ABB4B8(v35, v36, v34);
  swift_bridgeObjectRetain();
  sub_247ABB4B8(v28, v30, v10 & 1);
  swift_bridgeObjectRetain();
  sub_247ABB3E4(v28, v30, v10 & 1);
  swift_bridgeObjectRelease();
  sub_247ABB3E4(v37, v36, v44);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247ABF5DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  _OWORD v27[5];
  char v28;

  v3 = *(_OWORD *)(v1 + 48);
  v27[2] = *(_OWORD *)(v1 + 32);
  v27[3] = v3;
  v27[4] = *(_OWORD *)(v1 + 64);
  v28 = *(_BYTE *)(v1 + 80);
  v4 = *(_OWORD *)(v1 + 16);
  v27[0] = *(_OWORD *)v1;
  v27[1] = v4;
  v19 = sub_247ACDF60();
  sub_247ABF31C(v27, (uint64_t)v20);
  v5 = v20[0];
  v6 = v20[1];
  v7 = v21;
  v8 = v22;
  v9 = v23;
  v10 = v24;
  v11 = v25;
  v12 = v26;
  if (qword_2576DAE78 != -1)
    swift_once();
  v13 = sub_247ACDFC0();
  result = sub_247ACDDD4();
  *(_QWORD *)a1 = v19;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  *(_BYTE *)(a1 + 72) = v11;
  *(_QWORD *)(a1 + 80) = v12;
  *(_BYTE *)(a1 + 88) = v13;
  *(_QWORD *)(a1 + 96) = v15;
  *(_QWORD *)(a1 + 104) = v16;
  *(_QWORD *)(a1 + 112) = v17;
  *(_QWORD *)(a1 + 120) = v18;
  *(_BYTE *)(a1 + 128) = 0;
  return result;
}

unint64_t sub_247ABF704()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576DB198;
  if (!qword_2576DB198)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB1A0);
    v2[0] = sub_247ABF770();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24958B524](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576DB198);
  }
  return result;
}

unint64_t sub_247ABF770()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576DB1A8;
  if (!qword_2576DB1A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB1B0);
    result = MEMORY[0x24958B524](MEMORY[0x24BDF4700], v1);
    atomic_store(result, (unint64_t *)&qword_2576DB1A8);
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for StorageGaugeLegendLayout(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for StorageGaugeLegendLayout(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for StorageGaugeLegendLayout()
{
  return &type metadata for StorageGaugeLegendLayout;
}

unint64_t sub_247ABF834()
{
  unint64_t result;

  result = qword_2576DB1B8;
  if (!qword_2576DB1B8)
  {
    result = MEMORY[0x24958B524](MEMORY[0x24BDEEF18], MEMORY[0x24BDEEF38]);
    atomic_store(result, (unint64_t *)&qword_2576DB1B8);
  }
  return result;
}

uint64_t sub_247ABF878(uint64_t a1, int a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t result;
  double v26;
  char *v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  void (*v32)(uint64_t *, _QWORD);
  char *v33;
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  char *v35;
  char v36;
  char v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48[4];
  uint64_t v49;

  v42 = a8;
  LODWORD(v44) = a2;
  v11 = sub_247ACDE7C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v45 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_247ACDE88();
  v47 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v46 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB1E0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB1E8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v42 - v23;
  sub_247AC0674();
  sub_247ACE2FC();
  result = sub_247ACE308();
  if (v48[0] != v49 && (v44 & 1) == 0)
  {
    v26 = *(double *)&a1;
    v44 = *(void (**)(char *, uint64_t, uint64_t))(v47 + 16);
    v44(v22, a6, v14);
    sub_247ACE2FC();
    *(_QWORD *)&v22[*(int *)(v19 + 36)] = v48[0];
    sub_247AC233C((uint64_t)v22, (uint64_t)v24);
    v27 = &v24[*(int *)(v19 + 36)];
    v28 = *(_QWORD *)v27;
    sub_247ACE308();
    if (v28 == v48[0])
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v18, 1, 1, v11);
    }
    else
    {
      v29 = 0.0;
      v43 = 1;
      v30 = 0.0;
      while (1)
      {
        v32 = (void (*)(uint64_t *, _QWORD))sub_247ACE320();
        (*(void (**)(char *))(v12 + 16))(v18);
        v32(v48, 0);
        v33 = v46;
        v44(v46, (uint64_t)v24, v14);
        sub_247ACE314();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v33, v14);
        v34 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
        v34(v18, 0, 1, v11);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v18, 1, v11) == 1)
          break;
        v35 = v45;
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v45, v18, v11);
        sub_247ACDED0();
        LOBYTE(v48[0]) = v36 & 1;
        LOBYTE(v49) = v37 & 1;
        sub_247ACDE58();
        v39 = v38;
        v41 = v40;
        result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v35, v11);
        if (v30 < v41)
          v30 = v41;
        if (v29 + v39 < v26)
        {
          v29 = v29 + v39 + a3;
        }
        else
        {
          if (__OFADD__(v43, 1))
          {
            __break(1u);
            return result;
          }
          if (v43 + 1 > v42)
            return sub_247AC2384((uint64_t)v24);
          v29 = v39 + a3;
          ++v43;
        }
        v31 = *(_QWORD *)v27;
        sub_247ACE308();
        if (v31 == v48[0])
        {
          v34(v18, 1, 1, v11);
          return sub_247AC2384((uint64_t)v24);
        }
      }
    }
    return sub_247AC2384((uint64_t)v24);
  }
  return result;
}

uint64_t sub_247ABFC74(uint64_t a1, int a2, uint64_t a3, int a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t result;
  double MinX;
  double Width;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  double v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  double v46;
  double v47;
  void (*v48)(char *, uint64_t);
  double v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  char v56;
  double v57;
  double v58;
  _QWORD *v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  double MinY;
  uint64_t v70;
  uint64_t v71;
  double v72;
  uint64_t v73;
  double v74;
  char v75;
  char v76;
  void (*v77)(char *, uint64_t);
  char v78;
  char v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  uint64_t v86;
  _QWORD *v87;
  char v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  CGFloat v94;
  CGFloat v95;
  uint64_t v96;
  int v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108[2];
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  v99 = a13;
  v97 = a2;
  v98 = a4;
  v21 = sub_247ACDE7C();
  v106 = *(_QWORD *)(v21 - 8);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v90 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v90 - v25;
  sub_247ACDE88();
  sub_247AC0674();
  sub_247ACE2FC();
  result = sub_247ACE308();
  if (v108[0] != v107)
  {
    v105 = v21;
    v96 = a1;
    v109.origin.x = a5;
    v109.origin.y = a6;
    v109.size.width = a7;
    v109.size.height = a8;
    MinX = CGRectGetMinX(v109);
    v110.origin.x = a5;
    v110.origin.y = a6;
    v110.size.width = a7;
    v110.size.height = a8;
    Width = CGRectGetWidth(v110);
    v111.origin.x = a5;
    v111.origin.y = a6;
    v94 = a7;
    v111.size.width = a7;
    v95 = a8;
    v111.size.height = a8;
    CGRectGetMinY(v111);
    sub_247ACE2FC();
    sub_247ACE308();
    v30 = v107;
    v31 = v108[0];
    if (v107 < v108[0])
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    if (v108[0] == v107)
    {
      v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      if (v108[0] >= v107)
      {
LABEL_64:
        __break(1u);
LABEL_65:
        result = swift_release();
        __break(1u);
        return result;
      }
      v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        sub_247ACDE94();
        sub_247ACDE70();
        v65 = v64;
        (*(void (**)(char *, uint64_t))(v106 + 8))(v26, v105);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v32 = sub_247ABD2FC(0, v32[2] + 1, 1, v32);
        v67 = v32[2];
        v66 = v32[3];
        if (v67 >= v66 >> 1)
          v32 = sub_247ABD2FC((_QWORD *)(v66 > 1), v67 + 1, 1, v32);
        v68 = &v32[2 * v67];
        v68[5] = v31;
        v32[2] = v67 + 1;
        v68[4] = v65;
        ++v31;
      }
      while (v30 != v31);
    }
    v108[0] = (uint64_t)v32;
    swift_bridgeObjectRetain_n();
    v33 = 0;
    sub_247AC06BC(v108, sub_247AC2328, sub_247AC0DBC);
    v34 = MinX + Width;
    swift_bridgeObjectRelease_n();
    v35 = v108[0];
    v36 = *(_QWORD *)(v108[0] + 16);
    v93 = a3;
    v103 = v36;
    if (v36)
    {
      v91 = 0;
      v37 = 0;
      v100 = v108[0] + 32;
      v92 = v108[0] + 56;
      v38 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v101 = 1;
      v39 = MinX;
      v104 = (_QWORD *)MEMORY[0x24BEE4AF8];
      while (1)
      {
        v102 = v38;
        v40 = v101 + 1;
        v41 = __OFADD__(v101, 1);
        if (v37 >= *(_QWORD *)(v35 + 16))
          break;
        v42 = *(_QWORD *)(v100 + 16 * v37 + 8);
        v43 = v37 + 1;
        sub_247ACDE94();
        sub_247ACDED0();
        LOBYTE(v108[0]) = v44 & 1;
        LOBYTE(v107) = v45 & 1;
        sub_247ACDE58();
        v47 = v46;
        v48 = *(void (**)(char *, uint64_t))(v106 + 8);
        v48(v24, v105);
        v49 = v47 + a9;
        if (v34 <= v39 + v49)
        {
          if (v41)
            goto LABEL_62;
          if (v40 > v99)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v104 = sub_247ABD1F0(0, v104[2] + 1, 1, v104);
            v51 = v104[2];
            v50 = v104[3];
            if (v51 >= v50 >> 1)
              v104 = sub_247ABD1F0((_QWORD *)(v50 > 1), v51 + 1, 1, v104);
            v52 = v104;
            v104[2] = v51 + 1;
            v52[v51 + 4] = v42;
            if (v43 == v103)
            {
LABEL_46:
              swift_release();
              v33 = v91;
              v38 = v102;
              goto LABEL_47;
            }
            v53 = (uint64_t *)(v92 + 16 * v37);
            v54 = v35;
            while (v43 < *(_QWORD *)(v54 + 16))
            {
              v42 = *v53;
              ++v43;
              sub_247ACDE94();
              sub_247ACDED0();
              LOBYTE(v108[0]) = v55 & 1;
              LOBYTE(v107) = v56 & 1;
              sub_247ACDE58();
              v58 = v57;
              v48(v24, v105);
              v49 = v58 + a9;
              if (v34 > v49 + 1.79769313e308)
              {
                v39 = 1.79769313e308;
                goto LABEL_12;
              }
              v59 = v104;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v59 = sub_247ABD1F0(0, v59[2] + 1, 1, v59);
              v61 = v59[2];
              v60 = v59[3];
              if (v61 >= v60 >> 1)
                v59 = sub_247ABD1F0((_QWORD *)(v60 > 1), v61 + 1, 1, v59);
              v59[2] = v61 + 1;
              v104 = v59;
              v59[v61 + 4] = v42;
              v53 += 2;
              v54 = v35;
              if (v103 == v43)
                goto LABEL_46;
            }
            break;
          }
          ++v37;
          v101 = v40;
          v39 = MinX;
        }
        else
        {
LABEL_12:
          v37 = v43;
        }
        v38 = v102;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v38 = sub_247ABD1F0(0, v38[2] + 1, 1, v38);
        v63 = v38[2];
        v62 = v38[3];
        if (v63 >= v62 >> 1)
          v38 = sub_247ABD1F0((_QWORD *)(v62 > 1), v63 + 1, 1, v38);
        v38[2] = v63 + 1;
        v38[v63 + 4] = v42;
        v39 = v49 + v39;
        if (v37 == v103)
        {
          swift_release();
          v33 = v91;
          goto LABEL_47;
        }
      }
      __break(1u);
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    swift_release();
    v38 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v104 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_47:
    v112.origin.x = a5;
    v112.origin.y = a6;
    v112.size.width = v94;
    v112.size.height = v95;
    MinY = CGRectGetMinY(v112);
    v108[0] = (uint64_t)v38;
    swift_bridgeObjectRetain();
    sub_247AC06BC(v108, sub_247AC2314, sub_247AC0734);
    if (v33)
      goto LABEL_65;
    swift_bridgeObjectRelease();
    v103 = v108[0];
    v70 = *(_QWORD *)(v108[0] + 16);
    v71 = v105;
    if (v70)
    {
      v72 = MinY + a10;
      v73 = v103 + 32;
      v74 = MinX;
      do
      {
        v73 += 8;
        sub_247ACDE94();
        sub_247ACDED0();
        LOBYTE(v108[0]) = v75 & 1;
        LOBYTE(v107) = v76 & 1;
        sub_247ACDE58();
        v77 = *(void (**)(char *, uint64_t))(v106 + 8);
        v77(v24, v71);
        sub_247ACDE94();
        sub_247ACDED0();
        LOBYTE(v108[0]) = v78 & 1;
        LOBYTE(v107) = v79 & 1;
        sub_247ACDE58();
        v81 = v80;
        v83 = v82;
        v77(v24, v71);
        v84 = -0.0;
        if (v34 <= v74 + v81)
          v84 = v83 + a10;
        v72 = v72 + v84;
        if (v34 > v74 + v81)
          v85 = v74;
        else
          v85 = MinX;
        sub_247ACDE94();
        sub_247ACE230();
        LOBYTE(v108[0]) = 0;
        LOBYTE(v107) = 0;
        sub_247ACDE64();
        v77(v24, v71);
        v74 = v81 + a9 + v85;
        --v70;
      }
      while (v70);
    }
    swift_release();
    v86 = v104[2];
    if (v86)
    {
      v87 = v104 + 4;
      v88 = v97 & 1;
      v89 = v98 & 1;
      do
      {
        ++v87;
        sub_247ACDE94();
        sub_247ACE230();
        LOBYTE(v108[0]) = v88;
        LOBYTE(v107) = v89;
        sub_247ACDE64();
        (*(void (**)(char *, uint64_t))(v106 + 8))(v24, v71);
        --v86;
      }
      while (v86);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_247AC04D0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  return sub_247ABF878(a1, a2 & 1, *(double *)v6, a3, a4, a5, a6, *(_QWORD *)(v6 + 16));
}

uint64_t sub_247AC04E8(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  uint64_t v10;

  return sub_247ABFC74(a1, a2 & 1, a3, a4 & 1, a7, a8, a9, a10, *(double *)v10, *(double *)(v10 + 8), a5, a6, *(_QWORD *)(v10 + 16));
}

uint64_t sub_247AC0508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_247AC0560(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF44F8]);
}

uint64_t sub_247AC0534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_247AC0560(a1, a2, a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDF4500]);
}

uint64_t sub_247AC0560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

void (*sub_247AC05A0(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_247ACDDBC();
  return sub_247AC05FC;
}

void sub_247AC05FC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t sub_247AC0630()
{
  unint64_t result;

  result = qword_2576DB1C0;
  if (!qword_2576DB1C0)
  {
    result = MEMORY[0x24958B524](&unk_247ACEDAC, &type metadata for StorageGaugeLegendLayout);
    atomic_store(result, (unint64_t *)&qword_2576DB1C0);
  }
  return result;
}

unint64_t sub_247AC0674()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576DB1C8;
  if (!qword_2576DB1C8)
  {
    v1 = sub_247ACDE88();
    result = MEMORY[0x24958B524](MEMORY[0x24BDEC7A0], v1);
    atomic_store(result, (unint64_t *)&qword_2576DB1C8);
  }
  return result;
}

uint64_t sub_247AC06BC(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(_QWORD *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = a2(v6);
  v7 = *(_QWORD *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  result = a3(v9);
  *a1 = v6;
  return result;
}

uint64_t sub_247AC0734(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  char v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  unint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *__dst;

  v2 = a1;
  v3 = a1[1];
  result = sub_247ACE428();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_137;
    if ((unint64_t)v3 >= 2)
    {
      v78 = 0;
      v79 = *v2;
      for (i = 1; i != v3; ++i)
      {
        v81 = *(_QWORD *)(v79 + 8 * i);
        v82 = v78;
        do
        {
          v83 = *(_QWORD *)(v79 + v82);
          if (v81 >= v83)
            break;
          if (!v79)
            goto LABEL_141;
          *(_QWORD *)(v79 + v82 + 8) = v83;
          *(_QWORD *)(v79 + v82) = v81;
          v82 -= 8;
        }
        while (v82 != -8);
        v78 += 8;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_146;
  v95 = result;
  v96 = v3;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_103:
      v94 = v8;
      if (v12 >= 2)
      {
        v84 = *v2;
        do
        {
          v85 = v12 - 2;
          if (v12 < 2)
            goto LABEL_132;
          if (!v84)
            goto LABEL_145;
          v86 = v11;
          v87 = v11 + 32;
          v88 = *(_QWORD *)&v11[16 * v85 + 32];
          v89 = *(_QWORD *)&v11[16 * v12 + 24];
          sub_247AC1528((char *)(v84 + 8 * v88), (char *)(v84 + 8 * *(_QWORD *)&v87[16 * v12 - 16]), v84 + 8 * v89, __dst);
          if (v1)
            break;
          if (v89 < v88)
            goto LABEL_133;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v86 = sub_247AC1D50((uint64_t)v86);
          if (v85 >= *((_QWORD *)v86 + 2))
            goto LABEL_134;
          v90 = &v86[16 * v85 + 32];
          *(_QWORD *)v90 = v88;
          *((_QWORD *)v90 + 1) = v89;
          v91 = *((_QWORD *)v86 + 2);
          if (v12 > v91)
            goto LABEL_135;
          memmove(&v86[16 * v12 + 16], &v86[16 * v12 + 32], 16 * (v91 - v12));
          v11 = v86;
          *((_QWORD *)v86 + 2) = v91 - 1;
          v12 = v91 - 1;
        }
        while (v91 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v94 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v94 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_247ACE2D8();
    *(_QWORD *)(v7 + 16) = v6;
    v3 = v96;
    v94 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *v2;
  v92 = v2;
  v93 = *v2 - 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v97 = *v2;
  while (1)
  {
    v13 = v9++;
    if (v9 < v3)
    {
      v14 = *(_QWORD *)(v10 + 8 * v9);
      v15 = *(_QWORD *)(v10 + 8 * v13);
      v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        v16 = v14;
        while (1)
        {
          v17 = *(_QWORD *)(v10 + 8 * v9);
          if (v14 < v15 == v17 >= v16)
            break;
          ++v9;
          v16 = v17;
          if (v3 == v9)
          {
            v9 = v3;
            break;
          }
        }
      }
      if (v14 < v15)
      {
        if (v9 < v13)
          goto LABEL_138;
        if (v13 < v9)
        {
          v18 = v9 - 1;
          v19 = v13;
          do
          {
            if (v19 != v18)
            {
              if (!v10)
                goto LABEL_144;
              v20 = *(_QWORD *)(v10 + 8 * v19);
              *(_QWORD *)(v10 + 8 * v19) = *(_QWORD *)(v10 + 8 * v18);
              *(_QWORD *)(v10 + 8 * v18) = v20;
            }
            v59 = ++v19 < v18--;
          }
          while (v59);
        }
      }
    }
    if (v9 >= v3)
      goto LABEL_47;
    if (__OFSUB__(v9, v13))
      goto LABEL_136;
    if (v9 - v13 >= v95)
      goto LABEL_47;
    v21 = v13 + v95;
    if (__OFADD__(v13, v95))
      goto LABEL_139;
    if (v21 >= v3)
      v21 = v3;
    if (v21 < v13)
      break;
    if (v9 != v21)
    {
      v22 = (uint64_t *)(v93 + 8 * v9);
      do
      {
        v23 = *(_QWORD *)(v10 + 8 * v9);
        v24 = v13;
        v25 = v22;
        do
        {
          v26 = *v25;
          if (v23 >= *v25)
            break;
          if (!v10)
            goto LABEL_142;
          *v25 = v23;
          v25[1] = v26;
          --v25;
          ++v24;
        }
        while (v9 != v24);
        ++v9;
        ++v22;
      }
      while (v9 != v21);
      v9 = v21;
    }
LABEL_47:
    if (v9 < v13)
      goto LABEL_131;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_247AC1A4C(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v28 = *((_QWORD *)v11 + 2);
    v27 = *((_QWORD *)v11 + 3);
    v12 = v28 + 1;
    v10 = v97;
    if (v28 >= v27 >> 1)
    {
      v77 = sub_247AC1A4C((char *)(v27 > 1), v28 + 1, 1, v11);
      v10 = v97;
      v11 = v77;
    }
    *((_QWORD *)v11 + 2) = v12;
    v29 = v11 + 32;
    v30 = &v11[16 * v28 + 32];
    *(_QWORD *)v30 = v13;
    *((_QWORD *)v30 + 1) = v9;
    if (v28)
    {
      while (1)
      {
        v31 = v12 - 1;
        if (v12 >= 4)
        {
          v36 = &v29[16 * v12];
          v37 = *((_QWORD *)v36 - 8);
          v38 = *((_QWORD *)v36 - 7);
          v42 = __OFSUB__(v38, v37);
          v39 = v38 - v37;
          if (v42)
            goto LABEL_120;
          v41 = *((_QWORD *)v36 - 6);
          v40 = *((_QWORD *)v36 - 5);
          v42 = __OFSUB__(v40, v41);
          v34 = v40 - v41;
          v35 = v42;
          if (v42)
            goto LABEL_121;
          v43 = v12 - 2;
          v44 = &v29[16 * v12 - 32];
          v46 = *(_QWORD *)v44;
          v45 = *((_QWORD *)v44 + 1);
          v42 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          if (v42)
            goto LABEL_123;
          v42 = __OFADD__(v34, v47);
          v48 = v34 + v47;
          if (v42)
            goto LABEL_126;
          if (v48 >= v39)
          {
            v66 = &v29[16 * v31];
            v68 = *(_QWORD *)v66;
            v67 = *((_QWORD *)v66 + 1);
            v42 = __OFSUB__(v67, v68);
            v69 = v67 - v68;
            if (v42)
              goto LABEL_130;
            v59 = v34 < v69;
            goto LABEL_84;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v60 = *((_QWORD *)v11 + 4);
            v61 = *((_QWORD *)v11 + 5);
            v42 = __OFSUB__(v61, v60);
            v53 = v61 - v60;
            v54 = v42;
            goto LABEL_78;
          }
          v33 = *((_QWORD *)v11 + 4);
          v32 = *((_QWORD *)v11 + 5);
          v42 = __OFSUB__(v32, v33);
          v34 = v32 - v33;
          v35 = v42;
        }
        if ((v35 & 1) != 0)
          goto LABEL_122;
        v43 = v12 - 2;
        v49 = &v29[16 * v12 - 32];
        v51 = *(_QWORD *)v49;
        v50 = *((_QWORD *)v49 + 1);
        v52 = __OFSUB__(v50, v51);
        v53 = v50 - v51;
        v54 = v52;
        if (v52)
          goto LABEL_125;
        v55 = &v29[16 * v31];
        v57 = *(_QWORD *)v55;
        v56 = *((_QWORD *)v55 + 1);
        v42 = __OFSUB__(v56, v57);
        v58 = v56 - v57;
        if (v42)
          goto LABEL_128;
        if (__OFADD__(v53, v58))
          goto LABEL_129;
        if (v53 + v58 >= v34)
        {
          v59 = v34 < v58;
LABEL_84:
          if (v59)
            v31 = v43;
          goto LABEL_86;
        }
LABEL_78:
        if ((v54 & 1) != 0)
          goto LABEL_124;
        v62 = &v29[16 * v31];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v42 = __OFSUB__(v63, v64);
        v65 = v63 - v64;
        if (v42)
          goto LABEL_127;
        if (v65 < v53)
          goto LABEL_15;
LABEL_86:
        v70 = v31 - 1;
        if (v31 - 1 >= v12)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
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
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v10)
          goto LABEL_143;
        v71 = &v29[16 * v70];
        v72 = *(_QWORD *)v71;
        v73 = v29;
        v74 = &v29[16 * v31];
        v75 = *((_QWORD *)v74 + 1);
        sub_247AC1528((char *)(v10 + 8 * *(_QWORD *)v71), (char *)(v10 + 8 * *(_QWORD *)v74), v10 + 8 * v75, __dst);
        if (v1)
          goto LABEL_114;
        if (v75 < v72)
          goto LABEL_117;
        if (v31 > *((_QWORD *)v11 + 2))
          goto LABEL_118;
        *(_QWORD *)v71 = v72;
        *(_QWORD *)&v73[16 * v70 + 8] = v75;
        v76 = *((_QWORD *)v11 + 2);
        if (v31 >= v76)
          goto LABEL_119;
        v12 = v76 - 1;
        memmove(v74, v74 + 16, 16 * (v76 - 1 - v31));
        v29 = v73;
        *((_QWORD *)v11 + 2) = v76 - 1;
        v10 = v97;
        if (v76 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v96;
    if (v9 >= v96)
    {
      v8 = v94;
      v2 = v92;
      goto LABEL_103;
    }
  }
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
  result = sub_247ACE3EC();
  __break(1u);
  return result;
}

uint64_t sub_247AC0DBC(uint64_t *a1)
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
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  _BOOL4 v20;
  int v21;
  double *v22;
  double v23;
  double v24;
  int v25;
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
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  char *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  char v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double *__dst;

  v3 = a1[1];
  result = sub_247ACE428();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if (v3)
      return sub_247AC1490(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_144;
  v6 = result;
  v100 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (double *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v91 = v12;
      v102 = v9;
      if (v13 >= 2)
      {
        v92 = *v100;
        do
        {
          v93 = v13 - 2;
          if (v13 < 2)
            goto LABEL_131;
          if (!v92)
            goto LABEL_143;
          v94 = v91;
          v95 = *(_QWORD *)&v91[16 * v93 + 32];
          v96 = *(_QWORD *)&v91[16 * v13 + 24];
          sub_247AC1794((double *)(v92 + 16 * v95), (double *)(v92 + 16 * *(_QWORD *)&v91[16 * v13 + 16]), v92 + 16 * v96, __dst);
          if (v1)
            break;
          if (v96 < v95)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v94 = sub_247AC1D50((uint64_t)v94);
          if (v93 >= *((_QWORD *)v94 + 2))
            goto LABEL_133;
          v97 = &v94[16 * v93 + 32];
          *(_QWORD *)v97 = v95;
          *((_QWORD *)v97 + 1) = v96;
          v98 = *((_QWORD *)v94 + 2);
          if (v13 > v98)
            goto LABEL_134;
          memmove(&v94[16 * v13 + 16], &v94[16 * v13 + 32], 16 * (v98 - v13));
          v91 = v94;
          *((_QWORD *)v94 + 2) = v98 - 1;
          v13 = v98 - 1;
        }
        while (v98 > 2);
      }
LABEL_99:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v102 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v102 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB1D8);
    v8 = sub_247ACE2D8();
    *(_QWORD *)(v8 + 16) = v7;
    v102 = v8;
    __dst = (double *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v101 = *a1 + 40;
  v99 = *a1 - 16;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v103 = v6;
  v104 = v3;
  v105 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = v11 + 16 * v10;
      v16 = *(double *)v15;
      v17 = *(double *)(v15 + 8);
      v18 = v11 + 16 * v14;
      v19 = *(double *)v18;
      v20 = *(double *)v18 < v16;
      v21 = *(_QWORD *)&v17 < *(_QWORD *)(v18 + 8);
      if (v16 != v19)
        v21 = v20;
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v22 = (double *)(v101 + 16 * v14);
        while (1)
        {
          v23 = v16;
          v16 = *(v22 - 1);
          v24 = *v22;
          v25 = *(_QWORD *)v22 < *(_QWORD *)&v17;
          if (v16 != v23)
            v25 = v23 < v16;
          if (v21 != v25)
            break;
          v22 += 2;
          ++v10;
          v17 = v24;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v21)
      {
        if (v10 < v14)
          goto LABEL_137;
        if (v14 < v10)
        {
          v26 = 16 * v10;
          v27 = 16 * v14;
          v28 = v10;
          v29 = v14;
          do
          {
            if (v29 != --v28)
            {
              if (!v11)
                goto LABEL_142;
              v30 = v11 + v26;
              v31 = *(_QWORD *)(v11 + v27);
              v32 = *(_QWORD *)(v11 + v27 + 8);
              *(_OWORD *)(v11 + v27) = *(_OWORD *)(v11 + v26 - 16);
              *(_QWORD *)(v30 - 16) = v31;
              *(_QWORD *)(v30 - 8) = v32;
            }
            ++v29;
            v26 -= 16;
            v27 += 16;
          }
          while (v29 < v28);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_52;
    if (__OFSUB__(v10, v14))
      goto LABEL_135;
    if (v10 - v14 >= v6)
      goto LABEL_52;
    v33 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_138;
    if (v33 >= v3)
      v33 = v3;
    if (v33 < v14)
      break;
    if (v10 != v33)
    {
      v34 = v99 + 16 * v10;
      do
      {
        v35 = v11 + 16 * v10;
        v36 = *(double *)v35;
        v37 = *(_QWORD *)(v35 + 8);
        v38 = v14;
        v39 = v34;
        do
        {
          v40 = v37 < *(_QWORD *)(v39 + 8);
          if (v36 != *(double *)v39)
            v40 = *(double *)v39 < v36;
          if (!v40)
            break;
          if (!v11)
            goto LABEL_140;
          *(_OWORD *)(v39 + 16) = *(_OWORD *)v39;
          *(double *)v39 = v36;
          *(_QWORD *)(v39 + 8) = v37;
          v39 -= 16;
          ++v38;
        }
        while (v10 != v38);
        ++v10;
        v34 += 16;
      }
      while (v10 != v33);
      v10 = v33;
    }
LABEL_52:
    if (v10 < v14)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_247AC1A4C(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v42 = *((_QWORD *)v12 + 2);
    v41 = *((_QWORD *)v12 + 3);
    v13 = v42 + 1;
    v11 = v105;
    if (v42 >= v41 >> 1)
    {
      v90 = sub_247AC1A4C((char *)(v41 > 1), v42 + 1, 1, v12);
      v11 = v105;
      v12 = v90;
    }
    *((_QWORD *)v12 + 2) = v13;
    v43 = v12 + 32;
    v44 = &v12[16 * v42 + 32];
    *(_QWORD *)v44 = v14;
    *((_QWORD *)v44 + 1) = v10;
    if (v42)
    {
      while (1)
      {
        v45 = v13 - 1;
        if (v13 >= 4)
        {
          v50 = &v43[16 * v13];
          v51 = *((_QWORD *)v50 - 8);
          v52 = *((_QWORD *)v50 - 7);
          v56 = __OFSUB__(v52, v51);
          v53 = v52 - v51;
          if (v56)
            goto LABEL_119;
          v55 = *((_QWORD *)v50 - 6);
          v54 = *((_QWORD *)v50 - 5);
          v56 = __OFSUB__(v54, v55);
          v48 = v54 - v55;
          v49 = v56;
          if (v56)
            goto LABEL_120;
          v57 = v13 - 2;
          v58 = &v43[16 * v13 - 32];
          v60 = *(_QWORD *)v58;
          v59 = *((_QWORD *)v58 + 1);
          v56 = __OFSUB__(v59, v60);
          v61 = v59 - v60;
          if (v56)
            goto LABEL_122;
          v56 = __OFADD__(v48, v61);
          v62 = v48 + v61;
          if (v56)
            goto LABEL_125;
          if (v62 >= v53)
          {
            v80 = &v43[16 * v45];
            v82 = *(_QWORD *)v80;
            v81 = *((_QWORD *)v80 + 1);
            v56 = __OFSUB__(v81, v82);
            v83 = v81 - v82;
            if (v56)
              goto LABEL_129;
            v73 = v48 < v83;
            goto LABEL_89;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v74 = *((_QWORD *)v12 + 4);
            v75 = *((_QWORD *)v12 + 5);
            v56 = __OFSUB__(v75, v74);
            v67 = v75 - v74;
            v68 = v56;
            goto LABEL_83;
          }
          v47 = *((_QWORD *)v12 + 4);
          v46 = *((_QWORD *)v12 + 5);
          v56 = __OFSUB__(v46, v47);
          v48 = v46 - v47;
          v49 = v56;
        }
        if ((v49 & 1) != 0)
          goto LABEL_121;
        v57 = v13 - 2;
        v63 = &v43[16 * v13 - 32];
        v65 = *(_QWORD *)v63;
        v64 = *((_QWORD *)v63 + 1);
        v66 = __OFSUB__(v64, v65);
        v67 = v64 - v65;
        v68 = v66;
        if (v66)
          goto LABEL_124;
        v69 = &v43[16 * v45];
        v71 = *(_QWORD *)v69;
        v70 = *((_QWORD *)v69 + 1);
        v56 = __OFSUB__(v70, v71);
        v72 = v70 - v71;
        if (v56)
          goto LABEL_127;
        if (__OFADD__(v67, v72))
          goto LABEL_128;
        if (v67 + v72 >= v48)
        {
          v73 = v48 < v72;
LABEL_89:
          if (v73)
            v45 = v57;
          goto LABEL_91;
        }
LABEL_83:
        if ((v68 & 1) != 0)
          goto LABEL_123;
        v76 = &v43[16 * v45];
        v78 = *(_QWORD *)v76;
        v77 = *((_QWORD *)v76 + 1);
        v56 = __OFSUB__(v77, v78);
        v79 = v77 - v78;
        if (v56)
          goto LABEL_126;
        if (v79 < v67)
          goto LABEL_15;
LABEL_91:
        v84 = v45 - 1;
        if (v45 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
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
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11)
          goto LABEL_141;
        v85 = &v43[16 * v84];
        v86 = *(_QWORD *)v85;
        v87 = &v43[16 * v45];
        v88 = *((_QWORD *)v87 + 1);
        sub_247AC1794((double *)(v11 + 16 * *(_QWORD *)v85), (double *)(v11 + 16 * *(_QWORD *)v87), v11 + 16 * v88, __dst);
        if (v1)
          goto LABEL_99;
        if (v88 < v86)
          goto LABEL_116;
        if (v45 > *((_QWORD *)v12 + 2))
          goto LABEL_117;
        *(_QWORD *)v85 = v86;
        *(_QWORD *)&v43[16 * v84 + 8] = v88;
        v89 = *((_QWORD *)v12 + 2);
        if (v45 >= v89)
          goto LABEL_118;
        v13 = v89 - 1;
        memmove(&v43[16 * v45], v87 + 16, 16 * (v89 - 1 - v45));
        *((_QWORD *)v12 + 2) = v89 - 1;
        v11 = v105;
        if (v89 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v103;
    v3 = v104;
    if (v10 >= v104)
    {
      v9 = v102;
      goto LABEL_102;
    }
  }
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
  result = sub_247ACE3EC();
  __break(1u);
  return result;
}

uint64_t sub_247AC1490(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 16 * a3 - 16;
LABEL_5:
    v6 = v4 + 16 * a3;
    v7 = *(double *)v6;
    v8 = *(_QWORD *)(v6 + 8);
    v9 = result;
    v10 = v5;
    while (1)
    {
      v11 = v8 < *(_QWORD *)(v10 + 8);
      if (v7 != *(double *)v10)
        v11 = *(double *)v10 < v7;
      if (!v11)
      {
LABEL_4:
        ++a3;
        v5 += 16;
        if (a3 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v4)
        break;
      *(_OWORD *)(v10 + 16) = *(_OWORD *)v10;
      *(double *)v10 = v7;
      *(_QWORD *)(v10 + 8) = v8;
      v10 -= 16;
      if (a3 == ++v9)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_247AC1528(char *__src, char *a2, unint64_t a3, char *__dst)
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
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  char *v22;
  char *v23;
  char *v24;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 7;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 3;
  v24 = __src;
  v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst)
        memmove(__dst, a2, 8 * v13);
      v16 = &v4[8 * v13];
      v22 = v16;
      v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        v17 = (char *)(a3 - 8);
        while (1)
        {
          v18 = v17 + 8;
          v19 = v6 - 8;
          v20 = *((_QWORD *)v6 - 1);
          if (*((_QWORD *)v16 - 1) >= v20)
          {
            v22 = v16 - 8;
            if (v18 < v16 || v17 >= v16 || v18 != v16)
              *(_QWORD *)v17 = *((_QWORD *)v16 - 1);
            v16 -= 8;
            if (v6 <= v7)
              goto LABEL_42;
          }
          else
          {
            if (v18 != v6 || v17 >= v6)
              *(_QWORD *)v17 = v20;
            v24 = v6 - 8;
            v6 -= 8;
            if (v19 <= v7)
              goto LABEL_42;
          }
          v17 -= 8;
          if (v16 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst)
      memmove(__dst, __src, 8 * v10);
    v14 = &v4[8 * v10];
    v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*(_QWORD *)v6 >= *(_QWORD *)v4)
        {
          if (v7 != v4)
            *(_QWORD *)v7 = *(_QWORD *)v4;
          v4 += 8;
          v23 = v4;
          v15 = v6;
        }
        else
        {
          v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6)
            *(_QWORD *)v7 = *(_QWORD *)v6;
        }
        v7 += 8;
        if (v4 >= v14)
          break;
        v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      v24 = v7;
    }
LABEL_42:
    sub_247AC1C00((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  result = sub_247ACE410();
  __break(1u);
  return result;
}

uint64_t sub_247AC1794(double *__src, double *a2, unint64_t a3, double *__dst)
{
  double *v4;
  double *v6;
  double *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  _BOOL4 v15;
  double *v16;
  double *v17;
  double *v18;
  double *v19;
  double v20;
  double *v21;
  double v22;
  _BOOL4 v23;
  _BOOL4 v24;
  uint64_t result;
  char *v26;
  double *v27;
  double *v28;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = (char *)a2 - (char *)__src + 15;
  if ((char *)a2 - (char *)__src >= 0)
    v9 = (char *)a2 - (char *)__src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v28 = __src;
  v27 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[2 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v17 = &v4[2 * v13];
      v26 = (char *)v17;
      v28 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v18 = (double *)(a3 - 16);
        v19 = v6;
        while (1)
        {
          v20 = *(v17 - 2);
          v21 = v18 + 2;
          v22 = *(v19 - 2);
          v19 -= 2;
          v23 = v22 < v20;
          v24 = *((_QWORD *)v17 - 1) < *((_QWORD *)v19 + 1);
          if (v20 != v22)
            v24 = v23;
          if (v24)
          {
            if (v21 != v6 || v18 >= v6)
              *(_OWORD *)v18 = *(_OWORD *)v19;
            v28 = v19;
            if (v19 <= v7)
              goto LABEL_46;
          }
          else
          {
            v26 = (char *)(v17 - 2);
            if (v21 < v17 || v18 >= v17 || v21 != v17)
              *(_OWORD *)v18 = *((_OWORD *)v17 - 1);
            v19 = v6;
            v17 -= 2;
            if (v6 <= v7)
              goto LABEL_46;
          }
          v18 -= 2;
          v6 = v19;
          if (v17 <= v4)
            goto LABEL_46;
        }
      }
      goto LABEL_46;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[2 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[2 * v10];
    v26 = (char *)v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        v15 = *((_QWORD *)v6 + 1) < *((_QWORD *)v4 + 1);
        if (*v6 != *v4)
          v15 = *v4 < *v6;
        if (v15)
        {
          v16 = v6 + 2;
          if (v7 < v6 || v7 >= v16 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        else
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 2;
          v27 = v4;
          v16 = v6;
        }
        v7 += 2;
        if (v4 >= v14)
          break;
        v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      v28 = v7;
    }
LABEL_46:
    sub_247AC1CA8((void **)&v28, (const void **)&v27, &v26);
    return 1;
  }
  result = sub_247ACE410();
  __break(1u);
  return result;
}

char *sub_247AC1A4C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB1D0);
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

char *sub_247AC1B44(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  size_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -88)
  {
    result = (char *)sub_247ACE410();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = 88 * (v4 / 88);
    if (result != v3 || result >= &v3[v6])
      return (char *)memmove(result, v3, v6);
  }
  return result;
}

char *sub_247AC1C00(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_247ACE410();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_247AC1CA8(void **a1, const void **a2, _QWORD *a3)
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
    result = (char *)sub_247ACE410();
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

char *sub_247AC1D50(uint64_t a1)
{
  return sub_247AC1A4C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_247AC1D64(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB190);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 88);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 88 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_247ACE410();
  __break(1u);
  return result;
}

uint64_t sub_247AC1EE0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB0D8);
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
  result = sub_247ACE410();
  __break(1u);
  return result;
}

uint64_t sub_247AC203C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB0E0);
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
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_247ACE410();
  __break(1u);
  return result;
}

uint64_t sub_247AC2198(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB1F0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 + 31;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8])
      memmove(v13, v14, v8 << 6);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[64 * v8] || v13 >= &v14[64 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_247ACE410();
  __break(1u);
  return result;
}

uint64_t sub_247AC2300(uint64_t a1)
{
  return sub_247AC1D64(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_247AC2314(uint64_t a1)
{
  return sub_247AC1EE0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_247AC2328(uint64_t a1)
{
  return sub_247AC203C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_247AC233C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB1E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247AC2384(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB1E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t Int64.formattedSize.getter(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1490]), sel_init);
  objc_msgSend(v2, sel_setCountStyle_, 0);
  v3 = objc_msgSend(v2, sel_stringFromByteCount_, a1);
  v4 = sub_247ACE278();

  return v4;
}

void *Int64.unknown.unsafeMutableAddressor()
{
  return &static Int64.unknown;
}

unint64_t static Int64.unknown.getter()
{
  return 0x8000000000000000;
}

Swift::Int64_optional __swiftcall Int64.init(_:)(Swift::Int64 a1)
{
  _BOOL8 v1;
  Swift::Int64 v2;
  Swift::Int64_optional result;

  v1 = (unint64_t)a1 >> 63;
  v2 = a1 & ~(a1 >> 63);
  result.is_nil = v1;
  result.value = v2;
  return result;
}

uint64_t Int64.roundedToGB.getter(uint64_t result)
{
  double v1;

  v1 = ceil((double)result / 1000000000.0) * 1000000000.0;
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 9.22337204e18)
    return (uint64_t)v1;
LABEL_7:
  __break(1u);
  return result;
}

uint64_t Int64.optionalSize.getter(uint64_t result)
{
  if (result == 0x8000000000000000)
    return 0;
  return result;
}

uint64_t Array<A>.total.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  BOOL v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  while (1)
  {
    v5 = *v4++;
    v6 = __OFADD__(result, v5);
    result += v5;
    if (v6)
      break;
    if (!--v1)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t GaugeCategory.init(id:localizedName:size:color:fillType:isSelectable:showSizeOverlay:sortOrderPriority:displayOrderPriority:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>, char a11, uint64_t a12)
{
  uint64_t v21;
  char v23;

  if (a6)
  {
    v21 = a6;
  }
  else
  {
    v23 = a8;
    v21 = sub_247ACE104();
    a8 = v23;
  }
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = v21;
  *(_BYTE *)(a9 + 48) = a7 & 1;
  *(_BYTE *)(a9 + 49) = a11 & 1;
  *(_QWORD *)(a9 + 56) = a12;
  *(double *)(a9 + 64) = a10;
  *(_QWORD *)(a9 + 72) = a6;
  *(_BYTE *)(a9 + 80) = a8 & 1;
  return swift_retain();
}

BOOL static StorageGaugeItemFillType.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t StorageGaugeItemFillType.hash(into:)()
{
  return sub_247ACE470();
}

uint64_t StorageGaugeItemFillType.hashValue.getter()
{
  sub_247ACE464();
  sub_247ACE470();
  return sub_247ACE488();
}

BOOL sub_247AC265C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_247AC2674()
{
  sub_247ACE464();
  sub_247ACE470();
  return sub_247ACE488();
}

uint64_t sub_247AC26B8()
{
  return sub_247ACE470();
}

uint64_t sub_247AC26E0()
{
  sub_247ACE464();
  sub_247ACE470();
  return sub_247ACE488();
}

uint64_t GaugeCategory.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GaugeCategory.localizedName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GaugeCategory.size.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t GaugeCategory.size.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*GaugeCategory.size.modify())()
{
  return nullsub_1;
}

uint64_t GaugeCategory.color.getter()
{
  return swift_retain();
}

uint64_t GaugeCategory.fillType.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t GaugeCategory.showSizeOverlay.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t GaugeCategory.sortOrderPriority.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

double GaugeCategory.displayOrderPriority.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 64);
}

uint64_t GaugeCategory.init(identifier:size:color:fillType:isSelectable:showSizeOverlay:sortOrderPriority:displayOrderPriority:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>, double a9@<D0>)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v17 = StorageCategoryIdentifier.rawValue.getter(a1);
  v19 = v18;
  StorageCategoryIdentifier.localizedName.getter(a1);
  v21 = v20;
  v23 = v22;
  if (a3)
    v24 = a3;
  else
    v24 = sub_247ACE104();
  *(_QWORD *)a8 = v17;
  *(_QWORD *)(a8 + 8) = v19;
  *(_QWORD *)(a8 + 16) = v21;
  *(_QWORD *)(a8 + 24) = v23;
  *(_QWORD *)(a8 + 32) = a2;
  *(_QWORD *)(a8 + 40) = v24;
  *(_BYTE *)(a8 + 48) = a4 & 1;
  *(_BYTE *)(a8 + 49) = a6 & 1;
  *(_QWORD *)(a8 + 56) = a7;
  *(double *)(a8 + 64) = a9;
  *(_QWORD *)(a8 + 72) = a3;
  *(_BYTE *)(a8 + 80) = a5 & 1;
  return swift_retain();
}

uint64_t static GaugeCategory.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if ((v4 || (sub_247ACE440() & 1) != 0) && a1[4] == a2[4])
    return sub_247ACE0C8();
  else
    return 0;
}

uint64_t GaugeCategory.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_247ACE284();
  swift_bridgeObjectRelease();
  return sub_247ACE47C();
}

uint64_t GaugeCategory.hashValue.getter()
{
  sub_247ACE464();
  swift_bridgeObjectRetain();
  sub_247ACE284();
  swift_bridgeObjectRelease();
  sub_247ACE47C();
  return sub_247ACE488();
}

uint64_t sub_247AC29BC@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_247AC29C8()
{
  sub_247ACE464();
  swift_bridgeObjectRetain();
  sub_247ACE284();
  swift_bridgeObjectRelease();
  sub_247ACE47C();
  return sub_247ACE488();
}

uint64_t sub_247AC2A38()
{
  swift_bridgeObjectRetain();
  sub_247ACE284();
  swift_bridgeObjectRelease();
  return sub_247ACE47C();
}

uint64_t sub_247AC2A90()
{
  sub_247ACE464();
  swift_bridgeObjectRetain();
  sub_247ACE284();
  swift_bridgeObjectRelease();
  sub_247ACE47C();
  return sub_247ACE488();
}

unint64_t sub_247AC2B00()
{
  unint64_t result;

  result = qword_2576DB1F8;
  if (!qword_2576DB1F8)
  {
    result = MEMORY[0x24958B524](&protocol conformance descriptor for StorageGaugeItemFillType, &type metadata for StorageGaugeItemFillType);
    atomic_store(result, (unint64_t *)&qword_2576DB1F8);
  }
  return result;
}

uint64_t sub_247AC2B44()
{
  return MEMORY[0x24BEE0D10];
}

unint64_t sub_247AC2B54()
{
  unint64_t result;

  result = qword_2576DB200;
  if (!qword_2576DB200)
  {
    result = MEMORY[0x24958B524](&protocol conformance descriptor for GaugeCategory, &type metadata for GaugeCategory);
    atomic_store(result, (unint64_t *)&qword_2576DB200);
  }
  return result;
}

uint64_t sub_247AC2B98(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[4];
  v3 = a2[4];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if ((v4 || (sub_247ACE440() & 1) != 0) && v2 == v3)
    return sub_247ACE0C8();
  else
    return 0;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StorageGaugeItemFillType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StorageGaugeItemFillType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247AC2CF8 + 4 * byte_247ACEE95[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_247AC2D2C + 4 * byte_247ACEE90[v4]))();
}

uint64_t sub_247AC2D2C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247AC2D34(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247AC2D3CLL);
  return result;
}

uint64_t sub_247AC2D48(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247AC2D50);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_247AC2D54(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247AC2D5C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247AC2D68(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_247AC2D70(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for StorageGaugeItemFillType()
{
  return &type metadata for StorageGaugeItemFillType;
}

ValueMetadata *type metadata accessor for GaugeCategory()
{
  return &type metadata for GaugeCategory;
}

uint64_t sub_247AC2D9C@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v4 = result;
  if (qword_2576DAEE8 != -1)
    result = swift_once();
  if (qword_2576DCA48)
  {
    v6 = (id)qword_2576DCA48;
    v7 = (void *)sub_247ACE254();
    v8 = (void *)sub_247ACE254();
    v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, v8, 0);

    v10 = sub_247ACE278();
    v12 = v11;

    if (qword_2576DAEC0 != -1)
      swift_once();
    v13 = qword_2576DCA00;
    swift_retain();
    v14 = _s9StorageUI11DeviceClassO7currentACvgZ_0();
    *(_QWORD *)a3 = 1162170950;
    *(_QWORD *)(a3 + 8) = 0xE400000000000000;
    *(_QWORD *)(a3 + 16) = v10;
    *(_QWORD *)(a3 + 24) = v12;
    *(_QWORD *)(a3 + 32) = v4;
    *(_QWORD *)(a3 + 40) = v13;
    *(_BYTE *)(a3 + 48) = 0;
    *(_BYTE *)(a3 + 49) = a2 & 1;
    *(_QWORD *)(a3 + 56) = 0;
    *(_QWORD *)(a3 + 64) = 0;
    *(_QWORD *)(a3 + 72) = v13;
    *(_BYTE *)(a3 + 80) = v14 == 3;
    return swift_retain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for StorageGaugeElementBackground()
{
  return &type metadata for StorageGaugeElementBackground;
}

uint64_t sub_247AC2F2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247AC2F3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  __int16 v5;
  char v6;

  if ((*(_BYTE *)(v1 + 48) & 1) == 0)
    swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB208);
  sub_247ABED08(&qword_2576DB210, &qword_2576DB208, MEMORY[0x24BDEB358]);
  sub_247AC300C();
  result = sub_247ACDF6C();
  *(_QWORD *)a1 = v4;
  *(_WORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 10) = v6;
  return result;
}

unint64_t sub_247AC300C()
{
  unint64_t result;

  result = qword_2576DB218;
  if (!qword_2576DB218)
  {
    result = MEMORY[0x24958B524](&unk_247ACF090, &type metadata for StorageGaugeStripedBackground);
    atomic_store(result, (unint64_t *)&qword_2576DB218);
  }
  return result;
}

ValueMetadata *type metadata accessor for StorageGaugeStripedBackground()
{
  return &type metadata for StorageGaugeStripedBackground;
}

unint64_t sub_247AC3064()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576DB220;
  if (!qword_2576DB220)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB228);
    v2[0] = sub_247ABED08(&qword_2576DB210, &qword_2576DB208, MEMORY[0x24BDEB358]);
    v2[1] = sub_247AC300C();
    result = MEMORY[0x24958B524](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576DB220);
  }
  return result;
}

uint64_t sub_247AC30E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247AC30F8(double a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  unsigned __int8 v12;
  _OWORD v13[2];
  unsigned __int8 v14;
  _BYTE v15[48];

  v2 = sub_247ACDEB8();
  v3 = *(_QWORD *)(v2 - 8);
  result = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((~*(_QWORD *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = (uint64_t)a1 + 3;
  if (__OFADD__((uint64_t)a1, 3))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v7 < 0)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  if ((uint64_t)a1 != -3)
  {
    v8 = 0;
    do
    {
      sub_247ACE038();
      sub_247ACE020();
      sub_247ACE02C();
      v13[0] = v10;
      v13[1] = v11;
      v14 = v12;
      sub_247AC3460((uint64_t)v13, (uint64_t)v15);
      sub_247AC34B4((uint64_t)v15, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_247AC349C);
      if (qword_2576DAED0 != -1)
        swift_once();
      ++v8;
      sub_247ACDEAC();
      sub_247ACDEA0();
      sub_247AC34B4((uint64_t)v13, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_247AC34EC);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      result = sub_247AC34EC(v10, *((uint64_t *)&v10 + 1), v11, *((uint64_t *)&v11 + 1), v12);
    }
    while (v7 != v8);
  }
  return result;
}

uint64_t sub_247AC32F8@<X0>(uint64_t a1@<X8>)
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
  char v11;
  uint64_t v12;
  uint64_t v14;

  v2 = sub_247ACDF48();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB230);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDEE8B0], v2);
  sub_247ACE1C4();
  if (qword_2576DAEC0 != -1)
    swift_once();
  v10 = qword_2576DCA00;
  swift_retain();
  v11 = sub_247ACDFC0();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(a1, v9, v6);
  v12 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576DB238) + 36);
  *(_QWORD *)v12 = v10;
  *(_BYTE *)(v12 + 8) = v11;
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_247AC3460(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BDF1B28] - 8) + 32))(a2, a1);
  return a2;
}

uint64_t sub_247AC349C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 - 2 <= 3)
    return swift_retain();
  return result;
}

uint64_t sub_247AC34B4(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  return a1;
}

uint64_t sub_247AC34EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 - 2 <= 3)
    return swift_release();
  return result;
}

unint64_t sub_247AC3508()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576DB240;
  if (!qword_2576DB240)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB238);
    v2[0] = sub_247ABED08(&qword_2576DB248, &qword_2576DB230, MEMORY[0x24BDF4400]);
    v2[1] = sub_247ABED08(&qword_2576DB250, &qword_2576DB258, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x24958B524](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576DB240);
  }
  return result;
}

uint64_t sub_247AC35A8(uint64_t a1)
{
  return sub_247AC36F0(a1, static Logger.storageUI);
}

uint64_t Logger.storageUI.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_2576DAED8 != -1)
    swift_once();
  v0 = sub_247ACDDB0();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.storageUI);
}

uint64_t static Logger.storageUI.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2576DAED8 != -1)
    swift_once();
  v2 = sub_247ACDDB0();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.storageUI);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
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

uint64_t sub_247AC36CC(uint64_t a1)
{
  return sub_247AC36F0(a1, qword_2576DCA30);
}

uint64_t sub_247AC36F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_247ACDDB0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_247ACDDA4();
}

const char *StorageManagementFeature.domain.getter()
{
  return "StorageManagement";
}

const char *StorageManagementFeature.feature.getter()
{
  return "SpaceForce";
}

uint64_t static StorageManagementFeature.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t StorageManagementFeature.hash(into:)()
{
  return sub_247ACE470();
}

uint64_t StorageManagementFeature.hashValue.getter()
{
  sub_247ACE464();
  sub_247ACE470();
  return sub_247ACE488();
}

uint64_t sub_247AC37F8()
{
  return 1;
}

uint64_t sub_247AC3800()
{
  sub_247ACE464();
  sub_247ACE470();
  return sub_247ACE488();
}

uint64_t sub_247AC3840()
{
  return sub_247ACE470();
}

uint64_t sub_247AC3864()
{
  sub_247ACE464();
  sub_247ACE470();
  return sub_247ACE488();
}

unint64_t sub_247AC38A4()
{
  unint64_t result;

  result = qword_2576DB260;
  if (!qword_2576DB260)
  {
    result = MEMORY[0x24958B524](&protocol conformance descriptor for StorageManagementFeature, &type metadata for StorageManagementFeature);
    atomic_store(result, (unint64_t *)&qword_2576DB260);
  }
  return result;
}

const char *sub_247AC38E8()
{
  return "StorageManagement";
}

const char *sub_247AC38FC()
{
  return "SpaceForce";
}

uint64_t getEnumTagSinglePayload for StorageManagementFeature(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for StorageManagementFeature(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247AC39A4 + 4 * byte_247ACF0E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247AC39C4 + 4 * byte_247ACF0E5[v4]))();
}

_BYTE *sub_247AC39A4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247AC39C4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247AC39CC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247AC39D4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247AC39DC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247AC39E4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_247AC39F0()
{
  return 0;
}

ValueMetadata *type metadata accessor for StorageManagementFeature()
{
  return &type metadata for StorageManagementFeature;
}

uint64_t StorageCategoryIdentifier.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_247AC3A40 + 4 * byte_247ACF1C0[a1]))(0x4C41435F4B534944, 0xE900000000000043);
}

uint64_t sub_247AC3A40()
{
  return 0x4552465F4B534944;
}

uint64_t sub_247AC3A58()
{
  return 0x4553555F4B534944;
}

unint64_t sub_247AC3A70()
{
  return 0xD00000000000001ALL;
}

void StorageCategoryIdentifier.localizedName.getter(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_247AC3CB0()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  if (qword_2576DAEE8 != -1)
    swift_once();
  if (!qword_2576DCA48)
  {
    __break(1u);
    JUMPOUT(0x247AC4808);
  }
  v0 = (id)qword_2576DCA48;
  v1 = (void *)sub_247ACE254();
  v2 = (void *)sub_247ACE254();
  v3 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, v2, 0);

  v4 = sub_247ACE278();
  return v4;
}

uint64_t StorageIdentifier.init(rawValue:)(uint64_t a1)
{
  unsigned __int8 v2;

  swift_bridgeObjectRetain();
  v2 = _s9StorageUI0A18CategoryIdentifierO8rawValueACSgSS_tcfC_0();
  if (v2 != 24)
  {
    swift_bridgeObjectRelease();
    return v2;
  }
  return a1;
}

uint64_t StorageIdentifier.init(categoryIdentifier:)(uint64_t result)
{
  return result;
}

uint64_t static StorageIdentifier.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  return sub_247AC4E44(a1, a2, a3 & 1, a4, a5, a6 & 1);
}

uint64_t StorageIdentifier.hash(into:)(uint64_t a1, unsigned __int8 a2, uint64_t a3, char a4)
{
  if ((a4 & 1) != 0)
  {
    sub_247ACE470();
    return sub_247ACE284();
  }
  else
  {
    sub_247ACE470();
    StorageCategoryIdentifier.rawValue.getter(a2);
    sub_247ACE284();
    return swift_bridgeObjectRelease();
  }
}

uint64_t StorageIdentifier.hashValue.getter(unsigned __int8 a1, uint64_t a2, char a3)
{
  sub_247ACE464();
  sub_247ACE470();
  if ((a3 & 1) != 0)
  {
    sub_247ACE284();
  }
  else
  {
    StorageCategoryIdentifier.rawValue.getter(a1);
    sub_247ACE284();
    swift_bridgeObjectRelease();
  }
  return sub_247ACE488();
}

uint64_t sub_247AC4A74(uint64_t a1, uint64_t a2)
{
  return sub_247AC4E44(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

uint64_t sub_247AC4A90()
{
  uint64_t *v0;
  uint64_t v1;
  char v2;

  v1 = *v0;
  v2 = *((_BYTE *)v0 + 16);
  sub_247ACE464();
  sub_247ACE470();
  if ((v2 & 1) != 0)
  {
    sub_247ACE284();
  }
  else
  {
    StorageCategoryIdentifier.rawValue.getter(v1);
    sub_247ACE284();
    swift_bridgeObjectRelease();
  }
  return sub_247ACE488();
}

uint64_t sub_247AC4B2C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if ((v0[2] & 1) != 0)
  {
    sub_247ACE470();
    return sub_247ACE284();
  }
  else
  {
    sub_247ACE470();
    StorageCategoryIdentifier.rawValue.getter(v1);
    sub_247ACE284();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_247AC4BB8()
{
  uint64_t *v0;
  uint64_t v1;
  char v2;

  v1 = *v0;
  v2 = *((_BYTE *)v0 + 16);
  sub_247ACE464();
  sub_247ACE470();
  if ((v2 & 1) != 0)
  {
    sub_247ACE284();
  }
  else
  {
    StorageCategoryIdentifier.rawValue.getter(v1);
    sub_247ACE284();
    swift_bridgeObjectRelease();
  }
  return sub_247ACE488();
}

void *static StorageCategoryIdentifier.allCases.getter()
{
  return &unk_2519251E0;
}

uint64_t sub_247AC4C5C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s9StorageUI0A18CategoryIdentifierO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_247AC4C88@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = StorageCategoryIdentifier.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_247AC4CB0(_QWORD *a1@<X8>)
{
  *a1 = &unk_2519251E0;
}

uint64_t sub_247AC4CC0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = StorageCategoryIdentifier.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == StorageCategoryIdentifier.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_247ACE440();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_247AC4D48()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_247ACE464();
  StorageCategoryIdentifier.rawValue.getter(v1);
  sub_247ACE284();
  swift_bridgeObjectRelease();
  return sub_247ACE488();
}

uint64_t sub_247AC4DA8()
{
  unsigned __int8 *v0;

  StorageCategoryIdentifier.rawValue.getter(*v0);
  sub_247ACE284();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247AC4DE8()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_247ACE464();
  StorageCategoryIdentifier.rawValue.getter(v1);
  sub_247ACE284();
  swift_bridgeObjectRelease();
  return sub_247ACE488();
}

uint64_t sub_247AC4E44(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  v6 = a4;
  if ((a3 & 1) == 0)
  {
    if ((a6 & 1) == 0)
    {
      v7 = StorageCategoryIdentifier.rawValue.getter(a1);
      v9 = v8;
      if (v7 == StorageCategoryIdentifier.rawValue.getter(v6) && v9 == v10)
      {
        swift_bridgeObjectRelease_n();
        return 1;
      }
      else
      {
        v12 = sub_247ACE440();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v12 & 1;
      }
    }
    return 0;
  }
  if ((a6 & 1) == 0)
    return 0;
  if (a1 == a4 && a2 == a5)
    return 1;
  else
    return sub_247ACE440();
}

uint64_t _s9StorageUI0A18CategoryIdentifierO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_247ACE44C();
  swift_bridgeObjectRelease();
  if (v0 >= 0x18)
    return 24;
  else
    return v0;
}

unint64_t sub_247AC4F70()
{
  unint64_t result;

  result = qword_2576DB268;
  if (!qword_2576DB268)
  {
    result = MEMORY[0x24958B524](&protocol conformance descriptor for StorageIdentifier, &type metadata for StorageIdentifier);
    atomic_store(result, (unint64_t *)&qword_2576DB268);
  }
  return result;
}

unint64_t sub_247AC4FB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576DB270;
  if (!qword_2576DB270)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB278);
    result = MEMORY[0x24958B524](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2576DB270);
  }
  return result;
}

unint64_t sub_247AC5008()
{
  unint64_t result;

  result = qword_2576DB280;
  if (!qword_2576DB280)
  {
    result = MEMORY[0x24958B524](&protocol conformance descriptor for StorageCategoryIdentifier, &type metadata for StorageCategoryIdentifier);
    atomic_store(result, (unint64_t *)&qword_2576DB280);
  }
  return result;
}

uint64_t destroy for StorageIdentifier(uint64_t a1)
{
  return sub_247AC5060(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_247AC5060(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s9StorageUI17StorageIdentifierOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_247AB9ECC(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for StorageIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_247AB9ECC(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_247AC5060(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for StorageIdentifier(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_247AC5060(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorageIdentifier(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StorageIdentifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_247AC51F0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_247AC51F8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for StorageIdentifier()
{
  return &type metadata for StorageIdentifier;
}

uint64_t getEnumTagSinglePayload for StorageCategoryIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE9)
    goto LABEL_17;
  if (a2 + 23 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 23) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 23;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 23;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 23;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x18;
  v8 = v6 - 24;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for StorageCategoryIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 23 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 23) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE8)
    return ((uint64_t (*)(void))((char *)&loc_247AC52F0 + 4 * byte_247ACF1DD[v4]))();
  *a1 = a2 + 23;
  return ((uint64_t (*)(void))((char *)sub_247AC5324 + 4 * byte_247ACF1D8[v4]))();
}

uint64_t sub_247AC5324(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247AC532C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247AC5334);
  return result;
}

uint64_t sub_247AC5340(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247AC5348);
  *(_BYTE *)result = a2 + 23;
  return result;
}

uint64_t sub_247AC534C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247AC5354(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_247AC5360(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StorageCategoryIdentifier()
{
  return &type metadata for StorageCategoryIdentifier;
}

uint64_t Followup.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Followup.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Followup.bundleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Followup.explanation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static Followup.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_247ACE440();
}

uint64_t Followup.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_247ACE284();
  return swift_bridgeObjectRelease();
}

uint64_t Followup.hashValue.getter()
{
  sub_247ACE464();
  swift_bridgeObjectRetain();
  sub_247ACE284();
  swift_bridgeObjectRelease();
  return sub_247ACE488();
}

uint64_t sub_247AC54F4(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_247ACE440();
}

uint64_t sub_247AC5524()
{
  sub_247ACE464();
  swift_bridgeObjectRetain();
  sub_247ACE284();
  swift_bridgeObjectRelease();
  return sub_247ACE488();
}

uint64_t sub_247AC557C()
{
  swift_bridgeObjectRetain();
  sub_247ACE284();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247AC55C0()
{
  sub_247ACE464();
  swift_bridgeObjectRetain();
  sub_247ACE284();
  swift_bridgeObjectRelease();
  return sub_247ACE488();
}

unint64_t sub_247AC5618()
{
  unint64_t result;

  result = qword_2576DB288;
  if (!qword_2576DB288)
  {
    result = MEMORY[0x24958B524](&protocol conformance descriptor for Followup, &type metadata for Followup);
    atomic_store(result, (unint64_t *)&qword_2576DB288);
  }
  return result;
}

uint64_t destroy for Followup()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for Followup(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for Followup(_QWORD *a1, _QWORD *a2)
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

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithTake for Followup(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for Followup(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Followup(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Followup()
{
  return &type metadata for Followup;
}

void sub_247AC58C4()
{
  void *v0;
  id v1;

  v0 = (void *)sub_247ACE254();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  qword_2576DCA48 = (uint64_t)v1;
}

uint64_t _s9StorageUI0A15GaugeLegendViewV8spacingX12CoreGraphics7CGFloatVvpfP_0()
{
  sub_247ABAB48();
  return sub_247ACDE10();
}

uint64_t StorageGaugeLegendView.init(capacity:categories:maxLines:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t result;

  type metadata accessor for StorageGaugeLegendView();
  if (qword_2576DAEA8 != -1)
    swift_once();
  sub_247ABAB48();
  sub_247ACDE10();
  if (qword_2576DAEA0 != -1)
    swift_once();
  result = sub_247ACDE10();
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t type metadata accessor for StorageGaugeLegendView()
{
  uint64_t result;

  result = qword_2576DB2F0;
  if (!qword_2576DB2F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t StorageGaugeLegendView.body.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for StorageGaugeLegendView();
  __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  sub_247ACDE1C();
  sub_247ACDE1C();
  v3 = *(_QWORD *)(v1 + 16);
  *a1 = v6;
  a1[1] = v6;
  a1[2] = v3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB290);
  return sub_247AC5B70(v1, (uint64_t)a1 + *(int *)(v4 + 44));
}

uint64_t sub_247AC5B70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v4 = type metadata accessor for StorageGaugeLegendView();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB358);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(a1 + 8);
  swift_bridgeObjectRetain();
  sub_247ABD4D4(&v19);
  v11 = swift_bridgeObjectRetain();
  v12 = sub_247ABCDA8(v11);
  swift_release_n();
  v13 = sub_247AC67A8(v12);
  swift_bridgeObjectRelease();
  v19 = v13;
  swift_getKeyPath();
  sub_247ABEE38(a1, (uint64_t)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for StorageGaugeLegendView);
  v14 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v15 = swift_allocObject();
  sub_247AC6B04((uint64_t)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_247AC6B48;
  *(_QWORD *)(v16 + 24) = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB368);
  sub_247ABED08(&qword_2576DB138, &qword_2576DB128, MEMORY[0x24BEE12D8]);
  sub_247ABED48();
  sub_247AC6654();
  sub_247ACE20C();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
}

uint64_t sub_247AC5D98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247AC5DA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v20[2];

  v8 = type metadata accessor for StorageGaugeLegendItemView();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB378);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((float)((float)*(uint64_t *)(a2 + 32) / (float)*a3) <= 0.001)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a4, 1, 1, v11);
  sub_247ABEF38(a2);
  if (qword_2576DAEB0 != -1)
    swift_once();
  v15 = qword_2576DC9F0;
  v16 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v10 + 2) = *(_OWORD *)(a2 + 32);
  *((_OWORD *)v10 + 3) = v16;
  *((_OWORD *)v10 + 4) = *(_OWORD *)(a2 + 64);
  v10[80] = *(_BYTE *)(a2 + 80);
  v17 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v10 = *(_OWORD *)a2;
  *((_OWORD *)v10 + 1) = v17;
  *((_QWORD *)v10 + 11) = a1;
  v20[1] = v15;
  sub_247ABAB48();
  sub_247ACDE10();
  v18 = *(_QWORD *)(a2 + 64);
  sub_247ABEE38((uint64_t)v10, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for StorageGaugeLegendItemView);
  *(_QWORD *)&v14[*(int *)(v11 + 36)] = v18;
  sub_247AC6BC0((uint64_t)v10);
  sub_247AC6BFC((uint64_t)v14, a4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a4, 0, 1, v11);
}

uint64_t sub_247AC5FA4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  sub_247ACDE1C();
  sub_247ACDE1C();
  v3 = *(_QWORD *)(v1 + 16);
  *a1 = v6;
  a1[1] = v6;
  a1[2] = v3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB290);
  return sub_247AC5B70(v1, (uint64_t)a1 + *(int *)(v4 + 44));
}

char *initializeBufferWithCopyOfBuffer for StorageGaugeLegendView(char *a1, char *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v7;
    *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
    v8 = *(int *)(a3 + 28);
    v9 = &a1[v8];
    v10 = &a2[v8];
    swift_bridgeObjectRetain();
    v11 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    v12(&a1[*(int *)(a3 + 32)], &a2[*(int *)(a3 + 32)], v11);
  }
  return a1;
}

uint64_t destroy for StorageGaugeLegendView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v7(v4, v5);
  return ((uint64_t (*)(uint64_t, uint64_t))v7)(a1 + *(int *)(a2 + 32), v5);
}

char *initializeWithCopy for StorageGaugeLegendView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  v7 = *(int *)(a3 + 28);
  v8 = &a1[v7];
  v9 = &a2[v7];
  swift_bridgeObjectRetain();
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  v11(&a1[*(int *)(a3 + 32)], &a2[*(int *)(a3 + 32)], v10);
  return a1;
}

char *assignWithCopy for StorageGaugeLegendView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  v6 = *(int *)(a3 + 28);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[*(int *)(a3 + 32)], &a2[*(int *)(a3 + 32)], v9);
  return a1;
}

uint64_t initializeWithTake for StorageGaugeLegendView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + *(int *)(a3 + 32), a2 + *(int *)(a3 + 32), v9);
  return a1;
}

char *assignWithTake for StorageGaugeLegendView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  v7 = *(int *)(a3 + 28);
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  v11(&a1[*(int *)(a3 + 32)], &a2[*(int *)(a3 + 32)], v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for StorageGaugeLegendView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247AC6420(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for StorageGaugeLegendView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247AC64AC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void sub_247AC6524()
{
  unint64_t v0;

  sub_247ABAAF0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

unint64_t sub_247AC65B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576DB338;
  if (!qword_2576DB338)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB290);
    v2[0] = sub_247ABED08(&qword_2576DB340, &qword_2576DB348, MEMORY[0x24BDEB9A8]);
    v2[1] = sub_247AC6678(&qword_2576DB350, &qword_2576DB358, sub_247AC6654, MEMORY[0x24BDF4A08]);
    result = MEMORY[0x24958B524](MEMORY[0x24BDEC550], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576DB338);
  }
  return result;
}

uint64_t sub_247AC6654()
{
  return sub_247AC6678(&qword_2576DB360, &qword_2576DB368, (uint64_t (*)(void))sub_247AC66DC, MEMORY[0x24BDF5578]);
}

uint64_t sub_247AC6678(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x24958B524](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247AC66DC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576DB370;
  if (!qword_2576DB370)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB378);
    v2[0] = sub_247AC6760();
    v2[1] = sub_247ABED08(&qword_2576DB388, &qword_2576DB390, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x24958B524](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576DB370);
  }
  return result;
}

unint64_t sub_247AC6760()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576DB380;
  if (!qword_2576DB380)
  {
    v1 = type metadata accessor for StorageGaugeLegendItemView();
    result = MEMORY[0x24958B524](&unk_247ACEB68, v1);
    atomic_store(result, (unint64_t *)&qword_2576DB380);
  }
  return result;
}

uint64_t sub_247AC67A8(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v26 = *(_QWORD *)(result + 16);
  if (v26)
  {
    result = swift_bridgeObjectRetain();
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = (uint64_t)(v1 + 4);
    v25 = result;
    v6 = v1;
    while (1)
    {
      v7 = *(_QWORD *)(result + v2 + 40);
      v8 = *(_QWORD *)(result + v2 + 56);
      v9 = *(_QWORD *)(result + v2 + 72);
      v10 = *(_QWORD *)(result + v2 + 96);
      v11 = *(_QWORD *)(result + v2 + 104);
      v32 = *(_QWORD *)(result + v2 + 48);
      v33 = *(_QWORD *)(result + v2 + 32);
      v31 = *(_QWORD *)(result + v2 + 64);
      v29 = *(_BYTE *)(result + v2 + 81);
      v30 = *(_BYTE *)(result + v2 + 80);
      v28 = *(_QWORD *)(result + v2 + 88);
      v27 = *(_BYTE *)(result + v2 + 112);
      if (v3)
      {
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        result = swift_retain();
        v1 = v6;
        v12 = __OFSUB__(v3--, 1);
        if (v12)
          goto LABEL_29;
      }
      else
      {
        v13 = v6[3];
        if ((uint64_t)((v13 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_30;
        v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
        if (v14 <= 1)
          v15 = 1;
        else
          v15 = v14;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB398);
        v1 = (_QWORD *)swift_allocObject();
        v16 = (uint64_t)(_swift_stdlib_malloc_size(v1) - 32) / 96;
        v1[2] = v15;
        v1[3] = 2 * v16;
        v17 = v1 + 4;
        v18 = v6[3] >> 1;
        v19 = 12 * v18;
        v20 = (v16 & 0x7FFFFFFFFFFFFFFFLL) - v18;
        v5 = (uint64_t)&v1[12 * v18 + 4];
        if (v6[2])
        {
          v21 = v1 < v6 || v17 >= &v6[v19 + 4];
          if (!v21 && v1 == v6)
          {
            swift_retain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
          }
          else
          {
            memmove(v17, v6 + 4, v19 * 8);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_retain();
          }
          swift_retain();
          v6[2] = 0;
        }
        else
        {
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_retain();
        }
        result = swift_release();
        v12 = __OFSUB__(v20, 1);
        v3 = v20 - 1;
        if (v12)
        {
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
          return result;
        }
      }
      *(_QWORD *)v5 = v4;
      *(_QWORD *)(v5 + 8) = v33;
      *(_QWORD *)(v5 + 16) = v7;
      *(_QWORD *)(v5 + 24) = v32;
      *(_QWORD *)(v5 + 32) = v8;
      *(_QWORD *)(v5 + 40) = v31;
      *(_QWORD *)(v5 + 48) = v9;
      *(_BYTE *)(v5 + 56) = v30;
      *(_BYTE *)(v5 + 57) = v29;
      *(_QWORD *)(v5 + 64) = v28;
      *(_QWORD *)(v5 + 72) = v10;
      *(_QWORD *)(v5 + 80) = v11;
      *(_BYTE *)(v5 + 88) = v27;
      v5 += 96;
      v2 += 88;
      v6 = v1;
      ++v4;
      result = v25;
      if (v26 == v4)
      {
        result = swift_bridgeObjectRelease();
        goto LABEL_25;
      }
    }
  }
  v3 = 0;
LABEL_25:
  v22 = v1[3];
  if (v22 >= 2)
  {
    v23 = v22 >> 1;
    v12 = __OFSUB__(v23, v3);
    v24 = v23 - v3;
    if (v12)
      goto LABEL_31;
    v1[2] = v24;
  }
  return (uint64_t)v1;
}

uint64_t sub_247AC6A58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = type metadata accessor for StorageGaugeLegendView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 28);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v3 + *(int *)(v1 + 32), v5);
  return swift_deallocObject();
}

uint64_t sub_247AC6B04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StorageGaugeLegendView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247AC6B48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for StorageGaugeLegendView() - 8) + 80);
  return sub_247AC5DA8(a1, a2, (uint64_t *)(v3 + ((v7 + 16) & ~v7)), a3);
}

uint64_t sub_247AC6B9C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247AC6BC0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for StorageGaugeLegendItemView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_247AC6BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247AC6C44(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
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
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    *(_BYTE *)(a1 + 49) = *((_BYTE *)a2 + 49);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    *(_QWORD *)(a1 + 72) = a2[9];
    v10 = a2 + 13;
    v11 = a2[13];
    *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    if (v11)
    {
      v12 = a2[14];
      *(_QWORD *)(a1 + 104) = v11;
      *(_QWORD *)(a1 + 112) = v12;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(a1 + 104) = *v10;
    }
    *(_BYTE *)(a1 + 120) = *((_BYTE *)a2 + 120);
    *(_QWORD *)(a1 + 128) = a2[16];
    v14 = *(int *)(a3 + 36);
    v15 = (_QWORD *)(a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB188);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_247ACDDEC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v18 = *(int *)(a3 + 40);
    v19 = a1 + v18;
    v20 = (uint64_t)a2 + v18;
    v21 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
  }
  return a1;
}

uint64_t sub_247AC6DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (*(_QWORD *)(a1 + 104))
    swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB188);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_247ACDDEC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = a1 + *(int *)(a2 + 40);
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

uint64_t sub_247AC6EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v9 = (_OWORD *)(a2 + 104);
  v10 = *(_QWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  if (v10)
  {
    v11 = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 104) = v10;
    *(_QWORD *)(a1 + 112) = v11;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 104) = *v9;
  }
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v12 = *(int *)(a3 + 36);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB188);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_247ACDDEC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v16 = *(int *)(a3 + 40);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t sub_247AC704C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

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
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  v6 = *(_QWORD *)(a1 + 104);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v7 = *(_QWORD *)(a2 + 104);
  if (v6)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a2 + 112);
      *(_QWORD *)(a1 + 104) = v7;
      *(_QWORD *)(a1 + 112) = v8;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 104) = v7;
    *(_QWORD *)(a1 + 112) = v9;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
LABEL_8:
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v10 = *(int *)(a3 + 36);
    v11 = (_QWORD *)(a1 + v10);
    v12 = (_QWORD *)(a2 + v10);
    sub_247ABEEFC(a1 + v10, &qword_2576DB188);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB188);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_247ACDDEC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v14 = *(int *)(a3 + 40);
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t sub_247AC7268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v7;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  v8 = *(_QWORD *)(a2 + 104);
  if (v8)
  {
    v9 = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 104) = v8;
    *(_QWORD *)(a1 + 112) = v9;
  }
  else
  {
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  }
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  v10 = *(int *)(a3 + 36);
  v11 = (void *)(a1 + v10);
  v12 = (const void *)(a2 + v10);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB188);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_247ACDDEC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v11, v12, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  v15 = *(int *)(a3 + 40);
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  return a1;
}

uint64_t sub_247AC739C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

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
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  v9 = *(_QWORD *)(a2 + 104);
  v10 = *(_QWORD *)(a1 + 104);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  if (v10)
  {
    if (v9)
    {
      v11 = *(_QWORD *)(a2 + 112);
      *(_QWORD *)(a1 + 104) = v9;
      *(_QWORD *)(a1 + 112) = v11;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v9)
  {
    v12 = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 104) = v9;
    *(_QWORD *)(a1 + 112) = v12;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
LABEL_8:
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_release();
  if (a1 != a2)
  {
    v13 = *(int *)(a3 + 36);
    v14 = (void *)(a1 + v13);
    v15 = (const void *)(a2 + v13);
    sub_247ABEEFC(a1 + v13, &qword_2576DB188);
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB188);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_247ACDDEC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
  }
  v18 = *(int *)(a3 + 40);
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 40))(v19, v20, v21);
  return a1;
}

uint64_t sub_247AC7570()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247AC757C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB3A0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 36);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 40);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_247AC7624()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247AC7630(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB3A0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 36);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 40);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for StorageGaugeItemView()
{
  uint64_t result;

  result = qword_2576DB400;
  if (!qword_2576DB400)
    return swift_getSingletonMetadata();
  return result;
}

void sub_247AC7710()
{
  unint64_t v0;
  unint64_t v1;

  sub_247AC77BC();
  if (v0 <= 0x3F)
  {
    sub_247ABAAF0();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_247AC77BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576DB410)
  {
    sub_247ACDDEC();
    v0 = sub_247ACDDF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576DB410);
  }
}

uint64_t sub_247AC7810()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_247AC7820()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  double v9;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15[2];

  v15[1] = *(double *)MEMORY[0x24BDAC8D0];
  v0 = sub_247ACDDEC();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - v5;
  v14 = 1.0;
  v15[0] = 1.0;
  v12 = 1.0;
  v13 = 1.0;
  sub_247AC8CCC();
  swift_retain();
  v7 = sub_247ACE344();
  objc_msgSend((id)v7, sel_getRed_green_blue_alpha_, v15, &v14, &v13, &v12);

  type metadata accessor for StorageGaugeItemView();
  sub_247AC8D08((uint64_t)v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BDEB400], v0);
  LOBYTE(v7) = sub_247ACDDE0();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  v9 = 1.0 / v12;
  if ((v7 & 1) == 0)
    v9 = -v9;
  if (v15[0] * 0.2 + v14 * 0.7 + v13 * 0.07 + v9 <= 0.5)
    return sub_247ACE14C();
  else
    return sub_247ACE134();
}

uint64_t sub_247AC79EC@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
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
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  __int128 v23;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v2 = v1;
  v26 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB458);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB460);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v25 - v10;
  *v5 = sub_247ACE218();
  v5[1] = v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB468);
  sub_247AC7C6C((uint64_t)v2, (uint64_t)v5 + *(int *)(v13 + 44));
  v14 = v2[3];
  *(_QWORD *)&v27 = v2[2];
  *((_QWORD *)&v27 + 1) = v14;
  sub_247AC8818();
  sub_247ABB360();
  sub_247ACE098();
  sub_247ABEEFC((uint64_t)v5, &qword_2576DB458);
  v15 = v2[4];
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1490]), sel_init);
  objc_msgSend(v16, sel_setCountStyle_, 0);
  v17 = objc_msgSend(v16, sel_stringFromByteCount_, v15);
  v18 = sub_247ACE278();
  v20 = v19;

  *(_QWORD *)&v27 = v18;
  *((_QWORD *)&v27 + 1) = v20;
  sub_247ACDEC4();
  swift_bridgeObjectRelease();
  sub_247ABEEFC((uint64_t)v9, &qword_2576DB460);
  type metadata accessor for StorageGaugeItemView();
  __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  sub_247ACDE1C();
  sub_247ACE218();
  sub_247ACDE34();
  v21 = v26;
  sub_247ABEEB8((uint64_t)v11, v26, &qword_2576DB460);
  v22 = (_OWORD *)(v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576DB478) + 36));
  v23 = v28;
  *v22 = v27;
  v22[1] = v23;
  v22[2] = v29;
  return sub_247ABEEFC((uint64_t)v11, &qword_2576DB460);
}

uint64_t sub_247AC7C6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t (**v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
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
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  unsigned __int8 v99;
  char v100;
  uint64_t v101;

  v83 = a2;
  v82 = sub_247ACDF78();
  v80 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v77 = (uint64_t *)((char *)&v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = type metadata accessor for StorageGaugeItemView();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB480);
  v74 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v73 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB488);
  MEMORY[0x24BDAC7A8](v85);
  v84 = (char *)&v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB490);
  v79 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v76 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB498);
  v11 = MEMORY[0x24BDAC7A8](v78);
  v87 = (uint64_t)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v86 = (uint64_t)&v69 - v13;
  v14 = *(_QWORD *)(a1 + 8);
  v15 = *(_QWORD *)(a1 + 16);
  v16 = *(_QWORD *)(a1 + 24);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(char **)(a1 + 40);
  v19 = *(_BYTE *)(a1 + 48);
  LOBYTE(v13) = *(_BYTE *)(a1 + 49);
  v20 = *(_QWORD *)(a1 + 56);
  v21 = *(_QWORD *)(a1 + 64);
  v22 = *(_QWORD *)(a1 + 72);
  v23 = *(_BYTE *)(a1 + 80);
  v88 = *(_QWORD *)a1;
  v89 = v14;
  v90 = v15;
  v91 = v16;
  v92 = v17;
  v93 = v18;
  LOBYTE(v94) = v19;
  BYTE1(v94) = v13;
  v95 = v20;
  v96 = v21;
  v97 = v22;
  LOBYTE(v98) = v23;
  sub_247AC8864(a1, (uint64_t)v7);
  v24 = *(unsigned __int8 *)(v5 + 80);
  v72 = ((v24 + 16) & ~v24) + v6;
  v25 = (v24 + 16) & ~v24;
  v71 = v24 | 7;
  v26 = swift_allocObject();
  v27 = v25;
  v70 = v25;
  sub_247AC88AC((uint64_t)v7, v26 + v25);
  sub_247AC891C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v28 = v73;
  sub_247ACE080();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_247AC8864(a1, (uint64_t)v7);
  v29 = swift_allocObject();
  sub_247AC88AC((uint64_t)v7, v29 + v27);
  v30 = v74;
  v31 = v84;
  v32 = v75;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v84, v28, v75);
  v33 = (uint64_t (**)(uint64_t))&v31[*(int *)(v85 + 36)];
  *v33 = sub_247AC8964;
  v33[1] = (uint64_t (*)(uint64_t))v29;
  (*(void (**)(char *, uint64_t))(v30 + 8))(v28, v32);
  v34 = *(_QWORD *)(a1 + 128);
  v100 = *(_BYTE *)(a1 + 120);
  v101 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB4A8);
  sub_247ACE1AC();
  sub_247AC8864(a1, (uint64_t)v7);
  v35 = swift_allocObject();
  sub_247AC88AC((uint64_t)v7, v35 + v70);
  v36 = sub_247ACE1B8();
  v37 = v77;
  *v77 = v36;
  v38 = v80;
  v39 = v82;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v80 + 104))(v37, *MEMORY[0x24BDF02C0], v82);
  sub_247AC8AF8();
  sub_247AC8BC8();
  v40 = v76;
  v41 = (uint64_t)v84;
  sub_247ACE0A4();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t *, uint64_t))(v38 + 8))(v37, v39);
  sub_247ABEEFC(v41, &qword_2576DB488);
  v42 = *(_QWORD *)(a1 + 40);
  swift_retain();
  LOBYTE(v41) = sub_247ACDFC0();
  v43 = v79;
  v44 = v87;
  v45 = v81;
  (*(void (**)(uint64_t, char *, uint64_t))(v79 + 16))(v87, v40, v81);
  v46 = v44 + *(int *)(v78 + 36);
  *(_QWORD *)v46 = v42;
  *(_BYTE *)(v46 + 8) = v41;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v40, v45);
  v47 = v86;
  sub_247AC8C0C(v44, v86);
  if (*(_BYTE *)(a1 + 49) == 1)
  {
    v48 = sub_247ACDF9C();
    v49 = sub_247ACDFB4();
    v50 = sub_247ACDFA8();
    sub_247ACDFA8();
    if (sub_247ACDFA8() != v48)
      v50 = sub_247ACDFA8();
    sub_247ACDFA8();
    if (sub_247ACDFA8() != v49)
      v50 = sub_247ACDFA8();
    sub_247AC85CC(a1, (uint64_t)&v88);
    v51 = v89;
    v81 = v88;
    v52 = v90;
    v53 = v91;
    v80 = v92;
    v54 = v93;
    v55 = v94;
    v79 = v95;
    v78 = v96;
    v77 = v98;
    LODWORD(v76) = v99;
    v56 = v50;
    v57 = 256;
    if (!BYTE1(v97))
      v57 = 0;
    v58 = v57 | v97;
    v59 = 0x10000;
    if (!BYTE2(v97))
      v59 = 0;
    v60 = v58 | v59;
  }
  else
  {
    v56 = 0;
    v81 = 0;
    v51 = 0;
    v52 = 0;
    v53 = 0;
    v80 = 0;
    v54 = 0;
    v55 = 0;
    v79 = 0;
    v78 = 0;
    v60 = 0;
    v77 = 0;
    LODWORD(v76) = 0;
  }
  v61 = v87;
  sub_247ABEEB8(v47, v87, &qword_2576DB498);
  v62 = v61;
  v63 = v83;
  sub_247ABEEB8(v62, v83, &qword_2576DB498);
  v64 = v63 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576DB4C8) + 48);
  v65 = v81;
  *(_QWORD *)v64 = v56;
  *(_QWORD *)(v64 + 8) = v65;
  *(_QWORD *)(v64 + 16) = v51;
  *(_QWORD *)(v64 + 24) = v52;
  v85 = v53;
  v66 = v80;
  *(_QWORD *)(v64 + 32) = v53;
  *(_QWORD *)(v64 + 40) = v66;
  *(_QWORD *)(v64 + 48) = v54;
  *(_QWORD *)(v64 + 56) = v55;
  v84 = v54;
  v82 = v56;
  v67 = v78;
  *(_QWORD *)(v64 + 64) = v79;
  *(_QWORD *)(v64 + 72) = v67;
  *(_QWORD *)(v64 + 80) = v60;
  *(_QWORD *)(v64 + 88) = v77;
  *(_BYTE *)(v64 + 96) = (_BYTE)v76;
  sub_247AC8C54(v56, v65, v51, v52, v53);
  sub_247ABEEFC(v86, &qword_2576DB498);
  sub_247AC8C90(v82, v65, v51, v52, v85);
  return sub_247ABEEFC(v87, &qword_2576DB498);
}

uint64_t sub_247AC8444(uint64_t result)
{
  void (*v1)(_OWORD *);
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v1 = *(void (**)(_OWORD *))(result + 104);
  if (v1)
  {
    if (*(_BYTE *)(result + 80) == 1)
    {
      v2 = *(_OWORD *)(result + 16);
      v3 = *(_QWORD *)(result + 32);
      v4 = *(_QWORD *)(result + 40);
      v5 = *(_BYTE *)(result + 48);
      v6 = *(_BYTE *)(result + 49);
      v7 = *(_QWORD *)(result + 56);
      v8 = *(_QWORD *)(result + 64);
      v9 = *(_QWORD *)(result + 72);
      v10[0] = *(_OWORD *)result;
      v10[1] = v2;
      v11 = v3;
      v12 = v4;
      v13 = v5;
      v14 = v6;
      v15 = v7;
      v16 = v8;
      v17 = v9;
      v18 = 1;
      swift_retain();
      v1(v10);
      return sub_247ABE10C((uint64_t)v1);
    }
  }
  return result;
}

uint64_t sub_247AC84E8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_BYTE *)(a2 + 80) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB4A8);
    return sub_247ACE1A0();
  }
  return result;
}

uint64_t sub_247AC8548@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_BYTE *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 49);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_BYTE *)(a1 + 80);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_QWORD *)(a2 + 8) = v2;
  *(_QWORD *)(a2 + 16) = v3;
  *(_QWORD *)(a2 + 24) = v4;
  *(_QWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 40) = v6;
  *(_BYTE *)(a2 + 48) = v7;
  *(_BYTE *)(a2 + 49) = v8;
  *(_QWORD *)(a2 + 56) = v9;
  *(_QWORD *)(a2 + 64) = v10;
  *(_QWORD *)(a2 + 72) = v11;
  *(_BYTE *)(a2 + 80) = v12;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_247AC85CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;
  char v24;
  char v25;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1490]), sel_init);
  objc_msgSend(v4, sel_setCountStyle_, 0);
  v5 = objc_msgSend(v4, sel_stringFromByteCount_, v3);
  sub_247ACE278();

  sub_247ABB360();
  v6 = sub_247ACE05C();
  v8 = v7;
  v10 = v9 & 1;
  sub_247ACE008();
  v11 = sub_247ACE050();
  v13 = v12;
  v15 = v14;
  swift_release();
  sub_247ABB3E4(v6, v8, v10);
  swift_bridgeObjectRelease();
  sub_247AC7820();
  v16 = sub_247ACE044();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  swift_release();
  sub_247ABB3E4(v11, v13, v15 & 1);
  swift_bridgeObjectRelease();
  LOBYTE(v11) = sub_247ACDFCC();
  v23 = sub_247ACDFE4();
  v24 = sub_247ACDFD8();
  sub_247ACDFD8();
  if (sub_247ACDFD8() != v11)
    v24 = sub_247ACDFD8();
  sub_247ACDFD8();
  if (sub_247ACDFD8() != v23)
    v24 = sub_247ACDFD8();
  v25 = v20 & 1;
  *(_QWORD *)a2 = v16;
  *(_QWORD *)(a2 + 8) = v18;
  *(_BYTE *)(a2 + 16) = v25;
  *(_QWORD *)(a2 + 24) = v22;
  *(_BYTE *)(a2 + 32) = v24;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_BYTE *)(a2 + 72) = 1;
  *(_WORD *)(a2 + 73) = 257;
  *(_QWORD *)(a2 + 80) = 0;
  *(_BYTE *)(a2 + 88) = 1;
  sub_247ABB4B8(v16, v18, v25);
  swift_bridgeObjectRetain();
  sub_247ABB3E4(v16, v18, v25);
  return swift_bridgeObjectRelease();
}

unint64_t sub_247AC8818()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576DB470;
  if (!qword_2576DB470)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB458);
    result = MEMORY[0x24958B524](MEMORY[0x24BDF4750], v1);
    atomic_store(result, (unint64_t *)&qword_2576DB470);
  }
  return result;
}

uint64_t sub_247AC8864(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StorageGaugeItemView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247AC88AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StorageGaugeItemView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247AC88F0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for StorageGaugeItemView() - 8) + 80);
  return sub_247AC8444(v0 + ((v1 + 16) & ~v1));
}

unint64_t sub_247AC891C()
{
  unint64_t result;

  result = qword_2576DB4A0;
  if (!qword_2576DB4A0)
  {
    result = MEMORY[0x24958B524](&unk_247ACF020, &type metadata for StorageGaugeElementBackground);
    atomic_store(result, (unint64_t *)&qword_2576DB4A0);
  }
  return result;
}

uint64_t sub_247AC8964(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for StorageGaugeItemView() - 8) + 80);
  return sub_247AC84E8(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for StorageGaugeItemView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (*(_QWORD *)(v3 + 104))
    swift_release();
  swift_release();
  v4 = v3 + *(int *)(v1 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB188);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_247ACDDEC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  v6 = v3 + *(int *)(v1 + 40);
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2576DAF40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  return swift_deallocObject();
}

uint64_t sub_247AC8ABC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for StorageGaugeItemView() - 8) + 80);
  return sub_247AC8548(v1 + ((v3 + 16) & ~v3), a1);
}

unint64_t sub_247AC8AF8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2576DB4B0;
  if (!qword_2576DB4B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB488);
    v2[2] = &type metadata for StorageGaugeElementBackground;
    v2[3] = sub_247AC891C();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_247AC8B84();
    result = MEMORY[0x24958B524](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576DB4B0);
  }
  return result;
}

unint64_t sub_247AC8B84()
{
  unint64_t result;

  result = qword_2576DB4B8;
  if (!qword_2576DB4B8)
  {
    result = MEMORY[0x24958B524](MEMORY[0x24BDEF7D0], MEMORY[0x24BDEF7E0]);
    atomic_store(result, (unint64_t *)&qword_2576DB4B8);
  }
  return result;
}

unint64_t sub_247AC8BC8()
{
  unint64_t result;

  result = qword_2576DB4C0;
  if (!qword_2576DB4C0)
  {
    result = MEMORY[0x24958B524](&unk_247ACED2C, &type metadata for StorageGaugeItemPopoverView);
    atomic_store(result, (unint64_t *)&qword_2576DB4C0);
  }
  return result;
}

uint64_t sub_247AC8C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB498);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247AC8C54(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t result;

  if (a5)
  {
    sub_247ABB4B8(a2, a3, a4 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_247AC8C90(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t result;

  if (a5)
  {
    sub_247ABB3E4(a2, a3, a4 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_247AC8CCC()
{
  unint64_t result;

  result = qword_2576DB4D0;
  if (!qword_2576DB4D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2576DB4D0);
  }
  return result;
}

uint64_t sub_247AC8D08@<X0>(uint64_t a1@<X8>)
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
  v4 = sub_247ACDF30();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB188);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247ABEEB8(v2, (uint64_t)v10, &qword_2576DB188);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_247ACDDEC();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_247ACE338();
    v14 = sub_247ACDF90();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_247ACAC5C(0x686353726F6C6F43, 0xEB00000000656D65, &v20);
      sub_247ACE35C();
      _os_log_impl(&dword_247AB7000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24958B5A8](v18, -1, -1);
      MEMORY[0x24958B5A8](v16, -1, -1);
    }

    sub_247ACDF24();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_247AC8F4C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576DB4D8;
  if (!qword_2576DB4D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB478);
    v2[0] = sub_247AC8FB8();
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x24958B524](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576DB4D8);
  }
  return result;
}

unint64_t sub_247AC8FB8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576DB4E0;
  if (!qword_2576DB4E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576DB460);
    v2[0] = sub_247AC8818();
    v2[1] = sub_247AC9024();
    result = MEMORY[0x24958B524](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576DB4E0);
  }
  return result;
}

unint64_t sub_247AC9024()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576DB4E8;
  if (!qword_2576DB4E8)
  {
    v1 = sub_247ACDF84();
    result = MEMORY[0x24958B524](MEMORY[0x24BDF1078], v1);
    atomic_store(result, (unint64_t *)&qword_2576DB4E8);
  }
  return result;
}

id sub_247AC906C()
{
  uint64_t v0;
  id result;

  type metadata accessor for FollowupMonitor();
  v0 = swift_allocObject();
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1B3A8]), sel_init);
  *(_QWORD *)(v0 + 16) = result;
  static FollowupMonitor.shared = v0;
  return result;
}

uint64_t *FollowupMonitor.shared.unsafeMutableAddressor()
{
  if (qword_2576DAEF0 != -1)
    swift_once();
  return &static FollowupMonitor.shared;
}

uint64_t static FollowupMonitor.shared.getter()
{
  if (qword_2576DAEF0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t FollowupMonitor.storageFollowups()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 168) = v0;
  return swift_task_switch();
}

uint64_t sub_247AC9154()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[21] + 16);
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_247AC91EC;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_247AC98B0;
  v3[3] = &block_descriptor;
  v3[4] = v2;
  objc_msgSend(v1, sel_pendingFollowUpItemsWithCompletion_, v3);
  return swift_continuation_await();
}

uint64_t sub_247AC91EC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 176) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_247AC924C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v1 = v0 + 120;
  v2 = *(_QWORD *)(v0 + 120);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    v2 = MEMORY[0x24BEE4AF8];
  }
  v3 = MEMORY[0x24BEE4AF8];
  v24 = MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(v2 + 16);
  if (v4)
  {
    v5 = (_QWORD *)(v1 + 32);
    v6 = v2 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_247AC996C(v6, v1 - 40);
      sub_247AC996C(v1 - 40, v1);
      sub_247AC99A8();
      if ((swift_dynamicCast() & 1) == 0)
        *v5 = 0;
      v7 = __swift_destroy_boxed_opaque_existential_0(v1 - 40);
      if (*v5)
      {
        MEMORY[0x24958AFC0](v7);
        if (*(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_247ACE2CC();
        sub_247ACE2E4();
        sub_247ACE2C0();
      }
      v6 += 32;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    v8 = v24;
    v3 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v8 = MEMORY[0x24BEE4AF8];
  }
  result = swift_bridgeObjectRelease();
  v25 = v3;
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_247ACE3F8();
    result = swift_bridgeObjectRelease();
    if (v10)
      goto LABEL_16;
LABEL_31:
    swift_bridgeObjectRelease();
    v20 = MEMORY[0x24BEE4AF8];
LABEL_32:
    sub_247AC9A7C(v20, 0xD000000000000015, 0x8000000247ACFE30);
    v22 = v21;
    swift_release();
    return (*(uint64_t (**)(uint64_t))(v23 + 8))(v22);
  }
  v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v10)
    goto LABEL_31;
LABEL_16:
  if (v10 >= 1)
  {
    v11 = 0;
    while (1)
    {
      if ((v8 & 0xC000000000000001) != 0)
        v12 = (id)MEMORY[0x24958B0BC](v11, v8);
      else
        v12 = *(id *)(v8 + 8 * v11 + 32);
      v13 = v12;
      v14 = objc_msgSend(v12, sel_uniqueIdentifier);
      if (v14)
      {
        v15 = v14;
        v16 = sub_247ACE278();
        v18 = v17;

        if (v16 == 0xD000000000000027 && v18 == 0x8000000247ACFE50)
        {
          swift_bridgeObjectRelease();
LABEL_28:
          sub_247ACE3BC();
          sub_247ACE3D4();
          sub_247ACE3E0();
          sub_247ACE3C8();
          goto LABEL_19;
        }
        v19 = sub_247ACE440();
        swift_bridgeObjectRelease();
        if ((v19 & 1) != 0)
          goto LABEL_28;
      }

LABEL_19:
      if (v10 == ++v11)
      {
        swift_bridgeObjectRelease();
        v20 = v25;
        goto LABEL_32;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247AC9578()
{
  uint64_t v0;
  void *v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v1 = *(void **)(v0 + 176);
  swift_willThrow();

  swift_bridgeObjectRelease();
  v2 = MEMORY[0x24BEE4AF8];
  v22 = MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
  if (v3)
  {
    v4 = (_QWORD *)(v0 + 152);
    swift_bridgeObjectRetain();
    v5 = v2 + 32;
    do
    {
      sub_247AC996C(v5, v0 + 80);
      sub_247AC996C(v0 + 80, v0 + 120);
      sub_247AC99A8();
      if ((swift_dynamicCast() & 1) == 0)
        *v4 = 0;
      v6 = __swift_destroy_boxed_opaque_existential_0(v0 + 80);
      if (*v4)
      {
        MEMORY[0x24958AFC0](v6);
        if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_247ACE2CC();
        sub_247ACE2E4();
        sub_247ACE2C0();
      }
      v5 += 32;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    v7 = v22;
    v2 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = MEMORY[0x24BEE4AF8];
  }
  result = swift_bridgeObjectRelease();
  v23 = v2;
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = sub_247ACE3F8();
    result = swift_bridgeObjectRelease();
    if (v9)
      goto LABEL_14;
LABEL_29:
    swift_bridgeObjectRelease();
    v19 = MEMORY[0x24BEE4AF8];
LABEL_30:
    sub_247AC9A7C(v19, 0xD000000000000015, 0x8000000247ACFE30);
    v21 = v20;
    swift_release();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v21);
  }
  v9 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v9)
    goto LABEL_29;
LABEL_14:
  if (v9 >= 1)
  {
    v10 = 0;
    while (1)
    {
      if ((v7 & 0xC000000000000001) != 0)
        v11 = (id)MEMORY[0x24958B0BC](v10, v7);
      else
        v11 = *(id *)(v7 + 8 * v10 + 32);
      v12 = v11;
      v13 = objc_msgSend(v11, sel_uniqueIdentifier);
      if (v13)
      {
        v14 = v13;
        v15 = sub_247ACE278();
        v17 = v16;

        if (v15 == 0xD000000000000027 && v17 == 0x8000000247ACFE50)
        {
          swift_bridgeObjectRelease();
LABEL_26:
          sub_247ACE3BC();
          sub_247ACE3D4();
          sub_247ACE3E0();
          sub_247ACE3C8();
          goto LABEL_17;
        }
        v18 = sub_247ACE440();
        swift_bridgeObjectRelease();
        if ((v18 & 1) != 0)
          goto LABEL_26;
      }

LABEL_17:
      if (v9 == ++v10)
      {
        swift_bridgeObjectRelease();
        v19 = v23;
        goto LABEL_30;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_247AC98B0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB5B0);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    if (a2)
      v8 = sub_247ACE2B4();
    else
      v8 = 0;
    v9 = v8;
    sub_247AC9D24((uint64_t)&v9, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_247AC996C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_247AC99A8()
{
  unint64_t result;

  result = qword_2576DB4F8;
  if (!qword_2576DB4F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2576DB4F8);
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

uint64_t FollowupMonitor.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t FollowupMonitor.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_247AC9A44(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_247AC1D64(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_247AC9A60(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_247AC2198(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

void sub_247AC9A7C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v4 = v3;
  v6 = a1;
  if (a1 >> 62)
    goto LABEL_20;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v7)
  {
    v40 = MEMORY[0x24BEE4AF8];
    sub_247AC9A60(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
    {
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      return;
    }
    v32 = v4;
    v33 = v7;
    v8 = 0;
    v34 = v6 & 0xC000000000000001;
    v9 = v40;
    while (v7 != v8)
    {
      v39 = v9;
      if (v34)
        v10 = (id)MEMORY[0x24958B0BC](v8, v6);
      else
        v10 = *(id *)(v6 + 8 * v8 + 32);
      v11 = v10;
      v12 = objc_msgSend(v10, sel_uniqueIdentifier, v32);
      if (!v12)
        goto LABEL_22;
      v13 = v12;
      v14 = sub_247ACE278();
      v38 = v15;

      v16 = objc_msgSend(v11, sel_notification);
      if (!v16)
        goto LABEL_23;
      v17 = v16;
      v37 = v14;
      v18 = objc_msgSend(v16, sel_title);

      if (!v18)
        goto LABEL_24;
      v19 = sub_247ACE278();
      v21 = v20;

      v22 = objc_msgSend(v11, sel_notification);
      if (!v22)
        goto LABEL_25;
      v23 = v22;
      v24 = v6;
      v25 = objc_msgSend(v22, sel_informativeText);

      if (!v25)
        goto LABEL_26;
      v26 = sub_247ACE278();
      v36 = v27;

      swift_bridgeObjectRetain();
      v9 = v39;
      v28 = a3;
      v30 = *(_QWORD *)(v39 + 16);
      v29 = *(_QWORD *)(v39 + 24);
      v4 = v30 + 1;
      if (v30 >= v29 >> 1)
      {
        sub_247AC9A60(v29 > 1, v30 + 1, 1);
        v9 = v39;
      }
      ++v8;
      *(_QWORD *)(v9 + 16) = v4;
      v31 = (_QWORD *)(v9 + (v30 << 6));
      v31[4] = v37;
      v31[5] = v38;
      v31[6] = v19;
      v31[7] = v21;
      v31[8] = a2;
      v31[9] = v28;
      v31[10] = v26;
      v31[11] = v36;
      v7 = v33;
      a3 = v28;
      v6 = v24;
      if (v33 == v8)
        return;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
    v7 = sub_247ACE3F8();
    swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for FollowupMonitor()
{
  return objc_opt_self();
}

uint64_t sub_247AC9D24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB5A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t Date.lastUsedDateFormatted.getter()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 1);
  objc_msgSend(v0, sel_setTimeStyle_, 0);
  objc_msgSend(v0, sel_setDoesRelativeDateFormatting_, 1);
  objc_msgSend(v0, sel_setFormattingContext_, 2);
  v1 = (void *)sub_247ACDD80();
  v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  v3 = sub_247ACE278();
  return v3;
}

void *Volume.defaultUserVolumeMountPath.unsafeMutableAddressor()
{
  return &static Volume.defaultUserVolumeMountPath;
}

uint64_t static Volume.defaultUserVolumeMountPath.getter()
{
  return 47;
}

uint64_t static Volume.defaultUserVolumePlaceholder.getter@<X0>(uint64_t a1@<X8>)
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t inited;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  char v38;
  char v39;
  uint64_t (*v40)(char *, uint64_t);
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  char v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91[2];

  v84 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB5B8);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v83 = (uint64_t)&v79 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v82 = (uint64_t)&v79 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v89 = (uint64_t)&v79 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v88 = (uint64_t)&v79 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v80 = (uint64_t)&v79 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v79 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v79 - v15;
  v87 = sub_247ACDD68();
  v17 = *(_QWORD *)(v87 - 8);
  v18 = MEMORY[0x24BDAC7A8](v87);
  v20 = (char *)&v79 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v79 - v21;
  sub_247ACDD44();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB5C0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247ACF5D0;
  v24 = (void *)*MEMORY[0x24BDBCDB8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCDB8];
  v25 = (void *)*MEMORY[0x24BDBCE18];
  v26 = (void *)*MEMORY[0x24BDBCDF8];
  *(_QWORD *)(inited + 40) = *MEMORY[0x24BDBCE18];
  *(_QWORD *)(inited + 48) = v26;
  v27 = v24;
  v28 = v25;
  v29 = v26;
  sub_247ACB364(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey();
  swift_arrayDestroy();
  sub_247ACDD38();
  swift_bridgeObjectRelease();
  v30 = sub_247ACDD2C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v16, 0, 1, v30);
  v31 = STMGestaltTotalDiskCapacity();
  v32 = v31;
  v85 = v22;
  v86 = v17;
  v81 = (uint64_t)v20;
  if (v31)
  {
    v33 = objc_msgSend(v31, sel_integerValue);

  }
  else
  {
    v33 = 0;
  }
  sub_247ACB590((uint64_t)v16, (uint64_t)v14);
  v34 = sub_247ACDD2C();
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
  if (v36(v14, 1, v34) == 1)
  {
    sub_247ACB5D8((uint64_t)v14);
    goto LABEL_11;
  }
  v37 = sub_247ACDD20();
  v39 = v38;
  v40 = *(uint64_t (**)(char *, uint64_t))(v35 + 8);
  result = v40(v14, v34);
  if (!v32 || (v39 & 1) != 0)
  {
LABEL_11:
    if (qword_2576DAEE0 != -1)
      swift_once();
    v46 = sub_247ACDDB0();
    __swift_project_value_buffer(v46, (uint64_t)qword_2576DCA30);
    v47 = v88;
    sub_247ACB590((uint64_t)v16, v88);
    v48 = v89;
    sub_247ACB590((uint64_t)v16, v89);
    v49 = sub_247ACDD98();
    v50 = sub_247ACE32C();
    if (!os_log_type_enabled(v49, (os_log_type_t)v50))
    {

      sub_247ACB5D8(v48);
      sub_247ACB5D8(v47);
      sub_247ACB5D8((uint64_t)v16);
      (*(void (**)(char *, uint64_t))(v86 + 8))(v85, v87);
LABEL_33:
      v78 = type metadata accessor for Volume();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 56))(v84, 1, 1, v78);
    }
    v51 = swift_slowAlloc();
    v81 = swift_slowAlloc();
    v91[0] = v81;
    *(_DWORD *)v51 = 136315394;
    v52 = v82;
    sub_247ACB590(v47, v82);
    if (v36((char *)v52, 1, v34) == 1)
    {
      sub_247ACB5D8(v52);
      v53 = 0xE300000000000000;
      v54 = 7104878;
    }
    else
    {
      LODWORD(v80) = v50;
      v55 = sub_247ACDD20();
      v57 = v56;
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v52, v34);
      if ((v57 & 1) != 0)
      {
        v53 = 0xE300000000000000;
        v54 = 7104878;
      }
      else
      {
        v90 = v55;
        sub_247ACB698();
        v54 = sub_247ACE374();
        v53 = v58;
      }
      LOBYTE(v50) = v80;
    }
    v90 = sub_247ACAC5C(v54, v53, v91);
    sub_247ACE35C();
    swift_bridgeObjectRelease();
    sub_247ACB5D8(v88);
    *(_WORD *)(v51 + 12) = 2080;
    v67 = v48;
    v68 = v83;
    sub_247ACB590(v67, v83);
    if (v36((char *)v68, 1, v34) == 1)
    {
      sub_247ACB5D8(v68);
    }
    else
    {
      v69 = sub_247ACDD14();
      v71 = v70;
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v68, v34);
      if ((v71 & 1) == 0)
      {
        v90 = v69;
        sub_247ACB654();
        v72 = sub_247ACE374();
        v74 = v73;
        v76 = v85;
        v75 = v86;
LABEL_32:
        v90 = sub_247ACAC5C(v72, v74, v91);
        sub_247ACE35C();
        swift_bridgeObjectRelease();
        sub_247ACB5D8(v89);
        _os_log_impl(&dword_247AB7000, v49, (os_log_type_t)v50, "Unable to retreive used size and capacity for the volume. Returned available %s, returned capacity %s", (uint8_t *)v51, 0x16u);
        v77 = v81;
        swift_arrayDestroy();
        MEMORY[0x24958B5A8](v77, -1, -1);
        MEMORY[0x24958B5A8](v51, -1, -1);

        sub_247ACB5D8((uint64_t)v16);
        (*(void (**)(char *, uint64_t))(v75 + 8))(v76, v87);
        goto LABEL_33;
      }
    }
    v74 = 0xE300000000000000;
    v76 = v85;
    v75 = v86;
    v72 = 7104878;
    goto LABEL_32;
  }
  v42 = (uint64_t)v33 - v37;
  if (__OFSUB__(v33, v37))
  {
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v43 = v80;
  sub_247ACB590((uint64_t)v16, v80);
  if (v36((char *)v43, 1, v34) == 1)
  {
    sub_247ACB5D8(v43);
    v44 = 0xE100000000000000;
    v45 = 47;
  }
  else
  {
    v45 = sub_247ACDD08();
    v44 = v59;
    v40((char *)v43, v34);
    if (!v44)
    {
      v45 = 47;
      v44 = 0xE100000000000000;
    }
  }
  v61 = v85;
  v60 = v86;
  v62 = v81;
  v63 = v87;
  result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v86 + 16))(v81, v85, v87);
  v64 = ceil((double)(uint64_t)v33 / 1000000000.0) * 1000000000.0;
  if ((~*(_QWORD *)&v64 & 0x7FF0000000000000) == 0)
    goto LABEL_35;
  if (v64 > -9.22337204e18)
  {
    if (v64 < 9.22337204e18)
    {
      v65 = v84;
      Volume.init(mountURL:name:isUserVolume:capacity:used:)(v62, v45, v44, 1, (uint64_t)v64, v42, v84);
      sub_247ACB5D8((uint64_t)v16);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v63);
      v66 = type metadata accessor for Volume();
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56))(v65, 0, 1, v66);
    }
    goto LABEL_37;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t Volume.init(mountURL:name:isUserVolume:capacity:used:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;

  v14 = (int *)type metadata accessor for Volume();
  *(_QWORD *)(a7 + v14[9]) = 0;
  v15 = sub_247ACDD68();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(a7, a1, v15);
  v17 = (_QWORD *)(a7 + v14[5]);
  *v17 = a2;
  v17[1] = a3;
  *(_QWORD *)(a7 + v14[7]) = a5;
  *(_QWORD *)(a7 + v14[8]) = a6;
  *(_BYTE *)(a7 + v14[6]) = a4;
  if (__OFSUB__(a5, a6))
  {
    __break(1u);
LABEL_9:
    swift_once();
    goto LABEL_4;
  }
  if (((a5 - a6) & 0x8000000000000000) == 0)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(a1, v15);
  if (qword_2576DAEE0 != -1)
    goto LABEL_9;
LABEL_4:
  v18 = sub_247ACDDB0();
  __swift_project_value_buffer(v18, (uint64_t)qword_2576DCA30);
  v19 = sub_247ACDD98();
  v20 = sub_247ACE32C();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    *(_DWORD *)v21 = 134218240;
    sub_247ACE35C();
    *(_WORD *)(v21 + 12) = 2048;
    sub_247ACE35C();
    _os_log_impl(&dword_247AB7000, v19, v20, "availableSpace is negative - used: %lld - capacity: %lld", (uint8_t *)v21, 0x16u);
    MEMORY[0x24958B5A8](v21, -1, -1);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(a1, v15);
}

uint64_t Volume.id.getter()
{
  return sub_247ACDD5C();
}

uint64_t Volume.mountURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_247ACDD68();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t Volume.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for Volume() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Volume.isUserVolume.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for Volume() + 24));
}

uint64_t Volume.capacity.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for Volume() + 28));
}

uint64_t Volume.capacity.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Volume();
  *(_QWORD *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*Volume.capacity.modify())()
{
  type metadata accessor for Volume();
  return nullsub_1;
}

uint64_t Volume.used.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for Volume() + 32));
}

uint64_t Volume.otherVolumesInContainer.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for Volume() + 36));
}

uint64_t Volume.otherVolumesInContainer.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Volume();
  *(_QWORD *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*Volume.otherVolumesInContainer.modify())()
{
  type metadata accessor for Volume();
  return nullsub_1;
}

int *Volume.available.getter()
{
  uint64_t v0;
  int *result;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  result = (int *)type metadata accessor for Volume();
  v2 = *(_QWORD *)(v0 + result[7]);
  v3 = *(_QWORD *)(v0 + result[8]);
  v4 = __OFSUB__(v2, v3);
  v5 = v2 - v3;
  if (v4)
  {
    __break(1u);
    goto LABEL_5;
  }
  v6 = *(_QWORD *)(v0 + result[9]);
  result = (int *)(v5 - v6);
  if (__OFSUB__(v5, v6))
LABEL_5:
    __break(1u);
  return result;
}

uint64_t Volume.description.getter()
{
  sub_247ACE38C();
  sub_247ACE290();
  sub_247ACDD68();
  sub_247ACB6DC();
  sub_247ACE434();
  sub_247ACE290();
  swift_bridgeObjectRelease();
  sub_247ACE290();
  type metadata accessor for Volume();
  swift_bridgeObjectRetain();
  sub_247ACE290();
  swift_bridgeObjectRelease();
  sub_247ACE290();
  sub_247ACE434();
  sub_247ACE290();
  swift_bridgeObjectRelease();
  sub_247ACE290();
  sub_247ACE434();
  sub_247ACE290();
  swift_bridgeObjectRelease();
  sub_247ACE290();
  sub_247ACE290();
  swift_bridgeObjectRelease();
  sub_247ACE290();
  sub_247ACE434();
  sub_247ACE290();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_247ACAC2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_247ACDD5C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_247ACAC5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_247ACAD2C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_247AC996C((uint64_t)v12, *a3);
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
      sub_247AC996C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_247ACAD2C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_247ACE368();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_247ACAEE4(a5, a6);
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
  v8 = sub_247ACE3B0();
  if (!v8)
  {
    sub_247ACE3EC();
    __break(1u);
LABEL_17:
    result = sub_247ACE410();
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

uint64_t sub_247ACAEE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_247ACAF78(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_247ACB150(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_247ACB150(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247ACAF78(uint64_t a1, unint64_t a2)
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
      v3 = sub_247ACB0EC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_247ACE398();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_247ACE3EC();
      __break(1u);
LABEL_10:
      v2 = sub_247ACE29C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_247ACE410();
    __break(1u);
LABEL_14:
    result = sub_247ACE3EC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_247ACB0EC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB680);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_247ACB150(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB680);
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
  result = sub_247ACE410();
  __break(1u);
  return result;
}

BOOL _s9StorageUI6VolumeV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;
  char v10;
  _BOOL8 result;

  if ((MEMORY[0x24958AA68]() & 1) == 0)
    return 0;
  v4 = (int *)type metadata accessor for Volume();
  v5 = v4[5];
  v6 = *(_QWORD *)(a1 + v5);
  v7 = *(_QWORD *)(a1 + v5 + 8);
  v8 = (_QWORD *)(a2 + v5);
  v9 = v6 == *v8 && v7 == v8[1];
  if (v9 || (v10 = sub_247ACE440(), result = 0, (v10 & 1) != 0))
  {
    if (*(unsigned __int8 *)(a1 + v4[6]) == *(unsigned __int8 *)(a2 + v4[6])
      && *(_QWORD *)(a1 + v4[7]) == *(_QWORD *)(a2 + v4[7])
      && *(_QWORD *)(a1 + v4[8]) == *(_QWORD *)(a2 + v4[8]))
    {
      return *(_QWORD *)(a1 + v4[9]) == *(_QWORD *)(a2 + v4[9]);
    }
    return 0;
  }
  return result;
}

uint64_t sub_247ACB364(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB688);
    v3 = sub_247ACE380();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_247ACE278();
      sub_247ACE464();
      v7 = v6;
      sub_247ACE284();
      v8 = sub_247ACE488();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_247ACE278();
        v17 = v16;
        if (v15 == sub_247ACE278() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_247ACE440();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_4;
        v21 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v21;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v22 = sub_247ACE278();
          v24 = v23;
          if (v22 == sub_247ACE278() && v24 == v25)
            goto LABEL_3;
          v27 = sub_247ACE440();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v27 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v7;
      v28 = *(_QWORD *)(v3 + 16);
      v29 = __OFADD__(v28, 1);
      v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_247ACB590(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB5B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247ACB5D8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB5B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for Volume()
{
  uint64_t result;

  result = qword_2576DB638;
  if (!qword_2576DB638)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_247ACB654()
{
  unint64_t result;

  result = qword_2576DB5C8;
  if (!qword_2576DB5C8)
  {
    result = MEMORY[0x24958B524](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2576DB5C8);
  }
  return result;
}

unint64_t sub_247ACB698()
{
  unint64_t result;

  result = qword_2576DB5D0;
  if (!qword_2576DB5D0)
  {
    result = MEMORY[0x24958B524](MEMORY[0x24BEE4040], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_2576DB5D0);
  }
  return result;
}

unint64_t sub_247ACB6DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576DB5D8;
  if (!qword_2576DB5D8)
  {
    v1 = sub_247ACDD68();
    result = MEMORY[0x24958B524](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_2576DB5D8);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for Volume(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247ACDD68();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (_QWORD *)((char *)a1 + v8);
    v11 = (_QWORD *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    v13 = a3[8];
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    *(_QWORD *)((char *)a1 + v13) = *(_QWORD *)((char *)a2 + v13);
    *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for Volume(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_247ACDD68();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Volume(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_247ACDD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v12 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Volume(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_247ACDD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t initializeWithTake for Volume(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_247ACDD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for Volume(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_247ACDD68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  v13 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for Volume()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247ACBA88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_247ACDD68();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for Volume()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247ACBB14(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_247ACDD68();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_247ACBB90()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247ACDD68();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t TimeStats.initTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_247ACDD8C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t TimeStats.initTime.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_247ACDD8C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*TimeStats.initTime.modify())()
{
  return nullsub_1;
}

uint64_t TimeStats.startMonitoring.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 20);
  return sub_247ACBD08(v3, a1);
}

uint64_t type metadata accessor for TimeStats()
{
  uint64_t result;

  result = qword_2576DB6F0;
  if (!qword_2576DB6F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247ACBD08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t TimeStats.startMonitoring.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 20);
  return sub_247ACBD80(a1, v3);
}

uint64_t sub_247ACBD80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*TimeStats.startMonitoring.modify())()
{
  type metadata accessor for TimeStats();
  return nullsub_1;
}

uint64_t TimeStats.firstGathering.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 24);
  return sub_247ACBD08(v3, a1);
}

uint64_t TimeStats.firstGathering.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 24);
  return sub_247ACBD80(a1, v3);
}

uint64_t (*TimeStats.firstGathering.modify())()
{
  type metadata accessor for TimeStats();
  return nullsub_1;
}

uint64_t TimeStats.firstDisplay.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 28);
  return sub_247ACBD08(v3, a1);
}

uint64_t TimeStats.firstDisplay.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 28);
  return sub_247ACBD80(a1, v3);
}

uint64_t (*TimeStats.firstDisplay.modify())()
{
  type metadata accessor for TimeStats();
  return nullsub_1;
}

uint64_t TimeStats.recommendations.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 32);
  return sub_247ACBD08(v3, a1);
}

uint64_t TimeStats.recommendations.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for TimeStats() + 32);
  return sub_247ACBD80(a1, v3);
}

uint64_t (*TimeStats.recommendations.modify())()
{
  type metadata accessor for TimeStats();
  return nullsub_1;
}

uint64_t TimeStats.init(initTime:startMonitoring:firstGathering:firstDisplay:recommendations:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v10 = (int *)type metadata accessor for TimeStats();
  v11 = a6 + v10[5];
  v12 = sub_247ACE248();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  v13(v11, 1, 1, v12);
  v14 = a6 + v10[6];
  v13(v14, 1, 1, v12);
  v15 = a6 + v10[7];
  v13(v15, 1, 1, v12);
  v16 = a6 + v10[8];
  v13(v16, 1, 1, v12);
  v17 = sub_247ACDD8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(a6, a1, v17);
  sub_247ACBD80(a2, v11);
  sub_247ACBD80(a3, v14);
  sub_247ACBD80(a4, v15);
  return sub_247ACBD80(a5, v16);
}

unint64_t TimeStats.description.getter()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t, uint64_t);
  int v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  unint64_t v38;
  unint64_t result;
  void (*v40)(char *, uint64_t);
  int v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  unint64_t v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  int v51;
  char *v52;
  void (*v53)(char *, uint64_t, uint64_t);
  char *v54;
  unint64_t v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v60 = (uint64_t)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v62 = (uint64_t)&v57 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v61 = (uint64_t)&v57 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v57 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v57 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v57 - v15;
  v17 = sub_247ACE248();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v58 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v63 = (char *)&v57 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v65 = (char *)&v57 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v66 = (char *)&v57 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v59 = (char *)&v57 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v57 - v29;
  v69 = 0;
  v70 = 0xE000000000000000;
  sub_247ACE38C();
  swift_bridgeObjectRelease();
  v69 = 0xD000000000000023;
  v70 = 0x8000000247AD00F0;
  sub_247ACDD74();
  sub_247ACE290();
  swift_bridgeObjectRelease();
  sub_247ACE290();
  v31 = type metadata accessor for TimeStats();
  v32 = v0 + *(int *)(v31 + 20);
  sub_247ACBD08(v32, (uint64_t)v16);
  v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v34 = v33(v16, 1, v17);
  v64 = v31;
  if (v34 == 1)
  {
    sub_247ACC798((uint64_t)v16);
    v35 = v18;
  }
  else
  {
    v57 = v32;
    v36 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v36(v30, v16, v17);
    sub_247ACBD08(v1 + *(int *)(v31 + 24), (uint64_t)v14);
    if (v33(v14, 1, v17) == 1)
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v30, v17);
      sub_247ACC798((uint64_t)v14);
      v35 = v18;
    }
    else
    {
      v37 = v59;
      v36(v59, v14, v17);
      v38 = sub_247ACE23C();
      result = sub_247ACE23C();
      if (v38 < result)
      {
        __break(1u);
        goto LABEL_23;
      }
      v67 = 0;
      v68 = 0xE000000000000000;
      sub_247ACE38C();
      sub_247ACE290();
      sub_247ACE2F0();
      sub_247ACE290();
      sub_247ACE290();
      swift_bridgeObjectRelease();
      v35 = v18;
      v40 = *(void (**)(char *, uint64_t))(v18 + 8);
      v40(v37, v17);
      v40(v30, v17);
    }
    v32 = v57;
  }
  sub_247ACBD08(v32, (uint64_t)v11);
  v41 = v33(v11, 1, v17);
  v43 = v65;
  v42 = v66;
  v44 = v64;
  if (v41 != 1)
  {
    v45 = v32;
    v46 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    v46(v66, v11, v17);
    v47 = v61;
    sub_247ACBD08(v1 + *(int *)(v44 + 28), v61);
    if (v33((char *)v47, 1, v17) == 1)
    {
      (*(void (**)(char *, uint64_t))(v35 + 8))(v42, v17);
      sub_247ACC798(v47);
LABEL_14:
      v32 = v45;
      goto LABEL_15;
    }
    v46(v43, (char *)v47, v17);
    v48 = sub_247ACE23C();
    result = sub_247ACE23C();
    if (v48 >= result)
    {
      v67 = 0;
      v68 = 0xE000000000000000;
      sub_247ACE38C();
      sub_247ACE290();
      sub_247ACE2F0();
      sub_247ACE290();
      sub_247ACE290();
      swift_bridgeObjectRelease();
      v49 = *(void (**)(char *, uint64_t))(v35 + 8);
      v49(v43, v17);
      v49(v42, v17);
      goto LABEL_14;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_247ACC798((uint64_t)v11);
LABEL_15:
  v50 = v62;
  sub_247ACBD08(v32, v62);
  v51 = v33((char *)v50, 1, v17);
  v52 = v63;
  if (v51 == 1)
  {
LABEL_18:
    sub_247ACC798(v50);
    return v69;
  }
  v53 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 32);
  v53(v63, v50, v17);
  v50 = v60;
  sub_247ACBD08(v1 + *(int *)(v44 + 32), v60);
  if (v33((char *)v50, 1, v17) == 1)
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v52, v17);
    goto LABEL_18;
  }
  v54 = v58;
  v53(v58, v50, v17);
  v55 = sub_247ACE23C();
  result = sub_247ACE23C();
  if (v55 >= result)
  {
    v67 = 0;
    v68 = 0xE000000000000000;
    sub_247ACE38C();
    sub_247ACE290();
    sub_247ACE2F0();
    sub_247ACE290();
    sub_247ACE290();
    swift_bridgeObjectRelease();
    v56 = *(void (**)(char *, uint64_t))(v35 + 8);
    v56(v54, v17);
    v56(v52, v17);
    return v69;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_247ACC798(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for TimeStats(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247ACDD8C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_247ACE248();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = a3[6];
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    if (v13((char *)a2 + v16, 1, v11))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, v18, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v17, 0, 1, v11);
    }
    v20 = a3[7];
    v21 = (char *)a1 + v20;
    v22 = (char *)a2 + v20;
    if (v13((char *)a2 + v20, 1, v11))
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
      memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v21, v22, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v21, 0, 1, v11);
    }
    v24 = a3[8];
    v25 = (char *)a1 + v24;
    v26 = (char *)a2 + v24;
    if (v13(v26, 1, v11))
    {
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v25, v26, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v25, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for TimeStats(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v4 = sub_247ACDD8C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = sub_247ACE248();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v8(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v9 = a1 + a2[6];
  if (!v8(v9, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
  v10 = a1 + a2[7];
  if (!v8(v10, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  v11 = a1 + a2[8];
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v8)(v11, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v11, v6);
  return result;
}

uint64_t initializeWithCopy for TimeStats(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  uint64_t v25;

  v6 = sub_247ACDD8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_247ACE248();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[6];
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  if (v12((const void *)(a2 + v14), 1, v10))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v15, v16, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v15, 0, 1, v10);
  }
  v18 = a3[7];
  v19 = (void *)(a1 + v18);
  v20 = (const void *)(a2 + v18);
  if (v12((const void *)(a2 + v18), 1, v10))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v19, v20, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v19, 0, 1, v10);
  }
  v22 = a3[8];
  v23 = (void *)(a1 + v22);
  v24 = (const void *)(a2 + v22);
  if (v12(v24, 1, v10))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v23, v24, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v23, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for TimeStats(uint64_t a1, uint64_t a2, int *a3)
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
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  uint64_t v33;

  v6 = sub_247ACDD8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_247ACE248();
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
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  v16 = a3[6];
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = v12((void *)(a1 + v16), 1, v10);
  v20 = v12(v18, 1, v10);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v17, v18, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v17, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v17, v10);
LABEL_12:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v17, v18, v10);
LABEL_13:
  v22 = a3[7];
  v23 = (void *)(a1 + v22);
  v24 = (void *)(a2 + v22);
  v25 = v12((void *)(a1 + v22), 1, v10);
  v26 = v12(v24, 1, v10);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v23, v24, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v23, 0, 1, v10);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v26)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v23, v10);
LABEL_18:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v23, v24, v10);
LABEL_19:
  v28 = a3[8];
  v29 = (void *)(a1 + v28);
  v30 = (void *)(a2 + v28);
  v31 = v12((void *)(a1 + v28), 1, v10);
  v32 = v12(v30, 1, v10);
  if (!v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v29, v30, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v29, v10);
    goto LABEL_24;
  }
  if (v32)
  {
LABEL_24:
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v29, v30, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v29, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for TimeStats(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const void *v24;
  uint64_t v25;

  v6 = sub_247ACDD8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_247ACE248();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[6];
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  if (v12((const void *)(a2 + v14), 1, v10))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v15, v16, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v15, 0, 1, v10);
  }
  v18 = a3[7];
  v19 = (void *)(a1 + v18);
  v20 = (const void *)(a2 + v18);
  if (v12((const void *)(a2 + v18), 1, v10))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v19, v20, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v19, 0, 1, v10);
  }
  v22 = a3[8];
  v23 = (void *)(a1 + v22);
  v24 = (const void *)(a2 + v22);
  if (v12(v24, 1, v10))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v23, v24, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v23, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for TimeStats(uint64_t a1, uint64_t a2, int *a3)
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
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  uint64_t v33;

  v6 = sub_247ACDD8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_247ACE248();
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
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = a3[6];
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = v12((void *)(a1 + v16), 1, v10);
  v20 = v12(v18, 1, v10);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v17, v18, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v17, 0, 1, v10);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v17, v10);
LABEL_12:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v17, v18, v10);
LABEL_13:
  v22 = a3[7];
  v23 = (void *)(a1 + v22);
  v24 = (void *)(a2 + v22);
  v25 = v12((void *)(a1 + v22), 1, v10);
  v26 = v12(v24, 1, v10);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v23, v24, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v23, 0, 1, v10);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v26)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v23, v10);
LABEL_18:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v23, v24, v10);
LABEL_19:
  v28 = a3[8];
  v29 = (void *)(a1 + v28);
  v30 = (void *)(a2 + v28);
  v31 = v12((void *)(a1 + v28), 1, v10);
  v32 = v12(v30, 1, v10);
  if (!v31)
  {
    if (!v32)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v29, v30, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v29, v10);
    goto LABEL_24;
  }
  if (v32)
  {
LABEL_24:
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v29, v30, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v29, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimeStats()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247ACD664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_247ACDD8C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for TimeStats()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247ACD6E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_247ACDD8C();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576DB690);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_247ACD768()
{
  unint64_t v0;
  unint64_t v1;

  sub_247ACDD8C();
  if (v0 <= 0x3F)
  {
    sub_247ACD7F0();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_247ACD7F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576DB700)
  {
    sub_247ACE248();
    v0 = sub_247ACE350();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576DB700);
  }
}

BOOL static DeviceClass.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void *sub_247ACD858()
{
  void *result;

  result = (void *)sub_247ACD9C8((uint64_t)&unk_251924F38);
  off_2576DB740 = result;
  return result;
}

uint64_t DeviceClass.hash(into:)()
{
  return sub_247ACE470();
}

uint64_t DeviceClass.hashValue.getter()
{
  sub_247ACE464();
  sub_247ACE470();
  return sub_247ACE488();
}

BOOL sub_247ACD8E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_247ACD8F8(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x24958B170](*(_QWORD *)(v1 + 40), a1, 4);
  return sub_247ACD92C(a1, v3);
}

unint64_t sub_247ACD92C(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_247ACD9C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _BYTE *i;
  unsigned int v5;
  char v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576DB750);
    v3 = (_QWORD *)sub_247ACE404();
    for (i = (_BYTE *)(a1 + 36); ; i += 8)
    {
      v5 = *((_DWORD *)i - 1);
      v6 = *i;
      result = sub_247ACD8F8(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v3[6] + 4 * result) = v5;
      *(_BYTE *)(v3[7] + result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

uint64_t _s9StorageUI11DeviceClassO7currentACvgZ_0()
{
  void *v0;
  unsigned int v1;
  _QWORD *v2;
  unint64_t v3;
  char v4;
  uint64_t v5;

  if (qword_2576DAEF8 != -1)
    swift_once();
  v0 = (void *)sub_247ACE254();
  v1 = MGGetSInt32Answer();

  swift_beginAccess();
  v2 = off_2576DB740;
  if (*((_QWORD *)off_2576DB740 + 2) && (v3 = sub_247ACD8F8(v1), (v4 & 1) != 0))
    v5 = *(unsigned __int8 *)(v2[7] + v3);
  else
    v5 = 5;
  swift_endAccess();
  return v5;
}

unint64_t sub_247ACDB68()
{
  unint64_t result;

  result = qword_2576DB748;
  if (!qword_2576DB748)
  {
    result = MEMORY[0x24958B524](&protocol conformance descriptor for DeviceClass, &type metadata for DeviceClass);
    atomic_store(result, (unint64_t *)&qword_2576DB748);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DeviceClass(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceClass(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247ACDC88 + 4 * byte_247ACF6BD[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_247ACDCBC + 4 * asc_247ACF6B8[v4]))();
}

uint64_t sub_247ACDCBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247ACDCC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247ACDCCCLL);
  return result;
}

uint64_t sub_247ACDCD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247ACDCE0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_247ACDCE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247ACDCEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceClass()
{
  return &type metadata for DeviceClass;
}

uint64_t sub_247ACDD08()
{
  return MEMORY[0x24BDCC780]();
}

uint64_t sub_247ACDD14()
{
  return MEMORY[0x24BDCC788]();
}

uint64_t sub_247ACDD20()
{
  return MEMORY[0x24BDCC7D8]();
}

uint64_t sub_247ACDD2C()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_247ACDD38()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_247ACDD44()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_247ACDD50()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_247ACDD5C()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_247ACDD68()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_247ACDD74()
{
  return MEMORY[0x24BDCE2D0]();
}

uint64_t sub_247ACDD80()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_247ACDD8C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_247ACDD98()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_247ACDDA4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_247ACDDB0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_247ACDDBC()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_247ACDDC8()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_247ACDDD4()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_247ACDDE0()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_247ACDDEC()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_247ACDDF8()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_247ACDE04()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_247ACDE10()
{
  return MEMORY[0x24BDEBC28]();
}

uint64_t sub_247ACDE1C()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_247ACDE28()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_247ACDE34()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_247ACDE40()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_247ACDE4C()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_247ACDE58()
{
  return MEMORY[0x24BDEC260]();
}

uint64_t sub_247ACDE64()
{
  return MEMORY[0x24BDEC268]();
}

uint64_t sub_247ACDE70()
{
  return MEMORY[0x24BDEC278]();
}

uint64_t sub_247ACDE7C()
{
  return MEMORY[0x24BDEC280]();
}

uint64_t sub_247ACDE88()
{
  return MEMORY[0x24BDEC778]();
}

uint64_t sub_247ACDE94()
{
  return MEMORY[0x24BDEC7A8]();
}

uint64_t sub_247ACDEA0()
{
  return MEMORY[0x24BDED068]();
}

uint64_t sub_247ACDEAC()
{
  return MEMORY[0x24BDED070]();
}

uint64_t sub_247ACDEB8()
{
  return MEMORY[0x24BDED080]();
}

uint64_t sub_247ACDEC4()
{
  return MEMORY[0x24BDED210]();
}

uint64_t sub_247ACDED0()
{
  return MEMORY[0x24BDED8F8]();
}

uint64_t sub_247ACDEDC()
{
  return MEMORY[0x24BDED970]();
}

uint64_t sub_247ACDEE8()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_247ACDEF4()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_247ACDF00()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_247ACDF0C()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_247ACDF18()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_247ACDF24()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_247ACDF30()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_247ACDF3C()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_247ACDF48()
{
  return MEMORY[0x24BDEE8B8]();
}

uint64_t sub_247ACDF54()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_247ACDF60()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_247ACDF6C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_247ACDF78()
{
  return MEMORY[0x24BDF02D0]();
}

uint64_t sub_247ACDF84()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_247ACDF90()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_247ACDF9C()
{
  return MEMORY[0x24BDF1450]();
}

uint64_t sub_247ACDFA8()
{
  return MEMORY[0x24BDF1458]();
}

uint64_t sub_247ACDFB4()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_247ACDFC0()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_247ACDFCC()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_247ACDFD8()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_247ACDFE4()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_247ACDFF0()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_247ACDFFC()
{
  return MEMORY[0x24BDF1768]();
}

uint64_t sub_247ACE008()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_247ACE014()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_247ACE020()
{
  return MEMORY[0x24BDF1AF0]();
}

uint64_t sub_247ACE02C()
{
  return MEMORY[0x24BDF1B30]();
}

uint64_t sub_247ACE038()
{
  return MEMORY[0x24BDF1BA0]();
}

uint64_t sub_247ACE044()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_247ACE050()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_247ACE05C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_247ACE068()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_247ACE074()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_247ACE080()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_247ACE08C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_247ACE098()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_247ACE0A4()
{
  return MEMORY[0x24BDF37F0]();
}

uint64_t sub_247ACE0B0()
{
  return MEMORY[0x24BDF3BE0]();
}

uint64_t sub_247ACE0BC()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_247ACE0C8()
{
  return MEMORY[0x24BDF3C50]();
}

uint64_t sub_247ACE0D4()
{
  return MEMORY[0x24BDF3C60]();
}

uint64_t sub_247ACE0E0()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_247ACE0EC()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_247ACE0F8()
{
  return MEMORY[0x24BDF3C98]();
}

uint64_t sub_247ACE104()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_247ACE110()
{
  return MEMORY[0x24BDF3CD0]();
}

uint64_t sub_247ACE11C()
{
  return MEMORY[0x24BDF3CD8]();
}

uint64_t sub_247ACE128()
{
  return MEMORY[0x24BDF3CE0]();
}

uint64_t sub_247ACE134()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_247ACE140()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_247ACE14C()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_247ACE158()
{
  return MEMORY[0x24BDF3D40]();
}

uint64_t sub_247ACE164()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_247ACE170()
{
  return MEMORY[0x24BDF3D58]();
}

uint64_t sub_247ACE17C()
{
  return MEMORY[0x24BDF3D60]();
}

uint64_t sub_247ACE188()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_247ACE194()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_247ACE1A0()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_247ACE1AC()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_247ACE1B8()
{
  return MEMORY[0x24BDF4300]();
}

uint64_t sub_247ACE1C4()
{
  return MEMORY[0x24BDF43E8]();
}

uint64_t sub_247ACE1D0()
{
  return MEMORY[0x24BDF44E0]();
}

uint64_t sub_247ACE1DC()
{
  return MEMORY[0x24BDF44E8]();
}

uint64_t sub_247ACE1E8()
{
  return MEMORY[0x24BDF44F0]();
}

uint64_t sub_247ACE1F4()
{
  return MEMORY[0x24BDF4508]();
}

uint64_t sub_247ACE200()
{
  return MEMORY[0x24BDF4510]();
}

uint64_t sub_247ACE20C()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_247ACE218()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_247ACE224()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_247ACE230()
{
  return MEMORY[0x24BDF54A8]();
}

uint64_t sub_247ACE23C()
{
  return MEMORY[0x24BEE5558]();
}

uint64_t sub_247ACE248()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_247ACE254()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_247ACE260()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_247ACE26C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_247ACE278()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_247ACE284()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_247ACE290()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_247ACE29C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_247ACE2A8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_247ACE2B4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_247ACE2C0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_247ACE2CC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_247ACE2D8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_247ACE2E4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_247ACE2F0()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_247ACE2FC()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_247ACE308()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_247ACE314()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_247ACE320()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_247ACE32C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_247ACE338()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_247ACE344()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_247ACE350()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_247ACE35C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_247ACE368()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_247ACE374()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_247ACE380()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_247ACE38C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_247ACE398()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_247ACE3A4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_247ACE3B0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_247ACE3BC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_247ACE3C8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_247ACE3D4()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_247ACE3E0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_247ACE3EC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_247ACE3F8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_247ACE404()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_247ACE410()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_247ACE41C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_247ACE428()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_247ACE434()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_247ACE440()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_247ACE44C()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_247ACE458()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_247ACE464()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_247ACE470()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_247ACE47C()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_247ACE488()
{
  return MEMORY[0x24BEE4328]();
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

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

