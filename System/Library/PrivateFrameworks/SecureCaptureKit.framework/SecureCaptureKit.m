uint64_t sub_245BBE3EC(uint64_t a1)
{
  return sub_245BC1380(a1, (void (*)(void))type metadata accessor for SharedSecureCaptureSessionActor, &qword_257512448);
}

uint64_t static SharedSecureCaptureSessionActor.shared.getter()
{
  return sub_245BC13D4(&qword_257512440);
}

uint64_t SharedSecureCaptureSessionActor.deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return v0;
}

uint64_t SharedSecureCaptureSessionActor.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t SharedSecureCaptureSessionActor.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_245BBE460()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_245BBE46C(uint64_t a1, uint64_t a2)
{
  return sub_245BC1428(a1, a2, &qword_257512440);
}

uint64_t sub_245BBE488()
{
  type metadata accessor for SharedSecureCaptureSessionActor();
  return sub_245BD8DD4();
}

uint64_t static SecureCaptureSession.currentSession.getter()
{
  return swift_retain();
}

uint64_t SecureCaptureSession.__allocating_init(sceneDelegate:)(void *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  SecureCaptureSession.init(sceneDelegate:)(a1);
  return v2;
}

id SecureCaptureSession.init(sceneDelegate:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  id result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend((id)objc_opt_self(), sel_temporarySessionPathWithType_, 1);
  if (result)
  {
    v7 = result;
    *(_QWORD *)(v2 + 16) = result;
    v8 = v2 + OBJC_IVAR____TtC16SecureCaptureKit20SecureCaptureSession_sessionContentsPath;
    v9 = sub_245BD8984();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
    v10 = sub_245BD8BD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 1, 1, v10);
    sub_245BD8BB8();
    v11 = v7;
    v12 = a1;
    v13 = sub_245BD8BAC();
    v14 = (_QWORD *)swift_allocObject();
    v15 = MEMORY[0x24BEE6930];
    v14[2] = v13;
    v14[3] = v15;
    v14[4] = v12;
    v14[5] = v11;
    sub_245BBE86C((uint64_t)v5, (uint64_t)&unk_2575124A8, (uint64_t)v14);
    swift_release();

    __swift_instantiateConcreteTypeFromMangledName(&qword_2575124B0);
    v16 = swift_allocObject();
    *(_DWORD *)(v16 + 24) = 0;
    *(_QWORD *)(v16 + 16) = v12;
    *(_QWORD *)(v2 + 24) = v16;
    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495434B4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_245BBE6BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  sub_245BD8BB8();
  v5[4] = sub_245BD8BAC();
  sub_245BD8B88();
  return swift_task_switch();
}

uint64_t sub_245BBE728()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  swift_release();
  v2 = v1;
  sub_245BD6AA8(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BBE778()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_245BBE7AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_245BBE824;
  return sub_245BBE6BC(a1, v4, v5, v7, v6);
}

uint64_t sub_245BBE824()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_245BBE86C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_245BD8BD0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_245BD8BC4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_245BC4F10(a1, &qword_257512498);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245BD8B88();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t SecureCaptureSession.sessionContentsURL.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_245BBE9D0()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 24) + 16), sel_url);
  sub_245BD8978();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

id SecureCaptureSession.sessionPath.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t SecureCaptureSession.__sceneDelegate.getter()
{
  return swift_retain();
}

id SecureCaptureSession._sceneDelegate.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  id v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (os_unfair_lock_s *)(v1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  v3 = *(id *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  return v3;
}

id sub_245BBEA74@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  void *v2;

  v2 = *a1;
  *a2 = *a1;
  return v2;
}

id SecureCaptureSession.sceneDelegate.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  id v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = (os_unfair_lock_s *)(v1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  v3 = *(id *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  return v3;
}

void sub_245BBEAE0(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  os_unfair_lock_s *v3;
  void **v4;
  os_unfair_lock_s *v5;
  void *v6;

  v3 = *(os_unfair_lock_s **)(*(_QWORD *)a1 + 24);
  v4 = (void **)&v3[4];
  v5 = v3 + 6;
  os_unfair_lock_lock(v3 + 6);
  sub_245BBEA74(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

void (*SecureCaptureSession.sceneDelegate.modify(_QWORD *a1))(id *a1)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  id v5;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = (os_unfair_lock_s *)(v3 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));
  v5 = *(id *)(v3 + 16);
  os_unfair_lock_unlock(v4);
  *a1 = v5;
  return sub_245BBEBA8;
}

void sub_245BBEBA8(id *a1)
{

}

uint64_t SecureCaptureSession.urlsToOpen.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  char *v7;
  char *v8;
  uint64_t v10;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575124C0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v0 + 24);
  v6 = (os_unfair_lock_s *)(v5 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 24));
  v7 = (char *)*(id *)(v5 + 16);
  os_unfair_lock_unlock(v6);
  v8 = &v7[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v8, v1);

  sub_245BD8984();
  sub_245BC4504(&qword_2575124D0, &qword_2575124C0, MEMORY[0x24BEE6AA8]);
  return sub_245BD8E4C();
}

uint64_t sub_245BBECD4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_245BBECF0()
{
  uint64_t v0;

  sub_245BD8BB8();
  *(_QWORD *)(v0 + 32) = sub_245BD8BAC();
  sub_245BD8B88();
  return swift_task_switch();
}

uint64_t sub_245BBED58()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 24);
  swift_release();
  *(_QWORD *)(v0 + 40) = objc_msgSend(v1, sel_URL);
  return swift_task_switch();
}

uint64_t sub_245BBEDB0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);
  sub_245BD8978();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall SecureCaptureSession.openApplication(userActivity:)(NSUserActivity userActivity)
{
  uint64_t v1;
  void *v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;

  sub_245BBEED8(MEMORY[0x24BEE4AF8]);
  v3 = (void *)sub_245BD8AC8();
  swift_bridgeObjectRelease();
  v5[4] = sub_245BC2A5C;
  v6 = v1;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_245BBF518;
  v5[3] = &block_descriptor;
  v4 = _Block_copy(v5);
  swift_retain();
  swift_release();
  -[objc_class _createUserActivityDataWithOptions:completionHandler:](userActivity.super.isa, sel__createUserActivityDataWithOptions_completionHandler_, v3, v4);
  _Block_release(v4);

}

unint64_t sub_245BBEED8(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512A48);
  v2 = sub_245BD8E94();
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
    sub_245BC4E4C(v6, (uint64_t)v15, (uint64_t *)&unk_257512A50);
    result = sub_245BC2CD0((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_245BC4E90(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_245BBF018(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575129B8);
  v2 = (_QWORD *)sub_245BD8E94();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_245BC2DA0(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
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

uint64_t sub_245BBF128(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  result = MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3 && a2 >> 60 != 15)
  {
    v11 = sub_245BD8BD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
    sub_245BD8BB8();
    sub_245BC4C34(a1, a2);
    swift_retain();
    v12 = sub_245BD8BAC();
    v13 = (_QWORD *)swift_allocObject();
    v14 = MEMORY[0x24BEE6930];
    v13[2] = v12;
    v13[3] = v14;
    v13[4] = a4;
    v13[5] = a1;
    v13[6] = a2;
    sub_245BBE86C((uint64_t)v10, (uint64_t)&unk_257512A40, (uint64_t)v13);
    return swift_release();
  }
  return result;
}

uint64_t sub_245BBF238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[11] = a5;
  v6[12] = a6;
  v6[10] = a4;
  sub_245BD8BB8();
  v6[13] = sub_245BD8BAC();
  sub_245BD8B88();
  return swift_task_switch();
}

uint64_t sub_245BBF2A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  char *v4;
  void **v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t inited;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 80);
  swift_release();
  v2 = *(_QWORD *)(v1 + 24);
  v3 = (os_unfair_lock_s *)(v2 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  v4 = (char *)*(id *)(v2 + 16);
  os_unfair_lock_unlock(v3);
  v5 = (void **)&v4[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window];
  swift_beginAccess();
  v6 = *v5;
  v7 = v6;

  if (v6)
  {
    v8 = objc_msgSend(v7, sel_windowScene);

    if (v8)
    {
      v10 = *(_QWORD *)(v0 + 88);
      v9 = *(_QWORD *)(v0 + 96);
      v11 = objc_allocWithZone(MEMORY[0x24BDD1960]);
      sub_245BC4954(v10, v9);
      v12 = (void *)sub_245BD8990();
      v13 = objc_msgSend(v11, sel_initWithData_, v12);
      sub_245BC4C84(v10, v9);

      if (!v13)
      {
LABEL_9:

        return (*(uint64_t (**)(void))(v0 + 8))();
      }
      v14 = objc_msgSend(objc_allocWithZone((Class)SESecureCaptureOpenApplicationAction), sel_initWithUserActivity_responder_, v13, 0);
      v15 = objc_msgSend(v8, sel__FBSScene);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575129F0);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_245BD9960;
      *(_QWORD *)(inited + 32) = v14;
      v23 = inited;
      sub_245BD8B64();
      if (v23 >> 62)
      {
        v19 = v14;
        swift_bridgeObjectRetain();
        v20 = sub_245BD8E70();
        swift_bridgeObjectRelease();
        if (!v20)
          goto LABEL_8;
      }
      else
      {
        v17 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
        v18 = v14;
        if (!v17)
        {
LABEL_8:
          swift_bridgeObjectRelease();
          sub_245BC4B08(0, &qword_2575129F8);
          sub_245BC49B4();
          v21 = (void *)sub_245BD8BF4();
          swift_bridgeObjectRelease();
          objc_msgSend(v15, sel_sendActions_, v21);

          goto LABEL_9;
        }
      }
      sub_245BCB8A4(v23);
      goto LABEL_8;
    }
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BBF518(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void (*v5)(void *, unint64_t, void *);
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v4 = a2;
  v5 = *(void (**)(void *, unint64_t, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v6 = v4;
    v4 = (void *)sub_245BD899C();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  v9 = a3;
  v5(v4, v8, a3);

  sub_245BC4D68((uint64_t)v4, v8);
  return swift_release();
}

void sub_245BBF5AC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[6];

  v7 = *v3;
  sub_245BBEED8(MEMORY[0x24BEE4AF8]);
  v8 = (void *)sub_245BD8AC8();
  swift_bridgeObjectRelease();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = v3;
  v9[5] = v7;
  v11[4] = sub_245BC4C28;
  v11[5] = v9;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_245BBF518;
  v11[3] = &block_descriptor_51;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel__createUserActivityDataWithOptions_completionHandler_, v8, v10);
  _Block_release(v10);

}

void sub_245BBF6D0(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(void *, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  _BYTE *v21;
  uint64_t v22;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 || a2 >> 60 == 15)
  {
    sub_245BC4068();
    v20 = (void *)swift_allocError();
    *v21 = 0;
    a4(v20, 1);

  }
  else
  {
    v16 = sub_245BD8BD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
    sub_245BD8BB8();
    sub_245BC4C34(a1, a2);
    sub_245BC4C34(a1, a2);
    swift_retain();
    swift_retain();
    v17 = sub_245BD8BAC();
    v18 = (_QWORD *)swift_allocObject();
    v19 = MEMORY[0x24BEE6930];
    v18[2] = v17;
    v18[3] = v19;
    v18[4] = a6;
    v18[5] = a1;
    v18[6] = a2;
    v18[7] = a4;
    v18[8] = a5;
    v18[9] = a7;
    sub_245BBE86C((uint64_t)v15, (uint64_t)&unk_257512A30, (uint64_t)v18);
    sub_245BC4D68(a1, a2);
    swift_release();
  }
}

uint64_t sub_245BBF870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;

  v8[20] = a8;
  v8[21] = v10;
  v8[18] = a6;
  v8[19] = a7;
  v8[16] = a4;
  v8[17] = a5;
  sub_245BD8BB8();
  v8[22] = sub_245BD8BAC();
  sub_245BD8B88();
  return swift_task_switch();
}

uint64_t sub_245BBF8EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  char *v4;
  void **v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t inited;
  uint64_t v22;
  id v23;
  void (*v24)(void *, uint64_t);
  void *v25;
  _BYTE *v26;
  id v27;
  uint64_t v28;
  void *v29;
  unint64_t v31;

  v1 = *(_QWORD *)(v0 + 128);
  swift_release();
  v2 = *(_QWORD *)(v1 + 24);
  v3 = (os_unfair_lock_s *)(v2 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  v4 = (char *)*(id *)(v2 + 16);
  os_unfair_lock_unlock(v3);
  v5 = (void **)&v4[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window];
  swift_beginAccess();
  v6 = *v5;
  v7 = v6;

  if (v6)
  {
    v8 = objc_msgSend(v7, sel_windowScene);

    if (v8)
    {
      v10 = *(_QWORD *)(v0 + 136);
      v9 = *(_QWORD *)(v0 + 144);
      v11 = objc_allocWithZone(MEMORY[0x24BDD1960]);
      sub_245BC4954(v10, v9);
      v12 = (void *)sub_245BD8990();
      v13 = objc_msgSend(v11, sel_initWithData_, v12);
      sub_245BC4C84(v10, v9);

      if (v13)
      {
        v14 = *(_QWORD *)(v0 + 152);
        v15 = swift_allocObject();
        *(_QWORD *)(v15 + 16) = v14;
        *(_OWORD *)(v15 + 24) = *(_OWORD *)(v0 + 160);
        *(_QWORD *)(v0 + 48) = sub_245BC4D7C;
        *(_QWORD *)(v0 + 56) = v15;
        *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
        *(_QWORD *)(v0 + 24) = 1107296256;
        *(_QWORD *)(v0 + 32) = sub_245BC9B64;
        *(_QWORD *)(v0 + 40) = &block_descriptor_61;
        v16 = _Block_copy((const void *)(v0 + 16));
        v17 = (void *)objc_opt_self();
        swift_retain();
        v18 = objc_msgSend(v17, sel_responderWithHandler_, v16);
        _Block_release(v16);
        swift_release();
        v19 = objc_msgSend(objc_allocWithZone((Class)SESecureCaptureOpenApplicationAction), sel_initWithUserActivity_responder_, v13, v18);
        v20 = objc_msgSend(v8, sel__FBSScene);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2575129F0);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_245BD9960;
        *(_QWORD *)(inited + 32) = v19;
        v31 = inited;
        sub_245BD8B64();
        if (v31 >> 62)
        {
          v27 = v19;
          swift_bridgeObjectRetain();
          v28 = sub_245BD8E70();
          swift_bridgeObjectRelease();
          if (!v28)
            goto LABEL_10;
        }
        else
        {
          v22 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
          v23 = v19;
          if (!v22)
          {
LABEL_10:
            swift_bridgeObjectRelease();
            sub_245BC4B08(0, &qword_2575129F8);
            sub_245BC49B4();
            v29 = (void *)sub_245BD8BF4();
            swift_bridgeObjectRelease();
            objc_msgSend(v20, sel_sendActions_, v29);

            return (*(uint64_t (**)(void))(v0 + 8))();
          }
        }
        sub_245BCB8A4(v31);
        goto LABEL_10;
      }

    }
  }
  v24 = *(void (**)(void *, uint64_t))(v0 + 152);
  sub_245BC4068();
  v25 = (void *)swift_allocError();
  *v26 = 0;
  v24(v25, 1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_245BBFC5C(void *a1@<X0>, char *a2@<X8>)
{
  id v3;
  char v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  id v20;
  void *v21;
  id v22;

  v3 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575129E0);
  if (swift_dynamicCast())
  {
    v4 = (char)v22;
  }
  else
  {
    v5 = (void *)sub_245BD8948();
    v6 = objc_msgSend(v5, sel_underlyingErrors);
    v7 = sub_245BD8B58();

    v8 = *(_QWORD *)(v7 + 16);
    if (v8)
    {
      v21 = v5;
      swift_bridgeObjectRetain();
      v9 = 0;
      while (1)
      {
        v10 = *(void **)(v7 + 8 * v9 + 32);
        v11 = v10;
        v12 = (void *)sub_245BD8948();
        v13 = objc_msgSend(v12, sel_domain);

        v14 = sub_245BD8B04();
        v16 = v15;

        if (v14 == sub_245BD8B04() && v16 == v17)
          break;
        v19 = sub_245BD8EC4();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v19 & 1) != 0)
          goto LABEL_14;
        ++v9;

        if (v8 == v9)
        {

          swift_bridgeObjectRelease_n();
LABEL_19:
          v4 = 0;
          goto LABEL_20;
        }
      }
      swift_bridgeObjectRelease_n();
LABEL_14:
      swift_bridgeObjectRelease_n();
      sub_245BC4B08(0, &qword_257512A20);
      if ((swift_dynamicCast() & 1) == 0)
      {

        goto LABEL_19;
      }
      v20 = objc_msgSend(v22, sel_code);

      v4 = v20 == (id)4;
      if (v20 == (id)7)
        v4 = 2;
    }
    else
    {

      swift_bridgeObjectRelease();
      v4 = 0;
    }
  }
LABEL_20:
  *a2 = v4;
}

uint64_t sub_245BBFEB4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v17;

  v4 = v3;
  v8 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_245BD8BD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_245BD8BB8();
  swift_retain();
  swift_retain();
  v12 = a1;
  v13 = sub_245BD8BAC();
  v14 = (_QWORD *)swift_allocObject();
  v15 = MEMORY[0x24BEE6930];
  v14[2] = v13;
  v14[3] = v15;
  v14[4] = v4;
  v14[5] = a2;
  v14[6] = a3;
  v14[7] = v12;
  v14[8] = v8;
  sub_245BBE86C((uint64_t)v10, (uint64_t)&unk_257512A18, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_245BBFFCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[19] = a7;
  v8[20] = a8;
  v8[17] = a5;
  v8[18] = a6;
  v8[16] = a4;
  sub_245BD8BB8();
  v8[21] = sub_245BD8BAC();
  sub_245BD8B88();
  return swift_task_switch();
}

uint64_t sub_245BC0040()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  char *v4;
  void **v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t inited;
  uint64_t v20;
  id v21;
  void (*v22)(void *, uint64_t);
  void *v23;
  _BYTE *v24;
  id v25;
  uint64_t v26;
  void *v27;
  unint64_t v29;

  v1 = v0[16];
  swift_release();
  v2 = *(_QWORD *)(v1 + 24);
  v3 = (os_unfair_lock_s *)(v2 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  v4 = (char *)*(id *)(v2 + 16);
  os_unfair_lock_unlock(v3);
  v5 = (void **)&v4[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window];
  swift_beginAccess();
  v6 = *v5;
  v7 = v6;

  if (v6)
  {
    v8 = objc_msgSend(v7, sel_windowScene);

    if (v8)
    {
      v9 = v0[19];
      v10 = v0[20];
      v12 = v0[17];
      v11 = v0[18];
      v13 = (_QWORD *)swift_allocObject();
      v13[2] = v12;
      v13[3] = v11;
      v13[4] = v10;
      v0[6] = sub_245BC5094;
      v0[7] = v13;
      v0[2] = MEMORY[0x24BDAC760];
      v0[3] = 1107296256;
      v0[4] = sub_245BC9B64;
      v0[5] = &block_descriptor_42;
      v14 = _Block_copy(v0 + 2);
      v15 = (void *)objc_opt_self();
      swift_retain();
      v16 = objc_msgSend(v15, sel_responderWithHandler_, v14);
      _Block_release(v14);
      swift_release();
      v17 = objc_msgSend(objc_allocWithZone((Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction), sel_initWithUserActivity_responder_, v9, v16);
      v18 = objc_msgSend(v8, sel__FBSScene);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575129F0);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_245BD9960;
      *(_QWORD *)(inited + 32) = v17;
      v29 = inited;
      sub_245BD8B64();
      if (v29 >> 62)
      {
        v25 = v17;
        swift_bridgeObjectRetain();
        v26 = sub_245BD8E70();
        swift_bridgeObjectRelease();
        if (!v26)
          goto LABEL_8;
      }
      else
      {
        v20 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
        v21 = v17;
        if (!v20)
        {
LABEL_8:
          swift_bridgeObjectRelease();
          sub_245BC4B08(0, &qword_2575129F8);
          sub_245BC49B4();
          v27 = (void *)sub_245BD8BF4();
          swift_bridgeObjectRelease();
          objc_msgSend(v18, sel_sendActions_, v27);

          return ((uint64_t (*)(void))v0[1])();
        }
      }
      sub_245BCB8A4(v29);
      goto LABEL_8;
    }
  }
  v22 = (void (*)(void *, uint64_t))v0[17];
  sub_245BC4068();
  v23 = (void *)swift_allocError();
  *v24 = 0;
  v22(v23, 1);

  return ((uint64_t (*)(void))v0[1])();
}

void sub_245BC0344(void *a1, void (*a2)(void *, uint64_t))
{
  id v3;
  void *v4;
  char *v5;
  id v6;

  v3 = objc_msgSend(a1, sel_error);
  if (v3)
  {
    v6 = v3;
    sub_245BC4068();
    v4 = (void *)swift_allocError();
    sub_245BBFC5C(v6, v5);
    a2(v4, 1);

  }
  else
  {
    a2(0, 0);
  }
}

uint64_t SecureCaptureSession.openApplication(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_245BC0414()
{
  int8x16_t *v0;
  int8x16_t *v1;
  _QWORD *v2;

  v1 = (int8x16_t *)swift_task_alloc();
  v0[2].i64[0] = (uint64_t)v1;
  v1[1] = vextq_s8(v0[1], v0[1], 8uLL);
  v2 = (_QWORD *)swift_task_alloc();
  v0[2].i64[1] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_245BC04B0;
  return sub_245BD8ED0();
}

uint64_t sub_245BC04B0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245BC051C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BC0528()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SecureCaptureSession.openApplicationAfterTransitionCompletion(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = sub_245BD8BB8();
  v2[5] = sub_245BD8BAC();
  v2[6] = sub_245BD8B88();
  v2[7] = v3;
  return swift_task_switch();
}

uint64_t sub_245BC05CC()
{
  int8x16_t *v0;
  int8x16_t *v1;
  _QWORD *v2;
  int8x16_t v4;

  v4 = v0[1];
  v0[4].i64[0] = sub_245BD8BAC();
  v1 = (int8x16_t *)swift_task_alloc();
  v0[4].i64[1] = (uint64_t)v1;
  v1[1] = vextq_s8(v4, v4, 8uLL);
  v2 = (_QWORD *)swift_task_alloc();
  v0[5].i64[0] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_245BC068C;
  return sub_245BD8ED0();
}

uint64_t sub_245BC068C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_245BC0700()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BC0734()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BC077C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512A08);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v14 + v13, (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  a6(a3, a5, v14);
  return swift_release();
}

uint64_t sub_245BC0870(void *a1, char a2)
{
  id v3;

  if ((a2 & 1) != 0)
  {
    v3 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257512A08);
    return sub_245BD8B94();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257512A08);
    return sub_245BD8BA0();
  }
}

uint64_t SecureCaptureSession.openApplication(url:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v2 = v1;
  v4 = sub_245BD8984();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_245BD8BD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_245BD8BB8();
  swift_retain();
  v11 = sub_245BD8BAC();
  v12 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = (char *)swift_allocObject();
  v14 = MEMORY[0x24BEE6930];
  *((_QWORD *)v13 + 2) = v11;
  *((_QWORD *)v13 + 3) = v14;
  *((_QWORD *)v13 + 4) = v2;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v13[v12], v7, v4);
  sub_245BBE86C((uint64_t)v9, (uint64_t)&unk_2575124F0, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_245BC0A30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[10] = a4;
  v5[11] = a5;
  sub_245BD8BB8();
  v5[12] = sub_245BD8BAC();
  sub_245BD8B88();
  return swift_task_switch();
}

uint64_t sub_245BC0A9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  char *v4;
  void **v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t inited;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  unint64_t v20;

  v1 = *(_QWORD *)(v0 + 80);
  swift_release();
  v2 = *(_QWORD *)(v1 + 24);
  v3 = (os_unfair_lock_s *)(v2 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  v4 = (char *)*(id *)(v2 + 16);
  os_unfair_lock_unlock(v3);
  v5 = (void **)&v4[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window];
  swift_beginAccess();
  v6 = *v5;
  v7 = v6;

  if (v6)
  {
    v8 = objc_msgSend(v7, sel_windowScene);

    if (v8)
    {
      v9 = objc_allocWithZone((Class)SESecureCaptureOpenApplicationAction);
      v10 = (void *)sub_245BD8954();
      v11 = objc_msgSend(v9, sel_initWithURL_responder_, v10, 0);

      v12 = objc_msgSend(v8, sel__FBSScene);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575129F0);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_245BD9960;
      *(_QWORD *)(inited + 32) = v11;
      v20 = inited;
      sub_245BD8B64();
      if (v20 >> 62)
      {
        v16 = v11;
        swift_bridgeObjectRetain();
        v17 = sub_245BD8E70();
        swift_bridgeObjectRelease();
        if (!v17)
          goto LABEL_7;
      }
      else
      {
        v14 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
        v15 = v11;
        if (!v14)
        {
LABEL_7:
          swift_bridgeObjectRelease();
          sub_245BC4B08(0, &qword_2575129F8);
          sub_245BC49B4();
          v18 = (void *)sub_245BD8BF4();
          swift_bridgeObjectRelease();
          objc_msgSend(v12, sel_sendActions_, v18);

          return (*(uint64_t (**)(void))(v0 + 8))();
        }
      }
      sub_245BCB8A4(v20);
      goto LABEL_7;
    }
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SecureCaptureSession.sessionContentsPath.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_245BC4E4C(v1 + OBJC_IVAR____TtC16SecureCaptureKit20SecureCaptureSession_sessionContentsPath, a1, &qword_257512EB0);
}

void SecureCaptureSession.__allocating_init(delegate:)()
{
  if (!objc_msgSend((id)objc_opt_self(), sel_temporarySessionPathWithType_, 1))
    __break(1u);
  sub_245BD8E64();
  __break(1u);
}

void SecureCaptureSession.init(delegate:)()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend((id)objc_opt_self(), sel_temporarySessionPathWithType_, 1);
  if (!v1)
    __break(1u);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = v0 + OBJC_IVAR____TtC16SecureCaptureKit20SecureCaptureSession_sessionContentsPath;
  v3 = sub_245BD8984();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  sub_245BD8E64();
  __break(1u);
}

Swift::Void __swiftcall SecureCaptureSession.authenticate(with:)(NSUserActivity with)
{
  sub_245BC0E50(with.super.isa, (uint64_t)sub_245BC2A5C, (uint64_t)&block_descriptor_13);
}

Swift::Void __swiftcall SecureCaptureSession.authenticate(userActivity:)(NSUserActivity userActivity)
{
  sub_245BC0E50(userActivity.super.isa, (uint64_t)sub_245BC2A5C, (uint64_t)&block_descriptor_17);
}

void sub_245BC0E50(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;

  sub_245BBEED8(MEMORY[0x24BEE4AF8]);
  v7 = (void *)sub_245BD8AC8();
  swift_bridgeObjectRelease();
  v9[4] = a2;
  v10 = v3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_245BBF518;
  v9[3] = a3;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel__createUserActivityDataWithOptions_completionHandler_, v7, v8);
  _Block_release(v8);

}

uint64_t SecureCaptureSession.authenticate(url:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v2 = v1;
  v4 = sub_245BD8984();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_245BD8BD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_245BD8BB8();
  swift_retain();
  v11 = sub_245BD8BAC();
  v12 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v13 = (char *)swift_allocObject();
  v14 = MEMORY[0x24BEE6930];
  *((_QWORD *)v13 + 2) = v11;
  *((_QWORD *)v13 + 3) = v14;
  *((_QWORD *)v13 + 4) = v2;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v13[v12], v7, v4);
  sub_245BBE86C((uint64_t)v9, (uint64_t)&unk_257512500, (uint64_t)v13);
  return swift_release();
}

unint64_t static SecureCaptureSession.ApplicationLaunchError.errorDomain.getter()
{
  return 0xD000000000000033;
}

uint64_t SecureCaptureSession.ApplicationLaunchError.errorCode.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t SecureCaptureSession.ApplicationLaunchError.failureReason.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD00000000000002ELL;
  if (*v0 != 1)
    v1 = 0xD000000000000063;
  if (*v0)
    return v1;
  else
    return 0xD000000000000023;
}

BOOL static SecureCaptureSession.ApplicationLaunchError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SecureCaptureSession.ApplicationLaunchError.hash(into:)()
{
  return sub_245BD8F6C();
}

uint64_t SecureCaptureSession.ApplicationLaunchError.hashValue.getter()
{
  sub_245BD8F60();
  sub_245BD8F6C();
  return sub_245BD8F84();
}

BOOL sub_245BC1198(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_245BC11AC()
{
  sub_245BD8F60();
  sub_245BD8F6C();
  return sub_245BD8F84();
}

uint64_t sub_245BC11F0()
{
  return sub_245BD8F6C();
}

uint64_t sub_245BC1218()
{
  sub_245BD8F60();
  sub_245BD8F6C();
  return sub_245BD8F84();
}

unint64_t sub_245BC1258()
{
  return 0xD000000000000033;
}

uint64_t sub_245BC1274()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_245BC1290()
{
  sub_245BC456C();
  return sub_245BD8F0C();
}

uint64_t sub_245BC12B8()
{
  sub_245BC456C();
  return sub_245BD8F00();
}

uint64_t SecureCaptureSession.deinit()
{
  uint64_t v0;

  swift_release();
  sub_245BC4F10(v0 + OBJC_IVAR____TtC16SecureCaptureKit20SecureCaptureSession_sessionContentsPath, &qword_257512EB0);
  return v0;
}

uint64_t SecureCaptureSession.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  sub_245BC4F10(v0 + OBJC_IVAR____TtC16SecureCaptureKit20SecureCaptureSession_sessionContentsPath, &qword_257512EB0);
  return swift_deallocClassInstance();
}

uint64_t sub_245BC136C(uint64_t a1)
{
  return sub_245BC1380(a1, (void (*)(void))type metadata accessor for SharedSecureCaptureSessionStorageActor, &qword_257512460);
}

uint64_t sub_245BC1380(uint64_t a1, void (*a2)(void), uint64_t *a3)
{
  uint64_t v4;
  uint64_t result;

  a2();
  v4 = swift_allocObject();
  result = swift_defaultActor_initialize();
  *a3 = v4;
  return result;
}

uint64_t static SharedSecureCaptureSessionStorageActor.shared.getter()
{
  return sub_245BC13D4(&qword_257512458);
}

uint64_t sub_245BC13D4(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_245BC140C(uint64_t a1, uint64_t a2)
{
  return sub_245BC1428(a1, a2, &qword_257512458);
}

uint64_t sub_245BC1428(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (*a3 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_245BC1464()
{
  type metadata accessor for SharedSecureCaptureSessionStorageActor();
  return sub_245BD8DD4();
}

uint64_t sub_245BC1488()
{
  uint64_t result;

  type metadata accessor for SecureCaptureSessionStorage(0);
  swift_allocObject();
  result = SecureCaptureSessionStorage.init()();
  if (result)
    qword_257512470 = result;
  else
    __break(1u);
  return result;
}

uint64_t SecureCaptureSessionStorage.__allocating_init()()
{
  swift_allocObject();
  return SecureCaptureSessionStorage.init()();
}

uint64_t static SecureCaptureSessionStorage.shared.getter()
{
  return sub_245BC13D4(&qword_257512468);
}

uint64_t (*sub_245BC1518())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_245BC1554@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  sub_245BD89D8();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t sub_245BC15FC()
{
  swift_getKeyPath();
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  swift_bridgeObjectRetain();
  sub_245BD89CC();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245BC16B8()
{
  swift_getKeyPath();
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  sub_245BD89D8();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_245BC1758()
{
  swift_getKeyPath();
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  sub_245BD89CC();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245BC1808(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 16) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_245BC186C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16SecureCaptureKit27SecureCaptureSessionStorage___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  sub_245BD89D8();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_245BD89F0();
  swift_release();
  v4[7] = sub_245BC1518();
  return sub_245BC1958;
}

void sub_245BC1958(_QWORD *a1)
{
  sub_245BC28E0(a1);
}

uint64_t sub_245BC1964()
{
  swift_getKeyPath();
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  sub_245BD89D8();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_245BC1A04@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  sub_245BD89D8();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t sub_245BC1AAC()
{
  swift_getKeyPath();
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  swift_bridgeObjectRetain();
  sub_245BD89CC();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245BC1B68(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 24) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t SecureCaptureSessionStorage.init()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v1 = v0;
  v20 = sub_245BD8984();
  v2 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[4] = 0;
  sub_245BD89FC();
  v5 = objc_msgSend((id)objc_opt_self(), sel_finalizedSessionPathsWithType_, 1);
  sub_245BC4B08(0, (unint64_t *)&qword_257512F20);
  v6 = sub_245BD8B58();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_245BD8E70();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v8 = MEMORY[0x24BEE4AF8];
  if (v7)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_245BC3CA4(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
    {
      __break(1u);
      result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    v19 = v0;
    v9 = 0;
    v8 = v21;
    do
    {
      if ((v6 & 0xC000000000000001) != 0)
        v10 = (id)MEMORY[0x249542EE4](v9, v6);
      else
        v10 = *(id *)(v6 + 8 * v9 + 32);
      v11 = v10;
      v12 = objc_msgSend(v10, sel_url, v19);
      sub_245BD8978();

      v21 = v8;
      v14 = *(_QWORD *)(v8 + 16);
      v13 = *(_QWORD *)(v8 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_245BC3CA4(v13 > 1, v14 + 1, 1);
        v8 = v21;
      }
      ++v9;
      *(_QWORD *)(v8 + 16) = v14 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v8+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72) * v14, v4, v20);
    }
    while (v7 != v9);
    v1 = v19;
  }
  v1[2] = v8;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  v1[4] = v8;
  if (v7 >= *(_QWORD *)(v8 + 16))
    v15 = *(_QWORD *)(v8 + 16);
  else
    v15 = v7;
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257512520);
    v16 = sub_245BD8E94();
  }
  else
  {
    v16 = MEMORY[0x24BEE4B00];
  }
  v21 = v16;
  swift_bridgeObjectRetain();
  v17 = swift_bridgeObjectRetain();
  sub_245BC3188(v17, v6, 1, &v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[3] = v21;
  return (uint64_t)v1;
}

uint64_t sub_245BC1EA8()
{
  swift_getKeyPath();
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  sub_245BD89CC();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_245BC1F58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  id v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  v23 = sub_245BD8984();
  v4 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v26 = v1;
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  sub_245BD89D8();
  swift_release();
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v1 + 16) + 16))
  {
    swift_getKeyPath();
    v25 = v1;
    sub_245BD89D8();
    swift_release();
    v7 = *(_QWORD *)(v1 + 16);
    swift_bridgeObjectRetain();
    v22 = sub_245BC2334(a1, v7);
    v9 = v8;
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    v25 = v2;
    sub_245BD89D8();
    swift_release();
    swift_beginAccess();
    v10 = *(_QWORD *)(v2 + 24);
    if (*(_QWORD *)(v10 + 16))
    {
      swift_bridgeObjectRetain();
      v11 = sub_245BC2D00(a1);
      if ((v12 & 1) != 0)
      {
        v21 = v6;
        v13 = *(id *)(*(_QWORD *)(v10 + 56) + 8 * v11);
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0 || (v14 = v13, (objc_msgSend(v13, sel_isTemporaryPath) & 1) != 0))
        {

        }
        else
        {
          objc_msgSend(v13, sel_invalidate);
          v15 = (uint64_t)v21;
          (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v21, a1, v23);
          swift_getKeyPath();
          v24 = v2;
          v20 = v14;
          sub_245BD89D8();
          swift_release();
          v24 = v2;
          swift_getKeyPath();
          sub_245BD89F0();
          swift_release();
          swift_beginAccess();
          v16 = (void *)sub_245BC3EB8(v15);
          v17 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
          v18 = v23;
          v17(v15, v23);
          swift_endAccess();

          v24 = v2;
          swift_getKeyPath();
          sub_245BD89E4();
          swift_release();
          swift_getKeyPath();
          v24 = v2;
          sub_245BD89D8();
          swift_release();
          v24 = v2;
          swift_getKeyPath();
          sub_245BD89F0();
          swift_release();
          swift_beginAccess();
          sub_245BC2404(v22, v15);
          v17(v15, v18);
          swift_endAccess();
          v24 = v2;
          swift_getKeyPath();
          sub_245BD89E4();

          swift_release();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
}

uint64_t sub_245BC2334(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v4 = *(_QWORD *)(sub_245BD8984() - 8);
  v5 = a2 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v6 = *(_QWORD *)(v4 + 72);
  sub_245BC3FBC(&qword_2575129D0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
  v7 = 0;
  while ((sub_245BD8AEC() & 1) == 0)
  {
    ++v7;
    v5 += v6;
    if (v2 == v7)
      return 0;
  }
  return v7;
}

uint64_t sub_245BC2404@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t *v2;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_245BC8BFC(v5);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  v7 = v6 - 1;
  v8 = sub_245BD8984();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 72);
  v11 = v5 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)) + v10 * a1;
  result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v9 + 32))(a2, v11, v8);
  if ((uint64_t)(v7 - a1) < 0)
  {
LABEL_15:
    result = sub_245BD8EA0();
    __break(1u);
    return result;
  }
  if (v10 > 0 || v11 >= v11 + v10 + v10 * (v7 - a1))
  {
    result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v10)
  {
    result = swift_arrayInitWithTakeBackToFront();
  }
  *(_QWORD *)(v5 + 16) = v7;
  *v2 = v5;
  return result;
}

uint64_t (*sub_245BC2540())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_245BC2580@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  sub_245BD89D8();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_245BC2628()
{
  swift_getKeyPath();
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  swift_bridgeObjectRetain();
  sub_245BD89CC();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245BC26E4()
{
  swift_getKeyPath();
  sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  sub_245BD89D8();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_245BC2784(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 32) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_245BC27E8(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC16SecureCaptureKit27SecureCaptureSessionStorage___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_245BC3FBC((unint64_t *)&unk_257512510, 255, type metadata accessor for SecureCaptureSessionStorage, (uint64_t)&protocol conformance descriptor for SecureCaptureSessionStorage);
  sub_245BD89D8();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_245BD89F0();
  swift_release();
  v4[7] = sub_245BC2540();
  return sub_245BC28D4;
}

void sub_245BC28D4(_QWORD *a1)
{
  sub_245BC28E0(a1);
}

void sub_245BC28E0(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  *v1 = v1[4];
  swift_getKeyPath();
  sub_245BD89E4();
  swift_release();
  free(v1);
}

uint64_t SecureCaptureSessionStorage.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16SecureCaptureKit27SecureCaptureSessionStorage___observationRegistrar;
  v2 = sub_245BD8A08();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SecureCaptureSessionStorage.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC16SecureCaptureKit27SecureCaptureSessionStorage___observationRegistrar;
  v2 = sub_245BD8A08();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495434C0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_245BC2A5C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_245BBF128(a1, a2, a3, v3);
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

uint64_t sub_245BC2A7C(uint64_t a1)
{
  uint64_t v1;

  return sub_245BC077C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)&unk_2516D8820, (uint64_t)sub_245BC4A10, (void (*)(uint64_t, uint64_t, uint64_t))sub_245BBF5AC);
}

uint64_t sub_245BC2AAC(uint64_t a1)
{
  uint64_t v1;

  return sub_245BC077C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)&unk_2516D8780, (uint64_t)sub_245BC4A10, (void (*)(uint64_t, uint64_t, uint64_t))sub_245BBFEB4);
}

uint64_t sub_245BC2AE0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_245BD8984() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_245BC5098;
  return sub_245BC0A30(a1, v5, v6, v7, v8);
}

uint64_t objectdestroy_7Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_245BD8984();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t type metadata accessor for SecureCaptureSessionStorage(uint64_t a1)
{
  return sub_245BC4120(a1, qword_257512780);
}

uint64_t sub_245BC2C08()
{
  uint64_t v0;

  return sub_245BC1808(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_245BC2C20(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_245BC2C28@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_245BC2C3C(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_245BC2C6C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_245BC2C80(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_245BC2C94@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_245BC2CA4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_245BC2CB0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_245BC2CC4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unint64_t sub_245BC2CD0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245BD8DBC();
  return sub_245BC2E04(a1, v2);
}

unint64_t sub_245BC2D00(uint64_t a1)
{
  uint64_t v2;

  sub_245BD8984();
  sub_245BC3FBC(&qword_2575129C8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  v2 = sub_245BD8AD4();
  return sub_245BC2EC8(a1, v2);
}

unint64_t sub_245BC2D70(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245BD8F54();
  return sub_245BC300C(a1, v2);
}

unint64_t sub_245BC2DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_245BD8F60();
  sub_245BD8B1C();
  v4 = sub_245BD8F84();
  return sub_245BC30A8(a1, a2, v4);
}

unint64_t sub_245BC2E04(uint64_t a1, uint64_t a2)
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
      sub_245BC4EA0(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x249542E84](v9, a1);
      sub_245BC4EDC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_245BC2EC8(uint64_t a1, uint64_t a2)
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
  v5 = sub_245BD8984();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
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
      sub_245BC3FBC(&qword_2575129D0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
      v14 = sub_245BD8AEC();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_245BC300C(uint64_t a1, uint64_t a2)
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
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_245BC30A8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_245BD8EC4() & 1) == 0)
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
      while (!v14 && (sub_245BD8EC4() & 1) == 0);
    }
  }
  return v6;
}

void sub_245BC3188(uint64_t a1, uint64_t a2, int a3, _QWORD *a4)
{
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
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  void (*v20)(char *, char *, uint64_t);
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  _QWORD v46[2];
  void (*v47)(char *, uint64_t, uint64_t, uint64_t);
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  char *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  id v62;

  v58 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512EB0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_245BD8984();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v59 = (uint64_t)v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v57 = (char *)v46 - v13;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575129D8);
  MEMORY[0x24BDAC7A8](v54);
  v53 = (char *)v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v52 = v15;
  if (!v15)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
LABEL_30:
    sub_245BC4F10((uint64_t)v8, &qword_257512EB0);
LABEL_31:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    return;
  }
  v16 = 0;
  v17 = a2 & 0xFFFFFFFFFFFFFF8;
  v56 = a2 & 0xFFFFFFFFFFFFFF8;
  if (a2 < 0)
    v17 = a2;
  v46[1] = v17;
  v50 = a1;
  v51 = a2 & 0xC000000000000001;
  v48 = v8;
  v49 = a2;
  while (1)
  {
    if (v16 >= *(_QWORD *)(a1 + 16))
    {
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      sub_245BD8EF4();
      __break(1u);
      goto LABEL_38;
    }
    v18 = *(_QWORD *)(v10 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, a1 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)) + v18 * v16, v9);
    v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v19(v8, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
      goto LABEL_30;
    v55 = a3;
    v20 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v20(v57, v8, v9);
    if ((unint64_t)a2 >> 62)
    {
      swift_bridgeObjectRetain();
      v43 = sub_245BD8E70();
      swift_bridgeObjectRelease();
      if (v16 == v43)
      {
LABEL_29:
        (*(void (**)(char *, uint64_t))(v10 + 8))(v57, v9);
        goto LABEL_31;
      }
    }
    else if (v16 == *(_QWORD *)(v56 + 16))
    {
      goto LABEL_29;
    }
    v47 = v19;
    if (v51)
    {
      v21 = (id)MEMORY[0x249542EE4](v16, a2);
    }
    else
    {
      if (v16 >= *(_QWORD *)(v56 + 16))
        goto LABEL_35;
      v21 = *(id *)(a2 + 8 * v16 + 32);
    }
    v22 = v21;
    v23 = v53;
    v24 = *(int *)(v54 + 48);
    v20(v53, v57, v9);
    v25 = v9;
    v26 = v22;
    *(_QWORD *)&v23[v24] = v22;
    v27 = v59;
    v28 = v25;
    ((void (*)(uint64_t, char *))v20)(v59, v23);
    v29 = (_QWORD *)*v58;
    v31 = sub_245BC2D00(v27);
    v32 = v29[2];
    v33 = (v30 & 1) == 0;
    v34 = v32 + v33;
    if (__OFADD__(v32, v33))
      goto LABEL_34;
    v35 = v30;
    if (v29[3] < v34)
      break;
    if ((v55 & 1) != 0)
    {
      if ((v30 & 1) != 0)
        goto LABEL_26;
    }
    else
    {
      sub_245BC36E4();
      if ((v35 & 1) != 0)
        goto LABEL_26;
    }
LABEL_19:
    v38 = v59;
    v39 = (_QWORD *)*v58;
    *(_QWORD *)(*v58 + 8 * (v31 >> 6) + 64) |= 1 << v31;
    v20((char *)(v39[6] + v31 * v18), (char *)v38, v28);
    *(_QWORD *)(v39[7] + 8 * v31) = v26;
    v40 = v39[2];
    v41 = __OFADD__(v40, 1);
    v42 = v40 + 1;
    if (v41)
      goto LABEL_36;
    ++v16;
    v39[2] = v42;
    a3 = 1;
    a2 = v49;
    a1 = v50;
    v8 = v48;
    v9 = v28;
    if (v52 == v16)
    {
      v47(v48, 1, 1, v28);
      goto LABEL_30;
    }
  }
  sub_245BC390C(v34, v55 & 1);
  v36 = sub_245BC2D00(v59);
  if ((v35 & 1) != (v37 & 1))
    goto LABEL_37;
  v31 = v36;
  if ((v35 & 1) == 0)
    goto LABEL_19;
LABEL_26:
  v44 = (void *)swift_allocError();
  swift_willThrow();
  v62 = v44;
  v45 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575129E0);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v59, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_38:
  v60 = 0;
  v61 = 0xE000000000000000;
  sub_245BD8E10();
  sub_245BD8B28();
  sub_245BD8E40();
  sub_245BD8B28();
  sub_245BD8E64();
  __break(1u);
}

id sub_245BC36E4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_245BD8984();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512520);
  v24 = v0;
  v5 = *v0;
  v6 = sub_245BD8E7C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v24 = v7;
    return result;
  }
  result = (id)(v6 + 64);
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
  v25 = v5 + 64;
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
    v19 = *(void **)(*(_QWORD *)(v5 + 56) + v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = v19;
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

uint64_t sub_245BC390C(uint64_t a1, int a2)
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
  id v28;
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
  v5 = sub_245BD8984();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512520);
  v42 = a2;
  v10 = sub_245BD8E88();
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
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    sub_245BC3FBC(&qword_2575129C8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    result = sub_245BD8AD4();
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

uint64_t sub_245BC3CA4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_245BC3CD8(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_245BC3CC0()
{
  uint64_t v0;

  return sub_245BC2784(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_245BC3CD8(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575129E8);
  v10 = *(_QWORD *)(sub_245BD8984() - 8);
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
  v16 = *(_QWORD *)(sub_245BD8984() - 8);
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
  result = sub_245BD8EA0();
  __break(1u);
  return result;
}

uint64_t sub_245BC3EB8(uint64_t a1)
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
  v4 = sub_245BC2D00(a1);
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
    sub_245BC36E4();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = sub_245BD8984();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_245BC45B0(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_245BC3F90(uint64_t a1, uint64_t a2)
{
  return sub_245BC3FBC(&qword_257512528, a2, (uint64_t (*)(uint64_t))type metadata accessor for SharedSecureCaptureSessionActor, (uint64_t)&protocol conformance descriptor for SharedSecureCaptureSessionActor);
}

uint64_t sub_245BC3FBC(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x2495434CC](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for SharedSecureCaptureSessionActor()
{
  return objc_opt_self();
}

unint64_t sub_245BC4020()
{
  unint64_t result;

  result = qword_257512530;
  if (!qword_257512530)
  {
    result = MEMORY[0x2495434CC](&protocol conformance descriptor for SecureCaptureSession.ApplicationLaunchError, &type metadata for SecureCaptureSession.ApplicationLaunchError);
    atomic_store(result, (unint64_t *)&qword_257512530);
  }
  return result;
}

unint64_t sub_245BC4068()
{
  unint64_t result;

  result = qword_257512538;
  if (!qword_257512538)
  {
    result = MEMORY[0x2495434CC](&protocol conformance descriptor for SecureCaptureSession.ApplicationLaunchError, &type metadata for SecureCaptureSession.ApplicationLaunchError);
    atomic_store(result, (unint64_t *)&qword_257512538);
  }
  return result;
}

uint64_t sub_245BC40AC(uint64_t a1, uint64_t a2)
{
  return sub_245BC3FBC(&qword_257512540, a2, (uint64_t (*)(uint64_t))type metadata accessor for SharedSecureCaptureSessionStorageActor, (uint64_t)&protocol conformance descriptor for SharedSecureCaptureSessionStorageActor);
}

uint64_t type metadata accessor for SharedSecureCaptureSessionStorageActor()
{
  return objc_opt_self();
}

uint64_t method lookup function for SharedSecureCaptureSessionActor()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_245BC4104()
{
  return type metadata accessor for SecureCaptureSession(0);
}

uint64_t type metadata accessor for SecureCaptureSession(uint64_t a1)
{
  return sub_245BC4120(a1, (uint64_t *)&unk_257512610);
}

uint64_t sub_245BC4120(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_245BC4154()
{
  unint64_t v0;

  sub_245BC41F8();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for SecureCaptureSession()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SecureCaptureSession.__allocating_init(sceneDelegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of SecureCaptureSession.__allocating_init(delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_245BC41F8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257512620)
  {
    sub_245BD8984();
    v0 = sub_245BD8D2C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257512620);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SecureCaptureSession.ApplicationLaunchError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SecureCaptureSession.ApplicationLaunchError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245BC4338 + 4 * byte_245BD9975[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_245BC436C + 4 * byte_245BD9970[v4]))();
}

uint64_t sub_245BC436C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245BC4374(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245BC437CLL);
  return result;
}

uint64_t sub_245BC4388(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245BC4390);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_245BC4394(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245BC439C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245BC43A8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245BC43B0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SecureCaptureSession.ApplicationLaunchError()
{
  return &type metadata for SecureCaptureSession.ApplicationLaunchError;
}

uint64_t method lookup function for SharedSecureCaptureSessionStorageActor()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_245BC43D4()
{
  return type metadata accessor for SecureCaptureSessionStorage(0);
}

uint64_t sub_245BC43DC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245BD8A08();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SecureCaptureSessionStorage()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionContentURLs.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionContentURLs.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionContentURLs.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.invalidate(url:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionPaths.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionPaths.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.sessionPaths.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of SecureCaptureSessionStorage.invalidate(forPath:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t sub_245BC44D8()
{
  return sub_245BC4504(&qword_2575128D0, &qword_2575128D8, MEMORY[0x24BEE6F08]);
}

uint64_t sub_245BC4504(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495434CC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for FBSceneContentState(uint64_t a1)
{
  sub_245BC5048(a1, &qword_2575129A0);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_245BC5048(a1, &qword_2575129A8);
}

unint64_t sub_245BC456C()
{
  unint64_t result;

  result = qword_2575129B0;
  if (!qword_2575129B0)
  {
    result = MEMORY[0x2495434CC](&protocol conformance descriptor for SecureCaptureSession.ApplicationLaunchError, &type metadata for SecureCaptureSession.ApplicationLaunchError);
    atomic_store(result, (unint64_t *)&qword_2575129B0);
  }
  return result;
}

unint64_t sub_245BC45B0(int64_t a1, uint64_t a2)
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

  v4 = sub_245BD8984();
  v35 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_245BD8D74();
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
        sub_245BC3FBC(&qword_2575129C8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
        v18 = sub_245BD8AD4();
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

unint64_t sub_245BC4854(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t result;
  char v8;
  unint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  char v14;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575129C0);
  v3 = (_QWORD *)sub_245BD8E94();
  v5 = a1[4];
  v4 = a1[5];
  v6 = a1[6];
  result = sub_245BC2D70(v5);
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x24BEE4B00];
  }
  v9 = a1 + 9;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v5;
    v10 = (uint64_t *)(v3[7] + 16 * result);
    *v10 = v4;
    v10[1] = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    sub_245BC4954(v4, v6);
    if (!--v1)
      return (unint64_t)v3;
    v5 = *(v9 - 2);
    v4 = *(v9 - 1);
    v6 = *v9;
    result = sub_245BC2D70(v5);
    v9 += 3;
    if ((v14 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_245BC4954(uint64_t a1, unint64_t a2)
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

uint64_t sub_245BC4998()
{
  uint64_t v0;

  return sub_245BC1B68(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_245BC49B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257512A00;
  if (!qword_257512A00)
  {
    v1 = sub_245BC4B08(255, &qword_2575129F8);
    result = MEMORY[0x2495434CC](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_257512A00);
  }
  return result;
}

uint64_t sub_245BC4A14()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_245BC4A50(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_245BC5098;
  return sub_245BBFFCC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_245BC4AE4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245BC4B08(uint64_t a1, unint64_t *a2)
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

uint64_t objectdestroy_31Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512A08);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_245BC4BA8(void *a1, char a2)
{
  char v3;

  v3 = a2 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512A08);
  return sub_245BC0870(a1, v3);
}

uint64_t sub_245BC4BFC()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_245BC4C28(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_245BBF6D0(a1, a2, a3, *(void (**)(void *, uint64_t))(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40));
}

uint64_t sub_245BC4C34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_245BC4954(a1, a2);
  return a1;
}

uint64_t sub_245BC4C48()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  sub_245BC4C84(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245BC4C84(uint64_t a1, unint64_t a2)
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

uint64_t sub_245BC4CC8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_245BC5098;
  return sub_245BBF870(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_245BC4D68(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_245BC4C84(a1, a2);
  return a1;
}

void sub_245BC4D7C(void *a1)
{
  uint64_t v1;

  sub_245BC0344(a1, *(void (**)(void *, uint64_t))(v1 + 16));
}

uint64_t sub_245BC4D98()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  sub_245BC4C84(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_245BC4DCC(uint64_t a1)
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
  v9[1] = sub_245BC5098;
  return sub_245BBF238(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_245BC4E4C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_245BC4E90(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_245BC4EA0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_245BC4EDC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_245BC4F10(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_245BC4F4C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245BC4F70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245BBE824;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257512FA8 + dword_257512FA8))(a1, v4);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_245BC4FEC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_245BC500C(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_245BC5048(a1, (unint64_t *)&unk_257512A60);
}

void sub_245BC5048(uint64_t a1, unint64_t *a2)
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

uint64_t sub_245BC50CC()
{
  return sub_245BC3CC0();
}

uint64_t sub_245BC50E0()
{
  return sub_245BC2C08();
}

uint64_t sub_245BC50FC(void (*a1)(_QWORD), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**v17)(unint64_t, char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
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
  void (*v45)(_QWORD);
  uint64_t v46;
  void (*v47)(_QWORD *, _QWORD);
  void (*v48)(_QWORD);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (**v58)(uint64_t, char *, uint64_t);
  char *v59;
  uint64_t v60;
  uint64_t result;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(_QWORD);
  char *v65;
  void (**v66)(char *, uint64_t, uint64_t);
  void (*v67)(char *, char *, uint64_t);
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[7];

  v74 = a2;
  v64 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512F08);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v63 - v6;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512F10);
  v8 = MEMORY[0x24BDAC7A8](v75);
  v66 = (void (**)(char *, uint64_t, uint64_t))((char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v63 - v10;
  v63 = type metadata accessor for SecureCaptureManager.URLUpdate();
  MEMORY[0x24BDAC7A8](v63);
  v73 = (uint64_t *)((char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512F18);
  v79 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v69 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v65 = (char *)&v63 - v16;
  v78 = sub_245BD8984();
  v17 = *(void (***)(unint64_t, char *, uint64_t))(v78 - 8);
  v18 = MEMORY[0x24BDAC7A8](v78);
  v68 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v63 - v20;
  v22 = objc_msgSend((id)objc_opt_self(), sel_finalizedSessionPathsWithType_, 1);
  sub_245BC4B08(0, (unint64_t *)&qword_257512F20);
  v23 = sub_245BD8B58();

  v71 = v5;
  v72 = v2;
  v70 = v7;
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    v24 = sub_245BD8E70();
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v25 = MEMORY[0x24BEE4AF8];
  v26 = v79;
  v77 = v11;
  if (v24)
  {
    v80[0] = MEMORY[0x24BEE4AF8];
    sub_245BC3CA4(0, v24 & ~(v24 >> 63), 0);
    if (v24 < 0)
    {
      __break(1u);
      result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    v67 = (void (*)(char *, char *, uint64_t))v13;
    v27 = 0;
    v25 = v80[0];
    do
    {
      if ((v23 & 0xC000000000000001) != 0)
        v28 = (id)MEMORY[0x249542EE4](v27, v23);
      else
        v28 = *(id *)(v23 + 8 * v27 + 32);
      v29 = v28;
      v30 = objc_msgSend(v28, sel_url);
      sub_245BD8978();

      v80[0] = v25;
      v32 = *(_QWORD *)(v25 + 16);
      v31 = *(_QWORD *)(v25 + 24);
      if (v32 >= v31 >> 1)
      {
        sub_245BC3CA4(v31 > 1, v32 + 1, 1);
        v25 = v80[0];
      }
      ++v27;
      *(_QWORD *)(v25 + 16) = v32 + 1;
      v17[4](v25+ ((*((unsigned __int8 *)v17 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v17 + 80))+ (_QWORD)v17[9] * v32, v21, v78);
      v26 = v79;
    }
    while (v24 != v27);
    v13 = (uint64_t)v67;
  }
  if (v24 >= *(_QWORD *)(v25 + 16))
    v33 = *(_QWORD *)(v25 + 16);
  else
    v33 = v24;
  if (v33)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257512520);
    v34 = sub_245BD8E94();
  }
  else
  {
    v34 = MEMORY[0x24BEE4B00];
  }
  v80[0] = v34;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_245BC3188(v25, v23, 1, v80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v35 = v80[0];
  v80[0] = v25;
  v36 = v76;
  v80[4] = *(_QWORD *)(v76 + 120);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512F30);
  sub_245BC4504((unint64_t *)&unk_257512F38, &qword_257512F30, MEMORY[0x24BEE12B0]);
  sub_245BC89D4(&qword_2575129D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
  v37 = v65;
  sub_245BD8AE0();
  *(_QWORD *)(v36 + 120) = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v36 + 128) = v35;
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v36 + 112) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v38 = (uint64_t)v77;
    v39 = (uint64_t)v66;
    v67 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
    v67((char *)v66, v37, v13);
    v40 = sub_245BC4504(&qword_257512F48, &qword_257512F18, MEMORY[0x24BEE3150]);
    sub_245BD8C30();
    v41 = v75;
    *(_QWORD *)(v39 + *(int *)(v75 + 36)) = v80[0];
    sub_245BC8A5C(v39, v38, &qword_257512F10);
    v75 = v38 + *(int *)(v41 + 36);
    v76 = v40;
    v42 = *(_QWORD *)v75;
    sub_245BD8C3C();
    v43 = v63;
    v44 = v78;
    v45 = v64;
    v66 = (void (**)(char *, uint64_t, uint64_t))v17;
    if (v42 != v80[0])
    {
      do
      {
        v46 = (uint64_t)v77;
        v47 = (void (*)(_QWORD *, _QWORD))sub_245BD8C54();
        v48 = v45;
        v49 = v44;
        v50 = v43;
        v51 = (uint64_t)v70;
        sub_245BC8A14(v52, (uint64_t)v70);
        v47(v80, 0);
        v53 = v69;
        v67(v69, (char *)v46, v13);
        sub_245BD8C48();
        (*(void (**)(char *, uint64_t))(v79 + 8))(v53, v13);
        v54 = v51;
        v43 = v50;
        v44 = v49;
        v45 = v48;
        v55 = (uint64_t)v73;
        v56 = (uint64_t)v71;
        sub_245BC8A5C(v54, (uint64_t)v71, &qword_257512F08);
        swift_getEnumCaseMultiPayload();
        v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512F50);
        v58 = (void (**)(uint64_t, char *, uint64_t))v66;
        v59 = v68;
        v66[4](v68, v56 + *(int *)(v57 + 48), v44);
        v58[2](v55, v59, v44);
        swift_storeEnumTagMultiPayload();
        v45(v55);
        sub_245BC8548(v55);
        ((void (*)(char *, uint64_t))v58[1])(v59, v44);
        v60 = *(_QWORD *)v75;
        sub_245BD8C3C();
      }
      while (v60 != v80[0]);
    }
    sub_245BC4F10((uint64_t)v77, &qword_257512F10);
    return (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v65, v13);
  }
  else
  {
    v62 = (uint64_t)v73;
    *v73 = v25;
    swift_storeEnumTagMultiPayload();
    v64(v62);
    sub_245BC8548(v62);
    result = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v37, v13);
    *(_BYTE *)(v36 + 112) = 1;
  }
  return result;
}

void sub_245BC5888(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  char v6;
  unint64_t v7;
  char v8;
  id v9;

  v2 = *(_QWORD *)(v1 + 120);
  if (*(_QWORD *)(v2 + 16))
  {
    v4 = *(_QWORD *)(v1 + 128);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_245BC2334(a1, v2);
    v6 = v5;
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v4 + 16) && (v7 = sub_245BC2D00(a1), (v8 & 1) != 0))
    {
      v9 = *(id *)(*(_QWORD *)(v4 + 56) + 8 * v7);
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0 && (objc_msgSend(v9, sel_isTemporaryPath) & 1) == 0)
        objc_msgSend(v9, sel_invalidate);

    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_245BC5970()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

void sub_245BC599C(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void (*v25)(char *, char *, uint64_t);
  int v26;
  uint64_t v27;
  uint64_t v28;
  Class isa;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  char *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t aBlock;
  uint64_t v64;
  uint64_t (*v65)(uint64_t);
  void *v66;
  uint64_t (*v67)();
  _QWORD *v68;

  v54 = a1;
  v55 = a2;
  v61 = sub_245BD8AA4();
  v57 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v60 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_245BD8ABC();
  v56 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v58 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245BD8CA8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512EB0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_245BD8984();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v51 - v17;
  v62 = v2;
  if (v2[14].isa)
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    if ((sub_245BD8CC0() & 1) == 0)
    {
      if (qword_257512480 != -1)
        swift_once();
      v40 = sub_245BD8A74();
      __swift_project_value_buffer(v40, (uint64_t)qword_257513638);
      v62 = sub_245BD8A5C();
      v41 = sub_245BD8C60();
      if (os_log_type_enabled(v62, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_245BBC000, v62, v41, "Already observing directory changes when beginObservingChanges called, bailing.", v42, 2u);
        MEMORY[0x249543568](v42, -1, -1);

        swift_unknownObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();

      }
      return;
    }
    swift_unknownObjectRelease();
  }
  v19 = objc_allocWithZone(MEMORY[0x24BE60C40]);
  v20 = (void *)sub_245BD8AF8();
  v21 = objc_msgSend(v19, sel_initWithTypeIdentifier_, v20);

  v22 = v21;
  v23 = objc_msgSend(v21, sel_finalizedSessionsContainerURLForCurrentApplication);
  if (v23)
  {
    v24 = v23;
    sub_245BD8978();

    v25 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v25(v11, v16, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      v25(v18, v11, v12);
      sub_245BD896C();
      v26 = aBlock;
      if ((_DWORD)aBlock == -1)
      {
        if (qword_257512480 != -1)
          swift_once();
        v47 = sub_245BD8A74();
        __swift_project_value_buffer(v47, (uint64_t)qword_257513638);
        v48 = sub_245BD8A5C();
        v49 = sub_245BD8C78();
        if (os_log_type_enabled(v48, v49))
        {
          v50 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v50 = 0;
          _os_log_impl(&dword_245BBC000, v48, v49, "Unable to acquire fd for session container URL", v50, 2u);
          MEMORY[0x249543568](v50, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
      }
      else
      {
        sub_245BC4B08(0, &qword_257512EB8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257512EC0);
        v53 = v22;
        v27 = swift_allocObject();
        *(_OWORD *)(v27 + 16) = xmmword_245BD9E50;
        sub_245BD8C9C();
        aBlock = v27;
        sub_245BC89D4(&qword_257512EC8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5810], MEMORY[0x24BEE5820]);
        v52 = v18;
        __swift_instantiateConcreteTypeFromMangledName(&qword_257512ED0);
        sub_245BC4504(&qword_257512ED8, &qword_257512ED0, MEMORY[0x24BEE12C8]);
        sub_245BD8D68();
        v28 = sub_245BD8CB4();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        isa = v62[17].isa;
        swift_getObjectType();
        v30 = (_QWORD *)swift_allocObject();
        v30[2] = v28;
        v30[3] = isa;
        v31 = v55;
        v30[4] = v54;
        v30[5] = v31;
        v67 = sub_245BC884C;
        v68 = v30;
        aBlock = MEMORY[0x24BDAC760];
        v64 = 1107296256;
        v65 = sub_245BC6640;
        v66 = &block_descriptor_0;
        v32 = _Block_copy(&aBlock);
        swift_unknownObjectRetain();
        swift_retain();
        swift_retain();
        v33 = v58;
        sub_245BD8AB0();
        v34 = v60;
        sub_245BC6740();
        sub_245BD8CCC();
        _Block_release(v32);
        v57 = *(_QWORD *)(v57 + 8);
        v35 = v61;
        ((void (*)(char *, uint64_t))v57)(v34, v61);
        v36 = *(void (**)(char *, uint64_t))(v56 + 8);
        v37 = v59;
        v36(v33, v59);
        swift_release();
        v38 = swift_allocObject();
        *(_DWORD *)(v38 + 16) = v26;
        v67 = sub_245BC8880;
        v68 = (_QWORD *)v38;
        aBlock = MEMORY[0x24BDAC760];
        v64 = 1107296256;
        v65 = sub_245BC6640;
        v66 = &block_descriptor_18;
        v39 = _Block_copy(&aBlock);
        sub_245BD8AB0();
        sub_245BC6740();
        sub_245BD8CD8();
        _Block_release(v39);
        ((void (*)(char *, uint64_t))v57)(v34, v35);
        v36(v33, v37);
        swift_release();
        sub_245BD8CF0();

        (*(void (**)(char *, uint64_t))(v13 + 8))(v52, v12);
        v62[14].isa = (Class)v28;
        swift_unknownObjectRelease();
      }
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  }
  sub_245BC4F10((uint64_t)v11, &qword_257512EB0);
  if (qword_257512480 != -1)
    swift_once();
  v43 = sub_245BD8A74();
  __swift_project_value_buffer(v43, (uint64_t)qword_257513638);
  v44 = sub_245BD8A5C();
  v45 = sub_245BD8C78();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v46 = 0;
    _os_log_impl(&dword_245BBC000, v44, v45, "beginObservingChanges: Unable to build sessions container URL for current application.", v46, 2u);
    MEMORY[0x249543568](v46, -1, -1);
  }

}

uint64_t sub_245BC61F0@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  if (a1)
  {
    result = sub_245BD8A80();
  }
  else
  {
    if (qword_257512480 != -1)
      swift_once();
    v4 = sub_245BD8A74();
    __swift_project_value_buffer(v4, (uint64_t)qword_257513638);
    v5 = sub_245BD8A5C();
    v6 = sub_245BD8C78();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_245BBC000, v5, v6, "unable to get fs path for sessionContainerURL", v7, 2u);
      MEMORY[0x249543568](v7, -1, -1);
    }

    result = 0xFFFFFFFFLL;
  }
  *a2 = result;
  return result;
}

uint64_t sub_245BC62E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v31;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_245BD8CA8();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5810];
  v12 = *(_QWORD *)(v10 - 8);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v31 - v16;
  swift_getObjectType();
  sub_245BD8D08();
  sub_245BD8C9C();
  sub_245BC89D4(&qword_257512EC8, v11, MEMORY[0x24BEE5820]);
  v18 = sub_245BD8D5C();
  v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19(v15, v10);
  if ((v18 & 1) != 0)
  {
    if (qword_257512480 != -1)
      swift_once();
    v20 = sub_245BD8A74();
    __swift_project_value_buffer(v20, (uint64_t)qword_257513638);
    v21 = sub_245BD8A5C();
    v22 = sub_245BD8C84();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_245BBC000, v21, v22, "Write event received, refreshing session URLs", v23, 2u);
      MEMORY[0x249543568](v23, -1, -1);
    }

    v24 = sub_245BD8BD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v9, 1, 1, v24);
    v25 = (_QWORD *)swift_allocObject();
    v25[2] = 0;
    v25[3] = 0;
    v25[4] = a2;
    v25[5] = a3;
    v25[6] = a4;
    swift_retain();
    swift_retain();
    sub_245BBE86C((uint64_t)v9, (uint64_t)&unk_257512F00, (uint64_t)v25);
    swift_release();
  }
  else
  {
    if (qword_257512480 != -1)
      swift_once();
    v26 = sub_245BD8A74();
    __swift_project_value_buffer(v26, (uint64_t)qword_257513638);
    v27 = sub_245BD8A5C();
    v28 = sub_245BD8C6C();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_245BBC000, v27, v28, "Event received, was not a write (or self == nil), bailing", v29, 2u);
      MEMORY[0x249543568](v29, -1, -1);
    }

  }
  return ((uint64_t (*)(char *, uint64_t))v19)(v17, v10);
}

uint64_t sub_245BC65F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_245BC660C()
{
  uint64_t v0;

  sub_245BC50FC(*(void (**)(_QWORD))(v0 + 24), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BC6640(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_245BC666C(int a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (qword_257512480 != -1)
    swift_once();
  v2 = sub_245BD8A74();
  __swift_project_value_buffer(v2, (uint64_t)qword_257513638);
  v3 = sub_245BD8A5C();
  v4 = sub_245BD8C84();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_245BBC000, v3, v4, "DispatchSource cancelled, closing file handle", v5, 2u);
    MEMORY[0x249543568](v5, -1, -1);
  }

  return close(a1);
}

uint64_t sub_245BC6740()
{
  sub_245BD8AA4();
  sub_245BC89D4((unint64_t *)&unk_257512EE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257513320);
  sub_245BC4504(&qword_257512EF0, (uint64_t *)&unk_257513320, MEMORY[0x24BEE12C8]);
  return sub_245BD8D68();
}

uint64_t sub_245BC67F4()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_245BC6830()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SecureCaptureManager();
  v0 = swift_allocObject();
  result = sub_245BC68E8();
  qword_257512AD0 = v0;
  return result;
}

uint64_t static SecureCaptureManager.shared.getter()
{
  if (qword_257512478 != -1)
    swift_once();
  return swift_retain();
}

uint64_t SecureCaptureManager.sessionContentURLs.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = (os_unfair_lock_s *)(v1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  v3 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v2);
  return v3;
}

uint64_t sub_245BC68E8()
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
  char *v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8](v0);
  v44 = (char *)&v43 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_245BD8984();
  v2 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512F58);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512F60);
  v45 = *(_QWORD *)(v9 - 8);
  v46 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512F68);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SecureCaptureManager.URLUpdate();
  v16 = v47;
  *(_QWORD *)(v47 + 16) = 0;
  *(_QWORD *)(v16 + 24) = 0;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE6A10], v5);
  sub_245BD8BDC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v11, v46);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v17 = objc_msgSend((id)objc_opt_self(), sel_finalizedSessionPathsWithType_, 1);
  sub_245BC4B08(0, (unint64_t *)&qword_257512F20);
  v18 = sub_245BD8B58();

  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_245BD8E70();
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v20 = MEMORY[0x24BEE4AF8];
  if (v19)
  {
    v49 = MEMORY[0x24BEE4AF8];
    sub_245BC3CA4(0, v19 & ~(v19 >> 63), 0);
    if (v19 < 0)
    {
      __break(1u);
      result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    v21 = 0;
    v20 = v49;
    do
    {
      if ((v18 & 0xC000000000000001) != 0)
        v22 = (id)MEMORY[0x249542EE4](v21, v18);
      else
        v22 = *(id *)(v18 + 8 * v21 + 32);
      v23 = v22;
      v24 = objc_msgSend(v22, sel_url);
      sub_245BD8978();

      v49 = v20;
      v26 = *(_QWORD *)(v20 + 16);
      v25 = *(_QWORD *)(v20 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_245BC3CA4(v25 > 1, v26 + 1, 1);
        v20 = v49;
      }
      ++v21;
      *(_QWORD *)(v20 + 16) = v26 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v20+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72) * v26, v4, v48);
    }
    while (v19 != v21);
  }
  if (v19 >= *(_QWORD *)(v20 + 16))
    v27 = *(_QWORD *)(v20 + 16);
  else
    v27 = v19;
  v28 = MEMORY[0x24BEE4B00];
  if (v27)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257512520);
    v29 = sub_245BD8E94();
  }
  else
  {
    v29 = MEMORY[0x24BEE4B00];
  }
  v49 = v29;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_245BC3188(v20, v18, 1, &v49);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v30 = v49;
  type metadata accessor for CaptureManagerURLs();
  v31 = swift_allocObject();
  swift_bridgeObjectRetain();
  swift_defaultActor_initialize();
  *(_BYTE *)(v31 + 112) = 1;
  *(_QWORD *)(v31 + 120) = v20;
  *(_QWORD *)(v31 + 128) = v28;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v31 + 128) = v30;
  swift_bridgeObjectRelease();
  v32 = v47;
  *(_QWORD *)(v47 + 40) = v31;
  type metadata accessor for CaptureManagerFSObserving();
  v33 = (_QWORD *)swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  v33[14] = 0;
  v33[15] = 0;
  v33[16] = 0;
  v33[17] = v31;
  *(_QWORD *)(v32 + 48) = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512F70);
  v34 = swift_allocObject();
  *(_DWORD *)(v34 + 24) = 0;
  *(_QWORD *)(v34 + 16) = v20;
  *(_QWORD *)(v32 + 32) = v34;
  v35 = sub_245BD8BD0();
  v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56);
  v37 = (uint64_t)v44;
  v36(v44, 1, 1, v35);
  v38 = (_QWORD *)swift_allocObject();
  v38[2] = 0;
  v38[3] = 0;
  v38[4] = v32;
  swift_retain();
  sub_245BBE86C(v37, (uint64_t)&unk_257512F80, (uint64_t)v38);
  swift_release();
  v36((char *)v37, 1, 1, v35);
  sub_245BD8BB8();
  swift_retain();
  v39 = sub_245BD8BAC();
  v40 = (_QWORD *)swift_allocObject();
  v41 = MEMORY[0x24BEE6930];
  v40[2] = v39;
  v40[3] = v41;
  v40[4] = v32;
  sub_245BBE86C(v37, (uint64_t)&unk_257512F90, (uint64_t)v40);
  swift_release();
  sub_245BC6E7C();
  return v32;
}

uint64_t sub_245BC6E7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245BD8BD0();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_245BC4F10((uint64_t)v4, &qword_257512498);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_245BD8BC4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_245BD8B88();
      v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = &unk_257512FA0;
  *(_QWORD *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t SecureCaptureManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245BD8BD0();
  v6 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v6(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  swift_retain();
  sub_245BBE86C((uint64_t)v4, (uint64_t)&unk_257512AE8, (uint64_t)v7);
  swift_release();
  v6(v4, 1, 1, v5);
  sub_245BD8BB8();
  swift_retain();
  v8 = sub_245BD8BAC();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v1;
  sub_245BBE86C((uint64_t)v4, (uint64_t)&unk_257512AF8, (uint64_t)v9);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SecureCaptureManager.__deallocating_deinit()
{
  SecureCaptureManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_245BC71D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_245BC71F0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 40);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_245BC7234()
{
  uint64_t v0;

  sub_245BC8F68(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 16));
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BC7270(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  int EnumCaseMultiPayload;
  os_unfair_lock_s *v14;
  unint64_t *p_os_unfair_lock_opaque;
  os_unfair_lock_s *v16;
  uint64_t v18;
  uint64_t v19;
  os_unfair_lock_s *v20;
  uint64_t v21;
  os_unfair_lock_s *v22;
  _BYTE v23[16];

  v3 = sub_245BD8984();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = &v23[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v23[-v8];
  v10 = type metadata accessor for SecureCaptureManager.URLUpdate();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (uint64_t *)&v23[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_245BC96D8(a1, (uint64_t)v12);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v4 + 32))(v9, v12, v3);
      v14 = *(os_unfair_lock_s **)(v1 + 32);
      p_os_unfair_lock_opaque = (unint64_t *)&v14[4]._os_unfair_lock_opaque;
      v16 = v14 + 6;
      os_unfair_lock_lock(v14 + 6);
      sub_245BC744C(p_os_unfair_lock_opaque, (uint64_t)v9);
      os_unfair_lock_unlock(v16);
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v9, v3);
    }
    else
    {
      (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v4 + 32))(v7, v12, v3);
      v20 = *(os_unfair_lock_s **)(v1 + 32);
      v21 = (uint64_t)&v20[4];
      v22 = v20 + 6;
      os_unfair_lock_lock(v20 + 6);
      sub_245BC756C(v21, (uint64_t)v7);
      os_unfair_lock_unlock(v22);
      return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
    }
  }
  else
  {
    v18 = *v12;
    v19 = *(_QWORD *)(v1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(v19 + 24));
    swift_bridgeObjectRelease();
    *(_QWORD *)(v19 + 16) = v18;
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock((os_unfair_lock_t)(v19 + 24));
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_245BC744C(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t result;
  uint64_t v12;

  v4 = sub_245BD8984();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v8 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v8 = sub_245BCC260(0, *(_QWORD *)(v8 + 16) + 1, 1, v8);
  v10 = *(_QWORD *)(v8 + 16);
  v9 = *(_QWORD *)(v8 + 24);
  if (v10 >= v9 >> 1)
    v8 = sub_245BCC260(v9 > 1, v10 + 1, 1, v8);
  *(_QWORD *)(v8 + 16) = v10 + 1;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v10, v7, v4);
  *a1 = v8;
  return result;
}

uint64_t sub_245BC756C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int64_t v4;
  _QWORD v5[4];

  v5[2] = a2;
  result = sub_245BC8C10((uint64_t (*)(unint64_t))sub_245BC971C, (uint64_t)v5);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (v4 >= result)
    return sub_245BC9748(result, v4);
  __break(1u);
  return result;
}

uint64_t sub_245BC75C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_245BC75DC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 48);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_245BC7620()
{
  uint64_t v0;

  sub_245BC599C((uint64_t)sub_245BC9A58, *(_QWORD *)(v0 + 16));
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BC7664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 64) = a4;
  sub_245BD8BB8();
  *(_QWORD *)(v4 + 72) = sub_245BD8BAC();
  sub_245BD8B88();
  return swift_task_switch();
}

uint64_t sub_245BC76D0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;

  v1 = v0[8];
  swift_release();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_defaultCenter);
  v4 = swift_allocObject();
  swift_weakInit();
  v0[2] = MEMORY[0x24BDAC760];
  v5 = *MEMORY[0x24BEBDF98];
  v0[6] = sub_245BC9914;
  v0[7] = v4;
  v0[3] = 1107296256;
  v0[4] = sub_245BC7A00;
  v0[5] = &block_descriptor_45;
  v6 = _Block_copy(v0 + 2);
  swift_release();
  v7 = objc_msgSend(v3, sel_addObserverForName_object_queue_usingBlock_, v5, 0, 0, v6);
  _Block_release(v6);

  v8 = *(_QWORD *)(v1 + 16);
  if (v8)
  {
    swift_unknownObjectRetain();
    v9 = objc_msgSend(v2, sel_defaultCenter);
    objc_msgSend(v9, sel_removeObserver_, v8);

    swift_unknownObjectRelease();
  }
  v10 = v0[8];
  *(_QWORD *)(v1 + 16) = v7;
  swift_unknownObjectRelease();
  v11 = objc_msgSend(v2, sel_defaultCenter);
  v12 = *MEMORY[0x24BEBE008];
  v13 = swift_allocObject();
  swift_weakInit();
  v0[6] = sub_245BC993C;
  v0[7] = v13;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_245BC7A00;
  v0[5] = &block_descriptor_49;
  v14 = _Block_copy(v0 + 2);
  swift_release();
  v15 = objc_msgSend(v11, sel_addObserverForName_object_queue_usingBlock_, v12, 0, 0, v14);
  _Block_release(v14);

  v16 = *(_QWORD *)(v10 + 24);
  if (v16)
  {
    swift_unknownObjectRetain();
    v17 = objc_msgSend(v2, sel_defaultCenter);
    objc_msgSend(v17, sel_removeObserver_, v16);

    swift_unknownObjectRelease();
  }
  *(_QWORD *)(v10 + 24) = v15;
  swift_unknownObjectRelease();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_245BC7974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_245BC798C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 48);
  return swift_task_switch();
}

uint64_t sub_245BC79A8()
{
  uint64_t v0;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 24) + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245BD8CFC();
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BC7A00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_245BD8900();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_245BD88F4();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_245BC7AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v9 = result;
    v10 = sub_245BD8BD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    sub_245BBE86C((uint64_t)v7, a4, (uint64_t)v11);
    return swift_release();
  }
  return result;
}

uint64_t sub_245BC7B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_245BC7BA0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 48);
  return swift_task_switch();
}

uint64_t sub_245BC7BBC()
{
  uint64_t v0;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 24) + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245BD8CF0();
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BC7C14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_245BC7C2C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 48);
  return swift_task_switch();
}

uint64_t sub_245BC7C48()
{
  uint64_t v0;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 24) + 112))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245BD8CE4();
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BC7CA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245BC5098;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_245BC7D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_245BD8BB8();
  *(_QWORD *)(v4 + 24) = sub_245BD8BAC();
  sub_245BD8B88();
  return swift_task_switch();
}

uint64_t sub_245BC7D70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release();
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (void *)objc_opt_self();
    swift_unknownObjectRetain();
    v4 = objc_msgSend(v3, sel_defaultCenter);
    objc_msgSend(v4, sel_removeObserver_, v2);

    swift_unknownObjectRelease();
  }
  v5 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 16) = 0;
  swift_unknownObjectRelease();
  v6 = *(_QWORD *)(v5 + 24);
  if (v6)
  {
    v7 = (void *)objc_opt_self();
    swift_unknownObjectRetain();
    v8 = objc_msgSend(v7, sel_defaultCenter);
    objc_msgSend(v8, sel_removeObserver_, v6);

    swift_unknownObjectRelease();
  }
  *(_QWORD *)(v5 + 24) = 0;
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BC7E8C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_245BC5098;
  return sub_245BC7D04(a1, v4, v5, v6);
}

uint64_t SecureCaptureManager.invalidate(url:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v13;

  v3 = sub_245BD8984();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_245BD8BD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  v10 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v11 = (char *)swift_allocObject();
  *((_QWORD *)v11 + 2) = 0;
  *((_QWORD *)v11 + 3) = 0;
  *((_QWORD *)v11 + 4) = v1;
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v11[v10], (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  swift_retain();
  sub_245BBE86C((uint64_t)v8, (uint64_t)&unk_257512B08, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_245BC8038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_245BC8050()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 32) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 40);
  return swift_task_switch();
}

uint64_t sub_245BC806C()
{
  uint64_t v0;

  sub_245BC5888(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BC809C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_245BD8984();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_245BC8118()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_245BD8984() - 8) + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = v0 + ((v2 + 40) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245BC5098;
  v5[2] = v3;
  v5[3] = v4;
  return swift_task_switch();
}

Swift::Void __swiftcall SecureCaptureManager.applicationDidCompleteTransition()()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v0, sel_applicationDidCompleteTransition);

}

uint64_t type metadata accessor for CaptureManagerURLs()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for CaptureManagerFSObserving()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for SecureCaptureManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for SecureCaptureManager()
{
  return swift_lookUpClassMethod();
}

uint64_t *initializeBufferWithCopyOfBuffer for SecureCaptureManager.URLUpdate(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v7 = sub_245BD8984();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SecureCaptureManager.URLUpdate(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2 || (_DWORD)result == 1)
  {
    v3 = sub_245BD8984();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else if (!(_DWORD)result)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for SecureCaptureManager.URLUpdate(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v5 = sub_245BD8984();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  }
  else
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for SecureCaptureManager.URLUpdate(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_245BC8548((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v5 = sub_245BD8984();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_245BC8548(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SecureCaptureManager.URLUpdate();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SecureCaptureManager.URLUpdate()
{
  uint64_t result;

  result = qword_257512E78;
  if (!qword_257512E78)
    return swift_getSingletonMetadata();
  return result;
}

void *initializeWithTake for SecureCaptureManager.URLUpdate(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v7 = sub_245BD8984();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for SecureCaptureManager.URLUpdate(void *a1, const void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_245BC8548((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v7 = sub_245BD8984();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SecureCaptureManager.URLUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SecureCaptureManager.URLUpdate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_245BC877C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_245BC878C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245BD8984();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_245BC8818()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245BC884C()
{
  uint64_t *v0;

  return sub_245BC62E8(v0[2], v0[3], v0[4], v0[5]);
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

uint64_t sub_245BC8870()
{
  return swift_deallocObject();
}

uint64_t sub_245BC8880()
{
  uint64_t v0;

  return sub_245BC666C(*(_DWORD *)(v0 + 16));
}

uint64_t sub_245BC8888()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245BC88BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_245BBE824;
  *(_QWORD *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return swift_task_switch();
}

uint64_t sub_245BC8924(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_245BC8988;
  return v6(a1);
}

uint64_t sub_245BC8988()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_245BC89D4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495434CC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_245BC8A14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512F08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245BC8A5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_245BC8AA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245BC5098;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_245BC8B08(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_245BC5098;
  return sub_245BC7664(a1, v4, v5, v6);
}

uint64_t sub_245BC8B78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245BC5098;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_245BC8BD8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245BC8BFC(unint64_t a1)
{
  return sub_245BCC260(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_245BC8C10(uint64_t (*a1)(unint64_t), uint64_t a2)
{
  unint64_t *v2;
  uint64_t v3;
  unint64_t *v4;
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
  unint64_t v17;
  char v18;
  uint64_t result;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *);
  void (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t (*v35)(unint64_t, char *, uint64_t);
  uint64_t v36;
  BOOL v37;
  unint64_t v38;
  _QWORD v39[2];
  uint64_t (*v40)(unint64_t);
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;

  v4 = v2;
  v7 = sub_245BD8984();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v42 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v41 = (char *)v39 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v46 = v4;
  v14 = *v4;
  v15 = *(_QWORD *)(*v4 + 16);
  if (!v15)
    return 0;
  v44 = (char *)v39 - v13;
  v16 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v48 = *(_QWORD *)(v8 + 72);
  swift_bridgeObjectRetain();
  v17 = 0;
  v39[0] = v16;
  while (1)
  {
    v18 = a1(v14 + v16);
    if (v3)
    {
      swift_bridgeObjectRelease();
      return v17;
    }
    if ((v18 & 1) != 0)
      break;
    ++v17;
    v16 += v48;
    if (v15 == v17)
    {
      swift_bridgeObjectRelease();
      return *(_QWORD *)(v14 + 16);
    }
  }
  result = swift_bridgeObjectRelease();
  if (!__OFADD__(v17, 1))
  {
    v20 = *(_QWORD *)(v14 + 16);
    if (v17 + 1 == v20)
      return v17;
    v21 = v48 + v16;
    v22 = v17 + 1;
    v45 = v7;
    v39[1] = a2;
    v40 = a1;
    v43 = v8;
    while (v22 < v20)
    {
      v47 = v22;
      v23 = v21;
      v24 = v14 + v21;
      v25 = (uint64_t (*)(char *))a1;
      v26 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
      v27 = v44;
      v26(v44, v24, v7);
      LOBYTE(v25) = v25(v27);
      result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v27, v7);
      if ((v25 & 1) != 0)
      {
        a1 = v40;
        v28 = v23;
        v29 = v47;
      }
      else
      {
        v29 = v47;
        v28 = v23;
        if (v47 != v17)
        {
          if ((v17 & 0x8000000000000000) != 0)
            goto LABEL_32;
          v30 = *v46;
          v31 = *(_QWORD *)(*v46 + 16);
          if (v17 >= v31)
            goto LABEL_33;
          v32 = v17 * v48;
          v33 = v45;
          result = ((uint64_t (*)(char *, unint64_t, uint64_t))v26)(v41, v30 + v39[0] + v17 * v48, v45);
          if (v47 >= v31)
            goto LABEL_34;
          v26(v42, v30 + v23, v33);
          result = swift_isUniquelyReferenced_nonNull_native();
          *v46 = v30;
          if ((result & 1) == 0)
          {
            result = sub_245BC8BFC(v30);
            v30 = result;
            *v46 = result;
          }
          if (v17 >= *(_QWORD *)(v30 + 16))
            goto LABEL_35;
          v34 = v30 + v39[0] + v32;
          v35 = *(uint64_t (**)(unint64_t, char *, uint64_t))(v43 + 40);
          v36 = v45;
          result = v35(v34, v42, v45);
          if (v47 >= *(_QWORD *)(*v46 + 16))
            goto LABEL_36;
          result = v35(*v46 + v23, v41, v36);
          v29 = v47;
        }
        v37 = __OFADD__(v17++, 1);
        a1 = v40;
        if (v37)
          goto LABEL_31;
      }
      v38 = v29 + 1;
      v7 = v45;
      v8 = v43;
      if (__OFADD__(v29, 1))
        goto LABEL_30;
      v14 = *v46;
      v20 = *(_QWORD *)(*v46 + 16);
      v22 = v29 + 1;
      v21 = v28 + v48;
      if (v38 == v20)
        return v17;
    }
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_245BC8F68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
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
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
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
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t *v52;
  void (*v53)(_QWORD *, _QWORD);
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t result;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[7];

  v78 = a2;
  v71 = a1;
  v2 = sub_245BD8984();
  v80 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v64 - v6;
  v8 = type metadata accessor for SecureCaptureManager.URLUpdate();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512F08);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v66 = (char *)&v64 - v15;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512F10);
  v16 = MEMORY[0x24BDAC7A8](v70);
  v69 = (uint64_t *)((char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v16);
  v65 = (uint64_t)&v64 - v18;
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512F18);
  v79 = *(_QWORD *)(v72 - 8);
  v19 = MEMORY[0x24BDAC7A8](v72);
  v73 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v68 = (char *)&v64 - v21;
  v22 = objc_msgSend((id)objc_opt_self(), sel_finalizedSessionPathsWithType_, 1);
  sub_245BC4B08(0, (unint64_t *)&qword_257512F20);
  v23 = sub_245BD8B58();

  v67 = v7;
  v76 = v8;
  v77 = v10;
  v74 = v14;
  v75 = v11;
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    v24 = sub_245BD8E70();
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v25 = MEMORY[0x24BEE4AF8];
  if (v24)
  {
    v81[0] = MEMORY[0x24BEE4AF8];
    sub_245BC3CA4(0, v24 & ~(v24 >> 63), 0);
    if (v24 < 0)
    {
      __break(1u);
      swift_release();
      result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    v26 = 0;
    v25 = v81[0];
    v27 = v23 & 0xC000000000000001;
    v28 = v2;
    v29 = v23;
    do
    {
      if (v27)
        v30 = (id)MEMORY[0x249542EE4](v26, v23);
      else
        v30 = *(id *)(v23 + 8 * v26 + 32);
      v31 = v30;
      v32 = objc_msgSend(v30, sel_url);
      sub_245BD8978();

      v81[0] = v25;
      v34 = *(_QWORD *)(v25 + 16);
      v33 = *(_QWORD *)(v25 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_245BC3CA4(v33 > 1, v34 + 1, 1);
        v25 = v81[0];
      }
      ++v26;
      *(_QWORD *)(v25 + 16) = v34 + 1;
      v2 = v28;
      (*(void (**)(unint64_t, char *, uint64_t))(v80 + 32))(v25+ ((*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80))+ *(_QWORD *)(v80 + 72) * v34, v5, v28);
      v23 = v29;
    }
    while (v24 != v26);
  }
  if (v24 >= *(_QWORD *)(v25 + 16))
    v35 = *(_QWORD *)(v25 + 16);
  else
    v35 = v24;
  if (v35)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257512520);
    v36 = sub_245BD8E94();
  }
  else
  {
    v36 = MEMORY[0x24BEE4B00];
  }
  v37 = v72;
  v38 = v79;
  v39 = v68;
  v81[0] = v36;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_245BC3188(v25, v23, 1, v81);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v40 = v81[0];
  v81[0] = v25;
  v41 = v71;
  v81[4] = *(_QWORD *)(v71 + 120);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512F30);
  sub_245BC4504((unint64_t *)&unk_257512F38, &qword_257512F30, MEMORY[0x24BEE12B0]);
  sub_245BC89D4(&qword_2575129D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
  sub_245BD8AE0();
  *(_QWORD *)(v41 + 120) = v25;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v41 + 128) = v40;
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v41 + 112) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v42 = (uint64_t)v69;
    v71 = *(_QWORD *)(v38 + 16);
    v72 = v2;
    ((void (*)(uint64_t *, char *, uint64_t))v71)(v69, v39, v37);
    v43 = sub_245BC4504(&qword_257512F48, &qword_257512F18, MEMORY[0x24BEE3150]);
    sub_245BD8C30();
    v44 = v70;
    *(_QWORD *)(v42 + *(int *)(v70 + 36)) = v81[0];
    v45 = v65;
    sub_245BC8A5C(v42, v65, &qword_257512F10);
    v69 = (uint64_t *)(v45 + *(int *)(v44 + 36));
    v70 = v43;
    v46 = *v69;
    sub_245BD8C3C();
    v47 = v46 == v81[0];
    v48 = v38;
    v49 = (uint64_t)v66;
    v50 = v67;
    v51 = (uint64_t)v74;
    if (!v47)
    {
      v52 = v69;
      do
      {
        v53 = (void (*)(_QWORD *, _QWORD))sub_245BD8C54();
        sub_245BC8A14(v54, v49);
        v53(v81, 0);
        v55 = v73;
        ((void (*)(char *, uint64_t, uint64_t))v71)(v73, v45, v37);
        sub_245BD8C48();
        (*(void (**)(char *, uint64_t))(v48 + 8))(v55, v37);
        sub_245BC8A5C(v49, v51, &qword_257512F08);
        swift_getEnumCaseMultiPayload();
        v56 = v51 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257512F50) + 48);
        v57 = v80;
        v58 = v49;
        v59 = v72;
        (*(void (**)(char *, uint64_t, uint64_t))(v80 + 32))(v50, v56, v72);
        v60 = (uint64_t)v77;
        (*(void (**)(uint64_t *, char *, uint64_t))(v57 + 16))(v77, v50, v59);
        swift_storeEnumTagMultiPayload();
        sub_245BC7270(v60);
        sub_245BC8548(v60);
        (*(void (**)(char *, uint64_t))(v57 + 8))(v50, v59);
        v61 = *v52;
        sub_245BD8C3C();
        v47 = v61 == v81[0];
        v48 = v79;
        v49 = v58;
        v51 = (uint64_t)v74;
      }
      while (!v47);
    }
    sub_245BC4F10(v45, &qword_257512F10);
    return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v68, v37);
  }
  else
  {
    v63 = (uint64_t)v77;
    *v77 = v25;
    swift_storeEnumTagMultiPayload();
    sub_245BC7270(v63);
    sub_245BC8548(v63);
    result = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v39, v37);
    *(_BYTE *)(v41 + 112) = 1;
  }
  return result;
}

uint64_t sub_245BC96D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SecureCaptureManager.URLUpdate();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245BC971C(uint64_t a1)
{
  uint64_t v1;

  return MEMORY[0x249542A1C](a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t sub_245BC9748(uint64_t a1, int64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_245BCC260(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = *(_QWORD *)(sub_245BD8984() - 8);
  v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v14 * a1;
  v16 = v13 + v14 * a1;
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_25;
  v18 = *(_QWORD *)(v4 + 16);
  v19 = v18 - a2;
  if (__OFSUB__(v18, a2))
    goto LABEL_31;
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      result = swift_arrayInitWithTakeBackToFront();
    }
    v21 = *(_QWORD *)(v4 + 16);
    v22 = __OFADD__(v21, v8);
    v23 = v21 - v7;
    if (!v22)
    {
      *(_QWORD *)(v4 + 16) = v23;
LABEL_25:
      *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  result = sub_245BD8EA0();
  __break(1u);
  return result;
}

uint64_t sub_245BC98F0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_245BC9914(uint64_t a1)
{
  uint64_t v1;

  return sub_245BC7AA4(a1, v1, (uint64_t)&unk_2516D8D80, (uint64_t)&unk_257512FD0);
}

uint64_t sub_245BC993C(uint64_t a1)
{
  uint64_t v1;

  return sub_245BC7AA4(a1, v1, (uint64_t)&unk_2516D8D58, (uint64_t)&unk_257512FC0);
}

uint64_t sub_245BC9968()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245BC5098;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245BC99F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245BC5098;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_245BC9A74()
{
  uint64_t v0;

  v0 = sub_245BD8A74();
  __swift_allocate_value_buffer(v0, qword_257513638);
  __swift_project_value_buffer(v0, (uint64_t)qword_257513638);
  return sub_245BD8A68();
}

uint64_t sub_245BC9AE4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x52737365636F7270;
  else
    return 0x6E6F6D6D6F63;
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

void sub_245BC9B64(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(userActivity:responder:)(void *a1, void *a2)
{
  id v4;

  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUserActivity_responder_, a1, a2);

  return v4;
}

{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v14;
  uint64_t inited;
  unint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  objc_super v22;
  objc_super v23;
  objc_super v24;
  objc_super v25;
  _QWORD aBlock[7];

  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_245BD9FE0;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  objc_msgSend(a1, sel_setNeedsSave_, 0);
  sub_245BBEED8(MEMORY[0x24BEE4AF8]);
  v7 = (void *)sub_245BD8AC8();
  swift_bridgeObjectRelease();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = v6;
  aBlock[4] = sub_245BCA170;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_245BBF518;
  aBlock[3] = &block_descriptor_1;
  v9 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel__createUserActivityDataWithOptions_completionHandler_, v7, v9);
  _Block_release(v9);

  swift_beginAccess();
  if (*(_QWORD *)(v6 + 16))
  {
    v22.receiver = v2;
    v22.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
    v10 = objc_msgSendSuper2(&v22, sel_initWithInfo_responder_, 0, 0);
LABEL_5:
    v12 = v10;
    swift_release();
    swift_release();

    return v12;
  }
  swift_beginAccess();
  v11 = *(_QWORD *)(v5 + 24);
  if (v11 >> 60 == 15)
  {
    v25.receiver = v2;
    v25.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
    v10 = objc_msgSendSuper2(&v25, sel_initWithInfo_responder_, 0, 0);
    goto LABEL_5;
  }
  v14 = *(_QWORD *)(v5 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512FE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_245BD9E50;
  *(_QWORD *)(inited + 32) = 7;
  *(_QWORD *)(inited + 40) = v14;
  *(_QWORD *)(inited + 48) = v11;
  v16 = sub_245BC4854((_QWORD *)inited);
  swift_setDeallocating();
  sub_245BC4954(v14, v11);
  sub_245BC4954(v14, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512FE8);
  swift_arrayDestroy();
  sub_245BCA190(v16);
  swift_bridgeObjectRelease();
  v17 = objc_allocWithZone(MEMORY[0x24BEBD390]);
  v18 = (void *)sub_245BD8AC8();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v17, sel_initWithSettings_, v18);

  if (v19)
  {
    v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE40]), sel_init);
    objc_msgSend(v20, sel_setObject_forSetting_, v19, 1);
    v23.receiver = v2;
    v23.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
    v21 = v20;
    v12 = objc_msgSendSuper2(&v23, sel_initWithInfo_responder_, v21, a2);

    sub_245BC4D68(v14, v11);
    swift_release();
    swift_release();

  }
  else
  {
    v24.receiver = v2;
    v24.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
    v12 = objc_msgSendSuper2(&v24, sel_initWithInfo_responder_, 0, 0);

    sub_245BC4D68(v14, v11);
    swift_release();
    swift_release();
  }
  return v12;
}

uint64_t sub_245BCA03C()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >> 60 != 15)
    sub_245BC4C84(*(_QWORD *)(v0 + 16), v1);
  return swift_deallocObject();
}

uint64_t sub_245BCA070()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_245BCA094(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;

  swift_beginAccess();
  v10 = *(_QWORD *)(a4 + 16);
  v11 = *(_QWORD *)(a4 + 24);
  *(_QWORD *)(a4 + 16) = a1;
  *(_QWORD *)(a4 + 24) = a2;
  sub_245BC4C34(a1, a2);
  sub_245BC4D68(v10, v11);
  swift_beginAccess();
  v12 = *(void **)(a5 + 16);
  *(_QWORD *)(a5 + 16) = a3;
  v13 = a3;

}

uint64_t sub_245BCA144()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_245BCA170(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  sub_245BCA094(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
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

uint64_t sub_245BCA190(uint64_t a1)
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
  unint64_t v19;
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
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257512A48);
    v2 = sub_245BD8E94();
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
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v12);
    v18 = *v17;
    v19 = v17[1];
    sub_245BC4954(*v17, v19);
    swift_dynamicCast();
    *(_QWORD *)&v37[0] = v18;
    *((_QWORD *)&v37[0] + 1) = v19;
    swift_dynamicCast();
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_245BC4E90(&v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_245BC4E90(v36, v37);
    sub_245BC4E90(v37, &v33);
    result = sub_245BD8DBC();
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
    result = (uint64_t)sub_245BC4E90(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_245BCBC14();
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

void __swiftcall SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(coder:)(SESecureCaptureOpenApplicationAfterTransitionCompletionAction_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

id SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(coder:)(void *a1)
{
  id v2;
  objc_super v4;

  v4.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
  v2 = objc_msgSendSuper2(&v4, sel_initWithCoder_, a1);

  return v2;
}

id SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(xpcDictionary:)(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v1;
}

{
  id v1;
  objc_super v3;

  v3.super_class = (Class)SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
  v1 = objc_msgSendSuper2(&v3, sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v1;
}

uint64_t SESecureCaptureOpenApplicationAfterTransitionCompletionAction.launchActions.getter()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_245BD8E70())
    sub_245BCB8A4(MEMORY[0x24BEE4AF8]);
  else
    v1 = MEMORY[0x24BEE4B08];
  v9 = v1;
  v2 = objc_msgSend(v0, sel_info);
  if (!v2)
  {
    v7 = 0u;
    v8 = 0u;
LABEL_11:
    sub_245BCB81C((uint64_t)&v7);
    return v9;
  }
  v3 = v2;
  v4 = objc_msgSend(v2, sel_objectForSetting_, 1);

  if (v4)
  {
    sub_245BD8D50();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_245BCB85C((uint64_t)v6, (uint64_t)&v7);
  if (!*((_QWORD *)&v8 + 1))
    goto LABEL_11;
  sub_245BC4B08(0, &qword_257512FF8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_245BCAACC(&v7, *(void **)&v6[0]);

  }
  return v9;
}

id SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(info:responder:)(void *a1, void *a2)
{
  id v4;

  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_responder_, a1, a2);

  return v4;
}

void SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(info:responder:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(info:timeout:forResponseOn:withHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  void *v8;
  id v9;
  _QWORD v11[6];

  if (a3)
  {
    v11[4] = a3;
    v11[5] = a4;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_245BC9B64;
    v11[3] = &block_descriptor_9;
    v8 = _Block_copy(v11);
    swift_release();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, a1, a2, v8, a5);

  _Block_release(v8);
  return v9;
}

void SESecureCaptureOpenApplicationAfterTransitionCompletionAction.init(info:timeout:forResponseOn:withHandler:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245BCAACC(_QWORD *a1, void *a2)
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
    v9 = sub_245BD8DA4();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_245BC4B08(0, &qword_2575129F8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_245BD8D98();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_245BCAD68(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_245BCAF5C();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_245BCB1F8((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_245BD8D14();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_245BC4B08(0, &qword_2575129F8);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_245BD8D20();

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
        v18 = sub_245BD8D20();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_245BCB278((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_245BCAD68(uint64_t a1, uint64_t a2)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257513030);
    v2 = sub_245BD8DF8();
    v14 = v2;
    sub_245BD8D8C();
    if (sub_245BD8DB0())
    {
      sub_245BC4B08(0, &qword_2575129F8);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_245BCAF5C();
          v2 = v14;
        }
        result = sub_245BD8D14();
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
      while (sub_245BD8DB0());
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

uint64_t sub_245BCAF5C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257513030);
  v3 = sub_245BD8DEC();
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
      result = sub_245BD8D14();
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

unint64_t sub_245BCB1F8(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_245BD8D14();
  result = sub_245BD8D80();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_245BCB278(uint64_t a1, unint64_t a2, char a3)
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
    sub_245BCAF5C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_245BCB3FC();
      goto LABEL_14;
    }
    sub_245BCB5A4();
  }
  v8 = *v3;
  v9 = sub_245BD8D14();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_245BC4B08(0, &qword_2575129F8);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_245BD8D20();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_245BD8EE8();
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
        v15 = sub_245BD8D20();

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

id sub_245BCB3FC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257513030);
  v2 = *v0;
  v3 = sub_245BD8DE0();
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

uint64_t sub_245BCB5A4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257513030);
  v3 = sub_245BD8DEC();
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
    result = sub_245BD8D14();
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

uint64_t sub_245BCB81C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512FF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_245BCB85C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_245BCB8A4(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_245BD8E70();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_257513030);
      v3 = sub_245BD8E04();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_245BD8E70();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x249542EE4](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_245BD8D14();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return;
      }
      sub_245BC4B08(0, &qword_2575129F8);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_245BD8D20();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_245BD8D20();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
        v4 = v42;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      v1 = v40;
      v4 = v42;
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v39 = v1 + 32;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_245BD8D14();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_245BC4B08(0, &qword_2575129F8);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_245BD8D20();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_245BD8D20();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v42)
      return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t type metadata accessor for SESecureCaptureOpenApplicationAfterTransitionCompletionAction(uint64_t a1)
{
  return sub_245BC4B08(a1, &qword_257513028);
}

uint64_t sub_245BCBC14()
{
  return swift_release();
}

id sub_245BCBCF4()
{
  return sub_245BCC1E8(type metadata accessor for SecureCaptureSceneExtension);
}

uint64_t type metadata accessor for SecureCaptureSceneExtension()
{
  return objc_opt_self();
}

uint64_t sub_245BCBD20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_245BCBD28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

void sub_245BCBD94(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  id v12;
  id v13;
  _BYTE v14[24];
  uint64_t v15;

  v13 = objc_msgSend(a1, sel_clientSettings);
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (!v4)
    goto LABEL_9;
  v5 = (void *)v4;
  v6 = objc_msgSend(a2, sel_previousSettings);
  if (!v6)
    goto LABEL_9;
  v7 = v6;
  objc_opt_self();
  v8 = swift_dynamicCastObjCClass();
  if (!v8)
  {

LABEL_9:
    return;
  }
  v9 = (void *)v8;
  v10 = v2 + OBJC_IVAR____TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent_delegate;
  swift_beginAccess();
  sub_245BC4E4C(v10, (uint64_t)v14, &qword_2575130E8);
  if (v15)
  {
    sub_245BC4F10((uint64_t)v14, &qword_2575130E8);
    v11 = objc_msgSend(v5, sel_statusBarHidden);
    if (v11 != objc_msgSend(v9, sel_statusBarHidden))
    {
      v12 = objc_msgSend(a2, sel_transitionContext);

    }
  }
  else
  {

    sub_245BC4F10((uint64_t)v14, &qword_2575130E8);
  }
}

id sub_245BCBFC4()
{
  return sub_245BCC1E8(type metadata accessor for SecureCaptureSceneStatusBarHostComponent);
}

uint64_t type metadata accessor for SecureCaptureSceneStatusBarHostComponent()
{
  return objc_opt_self();
}

id sub_245BCC030(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id sub_245BCC06C()
{
  return sub_245BCC1E8(type metadata accessor for SecureCaptureSessionPathSettingsExtension);
}

uint64_t type metadata accessor for SecureCaptureSessionPathSettingsExtension()
{
  return objc_opt_self();
}

uint64_t sub_245BCC098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

id sub_245BCC118(char *a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(void))
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  v5 = &a1[*a3];
  v6 = (objc_class *)a4();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = a1;
  v8.super_class = v6;
  return objc_msgSendSuper2(&v8, sel_init);
}

id sub_245BCC17C(char *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t (*a5)(void))
{
  char *v7;
  objc_class *v8;
  objc_super v10;

  v7 = &a1[*a4];
  v8 = (objc_class *)a5();
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  v10.receiver = a1;
  v10.super_class = v8;
  return objc_msgSendSuper2(&v10, sel_initWithScene_, a3);
}

id sub_245BCC1DC()
{
  return sub_245BCC1E8(type metadata accessor for SecureCaptureSceneSessionPathHostComponent);
}

id sub_245BCC1E8(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SecureCaptureSceneSessionPathHostComponent()
{
  return objc_opt_self();
}

uint64_t sub_245BCC260(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575129E8);
  v10 = *(_QWORD *)(sub_245BD8984() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_245BD8E58();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_245BD8984() - 8);
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
    sub_245BCC574(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_245BCC468(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575130F8);
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
    sub_245BCC68C(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_245BCC574(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_245BD8984() - 8);
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
  result = sub_245BD8EA0();
  __break(1u);
  return result;
}

char *sub_245BCC68C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  result = (char *)sub_245BD8EA0();
  __break(1u);
  return result;
}

_QWORD *sub_245BCC774()
{
  NSString *v0;
  Class v1;
  uint64_t ObjCClassMetadata;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;

  v0 = (NSString *)sub_245BD8AF8();
  v1 = NSClassFromString(v0);

  if (v1)
  {
    ObjCClassMetadata = swift_getObjCClassMetadata();
    v3 = sub_245BCC468(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v5 = v3[2];
    v4 = v3[3];
    if (v5 >= v4 >> 1)
      v3 = sub_245BCC468((_QWORD *)(v4 > 1), v5 + 1, 1, v3);
    v3[2] = v5 + 1;
    v3[v5 + 4] = ObjCClassMetadata;
  }
  else
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_245BCC468(0, v3[2] + 1, 1, v3);
  v7 = v3[2];
  v6 = v3[3];
  v8 = v7 + 1;
  if (v7 >= v6 >> 1)
    v3 = sub_245BCC468((_QWORD *)(v6 > 1), v7 + 1, 1, v3);
  v9 = type metadata accessor for SecureCaptureSceneStatusBarHostComponent();
  v3[2] = v8;
  v3[v7 + 4] = v9;
  v10 = v3[3];
  v11 = v7 + 2;
  if (v11 > (uint64_t)(v10 >> 1))
    v3 = sub_245BCC468((_QWORD *)(v10 > 1), v11, 1, v3);
  v12 = type metadata accessor for SecureCaptureSceneSessionPathHostComponent();
  v3[2] = v11;
  v3[v8 + 4] = v12;
  return v3;
}

id sub_245BCC8E4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id *v8;
  id result;
  void *v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[5];

  v3 = v1 + OBJC_IVAR____TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent_delegate;
  swift_beginAccess();
  sub_245BC4E4C(v3, (uint64_t)&v14, &qword_2575130E8);
  if (!v15)
    return (id)sub_245BC4F10((uint64_t)&v14, &qword_2575130E8);
  sub_245BCCDF8(&v14, (uint64_t)v16);
  v4 = objc_msgSend(a1, sel_mutableSettings);
  if (v4)
  {
    v5 = v4;
    objc_opt_self();
    v6 = swift_dynamicCastObjCClass();
    if (!v6)
      goto LABEL_9;
    v7 = (void *)v6;
    v8 = (id *)(*__swift_project_boxed_opaque_existential_1(v16, v16[3])
              + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController);
    swift_beginAccess();
    if (!*v8)
      goto LABEL_9;
    result = objc_msgSend(*v8, sel_view);
    if (!result)
    {
      __break(1u);
      return result;
    }
    v10 = result;
    v11 = objc_msgSend(result, sel_window);

    v12 = objc_msgSend(v11, sel_windowScene);
    v13 = objc_msgSend(v12, sel_statusBarManager);

    if (v13)
    {
      objc_msgSend(v13, sel_defaultStatusBarHeightInOrientation_, 1);
      objc_msgSend(v7, sel_setDefaultStatusBarHeight_forOrientation_, 1);
      objc_msgSend(v13, sel_defaultStatusBarHeightInOrientation_, 4);
      objc_msgSend(v7, sel_setDefaultStatusBarHeight_forOrientation_, 4);
      objc_msgSend(v13, sel_defaultStatusBarHeightInOrientation_, 3);
      objc_msgSend(v7, sel_setDefaultStatusBarHeight_forOrientation_, 3);
      objc_msgSend(v13, sel_defaultStatusBarHeightInOrientation_, 2);
      objc_msgSend(v7, sel_setDefaultStatusBarHeight_forOrientation_, 2);

    }
    else
    {
LABEL_9:

    }
  }
  return (id)__swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
}

void sub_245BCCB10(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[24];
  uint64_t v25;
  void *v26;
  void *v27;

  v2 = v1;
  v4 = objc_msgSend(a1, sel_settings);
  if (v4)
  {
    v5 = v4;
    v27 = &unk_257522158;
    v6 = swift_dynamicCastObjCProtocolConditional();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(a1, sel_previousSettings);
      if (v8)
      {
        v9 = v8;
        v26 = &unk_257522158;
        v10 = swift_dynamicCastObjCProtocolConditional();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = objc_msgSend(v7, sel_captureSessionPath);
          v13 = objc_msgSend(v11, sel_captureSessionPath);
          v14 = v13;
          if (v12)
          {
            if (v13)
            {
              sub_245BCCDBC();
              v15 = v12;
              v16 = sub_245BD8D20();

              if ((v16 & 1) == 0)
              {
LABEL_16:
                v17 = v2 + OBJC_IVAR____TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent_delegate;
                swift_beginAccess();
                sub_245BC4E4C(v17, (uint64_t)v24, &qword_257513180);
                if (v25)
                {
                  sub_245BCCD34((uint64_t)v24, (uint64_t)v21);
                  sub_245BC4F10((uint64_t)v24, &qword_257513180);
                  v18 = v22;
                  v19 = v23;
                  __swift_project_boxed_opaque_existential_1(v21, v22);
                  v20 = objc_msgSend(v7, sel_captureSessionPath);
                  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v19 + 8))(v2, v20, v18, v19);

                  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
                }
                else
                {

                  sub_245BC4F10((uint64_t)v24, &qword_257513180);
                }
                return;
              }
LABEL_13:

              return;
            }
            v14 = v12;
          }
          else if (!v13)
          {
            goto LABEL_13;
          }

          goto LABEL_16;
        }

      }
    }

  }
}

uint64_t sub_245BCCD34(uint64_t a1, uint64_t a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_245BCCDBC()
{
  unint64_t result;

  result = qword_257512F20;
  if (!qword_257512F20)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257512F20);
  }
  return result;
}

uint64_t sub_245BCCDF8(__int128 *a1, uint64_t a2)
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

uint64_t PresentationMode.description.getter(unsigned int a1)
{
  uint64_t result;

  if (a1 < 3)
    return *(_QWORD *)&aNone[8 * a1];
  result = sub_245BD8EDC();
  __break(1u);
  return result;
}

unint64_t PresentationMode.init(rawValue:)(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = a1;
  v2 = 2;
  if (a1 != 2)
    v2 = 0;
  v3 = a1 != 2;
  if (a1 == 1)
    v3 = 0;
  else
    v1 = v2;
  if (!a1)
  {
    v1 = 0;
    v3 = 0;
  }
  return v1 | ((unint64_t)v3 << 32);
}

BOOL sub_245BCCEBC(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_245BCCED0()
{
  sub_245BD8F60();
  sub_245BD8F78();
  return sub_245BD8F84();
}

uint64_t sub_245BCCF14()
{
  return sub_245BD8F78();
}

uint64_t sub_245BCCF3C()
{
  sub_245BD8F60();
  sub_245BD8F78();
  return sub_245BD8F84();
}

int *sub_245BCCF7C@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  BOOL v3;

  v2 = *result;
  v3 = *result > 2;
  if (*result > 2)
    v2 = 0;
  *(_DWORD *)a2 = v2;
  *(_BYTE *)(a2 + 4) = v3;
  return result;
}

void sub_245BCCF98(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_245BCCFA4()
{
  unsigned int *v0;

  return PresentationMode.description.getter(*v0);
}

id sub_245BCCFAC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[6];

  v1 = OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector;
  v2 = *(void **)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD3E0]), sel_init);
    v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v10[4] = sub_245BD4DA4;
    v10[5] = v5;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 1107296256;
    v10[2] = sub_245BCD214;
    v10[3] = &block_descriptor_2;
    v6 = _Block_copy(v10);
    swift_release();
    objc_msgSend(v4, sel_observeIdleTimerDisabledWithBlock_, v6);
    _Block_release(v6);
    v7 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

void sub_245BCD0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _BYTE *v10;
  unsigned int v11;
  int v12;
  id v13;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x24954361C](v2);
  if (v3)
  {
    v4 = (id)v3;
    v5 = *(void **)(v3 + OBJC_IVAR___SESecureCaptureSceneViewController_scene);
    if (v5)
    {
      v6 = v5;

      v4 = objc_msgSend(v6, sel_clientSettings);
      if (!v4)
        return;
      objc_opt_self();
      v7 = swift_dynamicCastObjCClass();
      if (v7)
      {
        v8 = (void *)v7;
        swift_beginAccess();
        v9 = MEMORY[0x24954361C](v2);
        if (v9)
        {
          v10 = (_BYTE *)v9;
          v11 = objc_msgSend(v8, sel_idleTimerDisabled);
          v12 = v10[OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled];
          v10[OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled] = v11;
          if (v11 != v12)
          {
            v13 = objc_msgSend(v10, sel_delegate);
            if (v13)
            {
              objc_msgSend(v13, sel_secureCaptureSceneViewController_requestsIdleTimerDisabled_, v10, objc_msgSend(v10, sel_requestsIdleTimerDisabled));

              swift_unknownObjectRelease();
              return;
            }
          }

        }
      }
    }

  }
}

uint64_t sub_245BCD214(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_245BCD250()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *Serial;
  void *v6;
  id v7;

  v1 = OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue;
  v2 = *(void **)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue);
  }
  else
  {
    v4 = (void *)sub_245BD8AF8();
    Serial = (void *)BSDispatchQueueCreateSerial();

    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = Serial;
    v3 = Serial;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

void *SESecureCaptureSceneViewController._scene.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController_scene);
  v2 = v1;
  return v1;
}

uint64_t SESecureCaptureSceneViewController.presentationMode.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode);
}

void SESecureCaptureSceneViewController.presentationMode.setter(int a1)
{
  BSDispatchQueueAssertMain();
  sub_245BCD350(a1, 0);
}

void sub_245BCD350(int a1, char a2)
{
  char *v2;
  char *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __objc2_class *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  os_log_t v15;
  uint64_t v16;
  char *vtable;
  void *v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  os_log_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  LODWORD(v5) = a1;
  v6 = sub_245BD8A74();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  if ((v3[OBJC_IVAR___SESecureCaptureSceneViewController_invalidated] & 1) == 0)
  {
    v10 = &OBJC_METACLASS___SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
    if ((a2 & 1) != 0 || *(_DWORD *)&v3[OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode] != (_DWORD)v5)
    {
      if (qword_257512480 != -1)
        swift_once();
      v11 = __swift_project_value_buffer(v6, (uint64_t)qword_257513638);
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
      v12 = sub_245BD8A5C();
      v13 = sub_245BD8C84();
      if (os_log_type_enabled(v12, v13))
      {
        v28 = v12;
        v29 = v11;
        v14 = swift_slowAlloc();
        v27 = swift_slowAlloc();
        v31 = v27;
        *(_DWORD *)v14 = 136446466;
        if (v5 >= 3)
        {
LABEL_24:
          LODWORD(v30) = (_DWORD)v5;
          goto LABEL_25;
        }
        v30 = sub_245BD3434(*(_QWORD *)&aNone[8 * (int)v5], *(_QWORD *)&aLivesnap[8 * (int)v5 + 8], &v31);
        sub_245BD8D38();
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 12) = 1026;
        LODWORD(v30) = a2 & 1;
        sub_245BD8D38();
        v15 = v28;
        _os_log_impl(&dword_245BBC000, v28, v13, "Updating presentationMode to: %{public}s - (forced? %{BOOL,public}d).", (uint8_t *)v14, 0x12u);
        v16 = v27;
        swift_arrayDestroy();
        MEMORY[0x249543568](v16, -1, -1);
        MEMORY[0x249543568](v14, -1, -1);

        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        v10 = &OBJC_METACLASS___SESecureCaptureOpenApplicationAfterTransitionCompletionAction;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      }
      vtable = (char *)v10[6].vtable;
      *(_DWORD *)&vtable[(_QWORD)v3] = (_DWORD)v5;
      if (v5 < 2)
      {
        sub_245BCE73C(0, 1);
        sub_245BCF600((_DWORD)v5 == 1, 0, 0);
        return;
      }
      if ((_DWORD)v5 != 2)
      {
        LODWORD(v31) = (_DWORD)v5;
LABEL_25:
        sub_245BD8EDC();
        __break(1u);
        return;
      }
      v18 = *(void **)&v3[OBJC_IVAR___SESecureCaptureSceneViewController_scene];
      if (v18)
      {
        v5 = v18;
        if (objc_msgSend(v5, sel_contentState) != (id)2)
        {
          v24 = swift_allocObject();
          *(_QWORD *)(v24 + 16) = v3;
          v25 = v3;
          sub_245BCF600(1, sub_245BD4E90, v24);
          swift_release();

          return;
        }
        BSDispatchQueueAssertMain();
        if (*(_DWORD *)&vtable[(_QWORD)v3] == 2)
        {
          v19 = swift_allocObject();
          *(_QWORD *)(v19 + 16) = v3;
          v20 = v3;
          sub_245BCEAFC((uint64_t)sub_245BD4E98, v19);

          swift_release();
          return;
        }
        __break(1u);
        goto LABEL_24;
      }
      v21 = sub_245BD8A5C();
      v22 = sub_245BD8C78();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_245BBC000, v21, v22, "Snapshot failed because there is no scene found", v23, 2u);
        MEMORY[0x249543568](v23, -1, -1);
      }

    }
  }
}

void (*SESecureCaptureSceneViewController.presentationMode.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(v1 + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode);
  return sub_245BCD79C;
}

void sub_245BCD79C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8);
  BSDispatchQueueAssertMain();
  sub_245BCD350(v1, 0);
}

uint64_t SESecureCaptureSceneViewController.__presentationMode.getter()
{
  uint64_t v0;
  uint64_t result;

  result = *(unsigned int *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode);
  if (result >= 3)
  {
    result = sub_245BD8EDC();
    __break(1u);
  }
  return result;
}

void SESecureCaptureSceneViewController.__presentationMode.setter(uint64_t a1)
{
  int v1;

  if (a1 == 2)
    v1 = 2;
  else
    v1 = a1 == 1;
  BSDispatchQueueAssertMain();
  sub_245BCD350(v1, 0);
}

unint64_t sub_245BCD900(char a1)
{
  unint64_t result;

  result = 0xD00000000000001DLL;
  if (a1)
  {
    if (a1 == 1)
      return 0xD000000000000025;
    else
      return 0xD000000000000021;
  }
  return result;
}

unint64_t sub_245BCD960()
{
  char *v0;

  return sub_245BCD900(*v0);
}

uint64_t SESecureCaptureSceneViewController.requestsIdleTimerDisabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled);
}

uint64_t SESecureCaptureSceneViewController.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SESecureCaptureSceneViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x24954361C](v1);
}

uint64_t SESecureCaptureSceneViewController.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t SESecureCaptureSceneViewController.extensionProvider.getter()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t SESecureCaptureSceneViewController.extensionProvider.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___SESecureCaptureSceneViewController_extensionProvider);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

id SESecureCaptureSceneViewController.init(provider:)(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProvider_, a1);
  swift_unknownObjectRelease();
  return v1;
}

{
  void *v1;
  void *v3;
  id v4;

  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_245BD8E70())
    sub_245BCB8A4(MEMORY[0x24BEE4AF8]);
  sub_245BC4B08(0, &qword_2575129F8);
  sub_245BC49B4();
  v3 = (void *)sub_245BD8BF4();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v1, sel_initWithProvider_launchActions_, a1, v3);

  swift_unknownObjectRelease();
  return v4;
}

id SESecureCaptureSceneViewController.init(provider:launch:)(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_245BC4B08(0, &qword_2575129F8);
  sub_245BC49B4();
  v3 = (void *)sub_245BD8BF4();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithProvider_launchActions_, a1, v3);

  swift_unknownObjectRelease();
  return v4;
}

id SESecureCaptureSceneViewController.init(provider:launch:)(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  objc_super v6;

  *(_QWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_scene] = 0;
  v2[OBJC_IVAR___SESecureCaptureSceneViewController_sceneForeground] = 0;
  v2[OBJC_IVAR___SESecureCaptureSceneViewController_sceneActivated] = 0;
  v2[OBJC_IVAR___SESecureCaptureSceneViewController_invalidated] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_currentPath] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_assertion] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue] = 0;
  *(_DWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode] = 0;
  v2[OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_extensionProvider] = a1;
  *(_QWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_launchActions] = a2;
  v6.receiver = v2;
  v6.super_class = (Class)SESecureCaptureSceneViewController;
  return objc_msgSendSuper2(&v6, sel_initWithNibName_bundle_, 0, 0);
}

void __swiftcall SESecureCaptureSceneViewController.init(coder:)(SESecureCaptureSceneViewController_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

id sub_245BCE090(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (qword_257512480 != -1)
    swift_once();
  v2 = sub_245BD8A74();
  __swift_project_value_buffer(v2, (uint64_t)qword_257513638);
  v3 = sub_245BD8A5C();
  v4 = sub_245BD8C84();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_245BBC000, v3, v4, "Capture Extension scene dealloc", v5, 2u);
    MEMORY[0x249543568](v5, -1, -1);
  }

  return objc_msgSend(a1, sel_invalidate);
}

uint64_t sub_245BCE180(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  char isEscapingClosureAtFileLocation;

  sub_245BD8BAC();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    goto LABEL_6;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  a1();
  if (v2)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_6:
    sub_245BD8E10();
    sub_245BD8B28();
    sub_245BD8F90();
    sub_245BD8B28();
    swift_bridgeObjectRelease();
    sub_245BD8B28();
    result = sub_245BD8E64();
    __break(1u);
  }
  return result;
}

Swift::Bool __swiftcall SESecureCaptureSceneViewController._canShowWhileLocked()()
{
  return 1;
}

Swift::Void __swiftcall SESecureCaptureSceneViewController.viewDidLoad()()
{
  void *v0;
  objc_super v1;

  BSDispatchQueueAssertMain();
  v1.receiver = v0;
  v1.super_class = (Class)SESecureCaptureSceneViewController;
  objc_msgSendSuper2(&v1, sel_viewDidLoad);
  sub_245BCE4A8();
}

void sub_245BCE4A8()
{
  char *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  BSDispatchQueueAssertMain();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v2 = objc_msgSend(v1, sel_layer);
  v3 = (void *)sub_245BD8AF8();
  objc_msgSend(v2, sel_setName_, v3);

  v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  v5 = v4;
  objc_msgSend(v4, sel_bounds);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v1, sel_setFrame_, v7, v9, v11, v13);
  objc_msgSend(v1, sel_setClipsToBounds_, 1);
  objc_msgSend(v1, sel_setAutoresizingMask_, 18);
  v14 = objc_msgSend(v0, sel_view);
  if (!v14)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v15 = v14;
  objc_msgSend(v14, sel_addSubview_, v1);

  v16 = objc_msgSend(v0, sel_view);
  if (!v16)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v17 = v16;
  objc_msgSend(v16, sel_bringSubviewToFront_, v1);

  v18 = OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView;
  v19 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
  *(_QWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView] = v1;
  v25 = v1;

  BSDispatchQueueAssertMain();
  v20 = *(void **)&v0[v18];
  if (!v20)
  {
    v24 = v25;
    goto LABEL_8;
  }
  v21 = v20;
  v22 = objc_msgSend(v0, sel_view);
  if (v22)
  {
    v23 = v22;
    objc_msgSend(v22, sel_bringSubviewToFront_, v21);

    objc_msgSend(v21, sel_setAlpha_, 0.0);
    objc_msgSend(v21, sel_setHidden_, 1);

    v24 = v21;
LABEL_8:

    return;
  }
LABEL_12:
  __break(1u);
}

void sub_245BCE73C(char a1, char a2)
{
  char *v2;
  void *v5;
  int v6;
  id v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t aBlock;
  uint64_t v22;
  void *v23;
  void *v24;
  id (*v25)();
  uint64_t v26;

  BSDispatchQueueAssertMain();
  v5 = *(void **)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
  if (!v5)
    return;
  v20 = *(id *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
  if (a1 == 2)
  {
    v6 = objc_msgSend(v5, sel_isHidden);
    if ((a2 & 1) == 0)
      goto LABEL_4;
LABEL_9:
    v11 = (void *)objc_opt_self();
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v2;
    *(_QWORD *)(v12 + 24) = v20;
    *(_BYTE *)(v12 + 32) = v6;
    v25 = sub_245BD4E44;
    v26 = v12;
    v13 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v22 = 1107296256;
    v23 = sub_245BC6640;
    v24 = &block_descriptor_35;
    v14 = _Block_copy(&aBlock);
    v15 = v20;
    v16 = v2;
    swift_release();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v15;
    *(_BYTE *)(v17 + 24) = v6;
    v25 = sub_245BD4E74;
    v26 = v17;
    aBlock = v13;
    v22 = 1107296256;
    v23 = sub_245BCD214;
    v24 = &block_descriptor_41;
    v18 = _Block_copy(&aBlock);
    v19 = v15;
    swift_release();
    objc_msgSend(v11, sel_animateWithDuration_animations_completion_, v14, v18, 0.4);

    _Block_release(v18);
    _Block_release(v14);
    return;
  }
  v6 = a1 & 1;
  v10 = v5;
  if ((a2 & 1) != 0)
    goto LABEL_9;
LABEL_4:
  v7 = objc_msgSend(v2, sel_view);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, sel_bringSubviewToFront_, v20);

    v9 = 0.0;
    if (v6)
      v9 = 1.0;
    objc_msgSend(v20, sel_setAlpha_, v9);
    objc_msgSend(v20, sel_setHidden_, v6 ^ 1u);

  }
  else
  {
    __break(1u);
  }
}

id sub_245BCE984(void *a1, void *a2, char a3)
{
  id result;
  void *v6;
  double v7;

  result = objc_msgSend(a1, sel_view);
  if (result)
  {
    v6 = result;
    objc_msgSend(result, sel_bringSubviewToFront_, a2);

    v7 = 0.0;
    if ((a3 & 1) != 0)
      v7 = 1.0;
    return objc_msgSend(a2, sel_setAlpha_, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_245BCE9FC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unsigned int v6;
  id v7;
  char v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v5 = (uint64_t)a1;
  v6 = objc_msgSend(a1, sel_capture);
  if (v6)
    v7 = (id)v5;
  else
    v5 = 2;
  v8 = v6 ^ 1;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  *(_QWORD *)(v9 + 24) = a3;
  *(_QWORD *)(v9 + 32) = v5;
  *(_BYTE *)(v9 + 40) = v8;
  v11[4] = sub_245BD4F78;
  v11[5] = v9;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_245BC6640;
  v11[3] = &block_descriptor_62;
  v10 = _Block_copy(v11);
  swift_retain();
  sub_245BD4FA4((id)v5, v8);
  swift_release();
  BSDispatchMain();
  _Block_release(v10);
  sub_245BD4F6C((id)v5, v8);
}

void sub_245BCEAFC(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  id v12;
  char *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  const void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v5 = sub_245BD8AA4();
  v26 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_245BD8ABC();
  v8 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v2;
  v11[3] = a1;
  v11[4] = a2;
  v12 = v2;
  swift_retain_n();
  v13 = (char *)v12;
  BSDispatchQueueAssertMain();
  v14 = *(void **)&v13[OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter];
  if (v14 && (v15 = *(void **)&v13[OBJC_IVAR___SESecureCaptureSceneViewController_scene]) != 0)
  {
    swift_unknownObjectRetain();
    v24 = v15;
    if (objc_msgSend(v24, sel_contentState) == (id)2)
    {
      v16 = objc_msgSend(v14, sel_newSnapshot);
      v23 = sub_245BCD250();
      v17 = (_QWORD *)swift_allocObject();
      v17[2] = v16;
      v17[3] = sub_245BD4EA4;
      v17[4] = v11;
      aBlock[4] = sub_245BD4EE4;
      aBlock[5] = v17;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_245BC6640;
      aBlock[3] = &block_descriptor_56;
      v21 = _Block_copy(aBlock);
      v22 = v16;
      swift_retain();
      sub_245BD8AB0();
      v27 = MEMORY[0x24BEE4AF8];
      sub_245BC89D4((unint64_t *)&unk_257512EE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257513320);
      sub_245BD4EF0();
      sub_245BD8D68();
      v18 = v21;
      v19 = v23;
      MEMORY[0x249542D4C](0, v10, v7, v21);
      _Block_release(v18);

      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v5);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v25);
      swift_release();

      swift_release();
      swift_release();
    }
    else
    {
      sub_245BCEE64((void *)1, 1, v13, a1, a2);
      swift_release();

      swift_release();
      swift_unknownObjectRelease();

    }
  }
  else
  {
    sub_245BCEE64(0, 1, v13, a1, a2);
    swift_release();

    swift_release();
  }
}

void sub_245BCEE64(void *a1, char a2, void *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BYTE *v19;
  void *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t aBlock;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  void *v32;
  _QWORD *v33;

  if ((a2 & 1) != 0)
  {
    if (qword_257512480 != -1)
      swift_once();
    v12 = sub_245BD8A74();
    __swift_project_value_buffer(v12, (uint64_t)qword_257513638);
    v13 = sub_245BD8A5C();
    v14 = sub_245BD8C84();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      aBlock = v16;
      *(_DWORD *)v15 = 136315138;
      sub_245BD4FFC();
      v17 = sub_245BD8EB8();
      v27 = v16;
      if (v17)
      {
        v18 = (void *)v17;
      }
      else
      {
        v18 = (void *)swift_allocError();
        *v19 = (_BYTE)a1;
      }
      v20 = (void *)sub_245BD8948();

      v21 = objc_msgSend(v20, sel_localizedDescription);
      v22 = sub_245BD8B04();
      v24 = v23;

      sub_245BD3434(v22, v24, &aBlock);
      sub_245BD8D38();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245BBC000, v13, v14, "Snapshot failed - %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249543568](v27, -1, -1);
      MEMORY[0x249543568](v15, -1, -1);
    }

    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = a4;
    *(_QWORD *)(v25 + 24) = a5;
    *(_BYTE *)(v25 + 32) = (_BYTE)a1;
    v32 = sub_245BD4FD4;
    v33 = (_QWORD *)v25;
    aBlock = MEMORY[0x24BDAC760];
    v29 = 1107296256;
    v30 = sub_245BC6640;
    v31 = &block_descriptor_68;
    v26 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v26);
  }
  else
  {
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = a3;
    v9[3] = a1;
    v9[4] = a4;
    v9[5] = a5;
    v32 = sub_245BD5074;
    v33 = v9;
    aBlock = MEMORY[0x24BDAC760];
    v29 = 1107296256;
    v30 = sub_245BC6640;
    v31 = &block_descriptor_74;
    v10 = _Block_copy(&aBlock);
    sub_245BD4FA4(a1, 0);
    sub_245BD4FA4(a1, 0);
    v11 = a3;
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v10);
    sub_245BD4F6C(a1, 0);
  }
}

void sub_245BCF1B4(uint64_t a1, void *a2, void (*a3)(uint64_t))
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  if (*(_DWORD *)(a1 + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode) == 2)
  {
    if (qword_257512480 != -1)
      swift_once();
    v6 = sub_245BD8A74();
    __swift_project_value_buffer(v6, (uint64_t)qword_257513638);
    v7 = sub_245BD8A5C();
    v8 = sub_245BD8C84();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_245BBC000, v7, v8, "Snapshot success - Updating layer.", v9, 2u);
      MEMORY[0x249543568](v9, -1, -1);
    }

    v10 = objc_msgSend(a2, sel_IOSurface);
    if (!v10)
      v10 = objc_msgSend(a2, sel_fallbackIOSurface);
    v13 = v10;
    v11 = *(void **)(a1 + OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView);
    if (v11)
    {
      v12 = objc_msgSend(v11, sel_layer);
      objc_msgSend(v12, sel_setContents_, v13);

    }
    a3(3);

  }
}

void sub_245BCF35C(unsigned __int8 a1, char *a2)
{
  int v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  unsigned __int8 *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  v4 = a1;
  BSDispatchQueueAssertMain();
  if (v4 == 3)
  {
    BSDispatchQueueAssertMain();
    v5 = *(void **)&a2[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
    if (!v5)
    {
LABEL_13:
      sub_245BCF600(0, 0, 0);
      return;
    }
    v6 = v5;
    v7 = objc_msgSend(a2, sel_view);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, sel_bringSubviewToFront_, v6);

      objc_msgSend(v6, sel_setAlpha_, 1.0);
      objc_msgSend(v6, sel_setHidden_, 0);
LABEL_12:

      goto LABEL_13;
    }
    __break(1u);
  }
  else
  {
    if (qword_257512480 != -1)
      swift_once();
    v9 = sub_245BD8A74();
    __swift_project_value_buffer(v9, (uint64_t)qword_257513638);
    v10 = sub_245BD8A5C();
    v11 = sub_245BD8C78();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v12 = 138543362;
      sub_245BD4FFC();
      swift_allocError();
      *v14 = a1;
      v18 = _swift_stdlib_bridgeErrorToNSError();
      sub_245BD8D38();
      *v13 = v18;
      _os_log_impl(&dword_245BBC000, v10, v11, " Snapshot failed so backgrounding scene without updated snapshot: %{public}@", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257513188);
      swift_arrayDestroy();
      MEMORY[0x249543568](v13, -1, -1);
      MEMORY[0x249543568](v12, -1, -1);
    }

    BSDispatchQueueAssertMain();
    v15 = *(void **)&a2[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
    if (!v15)
      goto LABEL_13;
    v6 = v15;
    v16 = objc_msgSend(a2, sel_view);
    if (v16)
    {
      v17 = v16;
      objc_msgSend(v16, sel_bringSubviewToFront_, v6);

      objc_msgSend(v6, sel_setAlpha_, 0.0);
      objc_msgSend(v6, sel_setHidden_, 1);
      goto LABEL_12;
    }
  }
  __break(1u);
}

void sub_245BCF600(int a1, void *a2, uint64_t a3)
{
  char *v3;
  double v4;
  double v5;
  char *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  os_log_type_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t *v28;
  id v29;
  void *v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  _QWORD *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  id v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  char *v87;
  uint64_t v88;
  void *v89;
  char *v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  char *v95;
  uint64_t v96;
  id v97;
  id v98;
  id v99;
  _QWORD *v100;
  int v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t aBlock;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  _QWORD *v112;

  v6 = v3;
  v10 = sub_245BD8A74();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v96 - v15;
  BSDispatchQueueAssertMain();
  v17 = OBJC_IVAR___SESecureCaptureSceneViewController_scene;
  v18 = *(void **)&v3[OBJC_IVAR___SESecureCaptureSceneViewController_scene];
  if (!v18)
  {
    v100 = v14;
    v102 = v11;
    v103 = a2;
    v104 = a3;
    v105 = (void *)v10;
    v101 = a1;
    v16 = (char *)objc_msgSend(v3, sel_extensionProvider);
    v29 = objc_msgSend(v16, sel_processIdentity);
    if (qword_257512488 != -1)
      swift_once();
    v30 = (void *)qword_257513650;
    v31 = swift_allocObject();
    *(_QWORD *)(v31 + 16) = v29;
    v32 = (_QWORD *)swift_allocObject();
    v32[2] = sub_245BD5080;
    v32[3] = v31;
    v111 = sub_245BD5098;
    v112 = v32;
    aBlock = MEMORY[0x24BDAC760];
    v108 = 1107296256;
    v109 = sub_245BD33E8;
    v110 = &block_descriptor_83;
    v33 = _Block_copy(&aBlock);
    v34 = v30;
    v35 = v29;
    swift_retain();
    swift_release();
    v36 = objc_msgSend(v34, sel_createScene_, v33);

    _Block_release(v33);
    LOBYTE(v33) = swift_isEscapingClosureAtFileLocation();
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    if ((v33 & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      type metadata accessor for SecureCaptureSceneExtension();
      objc_msgSend(v36, sel_addExtension_, swift_getObjCClassFromMetadata());
      v37 = *(void **)&v6[v17];
      *(_QWORD *)&v6[v17] = v36;
      v16 = (char *)v36;

      objc_msgSend(v16, sel_setDelegate_, v6);
      v38 = objc_msgSend(v16, sel_layerManager);
      objc_msgSend(v38, sel_addObserver_, v6);

      v39 = objc_msgSend(v16, sel_uiPresentationManager);
      if (!v39)
        goto LABEL_22;
      v32 = v39;
      v40 = (void *)sub_245BD8AF8();
      v41 = objc_msgSend(v32, sel_createPresenterWithIdentifier_, v40);

      *(_QWORD *)&v6[OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter] = v41;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      v111 = sub_245BD0610;
      v112 = 0;
      v36 = (id)MEMORY[0x24BDAC760];
      aBlock = MEMORY[0x24BDAC760];
      v108 = 1107296256;
      v109 = sub_245BD5434;
      v110 = &block_descriptor_86;
      v42 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v41, sel_modifyPresentationContext_, v42);
      _Block_release(v42);
      if ((swift_isEscapingClosureAtFileLocation() & 1) == 0)
      {
        objc_msgSend(v41, sel_activate);
        v43 = objc_msgSend(v41, sel_presentationView);
        v44 = objc_msgSend(v43, sel_layer);
        objc_msgSend(v44, sel_setSecurityMode_, *MEMORY[0x24BDE5CD8]);

        v45 = *(void **)&v6[OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView];
        *(_QWORD *)&v6[OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView] = v43;
        v46 = v43;

        v47 = objc_msgSend(v6, sel_view);
        v17 = v102;
        if (v47)
        {
          v48 = v47;
          v99 = v41;
          objc_msgSend(v47, sel_addSubview_, v46);

          v49 = objc_msgSend(v6, sel_view);
          if (v49)
          {
            v50 = v49;
            objc_msgSend(v49, sel_setNeedsLayout);

            objc_msgSend(v46, sel_setClipsToBounds_, 1);
            v98 = v46;
            v51 = objc_msgSend(v46, sel_layer);
            v52 = (void *)sub_245BD8AF8();
            objc_msgSend(v51, sel_setName_, v52);

            v53 = objc_msgSend(v6, sel_view);
            if (v53)
            {
              v54 = v53;
              v55 = objc_msgSend(v53, sel_window);

              v34 = v105;
              v36 = (id)MEMORY[0x24BDAC760];
              v97 = v32;
              if (v55)
              {
                v56 = objc_msgSend(v55, sel_screen);

                objc_msgSend(v56, sel__referenceBounds);
                v4 = v57;
                v5 = v58;

                goto LABEL_34;
              }
              v70 = objc_msgSend(v6, sel_view);
              if (v70)
              {
                v71 = v70;
                objc_msgSend(v70, sel_bounds);
                v5 = v72;
                v74 = v73;

                if (v74 >= v5)
                  v4 = v5;
                else
                  v4 = v74;
                if (v5 <= v74)
                  v5 = v74;
LABEL_34:
                v32 = v100;
                objc_msgSend(v6, sel_setPreferredContentSize_, v4, v5);
                if (qword_257512480 == -1)
                {
LABEL_35:
                  v75 = __swift_project_value_buffer((uint64_t)v34, (uint64_t)qword_257513638);
                  (*(void (**)(_QWORD *, uint64_t, id))(v17 + 16))(v32, v75, v34);
                  v76 = sub_245BD8A5C();
                  v77 = sub_245BD8C84();
                  if (os_log_type_enabled(v76, v77))
                  {
                    v78 = (uint8_t *)swift_slowAlloc();
                    v79 = swift_slowAlloc();
                    *(_DWORD *)v78 = 136446210;
                    aBlock = v79;
                    v80 = v101;
                    if ((v101 & 1) != 0)
                      v81 = 0x756F726765726F66;
                    else
                      v81 = 0x756F72676B636162;
                    v106 = sub_245BD3434(v81, 0xEA0000000000646ELL, &aBlock);
                    sub_245BD8D38();
                    swift_bridgeObjectRelease();
                    _os_log_impl(&dword_245BBC000, v76, v77, "Creating capture scene to %{public}s.", v78, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x249543568](v79, -1, -1);
                    v82 = v78;
                    v36 = (id)MEMORY[0x24BDAC760];
                    MEMORY[0x249543568](v82, -1, -1);

                    (*(void (**)(_QWORD *, void *))(v102 + 8))(v32, v105);
                    v83 = (uint64_t)v103;
                  }
                  else
                  {

                    (*(void (**)(_QWORD *, id))(v17 + 8))(v32, v34);
                    v83 = (uint64_t)v103;
                    v80 = v101;
                  }
                  v84 = swift_allocObject();
                  *(double *)(v84 + 16) = v4;
                  *(double *)(v84 + 24) = v5;
                  *(_QWORD *)(v84 + 32) = v6;
                  v66 = v80 & 1;
                  *(_BYTE *)(v84 + 40) = v66;
                  v85 = swift_allocObject();
                  *(_QWORD *)(v85 + 16) = sub_245BD50B8;
                  *(_QWORD *)(v85 + 24) = v84;
                  v111 = sub_245BD5430;
                  v112 = (_QWORD *)v85;
                  aBlock = (uint64_t)v36;
                  v108 = 1107296256;
                  v109 = sub_245BD5434;
                  v110 = &block_descriptor_95;
                  v86 = _Block_copy(&aBlock);
                  v87 = v6;
                  swift_retain();
                  swift_release();
                  objc_msgSend(v16, sel_configureParameters_, v86);
                  _Block_release(v86);
                  LOBYTE(v86) = swift_isEscapingClosureAtFileLocation();
                  swift_release();
                  if ((v86 & 1) != 0)
                  {
                    __break(1u);
                  }
                  else
                  {
                    v88 = swift_allocObject();
                    *(_BYTE *)(v88 + 16) = v66;
                    *(_QWORD *)(v88 + 24) = v87;
                    v66 = swift_allocObject();
                    *(_QWORD *)(v66 + 16) = sub_245BD50FC;
                    *(_QWORD *)(v66 + 24) = v88;
                    v111 = sub_245BD5098;
                    v112 = (_QWORD *)v66;
                    aBlock = (uint64_t)v36;
                    v108 = 1107296256;
                    v109 = sub_245BD055C;
                    v110 = &block_descriptor_104;
                    v89 = _Block_copy(&aBlock);
                    v90 = v87;
                    swift_retain();
                    swift_release();
                    v91 = (_QWORD *)swift_allocObject();
                    v92 = (uint64_t)v36;
                    v93 = v104;
                    v91[2] = v83;
                    v91[3] = v93;
                    v91[4] = v90;
                    v91[5] = v16;
                    v111 = sub_245BD5154;
                    v112 = v91;
                    aBlock = v92;
                    v108 = 1107296256;
                    v109 = sub_245BD05B0;
                    v110 = &block_descriptor_110;
                    v94 = _Block_copy(&aBlock);
                    sub_245BD5160(v83);
                    v16 = v16;
                    v95 = v90;
                    swift_release();
                    objc_msgSend(v16, sel_performUpdate_withCompletion_, v89, v94);

                    swift_unknownObjectRelease();
                    _Block_release(v94);
                    _Block_release(v89);
                    LOBYTE(v94) = swift_isEscapingClosureAtFileLocation();
                    swift_release();
                    swift_release();
                    swift_release();
                    if ((v94 & 1) == 0)
                      return;
                  }
                  __break(1u);
                  goto LABEL_49;
                }
LABEL_46:
                swift_once();
                goto LABEL_35;
              }
LABEL_53:
              __break(1u);
              return;
            }
LABEL_52:
            __break(1u);
            goto LABEL_53;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_52;
      }
    }
    __break(1u);
    goto LABEL_46;
  }
  v19 = qword_257512480;
  v103 = v18;
  if (v19 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v10, (uint64_t)qword_257513638);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v20, v10);
  v21 = sub_245BD8A5C();
  v22 = v11;
  v23 = sub_245BD8C84();
  if (os_log_type_enabled(v21, v23))
  {
    v105 = (void *)v10;
    v24 = swift_slowAlloc();
    v104 = a3;
    v25 = (uint8_t *)v24;
    v26 = swift_slowAlloc();
    *(_DWORD *)v25 = 136446210;
    aBlock = v26;
    if ((a1 & 1) != 0)
      v27 = 0x756F726765726F66;
    else
      v27 = 0x756F72676B636162;
    v106 = sub_245BD3434(v27, 0xEA0000000000646ELL, &aBlock);
    sub_245BD8D38();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245BBC000, v21, v23, "Updating capture extension scene to %{public}s.", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249543568](v26, -1, -1);
    v28 = v25;
    a3 = v104;
    MEMORY[0x249543568](v28, -1, -1);

    (*(void (**)(char *, void *))(v22 + 8))(v16, v105);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v22 + 8))(v16, v10);
  }
  v59 = swift_allocObject();
  *(_BYTE *)(v59 + 16) = a1 & 1;
  v60 = swift_allocObject();
  *(_QWORD *)(v60 + 16) = sub_245BD5180;
  *(_QWORD *)(v60 + 24) = v59;
  v111 = sub_245BD5430;
  v112 = (_QWORD *)v60;
  v61 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v108 = 1107296256;
  v109 = sub_245BD055C;
  v110 = &block_descriptor_120;
  v62 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v63 = swift_allocObject();
  *(_QWORD *)(v63 + 16) = a2;
  *(_QWORD *)(v63 + 24) = a3;
  v111 = sub_245BD51CC;
  v112 = (_QWORD *)v63;
  aBlock = v61;
  v108 = 1107296256;
  v109 = sub_245BD05B0;
  v110 = &block_descriptor_126;
  v64 = _Block_copy(&aBlock);
  sub_245BD5160((uint64_t)a2);
  swift_release();
  v65 = v103;
  objc_msgSend(v103, sel_performUpdate_withCompletion_, v62, v64);

  _Block_release(v64);
  _Block_release(v62);
  LOBYTE(v62) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v62 & 1) != 0)
  {
    __break(1u);
LABEL_22:
    v66 = (uint64_t)v103;
    if (qword_257512480 == -1)
    {
LABEL_23:
      __swift_project_value_buffer((uint64_t)v105, (uint64_t)qword_257513638);
      v67 = sub_245BD8A5C();
      v68 = sub_245BD8C78();
      if (os_log_type_enabled(v67, v68))
      {
        v69 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v69 = 0;
        _os_log_impl(&dword_245BBC000, v67, v68, "Can't find the UI presentation manager", v69, 2u);
        MEMORY[0x249543568](v69, -1, -1);
      }

      if (v66)
        ((void (*)(void))v66)();

      return;
    }
LABEL_49:
    swift_once();
    goto LABEL_23;
  }
}

void sub_245BD043C(void *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[6];

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = a1;
  v5[4] = sub_245BD525C;
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_245BC6640;
  v5[3] = &block_descriptor_141;
  v3 = _Block_copy(v5);
  v4 = a1;
  swift_release();
  BSDispatchMain();
  _Block_release(v3);
}

uint64_t sub_245BD04E4(char *a1)
{
  uint64_t result;
  uint64_t v3;
  char *v4;

  result = BSDispatchQueueAssertMain();
  if (*(_DWORD *)&a1[OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode] == 2)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = a1;
    v4 = a1;
    sub_245BCEAFC((uint64_t)sub_245BD5380, v3);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_245BD055C(uint64_t a1, void *a2, void *a3)
{
  void (*v4)(id, id);
  id v5;
  id v6;

  v4 = *(void (**)(id, id))(a1 + 32);
  v6 = a2;
  v5 = a3;
  v4(v6, v5);

}

void sub_245BD05B0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

id sub_245BD0610(void *a1)
{
  objc_msgSend(a1, sel_setPresentedLayerTypes_, 26);
  objc_msgSend(a1, sel_setAppearanceStyle_, 2);
  objc_msgSend(a1, sel_setBackgroundColorWhileHosting_, 0);
  objc_msgSend(a1, sel_setBackgroundColorWhileNotHosting_, 0);
  objc_msgSend(a1, sel_setInheritsSecurity_, 1);
  return objc_msgSend(a1, sel_setResizesHostedContext_, 1);
}

uint64_t sub_245BD069C(void *a1, void *a2, char a3, double a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t result;
  _QWORD v15[6];

  v10 = swift_allocObject();
  *(double *)(v10 + 16) = a4;
  *(double *)(v10 + 24) = a5;
  *(_QWORD *)(v10 + 32) = a2;
  *(_BYTE *)(v10 + 40) = a3;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_245BD5218;
  *(_QWORD *)(v11 + 24) = v10;
  v15[4] = sub_245BD5430;
  v15[5] = v11;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1107296256;
  v15[2] = sub_245BD0B20;
  v15[3] = &block_descriptor_135;
  v12 = _Block_copy(v15);
  v13 = a2;
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_updateSettingsWithBlock_, v12);
  _Block_release(v12);
  LOBYTE(a1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a1 & 1) != 0)
    __break(1u);
  return result;
}

void sub_245BD07E4(void *a1, void *a2, char a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  NSObject *v22;

  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  if (!v6)
  {
    if (qword_257512480 != -1)
      swift_once();
    v19 = sub_245BD8A74();
    __swift_project_value_buffer(v19, (uint64_t)qword_257513638);
    v22 = sub_245BD8A5C();
    v20 = sub_245BD8C78();
    if (os_log_type_enabled(v22, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_245BBC000, v22, v20, "Can't update Capture Extension mutable scene settings.", v21, 2u);
      MEMORY[0x249543568](v21, -1, -1);
    }
    goto LABEL_11;
  }
  v7 = (void *)v6;
  v8 = a1;
  BSRectWithSize();
  objc_msgSend(v7, sel_setFrame_);
  v22 = v8;
  objc_msgSend(v7, sel_setInterfaceOrientation_, objc_msgSend(a2, sel_interfaceOrientation));

  objc_msgSend(v7, sel_setInterfaceOrientationMode_, 1);
  v9 = objc_msgSend((id)objc_opt_self(), sel_mainConfiguration);
  objc_msgSend(v7, sel_setDisplayConfiguration_, v9);

  objc_msgSend(v7, sel_setForeground_, a3 & 1);
  objc_msgSend(v7, sel_setActivityMode_, 0);
  v10 = objc_msgSend(a2, sel_traitCollection);
  v11 = objc_msgSend(v10, sel_userInterfaceStyle);

  objc_msgSend(v7, sel_setUserInterfaceStyle_, v11);
  v12 = objc_msgSend(v7, sel_otherSettings);
  v13 = (void *)sub_245BD8AF8();
  objc_msgSend(v12, sel_setObject_forSetting_, v13, 20211529);

  v14 = objc_msgSend(a2, sel_view);
  if (v14)
  {
    v15 = v14;
    v16 = objc_msgSend(v14, sel_window);

    if (v16)
    {
      v17 = objc_msgSend(v16, sel_windowScene);

      if (v17)
      {
        v18 = objc_msgSend(v17, sel_statusBarManager);

        if (v18)
        {
          objc_msgSend(v18, sel_defaultStatusBarHeightInOrientation_, 1);
          objc_msgSend(v7, sel_setDefaultStatusBarHeight_forOrientation_, 1);

        }
      }
    }
LABEL_11:

    return;
  }
  __break(1u);
}

void sub_245BD0B20(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

void sub_245BD0B54(uint64_t a1, void *a2, char a3, char *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint8_t *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)&a4[OBJC_IVAR___SESecureCaptureSceneViewController_launchActions];
    if ((v6 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      v7 = sub_245BD8D98();
      swift_bridgeObjectRelease();
      if (!v7)
        return;
    }
    else if (!*(_QWORD *)(v6 + 16))
    {
      return;
    }
    if (qword_257512480 != -1)
      swift_once();
    v8 = sub_245BD8A74();
    __swift_project_value_buffer(v8, (uint64_t)qword_257513638);
    v9 = a4;
    v10 = sub_245BD8A5C();
    v11 = sub_245BD8C84();
    if (os_log_type_enabled(v10, v11))
    {
      v19 = a2;
      v12 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v20 = v18;
      *(_DWORD *)v12 = 136315138;
      sub_245BC4B08(0, &qword_2575129F8);
      sub_245BC49B4();
      swift_bridgeObjectRetain();
      v13 = sub_245BD8C18();
      v15 = v14;
      swift_bridgeObjectRelease();
      sub_245BD3434(v13, v15, &v20);
      sub_245BD8D38();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245BBC000, v10, v11, "Setting transition context with launch actions: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249543568](v18, -1, -1);
      v16 = v12;
      a2 = v19;
      MEMORY[0x249543568](v16, -1, -1);

    }
    else
    {

    }
    sub_245BC4B08(0, &qword_2575129F8);
    sub_245BC49B4();
    swift_bridgeObjectRetain();
    v17 = (void *)sub_245BD8BF4();
    swift_bridgeObjectRelease();
    objc_msgSend(a2, sel_setActions_, v17);

  }
}

id sub_245BD0DFC(int a1, int a2, void (*a3)(void), int a4, id a5, uint64_t a6)
{
  id result;

  if (a3)
    a3();
  result = objc_msgSend(a5, sel_delegate);
  if (result)
  {
    objc_msgSend(result, sel_secureCaptureSceneViewController_didCreateScene_, a5, a6);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void sub_245BD0E78()
{
  _BYTE *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  BSDispatchQueueAssertMain();
  v1 = OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter;
  v2 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter];
  if (v2)
    objc_msgSend(v2, sel_invalidate);
  *(_QWORD *)&v0[v1] = 0;
  swift_unknownObjectRelease();
  v0[OBJC_IVAR___SESecureCaptureSceneViewController_sceneForeground] = 0;
  v3 = OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView;
  v4 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView];
  if (v4)
  {
    objc_msgSend(v4, sel_removeFromSuperview);
    v5 = *(void **)&v0[v3];
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)&v0[v3] = 0;

  v6 = OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView;
  v7 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView];
  if (v7)
  {
    objc_msgSend(v7, sel_removeFromSuperview);
    v8 = *(void **)&v0[v6];
  }
  else
  {
    v8 = 0;
  }
  *(_QWORD *)&v0[v6] = 0;

  v9 = OBJC_IVAR___SESecureCaptureSceneViewController_scene;
  v10 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_scene];
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v11, sel_layerManager);
    objc_msgSend(v12, sel_remove_, v0);

    objc_msgSend(v11, sel_invalidate);
    objc_msgSend(v11, sel_setDelegate_, 0);
    v13 = *(void **)&v0[v9];
    *(_QWORD *)&v0[v9] = 0;

    v14 = objc_msgSend(v0, sel_delegate);
    if (v14)
    {
      objc_msgSend(v14, sel_secureCaptureSceneViewController_didDestroyScene_, v0, v11);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_245BD8E70())
    sub_245BCB8A4(MEMORY[0x24BEE4AF8]);
  else
    v15 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_launchActions] = v15;
  swift_bridgeObjectRelease();
  v16 = OBJC_IVAR___SESecureCaptureSceneViewController_assertion;
  v17 = *(void **)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_assertion];
  if (v17)
  {
    objc_msgSend(v17, sel_invalidate);
    v18 = *(void **)&v0[v16];
  }
  else
  {
    v18 = 0;
  }
  *(_QWORD *)&v0[v16] = 0;

  v0[OBJC_IVAR___SESecureCaptureSceneViewController_invalidated] = 1;
}

Swift::Void __swiftcall SESecureCaptureSceneViewController.invalidate()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = v0;
  BSDispatchQueueAssertMain();
  v2 = OBJC_IVAR___SESecureCaptureSceneViewController_invalidated;
  if ((*(_BYTE *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController_invalidated) & 1) == 0)
  {
    if (qword_257512480 != -1)
      swift_once();
    v3 = sub_245BD8A74();
    __swift_project_value_buffer(v3, (uint64_t)qword_257513638);
    v4 = sub_245BD8A5C();
    v5 = sub_245BD8C84();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_245BBC000, v4, v5, "Capture Extension Scene Invalidated", v6, 2u);
      MEMORY[0x249543568](v6, -1, -1);
    }

    *(_BYTE *)(v1 + v2) = 1;
    sub_245BD0E78();
  }
}

void __swiftcall SESecureCaptureSceneViewController.init(nibName:bundle:)(SESecureCaptureSceneViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa;
  void *v4;

  isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    v4 = (void *)sub_245BD8AF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);

}

void SESecureCaptureSceneViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245BD1288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  sub_245BD8BB8();
  v5[4] = sub_245BD8BAC();
  sub_245BD8B88();
  return swift_task_switch();
}

uint64_t sub_245BD12F4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16);
  swift_release();
  v3 = *(void **)(v2 + OBJC_IVAR___SESecureCaptureSceneViewController_currentPath);
  *(_QWORD *)(v2 + OBJC_IVAR___SESecureCaptureSceneViewController_currentPath) = v1;
  v4 = v1;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245BD1348(uint64_t a1, void *a2)
{
  void **v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512498);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  v8 = sub_245BD8BD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  sub_245BD8BB8();
  v9 = a2;
  v10 = v7;
  v11 = sub_245BD8BAC();
  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v10;
  v12[5] = a2;
  sub_245BBE86C((uint64_t)v6, (uint64_t)&unk_2575132F8, (uint64_t)v12);
  return swift_release();
}

void sub_245BD142C(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  _BOOL4 v22;
  uint64_t v23;
  uint8_t *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  NSObject *v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  unsigned int v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  char *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  uint8_t *v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  char *v72;
  uint64_t aBlock;
  unint64_t v74;
  void (*v75)(uint64_t, void *, void *);
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v3 = v2;
  v6 = sub_245BD89C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR___SESecureCaptureSceneViewController_assertion;
  if (!*(_QWORD *)&v2[OBJC_IVAR___SESecureCaptureSceneViewController_assertion])
  {
    v11 = objc_msgSend(v2, sel__scene);
    if (v11
      && (v12 = v11,
          v13 = objc_msgSend(v11, sel_clientHandle),
          v12,
          v13)
      && (v14 = objc_msgSend(v13, sel_processHandle), v13, v14)
      && (v15 = (char *)objc_msgSend(v14, sel_identity), v14, v15))
    {
      v69 = a2;
      v70 = a1;
      if (qword_257512480 != -1)
        swift_once();
      v16 = sub_245BD8A74();
      v17 = __swift_project_value_buffer(v16, (uint64_t)qword_257513638);
      v18 = v3;
      v68 = v17;
      v19 = sub_245BD8A5C();
      v20 = sub_245BD8C84();
      v21 = v20;
      v71 = v19;
      v22 = os_log_type_enabled(v19, v20);
      v72 = v15;
      if (v22)
      {
        v23 = swift_slowAlloc();
        v66 = v21;
        v24 = (uint8_t *)v23;
        v67 = swift_slowAlloc();
        aBlock = v67;
        *(_DWORD *)v24 = 136315138;
        v65 = v24;
        v25 = objc_msgSend(objc_msgSend(v18, sel_extensionProvider, v24 + 4), sel_bundleIdentifier);
        swift_unknownObjectRelease();
        v26 = sub_245BD8B04();
        v28 = v27;

        v79 = sub_245BD3434(v26, v28, &aBlock);
        v15 = v72;
        sub_245BD8D38();

        swift_bridgeObjectRelease();
        v29 = v71;
        v30 = v65;
        _os_log_impl(&dword_245BBC000, v71, (os_log_type_t)v66, "Acquiring secure capture process assertion for bundle identifier: %s", v65, 0xCu);
        v31 = v67;
        swift_arrayDestroy();
        MEMORY[0x249543568](v31, -1, -1);
        MEMORY[0x249543568](v30, -1, -1);

      }
      else
      {

      }
      v41 = objc_msgSend((id)objc_opt_self(), sel_targetWithProcessIdentity_, v15);
      v79 = MEMORY[0x24BEE4AF8];
      sub_245BD89B4();
      aBlock = 0;
      v74 = 0xE000000000000000;
      sub_245BD8E10();
      swift_bridgeObjectRelease();
      aBlock = 0xD000000000000018;
      v74 = 0x8000000245BDB420;
      sub_245BC89D4(&qword_257513300, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      sub_245BD8EAC();
      sub_245BD8B28();
      swift_bridgeObjectRelease();
      v42 = (void *)sub_245BD8AF8();
      swift_bridgeObjectRelease();
      v43 = (void *)objc_opt_self();
      v44 = objc_msgSend(v43, sel_attributeWithTag_, v42);

      MEMORY[0x249542BFC]();
      if (*(_QWORD *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_245BD8B70();
      sub_245BD8B7C();
      sub_245BD8B64();
      sub_245BBF018((uint64_t)&unk_2516D8458);
      v45 = (void *)sub_245BD8AC8();
      swift_bridgeObjectRelease();
      v46 = MKBGetDeviceLockState();

      if (v46 > 6 || ((1 << v46) & 0x46) == 0)
      {
        v47 = sub_245BD8A5C();
        v48 = sub_245BD8C84();
        if (os_log_type_enabled(v47, v48))
        {
          v49 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v49 = 0;
          _os_log_impl(&dword_245BBC000, v47, v48, "Adding unlocked attribute tag for the process assertion", v49, 2u);
          MEMORY[0x249543568](v49, -1, -1);
        }

        v50 = (void *)sub_245BD8AF8();
        v51 = objc_msgSend(v43, sel_attributeWithTag_, v50);

        MEMORY[0x249542BFC]();
        if (*(_QWORD *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_245BD8B70();
        sub_245BD8B7C();
        sub_245BD8B64();
      }
      v52 = objc_allocWithZone(MEMORY[0x24BE80B10]);
      v53 = v41;
      v54 = (void *)sub_245BD8AF8();
      sub_245BC4B08(0, &qword_257513308);
      v55 = (void *)sub_245BD8B4C();
      swift_bridgeObjectRelease();
      v56 = objc_msgSend(v52, sel_initWithExplanation_target_attributes_, v54, v53, v55);

      v57 = *(void **)&v3[v10];
      *(_QWORD *)&v3[v10] = v56;

      v58 = *(void **)&v3[v10];
      if (v58)
      {
        v59 = v70;
        v60 = v72;
        if (v70)
        {
          v77 = v70;
          v78 = v69;
          aBlock = MEMORY[0x24BDAC760];
          v74 = 1107296256;
          v75 = sub_245BD1CF4;
          v76 = &block_descriptor_29;
          v61 = _Block_copy(&aBlock);
          v62 = v58;
          sub_245BD5160(v59);
          swift_release();
        }
        else
        {
          v63 = v58;
          v61 = 0;
        }
        objc_msgSend(v58, sel_acquireWithInvalidationHandler_, v61);
        _Block_release(v61);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    else
    {
      if (qword_257512480 != -1)
        swift_once();
      v32 = sub_245BD8A74();
      __swift_project_value_buffer(v32, (uint64_t)qword_257513638);
      v72 = v3;
      v33 = sub_245BD8A5C();
      v34 = sub_245BD8C78();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        v36 = swift_slowAlloc();
        aBlock = v36;
        *(_DWORD *)v35 = 136315138;
        v37 = objc_msgSend(objc_msgSend(v72, sel_extensionProvider), sel_bundleIdentifier);
        swift_unknownObjectRelease();
        v38 = sub_245BD8B04();
        v40 = v39;

        v79 = sub_245BD3434(v38, v40, &aBlock);
        sub_245BD8D38();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_245BBC000, v33, v34, "Failed to acquire secure capture process assertion for bundle identifier: %s, no process identity found for the scene", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249543568](v36, -1, -1);
        MEMORY[0x249543568](v35, -1, -1);

      }
      else
      {

      }
    }
  }
}

void sub_245BD1CF4(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, void *);
  id v6;
  id v7;

  v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, a3);
  swift_release();

}

id SESecureCaptureSceneViewController.sceneDidActivate(_:)(void *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t ObjCClassFromMetadata;
  id result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _QWORD v14[5];

  v2 = v1;
  if (qword_257512480 != -1)
    swift_once();
  v4 = sub_245BD8A74();
  __swift_project_value_buffer(v4, (uint64_t)qword_257513638);
  v5 = sub_245BD8A5C();
  v6 = sub_245BD8C84();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_245BBC000, v5, v6, "Capture Scene did activate.", v7, 2u);
    MEMORY[0x249543568](v7, -1, -1);
  }

  v2[OBJC_IVAR___SESecureCaptureSceneViewController_sceneActivated] = 1;
  type metadata accessor for SecureCaptureSceneExtension();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  type metadata accessor for SecureCaptureSceneSessionPathHostComponent();
  result = objc_msgSend(a1, sel_componentForExtension_ofClass_, ObjCClassFromMetadata, swift_getObjCClassFromMetadata());
  if (result)
  {
    v10 = swift_dynamicCastClass();
    if (v10)
    {
      v11 = v10;
      v14[3] = type metadata accessor for SESecureCaptureSceneViewController(v10);
      v14[4] = &off_2516D8E70;
      v14[0] = v2;
      v12 = v11 + OBJC_IVAR____TtC16SecureCaptureKit42SecureCaptureSceneSessionPathHostComponent_delegate;
      swift_beginAccess();
      swift_unknownObjectRetain();
      v13 = v2;
      sub_245BD3B94((uint64_t)v14, v12);
      swift_endAccess();
      return (id)swift_unknownObjectRelease_n();
    }
    else
    {
      return (id)swift_unknownObjectRelease();
    }
  }
  return result;
}

id SESecureCaptureSceneViewController.sceneDidDeactivate(_:withError:)(void *a1, id a2)
{
  char *v2;
  char *v3;
  _QWORD *v5;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v50;

  v3 = v2;
  v2[OBJC_IVAR___SESecureCaptureSceneViewController_sceneActivated] = 0;
  v5 = &unk_257512000;
  if (a2)
  {
    v7 = a2;
    if (qword_257512480 != -1)
      swift_once();
    v8 = sub_245BD8A74();
    __swift_project_value_buffer(v8, (uint64_t)qword_257513638);
    v9 = a2;
    v10 = a2;
    v11 = sub_245BD8A5C();
    v12 = sub_245BD8C84();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v50 = v14;
      *(_DWORD *)v13 = 136446210;
      swift_getErrorValue();
      v15 = sub_245BD8F18();
      sub_245BD3434(v15, v16, &v50);
      v5 = (_QWORD *)&unk_257512000;
      sub_245BD8D38();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_245BBC000, v11, v12, "Capture Scene did deactivate with error: %{public}s.", v13, 0xCu);
      swift_arrayDestroy();
      v17 = v14;
      v3 = v2;
      MEMORY[0x249543568](v17, -1, -1);
      MEMORY[0x249543568](v13, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    if (qword_257512480 != -1)
      swift_once();
    v18 = sub_245BD8A74();
    __swift_project_value_buffer(v18, (uint64_t)qword_257513638);
    v19 = sub_245BD8A5C();
    v20 = sub_245BD8C84();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_245BBC000, v19, v20, "Capture Scene did deactivate.", v21, 2u);
      MEMORY[0x249543568](v21, -1, -1);
    }

  }
  if (*(_QWORD *)&v3[OBJC_IVAR___SESecureCaptureSceneViewController_scene])
  {
    v22 = *(void **)&v3[OBJC_IVAR___SESecureCaptureSceneViewController_currentPath];
    if (v22)
    {
      v23 = v22;
      v24 = objc_msgSend(v23, sel_finalizeTemporarySessionPathForExtension_, objc_msgSend(v3, sel_extensionProvider));

      swift_unknownObjectRelease();
      v25 = v5[144];
      if (v24)
      {
        if (v25 != -1)
          swift_once();
        v26 = sub_245BD8A74();
        __swift_project_value_buffer(v26, (uint64_t)qword_257513638);
        v27 = v23;
        v28 = sub_245BD8A5C();
        v29 = sub_245BD8C60();
        if (os_log_type_enabled(v28, v29))
        {
          v30 = (uint8_t *)swift_slowAlloc();
          v31 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v30 = 138412290;
          v50 = (uint64_t)v27;
          v32 = v27;
          sub_245BD8D38();
          *v31 = v22;

          v33 = "Finalized path %@";
LABEL_33:
          _os_log_impl(&dword_245BBC000, v28, v29, v33, v30, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_257513188);
          swift_arrayDestroy();
          MEMORY[0x249543568](v31, -1, -1);
          MEMORY[0x249543568](v30, -1, -1);

          return sub_245BD2798(v3, (uint64_t)a1);
        }
      }
      else
      {
        if (v25 != -1)
          swift_once();
        v48 = sub_245BD8A74();
        __swift_project_value_buffer(v48, (uint64_t)qword_257513638);
        v27 = v23;
        v28 = sub_245BD8A5C();
        v29 = sub_245BD8C78();
        if (os_log_type_enabled(v28, v29))
        {
          v30 = (uint8_t *)swift_slowAlloc();
          v31 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v30 = 138412290;
          v50 = (uint64_t)v27;
          v32 = v27;
          sub_245BD8D38();
          *v31 = v22;

          v33 = "Failed to finalize current path %@";
          goto LABEL_33;
        }
      }

      return sub_245BD2798(v3, (uint64_t)a1);
    }
    if (v5[144] != -1)
      swift_once();
    v44 = sub_245BD8A74();
    __swift_project_value_buffer(v44, (uint64_t)qword_257513638);
    v45 = sub_245BD8A5C();
    v46 = sub_245BD8C78();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_245BBC000, v45, v46, "No current path to finalize on scene deactivation...", v47, 2u);
      MEMORY[0x249543568](v47, -1, -1);
    }

  }
  else
  {
    if (v5[144] != -1)
      swift_once();
    v34 = sub_245BD8A74();
    __swift_project_value_buffer(v34, (uint64_t)qword_257513638);
    v35 = a1;
    v36 = sub_245BD8A5C();
    v37 = sub_245BD8C78();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v50 = v39;
      *(_DWORD *)v38 = 136315138;
      v40 = objc_msgSend(v35, sel_identifier);
      v41 = sub_245BD8B04();
      v43 = v42;

      sub_245BD3434(v41, v43, &v50);
      sub_245BD8D38();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245BBC000, v36, v37, "No Capture Scene found: %s", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249543568](v39, -1, -1);
      MEMORY[0x249543568](v38, -1, -1);

    }
    else
    {

    }
  }
  return sub_245BD2798(v3, (uint64_t)a1);
}

id sub_245BD2798(char *a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  id result;
  id v12;

  v4 = *(void **)&a1[OBJC_IVAR___SESecureCaptureSceneViewController_currentPath];
  if (v4)
    objc_msgSend(v4, sel_invalidate);
  v5 = objc_msgSend(objc_msgSend(a1, sel_extensionProvider), sel_containerBundleIdentifier);
  swift_unknownObjectRelease();
  if (!v5)
    goto LABEL_8;
  v6 = sub_245BD8B04();
  v8 = v7;

  if (v6 == 0xD000000000000010 && v8 == 0x8000000245BDB6B0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v9 = sub_245BD8EC4();
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
LABEL_8:
    objc_msgSend((id)objc_opt_self(), sel_removeContentsOfExtensionDataContainerForBundleProvider_, objc_msgSend(a1, sel_extensionProvider));
    swift_unknownObjectRelease();
  }
LABEL_9:
  v10 = *(void **)&a1[OBJC_IVAR___SESecureCaptureSceneViewController_assertion];
  if (v10)
    objc_msgSend(v10, sel_invalidate);
  result = objc_msgSend(a1, sel_delegate);
  if (result)
  {
    v12 = result;
    if (objc_msgSend(result, sel_respondsToSelector_, sel_secureCaptureSceneViewController_sceneDidDeactivate_))objc_msgSend(v12, sel_secureCaptureSceneViewController_sceneDidDeactivate_, a1, a2);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void SESecureCaptureSceneViewController.sceneContentStateDidChange(_:)(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  __objc2_meth *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (qword_257512480 != -1)
    swift_once();
  v2 = sub_245BD8A74();
  __swift_project_value_buffer(v2, (uint64_t)qword_257513638);
  v3 = a1;
  v4 = sub_245BD8A5C();
  v5 = sub_245BD8C84();
  v6 = &stru_2516DB000;
  if (os_log_type_enabled(v4, v5))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136446210;
    objc_msgSend(v3, sel_contentState);
    type metadata accessor for FBSceneContentState(0);
    v9 = sub_245BD8B10();
    v11 = sub_245BD3434(v9, v10, &v12);
    sub_245BD8D38();

    v6 = &stru_2516DB000;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245BBC000, v4, v5, "Content state changed: %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249543568](v8, -1, -1);
    MEMORY[0x249543568](v7, -1, -1);

  }
  else
  {

  }
  if (objc_msgSend(v3, v6[158].types, v11) == (id)2)
    sub_245BD142C((uint64_t)sub_245BD2BB4, 0);
}

void sub_245BD2BB4(void *a1, id a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  NSObject *oslog;
  uint64_t v23;

  if (a2)
  {
    v3 = a2;
    if (qword_257512480 != -1)
      swift_once();
    v4 = sub_245BD8A74();
    __swift_project_value_buffer(v4, (uint64_t)qword_257513638);
    v5 = a2;
    v6 = a2;
    oslog = sub_245BD8A5C();
    v7 = sub_245BD8C78();
    if (os_log_type_enabled(oslog, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v23 = v9;
      *(_DWORD *)v8 = 136446210;
      swift_getErrorValue();
      v10 = sub_245BD8F18();
      sub_245BD3434(v10, v11, &v23);
      sub_245BD8D38();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_245BBC000, oslog, v7, "Failed to acquire assertion: %{public}s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249543568](v9, -1, -1);
      MEMORY[0x249543568](v8, -1, -1);

      return;
    }

  }
  else
  {
    if (qword_257512480 != -1)
      swift_once();
    v13 = sub_245BD8A74();
    __swift_project_value_buffer(v13, (uint64_t)qword_257513638);
    oslog = a1;
    v14 = sub_245BD8A5C();
    v15 = sub_245BD8C84();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v23 = v17;
      *(_DWORD *)v16 = 136315138;
      v18 = -[NSObject description](oslog, sel_description);
      v19 = sub_245BD8B04();
      v21 = v20;

      sub_245BD3434(v19, v21, &v23);
      sub_245BD8D38();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245BBC000, v14, v15, "Runningboard assertion invalidated: %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249543568](v17, -1, -1);
      MEMORY[0x249543568](v16, -1, -1);

      return;
    }

  }
}

void SESecureCaptureSceneViewController.scene(_:didReceive:)(uint64_t a1, uint64_t a2)
{
  sub_245BD3CB4(a2);
}

void sub_245BD2FA4(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_245BD2FF8(void *a1, id a2)
{
  id v4;
  void *v5;
  id v6;

  if (objc_msgSend(a2, sel_canSendResponse))
  {
    if (a1)
    {
      v4 = a1;
      v5 = (void *)sub_245BD8948();

    }
    else
    {
      v5 = 0;
    }
    v6 = objc_msgSend((id)objc_opt_self(), sel_responseForError_, v5);

    objc_msgSend(a2, sel_sendResponse_, v6);
  }
}

void SESecureCaptureSceneViewController.sceneLayerManagerDidUpdateLayers(_:)(uint64_t a1)
{
  sub_245BD3210(a1, "Capture Scene sceneLayerManagerDidUpdateLayers");
}

void SESecureCaptureSceneViewController.sceneLayerManagerDidStopTrackingLayers(_:)(uint64_t a1)
{
  sub_245BD3210(a1, "Capture Scene sceneLayerManagerDidStopTrackingLayers");
}

void SESecureCaptureSceneViewController.sceneLayerManagerDidStartTrackingLayers(_:)(uint64_t a1)
{
  sub_245BD3210(a1, "Capture Scene sceneLayerManagerDidStartTrackingLayers");
}

void sub_245BD3210(uint64_t a1, const char *a2)
{
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *oslog;

  if (qword_257512480 != -1)
    swift_once();
  v3 = sub_245BD8A74();
  __swift_project_value_buffer(v3, (uint64_t)qword_257513638);
  oslog = sub_245BD8A5C();
  v4 = sub_245BD8C6C();
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_245BBC000, oslog, v4, a2, v5, 2u);
    MEMORY[0x249543568](v5, -1, -1);
  }

}

void sub_245BD32F0(void *a1, uint64_t a2, void *a3, const char *a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;

  v6 = qword_257512480;
  v12 = a3;
  v7 = a1;
  if (v6 != -1)
    swift_once();
  v8 = sub_245BD8A74();
  __swift_project_value_buffer(v8, (uint64_t)qword_257513638);
  v9 = sub_245BD8A5C();
  v10 = sub_245BD8C6C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_245BBC000, v9, v10, a4, v11, 2u);
    MEMORY[0x249543568](v11, -1, -1);
  }

}

uint64_t sub_245BD33E8(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_245BD3424(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_245BD3434(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_245BD3504(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_245BD4DDC((uint64_t)v12, *a3);
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
      sub_245BD4DDC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_245BD3504(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_245BD8D44();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_245BD36BC(a5, a6);
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
  v8 = sub_245BD8E34();
  if (!v8)
  {
    sub_245BD8E58();
    __break(1u);
LABEL_17:
    result = sub_245BD8EA0();
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

uint64_t sub_245BD36BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_245BD3750(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_245BD3928(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_245BD3928(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_245BD3750(uint64_t a1, unint64_t a2)
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
      v3 = sub_245BD38C4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_245BD8E1C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_245BD8E58();
      __break(1u);
LABEL_10:
      v2 = sub_245BD8B34();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_245BD8EA0();
    __break(1u);
LABEL_14:
    result = sub_245BD8E58();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245BD38C4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257513310);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_245BD3928(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257513310);
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
  result = sub_245BD8EA0();
  __break(1u);
  return result;
}

void _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE5coderABSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;

  *(_QWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_scene] = 0;
  v0[OBJC_IVAR___SESecureCaptureSceneViewController_sceneForeground] = 0;
  v0[OBJC_IVAR___SESecureCaptureSceneViewController_sceneActivated] = 0;
  v0[OBJC_IVAR___SESecureCaptureSceneViewController_invalidated] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_scenePresenter] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_currentPath] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController_assertion] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue] = 0;
  *(_DWORD *)&v0[OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode] = 0;
  v0[OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled] = 0;
  swift_unknownObjectWeakInit();

  sub_245BD8E64();
  __break(1u);
}

uint64_t type metadata accessor for SESecureCaptureSceneViewController(uint64_t a1)
{
  return sub_245BC4B08(a1, &qword_257513220);
}

uint64_t sub_245BD3B94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257513180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE18sceneDidInvalidateyySo7FBSceneCF_0()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  *(_BYTE *)(v0 + OBJC_IVAR___SESecureCaptureSceneViewController_sceneActivated) = 0;
  if (qword_257512480 != -1)
    swift_once();
  v1 = sub_245BD8A74();
  __swift_project_value_buffer(v1, (uint64_t)qword_257513638);
  oslog = sub_245BD8A5C();
  v2 = sub_245BD8C84();
  if (os_log_type_enabled(oslog, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_245BBC000, oslog, v2, "Capture Scene did invalidate.", v3, 2u);
    MEMORY[0x249543568](v3, -1, -1);
  }

}

void sub_245BD3CB4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  id v50;
  int64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  id v63;
  int64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  int64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  int64_t v76;
  int64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  _BYTE *v81;
  id aBlock;
  uint64_t v83;
  void (*v84)(uint64_t, void *);
  void *v85;
  void (*v86)(void *);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;

  if (qword_257512480 != -1)
    goto LABEL_115;
  while (1)
  {
    v2 = sub_245BD8A74();
    __swift_project_value_buffer(v2, (uint64_t)qword_257513638);
    swift_bridgeObjectRetain_n();
    v3 = sub_245BD8A5C();
    v4 = sub_245BD8C84();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = (void *)swift_slowAlloc();
      aBlock = v6;
      *(_DWORD *)v5 = 136380675;
      sub_245BC4B08(0, &qword_2575129F8);
      sub_245BC49B4();
      swift_bridgeObjectRetain();
      v7 = sub_245BD8C0C();
      v9 = v8;
      swift_bridgeObjectRelease();
      v99 = sub_245BD3434(v7, v9, (uint64_t *)&aBlock);
      sub_245BD8D38();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245BBC000, v3, v4, "Capture Scene did receive actions: %{private}s", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249543568](v6, -1, -1);
      MEMORY[0x249543568](v5, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if ((v81[OBJC_IVAR___SESecureCaptureSceneViewController_invalidated] & 1) != 0)
      break;
    v88 = MEMORY[0x24BEE4B08];
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_245BD8D8C();
      sub_245BC4B08(0, &qword_2575129F8);
      sub_245BC49B4();
      sub_245BD8C24();
      a1 = v89;
      v72 = v90;
      v10 = v91;
      v11 = v92;
      v12 = v93;
    }
    else
    {
      v13 = -1 << *(_BYTE *)(a1 + 32);
      v72 = a1 + 56;
      v10 = ~v13;
      v14 = -v13;
      if (v14 < 64)
        v15 = ~(-1 << v14);
      else
        v15 = -1;
      v12 = v15 & *(_QWORD *)(a1 + 56);
      swift_bridgeObjectRetain();
      v11 = 0;
    }
    v70 = v10;
    v71 = (unint64_t)(v10 + 64) >> 6;
    v73 = a1;
    v16 = v11;
    if (a1 < 0)
      goto LABEL_13;
LABEL_16:
    if (v12)
    {
      v19 = (v12 - 1) & v12;
      v20 = __clz(__rbit64(v12)) | (v16 << 6);
      v18 = v16;
    }
    else
    {
      v21 = v16 + 1;
      if (__OFADD__(v16, 1))
        goto LABEL_114;
      if (v21 >= v71)
        goto LABEL_110;
      v22 = *(_QWORD *)(v72 + 8 * v21);
      v18 = v16 + 1;
      if (!v22)
      {
        v18 = v16 + 2;
        if (v16 + 2 >= v71)
          goto LABEL_110;
        v22 = *(_QWORD *)(v72 + 8 * v18);
        if (!v22)
        {
          v18 = v16 + 3;
          if (v16 + 3 >= v71)
            goto LABEL_110;
          v22 = *(_QWORD *)(v72 + 8 * v18);
          if (!v22)
          {
            v18 = v16 + 4;
            if (v16 + 4 >= v71)
              goto LABEL_110;
            v22 = *(_QWORD *)(v72 + 8 * v18);
            if (!v22)
            {
              v23 = v16 + 5;
              while (v71 != v23)
              {
                v22 = *(_QWORD *)(v72 + 8 * v23++);
                if (v22)
                {
                  v18 = v23 - 1;
                  goto LABEL_31;
                }
              }
LABEL_110:
              sub_245BCBC14();
              swift_bridgeObjectRelease();
              return;
            }
          }
        }
      }
LABEL_31:
      v19 = (v22 - 1) & v22;
      v20 = __clz(__rbit64(v22)) + (v18 << 6);
    }
    v17 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v20);
    if (!v17)
      goto LABEL_110;
LABEL_33:
    v75 = v19;
    objc_opt_self();
    v24 = swift_dynamicCastObjCClass();
    if (v24)
    {
      v25 = (void *)v24;
      v26 = v17;
      v27 = objc_msgSend(v81, sel_delegate);
      if (!v27)
      {

        goto LABEL_38;
      }
      v28 = v27;
      v74 = v18;
      v29 = objc_msgSend(v25, sel_launchActions);
      sub_245BC4B08(0, &qword_2575129F8);
      sub_245BC49B4();
      v30 = sub_245BD8C00();

      v80 = v26;
      if ((v30 & 0xC000000000000001) != 0)
      {
        sub_245BD8D8C();
        sub_245BD8C24();
        v30 = v94;
        v78 = v95;
        v31 = v96;
        v32 = v97;
        v33 = v98;
      }
      else
      {
        v32 = 0;
        v44 = -1 << *(_BYTE *)(v30 + 32);
        v78 = v30 + 56;
        v45 = ~v44;
        v46 = -v44;
        if (v46 < 64)
          v47 = ~(-1 << v46);
        else
          v47 = -1;
        v33 = v47 & *(_QWORD *)(v30 + 56);
        v31 = v45;
      }
      v76 = (unint64_t)(v31 + 64) >> 6;
      while (1)
      {
        if (v30 < 0)
        {
          if (!sub_245BD8DB0())
            goto LABEL_107;
          swift_unknownObjectRetain();
          swift_dynamicCast();
          v50 = aBlock;
          swift_unknownObjectRelease();
          a1 = v32;
          v48 = v33;
          if (!v50)
            goto LABEL_107;
        }
        else
        {
          if (v33)
          {
            v48 = (v33 - 1) & v33;
            v49 = __clz(__rbit64(v33)) | (v32 << 6);
            a1 = v32;
          }
          else
          {
            v51 = v32 + 1;
            if (__OFADD__(v32, 1))
            {
              __break(1u);
              goto LABEL_113;
            }
            if (v51 >= v76)
              goto LABEL_107;
            v52 = *(_QWORD *)(v78 + 8 * v51);
            a1 = v32 + 1;
            if (!v52)
            {
              a1 = v32 + 2;
              if (v32 + 2 >= v76)
                goto LABEL_107;
              v52 = *(_QWORD *)(v78 + 8 * a1);
              if (!v52)
              {
                a1 = v32 + 3;
                if (v32 + 3 >= v76)
                  goto LABEL_107;
                v52 = *(_QWORD *)(v78 + 8 * a1);
                if (!v52)
                {
                  a1 = v32 + 4;
                  if (v32 + 4 >= v76)
                    goto LABEL_107;
                  v52 = *(_QWORD *)(v78 + 8 * a1);
                  if (!v52)
                  {
                    v53 = v32 + 5;
                    while (v76 != v53)
                    {
                      v52 = *(_QWORD *)(v78 + 8 * v53++);
                      if (v52)
                      {
                        a1 = v53 - 1;
                        goto LABEL_68;
                      }
                    }
LABEL_107:
                    sub_245BCBC14();
                    swift_unknownObjectRelease();

                    a1 = v73;
                    v18 = v74;
LABEL_108:
                    v12 = v75;
                    v16 = v18;
                    if ((a1 & 0x8000000000000000) == 0)
                      goto LABEL_16;
LABEL_13:
                    if (!sub_245BD8DB0())
                      goto LABEL_110;
                    sub_245BC4B08(0, &qword_2575129F8);
                    swift_unknownObjectRetain();
                    swift_dynamicCast();
                    v17 = aBlock;
                    swift_unknownObjectRelease();
                    v18 = v16;
                    v19 = v12;
                    if (!v17)
                      goto LABEL_110;
                    goto LABEL_33;
                  }
                }
              }
            }
LABEL_68:
            v48 = (v52 - 1) & v52;
            v49 = __clz(__rbit64(v52)) + (a1 << 6);
          }
          v50 = *(id *)(*(_QWORD *)(v30 + 48) + 8 * v49);
          if (!v50)
            goto LABEL_107;
        }
        if (objc_msgSend(v28, sel_respondsToSelector_, sel_secureCaptureSceneViewController_requestsLaunchWithAction_completion_, v70))
        {
          v54 = swift_allocObject();
          *(_QWORD *)(v54 + 16) = v25;
          v86 = sub_245BD537C;
          v87 = v54;
          aBlock = (id)MEMORY[0x24BDAC760];
          v83 = 1107296256;
          v84 = sub_245BD2FA4;
          v85 = &block_descriptor_26;
          v55 = _Block_copy(&aBlock);
          v56 = v80;
          swift_release();
          objc_msgSend(v28, sel_secureCaptureSceneViewController_requestsLaunchWithAction_completion_, v81, v50, v55);

          _Block_release(v55);
        }
        else
        {
          if (objc_msgSend(v28, sel_respondsToSelector_, sel_secureCaptureSceneViewController_requestsLaunchWithAction_))objc_msgSend(v28, sel_secureCaptureSceneViewController_requestsLaunchWithAction_, v81, v50);

        }
        v32 = a1;
        v33 = v48;
      }
    }
LABEL_38:
    objc_opt_self();
    v34 = swift_dynamicCastObjCClass();
    if (!v34)
      goto LABEL_75;
    v35 = (void *)v34;
    v36 = v17;
    v37 = objc_msgSend(v81, sel_delegate);
    if (!v37)
    {

LABEL_75:
      sub_245BCAACC(&aBlock, v17);

      goto LABEL_108;
    }
    v38 = v37;
    v80 = v36;
    v74 = v18;
    v39 = objc_msgSend(v35, sel_launchActions);
    sub_245BC4B08(0, &qword_2575129F8);
    sub_245BC49B4();
    v40 = sub_245BD8C00();

    if ((v40 & 0xC000000000000001) != 0)
    {
      sub_245BD8D8C();
      sub_245BD8C24();
      v40 = v99;
      v79 = v100;
      v41 = v101;
      v42 = v102;
      v43 = v103;
    }
    else
    {
      v42 = 0;
      v57 = -1 << *(_BYTE *)(v40 + 32);
      v79 = v40 + 56;
      v58 = ~v57;
      v59 = -v57;
      if (v59 < 64)
        v60 = ~(-1 << v59);
      else
        v60 = -1;
      v43 = v60 & *(_QWORD *)(v40 + 56);
      v41 = v58;
    }
    v77 = (unint64_t)(v41 + 64) >> 6;
    while (2)
    {
      if (v40 < 0)
      {
        if (!sub_245BD8DB0())
          goto LABEL_107;
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v63 = aBlock;
        swift_unknownObjectRelease();
        a1 = v42;
        v61 = v43;
        if (!v63)
          goto LABEL_107;
        goto LABEL_105;
      }
      if (v43)
      {
        v61 = (v43 - 1) & v43;
        v62 = __clz(__rbit64(v43)) | (v42 << 6);
        a1 = v42;
LABEL_104:
        v63 = *(id *)(*(_QWORD *)(v40 + 48) + 8 * v62);
        if (!v63)
          goto LABEL_107;
LABEL_105:
        if (objc_msgSend(v38, sel_respondsToSelector_, sel_secureCaptureSceneViewController_requestsLaunchAfterTransitionCompletionWithAction_completion_, v70))
        {
          v67 = swift_allocObject();
          *(_QWORD *)(v67 + 16) = v35;
          v86 = sub_245BD4DC4;
          v87 = v67;
          aBlock = (id)MEMORY[0x24BDAC760];
          v83 = 1107296256;
          v84 = sub_245BD2FA4;
          v85 = &block_descriptor_20;
          v68 = _Block_copy(&aBlock);
          v69 = v80;
          swift_release();
          objc_msgSend(v38, sel_secureCaptureSceneViewController_requestsLaunchAfterTransitionCompletionWithAction_completion_, v81, v63, v68);

          _Block_release(v68);
        }
        else
        {

        }
        v42 = a1;
        v43 = v61;
        continue;
      }
      break;
    }
    v64 = v42 + 1;
    if (!__OFADD__(v42, 1))
    {
      if (v64 >= v77)
        goto LABEL_107;
      v65 = *(_QWORD *)(v79 + 8 * v64);
      a1 = v42 + 1;
      if (!v65)
      {
        a1 = v42 + 2;
        if (v42 + 2 >= v77)
          goto LABEL_107;
        v65 = *(_QWORD *)(v79 + 8 * a1);
        if (!v65)
        {
          a1 = v42 + 3;
          if (v42 + 3 >= v77)
            goto LABEL_107;
          v65 = *(_QWORD *)(v79 + 8 * a1);
          if (!v65)
          {
            a1 = v42 + 4;
            if (v42 + 4 >= v77)
              goto LABEL_107;
            v65 = *(_QWORD *)(v79 + 8 * a1);
            if (!v65)
            {
              v66 = v42 + 5;
              do
              {
                if (v77 == v66)
                  goto LABEL_107;
                v65 = *(_QWORD *)(v79 + 8 * v66++);
              }
              while (!v65);
              a1 = v66 - 1;
            }
          }
        }
      }
      v61 = (v65 - 1) & v65;
      v62 = __clz(__rbit64(v65)) + (a1 << 6);
      goto LABEL_104;
    }
LABEL_113:
    __break(1u);
LABEL_114:
    __break(1u);
LABEL_115:
    swift_once();
  }
}

void _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE5scene_27didUpdateClientSettingsWith03oldkL017transitionContextySo7FBSceneC_So08FBSScenekL4DiffCSo0rkL0CSo0r10TransitionP0CSgtF_0(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  if (qword_257512480 != -1)
    swift_once();
  v4 = sub_245BD8A74();
  __swift_project_value_buffer(v4, (uint64_t)qword_257513638);
  v5 = a2;
  v6 = a1;
  v7 = v5;
  v8 = v6;
  v9 = sub_245BD8A5C();
  v10 = sub_245BD8C84();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v23 = v22;
    *(_DWORD *)v11 = 136315394;
    v12 = objc_msgSend(v7, sel_debugDescription);
    v13 = sub_245BD8B04();
    v15 = v14;

    sub_245BD3434(v13, v15, &v23);
    sub_245BD8D38();

    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    v16 = objc_msgSend(v8, sel_settings);
    v17 = objc_msgSend(v16, sel_debugDescription);

    v18 = sub_245BD8B04();
    v20 = v19;

    sub_245BD3434(v18, v20, &v23);
    sub_245BD8D38();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245BBC000, v9, v10, "Capture Scene did receive new client settings. clientSettings: %s, scene settings: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x249543568](v22, -1, -1);
    MEMORY[0x249543568](v11, -1, -1);

  }
  else
  {

  }
  v21 = sub_245BCCFAC();
  objc_msgSend(v7, sel_evaluateWithInspector_context_, v21, 0);

}

unint64_t sub_245BD4AEC()
{
  unint64_t result;

  result = qword_257513190;
  if (!qword_257513190)
  {
    result = MEMORY[0x2495434CC](&protocol conformance descriptor for PresentationMode, &type metadata for PresentationMode);
    atomic_store(result, (unint64_t *)&qword_257513190);
  }
  return result;
}

_QWORD *sub_245BD4B30@<X0>(_QWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *(_DWORD *)(*result + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode);
  return result;
}

void sub_245BD4B48(int *a1)
{
  int v1;

  v1 = *a1;
  BSDispatchQueueAssertMain();
  sub_245BCD350(v1, 0);
}

char *keypath_get_selector_presentationMode()
{
  return sel_presentationMode;
}

id sub_245BD4B84@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_presentationMode);
  *a2 = result;
  return result;
}

id sub_245BD4BB4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPresentationMode_, *a1);
}

char *keypath_get_selector_delegate()
{
  return sel_delegate;
}

id sub_245BD4BD4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_delegate);
  *a2 = result;
  return result;
}

id sub_245BD4C0C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDelegate_, *a1);
}

char *keypath_get_selector_extensionProvider()
{
  return sel_extensionProvider;
}

id sub_245BD4C2C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_extensionProvider);
  *a2 = result;
  return result;
}

id sub_245BD4C64(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setExtensionProvider_, *a1);
}

ValueMetadata *type metadata accessor for PresentationMode()
{
  return &type metadata for PresentationMode;
}

id sub_245BD4C88()
{
  uint64_t v0;

  return sub_245BCE090(*(void **)(v0 + 16));
}

uint64_t sub_245BD4CA0()
{
  return swift_deallocObject();
}

uint64_t sub_245BD4CB0(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_245BD4CD4()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_245BD4D08(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_245BBE824;
  return sub_245BD1288(a1, v4, v5, v7, v6);
}

uint64_t sub_245BD4D80()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_245BD4DA4(uint64_t a1)
{
  uint64_t v1;

  sub_245BCD0B4(a1, v1);
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

void sub_245BD4DC4(void *a1)
{
  uint64_t v1;

  sub_245BD2FF8(a1, *(id *)(v1 + 16));
}

uint64_t sub_245BD4DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_245BD4E18()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_245BD4E44()
{
  uint64_t v0;

  return sub_245BCE984(*(void **)(v0 + 16), *(void **)(v0 + 24), *(_BYTE *)(v0 + 32));
}

uint64_t sub_245BD4E50()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_245BD4E74()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setHidden_, (*(_BYTE *)(v0 + 24) & 1) == 0);
}

void sub_245BD4E90()
{
  uint64_t v0;

  sub_245BD043C(*(void **)(v0 + 16));
}

void sub_245BD4E98(unsigned __int8 a1)
{
  uint64_t v1;

  sub_245BCF35C(a1, *(char **)(v1 + 16));
}

void sub_245BD4EA4(void *a1, char a2)
{
  uint64_t v2;

  sub_245BCEE64(a1, a2 & 1, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t objectdestroy_49Tm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_245BD4EE4()
{
  uint64_t v0;

  sub_245BCE9FC(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

unint64_t sub_245BD4EF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257512EF0;
  if (!qword_257512EF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_257513320);
    result = MEMORY[0x2495434CC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, &qword_257512EF0);
  }
  return result;
}

uint64_t sub_245BD4F3C()
{
  uint64_t v0;

  swift_release();
  sub_245BD4F6C(*(id *)(v0 + 32), *(_BYTE *)(v0 + 40));
  return swift_deallocObject();
}

void sub_245BD4F6C(id a1, char a2)
{
  if ((a2 & 1) == 0)

}

uint64_t sub_245BD4F78()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), *(unsigned __int8 *)(v0 + 40));
}

id sub_245BD4FA4(id result, char a2)
{
  if ((a2 & 1) == 0)
    return result;
  return result;
}

uint64_t sub_245BD4FB0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245BD4FD4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(*(unsigned __int8 *)(v0 + 32));
}

unint64_t sub_245BD4FFC()
{
  unint64_t result;

  result = qword_257513330;
  if (!qword_257513330)
  {
    result = MEMORY[0x2495434CC](&unk_245BDA3D4, &_s17SceneCaptureErrorON);
    atomic_store(result, (unint64_t *)&qword_257513330);
  }
  return result;
}

uint64_t sub_245BD5040()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_245BD5074()
{
  uint64_t v0;

  sub_245BCF1B4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void (**)(uint64_t))(v0 + 32));
}

id sub_245BD5080(void *a1)
{
  uint64_t v1;

  return sub_245BD54A4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_245BD5088()
{
  return swift_deallocObject();
}

uint64_t sub_245BD5098()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_245BD50B8(void *a1)
{
  uint64_t v1;

  return sub_245BD069C(a1, *(void **)(v1 + 32), *(_BYTE *)(v1 + 40), *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_245BD50C8()
{
  return swift_deallocObject();
}

uint64_t sub_245BD50D8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_245BD50FC(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_245BD0B54(a1, a2, *(_BYTE *)(v2 + 16), *(char **)(v2 + 24));
}

uint64_t sub_245BD5108()
{
  return swift_deallocObject();
}

uint64_t sub_245BD5118()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  return swift_deallocObject();
}

id sub_245BD5154(int a1, int a2)
{
  uint64_t v2;

  return sub_245BD0DFC(a1, a2, *(void (**)(void))(v2 + 16), *(_QWORD *)(v2 + 24), *(id *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_245BD5160(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_245BD5170()
{
  return swift_deallocObject();
}

id sub_245BD5180(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_setForeground_, *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_245BD5190()
{
  return swift_deallocObject();
}

uint64_t sub_245BD51A0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_245BD51CC()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1)
    return v1();
  return result;
}

uint64_t sub_245BD51F4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_245BD5218(void *a1)
{
  uint64_t v1;

  sub_245BD07E4(a1, *(void **)(v1 + 32), *(_BYTE *)(v1 + 40));
}

uint64_t sub_245BD5228()
{
  return swift_deallocObject();
}

uint64_t sub_245BD5238()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_245BD525C()
{
  uint64_t v0;

  return sub_245BD04E4(*(char **)(v0 + 16));
}

uint64_t _s17SceneCaptureErrorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245BD52B0 + 4 * byte_245BDA195[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_245BD52E4 + 4 * byte_245BDA190[v4]))();
}

uint64_t sub_245BD52E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245BD52EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245BD52F4);
  return result;
}

uint64_t sub_245BD5300(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245BD5308);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_245BD530C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245BD5314(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s17SceneCaptureErrorOMa()
{
  return &_s17SceneCaptureErrorON;
}

unint64_t sub_245BD5338()
{
  unint64_t result;

  result = qword_257513398;
  if (!qword_257513398)
  {
    result = MEMORY[0x2495434CC](&unk_245BDA3AC, &_s17SceneCaptureErrorON);
    atomic_store(result, (unint64_t *)&qword_257513398);
  }
  return result;
}

void sub_245BD5438()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BE38110]);
  v1 = (void *)sub_245BD8AF8();
  v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  qword_257513650 = (uint64_t)v2;
}

id sub_245BD54A4(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  uint64_t v11;

  v4 = sub_245BD89C0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245BD89B4();
  sub_245BD89A8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v8 = (void *)sub_245BD8AF8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setIdentifier_, v8);

  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD3F0]), sel_init);
  objc_msgSend(a1, sel_setSpecification_, v9);

  return objc_msgSend(a1, sel_setClientIdentity_, a2);
}

uint64_t sub_245BD55B4()
{
  uint64_t v0;

  v0 = sub_245BD8A50();
  __swift_allocate_value_buffer(v0, qword_257513400);
  __swift_project_value_buffer(v0, (uint64_t)qword_257513400);
  return sub_245BD8A38();
}

void *sub_245BD5658()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_245BD5700(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_245BD5750(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_245BD57B0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_245BD57F4()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_245BD5840(void *a1)
{
  sub_245BD6C30(a1);

}

void (*sub_245BD5864(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_245BD58BC;
}

void sub_245BD58BC(_QWORD **a1, char a2)
{
  _QWORD *v3;
  id *v4;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = (id *)(v3[3] + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
    swift_beginAccess();
    if (*v4)
      objc_msgSend(*v4, sel_setRootViewController_, *(_QWORD *)(v3[3] + v3[4]));
  }
  free(v3);
}

void *sub_245BD592C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_245BD5978(void *a1)
{
  sub_245BD6AA8(a1);

}

void (*sub_245BD599C(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath;
  v3[6] = v1;
  v3[7] = v4;
  swift_beginAccess();
  return sub_245BD59F4;
}

void sub_245BD59F4(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) != 0)
    goto LABEL_5;
  v4 = v3[6];
  v5 = *(void **)(v4 + v3[7]);
  if (!v5)
    goto LABEL_5;
  v6 = *(void **)(v4 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_fbsScene);
  if (!v6)
    goto LABEL_5;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_245BD6CE8;
  *(_QWORD *)(v8 + 24) = v7;
  v3[4] = sub_245BD5098;
  v3[5] = v8;
  *v3 = MEMORY[0x24BDAC760];
  v3[1] = 1107296256;
  v3[2] = sub_245BD055C;
  v3[3] = &block_descriptor_3;
  v9 = _Block_copy(v3);
  v10 = v5;
  v11 = v6;
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_updateClientSettings_, v9);

  _Block_release(v9);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v9 & 1) != 0)
    __break(1u);
  else
LABEL_5:
    free(v3);
}

uint64_t sub_245BD5B64@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts;
  swift_beginAccess();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575124C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_245BD5BD0(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575124C0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_245BD5C98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts;
  swift_beginAccess();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575124C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_245BD5D00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts;
  swift_beginAccess();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575124C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_245BD5D70())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id CaptureSceneDelegate.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CaptureSceneDelegate.init()()
{
  char *v0;
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
  char *v12;
  objc_class *v13;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257513440);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257513448);
  v5 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575124C0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_fbsScene] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath] = 0;
  sub_245BD6D28();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE6A10], v1);
  v12 = v0;
  sub_245BD8BDC();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v12[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContexts], v11, v8);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v12[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_urlContextsProducerContinuation], v7, v16);

  v13 = (objc_class *)type metadata accessor for CaptureSceneDelegate();
  v17.receiver = v12;
  v17.super_class = v13;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t sub_245BD5FC8(void *a1, uint64_t a2, void *a3)
{
  return sub_245BD6DA0(a1, a3);
}

id sub_245BD5FD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id result;

  result = (id)swift_dynamicCastObjCProtocolConditional();
  if (result)
    return objc_msgSend(result, sel_setCaptureSessionPath_, a3);
  return result;
}

uint64_t sub_245BD60A0(uint64_t a1, uint64_t a2)
{
  return sub_245BD61B4(a2);
}

void sub_245BD611C()
{
  uint64_t v0;
  void **v1;
  void *v2;

  v1 = (void **)(v0 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  v2 = *v1;
  *v1 = 0;

}

uint64_t sub_245BD61B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257513590);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_245BD8D8C();
    sub_245BD6D28();
    sub_245BD7818();
    result = sub_245BD8C24();
    a1 = v29;
    v26 = v30;
    v7 = v31;
    v8 = v32;
    v9 = v33;
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    v26 = a1 + 56;
    v12 = ~v10;
    v13 = -v10;
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v9 = v14 & v11;
    result = swift_bridgeObjectRetain();
    v7 = v12;
    v8 = 0;
  }
  v24[1] = v7;
  v24[3] = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v25 = (unint64_t)(v7 + 64) >> 6;
  v24[2] = MEMORY[0x24BEE4AD0] + 8;
  if (a1 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v9)
    {
      v15 = (v9 - 1) & v9;
      v16 = __clz(__rbit64(v9)) | (v8 << 6);
      v17 = v8;
      goto LABEL_29;
    }
    v20 = v8 + 1;
    if (__OFADD__(v8, 1))
      break;
    if (v20 >= v25)
      return sub_245BCBC14();
    v21 = *(_QWORD *)(v26 + 8 * v20);
    v17 = v8 + 1;
    if (!v21)
    {
      v17 = v8 + 2;
      if (v8 + 2 >= v25)
        return sub_245BCBC14();
      v21 = *(_QWORD *)(v26 + 8 * v17);
      if (!v21)
      {
        v17 = v8 + 3;
        if (v8 + 3 >= v25)
          return sub_245BCBC14();
        v21 = *(_QWORD *)(v26 + 8 * v17);
        if (!v21)
        {
          v17 = v8 + 4;
          if (v8 + 4 >= v25)
            return sub_245BCBC14();
          v21 = *(_QWORD *)(v26 + 8 * v17);
          if (!v21)
          {
            v17 = v8 + 5;
            if (v8 + 5 >= v25)
              return sub_245BCBC14();
            v21 = *(_QWORD *)(v26 + 8 * v17);
            if (!v21)
            {
              v22 = v8 + 6;
              while (v25 != v22)
              {
                v21 = *(_QWORD *)(v26 + 8 * v22++);
                if (v21)
                {
                  v17 = v22 - 1;
                  goto LABEL_28;
                }
              }
              return sub_245BCBC14();
            }
          }
        }
      }
    }
LABEL_28:
    v15 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v17 << 6);
LABEL_29:
    v19 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v16);
    if (!v19)
      return sub_245BCBC14();
    while (1)
    {
      v28 = v19;
      v23 = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257513448);
      sub_245BD8BE8();

      result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v8 = v17;
      v9 = v15;
      if ((a1 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      v18 = sub_245BD8DB0();
      if (v18)
      {
        v27 = v18;
        sub_245BD6D28();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v19 = v28;
        swift_unknownObjectRelease();
        v17 = v8;
        v15 = v9;
        if (v19)
          continue;
      }
      return sub_245BCBC14();
    }
  }
  __break(1u);
  return result;
}

id CaptureSceneDelegate.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CaptureSceneDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t SecureCaptureExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6, a1);
  v7 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8 + v7, (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return sub_245BD8A20();
}

uint64_t SecureCaptureUIScene.session.getter()
{
  return swift_retain();
}

id SecureCaptureUIScene.init(content:)@<X0>(void (*a1)(id)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char *v17;
  id v18;
  void *v19;
  id result;
  void *v21;
  id v22;
  char *v23;
  void *v24;
  id v25;
  id *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;

  v31 = a4;
  v7 = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v29 - v11;
  if (qword_257512490 != -1)
    swift_once();
  v13 = sub_245BD8A50();
  __swift_project_value_buffer(v13, (uint64_t)qword_257513400);
  v14 = sub_245BD8A44();
  v29 = v15;
  v30 = v14;
  v16 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CaptureSceneDelegate()), sel_init);
  type metadata accessor for SecureCaptureSession(0);
  swift_allocObject();
  v17 = (char *)v16;
  v18 = SecureCaptureSession.init(sceneDelegate:)(v17);
  qword_257512450 = (uint64_t)v18;
  swift_retain_n();
  swift_release();
  v32 = a2;
  a1(v18);
  sub_245BD8A98();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, a3);
  v19 = (void *)sub_245BD8A8C();
  result = objc_msgSend(v19, sel_view);
  if (result)
  {
    v21 = result;
    v22 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v21, sel_setBackgroundColor_, v22);

    v23 = &v17[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController];
    swift_beginAccess();
    v24 = *(void **)v23;
    *(_QWORD *)v23 = v19;
    v25 = v19;

    v26 = (id *)&v17[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window];
    swift_beginAccess();
    if (*v26)
      objc_msgSend(*v26, sel_setRootViewController_, *(_QWORD *)v23);
    swift_release();

    swift_release();
    result = (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, a3);
    v28 = v30;
    v27 = v31;
    *v31 = v18;
    v27[1] = v28;
    v27[2] = v29;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t SecureCaptureUIScene.body.getter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(v6 + 32) = v3;
  *(_QWORD *)(v6 + 40) = v4;
  *(_QWORD *)(v6 + 48) = v5;
  swift_bridgeObjectRetain_n();
  swift_retain();
  return sub_245BD8A14();
}

void *sub_245BD6A3C(uint64_t a1)
{
  os_unfair_lock_s *v1;
  void **v2;
  os_unfair_lock_s *v3;
  void *v5;

  v1 = *(os_unfair_lock_s **)(a1 + 24);
  v2 = (void **)&v1[4];
  v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  sub_245BBEA74(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

uint64_t sub_245BD6A98()
{
  return 0;
}

void sub_245BD6AA8(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD aBlock[6];

  v3 = (void **)(v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  v6 = *v3;
  if (*v3)
  {
    v7 = *(void **)(v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_fbsScene);
    if (v7)
    {
      v8 = swift_allocObject();
      *(_QWORD *)(v8 + 16) = v6;
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = sub_245BD7904;
      *(_QWORD *)(v9 + 24) = v8;
      aBlock[4] = sub_245BD5430;
      aBlock[5] = v9;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_245BD055C;
      aBlock[3] = &block_descriptor_38;
      v10 = _Block_copy(aBlock);
      v11 = v6;
      v12 = v7;
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_updateClientSettings_, v10);

      _Block_release(v10);
      LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      swift_release();
      if ((v10 & 1) != 0)
        __break(1u);
    }
  }
}

id sub_245BD6C30(void *a1)
{
  uint64_t v1;
  _QWORD *v3;
  void *v4;
  id v5;
  id *v6;
  id result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController);
  swift_beginAccess();
  v4 = (void *)*v3;
  *v3 = a1;
  v5 = a1;

  v6 = (id *)(v1 + OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window);
  swift_beginAccess();
  result = *v6;
  if (*v6)
    return objc_msgSend(result, sel_setRootViewController_, *v3);
  return result;
}

uint64_t sub_245BD6CC4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_245BD6CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_245BD5FD0(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_245BD6D00()
{
  return swift_deallocObject();
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

unint64_t sub_245BD6D28()
{
  unint64_t result;

  result = qword_257513450;
  if (!qword_257513450)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257513450);
  }
  return result;
}

uint64_t type metadata accessor for CaptureSceneDelegate()
{
  uint64_t result;

  result = qword_2575134E8;
  if (!qword_2575134E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_245BD6DA0(void *a1, void *a2)
{
  char *v2;
  uint64_t result;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  char *v10;
  id v11;
  uint64_t v12;
  __objc2_meth *v13;
  id v14;
  uint64_t ObjCClassFromMetadata;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)();
  void *v27;
  id v28;
  id v29;
  void *v30;
  void **v31;
  void *v32;
  _QWORD v33[3];
  void *v34;
  uint64_t (*v35)();
  uint64_t v36;

  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v6 = result;
    v7 = objc_allocWithZone(MEMORY[0x24BEBDB58]);
    v8 = a1;
    v9 = objc_msgSend(v7, sel_initWithWindowScene_, v6);
    v10 = &v2[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController];
    swift_beginAccess();
    objc_msgSend(v9, sel_setRootViewController_, *(_QWORD *)v10);
    objc_msgSend(v9, sel_makeKeyAndVisible);
    v11 = objc_msgSend(a2, sel_URLContexts);
    sub_245BD6D28();
    sub_245BD7818();
    v12 = sub_245BD8C00();

    sub_245BD61B4(v12);
    swift_bridgeObjectRelease();
    v13 = &stru_2516DB000;
    v14 = objc_msgSend(v8, sel__FBSScene);
    type metadata accessor for SecureCaptureSceneExtension();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    type metadata accessor for SecureCaptureSceneStatusBarHostComponent();
    v16 = objc_msgSend(v14, sel_componentForExtension_ofClass_, ObjCClassFromMetadata, swift_getObjCClassFromMetadata());

    if (v16)
    {
      v17 = swift_dynamicCastClass();
      if (v17)
      {
        v18 = v17;
        v34 = (void *)type metadata accessor for CaptureSceneDelegate();
        v35 = (uint64_t (*)())&off_2516D9858;
        v33[0] = v2;
        v19 = v18 + OBJC_IVAR____TtC16SecureCaptureKit40SecureCaptureSceneStatusBarHostComponent_delegate;
        swift_beginAccess();
        v20 = v2;
        sub_245BD7880((uint64_t)v33, v19);
        swift_endAccess();
      }
      swift_unknownObjectRelease();
    }
    v21 = (id *)&v2[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath];
    swift_beginAccess();
    if (*v21)
    {
      v22 = *v21;
      v23 = objc_msgSend(v8, sel__FBSScene);
      v24 = swift_allocObject();
      *(_QWORD *)(v24 + 16) = v22;
      v25 = swift_allocObject();
      v26 = sub_245BD7904;
      *(_QWORD *)(v25 + 16) = sub_245BD7904;
      *(_QWORD *)(v25 + 24) = v24;
      v35 = sub_245BD5430;
      v36 = v25;
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 1107296256;
      v33[2] = sub_245BD055C;
      v34 = &block_descriptor_27;
      v27 = _Block_copy(v33);
      v28 = v22;
      swift_retain();
      swift_release();
      objc_msgSend(v23, sel_updateClientSettings_, v27);

      _Block_release(v27);
      LOBYTE(v23) = swift_isEscapingClosureAtFileLocation();
      result = swift_release();
      if ((v23 & 1) != 0)
      {
        __break(1u);
        return result;
      }
      v13 = &stru_2516DB000;
    }
    else
    {
      v26 = 0;
    }
    v29 = objc_msgSend(v8, (SEL)v13[141].imp, v33[0]);
    v30 = *(void **)&v2[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_fbsScene];
    *(_QWORD *)&v2[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_fbsScene] = v29;

    v31 = (void **)&v2[OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window];
    swift_beginAccess();
    v32 = *v31;
    *v31 = v9;

    return sub_245BD7860((uint64_t)v26);
  }
  return result;
}

uint64_t sub_245BD715C()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_245BD71B4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 32))();
}

uint64_t sub_245BD71EC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void *sub_245BD7218()
{
  uint64_t v0;

  return sub_245BD6A3C(*(_QWORD *)(v0 + 32));
}

uint64_t sub_245BD7228(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x2495434CC](&protocol conformance descriptor for SecureCaptureUIScene<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_245BD7254()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_245BD7288@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_window, a2);
}

id sub_245BD7298@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_rootViewController, a2);
}

void sub_245BD72A4(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_245BD6C30(v1);

}

id sub_245BD72E0@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16SecureCaptureKit20CaptureSceneDelegate_sessionPath, a2);
}

id keypath_getTm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, void **a3@<X8>)
{
  void **v4;
  void *v5;

  v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_245BD7338(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_245BD6AA8(v1);

}

uint64_t sub_245BD737C()
{
  return type metadata accessor for CaptureSceneDelegate();
}

void sub_245BD7384()
{
  unint64_t v0;
  unint64_t v1;

  sub_245BD75EC(319, &qword_2575134F8, MEMORY[0x24BEE6A98]);
  if (v0 <= 0x3F)
  {
    sub_245BD75EC(319, qword_257513500, MEMORY[0x24BEE6A40]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for CaptureSceneDelegate()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CaptureSceneDelegate.window.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.window.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.window.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.rootViewController.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.rootViewController.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.rootViewController.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.sessionPath.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.sessionPath.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.sessionPath.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.urlContexts.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.urlContexts.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.urlContexts.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.scene(_:willConnectTo:options:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.scene(_:openURLContexts:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of CaptureSceneDelegate.sceneDidDisconnect(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

void sub_245BD75EC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_245BD6D28();
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t dispatch thunk of SecureCaptureExtension.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_245BD764C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_245BD7658()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_245BD7680(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_245BD76BC(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *sub_245BD7734(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_release();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_245BD7778(uint64_t *a1, int a2)
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

uint64_t sub_245BD77C0(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for SecureCaptureUIScene(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SecureCaptureUIScene);
}

uint64_t sub_245BD780C()
{
  return MEMORY[0x24BDC7A50];
}

unint64_t sub_245BD7818()
{
  unint64_t result;
  unint64_t v1;

  result = qword_257513588;
  if (!qword_257513588)
  {
    v1 = sub_245BD6D28();
    result = MEMORY[0x2495434CC](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_257513588);
  }
  return result;
}

uint64_t sub_245BD7860(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_245BD7870()
{
  return swift_deallocObject();
}

uint64_t sub_245BD7880(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575130E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_245BD78C8()
{
  return swift_deallocObject();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x249543460](a1, v6, a5);
}

id SESecureCaptureOpenApplicationAction.init(url:responder:)(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_245BD8954();
  v6 = objc_msgSend(v4, sel_initWithURL_responder_, v5, a2);

  v7 = sub_245BD8984();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  return v6;
}

{
  void *v2;
  void *v3;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  objc_super v11;

  v3 = v2;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE40]), sel_init);
  v7 = (void *)sub_245BD8954();
  objc_msgSend(v6, sel_setObject_forSetting_, v7, 0);

  v11.receiver = v3;
  v11.super_class = (Class)SESecureCaptureOpenApplicationAction;
  v8 = objc_msgSendSuper2(&v11, sel_initWithInfo_responder_, v6, a2);

  v9 = sub_245BD8984();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  return v8;
}

id SESecureCaptureOpenApplicationAction.init(userActivity:responder:)(void *a1, void *a2)
{
  id v4;

  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUserActivity_responder_, a1, a2);

  return v4;
}

{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  uint64_t v14;
  uint64_t inited;
  unint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  objc_super v22;
  objc_super v23;
  objc_super v24;
  objc_super v25;
  _QWORD aBlock[7];

  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_245BD9FE0;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  objc_msgSend(a1, sel_setNeedsSave_, 0);
  sub_245BBEED8(MEMORY[0x24BEE4AF8]);
  v7 = (void *)sub_245BD8AC8();
  swift_bridgeObjectRelease();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = v6;
  aBlock[4] = sub_245BCA170;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_245BBF518;
  aBlock[3] = &block_descriptor_4;
  v9 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel__createUserActivityDataWithOptions_completionHandler_, v7, v9);
  _Block_release(v9);

  swift_beginAccess();
  if (*(_QWORD *)(v6 + 16))
  {
    v22.receiver = v2;
    v22.super_class = (Class)SESecureCaptureOpenApplicationAction;
    v10 = objc_msgSendSuper2(&v22, sel_initWithInfo_responder_, 0, 0);
LABEL_5:
    v12 = v10;
    swift_release();
    swift_release();

    return v12;
  }
  swift_beginAccess();
  v11 = *(_QWORD *)(v5 + 24);
  if (v11 >> 60 == 15)
  {
    v25.receiver = v2;
    v25.super_class = (Class)SESecureCaptureOpenApplicationAction;
    v10 = objc_msgSendSuper2(&v25, sel_initWithInfo_responder_, 0, 0);
    goto LABEL_5;
  }
  v14 = *(_QWORD *)(v5 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512FE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_245BD9E50;
  *(_QWORD *)(inited + 32) = 7;
  *(_QWORD *)(inited + 40) = v14;
  *(_QWORD *)(inited + 48) = v11;
  v16 = sub_245BC4854((_QWORD *)inited);
  swift_setDeallocating();
  sub_245BC4954(v14, v11);
  sub_245BC4954(v14, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257512FE8);
  swift_arrayDestroy();
  sub_245BCA190(v16);
  swift_bridgeObjectRelease();
  v17 = objc_allocWithZone(MEMORY[0x24BEBD390]);
  v18 = (void *)sub_245BD8AC8();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v17, sel_initWithSettings_, v18);

  if (v19)
  {
    v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE40]), sel_init);
    objc_msgSend(v20, sel_setObject_forSetting_, v19, 1);
    v23.receiver = v2;
    v23.super_class = (Class)SESecureCaptureOpenApplicationAction;
    v21 = v20;
    v12 = objc_msgSendSuper2(&v23, sel_initWithInfo_responder_, v21, a2);

    sub_245BC4D68(v14, v11);
    swift_release();
    swift_release();

  }
  else
  {
    v24.receiver = v2;
    v24.super_class = (Class)SESecureCaptureOpenApplicationAction;
    v12 = objc_msgSendSuper2(&v24, sel_initWithInfo_responder_, 0, 0);

    sub_245BC4D68(v14, v11);
    swift_release();
    swift_release();
  }
  return v12;
}

uint64_t sub_245BD8028()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >> 60 != 15)
    sub_245BC4C84(*(_QWORD *)(v0 + 16), v1);
  return swift_deallocObject();
}

uint64_t sub_245BD805C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_245BD8080()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

void __swiftcall SESecureCaptureOpenApplicationAction.init(coder:)(SESecureCaptureOpenApplicationAction_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

id SESecureCaptureOpenApplicationAction.init(coder:)(void *a1)
{
  id v2;
  objc_super v4;

  v4.super_class = (Class)SESecureCaptureOpenApplicationAction;
  v2 = objc_msgSendSuper2(&v4, sel_initWithCoder_, a1);

  return v2;
}

id SESecureCaptureOpenApplicationAction.init(xpcDictionary:)(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v1;
}

{
  id v1;
  objc_super v3;

  v3.super_class = (Class)SESecureCaptureOpenApplicationAction;
  v1 = objc_msgSendSuper2(&v3, sel_initWithXPCDictionary_, a1);
  swift_unknownObjectRelease();
  return v1;
}

uint64_t SESecureCaptureOpenApplicationAction.launchActions.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  void (*v17)(char *, _QWORD, uint64_t, uint64_t);
  unsigned int (*v18)(char *, uint64_t, uint64_t);
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257512EB0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v25 - v6;
  v8 = sub_245BD8984();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_245BD8E70())
    sub_245BCB8A4(MEMORY[0x24BEE4AF8]);
  else
    v12 = MEMORY[0x24BEE4B08];
  v29 = v12;
  v13 = objc_msgSend(v1, sel_info);
  if (!v13)
  {
    v27 = 0u;
    v28 = 0u;
LABEL_12:
    sub_245BC4F10((uint64_t)&v27, &qword_257512FF0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
    goto LABEL_13;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, sel_objectForSetting_, 0);

  if (v15)
  {
    sub_245BD8D50();
    swift_unknownObjectRelease();
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  sub_245BCB85C((uint64_t)&v25, (uint64_t)&v27);
  if (!*((_QWORD *)&v28 + 1))
    goto LABEL_12;
  v16 = swift_dynamicCast();
  v17 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56);
  v17(v7, v16 ^ 1u, 1, v8);
  v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v18(v7, 1, v8) == 1)
  {
LABEL_13:
    sub_245BC4F10((uint64_t)v7, &qword_257512EB0);
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v11, v8);
  v17(v5, 0, 1, v8);
  if (v18(v5, 1, v8) == 1)
  {
    v19 = 0;
  }
  else
  {
    v19 = (void *)sub_245BD8954();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBEC40]), sel_initWithURL_, v19);

  if (v24)
  {
    sub_245BCAACC(&v27, v24);

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
LABEL_14:
  v20 = objc_msgSend(v1, sel_info, v25, v26);
  if (!v20)
  {
    v27 = 0u;
    v28 = 0u;
LABEL_22:
    sub_245BC4F10((uint64_t)&v27, &qword_257512FF0);
    return v29;
  }
  v21 = v20;
  v22 = objc_msgSend(v20, sel_objectForSetting_, 1);

  if (v22)
  {
    sub_245BD8D50();
    swift_unknownObjectRelease();
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  sub_245BCB85C((uint64_t)&v25, (uint64_t)&v27);
  if (!*((_QWORD *)&v28 + 1))
    goto LABEL_22;
  sub_245BC4B08(0, &qword_257512FF8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_245BCAACC(&v27, (void *)v25);

  }
  return v29;
}

id SESecureCaptureOpenApplicationAction.init(info:responder:)(void *a1, void *a2)
{
  id v4;

  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_responder_, a1, a2);

  return v4;
}

void SESecureCaptureOpenApplicationAction.init(info:responder:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SESecureCaptureOpenApplicationAction.init(info:timeout:forResponseOn:withHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  void *v8;
  id v9;
  _QWORD v11[6];

  if (a3)
  {
    v11[4] = a3;
    v11[5] = a4;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_245BC9B64;
    v11[3] = &block_descriptor_9_0;
    v8 = _Block_copy(v11);
    swift_release();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, a1, a2, v8, a5);

  _Block_release(v8);
  return v9;
}

void SESecureCaptureOpenApplicationAction.init(info:timeout:forResponseOn:withHandler:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for SESecureCaptureOpenApplicationAction(uint64_t a1)
{
  return sub_245BC4B08(a1, &qword_257513628);
}

uint64_t sub_245BD88F4()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_245BD8900()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_245BD890C()
{
  return MEMORY[0x24BDCB9E0]();
}

uint64_t sub_245BD8918()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_245BD8924()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_245BD8930()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_245BD893C()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_245BD8948()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_245BD8954()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_245BD8960()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_245BD896C()
{
  return MEMORY[0x24BDCD9A0]();
}

uint64_t sub_245BD8978()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_245BD8984()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_245BD8990()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_245BD899C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_245BD89A8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_245BD89B4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_245BD89C0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_245BD89CC()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_245BD89D8()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_245BD89E4()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_245BD89F0()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_245BD89FC()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_245BD8A08()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_245BD8A14()
{
  return MEMORY[0x24BDC7A40]();
}

uint64_t sub_245BD8A20()
{
  return MEMORY[0x24BDC7A88]();
}

uint64_t sub_245BD8A2C()
{
  return MEMORY[0x24BDC7A90]();
}

uint64_t sub_245BD8A38()
{
  return MEMORY[0x24BDC7AC0]();
}

uint64_t sub_245BD8A44()
{
  return MEMORY[0x24BDC7AC8]();
}

uint64_t sub_245BD8A50()
{
  return MEMORY[0x24BDC7AD0]();
}

uint64_t sub_245BD8A5C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_245BD8A68()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_245BD8A74()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_245BD8A80()
{
  return MEMORY[0x24BEE5358]();
}

uint64_t sub_245BD8A8C()
{
  return MEMORY[0x24BDEF1B8]();
}

uint64_t sub_245BD8A98()
{
  return MEMORY[0x24BDEF1F8]();
}

uint64_t sub_245BD8AA4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_245BD8AB0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_245BD8ABC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_245BD8AC8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_245BD8AD4()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_245BD8AE0()
{
  return MEMORY[0x24BEE07C0]();
}

uint64_t sub_245BD8AEC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_245BD8AF8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_245BD8B04()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245BD8B10()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_245BD8B1C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_245BD8B28()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_245BD8B34()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_245BD8B40()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_245BD8B4C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_245BD8B58()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_245BD8B64()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_245BD8B70()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_245BD8B7C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_245BD8B88()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_245BD8B94()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_245BD8BA0()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_245BD8BAC()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_245BD8BB8()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_245BD8BC4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_245BD8BD0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_245BD8BDC()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_245BD8BE8()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_245BD8BF4()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_245BD8C00()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_245BD8C0C()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_245BD8C18()
{
  return MEMORY[0x24BEE15E8]();
}

uint64_t sub_245BD8C24()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_245BD8C30()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_245BD8C3C()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_245BD8C48()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_245BD8C54()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_245BD8C60()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_245BD8C6C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_245BD8C78()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_245BD8C84()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_245BD8C90()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_245BD8C9C()
{
  return MEMORY[0x24BEE57F8]();
}

uint64_t sub_245BD8CA8()
{
  return MEMORY[0x24BEE5810]();
}

uint64_t sub_245BD8CB4()
{
  return MEMORY[0x24BEE58A8]();
}

uint64_t sub_245BD8CC0()
{
  return MEMORY[0x24BEE58B0]();
}

uint64_t sub_245BD8CCC()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_245BD8CD8()
{
  return MEMORY[0x24BEE58C0]();
}

uint64_t sub_245BD8CE4()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_245BD8CF0()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_245BD8CFC()
{
  return MEMORY[0x24BEE58E0]();
}

uint64_t sub_245BD8D08()
{
  return MEMORY[0x24BEE5968]();
}

uint64_t sub_245BD8D14()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_245BD8D20()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_245BD8D2C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_245BD8D38()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_245BD8D44()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_245BD8D50()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_245BD8D5C()
{
  return MEMORY[0x24BEE2200]();
}

uint64_t sub_245BD8D68()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_245BD8D74()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_245BD8D80()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_245BD8D8C()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_245BD8D98()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_245BD8DA4()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_245BD8DB0()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_245BD8DBC()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_245BD8DC8()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_245BD8DD4()
{
  return MEMORY[0x24BEE6D58]();
}

uint64_t sub_245BD8DE0()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_245BD8DEC()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_245BD8DF8()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_245BD8E04()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_245BD8E10()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_245BD8E1C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245BD8E28()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_245BD8E34()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245BD8E40()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_245BD8E4C()
{
  return MEMORY[0x24BEE6F00]();
}

uint64_t sub_245BD8E58()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_245BD8E64()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_245BD8E70()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_245BD8E7C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_245BD8E88()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_245BD8E94()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_245BD8EA0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_245BD8EAC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_245BD8EB8()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_245BD8EC4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245BD8ED0()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_245BD8EDC()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_245BD8EE8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_245BD8EF4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_245BD8F00()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_245BD8F0C()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_245BD8F18()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_245BD8F24()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_245BD8F30()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_245BD8F3C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_245BD8F48()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_245BD8F54()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_245BD8F60()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245BD8F6C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_245BD8F78()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_245BD8F84()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_245BD8F90()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x24BE0BB30]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x24BE0BB60]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x24BEE7240]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

