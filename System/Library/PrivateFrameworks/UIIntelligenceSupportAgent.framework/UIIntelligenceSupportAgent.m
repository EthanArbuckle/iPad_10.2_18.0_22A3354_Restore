BOOL sub_249688010(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_249688024(uint64_t a1, uint64_t a2)
{
  return sub_24968816C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_249688030(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2496BAEE8();
  *a2 = 0;
  return result;
}

uint64_t sub_2496880A4(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2496BAEF4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_249688120@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2496BAF00();
  v2 = sub_2496BAEDC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_249688160(uint64_t a1, uint64_t a2)
{
  return sub_24968816C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_24968816C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2496BAF00();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2496881A8()
{
  sub_2496BAF00();
  sub_2496BAF30();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2496881E8()
{
  uint64_t v0;

  sub_2496BAF00();
  sub_2496BB3B0();
  sub_2496BAF30();
  v0 = sub_2496BB3C8();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_249688258(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_249688264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2496BAF00();
  v2 = v1;
  if (v0 == sub_2496BAF00() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2496BB380();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2496882EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2496BAEDC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_249688330@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2496BAF00();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_249688560(a1, &qword_2544AFF00);
}

void type metadata accessor for DMFEffectivePolicyType(uint64_t a1)
{
  sub_249688560(a1, &qword_2578765A8);
}

void type metadata accessor for CGRegion(uint64_t a1)
{
  sub_249688560(a1, &qword_2578765B0);
}

uint64_t sub_249688394()
{
  sub_249688448(&qword_2578765D0, (uint64_t)&unk_2496BBC0C);
  sub_249688448(&qword_2578765D8, (uint64_t)&unk_2496BBB6C);
  return sub_2496BB29C();
}

uint64_t sub_249688400()
{
  return sub_249688448(&qword_2578765B8, (uint64_t)&unk_2496BBB34);
}

uint64_t sub_249688424()
{
  return sub_249688448(&qword_2578765C0, (uint64_t)&unk_2496BBB0C);
}

uint64_t sub_249688448(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for DMFEffectivePolicyType(255);
    result = MEMORY[0x24BCF5F5C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_249688488()
{
  return sub_249688448(&qword_2578765C8, (uint64_t)&unk_2496BBB9C);
}

uint64_t _s17RequestParametersV20VisibilityThresholdsVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_2496884F4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_249688514(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
  sub_249688560(a1, (unint64_t *)&unk_2578765E0);
}

void sub_249688560(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2496885A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _xpc_connection_s *mach_service;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2496BADB0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496BA8B8();
  v6 = sub_2496BAF24();
  swift_bridgeObjectRelease();
  mach_service = xpc_connection_create_mach_service((const char *)(v6 + 32), 0, 1uLL);
  swift_release();
  xpc_connection_set_non_launching();
  v8 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_24968BBB0;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24968A5CC;
  aBlock[3] = &block_descriptor;
  v9 = _Block_copy(aBlock);
  swift_release();
  xpc_connection_set_event_handler(mach_service, v9);
  _Block_release(v9);
  sub_2496BAD8C();
  v10 = sub_2496BADA4();
  v11 = sub_2496BB008();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_249686000, v10, v11, "Activating xpc listener", v12, 2u);
    MEMORY[0x24BCF5FEC](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  xpc_connection_activate(mach_service);
  *(_QWORD *)(v1 + 32) = mach_service;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  swift_retain();
  sub_2496BACA8();
  swift_unknownObjectRelease();
  return swift_release();
}

void sub_2496887A0(_xpc_connection_s *a1, _xpc_connection_s *a2)
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _xpc_connection_s *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t Strong;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  os_unfair_lock_s *v44;
  uint64_t *v45;
  char *v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  int v50;
  uint8_t *v51;
  uint64_t *v52;
  uint64_t v53;
  unint64_t v54;
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
  unint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  os_unfair_lock_s *v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  id v81;
  _QWORD v82[3];
  uint64_t v83;
  int v84;
  void *v85;
  uint64_t *v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  _xpc_connection_s *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  _QWORD v106[2];
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  uint64_t v110;
  uint64_t v111;

  v101 = a2;
  v111 = *MEMORY[0x24BDAC8D0];
  v99 = type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient(0);
  MEMORY[0x24BDAC7A8](v99);
  v100 = (uint64_t)v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2496BADE0();
  MEMORY[0x24BDAC7A8](v4);
  v98 = (char *)v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2496BADB0();
  v102 = *(_QWORD *)(v6 - 8);
  v103 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v104 = (char *)v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v95 = (char *)v82 - v9;
  v94 = type metadata accessor for ConnectionID();
  v96 = *(_QWORD *)(v94 - 8);
  v10 = *(_QWORD *)(v96 + 64);
  v11 = MEMORY[0x24BDAC7A8](v94);
  v93 = (uint64_t)v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v97 = (uint64_t)v82 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v82 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)v82 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)v82 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (_QWORD *)((char *)v82 - v23);
  v25 = sub_2496BAB10();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)v82 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = a1;
  v30 = MEMORY[0x24BCF6118](a1);
  if (v30 == sub_2496BADBC())
  {
    v86 = (uint64_t *)v19;
    v88 = v22;
    v87 = v10;
    v89 = v16;
    v104 = v28;
    v90 = v26;
    v91 = v25;
    v92 = v24;
    swift_beginAccess();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      v40 = Strong;
      v108 = 0u;
      v109 = 0u;
      v101 = v29;
      xpc_connection_get_audit_token();
      v41 = (uint64_t)v104;
      sub_24968936C(v108, *((unint64_t *)&v108 + 1), v109, *((unint64_t *)&v109 + 1));
      v42 = *(_QWORD *)(v40 + 48);
      v43 = v42 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v42 + 16);
      v44 = (os_unfair_lock_s *)(v42 + ((*(unsigned int *)(*(_QWORD *)v42 + 48) + 3) & 0x1FFFFFFFCLL));
      swift_retain();
      os_unfair_lock_lock(v44);
      v45 = v92;
      sub_24968948C(v43, v41, v92);
      v85 = 0;
      os_unfair_lock_unlock(v44);
      swift_release();
      v46 = v95;
      sub_2496BAD8C();
      v47 = (uint64_t)v88;
      sub_24968BA44((uint64_t)v45, (uint64_t)v88, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v48 = sub_2496BADA4();
      v49 = sub_2496BB008();
      v50 = v49;
      if (os_log_type_enabled(v48, v49))
      {
        v84 = v50;
        v51 = (uint8_t *)swift_slowAlloc();
        v83 = swift_slowAlloc();
        v107 = v83;
        *(_DWORD *)v51 = 136315138;
        v82[2] = v51 + 12;
        v82[1] = v51 + 4;
        v52 = v86;
        sub_24968BA44(v47, (uint64_t)v86, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        v106[0] = 0;
        v106[1] = 0xE000000000000000;
        sub_2496BB1E8();
        swift_bridgeObjectRelease();
        strcpy((char *)v106, "ConnectionID(");
        HIWORD(v106[1]) = -4864;
        v105 = *v52;
        sub_2496BB368();
        sub_2496BAF48();
        swift_bridgeObjectRelease();
        sub_2496BAF48();
        sub_24968BDD4((unint64_t *)&unk_2544AFD10, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAC8]);
        sub_2496BB368();
        sub_2496BAF48();
        swift_bridgeObjectRelease();
        sub_2496BAF48();
        v53 = v106[0];
        v54 = v106[1];
        sub_24968BA88((uint64_t)v52, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        v106[0] = sub_2496926A4(v53, v54, &v107);
        sub_2496BB134();
        swift_bridgeObjectRelease();
        sub_24968BA88(v47, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        _os_log_impl(&dword_249686000, v48, (os_log_type_t)v84, "Accepting new connection %s", v51, 0xCu);
        v55 = v83;
        swift_arrayDestroy();
        MEMORY[0x24BCF5FEC](v55, -1, -1);
        MEMORY[0x24BCF5FEC](v51, -1, -1);
      }
      else
      {
        sub_24968BA88(v47, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      }

      (*(void (**)(char *, uint64_t))(v102 + 8))(v46, v103);
      v56 = v96;
      v57 = (uint64_t)v89;
      v58 = v87;
      v102 = sub_2496BAE04();
      v59 = swift_allocObject();
      swift_weakInit();
      sub_24968BA44((uint64_t)v45, v57, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v60 = *(unsigned __int8 *)(v56 + 80);
      v61 = swift_allocObject();
      *(_QWORD *)(v61 + 16) = v59;
      sub_24968BC5C(v57, v61 + ((v60 + 24) & ~v60), (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v62 = swift_allocObject();
      v103 = v40;
      swift_weakInit();
      v63 = v97;
      sub_24968BA44((uint64_t)v45, v97, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v64 = (v60 + 16) & ~v60;
      v65 = (v58 + v64 + 7) & 0xFFFFFFFFFFFFFFF8;
      v66 = swift_allocObject();
      sub_24968BC5C(v63, v66 + v64, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      *(_QWORD *)(v66 + v65) = v62;
      swift_unknownObjectRetain();
      swift_retain();
      swift_retain();
      sub_2496BADD4();
      v67 = v85;
      v68 = sub_2496BADC8();
      if (v67)
      {
        swift_release();
        swift_release();
        sub_24968BA44((uint64_t)v92, v93, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        v106[0] = 0;
        v106[1] = 0xE000000000000000;
        sub_2496BB1E8();
        sub_2496BAF48();
        sub_249697C70();
        sub_2496BAF48();
        swift_bridgeObjectRelease();
        sub_2496BAF48();
        swift_getErrorValue();
        sub_2496BB3A4();
        sub_2496BAF48();
        swift_bridgeObjectRelease();
        sub_2496BAF48();
        v107 = (uint64_t)v67;
        v81 = v67;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFFD8);
        sub_2496BAF18();
        sub_2496BAF48();
        swift_bridgeObjectRelease();
        sub_2496BB254();
        __break(1u);
      }
      else
      {
        v69 = v68;
        swift_release();
        swift_release();
        v70 = v103;
        v71 = *(_QWORD *)(v103 + 48);
        v72 = (uint64_t *)(v71 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v71 + 16));
        v73 = (os_unfair_lock_s *)(v71 + ((*(unsigned int *)(*(_QWORD *)v71 + 48) + 3) & 0x1FFFFFFFCLL));
        swift_retain();
        os_unfair_lock_lock(v73);
        v74 = v92;
        sub_24968A4EC(v72, (uint64_t)v92, v69);
        os_unfair_lock_unlock(v73);
        swift_release();
        v75 = MEMORY[0x24BCF6088](v70 + 16);
        v76 = v100;
        v77 = v99;
        if (v75)
        {
          sub_24968BA44((uint64_t)v74, v100, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
          *(_QWORD *)(v76 + *(int *)(v77 + 20)) = v69;
          swift_retain();
          sub_249690724(v76);
          swift_release();
          swift_release();
          swift_unknownObjectRelease();
          sub_24968BA88(v76, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
        }
        else
        {
          swift_release();
          swift_release();
        }
        v78 = v91;
        v79 = v90;
        v80 = v104;
        sub_24968BA88((uint64_t)v74, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        (*(void (**)(char *, uint64_t))(v79 + 8))(v80, v78);
      }
    }
    else
    {
      xpc_connection_cancel(v29);
    }
  }
  else
  {
    sub_2496BAD8C();
    swift_unknownObjectRetain_n();
    v31 = sub_2496BADA4();
    v32 = sub_2496BB014();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      *(_QWORD *)&v108 = v34;
      *(_DWORD *)v33 = 136315138;
      v35 = -[_xpc_connection_s description](v29, sel_description);
      v36 = sub_2496BAF00();
      v38 = v37;

      v110 = sub_2496926A4(v36, v38, (uint64_t *)&v108);
      sub_2496BB134();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_249686000, v31, v32, "xpc listener unexpected event type: %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v34, -1, -1);
      MEMORY[0x24BCF5FEC](v33, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v102 + 8))(v104, v103);
  }
}

uint64_t sub_24968936C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __SecTask *v12;
  __SecTask *v13;
  CFStringRef v14;
  __CFString *v15;
  audit_token_t atoken;
  char v18;

  v8 = HIDWORD(a1);
  *(_QWORD *)atoken.val = a1;
  v9 = HIDWORD(a2);
  *(_QWORD *)&atoken.val[2] = a2;
  v10 = HIDWORD(a3);
  v11 = HIDWORD(a4);
  *(_QWORD *)&atoken.val[4] = a3;
  *(_QWORD *)&atoken.val[6] = a4;
  audit_token_to_pid(&atoken);
  atoken.val[0] = a1;
  atoken.val[1] = v8;
  atoken.val[2] = a2;
  atoken.val[3] = v9;
  atoken.val[4] = a3;
  atoken.val[5] = v10;
  atoken.val[6] = a4;
  atoken.val[7] = v11;
  audit_token_to_pidversion(&atoken);
  atoken.val[0] = a1;
  atoken.val[1] = v8;
  atoken.val[2] = a2;
  atoken.val[3] = v9;
  atoken.val[4] = a3;
  atoken.val[5] = v10;
  atoken.val[6] = a4;
  atoken.val[7] = v11;
  v12 = SecTaskCreateWithAuditToken(0, &atoken);
  if (v12)
  {
    v13 = v12;
    v14 = SecTaskCopySigningIdentifier(v12, 0);
    if (v14)
    {
      v15 = (__CFString *)v14;
      *(_QWORD *)atoken.val = 0;
      *(_QWORD *)&atoken.val[2] = 0;
      sub_2496BAEF4();

    }
  }
  *(_QWORD *)atoken.val = a1;
  *(_QWORD *)&atoken.val[2] = a2;
  *(_QWORD *)&atoken.val[4] = a3;
  *(_QWORD *)&atoken.val[6] = a4;
  v18 = 0;
  return sub_2496BAAE0();
}

uint64_t sub_24968948C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  result = type metadata accessor for IntelligenceSupportAgentXPCListener.State(0);
  v7 = (_QWORD *)(a1 + *(int *)(result + 20));
  v8 = *v7 + 1;
  if (__OFADD__(*v7, 1))
  {
    __break(1u);
  }
  else
  {
    v9 = (char *)a3 + *(int *)(type metadata accessor for ConnectionID() + 20);
    v10 = sub_2496BAB10();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v9, a2, v10);
    *a3 = v8;
    return sub_24968BE30((uint64_t)a3, (uint64_t)v7);
  }
  return result;
}

double sub_249689528@<D0>(_QWORD *a1@<X2>, uint64_t a2@<X8>)
{
  double result;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_2496895B0(a1, a2);
    swift_release();
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

double sub_2496895B0@<D0>(_QWORD *a1@<X1>, uint64_t a2@<X8>)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t (*v30)(uint64_t);
  int v31;
  char *v32;
  char *v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  double result;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  NSObject *v60;
  int v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  void (*v70)(char *, uint64_t);
  _OWORD *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint8_t *v77;
  os_signpost_id_t v78;
  void (*v79)(char *, uint64_t);
  char *v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;

  v86 = a1;
  v102 = a2;
  v85 = sub_2496BAD5C();
  v84 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v83 = (char *)&v80 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = sub_2496BAD14();
  v87 = *(_QWORD *)(v88 - 8);
  v3 = MEMORY[0x24BDAC7A8](v88);
  v82 = (char *)&v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v91 = (char *)&v80 - v5;
  v6 = sub_2496BAD50();
  v94 = *(_QWORD *)(v6 - 8);
  v95 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v93 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = sub_2496BAB10();
  v89 = *(_QWORD *)(v90 - 8);
  MEMORY[0x24BDAC7A8](v90);
  v96 = (char *)&v80 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2496BA90C();
  v97 = *(_QWORD *)(v9 - 8);
  v98 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2496BADB0();
  v100 = *(_QWORD *)(v12 - 8);
  v101 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v99 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v80 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v80 - v18;
  v20 = sub_2496BA918();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v80 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v80 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v80 - v28;
  sub_24968BDD4(&qword_2544AFCA8, v30, MEMORY[0x24BEBB6D8]);
  sub_2496BAE1C();
  v99 = v11;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v29, v27, v20);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v29, v20);
  v31 = (*(uint64_t (**)(char *, uint64_t))(v21 + 88))(v24, v20);
  v32 = v24;
  if (v31 == *MEMORY[0x24BEBB6C8])
  {
    v101 = v21;
    (*(void (**)(char *, uint64_t))(v21 + 96))(v24, v20);
    v33 = v99;
    (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v99, v32, v98);
    v34 = sub_2496BAE10();
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v41 = sub_2496BA900();
    v42 = v96;
    v43 = sub_24968936C(v34, v36, v38, v40);
    MEMORY[0x24BDAC7A8](v43);
    *(&v80 - 2) = v42;
    v44 = sub_24968A66C((void (*)(uint64_t))sub_24968BE14, (uint64_t)(&v80 - 4), v41);
    v45 = MEMORY[0x24BCF6088](v92 + 16);
    v81 = v20;
    v80 = v29;
    if (v45)
    {
      v46 = *(_QWORD *)(v45 + 24);
      swift_retain();
      os_unfair_lock_lock((os_unfair_lock_t)(v46 + 40));
      sub_2496914FC((uint64_t *)(v46 + 16), v86, v44);
      os_unfair_lock_unlock((os_unfair_lock_t)(v46 + 40));
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v55 = v101;
    v57 = v94;
    v56 = v95;
    v58 = v91;
    v59 = v93;
    (*(void (**)(char *, uint64_t))(v89 + 8))(v96, v90);
    swift_bridgeObjectRelease();
    sub_2496BAD2C();
    sub_2496BA8F4();
    v60 = sub_2496BAD44();
    sub_2496BAD74();
    v61 = sub_2496BB0C8();
    if ((sub_2496BB110() & 1) != 0)
    {
      LODWORD(v101) = v61;
      swift_retain();
      v62 = v83;
      sub_2496BAD80();
      swift_release();
      v63 = v84;
      v64 = v85;
      if ((*(unsigned int (**)(char *, uint64_t))(v84 + 88))(v62, v85) == *MEMORY[0x24BEE7810])
      {
        v65 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v63 + 8))(v62, v64);
        v65 = "";
      }
      v66 = v102;
      v72 = v88;
      v73 = v82;
      v74 = v55;
      v75 = v87;
      (*(void (**)(char *, char *, uint64_t))(v87 + 16))(v82, v58, v88);
      v76 = v58;
      v77 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v77 = 0;
      v78 = sub_2496BAD08();
      _os_signpost_emit_with_name_impl(&dword_249686000, v60, (os_signpost_type_t)v101, v78, "TransferFragments", v65, v77, 2u);
      MEMORY[0x24BCF5FEC](v77, -1, -1);
      swift_release();

      v79 = *(void (**)(char *, uint64_t))(v75 + 8);
      v79(v76, v72);
      (*(void (**)(char *, uint64_t))(v94 + 8))(v93, v95);
      (*(void (**)(char *, uint64_t))(v97 + 8))(v99, v98);
      (*(void (**)(char *, uint64_t))(v74 + 8))(v80, v81);
      v79(v73, v72);
    }
    else
    {
      swift_release();

      (*(void (**)(char *, uint64_t))(v87 + 8))(v58, v88);
      (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v56);
      (*(void (**)(char *, uint64_t))(v97 + 8))(v33, v98);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v80, v81);
      v66 = v102;
    }
    *(_QWORD *)(v66 + 32) = 0;
    result = 0.0;
    *(_OWORD *)v66 = 0u;
    *(_OWORD *)(v66 + 16) = 0u;
  }
  else if (v31 == *MEMORY[0x24BEBB6A0])
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v29, v20);
    v47 = (_OWORD *)v102;
    *(_QWORD *)(v102 + 32) = 0;
    result = 0.0;
    *v47 = 0u;
    v47[1] = 0u;
  }
  else if (v31 == *MEMORY[0x24BEBB6A8])
  {
    sub_2496BAD8C();
    v49 = sub_2496BADA4();
    v50 = sub_2496BB008();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_249686000, v49, v50, "Received launch sentinel", v51, 2u);
      MEMORY[0x24BCF5FEC](v51, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v100 + 8))(v19, v101);
    v52 = MEMORY[0x24BCF6088](v92 + 16);
    v53 = v102;
    if (v52)
    {
      v54 = *(_QWORD *)(v52 + 24);
      swift_retain();
      os_unfair_lock_lock((os_unfair_lock_t)(v54 + 40));
      sub_249690244((uint64_t *)(v54 + 16));
      os_unfair_lock_unlock((os_unfair_lock_t)(v54 + 40));
      swift_unknownObjectRelease();
      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v29, v20);
    *(_QWORD *)(v53 + 32) = 0;
    result = 0.0;
    *(_OWORD *)v53 = 0u;
    *(_OWORD *)(v53 + 16) = 0u;
  }
  else
  {
    sub_2496BAD8C();
    v67 = sub_2496BADA4();
    v68 = sub_2496BB014();
    if (os_log_type_enabled(v67, v68))
    {
      v69 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v69 = 0;
      _os_log_impl(&dword_249686000, v67, v68, "Unexpected message type", v69, 2u);
      MEMORY[0x24BCF5FEC](v69, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v100 + 8))(v17, v101);
    v70 = *(void (**)(char *, uint64_t))(v21 + 8);
    v70(v29, v20);
    v71 = (_OWORD *)v102;
    *(_QWORD *)(v102 + 32) = 0;
    *v71 = 0u;
    v71[1] = 0u;
    v70(v24, v20);
  }
  return result;
}

uint64_t sub_24968A064(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t result;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v5 = type metadata accessor for ConnectionID();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (_QWORD *)((char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v24 - v9;
  v11 = sub_2496BADB0();
  v29 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a3 + 16;
  sub_2496BAD8C();
  sub_24968BA44((uint64_t)a2, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
  v15 = sub_2496BADA4();
  v16 = sub_2496BB008();
  if (os_log_type_enabled(v15, v16))
  {
    v27 = v14;
    v17 = swift_slowAlloc();
    v28 = a2;
    v18 = (uint8_t *)v17;
    v25 = swift_slowAlloc();
    v31 = v25;
    v26 = v11;
    *(_DWORD *)v18 = 136315138;
    v24[1] = v18 + 4;
    sub_24968BA44((uint64_t)v10, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v32[0] = 0;
    v32[1] = 0xE000000000000000;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    strcpy((char *)v32, "ConnectionID(");
    HIWORD(v32[1]) = -4864;
    v30 = *v8;
    sub_2496BB368();
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    sub_2496BAF48();
    sub_2496BAB10();
    sub_24968BDD4((unint64_t *)&unk_2544AFD10, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAC8]);
    sub_2496BB368();
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    sub_2496BAF48();
    v19 = v32[0];
    v20 = v32[1];
    sub_24968BA88((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v32[0] = sub_2496926A4(v19, v20, &v31);
    sub_2496BB134();
    swift_bridgeObjectRelease();
    sub_24968BA88((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    _os_log_impl(&dword_249686000, v15, v16, "client %s disconnected", v18, 0xCu);
    v21 = v25;
    swift_arrayDestroy();
    MEMORY[0x24BCF5FEC](v21, -1, -1);
    v22 = v18;
    a2 = v28;
    MEMORY[0x24BCF5FEC](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v26);
  }
  else
  {
    sub_24968BA88((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);

    (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v11);
  }
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_24968A3F4(a2);
    return swift_release();
  }
  return result;
}

uint64_t sub_24968A3F4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  os_unfair_lock_s *v5;
  uint64_t result;
  uint64_t v7;

  v3 = *(_QWORD *)(v1 + 48);
  v4 = (uint64_t *)(v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16));
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  swift_retain();
  os_unfair_lock_lock(v5);
  sub_24968AC6C(v4, a1);
  os_unfair_lock_unlock(v5);
  swift_release();
  result = MEMORY[0x24BCF6088](v1 + 16);
  if (result)
  {
    v7 = *(_QWORD *)(result + 24);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 40));
    sub_249690F78((uint64_t *)(v7 + 16), (uint64_t)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 40));
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_24968A4EC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;

  type metadata accessor for ConnectionID();
  MEMORY[0x24BDAC7A8]();
  v7 = (uint64_t *)((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24968BA44(a2, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *a1;
  *a1 = 0x8000000000000000;
  sub_2496937EC(a3, v7, isUniquelyReferenced_nonNull_native);
  *a1 = v11;
  swift_bridgeObjectRelease();
  return sub_24968BA88((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
}

uint64_t sub_24968A5CC(uint64_t a1)
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

uint64_t sub_24968A614@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = swift_bridgeObjectRetain();
  v3 = sub_24968A7CC(v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t sub_24968A66C(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;

  v4 = v3;
  v20 = a1;
  v21 = a2;
  v19 = sub_2496BAAD4();
  v6 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v22 = MEMORY[0x24BEE4AF8];
    sub_2496A2CC0(0, v9, 0);
    v10 = v22;
    v18 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v11 = a3 + v18;
    v17 = *(_QWORD *)(v6 + 72);
    while (1)
    {
      v20(v11);
      if (v4)
        break;
      v4 = 0;
      v22 = v10;
      v13 = *(_QWORD *)(v10 + 16);
      v12 = *(_QWORD *)(v10 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_2496A2CC0(v12 > 1, v13 + 1, 1);
        v10 = v22;
      }
      *(_QWORD *)(v10 + 16) = v13 + 1;
      v14 = v17;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v18 + v13 * v17, v8, v19);
      v11 += v14;
      if (!--v9)
        return v10;
    }
    swift_release();
  }
  return v10;
}

uint64_t sub_24968A7CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
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
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD v39[2];
  uint64_t v40;
  int64_t v41;
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

  v50 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFE40);
  v3 = MEMORY[0x24BDAC7A8](v50);
  v49 = (uint64_t)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v48 = (uint64_t)v39 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v45 = (uint64_t)v39 - v7;
  v8 = type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient(0);
  v46 = *(_QWORD *)(v8 - 8);
  v47 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v51 = (uint64_t)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (!v10)
    return v11;
  v39[1] = v1;
  v52 = MEMORY[0x24BEE4AF8];
  sub_2496A2CEC(0, v10, 0);
  result = sub_2496B2A80(a1);
  v14 = result;
  v15 = 0;
  v16 = a1 + 64;
  v40 = a1 + 80;
  v41 = v10;
  v42 = v13;
  v43 = a1 + 64;
  v44 = a1;
  while ((v14 & 0x8000000000000000) == 0 && v14 < 1 << *(_BYTE *)(a1 + 32))
  {
    v19 = (unint64_t)v14 >> 6;
    if ((*(_QWORD *)(v16 + 8 * ((unint64_t)v14 >> 6)) & (1 << v14)) == 0)
      goto LABEL_25;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v13)
      goto LABEL_26;
    v20 = v50;
    v21 = *(int *)(v50 + 48);
    v22 = *(_QWORD *)(a1 + 48);
    v23 = v22 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for ConnectionID() - 8) + 72) * v14;
    v24 = a1;
    v25 = v45;
    sub_24968BA44(v23, v45, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v26 = *(_QWORD *)(*(_QWORD *)(v24 + 56) + 8 * v14);
    *(_QWORD *)(v25 + v21) = v26;
    v27 = v48;
    sub_24968BA44(v25, v48, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    *(_QWORD *)(v27 + *(int *)(v20 + 48)) = v26;
    v28 = v27;
    v29 = v49;
    sub_24968BB04(v28, v49);
    swift_retain_n();
    sub_24968BB4C(v25);
    v30 = *(_QWORD *)(v29 + *(int *)(v20 + 48));
    v31 = v51;
    sub_24968BA44(v29, v51, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    *(_QWORD *)(v31 + *(int *)(v47 + 20)) = v30;
    swift_retain();
    sub_24968BB4C(v29);
    v11 = v52;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2496A2CEC(0, *(_QWORD *)(v11 + 16) + 1, 1);
      v11 = v52;
    }
    v33 = *(_QWORD *)(v11 + 16);
    v32 = *(_QWORD *)(v11 + 24);
    a1 = v44;
    if (v33 >= v32 >> 1)
    {
      sub_2496A2CEC(v32 > 1, v33 + 1, 1);
      v11 = v52;
    }
    *(_QWORD *)(v11 + 16) = v33 + 1;
    result = sub_24968BC5C(v51, v11+ ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80))+ *(_QWORD *)(v46 + 72) * v33, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
    v17 = 1 << *(_BYTE *)(a1 + 32);
    if (v14 >= v17)
      goto LABEL_27;
    v16 = v43;
    v34 = *(_QWORD *)(v43 + 8 * v19);
    if ((v34 & (1 << v14)) == 0)
      goto LABEL_28;
    LODWORD(v13) = v42;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v42)
      goto LABEL_29;
    v35 = v34 & (-2 << (v14 & 0x3F));
    if (v35)
    {
      v17 = __clz(__rbit64(v35)) | v14 & 0xFFFFFFFFFFFFFFC0;
      v18 = v41;
    }
    else
    {
      v36 = v19 + 1;
      v37 = (unint64_t)(v17 + 63) >> 6;
      v18 = v41;
      if (v19 + 1 < v37)
      {
        v38 = *(_QWORD *)(v43 + 8 * v36);
        if (v38)
        {
LABEL_22:
          v17 = __clz(__rbit64(v38)) + (v36 << 6);
        }
        else
        {
          while (v37 - 2 != v19)
          {
            v38 = *(_QWORD *)(v40 + 8 * v19++);
            if (v38)
            {
              v36 = v19 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    ++v15;
    v14 = v17;
    if (v15 == v18)
      return v11;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_24968AB8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD20);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2496BAAD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a3, a1, v8);
  v9 = sub_2496BAB10();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v7, a2, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return sub_2496BAA50();
}

uint64_t sub_24968AC6C(uint64_t *a1, _QWORD *a2)
{
  unint64_t v4;
  char v5;
  char v6;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  swift_bridgeObjectRetain();
  v4 = sub_2496B69A8(a2);
  v6 = v5;
  result = swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *a1;
    v12 = *a1;
    *a1 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_249694160();
      v9 = v12;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = type metadata accessor for ConnectionID();
    sub_24968BA88(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v4, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    sub_249692F9C(v4, v9);
    *a1 = v9;
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24968AD48()
{
  uint64_t v0;

  sub_24968B280(v0 + 16);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IntelligenceSupportAgentXPCListener()
{
  return objc_opt_self();
}

uint64_t sub_24968ADA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_24968ADAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_24968ADB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_24968ADBC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t *sub_24968ADC4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    *(uint64_t *)((char *)a1 + v6) = *(uint64_t *)((char *)a2 + v6);
    v9 = *(int *)(type metadata accessor for ConnectionID() + 20);
    v10 = &v7[v9];
    v11 = &v8[v9];
    v12 = sub_2496BAB10();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
  }
  return v5;
}

uint64_t sub_24968AE78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = v4 + *(int *)(type metadata accessor for ConnectionID() + 20);
  v6 = sub_2496BAB10();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

_QWORD *sub_24968AED0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  *(_QWORD *)((char *)a1 + v4) = *(_QWORD *)((char *)a2 + v4);
  v7 = *(int *)(type metadata accessor for ConnectionID() + 20);
  v8 = &v5[v7];
  v9 = &v6[v7];
  v10 = sub_2496BAB10();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

_QWORD *sub_24968AF5C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (_QWORD *)((char *)a2 + v6);
  *(_QWORD *)((char *)a1 + v6) = *v8;
  v9 = *(int *)(type metadata accessor for ConnectionID() + 20);
  v10 = &v7[v9];
  v11 = (char *)v8 + v9;
  v12 = sub_2496BAB10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_QWORD *sub_24968AFEC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  *(_QWORD *)((char *)a1 + v4) = *(_QWORD *)((char *)a2 + v4);
  v7 = *(int *)(type metadata accessor for ConnectionID() + 20);
  v8 = &v5[v7];
  v9 = &v6[v7];
  v10 = sub_2496BAB10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

_QWORD *sub_24968B064(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (_QWORD *)((char *)a2 + v6);
  *(_QWORD *)((char *)a1 + v6) = *v8;
  v9 = *(int *)(type metadata accessor for ConnectionID() + 20);
  v10 = &v7[v9];
  v11 = (char *)v8 + v9;
  v12 = sub_2496BAB10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_24968B0EC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24968B0F8(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for ConnectionID();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_24968B174()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_24968B180(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for ConnectionID();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for IntelligenceSupportAgentXPCListener.State(uint64_t a1)
{
  return sub_24968BA10(a1, (uint64_t *)&unk_2544AFE30);
}

uint64_t sub_24968B208()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ConnectionID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24968B280(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

_QWORD *sub_24968B2A4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  _OWORD v8[2];
  char v9;

  v1 = v0;
  v2 = type metadata accessor for IntelligenceSupportAgentXPCListener.State(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (unint64_t *)((char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v0[3] = 0;
  swift_unknownObjectWeakInit();
  v0[4] = 0;
  sub_2496BACC0();
  swift_allocObject();
  v0[5] = sub_2496BACB4();
  *v4 = sub_2496A8BFC(MEMORY[0x24BEE4AF8]);
  v5 = (unint64_t *)((char *)v4 + *(int *)(v2 + 20));
  memset(v8, 0, sizeof(v8));
  v9 = 1;
  type metadata accessor for ConnectionID();
  sub_2496BAAE0();
  *v5 = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFF48);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + ((*(unsigned int *)(*(_QWORD *)v6 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_24968BA44((uint64_t)v4, v6 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v6 + 16), type metadata accessor for IntelligenceSupportAgentXPCListener.State);
  sub_24968BA88((uint64_t)v4, type metadata accessor for IntelligenceSupportAgentXPCListener.State);
  v1[6] = v6;
  return v1;
}

uint64_t sub_24968B41C(uint64_t a1, uint64_t a2)
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
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  __int128 v21;
  uint64_t (*v22)(uint64_t);
  char *v23;
  uint64_t v24;
  _QWORD v25[2];
  __int128 v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = a2;
  v28 = type metadata accessor for ConnectionID();
  MEMORY[0x24BDAC7A8](v28);
  v27 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2496BADB0();
  v32 = *(_QWORD *)(v4 - 8);
  v33 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v29 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2496BAC9C();
  v40 = *(_QWORD *)(v6 - 8);
  v41 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v39 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2496BA8E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient(0);
  v12 = MEMORY[0x24BDAC7A8](v38);
  result = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)v25 - v16;
  v18 = *(_QWORD *)(a1 + 16);
  if (v18)
  {
    v36 = v11;
    v37 = v9;
    v31 = v15;
    v19 = a1 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    v35 = *(_QWORD *)(v14 + 72);
    v34 = *MEMORY[0x24BEBB688];
    v25[0] = a1;
    swift_bridgeObjectRetain();
    v20 = type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient;
    *(_QWORD *)&v21 = 136315394;
    v26 = v21;
    v25[1] = MEMORY[0x24BEE4AD8] + 8;
    v30 = v8;
    do
    {
      sub_24968BA44(v19, (uint64_t)v17, v20);
      (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v39, v42, v41);
      swift_retain();
      v22 = v20;
      v23 = v36;
      sub_2496BA8DC();
      v24 = v37;
      (*(void (**)(char *, _QWORD, uint64_t))(v37 + 104))(v23, v34, v8);
      sub_24968BDD4((unint64_t *)&unk_2544AFC98, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB690], MEMORY[0x24BEBB698]);
      sub_2496BADEC();
      swift_release();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v23, v8);
      sub_24968BA88((uint64_t)v17, v22);
      v20 = v22;
      v19 += v35;
      --v18;
    }
    while (v18);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient(uint64_t a1)
{
  return sub_24968BA10(a1, qword_2544AFE18);
}

uint64_t sub_24968BA10(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24968BA44(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24968BA88(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BCF5F44]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24968BB04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFE40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24968BB4C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFE40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24968BB8C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_24968BBB0(_xpc_connection_s *a1)
{
  _xpc_connection_s *v1;

  sub_2496887A0(a1, v1);
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

uint64_t sub_24968BBD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for ConnectionID();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 24) & ~v2;
  swift_release();
  v4 = v0 + *(int *)(v1 + 20) + v3;
  v5 = sub_2496BAB10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_24968BC5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

double sub_24968BCA0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ConnectionID() - 8) + 80);
  return sub_249689528((_QWORD *)(v1 + ((v3 + 24) & ~v3)), a1);
}

uint64_t sub_24968BCF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = type metadata accessor for ConnectionID();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + *(int *)(v1 + 20) + ((v2 + 16) & ~v2);
  v4 = sub_2496BAB10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24968BD84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for ConnectionID() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_24968A064(a1, (_QWORD *)(v1 + v4), *(_QWORD *)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_24968BDD4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24BCF5F5C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24968BE14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_24968AB8C(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_24968BE30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConnectionID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t *sub_24968BE74(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *a1 = *a2;
    v7 = *(int *)(type metadata accessor for ConnectionID() + 20);
    v8 = (char *)v4 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2496BAB10();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return v4;
}

uint64_t sub_24968BF20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1 + *(int *)(type metadata accessor for ConnectionID() + 20);
  v2 = sub_2496BAB10();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_release();
}

_QWORD *sub_24968BF7C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(type metadata accessor for ConnectionID() + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2496BAB10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

_QWORD *sub_24968C000(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(type metadata accessor for ConnectionID() + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2496BAB10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_24968C090(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(type metadata accessor for ConnectionID() + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2496BAB10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *sub_24968C110(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(type metadata accessor for ConnectionID() + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2496BAB10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_24968C198()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24968C1A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for ConnectionID();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_24968C220()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24968C22C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for ConnectionID();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_24968C2A4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ConnectionID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t IntelligenceSupportAgent.Client.hash(into:)()
{
  return sub_2496BB3BC();
}

BOOL static IntelligenceSupportAgent.Client.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

BOOL sub_24968C354(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24968C36C()
{
  return sub_2496BB3BC();
}

uint64_t sub_24968C398()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 1769105779;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x6E776F6E6B6E75;
}

uint64_t sub_24968C3F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2496956D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24968C414()
{
  return 0;
}

void sub_24968C420(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24968C42C()
{
  sub_24968C838();
  return sub_2496BB3EC();
}

uint64_t sub_24968C454()
{
  sub_24968C838();
  return sub_2496BB3F8();
}

uint64_t sub_24968C47C()
{
  return 0;
}

void sub_24968C488(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24968C494()
{
  sub_24968C87C();
  return sub_2496BB3EC();
}

uint64_t sub_24968C4BC()
{
  sub_24968C87C();
  return sub_2496BB3F8();
}

uint64_t sub_24968C4E4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24968C510()
{
  sub_24968C8C0();
  return sub_2496BB3EC();
}

uint64_t sub_24968C538()
{
  sub_24968C8C0();
  return sub_2496BB3F8();
}

uint64_t sub_24968C560()
{
  sub_24968C904();
  return sub_2496BB3EC();
}

uint64_t sub_24968C588()
{
  sub_24968C904();
  return sub_2496BB3F8();
}

uint64_t IntelligenceSupportAgent.Client.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
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
  int v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578766B0);
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8]();
  v21 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578766B8);
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578766C0);
  v9 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578766C8);
  v24 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24968C838();
  sub_2496BB3E0();
  if (v15)
  {
    if (v15 == 1)
    {
      v26 = 1;
      sub_24968C8C0();
      sub_2496BB308();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);
    }
    else
    {
      v27 = 2;
      sub_24968C87C();
      v16 = v21;
      sub_2496BB308();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v23);
    }
  }
  else
  {
    v25 = 0;
    sub_24968C904();
    sub_2496BB308();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v14, v12);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24968C838()
{
  unint64_t result;

  result = qword_2578766D0;
  if (!qword_2578766D0)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC254, &type metadata for IntelligenceSupportAgent.Client.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578766D0);
  }
  return result;
}

unint64_t sub_24968C87C()
{
  unint64_t result;

  result = qword_2578766D8;
  if (!qword_2578766D8)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC204, &type metadata for IntelligenceSupportAgent.Client.CommandLineDebugCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578766D8);
  }
  return result;
}

unint64_t sub_24968C8C0()
{
  unint64_t result;

  result = qword_2578766E0;
  if (!qword_2578766E0)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC1B4, &type metadata for IntelligenceSupportAgent.Client.SiriCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578766E0);
  }
  return result;
}

unint64_t sub_24968C904()
{
  unint64_t result;

  result = qword_2578766E8;
  if (!qword_2578766E8)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC164, &type metadata for IntelligenceSupportAgent.Client.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578766E8);
  }
  return result;
}

uint64_t IntelligenceSupportAgent.Client.hashValue.getter()
{
  sub_2496BB3B0();
  sub_2496BB3BC();
  return sub_2496BB3C8();
}

uint64_t IntelligenceSupportAgent.Client.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  char *v39;
  char *v40;
  _QWORD *v41;
  char v42;
  char v43;
  char v44;

  v38 = a2;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578766F0);
  v34 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8]();
  v40 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578766F8);
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8]();
  v39 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876700);
  v6 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876708);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24968C838();
  v13 = v41;
  sub_2496BB3D4();
  if (v13)
    goto LABEL_7;
  v31 = v6;
  v32 = v10;
  v14 = v39;
  v15 = v40;
  v41 = a1;
  v16 = v12;
  v17 = sub_2496BB2FC();
  v18 = v9;
  if (*(_QWORD *)(v17 + 16) != 1)
  {
    v23 = sub_2496BB218();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257876710);
    *v25 = &type metadata for IntelligenceSupportAgent.Client;
    sub_2496BB2B4();
    sub_2496BB20C();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    a1 = v41;
LABEL_7:
    v26 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v26);
  }
  v19 = *(unsigned __int8 *)(v17 + 32);
  if (*(_BYTE *)(v17 + 32))
  {
    if (v19 == 1)
    {
      v43 = 1;
      sub_24968C8C0();
      v20 = v9;
      sub_2496BB2A8();
      v21 = v38;
      v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v36);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v20);
    }
    else
    {
      v44 = 2;
      sub_24968C87C();
      v28 = v15;
      sub_2496BB2A8();
      v21 = v38;
      v29 = v32;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v37);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v18);
    }
  }
  else
  {
    v42 = 0;
    sub_24968C904();
    sub_2496BB2A8();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v16, v9);
    v21 = v38;
  }
  *v21 = v19;
  v26 = (uint64_t)v41;
  return __swift_destroy_boxed_opaque_existential_1Tm(v26);
}

uint64_t sub_24968CDD0()
{
  sub_2496BB3B0();
  sub_2496BB3BC();
  return sub_2496BB3C8();
}

uint64_t sub_24968CE14()
{
  sub_2496BB3B0();
  sub_2496BB3BC();
  return sub_2496BB3C8();
}

uint64_t sub_24968CE54@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return IntelligenceSupportAgent.Client.init(from:)(a1, a2);
}

uint64_t sub_24968CE68(_QWORD *a1)
{
  return IntelligenceSupportAgent.Client.encode(to:)(a1);
}

uint64_t static IntelligenceSupportAgent.initialize()()
{
  uint64_t result;

  if (qword_2544AF6E0 != -1)
    return swift_once();
  return result;
}

uint64_t sub_24968CEA8(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned __int8 v9;

  if (qword_2544AF6E0 != -1)
    swift_once();
  v9 = a1;
  return sub_24968CF30(&v9, a2, a3, a4);
}

uint64_t sub_24968CF30(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
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
  os_unfair_lock_s *v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72[16];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75[2];

  v64 = a3;
  v65 = a4;
  v56 = sub_2496BACF0();
  v55 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v53 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2496BADB0();
  v58 = *(_QWORD *)(v8 - 8);
  v59 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v60 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient(0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = type metadata accessor for ConnectionID();
  v14 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_2496BAC9C();
  v68 = *(_QWORD *)(v70 - 8);
  v17 = MEMORY[0x24BDAC7A8](v70);
  v57 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v69 = (uint64_t)&v52 - v19;
  v62 = *a1;
  v66 = v4;
  v20 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(v4 + 16) + 48)
                           + ((*(unsigned int *)(**(_QWORD **)(*(_QWORD *)(v4 + 16) + 48) + 48) + 3) & 0x1FFFFFFFCLL));
  swift_retain();
  os_unfair_lock_lock(v20);
  sub_24968A614(v75);
  os_unfair_lock_unlock(v20);
  v21 = v75[0];
  swift_release();
  v63 = a2;
  v73 = a2;
  v22 = sub_24968F04C((uint64_t (*)(char *))sub_24969649C, (uint64_t)v72, v21);
  v61 = 0;
  v23 = *(_QWORD *)(v22 + 16);
  v24 = MEMORY[0x24BEE4AF8];
  v67 = v22;
  if (v23)
  {
    v25 = v22;
    v75[0] = MEMORY[0x24BEE4AF8];
    sub_2496A2D18(0, v23, 0);
    v26 = v25 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v27 = *(_QWORD *)(v11 + 72);
    v24 = v75[0];
    v71 = v27;
    do
    {
      sub_24968BA44(v26, (uint64_t)v13, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
      sub_24968BA44((uint64_t)v13, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      sub_24968BA88((uint64_t)v13, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2496A2D18(0, *(_QWORD *)(v24 + 16) + 1, 1);
        v27 = v71;
        v24 = v75[0];
      }
      v29 = *(_QWORD *)(v24 + 16);
      v28 = *(_QWORD *)(v24 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_2496A2D18(v28 > 1, v29 + 1, 1);
        v27 = v71;
        v24 = v75[0];
      }
      *(_QWORD *)(v24 + 16) = v29 + 1;
      sub_24968BC5C((uint64_t)v16, v24+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(_QWORD *)(v14 + 72) * v29, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v26 += v27;
      --v23;
    }
    while (v23);
  }
  v30 = v66;
  v31 = *(_QWORD *)(v66 + 24);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v31 + 40));
  v32 = v69;
  sub_24968F264((uint64_t *)(v31 + 16), v62, v63, v64, v65, v30, v24, v69);
  os_unfair_lock_unlock((os_unfair_lock_t)(v31 + 40));
  swift_release();
  v33 = v70;
  if (*(_QWORD *)(v24 + 16))
  {
    v34 = v60;
    sub_2496BAD98();
    v35 = v68;
    v36 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v57, v32, v33);
    swift_bridgeObjectRetain();
    v37 = sub_2496BADA4();
    v38 = sub_2496BB008();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = swift_slowAlloc();
      v71 = swift_slowAlloc();
      v75[0] = v71;
      *(_DWORD *)v39 = 136446466;
      v40 = v53;
      sub_2496BAC84();
      v41 = sub_2496BACCC();
      v43 = v42;
      (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v56);
      v74 = sub_2496926A4(v41, v43, v75);
      sub_2496BB134();
      swift_bridgeObjectRelease();
      v44 = *(void (**)(char *, uint64_t))(v68 + 8);
      v44(v36, v33);
      *(_WORD *)(v39 + 12) = 2080;
      v45 = swift_bridgeObjectRetain();
      v46 = MEMORY[0x24BCF568C](v45, v54);
      v48 = v47;
      swift_bridgeObjectRelease();
      v49 = v46;
      v32 = v69;
      v74 = sub_2496926A4(v49, v48, v75);
      sub_2496BB134();
      swift_bridgeObjectRelease_n();
      v33 = v70;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_249686000, v37, v38, "notifying clients for %{public}s: %s", (uint8_t *)v39, 0x16u);
      v50 = v71;
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v50, -1, -1);
      MEMORY[0x24BCF5FEC](v39, -1, -1);

      (*(void (**)(char *, uint64_t))(v58 + 8))(v60, v59);
    }
    else
    {
      v44 = *(void (**)(char *, uint64_t))(v35 + 8);
      v44(v36, v33);

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v34, v59);
    }
    sub_24968B41C(v67, v32);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, uint64_t))v44)(v32, v33);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v32, v70);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t static IntelligenceSupportAgent.fetchElementHierarchy(for:parameters:)(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 16) = a1;
  *(_BYTE *)(v4 + 56) = *a2;
  return swift_task_switch();
}

uint64_t sub_24968D5A8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_BYTE *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v4;
  *(_QWORD *)(v4 + 16) = v2;
  *(_BYTE *)(v4 + 24) = v1;
  *(_QWORD *)(v4 + 32) = v3;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v5;
  *v5 = v0;
  v5[1] = sub_24968D658;
  return sub_2496BB374();
}

uint64_t sub_24968D658()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24968D6A8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BYTE v13[15];
  char v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFEF0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v14 = a3;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(&v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)], a1, v7);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v8 + 32))(v11 + v10, &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)], v7);
  _s26UIIntelligenceSupportAgent012IntelligencebC0C21fetchElementHierarchy3for10parameters17completionHandleryAC6ClientO_AC17RequestParametersVyAC0fG0VctFZ_0(&v14, a4, (uint64_t)sub_2496962D8, v11);
  return swift_release();
}

uint64_t sub_24968D798()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFEF0);
  return sub_2496BAFD8();
}

uint64_t sub_24968D7EC()
{
  uint64_t result;

  type metadata accessor for IntelligenceSupportAgent();
  swift_allocObject();
  result = sub_24968ECAC();
  qword_2544AFE10 = result;
  return result;
}

uint64_t sub_24968D824()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v0 = sub_2496BB044();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v0);
  v2 = sub_2496BB050();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2496BAE70();
  MEMORY[0x24BDAC7A8](v6);
  sub_249696E24(0, (unint64_t *)&qword_2544AFF18);
  sub_2496BAE64();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5758], v2);
  v8[1] = MEMORY[0x24BEE4AF8];
  sub_24968BDD4((unint64_t *)&unk_2544AFF08, v1, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFED0);
  sub_249696E5C(&qword_2544AFED8, &qword_2544AFED0);
  sub_2496BB170();
  result = sub_2496BB074();
  qword_2544AFD98 = result;
  return result;
}

uint64_t sub_24968D9E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  char *v35;
  char *v36;
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
  _OWORD v49[2];
  uint64_t v50;

  v5 = v4;
  v47 = a3;
  v48 = a4;
  v42 = a2;
  v43 = a1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578767A8);
  MEMORY[0x24BDAC7A8](v6);
  v45 = (uint64_t)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  v44 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v41 = (uint64_t)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2496BACF0();
  v37 = *(_QWORD *)(v9 - 8);
  v38 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v36 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2496BAC9C();
  v39 = *(_QWORD *)(v11 - 8);
  v40 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v35 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2496BB08C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2496BAE4C();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v4 + 24) = 0;
  *(_BYTE *)(v4 + 32) = 1;
  sub_249696E24(0, &qword_2544AFF30);
  sub_249696E24(0, (unint64_t *)&qword_2544AFF18);
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, *MEMORY[0x24BEE5480], v17);
  v21 = (void *)sub_2496BB080();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  *(_QWORD *)&v49[0] = MEMORY[0x24BEE4AF8];
  sub_24968BDD4(&qword_2544AFF28, (uint64_t (*)(uint64_t))MEMORY[0x24BEE57C0], MEMORY[0x24BEE57D0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEE0);
  sub_249696E5C(&qword_2544AFEE8, &qword_2544AFEE0);
  sub_2496BB170();
  v22 = sub_2496BB098();

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  *(_QWORD *)(v5 + 40) = v22;
  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE4B08];
  *(_BYTE *)(v5 + 64) = 0;
  *(CFAbsoluteTime *)(v5 + 16) = CFAbsoluteTimeGetCurrent();
  *(_QWORD *)(v5 + 24) = mach_continuous_time();
  *(_BYTE *)(v5 + 32) = 0;
  v23 = v42;
  sub_24968BA44(v42, v5+ OBJC_IVAR____TtCC26UIIntelligenceSupportAgent24IntelligenceSupportAgentP33_F6EEC212C1562732DDB5A4B69A480AD213ActiveRequest_parameters, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceSupportAgent.RequestParameters);
  v24 = (uint64_t)v36;
  v25 = v37;
  v26 = v43;
  v27 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v36, v43, v38);
  v28 = v41;
  sub_24968BA44(v23, v41, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceSupportAgent.RequestParameters);
  v29 = v35;
  sub_24969D6E0(v24, v28);
  (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v5+ OBJC_IVAR____TtCC26UIIntelligenceSupportAgent24IntelligenceSupportAgentP33_F6EEC212C1562732DDB5A4B69A480AD213ActiveRequest_request, v29, v40);
  v30 = v45;
  sub_24968BA44(v23, v45, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceSupportAgent.RequestParameters);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v44 + 56))(v30, 0, 1, v46);
  type metadata accessor for FragmentCollator();
  memset(v49, 0, sizeof(v49));
  v50 = 0;
  swift_allocObject();
  v31 = sub_2496AEDB8(v30, (uint64_t)v49);
  sub_24968BA88(v23, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceSupportAgent.RequestParameters);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
  *(_QWORD *)(v5 + 48) = v31;
  v32 = (_QWORD *)(v5
                 + OBJC_IVAR____TtCC26UIIntelligenceSupportAgent24IntelligenceSupportAgentP33_F6EEC212C1562732DDB5A4B69A480AD213ActiveRequest_completionHandler);
  v33 = v48;
  *v32 = v47;
  v32[1] = v33;
  return v5;
}

uint64_t sub_24968DDFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[3];
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;

  v53 = type metadata accessor for ConnectionID();
  v3 = MEMORY[0x24BDAC7A8](v53);
  v5 = (_QWORD *)((char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (_QWORD *)((char *)v44 - v7);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v52 = (_QWORD *)((char *)v44 - v10);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (_QWORD *)((char *)v44 - v12);
  result = MEMORY[0x24BDAC7A8](v11);
  v17 = (char *)v44 - v16;
  v47 = *(_QWORD *)(a1 + 16);
  if (!v47)
    return result;
  v44[2] = v1;
  v51 = (uint64_t *)(v1 + 56);
  v46 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  v18 = *(_QWORD *)(v15 + 72);
  v44[1] = a1;
  swift_bridgeObjectRetain();
  v19 = 0;
  v45 = v17;
  while (1)
  {
    v50 = v19;
    sub_24968BA44(v46 + v18 * v19, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    sub_24968BA44((uint64_t)v17, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v20 = v51;
    swift_beginAccess();
    v21 = *v20;
    sub_2496BB3B0();
    sub_2496BB3BC();
    v22 = sub_2496BAB10();
    v23 = sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
    swift_bridgeObjectRetain();
    v48 = v23;
    v49 = v22;
    sub_2496BAEB8();
    v24 = sub_2496BB3C8();
    v25 = -1 << *(_BYTE *)(v21 + 32);
    v26 = v24 & ~v25;
    if (((*(_QWORD *)(v21 + 56 + ((v26 >> 3) & 0xFFFFFFFFFFFFF8)) >> v26) & 1) != 0)
    {
      v27 = ~v25;
      while (1)
      {
        sub_24968BA44(*(_QWORD *)(v21 + 48) + v26 * v18, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        if (*v5 == *v13 && (sub_2496BAAF8() & 1) != 0)
          break;
        sub_24968BA88((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        v26 = (v26 + 1) & v27;
        if (((*(_QWORD *)(v21 + 56 + ((v26 >> 3) & 0xFFFFFFFFFFFFF8)) >> v26) & 1) == 0)
          goto LABEL_10;
      }
      sub_24968BA88((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      goto LABEL_24;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    v28 = v51;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24968BA44((uint64_t)v13, (uint64_t)v52, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v54 = *v28;
    v30 = v54;
    *v28 = 0x8000000000000000;
    if (*(_QWORD *)(v30 + 24) > *(_QWORD *)(v30 + 16))
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_2496B8E54();
      goto LABEL_22;
    }
    if (isUniquelyReferenced_nonNull_native)
      sub_2496B79C8();
    else
      sub_2496B95C8();
    v31 = v54;
    sub_2496BB3B0();
    sub_2496BB3BC();
    sub_2496BAEB8();
    v32 = sub_2496BB3C8();
    v33 = -1 << *(_BYTE *)(v31 + 32);
    v26 = v32 & ~v33;
    if (((*(_QWORD *)(v31 + 56 + ((v26 >> 3) & 0xFFFFFFFFFFFFF8)) >> v26) & 1) != 0)
      break;
LABEL_22:
    v35 = v54;
    *(_QWORD *)(v54 + ((v26 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v26;
    sub_24968BC5C((uint64_t)v52, *(_QWORD *)(v35 + 48) + v26 * v18, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v36 = *(_QWORD *)(v35 + 16);
    v37 = __OFADD__(v36, 1);
    v38 = v36 + 1;
    if (v37)
    {
      __break(1u);
      goto LABEL_29;
    }
    *(_QWORD *)(v35 + 16) = v38;
    *v51 = v35;
LABEL_24:
    swift_bridgeObjectRelease();
    sub_24968BA88((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    swift_endAccess();
    v17 = v45;
    v39 = sub_2496BAAEC();
    v41 = v50;
    if (v40)
    {
      v42 = v39;
      v43 = v40;
      swift_retain();
      sub_2496A57A0(v42, v43);
      swift_bridgeObjectRelease();
      swift_release();
    }
    v19 = v41 + 1;
    sub_24968BA88((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    if (v19 == v47)
      return swift_bridgeObjectRelease();
  }
  v34 = ~v33;
  while (1)
  {
    sub_24968BA44(*(_QWORD *)(v31 + 48) + v26 * v18, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    if (*v8 == *v52 && (sub_2496BAAF8() & 1) != 0)
      break;
    sub_24968BA88((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v26 = (v26 + 1) & v34;
    if (((*(_QWORD *)(v31 + 56 + ((v26 >> 3) & 0xFFFFFFFFFFFFF8)) >> v26) & 1) == 0)
      goto LABEL_22;
  }
LABEL_29:
  sub_24968BA88((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
  result = sub_2496BB38C();
  __break(1u);
  return result;
}

uint64_t sub_24968E314()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_signpost_type_t v20;
  uint8_t *v21;
  os_signpost_id_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = v0;
  v2 = sub_2496BACF0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2496BAD14();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v25 - v11;
  v13 = sub_2496BAD50();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v0 + 32) & 1) == 0)
  {
    v26 = v15;
    v27 = v14;
    v25 = *(_QWORD *)(v0 + 24);
    sub_2496BAD38();
    sub_2496BAC84();
    sub_2496BACE4();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_2496BAD20();
    sub_249696DD0();
    sub_24968E5F0();
    sub_249696E14(v18);
    v19 = sub_2496BAD44();
    v20 = sub_2496BB0D4();
    if ((sub_2496BB110() & 1) != 0)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
      v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v21 = 134217984;
      v28 = v25;
      sub_2496BB134();
      v22 = sub_2496BAD08();
      _os_signpost_emit_with_name_impl(&dword_249686000, v19, v20, v22, "Request", "%{public, signpost.description:begin_time}llu", v21, 0xCu);
      MEMORY[0x24BCF5FEC](v21, -1, -1);

      v23 = *(void (**)(char *, uint64_t))(v7 + 8);
      v23(v12, v6);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v27);
      v23(v10, v6);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v27);
    }
    *(_QWORD *)(v1 + 24) = 0;
    *(_BYTE *)(v1 + 32) = 1;
  }
  if (*(_QWORD *)(v1 + 40))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2496BB0B0();
    swift_unknownObjectRelease();
  }
  *(_QWORD *)(v1 + 40) = 0;
  return swift_unknownObjectRelease();
}

uint64_t sub_24968E5F0()
{
  return sub_2496BAD68();
}

unint64_t sub_24968E65C(uint64_t a1, char a2)
{
  unint64_t v4;
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
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, char *, uint64_t);
  unint64_t v20;
  unint64_t v21;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;

  v4 = 0xD000000000000014;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFCE8);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v24 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - v9;
  v11 = sub_2496BAB10();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (a2 != 1)
      return v4;
    v15 = *(_QWORD *)(a1 + 16);
    v16 = MEMORY[0x24BEE4AF8];
    if (v15)
    {
      v25 = MEMORY[0x24BEE4AF8];
      sub_2496A2C94(0, v15, 0);
      v17 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      v23 = *(_QWORD *)(v6 + 72);
      do
      {
        sub_249697838(v17, (uint64_t)v10);
        v18 = v24;
        (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v24, v10, v11);
        v19 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
        v19(v14, v18, v11);
        sub_249697880((uint64_t)v10, &qword_2544AFCE8);
        v16 = v25;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2496A2C94(0, *(_QWORD *)(v16 + 16) + 1, 1);
          v16 = v25;
        }
        v21 = *(_QWORD *)(v16 + 16);
        v20 = *(_QWORD *)(v16 + 24);
        if (v21 >= v20 >> 1)
        {
          sub_2496A2C94(v20 > 1, v21 + 1, 1);
          v16 = v25;
        }
        *(_QWORD *)(v16 + 16) = v21 + 1;
        v19((char *)(v16+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v21), v14, v11);
        v25 = v16;
        v17 += v23;
        --v15;
      }
      while (v15);
    }
    sub_2496BA150(v16);
    swift_bridgeObjectRelease();
    v25 = 0;
    v26 = 0xE000000000000000;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v25 = 0xD00000000000002ALL;
    v26 = 0x80000002496BFF10;
    sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
    sub_2496BAFF0();
    sub_2496BAF48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v25 = 0;
    v26 = 0xE000000000000000;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v25 = 0xD00000000000001ALL;
    v26 = 0x80000002496BFF40;
    type metadata accessor for ConnectionID();
    sub_24968BDD4((unint64_t *)&unk_2544AFE50, (uint64_t (*)(uint64_t))type metadata accessor for ConnectionID, (uint64_t)&unk_2496BC3C8);
    sub_2496BAFF0();
    sub_2496BAF48();
  }
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  return v25;
}

unint64_t sub_24968E9A4()
{
  uint64_t v0;

  return sub_24968E65C(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

_QWORD *sub_24968E9B0(char a1)
{
  uint64_t v1;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;

  if ((*(_BYTE *)(v1 + 64) & 1) != 0)
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    v3 = sub_2496A28D4(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v5 = v3[2];
    v4 = v3[3];
    if (v5 >= v4 >> 1)
      v3 = sub_2496A28D4((_QWORD *)(v4 > 1), v5 + 1, 1, v3);
    v3[2] = v5 + 1;
    v6 = &v3[2 * v5];
    v6[4] = 0;
    *((_BYTE *)v6 + 40) = 2;
  }
  swift_beginAccess();
  v7 = *(_QWORD *)(v1 + 56);
  if (*(_QWORD *)(v7 + 16))
  {
    if ((a1 & 1) != 0)
      swift_bridgeObjectRetain();
    else
      v7 = MEMORY[0x24BEE4B08];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v3 = sub_2496A28D4(0, v3[2] + 1, 1, v3);
    v9 = v3[2];
    v8 = v3[3];
    if (v9 >= v8 >> 1)
      v3 = sub_2496A28D4((_QWORD *)(v8 > 1), v9 + 1, 1, v3);
    v3[2] = v9 + 1;
    v10 = &v3[2 * v9];
    v10[4] = v7;
    *((_BYTE *)v10 + 40) = 0;
  }
  v11 = *(_QWORD *)(v1 + 48);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v11 + 32) + 16))
    goto LABEL_17;
  swift_beginAccess();
  v12 = *(_QWORD *)(v11 + 24);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v13 = swift_bridgeObjectRetain();
  v14 = sub_2496B56A4(v13);
  v15 = sub_24969EF54(v12, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v15 & 1) == 0)
  {
LABEL_17:
    if ((a1 & 1) != 0)
      v16 = sub_2496AA224();
    else
      v16 = MEMORY[0x24BEE4AF8];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v3 = sub_2496A28D4(0, v3[2] + 1, 1, v3);
    v18 = v3[2];
    v17 = v3[3];
    if (v18 >= v17 >> 1)
      v3 = sub_2496A28D4((_QWORD *)(v17 > 1), v18 + 1, 1, v3);
    v3[2] = v18 + 1;
    v19 = &v3[2 * v18];
    v19[4] = v16;
    *((_BYTE *)v19 + 40) = 1;
  }
  return v3;
}

uint64_t sub_24968EC18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_24968BA88(v0+ OBJC_IVAR____TtCC26UIIntelligenceSupportAgent24IntelligenceSupportAgentP33_F6EEC212C1562732DDB5A4B69A480AD213ActiveRequest_parameters, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceSupportAgent.RequestParameters);
  v1 = v0
     + OBJC_IVAR____TtCC26UIIntelligenceSupportAgent24IntelligenceSupportAgentP33_F6EEC212C1562732DDB5A4B69A480AD213ActiveRequest_request;
  v2 = sub_2496BAC9C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24968ECAC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0;
  type metadata accessor for IntelligenceSupportAgentXPCListener();
  swift_allocObject();
  v2 = sub_24968B2A4();
  *(_QWORD *)(v1 + 16) = v2;
  v3 = sub_2496A8D94(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF40);
  v4 = swift_allocObject();
  *(_DWORD *)(v4 + 40) = 0;
  *(_QWORD *)(v4 + 16) = v3;
  *(_BYTE *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v1 + 24) = v4;
  sub_2496A8224();
  v2[3] = &off_251AA2180;
  swift_unknownObjectWeakAssign();
  swift_retain();
  sub_2496885A4();
  swift_release();
  v5 = *(_QWORD *)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 40));
  sub_2496BA8D0();
  v6 = sub_2496BA8C4();
  swift_release();
  *(_QWORD *)(v5 + 32) = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 40));
  swift_release();
  return v1;
}

uint64_t sub_24968EDAC(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  _QWORD v17[2];

  v4 = type metadata accessor for ConnectionID();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2496BAB10();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24968BA44(a1, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, &v6[*(int *)(v4 + 20)], v7);
  if ((sub_2496921D0((uint64_t)v10, a2[2]) & 1) != 0
    || (v11 = sub_2496BAAEC(), v12)
    && (v13 = sub_249692354(v11, v12, a2[3]), swift_bridgeObjectRelease(), (v13 & 1) != 0))
  {
    v14 = 0;
  }
  else
  {
    v15 = a2[1];
    if (v15)
      v14 = sub_2496921D0((uint64_t)v10, v15);
    else
      v14 = 1;
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14 & 1;
}

uint64_t sub_24968EF04(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v17;

  v2 = v1;
  v4 = type metadata accessor for ConnectionID();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2496BAB10();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24968BA44(a1, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, &v6[*(int *)(v4 + 20)], v7);
  if ((sub_2496921D0((uint64_t)v10, v2[2]) & 1) != 0
    || (v11 = sub_2496BAAEC(), v12)
    && (v13 = sub_249692354(v11, v12, v2[3]), swift_bridgeObjectRelease(), (v13 & 1) != 0))
  {
    v14 = 0;
  }
  else
  {
    v15 = v2[1];
    if (v15)
      v14 = sub_2496921D0((uint64_t)v10, v15);
    else
      v14 = 1;
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14 & 1;
}

uint64_t sub_24968F04C(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
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

  v7 = type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient(0);
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
      sub_24968BA44(a3 + v16 + v13 * v14, (uint64_t)v12, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
      v17 = a1(v12);
      if (v3)
      {
        sub_24968BA88((uint64_t)v12, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if ((v17 & 1) != 0)
      {
        sub_24968BC5C((uint64_t)v12, v23, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_2496A2CEC(0, *(_QWORD *)(v15 + 16) + 1, 1);
        v15 = v25;
        v19 = *(_QWORD *)(v25 + 16);
        v18 = *(_QWORD *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_2496A2CEC(v18 > 1, v19 + 1, 1);
          v15 = v25;
        }
        *(_QWORD *)(v15 + 16) = v19 + 1;
        result = sub_24968BC5C(v23, v15 + v16 + v19 * v13, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        result = sub_24968BA88((uint64_t)v12, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
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

uint64_t sub_24968F264@<X0>(uint64_t *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
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
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  NSObject *v36;
  int v37;
  _BOOL4 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  os_log_t v49;
  void (*v50)(uint64_t, _BYTE *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t ObjectType;
  _BYTE *v60;
  _BYTE *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v66;
  uint64_t v67;
  _QWORD *v68;
  void (*v69)(_BYTE *, uint64_t);
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  void *v74;
  _BYTE *v75;
  _BYTE *v76;
  _BYTE *v77;
  _BYTE *v78;
  uint64_t v79;
  uint64_t *v80;
  char isUniquelyReferenced_nonNull_native;
  void (*v82)(uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _BYTE v87[12];
  int v88;
  _BYTE *v89;
  os_log_t v90;
  uint64_t v91;
  _BYTE *v92;
  uint64_t v93;
  int v94;
  _BYTE *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _BYTE *v99;
  uint64_t v100;
  _BYTE *v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _BYTE *v106;
  uint64_t v107;
  uint64_t v108;
  _BYTE *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t, uint64_t);
  _BYTE *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  _BYTE *v119;
  double *v120;
  void (*v121)(uint64_t, _BYTE *, uint64_t);
  _BYTE *v122;
  uint64_t aBlock[6];
  uint64_t v124;

  v116 = a7;
  v105 = a6;
  v112 = a4;
  v113 = a5;
  v120 = (double *)a3;
  v94 = a2;
  v118 = a1;
  v117 = a8;
  v8 = sub_2496BAE40();
  v110 = *(_QWORD *)(v8 - 8);
  v111 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v109 = &v87[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v108 = sub_2496BAE70();
  v107 = *(_QWORD *)(v108 - 8);
  MEMORY[0x24BDAC7A8](v108);
  v106 = &v87[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v104 = sub_2496BAE28();
  v103 = *(_QWORD *)(v104 - 8);
  v11 = MEMORY[0x24BDAC7A8](v104);
  v102 = &v87[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v101 = &v87[-v13];
  v100 = sub_2496BAE88();
  v96 = *(_QWORD *)(v100 - 8);
  v14 = MEMORY[0x24BDAC7A8](v100);
  v95 = &v87[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v14);
  v99 = &v87[-v16];
  v17 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v115 = &v87[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v18);
  v21 = &v87[-v20];
  v22 = sub_2496BADB0();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = &v87[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = sub_2496BACF0();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v119 = &v87[-((v29 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v30 = MEMORY[0x24BDAC7A8](v28);
  v32 = &v87[-v31];
  v97 = v33;
  MEMORY[0x24BDAC7A8](v30);
  v35 = &v87[-v34];
  sub_2496BACD8();
  sub_2496BAD98();
  v121 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v27 + 16);
  v122 = v35;
  v121((uint64_t)v32, v35, v26);
  sub_24968BA44((uint64_t)v120, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceSupportAgent.RequestParameters);
  v36 = sub_2496BADA4();
  v37 = sub_2496BB008();
  v38 = os_log_type_enabled(v36, (os_log_type_t)v37);
  v98 = v27;
  if (v38)
  {
    v92 = v21;
    v89 = v25;
    v88 = v37;
    v90 = v36;
    v91 = v23;
    v93 = v22;
    v39 = swift_slowAlloc();
    v40 = swift_slowAlloc();
    aBlock[0] = v40;
    *(_DWORD *)v39 = 136446722;
    v41 = sub_2496BACCC();
    v124 = sub_2496926A4(v41, v42, aBlock);
    sub_2496BB134();
    swift_bridgeObjectRelease();
    v114 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v114((uint64_t)v32, v26);
    *(_WORD *)(v39 + 12) = 2082;
    if ((_BYTE)v94)
    {
      if (v94 == 1)
        v43 = 1769105747;
      else
        v43 = 0xD000000000000010;
      if (v94 == 1)
        v44 = 0xE400000000000000;
      else
        v44 = 0x80000002496BFA60;
    }
    else
    {
      v44 = 0xE900000000000029;
      v43 = 0x6E776F6E6B6E7528;
    }
    v45 = v93;
    v46 = (uint64_t)v92;
    v124 = sub_2496926A4(v43, v44, aBlock);
    sub_2496BB134();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 22) = 2082;
    v47 = IntelligenceSupportAgent.RequestParameters.description.getter();
    v124 = sub_2496926A4(v47, v48, aBlock);
    sub_2496BB134();
    swift_bridgeObjectRelease();
    sub_24968BA88(v46, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceSupportAgent.RequestParameters);
    v49 = v90;
    _os_log_impl(&dword_249686000, v90, (os_log_type_t)v88, "starting %{public}s for client %{public}s: %{public}s", (uint8_t *)v39, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24BCF5FEC](v40, -1, -1);
    MEMORY[0x24BCF5FEC](v39, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v91 + 8))(v89, v45);
  }
  else
  {
    v114 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v114((uint64_t)v32, v26);
    sub_24968BA88((uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceSupportAgent.RequestParameters);

    (*(void (**)(_BYTE *, uint64_t))(v23 + 8))(v25, v22);
  }
  v50 = v121;
  v51 = v26;
  v52 = (uint64_t)v119;
  v53 = v120;
  v55 = v112;
  v54 = v113;
  v121((uint64_t)v119, v122, v51);
  v56 = v115;
  sub_24968BA44((uint64_t)v53, (uint64_t)v115, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceSupportAgent.RequestParameters);
  type metadata accessor for IntelligenceSupportAgent.ActiveRequest();
  swift_allocObject();
  swift_retain();
  v57 = sub_24968D9E8(v52, (uint64_t)v56, v55, v54);
  v58 = v57;
  if (*(_QWORD *)(v57 + 40))
  {
    v115 = *(_BYTE **)(v57 + 40);
    ObjectType = swift_getObjectType();
    v112 = ObjectType;
    swift_unknownObjectRetain();
    v60 = v95;
    sub_2496BAE7C();
    v61 = v99;
    MEMORY[0x24BCF5578](v60, *v53);
    v96 = *(_QWORD *)(v96 + 8);
    v62 = v100;
    ((void (*)(_BYTE *, uint64_t))v96)(v60, v100);
    v63 = *MEMORY[0x24BEE5418];
    v120 = (double *)v51;
    v64 = v103;
    v65 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v103 + 104);
    v113 = v58;
    v66 = v101;
    v67 = v104;
    v65(v101, v63, v104);
    v68 = v102;
    *v102 = 0;
    v65(v68, *MEMORY[0x24BEE5400], v67);
    MEMORY[0x24BCF57C4](v61, v66, v68, ObjectType);
    v69 = *(void (**)(_BYTE *, uint64_t))(v64 + 8);
    v69(v68, v67);
    v69(v66, v67);
    ((void (*)(_BYTE *, uint64_t))v96)(v61, v62);
    v70 = swift_allocObject();
    swift_weakInit();
    v121(v52, v122, (uint64_t)v120);
    v71 = v98;
    v72 = (*(unsigned __int8 *)(v98 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80);
    v73 = swift_allocObject();
    *(_QWORD *)(v73 + 16) = v70;
    (*(void (**)(unint64_t, uint64_t, double *))(v71 + 32))(v73 + v72, v52, v120);
    aBlock[4] = (uint64_t)sub_249696D24;
    aBlock[5] = v73;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_24968D580;
    aBlock[3] = (uint64_t)&block_descriptor_13;
    v74 = _Block_copy(aBlock);
    swift_retain();
    v75 = v106;
    sub_2496BAE58();
    v76 = v109;
    sub_24968FCDC();
    sub_2496BB0A4();
    _Block_release(v74);
    v77 = v76;
    v58 = v113;
    (*(void (**)(_BYTE *, uint64_t))(v110 + 8))(v77, v111);
    v78 = v75;
    v52 = (uint64_t)v119;
    (*(void (**)(_BYTE *, uint64_t))(v107 + 8))(v78, v108);
    v50 = v121;
    swift_release();
    v51 = (uint64_t)v120;
    swift_release();
    sub_2496BB0BC();
    swift_unknownObjectRelease();
  }
  v79 = (uint64_t)v122;
  v50(v52, v122, v51);
  swift_retain();
  v80 = v118;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = *v80;
  *v80 = 0x8000000000000000;
  sub_249693C2C(v58, v52, isUniquelyReferenced_nonNull_native);
  *v80 = aBlock[0];
  swift_bridgeObjectRelease();
  v82 = v114;
  v114(v52, v51);
  sub_24968DDFC(v116);
  if (*((_BYTE *)v80 + 8) == 1)
    *(_BYTE *)(v58 + 64) = 1;
  v83 = sub_24968E9B0(0)[2];
  swift_bridgeObjectRelease();
  if (!v83)
    sub_249696518(v118, v79);
  v82(v79, v51);
  v84 = v58
      + OBJC_IVAR____TtCC26UIIntelligenceSupportAgent24IntelligenceSupportAgentP33_F6EEC212C1562732DDB5A4B69A480AD213ActiveRequest_request;
  v85 = sub_2496BAC9C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v85 - 8) + 16))(v117, v84, v85);
  return swift_release();
}

uint64_t sub_24968FC04(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v4 = *(_QWORD *)(result + 24);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v4 + 40));
    sub_24968FD88((uint64_t *)(v4 + 16), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 40));
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_24968FCB0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24968FCDC()
{
  sub_2496BAE40();
  sub_24968BDD4((unint64_t *)&qword_2544AFEA8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEB0);
  sub_249696E5C((unint64_t *)&qword_2544AFEB8, &qword_2544AFEB0);
  return sub_2496BB170();
}

uint64_t sub_24968FD88(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  os_log_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  _QWORD v45[2];
  os_log_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v4 = sub_2496BACF0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v45 - v9;
  v11 = (uint64_t *)sub_2496BADB0();
  v51 = *(v11 - 1);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v45 - v15;
  v50 = a1;
  v17 = *a1;
  if (*(_QWORD *)(v17 + 16) && (v18 = sub_2496B6A48(a2), (v19 & 1) != 0))
  {
    v20 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v18);
    swift_retain();
    sub_24968E9B0(1);
    sub_2496BAD98();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
    swift_bridgeObjectRetain();
    v21 = sub_2496BADA4();
    v22 = sub_2496BB014();
    LODWORD(v49) = v22;
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v48 = v20;
      v24 = v23;
      v47 = swift_slowAlloc();
      v54 = v47;
      *(_DWORD *)v24 = 136446466;
      v45[0] = v24 + 4;
      v46 = v21;
      v25 = sub_2496BACCC();
      v52 = sub_2496926A4(v25, v26, &v54);
      v45[1] = &v53;
      sub_2496BB134();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      *(_WORD *)(v24 + 12) = 2082;
      v27 = swift_bridgeObjectRetain();
      v28 = MEMORY[0x24BCF568C](v27, &type metadata for IntelligenceSupportAgent.ActiveRequest.CompletionActivity);
      v29 = v11;
      v31 = v30;
      swift_bridgeObjectRelease();
      v52 = sub_2496926A4(v28, v31, &v54);
      sub_2496BB134();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v32 = v46;
      _os_log_impl(&dword_249686000, v46, (os_log_type_t)v49, "timed out %{public}s because %{public}s", (uint8_t *)v24, 0x16u);
      v33 = v47;
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v33, -1, -1);
      MEMORY[0x24BCF5FEC](v24, -1, -1);

      (*(void (**)(char *, uint64_t *))(v51 + 8))(v14, v29);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t *))(v51 + 8))(v14, v11);
    }
    sub_249696518(v50, a2);
    return swift_release();
  }
  else
  {
    sub_2496BAD98();
    v34 = v5;
    v35 = a2;
    v36 = v4;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v35, v4);
    v37 = sub_2496BADA4();
    v38 = sub_2496BB014();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v49 = v34;
      v41 = v40;
      v54 = v40;
      v48 = v36;
      *(_DWORD *)v39 = 136446210;
      v50 = v11;
      v42 = sub_2496BACCC();
      v52 = sub_2496926A4(v42, v43, &v54);
      sub_2496BB134();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v10, v48);
      _os_log_impl(&dword_249686000, v37, v38, "timed out invalid %{public}s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v41, -1, -1);
      MEMORY[0x24BCF5FEC](v39, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t *))(v51 + 8))(v16, v50);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v4);

      return (*(uint64_t (**)(char *, uint64_t *))(v51 + 8))(v16, v11);
    }
  }
}

uint64_t sub_249690244(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint8_t *v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  int64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;

  v3 = sub_2496BACF0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFD68);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v41 - v11;
  v13 = sub_2496BADB0();
  v14 = *(_QWORD *)(v13 - 8);
  result = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1[1] & 1) != 0)
    return result;
  v49 = result;
  v48 = v6;
  v43 = v1;
  *((_BYTE *)a1 + 8) = 1;
  sub_2496BAD98();
  v18 = sub_2496BADA4();
  v19 = sub_2496BB008();
  v20 = os_log_type_enabled(v18, v19);
  v45 = a1;
  if (v20)
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_249686000, v18, v19, "Launch completed", v21, 2u);
    v22 = v21;
    a1 = v45;
    MEMORY[0x24BCF5FEC](v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v49);
  if (a1[2])
  {
    sub_2496BADF8();
    swift_release();
  }
  a1[2] = 0;
  v23 = *a1;
  v24 = *(_QWORD *)(*a1 + 64);
  v44 = *a1 + 64;
  v25 = 1 << *(_BYTE *)(v23 + 32);
  v26 = -1;
  if (v25 < 64)
    v26 = ~(-1 << v25);
  v27 = v26 & v24;
  v46 = (unint64_t)(v25 + 63) >> 6;
  v47 = v23;
  v42 = v46 - 1;
  result = swift_bridgeObjectRetain();
  v49 = 0;
  v28 = (uint64_t)v48;
  if (!v27)
    goto LABEL_13;
LABEL_11:
  v29 = __clz(__rbit64(v27));
  v27 &= v27 - 1;
  v30 = v29 | (v49 << 6);
  while (2)
  {
    v31 = v47;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v10, *(_QWORD *)(v47 + 48) + *(_QWORD *)(v4 + 72) * v30, v3);
    v32 = *(_QWORD *)(v31 + 56);
    v33 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFD58);
    *(_QWORD *)&v10[*(int *)(v33 + 48)] = *(_QWORD *)(v32 + 8 * v30);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v10, 0, 1, v33);
    swift_retain();
    while (1)
    {
      sub_24969765C((uint64_t)v10, (uint64_t)v12);
      v38 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFD58);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 48))(v12, 1, v38) == 1)
        return swift_release();
      v39 = *(_QWORD *)&v12[*(int *)(v38 + 48)];
      (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v28, v12, v3);
      *(_BYTE *)(v39 + 64) = 1;
      v40 = sub_24968E9B0(0)[2];
      swift_bridgeObjectRelease();
      if (v40)
      {
        (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v28, v3);
        result = swift_release();
        if (v27)
          goto LABEL_11;
      }
      else
      {
        sub_249696518(v45, v28);
        swift_release();
        result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v28, v3);
        if (v27)
          goto LABEL_11;
      }
LABEL_13:
      v34 = v49 + 1;
      if (__OFADD__(v49, 1))
      {
        __break(1u);
        goto LABEL_38;
      }
      if (v34 < v46)
      {
        v35 = *(_QWORD *)(v44 + 8 * v34);
        if (v35)
          goto LABEL_16;
        v36 = v49 + 2;
        ++v49;
        if (v34 + 1 < v46)
        {
          v35 = *(_QWORD *)(v44 + 8 * v36);
          if (v35)
            goto LABEL_19;
          v49 = v34 + 1;
          if (v34 + 2 < v46)
          {
            v35 = *(_QWORD *)(v44 + 8 * (v34 + 2));
            if (v35)
            {
              v34 += 2;
              goto LABEL_16;
            }
            v36 = v34 + 3;
            v49 = v34 + 2;
            if (v34 + 3 < v46)
              break;
          }
        }
      }
LABEL_30:
      v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFD58);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v10, 1, 1, v37);
      v27 = 0;
    }
    v35 = *(_QWORD *)(v44 + 8 * v36);
    if (v35)
    {
LABEL_19:
      v34 = v36;
LABEL_16:
      v27 = (v35 - 1) & v35;
      v30 = __clz(__rbit64(v35)) + (v34 << 6);
      v49 = v34;
      continue;
    }
    break;
  }
  while (1)
  {
    v34 = v36 + 1;
    if (__OFADD__(v36, 1))
      break;
    if (v34 >= v46)
    {
      v49 = v42;
      goto LABEL_30;
    }
    v35 = *(_QWORD *)(v44 + 8 * v34);
    ++v36;
    if (v35)
      goto LABEL_16;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t IntelligenceSupportAgent.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t IntelligenceSupportAgent.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_249690724(uint64_t a1)
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
  uint64_t (*v11)(_QWORD);
  char *v12;
  uint64_t v13;
  uint64_t result;
  os_unfair_lock_s *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v2 = v1;
  v4 = sub_2496BAC9C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ConnectionID();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24968BA44(a1, (uint64_t)v10, v11);
  v12 = &v10[*(int *)(v8 + 20)];
  LODWORD(v10) = sub_2496BAB04();
  v13 = sub_2496BAB10();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  result = getpid();
  if ((_DWORD)v10 != (_DWORD)result)
  {
    v15 = *(os_unfair_lock_s **)(v2 + 24);
    swift_retain();
    os_unfair_lock_lock(v15 + 10);
    sub_249690988((uint64_t)&v15[4], &v28);
    os_unfair_lock_unlock(v15 + 10);
    v16 = v28;
    swift_release();
    v17 = *(_QWORD *)(v16 + 16);
    if (v17)
    {
      v18 = *(unsigned __int8 *)(v5 + 80);
      v25[1] = v16;
      v19 = v16 + ((v18 + 32) & ~v18);
      v27 = *(_QWORD *)(v5 + 72);
      v20 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      v26 = xmmword_2496BBD40;
      do
      {
        v20(v7, v19, v4);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF98);
        v21 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient(0)
                                             - 8)
                                 + 80);
        v22 = v5;
        v23 = (v21 + 32) & ~v21;
        v24 = swift_allocObject();
        *(_OWORD *)(v24 + 16) = v26;
        sub_24968BA44(a1, v24 + v23, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
        sub_24968B41C(v24, (uint64_t)v7);
        swift_setDeallocating();
        v5 = v22;
        swift_arrayDestroy();
        swift_deallocClassInstance();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v4);
        v19 += v27;
        --v17;
      }
      while (v17);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_249690988@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)(result + 8) & 1) != 0)
  {
    v3 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    MEMORY[0x24BDAC7A8](result);
    v4 = swift_bridgeObjectRetain();
    v3 = sub_249696EA4(v4, (void (*)(char *, uint64_t))sub_249696E9C);
    result = swift_bridgeObjectRelease();
  }
  *a2 = v3;
  return result;
}

uint64_t sub_249690A30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  os_log_t v42;
  int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  _QWORD v54[2];
  uint64_t v55;

  v48 = a1;
  v50 = a4;
  v6 = type metadata accessor for ConnectionID();
  v49 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient(0);
  MEMORY[0x24BDAC7A8](v9);
  v51 = (uint64_t)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2496BACF0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2496BADB0();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v52 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_24968EF04(a3) & 1) != 0)
  {
    v45 = (uint64_t *)v8;
    v46 = a2;
    v47 = v16;
    sub_2496BAD98();
    v18 = v11;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v48, v11);
    v48 = a3;
    sub_24968BA44(a3, v51, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
    v19 = sub_2496BADA4();
    v20 = sub_2496BB008();
    v21 = v20;
    v22 = os_log_type_enabled(v19, v20);
    v23 = v49;
    if (v22)
    {
      v24 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v55 = v44;
      *(_DWORD *)v24 = 136446466;
      v43 = v21;
      v42 = v19;
      v25 = sub_2496BACCC();
      v54[0] = sub_2496926A4(v25, v26, &v55);
      sub_2496BB134();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v18);
      *(_WORD *)(v24 + 12) = 2080;
      v27 = v51;
      v28 = v45;
      sub_24968BA44(v51, (uint64_t)v45, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v54[0] = 0;
      v54[1] = 0xE000000000000000;
      sub_2496BB1E8();
      swift_bridgeObjectRelease();
      strcpy((char *)v54, "ConnectionID(");
      HIWORD(v54[1]) = -4864;
      v53 = *v28;
      sub_2496BB368();
      sub_2496BAF48();
      swift_bridgeObjectRelease();
      sub_2496BAF48();
      sub_2496BAB10();
      sub_24968BDD4((unint64_t *)&unk_2544AFD10, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAC8]);
      sub_2496BB368();
      sub_2496BAF48();
      swift_bridgeObjectRelease();
      sub_2496BAF48();
      v29 = v54[0];
      v30 = v54[1];
      sub_24968BA88((uint64_t)v28, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v54[0] = sub_2496926A4(v29, v30, &v55);
      sub_2496BB134();
      swift_bridgeObjectRelease();
      sub_24968BA88(v27, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
      v19 = v42;
      _os_log_impl(&dword_249686000, v42, (os_log_type_t)v43, "notifying launch-wait client for %{public}s: %s", (uint8_t *)v24, 0x16u);
      v31 = v44;
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v31, -1, -1);
      MEMORY[0x24BCF5FEC](v24, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      sub_24968BA88(v51, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
    }

    (*(void (**)(char *, uint64_t))(v47 + 8))(v52, v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFFA0);
    v34 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_2496BBD40;
    sub_24968BA44(v48, v35 + v34, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v36 = v46;
    sub_24968DDFC(v35);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v37 = v36
        + OBJC_IVAR____TtCC26UIIntelligenceSupportAgent24IntelligenceSupportAgentP33_F6EEC212C1562732DDB5A4B69A480AD213ActiveRequest_request;
    v38 = sub_2496BAC9C();
    v39 = *(_QWORD *)(v38 - 8);
    v40 = v50;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(v50, v37, v38);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v39 + 56))(v40, 0, 1, v38);
  }
  else
  {
    v32 = sub_2496BAC9C();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v50, 1, 1, v32);
  }
}

uint64_t sub_249690F78(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(_BYTE *, unint64_t, uint64_t);
  _BYTE v16[16];
  uint64_t v17;
  uint64_t v18;

  v5 = sub_2496BACF0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = a2;
  v9 = swift_bridgeObjectRetain();
  v10 = sub_249697290(v9, (void (*)(char *, uint64_t))sub_249697288);
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    v18 = v2;
    v12 = v10 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v13 = *(_QWORD *)(v6 + 72);
    v14 = *(void (**)(_BYTE *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v14(v8, v12, v5);
      sub_249696518(a1, (uint64_t)v8);
      (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
      v12 += v13;
      --v11;
    }
    while (v11);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2496910A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];

  v39 = a1;
  v7 = type metadata accessor for ConnectionID();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (uint64_t *)((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v36 - v12;
  v14 = sub_2496BADB0();
  v40 = *(_QWORD *)(v14 - 8);
  v41 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFE80);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = a2;
  swift_beginAccess();
  sub_24969518C(a3, (uint64_t)v19);
  swift_endAccess();
  LODWORD(a2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v19, 1, v7);
  sub_249697880((uint64_t)v19, &qword_2544AFE80);
  if ((_DWORD)a2 == 1)
  {
    v20 = sub_2496BACF0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a4, 1, 1, v20);
  }
  else
  {
    v38 = a4;
    sub_2496BAD98();
    sub_24968BA44((uint64_t)a3, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v22 = sub_2496BADA4();
    v23 = sub_2496BB008();
    v24 = v23;
    if (os_log_type_enabled(v22, v23))
    {
      v37 = v24;
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v44 = v26;
      *(_DWORD *)v25 = 136446210;
      v36 = v25 + 4;
      sub_24968BA44((uint64_t)v13, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v45[0] = 0;
      v45[1] = 0xE000000000000000;
      sub_2496BB1E8();
      swift_bridgeObjectRelease();
      strcpy((char *)v45, "ConnectionID(");
      HIWORD(v45[1]) = -4864;
      v43 = *v11;
      sub_2496BB368();
      sub_2496BAF48();
      swift_bridgeObjectRelease();
      sub_2496BAF48();
      sub_2496BAB10();
      sub_24968BDD4((unint64_t *)&unk_2544AFD10, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAC8]);
      sub_2496BB368();
      sub_2496BAF48();
      swift_bridgeObjectRelease();
      sub_2496BAF48();
      v27 = v45[0];
      v28 = v45[1];
      sub_24968BA88((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v45[0] = sub_2496926A4(v27, v28, &v44);
      sub_2496BB134();
      swift_bridgeObjectRelease();
      sub_24968BA88((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      _os_log_impl(&dword_249686000, v22, (os_log_type_t)v37, "client unexpectedly disconnected while pending: %{public}s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v26, -1, -1);
      MEMORY[0x24BCF5FEC](v25, -1, -1);
    }
    else
    {
      sub_24968BA88((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    }

    (*(void (**)(char *, uint64_t))(v40 + 8))(v16, v41);
    v29 = v38;
    v30 = sub_24968E9B0(0)[2];
    swift_bridgeObjectRelease();
    v31 = sub_2496BACF0();
    v32 = *(_QWORD *)(v31 - 8);
    if (v30)
    {
      v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56);
      v34 = v29;
      v35 = 1;
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v29, v39, v31);
      v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56);
      v34 = v29;
      v35 = 0;
    }
    return v33(v34, v35, 1, v31);
  }
}

uint64_t sub_2496914FC(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  os_log_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  unint64_t v51;
  void (*v52)(uint64_t, unint64_t, uint64_t);
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  NSObject *v60;
  os_log_type_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  void (*v70)(char *, uint64_t);
  uint64_t *v71;
  char *v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  void (*v82)(char *, uint64_t);
  uint64_t v83;
  os_log_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t *v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  int v94;
  void (*v95)(char *, uint64_t);
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  _QWORD v107[2];
  uint64_t v108;
  uint64_t *v109;

  v96 = a3;
  v106 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFE80);
  MEMORY[0x24BDAC7A8](v4);
  v98 = (uint64_t)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD88);
  MEMORY[0x24BDAC7A8](v6);
  v101 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = sub_2496BACF0();
  v104 = *(_QWORD *)(v102 - 8);
  v8 = MEMORY[0x24BDAC7A8](v102);
  v10 = (char *)&v83 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v83 - v11;
  v13 = sub_2496BAAD4();
  v103 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v105 = (uint64_t)&v83 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for ConnectionID();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v91 = (uint64_t)&v83 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v86 = (uint64_t)&v83 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (uint64_t *)((char *)&v83 - v21);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v83 - v23;
  v25 = sub_2496BADB0();
  v97 = *(_QWORD *)(v25 - 8);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v92 = (char *)&v83 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v87 = (char *)&v83 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)&v83 - v30;
  sub_2496BAD98();
  v99 = a2;
  v32 = (uint64_t)a2;
  v33 = v96;
  sub_24968BA44(v32, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
  swift_bridgeObjectRetain_n();
  v95 = (void (*)(char *, uint64_t))v31;
  v34 = sub_2496BADA4();
  v35 = sub_2496BB008();
  v94 = v35;
  v36 = os_log_type_enabled(v34, v35);
  v100 = v13;
  v93 = v25;
  v89 = v22;
  v90 = v10;
  v88 = v15;
  if (v36)
  {
    v37 = swift_slowAlloc();
    v85 = swift_slowAlloc();
    v109 = (uint64_t *)v85;
    *(_DWORD *)v37 = 136446466;
    v83 = v37 + 4;
    sub_24968BA44((uint64_t)v24, (uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v107[0] = 0;
    v107[1] = 0xE000000000000000;
    v84 = v34;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    strcpy((char *)v107, "ConnectionID(");
    HIWORD(v107[1]) = -4864;
    v108 = *v22;
    sub_2496BB368();
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    sub_2496BAF48();
    sub_2496BAB10();
    sub_24968BDD4((unint64_t *)&unk_2544AFD10, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAC8]);
    sub_2496BB368();
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    sub_2496BAF48();
    v38 = v107[0];
    v39 = v107[1];
    sub_24968BA88((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v107[0] = sub_2496926A4(v38, v39, (uint64_t *)&v109);
    sub_2496BB134();
    swift_bridgeObjectRelease();
    sub_24968BA88((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    *(_WORD *)(v37 + 12) = 2050;
    v40 = *(_QWORD *)(v33 + 16);
    swift_bridgeObjectRelease();
    v107[0] = v40;
    sub_2496BB134();
    swift_bridgeObjectRelease();
    v41 = v84;
    _os_log_impl(&dword_249686000, v84, (os_log_type_t)v94, "client %{public}s provided %{public}ld fragments", (uint8_t *)v37, 0x16u);
    v42 = v85;
    swift_arrayDestroy();
    MEMORY[0x24BCF5FEC](v42, -1, -1);
    v43 = v37;
    v13 = v100;
    MEMORY[0x24BCF5FEC](v43, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24968BA88((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);

    swift_bridgeObjectRelease();
  }
  v44 = *(void (**)(_QWORD, uint64_t))(v97 + 8);
  v44(v95, v25);
  v46 = v104;
  v45 = v105;
  v47 = (uint64_t)v101;
  v48 = v102;
  result = v33;
  v50 = *(_QWORD *)(v33 + 16);
  if (v50)
  {
    v95 = (void (*)(char *, uint64_t))v44;
    v51 = v33 + ((*(unsigned __int8 *)(v103 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80));
    v97 = *(_QWORD *)(v103 + 72);
    v52 = *(void (**)(uint64_t, unint64_t, uint64_t))(v103 + 16);
    swift_bridgeObjectRetain();
    while (1)
    {
      v52(v45, v51, v13);
      sub_2496BAAC8();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v47, 1, v48) == 1)
        break;
      (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v12, v47, v48);
      if (!*(_QWORD *)(*v106 + 16) || (sub_2496B6A48((uint64_t)v12), (v53 & 1) == 0))
      {
        swift_bridgeObjectRelease();
        v57 = v92;
        sub_2496BAD98();
        v58 = v91;
        sub_24968BA44((uint64_t)v99, v91, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        v59 = v90;
        (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v90, v12, v48);
        v60 = sub_2496BADA4();
        v61 = sub_2496BB014();
        v62 = v61;
        if (os_log_type_enabled(v60, v61))
        {
          v63 = swift_slowAlloc();
          v106 = (uint64_t *)swift_slowAlloc();
          v109 = v106;
          *(_DWORD *)v63 = 136446466;
          v101 = (char *)(v63 + 4);
          v64 = v58;
          v65 = v89;
          sub_24968BA44(v64, (uint64_t)v89, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
          v107[0] = 0;
          v107[1] = 0xE000000000000000;
          LODWORD(v102) = v62;
          sub_2496BB1E8();
          swift_bridgeObjectRelease();
          strcpy((char *)v107, "ConnectionID(");
          HIWORD(v107[1]) = -4864;
          v108 = *v65;
          sub_2496BB368();
          sub_2496BAF48();
          swift_bridgeObjectRelease();
          sub_2496BAF48();
          sub_2496BAB10();
          sub_24968BDD4((unint64_t *)&unk_2544AFD10, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAC8]);
          sub_2496BB368();
          sub_2496BAF48();
          swift_bridgeObjectRelease();
          sub_2496BAF48();
          v66 = v107[0];
          v67 = v107[1];
          sub_24968BA88((uint64_t)v65, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
          v107[0] = sub_2496926A4(v66, v67, (uint64_t *)&v109);
          sub_2496BB134();
          swift_bridgeObjectRelease();
          sub_24968BA88(v91, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
          *(_WORD *)(v63 + 12) = 2082;
          v68 = sub_2496BACCC();
          v107[0] = sub_2496926A4(v68, v69, (uint64_t *)&v109);
          sub_2496BB134();
          swift_bridgeObjectRelease();
          v70 = *(void (**)(char *, uint64_t))(v104 + 8);
          v70(v59, v48);
          _os_log_impl(&dword_249686000, v60, (os_log_type_t)v102, "received fragment from client %{public}s for invalid or expired request %{public}s", (uint8_t *)v63, 0x16u);
          v71 = v106;
          swift_arrayDestroy();
          MEMORY[0x24BCF5FEC](v71, -1, -1);
          MEMORY[0x24BCF5FEC](v63, -1, -1);

          v95(v92, v93);
          v70(v12, v48);
          return (*(uint64_t (**)(uint64_t, uint64_t))(v103 + 8))(v105, v100);
        }

        v82 = *(void (**)(char *, uint64_t))(v46 + 8);
        v82(v59, v48);
        sub_24968BA88(v58, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        v95(v57, v93);
        v82(v12, v48);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v103 + 8))(v105, v13);
      }
      swift_beginAccess();
      swift_retain();
      v54 = v98;
      sub_24969518C(v99, v98);
      swift_endAccess();
      sub_249697880(v54, &qword_2544AFE80);
      v55 = v105;
      sub_2496A95B4(v105);
      v56 = sub_24968E9B0(0)[2];
      swift_bridgeObjectRelease();
      if (!v56)
        sub_249696518(v106, (uint64_t)v12);
      swift_release();
      v46 = v104;
      v48 = v102;
      (*(void (**)(char *, uint64_t))(v104 + 8))(v12, v102);
      v13 = v100;
      (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v55, v100);
      v51 += v97;
      --v50;
      v45 = v55;
      v47 = (uint64_t)v101;
      if (!v50)
        return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_249697880(v47, &qword_2544AFD88);
    v72 = v87;
    sub_2496BAD98();
    v73 = v86;
    sub_24968BA44((uint64_t)v99, v86, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v74 = sub_2496BADA4();
    v75 = sub_2496BB014();
    if (os_log_type_enabled(v74, v75))
    {
      v76 = swift_slowAlloc();
      v77 = swift_slowAlloc();
      v109 = (uint64_t *)v77;
      *(_DWORD *)v76 = 136446210;
      v106 = (uint64_t *)(v76 + 4);
      v78 = v89;
      sub_24968BA44(v73, (uint64_t)v89, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v107[0] = 0;
      v107[1] = 0xE000000000000000;
      sub_2496BB1E8();
      swift_bridgeObjectRelease();
      strcpy((char *)v107, "ConnectionID(");
      HIWORD(v107[1]) = -4864;
      v108 = *v78;
      sub_2496BB368();
      v79 = v73;
      sub_2496BAF48();
      swift_bridgeObjectRelease();
      sub_2496BAF48();
      sub_2496BAB10();
      sub_24968BDD4((unint64_t *)&unk_2544AFD10, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAC8]);
      sub_2496BB368();
      sub_2496BAF48();
      swift_bridgeObjectRelease();
      sub_2496BAF48();
      v80 = v107[0];
      v81 = v107[1];
      sub_24968BA88((uint64_t)v78, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v107[0] = sub_2496926A4(v80, v81, (uint64_t *)&v109);
      sub_2496BB134();
      swift_bridgeObjectRelease();
      sub_24968BA88(v79, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      _os_log_impl(&dword_249686000, v74, v75, "received fragment from client %{public}s with missing requestID", (uint8_t *)v76, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v77, -1, -1);
      MEMORY[0x24BCF5FEC](v76, -1, -1);

      v95(v87, v93);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v103 + 8))(v105, v100);
    }

    sub_24968BA88(v73, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v95(v72, v93);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v103 + 8))(v105, v13);
  }
  return result;
}

uint64_t sub_2496921D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_2496BAB10();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]), v6 = sub_2496BAEAC(), v7 = -1 << *(_BYTE *)(a2 + 32), v8 = v6 & ~v7, ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      sub_24968BDD4((unint64_t *)&unk_2544AFD00, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB8]);
      v12 = sub_2496BAED0();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_249692354(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_2496BB3B0();
    sub_2496BAF30();
    v6 = sub_2496BB3C8();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_2496BB380() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_2496BB380() & 1) != 0)
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

uint64_t IntelligenceSupportAgent.Client.description.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 1769105747;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x6E776F6E6B6E7528;
}

uint64_t sub_2496924E4()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 1769105747;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x6E776F6E6B6E7528;
}

uint64_t sub_249692540(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_249692550(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_249692584@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  if (result)
    *a2 = result;
  else
    __break(1u);
  return result;
}

void sub_249692594(uint8_t *a1, uint32_t a2, NSObject *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v13;

  v13 = sub_2496BAD08();
  _os_signpost_emit_with_name_impl(&dword_249686000, a3, a4, v13, a6, a7, a1, a2);
}

uint64_t sub_249692614(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_249692634(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2496926A4(v6, v7, a3);
  v8 = *a1 + 8;
  sub_2496BB134();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2496926A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_249692774(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2496964D8((uint64_t)v12, *a3);
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
      sub_2496964D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_249692774(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2496BB140();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24969292C(a5, a6);
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
  v8 = sub_2496BB224();
  if (!v8)
  {
    sub_2496BB248();
    __break(1u);
LABEL_17:
    result = sub_2496BB290();
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

uint64_t sub_24969292C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2496929C0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_249692B98(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_249692B98(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2496929C0(uint64_t a1, unint64_t a2)
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
      v3 = sub_249692B34(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2496BB1F4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2496BB248();
      __break(1u);
LABEL_10:
      v2 = sub_2496BAF54();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2496BB290();
    __break(1u);
LABEL_14:
    result = sub_2496BB248();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_249692B34(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFFC0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_249692B98(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFFC0);
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
  result = sub_2496BB290();
  __break(1u);
  return result;
}

_BYTE **sub_249692CE4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_249692CF4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_2496BB290();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_249692D88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  v6 = sub_2496B6AE0(a1);
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
      sub_2496945C8();
      v9 = v17;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_2496BAA8C();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    v12 = *(_QWORD *)(v9 + 56);
    v13 = sub_2496BAAD4();
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a2, v12 + *(_QWORD *)(v14 + 72) * v6, v13);
    sub_249693278(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
  }
  else
  {
    v16 = sub_2496BAAD4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

uint64_t sub_249692EC4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_2496B6A48(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_249694DB4();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = sub_2496BACF0();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_24969354C(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_249692F9C(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;

  v32 = type metadata accessor for ConnectionID();
  v4 = *(_QWORD *)(v32 - 8);
  result = MEMORY[0x24BDAC7A8](v32);
  v30 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a2 + 64;
  v8 = -1 << *(_BYTE *)(a2 + 32);
  v9 = (a1 + 1) & ~v8;
  if (((1 << v9) & *(_QWORD *)(a2 + 64 + 8 * (v9 >> 6))) != 0)
  {
    v10 = ~v8;
    result = sub_2496BB17C();
    if ((*(_QWORD *)(v7 + 8 * (v9 >> 6)) & (1 << v9)) != 0)
    {
      v29 = (result + 1) & v10;
      v11 = *(_QWORD *)(v4 + 72);
      v31 = v10;
      v12 = (uint64_t)v30;
      do
      {
        v13 = v11;
        v14 = v11 * v9;
        sub_24968BA44(*(_QWORD *)(a2 + 48) + v11 * v9, v12, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        sub_2496BB3B0();
        sub_2496BB3BC();
        sub_2496BAB10();
        sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
        sub_2496BAEB8();
        v15 = sub_2496BB3C8();
        result = sub_24968BA88(v12, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        v16 = v31;
        v17 = v15 & v31;
        if (a1 >= (uint64_t)v29)
        {
          if (v17 < v29)
          {
            v11 = v13;
          }
          else
          {
            v11 = v13;
            if (a1 >= (uint64_t)v17)
              goto LABEL_12;
          }
        }
        else
        {
          v11 = v13;
          if (v17 >= v29 || a1 >= (uint64_t)v17)
          {
LABEL_12:
            v18 = *(_QWORD *)(a2 + 48);
            result = v18 + v11 * a1;
            if (v11 * a1 < v14 || result >= v18 + v14 + v11)
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_17:
              v16 = v31;
            }
            else if (v11 * a1 != v14)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_17;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_QWORD *)(v19 + 8 * a1);
            v21 = (_QWORD *)(v19 + 8 * v9);
            if (a1 != v9 || (a1 = v9, v20 >= v21 + 1))
            {
              *v20 = *v21;
              a1 = v9;
            }
          }
        }
        v9 = (v9 + 1) & v16;
      }
      while (((*(_QWORD *)(v7 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
    }
    v22 = (uint64_t *)(v7 + 8 * ((unint64_t)a1 >> 6));
    v23 = *v22;
    v24 = (-1 << a1) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v7 + 8 * ((unint64_t)a1 >> 6));
    v24 = *v22;
    v23 = (-1 << a1) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_249693278(int64_t a1, uint64_t a2)
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

  v4 = sub_2496BAA8C();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_2496BB17C();
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
        sub_24968BDD4(&qword_2544AFCC0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20], MEMORY[0x24BEBBA30]);
        v18 = sub_2496BAEAC();
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
            v23 = *(_QWORD *)(*(_QWORD *)(sub_2496BAAD4() - 8) + 72);
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

unint64_t sub_24969354C(int64_t a1, uint64_t a2)
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
  _QWORD *v24;
  _QWORD *v25;
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

  v4 = sub_2496BACF0();
  v35 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_2496BB17C();
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
        sub_24968BDD4(&qword_2544AFD78, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBCE0], MEMORY[0x24BEBBCF0]);
        v18 = sub_2496BAEAC();
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
            v24 = (_QWORD *)(v23 + 8 * a1);
            v25 = (_QWORD *)(v23 + 8 * v10);
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

uint64_t sub_2496937EC(uint64_t a1, _QWORD *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t v23;

  v4 = (_QWORD **)v3;
  type metadata accessor for ConnectionID();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_QWORD *)*v3;
  v12 = sub_2496B69A8(a2);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_14;
  }
  v16 = v11;
  v17 = v10[3];
  if (v17 >= v15 && (a3 & 1) != 0)
  {
LABEL_7:
    v18 = *v4;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a3 & 1) == 0)
  {
    sub_249694160();
    goto LABEL_7;
  }
  sub_2496AFD1C(v15, a3 & 1);
  v21 = sub_2496B69A8(a2);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    result = sub_2496BB398();
    __break(1u);
    return result;
  }
  v12 = v21;
  v18 = *v4;
  if ((v16 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  sub_24968BA44((uint64_t)a2, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
  return sub_249693EE0(v12, (uint64_t)v9, a1, v18);
}

uint64_t sub_249693948(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = sub_2496BAB10();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_2496B6910(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
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
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_249694398();
    goto LABEL_7;
  }
  sub_2496B00D4(v17, a3 & 1);
  v23 = sub_2496B6910(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = sub_2496BB398();
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_249693F78(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_249693AA4(uint64_t a1, uint64_t a2, char a3)
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
  v8 = sub_2496BAA8C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_2496B6AE0(a2);
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
        v22 = sub_2496BAAD4();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_2496945C8();
      goto LABEL_7;
    }
    sub_2496B0468(v17, a3 & 1);
    v24 = sub_2496B6AE0(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_249694010(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_2496BB398();
  __break(1u);
  return result;
}

uint64_t sub_249693C2C(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = sub_2496BACF0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_2496B6A48(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
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
      result = swift_release();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_249694DB4();
    goto LABEL_7;
  }
  sub_2496B1180(v17, a3 & 1);
  v23 = sub_2496B6A48(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = sub_2496BB398();
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_2496940C8(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_249693D88(char a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_2496B6B78(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_249694FE4();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v18[7] + v12) = a1 & 1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_BYTE *)(v18[7] + v12) = a1 & 1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_2496B1514(result, a4 & 1);
  result = sub_2496B6B78(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2496BB398();
  __break(1u);
  return result;
}

uint64_t sub_249693EE0(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for ConnectionID();
  result = sub_24968BC5C(a2, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_249693F78(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_2496BAB10();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_249694010(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
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
  v9 = sub_2496BAA8C();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = sub_2496BAAD4();
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

uint64_t sub_2496940C8(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_2496BACF0();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

void *sub_249694160()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v26 = *(_QWORD *)(type metadata accessor for ConnectionID() - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF70);
  v4 = *v0;
  v5 = sub_2496BB26C();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v6;
    return result;
  }
  v24 = v1;
  result = (void *)(v5 + 64);
  v8 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  if (v6 != v4 || (unint64_t)result >= v4 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v4 + 64), 8 * v8);
  v25 = v4 + 64;
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v4 + 16);
  v11 = 1 << *(_BYTE *)(v4 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v4 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v14)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v10;
    if (!v21)
    {
      v10 = v20 + 1;
      if (v20 + 1 >= v14)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v10);
      if (!v21)
        break;
    }
LABEL_25:
    v13 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v26 + 72) * v16;
    sub_24968BA44(*(_QWORD *)(v4 + 48) + v17, (uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v16);
    sub_24968BC5C((uint64_t)v3, *(_QWORD *)(v6 + 48) + v17, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    *(_QWORD *)(*(_QWORD *)(v6 + 56) + v18) = v19;
    result = (void *)swift_retain();
  }
  v22 = v20 + 2;
  if (v22 >= v14)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v24;
    goto LABEL_28;
  }
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v10 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v10);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_249694398()
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
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_2496BAB10();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF58);
  v24 = v0;
  v5 = *v0;
  v6 = sub_2496BB26C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_2496945C8()
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

  v41 = sub_2496BAAD4();
  v37 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_2496BAA8C();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578767B0);
  v33 = v0;
  v3 = *v0;
  v4 = sub_2496BB26C();
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

void *sub_2496948A8()
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
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876790);
  v2 = *v0;
  v3 = sub_2496BB26C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_249694A54()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876788);
  v2 = *v0;
  v3 = sub_2496BB26C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
      goto LABEL_28;
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
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

id sub_249694C04()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876780);
  v2 = *v0;
  v3 = sub_2496BB26C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
      goto LABEL_28;
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
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void *sub_249694DB4()
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
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_2496BACF0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFF60);
  v24 = v0;
  v5 = *v0;
  v6 = sub_2496BB26C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_retain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_249694FE4()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257876798);
  v2 = *v0;
  v3 = sub_2496BB26C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24969518C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v5 = type metadata accessor for ConnectionID();
  v23 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t *)((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = v2;
  v8 = *v2;
  sub_2496BB3B0();
  sub_2496BB3BC();
  v24 = v5;
  sub_2496BAB10();
  sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
  swift_bridgeObjectRetain();
  sub_2496BAEB8();
  v9 = sub_2496BB3C8();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  v11 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
  {
    v22 = a2;
    v12 = ~v10;
    v13 = *(_QWORD *)(v23 + 72);
    while (1)
    {
      sub_24968BA44(*(_QWORD *)(v8 + 48) + v13 * v11, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      if (*v7 == *a1 && (sub_2496BAAF8() & 1) != 0)
        break;
      sub_24968BA88((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      v11 = (v11 + 1) & v12;
      if (((*(_QWORD *)(v8 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        a2 = v22;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(a2, 1, 1, v24);
      }
    }
    sub_24968BA88((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    swift_bridgeObjectRelease();
    v14 = v21;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v16 = *v14;
    v25 = *v14;
    *v14 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_2496B8E54();
      v16 = v25;
    }
    v17 = *(_QWORD *)(v16 + 48) + v13 * v11;
    v18 = v22;
    sub_24968BC5C(v17, v22, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    sub_249695400(v11);
    *v14 = v25;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(v18, 0, 1, v24);
  }
  else
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(a2, 1, 1, v24);
  }
}

uint64_t sub_249695400(int64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;

  v27 = type metadata accessor for ConnectionID();
  v3 = *(_QWORD *)(v27 - 8);
  result = MEMORY[0x24BDAC7A8](v27);
  v25 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  v7 = *v1 + 56;
  v8 = -1 << *(_BYTE *)(*v1 + 32);
  v9 = (a1 + 1) & ~v8;
  if (((1 << v9) & *(_QWORD *)(v7 + 8 * (v9 >> 6))) != 0)
  {
    v23 = v1;
    v10 = ~v8;
    swift_retain();
    v11 = sub_2496BB17C();
    v26 = v7;
    if ((*(_QWORD *)(v7 + 8 * (v9 >> 6)) & (1 << v9)) != 0)
    {
      v12 = (v11 + 1) & v10;
      v13 = *(_QWORD *)(v3 + 72);
      v24 = v13;
      v14 = (uint64_t)v25;
      do
      {
        v15 = v13 * v9;
        sub_24968BA44(*(_QWORD *)(v6 + 48) + v13 * v9, v14, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        sub_2496BB3B0();
        sub_2496BB3BC();
        sub_2496BAB10();
        sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
        sub_2496BAEB8();
        v16 = sub_2496BB3C8();
        sub_24968BA88(v14, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        v17 = v16 & v10;
        if (a1 >= (uint64_t)v12)
        {
          if (v17 < v12)
          {
            v13 = v24;
            goto LABEL_6;
          }
          v13 = v24;
          if (a1 < (uint64_t)v17)
            goto LABEL_6;
        }
        else
        {
          v13 = v24;
          if (v17 < v12 && a1 < (uint64_t)v17)
            goto LABEL_6;
        }
        v18 = v13 * a1;
        if (v13 * a1 < v15 || *(_QWORD *)(v6 + 48) + v13 * a1 >= (unint64_t)(*(_QWORD *)(v6 + 48) + v15 + v13))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v9;
          if (v18 == v15)
            goto LABEL_6;
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v9;
LABEL_6:
        v9 = (v9 + 1) & v10;
      }
      while (((*(_QWORD *)(v26 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
    }
    *(_QWORD *)(v26 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    result = swift_release();
    v1 = v23;
  }
  else
  {
    *(_QWORD *)(v7 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  v19 = *v1;
  v20 = *(_QWORD *)(*v1 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v19 + 16) = v22;
    ++*(_DWORD *)(v19 + 36);
  }
  return result;
}

uint64_t sub_2496956D4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v2 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1769105779 && a2 == 0xE400000000000000 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002496BFBE0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2496BB380();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t _s26UIIntelligenceSupportAgent012IntelligencebC0C21fetchElementHierarchy3for10parameters17completionHandleryAC6ClientO_AC17RequestParametersVyAC0fG0VctFZ_0(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v23 = a3;
  v7 = sub_2496BAE40();
  v26 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2496BAE70();
  v24 = *(_QWORD *)(v10 - 8);
  v25 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v13);
  v16 = *a1;
  if (qword_2544AF6D8 != -1)
    swift_once();
  v22 = qword_2544AFD98;
  sub_24968BA44(a2, (uint64_t)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceSupportAgent.RequestParameters);
  v17 = (*(unsigned __int8 *)(v14 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v18 = swift_allocObject();
  *(_BYTE *)(v18 + 16) = v16;
  sub_24968BC5C((uint64_t)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceSupportAgent.RequestParameters);
  v19 = (_QWORD *)(v18 + ((v15 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v19 = v23;
  v19[1] = a4;
  aBlock[4] = sub_2496963F8;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24968D580;
  aBlock[3] = &block_descriptor_0;
  v20 = _Block_copy(aBlock);
  swift_retain();
  sub_2496BAE58();
  v27 = MEMORY[0x24BEE4AF8];
  sub_24968BDD4((unint64_t *)&qword_2544AFEA8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEB0);
  sub_249696E5C((unint64_t *)&qword_2544AFEB8, &qword_2544AFEB0);
  sub_2496BB170();
  MEMORY[0x24BCF574C](0, v12, v9, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v25);
  return swift_release();
}

uint64_t sub_249695ABC(uint64_t a1)
{
  uint64_t v1;

  return sub_24968D6A8(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

unint64_t sub_249695AD0()
{
  unint64_t result;

  result = qword_257876720;
  if (!qword_257876720)
  {
    result = MEMORY[0x24BCF5F5C](&protocol conformance descriptor for IntelligenceSupportAgent.Client, &type metadata for IntelligenceSupportAgent.Client);
    atomic_store(result, (unint64_t *)&qword_257876720);
  }
  return result;
}

uint64_t type metadata accessor for IntelligenceSupportAgent()
{
  return objc_opt_self();
}

uint64_t method lookup function for IntelligenceSupportAgent()
{
  return swift_lookUpClassMethod();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceSupportAgent.Client()
{
  return &type metadata for IntelligenceSupportAgent.Client;
}

uint64_t sub_249695B68()
{
  return type metadata accessor for IntelligenceSupportAgent.ActiveRequest();
}

uint64_t type metadata accessor for IntelligenceSupportAgent.ActiveRequest()
{
  uint64_t result;

  result = qword_2544AFDC0;
  if (!qword_2544AFDC0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_249695BAC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  if (v1 <= 0x3F)
  {
    result = sub_2496BAC9C();
    if (v2 <= 0x3F)
      return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t destroy for IntelligenceSupportAgent.State()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t _s26UIIntelligenceSupportAgent24IntelligenceSupportAgentC5StateVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for IntelligenceSupportAgent.State(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for IntelligenceSupportAgent.State(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceSupportAgent.State(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IntelligenceSupportAgent.State(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IntelligenceSupportAgent.State()
{
  return &type metadata for IntelligenceSupportAgent.State;
}

uint64_t _s26UIIntelligenceSupportAgent24IntelligenceSupportAgentC6ClientOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s26UIIntelligenceSupportAgent24IntelligenceSupportAgentC6ClientOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249695F2C + 4 * byte_2496BBD55[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_249695F60 + 4 * byte_2496BBD50[v4]))();
}

uint64_t sub_249695F60(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249695F68(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249695F70);
  return result;
}

uint64_t sub_249695F7C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249695F84);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_249695F88(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249695F90(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249695F9C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_249695FA4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceSupportAgent.Client.CodingKeys()
{
  return &type metadata for IntelligenceSupportAgent.Client.CodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceSupportAgent.Client.UnknownCodingKeys()
{
  return &type metadata for IntelligenceSupportAgent.Client.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceSupportAgent.Client.SiriCodingKeys()
{
  return &type metadata for IntelligenceSupportAgent.Client.SiriCodingKeys;
}

ValueMetadata *type metadata accessor for IntelligenceSupportAgent.Client.CommandLineDebugCodingKeys()
{
  return &type metadata for IntelligenceSupportAgent.Client.CommandLineDebugCodingKeys;
}

unint64_t sub_249695FF0()
{
  unint64_t result;

  result = qword_257876728;
  if (!qword_257876728)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC13C, &type metadata for IntelligenceSupportAgent.Client.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257876728);
  }
  return result;
}

unint64_t sub_249696038()
{
  unint64_t result;

  result = qword_257876730;
  if (!qword_257876730)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC05C, &type metadata for IntelligenceSupportAgent.Client.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257876730);
  }
  return result;
}

unint64_t sub_249696080()
{
  unint64_t result;

  result = qword_257876738;
  if (!qword_257876738)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC084, &type metadata for IntelligenceSupportAgent.Client.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257876738);
  }
  return result;
}

unint64_t sub_2496960C8()
{
  unint64_t result;

  result = qword_257876740;
  if (!qword_257876740)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC00C, &type metadata for IntelligenceSupportAgent.Client.SiriCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257876740);
  }
  return result;
}

unint64_t sub_249696110()
{
  unint64_t result;

  result = qword_257876748;
  if (!qword_257876748)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC034, &type metadata for IntelligenceSupportAgent.Client.SiriCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257876748);
  }
  return result;
}

unint64_t sub_249696158()
{
  unint64_t result;

  result = qword_257876750;
  if (!qword_257876750)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BBFBC, &type metadata for IntelligenceSupportAgent.Client.CommandLineDebugCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257876750);
  }
  return result;
}

unint64_t sub_2496961A0()
{
  unint64_t result;

  result = qword_257876758;
  if (!qword_257876758)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BBFE4, &type metadata for IntelligenceSupportAgent.Client.CommandLineDebugCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257876758);
  }
  return result;
}

unint64_t sub_2496961E8()
{
  unint64_t result;

  result = qword_257876760;
  if (!qword_257876760)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC0AC, &type metadata for IntelligenceSupportAgent.Client.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257876760);
  }
  return result;
}

unint64_t sub_249696230()
{
  unint64_t result;

  result = qword_257876768;
  if (!qword_257876768)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC0D4, &type metadata for IntelligenceSupportAgent.Client.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257876768);
  }
  return result;
}

uint64_t sub_249696274()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFEF0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2496962D8()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFEF0);
  return sub_24968D798();
}

uint64_t sub_249696318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 17) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 68);
  v5 = sub_2496BAB28();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v3 + *(int *)(v1 + 76);
  v7 = sub_2496BABDC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2496963F8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t *v3;

  v1 = *(_QWORD *)(type metadata accessor for IntelligenceSupportAgent.RequestParameters() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (uint64_t *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_24968CEA8(*(_BYTE *)(v0 + 16), v0 + v2, *v3, v3[1]);
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BCF5F50](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24969649C(uint64_t a1)
{
  uint64_t v1;

  return sub_24968EDAC(a1, *(_QWORD **)(v1 + 16)) & 1;
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

uint64_t sub_2496964D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_249696518(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  double Current;
  double v31;
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  _QWORD *v55;
  void *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  __int128 *p_aBlock;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 aBlock;
  __int128 v77;
  uint64_t (*v78)();
  _QWORD *v79;
  uint64_t v80;

  v4 = sub_2496BAE40();
  v71 = *(_QWORD *)(v4 - 8);
  v72 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v70 = (char *)&p_aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2496BAE70();
  v68 = *(_QWORD *)(v6 - 8);
  v69 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v67 = (char *)&p_aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_2496BAE4C();
  v66 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v9 = (char *)&p_aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2496BACF0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&p_aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&p_aBlock - v15;
  v17 = sub_2496BADB0();
  v73 = *(_QWORD *)(v17 - 8);
  v74 = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&p_aBlock - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&p_aBlock - v21;
  v23 = *a1;
  if (*(_QWORD *)(*a1 + 16) && (v24 = sub_2496B6A48(a2), (v25 & 1) != 0))
  {
    v26 = *(_QWORD *)(*(_QWORD *)(v23 + 56) + 8 * v24);
    v27 = *(_QWORD *)(v26 + 48);
    v28 = (_QWORD *)(v26
                   + OBJC_IVAR____TtCC26UIIntelligenceSupportAgent24IntelligenceSupportAgentP33_F6EEC212C1562732DDB5A4B69A480AD213ActiveRequest_request);
    aBlock = *(_OWORD *)(v26
                       + OBJC_IVAR____TtCC26UIIntelligenceSupportAgent24IntelligenceSupportAgentP33_F6EEC212C1562732DDB5A4B69A480AD213ActiveRequest_parameters
                       + 40);
    v77 = *(_OWORD *)(v26
                    + OBJC_IVAR____TtCC26UIIntelligenceSupportAgent24IntelligenceSupportAgentP33_F6EEC212C1562732DDB5A4B69A480AD213ActiveRequest_parameters
                    + 56);
    swift_retain();
    v29 = sub_2496AB2E8(v28, (uint64_t *)&aBlock);
    swift_beginAccess();
    v63 = *(_QWORD *)(v27 + 48);
    swift_bridgeObjectRetain();
    sub_24968E314();
    sub_249692EC4(a2);
    swift_release();
    Current = CFAbsoluteTimeGetCurrent();
    v31 = *(double *)(v26 + 16);
    sub_2496BAD98();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, a2, v10);
    v32 = sub_2496BADA4();
    v33 = sub_2496BB008();
    v34 = v33;
    if (os_log_type_enabled(v32, v33))
    {
      v35 = swift_slowAlloc();
      v64 = v10;
      v36 = v35;
      v62 = swift_slowAlloc();
      *(_QWORD *)&aBlock = v62;
      *(_DWORD *)v36 = 136446466;
      v61 = v34;
      v37 = sub_2496BACCC();
      v75 = sub_2496926A4(v37, v38, (uint64_t *)&aBlock);
      p_aBlock = &aBlock;
      sub_2496BB134();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v64);
      *(_WORD *)(v36 + 12) = 2082;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFFD0);
      v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_2496BBD40;
      v40 = MEMORY[0x24BEE1448];
      *(_QWORD *)(v39 + 56) = MEMORY[0x24BEE13C8];
      *(_QWORD *)(v39 + 64) = v40;
      *(double *)(v39 + 32) = (Current - v31) * 1000.0;
      v41 = sub_2496BAF0C();
      v75 = sub_2496926A4(v41, v42, (uint64_t *)&aBlock);
      sub_2496BB134();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_249686000, v32, (os_log_type_t)v61, "completed %{public}s in %{public}sms", (uint8_t *)v36, 0x16u);
      v43 = v62;
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v43, -1, -1);
      MEMORY[0x24BCF5FEC](v36, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    }

    (*(void (**)(char *, uint64_t))(v73 + 8))(v22, v74);
    sub_249696E24(0, (unint64_t *)&qword_2544AFF18);
    v52 = v66;
    v53 = v65;
    (*(void (**)(char *, _QWORD, uint64_t))(v66 + 104))(v9, *MEMORY[0x24BEE5480], v65);
    v54 = (void *)sub_2496BB080();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v9, v53);
    v55 = (_QWORD *)swift_allocObject();
    v55[2] = v26;
    v55[3] = v29;
    v55[4] = v63;
    v78 = sub_249696D88;
    v79 = v55;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v77 = sub_24968D580;
    *((_QWORD *)&v77 + 1) = &block_descriptor_19;
    v56 = _Block_copy(&aBlock);
    swift_retain();
    v57 = v67;
    sub_2496BAE58();
    v75 = MEMORY[0x24BEE4AF8];
    sub_24968BDD4((unint64_t *)&qword_2544AFEA8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEB0);
    sub_249696E5C((unint64_t *)&qword_2544AFEB8, &qword_2544AFEB0);
    v58 = v70;
    v59 = v72;
    sub_2496BB170();
    MEMORY[0x24BCF574C](0, v57, v58, v56);
    _Block_release(v56);
    swift_release();

    (*(void (**)(char *, uint64_t))(v71 + 8))(v58, v59);
    (*(void (**)(char *, uint64_t))(v68 + 8))(v57, v69);
    return swift_release();
  }
  else
  {
    sub_2496BAD98();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a2, v10);
    v44 = sub_2496BADA4();
    v45 = sub_2496BB014();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      v47 = swift_slowAlloc();
      v64 = v10;
      v48 = v47;
      *(_QWORD *)&aBlock = v47;
      *(_DWORD *)v46 = 136446210;
      v49 = sub_2496BACCC();
      v80 = sub_2496926A4(v49, v50, (uint64_t *)&aBlock);
      sub_2496BB134();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v64);
      _os_log_impl(&dword_249686000, v44, v45, "invalid request to complete %{public}s", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v48, -1, -1);
      MEMORY[0x24BCF5FEC](v46, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v20, v74);
  }
}

uint64_t sub_249696C8C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_249696CB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2496BACF0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_249696D24()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_2496BACF0() - 8) + 80);
  return sub_24968FC04(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_249696D54()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_249696D88()
{
  uint64_t v0;
  uint64_t (*v1)(__int128 *);
  __int128 v3;

  v1 = *(uint64_t (**)(__int128 *))(*(_QWORD *)(v0 + 16)
                                            + OBJC_IVAR____TtCC26UIIntelligenceSupportAgent24IntelligenceSupportAgentP33_F6EEC212C1562732DDB5A4B69A480AD213ActiveRequest_completionHandler);
  v3 = *(_OWORD *)(v0 + 24);
  return v1(&v3);
}

unint64_t sub_249696DD0()
{
  unint64_t result;

  result = qword_257876778;
  if (!qword_257876778)
  {
    result = MEMORY[0x24BCF5F5C](MEMORY[0x24BEE45A8], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_257876778);
  }
  return result;
}

uint64_t sub_249696E14(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_249696E24(uint64_t a1, unint64_t *a2)
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

uint64_t sub_249696E5C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BCF5F5C](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_249696E9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_249690A30(a1, a2, *(_QWORD *)(v3 + 16), a3);
}

uint64_t sub_249696EA4(uint64_t a1, void (*a2)(char *, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t i;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  char *v28;
  uint64_t (*v29)(unint64_t, char *, uint64_t);
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;

  v44 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD50);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2496BAC9C();
  v45 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v39 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v38 = (char *)&v36 - v9;
  v43 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFD58);
  MEMORY[0x24BDAC7A8](v43);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a1 + 64);
  v41 = a1 + 64;
  v13 = 1 << *(_BYTE *)(a1 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v42 = (unint64_t)(v13 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v17 = 0;
  v40 = MEMORY[0x24BEE4AF8];
  if (!v15)
    goto LABEL_7;
LABEL_4:
  v18 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  for (i = v18 | (v17 << 6); ; i = __clz(__rbit64(v24)) + (v17 << 6))
  {
    v20 = *(_QWORD *)(a1 + 48);
    v21 = sub_2496BACF0();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v11, v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * i, v21);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * i);
    *(_QWORD *)&v11[*(int *)(v43 + 48)] = v22;
    swift_retain();
    v44(v11, v22);
    sub_249697880((uint64_t)v11, (uint64_t *)&unk_2544AFD58);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v5, 1, v6) == 1)
    {
      result = sub_249697880((uint64_t)v5, &qword_2544AFD50);
      if (v15)
        goto LABEL_4;
    }
    else
    {
      v26 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
      v27 = v38;
      v26(v38, v5, v6);
      v28 = v27;
      v29 = (uint64_t (*)(unint64_t, char *, uint64_t))v26;
      v26(v39, v28, v6);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v40 = sub_2496A2A08(0, *(_QWORD *)(v40 + 16) + 1, 1, v40);
      v31 = *(_QWORD *)(v40 + 16);
      v30 = *(_QWORD *)(v40 + 24);
      v32 = v31 + 1;
      if (v31 >= v30 >> 1)
      {
        v37 = v31 + 1;
        v35 = sub_2496A2A08(v30 > 1, v31 + 1, 1, v40);
        v32 = v37;
        v40 = v35;
      }
      v33 = v39;
      v34 = v40;
      *(_QWORD *)(v40 + 16) = v32;
      result = v29(v34+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(_QWORD *)(v45 + 72) * v31, v33, v6);
      if (v15)
        goto LABEL_4;
    }
LABEL_7:
    v23 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v23 >= v42)
      goto LABEL_29;
    v24 = *(_QWORD *)(v41 + 8 * v23);
    ++v17;
    if (!v24)
    {
      v17 = v23 + 1;
      if (v23 + 1 >= v42)
        goto LABEL_29;
      v24 = *(_QWORD *)(v41 + 8 * v17);
      if (!v24)
      {
        v17 = v23 + 2;
        if (v23 + 2 >= v42)
          goto LABEL_29;
        v24 = *(_QWORD *)(v41 + 8 * v17);
        if (!v24)
        {
          v17 = v23 + 3;
          if (v23 + 3 >= v42)
            goto LABEL_29;
          v24 = *(_QWORD *)(v41 + 8 * v17);
          if (!v24)
            break;
        }
      }
    }
LABEL_22:
    v15 = (v24 - 1) & v24;
  }
  v25 = v23 + 4;
  if (v25 >= v42)
  {
LABEL_29:
    swift_release();
    return v40;
  }
  v24 = *(_QWORD *)(v41 + 8 * v25);
  if (v24)
  {
    v17 = v25;
    goto LABEL_22;
  }
  while (1)
  {
    v17 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v17 >= v42)
      goto LABEL_29;
    v24 = *(_QWORD *)(v41 + 8 * v17);
    ++v25;
    if (v24)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_249697288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_2496910A8(a1, a2, *(_QWORD **)(v3 + 16), a3);
}

uint64_t sub_249697290(uint64_t a1, void (*a2)(char *, uint64_t))
{
  uint64_t v3;
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
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;

  v43 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD88);
  MEMORY[0x24BDAC7A8](v3);
  v42 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_2496BACF0();
  v5 = *(_QWORD *)(v45 - 8);
  v6 = MEMORY[0x24BDAC7A8](v45);
  v37 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v36 = (char *)&v35 - v8;
  v41 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFD58);
  MEMORY[0x24BDAC7A8](v41);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 64);
  v39 = a1 + 64;
  v12 = 1 << *(_BYTE *)(a1 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v40 = (unint64_t)(v12 + 63) >> 6;
  v44 = a1;
  result = swift_bridgeObjectRetain();
  v16 = 0;
  v38 = MEMORY[0x24BEE4AF8];
  if (!v14)
    goto LABEL_7;
LABEL_4:
  v17 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (i = v17 | (v16 << 6); ; i = __clz(__rbit64(v25)) + (v16 << 6))
  {
    v19 = v44;
    v20 = *(_QWORD *)(v5 + 72);
    v21 = v45;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v10, *(_QWORD *)(v44 + 48) + v20 * i, v45);
    v22 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * i);
    *(_QWORD *)&v10[*(int *)(v41 + 48)] = v22;
    swift_retain();
    v23 = (uint64_t)v42;
    v43(v10, v22);
    sub_249697880((uint64_t)v10, (uint64_t *)&unk_2544AFD58);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v23, 1, v21) == 1)
    {
      result = sub_249697880(v23, &qword_2544AFD88);
      if (v14)
        goto LABEL_4;
    }
    else
    {
      v27 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 32);
      v28 = v36;
      v29 = v23;
      v30 = v45;
      v27(v36, v29, v45);
      v27(v37, (uint64_t)v28, v30);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v38 = sub_2496A2A1C(0, *(_QWORD *)(v38 + 16) + 1, 1, v38);
      v32 = *(_QWORD *)(v38 + 16);
      v31 = *(_QWORD *)(v38 + 24);
      if (v32 >= v31 >> 1)
        v38 = sub_2496A2A1C(v31 > 1, v32 + 1, 1, v38);
      v33 = v37;
      v34 = v38;
      *(_QWORD *)(v38 + 16) = v32 + 1;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v27)(v34+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ v32 * v20, v33, v45);
      if (v14)
        goto LABEL_4;
    }
LABEL_7:
    v24 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v24 >= v40)
      goto LABEL_29;
    v25 = *(_QWORD *)(v39 + 8 * v24);
    ++v16;
    if (!v25)
    {
      v16 = v24 + 1;
      if (v24 + 1 >= v40)
        goto LABEL_29;
      v25 = *(_QWORD *)(v39 + 8 * v16);
      if (!v25)
      {
        v16 = v24 + 2;
        if (v24 + 2 >= v40)
          goto LABEL_29;
        v25 = *(_QWORD *)(v39 + 8 * v16);
        if (!v25)
        {
          v16 = v24 + 3;
          if (v24 + 3 >= v40)
            goto LABEL_29;
          v25 = *(_QWORD *)(v39 + 8 * v16);
          if (!v25)
            break;
        }
      }
    }
LABEL_22:
    v14 = (v25 - 1) & v25;
  }
  v26 = v24 + 4;
  if (v26 >= v40)
  {
LABEL_29:
    swift_release();
    return v38;
  }
  v25 = *(_QWORD *)(v39 + 8 * v26);
  if (v25)
  {
    v16 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    v16 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v16 >= v40)
      goto LABEL_29;
    v25 = *(_QWORD *)(v39 + 8 * v16);
    ++v26;
    if (v25)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_24969765C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFD68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for IntelligenceSupportAgent.ActiveRequest.CompletionActivity(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for IntelligenceSupportAgent.ActiveRequest.CompletionActivity()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for IntelligenceSupportAgent.ActiveRequest.CompletionActivity(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for IntelligenceSupportAgent.ActiveRequest.CompletionActivity(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntelligenceSupportAgent.ActiveRequest.CompletionActivity(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for IntelligenceSupportAgent.ActiveRequest.CompletionActivity(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_2496977F8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_249697810(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceSupportAgent.ActiveRequest.CompletionActivity()
{
  return &type metadata for IntelligenceSupportAgent.ActiveRequest.CompletionActivity;
}

uint64_t sub_249697838(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFCE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_249697880(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2496978C4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_249692550(a1, a2, a3, a4);
}

uint64_t *sub_2496978F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_2496BAB10();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_249697978(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_2496BAB10();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_QWORD *sub_2496979B0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2496BAB10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *sub_249697A0C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2496BAB10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_QWORD *sub_249697A68(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2496BAB10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_249697AC4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2496BAB10();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_249697B20()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_249697B2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = sub_2496BAB10();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t sub_249697B6C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_249697B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = sub_2496BAB10();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t type metadata accessor for ConnectionID()
{
  uint64_t result;

  result = qword_2544AFE68;
  if (!qword_2544AFE68)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_249697BF8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2496BAB10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_249697C70()
{
  _QWORD v1[2];

  sub_2496BB1E8();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "ConnectionID(");
  sub_2496BB368();
  sub_2496BAF48();
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  type metadata accessor for ConnectionID();
  sub_2496BAB10();
  sub_24968BDD4((unint64_t *)&unk_2544AFD10, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAC8]);
  sub_2496BB368();
  sub_2496BAF48();
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  return v1[0];
}

uint64_t sub_249697D8C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578767D0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2496983FC();
  sub_2496BB3E0();
  v8[15] = 0;
  sub_2496BB338();
  if (!v1)
  {
    type metadata accessor for ConnectionID();
    v8[14] = 1;
    sub_2496BAB10();
    sub_24968BDD4(&qword_2578767D8, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAA8]);
    sub_2496BB344();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_249697EE0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  v22 = a2;
  v25 = sub_2496BAB10();
  v23 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v24 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578767B8);
  v5 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ConnectionID();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2496983FC();
  sub_2496BB3D4();
  if (!v2)
  {
    v21 = v8;
    v12 = v24;
    v11 = v25;
    v28 = 0;
    v13 = v26;
    v14 = sub_2496BB2E4();
    v20 = v10;
    *v10 = v14;
    v27 = 1;
    sub_24968BDD4(&qword_2578767C8, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAC0]);
    v15 = v11;
    sub_2496BB2F0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v13);
    v16 = v22;
    v17 = (uint64_t)v20;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))((char *)v20 + *(int *)(v21 + 20), v12, v15);
    sub_249698440(v17, v16);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

BOOL sub_24969810C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_249698124()
{
  _BYTE *v0;

  if (*v0)
    return 0x49737365636F7270;
  else
    return 0x65756C6156776172;
}

uint64_t sub_249698168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2496986C4(a1, a2);
  *a3 = result;
  return result;
}

void sub_24969818C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_249698198()
{
  sub_2496983FC();
  return sub_2496BB3EC();
}

uint64_t sub_2496981C0()
{
  sub_2496983FC();
  return sub_2496BB3F8();
}

uint64_t sub_2496981E8()
{
  sub_2496BB3B0();
  sub_2496BB3BC();
  sub_2496BAB10();
  sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
  sub_2496BAEB8();
  return sub_2496BB3C8();
}

uint64_t sub_249698278()
{
  sub_2496BB3BC();
  sub_2496BAB10();
  sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
  return sub_2496BAEB8();
}

uint64_t sub_2496982F0()
{
  sub_2496BB3B0();
  sub_2496BB3BC();
  sub_2496BAB10();
  sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
  sub_2496BAEB8();
  return sub_2496BB3C8();
}

uint64_t sub_24969837C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_249697EE0(a1, a2);
}

uint64_t sub_249698390(_QWORD *a1)
{
  return sub_249697D8C(a1);
}

uint64_t sub_2496983A8(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2)
    return sub_2496BAAF8();
  else
    return 0;
}

uint64_t sub_2496983D0()
{
  return sub_24968BDD4(&qword_2544AFE60, (uint64_t (*)(uint64_t))type metadata accessor for ConnectionID, (uint64_t)&unk_2496BC328);
}

unint64_t sub_2496983FC()
{
  unint64_t result;

  result = qword_2578767C0;
  if (!qword_2578767C0)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC4CC, &type metadata for ConnectionID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578767C0);
  }
  return result;
}

uint64_t sub_249698440(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConnectionID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for ConnectionID.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ConnectionID.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249698560 + 4 * byte_2496BC2F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_249698594 + 4 * byte_2496BC2F0[v4]))();
}

uint64_t sub_249698594(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24969859C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2496985A4);
  return result;
}

uint64_t sub_2496985B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2496985B8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2496985BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2496985C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2496985D0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ConnectionID.CodingKeys()
{
  return &type metadata for ConnectionID.CodingKeys;
}

unint64_t sub_2496985F0()
{
  unint64_t result;

  result = qword_2578767E0;
  if (!qword_2578767E0)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC4A4, &type metadata for ConnectionID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578767E0);
  }
  return result;
}

unint64_t sub_249698638()
{
  unint64_t result;

  result = qword_2578767E8;
  if (!qword_2578767E8)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC414, &type metadata for ConnectionID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578767E8);
  }
  return result;
}

unint64_t sub_249698680()
{
  unint64_t result;

  result = qword_2578767F0;
  if (!qword_2578767F0)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC43C, &type metadata for ConnectionID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578767F0);
  }
  return result;
}

uint64_t sub_2496986C4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x65756C6156776172 && a2 == 0xE800000000000000;
  if (v2 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x49737365636F7270 && a2 == 0xEB000000006F666ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2496BB380();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2496987CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  char *v13;
  void *v14;
  void *v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[5];
  uint64_t v32;

  v1 = v0;
  v2 = sub_2496BADB0();
  v25 = *(_QWORD *)(v2 - 8);
  v26 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v24 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2496BAE40();
  v29 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2496BAE70();
  v27 = *(_QWORD *)(v7 - 8);
  v28 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2496BAE4C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249696E24(0, (unint64_t *)&qword_2544AFF18);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BEE5490], v10);
  v14 = (void *)sub_2496BB080();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  aBlock[4] = sub_24969A674;
  v32 = v0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24968D580;
  aBlock[3] = &block_descriptor_1;
  v15 = _Block_copy(aBlock);
  swift_retain();
  sub_2496BAE58();
  v30 = MEMORY[0x24BEE4AF8];
  sub_24969A694();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEB0);
  sub_24969BC30((unint64_t *)&qword_2544AFEB8, &qword_2544AFEB0, MEMORY[0x24BEE12C8]);
  sub_2496BB170();
  sub_2496BB038();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v28);
  swift_release();
  sub_2496BB02C();
  if ((sub_2496BAE34() & 1) != 0)
  {
    v16 = v24;
    sub_2496BAD98();
    v17 = sub_2496BADA4();
    v18 = sub_2496BB014();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_249686000, v17, v18, "window visibility fetch timed out", v19, 2u);
      MEMORY[0x24BCF5FEC](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v26);
  }
  v20 = *(_QWORD *)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v20 + 64));
  v21 = *(_QWORD *)(v20 + 48);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 64));
  swift_release();
  return v21;
}

uint64_t sub_249698B38(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 24);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 64));
  sub_249698B9C((uint64_t *)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
  return swift_release();
}

uint64_t sub_249698B9C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t result;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  void (*v17)(_BYTE *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  void (*v22)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v23;
  _DWORD *v24;
  _DWORD *v25;
  os_signpost_id_t v26;
  void (*v27)(_BYTE *, uint64_t);
  _BYTE v28[12];
  int v29;
  void (*v30)(_BYTE *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_2496BAD14();
  v2 = *(_QWORD *)(v34 - 8);
  v3 = MEMORY[0x24BDAC7A8](v34);
  v5 = &v28[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  v7 = &v28[-v6];
  v8 = sub_2496BAD50();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = &v28[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = MEMORY[0x24BDAC7A8](v10);
  v15 = &v28[-v14];
  if ((a1[1] & 1) == 0 && (a1[3] & 1) == 0)
  {
    v16 = a1[2];
    v31 = *a1;
    v32 = v16;
    *a1 = 0;
    *((_BYTE *)a1 + 8) = 1;
    a1[2] = 0;
    *((_BYTE *)a1 + 24) = 1;
    v33 = *(_QWORD *)(a1[4] + 16);
    sub_2496BAD38();
    sub_2496BAD38();
    sub_2496BAD44();
    swift_unknownObjectRetain();
    sub_2496BACFC();
    v17 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
    v17(v12, v8);
    sub_249696DD0();
    sub_24968E5F0();
    sub_249696E14(v18);
    sub_24968E5F0();
    sub_249696E14(v19);
    v20 = sub_2496BAD44();
    v21 = sub_2496BB0D4();
    if ((sub_2496BB110() & 1) != 0)
    {
      v22 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v2 + 16);
      v30 = v17;
      v23 = v34;
      v22(v5, v7, v34);
      v24 = (_DWORD *)swift_slowAlloc();
      v29 = v21;
      v25 = v24;
      *v24 = 134218496;
      v35 = v31;
      sub_2496BB134();
      *((_WORD *)v25 + 6) = 2048;
      v35 = v32;
      sub_2496BB134();
      *((_WORD *)v25 + 11) = 2050;
      v35 = v33;
      sub_2496BB134();
      v26 = sub_2496BAD08();
      _os_signpost_emit_with_name_impl(&dword_249686000, v20, (os_signpost_type_t)v29, v26, "WindowVisibility", "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu count=%{public}ld", (uint8_t *)v25, 0x20u);
      MEMORY[0x24BCF5FEC](v25, -1, -1);

      v27 = *(void (**)(_BYTE *, uint64_t))(v2 + 8);
      v27(v7, v23);
      v30(v15, v8);
      return ((uint64_t (*)(_BYTE *, uint64_t))v27)(v5, v23);
    }
    else
    {

      (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v7, v34);
      return ((uint64_t (*)(_BYTE *, uint64_t))v17)(v15, v8);
    }
  }
  return result;
}

uint64_t sub_249698EBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD aBlock[7];

  v2 = v1;
  v51 = sub_2496BAE40();
  v49 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v48 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2496BAE70();
  v46 = *(_QWORD *)(v5 - 8);
  v47 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v45 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2496BAE4C();
  v43 = *(_QWORD *)(v7 - 8);
  v44 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2496BAE88();
  v41 = *(_QWORD *)(v10 - 8);
  v42 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v40 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578767A8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_WORD *)(v2 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578768D0);
  v23 = swift_allocObject();
  *(_DWORD *)(v23 + 64) = 0;
  *(_QWORD *)(v23 + 16) = 0;
  *(_BYTE *)(v23 + 24) = 1;
  *(_QWORD *)(v23 + 32) = 0;
  v24 = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(v23 + 40) = 1;
  v25 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v23 + 48) = v24;
  *(_QWORD *)(v23 + 56) = v25;
  *(_QWORD *)(v2 + 24) = v23;
  *(_QWORD *)(v2 + 32) = dispatch_group_create();
  v50 = a1;
  sub_24969A754(a1, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    *(_QWORD *)v22 = 0x3FE8000000000000;
    *((_QWORD *)v22 + 1) = 0;
    *((_QWORD *)v22 + 2) = v25;
    *((_QWORD *)v22 + 3) = v25;
    v22[32] = sub_2496BAB94() & 1;
    v22[33] = sub_2496BABAC() & 1;
    *(_OWORD *)(v22 + 40) = xmmword_2496BC530;
    *(_OWORD *)(v22 + 56) = xmmword_2496BC540;
    v22[72] = sub_2496BAB70() & 1;
    v22[73] = sub_2496BABA0() & 1;
    v22[74] = sub_2496BABB8() & 1;
    v22[75] = sub_2496BAB88() & 1;
    v22[76] = sub_2496BAB7C() & 1;
    v22[77] = sub_2496BABC4() & 1;
    sub_2496BAB40();
    v26 = sub_2496BAB64() & 1;
    v27 = sub_2496BAB58();
    v28 = v26 | 2;
    if ((v27 & 1) == 0)
      v28 = v26;
    *(_QWORD *)&v22[*(int *)(v19 + 72)] = v28;
    sub_2496BAB4C();
    sub_24969A79C((uint64_t)v18);
  }
  else
  {
    sub_24969A820((uint64_t)v18, (uint64_t)v22);
  }
  v29 = *(double *)v22 * 0.7;
  sub_2496BAE7C();
  MEMORY[0x24BCF5578](v13, v29);
  v31 = v41;
  v30 = v42;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v42);
  (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(v2 + OBJC_IVAR____TtC26UIIntelligenceSupportAgent32EmbeddedWindowVisibilityProvider_deadline, v15, v30);
  sub_249696E24(0, (unint64_t *)&qword_2544AFF18);
  v33 = v43;
  v32 = v44;
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v9, *MEMORY[0x24BEE5480], v44);
  v34 = (void *)sub_2496BB080();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v32);
  aBlock[4] = sub_24969A7DC;
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24968D580;
  aBlock[3] = &block_descriptor_3;
  v35 = _Block_copy(aBlock);
  swift_retain();
  v36 = v45;
  sub_2496BAE58();
  v52 = MEMORY[0x24BEE4AF8];
  sub_24969A694();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEB0);
  sub_24969BC30((unint64_t *)&qword_2544AFEB8, &qword_2544AFEB0, MEMORY[0x24BEE12C8]);
  v37 = v48;
  v38 = v51;
  sub_2496BB170();
  MEMORY[0x24BCF574C](0, v36, v37, v35);
  _Block_release(v35);

  sub_24969A79C(v50);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v37, v38);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v36, v47);
  sub_24969A7E4((uint64_t)v22);
  swift_release();
  return v2;
}

void sub_2496993B8()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_configurationForDefaultMainDisplayMonitor);
  sub_249699B24(v0);

}

void sub_249699408(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t *v14;
  id v15;

  v4 = sub_2496BADB0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = objc_allocWithZone(MEMORY[0x24BDD1620]);
  sub_24969BD2C(a1, a2);
  v10 = sub_24969BC70();
  sub_24969BD70(a1, a2);
  sub_249696E24(0, (unint64_t *)&qword_2578768F8);
  sub_2496BAF00();
  v15 = v10;
  v11 = (void *)sub_2496BB0EC();

  swift_bridgeObjectRelease();
  if (v11)
  {
    if ((objc_msgSend(v11, sel_isMainDisplay) & 1) == 0)
      sub_24969983C(v11);

  }
  else
  {
    sub_2496BAD98();
    v12 = sub_2496BADA4();
    v13 = sub_2496BB014();
    if (os_log_type_enabled(v12, (os_log_type_t)v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_249686000, v12, (os_log_type_t)v13, "unable to decode FBSDisplayIdentity", v14, 2u);
      MEMORY[0x24BCF5FEC](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

uint64_t sub_24969983C(void *a1)
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  os_unfair_lock_s *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[7];

  v2 = v1;
  v4 = sub_2496BAE40();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2496BAE70();
  v29 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2496BAE4C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (uint64_t)objc_msgSend(a1, sel_isMainDisplay);
  if ((result & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v25 = v8;
    v26 = v7;
    v27 = v5;
    v28 = v4;
    v16 = *(os_unfair_lock_s **)(v2 + 24);
    swift_retain();
    os_unfair_lock_lock(v16 + 16);
    sub_249699CB8(a1, aBlock);
    os_unfair_lock_unlock(v16 + 16);
    v17 = LOBYTE(aBlock[0]);
    result = swift_release();
    if (v17 == 1)
    {
      sub_249696E24(0, (unint64_t *)&qword_2544AFF18);
      (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BEE5480], v11);
      v18 = (void *)sub_2496BB080();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      v19 = swift_allocObject();
      *(_QWORD *)(v19 + 16) = a1;
      *(_QWORD *)(v19 + 24) = v2;
      aBlock[4] = sub_24969BDE0;
      aBlock[5] = v19;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_24968D580;
      aBlock[3] = &block_descriptor_15;
      v20 = _Block_copy(aBlock);
      v21 = a1;
      swift_retain();
      sub_2496BAE58();
      v30 = MEMORY[0x24BEE4AF8];
      sub_24969A694();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEB0);
      sub_24969BC30((unint64_t *)&qword_2544AFEB8, &qword_2544AFEB0, MEMORY[0x24BEE12C8]);
      v22 = v26;
      v23 = v28;
      sub_2496BB170();
      MEMORY[0x24BCF574C](0, v10, v22, v20);
      _Block_release(v20);

      (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v23);
      (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v25);
      return swift_release();
    }
  }
  return result;
}

void sub_249699B24(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[6];

  dispatch_group_enter(*(dispatch_group_t *)(v1 + 32));
  v3 = *(_QWORD *)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 64));
  if (*(_BYTE *)(v3 + 24) == 1)
  {
    *(_QWORD *)(v3 + 16) = mach_continuous_time();
    *(_BYTE *)(v3 + 24) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 64));
  swift_release();
  objc_msgSend(a1, sel_setNeedsUserInteractivePriority_, 1);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v1;
  v9[4] = sub_24969A8B4;
  v9[5] = v5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_24969A2BC;
  v9[3] = &block_descriptor_9;
  v6 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setTransitionHandler_, v6);
  _Block_release(v6);
  v7 = objc_msgSend((id)objc_opt_self(), sel_monitorWithConfiguration_, a1);
  swift_beginAccess();
  v8 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v7;
  swift_release();

}

void sub_249699CB8(void *a1@<X1>, _BYTE *a2@<X8>)
{
  char v3;
  id v4;

  v3 = sub_2496B73BC(&v4, a1);

  *a2 = v3 & 1;
}

void sub_249699D0C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  _DWORD *v11;
  NSObject *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  NSObject *v18;

  v2 = sub_2496BADB0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (id)SBSCreateLayoutServiceEndpointForExternalDisplay();
  if (v6)
  {
    v7 = v6;
    v17 = objc_msgSend((id)objc_opt_self(), sel_configurationWithEndpoint_, v6);
    sub_249699B24(v17);

  }
  else
  {
    sub_2496BAD98();
    v8 = a1;
    v9 = sub_2496BADA4();
    v10 = sub_2496BB014();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (_DWORD *)swift_slowAlloc();
      v16 = (_QWORD *)swift_slowAlloc();
      v17 = v11;
      v18 = v8;
      *v11 = 138543362;
      v12 = v8;
      sub_2496BB134();
      v13 = v16;
      *v16 = v8;

      v14 = v17;
      _os_log_impl(&dword_249686000, v9, v10, "unable to create endpoint for FBSDisplayIdentity: %{public}@", (uint8_t *)v17, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257876900);
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v13, -1, -1);
      MEMORY[0x24BCF5FEC](v14, -1, -1);
    }
    else
    {

      v9 = v8;
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_249699F28(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void **v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  os_unfair_lock_s *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;

  if (a2)
  {
    v7 = (void **)(a4 + 16);
    swift_beginAccess();
    v8 = *v7;
    if (*v7)
    {
      v9 = a2;
      v10 = v8;
      objc_msgSend(v10, sel_invalidate);
      swift_beginAccess();
      v11 = *v7;
      *v7 = 0;

      v12 = objc_msgSend(v9, sel_elements);
      sub_249696E24(0, &qword_2578768D8);
      v13 = sub_2496BAF9C();

      if (v13 < 0 || (v13 & 0x4000000000000000) != 0)
      {
        v28 = swift_bridgeObjectRetain();
        v14 = (uint64_t)sub_24969A8BC(v28);
        swift_bridgeObjectRelease();
      }
      else
      {
        v14 = v13 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
      }
      v33 = v14;
      sub_24969A6DC(&v33);
      swift_bridgeObjectRelease();
      v15 = v33;
      if (v33 < 0 || (v33 & 0x4000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        v16 = sub_2496BB260();
        swift_release();
        if (v16)
          goto LABEL_9;
      }
      else
      {
        v16 = *(_QWORD *)(v33 + 16);
        if (v16)
        {
LABEL_9:
          v30 = 0;
          v31 = v9;
          v32 = a5;
          v33 = MEMORY[0x24BEE4AF8];
          sub_2496A2C5C(0, v16 & ~(v16 >> 63), 0);
          if (v16 < 0)
          {
            __break(1u);
            swift_release();
            __break(1u);
            return;
          }
          v17 = 0;
          v18 = v33;
          do
          {
            if ((v15 & 0xC000000000000001) != 0)
              v19 = (id)MEMORY[0x24BCF58E4](v17, v15);
            else
              v19 = *(id *)(v15 + 8 * v17 + 32);
            v20 = v19;
            v21 = objc_msgSend(v19, sel_identifier, v30);
            v22 = sub_2496BAF00();
            v24 = v23;

            v33 = v18;
            v26 = *(_QWORD *)(v18 + 16);
            v25 = *(_QWORD *)(v18 + 24);
            if (v26 >= v25 >> 1)
            {
              sub_2496A2C5C(v25 > 1, v26 + 1, 1);
              v18 = v33;
            }
            ++v17;
            *(_QWORD *)(v18 + 16) = v26 + 1;
            v27 = v18 + 16 * v26;
            *(_QWORD *)(v27 + 32) = v22;
            *(_QWORD *)(v27 + 40) = v24;
          }
          while (v16 != v17);
          swift_release();
          v9 = v31;
          a5 = v32;
          goto LABEL_21;
        }
      }
      swift_release();
      v18 = MEMORY[0x24BEE4AF8];
LABEL_21:
      v29 = *(os_unfair_lock_s **)(a5 + 24);
      swift_retain();
      os_unfair_lock_lock(v29 + 16);
      sub_24969A200((uint64_t)&v29[4], v18);
      os_unfair_lock_unlock(v29 + 16);
      swift_release();
      swift_bridgeObjectRelease();
      dispatch_group_leave(*(dispatch_group_t *)(a5 + 32));

    }
  }
}

uint64_t sub_24969A200(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t result;
  unint64_t v6;
  unint64_t v7;

  *(_QWORD *)(a1 + 16) = mach_continuous_time();
  *(_BYTE *)(a1 + 24) = 0;
  v4 = *(_QWORD **)(a1 + 32);
  swift_bridgeObjectRetain();
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_2496A2A30(0, v4[2] + 1, 1, v4);
    v4 = (_QWORD *)result;
  }
  v7 = v4[2];
  v6 = v4[3];
  if (v7 >= v6 >> 1)
  {
    result = (uint64_t)sub_2496A2A30((_QWORD *)(v6 > 1), v7 + 1, 1, v4);
    v4 = (_QWORD *)result;
  }
  v4[2] = v7 + 1;
  v4[v7 + 4] = a2;
  *(_QWORD *)(a1 + 32) = v4;
  return result;
}

void sub_24969A2BC(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (*v7)(id, void *, void *);
  id v8;
  id v9;
  id v10;

  v7 = *(void (**)(id, void *, void *))(a1 + 32);
  swift_retain();
  v10 = a2;
  v8 = a3;
  v9 = a4;
  v7(v10, a3, a4);
  swift_release();

}

uint64_t sub_24969A344()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();

  v1 = v0 + OBJC_IVAR____TtC26UIIntelligenceSupportAgent32EmbeddedWindowVisibilityProvider_deadline;
  v2 = sub_2496BAE88();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_24969A3A4()
{
  return type metadata accessor for EmbeddedWindowVisibilityProvider();
}

uint64_t type metadata accessor for EmbeddedWindowVisibilityProvider()
{
  uint64_t result;

  result = qword_257876828;
  if (!qword_257876828)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24969A3E8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2496BAE88();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t destroy for EmbeddedWindowVisibilityProvider.State()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EmbeddedWindowVisibilityProvider.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EmbeddedWindowVisibilityProvider.State(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for EmbeddedWindowVisibilityProvider.State(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmbeddedWindowVisibilityProvider.State(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EmbeddedWindowVisibilityProvider.State(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmbeddedWindowVisibilityProvider.State()
{
  return &type metadata for EmbeddedWindowVisibilityProvider.State;
}

uint64_t sub_24969A674()
{
  uint64_t v0;

  return sub_249698B38(v0);
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

unint64_t sub_24969A694()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544AFEA8;
  if (!qword_2544AFEA8)
  {
    v1 = sub_2496BAE40();
    result = MEMORY[0x24BCF5F5C](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_2544AFEA8);
  }
  return result;
}

uint64_t sub_24969A6DC(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_2496B2B0C();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_24969A9B0(v6);
  return sub_2496BB230();
}

uint64_t sub_24969A754(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578767A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24969A79C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578767A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_24969A7DC()
{
  sub_2496993B8();
}

uint64_t sub_24969A7E4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24969A820(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24969A864()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_24969A888()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_24969A8B4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  sub_249699F28(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

_QWORD *sub_24969A8BC(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2578768E0);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_24969B920((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_2496BB260();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_24969A9B0(uint64_t *a1)
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
  SEL *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  const char *v19;
  id v20;
  char *v21;
  unint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  _BOOL8 v26;
  char *v27;
  unint64_t v28;
  id v29;
  id v30;
  int v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  char *v37;
  unint64_t v38;
  _BOOL8 v39;
  char *v40;
  unint64_t v41;
  _BOOL4 v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  char *v58;
  unint64_t v59;
  id v60;
  id v61;
  char *v62;
  unint64_t v63;
  void *v64;
  char *v65;
  unint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  char v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  BOOL v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  unint64_t v115;
  char *v116;
  uint64_t v117;
  unint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  unint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  void **__dst;
  uint64_t v132;
  uint64_t v133;

  v2 = v1;
  v4 = a1[1];
  v5 = sub_2496BB35C();
  if (v5 < v4)
  {
    if (v4 >= 0)
      v6 = v4;
    else
      v6 = v4 + 1;
    if (v4 < -1)
      goto LABEL_171;
    v7 = v5;
    v124 = a1;
    if (v4 < 2)
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v133 = MEMORY[0x24BEE4AF8];
      __dst = (void **)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
      if (v4 != 1)
      {
        v14 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
        if (v14 < 2)
          goto LABEL_140;
        goto LABEL_128;
      }
    }
    else
    {
      v8 = v6 >> 1;
      sub_249696E24(0, &qword_2578768D8);
      v9 = sub_2496BAFCC();
      *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
      __dst = (void **)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
      v133 = v9;
    }
    v11 = 0;
    v12 = *a1;
    v125 = *a1 - 8;
    v126 = v7;
    v10 = (char *)MEMORY[0x24BEE4AF8];
    v13 = (SEL *)&unk_251AA4000;
    v132 = *a1;
    v130 = v4;
LABEL_15:
    v15 = v11++;
    if (v11 >= v4)
    {
LABEL_52:
      if (v11 >= v130)
        goto LABEL_78;
      if (__OFSUB__(v11, v15))
        goto LABEL_162;
      if (v11 - v15 >= v126)
        goto LABEL_78;
      if (__OFADD__(v15, v126))
        goto LABEL_165;
      v48 = v130;
      if (v15 + v126 < v130)
        v48 = v15 + v126;
      if (v48 >= v15)
      {
        if (v11 == v48)
          goto LABEL_78;
        v128 = v10;
        v129 = v15;
        v49 = v125 + 8 * v11;
LABEL_63:
        v50 = v48;
        v51 = *(void **)(v12 + 8 * v11);
        v52 = v129;
        v53 = v49;
        while (1)
        {
          v54 = *(void **)v53;
          v55 = v51;
          v56 = v54;
          v57 = objc_msgSend(v55, v13[192]);
          if (v57 == objc_msgSend(v56, v13[192]))
          {
            v58 = (char *)objc_msgSend(v55, sel_layoutRole);
            if ((unint64_t)(v58 - 1) > 9)
              v59 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v59 = qword_2496BC5F0[(_QWORD)(v58 - 1)];
            v62 = (char *)objc_msgSend(v56, sel_layoutRole);
            if ((unint64_t)(v62 - 1) > 9)
              v63 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v63 = qword_2496BC5F0[(_QWORD)(v62 - 1)];

            if (v59 >= v63)
            {
LABEL_61:
              v12 = v132;
              v13 = (SEL *)&unk_251AA4000;
LABEL_62:
              ++v11;
              v49 += 8;
              v48 = v50;
              if (v11 != v50)
                goto LABEL_63;
              v11 = v50;
              v10 = v128;
              v15 = v129;
LABEL_78:
              if (v11 < v15)
                goto LABEL_157;
              v65 = v10;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
                v10 = v65;
              else
                v10 = sub_2496B1F78(0, *((_QWORD *)v65 + 2) + 1, 1, v65);
              v67 = *((_QWORD *)v10 + 2);
              v66 = *((_QWORD *)v10 + 3);
              v14 = v67 + 1;
              v12 = v132;
              if (v67 >= v66 >> 1)
              {
                v116 = sub_2496B1F78((char *)(v66 > 1), v67 + 1, 1, v10);
                v12 = v132;
                v10 = v116;
              }
              *((_QWORD *)v10 + 2) = v14;
              v68 = v10 + 32;
              v69 = &v10[16 * v67 + 32];
              *(_QWORD *)v69 = v15;
              *((_QWORD *)v69 + 1) = v11;
              if (v67)
              {
LABEL_84:
                v70 = v14 - 1;
                if (v14 >= 4)
                {
                  v75 = &v68[16 * v14];
                  v76 = *((_QWORD *)v75 - 8);
                  v77 = *((_QWORD *)v75 - 7);
                  v81 = __OFSUB__(v77, v76);
                  v78 = v77 - v76;
                  if (v81)
                    goto LABEL_146;
                  v80 = *((_QWORD *)v75 - 6);
                  v79 = *((_QWORD *)v75 - 5);
                  v81 = __OFSUB__(v79, v80);
                  v73 = v79 - v80;
                  v74 = v81;
                  if (v81)
                    goto LABEL_147;
                  v82 = v14 - 2;
                  v83 = &v68[16 * v14 - 32];
                  v85 = *(_QWORD *)v83;
                  v84 = *((_QWORD *)v83 + 1);
                  v81 = __OFSUB__(v84, v85);
                  v86 = v84 - v85;
                  if (v81)
                    goto LABEL_149;
                  v81 = __OFADD__(v73, v86);
                  v87 = v73 + v86;
                  if (v81)
                    goto LABEL_152;
                  if (v87 >= v78)
                  {
                    v105 = &v68[16 * v70];
                    v107 = *(_QWORD *)v105;
                    v106 = *((_QWORD *)v105 + 1);
                    v81 = __OFSUB__(v106, v107);
                    v108 = v106 - v107;
                    if (v81)
                      goto LABEL_156;
                    v98 = v73 < v108;
                  }
                  else
                  {
LABEL_97:
                    if ((v74 & 1) != 0)
                      goto LABEL_148;
                    v82 = v14 - 2;
                    v88 = &v68[16 * v14 - 32];
                    v90 = *(_QWORD *)v88;
                    v89 = *((_QWORD *)v88 + 1);
                    v91 = __OFSUB__(v89, v90);
                    v92 = v89 - v90;
                    v93 = v91;
                    if (v91)
                      goto LABEL_151;
                    v94 = &v68[16 * v70];
                    v96 = *(_QWORD *)v94;
                    v95 = *((_QWORD *)v94 + 1);
                    v81 = __OFSUB__(v95, v96);
                    v97 = v95 - v96;
                    if (v81)
                      goto LABEL_154;
                    if (__OFADD__(v92, v97))
                      goto LABEL_155;
                    if (v92 + v97 < v73)
                      goto LABEL_109;
                    v98 = v73 < v97;
                  }
                  if (v98)
                    v70 = v82;
                }
                else
                {
                  if (v14 == 3)
                  {
                    v72 = *((_QWORD *)v10 + 4);
                    v71 = *((_QWORD *)v10 + 5);
                    v81 = __OFSUB__(v71, v72);
                    v73 = v71 - v72;
                    v74 = v81;
                    goto LABEL_97;
                  }
                  v99 = *((_QWORD *)v10 + 4);
                  v100 = *((_QWORD *)v10 + 5);
                  v81 = __OFSUB__(v100, v99);
                  v92 = v100 - v99;
                  v93 = v81;
LABEL_109:
                  if ((v93 & 1) != 0)
                    goto LABEL_150;
                  v101 = &v68[16 * v70];
                  v103 = *(_QWORD *)v101;
                  v102 = *((_QWORD *)v101 + 1);
                  v81 = __OFSUB__(v102, v103);
                  v104 = v102 - v103;
                  if (v81)
                    goto LABEL_153;
                  if (v104 < v92)
                    goto LABEL_14;
                }
                v109 = v70 - 1;
                if (v70 - 1 >= v14)
                {
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
LABEL_154:
                  __break(1u);
LABEL_155:
                  __break(1u);
LABEL_156:
                  __break(1u);
LABEL_157:
                  __break(1u);
LABEL_158:
                  __break(1u);
LABEL_159:
                  __break(1u);
LABEL_160:
                  __break(1u);
LABEL_161:
                  __break(1u);
LABEL_162:
                  __break(1u);
LABEL_163:
                  __break(1u);
LABEL_164:
                  __break(1u);
LABEL_165:
                  __break(1u);
                  break;
                }
                if (!v12)
                  goto LABEL_168;
                v110 = v10;
                v111 = &v68[16 * v109];
                v112 = *(_QWORD *)v111;
                v113 = &v68[16 * v70];
                v114 = *((_QWORD *)v113 + 1);
                sub_24969B4BC((void **)(v12 + 8 * *(_QWORD *)v111), (id *)(v12 + 8 * *(_QWORD *)v113), v12 + 8 * v114, __dst);
                if (v1)
                  goto LABEL_140;
                if (v114 < v112)
                  goto LABEL_143;
                if (v70 > *((_QWORD *)v110 + 2))
                  goto LABEL_144;
                *(_QWORD *)v111 = v112;
                *(_QWORD *)&v68[16 * v109 + 8] = v114;
                v115 = *((_QWORD *)v110 + 2);
                if (v70 >= v115)
                  goto LABEL_145;
                v14 = v115 - 1;
                memmove(&v68[16 * v70], v113 + 16, 16 * (v115 - 1 - v70));
                v10 = v110;
                *((_QWORD *)v110 + 2) = v115 - 1;
                v12 = v132;
                v13 = (SEL *)&unk_251AA4000;
                if (v115 <= 2)
                  goto LABEL_14;
                goto LABEL_84;
              }
              v14 = 1;
LABEL_14:
              v4 = v130;
              if (v11 >= v130)
              {
                v2 = v1;
                if (v14 < 2)
                {
LABEL_140:
                  swift_bridgeObjectRelease();
                  *(_QWORD *)((v133 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
                  sub_2496BAFB4();
                  swift_bridgeObjectRelease();
                  return;
                }
LABEL_128:
                v117 = *v124;
                while (1)
                {
                  v118 = v14 - 2;
                  if (v14 < 2)
                    goto LABEL_158;
                  if (!v117)
                    goto LABEL_170;
                  v119 = v10;
                  v120 = *(_QWORD *)&v10[16 * v118 + 32];
                  v121 = *(_QWORD *)&v10[16 * v14 + 24];
                  sub_24969B4BC((void **)(v117 + 8 * v120), (id *)(v117 + 8 * *(_QWORD *)&v10[16 * v14 + 16]), v117 + 8 * v121, __dst);
                  if (v2)
                    goto LABEL_140;
                  if (v121 < v120)
                    goto LABEL_159;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                    v119 = sub_2496B2224((uint64_t)v119);
                  if (v118 >= *((_QWORD *)v119 + 2))
                    goto LABEL_160;
                  v122 = &v119[16 * v118 + 32];
                  *(_QWORD *)v122 = v120;
                  *((_QWORD *)v122 + 1) = v121;
                  v123 = *((_QWORD *)v119 + 2);
                  if (v14 > v123)
                    goto LABEL_161;
                  memmove(&v119[16 * v14 + 16], &v119[16 * v14 + 32], 16 * (v123 - v14));
                  v10 = v119;
                  *((_QWORD *)v119 + 2) = v123 - 1;
                  v14 = v123 - 1;
                  if (v123 <= 2)
                    goto LABEL_140;
                }
              }
              goto LABEL_15;
            }
          }
          else
          {
            v60 = objc_msgSend(v55, v13[192]);
            v61 = objc_msgSend(v56, v13[192]);

            if ((uint64_t)v61 >= (uint64_t)v60)
              goto LABEL_61;
          }
          v12 = v132;
          if (!v132)
            goto LABEL_167;
          v64 = *(void **)v53;
          v51 = *(void **)(v53 + 8);
          *(_QWORD *)v53 = v51;
          *(_QWORD *)(v53 + 8) = v64;
          v53 -= 8;
          ++v52;
          v13 = (SEL *)&unk_251AA4000;
          if (v11 == v52)
            goto LABEL_62;
        }
      }
      __break(1u);
LABEL_167:
      __break(1u);
LABEL_168:
      __break(1u);
LABEL_169:
      __break(1u);
LABEL_170:
      __break(1u);
LABEL_171:
      sub_2496BB248();
      __break(1u);
      return;
    }
    v127 = v10;
    v16 = *(void **)(v12 + 8 * v15);
    v17 = *(id *)(v12 + 8 * v11);
    v18 = v16;
    v19 = (const char *)v13;
    v20 = objc_msgSend(v17, v13[192]);
    if (v20 == objc_msgSend(v18, v19 + 1352))
    {
      v21 = (char *)objc_msgSend(v17, sel_layoutRole);
      if ((unint64_t)(v21 - 1) > 9)
        v22 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v22 = qword_2496BC5F0[(_QWORD)(v21 - 1)];
      v13 = (SEL *)&unk_251AA4000;
      v27 = (char *)objc_msgSend(v18, sel_layoutRole);
      if ((unint64_t)(v27 - 1) > 9)
        v28 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v28 = qword_2496BC5F0[(_QWORD)(v27 - 1)];

      v26 = v22 < v28;
      v25 = v15 + 2;
      if (v15 + 2 < v130)
        goto LABEL_26;
    }
    else
    {
      v23 = objc_msgSend(v17, v19 + 1352);
      v24 = objc_msgSend(v18, v19 + 1352);

      v25 = v15 + 2;
      v26 = (uint64_t)v24 < (uint64_t)v23;
      v13 = (SEL *)v19;
      if (v15 + 2 < v130)
      {
LABEL_26:
        v12 = v132;
        do
        {
          v33 = *(void **)(v12 + 8 * v11);
          v34 = *(id *)(v12 + 8 * v25);
          v35 = v33;
          v36 = objc_msgSend(v34, v13[192]);
          if (v36 == objc_msgSend(v35, v13[192]))
          {
            v37 = (char *)objc_msgSend(v34, sel_layoutRole);
            if ((unint64_t)(v37 - 1) > 9)
              v38 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v38 = qword_2496BC5F0[(_QWORD)(v37 - 1)];
            v39 = v26;
            v40 = (char *)objc_msgSend(v35, sel_layoutRole);
            if ((unint64_t)(v40 - 1) > 9)
              v41 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v41 = qword_2496BC5F0[(_QWORD)(v40 - 1)];

            v42 = v38 >= v41;
            v26 = v39;
            if (v39 == v42)
              goto LABEL_40;
          }
          else
          {
            v29 = objc_msgSend(v34, v13[192]);
            v30 = objc_msgSend(v35, v13[192]);

            v98 = (uint64_t)v30 < (uint64_t)v29;
            v13 = (SEL *)&unk_251AA4000;
            v31 = !v98;
            if (v26 == v31)
              goto LABEL_40;
          }
          v32 = v25 + 1;
          v11 = v25;
          v25 = v32;
          v12 = v132;
        }
        while (v32 < v130);
        v25 = v32;
        v10 = v127;
        if (!v26)
          goto LABEL_51;
        goto LABEL_43;
      }
    }
LABEL_40:
    v12 = v132;
    v10 = v127;
    if (!v26)
    {
LABEL_51:
      v11 = v25;
      goto LABEL_52;
    }
LABEL_43:
    if (v25 < v15)
      goto LABEL_164;
    if (v15 < v25)
    {
      v43 = (uint64_t *)(v125 + 8 * v25);
      v44 = v25;
      v45 = v15;
      v46 = (uint64_t *)(v12 + 8 * v15);
      while (1)
      {
        if (v45 != --v44)
        {
          if (!v12)
            goto LABEL_169;
          v47 = *v46;
          *v46 = *v43;
          *v43 = v47;
        }
        ++v45;
        --v43;
        ++v46;
        if (v45 >= v44)
          goto LABEL_51;
      }
    }
    goto LABEL_51;
  }
  if (v4 < 0)
    goto LABEL_163;
  if (v4)
    sub_24969B334(0, v4, 1, a1);
}

void sub_24969B334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  char *v13;
  unint64_t v14;
  id v15;
  id v16;
  char *v17;
  unint64_t v18;
  void *v19;
  uint64_t v22;

  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    v7 = *(void **)(v5 + 8 * v4);
    v8 = a1;
    v22 = v6;
    while (1)
    {
      v9 = *(void **)v6;
      v10 = v7;
      v11 = v9;
      v12 = objc_msgSend(v10, sel_level);
      if (v12 == objc_msgSend(v11, sel_level))
      {
        v13 = (char *)objc_msgSend(v10, sel_layoutRole);
        if ((unint64_t)(v13 - 1) > 9)
          v14 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v14 = qword_2496BC5F0[(_QWORD)(v13 - 1)];
        v17 = (char *)objc_msgSend(v11, sel_layoutRole);
        if ((unint64_t)(v17 - 1) > 9)
          v18 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v18 = qword_2496BC5F0[(_QWORD)(v17 - 1)];

        if (v14 >= v18)
        {
LABEL_4:
          ++v4;
          v6 = v22 + 8;
          if (v4 == a2)
            return;
          goto LABEL_5;
        }
      }
      else
      {
        v15 = objc_msgSend(v10, sel_level);
        v16 = objc_msgSend(v11, sel_level);

        if ((uint64_t)v16 >= (uint64_t)v15)
          goto LABEL_4;
      }
      if (!v5)
        break;
      v19 = *(void **)v6;
      v7 = *(void **)(v6 + 8);
      *(_QWORD *)v6 = v7;
      *(_QWORD *)(v6 + 8) = v19;
      v6 -= 8;
      if (v4 == ++v8)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_24969B4BC(void **__src, id *a2, unint64_t a3, void **__dst)
{
  void **v4;
  id *v5;
  id *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  id *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  char *v19;
  unint64_t v20;
  id v21;
  void **v22;
  id v23;
  BOOL v24;
  void **v25;
  id *v26;
  char *v27;
  unint64_t v28;
  void **v29;
  id *v30;
  id *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  char *v37;
  unint64_t v38;
  id v39;
  id v40;
  void **v41;
  char *v42;
  unint64_t v43;
  uint64_t result;
  id *v45;
  void **v46;
  id *v48;
  void **v49;
  void **v50;
  id *v51;

  v4 = __dst;
  v5 = a2;
  v6 = __src;
  v7 = (char *)a2 - (char *)__src;
  v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v8 = (char *)a2 - (char *)__src;
  v9 = v8 >> 3;
  v10 = a3 - (_QWORD)a2;
  v11 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v11 = a3 - (_QWORD)a2;
  v12 = v11 >> 3;
  v51 = __src;
  v50 = __dst;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7)
      goto LABEL_60;
    if (__dst != a2 || &a2[v12] <= __dst)
      memmove(__dst, a2, 8 * v12);
    v29 = &v4[v12];
    v49 = v29;
    v51 = v5;
    if (v6 >= v5 || v10 < 8)
    {
LABEL_59:
      sub_2496B2070((void **)&v51, (const void **)&v50, &v49);
      return 1;
    }
    v30 = (id *)(a3 - 8);
    v31 = v5;
    v45 = v6;
    v46 = v4;
    v32 = 0x1F27B3000;
    while (1)
    {
      v48 = v30 + 1;
      v33 = *--v31;
      v34 = *(v29 - 1);
      v35 = v33;
      v36 = objc_msgSend(v34, *(SEL *)(v32 + 1536));
      if (v36 == objc_msgSend(v35, *(SEL *)(v32 + 1536)))
      {
        v37 = (char *)objc_msgSend(v34, sel_layoutRole);
        if ((unint64_t)(v37 - 1) > 9)
          v38 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v38 = qword_2496BC5F0[(_QWORD)(v37 - 1)];
        v42 = (char *)objc_msgSend(v35, sel_layoutRole);
        if ((unint64_t)(v42 - 1) > 9)
          v43 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v43 = qword_2496BC5F0[(_QWORD)(v42 - 1)];

        if (v38 >= v43)
        {
LABEL_53:
          v49 = v29 - 1;
          v32 = (uint64_t)&unk_251AA4000;
          if (v48 < v29 || v30 >= v29 || v48 != v29)
            *v30 = *(v29 - 1);
          v31 = v5;
          --v29;
          v41 = v46;
          if (v5 <= v45)
            goto LABEL_59;
          goto LABEL_58;
        }
      }
      else
      {
        v39 = objc_msgSend(v34, *(SEL *)(v32 + 1536));
        v40 = objc_msgSend(v35, *(SEL *)(v32 + 1536));

        if ((uint64_t)v40 >= (uint64_t)v39)
          goto LABEL_53;
      }
      if (v48 != v5 || v30 >= v5)
        *v30 = *v31;
      v51 = v31;
      v41 = v46;
      v32 = 0x251AA4000;
      if (v31 <= v45)
        goto LABEL_59;
LABEL_58:
      --v30;
      v5 = v31;
      if (v29 <= v41)
        goto LABEL_59;
    }
  }
  if (v7 >= -7)
  {
    if (__dst != __src || &__src[v9] <= __dst)
      memmove(__dst, __src, 8 * v9);
    v13 = &v4[v9];
    v49 = v13;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      while (1)
      {
        v14 = v6;
        v15 = *v4;
        v16 = *v5;
        v17 = v15;
        v18 = objc_msgSend(v16, sel_level);
        if (v18 == objc_msgSend(v17, sel_level))
        {
          v19 = (char *)objc_msgSend(v16, sel_layoutRole);
          if ((unint64_t)(v19 - 1) > 9)
            v20 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v20 = qword_2496BC5F0[(_QWORD)(v19 - 1)];
          v25 = v14;
          v27 = (char *)objc_msgSend(v17, sel_layoutRole);
          if ((unint64_t)(v27 - 1) > 9)
            v28 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v28 = qword_2496BC5F0[(_QWORD)(v27 - 1)];

          if (v20 < v28)
          {
LABEL_17:
            v26 = v5 + 1;
            if (v25 < v5 || v25 >= v26 || v25 != v5)
              *v25 = *v5;
            goto LABEL_29;
          }
        }
        else
        {
          v21 = objc_msgSend(v16, sel_level);
          v22 = v4;
          v23 = objc_msgSend(v17, sel_level);

          v24 = (uint64_t)v23 < (uint64_t)v21;
          v4 = v22;
          v25 = v14;
          if (v24)
            goto LABEL_17;
        }
        if (v25 != v4)
          *v25 = *v4;
        v50 = ++v4;
        v26 = v5;
LABEL_29:
        v6 = v25 + 1;
        if (v4 < v13)
        {
          v5 = v26;
          if ((unint64_t)v26 < a3)
            continue;
        }
        v51 = v6;
        goto LABEL_59;
      }
    }
    goto LABEL_59;
  }
LABEL_60:
  result = sub_2496BB290();
  __break(1u);
  return result;
}

uint64_t sub_24969B920(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_2496BB260();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_2496BB260();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_24969BC30(&qword_2578768F0, &qword_2578768E8, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2578768E8);
          v12 = sub_24969BB3C(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_249696E24(0, &qword_2578768D8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_2496BB290();
  __break(1u);
  return result;
}

void (*sub_24969BB3C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_24969BBBC(v6, a2, a3);
  return sub_24969BB90;
}

void sub_24969BB90(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_24969BBBC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x24BCF58E4](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_24969BC28;
  }
  __break(1u);
  return result;
}

void sub_24969BC28(id *a1)
{

}

uint64_t sub_24969BC30(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BCF5F5C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_24969BC70()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_2496BA888();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initForReadingFromData_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_2496BA87C();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_24969BD2C(uint64_t a1, unint64_t a2)
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

uint64_t sub_24969BD70(uint64_t a1, unint64_t a2)
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

uint64_t sub_24969BDB4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_24969BDE0()
{
  uint64_t v0;

  sub_249699D0C(*(void **)(v0 + 16));
}

uint64_t IntelligenceSupportAgent.ElementHierarchy.roots.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t IntelligenceSupportAgent.ElementHierarchy.roots.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*IntelligenceSupportAgent.ElementHierarchy.roots.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.ElementHierarchy.executableCommands.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
  return swift_bridgeObjectRetain();
}

uint64_t IntelligenceSupportAgent.ElementHierarchy.executableCommands.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = v2;
  return result;
}

uint64_t (*IntelligenceSupportAgent.ElementHierarchy.executableCommands.modify())()
{
  return nullsub_1;
}

uint64_t static IntelligenceSupportAgent.ElementHierarchy.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = a1[1];
  v3 = a2[1];
  if ((sub_24969BEF8(*a1, *a2) & 1) == 0)
    return 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v4 = sub_24969CA70(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_24969BEF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  BOOL v20;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_2496BAA38();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v22 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v17 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v22 = *(_QWORD *)(v8 + 72);
      v23 = v8;
      v13 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
      v14 = v11 - 1;
      do
      {
        v15 = a1;
        v13(v10, a1 + v12, v4);
        v16 = a2;
        v13(v7, a2 + v12, v4);
        sub_24968BDD4(&qword_257876990, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB9B8], MEMORY[0x24BEBB9D8]);
        v17 = sub_2496BAED0();
        v18 = *(void (**)(char *, uint64_t))(v23 + 8);
        v18(v7, v4);
        v18(v10, v4);
        v20 = v14-- != 0;
        if ((v17 & 1) == 0)
          break;
        v12 += v22;
        a2 = v16;
        a1 = v15;
      }
      while (v20);
    }
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

uint64_t sub_24969C07C()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000012;
  else
    return 0x73746F6F72;
}

uint64_t sub_24969C0B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24969D45C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24969C0DC()
{
  sub_24969CFD0();
  return sub_2496BB3EC();
}

uint64_t sub_24969C104()
{
  sub_24969CFD0();
  return sub_2496BB3F8();
}

uint64_t IntelligenceSupportAgent.ElementHierarchy.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876908);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24969CFD0();
  sub_2496BB3E0();
  v12 = v8;
  v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876918);
  sub_24969D058(&qword_257876920, &qword_257876928, MEMORY[0x24BEBB9D0], MEMORY[0x24BEE12A0]);
  sub_2496BB344();
  if (!v2)
  {
    v12 = v10;
    v11 = 1;
    sub_24969D014();
    sub_2496BB344();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t IntelligenceSupportAgent.ElementHierarchy.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876938);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24969CFD0();
  sub_2496BB3D4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876918);
  v13 = 0;
  sub_24969D058(&qword_257876940, &qword_257876948, MEMORY[0x24BEBB9E0], MEMORY[0x24BEE12D0]);
  sub_2496BB2F0();
  v9 = v14;
  v13 = 1;
  sub_24969D0DC();
  swift_bridgeObjectRetain();
  sub_2496BB2F0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = v14;
  *a2 = v9;
  a2[1] = v10;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24969C48C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = a1[1];
  v3 = a2[1];
  if ((sub_24969BEF8(*a1, *a2) & 1) == 0)
    return 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v4 = sub_24969CA70(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_24969C500@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return IntelligenceSupportAgent.ElementHierarchy.init(from:)(a1, a2);
}

uint64_t sub_24969C514(_QWORD *a1)
{
  return IntelligenceSupportAgent.ElementHierarchy.encode(to:)(a1);
}

unint64_t IntelligenceSupportAgent.ElementHierarchy.description.getter()
{
  sub_2496BB1E8();
  swift_bridgeObjectRelease();
  sub_24969C608(0);
  sub_2496BAF48();
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  IntelligenceSupportAgent.ExecutableCommands.description.getter();
  sub_2496BAF48();
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  return 0xD000000000000018;
}

uint64_t sub_24969C608(char a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v3 = sub_2496BAA38();
  v34 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  if ((a1 & 1) != 0)
  {
    v36 = 2651;
    v37 = 0xE200000000000000;
    v7 = *(_QWORD *)(v6 + 16);
    v8 = MEMORY[0x24BEE4AF8];
    if (v7)
    {
      v35 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_2496A2C5C(0, v7, 0);
      v9 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
      v31 = v6;
      v10 = v6 + v9;
      v11 = *(_QWORD *)(v34 + 72);
      v32 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
      v33 = v11;
      do
      {
        v32(v5, v10, v3);
        v12 = sub_2496BA990();
        v14 = v13;
        (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v3);
        v8 = v35;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2496A2C5C(0, *(_QWORD *)(v8 + 16) + 1, 1);
          v8 = v35;
        }
        v16 = *(_QWORD *)(v8 + 16);
        v15 = *(_QWORD *)(v8 + 24);
        if (v16 >= v15 >> 1)
        {
          sub_2496A2C5C(v15 > 1, v16 + 1, 1);
          v8 = v35;
        }
        *(_QWORD *)(v8 + 16) = v16 + 1;
        v17 = v8 + 16 * v16;
        *(_QWORD *)(v17 + 32) = v12;
        *(_QWORD *)(v17 + 40) = v14;
        v10 += v33;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
    }
    v35 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEC0);
    sub_24969D540();
    sub_2496BAEC4();
  }
  else
  {
    v36 = 2651;
    v37 = 0xE200000000000000;
    v18 = *(_QWORD *)(v6 + 16);
    v19 = MEMORY[0x24BEE4AF8];
    if (v18)
    {
      v35 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_2496A2C5C(0, v18, 0);
      v20 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
      v31 = v6;
      v21 = v6 + v20;
      v22 = *(_QWORD *)(v34 + 72);
      v32 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
      v33 = v22;
      do
      {
        v32(v5, v21, v3);
        sub_24968BDD4(&qword_257876970, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB9B8], MEMORY[0x24BEBB9E8]);
        v23 = sub_2496BB368();
        v25 = v24;
        (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v3);
        v19 = v35;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2496A2C5C(0, *(_QWORD *)(v19 + 16) + 1, 1);
          v19 = v35;
        }
        v27 = *(_QWORD *)(v19 + 16);
        v26 = *(_QWORD *)(v19 + 24);
        if (v27 >= v26 >> 1)
        {
          sub_2496A2C5C(v26 > 1, v27 + 1, 1);
          v19 = v35;
        }
        *(_QWORD *)(v19 + 16) = v27 + 1;
        v28 = v19 + 16 * v27;
        *(_QWORD *)(v28 + 32) = v23;
        *(_QWORD *)(v28 + 40) = v25;
        v21 += v33;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
    }
    v35 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEC0);
    sub_24969D540();
    sub_2496BAEC4();
  }
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  return v36;
}

unint64_t IntelligenceSupportAgent.ElementHierarchy.recursiveDescription.getter()
{
  sub_2496BB1E8();
  swift_bridgeObjectRelease();
  sub_24969C608(1);
  sub_2496BAF48();
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  IntelligenceSupportAgent.ExecutableCommands.description.getter();
  sub_2496BAF48();
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  return 0xD000000000000011;
}

uint64_t sub_24969CA70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
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
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t (*v43)(char *, unint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  char v48;
  void (*v49)(char *, uint64_t);
  char *v50;
  int64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;

  v4 = sub_2496BA924();
  v66 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v65 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v51 - v7;
  v9 = sub_2496BAB10();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876978);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v14);
  if (a1 == a2)
    return 1;
  v61 = (uint64_t)&v51 - v18;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v59 = a1;
  v60 = 0;
  v19 = *(_QWORD *)(a1 + 64);
  v54 = a2;
  v55 = a1 + 64;
  v20 = 1 << *(_BYTE *)(a1 + 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & v19;
  v56 = (unint64_t)(v20 + 63) >> 6;
  v57 = v16;
  v51 = v56 - 1;
  v52 = v10;
  v53 = v9;
  v58 = v12;
  if (!v22)
    goto LABEL_8;
LABEL_6:
  v62 = (v22 - 1) & v22;
  v23 = __clz(__rbit64(v22)) | (v60 << 6);
  while (2)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v16, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v10 + 72) * v23, v9);
    v24 = *(_QWORD *)(a1 + 56);
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876980);
    *(_QWORD *)&v16[*(int *)(v25 + 48)] = *(_QWORD *)(v24 + 8 * v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v16, 0, 1, v25);
    swift_bridgeObjectRetain();
    while (1)
    {
      v30 = v61;
      sub_24969D58C((uint64_t)v16, v61);
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876980);
      v32 = 1;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 48))(v30, 1, v31) == 1)
        return v32;
      v33 = *(int *)(v31 + 48);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, v30, v9);
      v34 = *(_QWORD *)(v30 + v33);
      v35 = sub_2496B6910((uint64_t)v12);
      v37 = v36;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      if ((v37 & 1) == 0
        || (v38 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v35), v39 = *(_QWORD *)(v38 + 16), v39 != *(_QWORD *)(v34 + 16)))
      {
LABEL_44:
        swift_bridgeObjectRelease();
        return 0;
      }
      if (!v39 || v38 == v34)
      {
        result = swift_bridgeObjectRelease();
        v16 = v57;
        v12 = v58;
        a1 = v59;
        v22 = v62;
        if (v62)
          goto LABEL_6;
      }
      else
      {
        v64 = v34;
        v40 = v66;
        v41 = (*(unsigned __int8 *)(v66 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
        swift_bridgeObjectRetain();
        v42 = 0;
        v63 = *(_QWORD *)(v40 + 72);
        v43 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v40 + 16);
        do
        {
          result = v43(v8, v38 + v41, v4);
          if (v42 >= *(_QWORD *)(v64 + 16))
          {
            __break(1u);
            goto LABEL_48;
          }
          v44 = v39;
          v45 = v4;
          v46 = v8;
          v47 = v65;
          v43(v65, v64 + v41, v45);
          sub_24968BDD4(&qword_257876988, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB770], MEMORY[0x24BEBB790]);
          v48 = sub_2496BAED0();
          v49 = *(void (**)(char *, uint64_t))(v66 + 8);
          v50 = v47;
          v8 = v46;
          v4 = v45;
          v49(v50, v45);
          v49(v8, v45);
          if ((v48 & 1) == 0)
          {
            swift_bridgeObjectRelease();
            goto LABEL_44;
          }
          ++v42;
          v41 += v63;
          v39 = v44;
        }
        while (v44 != v42);
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        v9 = v53;
        a2 = v54;
        v12 = v58;
        a1 = v59;
        v10 = v52;
        v16 = v57;
        v22 = v62;
        if (v62)
          goto LABEL_6;
      }
LABEL_8:
      v26 = v60 + 1;
      if (__OFADD__(v60, 1))
      {
LABEL_48:
        __break(1u);
        goto LABEL_49;
      }
      if (v26 < v56)
      {
        v27 = *(_QWORD *)(v55 + 8 * v26);
        if (v27)
          goto LABEL_11;
        v28 = v60 + 2;
        ++v60;
        if (v26 + 1 < v56)
        {
          v27 = *(_QWORD *)(v55 + 8 * v28);
          if (v27)
            goto LABEL_14;
          v60 = v26 + 1;
          if (v26 + 2 < v56)
          {
            v27 = *(_QWORD *)(v55 + 8 * (v26 + 2));
            if (v27)
            {
              v26 += 2;
              goto LABEL_11;
            }
            v60 = v26 + 2;
            if (v26 + 3 < v56)
            {
              v27 = *(_QWORD *)(v55 + 8 * (v26 + 3));
              if (v27)
              {
                v26 += 3;
                goto LABEL_11;
              }
              v28 = v26 + 4;
              v60 = v26 + 3;
              if (v26 + 4 < v56)
                break;
            }
          }
        }
      }
LABEL_28:
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876980);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v16, 1, 1, v29);
      v62 = 0;
    }
    v27 = *(_QWORD *)(v55 + 8 * v28);
    if (v27)
    {
LABEL_14:
      v26 = v28;
LABEL_11:
      v62 = (v27 - 1) & v27;
      v23 = __clz(__rbit64(v27)) + (v26 << 6);
      v60 = v26;
      continue;
    }
    break;
  }
  while (1)
  {
    v26 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v26 >= v56)
    {
      v60 = v51;
      goto LABEL_28;
    }
    v27 = *(_QWORD *)(v55 + 8 * v26);
    ++v28;
    if (v27)
      goto LABEL_11;
  }
LABEL_49:
  __break(1u);
  return result;
}

unint64_t sub_24969CFD0()
{
  unint64_t result;

  result = qword_257876910;
  if (!qword_257876910)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC7D4, &_s16ElementHierarchyV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876910);
  }
  return result;
}

unint64_t sub_24969D014()
{
  unint64_t result;

  result = qword_257876930;
  if (!qword_257876930)
  {
    result = MEMORY[0x24BCF5F5C](&protocol conformance descriptor for IntelligenceSupportAgent.ExecutableCommands, &type metadata for IntelligenceSupportAgent.ExecutableCommands);
    atomic_store(result, (unint64_t *)&qword_257876930);
  }
  return result;
}

uint64_t sub_24969D058(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257876918);
    v10 = sub_24968BDD4(a2, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB9B8], a3);
    result = MEMORY[0x24BCF5F5C](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24969D0DC()
{
  unint64_t result;

  result = qword_257876950;
  if (!qword_257876950)
  {
    result = MEMORY[0x24BCF5F5C](&protocol conformance descriptor for IntelligenceSupportAgent.ExecutableCommands, &type metadata for IntelligenceSupportAgent.ExecutableCommands);
    atomic_store(result, (unint64_t *)&qword_257876950);
  }
  return result;
}

uint64_t _s16ElementHierarchyVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s16ElementHierarchyVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s16ElementHierarchyVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *_s16ElementHierarchyVwta(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16ElementHierarchyVwet(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s16ElementHierarchyVwst(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceSupportAgent.ElementHierarchy()
{
  return &type metadata for IntelligenceSupportAgent.ElementHierarchy;
}

uint64_t _s16ElementHierarchyV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24969D304 + 4 * byte_2496BC645[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24969D338 + 4 * byte_2496BC640[v4]))();
}

uint64_t sub_24969D338(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24969D340(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24969D348);
  return result;
}

uint64_t sub_24969D354(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24969D35CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24969D360(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24969D368(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s16ElementHierarchyV10CodingKeysOMa()
{
  return &_s16ElementHierarchyV10CodingKeysON;
}

unint64_t sub_24969D388()
{
  unint64_t result;

  result = qword_257876958;
  if (!qword_257876958)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC7AC, &_s16ElementHierarchyV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876958);
  }
  return result;
}

unint64_t sub_24969D3D0()
{
  unint64_t result;

  result = qword_257876960;
  if (!qword_257876960)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC71C, &_s16ElementHierarchyV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876960);
  }
  return result;
}

unint64_t sub_24969D418()
{
  unint64_t result;

  result = qword_257876968;
  if (!qword_257876968)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BC744, &_s16ElementHierarchyV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876968);
  }
  return result;
}

uint64_t sub_24969D45C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x73746F6F72 && a2 == 0xE500000000000000;
  if (v2 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002496C0170)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_2496BB380();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_24969D540()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544AFEC8;
  if (!qword_2544AFEC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544AFEC0);
    result = MEMORY[0x24BCF5F5C](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2544AFEC8);
  }
  return result;
}

uint64_t sub_24969D58C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876978);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for Region()
{
  return &type metadata for Region;
}

uint64_t IntelligenceSupportAgent.RequestParameters.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  *(_QWORD *)a1 = 0x3FE8000000000000;
  *(_QWORD *)(a1 + 8) = 0;
  v2 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a1 + 16) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a1 + 24) = v2;
  *(_BYTE *)(a1 + 32) = sub_2496BAB94() & 1;
  *(_BYTE *)(a1 + 33) = sub_2496BABAC() & 1;
  *(_OWORD *)(a1 + 40) = xmmword_2496BC530;
  *(_OWORD *)(a1 + 56) = xmmword_2496BC540;
  *(_BYTE *)(a1 + 72) = sub_2496BAB70() & 1;
  *(_BYTE *)(a1 + 73) = sub_2496BABA0() & 1;
  *(_BYTE *)(a1 + 74) = sub_2496BABB8() & 1;
  *(_BYTE *)(a1 + 75) = sub_2496BAB88() & 1;
  *(_BYTE *)(a1 + 76) = sub_2496BAB7C() & 1;
  *(_BYTE *)(a1 + 77) = sub_2496BABC4() & 1;
  v3 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  sub_2496BAB40();
  v4 = sub_2496BAB64() & 1;
  v5 = sub_2496BAB58();
  v6 = v4 | 2;
  if ((v5 & 1) == 0)
    v6 = v4;
  *(_QWORD *)(a1 + *(int *)(v3 + 72)) = v6;
  return sub_2496BAB4C();
}

uint64_t sub_24969D6E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = sub_2496BABDC();
  v16 = *(_QWORD *)(v4 - 8);
  v17 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2496BAB28();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2496BACF0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  sub_2496BAC90();
  sub_2496BAC3C();
  sub_2496BAC60();
  sub_2496BAC0C();
  sub_2496BAC48();
  sub_2496BAC6C();
  sub_2496BAC24();
  sub_2496BAC18();
  sub_2496BAC78();
  v14 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2 + *(int *)(v14 + 68), v7);
  sub_2496BAB34();
  sub_2496BAC00();
  sub_2496BABF4();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v6, a2 + *(int *)(v14 + 76), v17);
  sub_2496BABE8();
  sub_24969A7E4(a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
}

double IntelligenceSupportAgent.RequestParameters.timeout.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void IntelligenceSupportAgent.RequestParameters.timeout.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.timeout.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.targetedAppProcesses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t IntelligenceSupportAgent.RequestParameters.targetedAppProcesses.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.targetedAppProcesses.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.excludedAppProcesses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t IntelligenceSupportAgent.RequestParameters.excludedAppProcesses.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.excludedAppProcesses.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.excludedAppBundleIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t IntelligenceSupportAgent.RequestParameters.excludedAppBundleIdentifiers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.excludedAppBundleIdentifiers.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.pruneEmptyElements.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t IntelligenceSupportAgent.RequestParameters.pruneEmptyElements.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = result;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.pruneEmptyElements.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeVisibleElementsOnly.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeVisibleElementsOnly.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 33) = result;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.includeVisibleElementsOnly.modify())()
{
  return nullsub_1;
}

double IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.windowFractionVisible.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.windowFractionVisible.setter(double a1)
{
  double *v1;

  *v1 = a1;
  if (a1 < 0.0 || a1 > 1.0)
    __break(1u);
}

double **(*IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.windowFractionVisible.modify(_QWORD *a1))(double **result, char a2)
{
  uint64_t v1;

  *a1 = v1;
  return sub_24969DA08;
}

double **sub_24969DA08(double **result, char a2)
{
  double v2;

  if ((a2 & 1) == 0)
  {
    v2 = **result;
    if (v2 < 0.0 || v2 > 1.0)
      __break(1u);
  }
  return result;
}

double IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.windowAreaVisible.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.windowAreaVisible.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
  if (a1 < 0.0)
    __break(1u);
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.windowAreaVisible.modify(_QWORD *a1))(uint64_t result, char a2)
{
  uint64_t v1;

  *a1 = v1;
  return sub_24969DA5C;
}

uint64_t sub_24969DA5C(uint64_t result, char a2)
{
  if ((a2 & 1) == 0 && *(double *)(*(_QWORD *)result + 8) < 0.0)
    __break(1u);
  return result;
}

double IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.fractionVisible.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.fractionVisible.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 16) = a1;
  if (a1 < 0.0 || a1 > 1.0)
    __break(1u);
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.fractionVisible.modify(_QWORD *a1))(uint64_t result, char a2)
{
  uint64_t v1;

  *a1 = v1;
  return sub_24969DAB0;
}

uint64_t sub_24969DAB0(uint64_t result, char a2)
{
  double v2;

  if ((a2 & 1) == 0)
  {
    v2 = *(double *)(*(_QWORD *)result + 16);
    if (v2 < 0.0 || v2 > 1.0)
      __break(1u);
  }
  return result;
}

double IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.areaVisible.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

void IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.areaVisible.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 24) = a1;
  if (a1 < 0.0)
    __break(1u);
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.areaVisible.modify(_QWORD *a1))(uint64_t result, char a2)
{
  uint64_t v1;

  *a1 = v1;
  return sub_24969DB04;
}

uint64_t sub_24969DB04(uint64_t result, char a2)
{
  if ((a2 & 1) == 0 && *(double *)(*(_QWORD *)result + 24) < 0.0)
    __break(1u);
  return result;
}

double sub_24969DB20()
{
  double result;

  result = 0.0;
  xmmword_257876998 = 0u;
  unk_2578769A8 = 0u;
  return result;
}

double static IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.zero.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  if (qword_2578764D0 != -1)
    swift_once();
  result = *(double *)&xmmword_257876998;
  v3 = unk_2578769A8;
  *a1 = xmmword_257876998;
  a1[1] = v3;
  return result;
}

uint64_t sub_24969DB8C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24969DBC4 + 4 * byte_2496BC860[*v0]))(0xD000000000000015, 0x80000002496C0390);
}

unint64_t sub_24969DBC4()
{
  return 0xD000000000000011;
}

uint64_t sub_24969DBE0()
{
  return 0x6E6F697463617266;
}

uint64_t sub_24969DC04()
{
  return 0x6973695661657261;
}

uint64_t sub_24969DC24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2496A4C24(a1, a2);
  *a3 = result;
  return result;
}

void sub_24969DC48(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24969DC54()
{
  sub_2496A34DC();
  return sub_2496BB3EC();
}

uint64_t sub_24969DC7C()
{
  sub_2496A34DC();
  return sub_2496BB3F8();
}

uint64_t IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578769B8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2496A34DC();
  sub_2496BB3E0();
  v8[15] = 0;
  sub_2496BB32C();
  if (!v1)
  {
    v8[14] = 1;
    sub_2496BB32C();
    v8[13] = 2;
    sub_2496BB32C();
    v8[12] = 3;
    sub_2496BB32C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578769C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2496A34DC();
  sub_2496BB3D4();
  if (!v2)
  {
    v22 = 0;
    sub_2496BB2D8();
    v10 = v9;
    v21 = 1;
    sub_2496BB2D8();
    v12 = v11;
    v20 = 2;
    sub_2496BB2D8();
    v15 = v14;
    v19 = 3;
    sub_2496BB2D8();
    v17 = v16;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
    a2[1] = v12;
    a2[2] = v15;
    a2[3] = v17;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_24969DFC8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.init(from:)(a1, a2);
}

uint64_t sub_24969DFDC(_QWORD *a1)
{
  return IntelligenceSupportAgent.RequestParameters.VisibilityThresholds.encode(to:)(a1);
}

__n128 IntelligenceSupportAgent.RequestParameters.visibilityThresholds.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 + 40);
  v3 = *(_OWORD *)(v1 + 56);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 IntelligenceSupportAgent.RequestParameters.visibilityThresholds.setter(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 40) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 56) = v3;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.visibilityThresholds.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeGeometry.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeGeometry.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 72) = result;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.includeGeometry.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeCustomTypeNames.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 73);
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeCustomTypeNames.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 73) = result;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.includeCustomTypeNames.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeAccessibilityProperties.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 74);
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeAccessibilityProperties.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 74) = result;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.includeAccessibilityProperties.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeAppEntities.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 75);
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeAppEntities.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 75) = result;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.includeAppEntities.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeAppIntents.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 76);
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeAppIntents.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 76) = result;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.includeAppIntents.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeAppIntentsPayloadDebugDescription.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 77);
}

uint64_t IntelligenceSupportAgent.RequestParameters.includeAppIntentsPayloadDebugDescription.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 77) = result;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.includeAppIntentsPayloadDebugDescription.modify())()
{
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.textOptions.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for IntelligenceSupportAgent.RequestParameters() + 68);
  v4 = sub_2496BAB28();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t IntelligenceSupportAgent.RequestParameters.textOptions.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for IntelligenceSupportAgent.RequestParameters() + 68);
  v4 = sub_2496BAB28();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.textOptions.modify())()
{
  type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  return nullsub_1;
}

uint64_t sub_24969E19C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t IntelligenceSupportAgent.RequestParameters.requestedComponents.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  *a1 = *(_QWORD *)(v1 + *(int *)(result + 72));
  return result;
}

uint64_t IntelligenceSupportAgent.RequestParameters.requestedComponents.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  *(_QWORD *)(v1 + *(int *)(result + 72)) = v2;
  return result;
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.requestedComponents.modify())()
{
  type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  return nullsub_1;
}

uint64_t IntelligenceSupportAgent.RequestParameters.Components.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t IntelligenceSupportAgent.RequestParameters.Components.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static IntelligenceSupportAgent.RequestParameters.Components.elements.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static IntelligenceSupportAgent.RequestParameters.Components.commands.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

uint64_t IntelligenceSupportAgent.RequestParameters.Components.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  __int128 v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v20;

  v1 = *v0;
  v2 = MEMORY[0x24BEE4AF8];
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if ((*v0 & 1) != 0)
  {
    v20 = (_QWORD *)MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_2496A2C78(0, 1, 1);
    v3 = v20;
    v5 = v20[2];
    v4 = v20[3];
    if (v5 >= v4 >> 1)
    {
      sub_2496A2C78(v4 > 1, v5 + 1, 1);
      v3 = v20;
    }
    v3[2] = v5 + 1;
    v6 = &v3[3 * v5];
    *((_OWORD *)v6 + 2) = xmmword_251AA1E58;
    v6[6] = 0xE800000000000000;
  }
  if ((~v1 & 2) != 0)
  {
    v9 = v3[2];
    if (!v9)
      goto LABEL_16;
  }
  else
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_2496A2C78(0, v3[2] + 1, 1);
    v8 = v3[2];
    v7 = v3[3];
    v9 = v8 + 1;
    v10 = xmmword_251AA1E70;
    if (v8 >= v7 >> 1)
    {
      sub_2496A2C78(v7 > 1, v8 + 1, 1);
      v10 = xmmword_251AA1E70;
    }
    v3[2] = v9;
    v11 = &v3[3 * v8];
    *((_OWORD *)v11 + 2) = v10;
    v11[6] = 0xE800000000000000;
  }
  sub_2496A2C5C(0, v9, 0);
  v12 = v2;
  v13 = v3 + 6;
  do
  {
    v15 = *(v13 - 1);
    v14 = *v13;
    v17 = *(_QWORD *)(v12 + 16);
    v16 = *(_QWORD *)(v12 + 24);
    swift_bridgeObjectRetain();
    if (v17 >= v16 >> 1)
      sub_2496A2C5C(v16 > 1, v17 + 1, 1);
    *(_QWORD *)(v12 + 16) = v17 + 1;
    v18 = v12 + 16 * v17;
    *(_QWORD *)(v18 + 32) = v15;
    *(_QWORD *)(v18 + 40) = v14;
    v13 += 3;
    --v9;
  }
  while (v9);
LABEL_16:
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEC0);
  sub_24969D540();
  sub_2496BAEC4();
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  return 0x6E656E6F706D6F43;
}

_QWORD *sub_24969E548@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24969E554()
{
  sub_2496A396C();
  return sub_2496BAF84();
}

uint64_t sub_24969E5B0()
{
  sub_2496A396C();
  return sub_2496BAF78();
}

uint64_t sub_24969E5FC()
{
  sub_2496BB3B0();
  sub_2496BB3BC();
  return sub_2496BB3C8();
}

uint64_t sub_24969E640()
{
  return sub_2496BB3BC();
}

uint64_t sub_24969E668()
{
  sub_2496BB3B0();
  sub_2496BB3BC();
  return sub_2496BB3C8();
}

void sub_24969E6AC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_24969E6B4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_24969E6C8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_24969E6DC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_24969E6F0(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_24969E720@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_24969E74C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_24969E770(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

uint64_t type metadata accessor for IntelligenceSupportAgent.RequestParameters()
{
  uint64_t result;

  result = qword_2544AFE00;
  if (!qword_2544AFE00)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *sub_24969E7C0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_24969E7D4(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_24969E7E8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_24969E7FC(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_24969E810(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_24969E824(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_24969E838()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_24969E848()
{
  return sub_2496BB164();
}

_QWORD *sub_24969E860(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_24969E874@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t IntelligenceSupportAgent.RequestParameters.commandOptions.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for IntelligenceSupportAgent.RequestParameters() + 76);
  v4 = sub_2496BABDC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t IntelligenceSupportAgent.RequestParameters.commandOptions.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for IntelligenceSupportAgent.RequestParameters() + 76);
  v4 = sub_2496BABDC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*IntelligenceSupportAgent.RequestParameters.commandOptions.modify())()
{
  type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  return nullsub_1;
}

uint64_t sub_24969E944(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t i;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;

  v4 = sub_2496BAB10();
  v40 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v33 - v9;
  result = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v33 - v12;
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v14 = 0;
  v15 = *(_QWORD *)(a1 + 56);
  v34 = a1;
  v35 = a1 + 56;
  v16 = 1 << *(_BYTE *)(a1 + 32);
  if (v16 < 64)
    v17 = ~(-1 << v16);
  else
    v17 = -1;
  v18 = v17 & v15;
  v36 = (unint64_t)(v16 + 63) >> 6;
  v39 = a2 + 56;
  v33 = (char *)&v33 - v12;
  if (!v18)
    goto LABEL_9;
LABEL_7:
  v37 = (v18 - 1) & v18;
  v38 = v14;
  for (i = __clz(__rbit64(v18)) | (v14 << 6); ; i = __clz(__rbit64(v21)) + (v22 << 6))
  {
    v24 = v40;
    v25 = *(_QWORD *)(v40 + 72);
    v26 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 16);
    v26(v13, *(_QWORD *)(a1 + 48) + v25 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v10, v13, v4);
    sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
    v27 = sub_2496BAEAC();
    v28 = -1 << *(_BYTE *)(a2 + 32);
    v29 = v27 & ~v28;
    if (((*(_QWORD *)(v39 + ((v29 >> 3) & 0xFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v4);
      return 0;
    }
    v30 = ~v28;
    while (1)
    {
      v26(v7, *(_QWORD *)(a2 + 48) + v29 * v25, v4);
      sub_24968BDD4((unint64_t *)&unk_2544AFD00, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB8]);
      v31 = sub_2496BAED0();
      v32 = *(void (**)(char *, uint64_t))(v40 + 8);
      v32(v7, v4);
      if ((v31 & 1) != 0)
        break;
      v29 = (v29 + 1) & v30;
      if (((*(_QWORD *)(v39 + ((v29 >> 3) & 0xFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
      {
        v32(v10, v4);
        return 0;
      }
    }
    result = ((uint64_t (*)(char *, uint64_t))v32)(v10, v4);
    v13 = v33;
    a1 = v34;
    v18 = v37;
    v14 = v38;
    if (v37)
      goto LABEL_7;
LABEL_9:
    v20 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v20 >= v36)
      return 1;
    v21 = *(_QWORD *)(v35 + 8 * v20);
    v22 = v14 + 1;
    if (!v21)
    {
      v22 = v20 + 1;
      if (v20 + 1 >= v36)
        return 1;
      v21 = *(_QWORD *)(v35 + 8 * v22);
      if (!v21)
      {
        v22 = v20 + 2;
        if (v20 + 2 >= v36)
          return 1;
        v21 = *(_QWORD *)(v35 + 8 * v22);
        if (!v21)
        {
          v22 = v20 + 3;
          if (v20 + 3 >= v36)
            return 1;
          v21 = *(_QWORD *)(v35 + 8 * v22);
          if (!v21)
            break;
        }
      }
    }
LABEL_24:
    v37 = (v21 - 1) & v21;
    v38 = v22;
  }
  v23 = v20 + 4;
  if (v23 >= v36)
    return 1;
  v21 = *(_QWORD *)(v35 + 8 * v23);
  if (v21)
  {
    v22 = v23;
    goto LABEL_24;
  }
  while (1)
  {
    v22 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v22 >= v36)
      return 1;
    v21 = *(_QWORD *)(v35 + 8 * v22);
    ++v23;
    if (v21)
      goto LABEL_24;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_24969ECB4(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
        {
          v12 = v3 + 4;
          if (v3 + 4 >= v30)
            return 1;
          v11 = *(_QWORD *)(v29 + 8 * v12);
          if (!v11)
            break;
        }
      }
    }
LABEL_25:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    sub_2496BB3B0();
    swift_bridgeObjectRetain();
    sub_2496BAF30();
    v18 = sub_2496BB3C8();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_41;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_2496BB380() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_2496BB380() & 1) != 0)
          goto LABEL_7;
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 5;
  if (v3 + 5 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_25;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_24969EF54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t i;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;

  v4 = sub_2496BAA8C();
  v40 = *(_QWORD *)(v4 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v33 - v9;
  result = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v33 - v12;
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v14 = 0;
  v15 = *(_QWORD *)(a1 + 56);
  v34 = a1;
  v35 = a1 + 56;
  v16 = 1 << *(_BYTE *)(a1 + 32);
  if (v16 < 64)
    v17 = ~(-1 << v16);
  else
    v17 = -1;
  v18 = v17 & v15;
  v36 = (unint64_t)(v16 + 63) >> 6;
  v39 = a2 + 56;
  v33 = (char *)&v33 - v12;
  if (!v18)
    goto LABEL_9;
LABEL_7:
  v37 = (v18 - 1) & v18;
  v38 = v14;
  for (i = __clz(__rbit64(v18)) | (v14 << 6); ; i = __clz(__rbit64(v21)) + (v22 << 6))
  {
    v24 = v40;
    v25 = *(_QWORD *)(v40 + 72);
    v26 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 16);
    v26(v13, *(_QWORD *)(a1 + 48) + v25 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v10, v13, v4);
    sub_24968BDD4(&qword_2544AFCC0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20], MEMORY[0x24BEBBA30]);
    v27 = sub_2496BAEAC();
    v28 = -1 << *(_BYTE *)(a2 + 32);
    v29 = v27 & ~v28;
    if (((*(_QWORD *)(v39 + ((v29 >> 3) & 0xFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v4);
      return 0;
    }
    v30 = ~v28;
    while (1)
    {
      v26(v7, *(_QWORD *)(a2 + 48) + v29 * v25, v4);
      sub_24968BDD4(&qword_257876AC0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20], MEMORY[0x24BEBBA38]);
      v31 = sub_2496BAED0();
      v32 = *(void (**)(char *, uint64_t))(v40 + 8);
      v32(v7, v4);
      if ((v31 & 1) != 0)
        break;
      v29 = (v29 + 1) & v30;
      if (((*(_QWORD *)(v39 + ((v29 >> 3) & 0xFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
      {
        v32(v10, v4);
        return 0;
      }
    }
    result = ((uint64_t (*)(char *, uint64_t))v32)(v10, v4);
    v13 = v33;
    a1 = v34;
    v18 = v37;
    v14 = v38;
    if (v37)
      goto LABEL_7;
LABEL_9:
    v20 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v20 >= v36)
      return 1;
    v21 = *(_QWORD *)(v35 + 8 * v20);
    v22 = v14 + 1;
    if (!v21)
    {
      v22 = v20 + 1;
      if (v20 + 1 >= v36)
        return 1;
      v21 = *(_QWORD *)(v35 + 8 * v22);
      if (!v21)
      {
        v22 = v20 + 2;
        if (v20 + 2 >= v36)
          return 1;
        v21 = *(_QWORD *)(v35 + 8 * v22);
        if (!v21)
        {
          v22 = v20 + 3;
          if (v20 + 3 >= v36)
            return 1;
          v21 = *(_QWORD *)(v35 + 8 * v22);
          if (!v21)
            break;
        }
      }
    }
LABEL_24:
    v37 = (v21 - 1) & v21;
    v38 = v22;
  }
  v23 = v20 + 4;
  if (v23 >= v36)
    return 1;
  v21 = *(_QWORD *)(v35 + 8 * v23);
  if (v21)
  {
    v22 = v23;
    goto LABEL_24;
  }
  while (1)
  {
    v22 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v22 >= v36)
      return 1;
    v21 = *(_QWORD *)(v35 + 8 * v22);
    ++v23;
    if (v21)
      goto LABEL_24;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_24969F2C4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24969F2F8 + 4 * byte_2496BC864[a1]))(0x74756F656D6974, 0xE700000000000000);
}

unint64_t sub_24969F2F8()
{
  return 0xD000000000000014;
}

uint64_t sub_24969F374()
{
  return 0x476564756C636E69;
}

unint64_t sub_24969F398()
{
  return 0xD000000000000016;
}

unint64_t sub_24969F3B0()
{
  return 0xD00000000000001ELL;
}

unint64_t sub_24969F3CC()
{
  return 0xD000000000000012;
}

unint64_t sub_24969F3E4()
{
  return 0xD000000000000011;
}

unint64_t sub_24969F3FC()
{
  return 0xD000000000000028;
}

uint64_t sub_24969F414()
{
  return 0x6974704F74786574;
}

void sub_24969F434()
{
  JUMPOUT(0x24969F448);
}

uint64_t sub_24969F454()
{
  return 0x4F646E616D6D6F63;
}

uint64_t sub_24969F478()
{
  unsigned __int8 *v0;

  return sub_24969F2C4(*v0);
}

uint64_t sub_24969F480@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2496A4E0C(a1, a2);
  *a3 = result;
  return result;
}

void sub_24969F4A4(_BYTE *a1@<X8>)
{
  *a1 = 16;
}

uint64_t sub_24969F4B0()
{
  sub_2496A36D4();
  return sub_2496BB3EC();
}

uint64_t sub_24969F4D8()
{
  sub_2496A36D4();
  return sub_2496BB3F8();
}

uint64_t IntelligenceSupportAgent.RequestParameters.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  _OWORD v12[2];
  char v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578769D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2496A36D4();
  sub_2496BB3E0();
  LOBYTE(v12[0]) = 0;
  sub_2496BB32C();
  if (!v2)
  {
    *(_QWORD *)&v12[0] = *(_QWORD *)(v3 + 8);
    v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578769E0);
    sub_2496A37A0(&qword_2578769E8, &qword_2578767D8, MEMORY[0x24BEBBAA8], MEMORY[0x24BEE1700]);
    sub_2496BB314();
    *(_QWORD *)&v12[0] = *(_QWORD *)(v3 + 16);
    v13 = 2;
    sub_2496BB344();
    *(_QWORD *)&v12[0] = *(_QWORD *)(v3 + 24);
    v13 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578769F0);
    sub_2496A3824(&qword_2578769F8, MEMORY[0x24BEE0D08], MEMORY[0x24BEE1700]);
    sub_2496BB344();
    LOBYTE(v12[0]) = 4;
    sub_2496BB320();
    LOBYTE(v12[0]) = 5;
    sub_2496BB320();
    v9 = *(_OWORD *)(v3 + 56);
    v12[0] = *(_OWORD *)(v3 + 40);
    v12[1] = v9;
    v13 = 6;
    sub_2496A3718();
    sub_2496BB344();
    LOBYTE(v12[0]) = 7;
    sub_2496BB320();
    LOBYTE(v12[0]) = 8;
    sub_2496BB320();
    LOBYTE(v12[0]) = 9;
    sub_2496BB320();
    LOBYTE(v12[0]) = 10;
    sub_2496BB320();
    LOBYTE(v12[0]) = 11;
    sub_2496BB320();
    LOBYTE(v12[0]) = 12;
    sub_2496BB320();
    v10 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
    LOBYTE(v12[0]) = 13;
    sub_2496BAB28();
    sub_24968BDD4(&qword_257876A08, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBAE0], MEMORY[0x24BEBBAF0]);
    sub_2496BB344();
    *(_QWORD *)&v12[0] = *(_QWORD *)(v3 + *(int *)(v10 + 72));
    v13 = 14;
    sub_2496A375C();
    sub_2496BB344();
    LOBYTE(v12[0]) = 15;
    sub_2496BABDC();
    sub_24968BDD4(&qword_257876A18, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBB98], MEMORY[0x24BEBBBA8]);
    sub_2496BB344();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t IntelligenceSupportAgent.RequestParameters.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
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
  char *v37;
  _QWORD *v38;
  __int128 v39;
  __int128 v40;
  char v41;

  v29 = a2;
  v31 = sub_2496BABDC();
  v28 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v30 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_2496BAB28();
  v32 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v33 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876A20);
  v35 = *(_QWORD *)(v5 - 8);
  v36 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v10 = 0x3FE8000000000000;
  *((_QWORD *)v10 + 1) = 0;
  v11 = MEMORY[0x24BEE4B08];
  *((_QWORD *)v10 + 2) = MEMORY[0x24BEE4B08];
  *((_QWORD *)v10 + 3) = v11;
  v10[32] = sub_2496BAB94() & 1;
  v10[33] = sub_2496BABAC() & 1;
  *(_OWORD *)(v10 + 40) = xmmword_2496BC530;
  *(_OWORD *)(v10 + 56) = xmmword_2496BC540;
  v10[72] = sub_2496BAB70() & 1;
  v10[73] = sub_2496BABA0() & 1;
  v10[74] = sub_2496BABB8() & 1;
  v10[75] = sub_2496BAB88() & 1;
  v10[76] = sub_2496BAB7C() & 1;
  v10[77] = sub_2496BABC4() & 1;
  v12 = &v10[v8[17]];
  sub_2496BAB40();
  v13 = sub_2496BAB64() & 1;
  v14 = sub_2496BAB58();
  v15 = v13 | 2;
  if ((v14 & 1) == 0)
    v15 = v13;
  v16 = v8[18];
  *(_QWORD *)&v10[v16] = v15;
  v17 = &v10[v8[19]];
  sub_2496BAB4C();
  v18 = a1[3];
  v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_2496A36D4();
  v19 = v37;
  sub_2496BB3D4();
  if (v19)
  {
    v24 = (uint64_t)v38;
  }
  else
  {
    v37 = v12;
    v26 = v17;
    v27 = v16;
    LOBYTE(v39) = 0;
    sub_2496BB2D8();
    *(_QWORD *)v10 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578769E0);
    v41 = 1;
    sub_2496A37A0(&qword_257876A28, &qword_2578767C8, MEMORY[0x24BEBBAC0], MEMORY[0x24BEE1720]);
    sub_2496BB2C0();
    *((_QWORD *)v10 + 1) = v39;
    v41 = 2;
    sub_2496BB2F0();
    *((_QWORD *)v10 + 2) = v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578769F0);
    v41 = 3;
    sub_2496A3824(&qword_257876A30, MEMORY[0x24BEE0D38], MEMORY[0x24BEE1720]);
    sub_2496BB2F0();
    *((_QWORD *)v10 + 3) = v39;
    LOBYTE(v39) = 4;
    v10[32] = sub_2496BB2CC() & 1;
    LOBYTE(v39) = 5;
    v10[33] = sub_2496BB2CC() & 1;
    v41 = 6;
    sub_2496A3884();
    sub_2496BB2F0();
    v22 = v40;
    *(_OWORD *)(v10 + 40) = v39;
    *(_OWORD *)(v10 + 56) = v22;
    LOBYTE(v39) = 7;
    v10[72] = sub_2496BB2CC() & 1;
    LOBYTE(v39) = 8;
    v10[73] = sub_2496BB2CC() & 1;
    LOBYTE(v39) = 9;
    v10[74] = sub_2496BB2CC() & 1;
    LOBYTE(v39) = 10;
    v10[75] = sub_2496BB2CC() & 1;
    LOBYTE(v39) = 11;
    v10[76] = sub_2496BB2CC() & 1;
    LOBYTE(v39) = 12;
    v10[77] = sub_2496BB2CC() & 1;
    LOBYTE(v39) = 13;
    sub_24968BDD4(&qword_257876A40, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBAE0], MEMORY[0x24BEBBB00]);
    sub_2496BB2F0();
    (*(void (**)(char *, char *, uint64_t))(v32 + 40))(v37, v33, v34);
    v41 = 14;
    sub_2496A38C8();
    sub_2496BB2F0();
    *(_QWORD *)&v10[v27] = v39;
    LOBYTE(v39) = 15;
    sub_24968BDD4(&qword_257876A50, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBB98], MEMORY[0x24BEBBBB8]);
    v23 = v36;
    sub_2496BB2F0();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v23);
    v24 = (uint64_t)v38;
    (*(void (**)(char *, char *, uint64_t))(v28 + 40))(v26, v30, v31);
    sub_2496A390C((uint64_t)v10, v29);
  }
  __swift_destroy_boxed_opaque_existential_1Tm(v24);
  return sub_24969A7E4((uint64_t)v10);
}

uint64_t sub_2496A0060@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return IntelligenceSupportAgent.RequestParameters.init(from:)(a1, a2);
}

uint64_t sub_2496A0074(_QWORD *a1)
{
  return IntelligenceSupportAgent.RequestParameters.encode(to:)(a1);
}

uint64_t static IntelligenceSupportAgent.RequestParameters.debugPresets(verbose:)@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t result;

  *(_QWORD *)a2 = 0x3FE8000000000000;
  *(_QWORD *)(a2 + 8) = 0;
  v4 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a2 + 16) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a2 + 24) = v4;
  *(_BYTE *)(a2 + 32) = sub_2496BAB94() & 1;
  *(_BYTE *)(a2 + 33) = sub_2496BABAC() & 1;
  *(_OWORD *)(a2 + 40) = xmmword_2496BC530;
  *(_OWORD *)(a2 + 56) = xmmword_2496BC540;
  *(_BYTE *)(a2 + 72) = sub_2496BAB70() & 1;
  *(_BYTE *)(a2 + 73) = sub_2496BABA0() & 1;
  *(_BYTE *)(a2 + 74) = sub_2496BABB8() & 1;
  *(_BYTE *)(a2 + 75) = sub_2496BAB88() & 1;
  *(_BYTE *)(a2 + 76) = sub_2496BAB7C() & 1;
  sub_2496BABC4();
  v5 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  sub_2496BAB40();
  v6 = sub_2496BAB64() & 1;
  v7 = sub_2496BAB58();
  v8 = v6 | 2;
  if ((v7 & 1) == 0)
    v8 = v6;
  *(_QWORD *)(a2 + *(int *)(v5 + 72)) = v8;
  result = sub_2496BAB4C();
  *(_BYTE *)(a2 + 77) = 1;
  if ((a1 & 1) != 0)
  {
    *(_BYTE *)(a2 + 32) = 0;
    *(_BYTE *)(a2 + 73) = 1;
  }
  return result;
}

uint64_t static IntelligenceSupportAgent.RequestParameters.debugCustomParsed(arguments:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  unint64_t v13;

  *(_QWORD *)a2 = 0x3FE8000000000000;
  *(_QWORD *)(a2 + 8) = 0;
  v4 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a2 + 16) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a2 + 24) = v4;
  *(_BYTE *)(a2 + 32) = sub_2496BAB94() & 1;
  *(_BYTE *)(a2 + 33) = sub_2496BABAC() & 1;
  *(_OWORD *)(a2 + 40) = xmmword_2496BC530;
  *(_OWORD *)(a2 + 56) = xmmword_2496BC540;
  *(_BYTE *)(a2 + 72) = sub_2496BAB70() & 1;
  *(_BYTE *)(a2 + 73) = sub_2496BABA0() & 1;
  *(_BYTE *)(a2 + 74) = sub_2496BABB8() & 1;
  *(_BYTE *)(a2 + 75) = sub_2496BAB88() & 1;
  *(_BYTE *)(a2 + 76) = sub_2496BAB7C() & 1;
  sub_2496BABC4();
  v5 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  sub_2496BAB40();
  v6 = sub_2496BAB64() & 1;
  v7 = sub_2496BAB58();
  v8 = v6 | 2;
  if ((v7 & 1) == 0)
    v8 = v6;
  *(_QWORD *)(a2 + *(int *)(v5 + 72)) = v8;
  result = sub_2496BAB4C();
  *(_BYTE *)(a2 + 77) = 1;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    v11 = (unint64_t *)(a1 + 40);
    do
    {
      v12 = *(v11 - 1);
      v13 = *v11;
      swift_bridgeObjectRetain();
      sub_2496A02FC(v12, v13);
      swift_bridgeObjectRelease();
      v11 += 2;
      --v10;
    }
    while (v10);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_2496A02FC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unsigned __int8 v24;
  uint64_t v25;
  char v26;
  double v27;
  uint64_t v28;
  char v29;
  double v30;
  uint64_t v31;
  char v32;
  double v33;
  uint64_t v34;
  char v35;
  double v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  unsigned __int8 v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  unsigned __int8 v48;
  char v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  _QWORD v54[3];
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];

  v3 = v2;
  v55 = 61;
  v56 = 0xE100000000000000;
  v54[2] = &v55;
  swift_bridgeObjectRetain();
  v6 = sub_2496A1D90(0x7FFFFFFFFFFFFFFFLL, 1, sub_2496A547C, (uint64_t)v54, a1, a2);
  v7 = v6;
  v8 = *(_QWORD *)(v6 + 16);
  if (!v8)
    goto LABEL_10;
  v9 = v6 + 32;
  swift_bridgeObjectRetain();
  v10 = sub_2496BB128();
  v12 = v11;
  swift_bridgeObjectRelease();
  if (v8 > *(_QWORD *)(v7 + 16))
  {
    __break(1u);
    goto LABEL_10;
  }
  v13 = v9 + 32 * v8;
  v15 = *(_QWORD *)(v13 - 32);
  v14 = *(_QWORD *)(v13 - 24);
  v17 = *(_QWORD *)(v13 - 16);
  v16 = *(_QWORD *)(v13 - 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "timeout");
  v59[1] = 0xE700000000000000;
  sub_2496A54D0();
  if ((sub_2496BB158() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v18 = sub_2496BAFE4();
    if ((v19 & 1) == 0)
    {
      v20 = v18;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)v3 = v20;
      return;
    }
  }
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "excluded");
  BYTE1(v59[1]) = 0;
  WORD1(v59[1]) = 0;
  HIDWORD(v59[1]) = -402653184;
  if ((sub_2496BB158() & 1) != 0)
  {
    v55 = v10;
    v56 = v12;
    v59[0] = 7368801;
    v59[1] = 0xE300000000000000;
    if ((sub_2496BB158() & 1) != 0
      || (v55 = v10, v56 = v12, v59[0] = 0x656C646E7562, v59[1] = 0xE600000000000000, (sub_2496BB158() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      v55 = v15;
      v56 = v14;
      v57 = v17;
      v58 = v16;
      v59[0] = 44;
      v59[1] = 0xE100000000000000;
      sub_2496A5514();
      v21 = sub_2496BB14C();
      swift_bridgeObjectRelease();
      v22 = sub_2496BA278(v21);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v3 + 24) = v22;
      return;
    }
  }
  v55 = v10;
  v56 = v12;
  v59[0] = 0x656E757270;
  v59[1] = 0xE500000000000000;
  if ((sub_2496BB158() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v23 = (void *)sub_2496BB11C();
    swift_bridgeObjectRelease();
    v24 = objc_msgSend(v23, sel_BOOLValue);

    *(_BYTE *)(v3 + 32) = v24;
    return;
  }
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "windowfraction");
  HIBYTE(v59[1]) = -18;
  if ((sub_2496BB158() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v25 = sub_2496BAFE4();
    if ((v26 & 1) == 0)
    {
      v27 = *(double *)&v25;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(double *)(v3 + 40) = v27;
      if (v27 >= 0.0 && v27 <= 1.0)
        return;
      __break(1u);
    }
  }
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "windowarea");
  BYTE3(v59[1]) = 0;
  HIDWORD(v59[1]) = -369098752;
  if ((sub_2496BB158() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v28 = sub_2496BAFE4();
    if ((v29 & 1) == 0)
    {
      v30 = *(double *)&v28;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(double *)(v3 + 48) = v30;
      if (v30 >= 0.0)
        return;
      __break(1u);
    }
  }
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "fraction");
  BYTE1(v59[1]) = 0;
  WORD1(v59[1]) = 0;
  HIDWORD(v59[1]) = -402653184;
  if ((sub_2496BB158() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v31 = sub_2496BAFE4();
    if ((v32 & 1) == 0)
    {
      v33 = *(double *)&v31;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(double *)(v3 + 56) = v33;
      if (v33 >= 0.0 && v33 <= 1.0)
        return;
      __break(1u);
    }
  }
  v55 = v10;
  v56 = v12;
  v59[0] = 1634038369;
  v59[1] = 0xE400000000000000;
  if ((sub_2496BB158() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v34 = sub_2496BAFE4();
    if ((v35 & 1) == 0)
    {
      v36 = *(double *)&v34;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(double *)(v3 + 64) = v36;
      if (v36 >= 0.0)
        return;
      __break(1u);
    }
  }
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "visible");
  v59[1] = 0xE700000000000000;
  if ((sub_2496BB158() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v37 = (void *)sub_2496BB11C();
    swift_bridgeObjectRelease();
    v38 = objc_msgSend(v37, sel_BOOLValue);

    *(_BYTE *)(v3 + 33) = v38;
    return;
  }
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "geometry");
  BYTE1(v59[1]) = 0;
  WORD1(v59[1]) = 0;
  HIDWORD(v59[1]) = -402653184;
  if ((sub_2496BB158() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v39 = (void *)sub_2496BB11C();
    swift_bridgeObjectRelease();
    v40 = objc_msgSend(v39, sel_BOOLValue);

    *(_BYTE *)(v3 + 72) = v40;
    return;
  }
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "customtype");
  BYTE3(v59[1]) = 0;
  HIDWORD(v59[1]) = -369098752;
  if ((sub_2496BB158() & 1) != 0
    || (v55 = v10,
        v56 = v12,
        strcpy((char *)v59, "typename"),
        BYTE1(v59[1]) = 0,
        WORD1(v59[1]) = 0,
        HIDWORD(v59[1]) = -402653184,
        (sub_2496BB158() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    v41 = (void *)sub_2496BB11C();
    swift_bridgeObjectRelease();
    v42 = objc_msgSend(v41, sel_BOOLValue);

    *(_BYTE *)(v3 + 73) = v42;
    return;
  }
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "accessibility");
  HIWORD(v59[1]) = -4864;
  if ((sub_2496BB158() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v43 = (void *)sub_2496BB11C();
    swift_bridgeObjectRelease();
    v44 = objc_msgSend(v43, sel_BOOLValue);

    *(_BYTE *)(v3 + 74) = v44;
    return;
  }
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "appentities");
  HIDWORD(v59[1]) = -352321536;
  if ((sub_2496BB158() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v45 = (void *)sub_2496BB11C();
    swift_bridgeObjectRelease();
    v46 = objc_msgSend(v45, sel_BOOLValue);

    *(_BYTE *)(v3 + 75) = v46;
    return;
  }
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "appintents");
  BYTE3(v59[1]) = 0;
  HIDWORD(v59[1]) = -369098752;
  if ((sub_2496BB158() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v47 = (void *)sub_2496BB11C();
    swift_bridgeObjectRelease();
    v48 = objc_msgSend(v47, sel_BOOLValue);

    *(_BYTE *)(v3 + 76) = v48;
    return;
  }
  v55 = v10;
  v56 = v12;
  strcpy((char *)v59, "components");
  BYTE3(v59[1]) = 0;
  HIDWORD(v59[1]) = -369098752;
  v49 = sub_2496BB158();
  swift_bridgeObjectRelease();
  if ((v49 & 1) == 0)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return;
  }
  v55 = v15;
  v56 = v14;
  v57 = v17;
  v58 = v16;
  v59[0] = 44;
  v59[1] = 0xE100000000000000;
  sub_2496A5514();
  v50 = (_QWORD *)sub_2496BB14C();
  swift_bridgeObjectRelease();
  v51 = *(int *)(type metadata accessor for IntelligenceSupportAgent.RequestParameters() + 72);
  *(_QWORD *)(v3 + v51) = 0;
  if ((sub_2496A0D08(0x73746E656D656C65, 0xE800000000000000, v50) & 1) != 0)
  {
    *(_QWORD *)(v3 + v51) = 1;
    v52 = 3;
  }
  else
  {
    v52 = 2;
  }
  v53 = sub_2496A0D08(0x73646E616D6D6F63, 0xE800000000000000, v50);
  swift_bridgeObjectRelease();
  if ((v53 & 1) != 0)
    *(_QWORD *)(v3 + v51) = v52;
}

uint64_t sub_2496A0D08(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_2496BB380();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_2496BB380() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_2496A0DCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v0 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  __swift_allocate_value_buffer(v0, qword_2544AFDE0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2544AFDE0);
  *(_QWORD *)v1 = 0x3FE8000000000000;
  *(_QWORD *)(v1 + 8) = 0;
  v2 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v1 + 16) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v1 + 24) = v2;
  *(_BYTE *)(v1 + 32) = sub_2496BAB94() & 1;
  *(_BYTE *)(v1 + 33) = sub_2496BABAC() & 1;
  *(_OWORD *)(v1 + 40) = xmmword_2496BC530;
  *(_OWORD *)(v1 + 56) = xmmword_2496BC540;
  *(_BYTE *)(v1 + 72) = sub_2496BAB70() & 1;
  *(_BYTE *)(v1 + 73) = sub_2496BABA0() & 1;
  *(_BYTE *)(v1 + 74) = sub_2496BABB8() & 1;
  *(_BYTE *)(v1 + 75) = sub_2496BAB88() & 1;
  *(_BYTE *)(v1 + 76) = sub_2496BAB7C() & 1;
  *(_BYTE *)(v1 + 77) = sub_2496BABC4() & 1;
  sub_2496BAB40();
  v3 = sub_2496BAB64() & 1;
  v4 = sub_2496BAB58();
  v5 = v3 | 2;
  if ((v4 & 1) == 0)
    v5 = v3;
  *(_QWORD *)(v1 + *(int *)(v0 + 72)) = v5;
  return sub_2496BAB4C();
}

uint64_t IntelligenceSupportAgent.RequestParameters.description.getter()
{
  _QWORD *v0;
  _QWORD *v1;
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
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float64x2_t v21;
  unint64_t v22;
  unint64_t v23;
  float64x2_t v24;
  unint64_t v25;
  unint64_t v26;
  float64x2_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  float64x2_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  float64x2_t v35;
  unint64_t v36;
  unint64_t v37;
  int v38;
  float64x2_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  unint64_t v46;
  unint64_t v47;
  int v48;
  float64x2_t v49;
  unint64_t v50;
  unint64_t v51;
  int v52;
  float64x2_t v53;
  unint64_t v54;
  unint64_t v55;
  int v56;
  float64x2_t v57;
  unint64_t v58;
  unint64_t v59;
  int v60;
  float64x2_t v61;
  unint64_t v62;
  unint64_t v63;
  int v64;
  float64x2_t v65;
  unint64_t v66;
  unint64_t v67;
  int v68;
  float64x2_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  char *v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  float64x2_t v78;
  unint64_t v79;
  unint64_t v80;
  char v81;
  float64x2_t v82;
  unint64_t v83;
  unint64_t v84;
  float64x2_t v86;
  float64x2_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  float64x2_t v94;
  float64x2_t v95;
  float64x2_t v96;

  v1 = v0;
  v2 = sub_2496BABDC();
  v90 = *(_QWORD *)(v2 - 8);
  v91 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v86 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2496BAB28();
  v93 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v92 = (char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFFD0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2496BBD40;
  v8 = *v0;
  v9 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v7 + 64) = v9;
  *(_QWORD *)(v7 + 32) = v8;
  v10 = sub_2496BAF0C();
  v12 = v11;
  v13 = sub_2496A2384(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v15 = v13[2];
  v14 = v13[3];
  if (v15 >= v14 >> 1)
    v13 = sub_2496A2384((_QWORD *)(v14 > 1), v15 + 1, 1, v13);
  v13[2] = v15 + 1;
  v16 = &v13[2 * v15];
  v16[4] = v10;
  v16[5] = v12;
  v17 = (int *)type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  v18 = v17[18];
  v19 = *(_QWORD *)((char *)v1 + v18);
  if (qword_2544AFDF8 != -1)
    swift_once();
  v89 = v4;
  v20 = __swift_project_value_buffer((uint64_t)v17, (uint64_t)qword_2544AFDE0);
  if (v19 != *(_QWORD *)(v20 + v17[18]))
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v94.f64[0] = -2.31584178e77;
    *(_QWORD *)&v94.f64[1] = 0x80000002496C0190;
    v96.f64[0] = *(float64_t *)((char *)v1 + v18);
    IntelligenceSupportAgent.RequestParameters.Components.description.getter();
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    v21 = v94;
    v23 = v13[2];
    v22 = v13[3];
    if (v23 >= v22 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v22 > 1), v23 + 1, 1, v13);
    v13[2] = v23 + 1;
    *(float64x2_t *)&v13[2 * v23 + 4] = v21;
  }
  if (v1[1])
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v94.f64[0] = -2.31584178e77;
    *(_QWORD *)&v94.f64[1] = 0x80000002496C0370;
    sub_2496BAB10();
    sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
    sub_2496BAFF0();
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    v24 = v94;
    v26 = v13[2];
    v25 = v13[3];
    if (v26 >= v25 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v25 > 1), v26 + 1, 1, v13);
    v13[2] = v26 + 1;
    *(float64x2_t *)&v13[2 * v26 + 4] = v24;
  }
  if (*(_QWORD *)(v1[2] + 16))
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v94.f64[0] = -2.31584178e77;
    *(_QWORD *)&v94.f64[1] = 0x80000002496C01B0;
    sub_2496BAB10();
    sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
    swift_bridgeObjectRetain();
    sub_2496BAFF0();
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v27 = v94;
    v29 = v13[2];
    v28 = v13[3];
    if (v29 >= v28 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v28 > 1), v29 + 1, 1, v13);
    v13[2] = v29 + 1;
    *(float64x2_t *)&v13[2 * v29 + 4] = v27;
  }
  v30 = *(_QWORD *)(v1[3] + 16);
  v88 = v5;
  if (v30)
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v94.f64[0] = -2.31584178e77;
    *(_QWORD *)&v94.f64[1] = 0x80000002496C01D0;
    swift_bridgeObjectRetain();
    sub_2496BAFF0();
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v31 = v94;
    v33 = v13[2];
    v32 = v13[3];
    if (v33 >= v32 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v32 > 1), v33 + 1, 1, v13);
    v13[2] = v33 + 1;
    *(float64x2_t *)&v13[2 * v33 + 4] = v31;
  }
  v34 = *((unsigned __int8 *)v1 + 32);
  if (v34 != *(unsigned __int8 *)(v20 + 32))
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v94.f64[0] = -2.31584178e77;
    *(_QWORD *)&v94.f64[1] = 0x80000002496C01F0;
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    v35 = v94;
    v37 = v13[2];
    v36 = v13[3];
    if (v37 >= v36 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v36 > 1), v37 + 1, 1, v13);
    v13[2] = v37 + 1;
    *(float64x2_t *)&v13[2 * v37 + 4] = v35;
  }
  v38 = *((unsigned __int8 *)v1 + 33);
  if (v38 == *(unsigned __int8 *)(v20 + 33))
  {
    v42 = v88;
    if (!*((_BYTE *)v1 + 33))
      goto LABEL_35;
    goto LABEL_31;
  }
  v94.f64[0] = 0.0;
  v94.f64[1] = -2.68156159e154;
  sub_2496BB1E8();
  swift_bridgeObjectRelease();
  v94.f64[0] = -2.31584178e77;
  *(_QWORD *)&v94.f64[1] = 0x80000002496C0210;
  sub_2496BAF48();
  swift_bridgeObjectRelease();
  v39 = v94;
  v41 = v13[2];
  v40 = v13[3];
  if (v41 >= v40 >> 1)
    v13 = sub_2496A2384((_QWORD *)(v40 > 1), v41 + 1, 1, v13);
  v13[2] = v41 + 1;
  *(float64x2_t *)&v13[2 * v41 + 4] = v39;
  v42 = v88;
  if (v38)
  {
LABEL_31:
    v43 = *(float64x2_t *)(v1 + 5);
    v44 = *(float64x2_t *)(v1 + 7);
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v43, *(float64x2_t *)(v20 + 40)), (int32x4_t)vceqq_f64(v44, *(float64x2_t *)(v20 + 56)))), 0xFuLL))) & 1) == 0)
    {
      v94.f64[0] = 0.0;
      v94.f64[1] = -2.68156159e154;
      v86 = v43;
      v87 = v44;
      sub_2496BB1E8();
      v96 = v94;
      sub_2496BAF48();
      v94 = v86;
      v95 = v87;
      sub_2496BB23C();
      v45 = v96;
      v47 = v13[2];
      v46 = v13[3];
      if (v47 >= v46 >> 1)
        v13 = sub_2496A2384((_QWORD *)(v46 > 1), v47 + 1, 1, v13);
      v13[2] = v47 + 1;
      *(float64x2_t *)&v13[2 * v47 + 4] = v45;
    }
  }
LABEL_35:
  v48 = *((unsigned __int8 *)v1 + 72);
  if (v48 != *(unsigned __int8 *)(v20 + 72))
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v94.f64[0] = -2.31584178e77;
    *(_QWORD *)&v94.f64[1] = 0x80000002496C0230;
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    v49 = v94;
    v51 = v13[2];
    v50 = v13[3];
    if (v51 >= v50 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v50 > 1), v51 + 1, 1, v13);
    v13[2] = v51 + 1;
    *(float64x2_t *)&v13[2 * v51 + 4] = v49;
  }
  v52 = *((unsigned __int8 *)v1 + 73);
  if (v52 != *(unsigned __int8 *)(v20 + 73))
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v94.f64[0] = -2.31584178e77;
    *(_QWORD *)&v94.f64[1] = 0x80000002496C0250;
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    v53 = v94;
    v55 = v13[2];
    v54 = v13[3];
    if (v55 >= v54 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v54 > 1), v55 + 1, 1, v13);
    v13[2] = v55 + 1;
    *(float64x2_t *)&v13[2 * v55 + 4] = v53;
  }
  v56 = *((unsigned __int8 *)v1 + 74);
  if (v56 != *(unsigned __int8 *)(v20 + 74))
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v94.f64[0] = -2.31584178e77;
    *(_QWORD *)&v94.f64[1] = 0x80000002496C0270;
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    v57 = v94;
    v59 = v13[2];
    v58 = v13[3];
    if (v59 >= v58 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v58 > 1), v59 + 1, 1, v13);
    v13[2] = v59 + 1;
    *(float64x2_t *)&v13[2 * v59 + 4] = v57;
  }
  v60 = *((unsigned __int8 *)v1 + 75);
  if (v60 != *(unsigned __int8 *)(v20 + 75))
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v94.f64[0] = -2.31584178e77;
    *(_QWORD *)&v94.f64[1] = 0x80000002496C02A0;
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    v61 = v94;
    v63 = v13[2];
    v62 = v13[3];
    if (v63 >= v62 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v62 > 1), v63 + 1, 1, v13);
    v13[2] = v63 + 1;
    *(float64x2_t *)&v13[2 * v63 + 4] = v61;
  }
  v64 = *((unsigned __int8 *)v1 + 76);
  if (v64 != *(unsigned __int8 *)(v20 + 76))
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v94.f64[0] = -2.31584178e77;
    *(_QWORD *)&v94.f64[1] = 0x80000002496C02C0;
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    v65 = v94;
    v67 = v13[2];
    v66 = v13[3];
    if (v67 >= v66 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v66 > 1), v67 + 1, 1, v13);
    v13[2] = v67 + 1;
    *(float64x2_t *)&v13[2 * v67 + 4] = v65;
  }
  v68 = *((unsigned __int8 *)v1 + 77);
  if (v68 != *(unsigned __int8 *)(v20 + 77))
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    swift_bridgeObjectRelease();
    v94.f64[0] = -2.31584178e77;
    *(_QWORD *)&v94.f64[1] = 0x80000002496C02E0;
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    v69 = v94;
    v71 = v13[2];
    v70 = v13[3];
    if (v71 >= v70 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v70 > 1), v71 + 1, 1, v13);
    v13[2] = v71 + 1;
    *(float64x2_t *)&v13[2 * v71 + 4] = v69;
  }
  v73 = v92;
  v72 = v93;
  (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v92, (char *)v1 + v17[17], v42);
  sub_24968BDD4(&qword_2544AFD38, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBAE0], MEMORY[0x24BEBBAF8]);
  v74 = sub_2496BAED0();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v73, v42);
  if ((v74 & 1) != 0)
  {
    v76 = v90;
    v75 = v91;
    v77 = v89;
  }
  else
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BAF48();
    sub_2496BB23C();
    v78 = v94;
    v80 = v13[2];
    v79 = v13[3];
    if (v80 >= v79 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v79 > 1), v80 + 1, 1, v13);
    v13[2] = v80 + 1;
    *(float64x2_t *)&v13[2 * v80 + 4] = v78;
    v75 = v91;
    v77 = v89;
    v76 = v90;
  }
  (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v77, (char *)v1 + v17[19], v75);
  sub_24968BDD4((unint64_t *)&unk_2544AFD40, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBB98], MEMORY[0x24BEBBBB0]);
  v81 = sub_2496BAED0();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v77, v75);
  if ((v81 & 1) == 0)
  {
    v94.f64[0] = 0.0;
    v94.f64[1] = -2.68156159e154;
    sub_2496BB1E8();
    sub_2496BAF48();
    sub_2496BB23C();
    v82 = v94;
    v84 = v13[2];
    v83 = v13[3];
    if (v84 >= v83 >> 1)
      v13 = sub_2496A2384((_QWORD *)(v83 > 1), v84 + 1, 1, v13);
    v13[2] = v84 + 1;
    *(float64x2_t *)&v13[2 * v84 + 4] = v82;
  }
  v94.f64[0] = 0.0;
  v94.f64[1] = -2.68156159e154;
  sub_2496BB1E8();
  swift_bridgeObjectRelease();
  v94.f64[0] = -2.31584178e77;
  *(_QWORD *)&v94.f64[1] = 0x80000002496C0330;
  *(_QWORD *)&v96.f64[0] = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEC0);
  sub_24969D540();
  sub_2496BAEC4();
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  swift_bridgeObjectRelease();
  sub_2496BAF48();
  return *(_QWORD *)&v94.f64[0];
}

uint64_t sub_2496A1D90(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_2496A222C(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_2496BAF60();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_2496BAF3C();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_2496BAF3C();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_2496BAF6C();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_2496A2B3C(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_2496A2B3C((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_2496BAF3C();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_2496BAF6C();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_2496A2B3C(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_2496A2B3C((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_2496BB248();
  __break(1u);
LABEL_42:
  result = sub_2496BB248();
  __break(1u);
  return result;
}

uint64_t sub_2496A222C(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_2496BAF6C();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_2496A2B3C(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_2496A2B3C((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_2496BB248();
  __break(1u);
  return result;
}

_QWORD *sub_2496A2384(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFFB0);
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
    sub_2496A4820(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2496A2490(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2496A24B8(a1, a2, a3, a4, &qword_257876AF0, (uint64_t (*)(_QWORD))MEMORY[0x24BEBB770]);
}

uint64_t sub_2496A24A4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2496A24B8(a1, a2, a3, a4, &qword_2544AFF80, (uint64_t (*)(_QWORD))MEMORY[0x24BEBBA68]);
}

uint64_t sub_2496A24B8(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_2496BB248();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2496A567C(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_2496A26C4(char a1, int64_t a2, char a3, unint64_t a4)
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
  unint64_t v17;
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
        goto LABEL_29;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876AC8);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257876AD0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_2496BB248();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257876AD0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2496A4A00(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_2496A28D4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF90);
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
    sub_2496A4910(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2496A29E0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2496A24B8(a1, a2, a3, a4, &qword_2544AFF78, (uint64_t (*)(_QWORD))MEMORY[0x24BEBB9B8]);
}

uint64_t sub_2496A29F4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2496A24B8(a1, a2, a3, a4, &qword_2544AFFA8, (uint64_t (*)(_QWORD))type metadata accessor for FragmentCollator.RootElement);
}

uint64_t sub_2496A2A08(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2496A24B8(a1, a2, a3, a4, &qword_2544AFF88, (uint64_t (*)(_QWORD))MEMORY[0x24BEBBC38]);
}

uint64_t sub_2496A2A1C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2496A24B8(a1, a2, a3, a4, &qword_257876AE8, (uint64_t (*)(_QWORD))MEMORY[0x24BEBBCE0]);
}

_QWORD *sub_2496A2A30(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257876AE0);
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
    sub_2496A4B1C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2496A2B3C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257876AA8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2496A558C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2496A2C48(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2496A24B8(a1, a2, a3, a4, &qword_257876AF8, (uint64_t (*)(_QWORD))MEMORY[0x24BEBBA20]);
}

uint64_t sub_2496A2C5C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2496A2DB8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2496A2C78(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2496A2F20(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2496A2C94(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2496A32C0(a1, a2, a3, (_QWORD *)*v3, &qword_257876B00, (uint64_t (*)(_QWORD))MEMORY[0x24BEBBA98]);
  *v3 = result;
  return result;
}

uint64_t sub_2496A2CC0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2496A32C0(a1, a2, a3, (_QWORD *)*v3, &qword_2544AFF80, (uint64_t (*)(_QWORD))MEMORY[0x24BEBBA68]);
  *v3 = result;
  return result;
}

uint64_t sub_2496A2CEC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2496A32C0(a1, a2, a3, (_QWORD *)*v3, &qword_2544AFF98, type metadata accessor for IntelligenceSupportAgentXPCListener.ConnectedClient);
  *v3 = result;
  return result;
}

uint64_t sub_2496A2D18(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2496A32C0(a1, a2, a3, (_QWORD *)*v3, &qword_2544AFFA0, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
  *v3 = result;
  return result;
}

uint64_t sub_2496A2D44(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2496A30C4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2496A2D60(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2496A32C0(a1, a2, a3, (_QWORD *)*v3, &qword_2544AFFA8, (uint64_t (*)(_QWORD))type metadata accessor for FragmentCollator.RootElement);
  *v3 = result;
  return result;
}

uint64_t sub_2496A2D8C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2496A32C0(a1, a2, a3, (_QWORD *)*v3, &qword_2544AFF78, (uint64_t (*)(_QWORD))MEMORY[0x24BEBB9B8]);
  *v3 = result;
  return result;
}

uint64_t sub_2496A2DB8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFFB0);
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
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2496BB290();
  __break(1u);
  return result;
}

uint64_t sub_2496A2F20(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257876AB0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257876AB8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2496BB290();
  __break(1u);
  return result;
}

uint64_t sub_2496A30C4(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876AD8);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2544AFCE8) - 8);
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
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2544AFCE8) - 8);
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
  result = sub_2496BB290();
  __break(1u);
  return result;
}

uint64_t sub_2496A32AC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_2496A32C0(a1, a2, a3, a4, &qword_2544AFF78, (uint64_t (*)(_QWORD))MEMORY[0x24BEBB9B8]);
}

uint64_t sub_2496A32C0(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_2496BB290();
  __break(1u);
  return result;
}

BOOL _s26UIIntelligenceSupportAgent012IntelligencebC0C17RequestParametersV20VisibilityThresholdsV2eeoiySbAG_AGtFZ_0(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

unint64_t sub_2496A34DC()
{
  unint64_t result;

  result = qword_2578769C0;
  if (!qword_2578769C0)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BCE8C, &_s17RequestParametersV20VisibilityThresholdsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2578769C0);
  }
  return result;
}

uint64_t _s26UIIntelligenceSupportAgent012IntelligencebC0C17RequestParametersV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  if (*(double *)a1 != *(double *)a2)
    return 0;
  v4 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(a1 + 8))
  {
    if (!v4)
      return 0;
    swift_bridgeObjectRetain();
    v5 = swift_bridgeObjectRetain();
    v6 = sub_24969E944(v5, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
      return 0;
  }
  else if (v4)
  {
    return 0;
  }
  if ((sub_24969E944(*(_QWORD *)(a1 + 16), *(_QWORD *)(a2 + 16)) & 1) != 0
    && (sub_24969ECB4(*(_QWORD *)(a1 + 24), *(_QWORD *)(a2 + 24)) & 1) != 0
    && *(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32)
    && *(unsigned __int8 *)(a1 + 33) == *(unsigned __int8 *)(a2 + 33)
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 40), *(float64x2_t *)(a2 + 40)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 56), *(float64x2_t *)(a2 + 56)))), 0xFuLL))) & 1) != 0&& *(unsigned __int8 *)(a1 + 72) == *(unsigned __int8 *)(a2 + 72)&& *(unsigned __int8 *)(a1 + 73) == *(unsigned __int8 *)(a2 + 73)&& *(unsigned __int8 *)(a1 + 74) == *(unsigned __int8 *)(a2 + 74)&& *(unsigned __int8 *)(a1 + 75) == *(unsigned __int8 *)(a2 + 75)&& *(unsigned __int8 *)(a1 + 76) == *(unsigned __int8 *)(a2 + 76)&& *(unsigned __int8 *)(a1 + 77) == *(unsigned __int8 *)(a2 + 77))
  {
    v7 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
    if ((MEMORY[0x24BCF5200](a1 + *(int *)(v7 + 68), a2 + *(int *)(v7 + 68)) & 1) != 0
      && *(_QWORD *)(a1 + *(int *)(v7 + 72)) == *(_QWORD *)(a2 + *(int *)(v7 + 72)))
    {
      return sub_2496BABD0();
    }
  }
  return 0;
}

unint64_t sub_2496A36D4()
{
  unint64_t result;

  result = qword_2578769D8;
  if (!qword_2578769D8)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BCE3C, &_s17RequestParametersV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2578769D8);
  }
  return result;
}

unint64_t sub_2496A3718()
{
  unint64_t result;

  result = qword_257876A00;
  if (!qword_257876A00)
  {
    result = MEMORY[0x24BCF5F5C](&protocol conformance descriptor for IntelligenceSupportAgent.RequestParameters.VisibilityThresholds, &type metadata for IntelligenceSupportAgent.RequestParameters.VisibilityThresholds);
    atomic_store(result, (unint64_t *)&qword_257876A00);
  }
  return result;
}

unint64_t sub_2496A375C()
{
  unint64_t result;

  result = qword_257876A10;
  if (!qword_257876A10)
  {
    result = MEMORY[0x24BCF5F5C](&protocol conformance descriptor for IntelligenceSupportAgent.RequestParameters.Components, &type metadata for IntelligenceSupportAgent.RequestParameters.Components);
    atomic_store(result, (unint64_t *)&qword_257876A10);
  }
  return result;
}

uint64_t sub_2496A37A0(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2578769E0);
    v10 = sub_24968BDD4(a2, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], a3);
    result = MEMORY[0x24BCF5F5C](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2496A3824(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2578769F0);
    v8 = a2;
    result = MEMORY[0x24BCF5F5C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2496A3884()
{
  unint64_t result;

  result = qword_257876A38;
  if (!qword_257876A38)
  {
    result = MEMORY[0x24BCF5F5C](&protocol conformance descriptor for IntelligenceSupportAgent.RequestParameters.VisibilityThresholds, &type metadata for IntelligenceSupportAgent.RequestParameters.VisibilityThresholds);
    atomic_store(result, (unint64_t *)&qword_257876A38);
  }
  return result;
}

unint64_t sub_2496A38C8()
{
  unint64_t result;

  result = qword_257876A48;
  if (!qword_257876A48)
  {
    result = MEMORY[0x24BCF5F5C](&protocol conformance descriptor for IntelligenceSupportAgent.RequestParameters.Components, &type metadata for IntelligenceSupportAgent.RequestParameters.Components);
    atomic_store(result, (unint64_t *)&qword_257876A48);
  }
  return result;
}

uint64_t sub_2496A390C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_2496A396C()
{
  unint64_t result;

  result = qword_257876A58;
  if (!qword_257876A58)
  {
    result = MEMORY[0x24BCF5F5C](&protocol conformance descriptor for IntelligenceSupportAgent.RequestParameters.Components, &type metadata for IntelligenceSupportAgent.RequestParameters.Components);
    atomic_store(result, (unint64_t *)&qword_257876A58);
  }
  return result;
}

unint64_t sub_2496A39B4()
{
  unint64_t result;

  result = qword_257876A60;
  if (!qword_257876A60)
  {
    result = MEMORY[0x24BCF5F5C](&protocol conformance descriptor for IntelligenceSupportAgent.RequestParameters.Components, &type metadata for IntelligenceSupportAgent.RequestParameters.Components);
    atomic_store(result, (unint64_t *)&qword_257876A60);
  }
  return result;
}

unint64_t sub_2496A39FC()
{
  unint64_t result;

  result = qword_2544AFDD0;
  if (!qword_2544AFDD0)
  {
    result = MEMORY[0x24BCF5F5C](&protocol conformance descriptor for IntelligenceSupportAgent.RequestParameters.Components, &type metadata for IntelligenceSupportAgent.RequestParameters.Components);
    atomic_store(result, (unint64_t *)&qword_2544AFDD0);
  }
  return result;
}

unint64_t sub_2496A3A44()
{
  unint64_t result;

  result = qword_2544AFDD8;
  if (!qword_2544AFDD8)
  {
    result = MEMORY[0x24BCF5F5C](&protocol conformance descriptor for IntelligenceSupportAgent.RequestParameters.Components, &type metadata for IntelligenceSupportAgent.RequestParameters.Components);
    atomic_store(result, (unint64_t *)&qword_2544AFDD8);
  }
  return result;
}

double sub_2496A3A88@<D0>(double *a1@<X0>, _QWORD *a2@<X8>)
{
  double result;

  result = *a1;
  *a2 = *(_QWORD *)a1;
  return result;
}

double *sub_2496A3A94(double *result, _QWORD *a2)
{
  double v2;

  v2 = *result;
  *a2 = *(_QWORD *)result;
  if (v2 < 0.0 || v2 > 1.0)
    __break(1u);
  return result;
}

double sub_2496A3AB4@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result;

  result = *(double *)(a1 + 8);
  *a2 = result;
  return result;
}

double *sub_2496A3AC0(double *result, uint64_t a2)
{
  double v2;

  v2 = *result;
  *(double *)(a2 + 8) = *result;
  if (v2 < 0.0)
    __break(1u);
  return result;
}

double sub_2496A3AD8@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result;

  result = *(double *)(a1 + 16);
  *a2 = result;
  return result;
}

double *sub_2496A3AE4(double *result, uint64_t a2)
{
  double v2;

  v2 = *result;
  *(double *)(a2 + 16) = *result;
  if (v2 < 0.0 || v2 > 1.0)
    __break(1u);
  return result;
}

double sub_2496A3B04@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  double result;

  result = *(double *)(a1 + 24);
  *a2 = result;
  return result;
}

double *sub_2496A3B10(double *result, uint64_t a2)
{
  double v2;

  v2 = *result;
  *(double *)(a2 + 24) = *result;
  if (v2 < 0.0)
    __break(1u);
  return result;
}

_QWORD *_s17RequestParametersVwCP(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
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
    *(_WORD *)(a1 + 32) = *((_WORD *)a2 + 16);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    *(_DWORD *)(a1 + 72) = *((_DWORD *)a2 + 18);
    *(_BYTE *)(a1 + 76) = *((_BYTE *)a2 + 76);
    *(_BYTE *)(a1 + 77) = *((_BYTE *)a2 + 77);
    v9 = a3[17];
    v10 = a1 + v9;
    v11 = (uint64_t)a2 + v9;
    v12 = sub_2496BAB28();
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v14 = a3[19];
    *(_QWORD *)((char *)v4 + a3[18]) = *(uint64_t *)((char *)a2 + a3[18]);
    v15 = (char *)v4 + v14;
    v16 = (uint64_t)a2 + v14;
    v17 = sub_2496BABDC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  }
  return v4;
}

uint64_t _s17RequestParametersVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 68);
  v5 = sub_2496BAB28();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 76);
  v7 = sub_2496BABDC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

uint64_t _s17RequestParametersVwcp(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 76) = *(_BYTE *)(a2 + 76);
  *(_BYTE *)(a1 + 77) = *(_BYTE *)(a2 + 77);
  v8 = a3[17];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_2496BAB28();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  v13 = a3[19];
  *(_QWORD *)(a1 + a3[18]) = *(_QWORD *)(a2 + a3[18]);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_2496BABDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  return a1;
}

uint64_t _s17RequestParametersVwca(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  *(_BYTE *)(a1 + 75) = *(_BYTE *)(a2 + 75);
  *(_BYTE *)(a1 + 76) = *(_BYTE *)(a2 + 76);
  *(_BYTE *)(a1 + 77) = *(_BYTE *)(a2 + 77);
  v6 = a3[17];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2496BAB28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)(a1 + a3[18]) = *(_QWORD *)(a2 + a3[18]);
  v10 = a3[19];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_2496BABDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t _s17RequestParametersVwtk(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(_WORD *)(a1 + 76) = *(_WORD *)(a2 + 76);
  v7 = a3[17];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2496BAB28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[19];
  *(_QWORD *)(a1 + a3[18]) = *(_QWORD *)(a2 + a3[18]);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2496BABDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t _s17RequestParametersVwta(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v6 = *(_OWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_BYTE *)(a1 + 73) = *(_BYTE *)(a2 + 73);
  *(_BYTE *)(a1 + 74) = *(_BYTE *)(a2 + 74);
  *(_BYTE *)(a1 + 75) = *(_BYTE *)(a2 + 75);
  *(_BYTE *)(a1 + 76) = *(_BYTE *)(a2 + 76);
  *(_BYTE *)(a1 + 77) = *(_BYTE *)(a2 + 77);
  v7 = a3[17];
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)(a1 + 56) = v6;
  v10 = sub_2496BAB28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[19];
  *(_QWORD *)(a1 + a3[18]) = *(_QWORD *)(a2 + a3[18]);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_2496BABDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t _s17RequestParametersVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2496A4128(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2496BAB28();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 68);
    }
    else
    {
      v10 = sub_2496BABDC();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 76);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t _s17RequestParametersVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2496A41D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 16) = (a2 - 1);
  }
  else
  {
    v8 = sub_2496BAB28();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 68);
    }
    else
    {
      v10 = sub_2496BABDC();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 76);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_2496A4270()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2496BAB28();
  if (v1 <= 0x3F)
  {
    result = sub_2496BABDC();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
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

uint64_t _s17RequestParametersV20VisibilityThresholdsVwet(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t _s17RequestParametersV20VisibilityThresholdsVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IntelligenceSupportAgent.RequestParameters.VisibilityThresholds()
{
  return &type metadata for IntelligenceSupportAgent.RequestParameters.VisibilityThresholds;
}

ValueMetadata *type metadata accessor for IntelligenceSupportAgent.RequestParameters.Components()
{
  return &type metadata for IntelligenceSupportAgent.RequestParameters.Components;
}

uint64_t _s17RequestParametersV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF1)
    goto LABEL_17;
  if (a2 + 15 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 15) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 15;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 15;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 15;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x10;
  v8 = v6 - 16;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s17RequestParametersV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 15 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 15) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF1)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF0)
    return ((uint64_t (*)(void))((char *)&loc_2496A4494 + 4 * byte_2496BC879[v4]))();
  *a1 = a2 + 15;
  return ((uint64_t (*)(void))((char *)sub_2496A44C8 + 4 * byte_2496BC874[v4]))();
}

uint64_t sub_2496A44C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2496A44D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2496A44D8);
  return result;
}

uint64_t sub_2496A44E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2496A44ECLL);
  *(_BYTE *)result = a2 + 15;
  return result;
}

uint64_t sub_2496A44F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2496A44F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s17RequestParametersV10CodingKeysOMa()
{
  return &_s17RequestParametersV10CodingKeysON;
}

uint64_t _s17RequestParametersV20VisibilityThresholdsV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s17RequestParametersV20VisibilityThresholdsV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2496A45F0 + 4 * byte_2496BC883[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2496A4624 + 4 * byte_2496BC87E[v4]))();
}

uint64_t sub_2496A4624(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2496A462C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2496A4634);
  return result;
}

uint64_t sub_2496A4640(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2496A4648);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2496A464C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2496A4654(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s17RequestParametersV20VisibilityThresholdsV10CodingKeysOMa()
{
  return &_s17RequestParametersV20VisibilityThresholdsV10CodingKeysON;
}

unint64_t sub_2496A4674()
{
  unint64_t result;

  result = qword_257876A68;
  if (!qword_257876A68)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BCD5C, &_s17RequestParametersV20VisibilityThresholdsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876A68);
  }
  return result;
}

unint64_t sub_2496A46BC()
{
  unint64_t result;

  result = qword_257876A70;
  if (!qword_257876A70)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BCE14, &_s17RequestParametersV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876A70);
  }
  return result;
}

unint64_t sub_2496A4704()
{
  unint64_t result;

  result = qword_257876A78;
  if (!qword_257876A78)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BCD84, &_s17RequestParametersV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876A78);
  }
  return result;
}

unint64_t sub_2496A474C()
{
  unint64_t result;

  result = qword_257876A80;
  if (!qword_257876A80)
  {
    atomic_store(result, (unint64_t *)&qword_257876A80);
  }
  return result;
}

unint64_t sub_2496A4794()
{
  unint64_t result;

  result = qword_257876A88;
  if (!qword_257876A88)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BCCCC, &_s17RequestParametersV20VisibilityThresholdsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876A88);
  }
  return result;
}

unint64_t sub_2496A47DC()
{
  unint64_t result;

  result = qword_257876A90;
  if (!qword_257876A90)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BCCF4, &_s17RequestParametersV20VisibilityThresholdsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876A90);
  }
  return result;
}

uint64_t sub_2496A4820(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_2496BB290();
  __break(1u);
  return result;
}

uint64_t sub_2496A4910(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_2496BB290();
  __break(1u);
  return result;
}

uint64_t sub_2496A4A00(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257876AD0) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_2496BB290();
  __break(1u);
  return result;
}

uint64_t sub_2496A4B1C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEC0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2496BB290();
  __break(1u);
  return result;
}

uint64_t sub_2496A4C24(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000015 && a2 == 0x80000002496C0390 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002496C03B0 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697463617266 && a2 == 0xEF656C6269736956 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6973695661657261 && a2 == 0xEB00000000656C62)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_2496BB380();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_2496A4E0C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x74756F656D6974 && a2 == 0xE700000000000000;
  if (v2 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000002496C03D0 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000002496C03F0 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x80000002496C0410 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002496C0430 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000002496C0450 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000002496C0470 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x476564756C636E69 && a2 == 0xEF797274656D6F65 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002496C0490 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD00000000000001ELL && a2 == 0x80000002496C04B0 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002496C04D0 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002496C04F0 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000028 && a2 == 0x80000002496C0510 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x6974704F74786574 && a2 == 0xEB00000000736E6FLL || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000002496C0540 || (sub_2496BB380() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x4F646E616D6D6F63 && a2 == 0xEE00736E6F697470)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else
  {
    v6 = sub_2496BB380();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 15;
    else
      return 16;
  }
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

uint64_t sub_2496A547C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_2496BB380() & 1;
}

unint64_t sub_2496A54D0()
{
  unint64_t result;

  result = qword_257876A98;
  if (!qword_257876A98)
  {
    result = MEMORY[0x24BCF5F5C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257876A98);
  }
  return result;
}

unint64_t sub_2496A5514()
{
  unint64_t result;

  result = qword_257876AA0;
  if (!qword_257876AA0)
  {
    result = MEMORY[0x24BCF5F5C](MEMORY[0x24BEE1E38], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_257876AA0);
  }
  return result;
}

uint64_t sub_2496A5558()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2496A557C()
{
  return swift_deallocObject();
}

uint64_t sub_2496A558C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2496BB290();
  __break(1u);
  return result;
}

uint64_t sub_2496A567C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_2496BB290();
  __break(1u);
  return result;
}

uint64_t sub_2496A57A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  int v16;
  uint64_t result;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[7];

  v3 = v2;
  v6 = sub_2496BAE40();
  v33 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v32 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2496BAE70();
  v30 = *(_QWORD *)(v8 - 8);
  v31 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v29 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2496BAE4C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = OBJC_IVAR____TtC26UIIntelligenceSupportAgent24ManagementPolicyProvider_state;
  v15 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC26UIIntelligenceSupportAgent24ManagementPolicyProvider_state);
  swift_retain();
  os_unfair_lock_lock(v15 + 18);
  v28 = a1;
  sub_2496A6304(a1, a2, aBlock);
  os_unfair_lock_unlock(v15 + 18);
  v16 = LOBYTE(aBlock[0]);
  result = swift_release();
  if (v16 == 1)
  {
    dispatch_group_enter(*(dispatch_group_t *)(v3 + 16));
    v18 = *(_QWORD *)(v3 + v14);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v18 + 72));
    if (*(_BYTE *)(v18 + 24) == 1)
    {
      *(_QWORD *)(v18 + 16) = mach_continuous_time();
      *(_BYTE *)(v18 + 24) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 72));
    swift_release();
    v19 = (_QWORD *)swift_allocObject();
    v20 = v28;
    v19[2] = v3;
    v19[3] = v20;
    v19[4] = a2;
    sub_249696E24(0, (unint64_t *)&qword_2544AFF18);
    (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BEE5480], v10);
    swift_retain();
    swift_bridgeObjectRetain();
    v21 = (void *)sub_2496BB080();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = v20;
    v22[3] = a2;
    v22[4] = sub_2496A8138;
    v22[5] = v19;
    v22[6] = v3;
    aBlock[4] = sub_2496A8178;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24968D580;
    aBlock[3] = &block_descriptor_6;
    v23 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    v24 = v29;
    sub_2496BAE58();
    v35 = MEMORY[0x24BEE4AF8];
    sub_24968BDD4((unint64_t *)&qword_2544AFEA8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEB0);
    sub_2496A7B64();
    v25 = v32;
    v26 = v34;
    sub_2496BB170();
    MEMORY[0x24BCF574C](0, v24, v25, v23);
    _Block_release(v23);
    swift_release();

    (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v26);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v24, v31);
    return swift_release();
  }
  return result;
}

id sub_2496A5B18(uint64_t a1, uint64_t a2, char a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_2496BAEDC();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordWithBundleIdentifier_allowPlaceholder_error_, v4, a3 & 1, v9);

  if (v5)
  {
    v6 = v9[0];
  }
  else
  {
    v7 = v9[0];
    sub_2496BA87C();

    swift_willThrow();
  }
  return v5;
}

void *sub_2496A5BFC(void *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v6;
  id v7;
  uint64_t v8;

  if (!a1)
    return 0;
  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = a1;
    return v3;
  }
  objc_opt_self();
  v3 = (void *)swift_dynamicCastObjCClass();
  if (!v3)
    return v3;
  v6 = a1;
  v7 = objc_msgSend(v3, sel_containingBundleRecord);
  v8 = sub_2496A5BFC();

  return (void *)v8;
}

void sub_2496A5CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD aBlock[6];

  v4 = sub_2496BADB0();
  MEMORY[0x24BDAC7A8](v4);
  v5 = mach_continuous_time();
  v6 = objc_allocWithZone(MEMORY[0x24BDC1540]);
  swift_bridgeObjectRetain();
  v7 = sub_2496A7BB0(a1, a2, 0);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = v5;
  aBlock[4] = sub_2496A8840;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2496A62C8;
  aBlock[3] = &block_descriptor_24;
  v9 = _Block_copy(aBlock);
  v10 = v7;
  swift_release();
  objc_msgSend(v10, sel_getDeviceManagementPolicyWithCompletionHandler_, v9);

  _Block_release(v9);
}

uint64_t sub_2496A6064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  NSObject *v19;
  os_signpost_type_t v20;
  uint8_t *v21;
  uint8_t *v22;
  os_signpost_id_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v28 = a3;
  v3 = sub_2496BAD14();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v26 - v8;
  v10 = sub_2496BAD50();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v26 - v15;
  sub_2496BAD38();
  sub_2496BAD38();
  sub_2496BAD44();
  swift_unknownObjectRetain();
  sub_2496BACFC();
  v17 = *(void (**)(char *, uint64_t))(v11 + 8);
  v17(v14, v10);
  sub_249696DD0();
  sub_24968E5F0();
  sub_249696E14(v18);
  v19 = sub_2496BAD44();
  v20 = sub_2496BB0D4();
  if ((sub_2496BB110() & 1) != 0)
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    v21 = (uint8_t *)swift_slowAlloc();
    v27 = v4;
    v22 = v21;
    *(_DWORD *)v21 = 134217984;
    v29 = v28;
    sub_2496BB134();
    v23 = sub_2496BAD08();
    _os_signpost_emit_with_name_impl(&dword_249686000, v19, v20, v23, "PrewarmManagementPolicy", "%{public, signpost.description:begin_time}llu", v22, 0xCu);
    MEMORY[0x24BCF5FEC](v22, -1, -1);

    v24 = *(void (**)(char *, uint64_t))(v27 + 8);
    v24(v9, v3);
    v17(v16, v10);
    return ((uint64_t (*)(char *, uint64_t))v24)(v7, v3);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    return ((uint64_t (*)(char *, uint64_t))v17)(v16, v10);
  }
}

uint64_t sub_2496A62C8(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_2496A6304@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  uint64_t v8;

  swift_bridgeObjectRetain();
  v6 = sub_2496B7638(&v8, a1, a2);
  result = swift_bridgeObjectRelease();
  *a3 = v6 & 1;
  return result;
}

void sub_2496A6370(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_unfair_lock_s *v8;

  v8 = *(os_unfair_lock_s **)(a2 + OBJC_IVAR____TtC26UIIntelligenceSupportAgent24ManagementPolicyProvider_state);
  swift_retain();
  os_unfair_lock_lock(v8 + 18);
  sub_2496A6408((uint64_t)&v8[4], a3, a4, a1);
  os_unfair_lock_unlock(v8 + 18);
  swift_release();
  dispatch_group_leave(*(dispatch_group_t *)(a2 + 16));
}

uint64_t sub_2496A6408(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  *(_QWORD *)(a1 + 16) = mach_continuous_time();
  *(_BYTE *)(a1 + 24) = 0;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0x8000000000000000;
  sub_249693D88(a4, a2, a3, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(a1 + 32) = v10;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_2496A64B0(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[7];

  sub_249696E24(0, &qword_257876BD8);
  swift_bridgeObjectRetain();
  v8 = sub_2496A5B18(a1, a2, 0);
  v9 = sub_2496A5BFC(v8);

  if (v9)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = a3;
    *(_QWORD *)(v10 + 24) = a4;
    aBlock[4] = sub_2496A81AC;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2496A62C8;
    aBlock[3] = &block_descriptor_12;
    v11 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_getDeviceManagementPolicyWithCompletionHandler_, v11);
    _Block_release(v11);
    sub_2496A6614(a1, a2, v9);

  }
  else
  {
    a3(0);
  }
}

void sub_2496A6614(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  os_unfair_lock_s *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v6 = sub_2496BADB0();
  v42 = *(_QWORD *)(v6 - 8);
  v43 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(a3, sel_bundleIdentifier);
  v41 = a1;
  if (v9)
  {
    v10 = v9;
    a1 = sub_2496BAF00();
    v12 = v11;

  }
  else
  {
    swift_bridgeObjectRetain();
    v12 = a2;
  }
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2C888]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876BE0);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2496BBD40;
  v15 = (void *)*MEMORY[0x24BE2C720];
  *(_QWORD *)(v14 + 32) = *MEMORY[0x24BE2C720];
  type metadata accessor for DMFEffectivePolicyType(0);
  v16 = v15;
  v17 = (void *)sub_2496BAF90();
  swift_bridgeObjectRelease();
  v45[0] = 0;
  v18 = objc_msgSend(v13, sel_requestPoliciesForTypes_withError_, v17, v45);

  v19 = (void *)v45[0];
  sub_249696E24(0, &qword_257876BE8);
  sub_24968BDD4(&qword_2578765D0, (uint64_t (*)(uint64_t))type metadata accessor for DMFEffectivePolicyType, (uint64_t)&unk_2496BBC0C);
  v20 = sub_2496BAEA0();
  v21 = v19;

  if (v21)
  {
    v23 = v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2496BAD98();
    v24 = v23;
    v25 = sub_2496BADA4();
    v26 = sub_2496BB014();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v41 = swift_slowAlloc();
      v45[0] = v41;
      *(_DWORD *)v27 = 136446466;
      v28 = objc_msgSend(v24, sel_localizedDescription);
      v29 = sub_2496BAF00();
      v31 = v30;

      v44 = sub_2496926A4(v29, v31, v45);
      sub_2496BB134();

      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2082;
      v24 = v24;
      v32 = objc_msgSend(v24, sel_description);
      v33 = sub_2496BAF00();
      v35 = v34;

      v44 = sub_2496926A4(v33, v35, v45);
      sub_2496BB134();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_249686000, v25, v26, "unable to perform fast policy fetch: %{public}s; underlying error: %{public}s",
        (uint8_t *)v27,
        0x16u);
      v36 = v41;
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v36, -1, -1);
      MEMORY[0x24BCF5FEC](v27, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v43);

  }
  else
  {
    MEMORY[0x24BDAC7A8](v22);
    *(&v40 - 2) = a1;
    *(&v40 - 1) = v12;
    v37 = sub_2496A8680(v20, (uint64_t (*)(id, id))sub_2496A81D4, (uint64_t)(&v40 - 4));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v38 = *(_QWORD *)(v37 + 16);
    swift_release();
    v39 = *(os_unfair_lock_s **)(v40 + OBJC_IVAR____TtC26UIIntelligenceSupportAgent24ManagementPolicyProvider_state);
    swift_retain();
    os_unfair_lock_lock(v39 + 18);
    sub_2496A6AE4((uint64_t)&v39[4], v41, a2, v38 != 0);
    os_unfair_lock_unlock(v39 + 18);
    swift_release();
  }
}

uint64_t sub_2496A6AE4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = 0x8000000000000000;
  sub_249693D88(a4, a2, a3, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(a1 + 40) = v10;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2496A6B80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  char *v13;
  void *v14;
  void *v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  os_unfair_lock_s *v20;
  uint64_t v21;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t aBlock[5];
  uint64_t v31;

  v1 = v0;
  v2 = sub_2496BADB0();
  v24 = *(_QWORD *)(v2 - 8);
  v25 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v23 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2496BAE40();
  v28 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2496BAE70();
  v26 = *(_QWORD *)(v7 - 8);
  v27 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2496BAE4C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249696E24(0, (unint64_t *)&qword_2544AFF18);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BEE5490], v10);
  v14 = (void *)sub_2496BB080();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  aBlock[4] = (uint64_t)sub_2496A7B44;
  v31 = v0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_24968D580;
  aBlock[3] = (uint64_t)&block_descriptor_2;
  v15 = _Block_copy(aBlock);
  swift_retain();
  sub_2496BAE58();
  v29 = MEMORY[0x24BEE4AF8];
  sub_24968BDD4((unint64_t *)&qword_2544AFEA8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEB0);
  sub_2496A7B64();
  sub_2496BB170();
  sub_2496BB038();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
  swift_release();
  sub_2496BB02C();
  if ((sub_2496BAE34() & 1) != 0)
  {
    v16 = v23;
    sub_2496BAD98();
    v17 = sub_2496BADA4();
    v18 = sub_2496BB014();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_249686000, v17, v18, "management policy fetch timed out", v19, 2u);
      MEMORY[0x24BCF5FEC](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v24 + 8))(v16, v25);
  }
  v20 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC26UIIntelligenceSupportAgent24ManagementPolicyProvider_state);
  swift_retain();
  os_unfair_lock_lock(v20 + 18);
  sub_2496A7290((uint64_t)&v20[4], aBlock);
  os_unfair_lock_unlock(v20 + 18);
  v21 = aBlock[0];
  swift_release();
  return v21;
}

uint64_t sub_2496A6F04(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + OBJC_IVAR____TtC26UIIntelligenceSupportAgent24ManagementPolicyProvider_state);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 72));
  sub_2496A6F70((uint64_t *)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
  return swift_release();
}

uint64_t sub_2496A6F70(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t result;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  void (*v17)(_BYTE *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  void (*v22)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v23;
  _DWORD *v24;
  _DWORD *v25;
  os_signpost_id_t v26;
  void (*v27)(_BYTE *, uint64_t);
  _BYTE v28[12];
  int v29;
  void (*v30)(_BYTE *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_2496BAD14();
  v2 = *(_QWORD *)(v34 - 8);
  v3 = MEMORY[0x24BDAC7A8](v34);
  v5 = &v28[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  v7 = &v28[-v6];
  v8 = sub_2496BAD50();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = &v28[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = MEMORY[0x24BDAC7A8](v10);
  v15 = &v28[-v14];
  if ((a1[1] & 1) == 0 && (a1[3] & 1) == 0)
  {
    v16 = a1[2];
    v31 = *a1;
    v32 = v16;
    *a1 = 0;
    *((_BYTE *)a1 + 8) = 1;
    a1[2] = 0;
    *((_BYTE *)a1 + 24) = 1;
    v33 = *(_QWORD *)(a1[4] + 16);
    sub_2496BAD38();
    sub_2496BAD38();
    sub_2496BAD44();
    swift_unknownObjectRetain();
    sub_2496BACFC();
    v17 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
    v17(v12, v8);
    sub_249696DD0();
    sub_24968E5F0();
    sub_249696E14(v18);
    sub_24968E5F0();
    sub_249696E14(v19);
    v20 = sub_2496BAD44();
    v21 = sub_2496BB0D4();
    if ((sub_2496BB110() & 1) != 0)
    {
      v22 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v2 + 16);
      v30 = v17;
      v23 = v34;
      v22(v5, v7, v34);
      v24 = (_DWORD *)swift_slowAlloc();
      v29 = v21;
      v25 = v24;
      *v24 = 134218496;
      v35 = v31;
      sub_2496BB134();
      *((_WORD *)v25 + 6) = 2048;
      v35 = v32;
      sub_2496BB134();
      *((_WORD *)v25 + 11) = 2050;
      v35 = v33;
      sub_2496BB134();
      v26 = sub_2496BAD08();
      _os_signpost_emit_with_name_impl(&dword_249686000, v20, (os_signpost_type_t)v29, v26, "ManagementPolicy", "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu count=%{public}ld", (uint8_t *)v25, 0x20u);
      MEMORY[0x24BCF5FEC](v25, -1, -1);

      v27 = *(void (**)(_BYTE *, uint64_t))(v2 + 8);
      v27(v7, v23);
      v30(v15, v8);
      return ((uint64_t (*)(_BYTE *, uint64_t))v27)(v5, v23);
    }
    else
    {

      (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v7, v34);
      return ((uint64_t (*)(_BYTE *, uint64_t))v17)(v15, v8);
    }
  }
  return result;
}

uint64_t sub_2496A7290@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 32);
  swift_bridgeObjectRetain();
  v4 = swift_bridgeObjectRetain();
  result = sub_2496A72D4(v4, v3);
  *a2 = result;
  return result;
}

uint64_t sub_2496A72D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_2496A7C88(a1, (uint64_t)sub_2496A80EC, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2496A7350(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = sub_2496BAE88();
  v27 = *(_QWORD *)(v29 - 8);
  v3 = MEMORY[0x24BDAC7A8](v29);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v26 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578767A8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for IntelligenceSupportAgent.RequestParameters();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v1 + 16) = dispatch_group_create();
  v15 = OBJC_IVAR____TtC26UIIntelligenceSupportAgent24ManagementPolicyProvider_state;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876BF0);
  v16 = swift_allocObject();
  *(_DWORD *)(v16 + 72) = 0;
  *(_QWORD *)(v16 + 16) = 0;
  *(_BYTE *)(v16 + 24) = 1;
  *(_QWORD *)(v16 + 32) = 0;
  *(_BYTE *)(v16 + 40) = 1;
  v17 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v16 + 48) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v16 + 56) = v17;
  v18 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v16 + 64) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v1 + v15) = v16;
  v28 = a1;
  sub_24969A754(a1, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    *(_QWORD *)v14 = 0x3FE8000000000000;
    *((_QWORD *)v14 + 1) = 0;
    *((_QWORD *)v14 + 2) = v18;
    *((_QWORD *)v14 + 3) = v18;
    v14[32] = sub_2496BAB94() & 1;
    v14[33] = sub_2496BABAC() & 1;
    *(_OWORD *)(v14 + 40) = xmmword_2496BC530;
    *(_OWORD *)(v14 + 56) = xmmword_2496BC540;
    v14[72] = sub_2496BAB70() & 1;
    v14[73] = sub_2496BABA0() & 1;
    v14[74] = sub_2496BABB8() & 1;
    v14[75] = sub_2496BAB88() & 1;
    v14[76] = sub_2496BAB7C() & 1;
    v14[77] = sub_2496BABC4() & 1;
    sub_2496BAB40();
    v19 = sub_2496BAB64() & 1;
    v20 = sub_2496BAB58();
    v21 = v19 | 2;
    if ((v20 & 1) == 0)
      v21 = v19;
    *(_QWORD *)&v14[*(int *)(v11 + 72)] = v21;
    sub_2496BAB4C();
    sub_24969A79C((uint64_t)v10);
  }
  else
  {
    sub_24969A820((uint64_t)v10, (uint64_t)v14);
  }
  v22 = fmin(*(double *)v14 * 0.7, 0.2);
  sub_2496BAE7C();
  MEMORY[0x24BCF5578](v5, v22);
  sub_24969A79C(v28);
  v23 = v27;
  v24 = v29;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v29);
  sub_24969A7E4((uint64_t)v14);
  (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v1 + OBJC_IVAR____TtC26UIIntelligenceSupportAgent24ManagementPolicyProvider_deadline, v7, v24);
  return v1;
}

uint64_t sub_2496A7648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC26UIIntelligenceSupportAgent24ManagementPolicyProvider_deadline;
  v2 = sub_2496BAE88();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2496A76B0()
{
  return type metadata accessor for ManagementPolicyProvider();
}

uint64_t type metadata accessor for ManagementPolicyProvider()
{
  uint64_t result;

  result = qword_257876B40;
  if (!qword_257876B40)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2496A76F4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2496BAE88();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ManagementPolicyProvider.PolicyStatus(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ManagementPolicyProvider.PolicyStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2496A7868 + 4 * byte_2496BCEF5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2496A789C + 4 * byte_2496BCEF0[v4]))();
}

uint64_t sub_2496A789C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2496A78A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2496A78ACLL);
  return result;
}

uint64_t sub_2496A78B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2496A78C0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2496A78C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2496A78CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ManagementPolicyProvider.PolicyStatus()
{
  return &type metadata for ManagementPolicyProvider.PolicyStatus;
}

uint64_t destroy for ManagementPolicyProvider.State()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ManagementPolicyProvider.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v3;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ManagementPolicyProvider.State(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for ManagementPolicyProvider.State(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ManagementPolicyProvider.State(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ManagementPolicyProvider.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ManagementPolicyProvider.State()
{
  return &type metadata for ManagementPolicyProvider.State;
}

uint64_t sub_2496A7B44()
{
  uint64_t v0;

  return sub_2496A6F04(v0);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_2496A7B64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544AFEB8;
  if (!qword_2544AFEB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544AFEB0);
    result = MEMORY[0x24BCF5F5C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2544AFEB8);
  }
  return result;
}

id sub_2496A7BB0(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_2496BAEDC();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_2496BA87C();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_2496A7C88(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  char v36;
  _QWORD *v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t result;

  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_2496A7F6C();
  if (!v8)
    goto LABEL_24;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  v13 = (_QWORD *)*a5;
  v15 = sub_2496B6B78(v7, v8);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v19 = v14;
  if (v13[3] >= v18)
  {
    if ((a4 & 1) != 0)
    {
      v22 = (_QWORD *)*a5;
      if ((v14 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_249694FE4();
      v22 = (_QWORD *)*a5;
      if ((v19 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    v24 = (uint64_t *)(v22[6] + 16 * v15);
    *v24 = v10;
    v24[1] = v11;
    *(_BYTE *)(v22[7] + v15) = v12 & 1;
    v25 = v22[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v22[2] = v27;
LABEL_13:
    v28 = sub_2496A7F6C();
    if (v29)
    {
      v31 = v28;
      v32 = v29;
      v33 = v30;
      do
      {
        v37 = (_QWORD *)*a5;
        v39 = sub_2496B6B78(v31, v32);
        v40 = v37[2];
        v41 = (v38 & 1) == 0;
        v42 = v40 + v41;
        if (__OFADD__(v40, v41))
          goto LABEL_25;
        v43 = v38;
        if (v37[3] < v42)
        {
          sub_2496B1514(v42, 1);
          v44 = sub_2496B6B78(v31, v32);
          if ((v43 & 1) != (v45 & 1))
            goto LABEL_27;
          v39 = v44;
        }
        v46 = (_QWORD *)*a5;
        if ((v43 & 1) != 0)
        {
          v34 = *(_BYTE *)(v46[7] + v39);
          swift_bridgeObjectRelease();
          *(_BYTE *)(v46[7] + v39) = v34;
        }
        else
        {
          v46[(v39 >> 6) + 8] |= 1 << v39;
          v47 = (uint64_t *)(v46[6] + 16 * v39);
          *v47 = v31;
          v47[1] = v32;
          *(_BYTE *)(v46[7] + v39) = v33 & 1;
          v48 = v46[2];
          v26 = __OFADD__(v48, 1);
          v49 = v48 + 1;
          if (v26)
            goto LABEL_26;
          v46[2] = v49;
        }
        v31 = sub_2496A7F6C();
        v32 = v35;
        v33 = v36;
      }
      while (v35);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_2496A8104();
    return swift_release();
  }
  sub_2496B1514(v18, a4 & 1);
  v20 = sub_2496B6B78(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    v15 = v20;
    v22 = (_QWORD *)*a5;
    if ((v19 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    v23 = *(_BYTE *)(v22[7] + v15);
    swift_bridgeObjectRelease();
    *(_BYTE *)(v22[7] + v15) = v23;
    goto LABEL_13;
  }
LABEL_27:
  result = sub_2496BB398();
  __break(1u);
  return result;
}

uint64_t sub_2496A7F6C()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  char v21;

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(_BYTE *)(*(_QWORD *)(v1 + 56) + v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v21 = v10;
    swift_bridgeObjectRetain();
    v11(&v19, v20);
    swift_bridgeObjectRelease();
    return v19;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v14 != v18)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_2496A80EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_QWORD *)(a2 + 8) = v2;
  *(_BYTE *)(a2 + 16) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2496A8104()
{
  return swift_release();
}

uint64_t sub_2496A810C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2496A8138(char a1)
{
  uint64_t *v1;

  sub_2496A6370(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2496A8144()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_2496A8178()
{
  uint64_t v0;

  sub_2496A64B0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(_QWORD))(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_2496A8188()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2496A81AC(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(BOOL))(v1 + 16))(a1 != 0);
}

BOOL sub_2496A81D4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)sub_2496BAEDC();
  v4 = objc_msgSend(a2, sel_policyForIdentifier_excludableIdentifiers_, v3, 0);

  return v4 != 0;
}

uint64_t sub_2496A8224()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];
  _QWORD aBlock[6];

  v0 = sub_2496BAE40();
  v15[0] = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2496BAE70();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2496BAE4C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249696E24(0, (unint64_t *)&qword_2544AFF18);
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE5490], v7);
  v11 = (void *)sub_2496BB080();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = 0xD000000000000015;
  *(_QWORD *)(v12 + 24) = 0x80000002496C0710;
  aBlock[4] = sub_2496A8814;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24968D580;
  aBlock[3] = &block_descriptor_18;
  v13 = _Block_copy(aBlock);
  sub_2496BAE58();
  v15[1] = MEMORY[0x24BEE4AF8];
  sub_24968BDD4((unint64_t *)&qword_2544AFEA8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFEB0);
  sub_2496A7B64();
  sub_2496BB170();
  MEMORY[0x24BCF574C](0, v6, v2, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v15[0] + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return swift_release();
}

void sub_2496A8490(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(id, id))
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;

  v21 = 0;
  v6 = 0;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v23 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v11 = v10 | (v6 << 6);
      goto LABEL_5;
    }
    v15 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v23)
      goto LABEL_24;
    v16 = *(_QWORD *)(v22 + 8 * v15);
    ++v6;
    if (!v16)
    {
      v6 = v15 + 1;
      if (v15 + 1 >= v23)
        goto LABEL_24;
      v16 = *(_QWORD *)(v22 + 8 * v6);
      if (!v16)
      {
        v6 = v15 + 2;
        if (v15 + 2 >= v23)
          goto LABEL_24;
        v16 = *(_QWORD *)(v22 + 8 * v6);
        if (!v16)
          break;
      }
    }
LABEL_20:
    v9 = (v16 - 1) & v16;
    v11 = __clz(__rbit64(v16)) + (v6 << 6);
LABEL_5:
    v12 = *(void **)(*(_QWORD *)(a3 + 56) + 8 * v11);
    v13 = *(id *)(*(_QWORD *)(a3 + 48) + 8 * v11);
    v14 = v12;
    LOBYTE(v12) = a4(v13, v14);

    if ((v12 & 1) != 0)
    {
      *(unint64_t *)((char *)a1 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v21++, 1))
      {
        __break(1u);
LABEL_24:
        sub_2496B2778(a1, a2, v21, a3);
        return;
      }
    }
  }
  v17 = v15 + 3;
  if (v17 >= v23)
    goto LABEL_24;
  v16 = *(_QWORD *)(v22 + 8 * v17);
  if (v16)
  {
    v6 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v6 >= v23)
      goto LABEL_24;
    v16 = *(_QWORD *)(v22 + 8 * v6);
    ++v17;
    if (v16)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_2496A8680(uint64_t isStackAllocationSafe, uint64_t (*a2)(id, id), uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[2];

  v6 = isStackAllocationSafe;
  v14[1] = *MEMORY[0x24BDAC8D0];
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = (unint64_t)((1 << v7) + 63) >> 6;
  v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    sub_2496A8490((_QWORD *)((char *)v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, v6, a2);
    if (v3)
      swift_willThrow();
    else
      return v10;
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    sub_2496A8490((unint64_t *)v11, v8, v6, a2);
    a3 = v12;
    MEMORY[0x24BCF5FEC](v11, -1, -1);
  }
  return a3;
}

uint64_t sub_2496A87F0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2496A8814()
{
  uint64_t v0;

  sub_2496A5CB0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_2496A881C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2496A8840(uint64_t a1)
{
  uint64_t v1;

  return sub_2496A6064(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2496A8868(uint64_t a1, uint64_t a2)
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
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFCD8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2496BAAD4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_249697880(a1, (uint64_t *)&unk_2544AFCD8);
    sub_249692D88(a2, (uint64_t)v8);
    v13 = sub_2496BAA8C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a2, v13);
    return sub_249697880((uint64_t)v8, (uint64_t *)&unk_2544AFCD8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v3;
    *v3 = 0x8000000000000000;
    sub_249693AA4((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v18;
    swift_bridgeObjectRelease();
    v16 = sub_2496BAA8C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_2496A89F4(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v26 = MEMORY[0x24BEE4AF8];
  sub_2496A2C5C(0, v1, 0);
  v2 = v26;
  result = sub_2496B2A84(a1);
  v6 = result;
  v7 = 0;
  v8 = a1 + 64;
  v22 = v1;
  v23 = v5;
  v24 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != v5)
      goto LABEL_24;
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v6);
    v13 = v12[1];
    v25 = *v12;
    v15 = *(_QWORD *)(v26 + 16);
    v14 = *(_QWORD *)(v26 + 24);
    result = swift_bridgeObjectRetain();
    if (v15 >= v14 >> 1)
      result = sub_2496A2C5C(v14 > 1, v15 + 1, 1);
    *(_QWORD *)(v26 + 16) = v15 + 1;
    v16 = v26 + 16 * v15;
    *(_QWORD *)(v16 + 32) = v25;
    *(_QWORD *)(v16 + 40) = v13;
    v9 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = a1 + 64;
    v17 = *(_QWORD *)(v24 + 8 * v11);
    if ((v17 & (1 << v6)) == 0)
      goto LABEL_26;
    v5 = v23;
    if (*(_DWORD *)(a1 + 36) != v23)
      goto LABEL_27;
    v18 = v17 & (-2 << (v6 & 0x3F));
    if (v18)
    {
      v9 = __clz(__rbit64(v18)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v22;
    }
    else
    {
      v19 = v11 + 1;
      v20 = (unint64_t)(v9 + 63) >> 6;
      v10 = v22;
      if (v11 + 1 < v20)
      {
        v21 = *(_QWORD *)(v24 + 8 * v19);
        if (v21)
        {
LABEL_20:
          v9 = __clz(__rbit64(v21)) + (v19 << 6);
        }
        else
        {
          while (v20 - 2 != v11)
          {
            v21 = *(_QWORD *)(a1 + 80 + 8 * v11++);
            if (v21)
            {
              v19 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    v6 = v9;
    if (v7 == v10)
      return v2;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_2496A8BFC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
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
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFE88);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF70);
  v6 = sub_2496BB284();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2496B506C(v12, (uint64_t)v5, &qword_2544AFE88);
    result = sub_2496B69A8(v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = type metadata accessor for ConnectionID();
    result = sub_24968BC5C((uint64_t)v5, v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)((char *)v5 + v9);
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
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

unint64_t sub_2496A8D94(uint64_t a1)
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
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD90);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFF60);
  v6 = sub_2496BB284();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2496B506C(v12, (uint64_t)v5, &qword_2544AFD90);
    result = sub_2496B6A48((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_2496BACF0();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
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

unint64_t sub_2496A8F28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFCD0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578767B0);
  v6 = sub_2496BB284();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2496B506C(v12, (uint64_t)v5, &qword_2544AFCD0);
    result = sub_2496B6AE0((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_2496BAA8C();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    v19 = v7[7];
    v20 = sub_2496BAAD4();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v16, v9, v20);
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

unint64_t sub_2496A90E0(uint64_t a1)
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
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD30);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF58);
  v6 = sub_2496BB284();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2496B506C(v12, (uint64_t)v5, &qword_2544AFD30);
    result = sub_2496B6910((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_2496BAB10();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
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

unint64_t sub_2496A9274(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876790);
  v2 = (_QWORD *)sub_2496BB284();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_2496B6B78(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_2496A9384(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876788);
  v2 = (_QWORD *)sub_2496BB284();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_2496B6B78(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
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

unint64_t sub_2496A949C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876780);
  v2 = (_QWORD *)sub_2496BB284();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_2496B6B78(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
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

uint64_t sub_2496A95B4(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  unint64_t v5;
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
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t KeyPath;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(_QWORD, _QWORD, _QWORD);
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t *v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  BOOL v66;
  void (*v67)(uint64_t, uint64_t);
  uint64_t v68;
  _QWORD *v69;
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v71;
  char v72;
  unint64_t v73;
  uint64_t v74;
  _BOOL8 v75;
  uint64_t v76;
  char v77;
  unint64_t v78;
  char v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  char *v91;
  void (*v92)(uint64_t, char *, uint64_t);
  uint64_t v93;
  void (*v94)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  uint64_t v98;
  unint64_t v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  void (*v106)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t v108;
  char *v109;
  char *v110;
  char *v111;
  uint64_t v112;
  char *v113;
  char *v114;
  unsigned int (*v115)(uint64_t, uint64_t, uint64_t);
  char *v116;
  char *v117;
  char *v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(char *, uint64_t, uint64_t);
  void (*v126)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD *v127;
  uint64_t *v128;
  char *v129;
  char *v130;
  char *v131;
  uint64_t v132;
  char *v133;
  char *v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  void (*v138)(_QWORD, _QWORD, _QWORD);
  _QWORD *v139;
  uint64_t v140;
  uint64_t v141;

  v2 = v1;
  v4 = sub_2496BAB10();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v111 = (char *)&v108 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v118 = (char *)&v108 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFCD8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v110 = (char *)&v108 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v136 = (char *)&v108 - v12;
  v13 = sub_2496BAA8C();
  v121 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v109 = (char *)&v108 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v137 = (uint64_t)&v108 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v131 = (char *)&v108 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v132 = (uint64_t)&v108 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v133 = (char *)&v108 - v22;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFCC8);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v113 = (char *)&v108 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v134 = (char *)&v108 - v26;
  v123 = sub_2496BAAD4();
  v124 = *(_QWORD *)(v123 - 8);
  v27 = MEMORY[0x24BDAC7A8](v123);
  v114 = (char *)&v108 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v130 = (char *)&v108 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v108 - v31;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD20);
  v34 = MEMORY[0x24BDAC7A8](v33);
  v116 = (char *)&v108 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v34);
  v37 = (char *)&v108 - v36;
  sub_2496BAA44();
  v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v39 = v38(v37, 1, v4);
  v115 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v38;
  if (v39 == 1)
  {
    sub_249697880((uint64_t)v37, &qword_2544AFD20);
  }
  else
  {
    v40 = sub_2496BAAEC();
    v42 = v41;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v37, v4);
    if (v42)
    {
      sub_2496A57A0(v40, v42);
      swift_bridgeObjectRelease();
    }
  }
  v119 = v5;
  v120 = v4;
  v43 = v123;
  v125 = *(void (**)(char *, uint64_t, uint64_t))(v124 + 16);
  v125(v32, a1, v123);
  v141 = MEMORY[0x24BEE4AF8];
  sub_2496BAAA4();
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  *(&v108 - 4) = a1;
  *(&v108 - 3) = (uint64_t)v2;
  *(&v108 - 2) = (uint64_t)&v141;
  sub_2496BAFC0();
  swift_bridgeObjectRelease();
  swift_release();
  v122 = v32;
  sub_2496BAAB0();
  v45 = *(_QWORD *)(v141 + 16);
  v117 = v2;
  v112 = v141;
  if (v45)
  {
    v128 = (uint64_t *)(v2 + 40);
    v129 = v2 + 24;
    v127 = v2 + 32;
    v46 = v121;
    v47 = v141 + ((*(unsigned __int8 *)(v121 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v121 + 80));
    v135 = *(_QWORD *)(v121 + 72);
    v48 = *(void (**)(_QWORD, _QWORD, _QWORD))(v121 + 16);
    swift_bridgeObjectRetain();
    v49 = v124;
    v51 = v133;
    v50 = v134;
    v138 = v48;
    while (1)
    {
      v48(v50, v47, v13);
      v126 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56);
      v126(v50, 0, 1, v13);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v50, 1, v13) == 1)
        break;
      v52 = v43;
      (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v51, v50, v13);
      v53 = v131;
      v48(v131, v51, v13);
      swift_beginAccess();
      v54 = (uint64_t)v51;
      v55 = v132;
      sub_2496B7160(v132, v53);
      swift_endAccess();
      v56 = v13;
      v57 = v13;
      v58 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
      v58(v55, v57);
      v59 = v128;
      swift_beginAccess();
      v60 = *v59;
      if (*(_QWORD *)(v60 + 16) && (v61 = sub_2496B6AE0(v54), (v62 & 1) != 0))
      {
        v43 = v52;
        v125(v136, *(_QWORD *)(v60 + 56) + *(_QWORD *)(v49 + 72) * v61, v52);
        v63 = 0;
      }
      else
      {
        v63 = 1;
        v43 = v52;
      }
      v64 = (uint64_t)v136;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56))(v136, v63, 1, v43);
      swift_endAccess();
      v65 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v49 + 48))(v64, 1, v43);
      sub_249697880(v64, (uint64_t *)&unk_2544AFCD8);
      v66 = v65 == 1;
      v51 = v133;
      v48 = v138;
      v67 = v58;
      v13 = v56;
      if (v66)
      {
        v68 = v137;
        v138(v137, v133, v56);
        v69 = v127;
        swift_beginAccess();
        v125(v130, (uint64_t)v122, v43);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v139 = (_QWORD *)*v69;
        v71 = v139;
        *v69 = 0x8000000000000000;
        v73 = sub_2496B6AE0(v68);
        v74 = v71[2];
        v75 = (v72 & 1) == 0;
        v76 = v74 + v75;
        if (__OFADD__(v74, v75))
        {
          __break(1u);
LABEL_43:
          __break(1u);
          goto LABEL_44;
        }
        v77 = v72;
        if (v71[3] >= v76)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_2496945C8();
        }
        else
        {
          sub_2496B0468(v76, isUniquelyReferenced_nonNull_native);
          v78 = sub_2496B6AE0(v137);
          if ((v77 & 1) != (v79 & 1))
          {
            result = sub_2496BB398();
            __break(1u);
            return result;
          }
          v73 = v78;
        }
        v49 = v124;
        v71 = v139;
        if ((v77 & 1) != 0)
        {
          v43 = v123;
          (*(void (**)(unint64_t, char *, uint64_t))(v124 + 40))(v139[7] + *(_QWORD *)(v124 + 72) * v73, v130, v123);
        }
        else
        {
          v139[(v73 >> 6) + 8] |= 1 << v73;
          v138(v71[6] + v73 * v135, v137, v13);
          v43 = v123;
          (*(void (**)(unint64_t, char *, uint64_t))(v49 + 32))(v71[7] + *(_QWORD *)(v49 + 72) * v73, v130, v123);
          v80 = v71[2];
          v81 = __OFADD__(v80, 1);
          v82 = v80 + 1;
          if (v81)
            goto LABEL_43;
          v71[2] = v82;
        }
        *v127 = v139;
        swift_bridgeObjectRelease();
        v67(v137, v13);
        swift_endAccess();
        v46 = v121;
        v48 = v138;
      }
      v67((uint64_t)v51, v13);
      v50 = v134;
      v47 += v135;
      if (!--v45)
      {
        v126(v134, 1, 1, v13);
        break;
      }
    }
  }
  else
  {
    v46 = v121;
    v83 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v121 + 56);
    swift_bridgeObjectRetain();
    v83(v134, 1, 1, v13);
  }
  swift_bridgeObjectRelease();
  v84 = (uint64_t)v113;
  v51 = v122;
  sub_2496BAABC();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v84, 1, v13) == 1)
  {
    sub_249697880(v84, &qword_2544AFCC8);
    v125(v114, (uint64_t)v51, v43);
    v67 = (void (*)(uint64_t, uint64_t))v117;
    v69 = v117 + 16;
    swift_beginAccess();
    v71 = (_QWORD *)*((_QWORD *)v67 + 2);
    v85 = swift_isUniquelyReferenced_nonNull_native();
    *((_QWORD *)v67 + 2) = v71;
    v43 = v120;
    v73 = v119;
    if ((v85 & 1) == 0)
    {
LABEL_44:
      v71 = (_QWORD *)sub_2496A24A4(0, v71[2] + 1, 1, (unint64_t)v71);
      *v69 = v71;
    }
    v86 = (uint64_t)v118;
    v87 = (uint64_t)v116;
    v89 = v71[2];
    v88 = v71[3];
    if (v89 >= v88 >> 1)
    {
      v71 = (_QWORD *)sub_2496A24A4(v88 > 1, v89 + 1, 1, (unint64_t)v71);
      *v69 = v71;
    }
    v71[2] = v89 + 1;
    v90 = v124;
    (*(void (**)(unint64_t, char *, uint64_t))(v124 + 32))((unint64_t)v71+ ((*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80))+ *(_QWORD *)(v90 + 72) * v89, v114, v123);
    swift_endAccess();
  }
  else
  {
    v91 = v109;
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v109, v84, v13);
    v92 = *(void (**)(uint64_t, char *, uint64_t))(v46 + 16);
    v93 = v132;
    v92(v132, v91, v13);
    v94 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v124 + 56);
    v95 = (uint64_t)v110;
    v94(v110, 1, 1, v43);
    v67 = (void (*)(uint64_t, uint64_t))v117;
    swift_beginAccess();
    sub_2496A8868(v95, v93);
    swift_endAccess();
    v92(v93, v91, v13);
    v125((char *)v95, (uint64_t)v122, v43);
    v94((char *)v95, 0, 1, v43);
    v90 = v124;
    swift_beginAccess();
    v96 = v93;
    v51 = v122;
    sub_2496A8868(v95, v96);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v91, v13);
    v43 = v120;
    v73 = v119;
    v86 = (uint64_t)v118;
    v87 = (uint64_t)v116;
  }
  sub_2496BAA44();
  if (v115(v87, 1, v43) == 1)
  {
    (*(void (**)(char *, uint64_t))(v90 + 8))(v51, v123);
    sub_249697880(v87, &qword_2544AFD20);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 32))(v86, v87, v43);
    v97 = (_QWORD *)((char *)v67 + 48);
    swift_beginAccess();
    v98 = *((_QWORD *)v67 + 6);
    if (*(_QWORD *)(v98 + 16) && (v99 = sub_2496B6910(v86), (v100 & 1) != 0))
    {
      v101 = *(_QWORD *)(*(_QWORD *)(v98 + 56) + 8 * v99);
      swift_endAccess();
      swift_bridgeObjectRetain();
      v102 = sub_2496BAA98();
      v140 = v101;
      sub_2496B181C(v102, (uint64_t (*)(void))sub_2496A2490, (uint64_t (*)(_QWORD))MEMORY[0x24BEBB770]);
      v103 = v140;
    }
    else
    {
      swift_endAccess();
      v103 = sub_2496BAA98();
    }
    v104 = (uint64_t)v111;
    (*(void (**)(char *, uint64_t, uint64_t))(v73 + 16))(v111, v86, v43);
    swift_beginAccess();
    v105 = swift_isUniquelyReferenced_nonNull_native();
    v139 = (_QWORD *)*v97;
    *v97 = 0x8000000000000000;
    sub_249693948(v103, v104, v105);
    *v97 = v139;
    swift_bridgeObjectRelease();
    v106 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
    v106(v104, v43);
    swift_endAccess();
    v106(v86, v43);
    (*(void (**)(char *, uint64_t))(v124 + 8))(v51, v123);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2496AA224()
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
  uint64_t v9;
  char *v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(char *, unint64_t, uint64_t);
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  int64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int64_t v76;
  uint64_t v77;
  char *v78;
  unint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876AD0);
  v63 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v73 = (uint64_t)&v60 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD20);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2496BAB10();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v72 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_2496BAA38();
  v8 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v10 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2496BAAD4();
  v84 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2496BAA8C();
  v82 = *(_QWORD *)(v14 - 8);
  v83 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876CD0);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v74 = (uint64_t)&v60 - v21;
  swift_beginAccess();
  v22 = *(_QWORD *)(v0 + 32);
  v23 = *(_QWORD *)(v22 + 64);
  v61 = v22 + 64;
  v24 = 1 << *(_BYTE *)(v22 + 32);
  v25 = -1;
  if (v24 < 64)
    v25 = ~(-1 << v24);
  v79 = v25 & v23;
  v62 = (unint64_t)(v24 + 63) >> 6;
  v60 = v62 - 1;
  v71 = v22;
  result = swift_bridgeObjectRetain();
  v76 = 0;
  v77 = MEMORY[0x24BEE4AF8];
  v78 = v13;
  v80 = v16;
  v81 = v20;
  v69 = v5;
  v70 = v4;
  v68 = v6;
  v67 = v8;
  v66 = v11;
  v27 = v65;
  while (1)
  {
    if (v79)
    {
      v28 = __clz(__rbit64(v79));
      v79 &= v79 - 1;
      v29 = v28 | (v76 << 6);
LABEL_8:
      v30 = v71;
      (*(void (**)(char *, unint64_t, uint64_t))(v82 + 16))(v20, *(_QWORD *)(v71 + 48) + *(_QWORD *)(v82 + 72) * v29, v83);
      v31 = v84;
      v32 = *(_QWORD *)(v30 + 56) + *(_QWORD *)(v84 + 72) * v29;
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876CD8);
      v34 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
      v20 = v81;
      v34(&v81[*(int *)(v33 + 48)], v32, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v20, 0, 1, v33);
      v13 = v78;
      v16 = v80;
      goto LABEL_27;
    }
    v35 = v76 + 1;
    if (__OFADD__(v76, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    if (v35 < v62)
    {
      v36 = *(_QWORD *)(v61 + 8 * v35);
      if (v36)
        goto LABEL_12;
      v37 = v76 + 2;
      ++v76;
      if (v35 + 1 < v62)
      {
        v36 = *(_QWORD *)(v61 + 8 * v37);
        if (v36)
          goto LABEL_15;
        v76 = v35 + 1;
        if (v35 + 2 < v62)
        {
          v36 = *(_QWORD *)(v61 + 8 * (v35 + 2));
          if (v36)
          {
            v35 += 2;
            goto LABEL_12;
          }
          v37 = v35 + 3;
          v76 = v35 + 2;
          if (v35 + 3 < v62)
            break;
        }
      }
    }
LABEL_26:
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876CD8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v20, 1, 1, v38);
    v79 = 0;
LABEL_27:
    v39 = (uint64_t)v20;
    v40 = v74;
    sub_2496B4FBC(v39, v74, &qword_257876CD0);
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876CD8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 48))(v40, 1, v41) == 1)
    {
      swift_release();
      v59 = sub_2496AB128(v77);
      swift_bridgeObjectRelease();
      return v59;
    }
    v42 = v40 + *(int *)(v41 + 48);
    (*(void (**)(char *, uint64_t, uint64_t))(v82 + 32))(v16, v40, v83);
    (*(void (**)(char *, uint64_t, uint64_t))(v84 + 32))(v13, v42, v11);
    v85 = MEMORY[0x24BEE4AF8];
    v43 = sub_2496BAAA4();
    v44 = *(_QWORD *)(v43 + 16);
    if (v44)
    {
      v45 = v67;
      v46 = (*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80);
      v75 = v43;
      v47 = v43 + v46;
      v48 = *(_QWORD *)(v67 + 72);
      v49 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v67 + 16);
      v50 = v80;
      do
      {
        v51 = v49(v10, v47, v27);
        MEMORY[0x24BDAC7A8](v51);
        *(&v60 - 2) = (int64_t)v50;
        *(&v60 - 1) = (int64_t)&v85;
        sub_2496BA9A8();
        (*(void (**)(char *, uint64_t))(v45 + 8))(v10, v27);
        v47 += v48;
        --v44;
      }
      while (v44);
      swift_bridgeObjectRelease();
      v5 = v69;
      v4 = v70;
      v6 = v68;
      v11 = v66;
      v13 = v78;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_2496BAA44();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      (*(void (**)(char *, uint64_t))(v84 + 8))(v13, v11);
      v16 = v80;
      (*(void (**)(char *, uint64_t))(v82 + 8))(v80, v83);
      sub_249697880((uint64_t)v4, &qword_2544AFD20);
      v20 = v81;
    }
    else
    {
      v52 = v72;
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v72, v4, v5);
      v53 = v85;
      v54 = *(int *)(v64 + 48);
      v55 = v73;
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(v73, v52, v5);
      *(_QWORD *)(v55 + v54) = v53;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v77 = sub_2496A26C4(0, *(_QWORD *)(v77 + 16) + 1, 1, v77);
      v57 = *(_QWORD *)(v77 + 16);
      v56 = *(_QWORD *)(v77 + 24);
      v16 = v80;
      v20 = v81;
      if (v57 >= v56 >> 1)
        v77 = sub_2496A26C4(v56 > 1, v57 + 1, 1, v77);
      v58 = v77;
      *(_QWORD *)(v77 + 16) = v57 + 1;
      sub_2496B4FBC(v73, v58+ ((*(unsigned __int8 *)(v63 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80))+ *(_QWORD *)(v63 + 72) * v57, &qword_257876AD0);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v72, v5);
      v13 = v78;
      (*(void (**)(char *, uint64_t))(v84 + 8))(v78, v11);
      (*(void (**)(char *, uint64_t))(v82 + 8))(v16, v83);
    }
    result = swift_bridgeObjectRelease();
  }
  v36 = *(_QWORD *)(v61 + 8 * v37);
  if (v36)
  {
LABEL_15:
    v35 = v37;
LABEL_12:
    v79 = (v36 - 1) & v36;
    v29 = __clz(__rbit64(v36)) + (v35 << 6);
    v76 = v35;
    goto LABEL_8;
  }
  while (1)
  {
    v35 = v37 + 1;
    if (__OFADD__(v37, 1))
      break;
    if (v35 >= v62)
    {
      v76 = v60;
      goto LABEL_26;
    }
    v36 = *(_QWORD *)(v61 + 8 * v35);
    ++v37;
    if (v36)
      goto LABEL_12;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2496AA9E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_2496BAA14();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2496BAA2C();
}

uint64_t sub_2496AAA5C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X3>, uint64_t a5@<X8>)
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  unint64_t *v37;
  unint64_t v38;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  unint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t, uint64_t);
  uint64_t v55;

  v45 = a4;
  v42 = a3;
  v54 = a2;
  v55 = a5;
  v6 = sub_2496BAA8C();
  v46 = *(_QWORD *)(v6 - 8);
  v47 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_2496BAA68();
  v51 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v50 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD20);
  MEMORY[0x24BDAC7A8](v9);
  v49 = sub_2496BA9C0();
  v53 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v52 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2496BAA14();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v48 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v42 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v42 - v18;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v20((char *)&v42 - v18, a1, v11);
  v21 = *(uint64_t (**)(char *, uint64_t))(v12 + 88);
  v22 = v21(v19, v11);
  if ((_DWORD)v22 == *MEMORY[0x24BEBB978])
  {
    v23 = v22;
    (*(void (**)(char *, uint64_t))(v12 + 96))(v19, v11);
    v24 = sub_2496BA9FC();
    v25 = v55;
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v55, v19, v24);
    sub_2496BAA44();
    sub_2496BA9E4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 104))(v25, v23, v11);
  }
  v27 = v55;
  v28 = *(void (**)(char *, uint64_t))(v12 + 8);
  v28(v19, v11);
  v20(v17, a1, v11);
  if (v21(v17, v11) == *MEMORY[0x24BEBB970])
  {
    (*(void (**)(char *, uint64_t))(v12 + 96))(v17, v11);
    v29 = v49;
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(v52, v17, v49);
    v30 = sub_2496BA9B4();
    if (v31 >> 60 != 15)
    {
      v32 = v30;
      v33 = v31;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v42 + 56), *(_QWORD *)(v42 + 80));
      sub_249699408(v32, v33);
      sub_2496B5058(v32, v33);
    }
    (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v29);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v20)(v27, a1, v11);
  }
  v28(v17, v11);
  v34 = v48;
  v20(v48, a1, v11);
  if (v21(v34, v11) != *MEMORY[0x24BEBB960])
  {
    v28(v34, v11);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v20)(v27, a1, v11);
  }
  v54 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v20;
  (*(void (**)(char *, uint64_t))(v12 + 96))(v34, v11);
  v35 = v43;
  (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v50, v34, v43);
  v36 = v44;
  sub_2496BAA5C();
  v37 = v45;
  v38 = *v45;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v37 = v38;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v38 = sub_2496A2C48(0, *(_QWORD *)(v38 + 16) + 1, 1, v38);
    *v37 = v38;
  }
  v41 = *(_QWORD *)(v38 + 16);
  v40 = *(_QWORD *)(v38 + 24);
  if (v41 >= v40 >> 1)
  {
    v38 = sub_2496A2C48(v40 > 1, v41 + 1, 1, v38);
    *v37 = v38;
  }
  *(_QWORD *)(v38 + 16) = v41 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v46 + 32))(v38+ ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80))+ *(_QWORD *)(v46 + 72) * v41, v36, v47);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v35);
  return v54(v27, a1, v11);
}

uint64_t sub_2496AAEDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
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
  char *v16;
  char v17;
  uint64_t v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a4;
  v30 = a3;
  v28 = a2;
  v5 = sub_2496BAA8C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2496BAA14();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2496BAA68();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496BAA20();
  if ((*(unsigned int (**)(char *, uint64_t))(v10 + 88))(v12, v9) != *MEMORY[0x24BEBB960])
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v27 = a1;
  (*(void (**)(char *, uint64_t))(v10 + 96))(v12, v9);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  sub_2496BAA5C();
  v17 = sub_2496BAA80();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if ((v17 & 1) == 0)
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF78);
  v18 = sub_2496BAA38();
  v19 = MEMORY[0x24BEBB9B8];
  v20 = *(_QWORD *)(v18 - 8);
  v21 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_2496BBD40;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v20 + 16))(v22 + v21, v27, v18);
  v31 = v22;
  v23 = swift_bridgeObjectRetain();
  sub_2496B181C(v23, (uint64_t (*)(void))sub_2496A29E0, (uint64_t (*)(_QWORD))v19);
  v24 = v31;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  *v29 = v24;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2496AB128(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876AD0);
  v2 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFCE8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_2496A2D44(0, v9, 0);
    v11 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v12 = *(_QWORD *)(v2 + 72);
    v10 = v17;
    do
    {
      sub_2496B506C(v11, (uint64_t)v4, &qword_257876AD0);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2496A2D44(0, *(_QWORD *)(v10 + 16) + 1, 1);
        v10 = v17;
      }
      v14 = *(_QWORD *)(v10 + 16);
      v13 = *(_QWORD *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_2496A2D44(v13 > 1, v14 + 1, 1);
        v10 = v17;
      }
      *(_QWORD *)(v10 + 16) = v14 + 1;
      sub_2496B4FBC((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v14, &qword_2544AFCE8);
      v11 += v12;
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_2496AB2E8(_QWORD *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  int v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t result;
  char *v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  NSObject *v69;
  os_signpost_type_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint8_t *v75;
  uint8_t *v76;
  os_signpost_id_t v77;
  void (*v78)(char *, uint64_t);
  uint64_t *v79;
  uint64_t v80;
  uint8_t *v81;
  uint8_t *v82;
  int v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  char *v98;
  unint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t aBlock[9];

  v3 = v2;
  v100 = a1;
  v5 = *v2;
  v91 = sub_2496BAD14();
  v90 = *(_QWORD *)(v91 - 8);
  v6 = MEMORY[0x24BDAC7A8](v91);
  v87 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v96 = (char *)&v81 - v8;
  v97 = sub_2496BAD50();
  v93 = *(_QWORD *)(v97 - 8);
  v9 = MEMORY[0x24BDAC7A8](v97);
  v92 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v98 = (char *)&v81 - v11;
  v102 = type metadata accessor for FragmentCollator.RootElement();
  v12 = *(uint64_t **)(v102 - 8);
  MEMORY[0x24BDAC7A8](v102);
  v14 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_2496BAA38();
  v15 = *(_QWORD *)(v101 - 8);
  MEMORY[0x24BDAC7A8](v101);
  v17 = (char *)&v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = sub_2496BADB0();
  v88 = *(_QWORD *)(v94 - 8);
  MEMORY[0x24BDAC7A8](v94);
  v19 = (char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *a2;
  v21 = a2[1];
  v22 = a2[2];
  v23 = a2[3];
  v86 = mach_continuous_time();
  v99 = sub_2496ABCEC();
  v24 = sub_2496A6B80();
  v25 = swift_bridgeObjectRetain();
  v26 = sub_2496B2238(v25);
  v95 = v24;
  swift_bridgeObjectRelease();
  v27 = sub_2496A89F4((uint64_t)v26);
  swift_release();
  if (*(_QWORD *)(v27 + 16))
  {
    sub_2496BAD98();
    swift_bridgeObjectRetain();
    v28 = sub_2496BADA4();
    v29 = sub_2496BB008();
    v30 = v29;
    if (os_log_type_enabled(v28, v29))
    {
      v89 = v5;
      v31 = swift_slowAlloc();
      v83 = v30;
      v32 = (uint8_t *)v31;
      v84 = swift_slowAlloc();
      aBlock[0] = v84;
      v82 = v32;
      *(_DWORD *)v32 = 136446210;
      v81 = v32 + 4;
      v33 = swift_bridgeObjectRetain();
      v34 = MEMORY[0x24BCF568C](v33, MEMORY[0x24BEE0D00]);
      v85 = v12;
      v35 = v3;
      v37 = v36;
      swift_bridgeObjectRelease();
      v38 = v34;
      v5 = v89;
      aBlock[6] = sub_2496926A4(v38, v37, aBlock);
      sub_2496BB134();
      swift_bridgeObjectRelease_n();
      v3 = v35;
      v12 = v85;
      swift_bridgeObjectRelease();
      v39 = v82;
      _os_log_impl(&dword_249686000, v28, (os_log_type_t)v83, "collection prohibited due to management policy: %{public}s", v82, 0xCu);
      v40 = v84;
      swift_arrayDestroy();
      MEMORY[0x24BCF5FEC](v40, -1, -1);
      MEMORY[0x24BCF5FEC](v39, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v88 + 8))(v19, v94);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v41 = v99;
  __swift_project_boxed_opaque_existential_1(v3 + 7, v3[10]);
  v42 = sub_2496987CC();
  v94 = sub_2496B2B20(v42);
  if ((sub_2496BAC54() & 1) != 0)
  {
    v88 = v42;
    v89 = v5;
    v43 = *(_QWORD *)(v41 + 16);
    v44 = MEMORY[0x24BEE4AF8];
    if (v43)
    {
      v85 = v3;
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_2496A2D8C(0, v43, 0);
      v45 = v41 + ((*((unsigned __int8 *)v12 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v12 + 80));
      v46 = v12[9];
      v47 = v101;
      do
      {
        sub_24968BA44(v45, (uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for FragmentCollator.RootElement);
        (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v17, &v14[*(int *)(v102 + 20)], v47);
        sub_2496B2E00((uint64_t)v14);
        v44 = aBlock[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2496A2D8C(0, *(_QWORD *)(v44 + 16) + 1, 1);
          v47 = v101;
          v44 = aBlock[0];
        }
        v49 = *(_QWORD *)(v44 + 16);
        v48 = *(_QWORD *)(v44 + 24);
        if (v49 >= v48 >> 1)
        {
          sub_2496A2D8C(v48 > 1, v49 + 1, 1);
          v47 = v101;
          v44 = aBlock[0];
        }
        *(_QWORD *)(v44 + 16) = v49 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v44+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v15 + 72) * v49, v17, v47);
        aBlock[0] = v44;
        v45 += v46;
        --v43;
      }
      while (v43);
      v3 = v85;
    }
    v50 = sub_2496ABFB8(v88, v44);
    swift_bridgeObjectRelease();
    v51 = v96;
    v52 = v98;
    v5 = v89;
  }
  else
  {
    v50 = 0;
    v51 = v96;
    v52 = v98;
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v53 = v3[5];
  swift_bridgeObjectRetain();
  v54 = sub_2496BAC30();
  type metadata accessor for FragmentCollator.FragmentResolutionContext();
  v55 = swift_allocObject();
  v56 = v95;
  *(_QWORD *)(v55 + 16) = v53;
  *(_QWORD *)(v55 + 24) = v56;
  *(_BYTE *)(v55 + 32) = v54 & 1;
  *(_QWORD *)(v55 + 40) = v94;
  *(_QWORD *)(v55 + 48) = v50;
  *(_QWORD *)(v55 + 56) = v20;
  *(_QWORD *)(v55 + 64) = v21;
  *(_QWORD *)(v55 + 72) = v22;
  *(_QWORD *)(v55 + 80) = v23;
  *(_BYTE *)(v55 + 88) = 0;
  v57 = swift_allocObject();
  *(_QWORD *)(v57 + 16) = 0;
  v102 = v57 + 16;
  v58 = (_QWORD *)swift_allocObject();
  v59 = v99;
  v58[2] = v57;
  v58[3] = v59;
  v58[4] = v55;
  v58[5] = v5;
  v60 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  if (objc_msgSend(v60, sel_isMainThread))
  {
    sub_2496AC4DC(v57, v59, v55, v5);
    swift_bridgeObjectRelease();
    v100 = 0;
    v101 = 0;
    v61 = v97;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2496B2D7C();
    v62 = sub_2496BB05C();
    v63 = swift_allocObject();
    v101 = (uint64_t)sub_2496B2D70;
    *(_QWORD *)(v63 + 16) = sub_2496B2D70;
    *(_QWORD *)(v63 + 24) = v58;
    aBlock[4] = (uint64_t)sub_2496B2DC8;
    aBlock[5] = v63;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2496AE064;
    aBlock[3] = (uint64_t)&block_descriptor_3;
    v64 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync((dispatch_queue_t)v62, v64);

    _Block_release(v64);
    LOBYTE(v62) = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    v61 = v97;
    if ((v62 & 1) != 0)
    {
      __break(1u);
      goto LABEL_28;
    }
    v100 = v58;
    v52 = v98;
  }
  sub_2496BAD38();
  v66 = v92;
  sub_2496BAD38();
  sub_2496BAD44();
  swift_unknownObjectRetain();
  sub_2496BACFC();
  v67 = *(void (**)(char *, uint64_t))(v93 + 8);
  v67(v66, v61);
  sub_249696DD0();
  sub_24968E5F0();
  sub_249696E14(v68);
  v69 = sub_2496BAD44();
  v70 = sub_2496BB0D4();
  if ((sub_2496BB110() & 1) != 0)
  {
    v71 = v51;
    v72 = v90;
    v73 = v87;
    v74 = v91;
    (*(void (**)(char *, char *, uint64_t))(v90 + 16))(v87, v71, v91);
    v75 = (uint8_t *)swift_slowAlloc();
    v99 = v57;
    v76 = v75;
    *(_DWORD *)v75 = 134217984;
    aBlock[0] = v86;
    sub_2496BB134();
    v77 = sub_2496BAD08();
    _os_signpost_emit_with_name_impl(&dword_249686000, v69, v70, v77, "ResolveHierarchy", "%{public, signpost.description:begin_time}llu", v76, 0xCu);
    MEMORY[0x24BCF5FEC](v76, -1, -1);

    v78 = *(void (**)(char *, uint64_t))(v72 + 8);
    v78(v96, v74);
    v67(v98, v97);
    v78(v73, v74);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v90 + 8))(v51, v91);
    v67(v52, v61);
  }
  v79 = (uint64_t *)v102;
  result = swift_beginAccess();
  v80 = *v79;
  if (*v79)
  {
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
    swift_release();
    sub_249696E14(v101);
    return v80;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_2496ABCEC()
{
  uint64_t v0;
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
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
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
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v1 = type metadata accessor for FragmentCollator.RootElement();
  v35 = *(_QWORD *)(v1 - 8);
  v36 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2496BAAD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BEE4AF8];
  v39 = MEMORY[0x24BEE4AF8];
  swift_beginAccess();
  v9 = *(_QWORD *)(v0 + 16);
  v31 = *(_QWORD *)(v9 + 16);
  v32 = v0;
  if (v31)
  {
    v30 = v9 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v10 = *(_QWORD *)(v5 + 72);
    v28 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v29 = v10;
    v25[1] = v9;
    swift_bridgeObjectRetain();
    v11 = 0;
    v27 = v4;
    v26 = v5;
    do
    {
      v28(v7, v30 + v29 * v11, v4);
      v12 = sub_2496BAAA4();
      v13 = *(_QWORD *)(v12 + 16);
      if (v13)
      {
        v34 = v11;
        v38 = v8;
        sub_2496A2D60(0, v13, 0);
        v14 = v38;
        v37 = sub_2496BAA38();
        v15 = *(_QWORD *)(v37 - 8);
        v16 = *(unsigned __int8 *)(v15 + 80);
        v33 = v12;
        v17 = v12 + ((v16 + 32) & ~v16);
        v18 = *(_QWORD *)(v15 + 72);
        do
        {
          v19 = v7;
          sub_2496BAA74();
          (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(&v3[*(int *)(v36 + 20)], v17, v37);
          v20 = v42;
          v21 = v40;
          *((_OWORD *)v3 + 1) = v41;
          *((_OWORD *)v3 + 2) = v20;
          *(_OWORD *)v3 = v21;
          v38 = v14;
          v23 = *(_QWORD *)(v14 + 16);
          v22 = *(_QWORD *)(v14 + 24);
          if (v23 >= v22 >> 1)
          {
            sub_2496A2D60(v22 > 1, v23 + 1, 1);
            v14 = v38;
          }
          *(_QWORD *)(v14 + 16) = v23 + 1;
          sub_24968BC5C((uint64_t)v3, v14+ ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80))+ *(_QWORD *)(v35 + 72) * v23, (uint64_t (*)(_QWORD))type metadata accessor for FragmentCollator.RootElement);
          v17 += v18;
          --v13;
          v7 = v19;
        }
        while (v13);
        swift_bridgeObjectRelease();
        v4 = v27;
        v5 = v26;
        v8 = MEMORY[0x24BEE4AF8];
        v11 = v34;
      }
      else
      {
        swift_bridgeObjectRelease();
        v14 = v8;
      }
      ++v11;
      sub_2496AE084(v14, &v39);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    while (v11 != v31);
    swift_bridgeObjectRelease();
    return v39;
  }
  return v8;
}

uint64_t sub_2496ABFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  id v31;
  id v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  char v35;
  unint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  void *v49;
  uint64_t DifferenceWithRegion;
  uint64_t result;
  _QWORD v52[2];
  __int128 v53;
  id v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  unint64_t v66;
  _QWORD *v67;
  uint64_t v68;

  v4 = sub_2496BADB0();
  v58 = *(_QWORD *)(v4 - 8);
  v59 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2496AFB00(a2);
  v8 = sub_2496AF350(a2, 0);
  v66 = sub_2496A949C(MEMORY[0x24BEE4AF8]);
  v68 = 0;
  v62 = *(_QWORD *)(a1 + 16);
  if (v62)
  {
    v57 = a1 + 32;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    v9 = 0;
    *(_QWORD *)&v10 = 134349570;
    v53 = v10;
    v52[1] = MEMORY[0x24BEE4AD8] + 8;
    v55 = a1;
    v56 = v6;
    v64 = v8;
    v60 = v7;
    while (!__OFADD__(v68, 1))
    {
      v63 = v9;
      v11 = *(_QWORD *)(v57 + 8 * v9);
      ++v68;
      swift_bridgeObjectRetain();
      sub_2496BAD98();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v12 = sub_2496BADA4();
      v13 = sub_2496BB008();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = swift_slowAlloc();
        v15 = swift_slowAlloc();
        v67 = (_QWORD *)v15;
        *(_DWORD *)v14 = v53;
        *(_QWORD *)(v14 + 4) = v68;
        *(_WORD *)(v14 + 12) = 2050;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v14 + 14) = v62;
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 22) = 2082;
        v16 = swift_bridgeObjectRetain();
        v17 = a1;
        v18 = MEMORY[0x24BCF568C](v16, MEMORY[0x24BEE0D00]);
        v20 = v19;
        swift_bridgeObjectRelease();
        v21 = v18;
        a1 = v17;
        *(_QWORD *)(v14 + 24) = sub_2496926A4(v21, v20, (uint64_t *)&v67);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_249686000, v12, v13, "windowZOrderList for screen %{public}ld of %{public}ld: %{public}s", (uint8_t *)v14, 0x20u);
        swift_arrayDestroy();
        v22 = v15;
        v7 = v60;
        MEMORY[0x24BCF5FEC](v22, -1, -1);
        MEMORY[0x24BCF5FEC](v14, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v58 + 8))(v6, v59);
      v23 = v63 + 1;
      v24 = *(_QWORD *)(v11 + 16);
      if (v24)
      {
        ++v63;
        v25 = v7;
        v61 = v11;
        v26 = (uint64_t *)(v11 + 40);
        v54 = v25;
        do
        {
          if (*(_QWORD *)(v8 + 16))
          {
            v28 = *(v26 - 1);
            v27 = *v26;
            swift_bridgeObjectRetain();
            v29 = sub_2496B6B78(v28, v27);
            if ((v30 & 1) != 0)
            {
              v31 = *(id *)(*(_QWORD *)(v8 + 56) + 8 * v29);
              v65 = v25;
              v32 = (id)CGRegionCreateIntersectionWithRegion();
              v33 = v66;
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              v67 = (_QWORD *)v33;
              v36 = sub_2496B6B78(v28, v27);
              v37 = *(_QWORD *)(v33 + 16);
              v38 = (v35 & 1) == 0;
              v39 = v37 + v38;
              if (__OFADD__(v37, v38))
              {
                __break(1u);
LABEL_35:
                __break(1u);
                goto LABEL_36;
              }
              v40 = v35;
              if (*(_QWORD *)(v33 + 24) >= v39)
              {
                if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                  sub_249694C04();
              }
              else
              {
                sub_2496B0E74(v39, isUniquelyReferenced_nonNull_native);
                v41 = sub_2496B6B78(v28, v27);
                if ((v40 & 1) != (v42 & 1))
                  goto LABEL_38;
                v36 = v41;
              }
              v43 = v67;
              v66 = (unint64_t)v67;
              if ((v40 & 1) != 0)
              {
                v44 = v67[7];

                *(_QWORD *)(v44 + 8 * v36) = v32;
              }
              else
              {
                v67[(v36 >> 6) + 8] |= 1 << v36;
                v45 = (uint64_t *)(v43[6] + 16 * v36);
                *v45 = v28;
                v45[1] = v27;
                *(_QWORD *)(v43[7] + 8 * v36) = v32;
                v46 = v43[2];
                v47 = __OFADD__(v46, 1);
                v48 = v46 + 1;
                if (v47)
                  goto LABEL_35;
                v43[2] = v48;
                swift_bridgeObjectRetain();
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v49 = v65;
              DifferenceWithRegion = CGRegionCreateDifferenceWithRegion();

              v25 = (id)DifferenceWithRegion;
              v8 = v64;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
          }
          v26 += 2;
          --v24;
        }
        while (v24);

        swift_bridgeObjectRelease();
        v9 = v63;
        if (v63 != v62)
        {
          a1 = v55;
          v7 = v60;
          goto LABEL_5;
        }

        goto LABEL_32;
      }
      swift_bridgeObjectRelease();
      if (v23 == v62)
      {

LABEL_32:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v66;
      }
      v9 = v23;
LABEL_5:
      v6 = v56;
      if (v9 == v62)
        goto LABEL_37;
    }
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    result = sub_2496BB398();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();

    return v66;
  }
  return result;
}

uint64_t sub_2496AC4DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;

  swift_retain();
  v8 = sub_2496B4D3C(a2, a3, a4);
  swift_release();
  swift_beginAccess();
  *(_QWORD *)(a1 + 16) = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2496AC568@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  _OWORD v13[3];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD20);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t)a1 + *(int *)(type metadata accessor for FragmentCollator.RootElement() + 20);
  v10 = sub_2496BAB10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  v11 = a1[1];
  v13[0] = *a1;
  v13[1] = v11;
  v13[2] = a1[2];
  sub_2496AC660(v9, a2, 0, *(CGFloat *)&v8, (CGFloat *)v13, a3);
  return sub_249697880((uint64_t)v8, &qword_2544AFD20);
}

uint64_t sub_2496AC660@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, CGFloat a4@<X3>, CGFloat *a5@<X4>, uint64_t a6@<X8>)
{
  CGFloat a;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat tx;
  CGFloat ty;
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
  char *v37;
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
  char *v58;
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
  char *v75;
  void (*v76)(char *, unint64_t, uint64_t);
  uint64_t v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  char *v82;
  id v83;
  uint64_t v84;
  uint64_t v86;
  BOOL v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(char *, uint64_t, uint64_t);
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char v134;
  char v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  unint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  void (*v151)(char *, uint64_t, uint64_t);
  char *v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  unint64_t v156;
  CGFloat v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  unint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  void (*v169)(char *, uint64_t, uint64_t);
  char *v170;
  unint64_t v171;
  unint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void (*v178)(void);
  char *v179;
  void (*v180)(uint64_t, char *, uint64_t);
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t (*v184)(uint64_t, uint64_t, uint64_t);
  int v185;
  uint64_t (*v186)(uint64_t, uint64_t, uint64_t);
  uint64_t v187;
  int v188;
  char *v189;
  uint64_t v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  char *v194;
  char *v195;
  char *v196;
  char *v197;
  char v198;
  void (*v199)(char *, uint64_t);
  char *v200;
  uint64_t v201;
  char *v202;
  uint64_t v203;
  void (*v204)(CGAffineTransform *, _QWORD);
  unint64_t *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  char *v209;
  uint64_t v210;
  char *v211;
  char *v212;
  uint64_t v213;
  uint64_t v214;
  char *v215;
  char *v216;
  char *v217;
  uint64_t v218;
  int v219;
  uint64_t v220;
  char *v221;
  char *v222;
  uint64_t v223;
  char *v224;
  char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  char *v230;
  char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t (*v235)(char *, uint64_t, uint64_t);
  uint64_t v236;
  uint64_t v237;
  char *v238;
  uint64_t v239;
  uint64_t v240;
  char *v241;
  char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  char *v248;
  char *v249;
  uint64_t v250;
  char *v251;
  char *v252;
  char *v253;
  uint64_t v254;
  CGFloat v255;
  id v256;
  char *v257;
  char *v258;
  uint64_t v259;
  void (*v260)(char *, unint64_t, uint64_t);
  uint64_t v261;
  void (*v262)(uint64_t, char *, uint64_t);
  uint64_t v263;
  CGAffineTransform v264;
  CGAffineTransform v265;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGRect v268;
  CGRect v269;

  v255 = a4;
  v244 = a6;
  a = *a5;
  b = a5[1];
  c = a5[2];
  d = a5[3];
  tx = a5[4];
  ty = a5[5];
  v234 = (uint64_t)a5;
  v213 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD28);
  MEMORY[0x24BDAC7A8](v213);
  v214 = (uint64_t)&v208 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFCB0);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v258 = (char *)&v208 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v257 = (char *)&v208 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFCD8);
  MEMORY[0x24BDAC7A8](v20);
  v230 = (char *)&v208 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v229 = sub_2496BAA8C();
  v228 = *(_QWORD *)(v229 - 8);
  MEMORY[0x24BDAC7A8](v229);
  v241 = (char *)&v208 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v233 = sub_2496BAAD4();
  v232 = *(_QWORD *)(v233 - 8);
  MEMORY[0x24BDAC7A8](v233);
  v231 = (char *)&v208 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v240 = sub_2496BAA68();
  v239 = *(_QWORD *)(v240 - 8);
  v24 = MEMORY[0x24BDAC7A8](v240);
  v211 = (char *)&v208 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v238 = (char *)&v208 - v26;
  v247 = sub_2496BAB10();
  v246 = *(_QWORD *)(v247 - 8);
  v27 = MEMORY[0x24BDAC7A8](v247);
  v212 = (char *)&v208 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v221 = (char *)&v208 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v215 = (char *)&v208 - v31;
  v243 = sub_2496BAA14();
  v245 = *(_QWORD *)(v243 - 8);
  v32 = MEMORY[0x24BDAC7A8](v243);
  v217 = (char *)&v208 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v32);
  v242 = (char *)&v208 - v35;
  MEMORY[0x24BDAC7A8](v34);
  v37 = (char *)&v208 - v36;
  v227 = sub_2496BA9FC();
  v226 = *(_QWORD *)(v227 - 8);
  MEMORY[0x24BDAC7A8](v227);
  v225 = (char *)&v208 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD20);
  v40 = MEMORY[0x24BDAC7A8](v39);
  v210 = (uint64_t)&v208 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = MEMORY[0x24BDAC7A8](v40);
  v218 = (uint64_t)&v208 - v43;
  v44 = MEMORY[0x24BDAC7A8](v42);
  v220 = (uint64_t)&v208 - v45;
  v46 = MEMORY[0x24BDAC7A8](v44);
  v261 = (uint64_t)&v208 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v223 = (uint64_t)&v208 - v49;
  v50 = MEMORY[0x24BDAC7A8](v48);
  v222 = (char *)&v208 - v51;
  v52 = MEMORY[0x24BDAC7A8](v50);
  v237 = (uint64_t)&v208 - v53;
  v54 = MEMORY[0x24BDAC7A8](v52);
  v224 = (char *)&v208 - v55;
  v56 = MEMORY[0x24BDAC7A8](v54);
  v58 = (char *)&v208 - v57;
  MEMORY[0x24BDAC7A8](v56);
  v250 = (uint64_t)&v208 - v59;
  v60 = sub_2496BAA38();
  v61 = *(_QWORD *)(v60 - 8);
  v62 = MEMORY[0x24BDAC7A8](v60);
  v253 = (char *)&v208 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = MEMORY[0x24BDAC7A8](v62);
  v249 = (char *)&v208 - v65;
  v66 = MEMORY[0x24BDAC7A8](v64);
  v216 = (char *)&v208 - v67;
  v68 = MEMORY[0x24BDAC7A8](v66);
  v248 = (char *)&v208 - v69;
  v70 = MEMORY[0x24BDAC7A8](v68);
  v252 = (char *)&v208 - v71;
  v72 = MEMORY[0x24BDAC7A8](v70);
  v251 = (char *)&v208 - v73;
  MEMORY[0x24BDAC7A8](v72);
  v75 = (char *)&v208 - v74;
  v76 = *(void (**)(char *, unint64_t, uint64_t))(v61 + 16);
  v263 = v77;
  v260 = v76;
  ((void (*)(char *, uint64_t))v76)((char *)&v208 - v74, a1);
  sub_2496BA930();
  LODWORD(a1) = CGRectIsNull(v268);
  sub_2496BA930();
  v79 = v78;
  v81 = v80;
  v219 = a1;
  if ((a1 & 1) != 0)
  {
    v82 = v75;
    v83 = a3;
  }
  else
  {
    sub_2496BA930();
    t1.a = a;
    t1.b = b;
    t1.c = c;
    t1.d = d;
    t1.tx = tx;
    t1.ty = ty;
    CGRectApplyAffineTransform(v269, &t1);
    sub_2496BA93C();
    v82 = v75;
    a3 = (void *)sub_2496B2E3C((uint64_t)v75, a2, a3);
    if (a3 == (void *)1)
    {
      v84 = v263;
      (*(void (**)(char *, uint64_t))(v61 + 8))(v75, v263);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 56))(v244, 1, 1, v84);
    }
  }
  v256 = a3;
  v236 = 0;
  v86 = v250;
  sub_2496B506C(*(uint64_t *)&v255, v250, &qword_2544AFD20);
  sub_2496B506C(v86, (uint64_t)v58, &qword_2544AFD20);
  v235 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v246 + 48);
  LODWORD(v86) = v235(v58, 1, v247);
  sub_249697880((uint64_t)v58, &qword_2544AFD20);
  v87 = (_DWORD)v86 == 1;
  v254 = a2;
  v88 = v82;
  v89 = v243;
  if (v87)
  {
    sub_2496BAA20();
    v90 = v245;
    if ((*(unsigned int (**)(char *, uint64_t))(v245 + 88))(v37, v89) != *MEMORY[0x24BEBB978])
    {
      (*(void (**)(char *, uint64_t))(v90 + 8))(v37, v89);
      goto LABEL_19;
    }
    v209 = v88;
    (*(void (**)(char *, uint64_t))(v90 + 96))(v37, v89);
    v91 = v226;
    v92 = v225;
    v93 = v227;
    (*(void (**)(void))(v226 + 32))();
    v94 = (uint64_t)v224;
    sub_2496BA9D8();
    v95 = v247;
    if (v235((char *)v94, 1, v247) == 1)
    {
      (*(void (**)(char *, uint64_t))(v91 + 8))(v92, v93);
      sub_249697880(v94, &qword_2544AFD20);
      v88 = v209;
      goto LABEL_19;
    }
    v96 = v244;
    v97 = *(void (**)(char *, uint64_t, uint64_t))(v246 + 32);
    v98 = v215;
    v97(v215, v94, v95);
    v99 = sub_2496BAAEC();
    v88 = v209;
    if (v100)
    {
      v101 = *(_QWORD *)(v254 + 24);
      if (*(_QWORD *)(v101 + 16))
      {
        v102 = sub_2496B6B78(v99, v100);
        if ((v103 & 1) != 0)
        {
          v104 = *(unsigned __int8 *)(*(_QWORD *)(v101 + 56) + v102);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v226 + 8))(v225, v227);
          if (v104 == 1)
          {
            (*(void (**)(char *, uint64_t))(v246 + 8))(v98, v247);

            v105 = v263;
            (*(void (**)(char *, uint64_t))(v61 + 8))(v88, v263);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 56))(v96, 1, 1, v105);
LABEL_84:
            v137 = v250;
            return sub_249697880(v137, &qword_2544AFD20);
          }
          goto LABEL_18;
        }
      }
      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v226 + 8))(v225, v227);
LABEL_18:
    v106 = v250;
    sub_249697880(v250, &qword_2544AFD20);
    v107 = v247;
    v97((char *)v106, (uint64_t)v98, v247);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v246 + 56))(v106, 0, 1, v107);
    a2 = v254;
    v89 = v243;
  }
LABEL_19:
  v108 = v242;
  sub_2496BAA20();
  v109 = v245;
  if ((*(unsigned int (**)(char *, uint64_t))(v245 + 88))(v108, v89) != *MEMORY[0x24BEBB960])
  {
    (*(void (**)(char *, uint64_t))(v109 + 8))(v108, v89);
LABEL_28:
    v119 = v234;
    v120 = sub_2496BA954();
    v121 = (uint64_t)v256;
    v122 = v256;
    swift_retain();
    sub_2496B4A54(v120, (uint64_t)v262, a2, v121, v250, v119);
    a2 = v254;
    swift_bridgeObjectRelease();
    swift_release();

    sub_2496BA960();
    goto LABEL_81;
  }
  (*(void (**)(char *, uint64_t))(v109 + 96))(v108, v89);
  (*(void (**)(char *, char *, uint64_t))(v239 + 32))(v238, v108, v240);
  v110 = *(_QWORD *)(a2 + 16);
  v111 = (uint64_t)v241;
  sub_2496BAA5C();
  if (*(_QWORD *)(v110 + 16))
  {
    v112 = sub_2496B6AE0(v111);
    v113 = (uint64_t)v230;
    if ((v114 & 1) != 0)
    {
      v115 = *(_QWORD *)(v110 + 56);
      v116 = v232;
      v117 = v233;
      (*(void (**)(char *, unint64_t, uint64_t))(v232 + 16))(v230, v115 + *(_QWORD *)(v232 + 72) * v112, v233);
      v118 = 0;
    }
    else
    {
      v118 = 1;
      v117 = v233;
      v116 = v232;
    }
  }
  else
  {
    v118 = 1;
    v117 = v233;
    v116 = v232;
    v113 = (uint64_t)v230;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v116 + 56))(v113, v118, 1, v117);
  (*(void (**)(char *, uint64_t))(v228 + 8))(v241, v229);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v116 + 48))(v113, 1, v117) == 1)
  {
    (*(void (**)(char *, uint64_t))(v239 + 8))(v238, v240);
    sub_249697880(v113, (uint64_t *)&unk_2544AFCD8);
    goto LABEL_28;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v116 + 32))(v231, v113, v117);
  v123 = (uint64_t)v222;
  sub_2496BAA44();
  v124 = v247;
  if (v235((char *)v123, 1, v247) == 1)
  {
    v125 = v237;
    sub_2496B506C(v250, v237, &qword_2544AFD20);
    sub_249697880(v123, &qword_2544AFD20);
  }
  else
  {
    v126 = v246;
    v125 = v237;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v246 + 32))(v237, v123, v124);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v126 + 56))(v125, 0, 1, v124);
  }
  v127 = v256;
  v128 = v223;
  sub_2496B506C(v125, v223, &qword_2544AFD20);
  if (v235((char *)v128, 1, v124) == 1)
  {
    sub_249697880(v128, &qword_2544AFD20);
    goto LABEL_40;
  }
  v129 = sub_2496BAAEC();
  v131 = v130;
  (*(void (**)(uint64_t, uint64_t))(v246 + 8))(v128, v124);
  if (!v131)
  {
LABEL_40:
    if ((v219 & 1) == 0)
    {
      CGAffineTransformMakeTranslation(&t1, v79, v81);
      t2.a = a;
      t2.b = b;
      t2.c = c;
      t2.d = d;
      t2.tx = tx;
      t2.ty = ty;
      CGAffineTransformConcat(&v265, &t1, &t2);
      a = v265.a;
      b = v265.b;
      c = v265.c;
      d = v265.d;
      tx = v265.tx;
      ty = v265.ty;
    }
    v138 = v237;
    v209 = v88;
    sub_2496BAA74();
    t1 = t2;
    v265.a = a;
    v265.b = b;
    v265.c = c;
    v265.d = d;
    v265.tx = tx;
    v265.ty = ty;
    CGAffineTransformConcat(&v264, &t1, &v265);
    t1 = v264;
    sub_2496B506C(v138, v261, &qword_2544AFD20);
    v139 = v127;
    swift_retain_n();
    v241 = (char *)v139;
    v140 = sub_2496BAAA4();
    v141 = *(_QWORD *)(v140 + 16);
    v259 = v61;
    if (v141)
    {
      v142 = a2;
      v143 = (*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
      v234 = v140;
      v242 = (char *)v143;
      v144 = v140 + v143;
      v145 = *(_QWORD *)(v61 + 72);
      v255 = MEMORY[0x24BEE4AF8];
      v146 = v216;
      v147 = v263;
      v148 = v259;
      do
      {
        v149 = v251;
        v260(v251, v144, v147);
        sub_2496AC660(v149, v142, v127, v261, &t1);
        v150 = (uint64_t)v257;
        (*(void (**)(char *, uint64_t))(v148 + 8))(v149, v147);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v148 + 48))(v150, 1, v147) == 1)
        {
          sub_249697880(v150, (uint64_t *)&unk_2544AFCB0);
        }
        else
        {
          v151 = *(void (**)(char *, uint64_t, uint64_t))(v148 + 32);
          v152 = v248;
          v153 = v150;
          v154 = v263;
          v151(v248, v153, v263);
          v151(v146, (uint64_t)v152, v154);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v255 = COERCE_DOUBLE(sub_2496A29E0(0, *(_QWORD *)(*(_QWORD *)&v255 + 16) + 1, 1, *(unint64_t *)&v255));
          v156 = *(_QWORD *)(*(_QWORD *)&v255 + 16);
          v155 = *(_QWORD *)(*(_QWORD *)&v255 + 24);
          if (v156 >= v155 >> 1)
            v255 = COERCE_DOUBLE(sub_2496A29E0(v155 > 1, v156 + 1, 1, *(unint64_t *)&v255));
          v157 = v255;
          *(_QWORD *)(*(_QWORD *)&v255 + 16) = v156 + 1;
          v151(&v242[*(_QWORD *)&v157 + v156 * v145], (uint64_t)v146, v263);
          v127 = v256;
          v142 = v254;
        }
        v144 += v145;
        --v141;
      }
      while (v141);
      swift_bridgeObjectRelease();
      a2 = v142;
    }
    else
    {
      swift_bridgeObjectRelease();
      v255 = MEMORY[0x24BEE4AF8];
    }
    v158 = sub_2496BA954();
    v159 = *(_QWORD *)(v158 + 16);
    if (v159)
    {
      v160 = a2;
      v161 = (*(unsigned __int8 *)(v259 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v259 + 80);
      v251 = (char *)v158;
      v257 = (char *)v161;
      v162 = v158 + v161;
      v163 = *(_QWORD *)(v259 + 72);
      v164 = MEMORY[0x24BEE4AF8];
      v165 = v263;
      v166 = v259;
      do
      {
        v167 = v252;
        v260(v252, v162, v165);
        sub_2496AC660(v167, v160, v127, v261, &t1);
        v168 = (uint64_t)v258;
        (*(void (**)(char *, uint64_t))(v166 + 8))(v167, v165);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v166 + 48))(v168, 1, v165) == 1)
        {
          sub_249697880(v168, (uint64_t *)&unk_2544AFCB0);
        }
        else
        {
          v169 = *(void (**)(char *, uint64_t, uint64_t))(v166 + 32);
          v170 = v249;
          v169(v249, v168, v165);
          v169(v253, (uint64_t)v170, v165);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v164 = sub_2496A29E0(0, *(_QWORD *)(v164 + 16) + 1, 1, v164);
          v172 = *(_QWORD *)(v164 + 16);
          v171 = *(_QWORD *)(v164 + 24);
          if (v172 >= v171 >> 1)
            v164 = sub_2496A29E0(v171 > 1, v172 + 1, 1, v164);
          *(_QWORD *)(v164 + 16) = v172 + 1;
          v169(&v257[v164 + v172 * v163], (uint64_t)v253, v263);
          v127 = v256;
          v160 = v254;
        }
        v162 += v163;
        --v159;
      }
      while (v159);
      swift_bridgeObjectRelease();
      a2 = v160;
    }
    else
    {
      swift_bridgeObjectRelease();
      v164 = MEMORY[0x24BEE4AF8];
    }
    v265.a = v255;
    sub_2496B181C(v164, (uint64_t (*)(void))sub_2496A29E0, (uint64_t (*)(_QWORD))MEMORY[0x24BEBB9B8]);
    v88 = v209;
    sub_2496BA960();
    v173 = v220;
    sub_2496B506C(v237, v220, &qword_2544AFD20);
    v174 = v247;
    if (v235((char *)v173, 1, v247) == 1)
    {
      sub_249697880(v173, &qword_2544AFD20);
      v175 = v232;
      v176 = v243;
      v61 = v259;
LABEL_78:
      v201 = v237;
      if (*(_BYTE *)(a2 + 32) == 1)
      {
        (*(void (**)(char *, _QWORD, uint64_t))(v245 + 104))(v217, *MEMORY[0x24BEBB940], v176);
        sub_2496BAA2C();
      }
      v202 = v241;

      swift_release_n();
      sub_249697880(v261, &qword_2544AFD20);
      sub_249697880(v201, &qword_2544AFD20);
      (*(void (**)(char *, uint64_t))(v175 + 8))(v231, v233);
      (*(void (**)(char *, uint64_t))(v239 + 8))(v238, v240);
      goto LABEL_81;
    }
    v177 = v246;
    v178 = *(void (**)(void))(v246 + 32);
    v179 = v221;
    ((void (*)(char *, uint64_t, uint64_t))v178)(v221, v173, v174);
    v180 = *(void (**)(uint64_t, char *, uint64_t))(v177 + 16);
    v181 = v218;
    v180(v218, v179, v174);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v177 + 56))(v181, 0, 1, v174);
    v182 = v214;
    v183 = v214 + *(int *)(v213 + 48);
    sub_2496B506C(v181, v214, &qword_2544AFD20);
    v184 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v235;
    sub_2496B506C(v250, v183, &qword_2544AFD20);
    if (v184(v182, 1, v174) == 1)
    {
      sub_249697880(v181, &qword_2544AFD20);
      v185 = v184(v183, 1, v174);
      v61 = v259;
      if (v185 == 1)
      {
        sub_249697880(v182, &qword_2544AFD20);
        (*(void (**)(char *, uint64_t))(v246 + 8))(v221, v247);
LABEL_77:
        a2 = v254;
        v175 = v232;
        v176 = v243;
        goto LABEL_78;
      }
    }
    else
    {
      v186 = v184;
      v187 = v210;
      sub_2496B506C(v182, v210, &qword_2544AFD20);
      v188 = v186(v183, 1, v174);
      v61 = v259;
      if (v188 != 1)
      {
        v262 = v180;
        v197 = v212;
        v178();
        sub_24968BDD4((unint64_t *)&unk_2544AFD00, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB8]);
        v198 = sub_2496BAED0();
        v199 = *(void (**)(char *, uint64_t))(v246 + 8);
        v200 = v197;
        v180 = v262;
        v199(v200, v174);
        sub_249697880(v218, &qword_2544AFD20);
        v199((char *)v187, v174);
        sub_249697880(v182, &qword_2544AFD20);
        if ((v198 & 1) != 0)
        {
          v199(v221, v247);
          goto LABEL_77;
        }
LABEL_74:
        v189 = v221;
        v190 = v247;
        v180((uint64_t)v212, v221, v247);
        v191 = v239;
        v192 = v238;
        v193 = v240;
        (*(void (**)(char *, char *, uint64_t))(v239 + 16))(v211, v238, v240);
        v194 = v217;
        sub_2496BA96C();
        (*(void (**)(char *, _QWORD, uint64_t))(v245 + 104))(v194, *MEMORY[0x24BEBB930], v243);
        sub_2496BAA2C();
        v195 = v241;

        a2 = v254;
        swift_release_n();
        sub_249697880(v261, &qword_2544AFD20);
        (*(void (**)(char *, uint64_t))(v246 + 8))(v189, v190);
        sub_249697880(v237, &qword_2544AFD20);
        (*(void (**)(char *, uint64_t))(v232 + 8))(v231, v233);
        v196 = v192;
        v88 = v209;
        (*(void (**)(char *, uint64_t))(v191 + 8))(v196, v193);
LABEL_81:
        v203 = *(_QWORD *)(a2 + 40);
        swift_bridgeObjectRetain();
        v204 = (void (*)(CGAffineTransform *, _QWORD))sub_2496BA948();
        sub_2496B4990(v205, v203);
        swift_bridgeObjectRelease();
        v204(&v265, 0);
        if (*(_BYTE *)(a2 + 32) == 1)
        {
          sub_2496BAA08();

          (*(void (**)(char *, uint64_t))(v61 + 8))(v88, v263);
        }
        else
        {

          v206 = v244;
          v207 = v263;
          (*(void (**)(uint64_t, char *, uint64_t))(v61 + 32))(v244, v88, v263);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v61 + 56))(v206, 0, 1, v207);
        }
        goto LABEL_84;
      }
      sub_249697880(v218, &qword_2544AFD20);
      (*(void (**)(uint64_t, uint64_t))(v246 + 8))(v187, v174);
    }
    sub_249697880(v182, &qword_2544AFD28);
    goto LABEL_74;
  }
  v132 = *(_QWORD *)(a2 + 24);
  if (!*(_QWORD *)(v132 + 16) || (v133 = sub_2496B6B78(v129, v131), (v134 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  v135 = *(_BYTE *)(*(_QWORD *)(v132 + 56) + v133);
  swift_bridgeObjectRelease();
  if ((v135 & 1) == 0)
    goto LABEL_40;

  sub_249697880(v237, &qword_2544AFD20);
  (*(void (**)(char *, uint64_t))(v232 + 8))(v231, v233);
  (*(void (**)(char *, uint64_t))(v239 + 8))(v238, v240);
  v136 = v263;
  (*(void (**)(char *, uint64_t))(v61 + 8))(v88, v263);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 56))(v244, 1, 1, v136);
  v137 = v250;
  return sub_249697880(v137, &qword_2544AFD20);
}

uint64_t sub_2496AE064(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_2496AE084(uint64_t a1, unint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 *v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  char *v33;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  char *v37;
  uint64_t v38;
  __int128 v39;
  _OWORD *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t);
  char *v51;
  uint64_t v52;
  char *v53;
  char v54;
  void (*v55)(char *, uint64_t);
  char *v56;
  uint64_t v57;
  unint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD v66[2];
  uint64_t v67;
  unint64_t v68;
  char *v69;
  unint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  char *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _OWORD *v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;

  v81 = sub_2496BAA38();
  v80 = *(_QWORD *)(v81 - 8);
  v4 = MEMORY[0x24BDAC7A8](v81);
  v79 = (char *)v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v78 = (char *)v66 - v6;
  v85 = sub_2496BAA14();
  v7 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v9 = (char *)v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = type metadata accessor for FragmentCollator.RootElement();
  v10 = MEMORY[0x24BDAC7A8](v82);
  v12 = (char *)v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v67 = (uint64_t)v66 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v84 = (uint64_t)v66 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v83 = (uint64_t)v66 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (__int128 *)((char *)v66 - v20);
  result = MEMORY[0x24BDAC7A8](v19);
  v89 = (_OWORD *)((char *)v66 - v24);
  v72 = *(_QWORD *)(a1 + 16);
  if (!v72)
    return result;
  v25 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  v71 = a1 + v25;
  v88 = *(_QWORD *)(v23 + 72);
  v75 = *MEMORY[0x24BEBB970];
  v74 = *MEMORY[0x24BEBB938];
  v66[1] = a1;
  swift_bridgeObjectRetain();
  v26 = 0;
  v77 = v7;
  v76 = v9;
  v70 = a2;
  v69 = v12;
  v68 = v25;
  while (1)
  {
    v73 = v26;
    sub_24968BA44(v71 + v88 * v26, (uint64_t)v89, (uint64_t (*)(_QWORD))type metadata accessor for FragmentCollator.RootElement);
    v87 = *(_QWORD *)(*a2 + 16);
    if (v87)
      break;
LABEL_21:
    sub_24968BA44((uint64_t)v89, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for FragmentCollator.RootElement);
    v63 = *a2;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v63 = sub_2496A29F4(0, *(_QWORD *)(v63 + 16) + 1, 1, v63);
    v65 = *(_QWORD *)(v63 + 16);
    v64 = *(_QWORD *)(v63 + 24);
    if (v65 >= v64 >> 1)
      v63 = sub_2496A29F4(v64 > 1, v65 + 1, 1, v63);
    *(_QWORD *)(v63 + 16) = v65 + 1;
    sub_24968BC5C((uint64_t)v12, v63 + v25 + v65 * v88, (uint64_t (*)(_QWORD))type metadata accessor for FragmentCollator.RootElement);
    *a2 = v63;
    sub_2496B2E00((uint64_t)v89);
LABEL_4:
    v26 = v73 + 1;
    if (v73 + 1 == v72)
      return swift_bridgeObjectRelease();
  }
  v27 = swift_bridgeObjectRetain();
  v28 = 0;
  v30 = v83;
  v29 = v84;
  v86 = v27;
  while (1)
  {
    sub_24968BA44(v27 + v25, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for FragmentCollator.RootElement);
    v39 = v21[1];
    v91 = *v21;
    v92 = v39;
    v40 = v89;
    v41 = *v89;
    v42 = v89[1];
    v93 = v21[2];
    v94 = v41;
    v43 = v89[2];
    v95 = v42;
    v96 = v43;
    v44 = sub_2496BB020();
    sub_24968BA44((uint64_t)v21, v30, (uint64_t (*)(_QWORD))type metadata accessor for FragmentCollator.RootElement);
    sub_24968BA44((uint64_t)v40, v29, (uint64_t (*)(_QWORD))type metadata accessor for FragmentCollator.RootElement);
    if ((v44 & 1) == 0)
      goto LABEL_8;
    v45 = *(int *)(v82 + 20);
    v46 = v30 + v45;
    v47 = v29 + v45;
    sub_2496BAA20();
    v48 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v85);
    if (v48 == v75)
      break;
    if (v48 == v74)
      goto LABEL_14;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v85);
    v31 = v80;
    v32 = *(void (**)(char *, uint64_t, uint64_t))(v80 + 16);
    v33 = v78;
    v34 = v81;
    v32(v78, v46, v81);
    v35 = v79;
    v32(v79, v47, v34);
    v36 = *(void (**)(char *, uint64_t))(v31 + 8);
    v37 = v33;
    v9 = v76;
    v36(v37, v34);
    v38 = v34;
    v7 = v77;
    v36(v35, v38);
    v30 = v83;
    v29 = v84;
LABEL_8:
    sub_2496B2E00(v30);
    sub_2496B2E00(v29);
    sub_2496B2E00((uint64_t)v21);
LABEL_9:
    ++v28;
    v25 += v88;
    v27 = v86;
    if (v87 == v28)
    {
      swift_bridgeObjectRelease();
      a2 = v70;
      v12 = v69;
      v25 = v68;
      goto LABEL_21;
    }
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v85);
LABEL_14:
  v49 = v80;
  v50 = *(void (**)(char *, uint64_t, uint64_t))(v80 + 16);
  v51 = v78;
  v52 = v81;
  v50(v78, v46, v81);
  v53 = v79;
  v50(v79, v47, v52);
  v54 = sub_2496BA99C();
  v55 = *(void (**)(char *, uint64_t))(v49 + 8);
  v56 = v51;
  v9 = v76;
  v55(v56, v52);
  v57 = v52;
  v7 = v77;
  v55(v53, v57);
  v30 = v83;
  sub_2496B2E00(v83);
  v29 = v84;
  sub_2496B2E00(v84);
  sub_2496B2E00((uint64_t)v21);
  if ((v54 & 1) == 0)
    goto LABEL_9;
  result = swift_bridgeObjectRelease();
  v58 = v70;
  if (v28 >= *(_QWORD *)(*v70 + 16))
  {
    __break(1u);
  }
  else
  {
    v59 = v67;
    sub_24968BA44(*v70 + v25, v67, (uint64_t (*)(_QWORD))type metadata accessor for FragmentCollator.RootElement);
    v60 = sub_2496BA954();
    sub_2496B2E00(v59);
    v90 = v60;
    v61 = sub_2496BA954();
    sub_2496AE74C(v61, (unint64_t *)&v90);
    swift_bridgeObjectRelease();
    v62 = *v58;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = sub_2496B2A6C(v62);
      v62 = result;
    }
    if (v28 < *(_QWORD *)(v62 + 16))
    {
      sub_2496BA960();
      a2 = v70;
      *v70 = v62;
      sub_2496B2E00((uint64_t)v89);
      v12 = v69;
      v25 = v68;
      goto LABEL_4;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2496AE74C(uint64_t a1, unint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD, _QWORD, _QWORD);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  char *v35;
  char v36;
  void (*v37)(uint64_t, uint64_t);
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  unint64_t *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(_QWORD, _QWORD, _QWORD);
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;

  v4 = sub_2496BAA14();
  v57 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2496BAA38();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)&v44 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v56 = (char *)&v44 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v44 - v18;
  result = MEMORY[0x24BDAC7A8](v17);
  v62 = (char *)&v44 - v22;
  v49 = *(_QWORD *)(a1 + 16);
  if (!v49)
    return result;
  v55 = v21;
  v50 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v47 = a1 + v50;
  v60 = *(_QWORD *)(v8 + 72);
  v61 = v6;
  v23 = *(void (**)(_QWORD, _QWORD, _QWORD))(v8 + 16);
  v54 = *MEMORY[0x24BEBB970];
  v52 = *MEMORY[0x24BEBB938];
  v44 = a1;
  swift_bridgeObjectRetain();
  v24 = 0;
  v53 = v4;
  v25 = v8;
  v59 = v23;
  v48 = a2;
  v46 = v11;
  while (1)
  {
    v51 = v24;
    v23(v62, v47 + v60 * v24, v7);
    v58 = *(_QWORD *)(*a2 + 16);
    if (v58)
      break;
LABEL_15:
    v23(v11, v62, v7);
    a2 = v48;
    v38 = *v48;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v38 = sub_2496A29E0(0, *(_QWORD *)(v38 + 16) + 1, 1, v38);
    v40 = *(_QWORD *)(v38 + 16);
    v39 = *(_QWORD *)(v38 + 24);
    if (v40 >= v39 >> 1)
      v38 = sub_2496A29E0(v39 > 1, v40 + 1, 1, v38);
    *(_QWORD *)(v38 + 16) = v40 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v25 + 32))(v38 + v50 + v40 * v60, v11, v7);
    *a2 = v38;
    (*(void (**)(char *, uint64_t))(v25 + 8))(v62, v7);
LABEL_4:
    v24 = v51 + 1;
    v23 = v59;
    if (v51 + 1 == v49)
      return swift_bridgeObjectRelease();
  }
  v26 = swift_bridgeObjectRetain();
  v27 = 0;
  v28 = v50;
  while (1)
  {
    v29 = v25;
    v30 = v26;
    v23(v19, v26 + v28, v7);
    v31 = v61;
    sub_2496BAA20();
    v32 = v57;
    v33 = (*(uint64_t (**)(char *, uint64_t))(v57 + 88))(v31, v4);
    if (v33 == v54)
    {
      (*(void (**)(char *, uint64_t))(v32 + 8))(v31, v4);
      v25 = v29;
LABEL_10:
      v34 = v55;
      v23(v55, v19, v7);
      v35 = v56;
      v23(v56, v62, v7);
      v36 = sub_2496BA99C();
      goto LABEL_12;
    }
    v25 = v29;
    if (v33 == v52)
      goto LABEL_10;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v61, v4);
    v34 = v55;
    v23(v55, v19, v7);
    v35 = v56;
    v23(v56, v62, v7);
    v36 = 0;
LABEL_12:
    v37 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v37(v34, v7);
    v37((uint64_t)v35, v7);
    v37((uint64_t)v19, v7);
    if ((v36 & 1) != 0)
      break;
    ++v27;
    v23 = v59;
    v28 += v60;
    v4 = v53;
    v26 = v30;
    if (v58 == v27)
    {
      swift_bridgeObjectRelease();
      v11 = v46;
      goto LABEL_15;
    }
  }
  result = swift_bridgeObjectRelease();
  a2 = v48;
  if (v27 >= *(_QWORD *)(*v48 + 16))
  {
    __break(1u);
  }
  else
  {
    v41 = v45;
    v59(v45, *v48 + v28, v7);
    v42 = sub_2496BA954();
    v37((uint64_t)v41, v7);
    v63 = v42;
    sub_2496BA954();
    sub_2496AE74C();
    swift_bridgeObjectRelease();
    v43 = *a2;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = sub_2496B2A58(v43);
      v43 = result;
    }
    if (v27 < *(_QWORD *)(v43 + 16))
    {
      sub_2496BA960();
      *a2 = v43;
      v37((uint64_t)v62, v7);
      v4 = v53;
      v11 = v46;
      goto LABEL_4;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2496AEC2C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2496AEC68(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *EmptyRegion;
  id v7;
  double v8;
  double v9;
  void (*v10)(char *, uint64_t);
  id v11;
  uint64_t v13;
  CGRect v14;

  v2 = sub_2496BA8AC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2496BA930();
  if (!CGRectIsNull(v14))
  {
    sub_2496BA930();
    EmptyRegion = (void *)CGRegionCreateWithRect();
    if (!EmptyRegion)
      EmptyRegion = (void *)CGRegionCreateEmptyRegion();
    v7 = EmptyRegion;
    sub_2496BA894();
    sub_2496BA8A0();
    v9 = v8;
    v10 = *(void (**)(char *, uint64_t))(v3 + 8);
    v10(v5, v2);

    if (v9 > 0.0)
    {
      v11 = a1;
      sub_2496BA894();
      sub_2496BA8A0();
      v10(v5, v2);
    }
  }
  return sub_2496BA984();
}

_QWORD *sub_2496AEDB8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
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
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  _UNKNOWN **v22;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578767A8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - v10;
  v12 = MEMORY[0x24BEE4AF8];
  v13 = MEMORY[0x24BEE4B08];
  v2[2] = MEMORY[0x24BEE4AF8];
  v2[3] = v13;
  v2[4] = sub_2496A8F28(v12);
  v2[5] = sub_2496A8F28(v12);
  v2[6] = sub_2496A90E0(v12);
  sub_2496B506C(a2, (uint64_t)&v18, &qword_257876CE8);
  sub_2496B506C(a1, (uint64_t)v11, &qword_2578767A8);
  if (v19)
  {
    sub_249697880((uint64_t)v11, &qword_2578767A8);
    sub_2496B5000(&v18, (uint64_t)&v20);
  }
  else
  {
    sub_2496B506C((uint64_t)v11, (uint64_t)v9, &qword_2578767A8);
    v14 = type metadata accessor for EmbeddedWindowVisibilityProvider();
    swift_allocObject();
    v15 = sub_249698EBC((uint64_t)v9);
    v21 = v14;
    v22 = &off_251AA2800;
    *(_QWORD *)&v20 = v15;
    sub_249697880((uint64_t)v11, &qword_2578767A8);
    sub_249697880((uint64_t)&v18, &qword_257876CE8);
  }
  sub_2496B5000(&v20, (uint64_t)(v2 + 7));
  sub_2496B506C(a1, (uint64_t)v9, &qword_2578767A8);
  type metadata accessor for ManagementPolicyProvider();
  swift_allocObject();
  v16 = sub_2496A7350((uint64_t)v9);
  sub_249697880(a2, &qword_257876CE8);
  sub_249697880(a1, &qword_2578767A8);
  v3[12] = v16;
  return v3;
}

uint64_t sub_2496AEFAC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FragmentCollator()
{
  return objc_opt_self();
}

uint64_t sub_2496AF020(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2496AF028(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_2496AF030(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_2496AF038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t type metadata accessor for FragmentCollator.FragmentResolutionContext()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for FragmentCollator.RootElement()
{
  uint64_t result;

  result = qword_2544AFE90;
  if (!qword_2544AFE90)
    return swift_getSingletonMetadata();
  return result;
}

BOOL sub_2496AF09C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t (*v15)(char *, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  void (*v34)(char *, uint64_t);
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;

  v38 = a3;
  v36 = a2;
  v3 = sub_2496BAA14();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v31 - v7;
  v9 = sub_2496BA9FC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v35 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v31 - v13;
  sub_2496BAA20();
  v15 = *(uint64_t (**)(char *, uint64_t))(v4 + 88);
  v16 = v15(v8, v3);
  if (v16 != *MEMORY[0x24BEBB978])
    goto LABEL_13;
  v17 = v16;
  v34 = *(void (**)(char *, uint64_t))(v4 + 96);
  v34(v8, v3);
  v33 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v33(v14, v8, v9);
  v18 = sub_2496BA9CC();
  if (!v19)
  {
LABEL_11:
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    return 0;
  }
  if (!*(_QWORD *)(v38 + 16) || (v20 = sub_2496B6B78(v18, v19), (v21 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v32 = *(_QWORD *)(*(_QWORD *)(v38 + 56) + 8 * v20);
  swift_bridgeObjectRelease();
  v8 = v37;
  sub_2496BAA20();
  if (v15(v8, v3) != v17)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
LABEL_13:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
    return 0;
  }
  v34(v8, v3);
  v22 = v35;
  v33(v35, v8, v9);
  v23 = sub_2496BA9CC();
  if (v24)
  {
    if (*(_QWORD *)(v38 + 16))
    {
      v25 = sub_2496B6B78(v23, v24);
      if ((v26 & 1) != 0)
      {
        v27 = *(_QWORD *)(*(_QWORD *)(v38 + 56) + 8 * v25);
        swift_bridgeObjectRelease();
        v28 = *(void (**)(char *, uint64_t))(v10 + 8);
        v28(v22, v9);
        v28(v14, v9);
        return v27 < v32;
      }
    }
    swift_bridgeObjectRelease();
  }
  v30 = *(void (**)(char *, uint64_t))(v10 + 8);
  v30(v22, v9);
  v30(v14, v9);
  return 0;
}

uint64_t sub_2496AF350(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t);
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void (*v26)(char *, uint64_t);
  id v27;
  id v28;
  char *v29;
  int v30;
  id v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  int64_t v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  int64_t v43;
  unint64_t v44;
  int64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  char v51;
  unint64_t v52;
  uint64_t v53;
  _BOOL8 v54;
  uint64_t v55;
  char v56;
  unint64_t v57;
  char v58;
  uint64_t *v59;
  uint64_t v60;
  BOOL v61;
  uint64_t v62;
  void *EmptyRegion;
  void *IntersectionWithRegion;
  id v65;
  char isUniquelyReferenced_nonNull_native;
  char v67;
  unint64_t v68;
  uint64_t v69;
  _BOOL8 v70;
  uint64_t v71;
  char v72;
  unint64_t v73;
  char v74;
  void *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t result;
  uint64_t v81;
  int v82;
  char *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(char *, uint64_t, uint64_t);
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  char *v100;
  uint64_t v101;
  int64_t v102;
  uint64_t v103;
  _QWORD *v104;
  CGRect v105;
  CGRect v106;

  v99 = a2;
  v3 = sub_2496BAA14();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v83 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v81 - v7;
  v9 = sub_2496BA9FC();
  v97 = *(_QWORD *)(v9 - 8);
  v98 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v96 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2496BAA38();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (_QWORD *)sub_2496A9384(MEMORY[0x24BEE4AF8]);
  v95 = *(_QWORD *)(a1 + 16);
  if (!v95)
    return (uint64_t)v15;
  v94 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v93 = *MEMORY[0x24BEBB978];
  v82 = *MEMORY[0x24BEBB970];
  v16 = *(_QWORD *)(v12 + 72);
  v91 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v92 = v16;
  v81 = a1;
  swift_bridgeObjectRetain();
  v17 = 0;
  v89 = v4;
  v90 = v3;
  v87 = v11;
  v88 = v8;
  v86 = v12;
  v100 = v14;
  while (1)
  {
    v91(v14, v94 + v92 * v17, v11);
    sub_2496BAA20();
    v19 = *(uint64_t (**)(char *, uint64_t))(v4 + 88);
    v20 = v19(v8, v3);
    if (v20 != v93)
      break;
    (*(void (**)(char *, uint64_t))(v4 + 96))(v8, v3);
    (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v96, v8, v98);
    v21 = sub_2496BA9CC();
    if (!v22)
      goto LABEL_65;
    v23 = v22;
    if (!v99)
      goto LABEL_64;
    v24 = v21;
    v25 = v99;
    v14 = v100;
    sub_2496BA930();
    if (!CGRectIsNull(v105))
    {
      sub_2496BA930();
      EmptyRegion = (void *)CGRegionCreateWithRect();
      if (!EmptyRegion)
        EmptyRegion = (void *)CGRegionCreateEmptyRegion();
      IntersectionWithRegion = (void *)CGRegionCreateIntersectionWithRegion();

      v65 = IntersectionWithRegion;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v104 = v15;
      v68 = sub_2496B6B78(v24, v23);
      v69 = v15[2];
      v70 = (v67 & 1) == 0;
      v71 = v69 + v70;
      if (__OFADD__(v69, v70))
        goto LABEL_75;
      v72 = v67;
      if (v15[3] >= v71)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_249694A54();
      }
      else
      {
        sub_2496B0B68(v71, isUniquelyReferenced_nonNull_native);
        v73 = sub_2496B6B78(v24, v23);
        if ((v72 & 1) != (v74 & 1))
          goto LABEL_77;
        v68 = v73;
      }
      v75 = v25;
      v15 = v104;
      if ((v72 & 1) != 0)
      {
        v76 = v104[7];

        *(_QWORD *)(v76 + 8 * v68) = v65;
      }
      else
      {
        v104[(v68 >> 6) + 8] |= 1 << v68;
        v77 = (uint64_t *)(v15[6] + 16 * v68);
        *v77 = v24;
        v77[1] = v23;
        *(_QWORD *)(v15[7] + 8 * v68) = v65;
        v78 = v15[2];
        v61 = __OFADD__(v78, 1);
        v79 = v78 + 1;
        if (v61)
          goto LABEL_76;
        v15[2] = v79;
        swift_bridgeObjectRetain();
      }

      swift_bridgeObjectRelease();
LABEL_64:
      swift_bridgeObjectRelease();
LABEL_65:
      v4 = v89;
      v3 = v90;
      v11 = v87;
      v8 = v88;
      v18 = v86;
      v14 = v100;
      goto LABEL_66;
    }

    swift_bridgeObjectRelease();
    v4 = v89;
    v3 = v90;
    v11 = v87;
    v8 = v88;
    v18 = v86;
LABEL_66:
    (*(void (**)(char *, uint64_t))(v97 + 8))(v96, v98);
LABEL_4:
    ++v17;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v14, v11);
    if (v17 == v95)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v15;
    }
  }
  v26 = *(void (**)(char *, uint64_t))(v4 + 8);
  v26(v8, v3);
  v27 = v99;
  v28 = v99;
  if (!v99)
  {
    v29 = v83;
    sub_2496BAA20();
    v30 = v19(v29, v3);
    v26(v29, v3);
    if (v30 == v82 && (sub_2496BA930(), !CGRectIsNull(v106)))
    {
      sub_2496BA930();
      v28 = (id)CGRegionCreateWithRect();
      if (!v28)
        v28 = (id)CGRegionCreateEmptyRegion();
    }
    else
    {
      v28 = 0;
    }
    v27 = v99;
  }
  v85 = v17;
  v31 = v27;
  sub_2496BA954();
  v84 = v28;
  v32 = sub_2496AF350();
  swift_bridgeObjectRelease();
  v33 = swift_isUniquelyReferenced_nonNull_native();
  v103 = v32;
  v104 = v15;
  v34 = *(_QWORD *)(v32 + 64);
  v101 = v32 + 64;
  v35 = 1 << *(_BYTE *)(v32 + 32);
  if (v35 < 64)
    v36 = ~(-1 << v35);
  else
    v36 = -1;
  v37 = v36 & v34;
  v102 = (unint64_t)(v35 + 63) >> 6;
  swift_bridgeObjectRetain();
  v38 = 0;
  if (!v37)
  {
LABEL_22:
    v43 = v38 + 1;
    if (__OFADD__(v38, 1))
      goto LABEL_73;
    if (v43 < v102)
    {
      v44 = *(_QWORD *)(v101 + 8 * v43);
      ++v38;
      if (v44)
        goto LABEL_37;
      v38 = v43 + 1;
      if (v43 + 1 < v102)
      {
        v44 = *(_QWORD *)(v101 + 8 * v38);
        if (v44)
          goto LABEL_37;
        v38 = v43 + 2;
        if (v43 + 2 < v102)
        {
          v44 = *(_QWORD *)(v101 + 8 * v38);
          if (v44)
            goto LABEL_37;
          v38 = v43 + 3;
          if (v43 + 3 < v102)
          {
            v44 = *(_QWORD *)(v101 + 8 * v38);
            if (v44)
              goto LABEL_37;
            v45 = v43 + 4;
            if (v45 < v102)
            {
              v44 = *(_QWORD *)(v101 + 8 * v45);
              if (!v44)
              {
                while (1)
                {
                  v38 = v45 + 1;
                  if (__OFADD__(v45, 1))
                    goto LABEL_74;
                  if (v38 >= v102)
                    goto LABEL_3;
                  v44 = *(_QWORD *)(v101 + 8 * v38);
                  ++v45;
                  if (v44)
                    goto LABEL_37;
                }
              }
              v38 = v45;
LABEL_37:
              v37 = (v44 - 1) & v44;
              v42 = __clz(__rbit64(v44)) + (v38 << 6);
              goto LABEL_38;
            }
          }
        }
      }
    }
LABEL_3:
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();

    v4 = v89;
    v3 = v90;
    v11 = v87;
    v8 = v88;
    v17 = v85;
    v18 = v86;
    v14 = v100;
    goto LABEL_4;
  }
  while (1)
  {
    v41 = __clz(__rbit64(v37));
    v37 &= v37 - 1;
    v42 = v41 | (v38 << 6);
LABEL_38:
    v46 = (uint64_t *)(*(_QWORD *)(v103 + 48) + 16 * v42);
    v47 = *v46;
    v48 = v46[1];
    v49 = *(void **)(*(_QWORD *)(v103 + 56) + 8 * v42);
    swift_bridgeObjectRetain();
    v50 = v49;
    v52 = sub_2496B6B78(v47, v48);
    v53 = v15[2];
    v54 = (v51 & 1) == 0;
    v55 = v53 + v54;
    if (__OFADD__(v53, v54))
      break;
    v56 = v51;
    if (v15[3] >= v55)
    {
      if ((v33 & 1) != 0)
      {
        v15 = v104;
        if ((v51 & 1) != 0)
          goto LABEL_20;
      }
      else
      {
        sub_249694A54();
        v15 = v104;
        if ((v56 & 1) != 0)
          goto LABEL_20;
      }
    }
    else
    {
      sub_2496B0B68(v55, v33 & 1);
      v57 = sub_2496B6B78(v47, v48);
      if ((v56 & 1) != (v58 & 1))
        goto LABEL_77;
      v52 = v57;
      v15 = v104;
      if ((v56 & 1) != 0)
      {
LABEL_20:
        v39 = *(id *)(v15[7] + 8 * v52);
        swift_bridgeObjectRelease();

        v40 = v15[7];
        *(_QWORD *)(v40 + 8 * v52) = v39;
        v33 = 1;
        if (!v37)
          goto LABEL_22;
        continue;
      }
    }
    v15[(v52 >> 6) + 8] |= 1 << v52;
    v59 = (uint64_t *)(v15[6] + 16 * v52);
    *v59 = v47;
    v59[1] = v48;
    *(_QWORD *)(v15[7] + 8 * v52) = v50;
    v60 = v15[2];
    v61 = __OFADD__(v60, 1);
    v62 = v60 + 1;
    if (v61)
      goto LABEL_72;
    v15[2] = v62;
    v33 = 1;
    if (!v37)
      goto LABEL_22;
  }
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  result = sub_2496BB398();
  __break(1u);
  return result;
}

void *sub_2496AFB00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *EmptyRegion;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t UnionWithRegion;
  int v16;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  CGRect v23;

  v2 = sub_2496BAA14();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2496BAA38();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  EmptyRegion = (void *)CGRegionCreateEmptyRegion();
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v13 = *(_QWORD *)(v7 + 72);
    v21 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v22 = v13;
    v20 = *MEMORY[0x24BEBB970];
    v18 = a1;
    swift_bridgeObjectRetain();
    v19 = v7;
    while (1)
    {
      v21(v9, v12, v6);
      sub_2496BAA20();
      v16 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      if (v16 == v20)
      {
        sub_2496BA930();
        if (CGRectIsNull(v23))
          goto LABEL_5;
        sub_2496BA930();
        v14 = (void *)CGRegionCreateWithRect();
        if (!v14)
          v14 = (void *)CGRegionCreateEmptyRegion();
      }
      else
      {
        sub_2496BA954();
        v14 = (void *)sub_2496AFB00();
        swift_bridgeObjectRelease();
      }
      UnionWithRegion = CGRegionCreateUnionWithRegion();

      EmptyRegion = (void *)UnionWithRegion;
      v7 = v19;
LABEL_5:
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      v12 += v22;
      if (!--v11)
      {
        swift_bridgeObjectRelease();
        return EmptyRegion;
      }
    }
  }
  return EmptyRegion;
}

uint64_t sub_2496AFCF4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_2496AFD1C(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;

  v3 = v2;
  v5 = type metadata accessor for ConnectionID();
  v39 = *(_QWORD *)(v5 - 8);
  v40 = v5;
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF70);
  v41 = a2;
  v9 = sub_2496BB278();
  v10 = v9;
  if (*(_QWORD *)(v8 + 16))
  {
    v36 = v2;
    v11 = 1 << *(_BYTE *)(v8 + 32);
    v12 = *(_QWORD *)(v8 + 64);
    v38 = (_QWORD *)(v8 + 64);
    if (v11 < 64)
      v13 = ~(-1 << v11);
    else
      v13 = -1;
    v14 = v13 & v12;
    v37 = (unint64_t)(v11 + 63) >> 6;
    v15 = v9 + 64;
    result = swift_retain();
    v17 = 0;
    while (1)
    {
      if (v14)
      {
        v19 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        v20 = v19 | (v17 << 6);
      }
      else
      {
        v21 = v17 + 1;
        if (__OFADD__(v17, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v37)
          goto LABEL_34;
        v22 = v38[v21];
        ++v17;
        if (!v22)
        {
          v17 = v21 + 1;
          if (v21 + 1 >= v37)
            goto LABEL_34;
          v22 = v38[v17];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v37)
            {
LABEL_34:
              swift_release();
              v3 = v36;
              if ((v41 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v8 + 32);
                if (v34 >= 64)
                  bzero(v38, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v38 = -1 << v34;
                *(_QWORD *)(v8 + 16) = 0;
              }
              break;
            }
            v22 = v38[v23];
            if (!v22)
            {
              while (1)
              {
                v17 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v17 >= v37)
                  goto LABEL_34;
                v22 = v38[v17];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v17 = v23;
          }
        }
LABEL_21:
        v14 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v17 << 6);
      }
      v24 = *(_QWORD *)(v39 + 72);
      v25 = *(_QWORD *)(v8 + 48) + v24 * v20;
      if ((v41 & 1) != 0)
      {
        sub_24968BC5C(v25, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        v26 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v20);
      }
      else
      {
        sub_24968BA44(v25, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
        v26 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v20);
        swift_retain();
      }
      sub_2496BB3B0();
      sub_2496BB3BC();
      sub_2496BAB10();
      sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
      sub_2496BAEB8();
      result = sub_2496BB3C8();
      v27 = -1 << *(_BYTE *)(v10 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v15 + 8 * (v28 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v15 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v15 + 8 * v29);
        }
        while (v33 == -1);
        v18 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      result = sub_24968BC5C((uint64_t)v7, *(_QWORD *)(v10 + 48) + v24 * v18, (uint64_t (*)(_QWORD))type metadata accessor for ConnectionID);
      *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v18) = v26;
      ++*(_QWORD *)(v10 + 16);
    }
  }
  result = swift_release();
  *v3 = v10;
  return result;
}

uint64_t sub_2496B00D4(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_2496BAB10();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF58);
  v42 = a2;
  v10 = sub_2496BB278();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      swift_bridgeObjectRetain();
    }
    sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
    result = sub_2496BAEAC();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_2496B0468(uint64_t a1, int a2)
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
  v5 = sub_2496BAAD4();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v50 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_2496BAA8C();
  v49 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578767B0);
  v11 = sub_2496BB278();
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
    sub_24968BDD4(&qword_2544AFCC0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20], MEMORY[0x24BEBBA30]);
    result = sub_2496BAEAC();
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

uint64_t sub_2496B0860(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876790);
  v37 = a2;
  v6 = sub_2496BB278();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_2496BB3B0();
    sub_2496BAF30();
    result = sub_2496BB3C8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2496B0B68(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876788);
  v38 = a2;
  v6 = sub_2496BB278();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_2496BB3B0();
    sub_2496BAF30();
    result = sub_2496BB3C8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2496B0E74(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876780);
  v38 = a2;
  v6 = sub_2496BB278();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_2496BB3B0();
    sub_2496BAF30();
    result = sub_2496BB3C8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2496B1180(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_2496BACF0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFF60);
  v42 = a2;
  v10 = sub_2496BB278();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      swift_retain();
    }
    sub_24968BDD4(&qword_2544AFD78, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBCE0], MEMORY[0x24BEBBCF0]);
    result = sub_2496BAEAC();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_2496B1514(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257876798);
  v37 = a2;
  v6 = sub_2496BB278();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_2496BB3B0();
    sub_2496BAF30();
    result = sub_2496BB3C8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2496B181C(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(_QWORD))
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (swift_isUniquelyReferenced_nonNull_native() && v6 + v4 <= *(_QWORD *)(v5 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_15;
  }
  v5 = a2();
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_15:
    if (!v4)
      goto LABEL_16;
    goto LABEL_18;
  }
LABEL_5:
  v10 = *(_QWORD *)(v5 + 16);
  v11 = (*(_QWORD *)(v5 + 24) >> 1) - v10;
  v12 = a3(0);
  if (v11 < v4)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v13 = *(_QWORD *)(v12 - 8);
  v14 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v15 = *(_QWORD *)(v13 + 72);
  v16 = v5 + v14 + v15 * v10;
  v17 = a1 + v14;
  v18 = v15 * v4;
  v19 = v16 + v18;
  v20 = v17 + v18;
  if (v17 < v19 && v16 < v20)
    goto LABEL_21;
  swift_arrayInitWithCopy();
  if (!v4)
  {
LABEL_16:
    result = swift_bridgeObjectRelease();
    *v3 = v5;
    return result;
  }
  v22 = *(_QWORD *)(v5 + 16);
  v23 = __OFADD__(v22, v4);
  v24 = v22 + v4;
  if (!v23)
  {
    *(_QWORD *)(v5 + 16) = v24;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  result = sub_2496BB290();
  __break(1u);
  return result;
}

uint64_t sub_2496B1994(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v30)(char *, unint64_t, uint64_t);
  BOOL v31;
  BOOL v32;
  void (*v33)(char *, uint64_t);
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, unint64_t, uint64_t);
  unint64_t v44;
  uint64_t v45;
  BOOL v46;
  BOOL v47;
  unint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  unint64_t v50;
  unint64_t v51;
  void (*v52)(char *, uint64_t);
  void (*v53)(uint64_t, uint64_t);
  uint64_t result;
  unint64_t v55;
  unint64_t v56;
  void (*v57)(uint64_t, unint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;

  v6 = v5;
  v12 = sub_2496BAA38();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v55 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v21 = (char *)&v55 - v20;
  v23 = *(_QWORD *)(v22 + 72);
  v63 = v22;
  v64 = v23;
  if (!v23)
  {
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (a2 - a1 == 0x8000000000000000 && v64 == -1)
    goto LABEL_66;
  v24 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v64 == -1)
    goto LABEL_67;
  v25 = (uint64_t)(a2 - a1) / v64;
  v67 = a1;
  v66 = a4;
  v26 = v24 / v64;
  v60 = a5;
  if (v25 >= v24 / v64)
  {
    if ((v26 & 0x8000000000000000) == 0)
    {
      v28 = v26 * v64;
      v58 = v19;
      v59 = v18;
      if (a4 < a2 || a2 + v28 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v37 = a4 + v28;
      v65 = a4 + v28;
      v67 = a2;
      if (v28 >= 1 && a1 < a2)
      {
        v55 = a1;
        v56 = a4;
        v61 = -v64;
        v57 = *(void (**)(uint64_t, unint64_t, uint64_t))(v63 + 16);
        v39 = -v64;
        while (1)
        {
          v40 = a3;
          v41 = a2;
          v43 = v57;
          v42 = v58;
          v57(v58, v37 + v39, v12);
          v64 = v41;
          v44 = v41 + v39;
          v45 = v59;
          v43(v59, v44, v12);
          v46 = sub_2496AF09C(v42, v45, a5);
          if (v6)
            break;
          v47 = v46;
          v62 = 0;
          v48 = v40 + v39;
          v49 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
          v49(v45, v12);
          v49(v42, v12);
          if (v47)
          {
            v50 = v56;
            if (v40 < v64 || v40 + v39 >= v64)
            {
              v48 = v40 + v39;
              swift_arrayInitWithTakeFrontToBack();
              a5 = v60;
            }
            else
            {
              a5 = v60;
              v48 = v40 + v39;
              if (v40 != v64)
                swift_arrayInitWithTakeBackToFront();
            }
            v67 += v61;
          }
          else
          {
            v44 = v64;
            v51 = v65;
            v65 += v39;
            v50 = v56;
            if (v40 < v51 || v48 >= v51)
            {
              swift_arrayInitWithTakeFrontToBack();
              a5 = v60;
            }
            else
            {
              a5 = v60;
              if (v40 != v51)
                swift_arrayInitWithTakeBackToFront();
            }
          }
          v37 = v65;
          if (v65 > v50)
          {
            a2 = v44;
            a3 = v48;
            v6 = v62;
            if (v44 > v55)
              continue;
          }
          goto LABEL_64;
        }
        v53 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
        v53(v45, v12);
        v53(v42, v12);
      }
      goto LABEL_64;
    }
  }
  else
  {
    v62 = a3;
    if ((v25 & 0x8000000000000000) == 0)
    {
      v27 = v25 * v64;
      if (a4 < a1 || a1 + v27 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a1)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v61 = a4 + v27;
      v65 = a4 + v27;
      if (v27 >= 1 && a2 < v62)
      {
        v30 = *(void (**)(char *, unint64_t, uint64_t))(v63 + 16);
        while (1)
        {
          v30(v21, a2, v12);
          v30(v17, a4, v12);
          v31 = sub_2496AF09C((uint64_t)v21, (uint64_t)v17, a5);
          if (v5)
            break;
          v32 = v31;
          v33 = *(void (**)(char *, uint64_t))(v63 + 8);
          v33(v17, v12);
          v33(v21, v12);
          v34 = v67;
          if (v32)
          {
            v35 = a2 + v64;
            if (v67 < a2 || v67 >= v35)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v67 == a2)
            {
              v34 = a2;
            }
            else
            {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          else
          {
            v36 = v66 + v64;
            if (v67 < v66 || v67 >= v36)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v67 != v66)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v66 = v36;
            v35 = a2;
          }
          v67 = v34 + v64;
          a4 = v66;
          if (v66 < v61)
          {
            a2 = v35;
            if (v35 < v62)
              continue;
          }
          goto LABEL_64;
        }
        v52 = *(void (**)(char *, uint64_t))(v63 + 8);
        v52(v17, v12);
        v52(v21, v12);
      }
LABEL_64:
      sub_2496B2118(&v67, &v66, (uint64_t *)&v65);
      swift_bridgeObjectRelease();
      return 1;
    }
  }
LABEL_68:
  swift_bridgeObjectRelease();
  result = sub_2496BB290();
  __break(1u);
  return result;
}

char *sub_2496B1F78(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257876CC8);
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

char *sub_2496B2070(void **a1, const void **a2, _QWORD *a3)
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
    result = (char *)sub_2496BB290();
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

uint64_t sub_2496B2118(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = sub_2496BAA38();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_2496BB290();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_2496B2224(uint64_t a1)
{
  return sub_2496B1F78(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

unint64_t *sub_2496B2238(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  unint64_t *v2;
  char v3;
  unint64_t v4;
  size_t v5;
  unint64_t *v6;
  void *v7;
  _QWORD v9[2];

  v2 = (unint64_t *)isStackAllocationSafe;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_2496B2388((_QWORD *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1)
      swift_willThrow();
    else
      return v6;
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v2 = sub_2496B2388((unint64_t *)v7, v4, (uint64_t)v2);
    MEMORY[0x24BCF5FEC](v7, -1, -1);
  }
  return v2;
}

unint64_t *sub_2496B2388(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;

  v4 = 0;
  v5 = 0;
  v6 = a3 + 64;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v10)
      return (unint64_t *)sub_2496B24D4(result, a2, v4, a3);
    v14 = *(_QWORD *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      v5 = v13 + 1;
      if (v13 + 1 >= v10)
        return (unint64_t *)sub_2496B24D4(result, a2, v4, a3);
      v14 = *(_QWORD *)(v6 + 8 * v5);
      if (!v14)
      {
        v5 = v13 + 2;
        if (v13 + 2 >= v10)
          return (unint64_t *)sub_2496B24D4(result, a2, v4, a3);
        v14 = *(_QWORD *)(v6 + 8 * v5);
        if (!v14)
          break;
      }
    }
LABEL_20:
    v9 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    if (*(_BYTE *)(*(_QWORD *)(a3 + 56) + v12) == 1)
    {
      *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v4++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_2496B24D4(result, a2, v4, a3);
      }
    }
  }
  v15 = v13 + 3;
  if (v15 >= v10)
    return (unint64_t *)sub_2496B24D4(result, a2, v4, a3);
  v14 = *(_QWORD *)(v6 + 8 * v15);
  if (v14)
  {
    v5 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v5 >= v10)
      return (unint64_t *)sub_2496B24D4(result, a2, v4, a3);
    v14 = *(_QWORD *)(v6 + 8 * v5);
    ++v15;
    if (v14)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2496B24D4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v31;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257876798);
  result = sub_2496BB284();
  v8 = result;
  v31 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v31)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v31)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v31)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v31)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v31)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_BYTE *)(*(_QWORD *)(v4 + 56) + v13);
    sub_2496BB3B0();
    swift_bridgeObjectRetain();
    sub_2496BAF30();
    result = sub_2496BB3C8();
    v21 = -1 << *(_BYTE *)(v8 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    v29 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v24);
    *v29 = v19;
    v29[1] = v18;
    *(_BYTE *)(*(_QWORD *)(v8 + 56) + v24) = v20;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2496B2778(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v37;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876CE0);
  result = sub_2496BB284();
  v8 = result;
  v35 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v37 = v10;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v35)
        return v8;
      v15 = a1[v14];
      v16 = v10 + 1;
      if (!v15)
      {
        v16 = v10 + 2;
        if (v10 + 2 >= v35)
          return v8;
        v15 = a1[v16];
        if (!v15)
        {
          v16 = v10 + 3;
          if (v10 + 3 >= v35)
            return v8;
          v15 = a1[v16];
          if (!v15)
          {
            v17 = v10 + 4;
            if (v10 + 4 >= v35)
              return v8;
            v15 = a1[v17];
            if (!v15)
            {
              while (1)
              {
                v16 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v16 >= v35)
                  return v8;
                v15 = a1[v16];
                ++v17;
                if (v15)
                  goto LABEL_24;
              }
            }
            v16 = v10 + 4;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v37 = v16;
      v13 = __clz(__rbit64(v15)) + (v16 << 6);
    }
    v18 = 8 * v13;
    v19 = v4;
    v20 = *(void **)(*(_QWORD *)(v4 + 48) + v18);
    v21 = *(void **)(*(_QWORD *)(v4 + 56) + v18);
    sub_2496BAF00();
    sub_2496BB3B0();
    v22 = v20;
    v23 = v21;
    sub_2496BAF30();
    v24 = sub_2496BB3C8();
    result = swift_bridgeObjectRelease();
    v25 = -1 << *(_BYTE *)(v8 + 32);
    v26 = v24 & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      v28 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v31 = v27 == v30;
        if (v27 == v30)
          v27 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v27);
      }
      while (v32 == -1);
      v28 = __clz(__rbit64(~v32)) + (v27 << 6);
    }
    *(_QWORD *)(v11 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    v33 = 8 * v28;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v33) = v22;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v33) = v23;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    v4 = v19;
    v10 = v37;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2496B2A58(unint64_t a1)
{
  return sub_2496A29E0(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_2496B2A6C(unint64_t a1)
{
  return sub_2496A29F4(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_2496B2A84(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

void sub_2496B2B0C()
{
  JUMPOUT(0x24BCF5A34);
}

uint64_t sub_2496B2B20(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;

  v2 = (_QWORD *)sub_2496A9274(MEMORY[0x24BEE4AF8]);
  v24 = *(_QWORD *)(a1 + 16);
  if (!v24)
    return (uint64_t)v2;
  v23 = a1 + 32;
  swift_bridgeObjectRetain();
  v3 = 0;
  while (1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(v23 + 8 * v3) + 16);
    if (v4)
      break;
LABEL_4:
    if (++v3 == v24)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v2;
    }
  }
  v5 = 0;
  v6 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  while (1)
  {
    v8 = *(v6 - 1);
    v7 = *v6;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = sub_2496B6B78(v8, v7);
    v12 = v2[2];
    v13 = (v10 & 1) == 0;
    v14 = v12 + v13;
    if (__OFADD__(v12, v13))
      break;
    v15 = v10;
    if (v2[3] >= v14)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v10 & 1) != 0)
          goto LABEL_7;
      }
      else
      {
        sub_2496948A8();
        if ((v15 & 1) != 0)
          goto LABEL_7;
      }
    }
    else
    {
      sub_2496B0860(v14, isUniquelyReferenced_nonNull_native);
      v16 = sub_2496B6B78(v8, v7);
      if ((v15 & 1) != (v17 & 1))
        goto LABEL_24;
      v11 = v16;
      if ((v15 & 1) != 0)
      {
LABEL_7:
        *(_QWORD *)(v2[7] + 8 * v11) = v5;
        goto LABEL_8;
      }
    }
    v2[(v11 >> 6) + 8] |= 1 << v11;
    v18 = (uint64_t *)(v2[6] + 16 * v11);
    *v18 = v8;
    v18[1] = v7;
    *(_QWORD *)(v2[7] + 8 * v11) = v5;
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_23;
    v2[2] = v21;
    swift_bridgeObjectRetain();
LABEL_8:
    ++v5;
    v6 += 2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v4 == v5)
    {
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_2496BB398();
  __break(1u);
  return result;
}

uint64_t sub_2496B2D18()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2496B2D3C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2496B2D70()
{
  uint64_t *v0;

  return sub_2496AC4DC(v0[2], v0[3], v0[4], v0[5]);
}

unint64_t sub_2496B2D7C()
{
  unint64_t result;

  result = qword_2544AFF18;
  if (!qword_2544AFF18)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2544AFF18);
  }
  return result;
}

uint64_t sub_2496B2DB8()
{
  return swift_deallocObject();
}

uint64_t sub_2496B2DC8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_2496B2E00(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FragmentCollator.RootElement();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2496B2E3C(uint64_t a1, uint64_t a2, id IntersectionWithRegion)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id EmptyRegion;
  double v19;
  double v20;
  double v21;
  char v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  double v29;
  double v30;
  double v31;
  char v32;
  double Width;
  double Height;
  _QWORD v36[2];
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v6 = sub_2496BAA14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2496BA9FC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a2 + 48);
  if (!v14)
  {
    v17 = IntersectionWithRegion;
    return (uint64_t)IntersectionWithRegion;
  }
  if (!IntersectionWithRegion)
  {
    v36[1] = a1;
    sub_2496BAA20();
    if ((*(unsigned int (**)(char *, uint64_t))(v7 + 88))(v9, v6) == *MEMORY[0x24BEBB978])
    {
      (*(void (**)(char *, uint64_t))(v7 + 96))(v9, v6);
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
      if ((sub_2496BA9F0() & 1) != 0)
      {
        sub_2496BA930();
        EmptyRegion = (id)CGRegionCreateWithRect();
        if (!EmptyRegion)
          EmptyRegion = (id)CGRegionCreateEmptyRegion();
        goto LABEL_22;
      }
      v25 = sub_2496BA9CC();
      if (v26)
      {
        if (*(_QWORD *)(v14 + 16))
        {
          v27 = sub_2496B6B78(v25, v26);
          if ((v28 & 1) != 0)
          {
            EmptyRegion = *(id *)(*(_QWORD *)(v14 + 56) + 8 * v27);
            swift_bridgeObjectRelease();
LABEL_22:
            IntersectionWithRegion = EmptyRegion;
            if (CGRegionIsEmpty())
            {

              (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
              return 1;
            }
            sub_2496AEC68(IntersectionWithRegion);
            v29 = *(double *)(a2 + 56);
            v30 = *(double *)(a2 + 64);
            v31 = COERCE_DOUBLE(sub_2496BA978());
            if ((v32 & 1) != 0 || v29 <= v31)
            {

              (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
              return (uint64_t)IntersectionWithRegion;
            }
            sub_2496BA930();
            Width = CGRectGetWidth(v39);
            sub_2496BA930();
            Height = CGRectGetHeight(v40);

            (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
            if (v30 <= Width * Height)
              return (uint64_t)IntersectionWithRegion;
            goto LABEL_15;
          }
        }
        swift_bridgeObjectRelease();
      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    return 0;
  }
  v15 = IntersectionWithRegion;
  sub_2496BA930();
  v16 = (void *)CGRegionCreateWithRect();
  if (!v16)
    v16 = (void *)CGRegionCreateEmptyRegion();
  IntersectionWithRegion = (id)CGRegionCreateIntersectionWithRegion();

  if ((CGRegionIsEmpty() & 1) != 0)
  {

LABEL_15:
    return 1;
  }
  sub_2496AEC68(IntersectionWithRegion);
  v19 = *(double *)(a2 + 72);
  v20 = *(double *)(a2 + 80);
  v21 = COERCE_DOUBLE(sub_2496BA978());
  if ((v22 & 1) != 0 || v19 <= v21)
  {

    return (uint64_t)IntersectionWithRegion;
  }
  sub_2496BA930();
  v23 = CGRectGetWidth(v37);
  sub_2496BA930();
  v24 = CGRectGetHeight(v38);

  if (v20 > v23 * v24)
    goto LABEL_15;
  return (uint64_t)IntersectionWithRegion;
}

uint64_t sub_2496B3168(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  _QWORD *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t (*v34)(char *, uint64_t);
  uint64_t v35;
  int v36;
  void (*v37)(char *, uint64_t);
  void (*v38)(char *, char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;

  v78 = a5;
  v64 = a1;
  v80 = sub_2496BAA14();
  v8 = *(_QWORD *)(v80 - 8);
  v9 = MEMORY[0x24BDAC7A8](v80);
  v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v62 - v12;
  v86 = sub_2496BA9FC();
  v82 = *(_QWORD *)(v86 - 8);
  v14 = MEMORY[0x24BDAC7A8](v86);
  v72 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v81 = (char *)&v62 - v16;
  v17 = sub_2496BAA38();
  v77 = *(_QWORD **)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v71 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v87 = (char *)&v62 - v21;
  result = MEMORY[0x24BDAC7A8](v20);
  v83 = (char *)&v62 - v23;
  v70 = a3;
  v63 = a2;
  if (a3 != a2)
  {
    v24 = result;
    v25 = v77[9];
    v67 = (void (*)(char *, uint64_t, uint64_t))v77[2];
    v79 = *MEMORY[0x24BEBB978];
    v69 = v25;
    v84 = v25 * v70;
    v85 = v25 * (v70 - 1);
    v65 = a4;
    v66 = v8;
    v73 = v13;
    v68 = result;
LABEL_8:
    v28 = 0;
    v76 = v64;
    while (1)
    {
      v29 = v24;
      v30 = v11;
      v31 = a4;
      v32 = *a4;
      v75 = v84 + v28;
      v33 = v67;
      v67(v83, v84 + v28 + v32, v29);
      v74 = v85 + v28;
      v33(v87, v85 + v28 + v32, v29);
      sub_2496BAA20();
      v34 = *(uint64_t (**)(char *, uint64_t))(v8 + 88);
      v35 = v80;
      v36 = v34(v13, v80);
      if (v36 != v79)
        break;
      v37 = *(void (**)(char *, uint64_t))(v8 + 96);
      v37(v13, v35);
      v38 = *(void (**)(char *, char *, uint64_t))(v82 + 32);
      v38(v81, v13, v86);
      v39 = sub_2496BA9CC();
      if (!v40)
      {
        (*(void (**)(char *, uint64_t))(v82 + 8))(v81, v86);
        v8 = v66;
        v11 = v30;
        v13 = v73;
        goto LABEL_5;
      }
      v41 = v78;
      a4 = v31;
      if (!*(_QWORD *)(v78 + 16) || (v42 = sub_2496B6B78(v39, v40), (v43 & 1) == 0))
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v82 + 8))(v81, v86);
        v8 = v66;
        goto LABEL_27;
      }
      v44 = *(_QWORD *)(*(_QWORD *)(v41 + 56) + 8 * v42);
      swift_bridgeObjectRelease();
      sub_2496BAA20();
      v45 = v80;
      v46 = v34(v30, v80);
      if (v46 != v79)
      {
        (*(void (**)(char *, uint64_t))(v82 + 8))(v81, v86);
        v8 = v66;
        (*(void (**)(char *, uint64_t))(v66 + 8))(v30, v45);
        a4 = v65;
LABEL_27:
        v11 = v30;
        v13 = v73;
LABEL_6:
        v26 = (void (*)(char *, uint64_t))v77[1];
        v27 = v68;
        v26(v87, v68);
        result = ((uint64_t (*)(char *, uint64_t))v26)(v83, v27);
        v24 = v27;
LABEL_7:
        v85 += v69;
        v84 += v69;
        if (++v70 == v63)
          return result;
        goto LABEL_8;
      }
      v37(v30, v45);
      v38(v72, v30, v86);
      v47 = sub_2496BA9CC();
      v11 = v30;
      if (!v48)
        goto LABEL_24;
      v49 = v78;
      if (!*(_QWORD *)(v78 + 16) || (v50 = sub_2496B6B78(v47, v48), (v51 & 1) == 0))
      {
        swift_bridgeObjectRelease();
LABEL_24:
        v60 = *(void (**)(char *, uint64_t))(v82 + 8);
        v61 = v86;
        v60(v72, v86);
        v60(v81, v61);
        a4 = v65;
        v8 = v66;
        v13 = v73;
        goto LABEL_6;
      }
      v52 = *(_QWORD *)(*(_QWORD *)(v49 + 56) + 8 * v50);
      swift_bridgeObjectRelease();
      v53 = *(void (**)(char *, uint64_t))(v82 + 8);
      v54 = v86;
      v53(v72, v86);
      v53(v81, v54);
      v55 = (void (*)(char *, uint64_t))v77[1];
      v24 = v68;
      v55(v87, v68);
      result = ((uint64_t (*)(char *, uint64_t))v55)(v83, v24);
      v56 = v52 < v44;
      a4 = v65;
      v8 = v66;
      v13 = v73;
      if (!v56)
        goto LABEL_7;
      v57 = *v65;
      if (!*v65)
      {
        __break(1u);
        return result;
      }
      v58 = v57 + v85 + v28;
      v59 = (void (*)(char *, uint64_t, uint64_t))v77[4];
      v59(v71, v57 + v84 + v28, v24);
      swift_arrayInitWithTakeFrontToBack();
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v59)(v58, v71, v24);
      v28 -= v69;
      ++v76;
      v13 = v73;
      if (v70 == v76)
        goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v35);
    v11 = v30;
LABEL_5:
    a4 = v31;
    goto LABEL_6;
  }
  return result;
}

uint64_t sub_2496B36FC(char **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  int64_t v51;
  int64_t v52;
  char *v53;
  unint64_t v54;
  void (*v55)(char *, char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  int64_t v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  void (*v68)(char *, char *, uint64_t);
  uint64_t v69;
  uint64_t (*v70)(char *, uint64_t);
  uint64_t v71;
  int v72;
  void (*v73)(char *, uint64_t);
  char *v74;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char *v82;
  uint64_t v83;
  int v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(char *, uint64_t);
  uint64_t v95;
  _BOOL4 v96;
  uint64_t v97;
  void (*v98)(char *, uint64_t);
  void (*v99)(char *, uint64_t);
  uint64_t v100;
  void (*v101)(char *, uint64_t);
  uint64_t v102;
  int64_t v103;
  unint64_t v104;
  int64_t v105;
  int64_t v106;
  uint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  int64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  void (*v117)(char *, char *, uint64_t);
  uint64_t v118;
  uint64_t (*v119)(char *, uint64_t);
  uint64_t v120;
  int v121;
  void (*v122)(char *, uint64_t);
  uint64_t v123;
  void (*v124)(char *, char *, uint64_t);
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  char v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  int v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  char v136;
  uint64_t v137;
  void (*v138)(char *, uint64_t);
  void (*v139)(char *, uint64_t);
  char *v140;
  char *v141;
  void (*v142)(char *, char *, uint64_t);
  void (*v143)(char *, uint64_t);
  void (*v144)(char *, uint64_t);
  void (*v145)(char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  char *v150;
  char *v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  BOOL v164;
  unint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  BOOL v174;
  uint64_t v175;
  char v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  BOOL v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  char *v193;
  char *v194;
  uint64_t v195;
  char *v196;
  unint64_t v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  unint64_t v201;
  unint64_t v202;
  uint64_t v203;
  unint64_t v204;
  uint64_t v205;
  unint64_t v206;
  char *v207;
  char *v208;
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  unint64_t v214;
  unint64_t v215;
  unint64_t v216;
  unint64_t v217;
  uint64_t v218;
  char *v219;
  unint64_t v220;
  void (*v221)(uint64_t, uint64_t);
  uint64_t v222;
  uint64_t v223;
  char *v224;
  uint64_t v225;
  uint64_t v226;
  char *v227;
  char *v228;
  char *v229;
  char *v230;
  char *v231;
  char *v232;
  char *v233;
  unint64_t v234;
  char *v235;
  int64_t v236;
  char *v237;
  unint64_t v238;
  char *v239;
  char *v240;
  unint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  char *v245;
  void (*v246)(char *, char *, uint64_t);
  int64_t v247;
  char *v248;
  char *v249;
  _QWORD *v250;
  uint64_t v251;
  uint64_t v252;
  char *v253;
  uint64_t v254;
  char *v255;
  uint64_t v256;
  int v257;
  uint64_t v258;
  int64_t v259;
  int64_t v260;
  char **v261;
  char *v262;
  uint64_t v263;

  v258 = sub_2496BAA14();
  v244 = *(_QWORD *)(v258 - 8);
  v4 = MEMORY[0x24BDAC7A8](v258);
  v6 = (char *)&v222 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v222 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v228 = (char *)&v222 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v222 - v12;
  v14 = sub_2496BA9FC();
  v256 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v249 = (char *)&v222 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v253 = (char *)&v222 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v227 = (char *)&v222 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v230 = (char *)&v222 - v21;
  v252 = sub_2496BAA38();
  v22 = *(_QWORD **)(v252 - 8);
  v23 = MEMORY[0x24BDAC7A8](v252);
  v235 = (char *)&v222 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v245 = (char *)&v222 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v262 = (char *)&v222 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v255 = (char *)&v222 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v232 = (char *)&v222 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v237 = (char *)&v222 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v229 = (char *)&v222 - v36;
  MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v222 - v37;
  v261 = a1;
  v39 = (uint64_t)a1[1];
  v263 = a2;
  v40 = v39;
  swift_bridgeObjectRetain_n();
  v41 = sub_2496BB35C();
  if (v41 >= v40)
  {
    if (v40 < 0)
      goto LABEL_178;
    if (v40)
    {
      v46 = v263;
      swift_bridgeObjectRetain();
      sub_2496B3168(0, v40, 1, v261, v46);
    }
    return swift_bridgeObjectRelease_n();
  }
  v226 = v41;
  if (v40 >= 0)
    v42 = v40;
  else
    v42 = v40 + 1;
  if (v40 < -1)
    goto LABEL_186;
  v250 = v22;
  if (v40 < 2)
  {
    v48 = MEMORY[0x24BEE4AF8];
    v238 = MEMORY[0x24BEE4AF8]
         + ((*((unsigned __int8 *)v22 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v22 + 80));
    if (v40 != 1)
    {
      v149 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v50 = (char *)MEMORY[0x24BEE4AF8];
      goto LABEL_143;
    }
    v224 = v38;
    v225 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v224 = v38;
    v43 = v42 >> 1;
    v44 = sub_2496BAFCC();
    *(_QWORD *)(v44 + 16) = v43;
    v45 = (*((unsigned __int8 *)v22 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v22 + 80);
    v225 = v44;
    v238 = v44 + v45;
  }
  v49 = 0;
  v257 = *MEMORY[0x24BEBB978];
  v50 = (char *)MEMORY[0x24BEE4AF8];
  v240 = v6;
  v248 = v9;
  v239 = v13;
  v251 = v14;
  while (2)
  {
    v51 = v49;
    v52 = v49 + 1;
    v233 = v50;
    v236 = v51;
    if (v52 >= v40)
    {
      v63 = v52;
      goto LABEL_56;
    }
    v259 = v40;
    v53 = *v261;
    v54 = v22[9];
    v254 = v52;
    v55 = (void (*)(char *, char *, uint64_t))v22[2];
    v56 = (uint64_t)v224;
    v57 = v252;
    v55(v224, &v53[v54 * v52], v252);
    v231 = v53;
    v260 = v54;
    v58 = &v53[v54 * v236];
    v59 = v56;
    v60 = (uint64_t)v229;
    v246 = v55;
    v55(v229, v58, v57);
    v61 = v243;
    LODWORD(v247) = sub_2496AF09C(v59, v60, v263);
    v243 = v61;
    if (v61)
    {
      v221 = (void (*)(uint64_t, uint64_t))v250[1];
      v221(v60, v57);
      v221(v59, v57);
      goto LABEL_156;
    }
    v62 = (void (*)(uint64_t, uint64_t))v250[1];
    v62(v60, v57);
    v242 = (uint64_t)v62;
    v62(v59, v57);
    v51 = v236;
    v63 = v236 + 2;
    if (v236 + 2 >= v259)
    {
      v40 = v259;
      goto LABEL_42;
    }
    v241 = v260 * v254;
    v64 = v231;
    v234 = v260 * v63;
    v65 = v230;
    v66 = v232;
    while (1)
    {
      v254 = v63;
      v67 = v252;
      v68 = v246;
      v246(v237, &v64[v234], v252);
      v68(v66, &v64[v241], v67);
      sub_2496BAA20();
      v69 = v244;
      v70 = *(uint64_t (**)(char *, uint64_t))(v244 + 88);
      v71 = v258;
      v72 = v70(v13, v258);
      if (v72 != v257)
      {
        (*(void (**)(char *, uint64_t))(v69 + 8))(v13, v71);
        v96 = 0;
        goto LABEL_33;
      }
      v73 = *(void (**)(char *, uint64_t))(v69 + 96);
      v73(v13, v71);
      v74 = v13;
      v75 = v256;
      v76 = *(void (**)(char *, char *, uint64_t))(v256 + 32);
      v77 = v251;
      v76(v65, v74, v251);
      v78 = sub_2496BA9CC();
      if (!v79)
      {
        (*(void (**)(char *, uint64_t))(v75 + 8))(v65, v77);
        goto LABEL_32;
      }
      if (!*(_QWORD *)(v263 + 16) || (v80 = sub_2496B6B78(v78, v79), (v81 & 1) == 0))
      {
        swift_bridgeObjectRelease();
        v65 = v230;
        (*(void (**)(char *, uint64_t))(v256 + 8))(v230, v251);
LABEL_32:
        v96 = 0;
        v9 = v248;
        v13 = v239;
        v66 = v232;
        v51 = v236;
        goto LABEL_33;
      }
      v223 = *(_QWORD *)(*(_QWORD *)(v263 + 56) + 8 * v80);
      swift_bridgeObjectRelease();
      v82 = v228;
      v66 = v232;
      sub_2496BAA20();
      v83 = v258;
      v84 = v70(v82, v258);
      v65 = v230;
      v51 = v236;
      if (v84 != v257)
      {
        (*(void (**)(char *, uint64_t))(v256 + 8))(v230, v251);
        (*(void (**)(char *, uint64_t))(v244 + 8))(v82, v83);
LABEL_38:
        v96 = 0;
        v9 = v248;
        v13 = v239;
        goto LABEL_33;
      }
      v73(v82, v83);
      v85 = v227;
      v86 = v251;
      v76(v227, v82, v251);
      v87 = sub_2496BA9CC();
      v89 = v256;
      if (!v88)
      {
        v101 = *(void (**)(char *, uint64_t))(v256 + 8);
        v101(v85, v86);
        v101(v65, v86);
        goto LABEL_38;
      }
      v13 = v239;
      if (*(_QWORD *)(v263 + 16) && (v90 = sub_2496B6B78(v87, v88), (v91 & 1) != 0))
      {
        v92 = v89;
        v93 = *(_QWORD *)(*(_QWORD *)(v263 + 56) + 8 * v90);
        swift_bridgeObjectRelease();
        v94 = *(void (**)(char *, uint64_t))(v92 + 8);
        v95 = v251;
        v94(v227, v251);
        v94(v65, v95);
        v96 = v93 < v223;
        v9 = v248;
      }
      else
      {
        swift_bridgeObjectRelease();
        v99 = *(void (**)(char *, uint64_t))(v89 + 8);
        v100 = v251;
        v99(v227, v251);
        v99(v65, v100);
        v96 = 0;
        v9 = v248;
      }
LABEL_33:
      v97 = v252;
      v98 = (void (*)(char *, uint64_t))v242;
      ((void (*)(char *, uint64_t))v242)(v66, v252);
      v98(v237, v97);
      if (((v247 ^ v96) & 1) != 0)
        break;
      v63 = v254 + 1;
      v64 += v260;
      if (v259 == v254 + 1)
      {
        v40 = v259;
        v63 = v259;
        v14 = v251;
        v50 = v233;
        goto LABEL_42;
      }
    }
    v14 = v251;
    v50 = v233;
    v63 = v254;
    v40 = v259;
LABEL_42:
    v22 = v250;
    if ((v247 & 1) == 0)
    {
LABEL_56:
      if (v63 < v40)
      {
        if (__OFSUB__(v63, v51))
          goto LABEL_177;
        if (v63 - v51 < v226)
        {
          if (__OFADD__(v51, v226))
            goto LABEL_179;
          if (v51 + v226 >= v40)
            v111 = v40;
          else
            v111 = v51 + v226;
          if (v111 < v51)
          {
LABEL_180:
            __break(1u);
            goto LABEL_181;
          }
          if (v63 != v111)
          {
            v112 = v22[9];
            v241 = v22[2];
            v242 = v112;
            v259 = v63 * v112;
            v260 = v112 * (v63 - 1);
            v113 = v252;
            v234 = v111;
            do
            {
              v114 = 0;
              v254 = v63;
              while (1)
              {
                v116 = *v261;
                v246 = (void (*)(char *, char *, uint64_t))(v259 + v114);
                v247 = v51;
                v117 = (void (*)(char *, char *, uint64_t))v241;
                ((void (*)(char *, char *, uint64_t))v241)(v255, &v116[v259 + v114], v113);
                v117(v262, &v116[v260 + v114], v113);
                sub_2496BAA20();
                v118 = v244;
                v119 = *(uint64_t (**)(char *, uint64_t))(v244 + 88);
                v120 = v258;
                v121 = v119(v9, v258);
                if (v121 != v257)
                {
                  (*(void (**)(char *, uint64_t))(v118 + 8))(v9, v120);
                  goto LABEL_85;
                }
                v122 = *(void (**)(char *, uint64_t))(v118 + 96);
                v122(v9, v120);
                v123 = v256;
                v124 = *(void (**)(char *, char *, uint64_t))(v256 + 32);
                v124(v253, v9, v14);
                v125 = sub_2496BA9CC();
                if (!v126)
                  goto LABEL_80;
                if (!*(_QWORD *)(v263 + 16) || (v127 = sub_2496B6B78(v125, v126), (v128 & 1) == 0))
                {
                  swift_bridgeObjectRelease();
LABEL_80:
                  v14 = v251;
                  (*(void (**)(char *, uint64_t))(v123 + 8))(v253, v251);
LABEL_84:
                  v22 = v250;
                  v9 = v248;
                  v113 = v252;
LABEL_85:
                  v144 = (void (*)(char *, uint64_t))v22[1];
                  v144(v262, v113);
                  v144(v255, v113);
                  goto LABEL_86;
                }
                v129 = *(_QWORD *)(*(_QWORD *)(v263 + 56) + 8 * v127);
                swift_bridgeObjectRelease();
                v130 = v240;
                sub_2496BAA20();
                v131 = v258;
                v132 = v119(v130, v258);
                if (v132 != v257)
                {
                  v14 = v251;
                  (*(void (**)(char *, uint64_t))(v256 + 8))(v253, v251);
                  (*(void (**)(char *, uint64_t))(v244 + 8))(v130, v131);
                  goto LABEL_84;
                }
                v122(v130, v131);
                v14 = v251;
                v124(v249, v130, v251);
                v133 = sub_2496BA9CC();
                if (!v134)
                {
                  v145 = *(void (**)(char *, uint64_t))(v256 + 8);
                  v145(v249, v14);
                  v145(v253, v14);
                  goto LABEL_84;
                }
                v22 = v250;
                v113 = v252;
                if (!*(_QWORD *)(v263 + 16) || (v135 = sub_2496B6B78(v133, v134), (v136 & 1) == 0))
                {
                  swift_bridgeObjectRelease();
                  v143 = *(void (**)(char *, uint64_t))(v256 + 8);
                  v143(v249, v14);
                  v143(v253, v14);
                  v9 = v248;
                  goto LABEL_85;
                }
                v137 = *(_QWORD *)(*(_QWORD *)(v263 + 56) + 8 * v135);
                swift_bridgeObjectRelease();
                v138 = *(void (**)(char *, uint64_t))(v256 + 8);
                v138(v249, v14);
                v138(v253, v14);
                v139 = (void (*)(char *, uint64_t))v22[1];
                v139(v262, v113);
                v139(v255, v113);
                if (v137 >= v129)
                  break;
                v140 = *v261;
                if (!*v261)
                  goto LABEL_182;
                v141 = &v140[v260 + v114];
                v142 = (void (*)(char *, char *, uint64_t))v22[4];
                v142(v245, &v140[v259 + v114], v113);
                swift_arrayInitWithTakeFrontToBack();
                v142(v141, v245, v113);
                v114 -= v242;
                v9 = v248;
                v51 = v247 + 1;
                v115 = v254;
                if (v254 == v247 + 1)
                  goto LABEL_87;
              }
              v9 = v248;
LABEL_86:
              v115 = v254;
LABEL_87:
              v63 = v115 + 1;
              v260 += v242;
              v259 += v242;
              v51 = v236;
            }
            while (v63 != v234);
            v63 = v234;
            v13 = v239;
            v50 = v233;
          }
        }
      }
      if (v63 < v51)
        goto LABEL_173;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v254 = v63;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v50 = sub_2496B1F78(0, *((_QWORD *)v50 + 2) + 1, 1, v50);
      v148 = *((_QWORD *)v50 + 2);
      v147 = *((_QWORD *)v50 + 3);
      v149 = v148 + 1;
      if (v148 >= v147 >> 1)
        v50 = sub_2496B1F78((char *)(v147 > 1), v148 + 1, 1, v50);
      *((_QWORD *)v50 + 2) = v149;
      v150 = v50 + 32;
      v151 = &v50[16 * v148 + 32];
      v152 = v254;
      *(_QWORD *)v151 = v51;
      *((_QWORD *)v151 + 1) = v152;
      if (v148)
      {
        while (1)
        {
          v153 = v149 - 1;
          if (v149 >= 4)
          {
            v158 = &v150[16 * v149];
            v159 = *((_QWORD *)v158 - 8);
            v160 = *((_QWORD *)v158 - 7);
            v164 = __OFSUB__(v160, v159);
            v161 = v160 - v159;
            if (v164)
              goto LABEL_161;
            v163 = *((_QWORD *)v158 - 6);
            v162 = *((_QWORD *)v158 - 5);
            v164 = __OFSUB__(v162, v163);
            v156 = v162 - v163;
            v157 = v164;
            if (v164)
              goto LABEL_162;
            v165 = v149 - 2;
            v166 = &v150[16 * v149 - 32];
            v168 = *(_QWORD *)v166;
            v167 = *((_QWORD *)v166 + 1);
            v164 = __OFSUB__(v167, v168);
            v169 = v167 - v168;
            if (v164)
              goto LABEL_164;
            v164 = __OFADD__(v156, v169);
            v170 = v156 + v169;
            if (v164)
              goto LABEL_167;
            if (v170 >= v161)
            {
              v188 = &v150[16 * v153];
              v190 = *(_QWORD *)v188;
              v189 = *((_QWORD *)v188 + 1);
              v164 = __OFSUB__(v189, v190);
              v191 = v189 - v190;
              if (v164)
                goto LABEL_171;
              v181 = v156 < v191;
              goto LABEL_128;
            }
          }
          else
          {
            if (v149 != 3)
            {
              v182 = *((_QWORD *)v50 + 4);
              v183 = *((_QWORD *)v50 + 5);
              v164 = __OFSUB__(v183, v182);
              v175 = v183 - v182;
              v176 = v164;
              goto LABEL_122;
            }
            v155 = *((_QWORD *)v50 + 4);
            v154 = *((_QWORD *)v50 + 5);
            v164 = __OFSUB__(v154, v155);
            v156 = v154 - v155;
            v157 = v164;
          }
          if ((v157 & 1) != 0)
            goto LABEL_163;
          v165 = v149 - 2;
          v171 = &v150[16 * v149 - 32];
          v173 = *(_QWORD *)v171;
          v172 = *((_QWORD *)v171 + 1);
          v174 = __OFSUB__(v172, v173);
          v175 = v172 - v173;
          v176 = v174;
          if (v174)
            goto LABEL_166;
          v177 = &v150[16 * v153];
          v179 = *(_QWORD *)v177;
          v178 = *((_QWORD *)v177 + 1);
          v164 = __OFSUB__(v178, v179);
          v180 = v178 - v179;
          if (v164)
            goto LABEL_169;
          if (__OFADD__(v175, v180))
            goto LABEL_170;
          if (v175 + v180 >= v156)
          {
            v181 = v156 < v180;
LABEL_128:
            if (v181)
              v153 = v165;
            goto LABEL_130;
          }
LABEL_122:
          if ((v176 & 1) != 0)
            goto LABEL_165;
          v184 = &v150[16 * v153];
          v186 = *(_QWORD *)v184;
          v185 = *((_QWORD *)v184 + 1);
          v164 = __OFSUB__(v185, v186);
          v187 = v185 - v186;
          if (v164)
            goto LABEL_168;
          if (v187 < v175)
            goto LABEL_139;
LABEL_130:
          v192 = v153 - 1;
          if (v153 - 1 >= v149)
          {
            __break(1u);
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
LABEL_160:
            __break(1u);
LABEL_161:
            __break(1u);
LABEL_162:
            __break(1u);
LABEL_163:
            __break(1u);
LABEL_164:
            __break(1u);
LABEL_165:
            __break(1u);
LABEL_166:
            __break(1u);
LABEL_167:
            __break(1u);
LABEL_168:
            __break(1u);
LABEL_169:
            __break(1u);
LABEL_170:
            __break(1u);
LABEL_171:
            __break(1u);
LABEL_172:
            __break(1u);
LABEL_173:
            __break(1u);
LABEL_174:
            __break(1u);
LABEL_175:
            __break(1u);
LABEL_176:
            __break(1u);
LABEL_177:
            __break(1u);
LABEL_178:
            __break(1u);
LABEL_179:
            __break(1u);
            goto LABEL_180;
          }
          v193 = *v261;
          if (!*v261)
            goto LABEL_183;
          v194 = &v150[16 * v192];
          v195 = *(_QWORD *)v194;
          v196 = v150;
          v197 = v153;
          v198 = &v150[16 * v153];
          v199 = *((_QWORD *)v198 + 1);
          v200 = v250[9];
          v201 = (unint64_t)&v193[v200 * *(_QWORD *)v194];
          v202 = (unint64_t)&v193[v200 * *(_QWORD *)v198];
          v259 = (int64_t)&v193[v200 * v199];
          v260 = v202;
          v203 = v263;
          swift_bridgeObjectRetain();
          v204 = v201;
          v205 = v243;
          sub_2496B1994(v204, v260, v259, v238, v203);
          v243 = v205;
          if (v205)
            goto LABEL_156;
          if (v199 < v195)
            goto LABEL_158;
          if (v197 > *((_QWORD *)v50 + 2))
            goto LABEL_159;
          *(_QWORD *)v194 = v195;
          *(_QWORD *)&v196[16 * v192 + 8] = v199;
          v206 = *((_QWORD *)v50 + 2);
          if (v197 >= v206)
            goto LABEL_160;
          v150 = v196;
          v149 = v206 - 1;
          memmove(v198, v198 + 16, 16 * (v206 - 1 - v197));
          *((_QWORD *)v50 + 2) = v206 - 1;
          v9 = v248;
          v13 = v239;
          v14 = v251;
          if (v206 <= 2)
            goto LABEL_139;
        }
      }
      v149 = 1;
LABEL_139:
      v40 = (uint64_t)v261[1];
      v49 = v254;
      v22 = v250;
      if (v254 >= v40)
      {
        v48 = v225;
LABEL_143:
        v207 = v50;
        v225 = v48;
        if (v149 >= 2)
        {
          v208 = *v261;
          v262 = *v261;
          v209 = v263;
          do
          {
            v210 = v149 - 2;
            if (v149 < 2)
              goto LABEL_172;
            if (!v208)
              goto LABEL_185;
            v211 = *(_QWORD *)&v207[16 * v210 + 32];
            v212 = *(_QWORD *)&v207[16 * v149 + 24];
            v213 = v250[9];
            v214 = (unint64_t)&v208[v213 * v211];
            v215 = (unint64_t)&v208[v213 * *(_QWORD *)&v207[16 * v149 + 16]];
            v216 = (unint64_t)&v208[v213 * v212];
            swift_bridgeObjectRetain();
            v217 = v214;
            v218 = v243;
            sub_2496B1994(v217, v215, v216, v238, v209);
            v243 = v218;
            if (v218)
              break;
            if (v212 < v211)
              goto LABEL_174;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v207 = sub_2496B2224((uint64_t)v207);
            if (v210 >= *((_QWORD *)v207 + 2))
              goto LABEL_175;
            v219 = &v207[16 * v210 + 32];
            *(_QWORD *)v219 = v211;
            *((_QWORD *)v219 + 1) = v212;
            v220 = *((_QWORD *)v207 + 2);
            if (v149 > v220)
              goto LABEL_176;
            memmove(&v207[16 * v149 + 16], &v207[16 * v149 + 32], 16 * (v220 - v149));
            *((_QWORD *)v207 + 2) = v220 - 1;
            v149 = v220 - 1;
            v208 = v262;
          }
          while (v220 > 2);
        }
LABEL_156:
        swift_bridgeObjectRelease();
        *(_QWORD *)(v225 + 16) = 0;
        swift_bridgeObjectRelease_n();
        return swift_bridgeObjectRelease();
      }
      continue;
    }
    break;
  }
  if (v63 >= v51)
  {
    if (v51 < v63)
    {
      v102 = 0;
      v103 = v260 * (v63 - 1);
      v104 = v63 * v260;
      v105 = v51;
      v106 = v51 * v260;
      do
      {
        if (v105 != v63 + v102 - 1)
        {
          v108 = v231;
          if (!v231)
            goto LABEL_184;
          v109 = &v231[v106];
          v110 = &v231[v103];
          v254 = v250[4];
          ((void (*)(char *, char *, uint64_t))v254)(v235, &v231[v106], v252);
          if (v106 < v103 || v109 >= &v108[v104])
          {
            v107 = v252;
            swift_arrayInitWithTakeFrontToBack();
          }
          else
          {
            v107 = v252;
            if (v106 != v103)
              swift_arrayInitWithTakeBackToFront();
          }
          ((void (*)(char *, char *, uint64_t))v254)(v110, v235, v107);
          v9 = v248;
          v14 = v251;
          v50 = v233;
        }
        ++v105;
        --v102;
        v103 -= v260;
        v104 -= v260;
        v106 += v260;
      }
      while (v105 < v63 + v102);
      v22 = v250;
      v13 = v239;
      v51 = v236;
      v40 = v259;
    }
    goto LABEL_56;
  }
LABEL_181:
  __break(1u);
LABEL_182:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_183:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_184:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_185:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_186:
  swift_bridgeObjectRelease_n();
  result = sub_2496BB248();
  __break(1u);
  return result;
}

uint64_t sub_2496B4990(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  char *v6;
  char *v8[2];

  v4 = *(_QWORD *)(sub_2496BAA38() - 8);
  v5 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_2496B2A58(v5);
  v6 = *(char **)(v5 + 16);
  v8[0] = (char *)(v5 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));
  v8[1] = v6;
  swift_bridgeObjectRetain();
  sub_2496B36FC(v8, a2);
  swift_bridgeObjectRelease();
  *a1 = v5;
  return swift_bridgeObjectRelease_n();
}

unint64_t sub_2496B4A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD v35[3];
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v47 = a4;
  v45 = a2;
  v46 = a3;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD20);
  MEMORY[0x24BDAC7A8](v10);
  v43 = (uint64_t)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFCB0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_2496BAA38();
  v15 = MEMORY[0x24BDAC7A8](v39);
  v44 = (char *)v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v38 = (char *)v35 - v18;
  v19 = *(_QWORD *)(a1 + 16);
  if (!v19)
    return MEMORY[0x24BEE4AF8];
  v35[1] = a1;
  v35[2] = v6;
  v37 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v20 = a1 + v37;
  v41 = v17;
  v21 = *(_QWORD *)(v17 + 72);
  swift_bridgeObjectRetain();
  v22 = MEMORY[0x24BEE4AF8];
  v42 = a5;
  v23 = v39;
  v24 = a6;
  v40 = v21;
  v36 = a6;
  do
  {
    v26 = a5;
    v27 = v43;
    sub_2496B506C(v26, v43, &qword_2544AFD20);
    sub_2496AC660(v20, v46, v47, v27, v24);
    sub_249697880(v27, &qword_2544AFD20);
    v28 = v41;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v14, 1, v23) == 1)
    {
      sub_249697880((uint64_t)v14, (uint64_t *)&unk_2544AFCB0);
      a5 = v42;
      v25 = v40;
    }
    else
    {
      v29 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
      v30 = v38;
      v29(v38, v14, v23);
      v29(v44, v30, v23);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v22 = sub_2496A29E0(0, *(_QWORD *)(v22 + 16) + 1, 1, v22);
      v25 = v40;
      v32 = *(_QWORD *)(v22 + 16);
      v31 = *(_QWORD *)(v22 + 24);
      if (v32 >= v31 >> 1)
        v22 = sub_2496A29E0(v31 > 1, v32 + 1, 1, v22);
      *(_QWORD *)(v22 + 16) = v32 + 1;
      v33 = v22 + v37 + v32 * v25;
      v23 = v39;
      v29((char *)v33, v44, v39);
      v24 = v36;
      a5 = v42;
    }
    v20 += v25;
    --v19;
  }
  while (v19);
  swift_bridgeObjectRelease();
  return v22;
}

unint64_t sub_2496B4D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  unint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  char *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544AFCB0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2496BAA38();
  v28 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v30 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v27 = (char *)&v24 - v13;
  v14 = *(_QWORD *)(a1 + 16);
  if (!v14)
    return MEMORY[0x24BEE4AF8];
  v15 = *(_QWORD *)(type metadata accessor for FragmentCollator.RootElement() - 8);
  v16 = (_OWORD *)(a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80)));
  v29 = *(_QWORD *)(v15 + 72);
  v24 = a1;
  swift_bridgeObjectRetain();
  v17 = MEMORY[0x24BEE4AF8];
  v25 = a2;
  v26 = a3;
  v18 = v28;
  do
  {
    sub_2496AC568(v16, a2, (uint64_t)v9);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v17;
    }
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v9, 1, v10) == 1)
    {
      sub_249697880((uint64_t)v9, (uint64_t *)&unk_2544AFCB0);
    }
    else
    {
      v19 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
      v20 = v27;
      v19(v27, v9, v10);
      v19(v30, v20, v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v17 = sub_2496A29E0(0, *(_QWORD *)(v17 + 16) + 1, 1, v17);
      v22 = *(_QWORD *)(v17 + 16);
      v21 = *(_QWORD *)(v17 + 24);
      if (v22 >= v21 >> 1)
        v17 = sub_2496A29E0(v21 > 1, v22 + 1, 1, v17);
      *(_QWORD *)(v17 + 16) = v22 + 1;
      v18 = v28;
      v19((char *)(v17+ ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))+ *(_QWORD *)(v28 + 72) * v22), v30, v10);
      a2 = v25;
    }
    v16 = (_OWORD *)((char *)v16 + v29);
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_2496B4FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2496AAEDC(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t **)(v2 + 24));
}

uint64_t sub_2496B4FBC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2496B5000(__int128 *a1, uint64_t a2)
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

uint64_t sub_2496B5018()
{
  return sub_2496BAA20();
}

uint64_t sub_2496B503C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2496AAA5C(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), *(unint64_t **)(v2 + 32), a2);
}

uint64_t sub_2496B5058(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_24969BD70(a1, a2);
  return a1;
}

uint64_t sub_2496B506C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

ValueMetadata *type metadata accessor for FragmentCollator.WindowOcclusionInfo()
{
  return &type metadata for FragmentCollator.WindowOcclusionInfo;
}

_QWORD *sub_2496B50C0(_OWORD *a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = *((_OWORD *)a2 + 1);
    *a1 = *(_OWORD *)a2;
    a1[1] = v5;
    a1[2] = *((_OWORD *)a2 + 2);
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (uint64_t)a2 + v6;
    v9 = sub_2496BAA38();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_2496B5150(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_2496BAA38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_OWORD *sub_2496B5188(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2496BAA38();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

_QWORD *sub_2496B51EC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_2496BAA38();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_OWORD *sub_2496B5270(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2496BAA38();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_OWORD *sub_2496B52D4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2496BAA38();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t sub_2496B5338()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2496B5344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = sub_2496BAA38();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t sub_2496B5384()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2496B5390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = sub_2496BAA38();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t sub_2496B53D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2496BAA38();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2496B5448(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)(uint64_t);
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_2496BAB10();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v25 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v25 - v10;
  sub_24968BDD4((unint64_t *)&unk_2544AFCF0, v12, MEMORY[0x24BEBBAB0]);
  result = sub_2496BAFFC();
  v14 = 0;
  v15 = *(_QWORD *)(a1 + 64);
  v25 = a1 + 64;
  v26 = result;
  v16 = 1 << *(_BYTE *)(a1 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & v15;
  v19 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      v20 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_5;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v22 >= v19)
      goto LABEL_23;
    v23 = *(_QWORD *)(v25 + 8 * v22);
    ++v14;
    if (!v23)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v19)
        goto LABEL_23;
      v23 = *(_QWORD *)(v25 + 8 * v14);
      if (!v23)
      {
        v14 = v22 + 2;
        if (v22 + 2 >= v19)
          goto LABEL_23;
        v23 = *(_QWORD *)(v25 + 8 * v14);
        if (!v23)
        {
          v14 = v22 + 3;
          if (v22 + 3 >= v19)
            goto LABEL_23;
          v23 = *(_QWORD *)(v25 + 8 * v14);
          if (!v23)
            break;
        }
      }
    }
LABEL_22:
    v18 = (v23 - 1) & v23;
    v21 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v11, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v3 + 72) * v21, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v11, v2);
    sub_2496B6F04((uint64_t)v9, v6);
    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
  v24 = v22 + 4;
  if (v24 >= v19)
  {
LABEL_23:
    swift_release();
    return v26;
  }
  v23 = *(_QWORD *)(v25 + 8 * v24);
  if (v23)
  {
    v14 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    v14 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v14 >= v19)
      goto LABEL_23;
    v23 = *(_QWORD *)(v25 + 8 * v14);
    ++v24;
    if (v23)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2496B56A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t v25;

  v2 = sub_2496BAA8C();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20];
  v4 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v24 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFCC8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24968BDD4(&qword_2544AFCC0, v3, MEMORY[0x24BEBBA30]);
  result = sub_2496BAFFC();
  v14 = 0;
  v15 = a1 + 64;
  v16 = 1 << *(_BYTE *)(a1 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & *(_QWORD *)(a1 + 64);
  v24 = (unint64_t)(v16 + 63) >> 6;
  v25 = result;
  if (!v18)
    goto LABEL_5;
LABEL_4:
  v19 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  for (i = v19 | (v14 << 6); ; i = __clz(__rbit64(v22)) + (v14 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v12, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v4 + 72) * i, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v12, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v2) == 1)
      goto LABEL_25;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v12, v2);
    sub_2496B7160((uint64_t)v9, v7);
    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v2);
    if (v18)
      goto LABEL_4;
LABEL_5:
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v24)
      goto LABEL_24;
    v22 = *(_QWORD *)(v15 + 8 * v21);
    ++v14;
    if (!v22)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v24)
        goto LABEL_24;
      v22 = *(_QWORD *)(v15 + 8 * v14);
      if (!v22)
      {
        v14 = v21 + 2;
        if (v21 + 2 >= v24)
          goto LABEL_24;
        v22 = *(_QWORD *)(v15 + 8 * v14);
        if (!v22)
        {
          v14 = v21 + 3;
          if (v21 + 3 >= v24)
            goto LABEL_24;
          v22 = *(_QWORD *)(v15 + 8 * v14);
          if (!v22)
            break;
        }
      }
    }
LABEL_20:
    v18 = (v22 - 1) & v22;
  }
  v23 = v21 + 4;
  if (v23 >= v24)
  {
LABEL_24:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v12, 1, 1, v2);
LABEL_25:
    swift_release();
    return v25;
  }
  v22 = *(_QWORD *)(v15 + 8 * v23);
  if (v22)
  {
    v14 = v23;
    goto LABEL_20;
  }
  while (1)
  {
    v14 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v14 >= v24)
      goto LABEL_24;
    v22 = *(_QWORD *)(v15 + 8 * v14);
    ++v23;
    if (v22)
      goto LABEL_20;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2496B5970(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  int64_t v33;

  v2 = sub_2496BAB10();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v28 - v7;
  v9 = *(_QWORD *)(a1 + 56);
  v32 = a1 + 56;
  v10 = 1 << *(_BYTE *)(a1 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v9;
  v33 = (unint64_t)(v10 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v14 = 0;
  v31 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!v12)
    goto LABEL_7;
LABEL_4:
  v15 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v21)) + (v14 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v8, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v3 + 72) * i, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    v17 = sub_2496BAAEC();
    v19 = v18;
    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    if (v19)
    {
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_2496A2384(0, v31[2] + 1, 1, v31);
        v31 = (_QWORD *)result;
      }
      v24 = v31[2];
      v23 = v31[3];
      v25 = v24 + 1;
      if (v24 >= v23 >> 1)
      {
        v29 = v31[2];
        v30 = v24 + 1;
        result = (uint64_t)sub_2496A2384((_QWORD *)(v23 > 1), v24 + 1, 1, v31);
        v24 = v29;
        v25 = v30;
        v31 = (_QWORD *)result;
      }
      v26 = v31;
      v31[2] = v25;
      v27 = &v26[2 * v24];
      v27[4] = v17;
      v27[5] = v19;
      if (v12)
        goto LABEL_4;
    }
    else if (v12)
    {
      goto LABEL_4;
    }
LABEL_7:
    v20 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v20 >= v33)
      goto LABEL_29;
    v21 = *(_QWORD *)(v32 + 8 * v20);
    ++v14;
    if (!v21)
    {
      v14 = v20 + 1;
      if (v20 + 1 >= v33)
        goto LABEL_29;
      v21 = *(_QWORD *)(v32 + 8 * v14);
      if (!v21)
      {
        v14 = v20 + 2;
        if (v20 + 2 >= v33)
          goto LABEL_29;
        v21 = *(_QWORD *)(v32 + 8 * v14);
        if (!v21)
        {
          v14 = v20 + 3;
          if (v20 + 3 >= v33)
            goto LABEL_29;
          v21 = *(_QWORD *)(v32 + 8 * v14);
          if (!v21)
            break;
        }
      }
    }
LABEL_22:
    v12 = (v21 - 1) & v21;
  }
  v22 = v20 + 4;
  if (v22 >= v33)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v31;
  }
  v21 = *(_QWORD *)(v32 + 8 * v22);
  if (v21)
  {
    v14 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    v14 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v14 >= v33)
      goto LABEL_29;
    v21 = *(_QWORD *)(v32 + 8 * v14);
    ++v22;
    if (v21)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t static IntelligenceSupportAgent.ExecutableCommands.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_24969CA70(*a1, *a2);
}

uint64_t IntelligenceSupportAgent.ExecutableCommands.description.getter()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;

  v1 = sub_2496BA924();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2496BAB10();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v40 = (char *)&v33 - v10;
  v11 = *v0;
  v47 = 0xD000000000000013;
  v48 = 0x80000002496C0960;
  v12 = swift_bridgeObjectRetain();
  result = sub_2496B5448(v12);
  v14 = 0;
  v15 = *(_QWORD *)(result + 56);
  v36 = v5;
  v37 = result + 56;
  v41 = result;
  v16 = 1 << *(_BYTE *)(result + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & v15;
  v38 = (unint64_t)(v16 + 63) >> 6;
  v39 = v11;
  v34 = v9;
  v35 = v6;
  while (1)
  {
    if (v18)
    {
      v43 = (v18 - 1) & v18;
      v44 = v14;
      v19 = __clz(__rbit64(v18)) | (v14 << 6);
      goto LABEL_22;
    }
    v20 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v20 >= v38)
      goto LABEL_31;
    v21 = *(_QWORD *)(v37 + 8 * v20);
    v22 = v14 + 1;
    if (!v21)
    {
      v22 = v14 + 2;
      if (v14 + 2 >= v38)
        goto LABEL_31;
      v21 = *(_QWORD *)(v37 + 8 * v22);
      if (!v21)
      {
        v22 = v14 + 3;
        if (v14 + 3 >= v38)
          goto LABEL_31;
        v21 = *(_QWORD *)(v37 + 8 * v22);
        if (!v21)
          break;
      }
    }
LABEL_21:
    v43 = (v21 - 1) & v21;
    v44 = v22;
    v19 = __clz(__rbit64(v21)) + (v22 << 6);
LABEL_22:
    v24 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v40, *(_QWORD *)(v41 + 48) + *(_QWORD *)(v6 + 72) * v19, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v24, v5);
    v45 = 10;
    v46 = 0xE100000000000000;
    sub_24968BDD4((unint64_t *)&unk_2544AFD10, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAC8]);
    sub_2496BB368();
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    sub_2496BAF48();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v11 + 16))
    {
      v25 = sub_2496B6910((uint64_t)v9);
      v26 = MEMORY[0x24BEE4AF8];
      if ((v27 & 1) != 0)
      {
        v26 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v25);
        swift_bridgeObjectRetain();
      }
      v28 = *(_QWORD *)(v26 + 16);
      if (!v28)
      {
LABEL_4:
        swift_bridgeObjectRelease();
        goto LABEL_5;
      }
    }
    else
    {
      v26 = MEMORY[0x24BEE4AF8];
      v28 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      if (!v28)
        goto LABEL_4;
    }
    v29 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
    v42 = v26;
    v30 = v26 + v29;
    v31 = *(_QWORD *)(v2 + 72);
    v32 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    do
    {
      v32(v4, v30, v1);
      v45 = 545005578;
      v46 = 0xE400000000000000;
      sub_24968BDD4(&qword_257876CF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB770], MEMORY[0x24BEBB7A0]);
      sub_2496BB368();
      sub_2496BAF48();
      swift_bridgeObjectRelease();
      sub_2496BAF48();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      v30 += v31;
      --v28;
    }
    while (v28);
    swift_bridgeObjectRelease();
    v6 = v35;
    v5 = v36;
    v9 = v34;
LABEL_5:
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    v11 = v39;
    v18 = v43;
    v14 = v44;
  }
  v23 = v14 + 4;
  if (v14 + 4 >= v38)
  {
LABEL_31:
    swift_release();
    sub_2496BAF48();
    return v47;
  }
  v21 = *(_QWORD *)(v37 + 8 * v23);
  if (v21)
  {
    v22 = v14 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    v22 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v22 >= v38)
      goto LABEL_31;
    v21 = *(_QWORD *)(v37 + 8 * v22);
    ++v23;
    if (v21)
      goto LABEL_21;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t IntelligenceSupportAgent.ExecutableCommands.availableProcesses.getter()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_2496B5448(v0);
}

uint64_t IntelligenceSupportAgent.ExecutableCommands.availableBundleIDs.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_2496B5448(v0);
  v2 = sub_2496B5970(v1);
  swift_bridgeObjectRelease();
  v3 = sub_2496BA278(v2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t IntelligenceSupportAgent.ExecutableCommands.commands(for:)(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (*(_QWORD *)(*(_QWORD *)v1 + 16) && (sub_2496B6910(a1), (v2 & 1) != 0))
    return swift_bridgeObjectRetain();
  else
    return MEMORY[0x24BEE4AF8];
}

uint64_t IntelligenceSupportAgent.ExecutableCommands.commands(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  _BYTE v19[16];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD20);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_2496BAB10();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v19[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = *v2;
  v13 = swift_bridgeObjectRetain();
  v14 = sub_2496B5448(v13);
  swift_bridgeObjectRetain();
  sub_2496B6290(v14, a1, a2, v7);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_2496BA30C((uint64_t)v7);
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
    (*(void (**)(_BYTE *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    if (*(_QWORD *)(v12 + 16) && (v16 = sub_2496B6910((uint64_t)v11), (v17 & 1) != 0))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v16);
      swift_bridgeObjectRetain();
    }
    else
    {
      v15 = MEMORY[0x24BEE4AF8];
    }
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v15;
}

uint64_t sub_2496B6290@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
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
  unint64_t v15;
  uint64_t result;
  int64_t v17;
  char v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v29 = a4;
  v32 = a3;
  v34 = a2;
  v5 = sub_2496BAB10();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v29 - v10;
  v12 = *(_QWORD *)(a1 + 56);
  v30 = a1 + 56;
  v13 = 1 << *(_BYTE *)(a1 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v31 = (unint64_t)(v13 + 63) >> 6;
  v33 = a1;
  result = swift_bridgeObjectRetain();
  v17 = 0;
  while (v15)
  {
    v19 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    v20 = v19 | (v17 << 6);
LABEL_24:
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, *(_QWORD *)(v33 + 48) + *(_QWORD *)(v6 + 72) * v20, v5);
    v24 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v24(v9, v11, v5);
    v25 = sub_2496BAAEC();
    if (v26)
    {
      if (v25 == v34 && v26 == v32)
      {
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_30;
      }
      v18 = sub_2496BB380();
      swift_bridgeObjectRelease();
      if ((v18 & 1) != 0)
      {
        swift_release();
LABEL_30:
        v28 = v29;
        v24(v29, v9, v5);
        v27 = 0;
LABEL_31:
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v28, v27, 1, v5);
        return swift_bridgeObjectRelease();
      }
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  v21 = v17 + 1;
  if (__OFADD__(v17, 1))
  {
    __break(1u);
    goto LABEL_33;
  }
  if (v21 >= v31)
    goto LABEL_28;
  v22 = *(_QWORD *)(v30 + 8 * v21);
  ++v17;
  if (v22)
    goto LABEL_23;
  v17 = v21 + 1;
  if (v21 + 1 >= v31)
    goto LABEL_28;
  v22 = *(_QWORD *)(v30 + 8 * v17);
  if (v22)
    goto LABEL_23;
  v17 = v21 + 2;
  if (v21 + 2 >= v31)
    goto LABEL_28;
  v22 = *(_QWORD *)(v30 + 8 * v17);
  if (v22)
    goto LABEL_23;
  v17 = v21 + 3;
  if (v21 + 3 >= v31)
    goto LABEL_28;
  v22 = *(_QWORD *)(v30 + 8 * v17);
  if (v22)
  {
LABEL_23:
    v15 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v17 << 6);
    goto LABEL_24;
  }
  v23 = v21 + 4;
  if (v23 >= v31)
  {
LABEL_28:
    swift_release();
    v27 = 1;
    v28 = v29;
    goto LABEL_31;
  }
  v22 = *(_QWORD *)(v30 + 8 * v23);
  if (v22)
  {
    v17 = v23;
    goto LABEL_23;
  }
  while (1)
  {
    v17 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v17 >= v31)
      goto LABEL_28;
    v22 = *(_QWORD *)(v30 + 8 * v17);
    ++v23;
    if (v22)
      goto LABEL_23;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_2496B656C()
{
  return 1;
}

uint64_t sub_2496B6574()
{
  sub_2496BB3B0();
  sub_2496BB3BC();
  return sub_2496BB3C8();
}

uint64_t sub_2496B65B4()
{
  return sub_2496BB3BC();
}

uint64_t sub_2496B65D8()
{
  sub_2496BB3B0();
  sub_2496BB3BC();
  return sub_2496BB3C8();
}

unint64_t sub_2496B6614()
{
  return 0xD000000000000016;
}

uint64_t sub_2496B6630@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2496BA73C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2496B6658()
{
  sub_2496BA34C();
  return sub_2496BB3EC();
}

uint64_t sub_2496B6680()
{
  sub_2496BA34C();
  return sub_2496BB3F8();
}

uint64_t IntelligenceSupportAgent.ExecutableCommands.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876CF8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2496BA34C();
  sub_2496BB3E0();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876D08);
  sub_2496BA390();
  sub_2496BB344();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t IntelligenceSupportAgent.ExecutableCommands.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257876D30);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2496BA34C();
  sub_2496BB3D4();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257876D08);
    sub_2496BA434();
    sub_2496BB2F0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_2496B68D8(uint64_t *a1, uint64_t *a2)
{
  return sub_24969CA70(*a1, *a2);
}

uint64_t sub_2496B68E4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return IntelligenceSupportAgent.ExecutableCommands.init(from:)(a1, a2);
}

uint64_t sub_2496B68F8(_QWORD *a1)
{
  return IntelligenceSupportAgent.ExecutableCommands.encode(to:)(a1);
}

unint64_t sub_2496B6910(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_2496BAB10();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98];
  sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
  v3 = sub_2496BAEAC();
  return sub_2496B6CF4(a1, v3, v2, (unint64_t *)&unk_2544AFD00, MEMORY[0x24BEBBAB8]);
}

unint64_t sub_2496B69A8(_QWORD *a1)
{
  uint64_t v2;

  sub_2496BB3B0();
  sub_2496BB3BC();
  type metadata accessor for ConnectionID();
  sub_2496BAB10();
  sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
  sub_2496BAEB8();
  v2 = sub_2496BB3C8();
  return sub_2496B6BDC(a1, v2);
}

unint64_t sub_2496B6A48(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_2496BACF0();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEBBCE0];
  sub_24968BDD4(&qword_2544AFD78, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBCE0], MEMORY[0x24BEBBCF0]);
  v3 = sub_2496BAEAC();
  return sub_2496B6CF4(a1, v3, v2, &qword_2544AFD80, MEMORY[0x24BEBBCF8]);
}

unint64_t sub_2496B6AE0(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_2496BAA8C();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20];
  sub_24968BDD4(&qword_2544AFCC0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20], MEMORY[0x24BEBBA30]);
  v3 = sub_2496BAEAC();
  return sub_2496B6CF4(a1, v3, v2, &qword_257876AC0, MEMORY[0x24BEBBA38]);
}

unint64_t sub_2496B6B78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2496BB3B0();
  sub_2496BAF30();
  v4 = sub_2496BB3C8();
  return sub_2496B6E24(a1, a2, v4);
}

unint64_t sub_2496B6BDC(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  type metadata accessor for ConnectionID();
  MEMORY[0x24BDAC7A8]();
  v7 = (uint64_t *)((char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = -1 << *(_BYTE *)(v2 + 32);
  v9 = a2 & ~v8;
  if (((*(_QWORD *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    v10 = ~v8;
    v11 = *(_QWORD *)(v5 + 72);
    while (1)
    {
      sub_2496BA7C0(*(_QWORD *)(v2 + 48) + v11 * v9, (uint64_t)v7);
      if (*v7 == *a1 && (sub_2496BAAF8() & 1) != 0)
        break;
      sub_2496BA804((uint64_t)v7);
      v9 = (v9 + 1) & v10;
      if (((*(_QWORD *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        return v9;
    }
    sub_2496BA804((uint64_t)v7);
  }
  return v9;
}

unint64_t sub_2496B6CF4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, unint64_t, uint64_t);
  char v17;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  unint64_t *v21;
  uint64_t v22;

  v21 = a4;
  v22 = a5;
  v6 = v5;
  v19 = a1;
  v20 = a3;
  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - v10;
  v12 = -1 << *(_BYTE *)(v6 + 32);
  v13 = a2 & ~v12;
  if (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v9 + 72);
    v16 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    do
    {
      v16(v11, *(_QWORD *)(v6 + 48) + v15 * v13, v8);
      sub_24968BDD4(v21, v20, v22);
      v17 = sub_2496BAED0();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if ((v17 & 1) != 0)
        break;
      v13 = (v13 + 1) & v14;
    }
    while (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

unint64_t sub_2496B6E24(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2496BB380() & 1) == 0)
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
      while (!v14 && (sub_2496BB380() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2496B6F04(uint64_t a1, char *a2)
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
  v6 = sub_2496BAB10();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_24968BDD4((unint64_t *)&unk_2544AFCF0, v11, MEMORY[0x24BEBBAB0]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_2496BAEAC();
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
      sub_24968BDD4((unint64_t *)&unk_2544AFD00, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB8]);
      v21 = sub_2496BAED0();
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
    sub_2496B86A0((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_2496B7160(uint64_t a1, char *a2)
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
  v6 = sub_2496BAA8C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_24968BDD4(&qword_2544AFCC0, v11, MEMORY[0x24BEBBA30]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_2496BAEAC();
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
      sub_24968BDD4(&qword_257876AC0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20], MEMORY[0x24BEBBA38]);
      v21 = sub_2496BAED0();
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
    sub_2496B88F4((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_2496B73BC(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_2496BB1AC();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_2496BA840();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_2496BB1A0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_2496B77E4(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_2496B80A8();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_2496B8620((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_2496BB0F8();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_2496BA840();
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_2496BB104();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_2496BB104();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_2496B8B48((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_2496B7638(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_2496BB3B0();
  swift_bridgeObjectRetain();
  sub_2496BAF30();
  v8 = sub_2496BB3C8();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2496BB380() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_2496BB380() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2496B8CBC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2496B77E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257876D80);
    v2 = sub_2496BB1DC();
    v14 = v2;
    sub_2496BB194();
    if (sub_2496BB1B8())
    {
      sub_2496BA840();
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_2496B80A8();
          v2 = v14;
        }
        result = sub_2496BB0F8();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_2496BB1B8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_2496B79C8()
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
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  int64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;

  v1 = v0;
  v2 = type metadata accessor for ConnectionID();
  v33 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF38);
  v6 = sub_2496BB1D0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v32 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v30 = v0;
    v31 = (unint64_t)(v8 + 63) >> 6;
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
        if (v18 >= v31)
          goto LABEL_33;
        v19 = v32[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v31)
            goto LABEL_33;
          v19 = v32[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v31)
              goto LABEL_33;
            v19 = v32[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v31)
              {
LABEL_33:
                swift_release();
                v1 = v30;
                v29 = 1 << *(_BYTE *)(v5 + 32);
                if (v29 > 63)
                  bzero(v32, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v32 = -1 << v29;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v32[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v31)
                    goto LABEL_33;
                  v19 = v32[v14];
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
      v21 = *(_QWORD *)(v33 + 72);
      sub_249698440(*(_QWORD *)(v5 + 48) + v21 * v17, (uint64_t)v4);
      sub_2496BB3B0();
      sub_2496BB3BC();
      sub_2496BAB10();
      sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
      sub_2496BAEB8();
      result = sub_2496BB3C8();
      v22 = -1 << *(_BYTE *)(v7 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = sub_249698440((uint64_t)v4, *(_QWORD *)(v7 + 48) + v15 * v21);
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_2496B7D48(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v7;
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
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, unint64_t, uint64_t);
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  unint64_t *v45;
  uint64_t v46;

  v45 = a4;
  v46 = a5;
  v7 = v5;
  v44 = a2;
  v8 = a2(0);
  v43 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v39 - v9;
  v11 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v12 = sub_2496BB1D0();
  v13 = v12;
  if (*(_QWORD *)(v11 + 16))
  {
    v14 = 1 << *(_BYTE *)(v11 + 32);
    v15 = *(_QWORD *)(v11 + 56);
    v42 = (_QWORD *)(v11 + 56);
    if (v14 < 64)
      v16 = ~(-1 << v14);
    else
      v16 = -1;
    v17 = v16 & v15;
    v40 = v5;
    v41 = (unint64_t)(v14 + 63) >> 6;
    v18 = v12 + 56;
    result = swift_retain();
    v20 = 0;
    while (1)
    {
      if (v17)
      {
        v22 = __clz(__rbit64(v17));
        v17 &= v17 - 1;
        v23 = v22 | (v20 << 6);
      }
      else
      {
        v24 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v24 >= v41)
          goto LABEL_33;
        v25 = v42[v24];
        ++v20;
        if (!v25)
        {
          v20 = v24 + 1;
          if (v24 + 1 >= v41)
            goto LABEL_33;
          v25 = v42[v20];
          if (!v25)
          {
            v20 = v24 + 2;
            if (v24 + 2 >= v41)
              goto LABEL_33;
            v25 = v42[v20];
            if (!v25)
            {
              v26 = v24 + 3;
              if (v26 >= v41)
              {
LABEL_33:
                swift_release();
                v7 = v40;
                v38 = 1 << *(_BYTE *)(v11 + 32);
                if (v38 > 63)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v11 + 16) = 0;
                break;
              }
              v25 = v42[v26];
              if (!v25)
              {
                while (1)
                {
                  v20 = v26 + 1;
                  if (__OFADD__(v26, 1))
                    goto LABEL_39;
                  if (v20 >= v41)
                    goto LABEL_33;
                  v25 = v42[v20];
                  ++v26;
                  if (v25)
                    goto LABEL_23;
                }
              }
              v20 = v26;
            }
          }
        }
LABEL_23:
        v17 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v20 << 6);
      }
      v27 = v11;
      v28 = *(_QWORD *)(v11 + 48);
      v29 = *(_QWORD *)(v43 + 72);
      v30 = *(void (**)(char *, unint64_t, uint64_t))(v43 + 32);
      v30(v10, v28 + v29 * v23, v8);
      sub_24968BDD4(v45, v44, v46);
      result = sub_2496BAEAC();
      v31 = -1 << *(_BYTE *)(v13 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v18 + 8 * (v32 >> 6))) != 0)
      {
        v21 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v18 + 8 * v33);
        }
        while (v37 == -1);
        v21 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v30)(*(_QWORD *)(v13 + 48) + v21 * v29, v10, v8);
      ++*(_QWORD *)(v13 + 16);
      v11 = v27;
    }
  }
  result = swift_release();
  *v7 = v13;
  return result;
}

uint64_t sub_2496B80A8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257876D80);
  v3 = sub_2496BB1D0();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_2496BB0F8();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2496B8344()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876D68);
  v3 = sub_2496BB1D0();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_2496BB3B0();
      sub_2496BAF30();
      result = sub_2496BB3C8();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_2496B8620(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_2496BB0F8();
  result = sub_2496BB188();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_2496B86A0(uint64_t a1, unint64_t a2, char a3)
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
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_2496BAB10();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_2496B7D48(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], &qword_257876D70, (unint64_t *)&unk_2544AFCF0, MEMORY[0x24BEBBAB0]);
  }
  else
  {
    if (v11 > v10)
    {
      sub_2496B904C((uint64_t (*)(_QWORD))MEMORY[0x24BEBBA98], &qword_257876D70);
      goto LABEL_12;
    }
    sub_2496B9910(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], &qword_257876D70, (unint64_t *)&unk_2544AFCF0, MEMORY[0x24BEBBAB0]);
  }
  v13 = *v3;
  sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
  v14 = sub_2496BAEAC();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v9, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_24968BDD4((unint64_t *)&unk_2544AFD00, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB8]);
      v19 = sub_2496BAED0();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_2496BB38C();
  __break(1u);
  return result;
}

uint64_t sub_2496B88F4(uint64_t a1, unint64_t a2, char a3)
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
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_2496BAA8C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_2496B7D48(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20], &qword_257876D78, &qword_2544AFCC0, MEMORY[0x24BEBBA30]);
  }
  else
  {
    if (v11 > v10)
    {
      sub_2496B904C((uint64_t (*)(_QWORD))MEMORY[0x24BEBBA20], &qword_257876D78);
      goto LABEL_12;
    }
    sub_2496B9910(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20], &qword_257876D78, &qword_2544AFCC0, MEMORY[0x24BEBBA30]);
  }
  v13 = *v3;
  sub_24968BDD4(&qword_2544AFCC0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20], MEMORY[0x24BEBBA30]);
  v14 = sub_2496BAEAC();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v9, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_24968BDD4(&qword_257876AC0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA20], MEMORY[0x24BEBBA38]);
      v19 = sub_2496BAED0();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_2496BB38C();
  __break(1u);
  return result;
}

void sub_2496B8B48(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_2496B80A8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_2496B9270();
      goto LABEL_14;
    }
    sub_2496B9C2C();
  }
  v8 = *v3;
  v9 = sub_2496BB0F8();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_2496BA840();
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_2496BB104();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_2496BB38C();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_2496BB104();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

uint64_t sub_2496B8CBC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_2496B8344();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2496B9418();
      goto LABEL_22;
    }
    sub_2496B9EA4();
  }
  v11 = *v4;
  sub_2496BB3B0();
  sub_2496BAF30();
  result = sub_2496BB3C8();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_2496BB380(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_2496BB38C();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_2496BB380();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_2496B8E54()
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

  v1 = v0;
  v2 = type metadata accessor for ConnectionID();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF38);
  v6 = *v0;
  v7 = sub_2496BB1C4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v8;
    return result;
  }
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
      goto LABEL_30;
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
    sub_2496BA7C0(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5);
    result = (void *)sub_249698440((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2496B904C(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  uint64_t v13;
  unint64_t v14;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v4 = v2;
  v5 = a1(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - v7;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v9 = *v2;
  v10 = sub_2496BB1C4();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v4 = v11;
    return result;
  }
  v28 = v4;
  result = (void *)(v10 + 56);
  v13 = v9 + 56;
  v14 = (unint64_t)((1 << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 56 + 8 * v14)
    result = memmove(result, (const void *)(v9 + 56), 8 * v14);
  v16 = 0;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v9 + 16);
  v17 = 1 << *(_BYTE *)(v9 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & *(_QWORD *)(v9 + 56);
  v20 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      v22 = v21 | (v16 << 6);
      goto LABEL_12;
    }
    v24 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v24 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v24);
    ++v16;
    if (!v25)
    {
      v16 = v24 + 1;
      if (v24 + 1 >= v20)
        goto LABEL_28;
      v25 = *(_QWORD *)(v13 + 8 * v16);
      if (!v25)
      {
        v16 = v24 + 2;
        if (v24 + 2 >= v20)
          goto LABEL_28;
        v25 = *(_QWORD *)(v13 + 8 * v16);
        if (!v25)
          break;
      }
    }
LABEL_27:
    v19 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v16 << 6);
LABEL_12:
    v23 = *(_QWORD *)(v6 + 72) * v22;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(_QWORD *)(v9 + 48) + v23, v5);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v23, v8, v5);
  }
  v26 = v24 + 3;
  if (v26 >= v20)
  {
LABEL_28:
    result = (void *)swift_release();
    v4 = v28;
    goto LABEL_30;
  }
  v25 = *(_QWORD *)(v13 + 8 * v26);
  if (v25)
  {
    v16 = v26;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v16 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v16);
    ++v26;
    if (v25)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

id sub_2496B9270()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257876D80);
  v2 = *v0;
  v3 = sub_2496BB1C4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2496B9418()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876D68);
  v2 = *v0;
  v3 = sub_2496BB1C4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2496B95C8()
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
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = v0;
  v2 = type metadata accessor for ConnectionID();
  v32 = *(_QWORD *)(v2 - 8);
  v33 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFF38);
  v6 = sub_2496BB1D0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v7;
    return result;
  }
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v9 = *(_QWORD *)(v5 + 56);
  v29 = v0;
  v30 = v5 + 56;
  if (v8 < 64)
    v10 = ~(-1 << v8);
  else
    v10 = -1;
  v11 = v10 & v9;
  v31 = (unint64_t)(v8 + 63) >> 6;
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
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v31)
      goto LABEL_33;
    v19 = *(_QWORD *)(v30 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v31)
        goto LABEL_33;
      v19 = *(_QWORD *)(v30 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v31)
          goto LABEL_33;
        v19 = *(_QWORD *)(v30 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v11 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(_QWORD *)(v32 + 72);
    sub_2496BA7C0(*(_QWORD *)(v5 + 48) + v21 * v17, (uint64_t)v4);
    sub_2496BB3B0();
    sub_2496BB3BC();
    sub_2496BAB10();
    sub_24968BDD4((unint64_t *)&unk_2544AFCF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAB0]);
    sub_2496BAEB8();
    result = sub_2496BB3C8();
    v22 = -1 << *(_BYTE *)(v7 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    result = sub_249698440((uint64_t)v4, *(_QWORD *)(v7 + 48) + v15 * v21);
    ++*(_QWORD *)(v7 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v31)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v29;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v30 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v31)
      goto LABEL_33;
    v19 = *(_QWORD *)(v30 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2496B9910(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v7;
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
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int64_t v38;
  uint64_t (*v39)(uint64_t);
  unint64_t *v40;
  uint64_t v41;

  v40 = a4;
  v41 = a5;
  v7 = v5;
  v39 = a2;
  v8 = a2(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v36 - v10;
  v12 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v13 = sub_2496BB1D0();
  v14 = v13;
  if (!*(_QWORD *)(v12 + 16))
  {
    result = swift_release();
LABEL_35:
    *v7 = v14;
    return result;
  }
  v15 = 1 << *(_BYTE *)(v12 + 32);
  v16 = *(_QWORD *)(v12 + 56);
  v36 = v5;
  v37 = v12 + 56;
  if (v15 < 64)
    v17 = ~(-1 << v15);
  else
    v17 = -1;
  v18 = v17 & v16;
  v38 = (unint64_t)(v15 + 63) >> 6;
  v19 = v13 + 56;
  result = swift_retain();
  v21 = 0;
  while (1)
  {
    if (v18)
    {
      v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v24 = v23 | (v21 << 6);
      goto LABEL_24;
    }
    v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v25 >= v38)
      goto LABEL_33;
    v26 = *(_QWORD *)(v37 + 8 * v25);
    ++v21;
    if (!v26)
    {
      v21 = v25 + 1;
      if (v25 + 1 >= v38)
        goto LABEL_33;
      v26 = *(_QWORD *)(v37 + 8 * v21);
      if (!v26)
      {
        v21 = v25 + 2;
        if (v25 + 2 >= v38)
          goto LABEL_33;
        v26 = *(_QWORD *)(v37 + 8 * v21);
        if (!v26)
          break;
      }
    }
LABEL_23:
    v18 = (v26 - 1) & v26;
    v24 = __clz(__rbit64(v26)) + (v21 << 6);
LABEL_24:
    v28 = *(_QWORD *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v11, *(_QWORD *)(v12 + 48) + v28 * v24, v8);
    sub_24968BDD4(v40, v39, v41);
    result = sub_2496BAEAC();
    v29 = -1 << *(_BYTE *)(v14 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v19 + 8 * (v30 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v19 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v19 + 8 * v31);
      }
      while (v35 == -1);
      v22 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))(*(_QWORD *)(v14 + 48) + v22 * v28, v11, v8);
    ++*(_QWORD *)(v14 + 16);
  }
  v27 = v25 + 3;
  if (v27 >= v38)
  {
LABEL_33:
    result = swift_release_n();
    v7 = v36;
    goto LABEL_35;
  }
  v26 = *(_QWORD *)(v37 + 8 * v27);
  if (v26)
  {
    v21 = v27;
    goto LABEL_23;
  }
  while (1)
  {
    v21 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v21 >= v38)
      goto LABEL_33;
    v26 = *(_QWORD *)(v37 + 8 * v21);
    ++v27;
    if (v26)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2496B9C2C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257876D80);
  v3 = sub_2496BB1D0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_2496BB0F8();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2496B9EA4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257876D68);
  v3 = sub_2496BB1D0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_2496BB3B0();
    swift_bridgeObjectRetain();
    sub_2496BAF30();
    result = sub_2496BB3C8();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2496BA150(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v2 = sub_2496BAB10();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v15 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  sub_24968BDD4((unint64_t *)&unk_2544AFCF0, v10, MEMORY[0x24BEBBAB0]);
  result = sub_2496BAFFC();
  v16 = result;
  if (v9)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v13 = *(_QWORD *)(v3 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v14(v6, v12, v2);
      sub_2496B6F04((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v12 += v13;
      --v9;
    }
    while (v9);
    return v16;
  }
  return result;
}

uint64_t sub_2496BA278(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_2496BAFFC();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2496B7638(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_2496BA30C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544AFD20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2496BA34C()
{
  unint64_t result;

  result = qword_257876D00;
  if (!qword_257876D00)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BD268, &_s18ExecutableCommandsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876D00);
  }
  return result;
}

unint64_t sub_2496BA390()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257876D10;
  if (!qword_257876D10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257876D08);
    v2[0] = sub_24968BDD4(&qword_2578767D8, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAA8]);
    v2[1] = sub_2496BA4D8(&qword_257876D18, &qword_257876D28, MEMORY[0x24BEBB788], MEMORY[0x24BEE12A0]);
    result = MEMORY[0x24BCF5F5C](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257876D10);
  }
  return result;
}

unint64_t sub_2496BA434()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257876D38;
  if (!qword_257876D38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257876D08);
    v2[0] = sub_24968BDD4(&qword_2578767C8, (uint64_t (*)(uint64_t))MEMORY[0x24BEBBA98], MEMORY[0x24BEBBAC0]);
    v2[1] = sub_2496BA4D8(&qword_257876D40, &qword_257876D48, MEMORY[0x24BEBB798], MEMORY[0x24BEE12D0]);
    result = MEMORY[0x24BCF5F5C](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257876D38);
  }
  return result;
}

uint64_t sub_2496BA4D8(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257876D20);
    v10 = sub_24968BDD4(a2, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB770], a3);
    result = MEMORY[0x24BCF5F5C](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceSupportAgent.ExecutableCommands()
{
  return &type metadata for IntelligenceSupportAgent.ExecutableCommands;
}

uint64_t _s18ExecutableCommandsV10CodingKeysOwet(unsigned int *a1, int a2)
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

uint64_t _s18ExecutableCommandsV10CodingKeysOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2496BA600 + 4 * byte_2496BD0E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2496BA620 + 4 * byte_2496BD0E5[v4]))();
}

_BYTE *sub_2496BA600(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2496BA620(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2496BA628(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2496BA630(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2496BA638(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2496BA640(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2496BA64C()
{
  return 0;
}

ValueMetadata *_s18ExecutableCommandsV10CodingKeysOMa()
{
  return &_s18ExecutableCommandsV10CodingKeysON;
}

unint64_t sub_2496BA668()
{
  unint64_t result;

  result = qword_257876D50;
  if (!qword_257876D50)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BD240, &_s18ExecutableCommandsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876D50);
  }
  return result;
}

unint64_t sub_2496BA6B0()
{
  unint64_t result;

  result = qword_257876D58;
  if (!qword_257876D58)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BD1B0, &_s18ExecutableCommandsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876D58);
  }
  return result;
}

unint64_t sub_2496BA6F8()
{
  unint64_t result;

  result = qword_257876D60;
  if (!qword_257876D60)
  {
    result = MEMORY[0x24BCF5F5C](&unk_2496BD1D8, &_s18ExecutableCommandsV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_257876D60);
  }
  return result;
}

uint64_t sub_2496BA73C(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000016 && a2 == 0x80000002496C0980)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_2496BB380();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t sub_2496BA7C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConnectionID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2496BA804(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ConnectionID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2496BA840()
{
  unint64_t result;

  result = qword_2578768F8;
  if (!qword_2578768F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2578768F8);
  }
  return result;
}

uint64_t sub_2496BA87C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2496BA888()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2496BA894()
{
  return MEMORY[0x24BDBD740]();
}

uint64_t sub_2496BA8A0()
{
  return MEMORY[0x24BDBD748]();
}

uint64_t sub_2496BA8AC()
{
  return MEMORY[0x24BDBD750]();
}

uint64_t sub_2496BA8B8()
{
  return MEMORY[0x24BEBB658]();
}

uint64_t sub_2496BA8C4()
{
  return MEMORY[0x24BEBB660]();
}

uint64_t sub_2496BA8D0()
{
  return MEMORY[0x24BEBB668]();
}

uint64_t sub_2496BA8DC()
{
  return MEMORY[0x24BEBB680]();
}

uint64_t sub_2496BA8E8()
{
  return MEMORY[0x24BEBB690]();
}

uint64_t sub_2496BA8F4()
{
  return MEMORY[0x24BEBB6B0]();
}

uint64_t sub_2496BA900()
{
  return MEMORY[0x24BEBB6B8]();
}

uint64_t sub_2496BA90C()
{
  return MEMORY[0x24BEBB6C0]();
}

uint64_t sub_2496BA918()
{
  return MEMORY[0x24BEBB6D0]();
}

uint64_t sub_2496BA924()
{
  return MEMORY[0x24BEBB770]();
}

uint64_t sub_2496BA930()
{
  return MEMORY[0x24BEBB7B8]();
}

uint64_t sub_2496BA93C()
{
  return MEMORY[0x24BEBB7C0]();
}

uint64_t sub_2496BA948()
{
  return MEMORY[0x24BEBB7C8]();
}

uint64_t sub_2496BA954()
{
  return MEMORY[0x24BEBB7D8]();
}

uint64_t sub_2496BA960()
{
  return MEMORY[0x24BEBB7E0]();
}

uint64_t sub_2496BA96C()
{
  return MEMORY[0x24BEBB7E8]();
}

uint64_t sub_2496BA978()
{
  return MEMORY[0x24BEBB800]();
}

uint64_t sub_2496BA984()
{
  return MEMORY[0x24BEBB808]();
}

uint64_t sub_2496BA990()
{
  return MEMORY[0x24BEBB828]();
}

uint64_t sub_2496BA99C()
{
  return MEMORY[0x24BEBB830]();
}

uint64_t sub_2496BA9A8()
{
  return MEMORY[0x24BEBB848]();
}

uint64_t sub_2496BA9B4()
{
  return MEMORY[0x24BEBB8D8]();
}

uint64_t sub_2496BA9C0()
{
  return MEMORY[0x24BEBB8E0]();
}

uint64_t sub_2496BA9CC()
{
  return MEMORY[0x24BEBB8E8]();
}

uint64_t sub_2496BA9D8()
{
  return MEMORY[0x24BEBB8F0]();
}

uint64_t sub_2496BA9E4()
{
  return MEMORY[0x24BEBB8F8]();
}

uint64_t sub_2496BA9F0()
{
  return MEMORY[0x24BEBB910]();
}

uint64_t sub_2496BA9FC()
{
  return MEMORY[0x24BEBB918]();
}

uint64_t sub_2496BAA08()
{
  return MEMORY[0x24BEBB928]();
}

uint64_t sub_2496BAA14()
{
  return MEMORY[0x24BEBB988]();
}

uint64_t sub_2496BAA20()
{
  return MEMORY[0x24BEBB9A8]();
}

uint64_t sub_2496BAA2C()
{
  return MEMORY[0x24BEBB9B0]();
}

uint64_t sub_2496BAA38()
{
  return MEMORY[0x24BEBB9B8]();
}

uint64_t sub_2496BAA44()
{
  return MEMORY[0x24BEBB9F0]();
}

uint64_t sub_2496BAA50()
{
  return MEMORY[0x24BEBB9F8]();
}

uint64_t sub_2496BAA5C()
{
  return MEMORY[0x24BEBBA00]();
}

uint64_t sub_2496BAA68()
{
  return MEMORY[0x24BEBBA08]();
}

uint64_t sub_2496BAA74()
{
  return MEMORY[0x24BEBBA10]();
}

uint64_t sub_2496BAA80()
{
  return MEMORY[0x24BEBBA18]();
}

uint64_t sub_2496BAA8C()
{
  return MEMORY[0x24BEBBA20]();
}

uint64_t sub_2496BAA98()
{
  return MEMORY[0x24BEBBA40]();
}

uint64_t sub_2496BAAA4()
{
  return MEMORY[0x24BEBBA48]();
}

uint64_t sub_2496BAAB0()
{
  return MEMORY[0x24BEBBA50]();
}

uint64_t sub_2496BAABC()
{
  return MEMORY[0x24BEBBA58]();
}

uint64_t sub_2496BAAC8()
{
  return MEMORY[0x24BEBBA60]();
}

uint64_t sub_2496BAAD4()
{
  return MEMORY[0x24BEBBA68]();
}

uint64_t sub_2496BAAE0()
{
  return MEMORY[0x24BEBBA78]();
}

uint64_t sub_2496BAAEC()
{
  return MEMORY[0x24BEBBA80]();
}

uint64_t sub_2496BAAF8()
{
  return MEMORY[0x24BEBBA88]();
}

uint64_t sub_2496BAB04()
{
  return MEMORY[0x24BEBBA90]();
}

uint64_t sub_2496BAB10()
{
  return MEMORY[0x24BEBBA98]();
}

uint64_t sub_2496BAB1C()
{
  return MEMORY[0x24BEBBAD8]();
}

uint64_t sub_2496BAB28()
{
  return MEMORY[0x24BEBBAE0]();
}

uint64_t sub_2496BAB34()
{
  return MEMORY[0x24BEBBB08]();
}

uint64_t sub_2496BAB40()
{
  return MEMORY[0x24BEBBB10]();
}

uint64_t sub_2496BAB4C()
{
  return MEMORY[0x24BEBBB18]();
}

uint64_t sub_2496BAB58()
{
  return MEMORY[0x24BEBBB20]();
}

uint64_t sub_2496BAB64()
{
  return MEMORY[0x24BEBBB28]();
}

uint64_t sub_2496BAB70()
{
  return MEMORY[0x24BEBBB30]();
}

uint64_t sub_2496BAB7C()
{
  return MEMORY[0x24BEBBB38]();
}

uint64_t sub_2496BAB88()
{
  return MEMORY[0x24BEBBB40]();
}

uint64_t sub_2496BAB94()
{
  return MEMORY[0x24BEBBB48]();
}

uint64_t sub_2496BABA0()
{
  return MEMORY[0x24BEBBB50]();
}

uint64_t sub_2496BABAC()
{
  return MEMORY[0x24BEBBB58]();
}

uint64_t sub_2496BABB8()
{
  return MEMORY[0x24BEBBB60]();
}

uint64_t sub_2496BABC4()
{
  return MEMORY[0x24BEBBB68]();
}

uint64_t sub_2496BABD0()
{
  return MEMORY[0x24BEBBB88]();
}

uint64_t sub_2496BABDC()
{
  return MEMORY[0x24BEBBB98]();
}

uint64_t sub_2496BABE8()
{
  return MEMORY[0x24BEBBBC0]();
}

uint64_t sub_2496BABF4()
{
  return MEMORY[0x24BEBBBC8]();
}

uint64_t sub_2496BAC00()
{
  return MEMORY[0x24BEBBBD0]();
}

uint64_t sub_2496BAC0C()
{
  return MEMORY[0x24BEBBBD8]();
}

uint64_t sub_2496BAC18()
{
  return MEMORY[0x24BEBBBE0]();
}

uint64_t sub_2496BAC24()
{
  return MEMORY[0x24BEBBBE8]();
}

uint64_t sub_2496BAC30()
{
  return MEMORY[0x24BEBBBF0]();
}

uint64_t sub_2496BAC3C()
{
  return MEMORY[0x24BEBBBF8]();
}

uint64_t sub_2496BAC48()
{
  return MEMORY[0x24BEBBC00]();
}

uint64_t sub_2496BAC54()
{
  return MEMORY[0x24BEBBC08]();
}

uint64_t sub_2496BAC60()
{
  return MEMORY[0x24BEBBC10]();
}

uint64_t sub_2496BAC6C()
{
  return MEMORY[0x24BEBBC18]();
}

uint64_t sub_2496BAC78()
{
  return MEMORY[0x24BEBBC20]();
}

uint64_t sub_2496BAC84()
{
  return MEMORY[0x24BEBBC28]();
}

uint64_t sub_2496BAC90()
{
  return MEMORY[0x24BEBBC30]();
}

uint64_t sub_2496BAC9C()
{
  return MEMORY[0x24BEBBC38]();
}

uint64_t sub_2496BACA8()
{
  return MEMORY[0x24BEBBC58]();
}

uint64_t sub_2496BACB4()
{
  return MEMORY[0x24BEBBC60]();
}

uint64_t sub_2496BACC0()
{
  return MEMORY[0x24BEBBC68]();
}

uint64_t sub_2496BACCC()
{
  return MEMORY[0x24BEBBCC8]();
}

uint64_t sub_2496BACD8()
{
  return MEMORY[0x24BEBBCD0]();
}

uint64_t sub_2496BACE4()
{
  return MEMORY[0x24BEBBCD8]();
}

uint64_t sub_2496BACF0()
{
  return MEMORY[0x24BEBBCE0]();
}

uint64_t sub_2496BACFC()
{
  return MEMORY[0x24BEE7710]();
}

uint64_t sub_2496BAD08()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_2496BAD14()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_2496BAD20()
{
  return MEMORY[0x24BEE7780]();
}

uint64_t sub_2496BAD2C()
{
  return MEMORY[0x24BEBBD00]();
}

uint64_t sub_2496BAD38()
{
  return MEMORY[0x24BEBBD08]();
}

uint64_t sub_2496BAD44()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_2496BAD50()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_2496BAD5C()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_2496BAD68()
{
  return MEMORY[0x24BEE7840]();
}

uint64_t sub_2496BAD74()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_2496BAD80()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_2496BAD8C()
{
  return MEMORY[0x24BEBBD10]();
}

uint64_t sub_2496BAD98()
{
  return MEMORY[0x24BEBBD18]();
}

uint64_t sub_2496BADA4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2496BADB0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2496BADBC()
{
  return MEMORY[0x24BEE64B0]();
}

uint64_t sub_2496BADC8()
{
  return MEMORY[0x24BEE6508]();
}

uint64_t sub_2496BADD4()
{
  return MEMORY[0x24BEE6520]();
}

uint64_t sub_2496BADE0()
{
  return MEMORY[0x24BEE6530]();
}

uint64_t sub_2496BADEC()
{
  return MEMORY[0x24BEE6570]();
}

uint64_t sub_2496BADF8()
{
  return MEMORY[0x24BEE6578]();
}

uint64_t sub_2496BAE04()
{
  return MEMORY[0x24BEE65A8]();
}

uint64_t sub_2496BAE10()
{
  return MEMORY[0x24BEE6728]();
}

uint64_t sub_2496BAE1C()
{
  return MEMORY[0x24BEE6750]();
}

uint64_t sub_2496BAE28()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_2496BAE34()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_2496BAE40()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2496BAE4C()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2496BAE58()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2496BAE64()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_2496BAE70()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2496BAE7C()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2496BAE88()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2496BAE94()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_2496BAEA0()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2496BAEAC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2496BAEB8()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2496BAEC4()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2496BAED0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2496BAEDC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2496BAEE8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2496BAEF4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2496BAF00()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2496BAF0C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2496BAF18()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2496BAF24()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2496BAF30()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2496BAF3C()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_2496BAF48()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2496BAF54()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2496BAF60()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_2496BAF6C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2496BAF78()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_2496BAF84()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_2496BAF90()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2496BAF9C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2496BAFA8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2496BAFB4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2496BAFC0()
{
  return MEMORY[0x24BEBBD20]();
}

uint64_t sub_2496BAFCC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2496BAFD8()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2496BAFE4()
{
  return MEMORY[0x24BEE1460]();
}

uint64_t sub_2496BAFF0()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_2496BAFFC()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2496BB008()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2496BB014()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2496BB020()
{
  return MEMORY[0x24BDBD808]();
}

uint64_t sub_2496BB02C()
{
  return MEMORY[0x24BEE5650]();
}

uint64_t sub_2496BB038()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_2496BB044()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2496BB050()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2496BB05C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2496BB068()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2496BB074()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2496BB080()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_2496BB08C()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t sub_2496BB098()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t sub_2496BB0A4()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_2496BB0B0()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_2496BB0BC()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_2496BB0C8()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_2496BB0D4()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_2496BB0E0()
{
  return MEMORY[0x24BEE5958]();
}

uint64_t sub_2496BB0EC()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_2496BB0F8()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2496BB104()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2496BB110()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_2496BB11C()
{
  return MEMORY[0x24BDD0480]();
}

uint64_t sub_2496BB128()
{
  return MEMORY[0x24BEE1D50]();
}

uint64_t sub_2496BB134()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2496BB140()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2496BB14C()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_2496BB158()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_2496BB164()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_2496BB170()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2496BB17C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2496BB188()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_2496BB194()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2496BB1A0()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2496BB1AC()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_2496BB1B8()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2496BB1C4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2496BB1D0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2496BB1DC()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_2496BB1E8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2496BB1F4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2496BB200()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2496BB20C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2496BB218()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2496BB224()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2496BB230()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2496BB23C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2496BB248()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2496BB254()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2496BB260()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2496BB26C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2496BB278()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2496BB284()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2496BB290()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2496BB29C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2496BB2A8()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2496BB2B4()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2496BB2C0()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2496BB2CC()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2496BB2D8()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_2496BB2E4()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2496BB2F0()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2496BB2FC()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2496BB308()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2496BB314()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2496BB320()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2496BB32C()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_2496BB338()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2496BB344()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2496BB350()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_2496BB35C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2496BB368()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2496BB374()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_2496BB380()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2496BB38C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2496BB398()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2496BB3A4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2496BB3B0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2496BB3BC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2496BB3C8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2496BB3D4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2496BB3E0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2496BB3EC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2496BB3F8()
{
  return MEMORY[0x24BEE4A10]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGRegionCreateDifferenceWithRegion()
{
  return MEMORY[0x24BDBF098]();
}

uint64_t CGRegionCreateEmptyRegion()
{
  return MEMORY[0x24BDBF0A0]();
}

uint64_t CGRegionCreateIntersectionWithRegion()
{
  return MEMORY[0x24BDBF0A8]();
}

uint64_t CGRegionCreateUnionWithRegion()
{
  return MEMORY[0x24BDBF0B0]();
}

uint64_t CGRegionCreateWithRect()
{
  return MEMORY[0x24BDBF0B8]();
}

uint64_t CGRegionIsEmpty()
{
  return MEMORY[0x24BDBF0C0]();
}

uint64_t SBSCreateLayoutServiceEndpointForExternalDisplay()
{
  return MEMORY[0x24BEB0BF0]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x24BDE8D38](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA900](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
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

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

uint64_t xpc_connection_set_non_launching()
{
  return MEMORY[0x24BDB07D8]();
}

