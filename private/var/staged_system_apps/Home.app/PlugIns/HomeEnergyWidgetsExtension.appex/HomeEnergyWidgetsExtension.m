id sub_1000039D4()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t v2;
  id (__cdecl *v3)();
  id v4;
  id *v5;
  id result;
  objc_super v7;
  _BYTE v8[24];

  v0 = (objc_class *)type metadata accessor for HomeManagerActor();
  v1 = swift_allocObject(v0, 136, 15);
  swift_defaultActor_initialize(v1);
  *(_BYTE *)(v1 + 112) = 0;
  *(_QWORD *)(v1 + 120) = &_swiftEmptyArrayStorage;
  swift_beginAccess(&static HomeManagerActor.homeManagerCreationBlock, v8, 0, 0);
  v3 = (id (__cdecl *)())static HomeManagerActor.homeManagerCreationBlock;
  v2 = qword_10003C700;
  swift_retain(v1);
  swift_retain(v2);
  v4 = v3();
  swift_release(v2);
  *(_QWORD *)(v1 + 128) = v4;
  swift_release(v1);
  v7.receiver = (id)v1;
  v7.super_class = v0;
  v5 = (id *)objc_msgSendSuper2(&v7, "init");
  result = objc_msgSend(v5[16], "setDelegate:", v5);
  qword_10003D4A8 = (uint64_t)v5;
  return result;
}

id *sub_100003AA8()
{
  objc_class *v0;
  objc_class *v1;
  uint64_t v2;
  uint64_t v3;
  id (__cdecl *v4)();
  id v5;
  id *v6;
  objc_super v8;
  _BYTE v9[24];

  v1 = v0;
  v2 = swift_allocObject(v0, 136, 15);
  swift_defaultActor_initialize();
  *(_BYTE *)(v2 + 112) = 0;
  *(_QWORD *)(v2 + 120) = &_swiftEmptyArrayStorage;
  swift_beginAccess(&static HomeManagerActor.homeManagerCreationBlock, v9, 0, 0);
  v4 = (id (__cdecl *)())static HomeManagerActor.homeManagerCreationBlock;
  v3 = qword_10003C700;
  swift_retain(v2);
  swift_retain(v3);
  v5 = v4();
  swift_release(v3);
  *(_QWORD *)(v2 + 128) = v5;
  swift_release(v2);
  v8.receiver = (id)v2;
  v8.super_class = v1;
  v6 = (id *)objc_msgSendSuper2(&v8, "init");
  objc_msgSend(v6[16], "setDelegate:", v6);
  return v6;
}

uint64_t (**HomeManagerActor.homeManagerCreationBlock.unsafeMutableAddressor())()
{
  return &static HomeManagerActor.homeManagerCreationBlock;
}

uint64_t (*static HomeManagerActor.homeManagerCreationBlock.getter())()
{
  uint64_t (*v0)();
  _BYTE v2[24];

  swift_beginAccess(&static HomeManagerActor.homeManagerCreationBlock, v2, 0, 0);
  v0 = static HomeManagerActor.homeManagerCreationBlock;
  swift_retain(qword_10003C700);
  return v0;
}

uint64_t static HomeManagerActor.homeManagerCreationBlock.setter(uint64_t (*a1)(), uint64_t a2)
{
  uint64_t v4;
  _BYTE v6[24];

  sub_100005998((uint64_t)a1, a2);
  swift_beginAccess(&static HomeManagerActor.homeManagerCreationBlock, v6, 1, 0);
  v4 = qword_10003C700;
  static HomeManagerActor.homeManagerCreationBlock = a1;
  qword_10003C700 = a2;
  return swift_release(v4);
}

void (*static HomeManagerActor.homeManagerCreationBlock.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  swift_beginAccess(&static HomeManagerActor.homeManagerCreationBlock, v2, 1, 0);
  v3 = qword_10003C700;
  v2[3] = static HomeManagerActor.homeManagerCreationBlock;
  v2[4] = v3;
  swift_retain(v3);
  return sub_100003C94;
}

void sub_100003C94(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t (*v3)();
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)a1;
  v3 = *(uint64_t (**)())(*(_QWORD *)a1 + 24);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    swift_retain(*(_QWORD *)(*(_QWORD *)a1 + 32));
    sub_100005998((uint64_t)v3, v4);
    v5 = qword_10003C700;
    static HomeManagerActor.homeManagerCreationBlock = v3;
    qword_10003C700 = v4;
    swift_release(v5);
    v6 = v2[4];
  }
  else
  {
    sub_100005998(*(_QWORD *)(*(_QWORD *)a1 + 24), v4);
    v6 = qword_10003C700;
    static HomeManagerActor.homeManagerCreationBlock = v3;
    qword_10003C700 = v4;
  }
  swift_release(v6);
  free(v2);
}

id *sub_100003D1C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)();
  uint64_t v4;
  uint64_t v5;
  id *v6;
  objc_super v8;
  _BYTE v9[24];

  v1 = (_QWORD *)v0;
  swift_defaultActor_initialize(v0);
  *(_BYTE *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 120) = &_swiftEmptyArrayStorage;
  swift_beginAccess(&static HomeManagerActor.homeManagerCreationBlock, v9, 0, 0);
  v3 = static HomeManagerActor.homeManagerCreationBlock;
  v2 = qword_10003C700;
  swift_retain(v1);
  v4 = swift_retain(v2);
  v5 = ((uint64_t (*)(uint64_t))v3)(v4);
  swift_release(v2);
  v1[16] = v5;
  swift_release(v1);
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for HomeManagerActor();
  v6 = (id *)objc_msgSendSuper2(&v8, "init");
  objc_msgSend(v6[16], "setDelegate:", v6);
  return v6;
}

uint64_t variable initialization expression of HomeManagerActor.homeHasUpdatedOnce()
{
  return 0;
}

void *variable initialization expression of HomeManagerActor.blocks()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100003E14()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_1000064C8(v0, qword_10003D4B0);
  sub_1000064B0(v0, (uint64_t)qword_10003D4B0);
  return Logger.init(subsystem:category:)(0x6C7070612E6D6F63, 0xEE00656D6F482E65, 0xD000000000000010, 0x8000000100030810);
}

uint64_t HomeManagerActor.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 120));

  swift_defaultActor_destroy(v0);
  return v0;
}

uint64_t HomeManagerActor.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 120));

  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t HomeManagerActor.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t static HomeManagerActor.homeManager.getter()
{
  return swift_task_switch(sub_100003F0C, 0, 0);
}

uint64_t sub_100003F0C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 24) = v1;
  v2 = sub_1000066D4(0, &qword_10003C770, HMHomeManager_ptr);
  *v1 = v0;
  v1[1] = sub_100003FAC;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004008, 0, v2);
}

uint64_t sub_100003FAC()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 24));
  return swift_task_switch(sub_100004000, 0, 0);
}

uint64_t sub_100004000()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100004008(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v2 = sub_100005E18(&qword_10003C898);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  __chkstk_darwin();
  sub_100005E18(&qword_10003C840);
  __chkstk_darwin();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v8 = *(unsigned __int8 *)(v3 + 80);
  v9 = (v8 + 32) & ~v8;
  v10 = swift_allocObject(&unk_100039260, v9 + v4, v8 | 7);
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v10 + v9, (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  v11 = sub_10000445C((uint64_t)v6, (uint64_t)&unk_10003C8A8, v10);
  return swift_release(v11);
}

uint64_t sub_100004140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4[6] = a4;
  v5 = sub_100005E18(&qword_10003C898);
  v4[7] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[8] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v4[9] = v7;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[10] = swift_task_alloc(v8);
  v4[11] = swift_task_alloc(v8);
  return swift_task_switch(sub_1000041B8, 0, 0);
}

uint64_t sub_1000041B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_10003C6F0 != -1)
    swift_once(&qword_10003C6F0, sub_1000039D4);
  v1 = v0[10];
  v2 = v0[11];
  v4 = v0[8];
  v3 = v0[9];
  v5 = v0[6];
  v6 = v0[7];
  v7 = qword_10003D4A8;
  v0[12] = qword_10003D4A8;
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v8(v2, v5, v6);
  v8(v1, v2, v6);
  v9 = *(unsigned __int8 *)(v4 + 80);
  v10 = (v9 + 16) & ~v9;
  v11 = swift_allocObject(&unk_100039288, v10 + v3, v9 | 7);
  v0[13] = v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v11 + v10, v2, v6);
  return swift_task_switch(sub_10000429C, v7, 0);
}

uint64_t sub_10000429C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char **v9;
  char *v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 96);
  if (*(_BYTE *)(v1 + 112) == 1)
  {
    v2 = *(void **)(v1 + 128);
    *(_QWORD *)(v0 + 40) = v2;
    v3 = *(_QWORD *)(v0 + 104);
    v4 = *(_QWORD *)(v0 + 56);
    v5 = v2;
    CheckedContinuation.resume(returning:)(v0 + 40, v4);
    v6 = v3;
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 104);
    v8 = swift_allocObject(&unk_1000392B0, 32, 7);
    *(_QWORD *)(v8 + 16) = sub_10000666C;
    *(_QWORD *)(v8 + 24) = v7;
    v9 = (char **)(v1 + 120);
    swift_beginAccess(v1 + 120, v0 + 16, 33, 0);
    v10 = *(char **)(v1 + 120);
    swift_retain(v7);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v10);
    *(_QWORD *)(v1 + 120) = v10;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v10 = sub_100026D10(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
      *v9 = v10;
    }
    v13 = *((_QWORD *)v10 + 2);
    v12 = *((_QWORD *)v10 + 3);
    if (v13 >= v12 >> 1)
    {
      v10 = sub_100026D10((char *)(v12 > 1), v13 + 1, 1, v10);
      *v9 = v10;
    }
    v14 = *(_QWORD *)(v0 + 104);
    *((_QWORD *)v10 + 2) = v13 + 1;
    v15 = &v10[16 * v13];
    *((_QWORD *)v15 + 4) = sub_100006710;
    *((_QWORD *)v15 + 5) = v8;
    swift_endAccess(v0 + 16);
    v6 = v14;
  }
  swift_release(v6);
  v16 = *(_QWORD *)(v0 + 80);
  v17 = *(_QWORD *)(v0 + 88);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(v16, *(_QWORD *)(v0 + 56));
  swift_task_dealloc(v17);
  swift_task_dealloc(v16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004418(void *a1)
{
  id v1;
  uint64_t v2;
  void *v4;

  v4 = a1;
  v1 = a1;
  v2 = sub_100005E18(&qword_10003C898);
  return CheckedContinuation.resume(returning:)(&v4, v2);
}

uint64_t sub_10000445C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_1000060F0(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_100039148, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_10003C860, v17);
}

uint64_t sub_1000045A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch(sub_1000045BC, a4, 0);
}

uint64_t sub_1000045BC()
{
  uint64_t v0;

  sub_1000045EC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000045EC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  __objc2_prot_list *v7;
  uint64_t *v8;
  id v9;
  void (*v10)(_QWORD);
  uint64_t v11;
  uint64_t count;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  __objc2_prot_list *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  void (*v25)(_QWORD);
  id v26;
  _BYTE v27[24];

  if ((*(_BYTE *)(v0 + 112) & 1) == 0)
  {
    v1 = v0;
    objc_msgSend(*(id *)(v0 + 128), "setDelegate:", 0);
    *(_BYTE *)(v0 + 112) = 1;
    v2 = (_QWORD *)(v0 + 120);
    swift_beginAccess(v2, v27, 1, 0);
    v3 = *(_QWORD *)(v1 + 120);
    v4 = *(_QWORD *)(v3 + 16);
    if (v4)
    {
      v24 = v2;
      swift_bridgeObjectRetain_n(v3, 2);
      v5 = 0;
      v23 = v3;
      v6 = (_QWORD *)(v3 + 40);
      v7 = &HomeManagerActor;
      v8 = qword_10003D4B0;
      do
      {
        v10 = (void (*)(_QWORD))*(v6 - 1);
        v11 = *v6;
        count = v7[225].count;
        swift_retain_n(*v6, 2);
        if (count != -1)
          swift_once(&qword_10003C708, sub_100003E14);
        v13 = type metadata accessor for Logger(0);
        v14 = sub_1000064B0(v13, (uint64_t)v8);
        v15 = Logger.logObject.getter(v14);
        v16 = static os_log_type_t.fault.getter();
        if (os_log_type_enabled(v15, v16))
        {
          v25 = v10;
          v17 = v1;
          v18 = v4;
          v19 = v8;
          v20 = v7;
          v21 = swift_slowAlloc(12, -1);
          *(_DWORD *)v21 = 134217984;
          *(_QWORD *)(v21 + 4) = v5;
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "catching up on block %ld", (uint8_t *)v21, 0xCu);
          v22 = v21;
          v7 = v20;
          v8 = v19;
          v4 = v18;
          v1 = v17;
          v10 = v25;
          swift_slowDealloc(v22, -1, -1);
        }
        ++v5;

        v26 = *(id *)(v1 + 128);
        v9 = v26;
        v10(&v26);
        swift_release_n(v11, 2);

        v6 += 2;
      }
      while (v4 != v5);
      swift_bridgeObjectRelease_n(v23, 2);
      v2 = v24;
      v3 = *v24;
    }
    *v2 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease(v3);
  }
}

id sub_100004834()
{
  uint64_t v0;
  id v1;
  id v2;

  v0 = sub_1000066D4(0, &qword_10003C8B8, HMMutableHomeManagerConfiguration_ptr);
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(v0), "defaultPrivateConfiguration");
  objc_msgSend(v1, "setCachePolicy:", 0);
  objc_msgSend(v1, "setDiscretionary:", 0);
  objc_msgSend(v1, "setAdaptive:", 1);
  v2 = objc_msgSend(objc_allocWithZone((Class)HMHomeManager), "initWithConfiguration:", v1);

  return v2;
}

uint64_t static DataModel.sharedAsync.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[4] = v0;
  v2 = type metadata accessor for MainActor(0);
  v1[5] = v2;
  v1[6] = static MainActor.shared.getter();
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  v1[7] = v3;
  v1[8] = v4;
  return swift_task_switch(sub_100004950, v3, v4);
}

uint64_t sub_100004950()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  v1 = v0[4];
  if (byte_10003C720 == 1)
  {
    v2 = v0 + 3;
    v3 = static MainActor.shared.getter();
    v0[9] = v3;
    v4 = swift_task_alloc(32);
    v0[10] = v4;
    *(_QWORD *)(v4 + 16) = v1;
    v5 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
    v0[11] = v5;
    v6 = type metadata accessor for DataModel(0);
    *v5 = v0;
    v5[1] = sub_100004A88;
    v7 = sub_100005D50;
  }
  else
  {
    v2 = v0 + 2;
    v3 = static MainActor.shared.getter();
    v0[12] = v3;
    v4 = swift_task_alloc(32);
    v0[13] = v4;
    *(_QWORD *)(v4 + 16) = v1;
    v8 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
    v0[14] = v8;
    v6 = type metadata accessor for DataModel(0);
    *v8 = v0;
    v8[1] = sub_100004B24;
    v7 = sub_100005D48;
  }
  return withCheckedContinuation<A>(isolation:function:_:)(v2, v3, &protocol witness table for MainActor, 0x7341646572616873, 0xEB00000000636E79, v7, v4, v6);
}

uint64_t sub_100004A88()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 80);
  v3 = *(_QWORD *)(*v0 + 72);
  swift_task_dealloc(*(_QWORD *)(*v0 + 88));
  swift_release(v3);
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100004AF0, *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64));
}

uint64_t sub_100004AF0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 48));
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 24));
}

uint64_t sub_100004B24()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 104);
  v3 = *(_QWORD *)(*v0 + 96);
  swift_task_dealloc(*(_QWORD *)(*v0 + 112));
  swift_release(v3);
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100004B8C, *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64));
}

uint64_t sub_100004B8C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 48));
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

void sub_100004BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[5];
  uint64_t v16;

  v4 = sub_100005E18(&qword_10003C838);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  __chkstk_darwin();
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C710 != -1)
    swift_once(&qword_10003C710, sub_100005864);
  v8 = dispatch thunk of DataModel.homeManager.getter();
  if (v8)
  {
    v9 = (void *)v8;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
    v10 = *(unsigned __int8 *)(v5 + 80);
    v11 = (v10 + 16) & ~v10;
    v12 = (v6 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
    v13 = swift_allocObject(&unk_1000390D0, v12 + 8, v10 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v13 + v11, v7, v4);
    *(_QWORD *)(v13 + v12) = a2;
    aBlock[4] = sub_100005F2C;
    v16 = v13;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100004EA8;
    aBlock[3] = &unk_1000390E8;
    v14 = _Block_copy(aBlock);
    swift_release(v16);
    swift_unknownObjectRelease(objc_msgSend(v9, "_refreshBeforeDate:completionHandler:", 0, v14));
    _Block_release(v14);

  }
}

uint64_t sub_100004D4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DataModel(0);
  v4 = static DataModel.modelLogger.getter();
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "homemanager refresh is done", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_10003C710 != -1)
    swift_once(&qword_10003C710, sub_100005864);
  v12 = qword_10003C718;
  v8 = (id)qword_10003C718;
  v9 = sub_100005E18(&qword_10003C838);
  return CheckedContinuation.resume(returning:)(&v12, v9);
}

void sub_100004EA8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

uint64_t sub_100004EFC(uint64_t a1, uint64_t a2)
{
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
  uint64_t v17;

  v4 = sub_100005E18(&qword_10003C838);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  __chkstk_darwin();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E18(&qword_10003C840);
  __chkstk_darwin();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  type metadata accessor for MainActor(0);
  v11 = static MainActor.shared.getter();
  v12 = *(unsigned __int8 *)(v5 + 80);
  v13 = (v12 + 40) & ~v12;
  v14 = (char *)swift_allocObject(&unk_100039120, v13 + v6, v12 | 7);
  *((_QWORD *)v14 + 2) = v11;
  *((_QWORD *)v14 + 3) = &protocol witness table for MainActor;
  *((_QWORD *)v14 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v14[v13], v7, v4);
  v15 = sub_10000445C((uint64_t)v9, (uint64_t)&unk_10003C850, (uint64_t)v14);
  return swift_release(v15);
}

uint64_t sub_100005058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5[5] = a4;
  v5[6] = a5;
  v6 = sub_100005E18(&qword_10003C840);
  v5[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100005E18(&qword_10003C838);
  v5[8] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[9] = v8;
  v9 = *(_QWORD *)(v8 + 64);
  v5[10] = v9;
  v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[11] = swift_task_alloc(v10);
  v5[12] = swift_task_alloc(v10);
  v5[13] = swift_task_alloc(v10);
  v11 = type metadata accessor for MainActor(0);
  v5[14] = v11;
  v5[15] = static MainActor.shared.getter();
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  v5[16] = v12;
  v5[17] = v13;
  return swift_task_switch(sub_100005138, v12, v13);
}

uint64_t sub_100005138()
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
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);

  if (qword_10003C6F0 != -1)
    swift_once(&qword_10003C6F0, sub_1000039D4);
  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 48);
  v8 = qword_10003D4A8;
  *(_QWORD *)(v0 + 144) = qword_10003D4A8;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(_QWORD *)(v0 + 152) = v9;
  v9(v2, v6, v5);
  v9(v1, v2, v5);
  LODWORD(v10) = *(_DWORD *)(v4 + 80);
  *(_DWORD *)(v0 + 176) = v10;
  v10 = v10;
  v11 = (v10 + 24) & ~v10;
  v12 = swift_allocObject(&unk_100039170, v11 + v3, v10 | 7);
  *(_QWORD *)(v0 + 160) = v12;
  *(_QWORD *)(v12 + 16) = v7;
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
  *(_QWORD *)(v0 + 168) = v13;
  v13(v12 + v11, v2, v5);
  return swift_task_switch(sub_100005234, v8, 0);
}

uint64_t sub_100005234()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char **v21;
  char *v22;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 144);
  if (*(_BYTE *)(v1 + 112) == 1)
  {
    v2 = qword_10003C710;
    v3 = *(id *)(v1 + 128);
    if (v2 != -1)
      swift_once(&qword_10003C710, sub_100005864);
    v4 = *(unsigned __int8 *)(v0 + 176);
    v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 152);
    v30 = *(_QWORD *)(v0 + 160);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 168);
    v6 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 96);
    v28 = *(_QWORD *)(v0 + 80);
    v8 = *(_QWORD *)(v0 + 56);
    v9 = *(_QWORD *)(v0 + 64);
    v29 = *(_QWORD *)(v0 + 40);
    v10 = v3;
    dispatch thunk of DataModel.homeManager.setter(v3);
    v11 = type metadata accessor for TaskPriority(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
    v5(v6, v7, v9);
    v12 = v10;
    v13 = static MainActor.shared.getter();
    v14 = (v4 + 48) & ~v4;
    v15 = (_QWORD *)swift_allocObject(&unk_1000391C0, v28 + v14, v4 | 7);
    v15[2] = v13;
    v15[3] = &protocol witness table for MainActor;
    v15[4] = v29;
    v15[5] = v12;
    v16 = (char *)v15 + v14;
    v17 = v30;
    v31(v16, v6, v9);
    v18 = sub_10000445C(v8, (uint64_t)&unk_10003C870, (uint64_t)v15);
    swift_release(v18);

  }
  else
  {
    v19 = *(_QWORD *)(v0 + 160);
    v20 = swift_allocObject(&unk_100039198, 32, 7);
    *(_QWORD *)(v20 + 16) = sub_100006228;
    *(_QWORD *)(v20 + 24) = v19;
    v21 = (char **)(v1 + 120);
    swift_beginAccess(v1 + 120, v0 + 16, 33, 0);
    v22 = *(char **)(v1 + 120);
    swift_retain(v19);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v22);
    *(_QWORD *)(v1 + 120) = v22;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v22 = sub_100026D10(0, *((_QWORD *)v22 + 2) + 1, 1, v22);
      *v21 = v22;
    }
    v25 = *((_QWORD *)v22 + 2);
    v24 = *((_QWORD *)v22 + 3);
    if (v25 >= v24 >> 1)
    {
      v22 = sub_100026D10((char *)(v24 > 1), v25 + 1, 1, v22);
      *v21 = v22;
    }
    v17 = *(_QWORD *)(v0 + 160);
    *((_QWORD *)v22 + 2) = v25 + 1;
    v26 = &v22[16 * v25];
    *((_QWORD *)v26 + 4) = sub_10000626C;
    *((_QWORD *)v26 + 5) = v20;
    swift_endAccess(v0 + 16);
  }
  swift_release(v17);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 64));
  return swift_task_switch(sub_1000054B0, *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
}

uint64_t sub_1000054B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 56);
  swift_release(*(_QWORD *)(v0 + 120));
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005514(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;

  v6 = sub_100005E18(&qword_10003C838);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin();
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E18(&qword_10003C840);
  __chkstk_darwin();
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C710 != -1)
    swift_once(&qword_10003C710, sub_100005864);
  v12 = a1;
  dispatch thunk of DataModel.homeManager.setter(a1);
  v13 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  type metadata accessor for MainActor(0);
  v14 = v12;
  v15 = static MainActor.shared.getter();
  v16 = *(unsigned __int8 *)(v7 + 80);
  v17 = (v16 + 48) & ~v16;
  v18 = (char *)swift_allocObject(&unk_1000391E8, v17 + v8, v16 | 7);
  *((_QWORD *)v18 + 2) = v15;
  *((_QWORD *)v18 + 3) = &protocol witness table for MainActor;
  *((_QWORD *)v18 + 4) = a2;
  *((_QWORD *)v18 + 5) = v14;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v18[v17], v9, v6);
  v19 = sub_10000445C((uint64_t)v11, (uint64_t)&unk_10003C878, (uint64_t)v18);
  return swift_release(v19);
}

uint64_t sub_1000056C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[3] = a5;
  v6[4] = a6;
  v7 = type metadata accessor for MainActor(0);
  v6[5] = static MainActor.shared.getter();
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v6[6] = v8;
  v6[7] = v9;
  return swift_task_switch(sub_100005730, v8, v9);
}

uint64_t sub_100005730()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_10003C710 != -1)
    swift_once(&qword_10003C710, sub_100005864);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to DataModel.loadUpHomeSnapshots(homeManager:)[1]);
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_1000057B0;
  return DataModel.loadUpHomeSnapshots(homeManager:)(*(_QWORD *)(v0 + 24));
}

uint64_t sub_1000057B0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 64));
  return swift_task_switch(sub_1000057FC, *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_1000057FC()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;

  swift_release(*(_QWORD *)(v0 + 40));
  byte_10003C720 = 1;
  v1 = (void *)qword_10003C718;
  *(_QWORD *)(v0 + 16) = qword_10003C718;
  v2 = v1;
  v3 = sub_100005E18(&qword_10003C838);
  CheckedContinuation.resume(returning:)(v0 + 16, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005864()
{
  uint64_t result;

  type metadata accessor for DataModel(0);
  result = static DataModel.shared.getter();
  qword_10003C718 = result;
  return result;
}

unint64_t variable initialization expression of HistoricalUsageWidget.kind()
{
  return 0xD000000000000015;
}

unint64_t variable initialization expression of UtilityRateInfoWidget.kind()
{
  return 0xD000000000000015;
}

unint64_t variable initialization expression of EnergyForecastWidget.kind()
{
  return 0xD000000000000014;
}

uint64_t sub_1000058E8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000594C;
  return v6(a1);
}

uint64_t sub_10000594C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_100005998(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (qword_10003C708 != -1)
    swift_once(&qword_10003C708, sub_100003E14);
  v4 = type metadata accessor for Logger(0);
  sub_1000064B0(v4, (uint64_t)qword_10003D4B0);
  v5 = swift_retain_n(a2, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v17 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = swift_allocObject(&unk_1000392D8, 32, 7);
    *(_QWORD *)(v10 + 16) = a1;
    *(_QWORD *)(v10 + 24) = a2;
    v15 = (uint64_t)sub_1000066AC;
    v16 = v10;
    swift_retain(a2);
    v11 = sub_100005E18(&qword_10003C8B0);
    v12 = String.init<A>(describing:)(&v15, v11);
    v14 = v13;
    v15 = sub_10000F4DC(v12, v13, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v8 + 4, v8 + 12);
    swift_release_n(a2, 2);
    swift_bridgeObjectRelease(v14);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_release_n(a2, 2);
  }
}

uint64_t _s26HomeEnergyWidgetsExtension0A12ManagerActorC04homeE14DidUpdateHomesyySo06HMHomeE0CF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v23[4];

  v1 = v0;
  sub_100005E18(&qword_10003C840);
  __chkstk_darwin();
  v3 = (char *)v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TaskPriority(0);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject(&unk_100039210, 40, 7);
  v6[2] = 0;
  v7 = v6 + 2;
  v6[3] = 0;
  v6[4] = v1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  v9 = swift_retain(v1);
  if (v8 == 1)
  {
    sub_1000060F0((uint64_t)v3);
    v10 = 0;
    v11 = 0;
    v12 = 7168;
  }
  else
  {
    v13 = TaskPriority.rawValue.getter(v9);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    v12 = v13 | 0x1C00;
    v14 = *v7;
    if (*v7)
    {
      v15 = v6[3];
      ObjectType = swift_getObjectType(*v7);
      swift_unknownObjectRetain(v14, v17);
      v10 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v15);
      v11 = v18;
      swift_unknownObjectRelease(v14);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
  }
  v19 = swift_allocObject(&unk_100039238, 32, 7);
  *(_QWORD *)(v19 + 16) = &unk_10003C888;
  *(_QWORD *)(v19 + 24) = v6;
  if (v11 | v10)
  {
    v23[0] = 0;
    v23[1] = 0;
    v20 = v23;
    v23[2] = v10;
    v23[3] = v11;
  }
  else
  {
    v20 = 0;
  }
  v21 = swift_task_create(v12, v20, (char *)&type metadata for () + 8, &unk_10003C890, v19);
  return swift_release(v21);
}

uint64_t sub_100005D48(uint64_t a1)
{
  uint64_t v1;

  return sub_100004EFC(a1, *(_QWORD *)(v1 + 16));
}

void sub_100005D50(uint64_t a1)
{
  uint64_t v1;

  sub_100004BBC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100005D58(__int128 *a1)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  if (!sub_10002F330(2, 17, 0, 0))
    return v2;
  v3 = v2;
  return swift_getOpaqueTypeMetadata2(0, &v3, &opaque type descriptor for <<opaque return type of WidgetConfiguration._contentMarginsDisabled()>>, 0);
}

uint64_t sub_100005DBC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v2 = *a1;
  v1 = a1[1];
  if (sub_10002F330(2, 17, 0, 0))
  {
    v4[0] = v2;
    v4[1] = v1;
    return swift_getOpaqueTypeConformance2(v4, &opaque type descriptor for <<opaque return type of WidgetConfiguration._contentMarginsDisabled()>>, 1);
  }
  return v1;
}

uint64_t sub_100005E18(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005E58(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for HomeManagerActor()
{
  return objc_opt_self(_TtC26HomeEnergyWidgetsExtension16HomeManagerActor);
}

uint64_t sub_100005EBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = sub_100005E18(&qword_10003C838);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = ((*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100005F2C()
{
  sub_100005E18(&qword_10003C838);
  return sub_100004D4C();
}

uint64_t sub_100005F80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100005F90(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100005F98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100005E18(&qword_10003C838);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100006010(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_100005E18(&qword_10003C838) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc(dword_10003C84C);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1000060A8;
  return sub_100005058(a1, v5, v6, v7, v8);
}

uint64_t sub_1000060A8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000060F0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005E18(&qword_10003C840);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006130()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006154(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003C85C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000670C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10003C858 + dword_10003C858))(a1, v4);
}

uint64_t sub_1000061C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100005E18(&qword_10003C838);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100006228(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_100005E18(&qword_10003C838) - 8) + 80);
  return sub_100005514(a1, *(_QWORD *)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

uint64_t sub_10000626C(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_100006294(uint64_t a1)
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

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_100005E18(&qword_10003C838) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + ((v4 + 48) & ~v4);
  v10 = (_QWORD *)swift_task_alloc(dword_10003C86C);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_10000670C;
  return sub_1000056C4(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_100006334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100005E18(&qword_10003C838);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 48) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000063B4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000063E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc(dword_10003C884);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10000670C;
  v3[2] = v2;
  return swift_task_switch(sub_1000045BC, v2, 0);
}

uint64_t sub_100006440(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003C85C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000060A8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10003C858 + dword_10003C858))(a1, v4);
}

uint64_t sub_1000064B0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_1000064C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_100006508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100005E18(&qword_10003C898);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100006580(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_100005E18(&qword_10003C898) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc(dword_10003C8A4);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10000670C;
  return sub_100004140(a1, v5, v6, v7);
}

uint64_t sub_100006608()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100005E18(&qword_10003C898);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000666C(void *a1)
{
  sub_100005E18(&qword_10003C898);
  return sub_100004418(a1);
}

uint64_t sub_1000066AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_1000066D4(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_100006724()
{
  return sub_10000C440(&qword_10003C920, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_100030918);
}

uint64_t type metadata accessor for ForecastLocationEntity(uint64_t a1)
{
  uint64_t result;

  result = qword_10003CA50;
  if (!qword_10003CA50)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ForecastLocationEntity);
  return result;
}

uint64_t sub_10000678C()
{
  return sub_10000C440(&qword_10003C928, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_100030950);
}

uint64_t sub_1000067B8()
{
  return sub_10000C440(&qword_10003C930, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_1000308B8);
}

unint64_t sub_1000067E8()
{
  unint64_t result;

  result = qword_10003C938;
  if (!qword_10003C938)
  {
    result = swift_getWitnessTable(&unk_100030A80, &type metadata for ForecastLocationQuery);
    atomic_store(result, (unint64_t *)&qword_10003C938);
  }
  return result;
}

void *sub_10000682C()
{
  return &protocol witness table for UUID;
}

uint64_t sub_100006838@<X0>(uint64_t a1@<X8>)
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  Swift::String v36;
  void *object;
  Swift::String v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  Swift::String v44;
  void *v45;
  Swift::String v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  Swift::String v69;

  v2 = v1;
  v68 = a1;
  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v62 = *(_QWORD *)(v3 - 8);
  v63 = v3;
  ((void (*)(void))__chkstk_darwin)();
  v65 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale(0);
  ((void (*)(void))__chkstk_darwin)();
  v60 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for String.LocalizationValue(0);
  ((void (*)(void))__chkstk_darwin)();
  v59 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E18(&qword_10003CB10);
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v64 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v61 = (char *)&v56 - v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v56 - v11;
  v13 = sub_100005E18(&qword_10003CAA0);
  v14 = __chkstk_darwin(v13);
  v58 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v57 = (char *)&v56 - v17;
  __chkstk_darwin(v16);
  v19 = (char *)&v56 - v18;
  v20 = type metadata accessor for LocalizedStringResource(0);
  v66 = *(_QWORD *)(v20 - 8);
  v67 = v20;
  v21 = __chkstk_darwin(v20);
  v23 = (char *)&v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v21);
  v26 = (char *)&v56 - v25;
  __chkstk_darwin(v24);
  v28 = (char *)&v56 - v27;
  v29 = type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  v30 = __chkstk_darwin(v29);
  v32 = (char *)&v56 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  v34 = (char *)&v56 - v33;
  v35 = type metadata accessor for ForecastLocationEntity(0);
  if (*(_BYTE *)(v2 + *(int *)(v35 + 28) + 16))
  {
    if (*(_BYTE *)(v2 + *(int *)(v35 + 28) + 16) == 1)
    {
      String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1);
      v36._countAndFlagsBits = 0;
      v36._object = (void *)0xE000000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v36);
      EntityProperty.wrappedValue.getter(&v69);
      object = v69._object;
      String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v69);
      swift_bridgeObjectRelease(object);
      v38._countAndFlagsBits = 0;
      v38._object = (void *)0xE000000000000000;
      String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v38);
      LocalizedStringResource.init(stringInterpolation:)(v32);
      v39 = v57;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v57, 1, 1, v67);
      v40 = v61;
      DisplayRepresentation.Image.init(systemName:isTemplate:)(0x676E69646C697562, 0xEA0000000000322ELL, 2);
      v41 = type metadata accessor for DisplayRepresentation.Image(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v40, 0, 1, v41);
      v42 = v26;
      v43 = v39;
    }
    else
    {
      v49 = v59;
      v50 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000010, 0x8000000100031E40);
      v51 = v60;
      static Locale.current.getter(v50);
      v52 = v65;
      (*(void (**)(char *, _QWORD, uint64_t))(v62 + 104))(v65, enum case for LocalizedStringResource.BundleDescription.main(_:), v63);
      LocalizedStringResource.init(_:table:locale:bundle:comment:)(v49, 0xD000000000000016, 0x8000000100031C60, v51, v52, "The user's current location (for Grid Forecast widget configuration)", 68, 2);
      v53 = v58;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v58, 1, 1, v67);
      v40 = v64;
      DisplayRepresentation.Image.init(systemName:isTemplate:)(0x6E6F697461636F6CLL, 0xE800000000000000, 2);
      v54 = type metadata accessor for DisplayRepresentation.Image(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v40, 0, 1, v54);
      v42 = v23;
      v43 = v53;
    }
    v48 = v40;
  }
  else
  {
    String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1);
    v44._countAndFlagsBits = 0;
    v44._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v44);
    EntityProperty.wrappedValue.getter(&v69);
    v45 = v69._object;
    String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v69);
    swift_bridgeObjectRelease(v45);
    v46._countAndFlagsBits = 0;
    v46._object = (void *)0xE000000000000000;
    String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v46);
    LocalizedStringResource.init(stringInterpolation:)(v34);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v19, 1, 1, v67);
    DisplayRepresentation.Image.init(systemName:isTemplate:)(0x6573756F68, 0xE500000000000000, 2);
    v47 = type metadata accessor for DisplayRepresentation.Image(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v12, 0, 1, v47);
    v42 = v28;
    v43 = v19;
    v48 = v12;
  }
  return DisplayRepresentation.init(title:subtitle:image:)(v42, v43, v48);
}

uint64_t sub_100006DB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD v21[2];

  v0 = sub_100005E18(&qword_10003CAA0);
  __chkstk_darwin(v0);
  v21[0] = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_1000064C8(v16, qword_10003D4C8);
  sub_1000064B0(v16, (uint64_t)qword_10003D4C8);
  v17 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x8000000100031F80);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0xD000000000000016, 0x8000000100031C60, v8, v5, "The name of the location entity in AppIntents", 45, 2);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v21[0];
  v18(v21[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t sub_100006FDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26[2];

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ForecastLocationEntity(0);
  v10 = *(int *)(v9 + 24);
  sub_100005E18(&qword_10003CAD0);
  LocalizedStringResource.init(stringLiteral:)(0x6E6F697461636F4CLL, 0xED0000656D616E20);
  *(_QWORD *)(a1 + v10) = EntityProperty<>.init(title:)(v8);
  v11 = static Logger.gridForecastWidgets.getter();
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = swift_slowAlloc(32, -1);
    v24 = v10;
    v16 = v15;
    v26[0] = v15;
    v23 = v2;
    *(_DWORD *)v14 = 136315138;
    v25 = sub_10000F4DC(0x292874696E69, 0xE600000000000000, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26, v14 + 4, v14 + 12);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "ForecastLocationEntity:%s creating a Current Location entity.", v14, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    v17 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v23);
  }
  else
  {

    v17 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  UUID.init()(v17);
  if (qword_10003C730 != -1)
    swift_once(&qword_10003C730, sub_1000077F4);
  v18 = type metadata accessor for UUID(0);
  v19 = sub_1000064B0(v18, (uint64_t)qword_10003D4E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(a1, v19, v18);
  v20 = a1 + *(int *)(v9 + 28);
  *(_QWORD *)v20 = 0;
  *(_QWORD *)(v20 + 8) = 0;
  *(_BYTE *)(v20 + 16) = 2;
  v26[0] = 0xD000000000000010;
  v26[1] = 0x8000000100031E40;
  return EntityProperty.wrappedValue.setter(v26);
}

uint64_t sub_1000072B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_BYTE *, uint64_t, uint64_t);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  _BYTE v38[12];
  int v39;
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
  uint64_t v50[2];

  v48 = a2;
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v38[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for Logger(0);
  v46 = *(_QWORD *)(v11 - 8);
  v47 = v11;
  __chkstk_darwin(v11);
  v13 = &v38[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v14);
  v16 = &v38[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v44 = type metadata accessor for ForecastLocationEntity(0);
  v17 = *(int *)(v44 + 24);
  sub_100005E18(&qword_10003CAD0);
  LocalizedStringResource.init(stringLiteral:)(0x6E6F697461636F4CLL, 0xED0000656D616E20);
  v18 = EntityProperty<>.init(title:)(v16);
  v45 = v17;
  *(_QWORD *)&a4[v17] = v18;
  static Logger.gridForecastWidgets.getter();
  v43 = v8;
  v19 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16);
  v19(v10, a1, v7);
  swift_bridgeObjectRetain_n(a3, 2);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.default.getter();
  v23 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    v24 = swift_slowAlloc(32, -1);
    v42 = a1;
    v25 = v24;
    v40 = swift_slowAlloc(96, -1);
    v50[0] = v40;
    *(_DWORD *)v25 = 136315650;
    v49 = sub_10000F4DC(0xD000000000000016, 0x8000000100031E20, v50);
    v41 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, v50, v25 + 4, v25 + 12);
    v39 = v23;
    *(_WORD *)(v25 + 12) = 2080;
    swift_bridgeObjectRetain(a3);
    v49 = sub_10000F4DC(v48, a3, v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, v50, v25 + 14, v25 + 22);
    v26 = swift_bridgeObjectRelease_n(a3, 3);
    *(_WORD *)(v25 + 22) = 2080;
    v27 = UUID.uuidString.getter(v26);
    v29 = v28;
    v49 = sub_10000F4DC(v27, v28, v50);
    v7 = v41;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, v50, v25 + 24, v25 + 32);
    swift_bridgeObjectRelease(v29);
    v30 = *(uint64_t (**)(uint64_t, uint64_t))(v43 + 8);
    v30((uint64_t)v10, v7);
    _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v39, "ForecastLocationEntity:%s creating a HMHome entity: %s : %s", (uint8_t *)v25, 0x20u);
    v31 = v40;
    swift_arrayDestroy(v40, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v31, -1, -1);
    v32 = v25;
    a1 = v42;
    swift_slowDealloc(v32, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a3, 2);
    v30 = *(uint64_t (**)(uint64_t, uint64_t))(v43 + 8);
    v30((uint64_t)v10, v7);
  }

  v33 = (*(uint64_t (**)(_BYTE *, uint64_t))(v46 + 8))(v13, v47);
  v34 = v44;
  UUID.init()(v33);
  v19(a4, a1, v7);
  v35 = &a4[*(int *)(v34 + 28)];
  v36 = v48;
  *(_QWORD *)v35 = v48;
  *((_QWORD *)v35 + 1) = a3;
  v35[16] = 0;
  v50[0] = v36;
  v50[1] = a3;
  swift_bridgeObjectRetain(a3);
  EntityProperty.wrappedValue.setter(v50);
  return v30(a1, v7);
}

unint64_t sub_100007668()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  void *object;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String v8;
  void *v9;
  void *v10;
  Swift::String v12;
  unint64_t v13;
  unint64_t v14;

  v1 = type metadata accessor for ForecastLocationEntity(0);
  if (*(_BYTE *)(v0 + *(int *)(v1 + 28) + 16))
  {
    if (*(_BYTE *)(v0 + *(int *)(v1 + 28) + 16) != 1)
    {
      v13 = 0xD000000000000010;
      v5 = 0x8000000100031CF0;
      goto LABEL_7;
    }
    v13 = 0;
    _StringGuts.grow(_:)(26);
    swift_bridgeObjectRelease(0xE000000000000000);
    v2 = 0xD000000000000018;
    v3 = 0x8000000100031D10;
  }
  else
  {
    v2 = 0x746E4520656D6F48;
    v3 = 0xED0000203A797469;
  }
  v13 = v2;
  v14 = v3;
  EntityProperty.wrappedValue.getter(&v12);
  object = v12._object;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(object);
  v5 = v14;
LABEL_7:
  v14 = v5;
  v12._countAndFlagsBits = 0x4449677562656420;
  v12._object = (void *)0xEA0000000000203ALL;
  v6 = type metadata accessor for UUID(0);
  v7 = sub_10000C440(&qword_10003CAB0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v6, v7);
  v9 = v8._object;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v9);
  v10 = v12._object;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(v10);
  return v13;
}

uint64_t sub_1000077F4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v0 = sub_100005E18(&qword_10003CAD8);
  __chkstk_darwin(v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for UUID(0);
  sub_1000064C8(v3, qword_10003D4E0);
  v4 = sub_1000064B0(v3, (uint64_t)qword_10003D4E0);
  UUID.init(uuidString:)(0xD000000000000024, 0x8000000100031E60);
  v5 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  __break(1u);
  return result;
}

uint64_t sub_1000078D4(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)(v3 + 72) = a2;
  *(_QWORD *)(v3 + 80) = a3;
  *(_BYTE *)(v3 + 184) = a1;
  v4 = sub_100005E18(&qword_10003CA98);
  *(_QWORD *)(v3 + 88) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ForecastLocationEntity(0);
  *(_QWORD *)(v3 + 96) = v5;
  v6 = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 104) = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v3 + 112) = swift_task_alloc(v7);
  *(_QWORD *)(v3 + 120) = swift_task_alloc(v7);
  *(_QWORD *)(v3 + 128) = swift_task_alloc(v7);
  v8 = type metadata accessor for Logger(0);
  *(_QWORD *)(v3 + 136) = v8;
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v3 + 144) = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v3 + 152) = swift_task_alloc(v10);
  *(_QWORD *)(v3 + 160) = swift_task_alloc(v10);
  return swift_task_switch(sub_1000079B0, 0, 0);
}

uint64_t sub_1000079B0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  id v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = v0;
  v2 = v0[10];
  v1[2] = &_swiftEmptyArrayStorage;
  v3 = objc_msgSend((id)objc_opt_self(HMFLocationAuthorization), "sharedAuthorization");
  v4 = objc_msgSend(v3, "isAuthorized");

  static Logger.gridForecastWidgets.getter();
  swift_bridgeObjectRetain_n(v2, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v21 = v1[18];
    v22 = v1[17];
    v23 = v1[20];
    v8 = v1[10];
    v19 = v1[9];
    v9 = swift_slowAlloc(32, -1);
    v20 = swift_slowAlloc(96, -1);
    v24 = v20;
    *(_DWORD *)v9 = 136315650;
    v1[6] = sub_10000F4DC(0xD000000000000026, 0x8000000100031F50, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 6, v1 + 7, v9 + 4, v9 + 12);
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain(v8);
    v1[7] = sub_10000F4DC(v19, v8, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 7, v1 + 8, v9 + 14, v9 + 22);
    swift_bridgeObjectRelease_n(v8, 3);
    *(_WORD *)(v9 + 22) = 2080;
    if (v4)
      v10 = 21321;
    else
      v10 = 0x544F4E207369;
    if (v4)
      v11 = 0xE200000000000000;
    else
      v11 = 0xE600000000000000;
    v1[8] = sub_10000F4DC(v10, v11, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 8, v1 + 9, v9 + 24, v9 + 32);
    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s from %s: HMFLocationAuthorization %s authorized", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy(v20, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v9, -1, -1);

    v12 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v12(v23, v22);
  }
  else
  {
    v13 = v1[20];
    v14 = v1[17];
    v15 = v1[18];
    swift_bridgeObjectRelease_n(v1[10], 2);

    v12 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v12(v13, v14);
  }
  v1[21] = v12;
  v16 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v1[22] = v16;
  v17 = sub_1000066D4(0, &qword_10003C770, HMHomeManager_ptr);
  *v16 = v1;
  v16[1] = sub_100007CD4;
  return withCheckedContinuation<A>(isolation:function:_:)(v1 + 3, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004008, 0, v17);
}

uint64_t sub_100007CD4()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 176));
  return swift_task_switch(sub_100007D28, 0, 0);
}

uint64_t sub_100007D28()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
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
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  unint64_t v46;
  void *v47[2];

  v3 = *(void **)(v0 + 24);
  v4 = objc_msgSend(v3, "homes");

  v5 = sub_1000066D4(0, &qword_10003CAE0, HMHome_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  static Logger.gridForecastWidgets.getter();
  swift_bridgeObjectRetain_n(v6, 2);
  v8 = Logger.logObject.getter(v7);
  LOBYTE(v9) = static os_log_type_t.default.getter();
  v10 = (unint64_t)v6 >> 62;
  if (!os_log_type_enabled((os_log_t)v8, (os_log_type_t)v9))
  {
    v15 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
    v11 = *(_QWORD *)(v0 + 152);
    v9 = *(_QWORD *)(v0 + 136);
    swift_bridgeObjectRelease_n(v6, 2);

    v15(v11, v9);
    goto LABEL_6;
  }
  v2 = v0 + 40;
  v11 = swift_slowAlloc(22, -1);
  v1 = (void *)swift_slowAlloc(32, -1);
  v47[0] = v1;
  *(_DWORD *)v11 = 136315394;
  *(_QWORD *)(v0 + 32) = sub_10000F4DC(0xD000000000000026, 0x8000000100031F50, (uint64_t *)v47);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v11 + 4, v11 + 12);
  *(_WORD *)(v11 + 12) = 2048;
  if (v10)
    goto LABEL_32;
  v12 = v6;
  v13 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v14 = *(_QWORD *)(v0 + 152);
    v44 = *(_QWORD *)(v0 + 136);
    v45 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
    swift_bridgeObjectRelease(v12);
    *(_QWORD *)(v0 + 40) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v2, v0 + 48, v11 + 14, v11 + 22);
    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, (os_log_type_t)v9, "%s HomeManagerActor returned %ld home(s)", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy(v1, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v1, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    v45(v14, v44);
    v6 = v12;
LABEL_6:
    if (v10)
    {
      if (v6 < 0)
        v30 = v6;
      else
        v30 = v6 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v6);
      v8 = _CocoaArrayWrapper.endIndex.getter(v30);
      if (!v8)
      {
LABEL_25:
        v18 = &_swiftEmptyArrayStorage;
        goto LABEL_26;
      }
    }
    else
    {
      v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v6);
      if (!v8)
        goto LABEL_25;
    }
    if (v8 >= 1)
      break;
    __break(1u);
LABEL_32:
    if (v6 < 0)
      v43 = v6;
    else
      v43 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v6);
    v12 = v6;
    v13 = _CocoaArrayWrapper.endIndex.getter(v43);
    swift_bridgeObjectRelease(v12);
  }
  v16 = 0;
  v46 = v6 & 0xC000000000000001;
  v17 = *(_QWORD *)(v0 + 104);
  v18 = &_swiftEmptyArrayStorage;
  v19 = v6;
  do
  {
    if (v46)
      v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v16, v6);
    else
      v20 = *(id *)(v6 + 8 * v16 + 32);
    v21 = v20;
    v23 = *(NSObject **)(v0 + 88);
    v22 = *(_QWORD *)(v0 + 96);
    v24 = *(_BYTE *)(v0 + 184);
    v47[0] = v20;
    sub_100008210(v47, v24, v23);

    if ((*(unsigned int (**)(NSObject *, uint64_t, uint64_t))(v17 + 48))(v23, 1, v22) == 1)
    {
      sub_10000C404(*(_QWORD *)(v0 + 88), &qword_10003CA98);
      v6 = v19;
    }
    else
    {
      v26 = *(_QWORD *)(v0 + 112);
      v25 = *(_QWORD *)(v0 + 120);
      sub_10000C480(*(_QWORD *)(v0 + 88), v25);
      sub_10000C480(v25, v26);
      if ((swift_isUniquelyReferenced_nonNull_native(v18) & 1) == 0)
        v18 = (_QWORD *)sub_100026E1C(0, v18[2] + 1, 1, (unint64_t)v18);
      v6 = v19;
      v28 = v18[2];
      v27 = v18[3];
      if (v28 >= v27 >> 1)
        v18 = (_QWORD *)sub_100026E1C(v27 > 1, v28 + 1, 1, (unint64_t)v18);
      v29 = *(_QWORD *)(v0 + 112);
      v18[2] = v28 + 1;
      sub_10000C480(v29, (uint64_t)v18+ ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))+ *(_QWORD *)(v17 + 72) * v28);
    }
    ++v16;
  }
  while (v8 != v16);
LABEL_26:
  v31 = *(_QWORD *)(v0 + 128);
  swift_bridgeObjectRelease_n(v6, 2);
  sub_100018810((uint64_t)v18);
  sub_100006FDC(v31);
  v32 = *(_QWORD *)(v0 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native(v32) & 1) == 0)
    v32 = sub_100026E1C(0, *(_QWORD *)(v32 + 16) + 1, 1, v32);
  v34 = *(_QWORD *)(v32 + 16);
  v33 = *(_QWORD *)(v32 + 24);
  if (v34 >= v33 >> 1)
    v32 = sub_100026E1C(v33 > 1, v34 + 1, 1, v32);
  v36 = *(_QWORD *)(v0 + 152);
  v35 = *(_QWORD *)(v0 + 160);
  v38 = *(_QWORD *)(v0 + 120);
  v37 = *(_QWORD *)(v0 + 128);
  v39 = *(_QWORD *)(v0 + 104);
  v40 = *(_QWORD *)(v0 + 112);
  v41 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v32 + 16) = v34 + 1;
  sub_10000C480(v37, v32+ ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80))+ *(_QWORD *)(v39 + 72) * v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v32);
}

uint64_t sub_100008210@<X0>(void **a1@<X0>, char a2@<W1>, NSObject *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  os_log_t v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  __objc2_prot_list *v44;
  id v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  os_log_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v7 = type metadata accessor for UUID(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Logger(0);
  v59 = *(_QWORD *)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v53 - v14;
  v16 = *a1;
  v17 = objc_msgSend(v16, "location");

  if (v17 || (a2 & 1) == 0)
  {
    static Logger.gridForecastWidgets.getter();
    v32 = v16;
    v33 = Logger.logObject.getter(v32);
    v34 = static os_log_type_t.default.getter();
    v35 = v34;
    if (os_log_type_enabled(v33, v34))
    {
      v36 = swift_slowAlloc(22, -1);
      LODWORD(v54) = v35;
      v37 = v36;
      v55 = swift_slowAlloc(64, -1);
      v62 = v55;
      *(_DWORD *)v37 = 136315394;
      v58 = v10;
      v60 = sub_10000F4DC(0xD000000000000026, 0x8000000100031F50, &v62);
      v57 = v3;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v37 + 4, v37 + 12);
      *(_WORD *)(v37 + 12) = 2080;
      v53 = v37 + 14;
      v38 = objc_msgSend(v32, "name");
      v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v56 = a3;
      v41 = v40;

      v60 = sub_10000F4DC(v39, v41, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v53, v37 + 22);

      v42 = v41;
      a3 = v56;
      swift_bridgeObjectRelease(v42);
      _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)v54, "%s Creating entity for home '%s' with known location.", (uint8_t *)v37, 0x16u);
      v43 = v55;
      swift_arrayDestroy(v55, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v43, -1, -1);
      swift_slowDealloc(v37, -1, -1);

      v44 = &HomeManagerActor;
      (*(void (**)(char *, uint64_t))(v59 + 8))(v15, v58);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v59 + 8))(v15, v10);
      v44 = &HomeManagerActor;
    }
    v45 = objc_msgSend(v32, "uniqueIdentifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v46 = objc_msgSend(v32, (SEL)v44[185].count);
    v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v49 = v48;

    sub_1000072B0((uint64_t)v9, v47, v49, a3);
    v50 = type metadata accessor for ForecastLocationEntity(0);
    return (*(uint64_t (**)(NSObject *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(a3, 0, 1, v50);
  }
  else
  {
    static Logger.gridForecastWidgets.getter();
    v18 = v16;
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.default.getter();
    v21 = v20;
    if (os_log_type_enabled(v19, v20))
    {
      v22 = swift_slowAlloc(22, -1);
      v57 = swift_slowAlloc(64, -1);
      v62 = v57;
      *(_DWORD *)v22 = 136315394;
      v56 = v19;
      v60 = sub_10000F4DC(0xD000000000000026, 0x8000000100031F50, &v62);
      v58 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v22 + 4, v22 + 12);
      *(_WORD *)(v22 + 12) = 2080;
      v54 = v22 + 14;
      v23 = objc_msgSend(v18, "name");
      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      LODWORD(v55) = v21;
      v25 = a3;
      v26 = v24;
      v28 = v27;

      v29 = v26;
      a3 = v25;
      v60 = sub_10000F4DC(v29, v28, &v62);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v54, v22 + 22);

      swift_bridgeObjectRelease(v28);
      v30 = v56;
      _os_log_impl((void *)&_mh_execute_header, v56, (os_log_type_t)v55, "%s No location found for home '%s', skipping", (uint8_t *)v22, 0x16u);
      v31 = v57;
      swift_arrayDestroy(v57, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v59 + 8))(v13, v58);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v59 + 8))(v13, v10);
    }
    v52 = type metadata accessor for ForecastLocationEntity(0);
    return (*(uint64_t (**)(NSObject *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(a3, 1, 1, v52);
  }
}

uint64_t sub_10000876C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t (__cdecl *v8)();

  v1[7] = a1;
  v2 = type metadata accessor for UUID(0);
  v1[8] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Logger(0);
  v1[9] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v1[10] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[11] = swift_task_alloc(v5);
  v1[12] = swift_task_alloc(v5);
  v1[13] = swift_task_alloc(v5);
  v8 = (uint64_t (__cdecl *)())((char *)&dword_10003CAC8 + dword_10003CAC8);
  v6 = (_QWORD *)swift_task_alloc(unk_10003CACC);
  v1[14] = v6;
  *v6 = v1;
  v6[1] = sub_10000882C;
  return v8();
}

uint64_t sub_10000882C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 112);
  *(_QWORD *)(*(_QWORD *)v1 + 120) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100008888, 0, 0);
}

uint64_t sub_100008888(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  __objc2_prot_list *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  id v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v2 = *(void **)(v1 + 120);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v3, "location");

    if (v4)
      v6 = 0xEE002E6E6F697461;
    else
      v6 = 0x8000000100031DE0;
    static Logger.gridForecastWidgets.getter(v5);
    v7 = v3;
    v8 = swift_bridgeObjectRetain(v6);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.default.getter();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v1 + 104);
    v13 = &HomeManagerActor;
    v14 = *(_QWORD *)(v1 + 72);
    v60 = *(_QWORD *)(v1 + 80);
    if (v11)
    {
      v53 = v1 + 48;
      v15 = 0xD000000000000031;
      if (v4)
        v15 = 0x636F6C20444F4F47;
      v55 = v15;
      v16 = swift_slowAlloc(32, -1);
      v56 = swift_slowAlloc(96, -1);
      v61 = v56;
      *(_DWORD *)v16 = 136315650;
      v58 = v12;
      *(_QWORD *)(v1 + 32) = sub_10000F4DC(0xD000000000000012, 0x8000000100031DC0, &v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 32, v1 + 40, v16 + 4, v16 + 12);
      *(_WORD *)(v16 + 12) = 2080;
      v17 = objc_msgSend(v7, "name");
      v54 = v14;
      v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v20 = v19;

      *(_QWORD *)(v1 + 40) = sub_10000F4DC(v18, v20, &v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 40, v53, v16 + 14, v16 + 22);
      v21 = v20;
      v13 = &HomeManagerActor;
      swift_bridgeObjectRelease(v21);

      *(_WORD *)(v16 + 22) = 2080;
      swift_bridgeObjectRetain(v6);
      *(_QWORD *)(v1 + 48) = sub_10000F4DC(v55, v6, &v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v53, v1 + 56, v16 + 24, v16 + 32);
      swift_bridgeObjectRelease_n(v6, 3);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s returning default entity for current home '%s' with %s", (uint8_t *)v16, 0x20u);
      swift_arrayDestroy(v56, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v56, -1, -1);
      swift_slowDealloc(v16, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v58, v54);
    }
    else
    {

      swift_bridgeObjectRelease_n(v6, 2);
      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v12, v14);
    }
    v34 = *(_BYTE **)(v1 + 56);
    v33 = *(_QWORD *)(v1 + 64);
    v35 = objc_msgSend(v7, "uniqueIdentifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v36 = objc_msgSend(v7, (SEL)v13[185].count);
    v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v39 = v38;

    sub_1000072B0(v33, v37, v39, v34);
  }
  else
  {
    v22 = static Logger.gridForecastWidgets.getter(a1);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.default.getter();
    v25 = os_log_type_enabled(v23, v24);
    v26 = *(_QWORD *)(v1 + 96);
    v28 = *(_QWORD *)(v1 + 72);
    v27 = *(_QWORD *)(v1 + 80);
    if (v25)
    {
      v57 = *(_QWORD *)(v1 + 72);
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      v61 = v30;
      *(_DWORD *)v29 = 136315138;
      *(_QWORD *)(v1 + 24) = sub_10000F4DC(0xD000000000000012, 0x8000000100031DC0, &v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v29 + 4, v29 + 12);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%s no current home found.", v29, 0xCu);
      swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);

      v31 = *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8);
      v32 = v31(v26, v57);
    }
    else
    {

      v31 = *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8);
      v32 = v31(v26, v28);
    }
    v40 = static Logger.gridForecastWidgets.getter(v32);
    v41 = Logger.logObject.getter(v40);
    v42 = static os_log_type_t.default.getter();
    v43 = os_log_type_enabled(v41, v42);
    v44 = *(_QWORD *)(v1 + 88);
    v45 = *(_QWORD *)(v1 + 72);
    if (v43)
    {
      v59 = *(_QWORD *)(v1 + 88);
      v46 = (uint8_t *)swift_slowAlloc(12, -1);
      v47 = swift_slowAlloc(32, -1);
      v61 = v47;
      *(_DWORD *)v46 = 136315138;
      *(_QWORD *)(v1 + 16) = sub_10000F4DC(0xD000000000000012, 0x8000000100031DC0, &v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v46 + 4, v46 + 12);
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "%s returning default entity (Current Location)", v46, 0xCu);
      swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1, -1);
      swift_slowDealloc(v46, -1, -1);

      v48 = v59;
    }
    else
    {

      v48 = v44;
    }
    v31(v48, v45);
    sub_100006FDC(*(_QWORD *)(v1 + 56));
  }
  v49 = *(_QWORD *)(v1 + 96);
  v50 = *(_QWORD *)(v1 + 88);
  v51 = *(_QWORD *)(v1 + 64);
  swift_task_dealloc(*(_QWORD *)(v1 + 104));
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100008E90()
{
  return sub_10000C440(&qword_10003C940, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
}

uint64_t sub_100008EBC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_100008EF8()
{
  return sub_10000C440(&qword_10003C948, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_100030980);
}

uint64_t sub_100008F24()
{
  return sub_10000C440(&qword_10003C950, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_1000309A8);
}

uint64_t sub_100008F50()
{
  return sub_10000C440(&qword_10003C958, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_1000309D0);
}

uint64_t sub_100008F7C()
{
  return sub_10000C440(&qword_10003C960, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_100030A28);
}

uint64_t sub_100008FAC@<X0>(uint64_t a1@<X8>)
{
  return sub_100009D80(&qword_10003C728, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D4C8, (uint64_t)sub_100006DB0, a1);
}

uint64_t sub_100008FD0()
{
  return sub_100009750(&qword_10003C968, &qword_10003C970, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100008FFC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000C440(qword_10003C990, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_100030860);
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

uint64_t sub_10000904C()
{
  return sub_10000C440(&qword_10003C978, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_100030A58);
}

uint64_t sub_10000907C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000C440(&qword_10003C960, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_100030A28);
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000090D0()
{
  unint64_t result;

  result = qword_10003C980;
  if (!qword_10003C980)
  {
    result = swift_getWitnessTable(&unk_100030AD8, &type metadata for ForecastLocationQuery);
    atomic_store(result, (unint64_t *)&qword_10003C980);
  }
  return result;
}

unint64_t sub_100009118()
{
  unint64_t result;

  result = qword_10003C988;
  if (!qword_10003C988)
  {
    result = swift_getWitnessTable(&unk_100030B38, &type metadata for ForecastLocationQuery);
    atomic_store(result, (unint64_t *)&qword_10003C988);
  }
  return result;
}

uint64_t sub_10000915C()
{
  return sub_10000C440(qword_10003C990, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_100030860);
}

uint64_t sub_100009188(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1[4] = a1;
  v2 = sub_100005E18(&qword_10003CAA0);
  v1[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Logger(0);
  v1[6] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v1[7] = v4;
  v1[8] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (_QWORD *)swift_task_alloc(dword_10003CB04);
  v1[9] = v5;
  *v5 = v1;
  v5[1] = sub_100009238;
  return sub_1000078D4(1, 0xD000000000000019, 0x8000000100031EF0);
}

uint64_t sub_100009238(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 80) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100009294, 0, 0);
}

uint64_t sub_100009294()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;

  v1 = v0[10];
  v2 = *(_QWORD *)(v1 + 16);
  v3 = swift_bridgeObjectRelease(v1);
  v4 = static Logger.gridForecastWidgets.getter(v3);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = v0[7];
    v18 = v0[8];
    v8 = v0[6];
    v9 = swift_slowAlloc(22, -1);
    v10 = swift_slowAlloc(32, -1);
    v19 = v10;
    *(_DWORD *)v9 = 136315394;
    v0[2] = sub_10000F4DC(0xD000000000000013, 0x8000000100031F30, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v9 + 4, v9 + 12);
    *(_WORD *)(v9 + 12) = 2048;
    v0[3] = v2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 3, v0 + 4, v9 + 14, v9 + 22);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s returning %ld locations", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v18, v8);
  }
  else
  {
    v12 = v0[7];
    v11 = v0[8];
    v13 = v0[6];

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  v14 = v0[5];
  LocalizedStringResource.init(stringLiteral:)(0, 0xE000000000000000);
  v15 = type metadata accessor for LocalizedStringResource(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 0, 1, v15);
  v16 = (_QWORD *)swift_task_alloc(dword_10003CB04);
  v0[11] = v16;
  *v16 = v0;
  v16[1] = sub_1000094B4;
  return sub_1000078D4(1, 0xD000000000000018, 0x8000000100031F10);
}

uint64_t sub_1000094B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100009510, 0, 0);
}

uint64_t sub_100009510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = type metadata accessor for ForecastLocationEntity(0);
  v5 = sub_10000C440(&qword_10003C928, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_100030950);
  v6 = sub_10000C440(&qword_10003C958, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_1000309D0);
  IntentItemCollection.init<>(promptLabel:usesIndexedCollation:items:)(v3, 0, v1, v4, v5, v6);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000095D8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_10003CB08 + dword_10003CB08);
  v3 = (_QWORD *)swift_task_alloc(unk_10003CB0C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100009638;
  return v5(a1);
}

uint64_t sub_100009638(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(*v2 + 16);
  v5 = *v2;
  v6 = swift_task_dealloc(v4);
  if (!v1)
    v6 = a1;
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t sub_10000968C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10003CAFC);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1000060A8;
  return sub_100009188(a1);
}

unint64_t sub_1000096E0()
{
  unint64_t result;

  result = qword_10003C9A8;
  if (!qword_10003C9A8)
  {
    result = swift_getWitnessTable(&unk_100030B60, &type metadata for ForecastLocationQuery);
    atomic_store(result, (unint64_t *)&qword_10003C9A8);
  }
  return result;
}

uint64_t sub_100009724()
{
  return sub_100009750(&qword_10003C9B0, qword_10003C9B8, (uint64_t)&protocol conformance descriptor for IntentItemCollection<A>);
}

uint64_t sub_100009750(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100005E58(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009790(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000067E8();
  *v5 = v2;
  v5[1] = sub_10000670C;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000097FC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  *(_QWORD *)(v1 + 16) = a1;
  v3 = (_QWORD *)swift_task_alloc(dword_10003CAC4);
  *(_QWORD *)(v1 + 24) = v3;
  *v3 = v1;
  v3[1] = sub_100009850;
  return sub_10000876C(a1);
}

uint64_t sub_100009850()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 24));
  return swift_task_switch(sub_1000098A4, 0, 0);
}

uint64_t sub_1000098A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = type metadata accessor for ForecastLocationEntity(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1000098FC()
{
  unint64_t result;

  result = qword_10003C9D0;
  if (!qword_10003C9D0)
  {
    result = swift_getWitnessTable(&unk_100030BD4, &type metadata for ForecastWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_10003C9D0);
  }
  return result;
}

uint64_t sub_100009940()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_1000064C8(v10, qword_10003D4F8);
  sub_1000064B0(v10, (uint64_t)qword_10003D4F8);
  v11 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000033, 0x8000000100031D30);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v9, 0xD000000000000016, 0x8000000100031C60, v6, v3, "The user's current location (for Grid Forecast widget configuration)", 68, 2);
}

unint64_t sub_100009AC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  Swift::String v11;
  unint64_t v13;
  unint64_t v14;

  v0 = type metadata accessor for ForecastLocationEntity(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100005E18(&qword_10003CA98);
  __chkstk_darwin(v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = 0;
  v14 = 0xE000000000000000;
  _StringGuts.grow(_:)(32);
  v7 = swift_bridgeObjectRelease(v14);
  v13 = 0xD00000000000001ELL;
  v14 = 0x8000000100031CD0;
  IntentParameter.wrappedValue.getter(v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0))
  {
    sub_10000C404((uint64_t)v6, &qword_10003CA98);
    v8 = (void *)0xE500000000000000;
    v9 = 0x3E6C696E3CLL;
  }
  else
  {
    sub_10000C2F8((uint64_t)v6, (uint64_t)v3);
    sub_10000C404((uint64_t)v6, &qword_10003CA98);
    v9 = sub_100007668();
    v8 = v10;
    sub_10000C33C((uint64_t)v3);
  }
  v11._countAndFlagsBits = v9;
  v11._object = v8;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v8);
  return v13;
}

unint64_t sub_100009C3C()
{
  return sub_100009AC8();
}

unint64_t sub_100009C48()
{
  unint64_t result;

  result = qword_10003C9D8;
  if (!qword_10003C9D8)
  {
    result = swift_getWitnessTable(&unk_100030C64, &type metadata for ForecastWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_10003C9D8);
  }
  return result;
}

unint64_t sub_100009C90()
{
  unint64_t result;

  result = qword_10003C9E0;
  if (!qword_10003C9E0)
  {
    result = swift_getWitnessTable(&unk_100030C8C, &type metadata for ForecastWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_10003C9E0);
  }
  return result;
}

unint64_t sub_100009CD8()
{
  unint64_t result;

  result = qword_10003C9E8;
  if (!qword_10003C9E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Never, &type metadata for Never);
    atomic_store(result, (unint64_t *)&qword_10003C9E8);
  }
  return result;
}

uint64_t sub_100009D1C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_1000098FC();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100009D5C@<X0>(uint64_t a1@<X8>)
{
  return sub_100009D80(&qword_10003C738, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D4F8, (uint64_t)sub_100009940, a1);
}

uint64_t sub_100009D80@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = sub_1000064B0(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t sub_100009E04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to WidgetConfigurationIntent.perform()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = sub_10000C378();
  *v4 = v2;
  v4[1] = sub_100009E68;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_100009E68()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD *)(*v1 + 16);
  v3 = *v1;
  result = swift_task_dealloc(v2);
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  return result;
}

uint64_t sub_100009EC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_10000BF68();
  *a1 = result;
  return result;
}

uint64_t sub_100009EE8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000098FC();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for ForecastLocationQuery()
{
  return &type metadata for ForecastLocationQuery;
}

uint64_t *sub_100009F20(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v16);
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    v9 = a3[6];
    v10 = a3[7];
    v11 = *(uint64_t *)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = v11;
    v12 = (char *)a1 + v10;
    v13 = (char *)a2 + v10;
    v14 = *(void **)((char *)a2 + v10);
    v15 = (void *)*((_QWORD *)v13 + 1);
    LOBYTE(v7) = v13[16];
    swift_retain(v11);
    sub_100009FF4(v14, v15, v7);
    *(_QWORD *)v12 = v14;
    *((_QWORD *)v12 + 1) = v15;
    v12[16] = v7;
  }
  return a1;
}

id sub_100009FF4(id result, id a2, char a3)
{
  if (a3 == 1)
    return result;
  if (!a3)
    return (id)swift_bridgeObjectRetain(a2);
  return result;
}

void sub_10000A014(uint64_t a1, int *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = type metadata accessor for UUID(0);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  swift_release(*(_QWORD *)(a1 + a2[6]));
  sub_10000A088(*(void **)(a1 + a2[7]), *(id *)(a1 + a2[7] + 8), *(_BYTE *)(a1 + a2[7] + 16));
}

void sub_10000A088(void *a1, id a2, char a3)
{
  if (a3 == 1)
  {

  }
  else if (!a3)
  {
    swift_bridgeObjectRelease(a2);
  }
}

uint64_t sub_10000A0A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = type metadata accessor for UUID(0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a3[7];
  v10 = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + v8) = v10;
  v11 = a1 + v9;
  v12 = a2 + v9;
  v13 = *(void **)(a2 + v9);
  v14 = *(void **)(a2 + v9 + 8);
  LOBYTE(v6) = *(_BYTE *)(v12 + 16);
  swift_retain(v10);
  sub_100009FF4(v13, v14, v6);
  *(_QWORD *)v11 = v13;
  *(_QWORD *)(v11 + 8) = v14;
  *(_BYTE *)(v11 + 16) = v6;
  return a1;
}

uint64_t sub_10000A150(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;

  v6 = type metadata accessor for UUID(0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = *(_QWORD *)(a2 + v8);
  v10 = *(_QWORD *)(a1 + v8);
  *(_QWORD *)(a1 + v8) = v9;
  swift_retain(v9);
  swift_release(v10);
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = *(id *)v13;
  v15 = *(void **)(v13 + 8);
  LOBYTE(v10) = *(_BYTE *)(v13 + 16);
  sub_100009FF4(*(id *)v13, v15, v10);
  v16 = *(void **)v12;
  v17 = *(void **)(v12 + 8);
  *(_QWORD *)v12 = v14;
  *(_QWORD *)(v12 + 8) = v15;
  v18 = *(_BYTE *)(v12 + 16);
  *(_BYTE *)(v12 + 16) = v10;
  sub_10000A088(v16, v17, v18);
  return a1;
}

uint64_t sub_10000A214(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = type metadata accessor for UUID(0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  return a1;
}

uint64_t sub_10000A2A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  char v16;

  v6 = type metadata accessor for UUID(0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = *(_QWORD *)(a1 + v8);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  swift_release(v9);
  v10 = a3[7];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = *(_BYTE *)(v12 + 16);
  v14 = *(void **)v11;
  v15 = *(void **)(v11 + 8);
  *(_OWORD *)v11 = *(_OWORD *)v12;
  v16 = *(_BYTE *)(v11 + 16);
  *(_BYTE *)(v11 + 16) = v13;
  sub_10000A088(v14, v15, v16);
  return a1;
}

uint64_t sub_10000A354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A360);
}

uint64_t sub_10000A360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_10000A3DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A3E8);
}

uint64_t sub_10000A3E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_10000A460(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[4];

  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = v4[0];
    v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[3] = &unk_100030CE8;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ForecastWidgetConfiguration()
{
  return &type metadata for ForecastWidgetConfiguration;
}

char *sub_10000A4F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  _QWORD v36[2];
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v4 = v3;
  v44 = a2;
  v45 = a3;
  v6 = type metadata accessor for UUID(0);
  v46 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v37 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_100005E18(&qword_10003CAE8);
  __chkstk_darwin(v43);
  v9 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100005E18(&qword_10003CAD8);
  v11 = __chkstk_darwin(v10);
  v13 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11);
  v16 = (char *)v36 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)v36 - v17;
  if ((unint64_t)a1 >> 62)
    goto LABEL_20;
  v19 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v19)
  {
    v39 = v13;
    v40 = v19;
    v36[1] = v4;
    v41 = a1;
    v42 = a1 & 0xC000000000000001;
    v20 = 4;
    v38 = v9;
    while (1)
    {
      v4 = v20 - 4;
      v22 = v42
          ? (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(v20 - 4, a1)
          : (char *)*(id *)(a1 + 8 * v20);
      v13 = v22;
      if (__OFADD__(v4, 1))
        break;
      v47 = v20 - 3;
      v23 = objc_msgSend(v22, "uniqueIdentifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v24 = v46;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v18, 0, 1, v6);
      UUID.init(uuidString:)(v44, v45);
      v25 = (uint64_t)&v9[*(int *)(v43 + 48)];
      sub_10000C3BC((uint64_t)v18, (uint64_t)v9);
      sub_10000C3BC((uint64_t)v16, v25);
      v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
      if (v26((uint64_t)v9, 1, v6) == 1)
      {
        sub_10000C404((uint64_t)v16, &qword_10003CAD8);
        sub_10000C404((uint64_t)v18, &qword_10003CAD8);
        v21 = v26(v25, 1, v6);
        a1 = v41;
        if (v21 == 1)
        {
          sub_10000C404((uint64_t)v9, &qword_10003CAD8);
LABEL_18:
          swift_bridgeObjectRelease(a1);
          return v13;
        }
        goto LABEL_5;
      }
      v27 = (uint64_t)v9;
      v28 = (uint64_t)v39;
      sub_10000C3BC(v27, (uint64_t)v39);
      if (v26(v25, 1, v6) == 1)
      {
        sub_10000C404((uint64_t)v16, &qword_10003CAD8);
        sub_10000C404((uint64_t)v18, &qword_10003CAD8);
        (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v28, v6);
        a1 = v41;
        v9 = v38;
LABEL_5:
        sub_10000C404((uint64_t)v9, &qword_10003CAE8);
        goto LABEL_6;
      }
      v29 = v46;
      v30 = v37;
      (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v37, v25, v6);
      v31 = sub_10000C440(&qword_10003CAF0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v32 = dispatch thunk of static Equatable.== infix(_:_:)(v28, v30, v6, v31);
      v33 = *(void (**)(char *, uint64_t))(v29 + 8);
      v33(v30, v6);
      sub_10000C404((uint64_t)v16, &qword_10003CAD8);
      sub_10000C404((uint64_t)v18, &qword_10003CAD8);
      v33((char *)v28, v6);
      v9 = v38;
      sub_10000C404((uint64_t)v38, &qword_10003CAD8);
      a1 = v41;
      if ((v32 & 1) != 0)
        goto LABEL_18;
LABEL_6:

      ++v20;
      if (v47 == v40)
        goto LABEL_24;
    }
    __break(1u);
LABEL_20:
    if (a1 < 0)
      v34 = a1;
    else
      v34 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v19 = _CocoaArrayWrapper.endIndex.getter(v34);
  }
LABEL_24:
  swift_bridgeObjectRelease(a1);
  return 0;
}

uint64_t sub_10000A908()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = type metadata accessor for Logger(0);
  v0[24] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[25] = v2;
  v3 = (*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v0[26] = swift_task_alloc(v3);
  v0[27] = swift_task_alloc(v3);
  v0[28] = swift_task_alloc(v3);
  v0[29] = swift_task_alloc(v3);
  v0[30] = swift_task_alloc(v3);
  return swift_task_switch(sub_10000A998, 0, 0);
}

uint64_t sub_10000A998()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v0[16] = 0;
  v1 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v0[31] = v1;
  v2 = sub_1000066D4(0, &qword_10003C770, HMHomeManager_ptr);
  v0[32] = v2;
  *v1 = v0;
  v1[1] = sub_10000AA40;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 19, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004008, 0, v2);
}

uint64_t sub_10000AA40()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 248));
  return swift_task_switch(sub_10000AA94, 0, 0);
}

uint64_t sub_10000AA94()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSString v32;
  id v33;
  NSString v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  os_log_type_t type;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t *v68;
  uint64_t v69[2];

  v1 = *(void **)(v0 + 152);
  v2 = objc_msgSend(v1, "homes");

  v3 = sub_1000066D4(0, &qword_10003CAE0, HMHome_ptr);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(_QWORD *)(v0 + 264) = v4;

  if ((unint64_t)v4 >> 62)
  {
    if (v4 < 0)
      v57 = v4;
    else
      v57 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v6 = _CocoaArrayWrapper.endIndex.getter(v57);
    v5 = swift_bridgeObjectRelease(v4);
  }
  else
  {
    v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v68 = (uint64_t *)(v0 + 184);
  *(_QWORD *)(v0 + 272) = v6;
  if (!v6)
  {
    v14 = swift_bridgeObjectRelease(v4);
    v15 = static Logger.gridForecastWidgets.getter(v14);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.default.getter();
    v18 = os_log_type_enabled(v16, v17);
    v19 = *(_QWORD *)(v0 + 208);
    v21 = *(_QWORD *)(v0 + 192);
    v20 = *(_QWORD *)(v0 + 200);
    if (v18)
    {
      v66 = *(_QWORD *)(v0 + 208);
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = swift_slowAlloc(32, -1);
      v69[0] = v23;
      *(_DWORD *)v22 = 136315138;
      *v68 = sub_10000F4DC(0xD000000000000010, 0x8000000100031EB0, v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v68, v0 + 192, v22 + 4, v22 + 12);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s HomeManagerActor returned no homes", v22, 0xCu);
      swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v22, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v66, v21);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    }

    v28 = 0;
    goto LABEL_30;
  }
  v67 = (_QWORD *)(v0 + 128);
  v7 = v0 + 168;
  static Logger.gridForecastWidgets.getter(v5);
  swift_bridgeObjectRetain_n(v4, 2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc(22, -1);
    v12 = swift_slowAlloc(32, -1);
    v69[0] = v12;
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v0 + 168) = sub_10000F4DC(0xD000000000000010, 0x8000000100031EB0, v69);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 168, v0 + 176, v11 + 4, v11 + 12);
    *(_WORD *)(v11 + 12) = 2048;
    if ((unint64_t)v4 >> 62)
    {
      if (v4 < 0)
        v29 = v4;
      else
        v29 = v4 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v4);
      v13 = _CocoaArrayWrapper.endIndex.getter(v29);
      swift_bridgeObjectRelease(v4);
    }
    else
    {
      v13 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v30 = *(_QWORD *)(v0 + 200);
    v62 = *(_QWORD *)(v0 + 192);
    v64 = *(_QWORD *)(v0 + 240);
    swift_bridgeObjectRelease(v4);
    *(_QWORD *)(v0 + 176) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 176, v68, v11 + 14, v11 + 22);
    swift_bridgeObjectRelease(v4);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s HomeManagerActor returned %ld home(s)", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    v27 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v27(v64, v62);
    v7 = v0 + 168;
  }
  else
  {
    v24 = *(_QWORD *)(v0 + 240);
    v25 = *(_QWORD *)(v0 + 192);
    v26 = *(_QWORD *)(v0 + 200);
    swift_bridgeObjectRelease_n(v4, 2);

    v27 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v27(v24, v25);
  }
  *(_QWORD *)(v0 + 280) = v27;
  v31 = objc_allocWithZone((Class)NSUserDefaults);
  v32 = String._bridgeToObjectiveC()();
  v33 = objc_msgSend(v31, "initWithSuiteName:", v32);

  if (v33)
  {
    v34 = String._bridgeToObjectiveC()();
    v35 = objc_msgSend(v33, "stringForKey:", v34);

    if (v35)
    {
      v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
      v38 = v37;

      swift_bridgeObjectRetain(v38);
      v65 = v36;
      v39 = sub_10000A4F0(v4, v36, v38);
      swift_bridgeObjectRelease(v38);

      *(_QWORD *)(v0 + 128) = v39;
      static Logger.gridForecastWidgets.getter(v40);
      v41 = swift_bridgeObjectRetain(v38);
      v42 = Logger.logObject.getter(v41);
      v43 = static os_log_type_t.default.getter();
      v44 = os_log_type_enabled(v42, v43);
      v45 = *(_QWORD *)(v0 + 232);
      v46 = *(_QWORD *)(v0 + 192);
      if (v44)
      {
        v63 = *(_QWORD *)(v0 + 232);
        type = v43;
        v58 = (uint64_t *)(v0 + 160);
        v61 = *(_QWORD *)(v0 + 192);
        v47 = swift_slowAlloc(32, -1);
        v59 = swift_slowAlloc(96, -1);
        v69[0] = v59;
        *(_DWORD *)v47 = 136315650;
        *(_QWORD *)(v0 + 136) = sub_10000F4DC(0xD000000000000010, 0x8000000100031EB0, v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144, v47 + 4, v47 + 12);
        *(_WORD *)(v47 + 12) = 2080;
        swift_bridgeObjectRetain(v38);
        *(_QWORD *)(v0 + 144) = sub_10000F4DC(v65, v38, v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152, v47 + 14, v47 + 22);
        swift_bridgeObjectRelease_n(v38, 3);
        *(_WORD *)(v47 + 22) = 2080;
        v48 = (uint64_t *)(v0 + 128);
        swift_beginAccess(v67, v0 + 40, 0, 0);
        v49 = *v67 ? 0x444E554F46 : 0x6E756F6620746F6ELL;
        v50 = *v67 ? 0xE500000000000000 : 0xE900000000000064;
        *v58 = sub_10000F4DC(v49, v50, v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v58, v7, v47 + 24, v47 + 32);
        swift_bridgeObjectRelease(v50);
        _os_log_impl((void *)&_mh_execute_header, v42, type, "%s HFSelectedHomeKey %s %s in list of homes", (uint8_t *)v47, 0x20u);
        swift_arrayDestroy(v59, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v59, -1, -1);
        swift_slowDealloc(v47, -1, -1);

        v27(v63, v61);
      }
      else
      {
        swift_bridgeObjectRelease_n(v38, 2);

        v27(v45, v46);
        v48 = (uint64_t *)(v0 + 128);
      }
      swift_beginAccess(v48, v0 + 16, 0, 0);
      v28 = *v48;
      if (*v48)
      {
        swift_bridgeObjectRelease(v4);
LABEL_30:
        v51 = *(_QWORD *)(v0 + 232);
        v53 = *(_QWORD *)(v0 + 216);
        v52 = *(_QWORD *)(v0 + 224);
        v54 = *(_QWORD *)(v0 + 208);
        swift_task_dealloc(*(_QWORD *)(v0 + 240));
        swift_task_dealloc(v51);
        swift_task_dealloc(v52);
        swift_task_dealloc(v53);
        swift_task_dealloc(v54);
        return (*(uint64_t (**)(uint64_t))(v0 + 8))(v28);
      }
    }
  }
  v56 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 288) = v56;
  *v56 = v0;
  v56[1] = sub_10000B2B8;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 88, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004008, 0, *(_QWORD *)(v0 + 256));
}

uint64_t sub_10000B2B8()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 288));
  return swift_task_switch(sub_10000B30C, 0, 0);
}

id sub_10000B30C()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id result;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;

  v1 = (uint64_t *)(v0 + 128);
  v2 = *(void **)(v0 + 88);
  v3 = objc_msgSend(v2, "currentHome");

  swift_beginAccess(v0 + 128, v0 + 64, 1, 0);
  v4 = *(void **)(v0 + 128);
  *(_QWORD *)(v0 + 128) = v3;

  v6 = static Logger.gridForecastWidgets.getter(v5);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v47 = *(_QWORD *)(v0 + 224);
    v48 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v45 = *(_QWORD *)(v0 + 192);
    v9 = swift_slowAlloc(22, -1);
    v10 = swift_slowAlloc(64, -1);
    v49 = v10;
    *(_DWORD *)v9 = 136315394;
    *(_QWORD *)(v0 + 112) = sub_10000F4DC(0xD000000000000010, 0x8000000100031EB0, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120, v9 + 4, v9 + 12);
    *(_WORD *)(v9 + 12) = 2080;
    if (*(_QWORD *)(v0 + 128))
      v11 = 0x444E554F46;
    else
      v11 = 0x6E756F6620746F6ELL;
    if (*(_QWORD *)(v0 + 128))
      v12 = 0xE500000000000000;
    else
      v12 = 0xE900000000000064;
    *(_QWORD *)(v0 + 120) = sub_10000F4DC(v11, v12, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 120, v0 + 128, v9 + 14, v9 + 22);
    swift_bridgeObjectRelease(v12);
    swift_arrayDestroy(v10, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

    v48(v47, v45);
  }
  else
  {
    v13 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v14 = *(_QWORD *)(v0 + 224);
    v15 = *(_QWORD *)(v0 + 192);

    v13(v14, v15);
  }
  v16 = *(_QWORD *)(v0 + 128);
  v17 = *(_QWORD *)(v0 + 264);
  if (v16)
  {
    swift_bridgeObjectRelease(v17);
  }
  else
  {
    v18 = v17 & 0xC000000000000001;
    v19 = v17 + 32;
    swift_bridgeObjectRetain(v17);
    while (1)
    {
      if (v18)
        result = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v16, *(_QWORD *)(v0 + 264));
      else
        result = *(id *)(v19 + 8 * v16);
      v21 = result;
      v22 = v16 + 1;
      if (__OFADD__(v16, 1))
      {
        __break(1u);
        return result;
      }
      v23 = objc_msgSend(result, "location");

      if (v23)
        break;
      v24 = *(_QWORD *)(v0 + 272);

      ++v16;
      if (v22 == v24)
      {
        v25 = v0 + 104;
        swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 264), 2);
        v21 = 0;
        goto LABEL_21;
      }
    }
    v25 = v0 + 104;
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 264), 2);
LABEL_21:
    v26 = *(void **)(v0 + 128);
    *(_QWORD *)(v0 + 128) = v21;

    static Logger.gridForecastWidgets.getter(v27);
    v28 = v21;
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.default.getter();
    v31 = os_log_type_enabled(v29, v30);
    v32 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v33 = *(_QWORD *)(v0 + 216);
    v34 = *(_QWORD *)(v0 + 192);
    if (v31)
    {
      v35 = swift_slowAlloc(22, -1);
      v46 = v33;
      v36 = swift_slowAlloc(64, -1);
      v49 = v36;
      *(_DWORD *)v35 = 136315394;
      v44 = v32;
      *(_QWORD *)(v0 + 96) = sub_10000F4DC(0xD000000000000010, 0x8000000100031EB0, &v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v25, v35 + 4, v35 + 12);
      *(_WORD *)(v35 + 12) = 2080;
      if (v21)
        v37 = 0x444E554F46;
      else
        v37 = 0x6E756F6620746F6ELL;
      if (v21)
        v38 = 0xE500000000000000;
      else
        v38 = 0xE900000000000064;
      *(_QWORD *)(v0 + 104) = sub_10000F4DC(v37, v38, &v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v25, v0 + 112, v35 + 14, v35 + 22);
      swift_bridgeObjectRelease(v38);

      _os_log_impl((void *)&_mh_execute_header, v29, v30, "%s HomeKit home with location %s", (uint8_t *)v35, 0x16u);
      swift_arrayDestroy(v36, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1, -1);
      v39 = v35;
      v1 = (uint64_t *)(v0 + 128);
      swift_slowDealloc(v39, -1, -1);

      v44(v46, v34);
    }
    else
    {

      v32(v33, v34);
    }
    v16 = *v1;
  }
  v40 = *(_QWORD *)(v0 + 232);
  v42 = *(_QWORD *)(v0 + 216);
  v41 = *(_QWORD *)(v0 + 224);
  v43 = *(_QWORD *)(v0 + 208);
  swift_task_dealloc(*(_QWORD *)(v0 + 240));
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  return (id)(*(uint64_t (**)(uint64_t))(v0 + 8))(v16);
}

uint64_t sub_10000B810(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v1[6] = a1;
  v2 = type metadata accessor for UUID(0);
  v1[7] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[8] = v3;
  v1[9] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100005E18(&qword_10003CAD8);
  v1[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Logger(0);
  v1[11] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v1[12] = v6;
  v1[13] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ForecastLocationEntity(0);
  v1[14] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v1[15] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[16] = swift_task_alloc(v9);
  v1[17] = swift_task_alloc(v9);
  return swift_task_switch(sub_10000B8F4, 0, 0);
}

uint64_t sub_10000B8F4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10003CB04);
  *(_QWORD *)(v0 + 144) = v1;
  *v1 = v0;
  v1[1] = sub_10000B95C;
  return sub_1000078D4(0, 0x7365697469746E65, 0xEE00293A726F6628);
}

uint64_t sub_10000B95C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 144);
  *(_QWORD *)(*(_QWORD *)v1 + 152) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10000B9B8, 0, 0);
}

uint64_t sub_10000B9B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
  os_log_type_t type[8];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 152);
  v64 = &_swiftEmptyArrayStorage;
  v3 = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRetain(v1);
  v58 = v3;
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)(v0 + 120);
    v6 = *(_QWORD *)(v0 + 64);
    v60 = *(_QWORD *)(v5 + 72);
    v52 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v55 = v2 + v52;
    v54 = &_swiftEmptyArrayStorage;
    *(_QWORD *)type = v1;
    do
    {
      v62 = v4;
      sub_10000C2F8(v55 + v4 * v60, *(_QWORD *)(v0 + 136));
      v9 = *(_QWORD *)(v1 + 16);
      v10 = *(_QWORD *)(v0 + 48);
      if (v9)
      {
        v11 = v10 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
        swift_bridgeObjectRetain(v10);
        v12 = *(_QWORD *)(v6 + 72);
        v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
        while (1)
        {
          v14 = *(_QWORD *)(v0 + 80);
          v15 = *(_QWORD *)(v0 + 56);
          v13(v14, v11, v15);
          v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
          v7(v14, 0, 1, v15);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v14, 1, v15) == 1)
            break;
          v16 = *(_QWORD *)(v0 + 136);
          v17 = *(_QWORD *)(v0 + 72);
          v18 = *(_QWORD *)(v0 + 56);
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 32))(v17, *(_QWORD *)(v0 + 80), v18);
          v19 = sub_10000C440(&qword_10003CAF0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
          LOBYTE(v16) = dispatch thunk of static Equatable.== infix(_:_:)(v17, v16, v18, v19);
          (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v17, v18);
          if ((v16 & 1) != 0)
          {
            v21 = *(_QWORD *)(v0 + 128);
            v20 = *(_QWORD *)(v0 + 136);
            swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
            sub_10000C480(v20, v21);
            v22 = v54;
            if ((swift_isUniquelyReferenced_nonNull_native(v54) & 1) == 0)
            {
              sub_100019AAC(0, v54[2] + 1, 1);
              v22 = v64;
            }
            v1 = *(_QWORD *)type;
            v24 = v22[2];
            v23 = v22[3];
            if (v24 >= v23 >> 1)
            {
              sub_100019AAC(v23 > 1, v24 + 1, 1);
              v22 = v64;
            }
            v25 = *(_QWORD *)(v0 + 128);
            v22[2] = v24 + 1;
            v54 = v22;
            sub_10000C480(v25, (uint64_t)v22 + v52 + v24 * v60);
            goto LABEL_6;
          }
          v11 += v12;
          if (!--v9)
            goto LABEL_4;
        }
      }
      else
      {
        swift_bridgeObjectRetain(v10);
        v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
LABEL_4:
        v7(*(_QWORD *)(v0 + 80), 1, 1, *(_QWORD *)(v0 + 56));
      }
      v8 = *(_QWORD *)(v0 + 136);
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
      sub_10000C33C(v8);
      v1 = *(_QWORD *)type;
LABEL_6:
      v4 = v62 + 1;
    }
    while (v62 + 1 != v58);
    v2 = *(_QWORD *)(v0 + 152);
    v1 = *(_QWORD *)(v0 + 48);
  }
  else
  {
    v54 = &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease(v1);
  v26 = swift_bridgeObjectRelease(v2);
  static Logger.gridForecastWidgets.getter(v26);
  v27 = swift_bridgeObjectRetain(v54);
  swift_retain_n(v27, 3);
  swift_bridgeObjectRetain_n(v1, 2);
  v29 = Logger.logObject.getter(v28);
  v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v53 = *(_QWORD *)(v0 + 112);
    v59 = *(_QWORD *)(v0 + 96);
    v61 = *(_QWORD *)(v0 + 88);
    v63 = *(_QWORD *)(v0 + 104);
    v32 = *(_QWORD *)(v0 + 48);
    v31 = *(_QWORD *)(v0 + 56);
    v33 = swift_slowAlloc(42, -1);
    v56 = (_QWORD *)swift_slowAlloc(96, -1);
    v64 = v56;
    *(_DWORD *)v33 = 136315906;
    *(_QWORD *)(v0 + 16) = sub_10000F4DC(0x7365697469746E65, 0xEE00293A726F6628, (uint64_t *)&v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v33 + 4, v33 + 12);
    *(_WORD *)(v33 + 12) = 2080;
    v34 = swift_bridgeObjectRetain(v32);
    v35 = Array.description.getter(v34, v31);
    v37 = v36;
    swift_bridgeObjectRelease(v32);
    *(_QWORD *)(v0 + 24) = sub_10000F4DC(v35, v37, (uint64_t *)&v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v33 + 14, v33 + 22);
    swift_bridgeObjectRelease(v37);
    swift_bridgeObjectRelease_n(v32, 2);
    *(_WORD *)(v33 + 22) = 2048;
    v38 = v54[2];
    swift_release(v54);
    *(_QWORD *)(v0 + 32) = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v33 + 24, v33 + 32);
    swift_release(v54);
    *(_WORD *)(v33 + 32) = 2080;
    v39 = swift_bridgeObjectRetain(v54);
    v40 = Array.description.getter(v39, v53);
    v42 = v41;
    swift_release(v54);
    *(_QWORD *)(v0 + 40) = sub_10000F4DC(v40, v42, (uint64_t *)&v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v33 + 34, v33 + 42);
    swift_bridgeObjectRelease(v42);
    swift_release_n(v54, 2);
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "%s requested entities (%s) returning %ld: %s", (uint8_t *)v33, 0x2Au);
    swift_arrayDestroy(v56, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v56, -1, -1);
    swift_slowDealloc(v33, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v63, v61);
  }
  else
  {
    v43 = *(_QWORD *)(v0 + 96);
    v44 = *(_QWORD *)(v0 + 104);
    v45 = *(_QWORD *)(v0 + 88);
    v46 = *(_QWORD *)(v0 + 48);
    swift_release_n(v54, 4);
    swift_bridgeObjectRelease_n(v46, 2);

    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v44, v45);
  }
  v47 = *(_QWORD *)(v0 + 128);
  v48 = *(_QWORD *)(v0 + 104);
  v50 = *(_QWORD *)(v0 + 72);
  v49 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 136));
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v54);
}

uint64_t sub_10000BF68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  _QWORD v35[2];
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v39 = *(_QWORD *)(v0 - 8);
  v40 = v0;
  __chkstk_darwin(v0);
  v38 = (char *)v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100005E18(&qword_10003CA90);
  v3 = __chkstk_darwin(v2);
  v37 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v36 = (char *)v35 - v5;
  v6 = sub_100005E18(&qword_10003CA98);
  __chkstk_darwin(v6);
  v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100005E18(&qword_10003CAA0);
  __chkstk_darwin(v9);
  v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Locale(0);
  __chkstk_darwin(v16);
  v18 = (char *)v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v19);
  v21 = (char *)v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for LocalizedStringResource(0);
  v23 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v25 = (char *)v35 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35[1] = sub_100005E18(&qword_10003CAA8);
  v26 = String.LocalizationValue.init(stringLiteral:)(0x6E6F697461636F4CLL, 0xE800000000000000);
  static Locale.current.getter(v26);
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, enum case for LocalizedStringResource.BundleDescription.main(_:), v12);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v21, 0xD000000000000016, 0x8000000100031C60, v18, v15, "The prompt for configuring the location for a Grid Forecast widget", 66, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v11, 1, 1, v22);
  v27 = type metadata accessor for ForecastLocationEntity(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v8, 1, 1, v27);
  v28 = type metadata accessor for IntentDialog(0);
  v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56);
  v30 = v36;
  v29(v36, 1, 1, v28);
  v31 = v37;
  v29(v37, 1, 1, v28);
  v32 = v38;
  (*(void (**)(char *, _QWORD, uint64_t))(v39 + 104))(v38, enum case for InputConnectionBehavior.default(_:), v40);
  v33 = sub_10000C440(qword_10003C990, type metadata accessor for ForecastLocationEntity, (uint64_t)&unk_100030860);
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v25, v11, v8, v30, v31, v32, v33);
}

uint64_t sub_10000C2F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ForecastLocationEntity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C33C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ForecastLocationEntity(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000C378()
{
  unint64_t result;

  result = qword_10003CAB8;
  if (!qword_10003CAB8)
  {
    result = swift_getWitnessTable(&unk_100030B7C, &type metadata for ForecastWidgetConfiguration);
    atomic_store(result, &qword_10003CAB8);
  }
  return result;
}

uint64_t sub_10000C3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005E18(&qword_10003CAD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C404(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005E18(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000C440(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000C480(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ForecastLocationEntity(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void destroy for ForecastLocationEntity.EntityType(uint64_t a1)
{
  sub_10000A088(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s26HomeEnergyWidgetsExtension22ForecastLocationEntityV10EntityTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100009FF4(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ForecastLocationEntity.EntityType(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100009FF4(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_10000A088(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for ForecastLocationEntity.EntityType(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ForecastLocationEntity.EntityType(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_10000A088(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ForecastLocationEntity.EntityType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ForecastLocationEntity.EntityType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_10000C658(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_10000C670(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ForecastLocationEntity.EntityType()
{
  return &type metadata for ForecastLocationEntity.EntityType;
}

uint64_t sub_10000C698@<X0>(uint64_t a1@<X8>)
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  os_log_type_t v92;
  _BOOL4 v93;
  uint8_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  char *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t OpaqueTypeConformance2;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  unint64_t v133;
  char *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  char *v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  char *v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  unint64_t v165;
  uint64_t v166;
  uint64_t v167;
  char *v168;
  uint64_t v169;
  char *v170;
  char *v171;
  uint64_t v172;
  char *v173;
  char *v174;
  uint64_t v175;
  char *v176;
  uint64_t v177;
  char *v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  char *v182;
  uint64_t v183;
  char *v184;
  uint64_t v185;
  char *v186;
  char *v187;
  char *v188;
  char *v189;
  char *v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  uint64_t v204;
  char *v205;
  uint64_t v206;
  char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  uint64_t v219;
  void *v220;
  uint64_t v221;
  uint64_t v222;
  char v223;
  uint64_t v224;
  char v225[8];

  v215 = a1;
  v181 = sub_100005E18(&qword_10003CC18);
  __chkstk_darwin(v181);
  v182 = (char *)&v166 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v214 = sub_100005E18(&qword_10003CC20);
  __chkstk_darwin(v214);
  v184 = (char *)&v166 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v180 = type metadata accessor for CircularHistoricalUsageView(0);
  v175 = *(_QWORD *)(v180 - 8);
  __chkstk_darwin(v180);
  v174 = (char *)&v166 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v183 = sub_100005E18(&qword_10003CC28);
  v177 = *(_QWORD *)(v183 - 8);
  v5 = __chkstk_darwin(v183);
  v173 = (char *)&v166 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v176 = (char *)&v166 - v7;
  v204 = type metadata accessor for RectangularLockHistoricalUsageView(0);
  v169 = *(_QWORD *)(v204 - 8);
  __chkstk_darwin(v204);
  v168 = (char *)&v166 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v206 = sub_100005E18(&qword_10003CC30);
  v172 = *(_QWORD *)(v206 - 8);
  v9 = __chkstk_darwin(v206);
  v170 = (char *)&v166 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v171 = (char *)&v166 - v11;
  v212 = sub_100005E18(&qword_10003CC38);
  __chkstk_darwin(v212);
  v211 = (uint64_t)&v166 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v202 = sub_100005E18(&qword_10003CC40);
  __chkstk_darwin(v202);
  v203 = (char *)&v166 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v213 = sub_100005E18(&qword_10003CC48);
  __chkstk_darwin(v213);
  v205 = (char *)&v166 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v196 = type metadata accessor for ContainerBackgroundPlacement(0);
  v195 = *(_QWORD *)(v196 - 8);
  __chkstk_darwin(v196);
  v194 = (char *)&v166 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100005E18(&qword_10003CC50);
  __chkstk_darwin(v16);
  v207 = (char *)&v166 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v216 = type metadata accessor for HistoricalUsageSnapshot(0);
  v210 = *(_QWORD *)(v216 - 8);
  v18 = __chkstk_darwin(v216);
  v179 = (char *)&v166 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v187 = (char *)&v166 - v20;
  v21 = type metadata accessor for Date(0);
  v208 = *(_QWORD *)(v21 - 8);
  v209 = v21;
  v22 = __chkstk_darwin(v21);
  v178 = (char *)&v166 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v186 = (char *)&v166 - v24;
  v197 = type metadata accessor for HistoricalUsageWidgetView(0);
  v185 = *(_QWORD *)(v197 - 8);
  __chkstk_darwin(v197);
  v188 = (char *)&v166 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v200 = sub_100005E18(&qword_10003CC58);
  v191 = *(_QWORD *)(v200 - 8);
  __chkstk_darwin(v200);
  v190 = (char *)&v166 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v201 = sub_100005E18(&qword_10003CC60);
  v193 = *(_QWORD *)(v201 - 8);
  v27 = __chkstk_darwin(v201);
  v189 = (char *)&v166 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v192 = (char *)&v166 - v29;
  v30 = type metadata accessor for HistoricalUsageWidgetEntryView(0);
  v31 = __chkstk_darwin(v30);
  v33 = (char *)&v166 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  v35 = (char *)&v166 - v34;
  v199 = type metadata accessor for Logger(0);
  v198 = *(_QWORD *)(v199 - 8);
  v36 = __chkstk_darwin(v199);
  v38 = (char *)&v166 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v36);
  v40 = (char *)&v166 - v39;
  v41 = type metadata accessor for WidgetFamily(0);
  v42 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v44 = (char *)&v166 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = v1;
  sub_10000F090((uint64_t)v44);
  v46 = (*(uint64_t (**)(char *, uint64_t))(v42 + 88))(v44, v41);
  if (v46 == enum case for WidgetFamily.systemSmall(_:))
  {
    static Logger.historicalUsageWidgets.getter();
    v47 = sub_10000FC40(v1, (uint64_t)v35, type metadata accessor for HistoricalUsageWidgetEntryView);
    v48 = Logger.logObject.getter(v47);
    v49 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc(12, -1);
      v51 = swift_slowAlloc(32, -1);
      v217 = v51;
      *(_DWORD *)v50 = 136315138;
      v167 = v1;
      type metadata accessor for HistoricalUsageEntry(0);
      v52 = sub_10000C440(&qword_10003CC90, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageSnapshot, (uint64_t)&protocol conformance descriptor for HistoricalUsageSnapshot);
      v53 = dispatch thunk of CustomStringConvertible.description.getter(v216, v52);
      v55 = v54;
      v224 = sub_10000F4DC(v53, v54, &v217);
      v45 = v167;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v224, v225, v50 + 4, v50 + 12);
      swift_bridgeObjectRelease(v55);
      sub_10000F4A0((uint64_t)v35);
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "HistoricalUsageWidgetEntryView: creating systemSmall widget for usageSnapshot %s", v50, 0xCu);
      swift_arrayDestroy(v51, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1, -1);
      swift_slowDealloc(v50, -1, -1);
    }
    else
    {
      sub_10000F4A0((uint64_t)v35);
    }

    (*(void (**)(char *, uint64_t))(v198 + 8))(v40, v199);
    v78 = v186;
    v79 = v45 + *(int *)(v30 + 24);
    v80 = type metadata accessor for HistoricalUsageEntry(0);
    IntentParameter.wrappedValue.getter(v80);
    v81 = v187;
    if (v218)
    {
      v82 = v223;
      sub_10000FB1C(v217, (uint64_t)v218, v219, (uint64_t)v220, v221, v222);
      (*(void (**)(char *, uint64_t, uint64_t))(v208 + 16))(v78, v79, v209);
      v83 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v210 + 16))(v81, v79 + *(int *)(v80 + 20), v216);
      if ((v82 & 1) != 0)
      {
        IntentParameter.wrappedValue.getter(v83);
        v84 = (uint64_t)v218;
        if (v218)
        {
          v85 = v217;
          v86 = v219;
          v87 = (uint64_t)v220;
          v88 = v221;
          v89 = v222;
          swift_bridgeObjectRetain();
          sub_10000FB1C(v85, v84, v86, v87, v88, v89);
LABEL_16:
          v103 = (uint64_t)v207;
          v104 = v197;
          v105 = v185;
          v106 = v188;
          HistoricalUsageWidgetView.init(widgetDate:usageSnapshot:homeName:)(v78, v81, v86, v87);
          v107 = sub_10000D9CC();
          v109 = v108;
          URL.init(string:)(v107);
          swift_bridgeObjectRelease(v109);
          v110 = (void *)sub_10000C440(&qword_10003CC78, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageWidgetView, (uint64_t)&protocol conformance descriptor for HistoricalUsageWidgetView);
          v111 = v190;
          View.widgetURL(_:)(v103, v104, v110);
          sub_10000C404(v103, &qword_10003CC50);
          v112 = (*(uint64_t (**)(char *, uint64_t))(v105 + 8))(v106, v104);
          v113 = v194;
          v114 = static ContainerBackgroundPlacement.widget.getter(v112);
          v115 = static Alignment.center.getter(v114);
          v117 = v116;
          v217 = v104;
          v218 = v110;
          OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v217, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
          v119 = v189;
          v120 = v117;
          v121 = v200;
          View.containerBackground<A>(for:alignment:content:)(v113, v115, v120, nullsub_1, 0, v200, &type metadata for EmptyView, OpaqueTypeConformance2, &protocol witness table for EmptyView);
          (*(void (**)(char *, uint64_t))(v195 + 8))(v113, v196);
          (*(void (**)(char *, uint64_t))(v191 + 8))(v111, v121);
          v122 = v193;
          v123 = v192;
          v124 = v119;
          v125 = v201;
          (*(void (**)(char *, char *, uint64_t))(v193 + 32))(v192, v124, v201);
          v126 = v203;
          (*(void (**)(char *, char *, uint64_t))(v122 + 16))(v203, v123, v125);
          swift_storeEnumTagMultiPayload(v126, v202, 0);
          v217 = v121;
          v218 = &type metadata for EmptyView;
          v219 = OpaqueTypeConformance2;
          v220 = &protocol witness table for EmptyView;
          v127 = swift_getOpaqueTypeConformance2(&v217, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
          v128 = (void *)sub_10000C440(&qword_10003CC80, (uint64_t (*)(uint64_t))&type metadata accessor for RectangularLockHistoricalUsageView, (uint64_t)&protocol conformance descriptor for RectangularLockHistoricalUsageView);
          v217 = v204;
          v218 = v128;
          v129 = swift_getOpaqueTypeConformance2(&v217, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
          v130 = (uint64_t)v205;
          _ConditionalContent<>.init(storage:)(v126, v125, v206, v127, v129);
          v131 = v211;
          sub_10000FBFC(v130, v211, &qword_10003CC48);
          swift_storeEnumTagMultiPayload(v131, v212, 0);
          v132 = sub_10000F2D0();
          v133 = sub_10000F3F8();
          _ConditionalContent<>.init(storage:)(v131, v213, v214, v132, v133);
          sub_10000C404(v130, &qword_10003CC48);
          return (*(uint64_t (**)(char *, uint64_t))(v122 + 8))(v123, v125);
        }
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v208 + 16))(v78, v79, v209);
      (*(void (**)(char *, uint64_t, uint64_t))(v210 + 16))(v81, v79 + *(int *)(v80 + 20), v216);
    }
    v86 = 0;
    v87 = 0;
    goto LABEL_16;
  }
  if (v46 == enum case for WidgetFamily.accessoryCircular(_:))
  {
    v56 = v1 + *(int *)(v30 + 24);
    v57 = v178;
    (*(void (**)(char *, uint64_t, uint64_t))(v208 + 16))(v178, v56, v209);
    v58 = v56 + *(int *)(type metadata accessor for HistoricalUsageEntry(0) + 20);
    v59 = v179;
    (*(void (**)(char *, uint64_t, uint64_t))(v210 + 16))(v179, v58, v216);
    v60 = v174;
    CircularHistoricalUsageView.init(widgetStartDate:usageSnapshot:)(v57, v59);
    v61 = sub_10000D9CC();
    v63 = v62;
    v64 = (uint64_t)v207;
    URL.init(string:)(v61);
    swift_bridgeObjectRelease(v63);
    v65 = (void *)sub_10000C440(&qword_10003CC68, (uint64_t (*)(uint64_t))&type metadata accessor for CircularHistoricalUsageView, (uint64_t)&protocol conformance descriptor for CircularHistoricalUsageView);
    v66 = v173;
    v67 = v180;
    View.widgetURL(_:)(v64, v180, v65);
    sub_10000C404(v64, &qword_10003CC50);
    (*(void (**)(char *, uint64_t))(v175 + 8))(v60, v67);
    v68 = v177;
    v69 = v176;
    v70 = v183;
    (*(void (**)(char *, char *, uint64_t))(v177 + 32))(v176, v66, v183);
    v71 = v182;
    (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v182, v69, v70);
    swift_storeEnumTagMultiPayload(v71, v181, 0);
    v217 = v67;
    v218 = v65;
    v72 = swift_getOpaqueTypeConformance2(&v217, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v73 = (uint64_t)v184;
    _ConditionalContent<>.init(storage:)(v71, v70, &type metadata for EmptyView, v72, &protocol witness table for EmptyView);
    v74 = v211;
    sub_10000FBFC(v73, v211, &qword_10003CC20);
    swift_storeEnumTagMultiPayload(v74, v212, 1);
    v75 = sub_10000F2D0();
    v76 = sub_10000F3F8();
    _ConditionalContent<>.init(storage:)(v74, v213, v214, v75, v76);
    sub_10000C404(v73, &qword_10003CC20);
    return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v69, v70);
  }
  else if (v46 == enum case for WidgetFamily.accessoryRectangular(_:))
  {
    static Logger.historicalUsageWidgets.getter();
    v90 = sub_10000FC40(v1, (uint64_t)v33, type metadata accessor for HistoricalUsageWidgetEntryView);
    v91 = Logger.logObject.getter(v90);
    v92 = static os_log_type_t.default.getter();
    v93 = os_log_type_enabled(v91, v92);
    v167 = v1;
    if (v93)
    {
      v94 = (uint8_t *)swift_slowAlloc(12, -1);
      v196 = swift_slowAlloc(32, -1);
      v217 = v196;
      *(_DWORD *)v94 = 136315138;
      type metadata accessor for HistoricalUsageEntry(0);
      v95 = sub_10000C440(&qword_10003CC90, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageSnapshot, (uint64_t)&protocol conformance descriptor for HistoricalUsageSnapshot);
      v96 = v216;
      v97 = dispatch thunk of CustomStringConvertible.description.getter(v216, v95);
      v99 = v98;
      v224 = sub_10000F4DC(v97, v98, &v217);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v224, v225, v94 + 4, v94 + 12);
      v100 = v96;
      swift_bridgeObjectRelease(v99);
      sub_10000F4A0((uint64_t)v33);
      _os_log_impl((void *)&_mh_execute_header, v91, v92, "HistoricalUsageWidgetEntryView: creating accessoryRectangular widget for usageSnapshot: %s", v94, 0xCu);
      v101 = v196;
      swift_arrayDestroy(v196, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v101, -1, -1);
      swift_slowDealloc(v94, -1, -1);

      (*(void (**)(char *, uint64_t))(v198 + 8))(v38, v199);
      v102 = v211;
    }
    else
    {
      sub_10000F4A0((uint64_t)v33);

      (*(void (**)(char *, uint64_t))(v198 + 8))(v38, v199);
      v102 = v211;
      v100 = v216;
    }
    v141 = v210;
    v142 = v169;
    v143 = v168;
    v144 = v179;
    v145 = v178;
    v146 = v167 + *(int *)(v30 + 24);
    (*(void (**)(char *, uint64_t, uint64_t))(v208 + 16))(v178, v146, v209);
    v147 = type metadata accessor for HistoricalUsageEntry(0);
    (*(void (**)(char *, uint64_t, uint64_t))(v141 + 16))(v144, v146 + *(int *)(v147 + 20), v100);
    RectangularLockHistoricalUsageView.init(widgetStartDate:usageSnapshot:)(v145, v144);
    v148 = sub_10000D9CC();
    v150 = v149;
    v151 = (uint64_t)v207;
    URL.init(string:)(v148);
    swift_bridgeObjectRelease(v150);
    v152 = (void *)sub_10000C440(&qword_10003CC80, (uint64_t (*)(uint64_t))&type metadata accessor for RectangularLockHistoricalUsageView, (uint64_t)&protocol conformance descriptor for RectangularLockHistoricalUsageView);
    v153 = v170;
    v154 = v204;
    View.widgetURL(_:)(v151, v204, v152);
    sub_10000C404(v151, &qword_10003CC50);
    (*(void (**)(char *, uint64_t))(v142 + 8))(v143, v154);
    v155 = v172;
    v156 = v171;
    v157 = v206;
    (*(void (**)(char *, char *, uint64_t))(v172 + 32))(v171, v153, v206);
    v158 = v203;
    (*(void (**)(char *, char *, uint64_t))(v155 + 16))(v203, v156, v157);
    swift_storeEnumTagMultiPayload(v158, v202, 1);
    v159 = (void *)sub_10000C440(&qword_10003CC78, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageWidgetView, (uint64_t)&protocol conformance descriptor for HistoricalUsageWidgetView);
    v217 = v197;
    v218 = v159;
    v160 = swift_getOpaqueTypeConformance2(&v217, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v217 = v200;
    v218 = &type metadata for EmptyView;
    v219 = v160;
    v220 = &protocol witness table for EmptyView;
    v161 = swift_getOpaqueTypeConformance2(&v217, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
    v217 = v154;
    v218 = v152;
    v162 = swift_getOpaqueTypeConformance2(&v217, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v163 = (uint64_t)v205;
    _ConditionalContent<>.init(storage:)(v158, v201, v157, v161, v162);
    sub_10000FBFC(v163, v102, &qword_10003CC48);
    swift_storeEnumTagMultiPayload(v102, v212, 0);
    v164 = sub_10000F2D0();
    v165 = sub_10000F3F8();
    _ConditionalContent<>.init(storage:)(v102, v213, v214, v164, v165);
    sub_10000C404(v163, &qword_10003CC48);
    return (*(uint64_t (**)(char *, uint64_t))(v155 + 8))(v156, v157);
  }
  else
  {
    v134 = v182;
    swift_storeEnumTagMultiPayload(v182, v181, 1);
    v135 = (void *)sub_10000C440(&qword_10003CC68, (uint64_t (*)(uint64_t))&type metadata accessor for CircularHistoricalUsageView, (uint64_t)&protocol conformance descriptor for CircularHistoricalUsageView);
    v217 = v180;
    v218 = v135;
    v136 = swift_getOpaqueTypeConformance2(&v217, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v137 = (uint64_t)v184;
    _ConditionalContent<>.init(storage:)(v134, v183, &type metadata for EmptyView, v136, &protocol witness table for EmptyView);
    v138 = v211;
    sub_10000FBFC(v137, v211, &qword_10003CC20);
    swift_storeEnumTagMultiPayload(v138, v212, 1);
    v139 = sub_10000F2D0();
    v140 = sub_10000F3F8();
    _ConditionalContent<>.init(storage:)(v138, v213, v214, v139, v140);
    sub_10000C404(v137, &qword_10003CC20);
    return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v44, v41);
  }
}

uint64_t sub_10000D9CC()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v0 = 0xD000000000000039;
  type metadata accessor for HistoricalUsageWidgetEntryView(0);
  v1 = type metadata accessor for HistoricalUsageEntry(0);
  IntentParameter.wrappedValue.getter(v1);
  if (v7)
  {
    swift_bridgeObjectRetain();
    sub_10000FB1C(v6, v7, v8, v9, v10, v11);
    v2 = sub_100005E18(&qword_10003CCA0);
    v3 = swift_allocObject(v2, 112, 7);
    *(_OWORD *)(v3 + 16) = xmmword_100030D30;
    *(_QWORD *)(v3 + 56) = &type metadata for String;
    v4 = sub_10000FBB8();
    *(_QWORD *)(v3 + 32) = 0xD000000000000039;
    *(_QWORD *)(v3 + 40) = 0x8000000100032330;
    *(_QWORD *)(v3 + 96) = &type metadata for String;
    *(_QWORD *)(v3 + 104) = v4;
    *(_QWORD *)(v3 + 64) = v4;
    *(_QWORD *)(v3 + 72) = v10;
    *(_QWORD *)(v3 + 80) = v11;
    return String.init(format:_:)(0x69656D6F68264025, 0xEC00000040253D64, v3);
  }
  return v0;
}

uint64_t sub_10000DB10()
{
  return static View._viewListCount(inputs:)();
}

HomeEnergyWidgetsExtension::HistoricalUsageWidget __swiftcall HistoricalUsageWidget.init()()
{
  void *v0;
  uint64_t v1;
  HomeEnergyWidgetsExtension::HistoricalUsageWidget result;

  v0 = (void *)0x8000000100030D30;
  v1 = 0xD000000000000015;
  result.kind._object = v0;
  result.kind._countAndFlagsBits = v1;
  return result;
}

uint64_t HistoricalUsageWidget.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t OpaqueTypeConformance2;
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
  char v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD *v45;
  char *v46;
  void (*v47)(char *, _QWORD, uint64_t);
  uint64_t v48;
  uint64_t v49;
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
  unint64_t v61;
  ValueMetadata *v62;
  unint64_t v63;

  v59 = a3;
  v5 = sub_100005E18(&qword_10003C780);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_100005E18(&qword_10003CB18);
  v55 = *(_QWORD *)(v52 - 8);
  __chkstk_darwin(v52);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_100005E18(&qword_10003CB20);
  v56 = *(_QWORD *)(v53 - 8);
  __chkstk_darwin(v53);
  v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100005E18(&qword_10003CB28);
  v57 = *(_QWORD *)(v13 - 8);
  v58 = v13;
  __chkstk_darwin(v13);
  v54 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for HistoricalUsageWidgetEntryView(0);
  sub_10000C440(&qword_10003CB30, type metadata accessor for HistoricalUsageWidgetEntryView, (uint64_t)&unk_100030DD0);
  sub_10000E160();
  swift_bridgeObjectRetain();
  AppIntentConfiguration.init<A>(kind:intent:provider:content:)(a1, a2);
  v15 = sub_10000E1A4();
  WidgetConfiguration._contentMarginsDisabled()(v5, v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000011, 0x8000000100031FD0);
  v17 = Text.init(_:tableName:bundle:comment:)(v16);
  v19 = v18;
  v21 = v20;
  v23 = v22 & 1;
  v60 = v5;
  v61 = v15;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v60, &unk_100032BB0, 1);
  v25 = v52;
  WidgetConfiguration.configurationDisplayName(_:)(v17, v19, v23, v21, v52, OpaqueTypeConformance2);
  sub_10000E1F0(v17, v19, v23);
  swift_bridgeObjectRelease(v21);
  v26 = v10;
  v27 = v53;
  v28 = v25;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v26, v25);
  v29 = LocalizedStringKey.init(stringLiteral:)(0x100000000000003FLL, 0x8000000100032060);
  v30 = Text.init(_:tableName:bundle:comment:)(v29);
  v32 = v31;
  v34 = v33;
  v36 = v35 & 1;
  v60 = v28;
  v61 = OpaqueTypeConformance2;
  v37 = v54;
  v38 = swift_getOpaqueTypeConformance2(&v60, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v30, v32, v36, v34, v27, v38);
  sub_10000E1F0(v30, v32, v36);
  swift_bridgeObjectRelease(v34);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v12, v27);
  v39 = sub_100005E18(&qword_10003CB40);
  v40 = type metadata accessor for WidgetFamily(0);
  v41 = *(_QWORD *)(v40 - 8);
  v42 = *(_QWORD *)(v41 + 72);
  v43 = *(unsigned __int8 *)(v41 + 80);
  v44 = (v43 + 32) & ~v43;
  v45 = (_OWORD *)swift_allocObject(v39, v44 + 3 * v42, v43 | 7);
  v45[1] = xmmword_100030D40;
  v46 = (char *)v45 + v44;
  v47 = *(void (**)(char *, _QWORD, uint64_t))(v41 + 104);
  v47(v46, enum case for WidgetFamily.systemSmall(_:), v40);
  v47(&v46[v42], enum case for WidgetFamily.accessoryRectangular(_:), v40);
  v47(&v46[2 * v42], enum case for WidgetFamily.accessoryCircular(_:), v40);
  v62 = &type metadata for HomeEnergyFeatures;
  v63 = sub_10000E200();
  LOBYTE(v60) = 4;
  LOBYTE(v40) = isFeatureEnabled(_:)(&v60);
  sub_10000FB58(&v60);
  if ((v40 & 1) == 0)
  {
    swift_bridgeObjectRelease(v45);
    v45 = &_swiftEmptyArrayStorage;
  }
  v60 = v27;
  v61 = v38;
  v48 = swift_getOpaqueTypeConformance2(&v60, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v49 = v58;
  WidgetConfiguration.supportedFamilies(_:)(v45, v58, v48);
  swift_bridgeObjectRelease(v45);
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v37, v49);
}

uint64_t sub_10000E034@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = type metadata accessor for HistoricalUsageEntry(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FC40(a1, (uint64_t)v6, v7);
  *a2 = swift_getKeyPath(&unk_100030E20);
  v8 = sub_100005E18(&qword_10003CB50);
  swift_storeEnumTagMultiPayload(a2, v8, 0);
  v9 = type metadata accessor for HistoricalUsageWidgetEntryView(0);
  v10 = (_QWORD *)((char *)a2 + *(int *)(v9 + 20));
  *v10 = swift_getKeyPath(&unk_100030E50);
  v11 = sub_100005E18(&qword_10003CB58);
  swift_storeEnumTagMultiPayload(v10, v11, 0);
  return sub_10000FC90((uint64_t)v6, (uint64_t)a2 + *(int *)(v9 + 24));
}

uint64_t type metadata accessor for HistoricalUsageWidgetEntryView(uint64_t a1)
{
  uint64_t result;

  result = qword_10003CBC8;
  if (!qword_10003CBC8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for HistoricalUsageWidgetEntryView);
  return result;
}

unint64_t sub_10000E160()
{
  unint64_t result;

  result = qword_10003CB38;
  if (!qword_10003CB38)
  {
    result = swift_getWitnessTable(&unk_100031970, &type metadata for HistoricalUsageTimelineProvider);
    atomic_store(result, (unint64_t *)&qword_10003CB38);
  }
  return result;
}

unint64_t sub_10000E1A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C788;
  if (!qword_10003C788)
  {
    v1 = sub_100005E58(&qword_10003C780);
    result = swift_getWitnessTable(&protocol conformance descriptor for AppIntentConfiguration<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C788);
  }
  return result;
}

uint64_t sub_10000E1F0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

unint64_t sub_10000E200()
{
  unint64_t result;

  result = qword_10003CB48;
  if (!qword_10003CB48)
  {
    result = swift_getWitnessTable(&unk_100030F1C, &type metadata for HomeEnergyFeatures);
    atomic_store(result, (unint64_t *)&qword_10003CB48);
  }
  return result;
}

uint64_t sub_10000E244(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of HistoricalUsageWidget.body>>, 1);
}

void sub_10000E254(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x8000000100030D30;
}

uint64_t sub_10000E274@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return HistoricalUsageWidget.body.getter(*v1, v1[1], a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for HistoricalUsageWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for HistoricalUsageWidget(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for HistoricalUsageWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for HistoricalUsageWidget(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for HistoricalUsageWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for HistoricalUsageWidget(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HistoricalUsageWidget(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HistoricalUsageWidget()
{
  return &type metadata for HistoricalUsageWidget;
}

uint64_t sub_10000E3C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;

  v0 = sub_100005E58(&qword_10003CB28);
  v1 = sub_100005E58(&qword_10003CB20);
  v2 = sub_100005E58(&qword_10003CB18);
  v7 = sub_100005E58(&qword_10003C780);
  v8 = sub_10000E1A4();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v7, &unk_100032BB0, 1);
  v7 = v2;
  v8 = OpaqueTypeConformance2;
  v4 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v7 = v1;
  v8 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v7 = v0;
  v8 = v5;
  return swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
}

uint64_t *sub_10000E48C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100005E18(&qword_10003CB50);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 20);
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = sub_100005E18(&qword_10003CB58);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = *(int *)(a3 + 24);
    v24 = (char *)a1 + v23;
    v25 = (char *)a2 + v23;
    v26 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
    v27 = type metadata accessor for HistoricalUsageEntry(0);
    v28 = *(int *)(v27 + 20);
    v29 = &v24[v28];
    v30 = &v25[v28];
    v31 = type metadata accessor for HistoricalUsageSnapshot(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
    v32 = *(int *)(v27 + 24);
    v12 = *(_QWORD *)&v25[v32];
    *(_QWORD *)&v24[v32] = v12;
  }
  swift_retain(v12);
  return a1;
}

uint64_t sub_10000E64C(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v4 = sub_100005E18(&qword_10003CB50);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + *(int *)(a2 + 20));
  v7 = sub_100005E18(&qword_10003CB58);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (char *)a1 + *(int *)(a2 + 24);
  v10 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = type metadata accessor for HistoricalUsageEntry(0);
  v12 = &v9[*(int *)(v11 + 20)];
  v13 = type metadata accessor for HistoricalUsageSnapshot(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  return swift_release(*(_QWORD *)&v9[*(int *)(v11 + 24)]);
}

uint64_t *sub_10000E768(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v6 = sub_100005E18(&qword_10003CB50);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  v15 = sub_100005E18(&qword_10003CB58);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = *(int *)(a3 + 24);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  v25 = type metadata accessor for HistoricalUsageEntry(0);
  v26 = *(int *)(v25 + 20);
  v27 = &v22[v26];
  v28 = &v23[v26];
  v29 = type metadata accessor for HistoricalUsageSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
  v30 = *(int *)(v25 + 24);
  v31 = *(_QWORD *)&v23[v30];
  *(_QWORD *)&v22[v30] = v31;
  swift_retain(v31);
  return a1;
}

uint64_t *sub_10000E900(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (a1 != a2)
  {
    sub_10000C404((uint64_t)a1, &qword_10003CB50);
    v6 = sub_100005E18(&qword_10003CB50);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = *(int *)(a3 + 20);
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_10000C404((uint64_t)a1 + v12, &qword_10003CB58);
    v15 = sub_100005E18(&qword_10003CB58);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  v21 = *(int *)(a3 + 24);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  v25 = type metadata accessor for HistoricalUsageEntry(0);
  v26 = *(int *)(v25 + 20);
  v27 = &v22[v26];
  v28 = &v23[v26];
  v29 = type metadata accessor for HistoricalUsageSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 24))(v27, v28, v29);
  v30 = *(int *)(v25 + 24);
  v31 = *(_QWORD *)&v23[v30];
  v32 = *(_QWORD *)&v22[v30];
  *(_QWORD *)&v22[v30] = v31;
  swift_retain(v31);
  swift_release(v32);
  return a1;
}

char *sub_10000EACC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v6 = sub_100005E18(&qword_10003CB50);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_100005E18(&qword_10003CB58);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  v17 = type metadata accessor for HistoricalUsageEntry(0);
  v18 = *(int *)(v17 + 20);
  v19 = &v14[v18];
  v20 = &v15[v18];
  v21 = type metadata accessor for HistoricalUsageSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v19, v20, v21);
  *(_QWORD *)&v14[*(int *)(v17 + 24)] = *(_QWORD *)&v15[*(int *)(v17 + 24)];
  return a1;
}

char *sub_10000EC58(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 != a2)
  {
    sub_10000C404((uint64_t)a1, &qword_10003CB50);
    v6 = sub_100005E18(&qword_10003CB50);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_10000C404((uint64_t)&a1[v8], &qword_10003CB58);
    v11 = sub_100005E18(&qword_10003CB58);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  v17 = type metadata accessor for HistoricalUsageEntry(0);
  v18 = *(int *)(v17 + 20);
  v19 = &v14[v18];
  v20 = &v15[v18];
  v21 = type metadata accessor for HistoricalUsageSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 40))(v19, v20, v21);
  v22 = *(int *)(v17 + 24);
  v23 = *(_QWORD *)&v14[v22];
  *(_QWORD *)&v14[v22] = *(_QWORD *)&v15[v22];
  swift_release(v23);
  return a1;
}

uint64_t sub_10000EE14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000EE20);
}

uint64_t sub_10000EE20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_100005E18(&qword_10003CB60);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = sub_100005E18(&qword_10003CB68);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = type metadata accessor for HistoricalUsageEntry(0);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_10000EEC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000EECC);
}

uint64_t sub_10000EECC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_100005E18(&qword_10003CB60);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = sub_100005E18(&qword_10003CB68);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for HistoricalUsageEntry(0);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_10000EF74(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[3];

  sub_10000F034(319, &qword_10003CBD8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000F034(319, (unint64_t *)&unk_10003CBE0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    if (v5 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(v4 - 8) + 64;
      v6 = type metadata accessor for HistoricalUsageEntry(319);
      if (v7 <= 0x3F)
      {
        v8[2] = *(_QWORD *)(v6 - 8) + 64;
        swift_initStructMetadata(a1, 256, 3, v8, a1 + 16);
      }
    }
  }
}

void sub_10000F034(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Environment.Content(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_10000F080(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100032D5C, 1);
}

uint64_t sub_10000F090@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;

  v2 = v1;
  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100005E18(&qword_10003CB58);
  __chkstk_darwin(v8);
  v10 = (_QWORD *)((char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10000FBFC(v2, (uint64_t)v10, &qword_10003CB58);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
  {
    v11 = type metadata accessor for WidgetFamily(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = *v10;
    v14 = static os_log_type_t.fault.getter();
    v15 = static Log.runtimeIssuesLog.getter();
    v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      v17 = (uint8_t *)swift_slowAlloc(12, -1);
      v18 = swift_slowAlloc(32, -1);
      v20[1] = a1;
      v19 = v18;
      v22 = v18;
      *(_DWORD *)v17 = 136315138;
      v21 = sub_10000F4DC(0x6146746567646957, 0xEC000000796C696DLL, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v17 + 4, v17 + 12);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v17, 0xCu);
      swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v17, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v7, v13);
    swift_release(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_10000F2D0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  result = qword_10003CC70;
  if (!qword_10003CC70)
  {
    v1 = sub_100005E58(&qword_10003CC48);
    v2 = sub_100005E58(&qword_10003CC58);
    v6 = type metadata accessor for HistoricalUsageWidgetView(255);
    v7 = (void *)sub_10000C440(&qword_10003CC78, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageWidgetView, (uint64_t)&protocol conformance descriptor for HistoricalUsageWidgetView);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v6, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v6 = v2;
    v7 = &type metadata for EmptyView;
    v8 = OpaqueTypeConformance2;
    v9 = &protocol witness table for EmptyView;
    swift_getOpaqueTypeConformance2(&v6, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
    v4 = type metadata accessor for RectangularLockHistoricalUsageView(255);
    v5 = sub_10000C440(&qword_10003CC80, (uint64_t (*)(uint64_t))&type metadata accessor for RectangularLockHistoricalUsageView, (uint64_t)&protocol conformance descriptor for RectangularLockHistoricalUsageView);
    v6 = v4;
    v7 = (void *)v5;
    swift_getOpaqueTypeConformance2(&v6, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003CC70);
  }
  return result;
}

unint64_t sub_10000F3F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_10003CC88;
  if (!qword_10003CC88)
  {
    v1 = sub_100005E58(&qword_10003CC20);
    v2[0] = type metadata accessor for CircularHistoricalUsageView(255);
    v2[1] = sub_10000C440(&qword_10003CC68, (uint64_t (*)(uint64_t))&type metadata accessor for CircularHistoricalUsageView, (uint64_t)&protocol conformance descriptor for CircularHistoricalUsageView);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003CC88);
  }
  return result;
}

uint64_t sub_10000F4A0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HistoricalUsageWidgetEntryView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000F4DC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000F5AC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000FB78((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_10000FB78((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000FB58(v12);
  return v7;
}

uint64_t sub_10000F5AC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_10000F764(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_10000F764(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000F7F8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000F9D0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000F9D0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000F7F8(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_10000F96C(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_10000F96C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100005E18(&qword_10003CC98);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000F9D0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100005E18(&qword_10003CC98);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000FB1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    return swift_bridgeObjectRelease(a6);
  }
  return result;
}

uint64_t sub_10000FB58(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000FB78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000FBB8()
{
  unint64_t result;

  result = qword_10003CCA8;
  if (!qword_10003CCA8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10003CCA8);
  }
  return result;
}

uint64_t sub_10000FBFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005E18(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000FC40(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000FC90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HistoricalUsageEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000FCD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003CCB0;
  if (!qword_10003CCB0)
  {
    v1 = sub_100005E58(&qword_10003CCB8);
    sub_10000F2D0();
    sub_10000F3F8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003CCB0);
  }
  return result;
}

uint64_t FeatureFlagsKey.isEnabled.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD v6[5];

  v3 = a1;
  v6[3] = a1;
  v6[4] = a2;
  v4 = sub_10000FDA4(v6);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(v4, v2, v3);
  LOBYTE(v3) = isFeatureEnabled(_:)(v6);
  sub_10000FB58(v6);
  return v3 & 1;
}

_QWORD *sub_10000FDA4(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

_BYTE *initializeBufferWithCopyOfBuffer for HomeEnergyFeatures(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HomeEnergyFeatures(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HomeEnergyFeatures(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000FECC + 4 * byte_100030E85[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_10000FF00 + 4 * byte_100030E80[v4]))();
}

uint64_t sub_10000FF00(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000FF08(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000FF10);
  return result;
}

uint64_t sub_10000FF1C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000FF24);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_10000FF28(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000FF30(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000FF3C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000FF44(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyFeatures()
{
  return &type metadata for HomeEnergyFeatures;
}

unint64_t sub_10000FF60()
{
  unint64_t result;

  result = qword_10003CCC0;
  if (!qword_10003CCC0)
  {
    result = swift_getWitnessTable(&unk_100030EF4, &type metadata for HomeEnergyFeatures);
    atomic_store(result, (unint64_t *)&qword_10003CCC0);
  }
  return result;
}

BOOL sub_10000FFA4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000FFB8()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000FFFC()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100010024(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

const char *sub_100010064()
{
  return "HomeEnergy";
}

uint64_t sub_100010078()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_1000100A0 + 4 * byte_100030E8A[*v0]))("home2023", 8);
}

const char *sub_1000100A0()
{
  return "home2023QE";
}

const char *sub_1000100B4()
{
  return "thirdrail";
}

const char *sub_1000100C8()
{
  return "utility2024";
}

uint64_t sub_100010110@<X0>(uint64_t a1@<X8>)
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
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
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  char *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  unint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  char *v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  unint64_t v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  char *v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t OpaqueTypeConformance2;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  unint64_t v180;
  uint64_t v181;
  char *v182;
  char *v183;
  uint64_t v184;
  char *v185;
  uint64_t v186;
  char *v187;
  char *v188;
  uint64_t v189;
  char *v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  char *v198;
  uint64_t v199;
  char *v200;
  uint64_t v201;
  char *v202;
  char *v203;
  char *v204;
  char *v205;
  uint64_t v206;
  char *v207;
  uint64_t v208;
  char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  char *v217;
  uint64_t v218;
  char *v219;
  uint64_t v220;
  char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  uint64_t v234;
  void *v235;
  uint64_t v236;
  uint64_t v237;
  char v238;
  uint64_t v239;
  char v240[8];

  v230 = a1;
  v197 = sub_100005E18(&qword_10003CD88);
  __chkstk_darwin(v197);
  v198 = (char *)&v181 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v229 = sub_100005E18(&qword_10003CD90);
  __chkstk_darwin(v229);
  v200 = (char *)&v181 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v196 = type metadata accessor for CircularUtilityRateInfoView(0);
  v189 = *(_QWORD *)(v196 - 8);
  __chkstk_darwin(v196);
  v188 = (char *)&v181 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v199 = sub_100005E18(&qword_10003CD98);
  v191 = *(_QWORD *)(v199 - 8);
  v5 = __chkstk_darwin(v199);
  v187 = (char *)&v181 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v190 = (char *)&v181 - v7;
  v194 = type metadata accessor for Date(0);
  v193 = *(_QWORD *)(v194 - 8);
  __chkstk_darwin(v194);
  v195 = (char *)&v181 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v218 = type metadata accessor for RectangularLockUtilityInfoView(0);
  v184 = *(_QWORD *)(v218 - 8);
  __chkstk_darwin(v218);
  v183 = (char *)&v181 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v213 = sub_100005E18(&qword_10003CDA0);
  v186 = *(_QWORD *)(v213 - 8);
  v10 = __chkstk_darwin(v213);
  v182 = (char *)&v181 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v185 = (char *)&v181 - v12;
  v227 = sub_100005E18(&qword_10003CDA8);
  __chkstk_darwin(v227);
  v226 = (uint64_t)&v181 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v215 = sub_100005E18(&qword_10003CDB0);
  __chkstk_darwin(v215);
  v217 = (char *)&v181 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v228 = sub_100005E18(&qword_10003CDB8);
  __chkstk_darwin(v228);
  v219 = (char *)&v181 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v210 = type metadata accessor for ContainerBackgroundPlacement(0);
  v208 = *(_QWORD *)(v210 - 8);
  __chkstk_darwin(v210);
  v207 = (char *)&v181 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100005E18(&qword_10003CC50);
  __chkstk_darwin(v17);
  v221 = (char *)&v181 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v231 = type metadata accessor for UtilityRateInfoSnapshot(0);
  v222 = *(_QWORD *)(v231 - 8);
  v19 = __chkstk_darwin(v231);
  v192 = (char *)&v181 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v202 = (char *)&v181 - v21;
  v212 = type metadata accessor for UtilityRateInfoWidgetView(0);
  v201 = *(_QWORD *)(v212 - 8);
  __chkstk_darwin(v212);
  v203 = (char *)&v181 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v214 = sub_100005E18(&qword_10003CDC0);
  v206 = *(_QWORD *)(v214 - 8);
  __chkstk_darwin(v214);
  v205 = (char *)&v181 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v216 = sub_100005E18(&qword_10003CDC8);
  v211 = *(_QWORD *)(v216 - 8);
  v24 = __chkstk_darwin(v216);
  v204 = (char *)&v181 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v209 = (char *)&v181 - v26;
  v27 = type metadata accessor for UtilityRateInfoWidgetEntryView(0);
  v28 = __chkstk_darwin(v27);
  v30 = (char *)&v181 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __chkstk_darwin(v28);
  v181 = (uint64_t)&v181 - v32;
  __chkstk_darwin(v31);
  v34 = (char *)&v181 - v33;
  v35 = type metadata accessor for Logger(0);
  v223 = *(_QWORD *)(v35 - 8);
  v224 = v35;
  v36 = __chkstk_darwin(v35);
  v38 = (char *)&v181 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __chkstk_darwin(v36);
  v41 = (char *)&v181 - v40;
  __chkstk_darwin(v39);
  v43 = (char *)&v181 - v42;
  v44 = type metadata accessor for WidgetFamily(0);
  v45 = *(_QWORD *)(v44 - 8);
  __chkstk_darwin(v44);
  v47 = (char *)&v181 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v225 = v27;
  sub_10000F090((uint64_t)v47);
  v48 = (*(uint64_t (**)(char *, uint64_t))(v45 + 88))(v47, v44);
  if (v48 == enum case for WidgetFamily.systemSmall(_:))
  {
    static Logger.utilityRateWidgets.getter();
    v49 = v1;
    v50 = sub_10000FC40(v1, (uint64_t)v34, type metadata accessor for UtilityRateInfoWidgetEntryView);
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc(12, -1);
      v54 = swift_slowAlloc(32, -1);
      v232 = v54;
      *(_DWORD *)v53 = 136315138;
      v220 = v1;
      v55 = v225;
      type metadata accessor for UtilityRateInfoEntry(0);
      v56 = sub_10000C440(&qword_10003CDF8, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoSnapshot, (uint64_t)&protocol conformance descriptor for UtilityRateInfoSnapshot);
      v57 = dispatch thunk of CustomStringConvertible.description.getter(v231, v56);
      v59 = v58;
      v239 = sub_10000F4DC(v57, v58, &v232);
      v49 = v220;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v239, v240, v53 + 4, v53 + 12);
      swift_bridgeObjectRelease(v59);
      sub_100012CCC((uint64_t)v34);
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "UtilityRateInfoWidgetEntryView: creating systemSmall widget for infoSnapshot: %s", v53, 0xCu);
      swift_arrayDestroy(v54, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v54, -1, -1);
      swift_slowDealloc(v53, -1, -1);

      (*(void (**)(char *, uint64_t))(v223 + 8))(v43, v224);
    }
    else
    {
      sub_100012CCC((uint64_t)v34);

      (*(void (**)(char *, uint64_t))(v223 + 8))(v43, v224);
      v55 = v225;
    }
    v73 = v202;
    v74 = v49 + *(int *)(v55 + 24);
    v75 = type metadata accessor for UtilityRateInfoEntry(0);
    IntentParameter.wrappedValue.getter(v75);
    if (v233)
    {
      v76 = v238;
      sub_10000FB1C(v232, (uint64_t)v233, v234, (uint64_t)v235, v236, v237);
      v77 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v222 + 16))(v73, v74 + *(int *)(v75 + 20), v231);
      if ((v76 & 1) != 0)
      {
        IntentParameter.wrappedValue.getter(v77);
        v78 = (uint64_t)v233;
        v79 = v201;
        if (v233)
        {
          v80 = v232;
          v81 = v234;
          v82 = (uint64_t)v235;
          v83 = v236;
          v84 = v237;
          swift_bridgeObjectRetain();
          sub_10000FB1C(v80, v78, v81, v82, v83, v84);
        }
        else
        {
          v81 = 0;
          v82 = 0;
        }
        v105 = (uint64_t)v221;
        v106 = v212;
        goto LABEL_24;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v222 + 16))(v73, v74 + *(int *)(v75 + 20), v231);
    }
    v81 = 0;
    v82 = 0;
    v105 = (uint64_t)v221;
    v106 = v212;
    v79 = v201;
LABEL_24:
    v155 = v203;
    UtilityRateInfoWidgetView.init(snapshot:homeName:)(v73, v81, v82);
    v156 = sub_100011628();
    v158 = v157;
    URL.init(string:)(v156);
    swift_bridgeObjectRelease(v158);
    v159 = (void *)sub_10000C440(&qword_10003CDE0, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoWidgetView, (uint64_t)&protocol conformance descriptor for UtilityRateInfoWidgetView);
    v160 = v205;
    View.widgetURL(_:)(v105, v106, v159);
    sub_10000C404(v105, &qword_10003CC50);
    v161 = (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v155, v106);
    v162 = v207;
    v163 = static ContainerBackgroundPlacement.widget.getter(v161);
    v164 = static Alignment.center.getter(v163);
    v166 = v165;
    v232 = v106;
    v233 = v159;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v232, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v168 = v204;
    v169 = v214;
    View.containerBackground<A>(for:alignment:content:)(v162, v164, v166, nullsub_1, 0, v214, &type metadata for EmptyView, OpaqueTypeConformance2, &protocol witness table for EmptyView);
    (*(void (**)(char *, uint64_t))(v208 + 8))(v162, v210);
    (*(void (**)(char *, uint64_t))(v206 + 8))(v160, v169);
    v170 = v211;
    v171 = v209;
    v172 = v216;
    (*(void (**)(char *, char *, uint64_t))(v211 + 32))(v209, v168, v216);
    v173 = v217;
    (*(void (**)(char *, char *, uint64_t))(v170 + 16))(v217, v171, v172);
    swift_storeEnumTagMultiPayload(v173, v215, 0);
    v232 = v169;
    v233 = &type metadata for EmptyView;
    v234 = OpaqueTypeConformance2;
    v235 = &protocol witness table for EmptyView;
    v174 = swift_getOpaqueTypeConformance2(&v232, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
    v175 = (void *)sub_10000C440(&qword_10003CDE8, (uint64_t (*)(uint64_t))&type metadata accessor for RectangularLockUtilityInfoView, (uint64_t)&protocol conformance descriptor for RectangularLockUtilityInfoView);
    v232 = v218;
    v233 = v175;
    v176 = swift_getOpaqueTypeConformance2(&v232, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v177 = (uint64_t)v219;
    _ConditionalContent<>.init(storage:)(v173, v172, v213, v174, v176);
    v178 = v226;
    sub_10000FBFC(v177, v226, &qword_10003CDB8);
    swift_storeEnumTagMultiPayload(v178, v227, 0);
    v179 = sub_100012AFC();
    v180 = sub_100012C24();
    _ConditionalContent<>.init(storage:)(v178, v228, v229, v179, v180);
    sub_10000C404(v177, &qword_10003CDB8);
    return (*(uint64_t (**)(char *, uint64_t))(v170 + 8))(v171, v172);
  }
  v220 = v1;
  if (v48 == enum case for WidgetFamily.accessoryCircular(_:))
  {
    static Logger.utilityRateWidgets.getter();
    v60 = sub_10000FC40(v220, (uint64_t)v30, type metadata accessor for UtilityRateInfoWidgetEntryView);
    v61 = Logger.logObject.getter(v60);
    v62 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc(12, -1);
      v64 = swift_slowAlloc(32, -1);
      v232 = v64;
      *(_DWORD *)v63 = 136315138;
      v219 = (char *)(v63 + 4);
      v65 = v225;
      type metadata accessor for UtilityRateInfoEntry(0);
      v66 = sub_10000C440(&qword_10003CDF8, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoSnapshot, (uint64_t)&protocol conformance descriptor for UtilityRateInfoSnapshot);
      v67 = v231;
      v68 = dispatch thunk of CustomStringConvertible.description.getter(v231, v66);
      v70 = v69;
      v239 = sub_10000F4DC(v68, v69, &v232);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v239, v240, v219, v63 + 12);
      swift_bridgeObjectRelease(v70);
      sub_100012CCC((uint64_t)v30);
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "UtilityRateInfoWidgetEntryView: creating accessoryCircular widget for infoSnapshot: %s", v63, 0xCu);
      swift_arrayDestroy(v64, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v64, -1, -1);
      swift_slowDealloc(v63, -1, -1);

      (*(void (**)(char *, uint64_t))(v223 + 8))(v38, v224);
      v71 = v226;
      v72 = v227;
    }
    else
    {
      sub_100012CCC((uint64_t)v30);

      (*(void (**)(char *, uint64_t))(v223 + 8))(v38, v224);
      v71 = v226;
      v72 = v227;
      v67 = v231;
      v65 = v225;
    }
    v107 = v220 + *(int *)(v65 + 24);
    v108 = v195;
    (*(void (**)(char *, uint64_t, uint64_t))(v193 + 16))(v195, v107, v194);
    v109 = v107 + *(int *)(type metadata accessor for UtilityRateInfoEntry(0) + 20);
    v110 = v192;
    (*(void (**)(char *, uint64_t, uint64_t))(v222 + 16))(v192, v109, v67);
    v111 = v188;
    CircularUtilityRateInfoView.init(widgetStartDate:infoSnapshot:)(v108, v110);
    v112 = sub_100011628();
    v114 = v113;
    v115 = (uint64_t)v221;
    URL.init(string:)(v112);
    swift_bridgeObjectRelease(v114);
    v116 = (void *)sub_10000C440(&qword_10003CDD0, (uint64_t (*)(uint64_t))&type metadata accessor for CircularUtilityRateInfoView, (uint64_t)&protocol conformance descriptor for CircularUtilityRateInfoView);
    v117 = v187;
    v118 = v196;
    View.widgetURL(_:)(v115, v196, v116);
    sub_10000C404(v115, &qword_10003CC50);
    (*(void (**)(char *, uint64_t))(v189 + 8))(v111, v118);
    v119 = v191;
    v120 = v190;
    v121 = v199;
    (*(void (**)(char *, char *, uint64_t))(v191 + 32))(v190, v117, v199);
    v122 = v198;
    (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v198, v120, v121);
    swift_storeEnumTagMultiPayload(v122, v197, 0);
    v232 = v118;
    v233 = v116;
    v123 = swift_getOpaqueTypeConformance2(&v232, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v124 = (uint64_t)v200;
    _ConditionalContent<>.init(storage:)(v122, v121, &type metadata for EmptyView, v123, &protocol witness table for EmptyView);
    sub_10000FBFC(v124, v71, &qword_10003CD90);
    swift_storeEnumTagMultiPayload(v71, v72, 1);
    v125 = sub_100012AFC();
    v126 = sub_100012C24();
    _ConditionalContent<>.init(storage:)(v71, v228, v229, v125, v126);
    sub_10000C404(v124, &qword_10003CD90);
    return (*(uint64_t (**)(char *, uint64_t))(v119 + 8))(v120, v121);
  }
  else if (v48 == enum case for WidgetFamily.accessoryRectangular(_:))
  {
    v85 = v41;
    static Logger.utilityRateWidgets.getter();
    v86 = v181;
    v87 = sub_10000FC40(v220, v181, type metadata accessor for UtilityRateInfoWidgetEntryView);
    v88 = Logger.logObject.getter(v87);
    v89 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v88, v89))
    {
      v90 = (uint8_t *)swift_slowAlloc(12, -1);
      v91 = swift_slowAlloc(32, -1);
      v232 = v91;
      *(_DWORD *)v90 = 136315138;
      type metadata accessor for UtilityRateInfoEntry(0);
      v92 = sub_10000C440(&qword_10003CDF8, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoSnapshot, (uint64_t)&protocol conformance descriptor for UtilityRateInfoSnapshot);
      v93 = v231;
      v94 = dispatch thunk of CustomStringConvertible.description.getter(v231, v92);
      v96 = v95;
      v239 = sub_10000F4DC(v94, v95, &v232);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v239, v240, v90 + 4, v90 + 12);
      swift_bridgeObjectRelease(v96);
      sub_100012CCC(v86);
      _os_log_impl((void *)&_mh_execute_header, v88, v89, "UtilityRateInfoWidgetEntryView: creating accessoryRectangular widget for infoSnapshot: %s", v90, 0xCu);
      swift_arrayDestroy(v91, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v91, -1, -1);
      swift_slowDealloc(v90, -1, -1);

      (*(void (**)(char *, uint64_t))(v223 + 8))(v85, v224);
      v97 = v225;
      v98 = v226;
      v99 = v213;
      v100 = (uint64_t)v221;
      v101 = v222;
      v102 = v195;
      v103 = v194;
      v104 = v193;
    }
    else
    {
      sub_100012CCC(v86);

      (*(void (**)(char *, uint64_t))(v223 + 8))(v85, v224);
      v99 = v213;
      v100 = (uint64_t)v221;
      v101 = v222;
      v93 = v231;
      v102 = v195;
      v103 = v194;
      v104 = v193;
      v97 = v225;
      v98 = v226;
    }
    v135 = v192;
    v136 = v220 + *(int *)(v97 + 24);
    (*(void (**)(char *, uint64_t, uint64_t))(v104 + 16))(v102, v136, v103);
    v137 = type metadata accessor for UtilityRateInfoEntry(0);
    (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v135, v136 + *(int *)(v137 + 20), v93);
    v138 = v183;
    RectangularLockUtilityInfoView.init(widgetStartDate:infoSnapshot:)(v102, v135);
    v139 = sub_100011628();
    v141 = v140;
    URL.init(string:)(v139);
    swift_bridgeObjectRelease(v141);
    v142 = (void *)sub_10000C440(&qword_10003CDE8, (uint64_t (*)(uint64_t))&type metadata accessor for RectangularLockUtilityInfoView, (uint64_t)&protocol conformance descriptor for RectangularLockUtilityInfoView);
    v143 = v182;
    v144 = v218;
    View.widgetURL(_:)(v100, v218, v142);
    sub_10000C404(v100, &qword_10003CC50);
    (*(void (**)(char *, uint64_t))(v184 + 8))(v138, v144);
    v145 = v186;
    v146 = v185;
    (*(void (**)(char *, char *, uint64_t))(v186 + 32))(v185, v143, v99);
    v147 = v217;
    (*(void (**)(char *, char *, uint64_t))(v145 + 16))(v217, v146, v99);
    swift_storeEnumTagMultiPayload(v147, v215, 1);
    v148 = (void *)sub_10000C440(&qword_10003CDE0, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoWidgetView, (uint64_t)&protocol conformance descriptor for UtilityRateInfoWidgetView);
    v232 = v212;
    v233 = v148;
    v149 = swift_getOpaqueTypeConformance2(&v232, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v232 = v214;
    v233 = &type metadata for EmptyView;
    v234 = v149;
    v235 = &protocol witness table for EmptyView;
    v150 = swift_getOpaqueTypeConformance2(&v232, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
    v232 = v144;
    v233 = v142;
    v151 = swift_getOpaqueTypeConformance2(&v232, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v152 = (uint64_t)v219;
    _ConditionalContent<>.init(storage:)(v147, v216, v99, v150, v151);
    sub_10000FBFC(v152, v98, &qword_10003CDB8);
    swift_storeEnumTagMultiPayload(v98, v227, 0);
    v153 = sub_100012AFC();
    v154 = sub_100012C24();
    _ConditionalContent<>.init(storage:)(v98, v228, v229, v153, v154);
    sub_10000C404(v152, &qword_10003CDB8);
    return (*(uint64_t (**)(char *, uint64_t))(v145 + 8))(v146, v99);
  }
  else
  {
    v128 = v198;
    swift_storeEnumTagMultiPayload(v198, v197, 1);
    v129 = (void *)sub_10000C440(&qword_10003CDD0, (uint64_t (*)(uint64_t))&type metadata accessor for CircularUtilityRateInfoView, (uint64_t)&protocol conformance descriptor for CircularUtilityRateInfoView);
    v232 = v196;
    v233 = v129;
    v130 = swift_getOpaqueTypeConformance2(&v232, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v131 = (uint64_t)v200;
    _ConditionalContent<>.init(storage:)(v128, v199, &type metadata for EmptyView, v130, &protocol witness table for EmptyView);
    v132 = v226;
    sub_10000FBFC(v131, v226, &qword_10003CD90);
    swift_storeEnumTagMultiPayload(v132, v227, 1);
    v133 = sub_100012AFC();
    v134 = sub_100012C24();
    _ConditionalContent<>.init(storage:)(v132, v228, v229, v133, v134);
    sub_10000C404(v131, &qword_10003CD90);
    return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v47, v44);
  }
}

uint64_t sub_100011628()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v0 = 0xD000000000000039;
  type metadata accessor for UtilityRateInfoWidgetEntryView(0);
  v1 = type metadata accessor for UtilityRateInfoEntry(0);
  IntentParameter.wrappedValue.getter(v1);
  if (v7)
  {
    swift_bridgeObjectRetain();
    sub_10000FB1C(v6, v7, v8, v9, v10, v11);
    v2 = sub_100005E18(&qword_10003CCA0);
    v3 = swift_allocObject(v2, 112, 7);
    *(_OWORD *)(v3 + 16) = xmmword_100030D30;
    *(_QWORD *)(v3 + 56) = &type metadata for String;
    v4 = sub_10000FBB8();
    *(_QWORD *)(v3 + 32) = 0xD000000000000039;
    *(_QWORD *)(v3 + 40) = 0x8000000100032330;
    *(_QWORD *)(v3 + 96) = &type metadata for String;
    *(_QWORD *)(v3 + 104) = v4;
    *(_QWORD *)(v3 + 64) = v4;
    *(_QWORD *)(v3 + 72) = v10;
    *(_QWORD *)(v3 + 80) = v11;
    return String.init(format:_:)(0x69656D6F68264025, 0xEC00000040253D64, v3);
  }
  return v0;
}

HomeEnergyWidgetsExtension::UtilityRateInfoWidget __swiftcall UtilityRateInfoWidget.init()()
{
  void *v0;
  uint64_t v1;
  HomeEnergyWidgetsExtension::UtilityRateInfoWidget result;

  v0 = (void *)0x8000000100030F30;
  v1 = 0xD000000000000015;
  result.kind._object = v0;
  result.kind._countAndFlagsBits = v1;
  return result;
}

uint64_t UtilityRateInfoWidget.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t OpaqueTypeConformance2;
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
  char v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD *v45;
  char *v46;
  void (*v47)(char *, _QWORD, uint64_t);
  uint64_t v48;
  uint64_t v49;
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
  unint64_t v61;
  ValueMetadata *v62;
  unint64_t v63;

  v59 = a3;
  v5 = sub_100005E18(&qword_10003C790);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_100005E18(&qword_10003CCC8);
  v55 = *(_QWORD *)(v52 - 8);
  __chkstk_darwin(v52);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_100005E18(&qword_10003CCD0);
  v56 = *(_QWORD *)(v53 - 8);
  __chkstk_darwin(v53);
  v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100005E18(&qword_10003CCD8);
  v57 = *(_QWORD *)(v13 - 8);
  v58 = v13;
  __chkstk_darwin(v13);
  v54 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for UtilityRateInfoWidgetEntryView(0);
  sub_10000C440(&qword_10003CCE0, type metadata accessor for UtilityRateInfoWidgetEntryView, (uint64_t)&unk_100030FD0);
  sub_100011DA0();
  swift_bridgeObjectRetain();
  AppIntentConfiguration.init<A>(kind:intent:provider:content:)(a1, a2);
  v15 = sub_100011DE4();
  WidgetConfiguration._contentMarginsDisabled()(v5, v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000011, 0x80000001000323E0);
  v17 = Text.init(_:tableName:bundle:comment:)(v16);
  v19 = v18;
  v21 = v20;
  v23 = v22 & 1;
  v60 = v5;
  v61 = v15;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v60, &unk_100032BB0, 1);
  v25 = v52;
  WidgetConfiguration.configurationDisplayName(_:)(v17, v19, v23, v21, v52, OpaqueTypeConformance2);
  sub_10000E1F0(v17, v19, v23);
  swift_bridgeObjectRelease(v21);
  v26 = v10;
  v27 = v53;
  v28 = v25;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v26, v25);
  v29 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000002BLL, 0x8000000100032450);
  v30 = Text.init(_:tableName:bundle:comment:)(v29);
  v32 = v31;
  v34 = v33;
  v36 = v35 & 1;
  v60 = v28;
  v61 = OpaqueTypeConformance2;
  v37 = v54;
  v38 = swift_getOpaqueTypeConformance2(&v60, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v30, v32, v36, v34, v27, v38);
  sub_10000E1F0(v30, v32, v36);
  swift_bridgeObjectRelease(v34);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v12, v27);
  v39 = sub_100005E18(&qword_10003CB40);
  v40 = type metadata accessor for WidgetFamily(0);
  v41 = *(_QWORD *)(v40 - 8);
  v42 = *(_QWORD *)(v41 + 72);
  v43 = *(unsigned __int8 *)(v41 + 80);
  v44 = (v43 + 32) & ~v43;
  v45 = (_OWORD *)swift_allocObject(v39, v44 + 3 * v42, v43 | 7);
  v45[1] = xmmword_100030D40;
  v46 = (char *)v45 + v44;
  v47 = *(void (**)(char *, _QWORD, uint64_t))(v41 + 104);
  v47(v46, enum case for WidgetFamily.accessoryRectangular(_:), v40);
  v47(&v46[v42], enum case for WidgetFamily.systemSmall(_:), v40);
  v47(&v46[2 * v42], enum case for WidgetFamily.accessoryCircular(_:), v40);
  v62 = &type metadata for HomeEnergyFeatures;
  v63 = sub_10000E200();
  LOBYTE(v60) = 4;
  LOBYTE(v40) = isFeatureEnabled(_:)(&v60);
  sub_10000FB58(&v60);
  if ((v40 & 1) == 0)
  {
    swift_bridgeObjectRelease(v45);
    v45 = &_swiftEmptyArrayStorage;
  }
  v60 = v27;
  v61 = v38;
  v48 = swift_getOpaqueTypeConformance2(&v60, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v49 = v58;
  WidgetConfiguration.supportedFamilies(_:)(v45, v58, v48);
  swift_bridgeObjectRelease(v45);
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v37, v49);
}

uint64_t sub_100011C74@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;

  v4 = type metadata accessor for UtilityRateInfoEntry(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FC40(a1, (uint64_t)v6, v7);
  *a2 = swift_getKeyPath(&unk_100031020);
  v8 = sub_100005E18(&qword_10003CB50);
  swift_storeEnumTagMultiPayload(a2, v8, 0);
  v9 = type metadata accessor for UtilityRateInfoWidgetEntryView(0);
  v10 = (_QWORD *)((char *)a2 + *(int *)(v9 + 20));
  *v10 = swift_getKeyPath(&unk_100031050);
  v11 = sub_100005E18(&qword_10003CB58);
  swift_storeEnumTagMultiPayload(v10, v11, 0);
  return sub_100012D14((uint64_t)v6, (uint64_t)a2 + *(int *)(v9 + 24));
}

uint64_t type metadata accessor for UtilityRateInfoWidgetEntryView(uint64_t a1)
{
  uint64_t result;

  result = qword_10003CD48;
  if (!qword_10003CD48)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UtilityRateInfoWidgetEntryView);
  return result;
}

unint64_t sub_100011DA0()
{
  unint64_t result;

  result = qword_10003CCE8;
  if (!qword_10003CCE8)
  {
    result = swift_getWitnessTable(&unk_100031180, &type metadata for UtilityRateInfoTimelineProvider);
    atomic_store(result, (unint64_t *)&qword_10003CCE8);
  }
  return result;
}

unint64_t sub_100011DE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C798;
  if (!qword_10003C798)
  {
    v1 = sub_100005E58(&qword_10003C790);
    result = swift_getWitnessTable(&protocol conformance descriptor for AppIntentConfiguration<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C798);
  }
  return result;
}

uint64_t sub_100011E30(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of UtilityRateInfoWidget.body>>, 1);
}

void sub_100011E40(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x8000000100030F30;
}

uint64_t sub_100011E60@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return UtilityRateInfoWidget.body.getter(*v1, v1[1], a1);
}

ValueMetadata *type metadata accessor for UtilityRateInfoWidget()
{
  return &type metadata for UtilityRateInfoWidget;
}

uint64_t sub_100011E78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;

  v0 = sub_100005E58(&qword_10003CCD8);
  v1 = sub_100005E58(&qword_10003CCD0);
  v2 = sub_100005E58(&qword_10003CCC8);
  v7 = sub_100005E58(&qword_10003C790);
  v8 = sub_100011DE4();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v7, &unk_100032BB0, 1);
  v7 = v2;
  v8 = OpaqueTypeConformance2;
  v4 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v7 = v1;
  v8 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v7 = v0;
  v8 = v5;
  return swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
}

uint64_t *sub_100011F44(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100005E18(&qword_10003CB50);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 20);
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = sub_100005E18(&qword_10003CB58);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = *(int *)(a3 + 24);
    v24 = (char *)a1 + v23;
    v25 = (char *)a2 + v23;
    v26 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
    v27 = type metadata accessor for UtilityRateInfoEntry(0);
    v28 = *(int *)(v27 + 20);
    v29 = &v24[v28];
    v30 = &v25[v28];
    v31 = type metadata accessor for UtilityRateInfoSnapshot(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
    v32 = *(int *)(v27 + 24);
    v12 = *(_QWORD *)&v25[v32];
    *(_QWORD *)&v24[v32] = v12;
  }
  swift_retain(v12);
  return a1;
}

uint64_t sub_100012104(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v4 = sub_100005E18(&qword_10003CB50);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + *(int *)(a2 + 20));
  v7 = sub_100005E18(&qword_10003CB58);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (char *)a1 + *(int *)(a2 + 24);
  v10 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = type metadata accessor for UtilityRateInfoEntry(0);
  v12 = &v9[*(int *)(v11 + 20)];
  v13 = type metadata accessor for UtilityRateInfoSnapshot(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  return swift_release(*(_QWORD *)&v9[*(int *)(v11 + 24)]);
}

uint64_t *sub_100012220(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v6 = sub_100005E18(&qword_10003CB50);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  v15 = sub_100005E18(&qword_10003CB58);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = *(int *)(a3 + 24);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  v25 = type metadata accessor for UtilityRateInfoEntry(0);
  v26 = *(int *)(v25 + 20);
  v27 = &v22[v26];
  v28 = &v23[v26];
  v29 = type metadata accessor for UtilityRateInfoSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v27, v28, v29);
  v30 = *(int *)(v25 + 24);
  v31 = *(_QWORD *)&v23[v30];
  *(_QWORD *)&v22[v30] = v31;
  swift_retain(v31);
  return a1;
}

uint64_t *sub_1000123B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (a1 != a2)
  {
    sub_10000C404((uint64_t)a1, &qword_10003CB50);
    v6 = sub_100005E18(&qword_10003CB50);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = *(int *)(a3 + 20);
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_10000C404((uint64_t)a1 + v12, &qword_10003CB58);
    v15 = sub_100005E18(&qword_10003CB58);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  v21 = *(int *)(a3 + 24);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  v25 = type metadata accessor for UtilityRateInfoEntry(0);
  v26 = *(int *)(v25 + 20);
  v27 = &v22[v26];
  v28 = &v23[v26];
  v29 = type metadata accessor for UtilityRateInfoSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 24))(v27, v28, v29);
  v30 = *(int *)(v25 + 24);
  v31 = *(_QWORD *)&v23[v30];
  v32 = *(_QWORD *)&v22[v30];
  *(_QWORD *)&v22[v30] = v31;
  swift_retain(v31);
  swift_release(v32);
  return a1;
}

char *sub_100012584(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v6 = sub_100005E18(&qword_10003CB50);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_100005E18(&qword_10003CB58);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  v17 = type metadata accessor for UtilityRateInfoEntry(0);
  v18 = *(int *)(v17 + 20);
  v19 = &v14[v18];
  v20 = &v15[v18];
  v21 = type metadata accessor for UtilityRateInfoSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v19, v20, v21);
  *(_QWORD *)&v14[*(int *)(v17 + 24)] = *(_QWORD *)&v15[*(int *)(v17 + 24)];
  return a1;
}

char *sub_100012710(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 != a2)
  {
    sub_10000C404((uint64_t)a1, &qword_10003CB50);
    v6 = sub_100005E18(&qword_10003CB50);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_10000C404((uint64_t)&a1[v8], &qword_10003CB58);
    v11 = sub_100005E18(&qword_10003CB58);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  v17 = type metadata accessor for UtilityRateInfoEntry(0);
  v18 = *(int *)(v17 + 20);
  v19 = &v14[v18];
  v20 = &v15[v18];
  v21 = type metadata accessor for UtilityRateInfoSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 40))(v19, v20, v21);
  v22 = *(int *)(v17 + 24);
  v23 = *(_QWORD *)&v14[v22];
  *(_QWORD *)&v14[v22] = *(_QWORD *)&v15[v22];
  swift_release(v23);
  return a1;
}

uint64_t sub_1000128CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000128D8);
}

uint64_t sub_1000128D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_100005E18(&qword_10003CB60);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = sub_100005E18(&qword_10003CB68);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = type metadata accessor for UtilityRateInfoEntry(0);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_100012978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100012984);
}

uint64_t sub_100012984(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_100005E18(&qword_10003CB60);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = sub_100005E18(&qword_10003CB68);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for UtilityRateInfoEntry(0);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_100012A2C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[3];

  sub_10000F034(319, &qword_10003CBD8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000F034(319, (unint64_t *)&unk_10003CBE0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    if (v5 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(v4 - 8) + 64;
      v6 = type metadata accessor for UtilityRateInfoEntry(319);
      if (v7 <= 0x3F)
      {
        v8[2] = *(_QWORD *)(v6 - 8) + 64;
        swift_initStructMetadata(a1, 256, 3, v8, a1 + 16);
      }
    }
  }
}

uint64_t sub_100012AEC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100032E0C, 1);
}

unint64_t sub_100012AFC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  result = qword_10003CDD8;
  if (!qword_10003CDD8)
  {
    v1 = sub_100005E58(&qword_10003CDB8);
    v2 = sub_100005E58(&qword_10003CDC0);
    v6 = type metadata accessor for UtilityRateInfoWidgetView(255);
    v7 = (void *)sub_10000C440(&qword_10003CDE0, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoWidgetView, (uint64_t)&protocol conformance descriptor for UtilityRateInfoWidgetView);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v6, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v6 = v2;
    v7 = &type metadata for EmptyView;
    v8 = OpaqueTypeConformance2;
    v9 = &protocol witness table for EmptyView;
    swift_getOpaqueTypeConformance2(&v6, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
    v4 = type metadata accessor for RectangularLockUtilityInfoView(255);
    v5 = sub_10000C440(&qword_10003CDE8, (uint64_t (*)(uint64_t))&type metadata accessor for RectangularLockUtilityInfoView, (uint64_t)&protocol conformance descriptor for RectangularLockUtilityInfoView);
    v6 = v4;
    v7 = (void *)v5;
    swift_getOpaqueTypeConformance2(&v6, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003CDD8);
  }
  return result;
}

unint64_t sub_100012C24()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_10003CDF0;
  if (!qword_10003CDF0)
  {
    v1 = sub_100005E58(&qword_10003CD90);
    v2[0] = type metadata accessor for CircularUtilityRateInfoView(255);
    v2[1] = sub_10000C440(&qword_10003CDD0, (uint64_t (*)(uint64_t))&type metadata accessor for CircularUtilityRateInfoView, (uint64_t)&protocol conformance descriptor for CircularUtilityRateInfoView);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003CDF0);
  }
  return result;
}

uint64_t sub_100012CCC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for UtilityRateInfoWidgetEntryView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100012D14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UtilityRateInfoEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100012D5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003CE00;
  if (!qword_10003CE00)
  {
    v1 = sub_100005E58(&qword_10003CE08);
    sub_100012AFC();
    sub_100012C24();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003CE00);
  }
  return result;
}

uint64_t sub_100012DC8()
{
  uint64_t v0;
  _QWORD v2[6];

  v2[0] = 0xD000000000000014;
  v2[1] = 0x8000000100031B90;
  v2[2] = 0xD000000000000015;
  v2[3] = 0x8000000100031B50;
  v2[4] = 0xD000000000000015;
  v2[5] = 0x8000000100031B70;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_100005E18(&qword_10003CE18);
  TupleWidget.init(_:)(v2, v0);
  swift_bridgeObjectRelease(0x8000000100031B90);
  swift_bridgeObjectRelease(0x8000000100031B50);
  return swift_bridgeObjectRelease(0x8000000100031B70);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100012EC0();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100012EC0()
{
  unint64_t result;

  result = qword_10003CE10;
  if (!qword_10003CE10)
  {
    result = swift_getWitnessTable(&unk_100031098, &type metadata for HomeEnergyWidgetsBundle);
    atomic_store(result, (unint64_t *)&qword_10003CE10);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyWidgetsBundle()
{
  return &type metadata for HomeEnergyWidgetsBundle;
}

uint64_t sub_100012F14(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100032E50, 1);
}

unint64_t sub_100012F28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003CE20;
  if (!qword_10003CE20)
  {
    v1 = sub_100005E58(&qword_10003CE28);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleWidget<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10003CE20);
  }
  return result;
}

ValueMetadata *type metadata accessor for UtilityRateInfoTimelineProvider()
{
  return &type metadata for UtilityRateInfoTimelineProvider;
}

uint64_t *sub_100012F84(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for UtilityRateInfoSnapshot(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 24);
    v13 = *(uint64_t *)((char *)a2 + v12);
    *(uint64_t *)((char *)a1 + v12) = v13;
  }
  swift_retain(v13);
  return a1;
}

uint64_t sub_100013040(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for UtilityRateInfoSnapshot(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_release(*(_QWORD *)(a1 + *(int *)(a2 + 24)));
}

uint64_t sub_1000130B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for UtilityRateInfoSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(_QWORD *)(a2 + v11);
  *(_QWORD *)(a1 + v11) = v12;
  swift_retain(v12);
  return a1;
}

uint64_t sub_100013144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for UtilityRateInfoSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(_QWORD *)(a2 + v11);
  v13 = *(_QWORD *)(a1 + v11);
  *(_QWORD *)(a1 + v11) = v12;
  swift_retain(v12);
  swift_release(v13);
  return a1;
}

uint64_t sub_1000131E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for UtilityRateInfoSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100013274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for UtilityRateInfoSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(_QWORD *)(a1 + v11);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  swift_release(v12);
  return a1;
}

uint64_t sub_10001330C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013318);
}

uint64_t sub_100013318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = type metadata accessor for UtilityRateInfoSnapshot(0);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_1000133C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000133CC);
}

uint64_t sub_1000133CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = type metadata accessor for UtilityRateInfoSnapshot(0);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for UtilityRateInfoEntry(uint64_t a1)
{
  uint64_t result;

  result = qword_10003CE88;
  if (!qword_10003CE88)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UtilityRateInfoEntry);
  return result;
}

uint64_t sub_1000134AC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[3];

  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for UtilityRateInfoSnapshot(319);
    if (v4 <= 0x3F)
    {
      v5[1] = *(_QWORD *)(result - 8) + 64;
      v5[2] = (char *)&value witness table for Builtin.NativeObject + 64;
      swift_initStructMetadata(a1, 256, 3, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001353C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v2 = type metadata accessor for Date(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v37 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UtilityRateInfoSnapshot(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v36 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v30 - v9;
  v11 = type metadata accessor for Logger(0);
  v35 = *(_QWORD *)(v11 - 8);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static Logger.utilityRateWidgets.getter(v12);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v33 = v2;
    v18 = swift_slowAlloc(12, -1);
    v34 = a1;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc(32, -1);
    v31 = v11;
    v21 = v20;
    v39 = v20;
    v32 = v3;
    *(_DWORD *)v19 = 136315138;
    v38 = sub_10000F4DC(0xD000000000000010, 0x8000000100032590, &v39);
    v3 = v32;
    v2 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v19 + 4, v19 + 12);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s Generating placeholder with mock data.", v19, 0xCu);
    swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1, -1);
    v22 = v19;
    a1 = v34;
    swift_slowDealloc(v22, -1, -1);

    v23 = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v14, v31);
  }
  else
  {

    v23 = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v14, v11);
  }
  v24 = static UtilityRateInfoSnapshot.mockETOUCSnapshotOne.getter(v23);
  v25 = v37;
  static Date.now.getter(v24);
  v26 = v36;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v36, v10, v5);
  v27 = sub_10002F0F0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v25, v2);
  v28 = type metadata accessor for UtilityRateInfoEntry(0);
  result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1 + *(int *)(v28 + 20), v26, v5);
  *(_QWORD *)(a1 + *(int *)(v28 + 24)) = v27;
  return result;
}

uint64_t sub_100013818(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[4] = a1;
  v2[5] = a2;
  v3 = type metadata accessor for Logger(0);
  v2[6] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[7] = v4;
  v2[8] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100013878, 0, 0);
}

uint64_t sub_100013878(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = *(_QWORD *)(v1 + 40);
  static Logger.utilityRateWidgets.getter(a1);
  v3 = swift_retain_n(v2, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v21 = *(_QWORD *)(v1 + 56);
    v6 = *(_QWORD *)(v1 + 40);
    v22 = *(_QWORD *)(v1 + 48);
    v23 = *(_QWORD *)(v1 + 64);
    v7 = swift_slowAlloc(22, -1);
    v20 = swift_slowAlloc(64, -1);
    v24 = v20;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v1 + 16) = sub_10000F4DC(0xD000000000000011, 0x8000000100032570, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2080;
    swift_retain(v6);
    v8 = sub_10002ECB0();
    v10 = v9;
    swift_release(v6);
    *(_QWORD *)(v1 + 24) = sub_10000F4DC(v8, v10, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v10);
    swift_release_n(v6, 2);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s Generating snapshot with mock data & configuration: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v20, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v22);
  }
  else
  {
    v12 = *(_QWORD *)(v1 + 56);
    v11 = *(_QWORD *)(v1 + 64);
    v13 = *(_QWORD *)(v1 + 48);
    swift_release_n(*(_QWORD *)(v1 + 40), 2);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  v14 = *(_QWORD *)(v1 + 64);
  v16 = *(_QWORD *)(v1 + 32);
  v15 = *(_QWORD *)(v1 + 40);
  v17 = type metadata accessor for UtilityRateInfoEntry(0);
  v18 = static UtilityRateInfoSnapshot.placeholderETOUCSnapshot.getter();
  static Date.now.getter(v18);
  *(_QWORD *)(v16 + *(int *)(v17 + 24)) = v15;
  swift_retain(v15);
  swift_task_dealloc(v14);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100013ABC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v2[38] = a1;
  v2[39] = a2;
  v3 = type metadata accessor for TimelineReloadPolicy(0);
  v2[40] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[41] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[42] = swift_task_alloc(v5);
  v2[43] = swift_task_alloc(v5);
  v6 = type metadata accessor for UtilityRateInfoEntry(0);
  v2[44] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[45] = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[46] = swift_task_alloc(v8);
  v2[47] = swift_task_alloc(v8);
  v2[48] = swift_task_alloc(v8);
  v9 = sub_100005E18(&qword_10003CF10);
  v2[49] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Date(0);
  v2[50] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v2[51] = v11;
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[52] = swift_task_alloc(v12);
  v2[53] = swift_task_alloc(v12);
  v2[54] = swift_task_alloc(v12);
  v2[55] = swift_task_alloc(v12);
  v2[56] = swift_task_alloc(v12);
  v13 = (*(_QWORD *)(*(_QWORD *)(sub_100005E18(&qword_10003CF18) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[57] = swift_task_alloc(v13);
  v2[58] = swift_task_alloc(v13);
  v14 = type metadata accessor for UtilityRateInfoError(0);
  v2[59] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v2[60] = v15;
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[61] = swift_task_alloc(v16);
  v2[62] = swift_task_alloc(v16);
  v2[63] = swift_task_alloc(v16);
  v17 = type metadata accessor for UtilityRateInfoSnapshot(0);
  v2[64] = v17;
  v18 = *(_QWORD *)(v17 - 8);
  v2[65] = v18;
  v19 = (*(_QWORD *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[66] = swift_task_alloc(v19);
  v2[67] = swift_task_alloc(v19);
  v20 = type metadata accessor for Logger(0);
  v2[68] = v20;
  v21 = *(_QWORD *)(v20 - 8);
  v2[69] = v21;
  v22 = (*(_QWORD *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[70] = swift_task_alloc(v22);
  v2[71] = swift_task_alloc(v22);
  v2[72] = swift_task_alloc(v22);
  v2[73] = swift_task_alloc(v22);
  v2[74] = swift_task_alloc(v22);
  v2[75] = swift_task_alloc(v22);
  v2[76] = swift_task_alloc(v22);
  v2[77] = swift_task_alloc(v22);
  v2[78] = swift_task_alloc(v22);
  return swift_task_switch(sub_100013D2C, 0, 0);
}

uint64_t sub_100013D2C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
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
  NSObject *v26;
  os_log_type_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  _BOOL4 v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint8_t *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t (*v64)(void);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  _BOOL4 v75;
  void (*v76)(uint64_t, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  void (*v90)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
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
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t v134;
  void (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t, uint64_t);
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void (*v142)(uint64_t, uint64_t);
  void (*v143)(uint64_t, uint64_t);
  uint64_t (*v144)(void);
  uint64_t v145;
  uint64_t v146;
  uint64_t v147[2];

  v2 = v1[39];
  static Logger.utilityRateWidgets.getter(a1);
  v3 = swift_retain_n(v2, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v139 = v1[78];
    v131 = v1[69];
    v134 = v1[68];
    v6 = v1[39];
    v7 = swift_slowAlloc(22, -1);
    v8 = swift_slowAlloc(64, -1);
    v147[0] = v8;
    *(_DWORD *)v7 = 136315394;
    v1[36] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v147);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 36, v1 + 37, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2080;
    swift_retain(v6);
    v9 = sub_10002ECB0();
    v11 = v10;
    swift_release(v6);
    v1[37] = sub_10000F4DC(v9, v11, v147);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 37, v1 + 38, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v11);
    swift_release_n(v6, 2);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s resolving usageSnapshot type for configuration: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v8, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v131 + 8);
    v13 = v12(v139, v134);
  }
  else
  {
    v14 = v1[78];
    v15 = v1[69];
    v16 = v1[68];
    swift_release_n(v1[39], 2);

    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
    v13 = v12(v14, v16);
  }
  v1[79] = v12;
  v17 = IntentParameter.wrappedValue.getter(v13);
  v18 = v1[3];
  if (v18)
  {
    v142 = (void (*)(uint64_t, uint64_t))v12;
    v19 = v1[2];
    v20 = v1[4];
    v21 = v1[5];
    v22 = v1[6];
    v23 = v1[7];
    swift_bridgeObjectRetain();
    v24 = sub_10000FB1C(v19, v18, v20, v21, v22, v23);
    v1[15] = v19;
    v1[16] = v18;
    v25 = static Logger.utilityRateWidgets.getter(v24);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.error.getter();
    v28 = os_log_type_enabled(v26, v27);
    v29 = v1[75];
    v30 = v1[68];
    v132 = v1 + 30;
    if (v28)
    {
      v128 = v1[75];
      v31 = swift_slowAlloc(22, -1);
      v32 = swift_slowAlloc(64, -1);
      v147[0] = v32;
      *(_DWORD *)v31 = 136315394;
      v1[29] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v147);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 29, v1 + 30, v31 + 4, v31 + 12);
      *(_WORD *)(v31 + 12) = 2080;
      v33 = v1 + 15;
      swift_beginAccess(v1 + 15, v1 + 12, 0, 0);
      v34 = v1[16];
      v1[17] = v1[15];
      v1[18] = v34;
      swift_bridgeObjectRetain();
      v35 = sub_100005E18(&qword_10003CF38);
      v36 = String.init<A>(describing:)(v1 + 17, v35);
      v38 = v37;
      v1[32] = sub_10000F4DC(v36, v37, v147);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 32, v1 + 33, v31 + 14, v31 + 22);
      swift_bridgeObjectRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "%s SiteDetail provided with non-nil siteID: %s", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy(v32, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v31, -1, -1);

      v142(v128, v30);
    }
    else
    {

      v142(v29, v30);
      v33 = v1 + 15;
    }
    v47 = swift_beginAccess(v33, v1 + 9, 0, 0);
    v48 = v1[16];
    if (v48)
    {
      v49 = v1[15];
      v50 = type metadata accessor for UtilityRateInfoSnapshotManager(0);
      swift_allocObject(v50, *(unsigned int *)(v50 + 48), *(unsigned __int16 *)(v50 + 52));
      v51 = async function pointer to UtilityRateInfoSnapshotManager.init(siteID:)[1];
      swift_bridgeObjectRetain();
      v52 = (_QWORD *)swift_task_alloc(v51);
      v1[82] = v52;
      *v52 = v1;
      v52[1] = sub_1000153C4;
      return UtilityRateInfoSnapshotManager.init(siteID:)(v49, v48);
    }
    v54 = static Logger.utilityRateWidgets.getter(v47);
    v55 = Logger.logObject.getter(v54);
    v56 = static os_log_type_t.error.getter();
    v57 = os_log_type_enabled(v55, v56);
    v58 = (void (*)(uint64_t, uint64_t))v1[79];
    v59 = v1[71];
    v60 = v1[68];
    if (v57)
    {
      v61 = (uint8_t *)swift_slowAlloc(12, -1);
      v135 = v58;
      v62 = swift_slowAlloc(32, -1);
      v147[0] = v62;
      *(_DWORD *)v61 = 136315138;
      v1[20] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v147);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 20, v1 + 21, v61 + 4, v61 + 12);
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s: Widget configuration has no entity (no home)", v61, 0xCu);
      swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v62, -1, -1);
      swift_slowDealloc(v61, -1, -1);

      v135(v59, v60);
    }
    else
    {

      v58(v59, v60);
    }
    v66 = v1[59];
    v65 = v1[60];
    v67 = sub_10000C440(&qword_10003CF20, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoError, (uint64_t)&protocol conformance descriptor for UtilityRateInfoError);
    v68 = swift_allocError(v66, v67, 0, 0);
    v70 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v65 + 104))(v69, enum case for UtilityRateInfoError.invalidEnergySite(_:), v66);
    swift_willThrow(v70);
    v71 = swift_bridgeObjectRelease(v1[16]);
    static Logger.utilityRateWidgets.getter(v71);
    swift_errorRetain(v68);
    v72 = swift_errorRetain(v68);
    v73 = Logger.logObject.getter(v72);
    v74 = static os_log_type_t.error.getter();
    v75 = os_log_type_enabled(v73, v74);
    v76 = (void (*)(uint64_t, uint64_t))v1[79];
    v77 = v1[70];
    v78 = v1[68];
    if (v75)
    {
      v79 = swift_slowAlloc(22, -1);
      v136 = v76;
      v80 = (uint64_t *)swift_slowAlloc(8, -1);
      v129 = v78;
      v81 = swift_slowAlloc(32, -1);
      v147[0] = v81;
      *(_DWORD *)v79 = 136315394;
      *v132 = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v147);
      v82 = v1 + 31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v132, v1 + 31, v79 + 4, v79 + 12);
      *(_WORD *)(v79 + 12) = 2112;
      swift_errorRetain(v68);
      v83 = _swift_stdlib_bridgeErrorToNSError(v68);
      v1[19] = v83;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 19, v1 + 20, v79 + 14, v79 + 22);
      *v80 = v83;
      swift_errorRelease(v68);
      swift_errorRelease(v68);
      _os_log_impl((void *)&_mh_execute_header, v73, v74, "%s:ERROR: %@", (uint8_t *)v79, 0x16u);
      v84 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v80, 1, v84);
      swift_slowDealloc(v80, -1, -1);
      swift_arrayDestroy(v81, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v81, -1, -1);
      swift_slowDealloc(v79, -1, -1);

      v136(v77, v129);
    }
    else
    {
      swift_errorRelease(v68);
      swift_errorRelease(v68);

      v76(v77, v78);
      v82 = v1 + 31;
    }
    v85 = v1[59];
    v86 = v1[60];
    v87 = v1[57];
    v1[31] = v68;
    swift_errorRetain(v68);
    v88 = sub_100005E18(&qword_10003CF28);
    v89 = swift_dynamicCast(v87, v82, v88, v85, 6);
    v90 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v86 + 56);
    v92 = v1[60];
    v91 = v1[61];
    v93 = v1[59];
    v94 = v1[57];
    if (v89)
    {
      v90(v1[57], 0, 1, v1[59]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 32))(v91, v94, v93);
    }
    else
    {
      v90(v1[57], 1, 1, v1[59]);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v92 + 104))(v91, enum case for UtilityRateInfoError.otherError(_:), v93);
      sub_10000C404(v94, &qword_10003CF18);
    }
    v95 = v1[61];
    v140 = v1[60];
    v145 = v1[59];
    v96 = v1[45];
    v97 = v1[46];
    v98 = v1[43];
    v99 = v1[41];
    v100 = v1[42];
    v101 = v1[40];
    v137 = v1[44];
    sub_100016408(v97, v98, v95);
    v102 = sub_100005E18(&qword_10003CF00);
    v103 = *(unsigned __int8 *)(v96 + 80);
    v104 = (v103 + 32) & ~v103;
    v105 = swift_allocObject(v102, v104 + *(_QWORD *)(v96 + 72), v103 | 7);
    *(_OWORD *)(v105 + 16) = xmmword_1000310E0;
    sub_100018748(v97, v105 + v104);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v99 + 16))(v100, v98, v101);
    v106 = sub_10000C440(&qword_10003CEC8, type metadata accessor for UtilityRateInfoEntry, (uint64_t)&unk_100031150);
    Timeline.init(entries:policy:)(v105, v100, v137, v106);
    swift_errorRelease(v68);
    (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v98, v101);
    sub_10001878C(v97);
    (*(void (**)(uint64_t, uint64_t))(v140 + 8))(v95, v145);
    v107 = v1[77];
    v108 = v1[76];
    v109 = v1[75];
    v110 = v1[74];
    v111 = v1[73];
    v112 = v1[72];
    v113 = v1[71];
    v114 = v1[70];
    v115 = v1[67];
    v116 = v1[66];
    v117 = v1[63];
    v118 = v1[62];
    v119 = v1[61];
    v120 = v1[58];
    v121 = v1[57];
    v122 = v1[56];
    v123 = v1[55];
    v124 = v1[54];
    v125 = v1[53];
    v126 = v1[52];
    v127 = v1[49];
    v130 = v1[48];
    v133 = v1[47];
    v138 = v1[46];
    v141 = v1[43];
    v146 = v1[42];
    swift_task_dealloc(v1[78]);
    swift_task_dealloc(v107);
    swift_task_dealloc(v108);
    swift_task_dealloc(v109);
    swift_task_dealloc(v110);
    swift_task_dealloc(v111);
    swift_task_dealloc(v112);
    swift_task_dealloc(v113);
    swift_task_dealloc(v114);
    swift_task_dealloc(v115);
    swift_task_dealloc(v116);
    swift_task_dealloc(v117);
    swift_task_dealloc(v118);
    swift_task_dealloc(v119);
    swift_task_dealloc(v120);
    swift_task_dealloc(v121);
    swift_task_dealloc(v122);
    swift_task_dealloc(v123);
    swift_task_dealloc(v124);
    swift_task_dealloc(v125);
    swift_task_dealloc(v126);
    swift_task_dealloc(v127);
    swift_task_dealloc(v130);
    swift_task_dealloc(v133);
    swift_task_dealloc(v138);
    swift_task_dealloc(v141);
    swift_task_dealloc(v146);
    v64 = (uint64_t (*)(void))v1[1];
  }
  else
  {
    v1[15] = 0;
    v1[16] = 0;
    v39 = static Logger.utilityRateWidgets.getter(v17);
    v40 = Logger.logObject.getter(v39);
    v41 = static os_log_type_t.default.getter();
    v42 = os_log_type_enabled(v40, v41);
    v43 = v1[77];
    v44 = v1[68];
    if (v42)
    {
      v143 = (void (*)(uint64_t, uint64_t))v12;
      v45 = (uint8_t *)swift_slowAlloc(12, -1);
      v46 = swift_slowAlloc(32, -1);
      v147[0] = v46;
      *(_DWORD *)v45 = 136315138;
      v1[35] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v147);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 35, v1 + 36, v45 + 4, v45 + 12);
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "%s No SiteDetail provided. ***Attempting Fallback to first onboarded home***", v45, 0xCu);
      swift_arrayDestroy(v46, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v46, -1, -1);
      swift_slowDealloc(v45, -1, -1);

      v143(v43, v44);
    }
    else
    {

      v12(v43, v44);
    }
    v144 = (uint64_t (*)(void))((char *)&dword_10003CF40 + dword_10003CF40);
    v63 = (_QWORD *)swift_task_alloc(unk_10003CF44);
    v1[80] = v63;
    *v63 = v1;
    v63[1] = sub_100014A10;
    v64 = v144;
  }
  return v64();
}

uint64_t sub_100014A10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 640);
  *(_QWORD *)(*(_QWORD *)v1 + 648) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100014A6C, 0, 0);
}

uint64_t sub_100014A6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
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
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  void (*v60)(_QWORD, uint64_t, uint64_t, _QWORD);
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
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(uint64_t, uint64_t);
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(uint64_t, uint64_t);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111[2];

  v2 = v1 + 72;
  static Logger.utilityRateWidgets.getter(a1);
  v3 = swift_bridgeObjectRetain();
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v1 + 648);
    v106 = *(void (**)(uint64_t, uint64_t))(v1 + 632);
    v100 = *(_QWORD *)(v1 + 544);
    v103 = *(_QWORD *)(v1 + 608);
    v7 = swift_slowAlloc(22, -1);
    v8 = swift_slowAlloc(32, -1);
    v111[0] = v8;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v1 + 264) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v111);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 264, v1 + 272, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2048;
    *(_QWORD *)(v1 + 272) = *(_QWORD *)(v6 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 272, v1 + 280, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v6);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s (%ld homes available.", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    v9 = v7;
    v2 = v1 + 72;
    swift_slowDealloc(v9, -1, -1);

    v106(v103, v100);
  }
  else
  {
    v10 = *(void (**)(uint64_t, uint64_t))(v1 + 632);
    v11 = *(_QWORD *)(v1 + 608);
    v12 = *(_QWORD *)(v1 + 544);
    swift_bridgeObjectRelease(*(_QWORD *)(v1 + 648));

    v10(v11, v12);
  }
  v13 = *(_QWORD *)(v1 + 648);
  v14 = sub_100028178(v13);
  v16 = v15;
  v18 = v17;
  swift_bridgeObjectRelease(v13);
  if (v16)
    swift_bridgeObjectRelease(v18);
  else
    v14 = 0;
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 128));
  *(_QWORD *)(v1 + 120) = v14;
  *(_QWORD *)(v1 + 128) = v16;
  v19 = swift_beginAccess(v1 + 120, v2, 0, 0);
  v20 = *(_QWORD *)(v1 + 128);
  if (v20)
  {
    v21 = *(_QWORD *)(v1 + 120);
    v22 = type metadata accessor for UtilityRateInfoSnapshotManager(0);
    swift_allocObject(v22, *(unsigned int *)(v22 + 48), *(unsigned __int16 *)(v22 + 52));
    v23 = async function pointer to UtilityRateInfoSnapshotManager.init(siteID:)[1];
    swift_bridgeObjectRetain();
    v24 = (_QWORD *)swift_task_alloc(v23);
    *(_QWORD *)(v1 + 656) = v24;
    *v24 = v1;
    v24[1] = sub_1000153C4;
    return UtilityRateInfoSnapshotManager.init(siteID:)(v21, v20);
  }
  else
  {
    v26 = static Logger.utilityRateWidgets.getter(v19);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.error.getter();
    v29 = os_log_type_enabled(v27, v28);
    v30 = *(void (**)(uint64_t, uint64_t))(v1 + 632);
    v31 = *(_QWORD *)(v1 + 568);
    v32 = *(_QWORD *)(v1 + 544);
    if (v29)
    {
      v33 = (uint8_t *)swift_slowAlloc(12, -1);
      v34 = swift_slowAlloc(32, -1);
      v111[0] = v34;
      *(_DWORD *)v33 = 136315138;
      *(_QWORD *)(v1 + 160) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v111);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 160, v1 + 168, v33 + 4, v33 + 12);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "%s: Widget configuration has no entity (no home)", v33, 0xCu);
      swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1, -1);
      swift_slowDealloc(v33, -1, -1);
    }

    v30(v31, v32);
    v36 = *(_QWORD *)(v1 + 472);
    v35 = *(_QWORD *)(v1 + 480);
    v37 = sub_10000C440(&qword_10003CF20, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoError, (uint64_t)&protocol conformance descriptor for UtilityRateInfoError);
    v38 = swift_allocError(v36, v37, 0, 0);
    v40 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v35 + 104))(v39, enum case for UtilityRateInfoError.invalidEnergySite(_:), v36);
    swift_willThrow(v40);
    v41 = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 128));
    static Logger.utilityRateWidgets.getter(v41);
    swift_errorRetain(v38);
    v42 = swift_errorRetain(v38);
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.error.getter();
    v45 = os_log_type_enabled(v43, v44);
    v46 = *(void (**)(uint64_t, uint64_t))(v1 + 632);
    v47 = *(_QWORD *)(v1 + 560);
    v48 = *(_QWORD *)(v1 + 544);
    if (v45)
    {
      v49 = swift_slowAlloc(22, -1);
      v101 = v46;
      v50 = (uint64_t *)swift_slowAlloc(8, -1);
      v51 = swift_slowAlloc(32, -1);
      v111[0] = v51;
      *(_DWORD *)v49 = 136315394;
      *(_QWORD *)(v1 + 240) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v111);
      v98 = v48;
      v52 = v1 + 248;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 240, v1 + 248, v49 + 4, v49 + 12);
      *(_WORD *)(v49 + 12) = 2112;
      swift_errorRetain(v38);
      v53 = _swift_stdlib_bridgeErrorToNSError(v38);
      *(_QWORD *)(v1 + 152) = v53;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 152, v1 + 160, v49 + 14, v49 + 22);
      *v50 = v53;
      swift_errorRelease(v38);
      swift_errorRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "%s:ERROR: %@", (uint8_t *)v49, 0x16u);
      v54 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v50, 1, v54);
      swift_slowDealloc(v50, -1, -1);
      swift_arrayDestroy(v51, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1, -1);
      swift_slowDealloc(v49, -1, -1);

      v101(v47, v98);
    }
    else
    {
      swift_errorRelease(v38);
      swift_errorRelease(v38);

      v46(v47, v48);
      v52 = v1 + 248;
    }
    v55 = *(_QWORD *)(v1 + 472);
    v56 = *(_QWORD *)(v1 + 480);
    v57 = *(_QWORD *)(v1 + 456);
    *(_QWORD *)(v1 + 248) = v38;
    swift_errorRetain(v38);
    v58 = sub_100005E18(&qword_10003CF28);
    v59 = swift_dynamicCast(v57, v52, v58, v55, 6);
    v60 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v56 + 56);
    v62 = *(_QWORD *)(v1 + 480);
    v61 = *(_QWORD *)(v1 + 488);
    v63 = *(_QWORD *)(v1 + 472);
    v64 = *(_QWORD *)(v1 + 456);
    if (v59)
    {
      v60(*(_QWORD *)(v1 + 456), 0, 1, *(_QWORD *)(v1 + 472));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 32))(v61, v64, v63);
    }
    else
    {
      v60(*(_QWORD *)(v1 + 456), 1, 1, *(_QWORD *)(v1 + 472));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v62 + 104))(v61, enum case for UtilityRateInfoError.otherError(_:), v63);
      sub_10000C404(v64, &qword_10003CF18);
    }
    v65 = *(_QWORD *)(v1 + 488);
    v107 = *(_QWORD *)(v1 + 480);
    v109 = *(_QWORD *)(v1 + 472);
    v66 = *(_QWORD *)(v1 + 360);
    v67 = *(_QWORD *)(v1 + 368);
    v68 = *(_QWORD *)(v1 + 344);
    v69 = *(_QWORD *)(v1 + 328);
    v70 = *(_QWORD *)(v1 + 336);
    v71 = *(_QWORD *)(v1 + 320);
    v104 = *(_QWORD *)(v1 + 352);
    sub_100016408(v67, v68, v65);
    v72 = sub_100005E18(&qword_10003CF00);
    v73 = *(unsigned __int8 *)(v66 + 80);
    v74 = (v73 + 32) & ~v73;
    v75 = swift_allocObject(v72, v74 + *(_QWORD *)(v66 + 72), v73 | 7);
    *(_OWORD *)(v75 + 16) = xmmword_1000310E0;
    sub_100018748(v67, v75 + v74);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 16))(v70, v68, v71);
    v76 = sub_10000C440(&qword_10003CEC8, type metadata accessor for UtilityRateInfoEntry, (uint64_t)&unk_100031150);
    Timeline.init(entries:policy:)(v75, v70, v104, v76);
    swift_errorRelease(v38);
    (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v71);
    sub_10001878C(v67);
    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v65, v109);
    v77 = *(_QWORD *)(v1 + 616);
    v78 = *(_QWORD *)(v1 + 608);
    v79 = *(_QWORD *)(v1 + 600);
    v80 = *(_QWORD *)(v1 + 592);
    v81 = *(_QWORD *)(v1 + 584);
    v82 = *(_QWORD *)(v1 + 576);
    v83 = *(_QWORD *)(v1 + 568);
    v84 = *(_QWORD *)(v1 + 560);
    v85 = *(_QWORD *)(v1 + 536);
    v86 = *(_QWORD *)(v1 + 528);
    v87 = *(_QWORD *)(v1 + 504);
    v88 = *(_QWORD *)(v1 + 496);
    v89 = *(_QWORD *)(v1 + 488);
    v90 = *(_QWORD *)(v1 + 464);
    v91 = *(_QWORD *)(v1 + 456);
    v92 = *(_QWORD *)(v1 + 448);
    v93 = *(_QWORD *)(v1 + 440);
    v94 = *(_QWORD *)(v1 + 432);
    v95 = *(_QWORD *)(v1 + 424);
    v96 = *(_QWORD *)(v1 + 416);
    v97 = *(_QWORD *)(v1 + 392);
    v99 = *(_QWORD *)(v1 + 384);
    v102 = *(_QWORD *)(v1 + 376);
    v105 = *(_QWORD *)(v1 + 368);
    v108 = *(_QWORD *)(v1 + 344);
    v110 = *(_QWORD *)(v1 + 336);
    swift_task_dealloc(*(_QWORD *)(v1 + 624));
    swift_task_dealloc(v77);
    swift_task_dealloc(v78);
    swift_task_dealloc(v79);
    swift_task_dealloc(v80);
    swift_task_dealloc(v81);
    swift_task_dealloc(v82);
    swift_task_dealloc(v83);
    swift_task_dealloc(v84);
    swift_task_dealloc(v85);
    swift_task_dealloc(v86);
    swift_task_dealloc(v87);
    swift_task_dealloc(v88);
    swift_task_dealloc(v89);
    swift_task_dealloc(v90);
    swift_task_dealloc(v91);
    swift_task_dealloc(v92);
    swift_task_dealloc(v93);
    swift_task_dealloc(v94);
    swift_task_dealloc(v95);
    swift_task_dealloc(v96);
    swift_task_dealloc(v97);
    swift_task_dealloc(v99);
    swift_task_dealloc(v102);
    swift_task_dealloc(v105);
    swift_task_dealloc(v108);
    swift_task_dealloc(v110);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000153C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 656);
  *(_QWORD *)(*(_QWORD *)v1 + 664) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100015420, 0, 0);
}

uint64_t sub_100015420()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 672) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100015488, v2, v3);
}

uint64_t sub_100015488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 664);
  v2 = swift_release(*(_QWORD *)(v0 + 672));
  dispatch thunk of UtilityRateInfoSnapshotManager.infoSnapshot.getter(v2);
  swift_release(v1);
  return swift_task_switch(sub_1000154DC, 0, 0);
}

uint64_t sub_1000154DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
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
  int v30;
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
  uint64_t (*v43)(uint64_t, uint64_t, uint64_t);
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t);
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
  NSObject *v70;
  os_log_type_t v71;
  _BOOL4 v72;
  void (*v73)(uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  Swift::String v84;
  os_log_type_t v85;
  void (*v86)(uint64_t, uint64_t);
  Swift::String v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  os_log_type_t v99;
  BOOL v100;
  void (*v101)(uint64_t, uint64_t);
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  void (*v127)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  os_log_t log;
  os_log_t loga;
  os_log_t logb;
  os_log_t logc;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void (*v178)(uint64_t, uint64_t, uint64_t);
  void (*v179)(uint64_t, uint64_t, uint64_t);
  uint64_t v180;
  uint64_t (*v181)(uint64_t, uint64_t);
  void (*v182)(uint64_t, uint64_t);
  uint64_t v183;
  void (*v184)(uint64_t, uint64_t);
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t (*v188)(uint64_t, uint64_t, uint64_t);
  void (*v189)(uint64_t, uint64_t);
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void (*v194)(uint64_t, uint64_t);
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void (*v199)(uint64_t, uint64_t);
  uint64_t v200;
  uint64_t v201;
  uint64_t v202[2];

  v193 = v1 + 200;
  v2 = *(_QWORD *)(v1 + 536);
  v3 = *(_QWORD *)(v1 + 528);
  v4 = *(_QWORD *)(v1 + 520);
  v5 = *(_QWORD *)(v1 + 512);
  static Logger.utilityRateWidgets.getter(a1);
  v188 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v6 = v188(v3, v2, v5);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v177 = *(_QWORD *)(v1 + 592);
    v181 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 632);
    v173 = *(_QWORD *)(v1 + 544);
    v9 = *(_QWORD *)(v1 + 528);
    v198 = *(_QWORD *)(v1 + 520);
    v10 = *(_QWORD *)(v1 + 512);
    v11 = swift_slowAlloc(22, -1);
    log = (os_log_t)swift_slowAlloc(64, -1);
    v202[0] = (uint64_t)log;
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v1 + 216) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v202);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 216, v1 + 224, v11 + 4, v11 + 12);
    *(_WORD *)(v11 + 12) = 2080;
    v12 = sub_10000C440(&qword_10003CDF8, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoSnapshot, (uint64_t)&protocol conformance descriptor for UtilityRateInfoSnapshot);
    v13 = dispatch thunk of CustomStringConvertible.description.getter(v10, v12);
    v15 = v14;
    *(_QWORD *)(v1 + 224) = sub_10000F4DC(v13, v14, v202);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 224, v1 + 232, v11 + 14, v11 + 22);
    swift_bridgeObjectRelease(v15);
    v199 = *(void (**)(uint64_t, uint64_t))(v198 + 8);
    v199(v9, v10);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s: Retrieved week snapshot for widget %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy(log, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(log, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    v16 = v181(v177, v173);
  }
  else
  {
    v17 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 632);
    v18 = *(_QWORD *)(v1 + 592);
    v19 = *(_QWORD *)(v1 + 544);
    v199 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 520) + 8);
    v199(*(_QWORD *)(v1 + 528), *(_QWORD *)(v1 + 512));

    v16 = v17(v18, v19);
  }
  v20 = *(_QWORD *)(v1 + 472);
  v21 = *(_QWORD *)(v1 + 480);
  v22 = *(_QWORD *)(v1 + 464);
  UtilityRateInfoSnapshot.error.getter(v16);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v22, 1, v20) == 1)
  {
    v23 = *(_QWORD *)(v1 + 448);
    v24 = *(_QWORD *)(v1 + 432);
    v25 = *(_QWORD *)(v1 + 400);
    v26 = *(_QWORD *)(v1 + 408);
    v27 = *(_QWORD *)(v1 + 392);
    v28 = sub_10000C404(*(_QWORD *)(v1 + 464), &qword_10003CF18);
    v29 = static Date.now.getter(v28);
    UtilityRateInfoSnapshot.peakUntil.getter(v29);
    v178 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
    v178(v24, v23, v25);
    v30 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v27, 1, v25);
    v32 = *(_QWORD *)(v1 + 432);
    v31 = *(_QWORD *)(v1 + 440);
    v33 = *(_QWORD *)(v1 + 400);
    v34 = *(_QWORD *)(v1 + 408);
    v35 = *(_QWORD *)(v1 + 392);
    if (v30 == 1)
    {
      v36 = static EKDateUtilities.oneHour.getter();
      Date.addingTimeInterval(_:)(v36);
      v182 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      v182(v32, v33);
      sub_10000C404(v35, &qword_10003CF10);
    }
    else
    {
      v182 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      v182(*(_QWORD *)(v1 + 432), *(_QWORD *)(v1 + 400));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v31, v35, v33);
    }
    v61 = *(_QWORD *)(v1 + 536);
    v62 = *(_QWORD *)(v1 + 512);
    v63 = *(_QWORD *)(v1 + 448);
    logb = *(os_log_t *)(v1 + 416);
    v174 = *(_QWORD *)(v1 + 440);
    v64 = *(_QWORD *)(v1 + 400);
    v65 = *(_QWORD *)(v1 + 384);
    v162 = *(_QWORD *)(v1 + 376);
    v166 = *(_QWORD *)(v1 + 424);
    v66 = *(_QWORD *)(v1 + 352);
    v67 = *(_QWORD *)(v1 + 312);
    v178(v65, v63, v64);
    v188(v65 + *(int *)(v66 + 20), v61, v62);
    *(_QWORD *)(v65 + *(int *)(v66 + 24)) = v67;
    v68 = swift_retain(v67);
    static Logger.utilityRateWidgets.getter(v68);
    sub_100018748(v65, v162);
    v178(v166, v63, v64);
    v69 = ((uint64_t (*)(os_log_t, uint64_t, uint64_t))v178)(logb, v174, v64);
    v70 = Logger.logObject.getter(v69);
    v71 = static os_log_type_t.default.getter();
    v72 = os_log_type_enabled(v70, v71);
    v73 = *(void (**)(uint64_t, uint64_t))(v1 + 632);
    v74 = *(_QWORD *)(v1 + 576);
    v75 = *(_QWORD *)(v1 + 544);
    v77 = *(_QWORD *)(v1 + 416);
    v76 = *(_QWORD *)(v1 + 424);
    v78 = *(_QWORD *)(v1 + 400);
    v79 = *(_QWORD *)(v1 + 376);
    if (v72)
    {
      v189 = *(void (**)(uint64_t, uint64_t))(v1 + 632);
      v163 = *(_QWORD *)(v1 + 416);
      v80 = swift_slowAlloc(42, -1);
      v167 = swift_slowAlloc(128, -1);
      v202[0] = v167;
      *(_DWORD *)v80 = 136315906;
      v175 = v75;
      *(_QWORD *)(v1 + 168) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v202);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 168, v1 + 176, v80 + 4, v80 + 12);
      *(_WORD *)(v80 + 12) = 2080;
      v81 = sub_100016BC4();
      v83 = v82;
      *(_QWORD *)(v1 + 176) = sub_10000F4DC(v81, v82, v202);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 176, v1 + 184, v80 + 14, v80 + 22);
      swift_bridgeObjectRelease(v83);
      sub_10001878C(v79);
      *(_WORD *)(v80 + 22) = 2080;
      v84 = Date.formatted()();
      *(_QWORD *)(v1 + 184) = sub_10000F4DC(v84._countAndFlagsBits, (unint64_t)v84._object, v202);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 184, v1 + 192, v80 + 24, v80 + 32);
      swift_bridgeObjectRelease(v84._object);
      v85 = v71;
      v86 = v182;
      v182(v76, v78);
      *(_WORD *)(v80 + 32) = 2080;
      v87 = Date.formatted()();
      *(_QWORD *)(v1 + 192) = sub_10000F4DC(v87._countAndFlagsBits, (unint64_t)v87._object, v202);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 192, v193, v80 + 34, v80 + 42);
      swift_bridgeObjectRelease(v87._object);
      v182(v163, v78);
      _os_log_impl((void *)&_mh_execute_header, v70, v85, "%s Entry:%s created for %s, until %s", (uint8_t *)v80, 0x2Au);
      swift_arrayDestroy(v167, 4, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v167, -1, -1);
      swift_slowDealloc(v80, -1, -1);

      v189(v74, v175);
    }
    else
    {
      sub_10001878C(*(_QWORD *)(v1 + 376));
      v86 = v182;
      v182(v76, v78);
      v182(v77, v78);

      v73(v74, v75);
    }
    v195 = *(_QWORD *)(v1 + 536);
    v111 = *(_QWORD *)(v1 + 440);
    v185 = *(_QWORD *)(v1 + 448);
    v190 = *(_QWORD *)(v1 + 512);
    v112 = *(_QWORD *)(v1 + 400);
    v113 = *(_QWORD *)(v1 + 384);
    v115 = *(_QWORD *)(v1 + 352);
    v114 = *(_QWORD *)(v1 + 360);
    v116 = *(_QWORD *)(v1 + 344);
    v117 = sub_100005E18(&qword_10003CF00);
    v118 = *(unsigned __int8 *)(v114 + 80);
    v119 = (v118 + 32) & ~v118;
    v120 = swift_allocObject(v117, v119 + *(_QWORD *)(v114 + 72), v118 | 7);
    *(_OWORD *)(v120 + 16) = xmmword_1000310E0;
    sub_100018748(v113, v120 + v119);
    static TimelineReloadPolicy.after(_:)(v111);
    v121 = sub_10000C440(&qword_10003CEC8, type metadata accessor for UtilityRateInfoEntry, (uint64_t)&unk_100031150);
    Timeline.init(entries:policy:)(v120, v116, v115, v121);
    sub_10001878C(v113);
    v86(v111, v112);
    v86(v185, v112);
    v199(v195, v190);
    swift_bridgeObjectRelease(*(_QWORD *)(v1 + 128));
  }
  else
  {
    v38 = *(_QWORD *)(v1 + 496);
    v37 = *(_QWORD *)(v1 + 504);
    v39 = *(_QWORD *)(v1 + 472);
    v40 = *(_QWORD *)(v1 + 480);
    v41 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v40 + 32))(v37, *(_QWORD *)(v1 + 464), v39);
    static Logger.utilityRateWidgets.getter(v41);
    v42 = v37;
    v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 16);
    v44 = v43(v38, v42, v39);
    v45 = Logger.logObject.getter(v44);
    v46 = static os_log_type_t.default.getter();
    v47 = os_log_type_enabled(v45, v46);
    v48 = *(void (**)(uint64_t, uint64_t))(v1 + 632);
    v49 = *(_QWORD *)(v1 + 584);
    v183 = *(_QWORD *)(v1 + 544);
    v50 = *(_QWORD *)(v1 + 496);
    v51 = *(_QWORD *)(v1 + 472);
    v52 = *(_QWORD *)(v1 + 480);
    if (v47)
    {
      v179 = (void (*)(uint64_t, uint64_t, uint64_t))v43;
      v53 = swift_slowAlloc(22, -1);
      v165 = (uint64_t *)swift_slowAlloc(8, -1);
      loga = (os_log_t)swift_slowAlloc(32, -1);
      v202[0] = (uint64_t)loga;
      *(_DWORD *)v53 = 136315394;
      *(_QWORD *)(v1 + 200) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v202);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v193, v1 + 208, v53 + 4, v53 + 12);
      *(_WORD *)(v53 + 12) = 2112;
      v54 = sub_10000C440(&qword_10003CF20, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoError, (uint64_t)&protocol conformance descriptor for UtilityRateInfoError);
      v194 = v48;
      v55 = swift_allocError(v51, v54, 0, 0);
      v179(v56, v50, v51);
      v57 = _swift_stdlib_bridgeErrorToNSError(v55);
      *(_QWORD *)(v1 + 208) = v57;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 208, v1 + 216, v53 + 14, v53 + 22);
      *v165 = v57;
      v58 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
      v58(v50, v51);
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "%s retrieved snapshot with error: %@, giving up.", (uint8_t *)v53, 0x16u);
      v59 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v165, 1, v59);
      swift_slowDealloc(v165, -1, -1);
      swift_arrayDestroy(loga, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(loga, -1, -1);
      v60 = v53;
      v43 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v179;
      swift_slowDealloc(v60, -1, -1);

      v194(v49, v183);
    }
    else
    {
      v58 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
      v58(*(_QWORD *)(v1 + 496), *(_QWORD *)(v1 + 472));

      v48(v49, v183);
    }
    v88 = *(_QWORD *)(v1 + 536);
    v90 = *(_QWORD *)(v1 + 504);
    v89 = *(_QWORD *)(v1 + 512);
    v91 = *(_QWORD *)(v1 + 472);
    v92 = sub_10000C440(&qword_10003CF20, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoError, (uint64_t)&protocol conformance descriptor for UtilityRateInfoError);
    v93 = swift_allocError(v91, v92, 0, 0);
    v95 = v43(v94, v90, v91);
    swift_willThrow(v95);
    v58(v90, v91);
    v199(v88, v89);
    v96 = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 128));
    static Logger.utilityRateWidgets.getter(v96);
    swift_errorRetain(v93);
    v97 = swift_errorRetain(v93);
    v98 = Logger.logObject.getter(v97);
    v99 = static os_log_type_t.error.getter();
    v100 = os_log_type_enabled(v98, v99);
    v101 = *(void (**)(uint64_t, uint64_t))(v1 + 632);
    v102 = *(_QWORD *)(v1 + 560);
    v103 = *(_QWORD *)(v1 + 544);
    v200 = v93;
    if (v100)
    {
      v104 = swift_slowAlloc(22, -1);
      v105 = (uint64_t *)swift_slowAlloc(8, -1);
      v106 = swift_slowAlloc(32, -1);
      v202[0] = v106;
      *(_DWORD *)v104 = 136315394;
      *(_QWORD *)(v1 + 240) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v202);
      v184 = v101;
      v107 = v1 + 248;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 240, v1 + 248, v104 + 4, v104 + 12);
      *(_WORD *)(v104 + 12) = 2112;
      swift_errorRetain(v200);
      v108 = _swift_stdlib_bridgeErrorToNSError(v200);
      *(_QWORD *)(v1 + 152) = v108;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 152, v1 + 160, v104 + 14, v104 + 22);
      *v105 = v108;
      swift_errorRelease(v200);
      swift_errorRelease(v200);
      _os_log_impl((void *)&_mh_execute_header, v98, v99, "%s:ERROR: %@", (uint8_t *)v104, 0x16u);
      v109 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v105, 1, v109);
      v110 = v105;
      v93 = v200;
      swift_slowDealloc(v110, -1, -1);
      swift_arrayDestroy(v106, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v106, -1, -1);
      swift_slowDealloc(v104, -1, -1);

      v184(v102, v103);
    }
    else
    {
      swift_errorRelease(v93);
      swift_errorRelease(v93);

      v101(v102, v103);
      v107 = v1 + 248;
    }
    v122 = *(_QWORD *)(v1 + 472);
    v123 = *(_QWORD *)(v1 + 480);
    v124 = *(_QWORD *)(v1 + 456);
    *(_QWORD *)(v1 + 248) = v93;
    swift_errorRetain(v93);
    v125 = sub_100005E18(&qword_10003CF28);
    v126 = swift_dynamicCast(v124, v107, v125, v122, 6);
    v127 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v123 + 56);
    v129 = *(_QWORD *)(v1 + 480);
    v128 = *(_QWORD *)(v1 + 488);
    v130 = *(_QWORD *)(v1 + 472);
    v131 = *(_QWORD *)(v1 + 456);
    if (v126)
    {
      v127(*(_QWORD *)(v1 + 456), 0, 1, *(_QWORD *)(v1 + 472));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v129 + 32))(v128, v131, v130);
    }
    else
    {
      v127(*(_QWORD *)(v1 + 456), 1, 1, *(_QWORD *)(v1 + 472));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v129 + 104))(v128, enum case for UtilityRateInfoError.otherError(_:), v130);
      sub_10000C404(v131, &qword_10003CF18);
    }
    v132 = *(_QWORD *)(v1 + 488);
    v191 = *(_QWORD *)(v1 + 480);
    v196 = *(_QWORD *)(v1 + 472);
    v133 = *(_QWORD *)(v1 + 360);
    v134 = *(_QWORD *)(v1 + 368);
    v135 = *(_QWORD *)(v1 + 344);
    v186 = *(_QWORD *)(v1 + 352);
    v136 = *(_QWORD *)(v1 + 328);
    v137 = *(_QWORD *)(v1 + 336);
    v138 = *(_QWORD *)(v1 + 320);
    sub_100016408(v134, v135, v132);
    v139 = sub_100005E18(&qword_10003CF00);
    v140 = *(unsigned __int8 *)(v133 + 80);
    v141 = (v140 + 32) & ~v140;
    v142 = swift_allocObject(v139, v141 + *(_QWORD *)(v133 + 72), v140 | 7);
    *(_OWORD *)(v142 + 16) = xmmword_1000310E0;
    sub_100018748(v134, v142 + v141);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v136 + 16))(v137, v135, v138);
    v143 = sub_10000C440(&qword_10003CEC8, type metadata accessor for UtilityRateInfoEntry, (uint64_t)&unk_100031150);
    Timeline.init(entries:policy:)(v142, v137, v186, v143);
    swift_errorRelease(v200);
    (*(void (**)(uint64_t, uint64_t))(v136 + 8))(v135, v138);
    sub_10001878C(v134);
    (*(void (**)(uint64_t, uint64_t))(v191 + 8))(v132, v196);
  }
  v144 = *(_QWORD *)(v1 + 616);
  v145 = *(_QWORD *)(v1 + 608);
  v146 = *(_QWORD *)(v1 + 600);
  v147 = *(_QWORD *)(v1 + 592);
  v148 = *(_QWORD *)(v1 + 584);
  v149 = *(_QWORD *)(v1 + 576);
  v150 = *(_QWORD *)(v1 + 568);
  v151 = *(_QWORD *)(v1 + 560);
  v152 = *(_QWORD *)(v1 + 536);
  v154 = *(_QWORD *)(v1 + 528);
  v155 = *(_QWORD *)(v1 + 504);
  v156 = *(_QWORD *)(v1 + 496);
  v157 = *(_QWORD *)(v1 + 488);
  v158 = *(_QWORD *)(v1 + 464);
  v159 = *(_QWORD *)(v1 + 456);
  v160 = *(_QWORD *)(v1 + 448);
  v161 = *(_QWORD *)(v1 + 440);
  v164 = *(_QWORD *)(v1 + 432);
  v168 = *(_QWORD *)(v1 + 424);
  logc = *(os_log_t *)(v1 + 416);
  v176 = *(_QWORD *)(v1 + 392);
  v180 = *(_QWORD *)(v1 + 384);
  v187 = *(_QWORD *)(v1 + 376);
  v192 = *(_QWORD *)(v1 + 368);
  v197 = *(_QWORD *)(v1 + 344);
  v201 = *(_QWORD *)(v1 + 336);
  swift_task_dealloc(*(_QWORD *)(v1 + 624));
  swift_task_dealloc(v144);
  swift_task_dealloc(v145);
  swift_task_dealloc(v146);
  swift_task_dealloc(v147);
  swift_task_dealloc(v148);
  swift_task_dealloc(v149);
  swift_task_dealloc(v150);
  swift_task_dealloc(v151);
  swift_task_dealloc(v152);
  swift_task_dealloc(v154);
  swift_task_dealloc(v155);
  swift_task_dealloc(v156);
  swift_task_dealloc(v157);
  swift_task_dealloc(v158);
  swift_task_dealloc(v159);
  swift_task_dealloc(v160);
  swift_task_dealloc(v161);
  swift_task_dealloc(v164);
  swift_task_dealloc(v168);
  swift_task_dealloc(logc);
  swift_task_dealloc(v176);
  swift_task_dealloc(v180);
  swift_task_dealloc(v187);
  swift_task_dealloc(v192);
  swift_task_dealloc(v197);
  swift_task_dealloc(v201);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100016408(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(char *, uint64_t);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, char *, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t result;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  NSObject *v74;
  uint64_t v75;
  char *v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90[2];

  v84 = a2;
  v88 = a1;
  v4 = type metadata accessor for Date(0);
  v86 = *(_QWORD *)(v4 - 8);
  v87 = v4;
  __chkstk_darwin(v4);
  v85 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TimelineReloadPolicy(0);
  v79 = *(_QWORD *)(v6 - 8);
  v80 = v6;
  v7 = __chkstk_darwin(v6);
  v78 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v76 = (char *)&v70 - v9;
  v10 = type metadata accessor for UtilityRateInfoSnapshot(0);
  v82 = *(_QWORD *)(v10 - 8);
  v83 = v10;
  v11 = __chkstk_darwin(v10);
  v81 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v77 = (char *)&v70 - v13;
  v14 = type metadata accessor for UtilityRateInfoError(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for Logger(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = __chkstk_darwin(v18);
  v22 = (char *)&v70 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __chkstk_darwin(v20);
  v25 = (char *)&v70 - v24;
  static Logger.utilityRateWidgets.getter(v23);
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v27 = v26(v17, a3, v14);
  v28 = Logger.logObject.getter(v27);
  v29 = static os_log_type_t.error.getter();
  v74 = v28;
  v30 = os_log_type_enabled(v28, v29);
  v75 = v18;
  if (v30)
  {
    v31 = swift_slowAlloc(22, -1);
    v72 = v19;
    v32 = v31;
    v70 = (uint64_t *)swift_slowAlloc(8, -1);
    v71 = swift_slowAlloc(32, -1);
    v90[0] = v71;
    *(_DWORD *)v32 = 136315394;
    v89 = sub_10000F4DC(0xD000000000000019, 0x8000000100032550, v90);
    v73 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, v90, v32 + 4, v32 + 12);
    *(_WORD *)(v32 + 12) = 2112;
    v33 = sub_10000C440(&qword_10003CF20, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoError, (uint64_t)&protocol conformance descriptor for UtilityRateInfoError);
    v34 = swift_allocError(v14, v33, 0, 0);
    v26(v35, (uint64_t)v17, v14);
    v36 = _swift_stdlib_bridgeErrorToNSError(v34);
    v89 = v36;
    v22 = v73;
    v18 = v75;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, v90, v32 + 14, v32 + 22);
    v37 = v70;
    *v70 = v36;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    v38 = v74;
    _os_log_impl((void *)&_mh_execute_header, v74, v29, "%s: Erroring out widget due to snapshot error: %@", (uint8_t *)v32, 0x16u);
    v39 = sub_100005E18(&qword_10003CF30);
    swift_arrayDestroy(v37, 1, v39);
    swift_slowDealloc(v37, -1, -1);
    v40 = v71;
    swift_arrayDestroy(v71, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v40, -1, -1);
    swift_slowDealloc(v32, -1, -1);

    v41 = *(uint64_t (**)(char *, uint64_t))(v72 + 8);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);

    v41 = *(uint64_t (**)(char *, uint64_t))(v19 + 8);
  }
  v42 = v41(v25, v18);
  v43 = v77;
  v44 = static UtilityRateInfoSnapshot.noUtilitySnapshot.getter(v42);
  v45 = v76;
  v46 = static TimelineReloadPolicy.atEnd.getter(v44);
  v47 = static Logger.utilityRateWidgets.getter(v46);
  v48 = Logger.logObject.getter(v47);
  v49 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc(12, -1);
    v51 = swift_slowAlloc(32, -1);
    v90[0] = v51;
    *(_DWORD *)v50 = 136315138;
    v89 = sub_10000F4DC(0xD000000000000019, 0x8000000100032550, v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v89, v90, v50 + 4, v50 + 12);
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "%s: utility rate info loading failed, but error is recoverable, asking for 60 minute reload", v50, 0xCu);
    swift_arrayDestroy(v51, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1, -1);
    swift_slowDealloc(v50, -1, -1);

    v52 = v22;
    v53 = v75;
  }
  else
  {

    v52 = v22;
    v53 = v18;
  }
  v54 = v41(v52, v53);
  v55 = v85;
  Date.init(timeIntervalSinceNow:)(v54, 3600.0);
  v56 = v78;
  static TimelineReloadPolicy.after(_:)(v55);
  v58 = v86;
  v57 = v87;
  (*(void (**)(char *, uint64_t))(v86 + 8))(v55, v87);
  v60 = v79;
  v59 = v80;
  (*(void (**)(char *, uint64_t))(v79 + 8))(v45, v80);
  v61 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v60 + 32))(v84, v56, v59);
  static Date.now.getter(v61);
  v63 = v81;
  v62 = v82;
  v64 = v83;
  (*(void (**)(char *, char *, uint64_t))(v82 + 16))(v81, v43, v83);
  v65 = sub_10002F0F0();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v43, v64);
  v66 = *(void (**)(uint64_t, char *, uint64_t))(v58 + 32);
  v67 = v88;
  v66(v88, v55, v57);
  v68 = type metadata accessor for UtilityRateInfoEntry(0);
  result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v62 + 32))(v67 + *(int *)(v68 + 20), v63, v64);
  *(_QWORD *)(v67 + *(int *)(v68 + 24)) = v65;
  return result;
}

uint64_t sub_100016A2C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *a2;
  v5 = (_QWORD *)swift_task_alloc(dword_10003CF4C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000670C;
  return sub_100013818(a1, v4);
}

uint64_t sub_100016A84(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *a2;
  v5 = (_QWORD *)swift_task_alloc(dword_10003CF0C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000670C;
  return sub_100013ABC(a1, v4);
}

uint64_t sub_100016ADC(uint64_t *a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  return sub_1000181BC(*a1, a2, a3, a4);
}

uint64_t sub_100016AE4(uint64_t *a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  return sub_1000183F0(*a1, a2, a3, a4);
}

uint64_t sub_100016AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to AppIntentTimelineProvider.relevances()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1000060A8;
  return AppIntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_100016B58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to AppIntentTimelineProvider.relevance()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10000670C;
  return AppIntentTimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_100016BC4()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;
  void *object;
  Swift::String v4;
  uint64_t v5;
  Swift::String v6;
  void *v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  void *v12;

  _StringGuts.grow(_:)(53);
  v1._countAndFlagsBits = 0xD000000000000018;
  v1._object = (void *)0x8000000100032510;
  String.append(_:)(v1);
  v2 = Date.formatted()();
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._countAndFlagsBits = 2106912;
  v4._object = (void *)0xE300000000000000;
  String.append(_:)(v4);
  v5 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for UtilityRateInfoEntry(0) + 24));
  swift_retain(v5);
  v6._countAndFlagsBits = sub_10002ECB0();
  v7 = v6._object;
  String.append(_:)(v6);
  swift_release(v5);
  swift_bridgeObjectRelease(v7);
  v8._object = (void *)0x8000000100032530;
  v8._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v8);
  v9 = type metadata accessor for UtilityRateInfoSnapshot(0);
  v10 = sub_10000C440(&qword_10003CDF8, (uint64_t (*)(uint64_t))&type metadata accessor for UtilityRateInfoSnapshot, (uint64_t)&protocol conformance descriptor for UtilityRateInfoSnapshot);
  v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v9, v10);
  v12 = v11._object;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v12);
  return 0;
}

uint64_t sub_100016D18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_100016D58()
{
  return sub_10000C440(&qword_10003CEC8, type metadata accessor for UtilityRateInfoEntry, (uint64_t)&unk_100031150);
}

unint64_t sub_100016D88()
{
  unint64_t result;

  result = qword_10003CED0[0];
  if (!qword_10003CED0[0])
  {
    result = swift_getWitnessTable(&unk_1000319F0, &type metadata for UtilityRateInfoWidgetConfiguration);
    atomic_store(result, qword_10003CED0);
  }
  return result;
}

uint64_t sub_100016DCC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = type metadata accessor for UUID(0);
  v0[15] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[16] = v2;
  v0[17] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Logger(0);
  v0[18] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v0[19] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v0[20] = swift_task_alloc(v5);
  v0[21] = swift_task_alloc(v5);
  v0[22] = swift_task_alloc(v5);
  v0[23] = swift_task_alloc(v5);
  v0[24] = swift_task_alloc(v5);
  return swift_task_switch(sub_100016E84, 0, 0);
}

uint64_t sub_100016E84()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 200) = v1;
  v2 = sub_1000066D4(0, &qword_10003C770, HMHomeManager_ptr);
  *v1 = v0;
  v1[1] = sub_100016F24;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 48, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004008, 0, v2);
}

uint64_t sub_100016F24()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 200));
  return swift_task_switch(sub_100016F78, 0, 0);
}

uint64_t sub_100016F78()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  BOOL v44;
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
  os_log_type_t type;
  uint64_t v58;
  uint64_t v59;
  NSObject *log;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v1 = *(void **)(v0 + 48);
  v2 = objc_msgSend(v1, "homes");

  v3 = sub_1000066D4(0, &qword_10003CAE0, HMHome_ptr);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(_QWORD *)(v0 + 208) = v4;

  *(_QWORD *)(v0 + 40) = _swiftEmptyDictionarySingleton;
  if ((unint64_t)v4 >> 62)
  {
    if (v4 < 0)
      v39 = v4;
    else
      v39 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v5 = _CocoaArrayWrapper.endIndex.getter(v39);
    swift_bridgeObjectRelease(v4);
    *(_QWORD *)(v0 + 216) = v5;
    if (v5)
      goto LABEL_3;
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    *(_QWORD *)(v0 + 216) = v5;
    if (v5)
    {
LABEL_3:
      result = type metadata accessor for EnergySite(0);
      *(_QWORD *)(v0 + 224) = result;
      if (v5 < 1)
      {
        __break(1u);
      }
      else
      {
        *(_QWORD *)(v0 + 232) = 0;
        v7 = *(_QWORD *)(v0 + 208);
        if ((v7 & 0xC000000000000001) != 0)
          v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v7);
        else
          v8 = *(id *)(v7 + 32);
        v9 = v8;
        *(_QWORD *)(v0 + 240) = v8;
        static Logger.other.getter();
        v10 = v9;
        v11 = Logger.logObject.getter(v10);
        v12 = static os_log_type_t.default.getter();
        v13 = os_log_type_enabled(v11, v12);
        v14 = *(_QWORD *)(v0 + 192);
        v16 = *(_QWORD *)(v0 + 144);
        v15 = *(_QWORD *)(v0 + 152);
        if (v13)
        {
          v62 = *(_QWORD *)(v0 + 192);
          v63 = *(_QWORD *)(v0 + 144);
          log = v11;
          v17 = *(_QWORD *)(v0 + 136);
          v58 = *(_QWORD *)(v0 + 128);
          v59 = *(_QWORD *)(v0 + 120);
          v18 = swift_slowAlloc(32, -1);
          v61 = swift_slowAlloc(96, -1);
          v65 = v61;
          *(_DWORD *)v18 = 136315650;
          *(_QWORD *)(v0 + 96) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v65);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v18 + 4, v18 + 12);
          *(_WORD *)(v18 + 12) = 2080;
          v19 = objc_msgSend(v10, "name");
          v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
          type = v12;
          v22 = v21;

          *(_QWORD *)(v0 + 104) = sub_10000F4DC(v20, v22, &v65);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 104, v0 + 112, v18 + 14, v18 + 22);
          swift_bridgeObjectRelease(v22);

          *(_WORD *)(v18 + 22) = 2080;
          v23 = objc_msgSend(v10, "uniqueIdentifier");
          static UUID._unconditionallyBridgeFromObjectiveC(_:)();

          v25 = UUID.uuidString.getter(v24);
          v27 = v26;
          (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v17, v59);
          *(_QWORD *)(v0 + 112) = sub_10000F4DC(v25, v27, &v65);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120, v18 + 24, v18 + 32);
          swift_bridgeObjectRelease(v27);

          _os_log_impl((void *)&_mh_execute_header, log, type, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v18, 0x20u);
          swift_arrayDestroy(v61, 3, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v61, -1, -1);
          swift_slowDealloc(v18, -1, -1);

          v28 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
          v28(v62, v63);
        }
        else
        {

          v28 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
          v28(v14, v16);
        }
        *(_QWORD *)(v0 + 248) = v28;
        v30 = *(_QWORD *)(v0 + 128);
        v29 = *(_QWORD *)(v0 + 136);
        v31 = *(_QWORD *)(v0 + 120);
        v32 = objc_msgSend(v10, "uniqueIdentifier");
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        v34 = UUID.uuidString.getter(v33);
        v36 = v35;
        v37 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        *(_QWORD *)(v0 + 256) = v37;
        v37(v29, v31);
        v38 = (_QWORD *)swift_task_alloc(async function pointer to EnergySite.__allocating_init(clientProvidedID:)[1]);
        *(_QWORD *)(v0 + 264) = v38;
        *v38 = v0;
        v38[1] = sub_1000175C4;
        return EnergySite.__allocating_init(clientProvidedID:)(v34, v36);
      }
      return result;
    }
  }
  v40 = swift_bridgeObjectRelease(v4);
  static Logger.historicalUsageWidgets.getter(v40);
  v41 = swift_bridgeObjectRetain();
  v42 = Logger.logObject.getter(v41);
  v43 = static os_log_type_t.default.getter();
  v44 = os_log_type_enabled(v42, v43);
  v46 = *(_QWORD *)(v0 + 152);
  v45 = *(_QWORD *)(v0 + 160);
  v47 = *(_QWORD *)(v0 + 144);
  if (v44)
  {
    v64 = *(_QWORD *)(v0 + 144);
    v48 = swift_slowAlloc(22, -1);
    v49 = swift_slowAlloc(32, -1);
    v65 = v49;
    *(_DWORD *)v48 = 136315394;
    *(_QWORD *)(v0 + 56) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v48 + 4, v48 + 12);
    *(_WORD *)(v48 + 12) = 2048;
    *(_QWORD *)(v0 + 64) = _swiftEmptyDictionarySingleton[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v48 + 14, v48 + 22);
    swift_bridgeObjectRelease(_swiftEmptyDictionarySingleton);
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "%s found %ld onboarded homes", (uint8_t *)v48, 0x16u);
    swift_arrayDestroy(v49, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v49, -1, -1);
    swift_slowDealloc(v48, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v64);
  }
  else
  {
    swift_bridgeObjectRelease(_swiftEmptyDictionarySingleton);

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
  }
  v51 = *(_QWORD *)(v0 + 184);
  v50 = *(_QWORD *)(v0 + 192);
  v53 = *(_QWORD *)(v0 + 168);
  v52 = *(_QWORD *)(v0 + 176);
  v54 = *(_QWORD *)(v0 + 160);
  v55 = *(_QWORD *)(v0 + 136);
  swift_beginAccess(v0 + 40, v0 + 16, 0, 0);
  v56 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v54);
  swift_task_dealloc(v55);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v56);
}

uint64_t sub_1000175C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 264);
  *(_QWORD *)(*(_QWORD *)v1 + 272) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100017620, 0, 0);
}

uint64_t sub_100017620()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void (*v8)(uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  void (*v25)(uint64_t, uint64_t);
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  void (*v39)(uint64_t, uint64_t);
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v90;
  id v91;
  NSObject *v92;
  os_log_type_t v93;
  _BOOL4 v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  void (*v108)(uint64_t, uint64_t);
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void (*v117)(uint64_t, uint64_t);
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t type;
  void (*v125)(uint64_t, uint64_t);
  void (*v126)(uint64_t, uint64_t);
  os_log_type_t v127;
  uint64_t v128;
  uint64_t v129;
  void (*v130)(uint64_t, uint64_t);
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;

  v132 = v0 + 96;
  v1 = *(_QWORD *)(v0 + 272);
  if (v1)
  {
    v2 = EnergySite.utilityOnboarded.getter();
    if ((v2 & 1) != 0)
    {
      v3 = *(void **)(v0 + 240);
      static Logger.utilityRateWidgets.getter(v2);
      v4 = v3;
      swift_retain_n(v1, 2);
      v5 = Logger.logObject.getter(v4);
      v6 = static os_log_type_t.default.getter();
      v7 = os_log_type_enabled(v5, v6);
      v9 = *(void **)(v0 + 240);
      v8 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
      v10 = *(_QWORD *)(v0 + 176);
      v11 = *(_QWORD *)(v0 + 144);
      if (v7)
      {
        v128 = *(_QWORD *)(v0 + 176);
        v12 = swift_slowAlloc(32, -1);
        v122 = swift_slowAlloc(96, -1);
        v134 = v122;
        *(_DWORD *)v12 = 136315650;
        v125 = v8;
        *(_QWORD *)(v0 + 72) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v134);
        v13 = UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v12 + 4, v12 + 12);
        *(_WORD *)(v12 + 12) = 2080;
        v120 = v11;
        v14 = EnergySite.identifier.getter(v13);
        v16 = v15;
        *(_QWORD *)(v0 + 80) = sub_10000F4DC(v14, v15, &v134);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v12 + 14, v12 + 22);
        swift_bridgeObjectRelease(v16);
        swift_release_n(v1, 2);
        *(_WORD *)(v12 + 22) = 2080;
        v17 = objc_msgSend(v9, "name");
        v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
        v20 = v19;

        *(_QWORD *)(v0 + 88) = sub_10000F4DC(v18, v20, &v134);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v132, v12 + 24, v12 + 32);
        swift_bridgeObjectRelease(v20);

        _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s Site %s onboarded for '%s', adding to list...", (uint8_t *)v12, 0x20u);
        swift_arrayDestroy(v122, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v122, -1, -1);
        swift_slowDealloc(v12, -1, -1);

        v125(v128, v120);
      }
      else
      {
        swift_release_n(v1, 2);

        v8(v10, v11);
      }
      v48 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 256);
      v49 = *(void **)(v0 + 240);
      v50 = *(_QWORD *)(v0 + 136);
      v51 = *(_QWORD *)(v0 + 120);
      v52 = objc_msgSend(v49, "uniqueIdentifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v54 = UUID.uuidString.getter(v53);
      v56 = v55;
      v57 = v48(v50, v51);
      v58 = EnergySite.identifier.getter(v57);
      v60 = v59;
      v61 = *(_QWORD *)(v0 + 40);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v61);
      v134 = v61;
      *(_QWORD *)(v0 + 40) = 0x8000000000000000;
      sub_10002C8D8(v54, v56, v58, v60, isUniquelyReferenced_nonNull_native);
      v64 = v63;
      v65 = *(_QWORD *)(v0 + 40);
      *(_QWORD *)(v0 + 40) = v134;
      swift_bridgeObjectRelease(v65);

      swift_release(v1);
      swift_bridgeObjectRelease(v60);
      swift_bridgeObjectRelease(v64);
    }
    else
    {
      static Logger.utilityRateWidgets.getter(v2);
      v35 = swift_retain_n(v1, 2);
      v36 = Logger.logObject.getter(v35);
      v37 = static os_log_type_t.default.getter();
      v38 = os_log_type_enabled(v36, v37);
      v40 = *(void **)(v0 + 240);
      v39 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
      v41 = *(_QWORD *)(v0 + 184);
      v42 = *(_QWORD *)(v0 + 144);
      if (v38)
      {
        v43 = swift_slowAlloc(22, -1);
        v44 = swift_slowAlloc(64, -1);
        v134 = v44;
        *(_DWORD *)v43 = 136315394;
        *(_QWORD *)(v43 + 4) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v134);
        *(_WORD *)(v43 + 12) = 2080;
        v130 = v39;
        v45 = ((uint64_t (*)(void))EnergySite.identifier.getter)();
        v47 = v46;
        *(_QWORD *)(v43 + 14) = sub_10000F4DC(v45, v46, &v134);
        swift_bridgeObjectRelease(v47);
        swift_release_n(v1, 2);
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "%s Site %s found, but home not onboarded: ignoring", (uint8_t *)v43, 0x16u);
        swift_arrayDestroy(v44, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v44, -1, -1);
        swift_slowDealloc(v43, -1, -1);

        swift_release(v1);
        v130(v41, v42);
      }
      else
      {

        swift_release_n(v1, 3);
        v39(v41, v42);
      }
    }
  }
  else
  {
    v21 = *(void **)(v0 + 240);
    static Logger.other.getter();
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.error.getter();
    v24 = os_log_type_enabled(v22, v23);
    v26 = *(void **)(v0 + 240);
    v25 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
    v27 = *(_QWORD *)(v0 + 168);
    v28 = *(_QWORD *)(v0 + 144);
    if (v24)
    {
      v129 = *(_QWORD *)(v0 + 168);
      v29 = swift_slowAlloc(22, -1);
      v30 = swift_slowAlloc(64, -1);
      v134 = v30;
      *(_DWORD *)v29 = 136315394;
      *(_QWORD *)(v29 + 4) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v134);
      *(_WORD *)(v29 + 12) = 2080;
      v31 = objc_msgSend(v26, "name");
      v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
      v126 = v25;
      v34 = v33;

      *(_QWORD *)(v29 + 14) = sub_10000F4DC(v32, v34, &v134);
      swift_bridgeObjectRelease(v34);

      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s Site can not be found for home'%s': ignoring", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy(v30, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);

      v126(v129, v28);
    }
    else
    {

      v25(v27, v28);
    }
  }
  v66 = *(_QWORD *)(v0 + 232) + 1;
  if (v66 == *(_QWORD *)(v0 + 216))
  {
    v67 = v0 + 40;
    v68 = swift_bridgeObjectRelease(*(_QWORD *)(v0 + 208));
    v69 = *(_QWORD *)(v0 + 40);
    static Logger.historicalUsageWidgets.getter(v68);
    v70 = swift_bridgeObjectRetain();
    v71 = Logger.logObject.getter(v70);
    v72 = static os_log_type_t.default.getter();
    v73 = os_log_type_enabled(v71, v72);
    v75 = *(_QWORD *)(v0 + 152);
    v74 = *(_QWORD *)(v0 + 160);
    v76 = *(_QWORD *)(v0 + 144);
    if (v73)
    {
      v131 = *(_QWORD *)(v0 + 160);
      v77 = swift_slowAlloc(22, -1);
      v78 = swift_slowAlloc(32, -1);
      v134 = v78;
      *(_DWORD *)v77 = 136315394;
      *(_QWORD *)(v0 + 56) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v134);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v77 + 4, v77 + 12);
      *(_WORD *)(v77 + 12) = 2048;
      *(_QWORD *)(v0 + 64) = *(_QWORD *)(v69 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v77 + 14, v77 + 22);
      swift_bridgeObjectRelease(v69);
      _os_log_impl((void *)&_mh_execute_header, v71, v72, "%s found %ld onboarded homes", (uint8_t *)v77, 0x16u);
      swift_arrayDestroy(v78, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v78, -1, -1);
      v79 = v77;
      v67 = v0 + 40;
      swift_slowDealloc(v79, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v131, v76);
    }
    else
    {
      swift_bridgeObjectRelease(v69);

      (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v74, v76);
    }
    v82 = *(_QWORD *)(v0 + 184);
    v83 = *(_QWORD *)(v0 + 192);
    v85 = *(_QWORD *)(v0 + 168);
    v84 = *(_QWORD *)(v0 + 176);
    v86 = *(_QWORD *)(v0 + 160);
    v87 = *(_QWORD *)(v0 + 136);
    swift_beginAccess(v67, v0 + 16, 0, 0);
    v88 = *(_QWORD *)(v0 + 40);
    swift_task_dealloc(v83);
    swift_task_dealloc(v82);
    swift_task_dealloc(v84);
    swift_task_dealloc(v85);
    swift_task_dealloc(v86);
    swift_task_dealloc(v87);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v88);
  }
  else
  {
    *(_QWORD *)(v0 + 232) = v66;
    v80 = *(_QWORD *)(v0 + 208);
    if ((v80 & 0xC000000000000001) != 0)
      v81 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v66, v80);
    else
      v81 = *(id *)(v80 + 8 * v66 + 32);
    v90 = v81;
    *(_QWORD *)(v0 + 240) = v81;
    static Logger.other.getter();
    v91 = v90;
    v92 = Logger.logObject.getter(v91);
    v93 = static os_log_type_t.default.getter();
    v94 = os_log_type_enabled(v92, v93);
    v95 = *(_QWORD *)(v0 + 192);
    v97 = *(_QWORD *)(v0 + 144);
    v96 = *(_QWORD *)(v0 + 152);
    if (v94)
    {
      v127 = v93;
      v119 = *(_QWORD *)(v0 + 136);
      v121 = *(_QWORD *)(v0 + 128);
      v123 = *(_QWORD *)(v0 + 120);
      v98 = swift_slowAlloc(32, -1);
      type = swift_slowAlloc(96, -1);
      v134 = type;
      *(_DWORD *)v98 = 136315650;
      *(_QWORD *)(v0 + 96) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v134);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v132, v0 + 104, v98 + 4, v98 + 12);
      *(_WORD *)(v98 + 12) = 2080;
      v99 = objc_msgSend(v91, "name");
      v100 = static String._unconditionallyBridgeFromObjectiveC(_:)(v99);
      v133 = v96;
      v102 = v101;

      *(_QWORD *)(v0 + 104) = sub_10000F4DC(v100, v102, &v134);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 104, v0 + 112, v98 + 14, v98 + 22);
      swift_bridgeObjectRelease(v102);

      *(_WORD *)(v98 + 22) = 2080;
      v103 = objc_msgSend(v91, "uniqueIdentifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v105 = UUID.uuidString.getter(v104);
      v107 = v106;
      (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v119, v123);
      *(_QWORD *)(v0 + 112) = sub_10000F4DC(v105, v107, &v134);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120, v98 + 24, v98 + 32);
      swift_bridgeObjectRelease(v107);

      _os_log_impl((void *)&_mh_execute_header, v92, v127, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v98, 0x20u);
      swift_arrayDestroy(type, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(type, -1, -1);
      swift_slowDealloc(v98, -1, -1);

      v108 = *(void (**)(uint64_t, uint64_t))(v133 + 8);
    }
    else
    {

      v108 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
    }
    v108(v95, v97);
    *(_QWORD *)(v0 + 248) = v108;
    v110 = *(_QWORD *)(v0 + 128);
    v109 = *(_QWORD *)(v0 + 136);
    v111 = *(_QWORD *)(v0 + 120);
    v112 = objc_msgSend(v91, "uniqueIdentifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v114 = UUID.uuidString.getter(v113);
    v116 = v115;
    v117 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
    *(_QWORD *)(v0 + 256) = v117;
    v117(v109, v111);
    v118 = (_QWORD *)swift_task_alloc(async function pointer to EnergySite.__allocating_init(clientProvidedID:)[1]);
    *(_QWORD *)(v0 + 264) = v118;
    *v118 = v0;
    v118[1] = sub_1000175C4;
    return EnergySite.__allocating_init(clientProvidedID:)(v114, v116);
  }
}

uint64_t sub_1000181BC(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_QWORD);
  uint64_t v30;
  uint64_t v31;

  v7 = type metadata accessor for UtilityRateInfoEntry(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static Logger.utilityRateWidgets.getter(v12);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v27 = a1;
    v18 = swift_slowAlloc(12, -1);
    v28 = a4;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc(32, -1);
    v29 = a3;
    v21 = v20;
    v31 = v20;
    v26 = v10;
    *(_DWORD *)v19 = 136315138;
    v30 = sub_10000F4DC(0xD00000000000001FLL, 0x80000001000324A0, &v31);
    a1 = v27;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v19 + 4, v19 + 12);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s THIS SHOULD NEVER GET CALLED", v19, 0xCu);
    swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
    v22 = v21;
    a3 = v29;
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v19, -1, -1);

    v23 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v26);
  }
  else
  {

    v23 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  v24 = static Date.now.getter(v23);
  static UtilityRateInfoSnapshot.placeholderETOUCSnapshot.getter(v24);
  *(_QWORD *)&v9[*(int *)(v7 + 24)] = a1;
  swift_retain(a1);
  a3(v9);
  return sub_10001878C((uint64_t)v9);
}

uint64_t sub_1000183F0(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
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
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
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
  char *v36;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *);
  char *v47;
  uint64_t v48;
  uint64_t v49;

  v46 = a3;
  v6 = type metadata accessor for TimelineReloadPolicy(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100005E18(&qword_10003CEF8);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v47 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UtilityRateInfoEntry(0);
  v44 = *(_QWORD *)(v12 - 8);
  v45 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Logger(0);
  v43 = *(_QWORD *)(v15 - 8);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = static Logger.utilityRateWidgets.getter(v16);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v40 = v8;
    v22 = swift_slowAlloc(12, -1);
    v42 = a4;
    v23 = (uint8_t *)v22;
    v24 = swift_slowAlloc(32, -1);
    v41 = v9;
    v25 = v24;
    v49 = v24;
    v38 = v15;
    v39 = a1;
    *(_DWORD *)v23 = 136315138;
    v48 = sub_10000F4DC(0xD00000000000001FLL, 0x8000000100032480, &v49);
    a1 = v39;
    v8 = v40;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v23 + 4, v23 + 12);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s THIS SHOULD NEVER GET CALLED", v23, 0xCu);
    swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
    v26 = v25;
    v9 = v41;
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v23, -1, -1);

    v27 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v18, v38);
  }
  else
  {

    v27 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v18, v15);
  }
  v28 = static Date.now.getter(v27);
  v29 = v45;
  static UtilityRateInfoSnapshot.loadingSnapshot.getter(v28);
  *(_QWORD *)&v14[*(int *)(v29 + 24)] = a1;
  v30 = sub_100005E18(&qword_10003CF00);
  v31 = *(unsigned __int8 *)(v44 + 80);
  v32 = (v31 + 32) & ~v31;
  v33 = swift_allocObject(v30, v32 + *(_QWORD *)(v44 + 72), v31 | 7);
  *(_OWORD *)(v33 + 16) = xmmword_1000310E0;
  sub_100018748((uint64_t)v14, v33 + v32);
  v34 = swift_retain(a1);
  static TimelineReloadPolicy.never.getter(v34);
  v35 = sub_10000C440(&qword_10003CEC8, type metadata accessor for UtilityRateInfoEntry, (uint64_t)&unk_100031150);
  v36 = v47;
  Timeline.init(entries:policy:)(v33, v8, v29, v35);
  v46(v36);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v36, v9);
  return sub_10001878C((uint64_t)v14);
}

uint64_t sub_100018748(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UtilityRateInfoEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001878C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for UtilityRateInfoEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000187CC()
{
  unint64_t result;

  result = qword_10003CF50;
  if (!qword_10003CF50)
  {
    result = swift_getWitnessTable(&unk_100031268, &type metadata for HistoricalUsageWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_10003CF50);
  }
  return result;
}

uint64_t sub_100018810(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t result;
  char v25;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v23 = v4 + v2;
  else
    v23 = v4;
  v3 = sub_100026E1C(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *(_QWORD *)(v3 + 16);
  v9 = (*(_QWORD *)(v3 + 24) >> 1) - v8;
  v10 = type metadata accessor for ForecastLocationEntity(0);
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 72);
  v14 = v3 + v12 + v13 * v8;
  v15 = a1 + v12;
  v16 = v13 * v2;
  v17 = v14 + v16;
  v18 = v15 + v16;
  if (v15 < v17 && v14 < v18)
    goto LABEL_24;
  swift_arrayInitWithCopy(v14);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
    return result;
  }
  v20 = *(_QWORD *)(v3 + 16);
  v21 = __OFADD__(v20, v2);
  v22 = v20 + v2;
  if (!v21)
  {
    *(_QWORD *)(v3 + 16) = v22;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v25 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v25, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100018978(uint64_t a1)
{
  char **v1;
  unint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;
  char v17;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_100026E30(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[56 * v9 + 32];
  if (a1 + 32 < v10 + 56 * v8 && v10 < a1 + 32 + 56 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy(v10);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = *((_QWORD *)v3 + 2);
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    *((_QWORD *)v3 + 2) = v14;
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v17 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v17, 1092, 0);
  __break(1u);
  return result;
}

unint64_t sub_100018AD4()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  void *object;
  _QWORD v5[2];
  unint64_t v6;
  unint64_t v7;

  v5[0] = 0;
  v5[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(31);
  v0 = swift_bridgeObjectRelease(0xE000000000000000);
  v6 = 0xD00000000000001DLL;
  v7 = 0x80000001000325B0;
  IntentParameter.wrappedValue.getter(v0);
  v1 = sub_100005E18(&qword_10003D018);
  v2._countAndFlagsBits = String.init<A>(describing:)(v5, v1);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  return v6;
}

uint64_t sub_100018B84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_1000064C8(v10, qword_10003D510);
  sub_1000064B0(v10, (uint64_t)qword_10003D510);
  v11 = String.LocalizationValue.init(stringLiteral:)(0x48207463656C6553, 0xEB00000000656D6FLL);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v9, 0xD000000000000015, 0x8000000100031FF0, v6, v3, "The home being selected to energy usage from.", 45, 2);
}

unint64_t sub_100018D0C()
{
  return sub_100018AD4();
}

unint64_t sub_100018D18()
{
  unint64_t result;

  result = qword_10003CF58;
  if (!qword_10003CF58)
  {
    result = swift_getWitnessTable(&unk_1000312F8, &type metadata for HistoricalUsageWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_10003CF58);
  }
  return result;
}

unint64_t sub_100018D60()
{
  unint64_t result;

  result = qword_10003CF60;
  if (!qword_10003CF60)
  {
    result = swift_getWitnessTable(&unk_100031320, &type metadata for HistoricalUsageWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_10003CF60);
  }
  return result;
}

uint64_t sub_100018DA4(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_1000187CC();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100018DE4@<X0>(uint64_t a1@<X8>)
{
  return sub_100009D80(&qword_10003C740, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10003D510, (uint64_t)sub_100018B84, a1);
}

uint64_t sub_100018E08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to WidgetConfigurationIntent.perform()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = sub_10001CD44();
  *v4 = v2;
  v4[1] = sub_100009E68;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_100018E6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_10001A060();
  *a1 = result;
  return result;
}

uint64_t sub_100018E90(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000187CC();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unint64_t sub_100018EBC()
{
  unint64_t result;

  result = qword_10003CF70;
  if (!qword_10003CF70)
  {
    result = swift_getWitnessTable(&unk_100031394, &type metadata for SiteDetail);
    atomic_store(result, (unint64_t *)&qword_10003CF70);
  }
  return result;
}

unint64_t sub_100018F04()
{
  unint64_t result;

  result = qword_10003CF78;
  if (!qword_10003CF78)
  {
    result = swift_getWitnessTable(&unk_1000313CC, &type metadata for SiteDetail);
    atomic_store(result, (unint64_t *)&qword_10003CF78);
  }
  return result;
}

unint64_t sub_100018F4C()
{
  unint64_t result;

  result = qword_10003CF80;
  if (!qword_10003CF80)
  {
    result = swift_getWitnessTable(&unk_1000313FC, &type metadata for SiteDetail);
    atomic_store(result, (unint64_t *)&qword_10003CF80);
  }
  return result;
}

unint64_t sub_100018F94()
{
  unint64_t result;

  result = qword_10003CF88;
  if (!qword_10003CF88)
  {
    result = swift_getWitnessTable(&unk_100031534, &type metadata for SiteQuery);
    atomic_store(result, (unint64_t *)&qword_10003CF88);
  }
  return result;
}

void *sub_100018FD8()
{
  return &protocol witness table for String;
}

uint64_t sub_100018FE4()
{
  uint64_t v0;

  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_1000064C8(v0, qword_10003D528);
  sub_1000064B0(v0, (uint64_t)qword_10003D528);
  return TypeDisplayRepresentation.init(stringLiteral:)(1701670728, 0xE400000000000000);
}

unint64_t sub_10001903C()
{
  unint64_t result;

  result = qword_10003CF90;
  if (!qword_10003CF90)
  {
    result = swift_getWitnessTable(&unk_100031434, &type metadata for SiteDetail);
    atomic_store(result, (unint64_t *)&qword_10003CF90);
  }
  return result;
}

unint64_t sub_100019084()
{
  unint64_t result;

  result = qword_10003CF98;
  if (!qword_10003CF98)
  {
    result = swift_getWitnessTable(&unk_10003145C, &type metadata for SiteDetail);
    atomic_store(result, (unint64_t *)&qword_10003CF98);
  }
  return result;
}

unint64_t sub_1000190CC()
{
  unint64_t result;

  result = qword_10003CFA0;
  if (!qword_10003CFA0)
  {
    result = swift_getWitnessTable(&unk_100031484, &type metadata for SiteDetail);
    atomic_store(result, (unint64_t *)&qword_10003CFA0);
  }
  return result;
}

unint64_t sub_100019114()
{
  unint64_t result;

  result = qword_10003CFA8;
  if (!qword_10003CFA8)
  {
    result = swift_getWitnessTable(&unk_1000314DC, &type metadata for SiteDetail);
    atomic_store(result, (unint64_t *)&qword_10003CFA8);
  }
  return result;
}

void *sub_100019158()
{
  return &protocol witness table for String;
}

uint64_t sub_100019164@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_100019170@<X0>(uint64_t a1@<X8>)
{
  return sub_100009D80(&qword_10003C748, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10003D528, (uint64_t)sub_100018FE4, a1);
}

unint64_t sub_100019198()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003CFB0;
  if (!qword_10003CFB0)
  {
    v1 = sub_100005E58(&qword_10003CFB8);
    result = swift_getWitnessTable(&protocol conformance descriptor for EmptyResolverSpecification<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10003CFB0);
  }
  return result;
}

uint64_t sub_1000191E4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000194E4();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100019220()
{
  unint64_t result;

  result = qword_10003CFC0;
  if (!qword_10003CFC0)
  {
    result = swift_getWitnessTable(&unk_10003150C, &type metadata for SiteDetail);
    atomic_store(result, (unint64_t *)&qword_10003CFC0);
  }
  return result;
}

uint64_t sub_100019264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v21;

  v1 = sub_100005E18(&qword_10003CB10);
  __chkstk_darwin(v1);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100005E18(&qword_10003CAA0);
  __chkstk_darwin(v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v0 + 16);
  v15 = *(void **)(v0 + 24);
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1);
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v16);
  v17._countAndFlagsBits = v14;
  v17._object = v15;
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(v17);
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v18);
  LocalizedStringResource.init(stringInterpolation:)(v13);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  v19 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v3, 1, 1, v19);
  return DisplayRepresentation.init(title:subtitle:image:)(v10, v6, v3);
}

uint64_t sub_100019418(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100019114();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100019454()
{
  unint64_t result;

  result = qword_10003CFC8;
  if (!qword_10003CFC8)
  {
    result = swift_getWitnessTable(&unk_10003158C, &type metadata for SiteQuery);
    atomic_store(result, (unint64_t *)&qword_10003CFC8);
  }
  return result;
}

unint64_t sub_10001949C()
{
  unint64_t result;

  result = qword_10003CFD0;
  if (!qword_10003CFD0)
  {
    result = swift_getWitnessTable(&unk_1000315EC, &type metadata for SiteQuery);
    atomic_store(result, (unint64_t *)&qword_10003CFD0);
  }
  return result;
}

unint64_t sub_1000194E4()
{
  unint64_t result;

  result = qword_10003CFD8[0];
  if (!qword_10003CFD8[0])
  {
    result = swift_getWitnessTable(&unk_10003133C, &type metadata for SiteDetail);
    atomic_store(result, qword_10003CFD8);
  }
  return result;
}

uint64_t sub_100019528(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_10003D040 + dword_10003D040);
  v3 = (_QWORD *)swift_task_alloc(unk_10003D044);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100009638;
  return v5(a1);
}

uint64_t sub_100019588(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_10003D030 + dword_10003D030);
  v2 = (_QWORD *)swift_task_alloc(unk_10003D034);
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_1000195E4;
  return v4();
}

uint64_t sub_1000195E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 24);
  v6 = *v2;
  swift_task_dealloc(v5);
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

unint64_t sub_100019644()
{
  unint64_t result;

  result = qword_10003CFF0;
  if (!qword_10003CFF0)
  {
    result = swift_getWitnessTable(&unk_100031614, &type metadata for SiteQuery);
    atomic_store(result, (unint64_t *)&qword_10003CFF0);
  }
  return result;
}

unint64_t sub_10001968C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003CFF8;
  if (!qword_10003CFF8)
  {
    v1 = sub_100005E58(qword_10003D000);
    sub_1000190CC();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10003CFF8);
  }
  return result;
}

uint64_t sub_1000196F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100018F94();
  *v5 = v2;
  v5[1] = sub_1000060A8;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10001975C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  *(_QWORD *)(v1 + 72) = a1;
  v4 = (uint64_t (*)(uint64_t))((char *)&dword_10003D028 + dword_10003D028);
  v2 = (_QWORD *)swift_task_alloc(unk_10003D02C);
  *(_QWORD *)(v1 + 80) = v2;
  *v2 = v1;
  v2[1] = sub_1000197C4;
  return v4(v1 + 16);
}

uint64_t sub_1000197C4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = *v0 + 16;
  v2 = *(_QWORD *)(*v0 + 72);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 80));
  sub_10001CCC0(v1, v2);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

ValueMetadata *type metadata accessor for SiteQuery()
{
  return &type metadata for SiteQuery;
}

uint64_t initializeBufferWithCopyOfBuffer for SiteDetail(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for SiteDetail(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  return swift_bridgeObjectRelease(a1[5]);
}

uint64_t initializeWithCopy for SiteDetail(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t assignWithCopy for SiteDetail(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

__n128 initializeWithTake for SiteDetail(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SiteDetail(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiteDetail(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiteDetail(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiteDetail()
{
  return &type metadata for SiteDetail;
}

ValueMetadata *type metadata accessor for HistoricalUsageWidgetConfiguration()
{
  return &type metadata for HistoricalUsageWidgetConfiguration;
}

uint64_t sub_100019AAC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100019AE4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100019AC8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100019CC4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100019AE4(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100005E18(&qword_10003D058);
  v11 = *(_QWORD *)(type metadata accessor for ForecastLocationEntity(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for ForecastLocationEntity(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v21);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v8;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100019CC4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  size_t v15;
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
    v10 = sub_100005E18(&qword_10003D048);
    v11 = (char *)swift_allocObject(v10, 56 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 56);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  v15 = 56 * v8;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy(v13);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100019E40(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = 0;
    v23 = result + 32;
    v21 = (_QWORD *)(a2 + 56);
    v22 = _swiftEmptyArrayStorage;
    v29 = a2;
    v27 = *(_QWORD *)(result + 16);
    while (1)
    {
      if (v3 <= v2)
        v4 = v2;
      else
        v4 = v3;
      v28 = v4;
      while (1)
      {
        if (v3 == v28)
          goto LABEL_34;
        v5 = v3++;
        v6 = *(_QWORD *)(a2 + 16);
        if (!v6)
          goto LABEL_7;
        v7 = v23 + 56 * v5;
        v8 = *(_QWORD *)v7;
        v9 = *(_QWORD *)(v7 + 8);
        v10 = *(_QWORD *)(v7 + 24);
        v11 = *(_QWORD *)(v7 + 40);
        v25 = *(_QWORD *)(v7 + 32);
        v26 = *(_QWORD *)(v7 + 16);
        v24 = *(_BYTE *)(v7 + 48);
        if (*(_QWORD *)(v29 + 32) == *(_QWORD *)v7 && *(_QWORD *)(v29 + 40) == v9)
          break;
        result = _stringCompareWithSmolCheck(_:_:expecting:)();
        if ((result & 1) != 0)
          break;
        if (v6 != 1)
        {
          v13 = v21;
          v14 = 1;
          while (1)
          {
            v15 = v14 + 1;
            if (__OFADD__(v14, 1))
              break;
            if (*(v13 - 1) == v8 && *v13 == v9)
              goto LABEL_25;
            result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) != 0)
              goto LABEL_25;
            v13 += 2;
            ++v14;
            if (v15 == v6)
              goto LABEL_7;
          }
          __break(1u);
LABEL_34:
          __break(1u);
          return result;
        }
LABEL_7:
        a2 = v29;
        if (v3 == v27)
          return (uint64_t)v22;
      }
LABEL_25:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v17 = v22;
      result = swift_isUniquelyReferenced_nonNull_native(v22);
      if ((result & 1) == 0)
      {
        result = sub_100019AC8(0, v22[2] + 1, 1);
        v17 = v22;
      }
      v19 = v17[2];
      v18 = v17[3];
      if (v19 >= v18 >> 1)
      {
        result = sub_100019AC8(v18 > 1, v19 + 1, 1);
        v17 = v22;
      }
      v17[2] = v19 + 1;
      v22 = v17;
      v20 = &v17[7 * v19];
      v20[4] = v8;
      v20[5] = v9;
      v20[6] = v26;
      v20[7] = v10;
      v20[8] = v25;
      v20[9] = v11;
      *((_BYTE *)v20 + 80) = v24;
      v2 = v27;
      a2 = v29;
      if (v3 == v27)
        return (uint64_t)v22;
    }
  }
  return (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_10001A060()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD v32[3];
  char v33;

  v0 = type metadata accessor for Logger(0);
  v30 = *(_QWORD *)(v0 - 8);
  v31 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v29 - 8);
  __chkstk_darwin(v29);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005E18(&qword_10003CA90);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v28 - v10;
  v12 = sub_100005E18(&qword_10003CAA0);
  __chkstk_darwin(v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for LocalizedStringResource(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E18(&qword_10003D020);
  LocalizedStringResource.init(stringLiteral:)(1701670728, 0xE400000000000000);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  v19 = type metadata accessor for IntentDialog(0);
  memset(v32, 0, sizeof(v32));
  v33 = 0;
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v20(v11, 1, 1, v19);
  v20(v9, 1, 1, v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for InputConnectionBehavior.default(_:), v29);
  v21 = sub_1000194E4();
  v22 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v18, v14, v32, v11, v9, v5, v21);
  v23 = static Logger.historicalUsageWidgets.getter(v22);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "HistoricalUsageWidgetConfiguration init without siteDetail...", v26, 2u);
    swift_slowDealloc(v26, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v30 + 8))(v2, v31);
  return v22;
}

uint64_t sub_10001A330()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = type metadata accessor for UUID(0);
  v0[19] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[20] = v2;
  v0[21] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Logger(0);
  v0[22] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v0[23] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v0[24] = swift_task_alloc(v5);
  v0[25] = swift_task_alloc(v5);
  v0[26] = swift_task_alloc(v5);
  v0[27] = swift_task_alloc(v5);
  v0[28] = swift_task_alloc(v5);
  v0[29] = swift_task_alloc(v5);
  v0[30] = swift_task_alloc(v5);
  return swift_task_switch(sub_10001A400, 0, 0);
}

uint64_t sub_10001A400()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  *(_QWORD *)(v0 + 56) = _swiftEmptyArrayStorage;
  v1 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 248) = v1;
  v2 = sub_1000066D4(0, &qword_10003C770, HMHomeManager_ptr);
  *v1 = v0;
  v1[1] = sub_10001A4AC;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 40, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004008, 0, v2);
}

uint64_t sub_10001A4AC()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 248));
  return swift_task_switch(sub_10001A500, 0, 0);
}

uint64_t sub_10001A500()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  _QWORD *v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  BOOL v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char **v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  _BOOL4 v73;
  void (*v74)(uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint8_t *v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  char *v81;
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
  os_log_type_t type;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t, uint64_t);
  uint64_t v101;

  v1 = v0 + 120;
  v2 = *(void **)(v0 + 40);
  v3 = objc_msgSend(v2, "homes");

  v4 = sub_1000066D4(0, &qword_10003CAE0, HMHome_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);
  *(_QWORD *)(v0 + 256) = v5;

  static Logger.historicalUsageWidgets.getter(v6);
  swift_bridgeObjectRetain_n(v5, 2);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  v10 = (unint64_t)v5 >> 62;
  if (os_log_type_enabled(v8, v9))
  {
    v11 = swift_slowAlloc(22, -1);
    v12 = swift_slowAlloc(32, -1);
    v101 = v12;
    *(_DWORD *)v11 = 136315394;
    *(_QWORD *)(v0 + 144) = sub_10000F4DC(0xD000000000000017, 0x80000001000325F0, &v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152, v11 + 4, v11 + 12);
    *(_WORD *)(v11 + 12) = 2048;
    if (v10)
    {
      if (v5 < 0)
        v89 = v5;
      else
        v89 = v5 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      v13 = _CocoaArrayWrapper.endIndex.getter(v89);
      swift_bridgeObjectRelease(v5);
    }
    else
    {
      v13 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v14 = *(_QWORD *)(v0 + 184);
    v94 = *(_QWORD *)(v0 + 176);
    v97 = *(_QWORD *)(v0 + 240);
    swift_bridgeObjectRelease(v5);
    *(_QWORD *)(v0 + 112) = v13;
    v1 = v0 + 120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120, v11 + 14, v11 + 22);
    swift_bridgeObjectRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s HomeManagerActor returned %ld home(s), checking if onboarded...", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

    v15 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v15(v97, v94);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 240);
    v17 = *(_QWORD *)(v0 + 176);
    v18 = *(_QWORD *)(v0 + 184);
    swift_bridgeObjectRelease_n(v5, 2);

    v15 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v15(v16, v17);
  }
  *(_QWORD *)(v0 + 264) = v5;
  *(_QWORD *)(v0 + 272) = v15;
  *(_QWORD *)(v0 + 48) = _swiftEmptyArrayStorage;
  if (v10)
  {
    if (v5 >= 0)
      v52 = v5 & 0xFFFFFFFFFFFFFF8;
    else
      v52 = v5;
    swift_bridgeObjectRetain();
    v53 = _CocoaArrayWrapper.endIndex.getter(v52);
    *(_QWORD *)(v0 + 280) = v53;
    if (v53)
      goto LABEL_8;
  }
  else
  {
    v19 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 280) = v19;
    if (v19)
    {
LABEL_8:
      v20 = type metadata accessor for EnergySite(0);
      *(_QWORD *)(v0 + 320) = v15;
      *(_QWORD *)(v0 + 328) = v15;
      *(_QWORD *)(v0 + 304) = v15;
      *(_QWORD *)(v0 + 312) = v15;
      *(_QWORD *)(v0 + 288) = v20;
      *(_QWORD *)(v0 + 296) = v15;
      v21 = *(_QWORD *)(v0 + 256);
      if ((*(_QWORD *)(v0 + 264) & 0xC000000000000001) != 0)
        v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v21);
      else
        v22 = *(id *)(v21 + 32);
      v23 = v22;
      *(_QWORD *)(v0 + 336) = v22;
      *(_QWORD *)(v0 + 344) = 1;
      static Logger.historicalUsageWidgets.getter(v22);
      v24 = v23;
      v25 = Logger.logObject.getter(v24);
      v26 = static os_log_type_t.debug.getter();
      v27 = os_log_type_enabled(v25, v26);
      v28 = *(_QWORD *)(v0 + 232);
      v29 = *(_QWORD *)(v0 + 176);
      if (v27)
      {
        v98 = *(_QWORD *)(v0 + 232);
        v100 = v15;
        v30 = *(_QWORD *)(v0 + 168);
        v90 = *(_QWORD *)(v0 + 160);
        v91 = *(_QWORD *)(v0 + 152);
        v31 = swift_slowAlloc(32, -1);
        v95 = swift_slowAlloc(96, -1);
        v101 = v95;
        *(_DWORD *)v31 = 136315650;
        type = v26;
        *(_QWORD *)(v0 + 120) = sub_10000F4DC(0xD000000000000017, 0x80000001000325F0, &v101);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1, v0 + 128, v31 + 4, v31 + 12);
        *(_WORD *)(v31 + 12) = 2080;
        v92 = v29;
        v32 = objc_msgSend(v24, "name");
        v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
        v35 = v34;

        *(_QWORD *)(v0 + 128) = sub_10000F4DC(v33, v35, &v101);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136, v31 + 14, v31 + 22);
        swift_bridgeObjectRelease(v35);

        *(_WORD *)(v31 + 22) = 2080;
        v36 = objc_msgSend(v24, "uniqueIdentifier");
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        v38 = UUID.uuidString.getter(v37);
        v40 = v39;
        (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v30, v91);
        *(_QWORD *)(v0 + 136) = sub_10000F4DC(v38, v40, &v101);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144, v31 + 24, v31 + 32);
        swift_bridgeObjectRelease(v40);

        _os_log_impl((void *)&_mh_execute_header, v25, type, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v31, 0x20u);
        swift_arrayDestroy(v95, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v95, -1, -1);
        swift_slowDealloc(v31, -1, -1);

        v100(v98, v92);
      }
      else
      {

        v15(v28, v29);
      }
      v42 = *(_QWORD *)(v0 + 160);
      v41 = *(_QWORD *)(v0 + 168);
      v43 = *(_QWORD *)(v0 + 152);
      v44 = objc_msgSend(v24, "uniqueIdentifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v46 = UUID.uuidString.getter(v45);
      v48 = v47;
      v49 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
      *(_QWORD *)(v0 + 352) = v49;
      v49(v41, v43);
      v50 = (_QWORD *)swift_task_alloc(async function pointer to EnergySite.__allocating_init(clientProvidedID:)[1]);
      *(_QWORD *)(v0 + 360) = v50;
      *v50 = v0;
      v50[1] = sub_10001AF08;
      return EnergySite.__allocating_init(clientProvidedID:)(v46, v48);
    }
  }
  v54 = v0 + 16;
  v55 = (uint64_t *)(v0 + 48);
  v56 = swift_bridgeObjectRelease_n(v5, 2);
  static Logger.historicalUsageWidgets.getter(v56);
  v57 = swift_bridgeObjectRetain();
  v58 = Logger.logObject.getter(v57);
  v59 = static os_log_type_t.default.getter();
  v60 = os_log_type_enabled(v58, v59);
  v61 = *(void (**)(uint64_t, uint64_t))(v0 + 272);
  v62 = *(_QWORD *)(v0 + 200);
  v63 = *(_QWORD *)(v0 + 176);
  if (v60)
  {
    v64 = swift_slowAlloc(22, -1);
    v65 = swift_slowAlloc(32, -1);
    v101 = v65;
    *(_DWORD *)v64 = 136315394;
    *(_QWORD *)(v0 + 72) = sub_10000F4DC(0xD000000000000017, 0x80000001000325F0, &v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v64 + 4, v64 + 12);
    *(_WORD *)(v64 + 12) = 2048;
    *(_QWORD *)(v0 + 80) = _swiftEmptyArrayStorage[2];
    v54 = v0 + 16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v64 + 14, v64 + 22);
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    _os_log_impl((void *)&_mh_execute_header, v58, v59, "%s Found %ld home(s) with an onboarded utility)", (uint8_t *)v64, 0x16u);
    swift_arrayDestroy(v65, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v65, -1, -1);
    swift_slowDealloc(v64, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  v61(v62, v63);
  v66 = (char **)(v0 + 56);
  swift_beginAccess(v0 + 48, v54, 0, 0);
  v67 = *v55;
  if (*(_QWORD *)(*v55 + 16))
  {
    sub_100018978(v67);
    v68 = *v66;
  }
  else
  {
    v69 = swift_bridgeObjectRelease(v67);
    v70 = static Logger.historicalUsageWidgets.getter(v69);
    v71 = Logger.logObject.getter(v70);
    v72 = static os_log_type_t.default.getter();
    v73 = os_log_type_enabled(v71, v72);
    v74 = *(void (**)(uint64_t, uint64_t))(v0 + 272);
    v75 = *(_QWORD *)(v0 + 192);
    v76 = *(_QWORD *)(v0 + 176);
    if (v73)
    {
      v99 = *(void (**)(uint64_t, uint64_t))(v0 + 272);
      v96 = *(_QWORD *)(v0 + 192);
      v77 = (uint8_t *)swift_slowAlloc(12, -1);
      v78 = swift_slowAlloc(32, -1);
      v101 = v78;
      *(_DWORD *)v77 = 136315138;
      *(_QWORD *)(v0 + 64) = sub_10000F4DC(0xD000000000000017, 0x80000001000325F0, &v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v77 + 4, v77 + 12);
      _os_log_impl((void *)&_mh_execute_header, v71, v72, "%s No onboarded homes found! (returning error SiteDetail: <NO ONBOARDED HOMES ERROR>)", v77, 0xCu);
      swift_arrayDestroy(v78, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v78, -1, -1);
      swift_slowDealloc(v77, -1, -1);

      v99(v96, v76);
    }
    else
    {

      v74(v75, v76);
    }
    v68 = *v66;
    if ((swift_isUniquelyReferenced_nonNull_native(*v66) & 1) == 0)
      v68 = sub_100026E30(0, *((_QWORD *)v68 + 2) + 1, 1, v68);
    v80 = *((_QWORD *)v68 + 2);
    v79 = *((_QWORD *)v68 + 3);
    if (v80 >= v79 >> 1)
      v68 = sub_100026E30((char *)(v79 > 1), v80 + 1, 1, v68);
    *((_QWORD *)v68 + 2) = v80 + 1;
    v81 = &v68[56 * v80];
    *((_QWORD *)v81 + 4) = 0xD00000000000001ALL;
    *((_QWORD *)v81 + 5) = 0x80000001000325D0;
    *((_QWORD *)v81 + 6) = 0;
    *((_QWORD *)v81 + 7) = 0xE000000000000000;
    *((_QWORD *)v81 + 8) = 0;
    *((_QWORD *)v81 + 9) = 0xE000000000000000;
    v81[80] = 0;
  }
  v82 = *(_QWORD *)(v0 + 232);
  v84 = *(_QWORD *)(v0 + 216);
  v83 = *(_QWORD *)(v0 + 224);
  v86 = *(_QWORD *)(v0 + 200);
  v85 = *(_QWORD *)(v0 + 208);
  v87 = *(_QWORD *)(v0 + 192);
  v88 = *(_QWORD *)(v0 + 168);
  swift_task_dealloc(*(_QWORD *)(v0 + 240));
  swift_task_dealloc(v82);
  swift_task_dealloc(v83);
  swift_task_dealloc(v84);
  swift_task_dealloc(v85);
  swift_task_dealloc(v86);
  swift_task_dealloc(v87);
  swift_task_dealloc(v88);
  return (*(uint64_t (**)(char *))(v0 + 8))(v68);
}

uint64_t sub_10001AF08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 360);
  *(_QWORD *)(*(_QWORD *)v1 + 368) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10001AF64, 0, 0);
}

uint64_t sub_10001AF64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t, uint64_t);
  void *v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  void *v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  _BOOL4 v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  void **v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t, uint64_t);
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  void *v71;
  char *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  BOOL v80;
  void (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  char **v89;
  uint64_t v90;
  char *v91;
  void (*v92)(uint64_t, uint64_t);
  NSObject *v93;
  os_log_type_t v94;
  _BOOL4 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void (*v117)(uint64_t, uint64_t);
  _QWORD *v118;
  uint64_t v120;
  uint64_t v121;
  NSObject *v122;
  os_log_type_t v123;
  _BOOL4 v124;
  void (*v125)(uint64_t, uint64_t);
  uint64_t v126;
  uint64_t v127;
  uint8_t *v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  os_log_type_t type;
  os_log_type_t typea;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t (*v148)(uint64_t, uint64_t);
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void (*v155)(uint64_t, uint64_t);
  uint64_t v156;

  v4 = *(_QWORD *)(v1 + 368);
  if (!v4)
  {
    v9 = *(void **)(v1 + 336);
    static Logger.historicalUsageWidgets.getter(a1);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.error.getter();
    v12 = v11;
    v13 = os_log_type_enabled(v10, v11);
    v14 = *(void **)(v1 + 336);
    v15 = *(_QWORD *)(v1 + 208);
    v4 = *(_QWORD *)(v1 + 176);
    if (v13)
    {
      v153 = *(_QWORD *)(v1 + 272);
      v150 = *(_QWORD *)(v1 + 208);
      v15 = swift_slowAlloc(22, -1);
      v2 = swift_slowAlloc(64, -1);
      v156 = v2;
      *(_DWORD *)v15 = 136315394;
      *(_QWORD *)(v15 + 4) = sub_10000F4DC(0xD000000000000017, 0x80000001000325F0, &v156);
      *(_WORD *)(v15 + 12) = 2080;
      v3 = (char *)objc_msgSend(v14, "name");
      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
      v18 = v17;

      *(_QWORD *)(v15 + 14) = sub_10000F4DC(v16, v18, &v156);
      swift_bridgeObjectRelease(v18);

      _os_log_impl((void *)&_mh_execute_header, v10, (os_log_type_t)v12, "%s Site can not be found for home'%s': ignoring", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy(v2, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v2, -1, -1);
      swift_slowDealloc(v15, -1, -1);

      ((void (*)(uint64_t, uint64_t))v153)(v150, v4);
      v19 = *(void **)(v1 + 272);
    }
    else
    {
      v34 = *(void (**)(uint64_t, uint64_t))(v1 + 296);

      v34(v15, v4);
      v19 = *(void **)(v1 + 296);
    }
    v32 = v19;
    v31 = (void (*)(uint64_t, uint64_t))v19;
    v30 = (void (*)(uint64_t, uint64_t))v19;
    v33 = (void (*)(uint64_t, uint64_t))v19;
    goto LABEL_24;
  }
  v5 = EnergySite.utilityOnboarded.getter();
  if ((v5 & 1) == 0)
  {
    static Logger.historicalUsageWidgets.getter(v5);
    v20 = swift_retain_n(v4, 2);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.default.getter();
    v15 = v22;
    v23 = os_log_type_enabled(v21, v22);
    v24 = *(void **)(v1 + 336);
    v25 = *(_QWORD *)(v1 + 224);
    v12 = *(_QWORD *)(v1 + 176);
    if (v23)
    {
      v153 = *(_QWORD *)(v1 + 320);
      v2 = swift_slowAlloc(22, -1);
      v3 = (char *)swift_slowAlloc(64, -1);
      v156 = (uint64_t)v3;
      *(_DWORD *)v2 = 136315394;
      v26 = sub_10000F4DC(0xD000000000000017, 0x80000001000325F0, &v156);
      *(_QWORD *)(v2 + 4) = v26;
      *(_WORD *)(v2 + 12) = 2080;
      v27 = EnergySite.identifier.getter(v26);
      v29 = v28;
      *(_QWORD *)(v2 + 14) = sub_10000F4DC(v27, v28, &v156);
      swift_bridgeObjectRelease(v29);
      swift_release_n(v4, 2);
      _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v15, "%s Site %s found, but home not onboarded: ignoring", (uint8_t *)v2, 0x16u);
      swift_arrayDestroy(v3, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v3, -1, -1);
      swift_slowDealloc(v2, -1, -1);

      swift_release(v4);
      ((void (*)(uint64_t, uint64_t))v153)(v25, v12);
      v31 = *(void (**)(uint64_t, uint64_t))(v1 + 312);
      v30 = *(void (**)(uint64_t, uint64_t))(v1 + 320);
      v19 = *(void **)(v1 + 296);
      v32 = *(void **)(v1 + 304);
      v33 = v30;
      goto LABEL_24;
    }
    v55 = *(void (**)(uint64_t, uint64_t))(v1 + 328);

    swift_release_n(v4, 3);
    v55(v25, v12);
    v30 = *(void (**)(uint64_t, uint64_t))(v1 + 320);
    v33 = *(void (**)(uint64_t, uint64_t))(v1 + 328);
    v31 = *(void (**)(uint64_t, uint64_t))(v1 + 312);
    goto LABEL_23;
  }
  v7 = *(_QWORD *)(v1 + 256);
  v6 = *(_QWORD *)(v1 + 264);
  if (v7 >> 62)
  {
    if (v6 >= 0)
      v35 = v6 & 0xFFFFFFFFFFFFFF8;
    else
      v35 = *(_QWORD *)(v1 + 256);
    swift_bridgeObjectRetain();
    v8 = _CocoaArrayWrapper.endIndex.getter(v35);
    v5 = swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v36 = *(void **)(v1 + 336);
  static Logger.historicalUsageWidgets.getter(v5);
  v37 = v36;
  swift_retain_n(v4, 2);
  v38 = Logger.logObject.getter(v37);
  v39 = static os_log_type_t.default.getter();
  v40 = os_log_type_enabled(v38, v39);
  v41 = *(void **)(v1 + 336);
  v42 = *(_QWORD *)(v1 + 216);
  v43 = *(_QWORD *)(v1 + 176);
  v153 = v8;
  if (v40)
  {
    v148 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 304);
    type = v39;
    v44 = swift_slowAlloc(38, -1);
    v143 = swift_slowAlloc(96, -1);
    v156 = v143;
    *(_DWORD *)v44 = 136315906;
    *(_QWORD *)(v1 + 88) = sub_10000F4DC(0xD000000000000017, 0x80000001000325F0, &v156);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 88, v1 + 96, v44 + 4, v44 + 12);
    *(_WORD *)(v44 + 12) = 2080;
    v45 = objc_msgSend(v41, "name");
    v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
    v140 = v43;
    v48 = v47;

    v49 = (void **)(v1 + 304);
    *(_QWORD *)(v1 + 96) = sub_10000F4DC(v46, v48, &v156);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 96, v1 + 104, v44 + 14, v44 + 22);
    swift_bridgeObjectRelease(v48);

    *(_WORD *)(v44 + 22) = 2080;
    v51 = EnergySite.identifier.getter(v50);
    v53 = v52;
    *(_QWORD *)(v1 + 104) = sub_10000F4DC(v51, v52, &v156);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 104, v1 + 112, v44 + 24, v44 + 32);
    swift_bridgeObjectRelease(v53);
    swift_release_n(v4, 2);
    *(_WORD *)(v44 + 32) = 1024;
    *(_DWORD *)(v1 + 376) = v8 > 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 376, v1 + 380, v44 + 34, v44 + 38);
    _os_log_impl((void *)&_mh_execute_header, v38, type, "%s Creating entity for home '%s' with energySiteID: %s & multiHome: %{BOOL}d", (uint8_t *)v44, 0x26u);
    swift_arrayDestroy(v143, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v143, -1, -1);
    swift_slowDealloc(v44, -1, -1);

    v54 = v148(v42, v140);
  }
  else
  {
    v49 = (void **)(v1 + 312);
    v56 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 312);

    swift_release_n(v4, 2);
    v54 = v56(v42, v43);
  }
  v31 = (void (*)(uint64_t, uint64_t))*v49;
  v57 = *(void (**)(uint64_t, uint64_t))(v1 + 352);
  v58 = *(void **)(v1 + 336);
  v59 = *(_QWORD *)(v1 + 168);
  v60 = *(_QWORD *)(v1 + 152);
  v61 = EnergySite.identifier.getter(v54);
  v147 = v62;
  v150 = v61;
  v63 = objc_msgSend(v58, "name");
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v63);
  v15 = v64;

  v65 = objc_msgSend(v58, "uniqueIdentifier");
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  v67 = UUID.uuidString.getter(v66);
  v2 = v68;
  v57(v59, v60);
  v3 = *(char **)(v1 + 48);
  if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
    goto LABEL_48;
  while (1)
  {
    v70 = *((_QWORD *)v3 + 2);
    v69 = *((_QWORD *)v3 + 3);
    if (v70 >= v69 >> 1)
      v3 = sub_100026E30((char *)(v69 > 1), v70 + 1, 1, v3);
    v71 = *(void **)(v1 + 336);
    *((_QWORD *)v3 + 2) = v70 + 1;
    v72 = &v3[56 * v70];
    *((_QWORD *)v72 + 4) = v150;
    *((_QWORD *)v72 + 5) = v147;
    *((_QWORD *)v72 + 6) = v12;
    *((_QWORD *)v72 + 7) = v15;
    *((_QWORD *)v72 + 8) = v67;
    *((_QWORD *)v72 + 9) = v2;
    v72[80] = v153 > 1;

    swift_release(v4);
    *(_QWORD *)(v1 + 48) = v3;
    v30 = v31;
    v33 = v31;
LABEL_23:
    v19 = *(void **)(v1 + 296);
    v32 = *(void **)(v1 + 304);
LABEL_24:
    v67 = *(_QWORD *)(v1 + 344);
    if (v67 == *(_QWORD *)(v1 + 280))
      break;
    *(_QWORD *)(v1 + 320) = v30;
    *(_QWORD *)(v1 + 328) = v33;
    *(_QWORD *)(v1 + 304) = v32;
    *(_QWORD *)(v1 + 312) = v31;
    *(_QWORD *)(v1 + 296) = v19;
    v87 = *(_QWORD *)(v1 + 256);
    if ((*(_QWORD *)(v1 + 264) & 0xC000000000000001) != 0)
      v88 = (void (*)(uint64_t, uint64_t))specialized _ArrayBuffer._getElementSlowPath(_:)(v67, v87);
    else
      v88 = (void (*)(uint64_t, uint64_t))*(id *)(v87 + 8 * v67 + 32);
    v31 = v88;
    *(_QWORD *)(v1 + 336) = v88;
    *(_QWORD *)(v1 + 344) = v67 + 1;
    if (!__OFADD__(v67, 1))
    {
      static Logger.historicalUsageWidgets.getter(v88);
      v92 = v31;
      v93 = Logger.logObject.getter(v92);
      v94 = static os_log_type_t.debug.getter();
      v95 = os_log_type_enabled(v93, v94);
      v96 = *(_QWORD *)(v1 + 232);
      v97 = *(_QWORD *)(v1 + 176);
      if (v95)
      {
        v154 = *(_QWORD *)(v1 + 176);
        v151 = *(_QWORD *)(v1 + 232);
        v98 = *(_QWORD *)(v1 + 168);
        v144 = *(_QWORD *)(v1 + 160);
        v145 = *(_QWORD *)(v1 + 152);
        v99 = swift_slowAlloc(32, -1);
        v149 = swift_slowAlloc(96, -1);
        v156 = v149;
        *(_DWORD *)v99 = 136315650;
        *(_QWORD *)(v1 + 120) = sub_10000F4DC(0xD000000000000017, 0x80000001000325F0, &v156);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 120, v1 + 128, v99 + 4, v99 + 12);
        *(_WORD *)(v99 + 12) = 2080;
        v100 = objc_msgSend(v92, "name");
        v101 = static String._unconditionallyBridgeFromObjectiveC(_:)(v100);
        typea = v94;
        v103 = v102;

        *(_QWORD *)(v1 + 128) = sub_10000F4DC(v101, v103, &v156);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 128, v1 + 136, v99 + 14, v99 + 22);
        swift_bridgeObjectRelease(v103);

        *(_WORD *)(v99 + 22) = 2080;
        v104 = objc_msgSend(v92, "uniqueIdentifier");
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        v106 = UUID.uuidString.getter(v105);
        v108 = v107;
        (*(void (**)(uint64_t, uint64_t))(v144 + 8))(v98, v145);
        *(_QWORD *)(v1 + 136) = sub_10000F4DC(v106, v108, &v156);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 136, v1 + 144, v99 + 24, v99 + 32);
        swift_bridgeObjectRelease(v108);

        _os_log_impl((void *)&_mh_execute_header, v93, typea, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v99, 0x20u);
        swift_arrayDestroy(v149, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v149, -1, -1);
        swift_slowDealloc(v99, -1, -1);

        v33(v151, v154);
      }
      else
      {

        v33(v96, v97);
      }
      v110 = *(_QWORD *)(v1 + 160);
      v109 = *(_QWORD *)(v1 + 168);
      v111 = *(_QWORD *)(v1 + 152);
      v112 = objc_msgSend(v92, "uniqueIdentifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v114 = UUID.uuidString.getter(v113);
      v116 = v115;
      v117 = *(void (**)(uint64_t, uint64_t))(v110 + 8);
      *(_QWORD *)(v1 + 352) = v117;
      v117(v109, v111);
      v118 = (_QWORD *)swift_task_alloc(async function pointer to EnergySite.__allocating_init(clientProvidedID:)[1]);
      *(_QWORD *)(v1 + 360) = v118;
      *v118 = v1;
      v118[1] = sub_10001AF08;
      return EnergySite.__allocating_init(clientProvidedID:)(v114, v116);
    }
    __break(1u);
LABEL_48:
    v3 = sub_100026E30(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
  }
  v73 = v1 + 16;
  v74 = (uint64_t *)(v1 + 48);
  v75 = swift_bridgeObjectRelease_n(*(_QWORD *)(v1 + 256), 2);
  v76 = *(_QWORD *)(v1 + 48);
  static Logger.historicalUsageWidgets.getter(v75);
  v77 = swift_bridgeObjectRetain();
  v78 = Logger.logObject.getter(v77);
  v79 = static os_log_type_t.default.getter();
  v80 = os_log_type_enabled(v78, v79);
  v81 = *(void (**)(uint64_t, uint64_t))(v1 + 272);
  v82 = *(_QWORD *)(v1 + 200);
  v83 = *(_QWORD *)(v1 + 176);
  if (v80)
  {
    v146 = *(_QWORD *)(v1 + 176);
    v84 = swift_slowAlloc(22, -1);
    v85 = swift_slowAlloc(32, -1);
    v156 = v85;
    *(_DWORD *)v84 = 136315394;
    *(_QWORD *)(v1 + 72) = sub_10000F4DC(0xD000000000000017, 0x80000001000325F0, &v156);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 72, v1 + 80, v84 + 4, v84 + 12);
    *(_WORD *)(v84 + 12) = 2048;
    *(_QWORD *)(v1 + 80) = *(_QWORD *)(v76 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 80, v1 + 88, v84 + 14, v84 + 22);
    swift_bridgeObjectRelease(v76);
    _os_log_impl((void *)&_mh_execute_header, v78, v79, "%s Found %ld home(s) with an onboarded utility)", (uint8_t *)v84, 0x16u);
    swift_arrayDestroy(v85, 1, (char *)&type metadata for Any + 8);
    v86 = v85;
    v73 = v1 + 16;
    swift_slowDealloc(v86, -1, -1);
    swift_slowDealloc(v84, -1, -1);

    v81(v82, v146);
  }
  else
  {
    swift_bridgeObjectRelease(v76);

    v81(v82, v83);
  }
  v89 = (char **)(v1 + 56);
  swift_beginAccess(v1 + 48, v73, 0, 0);
  v90 = *v74;
  if (*(_QWORD *)(*v74 + 16))
  {
    sub_100018978(v90);
    v91 = *v89;
  }
  else
  {
    v120 = swift_bridgeObjectRelease(v90);
    v121 = static Logger.historicalUsageWidgets.getter(v120);
    v122 = Logger.logObject.getter(v121);
    v123 = static os_log_type_t.default.getter();
    v124 = os_log_type_enabled(v122, v123);
    v125 = *(void (**)(uint64_t, uint64_t))(v1 + 272);
    v126 = *(_QWORD *)(v1 + 192);
    v127 = *(_QWORD *)(v1 + 176);
    if (v124)
    {
      v155 = *(void (**)(uint64_t, uint64_t))(v1 + 272);
      v152 = *(_QWORD *)(v1 + 192);
      v128 = (uint8_t *)swift_slowAlloc(12, -1);
      v129 = swift_slowAlloc(32, -1);
      v156 = v129;
      *(_DWORD *)v128 = 136315138;
      *(_QWORD *)(v1 + 64) = sub_10000F4DC(0xD000000000000017, 0x80000001000325F0, &v156);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 64, v1 + 72, v128 + 4, v128 + 12);
      _os_log_impl((void *)&_mh_execute_header, v122, v123, "%s No onboarded homes found! (returning error SiteDetail: <NO ONBOARDED HOMES ERROR>)", v128, 0xCu);
      swift_arrayDestroy(v129, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v129, -1, -1);
      swift_slowDealloc(v128, -1, -1);

      v155(v152, v127);
    }
    else
    {

      v125(v126, v127);
    }
    v91 = *v89;
    if ((swift_isUniquelyReferenced_nonNull_native(*v89) & 1) == 0)
      v91 = sub_100026E30(0, *((_QWORD *)v91 + 2) + 1, 1, v91);
    v131 = *((_QWORD *)v91 + 2);
    v130 = *((_QWORD *)v91 + 3);
    if (v131 >= v130 >> 1)
      v91 = sub_100026E30((char *)(v130 > 1), v131 + 1, 1, v91);
    *((_QWORD *)v91 + 2) = v131 + 1;
    v132 = &v91[56 * v131];
    *((_QWORD *)v132 + 4) = 0xD00000000000001ALL;
    *((_QWORD *)v132 + 5) = 0x80000001000325D0;
    *((_QWORD *)v132 + 6) = 0;
    *((_QWORD *)v132 + 7) = 0xE000000000000000;
    *((_QWORD *)v132 + 8) = 0;
    *((_QWORD *)v132 + 9) = 0xE000000000000000;
    v132[80] = 0;
  }
  v133 = *(_QWORD *)(v1 + 232);
  v135 = *(_QWORD *)(v1 + 216);
  v134 = *(_QWORD *)(v1 + 224);
  v137 = *(_QWORD *)(v1 + 200);
  v136 = *(_QWORD *)(v1 + 208);
  v138 = *(_QWORD *)(v1 + 192);
  v139 = *(_QWORD *)(v1 + 168);
  swift_task_dealloc(*(_QWORD *)(v1 + 240));
  swift_task_dealloc(v133);
  swift_task_dealloc(v134);
  swift_task_dealloc(v135);
  swift_task_dealloc(v136);
  swift_task_dealloc(v137);
  swift_task_dealloc(v138);
  swift_task_dealloc(v139);
  return (*(uint64_t (**)(char *))(v1 + 8))(v91);
}

uint64_t sub_10001BE78(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (__cdecl *v6)();

  v1[6] = a1;
  v2 = type metadata accessor for Logger(0);
  v1[7] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[8] = v3;
  v1[9] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (uint64_t (__cdecl *)())((char *)&dword_10003D038 + dword_10003D038);
  v4 = (_QWORD *)swift_task_alloc(unk_10003D03C);
  v1[10] = v4;
  *v4 = v1;
  v4[1] = sub_10001BEFC;
  return v6();
}

uint64_t sub_10001BEFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  *(_QWORD *)(*(_QWORD *)v1 + 88) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10001BF58, 0, 0);
}

uint64_t sub_10001BF58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t type;
  NSObject *log;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[2];

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  v3 = sub_100019E40(v2, v1);
  swift_bridgeObjectRelease(v1);
  v4 = swift_bridgeObjectRelease(v2);
  static Logger.historicalUsageWidgets.getter(v4);
  swift_bridgeObjectRetain_n(v3, 4);
  swift_bridgeObjectRetain_n(v1, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v27 = *(_QWORD *)(v0 + 64);
    v8 = *(_QWORD *)(v0 + 48);
    v28 = *(_QWORD *)(v0 + 56);
    v29 = *(_QWORD *)(v0 + 72);
    log = v6;
    v9 = swift_slowAlloc(42, -1);
    v26 = swift_slowAlloc(96, -1);
    v30[0] = v26;
    *(_DWORD *)v9 = 136315906;
    *(_QWORD *)(v0 + 16) = sub_10000F4DC(0x7365697469746E65, 0xEE00293A726F6628, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v9 + 4, v9 + 12);
    *(_WORD *)(v9 + 12) = 2080;
    v10 = swift_bridgeObjectRetain();
    type = v7;
    v11 = Array.description.getter(v10, &type metadata for String);
    v13 = v12;
    swift_bridgeObjectRelease(v8);
    *(_QWORD *)(v0 + 24) = sub_10000F4DC(v11, v13, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v9 + 14, v9 + 22);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease_n(v8, 2);
    *(_WORD *)(v9 + 22) = 2048;
    v14 = *(_QWORD *)(v3 + 16);
    swift_bridgeObjectRelease(v3);
    *(_QWORD *)(v0 + 32) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v9 + 24, v9 + 32);
    swift_bridgeObjectRelease(v3);
    *(_WORD *)(v9 + 32) = 2080;
    v15 = swift_bridgeObjectRetain();
    v16 = Array.description.getter(v15, &type metadata for SiteDetail);
    v18 = v17;
    swift_bridgeObjectRelease(v3);
    *(_QWORD *)(v0 + 40) = sub_10000F4DC(v16, v18, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v9 + 34, v9 + 42);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease_n(v3, 2);
    _os_log_impl((void *)&_mh_execute_header, log, type, "%s filtering for utility onboarded homes with these IDs: %s, FOUND %ld: %s", (uint8_t *)v9, 0x2Au);
    swift_arrayDestroy(v26, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v28);
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 64);
    v19 = *(_QWORD *)(v0 + 72);
    v22 = *(_QWORD *)(v0 + 48);
    v21 = *(_QWORD *)(v0 + 56);
    swift_bridgeObjectRelease_n(v3, 4);
    swift_bridgeObjectRelease_n(v22, 2);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 72));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_10001C294()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (__cdecl *v5)();

  v1 = type metadata accessor for Logger(0);
  v0[4] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[5] = v2;
  v0[6] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (uint64_t (__cdecl *)())((char *)&dword_10003D038 + dword_10003D038);
  v3 = (_QWORD *)swift_task_alloc(unk_10003D03C);
  v0[7] = v3;
  *v3 = v0;
  v3[1] = sub_10001C314;
  return v5();
}

uint64_t sub_10001C314(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10001C370, 0, 0);
}

uint64_t sub_10001C370(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(v1 + 64);
  static Logger.historicalUsageWidgets.getter(a1);
  swift_bridgeObjectRetain_n(v2, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v1 + 64);
    v17 = *(_QWORD *)(v1 + 40);
    v18 = *(_QWORD *)(v1 + 32);
    v19 = *(_QWORD *)(v1 + 48);
    v7 = swift_slowAlloc(22, -1);
    v16 = swift_slowAlloc(64, -1);
    v20 = v16;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v1 + 16) = sub_10000F4DC(0xD000000000000013, 0x8000000100031F30, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2080;
    v8 = swift_bridgeObjectRetain();
    v9 = Array.description.getter(v8, &type metadata for SiteDetail);
    v11 = v10;
    swift_bridgeObjectRelease(v6);
    *(_QWORD *)(v1 + 24) = sub_10000F4DC(v9, v11, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease_n(v6, 2);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s returning all utility onboarded homes: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v16, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    v13 = *(_QWORD *)(v1 + 40);
    v12 = *(_QWORD *)(v1 + 48);
    v14 = *(_QWORD *)(v1 + 32);
    swift_bridgeObjectRelease_n(*(_QWORD *)(v1 + 64), 2);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc(*(_QWORD *)(v1 + 48));
  return (*(uint64_t (**)(_QWORD))(v1 + 8))(*(_QWORD *)(v1 + 64));
}

uint64_t sub_10001C5A0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (__cdecl *v6)();

  v1[4] = a1;
  v2 = type metadata accessor for Logger(0);
  v1[5] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[6] = v3;
  v1[7] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (uint64_t (__cdecl *)())((char *)&dword_10003D030 + dword_10003D030);
  v4 = (_QWORD *)swift_task_alloc(unk_10003D034);
  v1[8] = v4;
  *v4 = v1;
  v4[1] = sub_10001C624;
  return v6();
}

uint64_t sub_10001C624(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 64);
  *(_QWORD *)(*(_QWORD *)v2 + 72) = a1;
  swift_task_dealloc(v3);
  if (v1)
  {
    swift_errorRelease(v1);
    v4 = sub_10001CA1C;
  }
  else
  {
    v4 = sub_10001C698;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_10001C698()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  os_log_type_t v28;
  os_log_t log;
  uint64_t v30;
  uint64_t v31;

  v1 = *(_QWORD *)(v0 + 72);
  if (*(_QWORD *)(v1 + 16))
  {
    v3 = *(_QWORD *)(v1 + 32);
    v2 = *(_QWORD *)(v1 + 40);
    v5 = *(_QWORD *)(v1 + 48);
    v4 = *(_QWORD *)(v1 + 56);
    v6 = *(_QWORD *)(v1 + 64);
    v7 = *(_QWORD *)(v1 + 72);
    v8 = *(_BYTE *)(v1 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = swift_bridgeObjectRelease(v1);
  }
  else
  {
    v9 = swift_bridgeObjectRelease(*(_QWORD *)(v0 + 72));
    v3 = 0;
    v2 = 0;
    v5 = 0;
    v4 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
  static Logger.historicalUsageWidgets.getter(v9);
  sub_10001CD08(v3, v2, v5, v4, v6, v7);
  v10 = sub_10001CD08(v3, v2, v5, v4, v6, v7);
  v11 = v7;
  v12 = Logger.logObject.getter(v10);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v28 = v13;
    v25 = v4;
    v14 = v3;
    v15 = swift_slowAlloc(22, -1);
    v27 = swift_slowAlloc(64, -1);
    v31 = v27;
    *(_DWORD *)v15 = 136315394;
    *(_QWORD *)(v0 + 16) = sub_10000F4DC(0x52746C7561666564, 0xEF2928746C757365, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v15 + 4, v15 + 12);
    *(_WORD *)(v15 + 12) = 2080;
    if (v2)
    {
      v16 = v11;
      swift_bridgeObjectRetain();
      v17 = v6;
    }
    else
    {
      v16 = 0xE500000000000000;
      v17 = 0x3E6C696E3CLL;
    }
    v26 = *(_QWORD *)(v0 + 56);
    v23 = *(_QWORD *)(v0 + 48);
    v24 = *(_QWORD *)(v0 + 40);
    *(_QWORD *)(v0 + 24) = sub_10000F4DC(v17, v16, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v15 + 14, v15 + 22);
    swift_bridgeObjectRelease(v16);
    v3 = v14;
    v20 = v14;
    v4 = v25;
    sub_10000FB1C(v20, v2, v5, v25, v6, v11);
    sub_10000FB1C(v3, v2, v5, v25, v6, v11);
    _os_log_impl((void *)&_mh_execute_header, v12, v28, "%s returning: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v27, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v26, v24);
    v19 = v11;
  }
  else
  {
    v18 = *(_QWORD *)(v0 + 48);
    log = *(os_log_t *)(v0 + 40);
    v30 = *(_QWORD *)(v0 + 56);
    sub_10000FB1C(v3, v2, v5, v4, v6, v11);
    sub_10000FB1C(v3, v2, v5, v4, v6, v11);

    (*(void (**)(uint64_t, os_log_t))(v18 + 8))(v30, log);
    v19 = v11;
  }
  v21 = *(_QWORD *)(v0 + 32);
  swift_task_dealloc(*(_QWORD *)(v0 + 56));
  *(_QWORD *)v21 = v3;
  *(_QWORD *)(v21 + 8) = v2;
  *(_QWORD *)(v21 + 16) = v5;
  *(_QWORD *)(v21 + 24) = v4;
  *(_QWORD *)(v21 + 32) = v6;
  *(_QWORD *)(v21 + 40) = v19;
  *(_BYTE *)(v21 + 48) = v8;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001CA1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  static Logger.historicalUsageWidgets.getter(a1);
  sub_10001CD08(0, 0, 0, 0, 0, 0);
  v2 = sub_10001CD08(0, 0, 0, 0, 0, 0);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc(22, -1);
    v6 = swift_slowAlloc(64, -1);
    v15 = v6;
    *(_DWORD *)v5 = 136315394;
    *(_QWORD *)(v1 + 16) = sub_10000F4DC(0x52746C7561666564, 0xEF2928746C757365, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v5 + 4, v5 + 12);
    *(_WORD *)(v5 + 12) = 2080;
    v7 = *(_QWORD *)(v1 + 48);
    v14 = *(_QWORD *)(v1 + 56);
    v8 = *(_QWORD *)(v1 + 40);
    *(_QWORD *)(v1 + 24) = sub_10000F4DC(0x3E6C696E3CLL, 0xE500000000000000, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v5 + 14, v5 + 22);
    swift_bridgeObjectRelease(0xE500000000000000);
    sub_10000FB1C(0, 0, 0, 0, 0, 0);
    sub_10000FB1C(0, 0, 0, 0, 0, 0);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s returning: %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy(v6, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v14, v8);
  }
  else
  {
    v10 = *(_QWORD *)(v1 + 48);
    v9 = *(_QWORD *)(v1 + 56);
    v11 = *(_QWORD *)(v1 + 40);
    sub_10000FB1C(0, 0, 0, 0, 0, 0);
    sub_10000FB1C(0, 0, 0, 0, 0, 0);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  v12 = *(_QWORD *)(v1 + 32);
  swift_task_dealloc(*(_QWORD *)(v1 + 56));
  *(_BYTE *)(v12 + 48) = 0;
  *(_OWORD *)(v12 + 16) = 0u;
  *(_OWORD *)(v12 + 32) = 0u;
  *(_OWORD *)v12 = 0u;
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10001CCC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005E18(&qword_10003D018);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001CD08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRetain(a6);
  }
  return result;
}

unint64_t sub_10001CD44()
{
  unint64_t result;

  result = qword_10003D050;
  if (!qword_10003D050)
  {
    result = swift_getWitnessTable(&unk_100031210, &type metadata for HistoricalUsageWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_10003D050);
  }
  return result;
}

HomeEnergyWidgetsExtension::EnergyForecastWidget __swiftcall EnergyForecastWidget.init()()
{
  void *v0;
  uint64_t v1;
  HomeEnergyWidgetsExtension::EnergyForecastWidget result;

  v0 = (void *)0x8000000100031660;
  v1 = 0xD000000000000014;
  result.kind._object = v0;
  result.kind._countAndFlagsBits = v1;
  return result;
}

uint64_t sub_10001CDA4()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics("");
  byte_10003D540 = result;
  return result;
}

uint64_t sub_10001CDC8@<X0>(uint64_t a1@<X8>)
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (**v30)(char *, os_log_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  os_log_type_t v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  os_log_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(char *, uint64_t);
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t OpaqueTypeConformance2;
  void (**v135)(char *, os_log_t, uint64_t);
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  void (**v140)(char *, os_log_t, uint64_t);
  uint64_t v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void (*v156)(char *, uint64_t, uint64_t);
  char *v157;
  char *v158;
  uint64_t v159;
  char *v160;
  char *v161;
  uint64_t v162;
  char *v163;
  char *v164;
  unint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  os_log_t v177;
  uint64_t v178;
  uint64_t v179;
  void (**v180)(char *, os_log_t, uint64_t);
  char *v181;
  uint64_t v182;
  char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  char *v193;
  char *v194;
  char *v195;
  char *v196;
  char *v197;
  uint64_t v198;
  os_log_t v199;
  char *v200;
  char *v201;
  uint64_t v202;
  char *v203;
  void (**v204)(char *, os_log_t, uint64_t);
  uint64_t v205;
  char *v206;
  char *v207;
  char *v208;
  char *v209;
  uint64_t v210;
  char *v211;
  uint64_t v212;
  char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  char *v220;
  uint64_t v221;
  char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  char *v232;
  uint64_t v233;
  char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  char *v242;
  void *v243;
  uint64_t v244;
  void *v245;
  uint64_t v246;
  uint64_t v247;
  char v248[8];

  v239 = a1;
  v2 = sub_100005E18(&qword_10003D130);
  __chkstk_darwin(v2);
  v200 = (char *)&v191 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v224 = type metadata accessor for EnergyWindows(0);
  v223 = *(_QWORD *)(v224 - 8);
  __chkstk_darwin(v224);
  v197 = (char *)&v191 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005E18(&qword_10003D138);
  __chkstk_darwin(v5);
  v195 = (char *)&v191 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v219 = type metadata accessor for Date(0);
  v218 = *(_QWORD *)(v219 - 8);
  v7 = __chkstk_darwin(v219);
  v194 = (char *)&v191 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v193 = (char *)&v191 - v9;
  v221 = type metadata accessor for RectangularLockEnergyForecastView(0);
  v198 = *(_QWORD *)(v221 - 8);
  __chkstk_darwin(v221);
  v196 = (char *)&v191 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v233 = sub_100005E18(&qword_10003D140);
  v202 = *(_QWORD *)(v233 - 8);
  __chkstk_darwin(v233);
  v201 = (char *)&v191 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v235 = sub_100005E18(&qword_10003D148);
  v204 = *(void (***)(char *, os_log_t, uint64_t))(v235 - 8);
  v12 = __chkstk_darwin(v235);
  v199 = (os_log_t)((char *)&v191 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v12);
  v203 = (char *)&v191 - v14;
  v237 = sub_100005E18(&qword_10003D150);
  __chkstk_darwin(v237);
  v238 = (uint64_t)&v191 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v231 = sub_100005E18(&qword_10003D158);
  __chkstk_darwin(v231);
  v232 = (char *)&v191 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v236 = sub_100005E18(&qword_10003D160);
  __chkstk_darwin(v236);
  v234 = (char *)&v191 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for ContainerBackgroundPlacement(0);
  v228 = *(_QWORD *)(v18 - 8);
  v229 = v18;
  __chkstk_darwin(v18);
  v226 = (char *)&v191 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100005E18(&qword_10003CC50);
  __chkstk_darwin(v20);
  v220 = (char *)&v191 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_100005E18(&qword_10003CF10);
  __chkstk_darwin(v22);
  v208 = (char *)&v191 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_100005E18(&qword_10003D168);
  __chkstk_darwin(v24);
  v207 = (char *)&v191 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v225 = type metadata accessor for GridForecastWidgetView(0);
  v210 = *(_QWORD *)(v225 - 8);
  __chkstk_darwin(v225);
  v209 = (char *)&v191 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v227 = sub_100005E18(&qword_10003D170);
  v212 = *(_QWORD *)(v227 - 8);
  __chkstk_darwin(v227);
  v211 = (char *)&v191 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v230 = sub_100005E18(&qword_10003D178);
  v214 = *(_QWORD *)(v230 - 8);
  v28 = __chkstk_darwin(v230);
  v30 = (void (**)(char *, os_log_t, uint64_t))((char *)&v191 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v28);
  v213 = (char *)&v191 - v31;
  v32 = type metadata accessor for EnergyForecastWidgetEntryView(0);
  v33 = __chkstk_darwin(v32);
  v192 = (uint64_t)&v191 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __chkstk_darwin(v33);
  v191 = (uint64_t)&v191 - v36;
  v37 = __chkstk_darwin(v35);
  v39 = (char *)&v191 - v38;
  __chkstk_darwin(v37);
  v41 = (char *)&v191 - v40;
  v216 = type metadata accessor for Logger(0);
  v215 = *(_QWORD *)(v216 - 8);
  v42 = __chkstk_darwin(v216);
  v44 = (char *)&v191 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v42);
  v46 = (char *)&v191 - v45;
  v47 = type metadata accessor for WidgetFamily(0);
  v48 = *(char **)(v47 - 8);
  v49 = __chkstk_darwin(v47);
  v206 = (char *)&v191 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __chkstk_darwin(v49);
  v205 = (uint64_t)&v191 - v52;
  __chkstk_darwin(v51);
  v54 = (char *)&v191 - v53;
  v217 = v32;
  v55 = *(int *)(v32 + 20);
  v240 = v1;
  v56 = (char *)(v1 + v55);
  sub_10000F090((uint64_t)&v191 - v53);
  v222 = v48;
  v57 = (*((uint64_t (**)(char *, uint64_t))v48 + 11))(v54, v47);
  if ((_DWORD)v57 == enum case for WidgetFamily.systemSmall(_:)
    || (_DWORD)v57 == enum case for WidgetFamily.systemMedium(_:))
  {
    LODWORD(v202) = enum case for WidgetFamily.systemSmall(_:);
    v203 = v56;
    v204 = v30;
    static Logger.gridForecastWidgets.getter(v57);
    v82 = v240;
    sub_10000FC40(v240, (uint64_t)v41, type metadata accessor for EnergyForecastWidgetEntryView);
    v83 = sub_10000FC40(v82, (uint64_t)v39, type metadata accessor for EnergyForecastWidgetEntryView);
    v84 = Logger.logObject.getter(v83);
    v85 = static os_log_type_t.default.getter();
    v86 = v85;
    if (os_log_type_enabled(v84, v85))
    {
      v87 = swift_slowAlloc(22, -1);
      v201 = (char *)swift_slowAlloc(64, -1);
      v242 = v201;
      *(_DWORD *)v87 = 136315394;
      v88 = v217;
      LODWORD(v200) = v86;
      type metadata accessor for GridForecastEntry(0);
      v89 = sub_10000C440(&qword_10003D198, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
      v199 = v84;
      v90 = v219;
      v91 = dispatch thunk of CustomStringConvertible.description.getter(v219, v89);
      v93 = v92;
      v247 = sub_10000F4DC(v91, v92, (uint64_t *)&v242);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v247, v248, v87 + 4, v87 + 12);
      swift_bridgeObjectRelease(v93);
      sub_100020AFC((uint64_t)v41, type metadata accessor for EnergyForecastWidgetEntryView);
      *(_WORD *)(v87 + 12) = 2080;
      v94 = type metadata accessor for GridForecastSnapshot(0);
      v95 = sub_10000C440(&qword_10003D1A0, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastSnapshot, (uint64_t)&protocol conformance descriptor for GridForecastSnapshot);
      v96 = dispatch thunk of CustomStringConvertible.description.getter(v94, v95);
      v98 = v97;
      v247 = sub_10000F4DC(v96, v97, (uint64_t *)&v242);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v247, v248, v87 + 14, v87 + 22);
      swift_bridgeObjectRelease(v98);
      sub_100020AFC((uint64_t)v39, type metadata accessor for EnergyForecastWidgetEntryView);
      v99 = v199;
      _os_log_impl((void *)&_mh_execute_header, v199, (os_log_type_t)v200, "EnergyForecastWidgetEntryView: creating systemSmall/systemMedium widget for %s w/ forecastSnapshot %s", (uint8_t *)v87, 0x16u);
      v100 = v201;
      swift_arrayDestroy(v201, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v100, -1, -1);
      swift_slowDealloc(v87, -1, -1);

      v101 = (*(uint64_t (**)(char *, uint64_t))(v215 + 8))(v46, v216);
    }
    else
    {
      sub_100020AFC((uint64_t)v41, type metadata accessor for EnergyForecastWidgetEntryView);
      sub_100020AFC((uint64_t)v39, type metadata accessor for EnergyForecastWidgetEntryView);

      v101 = (*(uint64_t (**)(char *, uint64_t))(v215 + 8))(v46, v216);
      v90 = v219;
      v88 = v217;
    }
    v219 = static HEUIDate.numHoursToDisplayInAppGridForecast.getter(v101);
    v102 = static HEUIDate.numHoursToDisplayInSmallWidget.getter();
    v103 = v240 + *(int *)(v88 + 24);
    v104 = v207;
    ((void (*)(void))GridForecastSnapshot.energyWindows.getter)();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v223 + 56))(v104, 0, 1, v224);
    v105 = type metadata accessor for GridForecastSnapshot(0);
    v245 = (void *)v105;
    v246 = sub_10000C440(&qword_10003D1A8, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastSnapshot, (uint64_t)&protocol conformance descriptor for GridForecastSnapshot);
    v106 = sub_10000FDA4(&v242);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v105 - 8) + 16))(v106, v103, v105);
    v107 = v103 + *(int *)(type metadata accessor for GridForecastEntry(0) + 24);
    v108 = v218;
    v109 = v208;
    (*(void (**)(char *, uint64_t, uint64_t))(v218 + 16))(v208, v107, v90);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v108 + 56))(v109, 0, 1, v90);
    v110 = v205;
    sub_10000F090(v205);
    v111 = v222;
    v112 = v206;
    (*((void (**)(char *, _QWORD, uint64_t))v222 + 13))(v206, v202, v47);
    v113 = sub_10000C440(&qword_10003D1B0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t)&protocol conformance descriptor for WidgetFamily);
    dispatch thunk of RawRepresentable.rawValue.getter(&v247, v47, v113);
    dispatch thunk of RawRepresentable.rawValue.getter(&v241, v47, v113);
    v114 = v247;
    v115 = v241;
    v116 = (void (*)(char *, uint64_t))*((_QWORD *)v111 + 1);
    v116(v112, v47);
    v116((char *)v110, v47);
    if (v114 == v115)
      v117 = v102;
    else
      v117 = v219;
    v118 = sub_10001EC70();
    v119 = v209;
    GridForecastWidgetView.init(energyWindows:forecastUIProvider:referenceTime:numHoursToDisplay:debugText:)(v104, &v242, v109, v117, 0, v118, v120);
    v121 = sub_10001E294();
    v123 = v122;
    v124 = (uint64_t)v220;
    URL.init(string:)(v121);
    swift_bridgeObjectRelease(v123);
    v125 = sub_10000C440(&qword_10003D188, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastWidgetView, (uint64_t)&protocol conformance descriptor for GridForecastWidgetView);
    v126 = v211;
    v127 = v225;
    View.widgetURL(_:)(v124, v225, v125);
    sub_10000C404(v124, &qword_10003CC50);
    v128 = (*(uint64_t (**)(char *, uint64_t))(v210 + 8))(v119, v127);
    v129 = v226;
    v130 = static ContainerBackgroundPlacement.widget.getter(v128);
    v131 = static Alignment.center.getter(v130);
    v133 = v132;
    v242 = (char *)v127;
    v243 = (void *)v125;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v242, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v135 = v204;
    v136 = v133;
    v137 = v227;
    View.containerBackground<A>(for:alignment:content:)(v129, v131, v136, nullsub_1, 0, v227, &type metadata for EmptyView, OpaqueTypeConformance2, &protocol witness table for EmptyView);
    (*(void (**)(char *, uint64_t))(v228 + 8))(v129, v229);
    (*(void (**)(char *, uint64_t))(v212 + 8))(v126, v137);
    v138 = v214;
    v139 = v213;
    v140 = v135;
    v141 = v230;
    (*(void (**)(char *, _QWORD, uint64_t))(v214 + 32))(v213, v140, v230);
    v142 = v232;
    (*(void (**)(char *, char *, uint64_t))(v138 + 16))(v232, v139, v141);
    swift_storeEnumTagMultiPayload(v142, v231, 0);
    v242 = (char *)v137;
    v243 = &type metadata for EmptyView;
    v244 = OpaqueTypeConformance2;
    v245 = &protocol witness table for EmptyView;
    v143 = swift_getOpaqueTypeConformance2(&v242, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
    v144 = sub_10000C440(&qword_10003D190, (uint64_t (*)(uint64_t))&type metadata accessor for RectangularLockEnergyForecastView, (uint64_t)&protocol conformance descriptor for RectangularLockEnergyForecastView);
    v242 = (char *)v221;
    v243 = (void *)v144;
    v145 = swift_getOpaqueTypeConformance2(&v242, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v242 = (char *)v233;
    v243 = &type metadata for EmptyView;
    v244 = v145;
    v245 = &protocol witness table for EmptyView;
    v146 = swift_getOpaqueTypeConformance2(&v242, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
    v147 = (uint64_t)v234;
    _ConditionalContent<>.init(storage:)(v142, v141, v235, v143, v146);
    v148 = v238;
    sub_1000208CC(v147, v238);
    swift_storeEnumTagMultiPayload(v148, v237, 0);
    v149 = sub_100020768();
    _ConditionalContent<>.init(storage:)(v148, v236, &type metadata for EmptyView, v149, &protocol witness table for EmptyView);
    sub_10000C404(v147, &qword_10003D160);
    return (*(uint64_t (**)(char *, uint64_t))(v138 + 8))(v139, v141);
  }
  else if ((_DWORD)v57 == enum case for WidgetFamily.accessoryRectangular(_:))
  {
    v58 = v44;
    static Logger.gridForecastWidgets.getter(v57);
    v59 = v240;
    v60 = v191;
    sub_10000FC40(v240, v191, type metadata accessor for EnergyForecastWidgetEntryView);
    v61 = v192;
    v62 = sub_10000FC40(v59, v192, type metadata accessor for EnergyForecastWidgetEntryView);
    v63 = Logger.logObject.getter(v62);
    v64 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = swift_slowAlloc(22, -1);
      v214 = swift_slowAlloc(64, -1);
      v242 = (char *)v214;
      *(_DWORD *)v65 = 136315394;
      v222 = v58;
      v66 = v217;
      type metadata accessor for GridForecastEntry(0);
      v67 = sub_10000C440(&qword_10003D198, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
      v68 = v60;
      v69 = v219;
      v70 = dispatch thunk of CustomStringConvertible.description.getter(v219, v67);
      v72 = v71;
      v247 = sub_10000F4DC(v70, v71, (uint64_t *)&v242);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v247, v248, v65 + 4, v65 + 12);
      swift_bridgeObjectRelease(v72);
      sub_100020AFC(v68, type metadata accessor for EnergyForecastWidgetEntryView);
      *(_WORD *)(v65 + 12) = 2080;
      v73 = type metadata accessor for GridForecastSnapshot(0);
      v74 = sub_10000C440(&qword_10003D1A0, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastSnapshot, (uint64_t)&protocol conformance descriptor for GridForecastSnapshot);
      v75 = dispatch thunk of CustomStringConvertible.description.getter(v73, v74);
      v77 = v76;
      v247 = sub_10000F4DC(v75, v76, (uint64_t *)&v242);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v247, v248, v65 + 14, v65 + 22);
      swift_bridgeObjectRelease(v77);
      sub_100020AFC(v61, type metadata accessor for EnergyForecastWidgetEntryView);
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "EnergyForecastWidgetEntryView: creating accessoryRectangular widget for %s w/ forecastSnapshot %s", (uint8_t *)v65, 0x16u);
      v78 = v214;
      swift_arrayDestroy(v214, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v78, -1, -1);
      swift_slowDealloc(v65, -1, -1);

      (*(void (**)(char *, uint64_t))(v215 + 8))(v222, v216);
      v79 = v221;
      v80 = (uint64_t)v220;
      v81 = v218;
    }
    else
    {
      sub_100020AFC(v60, type metadata accessor for EnergyForecastWidgetEntryView);
      sub_100020AFC(v61, type metadata accessor for EnergyForecastWidgetEntryView);

      (*(void (**)(char *, uint64_t))(v215 + 8))(v58, v216);
      v79 = v221;
      v80 = (uint64_t)v220;
      v69 = v219;
      v81 = v218;
      v66 = v217;
    }
    v153 = v240 + *(int *)(v66 + 24);
    v154 = type metadata accessor for GridForecastEntry(0);
    v155 = v153 + *(int *)(v154 + 24);
    v156 = *(void (**)(char *, uint64_t, uint64_t))(v81 + 16);
    v157 = v193;
    v156(v193, v155, v69);
    v158 = v194;
    v159 = ((uint64_t (*)(char *, uint64_t, uint64_t))v156)(v194, v153 + *(int *)(v154 + 28), v69);
    v160 = v197;
    GridForecastSnapshot.energyWindows.getter(v159);
    v161 = v195;
    EnergyWindows.energyWindowForDate(referenceDate:)(v155);
    v162 = (*(uint64_t (**)(char *, uint64_t))(v223 + 8))(v160, v224);
    v163 = v200;
    GridForecastSnapshot.error.getter(v162);
    v164 = v196;
    RectangularLockEnergyForecastView.init(referenceDate:widgetStartDate:energyWindow:gridForecastError:)(v157, v158, v161, v163);
    v165 = sub_10001E294();
    v167 = v166;
    URL.init(string:)(v165);
    swift_bridgeObjectRelease(v167);
    v168 = sub_10000C440(&qword_10003D190, (uint64_t (*)(uint64_t))&type metadata accessor for RectangularLockEnergyForecastView, (uint64_t)&protocol conformance descriptor for RectangularLockEnergyForecastView);
    v169 = v201;
    View.widgetURL(_:)(v80, v79, v168);
    sub_10000C404(v80, &qword_10003CC50);
    v170 = (*(uint64_t (**)(char *, uint64_t))(v198 + 8))(v164, v79);
    v171 = v226;
    v172 = static ContainerBackgroundPlacement.widget.getter(v170);
    v173 = static Alignment.center.getter(v172);
    v175 = v174;
    v242 = (char *)v79;
    v243 = (void *)v168;
    v176 = swift_getOpaqueTypeConformance2(&v242, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v177 = v199;
    v178 = v175;
    v179 = v233;
    View.containerBackground<A>(for:alignment:content:)(v171, v173, v178, nullsub_1, 0, v233, &type metadata for EmptyView, v176, &protocol witness table for EmptyView);
    (*(void (**)(char *, uint64_t))(v228 + 8))(v171, v229);
    (*(void (**)(char *, uint64_t))(v202 + 8))(v169, v179);
    v180 = v204;
    v181 = v203;
    v182 = v235;
    v204[4](v203, v177, v235);
    v183 = v232;
    v180[2](v232, (os_log_t)v181, v182);
    swift_storeEnumTagMultiPayload(v183, v231, 1);
    v184 = sub_10000C440(&qword_10003D188, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastWidgetView, (uint64_t)&protocol conformance descriptor for GridForecastWidgetView);
    v242 = (char *)v225;
    v243 = (void *)v184;
    v185 = swift_getOpaqueTypeConformance2(&v242, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v242 = (char *)v227;
    v243 = &type metadata for EmptyView;
    v244 = v185;
    v245 = &protocol witness table for EmptyView;
    v186 = swift_getOpaqueTypeConformance2(&v242, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
    v242 = (char *)v179;
    v243 = &type metadata for EmptyView;
    v244 = v176;
    v245 = &protocol witness table for EmptyView;
    v187 = swift_getOpaqueTypeConformance2(&v242, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
    v188 = (uint64_t)v234;
    _ConditionalContent<>.init(storage:)(v183, v230, v182, v186, v187);
    v189 = v238;
    sub_1000208CC(v188, v238);
    swift_storeEnumTagMultiPayload(v189, v237, 0);
    v190 = sub_100020768();
    _ConditionalContent<>.init(storage:)(v189, v236, &type metadata for EmptyView, v190, &protocol witness table for EmptyView);
    sub_10000C404(v188, &qword_10003D160);
    return ((uint64_t (*)(char *, uint64_t))v180[1])(v181, v182);
  }
  else
  {
    v151 = v238;
    swift_storeEnumTagMultiPayload(v238, v237, 1);
    v152 = sub_100020768();
    _ConditionalContent<>.init(storage:)(v151, v236, &type metadata for EmptyView, v152, &protocol witness table for EmptyView);
    return (*((uint64_t (**)(char *, uint64_t))v222 + 1))(v54, v47);
  }
}

unint64_t sub_10001E294()
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
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(_BYTE *, uint64_t);
  uint64_t v39;
  void (*v40)(_BYTE *, _BYTE *, uint64_t);
  void *v41;
  int v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  _BYTE *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  _BYTE *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE *v80;
  _BYTE *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  _BYTE v89[12];
  int v90;
  uint64_t v91;
  _BYTE *v92;
  _BYTE *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _BYTE *v97;
  uint64_t v98;
  void (*v99)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v100;
  _QWORD *v101;
  _BYTE *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105[3];
  uint64_t v106;
  unint64_t v107;

  v1 = sub_100005E18(&qword_10003CA98);
  __chkstk_darwin(v1);
  v97 = &v89[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for ForecastLocationEntity(0);
  v95 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v93 = &v89[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v103 = type metadata accessor for Logger(0);
  v101 = *(_QWORD **)(v103 - 8);
  v5 = __chkstk_darwin(v103);
  v100 = &v89[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __chkstk_darwin(v5);
  v9 = &v89[-v8];
  __chkstk_darwin(v7);
  v11 = &v89[-v10];
  v12 = type metadata accessor for GridForecastSnapshotType(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = &v89[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = __chkstk_darwin(v14);
  v19 = &v89[-v18];
  __chkstk_darwin(v17);
  v21 = &v89[-v20];
  v106 = 0;
  v107 = 0xE000000000000000;
  v94 = v0 + *(int *)(type metadata accessor for EnergyForecastWidgetEntryView(0) + 24);
  v22 = GridForecastSnapshot.type.getter();
  static Logger.gridForecastWidgets.getter(v22);
  v99 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v13 + 16);
  v23 = ((uint64_t (*)(_BYTE *, _BYTE *, uint64_t))v99)(v19, v21, v12);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.default.getter();
  v26 = v25;
  v27 = os_log_type_enabled(v24, v25);
  v102 = v21;
  v96 = v3;
  if (v27)
  {
    v28 = swift_slowAlloc(22, -1);
    v92 = v9;
    v29 = v28;
    v91 = swift_slowAlloc(64, -1);
    v105[0] = v91;
    *(_DWORD *)v29 = 136315394;
    v90 = v26;
    v104 = sub_10000F4DC(0x525568636E75616CLL, 0xE90000000000004CLL, v105);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, v105, v29 + 4, v29 + 12);
    *(_WORD *)(v29 + 12) = 2080;
    v30 = sub_10000C440(&qword_10003D1C0, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastSnapshotType, (uint64_t)&protocol conformance descriptor for GridForecastSnapshotType);
    v31 = dispatch thunk of CustomStringConvertible.description.getter(v12, v30);
    v33 = v32;
    v104 = sub_10000F4DC(v31, v32, v105);
    v21 = v102;
    v34 = v103;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, v105, v29 + 14, v29 + 22);
    swift_bridgeObjectRelease(v33);
    v35 = *(_QWORD **)(v13 + 8);
    ((void (*)(_BYTE *, uint64_t))v35)(v19, v12);
    _os_log_impl((void *)&_mh_execute_header, v24, (os_log_type_t)v90, "%s creating launchURL with snapshot type: %s", (uint8_t *)v29, 0x16u);
    v36 = v91;
    swift_arrayDestroy(v91, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1, -1);
    v37 = v29;
    v9 = v92;
    swift_slowDealloc(v37, -1, -1);

    v38 = (uint64_t (*)(_BYTE *, uint64_t))v101[1];
    v39 = v38(v11, v34);
  }
  else
  {
    v35 = *(_QWORD **)(v13 + 8);
    ((void (*)(_BYTE *, uint64_t))v35)(v19, v12);

    v38 = (uint64_t (*)(_BYTE *, uint64_t))v101[1];
    v34 = v103;
    v39 = v38(v11, v103);
  }
  v40 = v99;
  v41 = (void *)static EKLocation.invalidLocation.getter(v39);
  v40(v16, v21, v12);
  v42 = (*(uint64_t (**)(_BYTE *, uint64_t))(v13 + 88))(v16, v12);
  v101 = v35;
  v99 = (void (*)(_BYTE *, _BYTE *, uint64_t))v38;
  if (v42 == enum case for GridForecastSnapshotType.currentLocation(_:))
  {
    (*(void (**)(_BYTE *, uint64_t))(v13 + 96))(v16, v12);
    v43 = *(id *)v16;
    v98 = v12;
    if (v43)
    {

      v41 = v43;
    }
    goto LABEL_12;
  }
  if (v42 != enum case for GridForecastSnapshotType.fixedLocation(_:))
  {
    v98 = v12;
    ((void (*)(_BYTE *, uint64_t))v35)(v16, v12);
LABEL_12:
    v60 = sub_100005E18(&qword_10003CCA0);
    v61 = swift_allocObject(v60, 152, 7);
    *(_OWORD *)(v61 + 16) = xmmword_100030D40;
    *(_QWORD *)(v61 + 56) = &type metadata for String;
    v62 = sub_10000FBB8();
    *(_QWORD *)(v61 + 64) = v62;
    *(_QWORD *)(v61 + 32) = 0xD000000000000039;
    *(_QWORD *)(v61 + 40) = 0x8000000100032330;
    objc_msgSend(v41, "coordinate");
    *(_QWORD *)(v61 + 96) = &type metadata for Double;
    *(_QWORD *)(v61 + 104) = &protocol witness table for Double;
    *(_QWORD *)(v61 + 72) = v63;
    objc_msgSend(v41, "coordinate");
    *(_QWORD *)(v61 + 136) = &type metadata for Double;
    *(_QWORD *)(v61 + 144) = &protocol witness table for Double;
    *(_QWORD *)(v61 + 112) = v64;
    v65 = String.init(format:_:)(0xD00000000000001BLL, 0x8000000100032750, v61);
    v67 = v66;
    v68 = swift_allocObject(v60, 72, 7);
    *(_OWORD *)(v68 + 16) = xmmword_1000310E0;
    *(_QWORD *)(v68 + 56) = &type metadata for String;
    *(_QWORD *)(v68 + 64) = v62;
    *(_QWORD *)(v68 + 32) = 0xD000000000000039;
    *(_QWORD *)(v68 + 40) = 0x8000000100032330;
    v69 = String.init(format:_:)(v65, v67, v68);
    v71 = v70;
    v72 = swift_bridgeObjectRelease(v67);
    v73 = 2;
    v48 = v100;
LABEL_13:
    v106 = v69;
    v107 = v71;
    qword_10003D068 = v73;
    static Logger.gridForecastWidgets.getter(v72);
    swift_bridgeObjectRetain_n(v71, 2);
    v75 = Logger.logObject.getter(v74);
    v76 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v75, v76))
    {
      v77 = swift_slowAlloc(22, -1);
      v78 = swift_slowAlloc(64, -1);
      v105[0] = v78;
      *(_DWORD *)v77 = 136315394;
      v104 = sub_10000F4DC(0x525568636E75616CLL, 0xE90000000000004CLL, v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, v105, v77 + 4, v77 + 12);
      *(_WORD *)(v77 + 12) = 2080;
      swift_bridgeObjectRetain();
      v104 = sub_10000F4DC(v69, v71, v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, v105, v77 + 14, v77 + 22);
      swift_bridgeObjectRelease_n(v71, 3);
      _os_log_impl((void *)&_mh_execute_header, v75, v76, "%s launchURL is: %s", (uint8_t *)v77, 0x16u);
      swift_arrayDestroy(v78, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v78, -1, -1);
      swift_slowDealloc(v77, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v71, 2);
    }
    ((void (*)(_BYTE *, uint64_t))v99)(v48, v103);
    v79 = v98;
    v80 = v102;
    sub_1000209D0();

    ((void (*)(_BYTE *, uint64_t))v101)(v80, v79);
    swift_beginAccess(&v106, v105, 0, 0);
    return v106;
  }
  (*(void (**)(_BYTE *, uint64_t))(v13 + 96))(v16, v12);

  swift_bridgeObjectRelease(*((_QWORD *)v16 + 2));
  v44 = sub_100005E18(&qword_10003D1B8);
  sub_10000C404((uint64_t)&v16[*(int *)(v44 + 64)], &qword_10003CAD8);
  v45 = type metadata accessor for GridForecastEntry(0);
  v46 = (uint64_t)v97;
  IntentParameter.wrappedValue.getter(v45);
  v47 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v95 + 48))(v46, 1, v96);
  v48 = v100;
  if (v47 != 1)
  {
    v98 = v12;
    v82 = v93;
    sub_100020B7C(v46, (uint64_t)v93, type metadata accessor for ForecastLocationEntity);
    v83 = sub_100005E18(&qword_10003CCA0);
    v84 = swift_allocObject(v83, 112, 7);
    *(_OWORD *)(v84 + 16) = xmmword_100030D30;
    *(_QWORD *)(v84 + 56) = &type metadata for String;
    v85 = sub_10000FBB8();
    *(_QWORD *)(v84 + 64) = v85;
    *(_QWORD *)(v84 + 32) = 0xD000000000000039;
    *(_QWORD *)(v84 + 40) = 0x8000000100032330;
    v86 = UUID.uuidString.getter(v85);
    *(_QWORD *)(v84 + 96) = &type metadata for String;
    *(_QWORD *)(v84 + 104) = v85;
    *(_QWORD *)(v84 + 72) = v86;
    *(_QWORD *)(v84 + 80) = v87;
    v69 = String.init(format:_:)(0x69656D6F68264025, 0xEC00000040253D64, v84);
    v71 = v88;
    v72 = sub_100020AFC((uint64_t)v82, type metadata accessor for ForecastLocationEntity);
    v73 = 1;
    goto LABEL_13;
  }
  v49 = v34;
  v50 = v46;
  v51 = 0xD000000000000039;
  v52 = sub_10000C404(v50, &qword_10003CA98);
  v53 = static Logger.gridForecastWidgets.getter(v52);
  v54 = Logger.logObject.getter(v53);
  v55 = v9;
  v56 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v54, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc(12, -1);
    v58 = swift_slowAlloc(32, -1);
    v105[0] = v58;
    *(_DWORD *)v57 = 136315138;
    v104 = sub_10000F4DC(0x525568636E75616CLL, 0xE90000000000004CLL, v105);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, v105, v57 + 4, v57 + 12);
    _os_log_impl((void *)&_mh_execute_header, v54, v56, "%s launchURL error: No Home found", v57, 0xCu);
    swift_arrayDestroy(v58, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v58, -1, -1);
    swift_slowDealloc(v57, -1, -1);

    ((void (*)(_BYTE *, uint64_t))v99)(v55, v103);
    v59 = v102;
  }
  else
  {

    v38(v55, v49);
    v59 = v21;
  }
  ((void (*)(_BYTE *, uint64_t))v101)(v59, v12);
  return v51;
}

uint64_t sub_10001EC70()
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
  char *v10;
  id v11;
  NSString v12;
  id v13;
  NSString v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100005E18(&qword_10003CA98);
  __chkstk_darwin(v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003C750 != -1)
    swift_once(&qword_10003C750, sub_10001CDA4);
  if (byte_10003D540 != 1)
    return 0;
  v11 = objc_allocWithZone((Class)NSUserDefaults);
  v12 = String._bridgeToObjectiveC()();
  v13 = objc_msgSend(v11, "initWithSuiteName:", v12);

  if (!v13)
    return 0;
  v30 = v0;
  v14 = String._bridgeToObjectiveC()();
  v15 = objc_msgSend(v13, "BOOLForKey:", v14);

  if (!v15)
  {

    return 0;
  }
  type metadata accessor for EnergyForecastWidgetEntryView(0);
  v16 = type metadata accessor for GridForecastEntry(0);
  IntentParameter.wrappedValue.getter(v16);
  v17 = type metadata accessor for ForecastLocationEntity(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v10, 1, v17))
  {

    sub_10000C404((uint64_t)v10, &qword_10003CA98);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, &v10[*(int *)(v17 + 20)], v4);
  v20 = sub_10000C404((uint64_t)v10, &qword_10003CA98);
  v18 = UUID.uuidString.getter(v20);
  v22 = v21;
  v23 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  static Logger.gridForecastWidgets.getter(v23);
  swift_bridgeObjectRetain_n(v22, 2);
  v25 = Logger.logObject.getter(v24);
  v26 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc(22, -1);
    v29 = swift_slowAlloc(64, -1);
    v32 = v29;
    *(_DWORD *)v27 = 136315394;
    v31 = sub_10000F4DC(0x7865546775626564, 0xE900000000000074, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v27 + 4, v27 + 12);
    *(_WORD *)(v27 + 12) = 2080;
    swift_bridgeObjectRetain();
    v31 = sub_10000F4DC(v18, v22, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v27 + 14, v27 + 22);
    swift_bridgeObjectRelease_n(v22, 3);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "EnergyForecastWidgetEntryView:%s will show debug text: %s", (uint8_t *)v27, 0x16u);
    v28 = v29;
    swift_arrayDestroy(v29, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v27, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v22, 2);
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v30);
  return v18;
}

uint64_t sub_10001F07C()
{
  id v0;
  NSString v1;
  id v2;
  uint64_t result;

  v0 = objc_allocWithZone((Class)NSUserDefaults);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "initWithSuiteName:", v1);

  result = AppStorage.init<A>(wrappedValue:_:store:)(0, 0xD00000000000001FLL, 0x8000000100032770, v2);
  qword_10003D060 = result;
  return result;
}

uint64_t EnergyForecastWidget.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t OpaqueTypeConformance2;
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
  char v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  char *v46;
  void (*v47)(char *, _QWORD, uint64_t);
  uint64_t v48;
  uint64_t v49;
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
  unint64_t v61;
  ValueMetadata *v62;
  unint64_t v63;

  v59 = a3;
  v5 = sub_100005E18(&qword_10003C7A0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_100005E18(&qword_10003D070);
  v55 = *(_QWORD *)(v52 - 8);
  __chkstk_darwin(v52);
  v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_100005E18(&qword_10003D078);
  v56 = *(_QWORD *)(v53 - 8);
  __chkstk_darwin(v53);
  v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100005E18(&qword_10003D080);
  v57 = *(_QWORD *)(v13 - 8);
  v58 = v13;
  __chkstk_darwin(v13);
  v54 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for EnergyForecastWidgetEntryView(0);
  sub_10000C440(&qword_10003D088, type metadata accessor for EnergyForecastWidgetEntryView, (uint64_t)"ц");
  sub_10001F744();
  swift_bridgeObjectRetain();
  AppIntentConfiguration.init<A>(kind:intent:provider:content:)(a1, a2);
  v15 = sub_10001F788();
  WidgetConfiguration._contentMarginsDisabled()(v5, v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v16 = LocalizedStringKey.init(stringLiteral:)(0x726F462064697247, 0xED00007473616365);
  v17 = Text.init(_:tableName:bundle:comment:)(v16);
  v19 = v18;
  v21 = v20;
  v23 = v22 & 1;
  v60 = v5;
  v61 = v15;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v60, &unk_100032BB0, 1);
  v25 = v52;
  WidgetConfiguration.configurationDisplayName(_:)(v17, v19, v23, v21, v52, OpaqueTypeConformance2);
  sub_10000E1F0(v17, v19, v23);
  swift_bridgeObjectRelease(v21);
  v26 = v10;
  v27 = v53;
  v28 = v25;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v26, v25);
  v29 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000048, 0x8000000100032690);
  v30 = Text.init(_:tableName:bundle:comment:)(v29);
  v32 = v31;
  v34 = v33;
  v36 = v35 & 1;
  v60 = v28;
  v61 = OpaqueTypeConformance2;
  v37 = v54;
  v38 = swift_getOpaqueTypeConformance2(&v60, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v30, v32, v36, v34, v27, v38);
  sub_10000E1F0(v30, v32, v36);
  swift_bridgeObjectRelease(v34);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v12, v27);
  v39 = sub_100005E18(&qword_10003CB40);
  v40 = type metadata accessor for WidgetFamily(0);
  v41 = *(_QWORD *)(v40 - 8);
  v42 = *(_QWORD *)(v41 + 72);
  v43 = *(unsigned __int8 *)(v41 + 80);
  v44 = (v43 + 32) & ~v43;
  v45 = (_QWORD *)swift_allocObject(v39, v44 + 3 * v42, v43 | 7);
  *((_OWORD *)v45 + 1) = xmmword_100030D40;
  v46 = (char *)v45 + v44;
  v47 = *(void (**)(char *, _QWORD, uint64_t))(v41 + 104);
  v47(v46, enum case for WidgetFamily.accessoryRectangular(_:), v40);
  v47(&v46[v42], enum case for WidgetFamily.systemSmall(_:), v40);
  v47(&v46[2 * v42], enum case for WidgetFamily.systemMedium(_:), v40);
  v62 = &type metadata for HomeEnergyFeatures;
  v63 = sub_10000E200();
  LOBYTE(v60) = 5;
  LOBYTE(v40) = isFeatureEnabled(_:)(&v60);
  sub_10000FB58(&v60);
  if ((v40 & 1) == 0)
  {
    swift_bridgeObjectRelease(v45);
    v45 = _swiftEmptyArrayStorage;
  }
  v60 = v27;
  v61 = v38;
  v48 = swift_getOpaqueTypeConformance2(&v60, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v49 = v58;
  WidgetConfiguration.supportedFamilies(_:)(v45, v58, v48);
  swift_bridgeObjectRelease(v45);
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v37, v49);
}

uint64_t sub_10001F608@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v4 = type metadata accessor for GridForecastEntry(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FC40(a1, (uint64_t)v6, type metadata accessor for GridForecastEntry);
  *a2 = swift_getKeyPath(&unk_100031750);
  v7 = sub_100005E18(&qword_10003CB50);
  swift_storeEnumTagMultiPayload(a2, v7, 0);
  v8 = type metadata accessor for EnergyForecastWidgetEntryView(0);
  v9 = (_QWORD *)((char *)a2 + *(int *)(v8 + 20));
  *v9 = swift_getKeyPath(&unk_100031780);
  v10 = sub_100005E18(&qword_10003CB58);
  swift_storeEnumTagMultiPayload(v9, v10, 0);
  return sub_100020B7C((uint64_t)v6, (uint64_t)a2 + *(int *)(v8 + 24), type metadata accessor for GridForecastEntry);
}

uint64_t type metadata accessor for EnergyForecastWidgetEntryView(uint64_t a1)
{
  uint64_t result;

  result = qword_10003D0F0;
  if (!qword_10003D0F0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for EnergyForecastWidgetEntryView);
  return result;
}

unint64_t sub_10001F744()
{
  unint64_t result;

  result = qword_10003D090;
  if (!qword_10003D090)
  {
    result = swift_getWitnessTable(&unk_100031858, &type metadata for EnergyForecastTimelineProvider);
    atomic_store(result, (unint64_t *)&qword_10003D090);
  }
  return result;
}

unint64_t sub_10001F788()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003C7A8;
  if (!qword_10003C7A8)
  {
    v1 = sub_100005E58(&qword_10003C7A0);
    result = swift_getWitnessTable(&protocol conformance descriptor for AppIntentConfiguration<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003C7A8);
  }
  return result;
}

uint64_t sub_10001F7D4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of EnergyForecastWidget.body>>, 1);
}

void sub_10001F7E4(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000014;
  a1[1] = 0x8000000100031660;
}

uint64_t sub_10001F804@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return EnergyForecastWidget.body.getter(*v1, v1[1], a1);
}

ValueMetadata *type metadata accessor for EnergyForecastWidget()
{
  return &type metadata for EnergyForecastWidget;
}

uint64_t sub_10001F81C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;

  v0 = sub_100005E58(&qword_10003D080);
  v1 = sub_100005E58(&qword_10003D078);
  v2 = sub_100005E58(&qword_10003D070);
  v7 = sub_100005E58(&qword_10003C7A0);
  v8 = sub_10001F788();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v7, &unk_100032BB0, 1);
  v7 = v2;
  v8 = OpaqueTypeConformance2;
  v4 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v7 = v1;
  v8 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v7 = v0;
  v8 = v5;
  return swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
}

uint64_t *sub_10001F8E8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_100005E18(&qword_10003CB50);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      v8 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = v7;
      v11 = 1;
    }
    else
    {
      v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      v9 = a1;
      v10 = v7;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
    v14 = *(int *)(a3 + 20);
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = sub_100005E18(&qword_10003CB58);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
      v19 = v15;
      v20 = v17;
      v21 = 1;
    }
    else
    {
      v22 = *v16;
      *v15 = *v16;
      swift_retain(v22);
      v19 = v15;
      v20 = v17;
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v20, v21);
    v23 = *(int *)(a3 + 24);
    v24 = (char *)a1 + v23;
    v25 = (char *)a2 + v23;
    v26 = type metadata accessor for GridForecastSnapshot(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
    v27 = (int *)type metadata accessor for GridForecastEntry(0);
    v28 = v27[5];
    v29 = *(_OWORD *)&v25[v28 + 24];
    *(_OWORD *)&v24[v28 + 24] = v29;
    (**(void (***)(void))(v29 - 8))();
    v30 = v27[6];
    v31 = &v24[v30];
    v32 = &v25[v30];
    v33 = type metadata accessor for Date(0);
    v34 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16);
    v34(v31, v32, v33);
    v34(&v24[v27[7]], &v25[v27[7]], v33);
    v35 = v27[8];
    v12 = *(_QWORD *)&v25[v35];
    *(_QWORD *)&v24[v35] = v12;
  }
  swift_retain(v12);
  return a1;
}

uint64_t sub_10001FAEC(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  int *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);

  v4 = sub_100005E18(&qword_10003CB50);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    v5 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  else
  {
    swift_release(*a1);
  }
  v6 = (_QWORD *)((char *)a1 + *(int *)(a2 + 20));
  v7 = sub_100005E18(&qword_10003CB58);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  v9 = (char *)a1 + *(int *)(a2 + 24);
  v10 = type metadata accessor for GridForecastSnapshot(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (int *)type metadata accessor for GridForecastEntry(0);
  sub_10000FB58(&v9[v11[5]]);
  v12 = &v9[v11[6]];
  v13 = type metadata accessor for Date(0);
  v14 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8);
  v14(v12, v13);
  v14(&v9[v11[7]], v13);
  return swift_release(*(_QWORD *)&v9[v11[8]]);
}

uint64_t *sub_10001FC30(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  uint64_t v34;

  v6 = sub_100005E18(&qword_10003CB50);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a1;
    v9 = v6;
    v10 = 1;
  }
  else
  {
    v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    v8 = a1;
    v9 = v6;
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v8, v9, v10);
  v12 = *(int *)(a3 + 20);
  v13 = (uint64_t *)((char *)a1 + v12);
  v14 = (uint64_t *)((char *)a2 + v12);
  v15 = sub_100005E18(&qword_10003CB58);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    v17 = v13;
    v18 = v15;
    v19 = 1;
  }
  else
  {
    v20 = *v14;
    *v13 = *v14;
    swift_retain(v20);
    v17 = v13;
    v18 = v15;
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v17, v18, v19);
  v21 = *(int *)(a3 + 24);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for GridForecastSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
  v25 = (int *)type metadata accessor for GridForecastEntry(0);
  v26 = v25[5];
  v27 = *(_OWORD *)&v23[v26 + 24];
  *(_OWORD *)&v22[v26 + 24] = v27;
  (**(void (***)(void))(v27 - 8))();
  v28 = v25[6];
  v29 = &v22[v28];
  v30 = &v23[v28];
  v31 = type metadata accessor for Date(0);
  v32 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16);
  v32(v29, v30, v31);
  v32(&v22[v25[7]], &v23[v25[7]], v31);
  v33 = v25[8];
  v34 = *(_QWORD *)&v23[v33];
  *(_QWORD *)&v22[v33] = v34;
  swift_retain(v34);
  return a1;
}

uint64_t *sub_10001FE0C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (a1 != a2)
  {
    sub_10000C404((uint64_t)a1, &qword_10003CB50);
    v6 = sub_100005E18(&qword_10003CB50);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
    v12 = *(int *)(a3 + 20);
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    sub_10000C404((uint64_t)a1 + v12, &qword_10003CB58);
    v15 = sub_100005E18(&qword_10003CB58);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  v21 = *(int *)(a3 + 24);
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for GridForecastSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  v25 = (int *)type metadata accessor for GridForecastEntry(0);
  sub_100020008(&v22[v25[5]], &v23[v25[5]]);
  v26 = v25[6];
  v27 = &v22[v26];
  v28 = &v23[v26];
  v29 = type metadata accessor for Date(0);
  v30 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 24);
  v30(v27, v28, v29);
  v30(&v22[v25[7]], &v23[v25[7]], v29);
  v31 = v25[8];
  v32 = *(_QWORD *)&v23[v31];
  v33 = *(_QWORD *)&v22[v31];
  *(_QWORD *)&v22[v31] = v32;
  swift_retain(v32);
  swift_release(v33);
  return a1;
}

_QWORD *sub_100020008(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
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
  _BYTE v15[24];

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
        v11 = *result;
        v12 = *a2;
        swift_retain(*a2);
        result = (_QWORD *)swift_release(v11);
        *v3 = v12;
      }
      else
      {
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD))(v9 + 24))(result, a2, result[3]);
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
        v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          v14 = *a2;
          *v3 = *a2;
          swift_retain(v14);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (_QWORD *)swift_release(v10);
      }
      else
      {
        (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          v13 = *a2;
          *v3 = *a2;
          swift_retain(v13);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (_QWORD *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }
  return result;
}

char *sub_100020170(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);

  v6 = sub_100005E18(&qword_10003CB50);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    v7 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_100005E18(&qword_10003CB58);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload(v9, v11, 1);
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = type metadata accessor for GridForecastSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  v17 = (int *)type metadata accessor for GridForecastEntry(0);
  v18 = v17[5];
  v19 = &v14[v18];
  v20 = &v15[v18];
  v21 = *((_OWORD *)v20 + 1);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *((_OWORD *)v19 + 1) = v21;
  *((_QWORD *)v19 + 4) = *((_QWORD *)v20 + 4);
  v22 = v17[6];
  v23 = &v14[v22];
  v24 = &v15[v22];
  v25 = type metadata accessor for Date(0);
  v26 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32);
  v26(v23, v24, v25);
  v26(&v14[v17[7]], &v15[v17[7]], v25);
  *(_QWORD *)&v14[v17[8]] = *(_QWORD *)&v15[v17[8]];
  return a1;
}

char *sub_100020338(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;

  if (a1 != a2)
  {
    sub_10000C404((uint64_t)a1, &qword_10003CB50);
    v6 = sub_100005E18(&qword_10003CB50);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      v7 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_10000C404((uint64_t)&a1[v8], &qword_10003CB58);
    v11 = sub_100005E18(&qword_10003CB58);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload(v9, v11, 1);
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = type metadata accessor for GridForecastSnapshot(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  v17 = (int *)type metadata accessor for GridForecastEntry(0);
  v18 = v17[5];
  v19 = &v14[v18];
  v20 = &v15[v18];
  sub_10000FB58(&v14[v18]);
  v21 = *((_OWORD *)v20 + 1);
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *((_OWORD *)v19 + 1) = v21;
  *((_QWORD *)v19 + 4) = *((_QWORD *)v20 + 4);
  v22 = v17[6];
  v23 = &v14[v22];
  v24 = &v15[v22];
  v25 = type metadata accessor for Date(0);
  v26 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 40);
  v26(v23, v24, v25);
  v26(&v14[v17[7]], &v15[v17[7]], v25);
  v27 = v17[8];
  v28 = *(_QWORD *)&v14[v27];
  *(_QWORD *)&v14[v27] = *(_QWORD *)&v15[v27];
  swift_release(v28);
  return a1;
}

uint64_t sub_100020538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100020544);
}

uint64_t sub_100020544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_100005E18(&qword_10003CB60);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = sub_100005E18(&qword_10003CB68);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = type metadata accessor for GridForecastEntry(0);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_1000205E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000205F0);
}

uint64_t sub_1000205F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_100005E18(&qword_10003CB60);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = sub_100005E18(&qword_10003CB68);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for GridForecastEntry(0);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_100020698(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[3];

  sub_10000F034(319, &qword_10003CBD8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_10000F034(319, (unint64_t *)&unk_10003CBE0, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    if (v5 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(v4 - 8) + 64;
      v6 = type metadata accessor for GridForecastEntry(319);
      if (v7 <= 0x3F)
      {
        v8[2] = *(_QWORD *)(v6 - 8) + 64;
        swift_initStructMetadata(a1, 256, 3, v8, a1 + 16);
      }
    }
  }
}

uint64_t sub_100020758(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100032F7C, 1);
}

unint64_t sub_100020768()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  result = qword_10003D180;
  if (!qword_10003D180)
  {
    v1 = sub_100005E58(&qword_10003D160);
    v2 = sub_100005E58(&qword_10003D170);
    v8 = type metadata accessor for GridForecastWidgetView(255);
    v9 = (void *)sub_10000C440(&qword_10003D188, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastWidgetView, (uint64_t)&protocol conformance descriptor for GridForecastWidgetView);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v8 = v2;
    v9 = &type metadata for EmptyView;
    v10 = OpaqueTypeConformance2;
    v11 = &protocol witness table for EmptyView;
    swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
    v4 = sub_100005E58(&qword_10003D140);
    v5 = type metadata accessor for RectangularLockEnergyForecastView(255);
    v6 = sub_10000C440(&qword_10003D190, (uint64_t (*)(uint64_t))&type metadata accessor for RectangularLockEnergyForecastView, (uint64_t)&protocol conformance descriptor for RectangularLockEnergyForecastView);
    v8 = v5;
    v9 = (void *)v6;
    v7 = swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 1);
    v8 = v4;
    v9 = &type metadata for EmptyView;
    v10 = v7;
    v11 = &protocol witness table for EmptyView;
    swift_getOpaqueTypeConformance2(&v8, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003D180);
  }
  return result;
}

uint64_t sub_1000208CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005E18(&qword_10003D160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100020914()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_100020934()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_100020954(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for WidgetRenderingMode(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.widgetRenderingMode.setter(v3);
}

uint64_t sub_1000209D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  char *v4;
  char v5;
  char v6;
  uint64_t v7;

  if (qword_10003C758 != -1)
    swift_once(&qword_10003C758, sub_10001F07C);
  v0 = qword_10003D060;
  v1 = swift_retain(qword_10003D060);
  AppStorage.wrappedValue.getter(&v7, v1, &type metadata for Bool);
  result = swift_release(v0);
  if (v7 == 1)
  {
    if (qword_10003D068 != 2)
      return result;
    objc_msgSend((id)objc_opt_self(HUEnergyAnalytics), "saveWidgetSettingsEvent:withLocation:", 52, 2);
    v3 = qword_10003D060;
    v5 = 0;
    swift_retain(qword_10003D060);
    v4 = &v5;
  }
  else
  {
    if (qword_10003D068 != 1)
      return result;
    objc_msgSend((id)objc_opt_self(HUEnergyAnalytics), "saveWidgetSettingsEvent:withLocation:", 52, 1);
    v3 = qword_10003D060;
    v6 = 1;
    swift_retain(qword_10003D060);
    v4 = &v6;
  }
  AppStorage.wrappedValue.setter(v4, v3, &type metadata for Bool);
  return swift_release(v3);
}

uint64_t sub_100020AFC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100020B38()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_100020B5C()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_100020B7C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_100020BC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003D1C8;
  if (!qword_10003D1C8)
  {
    v1 = sub_100005E58(&qword_10003D1D0);
    sub_100020768();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10003D1C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnergyForecastTimelineProvider()
{
  return &type metadata for EnergyForecastTimelineProvider;
}

char *sub_100020C40(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = type metadata accessor for GridForecastSnapshot(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = *(_OWORD *)&a2[v8 + 24];
    *(_OWORD *)&a1[v8 + 24] = v9;
    (**(void (***)(void))(v9 - 8))();
    v10 = a3[6];
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = type metadata accessor for Date(0);
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    v14(v11, v12, v13);
    v14(&a1[a3[7]], &a2[a3[7]], v13);
    v15 = a3[8];
    v16 = *(_QWORD *)&a2[v15];
    *(_QWORD *)&a1[v15] = v16;
  }
  swift_retain(v16);
  return a1;
}

uint64_t sub_100020D40(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v4 = type metadata accessor for GridForecastSnapshot(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  sub_10000FB58((_QWORD *)(a1 + a2[5]));
  v5 = a1 + a2[6];
  v6 = type metadata accessor for Date(0);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + a2[7], v6);
  return swift_release(*(_QWORD *)(a1 + a2[8]));
}

uint64_t sub_100020DD8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;

  v6 = type metadata accessor for GridForecastSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  v9 = a3[6];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = type metadata accessor for Date(0);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v13(v10, v11, v12);
  v13(a1 + a3[7], a2 + a3[7], v12);
  v14 = a3[8];
  v15 = *(_QWORD *)(a2 + v14);
  *(_QWORD *)(a1 + v14) = v15;
  swift_retain(v15);
  return a1;
}

uint64_t sub_100020EB0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = type metadata accessor for GridForecastSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  sub_100020008((_QWORD *)(a1 + a3[5]), (_QWORD *)(a2 + a3[5]));
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for Date(0);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v11(a1 + a3[7], a2 + a3[7], v10);
  v12 = a3[8];
  v13 = *(_QWORD *)(a2 + v12);
  v14 = *(_QWORD *)(a1 + v12);
  *(_QWORD *)(a1 + v12) = v13;
  swift_retain(v13);
  swift_release(v14);
  return a1;
}

uint64_t sub_100020F80(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v6 = type metadata accessor for GridForecastSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = a2 + v7;
  v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v10 + 32);
  v12 = a1 + v8;
  v13 = a2 + v8;
  v14 = type metadata accessor for Date(0);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  v15(a1 + a3[7], a2 + a3[7], v14);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_100021048(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;

  v6 = type metadata accessor for GridForecastSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  sub_10000FB58((_QWORD *)(a1 + v7));
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = type metadata accessor for Date(0);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v15(a1 + a3[7], a2 + a3[7], v14);
  v16 = a3[8];
  v17 = *(_QWORD *)(a1 + v16);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  swift_release(v17);
  return a1;
}

uint64_t sub_100021124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100021130);
}

uint64_t sub_100021130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = type metadata accessor for GridForecastSnapshot(0);
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
    v8 = type metadata accessor for Date(0);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 24);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_1000211DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000211E8);
}

uint64_t sub_1000211E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = type metadata accessor for GridForecastSnapshot(0);
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
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
      return result;
    }
    v10 = type metadata accessor for Date(0);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for GridForecastEntry(uint64_t a1)
{
  uint64_t result;

  result = qword_10003D230;
  if (!qword_10003D230)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for GridForecastEntry);
  return result;
}

uint64_t sub_1000212CC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[2];
  uint64_t v6;
  uint64_t v7;
  char *v8;

  result = type metadata accessor for GridForecastSnapshot(319);
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    v5[1] = "(";
    result = type metadata accessor for Date(319);
    if (v4 <= 0x3F)
    {
      v6 = *(_QWORD *)(result - 8) + 64;
      v7 = v6;
      v8 = (char *)&value witness table for Builtin.NativeObject + 64;
      swift_initStructMetadata(a1, 256, 5, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

void *sub_100021368(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  id v15;

  v4 = v3;
  if ((unint64_t)a3 >> 62)
    goto LABEL_16;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a3);
  for (; v7; v7 = _CocoaArrayWrapper.endIndex.getter(v14))
  {
    v8 = 4;
    while (1)
    {
      v9 = (a3 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, a3)
         : *(id *)(a3 + 8 * v8);
      v10 = v9;
      v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1))
        break;
      v15 = v9;
      v12 = a1(&v15);
      if (v4)
      {
        swift_bridgeObjectRelease(a3);

        return v10;
      }
      if ((v12 & 1) != 0)
      {
        swift_bridgeObjectRelease(a3);
        return v10;
      }

      ++v8;
      if (v11 == v7)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    if (a3 < 0)
      v14 = a3;
    else
      v14 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
  }
LABEL_11:
  swift_bridgeObjectRelease(a3);
  return 0;
}

uint64_t sub_100021488@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, char *, uint64_t);
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  int *v38;
  void (*v39)(uint64_t, char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;

  v2 = type metadata accessor for Date(0);
  v51 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005E18(&qword_10003CF10);
  __chkstk_darwin(v5);
  v50 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for EnergyWindows.MockType(0);
  v47 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for GridForecastSnapshot(0);
  v49 = *(_QWORD *)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v48 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (char *)&v40 - v13;
  v15 = type metadata accessor for Logger(0);
  v45 = *(_QWORD *)(v15 - 8);
  v46 = v15;
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = static Logger.gridForecastWidgets.getter(v16);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v44 = a1;
    v22 = swift_slowAlloc(12, -1);
    v42 = v4;
    v23 = (uint8_t *)v22;
    v24 = swift_slowAlloc(32, -1);
    v41 = v7;
    v25 = v24;
    *(_QWORD *)&v53 = v24;
    v43 = v2;
    *(_DWORD *)v23 = 136315138;
    v52 = sub_10000F4DC(0xD000000000000010, 0x8000000100032590, (uint64_t *)&v53);
    v2 = v43;
    a1 = v44;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v23 + 4, v23 + 12);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s Generating placeholder with mock data.", v23, 0xCu);
    swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
    v26 = v25;
    v7 = v41;
    swift_slowDealloc(v26, -1, -1);
    v27 = v23;
    v4 = v42;
    swift_slowDealloc(v27, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v46);
  v28 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v47 + 104))(v9, enum case for EnergyWindows.MockType.widgetSnapshot(_:), v7);
  static GridForecastSnapshot.staticSnapshotWithWindowsType(_:)(v9);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v7);
  v30 = v48;
  v29 = v49;
  v31 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  v31(v48, v14, v10);
  v54 = v10;
  v55 = sub_10000C440(&qword_10003D1A8, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastSnapshot, (uint64_t)&protocol conformance descriptor for GridForecastSnapshot);
  v32 = sub_10000FDA4(&v53);
  v33 = ((uint64_t (*)(_QWORD *, char *, uint64_t))v31)(v32, v14, v10);
  v34 = v50;
  static EKDateUtilities.nearestTenAM()(v33);
  v35 = v51;
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v51 + 48))(v34, 1, v2);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    static Date.now.getter(result);
    v37 = sub_10000BF68();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v10);
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(a1, v30, v10);
    v38 = (int *)type metadata accessor for GridForecastEntry(0);
    sub_100027B7C(&v53, a1 + v38[5]);
    v39 = *(void (**)(uint64_t, char *, uint64_t))(v35 + 32);
    v39(a1 + v38[6], v34, v2);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v39)(a1 + v38[7], v4, v2);
    *(_QWORD *)(a1 + v38[8]) = v37;
  }
  return result;
}

uint64_t sub_100021880(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2[9] = a1;
  v2[10] = a2;
  v3 = type metadata accessor for Date(0);
  v2[11] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[12] = v4;
  v2[13] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005E18(&qword_10003CF10);
  v2[14] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for EnergyWindows.MockType(0);
  v2[15] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[16] = v7;
  v2[17] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for GridForecastSnapshot(0);
  v2[18] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v2[19] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[20] = swift_task_alloc(v10);
  v2[21] = swift_task_alloc(v10);
  v11 = type metadata accessor for Logger(0);
  v2[22] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v2[23] = v12;
  v2[24] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10002198C, 0, 0);
}

uint64_t sub_10002198C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_QWORD *, uint64_t, uint64_t);
  _QWORD *v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
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
  __int128 *v46;
  uint64_t v47;

  v46 = (__int128 *)(v1 + 16);
  v2 = *(_QWORD *)(v1 + 80);
  static Logger.gridForecastWidgets.getter(a1);
  v3 = swift_retain_n(v2, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v39 = *(_QWORD *)(v1 + 184);
    v40 = *(_QWORD *)(v1 + 176);
    v43 = *(_QWORD *)(v1 + 192);
    v6 = *(_QWORD *)(v1 + 80);
    v7 = swift_slowAlloc(22, -1);
    v37 = swift_slowAlloc(64, -1);
    v47 = v37;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v1 + 56) = sub_10000F4DC(0xD000000000000011, 0x8000000100032570, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 56, v1 + 64, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2080;
    swift_retain(v6);
    v8 = sub_100009AC8();
    v10 = v9;
    swift_release(v6);
    *(_QWORD *)(v1 + 64) = sub_10000F4DC(v8, v10, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 64, v1 + 72, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v10);
    swift_release_n(v6, 2);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s Generating snapshot with mock data & configuration: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v37, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v43, v40);
  }
  else
  {
    v12 = *(_QWORD *)(v1 + 184);
    v11 = *(_QWORD *)(v1 + 192);
    v13 = *(_QWORD *)(v1 + 176);
    swift_release_n(*(_QWORD *)(v1 + 80), 2);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  v15 = *(_QWORD **)(v1 + 160);
  v14 = *(_QWORD *)(v1 + 168);
  v16 = *(_QWORD *)(v1 + 144);
  v17 = *(_QWORD *)(v1 + 152);
  v19 = *(_QWORD *)(v1 + 128);
  v18 = *(_QWORD *)(v1 + 136);
  v20 = *(_QWORD *)(v1 + 112);
  v21 = *(_QWORD *)(v1 + 120);
  v41 = *(_QWORD *)(v1 + 96);
  v44 = *(_QWORD *)(v1 + 88);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v19 + 104))(v18, enum case for EnergyWindows.MockType.widgetSnapshot(_:), v21);
  static GridForecastSnapshot.staticSnapshotWithWindowsType(_:)(v18);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v21);
  v22 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v17 + 16);
  v22(v15, v14, v16);
  *(_QWORD *)(v1 + 40) = v16;
  *(_QWORD *)(v1 + 48) = sub_10000C440(&qword_10003D1A8, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastSnapshot, (uint64_t)&protocol conformance descriptor for GridForecastSnapshot);
  v23 = sub_10000FDA4(v46);
  v24 = v22(v23, v14, v16);
  static EKDateUtilities.nearestTenAM()(v24);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v20, 1, v44);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v27 = *(_QWORD *)(v1 + 160);
    v26 = *(_QWORD *)(v1 + 168);
    v42 = *(_QWORD *)(v1 + 192);
    v28 = *(_QWORD *)(v1 + 144);
    v29 = *(_QWORD *)(v1 + 152);
    v45 = *(_QWORD *)(v1 + 136);
    v30 = *(_QWORD *)(v1 + 104);
    v31 = *(_QWORD *)(v1 + 88);
    v36 = *(_QWORD *)(v1 + 96);
    v38 = *(_QWORD *)(v1 + 112);
    v32 = *(_QWORD *)(v1 + 72);
    v33 = *(_QWORD *)(v1 + 80);
    static Date.now.getter(result);
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v26, v28);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v32, v27, v28);
    v34 = (int *)type metadata accessor for GridForecastEntry(0);
    sub_100027B7C(v46, v32 + v34[5]);
    v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32);
    v35(v32 + v34[6], v38, v31);
    v35(v32 + v34[7], v30, v31);
    *(_QWORD *)(v32 + v34[8]) = v33;
    swift_retain(v33);
    swift_task_dealloc(v42);
    swift_task_dealloc(v26);
    swift_task_dealloc(v27);
    swift_task_dealloc(v45);
    swift_task_dealloc(v38);
    swift_task_dealloc(v30);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  return result;
}

uint64_t sub_100021D4C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v2[21] = a1;
  v2[22] = a2;
  v3 = type metadata accessor for Calendar.Component(0);
  v2[23] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[24] = v4;
  v2[25] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Calendar(0);
  v2[26] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[27] = v6;
  v2[28] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100005E18(&qword_10003CF10);
  v2[29] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Date(0);
  v2[30] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v2[31] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[32] = swift_task_alloc(v10);
  v2[33] = swift_task_alloc(v10);
  v2[34] = swift_task_alloc(v10);
  v2[35] = swift_task_alloc(v10);
  v11 = type metadata accessor for EnergyWindows(0);
  v2[36] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v2[37] = v12;
  v2[38] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for TimelineReloadPolicy(0);
  v2[39] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v2[40] = v14;
  v15 = (*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[41] = swift_task_alloc(v15);
  v2[42] = swift_task_alloc(v15);
  v16 = type metadata accessor for GridForecastEntry(0);
  v2[43] = v16;
  v17 = *(_QWORD *)(v16 - 8);
  v2[44] = v17;
  v18 = (*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[45] = swift_task_alloc(v18);
  v2[46] = swift_task_alloc(v18);
  v2[47] = swift_task_alloc(v18);
  v2[48] = swift_task_alloc(v18);
  v19 = (*(_QWORD *)(*(_QWORD *)(sub_100005E18(&qword_10003D130) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[49] = swift_task_alloc(v19);
  v2[50] = swift_task_alloc(v19);
  v20 = type metadata accessor for GridForecastError(0);
  v2[51] = v20;
  v21 = *(_QWORD *)(v20 - 8);
  v2[52] = v21;
  v22 = (*(_QWORD *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[53] = swift_task_alloc(v22);
  v2[54] = swift_task_alloc(v22);
  v2[55] = swift_task_alloc(v22);
  v23 = type metadata accessor for GridForecastSnapshot(0);
  v2[56] = v23;
  v24 = *(_QWORD *)(v23 - 8);
  v2[57] = v24;
  v25 = (*(_QWORD *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[58] = swift_task_alloc(v25);
  v2[59] = swift_task_alloc(v25);
  v26 = type metadata accessor for Logger(0);
  v2[60] = v26;
  v27 = *(_QWORD *)(v26 - 8);
  v2[61] = v27;
  v28 = (*(_QWORD *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[62] = swift_task_alloc(v28);
  v2[63] = swift_task_alloc(v28);
  v2[64] = swift_task_alloc(v28);
  v2[65] = swift_task_alloc(v28);
  v2[66] = swift_task_alloc(v28);
  v2[67] = swift_task_alloc(v28);
  v2[68] = swift_task_alloc(v28);
  return swift_task_switch(sub_10002201C, 0, 0);
}

uint64_t sub_10002201C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = v1[22];
  static Logger.gridForecastWidgets.getter(a1);
  v3 = swift_retain_n(v2, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v18 = v1[61];
    v19 = v1[60];
    v20 = v1[68];
    v6 = v1[22];
    v7 = swift_slowAlloc(22, -1);
    v17 = swift_slowAlloc(64, -1);
    v21 = v17;
    *(_DWORD *)v7 = 136315394;
    v1[19] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 19, v1 + 20, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2080;
    swift_retain(v6);
    v8 = sub_100009AC8();
    v10 = v9;
    swift_release(v6);
    v1[20] = sub_10000F4DC(v8, v10, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 20, v1 + 21, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v10);
    swift_release_n(v6, 2);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s resolving forecastSnapshot type for configuration: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v17, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v7, -1, -1);

    v11 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v11(v20, v19);
  }
  else
  {
    v12 = v1[68];
    v13 = v1[60];
    v14 = v1[61];
    swift_release_n(v1[22], 2);

    v11 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v11(v12, v13);
  }
  v1[69] = v11;
  v15 = (_QWORD *)swift_task_alloc(dword_10003D2C4);
  v1[70] = v15;
  *v15 = v1;
  v15[1] = sub_100022254;
  return sub_100023848(v1[59], v1[22]);
}

uint64_t sub_100022254()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 560);
  *(_QWORD *)(*(_QWORD *)v1 + 568) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_1000232E0;
  else
    v3 = sub_1000222B8;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000222B8(uint64_t a1)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  void (*v25)(uint64_t, uint64_t);
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
  unint64_t v37;
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
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  _BOOL4 v63;
  uint64_t (*v64)(uint64_t, uint64_t);
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
  NSObject *v76;
  os_log_type_t v77;
  _BOOL4 v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  Swift::String v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t result;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(uint64_t, uint64_t, uint64_t);
  _QWORD *v106;
  _QWORD *v107;
  uint64_t v108;
  uint64_t v109;
  NSObject *v110;
  os_log_type_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  Swift::String v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  os_log_type_t v134;
  uint8_t *v135;
  void (*v136)(uint64_t, uint64_t);
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _QWORD *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void (*v150)(uint64_t, uint64_t);
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  _QWORD *v161;
  _QWORD *v162;
  uint64_t v163;
  _QWORD *v164;
  uint64_t v165;
  _QWORD *v166;
  uint64_t v167;
  void (*v168)(uint64_t, uint64_t);
  uint64_t v169;
  int *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t *v176;
  uint64_t (*v177)(uint64_t, uint64_t, uint64_t);
  uint64_t v178;
  uint64_t v179;
  unsigned int v180;
  uint64_t v181;
  os_log_t log;
  os_log_t loga;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t (*v193)(uint64_t, uint64_t, uint64_t);
  uint64_t v194;
  uint64_t v195;
  os_log_type_t v196;
  uint64_t v197;
  uint64_t (*v198)(uint64_t, uint64_t);
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void (*v203)(uint64_t, uint64_t);
  uint64_t (*v204)(uint64_t, uint64_t);
  uint64_t v205;
  void (*v206)(uint64_t, uint64_t);
  uint64_t v207;
  void (*v208)(uint64_t, uint64_t, uint64_t);
  uint64_t v209;
  uint64_t v210;
  void (*v211)(uint64_t, uint64_t);
  uint64_t v212;
  void (*v213)(uint64_t, uint64_t);
  uint64_t v214;
  uint64_t v215[2];

  v2 = v1[51];
  v3 = v1[52];
  v4 = v1[50];
  GridForecastSnapshot.error.getter(a1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
    v6 = v1[37];
    v5 = v1[38];
    v7 = v1[36];
    v8 = sub_10000C404(v1[50], &qword_10003D130);
    v9 = GridForecastSnapshot.energyWindows.getter(v8);
    v10 = EnergyWindows.windows.getter(v9);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    if (v10)
    {
      v12 = *(_QWORD *)(v10 + 16);
      v11 = swift_bridgeObjectRelease(v10);
    }
    else
    {
      v12 = 0;
    }
    v60 = static Logger.gridForecastWidgets.getter(v11);
    v61 = Logger.logObject.getter(v60);
    v62 = static os_log_type_t.default.getter();
    v63 = os_log_type_enabled(v61, v62);
    v64 = (uint64_t (*)(uint64_t, uint64_t))v1[69];
    v65 = v1[66];
    v66 = v1[60];
    if (v63)
    {
      v67 = swift_slowAlloc(22, -1);
      v204 = v64;
      v68 = swift_slowAlloc(32, -1);
      v215[0] = v68;
      *(_DWORD *)v67 = 136315394;
      v1[14] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v215);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 14, v1 + 15, v67 + 4, v67 + 12);
      *(_WORD *)(v67 + 12) = 2048;
      v1[15] = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 15, v1 + 16, v67 + 14, v67 + 22);
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s: retrieved %ld windows", (uint8_t *)v67, 0x16u);
      swift_arrayDestroy(v68, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v68, -1, -1);
      swift_slowDealloc(v67, -1, -1);

      v69 = v204(v65, v66);
    }
    else
    {

      v69 = v64(v65, v66);
    }
    v161 = v1 + 7;
    v162 = v1 + 2;
    v164 = v1 + 11;
    v166 = v1 + 10;
    v71 = v1[34];
    v70 = v1[35];
    v72 = v1[30];
    v73 = v1[31];
    v1[7] = _swiftEmptyArrayStorage;
    v74 = Date.init()(v69);
    static Logger.gridForecastWidgets.getter(v74);
    v177 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v73 + 16);
    v75 = v177(v71, v70, v72);
    v76 = Logger.logObject.getter(v75);
    v77 = static os_log_type_t.default.getter();
    v78 = os_log_type_enabled(v76, v77);
    v79 = (uint64_t (*)(uint64_t, uint64_t))v1[69];
    v80 = v1[65];
    v81 = v1[60];
    v82 = v1[34];
    v83 = v1[31];
    if (v78)
    {
      v212 = v1[30];
      v84 = swift_slowAlloc(22, -1);
      v198 = v79;
      v85 = swift_slowAlloc(64, -1);
      v215[0] = v85;
      *(_DWORD *)v84 = 136315394;
      v1[12] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v215);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 12, v1 + 13, v84 + 4, v84 + 12);
      *(_WORD *)(v84 + 12) = 2080;
      v86 = Date.formatted()();
      v1[13] = sub_10000F4DC(v86._countAndFlagsBits, (unint64_t)v86._object, v215);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 13, v1 + 14, v84 + 14, v84 + 22);
      swift_bridgeObjectRelease(v86._object);
      v87 = v212;
      v213 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
      v213(v82, v87);
      _os_log_impl((void *)&_mh_execute_header, v76, v77, "-------- %s creating 60 mins of entries, starting at %s", (uint8_t *)v84, 0x16u);
      swift_arrayDestroy(v85, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v85, -1, -1);
      swift_slowDealloc(v84, -1, -1);

      v88 = v198(v80, v81);
    }
    else
    {
      v213 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
      v213(v82, v1[30]);

      v79(v80, v81);
    }
    v160 = v1 + 9;
    v172 = v1[44];
    v174 = v1[57];
    v170 = (int *)v1[43];
    v185 = v1[27];
    v187 = v1[31];
    log = (os_log_t)v1[24];
    v180 = enum case for Calendar.Component.minute(_:);
    v168 = (void (*)(uint64_t, uint64_t))v1[69];
    v89 = -5;
    do
    {
      v209 = v89;
      v90 = v89 + 5;
      v91 = v1[35];
      v93 = v1[29];
      v92 = v1[30];
      v94 = v1[28];
      v96 = v1[25];
      v95 = v1[26];
      v97 = v1[23];
      static Calendar.current.getter(v88);
      ((void (*)(uint64_t, _QWORD, uint64_t))log[13].isa)(v96, v180, v97);
      Calendar.date(byAdding:value:to:wrappingComponents:)(v96, v90, v91, 0);
      ((void (*)(uint64_t, uint64_t))log[1].isa)(v96, v97);
      (*(void (**)(uint64_t, uint64_t))(v185 + 8))(v94, v95);
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v187 + 48))(v93, 1, v92);
      if ((_DWORD)result == 1)
      {
        __break(1u);
        return result;
      }
      v99 = v1[59];
      v100 = v1[56];
      v101 = v1[47];
      v199 = v1[46];
      v190 = v1[35];
      v102 = v1[33];
      v205 = v1[32];
      v103 = v1[30];
      v104 = v1[22];
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v187 + 32))(v102, v1[29], v103);
      v105 = *(void (**)(uint64_t, uint64_t, uint64_t))(v174 + 16);
      v105(v101, v99, v100);
      v106 = (_QWORD *)(v101 + v170[5]);
      v106[3] = v100;
      v106[4] = sub_10000C440(&qword_10003D1A8, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastSnapshot, (uint64_t)&protocol conformance descriptor for GridForecastSnapshot);
      v107 = sub_10000FDA4(v106);
      v105((uint64_t)v107, v99, v100);
      v177(v101 + v170[6], v102, v103);
      v177(v101 + v170[7], v190, v103);
      *(_QWORD *)(v101 + v170[8]) = v104;
      v108 = swift_retain(v104);
      static Logger.gridForecastWidgets.getter(v108);
      sub_100027B38(v101, v199);
      v109 = v177(v205, v102, v103);
      v110 = Logger.logObject.getter(v109);
      v111 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v110, v111))
      {
        v200 = v1[64];
        v206 = (void (*)(uint64_t, uint64_t))v1[69];
        v112 = v1[46];
        v113 = v1[32];
        v191 = v1[30];
        v194 = v1[60];
        v114 = swift_slowAlloc(22, -1);
        v115 = swift_slowAlloc(64, -1);
        v215[0] = v115;
        *(_DWORD *)v114 = 136315394;
        v116 = sub_100026148();
        v118 = v117;
        v1[10] = sub_10000F4DC(v116, v117, v215);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v166, v164, v114 + 4, v114 + 12);
        swift_bridgeObjectRelease(v118);
        sub_100020AFC(v112, type metadata accessor for GridForecastEntry);
        *(_WORD *)(v114 + 12) = 2080;
        v119 = Date.formatted()();
        v1[11] = sub_10000F4DC(v119._countAndFlagsBits, (unint64_t)v119._object, v215);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v164, v1 + 12, v114 + 14, v114 + 22);
        swift_bridgeObjectRelease(v119._object);
        v213(v113, v191);
        _os_log_impl((void *)&_mh_execute_header, v110, v111, "\t\t- %s created for %s", (uint8_t *)v114, 0x16u);
        swift_arrayDestroy(v115, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v115, -1, -1);
        swift_slowDealloc(v114, -1, -1);

        v206(v200, v194);
        v168 = (void (*)(uint64_t, uint64_t))v1[69];
      }
      else
      {
        v120 = v1[64];
        v121 = v1[60];
        v122 = v1[32];
        v123 = v1[30];
        sub_100020AFC(v1[46], type metadata accessor for GridForecastEntry);
        v213(v122, v123);

        v168(v120, v121);
      }
      sub_100027B38(v1[47], v1[45]);
      v124 = v1[7];
      if ((swift_isUniquelyReferenced_nonNull_native(v124) & 1) == 0)
        v124 = sub_100026F54(0, *(_QWORD *)(v124 + 16) + 1, 1, v124, &qword_10003D2A8, type metadata accessor for GridForecastEntry);
      v126 = *(_QWORD *)(v124 + 16);
      v125 = *(_QWORD *)(v124 + 24);
      if (v126 >= v125 >> 1)
        v124 = sub_100026F54(v125 > 1, v126 + 1, 1, v124, &qword_10003D2A8, type metadata accessor for GridForecastEntry);
      v127 = v1[47];
      v128 = v1[45];
      v129 = v1[33];
      v130 = v1[30];
      *(_QWORD *)(v124 + 16) = v126 + 1;
      sub_100020B7C(v128, v124+ ((*(unsigned __int8 *)(v172 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v172 + 80))+ *(_QWORD *)(v172 + 72) * v126, type metadata accessor for GridForecastEntry);
      v1[7] = v124;
      sub_100020AFC(v127, type metadata accessor for GridForecastEntry);
      v88 = ((uint64_t (*)(uint64_t, uint64_t))v213)(v129, v130);
      v89 = v209 + 5;
    }
    while ((unint64_t)(v209 + 5) < 0x37);
    static Logger.gridForecastWidgets.getter(v88);
    v131 = v1[7];
    v132 = swift_bridgeObjectRetain();
    v133 = Logger.logObject.getter(v132);
    v134 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v133, v134))
    {
      v135 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v135 = 134217984;
      *v160 = *(_QWORD *)(v131 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v160, v166, v135 + 4, v135 + 12);
      swift_bridgeObjectRelease(v131);
      _os_log_impl((void *)&_mh_execute_header, v133, v134, "-------- %ld entries created, creating timeline...", v135, 0xCu);
      swift_slowDealloc(v135, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease(v131);
    }

    v136 = (void (*)(uint64_t, uint64_t))v1[69];
    v137 = v1[63];
    v139 = v1[59];
    v138 = v1[60];
    v140 = v1;
    v141 = v1[57];
    v142 = v140[56];
    v144 = v140[42];
    v143 = v140[43];
    v145 = v140[35];
    v146 = v140[30];
    v136(v137, v138);
    v147 = swift_beginAccess(v161, v162, 0, 0);
    v148 = v140[7];
    static TimelineReloadPolicy.atEnd.getter(v147);
    v149 = sub_10000C440(qword_10003D278, type metadata accessor for GridForecastEntry, (uint64_t)&unk_100031828);
    Timeline.init(entries:policy:)(v148, v144, v143, v149);
    v213(v145, v146);
    v150 = *(void (**)(uint64_t, uint64_t))(v141 + 8);
    v1 = v140;
    v150(v139, v142);
  }
  else
  {
    v14 = v1[58];
    v13 = v1[59];
    v15 = v1[56];
    v16 = v1[57];
    v18 = v1[54];
    v17 = v1[55];
    v19 = v1[51];
    v20 = v1[52];
    v21 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v20 + 32))(v17, v1[50], v19);
    static Logger.gridForecastWidgets.getter(v21);
    v208 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
    v208(v14, v13, v15);
    v193 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
    v22 = v193(v18, v17, v19);
    v23 = Logger.logObject.getter(v22);
    v196 = static os_log_type_t.error.getter();
    v24 = os_log_type_enabled(v23, v196);
    v25 = (void (*)(uint64_t, uint64_t))v1[69];
    v26 = v1[67];
    v27 = v1[60];
    v29 = v1[57];
    v28 = v1[58];
    v30 = v1[56];
    v31 = v1[54];
    v32 = v1[51];
    v202 = v1[52];
    if (v24)
    {
      v189 = v1[67];
      v33 = swift_slowAlloc(32, -1);
      v176 = (uint64_t *)swift_slowAlloc(8, -1);
      v184 = swift_slowAlloc(64, -1);
      v215[0] = v184;
      *(_DWORD *)v33 = 136315650;
      v1[16] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v215);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 17, v33 + 4, v33 + 12);
      *(_WORD *)(v33 + 12) = 2080;
      v34 = sub_10000C440(&qword_10003D1A0, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastSnapshot, (uint64_t)&protocol conformance descriptor for GridForecastSnapshot);
      v35 = dispatch thunk of CustomStringConvertible.description.getter(v30, v34);
      v179 = v27;
      v37 = v36;
      v1[17] = sub_10000F4DC(v35, v36, v215);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 17, v1 + 18, v33 + 14, v33 + 22);
      swift_bridgeObjectRelease(v37);
      v211 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v211(v28, v30);
      *(_WORD *)(v33 + 22) = 2112;
      v38 = sub_10000C440(&qword_10003D2B0, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastError, (uint64_t)&protocol conformance descriptor for GridForecastError);
      v39 = swift_allocError(v32, v38, 0, 0);
      v193(v40, v31, v32);
      v41 = _swift_stdlib_bridgeErrorToNSError(v39);
      v1[18] = v41;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 18, v1 + 19, v33 + 24, v33 + 32);
      *v176 = v41;
      v203 = *(void (**)(uint64_t, uint64_t))(v202 + 8);
      v203(v31, v32);
      _os_log_impl((void *)&_mh_execute_header, v23, v196, "%s forecastSnapshot (%s) has error: %@", (uint8_t *)v33, 0x20u);
      v42 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v176, 1, v42);
      swift_slowDealloc(v176, -1, -1);
      swift_arrayDestroy(v184, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v184, -1, -1);
      swift_slowDealloc(v33, -1, -1);

      v25(v189, v179);
    }
    else
    {
      v211 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v211(v28, v30);
      v203 = *(void (**)(uint64_t, uint64_t))(v202 + 8);
      v203(v31, v32);

      v25(v26, v27);
    }
    v43 = v1[59];
    v45 = v1[55];
    v44 = v1[56];
    v46 = v1[48];
    v48 = v1[43];
    v47 = v1[44];
    v49 = v1[42];
    v197 = v1[51];
    v208(v46, v43, v44);
    v50 = (_QWORD *)(v46 + *(int *)(v48 + 20));
    v50[3] = v44;
    v50[4] = sub_10000C440(&qword_10003D1A8, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastSnapshot, (uint64_t)&protocol conformance descriptor for GridForecastSnapshot);
    v51 = sub_10000FDA4(v50);
    v52 = ((uint64_t (*)(_QWORD *, uint64_t, uint64_t))v208)(v51, v43, v44);
    v53 = static Date.now.getter(v52);
    static Date.now.getter(v53);
    *(_QWORD *)(v46 + *(int *)(v48 + 32)) = sub_10000BF68();
    v54 = sub_100005E18(&qword_10003D2A8);
    v55 = *(_QWORD *)(v47 + 72);
    v56 = *(unsigned __int8 *)(v47 + 80);
    v57 = (v56 + 32) & ~v56;
    v58 = swift_allocObject(v54, v57 + v55, v56 | 7);
    *(_OWORD *)(v58 + 16) = xmmword_1000310E0;
    sub_100027B38(v46, v58 + v57);
    sub_1000256F8(v45, v49);
    v59 = sub_10000C440(qword_10003D278, type metadata accessor for GridForecastEntry, (uint64_t)&unk_100031828);
    Timeline.init(entries:policy:)(v58, v49, v48, v59);
    sub_100020AFC(v46, type metadata accessor for GridForecastEntry);
    v203(v45, v197);
    v211(v43, v44);
  }
  v151 = v1[67];
  v152 = v1[66];
  v153 = v1[65];
  v155 = v1[63];
  v154 = v1[64];
  v156 = v1[62];
  v158 = v1[58];
  v157 = v1[59];
  v159 = v1[55];
  v163 = v1[54];
  v165 = v1[53];
  v167 = v1[50];
  v169 = v1[49];
  v171 = v1[48];
  v173 = v1[47];
  v175 = v1[46];
  v178 = v1[45];
  v181 = v1[42];
  loga = (os_log_t)v1[41];
  v186 = v1[38];
  v188 = v1[35];
  v192 = v1[34];
  v195 = v1[33];
  v201 = v1[32];
  v207 = v1[29];
  v210 = v1[28];
  v214 = v1[25];
  swift_task_dealloc(v1[68]);
  swift_task_dealloc(v151);
  swift_task_dealloc(v152);
  swift_task_dealloc(v153);
  swift_task_dealloc(v154);
  swift_task_dealloc(v155);
  swift_task_dealloc(v156);
  swift_task_dealloc(v157);
  swift_task_dealloc(v158);
  swift_task_dealloc(v159);
  swift_task_dealloc(v163);
  swift_task_dealloc(v165);
  swift_task_dealloc(v167);
  swift_task_dealloc(v169);
  swift_task_dealloc(v171);
  swift_task_dealloc(v173);
  swift_task_dealloc(v175);
  swift_task_dealloc(v178);
  swift_task_dealloc(v181);
  swift_task_dealloc(loga);
  swift_task_dealloc(v186);
  swift_task_dealloc(v188);
  swift_task_dealloc(v192);
  swift_task_dealloc(v195);
  swift_task_dealloc(v201);
  swift_task_dealloc(v207);
  swift_task_dealloc(v210);
  swift_task_dealloc(v214);
  return ((uint64_t (*)(void))v1[1])();
}

uint64_t sub_1000232E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void (*v20)(_QWORD, uint64_t, uint64_t, _QWORD);
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
  uint64_t *v60;
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
  void (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v2 = *(_QWORD *)(v1 + 568);
  static Logger.gridForecastWidgets.getter(a1);
  swift_errorRetain(v2);
  v3 = swift_errorRetain(v2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v1 + 568);
    v68 = *(_QWORD *)(v1 + 496);
    v71 = *(void (**)(uint64_t, uint64_t))(v1 + 552);
    v65 = *(_QWORD *)(v1 + 480);
    v7 = swift_slowAlloc(22, -1);
    v60 = (uint64_t *)swift_slowAlloc(8, -1);
    v62 = swift_slowAlloc(32, -1);
    v74 = v62;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v1 + 40) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, &v74);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 40, v1 + 48, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2112;
    swift_errorRetain(v6);
    v8 = _swift_stdlib_bridgeErrorToNSError(v6);
    *(_QWORD *)(v1 + 48) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 48, v1 + 56, v7 + 14, v7 + 22);
    *v60 = v8;
    swift_errorRelease(v6);
    swift_errorRelease(v6);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s:ERROR: %@", (uint8_t *)v7, 0x16u);
    v9 = sub_100005E18(&qword_10003CF30);
    swift_arrayDestroy(v60, 1, v9);
    swift_slowDealloc(v60, -1, -1);
    swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v62, -1, -1);
    swift_slowDealloc(v7, -1, -1);

    v71(v68, v65);
  }
  else
  {
    v10 = *(_QWORD *)(v1 + 568);
    v11 = *(void (**)(uint64_t, uint64_t))(v1 + 552);
    v12 = *(_QWORD *)(v1 + 496);
    v13 = *(_QWORD *)(v1 + 480);
    swift_errorRelease(v10);
    swift_errorRelease(v10);

    v11(v12, v13);
  }
  v14 = *(_QWORD *)(v1 + 568);
  v15 = *(_QWORD *)(v1 + 408);
  v16 = *(_QWORD *)(v1 + 416);
  v17 = *(_QWORD *)(v1 + 392);
  *(_QWORD *)(v1 + 64) = v14;
  swift_errorRetain(v14);
  v18 = sub_100005E18(&qword_10003CF28);
  v19 = swift_dynamicCast(v17, v1 + 64, v18, v15, 6);
  v20 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v16 + 56);
  v22 = *(_QWORD *)(v1 + 416);
  v21 = *(_QWORD *)(v1 + 424);
  v23 = *(_QWORD *)(v1 + 408);
  v24 = *(_QWORD *)(v1 + 392);
  if (v19)
  {
    v20(*(_QWORD *)(v1 + 392), 0, 1, *(_QWORD *)(v1 + 408));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v21, v24, v23);
  }
  else
  {
    v20(*(_QWORD *)(v1 + 392), 1, 1, *(_QWORD *)(v1 + 408));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v22 + 104))(v21, enum case for GridForecastError.otherError(_:), v23);
    sub_10000C404(v24, &qword_10003D130);
  }
  v25 = *(_QWORD *)(v1 + 424);
  v66 = *(_QWORD *)(v1 + 568);
  v69 = *(_QWORD *)(v1 + 416);
  v72 = *(_QWORD *)(v1 + 408);
  v26 = *(_QWORD *)(v1 + 384);
  v27 = *(_QWORD *)(v1 + 352);
  v63 = *(_QWORD *)(v1 + 344);
  v29 = *(_QWORD *)(v1 + 328);
  v28 = *(_QWORD *)(v1 + 336);
  v30 = *(_QWORD *)(v1 + 312);
  v31 = *(_QWORD *)(v1 + 320);
  sub_10002626C(v26, v28, v25);
  v32 = sub_100005E18(&qword_10003D2A8);
  v33 = *(unsigned __int8 *)(v27 + 80);
  v34 = (v33 + 32) & ~v33;
  v35 = swift_allocObject(v32, v34 + *(_QWORD *)(v27 + 72), v33 | 7);
  *(_OWORD *)(v35 + 16) = xmmword_1000310E0;
  sub_100027B38(v26, v35 + v34);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v29, v28, v30);
  v36 = sub_10000C440(qword_10003D278, type metadata accessor for GridForecastEntry, (uint64_t)&unk_100031828);
  Timeline.init(entries:policy:)(v35, v29, v63, v36);
  swift_errorRelease(v66);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v28, v30);
  sub_100020AFC(v26, type metadata accessor for GridForecastEntry);
  (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v25, v72);
  v37 = *(_QWORD *)(v1 + 536);
  v38 = *(_QWORD *)(v1 + 528);
  v39 = *(_QWORD *)(v1 + 520);
  v41 = *(_QWORD *)(v1 + 504);
  v40 = *(_QWORD *)(v1 + 512);
  v42 = *(_QWORD *)(v1 + 496);
  v44 = *(_QWORD *)(v1 + 464);
  v43 = *(_QWORD *)(v1 + 472);
  v45 = *(_QWORD *)(v1 + 440);
  v47 = *(_QWORD *)(v1 + 432);
  v48 = *(_QWORD *)(v1 + 424);
  v49 = *(_QWORD *)(v1 + 400);
  v50 = *(_QWORD *)(v1 + 392);
  v51 = *(_QWORD *)(v1 + 384);
  v52 = *(_QWORD *)(v1 + 376);
  v53 = *(_QWORD *)(v1 + 368);
  v54 = *(_QWORD *)(v1 + 360);
  v55 = *(_QWORD *)(v1 + 336);
  v56 = *(_QWORD *)(v1 + 328);
  v57 = *(_QWORD *)(v1 + 304);
  v58 = *(_QWORD *)(v1 + 280);
  v59 = *(_QWORD *)(v1 + 272);
  v61 = *(_QWORD *)(v1 + 264);
  v64 = *(_QWORD *)(v1 + 256);
  v67 = *(_QWORD *)(v1 + 232);
  v70 = *(_QWORD *)(v1 + 224);
  v73 = *(_QWORD *)(v1 + 200);
  swift_task_dealloc(*(_QWORD *)(v1 + 544));
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v54);
  swift_task_dealloc(v55);
  swift_task_dealloc(v56);
  swift_task_dealloc(v57);
  swift_task_dealloc(v58);
  swift_task_dealloc(v59);
  swift_task_dealloc(v61);
  swift_task_dealloc(v64);
  swift_task_dealloc(v67);
  swift_task_dealloc(v70);
  swift_task_dealloc(v73);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100023848(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2[23] = a1;
  v2[24] = a2;
  v3 = type metadata accessor for UUID(0);
  v2[25] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[26] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[27] = swift_task_alloc(v5);
  v2[28] = swift_task_alloc(v5);
  v2[29] = swift_task_alloc(v5);
  v6 = sub_100005E18(&qword_10003CAD8);
  v2[30] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for GridForecastSnapshotManager.SnapshotManagerType(0);
  v2[31] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v2[32] = v8;
  v2[33] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Logger(0);
  v2[34] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v2[35] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[36] = swift_task_alloc(v11);
  v2[37] = swift_task_alloc(v11);
  v2[38] = swift_task_alloc(v11);
  v2[39] = swift_task_alloc(v11);
  v2[40] = swift_task_alloc(v11);
  v2[41] = swift_task_alloc(v11);
  v2[42] = swift_task_alloc(v11);
  v2[43] = swift_task_alloc(v11);
  v2[44] = swift_task_alloc(v11);
  v12 = sub_100005E18(&qword_10003CA98);
  v2[45] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v12 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for ForecastLocationEntity(0);
  v2[46] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v2[47] = v14;
  v2[48] = swift_task_alloc((*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for MainActor(0);
  v2[49] = static MainActor.shared.getter();
  v16 = dispatch thunk of Actor.unownedExecutor.getter(v15, &protocol witness table for MainActor);
  v2[50] = v16;
  v2[51] = v17;
  return swift_task_switch(sub_100023A1C, v16, v17);
}

uint64_t sub_100023A1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  _BOOL4 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  uint64_t v85[2];

  v2 = *(_QWORD *)(v1 + 368);
  v3 = *(_QWORD *)(v1 + 376);
  v4 = *(_QWORD *)(v1 + 360);
  IntentParameter.wrappedValue.getter(a1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
    v5 = *(_QWORD *)(v1 + 360);
    swift_release(*(_QWORD *)(v1 + 392));
    v6 = sub_10000C404(v5, &qword_10003CA98);
    v7 = static Logger.gridForecastWidgets.getter(v6);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.error.getter();
    v10 = os_log_type_enabled(v8, v9);
    v11 = *(_QWORD *)(v1 + 280);
    v12 = *(_QWORD *)(v1 + 288);
    v13 = *(_QWORD *)(v1 + 272);
    if (v10)
    {
      v83 = *(_QWORD *)(v1 + 272);
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      v15 = swift_slowAlloc(32, -1);
      v85[0] = v15;
      *(_DWORD *)v14 = 136315138;
      *(_QWORD *)(v1 + 32) = sub_10000F4DC(0xD000000000000026, 0x8000000100032890, v85);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 32, v1 + 40, v14 + 4, v14 + 12);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s: Widget configuration has no entity (home not found)", v14, 0xCu);
      swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v15, -1, -1);
      swift_slowDealloc(v14, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v83);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
    }
    v34 = type metadata accessor for GridForecastError(0);
    v35 = sub_10000C440(&qword_10003D2B0, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastError, (uint64_t)&protocol conformance descriptor for GridForecastError);
    swift_allocError(v34, v35, 0, 0);
    v37 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v36, enum case for GridForecastError.homeNotFound(_:), v34);
    swift_willThrow(v37);
    v39 = *(_QWORD *)(v1 + 352);
    v38 = *(_QWORD *)(v1 + 360);
    v41 = *(_QWORD *)(v1 + 336);
    v40 = *(_QWORD *)(v1 + 344);
    v43 = *(_QWORD *)(v1 + 320);
    v42 = *(_QWORD *)(v1 + 328);
    v45 = *(_QWORD *)(v1 + 304);
    v44 = *(_QWORD *)(v1 + 312);
    v46 = *(_QWORD *)(v1 + 296);
    v76 = *(_QWORD *)(v1 + 288);
    v77 = *(_QWORD *)(v1 + 264);
    v78 = *(_QWORD *)(v1 + 240);
    v79 = *(_QWORD *)(v1 + 232);
    v81 = *(_QWORD *)(v1 + 224);
    v82 = *(_QWORD *)(v1 + 216);
    swift_task_dealloc(*(_QWORD *)(v1 + 384));
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    swift_task_dealloc(v40);
    swift_task_dealloc(v41);
    swift_task_dealloc(v42);
    swift_task_dealloc(v43);
    swift_task_dealloc(v44);
    swift_task_dealloc(v45);
    swift_task_dealloc(v46);
    swift_task_dealloc(v76);
    swift_task_dealloc(v77);
    swift_task_dealloc(v78);
    swift_task_dealloc(v79);
    swift_task_dealloc(v81);
    swift_task_dealloc(v82);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  else
  {
    v16 = *(_QWORD *)(v1 + 384);
    v17 = *(_QWORD *)(v1 + 368);
    sub_100020B7C(*(_QWORD *)(v1 + 360), v16, type metadata accessor for ForecastLocationEntity);
    EntityProperty.wrappedValue.getter((_QWORD *)(v1 + 16));
    v19 = *(_QWORD *)(v1 + 16);
    v18 = *(_QWORD *)(v1 + 24);
    v20 = v16 + *(int *)(v17 + 28);
    v21 = *(void **)v20;
    *(_QWORD *)(v1 + 416) = *(_QWORD *)v20;
    *(_QWORD *)(v1 + 424) = *(_QWORD *)(v20 + 8);
    v22 = *(unsigned __int8 *)(v20 + 16);
    if (v22)
    {
      if (v22 == 1)
      {
        v23 = v21;
        static Logger.gridForecastWidgets.getter(v23);
        swift_bridgeObjectRetain_n(v18, 2);
        v25 = Logger.logObject.getter(v24);
        v26 = static os_log_type_t.default.getter();
        v27 = os_log_type_enabled(v25, v26);
        v28 = *(_QWORD *)(v1 + 352);
        v29 = *(_QWORD *)(v1 + 272);
        v30 = *(_QWORD *)(v1 + 280);
        if (v27)
        {
          v84 = v23;
          v31 = swift_slowAlloc(22, -1);
          v80 = v28;
          v32 = swift_slowAlloc(64, -1);
          v85[0] = v32;
          *(_DWORD *)v31 = 136315394;
          *(_QWORD *)(v1 + 168) = sub_10000F4DC(0xD000000000000026, 0x8000000100032890, v85);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 168, v1 + 176, v31 + 4, v31 + 12);
          *(_WORD *)(v31 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v1 + 176) = sub_10000F4DC(v19, v18, v85);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 176, v1 + 184, v31 + 14, v31 + 22);
          swift_bridgeObjectRelease_n(v18, 3);
          _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s: Widget configuration is for static location: %s", (uint8_t *)v31, 0x16u);
          swift_arrayDestroy(v32, 2, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v32, -1, -1);
          v33 = v31;
          v23 = v84;
          swift_slowDealloc(v33, -1, -1);

          (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v80, v29);
        }
        else
        {
          swift_bridgeObjectRelease_n(v18, 2);

          (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
        }
        v63 = *(_QWORD *)(v1 + 264);
        v64 = *(_QWORD *)(v1 + 240);
        v65 = *(_QWORD *)(v1 + 200);
        v66 = *(_QWORD *)(v1 + 208);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v1 + 256) + 104))(v63, enum case for GridForecastSnapshotManager.SnapshotManagerType.widgetSingleShot(_:), *(_QWORD *)(v1 + 248));
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v66 + 56))(v64, 1, 1, v65);
        v67 = type metadata accessor for GridForecastSnapshotManager(0);
        swift_allocObject(v67, *(unsigned int *)(v67 + 48), *(unsigned __int16 *)(v67 + 52));
        v68 = v23;
        *(_QWORD *)(v1 + 432) = GridForecastSnapshotManager.init(type:location:locationName:locationUUID:)(v63, v21, v19, v18, v64);
        v69 = (_QWORD *)swift_task_alloc(async function pointer to GridForecastSnapshotManager.retrieveFixedSnapshot()[1]);
        *(_QWORD *)(v1 + 440) = v69;
        *v69 = v1;
        v69[1] = sub_100024234;
        return GridForecastSnapshotManager.retrieveFixedSnapshot()(*(_QWORD *)(v1 + 184));
      }
      else
      {
        v53 = swift_bridgeObjectRelease(v18);
        v54 = static Logger.gridForecastWidgets.getter(v53);
        v55 = Logger.logObject.getter(v54);
        v56 = static os_log_type_t.default.getter();
        v57 = os_log_type_enabled(v55, v56);
        v58 = *(_QWORD *)(v1 + 296);
        v59 = *(_QWORD *)(v1 + 272);
        v60 = *(_QWORD *)(v1 + 280);
        if (v57)
        {
          v61 = (uint8_t *)swift_slowAlloc(12, -1);
          v62 = swift_slowAlloc(32, -1);
          v85[0] = v62;
          *(_DWORD *)v61 = 136315138;
          *(_QWORD *)(v1 + 40) = sub_10000F4DC(0xD000000000000026, 0x8000000100032890, v85);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 40, v1 + 48, v61 + 4, v61 + 12);
          _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s: Widget configuration is for current location.", v61, 0xCu);
          swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v62, -1, -1);
          swift_slowDealloc(v61, -1, -1);

        }
        else
        {

        }
        (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v58, v59);
        v70 = *(_QWORD *)(v1 + 264);
        v71 = *(_QWORD *)(v1 + 240);
        v72 = *(_QWORD *)(v1 + 200);
        v73 = *(_QWORD *)(v1 + 208);
        (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v1 + 256) + 104))(v70, enum case for GridForecastSnapshotManager.SnapshotManagerType.widgetSingleShot(_:), *(_QWORD *)(v1 + 248));
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v73 + 56))(v71, 1, 1, v72);
        v74 = type metadata accessor for GridForecastSnapshotManager(0);
        swift_allocObject(v74, *(unsigned int *)(v74 + 48), *(unsigned __int16 *)(v74 + 52));
        *(_QWORD *)(v1 + 512) = GridForecastSnapshotManager.init(type:location:locationName:locationUUID:)(v70, 0, 0, 0, v71);
        v75 = (_QWORD *)swift_task_alloc(async function pointer to GridForecastSnapshotManager.retrieveImmediateLocationSnapshotForWidget()[1]);
        *(_QWORD *)(v1 + 520) = v75;
        *v75 = v1;
        v75[1] = sub_100025588;
        return GridForecastSnapshotManager.retrieveImmediateLocationSnapshotForWidget()(*(_QWORD *)(v1 + 184));
      }
    }
    else
    {
      v48 = *(_QWORD *)(v1 + 384);
      v49 = *(_QWORD *)(v1 + 232);
      v50 = *(_QWORD *)(v1 + 200);
      v51 = *(_QWORD *)(v1 + 208);
      swift_bridgeObjectRelease(v18);
      v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16);
      *(_QWORD *)(v1 + 448) = v52;
      v52(v49, v48, v50);
      return swift_task_switch(sub_1000243B8, 0, 0);
    }
  }
}

uint64_t sub_100024234()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 440));
  return swift_task_switch(sub_100024280, *(_QWORD *)(v1 + 400), *(_QWORD *)(v1 + 408));
}

uint64_t sub_100024280()
{
  uint64_t v0;
  void *v1;
  void *v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(void **)(v0 + 424);
  v2 = *(void **)(v0 + 416);
  v4 = *(_QWORD *)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 392);
  swift_release(*(_QWORD *)(v0 + 432));
  swift_release(v3);
  sub_10000A088(v2, v1, 1);
  sub_100020AFC(v4, type metadata accessor for ForecastLocationEntity);
  v6 = *(_QWORD *)(v0 + 352);
  v5 = *(_QWORD *)(v0 + 360);
  v8 = *(_QWORD *)(v0 + 336);
  v7 = *(_QWORD *)(v0 + 344);
  v10 = *(_QWORD *)(v0 + 320);
  v9 = *(_QWORD *)(v0 + 328);
  v11 = *(_QWORD *)(v0 + 304);
  v12 = *(_QWORD *)(v0 + 312);
  v13 = *(_QWORD *)(v0 + 296);
  v15 = *(_QWORD *)(v0 + 288);
  v16 = *(_QWORD *)(v0 + 264);
  v17 = *(_QWORD *)(v0 + 240);
  v18 = *(_QWORD *)(v0 + 232);
  v19 = *(_QWORD *)(v0 + 224);
  v20 = *(_QWORD *)(v0 + 216);
  swift_task_dealloc(*(_QWORD *)(v0 + 384));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v12);
  swift_task_dealloc(v11);
  swift_task_dealloc(v13);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000243B8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 456) = v1;
  v2 = sub_1000066D4(0, &qword_10003C770, HMHomeManager_ptr);
  *v1 = v0;
  v1[1] = sub_100024458;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 48, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004008, 0, v2);
}

uint64_t sub_100024458()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 456));
  return swift_task_switch(sub_1000244AC, 0, 0);
}

uint64_t sub_1000244AC()
{
  _QWORD *v0;

  v0[58] = v0[6];
  return swift_task_switch(sub_1000244C4, v0[50], v0[51]);
}

uint64_t sub_1000244C4()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
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
  void *v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  _BOOL4 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  id v69;
  void *v70;
  id v71;
  NSObject *v72;
  os_log_type_t v73;
  _BOOL4 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  NSObject *v84;
  os_log_type_t v85;
  _BOOL4 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  NSObject *v96;
  os_log_type_t v97;
  _BOOL4 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
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
  uint64_t v119;
  uint64_t v120;
  void (*v122)(uint64_t, uint64_t, uint64_t);
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  _QWORD *v134;
  uint64_t v135;
  NSObject *log;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  os_log_type_t v140[8];
  os_log_type_t v141;
  uint64_t *v142;
  uint64_t v143;
  os_log_type_t v144[8];
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void (*v164)(uint64_t, uint64_t);
  void (*v165)(uint64_t, uint64_t);
  uint64_t v166[2];

  v1 = *(void **)(v0 + 464);
  v2 = objc_msgSend(v1, "homes");

  v158 = sub_1000066D4(0, &qword_10003CAE0, HMHome_ptr);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v158);

  static Logger.gridForecastWidgets.getter(v4);
  swift_bridgeObjectRetain_n(v3, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc(22, -1);
    v9 = swift_slowAlloc(32, -1);
    v166[0] = v9;
    *(_DWORD *)v8 = 136315394;
    *(_QWORD *)(v0 + 152) = sub_10000F4DC(0xD000000000000026, 0x8000000100032890, v166);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 160, v8 + 4, v8 + 12);
    *(_WORD *)(v8 + 12) = 2048;
    if ((unint64_t)v3 >> 62)
    {
      if (v3 < 0)
        v135 = v3;
      else
        v135 = v3 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      v10 = _CocoaArrayWrapper.endIndex.getter(v135);
      swift_bridgeObjectRelease(v3);
    }
    else
    {
      v10 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v163 = *(_QWORD *)(v0 + 344);
    v12 = *(_QWORD *)(v0 + 272);
    v11 = *(_QWORD *)(v0 + 280);
    swift_bridgeObjectRelease(v3);
    *(_QWORD *)(v0 + 160) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 160, v0 + 168, v8 + 14, v8 + 22);
    swift_bridgeObjectRelease(v3);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s HomeManagerActor returned %ld home(s)", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

    v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v13(v163, v12);
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 344);
    v15 = *(_QWORD *)(v0 + 272);
    v16 = *(_QWORD *)(v0 + 280);
    swift_bridgeObjectRelease_n(v3, 2);

    v13 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v13(v14, v15);
  }
  v17 = *(_QWORD *)(v0 + 232);
  v18 = swift_task_alloc(32);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = sub_100021368(sub_100027B94, v18, v3);
  *(_QWORD *)(v0 + 472) = v19;
  swift_task_dealloc(v18);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 448);
  if (v19)
  {
    v164 = v13;
    v22 = *(_QWORD *)(v0 + 224);
    v21 = *(_QWORD *)(v0 + 232);
    v23 = *(_QWORD *)(v0 + 200);
    v148 = v19;
    v24 = v19;
    v25 = swift_bridgeObjectRelease(v3);
    static Logger.gridForecastWidgets.getter(v25);
    v20(v22, v21, v23);
    v26 = v24;
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.default.getter();
    v29 = os_log_type_enabled(v27, v28);
    v30 = *(_QWORD *)(v0 + 336);
    v31 = *(_QWORD *)(v0 + 272);
    v32 = *(_QWORD *)(v0 + 224);
    v33 = *(_QWORD *)(v0 + 208);
    v159 = *(_QWORD *)(v0 + 200);
    v151 = (uint64_t *)(v0 + 80);
    if (v29)
    {
      *(_QWORD *)v140 = *(_QWORD *)(v0 + 272);
      v34 = swift_slowAlloc(32, -1);
      v35 = (_QWORD *)swift_slowAlloc(8, -1);
      v137 = swift_slowAlloc(64, -1);
      v166[0] = v137;
      *(_DWORD *)v34 = 136315650;
      v138 = v30;
      *(_QWORD *)(v0 + 128) = sub_10000F4DC(0xD000000000000026, 0x8000000100032890, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136, v34 + 4, v34 + 12);
      *(_WORD *)(v34 + 12) = 2112;
      *(_QWORD *)(v0 + 136) = v26;
      log = v27;
      v36 = v26;
      v37 = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144, v34 + 14, v34 + 22);
      *v35 = v148;

      v26 = v36;
      *(_WORD *)(v34 + 22) = 2080;
      v39 = UUID.uuidString.getter(v38);
      v41 = v40;
      *(_QWORD *)(v0 + 144) = sub_10000F4DC(v39, v40, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152, v34 + 24, v34 + 32);
      swift_bridgeObjectRelease(v41);
      v42 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
      v42(v32, v159);
      _os_log_impl((void *)&_mh_execute_header, log, v28, "%s: Widget configuration is for a home: %@ with ID: %s", (uint8_t *)v34, 0x20u);
      v43 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v35, 1, v43);
      swift_slowDealloc(v35, -1, -1);
      swift_arrayDestroy(v137, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v137, -1, -1);
      swift_slowDealloc(v34, -1, -1);

      v44 = v138;
      v45 = *(_QWORD *)v140;
    }
    else
    {

      v42 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
      v42(v32, v159);

      v44 = v30;
      v45 = v31;
    }
    v68 = (uint64_t (*)(uint64_t, uint64_t))v164;
    v164(v44, v45);
    *(_QWORD *)(v0 + 480) = v42;
    v69 = objc_msgSend(v26, "location");
    v156 = v26;
    if (v69)
    {
      v70 = v69;
      v142 = (uint64_t *)(v0 + 96);
      static Logger.gridForecastWidgets.getter(v69);
      v71 = v70;
      v72 = Logger.logObject.getter(v71);
      v73 = static os_log_type_t.info.getter();
      v74 = os_log_type_enabled(v72, v73);
      v75 = *(_QWORD *)(v0 + 328);
      v152 = *(_QWORD *)(v0 + 272);
      v160 = v70;
      if (v74)
      {
        v76 = swift_slowAlloc(22, -1);
        v139 = v75;
        v77 = swift_slowAlloc(64, -1);
        v166[0] = v77;
        *(_DWORD *)v76 = 136315394;
        *(_QWORD *)(v0 + 112) = sub_10000F4DC(0xD000000000000026, 0x8000000100032890, v166);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120, v76 + 4, v76 + 12);
        *(_WORD *)(v76 + 12) = 2080;
        v78 = static EKLocation.safeLog(_:)(v70);
        v80 = v79;
        *(_QWORD *)(v0 + 120) = sub_10000F4DC(v78, v79, v166);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 120, v0 + 128, v76 + 14, v76 + 22);
        swift_bridgeObjectRelease(v80);

        _os_log_impl((void *)&_mh_execute_header, v72, v73, "%s: Home location found...%s", (uint8_t *)v76, 0x16u);
        swift_arrayDestroy(v77, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v77, -1, -1);
        v81 = v76;
        v68 = (uint64_t (*)(uint64_t, uint64_t))v164;
        swift_slowDealloc(v81, -1, -1);

        v82 = v139;
      }
      else
      {

        v82 = v75;
      }
      v94 = v68(v82, v152);
      static Logger.gridForecastWidgets.getter(v94);
      v95 = v71;
      v96 = Logger.logObject.getter(v95);
      v97 = static os_log_type_t.debug.getter();
      v98 = os_log_type_enabled(v96, v97);
      v99 = *(_QWORD *)(v0 + 320);
      v100 = *(_QWORD *)(v0 + 272);
      if (v98)
      {
        v153 = *(_QWORD *)(v0 + 320);
        v101 = swift_slowAlloc(22, -1);
        v102 = (_QWORD *)swift_slowAlloc(8, -1);
        v103 = swift_slowAlloc(32, -1);
        v166[0] = v103;
        *(_DWORD *)v101 = 136315394;
        *v142 = sub_10000F4DC(0xD000000000000026, 0x8000000100032890, v166);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v142, v0 + 104, v101 + 4, v101 + 12);
        *(_WORD *)(v101 + 12) = 2112;
        *(_QWORD *)(v0 + 104) = v95;
        v95 = v95;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 104, v0 + 112, v101 + 14, v101 + 22);
        *v102 = v160;

        _os_log_impl((void *)&_mh_execute_header, v96, v97, "\t...%s:%@", (uint8_t *)v101, 0x16u);
        v104 = sub_100005E18(&qword_10003CF30);
        swift_arrayDestroy(v102, 1, v104);
        swift_slowDealloc(v102, -1, -1);
        swift_arrayDestroy(v103, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v103, -1, -1);
        swift_slowDealloc(v101, -1, -1);

        v164(v153, v100);
      }
      else
      {

        v68(v99, v100);
      }
    }
    else
    {
      static Logger.gridForecastWidgets.getter(0);
      v83 = v26;
      v84 = Logger.logObject.getter(v83);
      v85 = static os_log_type_t.error.getter();
      v86 = os_log_type_enabled(v84, v85);
      v87 = *(_QWORD *)(v0 + 312);
      v88 = *(_QWORD *)(v0 + 272);
      if (v86)
      {
        v161 = *(_QWORD *)(v0 + 272);
        v146 = *(_QWORD *)(v0 + 312);
        v89 = swift_slowAlloc(22, -1);
        v90 = (_QWORD *)swift_slowAlloc(8, -1);
        v143 = swift_slowAlloc(32, -1);
        v166[0] = v143;
        *(_DWORD *)v89 = 136315394;
        *v151 = sub_10000F4DC(0xD000000000000026, 0x8000000100032890, v166);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v151, v0 + 88, v89 + 4, v89 + 12);
        *(_WORD *)(v89 + 12) = 2112;
        *(_QWORD *)(v0 + 88) = v83;
        v91 = v83;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 96, v89 + 14, v89 + 22);
        *v90 = v148;

        _os_log_impl((void *)&_mh_execute_header, v84, v85, "%s: Home location disappeared, no longer valid: %@", (uint8_t *)v89, 0x16u);
        v92 = sub_100005E18(&qword_10003CF30);
        swift_arrayDestroy(v90, 1, v92);
        swift_slowDealloc(v90, -1, -1);
        swift_arrayDestroy(v143, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v143, -1, -1);
        swift_slowDealloc(v89, -1, -1);

        v93 = ((uint64_t (*)(uint64_t, uint64_t))v164)(v146, v161);
      }
      else
      {

        v93 = ((uint64_t (*)(uint64_t, uint64_t))v164)(v87, v88);
      }
      v95 = (id)static EKLocation.invalidLocation.getter(v93);
      v160 = v95;
    }
    *(_QWORD *)(v0 + 488) = v95;
    v122 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 448);
    v123 = *(_QWORD *)(v0 + 264);
    v124 = *(_QWORD *)(v0 + 240);
    v125 = *(_QWORD *)(v0 + 232);
    v126 = *(_QWORD *)(v0 + 200);
    v127 = *(_QWORD *)(v0 + 208);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 104))(v123, enum case for GridForecastSnapshotManager.SnapshotManagerType.widgetSingleShot(_:), *(_QWORD *)(v0 + 248));
    v128 = v95;
    v129 = objc_msgSend(v156, "name");
    v130 = static String._unconditionallyBridgeFromObjectiveC(_:)(v129);
    v132 = v131;

    v122(v124, v125, v126);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v127 + 56))(v124, 0, 1, v126);
    v133 = type metadata accessor for GridForecastSnapshotManager(0);
    swift_allocObject(v133, *(unsigned int *)(v133 + 48), *(unsigned __int16 *)(v133 + 52));
    *(_QWORD *)(v0 + 496) = GridForecastSnapshotManager.init(type:location:locationName:locationUUID:)(v123, v160, v130, v132, v124);
    v134 = (_QWORD *)swift_task_alloc(async function pointer to GridForecastSnapshotManager.retrieveFixedSnapshot()[1]);
    *(_QWORD *)(v0 + 504) = v134;
    *v134 = v0;
    v134[1] = sub_1000253F4;
    return GridForecastSnapshotManager.retrieveFixedSnapshot()(*(_QWORD *)(v0 + 184));
  }
  else
  {
    v46 = *(_QWORD *)(v0 + 232);
    v47 = *(_QWORD *)(v0 + 216);
    v48 = *(_QWORD *)(v0 + 200);
    v49 = swift_release(*(_QWORD *)(v0 + 392));
    static Logger.gridForecastWidgets.getter(v49);
    v20(v47, v46, v48);
    v50 = swift_bridgeObjectRetain();
    v51 = Logger.logObject.getter(v50);
    v52 = static os_log_type_t.default.getter();
    v53 = os_log_type_enabled(v51, v52);
    v54 = *(_QWORD *)(v0 + 304);
    v155 = *(_QWORD *)(v0 + 272);
    v56 = *(_QWORD *)(v0 + 208);
    v55 = *(_QWORD *)(v0 + 216);
    v57 = *(_QWORD *)(v0 + 200);
    if (v53)
    {
      v165 = v13;
      v149 = *(_QWORD *)(v0 + 304);
      v58 = swift_slowAlloc(32, -1);
      v145 = swift_slowAlloc(96, -1);
      v166[0] = v145;
      *(_DWORD *)v58 = 136315650;
      v141 = v52;
      *(_QWORD *)(v0 + 56) = sub_10000F4DC(0xD000000000000026, 0x8000000100032890, v166);
      v59 = UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v58 + 4, v58 + 12);
      *(_WORD *)(v58 + 12) = 2080;
      v60 = UUID.uuidString.getter(v59);
      v62 = v61;
      *(_QWORD *)(v0 + 64) = sub_10000F4DC(v60, v61, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v58 + 14, v58 + 22);
      swift_bridgeObjectRelease(v62);
      v63 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
      v63(v55, v57);
      *(_WORD *)(v58 + 22) = 2080;
      v64 = swift_bridgeObjectRetain();
      v65 = Array.description.getter(v64, v158);
      v67 = v66;
      swift_bridgeObjectRelease(v3);
      *(_QWORD *)(v0 + 72) = sub_10000F4DC(v65, v67, v166);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v58 + 24, v58 + 32);
      swift_bridgeObjectRelease(v67);
      swift_bridgeObjectRelease_n(v3, 2);
      _os_log_impl((void *)&_mh_execute_header, v51, v141, "%s: Widget configuration could not find %s in %s", (uint8_t *)v58, 0x20u);
      swift_arrayDestroy(v145, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v145, -1, -1);
      swift_slowDealloc(v58, -1, -1);

      v165(v149, v155);
    }
    else
    {
      v63 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
      v63(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 200));
      swift_bridgeObjectRelease_n(v3, 2);

      v13(v54, v155);
    }
    v105 = *(_QWORD *)(v0 + 384);
    v106 = *(_QWORD *)(v0 + 232);
    v107 = *(_QWORD *)(v0 + 200);
    v108 = type metadata accessor for GridForecastError(0);
    v109 = sub_10000C440(&qword_10003D2B0, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastError, (uint64_t)&protocol conformance descriptor for GridForecastError);
    swift_allocError(v108, v109, 0, 0);
    v111 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v108 - 8) + 104))(v110, enum case for GridForecastError.homeNotFound(_:), v108);
    swift_willThrow(v111);
    sub_100020AFC(v105, type metadata accessor for ForecastLocationEntity);
    v63(v106, v107);
    v113 = *(_QWORD *)(v0 + 352);
    v112 = *(_QWORD *)(v0 + 360);
    v115 = *(_QWORD *)(v0 + 336);
    v114 = *(_QWORD *)(v0 + 344);
    v117 = *(_QWORD *)(v0 + 320);
    v116 = *(_QWORD *)(v0 + 328);
    v118 = *(_QWORD *)(v0 + 304);
    v119 = *(_QWORD *)(v0 + 312);
    v120 = *(_QWORD *)(v0 + 296);
    *(_QWORD *)v144 = *(_QWORD *)(v0 + 288);
    v147 = *(_QWORD *)(v0 + 264);
    v150 = *(_QWORD *)(v0 + 240);
    v154 = *(_QWORD *)(v0 + 232);
    v157 = *(_QWORD *)(v0 + 224);
    v162 = *(_QWORD *)(v0 + 216);
    swift_task_dealloc(*(_QWORD *)(v0 + 384));
    swift_task_dealloc(v112);
    swift_task_dealloc(v113);
    swift_task_dealloc(v114);
    swift_task_dealloc(v115);
    swift_task_dealloc(v116);
    swift_task_dealloc(v117);
    swift_task_dealloc(v119);
    swift_task_dealloc(v118);
    swift_task_dealloc(v120);
    swift_task_dealloc(*(_QWORD *)v144);
    swift_task_dealloc(v147);
    swift_task_dealloc(v150);
    swift_task_dealloc(v154);
    swift_task_dealloc(v157);
    swift_task_dealloc(v162);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1000253F4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 504));
  return swift_task_switch(sub_100025440, *(_QWORD *)(v1 + 400), *(_QWORD *)(v1 + 408));
}

uint64_t sub_100025440()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t);
  void *v4;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = *(void **)(v0 + 488);
  v1 = *(_QWORD *)(v0 + 496);
  v4 = *(void **)(v0 + 472);
  v3 = *(void (**)(uint64_t, uint64_t))(v0 + 480);
  v5 = *(_QWORD *)(v0 + 384);
  v6 = *(_QWORD *)(v0 + 232);
  v7 = *(_QWORD *)(v0 + 200);
  swift_release(*(_QWORD *)(v0 + 392));
  swift_release(v1);

  sub_100020AFC(v5, type metadata accessor for ForecastLocationEntity);
  v3(v6, v7);
  v9 = *(_QWORD *)(v0 + 352);
  v8 = *(_QWORD *)(v0 + 360);
  v11 = *(_QWORD *)(v0 + 336);
  v10 = *(_QWORD *)(v0 + 344);
  v13 = *(_QWORD *)(v0 + 320);
  v12 = *(_QWORD *)(v0 + 328);
  v14 = *(_QWORD *)(v0 + 304);
  v15 = *(_QWORD *)(v0 + 312);
  v16 = *(_QWORD *)(v0 + 296);
  v18 = *(_QWORD *)(v0 + 288);
  v19 = *(_QWORD *)(v0 + 264);
  v20 = *(_QWORD *)(v0 + 240);
  v21 = *(_QWORD *)(v0 + 232);
  v22 = *(_QWORD *)(v0 + 224);
  v23 = *(_QWORD *)(v0 + 216);
  swift_task_dealloc(*(_QWORD *)(v0 + 384));
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v15);
  swift_task_dealloc(v14);
  swift_task_dealloc(v16);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100025588()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 520));
  return swift_task_switch(sub_1000255D4, *(_QWORD *)(v1 + 400), *(_QWORD *)(v1 + 408));
}

uint64_t sub_1000255D4()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 512);
  v2 = *(_QWORD *)(v0 + 384);
  swift_release(*(_QWORD *)(v0 + 392));
  swift_release(v1);
  sub_100020AFC(v2, type metadata accessor for ForecastLocationEntity);
  v4 = *(_QWORD *)(v0 + 352);
  v3 = *(_QWORD *)(v0 + 360);
  v6 = *(_QWORD *)(v0 + 336);
  v5 = *(_QWORD *)(v0 + 344);
  v8 = *(_QWORD *)(v0 + 320);
  v7 = *(_QWORD *)(v0 + 328);
  v9 = *(_QWORD *)(v0 + 304);
  v10 = *(_QWORD *)(v0 + 312);
  v11 = *(_QWORD *)(v0 + 296);
  v13 = *(_QWORD *)(v0 + 288);
  v14 = *(_QWORD *)(v0 + 264);
  v15 = *(_QWORD *)(v0 + 240);
  v16 = *(_QWORD *)(v0 + 232);
  v17 = *(_QWORD *)(v0 + 224);
  v18 = *(_QWORD *)(v0 + 216);
  swift_task_dealloc(*(_QWORD *)(v0 + 384));
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v10);
  swift_task_dealloc(v9);
  swift_task_dealloc(v11);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000256F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void (*v27)(uint64_t, char *, uint64_t);
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t (*v49)(char *, uint64_t, uint64_t);
  uint64_t v50;
  char *v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  char *v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  char *v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  uint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  void (*v105)(uint64_t, char *, uint64_t);
  char *v106;
  uint64_t v107;
  uint64_t v108[2];

  v4 = type metadata accessor for Date(0);
  v97 = *(_QWORD *)(v4 - 8);
  v98 = (_QWORD *)v4;
  __chkstk_darwin(v4);
  v96 = (char *)&v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = type metadata accessor for TimelineReloadPolicy(0);
  v100 = *(_QWORD *)(v102 - 8);
  __chkstk_darwin(v102);
  v101 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for GridForecastError(0);
  v8 = *(char **)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v103 = (char *)&v88 - v13;
  __chkstk_darwin(v12);
  v15 = (char *)&v88 - v14;
  v104 = type metadata accessor for Logger(0);
  v16 = *(_QWORD *)(v104 - 8);
  v17 = __chkstk_darwin(v104);
  v19 = (char *)&v88 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v17);
  v95 = (char *)&v88 - v21;
  v22 = __chkstk_darwin(v20);
  v93 = (char *)&v88 - v23;
  v24 = __chkstk_darwin(v22);
  v26 = (char *)&v88 - v25;
  static Logger.gridForecastWidgets.getter(v24);
  v27 = (void (*)(uint64_t, char *, uint64_t))*((_QWORD *)v8 + 2);
  v99 = a1;
  v105 = v27;
  v106 = v8;
  v28 = ((uint64_t (*)(char *, uint64_t, uint64_t))v27)(v15, a1, v7);
  v29 = Logger.logObject.getter(v28);
  v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc(22, -1);
    v91 = v16;
    v32 = v31;
    v33 = swift_slowAlloc(8, -1);
    v94 = a2;
    v89 = (_QWORD *)v33;
    v90 = swift_slowAlloc(32, -1);
    v108[0] = v90;
    *(_DWORD *)v32 = 136315394;
    v107 = sub_10000F4DC(0xD00000000000001BLL, 0x8000000100032790, v108);
    v92 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, v108, v32 + 4, v32 + 12);
    *(_WORD *)(v32 + 12) = 2112;
    v34 = sub_10000C440(&qword_10003D2B0, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastError, (uint64_t)&protocol conformance descriptor for GridForecastError);
    v35 = v19;
    v36 = swift_allocError(v7, v34, 0, 0);
    v105(v37, v15, v7);
    v38 = _swift_stdlib_bridgeErrorToNSError(v36);
    v107 = v38;
    v11 = v92;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, v108, v32 + 14, v32 + 22);
    v39 = v89;
    *v89 = v38;
    v19 = v35;
    v40 = (void (*)(char *, uint64_t))*((_QWORD *)v106 + 1);
    v40(v15, v7);
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "%s: Erroring out widget due to snapshot error: %@", (uint8_t *)v32, 0x16u);
    v41 = sub_100005E18(&qword_10003CF30);
    swift_arrayDestroy(v39, 1, v41);
    v42 = v39;
    a2 = v94;
    swift_slowDealloc(v42, -1, -1);
    v43 = v90;
    swift_arrayDestroy(v90, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v43, -1, -1);
    swift_slowDealloc(v32, -1, -1);

    v44 = *(uint64_t (**)(char *, uint64_t))(v91 + 8);
  }
  else
  {
    v40 = (void (*)(char *, uint64_t))*((_QWORD *)v106 + 1);
    v40(v15, v7);

    v44 = *(uint64_t (**)(char *, uint64_t))(v16 + 8);
  }
  v45 = v104;
  v46 = v44(v26, v104);
  static TimelineReloadPolicy.atEnd.getter(v46);
  v47 = v103;
  v48 = v99;
  v49 = (uint64_t (*)(char *, uint64_t, uint64_t))v105;
  v105((uint64_t)v103, (char *)v99, v7);
  v50 = (*((uint64_t (**)(char *, uint64_t))v106 + 11))(v47, v7);
  if ((_DWORD)v50 == enum case for GridForecastError.gettingLocation(_:)
    || (_DWORD)v50 == enum case for GridForecastError.gettingGridID(_:)
    || (_DWORD)v50 == enum case for GridForecastError.gettingEnergyWindows(_:))
  {
    v59 = v95;
    v60 = static Logger.gridForecastWidgets.getter(v50);
    v61 = Logger.logObject.getter(v60);
    v62 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc(12, -1);
      v64 = swift_slowAlloc(32, -1);
      v108[0] = v64;
      *(_DWORD *)v63 = 136315138;
      v107 = sub_10000F4DC(0xD00000000000001BLL, 0x8000000100032790, v108);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, v108, v63 + 4, v63 + 12);
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s: windows are still loading (or a transient error), displaying empty, retrying as soon as WidgetKit allows...", v63, 0xCu);
      swift_arrayDestroy(v64, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v64, -1, -1);
      swift_slowDealloc(v63, -1, -1);
    }

    v57 = v44(v59, v45);
    v58 = 60.0;
    goto LABEL_18;
  }
  if ((_DWORD)v50 == enum case for GridForecastError.noLocationPermission(_:)
    || (_DWORD)v50 == enum case for GridForecastError.noLocationFound(_:)
    || (_DWORD)v50 == enum case for GridForecastError.noLocationInHome(_:)
    || (_DWORD)v50 == enum case for GridForecastError.noGridIDAvailable(_:))
  {
LABEL_24:
    static Logger.gridForecastWidgets.getter(v50);
    v72 = v49(v11, v48, v7);
    v73 = v19;
    v74 = Logger.logObject.getter(v72);
    v75 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v74, v75))
    {
      v76 = swift_slowAlloc(22, -1);
      v106 = v73;
      v77 = v76;
      v98 = (_QWORD *)swift_slowAlloc(8, -1);
      v99 = swift_slowAlloc(32, -1);
      v108[0] = v99;
      *(_DWORD *)v77 = 136315394;
      v94 = a2;
      v107 = sub_10000F4DC(0xD00000000000001BLL, 0x8000000100032790, v108);
      v103 = (char *)v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, v108, v77 + 4, v77 + 12);
      *(_WORD *)(v77 + 12) = 2112;
      v78 = sub_10000C440(&qword_10003D2B0, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastError, (uint64_t)&protocol conformance descriptor for GridForecastError);
      v79 = swift_allocError(v7, v78, 0, 0);
      v49(v80, (uint64_t)v11, v7);
      v81 = _swift_stdlib_bridgeErrorToNSError(v79);
      v107 = v81;
      a2 = v94;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, v108, v77 + 14, v77 + 22);
      v82 = v98;
      *v98 = v81;
      v40(v11, v7);
      _os_log_impl((void *)&_mh_execute_header, v74, v75, "%s: window loading failed, erroring out widget. Unrecoverable error: %@", (uint8_t *)v77, 0x16u);
      v83 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v82, 1, v83);
      swift_slowDealloc(v82, -1, -1);
      v84 = v99;
      swift_arrayDestroy(v99, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v84, -1, -1);
      swift_slowDealloc(v77, -1, -1);

      v85 = ((uint64_t (*)(char *, uint64_t))v103)(v106, v104);
    }
    else
    {
      v40(v11, v7);

      v85 = v44(v73, v45);
    }
    v66 = v101;
    static TimelineReloadPolicy.never.getter(v85);
    goto LABEL_28;
  }
  if ((_DWORD)v50 != enum case for GridForecastError.gridIDLookupFailure(_:))
  {
    if ((_DWORD)v50 != enum case for GridForecastError.failedEnergyWindows(_:)
      && (_DWORD)v50 != enum case for GridForecastError.homeNotFound(_:)
      && (_DWORD)v50 != enum case for GridForecastError.noHomePermission(_:)
      && (_DWORD)v50 != enum case for GridForecastError.otherError(_:))
    {
      v67 = v101;
      static TimelineReloadPolicy.never.getter(v50);
      v68 = v7;
      v69 = v100;
      v70 = v102;
      (*(void (**)(uint64_t, uint64_t))(v100 + 8))(a2, v102);
      (*(void (**)(uint64_t, char *, uint64_t))(v69 + 32))(a2, v67, v70);
      return ((uint64_t (*)(char *, uint64_t))v40)(v103, v68);
    }
    goto LABEL_24;
  }
  v51 = v93;
  v52 = static Logger.gridForecastWidgets.getter(v50);
  v53 = Logger.logObject.getter(v52);
  v54 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc(12, -1);
    v56 = swift_slowAlloc(32, -1);
    v108[0] = v56;
    *(_DWORD *)v55 = 136315138;
    v107 = sub_10000F4DC(0xD00000000000001BLL, 0x8000000100032790, v108);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, v108, v55 + 4, v55 + 12);
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "%s: window loading failed, but error is recoverable, asking for 5 minute reload", v55, 0xCu);
    swift_arrayDestroy(v56, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v56, -1, -1);
    swift_slowDealloc(v55, -1, -1);
  }

  v57 = v44(v51, v45);
  v58 = 300.0;
LABEL_18:
  v65 = v96;
  Date.init(timeIntervalSinceNow:)(v57, v58);
  v66 = v101;
  static TimelineReloadPolicy.after(_:)(v65);
  (*(void (**)(char *, _QWORD *))(v97 + 8))(v65, v98);
LABEL_28:
  v86 = v100;
  v87 = v102;
  (*(void (**)(uint64_t, uint64_t))(v100 + 8))(a2, v102);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v86 + 32))(a2, v66, v87);
}

unint64_t sub_100026148()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  void *object;
  Swift::String v4;
  uint64_t v5;
  Swift::String v6;
  void *v7;
  Swift::String v8;
  Swift::String v9;
  void *v10;

  _StringGuts.grow(_:)(50);
  swift_bridgeObjectRelease(0xE000000000000000);
  v1 = type metadata accessor for GridForecastEntry(0);
  v2 = Date.formatted()();
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._countAndFlagsBits = 0x20726F66203ALL;
  v4._object = (void *)0xE600000000000000;
  String.append(_:)(v4);
  v5 = *(_QWORD *)(v0 + *(int *)(v1 + 32));
  swift_retain(v5);
  v6._countAndFlagsBits = sub_100009AC8();
  v7 = v6._object;
  String.append(_:)(v6);
  swift_release(v5);
  swift_bridgeObjectRelease(v7);
  v8._object = (void *)0x80000001000327D0;
  v8._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v8);
  v9 = Date.formatted()();
  v10 = v9._object;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v10);
  return 0xD000000000000013;
}

uint64_t sub_10002626C(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  int *v45;
  void (*v46)(uint64_t, char *, uint64_t);
  char *v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;

  v60 = a2;
  v66 = type metadata accessor for Date(0);
  v64 = *(_QWORD *)(v66 - 8);
  v5 = __chkstk_darwin(v66);
  v65 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v63 = (char *)&v50 - v7;
  v8 = type metadata accessor for GridForecastSnapshot(0);
  v62 = *(_QWORD *)(v8 - 8);
  v9 = __chkstk_darwin(v8);
  v61 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)&v50 - v11;
  v13 = type metadata accessor for GridForecastError(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for Logger(0);
  v58 = *(_QWORD *)(v17 - 8);
  v59 = v17;
  v18 = __chkstk_darwin(v17);
  v20 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.gridForecastWidgets.getter(v18);
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v22 = v21(v16, a3, v13);
  v23 = Logger.logObject.getter(v22);
  v24 = static os_log_type_t.error.getter();
  v57 = v23;
  v56 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc(22, -1);
    v55 = a1;
    v26 = v25;
    v52 = (uint64_t *)swift_slowAlloc(8, -1);
    v53 = swift_slowAlloc(32, -1);
    *(_QWORD *)&v68 = v53;
    *(_DWORD *)v26 = 136315394;
    v54 = a3;
    v67 = sub_10000F4DC(0xD000000000000019, 0x8000000100032550, (uint64_t *)&v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v26 + 4, v26 + 12);
    *(_WORD *)(v26 + 12) = 2112;
    v51 = v26 + 14;
    v27 = sub_10000C440(&qword_10003D2B0, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastError, (uint64_t)&protocol conformance descriptor for GridForecastError);
    v28 = swift_allocError(v13, v27, 0, 0);
    v21(v29, (uint64_t)v16, v13);
    v30 = _swift_stdlib_bridgeErrorToNSError(v28);
    v67 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v51, v26 + 22);
    v31 = v52;
    *v52 = v30;
    a3 = v54;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    v32 = v57;
    _os_log_impl((void *)&_mh_execute_header, v57, (os_log_type_t)v56, "%s: Erroring out widget due to snapshot error: %@", (uint8_t *)v26, 0x16u);
    v33 = sub_100005E18(&qword_10003CF30);
    swift_arrayDestroy(v31, 1, v33);
    swift_slowDealloc(v31, -1, -1);
    v34 = v53;
    swift_arrayDestroy(v53, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    v35 = v26;
    a1 = v55;
    swift_slowDealloc(v35, -1, -1);

  }
  else
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);

  }
  (*(void (**)(char *, uint64_t))(v58 + 8))(v20, v59);
  sub_1000256F8(a3, v60);
  static GridForecastSnapshot.staticSnapshotWithError(_:)(a3);
  v37 = v61;
  v36 = v62;
  v38 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  v38(v61, v12, v8);
  v69 = v8;
  v70 = sub_10000C440(&qword_10003D1A8, (uint64_t (*)(uint64_t))&type metadata accessor for GridForecastSnapshot, (uint64_t)&protocol conformance descriptor for GridForecastSnapshot);
  v39 = sub_10000FDA4(&v68);
  v40 = ((uint64_t (*)(_QWORD *, char *, uint64_t))v38)(v39, v12, v8);
  v41 = v63;
  v42 = static Date.now.getter(v40);
  v43 = v65;
  static Date.now.getter(v42);
  v44 = sub_10000BF68();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 32))(a1, v37, v8);
  v45 = (int *)type metadata accessor for GridForecastEntry(0);
  sub_100027B7C(&v68, a1 + v45[5]);
  v46 = *(void (**)(uint64_t, char *, uint64_t))(v64 + 32);
  v47 = v41;
  v48 = v66;
  v46(a1 + v45[6], v47, v66);
  result = ((uint64_t (*)(uint64_t, char *, uint64_t))v46)(a1 + v45[7], v43, v48);
  *(_QWORD *)(a1 + v45[8]) = v44;
  return result;
}

uint64_t sub_100026718(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *a2;
  v5 = (_QWORD *)swift_task_alloc(dword_10003D2CC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000670C;
  return sub_100021880(a1, v4);
}

uint64_t sub_100026770(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *a2;
  v5 = (_QWORD *)swift_task_alloc(dword_10003D2BC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000670C;
  return sub_100021D4C(a1, v4);
}

uint64_t sub_1000267C8(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  return sub_100027474(a2, a3, a4);
}

uint64_t sub_1000267D8(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  return sub_100027744(a2, a3, a4);
}

uint64_t sub_1000267E8(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v10;

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(*a1, "uniqueIdentifier");
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(a2) = static UUID.== infix(_:_:)(v7, a2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a2 & 1;
}

uint64_t sub_1000268A8@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = a1;
  v2 = sub_100005E18(&qword_10003CF10);
  __chkstk_darwin(v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for EnergyWindows(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100005E18(&qword_10003D138);
  __chkstk_darwin(v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for EnergyWindow(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  GridForecastSnapshot.energyWindows.getter(v14);
  v17 = v1 + *(int *)(type metadata accessor for GridForecastEntry(0) + 24);
  EnergyWindows.cleanEnergyWindowForDate(referenceDate:)(v17);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_10000C404((uint64_t)v11, &qword_10003D138);
LABEL_5:
    v21 = type metadata accessor for TimelineEntryRelevance(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v27, 1, 1, v21);
  }
  v18 = (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))(v16, v11, v12);
  EnergyWindow.endDate.getter(v18);
  v19 = type metadata accessor for Date(0);
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v4, 1, v19) == 1)
  {
    sub_10000C404((uint64_t)v4, &qword_10003CF10);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    goto LABEL_5;
  }
  v23 = Date.timeIntervalSince(_:)(v17);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v19);
  v24 = v27;
  TimelineEntryRelevance.init(score:duration:)(10.0, v23);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  v25 = type metadata accessor for TimelineEntryRelevance(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v24, 0, 1, v25);
}

uint64_t sub_100026B30()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  Swift::String v3;
  void *object;
  Swift::String v5;
  uint64_t v6;
  Swift::String v7;
  void *v8;
  Swift::String v9;
  Swift::String v10;
  void *v11;
  Swift::String v12;
  Swift::String v13;
  void *v14;

  _StringGuts.grow(_:)(91);
  v1._countAndFlagsBits = 0xD000000000000013;
  v1._object = (void *)0x80000001000327B0;
  String.append(_:)(v1);
  v2 = type metadata accessor for GridForecastEntry(0);
  v3 = Date.formatted()();
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  v5._object = (void *)0x80000001000328C0;
  v5._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v5);
  v6 = *(_QWORD *)(v0 + *(int *)(v2 + 32));
  swift_retain(v6);
  v7._countAndFlagsBits = sub_100009AC8();
  v8 = v7._object;
  String.append(_:)(v7);
  swift_release(v6);
  swift_bridgeObjectRelease(v8);
  v9._countAndFlagsBits = 0xD000000000000018;
  v9._object = (void *)0x80000001000328E0;
  String.append(_:)(v9);
  v10._countAndFlagsBits = GridForecastSnapshot.description.getter();
  v11 = v10._object;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v11);
  v12._countAndFlagsBits = 0xD000000000000017;
  v12._object = (void *)0x8000000100032900;
  String.append(_:)(v12);
  v13 = Date.formatted()();
  v14 = v13._object;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v14);
  return 0;
}

uint64_t sub_100026C98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 24);
  v5 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_100026CE0()
{
  return sub_10000C440(qword_10003D278, type metadata accessor for GridForecastEntry, (uint64_t)&unk_100031828);
}

char *sub_100026D10(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100005E18(&qword_10003D2D0);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100027160(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100026E1C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_100026F54(a1, a2, a3, a4, &qword_10003D058, type metadata accessor for ForecastLocationEntity);
}

char *sub_100026E30(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100005E18(&qword_10003D048);
      v11 = (char *)swift_allocObject(v10, 56 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 56);
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[56 * v8 + 32])
          memmove(v13, a4 + 32, 56 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_100027268(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100026F54(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  size_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
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
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
        __break(1u);
        return result;
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
    v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_100005E18(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  v19 = j__malloc_size(v18);
  if (!v15)
    goto LABEL_29;
  if (v19 - v17 == 0x8000000000000000 && v15 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  v21 = a6(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v24 = (unint64_t)v18 + v23;
  if ((a1 & 1) != 0)
  {
    v25 = a4 + v23;
    if ((unint64_t)v18 < a4 || v24 >= v25 + *(_QWORD *)(v22 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v18 + v23, v25, v11, v21);
    }
    else if (v18 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v18 + v23);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10002735C(0, v11, v24, a4, a6);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

uint64_t sub_100027160(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v6 = a4 + 16 * a1 + 32;
    v7 = a3 + 16 * v4;
    if (v6 >= v7 || v6 + 16 * v4 <= a3)
    {
      sub_100005E18(&qword_10003D2D8);
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100027268(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v5 = a4 + 56 * a1 + 32;
  v6 = a3 + 56 * v4;
  if (v5 >= v6 || v5 + 56 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v6;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10002735C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v9 = *(_QWORD *)(a5(0) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = *(_QWORD *)(v9 + 72);
  v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  v13 = v11 * v5;
  v14 = a3 + v13;
  v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v14;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100027474(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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

  v5 = type metadata accessor for GridForecastError(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TimelineReloadPolicy(0);
  v35 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v34 = (uint64_t)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for GridForecastEntry(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Logger(0);
  v32 = *(_QWORD *)(v14 - 8);
  v33 = v14;
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = static Logger.gridForecastWidgets.getter(v15);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v29 = v6;
    v21 = swift_slowAlloc(12, -1);
    v31 = a3;
    v22 = (uint8_t *)v21;
    v23 = swift_slowAlloc(32, -1);
    v30 = v5;
    v24 = v23;
    v37 = v23;
    v28 = v9;
    *(_DWORD *)v22 = 136315138;
    v36 = sub_10000F4DC(0xD00000000000001FLL, 0x80000001000324A0, &v37);
    v9 = v28;
    v6 = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v22 + 4, v22 + 12);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s THIS SHOULD NEVER GET CALLED", v22, 0xCu);
    swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
    v25 = v24;
    v5 = v30;
    swift_slowDealloc(v25, -1, -1);
    swift_slowDealloc(v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v32 + 8))(v17, v33);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for GridForecastError.otherError(_:), v5);
  v26 = v34;
  sub_10002626C((uint64_t)v13, v34, (uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v26, v9);
  a2(v13);
  return sub_100020AFC((uint64_t)v13, type metadata accessor for GridForecastEntry);
}

uint64_t sub_100027744(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *);
  uint64_t v56;
  uint64_t v57;

  v52 = a3;
  v55 = a2;
  v3 = sub_100005E18(&qword_10003D2A0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for GridForecastError(0);
  v47 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TimelineReloadPolicy(0);
  v53 = *(_QWORD *)(v10 - 8);
  v54 = v10;
  v11 = __chkstk_darwin(v10);
  v50 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v51 = (uint64_t)&v40 - v13;
  v48 = type metadata accessor for GridForecastEntry(0);
  v46 = *(_QWORD *)(v48 - 8);
  __chkstk_darwin(v48);
  v49 = (uint64_t)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Logger(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = __chkstk_darwin(v15);
  v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = static Logger.gridForecastWidgets.getter(v17);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    v45 = v4;
    v23 = swift_slowAlloc(12, -1);
    v43 = v7;
    v24 = (uint8_t *)v23;
    v25 = swift_slowAlloc(32, -1);
    v42 = v15;
    v26 = v25;
    v57 = v25;
    v44 = v6;
    v41 = v16;
    *(_DWORD *)v24 = 136315138;
    v56 = sub_10000F4DC(0xD00000000000001FLL, 0x8000000100032480, &v57);
    v6 = v44;
    v4 = v45;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, &v57, v24 + 4, v24 + 12);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s THIS SHOULD NEVER GET CALLED", v24, 0xCu);
    swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    v27 = v24;
    v7 = v43;
    swift_slowDealloc(v27, -1, -1);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v42);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
  }
  v28 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v47 + 104))(v9, enum case for GridForecastError.otherError(_:), v7);
  v29 = v49;
  v30 = v51;
  sub_10002626C(v49, v51, (uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v7);
  v31 = sub_100005E18(&qword_10003D2A8);
  v32 = *(unsigned __int8 *)(v46 + 80);
  v33 = (v32 + 32) & ~v32;
  v34 = swift_allocObject(v31, v33 + *(_QWORD *)(v46 + 72), v32 | 7);
  *(_OWORD *)(v34 + 16) = xmmword_1000310E0;
  sub_100027B38(v29, v34 + v33);
  v36 = v53;
  v35 = v54;
  v37 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v50, v30, v54);
  v38 = sub_10000C440(qword_10003D278, type metadata accessor for GridForecastEntry, (uint64_t)&unk_100031828);
  Timeline.init(entries:policy:)(v34, v37, v48, v38);
  v55(v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v30, v35);
  return sub_100020AFC(v29, type metadata accessor for GridForecastEntry);
}

uint64_t sub_100027B38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for GridForecastEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100027B7C(__int128 *a1, uint64_t a2)
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

uint64_t sub_100027B94(id *a1)
{
  uint64_t v1;

  return sub_1000267E8(a1, *(_QWORD *)(v1 + 16)) & 1;
}

ValueMetadata *type metadata accessor for HistoricalUsageTimelineProvider()
{
  return &type metadata for HistoricalUsageTimelineProvider;
}

uint64_t *sub_100027BC0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for HistoricalUsageSnapshot(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 24);
    v13 = *(uint64_t *)((char *)a2 + v12);
    *(uint64_t *)((char *)a1 + v12) = v13;
  }
  swift_retain(v13);
  return a1;
}

uint64_t sub_100027C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for HistoricalUsageSnapshot(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_release(*(_QWORD *)(a1 + *(int *)(a2 + 24)));
}

uint64_t sub_100027CEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for HistoricalUsageSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(_QWORD *)(a2 + v11);
  *(_QWORD *)(a1 + v11) = v12;
  swift_retain(v12);
  return a1;
}

uint64_t sub_100027D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for HistoricalUsageSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(_QWORD *)(a2 + v11);
  v13 = *(_QWORD *)(a1 + v11);
  *(_QWORD *)(a1 + v11) = v12;
  swift_retain(v12);
  swift_release(v13);
  return a1;
}

uint64_t sub_100027E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for HistoricalUsageSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100027EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = type metadata accessor for HistoricalUsageSnapshot(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(_QWORD *)(a1 + v11);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  swift_release(v12);
  return a1;
}

uint64_t sub_100027F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100027F54);
}

uint64_t sub_100027F54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = type metadata accessor for HistoricalUsageSnapshot(0);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_100027FFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100028008);
}

uint64_t sub_100028008(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = type metadata accessor for HistoricalUsageSnapshot(0);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for HistoricalUsageEntry(uint64_t a1)
{
  uint64_t result;

  result = qword_10003D338;
  if (!qword_10003D338)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for HistoricalUsageEntry);
  return result;
}

uint64_t sub_1000280E8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[3];

  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for HistoricalUsageSnapshot(319);
    if (v4 <= 0x3F)
    {
      v5[1] = *(_QWORD *)(result - 8) + 64;
      v5[2] = (char *)&value witness table for Builtin.NativeObject + 64;
      swift_initStructMetadata(a1, 256, 3, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

_QWORD *sub_100028178(uint64_t a1)
{
  _QWORD *result;
  int v3;
  char v4;
  uint64_t v5;

  result = (_QWORD *)sub_10002D05C(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (_QWORD *)(1 << *(_BYTE *)(a1 + 32)))
    return 0;
  else
    return sub_10002D0E4(&v5, (uint64_t)result, v3, 0, a1);
}

uint64_t sub_100028204@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
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
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v2 = type metadata accessor for Date(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v37 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for HistoricalUsageSnapshot(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v36 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v10 = (char *)&v30 - v9;
  v11 = type metadata accessor for Logger(0);
  v35 = *(_QWORD *)(v11 - 8);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static Logger.historicalUsageWidgets.getter(v12);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v33 = v2;
    v18 = swift_slowAlloc(12, -1);
    v34 = a1;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc(32, -1);
    v31 = v11;
    v21 = v20;
    v39 = v20;
    v32 = v3;
    *(_DWORD *)v19 = 136315138;
    v38 = sub_10000F4DC(0xD000000000000010, 0x8000000100032590, &v39);
    v3 = v32;
    v2 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v19 + 4, v19 + 12);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s Generating placeholder with mock data.", v19, 0xCu);
    swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1, -1);
    v22 = v19;
    a1 = v34;
    swift_slowDealloc(v22, -1, -1);

    v23 = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v14, v31);
  }
  else
  {

    v23 = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v14, v11);
  }
  v24 = static HistoricalUsageSnapshot.dynamicMockNoDataWeekly.getter(v23);
  v25 = v37;
  static Date.now.getter(v24);
  v26 = v36;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v36, v10, v5);
  v27 = sub_10001A060();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v25, v2);
  v28 = type metadata accessor for HistoricalUsageEntry(0);
  result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1 + *(int *)(v28 + 20), v26, v5);
  *(_QWORD *)(a1 + *(int *)(v28 + 24)) = v27;
  return result;
}

uint64_t sub_1000284E0(uint64_t a1, uint64_t a2)
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

  v2[4] = a1;
  v2[5] = a2;
  v3 = type metadata accessor for HistoricalUsageSnapshot(0);
  v2[6] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[7] = v4;
  v2[8] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005E18(&qword_10003CF10);
  v2[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Date(0);
  v2[10] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[11] = v7;
  v2[12] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100005E18(&qword_10003D3E0);
  v2[13] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100005E18(&qword_10003D3E8);
  v2[14] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DateComponents(0);
  v2[15] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v2[16] = v11;
  v2[17] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Calendar.Identifier(0);
  v2[18] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v2[19] = v13;
  v2[20] = swift_task_alloc((*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Calendar(0);
  v2[21] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v2[22] = v15;
  v2[23] = swift_task_alloc((*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Logger(0);
  v2[24] = v16;
  v17 = *(_QWORD *)(v16 - 8);
  v2[25] = v17;
  v2[26] = swift_task_alloc((*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100028674, 0, 0);
}

uint64_t sub_100028674(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
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
  uint64_t v52[2];

  v2 = *(_QWORD *)(v1 + 40);
  static Logger.historicalUsageWidgets.getter(a1);
  v3 = swift_retain_n(v2, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v43 = *(_QWORD *)(v1 + 200);
    v46 = *(_QWORD *)(v1 + 192);
    v49 = *(_QWORD *)(v1 + 208);
    v6 = *(_QWORD *)(v1 + 40);
    v7 = swift_slowAlloc(22, -1);
    v41 = swift_slowAlloc(64, -1);
    v52[0] = v41;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v1 + 16) = sub_10000F4DC(0xD000000000000011, 0x8000000100032570, v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 16, v1 + 24, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2080;
    swift_retain(v6);
    v8 = sub_100018AD4();
    v10 = v9;
    swift_release(v6);
    *(_QWORD *)(v1 + 24) = sub_10000F4DC(v8, v10, v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v10);
    swift_release_n(v6, 2);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s Generating snapshot with mock data & configuration: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v41, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v41, -1, -1);
    swift_slowDealloc(v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v49, v46);
  }
  else
  {
    v12 = *(_QWORD *)(v1 + 200);
    v11 = *(_QWORD *)(v1 + 208);
    v13 = *(_QWORD *)(v1 + 192);
    swift_release_n(*(_QWORD *)(v1 + 40), 2);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  v14 = *(_QWORD *)(v1 + 176);
  v15 = *(_QWORD *)(v1 + 184);
  v17 = *(_QWORD *)(v1 + 160);
  v16 = *(_QWORD *)(v1 + 168);
  v19 = *(_QWORD *)(v1 + 144);
  v18 = *(_QWORD *)(v1 + 152);
  v20 = *(_QWORD *)(v1 + 136);
  v22 = *(_QWORD *)(v1 + 104);
  v21 = *(_QWORD *)(v1 + 112);
  v47 = *(_QWORD *)(v1 + 88);
  v50 = *(_QWORD *)(v1 + 80);
  v44 = *(_QWORD *)(v1 + 72);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v17, enum case for Calendar.Identifier.gregorian(_:), v19);
  Calendar.init(identifier:)(v17);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v21, v15, v16);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(v21, 0, 1, v16);
  v23 = type metadata accessor for TimeZone(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)(v21, v22, 0, 1, 2024, 0, 6, 0, 17, 0, 3, 0, 0, 1, 0, 1, 0, 1, 0,
    1,
    0,
    1,
    0,
    1,
    0,
    1,
    0,
    1,
    0,
    1);
  Calendar.date(from:)(v20);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v44, 1, v50);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v25 = *(_QWORD *)(v1 + 184);
    v36 = *(_QWORD *)(v1 + 176);
    v37 = *(_QWORD *)(v1 + 168);
    v40 = *(_QWORD *)(v1 + 208);
    v42 = *(_QWORD *)(v1 + 160);
    v27 = *(_QWORD *)(v1 + 128);
    v26 = *(_QWORD *)(v1 + 136);
    v35 = *(_QWORD *)(v1 + 120);
    v28 = *(_QWORD *)(v1 + 96);
    v48 = *(_QWORD *)(v1 + 112);
    v51 = *(_QWORD *)(v1 + 104);
    v29 = *(_QWORD *)(v1 + 80);
    v30 = *(_QWORD *)(v1 + 64);
    v45 = *(_QWORD *)(v1 + 72);
    v31 = *(_QWORD *)(v1 + 40);
    v38 = *(_QWORD *)(v1 + 56);
    v39 = *(_QWORD *)(v1 + 48);
    v32 = *(_QWORD *)(v1 + 32);
    v33 = *(void (**)(uint64_t))(*(_QWORD *)(v1 + 88) + 32);
    v33(v28);
    static HistoricalUsageSnapshot.staticWidgetPlaceholderSnapshot(calendar:)(v25);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v35);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v25, v37);
    ((void (*)(uint64_t, uint64_t, uint64_t))v33)(v32, v28, v29);
    v34 = type metadata accessor for HistoricalUsageEntry(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v32 + *(int *)(v34 + 20), v30, v39);
    *(_QWORD *)(v32 + *(int *)(v34 + 24)) = v31;
    swift_retain(v31);
    swift_task_dealloc(v40);
    swift_task_dealloc(v25);
    swift_task_dealloc(v42);
    swift_task_dealloc(v26);
    swift_task_dealloc(v48);
    swift_task_dealloc(v51);
    swift_task_dealloc(v28);
    swift_task_dealloc(v45);
    swift_task_dealloc(v30);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  return result;
}

uint64_t sub_100028B00(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v2[44] = a1;
  v2[45] = a2;
  v3 = type metadata accessor for TimelineReloadPolicy(0);
  v2[46] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[47] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[48] = swift_task_alloc(v5);
  v2[49] = swift_task_alloc(v5);
  v6 = type metadata accessor for HistoricalUsageEntry(0);
  v2[50] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[51] = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[52] = swift_task_alloc(v8);
  v2[53] = swift_task_alloc(v8);
  v2[54] = swift_task_alloc(v8);
  v9 = type metadata accessor for Calendar(0);
  v2[55] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v2[56] = v10;
  v2[57] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Date(0);
  v2[58] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v2[59] = v12;
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[60] = swift_task_alloc(v13);
  v2[61] = swift_task_alloc(v13);
  v2[62] = swift_task_alloc(v13);
  v2[63] = swift_task_alloc(v13);
  v14 = (*(_QWORD *)(*(_QWORD *)(sub_100005E18(&qword_10003D3B8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[64] = swift_task_alloc(v14);
  v2[65] = swift_task_alloc(v14);
  v15 = type metadata accessor for HistoricalUsageError(0);
  v2[66] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v2[67] = v16;
  v17 = (*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[68] = swift_task_alloc(v17);
  v2[69] = swift_task_alloc(v17);
  v2[70] = swift_task_alloc(v17);
  v18 = type metadata accessor for EnergySite.EnergyUsageTimeInterval(0);
  v2[71] = v18;
  v19 = *(_QWORD *)(v18 - 8);
  v2[72] = v19;
  v2[73] = swift_task_alloc((*(_QWORD *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for HistoricalUsageSnapshot(0);
  v2[74] = v20;
  v21 = *(_QWORD *)(v20 - 8);
  v2[75] = v21;
  v22 = (*(_QWORD *)(v21 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[76] = swift_task_alloc(v22);
  v2[77] = swift_task_alloc(v22);
  v23 = type metadata accessor for Logger(0);
  v2[78] = v23;
  v24 = *(_QWORD *)(v23 - 8);
  v2[79] = v24;
  v25 = (*(_QWORD *)(v24 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[80] = swift_task_alloc(v25);
  v2[81] = swift_task_alloc(v25);
  v2[82] = swift_task_alloc(v25);
  v2[83] = swift_task_alloc(v25);
  v2[84] = swift_task_alloc(v25);
  v2[85] = swift_task_alloc(v25);
  v2[86] = swift_task_alloc(v25);
  v2[87] = swift_task_alloc(v25);
  v2[88] = swift_task_alloc(v25);
  return swift_task_switch(sub_100028D90, 0, 0);
}

uint64_t sub_100028D90(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
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
  NSObject *v26;
  os_log_type_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  _BOOL4 v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint8_t *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t (*v64)(void);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  _BOOL4 v75;
  void (*v76)(uint64_t, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  void (*v90)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _BYTE *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
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
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void (*v137)(uint64_t, uint64_t);
  uint64_t v138;
  uint64_t v139;
  void (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t, uint64_t);
  uint64_t (*v142)(void);
  uint64_t v143;
  uint64_t v144;
  uint64_t v145[2];

  v2 = v1[45];
  static Logger.historicalUsageWidgets.getter(a1);
  v3 = swift_retain_n(v2, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v136 = v1[88];
    v130 = v1[79];
    v133 = v1[78];
    v6 = v1[45];
    v7 = swift_slowAlloc(22, -1);
    v8 = swift_slowAlloc(64, -1);
    v145[0] = v8;
    *(_DWORD *)v7 = 136315394;
    v1[42] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v145);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 42, v1 + 43, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2080;
    swift_retain(v6);
    v9 = sub_100018AD4();
    v11 = v10;
    swift_release(v6);
    v1[43] = sub_10000F4DC(v9, v11, v145);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 43, v1 + 44, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v11);
    swift_release_n(v6, 2);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s resolving usageSnapshot type for configuration: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v8, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v130 + 8);
    v13 = v12(v136, v133);
  }
  else
  {
    v14 = v1[88];
    v15 = v1[79];
    v16 = v1[78];
    swift_release_n(v1[45], 2);

    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
    v13 = v12(v14, v16);
  }
  v1[89] = v12;
  v17 = IntentParameter.wrappedValue.getter(v13);
  v18 = v1[3];
  if (v18)
  {
    v140 = (void (*)(uint64_t, uint64_t))v12;
    v19 = v1[2];
    v20 = v1[4];
    v21 = v1[5];
    v22 = v1[6];
    v23 = v1[7];
    swift_bridgeObjectRetain();
    v24 = sub_10000FB1C(v19, v18, v20, v21, v22, v23);
    v1[21] = v19;
    v1[22] = v18;
    v25 = static Logger.historicalUsageWidgets.getter(v24);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.error.getter();
    v28 = os_log_type_enabled(v26, v27);
    v29 = v1[85];
    v30 = v1[78];
    if (v28)
    {
      v128 = v1[85];
      v31 = swift_slowAlloc(22, -1);
      v32 = swift_slowAlloc(64, -1);
      v145[0] = v32;
      *(_DWORD *)v31 = 136315394;
      v1[35] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v145);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 35, v1 + 36, v31 + 4, v31 + 12);
      *(_WORD *)(v31 + 12) = 2080;
      v33 = v1 + 21;
      swift_beginAccess(v1 + 21, v1 + 18, 0, 0);
      v34 = v1[22];
      v1[23] = v1[21];
      v1[24] = v34;
      swift_bridgeObjectRetain();
      v35 = sub_100005E18(&qword_10003CF38);
      v36 = String.init<A>(describing:)(v1 + 23, v35);
      v38 = v37;
      v1[38] = sub_10000F4DC(v36, v37, v145);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 38, v1 + 39, v31 + 14, v31 + 22);
      swift_bridgeObjectRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "%s SiteDetail provided with non-nil siteID: %s", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy(v32, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v32, -1, -1);
      swift_slowDealloc(v31, -1, -1);

      v140(v128, v30);
    }
    else
    {

      v140(v29, v30);
      v33 = v1 + 21;
    }
    v47 = swift_beginAccess(v33, v1 + 12, 0, 0);
    v48 = v1[22];
    if (v48)
    {
      v49 = v1[21];
      v50 = type metadata accessor for HistoricalUsageSnapshotManager(0);
      swift_allocObject(v50, *(unsigned int *)(v50 + 48), *(unsigned __int16 *)(v50 + 52));
      v51 = async function pointer to HistoricalUsageSnapshotManager.init(siteID:)[1];
      swift_bridgeObjectRetain();
      v52 = (_QWORD *)swift_task_alloc(v51);
      v1[92] = v52;
      *v52 = v1;
      v52[1] = sub_10002A438;
      return HistoricalUsageSnapshotManager.init(siteID:)(v49, v48);
    }
    v54 = static Logger.historicalUsageWidgets.getter(v47);
    v55 = Logger.logObject.getter(v54);
    v56 = static os_log_type_t.error.getter();
    v57 = os_log_type_enabled(v55, v56);
    v58 = (void (*)(uint64_t, uint64_t))v1[89];
    v59 = v1[81];
    v60 = v1[78];
    if (v57)
    {
      v61 = (uint8_t *)swift_slowAlloc(12, -1);
      v62 = swift_slowAlloc(32, -1);
      v145[0] = v62;
      *(_DWORD *)v61 = 136315138;
      v1[25] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v145);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 25, v1 + 26, v61 + 4, v61 + 12);
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s: Widget configuration has no entity (no home)", v61, 0xCu);
      swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v62, -1, -1);
      swift_slowDealloc(v61, -1, -1);
    }

    v58(v59, v60);
    v65 = v1[67];
    v66 = v1[66];
    v67 = sub_10000C440(&qword_10003D3C0, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageError, (uint64_t)&protocol conformance descriptor for HistoricalUsageError);
    v68 = swift_allocError(v66, v67, 0, 0);
    v70 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v65 + 104))(v69, enum case for HistoricalUsageError.invalidEnergySite(_:), v66);
    swift_willThrow(v70);
    v71 = swift_bridgeObjectRelease(v1[22]);
    static Logger.historicalUsageWidgets.getter(v71);
    swift_errorRetain(v68);
    v72 = swift_errorRetain(v68);
    v73 = Logger.logObject.getter(v72);
    v74 = static os_log_type_t.error.getter();
    v75 = os_log_type_enabled(v73, v74);
    v76 = (void (*)(uint64_t, uint64_t))v1[89];
    v77 = v1[80];
    v78 = v1[78];
    if (v75)
    {
      v79 = swift_slowAlloc(22, -1);
      v137 = v76;
      v80 = (uint64_t *)swift_slowAlloc(8, -1);
      v81 = swift_slowAlloc(32, -1);
      v145[0] = v81;
      *(_DWORD *)v79 = 136315394;
      v1[36] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v145);
      v131 = v78;
      v82 = v1 + 37;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 36, v1 + 37, v79 + 4, v79 + 12);
      *(_WORD *)(v79 + 12) = 2112;
      swift_errorRetain(v68);
      v83 = _swift_stdlib_bridgeErrorToNSError(v68);
      v1[33] = v83;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 33, v1 + 34, v79 + 14, v79 + 22);
      *v80 = v83;
      swift_errorRelease(v68);
      swift_errorRelease(v68);
      _os_log_impl((void *)&_mh_execute_header, v73, v74, "%s:ERROR: %@", (uint8_t *)v79, 0x16u);
      v84 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v80, 1, v84);
      swift_slowDealloc(v80, -1, -1);
      swift_arrayDestroy(v81, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v81, -1, -1);
      swift_slowDealloc(v79, -1, -1);

      v137(v77, v131);
    }
    else
    {
      swift_errorRelease(v68);
      swift_errorRelease(v68);

      v76(v77, v78);
      v82 = v1 + 37;
    }
    v85 = v1[67];
    v86 = v1[66];
    v87 = v1[64];
    v1[37] = v68;
    swift_errorRetain(v68);
    v88 = sub_100005E18(&qword_10003CF28);
    v89 = swift_dynamicCast(v87, v82, v88, v86, 6);
    v90 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v85 + 56);
    v91 = v1[68];
    v92 = v1[67];
    v93 = v1[66];
    v94 = v1[64];
    if (v89)
    {
      v90(v1[64], 0, 1, v1[66]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 32))(v91, v94, v93);
    }
    else
    {
      v90(v1[64], 1, 1, v1[66]);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v92 + 104))(v91, enum case for HistoricalUsageError.otherError(_:), v93);
      sub_10002EC28(v94);
    }
    v95 = v1[68];
    v138 = v1[67];
    v143 = v1[66];
    v96 = v1[51];
    v97 = v1[52];
    v98 = (_BYTE *)v1[49];
    v99 = v1[47];
    v100 = v1[48];
    v101 = v1[46];
    v134 = v1[50];
    sub_10002B474(v97, v98, v95);
    v102 = sub_100005E18(&qword_10003D3A8);
    v103 = *(unsigned __int8 *)(v96 + 80);
    v104 = (v103 + 32) & ~v103;
    v105 = swift_allocObject(v102, v104 + *(_QWORD *)(v96 + 72), v103 | 7);
    *(_OWORD *)(v105 + 16) = xmmword_1000310E0;
    sub_10002EBA8(v97, v105 + v104);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v99 + 16))(v100, v98, v101);
    v106 = sub_10000C440(qword_10003D378, type metadata accessor for HistoricalUsageEntry, (uint64_t)&unk_100031940);
    Timeline.init(entries:policy:)(v105, v100, v134, v106);
    swift_errorRelease(v68);
    (*(void (**)(_BYTE *, uint64_t))(v99 + 8))(v98, v101);
    sub_10002EBEC(v97);
    (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v95, v143);
    v107 = v1[87];
    v108 = v1[86];
    v109 = v1[85];
    v110 = v1[84];
    v111 = v1[83];
    v112 = v1[82];
    v113 = v1[81];
    v114 = v1[80];
    v115 = v1[77];
    v116 = v1[76];
    v117 = v1[73];
    v118 = v1[70];
    v119 = v1[69];
    v120 = v1[68];
    v121 = v1[65];
    v122 = v1[64];
    v123 = v1[63];
    v124 = v1[62];
    v125 = v1[61];
    v126 = v1[60];
    v127 = v1[57];
    v129 = v1[54];
    v132 = v1[53];
    v135 = v1[52];
    v139 = v1[49];
    v144 = v1[48];
    swift_task_dealloc(v1[88]);
    swift_task_dealloc(v107);
    swift_task_dealloc(v108);
    swift_task_dealloc(v109);
    swift_task_dealloc(v110);
    swift_task_dealloc(v111);
    swift_task_dealloc(v112);
    swift_task_dealloc(v113);
    swift_task_dealloc(v114);
    swift_task_dealloc(v115);
    swift_task_dealloc(v116);
    swift_task_dealloc(v117);
    swift_task_dealloc(v118);
    swift_task_dealloc(v119);
    swift_task_dealloc(v120);
    swift_task_dealloc(v121);
    swift_task_dealloc(v122);
    swift_task_dealloc(v123);
    swift_task_dealloc(v124);
    swift_task_dealloc(v125);
    swift_task_dealloc(v126);
    swift_task_dealloc(v127);
    swift_task_dealloc(v129);
    swift_task_dealloc(v132);
    swift_task_dealloc(v135);
    swift_task_dealloc(v139);
    swift_task_dealloc(v144);
    v64 = (uint64_t (*)(void))v1[1];
  }
  else
  {
    v1[21] = 0;
    v1[22] = 0;
    v39 = static Logger.historicalUsageWidgets.getter(v17);
    v40 = Logger.logObject.getter(v39);
    v41 = static os_log_type_t.error.getter();
    v42 = os_log_type_enabled(v40, v41);
    v43 = v1[87];
    v44 = v1[78];
    if (v42)
    {
      v141 = (void (*)(uint64_t, uint64_t))v12;
      v45 = (uint8_t *)swift_slowAlloc(12, -1);
      v46 = swift_slowAlloc(32, -1);
      v145[0] = v46;
      *(_DWORD *)v45 = 136315138;
      v1[41] = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v145);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 41, v1 + 42, v45 + 4, v45 + 12);
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "%s No SiteDetail provided. ***Attempting Fallback to first onboarded home***", v45, 0xCu);
      swift_arrayDestroy(v46, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v46, -1, -1);
      swift_slowDealloc(v45, -1, -1);

      v141(v43, v44);
    }
    else
    {

      v12(v43, v44);
    }
    v142 = (uint64_t (*)(void))((char *)&dword_10003D3C8 + dword_10003D3C8);
    v63 = (_QWORD *)swift_task_alloc(unk_10003D3CC);
    v1[90] = v63;
    *v63 = v1;
    v63[1] = sub_100029A7C;
    v64 = v142;
  }
  return v64();
}

uint64_t sub_100029A7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 720);
  *(_QWORD *)(*(_QWORD *)v1 + 728) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100029AD8, 0, 0);
}

uint64_t sub_100029AD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
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
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  void (*v60)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
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
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(uint64_t, uint64_t);
  uint64_t v104;
  uint64_t v105;
  void (*v106)(uint64_t, uint64_t);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111[2];

  v2 = v1 + 96;
  static Logger.historicalUsageWidgets.getter(a1);
  v3 = swift_bridgeObjectRetain();
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v1 + 728);
    v106 = *(void (**)(uint64_t, uint64_t))(v1 + 712);
    v99 = *(_QWORD *)(v1 + 624);
    v102 = *(_QWORD *)(v1 + 688);
    v7 = swift_slowAlloc(22, -1);
    v8 = swift_slowAlloc(32, -1);
    v111[0] = v8;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v1 + 312) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v111);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 312, v1 + 320, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2048;
    *(_QWORD *)(v1 + 320) = *(_QWORD *)(v6 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 320, v1 + 328, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v6);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s (%ld homes available.", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    v9 = v7;
    v2 = v1 + 96;
    swift_slowDealloc(v9, -1, -1);

    v106(v102, v99);
  }
  else
  {
    v10 = *(void (**)(uint64_t, uint64_t))(v1 + 712);
    v11 = *(_QWORD *)(v1 + 688);
    v12 = *(_QWORD *)(v1 + 624);
    swift_bridgeObjectRelease(*(_QWORD *)(v1 + 728));

    v10(v11, v12);
  }
  v13 = *(_QWORD *)(v1 + 728);
  v14 = sub_100028178(v13);
  v16 = v15;
  v18 = v17;
  swift_bridgeObjectRelease(v13);
  if (v16)
    swift_bridgeObjectRelease(v18);
  else
    v14 = 0;
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 176));
  *(_QWORD *)(v1 + 168) = v14;
  *(_QWORD *)(v1 + 176) = v16;
  v19 = swift_beginAccess(v1 + 168, v2, 0, 0);
  v20 = *(_QWORD *)(v1 + 176);
  if (v20)
  {
    v21 = *(_QWORD *)(v1 + 168);
    v22 = type metadata accessor for HistoricalUsageSnapshotManager(0);
    swift_allocObject(v22, *(unsigned int *)(v22 + 48), *(unsigned __int16 *)(v22 + 52));
    v23 = async function pointer to HistoricalUsageSnapshotManager.init(siteID:)[1];
    swift_bridgeObjectRetain();
    v24 = (_QWORD *)swift_task_alloc(v23);
    *(_QWORD *)(v1 + 736) = v24;
    *v24 = v1;
    v24[1] = sub_10002A438;
    return HistoricalUsageSnapshotManager.init(siteID:)(v21, v20);
  }
  else
  {
    v26 = static Logger.historicalUsageWidgets.getter(v19);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.error.getter();
    v29 = os_log_type_enabled(v27, v28);
    v30 = *(void (**)(uint64_t, uint64_t))(v1 + 712);
    v31 = *(_QWORD *)(v1 + 648);
    v32 = *(_QWORD *)(v1 + 624);
    if (v29)
    {
      v33 = (uint8_t *)swift_slowAlloc(12, -1);
      v34 = swift_slowAlloc(32, -1);
      v111[0] = v34;
      *(_DWORD *)v33 = 136315138;
      *(_QWORD *)(v1 + 200) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v111);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 200, v1 + 208, v33 + 4, v33 + 12);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "%s: Widget configuration has no entity (no home)", v33, 0xCu);
      swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1, -1);
      swift_slowDealloc(v33, -1, -1);
    }

    v30(v31, v32);
    v35 = *(_QWORD *)(v1 + 536);
    v36 = *(_QWORD *)(v1 + 528);
    v37 = sub_10000C440(&qword_10003D3C0, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageError, (uint64_t)&protocol conformance descriptor for HistoricalUsageError);
    v38 = swift_allocError(v36, v37, 0, 0);
    v40 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v35 + 104))(v39, enum case for HistoricalUsageError.invalidEnergySite(_:), v36);
    swift_willThrow(v40);
    v41 = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 176));
    static Logger.historicalUsageWidgets.getter(v41);
    swift_errorRetain(v38);
    v42 = swift_errorRetain(v38);
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.error.getter();
    v45 = os_log_type_enabled(v43, v44);
    v46 = *(void (**)(uint64_t, uint64_t))(v1 + 712);
    v47 = *(_QWORD *)(v1 + 640);
    v48 = *(_QWORD *)(v1 + 624);
    if (v45)
    {
      v49 = swift_slowAlloc(22, -1);
      v50 = (uint64_t *)swift_slowAlloc(8, -1);
      v103 = v46;
      v51 = swift_slowAlloc(32, -1);
      v111[0] = v51;
      *(_DWORD *)v49 = 136315394;
      v100 = v48;
      *(_QWORD *)(v1 + 288) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v111);
      v52 = v1 + 296;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 288, v1 + 296, v49 + 4, v49 + 12);
      *(_WORD *)(v49 + 12) = 2112;
      swift_errorRetain(v38);
      v53 = _swift_stdlib_bridgeErrorToNSError(v38);
      *(_QWORD *)(v1 + 264) = v53;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 264, v1 + 272, v49 + 14, v49 + 22);
      *v50 = v53;
      swift_errorRelease(v38);
      swift_errorRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "%s:ERROR: %@", (uint8_t *)v49, 0x16u);
      v54 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v50, 1, v54);
      swift_slowDealloc(v50, -1, -1);
      swift_arrayDestroy(v51, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1, -1);
      swift_slowDealloc(v49, -1, -1);

      v103(v47, v100);
    }
    else
    {
      swift_errorRelease(v38);
      swift_errorRelease(v38);

      v46(v47, v48);
      v52 = v1 + 296;
    }
    v55 = *(_QWORD *)(v1 + 536);
    v56 = *(_QWORD *)(v1 + 528);
    v57 = *(_QWORD *)(v1 + 512);
    *(_QWORD *)(v1 + 296) = v38;
    swift_errorRetain(v38);
    v58 = sub_100005E18(&qword_10003CF28);
    v59 = swift_dynamicCast(v57, v52, v58, v56, 6);
    v60 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v55 + 56);
    v61 = *(_QWORD *)(v1 + 544);
    v62 = *(_QWORD *)(v1 + 536);
    v63 = *(_QWORD *)(v1 + 528);
    v64 = *(_QWORD *)(v1 + 512);
    if (v59)
    {
      v60(*(_QWORD *)(v1 + 512), 0, 1, *(_QWORD *)(v1 + 528));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 32))(v61, v64, v63);
    }
    else
    {
      v60(*(_QWORD *)(v1 + 512), 1, 1, *(_QWORD *)(v1 + 528));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v62 + 104))(v61, enum case for HistoricalUsageError.otherError(_:), v63);
      sub_10002EC28(v64);
    }
    v65 = *(_QWORD *)(v1 + 544);
    v107 = *(_QWORD *)(v1 + 536);
    v109 = *(_QWORD *)(v1 + 528);
    v66 = *(_QWORD *)(v1 + 408);
    v67 = *(_QWORD *)(v1 + 416);
    v68 = *(_BYTE **)(v1 + 392);
    v69 = *(_QWORD *)(v1 + 376);
    v70 = *(_QWORD *)(v1 + 384);
    v71 = *(_QWORD *)(v1 + 368);
    v104 = *(_QWORD *)(v1 + 400);
    sub_10002B474(v67, v68, v65);
    v72 = sub_100005E18(&qword_10003D3A8);
    v73 = *(unsigned __int8 *)(v66 + 80);
    v74 = (v73 + 32) & ~v73;
    v75 = swift_allocObject(v72, v74 + *(_QWORD *)(v66 + 72), v73 | 7);
    *(_OWORD *)(v75 + 16) = xmmword_1000310E0;
    sub_10002EBA8(v67, v75 + v74);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v69 + 16))(v70, v68, v71);
    v76 = sub_10000C440(qword_10003D378, type metadata accessor for HistoricalUsageEntry, (uint64_t)&unk_100031940);
    Timeline.init(entries:policy:)(v75, v70, v104, v76);
    swift_errorRelease(v38);
    (*(void (**)(_BYTE *, uint64_t))(v69 + 8))(v68, v71);
    sub_10002EBEC(v67);
    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v65, v109);
    v77 = *(_QWORD *)(v1 + 696);
    v78 = *(_QWORD *)(v1 + 688);
    v79 = *(_QWORD *)(v1 + 680);
    v80 = *(_QWORD *)(v1 + 672);
    v81 = *(_QWORD *)(v1 + 664);
    v82 = *(_QWORD *)(v1 + 656);
    v83 = *(_QWORD *)(v1 + 648);
    v84 = *(_QWORD *)(v1 + 640);
    v85 = *(_QWORD *)(v1 + 616);
    v86 = *(_QWORD *)(v1 + 608);
    v87 = *(_QWORD *)(v1 + 584);
    v88 = *(_QWORD *)(v1 + 560);
    v89 = *(_QWORD *)(v1 + 552);
    v90 = *(_QWORD *)(v1 + 544);
    v91 = *(_QWORD *)(v1 + 520);
    v92 = *(_QWORD *)(v1 + 512);
    v93 = *(_QWORD *)(v1 + 504);
    v94 = *(_QWORD *)(v1 + 496);
    v95 = *(_QWORD *)(v1 + 488);
    v96 = *(_QWORD *)(v1 + 480);
    v97 = *(_QWORD *)(v1 + 456);
    v98 = *(_QWORD *)(v1 + 432);
    v101 = *(_QWORD *)(v1 + 424);
    v105 = *(_QWORD *)(v1 + 416);
    v108 = *(_QWORD *)(v1 + 392);
    v110 = *(_QWORD *)(v1 + 384);
    swift_task_dealloc(*(_QWORD *)(v1 + 704));
    swift_task_dealloc(v77);
    swift_task_dealloc(v78);
    swift_task_dealloc(v79);
    swift_task_dealloc(v80);
    swift_task_dealloc(v81);
    swift_task_dealloc(v82);
    swift_task_dealloc(v83);
    swift_task_dealloc(v84);
    swift_task_dealloc(v85);
    swift_task_dealloc(v86);
    swift_task_dealloc(v87);
    swift_task_dealloc(v88);
    swift_task_dealloc(v89);
    swift_task_dealloc(v90);
    swift_task_dealloc(v91);
    swift_task_dealloc(v92);
    swift_task_dealloc(v93);
    swift_task_dealloc(v94);
    swift_task_dealloc(v95);
    swift_task_dealloc(v96);
    swift_task_dealloc(v97);
    swift_task_dealloc(v98);
    swift_task_dealloc(v101);
    swift_task_dealloc(v105);
    swift_task_dealloc(v108);
    swift_task_dealloc(v110);
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10002A438(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 736);
  *(_QWORD *)(*(_QWORD *)v1 + 744) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10002A494, 0, 0);
}

uint64_t sub_10002A494()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[72] + 104))(v0[73], enum case for EnergySite.EnergyUsageTimeInterval.week(_:), v0[71]);
  v1 = type metadata accessor for MainActor(0);
  v0[94] = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_10002A51C, v2, v3);
}

uint64_t sub_10002A51C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[93];
  v2 = v0[73];
  v3 = v0[72];
  v4 = v0[71];
  swift_release(v0[94]);
  dispatch thunk of HistoricalUsageSnapshotManager.snapshotForInterval(_:summary:)(v2, 1);
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch(sub_10002A5A4, 0, 0);
}

uint64_t sub_10002A5A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
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
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  void (*v37)(uint64_t, uint64_t);
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
  Swift::String v48;
  void (*v49)(uint64_t, uint64_t);
  Swift::String v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  _BOOL4 v61;
  void (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t);
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
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  os_log_type_t v98;
  BOOL v99;
  void (*v100)(uint64_t, uint64_t);
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  void (*v114)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  os_log_type_t type[8];
  os_log_type_t typea;
  uint64_t typeb;
  os_log_type_t typec[8];
  os_log_t log;
  os_log_t loga;
  os_log_t logb;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void (*v166)(uint64_t, uint64_t, uint64_t);
  uint64_t v167;
  void (*v168)(uint64_t, os_log_t);
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
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
  uint64_t v188[2];

  v1 = v0 + 72;
  v183 = v0 + 240;
  v2 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 600) + 32))(*(_QWORD *)(v0 + 616), *(_QWORD *)(v0 + 608), *(_QWORD *)(v0 + 592));
  v3 = static Logger.historicalUsageWidgets.getter(v2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v163 = *(_QWORD *)(v0 + 672);
    v168 = *(void (**)(uint64_t, os_log_t))(v0 + 712);
    log = *(os_log_t *)(v0 + 624);
    v6 = *(_QWORD *)(v0 + 616);
    v151 = *(_QWORD *)(v0 + 592);
    v7 = swift_slowAlloc(22, -1);
    v8 = swift_slowAlloc(64, -1);
    v188[0] = v8;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v0 + 256) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v188);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 256, v0 + 264, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2080;
    swift_beginAccess(v6, v0 + 120, 0, 0);
    v9 = sub_10000C440(&qword_10003CC90, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageSnapshot, (uint64_t)&protocol conformance descriptor for HistoricalUsageSnapshot);
    v10 = dispatch thunk of CustomStringConvertible.description.getter(v151, v9);
    v12 = v11;
    *(_QWORD *)(v0 + 272) = sub_10000F4DC(v10, v11, v188);
    v1 = v0 + 72;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 272, v0 + 280, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s: Retrieved week snapshot for widget %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v8, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

    v168(v163, log);
  }
  else
  {
    v13 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    v14 = *(_QWORD *)(v0 + 672);
    v15 = *(_QWORD *)(v0 + 624);

    v13(v14, v15);
  }
  v16 = *(_QWORD *)(v0 + 536);
  v17 = *(_QWORD *)(v0 + 528);
  v18 = *(_QWORD *)(v0 + 520);
  v19 = swift_beginAccess(*(_QWORD *)(v0 + 616), v1, 0, 0);
  HistoricalUsageSnapshot.error.getter(v19);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v18, 1, v17) == 1)
  {
    v152 = *(_QWORD *)(v0 + 600);
    *(_QWORD *)type = *(_QWORD *)(v0 + 592);
    loga = *(os_log_t *)(v0 + 616);
    v21 = *(_QWORD *)(v0 + 496);
    v20 = *(_QWORD *)(v0 + 504);
    v174 = *(_QWORD *)(v0 + 488);
    v178 = *(_QWORD *)(v0 + 480);
    v22 = *(_QWORD *)(v0 + 464);
    v149 = *(_QWORD *)(v0 + 472);
    v23 = *(_QWORD *)(v0 + 448);
    v24 = *(_QWORD *)(v0 + 456);
    v26 = *(_QWORD *)(v0 + 432);
    v25 = *(_QWORD *)(v0 + 440);
    v164 = *(_QWORD *)(v0 + 424);
    v27 = *(_QWORD *)(v0 + 400);
    v28 = *(_QWORD *)(v0 + 360);
    v29 = sub_10002EC28(*(_QWORD *)(v0 + 520));
    v30 = static Date.now.getter(v29);
    static Calendar.current.getter(v30);
    static EKDateUtilities.endOfDay(for:with:)(v20, v24);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v25);
    v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v149 + 16);
    v31(v26, v20, v22);
    (*(void (**)(uint64_t, os_log_t, os_log_type_t *))(v152 + 16))(v26 + *(int *)(v27 + 20), loga, *(os_log_type_t **)type);
    *(_QWORD *)(v26 + *(int *)(v27 + 24)) = v28;
    v32 = swift_retain(v28);
    static Logger.historicalUsageWidgets.getter(v32);
    sub_10002EBA8(v26, v164);
    v31(v174, v20, v22);
    v33 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v31)(v178, v21, v22);
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.default.getter();
    v36 = os_log_type_enabled(v34, v35);
    v37 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    v38 = *(_QWORD *)(v0 + 656);
    v39 = *(_QWORD *)(v0 + 624);
    v40 = *(_QWORD *)(v0 + 488);
    v179 = *(_QWORD *)(v0 + 480);
    v42 = *(_QWORD *)(v0 + 464);
    v41 = *(_QWORD *)(v0 + 472);
    v43 = *(_QWORD *)(v0 + 424);
    if (v36)
    {
      typea = v35;
      v44 = swift_slowAlloc(42, -1);
      v153 = swift_slowAlloc(128, -1);
      v188[0] = v153;
      *(_DWORD *)v44 = 136315906;
      v165 = v39;
      *(_QWORD *)(v0 + 208) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v188);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v44 + 4, v44 + 12);
      *(_WORD *)(v44 + 12) = 2080;
      v45 = sub_10002C750();
      v47 = v46;
      *(_QWORD *)(v0 + 216) = sub_10000F4DC(v45, v46, v188);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v44 + 14, v44 + 22);
      swift_bridgeObjectRelease(v47);
      sub_10002EBEC(v43);
      *(_WORD *)(v44 + 22) = 2080;
      v48 = Date.formatted()();
      *(_QWORD *)(v0 + 224) = sub_10000F4DC(v48._countAndFlagsBits, (unint64_t)v48._object, v188);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 224, v0 + 232, v44 + 24, v44 + 32);
      swift_bridgeObjectRelease(v48._object);
      v49 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
      v49(v40, v42);
      *(_WORD *)(v44 + 32) = 2080;
      v50 = Date.formatted()();
      *(_QWORD *)(v0 + 232) = sub_10000F4DC(v50._countAndFlagsBits, (unint64_t)v50._object, v188);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 232, v183, v44 + 34, v44 + 42);
      swift_bridgeObjectRelease(v50._object);
      v49(v179, v42);
      _os_log_impl((void *)&_mh_execute_header, v34, typea, "%s Entry:%s created for %s, until %s", (uint8_t *)v44, 0x2Au);
      swift_arrayDestroy(v153, 4, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v153, -1, -1);
      swift_slowDealloc(v44, -1, -1);

      v37(v38, v165);
    }
    else
    {
      sub_10002EBEC(*(_QWORD *)(v0 + 424));
      v49 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
      v49(v40, v42);
      v49(v179, v42);

      v37(v38, v39);
    }
    v185 = *(_QWORD *)(v0 + 616);
    v175 = *(_QWORD *)(v0 + 600);
    v180 = *(_QWORD *)(v0 + 592);
    v75 = *(_QWORD *)(v0 + 496);
    v170 = *(_QWORD *)(v0 + 504);
    v76 = *(_QWORD *)(v0 + 464);
    v77 = *(_QWORD *)(v0 + 432);
    v79 = *(_QWORD *)(v0 + 400);
    v78 = *(_QWORD *)(v0 + 408);
    v80 = *(_QWORD *)(v0 + 392);
    v81 = sub_100005E18(&qword_10003D3A8);
    v82 = *(unsigned __int8 *)(v78 + 80);
    v83 = (v82 + 32) & ~v82;
    v84 = swift_allocObject(v81, v83 + *(_QWORD *)(v78 + 72), v82 | 7);
    *(_OWORD *)(v84 + 16) = xmmword_1000310E0;
    sub_10002EBA8(v77, v84 + v83);
    static TimelineReloadPolicy.after(_:)(v75);
    v85 = sub_10000C440(qword_10003D378, type metadata accessor for HistoricalUsageEntry, (uint64_t)&unk_100031940);
    Timeline.init(entries:policy:)(v84, v80, v79, v85);
    sub_10002EBEC(v77);
    v49(v75, v76);
    v49(v170, v76);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 176));
    (*(void (**)(uint64_t, uint64_t))(v175 + 8))(v185, v180);
  }
  else
  {
    v51 = *(_QWORD *)(v0 + 560);
    v52 = *(_QWORD *)(v0 + 552);
    v53 = *(_QWORD *)(v0 + 536);
    v54 = *(_QWORD *)(v0 + 528);
    v55 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v53 + 32))(v51, *(_QWORD *)(v0 + 520), v54);
    static Logger.historicalUsageWidgets.getter(v55);
    v56 = v52;
    v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v53 + 16);
    v58 = v57(v56, v51, v54);
    v59 = Logger.logObject.getter(v58);
    v60 = static os_log_type_t.default.getter();
    v61 = os_log_type_enabled(v59, v60);
    v62 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    v63 = *(_QWORD *)(v0 + 664);
    v169 = *(_QWORD *)(v0 + 624);
    v64 = *(_QWORD *)(v0 + 552);
    v65 = *(_QWORD *)(v0 + 536);
    v66 = *(_QWORD *)(v0 + 528);
    if (v61)
    {
      v166 = (void (*)(uint64_t, uint64_t, uint64_t))v57;
      v67 = swift_slowAlloc(22, -1);
      v154 = (uint64_t *)swift_slowAlloc(8, -1);
      typeb = swift_slowAlloc(32, -1);
      v188[0] = typeb;
      *(_DWORD *)v67 = 136315394;
      *(_QWORD *)(v0 + 240) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v188);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v183, v0 + 248, v67 + 4, v67 + 12);
      *(_WORD *)(v67 + 12) = 2112;
      v68 = sub_10000C440(&qword_10003D3C0, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageError, (uint64_t)&protocol conformance descriptor for HistoricalUsageError);
      v184 = v63;
      v69 = swift_allocError(v66, v68, 0, 0);
      v166(v70, v64, v66);
      v71 = _swift_stdlib_bridgeErrorToNSError(v69);
      *(_QWORD *)(v0 + 248) = v71;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 248, v0 + 256, v67 + 14, v67 + 22);
      *v154 = v71;
      v72 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
      v72(v64, v66);
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "%s retrieved snapshot with error: %@, giving up.", (uint8_t *)v67, 0x16u);
      v73 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v154, 1, v73);
      swift_slowDealloc(v154, -1, -1);
      swift_arrayDestroy(typeb, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(typeb, -1, -1);
      v74 = v67;
      v57 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v166;
      swift_slowDealloc(v74, -1, -1);

      v62(v184, v169);
    }
    else
    {
      v72 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
      v72(*(_QWORD *)(v0 + 552), *(_QWORD *)(v0 + 528));

      v62(v63, v169);
    }
    v86 = *(_QWORD *)(v0 + 616);
    v87 = *(_QWORD *)(v0 + 600);
    v88 = *(_QWORD *)(v0 + 592);
    v89 = *(_QWORD *)(v0 + 560);
    v90 = *(_QWORD *)(v0 + 528);
    v91 = sub_10000C440(&qword_10003D3C0, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageError, (uint64_t)&protocol conformance descriptor for HistoricalUsageError);
    v92 = swift_allocError(v90, v91, 0, 0);
    v94 = v57(v93, v89, v90);
    swift_willThrow(v94);
    v72(v89, v90);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 176));
    v95 = (*(uint64_t (**)(uint64_t, uint64_t))(v87 + 8))(v86, v88);
    static Logger.historicalUsageWidgets.getter(v95);
    swift_errorRetain(v92);
    v96 = swift_errorRetain(v92);
    v97 = Logger.logObject.getter(v96);
    v98 = static os_log_type_t.error.getter();
    v99 = os_log_type_enabled(v97, v98);
    v100 = *(void (**)(uint64_t, uint64_t))(v0 + 712);
    v101 = *(_QWORD *)(v0 + 640);
    v102 = *(_QWORD *)(v0 + 624);
    v186 = v92;
    if (v99)
    {
      v103 = swift_slowAlloc(22, -1);
      v104 = (uint64_t *)swift_slowAlloc(8, -1);
      v171 = v101;
      v105 = swift_slowAlloc(32, -1);
      v188[0] = v105;
      *(_DWORD *)v103 = 136315394;
      *(_QWORD *)(v0 + 288) = sub_10000F4DC(0xD000000000000011, 0x80000001000324C0, v188);
      v106 = v0 + 296;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296, v103 + 4, v103 + 12);
      *(_WORD *)(v103 + 12) = 2112;
      swift_errorRetain(v92);
      v107 = _swift_stdlib_bridgeErrorToNSError(v92);
      *(_QWORD *)(v0 + 264) = v107;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 264, v0 + 272, v103 + 14, v103 + 22);
      *v104 = v107;
      v92 = v186;
      swift_errorRelease(v186);
      swift_errorRelease(v186);
      _os_log_impl((void *)&_mh_execute_header, v97, v98, "%s:ERROR: %@", (uint8_t *)v103, 0x16u);
      v108 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v104, 1, v108);
      swift_slowDealloc(v104, -1, -1);
      swift_arrayDestroy(v105, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v105, -1, -1);
      swift_slowDealloc(v103, -1, -1);

      v100(v171, v102);
    }
    else
    {
      swift_errorRelease(v92);
      swift_errorRelease(v92);

      v100(v101, v102);
      v106 = v0 + 296;
    }
    v109 = *(_QWORD *)(v0 + 536);
    v110 = *(_QWORD *)(v0 + 528);
    v111 = *(_QWORD *)(v0 + 512);
    *(_QWORD *)(v0 + 296) = v92;
    swift_errorRetain(v92);
    v112 = sub_100005E18(&qword_10003CF28);
    v113 = swift_dynamicCast(v111, v106, v112, v110, 6);
    v114 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v109 + 56);
    v115 = *(_QWORD *)(v0 + 544);
    v116 = *(_QWORD *)(v0 + 536);
    v117 = *(_QWORD *)(v0 + 528);
    v118 = *(_QWORD *)(v0 + 512);
    if (v113)
    {
      v114(*(_QWORD *)(v0 + 512), 0, 1, *(_QWORD *)(v0 + 528));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v116 + 32))(v115, v118, v117);
    }
    else
    {
      v114(*(_QWORD *)(v0 + 512), 1, 1, *(_QWORD *)(v0 + 528));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v116 + 104))(v115, enum case for HistoricalUsageError.otherError(_:), v117);
      sub_10002EC28(v118);
    }
    v119 = *(_QWORD *)(v0 + 544);
    v176 = *(_QWORD *)(v0 + 536);
    v181 = *(_QWORD *)(v0 + 528);
    v120 = *(_QWORD *)(v0 + 408);
    v121 = *(_QWORD *)(v0 + 416);
    v122 = *(_BYTE **)(v0 + 392);
    v172 = *(_QWORD *)(v0 + 400);
    v123 = *(_QWORD *)(v0 + 376);
    v124 = *(_QWORD *)(v0 + 384);
    v125 = *(_QWORD *)(v0 + 368);
    sub_10002B474(v121, v122, v119);
    v126 = sub_100005E18(&qword_10003D3A8);
    v127 = *(unsigned __int8 *)(v120 + 80);
    v128 = (v127 + 32) & ~v127;
    v129 = swift_allocObject(v126, v128 + *(_QWORD *)(v120 + 72), v127 | 7);
    *(_OWORD *)(v129 + 16) = xmmword_1000310E0;
    sub_10002EBA8(v121, v129 + v128);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v123 + 16))(v124, v122, v125);
    v130 = sub_10000C440(qword_10003D378, type metadata accessor for HistoricalUsageEntry, (uint64_t)&unk_100031940);
    Timeline.init(entries:policy:)(v129, v124, v172, v130);
    swift_errorRelease(v186);
    (*(void (**)(_BYTE *, uint64_t))(v123 + 8))(v122, v125);
    sub_10002EBEC(v121);
    (*(void (**)(uint64_t, uint64_t))(v176 + 8))(v119, v181);
  }
  v131 = *(_QWORD *)(v0 + 696);
  v132 = *(_QWORD *)(v0 + 688);
  v133 = *(_QWORD *)(v0 + 680);
  v134 = *(_QWORD *)(v0 + 672);
  v135 = *(_QWORD *)(v0 + 664);
  v136 = *(_QWORD *)(v0 + 656);
  v137 = *(_QWORD *)(v0 + 648);
  v138 = *(_QWORD *)(v0 + 640);
  v139 = *(_QWORD *)(v0 + 616);
  v141 = *(_QWORD *)(v0 + 608);
  v142 = *(_QWORD *)(v0 + 584);
  v143 = *(_QWORD *)(v0 + 560);
  v144 = *(_QWORD *)(v0 + 552);
  v145 = *(_QWORD *)(v0 + 544);
  v146 = *(_QWORD *)(v0 + 520);
  v147 = *(_QWORD *)(v0 + 512);
  v148 = *(_QWORD *)(v0 + 504);
  v150 = *(_QWORD *)(v0 + 496);
  v155 = *(_QWORD *)(v0 + 488);
  *(_QWORD *)typec = *(_QWORD *)(v0 + 480);
  logb = *(os_log_t *)(v0 + 456);
  v167 = *(_QWORD *)(v0 + 432);
  v173 = *(_QWORD *)(v0 + 424);
  v177 = *(_QWORD *)(v0 + 416);
  v182 = *(_QWORD *)(v0 + 392);
  v187 = *(_QWORD *)(v0 + 384);
  swift_task_dealloc(*(_QWORD *)(v0 + 704));
  swift_task_dealloc(v131);
  swift_task_dealloc(v132);
  swift_task_dealloc(v133);
  swift_task_dealloc(v134);
  swift_task_dealloc(v135);
  swift_task_dealloc(v136);
  swift_task_dealloc(v137);
  swift_task_dealloc(v138);
  swift_task_dealloc(v139);
  swift_task_dealloc(v141);
  swift_task_dealloc(v142);
  swift_task_dealloc(v143);
  swift_task_dealloc(v144);
  swift_task_dealloc(v145);
  swift_task_dealloc(v146);
  swift_task_dealloc(v147);
  swift_task_dealloc(v148);
  swift_task_dealloc(v150);
  swift_task_dealloc(v155);
  swift_task_dealloc(*(_QWORD *)typec);
  swift_task_dealloc(logb);
  swift_task_dealloc(v167);
  swift_task_dealloc(v173);
  swift_task_dealloc(v177);
  swift_task_dealloc(v182);
  swift_task_dealloc(v187);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002B474(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
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
  _BYTE *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  _BYTE *v47;
  _BYTE *v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t (*v55)(_QWORD, _QWORD);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  void (*v60)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  _BYTE *v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t *v80;
  _BYTE *v81;
  uint64_t v82;
  _BYTE *v83;
  uint64_t v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  _BYTE *v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE *v91;
  uint64_t v92;
  _BYTE *v93;
  _BYTE *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _BYTE *v98;
  uint64_t v99;
  NSObject *v100;
  os_log_type_t v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _BYTE *v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  double v113;
  _BYTE *v114;
  uint64_t v115;
  NSObject *v116;
  os_log_type_t v117;
  uint8_t *v118;
  _BYTE *v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE *v122;
  uint64_t v123;
  os_log_type_t v124;
  uint8_t *v125;
  _BYTE *v126;
  uint64_t v127;
  uint64_t v128;
  _BYTE *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void (*v133)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _BYTE *v138;
  _BYTE *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t result;
  _BYTE *v144;
  uint64_t v145;
  NSObject *v146;
  os_log_type_t v147;
  uint8_t *v148;
  uint64_t v149;
  _BYTE *v150;
  uint64_t v151;
  uint64_t v152;
  _BYTE *v153;
  uint64_t v154;
  uint64_t v155;
  _BYTE *v156;
  uint64_t v157;
  uint64_t v158;
  _BYTE *v159;
  uint64_t v160;
  _BYTE *v161;
  uint64_t v162;
  uint64_t v163;
  _BYTE v164[12];
  int v165;
  uint64_t v166;
  _BYTE *v167;
  _BYTE *v168;
  _BYTE *v169;
  _BYTE *v170;
  _BYTE *v171;
  _BYTE *v172;
  _BYTE *v173;
  uint64_t v174;
  _BYTE *v175;
  uint64_t (*v176)(_QWORD, _QWORD);
  uint64_t v177;
  _BYTE *v178;
  uint64_t v179;
  uint64_t v180;
  _BYTE *v181;
  _BYTE *v182;
  uint64_t v183;
  uint64_t v184;
  _BYTE *v185;
  uint64_t v186;
  uint64_t v187;
  _BYTE *v188;
  uint64_t v189;
  _BYTE *v190;
  void (*v191)(_BYTE *, uint64_t);
  void (*v192)(_BYTE *, uint64_t, uint64_t);
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t (*v196)(_QWORD, _QWORD);
  uint64_t v197;
  uint64_t v198;

  v187 = a1;
  v5 = type metadata accessor for EnergySite.EnergyUsageTimeInterval(0);
  v183 = *(_QWORD *)(v5 - 8);
  v184 = v5;
  __chkstk_darwin(v5);
  v182 = &v164[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v186 = type metadata accessor for HistoricalUsageSnapshot(0);
  v7 = *(_QWORD *)(v186 - 8);
  __chkstk_darwin(v186);
  v185 = &v164[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = type metadata accessor for Date(0);
  v193 = *(_QWORD *)(v9 - 8);
  v194 = v9;
  __chkstk_darwin(v9);
  v190 = &v164[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v179 = type metadata accessor for TimelineReloadPolicy(0);
  v177 = *(_QWORD *)(v179 - 8);
  __chkstk_darwin(v179);
  v178 = &v164[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = type metadata accessor for HistoricalUsageError(0);
  v13 = *(_BYTE **)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v181 = &v164[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = __chkstk_darwin(v14);
  v173 = &v164[-v17];
  v18 = __chkstk_darwin(v16);
  v170 = &v164[-v19];
  v20 = __chkstk_darwin(v18);
  v188 = &v164[-v21];
  __chkstk_darwin(v20);
  v23 = &v164[-v22];
  v189 = type metadata accessor for Logger(0);
  v180 = *(_QWORD *)(v189 - 8);
  v24 = __chkstk_darwin(v189);
  v168 = &v164[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = __chkstk_darwin(v24);
  v169 = &v164[-v27];
  v28 = __chkstk_darwin(v26);
  v175 = &v164[-v29];
  v30 = __chkstk_darwin(v28);
  v167 = &v164[-v31];
  v32 = __chkstk_darwin(v30);
  v171 = &v164[-v33];
  v34 = __chkstk_darwin(v32);
  v172 = &v164[-v35];
  v36 = __chkstk_darwin(v34);
  v38 = &v164[-v37];
  static Logger.historicalUsageWidgets.getter(v36);
  v192 = (void (*)(_BYTE *, uint64_t, uint64_t))*((_QWORD *)v13 + 2);
  v39 = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v192)(v23, a3, v12);
  v40 = Logger.logObject.getter(v39);
  v41 = static os_log_type_t.error.getter();
  v42 = v41;
  if (os_log_type_enabled(v40, v41))
  {
    v43 = swift_slowAlloc(22, -1);
    v174 = v7;
    v44 = v43;
    v45 = (uint64_t *)swift_slowAlloc(8, -1);
    v176 = (uint64_t (*)(_QWORD, _QWORD))swift_slowAlloc(32, -1);
    v196 = v176;
    *(_DWORD *)v44 = 136315394;
    v166 = a3;
    v195 = sub_10000F4DC(0xD000000000000019, 0x8000000100032550, (uint64_t *)&v196);
    v165 = v42;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, &v196, v44 + 4, v44 + 12);
    *(_WORD *)(v44 + 12) = 2112;
    v191 = (void (*)(_BYTE *, uint64_t))(v44 + 14);
    v46 = sub_10000C440(&qword_10003D3C0, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageError, (uint64_t)&protocol conformance descriptor for HistoricalUsageError);
    v47 = v13;
    v48 = a2;
    v49 = v12;
    v50 = swift_allocError(v12, v46, 0, 0);
    v192(v51, (uint64_t)v23, v49);
    v52 = _swift_stdlib_bridgeErrorToNSError(v50);
    v195 = v52;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, &v196, v191, v44 + 22);
    v53 = v40;
    *v45 = v52;
    v12 = v49;
    a2 = v48;
    v13 = v47;
    a3 = v166;
    v191 = (void (*)(_BYTE *, uint64_t))*((_QWORD *)v13 + 1);
    v191(v23, v12);
    _os_log_impl((void *)&_mh_execute_header, v40, (os_log_type_t)v165, "%s: Erroring out widget due to snapshot error: %@", (uint8_t *)v44, 0x16u);
    v54 = sub_100005E18(&qword_10003CF30);
    swift_arrayDestroy(v45, 1, v54);
    swift_slowDealloc(v45, -1, -1);
    v55 = v176;
    swift_arrayDestroy(v176, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v55, -1, -1);
    v56 = v44;
    v7 = v174;
    swift_slowDealloc(v56, -1, -1);

  }
  else
  {
    v191 = (void (*)(_BYTE *, uint64_t))*((_QWORD *)v13 + 1);
    v191(v23, v12);

  }
  v57 = v189;
  v176 = *(uint64_t (**)(_QWORD, _QWORD))(v180 + 8);
  v58 = v176(v38, v189);
  v59 = v190;
  v60 = v192;
  v61 = v188;
  static TimelineReloadPolicy.atEnd.getter(v58);
  v60(v61, a3, v12);
  v62 = (*((uint64_t (**)(_BYTE *, uint64_t))v13 + 11))(v61, v12);
  v63 = enum case for HistoricalUsageError.invalidEnergySite(_:);
  LODWORD(v180) = enum case for HistoricalUsageError.invalidEnergySite(_:);
  if ((_DWORD)v62 == enum case for HistoricalUsageError.invalidEnergySite(_:))
  {
    v188 = a2;
    v64 = v175;
    static Logger.historicalUsageWidgets.getter(v62);
    v65 = a3;
    v66 = v173;
    v67 = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v60)(v173, v65, v12);
    v68 = Logger.logObject.getter(v67);
    v69 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v68, v69))
    {
      v70 = swift_slowAlloc(22, -1);
      v71 = swift_slowAlloc(8, -1);
      v174 = v7;
      v72 = (_QWORD *)v71;
      v73 = swift_slowAlloc(32, -1);
      v196 = (uint64_t (*)(_QWORD, _QWORD))v73;
      *(_DWORD *)v70 = 136315394;
      v195 = sub_10000F4DC(0xD000000000000019, 0x8000000100032550, (uint64_t *)&v196);
      v172 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, &v196, v70 + 4, v70 + 12);
      *(_WORD *)(v70 + 12) = 2112;
      v74 = sub_10000C440(&qword_10003D3C0, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageError, (uint64_t)&protocol conformance descriptor for HistoricalUsageError);
      v75 = swift_allocError(v12, v74, 0, 0);
      v192(v76, (uint64_t)v66, v12);
      v77 = _swift_stdlib_bridgeErrorToNSError(v75);
      v195 = v77;
      v13 = v172;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, &v196, v70 + 14, v70 + 22);
      *v72 = v77;
      v59 = v190;
      v191(v66, v12);
      _os_log_impl((void *)&_mh_execute_header, v68, v69, "%s: No site for available, erroring out widget. asking for 60 minute reload %@", (uint8_t *)v70, 0x16u);
      v78 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v72, 1, v78);
      v79 = v72;
      v7 = v174;
      swift_slowDealloc(v79, -1, -1);
      swift_arrayDestroy(v73, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v73, -1, -1);
      swift_slowDealloc(v70, -1, -1);

      v80 = &v198;
LABEL_7:
      v81 = (_BYTE *)*(v80 - 32);
      v82 = v189;
LABEL_13:
      v92 = v176(v81, v82);
      v93 = v188;
      v95 = v177;
      v94 = v178;
      Date.init(timeIntervalSinceNow:)(v92, 3600.0);
      static TimelineReloadPolicy.after(_:)(v59);
      (*(void (**)(_BYTE *, uint64_t))(v193 + 8))(v59, v194);
      v96 = v179;
      (*(void (**)(_BYTE *, uint64_t))(v95 + 8))(v93, v179);
      v97 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v95 + 32))(v93, v94, v96);
      goto LABEL_29;
    }
    v191(v66, v12);

    goto LABEL_12;
  }
  if ((_DWORD)v62 == enum case for HistoricalUsageError.gettingUsageData(_:))
  {
    v192 = (void (*)(_BYTE *, uint64_t, uint64_t))v12;
    v83 = v172;
    v84 = static Logger.historicalUsageWidgets.getter(v62);
    v85 = Logger.logObject.getter(v84);
    v86 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v85, v86))
    {
      v87 = (uint8_t *)swift_slowAlloc(12, -1);
      v88 = a2;
      v89 = swift_slowAlloc(32, -1);
      v196 = (uint64_t (*)(_QWORD, _QWORD))v89;
      *(_DWORD *)v87 = 136315138;
      v195 = sub_10000F4DC(0xD000000000000019, 0x8000000100032550, (uint64_t *)&v196);
      v59 = v190;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, &v196, v87 + 4, v87 + 12);
      _os_log_impl((void *)&_mh_execute_header, v85, v86, "%s: historical usage is still loading (or a transient error), displaying empty, retrying as soon as WidgetKit allows...", v87, 0xCu);
      swift_arrayDestroy(v89, 1, (char *)&type metadata for Any + 8);
      v90 = v89;
      a2 = v88;
      swift_slowDealloc(v90, -1, -1);
      swift_slowDealloc(v87, -1, -1);

      v91 = v172;
    }
    else
    {

      v91 = v83;
    }
    v112 = v176(v91, v57);
    v12 = (uint64_t)v192;
    v113 = 60.0;
    goto LABEL_28;
  }
  if ((_DWORD)v62 == enum case for HistoricalUsageError.noUsageDataAvailable(_:))
  {
    v188 = a2;
    v64 = v171;
    static Logger.historicalUsageWidgets.getter(v62);
    v98 = v170;
    v99 = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v60)(v170, a3, v12);
    v100 = Logger.logObject.getter(v99);
    v101 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v100, v101))
    {
      v102 = swift_slowAlloc(22, -1);
      v103 = swift_slowAlloc(8, -1);
      v174 = v7;
      v104 = (_QWORD *)v103;
      v105 = swift_slowAlloc(32, -1);
      v196 = (uint64_t (*)(_QWORD, _QWORD))v105;
      *(_DWORD *)v102 = 136315394;
      v195 = sub_10000F4DC(0xD000000000000019, 0x8000000100032550, (uint64_t *)&v196);
      v172 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, &v196, v102 + 4, v102 + 12);
      *(_WORD *)(v102 + 12) = 2112;
      v106 = sub_10000C440(&qword_10003D3C0, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageError, (uint64_t)&protocol conformance descriptor for HistoricalUsageError);
      v107 = swift_allocError(v12, v106, 0, 0);
      v192(v108, (uint64_t)v98, v12);
      v109 = _swift_stdlib_bridgeErrorToNSError(v107);
      v195 = v109;
      v13 = v172;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, &v196, v102 + 14, v102 + 22);
      *v104 = v109;
      v59 = v190;
      v191(v98, v12);
      _os_log_impl((void *)&_mh_execute_header, v100, v101, "%s: historical usage loading failed, erroring out widget, asking for 60 minute reload: %@", (uint8_t *)v102, 0x16u);
      v110 = sub_100005E18(&qword_10003CF30);
      swift_arrayDestroy(v104, 1, v110);
      v111 = v104;
      v7 = v174;
      swift_slowDealloc(v111, -1, -1);
      swift_arrayDestroy(v105, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v105, -1, -1);
      swift_slowDealloc(v102, -1, -1);

      v80 = &v197;
      goto LABEL_7;
    }
    v191(v98, v12);

LABEL_12:
    v81 = v64;
    v82 = v57;
    goto LABEL_13;
  }
  if ((_DWORD)v62 == enum case for HistoricalUsageError.noUtilityFound(_:))
  {
    v192 = (void (*)(_BYTE *, uint64_t, uint64_t))v12;
    v114 = v169;
    v115 = static Logger.historicalUsageWidgets.getter(v62);
    v116 = Logger.logObject.getter(v115);
    v117 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v116, v117))
    {
      v118 = (uint8_t *)swift_slowAlloc(12, -1);
      v119 = a2;
      v120 = swift_slowAlloc(32, -1);
      v196 = (uint64_t (*)(_QWORD, _QWORD))v120;
      *(_DWORD *)v118 = 136315138;
      v195 = sub_10000F4DC(0xD000000000000019, 0x8000000100032550, (uint64_t *)&v196);
      v59 = v190;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, &v196, v118 + 4, v118 + 12);
      _os_log_impl((void *)&_mh_execute_header, v116, v117, "%s: Utility has been offboarded for EnergySite. Asking for 60 minute reload", v118, 0xCu);
      swift_arrayDestroy(v120, 1, (char *)&type metadata for Any + 8);
      v121 = v120;
      a2 = v119;
      swift_slowDealloc(v121, -1, -1);
      swift_slowDealloc(v118, -1, -1);

      v122 = v169;
LABEL_27:
      v112 = v176(v122, v57);
      v12 = (uint64_t)v192;
      v113 = 3600.0;
LABEL_28:
      Date.init(timeIntervalSinceNow:)(v112, v113);
      v129 = v178;
      static TimelineReloadPolicy.after(_:)(v59);
      (*(void (**)(_BYTE *, uint64_t))(v193 + 8))(v59, v194);
      v130 = v177;
      v131 = v179;
      (*(void (**)(_BYTE *, uint64_t))(v177 + 8))(a2, v179);
      v97 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v130 + 32))(a2, v129, v131);
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  if ((_DWORD)v62 == enum case for HistoricalUsageError.disconnectedSubscription(_:))
  {
    v192 = (void (*)(_BYTE *, uint64_t, uint64_t))v12;
    v114 = v168;
    v123 = static Logger.historicalUsageWidgets.getter(v62);
    v116 = Logger.logObject.getter(v123);
    v124 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v116, v124))
    {
      v125 = (uint8_t *)swift_slowAlloc(12, -1);
      v126 = a2;
      v127 = swift_slowAlloc(32, -1);
      v196 = (uint64_t (*)(_QWORD, _QWORD))v127;
      *(_DWORD *)v125 = 136315138;
      v195 = sub_10000F4DC(0xD000000000000019, 0x8000000100032550, (uint64_t *)&v196);
      v59 = v190;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, &v196, v125 + 4, v125 + 12);
      _os_log_impl((void *)&_mh_execute_header, v116, v124, "%s: Subscription disconnected, erroring out widget. Asking for 60 minute reload", v125, 0xCu);
      swift_arrayDestroy(v127, 1, (char *)&type metadata for Any + 8);
      v128 = v127;
      a2 = v126;
      swift_slowDealloc(v128, -1, -1);
      swift_slowDealloc(v125, -1, -1);

      v122 = v168;
      goto LABEL_27;
    }
LABEL_26:

    v122 = v114;
    goto LABEL_27;
  }
  if ((_DWORD)v62 != enum case for HistoricalUsageError.otherError(_:))
  {
    Date.init(timeIntervalSinceNow:)(v62, 3600.0);
    v155 = v63;
    v156 = v178;
    static TimelineReloadPolicy.after(_:)(v59);
    (*(void (**)(_BYTE *, uint64_t))(v193 + 8))(v59, v194);
    v157 = v177;
    v158 = v179;
    (*(void (**)(_BYTE *, uint64_t))(v177 + 8))(a2, v179);
    v159 = v156;
    v132 = v155;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v157 + 32))(a2, v159, v158);
    v97 = ((uint64_t (*)(_BYTE *, uint64_t))v191)(v188, v12);
    goto LABEL_30;
  }
  v192 = (void (*)(_BYTE *, uint64_t, uint64_t))v12;
  v144 = v167;
  v145 = static Logger.historicalUsageWidgets.getter(v62);
  v146 = Logger.logObject.getter(v145);
  v147 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v146, v147))
  {
    v148 = (uint8_t *)swift_slowAlloc(12, -1);
    v149 = v57;
    v150 = a2;
    v151 = swift_slowAlloc(32, -1);
    v196 = (uint64_t (*)(_QWORD, _QWORD))v151;
    *(_DWORD *)v148 = 136315138;
    v195 = sub_10000F4DC(0xD000000000000019, 0x8000000100032550, (uint64_t *)&v196);
    v59 = v190;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, &v196, v148 + 4, v148 + 12);
    _os_log_impl((void *)&_mh_execute_header, v146, v147, "%s: historical usage loading failed, but error is recoverable, asking for 60 minute reload", v148, 0xCu);
    swift_arrayDestroy(v151, 1, (char *)&type metadata for Any + 8);
    v152 = v151;
    a2 = v150;
    swift_slowDealloc(v152, -1, -1);
    swift_slowDealloc(v148, -1, -1);

    v153 = v167;
    v154 = v149;
  }
  else
  {

    v153 = v144;
    v154 = v57;
  }
  v160 = v176(v153, v154);
  Date.init(timeIntervalSinceNow:)(v160, 3600.0);
  v161 = v178;
  static TimelineReloadPolicy.after(_:)(v59);
  (*(void (**)(_BYTE *, uint64_t))(v193 + 8))(v59, v194);
  v162 = v177;
  v163 = v179;
  (*(void (**)(_BYTE *, uint64_t))(v177 + 8))(a2, v179);
  v97 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v162 + 32))(a2, v161, v163);
  v12 = (uint64_t)v192;
LABEL_29:
  v132 = v180;
LABEL_30:
  static Date.now.getter(v97);
  v133 = (void (*)(_BYTE *, uint64_t, uint64_t))*((_QWORD *)v13 + 13);
  v134 = v181;
  v133(v181, v132, v12);
  v136 = v183;
  v135 = v184;
  v137 = v12;
  v138 = v182;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v183 + 104))(v182, enum case for EnergySite.EnergyUsageTimeInterval.week(_:), v184);
  v139 = v185;
  static HistoricalUsageSnapshot.dynamicSnapshotWithError(_:interval:)(v134, v138);
  (*(void (**)(_BYTE *, uint64_t))(v136 + 8))(v138, v135);
  v191(v134, v137);
  v140 = sub_10001A060();
  v141 = v187;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v193 + 32))(v187, v59, v194);
  v142 = type metadata accessor for HistoricalUsageEntry(0);
  result = (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v7 + 32))(v141 + *(int *)(v142 + 20), v139, v186);
  *(_QWORD *)(v141 + *(int *)(v142 + 24)) = v140;
  return result;
}

uint64_t sub_10002C690(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *a2;
  v5 = (_QWORD *)swift_task_alloc(dword_10003D3DC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000670C;
  return sub_1000284E0(a1, v4);
}

uint64_t sub_10002C6E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *a2;
  v5 = (_QWORD *)swift_task_alloc(dword_10003D3B4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000670C;
  return sub_100028B00(a1, v4);
}

uint64_t sub_10002C740(uint64_t *a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  return sub_10002E570(*a1, a2, a3, a4);
}

uint64_t sub_10002C748(uint64_t *a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  return sub_10002E850(*a1, a2, a3, a4);
}

uint64_t sub_10002C750()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;
  void *object;
  Swift::String v4;
  uint64_t v5;
  Swift::String v6;
  void *v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  void *v12;

  _StringGuts.grow(_:)(54);
  v1._countAndFlagsBits = 0xD000000000000018;
  v1._object = (void *)0x8000000100032920;
  String.append(_:)(v1);
  v2 = Date.formatted()();
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._countAndFlagsBits = 2106912;
  v4._object = (void *)0xE300000000000000;
  String.append(_:)(v4);
  v5 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for HistoricalUsageEntry(0) + 24));
  swift_retain(v5);
  v6._countAndFlagsBits = sub_100018AD4();
  v7 = v6._object;
  String.append(_:)(v6);
  swift_release(v5);
  swift_bridgeObjectRelease(v7);
  v8._object = (void *)0x8000000100032940;
  v8._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v8);
  v9 = type metadata accessor for HistoricalUsageSnapshot(0);
  v10 = sub_10000C440(&qword_10003CC90, (uint64_t (*)(uint64_t))&type metadata accessor for HistoricalUsageSnapshot, (uint64_t)&protocol conformance descriptor for HistoricalUsageSnapshot);
  v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v9, v10);
  v12 = v11._object;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v12);
  return 0;
}

uint64_t sub_10002C8A8()
{
  return sub_10000C440(qword_10003D378, type metadata accessor for HistoricalUsageEntry, (uint64_t)&unk_100031940);
}

uint64_t sub_10002C8D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_10002CD60(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_10002CEA4();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (uint64_t *)(v20[7] + 16 * v14);
      result = *v21;
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (uint64_t *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      swift_bridgeObjectRetain();
      return 0;
    }
    goto LABEL_14;
  }
  sub_10002CA3C(v17, a5 & 1);
  v23 = sub_10002CD60(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

Swift::Int sub_10002CA3C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  uint64_t v42;
  char v43;
  _QWORD v44[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100005E18(&qword_10003D3D0);
  v43 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v42 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v40 = v3;
  v41 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v22 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v23 = v22 | (v14 << 6);
      goto LABEL_34;
    }
    v24 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v24 >= v41)
      break;
    v25 = (_QWORD *)(v5 + 64);
    v26 = *(_QWORD *)(v42 + 8 * v24);
    ++v14;
    if (!v26)
    {
      v14 = v24 + 1;
      if (v24 + 1 >= v41)
        goto LABEL_36;
      v26 = *(_QWORD *)(v42 + 8 * v14);
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_36:
          swift_release(v5);
          v3 = v40;
          if ((v43 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v26 = *(_QWORD *)(v42 + 8 * v27);
        if (!v26)
        {
          while (1)
          {
            v14 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_45;
            if (v14 >= v41)
              goto LABEL_36;
            v26 = *(_QWORD *)(v42 + 8 * v14);
            ++v27;
            if (v26)
              goto LABEL_33;
          }
        }
        v14 = v27;
      }
    }
LABEL_33:
    v11 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v14 << 6);
LABEL_34:
    v32 = 16 * v23;
    v33 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v32);
    v35 = *v33;
    v34 = v33[1];
    v36 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v32);
    v37 = *v36;
    v38 = v36[1];
    if ((v43 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)(v44, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v44, v35, v34);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v30 = v17 == v29;
        if (v17 == v29)
          v17 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v31 == -1);
      v18 = __clz(__rbit64(~v31)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 16 * v18;
    v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
    *v20 = v35;
    v20[1] = v34;
    v21 = (_QWORD *)(*(_QWORD *)(v8 + 56) + v19);
    *v21 = v37;
    v21[1] = v38;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v40;
  v25 = (_QWORD *)(v5 + 64);
  if ((v43 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v39 = 1 << *(_BYTE *)(v5 + 32);
  if (v39 >= 64)
    bzero(v25, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v39;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

unint64_t sub_10002CD60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10002CDC4(a1, a2, v5);
}

unint64_t sub_10002CDC4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void *sub_10002CEA4()
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  sub_100005E18(&qword_10003D3D0);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10002D05C(uint64_t a1)
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

_QWORD *sub_10002D0E4(_QWORD *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = (uint64_t *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    v6 = *v5;
    v7 = v5[1];
    v8 = (_QWORD *)(*(_QWORD *)(a5 + 56) + 16 * a2);
    v9 = v8[1];
    *result = *v8;
    result[1] = v9;
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v9);
    return (_QWORD *)v6;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_10002D180()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = type metadata accessor for UUID(0);
  v0[15] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[16] = v2;
  v0[17] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Logger(0);
  v0[18] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v0[19] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v0[20] = swift_task_alloc(v5);
  v0[21] = swift_task_alloc(v5);
  v0[22] = swift_task_alloc(v5);
  v0[23] = swift_task_alloc(v5);
  v0[24] = swift_task_alloc(v5);
  return swift_task_switch(sub_10002D238, 0, 0);
}

uint64_t sub_10002D238()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 200) = v1;
  v2 = sub_1000066D4(0, &qword_10003C770, HMHomeManager_ptr);
  *v1 = v0;
  v1[1] = sub_10002D2D8;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 48, 0, 0, 0x616E614D656D6F68, 0xEB00000000726567, sub_100004008, 0, v2);
}

uint64_t sub_10002D2D8()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 200));
  return swift_task_switch(sub_10002D32C, 0, 0);
}

uint64_t sub_10002D32C()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  BOOL v44;
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
  os_log_type_t type;
  uint64_t v58;
  uint64_t v59;
  NSObject *log;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v1 = *(void **)(v0 + 48);
  v2 = objc_msgSend(v1, "homes");

  v3 = sub_1000066D4(0, &qword_10003CAE0, HMHome_ptr);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);
  *(_QWORD *)(v0 + 208) = v4;

  *(_QWORD *)(v0 + 40) = _swiftEmptyDictionarySingleton;
  if ((unint64_t)v4 >> 62)
  {
    if (v4 < 0)
      v39 = v4;
    else
      v39 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v5 = _CocoaArrayWrapper.endIndex.getter(v39);
    swift_bridgeObjectRelease(v4);
    *(_QWORD *)(v0 + 216) = v5;
    if (v5)
      goto LABEL_3;
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    *(_QWORD *)(v0 + 216) = v5;
    if (v5)
    {
LABEL_3:
      result = type metadata accessor for EnergySite(0);
      *(_QWORD *)(v0 + 224) = result;
      if (v5 < 1)
      {
        __break(1u);
      }
      else
      {
        *(_QWORD *)(v0 + 232) = 0;
        v7 = *(_QWORD *)(v0 + 208);
        if ((v7 & 0xC000000000000001) != 0)
          v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v7);
        else
          v8 = *(id *)(v7 + 32);
        v9 = v8;
        *(_QWORD *)(v0 + 240) = v8;
        static Logger.other.getter();
        v10 = v9;
        v11 = Logger.logObject.getter(v10);
        v12 = static os_log_type_t.default.getter();
        v13 = os_log_type_enabled(v11, v12);
        v14 = *(_QWORD *)(v0 + 192);
        v16 = *(_QWORD *)(v0 + 144);
        v15 = *(_QWORD *)(v0 + 152);
        if (v13)
        {
          v62 = *(_QWORD *)(v0 + 192);
          v63 = *(_QWORD *)(v0 + 144);
          log = v11;
          v17 = *(_QWORD *)(v0 + 136);
          v58 = *(_QWORD *)(v0 + 128);
          v59 = *(_QWORD *)(v0 + 120);
          v18 = swift_slowAlloc(32, -1);
          v61 = swift_slowAlloc(96, -1);
          v65 = v61;
          *(_DWORD *)v18 = 136315650;
          *(_QWORD *)(v0 + 96) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v65);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v18 + 4, v18 + 12);
          *(_WORD *)(v18 + 12) = 2080;
          v19 = objc_msgSend(v10, "name");
          v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
          type = v12;
          v22 = v21;

          *(_QWORD *)(v0 + 104) = sub_10000F4DC(v20, v22, &v65);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 104, v0 + 112, v18 + 14, v18 + 22);
          swift_bridgeObjectRelease(v22);

          *(_WORD *)(v18 + 22) = 2080;
          v23 = objc_msgSend(v10, "uniqueIdentifier");
          static UUID._unconditionallyBridgeFromObjectiveC(_:)();

          v25 = UUID.uuidString.getter(v24);
          v27 = v26;
          (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v17, v59);
          *(_QWORD *)(v0 + 112) = sub_10000F4DC(v25, v27, &v65);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120, v18 + 24, v18 + 32);
          swift_bridgeObjectRelease(v27);

          _os_log_impl((void *)&_mh_execute_header, log, type, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v18, 0x20u);
          swift_arrayDestroy(v61, 3, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v61, -1, -1);
          swift_slowDealloc(v18, -1, -1);

          v28 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
          v28(v62, v63);
        }
        else
        {

          v28 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
          v28(v14, v16);
        }
        *(_QWORD *)(v0 + 248) = v28;
        v30 = *(_QWORD *)(v0 + 128);
        v29 = *(_QWORD *)(v0 + 136);
        v31 = *(_QWORD *)(v0 + 120);
        v32 = objc_msgSend(v10, "uniqueIdentifier");
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        v34 = UUID.uuidString.getter(v33);
        v36 = v35;
        v37 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        *(_QWORD *)(v0 + 256) = v37;
        v37(v29, v31);
        v38 = (_QWORD *)swift_task_alloc(async function pointer to EnergySite.__allocating_init(clientProvidedID:)[1]);
        *(_QWORD *)(v0 + 264) = v38;
        *v38 = v0;
        v38[1] = sub_10002D978;
        return EnergySite.__allocating_init(clientProvidedID:)(v34, v36);
      }
      return result;
    }
  }
  v40 = swift_bridgeObjectRelease(v4);
  static Logger.historicalUsageWidgets.getter(v40);
  v41 = swift_bridgeObjectRetain();
  v42 = Logger.logObject.getter(v41);
  v43 = static os_log_type_t.default.getter();
  v44 = os_log_type_enabled(v42, v43);
  v46 = *(_QWORD *)(v0 + 152);
  v45 = *(_QWORD *)(v0 + 160);
  v47 = *(_QWORD *)(v0 + 144);
  if (v44)
  {
    v64 = *(_QWORD *)(v0 + 144);
    v48 = swift_slowAlloc(22, -1);
    v49 = swift_slowAlloc(32, -1);
    v65 = v49;
    *(_DWORD *)v48 = 136315394;
    *(_QWORD *)(v0 + 56) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v65);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v48 + 4, v48 + 12);
    *(_WORD *)(v48 + 12) = 2048;
    *(_QWORD *)(v0 + 64) = _swiftEmptyDictionarySingleton[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v48 + 14, v48 + 22);
    swift_bridgeObjectRelease(_swiftEmptyDictionarySingleton);
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "%s found %ld onboarded homes", (uint8_t *)v48, 0x16u);
    swift_arrayDestroy(v49, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v49, -1, -1);
    swift_slowDealloc(v48, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v64);
  }
  else
  {
    swift_bridgeObjectRelease(_swiftEmptyDictionarySingleton);

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v45, v47);
  }
  v51 = *(_QWORD *)(v0 + 184);
  v50 = *(_QWORD *)(v0 + 192);
  v53 = *(_QWORD *)(v0 + 168);
  v52 = *(_QWORD *)(v0 + 176);
  v54 = *(_QWORD *)(v0 + 160);
  v55 = *(_QWORD *)(v0 + 136);
  swift_beginAccess(v0 + 40, v0 + 16, 0, 0);
  v56 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v54);
  swift_task_dealloc(v55);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v56);
}

uint64_t sub_10002D978(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 264);
  *(_QWORD *)(*(_QWORD *)v1 + 272) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10002D9D4, 0, 0);
}

uint64_t sub_10002D9D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void (*v8)(uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  void (*v25)(uint64_t, uint64_t);
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  void (*v39)(uint64_t, uint64_t);
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void *v50;
  uint64_t v51;
  uint64_t v52;
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
  char isUniquelyReferenced_nonNull_native;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  BOOL v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v91;
  id v92;
  NSObject *v93;
  os_log_type_t v94;
  _BOOL4 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  void (*v109)(uint64_t, uint64_t);
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(uint64_t, uint64_t);
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t type;
  void (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t, uint64_t);
  os_log_type_t v128;
  uint64_t v129;
  uint64_t v130;
  void (*v131)(uint64_t, uint64_t);
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;

  v133 = v0 + 96;
  v1 = *(_QWORD *)(v0 + 272);
  if (v1)
  {
    v2 = EnergySite.utilityOnboarded.getter();
    if ((v2 & 1) != 0)
    {
      v3 = *(void **)(v0 + 240);
      static Logger.historicalUsageWidgets.getter(v2);
      v4 = v3;
      swift_retain_n(v1, 2);
      v5 = Logger.logObject.getter(v4);
      v6 = static os_log_type_t.default.getter();
      v7 = os_log_type_enabled(v5, v6);
      v9 = *(void **)(v0 + 240);
      v8 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
      v10 = *(_QWORD *)(v0 + 176);
      v11 = *(_QWORD *)(v0 + 144);
      if (v7)
      {
        v129 = *(_QWORD *)(v0 + 176);
        v12 = swift_slowAlloc(32, -1);
        v123 = swift_slowAlloc(96, -1);
        v135 = v123;
        *(_DWORD *)v12 = 136315650;
        v126 = v8;
        *(_QWORD *)(v0 + 72) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v135);
        v13 = UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v12 + 4, v12 + 12);
        *(_WORD *)(v12 + 12) = 2080;
        v121 = v11;
        v14 = EnergySite.identifier.getter(v13);
        v16 = v15;
        *(_QWORD *)(v0 + 80) = sub_10000F4DC(v14, v15, &v135);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v12 + 14, v12 + 22);
        swift_bridgeObjectRelease(v16);
        swift_release_n(v1, 2);
        *(_WORD *)(v12 + 22) = 2080;
        v17 = objc_msgSend(v9, "name");
        v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
        v20 = v19;

        *(_QWORD *)(v0 + 88) = sub_10000F4DC(v18, v20, &v135);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v133, v12 + 24, v12 + 32);
        swift_bridgeObjectRelease(v20);

        _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s Site %s onboarded for '%s', adding to list...", (uint8_t *)v12, 0x20u);
        swift_arrayDestroy(v123, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v123, -1, -1);
        swift_slowDealloc(v12, -1, -1);

        v126(v129, v121);
      }
      else
      {
        swift_release_n(v1, 2);

        v8(v10, v11);
      }
      v49 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 256);
      v50 = *(void **)(v0 + 240);
      v51 = *(_QWORD *)(v0 + 136);
      v52 = *(_QWORD *)(v0 + 120);
      v53 = objc_msgSend(v50, "uniqueIdentifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v55 = UUID.uuidString.getter(v54);
      v57 = v56;
      v58 = v49(v51, v52);
      v59 = EnergySite.identifier.getter(v58);
      v61 = v60;
      v62 = *(_QWORD *)(v0 + 40);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v62);
      v135 = v62;
      *(_QWORD *)(v0 + 40) = 0x8000000000000000;
      sub_10002C8D8(v55, v57, v59, v61, isUniquelyReferenced_nonNull_native);
      v65 = v64;
      v66 = *(_QWORD *)(v0 + 40);
      *(_QWORD *)(v0 + 40) = v135;
      swift_bridgeObjectRelease(v66);

      swift_release(v1);
      swift_bridgeObjectRelease(v61);
      swift_bridgeObjectRelease(v65);
    }
    else
    {
      static Logger.historicalUsageWidgets.getter(v2);
      v35 = swift_retain_n(v1, 2);
      v36 = Logger.logObject.getter(v35);
      v37 = static os_log_type_t.default.getter();
      v38 = os_log_type_enabled(v36, v37);
      v40 = *(void **)(v0 + 240);
      v39 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
      v41 = *(_QWORD *)(v0 + 184);
      v42 = *(_QWORD *)(v0 + 144);
      if (v38)
      {
        v43 = swift_slowAlloc(22, -1);
        v44 = swift_slowAlloc(64, -1);
        v135 = v44;
        *(_DWORD *)v43 = 136315394;
        v45 = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v135);
        *(_QWORD *)(v43 + 4) = v45;
        *(_WORD *)(v43 + 12) = 2080;
        v131 = v39;
        v46 = EnergySite.identifier.getter(v45);
        v48 = v47;
        *(_QWORD *)(v43 + 14) = sub_10000F4DC(v46, v47, &v135);
        swift_bridgeObjectRelease(v48);
        swift_release_n(v1, 2);
        _os_log_impl((void *)&_mh_execute_header, v36, v37, "%s Site %s found, but home not onboarded: ignoring", (uint8_t *)v43, 0x16u);
        swift_arrayDestroy(v44, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v44, -1, -1);
        swift_slowDealloc(v43, -1, -1);

        swift_release(v1);
        v131(v41, v42);
      }
      else
      {

        swift_release_n(v1, 3);
        v39(v41, v42);
      }
    }
  }
  else
  {
    v21 = *(void **)(v0 + 240);
    static Logger.other.getter();
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.error.getter();
    v24 = os_log_type_enabled(v22, v23);
    v26 = *(void **)(v0 + 240);
    v25 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
    v27 = *(_QWORD *)(v0 + 168);
    v28 = *(_QWORD *)(v0 + 144);
    if (v24)
    {
      v130 = *(_QWORD *)(v0 + 168);
      v29 = swift_slowAlloc(22, -1);
      v30 = swift_slowAlloc(64, -1);
      v135 = v30;
      *(_DWORD *)v29 = 136315394;
      *(_QWORD *)(v29 + 4) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v135);
      *(_WORD *)(v29 + 12) = 2080;
      v31 = objc_msgSend(v26, "name");
      v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
      v127 = v25;
      v34 = v33;

      *(_QWORD *)(v29 + 14) = sub_10000F4DC(v32, v34, &v135);
      swift_bridgeObjectRelease(v34);

      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s Site can not be found for home'%s': ignoring", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy(v30, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);

      v127(v130, v28);
    }
    else
    {

      v25(v27, v28);
    }
  }
  v67 = *(_QWORD *)(v0 + 232) + 1;
  if (v67 == *(_QWORD *)(v0 + 216))
  {
    v68 = v0 + 40;
    v69 = swift_bridgeObjectRelease(*(_QWORD *)(v0 + 208));
    v70 = *(_QWORD *)(v0 + 40);
    static Logger.historicalUsageWidgets.getter(v69);
    v71 = swift_bridgeObjectRetain();
    v72 = Logger.logObject.getter(v71);
    v73 = static os_log_type_t.default.getter();
    v74 = os_log_type_enabled(v72, v73);
    v76 = *(_QWORD *)(v0 + 152);
    v75 = *(_QWORD *)(v0 + 160);
    v77 = *(_QWORD *)(v0 + 144);
    if (v74)
    {
      v132 = *(_QWORD *)(v0 + 160);
      v78 = swift_slowAlloc(22, -1);
      v79 = swift_slowAlloc(32, -1);
      v135 = v79;
      *(_DWORD *)v78 = 136315394;
      *(_QWORD *)(v0 + 56) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v135);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v78 + 4, v78 + 12);
      *(_WORD *)(v78 + 12) = 2048;
      *(_QWORD *)(v0 + 64) = *(_QWORD *)(v70 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v78 + 14, v78 + 22);
      swift_bridgeObjectRelease(v70);
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "%s found %ld onboarded homes", (uint8_t *)v78, 0x16u);
      swift_arrayDestroy(v79, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v79, -1, -1);
      v80 = v78;
      v68 = v0 + 40;
      swift_slowDealloc(v80, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v132, v77);
    }
    else
    {
      swift_bridgeObjectRelease(v70);

      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v75, v77);
    }
    v83 = *(_QWORD *)(v0 + 184);
    v84 = *(_QWORD *)(v0 + 192);
    v86 = *(_QWORD *)(v0 + 168);
    v85 = *(_QWORD *)(v0 + 176);
    v87 = *(_QWORD *)(v0 + 160);
    v88 = *(_QWORD *)(v0 + 136);
    swift_beginAccess(v68, v0 + 16, 0, 0);
    v89 = *(_QWORD *)(v0 + 40);
    swift_task_dealloc(v84);
    swift_task_dealloc(v83);
    swift_task_dealloc(v85);
    swift_task_dealloc(v86);
    swift_task_dealloc(v87);
    swift_task_dealloc(v88);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v89);
  }
  else
  {
    *(_QWORD *)(v0 + 232) = v67;
    v81 = *(_QWORD *)(v0 + 208);
    if ((v81 & 0xC000000000000001) != 0)
      v82 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v67, v81);
    else
      v82 = *(id *)(v81 + 8 * v67 + 32);
    v91 = v82;
    *(_QWORD *)(v0 + 240) = v82;
    static Logger.other.getter();
    v92 = v91;
    v93 = Logger.logObject.getter(v92);
    v94 = static os_log_type_t.default.getter();
    v95 = os_log_type_enabled(v93, v94);
    v96 = *(_QWORD *)(v0 + 192);
    v98 = *(_QWORD *)(v0 + 144);
    v97 = *(_QWORD *)(v0 + 152);
    if (v95)
    {
      v128 = v94;
      v120 = *(_QWORD *)(v0 + 136);
      v122 = *(_QWORD *)(v0 + 128);
      v124 = *(_QWORD *)(v0 + 120);
      v99 = swift_slowAlloc(32, -1);
      type = swift_slowAlloc(96, -1);
      v135 = type;
      *(_DWORD *)v99 = 136315650;
      *(_QWORD *)(v0 + 96) = sub_10000F4DC(0xD000000000000022, 0x80000001000324E0, &v135);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v133, v0 + 104, v99 + 4, v99 + 12);
      *(_WORD *)(v99 + 12) = 2080;
      v100 = objc_msgSend(v92, "name");
      v101 = static String._unconditionallyBridgeFromObjectiveC(_:)(v100);
      v134 = v97;
      v103 = v102;

      *(_QWORD *)(v0 + 104) = sub_10000F4DC(v101, v103, &v135);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 104, v0 + 112, v99 + 14, v99 + 22);
      swift_bridgeObjectRelease(v103);

      *(_WORD *)(v99 + 22) = 2080;
      v104 = objc_msgSend(v92, "uniqueIdentifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v106 = UUID.uuidString.getter(v105);
      v108 = v107;
      (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v120, v124);
      *(_QWORD *)(v0 + 112) = sub_10000F4DC(v106, v108, &v135);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120, v99 + 24, v99 + 32);
      swift_bridgeObjectRelease(v108);

      _os_log_impl((void *)&_mh_execute_header, v93, v128, "%s calling EnergySite initializer for '%s' with homeID: %s ", (uint8_t *)v99, 0x20u);
      swift_arrayDestroy(type, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(type, -1, -1);
      swift_slowDealloc(v99, -1, -1);

      v109 = *(void (**)(uint64_t, uint64_t))(v134 + 8);
    }
    else
    {

      v109 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
    }
    v109(v96, v98);
    *(_QWORD *)(v0 + 248) = v109;
    v111 = *(_QWORD *)(v0 + 128);
    v110 = *(_QWORD *)(v0 + 136);
    v112 = *(_QWORD *)(v0 + 120);
    v113 = objc_msgSend(v92, "uniqueIdentifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v115 = UUID.uuidString.getter(v114);
    v117 = v116;
    v118 = *(void (**)(uint64_t, uint64_t))(v111 + 8);
    *(_QWORD *)(v0 + 256) = v118;
    v118(v110, v112);
    v119 = (_QWORD *)swift_task_alloc(async function pointer to EnergySite.__allocating_init(clientProvidedID:)[1]);
    *(_QWORD *)(v0 + 264) = v119;
    *v119 = v0;
    v119[1] = sub_10002D978;
    return EnergySite.__allocating_init(clientProvidedID:)(v115, v117);
  }
}

uint64_t sub_10002E570(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[2];
  void (*v29)(_QWORD);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v34 = a1;
  v6 = type metadata accessor for HistoricalUsageEntry(0);
  __chkstk_darwin(v6);
  v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = type metadata accessor for Logger(0);
  v30 = *(_QWORD *)(v32 - 8);
  __chkstk_darwin(v32);
  v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Calendar.Identifier(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = type metadata accessor for Calendar(0);
  v31 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, enum case for Calendar.Identifier.gregorian(_:), v11);
  Calendar.init(identifier:)(v14);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v18 = static Logger.historicalUsageWidgets.getter(v17);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v28[1] = a4;
    v21 = swift_slowAlloc(12, -1);
    v29 = a3;
    v22 = (uint8_t *)v21;
    v23 = swift_slowAlloc(32, -1);
    v36 = v23;
    *(_DWORD *)v22 = 136315138;
    v35 = sub_10000F4DC(0xD00000000000001FLL, 0x80000001000324A0, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v22 + 4, v22 + 12);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s THIS SHOULD NEVER GET CALLED", v22, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    v24 = v22;
    a3 = v29;
    swift_slowDealloc(v24, -1, -1);
  }

  v25 = (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v10, v32);
  static Date.now.getter(v25);
  static HistoricalUsageSnapshot.staticWidgetPlaceholderSnapshot(calendar:)(v16);
  v26 = v34;
  *(_QWORD *)&v8[*(int *)(v6 + 24)] = v34;
  swift_retain(v26);
  a3(v8);
  sub_10002EBEC((uint64_t)v8);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v16, v33);
}

uint64_t sub_10002E850(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
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
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
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
  char *v36;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *);
  char *v47;
  uint64_t v48;
  uint64_t v49;

  v46 = a3;
  v6 = type metadata accessor for TimelineReloadPolicy(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100005E18(&qword_10003D3A0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v47 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for HistoricalUsageEntry(0);
  v44 = *(_QWORD *)(v12 - 8);
  v45 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Logger(0);
  v43 = *(_QWORD *)(v15 - 8);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = static Logger.historicalUsageWidgets.getter(v16);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v40 = v8;
    v22 = swift_slowAlloc(12, -1);
    v42 = a4;
    v23 = (uint8_t *)v22;
    v24 = swift_slowAlloc(32, -1);
    v41 = v9;
    v25 = v24;
    v49 = v24;
    v38 = v15;
    v39 = a1;
    *(_DWORD *)v23 = 136315138;
    v48 = sub_10000F4DC(0xD00000000000001FLL, 0x8000000100032480, &v49);
    a1 = v39;
    v8 = v40;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v23 + 4, v23 + 12);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s THIS SHOULD NEVER GET CALLED", v23, 0xCu);
    swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
    v26 = v25;
    v9 = v41;
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v23, -1, -1);

    v27 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v18, v38);
  }
  else
  {

    v27 = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v18, v15);
  }
  v28 = static Date.now.getter(v27);
  v29 = v45;
  static HistoricalUsageSnapshot.dynamicMockStaticNoSubintervalsForWeek.getter(v28);
  *(_QWORD *)&v14[*(int *)(v29 + 24)] = a1;
  v30 = sub_100005E18(&qword_10003D3A8);
  v31 = *(unsigned __int8 *)(v44 + 80);
  v32 = (v31 + 32) & ~v31;
  v33 = swift_allocObject(v30, v32 + *(_QWORD *)(v44 + 72), v31 | 7);
  *(_OWORD *)(v33 + 16) = xmmword_1000310E0;
  sub_10002EBA8((uint64_t)v14, v33 + v32);
  v34 = swift_retain(a1);
  static TimelineReloadPolicy.never.getter(v34);
  v35 = sub_10000C440(qword_10003D378, type metadata accessor for HistoricalUsageEntry, (uint64_t)&unk_100031940);
  v36 = v47;
  Timeline.init(entries:policy:)(v33, v8, v29, v35);
  v46(v36);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v36, v9);
  return sub_10002EBEC((uint64_t)v14);
}

uint64_t sub_10002EBA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for HistoricalUsageEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002EBEC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for HistoricalUsageEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002EC28(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005E18(&qword_10003D3B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10002EC6C()
{
  unint64_t result;

  result = qword_10003D3F0;
  if (!qword_10003D3F0)
  {
    result = swift_getWitnessTable(&unk_100031A48, &type metadata for UtilityRateInfoWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_10003D3F0);
  }
  return result;
}

unint64_t sub_10002ECB0()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  void *object;
  _QWORD v5[2];
  unint64_t v6;
  unint64_t v7;

  v5[0] = 0;
  v5[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(18);
  v0 = swift_bridgeObjectRelease(0xE000000000000000);
  v6 = 0xD000000000000010;
  v7 = 0x8000000100032960;
  IntentParameter.wrappedValue.getter(v0);
  v1 = sub_100005E18(&qword_10003D018);
  v2._countAndFlagsBits = String.init<A>(describing:)(v5, v1);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  return v6;
}

uint64_t sub_10002ED60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_1000064C8(v10, qword_10003D548);
  sub_1000064B0(v10, (uint64_t)qword_10003D548);
  v11 = String.LocalizationValue.init(stringLiteral:)(0x48207463656C6553, 0xEB00000000656D6FLL);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v9, 0xD000000000000015, 0x8000000100031FF0, v6, v3, "The home being selected to collect utility rate info from.", 58, 2);
}

unint64_t sub_10002EEE8()
{
  return sub_10002ECB0();
}

unint64_t sub_10002EEF4()
{
  unint64_t result;

  result = qword_10003D3F8;
  if (!qword_10003D3F8)
  {
    result = swift_getWitnessTable(&unk_100031AD8, &type metadata for UtilityRateInfoWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_10003D3F8);
  }
  return result;
}

unint64_t sub_10002EF3C()
{
  unint64_t result;

  result = qword_10003D400;
  if (!qword_10003D400)
  {
    result = swift_getWitnessTable(&unk_100031B00, &type metadata for UtilityRateInfoWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_10003D400);
  }
  return result;
}

uint64_t sub_10002EF80(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10002EC6C();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_10002EFC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10003C760 != -1)
    swift_once(&qword_10003C760, sub_10002ED60);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_1000064B0(v2, (uint64_t)qword_10003D548);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10002F030(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to WidgetConfigurationIntent.perform()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = sub_100016D88();
  *v4 = v2;
  v4[1] = sub_100009E68;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_10002F094@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_10002F0F0();
  *a1 = result;
  return result;
}

uint64_t sub_10002F0B8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10002EC6C();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for UtilityRateInfoWidgetConfiguration()
{
  return &type metadata for UtilityRateInfoWidgetConfiguration;
}

uint64_t sub_10002F0F0()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v19;
  _OWORD v21[3];
  char v22;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100005E18(&qword_10003CA90);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)v21 - v8;
  v10 = sub_100005E18(&qword_10003CAA0);
  __chkstk_darwin(v10);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E18(&qword_10003D020);
  LocalizedStringResource.init(stringLiteral:)(1701670728, 0xE400000000000000);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v17 = type metadata accessor for IntentDialog(0);
  memset(v21, 0, sizeof(v21));
  v22 = 0;
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v9, 1, 1, v17);
  v18(v7, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v19 = sub_1000194E4();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v16, v12, v21, v9, v7, v3, v19);
}

uint64_t sub_10002F2F8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC26HomeEnergyWidgetsExtensionP33_4F8EC91195DA542267485D87CF5BAC8619ResourceBundleClass);
}

uint64_t sub_10002F328()
{
  return sub_10002F4C0(1);
}

uint64_t sub_10002F330(int a1, int a2, int a3, int a4)
{
  BOOL v9;
  _DWORD v10[2];

  if (qword_10003F4A8 == -1)
  {
    if (qword_10003F4B0)
    {
LABEL_3:
      v10[0] = a1;
      v10[1] = (a2 << 16) | (a3 << 8) | a4;
      return _availability_version_check(1, v10);
    }
  }
  else
  {
    dispatch_once_f(&qword_10003F4A8, 0, (dispatch_function_t)sub_10002F4B8);
    if (qword_10003F4B0)
      goto LABEL_3;
  }
  if (qword_10003F4A0 == -1)
  {
    v9 = dword_10003F490 < a2;
    if (dword_10003F490 > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_10003F4A0, 0, (dispatch_function_t)sub_10002F328);
    v9 = dword_10003F490 < a2;
    if (dword_10003F490 > a2)
      return 1;
  }
  if (v9)
    return 0;
  if (dword_10003F494 > a3)
    return 1;
  return dword_10003F494 >= a3 && dword_10003F498 >= a4;
}

uint64_t sub_10002F4B8()
{
  return sub_10002F4C0(0);
}

uint64_t sub_10002F4C0(uint64_t result)
{
  void *v1;
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

  v1 = (void *)qword_10003F4B0;
  if (qword_10003F4B0)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (&__availability_version_check)
    {
      qword_10003F4B0 = (uint64_t)&__availability_version_check;
      v1 = &__availability_version_check;
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
                          v14 = ftell(v13);
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
                                            sscanf(v29, "%d.%d.%d", &dword_10003F490, &dword_10003F494, &dword_10003F498);
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
