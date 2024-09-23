uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24953CEAC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24953CEB8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_245834EC4()
{
  return sub_24585A5FC();
}

uint64_t sub_245834EE4()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_245834F18();
  return v0;
}

_QWORD *sub_245834F18()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v1 = v0;
  v2 = sub_24585A584();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24585A5CC();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930];
  MEMORY[0x24BDAC7A8](v6);
  v8 = sub_24585A374();
  MEMORY[0x24BDAC7A8](v8);
  v12[0] = sub_24583AC8C(0, (unint64_t *)&qword_254417468);
  sub_24585A368();
  v12[1] = MEMORY[0x24BEE4AF8];
  sub_24583661C((unint64_t *)&unk_254417800, 255, v7, MEMORY[0x24BEE5940]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544177F0);
  sub_2458383AC(&qword_2544177F8, &qword_2544177F0, MEMORY[0x24BEE12C8]);
  sub_24585A638();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5758], v2);
  v9 = sub_24585A5D8();
  v10 = MEMORY[0x24BEE4B00];
  v1[3] = v9;
  v1[4] = v10;
  v1[2] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE900C8]), sel_initWithQueue_, v9);
  return v1;
}

BOOL sub_245835120(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_245835138()
{
  sub_24585A824();
  sub_24585A830();
  return sub_24585A854();
}

uint64_t sub_24583517C()
{
  return sub_24585A830();
}

uint64_t sub_2458351A4()
{
  sub_24585A824();
  sub_24585A830();
  return sub_24585A854();
}

void sub_2458351E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint8_t *v14;
  uint8_t *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v21 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D60);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = sub_24585A344();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24584B354();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = sub_24585A32C();
  v12 = sub_24585A578();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v20 = a1;
    v14 = v13;
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_245833000, v11, v12, "Will fetch list of eligible devices", v13, 2u);
    v15 = v14;
    a1 = v20;
    MEMORY[0x24953CF60](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v16 = *(void **)(v21 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  v17 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v18 + v17, (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  aBlock[4] = sub_2458386B0;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2458362CC;
  aBlock[3] = &block_descriptor_23;
  v19 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v16, sel_listCandidateDevicesForType_completionHandler_, 5, v19);
  _Block_release(v19);
}

uint64_t sub_2458353FC(unint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint8_t *v17;
  void (*v18)(char *, uint64_t);
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v30;
  _QWORD *v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  char v34;

  v6 = sub_24585A344();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - v11;
  if ((a1 & 0xC000000000000001) == 0)
  {
    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_5;
LABEL_10:
    sub_245835FCC(MEMORY[0x24BEE4B00], a1);
    v33 = v28;
    v34 = 0;
    goto LABEL_13;
  }
  if (sub_24585A65C())
    goto LABEL_10;
LABEL_5:
  v13 = sub_24584B354();
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v32(v12, v13, v6);
  v14 = sub_24585A32C();
  v15 = sub_24585A578();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v31 = a3;
    v17 = v16;
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_245833000, v14, v15, "No devices are eligible", v16, 2u);
    MEMORY[0x24953CF60](v17, -1, -1);
  }

  v18 = *(void (**)(char *, uint64_t))(v7 + 8);
  v18(v12, v6);
  if (!a2)
    goto LABEL_10;
  v32(v10, v13, v6);
  v19 = a2;
  v20 = a2;
  v21 = a2;
  v22 = sub_24585A32C();
  v23 = sub_24585A56C();
  if (os_log_type_enabled(v22, v23))
  {
    v32 = (void (*)(char *, uint64_t, uint64_t))v18;
    v24 = (uint8_t *)swift_slowAlloc();
    v31 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v24 = 138412290;
    v25 = a2;
    v26 = _swift_stdlib_bridgeErrorToNSError();
    v33 = v26;
    v18 = (void (*)(char *, uint64_t))v32;
    sub_24585A614();
    v27 = v31;
    *v31 = v26;

    _os_log_impl(&dword_245833000, v22, v23, "Failed to list candidate devices: %@", v24, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D78);
    swift_arrayDestroy();
    MEMORY[0x24953CF60](v27, -1, -1);
    MEMORY[0x24953CF60](v24, -1, -1);
  }
  else
  {

  }
  v18(v10, v6);
  v33 = (uint64_t)a2;
  v34 = 1;
LABEL_13:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D60);
  return sub_24585A470();
}

void sub_24583571C(uint64_t *a1, void **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
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
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint8_t *v38;
  char *v39;
  void (*v40)(char *, char *, uint64_t);
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  NSObject *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  _QWORD *v50;
  NSObject *v51;
  uint8_t *v52;
  _QWORD *v53;
  NSObject *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  NSObject *v58;
  uint8_t *v59;
  uint8_t *v60;
  uint8_t *v61;
  uint64_t *v62;
  uint64_t v63;
  char *v64;
  char isUniquelyReferenced_nonNull_native;
  char v66;
  void (*v67)(uint64_t, uint64_t);
  uint64_t v68;
  uint8_t *v69;
  uint8_t *v70;
  void (*v71)(char *, char *, uint64_t);
  char *v72;
  uint64_t *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v73 = a1;
  v3 = sub_24585A344();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v68 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v68 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D80);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_24585A1E8();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v72 = (char *)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v75 = (char *)&v68 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v74 = (char *)&v68 - v22;
  v23 = *a2;
  v24 = objc_msgSend(v23, sel_uniqueID);
  v76 = v4;
  v77 = v3;
  if (!v24)
    goto LABEL_4;
  v25 = v24;
  sub_24585A410();

  sub_24585A1AC();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_24583AE20((uint64_t)v15, &qword_2574B2D80);
    v4 = v76;
    v3 = v77;
LABEL_4:
    v26 = sub_24584B354();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v26, v3);
    v27 = v23;
    v28 = sub_24585A32C();
    v29 = v4;
    v30 = sub_24585A56C();
    if (os_log_type_enabled(v28, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v79 = v32;
      *(_DWORD *)v31 = 136446210;
      v33 = objc_msgSend(v27, sel_uniqueID);
      if (v33)
      {
        v34 = v33;
        v35 = sub_24585A410();
        v37 = v36;

        v78 = sub_2458387F8(v35, v37, &v79);
        sub_24585A614();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_245833000, v28, v30, "Device ID is not a UUID: %{public}s", v31, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24953CF60](v32, -1, -1);
        MEMORY[0x24953CF60](v31, -1, -1);

        (*(void (**)(char *, uint64_t))(v76 + 8))(v7, v77);
      }
      else
      {

        __break(1u);
      }
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v3);
    }
    return;
  }
  v38 = (uint8_t *)v17;
  v39 = v74;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v74, v15, v16);
  v40 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v40(v75, v39, v16);
  v41 = objc_msgSend(v23, sel_enabledAsKey);
  v42 = sub_24584B354();
  v44 = v76;
  v43 = v77;
  v45 = *(void (**)(char *, uint64_t, uint64_t))(v76 + 16);
  v71 = v40;
  if (v41)
  {
    v45(v12, v42, v77);
    v46 = v23;
    v47 = sub_24585A32C();
    v48 = sub_24585A578();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      v50 = (_QWORD *)swift_slowAlloc();
      v69 = v49;
      v70 = v38;
      *(_DWORD *)v49 = 138543362;
      v79 = (uint64_t)v46;
      v51 = v46;
      v38 = v70;
      v39 = v74;
      v44 = v76;
      sub_24585A614();
      *v50 = v46;

      v52 = v69;
      _os_log_impl(&dword_245833000, v47, v48, "Unlock enabled for device %{public}@", v69, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D78);
      v53 = v50;
      v43 = v77;
      swift_arrayDestroy();
      MEMORY[0x24953CF60](v53, -1, -1);
      MEMORY[0x24953CF60](v52, -1, -1);
    }
    else
    {

      v47 = v46;
    }
    v62 = v73;

    (*(void (**)(char *, uint64_t))(v44 + 8))(v12, v43);
    v63 = (uint64_t)v72;
    v64 = v75;
    v71(v72, v75, v16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v79 = *v62;
    *v62 = 0x8000000000000000;
    v66 = 1;
  }
  else
  {
    v45(v10, v42, v77);
    v54 = v23;
    v55 = sub_24585A32C();
    v56 = sub_24585A578();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      v69 = (uint8_t *)swift_slowAlloc();
      v70 = v57;
      *(_DWORD *)v57 = 138543362;
      v79 = (uint64_t)v54;
      v58 = v54;
      v44 = v76;
      v43 = v77;
      sub_24585A614();
      v59 = v69;
      *(_QWORD *)v69 = v54;

      v60 = v70;
      _os_log_impl(&dword_245833000, v55, v56, "Unlock not enabled for device %{public}@", v70, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D78);
      v61 = v59;
      v39 = v74;
      swift_arrayDestroy();
      MEMORY[0x24953CF60](v61, -1, -1);
      MEMORY[0x24953CF60](v60, -1, -1);
    }
    else
    {

      v55 = v54;
    }
    v62 = v73;

    (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v43);
    v63 = (uint64_t)v72;
    v64 = v75;
    v71(v72, v75, v16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v79 = *v62;
    *v62 = 0x8000000000000000;
    v66 = 0;
  }
  sub_245839A6C(v66, v63, isUniquelyReferenced_nonNull_native);
  *v62 = v79;
  swift_bridgeObjectRelease();
  v67 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v38 + 1);
  v67(v63, v16);
  v67((uint64_t)v64, v16);
  v67((uint64_t)v39, v16);
}

uint64_t sub_245835E3C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D28);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_24583AE20(a1, &qword_2574B2D28);
    sub_245838E38(a2, (uint64_t)v8);
    v13 = sub_24585A1E8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a2, v13);
    return sub_24583AE20((uint64_t)v8, &qword_2574B2D28);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v3;
    *v3 = 0x8000000000000000;
    sub_245839BBC((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v18;
    swift_bridgeObjectRelease();
    v16 = sub_24585A1E8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a2, v16);
  }
}

void sub_245835FCC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  id v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  char *v18;
  _QWORD *v19;
  void *v20[6];
  uint64_t v21;

  v3 = v2;
  v4 = a2;
  v21 = a1;
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_24585A650();
    sub_24583AC8C(0, &qword_2574B2D68);
    sub_245838700(&qword_2574B2D70, &qword_2574B2D68);
    sub_24585A560();
    v4 = (unint64_t)v20[1];
    v19 = v20[2];
    v5 = (uint64_t)v20[3];
    v6 = (char *)v20[4];
    v7 = (unint64_t)v20[5];
  }
  else
  {
    v8 = -1 << *(_BYTE *)(a2 + 32);
    v19 = (_QWORD *)(a2 + 56);
    v5 = ~v8;
    v9 = -v8;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v7 = v10 & *(_QWORD *)(a2 + 56);
    swift_bridgeObjectRetain();
    v6 = 0;
  }
  v11 = (unint64_t)(v5 + 64) >> 6;
  if ((v4 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_8:
  if (!sub_24585A668())
    goto LABEL_35;
  sub_24583AC8C(0, &qword_2574B2D68);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v12 = v20[0];
  swift_unknownObjectRelease();
  v13 = (int64_t)v6;
  v14 = v7;
  if (!v12)
    goto LABEL_35;
  while (1)
  {
    v20[0] = v12;
    sub_24583571C(&v21, v20);
    if (v3)
    {
      swift_bridgeObjectRelease();

      sub_2458387F0();
      return;
    }

    v6 = (char *)v13;
    v7 = v14;
    if ((v4 & 0x8000000000000000) != 0)
      goto LABEL_8;
LABEL_11:
    if (!v7)
      break;
    v14 = (v7 - 1) & v7;
    v15 = __clz(__rbit64(v7)) | ((_QWORD)v6 << 6);
    v13 = (int64_t)v6;
LABEL_24:
    v12 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v15);
    if (!v12)
      goto LABEL_35;
  }
  v13 = (int64_t)(v6 + 1);
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    return;
  }
  if (v13 >= v11)
    goto LABEL_35;
  v16 = v19[v13];
  if (v16)
  {
LABEL_23:
    v14 = (v16 - 1) & v16;
    v15 = __clz(__rbit64(v16)) + (v13 << 6);
    goto LABEL_24;
  }
  v17 = (int64_t)(v6 + 2);
  if ((uint64_t)(v6 + 2) >= v11)
    goto LABEL_35;
  v16 = v19[v17];
  if (v16)
    goto LABEL_22;
  v17 = (int64_t)(v6 + 3);
  if ((uint64_t)(v6 + 3) >= v11)
    goto LABEL_35;
  v16 = v19[v17];
  if (v16)
    goto LABEL_22;
  v17 = (int64_t)(v6 + 4);
  if ((uint64_t)(v6 + 4) >= v11)
    goto LABEL_35;
  v16 = v19[v17];
  if (v16)
  {
LABEL_22:
    v13 = v17;
    goto LABEL_23;
  }
  v13 = (int64_t)(v6 + 5);
  if ((uint64_t)(v6 + 5) >= v11)
    goto LABEL_35;
  v16 = v19[v13];
  if (v16)
    goto LABEL_23;
  v18 = v6 + 6;
  while ((char *)v11 != v18)
  {
    v16 = v19[(_QWORD)v18++];
    if (v16)
    {
      v13 = (int64_t)(v18 - 1);
      goto LABEL_23;
    }
  }
LABEL_35:
  sub_2458387F0();
}

void sub_2458362CC(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  sub_24583AC8C(0, &qword_2574B2D68);
  sub_245838700(&qword_2574B2D70, &qword_2574B2D68);
  v5 = sub_24585A554();
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();

}

uint64_t sub_245836390@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v22 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v22 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD8);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE6CA0], v4);
  sub_24585A500();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v15 = sub_24585A4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v3, 1, 1, v15);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  v17 = sub_24583661C(&qword_2574B2CE8, v16, (uint64_t (*)(uint64_t))type metadata accessor for SharingController, (uint64_t)&unk_24585AE24);
  v18 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v19 = (char *)swift_allocObject();
  v20 = v23;
  *((_QWORD *)v19 + 2) = v23;
  *((_QWORD *)v19 + 3) = v17;
  *((_QWORD *)v19 + 4) = v20;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v19[v18], v12, v8);
  swift_retain_n();
  sub_245836718((uint64_t)v3, (uint64_t)&unk_2574B2CF0, (uint64_t)v19);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

uint64_t sub_2458365C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v7;
  *v7 = v5;
  v7[1] = sub_24583B190;
  return sub_245837718(a5);
}

uint64_t sub_24583661C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x24953CEC4](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for SharingController()
{
  return objc_opt_self();
}

uint64_t sub_245836680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0) - 8) + 80);
  v3 = v0 + ((v2 + 40) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_24583B190;
  v5 = (_QWORD *)swift_task_alloc();
  v4[2] = v5;
  *v5 = v4;
  v5[1] = sub_24583B190;
  return sub_245837718(v3);
}

uint64_t sub_245836718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_24585A4A0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24585A494();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_24583AE20(a1, &qword_2574B2CC0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24585A458();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_245836874(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = v1;
  type metadata accessor for SharingController();
  v2[4] = sub_24583661C(&qword_2574B2CE8, v3, (uint64_t (*)(uint64_t))type metadata accessor for SharingController, (uint64_t)&unk_24585AE24);
  v2[5] = sub_24585A458();
  v2[6] = v4;
  return swift_task_switch();
}

uint64_t sub_2458368E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[3];
  v2 = v0[2];
  v3 = swift_task_alloc();
  v0[7] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[8] = v4;
  *v4 = v0;
  v4[1] = sub_24583698C;
  return sub_24585A7D0();
}

uint64_t sub_24583698C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2458369F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245836A04()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_245836A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD aBlock[6];

  v18 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = sub_24585A1E8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(void **)(a2 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a3, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v18, v5);
  v12 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v13 = (v10 + *(unsigned __int8 *)(v6 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v12, v11, v8);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v14 + v13, (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  v15 = v19;
  *(_QWORD *)(v14 + ((v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8)) = v19;
  aBlock[4] = sub_24583AC0C;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2458371CC;
  aBlock[3] = &block_descriptor_35;
  v16 = _Block_copy(aBlock);
  v17 = v15;
  swift_release();
  objc_msgSend(v17, sel_listEligibleDevicesForType_completionHandler_, 5, v16);
  _Block_release(v16);
}

void sub_245836C14(uint64_t a1)
{
  uint64_t v1;

  sub_245836A38(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_245836C1C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
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
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;

  v28 = a4;
  v7 = sub_24585A1E8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24585A344();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    v15 = sub_24585A65C();
    if (v15)
      goto LABEL_8;
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 16);
    if (v15)
      goto LABEL_8;
  }
  v26 = a2;
  v27 = a3;
  v16 = sub_24584B354();
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v16, v11);
  v17 = sub_24585A32C();
  v18 = sub_24585A578();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_245833000, v17, v18, "No devices are eligible", v19, 2u);
    MEMORY[0x24953CF60](v19, -1, -1);
  }

  v15 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  a2 = v26;
LABEL_8:
  MEMORY[0x24BDAC7A8](v15);
  *(&v25 - 2) = a2;
  sub_245836E9C(sub_24583ACC4, (uint64_t)(&v25 - 4), a1);
  if (v20)
  {
    v21 = v20;
    v22 = objc_msgSend(v28, sel_disableForType_device_, 5, v20);
    sub_24585A1D0();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8);
    sub_24585A470();

  }
  else
  {
    type metadata accessor for SharingController.SharingError();
    sub_24583ADD8();
    v23 = swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v24, a2, v7);
    v29 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8);
    sub_24585A464();
  }
}

void sub_245836E9C(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  char v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  id v29;

  v4 = v3;
  v5 = a3;
  if ((a3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_24585A650();
    sub_24583AC8C(0, &qword_2574B2DD0);
    sub_245838700(&qword_2574B2DD8, &qword_2574B2DD0);
    sub_24585A560();
    v5 = v24;
    v23 = v25;
    v7 = v26;
    v8 = v27;
    v9 = v28;
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a3 + 32);
    v23 = a3 + 56;
    v11 = ~v10;
    v12 = -v10;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v9 = v13 & *(_QWORD *)(a3 + 56);
    swift_bridgeObjectRetain();
    v7 = v11;
    v8 = 0;
  }
  v22 = (unint64_t)(v7 + 64) >> 6;
  if ((v5 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_8:
  if (!sub_24585A668())
    goto LABEL_36;
  sub_24583AC8C(0, &qword_2574B2DD0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v14 = v29;
  swift_unknownObjectRelease();
  v15 = v8;
  v16 = v9;
  if (!v14)
    goto LABEL_36;
  while (1)
  {
    v29 = v14;
    v20 = a1(&v29);
    if (v4)
    {

      goto LABEL_36;
    }
    if ((v20 & 1) != 0)
      goto LABEL_36;

    v8 = v15;
    v9 = v16;
    if (v5 < 0)
      goto LABEL_8;
LABEL_11:
    if (!v9)
      break;
    v16 = (v9 - 1) & v9;
    v17 = __clz(__rbit64(v9)) | (v8 << 6);
    v15 = v8;
LABEL_24:
    v14 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v17);
    if (!v14)
      goto LABEL_36;
  }
  v15 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    return;
  }
  if (v15 >= v22)
    goto LABEL_36;
  v18 = *(_QWORD *)(v23 + 8 * v15);
  if (v18)
  {
LABEL_23:
    v16 = (v18 - 1) & v18;
    v17 = __clz(__rbit64(v18)) + (v15 << 6);
    goto LABEL_24;
  }
  v19 = v8 + 2;
  if (v8 + 2 >= v22)
    goto LABEL_36;
  v18 = *(_QWORD *)(v23 + 8 * v19);
  if (v18)
    goto LABEL_22;
  v19 = v8 + 3;
  if (v8 + 3 >= v22)
    goto LABEL_36;
  v18 = *(_QWORD *)(v23 + 8 * v19);
  if (v18)
    goto LABEL_22;
  v19 = v8 + 4;
  if (v8 + 4 >= v22)
    goto LABEL_36;
  v18 = *(_QWORD *)(v23 + 8 * v19);
  if (v18)
  {
LABEL_22:
    v15 = v19;
    goto LABEL_23;
  }
  v15 = v8 + 5;
  if (v8 + 5 >= v22)
    goto LABEL_36;
  v18 = *(_QWORD *)(v23 + 8 * v15);
  if (v18)
    goto LABEL_23;
  v21 = v8 + 6;
  while (v22 != v21)
  {
    v18 = *(_QWORD *)(v23 + 8 * v21++);
    if (v18)
    {
      v15 = v21 - 1;
      goto LABEL_23;
    }
  }
LABEL_36:
  sub_2458387F0();
}

void sub_2458371CC(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, id);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, id))(a1 + 32);
  sub_24583AC8C(0, &qword_2574B2DD0);
  sub_245838700(&qword_2574B2DD8, &qword_2574B2DD0);
  v5 = sub_24585A554();
  swift_retain();
  v6 = a3;
  v4(v5, v6);
  swift_release();
  swift_bridgeObjectRelease();

}

uint64_t sub_245837290(void *a1, char a2)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;

  v4 = a2 & 1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v9 = *(_QWORD *)(v2 + 32);
  v10 = v9 + 64;
  v11 = 1 << *(_BYTE *)(v9 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v9 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v16 = 0;
  while (1)
  {
    if (v13)
    {
      v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v18 = v17 | (v16 << 6);
      goto LABEL_5;
    }
    v19 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v14)
      return swift_release();
    v20 = *(_QWORD *)(v10 + 8 * v19);
    ++v16;
    if (!v20)
    {
      v16 = v19 + 1;
      if (v19 + 1 >= v14)
        return swift_release();
      v20 = *(_QWORD *)(v10 + 8 * v16);
      if (!v20)
      {
        v16 = v19 + 2;
        if (v19 + 2 >= v14)
          return swift_release();
        v20 = *(_QWORD *)(v10 + 8 * v16);
        if (!v20)
        {
          v16 = v19 + 3;
          if (v19 + 3 >= v14)
            return swift_release();
          v20 = *(_QWORD *)(v10 + 8 * v16);
          if (!v20)
            break;
        }
      }
    }
LABEL_22:
    v13 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v16 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(_QWORD *)(v9 + 56) + *(_QWORD *)(v6 + 72) * v18, v5);
    sub_24583A674(a1, v4, (uint64_t)v8);
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v21 = v19 + 4;
  if (v21 >= v14)
    return swift_release();
  v20 = *(_QWORD *)(v10 + 8 * v21);
  if (v20)
  {
    v16 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v16 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v16 >= v14)
      return swift_release();
    v20 = *(_QWORD *)(v10 + 8 * v16);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_245837478()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[4] = v0;
  v2 = sub_24585A344();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  type metadata accessor for SharingController();
  v1[8] = sub_24583661C(&qword_2574B2CE8, v3, (uint64_t (*)(uint64_t))type metadata accessor for SharingController, (uint64_t)&unk_24585AE24);
  v1[9] = sub_24585A458();
  v1[10] = v4;
  return swift_task_switch();
}

uint64_t sub_245837514()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v2 = v0[6];
  v1 = v0[7];
  v3 = v0[5];
  v4 = sub_24584B354();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_24585A32C();
  v6 = sub_24585A578();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_245833000, v5, v6, "Authentication state changed", v7, 2u);
    MEMORY[0x24953CF60](v7, -1, -1);
  }
  v8 = v0[7];
  v9 = v0[5];
  v10 = v0[6];

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  v11 = (_QWORD *)swift_task_alloc();
  v0[11] = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D58);
  *v11 = v0;
  v11[1] = sub_24583766C;
  return sub_24585A7A0();
}

uint64_t sub_24583766C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2458376B8()
{
  uint64_t v0;
  void *v1;
  char v2;

  v1 = *(void **)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 24);
  sub_245837290(v1, v2);
  sub_245838640(v1, v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245837718(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[14] = a1;
  v2[15] = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
  v2[16] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[17] = v4;
  v2[18] = *(_QWORD *)(v4 + 64);
  v2[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC0);
  v2[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D28);
  v2[21] = swift_task_alloc();
  v5 = sub_24585A1E8();
  v2[22] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[23] = v6;
  v2[24] = *(_QWORD *)(v6 + 64);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  type metadata accessor for SharingController();
  v2[27] = sub_24583661C(&qword_2574B2CE8, v7, (uint64_t (*)(uint64_t))type metadata accessor for SharingController, (uint64_t)&unk_24585AE24);
  sub_24585A458();
  return swift_task_switch();
}

uint64_t sub_245837840()
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
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);

  v2 = v0[25];
  v1 = v0[26];
  v3 = v0[23];
  v33 = v0[22];
  v4 = v0[21];
  v6 = v0[16];
  v5 = v0[17];
  v7 = v0[15];
  v35 = v0[14];
  sub_24585A1DC();
  swift_beginAccess();
  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 32) + 16);
  v9 = v1;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v10(v2, v9, v33);
  v11 = v35;
  v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v36(v4, v11, v6);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v4, 0, 1, v6);
  swift_beginAccess();
  sub_245835E3C(v4, v2);
  swift_endAccess();
  if (!v8)
  {
    v12 = v0[15];
    v13 = *(void **)(v12 + 16);
    v0[2] = MEMORY[0x24BDAC760];
    v0[6] = sub_245838584;
    v0[7] = v12;
    v0[3] = 1107296256;
    v0[4] = sub_245837C8C;
    v0[5] = &block_descriptor;
    v14 = v10;
    v15 = _Block_copy(v0 + 2);
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_startObservingForAuthenticationStateChanges_queue_, v15, *(_QWORD *)(v12 + 24));
    v16 = v15;
    v10 = v14;
    _Block_release(v16);
  }
  v32 = v0[27];
  v34 = v0[26];
  v17 = v0[25];
  v19 = v0[22];
  v18 = v0[23];
  v30 = v0[20];
  v31 = v0[19];
  v20 = v0[17];
  v21 = v0[15];
  v22 = v0[16];
  v23 = v0[14];
  ((void (*)(uint64_t))v10)(v17);
  v24 = (*(unsigned __int8 *)(v18 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v21;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v18 + 32))(v25 + v24, v17, v19);
  swift_retain();
  sub_24585A50C();
  v26 = sub_24585A4A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v30, 1, 1, v26);
  v36(v31, v23, v22);
  v27 = (*(unsigned __int8 *)(v20 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v28 = (char *)swift_allocObject();
  *((_QWORD *)v28 + 2) = v21;
  *((_QWORD *)v28 + 3) = v32;
  *((_QWORD *)v28 + 4) = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(&v28[v27], v31, v22);
  swift_retain_n();
  sub_245836718(v30, (uint64_t)&unk_2574B2D38, (uint64_t)v28);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v34, v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_245837B5C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24585A4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7 = sub_24583661C(&qword_2574B2CE8, v6, (uint64_t (*)(uint64_t))type metadata accessor for SharingController, (uint64_t)&unk_24585AE24);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = v7;
  v8[4] = a1;
  swift_retain_n();
  sub_245836718((uint64_t)v4, (uint64_t)&unk_2574B2D48, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_245837C44()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24583B190;
  return sub_245837478();
}

uint64_t sub_245837C8C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_245837CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v14;

  v4 = sub_24585A1E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24585A4A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  v11 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = (char *)swift_allocObject();
  *((_QWORD *)v12 + 2) = 0;
  *((_QWORD *)v12 + 3) = 0;
  *((_QWORD *)v12 + 4) = a1;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[v11], (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  swift_retain();
  sub_245836718((uint64_t)v9, (uint64_t)&unk_2574B2DB0, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_245837DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[5] = a4;
  v5[6] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D28);
  v5[7] = swift_task_alloc();
  type metadata accessor for SharingController();
  sub_24583661C(&qword_2574B2CE8, v6, (uint64_t (*)(uint64_t))type metadata accessor for SharingController, (uint64_t)&unk_24585AE24);
  sub_24585A458();
  return swift_task_switch();
}

uint64_t sub_245837E94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 40);
  swift_beginAccess();
  sub_245838E38(v1, v2);
  sub_24583AE20(v2, &qword_2574B2D28);
  swift_endAccess();
  if (!*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16))
    objc_msgSend(*(id *)(*(_QWORD *)(v0 + 40) + 16), sel_stopObservingForAuthenticationStateChanges);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245837F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[6] = a4;
  v5[7] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D50);
  v5[8] = v6;
  v5[9] = *(_QWORD *)(v6 - 8);
  v5[10] = swift_task_alloc();
  type metadata accessor for SharingController();
  v5[11] = sub_24583661C(&qword_2574B2CE8, v7, (uint64_t (*)(uint64_t))type metadata accessor for SharingController, (uint64_t)&unk_24585AE24);
  v5[12] = sub_24585A458();
  v5[13] = v8;
  return swift_task_switch();
}

uint64_t sub_245837FE4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D58);
  *v1 = v0;
  v1[1] = sub_24583808C;
  return sub_24585A7A0();
}

uint64_t sub_24583808C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2458380D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char v5;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(void **)(v0 + 16);
  v5 = *(_BYTE *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v4;
  *(_BYTE *)(v0 + 40) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
  sub_24585A518();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_245838640(v4, v5);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245838174()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_2458381AC()
{
  unint64_t result;

  result = qword_2574B2D00;
  if (!qword_2574B2D00)
  {
    result = MEMORY[0x24953CEC4](&unk_24585ADBC, &type metadata for SharingController.Unlockability);
    atomic_store(result, &qword_2574B2D00);
  }
  return result;
}

uint64_t sub_2458381F0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SharingController.Unlockability(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SharingController.Unlockability(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2458382E8 + 4 * byte_24585ADB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24583831C + 4 * byte_24585ADB0[v4]))();
}

uint64_t sub_24583831C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245838324(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24583832CLL);
  return result;
}

uint64_t sub_245838338(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245838340);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245838344(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24583834C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245838358(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245838364(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SharingController.Unlockability()
{
  return &type metadata for SharingController.Unlockability;
}

uint64_t sub_245838380()
{
  return sub_2458383AC(&qword_2574B2D18, &qword_2574B2D20, MEMORY[0x24BEE6D38]);
}

uint64_t sub_2458383AC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24953CEC4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2458383EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_24585A1E8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_245838460()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_24585A1E8() - 8) + 80);
  return sub_245837CB8(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_245838514()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0) - 8) + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = v0 + ((v2 + 40) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_24583B190;
  return sub_245837F40((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_245838584()
{
  uint64_t v0;

  return sub_245837B5C(v0);
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

uint64_t sub_2458385A4()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2458385D0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24583B190;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_24583B190;
  return sub_245837478();
}

void sub_245838638(uint64_t a1)
{
  uint64_t v1;

  sub_2458351E4(a1, v1);
}

void sub_245838640(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

uint64_t sub_24583864C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D60);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2458386B0(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D60) - 8) + 80);
  return sub_2458353FC(a1, a2, (_QWORD *)(v2 + ((v5 + 16) & ~v5)));
}

uint64_t sub_245838700(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_24583AC8C(255, a2);
    result = MEMORY[0x24953CEC4](MEMORY[0x24BEE5BD8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_245838740(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2458387A4;
  return v6(a1);
}

uint64_t sub_2458387A4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2458387F0()
{
  return swift_release();
}

uint64_t sub_2458387F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2458388C8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24583A220((uint64_t)v12, *a3);
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
      sub_24583A220((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2458388C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24585A620();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_245838A80(a5, a6);
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
  v8 = sub_24585A6BC();
  if (!v8)
  {
    sub_24585A6E0();
    __break(1u);
LABEL_17:
    result = sub_24585A71C();
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

uint64_t sub_245838A80(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_245838B14(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_245838CEC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_245838CEC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_245838B14(uint64_t a1, unint64_t a2)
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
      v3 = sub_245838C88(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24585A698();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24585A6E0();
      __break(1u);
LABEL_10:
      v2 = sub_24585A440();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24585A71C();
    __break(1u);
LABEL_14:
    result = sub_24585A6E0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245838C88(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DA0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_245838CEC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DA0);
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
  result = sub_24585A71C();
  __break(1u);
  return result;
}

uint64_t sub_245838E38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_245838F7C(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v17 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_24583A390();
      v9 = v17;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_24585A1E8();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    v12 = *(_QWORD *)(v9 + 56);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a2, v12 + *(_QWORD *)(v14 + 72) * v6, v13);
    sub_245839790(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
  }
  else
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

unint64_t sub_245838F7C(uint64_t a1)
{
  uint64_t v2;

  sub_24585A1E8();
  sub_24583661C(&qword_2574B2D90, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_24585A3C8();
  return sub_245839E9C(a1, v2);
}

uint64_t sub_245838FEC(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;

  v4 = sub_24585A1E8();
  v42 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = v2;
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D88);
  v8 = sub_24585A704();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = swift_release();
    v35 = v38;
LABEL_42:
    *v35 = v9;
    return result;
  }
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 64);
  v40 = (_QWORD *)(v7 + 64);
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v39 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 64;
  HIDWORD(v37) = a2;
  v15 = 16;
  if ((a2 & 1) != 0)
    v15 = 32;
  v41 = v15;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v13)
    {
      v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v20 = v19 | (v17 << 6);
      goto LABEL_24;
    }
    v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v21 >= v39)
    {
      swift_release();
      v35 = v38;
      v22 = v40;
      if ((v37 & 0x100000000) != 0)
      {
LABEL_37:
        v36 = 1 << *(_BYTE *)(v7 + 32);
        if (v36 >= 64)
          bzero(v22, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
        else
          *v22 = -1 << v36;
        *(_QWORD *)(v7 + 16) = 0;
      }
LABEL_41:
      result = swift_release();
      goto LABEL_42;
    }
    v22 = v40;
    v23 = v40[v21];
    ++v17;
    if (!v23)
    {
      v17 = v21 + 1;
      if (v21 + 1 >= v39)
        goto LABEL_34;
      v23 = v40[v17];
      if (!v23)
        break;
    }
LABEL_23:
    v13 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_24:
    v25 = *(_QWORD *)(v42 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + v41))(v6, *(_QWORD *)(v7 + 48) + v25 * v20, v4);
    v26 = v7;
    v27 = *(_BYTE *)(*(_QWORD *)(v7 + 56) + v20);
    sub_24583661C(&qword_2574B2D90, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_24585A3C8();
    v28 = -1 << *(_BYTE *)(v9 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v14 + 8 * v30);
      }
      while (v34 == -1);
      v18 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v42 + 32))(*(_QWORD *)(v9 + 48) + v18 * v25, v6, v4);
    *(_BYTE *)(*(_QWORD *)(v9 + 56) + v18) = v27;
    ++*(_QWORD *)(v9 + 16);
    v7 = v26;
  }
  v24 = v21 + 2;
  if (v24 >= v39)
  {
LABEL_34:
    swift_release();
    v35 = v38;
    if ((v37 & 0x100000000) != 0)
      goto LABEL_37;
    goto LABEL_41;
  }
  v23 = v40[v24];
  if (v23)
  {
    v17 = v24;
    goto LABEL_23;
  }
  while (1)
  {
    v17 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v17 >= v39)
      goto LABEL_34;
    v23 = v40[v17];
    ++v24;
    if (v23)
      goto LABEL_23;
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_24583938C(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[4];
  int v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
  v51 = *(_QWORD *)(v4 - 8);
  v52 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v50 = &v42[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_24585A1E8();
  v49 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v42[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v44 = v2;
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DB8);
  v10 = sub_24585A704();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
    result = swift_release();
    v39 = v44;
LABEL_42:
    *v39 = v11;
    return result;
  }
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v46 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v45 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  v43 = a2;
  v17 = 16;
  if ((a2 & 1) != 0)
    v17 = 32;
  v47 = v17;
  v48 = v9;
  result = swift_retain();
  v19 = 0;
  v20 = v47;
  while (1)
  {
    if (v15)
    {
      v22 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v23 = v22 | (v19 << 6);
      goto LABEL_24;
    }
    v24 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v24 >= v45)
    {
      v40 = v48;
      swift_release();
      v39 = v44;
      v25 = v46;
      if ((v43 & 1) != 0)
      {
LABEL_37:
        v41 = 1 << *(_BYTE *)(v40 + 32);
        if (v41 >= 64)
          bzero(v25, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
        else
          *v25 = -1 << v41;
        *(_QWORD *)(v40 + 16) = 0;
      }
LABEL_41:
      result = swift_release();
      goto LABEL_42;
    }
    v25 = v46;
    v26 = v46[v24];
    ++v19;
    if (!v26)
    {
      v19 = v24 + 1;
      if (v24 + 1 >= v45)
        goto LABEL_34;
      v26 = v46[v19];
      if (!v26)
        break;
    }
LABEL_23:
    v15 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v19 << 6);
LABEL_24:
    v28 = v48;
    v29 = *(_QWORD *)(v49 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v49 + v20))(v8, *(_QWORD *)(v48 + 48) + v29 * v23, v6);
    v30 = *(_QWORD *)(v28 + 56);
    v31 = *(_QWORD *)(v51 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v51 + v20))(v50, v30 + v31 * v23, v52);
    sub_24583661C(&qword_2574B2D90, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_24585A3C8();
    v32 = -1 << *(_BYTE *)(v11 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v16 + 8 * (v33 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v16 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v16 + 8 * v34);
      }
      while (v38 == -1);
      v21 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v16 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v49 + 32))(*(_QWORD *)(v11 + 48) + v21 * v29, v8, v6);
    result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v51 + 32))(*(_QWORD *)(v11 + 56) + v21 * v31, v50, v52);
    ++*(_QWORD *)(v11 + 16);
  }
  v27 = v24 + 2;
  if (v27 >= v45)
  {
LABEL_34:
    v40 = v48;
    swift_release();
    v39 = v44;
    if ((v43 & 1) != 0)
      goto LABEL_37;
    goto LABEL_41;
  }
  v26 = v46[v27];
  if (v26)
  {
    v19 = v27;
    goto LABEL_23;
  }
  while (1)
  {
    v19 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v19 >= v45)
      goto LABEL_34;
    v26 = v46[v19];
    ++v27;
    if (v26)
      goto LABEL_23;
  }
LABEL_44:
  __break(1u);
  return result;
}

unint64_t sub_245839790(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unint64_t v36;
  uint64_t v37;

  v4 = sub_24585A1E8();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_24585A644();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v36 = (result + 1) & v11;
      v12 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v10 * v12;
        v17 = v13;
        v35(v7, *(_QWORD *)(a2 + 48) + v10 * v12, v4);
        sub_24583661C(&qword_2574B2D90, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = sub_24585A3C8();
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v8 = v14;
            if (a1 * v15 < v16
              || *(_QWORD *)(a2 + 48) + a1 * v15 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v16 + v15))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a1 * v15 != v16)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0) - 8) + 72);
            v24 = v23 * a1;
            result = v22 + v23 * a1;
            v25 = v23 * v10;
            v26 = v22 + v23 * v10 + v23;
            if (v24 < v25 || result >= v26)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v13 = v17;
            }
            else
            {
              a1 = v10;
              v13 = v17;
              if (v24 != v25)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v17;
                a1 = v10;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
        v12 = v15;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_245839A6C(char a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t result;
  char v18;
  uint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;

  v4 = (_QWORD **)v3;
  v8 = sub_24585A1E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_245838F7C(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= result && (a3 & 1) != 0)
    goto LABEL_9;
  if (v19 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_245839FE0();
    goto LABEL_9;
  }
  sub_245838FEC(result, a3 & 1);
  result = sub_245838F7C(a2);
  if ((v18 & 1) != (v20 & 1))
  {
LABEL_14:
    result = sub_24585A7E8();
    __break(1u);
    return result;
  }
  v14 = result;
LABEL_9:
  v21 = *v4;
  if ((v18 & 1) != 0)
  {
    *(_BYTE *)(v21[7] + v14) = a1 & 1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    return sub_245839D48(v14, (uint64_t)v11, a1 & 1, v21);
  }
  return result;
}

uint64_t sub_245839BBC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_24585A1E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_245838F7C(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_24583A390();
      goto LABEL_7;
    }
    sub_24583938C(v17, a3 & 1);
    v24 = sub_245838F7C(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_245839DE0(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_24585A7E8();
  __break(1u);
  return result;
}

uint64_t sub_245839D48(unint64_t a1, uint64_t a2, char a3, _QWORD *a4)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v7 = a3 & 1;
  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_24585A1E8();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_BYTE *)(a4[7] + a1) = v7;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_245839DE0(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_24585A1E8();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a3, v11);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

unint64_t sub_245839E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_24585A1E8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_24583661C(&qword_2574B2D98, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_24585A3E0();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void *sub_245839FE0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_24585A1E8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D88);
  v24 = v0;
  v5 = *v0;
  v6 = sub_24585A6F8();
  v7 = v6;
  v8 = *(_QWORD *)(v5 + 16);
  if (!v8)
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
  {
    result = memmove(result, (const void *)(v5 + 64), 8 * v10);
    v8 = *(_QWORD *)(v5 + 16);
  }
  v12 = 0;
  *(_QWORD *)(v7 + 16) = v8;
  v13 = 1 << *(_BYTE *)(v5 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v5 + 64);
  v25 = v5 + 64;
  v26 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v17 = v16 | (v12 << 6);
      goto LABEL_12;
    }
    v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v12;
    if (!v21)
    {
      v12 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v12);
      if (!v21)
        break;
    }
LABEL_25:
    v15 = (v21 - 1) & v21;
    v17 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_12:
    v18 = *(_QWORD *)(v2 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v18, v1);
    v19 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v17);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v18, v4, v1);
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v17) = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v12 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v12 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v12);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
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

uint64_t sub_24583A220(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24583A260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_24585A1E8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_24583A2DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_24585A1E8() - 8) + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = v0 + ((v2 + 40) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_24583A348;
  return sub_245837DFC((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_24583A348()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void *sub_24583A390()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;

  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
  v37 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_24585A1E8();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DB8);
  v33 = v0;
  v3 = *v0;
  v4 = sub_24585A6F8();
  v5 = *(_QWORD *)(v3 + 16);
  v43 = v4;
  if (!v5)
  {
    result = (void *)swift_release();
    v32 = v43;
    v31 = v33;
LABEL_25:
    *v31 = v32;
    return result;
  }
  v6 = v4;
  result = (void *)(v4 + 64);
  v8 = v3 + 64;
  v9 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v8 + 8 * v9)
  {
    result = memmove(result, (const void *)(v3 + 64), 8 * v9);
    v6 = v43;
    v5 = *(_QWORD *)(v3 + 16);
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = v5;
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v42 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v34 = v8;
  v35 = (unint64_t)(v11 + 63) >> 6;
  v14 = v36;
  v15 = v37;
  v17 = v38;
  v16 = v39;
  v18 = v41;
  v19 = v43;
  while (1)
  {
    if (v13)
    {
      v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v44 = v10;
      v21 = v20 | (v10 << 6);
      v22 = v42;
      goto LABEL_9;
    }
    v27 = v10 + 1;
    v22 = v42;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v27);
    v29 = v10 + 1;
    if (!v28)
    {
      v29 = v27 + 1;
      if (v27 + 1 >= v35)
        goto LABEL_23;
      v28 = *(_QWORD *)(v34 + 8 * v29);
      if (!v28)
        break;
    }
LABEL_22:
    v13 = (v28 - 1) & v28;
    v44 = v29;
    v21 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_9:
    v23 = *(_QWORD *)(v14 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v17, *(_QWORD *)(v22 + 48) + v23, v16);
    v24 = *(_QWORD *)(v15 + 72) * v21;
    v25 = *(_QWORD *)(v22 + 56) + v24;
    v26 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v40, v25, v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(_QWORD *)(v19 + 48) + v23, v17, v16);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(_QWORD *)(v19 + 56) + v24, v26, v18);
    v10 = v44;
  }
  v30 = v27 + 2;
  if (v30 >= v35)
  {
LABEL_23:
    result = (void *)swift_release();
    v31 = v33;
    v32 = v43;
    goto LABEL_25;
  }
  v28 = *(_QWORD *)(v34 + 8 * v30);
  if (v28)
  {
    v29 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    v29 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v29 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v29);
    ++v30;
    if (v28)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24583A674(void *a1, char a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint8_t *v33;
  _QWORD *v34;
  id v35;
  uint64_t v36;
  uint8_t *v37;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D50);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24585A344();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v39 - v15;
  if ((a2 & 1) != 0)
  {
    v46 = (uint64_t)a1;
    v26 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC0);
    swift_willThrowTypedImpl();
    v27 = sub_24584B354();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v27, v10);
    v28 = a1;
    v29 = a1;
    v30 = sub_24585A32C();
    v31 = sub_24585A56C();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = swift_slowAlloc();
      v44 = v11;
      v33 = (uint8_t *)v32;
      v34 = (_QWORD *)swift_slowAlloc();
      v43 = v10;
      *(_DWORD *)v33 = 138543362;
      v35 = a1;
      v36 = _swift_stdlib_bridgeErrorToNSError();
      v46 = v36;
      v10 = v43;
      sub_24585A614();
      *v34 = v36;
      sub_245838640(a1, 1);
      sub_245838640(a1, 1);
      _os_log_impl(&dword_245833000, v30, v31, "Failed to get info about device unlockability: %{public}@", v33, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D78);
      swift_arrayDestroy();
      MEMORY[0x24953CF60](v34, -1, -1);
      v37 = v33;
      v11 = v44;
      MEMORY[0x24953CF60](v37, -1, -1);
    }
    else
    {
      sub_245838640(a1, 1);
      sub_245838640(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    v46 = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
    return sub_24585A530();
  }
  else
  {
    v43 = v7;
    swift_bridgeObjectRetain();
    v17 = sub_24584B354();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v17, v10);
    swift_bridgeObjectRetain_n();
    v18 = sub_24585A32C();
    v19 = sub_24585A578();
    if (os_log_type_enabled(v18, v19))
    {
      v44 = v11;
      v20 = swift_slowAlloc();
      v42 = a3;
      v21 = (uint8_t *)v20;
      v40 = swift_slowAlloc();
      v46 = v40;
      *(_DWORD *)v21 = 136315138;
      v39 = v21 + 4;
      sub_24585A1E8();
      v41 = v6;
      sub_24583661C(&qword_2574B2D90, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      swift_bridgeObjectRetain();
      v22 = sub_24585A3BC();
      v24 = v23;
      sub_245838640(a1, 0);
      v45 = sub_2458387F8(v22, v24, &v46);
      sub_24585A614();
      v6 = v41;
      swift_bridgeObjectRelease();
      sub_245838640(a1, 0);
      sub_245838640(a1, 0);
      _os_log_impl(&dword_245833000, v18, v19, "Got info about device unlockability: %s", v21, 0xCu);
      v25 = v40;
      swift_arrayDestroy();
      MEMORY[0x24953CF60](v25, -1, -1);
      MEMORY[0x24953CF60](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v16, v10);
    }
    else
    {
      sub_245838640(a1, 0);
      sub_245838640(a1, 0);

      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    }
    v46 = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CD0);
    sub_24585A524();
    return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v9, v6);
  }
}

uint64_t sub_24583AB40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v1 = sub_24585A1E8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);

  return swift_deallocObject();
}

void sub_24583AC0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = *(_QWORD *)(sub_24585A1E8() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  v6 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8) - 8);
  v7 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  sub_245836C1C(a1, v1 + v4, v1 + v7, *(void **)(v1 + ((*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_24583AC8C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24583ACC4(id *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v1 = objc_msgSend(*a1, sel_uniqueID);
  if (!v1)
  {
    sub_24585A1B8();
    goto LABEL_9;
  }
  v2 = v1;
  v3 = sub_24585A410();
  v5 = v4;

  v6 = sub_24585A1B8();
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return 0;
  }
  if (v3 == v6 && v5 == v7)
  {
    swift_bridgeObjectRelease_n();
    return 1;
  }
  else
  {
    v9 = sub_24585A7C4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v9 & 1;
  }
}

uint64_t type metadata accessor for SharingController.SharingError()
{
  uint64_t result;

  result = qword_2574B39B8;
  if (!qword_2574B39B8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_24583ADD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2574B39B0;
  if (!qword_2574B39B0)
  {
    v1 = type metadata accessor for SharingController.SharingError();
    result = MEMORY[0x24953CEC4](&unk_24585AEC0, v1);
    atomic_store(result, (unint64_t *)&qword_2574B39B0);
  }
  return result;
}

uint64_t sub_24583AE20(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24583AE5C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24583AE80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24583A348;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2574B2DE0 + dword_2574B2DE0))(a1, v4);
}

uint64_t *sub_24583AEF0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_24585A1E8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t sub_24583AF60(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24585A1E8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_24583AF94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24585A1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_24583AFD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24585A1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_24583B01C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24585A1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_24583B060(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24585A1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_24583B0A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24585A1E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_24583B0E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_24585A1E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, a2, a3, v6);
}

uint64_t sub_24583B12C()
{
  return 0;
}

uint64_t sub_24583B134(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = sub_24585A1E8();
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t CompanionDevice.relationshipID.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24583C68C((uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], a1);
}

uint64_t CompanionDevice.idsDeviceID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for CompanionDevice(0) + 20);
  v4 = sub_24585A1E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for CompanionDevice(uint64_t a1)
{
  return sub_24583C7B0(a1, (uint64_t *)&unk_2574B3FD0);
}

uint64_t CompanionDevice.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for CompanionDevice(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CompanionDevice.modelType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for CompanionDevice(0);
  return sub_24583D2F8(v1 + *(int *)(v3 + 28), a1, &qword_2574B2E60);
}

uint64_t CompanionDevice.marketingName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for CompanionDevice(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CompanionDevice.isBlocked.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CompanionDevice(0) + 36));
}

uint64_t CompanionDevice.remoteWidgetsSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CompanionDevice(0) + 40));
}

uint64_t CompanionDevice.remoteScreenSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CompanionDevice(0) + 44));
}

BOOL static CompanionDevice.PairingState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CompanionDevice.PairingState.hash(into:)()
{
  return sub_24585A830();
}

uint64_t CompanionDevice.PairingState.hashValue.getter()
{
  sub_24585A824();
  sub_24585A830();
  return sub_24585A854();
}

BOOL sub_24583B3A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

double CompanionDevice.Screen.size.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double CompanionDevice.Screen.scale.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t CompanionDevice.Screen.cornerRadius.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t CompanionDevice.Screen.hash(into:)()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 32);
  sub_24585A848();
  sub_24585A848();
  sub_24585A848();
  if (v1 == 1)
    return sub_24585A83C();
  sub_24585A83C();
  return sub_24585A848();
}

uint64_t CompanionDevice.Screen.hashValue.getter()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 32);
  sub_24585A824();
  sub_24585A848();
  sub_24585A848();
  sub_24585A848();
  sub_24585A83C();
  if (v1 != 1)
    sub_24585A848();
  return sub_24585A854();
}

uint64_t sub_24583B50C@<X0>(uint64_t result@<X0>, char a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>)
{
  *(double *)a3 = a4;
  *(double *)(a3 + 8) = a5;
  *(double *)(a3 + 16) = a6;
  *(_QWORD *)(a3 + 24) = result;
  *(_BYTE *)(a3 + 32) = a2 & 1;
  return result;
}

uint64_t sub_24583B528()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 32);
  sub_24583C700();
  sub_24585A848();
  if (v1 == 1)
    return sub_24585A83C();
  sub_24585A83C();
  return sub_24585A848();
}

uint64_t sub_24583B594()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 32);
  sub_24585A824();
  sub_24583C700();
  sub_24585A848();
  sub_24585A83C();
  if (v1 != 1)
    sub_24585A848();
  return sub_24585A854();
}

uint64_t CompanionDevice.replicatorPairing.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for CompanionDevice(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 48));
  return result;
}

__n128 CompanionDevice.deviceScreen.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  char v5;
  __n128 result;
  __int128 v7;

  v3 = v1 + *(int *)(type metadata accessor for CompanionDevice(0) + 52);
  v4 = *(_BYTE *)(v3 + 32);
  v5 = *(_BYTE *)(v3 + 33);
  result = *(__n128 *)v3;
  v7 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v7;
  *(_BYTE *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 33) = v5;
  return result;
}

uint64_t CompanionDevice.remoteScreenPairing.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for CompanionDevice(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 56));
  return result;
}

BOOL static CompanionDevice.Proximity.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CompanionDevice.Proximity.hash(into:)()
{
  return sub_24585A830();
}

uint64_t CompanionDevice.Proximity.hashValue.getter()
{
  sub_24585A824();
  sub_24585A830();
  return sub_24585A854();
}

uint64_t CompanionDevice.proximity.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for CompanionDevice(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 60));
  return result;
}

uint64_t CompanionDevice.SessionInfo.start.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24583C68C((uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t CompanionDevice.SessionInfo.end.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for CompanionDevice.SessionInfo(0);
  return sub_24583D2F8(v1 + *(int *)(v3 + 20), a1, &qword_2574B2E68);
}

uint64_t CompanionDevice.SessionInfo.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = sub_24585A1A0();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24583D380(&qword_2574B2E70, v2, MEMORY[0x24BDCE930]);
  sub_24585A3D4();
  v9 = type metadata accessor for CompanionDevice.SessionInfo(0);
  sub_24583D2F8(v0 + *(int *)(v9 + 20), (uint64_t)v8, &qword_2574B2E68);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v1) == 1)
    return sub_24585A83C();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v1);
  sub_24585A83C();
  sub_24585A3D4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v1);
}

uint64_t CompanionDevice.SessionInfo.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = sub_24585A1A0();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24585A824();
  sub_24583D380(&qword_2574B2E70, v2, MEMORY[0x24BDCE930]);
  sub_24585A3D4();
  v9 = type metadata accessor for CompanionDevice.SessionInfo(0);
  sub_24583D2F8(v0 + *(int *)(v9 + 20), (uint64_t)v8, &qword_2574B2E68);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v1) == 1)
  {
    sub_24585A83C();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v1);
    sub_24585A83C();
    sub_24585A3D4();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  }
  return sub_24585A854();
}

uint64_t sub_24583BAC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_24585A1A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  v7 = type metadata accessor for CompanionDevice.SessionInfo(0);
  return sub_24583D33C(a2, a3 + *(int *)(v7 + 20), &qword_2574B2E68);
}

uint64_t sub_24583BB34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v4 = sub_24585A1A0();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24583D380(&qword_2574B2E70, v5, MEMORY[0x24BDCE930]);
  sub_24585A3D4();
  sub_24583D2F8(v2 + *(int *)(a2 + 20), (uint64_t)v11, &qword_2574B2E68);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v4) == 1)
    return sub_24585A83C();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v4);
  sub_24585A83C();
  sub_24585A3D4();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v4);
}

uint64_t sub_24583BCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v4 = sub_24585A1A0();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24585A824();
  sub_24583D380(&qword_2574B2E70, v5, MEMORY[0x24BDCE930]);
  sub_24585A3D4();
  sub_24583D2F8(v2 + *(int *)(a2 + 20), (uint64_t)v11, &qword_2574B2E68);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v4) == 1)
  {
    sub_24585A83C();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v4);
    sub_24585A83C();
    sub_24585A3D4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
  }
  return sub_24585A854();
}

uint64_t CompanionDevice.latestSessionInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for CompanionDevice(0);
  return sub_24583D2F8(v1 + *(int *)(v3 + 64), a1, &qword_2574B2E78);
}

uint64_t sub_24583BE6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, char a10, char a11, char *a12, __int128 *a13, char *a14, char *a15, uint64_t a16)
{
  char v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  int *v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  char v35;
  char v36;

  v22 = *a12;
  v34 = *a13;
  v33 = *((_QWORD *)a13 + 2);
  v32 = *((_QWORD *)a13 + 3);
  v30 = *((_BYTE *)a13 + 33);
  v31 = *((_BYTE *)a13 + 32);
  v35 = *a14;
  v36 = *a15;
  v23 = sub_24585A1E8();
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32);
  v24(a9, a1, v23);
  v25 = (int *)type metadata accessor for CompanionDevice(0);
  v24(a9 + v25[5], a2, v23);
  v26 = (_QWORD *)(a9 + v25[6]);
  *v26 = a3;
  v26[1] = a4;
  sub_24583D33C(a5, a9 + v25[7], &qword_2574B2E60);
  v27 = (_QWORD *)(a9 + v25[8]);
  *v27 = a6;
  v27[1] = a7;
  *(_BYTE *)(a9 + v25[9]) = a8;
  *(_BYTE *)(a9 + v25[10]) = a10;
  *(_BYTE *)(a9 + v25[11]) = a11;
  *(_BYTE *)(a9 + v25[12]) = v22;
  v28 = a9 + v25[13];
  *(_OWORD *)v28 = v34;
  *(_QWORD *)(v28 + 16) = v33;
  *(_QWORD *)(v28 + 24) = v32;
  *(_BYTE *)(v28 + 32) = v31;
  *(_BYTE *)(v28 + 33) = v30;
  *(_BYTE *)(a9 + v25[14]) = v35;
  *(_BYTE *)(a9 + v25[15]) = v36;
  return sub_24583D33C(a16, a9 + v25[16], &qword_2574B2E78);
}

uint64_t CompanionDevice.hash(into:)()
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v1 = v0;
  v2 = sub_24585A1A0();
  v31 = *(_QWORD *)(v2 - 8);
  v32 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v28 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
  MEMORY[0x24BDAC7A8](v4);
  v29 = (uint64_t)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for CompanionDevice.SessionInfo(0);
  v34 = *(_QWORD *)(v6 - 8);
  v35 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v30 = (uint64_t)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
  MEMORY[0x24BDAC7A8](v8);
  v33 = (uint64_t)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24585A320();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E60);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24585A1E8();
  sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_24585A3D4();
  v17 = (int *)type metadata accessor for CompanionDevice(0);
  sub_24585A3D4();
  swift_bridgeObjectRetain();
  sub_24585A428();
  swift_bridgeObjectRelease();
  sub_24583D2F8(v0 + v17[7], (uint64_t)v16, &qword_2574B2E60);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10) == 1)
  {
    sub_24585A83C();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v16, v10);
    sub_24585A83C();
    sub_24583D380(&qword_2574B2E80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE63B8], MEMORY[0x24BEE63E0]);
    sub_24585A3D4();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  if (*(_QWORD *)(v0 + v17[8] + 8))
  {
    sub_24585A83C();
    swift_bridgeObjectRetain();
    sub_24585A428();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24585A83C();
  }
  sub_24585A83C();
  sub_24585A83C();
  sub_24585A83C();
  if (*(_BYTE *)(v0 + v17[12]) == 3)
  {
    sub_24585A83C();
  }
  else
  {
    sub_24585A83C();
    sub_24585A830();
  }
  v18 = v0 + v17[13];
  if (*(_BYTE *)(v18 + 33) == 1
    || (v19 = *(_BYTE *)(v18 + 32), sub_24585A83C(), sub_24585A848(), sub_24585A848(), sub_24585A848(), (v19 & 1) != 0))
  {
    sub_24585A83C();
  }
  else
  {
    sub_24585A83C();
    sub_24585A848();
  }
  if (*(_BYTE *)(v0 + v17[14]) == 3)
  {
    sub_24585A83C();
  }
  else
  {
    sub_24585A83C();
    sub_24585A830();
  }
  if (*(_BYTE *)(v0 + v17[15]) == 2)
  {
    sub_24585A83C();
  }
  else
  {
    sub_24585A83C();
    sub_24585A830();
  }
  v20 = v33;
  sub_24583D2F8(v1 + v17[16], v33, &qword_2574B2E78);
  v21 = v35;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v20, 1, v35) == 1)
    return sub_24585A83C();
  v23 = v30;
  sub_24583D3C0(v20, v30);
  sub_24585A83C();
  sub_24583D380(&qword_2574B2E70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  v24 = v32;
  sub_24585A3D4();
  v25 = v29;
  sub_24583D2F8(v23 + *(int *)(v21 + 20), v29, &qword_2574B2E68);
  v26 = v31;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v25, 1, v24) == 1)
  {
    sub_24585A83C();
  }
  else
  {
    v27 = v28;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v28, v25, v24);
    sub_24585A83C();
    sub_24585A3D4();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v24);
  }
  return sub_24583D404(v23);
}

uint64_t CompanionDevice.hashValue.getter()
{
  sub_24585A824();
  CompanionDevice.hash(into:)();
  return sub_24585A854();
}

uint64_t sub_24583C608()
{
  sub_24585A824();
  CompanionDevice.hash(into:)();
  return sub_24585A854();
}

uint64_t sub_24583C648()
{
  sub_24585A824();
  CompanionDevice.hash(into:)();
  return sub_24585A854();
}

uint64_t CompanionDevice.id.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24583C68C((uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], a1);
}

uint64_t sub_24583C68C@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v2, v4);
}

uint64_t sub_24583C6C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_24585A1E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_24583C700()
{
  sub_24585A848();
  return sub_24585A848();
}

uint64_t _s24ScreenContinuityServices15CompanionDeviceV0A0V2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  char v4;

  if (*(double *)a1 != *(double *)a2
    || *(double *)(a1 + 8) != *(double *)(a2 + 8)
    || *(double *)(a1 + 16) != *(double *)(a2 + 16))
  {
    return 0;
  }
  v4 = *(_BYTE *)(a2 + 32);
  if ((*(_BYTE *)(a1 + 32) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 32) & 1) == 0)
      return 0;
  }
  else
  {
    if (*(double *)(a1 + 24) != *(double *)(a2 + 24))
      v4 = 1;
    if ((v4 & 1) != 0)
      return 0;
  }
  return 1;
}

uint64_t type metadata accessor for CompanionDevice.SessionInfo(uint64_t a1)
{
  return sub_24583C7B0(a1, (uint64_t *)&unk_2574B3FE0);
}

uint64_t sub_24583C7B0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

BOOL _s24ScreenContinuityServices15CompanionDeviceV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  int *v34;
  char v35;
  _BOOL8 result;
  uint64_t v37;
  unsigned int (*v38)(uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t);
  char *v43;
  char v44;
  void (*v45)(char *, uint64_t);
  char *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  int v63;
  int v64;
  uint64_t v65;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
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
  uint64_t v87;
  char *v88;

  v87 = type metadata accessor for CompanionDevice.SessionInfo(0);
  v84 = *(_QWORD *)(v87 - 8);
  MEMORY[0x24BDAC7A8](v87);
  v81 = (uint64_t)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3000);
  MEMORY[0x24BDAC7A8](v83);
  v6 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v82 = (uint64_t)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v85 = (uint64_t)&v77 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v86 = (uint64_t)&v77 - v12;
  v13 = sub_24585A320();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v88 = (char *)&v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3008);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E60);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = (char *)&v77 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v77 - v26;
  if ((sub_24585A1C4() & 1) == 0)
    return 0;
  v80 = v13;
  v28 = type metadata accessor for CompanionDevice(0);
  if ((sub_24585A1C4() & 1) == 0)
    return 0;
  v29 = *(int *)(v28 + 24);
  v30 = *(_QWORD *)(a1 + v29);
  v31 = *(_QWORD *)(a1 + v29 + 8);
  v79 = a2;
  v32 = (_QWORD *)(a2 + v29);
  v33 = a1;
  v34 = (int *)v28;
  if (v30 != *v32 || v31 != v32[1])
  {
    v35 = sub_24585A7C4();
    result = 0;
    if ((v35 & 1) == 0)
      return result;
  }
  v78 = v6;
  sub_24583D2F8(v33 + *(int *)(v28 + 28), (uint64_t)v27, &qword_2574B2E60);
  sub_24583D2F8(v79 + *(int *)(v28 + 28), (uint64_t)v25, &qword_2574B2E60);
  v37 = (uint64_t)&v18[*(int *)(v16 + 48)];
  sub_24583D2F8((uint64_t)v27, (uint64_t)v18, &qword_2574B2E60);
  sub_24583D2F8((uint64_t)v25, v37, &qword_2574B2E60);
  v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  v39 = v80;
  if (v38((uint64_t)v18, 1, v80) == 1)
  {
    sub_24583AE20((uint64_t)v25, &qword_2574B2E60);
    sub_24583AE20((uint64_t)v27, &qword_2574B2E60);
    if (v38(v37, 1, v39) == 1)
    {
      sub_24583AE20((uint64_t)v18, &qword_2574B2E60);
      goto LABEL_16;
    }
LABEL_11:
    v40 = &qword_2574B3008;
    v41 = (uint64_t)v18;
LABEL_12:
    sub_24583AE20(v41, v40);
    return 0;
  }
  sub_24583D2F8((uint64_t)v18, (uint64_t)v22, &qword_2574B2E60);
  if (v38(v37, 1, v39) == 1)
  {
    sub_24583AE20((uint64_t)v25, &qword_2574B2E60);
    sub_24583AE20((uint64_t)v27, &qword_2574B2E60);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v22, v39);
    goto LABEL_11;
  }
  v42 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 32);
  v77 = v33;
  v43 = v88;
  v42(v88, v37, v39);
  sub_24583D380(&qword_2574B3010, (uint64_t (*)(uint64_t))MEMORY[0x24BEE63B8], MEMORY[0x24BEE63E8]);
  v44 = sub_24585A3E0();
  v45 = *(void (**)(char *, uint64_t))(v14 + 8);
  v46 = v43;
  v33 = v77;
  v45(v46, v39);
  sub_24583AE20((uint64_t)v25, &qword_2574B2E60);
  sub_24583AE20((uint64_t)v27, &qword_2574B2E60);
  v45(v22, v39);
  sub_24583AE20((uint64_t)v18, &qword_2574B2E60);
  if ((v44 & 1) == 0)
    return 0;
LABEL_16:
  v47 = v34[8];
  v48 = (_QWORD *)(v33 + v47);
  v49 = *(_QWORD *)(v33 + v47 + 8);
  v50 = (_QWORD *)(v79 + v47);
  v51 = v50[1];
  if (v49)
  {
    v52 = (uint64_t)v78;
    if (!v51)
      return 0;
    if (*v48 != *v50 || v49 != v51)
    {
      v53 = sub_24585A7C4();
      result = 0;
      if ((v53 & 1) == 0)
        return result;
    }
  }
  else
  {
    v52 = (uint64_t)v78;
    if (v51)
      return 0;
  }
  if (*(unsigned __int8 *)(v33 + v34[9]) != *(unsigned __int8 *)(v79 + v34[9])
    || *(unsigned __int8 *)(v33 + v34[10]) != *(unsigned __int8 *)(v79 + v34[10])
    || *(unsigned __int8 *)(v33 + v34[11]) != *(unsigned __int8 *)(v79 + v34[11]))
  {
    return 0;
  }
  v54 = v34[12];
  v55 = *(unsigned __int8 *)(v33 + v54);
  v56 = *(unsigned __int8 *)(v79 + v54);
  if (v55 == 3)
  {
    if (v56 != 3)
      return 0;
  }
  else
  {
    result = 0;
    if (v56 == 3 || v55 != v56)
      return result;
  }
  v57 = v34[13];
  v58 = v33 + v57;
  v59 = *(_BYTE *)(v33 + v57 + 33);
  v60 = v79 + v57;
  v61 = *(_BYTE *)(v60 + 33);
  if ((v59 & 1) != 0)
    goto LABEL_32;
  if ((*(_BYTE *)(v60 + 33) & 1) != 0)
    return 0;
  result = 0;
  if (*(double *)v58 != *(double *)v60
    || *(double *)(v58 + 8) != *(double *)(v60 + 8)
    || *(double *)(v58 + 16) != *(double *)(v60 + 16))
  {
    return result;
  }
  v61 = *(_BYTE *)(v60 + 32);
  if ((*(_BYTE *)(v58 + 32) & 1) != 0)
  {
LABEL_32:
    if ((v61 & 1) == 0)
      return 0;
  }
  else
  {
    result = 0;
    if ((*(_BYTE *)(v60 + 32) & 1) != 0 || *(double *)(v58 + 24) != *(double *)(v60 + 24))
      return result;
  }
  v62 = v34[14];
  v63 = *(unsigned __int8 *)(v33 + v62);
  v64 = *(unsigned __int8 *)(v79 + v62);
  if (v63 == 3)
  {
    if (v64 != 3)
      return 0;
  }
  else
  {
    result = 0;
    if (v64 == 3 || v63 != v64)
      return result;
  }
  v65 = v34[15];
  v66 = *(unsigned __int8 *)(v33 + v65);
  v67 = *(unsigned __int8 *)(v79 + v65);
  if (v66 == 2)
  {
    if (v67 != 2)
      return 0;
    goto LABEL_51;
  }
  result = 0;
  if (v67 != 2 && ((v67 ^ v66) & 1) == 0)
  {
LABEL_51:
    v68 = v86;
    sub_24583D2F8(v33 + v34[16], v86, &qword_2574B2E78);
    v69 = v85;
    sub_24583D2F8(v79 + v34[16], v85, &qword_2574B2E78);
    v70 = v52 + *(int *)(v83 + 48);
    sub_24583D2F8(v68, v52, &qword_2574B2E78);
    sub_24583D2F8(v69, v70, &qword_2574B2E78);
    v71 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v84 + 48);
    v72 = v52;
    v73 = v87;
    if (v71(v72, 1, v87) == 1)
    {
      sub_24583AE20(v69, &qword_2574B2E78);
      sub_24583AE20(v68, &qword_2574B2E78);
      if (v71(v70, 1, v73) == 1)
      {
        sub_24583AE20((uint64_t)v78, &qword_2574B2E78);
        return 1;
      }
    }
    else
    {
      v74 = v82;
      sub_24583D2F8((uint64_t)v78, v82, &qword_2574B2E78);
      if (v71(v70, 1, v73) != 1)
      {
        v75 = v81;
        sub_24583D3C0(v70, v81);
        v76 = _s24ScreenContinuityServices15CompanionDeviceV11SessionInfoV2eeoiySbAE_AEtFZ_0(v74, v75);
        sub_24583D404(v75);
        sub_24583AE20(v69, &qword_2574B2E78);
        sub_24583AE20(v68, &qword_2574B2E78);
        sub_24583D404(v74);
        sub_24583AE20((uint64_t)v78, &qword_2574B2E78);
        return v76;
      }
      sub_24583AE20(v69, &qword_2574B2E78);
      sub_24583AE20(v68, &qword_2574B2E78);
      sub_24583D404(v74);
    }
    v40 = &qword_2574B3000;
    v41 = (uint64_t)v78;
    goto LABEL_12;
  }
  return result;
}

BOOL _s24ScreenContinuityServices15CompanionDeviceV11SessionInfoV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(uint64_t, uint64_t, uint64_t);
  char *v23;
  char v24;
  void (*v25)(char *, uint64_t);
  uint64_t v27;
  char *v28;

  v4 = sub_24585A1A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3018);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v27 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v27 - v18;
  if ((sub_24585A188() & 1) == 0)
    return 0;
  v28 = v7;
  v20 = type metadata accessor for CompanionDevice.SessionInfo(0);
  sub_24583D2F8(a1 + *(int *)(v20 + 20), (uint64_t)v19, &qword_2574B2E68);
  sub_24583D2F8(a2 + *(int *)(v20 + 20), (uint64_t)v17, &qword_2574B2E68);
  v21 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_24583D2F8((uint64_t)v19, (uint64_t)v10, &qword_2574B2E68);
  sub_24583D2F8((uint64_t)v17, v21, &qword_2574B2E68);
  v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v22((uint64_t)v10, 1, v4) == 1)
  {
    sub_24583AE20((uint64_t)v17, &qword_2574B2E68);
    sub_24583AE20((uint64_t)v19, &qword_2574B2E68);
    if (v22(v21, 1, v4) == 1)
    {
      sub_24583AE20((uint64_t)v10, &qword_2574B2E68);
      return 1;
    }
    goto LABEL_7;
  }
  sub_24583D2F8((uint64_t)v10, (uint64_t)v14, &qword_2574B2E68);
  if (v22(v21, 1, v4) == 1)
  {
    sub_24583AE20((uint64_t)v17, &qword_2574B2E68);
    sub_24583AE20((uint64_t)v19, &qword_2574B2E68);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
LABEL_7:
    sub_24583AE20((uint64_t)v10, &qword_2574B3018);
    return 0;
  }
  v23 = v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v28, v21, v4);
  sub_24583D380(&qword_2574B3020, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
  v24 = sub_24585A3E0();
  v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25(v23, v4);
  sub_24583AE20((uint64_t)v17, &qword_2574B2E68);
  sub_24583AE20((uint64_t)v19, &qword_2574B2E68);
  v25(v14, v4);
  sub_24583AE20((uint64_t)v10, &qword_2574B2E68);
  return (v24 & 1) != 0;
}

uint64_t sub_24583D2F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24583D33C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24583D380(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24953CEC4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24583D3C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CompanionDevice.SessionInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24583D404(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CompanionDevice.SessionInfo(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24583D444()
{
  unint64_t result;

  result = qword_2574B2E88;
  if (!qword_2574B2E88)
  {
    result = MEMORY[0x24953CEC4](&protocol conformance descriptor for CompanionDevice.PairingState, &type metadata for CompanionDevice.PairingState);
    atomic_store(result, (unint64_t *)&qword_2574B2E88);
  }
  return result;
}

unint64_t sub_24583D48C()
{
  unint64_t result;

  result = qword_2574B2E90;
  if (!qword_2574B2E90)
  {
    result = MEMORY[0x24953CEC4](&protocol conformance descriptor for CompanionDevice.Screen, &type metadata for CompanionDevice.Screen);
    atomic_store(result, (unint64_t *)&qword_2574B2E90);
  }
  return result;
}

unint64_t sub_24583D4D4()
{
  unint64_t result;

  result = qword_2574B2E98;
  if (!qword_2574B2E98)
  {
    result = MEMORY[0x24953CEC4](&protocol conformance descriptor for CompanionDevice.Proximity, &type metadata for CompanionDevice.Proximity);
    atomic_store(result, (unint64_t *)&qword_2574B2E98);
  }
  return result;
}

uint64_t sub_24583D518()
{
  return sub_24583D380(&qword_2574B2EA0, type metadata accessor for CompanionDevice.SessionInfo, (uint64_t)&protocol conformance descriptor for CompanionDevice.SessionInfo);
}

uint64_t sub_24583D544()
{
  return sub_24583D380(&qword_2574B2EA8, type metadata accessor for CompanionDevice, (uint64_t)&protocol conformance descriptor for CompanionDevice);
}

uint64_t sub_24583D570()
{
  return sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

_QWORD *initializeBufferWithCopyOfBuffer for CompanionDevice(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int (*v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;

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
    v7 = sub_24585A1E8();
    v8 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((_QWORD *)((char *)a1 + a3[5]), (_QWORD *)((char *)a2 + a3[5]), v7);
    v9 = a3[6];
    v10 = a3[7];
    v11 = (_QWORD *)((char *)a1 + v9);
    v12 = (_QWORD *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = (char *)a1 + v10;
    v15 = (char *)a2 + v10;
    v16 = sub_24585A320();
    v17 = *(_QWORD *)(v16 - 8);
    v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    swift_bridgeObjectRetain();
    if (v18(v15, 1, v16))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E60);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    }
    v21 = a3[8];
    v22 = a3[9];
    v23 = (_QWORD *)((char *)a1 + v21);
    v24 = (_QWORD *)((char *)a2 + v21);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    *((_BYTE *)a1 + v22) = *((_BYTE *)a2 + v22);
    v26 = a3[11];
    *((_BYTE *)a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
    *((_BYTE *)a1 + v26) = *((_BYTE *)a2 + v26);
    v27 = a3[13];
    *((_BYTE *)a1 + a3[12]) = *((_BYTE *)a2 + a3[12]);
    v28 = (char *)a1 + v27;
    v29 = (char *)a2 + v27;
    v30 = *((_OWORD *)v29 + 1);
    *(_OWORD *)v28 = *(_OWORD *)v29;
    *((_OWORD *)v28 + 1) = v30;
    *((_WORD *)v28 + 16) = *((_WORD *)v29 + 16);
    v31 = a3[15];
    *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
    v32 = a3[16];
    v33 = (char *)a1 + v32;
    v34 = (char *)a2 + v32;
    *((_BYTE *)a1 + v31) = *((_BYTE *)a2 + v31);
    v35 = type metadata accessor for CompanionDevice.SessionInfo(0);
    v36 = *(_QWORD *)(v35 - 8);
    v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
    swift_bridgeObjectRetain();
    if (v37(v34, 1, v35))
    {
      v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
    else
    {
      v39 = sub_24585A1A0();
      v40 = *(_QWORD *)(v39 - 8);
      v41 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
      v41(v33, v34, v39);
      v42 = *(int *)(v35 + 20);
      v43 = &v33[v42];
      v44 = &v34[v42];
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v44, 1, v39))
      {
        v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
        memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
      }
      else
      {
        v41(v43, v44, v39);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v43, 0, 1, v39);
      }
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
  }
  return a1;
}

uint64_t destroy for CompanionDevice(uint64_t a1, int *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);

  v4 = sub_24585A1E8();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  swift_bridgeObjectRelease();
  v6 = a1 + a2[7];
  v7 = sub_24585A320();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_bridgeObjectRelease();
  v9 = a1 + a2[16];
  v10 = type metadata accessor for CompanionDevice.SessionInfo(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, 1, v10);
  if (!(_DWORD)result)
  {
    v12 = sub_24585A1A0();
    v13 = *(_QWORD *)(v12 - 8);
    v15 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v15(v9, v12);
    v14 = v9 + *(int *)(v10 + 20);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12);
    if (!(_DWORD)result)
      return ((uint64_t (*)(uint64_t, uint64_t))v15)(v14, v12);
  }
  return result;
}

uint64_t initializeWithCopy for CompanionDevice(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(const void *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;

  v6 = sub_24585A1E8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a3[7];
  v10 = (_QWORD *)(a1 + v8);
  v11 = (_QWORD *)(a2 + v8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = (void *)(a1 + v9);
  v14 = (const void *)(a2 + v9);
  v15 = sub_24585A320();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48);
  swift_bridgeObjectRetain();
  if (v17(v14, 1, v15))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E60);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 16))(v13, v14, v15);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  v19 = a3[8];
  v20 = a3[9];
  v21 = (_QWORD *)(a1 + v19);
  v22 = (_QWORD *)(a2 + v19);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  *(_BYTE *)(a1 + v20) = *(_BYTE *)(a2 + v20);
  v24 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_BYTE *)(a1 + v24) = *(_BYTE *)(a2 + v24);
  v25 = a3[13];
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = *(_OWORD *)(v27 + 16);
  *(_OWORD *)v26 = *(_OWORD *)v27;
  *(_OWORD *)(v26 + 16) = v28;
  *(_WORD *)(v26 + 32) = *(_WORD *)(v27 + 32);
  v29 = a3[15];
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  v30 = a3[16];
  v31 = (char *)(a1 + v30);
  v32 = (char *)(a2 + v30);
  *(_BYTE *)(a1 + v29) = *(_BYTE *)(a2 + v29);
  v33 = type metadata accessor for CompanionDevice.SessionInfo(0);
  v34 = *(_QWORD *)(v33 - 8);
  v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
  swift_bridgeObjectRetain();
  if (v35(v32, 1, v33))
  {
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
  }
  else
  {
    v37 = sub_24585A1A0();
    v38 = *(_QWORD *)(v37 - 8);
    v39 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
    v39(v31, v32, v37);
    v40 = *(int *)(v33 + 20);
    v41 = &v31[v40];
    v42 = &v32[v40];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v42, 1, v37))
    {
      v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
      memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    }
    else
    {
      v39(v41, v42, v37);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v41, 0, 1, v37);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  }
  return a1;
}

uint64_t assignWithCopy for CompanionDevice(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t);
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, char *, uint64_t);
  uint64_t v39;
  void *v40;
  char *v41;
  uint64_t v42;
  size_t v43;
  void *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, char *, uint64_t);
  uint64_t v49;
  void *v50;
  char *v51;
  uint64_t (*v52)(void *, uint64_t, uint64_t);
  int v53;
  int v54;

  v6 = sub_24585A1E8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = a3[7];
  v12 = (void *)(a1 + v11);
  v13 = (void *)(a2 + v11);
  v14 = sub_24585A320();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v18)
  {
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E60);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v12, v13, v14);
LABEL_7:
  v20 = a3[8];
  v21 = (_QWORD *)(a1 + v20);
  v22 = (_QWORD *)(a2 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  v23 = a3[13];
  v24 = a1 + v23;
  v25 = (__int128 *)(a2 + v23);
  v26 = *v25;
  v27 = v25[1];
  *(_WORD *)(v24 + 32) = *((_WORD *)v25 + 16);
  *(_OWORD *)v24 = v26;
  *(_OWORD *)(v24 + 16) = v27;
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  *(_BYTE *)(a1 + a3[15]) = *(_BYTE *)(a2 + a3[15]);
  v28 = a3[16];
  v29 = a1 + v28;
  v30 = (char *)(a2 + v28);
  v31 = type metadata accessor for CompanionDevice.SessionInfo(0);
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 48);
  v34 = v33(v29, 1, v31);
  v35 = v33((uint64_t)v30, 1, v31);
  if (!v34)
  {
    if (!v35)
    {
      v46 = sub_24585A1A0();
      v47 = *(_QWORD *)(v46 - 8);
      v48 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 24);
      v48(v29, v30, v46);
      v49 = *(int *)(v31 + 20);
      v50 = (void *)(v29 + v49);
      v51 = &v30[v49];
      v52 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v47 + 48);
      v53 = v52(v50, 1, v46);
      v54 = v52(v51, 1, v46);
      if (v53)
      {
        if (!v54)
        {
          (*(void (**)(void *, char *, uint64_t))(v47 + 16))(v50, v51, v46);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v50, 0, 1, v46);
          return a1;
        }
      }
      else
      {
        if (!v54)
        {
          v48((uint64_t)v50, v51, v46);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v47 + 8))(v50, v46);
      }
      v43 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68) - 8) + 64);
      v44 = v50;
      v45 = v51;
      goto LABEL_14;
    }
    sub_24583D404(v29);
LABEL_13:
    v43 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78) - 8) + 64);
    v44 = (void *)v29;
    v45 = v30;
LABEL_14:
    memcpy(v44, v45, v43);
    return a1;
  }
  if (v35)
    goto LABEL_13;
  v36 = sub_24585A1A0();
  v37 = *(_QWORD *)(v36 - 8);
  v38 = *(void (**)(uint64_t, char *, uint64_t))(v37 + 16);
  v38(v29, v30, v36);
  v39 = *(int *)(v31 + 20);
  v40 = (void *)(v29 + v39);
  v41 = &v30[v39];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v41, 1, v36))
  {
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
  }
  else
  {
    v38((uint64_t)v40, v41, v36);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v40, 0, 1, v36);
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  return a1;
}

uint64_t initializeWithTake for CompanionDevice(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;

  v6 = sub_24585A1E8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_24585A320();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E60);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v14 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(_BYTE *)(a1 + v14) = *(_BYTE *)(a2 + v14);
  v15 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  v16 = a3[13];
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = *(_OWORD *)(v18 + 16);
  *(_OWORD *)v17 = *(_OWORD *)v18;
  *(_OWORD *)(v17 + 16) = v19;
  *(_WORD *)(v17 + 32) = *(_WORD *)(v18 + 32);
  v20 = a3[15];
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  v21 = a3[16];
  v22 = (char *)(a1 + v21);
  v23 = (char *)(a2 + v21);
  *(_BYTE *)(a1 + v20) = *(_BYTE *)(a2 + v20);
  v24 = type metadata accessor for CompanionDevice.SessionInfo(0);
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    v27 = sub_24585A1A0();
    v28 = *(_QWORD *)(v27 - 8);
    v29 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    v29(v22, v23, v27);
    v30 = *(int *)(v24 + 20);
    v31 = &v22[v30];
    v32 = &v23[v30];
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v32, 1, v27))
    {
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    }
    else
    {
      v29(v31, v32, v27);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v31, 0, 1, v27);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  return a1;
}

uint64_t assignWithTake for CompanionDevice(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t, uint64_t);
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, char *, uint64_t);
  uint64_t v47;
  void *v48;
  char *v49;
  uint64_t v50;
  size_t v51;
  void *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, char *, uint64_t);
  uint64_t v57;
  void *v58;
  char *v59;
  uint64_t (*v60)(void *, uint64_t, uint64_t);
  int v61;
  int v62;

  v6 = sub_24585A1E8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = (void *)(a1 + v13);
  v15 = (void *)(a2 + v13);
  v16 = sub_24585A320();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  v19 = v18(v14, 1, v16);
  v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E60);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
LABEL_7:
  v22 = a3[8];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (uint64_t *)(a2 + v22);
  v26 = *v24;
  v25 = v24[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  v27 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v27) = *(_BYTE *)(a2 + v27);
  v28 = a3[12];
  *(_BYTE *)(a1 + a3[11]) = *(_BYTE *)(a2 + a3[11]);
  *(_BYTE *)(a1 + v28) = *(_BYTE *)(a2 + v28);
  v29 = a3[13];
  v30 = a3[14];
  v31 = a1 + v29;
  v32 = (__int128 *)(a2 + v29);
  v33 = *v32;
  v34 = v32[1];
  *(_WORD *)(v31 + 32) = *((_WORD *)v32 + 16);
  *(_OWORD *)v31 = v33;
  *(_OWORD *)(v31 + 16) = v34;
  *(_BYTE *)(a1 + v30) = *(_BYTE *)(a2 + v30);
  v35 = a3[15];
  v36 = a3[16];
  v37 = a1 + v36;
  v38 = (char *)(a2 + v36);
  *(_BYTE *)(a1 + v35) = *(_BYTE *)(a2 + v35);
  v39 = type metadata accessor for CompanionDevice.SessionInfo(0);
  v40 = *(_QWORD *)(v39 - 8);
  v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 48);
  v42 = v41(v37, 1, v39);
  v43 = v41((uint64_t)v38, 1, v39);
  if (!v42)
  {
    if (!v43)
    {
      v54 = sub_24585A1A0();
      v55 = *(_QWORD *)(v54 - 8);
      v56 = *(void (**)(uint64_t, char *, uint64_t))(v55 + 40);
      v56(v37, v38, v54);
      v57 = *(int *)(v39 + 20);
      v58 = (void *)(v37 + v57);
      v59 = &v38[v57];
      v60 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v55 + 48);
      v61 = v60(v58, 1, v54);
      v62 = v60(v59, 1, v54);
      if (v61)
      {
        if (!v62)
        {
          (*(void (**)(void *, char *, uint64_t))(v55 + 32))(v58, v59, v54);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v55 + 56))(v58, 0, 1, v54);
          return a1;
        }
      }
      else
      {
        if (!v62)
        {
          v56((uint64_t)v58, v59, v54);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v55 + 8))(v58, v54);
      }
      v51 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68) - 8) + 64);
      v52 = v58;
      v53 = v59;
      goto LABEL_14;
    }
    sub_24583D404(v37);
LABEL_13:
    v51 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78) - 8) + 64);
    v52 = (void *)v37;
    v53 = v38;
LABEL_14:
    memcpy(v52, v53, v51);
    return a1;
  }
  if (v43)
    goto LABEL_13;
  v44 = sub_24585A1A0();
  v45 = *(_QWORD *)(v44 - 8);
  v46 = *(void (**)(uint64_t, char *, uint64_t))(v45 + 32);
  v46(v37, v38, v44);
  v47 = *(int *)(v39 + 20);
  v48 = (void *)(v37 + v47);
  v49 = &v38[v47];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v49, 1, v44))
  {
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
    memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
  }
  else
  {
    v46((uint64_t)v48, v49, v44);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v48, 0, 1, v44);
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompanionDevice()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24583E694(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_24585A1E8();
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
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E60);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == (_DWORD)a2)
    {
      v8 = v13;
      v15 = a3[7];
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
      v14 = *(_QWORD *)(v8 - 8);
      v15 = a3[16];
    }
    v10 = a1 + v15;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + a3[6] + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for CompanionDevice()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24583E778(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = sub_24585A1E8();
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
      *(_QWORD *)(a1 + a4[6] + 8) = (a2 - 1);
      return result;
    }
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E60);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[7];
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[16];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_24583E84C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_24585A1E8();
  if (v0 <= 0x3F)
  {
    sub_24583E950(319, &qword_2574B2F08, (void (*)(uint64_t))MEMORY[0x24BEE63B8]);
    if (v1 <= 0x3F)
    {
      sub_24583E950(319, qword_2574B2F10, (void (*)(uint64_t))type metadata accessor for CompanionDevice.SessionInfo);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_24583E950(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_24585A608();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t getEnumTagSinglePayload for CompanionDevice.PairingState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CompanionDevice.PairingState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24583EA78 + 4 * byte_24585AF15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24583EAAC + 4 * byte_24585AF10[v4]))();
}

uint64_t sub_24583EAAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24583EAB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24583EABCLL);
  return result;
}

uint64_t sub_24583EAC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24583EAD0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24583EAD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24583EADC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_24583EAE8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CompanionDevice.PairingState()
{
  return &type metadata for CompanionDevice.PairingState;
}

uint64_t initializeBufferWithCopyOfBuffer for CompanionDevice.Screen(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t getEnumTagSinglePayload for CompanionDevice.Screen(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CompanionDevice.Screen(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
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
  *(_BYTE *)(result + 33) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CompanionDevice.Screen()
{
  return &type metadata for CompanionDevice.Screen;
}

uint64_t storeEnumTagSinglePayload for CompanionDevice.Proximity(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24583EBF0 + 4 * byte_24585AF1F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24583EC24 + 4 * byte_24585AF1A[v4]))();
}

uint64_t sub_24583EC24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24583EC2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24583EC34);
  return result;
}

uint64_t sub_24583EC40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24583EC48);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24583EC4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24583EC54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CompanionDevice.Proximity()
{
  return &type metadata for CompanionDevice.Proximity;
}

uint64_t *initializeBufferWithCopyOfBuffer for CompanionDevice.SessionInfo(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_24585A1A0();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = *(int *)(a3 + 20);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v11, (uint64_t *)v12, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for CompanionDevice.SessionInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void (*v8)(uint64_t, uint64_t);

  v4 = sub_24585A1A0();
  v5 = *(_QWORD *)(v4 - 8);
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v4);
  return result;
}

char *initializeWithCopy for CompanionDevice.SessionInfo(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_24585A1A0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for CompanionDevice.SessionInfo(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = sub_24585A1A0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

char *initializeWithTake for CompanionDevice.SessionInfo(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_24585A1A0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for CompanionDevice.SessionInfo(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = sub_24585A1A0();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CompanionDevice.SessionInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24583F1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_24585A1A0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for CompanionDevice.SessionInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24583F254(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_24585A1A0();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_24583F2D4()
{
  unint64_t v0;
  unint64_t v1;

  sub_24585A1A0();
  if (v0 <= 0x3F)
  {
    sub_24583E950(319, qword_2574B2FC8, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24583F374(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24583F394(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2574B2FF8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2574B2FF8);
  }
}

uint64_t ContinuityLaunchRequest.type.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ContinuityLaunchRequest.payload.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_24583F46C(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t sub_24583F46C(uint64_t a1, unint64_t a2)
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

uint64_t sub_24583F4B0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x64616F6C796170;
  else
    return 1701869940;
}

uint64_t sub_24583F4E0()
{
  char *v0;

  return sub_24583F4B0(*v0);
}

uint64_t sub_24583F4E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24583FD3C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24583F50C()
{
  return 0;
}

void sub_24583F518(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24583F524()
{
  sub_24583FCB4();
  return sub_24585A878();
}

uint64_t sub_24583F54C()
{
  sub_24583FCB4();
  return sub_24585A884();
}

uint64_t sub_24583F574(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v12 = a4;
  v13 = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3028);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24583FCB4();
  sub_24585A86C();
  LOBYTE(v14) = 0;
  sub_24585A77C();
  if (!v5)
  {
    v14 = v12;
    v15 = v13;
    v16 = 1;
    sub_24583FCF8();
    sub_24585A788();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24583F6B8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_24583FE14(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_24583F6E4(_QWORD *a1)
{
  uint64_t *v1;

  return sub_24583F574(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t ContinuityLaunchRequest.init(type:payload:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t ContinuityLaunchRequest.encode()()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  sub_24585A098();
  swift_allocObject();
  sub_24585A08C();
  swift_bridgeObjectRetain();
  sub_24583F46C(v1, v2);
  sub_24583F7DC();
  v3 = sub_24585A080();
  swift_bridgeObjectRelease();
  swift_release();
  sub_24583F820(v1, v2);
  return v3;
}

unint64_t sub_24583F7DC()
{
  unint64_t result;

  result = qword_2574B3FF0;
  if (!qword_2574B3FF0)
  {
    result = MEMORY[0x24953CEC4](&unk_24585B35C, &type metadata for ContinuityLaunchRequest.CodableData);
    atomic_store(result, (unint64_t *)&qword_2574B3FF0);
  }
  return result;
}

uint64_t sub_24583F820(uint64_t a1, unint64_t a2)
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

uint64_t ContinuityLaunchRequest.init(decoding:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint8_t *v15;
  uint8_t *v16;
  uint64_t result;
  unint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  unint64_t v21;

  v7 = sub_24585A344();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24585A074();
  swift_allocObject();
  sub_24585A068();
  sub_24583FA64();
  sub_24585A05C();
  if (v3)
  {

    v11 = sub_24584B1D0();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
    v12 = sub_24585A32C();
    v13 = sub_24585A56C();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v21 = a2;
      v15 = v14;
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_245833000, v12, v13, "Error decoding ContinuityLaunchRequest, falling back to legacy notification.", v14, 2u);
      v16 = v15;
      a2 = v21;
      MEMORY[0x24953CF60](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    result = swift_release();
    v18 = 0xEC0000006E6F6974;
    v19 = 0x6163696669746F6ELL;
  }
  else
  {
    swift_release();
    sub_24583F820(a1, a2);
    v19 = v20[0];
    v18 = v20[1];
    a1 = v20[2];
    a2 = v20[3];
    swift_bridgeObjectRetain();
    sub_24583F46C(a1, a2);
    swift_bridgeObjectRelease();
    result = sub_24583F820(a1, a2);
  }
  *a3 = v19;
  a3[1] = v18;
  a3[2] = a1;
  a3[3] = a2;
  return result;
}

unint64_t sub_24583FA64()
{
  unint64_t result;

  result = qword_2574B3FF8[0];
  if (!qword_2574B3FF8[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585B334, &type metadata for ContinuityLaunchRequest.CodableData);
    atomic_store(result, qword_2574B3FF8);
  }
  return result;
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

ValueMetadata *type metadata accessor for ContinuityLaunchRequest()
{
  return &type metadata for ContinuityLaunchRequest;
}

uint64_t _s24ScreenContinuityServices23ContinuityLaunchRequestVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_24583F820(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

_QWORD *_s24ScreenContinuityServices23ContinuityLaunchRequestVwcp_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[2];
  v5 = a2[3];
  swift_bridgeObjectRetain();
  sub_24583F46C(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

_QWORD *_s24ScreenContinuityServices23ContinuityLaunchRequestVwca_0(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = a2[2];
  v4 = a2[3];
  sub_24583F46C(v5, v4);
  v6 = a1[2];
  v7 = a1[3];
  a1[2] = v5;
  a1[3] = v4;
  sub_24583F820(v6, v7);
  return a1;
}

_QWORD *_s24ScreenContinuityServices23ContinuityLaunchRequestVwta_0(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a1[2];
  v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_24583F820(v5, v6);
  return a1;
}

uint64_t _s24ScreenContinuityServices23ContinuityLaunchRequestVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_24583FC40(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContinuityLaunchRequest.CodableData()
{
  return &type metadata for ContinuityLaunchRequest.CodableData;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24583FCB4()
{
  unint64_t result;

  result = qword_2574B4100[0];
  if (!qword_2574B4100[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585B448, &type metadata for ContinuityLaunchRequest.CodableData.CodingKeys);
    atomic_store(result, qword_2574B4100);
  }
  return result;
}

unint64_t sub_24583FCF8()
{
  unint64_t result;

  result = qword_2574B3030;
  if (!qword_2574B3030)
  {
    result = MEMORY[0x24953CEC4](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2574B3030);
  }
  return result;
}

uint64_t sub_24583FD3C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v3 || (sub_24585A7C4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64616F6C796170 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_24585A7C4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24583FE14(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v9;
  unint64_t v10;
  _BYTE v11[16];
  uint64_t v12;
  unint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3038);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24583FCB4();
  sub_24585A860();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    LOBYTE(v12) = 0;
    v7 = sub_24585A74C();
    v11[15] = 1;
    sub_24583FFEC();
    swift_bridgeObjectRetain();
    sub_24585A758();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    v9 = v12;
    v10 = v13;
    swift_bridgeObjectRetain();
    sub_24583F46C(v9, v10);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    sub_24583F820(v9, v10);
  }
  return v7;
}

unint64_t sub_24583FFEC()
{
  unint64_t result;

  result = qword_2574B3040;
  if (!qword_2574B3040)
  {
    result = MEMORY[0x24953CEC4](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2574B3040);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ContinuityLaunchRequest.CodableData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24584007C + 4 * byte_24585B2F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2458400B0 + 4 * asc_24585B2F0[v4]))();
}

uint64_t sub_2458400B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2458400B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2458400C0);
  return result;
}

uint64_t sub_2458400CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2458400D4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2458400D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2458400E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContinuityLaunchRequest.CodableData.CodingKeys()
{
  return &type metadata for ContinuityLaunchRequest.CodableData.CodingKeys;
}

unint64_t sub_245840100()
{
  unint64_t result;

  result = qword_2574B4210[0];
  if (!qword_2574B4210[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585B420, &type metadata for ContinuityLaunchRequest.CodableData.CodingKeys);
    atomic_store(result, qword_2574B4210);
  }
  return result;
}

unint64_t sub_245840148()
{
  unint64_t result;

  result = qword_2574B4320;
  if (!qword_2574B4320)
  {
    result = MEMORY[0x24953CEC4](&unk_24585B390, &type metadata for ContinuityLaunchRequest.CodableData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B4320);
  }
  return result;
}

unint64_t sub_245840190()
{
  unint64_t result;

  result = qword_2574B4328[0];
  if (!qword_2574B4328[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585B3B8, &type metadata for ContinuityLaunchRequest.CodableData.CodingKeys);
    atomic_store(result, qword_2574B4328);
  }
  return result;
}

_QWORD *CompanionDeviceManager.__allocating_init()()
{
  _QWORD *v0;

  v0 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  type metadata accessor for ReplicatorController();
  v0[14] = sub_24584A6F4();
  type metadata accessor for SharingController();
  v0[15] = sub_245834EE4();
  type metadata accessor for RapportController();
  v0[16] = sub_24584B40C();
  type metadata accessor for SessionManager(0);
  v0[17] = sub_2458503A4();
  return v0;
}

_QWORD *CompanionDeviceManager.init()()
{
  _QWORD *v0;

  swift_defaultActor_initialize();
  type metadata accessor for ReplicatorController();
  v0[14] = sub_24584A6F4();
  type metadata accessor for SharingController();
  v0[15] = sub_245834EE4();
  type metadata accessor for RapportController();
  v0[16] = sub_24584B40C();
  type metadata accessor for SessionManager(0);
  v0[17] = sub_2458503A4();
  return v0;
}

uint64_t CompanionDeviceManager.Options.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

ScreenContinuityServices::CompanionDeviceManager::Options __swiftcall CompanionDeviceManager.Options.init(rawValue:)(ScreenContinuityServices::CompanionDeviceManager::Options rawValue)
{
  ScreenContinuityServices::CompanionDeviceManager::Options *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static CompanionDeviceManager.Options.remoteScreen.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static CompanionDeviceManager.Options.sessionInfo.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

_QWORD *sub_2458402FC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_245840308(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_245840310@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_245840324@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_245840338@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_24584034C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_24584037C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_2458403A8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_2458403CC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_2458403E0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_2458403F4(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_245840408@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_24584041C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_245840430(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_245840444(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_245840458()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_245840468()
{
  return sub_24585A62C();
}

_QWORD *sub_245840480(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_245840494@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2458404A4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_2458404B0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2458404C8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_24584051C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v55;
  unsigned int v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;

  v68 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3048);
  v65 = *(_QWORD *)(v3 - 8);
  v66 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v64 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3050);
  v69 = *(_QWORD *)(v5 - 8);
  v70 = v5;
  v71 = *(_QWORD *)(v69 + 64);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v67 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v74 = (char *)&v53 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3058);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060);
  v16 = *(_QWORD *)(*(_QWORD *)(v72 - 8) + 64);
  v17 = *(_QWORD *)(v72 - 8);
  v18 = MEMORY[0x24BDAC7A8](v72);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v53 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3068);
  v60 = *(_QWORD *)(v21 - 8);
  v61 = v21;
  v62 = *(_QWORD *)(v60 + 64);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v59 = (char *)&v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v75 = (char *)&v53 - v24;
  v73 = *a1;
  v56 = *MEMORY[0x24BEE6CA0];
  (*(void (**)(char *))(v13 + 104))(v15);
  sub_24585A500();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v55 = sub_24585A4A0();
  v54 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56);
  v25 = (uint64_t)v11;
  v54(v11, 1, 1, v55);
  v26 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v27 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = v20;
  v28 = v72;
  v26(v27, v20, v72);
  v30 = sub_24583661C(&qword_2574B3078, v29, (uint64_t (*)(uint64_t))type metadata accessor for CompanionDeviceManager, (uint64_t)&protocol conformance descriptor for CompanionDeviceManager);
  v31 = *(unsigned __int8 *)(v17 + 80);
  v58 = v17;
  v32 = (v31 + 40) & ~v31;
  v33 = (char *)swift_allocObject();
  v34 = v63;
  *((_QWORD *)v33 + 2) = v63;
  *((_QWORD *)v33 + 3) = v30;
  *((_QWORD *)v33 + 4) = v34;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v33[v32], v27, v28);
  *(_QWORD *)&v33[(v16 + v32 + 7) & 0xFFFFFFFFFFFFFFF8] = v73;
  swift_retain_n();
  v35 = v25;
  v53 = v25;
  v63 = sub_245836718(v25, (uint64_t)&unk_2574B3080, (uint64_t)v33);
  swift_retain();
  sub_24585A50C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3088);
  v37 = v64;
  v36 = v65;
  v38 = v66;
  (*(void (**)(char *, _QWORD, uint64_t))(v65 + 104))(v64, v56, v66);
  v39 = v74;
  sub_24585A500();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  v54((char *)v35, 1, 1, v55);
  v40 = v59;
  v41 = v60;
  v42 = v61;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v59, v75, v61);
  v43 = v69;
  v44 = v70;
  v45 = v67;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v67, v39, v70);
  v46 = (*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  v47 = (v62 + v46 + 7) & 0xFFFFFFFFFFFFFFF8;
  v48 = v43;
  v49 = (*(unsigned __int8 *)(v43 + 80) + v47 + 8) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
  v50 = swift_allocObject();
  *(_QWORD *)(v50 + 16) = 0;
  *(_QWORD *)(v50 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v41 + 32))(v50 + v46, v40, v42);
  *(_QWORD *)(v50 + v47) = v73;
  (*(void (**)(unint64_t, char *, uint64_t))(v48 + 32))(v50 + v49, v45, v44);
  sub_245836718(v53, (uint64_t)&unk_2574B3098, v50);
  v51 = v74;
  sub_24585A50C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v51, v44);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v72);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v75, v42);
}

uint64_t sub_245840A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return swift_task_switch();
}

uint64_t sub_245840A70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = *(_QWORD *)(v2 + 40);
  sub_24583661C(&qword_2574B3078, a2, (uint64_t (*)(uint64_t))type metadata accessor for CompanionDeviceManager, (uint64_t)&protocol conformance descriptor for CompanionDeviceManager);
  v4 = swift_task_alloc();
  *(_QWORD *)(v2 + 48) = v4;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v2 + 24);
  *(_QWORD *)(v4 + 32) = v3;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 56) = v5;
  *v5 = v2;
  v5[1] = sub_245840B34;
  return sub_24585A7AC();
}

uint64_t sub_245840B34()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t type metadata accessor for CompanionDeviceManager()
{
  return objc_opt_self();
}

uint64_t sub_245840BA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_245840C30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = v1 + v5;
  v8 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_24583B190;
  v9[4] = v7;
  v9[5] = v8;
  v9[2] = a1;
  v9[3] = v6;
  return swift_task_switch();
}

uint64_t sub_245840CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[4] = a4;
  v5[5] = a5;
  v5[2] = a2;
  v5[3] = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060);
  v5[6] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[7] = v7;
  v5[8] = *(_QWORD *)(v7 + 64);
  v5[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245840D44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v18)(uint64_t, _QWORD, uint64_t);

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 112);
  v18 = *(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16);
  v18(v1, *(_QWORD *)(v0 + 32), v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = (char *)swift_allocObject();
  *((_QWORD *)v7 + 2) = 0;
  *((_QWORD *)v7 + 3) = 0;
  *((_QWORD *)v7 + 4) = v5;
  v8 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 32);
  v8(&v7[v6], v1, v2);
  swift_retain();
  sub_245841250((uint64_t)&unk_2574B3178, (uint64_t)v7);
  if ((v4 & 1) != 0)
  {
    v9 = *(_QWORD *)(v0 + 72);
    v10 = *(_QWORD *)(v0 + 48);
    v11 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 120);
    v18(v9, *(_QWORD *)(v0 + 32), v10);
    v12 = (char *)swift_allocObject();
    *((_QWORD *)v12 + 2) = 0;
    *((_QWORD *)v12 + 3) = 0;
    *((_QWORD *)v12 + 4) = v11;
    v8(&v12[v6], v9, v10);
    swift_retain();
    sub_245841250((uint64_t)&unk_2574B3198, (uint64_t)v12);
  }
  if ((*(_BYTE *)(v0 + 40) & 4) != 0)
  {
    v13 = *(_QWORD *)(v0 + 72);
    v14 = *(_QWORD *)(v0 + 48);
    v15 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 136);
    v18(v13, *(_QWORD *)(v0 + 32), v14);
    v16 = (char *)swift_allocObject();
    *((_QWORD *)v16 + 2) = 0;
    *((_QWORD *)v16 + 3) = 0;
    *((_QWORD *)v16 + 4) = v15;
    v8(&v16[v6], v13, v14);
    swift_retain();
    sub_245841250((uint64_t)&unk_2574B3188, (uint64_t)v16);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245840F00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;

  v4[5] = a3;
  v4[6] = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B31A0);
  v4[7] = v6;
  v4[8] = *(_QWORD *)(v6 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B31D8);
  v4[11] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B31E0);
  v4[12] = v7;
  v4[13] = *(_QWORD *)(v7 - 8);
  v4[14] = swift_task_alloc();
  v4[15] = *(_QWORD *)(*(_QWORD *)a3 + 88);
  return swift_task_switch();
}

uint64_t sub_245840FC8()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 120))();
  return swift_task_switch();
}

uint64_t sub_24584100C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2458383AC(&qword_2574B31E8, &qword_2574B31D8, MEMORY[0x24BEE6AA8]);
  sub_24585A4F4();
  sub_2458383AC(qword_2574B31F0, &qword_2574B31E0, MEMORY[0x24BEE6A88]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_2458410D0;
  return sub_24585A488();
}

uint64_t sub_2458410D0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245841124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 32);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 64);
    v2 = *(_QWORD *)(v0 + 72);
    v4 = *(_QWORD *)(v0 + 56);
    *(_QWORD *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060);
    sub_24585A524();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    sub_2458383AC(qword_2574B31F0, &qword_2574B31E0, MEMORY[0x24BEE6A88]);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v5;
    *v5 = v0;
    v5[1] = sub_2458410D0;
    return sub_24585A488();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245841250(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[4];
  _QWORD v22[4];

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v21 - v10;
  v12 = sub_24585A4A0();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  sub_2458450E4((uint64_t)v11, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12) == 1)
  {
    sub_24583AE20((uint64_t)v9, &qword_2574B2CC0);
    if (*(_QWORD *)(a2 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v14 = sub_24585A458();
      v16 = v15;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_24585A494();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v12);
    if (*(_QWORD *)(a2 + 16))
      goto LABEL_3;
  }
  v14 = 0;
  v16 = 0;
LABEL_6:
  v17 = *v3;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a1;
  *(_QWORD *)(v18 + 24) = a2;
  v19 = (_QWORD *)(v16 | v14);
  if (v16 | v14)
  {
    v22[0] = 0;
    v22[1] = 0;
    v19 = v22;
    v22[2] = v14;
    v22[3] = v16;
  }
  v21[1] = 1;
  v21[2] = v19;
  v21[3] = v17;
  swift_task_create();
  return swift_release();
}

uint64_t sub_245841424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;

  v4[7] = a3;
  v4[8] = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B31A0);
  v4[9] = v6;
  v4[10] = *(_QWORD *)(v6 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B31A8);
  v4[13] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B31B0);
  v4[14] = v7;
  v4[15] = *(_QWORD *)(v7 - 8);
  v4[16] = swift_task_alloc();
  v4[17] = *(_QWORD *)(*(_QWORD *)a3 + 128);
  type metadata accessor for SharingController();
  sub_24583661C(&qword_2574B2CE8, 255, (uint64_t (*)(uint64_t))type metadata accessor for SharingController, (uint64_t)&unk_24585AE24);
  sub_24585A458();
  return swift_task_switch();
}

uint64_t sub_24584152C()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 136))();
  return swift_task_switch();
}

uint64_t sub_245841570()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 144) = swift_getOpaqueTypeConformance2();
  sub_24585A4F4();
  swift_getAssociatedConformanceWitness();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v1;
  *v1 = v0;
  v1[1] = sub_245841640;
  return sub_24585A488();
}

uint64_t sub_245841640()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2458416A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 32);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 80);
    v2 = *(_QWORD *)(v0 + 88);
    v4 = *(_QWORD *)(v0 + 72);
    *(_QWORD *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060);
    sub_24585A524();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    swift_getAssociatedConformanceWitness();
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v5;
    *v5 = v0;
    v5[1] = sub_245841640;
    return sub_24585A488();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2458417EC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
  *(_QWORD *)(v0 + 48) = *(_QWORD *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060);
  sub_24585A530();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24584186C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;

  v4[7] = a3;
  v4[8] = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B31A0);
  v4[9] = v6;
  v4[10] = *(_QWORD *)(v6 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B31B8);
  v4[13] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B31C0);
  v4[14] = v7;
  v4[15] = *(_QWORD *)(v7 - 8);
  v4[16] = swift_task_alloc();
  v4[17] = *(_QWORD *)(*(_QWORD *)a3 + 408);
  type metadata accessor for SessionManager(0);
  sub_24583661C((unint64_t *)&unk_2574B30C8, 255, type metadata accessor for SessionManager, (uint64_t)&unk_24585BB9C);
  sub_24585A458();
  return swift_task_switch();
}

uint64_t sub_245841974()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 136))();
  return swift_task_switch();
}

uint64_t sub_2458419B8()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 144) = swift_getOpaqueTypeConformance2();
  sub_24585A4F4();
  swift_getAssociatedConformanceWitness();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v1;
  *v1 = v0;
  v1[1] = sub_245841A88;
  return sub_24585A488();
}

uint64_t sub_245841A88()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245841AEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 32);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 80);
    v2 = *(_QWORD *)(v0 + 88);
    v4 = *(_QWORD *)(v0 + 72);
    *(_QWORD *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060);
    sub_24585A524();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    swift_getAssociatedConformanceWitness();
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v5;
    *v5 = v0;
    v5[1] = sub_245841A88;
    return sub_24585A488();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245841C34()
{
  return sub_24585A4E8();
}

uint64_t sub_245841C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6[14] = a5;
  v6[15] = a6;
  v6[13] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
  v6[16] = swift_task_alloc();
  v7 = sub_24585A1E8();
  v6[17] = v7;
  v6[18] = *(_QWORD *)(v7 - 8);
  v6[19] = swift_task_alloc();
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  v8 = type metadata accessor for CompanionDevice(0);
  v6[22] = v8;
  v6[23] = *(_QWORD *)(v8 - 8);
  v6[24] = swift_task_alloc();
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3140);
  v6[27] = v9;
  v6[28] = *(_QWORD *)(v9 - 8);
  v6[29] = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3148);
  v6[30] = v10;
  v6[31] = *(_QWORD *)(v10 - 8);
  v6[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245841D98()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3068);
  sub_24585A4D0();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 264) = v1;
  *v1 = v0;
  v1[1] = sub_245841E28;
  return sub_24585A548();
}

uint64_t sub_245841E28()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 344) = 0;
    *(_QWORD *)(v2 + 352) = 0;
    *(_QWORD *)(v2 + 360) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_OWORD *)(v2 + 272) = 0u;
    *(_OWORD *)(v2 + 288) = 0u;
  }
  return swift_task_switch();
}

uint64_t sub_245841EA0()
{
  uint64_t v0;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);
  unint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  void (*v46)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(unint64_t, uint64_t, uint64_t);
  int isUniquelyReferenced_nonNull_native;
  char v57;
  unint64_t v58;
  uint64_t v59;
  _BOOL8 v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  _QWORD *v79;
  size_t v80;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v1 = v0 + 56;
  v2 = *(_QWORD *)(v0 + 56);
  switch(*(_BYTE *)(v0 + 64))
  {
    case 0:
      swift_bridgeObjectRelease();
      v3 = *(_QWORD *)(v0 + 280);
      v4 = *(_QWORD *)(v0 + 288);
      v5 = *(_QWORD *)(v0 + 272);
      swift_bridgeObjectRetain();
      v6 = v2;
      v2 = v5;
      v7 = *(_QWORD *)(v0 + 112);
      if ((v7 & 1) == 0)
        goto LABEL_13;
      goto LABEL_11;
    case 1:
      v3 = *(_QWORD *)(v0 + 280);
      v4 = *(_QWORD *)(v0 + 288);
      goto LABEL_9;
    case 2:
      v4 = *(_QWORD *)(v0 + 288);
      v3 = *(_QWORD *)(v0 + 56);
      goto LABEL_8;
    case 3:
      v4 = *(_QWORD *)(v0 + 56);
      v3 = *(_QWORD *)(v0 + 280);
LABEL_8:
      v2 = *(_QWORD *)(v0 + 272);
LABEL_9:
      v9 = *(_QWORD *)(v0 + 296);
      swift_bridgeObjectRelease();
      if (!v9)
      {
        v6 = 0;
        v10 = v3;
        goto LABEL_61;
      }
      v6 = *(_QWORD *)(v0 + 296);
      swift_bridgeObjectRetain();
      v7 = *(_QWORD *)(v0 + 112);
      if ((v7 & 1) == 0)
        goto LABEL_13;
LABEL_11:
      if (!v3)
      {
        swift_bridgeObjectRelease();
        v10 = 0;
LABEL_61:
        *(_QWORD *)(v0 + 320) = v10;
        *(_QWORD *)(v0 + 328) = v2;
        *(_QWORD *)(v0 + 304) = v6;
        *(_QWORD *)(v0 + 312) = v4;
        v86 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 336) = v86;
        *v86 = v0;
        v86[1] = sub_24584262C;
        return sub_24585A548();
      }
LABEL_13:
      if ((v7 & 4) != 0 && !v4)
      {
        swift_bridgeObjectRelease();
        v10 = v3;
        goto LABEL_61;
      }
      v11 = *(_QWORD *)(v6 + 16);
      v90 = v4;
      v91 = v2;
      v89 = v3;
      v87 = v6;
      if (!v11)
      {
        v74 = MEMORY[0x24BEE4B00];
LABEL_51:
        swift_bridgeObjectRelease();
        v75 = *(_QWORD *)(v74 + 16);
        if (v75)
        {
          v76 = *(_QWORD *)(v0 + 184);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3150);
          v77 = *(_QWORD *)(v76 + 72);
          v78 = (*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
          v79 = (_QWORD *)swift_allocObject();
          v80 = _swift_stdlib_malloc_size(v79);
          if (!v77)
          {
LABEL_65:
            __break(1u);
            goto LABEL_66;
          }
          if (v80 - v78 == 0x8000000000000000 && v77 == -1)
          {
LABEL_67:
            __break(1u);
            JUMPOUT(0x24584261CLL);
          }
          v79[2] = v75;
          v79[3] = 2 * ((uint64_t)(v80 - v78) / v77);
          v82 = sub_245844B48((_QWORD *)(v1 - 40), (uint64_t)v79 + v78, v75, v74);
          swift_bridgeObjectRetain();
          sub_2458387F0();
          if (v82 != v75)
          {
LABEL_66:
            __break(1u);
            goto LABEL_67;
          }
          swift_bridgeObjectRelease();
          v2 = v91;
        }
        else
        {
          swift_bridgeObjectRelease();
          v79 = (_QWORD *)MEMORY[0x24BEE4AF8];
        }
        v84 = *(_QWORD *)(v0 + 224);
        v83 = *(_QWORD *)(v0 + 232);
        v85 = *(_QWORD *)(v0 + 216);
        *(_QWORD *)(v0 + 96) = v79;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3050);
        sub_24585A524();
        (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
        v10 = v89;
        v4 = v90;
        v6 = v87;
        goto LABEL_61;
      }
      v12 = *(_QWORD *)(v0 + 184);
      v13 = v6 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
      v14 = *(_QWORD *)(v12 + 72);
      swift_bridgeObjectRetain();
      v93 = MEMORY[0x24BEE4B00];
      v88 = v14;
      break;
    default:
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 240));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
  }
  while (1)
  {
    v92 = v11;
    v23 = *(_QWORD *)(v0 + 200);
    v24 = *(_QWORD *)(v0 + 208);
    v25 = *(_QWORD *)(v0 + 168);
    v26 = *(_QWORD *)(v0 + 176);
    v27 = *(_QWORD *)(v0 + 136);
    v28 = *(_QWORD *)(v0 + 144);
    sub_245844E38(v13, v24, type metadata accessor for CompanionDevice);
    v29 = v24 + *(int *)(v26 + 20);
    v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16);
    v30(v25, v29, v27);
    sub_245844E38(v24, v23, type metadata accessor for CompanionDevice);
    if (v91)
    {
      if (*(_QWORD *)(v91 + 16))
      {
        v31 = sub_245838F7C(*(_QWORD *)(v0 + 168));
        if ((v32 & 1) != 0)
          *(_BYTE *)(*(_QWORD *)(v0 + 200) + *(int *)(*(_QWORD *)(v0 + 176) + 60)) = *(_BYTE *)(*(_QWORD *)(v91 + 56)
                                                                                                + v31);
      }
    }
    if (v89)
    {
      if (*(_QWORD *)(v89 + 16))
      {
        v33 = sub_245838F7C(*(_QWORD *)(v0 + 168));
        if ((v34 & 1) != 0)
        {
          v35 = *(_QWORD *)(v0 + 200);
          v36 = *(int *)(*(_QWORD *)(v0 + 176) + 56);
          if ((*(_BYTE *)(*(_QWORD *)(v89 + 56) + v33) & 1) != 0)
          {
            v37 = 2;
            goto LABEL_31;
          }
          *(_BYTE *)(v35 + v36) = 0;
          if (!v90)
            goto LABEL_39;
LABEL_32:
          CompanionDevice.id.getter(*(_QWORD *)(v0 + 160));
          if (*(_QWORD *)(v90 + 16))
          {
            v38 = sub_245838F7C(*(_QWORD *)(v0 + 160));
            v39 = *(_QWORD *)(v0 + 128);
            if ((v40 & 1) != 0)
            {
              v41 = v38;
              v42 = *(_QWORD *)(v90 + 56);
              v43 = type metadata accessor for CompanionDevice.SessionInfo(0);
              v44 = v30;
              v45 = *(_QWORD *)(v43 - 8);
              sub_245844E38(v42 + *(_QWORD *)(v45 + 72) * v41, v39, type metadata accessor for CompanionDevice.SessionInfo);
              v46 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v45 + 56);
              v30 = v44;
              v46(v39, 0, 1, v43);
LABEL_37:
              (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 136));
              goto LABEL_40;
            }
          }
          else
          {
            v39 = *(_QWORD *)(v0 + 128);
          }
          v47 = type metadata accessor for CompanionDevice.SessionInfo(0);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v39, 1, 1, v47);
          goto LABEL_37;
        }
      }
    }
    v35 = *(_QWORD *)(v0 + 200);
    v36 = *(int *)(*(_QWORD *)(v0 + 176) + 56);
    v37 = 3;
LABEL_31:
    *(_BYTE *)(v35 + v36) = v37;
    if (v90)
      goto LABEL_32;
LABEL_39:
    v48 = *(_QWORD *)(v0 + 128);
    v49 = type metadata accessor for CompanionDevice.SessionInfo(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v48, 1, 1, v49);
LABEL_40:
    v50 = *(_QWORD *)(v0 + 192);
    v51 = *(_QWORD *)(v0 + 200);
    v52 = *(_QWORD *)(v0 + 152);
    v53 = *(_QWORD *)(v0 + 136);
    sub_245844488(*(_QWORD *)(v0 + 128), v51 + *(int *)(*(_QWORD *)(v0 + 176) + 64));
    v54 = v29;
    v55 = (void (*)(unint64_t, uint64_t, uint64_t))v30;
    v30(v52, v54, v53);
    sub_245844E38(v51, v50, type metadata accessor for CompanionDevice);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v0 + 88) = v93;
    v58 = sub_245838F7C(v52);
    v59 = *(_QWORD *)(v93 + 16);
    v60 = (v57 & 1) == 0;
    v61 = v59 + v60;
    if (__OFADD__(v59, v60))
    {
      __break(1u);
LABEL_64:
      __break(1u);
      goto LABEL_65;
    }
    v62 = v57;
    if (*(_QWORD *)(v93 + 24) >= v61)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_2458448C8();
      goto LABEL_46;
    }
    v63 = *(_QWORD *)(v0 + 152);
    sub_2458444D0(v61, isUniquelyReferenced_nonNull_native);
    v64 = sub_245838F7C(v63);
    if ((v62 & 1) != (v65 & 1))
      return sub_24585A7E8();
    v58 = v64;
LABEL_46:
    v66 = *(_QWORD **)(v0 + 88);
    v67 = *(_QWORD *)(v0 + 192);
    if ((v62 & 1) != 0)
    {
      v93 = *(_QWORD *)(v0 + 88);
      v15 = v88;
      sub_245844DF4(v67, v66[7] + v58 * v88);
    }
    else
    {
      v69 = *(_QWORD *)(v0 + 144);
      v68 = *(_QWORD *)(v0 + 152);
      v70 = *(_QWORD *)(v0 + 136);
      v66[(v58 >> 6) + 8] |= 1 << v58;
      v55(v66[6] + *(_QWORD *)(v69 + 72) * v58, v68, v70);
      v15 = v88;
      sub_2458443EC(v67, v66[7] + v58 * v88);
      v71 = v66[2];
      v72 = __OFADD__(v71, 1);
      v73 = v71 + 1;
      if (v72)
        goto LABEL_64;
      v66[2] = v73;
      v93 = *(_QWORD *)(v0 + 88);
    }
    v16 = *(_QWORD *)(v0 + 200);
    v17 = *(_QWORD *)(v0 + 208);
    v18 = *(_QWORD *)(v0 + 168);
    v20 = *(_QWORD *)(v0 + 144);
    v19 = *(_QWORD *)(v0 + 152);
    v21 = *(_QWORD *)(v0 + 136);
    swift_bridgeObjectRelease();
    v22 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v22(v19, v21);
    v22(v18, v21);
    sub_24584533C(v16, type metadata accessor for CompanionDevice);
    sub_24584533C(v17, type metadata accessor for CompanionDevice);
    v13 += v15;
    v11 = v92 - 1;
    if (v92 == 1)
    {
      swift_bridgeObjectRelease();
      v1 = v0 + 56;
      v2 = v91;
      v74 = v93;
      goto LABEL_51;
    }
  }
}

uint64_t sub_24584262C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    v3 = *(_QWORD *)(v2 + 312);
    *(_OWORD *)(v2 + 352) = *(_OWORD *)(v2 + 320);
    *(_QWORD *)(v2 + 344) = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)(v2 + 320);
    v4 = *(_QWORD *)(v2 + 328);
    v6 = *(_QWORD *)(v2 + 304);
    *(_QWORD *)(v2 + 288) = *(_QWORD *)(v2 + 312);
    *(_QWORD *)(v2 + 296) = v6;
    *(_QWORD *)(v2 + 272) = v4;
    *(_QWORD *)(v2 + 280) = v5;
  }
  return swift_task_switch();
}

uint64_t sub_2458426B0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 240));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 80) = *(_QWORD *)(v0 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3050);
  sub_24585A530();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2458427A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3068);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3050);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_245842878()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B3068) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B3050) - 8) + 80);
  v6 = v4 + v5 + 8;
  v7 = v0 + v3;
  v8 = *(_QWORD *)(v0 + v4);
  v9 = v0 + (v6 & ~v5);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = sub_24583A348;
  return sub_245841C58((uint64_t)v10, v11, v12, v7, v8, v9);
}

uint64_t sub_245842928(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_245842940()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))(**(int **)(**(_QWORD **)(v0[3] + 112) + 96)
                                      + *(_QWORD *)(**(_QWORD **)(v0[3] + 112) + 96));
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_2458429A8;
  return v3(v0[2]);
}

uint64_t sub_2458429A8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2458429F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2[2] = v1;
  v4 = sub_24585A1E8();
  v2[3] = v4;
  v2[4] = *(_QWORD *)(v4 - 8);
  v5 = swift_task_alloc();
  v2[5] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v2[6] = v6;
  *v6 = v2;
  v6[1] = sub_245842A7C;
  return sub_245842C70(v5, a1);
}

uint64_t sub_245842A7C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245842AE4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))(**(int **)(**(_QWORD **)(v0[2] + 120) + 136)
                                      + *(_QWORD *)(**(_QWORD **)(v0[2] + 120) + 136));
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = v1;
  *v1 = v0;
  v1[1] = sub_245842B4C;
  return v3(v0[5]);
}

uint64_t sub_245842B4C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245842BB0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245842BF8()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245842C2C()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245842C70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3128);
  v3[6] = swift_task_alloc();
  v4 = type metadata accessor for CompanionDevice(0);
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3130);
  v3[11] = v5;
  v3[12] = *(_QWORD *)(v5 - 8);
  v3[13] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3120);
  v3[14] = v6;
  v3[15] = *(_QWORD *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245842D70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 40);
  v3 = 0;
  (*(void (**)(uint64_t *))(*(_QWORD *)v1 + 128))(&v3);
  return swift_task_switch();
}

uint64_t sub_245842DC0()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[15] + 16))(v0[16], v0[17], v0[14]);
  sub_2458383AC(&qword_2574B3118, &qword_2574B3120, MEMORY[0x24BEE6D38]);
  sub_24585A4F4();
  sub_2458383AC(&qword_2574B3138, &qword_2574B3130, MEMORY[0x24BEE6D18]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[18] = v1;
  *v1 = v0;
  v1[1] = sub_245842E90;
  return sub_24585A47C();
}

uint64_t sub_245842E90()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
    (*(void (**)(_QWORD, _QWORD))(v2[12] + 8))(v2[13], v2[11]);
  return swift_task_switch();
}

uint64_t sub_245842F04()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0[20] = v0[2];
  v1 = v0[17];
  v2 = v0[14];
  v3 = v0[15];
  (*(void (**)(_QWORD, _QWORD))(v0[12] + 8))(v0[13], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  return swift_task_switch();
}

uint64_t sub_245842F8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32);
  type metadata accessor for CompanionDeviceManager.CompanionDeviceError();
  sub_2458443A4();
  swift_allocError();
  v3 = v2;
  v4 = sub_24585A1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v3, v1, v4);
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245843070()
{
  _QWORD *v0;

  (*(void (**)(_QWORD, _QWORD))(v0[15] + 8))(v0[17], v0[14]);
  return swift_task_switch();
}

uint64_t sub_2458430B8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245843130()
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

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 64);
    v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v5 = *(_QWORD *)(v3 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_245844E38(v4, *(_QWORD *)(v0 + 72), type metadata accessor for CompanionDevice);
      if ((sub_24585A1C4() & 1) != 0)
        break;
      sub_24584533C(*(_QWORD *)(v0 + 72), type metadata accessor for CompanionDevice);
      v4 += v5;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    v7 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 48);
    swift_bridgeObjectRelease();
    sub_2458443EC(v7, v8);
    v6 = 0;
  }
  else
  {
LABEL_6:
    v6 = 1;
  }
  v9 = *(_QWORD *)(v0 + 56);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = *(_QWORD *)(v0 + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v11, v6, 1, v9);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_24583AE20(*(_QWORD *)(v0 + 48), &qword_2574B3128);
    v12 = *(_QWORD *)(v0 + 32);
    type metadata accessor for CompanionDeviceManager.CompanionDeviceError();
    sub_2458443A4();
    swift_allocError();
    v14 = v13;
    v15 = sub_24585A1E8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v14, v12, v15);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 80);
    v17 = *(_QWORD *)(v0 + 56);
    v18 = *(_QWORD *)(v0 + 24);
    sub_2458443EC(*(_QWORD *)(v0 + 48), v16);
    v19 = v16 + *(int *)(v17 + 20);
    v20 = sub_24585A1E8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
    sub_24584533C(v16, type metadata accessor for CompanionDevice);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2458433A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3128);
  v3[6] = swift_task_alloc();
  v4 = type metadata accessor for CompanionDevice(0);
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3130);
  v3[11] = v5;
  v3[12] = *(_QWORD *)(v5 - 8);
  v3[13] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3120);
  v3[14] = v6;
  v3[15] = *(_QWORD *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2458434A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 40);
  v3 = 0;
  (*(void (**)(uint64_t *))(*(_QWORD *)v1 + 128))(&v3);
  return swift_task_switch();
}

uint64_t sub_2458434F4()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[15] + 16))(v0[16], v0[17], v0[14]);
  sub_2458383AC(&qword_2574B3118, &qword_2574B3120, MEMORY[0x24BEE6D38]);
  sub_24585A4F4();
  sub_2458383AC(&qword_2574B3138, &qword_2574B3130, MEMORY[0x24BEE6D18]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[18] = v1;
  *v1 = v0;
  v1[1] = sub_2458435C4;
  return sub_24585A47C();
}

uint64_t sub_2458435C4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
    (*(void (**)(_QWORD, _QWORD))(v2[12] + 8))(v2[13], v2[11]);
  return swift_task_switch();
}

uint64_t sub_245843638()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0[20] = v0[2];
  v1 = v0[17];
  v2 = v0[14];
  v3 = v0[15];
  (*(void (**)(_QWORD, _QWORD))(v0[12] + 8))(v0[13], v0[11]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  return swift_task_switch();
}

uint64_t sub_2458436C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32);
  type metadata accessor for CompanionDeviceManager.CompanionDeviceError();
  sub_2458443A4();
  swift_allocError();
  v3 = v2;
  v4 = sub_24585A1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v3, v1, v4);
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2458437A4()
{
  _QWORD *v0;

  (*(void (**)(_QWORD, _QWORD))(v0[15] + 8))(v0[17], v0[14]);
  return swift_task_switch();
}

uint64_t sub_2458437EC()
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

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 64);
    v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v5 = *(_QWORD *)(v3 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_245844E38(v4, *(_QWORD *)(v0 + 72), type metadata accessor for CompanionDevice);
      if ((sub_24585A1C4() & 1) != 0)
        break;
      sub_24584533C(*(_QWORD *)(v0 + 72), type metadata accessor for CompanionDevice);
      v4 += v5;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    v7 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 48);
    swift_bridgeObjectRelease();
    sub_2458443EC(v7, v8);
    v6 = 0;
  }
  else
  {
LABEL_6:
    v6 = 1;
  }
  v9 = *(_QWORD *)(v0 + 56);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = *(_QWORD *)(v0 + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v11, v6, 1, v9);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_24583AE20(*(_QWORD *)(v0 + 48), &qword_2574B3128);
    v12 = *(_QWORD *)(v0 + 32);
    type metadata accessor for CompanionDeviceManager.CompanionDeviceError();
    sub_2458443A4();
    swift_allocError();
    v14 = v13;
    v15 = sub_24585A1E8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v14, v12, v15);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 80);
    v17 = *(_QWORD *)(v0 + 24);
    sub_2458443EC(*(_QWORD *)(v0 + 48), v16);
    v18 = sub_24585A1E8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v17, v16, v18);
    sub_24584533C(v16, type metadata accessor for CompanionDevice);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245843A54(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2[2] = v1;
  v4 = sub_24585A1E8();
  v2[3] = v4;
  v2[4] = *(_QWORD *)(v4 - 8);
  v5 = swift_task_alloc();
  v2[5] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v2[6] = v6;
  *v6 = v2;
  v6[1] = sub_245843AE0;
  return sub_2458433A4(v5, a1);
}

uint64_t sub_245843AE0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245843B48()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0[2] + 136);
  v0[8] = v1;
  v0[9] = *(_QWORD *)(*(_QWORD *)v1 + 488);
  type metadata accessor for SessionManager(0);
  sub_24583661C((unint64_t *)&unk_2574B30C8, 255, type metadata accessor for SessionManager, (uint64_t)&unk_24585BB9C);
  sub_24585A458();
  return swift_task_switch();
}

uint64_t sub_245843BD4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  (*(void (**)(_QWORD))(v0 + 72))(*(_QWORD *)(v0 + 40));
  *(_QWORD *)(v0 + 80) = v1;
  return swift_task_switch();
}

uint64_t sub_245843C34(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2[2] = v1;
  v4 = sub_24585A1E8();
  v2[3] = v4;
  v2[4] = *(_QWORD *)(v4 - 8);
  v5 = swift_task_alloc();
  v2[5] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v2[6] = v6;
  *v6 = v2;
  v6[1] = sub_245843CC0;
  return sub_2458433A4(v5, a1);
}

uint64_t sub_245843CC0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245843D28()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0[2] + 136);
  v0[8] = v1;
  v0[9] = *(_QWORD *)(*(_QWORD *)v1 + 496);
  type metadata accessor for SessionManager(0);
  sub_24583661C((unint64_t *)&unk_2574B30C8, 255, type metadata accessor for SessionManager, (uint64_t)&unk_24585BB9C);
  sub_24585A458();
  return swift_task_switch();
}

uint64_t sub_245843DB4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  (*(void (**)(_QWORD))(v0 + 72))(*(_QWORD *)(v0 + 40));
  *(_QWORD *)(v0 + 80) = v1;
  return swift_task_switch();
}

uint64_t sub_245843E14()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t CompanionDeviceManager.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t CompanionDeviceManager.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t CompanionDeviceManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

unint64_t sub_245843EE0()
{
  unint64_t result;

  result = qword_2574B30D8;
  if (!qword_2574B30D8)
  {
    result = MEMORY[0x24953CEC4](&protocol conformance descriptor for CompanionDeviceManager.Options, &type metadata for CompanionDeviceManager.Options);
    atomic_store(result, (unint64_t *)&qword_2574B30D8);
  }
  return result;
}

unint64_t sub_245843F28()
{
  unint64_t result;

  result = qword_2574B30E0;
  if (!qword_2574B30E0)
  {
    result = MEMORY[0x24953CEC4](&protocol conformance descriptor for CompanionDeviceManager.Options, &type metadata for CompanionDeviceManager.Options);
    atomic_store(result, (unint64_t *)&qword_2574B30E0);
  }
  return result;
}

unint64_t sub_245843F70()
{
  unint64_t result;

  result = qword_2574B30E8;
  if (!qword_2574B30E8)
  {
    result = MEMORY[0x24953CEC4](&protocol conformance descriptor for CompanionDeviceManager.Options, &type metadata for CompanionDeviceManager.Options);
    atomic_store(result, (unint64_t *)&qword_2574B30E8);
  }
  return result;
}

unint64_t sub_245843FB8()
{
  unint64_t result;

  result = qword_2574B30F0;
  if (!qword_2574B30F0)
  {
    result = MEMORY[0x24953CEC4](&protocol conformance descriptor for CompanionDeviceManager.Options, &type metadata for CompanionDeviceManager.Options);
    atomic_store(result, (unint64_t *)&qword_2574B30F0);
  }
  return result;
}

uint64_t sub_245843FFC()
{
  uint64_t v0;

  return v0;
}

uint64_t method lookup function for CompanionDeviceManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CompanionDeviceManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of CompanionDeviceManager.devices(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CompanionDeviceManager.pairDevice(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 136) + *(_QWORD *)(*(_QWORD *)v1 + 136));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24583A348;
  return v6(a1);
}

uint64_t dispatch thunk of CompanionDeviceManager.unpairDevice(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 144) + *(_QWORD *)(*(_QWORD *)v1 + 144));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24583B190;
  return v6(a1);
}

uint64_t dispatch thunk of CompanionDeviceManager.startSession(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 168) + *(_QWORD *)(*(_QWORD *)v1 + 168));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24583B190;
  return v6(a1);
}

uint64_t dispatch thunk of CompanionDeviceManager.endSession(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 176) + *(_QWORD *)(*(_QWORD *)v1 + 176));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24583B190;
  return v6(a1);
}

ValueMetadata *type metadata accessor for CompanionDeviceManager.Options()
{
  return &type metadata for CompanionDeviceManager.Options;
}

uint64_t sub_2458441C8()
{
  return sub_2458383AC(&qword_2574B3118, &qword_2574B3120, MEMORY[0x24BEE6D38]);
}

uint64_t initializeBufferWithCopyOfBuffer for CompanionDeviceManager.Change(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CompanionDeviceManager.Change()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for CompanionDeviceManager.Change(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for CompanionDeviceManager.Change(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CompanionDeviceManager.Change(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CompanionDeviceManager.Change(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_245844348(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_245844350(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CompanionDeviceManager.Change()
{
  return &type metadata for CompanionDeviceManager.Change;
}

uint64_t type metadata accessor for CompanionDeviceManager.CompanionDeviceError()
{
  uint64_t result;

  result = qword_2574B46B8;
  if (!qword_2574B46B8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_2458443A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2574B46B0;
  if (!qword_2574B46B0)
  {
    v1 = type metadata accessor for CompanionDeviceManager.CompanionDeviceError();
    result = MEMORY[0x24953CEC4](&unk_24585B6D8, v1);
    atomic_store(result, (unint64_t *)&qword_2574B46B0);
  }
  return result;
}

uint64_t sub_2458443EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CompanionDevice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_245844430(int *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_2458387A4;
  return v4();
}

uint64_t sub_245844488(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2458444D0(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t i;
  int v48;
  uint64_t v49;

  v3 = v2;
  v5 = type metadata accessor for CompanionDevice(0);
  v46 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v49 = (uint64_t)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24585A1E8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3158);
  v48 = a2;
  v12 = sub_24585A704();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_40;
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 64);
  v45 = (_QWORD *)(v11 + 64);
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v43 = v2;
  v44 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 64;
  result = swift_retain();
  v20 = 0;
  v21 = v11;
  for (i = v11; ; v21 = i)
  {
    if (v17)
    {
      v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v24 = v23 | (v20 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v20++, 1))
      goto LABEL_42;
    if (v20 >= v44)
      break;
    v26 = v45;
    v27 = v45[v20];
    if (!v27)
    {
      v28 = v20 + 1;
      if (v20 + 1 >= v44)
      {
LABEL_32:
        swift_release();
        v3 = v43;
        if ((v48 & 1) == 0)
          goto LABEL_40;
        goto LABEL_33;
      }
      v27 = v45[v28];
      if (!v27)
      {
        while (1)
        {
          v20 = v28 + 1;
          if (__OFADD__(v28, 1))
            break;
          if (v20 >= v44)
            goto LABEL_32;
          v27 = v45[v20];
          ++v28;
          if (v27)
            goto LABEL_19;
        }
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      ++v20;
    }
LABEL_19:
    v17 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v20 << 6);
LABEL_20:
    v29 = *(_QWORD *)(v8 + 72);
    v30 = *(_QWORD *)(v21 + 48) + v29 * v24;
    if ((v48 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 32))(v10, v30, v7);
      v31 = *(_QWORD *)(v21 + 56);
      v32 = *(_QWORD *)(v46 + 72);
      sub_2458443EC(v31 + v32 * v24, v49);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, v30, v7);
      v33 = *(_QWORD *)(v21 + 56);
      v32 = *(_QWORD *)(v46 + 72);
      sub_245844E38(v33 + v32 * v24, v49, type metadata accessor for CompanionDevice);
    }
    sub_24583661C(&qword_2574B2D90, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_24585A3C8();
    v34 = -1 << *(_BYTE *)(v13 + 32);
    v35 = result & ~v34;
    v36 = v35 >> 6;
    if (((-1 << v35) & ~*(_QWORD *)(v18 + 8 * (v35 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v18 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v39 = v36 == v38;
        if (v36 == v38)
          v36 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v18 + 8 * v36);
      }
      while (v40 == -1);
      v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(_QWORD *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v13 + 48) + v29 * v22, v10, v7);
    result = sub_2458443EC(v49, *(_QWORD *)(v13 + 56) + v32 * v22);
    ++*(_QWORD *)(v13 + 16);
  }
  swift_release();
  v3 = v43;
  v26 = v45;
  if ((v48 & 1) == 0)
    goto LABEL_40;
LABEL_33:
  v41 = 1 << *(_BYTE *)(i + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(i + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v13;
  return result;
}

void *sub_2458448C8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t i;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int64_t v28;
  char *v29;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for CompanionDevice(0);
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v29 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_24585A1E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3158);
  v8 = *v0;
  v9 = sub_24585A6F8();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
    result = (void *)swift_release();
LABEL_23:
    *v1 = v10;
    return result;
  }
  v26 = v1;
  result = (void *)(v9 + 64);
  v12 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12)
    result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  v27 = v8 + 64;
  v13 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v8 + 16);
  v14 = 1 << *(_BYTE *)(v8 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v8 + 64);
  v28 = (unint64_t)(v14 + 63) >> 6;
  for (i = (uint64_t)v29; ; result = (void *)sub_2458443EC(i, *(_QWORD *)(v10 + 56) + v21))
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_9;
    }
    if (__OFADD__(v13++, 1))
      goto LABEL_25;
    if (v13 >= v28)
    {
LABEL_21:
      result = (void *)swift_release();
      v1 = v26;
      goto LABEL_23;
    }
    v23 = *(_QWORD *)(v27 + 8 * v13);
    if (!v23)
      break;
LABEL_20:
    v16 = (v23 - 1) & v23;
    v19 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_9:
    v20 = *(_QWORD *)(v5 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v8 + 48) + v20, v4);
    v21 = *(_QWORD *)(v30 + 72) * v19;
    sub_245844E38(*(_QWORD *)(v8 + 56) + v21, i, type metadata accessor for CompanionDevice);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v10 + 48) + v20, v7, v4);
  }
  v24 = v13 + 1;
  if (v13 + 1 >= v28)
    goto LABEL_21;
  v23 = *(_QWORD *)(v27 + 8 * v24);
  if (v23)
  {
    ++v13;
    goto LABEL_20;
  }
  while (1)
  {
    v13 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v13 >= v28)
      goto LABEL_21;
    v23 = *(_QWORD *)(v27 + 8 * v13);
    ++v24;
    if (v23)
      goto LABEL_20;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_245844B48(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;

  v8 = type metadata accessor for CompanionDevice(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v29 - v14;
  v17 = a4 + 64;
  v16 = *(_QWORD *)(a4 + 64);
  v32 = -1 << *(_BYTE *)(a4 + 32);
  if (-v32 < 64)
    v18 = ~(-1 << -(char)v32);
  else
    v18 = -1;
  v19 = v18 & v16;
  if (!a2)
  {
    v20 = 0;
    a3 = 0;
LABEL_34:
    v28 = ~v32;
    *a1 = a4;
    a1[1] = v17;
    a1[2] = v28;
    a1[3] = v20;
    a1[4] = v19;
    return a3;
  }
  if (!a3)
  {
    v20 = 0;
    goto LABEL_34;
  }
  if (a3 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v31 = a1;
  v20 = 0;
  v21 = 0;
  v33 = a4 + 64;
  v34 = (unint64_t)(63 - v32) >> 6;
  v30 = v34 - 1;
  if (!v19)
    goto LABEL_9;
LABEL_8:
  v22 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  v23 = v22 | (v20 << 6);
  while (1)
  {
    ++v21;
    v27 = *(_QWORD *)(v9 + 72);
    sub_245844E38(*(_QWORD *)(a4 + 56) + v27 * v23, (uint64_t)v12, type metadata accessor for CompanionDevice);
    sub_2458443EC((uint64_t)v12, (uint64_t)v15);
    result = sub_2458443EC((uint64_t)v15, a2);
    if (v21 == a3)
      goto LABEL_33;
    a2 += v27;
    if (v19)
      goto LABEL_8;
LABEL_9:
    v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    if (v24 >= v34)
    {
      v19 = 0;
      a3 = v21;
LABEL_33:
      a1 = v31;
      v17 = v33;
      goto LABEL_34;
    }
    v17 = v33;
    v25 = *(_QWORD *)(v33 + 8 * v24);
    if (!v25)
      break;
LABEL_18:
    v19 = (v25 - 1) & v25;
    v23 = __clz(__rbit64(v25)) + (v24 << 6);
    v20 = v24;
  }
  v20 += 2;
  if (v24 + 1 >= v34)
  {
    v19 = 0;
    v20 = v24;
LABEL_39:
    a3 = v21;
    a1 = v31;
    goto LABEL_34;
  }
  v25 = *(_QWORD *)(v33 + 8 * v20);
  if (v25)
    goto LABEL_14;
  v26 = v24 + 2;
  if (v24 + 2 >= v34)
    goto LABEL_36;
  v25 = *(_QWORD *)(v33 + 8 * v26);
  if (v25)
    goto LABEL_17;
  v20 = v24 + 3;
  if (v24 + 3 >= v34)
  {
    v19 = 0;
    v20 = v24 + 2;
    goto LABEL_39;
  }
  v25 = *(_QWORD *)(v33 + 8 * v20);
  if (v25)
  {
LABEL_14:
    v24 = v20;
    goto LABEL_18;
  }
  v26 = v24 + 4;
  if (v24 + 4 >= v34)
  {
LABEL_36:
    v19 = 0;
    goto LABEL_39;
  }
  v25 = *(_QWORD *)(v33 + 8 * v26);
  if (v25)
  {
LABEL_17:
    v24 = v26;
    goto LABEL_18;
  }
  while (1)
  {
    v24 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v24 >= v34)
    {
      v19 = 0;
      v20 = v30;
      goto LABEL_39;
    }
    v25 = *(_QWORD *)(v33 + 8 * v24);
    ++v26;
    if (v25)
      goto LABEL_18;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_245844DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CompanionDevice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_245844E38(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_245844E7C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245844EA0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = v2[2];
  v6 = v2[3];
  v7 = v2[4];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_24583B190;
  return sub_245840CD4((uint64_t)v8, a2, v5, v6, v7);
}

uint64_t sub_245844F0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060) - 8) + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = v0 + ((v2 + 40) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_24583B190;
  return sub_245840F00((uint64_t)v5, v6, v3, v4);
}

uint64_t sub_245844F80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060) - 8) + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = v0 + ((v2 + 40) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_24583B190;
  return sub_24584186C((uint64_t)v5, v6, v3, v4);
}

uint64_t objectdestroy_34Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_245845074()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B3060) - 8) + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = v0 + ((v2 + 40) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_24583B190;
  return sub_245841424((uint64_t)v5, v6, v3, v4);
}

uint64_t sub_2458450E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24584512C()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;

  v2 = *(int **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24583B190;
  return ((uint64_t (*)(int *))((char *)&dword_2574B31C8 + dword_2574B31C8))(v2);
}

uint64_t *sub_245845190(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    v6 = sub_24585A1E8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24584523C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_24585A1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_2458452B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_24584533C(a1, (uint64_t (*)(_QWORD))type metadata accessor for CompanionDeviceManager.CompanionDeviceError);
    swift_getEnumCaseMultiPayload();
    v4 = sub_24585A1E8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24584533C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_245845378(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_24585A1E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_2458453EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_24584533C(a1, (uint64_t (*)(_QWORD))type metadata accessor for CompanionDeviceManager.CompanionDeviceError);
    swift_getEnumCaseMultiPayload();
    v4 = sub_24585A1E8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_245845478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_245845484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_245845494()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2458454A4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24585A1E8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_24584552C()
{
  return 1;
}

uint64_t sub_245845534()
{
  sub_24585A824();
  sub_24585A830();
  return sub_24585A854();
}

uint64_t sub_245845574()
{
  return sub_24585A830();
}

uint64_t sub_245845598()
{
  sub_24585A824();
  sub_24585A830();
  return sub_24585A854();
}

uint64_t sub_2458455D4@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
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
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  void (*v55)(char *, char *, uint64_t);
  char *v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  void (*v74)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  char *v79;

  v69 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3290);
  v66 = *(_QWORD *)(v1 - 8);
  v67 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v65 = (char *)&v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3298);
  v70 = *(_QWORD *)(v3 - 8);
  v71 = v3;
  v72 = *(_QWORD *)(v70 + 64);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v68 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v64 = (char *)&v55 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B32A0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B32A8);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = v14;
  v17 = *(_QWORD *)(v15 + 64);
  v18 = MEMORY[0x24BDAC7A8](v14);
  v56 = (char *)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v55 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B32B0);
  v61 = *(_QWORD *)(v21 - 8);
  v62 = v21;
  v63 = *(_QWORD *)(v61 + 64);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v60 = (char *)&v55 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v79 = (char *)&v55 - v24;
  sub_24585A230();
  swift_allocObject();
  v78 = sub_24585A224();
  v58 = *MEMORY[0x24BEE6A10];
  (*(void (**)(char *))(v11 + 104))(v13);
  v77 = v20;
  sub_24585A4AC();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v25 = sub_24585A4A0();
  v74 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
  v75 = v25;
  v74(v9, 1, 1, v25);
  v55 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  v26 = v56;
  v27 = v16;
  v55(v56, v20, v16);
  v28 = *(unsigned __int8 *)(v15 + 80);
  v29 = v15;
  v59 = v15;
  v30 = (v28 + 40) & ~v28;
  v31 = (char *)swift_allocObject();
  *((_QWORD *)v31 + 2) = 0;
  *((_QWORD *)v31 + 3) = 0;
  v32 = v78;
  *((_QWORD *)v31 + 4) = v78;
  v33 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
  v34 = v26;
  v35 = v26;
  v36 = v27;
  v33(&v31[v30], v34, v27);
  swift_retain();
  v37 = (uint64_t)v73;
  v76 = sub_245836718((uint64_t)v73, (uint64_t)&unk_2574B32C0, (uint64_t)v31);
  v74((char *)v37, 1, 1, v75);
  v55(v35, v77, v36);
  v38 = (char *)swift_allocObject();
  *((_QWORD *)v38 + 2) = 0;
  *((_QWORD *)v38 + 3) = 0;
  *((_QWORD *)v38 + 4) = v32;
  v57 = v36;
  v33(&v38[v30], v35, v36);
  swift_retain();
  v39 = sub_245836718(v37, (uint64_t)&unk_2574B32D0, (uint64_t)v38);
  v56 = (char *)v39;
  v40 = swift_allocObject();
  *(_QWORD *)(v40 + 16) = v76;
  *(_QWORD *)(v40 + 24) = v39;
  swift_retain();
  swift_retain();
  sub_24585A4B8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3088);
  v42 = v65;
  v41 = v66;
  v43 = v67;
  (*(void (**)(char *, _QWORD, uint64_t))(v66 + 104))(v65, v58, v67);
  v44 = v64;
  sub_24585A4AC();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v43);
  v74((char *)v37, 1, 1, v75);
  v45 = v60;
  v46 = v61;
  v47 = v62;
  (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v60, v79, v62);
  v48 = v70;
  v49 = v71;
  v50 = v68;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v68, v44, v71);
  v51 = (*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  v52 = (v63 + *(unsigned __int8 *)(v48 + 80) + v51) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
  v53 = swift_allocObject();
  *(_QWORD *)(v53 + 16) = 0;
  *(_QWORD *)(v53 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v46 + 32))(v53 + v51, v45, v47);
  (*(void (**)(unint64_t, char *, uint64_t))(v48 + 32))(v53 + v52, v50, v49);
  sub_245836718((uint64_t)v73, (uint64_t)&unk_2574B32E0, v53);
  sub_24585A4B8();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v44, v49);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v77, v57);
  return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v79, v47);
}

uint64_t sub_245845BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5[4] = a4;
  v5[5] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3398);
  v5[6] = v6;
  v5[7] = *(_QWORD *)(v6 - 8);
  v5[8] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33B0);
  v5[9] = v7;
  v5[10] = *(_QWORD *)(v7 - 8);
  v5[11] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33B8);
  v5[12] = v8;
  v5[13] = *(_QWORD *)(v8 - 8);
  v5[14] = swift_task_alloc();
  v9 = sub_24585A344();
  v5[15] = v9;
  v5[16] = *(_QWORD *)(v9 - 8);
  v5[17] = swift_task_alloc();
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245845CA4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  _QWORD *v16;

  v1 = v0[19];
  v2 = v0[15];
  v3 = v0[16];
  v4 = sub_24584B2A4();
  v0[20] = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[21] = v5;
  v5(v1, v4, v2);
  v6 = sub_24585A32C();
  v7 = sub_24585A578();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_245833000, v6, v7, "Will wait for enabled state updates", v8, 2u);
    MEMORY[0x24953CF60](v8, -1, -1);
  }
  v9 = v0[19];
  v10 = v0[15];
  v11 = v0[16];
  v12 = v0[10];
  v13 = v0[11];
  v14 = v0[9];

  v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[22] = v15;
  v15(v9, v10);
  sub_24585A200();
  sub_24585A4D0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
  v16 = (_QWORD *)swift_task_alloc();
  v0[23] = v16;
  *v16 = v0;
  v16[1] = sub_245845E14;
  return sub_24585A4DC();
}

uint64_t sub_245845E14()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245845E68()
{
  uint64_t v0;
  int v1;
  uint64_t v3;
  void (*v4)(_QWORD, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  const char *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  v1 = *(unsigned __int8 *)(v0 + 25);
  if (v1 == 2)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v3 = *(_QWORD *)(v0 + 160);
  v4 = *(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 168);
  v5 = *(_QWORD *)(v0 + 120);
  v18 = v1 & 1;
  if ((v1 & 1) == 0)
  {
    v6 = (uint64_t *)(v0 + 136);
    v4(*(_QWORD *)(v0 + 136), v3, v5);
    v7 = sub_24585A32C();
    v8 = sub_24585A578();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      v10 = "Replicator is disabled";
      goto LABEL_8;
    }
LABEL_9:
    v11 = *v6;
    goto LABEL_10;
  }
  v6 = (uint64_t *)(v0 + 144);
  v4(*(_QWORD *)(v0 + 144), v3, v5);
  v7 = sub_24585A32C();
  v8 = sub_24585A578();
  if (!os_log_type_enabled(v7, v8))
    goto LABEL_9;
  v9 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v9 = 0;
  v10 = "Replicator is enabled";
LABEL_8:
  _os_log_impl(&dword_245833000, v7, v8, v10, v9, 2u);
  v11 = *v6;
  MEMORY[0x24953CF60](v9, -1, -1);
LABEL_10:
  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
  v13 = *(_QWORD *)(v0 + 120);
  v15 = *(_QWORD *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 64);
  v16 = *(_QWORD *)(v0 + 48);

  v12(v11, v13);
  *(_QWORD *)(v0 + 16) = v18;
  *(_BYTE *)(v0 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B32A8);
  sub_24585A4C4();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v17;
  *v17 = v0;
  v17[1] = sub_245845E14;
  return sub_24585A4DC();
}

uint64_t sub_2458460B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B32A8) - 8) + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = v0 + ((v2 + 40) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_24583B190;
  return sub_245845BA4((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_245846128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5[5] = a4;
  v5[6] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3398);
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33A0);
  v5[10] = v7;
  v5[11] = *(_QWORD *)(v7 - 8);
  v5[12] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33A8);
  v5[13] = v8;
  v5[14] = *(_QWORD *)(v8 - 8);
  v5[15] = swift_task_alloc();
  v9 = sub_24585A344();
  v5[16] = v9;
  v5[17] = *(_QWORD *)(v9 - 8);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24584621C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  _QWORD *v16;

  v1 = v0[19];
  v2 = v0[16];
  v3 = v0[17];
  v4 = sub_24584B2A4();
  v0[20] = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[21] = v5;
  v5(v1, v4, v2);
  v6 = sub_24585A32C();
  v7 = sub_24585A578();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_245833000, v6, v7, "Will wait for device updates", v8, 2u);
    MEMORY[0x24953CF60](v8, -1, -1);
  }
  v9 = v0[19];
  v10 = v0[16];
  v11 = v0[17];
  v12 = v0[11];
  v13 = v0[12];
  v14 = v0[10];

  v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[22] = v15;
  v15(v9, v10);
  sub_24585A1F4();
  sub_24585A4D0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
  v16 = (_QWORD *)swift_task_alloc();
  v0[23] = v16;
  *v16 = v0;
  v16[1] = sub_24584638C;
  return sub_24585A4DC();
}

uint64_t sub_24584638C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2458463E0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  BOOL v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 32);
  if (v1)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 168))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 128));
    swift_bridgeObjectRetain_n();
    v2 = sub_24585A32C();
    v3 = sub_24585A578();
    v4 = os_log_type_enabled(v2, v3);
    v5 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
    v6 = *(_QWORD *)(v0 + 144);
    v7 = *(_QWORD *)(v0 + 128);
    if (v4)
    {
      v21 = *(_QWORD *)(v0 + 144);
      v8 = swift_slowAlloc();
      v9 = swift_slowAlloc();
      v22 = v9;
      *(_DWORD *)v8 = 136446210;
      v10 = sub_24585A2FC();
      v11 = swift_bridgeObjectRetain();
      v12 = MEMORY[0x24953C750](v11, v10);
      v20 = v5;
      v14 = v13;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v8 + 4) = sub_2458387F8(v12, v14, &v22);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245833000, v2, v3, "Got devices: %{public}s", (uint8_t *)v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24953CF60](v9, -1, -1);
      MEMORY[0x24953CF60](v8, -1, -1);

      v20(v21, v7);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v5(v6, v7);
    }
    v17 = *(_QWORD *)(v0 + 64);
    v16 = *(_QWORD *)(v0 + 72);
    v18 = *(_QWORD *)(v0 + 56);
    *(_QWORD *)(v0 + 16) = v1;
    *(_BYTE *)(v0 + 24) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B32A8);
    sub_24585A4C4();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v19;
    *v19 = v0;
    v19[1] = sub_24584638C;
    return sub_24585A4DC();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B32A8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_245846700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B32A8) - 8) + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = v0 + ((v2 + 40) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_24583B190;
  return sub_245846128((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t sub_245846770()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_24585A344();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_24584B2A4();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_24585A32C();
  v6 = sub_24585A578();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_245833000, v5, v6, "Change accumulator terminated", v7, 2u);
    MEMORY[0x24953CF60](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_24585A4E8();
  return sub_24585A4E8();
}

uint64_t sub_2458468BC()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2458468E8()
{
  return sub_245846770();
}

uint64_t sub_2458468F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[9] = a4;
  v5[10] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3378);
  v5[11] = v6;
  v5[12] = *(_QWORD *)(v6 - 8);
  v5[13] = swift_task_alloc();
  v7 = sub_24585A2FC();
  v5[14] = v7;
  v5[15] = *(_QWORD *)(v7 - 8);
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  v8 = type metadata accessor for CompanionDevice(0);
  v5[18] = v8;
  v5[19] = *(_QWORD *)(v8 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  v5[22] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3380);
  v5[23] = v9;
  v5[24] = *(_QWORD *)(v9 - 8);
  v5[25] = swift_task_alloc();
  v10 = sub_24585A344();
  v5[26] = v10;
  v5[27] = *(_QWORD *)(v10 - 8);
  v5[28] = swift_task_alloc();
  v5[29] = swift_task_alloc();
  v5[30] = swift_task_alloc();
  v5[31] = swift_task_alloc();
  v5[32] = swift_task_alloc();
  v5[33] = swift_task_alloc();
  v5[34] = swift_task_alloc();
  v5[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245846A7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  _QWORD *v13;

  v1 = *(_QWORD *)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 216);
  v4 = sub_24584B2A4();
  *(_QWORD *)(v0 + 288) = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 296) = v5;
  v5(v1, v4, v2);
  v6 = sub_24585A32C();
  v7 = sub_24585A578();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_245833000, v6, v7, "Will wait for changes", v8, 2u);
    MEMORY[0x24953CF60](v8, -1, -1);
  }
  v9 = *(_QWORD *)(v0 + 280);
  v10 = *(_QWORD *)(v0 + 208);
  v11 = *(_QWORD *)(v0 + 216);

  v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  *(_QWORD *)(v0 + 304) = v12;
  v12(v9, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B32B0);
  sub_24585A4D0();
  *(_BYTE *)(v0 + 25) = 2;
  *(_QWORD *)(v0 + 312) = 0;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 320) = v13;
  *v13 = v0;
  v13[1] = sub_245846BD0;
  return sub_24585A4DC();
}

uint64_t sub_245846BD0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245846C24()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  unsigned __int8 v14;
  _QWORD *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(unint64_t, unint64_t, uint64_t);
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  _BOOL4 v55;
  void (*v56)(uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  void (*v78)(uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  os_log_type_t v85;
  uint8_t *v86;
  void (*v87)(uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  unsigned __int8 v96;
  void (*v97)(uint64_t, uint64_t);
  uint64_t v98;
  uint64_t v99;
  void (*v100)(uint64_t, uint64_t);
  uint64_t v101;
  char v102;
  char v103;
  uint64_t v104;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(unsigned __int8 *)(v0 + 24);
  if (v2 == 255)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 296))(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 208));
  sub_24584A97C(v1, v2 & 1);
  sub_24584A97C(v1, v2 & 1);
  v3 = sub_24585A32C();
  v4 = sub_24585A578();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
  v7 = *(_QWORD *)(v0 + 272);
  v8 = *(_QWORD *)(v0 + 208);
  if (!v5)
  {
    sub_24584B128(v1, v2);
    sub_24584B128(v1, v2);

    v6(v7, v8);
    if ((v2 & 1) == 0)
      goto LABEL_4;
LABEL_10:
    v96 = v2;
    v20 = *(_QWORD *)(v1 + 16);
    v21 = MEMORY[0x24BEE4AF8];
    v98 = v1;
    if (v20)
    {
      v22 = (uint64_t *)(v0 + 48);
      v23 = *(_QWORD *)(v0 + 120);
      *(_QWORD *)(v0 + 48) = MEMORY[0x24BEE4AF8];
      sub_24584AB58(0, v20, 0);
      v24 = v1 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
      v101 = *(_QWORD *)(v23 + 72);
      v25 = *(void (**)(unint64_t, unint64_t, uint64_t))(v23 + 16);
      do
      {
        v26 = *(_QWORD *)(v0 + 176);
        v28 = *(_QWORD *)(v0 + 128);
        v27 = *(_QWORD *)(v0 + 136);
        v29 = *(_QWORD *)(v0 + 112);
        v30 = *(_QWORD *)(v0 + 120);
        v25(v27, v24, v29);
        v25(v28, v27, v29);
        sub_245847880(v28, v26);
        (*(void (**)(unint64_t, uint64_t))(v30 + 8))(v27, v29);
        v21 = *(_QWORD *)(v0 + 48);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24584AB58(0, *(_QWORD *)(v21 + 16) + 1, 1);
          v21 = *v22;
        }
        v32 = *(_QWORD *)(v21 + 16);
        v31 = *(_QWORD *)(v21 + 24);
        if (v32 >= v31 >> 1)
        {
          sub_24584AB58(v31 > 1, v32 + 1, 1);
          v21 = *v22;
        }
        v33 = *(_QWORD *)(v0 + 176);
        v34 = *(_QWORD *)(v0 + 152);
        *(_QWORD *)(v21 + 16) = v32 + 1;
        sub_2458443EC(v33, v21+ ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))+ *(_QWORD *)(v34 + 72) * v32);
        v24 += v101;
        --v20;
      }
      while (v20);
    }
    v35 = *(_QWORD *)(v0 + 312);
    v36 = v98;
    v37 = v96;
    if (v35)
    {
      v38 = *(_QWORD *)(v21 + 16);
      if (v38 == *(_QWORD *)(v35 + 16))
      {
        if (!v38 || v21 == v35)
        {
LABEL_25:
          v45 = *(_QWORD *)(v0 + 288);
          v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
          v15 = (_QWORD *)(v0 + 256);
          v47 = *(_QWORD *)(v0 + 256);
          v48 = *(_QWORD *)(v0 + 208);
          swift_bridgeObjectRelease();
          v46(v47, v45, v48);
          v49 = sub_24585A32C();
          v50 = sub_24585A578();
          if (os_log_type_enabled(v49, v50))
          {
            v51 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v51 = 0;
            _os_log_impl(&dword_245833000, v49, v50, "ignoring no-op devices change", v51, 2u);
            MEMORY[0x24953CF60](v51, -1, -1);
          }

          sub_24584B128(v98, v96);
          goto LABEL_38;
        }
        v39 = *(_QWORD *)(v0 + 152);
        v40 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
        v41 = *(_QWORD *)(v39 + 72);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        while (1)
        {
          v43 = *(_QWORD *)(v0 + 160);
          v42 = *(_QWORD *)(v0 + 168);
          sub_24584AAD8(v21 + v40, v42);
          sub_24584AAD8(v35 + v40, v43);
          sub_24583661C(&qword_2574B2EA8, 255, type metadata accessor for CompanionDevice, (uint64_t)&protocol conformance descriptor for CompanionDevice);
          v44 = sub_24585A3E0();
          sub_24584AB1C(v43);
          sub_24584AB1C(v42);
          if ((v44 & 1) == 0)
            break;
          v40 += v41;
          if (!--v38)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_25;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v36 = v98;
        v37 = v96;
      }
      swift_bridgeObjectRelease();
    }
    sub_24584B128(v36, v37);
    LODWORD(v52) = *(unsigned __int8 *)(v0 + 25);
    if ((_DWORD)v52 == 2)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 296))(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 208));
      v75 = sub_24585A32C();
      v76 = sub_24585A578();
      if (os_log_type_enabled(v75, v76))
      {
        v77 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v77 = 0;
        _os_log_impl(&dword_245833000, v75, v76, "Waiting for enablement", v77, 2u);
        MEMORY[0x24953CF60](v77, -1, -1);
      }
      v78 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
      v79 = *(_QWORD *)(v0 + 240);
      v80 = *(_QWORD *)(v0 + 208);

      v78(v79, v80);
      LOBYTE(v52) = 2;
      goto LABEL_49;
    }
    swift_bridgeObjectRetain();
    if ((v52 & 1) != 0)
    {
LABEL_30:
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 296))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 208));
      swift_bridgeObjectRetain_n();
      v53 = sub_24585A32C();
      v54 = sub_24585A578();
      v55 = os_log_type_enabled(v53, v54);
      v56 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
      v57 = *(_QWORD *)(v0 + 232);
      v58 = *(_QWORD *)(v0 + 208);
      if (v55)
      {
        v99 = *(_QWORD *)(v0 + 232);
        v59 = *(_QWORD *)(v0 + 144);
        v102 = v52;
        v52 = swift_slowAlloc();
        v97 = v56;
        v60 = swift_slowAlloc();
        v104 = v60;
        *(_DWORD *)v52 = 136315138;
        v61 = swift_bridgeObjectRetain();
        v62 = MEMORY[0x24953C750](v61, v59);
        v64 = v63;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v52 + 4) = sub_2458387F8(v62, v64, &v104);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_245833000, v53, v54, "Returning devices: %s", (uint8_t *)v52, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24953CF60](v60, -1, -1);
        v65 = v52;
        LOBYTE(v52) = v102;
        MEMORY[0x24953CF60](v65, -1, -1);

        v97(v99, v58);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v56(v57, v58);
      }
      v73 = *(_QWORD *)(v0 + 96);
      v72 = *(_QWORD *)(v0 + 104);
      v74 = *(_QWORD *)(v0 + 88);
      *(_QWORD *)(v0 + 64) = v21;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3298);
      sub_24585A4C4();
      (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v72, v74);
LABEL_49:
      *(_BYTE *)(v0 + 25) = v52;
      *(_QWORD *)(v0 + 312) = v21;
      goto LABEL_50;
    }
LABEL_46:
    v103 = v52;
    v81 = *(_QWORD *)(v0 + 288);
    v82 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
    v83 = *(_QWORD *)(v0 + 224);
    v84 = *(_QWORD *)(v0 + 208);
    swift_bridgeObjectRelease();
    v82(v83, v81, v84);
    v52 = sub_24585A32C();
    v85 = sub_24585A578();
    if (os_log_type_enabled((os_log_t)v52, v85))
    {
      v86 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v86 = 0;
      _os_log_impl(&dword_245833000, (os_log_t)v52, v85, "Disabled", v86, 2u);
      MEMORY[0x24953CF60](v86, -1, -1);
    }
    v87 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
    v88 = *(_QWORD *)(v0 + 224);
    v89 = *(_QWORD *)(v0 + 208);
    v90 = *(_QWORD *)(v0 + 96);
    v91 = *(_QWORD *)(v0 + 104);
    v92 = *(_QWORD *)(v0 + 88);

    v87(v88, v89);
    *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE4AF8];
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3298);
    sub_24585A4C4();
    (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v91, v92);
    LOBYTE(v52) = v103;
    goto LABEL_49;
  }
  v100 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
  v95 = *(_QWORD *)(v0 + 272);
  v9 = swift_slowAlloc();
  v94 = v8;
  v10 = swift_slowAlloc();
  v104 = v10;
  *(_DWORD *)v9 = 136446210;
  *(_QWORD *)(v0 + 32) = v1;
  *(_BYTE *)(v0 + 40) = v2 & 1;
  sub_24584A97C(v1, v2 & 1);
  v11 = sub_24585A41C();
  *(_QWORD *)(v9 + 4) = sub_2458387F8(v11, v12, &v104);
  swift_bridgeObjectRelease();
  sub_24584B128(v1, v2);
  sub_24584B128(v1, v2);
  _os_log_impl(&dword_245833000, v3, v4, "Got change: %{public}s", (uint8_t *)v9, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x24953CF60](v10, -1, -1);
  MEMORY[0x24953CF60](v9, -1, -1);

  v100(v95, v94);
  if ((v2 & 1) != 0)
    goto LABEL_10;
LABEL_4:
  v13 = *(unsigned __int8 *)(v0 + 25);
  if (v13 == 2 || ((v1 ^ ((v13 & 1) == 0)) & 1) == 0)
  {
    LOBYTE(v52) = v1 & 1;
    v21 = *(_QWORD *)(v0 + 312);
    if (!v21)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 296))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 208));
      v66 = sub_24585A32C();
      v67 = sub_24585A578();
      if (os_log_type_enabled(v66, v67))
      {
        v68 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v68 = 0;
        _os_log_impl(&dword_245833000, v66, v67, "Waiting for devices", v68, 2u);
        MEMORY[0x24953CF60](v68, -1, -1);
      }
      v69 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
      v70 = *(_QWORD *)(v0 + 248);
      v71 = *(_QWORD *)(v0 + 208);

      v69(v70, v71);
      v21 = 0;
      goto LABEL_49;
    }
    swift_bridgeObjectRetain();
    if ((v1 & 1) != 0)
      goto LABEL_30;
    goto LABEL_46;
  }
  v14 = v2;
  v15 = (_QWORD *)(v0 + 264);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 296))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 208));
  v16 = sub_24585A32C();
  v17 = sub_24585A578();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_245833000, v16, v17, "ignoring no-op enablement change", v18, 2u);
    MEMORY[0x24953CF60](v18, -1, -1);

    sub_24584B128(v1, v14);
  }
  else
  {

  }
LABEL_38:
  (*(void (**)(_QWORD, _QWORD))(v0 + 304))(*v15, *(_QWORD *)(v0 + 208));
LABEL_50:
  v93 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 320) = v93;
  *v93 = v0;
  v93[1] = sub_245846BD0;
  return sub_24585A4DC();
}

uint64_t sub_245847720()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B32B0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3298);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_2458477E4()
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
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B32B0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B3298) - 8) + 80);
  v6 = v3 + v4 + v5;
  v7 = v0 + v3;
  v8 = v0 + (v6 & ~v5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_24583B190;
  return sub_2458468F0((uint64_t)v9, v10, v11, v7, v8);
}

uint64_t sub_245847880@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  char *v15;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  char v44;
  __int128 v45;
  __int128 v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  char v54;
  BOOL v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  unint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  char v78;
  __int128 v79;
  __int128 v80;
  char v81;
  BOOL v82;
  char v83[9];

  v74 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
  MEMORY[0x24BDAC7A8](v3);
  v73 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3388);
  MEMORY[0x24BDAC7A8](v5);
  v71 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24585A284();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v61 - v12;
  *(_QWORD *)&v64 = sub_24585A248();
  *(_QWORD *)&v63 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = sub_24585A1E8();
  v61 = *(_QWORD *)(v62 - 8);
  v16 = MEMORY[0x24BDAC7A8](v62);
  v72 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v76 = (uint64_t)&v61 - v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3390);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E60);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v75 = (uint64_t)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v61 - v25;
  sub_24585A254();
  if (v27)
  {
    v28 = sub_24585A308();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v21, 1, 1, v28);
    sub_24585A314();
  }
  else
  {
    v29 = sub_24585A320();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v26, 1, 1, v29);
  }
  sub_24585A26C();
  v30 = (uint64_t)v72;
  sub_24585A29C();
  v31 = sub_24585A2A8();
  v69 = v32;
  v70 = v31;
  sub_24584B140((uint64_t)v26, v75);
  v33 = sub_24585A260();
  v67 = v34;
  v68 = v33;
  v66 = sub_24585A2F0();
  sub_24585A278();
  v65 = sub_24585A23C();
  (*(void (**)(char *, _QWORD))(v63 + 8))(v15, v64);
  sub_24585A290();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v35 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v11, v7);
  v36 = (uint64_t)v71;
  if (v35 == *MEMORY[0x24BE80038])
  {
    v37 = (uint64_t)v26;
    (*(void (**)(char *, uint64_t))(v8 + 96))(v11, v7);
    v38 = 2;
    v39 = v62;
    v40 = v61;
LABEL_6:
    (*(void (**)(char *, uint64_t))(v40 + 8))(v11, v39);
    goto LABEL_14;
  }
  if (v35 == *MEMORY[0x24BE80008])
  {
    v37 = (uint64_t)v26;
    v38 = 0;
  }
  else if (v35 == *MEMORY[0x24BE80028])
  {
    v37 = (uint64_t)v26;
    v38 = 1;
  }
  else
  {
    v37 = (uint64_t)v26;
    if (v35 == *MEMORY[0x24BE80020])
    {
      v38 = 2;
    }
    else
    {
      v38 = 3;
      v40 = v8;
      v39 = v7;
      if (v35 != *MEMORY[0x24BE80030])
        goto LABEL_6;
    }
  }
LABEL_14:
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  v83[0] = v38;
  sub_24585A2E4();
  v41 = sub_24585A2D8();
  v42 = *(_QWORD *)(v41 - 8);
  v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v36, 1, v41);
  if (v43 == 1)
  {
    sub_24583AE20(v36, &qword_2574B3388);
    v44 = 0;
    v45 = 0uLL;
    v46 = 0uLL;
  }
  else
  {
    sub_24585A2C0();
    v48 = v47;
    v50 = v49;
    sub_24585A2CC();
    v52 = v51;
    v53 = sub_24585A2B4();
    sub_24583B50C(v53, v54 & 1, (uint64_t)&v79, v48, v50, v52);
    v64 = v79;
    v63 = v80;
    v44 = v81;
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v36, v41);
    v46 = v63;
    v45 = v64;
  }
  v55 = v43 == 1;
  v79 = v45;
  v80 = v46;
  v56 = v65 > 8;
  v81 = v44;
  v82 = v55;
  v78 = 3;
  v77 = 2;
  v57 = type metadata accessor for CompanionDevice.SessionInfo(0);
  v58 = (uint64_t)v73;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v73, 1, 1, v57);
  sub_24583BE6C(v76, v30, v70, v69, v75, v68, v67, v66 & 1, v74, 1, v56, v83, &v79, &v78, &v77, v58);
  v59 = sub_24585A2FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 8))(a1, v59);
  return sub_24583AE20(v37, &qword_2574B2E60);
}

uint64_t sub_245847E7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_24585A344();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_24584B2A4();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_24585A32C();
  v6 = sub_24585A578();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_245833000, v5, v6, "Combined stream terminated", v7, 2u);
    MEMORY[0x24953CF60](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_24585A4E8();
}

uint64_t sub_245847FA4()
{
  return sub_245847E7C();
}

uint64_t sub_245847FAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_245847FC4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = v2[2];
  v3 = v2[3];
  sub_24583661C((unint64_t *)&unk_2574B32F0, a2, (uint64_t (*)(uint64_t))type metadata accessor for ReplicatorController, (uint64_t)&unk_24585B7E4);
  v5 = swift_task_alloc();
  v2[4] = v5;
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = (_QWORD *)swift_task_alloc();
  v2[5] = v6;
  *v6 = v2;
  v6[1] = sub_245848084;
  return sub_24585A7D0();
}

uint64_t sub_245848084()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2458480F4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for ReplicatorController()
{
  return objc_opt_self();
}

uint64_t sub_245848148(uint64_t a1, uint64_t a2, uint64_t a3)
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
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
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

  v46 = a3;
  v42 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8);
  v44 = *(_QWORD *)(v4 - 8);
  v45 = v4;
  v5 = *(_QWORD *)(v44 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v43 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24585A1E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v40 = v9;
  v41 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v36 - v10;
  v12 = sub_24585A344();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_24584B2A4();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  v48 = v7;
  v17 = a2;
  v39 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v39(v11, a2, v6);
  v18 = sub_24585A32C();
  v19 = sub_24585A578();
  v20 = os_log_type_enabled(v18, v19);
  v47 = a2;
  if (v20)
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    v50 = v37;
    v38 = v12;
    *(_DWORD *)v21 = 136315138;
    v36[1] = v21 + 4;
    sub_24583661C(&qword_2574B3310, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v22 = sub_24585A794();
    v49 = sub_2458387F8(v22, v23, &v50);
    sub_24585A614();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v11, v6);
    _os_log_impl(&dword_245833000, v18, v19, "Will pair device with ID %s", v21, 0xCu);
    v24 = v37;
    swift_arrayDestroy();
    MEMORY[0x24953CF60](v24, -1, -1);
    v25 = v21;
    v17 = v47;
    MEMORY[0x24953CF60](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v38);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v11, v6);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  sub_24585A230();
  swift_allocObject();
  v38 = sub_24585A224();
  v26 = v41;
  v39(v41, v17, v6);
  v28 = v43;
  v27 = v44;
  v29 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v43, v42, v45);
  v30 = v6;
  v31 = v48;
  v32 = (*(unsigned __int8 *)(v48 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80);
  v33 = (v40 + *(unsigned __int8 *)(v27 + 80) + v32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  v34 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v31 + 32))(v34 + v32, v26, v30);
  (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(v34 + v33, v28, v29);
  *(_QWORD *)(v34 + ((v5 + v33 + 7) & 0xFFFFFFFFFFFFFFF8)) = v46;
  swift_retain();
  sub_24585A20C();
  swift_release();
  return swift_release();
}

uint64_t sub_245848524(uint64_t a1)
{
  uint64_t v1;

  return sub_245848148(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_24584852C(void *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, _QWORD *, uint64_t);
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v46 = a4;
  v47 = a2;
  v48 = a3;
  v5 = sub_24585A344();
  v50 = *(_QWORD *)(v5 - 8);
  v51 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v49 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24585A1E8();
  v52 = *(_QWORD *)(v11 - 8);
  v12 = *(_QWORD *)(v52 + 64);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v45 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v46 = v7;
    v20 = a1;
    v21 = sub_24584B2A4();
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v49, v21, v51);
    v22 = v11;
    (*(void (**)(char *, _QWORD *, uint64_t))(v52 + 16))(v14, v47, v11);
    v23 = a1;
    v24 = a1;
    v25 = sub_24585A32C();
    v26 = sub_24585A56C();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v47 = (_QWORD *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v54 = v28;
      *(_DWORD *)v27 = 136315394;
      sub_24583661C(&qword_2574B3310, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v29 = sub_24585A794();
      v53 = sub_2458387F8(v29, v30, &v54);
      sub_24585A614();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v22);
      *(_WORD *)(v27 + 12) = 2112;
      v31 = a1;
      v32 = _swift_stdlib_bridgeErrorToNSError();
      v53 = v32;
      sub_24585A614();
      v33 = v47;
      *v47 = v32;

      _os_log_impl(&dword_245833000, v25, v26, "Pairing device %s failed: %@", (uint8_t *)v27, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D78);
      swift_arrayDestroy();
      MEMORY[0x24953CF60](v33, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24953CF60](v28, -1, -1);
      MEMORY[0x24953CF60](v27, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v52 + 8))(v14, v11);

    }
    (*(void (**)(char *, uint64_t))(v50 + 8))(v49, v51);
    v54 = (uint64_t)a1;
    return sub_24585A464();
  }
  else
  {
    v34 = sub_24585A4A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v19, 1, 1, v34);
    v35 = v52;
    v36 = *(void (**)(char *, _QWORD *, uint64_t))(v52 + 16);
    v45 = v11;
    v36(v16, v47, v11);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v48, v7);
    v51 = sub_24583661C((unint64_t *)&unk_2574B32F0, v37, (uint64_t (*)(uint64_t))type metadata accessor for ReplicatorController, (uint64_t)&unk_24585B7E4);
    v38 = (*(unsigned __int8 *)(v35 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
    v39 = (v12 + *(unsigned __int8 *)(v8 + 80) + v38) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v40 = (char *)swift_allocObject();
    v41 = v45;
    v42 = v46;
    v43 = v51;
    *((_QWORD *)v40 + 2) = v46;
    *((_QWORD *)v40 + 3) = v43;
    *((_QWORD *)v40 + 4) = v42;
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(&v40[v38], v16, v41);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v40[v39], v10, v7);
    swift_retain_n();
    sub_245836718((uint64_t)v19, (uint64_t)&unk_2574B3358, (uint64_t)v40);
    return swift_release();
  }
}

uint64_t sub_2458489E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3300);
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v8 = sub_24585A1E8();
  v6[11] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v6[12] = v9;
  v6[13] = *(_QWORD *)(v9 + 64);
  v6[14] = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B31D8);
  v6[15] = v10;
  v6[16] = *(_QWORD *)(v10 - 8);
  v6[17] = swift_task_alloc();
  v6[18] = swift_task_alloc();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3308);
  v6[19] = v11;
  v6[20] = *(_QWORD *)(v11 - 8);
  v6[21] = swift_task_alloc();
  v6[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245848AF8()
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
  uint64_t v9;
  uint64_t v11;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 120);
  v11 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 96);
  v7 = *(_QWORD *)(v0 + 48);
  (*(void (**)(void))(**(_QWORD **)(v0 + 40) + 88))();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 32))(v9 + v8, v4, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v2, v1, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3088);
  sub_2458383AC(&qword_2574B31E8, &qword_2574B31D8, MEMORY[0x24BEE6AA8]);
  sub_24585A6D4();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_245848C3C()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[20] + 16))(v0[21], v0[22], v0[19]);
  sub_2458383AC(&qword_2574B3330, &qword_2574B3308, MEMORY[0x24BEE6F08]);
  sub_24585A4F4();
  v0[23] = sub_2458383AC(&qword_2574B3338, &qword_2574B3300, MEMORY[0x24BEE6EE0]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[24] = v1;
  *v1 = v0;
  v1[1] = sub_245848D10;
  return sub_24585A47C();
}

uint64_t sub_245848D10()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v2[9] + 8))(v2[10], v2[8]);
  else
    return swift_task_switch();
}

uint64_t sub_245848D80()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD *);

  v1 = v0[2];
  v0[25] = v1;
  if (v1)
  {
    v0[4] = v1;
    v4 = (uint64_t (*)(_QWORD *))((char *)&dword_2574B3370 + dword_2574B3370);
    v2 = (_QWORD *)swift_task_alloc();
    v0[26] = v2;
    *v2 = v0;
    v2[1] = sub_245848E28;
    return v4(v0 + 4);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0[9] + 8))(v0[10], v0[8]);
    return swift_task_switch();
  }
}

uint64_t sub_245848E28(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    v6 = *(_QWORD *)(v4 + 72);
    v5 = *(_QWORD *)(v4 + 80);
    v7 = *(_QWORD *)(v4 + 64);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  else
  {
    *(_BYTE *)(v4 + 232) = a1 & 1;
  }
  return swift_task_switch();
}

uint64_t sub_245848EBC()
{
  uint64_t v0;
  _QWORD *v2;

  if ((*(_BYTE *)(v0 + 232) & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
    *(_QWORD *)(v0 + 224) = *(_QWORD *)(v0 + 32);
    return swift_task_switch();
  }
  else
  {
    swift_bridgeObjectRelease();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v2;
    *v2 = v0;
    v2[1] = sub_245848F68;
    return sub_24585A47C();
  }
}

uint64_t sub_245848F68()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v2[9] + 8))(v2[10], v2[8]);
  else
    return swift_task_switch();
}

uint64_t sub_245848FD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8);
  sub_24585A470();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245849084()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  sub_24584A7BC();
  *(_QWORD *)(v0 + 24) = swift_allocError();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8);
  sub_24585A464();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245849150(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = *a2;
  return swift_task_switch();
}

uint64_t sub_245849170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(uint64_t **)(v0 + 16);
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v2;
  swift_bridgeObjectRetain();
  v5 = sub_2458491F0((uint64_t (*)(char *))sub_24584B0FC, v4, v1);
  swift_task_dealloc();
  *v3 = v5;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2458491F0(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v7 = type metadata accessor for CompanionDevice(0);
  v24 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v20 - v11;
  v13 = MEMORY[0x24BEE4AF8];
  v25 = MEMORY[0x24BEE4AF8];
  v22 = *(_QWORD *)(a3 + 16);
  if (v22)
  {
    v14 = 0;
    v15 = MEMORY[0x24BEE4AF8];
    v20[1] = a2;
    v21 = a3;
    v20[0] = a1;
    while (v14 < *(_QWORD *)(a3 + 16))
    {
      v16 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      v13 = *(_QWORD *)(v24 + 72);
      sub_24584AAD8(a3 + v16 + v13 * v14, (uint64_t)v12);
      v17 = a1(v12);
      if (v3)
      {
        sub_24584AB1C((uint64_t)v12);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if ((v17 & 1) != 0)
      {
        sub_2458443EC((uint64_t)v12, v23);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_24584AB58(0, *(_QWORD *)(v15 + 16) + 1, 1);
        v15 = v25;
        v19 = *(_QWORD *)(v25 + 16);
        v18 = *(_QWORD *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_24584AB58(v18 > 1, v19 + 1, 1);
          v15 = v25;
        }
        *(_QWORD *)(v15 + 16) = v19 + 1;
        result = sub_2458443EC(v23, v15 + v16 + v19 * v13);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        result = sub_24584AB1C((uint64_t)v12);
      }
      if (v22 == ++v14)
      {
        v13 = v25;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_2458493E0(_QWORD *a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *a1;
  return swift_task_switch();
}

uint64_t sub_2458493FC()
{
  uint64_t v0;

  return (*(uint64_t (**)(BOOL))(v0 + 8))(*(_QWORD *)(*(_QWORD *)(v0 + 16) + 16) != 0);
}

uint64_t sub_245849414(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[7] = a1;
  v2[8] = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3300);
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B31D8);
  v2[12] = v4;
  v2[13] = *(_QWORD *)(v4 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3308);
  v2[16] = v5;
  v2[17] = *(_QWORD *)(v5 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v6 = sub_24585A1E8();
  v2[20] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[21] = v7;
  v2[22] = *(_QWORD *)(v7 + 64);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v8 = sub_24585A344();
  v2[26] = v8;
  v2[27] = *(_QWORD *)(v8 - 8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24584957C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_QWORD);
  void (*v9)(uint64_t, uint64_t, uint64_t);
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t, os_log_t);
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  os_log_t log;
  os_log_t loga;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(_QWORD, uint64_t, _QWORD);
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t, uint64_t);
  uint64_t v48;

  v1 = v0[7];
  v2 = v0[30];
  v3 = v0[27];
  v4 = v0[25];
  v5 = v0[20];
  v6 = v0[21];
  v7 = sub_24584B2A4();
  v0[31] = v7;
  v8 = *(void (**)(_QWORD))(v3 + 16);
  v0[32] = v8;
  v44 = (void (*)(_QWORD, uint64_t, _QWORD))v8;
  v46 = v7;
  v8(v2);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v0[33] = v9;
  v47 = v9;
  v9(v4, v1, v5);
  v10 = sub_24585A32C();
  v11 = sub_24585A578();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = v0[25];
    log = (os_log_t)v0[26];
    v42 = v0[30];
    v37 = v0[21];
    v39 = v0[27];
    v36 = v0[20];
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v48 = v14;
    *(_DWORD *)v13 = 136315138;
    sub_24583661C(&qword_2574B3310, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v15 = sub_24585A794();
    v0[6] = sub_2458387F8(v15, v16, &v48);
    sub_24585A614();
    swift_bridgeObjectRelease();
    v17 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v17(v12, v36);
    _os_log_impl(&dword_245833000, v10, v11, "Will unpair device with ID %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24953CF60](v14, -1, -1);
    MEMORY[0x24953CF60](v13, -1, -1);

    v18 = *(void (**)(uint64_t, os_log_t))(v39 + 8);
    v18(v42, log);
  }
  else
  {
    v19 = v0[30];
    v20 = v0[26];
    v21 = v0[27];
    v17 = *(void (**)(uint64_t, uint64_t))(v0[21] + 8);
    v17(v0[25], v0[20]);

    v18 = *(void (**)(uint64_t, os_log_t))(v21 + 8);
    v18(v19, v20);
  }
  v0[34] = v17;
  v0[35] = v18;
  sub_24585A230();
  swift_allocObject();
  v0[36] = sub_24585A224();
  sub_24585A218();
  v44(v0[29], v46, v0[26]);
  v22 = sub_24585A32C();
  v23 = sub_24585A578();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_245833000, v22, v23, "Waiting for paired device to be removed", v24, 2u);
    MEMORY[0x24953CF60](v24, -1, -1);
  }
  v25 = v0[29];
  v26 = v0[26];
  v27 = v0[21];
  v38 = v0[24];
  v28 = v0[20];
  v29 = v0[15];
  loga = (os_log_t)v0[13];
  v43 = v0[14];
  v45 = v0[12];
  v31 = v0[7];
  v30 = v0[8];

  v32 = ((uint64_t (*)(uint64_t, uint64_t))v18)(v25, v26);
  (*(void (**)(uint64_t))(*(_QWORD *)v30 + 88))(v32);
  v47(v38, v31, v28);
  v33 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  v34 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v27 + 32))(v34 + v33, v38, v28);
  ((void (*)(uint64_t, uint64_t, uint64_t))loga[2].isa)(v43, v29, v45);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3088);
  sub_2458383AC(&qword_2574B31E8, &qword_2574B31D8, MEMORY[0x24BEE6AA8]);
  sub_24585A6D4();
  ((void (*)(uint64_t, uint64_t))loga[1].isa)(v29, v45);
  return swift_task_switch();
}

uint64_t sub_245849CB0()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[17] + 16))(v0[18], v0[19], v0[16]);
  sub_2458383AC(&qword_2574B3330, &qword_2574B3308, MEMORY[0x24BEE6F08]);
  sub_24585A4F4();
  v0[37] = sub_2458383AC(&qword_2574B3338, &qword_2574B3300, MEMORY[0x24BEE6EE0]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[38] = v1;
  *v1 = v0;
  v1[1] = sub_245849D84;
  return sub_24585A47C();
}

uint64_t sub_245849D84()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v2[10] + 8))(v2[11], v2[9]);
  else
    return swift_task_switch();
}

uint64_t sub_245849DF4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD *);

  v1 = v0[4];
  v0[39] = v1;
  if (v1)
  {
    v0[5] = v1;
    v4 = (uint64_t (*)(_QWORD *))((char *)&dword_2574B3328 + dword_2574B3328);
    v2 = (_QWORD *)swift_task_alloc();
    v0[40] = v2;
    *v2 = v0;
    v2[1] = sub_245849E98;
    return v4(v0 + 5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0[10] + 8))(v0[11], v0[9]);
    return swift_task_switch();
  }
}

uint64_t sub_245849E98(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    v6 = *(_QWORD *)(v4 + 80);
    v5 = *(_QWORD *)(v4 + 88);
    v7 = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  else
  {
    *(_BYTE *)(v4 + 344) = a1 & 1;
  }
  return swift_task_switch();
}

uint64_t sub_245849F2C()
{
  uint64_t v0;
  _QWORD *v2;

  if ((*(_BYTE *)(v0 + 344) & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
    *(_QWORD *)(v0 + 336) = *(_QWORD *)(v0 + 40);
    return swift_task_switch();
  }
  else
  {
    swift_bridgeObjectRelease();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 328) = v2;
    *v2 = v0;
    v2[1] = sub_245849FD4;
    return sub_24585A47C();
  }
}

uint64_t sub_245849FD4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v2[10] + 8))(v2[11], v2[9]);
  else
    return swift_task_switch();
}

uint64_t sub_24584A044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24584A13C()
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
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  id v30;
  uint64_t v31;

  v1 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  sub_24584A7BC();
  v4 = (void *)swift_allocError();
  swift_willThrow();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
  v6 = *(_QWORD *)(v0 + 184);
  v7 = *(_QWORD *)(v0 + 160);
  v8 = *(_QWORD *)(v0 + 56);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 256))(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 208));
  v5(v6, v8, v7);
  v9 = v4;
  v30 = v4;
  v10 = v4;
  v11 = sub_24585A32C();
  v12 = sub_24585A56C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = *(void (**)(uint64_t, uint64_t))(v0 + 272);
    v28 = *(_QWORD *)(v0 + 224);
    v29 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v27 = *(_QWORD *)(v0 + 208);
    v14 = *(_QWORD *)(v0 + 184);
    v15 = *(_QWORD *)(v0 + 160);
    v16 = swift_slowAlloc();
    v25 = (_QWORD *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v31 = v26;
    *(_DWORD *)v16 = 136446466;
    sub_24583661C(&qword_2574B3310, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v17 = sub_24585A794();
    *(_QWORD *)(v0 + 16) = sub_2458387F8(v17, v18, &v31);
    sub_24585A614();
    swift_bridgeObjectRelease();
    v13(v14, v15);
    *(_WORD *)(v16 + 12) = 2114;
    v19 = v30;
    v20 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v20;
    sub_24585A614();
    *v25 = v20;

    _os_log_impl(&dword_245833000, v11, v12, "Failed to unpair device with ID %{public}s: %{public}@", (uint8_t *)v16, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D78);
    swift_arrayDestroy();
    MEMORY[0x24953CF60](v25, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24953CF60](v26, -1, -1);
    MEMORY[0x24953CF60](v16, -1, -1);

    v29(v28, v27);
  }
  else
  {
    v21 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v22 = *(_QWORD *)(v0 + 224);
    v23 = *(_QWORD *)(v0 + 208);
    (*(void (**)(_QWORD, _QWORD))(v0 + 272))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 160));

    v21(v22, v23);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24584A4C0(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = *a2;
  return swift_task_switch();
}

uint64_t sub_24584A4E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(uint64_t **)(v0 + 16);
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v2;
  swift_bridgeObjectRetain();
  v5 = sub_2458491F0((uint64_t (*)(char *))sub_24584B18C, v4, v1);
  swift_task_dealloc();
  *v3 = v5;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24584A560(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  char v10;
  _BYTE v12[16];

  v2 = type metadata accessor for CompanionDevice(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_24585A1E8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  CompanionDevice.id.getter((uint64_t)v8);
  v9 = sub_24585A1C4();
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  sub_24584AAD8(a1, (uint64_t)v4);
  if ((v9 & 1) != 0 && v4[*(int *)(v2 + 48)] != 3)
  {
    v12[15] = v4[*(int *)(v2 + 48)];
    v12[14] = 2;
    sub_24583D444();
    v10 = sub_24585A3E0();
    sub_24584AB1C((uint64_t)v4);
  }
  else
  {
    sub_24584AB1C((uint64_t)v4);
    v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_24584A6A4(_QWORD *a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *a1;
  return swift_task_switch();
}

uint64_t sub_24584A6C0()
{
  uint64_t v0;

  return (*(uint64_t (**)(BOOL))(v0 + 8))(*(_QWORD *)(*(_QWORD *)(v0 + 16) + 16) == 0);
}

uint64_t sub_24584A6D8()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_24584A6F4()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  return v0;
}

uint64_t sub_24584A72C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(sub_24585A1E8() - 8) + 80);
  v7 = v2 + ((v6 + 16) & ~v6);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_24583B190;
  v8[2] = a1;
  v8[3] = v7;
  v8[4] = *a2;
  return swift_task_switch();
}

unint64_t sub_24584A7BC()
{
  unint64_t result;

  result = qword_2574B3340;
  if (!qword_2574B3340)
  {
    result = MEMORY[0x24953CEC4](&unk_24585B7A4, &type metadata for ReplicatorController.ReplicatorControllerError);
    atomic_store(result, (unint64_t *)&qword_2574B3340);
  }
  return result;
}

unint64_t sub_24584A804()
{
  unint64_t result;

  result = qword_2574B3348;
  if (!qword_2574B3348)
  {
    result = MEMORY[0x24953CEC4](&unk_24585B73C, &type metadata for ReplicatorController.ReplicatorControllerError);
    atomic_store(result, &qword_2574B3348);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ReplicatorController.ReplicatorControllerError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ReplicatorController.ReplicatorControllerError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24584A8DC + 4 * byte_24585B730[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24584A8FC + 4 * byte_24585B735[v4]))();
}

_BYTE *sub_24584A8DC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24584A8FC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24584A904(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24584A90C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24584A914(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24584A91C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorController.ReplicatorControllerError()
{
  return &type metadata for ReplicatorController.ReplicatorControllerError;
}

uint64_t initializeBufferWithCopyOfBuffer for ReplicatorController.Change(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_24584A97C(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_24584A97C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for ReplicatorController.Change(uint64_t a1)
{
  return sub_24584A998(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_24584A998(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t assignWithCopy for ReplicatorController.Change(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_24584A97C(*(_QWORD *)a2, v4);
  v5 = *(_QWORD *)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_24584A998(v5, v6);
  return a1;
}

uint64_t assignWithTake for ReplicatorController.Change(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  v5 = *(_QWORD *)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_24584A998(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReplicatorController.Change(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ReplicatorController.Change(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_24584AABC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ReplicatorController.Change()
{
  return &type metadata for ReplicatorController.Change;
}

uint64_t sub_24584AAD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CompanionDevice(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24584AB1C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CompanionDevice(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24584AB58(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_24584AB74(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_24584AB74(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3150);
  v10 = *(_QWORD *)(type metadata accessor for CompanionDevice(0) - 8);
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
  v16 = *(_QWORD *)(type metadata accessor for CompanionDevice(0) - 8);
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
  result = sub_24585A71C();
  __break(1u);
  return result;
}

uint64_t sub_24584AD54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_24585A1E8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24584AE20(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = *(_QWORD *)(sub_24585A1E8() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  v6 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8) - 8);
  v7 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  return sub_24584852C(a1, (_QWORD *)(v1 + v4), v1 + v7, *(_QWORD *)(v1 + ((*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_24584AEA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_24585A1E8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_24584AF68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(sub_24585A1E8() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC8) - 8) + 80);
  v6 = (v4 + v5) & ~v5;
  v7 = *(_QWORD *)(v0 + 32);
  v8 = v0 + v3;
  v9 = v0 + v6;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = sub_24583B190;
  return sub_2458489E8((uint64_t)v10, v11, v12, v7, v8, v9);
}

uint64_t objectdestroy_16Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_24585A1E8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_24584B06C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(sub_24585A1E8() - 8) + 80);
  v7 = v2 + ((v6 + 16) & ~v6);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_24583A348;
  v8[2] = a1;
  v8[3] = v7;
  v8[4] = *a2;
  return swift_task_switch();
}

uint64_t sub_24584B0FC(uint64_t a1)
{
  return sub_24584A560(a1) & 1;
}

uint64_t sub_24584B128(uint64_t result, unsigned __int8 a2)
{
  if (a2 != 255)
    return sub_24584A998(result, a2 & 1);
  return result;
}

uint64_t sub_24584B140(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24584B18C(uint64_t a1)
{
  return sub_24584B0FC(a1) & 1;
}

uint64_t sub_24584B1A4(uint64_t a1)
{
  return sub_24584B2E0(a1, qword_2574B5EE0);
}

uint64_t sub_24584B1D0()
{
  return sub_24584B240(&qword_2574B4950, (uint64_t)qword_2574B5EE0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_24584B204(uint64_t a1)
{
  return sub_24584B2E0(a1, qword_2574B5EF8);
}

uint64_t sub_24584B224()
{
  return sub_24584B240(&qword_2574B4958, (uint64_t)qword_2574B5EF8);
}

uint64_t sub_24584B240(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_24585A344();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_24584B280(uint64_t a1)
{
  return sub_24584B2E0(a1, qword_2574B5F10);
}

uint64_t sub_24584B2A4()
{
  return sub_24584B240(&qword_2574B4960, (uint64_t)qword_2574B5F10);
}

uint64_t sub_24584B2C0(uint64_t a1)
{
  return sub_24584B2E0(a1, qword_2574B5F28);
}

uint64_t sub_24584B2E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_24585A344();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24585A338();
}

uint64_t sub_24584B354()
{
  return sub_24584B240(qword_2574B4968, (uint64_t)qword_2574B5F28);
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

unint64_t sub_24584B3B0()
{
  unint64_t result;

  result = qword_254417468;
  if (!qword_254417468)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254417468);
  }
  return result;
}

uint64_t sub_24584B3EC()
{
  return sub_24585A5FC();
}

uint64_t sub_24584B40C()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_24584B440();
  return v0;
}

uint64_t sub_24584B440()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  _QWORD v9[2];

  v1 = sub_24585A584();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24585A5CC();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930];
  MEMORY[0x24BDAC7A8](v5);
  v7 = sub_24585A374();
  MEMORY[0x24BDAC7A8](v7);
  v9[0] = sub_24584B3B0();
  sub_24585A368();
  v9[1] = MEMORY[0x24BEE4AF8];
  sub_24583D380((unint64_t *)&unk_254417800, v6, MEMORY[0x24BEE5940]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544177F0);
  sub_2458383AC(&qword_2544177F8, &qword_2544177F0, MEMORY[0x24BEE12C8]);
  sub_24585A638();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5758], v1);
  *(_QWORD *)(v0 + 16) = sub_24585A5D8();
  *(_QWORD *)(v0 + 24) = -70;
  return v0;
}

uint64_t sub_24584B60C@<X0>(char a1@<W0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  id v17;
  void *v18;
  unsigned int v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D80);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24585A1E8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for RapportController.Change();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v16 = a1;
  v17 = objc_msgSend(a2, sel_idsDeviceIdentifier);
  if (!v17)
  {

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(a3, 1, 1, v13);
  }
  v18 = v17;
  v24 = v14;
  v25 = a3;
  sub_24585A410();

  sub_24585A1AC();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {

    sub_24583AE20((uint64_t)v8, &qword_2574B2D80);
    v14 = v24;
    a3 = v25;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(a3, 1, 1, v13);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  (*(void (**)(_BYTE *, char *, uint64_t))(v10 + 16))(&v16[*(int *)(v13 + 20)], v12, v9);
  v20 = objc_msgSend(a2, sel_proximity);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v21 = 0;
  if (v20 == 10)
  {
    v23 = v24;
    v22 = v25;
  }
  else
  {
    v23 = v24;
    v22 = v25;
    if (v20 != 20)
    {
      if (v20 == 30)
        v21 = 1;
      else
        v21 = 2;
    }
  }
  v16[*(int *)(v13 + 24)] = v21;
  sub_24584EFD8((uint64_t)v16, v22);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(v22, 0, 1, v13);
  return sub_24584E740((uint64_t)v16);
}

uint64_t sub_24584B864@<X0>(uint64_t a1@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, char *, uint64_t);
  void *v29;
  id v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, char *, uint64_t);
  void *v42;
  id v43;
  char *v44;
  uint64_t v45;
  void (*v46)(uint64_t, char *, uint64_t);
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  _QWORD v70[2];
  char *v71;
  uint64_t v72;
  unsigned int v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  void (*v90)(char *, char *, uint64_t);
  id v91;
  uint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  uint64_t aBlock;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;

  v86 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC0);
  MEMORY[0x24BDAC7A8](v2);
  v87 = (char *)v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33C0);
  v80 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v79 = (char *)v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33C8);
  v83 = *(_QWORD *)(v5 - 8);
  v84 = v5;
  v85 = *(_QWORD *)(v83 + 64);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v82 = (char *)v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v95 = (char *)v70 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D8);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = v13;
  v93 = *(char **)(v14 + 64);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v70 - v19;
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33E0);
  v76 = *(_QWORD *)(v77 - 8);
  v78 = *(_QWORD *)(v76 + 64);
  v21 = MEMORY[0x24BDAC7A8](v77);
  v75 = (char *)v70 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v94 = (char *)v70 - v23;
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7CC40]), sel_init);
  v91 = v24;
  objc_msgSend(v24, sel_setRssiThreshold_, -70);
  objc_msgSend(v24, sel_setDispatchQueue_, *(_QWORD *)(v1 + 16));
  type metadata accessor for RapportController.Change();
  v73 = *MEMORY[0x24BEE6CA0];
  (*(void (**)(char *))(v10 + 104))(v12);
  sub_24585A500();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v90 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v90(v18, v20, v15);
  v72 = *(unsigned __int8 *)(v14 + 80);
  v74 = v14;
  v88 = (v72 + 24) & ~v72;
  v89 = &v93[v88];
  v25 = v88;
  v70[1] = v72 | 7;
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = v1;
  v27 = v26 + v25;
  v28 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
  v28(v27, v18, v15);
  v70[0] = v28;
  v100 = sub_24584C368;
  v101 = v26;
  aBlock = MEMORY[0x24BDAC760];
  v97 = 1107296256;
  v98 = sub_245837C8C;
  v99 = &block_descriptor_0;
  v29 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v30 = v91;
  objc_msgSend(v91, sel_setInterruptionHandler_, v29);
  _Block_release(v29);
  v31 = v20;
  v32 = v15;
  v92 = v15;
  v33 = v90;
  v90(v18, v20, v15);
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = v1;
  v35 = v88;
  v28(v34 + v88, v18, v32);
  v100 = sub_24584C3B8;
  v101 = v34;
  aBlock = MEMORY[0x24BDAC760];
  v97 = 1107296256;
  v98 = sub_24584C3C8;
  v99 = &block_descriptor_6;
  v36 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v30, sel_setDeviceFoundHandler_, v36);
  _Block_release(v36);
  v37 = v92;
  v33(v18, v20, v92);
  v38 = v33;
  v39 = swift_allocObject();
  *(_QWORD *)(v39 + 16) = v1;
  v40 = v37;
  v41 = (void (*)(uint64_t, char *, uint64_t))v70[0];
  ((void (*)(uint64_t, char *, uint64_t))v70[0])(v39 + v35, v18, v37);
  v100 = sub_24584C808;
  v101 = v39;
  aBlock = MEMORY[0x24BDAC760];
  v97 = 1107296256;
  v98 = sub_24584C3C8;
  v99 = &block_descriptor_12;
  v42 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v43 = v91;
  objc_msgSend(v91, sel_setDeviceLostHandler_, v42);
  _Block_release(v42);
  v44 = v31;
  v38(v18, v31, v40);
  v45 = swift_allocObject();
  *(_QWORD *)(v45 + 16) = v1;
  v41(v45 + v88, v18, v40);
  v46 = v41;
  v100 = sub_24584CE5C;
  v101 = v45;
  v47 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v97 = 1107296256;
  v98 = sub_24584CEB0;
  v99 = &block_descriptor_18;
  v48 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v43, sel_setDeviceChangedHandler_, v48);
  _Block_release(v48);
  v71 = v44;
  v90(v18, v44, v40);
  v49 = (v72 + 16) & ~v72;
  v50 = swift_allocObject();
  v46(v50 + v49, v18, v40);
  v100 = sub_24584D22C;
  v101 = v50;
  aBlock = v47;
  v97 = 1107296256;
  v98 = sub_24584D26C;
  v99 = &block_descriptor_24;
  v51 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v43, sel_activateWithCompletion_, v51);
  _Block_release(v51);
  *(_QWORD *)(swift_allocObject() + 16) = v43;
  v93 = (char *)v43;
  sub_24585A50C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33E8);
  v52 = v80;
  v53 = v79;
  v54 = v81;
  (*(void (**)(char *, _QWORD, uint64_t))(v80 + 104))(v79, v73, v81);
  v55 = v95;
  sub_24585A500();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v54);
  v56 = sub_24585A4A0();
  v57 = (uint64_t)v87;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v87, 1, 1, v56);
  v58 = v76;
  v59 = v75;
  v60 = v77;
  (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v75, v94, v77);
  v61 = v83;
  v62 = v84;
  v63 = v82;
  (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v82, v55, v84);
  v64 = (*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
  v65 = v61;
  v66 = (v78 + *(unsigned __int8 *)(v61 + 80) + v64) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
  v67 = swift_allocObject();
  *(_QWORD *)(v67 + 16) = 0;
  *(_QWORD *)(v67 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v58 + 32))(v67 + v64, v59, v60);
  (*(void (**)(unint64_t, char *, uint64_t))(v65 + 32))(v67 + v66, v63, v62);
  sub_245836718(v57, (uint64_t)&unk_2574B33F8, v67);
  v68 = v95;
  sub_24585A50C();

  (*(void (**)(char *, uint64_t))(v65 + 8))(v68, v62);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v71, v92);
  return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v94, v60);
}

uint64_t type metadata accessor for RapportController.Change()
{
  uint64_t result;

  result = qword_2574B4B70;
  if (!qword_2574B4B70)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24584C180(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint8_t *v14;
  void *v15;
  id v16;
  char v17;
  uint64_t result;
  _QWORD v19[2];

  v2 = sub_24585A3A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_24585A344();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24584B224();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = sub_24585A32C();
  v12 = sub_24585A578();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v19[0] = a1;
    v14 = v13;
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_245833000, v11, v12, "Interrupted", v13, 2u);
    a1 = v19[0];
    MEMORY[0x24953CF60](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v15 = *(void **)(a1 + 16);
  *v5 = v15;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5610], v2);
  v16 = v15;
  v17 = sub_24585A3B0();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v17 & 1) != 0)
  {
    sub_24584F01C();
    v19[1] = swift_allocError();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D8);
    return sub_24585A530();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24584C368()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D8);
  return sub_24584C180(*(_QWORD *)(v0 + 16));
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

uint64_t sub_24584C3B8(void *a1)
{
  return sub_24584C818(a1, "Found device: %{public}@", 0);
}

void sub_24584C3C8(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_24584C418(void *a1, uint64_t a2, uint64_t a3, const char *a4, char a5)
{
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
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD *v33;
  os_log_type_t v34;
  uint8_t *v35;
  _QWORD *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t result;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint8_t *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;

  v54 = a3;
  v55 = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B34B8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3498);
  MEMORY[0x24BDAC7A8](v12);
  v58 = (uint64_t)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for RapportController.Change();
  v56 = *(_QWORD *)(v14 - 8);
  v57 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v52 = (uint64_t)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v53 = (uint64_t)&v46 - v17;
  v18 = sub_24585A3A4();
  v61 = *(_QWORD *)(v18 - 8);
  v62 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (_QWORD **)((char *)&v46 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = sub_24585A344();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v46 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_24584B224();
  v59 = v22;
  v60 = v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, v25, v21);
  v26 = a1;
  v27 = sub_24585A32C();
  v28 = sub_24585A578();
  if (os_log_type_enabled(v27, v28))
  {
    v48 = a2;
    v29 = swift_slowAlloc();
    v50 = v9;
    v30 = (uint8_t *)v29;
    v31 = swift_slowAlloc();
    v51 = v8;
    v46 = (_QWORD *)v31;
    v49 = v11;
    v47 = v30;
    *(_DWORD *)v30 = 138543362;
    v63 = v26;
    v32 = v26;
    a2 = v48;
    v11 = v49;
    sub_24585A614();
    v33 = v46;
    *v46 = v26;

    v34 = v28;
    v35 = v47;
    _os_log_impl(&dword_245833000, v27, v34, v55, v47, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D78);
    swift_arrayDestroy();
    v36 = v33;
    v8 = v51;
    MEMORY[0x24953CF60](v36, -1, -1);
    v9 = v50;
    MEMORY[0x24953CF60](v35, -1, -1);
  }
  else
  {

    v27 = v26;
  }

  (*(void (**)(char *, uint64_t))(v59 + 8))(v24, v60);
  v37 = *(void **)(a2 + 16);
  *v20 = v37;
  v39 = v61;
  v38 = v62;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v61 + 104))(v20, *MEMORY[0x24BEE5610], v62);
  v40 = v37;
  LOBYTE(v37) = sub_24585A3B0();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v39 + 8))(v20, v38);
  if ((v37 & 1) != 0)
  {
    v42 = v26;
    v43 = v58;
    sub_24584B60C(a5, v42, v58);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v43, 1, v57) == 1)
    {
      return sub_24583AE20(v43, &qword_2574B3498);
    }
    else
    {
      v44 = v43;
      v45 = v53;
      sub_24584E6FC(v44, v53);
      sub_24584EFD8(v45, v52);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D8);
      sub_24585A524();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      return sub_24584E740(v45);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24584C808(void *a1)
{
  return sub_24584C818(a1, "Lost device: %{public}@", 2);
}

uint64_t sub_24584C818(void *a1, const char *a2, char a3)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D8) - 8) + 80);
  return sub_24584C418(a1, *(_QWORD *)(v3 + 16), v3 + ((v7 + 24) & ~v7), a2, a3);
}

uint64_t sub_24584C878(void *a1, char a2, uint64_t a3, uint64_t a4)
{
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
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  NSObject *v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint8_t *v32;
  NSObject *v33;
  _QWORD *v34;
  os_log_type_t v35;
  uint8_t *v36;
  void (*v37)(char *, uint64_t);
  void *v38;
  void (*v39)(char *, uint64_t);
  _QWORD *v40;
  id v41;
  uint64_t result;
  NSObject *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  _QWORD *v49;
  NSObject *v50;
  _QWORD *v51;
  uint8_t *v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  _QWORD *v58;
  uint8_t *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  _QWORD *v75;
  void (*v76)(char *, uint64_t);
  NSObject *v77;

  v67 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B34B8);
  v65 = *(_QWORD *)(v7 - 8);
  v66 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v64 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3498);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for RapportController.Change();
  v71 = *(_QWORD *)(v12 - 8);
  v72 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v62 = (uint64_t)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v63 = (uint64_t)&v57 - v15;
  v16 = sub_24585A3A4();
  v76 = *(void (**)(char *, uint64_t))(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v75 = (uint64_t *)((char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = sub_24585A344();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v57 - v23;
  v25 = sub_24584B224();
  v74 = v19;
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v68 = v25;
  v69 = v26;
  ((void (*)(char *))v26)(v24);
  v27 = a1;
  v28 = sub_24585A32C();
  v29 = sub_24585A578();
  v30 = os_log_type_enabled(v28, v29);
  v73 = v11;
  if (v30)
  {
    v31 = swift_slowAlloc();
    v61 = v22;
    v32 = (uint8_t *)v31;
    v58 = (_QWORD *)swift_slowAlloc();
    v70 = v18;
    v59 = v32;
    v60 = a3;
    *(_DWORD *)v32 = 138543362;
    v77 = v27;
    v33 = v27;
    a3 = v60;
    v18 = v70;
    sub_24585A614();
    v34 = v58;
    *v58 = v27;

    v35 = v29;
    v36 = v59;
    _os_log_impl(&dword_245833000, v28, v35, "Device changed: %{public}@", v59, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D78);
    swift_arrayDestroy();
    MEMORY[0x24953CF60](v34, -1, -1);
    v22 = v61;
    MEMORY[0x24953CF60](v36, -1, -1);
  }
  else
  {

    v28 = v27;
  }

  v37 = *(void (**)(char *, uint64_t))(v74 + 8);
  v37(v24, v18);
  v38 = *(void **)(a3 + 16);
  v40 = v75;
  v39 = v76;
  *v75 = v38;
  (*((void (**)(_QWORD *, _QWORD, uint64_t))v39 + 13))(v40, *MEMORY[0x24BEE5610], v16);
  v41 = v38;
  LOBYTE(v38) = sub_24585A3B0();
  result = (*((uint64_t (**)(_QWORD *, uint64_t))v39 + 1))(v40, v16);
  if ((v38 & 1) != 0)
  {
    if (a2 < 0)
    {
      v69(v22, v68, v18);
      v43 = v27;
      v44 = sub_24585A32C();
      v45 = sub_24585A578();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = swift_slowAlloc();
        v70 = v18;
        v47 = (uint8_t *)v46;
        v48 = swift_slowAlloc();
        v76 = v37;
        v77 = v43;
        v49 = (_QWORD *)v48;
        *(_DWORD *)v47 = 138543362;
        v50 = v43;
        sub_24585A614();
        *v49 = v43;

        _os_log_impl(&dword_245833000, v44, v45, "Device proximity changed: %{public}@", v47, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D78);
        swift_arrayDestroy();
        v51 = v49;
        v37 = v76;
        MEMORY[0x24953CF60](v51, -1, -1);
        v52 = v47;
        v18 = v70;
        MEMORY[0x24953CF60](v52, -1, -1);
      }
      else
      {

        v44 = v43;
      }

      v37(v22, v18);
      v53 = v43;
      v54 = (uint64_t)v73;
      sub_24584B60C(1, v53, (uint64_t)v73);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v54, 1, v72) == 1)
      {
        return sub_24583AE20(v54, &qword_2574B3498);
      }
      else
      {
        v55 = v63;
        sub_24584E6FC(v54, v63);
        sub_24584EFD8(v55, v62);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D8);
        v56 = v64;
        sub_24585A524();
        (*(void (**)(char *, uint64_t))(v65 + 8))(v56, v66);
        return sub_24584E740(v55);
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_24584CE5C(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D8) - 8) + 80);
  return sub_24584C878(a1, a2, *(_QWORD *)(v2 + 16), v2 + ((v5 + 24) & ~v5));
}

void sub_24584CEB0(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_24584CF0C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = sub_24585A344();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v26 - v9;
  if (a1)
  {
    v11 = a1;
    v12 = sub_24584B224();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v12, v4);
    v13 = a1;
    v14 = a1;
    v15 = sub_24585A32C();
    v16 = sub_24585A56C();
    if (os_log_type_enabled(v15, v16))
    {
      v28 = a2;
      v17 = (uint8_t *)swift_slowAlloc();
      v27 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v17 = 138543362;
      v18 = a1;
      v19 = _swift_stdlib_bridgeErrorToNSError();
      v29 = v19;
      sub_24585A614();
      v20 = v27;
      *v27 = v19;

      _os_log_impl(&dword_245833000, v15, v16, "Activation failed: %{public}@", v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D78);
      swift_arrayDestroy();
      MEMORY[0x24953CF60](v20, -1, -1);
      MEMORY[0x24953CF60](v17, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v29 = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D8);
    return sub_24585A530();
  }
  else
  {
    v21 = sub_24584B224();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v21, v4);
    v22 = sub_24585A32C();
    v23 = sub_24585A578();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_245833000, v22, v23, "Activation finished", v24, 2u);
      MEMORY[0x24953CF60](v24, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
}

uint64_t sub_24584D1C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D8);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_24584D22C(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B33D8) - 8) + 80);
  return sub_24584CF0C(a1, v1 + ((v3 + 16) & ~v3));
}

void sub_24584D26C(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id sub_24584D2C0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;

  v2 = sub_24585A344();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24584B224();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_24585A32C();
  v8 = sub_24585A578();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_245833000, v7, v8, "Change accumulator terminated", v9, 2u);
    MEMORY[0x24953CF60](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return objc_msgSend(a1, sel_invalidate);
}

uint64_t sub_24584D3D4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_24584D3F8()
{
  uint64_t v0;

  return sub_24584D2C0(*(void **)(v0 + 16));
}

uint64_t sub_24584D400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5[18] = a4;
  v5[19] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3490);
  v5[20] = v6;
  v5[21] = *(_QWORD *)(v6 - 8);
  v5[22] = swift_task_alloc();
  v7 = sub_24585A1E8();
  v5[23] = v7;
  v5[24] = *(_QWORD *)(v7 - 8);
  v5[25] = swift_task_alloc();
  v8 = type metadata accessor for RapportController.Change();
  v5[26] = v8;
  v5[27] = *(_QWORD *)(v8 - 8);
  v5[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3498);
  v5[29] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B34A0);
  v5[30] = v9;
  v5[31] = *(_QWORD *)(v9 - 8);
  v5[32] = swift_task_alloc();
  v10 = sub_24585A344();
  v5[33] = v10;
  v5[34] = *(_QWORD *)(v10 - 8);
  v5[35] = swift_task_alloc();
  v5[36] = swift_task_alloc();
  v5[37] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24584D548()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  _QWORD *v13;

  v0[13] = MEMORY[0x24BEE4B00];
  v1 = v0[37];
  v2 = v0[33];
  v3 = v0[34];
  v4 = sub_24584B224();
  v0[38] = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[39] = v5;
  v5(v1, v4, v2);
  v6 = sub_24585A32C();
  v7 = sub_24585A578();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_245833000, v6, v7, "Will wait for changes", v8, 2u);
    MEMORY[0x24953CF60](v8, -1, -1);
  }
  v9 = v0[37];
  v10 = v0[33];
  v11 = v0[34];

  v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[40] = v12;
  v12(v9, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33E0);
  sub_24585A4D0();
  swift_beginAccess();
  v13 = (_QWORD *)swift_task_alloc();
  v0[41] = v13;
  *v13 = v0;
  v13[1] = sub_24584D6C0;
  return sub_24585A548();
}

uint64_t sub_24584D6C0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24584D724()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(unint64_t, uint64_t, uint64_t);
  char v11;
  int v12;
  uint64_t *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  char v24;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  _BOOL4 v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;

  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 208);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 216) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 240));
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v4 = (uint64_t *)(v0 + 104);
  v5 = *(unsigned __int8 **)(v0 + 224);
  sub_24584E6FC(v1, (uint64_t)v5);
  v6 = (uint64_t)&v5[*(int *)(v2 + 20)];
  if (*v5 > 1u)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v8 = sub_245838F7C(v6);
    v24 = v23;
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
      goto LABEL_19;
    v13 = (uint64_t *)(v0 + 120);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v26 = *v4;
    *(_QWORD *)(v0 + 120) = *v4;
    *v4 = 0x8000000000000000;
    if (isUniquelyReferenced_nonNull_native)
    {
LABEL_10:
      (*(void (**)(unint64_t, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v26 + 48) + *(_QWORD *)(*(_QWORD *)(v0 + 192) + 72) * v8, *(_QWORD *)(v0 + 184));
      v27 = *(_QWORD *)(v0 + 120);
      sub_24584EB18(v8, v27);
      *(_QWORD *)(v0 + 104) = v27;
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
LABEL_24:
    sub_24584EDB8();
    v26 = *v13;
    goto LABEL_10;
  }
  v7 = *(_QWORD *)(v0 + 224);
  v8 = *(_QWORD *)(v0 + 200);
  v9 = *(_QWORD *)(v0 + 208);
  v10 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 192) + 16);
  v10(v8, v6, *(_QWORD *)(v0 + 184));
  v11 = *(_BYTE *)(v7 + *(int *)(v9 + 24));
  swift_beginAccess();
  v12 = swift_isUniquelyReferenced_nonNull_native();
  v13 = *(uint64_t **)(v0 + 104);
  *(_QWORD *)(v0 + 136) = v13;
  *(_QWORD *)(v0 + 104) = 0x8000000000000000;
  v15 = sub_245838F7C(v8);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_24;
  }
  v19 = v14;
  if (v13[3] >= v18)
  {
    if ((v12 & 1) == 0)
      sub_24584EDB8();
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 200);
    sub_24584E77C(v18, v12);
    v21 = sub_245838F7C(v20);
    if ((v19 & 1) != (v22 & 1))
      return sub_24585A7E8();
    v15 = v21;
  }
  v28 = *(_QWORD **)(v0 + 136);
  if ((v19 & 1) != 0)
  {
    *(_BYTE *)(v28[7] + v15) = v11;
  }
  else
  {
    v30 = *(_QWORD *)(v0 + 192);
    v29 = *(_QWORD *)(v0 + 200);
    v31 = *(_QWORD *)(v0 + 184);
    v28[(v15 >> 6) + 8] |= 1 << v15;
    result = v10(v28[6] + *(_QWORD *)(v30 + 72) * v15, v29, v31);
    *(_BYTE *)(v28[7] + v15) = v11;
    v32 = v28[2];
    v33 = __OFADD__(v32, 1);
    v34 = v32 + 1;
    if (v33)
    {
      __break(1u);
      return result;
    }
    v28[2] = v34;
  }
  v36 = *(_QWORD *)(v0 + 192);
  v35 = *(_QWORD *)(v0 + 200);
  v37 = *(_QWORD *)(v0 + 184);
  *(_QWORD *)(v0 + 104) = v28;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
LABEL_19:
  swift_endAccess();
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 312))(*(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 264));
  v38 = sub_24585A32C();
  v39 = sub_24585A578();
  v40 = os_log_type_enabled(v38, v39);
  v41 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
  v42 = *(_QWORD *)(v0 + 288);
  v43 = *(_QWORD *)(v0 + 264);
  if (v40)
  {
    v54 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
    v44 = swift_slowAlloc();
    v45 = swift_slowAlloc();
    v55 = v45;
    *(_DWORD *)v44 = 136315138;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B34A8);
    sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    v46 = sub_24585A3BC();
    v48 = v47;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v44 + 4) = sub_2458387F8(v46, v48, &v55);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245833000, v38, v39, "Producing snapshot: %s", (uint8_t *)v44, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24953CF60](v45, -1, -1);
    MEMORY[0x24953CF60](v44, -1, -1);

    v54(v42, v43);
  }
  else
  {

    v41(v42, v43);
  }
  v49 = *(_QWORD *)(v0 + 224);
  v51 = *(_QWORD *)(v0 + 168);
  v50 = *(_QWORD *)(v0 + 176);
  v52 = *(_QWORD *)(v0 + 160);
  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33C8);
  sub_24585A524();
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v52);
  sub_24584E740(v49);
  v53 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v53;
  *v53 = v0;
  v53[1] = sub_24584DC74;
  return sub_24585A548();
}

uint64_t sub_24584DC74()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24584DCD8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 304);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 312);
  v3 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 264);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 240));
  swift_bridgeObjectRelease();
  v5 = *(void **)(v0 + 128);
  v2(v3, v1, v4);
  v6 = v5;
  v7 = v5;
  v8 = sub_24585A32C();
  v9 = sub_24585A56C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138543362;
    v12 = v5;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 96) = v13;
    sub_24585A614();
    *v11 = v13;

    _os_log_impl(&dword_245833000, v8, v9, "Throwing error: %{public}@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D78);
    swift_arrayDestroy();
    MEMORY[0x24953CF60](v11, -1, -1);
    MEMORY[0x24953CF60](v10, -1, -1);
  }
  else
  {

  }
  v14 = *(void (**)(uint64_t, uint64_t))(v0 + 320);
  v15 = *(_QWORD *)(v0 + 280);
  v16 = *(_QWORD *)(v0 + 264);

  v14(v15, v16);
  *(_QWORD *)(v0 + 88) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33C8);
  sub_24585A530();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24584DF0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33E0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B33C8);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_24584DFD0()
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
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B33E0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B33C8) - 8) + 80);
  v6 = v3 + v4 + v5;
  v7 = v0 + v3;
  v8 = v0 + (v6 & ~v5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_24583A348;
  return sub_24584D400((uint64_t)v9, v10, v11, v7, v8);
}

uint64_t sub_24584E06C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_24585A344();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_24584B224();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_24585A32C();
  v6 = sub_24585A578();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_245833000, v5, v6, "Result terminated", v7, 2u);
    MEMORY[0x24953CF60](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_24585A4E8();
}

uint64_t sub_24584E194()
{
  return sub_24584E06C();
}

uint64_t sub_24584E19C()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

unint64_t sub_24584E1C4()
{
  unint64_t result;

  result = qword_2574B3400;
  if (!qword_2574B3400)
  {
    result = MEMORY[0x24953CEC4](&unk_24585B874, &type metadata for RapportControllerError);
    atomic_store(result, (unint64_t *)&qword_2574B3400);
  }
  return result;
}

uint64_t sub_24584E208()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t storeEnumTagSinglePayload for RapportControllerError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24584E254 + 4 * asc_24585B860[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24584E274 + 4 * byte_24585B865[v4]))();
}

_BYTE *sub_24584E254(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24584E274(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24584E27C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24584E284(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24584E28C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24584E294(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RapportControllerError()
{
  return &type metadata for RapportControllerError;
}

uint64_t type metadata accessor for RapportController()
{
  return objc_opt_self();
}

_QWORD *sub_24584E2D0(_BYTE *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = &a1[v7];
    v9 = (char *)a2 + v7;
    v10 = sub_24585A1E8();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    *((_BYTE *)v4 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_24584E374(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_24585A1E8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_BYTE *sub_24584E3AC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_24585A1E8();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *sub_24584E424(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_24585A1E8();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *sub_24584E49C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_24585A1E8();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *sub_24584E514(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_24585A1E8();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_24584E58C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24584E598(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 253)
  {
    v4 = *a1;
    if (v4 >= 3)
      return v4 - 2;
    else
      return 0;
  }
  else
  {
    v8 = sub_24585A1E8();
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_24584E60C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_24584E618(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 253)
  {
    *result = a2 + 2;
  }
  else
  {
    v7 = sub_24585A1E8();
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_24584E688()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24585A1E8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24584E6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RapportController.Change();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24584E740(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RapportController.Change();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24584E77C(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;

  v4 = sub_24585A1E8();
  v42 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = v2;
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B34B0);
  v8 = sub_24585A704();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = swift_release();
    v35 = v38;
LABEL_42:
    *v35 = v9;
    return result;
  }
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 64);
  v40 = (_QWORD *)(v7 + 64);
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v39 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 64;
  result = swift_retain();
  v16 = 0;
  HIDWORD(v37) = a2;
  v17 = 16;
  if ((a2 & 1) != 0)
    v17 = 32;
  v41 = v17;
  while (1)
  {
    if (v13)
    {
      v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v20 = v19 | (v16 << 6);
      goto LABEL_24;
    }
    v21 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v21 >= v39)
    {
      swift_release();
      v35 = v38;
      v22 = v40;
      if ((v37 & 0x100000000) != 0)
      {
LABEL_37:
        v36 = 1 << *(_BYTE *)(v7 + 32);
        if (v36 >= 64)
          bzero(v22, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
        else
          *v22 = -1 << v36;
        *(_QWORD *)(v7 + 16) = 0;
      }
LABEL_41:
      result = swift_release();
      goto LABEL_42;
    }
    v22 = v40;
    v23 = v40[v21];
    ++v16;
    if (!v23)
    {
      v16 = v21 + 1;
      if (v21 + 1 >= v39)
        goto LABEL_34;
      v23 = v40[v16];
      if (!v23)
        break;
    }
LABEL_23:
    v13 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_24:
    v25 = *(_QWORD *)(v42 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + v41))(v6, *(_QWORD *)(v7 + 48) + v25 * v20, v4);
    v26 = v7;
    v27 = *(_BYTE *)(*(_QWORD *)(v7 + 56) + v20);
    sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_24585A3C8();
    v28 = -1 << *(_BYTE *)(v9 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v14 + 8 * v30);
      }
      while (v34 == -1);
      v18 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v42 + 32))(*(_QWORD *)(v9 + 48) + v25 * v18, v6, v4);
    *(_BYTE *)(*(_QWORD *)(v9 + 56) + v18) = v27;
    ++*(_QWORD *)(v9 + 16);
    v7 = v26;
  }
  v24 = v21 + 2;
  if (v24 >= v39)
  {
LABEL_34:
    swift_release();
    v35 = v38;
    if ((v37 & 0x100000000) != 0)
      goto LABEL_37;
    goto LABEL_41;
  }
  v23 = v40[v24];
  if (v23)
  {
    v16 = v24;
    goto LABEL_23;
  }
  while (1)
  {
    v16 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v16 >= v39)
      goto LABEL_34;
    v23 = v40[v16];
    ++v24;
    if (v23)
      goto LABEL_23;
  }
LABEL_44:
  __break(1u);
  return result;
}

unint64_t sub_24584EB18(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  unint64_t v34;
  uint64_t v35;

  v4 = sub_24585A1E8();
  v35 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_24585A644();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v34 = (result + 1) & v11;
      v12 = *(_QWORD *)(v35 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v33(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = sub_24585A3C8();
        result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v34)
        {
          if (v19 >= v34 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_BYTE *)(v23 + a1);
            v25 = (_BYTE *)(v23 + v10);
            if (a1 != v10 || (a1 = v10, v24 >= v25 + 1))
            {
              *v24 = *v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v34 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_24584EDB8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = sub_24585A1E8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B34B0);
  v23 = v0;
  v5 = *v0;
  v6 = sub_24585A6F8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v24 = v5 + 64;
  v25 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      v11 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_26;
      v20 = *(_QWORD *)(v24 + 8 * v11);
      if (!v20)
        break;
    }
LABEL_25:
    v14 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v16);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v16) = v18;
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_26;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v11 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v11 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v11);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24584EFD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RapportController.Change();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24584F01C()
{
  unint64_t result;

  result = qword_2574B34C0;
  if (!qword_2574B34C0)
  {
    result = MEMORY[0x24953CEC4](&unk_24585B8DC, &type metadata for RapportControllerError);
    atomic_store(result, (unint64_t *)&qword_2574B34C0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for RapportController.Change.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24584F0AC + 4 * byte_24585B86F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24584F0E0 + 4 * byte_24585B86A[v4]))();
}

uint64_t sub_24584F0E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24584F0E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24584F0F0);
  return result;
}

uint64_t sub_24584F0FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24584F104);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24584F108(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24584F110(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RapportController.Change.Kind()
{
  return &type metadata for RapportController.Change.Kind;
}

unint64_t sub_24584F130()
{
  unint64_t result;

  result = qword_2574B4B80[0];
  if (!qword_2574B4B80[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585BA00, &type metadata for RapportController.Change.Kind);
    atomic_store(result, qword_2574B4B80);
  }
  return result;
}

uint64_t sub_24584F194(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)(*(uint64_t (**)(void))(a2 + 16))();
  v3 = sub_24585A5FC();

  return v3;
}

uint64_t sub_24584F1D8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v21 = a2;
  v22 = a4;
  v12 = a3 & 1;
  v13 = sub_24585A398();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a7 + 16))(a6, a7);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  v18 = *(_QWORD *)(a7 + 8);
  swift_unknownObjectRetain();
  swift_retain();
  v19 = sub_24584FB18(v17, v7, (uint64_t)v16, v21, v12, v22, a5, a6, v18);

  swift_unknownObjectRelease();
  swift_release();
  return v19;
}

id sub_24584F2E8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v12;
  uint64_t v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[6];

  v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a6 + 16))(a5, a6);
  v13 = *(_QWORD *)(a6 + 8);
  v14 = (objc_class *)MEMORY[0x24BDD1710];
  swift_unknownObjectRetain();
  v15 = a1;
  v16 = a2;
  swift_retain();
  v17 = objc_msgSend(objc_allocWithZone(v14), sel_init);
  v18 = v15;
  objc_msgSend(v17, sel_setUnderlyingQueue_, v12);
  v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a5;
  v20[3] = v13;
  v20[4] = v19;
  v20[5] = v12;
  v20[6] = a3;
  v20[7] = a4;
  v26[4] = sub_2458501EC;
  v26[5] = v20;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 1107296256;
  v26[2] = sub_24584FA2C;
  v26[3] = &block_descriptor_1;
  v21 = _Block_copy(v26);
  v22 = v16;
  v23 = v17;
  v24 = v12;
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_addObserverForName_object_queue_usingBlock_, v22, 0, v23, v21);
  swift_release();

  swift_unknownObjectRelease();
  _Block_release(v21);

  return v18;
}

uint64_t sub_24584F4CC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t result;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  v11 = sub_24585A3A4();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t *)((char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  result = MEMORY[0x24953CFF0](a1 + 16);
  if (result)
  {
    *v14 = a2;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BEE5610], v11);
    v16 = a2;
    v17 = sub_24585A3B0();
    result = (*(uint64_t (**)(_QWORD *, uint64_t))(v12 + 8))(v14, v11);
    if ((v17 & 1) != 0)
    {
      MEMORY[0x24BDAC7A8](result);
      *(&v19 - 4) = a5;
      *(&v19 - 3) = a6;
      v18 = a4;
      sub_24584F640((uint64_t)sub_24585032C, (uint64_t)(&v19 - 6), (uint64_t)"ScreenContinuityServices/QueueIsolatedActor.swift", 49, 2, 70, a5, MEMORY[0x24BEE4AE0] + 8, a6);
      return swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24584F640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t result;
  int isEscapingClosureAtFileLocation;

  sub_24585A458();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    goto LABEL_6;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a7;
  v14[3] = a8;
  v14[4] = a9;
  v14[5] = a1;
  v14[6] = a2;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a7;
  v15[3] = a8;
  v15[4] = a9;
  v15[5] = sub_245850224;
  v15[6] = v14;
  swift_retain();
  sub_245850224();
  swift_release();
  if (v9)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    sub_24585A68C();
    sub_24585A434();
    sub_24585A7B8();
    sub_24585A434();
    result = sub_24585A6EC();
    __break(1u);
  }
  return result;
}

uint64_t sub_24584F80C()
{
  sub_24585A35C();
  sub_24583D380(&qword_2574B35B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B35B8);
  sub_2458502EC((unint64_t *)&unk_2574B35C0, &qword_2574B35B8);
  return sub_24585A638();
}

uint64_t sub_24584F8B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t result;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  v11 = sub_24585A3A4();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t *)((char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  result = MEMORY[0x24953CFF0](a1 + 16);
  if (result)
  {
    *v14 = a2;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BEE5610], v11);
    v16 = a2;
    v17 = sub_24585A3B0();
    result = (*(uint64_t (**)(_QWORD *, uint64_t))(v12 + 8))(v14, v11);
    if ((v17 & 1) != 0)
    {
      MEMORY[0x24BDAC7A8](result);
      *(&v19 - 4) = a5;
      *(&v19 - 3) = a6;
      v18 = a4;
      sub_24584F640((uint64_t)sub_245850388, (uint64_t)(&v19 - 6), (uint64_t)"ScreenContinuityServices/QueueIsolatedActor.swift", 49, 2, 120, a5, MEMORY[0x24BEE4AE0] + 8, a6);
      return swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_24584FA2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_24585A0B0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_24585A0A4();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_24584FAD0(void *a1, void *a2)
{
  objc_msgSend(a1, sel_removeObserver_);
  swift_unknownObjectRelease();

}

uint64_t sub_24584FB18(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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
  uint64_t (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t ObjectType;
  uint64_t v39;
  _QWORD *v40;
  void (*v41)(_QWORD *, _QWORD, uint64_t);
  uint64_t v42;
  _QWORD *v43;
  void (*v44)(_QWORD *, uint64_t);
  uint64_t v45;
  uint64_t v47;
  double v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD aBlock[7];

  v52 = a8;
  v53 = a6;
  v54 = a7;
  v59 = a5;
  v48 = *(double *)&a4;
  v63 = a3;
  v50 = a2;
  v51 = a9;
  v10 = sub_24585A350();
  v61 = *(_QWORD *)(v10 - 8);
  v62 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v49 = (uint64_t *)((char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v11);
  v60 = (uint64_t *)((char *)&v47 - v13);
  v14 = sub_24585A35C();
  v57 = *(_QWORD *)(v14 - 8);
  v58 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_24585A374();
  v55 = *(_QWORD *)(v17 - 8);
  v56 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_24585A590();
  v21 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE57C0];
  v22 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v47 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245850268();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_24583D380(&qword_2574B3598, v21, MEMORY[0x24BEE57D0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B35A0);
  sub_2458502EC(&qword_2574B35A8, &qword_2574B35A0);
  sub_24585A638();
  v25 = sub_24585A59C();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v20);
  swift_getObjectType();
  v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v27 = (_QWORD *)swift_allocObject();
  v28 = v51;
  v27[2] = v52;
  v27[3] = v28;
  v27[4] = v26;
  v27[5] = a1;
  v29 = v54;
  v27[6] = v53;
  v27[7] = v29;
  aBlock[4] = sub_2458502DC;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_245837C8C;
  aBlock[3] = &block_descriptor_16;
  v30 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_retain();
  v31 = a1;
  swift_retain();
  sub_24585A368();
  sub_24584F80C();
  sub_24585A5A8();
  _Block_release(v30);
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v16, v58);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v19, v56);
  swift_release();
  swift_release();
  if ((v59 & 1) != 0)
  {
    ObjectType = swift_getObjectType();
    v40 = v60;
    v39 = v61;
    v41 = *(void (**)(_QWORD *, _QWORD, uint64_t))(v61 + 104);
    v42 = v62;
    v41(v60, *MEMORY[0x24BEE5418], v62);
    v43 = v49;
    *v49 = 0;
    v41(v43, *MEMORY[0x24BEE5400], v42);
    swift_unknownObjectRetain();
    v37 = v63;
    MEMORY[0x24953C8E8](v63, v40, v43, ObjectType);
    swift_unknownObjectRelease();
    v44 = *(void (**)(_QWORD *, uint64_t))(v39 + 8);
    v44(v43, v42);
    v44(v40, v42);
  }
  else
  {
    v32 = v48;
    v33 = swift_getObjectType();
    v35 = v60;
    v34 = v61;
    *v60 = 0;
    v36 = v62;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v34 + 104))(v35, *MEMORY[0x24BEE5400], v62);
    swift_unknownObjectRetain();
    v37 = v63;
    MEMORY[0x24953C8F4](v63, v35, v33, v32);
    swift_unknownObjectRelease();
    (*(void (**)(_QWORD *, uint64_t))(v34 + 8))(v35, v36);
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  sub_24585A5C0();
  swift_unknownObjectRelease();
  v45 = sub_24585A398();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 8))(v37, v45);
  return v25;
}

uint64_t sub_24584FFB4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_24584FFC0()
{
  swift_getObjectType();
  sub_24585A5B4();
  return swift_unknownObjectRelease();
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *sub_24584FFF8(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_245850028(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_245850070(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_2458500AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&unk_24585E050);
}

uint64_t sub_2458500B8()
{
  return swift_allocateGenericValueMetadata();
}

void sub_2458500C0(void **a1)
{
  sub_24584FAD0(*a1, a1[1]);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_2458500E4(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_245850130(uint64_t *a1, int a2)
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

uint64_t sub_245850178(uint64_t result, int a2, int a3)
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

uint64_t sub_2458501B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&unk_24585E090);
}

uint64_t sub_2458501C4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2458501EC()
{
  uint64_t v0;

  return sub_24584F8B8(*(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
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

uint64_t sub_245850214()
{
  return swift_deallocObject();
}

uint64_t sub_245850224()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 40))();
}

uint64_t sub_245850244()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_245850268()
{
  unint64_t result;

  result = qword_2574B3590;
  if (!qword_2574B3590)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2574B3590);
  }
  return result;
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2458502DC()
{
  uint64_t v0;

  return sub_24584F4CC(*(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2458502EC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24953CEC4](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24585032C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24953CE70](a1, v6, a5);
}

uint64_t sub_245850388()
{
  return sub_24585032C();
}

uint64_t sub_2458503A4()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_2458503D8();
  return v0;
}

uint64_t sub_2458503D8()
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
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  _QWORD v27[2];
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = v0;
  v2 = sub_24585A14C();
  v29 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v27[0] = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544177E8);
  MEMORY[0x24BDAC7A8](v4);
  v28 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24585A584();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24585A5CC();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930];
  MEMORY[0x24BDAC7A8](v10);
  v12 = sub_24585A374();
  MEMORY[0x24BDAC7A8](v12);
  v27[1] = sub_24584B3B0();
  sub_24585A368();
  v31 = MEMORY[0x24BEE4AF8];
  sub_24583D380((unint64_t *)&unk_254417800, v11, MEMORY[0x24BEE5940]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544177F0);
  sub_2458383AC(&qword_2544177F8, &qword_2544177F0, MEMORY[0x24BEE12C8]);
  sub_24585A638();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5758], v6);
  *(_QWORD *)(v0 + 16) = sub_24585A5D8();
  v13 = OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_notificationCenter;
  *(_QWORD *)(v1 + v13) = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer) = 0;
  v14 = OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_remoteNotificationName;
  *(_QWORD *)(v1 + v14) = sub_24585A3EC();
  v15 = (_QWORD *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer);
  v15[1] = 0;
  v15[2] = 0;
  *v15 = 0;
  v16 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo) = v16;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers) = v16;
  *(_QWORD *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_activeDeviceIDs) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer) = 0;
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1580]), sel_init);
  v18 = (void *)sub_24585A3EC();
  v19 = objc_msgSend(v17, sel_containerURLForSecurityApplicationGroupIdentifier_, v18);

  if (v19)
  {
    v20 = v27[0];
    sub_24585A134();

    v22 = v28;
    v21 = v29;
    v23 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 32);
    v24 = v20;
    v25 = v30;
    v23(v28, v24, v30);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v22, 0, 1, v25);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v22, 1, v25);
    if ((_DWORD)result != 1)
    {
      v23((char *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_containerURL), (uint64_t)v22, v25);
      return v1;
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v28, 1, 1, v30);
  }
  __break(1u);
  return result;
}

uint64_t sub_2458507D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_24585A110();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDCD7A0], v0);
  sub_245859420();
  sub_24585A140();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

unint64_t sub_24585089C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  _QWORD v24[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37D0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3798);
  v6 = sub_24585A710();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (uint64_t)&v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_24583D2F8(v12, (uint64_t)v5, &qword_2574B37D0);
    result = sub_245838F7C((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_24585A1E8();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    v19 = v7[7];
    v20 = type metadata accessor for Session(0);
    result = sub_245855EA4(v9, v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v16, type metadata accessor for Session);
    v21 = v7[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_11;
    v7[2] = v23;
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

uint64_t sub_245850A54(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  void (*v16)(char *, uint64_t);
  void *v17;
  unsigned int v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29[2];

  v29[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = sub_24585A14C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v26 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v26 - v11;
  sub_24585A0F8();
  swift_allocObject();
  sub_24585A0EC();
  v29[0] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3668);
  sub_245859308();
  v13 = sub_24585A0E0();
  if (!v1)
  {
    v27 = v13;
    v28 = v14;
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1580]), sel_init);
    sub_2458507D8();
    sub_24585A128();
    v16 = *(void (**)(char *, uint64_t))(v4 + 8);
    v16(v10, v3);
    v17 = (void *)sub_24585A11C();
    v16(v12, v3);
    v29[0] = 0;
    v18 = objc_msgSend(v15, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v17, 1, 0, v29);

    v19 = v29[0];
    if (v18)
    {
      sub_2458507D8();
      v21 = v27;
      v20 = v28;
      sub_24585A164();
      v16(v7, v3);
      v22 = v21;
      v23 = v20;
    }
    else
    {
      v24 = v19;
      sub_24585A104();

      swift_willThrow();
      v22 = v27;
      v23 = v28;
    }
    sub_24583F820(v22, v23);
  }
  return swift_release();
}

uint64_t sub_245850CA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = sub_24585A350();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_24585A398();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v20 - v12;
  v14 = OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer;
  if (!*(_QWORD *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer))
  {
    sub_24585A380();
    *v5 = 120;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5420], v2);
    sub_24585A38C();
    (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
    v15 = *(void (**)(char *, uint64_t))(v7 + 8);
    v15(v10, v6);
    v16 = type metadata accessor for SessionManager(0);
    v17 = sub_24583D380(&qword_2574B3658, type metadata accessor for SessionManager, (uint64_t)&unk_24585BBC4);
    v18 = sub_24584F1D8((uint64_t)v13, 0, 1, (uint64_t)sub_245850E40, 0, v16, v17);
    v15(v13, v6);
    v19 = *(_QWORD *)(v1 + v14);
    *(_QWORD *)(v1 + v14) = v18;
    return sub_245855EE8(v19);
  }
  return result;
}

uint64_t sub_245850E40()
{
  return sub_245850E60();
}

uint64_t sub_245850E60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  _QWORD v18[5];

  v1 = sub_24585A14C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer) = 0;
  sub_245855EE8(v5);
  v6 = (uint64_t *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
  swift_beginAccess();
  v7 = *v6;
  swift_bridgeObjectRetain();
  sub_2458507D8();
  v8 = sub_24585A158();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_24585A0D4();
  swift_allocObject();
  sub_24585A0C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3668);
  sub_245855DB8();
  sub_24585A0BC();
  swift_release();
  sub_24583F820(v8, v10);
  v17 = v18[1];
  v11 = (_QWORD *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions);
  swift_beginAccess();
  *v11 = v17;
  swift_bridgeObjectRelease();
  v12 = swift_bridgeObjectRetain();
  v13 = sub_2458558A4(v12);
  swift_bridgeObjectRelease();
  *v6 = v13;
  v14 = swift_bridgeObjectRelease();
  sub_2458510B0(v14);
  v15 = *v6;
  swift_bridgeObjectRetain();
  LOBYTE(v13) = sub_2458553E4(v7, v15);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v13 & 1) == 0)
    return sub_2458514AC();
  return result;
}

uint64_t sub_2458510B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, unint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
  MEMORY[0x24BDAC7A8](v1);
  v45 = (uint64_t)&v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37A8);
  v3 = MEMORY[0x24BDAC7A8](v44);
  v43 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v41 = (char *)&v38 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v42 = (char *)&v38 - v7;
  v38 = v0;
  v8 = (uint64_t *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
  swift_beginAccess();
  v9 = *v8;
  v10 = *(_QWORD *)(*v8 + 64);
  v39 = *v8 + 64;
  v11 = 1 << *(_BYTE *)(v9 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v46 = v9;
  result = swift_bridgeObjectRetain_n();
  v15 = 0;
  v16 = (uint64_t)v41;
  while (v13)
  {
    v47 = (v13 - 1) & v13;
    v48 = v15;
    v17 = __clz(__rbit64(v13)) | (v15 << 6);
LABEL_5:
    v18 = v46;
    v19 = *(_QWORD *)(v46 + 48);
    v20 = sub_24585A1E8();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(void (**)(char *, unint64_t, uint64_t))(v21 + 16);
    v23 = (uint64_t)v42;
    v22(v42, v19 + *(_QWORD *)(v21 + 72) * v17, v20);
    v24 = *(_QWORD *)(v18 + 56);
    v25 = type metadata accessor for CompanionDevice.SessionInfo(0);
    v26 = v24 + *(_QWORD *)(*(_QWORD *)(v25 - 8) + 72) * v17;
    v27 = v44;
    sub_245844E38(v26, v23 + *(int *)(v44 + 48), type metadata accessor for CompanionDevice.SessionInfo);
    sub_24583D33C(v23, v16, &qword_2574B37A8);
    v28 = *(int *)(v27 + 48);
    v29 = v43;
    v30 = (uint64_t)&v43[v28];
    v31 = v16 + v28;
    v22(v43, v16, v20);
    sub_245844E38(v31, v30, type metadata accessor for CompanionDevice.SessionInfo);
    v32 = v45;
    sub_24583D2F8(v30 + *(int *)(v25 + 20), v45, &qword_2574B2E68);
    sub_24584533C(v30, type metadata accessor for CompanionDevice.SessionInfo);
    v33 = sub_24585A1A0();
    LODWORD(v25) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 48))(v32, 1, v33);
    sub_24583AE20(v32, &qword_2574B2E68);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v29, v20);
    result = sub_24583AE20(v16, &qword_2574B37A8);
    v13 = v47;
    v15 = v48;
    if ((_DWORD)v25 == 1)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return sub_245850CA0();
    }
  }
  v34 = v15 + 1;
  if (__OFADD__(v15, 1))
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v34 >= v40)
    goto LABEL_26;
  v35 = *(_QWORD *)(v39 + 8 * v34);
  v36 = v15 + 1;
  if (v35)
    goto LABEL_24;
  v36 = v15 + 2;
  if (v15 + 2 >= v40)
    goto LABEL_26;
  v35 = *(_QWORD *)(v39 + 8 * v36);
  if (v35)
    goto LABEL_24;
  v36 = v15 + 3;
  if (v15 + 3 >= v40)
    goto LABEL_26;
  v35 = *(_QWORD *)(v39 + 8 * v36);
  if (v35)
    goto LABEL_24;
  v36 = v15 + 4;
  if (v15 + 4 >= v40)
    goto LABEL_26;
  v35 = *(_QWORD *)(v39 + 8 * v36);
  if (v35)
    goto LABEL_24;
  v36 = v15 + 5;
  if (v15 + 5 >= v40)
    goto LABEL_26;
  v35 = *(_QWORD *)(v39 + 8 * v36);
  if (v35)
  {
LABEL_24:
    v47 = (v35 - 1) & v35;
    v48 = v36;
    v17 = __clz(__rbit64(v35)) + (v36 << 6);
    goto LABEL_5;
  }
  v37 = v15 + 6;
  if (v15 + 6 >= v40)
  {
LABEL_26:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  v35 = *(_QWORD *)(v39 + 8 * v37);
  if (v35)
  {
    v36 = v15 + 6;
    goto LABEL_24;
  }
  while (1)
  {
    v36 = v37 + 1;
    if (__OFADD__(v37, 1))
      break;
    if (v36 >= v40)
      goto LABEL_26;
    v35 = *(_QWORD *)(v39 + 8 * v36);
    ++v37;
    if (v35)
      goto LABEL_24;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_2458514AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t result;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3630);
  v29 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3648);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v26 - v10;
  v12 = (uint64_t *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers);
  swift_beginAccess();
  v13 = *v12;
  v14 = *(_QWORD *)(v13 + 64);
  v27 = v13 + 64;
  v15 = 1 << *(_BYTE *)(v13 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v14;
  v18 = (uint64_t *)(v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
  swift_bridgeObjectRetain();
  result = swift_beginAccess();
  v20 = 0;
  v28 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v21 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v22 = v21 | (v20 << 6);
      goto LABEL_5;
    }
    v23 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v23 >= v28)
      return swift_release();
    v24 = *(_QWORD *)(v27 + 8 * v23);
    ++v20;
    if (!v24)
    {
      v20 = v23 + 1;
      if (v23 + 1 >= v28)
        return swift_release();
      v24 = *(_QWORD *)(v27 + 8 * v20);
      if (!v24)
      {
        v20 = v23 + 2;
        if (v23 + 2 >= v28)
          return swift_release();
        v24 = *(_QWORD *)(v27 + 8 * v20);
        if (!v24)
        {
          v20 = v23 + 3;
          if (v23 + 3 >= v28)
            return swift_release();
          v24 = *(_QWORD *)(v27 + 8 * v20);
          if (!v24)
            break;
        }
      }
    }
LABEL_22:
    v17 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v20 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, *(_QWORD *)(v13 + 56) + *(_QWORD *)(v6 + 72) * v22, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
    v31 = *v18;
    swift_bridgeObjectRetain();
    sub_24585A524();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v4, v30);
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  v25 = v23 + 4;
  if (v25 >= v28)
    return swift_release();
  v24 = *(_QWORD *)(v27 + 8 * v25);
  if (v24)
  {
    v20 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    v20 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v20 >= v28)
      return swift_release();
    v24 = *(_QWORD *)(v27 + 8 * v20);
    ++v25;
    if (v24)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_245851780(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v14;
  _QWORD v15[8];

  v2 = sub_24585A14C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2458507D8();
  v6 = sub_24585A158();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_24585A0D4();
  swift_allocObject();
  sub_24585A0C8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3668);
  sub_245855DB8();
  sub_24585A0BC();
  swift_release();
  sub_24583F820(v6, v8);
  v14 = v15[4];
  v9 = (_QWORD *)(a1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions);
  swift_beginAccess();
  *v9 = v14;
  swift_bridgeObjectRelease();
  v10 = swift_bridgeObjectRetain();
  v11 = sub_2458558A4(v10);
  swift_bridgeObjectRelease();
  v12 = (uint64_t *)(a1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
  swift_beginAccess();
  *v12 = v11;
  swift_bridgeObjectRelease();
  sub_2458514AC();
  return sub_2458510B0();
}

uint64_t sub_245851978(uint64_t a1)
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
  uint64_t result;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3638);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24585A1E8();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v10 + 16))(v9, a1);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3648);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 1, 1, v11);
  v12 = v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers;
  swift_beginAccess();
  sub_245851AB0((uint64_t)v6, (uint64_t)v9);
  result = swift_endAccess();
  if (!*(_QWORD *)(*(_QWORD *)v12 + 16))
  {
    v14 = (_QWORD *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer);
    v15 = *(_QWORD *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer);
    v16 = *(_QWORD *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer + 8);
    v17 = *(_QWORD *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer + 16);
    v14[1] = 0;
    v14[2] = 0;
    *v14 = 0;
    return sub_2458526AC(v15, v16, v17);
  }
  return result;
}

uint64_t sub_245851AB0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3638);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3648);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_24583AE20(a1, &qword_2574B3638);
    sub_245856EF8(a2, (uint64_t)v8);
    v13 = sub_24585A1E8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a2, v13);
    return sub_24583AE20((uint64_t)v8, &qword_2574B3638);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v3;
    *v3 = 0x8000000000000000;
    sub_245857708((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v18;
    swift_bridgeObjectRelease();
    v16 = sub_24585A1E8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_245851C40(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(_QWORD), uint64_t *a5)
{
  uint64_t *v5;
  uint64_t *v9;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v9 = v5;
  v12 = __swift_instantiateConcreteTypeFromMangledName(a3);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a4(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v23 - v16;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 48))(a1, 1) == 1)
  {
    sub_24583AE20(a1, a3);
    sub_24585703C(a2, a4, a5, (uint64_t)v14);
    v19 = sub_24585A1E8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(a2, v19);
    return sub_24583AE20((uint64_t)v14, a3);
  }
  else
  {
    sub_245855EA4(a1, (uint64_t)v17, a4);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = *v9;
    *v9 = 0x8000000000000000;
    sub_245857894((uint64_t)v17, a2, isUniquelyReferenced_nonNull_native, a4, a5);
    *v9 = v24;
    swift_bridgeObjectRelease();
    v22 = sub_24585A1E8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(a2, v22);
  }
}

uint64_t sub_245851DD0@<X0>(uint64_t a1@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  void (*v45)(char *, char *, uint64_t);
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  char *v59;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
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

  v68 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3630);
  v72 = *(_QWORD *)(v1 - 8);
  v73 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v71 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3638);
  MEMORY[0x24BDAC7A8](v3);
  v70 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_24585A14C();
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v65 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3640);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3648);
  v77 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_24585A1E8();
  v12 = *(_QWORD *)(v76 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x24BDAC7A8](v76);
  v15 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v61 - v16;
  sub_24585A1DC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3650);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE6CA0], v6);
  sub_24585A500();
  v18 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19 = v75;
  v18(v9, v6);
  v20 = v19 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers;
  swift_beginAccess();
  v21 = *(_QWORD *)(*(_QWORD *)v20 + 16);
  v74 = v17;
  if (!v21)
  {
    v22 = v65;
    v23 = v66;
    v63 = v13;
    v64 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    v68 = v12;
    v62 = v11;
    v24 = v19;
    v25 = (uint64_t *)(v19 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer);
    if (!*v25)
    {
      v26 = *(void **)(v24 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_notificationCenter);
      v27 = *(void **)(v24 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_remoteNotificationName);
      v28 = type metadata accessor for SessionManager(0);
      v29 = sub_24583D380(&qword_2574B3658, type metadata accessor for SessionManager, (uint64_t)&unk_24585BBC4);
      v30 = sub_24584F2E8(v26, v27, (uint64_t)sub_245851780, 0, v28, v29);
      v31 = *v25;
      v32 = v25[1];
      v33 = v25[2];
      *v25 = (uint64_t)v30;
      v25[1] = v34;
      v25[2] = v35;
      sub_2458526AC(v31, v32, v33);
    }
    sub_2458507D8();
    v36 = v24;
    v37 = sub_24585A158();
    v39 = v38;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v22, v67);
    sub_24585A0D4();
    swift_allocObject();
    sub_24585A0C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3668);
    sub_245855DB8();
    sub_24585A0BC();
    swift_release();
    sub_24583F820(v37, v39);
    v40 = v79;
    v41 = (_QWORD *)(v24 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions);
    swift_beginAccess();
    *v41 = v40;
    swift_bridgeObjectRelease();
    v42 = swift_bridgeObjectRetain();
    v43 = sub_2458558A4(v42);
    swift_bridgeObjectRelease();
    v44 = (uint64_t *)(v36 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
    swift_beginAccess();
    *v44 = v43;
    swift_bridgeObjectRelease();
    sub_2458510B0();
    v11 = v62;
    v12 = v68;
    v17 = v74;
    v15 = v64;
  }
  v45 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v46 = v17;
  v45(v15, v17, v76);
  v47 = v77;
  v48 = (uint64_t)v70;
  v49 = v69;
  (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v70, v11, v69);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v47 + 56))(v48, 0, 1, v49);
  swift_beginAccess();
  v50 = v11;
  sub_245851AB0(v48, (uint64_t)v15);
  swift_endAccess();
  v51 = swift_allocObject();
  v52 = v75;
  swift_weakInit();
  v53 = v76;
  v45(v15, v46, v76);
  v54 = (*(unsigned __int8 *)(v12 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v55 = swift_allocObject();
  *(_QWORD *)(v55 + 16) = v51;
  v56 = v55 + v54;
  v57 = v53;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v56, v15, v53);
  sub_24585A50C();
  v58 = (uint64_t *)(v52 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
  swift_beginAccess();
  v78 = *v58;
  swift_bridgeObjectRetain();
  v59 = v71;
  sub_24585A524();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v59, v73);
  (*(void (**)(char *, uint64_t))(v77 + 8))(v50, v49);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v74, v57);
}

uint64_t sub_245852468()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24585248C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;

  v3 = sub_24585A1E8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2CC0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v10 = result;
    v11 = sub_24585A4A0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v3);
    v12 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v13 = (char *)swift_allocObject();
    *((_QWORD *)v13 + 2) = 0;
    *((_QWORD *)v13 + 3) = 0;
    *((_QWORD *)v13 + 4) = v10;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v13[v12], (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
    sub_245836718((uint64_t)v8, (uint64_t)&unk_2574B37E8, (uint64_t)v13);
    return swift_release();
  }
  return result;
}

uint64_t sub_2458525F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_24585A1E8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_245852668()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_24585A1E8() - 8) + 80);
  return sub_24585248C(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t type metadata accessor for SessionManager(uint64_t a1)
{
  return sub_24583C7B0(a1, (uint64_t *)&unk_254417890);
}

uint64_t sub_2458526AC(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v4[3];

  if (result)
  {
    v4[0] = result;
    v4[1] = a2;
    v4[2] = a3;
    v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3660);
    return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v4, v3);
  }
  return result;
}

uint64_t sub_2458526F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  type metadata accessor for SessionManager(0);
  sub_24583D380((unint64_t *)&unk_2574B30C8, type metadata accessor for SessionManager, (uint64_t)&unk_24585BB9C);
  sub_24585A458();
  return swift_task_switch();
}

uint64_t sub_245852768()
{
  uint64_t v0;

  sub_245851978(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245852798(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
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

  v3 = sub_24585A350();
  v32 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v34 = sub_24585A398();
  v31 = *(_QWORD *)(v34 - 8);
  v6 = MEMORY[0x24BDAC7A8](v34);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v30 - v9;
  v11 = sub_24585A1E8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v30 - v16;
  v35 = v1;
  v18 = v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_activeDeviceIDs;
  swift_beginAccess();
  v19 = *(_QWORD *)(*(_QWORD *)v18 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a1, v11);
  swift_beginAccess();
  sub_245858138((uint64_t)v17, v15);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  result = swift_endAccess();
  if (!v19)
  {
    sub_24585A380();
    *v5 = 60;
    v22 = v32;
    v21 = v33;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v32 + 104))(v5, *MEMORY[0x24BEE5420], v33);
    sub_24585A38C();
    (*(void (**)(_QWORD *, uint64_t))(v22 + 8))(v5, v21);
    v23 = *(void (**)(char *, uint64_t))(v31 + 8);
    v24 = v34;
    v23(v8, v34);
    v25 = type metadata accessor for SessionManager(0);
    v26 = sub_24583D380(&qword_2574B3658, type metadata accessor for SessionManager, (uint64_t)&unk_24585BBC4);
    v27 = v35;
    v28 = sub_24584F1D8((uint64_t)v10, 0x404E000000000000, 0, (uint64_t)sub_245852A18, 0, v25, v26);
    v23(v10, v24);
    v29 = *(_QWORD *)(v27 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer);
    *(_QWORD *)(v27 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer) = v28;
    return sub_245855EE8(v29);
  }
  return result;
}

uint64_t sub_245852A18()
{
  return sub_245852A38();
}

uint64_t sub_245852A38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD *v4;
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  int64_t v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v51;
  char v52;
  unint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  char v59;
  _QWORD *v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  void *v65;
  uint64_t result;
  _QWORD v67[2];
  _QWORD *v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  _QWORD *v86;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3680);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v67 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (_QWORD *)type metadata accessor for Session(0);
  v81 = *(v4 - 1);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v74 = (uint64_t)v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v70 = (char *)v67 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v75 = (uint64_t)v67 - v9;
  v10 = sub_24585A1E8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v76 = (uint64_t)v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v67 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D80);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_24585A1A0();
  v72 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v71 = (char *)v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24585A194();
  v20 = (uint64_t *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_activeDeviceIDs);
  swift_beginAccess();
  v21 = *v20;
  v22 = *(_QWORD *)(*v20 + 56);
  v77 = *v20 + 56;
  v23 = 1 << *(_BYTE *)(v21 + 32);
  v24 = -1;
  if (v23 < 64)
    v24 = ~(-1 << v23);
  v25 = v24 & v22;
  v67[1] = v0;
  v26 = (_QWORD *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions);
  v80 = v21;
  swift_bridgeObjectRetain();
  v82 = v26;
  swift_beginAccess();
  v27 = 0;
  v28 = v23 + 63;
  v29 = v4;
  v78 = v28 >> 6;
  v69 = v3;
  v68 = v4;
  v79 = v15;
  while (1)
  {
    if (v25)
    {
      v30 = __clz(__rbit64(v25));
      v25 &= v25 - 1;
      v31 = v30 | (v27 << 6);
      goto LABEL_22;
    }
    v32 = v27 + 1;
    if (__OFADD__(v27, 1))
    {
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    if (v32 >= v78)
      goto LABEL_41;
    v33 = *(_QWORD *)(v77 + 8 * v32);
    ++v27;
    if (!v33)
    {
      v27 = v32 + 1;
      if (v32 + 1 >= v78)
        goto LABEL_41;
      v33 = *(_QWORD *)(v77 + 8 * v27);
      if (!v33)
      {
        v27 = v32 + 2;
        if (v32 + 2 >= v78)
          goto LABEL_41;
        v33 = *(_QWORD *)(v77 + 8 * v27);
        if (!v33)
          break;
      }
    }
LABEL_21:
    v25 = (v33 - 1) & v33;
    v31 = __clz(__rbit64(v33)) + (v27 << 6);
LABEL_22:
    v35 = *(_QWORD *)(v11 + 72);
    v4 = *(_QWORD **)(v11 + 16);
    ((void (*)(char *, unint64_t, uint64_t))v4)(v18, *(_QWORD *)(v80 + 48) + v35 * v31, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v18, 0, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v18, 1, v10) == 1)
      goto LABEL_42;
    v83 = v27;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v18, v10);
    v36 = *v82;
    if (!*(_QWORD *)(*v82 + 16))
    {
      (*(void (**)(char *, uint64_t, uint64_t, _QWORD *))(v81 + 56))(v3, 1, 1, v29);
      goto LABEL_5;
    }
    swift_bridgeObjectRetain();
    v37 = sub_245838F7C((uint64_t)v15);
    if ((v38 & 1) != 0)
    {
      v39 = v81;
      sub_245844E38(*(_QWORD *)(v36 + 56) + *(_QWORD *)(v81 + 72) * v37, (uint64_t)v3, type metadata accessor for Session);
      v40 = 0;
    }
    else
    {
      v40 = 1;
      v39 = v81;
    }
    (*(void (**)(char *, uint64_t, uint64_t, _QWORD *))(v39 + 56))(v3, v40, 1, v29);
    swift_bridgeObjectRelease();
    v41 = (*(uint64_t (**)(char *, uint64_t, _QWORD *))(v39 + 48))(v3, 1, v29);
    v15 = v79;
    if (v41 == 1)
    {
LABEL_5:
      (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
      sub_24583AE20((uint64_t)v3, &qword_2574B3680);
      v27 = v83;
    }
    else
    {
      v42 = v75;
      sub_245855EA4((uint64_t)v3, v75, type metadata accessor for Session);
      if ((*(_BYTE *)(v42 + *((int *)v29 + 5)) & 1) != 0)
      {
        sub_24584533C(v42, type metadata accessor for Session);
        (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
        v27 = v83;
      }
      else
      {
        v43 = v42;
        ((void (*)(uint64_t, char *, uint64_t))v4)(v76, v15, v10);
        v44 = v29;
        v45 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 16);
        v46 = (uint64_t)v70;
        v47 = v43;
        v48 = v73;
        v45(v70, v47, v73);
        v45((char *)(v46 + *((int *)v44 + 6)), (uint64_t)v71, v48);
        *(_BYTE *)(v46 + *((int *)v44 + 5)) = 0;
        v49 = v82;
        swift_beginAccess();
        sub_245855EA4(v46, v74, type metadata accessor for Session);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v86 = (_QWORD *)*v49;
        v51 = v86;
        *v49 = 0x8000000000000000;
        v53 = sub_245838F7C(v76);
        v54 = v51[2];
        v55 = (v52 & 1) == 0;
        v56 = v54 + v55;
        if (__OFADD__(v54, v55))
          goto LABEL_44;
        v57 = v52;
        if (v51[3] >= v56)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_245857E74(type metadata accessor for Session, &qword_2574B3798);
        }
        else
        {
          sub_245856B04(v56, isUniquelyReferenced_nonNull_native, type metadata accessor for Session, &qword_2574B3798);
          v58 = sub_245838F7C(v76);
          if ((v57 & 1) != (v59 & 1))
            goto LABEL_47;
          v53 = v58;
        }
        v3 = v69;
        v60 = v86;
        if ((v57 & 1) != 0)
        {
          v4 = type metadata accessor for Session;
          sub_2458593DC(v74, v86[7] + *(_QWORD *)(v81 + 72) * v53, type metadata accessor for Session);
        }
        else
        {
          v86[(v53 >> 6) + 8] |= 1 << v53;
          ((void (*)(unint64_t, uint64_t, uint64_t))v4)(v60[6] + v53 * v35, v76, v10);
          v4 = type metadata accessor for Session;
          sub_245855EA4(v74, v60[7] + *(_QWORD *)(v81 + 72) * v53, type metadata accessor for Session);
          v61 = v60[2];
          v62 = __OFADD__(v61, 1);
          v63 = v61 + 1;
          if (v62)
            goto LABEL_46;
          v60[2] = v63;
          v60 = v86;
        }
        *v82 = v60;
        swift_bridgeObjectRelease();
        v64 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
        v64(v76, v10);
        swift_endAccess();
        sub_24584533C(v75, type metadata accessor for Session);
        v15 = v79;
        v64((uint64_t)v79, v10);
        v29 = v68;
        v27 = v83;
      }
    }
  }
  v34 = v32 + 3;
  if (v34 >= v78)
  {
LABEL_41:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v18, 1, 1, v10);
LABEL_42:
    swift_release();
    v65 = (void *)swift_bridgeObjectRetain();
    sub_245850A54(v65);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v71, v73);
  }
  v33 = *(_QWORD *)(v77 + 8 * v34);
  if (v33)
  {
    v27 = v34;
    goto LABEL_21;
  }
  while (1)
  {
    v27 = v34 + 1;
    if (__OFADD__(v34, 1))
      break;
    if (v27 >= v78)
      goto LABEL_41;
    v33 = *(_QWORD *)(v77 + 8 * v27);
    ++v34;
    if (v33)
      goto LABEL_21;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  sub_24585A7E8();
  __break(1u);
  v84 = 0;
  v85 = 0xE000000000000000;
  sub_24585A68C();
  sub_24585A434();
  v86 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2DC0);
  sub_24585A6C8();
  result = sub_24585A6EC();
  __break(1u);
  return result;
}

uint64_t sub_245853280(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2D80);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_activeDeviceIDs;
  swift_beginAccess();
  sub_245858E50(a1, (uint64_t)v6);
  sub_24583AE20((uint64_t)v6, &qword_2574B2D80);
  result = swift_endAccess();
  if (!*(_QWORD *)(*(_QWORD *)v7 + 16))
  {
    v9 = *(_QWORD *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer);
    *(_QWORD *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer) = 0;
    return sub_245855EE8(v9);
  }
  return result;
}

uint64_t sub_245853358(uint64_t a1)
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  void (*v46)(_QWORD, _QWORD, _QWORD);
  uint64_t *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (**v58)(char *, uint64_t);
  char *v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t, uint64_t, uint64_t);
  int v69;
  _BYTE *v70;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD *v75;
  uint64_t *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  void (*v83)(_QWORD, _QWORD, _QWORD);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  uint64_t v89;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3680);
  MEMORY[0x24BDAC7A8](v4);
  v79 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_24585A1E8();
  v75 = *(_QWORD **)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v82 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24585A1A0();
  v83 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 - 8);
  v84 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v87 = (char *)&v72 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v78 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v74 = (void (*)(char *, uint64_t, uint64_t, uint64_t))((char *)&v72 - v15);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v77 = (uint64_t)&v72 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v72 - v19;
  v86 = type metadata accessor for CompanionDevice.SessionInfo(0);
  v21 = *(_QWORD *)(v86 - 8);
  MEMORY[0x24BDAC7A8](v86);
  v72 = (uint64_t)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_24585A14C();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v72 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers;
  swift_beginAccess();
  v73 = v27;
  v28 = *(_QWORD *)(*(_QWORD *)v27 + 16);
  v29 = 0x254417000;
  v85 = a1;
  v80 = v10;
  if (v28)
  {
    v30 = v86;
    v31 = v89;
  }
  else
  {
    sub_2458507D8();
    v32 = (void *)v89;
    v89 = sub_24585A158();
    if (v32)
    {

      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      v34 = sub_24585089C(MEMORY[0x24BEE4AF8]);
    }
    else
    {
      v35 = v33;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      sub_24585A0D4();
      swift_allocObject();
      sub_24585A0C8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3668);
      sub_245855DB8();
      v36 = v89;
      sub_24585A0BC();
      swift_release();
      sub_24583F820(v36, v35);
      v34 = v88;
    }
    a1 = v85;
    v37 = (unint64_t *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions);
    swift_beginAccess();
    *v37 = v34;
    swift_bridgeObjectRelease();
    v38 = swift_bridgeObjectRetain();
    v39 = sub_2458558A4(v38);
    v31 = 0;
    swift_bridgeObjectRelease();
    v40 = (uint64_t *)(v2 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
    swift_beginAccess();
    *v40 = v39;
    swift_bridgeObjectRelease();
    v29 = 0x254417000uLL;
    v30 = v86;
  }
  v41 = (uint64_t *)(v2 + *(_QWORD *)(v29 + 2072));
  swift_beginAccess();
  v42 = *v41;
  v43 = *(_QWORD *)(*v41 + 16);
  v89 = v31;
  v76 = v41;
  if (!v43)
  {
    v46 = v83;
    v48 = v2;
    v74 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
    v74(v20, 1, 1, v30);
LABEL_14:
    v49 = v75;
    sub_24583AE20((uint64_t)v20, &qword_2574B2E78);
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  v44 = sub_245838F7C(a1);
  v46 = v83;
  if ((v45 & 1) != 0)
  {
    sub_245844E38(*(_QWORD *)(v42 + 56) + *(_QWORD *)(v21 + 72) * v44, (uint64_t)v20, type metadata accessor for CompanionDevice.SessionInfo);
    v47 = *(uint64_t **)(v21 + 56);
    ((void (*)(char *, _QWORD, uint64_t, uint64_t))v47)(v20, 0, 1, v30);
  }
  else
  {
    v47 = *(uint64_t **)(v21 + 56);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v47)(v20, 1, 1, v30);
  }
  v48 = v2;
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v20, 1, v30) == 1)
  {
    v74 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v47;
    goto LABEL_14;
  }
  v66 = v72;
  sub_245855EA4((uint64_t)v20, v72, type metadata accessor for CompanionDevice.SessionInfo);
  v67 = v66 + *(int *)(v30 + 20);
  v68 = v74;
  sub_24583D2F8(v67, (uint64_t)v74, &qword_2574B2E68);
  v69 = (*((uint64_t (**)(void (*)(char *, uint64_t, uint64_t, uint64_t), uint64_t, uint64_t))v46 + 6))(v68, 1, v84);
  sub_24583AE20((uint64_t)v68, &qword_2574B2E68);
  if (v69 == 1)
  {
    sub_245855E60();
    swift_allocError();
    *v70 = 0;
    swift_willThrow();
    return sub_24584533C(v66, type metadata accessor for CompanionDevice.SessionInfo);
  }
  v74 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v47;
  sub_24584533C(v66, type metadata accessor for CompanionDevice.SessionInfo);
  v49 = v75;
LABEL_15:
  sub_24585A194();
  v83 = (void (*)(_QWORD, _QWORD, _QWORD))v49[2];
  v50 = (uint64_t)v82;
  v51 = v85;
  v52 = v81;
  v83(v82, v85, v81);
  v75 = (_QWORD *)*((_QWORD *)v46 + 2);
  v53 = (uint64_t)v79;
  v54 = v84;
  ((void (*)(char *, char *, uint64_t))v75)(v79, v87, v84);
  v55 = type metadata accessor for Session(0);
  sub_24585A194();
  *(_BYTE *)(v53 + *(int *)(v55 + 20)) = 0;
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v53, 0, 1, v55);
  swift_beginAccess();
  sub_245851C40(v53, v50, &qword_2574B3680, type metadata accessor for Session, &qword_2574B3798);
  swift_endAccess();
  v56 = v51;
  v57 = v48;
  v58 = (uint64_t (**)(char *, uint64_t))v46;
  v83(v50, v56, v52);
  v59 = v87;
  v60 = (uint64_t)v80;
  ((void (*)(char *, char *, uint64_t))v75)(v80, v87, v54);
  v61 = (void (*)(char *, uint64_t, uint64_t, uint64_t))*((_QWORD *)v46 + 7);
  v62 = (uint64_t)v78;
  v61(v78, 1, 1, v54);
  v63 = v77;
  sub_24583BAC4(v60, v62, v77);
  v74((char *)v63, 0, 1, v86);
  swift_beginAccess();
  sub_245851C40(v63, v50, &qword_2574B2E78, type metadata accessor for CompanionDevice.SessionInfo, &qword_2574B37C8);
  swift_endAccess();
  v64 = (void *)swift_bridgeObjectRetain();
  v65 = v89;
  sub_245850A54(v64);
  if (v65)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2458514AC();
    objc_msgSend(*(id *)(v57 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_notificationCenter), sel_postNotificationName_object_, *(_QWORD *)(v57 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_remoteNotificationName), 0);
    if (*(_QWORD *)(*(_QWORD *)v73 + 16))
      sub_245850CA0();
    sub_245852798(v85);
  }
  return v58[1](v59, v54);
}

uint64_t sub_245853BE8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  void (*v45)(char *, uint64_t, uint64_t, uint64_t);
  _BYTE *v46;
  char v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  char *v53;
  char *v54;
  char v55;
  void (*v56)(char *, _QWORD *);
  _QWORD *v57;
  uint64_t v58;
  char *v59;
  void (*v60)(char *, char *, _QWORD *);
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  _BYTE *v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t, uint64_t, uint64_t);
  void *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char *v84;
  _QWORD *v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;

  v3 = v2;
  v4 = v1;
  v93 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E78);
  MEMORY[0x24BDAC7A8](v5);
  v83 = (uint64_t)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = sub_24585A1E8();
  v81 = *(_QWORD *)(v89 - 8);
  MEMORY[0x24BDAC7A8](v89);
  v90 = (uint64_t)&v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = (_QWORD *)sub_24585A1A0();
  v92 = *(v85 - 1);
  v8 = MEMORY[0x24BDAC7A8](v85);
  v91 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v79 = (char *)&v76 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v87 = (char *)&v76 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v82 = (char *)&v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v84 = (char *)&v76 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3680);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v80 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v76 - v20;
  v95 = type metadata accessor for Session(0);
  v22 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95);
  v24 = (char *)&v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_24585A14C();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v76 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = v1 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observers;
  swift_beginAccess();
  v30 = 0x254417000;
  if (!*(_QWORD *)(*(_QWORD *)v29 + 16))
  {
    v88 = v24;
    v86 = v4;
    sub_2458507D8();
    v31 = sub_24585A158();
    if (v2)
    {

      (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
      v33 = sub_24585089C(MEMORY[0x24BEE4AF8]);
    }
    else
    {
      v34 = v31;
      v35 = v32;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
      sub_24585A0D4();
      swift_allocObject();
      sub_24585A0C8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3668);
      sub_245855DB8();
      sub_24585A0BC();
      swift_release();
      sub_24583F820(v34, v35);
      v33 = v94;
    }
    v4 = v86;
    v36 = (unint64_t *)(v86 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_sessions);
    swift_beginAccess();
    *v36 = v33;
    swift_bridgeObjectRelease();
    v37 = swift_bridgeObjectRetain();
    v38 = sub_2458558A4(v37);
    v3 = 0;
    swift_bridgeObjectRelease();
    v39 = (uint64_t *)(v4 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_interpretedSessionInfo);
    swift_beginAccess();
    *v39 = v38;
    swift_bridgeObjectRelease();
    v30 = 0x254417000uLL;
    v24 = v88;
  }
  v40 = v95;
  v41 = (uint64_t *)(v4 + *(_QWORD *)(v30 + 2160));
  swift_beginAccess();
  v42 = *v41;
  if (!*(_QWORD *)(*v41 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v21, 1, 1, v40);
LABEL_12:
    sub_24583AE20((uint64_t)v21, &qword_2574B3680);
    sub_245855E60();
    swift_allocError();
    *v46 = 1;
    return swift_willThrow();
  }
  swift_bridgeObjectRetain();
  v43 = sub_245838F7C(v93);
  if ((v44 & 1) != 0)
  {
    sub_245844E38(*(_QWORD *)(v42 + 56) + *(_QWORD *)(v22 + 72) * v43, (uint64_t)v21, type metadata accessor for Session);
    v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
    v45(v21, 0, 1, v40);
  }
  else
  {
    v45 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
    v45(v21, 1, 1, v40);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v21, 1, v40) == 1)
    goto LABEL_12;
  sub_245855EA4((uint64_t)v21, (uint64_t)v24, type metadata accessor for Session);
  v48 = v24[*(int *)(v40 + 20)];
  v49 = &v24[*(int *)(v40 + 24)];
  v88 = v24;
  v78 = v3;
  v77 = v45;
  if ((v48 & 1) != 0)
  {
    v50 = v92;
    v51 = (uint64_t)v84;
    v52 = v85;
    (*(void (**)(char *, char *, _QWORD *))(v92 + 16))(v84, v49, v85);
  }
  else
  {
    v53 = v87;
    sub_24585A17C();
    v54 = v79;
    sub_24585A194();
    v55 = sub_24585A170();
    v50 = v92;
    v56 = *(void (**)(char *, _QWORD *))(v92 + 8);
    v52 = v85;
    v56(v54, v85);
    v56(v53, v52);
    if ((v55 & 1) != 0)
    {
      v57 = *(_QWORD **)(v50 + 56);
      v51 = (uint64_t)v84;
      ((void (*)(char *, uint64_t, uint64_t, _QWORD *))v57)(v84, 1, 1, v52);
LABEL_19:
      v85 = v57;
      v86 = v4;
      sub_24583AE20(v51, &qword_2574B2E68);
      v58 = v93;
      sub_245853280(v93);
      v59 = v91;
      sub_24585A194();
      v84 = *(char **)(v81 + 16);
      ((void (*)(uint64_t, uint64_t, uint64_t))v84)(v90, v58, v89);
      v60 = *(void (**)(char *, char *, _QWORD *))(v50 + 16);
      v61 = (uint64_t)v80;
      v62 = v88;
      v60(v80, v88, v52);
      v63 = v95;
      v60((char *)(v61 + *(int *)(v95 + 24)), v59, v52);
      *(_BYTE *)(v61 + *(int *)(v63 + 20)) = 1;
      v77((char *)v61, 0, 1, v63);
      swift_beginAccess();
      v64 = v90;
      sub_245851C40(v61, v90, &qword_2574B3680, type metadata accessor for Session, &qword_2574B3798);
      swift_endAccess();
      v65 = v58;
      v66 = (uint64_t)v62;
      ((void (*)(uint64_t, uint64_t, uint64_t))v84)(v64, v65, v89);
      v67 = (uint64_t)v87;
      v60(v87, (char *)v66, v52);
      v68 = (uint64_t)v82;
      v60(v82, v59, v52);
      ((void (*)(uint64_t, _QWORD, uint64_t, _QWORD *))v85)(v68, 0, 1, v52);
      v69 = v83;
      sub_24583BAC4(v67, v68, v83);
      v70 = type metadata accessor for CompanionDevice.SessionInfo(0);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 56))(v69, 0, 1, v70);
      swift_beginAccess();
      v71 = v86;
      sub_245851C40(v69, v64, &qword_2574B2E78, type metadata accessor for CompanionDevice.SessionInfo, &qword_2574B37C8);
      swift_endAccess();
      v72 = (void *)swift_bridgeObjectRetain();
      v73 = v78;
      sub_245850A54(v72);
      swift_bridgeObjectRelease();
      if (!v73)
      {
        sub_2458514AC();
        objc_msgSend(*(id *)(v71 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_notificationCenter), sel_postNotificationName_object_, *(_QWORD *)(v71 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_remoteNotificationName), 0);
      }
      (*(void (**)(char *, _QWORD *))(v92 + 8))(v91, v52);
      v75 = v66;
      return sub_24584533C(v75, type metadata accessor for Session);
    }
    v51 = (uint64_t)v84;
    sub_24585A17C();
  }
  v57 = *(_QWORD **)(v50 + 56);
  ((void (*)(uint64_t, _QWORD, uint64_t, _QWORD *))v57)(v51, 0, 1, v52);
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v50 + 48))(v51, 1, v52) == 1)
    goto LABEL_19;
  sub_24583AE20(v51, &qword_2574B2E68);
  sub_245855E60();
  swift_allocError();
  *v74 = 2;
  swift_willThrow();
  v75 = (uint64_t)v88;
  return sub_24584533C(v75, type metadata accessor for Session);
}

uint64_t sub_245854574()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_containerURL;
  v2 = sub_24585A14C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  sub_245855EE8(*(_QWORD *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_deadlineTimer));
  sub_2458526AC(*(_QWORD *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer), *(_QWORD *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer + 8), *(_QWORD *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_observer + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_245855EE8(*(_QWORD *)(v0 + OBJC_IVAR____TtC24ScreenContinuityServices14SessionManager_keepAliveTimer));
  return v0;
}

uint64_t sub_245854658()
{
  sub_245854574();
  return swift_deallocClassInstance();
}

uint64_t sub_24585467C()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for SessionManager(0);
  v1 = sub_24583D380(&qword_2574B3658, type metadata accessor for SessionManager, (uint64_t)&unk_24585BBC4);
  return sub_24584F194(v0, v1);
}

id sub_2458546C4()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t sub_2458546CC()
{
  return 0;
}

void sub_2458546D8(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2458546E4()
{
  sub_245859D18();
  return sub_24585A878();
}

uint64_t sub_24585470C()
{
  sub_245859D18();
  return sub_24585A884();
}

uint64_t sub_245854734(_QWORD *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  char v19;
  char v20;

  v18 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3818);
  v16 = *(_QWORD *)(v3 - 8);
  v17 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3820);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3828);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245859C90();
  sub_24585A86C();
  if ((v18 & 1) != 0)
  {
    v20 = 1;
    sub_245859CD4();
    sub_24585A770();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    v19 = 0;
    sub_245859D18();
    sub_24585A770();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_2458548FC()
{
  _BYTE *v0;

  if (*v0)
    return 0x6465646E65;
  else
    return 0x657669746361;
}

uint64_t sub_245854930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245859750(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_245854954()
{
  sub_245859C90();
  return sub_24585A878();
}

uint64_t sub_24585497C()
{
  sub_245859C90();
  return sub_24585A884();
}

uint64_t sub_2458549A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_2458549D0()
{
  sub_245859CD4();
  return sub_24585A878();
}

uint64_t sub_2458549F8()
{
  sub_245859CD4();
  return sub_24585A884();
}

uint64_t sub_245854A20@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_245859830(a1);
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t sub_245854A4C(_QWORD *a1)
{
  unsigned __int8 *v1;

  return sub_245854734(a1, *v1);
}

uint64_t sub_245854A74(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  char v11;
  char v12;
  char v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3788);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24585663C();
  sub_24585A86C();
  v14 = 0;
  sub_24585A1A0();
  sub_24583D380(&qword_2574B3790, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
  sub_24585A788();
  if (!v2)
  {
    v13 = *(_BYTE *)(v3 + *(int *)(type metadata accessor for Session(0) + 20));
    v12 = 1;
    sub_2458566C4();
    sub_24585A788();
    v11 = 2;
    sub_24585A788();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_245854C1C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;
  char v39;

  v29 = a2;
  v31 = sub_24585A1A0();
  v34 = *(_QWORD *)(v31 - 8);
  v3 = MEMORY[0x24BDAC7A8](v31);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v30 = (char *)&v26 - v6;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3768);
  v7 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Session(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24585663C();
  v32 = v9;
  v13 = v35;
  sub_24585A860();
  if (v13)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v27 = v10;
  v28 = v5;
  v35 = v7;
  v14 = v12;
  v15 = v34;
  v39 = 0;
  v16 = sub_24583D380(&qword_2574B3770, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  v18 = v30;
  v17 = v31;
  v19 = v32;
  sub_24585A758();
  v26 = v16;
  v20 = *(char **)(v15 + 32);
  v21 = (uint64_t)v14;
  v22 = v20;
  ((void (*)(uint64_t, char *, uint64_t))v20)(v21, v18, v17);
  v37 = 1;
  sub_245856680();
  sub_24585A758();
  v30 = v22;
  v24 = v27;
  v23 = v28;
  *(_BYTE *)(v21 + *(int *)(v27 + 20)) = v38;
  v36 = 2;
  sub_24585A758();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v19, v33);
  ((void (*)(uint64_t, char *, uint64_t))v30)(v21 + *(int *)(v24 + 24), v23, v17);
  sub_245844E38(v21, v29, type metadata accessor for Session);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return sub_24584533C(v21, type metadata accessor for Session);
}

uint64_t sub_245854F44()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6574617473;
  if (*v0 != 1)
    v1 = 1716482913;
  if (*v0)
    return v1;
  else
    return 0x7472617473;
}

uint64_t sub_245854F90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245859B5C(a1, a2);
  *a3 = result;
  return result;
}

void sub_245854FB4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_245854FC0()
{
  sub_24585663C();
  return sub_24585A878();
}

uint64_t sub_245854FE8()
{
  sub_24585663C();
  return sub_24585A884();
}

uint64_t sub_245855010@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_245854C1C(a1, a2);
}

uint64_t sub_245855024(_QWORD *a1)
{
  return sub_245854A74(a1);
}

uint64_t sub_245855038(uint64_t a1, uint64_t a2)
{
  return sub_245855270(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_245855044(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_24585A3F8();
  *a2 = 0;
  return result;
}

uint64_t sub_2458550B8(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_24585A404();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_245855134@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_24585A410();
  v2 = sub_24585A3EC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_245855174@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_24585A3EC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2458551B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_24585A410();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2458551E0()
{
  sub_24583D380(&qword_2574B3778, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_24585BD9C);
  sub_24583D380(&qword_2574B3780, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_24585BD3C);
  return sub_24585A728();
}

uint64_t sub_245855264(uint64_t a1, uint64_t a2)
{
  return sub_245855270(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_245855270(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_24585A410();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2458552AC()
{
  sub_24585A410();
  sub_24585A428();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2458552EC()
{
  uint64_t v0;

  sub_24585A410();
  sub_24585A824();
  sub_24585A428();
  v0 = sub_24585A854();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24585535C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_24585A410();
  v2 = v1;
  if (v0 == sub_24585A410() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_24585A7C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2458553E4(uint64_t a1, uint64_t a2)
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
  char *v13;
  uint64_t result;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  int64_t v49;
  uint64_t v50;
  int64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  int64_t v57;
  _BOOL4 v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v55 = type metadata accessor for CompanionDevice.SessionInfo(0);
  v60 = *(_QWORD *)(v55 - 8);
  v4 = MEMORY[0x24BDAC7A8](v55);
  v54 = (uint64_t)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v49 - v6;
  v8 = sub_24585A1E8();
  v61 = *(_QWORD *)(v8 - 8);
  v62 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v56 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37A0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v49 - v15;
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v52 = a1;
  v53 = a2;
  v57 = 0;
  v19 = *(_QWORD *)(a1 + 64);
  v18 = a1 + 64;
  v17 = v19;
  v20 = 1 << *(_BYTE *)(v18 - 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & v17;
  v50 = v18;
  v51 = (unint64_t)(v20 + 63) >> 6;
  v49 = v51 - 1;
  while (1)
  {
    if (v22)
    {
      v23 = __clz(__rbit64(v22));
      v24 = (v22 - 1) & v22;
      v25 = v23 | (v57 << 6);
LABEL_8:
      v26 = v52;
      (*(void (**)(char *, unint64_t, uint64_t))(v61 + 16))(v13, *(_QWORD *)(v52 + 48) + *(_QWORD *)(v61 + 72) * v25, v62);
      v27 = *(_QWORD *)(v26 + 56) + *(_QWORD *)(v60 + 72) * v25;
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37A8);
      sub_245844E38(v27, (uint64_t)&v13[*(int *)(v28 + 48)], type metadata accessor for CompanionDevice.SessionInfo);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v13, 0, 1, v28);
      goto LABEL_30;
    }
    v29 = v57 + 1;
    if (__OFADD__(v57, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v29 < v51)
    {
      v30 = *(_QWORD *)(v50 + 8 * v29);
      if (v30)
        goto LABEL_12;
      v31 = v57 + 2;
      ++v57;
      if (v29 + 1 < v51)
      {
        v30 = *(_QWORD *)(v50 + 8 * v31);
        if (v30)
          goto LABEL_15;
        v57 = v29 + 1;
        if (v29 + 2 < v51)
        {
          v30 = *(_QWORD *)(v50 + 8 * (v29 + 2));
          if (v30)
          {
            v29 += 2;
            goto LABEL_12;
          }
          v57 = v29 + 2;
          if (v29 + 3 < v51)
          {
            v30 = *(_QWORD *)(v50 + 8 * (v29 + 3));
            if (v30)
            {
              v29 += 3;
              goto LABEL_12;
            }
            v31 = v29 + 4;
            v57 = v29 + 3;
            if (v29 + 4 < v51)
              break;
          }
        }
      }
    }
LABEL_29:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37A8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v13, 1, 1, v32);
    v24 = 0;
LABEL_30:
    sub_24583D33C((uint64_t)v13, (uint64_t)v16, &qword_2574B37A0);
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37A8);
    v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 48))(v16, 1, v33);
    v58 = v34 == 1;
    if (v34 == 1)
      return v58;
    v59 = v24;
    v35 = (uint64_t)&v16[*(int *)(v33 + 48)];
    v36 = v61;
    v37 = (uint64_t)v56;
    v38 = v16;
    v39 = v16;
    v40 = v62;
    (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v56, v39, v62);
    sub_245855EA4(v35, (uint64_t)v7, type metadata accessor for CompanionDevice.SessionInfo);
    v41 = v53;
    v42 = (uint64_t)v7;
    v43 = sub_245838F7C(v37);
    v45 = v44;
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v37, v40);
    if ((v45 & 1) == 0)
    {
      sub_24584533C(v42, type metadata accessor for CompanionDevice.SessionInfo);
      return 0;
    }
    v46 = *(_QWORD *)(v41 + 56) + *(_QWORD *)(v60 + 72) * v43;
    v47 = v54;
    sub_245844E38(v46, v54, type metadata accessor for CompanionDevice.SessionInfo);
    sub_24583D380(&qword_2574B2EA0, type metadata accessor for CompanionDevice.SessionInfo, (uint64_t)&protocol conformance descriptor for CompanionDevice.SessionInfo);
    v48 = sub_24585A3E0();
    sub_24584533C(v47, type metadata accessor for CompanionDevice.SessionInfo);
    result = sub_24584533C(v42, type metadata accessor for CompanionDevice.SessionInfo);
    v7 = (char *)v42;
    v16 = v38;
    v22 = v59;
    if ((v48 & 1) == 0)
      return v58;
  }
  v30 = *(_QWORD *)(v50 + 8 * v31);
  if (v30)
  {
LABEL_15:
    v29 = v31;
LABEL_12:
    v24 = (v30 - 1) & v30;
    v25 = __clz(__rbit64(v30)) + (v29 << 6);
    v57 = v29;
    goto LABEL_8;
  }
  while (1)
  {
    v29 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v29 >= v51)
    {
      v57 = v49;
      goto LABEL_29;
    }
    v30 = *(_QWORD *)(v50 + 8 * v29);
    ++v31;
    if (v30)
      goto LABEL_12;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2458558A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t i;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  void (*v40)(char *, char *, uint64_t);
  void (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  char *v43;
  char *v44;
  char v45;
  void (*v46)(char *, uint64_t);
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  int64_t v58;
  _QWORD *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int64_t v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B2E68);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24585A1A0();
  v73 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v56 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v55 = (char *)&v52 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v72 = (uint64_t)&v52 - v10;
  v11 = type metadata accessor for CompanionDevice.SessionInfo(0);
  v66 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v65 = (uint64_t)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Session(0);
  v63 = *(_QWORD *)(v13 - 8);
  v64 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_24585A1E8();
  v62 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v71 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v61 = (char *)&v52 - v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37C8);
  result = sub_24585A6F8();
  v21 = (uint64_t)v15;
  v22 = (uint64_t)v4;
  v23 = (_QWORD *)result;
  v24 = 0;
  v67 = a1;
  v27 = *(_QWORD *)(a1 + 64);
  v26 = a1 + 64;
  v25 = v27;
  v28 = 1 << *(_BYTE *)(v26 - 32);
  v29 = -1;
  if (v28 < 64)
    v29 = ~(-1 << v28);
  v30 = v29 & v25;
  v57 = v26;
  v58 = (unint64_t)(v28 + 63) >> 6;
  v59 = (_QWORD *)result;
  v60 = result + 64;
  v53 = v21;
  v54 = v4;
  if (!v30)
    goto LABEL_5;
LABEL_4:
  v68 = (v30 - 1) & v30;
  v69 = v24;
  for (i = __clz(__rbit64(v30)) | (v24 << 6); ; i = __clz(__rbit64(v33)) + (v34 << 6))
  {
    v36 = v67;
    v37 = *(_QWORD *)(v67 + 48);
    v39 = v61;
    v38 = v62;
    v70 = *(_QWORD *)(v62 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v62 + 16))(v61, v37 + v70, v16);
    sub_245844E38(*(_QWORD *)(v36 + 56) + *(_QWORD *)(v63 + 72) * i, v21, type metadata accessor for Session);
    v40 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
    v40(v71, v39, v16);
    v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 16);
    v41(v72, v21, v5);
    if ((*(_BYTE *)(v21 + *(int *)(v64 + 20)) & 1) != 0)
    {
      v41(v22, v21 + *(int *)(v64 + 24), v5);
      v42 = 0;
    }
    else
    {
      v43 = v55;
      sub_24585A17C();
      v44 = v56;
      sub_24585A194();
      v45 = sub_24585A170();
      v46 = *(void (**)(char *, uint64_t))(v73 + 8);
      v46(v44, v5);
      v46(v43, v5);
      if ((v45 & 1) != 0)
      {
        v42 = 1;
        v22 = (uint64_t)v54;
      }
      else
      {
        v22 = (uint64_t)v54;
        sub_24585A17C();
        v42 = 0;
      }
      v21 = v53;
    }
    v23 = v59;
    v47 = v70;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v73 + 56))(v22, v42, 1, v5);
    v48 = v65;
    sub_24583BAC4(v72, v22, v65);
    sub_24584533C(v21, type metadata accessor for Session);
    *(_QWORD *)(v60 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v40((char *)(v23[6] + v47), v71, v16);
    result = sub_245855EA4(v48, v23[7] + *(_QWORD *)(v66 + 72) * i, type metadata accessor for CompanionDevice.SessionInfo);
    v49 = v23[2];
    v50 = __OFADD__(v49, 1);
    v51 = v49 + 1;
    if (v50)
    {
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    v23[2] = v51;
    v30 = v68;
    v24 = v69;
    if (v68)
      goto LABEL_4;
LABEL_5:
    v32 = v24 + 1;
    if (__OFADD__(v24, 1))
      goto LABEL_30;
    if (v32 >= v58)
      return (uint64_t)v23;
    v33 = *(_QWORD *)(v57 + 8 * v32);
    v34 = v24 + 1;
    if (!v33)
    {
      v34 = v24 + 2;
      if (v24 + 2 >= v58)
        return (uint64_t)v23;
      v33 = *(_QWORD *)(v57 + 8 * v34);
      if (!v33)
      {
        v34 = v24 + 3;
        if (v24 + 3 >= v58)
          return (uint64_t)v23;
        v33 = *(_QWORD *)(v57 + 8 * v34);
        if (!v33)
          break;
      }
    }
LABEL_18:
    v68 = (v33 - 1) & v33;
    v69 = v34;
  }
  v35 = v24 + 4;
  if (v24 + 4 >= v58)
    return (uint64_t)v23;
  v33 = *(_QWORD *)(v57 + 8 * v35);
  if (v33)
  {
    v34 = v24 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v34 = v35 + 1;
    if (__OFADD__(v35, 1))
      break;
    if (v34 >= v58)
      return (uint64_t)v23;
    v33 = *(_QWORD *)(v57 + 8 * v34);
    ++v35;
    if (v33)
      goto LABEL_18;
  }
LABEL_31:
  __break(1u);
  return result;
}

unint64_t sub_245855DB8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2574B3670;
  if (!qword_2574B3670)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2574B3668);
    v2[0] = sub_24583D380(&qword_2574B3678, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v2[1] = sub_24585939C(qword_2574B4D90, (uint64_t)&unk_24585BE2C);
    result = MEMORY[0x24953CEC4](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2574B3670);
  }
  return result;
}

uint64_t type metadata accessor for Session(uint64_t a1)
{
  return sub_24583C7B0(a1, qword_2574B5020);
}

unint64_t sub_245855E60()
{
  unint64_t result;

  result = qword_2574B3688;
  if (!qword_2574B3688)
  {
    result = MEMORY[0x24953CEC4](&unk_24585BB5C, &type metadata for SessionError);
    atomic_store(result, (unint64_t *)&qword_2574B3688);
  }
  return result;
}

uint64_t sub_245855EA4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_245855EE8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v2 = result;
    v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3690);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(&v2, v1);
  }
  return result;
}

unint64_t sub_245855F2C()
{
  unint64_t result;

  result = qword_2574B3698;
  if (!qword_2574B3698)
  {
    result = MEMORY[0x24953CEC4](&unk_24585BAF4, &type metadata for SessionError);
    atomic_store(result, (unint64_t *)&qword_2574B3698);
  }
  return result;
}

uint64_t sub_245855F70(uint64_t a1)
{
  uint64_t result;

  result = sub_24583D380((unint64_t *)&unk_2574B30C8, type metadata accessor for SessionManager, (uint64_t)&unk_24585BB9C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

ValueMetadata *type metadata accessor for SessionError()
{
  return &type metadata for SessionError;
}

uint64_t sub_245855FC4()
{
  return type metadata accessor for SessionManager(0);
}

uint64_t sub_245855FCC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24585A14C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_24585607C()
{
  if (MEMORY[0x24BEE4F18])
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2574B36A0);
  else
    return MEMORY[0x24BEE4AE0] + 8;
}

uint64_t sub_2458560A4()
{
  if (MEMORY[0x24BEE4F18])
    return __swift_instantiateConcreteTypeFromMangledName(&qword_2574B36A8);
  else
    return MEMORY[0x24BEE4AE0] + 8;
}

uint64_t sub_2458560CC()
{
  return sub_2458383AC(&qword_2574B36B0, &qword_2574B36B8, MEMORY[0x24BEE6D38]);
}

void type metadata accessor for Name()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2574B36C0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2574B36C0);
  }
}

_QWORD *sub_24585614C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_24585A1A0();
    v8 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v9 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v8((_QWORD *)((char *)a1 + v9), (_QWORD *)((char *)a2 + v9), v7);
  }
  return a1;
}

uint64_t sub_2458561F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = sub_24585A1A0();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 24), v4);
}

uint64_t sub_245856258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_24585A1A0();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v7(a1 + v8, a2 + v8, v6);
  return a1;
}

uint64_t sub_2458562D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_24585A1A0();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t sub_24585634C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_24585A1A0();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v7(a1 + v8, a2 + v8, v6);
  return a1;
}

uint64_t sub_2458563C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v6 = sub_24585A1A0();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v7(a1 + v8, a2 + v8, v6);
  return a1;
}

uint64_t sub_24585643C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245856448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = sub_24585A1A0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 2)
    return v9 - 1;
  else
    return 0;
}

uint64_t sub_2458564C0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2458564CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_24585A1A0();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  return result;
}

uint64_t sub_245856544()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24585A1A0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2458565B8()
{
  return sub_24583D380(&qword_2574B3750, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_24585BD00);
}

uint64_t sub_2458565E4()
{
  return sub_24583D380(&qword_2574B3758, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_24585BCD4);
}

uint64_t sub_245856610()
{
  return sub_24583D380(&qword_2574B3760, (uint64_t (*)(uint64_t))type metadata accessor for Name, (uint64_t)&unk_24585BD70);
}

unint64_t sub_24585663C()
{
  unint64_t result;

  result = qword_2574B5430;
  if (!qword_2574B5430)
  {
    result = MEMORY[0x24953CEC4](&unk_24585BFD8, &type metadata for Session.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B5430);
  }
  return result;
}

unint64_t sub_245856680()
{
  unint64_t result;

  result = qword_2574B5438;
  if (!qword_2574B5438)
  {
    result = MEMORY[0x24953CEC4](&unk_24585BFB0, &type metadata for Session.State);
    atomic_store(result, (unint64_t *)&qword_2574B5438);
  }
  return result;
}

unint64_t sub_2458566C4()
{
  unint64_t result;

  result = qword_2574B5440;
  if (!qword_2574B5440)
  {
    result = MEMORY[0x24953CEC4](&unk_24585BF88, &type metadata for Session.State);
    atomic_store(result, (unint64_t *)&qword_2574B5440);
  }
  return result;
}

uint64_t sub_245856708(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[4];
  int v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3648);
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v50 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_24585A1E8();
  v49 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37F0);
  v11 = sub_24585A704();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v46 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v44 = v2;
  v45 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  v48 = v10;
  result = swift_retain();
  v19 = 0;
  v43 = a2;
  v20 = 16;
  if ((a2 & 1) != 0)
    v20 = 32;
  v47 = v20;
  v21 = v20;
  while (1)
  {
    if (v16)
    {
      v23 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v24 = v23 | (v19 << 6);
      goto LABEL_24;
    }
    v25 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45)
      break;
    v26 = v46;
    v27 = v46[v25];
    ++v19;
    if (!v27)
    {
      v19 = v25 + 1;
      if (v25 + 1 >= v45)
        goto LABEL_34;
      v27 = v46[v19];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          v40 = v48;
          swift_release();
          v3 = v44;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            v19 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v19 >= v45)
              goto LABEL_34;
            v27 = v46[v19];
            ++v28;
            if (v27)
              goto LABEL_23;
          }
        }
        v19 = v28;
      }
    }
LABEL_23:
    v16 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v19 << 6);
LABEL_24:
    v29 = v48;
    v30 = *(_QWORD *)(v49 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v49 + v21))(v9, *(_QWORD *)(v48 + 48) + v30 * v24, v7);
    v31 = *(_QWORD *)(v29 + 56);
    v32 = *(_QWORD *)(v51 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v51 + v21))(v50, v31 + v32 * v24, v52);
    sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_24585A3C8();
    v33 = -1 << *(_BYTE *)(v12 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v36 = 0;
      v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v38 = v35 == v37;
        if (v35 == v37)
          v35 = 0;
        v36 |= v38;
        v39 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v39 == -1);
      v22 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v49 + 32))(*(_QWORD *)(v12 + 48) + v30 * v22, v9, v7);
    result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v51 + 32))(*(_QWORD *)(v12 + 56) + v32 * v22, v50, v52);
    ++*(_QWORD *)(v12 + 16);
  }
  v40 = v48;
  swift_release();
  v3 = v44;
  v26 = v46;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v40 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v40 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

uint64_t sub_245856B04(uint64_t a1, int a2, uint64_t (*a3)(_QWORD), uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v6;
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
  unint64_t v20;
  uint64_t v21;
  uint64_t result;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  _QWORD *v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t i;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t (*v51)(_QWORD);

  v6 = v4;
  v51 = a3;
  v8 = a3(0);
  v48 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v50 = (uint64_t)&v44 - v9;
  v10 = sub_24585A1E8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  v49 = a2;
  v15 = sub_24585A704();
  v16 = v15;
  if (!*(_QWORD *)(v14 + 16))
    goto LABEL_41;
  v17 = 1 << *(_BYTE *)(v14 + 32);
  v18 = *(_QWORD *)(v14 + 64);
  v46 = (_QWORD *)(v14 + 64);
  if (v17 < 64)
    v19 = ~(-1 << v17);
  else
    v19 = -1;
  v20 = v19 & v18;
  v44 = v4;
  v45 = (unint64_t)(v17 + 63) >> 6;
  v21 = v15 + 64;
  result = swift_retain();
  v23 = 0;
  for (i = v14; ; v14 = i)
  {
    if (v20)
    {
      v25 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v26 = v25 | (v23 << 6);
      goto LABEL_22;
    }
    v27 = v23 + 1;
    if (__OFADD__(v23, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v27 >= v45)
      break;
    v28 = v46;
    v29 = v46[v27];
    ++v23;
    if (!v29)
    {
      v23 = v27 + 1;
      if (v27 + 1 >= v45)
        goto LABEL_34;
      v29 = v46[v23];
      if (!v29)
      {
        v30 = v27 + 2;
        if (v30 >= v45)
        {
LABEL_34:
          swift_release();
          v6 = v44;
          if ((v49 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v29 = v46[v30];
        if (!v29)
        {
          while (1)
          {
            v23 = v30 + 1;
            if (__OFADD__(v30, 1))
              goto LABEL_43;
            if (v23 >= v45)
              goto LABEL_34;
            v29 = v46[v23];
            ++v30;
            if (v29)
              goto LABEL_21;
          }
        }
        v23 = v30;
      }
    }
LABEL_21:
    v20 = (v29 - 1) & v29;
    v26 = __clz(__rbit64(v29)) + (v23 << 6);
LABEL_22:
    v31 = *(_QWORD *)(v11 + 72);
    v32 = *(_QWORD *)(v14 + 48) + v31 * v26;
    if ((v49 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v11 + 32))(v13, v32, v10);
      v33 = *(_QWORD *)(v14 + 56);
      v34 = *(_QWORD *)(v48 + 72);
      sub_245855EA4(v33 + v34 * v26, v50, v51);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v13, v32, v10);
      v35 = *(_QWORD *)(v14 + 56);
      v34 = *(_QWORD *)(v48 + 72);
      sub_245844E38(v35 + v34 * v26, v50, v51);
    }
    sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_24585A3C8();
    v36 = -1 << *(_BYTE *)(v16 + 32);
    v37 = result & ~v36;
    v38 = v37 >> 6;
    if (((-1 << v37) & ~*(_QWORD *)(v21 + 8 * (v37 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v37) & ~*(_QWORD *)(v21 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v39 = 0;
      v40 = (unint64_t)(63 - v36) >> 6;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v41 = v38 == v40;
        if (v38 == v40)
          v38 = 0;
        v39 |= v41;
        v42 = *(_QWORD *)(v21 + 8 * v38);
      }
      while (v42 == -1);
      v24 = __clz(__rbit64(~v42)) + (v38 << 6);
    }
    *(_QWORD *)(v21 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(*(_QWORD *)(v16 + 48) + v31 * v24, v13, v10);
    result = sub_245855EA4(v50, *(_QWORD *)(v16 + 56) + v34 * v24, v51);
    ++*(_QWORD *)(v16 + 16);
  }
  swift_release();
  v6 = v44;
  v28 = v46;
  if ((v49 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v43 = 1 << *(_BYTE *)(v14 + 32);
  if (v43 >= 64)
    bzero(v28, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v28 = -1 << v43;
  *(_QWORD *)(v14 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v6 = v16;
  return result;
}

uint64_t sub_245856EF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_245838F7C(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v17 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_245857B90();
      v9 = v17;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_24585A1E8();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    v12 = *(_QWORD *)(v9 + 56);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3648);
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a2, v12 + *(_QWORD *)(v14 + 72) * v6, v13);
    sub_245857188(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
  }
  else
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3648);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

uint64_t sub_24585703C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t *v7;
  unint64_t v10;
  char v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v7 = v4;
  swift_bridgeObjectRetain();
  v10 = sub_245838F7C(a1);
  LOBYTE(a1) = v11;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v7;
    v21 = *v7;
    *v7 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_245857E74(a2, a3);
      v13 = v21;
    }
    v14 = *(_QWORD *)(v13 + 48);
    v15 = sub_24585A1E8();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 72) * v10, v15);
    v16 = *(_QWORD *)(v13 + 56);
    v17 = a2(0);
    v18 = *(_QWORD *)(v17 - 8);
    sub_245855EA4(v16 + *(_QWORD *)(v18 + 72) * v10, a4, a2);
    sub_245857460(v10, v13, a2);
    *v7 = v13;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(a4, 0, 1, v17);
  }
  else
  {
    v20 = a2(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a4, 1, 1, v20);
  }
}

unint64_t sub_245857188(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unint64_t v36;
  uint64_t v37;

  v4 = sub_24585A1E8();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_24585A644();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v36 = (result + 1) & v11;
      v12 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v35(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = sub_24585A3C8();
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v8 = v14;
            if (v15 * a1 < v16
              || *(_QWORD *)(a2 + 48) + v15 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v16 + v15))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2574B3648) - 8) + 72);
            v24 = v23 * a1;
            result = v22 + v23 * a1;
            v25 = v23 * v10;
            v26 = v22 + v23 * v10 + v23;
            if (v24 < v25 || result >= v26)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v13 = v17;
            }
            else
            {
              a1 = v10;
              v13 = v17;
              if (v24 != v25)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v17;
                a1 = v10;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
        v12 = v15;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_245857460(int64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t (*v32)(_QWORD);
  void (*v33)(char *, unint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;

  v32 = a3;
  v5 = sub_24585A1E8();
  v34 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    v35 = a2 + 64;
    result = sub_24585A644();
    v12 = v35;
    if ((*(_QWORD *)(v35 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v13 = (result + 1) & v11;
      v14 = *(_QWORD *)(v34 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
      do
      {
        v15 = v14 * v10;
        v33(v8, *(_QWORD *)(a2 + 48) + v14 * v10, v5);
        sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v16 = sub_24585A3C8();
        result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v8, v5);
        v17 = v16 & v11;
        if (a1 >= (uint64_t)v13)
        {
          if (v17 < v13 || a1 < (uint64_t)v17)
            goto LABEL_6;
        }
        else if (v17 < v13 && a1 < (uint64_t)v17)
        {
          goto LABEL_6;
        }
        if (v14 * a1 < v15 || *(_QWORD *)(a2 + 48) + v14 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v15 + v14))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v14 * a1 != v15)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        v20 = *(_QWORD *)(a2 + 56);
        v21 = *(_QWORD *)(*(_QWORD *)(v32(0) - 8) + 72);
        v22 = v21 * a1;
        result = v20 + v21 * a1;
        v23 = v21 * v10;
        v24 = v20 + v21 * v10 + v21;
        if (v22 < v23 || result >= v24)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v22 == v23)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        v10 = (v10 + 1) & v11;
        v12 = v35;
      }
      while (((*(_QWORD *)(v35 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v26 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_245857708(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_24585A1E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_245838F7C(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3648);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_245857B90();
      goto LABEL_7;
    }
    sub_245856708(v17, a3 & 1);
    v24 = sub_245838F7C(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_245857A1C(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_24585A7E8();
  __break(1u);
  return result;
}

uint64_t sub_245857894(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(_QWORD), uint64_t *a5)
{
  _QWORD *v5;
  _QWORD **v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  unint64_t v26;
  char v27;
  uint64_t *v28;
  uint64_t v29;

  v28 = a5;
  v29 = a1;
  v7 = (_QWORD **)v5;
  v10 = sub_24585A1E8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (_QWORD *)*v5;
  v16 = sub_245838F7C(a2);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_14;
  }
  v20 = v15;
  v21 = v14[3];
  if (v21 >= v19 && (a3 & 1) != 0)
  {
LABEL_7:
    v22 = *v7;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7];
      v24 = a4(0);
      return sub_2458593DC(v29, v23 + *(_QWORD *)(*(_QWORD *)(v24 - 8) + 72) * v16, a4);
    }
    goto LABEL_11;
  }
  if (v21 >= v19 && (a3 & 1) == 0)
  {
    sub_245857E74(a4, v28);
    goto LABEL_7;
  }
  sub_245856B04(v19, a3 & 1, a4, v28);
  v26 = sub_245838F7C(a2);
  if ((v20 & 1) != (v27 & 1))
  {
LABEL_14:
    result = sub_24585A7E8();
    __break(1u);
    return result;
  }
  v16 = v26;
  v22 = *v7;
  if ((v20 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  return sub_245857AD8(v16, (uint64_t)v13, v29, v22, a4);
}

uint64_t sub_245857A1C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_24585A1E8();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3648);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a3, v11);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

uint64_t sub_245857AD8(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v10 = a4[6];
  v11 = sub_24585A1E8();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a2, v11);
  v12 = a4[7];
  v13 = a5(0);
  result = sub_245855EA4(a3, v12 + *(_QWORD *)(*(_QWORD *)(v13 - 8) + 72) * a1, a5);
  v15 = a4[2];
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
    __break(1u);
  else
    a4[2] = v17;
  return result;
}

char *sub_245857B90()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *result;
  char *v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;

  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3648);
  v37 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_24585A1E8();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37F0);
  v33 = v0;
  v3 = *v0;
  v4 = sub_24585A6F8();
  v5 = *(_QWORD *)(v3 + 16);
  v43 = v4;
  if (!v5)
  {
    result = (char *)swift_release();
    v32 = v43;
    v31 = v33;
LABEL_25:
    *v31 = v32;
    return result;
  }
  v6 = v4;
  result = (char *)(v4 + 64);
  v8 = (char *)(v3 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v34 = v3 + 64;
  if (v6 != v3 || result >= &v8[8 * v9])
  {
    result = (char *)memmove(result, v8, 8 * v9);
    v6 = v43;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v42 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v35 = (unint64_t)(v11 + 63) >> 6;
  v14 = v36;
  v15 = v37;
  v17 = v38;
  v16 = v39;
  v18 = v41;
  v19 = v43;
  while (1)
  {
    if (v13)
    {
      v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v44 = v10;
      v21 = v20 | (v10 << 6);
      v22 = v42;
      goto LABEL_9;
    }
    v27 = v10 + 1;
    v22 = v42;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v27);
    v29 = v10 + 1;
    if (!v28)
    {
      v29 = v27 + 1;
      if (v27 + 1 >= v35)
        goto LABEL_23;
      v28 = *(_QWORD *)(v34 + 8 * v29);
      if (!v28)
        break;
    }
LABEL_22:
    v13 = (v28 - 1) & v28;
    v44 = v29;
    v21 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_9:
    v23 = *(_QWORD *)(v14 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v17, *(_QWORD *)(v22 + 48) + v23, v16);
    v24 = *(_QWORD *)(v15 + 72) * v21;
    v25 = *(_QWORD *)(v22 + 56) + v24;
    v26 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v40, v25, v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(_QWORD *)(v19 + 48) + v23, v17, v16);
    result = (char *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(_QWORD *)(v19 + 56) + v24, v26, v18);
    v10 = v44;
  }
  v30 = v27 + 2;
  if (v30 >= v35)
  {
LABEL_23:
    result = (char *)swift_release();
    v31 = v33;
    v32 = v43;
    goto LABEL_25;
  }
  v28 = *(_QWORD *)(v34 + 8 * v30);
  if (v28)
  {
    v29 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    v29 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v29 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v29);
    ++v30;
    if (v28)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_245857E74(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t i;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(_QWORD);
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t (*v41)(_QWORD);
  uint64_t v42;
  uint64_t v43;

  v41 = a1;
  v4 = a1(0);
  v40 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v34 - v5;
  v38 = sub_24585A1E8();
  v6 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v37 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v34 = v2;
  v8 = *v2;
  v9 = sub_24585A6F8();
  v10 = *(_QWORD *)(v8 + 16);
  v43 = v9;
  if (!v10)
  {
    result = (void *)swift_release();
    v33 = v43;
    v32 = v34;
LABEL_25:
    *v32 = v33;
    return result;
  }
  v11 = v9;
  result = (void *)(v9 + 64);
  v13 = (unint64_t)((1 << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v8 || (unint64_t)result >= v8 + 64 + 8 * v13)
  {
    result = memmove(result, (const void *)(v8 + 64), 8 * v13);
    v11 = v43;
  }
  v14 = 0;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v8 + 16);
  v15 = 1 << *(_BYTE *)(v8 + 32);
  v42 = v8;
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v8 + 64);
  v35 = v8 + 64;
  v36 = (unint64_t)(v15 + 63) >> 6;
  v19 = v37;
  v18 = v38;
  v20 = (uint64_t)v39;
  for (i = v43; ; result = (void *)sub_245855EA4(v20, *(_QWORD *)(i + 56) + v28, v27))
  {
    if (v17)
    {
      v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v23 = v22 | (v14 << 6);
      v24 = v42;
      goto LABEL_9;
    }
    v29 = v14 + 1;
    v24 = v42;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v29 >= v36)
      goto LABEL_23;
    v30 = *(_QWORD *)(v35 + 8 * v29);
    ++v14;
    if (!v30)
    {
      v14 = v29 + 1;
      if (v29 + 1 >= v36)
        goto LABEL_23;
      v30 = *(_QWORD *)(v35 + 8 * v14);
      if (!v30)
        break;
    }
LABEL_22:
    v17 = (v30 - 1) & v30;
    v23 = __clz(__rbit64(v30)) + (v14 << 6);
LABEL_9:
    v25 = *(_QWORD *)(v6 + 72) * v23;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v19, *(_QWORD *)(v24 + 48) + v25, v18);
    v26 = *(_QWORD *)(v24 + 56);
    v27 = v41;
    v28 = *(_QWORD *)(v40 + 72) * v23;
    sub_245844E38(v26 + v28, v20, v41);
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(i + 48) + v25, v19, v18);
  }
  v31 = v29 + 2;
  if (v31 >= v36)
  {
LABEL_23:
    result = (void *)swift_release();
    v32 = v34;
    v33 = v43;
    goto LABEL_25;
  }
  v30 = *(_QWORD *)(v35 + 8 * v31);
  if (v30)
  {
    v14 = v31;
    goto LABEL_22;
  }
  while (1)
  {
    v14 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v14 >= v36)
      goto LABEL_23;
    v30 = *(_QWORD *)(v35 + 8 * v14);
    ++v31;
    if (v30)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_245858138(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_24585A1E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_24583D380(&qword_2574B2D90, v11, MEMORY[0x24BDCEA88]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_24585A3C8();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_24583D380(&qword_2574B2D98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v21 = sub_24585A3E0();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_245858700((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_245858394()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_24585A1E8();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37B0);
  v6 = sub_24585A680();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      result = sub_24585A3C8();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_245858700(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_24585A1E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_245858394();
  }
  else
  {
    if (v11 > v10)
    {
      sub_245858904();
      goto LABEL_12;
    }
    sub_245858B28();
  }
  v12 = *v3;
  sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v13 = sub_24585A3C8();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_24583D380(&qword_2574B2D98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v18 = sub_24585A3E0();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_24585A7DC();
  __break(1u);
  return result;
}

void *sub_245858904()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_24585A1E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37B0);
  v6 = *v0;
  v7 = sub_24585A674();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_245858B28()
{
  uint64_t *v0;
  uint64_t *v1;
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
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_24585A1E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37B0);
  v7 = sub_24585A680();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_24585A3C8();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_245858E50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v6 = sub_24585A1E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_24583D380(&qword_2574B2D90, v11, MEMORY[0x24BDCEA88]);
  swift_bridgeObjectRetain();
  v29 = a1;
  v12 = sub_24585A3C8();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a2;
    v15 = ~v13;
    v16 = *(_QWORD *)(v7 + 72);
    v30 = v7;
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    while (1)
    {
      v18 = v16 * v14;
      v17(v9, *(_QWORD *)(v10 + 48) + v16 * v14, v6);
      sub_24583D380(&qword_2574B2D98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v19 = sub_24585A3E0();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        break;
      v14 = (v14 + 1) & v15;
      if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v20 = 1;
        a2 = v28;
        v7 = v30;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v20, 1, v6);
      }
    }
    swift_bridgeObjectRelease();
    v21 = v27;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v23 = *v21;
    v31 = *v21;
    *v21 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_245858904();
      v23 = v31;
    }
    v24 = *(_QWORD *)(v23 + 48) + v18;
    v7 = v30;
    a2 = v28;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v30 + 32))(v28, v24, v6);
    sub_24585908C(v14);
    *v21 = v31;
    swift_bridgeObjectRelease();
    v20 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v20 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v20, 1, v6);
}

uint64_t sub_24585908C(int64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;

  v3 = sub_24585A1E8();
  v28 = *(_QWORD *)(v3 - 8);
  result = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *v1 + 56;
  v9 = -1 << *(_BYTE *)(*v1 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    v25 = v1;
    v11 = ~v9;
    swift_retain();
    v12 = sub_24585A644();
    v27 = v8;
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v13 = (v12 + 1) & v11;
      v14 = *(_QWORD *)(v28 + 72);
      v26 = *(void (**)(char *, unint64_t, uint64_t))(v28 + 16);
      do
      {
        v15 = v14 * v10;
        v26(v6, *(_QWORD *)(v7 + 48) + v14 * v10, v3);
        sub_24583D380(&qword_2574B2D90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v16 = sub_24585A3C8();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v3);
        v17 = v16 & v11;
        if (a1 >= (uint64_t)v13)
        {
          if (v17 < v13 || a1 < (uint64_t)v17)
            goto LABEL_6;
        }
        else if (v17 < v13 && a1 < (uint64_t)v17)
        {
          goto LABEL_6;
        }
        v20 = v14 * a1;
        if (v14 * a1 < v15 || *(_QWORD *)(v7 + 48) + v14 * a1 >= (unint64_t)(*(_QWORD *)(v7 + 48) + v15 + v14))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v20 == v15)
            goto LABEL_6;
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        v10 = (v10 + 1) & v11;
      }
      while (((*(_QWORD *)(v27 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(_QWORD *)(v27 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    result = swift_release();
    v1 = v25;
  }
  else
  {
    *(_QWORD *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  v21 = *v1;
  v22 = *(_QWORD *)(*v1 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v21 + 16) = v24;
    ++*(_DWORD *)(v21 + 36);
  }
  return result;
}

unint64_t sub_245859308()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2574B37B8;
  if (!qword_2574B37B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2574B3668);
    v2[0] = sub_24583D380(&qword_2574B37C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    v2[1] = sub_24585939C(&qword_2574B5448, (uint64_t)&unk_24585BCA0);
    result = MEMORY[0x24953CEC4](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2574B37B8);
  }
  return result;
}

uint64_t sub_24585939C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for Session(255);
    result = MEMORY[0x24953CEC4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2458593DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

unint64_t sub_245859420()
{
  unint64_t result;

  result = qword_2574B37D8;
  if (!qword_2574B37D8)
  {
    result = MEMORY[0x24953CEC4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, &qword_2574B37D8);
  }
  return result;
}

uint64_t sub_245859464()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_24585A1E8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2458594E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_24585A1E8() - 8) + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = v0 + ((v2 + 40) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_24583A348;
  return sub_2458526F0((uint64_t)v5, v6, v7, v3, v4);
}

uint64_t _s24ScreenContinuityServices12SessionErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245859598 + 4 * byte_24585BAE5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2458595CC + 4 * byte_24585BAE0[v4]))();
}

uint64_t sub_2458595CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2458595D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2458595DCLL);
  return result;
}

uint64_t sub_2458595E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2458595F0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2458595F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2458595FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Session.CodingKeys()
{
  return &type metadata for Session.CodingKeys;
}

ValueMetadata *type metadata accessor for Session.State()
{
  return &type metadata for Session.State;
}

unint64_t sub_245859634()
{
  unint64_t result;

  result = qword_2574B5450[0];
  if (!qword_2574B5450[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585BEA8, &type metadata for Session.State);
    atomic_store(result, qword_2574B5450);
  }
  return result;
}

unint64_t sub_24585967C()
{
  unint64_t result;

  result = qword_2574B5660[0];
  if (!qword_2574B5660[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585BF60, &type metadata for Session.CodingKeys);
    atomic_store(result, qword_2574B5660);
  }
  return result;
}

unint64_t sub_2458596C4()
{
  unint64_t result;

  result = qword_2574B5870;
  if (!qword_2574B5870)
  {
    result = MEMORY[0x24953CEC4](&unk_24585BED0, &type metadata for Session.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B5870);
  }
  return result;
}

unint64_t sub_24585970C()
{
  unint64_t result;

  result = qword_2574B5878;
  if (!qword_2574B5878)
  {
    result = MEMORY[0x24953CEC4](&unk_24585BEF8, &type metadata for Session.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B5878);
  }
  return result;
}

uint64_t sub_245859750(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x657669746361 && a2 == 0xE600000000000000;
  if (v2 || (sub_24585A7C4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465646E65 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_24585A7C4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_245859830(_QWORD *a1)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char v27;
  char v28;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B37F8);
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v25 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3800);
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3808);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245859C90();
  v10 = v26;
  sub_24585A860();
  if (v10)
    goto LABEL_7;
  v11 = v5;
  v12 = v25;
  v21 = a1;
  v26 = v7;
  v13 = sub_24585A764();
  v14 = v6;
  if (*(_QWORD *)(v13 + 16) != 1)
  {
    v16 = sub_24585A6B0();
    swift_allocError();
    v17 = v9;
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574B3810);
    *v19 = &type metadata for Session.State;
    sub_24585A740();
    sub_24585A6A4();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v6);
    a1 = v21;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    return v6;
  }
  v6 = *(unsigned __int8 *)(v13 + 32);
  if ((v6 & 1) != 0)
  {
    v28 = 1;
    sub_245859CD4();
    sub_24585A734();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v24);
  }
  else
  {
    v27 = 0;
    sub_245859D18();
    sub_24585A734();
    v15 = v26;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v23);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
  return v6;
}

uint64_t sub_245859B5C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7472617473 && a2 == 0xE500000000000000;
  if (v2 || (sub_24585A7C4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_24585A7C4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1716482913 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_24585A7C4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

unint64_t sub_245859C90()
{
  unint64_t result;

  result = qword_2574B5900;
  if (!qword_2574B5900)
  {
    result = MEMORY[0x24953CEC4](&unk_24585C24C, &type metadata for Session.State.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B5900);
  }
  return result;
}

unint64_t sub_245859CD4()
{
  unint64_t result;

  result = qword_2574B5908;
  if (!qword_2574B5908)
  {
    result = MEMORY[0x24953CEC4](&unk_24585C1FC, &type metadata for Session.State.EndedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B5908);
  }
  return result;
}

unint64_t sub_245859D18()
{
  unint64_t result;

  result = qword_2574B5910[0];
  if (!qword_2574B5910[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585C1AC, &type metadata for Session.State.ActiveCodingKeys);
    atomic_store(result, qword_2574B5910);
  }
  return result;
}

uint64_t _s24ScreenContinuityServices7SessionV5StateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245859DA8 + 4 * byte_24585BAEF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245859DDC + 4 * byte_24585BAEA[v4]))();
}

uint64_t sub_245859DDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245859DE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245859DECLL);
  return result;
}

uint64_t sub_245859DF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245859E00);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245859E04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245859E0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Session.State.CodingKeys()
{
  return &type metadata for Session.State.CodingKeys;
}

ValueMetadata *type metadata accessor for Session.State.ActiveCodingKeys()
{
  return &type metadata for Session.State.ActiveCodingKeys;
}

ValueMetadata *type metadata accessor for Session.State.EndedCodingKeys()
{
  return &type metadata for Session.State.EndedCodingKeys;
}

unint64_t sub_245859E4C()
{
  unint64_t result;

  result = qword_2574B5C20[0];
  if (!qword_2574B5C20[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585C184, &type metadata for Session.State.CodingKeys);
    atomic_store(result, qword_2574B5C20);
  }
  return result;
}

unint64_t sub_245859E94()
{
  unint64_t result;

  result = qword_2574B5D30;
  if (!qword_2574B5D30)
  {
    result = MEMORY[0x24953CEC4](&unk_24585C0A4, &type metadata for Session.State.ActiveCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B5D30);
  }
  return result;
}

unint64_t sub_245859EDC()
{
  unint64_t result;

  result = qword_2574B5D38[0];
  if (!qword_2574B5D38[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585C0CC, &type metadata for Session.State.ActiveCodingKeys);
    atomic_store(result, qword_2574B5D38);
  }
  return result;
}

unint64_t sub_245859F24()
{
  unint64_t result;

  result = qword_2574B5DC0;
  if (!qword_2574B5DC0)
  {
    result = MEMORY[0x24953CEC4](&unk_24585C054, &type metadata for Session.State.EndedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B5DC0);
  }
  return result;
}

unint64_t sub_245859F6C()
{
  unint64_t result;

  result = qword_2574B5DC8[0];
  if (!qword_2574B5DC8[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585C07C, &type metadata for Session.State.EndedCodingKeys);
    atomic_store(result, qword_2574B5DC8);
  }
  return result;
}

unint64_t sub_245859FB4()
{
  unint64_t result;

  result = qword_2574B5E50;
  if (!qword_2574B5E50)
  {
    result = MEMORY[0x24953CEC4](&unk_24585C0F4, &type metadata for Session.State.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574B5E50);
  }
  return result;
}

unint64_t sub_245859FFC()
{
  unint64_t result;

  result = qword_2574B5E58[0];
  if (!qword_2574B5E58[0])
  {
    result = MEMORY[0x24953CEC4](&unk_24585C11C, &type metadata for Session.State.CodingKeys);
    atomic_store(result, qword_2574B5E58);
  }
  return result;
}

uint64_t sub_24585A05C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_24585A068()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_24585A074()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_24585A080()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_24585A08C()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_24585A098()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_24585A0A4()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_24585A0B0()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_24585A0BC()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_24585A0C8()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_24585A0D4()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_24585A0E0()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_24585A0EC()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_24585A0F8()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_24585A104()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24585A110()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_24585A11C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_24585A128()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_24585A134()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_24585A140()
{
  return MEMORY[0x24BDCDA88]();
}

uint64_t sub_24585A14C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24585A158()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_24585A164()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_24585A170()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_24585A17C()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_24585A188()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_24585A194()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_24585A1A0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24585A1AC()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_24585A1B8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_24585A1C4()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_24585A1D0()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_24585A1DC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_24585A1E8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24585A1F4()
{
  return MEMORY[0x24BE7FC20]();
}

uint64_t sub_24585A200()
{
  return MEMORY[0x24BE7FC28]();
}

uint64_t sub_24585A20C()
{
  return MEMORY[0x24BE7FC30]();
}

uint64_t sub_24585A218()
{
  return MEMORY[0x24BE7FC38]();
}

uint64_t sub_24585A224()
{
  return MEMORY[0x24BE7FC40]();
}

uint64_t sub_24585A230()
{
  return MEMORY[0x24BE7FC48]();
}

uint64_t sub_24585A23C()
{
  return MEMORY[0x24BE7FC90]();
}

uint64_t sub_24585A248()
{
  return MEMORY[0x24BE7FCA0]();
}

uint64_t sub_24585A254()
{
  return MEMORY[0x24BE7FFE0]();
}

uint64_t sub_24585A260()
{
  return MEMORY[0x24BE7FFF0]();
}

uint64_t sub_24585A26C()
{
  return MEMORY[0x24BE7FFF8]();
}

uint64_t sub_24585A278()
{
  return MEMORY[0x24BE80000]();
}

uint64_t sub_24585A284()
{
  return MEMORY[0x24BE80048]();
}

uint64_t sub_24585A290()
{
  return MEMORY[0x24BE80050]();
}

uint64_t sub_24585A29C()
{
  return MEMORY[0x24BE80060]();
}

uint64_t sub_24585A2A8()
{
  return MEMORY[0x24BE80078]();
}

uint64_t sub_24585A2B4()
{
  return MEMORY[0x24BE80088]();
}

uint64_t sub_24585A2C0()
{
  return MEMORY[0x24BE80098]();
}

uint64_t sub_24585A2CC()
{
  return MEMORY[0x24BE800A0]();
}

uint64_t sub_24585A2D8()
{
  return MEMORY[0x24BE800A8]();
}

uint64_t sub_24585A2E4()
{
  return MEMORY[0x24BE800B8]();
}

uint64_t sub_24585A2F0()
{
  return MEMORY[0x24BE800C0]();
}

uint64_t sub_24585A2FC()
{
  return MEMORY[0x24BE800C8]();
}

uint64_t sub_24585A308()
{
  return MEMORY[0x24BEE6160]();
}

uint64_t sub_24585A314()
{
  return MEMORY[0x24BEE6208]();
}

uint64_t sub_24585A320()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_24585A32C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24585A338()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24585A344()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24585A350()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_24585A35C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_24585A368()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24585A374()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24585A380()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_24585A38C()
{
  return MEMORY[0x24BEE5578]();
}

uint64_t sub_24585A398()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_24585A3A4()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_24585A3B0()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_24585A3BC()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_24585A3C8()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_24585A3D4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_24585A3E0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24585A3EC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24585A3F8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_24585A404()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_24585A410()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24585A41C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_24585A428()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24585A434()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24585A440()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24585A44C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24585A458()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_24585A464()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_24585A470()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_24585A47C()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_24585A488()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_24585A494()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_24585A4A0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_24585A4AC()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_24585A4B8()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_24585A4C4()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_24585A4D0()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_24585A4DC()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_24585A4E8()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_24585A4F4()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_24585A500()
{
  return MEMORY[0x24BEE6C50]();
}

uint64_t sub_24585A50C()
{
  return MEMORY[0x24BEE6C90]();
}

uint64_t sub_24585A518()
{
  return MEMORY[0x24BEE6CB8]();
}

uint64_t sub_24585A524()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_24585A530()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_24585A53C()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_24585A548()
{
  return MEMORY[0x24BEE6CE8]();
}

uint64_t sub_24585A554()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_24585A560()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_24585A56C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24585A578()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24585A584()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_24585A590()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t sub_24585A59C()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t sub_24585A5A8()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_24585A5B4()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_24585A5C0()
{
  return MEMORY[0x24BEE58E8]();
}

uint64_t sub_24585A5CC()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_24585A5D8()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_24585A5E4()
{
  return MEMORY[0x24BEE5958]();
}

uint64_t sub_24585A5F0()
{
  return MEMORY[0x24BEE5960]();
}

uint64_t sub_24585A5FC()
{
  return MEMORY[0x24BEE59A0]();
}

uint64_t sub_24585A608()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24585A614()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24585A620()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24585A62C()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_24585A638()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24585A644()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_24585A650()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_24585A65C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_24585A668()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_24585A674()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_24585A680()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_24585A68C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24585A698()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24585A6A4()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_24585A6B0()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_24585A6BC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24585A6C8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24585A6D4()
{
  return MEMORY[0x24BEE6F00]();
}

uint64_t sub_24585A6E0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24585A6EC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24585A6F8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24585A704()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_24585A710()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24585A71C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24585A728()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_24585A734()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_24585A740()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_24585A74C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_24585A758()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_24585A764()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_24585A770()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_24585A77C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_24585A788()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_24585A794()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24585A7A0()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_24585A7AC()
{
  return MEMORY[0x24BEE7058]();
}

uint64_t sub_24585A7B8()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_24585A7C4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24585A7D0()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_24585A7DC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_24585A7E8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24585A7F4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24585A800()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24585A80C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24585A818()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24585A824()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24585A830()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24585A83C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_24585A848()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_24585A854()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24585A860()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24585A86C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24585A878()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24585A884()
{
  return MEMORY[0x24BEE4A10]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
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

