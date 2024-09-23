id UVLog()
{
  if (UVLog_onceToken[0] != -1)
    dispatch_once(UVLog_onceToken, &__block_literal_global);
  return (id)UVLog___log;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_230AE35A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_230AE35AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t sub_230AE35B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  _xpc_connection_s *mach_service;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t aBlock[6];

  v2 = v1;
  v3 = *(_QWORD *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(unsigned __int8 *)(a1 + 32);
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_OWORD *)(v1 + 112) = 0u;
  *(_QWORD *)(v1 + 24) = v3;
  *(_QWORD *)(v1 + 32) = v4;
  *(_QWORD *)(v1 + 40) = v5;
  *(_QWORD *)(v1 + 48) = v6;
  *(_BYTE *)(v1 + 56) = v7;
  if ((v7 & 1) != 0)
  {
    sub_230AE7974(v3, v4, v5, v6, 1);
    swift_bridgeObjectRetain();
  }
  else
  {
    LOBYTE(aBlock[0]) = v3;
    sub_230AE9638();
  }
  v8 = sub_230AEC9E0();
  swift_bridgeObjectRelease();
  mach_service = xpc_connection_create_mach_service((const char *)(v8 + 32), 0, 1uLL);
  swift_release();
  *(_QWORD *)(v2 + 16) = mach_service;
  if (v7)
  {
    swift_unknownObjectRetain();
    xpc_connection_enable_sim2host_4sim();
    sub_230AE79B8(v3, v4, v5, v6, 1);
    swift_unknownObjectRelease();
    mach_service = *(_xpc_connection_s **)(v2 + 16);
  }
  v10 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = (uint64_t)sub_230AE80A8;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_230AE4D44;
  aBlock[3] = (uint64_t)&block_descriptor;
  v11 = _Block_copy(aBlock);
  swift_release();
  xpc_connection_set_event_handler(mach_service, v11);
  _Block_release(v11);
  if (qword_255EA0A08 != -1)
    swift_once();
  v12 = sub_230AEC938();
  __swift_project_value_buffer(v12, (uint64_t)qword_255EA0C08);
  swift_retain_n();
  v13 = sub_230AEC920();
  v14 = sub_230AECA4C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    aBlock[0] = v16;
    *(_DWORD *)v15 = 136446466;
    swift_retain();
    v17 = sub_230AE3BE8();
    v19 = v18;
    swift_release();
    sub_230AEBA58(v17, v19, aBlock);
    sub_230AECA88();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    v20 = sub_230AE3910();
    sub_230AEBA58(v20, v21, aBlock);
    sub_230AECA88();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230AE1000, v13, v14, "%{public}s created with underlying service %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v16, -1, -1);
    MEMORY[0x2348BE240](v15, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  return v2;
}

uint64_t sub_230AE3910()
{
  sub_230AECAAC();
  sub_230AEC9F8();
  sub_230AECAD0();
  sub_230AEC9F8();
  return 0;
}

uint64_t sub_230AE39AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v1 = v0;
  if (qword_255EA0A08 != -1)
    swift_once();
  v2 = sub_230AEC938();
  __swift_project_value_buffer(v2, (uint64_t)qword_255EA0C08);
  swift_retain_n();
  v3 = sub_230AEC920();
  v4 = sub_230AECA4C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v11 = v6;
    *(_DWORD *)v5 = 136446210;
    swift_retain();
    v7 = sub_230AE3BE8();
    v9 = v8;
    swift_release();
    sub_230AEBA58(v7, v9, &v11);
    sub_230AECA88();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230AE1000, v3, v4, "%{public}s deinit", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v6, -1, -1);
    MEMORY[0x2348BE240](v5, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_unknownObjectRelease();
  sub_230AE79B8(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_BYTE *)(v1 + 56));
  sub_230AE8074(*(_QWORD *)(v1 + 64));
  sub_230AE8074(*(_QWORD *)(v1 + 80));
  sub_230AE8074(*(_QWORD *)(v1 + 96));
  sub_230AE8074(*(_QWORD *)(v1 + 112));
  return v1;
}

uint64_t sub_230AE3BA8()
{
  sub_230AE39AC();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for XPCListener()
{
  return objc_opt_self();
}

uint64_t sub_230AE3BE8()
{
  uint64_t v0;
  _QWORD v2[2];

  sub_230AECAAC();
  swift_bridgeObjectRelease();
  strcpy((char *)v2, "<XPCListener ");
  HIWORD(v2[1]) = -4864;
  sub_230AECAD0();
  sub_230AEC9F8();
  swift_bridgeObjectRelease();
  sub_230AEC9F8();
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
    swift_bridgeObjectRetain();
  else
    PreviewsService.description.getter();
  sub_230AEC9F8();
  swift_bridgeObjectRelease();
  sub_230AEC9F8();
  return v2[0];
}

void sub_230AE3D04(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t Strong;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  int v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  os_log_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t, uint64_t);
  void (*v42)(uint64_t);
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t);
  char v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  void (*v68)(uint64_t);
  uint64_t v69;
  _QWORD v70[2];
  int v71;
  os_log_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;

  v2 = sub_230AECA64();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_230AECA58();
  MEMORY[0x24BDAC7A8]();
  sub_230AEC9A4();
  MEMORY[0x24BDAC7A8]();
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v7 = (_QWORD *)Strong;
    v8 = MEMORY[0x2348BE390](a1);
    if (sub_230AEC950() == v8)
    {
      swift_unknownObjectRetain();
      v25 = sub_230AE8884();
      if (qword_255EA0A08 != -1)
        swift_once();
      v76 = v2;
      v26 = sub_230AEC938();
      v27 = __swift_project_value_buffer(v26, (uint64_t)qword_255EA0C08);
      swift_retain_n();
      swift_retain_n();
      v73 = v27;
      v28 = sub_230AEC920();
      v29 = sub_230AECA4C();
      v30 = v29;
      v31 = os_log_type_enabled(v28, v29);
      v75 = v25;
      if (v31)
      {
        v32 = swift_slowAlloc();
        v74 = swift_slowAlloc();
        v80 = v74;
        *(_DWORD *)v32 = 136446466;
        v70[0] = v32 + 4;
        swift_retain();
        v72 = v28;
        v33 = sub_230AE3BE8();
        v71 = v30;
        v35 = v34;
        swift_release();
        v78 = sub_230AEBA58(v33, v35, &v80);
        v70[1] = &v79;
        sub_230AECA88();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v32 + 12) = 2082;
        v70[0] = v32 + 14;
        swift_retain();
        v36 = sub_230AE5994();
        v38 = v37;
        swift_release();
        v78 = sub_230AEBA58(v36, v38, &v80);
        sub_230AECA88();
        swift_release_n();
        swift_bridgeObjectRelease();
        v39 = v72;
        _os_log_impl(&dword_230AE1000, v72, (os_log_type_t)v71, "%{public}s incoming connection %{public}s", (uint8_t *)v32, 0x16u);
        v40 = v74;
        swift_arrayDestroy();
        MEMORY[0x2348BE240](v40, -1, -1);
        MEMORY[0x2348BE240](v32, -1, -1);

      }
      else
      {

        swift_release_n();
        swift_release_n();
      }
      v74 = sub_230AE8D44(0, &qword_255EA0A98);
      v80 = 0;
      v81 = 0xE000000000000000;
      sub_230AECAAC();
      swift_bridgeObjectRelease();
      v80 = 0xD00000000000001CLL;
      v81 = 0x8000000230AEDAD0;
      v78 = 0;
      v79 = 0xE000000000000000;
      v77 = v7;
      sub_230AECAD0();
      sub_230AEC9F8();
      swift_bridgeObjectRelease();
      sub_230AEC998();
      v80 = MEMORY[0x24BEE4AF8];
      sub_230AE8BC8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AA8);
      sub_230AE8C10();
      sub_230AECAA0();
      (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5750], v76);
      v44 = sub_230AECA70();
      v45 = v75;
      xpc_connection_set_target_queue(*(xpc_connection_t *)(v75 + 16), v44);

      v46 = (uint64_t (*)(uint64_t))v7[8];
      if (!v46 || (swift_retain(), v47 = v46(v45), sub_230AE8074((uint64_t)v46), (v47 & 1) == 0))
      {
        swift_retain_n();
        swift_retain_n();
        v58 = sub_230AEC920();
        v59 = sub_230AECA4C();
        if (os_log_type_enabled(v58, v59))
        {
          v60 = swift_slowAlloc();
          v61 = swift_slowAlloc();
          v80 = v61;
          *(_DWORD *)v60 = 136446466;
          swift_retain();
          v62 = sub_230AE3BE8();
          v64 = v63;
          swift_release();
          v78 = sub_230AEBA58(v62, v64, &v80);
          sub_230AECA88();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v60 + 12) = 2082;
          swift_retain();
          v65 = sub_230AE5994();
          v67 = v66;
          swift_release();
          v78 = sub_230AEBA58(v65, v67, &v80);
          sub_230AECA88();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_230AE1000, v58, v59, "%{public}s denying %{public}s", (uint8_t *)v60, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x2348BE240](v61, -1, -1);
          MEMORY[0x2348BE240](v60, -1, -1);

        }
        else
        {

          swift_release_n();
          swift_release_n();
        }
        sub_230AE4904();
        swift_release();
LABEL_31:
        swift_release();
        return;
      }
      swift_retain_n();
      swift_retain_n();
      v48 = sub_230AEC920();
      v49 = sub_230AECA4C();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = swift_slowAlloc();
        v51 = swift_slowAlloc();
        v80 = v51;
        *(_DWORD *)v50 = 136446466;
        swift_retain();
        v52 = sub_230AE3BE8();
        v54 = v53;
        swift_release();
        v78 = sub_230AEBA58(v52, v54, &v80);
        sub_230AECA88();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v50 + 12) = 2082;
        swift_retain();
        v55 = sub_230AE5994();
        v57 = v56;
        swift_release();
        v78 = sub_230AEBA58(v55, v57, &v80);
        sub_230AECA88();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_230AE1000, v48, v49, "%{public}s accepted connection %{public}s", (uint8_t *)v50, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2348BE240](v51, -1, -1);
        MEMORY[0x2348BE240](v50, -1, -1);
        swift_release();
        swift_release();

      }
      else
      {

        swift_release_n();
        swift_release_n();
      }
    }
    else
    {
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      v9 = sub_230AE8A7C(a1);
      v11 = v10;
      v13 = v12;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if (qword_255EA0A08 != -1)
        swift_once();
      v14 = sub_230AEC938();
      __swift_project_value_buffer(v14, (uint64_t)qword_255EA0C08);
      swift_retain();
      sub_230AE78E0(v9, v11, v13);
      swift_retain();
      sub_230AE78E0(v9, v11, v13);
      v15 = sub_230AEC920();
      v16 = sub_230AECA4C();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = swift_slowAlloc();
        v75 = swift_slowAlloc();
        v76 = swift_slowAlloc();
        v80 = v76;
        *(_DWORD *)v17 = 136446466;
        swift_retain();
        v18 = sub_230AE3BE8();
        v20 = v19;
        swift_release();
        v78 = sub_230AEBA58(v18, v20, &v80);
        sub_230AECA88();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 12) = 2114;
        sub_230AE7BD0();
        swift_allocError();
        *(_QWORD *)v21 = v9;
        *(_QWORD *)(v21 + 8) = v11;
        *(_BYTE *)(v21 + 16) = v13;
        sub_230AE78E0(v9, v11, v13);
        v22 = _swift_stdlib_bridgeErrorToNSError();
        v78 = v22;
        sub_230AECA88();
        v23 = v75;
        *(_QWORD *)v75 = v22;
        sub_230AE78F8(v9, v11, v13);
        sub_230AE78F8(v9, v11, v13);
        _os_log_impl(&dword_230AE1000, v15, v16, "%{public}s got error event: %{public}@", (uint8_t *)v17, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0A90);
        swift_arrayDestroy();
        MEMORY[0x2348BE240](v23, -1, -1);
        v24 = v76;
        swift_arrayDestroy();
        MEMORY[0x2348BE240](v24, -1, -1);
        MEMORY[0x2348BE240](v17, -1, -1);
      }
      else
      {
        swift_release_n();
        sub_230AE78F8(v9, v11, v13);
        sub_230AE78F8(v9, v11, v13);
      }

      if ((_BYTE)v13)
      {
        if (v13 == 3 && !(v9 | v11))
        {
          v68 = (void (*)(uint64_t))v7[10];
          if (v68)
          {
            v69 = swift_retain();
            v68(v69);
            sub_230AE8074((uint64_t)v68);
          }
        }
        else
        {
          v41 = (void (*)(uint64_t, uint64_t, uint64_t))v7[14];
          if (v41)
          {
            swift_retain();
            v41(v9, v11, v13);
            sub_230AE8074((uint64_t)v41);
          }
          sub_230AE78F8(v9, v11, v13);
        }
        goto LABEL_31;
      }
      v42 = (void (*)(uint64_t))v7[12];
      if (v42)
      {
        v43 = swift_retain();
        v42(v43);
        sub_230AE8074((uint64_t)v42);
      }
      sub_230AE4B34();
      swift_release();
      sub_230AE78F8(v9, v11, 0);
    }
  }
}

void sub_230AE48FC()
{
  JUMPOUT(0x2348BE390);
}

uint64_t sub_230AE4904()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v13[2];
  uint64_t v14;

  v1 = v0;
  if (qword_255EA0A08 != -1)
    swift_once();
  v2 = sub_230AEC938();
  __swift_project_value_buffer(v2, (uint64_t)qword_255EA0C08);
  swift_retain_n();
  v3 = sub_230AEC920();
  v4 = sub_230AECA4C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    *(_QWORD *)&v13[0] = v6;
    *(_DWORD *)v5 = 136446210;
    swift_retain();
    v7 = sub_230AE5994();
    v9 = v8;
    swift_release();
    sub_230AEBA58(v7, v9, (uint64_t *)v13);
    sub_230AECA88();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230AE1000, v3, v4, "%{public}s invalidating", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v6, -1, -1);
    MEMORY[0x2348BE240](v5, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v10 = v1[8];
  v1[8] = 0;
  v1[9] = 0;
  sub_230AE8074(v10);
  v11 = v1[10];
  v1[10] = 0;
  v1[11] = 0;
  sub_230AE8074(v11);
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  swift_beginAccess();
  sub_230AE8EB4((uint64_t)v13, (uint64_t)(v1 + 3));
  swift_endAccess();
  return sub_230AE5B74((uint64_t (*)(uint64_t))sub_230AE5994, "%{public}s cancel", MEMORY[0x24BDB0718]);
}

uint64_t sub_230AE4B34()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v1 = v0;
  if (qword_255EA0A08 != -1)
    swift_once();
  v2 = sub_230AEC938();
  __swift_project_value_buffer(v2, (uint64_t)qword_255EA0C08);
  swift_retain_n();
  v3 = sub_230AEC920();
  v4 = sub_230AECA4C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v15 = v6;
    *(_DWORD *)v5 = 136446210;
    swift_retain();
    v7 = sub_230AE3BE8();
    v9 = v8;
    swift_release();
    sub_230AEBA58(v7, v9, &v15);
    sub_230AECA88();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230AE1000, v3, v4, "%{public}s invalidating", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v6, -1, -1);
    MEMORY[0x2348BE240](v5, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v10 = v1[10];
  v1[10] = 0;
  v1[11] = 0;
  sub_230AE8074(v10);
  v11 = v1[12];
  v1[12] = 0;
  v1[13] = 0;
  sub_230AE8074(v11);
  v12 = v1[14];
  v1[14] = 0;
  v1[15] = 0;
  sub_230AE8074(v12);
  v13 = v1[8];
  v1[8] = 0;
  v1[9] = 0;
  sub_230AE8074(v13);
  return sub_230AE5B74((uint64_t (*)(uint64_t))sub_230AE3BE8, "%{public}s cancel", MEMORY[0x24BDB0718]);
}

uint64_t sub_230AE4D44(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_230AE4D8C()
{
  return sub_230AE5B74((uint64_t (*)(uint64_t))sub_230AE3BE8, "%{public}s activate", MEMORY[0x24BDB0710]);
}

uint64_t sub_230AE4DA8()
{
  return sub_230AE3BE8();
}

uint64_t sub_230AE4DC8(_xpc_connection_s *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  *(_QWORD *)(v1 + 104) = 0;
  *(_OWORD *)(v1 + 88) = 0u;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_QWORD *)(v1 + 16) = a1;
  v3 = swift_allocObject();
  swift_weakInit();
  v6[4] = sub_230AE8CA0;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_230AE4D44;
  v6[3] = &block_descriptor_7;
  v4 = _Block_copy(v6);
  swift_unknownObjectRetain();
  swift_release();
  xpc_connection_set_event_handler(a1, v4);
  swift_unknownObjectRelease();
  _Block_release(v4);
  return v1;
}

uint64_t sub_230AE4EB0(void *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v29;
  void (*v30)(uint64_t);
  uint64_t v31;
  void (*v32)(uint64_t);
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = (_QWORD *)result;
    v4 = MEMORY[0x2348BE390](a1);
    if (sub_230AEC95C() == v4)
    {
      if (qword_255EA0A08 != -1)
        swift_once();
      v18 = sub_230AEC938();
      __swift_project_value_buffer(v18, (uint64_t)qword_255EA0C08);
      swift_retain_n();
      v19 = sub_230AEC920();
      v20 = sub_230AECA34();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        v22 = swift_slowAlloc();
        v37 = v22;
        *(_DWORD *)v21 = 136446210;
        swift_retain();
        v23 = sub_230AE5994();
        v25 = v24;
        swift_release();
        sub_230AEBA58(v23, v25, &v37);
        sub_230AECA88();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_230AE1000, v19, v20, "%{public}s received dictionary", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348BE240](v22, -1, -1);
        MEMORY[0x2348BE240](v21, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      sub_230AE545C(a1);
      return swift_release();
    }
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v5 = sub_230AE8A7C(a1);
    v7 = v6;
    v9 = v8;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    if (qword_255EA0A08 != -1)
      swift_once();
    v10 = sub_230AEC938();
    __swift_project_value_buffer(v10, (uint64_t)qword_255EA0C08);
    swift_retain();
    sub_230AE78E0(v5, v7, v9);
    swift_retain();
    sub_230AE78E0(v5, v7, v9);
    v11 = sub_230AEC920();
    v12 = sub_230AECA4C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v34 = (_QWORD *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v37 = v35;
      *(_DWORD *)v13 = 136446466;
      swift_retain();
      v14 = sub_230AE5994();
      v16 = v15;
      swift_release();
      sub_230AEBA58(v14, v16, &v37);
      sub_230AECA88();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2114;
      sub_230AE7BD0();
      swift_allocError();
      *(_QWORD *)v17 = v5;
      *(_QWORD *)(v17 + 8) = v7;
      *(_BYTE *)(v17 + 16) = v9;
      sub_230AE78E0(v5, v7, v9);
      v36 = _swift_stdlib_bridgeErrorToNSError();
      sub_230AECA88();
      *v34 = v36;
      sub_230AE78F8(v5, v7, v9);
      sub_230AE78F8(v5, v7, v9);
      _os_log_impl(&dword_230AE1000, v11, v12, "%{public}s error event: %{public}@", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0A90);
      swift_arrayDestroy();
      MEMORY[0x2348BE240](v34, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2348BE240](v35, -1, -1);
      MEMORY[0x2348BE240](v13, -1, -1);
    }
    else
    {
      swift_release_n();
      sub_230AE78F8(v5, v7, v9);
      sub_230AE78F8(v5, v7, v9);
    }

    if ((_BYTE)v9)
    {
      if (v9 == 3 && !(v5 | v7))
      {
        v32 = (void (*)(uint64_t))v3[8];
        if (v32)
        {
          v33 = swift_retain();
          v32(v33);
          sub_230AE8074((uint64_t)v32);
        }
        return swift_release();
      }
      v26 = (void (*)(uint64_t, uint64_t, uint64_t))v3[12];
      if (v26)
      {
        swift_retain();
        v26(v5, v7, v9);
        sub_230AE8074((uint64_t)v26);
      }
      v27 = v5;
      v28 = v7;
      v29 = v9;
    }
    else
    {
      v30 = (void (*)(uint64_t))v3[10];
      if (v30)
      {
        v31 = swift_retain();
        v30(v31);
        sub_230AE8074((uint64_t)v30);
        swift_release();
        return sub_230AE78F8(v5, v7, 0);
      }
      v27 = v5;
      v28 = v7;
      v29 = 0;
    }
    sub_230AE78F8(v27, v28, v29);
    return swift_release();
  }
  return result;
}

void sub_230AE545C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  xpc_object_t reply;
  xpc_object_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(void *, void (*)(void *, void *), uint64_t, uint64_t, uint64_t);
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[3];
  uint64_t v36;
  uint64_t v37;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone((Class)UVPropertyList), sel_initWithXpcDictionary_, a1);
  if (v4)
  {
    v5 = v4;
    reply = xpc_dictionary_create_reply(a1);
    if (reply)
    {
      v7 = reply;
      if (qword_255EA0A08 != -1)
        swift_once();
      v8 = sub_230AEC938();
      __swift_project_value_buffer(v8, (uint64_t)qword_255EA0C08);
      swift_retain_n();
      v9 = sub_230AEC920();
      v10 = sub_230AECA34();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (uint8_t *)swift_slowAlloc();
        v12 = swift_slowAlloc();
        *(_DWORD *)v11 = 136446210;
        v35[0] = v12;
        swift_retain();
        v13 = sub_230AE5994();
        v15 = v14;
        swift_release();
        v37 = sub_230AEBA58(v13, v15, v35);
        sub_230AECA88();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_230AE1000, v9, v10, "%{public}s received message expecting reply", v11, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348BE240](v12, -1, -1);
        MEMORY[0x2348BE240](v11, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      swift_beginAccess();
      if (!*(_QWORD *)(v2 + 48))
      {

        swift_unknownObjectRelease();
        return;
      }
      sub_230AE8CA8(v2 + 24, (uint64_t)v35);
      v26 = __swift_project_boxed_opaque_existential_1(v35, v36);
      v27 = swift_allocObject();
      swift_weakInit();
      v28 = swift_allocObject();
      *(_QWORD *)(v28 + 16) = v27;
      *(_QWORD *)(v28 + 24) = v7;
      v29 = v26[3];
      v30 = v26[4];
      __swift_project_boxed_opaque_existential_1(v26, v29);
      v31 = *(void (**)(void *, void (*)(void *, void *), uint64_t, uint64_t, uint64_t))(v30 + 16);
      swift_retain();
      swift_unknownObjectRetain();
      v31(v5, sub_230AE8D3C, v28, v29, v30);
      swift_release();
      swift_release();

      swift_unknownObjectRelease();
    }
    else
    {
      if (qword_255EA0A08 != -1)
        swift_once();
      v18 = sub_230AEC938();
      __swift_project_value_buffer(v18, (uint64_t)qword_255EA0C08);
      swift_retain_n();
      v19 = sub_230AEC920();
      v20 = sub_230AECA34();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        v22 = swift_slowAlloc();
        v35[0] = v22;
        *(_DWORD *)v21 = 136446210;
        swift_retain();
        v23 = sub_230AE5994();
        v25 = v24;
        swift_release();
        v37 = sub_230AEBA58(v23, v25, v35);
        sub_230AECA88();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_230AE1000, v19, v20, "%{public}s received one-way message", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348BE240](v22, -1, -1);
        MEMORY[0x2348BE240](v21, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      swift_beginAccess();
      if (!*(_QWORD *)(v2 + 48))
      {

        return;
      }
      sub_230AE8CA8(v2 + 24, (uint64_t)v35);
      v32 = __swift_project_boxed_opaque_existential_1(v35, v36);
      v33 = v32[3];
      v34 = v32[4];
      __swift_project_boxed_opaque_existential_1(v32, v33);
      (*(void (**)(void *, uint64_t, uint64_t))(v34 + 8))(v5, v33, v34);

    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  }
  else
  {
    v16 = *(void (**)(uint64_t))(v2 + 96);
    if (v16)
    {
      swift_retain();
      MEMORY[0x2348BE330](a1);
      v17 = sub_230AECA04();
      v16(v17);
      sub_230AE8074((uint64_t)v16);
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_230AE5994()
{
  id v0;
  int v1;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 0u;
  v5 = 0u;
  xpc_connection_get_audit_token();
  memset(v3, 0, sizeof(v3));
  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BDB8]), sel_initWithAuditToken_, v3);
  v1 = objc_msgSend(v0, sel_pid);

  *(_QWORD *)&v4 = 0;
  *((_QWORD *)&v4 + 1) = 0xE000000000000000;
  sub_230AECAAC();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v4 = 0x6E6E6F434350583CLL;
  *((_QWORD *)&v4 + 1) = 0xEF206E6F69746365;
  *(_QWORD *)&v3[0] = 0;
  *((_QWORD *)&v3[0] + 1) = 0xE000000000000000;
  sub_230AECAD0();
  sub_230AEC9F8();
  swift_bridgeObjectRelease();
  sub_230AEC9F8();
  if (v1 >= 1)
  {
    LODWORD(v3[0]) = v1;
    sub_230AECB24();
  }
  sub_230AEC9F8();
  swift_bridgeObjectRelease();
  sub_230AEC9F8();
  return v4;
}

uint64_t sub_230AE5B58()
{
  return sub_230AE5B74((uint64_t (*)(uint64_t))sub_230AE5994, "%{public}s activate", MEMORY[0x24BDB0710]);
}

uint64_t sub_230AE5B74(uint64_t (*a1)(uint64_t), const char *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;

  v7 = v3;
  if (qword_255EA0A08 != -1)
    swift_once();
  v8 = sub_230AEC938();
  __swift_project_value_buffer(v8, (uint64_t)qword_255EA0C08);
  swift_retain_n();
  v9 = sub_230AEC920();
  v10 = sub_230AECA4C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v18 = v12;
    *(_DWORD *)v11 = 136446210;
    v13 = swift_retain();
    v14 = a1(v13);
    v16 = v15;
    swift_release();
    sub_230AEBA58(v14, v16, &v18);
    sub_230AECA88();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230AE1000, v9, v10, a2, v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v12, -1, -1);
    MEMORY[0x2348BE240](v11, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  return a3(*(_QWORD *)(v7 + 16));
}

uint64_t sub_230AE5D50(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  xpc_object_t empty;
  uint64_t v14;

  v2 = v1;
  if (qword_255EA0A08 != -1)
    swift_once();
  v4 = sub_230AEC938();
  __swift_project_value_buffer(v4, (uint64_t)qword_255EA0C08);
  swift_retain_n();
  v5 = sub_230AEC920();
  v6 = sub_230AECA34();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v14 = v8;
    *(_DWORD *)v7 = 136446210;
    swift_retain();
    v9 = sub_230AE5994();
    v11 = v10;
    swift_release();
    sub_230AEBA58(v9, v11, &v14);
    sub_230AECA88();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230AE1000, v5, v6, "%{public}s sending one-way message", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v8, -1, -1);
    MEMORY[0x2348BE240](v7, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  empty = xpc_dictionary_create_empty();
  objc_msgSend(a1, sel_encodeToXpcDictionary_, empty);
  xpc_connection_send_message(*(xpc_connection_t *)(v2 + 16), empty);
  return swift_unknownObjectRelease();
}

uint64_t sub_230AE5F44(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  xpc_object_t empty;
  _xpc_connection_s *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v22;
  uint64_t aBlock[6];

  v4 = v3;
  if (qword_255EA0A08 != -1)
    swift_once();
  v8 = sub_230AEC938();
  __swift_project_value_buffer(v8, (uint64_t)qword_255EA0C08);
  swift_retain_n();
  v9 = sub_230AEC920();
  v10 = sub_230AECA34();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    aBlock[0] = v12;
    *(_DWORD *)v11 = 136446210;
    swift_retain();
    v13 = sub_230AE5994();
    v22 = a3;
    v14 = a2;
    v16 = v15;
    swift_release();
    sub_230AEBA58(v13, v16, aBlock);
    sub_230AECA88();
    swift_release_n();
    a2 = v14;
    a3 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230AE1000, v9, v10, "%{public}s sending message expecting reply", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v12, -1, -1);
    MEMORY[0x2348BE240](v11, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  empty = xpc_dictionary_create_empty();
  objc_msgSend(a1, sel_encodeToXpcDictionary_, empty);
  v18 = *(_xpc_connection_s **)(v4 + 16);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v4;
  v19[3] = a2;
  v19[4] = a3;
  aBlock[4] = (uint64_t)sub_230AE8E5C;
  aBlock[5] = (uint64_t)v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_230AE4D44;
  aBlock[3] = (uint64_t)&block_descriptor_17;
  v20 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  xpc_connection_send_message_with_reply(v18, empty, 0, v20);
  _Block_release(v20);
  return swift_unknownObjectRelease();
}

void sub_230AE61E8(void *a1, uint64_t a2, void (*a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void (*v29)(uint64_t);
  uint64_t v30;
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint8_t *v61;
  id v62;
  id v63;
  _QWORD *v64;
  uint64_t v65;
  id v66;
  id v67;
  void (*v68)(_QWORD, _QWORD);
  uint64_t v69;
  uint64_t v70;

  v6 = MEMORY[0x2348BE390]();
  if (sub_230AEC95C() != v6)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    v7 = sub_230AE8A7C(a1);
    v9 = v8;
    v11 = v10;
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    if (qword_255EA0A08 != -1)
      swift_once();
    v12 = sub_230AEC938();
    __swift_project_value_buffer(v12, (uint64_t)qword_255EA0C08);
    swift_retain();
    sub_230AE78E0(v7, v9, v11);
    swift_retain();
    sub_230AE78E0(v7, v9, v11);
    v13 = sub_230AEC920();
    v14 = sub_230AECA4C();
    if (os_log_type_enabled(v13, v14))
    {
      v68 = a3;
      v15 = swift_slowAlloc();
      v64 = (_QWORD *)swift_slowAlloc();
      v65 = swift_slowAlloc();
      v70 = v65;
      *(_DWORD *)v15 = 136446466;
      swift_retain();
      v16 = sub_230AE5994();
      v18 = v17;
      swift_release();
      sub_230AEBA58(v16, v18, &v70);
      sub_230AECA88();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2114;
      sub_230AE7BD0();
      swift_allocError();
      *(_QWORD *)v19 = v7;
      *(_QWORD *)(v19 + 8) = v9;
      *(_BYTE *)(v19 + 16) = v11;
      sub_230AE78E0(v7, v9, v11);
      v69 = _swift_stdlib_bridgeErrorToNSError();
      sub_230AECA88();
      *v64 = v69;
      sub_230AE78F8(v7, v9, v11);
      sub_230AE78F8(v7, v9, v11);
      _os_log_impl(&dword_230AE1000, v13, v14, "%{public}s received reply error event: %{public}@", (uint8_t *)v15, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0A90);
      swift_arrayDestroy();
      MEMORY[0x2348BE240](v64, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2348BE240](v65, -1, -1);
      v20 = v15;
      a3 = v68;
      MEMORY[0x2348BE240](v20, -1, -1);
    }
    else
    {
      swift_release_n();
      sub_230AE78F8(v7, v9, v11);
      sub_230AE78F8(v7, v9, v11);
    }

    if (v11)
    {
      if (v11 == 3 && !(v7 | v9))
      {
        v29 = *(void (**)(uint64_t))(a2 + 64);
        if (v29)
        {
          v30 = swift_retain();
          v29(v30);
          sub_230AE8074((uint64_t)v29);
        }
      }
    }
    else
    {
      v31 = *(void (**)(uint64_t))(a2 + 80);
      if (v31)
      {
        sub_230AE78E0(v7, v9, 0);
        v32 = sub_230AE8E68((uint64_t)v31);
        v31(v32);
        sub_230AE8074((uint64_t)v31);
        sub_230AE78F8(v7, v9, 0);
      }
    }
    sub_230AE7BD0();
    v33 = swift_allocError();
    *(_QWORD *)v34 = v7;
    *(_QWORD *)(v34 + 8) = v9;
    *(_BYTE *)(v34 + 16) = v11;
    a3(0, v33);
    v35 = (void *)v33;
    goto LABEL_19;
  }
  if (qword_255EA0A08 != -1)
    swift_once();
  v21 = sub_230AEC938();
  __swift_project_value_buffer(v21, (uint64_t)qword_255EA0C08);
  swift_retain_n();
  v22 = sub_230AEC920();
  v23 = sub_230AECA34();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v70 = v25;
    *(_DWORD *)v24 = 136446210;
    swift_retain();
    v26 = sub_230AE5994();
    v28 = v27;
    swift_release();
    sub_230AEBA58(v26, v28, &v70);
    sub_230AECA88();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230AE1000, v22, v23, "%{public}s received reply dictionary", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v25, -1, -1);
    MEMORY[0x2348BE240](v24, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v36 = objc_msgSend(objc_allocWithZone((Class)UVPropertyList), sel_initWithXpcDictionary_, a1);
  if (!v36)
  {
    MEMORY[0x2348BE330](a1);
    v49 = sub_230AECA04();
    v51 = v50;
    sub_230AE7BD0();
    v52 = swift_allocError();
    *(_QWORD *)v53 = v49;
    *(_QWORD *)(v53 + 8) = v51;
    *(_BYTE *)(v53 + 16) = 1;
    a3(0, v52);
    v35 = (void *)v52;
LABEL_19:

    return;
  }
  v37 = v36;
  sub_230AE8D44(0, &qword_255EA0AC0);
  v38 = v37;
  v39 = sub_230AE6B1C(v38);
  if (v39)
  {
    v40 = v39;
    swift_retain_n();
    v41 = sub_230AEC920();
    v42 = sub_230AECA34();
    if (os_log_type_enabled(v41, v42))
    {
      v66 = v38;
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = swift_slowAlloc();
      v70 = v44;
      *(_DWORD *)v43 = 136446210;
      swift_retain();
      v45 = sub_230AE5994();
      v47 = v46;
      swift_release();
      sub_230AEBA58(v45, v47, &v70);
      sub_230AECA88();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230AE1000, v41, v42, "%{public}s received reply error", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BE240](v44, -1, -1);
      v48 = v43;
      v38 = v66;
      MEMORY[0x2348BE240](v48, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v62 = v40;
    a3(0, v40);

  }
  else
  {
    swift_retain_n();
    v54 = sub_230AEC920();
    v55 = sub_230AECA34();
    if (os_log_type_enabled(v54, v55))
    {
      v67 = v38;
      v56 = (uint8_t *)swift_slowAlloc();
      v57 = swift_slowAlloc();
      v70 = v57;
      *(_DWORD *)v56 = 136446210;
      swift_retain();
      v58 = sub_230AE5994();
      v60 = v59;
      swift_release();
      sub_230AEBA58(v58, v60, &v70);
      sub_230AECA88();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230AE1000, v54, v55, "%{public}s received reply message", v56, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BE240](v57, -1, -1);
      v61 = v56;
      v38 = v67;
      MEMORY[0x2348BE240](v61, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v63 = v38;
    a3(v37, 0);

  }
}

id sub_230AE6B1C(void *a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  char v9;
  id v10;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;

  v2 = objc_msgSend(a1, sel_dictionary);
  v3 = sub_230AEC9BC();

  if (*(_QWORD *)(v3 + 16))
  {
    v4 = sub_230AE80C8(0x6E69616D6F64, 0xE600000000000000);
    if ((v5 & 1) != 0)
    {
      sub_230AE8DAC(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)&v16);
      if ((swift_dynamicCast() & 1) != 0)
      {
        if (!*(_QWORD *)(v3 + 16) || (v6 = sub_230AE80C8(1701080931, 0xE400000000000000), (v7 & 1) == 0))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          return 0;
        }
        sub_230AE8DAC(*(_QWORD *)(v3 + 56) + 32 * v6, (uint64_t)&v16);
        if ((swift_dynamicCast() & 1) == 0)
        {

          swift_bridgeObjectRelease();
          goto LABEL_11;
        }
        if (*(_QWORD *)(v3 + 16) && (v8 = sub_230AE80C8(0x6F666E4972657375, 0xE800000000000000), (v9 & 1) != 0))
        {
          sub_230AE8DAC(*(_QWORD *)(v3 + 56) + 32 * v8, (uint64_t)&v16);
        }
        else
        {
          v16 = 0u;
          v17 = 0u;
        }
        swift_bridgeObjectRelease();
        if (!*((_QWORD *)&v17 + 1))
        {

          swift_bridgeObjectRelease();
          sub_230AE8E78((uint64_t)&v16, (uint64_t *)&unk_255EA0B00);
          return 0;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AD0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          v13 = (void *)sub_230AEC9C8();
          swift_bridgeObjectRelease();
          v14 = (void *)sub_230AEC9B0();
          swift_bridgeObjectRelease();
          v10 = objc_msgSend(v12, sel_initWithDomain_code_userInfo_, v13, v15, v14);

          return v10;
        }
      }
    }
  }

LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_230AE6DAC(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _xpc_connection_s *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  void *v39;
  void *v40;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v8 = Strong;
    if (a1)
    {
      v9 = qword_255EA0A08;
      v10 = a1;
      if (v9 != -1)
        swift_once();
      v11 = sub_230AEC938();
      __swift_project_value_buffer(v11, (uint64_t)qword_255EA0C08);
      swift_retain_n();
      v12 = sub_230AEC920();
      v13 = sub_230AECA34();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        v15 = swift_slowAlloc();
        v40 = (void *)v15;
        *(_DWORD *)v14 = 136446210;
        swift_retain();
        v16 = sub_230AE5994();
        v38 = v10;
        v17 = a4;
        v19 = v18;
        swift_release();
        v39 = (void *)sub_230AEBA58(v16, v19, (uint64_t *)&v40);
        sub_230AECA88();
        swift_release_n();
        a4 = v17;
        v10 = v38;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_230AE1000, v12, v13, "%{public}s replying with message", v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348BE240](v15, -1, -1);
        MEMORY[0x2348BE240](v14, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      objc_msgSend(v10, sel_encodeToXpcDictionary_, a4, v38, v39, v40);
      v29 = (_xpc_connection_s *)swift_unknownObjectRetain();
      xpc_connection_send_message(v29, a4);

      swift_unknownObjectRelease();
LABEL_15:
      swift_release();
      return;
    }
    if (a2)
    {
      v40 = a2;
      v20 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AB8);
      sub_230AE8D44(0, &qword_255EA0AC0);
      if ((swift_dynamicCast() & 1) != 0)
      {
        if (qword_255EA0A08 != -1)
          swift_once();
        v21 = sub_230AEC938();
        __swift_project_value_buffer(v21, (uint64_t)qword_255EA0C08);
        swift_retain_n();
        v22 = sub_230AEC920();
        v23 = sub_230AECA34();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = (uint8_t *)swift_slowAlloc();
          v25 = swift_slowAlloc();
          v40 = (void *)v25;
          *(_DWORD *)v24 = 136446210;
          swift_retain();
          v26 = sub_230AE5994();
          v28 = v27;
          swift_release();
          sub_230AEBA58(v26, v28, (uint64_t *)&v40);
          sub_230AECA88();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_230AE1000, v22, v23, "%{public}s replying with error", v24, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2348BE240](v25, -1, -1);
          MEMORY[0x2348BE240](v24, -1, -1);

        }
        else
        {

          swift_release_n();
        }
        sub_230AE7380(a4);
        xpc_connection_send_message(*(xpc_connection_t *)(v8 + 16), a4);

        goto LABEL_15;
      }
    }
    if (qword_255EA0A08 != -1)
      swift_once();
    v30 = sub_230AEC938();
    __swift_project_value_buffer(v30, (uint64_t)qword_255EA0C08);
    swift_retain_n();
    v31 = sub_230AEC920();
    v32 = sub_230AECA40();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v40 = (void *)v34;
      *(_DWORD *)v33 = 136446210;
      swift_retain();
      v35 = sub_230AE5994();
      v37 = v36;
      swift_release();
      sub_230AEBA58(v35, v37, (uint64_t *)&v40);
      sub_230AECA88();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_230AE1000, v31, v32, "%{public}s: Received neither message nor error from client to reply with", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348BE240](v34, -1, -1);
      MEMORY[0x2348BE240](v33, -1, -1);
      swift_release();

    }
    else
    {

      swift_release_n();
    }
  }
}

void sub_230AE7380(void *a1)
{
  void *v1;
  void *v2;
  uint64_t inited;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  id v14;
  void *v15;
  id v16;
  char **v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  NSObject *v24;
  _QWORD *v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  _OWORD v40[2];
  __int128 v41;
  uint64_t v42;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_230AED2C0;
  *(_QWORD *)(inited + 32) = 0x6E69616D6F64;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  v5 = objc_msgSend(v2, sel_domain);
  v6 = sub_230AEC9D4();
  v8 = v7;

  v9 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v6;
  *(_QWORD *)(inited + 56) = v8;
  *(_QWORD *)(inited + 72) = v9;
  *(_QWORD *)(inited + 80) = 1701080931;
  *(_QWORD *)(inited + 88) = 0xE400000000000000;
  v10 = objc_msgSend(v2, sel_code);
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 96) = v10;
  sub_230AE7E14(inited);
  v11 = objc_msgSend(v2, sel_userInfo);
  v12 = sub_230AEC9BC();

  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AD0);
  *(_QWORD *)&v41 = v12;
  sub_230AE8D7C(&v41, v40);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_230AE8508(v40, 0x6F666E4972657375, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  v14 = objc_allocWithZone((Class)UVPropertyList);
  swift_bridgeObjectRetain();
  v15 = (void *)sub_230AEC9B0();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v14, sel_initWithDictionary_, v15);

  v17 = &_OBJC___PROTOCOL_METHOD_TYPES_NSObject;
  objc_msgSend(v16, sel_encodeToXpcDictionary_, a1);
  if (xpc_dictionary_get_count(a1))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_255EA0A08 != -1)
      swift_once();
    v18 = sub_230AEC938();
    __swift_project_value_buffer(v18, (uint64_t)qword_255EA0C08);
    v19 = v2;
    v20 = sub_230AEC920();
    v21 = sub_230AECA40();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v39 = v16;
      v23 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v22 = 138412290;
      *(_QWORD *)&v41 = v19;
      v24 = v19;
      sub_230AECA88();
      *v23 = v19;

      _os_log_impl(&dword_230AE1000, v20, v21, "Failed to encode NSError: %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0A90);
      swift_arrayDestroy();
      v25 = v23;
      v16 = v39;
      MEMORY[0x2348BE240](v25, -1, -1);
      v26 = v22;
      v17 = &_OBJC___PROTOCOL_METHOD_TYPES_NSObject;
      MEMORY[0x2348BE240](v26, -1, -1);
    }
    else
    {

      v20 = v19;
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AD8);
    v27 = swift_initStackObject();
    *(_OWORD *)(v27 + 16) = xmmword_230AED2C0;
    *(_QWORD *)(v27 + 32) = sub_230AEC9D4();
    *(_QWORD *)(v27 + 40) = v28;
    v29 = -[NSObject localizedDescription](v19, sel_localizedDescription);
    v30 = sub_230AEC9D4();
    v32 = v31;

    *(_QWORD *)(v27 + 48) = v30;
    *(_QWORD *)(v27 + 56) = v32;
    *(_QWORD *)(v27 + 64) = sub_230AEC9D4();
    *(_QWORD *)(v27 + 72) = v33;
    *(_QWORD *)(v27 + 80) = 0xD000000000000038;
    *(_QWORD *)(v27 + 88) = 0x8000000230AEDAF0;
    v34 = sub_230AE7F3C(v27);
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AE0);
    *(_QWORD *)&v41 = v34;
    sub_230AE8D7C(&v41, v40);
    v35 = swift_isUniquelyReferenced_nonNull_native();
    sub_230AE8508(v40, 0x6F666E4972657375, 0xE800000000000000, v35);
    swift_bridgeObjectRelease();
    v36 = objc_allocWithZone((Class)UVPropertyList);
    v37 = (void *)sub_230AEC9B0();
    swift_bridgeObjectRelease();
    v38 = objc_msgSend(v36, sel_initWithDictionary_, v37);

    objc_msgSend(v38, v17[443], a1);
  }
}

uint64_t sub_230AE7870()
{
  uint64_t *v0;

  swift_unknownObjectRelease();
  sub_230AE8E78((uint64_t)(v0 + 3), &qword_255EA0A88);
  sub_230AE8074(v0[8]);
  sub_230AE8074(v0[10]);
  sub_230AE8074(v0[12]);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for XPCConnection()
{
  return objc_opt_self();
}

uint64_t sub_230AE78E0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_230AE78F8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for XPCError()
{
  return &type metadata for XPCError;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCListener.Service(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_230AE7974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  if ((a5 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for XPCListener.Service(uint64_t a1)
{
  return sub_230AE79B8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_230AE79B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result;

  if ((a5 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for XPCListener.Service(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_230AE7974(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for XPCListener.Service(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_230AE7974(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  sub_230AE79B8(v8, v9, v10, v11, v12);
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

uint64_t assignWithTake for XPCListener.Service(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(_BYTE *)(a1 + 32) = v3;
  sub_230AE79B8(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCListener.Service(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCListener.Service(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_230AE7BA4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_230AE7BB0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for XPCListener.Service()
{
  return &type metadata for XPCListener.Service;
}

unint64_t sub_230AE7BD0()
{
  unint64_t result;

  result = qword_255EA0A80;
  if (!qword_255EA0A80)
  {
    result = MEMORY[0x2348BE1C8](&unk_230AED3F0, &type metadata for XPCError);
    atomic_store(result, (unint64_t *)&qword_255EA0A80);
  }
  return result;
}

BOOL sub_230AE7C14(uint64_t a1, uint64_t a2)
{
  return xpc_equal(*(xpc_object_t *)(*(_QWORD *)a1 + 16), *(xpc_object_t *)(*(_QWORD *)a2 + 16));
}

uint64_t sub_230AE7C38()
{
  return sub_230AE5994();
}

void sub_230AE7C58(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_230AE7CA8()
{
  sub_230AECAAC();
  swift_bridgeObjectRelease();
  sub_230AEC9F8();
  sub_230AEC9F8();
  sub_230AEC9F8();
  swift_bridgeObjectRelease();
  return 0x6F72724520435058;
}

void sub_230AE7DBC()
{
  uint64_t v0;

  sub_230AE7C58(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348BE1B0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_230AE7E14(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AF0);
  v2 = sub_230AECB00();
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
    sub_230AE8DE8(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_230AE80C8(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_230AE8D7C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_230AE7F3C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AE8);
  v2 = (_QWORD *)sub_230AECB00();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_230AE80C8(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_230AE8074(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_230AE8084()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_230AE80A8(void *a1)
{
  sub_230AE3D04(a1);
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

unint64_t sub_230AE80C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_230AECB78();
  sub_230AEC9EC();
  v4 = sub_230AECB90();
  return sub_230AE812C(a1, a2, v4);
}

unint64_t sub_230AE812C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_230AECB30() & 1) == 0)
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
      while (!v14 && (sub_230AECB30() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_230AE820C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AF0);
  v6 = sub_230AECAF4();
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
        sub_230AE8D7C(v24, v35);
      }
      else
      {
        sub_230AE8DAC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_230AECB78();
      sub_230AEC9EC();
      result = sub_230AECB90();
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
      result = (uint64_t)sub_230AE8D7C(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_230AE8508(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_230AE80C8(a2, a3);
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
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
        return sub_230AE8D7C(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_230AE86A0();
      goto LABEL_7;
    }
    sub_230AE820C(v15, a4 & 1);
    v21 = sub_230AE80C8(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_230AE8638(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_230AECB3C();
  __break(1u);
  return result;
}

_OWORD *sub_230AE8638(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_230AE8D7C(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_230AE86A0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AF0);
  v2 = *v0;
  v3 = sub_230AECAE8();
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
    sub_230AE8DAC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_230AE8D7C(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

uint64_t sub_230AE8884()
{
  _xpc_connection_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;

  type metadata accessor for XPCConnection();
  swift_allocObject();
  v0 = (_xpc_connection_s *)swift_unknownObjectRetain();
  v1 = sub_230AE4DC8(v0);
  v2 = qword_255EA0A08;
  swift_retain();
  if (v2 != -1)
    swift_once();
  v3 = sub_230AEC938();
  __swift_project_value_buffer(v3, (uint64_t)qword_255EA0C08);
  swift_retain();
  v4 = sub_230AEC920();
  v5 = sub_230AECA4C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136446210;
    swift_retain();
    v8 = sub_230AE5994();
    v10 = v9;
    swift_release();
    sub_230AEBA58(v8, v10, &v12);
    sub_230AECA88();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230AE1000, v4, v5, "%{public}s initialized", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v7, -1, -1);
    MEMORY[0x2348BE240](v6, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
    swift_release_n();
  }
  return v1;
}

uint64_t sub_230AE8A7C(void *a1)
{
  uint64_t v2;
  void *v4;
  BOOL v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  BOOL v9;
  const char *v10;

  v2 = MEMORY[0x2348BE390]();
  if (v2 != sub_230AEC944())
  {
    MEMORY[0x2348BE330](a1);
    return sub_230AECA04();
  }
  v4 = (void *)sub_230AEC98C();
  v5 = xpc_equal(a1, v4);
  swift_unknownObjectRelease();
  if (v5)
    return 0;
  v6 = (void *)sub_230AEC974();
  v7 = xpc_equal(a1, v6);
  swift_unknownObjectRelease();
  if (v7)
  {
    if (xpc_connection_copy_invalidation_reason())
      return sub_230AECA04();
    return 0xD000000000000010;
  }
  else
  {
    v8 = (void *)sub_230AEC980();
    v9 = xpc_equal(a1, v8);
    swift_unknownObjectRelease();
    if (v9)
    {
      return 1;
    }
    else
    {
      v10 = (const char *)sub_230AEC968();
      if (xpc_dictionary_get_string(a1, v10))
        return sub_230AECA04();
      return 0xD000000000000010;
    }
  }
}

unint64_t sub_230AE8BC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EA0AA0;
  if (!qword_255EA0AA0)
  {
    v1 = sub_230AECA58();
    result = MEMORY[0x2348BE1C8](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_255EA0AA0);
  }
  return result;
}

unint64_t sub_230AE8C10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255EA0AB0;
  if (!qword_255EA0AB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255EA0AA8);
    result = MEMORY[0x2348BE1C8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255EA0AB0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348BE1BC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_230AE8CA0(void *a1)
{
  return sub_230AE4EB0(a1);
}

uint64_t sub_230AE8CA8(uint64_t a1, uint64_t a2)
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

uint64_t sub_230AE8D10()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_230AE8D3C(void *a1, void *a2)
{
  uint64_t v2;

  sub_230AE6DAC(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_230AE8D44(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_230AE8D7C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_230AE8DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_230AE8DE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0AF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_230AE8E30()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_230AE8E5C(void *a1)
{
  uint64_t v1;

  sub_230AE61E8(a1, *(_QWORD *)(v1 + 16), *(void (**)(_QWORD, _QWORD))(v1 + 24));
}

uint64_t sub_230AE8E68(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_230AE8E78(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_230AE8EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0A88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_230AE8EFC(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  xpc_connection_t mach_service;
  _xpc_connection_s *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  xpc_connection_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;

  v6 = sub_230AEC938();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = a3;
  if ((a3 & 1) != 0)
    v10 = 2;
  else
    v10 = 0;
  v11 = sub_230AEC9E0();
  mach_service = xpc_connection_create_mach_service((const char *)(v11 + 32), 0, v10);
  swift_release();
  type metadata accessor for XPCConnection();
  swift_allocObject();
  v13 = (_xpc_connection_s *)swift_unknownObjectRetain();
  v14 = sub_230AE4DC8(v13);
  v15 = qword_255EA0A08;
  swift_retain();
  if (v15 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v6, (uint64_t)qword_255EA0C08);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16, v6);
  swift_retain();
  swift_bridgeObjectRetain();
  v17 = sub_230AEC920();
  v18 = sub_230AECA4C();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v29 = a1;
    v20 = v19;
    v30 = swift_slowAlloc();
    v35 = v30;
    *(_DWORD *)v20 = 136446722;
    v32 = mach_service;
    swift_retain();
    v21 = sub_230AE5994();
    v31 = v7;
    v23 = v22;
    swift_release();
    v34 = sub_230AEBA58(v21, v23, &v35);
    sub_230AECA88();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    if ((v33 & 1) != 0)
      v24 = 0x67656C6976697270;
    else
      v24 = 0;
    if ((v33 & 1) != 0)
      v25 = 0xEB00000000206465;
    else
      v25 = 0xE000000000000000;
    v34 = sub_230AEBA58(v24, v25, &v35);
    sub_230AECA88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2082;
    swift_bridgeObjectRetain();
    v34 = sub_230AEBA58(v29, a2, &v35);
    sub_230AECA88();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_230AE1000, v17, v18, "Client %{public}s initialized for %{public}smachService %{public}s", (uint8_t *)v20, 0x20u);
    v26 = v30;
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v26, -1, -1);
    MEMORY[0x2348BE240](v20, -1, -1);
    swift_unknownObjectRelease();

    (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v6);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v14;
}

uint64_t sub_230AE9268()
{
  _xpc_connection_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;

  xpc_connection_enable_sim2host_4sim();
  type metadata accessor for XPCConnection();
  swift_allocObject();
  v0 = (_xpc_connection_s *)swift_unknownObjectRetain();
  v1 = sub_230AE4DC8(v0);
  v2 = qword_255EA0A08;
  swift_retain();
  if (v2 != -1)
    swift_once();
  v3 = sub_230AEC938();
  __swift_project_value_buffer(v3, (uint64_t)qword_255EA0C08);
  swift_retain();
  v4 = sub_230AEC920();
  v5 = sub_230AECA4C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136446210;
    swift_retain();
    v8 = sub_230AE5994();
    v10 = v9;
    swift_release();
    sub_230AEBA58(v8, v10, &v12);
    sub_230AECA88();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230AE1000, v4, v5, "HostToSim Client %{public}s initialized", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v7, -1, -1);
    MEMORY[0x2348BE240](v6, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
    swift_release_n();
  }
  return v1;
}

uint64_t destroy for XPCError.Kind(uint64_t a1)
{
  return sub_230AE78F8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s16PreviewsServices8XPCErrorV4KindOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_230AE78E0(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s16PreviewsServices8XPCErrorV4KindOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_230AE78E0(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_230AE78F8(v6, v7, v8);
  return a1;
}

uint64_t _s16PreviewsServices8XPCErrorV4KindOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_230AE78F8(v4, v5, v6);
  return a1;
}

uint64_t _s16PreviewsServices8XPCErrorV4KindOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s16PreviewsServices8XPCErrorV4KindOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_230AE95E0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_230AE95F8(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCError.Kind()
{
  return &type metadata for XPCError.Kind;
}

void sub_230AE9638()
{
  __asm { BR              X11 }
}

unint64_t sub_230AE9668()
{
  sub_230AEC9F8();
  swift_bridgeObjectRelease();
  return 0xD000000000000025;
}

void PreviewsService.description.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_230AE97D0()
{
  sub_230AEC9F8();
  swift_bridgeObjectRelease();
  return 0x6C6C6174736E69;
}

uint64_t sub_230AE9910(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aInstall_1[8 * a1] == *(_QWORD *)&aInstall_1[8 * a2]
    && *(_QWORD *)&aAgentpipcrashl[8 * a1 + 24] == *(_QWORD *)&aAgentpipcrashl[8 * a2 + 24])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_230AECB30();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_230AE9994()
{
  sub_230AECB78();
  sub_230AEC9EC();
  swift_bridgeObjectRelease();
  return sub_230AECB90();
}

uint64_t sub_230AE99FC()
{
  sub_230AEC9EC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_230AE9A3C()
{
  sub_230AECB78();
  sub_230AEC9EC();
  swift_bridgeObjectRelease();
  return sub_230AECB90();
}

BOOL static PreviewsService.Variant.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PreviewsService.Variant.hash(into:)()
{
  return sub_230AECB84();
}

uint64_t PreviewsService.Variant.hashValue.getter()
{
  sub_230AECB78();
  sub_230AECB84();
  return sub_230AECB90();
}

BOOL sub_230AE9B24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_230AE9B3C()
{
  sub_230AECB78();
  sub_230AECB84();
  return sub_230AECB90();
}

uint64_t sub_230AE9B80()
{
  return sub_230AECB84();
}

uint64_t sub_230AE9BA8()
{
  sub_230AECB78();
  sub_230AECB84();
  return sub_230AECB90();
}

uint64_t PreviewsService.Variant.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 6513005;
  else
    return 0x746C7561666564;
}

PreviewsServices::PreviewsServiceConnection::Service_optional __swiftcall PreviewsServiceConnection.Service.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  PreviewsServices::PreviewsServiceConnection::Service_optional result;
  char v5;

  v2 = v1;
  v3 = sub_230AECB18();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t PreviewsServiceConnection.Service.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aInstall_1[8 * *v0];
}

uint64_t sub_230AE9CA0(char *a1, char *a2)
{
  return sub_230AE9910(*a1, *a2);
}

uint64_t sub_230AE9CAC()
{
  return sub_230AE9994();
}

uint64_t sub_230AE9CB4()
{
  return sub_230AE99FC();
}

uint64_t sub_230AE9CBC()
{
  return sub_230AE9A3C();
}

PreviewsServices::PreviewsServiceConnection::Service_optional sub_230AE9CC4(Swift::String *a1)
{
  return PreviewsServiceConnection.Service.init(rawValue:)(*a1);
}

uint64_t sub_230AE9CD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PreviewsServiceConnection.Service.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id PreviewsServiceConnection.auditToken.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

uint64_t PreviewsServiceConnection.__allocating_init(service:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _OWORD v6[4];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sub_230AE9638();
  v2 = sub_230AE8EFC(v0, v1, 1);
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  swift_retain();
  xpc_connection_get_audit_token();
  memset(v6, 0, sizeof(v6));
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BDB8]), sel_initWithAuditToken_, v6);
  swift_release();
  *(_QWORD *)(v3 + 24) = v4;
  return v3;
}

{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _OWORD v6[4];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sub_230AE9638();
  v2 = sub_230AE8EFC(v0, v1, 1);
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  swift_retain();
  xpc_connection_get_audit_token();
  memset(v6, 0, sizeof(v6));
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BDB8]), sel_initWithAuditToken_, v6);
  swift_release();
  *(_QWORD *)(v3 + 24) = v4;
  return v3;
}

uint64_t PreviewsServiceConnection.__allocating_init(hostToSimConnection:)()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  _OWORD v4[4];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  swift_unknownObjectRetain();
  v0 = sub_230AE9268();
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v0;
  swift_retain();
  xpc_connection_get_audit_token();
  memset(v4, 0, sizeof(v4));
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BDB8]), sel_initWithAuditToken_, v4);
  swift_unknownObjectRelease();
  swift_release();
  *(_QWORD *)(v1 + 24) = v2;
  return v1;
}

id PreviewsServiceConnection.remotePid.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 24), sel_pid);
}

uint64_t PreviewsServiceConnection.interruptionHandler.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 64);
  sub_230AE8E68(v1);
  return v1;
}

uint64_t sub_230AEA028@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = *(_QWORD *)(v3 + 72);
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_230AEB6CC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_230AE8E68(v4);
}

uint64_t sub_230AEA094(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_230AEB6CC;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  v8 = *(_QWORD *)(v7 + 64);
  *(_QWORD *)(v7 + 64) = v6;
  *(_QWORD *)(v7 + 72) = v5;
  sub_230AE8E68(v3);
  return sub_230AE8074(v8);
}

uint64_t PreviewsServiceConnection.interruptionHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v3 + 64);
  *(_QWORD *)(v3 + 64) = a1;
  *(_QWORD *)(v3 + 72) = a2;
  return sub_230AE8074(v4);
}

uint64_t (*PreviewsServiceConnection.interruptionHandler.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 16);
  a1[2] = v3;
  v4 = *(_QWORD *)(v3 + 64);
  v5 = *(_QWORD *)(v3 + 72);
  *a1 = v4;
  a1[1] = v5;
  sub_230AE8E68(v4);
  return sub_230AEA164;
}

uint64_t sub_230AEA164(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a1[1];
  v2 = a1[2];
  v4 = *a1;
  v5 = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(v2 + 64) = *a1;
  *(_QWORD *)(v2 + 72) = v3;
  if ((a2 & 1) != 0)
  {
    sub_230AE8E68(v4);
    sub_230AE8074(v5);
    v6 = v4;
  }
  else
  {
    v6 = v5;
  }
  return sub_230AE8074(v6);
}

uint64_t PreviewsServiceConnection.invalidationHandler.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 80);
  sub_230AE8E68(v1);
  return v1;
}

uint64_t sub_230AEA1F8@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v4 = *(_QWORD *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 88);
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_230AEB6AC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_230AE8E68(v4);
}

uint64_t sub_230AEA264(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_230AEB6AC;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  v8 = *(_QWORD *)(v7 + 80);
  *(_QWORD *)(v7 + 80) = v6;
  *(_QWORD *)(v7 + 88) = v5;
  sub_230AE8E68(v3);
  return sub_230AE8074(v8);
}

uint64_t PreviewsServiceConnection.invalidationHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v3 + 80);
  *(_QWORD *)(v3 + 80) = a1;
  *(_QWORD *)(v3 + 88) = a2;
  return sub_230AE8074(v4);
}

uint64_t (*PreviewsServiceConnection.invalidationHandler.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 16);
  a1[2] = v3;
  v4 = *(_QWORD *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 88);
  *a1 = v4;
  a1[1] = v5;
  sub_230AE8E68(v4);
  return sub_230AEA334;
}

uint64_t sub_230AEA334(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a1[1];
  v2 = a1[2];
  v4 = *a1;
  v5 = *(_QWORD *)(v2 + 80);
  *(_QWORD *)(v2 + 80) = *a1;
  *(_QWORD *)(v2 + 88) = v3;
  if ((a2 & 1) != 0)
  {
    sub_230AE8E68(v4);
    sub_230AE8074(v5);
    v6 = v4;
  }
  else
  {
    v6 = v5;
  }
  return sub_230AE8074(v6);
}

Swift::Void __swiftcall PreviewsServiceConnection.invalidate()()
{
  sub_230AE4904();
}

uint64_t PreviewsServiceConnection.activate(receiver:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  ValueMetadata *v5;
  _UNKNOWN **v6;
  __int128 v7[2];

  sub_230AEAD28(a1, (uint64_t)&v4);
  if (v5)
  {
    sub_230AEADB0(&v4, (uint64_t)v7);
    v2 = *(_QWORD *)(v1 + 16);
    v5 = &type metadata for PreviewsServiceConnection.InterfaceTarget;
    v6 = &off_24FED1578;
    *(_QWORD *)&v4 = swift_allocObject();
    sub_230AEADB0(v7, v4 + 16);
    swift_beginAccess();
    sub_230AE8EB4((uint64_t)&v4, v2 + 24);
    swift_endAccess();
  }
  else
  {
    sub_230AEAD70((uint64_t)&v4);
  }
  return sub_230AE5B58();
}

Swift::Void __swiftcall PreviewsServiceConnection.send(message:)(UVPropertyList message)
{
  sub_230AE5D50(message.super.isa);
}

uint64_t PreviewsServiceConnection.send(message:replyHandler:)(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_230AE5F44(a1, a2, a3);
}

uint64_t PreviewsServiceConnection.deinit()
{
  uint64_t v0;

  swift_release();

  return v0;
}

uint64_t PreviewsServiceConnection.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();

  return swift_deallocClassInstance();
}

char *static PreviewsServiceConnection.Listener.local(service:)(unsigned __int8 *a1)
{
  objc_class *v1;
  objc_class *v2;
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;
  _QWORD v13[4];
  char v14;

  v2 = v1;
  v3 = *a1;
  v4 = (char *)objc_allocWithZone(v1);
  v5 = &v4[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_connectionHandler];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v13[0] = v3;
  type metadata accessor for XPCListener();
  memset(&v13[1], 0, 24);
  v14 = 0;
  swift_allocObject();
  v6 = v4;
  *(_QWORD *)&v6[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_listener] = sub_230AE35B4((uint64_t)v13);

  v12.receiver = v6;
  v12.super_class = v2;
  v7 = (char *)objc_msgSendSuper2(&v12, sel_init);
  v8 = *(_QWORD *)&v7[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_listener];
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10 = *(_QWORD *)(v8 + 64);
  *(_QWORD *)(v8 + 64) = sub_230AEAE10;
  *(_QWORD *)(v8 + 72) = v9;
  sub_230AE8074(v10);
  return v7;
}

char *static PreviewsServiceConnection.Listener.hostToSim(machServiceName:description:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  objc_class *v5;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;
  _QWORD v19[4];
  char v20;

  v5 = v4;
  v10 = (char *)objc_allocWithZone(v5);
  v11 = &v10[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_connectionHandler];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  v19[0] = a1;
  v19[1] = a2;
  v19[2] = a3;
  v19[3] = a4;
  v20 = 1;
  type metadata accessor for XPCListener();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = v10;
  *(_QWORD *)&v12[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_listener] = sub_230AE35B4((uint64_t)v19);

  v18.receiver = v12;
  v18.super_class = v5;
  v13 = (char *)objc_msgSendSuper2(&v18, sel_init);
  v14 = *(_QWORD *)&v13[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_listener];
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = *(_QWORD *)(v14 + 64);
  *(_QWORD *)(v14 + 64) = sub_230AEAE10;
  *(_QWORD *)(v14 + 72) = v15;
  sub_230AE8074(v16);
  return v13;
}

uint64_t sub_230AEA708(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  char *v5;
  unint64_t v6;
  char **v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  void (*v31)(uint64_t);
  id v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2 + 16;
  swift_beginAccess();
  result = MEMORY[0x2348BE2A0](v3);
  if (result)
  {
    v5 = (char *)result;
    v38 = 0u;
    v39 = 0u;
    xpc_connection_get_audit_token();
    v6 = 0x24BE0B000uLL;
    v7 = &_OBJC___PROTOCOL_METHOD_TYPES_NSObject;
    v36 = 0u;
    v37 = 0u;
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BDB8]), sel_initWithAuditToken_, &v36);
    v9 = objc_msgSend(v8, sel_bundleID);
    if (v9)
    {
      v10 = v9;
      v11 = sub_230AEC9D4();
      v13 = v12;

    }
    else
    {
      v13 = 0xE700000000000000;
      v11 = 0x6E776F6E6B6E55;
    }
    v14 = (void *)sub_230AEC9C8();
    v15 = objc_msgSend(v8, sel_hasEntitlement_, v14);

    if (v15)
    {
      v34 = v11;
      if (qword_255EA0A00 != -1)
        swift_once();
      v16 = sub_230AEC938();
      __swift_project_value_buffer(v16, (uint64_t)qword_255EA0BF0);
      swift_bridgeObjectRetain();
      v17 = sub_230AEC920();
      v18 = sub_230AECA28();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = (uint8_t *)swift_slowAlloc();
        v32 = v8;
        v20 = swift_slowAlloc();
        *(_QWORD *)&v38 = v20;
        *(_DWORD *)v19 = 136446210;
        swift_bridgeObjectRetain();
        *(_QWORD *)&v36 = sub_230AEBA58(v34, v13, (uint64_t *)&v38);
        v6 = 0x24BE0B000;
        sub_230AECA88();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_230AE1000, v17, v18, "Accepting new connection from entitled client: %{public}s", v19, 0xCu);
        swift_arrayDestroy();
        v21 = v20;
        v8 = v32;
        MEMORY[0x2348BE240](v21, -1, -1);
        v22 = v19;
        v7 = &_OBJC___PROTOCOL_METHOD_TYPES_NSObject;
        MEMORY[0x2348BE240](v22, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      type metadata accessor for PreviewsServiceConnection();
      v28 = swift_allocObject();
      *(_QWORD *)(v28 + 16) = a1;
      v38 = 0u;
      v39 = 0u;
      swift_retain();
      xpc_connection_get_audit_token();
      v33 = v39;
      v35 = v38;
      v29 = objc_allocWithZone(*(Class *)(v6 + 3512));
      v30 = v7[441];
      v36 = v35;
      v37 = v33;
      *(_QWORD *)(v28 + 24) = objc_msgSend(v29, v30, &v36);
      v31 = *(void (**)(uint64_t))&v5[OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_connectionHandler];
      if (v31)
      {
        swift_retain();
        v31(v28);
        sub_230AE8074((uint64_t)v31);
      }

      swift_release();
      return 1;
    }
    else
    {
      if (qword_255EA0A00 != -1)
        swift_once();
      v23 = sub_230AEC938();
      __swift_project_value_buffer(v23, (uint64_t)qword_255EA0BF0);
      swift_bridgeObjectRetain();
      v24 = sub_230AEC920();
      v25 = sub_230AECA28();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        v27 = swift_slowAlloc();
        *(_QWORD *)&v38 = v27;
        *(_DWORD *)v26 = 136446210;
        swift_bridgeObjectRetain();
        *(_QWORD *)&v36 = sub_230AEBA58(v11, v13, (uint64_t *)&v38);
        sub_230AECA88();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_230AE1000, v24, v25, "Rejecting connection from unentitled client: %{public}s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2348BE240](v27, -1, -1);
        MEMORY[0x2348BE240](v26, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      return 0;
    }
  }
  return result;
}

uint64_t PreviewsServiceConnection.Listener.activate(handler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_connectionHandler);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtCC16PreviewsServices25PreviewsServiceConnection8Listener_connectionHandler);
  *v3 = a1;
  v3[1] = a2;
  sub_230AE8074(v4);
  swift_retain();
  return sub_230AE4D8C();
}

id PreviewsServiceConnection.Listener.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PreviewsServiceConnection.Listener.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PreviewsServiceConnection.Listener.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_230AEAD28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_230AEAD70(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0B70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_230AEADB0(__int128 *a1, uint64_t a2)
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

uint64_t sub_230AEADC8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_230AEADEC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_230AEAE10(uint64_t a1)
{
  uint64_t v1;

  return sub_230AEA708(a1, v1);
}

unint64_t sub_230AEAE1C()
{
  unint64_t result;

  result = qword_255EA0B88;
  if (!qword_255EA0B88)
  {
    result = MEMORY[0x2348BE1C8](&protocol conformance descriptor for PreviewsService.Variant, &type metadata for PreviewsService.Variant);
    atomic_store(result, (unint64_t *)&qword_255EA0B88);
  }
  return result;
}

unint64_t sub_230AEAE64()
{
  unint64_t result;

  result = qword_255EA0B90;
  if (!qword_255EA0B90)
  {
    result = MEMORY[0x2348BE1C8](&protocol conformance descriptor for PreviewsServiceConnection.Service, &type metadata for PreviewsServiceConnection.Service);
    atomic_store(result, (unint64_t *)&qword_255EA0B90);
  }
  return result;
}

uint64_t dispatch thunk of PreviewsServiceMessageReceiver.receive(message:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of PreviewsServiceMessageReceiver.receive(message:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewsService(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;

  if (!a2)
    return 0;
  if (a2 < 0x7C)
    goto LABEL_17;
  if (a2 + 132 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 132) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 132;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 132;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 132;
  }
LABEL_17:
  v6 = ((*a1 >> 5) & 0xFFFFFF87 | (8 * ((*a1 >> 1) & 0xF))) ^ 0x7F;
  if (v6 >= 0x7B)
    v6 = -1;
  return v6 + 1;
}

uint64_t storeEnumTagSinglePayload for PreviewsService(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 132 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 132) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x7C)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x7B)
    return ((uint64_t (*)(void))((char *)&loc_230AEAFC4 + 4 * byte_230AED4BF[v4]))();
  *a1 = a2 - 124;
  return ((uint64_t (*)(void))((char *)sub_230AEAFF8 + 4 * byte_230AED4BA[v4]))();
}

uint64_t sub_230AEAFF8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230AEB000(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230AEB008);
  return result;
}

uint64_t sub_230AEB020(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230AEB028);
  *(_BYTE *)result = 2 * (((-a2 >> 3) & 0xF) - 16 * a2);
  return result;
}

uint64_t sub_230AEB02C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230AEB034(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230AEB040(_BYTE *a1)
{
  int v1;

  v1 = (char)*a1;
  if (v1 >= 0)
    return *a1 >> 5;
  else
    return v1 & 1 | 4u;
}

_BYTE *sub_230AEB05C(_BYTE *result)
{
  *result &= 0x1Fu;
  return result;
}

_BYTE *sub_230AEB06C(_BYTE *result, unsigned int a2)
{
  if (a2 < 4)
    *result = *result & 1 | (32 * a2);
  else
    *result = a2 & 1 | 0x80;
  return result;
}

ValueMetadata *type metadata accessor for PreviewsService()
{
  return &type metadata for PreviewsService;
}

uint64_t getEnumTagSinglePayload for PreviewsService.Variant(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PreviewsService.Variant(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230AEB184 + 4 * byte_230AED4C9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_230AEB1B8 + 4 * byte_230AED4C4[v4]))();
}

uint64_t sub_230AEB1B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230AEB1C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230AEB1C8);
  return result;
}

uint64_t sub_230AEB1D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230AEB1DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_230AEB1E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230AEB1E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230AEB1F4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_230AEB1FC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewsService.Variant()
{
  return &type metadata for PreviewsService.Variant;
}

uint64_t type metadata accessor for PreviewsServiceConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for PreviewsServiceConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t getEnumTagSinglePayload for PreviewsServiceConnection.Service(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PreviewsServiceConnection.Service(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_230AEB320 + 4 * byte_230AED4D3[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_230AEB354 + 4 * byte_230AED4CE[v4]))();
}

uint64_t sub_230AEB354(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_230AEB35C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x230AEB364);
  return result;
}

uint64_t sub_230AEB370(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x230AEB378);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_230AEB37C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_230AEB384(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_230AEB390(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PreviewsServiceConnection.Service()
{
  return &type metadata for PreviewsServiceConnection.Service;
}

uint64_t type metadata accessor for PreviewsServiceConnection.Listener()
{
  return objc_opt_self();
}

uint64_t method lookup function for PreviewsServiceConnection.Listener()
{
  return swift_lookUpClassMethod();
}

uint64_t initializeWithCopy for PreviewsServiceConnection.InterfaceTarget(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for PreviewsServiceConnection.InterfaceTarget(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for PreviewsServiceConnection.InterfaceTarget(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewsServiceConnection.InterfaceTarget(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewsServiceConnection.InterfaceTarget(uint64_t result, int a2, int a3)
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
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewsServiceConnection.InterfaceTarget()
{
  return &type metadata for PreviewsServiceConnection.InterfaceTarget;
}

uint64_t sub_230AEB688()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_230AEB6AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_230AEB6DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_230AEB74C;
  v6[3] = a2;
  v6[4] = v2;
  v6[2] = a1;
  return swift_task_switch();
}

uint64_t sub_230AEB74C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t static MinimalRegistryEntry.scrapeRuntimeForEntriesAsync()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_230AEB7B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 24) + 64))(*(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_230AEB7F0()
{
  return static MinimalRegistryEntry.scrapeRuntimeForEntries()();
}

uint64_t static MinimalRegistryEntry.scrapeRuntimeForEntries()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;

  if (qword_255EA0A00 != -1)
    swift_once();
  v0 = sub_230AEC938();
  __swift_project_value_buffer(v0, (uint64_t)qword_255EA0BF0);
  v1 = sub_230AEC920();
  v2 = sub_230AECA40();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v8 = v4;
    *(_DWORD *)v3 = 136315138;
    v5 = sub_230AECB9C();
    sub_230AEBA58(v5, v6, &v8);
    sub_230AECA88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_230AE1000, v1, v2, "%s does not implement 'scrapeRuntimeForEntriesAsync'", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348BE240](v4, -1, -1);
    MEMORY[0x2348BE240](v3, -1, -1);
  }

  return sub_230AECA1C();
}

uint64_t sub_230AEB984(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_230AEB994(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_230AEB9C8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_230AEB9E8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_230AEBA58(v6, v7, a3);
  v8 = *a1 + 8;
  sub_230AECA88();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_230AEBA58(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_230AEBB28(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_230AE8DAC((uint64_t)v12, *a3);
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
      sub_230AE8DAC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_230AEBB28(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_230AECA94();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_230AEBCE0(a5, a6);
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
  v8 = sub_230AECAC4();
  if (!v8)
  {
    sub_230AECADC();
    __break(1u);
LABEL_17:
    result = sub_230AECB0C();
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

uint64_t sub_230AEBCE0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_230AEBD74(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_230AEBF4C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_230AEBF4C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_230AEBD74(uint64_t a1, unint64_t a2)
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
      v3 = sub_230AEBEE8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_230AECAB8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_230AECADC();
      __break(1u);
LABEL_10:
      v2 = sub_230AECA10();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_230AECB0C();
    __break(1u);
LABEL_14:
    result = sub_230AECADC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_230AEBEE8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0BB8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_230AEBF4C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255EA0BB8);
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
  result = sub_230AECB0C();
  __break(1u);
  return result;
}

_BYTE **sub_230AEC098(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t dispatch thunk of MinimalRegistryEntry.fileID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of MinimalRegistryEntry.line.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of MinimalRegistryEntry.column.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of MinimalRegistryEntry.makeExecutable()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 40) + *(_QWORD *)(a3 + 40));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_230AEC13C;
  return v9(a1, a2, a3);
}

uint64_t sub_230AEC13C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of static MinimalRegistryEntry.typeDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static MinimalRegistryEntry.scrapeRuntimeForEntriesAsync()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 56) + *(_QWORD *)(a2 + 56));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_230AEC21C;
  return v7(a1, a2);
}

uint64_t dispatch thunk of static MinimalRegistryEntry.scrapeRuntimeForEntries()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of static RegistryEntry.registryTypeRawValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of RegistryExecutable.metadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of RegistryExecutable.run()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

unint64_t static OS_os_log.UltravioletConstants.subsystem.getter()
{
  return 0xD000000000000015;
}

void sub_230AEC23C()
{
  qword_255EA0BC0 = 30325;
  *(_QWORD *)algn_255EA0BC8 = 0xE200000000000000;
}

uint64_t static OS_os_log.UltravioletConstants.Categories.uv.getter()
{
  return sub_230AEC2B4(&qword_255EA09E0, &qword_255EA0BC0);
}

void sub_230AEC274()
{
  qword_255EA0BD0 = 0x63707862696CLL;
  *(_QWORD *)algn_255EA0BD8 = 0xE600000000000000;
}

uint64_t static OS_os_log.UltravioletConstants.Categories.libxpc.getter()
{
  return sub_230AEC2B4(&qword_255EA09E8, &qword_255EA0BD0);
}

uint64_t sub_230AEC2B4(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_230AEC304()
{
  uint64_t result;

  sub_230AEC754();
  if (qword_255EA09E0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = sub_230AECA7C();
  qword_255EA0BE0 = result;
  return result;
}

id static OS_os_log.uvOS.getter()
{
  return sub_230AEC42C(&qword_255EA09F0, (id *)&qword_255EA0BE0);
}

uint64_t sub_230AEC3B4()
{
  uint64_t result;

  sub_230AEC754();
  result = sub_230AECA7C();
  qword_255EA0BE8 = result;
  return result;
}

id static OS_os_log.services.getter()
{
  return sub_230AEC42C(&qword_255EA09F8, (id *)&qword_255EA0BE8);
}

id sub_230AEC42C(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

uint64_t sub_230AEC464()
{
  uint64_t v0;

  v0 = sub_230AEC938();
  __swift_allocate_value_buffer(v0, qword_255EA0BF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_255EA0BF0);
  if (qword_255EA09E0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_230AEC92C();
}

uint64_t static Logger.uvOS.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_230AEC5FC(&qword_255EA0A00, (uint64_t)qword_255EA0BF0, a1);
}

uint64_t sub_230AEC530()
{
  uint64_t v0;

  v0 = sub_230AEC938();
  __swift_allocate_value_buffer(v0, qword_255EA0C08);
  __swift_project_value_buffer(v0, (uint64_t)qword_255EA0C08);
  if (qword_255EA09E8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_230AEC92C();
}

uint64_t static Logger.libxpc.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_230AEC5FC(&qword_255EA0A08, (uint64_t)qword_255EA0C08, a1);
}

uint64_t sub_230AEC5FC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_230AEC938();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_230AEC664()
{
  uint64_t v0;

  v0 = sub_230AEC938();
  __swift_allocate_value_buffer(v0, qword_255EA0C20);
  __swift_project_value_buffer(v0, (uint64_t)qword_255EA0C20);
  return sub_230AEC92C();
}

uint64_t static Logger.services.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_230AEC5FC(qword_255EA0A10, (uint64_t)qword_255EA0C20, a1);
}

ValueMetadata *type metadata accessor for OS_os_log.UltravioletConstants()
{
  return &type metadata for OS_os_log.UltravioletConstants;
}

ValueMetadata *type metadata accessor for OS_os_log.UltravioletConstants.Categories()
{
  return &type metadata for OS_os_log.UltravioletConstants.Categories;
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

unint64_t sub_230AEC754()
{
  unint64_t result;

  result = qword_255EA0C38;
  if (!qword_255EA0C38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255EA0C38);
  }
  return result;
}

uint64_t sub_230AEC8FC()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_230AEC908()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_230AEC914()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_230AEC920()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_230AEC92C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_230AEC938()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_230AEC944()
{
  return MEMORY[0x24BEE6470]();
}

uint64_t sub_230AEC950()
{
  return MEMORY[0x24BEE64B0]();
}

uint64_t sub_230AEC95C()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t sub_230AEC968()
{
  return MEMORY[0x24BEE64C0]();
}

uint64_t sub_230AEC974()
{
  return MEMORY[0x24BEE64C8]();
}

uint64_t sub_230AEC980()
{
  return MEMORY[0x24BEE64D0]();
}

uint64_t sub_230AEC98C()
{
  return MEMORY[0x24BEE64D8]();
}

uint64_t sub_230AEC998()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_230AEC9A4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_230AEC9B0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_230AEC9BC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_230AEC9C8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_230AEC9D4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_230AEC9E0()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_230AEC9EC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_230AEC9F8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_230AECA04()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_230AECA10()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_230AECA1C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_230AECA28()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_230AECA34()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_230AECA40()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_230AECA4C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_230AECA58()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_230AECA64()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_230AECA70()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_230AECA7C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_230AECA88()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_230AECA94()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_230AECAA0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_230AECAAC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_230AECAB8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_230AECAC4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_230AECAD0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_230AECADC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_230AECAE8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_230AECAF4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_230AECB00()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_230AECB0C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_230AECB18()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_230AECB24()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_230AECB30()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_230AECB3C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_230AECB48()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_230AECB54()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_230AECB60()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_230AECB6C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_230AECB78()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_230AECB84()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_230AECB90()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_230AECB9C()
{
  return MEMORY[0x24BEE4A98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
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

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x24BDB0728]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_enable_sim2host_4sim()
{
  return MEMORY[0x24BDB0748]();
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x24BDB0A08](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

