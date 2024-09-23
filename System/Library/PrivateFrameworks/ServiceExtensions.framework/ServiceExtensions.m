uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t _LockdownVersion.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_245DC4EB0();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_245DB11DC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t GPUServiceExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_245DC4A90();
}

uint64_t ContentServiceExtension._lockdown(version:)()
{
  sub_245DC4E38();
  swift_bridgeObjectRelease();
  sandbox_enable_local_state_flag();
  return sandbox_enable_local_state_flag();
}

uint64_t type metadata accessor for _SEServiceManager()
{
  return objc_opt_self();
}

void destroy for _Capability.Grant(id *a1)
{

}

uint64_t ContentServiceExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_245DC4A90();
}

id sub_245DB1530()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for _SEServiceManager()), sel_init);
  qword_25751C780 = (uint64_t)result;
  return result;
}

uint64_t objectdestroyTm(void (*a1)(_QWORD))
{
  uint64_t v1;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);

  v3 = (int *)type metadata accessor for BackgroundTransferManager.Download(0);
  v4 = *(unsigned __int8 *)(*((_QWORD *)v3 - 1) + 80);
  v5 = (v4 + 24) & ~v4;
  a1(*(_QWORD *)(v1 + 16));
  v6 = v1 + v5;
  v7 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v1 + v5, v7);
  swift_bridgeObjectRelease();
  v8 = v1 + v5 + v3[6];
  v9 = sub_245DC4BD4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  v10 = v6 + v3[8];
  v11 = sub_245DC4A60();
  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v12(v10, v11);
  swift_bridgeObjectRelease();
  v12(v6 + v3[10], v11);

  return swift_deallocObject();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_245DC4B38();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t NetworkingServiceExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_245DC4A90();
}

uint64_t sub_245DB17B4()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for _ServiceManager();
  v0 = swift_allocObject();
  result = swift_defaultActor_initialize();
  qword_25751C398 = v0;
  return result;
}

uint64_t sub_245DB1954(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_245DB1980()
{
  _QWORD *v0;

  sub_245DB1988(v0);
}

void sub_245DB1988(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  os_unfair_lock_s *v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = sub_245DC4B38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (os_unfair_lock_s *)(a1[4] + 16);
  os_unfair_lock_lock(v6);
  v7 = (void (*)(uint64_t))a1[2];
  if (v7)
  {
    v8 = swift_retain();
    v7(v8);
    sub_245DC4B20();
    sub_245DB4668((uint64_t)v7);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v9 = a1[2];
    a1[2] = 0;
    a1[3] = 0;
    sub_245DB4668(v9);
  }
  os_unfair_lock_unlock(v6);
}

_QWORD *initializeBufferWithCopyOfBuffer for _Capability.Grant(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  v6 = v4;
  return a1;
}

uint64_t sub_245DB1AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result;
  unint64_t v5;

  result = a4(319);
  if (v5 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_245DB1B34()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245DC4B38();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_245DB1BA8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v9;
  void *v10;

  swift_bridgeObjectRetain();
  sub_245DC4B44();
  if (sub_245DC4B50() == 0xD000000000000020 && v1 == 0x8000000245DC6750)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    v4 = *(_QWORD *)(v0 + 176);
    v3 = *(_QWORD *)(v0 + 184);
    v5 = *(_QWORD *)(v0 + 160);
    v6 = *(_QWORD *)(v0 + 168);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 16))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
    swift_retain();
    sub_245DC4AC0();
    sub_245DC4AD8();
    sub_245DC4AFC();
    sub_245DC4ACC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v3, v5);
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v7;
    *v7 = v0;
    v7[1] = sub_245DB5628;
    return sub_245DC4AF0();
  }
  v2 = sub_245DC4EE0();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
    goto LABEL_5;
  v9 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v10 = (void *)sub_245DC4CAC();
  objc_msgSend(v9, sel_initWithDomain_code_userInfo_, v10, 1, 0);

  swift_willThrow();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
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

uint64_t sub_245DB1E18(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_245DB1E54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void (*v12)(uint64_t, uint64_t);
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

  v23 = *(_QWORD *)(v0 + 216);
  v21 = *(_QWORD *)(v0 + 200);
  v22 = *(_QWORD *)(v0 + 192);
  v20 = *(_QWORD *)(v0 + 184);
  v18 = *(_QWORD *)(v0 + 168);
  v19 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD **)(v0 + 80);
  v15 = *(_QWORD *)(v0 + 88);
  v16 = *(_QWORD *)(v0 + 144);
  v7 = *(_QWORD *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 64);
  v17 = *(_QWORD *)(v0 + 16);
  v8 = *(void (**)(uint64_t))(v3 + 16);
  v8(v2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v4, v2, v5);
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v1, v2, v5);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v10 + v9, v1, v5);
  *v6 = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v6, *MEMORY[0x24BEE5420], v14);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  v11 = sub_245DB40A8((uint64_t)sub_245DB5204, v10, (uint64_t)v6);
  swift_release();
  v12 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v12(v2, v5);
  *(_QWORD *)(v4 + *(int *)(v15 + 20)) = v11;
  sub_245DB43E8(v4, v17, type metadata accessor for _GPUProcess);
  v12(v16, v5);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
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

uint64_t _ServiceManager.gpuProcess(serviceIdentifier:onInteruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  v7 = sub_245DC4C28();
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = type metadata accessor for _GPUProcess(0);
  v6[12] = swift_task_alloc();
  v8 = sub_245DC4B38();
  v6[13] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v6[14] = v9;
  v6[15] = *(_QWORD *)(v9 + 64);
  v6[16] = swift_task_alloc();
  v6[17] = swift_task_alloc();
  v6[18] = swift_task_alloc();
  sub_245DC4B08();
  v6[19] = swift_task_alloc();
  v10 = sub_245DC4AE4();
  v6[20] = v10;
  v6[21] = *(_QWORD *)(v10 - 8);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  v11 = sub_245DC4B5C();
  v6[24] = v11;
  v6[25] = *(_QWORD *)(v11 - 8);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t type metadata accessor for _SEServiceConfiguration()
{
  return objc_opt_self();
}

uint64_t sub_245DB2500@<X0>(__int128 *a1@<X0>, _QWORD *a2@<X8>)
{
  char v2;
  __int128 v3;
  __int128 v4;
  _QWORD v6[5];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;

  v2 = *((_BYTE *)a1 + 80);
  v3 = a1[1];
  v7 = *a1;
  v8 = v3;
  v4 = a1[3];
  v9 = a1[2];
  v10 = v4;
  v11 = a1[4];
  v12 = v2;
  v6[3] = &type metadata for Process;
  v6[4] = &off_2516FB8B0;
  sub_245DBD964(v6, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

uint64_t sub_245DB25C0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v9;
  void *v10;

  swift_bridgeObjectRetain();
  sub_245DC4B44();
  if (sub_245DC4B50() == 0xD000000000000027 && v1 == 0x8000000245DC6720)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    v4 = *(_QWORD *)(v0 + 176);
    v3 = *(_QWORD *)(v0 + 184);
    v5 = *(_QWORD *)(v0 + 160);
    v6 = *(_QWORD *)(v0 + 168);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 16))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
    swift_retain();
    sub_245DC4AC0();
    sub_245DC4AD8();
    sub_245DC4AFC();
    sub_245DC4ACC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v3, v5);
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v7;
    *v7 = v0;
    v7[1] = sub_245DB55C4;
    return sub_245DC4AF0();
  }
  v2 = sub_245DC4EE0();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
    goto LABEL_5;
  v9 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v10 = (void *)sub_245DC4CAC();
  objc_msgSend(v9, sel_initWithDomain_code_userInfo_, v10, 1, 0);

  swift_willThrow();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
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

Swift::Void __swiftcall _ContentProcess.invalidate()()
{
  uint64_t v0;
  _QWORD *v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + *(int *)(type metadata accessor for _ContentProcess(0) + 20));
  v2 = (os_unfair_lock_s *)(v1[4] + 16);
  os_unfair_lock_lock(v2);
  v3 = v1[2];
  if (v3)
  {
    v1[2] = 0;
    v1[3] = 0;
    sub_245DB4668(v3);
  }
  os_unfair_lock_unlock(v2);
  _s17ServiceExtensions11_GPUProcessV10invalidateyyF_0();
}

id _s17ServiceExtensions13_SECapabilityC9assertion7websiteACSS_tFZ_0(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  os_unfair_lock_s *v6;
  id result;
  uint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  objc_class *v11;
  char *v12;
  char *v13;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v5 = objc_msgSend(v4, sel_bundleIdentifier);

  if (v5)
  {
    sub_245DC4CB8();

  }
  getpid();
  if (qword_25751C210 != -1)
    swift_once();
  v6 = (os_unfair_lock_s *)(qword_25751C4D0 + 16);
  swift_retain();
  os_unfair_lock_lock(v6);
  result = (id)swift_release();
  if (__OFADD__(qword_25751C4D8, 1))
  {
    __break(1u);
  }
  else
  {
    ++qword_25751C4D8;
    v16 = sub_245DC4EBC();
    v17 = v8;
    sub_245DC4CD0();
    v15 = qword_25751C4D8;
    sub_245DC4EBC();
    sub_245DC4CD0();
    swift_bridgeObjectRelease();
    sub_245DC4CD0();
    sub_245DC4CD0();
    swift_bridgeObjectRelease();
    v9 = v17;
    v10 = (os_unfair_lock_s *)qword_25751C4D0;
    swift_retain();
    os_unfair_lock_unlock(v10 + 4);
    swift_release();
    v11 = (objc_class *)type metadata accessor for _SECapability();
    v12 = (char *)objc_allocWithZone(v11);
    v13 = &v12[OBJC_IVAR____SECapability_inner];
    *(_QWORD *)v13 = v16;
    *((_QWORD *)v13 + 1) = v9;
    *((_QWORD *)v13 + 2) = a1;
    *((_QWORD *)v13 + 3) = a2;
    *((_OWORD *)v13 + 2) = 0u;
    *((_OWORD *)v13 + 3) = 0u;
    *((_OWORD *)v13 + 4) = 0u;
    v13[80] = 3;
    v14.receiver = v12;
    v14.super_class = v11;
    swift_bridgeObjectRetain();
    return objc_msgSendSuper2(&v14, sel_init);
  }
  return result;
}

uint64_t sub_245DB2BE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void (*v12)(uint64_t, uint64_t);
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

  v23 = *(_QWORD *)(v0 + 216);
  v21 = *(_QWORD *)(v0 + 200);
  v22 = *(_QWORD *)(v0 + 192);
  v20 = *(_QWORD *)(v0 + 184);
  v18 = *(_QWORD *)(v0 + 168);
  v19 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD **)(v0 + 80);
  v15 = *(_QWORD *)(v0 + 88);
  v16 = *(_QWORD *)(v0 + 144);
  v7 = *(_QWORD *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 64);
  v17 = *(_QWORD *)(v0 + 16);
  v8 = *(void (**)(uint64_t))(v3 + 16);
  v8(v2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v4, v2, v5);
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v1, v2, v5);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v10 + v9, v1, v5);
  *v6 = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v6, *MEMORY[0x24BEE5420], v14);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  v11 = sub_245DB40A8((uint64_t)sub_245DB5204, v10, (uint64_t)v6);
  swift_release();
  v12 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v12(v2, v5);
  *(_QWORD *)(v4 + *(int *)(v15 + 20)) = v11;
  sub_245DB43E8(v4, v17, type metadata accessor for _NetworkProcess);
  v12(v16, v5);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
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

uint64_t _ServiceManager.networkProcess(serviceIdentifier:onInteruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  v7 = sub_245DC4C28();
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = type metadata accessor for _NetworkProcess(0);
  v6[12] = swift_task_alloc();
  v8 = sub_245DC4B38();
  v6[13] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v6[14] = v9;
  v6[15] = *(_QWORD *)(v9 + 64);
  v6[16] = swift_task_alloc();
  v6[17] = swift_task_alloc();
  v6[18] = swift_task_alloc();
  sub_245DC4B08();
  v6[19] = swift_task_alloc();
  v10 = sub_245DC4AE4();
  v6[20] = v10;
  v6[21] = *(_QWORD *)(v10 - 8);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  v11 = sub_245DC4B5C();
  v6[24] = v11;
  v6[25] = *(_QWORD *)(v11 - 8);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DB3058()
{
  return sub_245DB306C();
}

uint64_t sub_245DB306C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = v0;
  v2 = sub_245DC4B38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = sub_245DC4B14();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

uint64_t sub_245DB3114()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v9;
  void *v10;

  swift_bridgeObjectRetain();
  sub_245DC4B44();
  if (sub_245DC4B50() == 0xD000000000000024 && v1 == 0x8000000245DC6780)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    v4 = *(_QWORD *)(v0 + 176);
    v3 = *(_QWORD *)(v0 + 184);
    v5 = *(_QWORD *)(v0 + 160);
    v6 = *(_QWORD *)(v0 + 168);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 16))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
    swift_retain();
    sub_245DC4AB4();
    sub_245DC4AD8();
    sub_245DC4AFC();
    sub_245DC4ACC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v3, v5);
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v7;
    *v7 = v0;
    v7[1] = sub_245DB11DC;
    return sub_245DC4AF0();
  }
  v2 = sub_245DC4EE0();
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
    goto LABEL_5;
  v9 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v10 = (void *)sub_245DC4CAC();
  objc_msgSend(v9, sel_initWithDomain_code_userInfo_, v10, 1, 0);

  swift_willThrow();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
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

uint64_t sub_245DB34B8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751C368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _ServiceManager.contentProcess(serviceIdentifier:onInteruption:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  v7 = sub_245DC4C28();
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = swift_task_alloc();
  v6[11] = type metadata accessor for _ContentProcess(0);
  v6[12] = swift_task_alloc();
  v8 = sub_245DC4B38();
  v6[13] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v6[14] = v9;
  v6[15] = *(_QWORD *)(v9 + 64);
  v6[16] = swift_task_alloc();
  v6[17] = swift_task_alloc();
  v6[18] = swift_task_alloc();
  sub_245DC4B08();
  v6[19] = swift_task_alloc();
  v10 = sub_245DC4AE4();
  v6[20] = v10;
  v6[21] = *(_QWORD *)(v10 - 8);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  v11 = sub_245DC4B5C();
  v6[24] = v11;
  v6[25] = *(_QWORD *)(v11 - 8);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  return swift_task_switch();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _Capability.Grant.invalidate()()
{
  uint64_t v0;
  void *v1;
  void *v2;
  unsigned int v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *(void **)v0;
  v2 = *(void **)(v0 + 8);
  if (v2)
    objc_msgSend(v1, sel_removeObserver_, v2);
  v9[0] = 0;
  v3 = objc_msgSend(v1, sel_invalidateSyncWithError_, v9);
  v4 = v9[0];
  if (v3)
  {
    if (v2)
    {
      v5 = v2;
      v6 = v4;
      sub_245DB37D4(&OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver__didInvalidate);

    }
    else
    {
      v8 = v9[0];
    }
  }
  else
  {
    v7 = v9[0];
    sub_245DC4A24();

    swift_willThrow();
  }
}

void sub_245DB37D4(_QWORD *a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(v1
                                      + OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver_invalidationLock)
                          + 16);
  os_unfair_lock_lock(v3);
  v4 = v1 + *a1;
  v5 = *(void (**)(uint64_t))v4;
  if (*(_QWORD *)v4)
  {
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    swift_retain();
    v6 = sub_245DB4668((uint64_t)v5);
    v5(v6);
    sub_245DB4668((uint64_t)v5);
  }
  os_unfair_lock_unlock(v3);
}

uint64_t sub_245DB3A1C()
{
  return sub_245DB3A30();
}

uint64_t sub_245DB3A30()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1)
    return v1();
  return result;
}

uint64_t sub_245DB3AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t result;

  switch(a11)
  {
    case 0:
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_5;
    case 2:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_245DB4668(a7);
      result = sub_245DB4668(a9);
      break;
    case 3:
      swift_bridgeObjectRelease();
LABEL_5:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_245DB3B80(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for _SEExtensionProcess()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for _SEContentProcess(uint64_t a1)
{
  return sub_245DB4778(a1, (uint64_t *)&unk_25751C458);
}

uint64_t sub_245DB3C38()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t type metadata accessor for _SECapability()
{
  return objc_opt_self();
}

uint64_t sub_245DB3E5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void (*v12)(uint64_t, uint64_t);
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

  v23 = *(_QWORD *)(v0 + 216);
  v21 = *(_QWORD *)(v0 + 200);
  v22 = *(_QWORD *)(v0 + 192);
  v20 = *(_QWORD *)(v0 + 184);
  v18 = *(_QWORD *)(v0 + 168);
  v19 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD **)(v0 + 80);
  v15 = *(_QWORD *)(v0 + 88);
  v16 = *(_QWORD *)(v0 + 144);
  v7 = *(_QWORD *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 64);
  v17 = *(_QWORD *)(v0 + 16);
  v8 = *(void (**)(uint64_t))(v3 + 16);
  v8(v2);
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v4, v2, v5);
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v1, v2, v5);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v10 + v9, v1, v5);
  *v6 = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v6, *MEMORY[0x24BEE5420], v14);
  type metadata accessor for LaunchAssertionInvalidator();
  swift_allocObject();
  v11 = sub_245DB40A8((uint64_t)sub_245DB5204, v10, (uint64_t)v6);
  swift_release();
  v12 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v12(v2, v5);
  *(_QWORD *)(v4 + *(int *)(v15 + 20)) = v11;
  sub_245DB43E8(v4, v17, type metadata accessor for _ContentProcess);
  v12(v16, v5);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
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

uint64_t type metadata accessor for LaunchAssertionInvalidator()
{
  return objc_opt_self();
}

_QWORD *sub_245DB40A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  _QWORD v21[2];
  _QWORD aBlock[6];

  v4 = v3;
  v21[0] = a3;
  v8 = sub_245DC4C34();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_245DC4C4C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v21 - v14;
  v4[2] = 0;
  v4[3] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C498);
  v16 = swift_allocObject();
  *(_DWORD *)(v16 + 16) = 0;
  v4[3] = a2;
  v4[4] = v16;
  v4[2] = a1;
  swift_retain();
  sub_245DB4668(0);
  sub_245DB431C(0, &qword_25751C4A0);
  v17 = (void *)sub_245DC4D54();
  sub_245DC4C40();
  MEMORY[0x24954770C](v13, a3);
  v18 = *(void (**)(char *, uint64_t))(v10 + 8);
  v18(v13, v9);
  aBlock[4] = sub_245DB1980;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_245DB1954;
  aBlock[3] = &block_descriptor_0;
  _Block_copy(aBlock);
  v21[1] = MEMORY[0x24BEE4AF8];
  sub_245DB43A0();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C4B0);
  sub_245DB4354();
  sub_245DC4D9C();
  sub_245DC4C64();
  swift_allocObject();
  sub_245DC4C58();
  swift_release();
  sub_245DC4D48();

  swift_release();
  v19 = sub_245DC4C28();
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v21[0], v19);
  v18(v15, v9);
  return v4;
}

uint64_t sub_245DB431C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_245DB4354()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25751C4B8;
  if (!qword_25751C4B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25751C4B0);
    result = MEMORY[0x249547DD8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25751C4B8);
  }
  return result;
}

unint64_t sub_245DB43A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25751C4A8;
  if (!qword_25751C4A8)
  {
    v1 = sub_245DC4C34();
    result = MEMORY[0x249547DD8](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_25751C4A8);
  }
  return result;
}

uint64_t sub_245DB43E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_245DB442C(void *a1, uint64_t a2, void *a3, uint64_t a4, void (*a5)(_QWORD *__return_ptr, id))
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];

  v7 = a3;
  v8 = a1;
  a5(v11, v7);

  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  v9 = (void *)sub_245DC4EC8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v9;
}

void sub_245DB44F8(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  sub_245DB450C(a1, a2);
}

void sub_245DB450C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  void *v12;
  objc_class *v13;
  char *v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  objc_super v19;
  _OWORD v20[5];
  char v21;
  _QWORD v22[2];
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & *v2) + 0x50))(v23);
  v6 = v24;
  v7 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  v8 = *(_BYTE *)(a1 + OBJC_IVAR____SECapability_inner + 80);
  v9 = *(_OWORD *)(a1 + OBJC_IVAR____SECapability_inner + 16);
  v20[0] = *(_OWORD *)(a1 + OBJC_IVAR____SECapability_inner);
  v20[1] = v9;
  v10 = *(_OWORD *)(a1 + OBJC_IVAR____SECapability_inner + 48);
  v20[2] = *(_OWORD *)(a1 + OBJC_IVAR____SECapability_inner + 32);
  v20[3] = v10;
  v20[4] = *(_OWORD *)(a1 + OBJC_IVAR____SECapability_inner + 64);
  v21 = v8;
  (*(void (**)(_QWORD *__return_ptr, _OWORD *, uint64_t, uint64_t))(v7 + 32))(v22, v20, v6, v7);
  if (v3)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  else
  {
    v11 = (void *)v22[0];
    v12 = (void *)v22[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    v13 = (objc_class *)type metadata accessor for _SEInternalGrant();
    v14 = (char *)objc_allocWithZone(v13);
    v15 = &v14[OBJC_IVAR____TtC17ServiceExtensionsP33_620D12DBAD85E5FA4594BA268933638A16_SEInternalGrant_inner];
    *(_QWORD *)v15 = v11;
    *((_QWORD *)v15 + 1) = v12;
    v19.receiver = v14;
    v19.super_class = v13;
    v16 = v11;
    v17 = v12;
    v18 = objc_msgSendSuper2(&v19, sel_init);
    a2[3] = v13;

    *a2 = v18;
  }
}

uint64_t type metadata accessor for _SEInternalGrant()
{
  return objc_opt_self();
}

uint64_t sub_245DB4668(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t _s17ServiceExtensions15_NetworkProcessVwxx_0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245DC4B38();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_245DB46BC(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 64);
  *(_BYTE *)(a2 + 80) = *(_BYTE *)(a1 + 80);
  *(_OWORD *)(a2 + 48) = v4;
  *(_OWORD *)(a2 + 64) = v5;
  *(_OWORD *)(a2 + 32) = v3;
  return a2;
}

uint64_t sub_245DB46E4@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t *boxed_opaque_existential_1;

  v8 = v4 + *a1;
  a4[3] = a2(0);
  a4[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
  return sub_245DB3B80(v8, (uint64_t)boxed_opaque_existential_1, a2);
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

uint64_t sub_245DB4778(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t _s17ServiceExtensions15_NetworkProcessVwcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_245DC4B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t type metadata accessor for _ContentProcess(uint64_t a1)
{
  return sub_245DB4778(a1, (uint64_t *)&unk_25751C440);
}

uint64_t type metadata accessor for _NetworkProcess(uint64_t a1)
{
  return sub_245DB4778(a1, (uint64_t *)&unk_25751C420);
}

uint64_t type metadata accessor for _GPUProcess(uint64_t a1)
{
  return sub_245DB4778(a1, (uint64_t *)&unk_25751C430);
}

void sub_245DB484C(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v3 = v2;
  v5 = v2[4];
  v6 = v2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C5A0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_245DC6360;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = (void *)sub_245DC4CAC();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_245DC4CAC();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_attributeWithDomain_name_, v8, v9);

  *(_QWORD *)(v7 + 32) = v10;
  sub_245DC4CF4();
  if (v7 >> 62)
  {
    sub_245DB431C(0, &qword_25751C5A8);
    swift_bridgeObjectRetain();
    sub_245DC4E74();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_245DC4EEC();
    sub_245DB431C(0, &qword_25751C5A8);
  }
  swift_bridgeObjectRelease();
  v11 = sub_245DB4BAC(a1, v5, v6);
  swift_bridgeObjectRelease();
  if (!v17)
  {
    v12 = v3[8];
    v13 = v3[9];
    v15 = v3[6];
    v14 = v3[7];
    sub_245DB4A48(v12);
    sub_245DB4A48(v15);
    sub_245DB4A58(v11, v12, v13, v15, v14, a2);
  }
}

uint64_t sub_245DB4A48(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void sub_245DB4A58(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  id v7;
  id v8;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  if (a2 | a4)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = a2;
    *(_QWORD *)(v13 + 24) = a3;
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a4;
    *(_QWORD *)(v14 + 24) = a5;
    v15 = objc_allocWithZone((Class)type metadata accessor for _Capability.AssertionObserver());
    v16 = a1;
    sub_245DB4A48(a4);
    sub_245DB4A48(a2);
    v8 = sub_245DB4F0C((uint64_t)sub_245DB3A1C, v13, (uint64_t)sub_245DB3A1C, v14);
    swift_release();
    swift_release();
    v17 = v8;
    objc_msgSend(v16, sel_addObserver_, v17);
    sub_245DB4668(a4);
    sub_245DB4668(a2);

  }
  else
  {
    v7 = a1;
    v8 = 0;
  }
  *a6 = a1;
  a6[1] = v8;

}

id sub_245DB4BAC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  id v22[3];

  v22[2] = *(id *)MEMORY[0x24BDAC8D0];
  sub_245DC4E38();
  swift_bridgeObjectRelease();
  v22[0] = (id)0xD00000000000002ELL;
  v22[1] = (id)0x8000000245DC70B0;
  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v7(v5, v6);
  sub_245DC4EBC();
  sub_245DC4CD0();
  swift_bridgeObjectRelease();
  if (a3)
  {
    swift_bridgeObjectRetain();
    v8 = ((uint64_t (*)(uint64_t, uint64_t))v7)(v5, v6);
    v9 = (void *)sub_245DC4CAC();
    swift_bridgeObjectRelease();
    v10 = objc_msgSend((id)objc_opt_self(), sel_targetWithPid_environmentIdentifier_, v8, v9);

    if (v10)
      goto LABEL_3;
LABEL_8:
    __break(1u);
  }
  v21 = ((uint64_t (*)(uint64_t, uint64_t))v7)(v5, v6);
  v10 = objc_msgSend((id)objc_opt_self(), sel_targetWithPid_, v21);
  if (!v10)
    goto LABEL_8;
LABEL_3:
  v11 = objc_allocWithZone(MEMORY[0x24BE80B10]);
  v12 = v10;
  swift_bridgeObjectRetain();
  v13 = (void *)sub_245DC4CAC();
  swift_bridgeObjectRelease();
  sub_245DB431C(0, &qword_25751C5A8);
  v14 = (void *)sub_245DC4CE8();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v11, sel_initWithExplanation_target_attributes_, v13, v12, v14);

  v22[0] = 0;
  if ((objc_msgSend(v15, sel_acquireWithError_, v22) & 1) != 0)
  {
    v16 = v22[0];

  }
  else
  {
    v17 = v22[0];
    v18 = (void *)sub_245DC4A24();

    swift_willThrow();
    objc_msgSend(v15, sel_invalidate);
    v19 = (void *)sub_245DC4A18();
    sub_245DBF9C8(v19);

    swift_willThrow();
  }
  return v15;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t _s17ServiceExtensions15_NetworkProcessV17processIdentifiers5Int32Vvg_0()
{
  unsigned int v0;
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  audit_token_t v7;

  *(_QWORD *)v7.val = MEMORY[0x249547544]();
  v7.val[2] = v0;
  v7.val[3] = v1;
  v7.val[4] = v2;
  v7.val[5] = v3;
  v7.val[6] = v4;
  v7.val[7] = v5;
  return audit_token_to_pid(&v7);
}

id sub_245DB4F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  objc_super v17;

  v9 = (uint64_t *)&v4[OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver__willInvalidate];
  *v9 = 0;
  v9[1] = 0;
  v10 = (uint64_t *)&v4[OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver__didInvalidate];
  *v10 = 0;
  v10[1] = 0;
  v11 = OBJC_IVAR____TtCO17ServiceExtensions11_CapabilityP33_3A110C98667FE5E79B17C7ACF7B087C017AssertionObserver_invalidationLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C498);
  v12 = swift_allocObject();
  *(_DWORD *)(v12 + 16) = 0;
  *(_QWORD *)&v4[v11] = v12;
  v13 = *v9;
  *v9 = a1;
  v9[1] = a2;
  v14 = v4;
  swift_retain();
  sub_245DB4668(v13);
  v15 = *v10;
  *v10 = a3;
  v10[1] = a4;
  swift_retain();
  sub_245DB4668(v15);

  v17.receiver = v14;
  v17.super_class = (Class)type metadata accessor for _Capability.AssertionObserver();
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t type metadata accessor for _Capability.AssertionObserver()
{
  return objc_opt_self();
}

uint64_t sub_245DB5024@<X0>(uint64_t *a1@<X8>)
{
  return sub_245DB46E4(&OBJC_IVAR____SEContentProcess_inner, type metadata accessor for _ContentProcess, (uint64_t)&protocol witness table for _ContentProcess, a1);
}

uint64_t sub_245DB5040()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_245DC4B98();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245DC4B8C();
  v4 = _s17ServiceExtensions15_BrowserProcessV17processIdentifiers5Int32Vvg_0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_245DB50C0@<X0>(uint64_t *a1@<X8>)
{
  return sub_245DB46E4(&OBJC_IVAR____SENetworkProcess_inner, type metadata accessor for _NetworkProcess, (uint64_t)&protocol witness table for _NetworkProcess, a1);
}

uint64_t sub_245DB50DC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _BYTE v4[88];

  sub_245DB46BC(a1, (uint64_t)v4);
  return sub_245DBD3F8((uint64_t)v4, type metadata accessor for _NetworkProcess, (uint64_t)&protocol witness table for _NetworkProcess, a2);
}

uint64_t sub_245DB512C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_245DC4B38();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_245DB5168(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_245DC4B38() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_245DB51B4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _BYTE v4[88];

  sub_245DB46BC(a1, (uint64_t)v4);
  return sub_245DBD3F8((uint64_t)v4, type metadata accessor for _ContentProcess, (uint64_t)&protocol witness table for _ContentProcess, a2);
}

uint64_t sub_245DB5204()
{
  return sub_245DB5168((uint64_t (*)(uint64_t))sub_245DB5210);
}

uint64_t sub_245DB5214@<X0>(uint64_t *a1@<X8>)
{
  return sub_245DB46E4(&OBJC_IVAR____SEGPUProcess_inner, type metadata accessor for _GPUProcess, (uint64_t)&protocol witness table for _GPUProcess, a1);
}

uint64_t sub_245DB5230@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _BYTE v4[88];

  sub_245DB46BC(a1, (uint64_t)v4);
  return sub_245DBD3F8((uint64_t)v4, type metadata accessor for _GPUProcess, (uint64_t)&protocol witness table for _GPUProcess, a2);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249547DC0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249547DCC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_245DB5338(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_245DB5338(a1, &qword_25751C278);
}

uint64_t sub_245DB5390()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C498);
  result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_25751C4D0 = result;
  return result;
}

uint64_t sub_245DB53C4()
{
  uint64_t v0;

  sub_245DB4668(*(_QWORD *)(v0 + 16));
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_245DB53F0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 16))();
}

uint64_t sub_245DB5464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245DB1AC8(a1, a2, a3, type metadata accessor for _NetworkProcess);
}

uint64_t type metadata accessor for _SENetworkProcess(uint64_t a1)
{
  return sub_245DB4778(a1, (uint64_t *)&unk_25751C478);
}

uint64_t sub_245DB54AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245DB1AC8(a1, a2, a3, type metadata accessor for _ContentProcess);
}

uint64_t getEnumTagSinglePayload for _ServiceManager.ServiceExtensionsErrorCodes(unsigned int *a1, int a2)
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

ValueMetadata *type metadata accessor for _LockdownVersion()
{
  return &type metadata for _LockdownVersion;
}

uint64_t sub_245DB551C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245DB1AC8(a1, a2, a3, type metadata accessor for _GPUProcess);
}

uint64_t type metadata accessor for _SEGPUProcess(uint64_t a1)
{
  return sub_245DB4778(a1, (uint64_t *)&unk_25751C468);
}

uint64_t destroy for _Capability(uint64_t a1)
{
  return sub_245DB3AA4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_BYTE *)(a1 + 80));
}

uint64_t sub_245DB557C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for _Capability()
{
  return &type metadata for _Capability;
}

ValueMetadata *type metadata accessor for _Capability.Grant()
{
  return &type metadata for _Capability.Grant;
}

uint64_t type metadata accessor for _ServiceManager()
{
  return objc_opt_self();
}

uint64_t sub_245DB55C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245DB5628()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t NetworkingServiceExtension._request(capabilities:)@<X0>(__int128 *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_245DB2500(a1, a2);
}

uint64_t sub_245DB56A0()
{
  sub_245DC4E38();
  swift_bridgeObjectRelease();
  return sandbox_enable_local_state_flag();
}

uint64_t GPUServiceExtension._lockdown(version:)()
{
  sub_245DC4E38();
  swift_bridgeObjectRelease();
  return sandbox_enable_local_state_flag();
}

uint64_t sub_245DB5728()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t dispatch thunk of GPUServiceExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of GPUServiceExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t initializeBufferWithCopyOfBuffer for _Capability(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_245DB57CC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_245DB57EC(uint64_t result, int a2, int a3)
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

void type metadata accessor for audit_token_t(uint64_t a1)
{
  sub_245DB5338(a1, &qword_25751C280);
}

BOOL sub_245DB582C(_QWORD *a1, uint64_t *a2)
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

void type metadata accessor for CFBoolean(uint64_t a1)
{
  sub_245DB5338(a1, &qword_25751C288);
}

uint64_t NetworkingServiceExtension._backgroundTransferManager.getter()
{
  if (qword_25751C1F0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t BackgroundTransferManager.Download.init(sourceURL:destinationURL:title:type:description:sourceDescription:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  int v37;
  uint64_t v38;
  char *v39;
  void (*v40)(uint64_t, char *, uint64_t);
  char *v41;
  void (*v42)(char *, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  void (*v49)(uint64_t, uint64_t, uint64_t);
  _QWORD *v50;
  _QWORD v52[2];
  char *v53;
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

  v62 = a1;
  v63 = a8;
  v60 = a6;
  v61 = a7;
  v58 = a5;
  v55 = a3;
  v56 = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25751C2F0);
  v12 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v54 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v52 - v14;
  v16 = sub_245DC4BD4();
  v64 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v52[1] = (char *)v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v53 = (char *)v52 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v52 - v21;
  v23 = sub_245DC4A60();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245DC4A78();
  v27 = (int *)type metadata accessor for BackgroundTransferManager.Download(0);
  v28 = v27[11];
  *(_QWORD *)(a9 + v28) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1768]), sel_init);
  v59 = v23;
  v57 = v24;
  v52[0] = v22;
  if (a4)
  {
    v29 = v55;
    v30 = v56;
  }
  else
  {
    v30 = v56;
    sub_245DC4A54();
    v29 = sub_245DC4A48();
    a4 = v31;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  }
  v32 = v58;
  v33 = v64;
  v58 = a10;
  v34 = (uint64_t *)(a9 + v27[5]);
  *v34 = v29;
  v34[1] = a4;
  sub_245DB5FA8(v32, (uint64_t)v15);
  v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48);
  if (v35((uint64_t)v15, 1, v16) == 1)
  {
    sub_245DB9630((uint64_t)v15, (uint64_t *)&unk_25751C2F0);
    sub_245DC4A3C();
    sub_245DC4BC8();
    v36 = (uint64_t)v54;
    sub_245DC4BBC();
    v37 = v35(v36, 1, v16);
    v38 = v63;
    v39 = v53;
    if (v37 == 1)
    {
      sub_245DC4BC8();
      sub_245DB9630(v32, (uint64_t *)&unk_25751C2F0);
      sub_245DB9630(v36, (uint64_t *)&unk_25751C2F0);
      (*(void (**)(uint64_t, char *, uint64_t))(v64 + 32))(a9 + v27[6], v39, v16);
    }
    else
    {
      sub_245DB9630(v32, (uint64_t *)&unk_25751C2F0);
      v42 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 32);
      v42(v39, v36, v16);
      v42((char *)(a9 + v27[6]), (uint64_t)v39, v16);
    }
  }
  else
  {
    sub_245DB9630(v32, (uint64_t *)&unk_25751C2F0);
    v40 = *(void (**)(uint64_t, char *, uint64_t))(v33 + 32);
    v41 = (char *)v52[0];
    v40(v52[0], v15, v16);
    v40(a9 + v27[6], v41, v16);
    v38 = v63;
  }
  v44 = v61;
  v43 = v62;
  v45 = v59;
  v46 = v57;
  v47 = v58;
  v48 = (_QWORD *)(a9 + v27[7]);
  *v48 = v60;
  v48[1] = v44;
  v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32);
  v49(a9 + v27[8], v43, v45);
  v50 = (_QWORD *)(a9 + v27[9]);
  *v50 = v38;
  v50[1] = v47;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v49)(a9 + v27[10], v30, v45);
}

uint64_t BackgroundTransferManager.Download.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_245DC4A84();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t BackgroundTransferManager.Download.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BackgroundTransferManager.Download.type.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 24);
  v4 = sub_245DC4BD4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t BackgroundTransferManager.Download.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BackgroundTransferManager.Download.sourceURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 32);
  v4 = sub_245DC4A60();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t BackgroundTransferManager.Download.sourceDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BackgroundTransferManager.Download.destinationURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 40);
  v4 = sub_245DC4A60();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t BackgroundTransferManager.Download.destinationURL.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 40);
  v4 = sub_245DC4A60();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*BackgroundTransferManager.Download.destinationURL.modify())()
{
  type metadata accessor for BackgroundTransferManager.Download(0);
  return nullsub_1;
}

id BackgroundTransferManager.Download.progress.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(type metadata accessor for BackgroundTransferManager.Download(0) + 44));
}

uint64_t sub_245DB5E88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 32);
  v5 = sub_245DC4A60();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_245DB5EC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 40);
  v5 = sub_245DC4A60();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

id sub_245DB5F08(uint64_t a1)
{
  uint64_t v1;

  return *(id *)(v1 + *(int *)(a1 + 44));
}

uint64_t sub_245DB5F14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_245DC4A84();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_245DB5F50()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for BackgroundTransferManager();
  v0 = swift_allocObject();
  result = swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = MEMORY[0x24BEE4B00];
  qword_25751C778 = v0;
  return result;
}

uint64_t type metadata accessor for BackgroundTransferManager.Download(uint64_t a1)
{
  return sub_245DB4778(a1, (uint64_t *)&unk_25751C320);
}

uint64_t sub_245DB5FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25751C2F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245DB5FF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_245DB6008()
{
  uint64_t v0;

  sub_245DB65C0(*(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DB6038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  __int128 v65[2];
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;

  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751C300);
  v1 = MEMORY[0x24BDAC7A8](v61);
  v60 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v59 = (uint64_t)&v52 - v4;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v58 = (char *)&v52 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v57 = (char *)&v52 - v7;
  result = swift_beginAccess();
  v9 = *(_QWORD *)(v0 + 112);
  v10 = *(_QWORD *)(v9 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    *(_QWORD *)&v65[0] = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_245DB70C8(0, v10, 0);
    result = sub_245DB8248(v9);
    v13 = result;
    v14 = 0;
    v15 = v9 + 64;
    v16 = *(_BYTE *)(v9 + 32);
    v52 = v9 + 88;
    v56 = v9;
    v53 = v10;
    v54 = v12;
    v55 = v9 + 64;
    while (1)
    {
      if (v13 < 0 || v13 >= 1 << v16)
        goto LABEL_41;
      if ((*(_QWORD *)(v15 + 8 * ((unint64_t)v13 >> 6)) & (1 << v13)) == 0)
        goto LABEL_42;
      if (*(_DWORD *)(v9 + 36) != (_DWORD)v12)
        goto LABEL_43;
      v63 = 1 << v13;
      v64 = (unint64_t)v13 >> 6;
      v62 = v14;
      v19 = v61;
      v20 = (uint64_t)v57;
      v21 = (uint64_t)&v57[*(int *)(v61 + 48)];
      v22 = *(_QWORD *)(v9 + 48);
      v23 = sub_245DC4A84();
      v24 = *(_QWORD *)(v23 - 8);
      v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
      v25(v20, v22 + *(_QWORD *)(v24 + 72) * v13, v23);
      v26 = *(_QWORD *)(v9 + 56);
      v27 = type metadata accessor for BackgroundTransferManager._Transfer(0);
      sub_245DB3B80(v26 + *(_QWORD *)(*(_QWORD *)(v27 - 8) + 72) * v13, v21, type metadata accessor for BackgroundTransferManager._Transfer);
      v28 = (uint64_t)v58;
      v25((uint64_t)v58, v20, v23);
      sub_245DB3B80(v21, v28 + *(int *)(v19 + 48), type metadata accessor for BackgroundTransferManager._Transfer);
      v29 = v59;
      sub_245DB82E4(v28, v59);
      sub_245DB9630(v20, &qword_25751C300);
      v30 = *(int *)(v19 + 48);
      v31 = v60;
      v32 = (uint64_t)&v60[v30];
      v33 = v29 + v30;
      v25((uint64_t)v60, v29, v23);
      sub_245DB3B80(v33, v32, type metadata accessor for BackgroundTransferManager._Transfer);
      sub_245DB832C(v32 + *(int *)(v27 + 20), (uint64_t)&v67);
      sub_245DB8370(v32);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v31, v23);
      sub_245DB9630(v29, &qword_25751C300);
      v34 = *(_QWORD *)&v65[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_245DB70C8(0, *(_QWORD *)(v34 + 16) + 1, 1);
        v34 = *(_QWORD *)&v65[0];
      }
      v9 = v56;
      v36 = *(_QWORD *)(v34 + 16);
      v35 = *(_QWORD *)(v34 + 24);
      if (v36 >= v35 >> 1)
      {
        sub_245DB70C8(v35 > 1, v36 + 1, 1);
        v34 = *(_QWORD *)&v65[0];
      }
      *(_QWORD *)(v34 + 16) = v36 + 1;
      result = sub_245DB83AC(&v67, v34 + 40 * v36 + 32);
      v16 = *(_BYTE *)(v9 + 32);
      v17 = 1 << v16;
      if (v13 >= 1 << v16)
        goto LABEL_44;
      v15 = v55;
      v37 = v64;
      v38 = *(_QWORD *)(v55 + 8 * v64);
      if ((v38 & v63) == 0)
        goto LABEL_45;
      LODWORD(v12) = v54;
      if (*(_DWORD *)(v9 + 36) != (_DWORD)v54)
        goto LABEL_46;
      v39 = v38 & (-2 << (v13 & 0x3F));
      if (v39)
        break;
      v40 = v64 + 1;
      v41 = (v17 + 63) >> 6;
      if (v64 + 1 >= v41)
        goto LABEL_4;
      v42 = *(_QWORD *)(v55 + 8 * v40);
      v18 = v53;
      if (!v42)
      {
        v40 = v64 + 2;
        if (v64 + 2 >= v41)
          goto LABEL_5;
        v42 = *(_QWORD *)(v55 + 8 * v40);
        if (!v42)
        {
          while (v41 - 3 != v37)
          {
            v42 = *(_QWORD *)(v52 + 8 * v37++);
            if (v42)
            {
              v40 = v37 + 2;
              goto LABEL_20;
            }
          }
          goto LABEL_5;
        }
      }
LABEL_20:
      v17 = __clz(__rbit64(v42)) + (v40 << 6);
LABEL_5:
      v14 = v62 + 1;
      v13 = v17;
      if (v62 + 1 == v18)
      {
        result = swift_bridgeObjectRelease();
        v11 = MEMORY[0x24BEE4AF8];
        goto LABEL_28;
      }
    }
    v17 = __clz(__rbit64(v39)) | v13 & 0xFFFFFFFFFFFFFFC0;
LABEL_4:
    v18 = v53;
    goto LABEL_5;
  }
  v34 = MEMORY[0x24BEE4AF8];
LABEL_28:
  v66 = v11;
  v43 = *(_QWORD *)(v34 + 16);
  if (v43)
  {
    v44 = 0;
    v45 = v34 + 32;
    while (v44 < *(_QWORD *)(v34 + 16))
    {
      sub_245DB832C(v45, (uint64_t)&v67);
      v46 = v68;
      v47 = v69;
      __swift_project_boxed_opaque_existential_1(&v67, v68);
      v48 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v47 + 40))(v46, v47);
      LOBYTE(v46) = objc_msgSend(v48, sel_isFinished);

      if ((v46 & 1) != 0)
      {
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v67);
      }
      else
      {
        sub_245DB83AC(&v67, (uint64_t)v65);
        v49 = v66;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_245DB70C8(0, *(_QWORD *)(v49 + 16) + 1, 1);
          v49 = v66;
        }
        v51 = *(_QWORD *)(v49 + 16);
        v50 = *(_QWORD *)(v49 + 24);
        if (v51 >= v50 >> 1)
        {
          sub_245DB70C8(v50 > 1, v51 + 1, 1);
          v49 = v66;
        }
        *(_QWORD *)(v49 + 16) = v51 + 1;
        result = sub_245DB83AC(v65, v49 + 40 * v51 + 32);
      }
      ++v44;
      v45 += 40;
      if (v43 == v44)
        goto LABEL_39;
    }
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
  }
  else
  {
LABEL_39:
    swift_bridgeObjectRelease();
    return v66;
  }
  return result;
}

uint64_t sub_245DB65C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t *, uint64_t);
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751C350);
  MEMORY[0x24BDAC7A8](v4);
  v47 = (uint64_t)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_245DC4A84();
  v43 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v44 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  v45 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for BackgroundTransferManager.Download(0);
  v10 = *(_QWORD *)(v9 - 8);
  v39 = v9;
  v11 = (char *)&v35 - ((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)(a1 + *(int *)(MEMORY[0x24BDAC7A8](v9) + 44));
  v37 = a1;
  v48 = (uint64_t)v12;
  swift_getKeyPath();
  v13 = v12;
  v40 = sub_245DC4A30();
  swift_release();
  v48 = (uint64_t)v13;
  v42 = v13;
  swift_getKeyPath();
  sub_245DB3B80(a1, (uint64_t)v11, type metadata accessor for BackgroundTransferManager.Download);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v2;
  sub_245DB43E8((uint64_t)v11, v15 + v14, type metadata accessor for BackgroundTransferManager.Download);
  swift_retain();
  v38 = sub_245DC4A30();
  swift_release();
  swift_release();
  v48 = (uint64_t)v13;
  swift_getKeyPath();
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_release();
  v16 = v37;
  sub_245DB3B80(v37, (uint64_t)v11, type metadata accessor for BackgroundTransferManager.Download);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v2;
  sub_245DB43E8((uint64_t)v11, v17 + v14, type metadata accessor for BackgroundTransferManager.Download);
  v18 = (void *)sub_245DC4A30();
  v36 = v18;
  swift_release();
  swift_release();
  v19 = v41;
  v20 = (uint64_t *)&v8[*(int *)(v41 + 20)];
  v20[3] = v39;
  v20[4] = sub_245DB842C(&qword_25751C358, type metadata accessor for BackgroundTransferManager.Download, (uint64_t)&protocol conformance descriptor for BackgroundTransferManager.Download);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  sub_245DB3B80(v16, (uint64_t)boxed_opaque_existential_1, type metadata accessor for BackgroundTransferManager.Download);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C5A0);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_245DC5A30;
  v23 = (void *)v40;
  v24 = (void *)v38;
  *(_QWORD *)(v22 + 32) = v40;
  *(_QWORD *)(v22 + 40) = v24;
  *(_QWORD *)(v22 + 48) = v18;
  v48 = v22;
  sub_245DC4CF4();
  v25 = v48;
  v26 = *(void (**)(char *, uint64_t *, uint64_t))(v43 + 16);
  v27 = boxed_opaque_existential_1;
  v28 = v46;
  v26(v8, v27, v46);
  *(_QWORD *)&v8[*(int *)(v19 + 24)] = v25;
  v29 = (uint64_t)v44;
  v26(v44, (uint64_t *)v8, v28);
  v30 = v47;
  sub_245DB3B80((uint64_t)v8, v47, type metadata accessor for BackgroundTransferManager._Transfer);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v45 + 56))(v30, 0, 1, v19);
  swift_beginAccess();
  v31 = v23;
  v32 = v24;
  v33 = v36;
  sub_245DB6EE8(v30, v29);
  swift_endAccess();

  return sub_245DB8370((uint64_t)v8);
}

uint64_t sub_245DB6A0C(void **a1)
{
  void *v1;
  uint64_t v2;

  v1 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C380);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_245DC5A40;
  sub_245DC4CD0();
  objc_msgSend(v1, sel_fractionCompleted);
  sub_245DC4D24();
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 32) = 0;
  *(_QWORD *)(v2 + 40) = 0xE000000000000000;
  sub_245DC4F40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245DB6AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C350);
  v6[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DB6B48()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C380);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_245DC5A40;
  objc_msgSend(v1, sel_isFinished);
  sub_245DC4CD0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 32) = 0x64656873696E6946;
  *(_QWORD *)(v2 + 40) = 0xEB0000000020203ALL;
  sub_245DC4F40();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_245DB6C58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  swift_beginAccess();
  sub_245DB7284(v1, v2);
  sub_245DB9630(v2, &qword_25751C350);
  swift_endAccess();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DB6CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C350);
  v6[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DB6D3C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C380);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_245DC5A40;
  objc_msgSend(v1, sel_isCancelled);
  sub_245DC4CD0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 32) = 0x64656C65636E6143;
  *(_QWORD *)(v2 + 40) = 0xEB0000000020203ALL;
  sub_245DC4F40();
  swift_bridgeObjectRelease();
  swift_unownedRetainStrong();
  return swift_task_switch();
}

uint64_t sub_245DB6E54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  swift_beginAccess();
  sub_245DB7284(v1, v2);
  sub_245DB9630(v2, &qword_25751C350);
  swift_endAccess();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DB6EE8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751C350);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_245DB9630(a1, &qword_25751C350);
    sub_245DB7284(a2, (uint64_t)v8);
    v13 = sub_245DC4A84();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a2, v13);
    return sub_245DB9630((uint64_t)v8, &qword_25751C350);
  }
  else
  {
    sub_245DB43E8(a1, (uint64_t)v11, type metadata accessor for BackgroundTransferManager._Transfer);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v3;
    *v3 = 0x8000000000000000;
    sub_245DB7AB0((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v18;
    swift_bridgeObjectRelease();
    v16 = sub_245DC4A84();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t BackgroundTransferManager.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t BackgroundTransferManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t BackgroundTransferManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_245DB70BC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_245DB70C8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_245DB70E4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_245DB70E4(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751C340);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751C348);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_245DC4EA4();
  __break(1u);
  return result;
}

uint64_t sub_245DB7284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  v6 = sub_245DC2BDC(a1);
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
      sub_245DB7CE8();
      v9 = v17;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_245DC4A84();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    v12 = *(_QWORD *)(v9 + 56);
    v13 = type metadata accessor for BackgroundTransferManager._Transfer(0);
    v14 = *(_QWORD *)(v13 - 8);
    sub_245DB43E8(v12 + *(_QWORD *)(v14 + 72) * v6, a2, type metadata accessor for BackgroundTransferManager._Transfer);
    sub_245DB77DC(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
  }
  else
  {
    v16 = type metadata accessor for BackgroundTransferManager._Transfer(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

uint64_t sub_245DB73C0(uint64_t a1, int a2)
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
  int64_t v25;
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
  v5 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  v46 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v49 = (uint64_t)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_245DC4A84();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C360);
  v48 = a2;
  v12 = sub_245DC4E8C();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_42;
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
      goto LABEL_22;
    }
    v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      return result;
    }
    if (v25 >= v44)
      break;
    v26 = v45;
    v27 = v45[v25];
    ++v20;
    if (!v27)
    {
      v20 = v25 + 1;
      if (v25 + 1 >= v44)
        goto LABEL_35;
      v27 = v45[v20];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v44)
        {
LABEL_35:
          swift_release();
          v3 = v43;
          if ((v48 & 1) == 0)
            goto LABEL_42;
          goto LABEL_36;
        }
        v27 = v45[v28];
        if (!v27)
        {
          while (1)
          {
            v20 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_44;
            if (v20 >= v44)
              goto LABEL_35;
            v27 = v45[v20];
            ++v28;
            if (v27)
              goto LABEL_21;
          }
        }
        v20 = v28;
      }
    }
LABEL_21:
    v17 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v20 << 6);
LABEL_22:
    v29 = *(_QWORD *)(v8 + 72);
    v30 = *(_QWORD *)(v21 + 48) + v29 * v24;
    if ((v48 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 32))(v10, v30, v7);
      v31 = *(_QWORD *)(v21 + 56);
      v32 = *(_QWORD *)(v46 + 72);
      sub_245DB43E8(v31 + v32 * v24, v49, type metadata accessor for BackgroundTransferManager._Transfer);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, v30, v7);
      v33 = *(_QWORD *)(v21 + 56);
      v32 = *(_QWORD *)(v46 + 72);
      sub_245DB3B80(v33 + v32 * v24, v49, type metadata accessor for BackgroundTransferManager._Transfer);
    }
    sub_245DB842C(&qword_25751C310, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_245DC4C94();
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
          goto LABEL_43;
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
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v13 + 48) + v22 * v29, v10, v7);
    result = sub_245DB43E8(v49, *(_QWORD *)(v13 + 56) + v22 * v32, type metadata accessor for BackgroundTransferManager._Transfer);
    ++*(_QWORD *)(v13 + 16);
  }
  swift_release();
  v3 = v43;
  v26 = v45;
  if ((v48 & 1) == 0)
    goto LABEL_42;
LABEL_36:
  v41 = 1 << *(_BYTE *)(i + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(i + 16) = 0;
LABEL_42:
  result = swift_release();
  *v3 = v13;
  return result;
}

unint64_t sub_245DB77DC(int64_t a1, uint64_t a2)
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

  v4 = sub_245DC4A84();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_245DC4DA8();
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
        sub_245DB842C(&qword_25751C310, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = sub_245DC4C94();
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
            v23 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for BackgroundTransferManager._Transfer(0) - 8) + 72);
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

uint64_t sub_245DB7AB0(uint64_t a1, uint64_t a2, char a3)
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
  v8 = sub_245DC4A84();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_245DC2BDC(a2);
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
        v22 = type metadata accessor for BackgroundTransferManager._Transfer(0);
        return sub_245DB966C(a1, v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_245DB7CE8();
      goto LABEL_7;
    }
    sub_245DB73C0(v17, a3 & 1);
    v24 = sub_245DC2BDC(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_245DB7C30(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_245DC4F04();
  __break(1u);
  return result;
}

uint64_t sub_245DB7C30(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
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
  v9 = sub_245DC4A84();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  result = sub_245DB43E8(a3, v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, type metadata accessor for BackgroundTransferManager._Transfer);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

void *sub_245DB7CE8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t i;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  v36 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v35 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_245DC4A84();
  v3 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v33 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C360);
  v30 = v0;
  v5 = *v0;
  v6 = sub_245DC4E80();
  v7 = *(_QWORD *)(v5 + 16);
  v38 = v6;
  if (!v7)
  {
    result = (void *)swift_release();
    v28 = v38;
    v27 = v30;
LABEL_25:
    *v27 = v28;
    return result;
  }
  v8 = v6;
  result = (void *)(v6 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
  {
    result = memmove(result, (const void *)(v5 + 64), 8 * v10);
    v8 = v38;
    v7 = *(_QWORD *)(v5 + 16);
  }
  v11 = 0;
  *(_QWORD *)(v8 + 16) = v7;
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5;
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v31 = v5 + 64;
  v32 = (unint64_t)(v12 + 63) >> 6;
  v16 = v33;
  v15 = v34;
  v17 = (uint64_t)v35;
  for (i = v38;
        ;
        result = (void *)sub_245DB43E8(v17, *(_QWORD *)(i + 56) + v23, type metadata accessor for BackgroundTransferManager._Transfer))
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v20 = v19 | (v11 << 6);
      v21 = v37;
      goto LABEL_9;
    }
    v24 = v11 + 1;
    v21 = v37;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32)
      goto LABEL_23;
    v25 = *(_QWORD *)(v31 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v32)
        goto LABEL_23;
      v25 = *(_QWORD *)(v31 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_22:
    v14 = (v25 - 1) & v25;
    v20 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_9:
    v22 = *(_QWORD *)(v3 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v16, *(_QWORD *)(v21 + 48) + v22, v15);
    v23 = *(_QWORD *)(v36 + 72) * v20;
    sub_245DB3B80(*(_QWORD *)(v21 + 56) + v23, v17, type metadata accessor for BackgroundTransferManager._Transfer);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(i + 48) + v22, v16, v15);
  }
  v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    result = (void *)swift_release();
    v27 = v30;
    v28 = v38;
    goto LABEL_25;
  }
  v25 = *(_QWORD *)(v31 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v32)
      goto LABEL_23;
    v25 = *(_QWORD *)(v31 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_245DB7FB0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  id v17;
  uint64_t v19;

  v7 = type metadata accessor for BackgroundTransferManager.Download(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751C368);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  v14 = sub_245DC4D18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 1, 1, v14);
  sub_245DB3B80(a4, (uint64_t)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for BackgroundTransferManager.Download);
  v15 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v13;
  v16[5] = a3;
  sub_245DB43E8((uint64_t)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v16 + v15, type metadata accessor for BackgroundTransferManager.Download);
  v17 = v13;
  swift_retain();
  sub_245DB9934((uint64_t)v12, (uint64_t)&unk_25751C390, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_245DB80FC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  id v17;
  uint64_t v19;

  v7 = type metadata accessor for BackgroundTransferManager.Download(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751C368);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  v14 = sub_245DC4D18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 1, 1, v14);
  sub_245DB3B80(a4, (uint64_t)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for BackgroundTransferManager.Download);
  v15 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v13;
  v16[5] = a3;
  sub_245DB43E8((uint64_t)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v16 + v15, type metadata accessor for BackgroundTransferManager.Download);
  v17 = v13;
  swift_unownedRetain();
  sub_245DB9934((uint64_t)v12, (uint64_t)&unk_25751C378, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_245DB8248(uint64_t a1)
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

uint64_t type metadata accessor for BackgroundTransferManager._Transfer(uint64_t a1)
{
  return sub_245DB4778(a1, (uint64_t *)&unk_25751C330);
}

uint64_t sub_245DB82E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25751C300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_245DB832C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_245DB8370(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_245DB83AC(__int128 *a1, uint64_t a2)
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

uint64_t sub_245DB83C4(uint64_t a1)
{
  uint64_t result;

  result = sub_245DB842C(&qword_25751C308, type metadata accessor for BackgroundTransferManager.Download, (uint64_t)&protocol conformance descriptor for BackgroundTransferManager.Download);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_245DB8400()
{
  return sub_245DB842C(&qword_25751C310, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_245DB842C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249547DD8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of BackroundableTransfer.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of BackroundableTransfer.sourceURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of BackroundableTransfer.destinationURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of BackroundableTransfer.progress.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t type metadata accessor for BackgroundTransferManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for BackgroundTransferManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BackgroundTransferManager.register(download:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 120) + *(_QWORD *)(*(_QWORD *)v1 + 120));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_245DB851C;
  return v6(a1);
}

uint64_t sub_245DB851C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of BackgroundTransferManager.transfers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t *initializeBufferWithCopyOfBuffer for BackgroundTransferManager.Download(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v36 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v36 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_245DC4A84();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (char *)a1 + v9;
    v14 = (char *)a2 + v9;
    v15 = sub_245DC4BD4();
    v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    swift_bridgeObjectRetain();
    v16(v13, v14, v15);
    v17 = a3[7];
    v18 = a3[8];
    v19 = (uint64_t *)((char *)a1 + v17);
    v20 = (uint64_t *)((char *)a2 + v17);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = (char *)a1 + v18;
    v23 = (char *)a2 + v18;
    v24 = sub_245DC4A60();
    v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
    swift_bridgeObjectRetain();
    v25(v22, v23, v24);
    v26 = a3[9];
    v27 = a3[10];
    v28 = (uint64_t *)((char *)a1 + v26);
    v29 = (uint64_t *)((char *)a2 + v26);
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
    v31 = (char *)a1 + v27;
    v32 = (char *)a2 + v27;
    swift_bridgeObjectRetain();
    v25(v31, v32, v24);
    v33 = a3[11];
    v34 = *(void **)((char *)a2 + v33);
    *(uint64_t *)((char *)a1 + v33) = (uint64_t)v34;
    v35 = v34;
  }
  return a1;
}

void destroy for BackgroundTransferManager.Download(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);

  v4 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  v5 = a1 + a2[6];
  v6 = sub_245DC4BD4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  v7 = a1 + a2[8];
  v8 = sub_245DC4A60();
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  swift_bridgeObjectRelease();
  v9(a1 + a2[10], v8);

}

uint64_t initializeWithCopy for BackgroundTransferManager.Download(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;

  v6 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a1 + v8;
  v13 = a2 + v8;
  v14 = sub_245DC4BD4();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  swift_bridgeObjectRetain();
  v15(v12, v13, v14);
  v16 = a3[7];
  v17 = a3[8];
  v18 = (_QWORD *)(a1 + v16);
  v19 = (_QWORD *)(a2 + v16);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  v21 = a1 + v17;
  v22 = a2 + v17;
  v23 = sub_245DC4A60();
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  v24(v21, v22, v23);
  v25 = a3[9];
  v26 = a3[10];
  v27 = (_QWORD *)(a1 + v25);
  v28 = (_QWORD *)(a2 + v25);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  v30 = a1 + v26;
  v31 = a2 + v26;
  swift_bridgeObjectRetain();
  v24(v30, v31, v23);
  v32 = a3[11];
  v33 = *(void **)(a2 + v32);
  *(_QWORD *)(a1 + v32) = v33;
  v34 = v33;
  return a1;
}

uint64_t assignWithCopy for BackgroundTransferManager.Download(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
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
  void (*v21)(uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;

  v6 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_245DC4BD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  v14 = a3[7];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[8];
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_245DC4A60();
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 24);
  v21(v18, v19, v20);
  v22 = a3[9];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (_QWORD *)(a2 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21(a1 + a3[10], a2 + a3[10], v20);
  v25 = a3[11];
  v26 = *(void **)(a2 + v25);
  v27 = *(void **)(a1 + v25);
  *(_QWORD *)(a1 + v25) = v26;
  v28 = v26;

  return a1;
}

uint64_t initializeWithTake for BackgroundTransferManager.Download(uint64_t a1, uint64_t a2, int *a3)
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
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;

  v6 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_245DC4BD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_245DC4A60();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  v16 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  v15(a1 + v16, a2 + v16, v14);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithTake for BackgroundTransferManager.Download(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
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
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  v6 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_245DC4BD4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[7];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = a3[8];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = sub_245DC4A60();
  v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 40);
  v25(v22, v23, v24);
  v26 = a3[9];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (uint64_t *)(a2 + v26);
  v30 = *v28;
  v29 = v28[1];
  *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  v25(a1 + a3[10], a2 + a3[10], v24);
  v31 = a3[11];
  v32 = *(void **)(a1 + v31);
  *(_QWORD *)(a1 + v31) = *(_QWORD *)(a2 + v31);

  return a1;
}

uint64_t getEnumTagSinglePayload for BackgroundTransferManager.Download()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245DB8C80(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = sub_245DC4A84();
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
    v13 = sub_245DC4BD4();
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == (_DWORD)a2)
    {
      v8 = v13;
      v15 = a3[6];
    }
    else
    {
      v8 = sub_245DC4A60();
      v14 = *(_QWORD *)(v8 - 8);
      v15 = a3[8];
    }
    v10 = a1 + v15;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + a3[5] + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for BackgroundTransferManager.Download()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245DB8D5C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = sub_245DC4A84();
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
      *(_QWORD *)(a1 + a4[5] + 8) = (a2 - 1);
      return result;
    }
    v13 = sub_245DC4BD4();
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[6];
    }
    else
    {
      v10 = sub_245DC4A60();
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[8];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_245DB8E28()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_245DC4A84();
  if (v1 <= 0x3F)
  {
    result = sub_245DC4BD4();
    if (v2 <= 0x3F)
    {
      result = sub_245DC4A60();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_245DB8EE8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_245DC4A84();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_245DB8F98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(a2 + 20));
  return swift_bridgeObjectRelease();
}

uint64_t sub_245DB8FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v6 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_245DB906C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t sub_245DB9250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v6 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v7;
  v10 = a2 + v7;
  v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v10 + 32);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  return a1;
}

uint64_t sub_245DB92C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  v6 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  __swift_destroy_boxed_opaque_existential_1(a1 + v7);
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_245DB9354()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245DB9360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_245DC4A84();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 24);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_245DB93E0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245DB93EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_245DC4A84();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  return result;
}

uint64_t sub_245DB9468()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245DC4A84();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *keypath_get_selector_fractionCompleted()
{
  return sel_fractionCompleted;
}

id sub_245DB94F8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_fractionCompleted);
  *a2 = v4;
  return result;
}

char *keypath_get_selector_isFinished()
{
  return sel_isFinished;
}

id sub_245DB9534@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isFinished);
  *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_245DB9564()
{
  return objectdestroyTm((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_245DB9570(uint64_t a1, uint64_t a2)
{
  return sub_245DB95D0(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_245DB7FB0);
}

char *keypath_get_selector_isCancelled()
{
  return sel_isCancelled;
}

id sub_245DB9588@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isCancelled);
  *a2 = (_BYTE)result;
  return result;
}

uint64_t sub_245DB95B8()
{
  return objectdestroyTm(MEMORY[0x24BEE4FF0]);
}

uint64_t sub_245DB95C4(uint64_t a1, uint64_t a2)
{
  return sub_245DB95D0(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_245DB80FC);
}

uint64_t sub_245DB95D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, uint64_t))
{
  uint64_t v3;
  uint64_t v6;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for BackgroundTransferManager.Download(0) - 8) + 80);
  return a3(a1, a2, *(_QWORD *)(v3 + 16), v3 + ((v6 + 24) & ~v6));
}

uint64_t sub_245DB9630(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_245DB966C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BackgroundTransferManager._Transfer(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_245DB96B0()
{
  return objectdestroy_14Tm(MEMORY[0x24BEE4FF0]);
}

uint64_t sub_245DB96BC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for BackgroundTransferManager.Download(0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + ((v4 + 48) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_245DB9930;
  return sub_245DB6CDC(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_245DB9754()
{
  return objectdestroy_14Tm((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroy_14Tm(void (*a1)(_QWORD))
{
  uint64_t v1;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);

  v3 = (int *)type metadata accessor for BackgroundTransferManager.Download(0);
  v4 = *(unsigned __int8 *)(*((_QWORD *)v3 - 1) + 80);
  v5 = (v4 + 48) & ~v4;
  swift_unknownObjectRelease();

  a1(*(_QWORD *)(v1 + 40));
  v6 = v1 + v5;
  v7 = sub_245DC4A84();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v1 + v5, v7);
  swift_bridgeObjectRelease();
  v8 = v1 + v5 + v3[6];
  v9 = sub_245DC4BD4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  v10 = v6 + v3[8];
  v11 = sub_245DC4A60();
  v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v12(v10, v11);
  swift_bridgeObjectRelease();
  v12(v6 + v3[10], v11);

  return swift_deallocObject();
}

uint64_t sub_245DB9898(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for BackgroundTransferManager.Download(0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + ((v4 + 48) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_245DB9930;
  return sub_245DB6AE8(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_245DB9934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_245DC4D18();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_245DC4D0C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_245DB34B8(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245DC4D00();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t ServiceExtensionsErrorDomain.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t static _ServiceManager.shared.getter()
{
  if (qword_25751C1F8 != -1)
    swift_once();
  return swift_retain();
}

uint64_t _ServiceManager.deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return v0;
}

uint64_t _ServiceManager.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t _ServiceManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t _ServiceManager.ServiceExtensionsErrorCodes.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 1;
  return result;
}

uint64_t _ServiceManager.ServiceExtensionsErrorCodes.rawValue.getter()
{
  return 1;
}

uint64_t sub_245DB9B30()
{
  return 1;
}

uint64_t sub_245DB9B38()
{
  sub_245DC4F4C();
  sub_245DC4F58();
  return sub_245DC4F64();
}

uint64_t sub_245DB9B78()
{
  return sub_245DC4F58();
}

uint64_t sub_245DB9B9C()
{
  sub_245DC4F4C();
  sub_245DC4F58();
  return sub_245DC4F64();
}

_QWORD *sub_245DB9BD8@<X0>(_QWORD *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 1;
  return result;
}

void sub_245DB9BEC(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

ServiceExtensions::_ServiceManager::ServiceExtensionPointIdentifier_optional __swiftcall _ServiceManager.ServiceExtensionPointIdentifier.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  ServiceExtensions::_ServiceManager::ServiceExtensionPointIdentifier_optional result;
  char v5;

  v2 = v1;
  v3 = sub_245DC4EB0();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

unint64_t _ServiceManager.ServiceExtensionPointIdentifier.rawValue.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000020;
  if (*v0 != 1)
    v1 = 0xD000000000000024;
  if (*v0)
    return v1;
  else
    return 0xD000000000000027;
}

uint64_t sub_245DB9CB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_245DC4534(*a1, *a2);
}

uint64_t sub_245DB9CBC()
{
  return sub_245DC4630();
}

uint64_t sub_245DB9CC4()
{
  return sub_245DC46D4();
}

uint64_t sub_245DB9CCC()
{
  return sub_245DC4750();
}

ServiceExtensions::_ServiceManager::ServiceExtensionPointIdentifier_optional sub_245DB9CD4(Swift::String *a1)
{
  return _ServiceManager.ServiceExtensionPointIdentifier.init(rawValue:)(*a1);
}

unint64_t sub_245DB9CE0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;
  unint64_t v3;

  result = _ServiceManager.ServiceExtensionPointIdentifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_245DB9D04()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 160));
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
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

id _SEServiceManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t sub_245DB9DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  type metadata accessor for _ContentProcess(0);
  v6[7] = swift_task_alloc();
  v6[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DB9E68()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  if (qword_25751C1F8 != -1)
    swift_once();
  v1 = v0[4];
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier + 8);
  v0[9] = v3;
  v4 = (uint64_t *)(v1 + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  v5 = *v4;
  v6 = v4[1];
  v0[10] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v0[11] = v7;
  *v7 = v0;
  v7[1] = sub_245DB9F44;
  return _ServiceManager.contentProcess(serviceIdentifier:onInteruption:)(v0[8], v2, v3, v5, v6);
}

uint64_t sub_245DB9F44()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_245DB9FB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(id, _QWORD);
  objc_class *v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(void (**)(id, _QWORD))(v0 + 40);
  sub_245DB3B80(v1, v2, type metadata accessor for _ContentProcess);
  v4 = (objc_class *)type metadata accessor for _SEContentProcess(0);
  v5 = objc_allocWithZone(v4);
  sub_245DB3B80(v2, (uint64_t)v5 + OBJC_IVAR____SEContentProcess_inner, type metadata accessor for _ContentProcess);
  *(_QWORD *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v4;
  v6 = objc_msgSendSuper2((objc_super *)(v0 + 16), sel_init);
  sub_245DB1E18(v2, type metadata accessor for _ContentProcess);
  v3(v6, 0);

  sub_245DB1E18(v1, type metadata accessor for _ContentProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DBA09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  type metadata accessor for _NetworkProcess(0);
  v6[7] = swift_task_alloc();
  v6[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DBA108()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  if (qword_25751C1F8 != -1)
    swift_once();
  v1 = v0[4];
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier + 8);
  v0[9] = v3;
  v4 = (uint64_t *)(v1 + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  v5 = *v4;
  v6 = v4[1];
  v0[10] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v0[11] = v7;
  *v7 = v0;
  v7[1] = sub_245DBA1E4;
  return _ServiceManager.networkProcess(serviceIdentifier:onInteruption:)(v0[8], v2, v3, v5, v6);
}

uint64_t sub_245DBA1E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_245DBA258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(id, _QWORD);
  objc_class *v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(void (**)(id, _QWORD))(v0 + 40);
  sub_245DB3B80(v1, v2, type metadata accessor for _NetworkProcess);
  v4 = (objc_class *)type metadata accessor for _SENetworkProcess(0);
  v5 = objc_allocWithZone(v4);
  sub_245DB3B80(v2, (uint64_t)v5 + OBJC_IVAR____SENetworkProcess_inner, type metadata accessor for _NetworkProcess);
  *(_QWORD *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v4;
  v6 = objc_msgSendSuper2((objc_super *)(v0 + 16), sel_init);
  sub_245DB1E18(v2, type metadata accessor for _NetworkProcess);
  v3(v6, 0);

  sub_245DB1E18(v1, type metadata accessor for _NetworkProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DBA33C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  type metadata accessor for _GPUProcess(0);
  v6[7] = swift_task_alloc();
  v6[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245DBA3A8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  if (qword_25751C1F8 != -1)
    swift_once();
  v1 = v0[4];
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____SEServiceConfiguration_serviceIdentifier + 8);
  v0[9] = v3;
  v4 = (uint64_t *)(v1 + OBJC_IVAR____SEServiceConfiguration_interruptionHandler);
  v5 = *v4;
  v6 = v4[1];
  v0[10] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v0[11] = v7;
  *v7 = v0;
  v7[1] = sub_245DBA484;
  return _ServiceManager.gpuProcess(serviceIdentifier:onInteruption:)(v0[8], v2, v3, v5, v6);
}

uint64_t sub_245DBA484()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_245DBA4F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(id, _QWORD);
  objc_class *v4;
  id v5;
  id v6;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(void (**)(id, _QWORD))(v0 + 40);
  sub_245DB3B80(v1, v2, type metadata accessor for _GPUProcess);
  v4 = (objc_class *)type metadata accessor for _SEGPUProcess(0);
  v5 = objc_allocWithZone(v4);
  sub_245DB3B80(v2, (uint64_t)v5 + OBJC_IVAR____SEGPUProcess_inner, type metadata accessor for _GPUProcess);
  *(_QWORD *)(v0 + 16) = v5;
  *(_QWORD *)(v0 + 24) = v4;
  v6 = objc_msgSendSuper2((objc_super *)(v0 + 16), sel_init);
  sub_245DB1E18(v2, type metadata accessor for _GPUProcess);
  v3(v6, 0);

  sub_245DB1E18(v1, type metadata accessor for _GPUProcess);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245DBA5DC()
{
  uint64_t v0;
  void *v1;
  void (*v2)(_QWORD, void *);
  void *v3;

  v1 = *(void **)(v0 + 96);
  v2 = *(void (**)(_QWORD, void *))(v0 + 40);
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_245DC4A18();
  v2(0, v3);

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id _SEServiceManager.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _SEServiceManager();
  return objc_msgSendSuper2(&v2, sel_init);
}

id _SEServiceManager.__deallocating_deinit()
{
  return sub_245DBA870(type metadata accessor for _SEServiceManager);
}

void _SEServiceConfiguration.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _SEServiceConfiguration.__deallocating_deinit()
{
  return sub_245DBA870(type metadata accessor for _SEServiceConfiguration);
}

id sub_245DBA870(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_245DBA8A4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_245DBA908;
  return v6(a1);
}

uint64_t sub_245DBA908()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_245DBA960()
{
  unint64_t result;

  result = qword_25751C3B8;
  if (!qword_25751C3B8)
  {
    result = MEMORY[0x249547DD8](&protocol conformance descriptor for _ServiceManager.ServiceExtensionsErrorCodes, &type metadata for _ServiceManager.ServiceExtensionsErrorCodes);
    atomic_store(result, (unint64_t *)&qword_25751C3B8);
  }
  return result;
}

unint64_t sub_245DBA9A8()
{
  unint64_t result;

  result = qword_25751C3C0;
  if (!qword_25751C3C0)
  {
    result = MEMORY[0x249547DD8](&protocol conformance descriptor for _ServiceManager.ServiceExtensionPointIdentifier, &type metadata for _ServiceManager.ServiceExtensionPointIdentifier);
    atomic_store(result, (unint64_t *)&qword_25751C3C0);
  }
  return result;
}

uint64_t method lookup function for _ServiceManager()
{
  return swift_lookUpClassMethod();
}

uint64_t storeEnumTagSinglePayload for _ServiceManager.ServiceExtensionsErrorCodes(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_245DBAA38 + 4 * byte_245DC5D00[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_245DBAA58 + 4 * byte_245DC5D05[v4]))();
}

_BYTE *sub_245DBAA38(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_245DBAA58(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245DBAA60(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245DBAA68(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245DBAA70(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245DBAA78(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_245DBAA84()
{
  return 0;
}

ValueMetadata *type metadata accessor for _ServiceManager.ServiceExtensionsErrorCodes()
{
  return &type metadata for _ServiceManager.ServiceExtensionsErrorCodes;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _ServiceManager.ServiceExtensionPointIdentifier(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for _ServiceManager.ServiceExtensionPointIdentifier(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245DBAB84 + 4 * byte_245DC5D0F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_245DBABB8 + 4 * byte_245DC5D0A[v4]))();
}

uint64_t sub_245DBABB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DBABC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245DBABC8);
  return result;
}

uint64_t sub_245DBABD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245DBABDCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_245DBABE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DBABE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DBABF4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245DBABFC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for _ServiceManager.ServiceExtensionPointIdentifier()
{
  return &type metadata for _ServiceManager.ServiceExtensionPointIdentifier;
}

uint64_t method lookup function for _SEServiceManager()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for _SEServiceConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_245DBAC2C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_245DBAC50()
{
  uint64_t v0;

  return sub_245DBD3F0(*(_QWORD *)(v0 + 16));
}

uint64_t sub_245DBAC5C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_245DB851C;
  return sub_245DBA33C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_245DBACDC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245DBAD00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245DB851C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25751C3E8 + dword_25751C3E8))(a1, v4);
}

uint64_t sub_245DBAD74(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_245DB9930;
  return sub_245DBA09C(a1, v4, v5, v6, v7, v8);
}

uint64_t objectdestroy_20Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245DBAE2C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_245DB9930;
  return sub_245DB9DFC(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_245DBAEC4()
{
  sub_245DC4E38();
  swift_bridgeObjectRelease();
  sandbox_enable_local_state_flag();
  return sandbox_enable_local_state_flag();
}

uint64_t sub_245DBAF14()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t dispatch thunk of ContentServiceExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ContentServiceExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t _ProcessErrorCode.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = result != 0;
  return result;
}

uint64_t _ProcessErrorCode.rawValue.getter()
{
  return 0;
}

uint64_t sub_245DBAF94()
{
  sub_245DC4F4C();
  sub_245DC4F58();
  return sub_245DC4F64();
}

uint64_t sub_245DBAFD4()
{
  return sub_245DC4F58();
}

uint64_t sub_245DBAFF8()
{
  sub_245DC4F4C();
  sub_245DC4F58();
  return sub_245DC4F64();
}

_QWORD *sub_245DBB034@<X0>(_QWORD *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

void sub_245DBB048(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_245DBB054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  unint64_t v25;
  _DWORD v26[8];
  id v27[2];

  v27[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = sub_245DC4B98();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x249547544](v2);
  sub_245DC4BA4();
  v5 = sub_245DC4B80();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = HIDWORD(v5);
  v14 = HIDWORD(v7);
  v15 = HIDWORD(v9);
  v25 = HIDWORD(v11);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  v16 = (void *)objc_opt_self();
  v27[0] = 0;
  v26[0] = v6;
  v26[1] = v13;
  v26[2] = v8;
  v26[3] = v14;
  v26[4] = v10;
  v26[5] = v15;
  v26[6] = v12;
  v26[7] = v25;
  v17 = objc_msgSend(v16, sel_bundleRecordForAuditToken_error_, v26, v27);
  if (!v17)
  {
    v22 = v27[0];
    v23 = (void *)sub_245DC4A24();

    swift_willThrow();
    return 0;
  }
  v18 = v17;
  v19 = v27[0];
  v20 = objc_msgSend(v18, sel_bundleIdentifier);

  if (!v20)
    return 0;
  v21 = sub_245DC4CB8();

  return v21;
}

uint64_t _Process.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  unint64_t v26;
  _DWORD v27[8];
  id v28[2];

  v28[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_245DC4B98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  v8 = sub_245DC4B80();
  LODWORD(a2) = v8;
  v10 = v9;
  LODWORD(a1) = v11;
  v13 = v12;
  v14 = HIDWORD(v8);
  v15 = HIDWORD(v9);
  v16 = HIDWORD(v11);
  v26 = HIDWORD(v12);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v17 = (void *)objc_opt_self();
  v28[0] = 0;
  v27[0] = a2;
  v27[1] = v14;
  v27[2] = v10;
  v27[3] = v15;
  v27[4] = a1;
  v27[5] = v16;
  v27[6] = v13;
  v27[7] = v26;
  v18 = objc_msgSend(v17, sel_bundleRecordForAuditToken_error_, v27, v28);
  if (!v18)
  {
    v23 = v28[0];
    v24 = (void *)sub_245DC4A24();

    swift_willThrow();
    return 0;
  }
  v19 = v18;
  v20 = v28[0];
  v21 = objc_msgSend(v19, sel_bundleIdentifier);

  if (!v21)
    return 0;
  v22 = sub_245DC4CB8();

  return v22;
}

id sub_245DBB3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v8[0] = a1;
  v8[1] = a2;
  v8[2] = a3;
  v8[3] = a4;
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordForAuditToken_error_, v8, v9);
  if (v4)
  {
    v5 = v9[0];
  }
  else
  {
    v6 = v9[0];
    sub_245DC4A24();

    swift_willThrow();
  }
  return v4;
}

uint64_t sub_245DBB4C0@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return _ExtensionProcess.grant(capability:)(a1, a2, a3, a4);
}

uint64_t _NetworkProcess.makeLibXPCConnection()()
{
  return sub_245DB306C();
}

Swift::Void __swiftcall _NetworkProcess.invalidateLaunchAssertion()()
{
  sub_245DBB570(type metadata accessor for _NetworkProcess);
}

uint64_t sub_245DBB50C()
{
  return sub_245DBB054();
}

uint64_t _GPUProcess.makeLibXPCConnection()()
{
  return sub_245DB306C();
}

id _GPUProcess.createVisibilityPropagationInteraction()()
{
  return sub_245DBB6D0();
}

Swift::Void __swiftcall _GPUProcess.invalidateLaunchAssertion()()
{
  sub_245DBB570(type metadata accessor for _GPUProcess);
}

void sub_245DBB570(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  os_unfair_lock_s *v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = sub_245DC4B38();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD **)(v1 + *(int *)(a1(0) + 20));
  v8 = (os_unfair_lock_s *)(v7[4] + 16);
  os_unfair_lock_lock(v8);
  v9 = (void (*)(uint64_t))v7[2];
  if (v9)
  {
    v10 = swift_retain();
    v9(v10);
    sub_245DC4B20();
    sub_245DB4668((uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v11 = v7[2];
    v7[2] = 0;
    v7[3] = 0;
    sub_245DB4668(v11);
  }
  os_unfair_lock_unlock(v8);
}

uint64_t _ContentProcess.makeLibXPCConnection()()
{
  return sub_245DB306C();
}

uint64_t _s17ServiceExtensions15_NetworkProcessV11_auditToken0aB4Core05AuditF0Vvg_0()
{
  MEMORY[0x249547544]();
  return sub_245DC4BA4();
}

id _ContentProcess.createVisibilityPropagationInteraction()()
{
  return sub_245DBB6D0();
}

id sub_245DBB6D0()
{
  unsigned int v0;
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  id v8;
  audit_token_t v10;

  *(_QWORD *)v10.val = MEMORY[0x249547544]();
  v10.val[2] = v0;
  v10.val[3] = v1;
  v10.val[4] = v2;
  v10.val[5] = v3;
  v10.val[6] = v4;
  v10.val[7] = v5;
  v6 = audit_token_to_pid(&v10);
  v7 = (void *)sub_245DC4CAC();
  v8 = objc_msgSend((id)objc_opt_self(), sel_interactionWithPID_environmentIdentifier_, v6, v7);

  return v8;
}

Swift::Void __swiftcall _ContentProcess.invalidateLaunchAssertion()()
{
  sub_245DBB570(type metadata accessor for _ContentProcess);
}

uint64_t _BrowserProcess._auditToken.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_245DC4B98();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t _BrowserProcess.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v14;
  uint64_t v15;

  v15 = a1;
  v1 = sub_245DC4BB0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for _BrowserProcess(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_245DC4B98();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245DC4B8C();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BE85448], v1);
  v12 = sub_245DC4B68();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if ((v12 & 1) != 0)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v7, v11, v8);
    return sub_245DBB9B4((uint64_t)v7, v15);
  }
  else
  {
    sub_245DBB970();
    swift_allocError();
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t type metadata accessor for _BrowserProcess(uint64_t a1)
{
  return sub_245DB4778(a1, (uint64_t *)&unk_25441B2E0);
}

unint64_t sub_245DBB970()
{
  unint64_t result;

  result = qword_25441B2D0;
  if (!qword_25441B2D0)
  {
    result = MEMORY[0x249547DD8](&unk_245DC631C, &type metadata for _BrowserProcess.Error);
    atomic_store(result, (unint64_t *)&qword_25441B2D0);
  }
  return result;
}

uint64_t sub_245DBB9B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for _BrowserProcess(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _BrowserProcess.init(auditToken:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char v18;
  void (*v20)(char *, uint64_t);
  uint64_t v21[6];

  v21[2] = a1;
  v21[5] = a3;
  v21[3] = a2;
  v21[0] = a4;
  v4 = sub_245DC4BB0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for _BrowserProcess(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_245DC4B98();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v21 - v16;
  sub_245DC4BA4();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BE85448], v4);
  v18 = sub_245DC4B68();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v18 & 1) != 0)
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v10, v15, v11);
    sub_245DBB9B4((uint64_t)v10, v21[0]);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }
  else
  {
    sub_245DBB970();
    swift_allocError();
    swift_willThrow();
    v20 = *(void (**)(char *, uint64_t))(v12 + 8);
    v20(v15, v11);
    return ((uint64_t (*)(char *, uint64_t))v20)(v17, v11);
  }
}

uint64_t sub_245DBBBF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_245DC4B98();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_245DBBC2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  sub_245DB431C(0, &qword_25751C490);
  v0 = sub_245DC4B80();
  v5 = sub_245DBB3BC(v0, v1, v2, v3);
  v6 = objc_msgSend(v5, sel_bundleIdentifier);

  if (!v6)
    return 0;
  v4 = sub_245DC4CB8();

  return v4;
}

uint64_t sub_245DBBCDC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441B2D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static _BrowserProcess.checkBrowserEngineEntitlement(forAuditToken:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441B2D8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  _BrowserProcess.init(auditToken:)(a2, a3, a4, (uint64_t)v9);
  v10 = type metadata accessor for _BrowserProcess(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  sub_245DBBCDC((uint64_t)v9);
  return 1;
}

uint64_t _s17ServiceExtensions15_BrowserProcessV05checkc27EngineEntitlementForCurrentD0SbyFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441B2D8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  _BrowserProcess.init()((uint64_t)v2);
  v3 = type metadata accessor for _BrowserProcess(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 0, 1, v3);
  sub_245DBBCDC((uint64_t)v2);
  return 1;
}

void sub_245DBBEE8()
{
  sub_245DC4E68();
  __break(1u);
}

id _SEExtensionProcess.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _SEExtensionProcess();
  return objc_msgSendSuper2(&v2, sel_init);
}

id _SEExtensionProcess.__deallocating_deinit(uint64_t a1)
{
  return sub_245DBC0A0(a1, type metadata accessor for _SEExtensionProcess);
}

id sub_245DBC090()
{
  return sub_245DBC0A0(0, type metadata accessor for _SEInternalGrant);
}

id sub_245DBC0A0(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

id sub_245DBC0D0()
{
  return sub_245DBC1B8(type metadata accessor for _ContentProcess, &OBJC_IVAR____SEContentProcess_inner);
}

void _SEContentProcess.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245DBC154()
{
  uint64_t v0;

  return sub_245DB1E18(v0 + OBJC_IVAR____SEContentProcess_inner, type metadata accessor for _ContentProcess);
}

id _SEContentProcess.__deallocating_deinit()
{
  return sub_245DBC0A0(0, (uint64_t (*)(void))type metadata accessor for _SEContentProcess);
}

id sub_245DBC18C()
{
  return sub_245DBC1B8(type metadata accessor for _GPUProcess, &OBJC_IVAR____SEGPUProcess_inner);
}

id sub_245DBC1B8(uint64_t (*a1)(_QWORD), _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  id v17;
  audit_token_t atoken;

  v5 = a1(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&atoken - v6;
  v8 = sub_245DB3B80(v2 + *a2, (uint64_t)&atoken - v6, a1);
  *(_QWORD *)atoken.val = MEMORY[0x249547544](v8);
  atoken.val[2] = v9;
  atoken.val[3] = v10;
  atoken.val[4] = v11;
  atoken.val[5] = v12;
  atoken.val[6] = v13;
  atoken.val[7] = v14;
  v15 = audit_token_to_pid(&atoken);
  v16 = (void *)sub_245DC4CAC();
  v17 = objc_msgSend((id)objc_opt_self(), sel_interactionWithPID_environmentIdentifier_, v15, v16);

  sub_245DB1E18((uint64_t)v7, a1);
  return v17;
}

id sub_245DBC2C0(void *a1, uint64_t a2, void (*a3)(_QWORD), _QWORD *a4)
{
  uint64_t v7;
  char *v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  id v18;
  audit_token_t atoken;

  a3(0);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&atoken - v7;
  sub_245DB3B80((uint64_t)a1 + *a4, (uint64_t)&atoken - v7, (uint64_t (*)(_QWORD))a3);
  v9 = a1;
  *(_QWORD *)atoken.val = MEMORY[0x249547544]();
  atoken.val[2] = v10;
  atoken.val[3] = v11;
  atoken.val[4] = v12;
  atoken.val[5] = v13;
  atoken.val[6] = v14;
  atoken.val[7] = v15;
  v16 = audit_token_to_pid(&atoken);
  v17 = (void *)sub_245DC4CAC();
  v18 = objc_msgSend((id)objc_opt_self(), sel_interactionWithPID_environmentIdentifier_, v16, v17);

  sub_245DB1E18((uint64_t)v8, (uint64_t (*)(_QWORD))a3);
  return v18;
}

id _SEGPUProcess.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void _SEGPUProcess.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245DBC44C()
{
  uint64_t v0;

  return sub_245DB1E18(v0 + OBJC_IVAR____SEGPUProcess_inner, type metadata accessor for _GPUProcess);
}

id _SEGPUProcess.__deallocating_deinit()
{
  return sub_245DBC0A0(0, (uint64_t (*)(void))type metadata accessor for _SEGPUProcess);
}

void _SENetworkProcess.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245DBC504()
{
  uint64_t v0;

  return sub_245DB1E18(v0 + OBJC_IVAR____SENetworkProcess_inner, type metadata accessor for _NetworkProcess);
}

id _SENetworkProcess.__deallocating_deinit()
{
  return sub_245DBC0A0(0, (uint64_t (*)(void))type metadata accessor for _SENetworkProcess);
}

void _SEBrowserProcess.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _SEBrowserProcess.__deallocating_deinit()
{
  return sub_245DBC0A0(0, (uint64_t (*)(void))type metadata accessor for _SEBrowserProcess);
}

uint64_t type metadata accessor for _SEBrowserProcess(uint64_t a1)
{
  return sub_245DB4778(a1, (uint64_t *)&unk_25441B2F0);
}

unint64_t sub_245DBC6B8()
{
  unint64_t result;

  result = qword_25751C418;
  if (!qword_25751C418)
  {
    result = MEMORY[0x249547DD8](&protocol conformance descriptor for _ProcessErrorCode, &type metadata for _ProcessErrorCode);
    atomic_store(result, (unint64_t *)&qword_25751C418);
  }
  return result;
}

ValueMetadata *type metadata accessor for _ProcessErrorCode()
{
  return &type metadata for _ProcessErrorCode;
}

uint64_t dispatch thunk of _Process.processIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of _Process._auditToken.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of _Process.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _ExtensionProcess.makeLibXPCConnection()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of _ExtensionProcess.grant(capabilities:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of _ExtensionProcess.grant(capability:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of _ExtensionProcess.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of _ExtensionProcess.auditToken.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of _ExtensionProcess.invalidateLaunchAssertion()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t getEnumTagSinglePayload for _NetworkProcess()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for _NetworkProcess()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t getEnumTagSinglePayload for _GPUProcess()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for _GPUProcess()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *_s17ServiceExtensions15_NetworkProcessVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_245DC4B38();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t _s17ServiceExtensions15_NetworkProcessVwca_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_245DC4B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s17ServiceExtensions15_NetworkProcessVwtk_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_245DC4B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s17ServiceExtensions15_NetworkProcessVwta_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_245DC4B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ContentProcess()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_245DC4B38();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for _ContentProcess()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_245DC4B38();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for _BrowserProcess(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245DC4B98();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for _BrowserProcess(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245DC4B98();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for _BrowserProcess(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245DC4B98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for _BrowserProcess(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245DC4B98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for _BrowserProcess(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245DC4B98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for _BrowserProcess(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245DC4B98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for _BrowserProcess()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245DBCC30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245DC4B98();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for _BrowserProcess()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245DBCC78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245DC4B98();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_245DBCCB8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245DC4B98();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t method lookup function for _SEExtensionProcess()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_245DBCD2C()
{
  return type metadata accessor for _SEContentProcess(0);
}

uint64_t method lookup function for _SEContentProcess()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_245DBCD40()
{
  return type metadata accessor for _SEGPUProcess(0);
}

uint64_t method lookup function for _SEGPUProcess()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _SEGPUProcess.createVisibilityPropagationInteraction()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t sub_245DBCD70()
{
  return type metadata accessor for _SENetworkProcess(0);
}

uint64_t method lookup function for _SENetworkProcess()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_245DBCDAC()
{
  return type metadata accessor for _SEBrowserProcess(0);
}

uint64_t sub_245DBCDB4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245DC4B98();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for _SEBrowserProcess()
{
  return swift_lookUpClassMethod();
}

uint64_t _s17ServiceExtensions17_ProcessErrorCodeOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_245DBD02C + 4 * asc_245DC5FC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_245DBD04C + 4 * byte_245DC5FC5[v4]))();
}

_BYTE *sub_245DBD02C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_245DBD04C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245DBD054(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245DBD05C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245DBD064(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245DBD06C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for _BrowserProcess.Error()
{
  return &type metadata for _BrowserProcess.Error;
}

unint64_t sub_245DBD08C()
{
  unint64_t result;

  result = qword_25751C488;
  if (!qword_25751C488)
  {
    result = MEMORY[0x249547DD8](&unk_245DC62F4, &type metadata for _BrowserProcess.Error);
    atomic_store(result, (unint64_t *)&qword_25751C488);
  }
  return result;
}

uint64_t sub_245DBD0D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  unint64_t v24;
  _DWORD v25[8];
  id v26[2];

  v26[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = sub_245DC4B98();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245DC4B8C();
  v4 = sub_245DC4B80();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = HIDWORD(v4);
  v13 = HIDWORD(v6);
  v14 = HIDWORD(v8);
  v24 = HIDWORD(v10);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v15 = (void *)objc_opt_self();
  v26[0] = 0;
  v25[0] = v5;
  v25[1] = v12;
  v25[2] = v7;
  v25[3] = v13;
  v25[4] = v9;
  v25[5] = v14;
  v25[6] = v11;
  v25[7] = v24;
  v16 = objc_msgSend(v15, sel_bundleRecordForAuditToken_error_, v25, v26);
  if (!v16)
  {
    v21 = v26[0];
    v22 = (void *)sub_245DC4A24();

    swift_willThrow();
    return 0;
  }
  v17 = v16;
  v18 = v26[0];
  v19 = objc_msgSend(v17, sel_bundleIdentifier);

  if (!v19)
    return 0;
  v20 = sub_245DC4CB8();

  return v20;
}

Swift::Bool __swiftcall _BrowserEngineEntitlement.check(auditToken:)(audit_token_t_optional *auditToken)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[36];

  sub_245DBD3A8((uint64_t)auditToken, (uint64_t)&v9);
  v2 = sub_245DC4B98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245DBD3A8((uint64_t)auditToken, (uint64_t)v10);
  if (v10[32] == 1)
  {
    sub_245DC4B8C();
    sub_245DC4B80();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_245DC4BA4();
  v6 = sub_245DC4B68();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6 & 1;
}

uint64_t sub_245DBD3A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25751C4C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_245DBD3F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_245DBD3F8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_t v24;
  uint64_t (*v25)(_QWORD);
  uint64_t v26[5];
  _BYTE v27[96];
  _QWORD *v28;

  v28 = a4;
  v9 = sub_245DC4B38();
  v22 = *(_QWORD *)(v9 - 8);
  v23 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = a2;
  v12 = a2(0);
  v13 = *(_QWORD **)(v4 + *(int *)(v12 + 20));
  v24 = (os_unfair_lock_t)(v13[4] + 16);
  os_unfair_lock_lock(v24);
  v14 = (void (*)(uint64_t))v13[2];
  if (v14)
  {
    v21 = v5;
    v15 = swift_retain();
    v20 = v12;
    v14(v15);
    sub_245DC4B20();
    v12 = v20;
    sub_245DB4668((uint64_t)v14);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v23);
    v16 = v13[2];
    v13[2] = 0;
    v13[3] = 0;
    sub_245DB4668(v16);
  }
  os_unfair_lock_unlock(v24);
  sub_245DB46BC(a1, (uint64_t)v27);
  v26[3] = v12;
  v26[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v26);
  sub_245DB3B80(v4, (uint64_t)boxed_opaque_existential_1, v25);
  sub_245DBD964(v26, v28);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
}

uint64_t _ExtensionProcess.grant(capability:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_245DBD5AC(a1, a2, a3, a4);
}

uint64_t _ExtensionProcess.grant(capabilities:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  return sub_245DBD5AC(a1, a2, a3, a4);
}

uint64_t sub_245DBD5AC@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v16 = a1[1];
  v17 = *a1;
  v14 = a1[3];
  v15 = a1[2];
  v8 = *((_QWORD *)a1 + 8);
  v9 = *((_QWORD *)a1 + 9);
  v10 = *((_BYTE *)a1 + 80);
  (*(void (**)(uint64_t, uint64_t))(a3 + 56))(a2, a3);
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  v23 = v8;
  v24 = v9;
  v25 = v10;
  v11 = *(_QWORD *)(a3 + 8);
  v18[3] = a2;
  v18[4] = v11;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(boxed_opaque_existential_1, v4, a2);
  sub_245DBD964(v18, a4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
}

id _Capability.Grant.valid.getter()
{
  id *v0;

  return objc_msgSend(*v0, sel_isValid);
}

uint64_t sub_245DBD6BC()
{
  uint64_t v0;

  v0 = sub_245DC4BF8();
  __swift_allocate_value_buffer(v0, qword_25751C7A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25751C7A0);
  return sub_245DC4BEC();
}

BOOL static ServiceExtensionError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ServiceExtensionError.hash(into:)()
{
  return sub_245DC4F58();
}

uint64_t ServiceExtensionError.hashValue.getter()
{
  sub_245DC4F4C();
  sub_245DC4F58();
  return sub_245DC4F64();
}

BOOL sub_245DBD7B0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_245DBD7C4()
{
  sub_245DC4F4C();
  sub_245DC4F58();
  return sub_245DC4F64();
}

uint64_t sub_245DBD808()
{
  return sub_245DC4F58();
}

uint64_t sub_245DBD830()
{
  sub_245DC4F4C();
  sub_245DC4F58();
  return sub_245DC4F64();
}

id sub_245DBD954()
{
  return sub_245DBC0A0(0, type metadata accessor for _Capability.AssertionObserver);
}

uint64_t sub_245DBD964@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)v2;
  v5 = *(_QWORD *)(v2 + 8);
  v7 = *(unsigned __int8 *)(v2 + 80);
  if (v7 == 3)
  {
    swift_bridgeObjectRetain();
    sub_245DBDB08(a1, v6, v5, a2);
    return swift_bridgeObjectRelease();
  }
  else if (v7 == 2)
  {
    v10 = *(_QWORD *)(v2 + 64);
    v11 = *(_QWORD *)(v2 + 48);
    sub_245DB4A48(v11);
    sub_245DB4A48(v10);
    sub_245DB4A48(v11);
    sub_245DB4A48(v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_245DB484C(a1, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_245DB4668(v10);
    sub_245DB4668(v11);
    sub_245DB4668(v10);
    return sub_245DB4668(v11);
  }
  else
  {
    sub_245DC04B4();
    swift_allocError();
    *v9 = 3;
    return swift_willThrow();
  }
}

void sub_245DBDB08(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C5A0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_245DC6360;
  *(_QWORD *)(v7 + 32) = objc_msgSend((id)objc_opt_self(), sel_attributeWithCompletionPolicy_, 1);
  sub_245DC4CF4();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_245DC6360;
  if (v7 >> 62)
  {
    sub_245DB431C(0, &qword_25751C5A8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_245DC4E74();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_245DC4EEC();
    sub_245DB431C(0, &qword_25751C5A8);
  }
  swift_bridgeObjectRelease();
  v9 = (void *)sub_245DC4CAC();
  v10 = (void *)sub_245DC4CAC();
  swift_bridgeObjectRelease();
  sub_245DB431C(0, &qword_25751C5A8);
  v11 = (void *)sub_245DC4CE8();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend((id)objc_opt_self(), sel_grantWithNamespace_sourceEnvironment_attributes_, v9, v10, v11);

  *(_QWORD *)(v8 + 32) = v12;
  sub_245DC4CF4();
  swift_bridgeObjectRetain();
  if (v8 >> 62)
  {
    sub_245DC4E74();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_245DC4EEC();
  }
  swift_bridgeObjectRelease();
  v13 = sub_245DB4BAC(a1, a2, a3);
  swift_bridgeObjectRelease();
  if (!v15)
    sub_245DB4A58(v13, (uint64_t)nullsub_1, 0, (uint64_t)nullsub_1, 0, a4);
}

uint64_t sub_245DBDDD8(char a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t result;
  uint64_t v19;
  char *v20;
  _BYTE *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  char *v24;
  char *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  id v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  char v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  uint64_t v41;
  char *v42;
  char *v43;
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
  unint64_t v54;
  uint64_t v55;
  uint64_t v56[10];
  char v57;
  uint64_t v58;
  char v59;

  v52 = sub_245DC4BF8();
  v3 = *(_QWORD *)(v52 - 8);
  v4 = MEMORY[0x24BDAC7A8](v52);
  MEMORY[0x24BDAC7A8](v4);
  v7 = *(_QWORD *)v1;
  v8 = *(_QWORD *)(v1 + 8);
  v10 = *(_QWORD *)(v1 + 16);
  v9 = *(_QWORD *)(v1 + 24);
  v11 = *(_QWORD *)(v1 + 32);
  v12 = *(_QWORD *)(v1 + 40);
  v13 = *(_QWORD *)(v1 + 48);
  v14 = *(_QWORD *)(v1 + 56);
  v16 = *(_QWORD *)(v1 + 64);
  v15 = *(_QWORD *)(v1 + 72);
  v17 = *(unsigned __int8 *)(v1 + 80);
  v48 = v3;
  v50 = v13;
  v51 = v14;
  v47 = v12;
  v46 = v11;
  v45 = v9;
  v44 = v10;
  v53 = v15;
  v54 = v8;
  v49 = v7;
  LODWORD(v43) = v17;
  if ((a1 & 1) != 0)
  {
    v42 = (char *)&v36 - v5;
    v56[0] = v7;
    v56[1] = v8;
    v56[2] = v10;
    v56[3] = v9;
    v56[4] = v11;
    v56[5] = v12;
    v56[6] = v13;
    v56[7] = v14;
    v56[8] = v16;
    v56[9] = v15;
    v57 = v17;
    sub_245DBEAA4();
    return 1;
  }
  v55 = v16;
  if (v17 == 3)
  {
    sub_245DBFC68();
    v42 = 0;
    return 1;
  }
  if (v17 == 2)
  {
    v19 = v6;
    sub_245DC04B4();
    v20 = (char *)swift_allocError();
    *v21 = 2;
    v42 = v20;
    swift_willThrow();
    if (qword_25751C208 != -1)
      swift_once();
    v22 = __swift_project_value_buffer(v52, (uint64_t)qword_25751C7A0);
    v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v41 = v19;
    v23(v19, v22, v52);
    sub_245DBFF3C(v49, v54, v10, v9, v11, v12, v50, v51, v55, v53, 2);
    v24 = v42;
    sub_245DBFF3C(v49, v54, v10, v9, v11, v12, v50, v51, v55, v53, 2);
    v25 = v42;
    v26 = sub_245DC4BE0();
    v39 = sub_245DC4D3C();
    v40 = v26;
    if (!os_log_type_enabled(v26, (os_log_type_t)v39))
    {

      sub_245DB3AA4(v49, v54, v44, v45, v46, v47, v50, v51, v55, v53, (char)v43);
      sub_245DB3AA4(v49, v54, v44, v45, v46, v47, v50, v51, v55, v53, (char)v43);

      goto LABEL_13;
    }
    v27 = v53;
    v28 = v49;
    v29 = swift_slowAlloc();
    v37 = (_QWORD *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v56[0] = v38;
    *(_DWORD *)v29 = 136315394;
    v30 = (char)v43;
    if ((_DWORD)v43 == 3)
    {
      swift_bridgeObjectRetain();
      v58 = sub_245DBF388(v28, v54, v56);
      v43 = &v59;
      sub_245DC4D84();
      swift_bridgeObjectRelease();
      v36 = v29;
      sub_245DB3AA4(v28, v54, v44, v45, v46, v47, v50, v51, v55, v27, 3);
      sub_245DB3AA4(v28, v54, v44, v45, v46, v47, v50, v51, v55, v27, 3);
      *(_WORD *)(v29 + 12) = 2114;
      v31 = v42;
      v32 = v42;
      v33 = _swift_stdlib_bridgeErrorToNSError();
      v58 = v33;
      sub_245DC4D84();
      v34 = v37;
      *v37 = v33;

      _os_log_impl(&dword_245DAF000, v40, (os_log_type_t)v39, "Error invalidating root endowment for:%s  %{public}@", (uint8_t *)v29, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25751C570);
      swift_arrayDestroy();
      MEMORY[0x249547E50](v34, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x249547E50](v38, -1, -1);
      MEMORY[0x249547E50](v29, -1, -1);

LABEL_13:
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v41, v52);
      return 0;
    }
    if ((_DWORD)v43 == 2)
    {

      sub_245DB3AA4(v28, v54, v44, v45, v46, v47, v50, v51, v55, v27, 2);
      sub_245DC4E68();
      __break(1u);
    }
    v35 = v30;

    sub_245DB3AA4(v28, v54, v44, v45, v46, v47, v50, v51, v55, v27, v35);
    sub_245DBFF3C(v28, v54, v44, v45, v46, v47, v50, v51, v55, v27, (char)v43);
  }
  result = sub_245DC4ED4();
  __break(1u);
  return result;
}

uint64_t sub_245DBEAA4()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t inited;
  unint64_t v8;
  uint64_t result;
  _BYTE *v10;

  v1 = *(unsigned __int8 *)(v0 + 80);
  if (v1 == 2)
  {
LABEL_6:
    sub_245DC04B4();
    swift_allocError();
    *v10 = v1;
    return swift_willThrow();
  }
  if (v1 == 3)
  {
    v3 = *(_QWORD *)(v0 + 16);
    v2 = *(_QWORD *)(v0 + 24);
    v4 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v5 = objc_msgSend(v4, sel_mainBundle);
    v6 = objc_msgSend(v5, sel_bundleIdentifier);

    if (v6)
    {

      __swift_instantiateConcreteTypeFromMangledName(&qword_25751C580);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_245DC5A40;
      *(_QWORD *)(inited + 32) = 0xD000000000000010;
      *(_QWORD *)(inited + 40) = 0x8000000245DC6EB0;
      *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(inited + 48) = v3;
      *(_QWORD *)(inited + 56) = v2;
      v8 = sub_245DC06F8(inited);
      sub_245DBEC2C(v8);
      swift_bridgeObjectRelease();
      sub_245DBFB24();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    LOBYTE(v1) = 1;
    goto LABEL_6;
  }
  result = sub_245DC4ED4();
  __break(1u);
  return result;
}

uint64_t sub_245DBEC2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25751C588);
    v2 = sub_245DC4E98();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_245DC04F8(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_245DC0534(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_245DC0534(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_245DC0534(v36, v37);
    sub_245DC0534(v37, &v33);
    result = sub_245DC4DF0();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_245DC0534(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_245DC0544();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

id static _SECapability.assertion(domain:name:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v8;
  char *v9;
  char *v10;
  objc_super v12;

  v8 = (objc_class *)type metadata accessor for _SECapability();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = &v9[OBJC_IVAR____SECapability_inner];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  *((_QWORD *)v10 + 2) = a3;
  *((_QWORD *)v10 + 3) = a4;
  *((_QWORD *)v10 + 4) = 0;
  *((_QWORD *)v10 + 5) = 0;
  *((_QWORD *)v10 + 6) = nullsub_1;
  *((_QWORD *)v10 + 7) = 0;
  *((_QWORD *)v10 + 8) = nullsub_1;
  *((_QWORD *)v10 + 9) = 0;
  v10[80] = 2;
  v12.receiver = v9;
  v12.super_class = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v12, sel_init);
}

id static _SECapability.assertion(domain:name:environmentIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v12;
  char *v13;
  char *v14;
  objc_super v16;

  v12 = (objc_class *)type metadata accessor for _SECapability();
  v13 = (char *)objc_allocWithZone(v12);
  v14 = &v13[OBJC_IVAR____SECapability_inner];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  *((_QWORD *)v14 + 2) = a3;
  *((_QWORD *)v14 + 3) = a4;
  *((_QWORD *)v14 + 4) = a5;
  *((_QWORD *)v14 + 5) = a6;
  *((_QWORD *)v14 + 6) = nullsub_1;
  *((_QWORD *)v14 + 7) = 0;
  *((_QWORD *)v14 + 8) = nullsub_1;
  *((_QWORD *)v14 + 9) = 0;
  v14[80] = 2;
  v16.receiver = v13;
  v16.super_class = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v16, sel_init);
}

id static _SECapability.assertion(domain:name:environmentIdentifier:willInvalidate:didInvalidate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  objc_class *v17;
  char *v18;
  char *v19;
  objc_super v22;

  v17 = (objc_class *)type metadata accessor for _SECapability();
  v18 = (char *)objc_allocWithZone(v17);
  v19 = &v18[OBJC_IVAR____SECapability_inner];
  *(_QWORD *)v19 = a1;
  *((_QWORD *)v19 + 1) = a2;
  *((_QWORD *)v19 + 2) = a3;
  *((_QWORD *)v19 + 3) = a4;
  *((_QWORD *)v19 + 4) = a5;
  *((_QWORD *)v19 + 5) = a6;
  *((_QWORD *)v19 + 6) = a7;
  *((_QWORD *)v19 + 7) = a8;
  *((_QWORD *)v19 + 8) = a9;
  *((_QWORD *)v19 + 9) = a10;
  v19[80] = 2;
  v22.receiver = v18;
  v22.super_class = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return objc_msgSendSuper2(&v22, sel_init);
}

uint64_t sub_245DBF240(char a1)
{
  return sub_245DBDDD8(a1) & 1;
}

id _SECapability.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void _SECapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _SECapability.__deallocating_deinit(uint64_t a1)
{
  return sub_245DBC0A0(a1, type metadata accessor for _SECapability);
}

id _SECapabilities.__deallocating_deinit(uint64_t a1)
{
  return sub_245DBC0A0(a1, type metadata accessor for _SECapabilities);
}

uint64_t sub_245DBF388(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_245DBF458(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_245DC04F8((uint64_t)v12, *a3);
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
      sub_245DC04F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_245DBF458(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_245DC4D90();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_245DBF610(a5, a6);
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
  v8 = sub_245DC4E50();
  if (!v8)
  {
    sub_245DC4E5C();
    __break(1u);
LABEL_17:
    result = sub_245DC4EA4();
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

uint64_t sub_245DBF610(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_245DBF6A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_245DBF87C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_245DBF87C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_245DBF6A4(uint64_t a1, unint64_t a2)
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
      v3 = sub_245DBF818(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_245DC4E44();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_245DC4E5C();
      __break(1u);
LABEL_10:
      v2 = sub_245DC4CDC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_245DC4EA4();
    __break(1u);
LABEL_14:
    result = sub_245DC4E5C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245DBF818(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25751C590);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_245DBF87C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25751C590);
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
  result = sub_245DC4EA4();
  __break(1u);
  return result;
}

id sub_245DBF9C8(void *a1)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C580);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_245DC6370;
  v3 = sub_245DC4CB8();
  v4 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 32) = v3;
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)(inited + 72) = v4;
  *(_QWORD *)(inited + 48) = 0xD00000000000001BLL;
  *(_QWORD *)(inited + 56) = 0x8000000245DC7110;
  *(_QWORD *)(inited + 80) = sub_245DC4CB8();
  *(_QWORD *)(inited + 88) = v6;
  *(_QWORD *)(inited + 120) = sub_245DB431C(0, (unint64_t *)&unk_25751C5B0);
  *(_QWORD *)(inited + 96) = a1;
  v7 = a1;
  sub_245DC06F8(inited);
  v8 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v9 = (void *)sub_245DC4CAC();
  v10 = (void *)sub_245DC4C7C();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v8, sel_initWithDomain_code_userInfo_, v9, 0, v10);

  return v11;
}

id sub_245DBFB24()
{
  id result;
  void *v1;
  void *v2;
  void *v3;
  signed int v4;
  id v5;
  void *v6;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedAVSystemController);
  if (result)
  {
    v1 = result;
    v2 = (void *)sub_245DC4CAC();
    v3 = (void *)sub_245DC4C7C();
    v4 = objc_msgSend(v1, sel_grantMediaEndowmentWithEnvironmentID_endowmentPayload_, v2, v3);

    result = (id)sub_245DC4C1C();
    if (v4 != (_DWORD)result)
    {
      sub_245DC4CB8();
      v5 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v6 = (void *)sub_245DC4CAC();
      swift_bridgeObjectRelease();
      objc_msgSend(v5, sel_initWithDomain_code_userInfo_, v6, v4, 0);

      return (id)swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_245DBFC68()
{
  id result;
  void *v1;
  void *v2;
  signed int v3;
  id v4;
  void *v5;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedAVSystemController);
  if (result)
  {
    v1 = result;
    v2 = (void *)sub_245DC4CAC();
    v3 = objc_msgSend(v1, sel_revokeMediaEndowmentWithEnvironmentID_, v2);

    result = (id)sub_245DC4C1C();
    if (v3 != (_DWORD)result)
    {
      sub_245DC4CB8();
      v4 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v5 = (void *)sub_245DC4CAC();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v5, v3, 0);

      return (id)swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for _SECapabilities()
{
  return objc_opt_self();
}

unint64_t sub_245DBFD9C()
{
  unint64_t result;

  result = qword_25751C4E8;
  if (!qword_25751C4E8)
  {
    result = MEMORY[0x249547DD8](&protocol conformance descriptor for ServiceExtensionError, &type metadata for ServiceExtensionError);
    atomic_store(result, (unint64_t *)&qword_25751C4E8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ServiceExtensionError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ServiceExtensionError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245DBFEBC + 4 * byte_245DC6395[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_245DBFEF0 + 4 * byte_245DC6390[v4]))();
}

uint64_t sub_245DBFEF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DBFEF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245DBFF00);
  return result;
}

uint64_t sub_245DBFF0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245DBFF14);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_245DBFF18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245DBFF20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceExtensionError()
{
  return &type metadata for ServiceExtensionError;
}

uint64_t sub_245DBFF3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t result;

  switch(a11)
  {
    case 0:
    case 1:
      swift_bridgeObjectRetain();
      goto LABEL_3;
    case 2:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_245DB4A48(a7);
      result = sub_245DB4A48(a9);
      break;
    case 3:
LABEL_3:
      swift_bridgeObjectRetain();
      result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for _Capability(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_BYTE *)(a2 + 80);
  sub_245DBFF3C(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_BYTE *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for _Capability(uint64_t a1, uint64_t a2)
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
  char v22;
  uint64_t v24;
  char v25;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v24 = *(_QWORD *)(a2 + 72);
  v25 = *(_BYTE *)(a2 + 80);
  sub_245DBFF3C(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 72);
  v22 = *(_BYTE *)(a1 + 80);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v24;
  *(_BYTE *)(a1 + 80) = v25;
  sub_245DB3AA4(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
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

uint64_t assignWithTake for _Capability(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;

  v3 = *(_BYTE *)(a2 + 80);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_BYTE *)(a1 + 80);
  v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = v3;
  sub_245DB3AA4(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for _Capability(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for _Capability(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)(result + 80) = -(char)a2;
  }
  return result;
}

uint64_t sub_245DC02CC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 80);
}

uint64_t assignWithCopy for _Capability.Grant(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for _Capability.Grant(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for _Capability.Grant(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for _Capability.Grant(uint64_t result, int a2, int a3)
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

uint64_t method lookup function for _SECapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _SECapability.setActive(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

ValueMetadata *type metadata accessor for Process()
{
  return &type metadata for Process;
}

uint64_t sub_245DC042C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_245DC0450()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
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

unint64_t sub_245DC04B4()
{
  unint64_t result;

  result = qword_25751C578;
  if (!qword_25751C578)
  {
    result = MEMORY[0x249547DD8](&protocol conformance descriptor for ServiceExtensionError, &type metadata for ServiceExtensionError);
    atomic_store(result, (unint64_t *)&qword_25751C578);
  }
  return result;
}

uint64_t sub_245DC04F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_245DC0534(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_245DC0544()
{
  return swift_release();
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_245DC0584@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_245DB50DC(a1, a2);
}

uint64_t sub_245DC0598@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_245DB5230(a1, a2);
}

uint64_t sub_245DC05AC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_245DB51B4(a1, a2);
}

uint64_t sub_245DC05C4@<X0>(__int128 *a1@<X0>, _QWORD *a2@<X8>)
{
  return NetworkingServiceExtension._request(capability:)(a1, a2);
}

uint64_t NetworkingServiceExtension._lockdown(version:)()
{
  sub_245DC4E38();
  swift_bridgeObjectRelease();
  return sandbox_enable_local_state_flag();
}

uint64_t sub_245DC061C()
{
  if (qword_25751C1F0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_245DC065C()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t NetworkingServiceExtension._request(capability:)@<X0>(__int128 *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_245DB2500(a1, a2);
}

uint64_t dispatch thunk of NetworkingServiceExtension.handle(xpcConnection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of NetworkingServiceExtension._request(capabilities:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of NetworkingServiceExtension._lockdown(version:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of NetworkingServiceExtension._backgroundTransferManager.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

unint64_t sub_245DC06F8(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C6D0);
  v2 = sub_245DC4E98();
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
    sub_245DC4440(v6, (uint64_t)&v15, &qword_25751C6D8);
    v7 = v15;
    v8 = v16;
    result = sub_245DC2C4C(v15, v16, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_245DC2E2C);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_245DC0534(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_245DC0840(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C588);
  v2 = sub_245DC4E98();
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
    sub_245DC4440(v6, (uint64_t)v15, (uint64_t *)&unk_25751C6F0);
    result = sub_245DC2CB8((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_245DC0534(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

id _SEHostingHandle.__allocating_init(from:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return _SEHostingHandle.init(from:)(a1);
}

id _SEHostingHandle.init(from:)(void *a1)
{
  void *v1;
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t value;
  int v11;
  xpc_object_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType();
  if (!a1)
    goto LABEL_18;
  v4 = v1;
  v5 = MEMORY[0x249547F1C](a1);
  if (v5 != sub_245DC4C10())
    goto LABEL_16;
  if (xpc_dictionary_get_count(a1) != 2)
    goto LABEL_16;
  v6 = xpc_dictionary_get_value(a1, "pid");
  if (!v6)
    goto LABEL_16;
  v7 = v6;
  v8 = swift_unknownObjectRetain();
  v9 = MEMORY[0x249547F1C](v8);
  if (v9 != sub_245DC4C04())
  {
LABEL_6:
    swift_unknownObjectRelease();
LABEL_7:
    swift_unknownObjectRelease_n();
LABEL_17:

    goto LABEL_18;
  }
  value = xpc_uint64_get_value(v7);
  if (value)
  {
    v11 = value;
    if (!(value >> 31))
    {
      v12 = xpc_dictionary_get_value(a1, "cid");
      if (!v12)
        goto LABEL_6;
      v13 = v12;
      v14 = swift_unknownObjectRetain();
      v15 = MEMORY[0x249547F1C](v14);
      if (v15 != sub_245DC4C04())
      {
        swift_unknownObjectRelease();
        swift_unknownObjectRelease_n();
        goto LABEL_7;
      }
      v16 = xpc_uint64_get_value(v13);
      swift_unknownObjectRelease_n();
      swift_unknownObjectRelease_n();
      if (v16 && !HIDWORD(v16))
      {
        *(_DWORD *)&v4[OBJC_IVAR____SEHostingHandle_pid] = v11;
        *(_DWORD *)&v4[OBJC_IVAR____SEHostingHandle_contextID] = v16;

        v19.receiver = v4;
        v19.super_class = ObjectType;
        v17 = objc_msgSendSuper2(&v19, sel_init);
        swift_unknownObjectRelease();
        return v17;
      }
LABEL_16:
      swift_unknownObjectRelease();
      goto LABEL_17;
    }
  }
  swift_unknownObjectRelease();

  swift_unknownObjectRelease_n();
LABEL_18:
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t _SEHostingHandle.xpcRepresentation()()
{
  uint64_t v0;
  xpc_object_t empty;
  uint64_t v2;
  void *v3;
  uint64_t result;

  empty = xpc_dictionary_create_empty();
  v2 = *(unsigned int *)(v0 + OBJC_IVAR____SEHostingHandle_pid);
  if ((v2 & 0x80000000) != 0)
  {
    result = sub_245DC4E5C();
    __break(1u);
  }
  else
  {
    v3 = empty;
    xpc_dictionary_set_uint64(empty, "pid", v2);
    xpc_dictionary_set_uint64(v3, "cid", *(unsigned int *)(v0 + OBJC_IVAR____SEHostingHandle_contextID));
    return (uint64_t)v3;
  }
  return result;
}

uint64_t static _SEHostingHandle.supportsSecureCoding.getter()
{
  return 1;
}

id _SEHostingHandle.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return _SEHostingHandle.init(coder:)(a1);
}

id _SEHostingHandle.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  char *v5;
  void *v6;
  int v7;
  void *v8;
  unsigned int v9;
  id v10;
  objc_super v12;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = v2;
  v6 = (void *)sub_245DC4CAC();
  v7 = objc_msgSend(a1, sel_decodeInt32ForKey_, v6);

  if (v7 >= 1
    && (v8 = (void *)sub_245DC4CAC(),
        v9 = objc_msgSend(a1, sel_decodeInt32ForKey_, v8),
        v8,
        v9))
  {
    *(_DWORD *)&v5[OBJC_IVAR____SEHostingHandle_pid] = v7;
    *(_DWORD *)&v5[OBJC_IVAR____SEHostingHandle_contextID] = v9;

    v12.receiver = v5;
    v12.super_class = ObjectType;
    v10 = objc_msgSendSuper2(&v12, sel_init);

  }
  else
  {

    swift_deallocPartialClassInstance();
    return 0;
  }
  return v10;
}

Swift::Void __swiftcall _SEHostingHandle.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = *(unsigned int *)(v1 + OBJC_IVAR____SEHostingHandle_pid);
  v4 = (void *)sub_245DC4CAC();
  -[objc_class encodeInt32:forKey:](with.super.isa, sel_encodeInt32_forKey_, v3, v4);

  v5 = *(unsigned int *)(v1 + OBJC_IVAR____SEHostingHandle_contextID);
  v6 = (id)sub_245DC4CAC();
  -[objc_class encodeInt32:forKey:](with.super.isa, sel_encodeInt32_forKey_, v5, v6);

}

id _SEHostable.handle.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____SEHostable_handle);
}

id _SEHostable.layer.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR____SEHostable__context), sel_layer);
}

void _SEHostable.layer.setter(void *a1)
{
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____SEHostable__context), sel_setLayer_, a1);

}

void (*_SEHostable.layer.modify(_QWORD *a1))(id *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + OBJC_IVAR____SEHostable__context);
  a1[1] = v3;
  *a1 = objc_msgSend(v3, sel_layer);
  return sub_245DC1150;
}

void sub_245DC1150(id *a1)
{
  id v1;

  v1 = *a1;
  objc_msgSend(a1[1], sel_setLayer_);

}

void sub_245DC118C()
{
  sub_245DC4E38();
  swift_bridgeObjectRelease();
  sub_245DC4E68();
  __break(1u);
}

uint64_t static _SEHostable.create()()
{
  return sub_245DC3F7C();
}

uint64_t static _SEHostable.create(options:)()
{
  return sub_245DC3E08();
}

id _s17ServiceExtensions16_SEHostingHandleCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall _SEHostable.invalidate()()
{
  uint64_t v0;

  if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____SEHostable__invalidationSignal), sel_signal))
    objc_msgSend(*(id *)(v0 + OBJC_IVAR____SEHostable__context), sel_invalidate);
}

void *sub_245DC1500()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_245DC15C8(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  sub_245DC16A0();
}

void sub_245DC1630(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

  sub_245DC16A0();
}

uint64_t sub_245DC16A0()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  void **v3;
  void *v4;
  char *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR____SEHostingView__visibility;
  v2 = *(_QWORD *)&v0[OBJC_IVAR____SEHostingView__visibility];
  v3 = (void **)&v0[OBJC_IVAR____SEHostingView_handle];
  swift_beginAccess();
  v4 = *v3;
  swift_unknownObjectRetain();
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v0, sel_layer);
    objc_opt_self();
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setContextId_, *(unsigned int *)&v5[OBJC_IVAR____SEHostingHandle_contextID]);
    v7 = *(unsigned int *)&v5[OBJC_IVAR____SEHostingHandle_pid];
    v8 = (void *)sub_245DC4CAC();
    v9 = objc_msgSend((id)objc_opt_self(), sel_interactionWithPID_environmentIdentifier_, v7, v8);

  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)&v0[v1] = v9;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  if (v9)
    objc_msgSend(v0, sel_addInteraction_, v9);
  if (v2)
  {
    swift_unknownObjectRetain();
    objc_msgSend(v0, sel_removeInteraction_, v2);
    swift_unknownObjectRelease_n();
  }
  return swift_unknownObjectRelease();
}

uint64_t (*sub_245DC184C(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_245DC1894;
}

uint64_t sub_245DC1894(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
    return sub_245DC16A0();
  return result;
}

uint64_t sub_245DC18EC()
{
  return sub_245DB431C(0, &qword_25751C5F0);
}

id _SEHostingView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id _SEHostingView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_super v10;

  *(_QWORD *)&v4[OBJC_IVAR____SEHostingView__visibility] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____SEHostingView_handle] = 0;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for _SEHostingView();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id _SEHostingView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id _SEHostingView.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR____SEHostingView__visibility] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____SEHostingView_handle] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for _SEHostingView();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id _SEHostingView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _SEHostingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _SEHostingUpdateCoordinator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id _SEHostingUpdateCoordinator.init()()
{
  _BYTE *v0;
  objc_class *ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char *v6;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = OBJC_IVAR____SEHostingUpdateCoordinator__commitLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C498);
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + 16) = 0;
  *(_QWORD *)&v0[v2] = v3;
  v4 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostables] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostingViews] = v4;
  v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_committed] = 0;
  v5 = (void *)objc_opt_self();
  v6 = v0;
  v7 = objc_msgSend(v5, sel_newFenceFromDefaultServer);
  *(_QWORD *)&v6[OBJC_IVAR____SEHostingUpdateCoordinator__fence] = v7;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, sel_init);
}

id _SEHostingUpdateCoordinator.__allocating_init(from:)(uint64_t a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_245DC408C(a1);
  swift_unknownObjectRelease();
  return v4;
}

id _SEHostingUpdateCoordinator.init(from:)(uint64_t a1)
{
  id v1;

  v1 = sub_245DC408C(a1);
  swift_unknownObjectRelease();
  return v1;
}

id _SEHostingUpdateCoordinator.xpcRepresentation()()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  if (result)
    return objc_msgSend(result, sel_createXPCRepresentation);
  return result;
}

uint64_t static _SEHostingUpdateCoordinator.supportsSecureCoding.getter()
{
  return 1;
}

id _SEHostingUpdateCoordinator.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_245DC418C();

  return v4;
}

id _SEHostingUpdateCoordinator.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_245DC418C();

  return v2;
}

Swift::Void __swiftcall _SEHostingUpdateCoordinator.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  v4 = (id)sub_245DC4CAC();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

}

id _SEHostingUpdateCoordinator.__deallocating_deinit()
{
  char *v0;
  objc_class *ObjectType;
  os_unfair_lock_s *v2;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = *(os_unfair_lock_s **)&v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock];
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  os_unfair_lock_unlock(v2 + 4);
  swift_release();
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

void _SEHostingUpdateCoordinator.add(_:)(char *a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(v1 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock) + 16);
  os_unfair_lock_lock(v3);
  if (*(_QWORD *)(v1 + OBJC_IVAR____SEHostingUpdateCoordinator__fence))
    objc_msgSend(*(id *)&a1[OBJC_IVAR____SEHostable__context], sel_addFence_);
  swift_beginAccess();
  sub_245DC2FD0(&v4, a1, (void (*)(void))type metadata accessor for _SEHostable, &qword_25751C6B8);
  swift_endAccess();

  os_unfair_lock_unlock(v3);
}

void _SEHostingUpdateCoordinator.add(_:)(void *a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(v1 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock) + 16);
  os_unfair_lock_lock(v3);
  v4 = *(void **)(v1 + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(a1, sel_window);
    v7 = objc_msgSend(v6, sel__boundContext);

    objc_msgSend(v7, sel_addFence_, v5);
  }
  swift_beginAccess();
  sub_245DC2FD0(&v8, a1, (void (*)(void))type metadata accessor for _SEHostingView, &qword_25751C6B0);
  swift_endAccess();

  os_unfair_lock_unlock(v3);
}

Swift::Void __swiftcall _SEHostingUpdateCoordinator.commit()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  void *v2;
  unint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  int64_t v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  os_unfair_lock_s *v46;
  int64_t v47;
  uint64_t v48;
  char *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock) + 16);
  os_unfair_lock_lock(v1);
  *(_BYTE *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_committed) = 1;
  v2 = *(void **)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__fence);
  v3 = 0x25751C000;
  if (!v2)
    goto LABEL_64;
  v4 = (uint64_t *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostables);
  swift_beginAccess();
  v5 = *v4;
  v46 = v1;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    v6 = v2;
    swift_bridgeObjectRetain();
    sub_245DC4DC0();
    type metadata accessor for _SEHostable();
    sub_245DC44F4(&qword_25751C630, v7, (uint64_t (*)(uint64_t))type metadata accessor for _SEHostable, MEMORY[0x24BEE5BD8]);
    sub_245DC4D30();
    v5 = v51;
    v48 = v52;
    v8 = v53;
    v9 = v54;
    v10 = v55;
  }
  else
  {
    v11 = -1 << *(_BYTE *)(v5 + 32);
    v48 = v5 + 56;
    v8 = ~v11;
    v12 = -v11;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v10 = v13 & *(_QWORD *)(v5 + 56);
    v14 = v2;
    swift_bridgeObjectRetain();
    v9 = 0;
  }
  v15 = (unint64_t)(v8 + 64) >> 6;
  if (v5 < 0)
    goto LABEL_11;
  while (1)
  {
    if (v10)
    {
      v16 = (v10 - 1) & v10;
      v17 = __clz(__rbit64(v10)) | (v9 << 6);
      v18 = v9;
      goto LABEL_28;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_66:
      __break(1u);
      return;
    }
    if (v21 >= v15)
      goto LABEL_31;
    v22 = *(_QWORD *)(v48 + 8 * v21);
    v18 = v9 + 1;
    if (!v22)
    {
      v18 = v9 + 2;
      if (v9 + 2 >= v15)
        goto LABEL_31;
      v22 = *(_QWORD *)(v48 + 8 * v18);
      if (!v22)
      {
        v18 = v9 + 3;
        if (v9 + 3 >= v15)
          goto LABEL_31;
        v22 = *(_QWORD *)(v48 + 8 * v18);
        if (!v22)
        {
          v18 = v9 + 4;
          if (v9 + 4 >= v15)
            goto LABEL_31;
          v22 = *(_QWORD *)(v48 + 8 * v18);
          if (!v22)
            break;
        }
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v17 = __clz(__rbit64(v22)) + (v18 << 6);
LABEL_28:
    v20 = (char *)*(id *)(*(_QWORD *)(v5 + 48) + 8 * v17);
    if (!v20)
      goto LABEL_31;
    while (1)
    {
      objc_msgSend(*(id *)&v20[OBJC_IVAR____SEHostable__context], sel_addFence_, v2);

      v9 = v18;
      v10 = v16;
      if ((v5 & 0x8000000000000000) == 0)
        break;
LABEL_11:
      v19 = sub_245DC4DE4();
      if (v19)
      {
        v50 = (void *)v19;
        type metadata accessor for _SEHostable();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v20 = v56;
        swift_unknownObjectRelease();
        v18 = v9;
        v16 = v10;
        if (v56)
          continue;
      }
      goto LABEL_31;
    }
  }
  v23 = v9 + 5;
  while (v15 != v23)
  {
    v22 = *(_QWORD *)(v48 + 8 * v23++);
    if (v22)
    {
      v18 = v23 - 1;
      goto LABEL_27;
    }
  }
LABEL_31:
  sub_245DC0544();
  v24 = (unint64_t *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostingViews);
  swift_beginAccess();
  v25 = *v24;
  if ((*v24 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_245DC4DC0();
    type metadata accessor for _SEHostingView();
    sub_245DC44F4((unint64_t *)&unk_25751C638, v26, (uint64_t (*)(uint64_t))type metadata accessor for _SEHostingView, MEMORY[0x24BEE5BD8]);
    sub_245DC4D30();
    v25 = (unint64_t)v56;
    v49 = v57;
    v27 = v58;
    v28 = v59;
    v29 = v60;
  }
  else
  {
    v30 = -1 << *(_BYTE *)(v25 + 32);
    v49 = (char *)(v25 + 56);
    v27 = ~v30;
    v31 = -v30;
    if (v31 < 64)
      v32 = ~(-1 << v31);
    else
      v32 = -1;
    v29 = v32 & *(_QWORD *)(v25 + 56);
    swift_bridgeObjectRetain();
    v28 = 0;
  }
  v47 = (unint64_t)(v27 + 64) >> 6;
  while (2)
  {
    if ((v25 & 0x8000000000000000) != 0)
    {
      if (!sub_245DC4DE4())
        goto LABEL_63;
      type metadata accessor for _SEHostingView();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v36 = v50;
      swift_unknownObjectRelease();
      v35 = v28;
      v33 = v29;
      if (!v50)
        goto LABEL_63;
      goto LABEL_60;
    }
    if (v29)
    {
      v33 = (v29 - 1) & v29;
      v34 = __clz(__rbit64(v29)) | (v28 << 6);
      v35 = v28;
LABEL_59:
      v36 = *(id *)(*(_QWORD *)(v25 + 48) + 8 * v34);
      if (!v36)
        goto LABEL_63;
LABEL_60:
      v40 = objc_msgSend(v36, sel_window);
      if (v40)
      {
        v41 = v40;
        v42 = objc_msgSend(v40, sel__boundContext);

        if (v42)
        {
          objc_msgSend(v42, sel_addFence_, v2);

        }
      }

      v28 = v35;
      v29 = v33;
      continue;
    }
    break;
  }
  v37 = v28 + 1;
  if (__OFADD__(v28, 1))
    goto LABEL_66;
  if (v37 >= v47)
    goto LABEL_63;
  v38 = *(_QWORD *)&v49[8 * v37];
  v35 = v28 + 1;
  if (v38)
    goto LABEL_58;
  v35 = v28 + 2;
  if (v28 + 2 >= v47)
    goto LABEL_63;
  v38 = *(_QWORD *)&v49[8 * v35];
  if (v38)
    goto LABEL_58;
  v35 = v28 + 3;
  if (v28 + 3 >= v47)
    goto LABEL_63;
  v38 = *(_QWORD *)&v49[8 * v35];
  if (v38)
    goto LABEL_58;
  v35 = v28 + 4;
  if (v28 + 4 >= v47)
    goto LABEL_63;
  v38 = *(_QWORD *)&v49[8 * v35];
  if (v38)
  {
LABEL_58:
    v33 = (v38 - 1) & v38;
    v34 = __clz(__rbit64(v38)) + (v35 << 6);
    goto LABEL_59;
  }
  v39 = v28 + 5;
  while (v47 != v39)
  {
    v38 = *(_QWORD *)&v49[8 * v39++];
    if (v38)
    {
      v35 = v39 - 1;
      goto LABEL_58;
    }
  }
LABEL_63:
  sub_245DC0544();

  v1 = v46;
  v3 = 0x25751C000uLL;
LABEL_64:
  v43 = (_QWORD *)(v0 + OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostables);
  swift_beginAccess();
  v44 = MEMORY[0x24BEE4B08];
  *v43 = MEMORY[0x24BEE4B08];
  swift_bridgeObjectRelease();
  v45 = (_QWORD *)(v0 + *(_QWORD *)(v3 + 1560));
  swift_beginAccess();
  *v45 = v44;
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_invalidate);
  os_unfair_lock_unlock(v1);
}

unint64_t sub_245DC2950(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C6D0);
  v2 = sub_245DC4E98();
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
    sub_245DC4440(v6, (uint64_t)&v15, &qword_25751C6D8);
    v7 = v15;
    v8 = v16;
    result = sub_245DC2C4C(v15, v16, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_245DC2A98);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_245DC0534(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_245DC2A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_245DC4EE0() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_245DC4EE0() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_245DC4EE0() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

unint64_t sub_245DC2BDC(uint64_t a1)
{
  uint64_t v2;

  sub_245DC4A84();
  sub_245DC44F4(&qword_25751C310, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_245DC4C94();
  return sub_245DC2CE8(a1, v2);
}

uint64_t sub_245DC2C4C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;

  sub_245DC4F4C();
  sub_245DC4CC4();
  v5 = sub_245DC4F64();
  return a3(a1, a2, v5);
}

unint64_t sub_245DC2CB8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245DC4DF0();
  return sub_245DC2F0C(a1, v2);
}

unint64_t sub_245DC2CE8(uint64_t a1, uint64_t a2)
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
  v5 = sub_245DC4A84();
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
      sub_245DC44F4((unint64_t *)&unk_25751C700, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_245DC4CA0();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_245DC2E2C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_245DC4EE0() & 1) == 0)
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
      while (!v14 && (sub_245DC4EE0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_245DC2F0C(uint64_t a1, uint64_t a2)
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
      sub_245DC4484(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x249547898](v9, a1);
      sub_245DC44C0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_245DC2FD0(_QWORD *a1, void *a2, void (*a3)(void), uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v7;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  id v21;
  char v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  char isUniquelyReferenced_nonNull_native;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v7 = v4;
  v10 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    if (v10 < 0)
      v11 = *v4;
    else
      v11 = v10 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v12 = a2;
    v13 = sub_245DC4DD8();

    if (v13)
    {
      swift_bridgeObjectRelease();

      a3();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v35;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_245DC4DCC();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v25 = sub_245DC3274(v11, result + 1, a4, a3);
    v36 = v25;
    v26 = *(_QWORD *)(v25 + 16);
    if (*(_QWORD *)(v25 + 24) <= v26)
    {
      v31 = v26 + 1;
      v32 = v12;
      sub_245DC3464(v31, a4);
      v27 = v36;
    }
    else
    {
      v27 = v25;
      v28 = v12;
    }
    sub_245DC36FC((uint64_t)v12, v27);
    *v7 = v27;
    swift_bridgeObjectRelease();
    *a1 = v12;
  }
  else
  {
    swift_bridgeObjectRetain();
    v15 = sub_245DC4D6C();
    v16 = -1 << *(_BYTE *)(v10 + 32);
    v17 = v15 & ~v16;
    if (((*(_QWORD *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8)) >> v17) & 1) != 0)
    {
      ((void (*)(uint64_t))a3)(v15);
      v18 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * v17);
      v19 = sub_245DC4D78();

      if ((v19 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v23 = *(void **)(*(_QWORD *)(*v4 + 48) + 8 * v17);
        *a1 = v23;
        v24 = v23;
        return 0;
      }
      v20 = ~v16;
      while (1)
      {
        v17 = (v17 + 1) & v20;
        if (((*(_QWORD *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8)) >> v17) & 1) == 0)
          break;
        v21 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * v17);
        v22 = sub_245DC4D78();

        if ((v22 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v37 = *v4;
    *v4 = 0x8000000000000000;
    v30 = a2;
    sub_245DC377C((uint64_t)v30, v17, isUniquelyReferenced_nonNull_native, a4, a3);
    *v4 = v37;
    swift_bridgeObjectRelease();
    *a1 = v30;
  }
  return 1;
}

uint64_t sub_245DC3274(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(void))
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v6 = sub_245DC4E2C();
    v19 = v6;
    sub_245DC4DC0();
    if (sub_245DC4DE4())
    {
      a4();
      do
      {
        swift_dynamicCast();
        v6 = v19;
        v13 = *(_QWORD *)(v19 + 16);
        if (*(_QWORD *)(v19 + 24) <= v13)
        {
          sub_245DC3464(v13 + 1, a3);
          v6 = v19;
        }
        result = sub_245DC4D6C();
        v8 = v6 + 56;
        v9 = -1 << *(_BYTE *)(v6 + 32);
        v10 = result & ~v9;
        v11 = v10 >> 6;
        if (((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          v12 = __clz(__rbit64((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v14 = 0;
          v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v16 = v11 == v15;
            if (v11 == v15)
              v11 = 0;
            v14 |= v16;
            v17 = *(_QWORD *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(_QWORD *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v12) = v18;
        ++*(_QWORD *)(v6 + 16);
      }
      while (sub_245DC4DE4());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v6;
}

uint64_t sub_245DC3464(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
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

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_245DC4E20();
  v6 = v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v8 = (_QWORD *)(v4 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
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
        if (v18 >= v11)
          goto LABEL_33;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_33;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_33;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                v3 = v30;
                v29 = 1 << *(_BYTE *)(v4 + 32);
                if (v29 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v11)
                    goto LABEL_33;
                  v19 = v8[v14];
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
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v17);
      result = sub_245DC4D6C();
      v22 = -1 << *(_BYTE *)(v6 + 32);
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
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release();
  *v3 = v6;
  return result;
}

unint64_t sub_245DC36FC(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_245DC4D6C();
  result = sub_245DC4DB4();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_245DC377C(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v9 = *(_QWORD *)(*v5 + 16);
  v10 = *(_QWORD *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0)
    goto LABEL_14;
  v11 = v9 + 1;
  if ((a3 & 1) != 0)
  {
    sub_245DC3464(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_245DC38FC(a4);
      goto LABEL_14;
    }
    sub_245DC3A9C(v11, a4);
  }
  v12 = *v5;
  v13 = sub_245DC4D6C();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    a5();
    v15 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
    v16 = sub_245DC4D78();

    if ((v16 & 1) != 0)
    {
LABEL_13:
      sub_245DC4EF8();
      __break(1u);
    }
    else
    {
      v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v18 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
        v19 = sub_245DC4D78();

        if ((v19 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v20 + 48) + 8 * a2) = a1;
  v21 = *(_QWORD *)(v20 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v23;
}

id sub_245DC38FC(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_245DC4E14();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
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
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_245DC3A9C(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_245DC4E20();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release();
LABEL_35:
    *v3 = v6;
    return result;
  }
  v29 = v2;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = v4 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v4 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
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
    if (v18 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_33;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_33;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v17);
    result = sub_245DC4D6C();
    v22 = -1 << *(_BYTE *)(v6 + 32);
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
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    result = swift_release_n();
    v3 = v29;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
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
    if (v14 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

id sub_245DC3D10(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  id v4;
  char *v5;
  id v6;
  id v7;
  objc_class *v8;
  char *v9;
  objc_super v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v1[OBJC_IVAR____SEHostable__context] = a1;
  v4 = objc_allocWithZone(MEMORY[0x24BE0BDA8]);
  v5 = v1;
  v6 = a1;
  v7 = objc_msgSend(v4, sel_init);
  *(_QWORD *)&v5[OBJC_IVAR____SEHostable__invalidationSignal] = v7;
  LODWORD(v4) = getpid();
  LODWORD(v6) = objc_msgSend(v6, sel_contextId);
  v8 = (objc_class *)type metadata accessor for _SEHostingHandle();
  v9 = (char *)objc_allocWithZone(v8);
  *(_DWORD *)&v9[OBJC_IVAR____SEHostingHandle_pid] = (_DWORD)v4;
  *(_DWORD *)&v9[OBJC_IVAR____SEHostingHandle_contextID] = (_DWORD)v6;
  v12.receiver = v9;
  v12.super_class = v8;
  *(_QWORD *)&v5[OBJC_IVAR____SEHostable_handle] = objc_msgSendSuper2(&v12, sel_init);

  v11.receiver = v5;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t sub_245DC3E08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _DWORD v10[4];

  v0 = sub_245DC4A00();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_245DC4C7C();
  v6 = objc_msgSend(v4, sel_remoteContextWithOptions_, v5);

  if (v6)
  {
    v7 = objc_allocWithZone((Class)type metadata accessor for _SEHostable());
    v8 = sub_245DC3D10(v6);

    return (uint64_t)v8;
  }
  else
  {
    v10[3] = 1;
    sub_245DC2950(MEMORY[0x24BEE4AF8]);
    sub_245DC44F4(&qword_25751C6C8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
    sub_245DC4A0C();
    sub_245DC49F4();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return swift_willThrow();
  }
}

uint64_t sub_245DC3F7C()
{
  uint64_t inited;
  uint64_t result;
  id v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25751C6E0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_245DC5A40;
  sub_245DC4CB8();
  swift_bridgeObjectRetain();
  result = sub_245DC4E08();
  if (*MEMORY[0x24BDBD270])
  {
    v2 = (id)*MEMORY[0x24BDBD270];
    swift_bridgeObjectRelease();
    type metadata accessor for CFBoolean(0);
    *(_QWORD *)(inited + 96) = v3;
    *(_QWORD *)(inited + 72) = v2;
    sub_245DC0840(inited);
    v4 = sub_245DC3E08();
    swift_bridgeObjectRelease();
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for _SEHostingView()
{
  return objc_opt_self();
}

id sub_245DC408C(uint64_t a1)
{
  _BYTE *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char *v8;
  id v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____SEHostingUpdateCoordinator__commitLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C498);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 16) = 0;
  *(_QWORD *)&v1[v4] = v5;
  v6 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v1[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostables] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v1[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostingViews] = v6;
  v1[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_committed] = 0;
  if (a1)
  {
    v7 = (void *)objc_opt_self();
    v8 = v1;
    v9 = objc_msgSend(v7, sel_handleFromXPCRepresentation_, a1);
    *(_QWORD *)&v8[OBJC_IVAR____SEHostingUpdateCoordinator__fence] = v9;

  }
  else
  {
    *(_QWORD *)&v1[OBJC_IVAR____SEHostingUpdateCoordinator__fence] = 0;
  }
  v11.receiver = v1;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

id sub_245DC418C()
{
  _BYTE *v0;
  objc_class *ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = OBJC_IVAR____SEHostingUpdateCoordinator__commitLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25751C498);
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + 16) = 0;
  *(_QWORD *)&v0[v2] = v3;
  v4 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostables] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_hostingViews] = v4;
  v0[OBJC_IVAR____SEHostingUpdateCoordinator__commitLock_committed] = 0;
  sub_245DB431C(0, &qword_25751C6C0);
  v5 = v0;
  *(_QWORD *)&v5[OBJC_IVAR____SEHostingUpdateCoordinator__fence] = sub_245DC4D60();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t type metadata accessor for _SEHostable()
{
  return objc_opt_self();
}

id sub_245DC42A0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*(id *)(*a1 + OBJC_IVAR____SEHostable__context), sel_layer);
  *a2 = result;
  return result;
}

id sub_245DC42E4(_QWORD *a1, _QWORD *a2)
{
  return objc_msgSend(*(id *)(*a2 + OBJC_IVAR____SEHostable__context), sel_setLayer_, *a1);
}

id sub_245DC4308@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t type metadata accessor for _SEHostingHandle()
{
  return objc_opt_self();
}

uint64_t method lookup function for _SEHostingHandle()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _SEHostingHandle.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of _SEHostingHandle.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t method lookup function for _SEHostable()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for _SEHostingView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _SEHostingView.handle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of _SEHostingView.handle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of _SEHostingView.handle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t type metadata accessor for _SEHostingUpdateCoordinator()
{
  return objc_opt_self();
}

uint64_t method lookup function for _SEHostingUpdateCoordinator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _SEHostingUpdateCoordinator.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of _SEHostingUpdateCoordinator.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_245DC4440(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_245DC4484(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_245DC44C0(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_245DC44F4(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x249547DD8](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_245DC4534(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  char v8;

  v2 = 0x8000000245DC6720;
  v3 = a1;
  if (a1)
  {
    if (a1 == 1)
      v4 = 0xD000000000000020;
    else
      v4 = 0xD000000000000024;
    if (v3 == 1)
      v5 = 0x8000000245DC6750;
    else
      v5 = 0x8000000245DC6780;
    v6 = a2;
    if (a2)
    {
LABEL_9:
      if (v6 == 1)
        v7 = 0xD000000000000020;
      else
        v7 = 0xD000000000000024;
      if (v6 == 1)
        v2 = 0x8000000245DC6750;
      else
        v2 = 0x8000000245DC6780;
      if (v4 != v7)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xD000000000000027;
    v5 = 0x8000000245DC6720;
    v6 = a2;
    if (a2)
      goto LABEL_9;
  }
  if (v4 != 0xD000000000000027)
  {
LABEL_21:
    v8 = sub_245DC4EE0();
    goto LABEL_22;
  }
LABEL_19:
  if (v5 != v2)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_245DC4630()
{
  sub_245DC4F4C();
  sub_245DC4CC4();
  swift_bridgeObjectRelease();
  return sub_245DC4F64();
}

uint64_t sub_245DC46D4()
{
  sub_245DC4CC4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245DC4750()
{
  sub_245DC4F4C();
  sub_245DC4CC4();
  swift_bridgeObjectRelease();
  return sub_245DC4F64();
}

uint64_t _LockdownVersion.rawValue.getter()
{
  return 3157553;
}

unint64_t sub_245DC4808()
{
  unint64_t result;

  result = qword_25751C770;
  if (!qword_25751C770)
  {
    result = MEMORY[0x249547DD8](&protocol conformance descriptor for _LockdownVersion, &type metadata for _LockdownVersion);
    atomic_store(result, (unint64_t *)&qword_25751C770);
  }
  return result;
}

uint64_t sub_245DC4858@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_245DC4EB0();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_245DC48A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _LockdownVersion.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t storeEnumTagSinglePayload for _LockdownVersion(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_245DC490C + 4 * byte_245DC6650[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_245DC492C + 4 * byte_245DC6655[v4]))();
}

_BYTE *sub_245DC490C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_245DC492C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245DC4934(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245DC493C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245DC4944(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245DC494C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_245DC4958()
{
  sub_245DC4F4C();
  sub_245DC4CC4();
  return sub_245DC4F64();
}

uint64_t sub_245DC499C()
{
  sub_245DC4F4C();
  sub_245DC4CC4();
  return sub_245DC4F64();
}

uint64_t sub_245DC49E4()
{
  return sub_245DC4CC4();
}

uint64_t sub_245DC49F4()
{
  return MEMORY[0x24BDCAFC8]();
}

uint64_t sub_245DC4A00()
{
  return MEMORY[0x24BDCAFE0]();
}

uint64_t sub_245DC4A0C()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_245DC4A18()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_245DC4A24()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_245DC4A30()
{
  return MEMORY[0x24BDCD5A8]();
}

uint64_t sub_245DC4A3C()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_245DC4A48()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_245DC4A54()
{
  return MEMORY[0x24BDCD908]();
}

uint64_t sub_245DC4A60()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_245DC4A6C()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_245DC4A78()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_245DC4A84()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_245DC4A90()
{
  return MEMORY[0x24BDC7708]();
}

uint64_t _s17ServiceExtensions11_GPUProcessV10invalidateyyF_0()
{
  return MEMORY[0x24BDC7710]();
}

uint64_t sub_245DC4AA8()
{
  return MEMORY[0x24BDC7718]();
}

uint64_t sub_245DC4AB4()
{
  return MEMORY[0x24BDC7720]();
}

uint64_t sub_245DC4AC0()
{
  return MEMORY[0x24BDC7728]();
}

uint64_t sub_245DC4ACC()
{
  return MEMORY[0x24BDC7730]();
}

uint64_t sub_245DC4AD8()
{
  return MEMORY[0x24BDC7738]();
}

uint64_t sub_245DC4AE4()
{
  return MEMORY[0x24BDC7740]();
}

uint64_t sub_245DC4AF0()
{
  return MEMORY[0x24BDC7748]();
}

uint64_t sub_245DC4AFC()
{
  return MEMORY[0x24BDC7758]();
}

uint64_t sub_245DC4B08()
{
  return MEMORY[0x24BDC7760]();
}

uint64_t sub_245DC4B14()
{
  return MEMORY[0x24BDC7768]();
}

uint64_t sub_245DC4B20()
{
  return MEMORY[0x24BDC7770]();
}

uint64_t _s17ServiceExtensions11_GPUProcessV7isValidSbvg_0()
{
  return MEMORY[0x24BDC7778]();
}

uint64_t sub_245DC4B38()
{
  return MEMORY[0x24BDC7788]();
}

uint64_t sub_245DC4B44()
{
  return MEMORY[0x24BDC7798]();
}

uint64_t sub_245DC4B50()
{
  return MEMORY[0x24BDC77A0]();
}

uint64_t sub_245DC4B5C()
{
  return MEMORY[0x24BDC77B8]();
}

uint64_t sub_245DC4B68()
{
  return MEMORY[0x24BE85410]();
}

uint64_t _s17ServiceExtensions15_BrowserProcessV17processIdentifiers5Int32Vvg_0()
{
  return MEMORY[0x24BE85418]();
}

uint64_t sub_245DC4B80()
{
  return MEMORY[0x24BE85420]();
}

uint64_t sub_245DC4B8C()
{
  return MEMORY[0x24BE85428]();
}

uint64_t sub_245DC4B98()
{
  return MEMORY[0x24BE85430]();
}

uint64_t sub_245DC4BA4()
{
  return MEMORY[0x24BE85440]();
}

uint64_t sub_245DC4BB0()
{
  return MEMORY[0x24BE85450]();
}

uint64_t sub_245DC4BBC()
{
  return MEMORY[0x24BEE6210]();
}

uint64_t sub_245DC4BC8()
{
  return MEMORY[0x24BEE62A8]();
}

uint64_t sub_245DC4BD4()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_245DC4BE0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_245DC4BEC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_245DC4BF8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_245DC4C04()
{
  return MEMORY[0x24BEE6490]();
}

uint64_t sub_245DC4C10()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t sub_245DC4C1C()
{
  return MEMORY[0x24BEE5370]();
}

uint64_t sub_245DC4C28()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_245DC4C34()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_245DC4C40()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_245DC4C4C()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_245DC4C58()
{
  return MEMORY[0x24BEE55D8]();
}

uint64_t sub_245DC4C64()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t sub_245DC4C70()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_245DC4C7C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_245DC4C88()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_245DC4C94()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_245DC4CA0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_245DC4CAC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_245DC4CB8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245DC4CC4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_245DC4CD0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_245DC4CDC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_245DC4CE8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_245DC4CF4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_245DC4D00()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_245DC4D0C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_245DC4D18()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_245DC4D24()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_245DC4D30()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_245DC4D3C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_245DC4D48()
{
  return MEMORY[0x24BEE56C0]();
}

uint64_t sub_245DC4D54()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_245DC4D60()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_245DC4D6C()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_245DC4D78()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_245DC4D84()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_245DC4D90()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_245DC4D9C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_245DC4DA8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_245DC4DB4()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_245DC4DC0()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_245DC4DCC()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_245DC4DD8()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_245DC4DE4()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_245DC4DF0()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_245DC4DFC()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_245DC4E08()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_245DC4E14()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_245DC4E20()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_245DC4E2C()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_245DC4E38()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_245DC4E44()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245DC4E50()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245DC4E5C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_245DC4E68()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_245DC4E74()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_245DC4E80()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_245DC4E8C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_245DC4E98()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_245DC4EA4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_245DC4EB0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_245DC4EBC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_245DC4EC8()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_245DC4ED4()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_245DC4EE0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245DC4EEC()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_245DC4EF8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_245DC4F04()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_245DC4F10()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_245DC4F1C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_245DC4F28()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_245DC4F34()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_245DC4F40()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_245DC4F4C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245DC4F58()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_245DC4F64()
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t sandbox_enable_local_state_flag()
{
  return MEMORY[0x24BDAFBF8]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x24BEE4FF8]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x24BEE5000]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

