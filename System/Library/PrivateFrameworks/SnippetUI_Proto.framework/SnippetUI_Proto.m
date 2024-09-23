uint64_t sub_24768CFD4()
{
  uint64_t result;

  result = sub_247693154();
  qword_2576B7208 = result;
  return result;
}

uint64_t static ProtoVisualResponseProvider.setPatternId(_:forViewId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_2576B6FD0 != -1)
    swift_once();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24769024C(a1, a2, a3, a4);
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

void static ProtoVisualResponseProvider.preWarm(using:)(void *a1)
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
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
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
  uint64_t (*v44)();
  uint64_t v45;

  v32 = a1;
  v1 = sub_2476930B8();
  v39 = *(_QWORD *)(v1 - 8);
  v40 = v1;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_13();
  v38 = v3;
  OUTLINED_FUNCTION_17();
  v4 = sub_2476930DC();
  v36 = *(_QWORD *)(v4 - 8);
  v37 = v4;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_13();
  v35 = v6;
  OUTLINED_FUNCTION_17();
  v7 = sub_2476930C4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6();
  v11 = v10 - v9;
  v12 = OUTLINED_FUNCTION_16();
  v33 = *(_QWORD *)(v12 - 8);
  v34 = v12;
  v13 = *(_QWORD *)(v33 + 64);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v30 - v16;
  if (qword_2576B6FE0 != -1)
    swift_once();
  v18 = (id)qword_2576B71D8;
  sub_24769307C();
  sub_247693250();
  sub_247693070();
  sub_247690798(0, &qword_2576B6FF0);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x24BEE5488], v7);
  v31 = sub_247693238();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  v19 = v33;
  v20 = v34;
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v15, v17, v34);
  v21 = (*(unsigned __int8 *)(v19 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v22 = swift_allocObject();
  v23 = v32;
  *(_QWORD *)(v22 + 16) = v32;
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v22 + v21, v15, v20);
  v44 = sub_24769030C;
  v45 = v22;
  v42 = MEMORY[0x24BDAC760];
  v43 = 1107296256;
  v24 = OUTLINED_FUNCTION_26((uint64_t)sub_24768DA7C);
  v25 = v23;
  v26 = v35;
  sub_2476930D0();
  v41 = MEMORY[0x24BEE4AF8];
  sub_2476904DC(&qword_2576B6FF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B7000);
  sub_247690390();
  v27 = v38;
  v28 = v40;
  sub_2476932B0();
  v29 = (void *)v31;
  MEMORY[0x24957FD0C](0, v26, v27, v24);
  _Block_release(v24);

  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v27, v28);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v26, v37);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v20);
  swift_release();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_24768D45C(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t (*v45)();
  void *v46;
  void (*v47)();
  char *v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v33 = a2;
  v34 = a1;
  v2 = sub_2476930B8();
  v39 = *(_QWORD *)(v2 - 8);
  v40 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v38 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2476930DC();
  v36 = *(_QWORD *)(v4 - 8);
  v37 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v35 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_247693088();
  v6 = *(_QWORD *)(v32 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v32);
  v8 = sub_24769304C();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BEAD3D0];
  v41 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B70F8);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2476937D0;
  v46 = (void *)MEMORY[0x24BEE0D00];
  v47 = (void (*)())MEMORY[0x24BEAD530];
  v43 = 2434083;
  v44 = 0xE300000000000000;
  v66 = 0;
  v64 = 0u;
  v65 = 0u;
  v63 = 0;
  v61 = 0u;
  v62 = 0u;
  v60 = 0;
  v58 = 0u;
  v59 = 0u;
  v57 = 0;
  v55 = 0u;
  v56 = 0u;
  v54 = 0;
  v52 = 0u;
  v53 = 0u;
  v13 = sub_247692FEC();
  v49 = 0u;
  v50 = 0u;
  v51 = 0;
  v14 = MEMORY[0x24BEAC130];
  *(_QWORD *)(v12 + 56) = v13;
  *(_QWORD *)(v12 + 64) = v14;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v12 + 32));
  sub_247692FE0();
  sub_247693058();
  sub_2476904DC(&qword_2576B7020, v9, MEMORY[0x24BEAD3C8]);
  v42 = v8;
  v15 = sub_247692FC8();
  v17 = v16;
  sub_247690798(0, &qword_2576B6FF0);
  v31 = sub_247693214();
  v18 = v32;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v32);
  v19 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v20 = (char *)swift_allocObject();
  *((_QWORD *)v20 + 2) = v15;
  *((_QWORD *)v20 + 3) = v17;
  v21 = v15;
  v22 = v34;
  *((_QWORD *)v20 + 4) = v34;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v20[v19], (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
  v47 = sub_247690BE4;
  v48 = v20;
  v43 = MEMORY[0x24BDAC760];
  v44 = 1107296256;
  v45 = sub_24768DA7C;
  v46 = &block_descriptor_36;
  v23 = _Block_copy(&v43);
  sub_247690418(v21, v17);
  v24 = v22;
  swift_release();
  v25 = v35;
  sub_2476930D0();
  v43 = MEMORY[0x24BEE4AF8];
  sub_2476904DC(&qword_2576B6FF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B7000);
  sub_247690390();
  v26 = v38;
  v27 = v40;
  sub_2476932B0();
  v28 = (void *)v31;
  MEMORY[0x24957FD0C](0, v25, v26, v23);
  _Block_release(v23);

  sub_247690488(v21, v17);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v27);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v37);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v11, v42);
}

void sub_24768D89C(uint64_t a1, unint64_t a2, void *a3)
{
  id v6;
  id v7;

  v6 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ProtoVisualResponseProvider()), sel_init);
  v7 = (id)ProtoVisualResponseProvider.view(for:mode:overload:)(a1, a2, 1);

  if (v7)
  {
    objc_msgSend(v7, sel_setHidden_, 1);
    objc_msgSend(a3, sel_addSubview_, v7);
    objc_msgSend(v7, sel_removeFromSuperview);
    sub_247693244();
    if (qword_2576B6FE0 != -1)
      swift_once();
    sub_247693070();

  }
}

id ProtoVisualResponseProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t ProtoVisualResponseProvider.view(for:mode:overload:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  void *v3;
  char *v7;
  uint64_t v8;
  int v9;
  id v10;

  v7 = off_2576B7188;
  v8 = unk_2576B7190;
  v9 = byte_2576B7198;
  v10 = v3;
  sub_247690418(a1, a2);
  return sub_247690DF0((uint64_t)v7, v8, v9, v10, a1, a2, a3);
}

uint64_t sub_24768DA80(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void ProtoVisualResponseProvider.viewController(for:mode:)()
{
  uint64_t v0;
  char v1;

  v0 = sub_2476931F0();
  v1 = 2;
  j__OUTLINED_FUNCTION_14_0(v0, 0, "SnippetUI_Proto/ProtoVisualResponseProvider.swift", 49, 2, 70, "viewController(for:mode:)", 25, v1);
  OUTLINED_FUNCTION_4();
  __break(1u);
}

void ProtoVisualResponseProvider.responseView(for:mode:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B7010);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_6();
  v11 = v10 - v9;
  v12 = off_2576B71A0;
  v13 = unk_2576B71A8;
  v14 = byte_2576B71B0;
  sub_247690418(a2, a3);
  sub_24769109C((uint64_t)v12, v13, v14, a2, a3, a4, v11);
  if (!v4)
  {
    v15 = sub_2476930F4();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(a1, v11, v15);
  }
  OUTLINED_FUNCTION_10();
}

void ProtoVisualResponseProvider.view(for:mode:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  ProtoVisualResponseProvider.responseView(for:mode:)(a1, a2, a3, a4);
}

uint64_t sub_24768DCFC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  os_log_type_t v12;
  uint64_t v14;

  v6 = OUTLINED_FUNCTION_9();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v11 = a2;
  v12 = sub_2476931D8();
  sub_247691F38(v12, (uint64_t)sub_247690B04, v10, 0, (uint64_t)"SnippetUI_Proto/ProtoVisualResponseProvider.swift", 49, 2, 124, (uint64_t)"responseView(for:mode:)", 23);
  return swift_release();
}

void ProtoVisualResponseProvider.viewController(for:mode:completion:)()
{
  uint64_t v0;
  char v1;

  v0 = sub_2476931F0();
  v1 = 2;
  j__OUTLINED_FUNCTION_14_0(v0, 0, "SnippetUI_Proto/ProtoVisualResponseProvider.swift", 49, 2, 134, "viewController(for:mode:completion:)", 36, v1);
  OUTLINED_FUNCTION_4();
  __break(1u);
}

void ProtoVisualResponseProvider.responseView(for:mode:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v7 = sub_2476930B8();
  v30 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_6();
  v11 = v10 - v9;
  v12 = sub_2476930DC();
  v28 = *(_QWORD *)(v12 - 8);
  v29 = v12;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_6();
  v16 = v15 - v14;
  v17 = sub_2476930C4();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_6();
  v21 = v20 - v19;
  sub_247690798(0, &qword_2576B6FF0);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v21, *MEMORY[0x24BEE5488], v17);
  v22 = (void *)sub_247693238();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v17);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = a1;
  v23[3] = a2;
  v23[4] = a3;
  v23[5] = a4;
  v23[6] = a5;
  v24 = OUTLINED_FUNCTION_26((uint64_t)sub_24768DA7C);
  sub_247690418(a1, a2);
  swift_retain();
  sub_2476930D0();
  sub_2476904DC(&qword_2576B6FF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B7000);
  sub_247690390();
  sub_2476932B0();
  MEMORY[0x24957FD0C](0, v16, v11, v24);
  _Block_release(v24);

  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v11, v7);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v16, v29);
  swift_release();
  OUTLINED_FUNCTION_11();
}

uint64_t sub_24768E128(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _QWORD v16[6];
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v18 = a3;
  v19 = a4;
  v17 = a2;
  v7 = sub_2476930B8();
  v16[4] = *(_QWORD *)(v7 - 8);
  v16[5] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v16[3] = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2476930DC();
  v16[1] = *(_QWORD *)(v9 - 8);
  v16[2] = v9;
  MEMORY[0x24BDAC7A8](v9);
  v10 = sub_247693088();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576B6FE0 != -1)
    swift_once();
  v14 = (id)qword_2576B71D8;
  sub_24769307C();
  sub_247693250();
  sub_247693070();
  sub_24768E45C(a1, v17, v18, v19, a5);
  sub_247693244();
  sub_247693070();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void sub_24768E45C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v8;
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void *v28;
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
  _QWORD aBlock[6];
  uint64_t v42;

  v32 = a4;
  v33 = a5;
  v31 = a3;
  v8 = sub_2476930B8();
  v39 = *(_QWORD *)(v8 - 8);
  v40 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v38 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2476930DC();
  v36 = *(_QWORD *)(v10 - 8);
  v37 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v35 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_24769304C();
  v42 = *(_QWORD *)(v34 - 8);
  v12 = *(_QWORD *)(v42 + 64);
  v13 = MEMORY[0x24BDAC7A8](v34);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v29 - v14;
  sub_247690418(a1, a2);
  sub_24769139C(a1, a2, (uint64_t)v15);
  if (!v5)
  {
    sub_247690798(0, &qword_2576B6FF0);
    v30 = sub_247693214();
    v16 = v42;
    v17 = v34;
    (*(void (**)(char *, char *, uint64_t))(v42 + 16))((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v15, v34);
    v18 = v16;
    v19 = (*(unsigned __int8 *)(v16 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v31;
    v21 = v17;
    (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v20 + v19, (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
    v22 = (_QWORD *)(v20 + ((v12 + v19 + 7) & 0xFFFFFFFFFFFFFFF8));
    v23 = v33;
    *v22 = v32;
    v22[1] = v23;
    aBlock[4] = sub_247690AA0;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24768DA7C;
    aBlock[3] = &block_descriptor_21;
    v24 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v25 = v35;
    sub_2476930D0();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_2476904DC(&qword_2576B6FF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576B7000);
    sub_247690390();
    v26 = v38;
    v27 = v40;
    sub_2476932B0();
    v28 = (void *)v30;
    MEMORY[0x24957FD0C](0, v25, v26, v24);
    _Block_release(v24);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v27);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v37);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v15, v21);
  }
}

uint64_t sub_24768E790(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  unint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *);

  v31 = a4;
  v32 = a3;
  v27 = a2;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576B70E8);
  MEMORY[0x24BDAC7A8](v30);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2476930F4();
  v28 = *(_QWORD *)(v8 - 8);
  v29 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24769304C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_allocWithZone((Class)sub_247693148());
  v16 = (void *)sub_24769313C();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v17(v14, a2, v11);
  v18 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = a1;
  *(_QWORD *)(v19 + 24) = v16;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v19 + v18, v14, v11);
  v20 = v16;
  sub_247691564((uint64_t)sub_247690AE8, v19);
  swift_release();
  v17(v14, v27, v11);
  v21 = v20;
  sub_2476930E8();
  v22 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576B70F0) + 48);
  v24 = v28;
  v23 = v29;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v7, v10, v29);
  *(_QWORD *)&v7[v22] = v21;
  swift_storeEnumTagMultiPayload();
  v25 = v21;
  v32(v7);

  sub_2476909F0((uint64_t)v7, &qword_2576B70E8);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v10, v23);
}

uint64_t sub_24768E9BC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  os_log_type_t v12;
  uint64_t v14;

  v6 = sub_24769304C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v11 = a2;
  v12 = sub_2476931D8();
  sub_247691F38(v12, (uint64_t)sub_247690B04, v10, 0, (uint64_t)"SnippetUI_Proto/ProtoVisualResponseProvider.swift", 49, 2, 160, (uint64_t)"responseView(for:mode:completion:)", 34);
  return swift_release();
}

uint64_t sub_24768EADC()
{
  uint64_t v1;

  v1 = sub_247693310();
  sub_247693184();
  sub_24769325C();
  OUTLINED_FUNCTION_22();
  swift_bridgeObjectRelease();
  sub_247693184();
  sub_247693130();
  sub_247693274();
  OUTLINED_FUNCTION_22();
  swift_bridgeObjectRelease();
  sub_247693184();
  sub_247693028();
  OUTLINED_FUNCTION_22();
  swift_bridgeObjectRelease();
  sub_247693184();
  return v1;
}

uint64_t sub_24768EBE8(void (*a1)(_QWORD *), uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576B70E8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v7 = a3;
  swift_storeEnumTagMultiPayload();
  v8 = a3;
  a1(v7);
  return sub_2476909F0((uint64_t)v7, &qword_2576B70E8);
}

Swift::Void __swiftcall ProtoVisualResponseProvider.reset()()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone((Class)sub_247693124()), sel_init);
  sub_247693118();

}

void static ProtoVisualResponseProvider.transformModel(_:mode:currentIdiom:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  static ProtoVisualResponseProvider.transform(model:mode:currentIdiom:)(a1, a2, a3, a4);
}

void static ProtoVisualResponseProvider.transform(model:mode:currentIdiom:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
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
  void (*v15)(_QWORD, _QWORD, _QWORD);
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
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, unint64_t, uint64_t);
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(_QWORD, unint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  void (*v54)(_QWORD, _QWORD, _QWORD);
  char v55;
  void (*v56)(_QWORD, _QWORD, _QWORD);
  char v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t, uint64_t);
  uint64_t v63;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int EnumTagSinglePayload;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t inited;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  void (*v94)(uint64_t, uint64_t);
  id v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void **v100;
  void *v101;
  void *v102;
  id v103;
  _QWORD v104[2];
  uint64_t v105;
  char *v106;
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
  unint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  void (*v131)(uint64_t, unint64_t, uint64_t);
  char *v132;
  uint64_t v133;
  void (*v134)(_QWORD, unint64_t, uint64_t);
  char *v135;
  void (*v136)(_QWORD, _QWORD, _QWORD);
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  __int128 v140;
  uint64_t v141;
  _OWORD v142[2];
  uint64_t v143;
  uint64_t v144;

  v114 = a4;
  v126 = a3;
  v110 = sub_247692FBC();
  v6 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_25();
  v144 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B7018);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_25();
  v124 = v11;
  OUTLINED_FUNCTION_17();
  v116 = sub_247692F8C();
  v115 = *(_QWORD *)(v116 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_13();
  v113 = v13;
  OUTLINED_FUNCTION_17();
  v138 = sub_247692F98();
  v128 = *(_QWORD *)(v138 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_2();
  v136 = v15;
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_25();
  v137 = v17;
  OUTLINED_FUNCTION_17();
  v133 = sub_24769301C();
  v132 = *(char **)(v133 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v135 = (char *)v104 - v21;
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_25();
  v129 = v24;
  OUTLINED_FUNCTION_17();
  v25 = sub_24769304C();
  v26 = (uint64_t (*)(uint64_t))MEMORY[0x24BEAD3D0];
  v27 = *(_QWORD *)(v25 - 8);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (uint64_t)v104 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)v104 - v31;
  sub_247690418(a1, a2);
  v33 = sub_2476904DC(&qword_2576B7020, v26, MEMORY[0x24BEAD3C8]);
  v34 = v139;
  sub_247692FD4();
  if (v34)
    goto LABEL_62;
  v104[1] = v33;
  v108 = v30;
  v105 = v27;
  v109 = 0;
  v107 = v25;
  v106 = v32;
  v35 = sub_247693040();
  v36 = (void (*)(uint64_t, unint64_t, uint64_t))MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v142[0] = MEMORY[0x24BEE4AF8];
  v37 = *(_QWORD *)(v35 + 16);
  v139 = v6;
  v121 = v37;
  if (v37)
  {
    OUTLINED_FUNCTION_1();
    v39 = v112;
    v40 = v129;
    v118 = v35;
    while (1)
    {
      if (v38 >= *(_QWORD *)(v35 + 16))
        goto LABEL_65;
      v41 = (v32[80] + 32) & ~(unint64_t)v32[80];
      v42 = *((_QWORD *)v32 + 9);
      v130 = v38;
      v127 = v42;
      v131 = (void (*)(uint64_t, unint64_t, uint64_t))*((_QWORD *)v32 + 2);
      v131(v40, v35 + v41 + v42 * v38, v30);
      v43 = sub_247693004();
      v44 = v35;
      v45 = v137;
      sub_247693268();
      v40 = *(_QWORD *)(v43 + 16);
      if (!v40)
        break;
      v119 = v41;
      v46 = v128;
      v120 = (*(unsigned __int8 *)(v128 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v128 + 80);
      v47 = *(void (**)(_QWORD, unint64_t, uint64_t))(v128 + 16);
      v35 = (uint64_t)v136;
      v48 = v138;
      v47(v136, v43 + v120, v138);
      v32 = (char *)sub_2476904DC(&qword_2576B7028, (uint64_t (*)(uint64_t))MEMORY[0x24BEAB638], MEMORY[0x24BEAB640]);
      swift_bridgeObjectRetain();
      v49 = sub_247693160();
      v50 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
      v50(v35, v48);
      if ((v49 & 1) == 0)
      {
        v134 = v47;
        if (v40 != 1)
        {
          v48 = *(_QWORD *)(v128 + 72);
          v111 = v43;
          v53 = v43 + v48 + v120;
          v30 = 1;
          v49 = v138;
          while (1)
          {
            v54 = v136;
            v134(v136, v53, v49);
            v35 = v30 + 1;
            if (__OFADD__(v30, 1))
              break;
            v55 = sub_247693160();
            v56 = v54;
            v57 = v55;
            v50((uint64_t)v56, v49);
            if ((v57 & 1) != 0)
            {
              OUTLINED_FUNCTION_7();
              OUTLINED_FUNCTION_1();
              OUTLINED_FUNCTION_24();
              v39 = v112;
              v51 = v137;
              goto LABEL_19;
            }
            ++v30;
            v53 += v48;
            v49 = v138;
            if (v35 == v40)
            {
              OUTLINED_FUNCTION_7();
              OUTLINED_FUNCTION_1();
              v39 = v112;
              OUTLINED_FUNCTION_15();
              goto LABEL_12;
            }
          }
          __break(1u);
          goto LABEL_64;
        }
        OUTLINED_FUNCTION_7();
        v32 = v132;
        v49 = v138;
        OUTLINED_FUNCTION_15();
        goto LABEL_11;
      }
      OUTLINED_FUNCTION_7();
      v32 = v132;
      OUTLINED_FUNCTION_24();
      v51 = v137;
      v30 = v133;
LABEL_19:
      v50(v51, v138);
      OUTLINED_FUNCTION_7();
      v58 = v122;
      v59 = v129;
      OUTLINED_FUNCTION_20(v122, v129);
      sub_247693280();
      v60 = sub_247693010();
      (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v49, v116);
      v61 = v58;
      v40 = v59;
      OUTLINED_FUNCTION_23(v61);
      v35 = v118;
      if ((v60 & 1) != 0)
      {
        v62 = (void (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v32 + 4);
        v62(v117, v40, v30);
        v63 = *(_QWORD *)&v142[0];
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v6 = v139;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_247690694(0, *(_QWORD *)(v63 + 16) + 1, 1);
          v63 = *(_QWORD *)&v142[0];
        }
        v66 = *(_QWORD *)(v63 + 16);
        v65 = *(_QWORD *)(v63 + 24);
        if (v66 >= v65 >> 1)
        {
          sub_247690694(v65 > 1, v66 + 1, 1);
          v63 = *(_QWORD *)&v142[0];
        }
        *(_QWORD *)(v63 + 16) = v66 + 1;
        v62(v63 + v119 + v66 * v127, v117, v30);
        *(_QWORD *)&v142[0] = v63;
        v32 = v132;
        v67 = v135;
        v40 = v129;
        goto LABEL_26;
      }
LABEL_25:
      OUTLINED_FUNCTION_23(v40);
      v6 = v139;
      v67 = v135;
LABEL_26:
      v38 = v130 + 1;
      if (v130 + 1 == v121)
      {
        v36 = *(void (**)(uint64_t, unint64_t, uint64_t))&v142[0];
        v68 = v108;
        goto LABEL_29;
      }
    }
    v50 = *(void (**)(uint64_t, uint64_t))(v128 + 8);
    v49 = v138;
    v48 = v122;
    v40 = v129;
    v52 = v45;
    v35 = v44;
LABEL_11:
    v30 = v133;
LABEL_12:
    v50(v52, v49);
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_20(v48, v40);
    OUTLINED_FUNCTION_23(v48);
    goto LABEL_25;
  }
  v68 = v108;
  OUTLINED_FUNCTION_1();
  v67 = v135;
  v39 = v112;
LABEL_29:
  swift_bridgeObjectRelease();
  v134 = (void (*)(_QWORD, unint64_t, uint64_t))*((_QWORD *)v36 + 2);
  if (!v134)
  {
    swift_release();
    v85 = MEMORY[0x24BEE4AF8];
LABEL_49:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576B7038);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2476937E0;
    *(_QWORD *)(inited + 32) = 0;
    v87 = v107;
    v88 = (uint64_t)v106;
    v89 = v105;
    v90 = MEMORY[0x24BEE4AF8];
    if (*(_QWORD *)(v85 + 16))
    {
      swift_bridgeObjectRetain();
      sub_247693034();
      swift_bridgeObjectRelease();
      v91 = v109;
      v92 = sub_247692FC8();
      v109 = v91;
      if (v91)
      {
        v94 = *(void (**)(uint64_t, uint64_t))(v89 + 8);
        v94(v68, v87);
        swift_bridgeObjectRelease();

        *(_QWORD *)(inited + 16) = 0;
        swift_setDeallocating();
        sub_24768FBD8();
        v94(v88, v87);
LABEL_62:
        OUTLINED_FUNCTION_10();
        return;
      }
      v96 = v92;
      v97 = v93;
      v138 = v85;
      sub_247690798(0, &qword_2576B7040);
      OUTLINED_FUNCTION_19(v68, *(uint64_t (**)(uint64_t, uint64_t))(v89 + 8));
      v95 = sub_24768FAC8(v96, v97, 1);
    }
    else
    {
      v138 = v85;
      v95 = 0;
    }
    *(_QWORD *)(inited + 40) = v95;
    *(_QWORD *)&v142[0] = inited;
    sub_2476931B4();
    v98 = *(_QWORD *)&v142[0];
    *(_QWORD *)&v142[0] = v90;
    v99 = *(_QWORD *)(v98 + 16);
    if (v99)
    {
      v100 = (void **)(v98 + 32);
      do
      {
        v102 = *v100++;
        v101 = v102;
        if (v102)
        {
          v103 = v101;
          MEMORY[0x24957FC88]();
          if (*(_QWORD *)((*(_QWORD *)&v142[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)&v142[0] & 0xFFFFFFFFFFFFFF8)
                                                                                            + 0x18) >> 1)
            sub_2476931C0();
          sub_2476931CC();
          sub_2476931B4();
        }
        --v99;
      }
      while (v99);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_19(v88, *(uint64_t (**)(uint64_t, uint64_t))(v89 + 8));
    goto LABEL_62;
  }
  v69 = 0;
  v70 = (v32[80] + 32) & ~(unint64_t)v32[80];
  v138 = MEMORY[0x24BEE4AF8];
  v130 = v70;
  v129 = (uint64_t)v36 + v70;
  v131 = v36;
  while (v69 < *((_QWORD *)v36 + 2))
  {
    v71 = *((_QWORD *)v32 + 9);
    v136 = (void (*)(_QWORD, _QWORD, _QWORD))*((_QWORD *)v32 + 2);
    v137 = v71;
    v136(v67, v129 + v71 * v69, v30);
    v72 = sub_247692FF8();
    v73 = *(_QWORD *)(v72 + 16);
    if (v73)
    {
      v74 = v72 + 32;
      while (1)
      {
        sub_2476906B0(v74, (uint64_t)&v140);
        __swift_project_boxed_opaque_existential_1(&v140, v141);
        v6 = v139;
        sub_247693064();
        sub_247692FB0();
        OUTLINED_FUNCTION_19(v144, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
        v75 = sub_247692FA4();
        EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v39, 1, v75);
        sub_2476909F0(v39, &qword_2576B7018);
        if (EnumTagSinglePayload != 1)
          break;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v140);
        v74 += 40;
        if (!--v73)
          goto LABEL_36;
      }
      sub_2476907D0(&v140, (uint64_t)v142);
    }
    else
    {
LABEL_36:
      v143 = 0;
      memset(v142, 0, sizeof(v142));
    }
    OUTLINED_FUNCTION_7();
    sub_247690744((uint64_t)v142, (uint64_t)&v140);
    v77 = v125;
    v30 = v133;
    if (v141)
    {
      __swift_project_boxed_opaque_existential_1(&v140, v141);
      sub_247693064();
      v78 = v124;
      sub_247692FB0();
      OUTLINED_FUNCTION_19(v77, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
      sub_2476909F0(v78, &qword_2576B7018);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v140);
    }
    else
    {
      sub_2476909F0((uint64_t)&v140, &qword_2576B7030);
      v79 = sub_247692FA4();
      v80 = v124;
      __swift_storeEnumTagSinglePayload(v124, 1, 1, v79);
      sub_2476909F0(v80, &qword_2576B7018);
    }
    v32 = v132;
    v81 = v123;
    v136(v123, v135, v30);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      v82 = v138;
    else
      v82 = sub_24768FC28(0, *(_QWORD *)(v138 + 16) + 1, 1, v138);
    v84 = *(_QWORD *)(v82 + 16);
    v83 = *(_QWORD *)(v82 + 24);
    if (v84 >= v83 >> 1)
      v82 = sub_24768FC28(v83 > 1, v84 + 1, 1, v82);
    ++v69;
    *(_QWORD *)(v82 + 16) = v84 + 1;
    v138 = v82;
    (*((void (**)(unint64_t, uint64_t, uint64_t))v32 + 4))(v82 + v130 + v84 * v137, v81, v30);
    sub_2476909F0((uint64_t)v142, &qword_2576B7030);
    v67 = v135;
    (*((void (**)(char *, uint64_t))v32 + 1))(v135, v30);
    v36 = v131;
    if ((void (*)(_QWORD, unint64_t, uint64_t))v69 == v134)
    {
      swift_release();
      v68 = v108;
      v85 = v138;
      goto LABEL_49;
    }
  }
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
}

id sub_24768FAC8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  id v8;

  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = (void *)sub_247692F74();
  v8 = objc_msgSend(v6, sel_initWithModel_responseType_, v7, a3);
  sub_247690488(a1, a2);

  return v8;
}

id ProtoVisualResponseProvider.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ProtoVisualResponseProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24768FBD8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B70D8);
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_24768FC28(char a1, int64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B70E0);
  v10 = *(_QWORD *)(sub_24769301C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    result = sub_2476932EC();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(sub_24769301C() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_24768FF18(a4 + v17, v8, v18);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24768FDF8(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_24768FDF8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_24769301C() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_247693304();
  __break(1u);
  return result;
}

uint64_t sub_24768FF18(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_247693304();
    __break(1u);
  }
  else if (a3 < a1 || (result = sub_24769301C(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_24769301C();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_247690014(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(sub_24769301C() - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_247693304();
  __break(1u);
  return result;
}

unint64_t sub_247690108(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_247693340();
  sub_247693178();
  v4 = sub_24769334C();
  return sub_24769016C(a1, a2, v4);
}

unint64_t sub_24769016C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24769331C() & 1) == 0)
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
      while (!v14 && (sub_24769331C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24769024C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v10;

  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v4;
  *v4 = 0x8000000000000000;
  sub_24769051C(a1, a2, a3, a4);
  *v4 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2476902D0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12();

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_24769030C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_16() - 8) + 80);
  return sub_24768D45C(*(void **)(v0 + 16), v0 + ((v1 + 24) & ~v1));
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495800A8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_247690390()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576B7008;
  if (!qword_2576B7008)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576B7000);
    result = MEMORY[0x2495800C0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2576B7008);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495800B4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_247690418(uint64_t a1, unint64_t a2)
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

uint64_t sub_24769045C()
{
  uint64_t v0;

  sub_247690488(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247690488(uint64_t a1, unint64_t a2)
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

uint64_t sub_2476904CC()
{
  uint64_t v0;

  return sub_24768E128(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_2476904DC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495800C0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24769051C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_247690108(a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576B7100);
  if ((sub_2476932E0() & 1) == 0)
    goto LABEL_5;
  v15 = sub_247690108(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    result = sub_247693328();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v5;
  if ((v14 & 1) != 0)
  {
    v18 = (uint64_t *)(v17[7] + 16 * v13);
    result = swift_bridgeObjectRelease();
    *v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_247690648(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_247690648(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

size_t sub_247690694(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_247690878(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_2476906B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_247690744(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576B7030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_247690798(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2476907D0(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for ProtoVisualResponseProvider()
{
  return objc_opt_self();
}

void type metadata accessor for VRXMode()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2576B7070)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2576B7070);
  }
}

uint64_t sub_247690850()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

size_t sub_247690878(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B70E0);
  v10 = *(_QWORD *)(sub_24769301C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_24769301C() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_24768FF18(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_247690014(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_2476909B8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2476909E4()
{
  uint64_t v0;

  return sub_24768EBE8(*(void (**)(_QWORD *))(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_2476909F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247690A2C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_9();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247690AA0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_9() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  return sub_24768E790(*(_QWORD *)(v0 + 16), v0 + v2, *(void (**)(char *))v3, *(_QWORD *)(v3 + 8));
}

uint64_t sub_247690AE8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_9();
  v0 = OUTLINED_FUNCTION_14();
  return sub_24768E9BC(v0, v1, v2);
}

uint64_t objectdestroy_23Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12();

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_0();
}

uint64_t sub_247690B48()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_14();
  return sub_24768EADC();
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

uint64_t sub_247690BA0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12();
  sub_247690488(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_18();
  return OUTLINED_FUNCTION_0();
}

void sub_247690BE4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_16();
  sub_24768D89C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_2476932F8();
}

void OUTLINED_FUNCTION_5()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1 + v3, v0);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_24769304C();
}

uint64_t OUTLINED_FUNCTION_14()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_247693088();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_18()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_19@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 288))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_247693184();
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

void *OUTLINED_FUNCTION_26@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_QWORD *)(v2 - 104) = v1;
  return _Block_copy((const void *)(v2 - 128));
}

uint64_t sub_247690DF0(uint64_t a1, uint64_t a2, int a3, void *a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
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
  id v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  void *v33;
  uint64_t v34;
  uint64_t *boxed_opaque_existential_1;
  id v36;
  uint64_t v37;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51[5];
  unint64_t v52;

  v43 = a7;
  v13 = sub_2476930F4();
  v41 = *(_QWORD *)(v13 - 8);
  v42 = v13;
  OUTLINED_FUNCTION_3();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v40 = (char *)&v40 - v18;
  v19 = OUTLINED_FUNCTION_45();
  v45 = *(_QWORD *)(v19 - 8);
  v46 = v19;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_6();
  v23 = v22 - v21;
  if (qword_2576B6FE0 != -1)
    swift_once();
  v24 = (id)qword_2576B71D8;
  sub_24769307C();
  sub_247693250();
  v47 = a1;
  v48 = a2;
  v49 = a3;
  sub_247693070();
  v50 = a5;
  v52 = a6;
  v25 = v44;
  ProtoVisualResponseProvider.responseView(for:mode:)((uint64_t)v17, a5, a6, v43);
  v26 = a4;
  if (v25)
  {
    v27 = v25;
    v28 = sub_2476931E4();
    LOBYTE(v39) = 2;
    sub_247691C04(v28, 0, (uint64_t)"SnippetUI_Proto/ProtoVisualResponseProvider.swift", 49, 2, 98, (uint64_t)"view(for:mode:overload:)", 24, v39, v25, 45, 0xD00000000000002DLL, 0x80000002476941F0);

    v29 = 0;
  }
  else
  {
    v31 = v40;
    v30 = v41;
    v32 = v17;
    v33 = a4;
    v34 = v42;
    (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v40, v32, v42);
    v51[3] = v34;
    v51[4] = MEMORY[0x24BEADA98];
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v51);
    (*(void (**)(uint64_t *, char *, uint64_t))(v30 + 16))(boxed_opaque_existential_1, v31, v34);
    v36 = objc_allocWithZone((Class)sub_24769310C());
    v29 = sub_247693100();
    v37 = v34;
    v26 = v33;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v37);
  }
  sub_247693244();
  sub_247693070();
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v23, v46);

  sub_247690488(v50, v52);
  return v29;
}

void sub_24769109C(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
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
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
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

  v48 = a6;
  v49 = a7;
  v12 = sub_24769304C();
  v46 = *(_QWORD *)(v12 - 8);
  v47 = v12;
  v13 = *(_QWORD *)(v46 + 64);
  v14 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v15 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v53 = (uint64_t)&v37 - v16;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576B7010);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_6();
  v45 = v19 - v18;
  v20 = OUTLINED_FUNCTION_45();
  v50 = *(_QWORD *)(v20 - 8);
  v51 = v20;
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_6();
  if (qword_2576B6FE0 != -1)
    swift_once();
  v22 = (id)qword_2576B71D8;
  sub_24769307C();
  sub_247693250();
  sub_247693070();
  v41 = a2;
  v42 = a1;
  v43 = a3;
  sub_247690418(a4, a5);
  v23 = v52;
  sub_2476913B0(a4, a5, v53);
  if (v23)
  {
    OUTLINED_FUNCTION_39();
    v24 = a4;
    v25 = a5;
  }
  else
  {
    v26 = objc_allocWithZone((Class)sub_247693148());
    v40 = a4;
    v52 = 0;
    v27 = (void *)sub_24769313C();
    v28 = v46;
    v29 = v47;
    v38 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
    v38(v15, v53, v47);
    v30 = *(unsigned __int8 *)(v28 + 80);
    v39 = a5;
    v31 = (v30 + 32) & ~v30;
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = v48;
    *(_QWORD *)(v32 + 24) = v27;
    (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v32 + v31, v15, v29);
    v33 = v27;
    sub_247691564((uint64_t)sub_247692BF4, v32);
    swift_release();
    v44 = *(int *)(v44 + 48);
    v34 = v53;
    v38(v15, v53, v29);
    v35 = v33;
    v36 = v45;
    sub_2476930E8();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v34, v29);
    *(_QWORD *)(v36 + v44) = v35;
    sub_247693244();
    sub_247693070();
    OUTLINED_FUNCTION_39();
    sub_247692C24(v36, v49);
    v25 = v39;
    v24 = v40;
  }
  sub_247690488(v24, v25);
  OUTLINED_FUNCTION_10();
}

void sub_24769139C(uint64_t a1@<X3>, unint64_t a2@<X4>, uint64_t a3@<X8>)
{
  sub_2476913B0(a1, a2, a3);
}

void sub_2476913B0(uint64_t a1@<X3>, unint64_t a2@<X4>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v12;

  v5 = sub_24769304C();
  v10 = *(_QWORD *)(v5 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_6();
  v8 = v7 - v6;
  sub_247693088();
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_34();
  if (qword_2576B6FE0 != -1)
    swift_once();
  v9 = (id)qword_2576B71D8;
  sub_24769307C();
  sub_247693250();
  sub_247693070();
  sub_247690418(a1, a2);
  sub_2476904DC(&qword_2576B7020, (uint64_t (*)(uint64_t))MEMORY[0x24BEAD3D0], MEMORY[0x24BEAD3C8]);
  sub_247692FD4();
  if (v12)
  {
    OUTLINED_FUNCTION_27();
  }
  else
  {
    sub_247693244();
    sub_247693070();
    OUTLINED_FUNCTION_27();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(a3, v8, v5);
  }
  sub_247690488(a1, a2);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_247691564(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  _QWORD aBlock[6];

  v5 = sub_2476930B8();
  v14 = *(_QWORD *)(v5 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_6();
  v8 = v7 - v6;
  v9 = sub_2476930DC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_34();
  if (qword_2576B6FD8 != -1)
    swift_once();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  aBlock[4] = sub_247692B08;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24768DA7C;
  aBlock[3] = &block_descriptor_0;
  v12 = _Block_copy(aBlock);
  swift_retain();
  sub_2476930D0();
  sub_2476904DC(&qword_2576B6FF8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B7000);
  sub_247692B40((unint64_t *)&qword_2576B7008, &qword_2576B7000);
  sub_2476932B0();
  MEMORY[0x24957FD0C](0, v2, v8, v12);
  _Block_release(v12);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v8, v5);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2, v9);
  return swift_release();
}

uint64_t sub_24769175C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t result;
  _QWORD v6[2];

  v0 = sub_247693208();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2476931FC();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  sub_2476930DC();
  MEMORY[0x24BDAC7A8]();
  sub_247690798(0, &qword_2576B6FF0);
  sub_2476930D0();
  v6[1] = MEMORY[0x24BEE4AF8];
  sub_2476904DC(&qword_2576B71E8, v4, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B71F0);
  sub_247692B40(&qword_2576B71F8, &qword_2576B71F0);
  sub_2476932B0();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  result = sub_24769322C();
  qword_2576B71D0 = result;
  return result;
}

void sub_24769192C(os_log_type_t a1, char a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (qword_2576B6FE0 != -1)
    swift_once();
  if (os_log_type_enabled((os_log_t)qword_2576B71D8, a1))
  {
    if ((a2 & 1) != 0)
    {
      if (qword_2576B6FE8 != -1)
        swift_once();
      v18 = OUTLINED_FUNCTION_19_0();
      v19 = OUTLINED_FUNCTION_30(v18, (uint64_t)qword_2576B7210);
      if (OUTLINED_FUNCTION_40(v19))
      {
        v6 = OUTLINED_FUNCTION_0_0();
        v36 = OUTLINED_FUNCTION_0_0();
        v20 = OUTLINED_FUNCTION_23_0(4.8755e-34);
        OUTLINED_FUNCTION_37(v20, v21, v22, v23, v24, v36);
        OUTLINED_FUNCTION_8_0();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_6_0();
        *(_WORD *)(v6 + 22) = 2082;
        v25 = OUTLINED_FUNCTION_26_0();
        OUTLINED_FUNCTION_37(v25, v26, v27, v28, v29);
        OUTLINED_FUNCTION_15_0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v6 + 32) = 2080;
        OUTLINED_FUNCTION_22_0((uint64_t)"iOS does not support vending viewControllers. This is done to prevent clients from mistakenly believing they will show on lockscreen", v31, (uint64_t)v32, v34);
        OUTLINED_FUNCTION_12_0();
        v17 = "%{public}s:%{public}lu [%{public}s] %s";
LABEL_13:
        OUTLINED_FUNCTION_43(&dword_24768B000, v33, a1, v17, (uint8_t *)v6);
        OUTLINED_FUNCTION_24_0();
        OUTLINED_FUNCTION_1_0();
      }
    }
    else
    {
      if (qword_2576B6FE8 != -1)
        swift_once();
      v4 = OUTLINED_FUNCTION_19_0();
      v5 = OUTLINED_FUNCTION_30(v4, (uint64_t)qword_2576B7210);
      if (OUTLINED_FUNCTION_40(v5))
      {
        v6 = OUTLINED_FUNCTION_0_0();
        v35 = OUTLINED_FUNCTION_0_0();
        v7 = OUTLINED_FUNCTION_23_0(4.8755e-34);
        OUTLINED_FUNCTION_37(v7, v8, v9, v10, v11, v35);
        OUTLINED_FUNCTION_8_0();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_6_0();
        *(_WORD *)(v6 + 22) = 2082;
        v12 = OUTLINED_FUNCTION_26_0();
        OUTLINED_FUNCTION_37(v12, v13, v14, v15, v16);
        OUTLINED_FUNCTION_15_0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v6 + 32) = 2082;
        OUTLINED_FUNCTION_22_0((uint64_t)"iOS does not support vending viewControllers. This is done to prevent clients from mistakenly believing they will show on lockscreen", v30, (uint64_t)v32, v34);
        OUTLINED_FUNCTION_12_0();
        v17 = "%{public}s:%{public}lu [%{public}s] %{public}s";
        goto LABEL_13;
      }
    }

  }
}

void sub_247691BB8(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, void *a10)
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  sub_247691C04(a1, a2, a3, a4, a5, a6, a7, a8, v10, a10, 33, 0xD000000000000021, 0x8000000247693F60);
}

void sub_247691C04(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
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
  const char *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  os_log_type_t v48;
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
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;

  if (qword_2576B6FE0 != -1)
    swift_once();
  if (os_log_type_enabled((os_log_t)qword_2576B71D8, (os_log_type_t)a1))
  {
    if ((a2 & 1) != 0)
    {
      if (qword_2576B6FE8 != -1)
        swift_once();
      v31 = OUTLINED_FUNCTION_19_0();
      v32 = OUTLINED_FUNCTION_30(v31, (uint64_t)qword_2576B7210);
      if (OUTLINED_FUNCTION_42(v32))
      {
        HIDWORD(v47) = a1;
        v17 = OUTLINED_FUNCTION_0_0();
        v61 = OUTLINED_FUNCTION_0_0();
        v33 = OUTLINED_FUNCTION_9_0(4.8755e-34);
        OUTLINED_FUNCTION_10_0(v33, v34);
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_7_0();
        *(_WORD *)(v17 + 22) = 2082;
        v35 = OUTLINED_FUNCTION_29();
        v58 = OUTLINED_FUNCTION_10_0(v35, v36);
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_7();
        *(_WORD *)(v17 + 32) = 2080;
        OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_28();
        swift_getErrorValue();
        sub_247693334();
        OUTLINED_FUNCTION_46();
        swift_bridgeObjectRelease();
        v37 = OUTLINED_FUNCTION_35();
        OUTLINED_FUNCTION_33(v37, v38, v39, v40, v41, v42, v43, v44, v45, v47, v61, a11, a12, a13, v49, v50, v51, v52, v53,
          v54,
          v55,
          v56,
          v58,
          v59);
        OUTLINED_FUNCTION_16_0();
        OUTLINED_FUNCTION_36();
        v30 = "%{public}s:%{public}lu [%{public}s] %s";
LABEL_13:
        OUTLINED_FUNCTION_43(&dword_24768B000, v46, v48, v30, (uint8_t *)v17);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1_0();
      }
    }
    else
    {
      if (qword_2576B6FE8 != -1)
        swift_once();
      v15 = OUTLINED_FUNCTION_19_0();
      v16 = OUTLINED_FUNCTION_30(v15, (uint64_t)qword_2576B7210);
      if (OUTLINED_FUNCTION_42(v16))
      {
        HIDWORD(v47) = a1;
        v17 = OUTLINED_FUNCTION_0_0();
        v60 = OUTLINED_FUNCTION_0_0();
        v18 = OUTLINED_FUNCTION_9_0(4.8755e-34);
        OUTLINED_FUNCTION_10_0(v18, v19);
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_7_0();
        *(_WORD *)(v17 + 22) = 2082;
        v20 = OUTLINED_FUNCTION_29();
        v57 = OUTLINED_FUNCTION_10_0(v20, v21);
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_7();
        *(_WORD *)(v17 + 32) = 2082;
        OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_28();
        swift_getErrorValue();
        sub_247693334();
        OUTLINED_FUNCTION_46();
        swift_bridgeObjectRelease();
        v22 = OUTLINED_FUNCTION_35();
        OUTLINED_FUNCTION_33(v22, v23, v24, v25, v26, v27, v28, v29, v45, v47, v60, a11, a12, a13, v49, v50, v51, v52, v53,
          v54,
          v55,
          v56,
          v57,
          v59);
        OUTLINED_FUNCTION_16_0();
        OUTLINED_FUNCTION_36();
        v30 = "%{public}s:%{public}lu [%{public}s] %{public}s";
        goto LABEL_13;
      }
    }

  }
}

uint64_t sub_247691F38(os_log_type_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  NSObject *v10;
  os_log_type_t v11;
  uint64_t result;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  if (qword_2576B6FE0 != -1)
    swift_once();
  result = os_log_type_enabled((os_log_t)qword_2576B71D8, a1);
  if ((_DWORD)result)
  {
    if ((a4 & 1) != 0)
    {
      if (qword_2576B6FE8 != -1)
        swift_once();
      v40 = OUTLINED_FUNCTION_19_0();
      __swift_project_value_buffer(v40, (uint64_t)qword_2576B7210);
      OUTLINED_FUNCTION_41();
      v41 = sub_247693094();
      if (OUTLINED_FUNCTION_32(v41))
      {
        v17 = OUTLINED_FUNCTION_0_0();
        v64 = OUTLINED_FUNCTION_0_0();
        v42 = OUTLINED_FUNCTION_20_0(4.8755e-34);
        OUTLINED_FUNCTION_18_0(v42, v43, v44, v45, v46, v47, v48, v64, a9, a10);
        OUTLINED_FUNCTION_2_0();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_5_0();
        *(_WORD *)(v17 + 22) = 2082;
        v49 = OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_18_0(v49, v50, v51, v52, v53, v54, v55);
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_7();
        *(_WORD *)(v17 + 32) = 2080;
        v56 = OUTLINED_FUNCTION_44();
        OUTLINED_FUNCTION_18_0(v56, v57, v58, v59, v60, v61, v62);
        OUTLINED_FUNCTION_11_0();
        OUTLINED_FUNCTION_25_0();
        OUTLINED_FUNCTION_36();
        v39 = "%{public}s:%{public}lu [%{public}s] %s";
LABEL_13:
        OUTLINED_FUNCTION_43(&dword_24768B000, v10, v11, v39, (uint8_t *)v17);
        OUTLINED_FUNCTION_24_0();
        OUTLINED_FUNCTION_1_0();
      }
    }
    else
    {
      if (qword_2576B6FE8 != -1)
        swift_once();
      v15 = OUTLINED_FUNCTION_19_0();
      __swift_project_value_buffer(v15, (uint64_t)qword_2576B7210);
      OUTLINED_FUNCTION_41();
      v16 = sub_247693094();
      if (OUTLINED_FUNCTION_32(v16))
      {
        v17 = OUTLINED_FUNCTION_0_0();
        v63 = OUTLINED_FUNCTION_0_0();
        v18 = OUTLINED_FUNCTION_20_0(4.8755e-34);
        OUTLINED_FUNCTION_18_0(v18, v19, v20, v21, v22, v23, v24, v63, a9, a10);
        OUTLINED_FUNCTION_2_0();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_5_0();
        *(_WORD *)(v17 + 22) = 2082;
        v25 = OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_18_0(v25, v26, v27, v28, v29, v30, v31);
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_7();
        *(_WORD *)(v17 + 32) = 2082;
        v32 = OUTLINED_FUNCTION_44();
        OUTLINED_FUNCTION_18_0(v32, v33, v34, v35, v36, v37, v38);
        OUTLINED_FUNCTION_11_0();
        OUTLINED_FUNCTION_25_0();
        OUTLINED_FUNCTION_36();
        v39 = "%{public}s:%{public}lu [%{public}s] %{public}s";
        goto LABEL_13;
      }
    }

    return OUTLINED_FUNCTION_25_0();
  }
  return result;
}

uint64_t sub_2476921FC()
{
  uint64_t result;

  sub_247690798(0, &qword_2576B7200);
  result = sub_24769328C();
  qword_2576B71D8 = result;
  return result;
}

uint64_t sub_247692268()
{
  uint64_t v0;
  id v1;

  v0 = sub_2476930A0();
  __swift_allocate_value_buffer(v0, qword_2576B7210);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576B7210);
  if (qword_2576B6FE0 != -1)
    swift_once();
  v1 = (id)qword_2576B71D8;
  return sub_2476930AC();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_247692300(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2476923D0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_247692524((uint64_t)v12, *a3);
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
      sub_247692524((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2476923D0(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_247692560((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2476932A4();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_247692624(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2476932D4();
    if (!v8)
    {
      result = sub_2476932EC();
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

uint64_t sub_247692524(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_247692560(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_247693304();
  __break(1u);
  return result;
}

uint64_t sub_247692624(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2476926B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_24769288C(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_24769288C((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2476926B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_247693190();
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
  v3 = sub_247692828(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2476932BC();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_247693304();
  __break(1u);
LABEL_14:
  result = sub_2476932EC();
  __break(1u);
  return result;
}

_QWORD *sub_247692828(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576B71E0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24769288C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576B71E0);
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
    sub_247692A24(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_247692960(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_247692960(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_247693304();
  __break(1u);
  return result;
}

char *sub_247692A24(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_247693304();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

uint64_t sub_247692AE4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247692B08()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_247692B40(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495800C0](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247692B80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_24769304C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_247692BF4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_24769304C() - 8) + 80);
  return sub_24768DCFC(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

uint64_t sub_247692C24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576B7010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_1_0()
{
  JUMPOUT(0x249580138);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return sub_247693298();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_247693298();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2050;
  return sub_247693298();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2050;
  return sub_247693298();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2050;
  return sub_247693298();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_247693298();
}

uint64_t OUTLINED_FUNCTION_9_0(float a1)
{
  float *v1;

  *v1 = a1;
  return sub_2476932C8();
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_247692300(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_247693298();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_247693298();
}

void OUTLINED_FUNCTION_14_0(os_log_type_t a1, char a2)
{
  sub_24769192C(a1, a2);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_247693298();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return sub_247693298();
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  return sub_247692300(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return sub_2476930A0();
}

uint64_t OUTLINED_FUNCTION_20_0(float a1)
{
  float *v1;

  *v1 = a1;
  return sub_2476932C8();
}

uint64_t OUTLINED_FUNCTION_22_0@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  return sub_247692300(0xD000000000000084, (a1 - 32) | 0x8000000000000000, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_23_0(float a1)
{
  float *v1;

  *v1 = a1;
  return sub_2476932C8();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return sub_2476932C8();
}

uint64_t OUTLINED_FUNCTION_27()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 96) + 8))(v0, *(_QWORD *)(v1 - 72));
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_247693184();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_2476932C8();
}

uint64_t OUTLINED_FUNCTION_30(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_247693094();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_2476932C8();
}

BOOL OUTLINED_FUNCTION_32(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,unint64_t a24)
{
  uint64_t v24;

  return sub_247692300(a23, a24, (uint64_t *)(v24 - 96));
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_247693184();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_37(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  return sub_247692300(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_247693310();
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 104) + 8))(v0, *(_QWORD *)(v1 - 96));
}

BOOL OUTLINED_FUNCTION_40(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_retain_n();
}

BOOL OUTLINED_FUNCTION_42(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

void OUTLINED_FUNCTION_43(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_44()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_247693088();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return sub_247693184();
}

uint64_t sub_247692F74()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_247692F80()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_247692F8C()
{
  return MEMORY[0x24BEAA9A0]();
}

uint64_t sub_247692F98()
{
  return MEMORY[0x24BEAB638]();
}

uint64_t sub_247692FA4()
{
  return MEMORY[0x24BEAB848]();
}

uint64_t sub_247692FB0()
{
  return MEMORY[0x24BEAB858]();
}

uint64_t sub_247692FBC()
{
  return MEMORY[0x24BEAB860]();
}

uint64_t sub_247692FC8()
{
  return MEMORY[0x24BEAB8F0]();
}

uint64_t sub_247692FD4()
{
  return MEMORY[0x24BEAB8F8]();
}

uint64_t sub_247692FE0()
{
  return MEMORY[0x24BEAC0E8]();
}

uint64_t sub_247692FEC()
{
  return MEMORY[0x24BEAC138]();
}

uint64_t sub_247692FF8()
{
  return MEMORY[0x24BEAD310]();
}

uint64_t sub_247693004()
{
  return MEMORY[0x24BEAD318]();
}

uint64_t sub_247693010()
{
  return MEMORY[0x24BEAD320]();
}

uint64_t sub_24769301C()
{
  return MEMORY[0x24BEAD328]();
}

uint64_t sub_247693028()
{
  return MEMORY[0x24BEAD398]();
}

uint64_t sub_247693034()
{
  return MEMORY[0x24BEAD3A0]();
}

uint64_t sub_247693040()
{
  return MEMORY[0x24BEAD3C0]();
}

uint64_t sub_24769304C()
{
  return MEMORY[0x24BEAD3D0]();
}

uint64_t sub_247693058()
{
  return MEMORY[0x24BEAD3E0]();
}

uint64_t sub_247693064()
{
  return MEMORY[0x24BEAD498]();
}

uint64_t sub_247693070()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_24769307C()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_247693088()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_247693094()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2476930A0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2476930AC()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2476930B8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2476930C4()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2476930D0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2476930DC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2476930E8()
{
  return MEMORY[0x24BEADA90]();
}

uint64_t sub_2476930F4()
{
  return MEMORY[0x24BEADAA0]();
}

uint64_t sub_247693100()
{
  return MEMORY[0x24BEADEC8]();
}

uint64_t sub_24769310C()
{
  return MEMORY[0x24BEADED0]();
}

uint64_t sub_247693118()
{
  return MEMORY[0x24BEAE1A8]();
}

uint64_t sub_247693124()
{
  return MEMORY[0x24BEAE1B0]();
}

uint64_t sub_247693130()
{
  return MEMORY[0x24BEAE468]();
}

uint64_t sub_24769313C()
{
  return MEMORY[0x24BEAE518]();
}

uint64_t sub_247693148()
{
  return MEMORY[0x24BEAE580]();
}

uint64_t sub_247693154()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_247693160()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24769316C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_247693178()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_247693184()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_247693190()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24769319C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2476931A8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2476931B4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2476931C0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2476931CC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2476931D8()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2476931E4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2476931F0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2476931FC()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_247693208()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_247693214()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_247693220()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_24769322C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_247693238()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_247693244()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_247693250()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_24769325C()
{
  return MEMORY[0x24BEAE5E8]();
}

uint64_t sub_247693268()
{
  return MEMORY[0x24BEAE5F0]();
}

uint64_t sub_247693274()
{
  return MEMORY[0x24BEAE5F8]();
}

uint64_t sub_247693280()
{
  return MEMORY[0x24BEAE600]();
}

uint64_t sub_24769328C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_247693298()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2476932A4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2476932B0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2476932BC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2476932C8()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_2476932D4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2476932E0()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2476932EC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2476932F8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_247693304()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_247693310()
{
  return MEMORY[0x24BEE3950]();
}

uint64_t sub_24769331C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_247693328()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_247693334()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_247693340()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24769334C()
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

