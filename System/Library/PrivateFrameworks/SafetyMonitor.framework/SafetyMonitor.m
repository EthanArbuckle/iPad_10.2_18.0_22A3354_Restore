void RTCommonCalculateDistanceHighPrecision(double a1, double a2, double a3, double a4)
{
  RTCommonCalculateDistanceRadius(1, a1, a2, a3, a4);
}

void RTCommonCalculateDistance(double a1, double a2, double a3, double a4)
{
  RTCommonCalculateDistanceRadius(0, a1, a2, a3, a4);
}

void RTCommonCalculateBoundingBox(double *a1, double *a2, double *a3, double *a4, double a5, double a6, double a7)
{
  double v14;
  double v15;
  double v16;
  double v17;

  if (a1 && a2 && a3)
  {
    if (a4)
    {
      v16 = 0.0;
      v17 = 0.0;
      RTCommonGetDestinationCoordinate(&v17, &v16, a5, a6, 0.0, a7);
      v14 = vabdd_f64(v17, a5);
      RTCommonGetDestinationCoordinate(&v17, &v16, a5, a6, 90.0, a7);
      v15 = vabdd_f64(v16, a6);
      *a1 = a5 - v14;
      *a3 = v14 + a5;
      *a2 = a6 - v15;
      *a4 = v15 + a6;
    }
  }
}

double RTCommonGetDestinationCoordinate(double *a1, double *a2, double a3, double a4, double a5, double a6)
{
  double v8;
  double v9;
  double v10;
  __double2 v11;
  __double2 v12;
  __double2 v13;
  long double v14;
  long double v15;
  long double v16;
  double result;

  v8 = a4 * 0.0174532925;
  v9 = a5 * 0.0174532925;
  v10 = a6 / 6378137.0;
  v11 = __sincos_stret(a3 * 0.0174532925);
  v12 = __sincos_stret(v10);
  v13 = __sincos_stret(v9);
  v14 = asin(v13.__cosval * (v11.__cosval * v12.__sinval) + v11.__sinval * v12.__cosval);
  v15 = sin(v14);
  v16 = atan2(v11.__cosval * (v13.__sinval * v12.__sinval), v12.__cosval - v11.__sinval * v15);
  *a1 = v14 / 0.0174532925;
  result = (v8 + v16) / 0.0174532925;
  *a2 = result;
  return result;
}

void RTCommonCalculateDistanceRadius(int a1, double a2, double a3, double a4, double a5)
{
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  int v12;
  double v13;
  long double v14;
  long double v15;
  double v16;
  long double v17;
  long double v18;
  double v19;
  double v20;

  v7 = (a2 + a4) * 0.0174532925;
  if (a3 < 0.0)
    a3 = a3 + 360.0;
  if (a5 < 0.0)
    a5 = a5 + 360.0;
  v8 = a5 - a3;
  if (v8 <= 180.0)
  {
    if (v8 < -180.0)
      v8 = v8 + 360.0;
  }
  else
  {
    v8 = v8 + -360.0;
  }
  v9 = v7 * 0.5;
  v10 = (a4 - a2) * 0.0174532925;
  v11 = (int)v8;
  if ((int)v8 < 0)
    v11 = -v11;
  v12 = (int)a4 - (int)a2;
  if (v12 < 0)
    v12 = (int)a2 - (int)a4;
  v13 = v8 * 0.0174532925;
  if (v12 > 2 || v11 > 2)
  {
    if (a1)
      sin(v9);
    v14 = sin(v10 * 0.5);
    v15 = v14 * v14;
    v16 = cos(a2 * 0.0174532925);
    v17 = v16 * cos(a4 * 0.0174532925);
    v18 = sin(v13 * 0.5);
    v19 = v15 + v17 * (v18 * v18);
    v20 = 1.0 - v19;
    if (v19 < 0.0)
      v19 = 0.0;
    if (v20 < 0.0)
      v20 = 0.0;
    atan2(sqrt(v19), sqrt(v20));
  }
  else
  {
    __sincos_stret(v9);
  }
}

uint64_t variable initialization expression of SMActivityManager.activities()
{
  return MEMORY[0x24BEE4AF8];
}

unint64_t variable initialization expression of SMActivityManager.silentAudioFileName()
{
  return 0xD000000000000010;
}

id sub_245523EB4()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SMActivityManager()), sel_init);
  static SMActivityManager.shared = (uint64_t)result;
  return result;
}

uint64_t *SMActivityManager.shared.unsafeMutableAddressor()
{
  if (qword_254415870 != -1)
    swift_once();
  return &static SMActivityManager.shared;
}

id static SMActivityManager.shared.getter()
{
  if (qword_254415870 != -1)
    swift_once();
  return (id)static SMActivityManager.shared;
}

Swift::Void __swiftcall SMActivityManager.updateActivity(with:localState:shouldNotify:)(SMSessionManagerState *with, SMLocalSessionState localState, Swift::Bool shouldNotify)
{
  sub_245525C64(with, *(int *)&localState._unsupportedDeviceSeparationState);
}

uint64_t sub_2455240E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)(v7 + 160) = a7;
  *(_QWORD *)(v7 + 32) = a5;
  *(_QWORD *)(v7 + 40) = a6;
  *(_QWORD *)(v7 + 24) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484820);
  *(_QWORD *)(v7 + 48) = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257484770);
  *(_QWORD *)(v7 + 56) = v8;
  *(_QWORD *)(v7 + 64) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 72) = swift_task_alloc();
  sub_24558F494();
  *(_QWORD *)(v7 + 80) = swift_task_alloc();
  *(_QWORD *)(v7 + 88) = swift_task_alloc();
  sub_24558F788();
  *(_QWORD *)(v7 + 96) = swift_task_alloc();
  *(_QWORD *)(v7 + 104) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484828);
  *(_QWORD *)(v7 + 112) = swift_task_alloc();
  v9 = sub_24558F5CC();
  *(_QWORD *)(v7 + 120) = v9;
  *(_QWORD *)(v7 + 128) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v7 + 136) = swift_task_alloc();
  *(_QWORD *)(v7 + 144) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24552422C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(_QWORD, _QWORD);
  uint64_t v27;

  v1 = *(void **)(v0 + 24);
  sub_24558F5C0();
  if ((objc_msgSend(v1, sel_isPromptState) & 1) != 0
    || objc_msgSend(*(id *)(v0 + 24), sel_isCacheReleasedState))
  {
    v3 = *(_QWORD *)(v0 + 136);
    v2 = *(_QWORD *)(v0 + 144);
    v4 = *(_QWORD *)(v0 + 120);
    v5 = *(_QWORD *)(v0 + 128);
    sub_24558F5B4();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, v3, v4);
    if (qword_254415858 != -1)
      swift_once();
    v6 = sub_24558F728();
    __swift_project_value_buffer(v6, (uint64_t)qword_254415910);
    swift_retain_n();
    v7 = sub_24558F710();
    v8 = sub_24558F8C0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v27 = v10;
      *(_DWORD *)v9 = 136315138;
      v11 = sub_24558F530();
      *(_QWORD *)(v0 + 16) = sub_245524F90(v11, v12, &v27);
      sub_24558F914();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_245521000, v7, v8, "Alerting with only haptics - (%s)", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249537CD8](v10, -1, -1);
      MEMORY[0x249537CD8](v9, -1, -1);
    }
    else
    {
      swift_release_n();
    }

  }
  v13 = *(unsigned __int8 *)(v0 + 160);
  v14 = *(void **)(v0 + 24);
  _s13SafetyMonitor25SMInitiatorAlertUtilitiesC10alertTitle4with11addTimeMode12shortStrings05watchM0SSSo21SMSessionManagerStateCSg_S3btFZ_0(v14, 0, 0, 0);
  _s13SafetyMonitor25SMInitiatorAlertUtilitiesC12alertMessage4with11addTimeMode19isWatchNotification12shortStrings05watchP0SSSo21SMSessionManagerStateCSg_S4btFZ_0(v14, 0, 1, 0, 0);
  if (v13 == 1)
  {
    v15 = *(_QWORD *)(v0 + 136);
    v23 = *(_QWORD *)(v0 + 128);
    v24 = *(_QWORD *)(v0 + 120);
    v25 = *(_QWORD *)(v0 + 144);
    sub_24558F77C();
    sub_24558F770();
    sub_24558F764();
    swift_bridgeObjectRelease();
    sub_24558F770();
    sub_24558F488();
    sub_24558F77C();
    sub_24558F770();
    sub_24558F764();
    swift_bridgeObjectRelease();
    sub_24558F770();
    sub_24558F488();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v15, v25, v24);
    sub_24558F5D8();
    v16 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16 = 1;
  }
  v17 = *(_QWORD *)(v0 + 112);
  v18 = *(_QWORD *)(v0 + 48);
  v19 = sub_24558F5E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v17, v16, 1, v19);
  v20 = sub_24558F500();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v18, 1, 1, v20);
  sub_2455263B0();
  sub_2455263F4();
  sub_245526438();
  sub_24558F5A8();
  v26 = (uint64_t (*)(_QWORD, _QWORD))((int)*MEMORY[0x24BDB4748] + MEMORY[0x24BDB4748]);
  v21 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v21;
  *v21 = v0;
  v21[1] = sub_245524674;
  return v26(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 112));
}

uint64_t sub_245524674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 72);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_2455246E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);
  sub_24552647C(*(_QWORD *)(v0 + 112), &qword_257484828);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
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

Swift::Void __swiftcall SMActivityManager.endActivities()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  __int128 v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = v0;
  v2 = sub_24558F56C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254415848);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254415840);
  v8 = sub_24558F524();
  v9 = (uint64_t *)(v1 + OBJC_IVAR___SMActivityManagerInternal_activities);
  swift_beginAccess();
  *v9 = v8;
  swift_bridgeObjectRelease();
  v10 = *v9;
  if (!(v10 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v11 = sub_24558F98C();
  if (!v11)
    goto LABEL_15;
LABEL_3:
  if (v11 >= 1)
  {
    v13 = 0;
    v31 = v10 & 0xC000000000000001;
    *(_QWORD *)&v12 = 136315138;
    v28 = v12;
    v27[1] = MEMORY[0x24BEE4AD8] + 8;
    v29 = v10;
    v30 = v2;
    v32 = v11;
    do
    {
      if (v31)
        MEMORY[0x249537468](v13, v10);
      else
        swift_retain();
      if (qword_254415858 != -1)
        swift_once();
      v15 = sub_24558F728();
      __swift_project_value_buffer(v15, (uint64_t)qword_254415910);
      swift_retain_n();
      v16 = sub_24558F710();
      v17 = sub_24558F8C0();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = swift_slowAlloc();
        v19 = v7;
        v20 = v5;
        v21 = v3;
        v22 = swift_slowAlloc();
        v33 = v22;
        *(_DWORD *)v18 = v28;
        v23 = sub_24558F530();
        *(_QWORD *)(v18 + 4) = sub_245524F90(v23, v24, &v33);
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_245521000, v16, v17, "Ending activity -  (%s)", (uint8_t *)v18, 0xCu);
        swift_arrayDestroy();
        v25 = v22;
        v3 = v21;
        v5 = v20;
        v7 = v19;
        v10 = v29;
        MEMORY[0x249537CD8](v25, -1, -1);
        v26 = v18;
        v2 = v30;
        MEMORY[0x249537CD8](v26, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      ++v13;
      v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257484770);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v7, 1, 1, v14);
      sub_24558F560();
      sub_24558F53C();
      swift_release();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      sub_24552647C((uint64_t)v7, (uint64_t *)&unk_254415848);
    }
    while (v32 != v13);
    goto LABEL_15;
  }
  __break(1u);
}

Swift::Bool __swiftcall SMActivityManager.hasActivity()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254415840);
  v2 = sub_24558F524();
  v3 = (uint64_t *)(v1 + OBJC_IVAR___SMActivityManagerInternal_activities);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRelease();
  v4 = *v3;
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_24558F98C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 != 0;
}

id SMActivityManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SMActivityManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_245524DB8()
{
  uint64_t v0;

  v0 = sub_24558F728();
  __swift_allocate_value_buffer(v0, qword_254415910);
  __swift_project_value_buffer(v0, (uint64_t)qword_254415910);
  swift_bridgeObjectRetain();
  return sub_24558F71C();
}

uint64_t variable initialization expression of SMCloudKitFunctionSwift.logger()
{
  return sub_24558F71C();
}

unint64_t variable initialization expression of SMCloudKitFunctionSwift.containerName()
{
  return 0xD000000000000023;
}

id variable initialization expression of ContactsManager.store()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACF8]), sel_init);
}

uint64_t variable initialization expression of ContactsManager.keystoFetch()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257484BA0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2455943B0;
  v1 = (void *)*MEMORY[0x24BDBA288];
  v2 = (void *)*MEMORY[0x24BDBA348];
  *(_QWORD *)(v0 + 32) = *MEMORY[0x24BDBA288];
  *(_QWORD *)(v0 + 40) = v2;
  v3 = (void *)*MEMORY[0x24BDBA2C8];
  v4 = (void *)*MEMORY[0x24BDBA2C0];
  *(_QWORD *)(v0 + 48) = *MEMORY[0x24BDBA2C8];
  *(_QWORD *)(v0 + 56) = v4;
  v10 = v0;
  v5 = v1;
  v6 = v2;
  v7 = v3;
  v8 = v4;
  sub_24558F854();
  return v10;
}

uint64_t variable initialization expression of ContactsManager.cachedContact()
{
  return 0;
}

_QWORD *sub_245524F74@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_245524F84(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_245524F90(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_245525060(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24552621C((uint64_t)v12, *a3);
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
      sub_24552621C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_245525060(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24558F920();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_245525218(a5, a6);
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
  v8 = sub_24558F968();
  if (!v8)
  {
    sub_24558F980();
    __break(1u);
LABEL_17:
    result = sub_24558F998();
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

uint64_t sub_245525218(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2455252AC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_245525484(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_245525484(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2455252AC(uint64_t a1, unint64_t a2)
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
      v3 = sub_245525420(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24558F944();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24558F980();
      __break(1u);
LABEL_10:
      v2 = sub_24558F800();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24558F998();
    __break(1u);
LABEL_14:
    result = sub_24558F980();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245525420(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257484800);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_245525484(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257484800);
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
  result = sub_24558F998();
  __break(1u);
  return result;
}

_BYTE **sub_2455255D0(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void _s13SafetyMonitor17SMActivityManagerC13startActivity4with10localStateySo09SMSessiondI0CSg_So014SMLocalSessionI0CSgtF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t *, uint64_t, uint64_t);
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;

  v1 = v0;
  v2 = sub_24558F59C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484820);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257484770);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v44 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254415840);
  v11 = sub_24558F524();
  v12 = (uint64_t *)(v1 + OBJC_IVAR___SMActivityManagerInternal_activities);
  swift_beginAccess();
  *v12 = v11;
  swift_bridgeObjectRelease();
  if ((unint64_t)*v12 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_24558F98C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = *(_QWORD *)((*v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v13)
  {
    if (qword_254415858 != -1)
      swift_once();
    v14 = sub_24558F728();
    __swift_project_value_buffer(v14, (uint64_t)qword_254415910);
    v15 = sub_24558F710();
    v16 = sub_24558F8D8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_245521000, v15, v16, "Unable to start live activity - another activity is already active", v17, 2u);
      MEMORY[0x249537CD8](v17, -1, -1);
    }

  }
  else
  {
    v42 = v8;
    if (qword_254415858 != -1)
      swift_once();
    v40 = v2;
    v41 = v9;
    v39 = v5;
    v43 = v3;
    v18 = sub_24558F728();
    v38[1] = __swift_project_value_buffer(v18, (uint64_t)qword_254415910);
    v19 = sub_24558F710();
    v20 = sub_24558F8C0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_245521000, v19, v20, "Starting live activity", v21, 2u);
      MEMORY[0x249537CD8](v21, -1, -1);
    }

    v38[2] = sub_24558F7B8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257484848);
    v22 = sub_24558F554();
    v23 = *(_QWORD *)(v22 - 8);
    v24 = *(_QWORD *)(v23 + 72);
    v25 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_2455943C0;
    v27 = (uint64_t *)(v26 + v25);
    *v27 = sub_24558F7B8();
    v27[1] = v28;
    v29 = *MEMORY[0x24BDB47C0];
    v30 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v23 + 104);
    v30(v27, v29, v22);
    v31 = (uint64_t *)((char *)v27 + v24);
    *v31 = sub_24558F7B8();
    v31[1] = v32;
    v30(v31, v29, v22);
    v33 = sub_24558F500();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v7, 1, 1, v33);
    sub_2455263B0();
    sub_2455263F4();
    sub_245526438();
    sub_24558F5A8();
    sub_24558F578();
    v34 = v39;
    sub_24558F584();
    sub_24558F590();
    sub_24558F548();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v35 = swift_retain();
    MEMORY[0x24953733C](v35);
    v36 = v40;
    v37 = v43;
    if (*(_QWORD *)((*v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_24558F860();
    sub_24558F86C();
    sub_24558F854();
    swift_endAccess();
    swift_release();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v34, v36);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v44, v42);
  }
}

void sub_245525C64(void *a1, int a2)
{
  char *v2;
  char *v3;
  uint8_t *v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  char *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;

  v3 = v2;
  LODWORD(v4) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254415868);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254415840);
  v8 = sub_24558F524();
  v9 = (uint64_t *)&v3[OBJC_IVAR___SMActivityManagerInternal_activities];
  swift_beginAccess();
  *v9 = v8;
  swift_bridgeObjectRelease();
  v10 = *v9;
  if ((unint64_t)*v9 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_24558F98C())
      goto LABEL_3;
  }
  else
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11)
    {
LABEL_3:
      if ((v10 & 0xC000000000000001) != 0)
      {
        v12 = MEMORY[0x249537468](0, v10);
LABEL_6:
        swift_bridgeObjectRelease();
        if (objc_msgSend(a1, sel_sessionState) == (id)1)
        {
          if (qword_254415858 != -1)
            swift_once();
          v13 = sub_24558F728();
          __swift_project_value_buffer(v13, (uint64_t)qword_254415910);
          v14 = sub_24558F710();
          v15 = sub_24558F8D8();
          if (os_log_type_enabled(v14, v15))
          {
            v16 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v16 = 0;
            _os_log_impl(&dword_245521000, v14, v15, "Session is not active - end the activity instead of updating", v16, 2u);
            MEMORY[0x249537CD8](v16, -1, -1);
          }

          SMActivityManager.endActivities()();
          swift_release();
        }
        else
        {
          if (qword_254415858 != -1)
            swift_once();
          v17 = sub_24558F728();
          __swift_project_value_buffer(v17, (uint64_t)qword_254415910);
          swift_retain_n();
          v18 = sub_24558F710();
          v19 = sub_24558F8C0();
          if (os_log_type_enabled(v18, v19))
          {
            v20 = swift_slowAlloc();
            v34 = (int)v4;
            v4 = (uint8_t *)v20;
            v21 = swift_slowAlloc();
            v37 = v21;
            *(_DWORD *)v4 = 136315138;
            v35 = a1;
            v22 = sub_24558F530();
            v36 = sub_245524F90(v22, v23, &v37);
            a1 = v35;
            sub_24558F914();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_245521000, v18, v19, "Updating live activity - (%s)", v4, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x249537CD8](v21, -1, -1);
            v24 = v4;
            LOBYTE(v4) = v34;
            MEMORY[0x249537CD8](v24, -1, -1);

          }
          else
          {

            swift_release_n();
          }
          v25 = sub_24558F8A8();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v7, 1, 1, v25);
          v26 = swift_allocObject();
          *(_QWORD *)(v26 + 16) = 0;
          *(_QWORD *)(v26 + 24) = 0;
          *(_QWORD *)(v26 + 32) = a1;
          *(_QWORD *)(v26 + 40) = v3;
          *(_QWORD *)(v26 + 48) = v12;
          *(_BYTE *)(v26 + 56) = v4 & 1;
          v27 = a1;
          v28 = v3;
          sub_24553269C((uint64_t)v7, (uint64_t)&unk_257484818, v26);
          swift_release();
        }
        return;
      }
      if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v12 = *(_QWORD *)(v10 + 32);
        swift_retain();
        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_25;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_254415858 != -1)
LABEL_25:
    swift_once();
  v29 = sub_24558F728();
  __swift_project_value_buffer(v29, (uint64_t)qword_254415910);
  v30 = sub_24558F710();
  v31 = sub_24558F8D8();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_245521000, v30, v31, "Unable to update live activity - no activities found", v32, 2u);
    MEMORY[0x249537CD8](v32, -1, -1);
  }

}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249537C3C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t type metadata accessor for SMActivityManager()
{
  return objc_opt_self();
}

void type metadata accessor for SMInitiatorEligibilityStatus(uint64_t a1)
{
  sub_2455261B8(a1, &qword_2574847F0);
}

void type metadata accessor for SMSessionState(uint64_t a1)
{
  sub_2455261B8(a1, &qword_2574847F8);
}

void sub_2455261B8(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24552621C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

uint64_t sub_24552629C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2455262D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = *(_BYTE *)(v1 + 56);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_245526368;
  return sub_2455240E0(a1, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_245526368()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_2455263B0()
{
  unint64_t result;

  result = qword_257484830;
  if (!qword_257484830)
  {
    result = MEMORY[0x249537C54](&unk_2455945F4, &type metadata for SMActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_257484830);
  }
  return result;
}

unint64_t sub_2455263F4()
{
  unint64_t result;

  result = qword_257484838;
  if (!qword_257484838)
  {
    result = MEMORY[0x249537C54](&unk_2455945CC, &type metadata for SMActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_257484838);
  }
  return result;
}

unint64_t sub_245526438()
{
  unint64_t result;

  result = qword_257484840;
  if (!qword_257484840)
  {
    result = MEMORY[0x249537C54](&unk_24559458C, &type metadata for SMActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_257484840);
  }
  return result;
}

uint64_t sub_24552647C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t static SMInitiatorAlertUtilities.deepLinkURL(for:with:and:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
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
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  os_log_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  os_log_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574849E0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v58 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v58 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v58 - v20;
  if (!a1)
    goto LABEL_8;
  v22 = a1[2];
  if (!(v22 | a3))
  {
    if (qword_257484610 != -1)
      swift_once();
    v23 = sub_24558F728();
    __swift_project_value_buffer(v23, (uint64_t)qword_257486FF0);
    v24 = sub_24558F710();
    v25 = sub_24558F8D8();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_245521000, v24, v25, "Live Activity, deepLinkURL, unable to resolve conversation", v26, 2u);
      MEMORY[0x249537CD8](v26, -1, -1);
    }

    goto LABEL_8;
  }
  if (v22 < 2)
  {
    if (v22)
      goto LABEL_13;
LABEL_8:
    v27 = sub_24558F4C4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(a5, 1, 1, v27);
  }
  if (!a3)
  {
LABEL_13:
    v29 = a1[5];
    v64 = a1[4];
    v65 = v29;
    swift_bridgeObjectRetain();
    v66 = 0;
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v66 = 1;
  v64 = a2;
  v65 = a3;
LABEL_14:
  if (qword_257484610 != -1)
    swift_once();
  v30 = sub_24558F728();
  __swift_project_value_buffer(v30, (uint64_t)qword_257486FF0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v31 = sub_24558F710();
  v32 = sub_24558F8C0();
  v63 = v32;
  if (os_log_type_enabled(v31, v32))
  {
    v33 = swift_slowAlloc();
    v62 = a5;
    v34 = v33;
    v60 = swift_slowAlloc();
    v69 = v60;
    *(_DWORD *)v34 = 136315650;
    v61 = a4;
    v67 = (uint64_t)a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574849E8);
    v59 = v31;
    v35 = sub_24558F8FC();
    v67 = sub_245524F90(v35, v36, &v69);
    sub_24558F914();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    v67 = a2;
    v68 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574849F0);
    v37 = sub_24558F8FC();
    v67 = sub_245524F90(v37, v38, &v69);
    LOBYTE(a4) = v61;
    sub_24558F914();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 22) = 1024;
    LODWORD(v67) = a4 & 1;
    sub_24558F914();
    v39 = v59;
    _os_log_impl(&dword_245521000, v59, (os_log_type_t)v63, "Live Activity, deepLinkURL, receiverHandles, %s, groupID, %s, isSessionActive, %{BOOL}d", (uint8_t *)v34, 0x1Cu);
    v40 = v60;
    swift_arrayDestroy();
    MEMORY[0x249537CD8](v40, -1, -1);
    v41 = v34;
    a5 = v62;
    MEMORY[0x249537CD8](v41, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v42 = (void *)objc_opt_self();
  v43 = (void *)sub_24558F7AC();
  swift_bridgeObjectRelease();
  if ((a4 & 1) != 0)
  {
    if (v66)
    {
      v44 = (void *)sub_24558F830();
      v45 = objc_msgSend(v42, sel_createURLToDetailViewForGroupID_recipientHandles_, v43, v44);

      if (v45)
      {
        sub_24558F4B8();

        v46 = sub_24558F4C4();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56))(v16, 0, 1, v46);
      }
      else
      {
        v53 = sub_24558F4C4();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v16, 1, 1, v53);
      }
      v54 = (uint64_t)v16;
    }
    else
    {
      v49 = objc_msgSend(v42, sel_createURLToDetailViewForRecipientHandle_, v43);

      if (v49)
      {
        sub_24558F4B8();

        v50 = sub_24558F4C4();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v13, 0, 1, v50);
      }
      else
      {
        v56 = sub_24558F4C4();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v13, 1, 1, v56);
      }
      v54 = (uint64_t)v13;
    }
  }
  else if (v66)
  {
    v47 = objc_msgSend(v42, sel_createURLToConversationForGroupID_, v43);

    if (v47)
    {
      sub_24558F4B8();

      v48 = sub_24558F4C4();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v21, 0, 1, v48);
    }
    else
    {
      v55 = sub_24558F4C4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v21, 1, 1, v55);
    }
    v54 = (uint64_t)v21;
  }
  else
  {
    v51 = objc_msgSend(v42, sel_createURLToConversationForRecipientHandle_, v43);

    if (v51)
    {
      sub_24558F4B8();

      v52 = sub_24558F4C4();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(v19, 0, 1, v52);
    }
    else
    {
      v57 = sub_24558F4C4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v19, 1, 1, v57);
    }
    v54 = (uint64_t)v19;
  }
  return sub_24552E084(v54, a5, &qword_2574849E0);
}

id SMInitiatorAlertUtilities.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SMInitiatorAlertUtilities.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SMInitiatorAlertUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SMInitiatorAlertUtilities.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SMInitiatorAlertUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_245526D44()
{
  uint64_t v0;

  v0 = sub_24558F728();
  __swift_allocate_value_buffer(v0, qword_257486FF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_257486FF0);
  swift_bridgeObjectRetain();
  return sub_24558F71C();
}

uint64_t sub_245526DD8(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t result;

  sub_245524F90(0xD00000000000004DLL, 0x8000000245595B80, a3);
  v4 = *a1 + 8;
  result = sub_24558F914();
  *a1 = v4;
  return result;
}

uint64_t sub_245526E3C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_245526E58(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_245526E58(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257484BB0);
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
  result = sub_24558F998();
  __break(1u);
  return result;
}

id _s13SafetyMonitor25SMInitiatorAlertUtilitiesC21recipientsDisplayNameySSSgSo14SMConversationCSgFZ_0(id result)
{
  void *v1;
  unint64_t v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43[3];
  uint64_t v44;
  unint64_t v45;

  v44 = 0;
  v45 = 0;
  if (result)
  {
    v1 = result;
    v2 = (unint64_t)result;
    v3 = objc_msgSend((id)v2, sel_receiverHandles);
    sub_24552DEE8(0, &qword_257484A20);
    v4 = sub_24558F83C();

    if (v4 >> 62)
    {
LABEL_38:
      swift_bridgeObjectRetain();
      v5 = sub_24558F98C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v5 >= 2)
    {
      v6 = objc_msgSend((id)v2, sel_displayName);
      if (v6)
      {
        v7 = v6;
        v8 = sub_24558F7B8();
        v10 = v9;

        v44 = v8;
        v45 = v10;
        v11 = qword_257484610;
        swift_bridgeObjectRetain();
        if (v11 != -1)
          swift_once();
        v12 = sub_24558F728();
        __swift_project_value_buffer(v12, (uint64_t)qword_257486FF0);
        swift_bridgeObjectRetain();
        v13 = sub_24558F710();
        v14 = sub_24558F8C0();
        if (!os_log_type_enabled(v13, v14))
        {

          swift_bridgeObjectRelease_n();
          goto LABEL_36;
        }
        v15 = swift_slowAlloc();
        v16 = swift_slowAlloc();
        v43[0] = v16;
        *(_DWORD *)v15 = 136315394;
        sub_245524F90(0xD000000000000019, 0x8000000245595B10, v43);
        sub_24558F914();
        *(_WORD *)(v15 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_245524F90(v8, v10, v43);
        sub_24558F914();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_245521000, v13, v14, "%s, got group chat display name %s", (uint8_t *)v15, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x249537CD8](v16, -1, -1);
        v17 = v15;
LABEL_33:
        MEMORY[0x249537CD8](v17, -1, -1);

LABEL_36:
        swift_beginAccess();
        return (id)v44;
      }
      if (qword_257484610 == -1)
      {
LABEL_31:
        v37 = sub_24558F728();
        __swift_project_value_buffer(v37, (uint64_t)qword_257486FF0);
        v13 = sub_24558F710();
        v38 = sub_24558F8C0();
        if (!os_log_type_enabled(v13, v38))
        {

          goto LABEL_36;
        }
        v39 = (uint8_t *)swift_slowAlloc();
        v40 = swift_slowAlloc();
        v43[0] = v40;
        *(_DWORD *)v39 = 136315138;
        sub_245524F90(0xD000000000000019, 0x8000000245595B10, v43);
        sub_24558F914();
        _os_log_impl(&dword_245521000, v13, v38, "%s, no custom group chat display name found", v39, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249537CD8](v40, -1, -1);
        v17 = (uint64_t)v39;
        goto LABEL_33;
      }
LABEL_44:
      swift_once();
      goto LABEL_31;
    }
    if (qword_257484708 != -1)
      swift_once();
    v2 = (unint64_t)(id)v2;
    v18 = ContactsManager.activeSessionRecipientContacts(for:)(v1);

    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      v19 = sub_24558F98C();
      swift_bridgeObjectRelease();
      v41 = (void *)v2;
      if (v19)
        goto LABEL_15;
    }
    else
    {
      v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
      v41 = (void *)v2;
      if (v19)
      {
LABEL_15:
        v43[0] = MEMORY[0x24BEE4AF8];
        sub_245526E3C(0, v19 & ~(v19 >> 63), 0);
        if (v19 < 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v20 = (_QWORD *)v43[0];
        v42 = (id)objc_opt_self();
        v21 = 0;
        v4 = v18 & 0xC000000000000001;
        v1 = (void *)v18;
        do
        {
          if (v19 == v21)
          {
            __break(1u);
            goto LABEL_38;
          }
          if (v4)
            v22 = (id)MEMORY[0x249537468](v21, v18);
          else
            v22 = *(id *)(v18 + 8 * v21 + 32);
          v23 = v22;
          result = objc_msgSend(v42, sel_componentsForContact_, v22, v41);
          if (!result)
          {
            __break(1u);
            return result;
          }
          v24 = result;
          v25 = objc_msgSend((id)objc_opt_self(), sel_localizedStringFromPersonNameComponents_style_options_, result, 1, 0);
          v26 = sub_24558F7B8();
          v28 = v27;

          v43[0] = (uint64_t)v20;
          v2 = v20[2];
          v29 = v20[3];
          if (v2 >= v29 >> 1)
          {
            sub_245526E3C(v29 > 1, v2 + 1, 1);
            v20 = (_QWORD *)v43[0];
          }
          ++v21;
          v20[2] = v2 + 1;
          v30 = &v20[2 * v2];
          v30[4] = v26;
          v30[5] = v28;
          v18 = (unint64_t)v1;
        }
        while (v19 != v21);
        swift_bridgeObjectRelease();
        if (!v20[2])
          goto LABEL_41;
        goto LABEL_26;
      }
    }
    swift_bridgeObjectRelease();
    v20 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (!*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    {
LABEL_41:
      swift_bridgeObjectRelease();
      __break(1u);
LABEL_42:
      swift_once();
LABEL_27:
      v32 = sub_24558F728();
      __swift_project_value_buffer(v32, (uint64_t)qword_257486FF0);
      swift_bridgeObjectRetain();
      v33 = sub_24558F710();
      v34 = sub_24558F8C0();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v43[0] = v36;
        *(_DWORD *)v35 = 136315394;
        sub_245524F90(0xD000000000000019, 0x8000000245595B10, v43);
        sub_24558F914();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_245524F90(v19, v4, v43);
        sub_24558F914();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_245521000, v33, v34, "%s, got contact name \"%s\"", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x249537CD8](v36, -1, -1);
        MEMORY[0x249537CD8](v35, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      goto LABEL_36;
    }
LABEL_26:
    v19 = v20[4];
    v4 = v20[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v44 = v19;
    v45 = v4;
    v31 = qword_257484610;
    swift_bridgeObjectRetain();
    if (v31 == -1)
      goto LABEL_27;
    goto LABEL_42;
  }
  return result;
}

uint64_t _s13SafetyMonitor25SMInitiatorAlertUtilitiesC10alertTitle4with11addTimeMode12shortStrings05watchM0SSSo21SMSessionManagerStateCSg_S3btFZ_0(void *a1, char a2, int a3, int a4)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t ObjCClassFromMetadata;
  id v33;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  char v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  char v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  _BYTE *v74;
  uint64_t v75;
  unsigned int (*v76)(_BYTE *, uint64_t, uint64_t);
  id v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void (*v83)(_BYTE *, uint64_t);
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  _BYTE *v91;
  id v92;
  uint64_t v93;
  id v94;
  void *v95;
  id v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  id v100;
  _BYTE v101[4];
  unsigned int v102;
  id v103;
  id v104;
  id v105;
  _BYTE *v106;
  _BYTE *v107;
  _BYTE *v108;
  _BYTE *v109;
  _BYTE *v110;
  _BYTE *v111;
  _BYTE *v112;
  _BYTE *v113;
  int v114;
  int v115;
  uint64_t v116;
  uint64_t v117[3];

  v114 = a4;
  v115 = a3;
  v6 = sub_24558F788();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v107 = &v101[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = MEMORY[0x24BDAC7A8](v7);
  v108 = &v101[-v10];
  v11 = MEMORY[0x24BDAC7A8](v9);
  v111 = &v101[-v12];
  v13 = MEMORY[0x24BDAC7A8](v11);
  v109 = &v101[-v14];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  MEMORY[0x24BDAC7A8](v18);
  v20 = &v101[-v19];
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484820);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v110 = &v101[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = MEMORY[0x24BDAC7A8](v22);
  v112 = &v101[-v25];
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = &v101[-v27];
  MEMORY[0x24BDAC7A8](v26);
  v113 = &v101[-v29];
  v30 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v30);
  v31 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v31);
  if ((a2 & 1) != 0)
  {
    sub_24558F758();
    sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v33 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    sub_24558F50C();
    return sub_24558F7C4();
  }
  if (!a1)
  {
LABEL_8:
    if (qword_257484610 != -1)
      swift_once();
    v41 = sub_24558F728();
    __swift_project_value_buffer(v41, (uint64_t)qword_257486FF0);
    v42 = sub_24558F710();
    v43 = sub_24558F8D8();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = swift_slowAlloc();
      *(_DWORD *)v44 = 136315138;
      v117[0] = v45;
      v116 = sub_245524F90(0xD000000000000037, 0x8000000245597F10, v117);
      sub_24558F914();
      _os_log_impl(&dword_245521000, v42, v43, "Invalid Session State in %s!", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249537CD8](v45, -1, -1);
      MEMORY[0x249537CD8](v44, -1, -1);
    }

    sub_24558F758();
    sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
    v46 = swift_getObjCClassFromMetadata();
    v47 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v46);
    sub_24558F50C();
    return sub_24558F7D0();
  }
  v35 = a1;
  v36 = objc_msgSend(v35, sel_configuration);
  if (!v36)
  {

    goto LABEL_8;
  }
  v105 = v36;
  v106 = v20;
  v37 = objc_msgSend(v35, sel_configuration);
  if (v37)
  {
    v38 = v37;
    v39 = v35;
    v40 = objc_msgSend(v37, sel_conversation);

    v102 = objc_msgSend(v40, sel_isGroup);
    v35 = v39;
  }
  else
  {
    v102 = 0;
  }
  v104 = v35;
  v50 = objc_msgSend(v35, sel_configuration);
  if (v50)
  {
    v51 = v50;
    v52 = objc_msgSend(v50, sel_conversation);

  }
  else
  {
    v52 = 0;
  }
  v103 = _s13SafetyMonitor25SMInitiatorAlertUtilitiesC21recipientsDisplayNameySSSgSo14SMConversationCSgFZ_0(v52);
  v54 = v53;

  v55 = v104;
  switch((unint64_t)objc_msgSend(v104, sel_sessionState))
  {
    case 2uLL:
      swift_bridgeObjectRelease();
      v56 = objc_msgSend(v55, sel_estimatedEndDateStatus);
      v57 = v114;
      if (v56 == (id)2 && (v114 & 1) == 0)
        goto LABEL_84;
      v64 = objc_msgSend(v55, sel_estimatedEndDateStatus);
      v65 = v115;
      if (v64 == (id)3 && (v115 & 1) == 0 && (v57 & 1) == 0)
      {
        v66 = objc_msgSend(v55, sel_estimatedEndDate);
        if (v66)
        {
          v67 = v66;
          sub_24558F4E8();

          v68 = sub_24558F500();
          (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 56))(v28, 0, 1, v68);
        }
        else
        {
          v68 = sub_24558F500();
          (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 56))(v28, 1, 1, v68);
        }
        v74 = v113;
        sub_24552E084((uint64_t)v28, (uint64_t)v113, &qword_257484820);
        sub_24558F500();
        v75 = *(_QWORD *)(v68 - 8);
        v76 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v75 + 48);
        if (v76(v74, 1, v68) != 1)
        {
          v82 = (void *)sub_24558F4D0();
          v83 = *(void (**)(_BYTE *, uint64_t))(v75 + 8);
          v83(v74, v68);
          v84 = objc_msgSend(v55, sel_coarseEstimatedEndDate);
          if (v84)
          {
            v85 = v84;
            v86 = (uint64_t)v110;
            sub_24558F4E8();

            v87 = 0;
          }
          else
          {
            v87 = 1;
            v86 = (uint64_t)v110;
          }
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v75 + 56))(v86, v87, 1, v68);
          v91 = v112;
          sub_24552E084(v86, (uint64_t)v112, &qword_257484820);
          if (v76(v91, 1, v68) == 1)
          {
            sub_24552E0C8((uint64_t)v91);
            sub_24558F77C();
            sub_24558F770();
            v92 = objc_msgSend(v82, sel_absoluteTimeString_preposition_capitalized_, 0, 0, 0);
            sub_24558F7B8();

            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F794();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v93 = swift_getObjCClassFromMetadata();
            v94 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v93);
            sub_24558F50C();
            v48 = sub_24558F7D0();

          }
          else
          {
            v95 = (void *)sub_24558F4D0();
            v83(v91, v68);
            sub_24558F77C();
            sub_24558F770();
            v96 = objc_msgSend(v95, sel_absoluteTimeString_preposition_capitalized_, 0, 0, 0);
            sub_24558F7B8();

            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F794();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v97 = swift_getObjCClassFromMetadata();
            v98 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v97);
            sub_24558F50C();
            v48 = sub_24558F7D0();

          }
          goto LABEL_103;
        }
        sub_24552E0C8((uint64_t)v74);
      }
      if (objc_msgSend(v55, sel_estimatedEndDateStatus) == (id)3)
      {
        v77 = objc_msgSend(v55, sel_configuration);
        if (v77)
        {
          v78 = v77;
          v79 = objc_msgSend(v77, sel_sessionType);

          if (v79 == (id)4 && (v57 & 1) == 0 && (v65 & 1) == 0)
            goto LABEL_53;
        }
      }
      goto LABEL_84;
    case 4uLL:
      if ((v115 & 1) != 0)
      {
        if (!v102)
          goto LABEL_100;
        if (v54)
          goto LABEL_27;
LABEL_75:
        sub_24558F758();
        goto LABEL_28;
      }
      if ((v114 & 1) != 0)
        goto LABEL_35;
      v72 = v105;
      if (objc_msgSend(v105, sel_sessionType) == (id)1)
      {
        if (v102)
        {
          if (v54)
            goto LABEL_100;
LABEL_84:
          sub_24558F758();
          sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
          v80 = swift_getObjCClassFromMetadata();
          v59 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v80);
LABEL_85:
          v59;
          sub_24558F50C();
          goto LABEL_86;
        }
      }
      else if (v102)
      {
        if (v54)
          goto LABEL_100;
        goto LABEL_84;
      }
      sub_24558F77C();
      sub_24558F770();
      sub_24558F764();
      swift_bridgeObjectRelease();
      sub_24558F770();
      sub_24558F794();
      sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
      v89 = swift_getObjCClassFromMetadata();
      v90 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v89);
      sub_24558F50C();
      v48 = sub_24558F7D0();

      return v48;
    case 7uLL:
      swift_bridgeObjectRelease();
      if ((v115 & 1) != 0 || (v114 & 1) != 0)
        goto LABEL_53;
      goto LABEL_51;
    case 9uLL:
      swift_bridgeObjectRelease();
      if ((v115 & 1) != 0 || (v114 & 1) != 0)
        goto LABEL_51;
      goto LABEL_53;
    case 0xCuLL:
      if ((v115 & 1) != 0)
      {
        if (objc_msgSend(v55, sel_sessionEndReason) == (id)9)
        {
LABEL_35:
          swift_bridgeObjectRelease();
          sub_24558F758();
          sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
          v62 = swift_getObjCClassFromMetadata();
          v63 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v62);
          sub_24558F50C();
          goto LABEL_101;
        }
        if (!v102 || v54)
          goto LABEL_100;
LABEL_51:
        sub_24558F758();
        sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
        v69 = swift_getObjCClassFromMetadata();
        v70 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v69);
        sub_24558F50C();
        goto LABEL_101;
      }
      if ((v114 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        objc_msgSend(v55, sel_sessionEndReason);
        goto LABEL_51;
      }
      if (objc_msgSend(v55, sel_sessionEndReason) == (id)1)
      {
        if (v102)
        {
          if (v54)
            goto LABEL_100;
LABEL_53:
          sub_24558F758();
          sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
          v71 = swift_getObjCClassFromMetadata();
          objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v71);
          sub_24558F50C();
        }
        else
        {
          sub_24558F77C();
          sub_24558F770();
          sub_24558F764();
          swift_bridgeObjectRelease();
          sub_24558F770();
          sub_24558F794();
          sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
          v88 = swift_getObjCClassFromMetadata();
          objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v88);
          sub_24558F50C();
        }
LABEL_86:
        v81 = sub_24558F7D0();
        goto LABEL_102;
      }
      if (objc_msgSend(v55, sel_sessionEndReason) == (id)9)
      {
        swift_bridgeObjectRelease();
        sub_24558F758();
        sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
        v73 = swift_getObjCClassFromMetadata();
        objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v73);
        sub_24558F50C();
        goto LABEL_86;
      }
      if (!v102)
      {
LABEL_100:
        sub_24558F77C();
        sub_24558F770();
        sub_24558F764();
        swift_bridgeObjectRelease();
        sub_24558F770();
        sub_24558F794();
        sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
        v99 = swift_getObjCClassFromMetadata();
        v100 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v99);
        sub_24558F50C();
        goto LABEL_101;
      }
      if (!v54)
        goto LABEL_75;
LABEL_27:
      sub_24558F77C();
      sub_24558F770();
      sub_24558F764();
      swift_bridgeObjectRelease();
      sub_24558F770();
      sub_24558F794();
LABEL_28:
      sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
      v60 = swift_getObjCClassFromMetadata();
      v61 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v60);
      sub_24558F50C();
LABEL_101:
      v81 = sub_24558F7C4();
LABEL_102:
      v48 = v81;
LABEL_103:

      return v48;
    case 0xEuLL:
      swift_bridgeObjectRelease();
      if ((v115 & 1) != 0 || (v114 & 1) != 0)
        goto LABEL_53;
      goto LABEL_51;
    default:
      swift_bridgeObjectRelease();
      sub_24558F758();
      sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
      v58 = swift_getObjCClassFromMetadata();
      v59 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v58);
      goto LABEL_85;
  }
}

uint64_t _s13SafetyMonitor25SMInitiatorAlertUtilitiesC12alertMessage4with11addTimeMode19isWatchNotification12shortStrings05watchP0SSSo21SMSessionManagerStateCSg_S4btFZ_0(void *a1, char a2, int a3, int a4, int a5)
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
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  id v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  uint64_t v88;
  uint64_t ObjCClassFromMetadata;
  uint64_t v90;
  id v92;
  void *v93;
  id v94;
  uint64_t v95;
  id v96;
  id v97;
  void *v98;
  void (*v99)(char *, NSObject *);
  char *v100;
  NSObject *v101;
  id v102;
  uint64_t v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  id v109;
  id v110;
  uint64_t v111;
  id v112;
  void *v113;
  id v114;
  NSObject *v115;
  void (*v116)(char *, char *, NSObject *);
  uint64_t v117;
  char *v118;
  NSObject *v119;
  char *v120;
  void *v121;
  id v122;
  _QWORD *v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  NSObject *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  os_log_type_t v135;
  uint8_t *v136;
  NSObject *v137;
  id v138;
  NSObject *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  id v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  void *v153;
  uint64_t v154;
  NSObject *v155;
  void (*v156)(char *, uint64_t, uint64_t, NSObject *);
  char *v157;
  uint64_t v158;
  _QWORD *v159;
  uint64_t v160;
  uint64_t v161;
  id v162;
  NSObject *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t inited;
  os_log_type_t v171;
  uint8_t *v172;
  id v173;
  NSObject *v174;
  uint64_t v175;
  uint64_t v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  NSObject *v186;
  uint64_t v187;
  unsigned int (*v188)(uint64_t, uint64_t, NSObject *);
  void *v189;
  void (*v190)(uint64_t, NSObject *);
  id v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  id v200;
  uint64_t v201;
  id v202;
  uint64_t v203;
  void *v204;
  id v205;
  void *v206;
  id v207;
  uint64_t v208;
  id v209;
  uint64_t v210;
  id v211;
  uint64_t v212;
  void *v213;
  id v214;
  id v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  id v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  id v224;
  uint64_t v225;
  uint64_t v226;
  id v227;
  unsigned int v228;
  uint64_t v229;
  id v230;
  id v231;
  int v232;
  char *v233;
  char *v234;
  char *v235;
  char *v236;
  char *v237;
  char *v238;
  char *v239;
  char *v240;
  char *v241;
  char *v242;
  char *v243;
  char *v244;
  char *v245;
  char *v246;
  char *v247;
  char *v248;
  char *v249;
  char *v250;
  char *v251;
  char *v252;
  char *v253;
  char *v254;
  uint64_t v255;
  char *v256;
  char *v257;
  uint64_t v258;
  char *v259;
  char *v260;
  char *v261;
  char *v262;
  uint64_t v263;
  uint64_t v264;
  NSObject *isa;
  NSObject *v266;
  char *v267;
  _QWORD *v268;
  int v269;
  uint64_t v270;
  uint64_t v271[3];

  v269 = a5;
  LODWORD(v264) = a3;
  v268 = (_QWORD *)sub_24558F728();
  v263 = *(v268 - 1);
  v8 = MEMORY[0x24BDAC7A8](v268);
  v262 = (char *)&v227 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v260 = (char *)&v227 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484820);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v254 = (char *)&v227 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v255 = (uint64_t)&v227 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v257 = (char *)&v227 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v258 = (uint64_t)&v227 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v259 = (char *)&v227 - v20;
  v21 = sub_24558F788();
  v22 = MEMORY[0x24BDAC7A8](v21);
  v251 = (char *)&v227 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v246 = (char *)&v227 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v245 = (char *)&v227 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v243 = (char *)&v227 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v235 = (char *)&v227 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v241 = (char *)&v227 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v237 = (char *)&v227 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v234 = (char *)&v227 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v236 = (char *)&v227 - v39;
  v40 = MEMORY[0x24BDAC7A8](v38);
  v240 = (char *)&v227 - v41;
  v42 = MEMORY[0x24BDAC7A8](v40);
  v247 = (char *)&v227 - v43;
  v44 = MEMORY[0x24BDAC7A8](v42);
  v244 = (char *)&v227 - v45;
  v46 = MEMORY[0x24BDAC7A8](v44);
  v242 = (char *)&v227 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v239 = (char *)&v227 - v49;
  v50 = MEMORY[0x24BDAC7A8](v48);
  v238 = (char *)&v227 - v51;
  v52 = MEMORY[0x24BDAC7A8](v50);
  v249 = (char *)&v227 - v53;
  v54 = MEMORY[0x24BDAC7A8](v52);
  v55 = MEMORY[0x24BDAC7A8](v54);
  v56 = MEMORY[0x24BDAC7A8](v55);
  v253 = (char *)&v227 - v57;
  v58 = MEMORY[0x24BDAC7A8](v56);
  v248 = (char *)&v227 - v59;
  v60 = MEMORY[0x24BDAC7A8](v58);
  v250 = (char *)&v227 - v61;
  v62 = MEMORY[0x24BDAC7A8](v60);
  v256 = (char *)&v227 - v63;
  v64 = MEMORY[0x24BDAC7A8](v62);
  v261 = (char *)&v227 - v65;
  MEMORY[0x24BDAC7A8](v64);
  v66 = sub_24558F500();
  isa = v66[-1].isa;
  v266 = v66;
  v67 = MEMORY[0x24BDAC7A8](v66);
  v252 = (char *)&v227 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = MEMORY[0x24BDAC7A8](v67);
  v71 = (char *)&v227 - v70;
  MEMORY[0x24BDAC7A8](v69);
  v73 = (char *)&v227 - v72;
  v74 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v74);
  v76 = (char *)&v227 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v77);
  v79 = (char *)&v227 - ((v78 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
LABEL_12:
    sub_24558F758();
    sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    sub_24558F50C();
    return sub_24558F7D0();
  }
  v232 = a4;
  v233 = v79;
  v267 = v76;
  if (!a1)
  {
LABEL_7:
    if (qword_257484610 != -1)
      swift_once();
    __swift_project_value_buffer((uint64_t)v268, (uint64_t)qword_257486FF0);
    v85 = sub_24558F710();
    v86 = sub_24558F8D8();
    if (os_log_type_enabled(v85, v86))
    {
      v87 = (uint8_t *)swift_slowAlloc();
      v88 = swift_slowAlloc();
      v271[0] = v88;
      *(_DWORD *)v87 = 136315138;
      v270 = sub_245524F90(0xD00000000000004DLL, 0x8000000245595B80, v271);
      sub_24558F914();
      _os_log_impl(&dword_245521000, v85, v86, "Invalid Session State in %s!", v87, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249537CD8](v88, -1, -1);
      MEMORY[0x249537CD8](v87, -1, -1);
    }

    goto LABEL_12;
  }
  v80 = a1;
  v81 = objc_msgSend(v80, sel_configuration);
  if (!v81)
  {

    goto LABEL_7;
  }
  v230 = v81;
  v82 = objc_msgSend(v80, sel_configuration);
  v231 = v80;
  if (v82)
  {
    v83 = v82;
    v84 = objc_msgSend(v82, sel_conversation);

    v228 = objc_msgSend(v84, sel_isGroup);
    v80 = v231;
  }
  else
  {
    v228 = 0;
  }
  v92 = objc_msgSend(v80, sel_configuration);
  if (v92)
  {
    v93 = v92;
    v94 = objc_msgSend(v92, (SEL)&selRef_locationOfTrigger + 5);

  }
  else
  {
    v94 = 0;
  }
  v227 = _s13SafetyMonitor25SMInitiatorAlertUtilitiesC21recipientsDisplayNameySSSgSo14SMConversationCSgFZ_0(v94);
  v229 = v95;

  v96 = v231;
  switch((unint64_t)objc_msgSend(v231, sel_sessionState))
  {
    case 2uLL:
      v109 = v230;
      v110 = objc_msgSend(v230, sel_sessionType);
      if (v110 == (id)4)
      {
        if ((v269 & 1) != 0 || (v232 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          sub_24558F758();
          sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
          v182 = swift_getObjCClassFromMetadata();
          v183 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v182);
          sub_24558F50C();
          v184 = sub_24558F7C4();
        }
        else
        {
          if (v228)
          {
            if (!v229)
              goto LABEL_42;
            goto LABEL_103;
          }
          sub_24558F77C();
          sub_24558F770();
          sub_24558F764();
          swift_bridgeObjectRelease();
          sub_24558F770();
          sub_24558F794();
          sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
          v199 = swift_getObjCClassFromMetadata();
          v200 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v199);
          sub_24558F50C();
          v184 = sub_24558F7D0();
        }
        v90 = v184;

        return v90;
      }
      v111 = v229;
      if (v110 == (id)2)
      {
        v152 = objc_msgSend(v96, sel_estimatedEndDate);
        if (v152)
        {
          v153 = v152;
          v154 = (uint64_t)v257;
          sub_24558F4E8();

          v155 = isa;
          v156 = (void (*)(char *, uint64_t, uint64_t, NSObject *))isa[7].isa;
          v157 = (char *)v154;
          v158 = 0;
        }
        else
        {
          v155 = isa;
          v156 = (void (*)(char *, uint64_t, uint64_t, NSObject *))isa[7].isa;
          v154 = (uint64_t)v257;
          v157 = v257;
          v158 = 1;
        }
        v186 = v266;
        v156(v157, v158, 1, v266);
        v187 = v258;
        sub_24552E084(v154, v258, &qword_257484820);
        v188 = (unsigned int (*)(uint64_t, uint64_t, NSObject *))v155[6].isa;
        if (v188(v187, 1, v186) == 1)
        {
          sub_24552E0C8(v187);
          if ((v232 & 1) != 0)
          {
            if (v228 && !v111)
            {
LABEL_70:
              sub_24558F758();
              sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
              v176 = swift_getObjCClassFromMetadata();
              v177 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v176);
              sub_24558F50C();
LABEL_71:
              v178 = sub_24558F7C4();
LABEL_94:
              v90 = v178;
LABEL_121:

              return v90;
            }
LABEL_103:
            sub_24558F77C();
            sub_24558F770();
            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F794();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v201 = swift_getObjCClassFromMetadata();
            v202 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v201);
            sub_24558F50C();
            goto LABEL_71;
          }
          if (v228)
          {
            if (v111)
              goto LABEL_103;
LABEL_42:
            sub_24558F758();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v141 = swift_getObjCClassFromMetadata();
            objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v141);
            sub_24558F50C();
          }
          else
          {
            sub_24558F77C();
            sub_24558F770();
            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F794();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v217 = swift_getObjCClassFromMetadata();
            objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v217);
            sub_24558F50C();
          }
LABEL_93:
          v178 = sub_24558F7D0();
          goto LABEL_94;
        }
        v189 = (void *)sub_24558F4D0();
        v190 = (void (*)(uint64_t, NSObject *))v155[1].isa;
        v190(v187, v186);
        v268 = v189;
        v191 = objc_msgSend(v96, sel_coarseEstimatedEndDate);
        if (v191)
        {
          v192 = v191;
          v193 = (uint64_t)v254;
          sub_24558F4E8();

          v194 = 0;
        }
        else
        {
          v194 = 1;
          v193 = (uint64_t)v254;
        }
        v156((char *)v193, v194, 1, v186);
        v203 = v255;
        sub_24552E084(v193, v255, &qword_257484820);
        if (v188(v203, 1, v186) == 1)
        {
          sub_24552E0C8(v203);
          v204 = 0;
          v205 = v268;
        }
        else
        {
          v206 = (void *)sub_24558F4D0();
          v190(v203, v186);
          v205 = v206;

          v204 = v205;
        }
        v207 = objc_msgSend(v205, sel_absoluteTimeString_preposition_capitalized_, 0, 0, 0);
        sub_24558F7B8();

        if ((v232 & 1) != 0)
        {
          if (v228)
          {
            if (v111)
            {
LABEL_111:
              sub_24558F77C();
              sub_24558F770();
              sub_24558F764();
              swift_bridgeObjectRelease();
              sub_24558F770();
              sub_24558F764();
              swift_bridgeObjectRelease();
              sub_24558F770();
              sub_24558F794();
              sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
              v208 = swift_getObjCClassFromMetadata();
              v209 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v208);
              sub_24558F50C();
LABEL_112:
              v210 = sub_24558F7C4();
LABEL_147:
              v90 = v210;

              return v90;
            }
            goto LABEL_144;
          }
          goto LABEL_124;
        }
        v211 = v231;
        if (objc_msgSend(v231, sel_estimatedEndDateStatus) == (id)1)
        {
          if ((v269 & 1) != 0)
          {
LABEL_115:
            swift_bridgeObjectRelease();
            sub_24558F77C();
            sub_24558F770();
            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F794();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v212 = swift_getObjCClassFromMetadata();
            objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v212);
            sub_24558F50C();
            goto LABEL_146;
          }
          swift_bridgeObjectRelease();
          v220 = objc_msgSend(v205, sel_absoluteTimeString_preposition_capitalized_, 0, 1, 0);
          sub_24558F7B8();

          if (!v228)
          {
LABEL_124:
            sub_24558F77C();
            sub_24558F770();
            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F794();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v218 = swift_getObjCClassFromMetadata();
            objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v218);
            sub_24558F50C();
            goto LABEL_146;
          }
          if (v111)
            goto LABEL_111;
        }
        else
        {
          if (objc_msgSend(v211, sel_estimatedEndDateStatus) == (id)3 && (v269 & 1) != 0)
            goto LABEL_115;
          swift_bridgeObjectRelease();
          if (objc_msgSend(v231, sel_estimatedEndDateStatus) == (id)2 && (v269 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            sub_24558F758();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v221 = swift_getObjCClassFromMetadata();
            objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v221);
            sub_24558F50C();
            goto LABEL_146;
          }
          if (v228)
          {
            if (v111)
            {
              sub_24558F77C();
              sub_24558F770();
              sub_24558F764();
              swift_bridgeObjectRelease();
              sub_24558F770();
              sub_24558F794();
              sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
              v223 = swift_getObjCClassFromMetadata();
              v224 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v223);
              sub_24558F50C();
              goto LABEL_112;
            }
            sub_24558F758();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v226 = swift_getObjCClassFromMetadata();
            objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v226);
            sub_24558F50C();
LABEL_146:
            v210 = sub_24558F7D0();
            goto LABEL_147;
          }
        }
LABEL_144:
        sub_24558F77C();
        sub_24558F770();
        sub_24558F764();
        swift_bridgeObjectRelease();
        sub_24558F770();
        sub_24558F794();
        sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
        v225 = swift_getObjCClassFromMetadata();
        objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v225);
        sub_24558F50C();
        goto LABEL_146;
      }
      if (v110 == (id)1)
      {
        swift_bridgeObjectRelease();
        v112 = objc_msgSend(v109, sel_time);
        if (v112)
        {
          v113 = v112;
          v114 = objc_msgSend(v112, sel_timeBound);

          sub_24558F4E8();
          v115 = v266;
          v116 = (void (*)(char *, char *, NSObject *))isa[4].isa;
          v117 = (uint64_t)v259;
          v118 = v73;
          v119 = isa;
          v116(v259, v118, v266);
          ((void (*)(uint64_t, _QWORD, uint64_t, NSObject *))v119[7].isa)(v117, 0, 1, v115);
          if (((unsigned int (*)(uint64_t, uint64_t, NSObject *))v119[6].isa)(v117, 1, v115) != 1)
          {
            v120 = v252;
            v116(v252, (char *)v117, v115);
            v121 = (void *)sub_24558F4D0();
            v122 = objc_msgSend(v121, sel_absoluteTimeString_preposition_capitalized_, 0, 2, 0);

            sub_24558F7B8();
            if ((v232 & 1) != 0 || (v269 & 1) == 0)
            {
              sub_24558F77C();
              sub_24558F770();
              sub_24558F764();
              swift_bridgeObjectRelease();
              sub_24558F770();
              sub_24558F794();
              sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
              v219 = swift_getObjCClassFromMetadata();
              objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v219);
              sub_24558F50C();
              v90 = sub_24558F7D0();

            }
            else
            {
              swift_bridgeObjectRelease();
              v213 = (void *)sub_24558F4D0();
              v214 = objc_msgSend(v213, sel_absoluteTimeString_preposition_capitalized_, 0, 0, 0);

              sub_24558F7B8();
              v215 = v231;
              objc_msgSend(v231, sel_estimatedEndDateStatus);
              sub_24558F77C();
              sub_24558F770();
              sub_24558F764();
              swift_bridgeObjectRelease();
              sub_24558F770();
              sub_24558F794();
              sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
              v222 = swift_getObjCClassFromMetadata();
              objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v222);
              sub_24558F50C();
              v90 = sub_24558F7D0();

            }
            ((void (*)(char *, NSObject *))v119[1].isa)(v120, v115);
            return v90;
          }
        }
        else
        {
          v117 = (uint64_t)v259;
          ((void (*)(char *, uint64_t, uint64_t, NSObject *))isa[7].isa)(v259, 1, 1, v266);
        }
        sub_24552E0C8(v117);
        sub_24558F758();
        sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
        v195 = swift_getObjCClassFromMetadata();
        objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v195);
        sub_24558F50C();
        goto LABEL_93;
      }
      swift_bridgeObjectRelease();
      if (qword_257484610 != -1)
        swift_once();
      v159 = v268;
      v160 = __swift_project_value_buffer((uint64_t)v268, (uint64_t)qword_257486FF0);
      (*(void (**)(char *, uint64_t, _QWORD *))(v263 + 16))(v260, v160, v159);
      v161 = swift_allocObject();
      v162 = v230;
      *(_QWORD *)(v161 + 16) = v230;
      isa = v162;
      v163 = sub_24558F710();
      LODWORD(v266) = sub_24558F8D8();
      v164 = swift_allocObject();
      *(_BYTE *)(v164 + 16) = 32;
      v165 = swift_allocObject();
      *(_BYTE *)(v165 + 16) = 8;
      v166 = swift_allocObject();
      *(_BYTE *)(v166 + 16) = 0;
      v167 = swift_allocObject();
      *(_BYTE *)(v167 + 16) = 8;
      v168 = swift_allocObject();
      *(_QWORD *)(v168 + 16) = sub_24552DFDC;
      *(_QWORD *)(v168 + 24) = v161;
      v169 = swift_allocObject();
      *(_QWORD *)(v169 + 16) = sub_24552E108;
      *(_QWORD *)(v169 + 24) = v168;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257484A30);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2455944C0;
      *(_QWORD *)(inited + 32) = sub_24552E10C;
      *(_QWORD *)(inited + 40) = v164;
      *(_QWORD *)(inited + 48) = sub_24552E10C;
      *(_QWORD *)(inited + 56) = v165;
      *(_QWORD *)(inited + 64) = sub_245526DD4;
      *(_QWORD *)(inited + 72) = 0;
      *(_QWORD *)(inited + 80) = sub_24552E10C;
      *(_QWORD *)(inited + 88) = v166;
      *(_QWORD *)(inited + 96) = sub_24552E10C;
      *(_QWORD *)(inited + 104) = v167;
      *(_QWORD *)(inited + 112) = sub_24552DFD8;
      *(_QWORD *)(inited + 120) = v169;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      v171 = v266;
      v266 = v163;
      if (os_log_type_enabled(v163, v171))
      {
        v172 = (uint8_t *)swift_slowAlloc();
        v264 = swift_slowAlloc();
        v271[0] = v264;
        *(_WORD *)v172 = 514;
        v172[2] = 32;
        swift_release();
        v172[3] = 8;
        swift_release();
        v270 = sub_245524F90(0xD00000000000004DLL, 0x8000000245595B80, v271);
        sub_24558F914();
        v172[12] = 0;
        swift_release();
        v172[13] = 8;
        swift_release();
        v137 = isa;
        v173 = -[NSObject sessionType](isa, sel_sessionType);

        swift_release();
        v270 = (uint64_t)v173;
        sub_24558F914();
        swift_release();
        swift_release();
        v174 = v266;
        _os_log_impl(&dword_245521000, v266, v171, "Invalid session type in %s: %lu", v172, 0x16u);
        v175 = v264;
        swift_arrayDestroy();
        MEMORY[0x249537CD8](v175, -1, -1);
        MEMORY[0x249537CD8](v172, -1, -1);

      }
      else
      {

        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v137 = isa;

        swift_release();
      }
      (*(void (**)(char *, _QWORD *))(v263 + 8))(v260, v268);
      v148 = v231;
LABEL_82:
      sub_24558F758();
      sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
      v185 = swift_getObjCClassFromMetadata();
      v149 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v185);
      sub_24558F50C();
      v90 = sub_24558F7D0();

      return v90;
    case 4uLL:
      swift_bridgeObjectRelease();
      if ((v232 & 1) != 0 || (v269 & 1) != 0 || (v264 & 1) != 0)
        goto LABEL_42;
      goto LABEL_70;
    case 7uLL:
    case 9uLL:
    case 0xEuLL:
      v97 = objc_msgSend(v96, sel_cacheReleaseDate);
      sub_24558F4E8();

      sub_24558F4F4();
      LOBYTE(v97) = sub_24558F4DC();
      v98 = v96;
      v99 = (void (*)(char *, NSObject *))isa[1].isa;
      v100 = v71;
      v101 = v266;
      v99(v100, v266);
      v99(v73, v101);
      if ((v97 & 1) != 0)
      {
        v102 = objc_msgSend(v98, sel_cacheReleaseDate);
        v103 = v229;
        if (!v102)
        {
          swift_bridgeObjectRelease();
          __break(1u);
          JUMPOUT(0x24552DE94);
        }
        v104 = v102;
        v96 = v98;
        v105 = objc_msgSend(v102, sel_relativeTimeString);
        sub_24558F7B8();

        if ((v232 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          sub_24558F77C();
          sub_24558F770();
          sub_24558F764();
          swift_bridgeObjectRelease();
          sub_24558F770();
          sub_24558F794();
          sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
          v106 = swift_getObjCClassFromMetadata();
          objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v106);
          sub_24558F50C();
LABEL_23:
          v107 = sub_24558F7C4();
LABEL_120:
          v90 = v107;

          goto LABEL_121;
        }
        if ((v264 & 1) != 0)
        {
          if (v228)
          {
            sub_24558F77C();
            sub_24558F770();
            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            if (v103)
            {
              sub_24558F764();
              swift_bridgeObjectRelease();
              sub_24558F770();
              sub_24558F794();
              sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
              v145 = swift_getObjCClassFromMetadata();
              v146 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v145);
              sub_24558F50C();
              v147 = sub_24558F7C4();
            }
            else
            {
              sub_24558F794();
              sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
              v197 = swift_getObjCClassFromMetadata();
              v198 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v197);
              sub_24558F50C();
              v147 = sub_24558F7D0();
            }
            v90 = v147;

            return v90;
          }
          goto LABEL_72;
        }
        if ((v269 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (objc_msgSend(v98, sel_sessionState) != (id)14)
          {
            sub_24558F758();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v196 = swift_getObjCClassFromMetadata();
            objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v196);
            sub_24558F50C();
            goto LABEL_23;
          }
          sub_24558F758();
          sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
          v151 = swift_getObjCClassFromMetadata();
          objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v151);
          sub_24558F50C();
        }
        else
        {
          if (!v228)
          {
LABEL_72:
            sub_24558F77C();
            sub_24558F770();
            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F794();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v179 = swift_getObjCClassFromMetadata();
            objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v179);
            sub_24558F50C();
            goto LABEL_119;
          }
          if (v103)
          {
            sub_24558F77C();
            sub_24558F770();
            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F794();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v180 = swift_getObjCClassFromMetadata();
            objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v180);
            sub_24558F50C();
            goto LABEL_23;
          }
          sub_24558F77C();
          sub_24558F770();
          sub_24558F764();
          swift_bridgeObjectRelease();
          sub_24558F770();
          sub_24558F794();
          sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
          v216 = swift_getObjCClassFromMetadata();
          objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v216);
          sub_24558F50C();
        }
LABEL_119:
        v107 = sub_24558F7D0();
        goto LABEL_120;
      }
      if ((v264 & 1) != 0)
      {
        v108 = v231;
        if (v228)
        {
          if (v229)
            goto LABEL_46;
LABEL_76:
          sub_24558F758();
          sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
          v181 = swift_getObjCClassFromMetadata();
          objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v181);
          sub_24558F50C();
          goto LABEL_77;
        }
      }
      else
      {
        v108 = v231;
        if (v228)
        {
          if (v229)
          {
LABEL_46:
            sub_24558F77C();
            sub_24558F770();
            sub_24558F764();
            swift_bridgeObjectRelease();
            sub_24558F770();
            sub_24558F794();
            sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
            v142 = swift_getObjCClassFromMetadata();
            v143 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v142);
            sub_24558F50C();
            v144 = sub_24558F7C4();
LABEL_78:
            v90 = v144;

            return v90;
          }
          goto LABEL_76;
        }
      }
      sub_24558F77C();
      sub_24558F770();
      sub_24558F764();
      swift_bridgeObjectRelease();
      sub_24558F770();
      sub_24558F794();
      sub_24552DEE8(0, (unint64_t *)&qword_257484A28);
      v150 = swift_getObjCClassFromMetadata();
      objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v150);
      sub_24558F50C();
LABEL_77:
      v144 = sub_24558F7D0();
      goto LABEL_78;
    case 0xCuLL:
      swift_bridgeObjectRelease();
      goto LABEL_42;
    default:
      swift_bridgeObjectRelease();
      if (qword_257484610 != -1)
        swift_once();
      v123 = v268;
      v124 = __swift_project_value_buffer((uint64_t)v268, (uint64_t)qword_257486FF0);
      (*(void (**)(char *, uint64_t, _QWORD *))(v263 + 16))(v262, v124, v123);
      v125 = swift_allocObject();
      v126 = v230;
      *(_QWORD *)(v125 + 16) = v230;
      v266 = v126;
      v127 = sub_24558F710();
      LODWORD(isa) = sub_24558F8D8();
      v128 = swift_allocObject();
      *(_BYTE *)(v128 + 16) = 32;
      v129 = swift_allocObject();
      *(_BYTE *)(v129 + 16) = 8;
      v130 = swift_allocObject();
      *(_BYTE *)(v130 + 16) = 0;
      v131 = swift_allocObject();
      *(_BYTE *)(v131 + 16) = 8;
      v132 = swift_allocObject();
      *(_QWORD *)(v132 + 16) = sub_24552E110;
      *(_QWORD *)(v132 + 24) = v125;
      v133 = swift_allocObject();
      *(_QWORD *)(v133 + 16) = sub_24552DFB0;
      *(_QWORD *)(v133 + 24) = v132;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257484A30);
      v134 = swift_initStackObject();
      *(_OWORD *)(v134 + 16) = xmmword_2455944C0;
      *(_QWORD *)(v134 + 32) = sub_24552DF54;
      *(_QWORD *)(v134 + 40) = v128;
      *(_QWORD *)(v134 + 48) = sub_24552E10C;
      *(_QWORD *)(v134 + 56) = v129;
      *(_QWORD *)(v134 + 64) = sub_245526DD4;
      *(_QWORD *)(v134 + 72) = 0;
      *(_QWORD *)(v134 + 80) = sub_24552E10C;
      *(_QWORD *)(v134 + 88) = v130;
      *(_QWORD *)(v134 + 96) = sub_24552E10C;
      *(_QWORD *)(v134 + 104) = v131;
      *(_QWORD *)(v134 + 112) = sub_24552DFD8;
      *(_QWORD *)(v134 + 120) = v133;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      v135 = isa;
      isa = v127;
      if (os_log_type_enabled(v127, v135))
      {
        v136 = (uint8_t *)swift_slowAlloc();
        v264 = swift_slowAlloc();
        v271[0] = v264;
        *(_WORD *)v136 = 514;
        v136[2] = 32;
        swift_release();
        v136[3] = 8;
        swift_release();
        v270 = sub_245524F90(0xD00000000000004DLL, 0x8000000245595B80, v271);
        sub_24558F914();
        v136[12] = 0;
        swift_release();
        v136[13] = 8;
        swift_release();
        v137 = v266;
        v138 = -[NSObject sessionType](v266, sel_sessionType);

        swift_release();
        v270 = (uint64_t)v138;
        sub_24558F914();
        swift_release();
        swift_release();
        v139 = isa;
        _os_log_impl(&dword_245521000, isa, v135, "Invalid state in %s: %lu", v136, 0x16u);
        v140 = v264;
        swift_arrayDestroy();
        MEMORY[0x249537CD8](v140, -1, -1);
        MEMORY[0x249537CD8](v136, -1, -1);

      }
      else
      {

        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        v137 = v266;

        swift_release();
      }
      (*(void (**)(char *, _QWORD *))(v263 + 8))(v262, v268);
      v148 = v231;
      goto LABEL_82;
  }
}

uint64_t type metadata accessor for SMInitiatorAlertUtilities()
{
  return objc_opt_self();
}

uint64_t sub_24552DEE8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24552DF20()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_24552DF44()
{
  return swift_deallocObject();
}

_BYTE **sub_24552DF54(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2455255D0(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_24552DF5C()
{
  return swift_deallocObject();
}

uint64_t sub_24552DF6C()
{
  return swift_deallocObject();
}

uint64_t sub_24552DF7C()
{
  return swift_deallocObject();
}

uint64_t sub_24552DF8C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24552DFB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

id sub_24552DFDC()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_sessionType);
}

uint64_t sub_24552DFEC()
{
  return swift_deallocObject();
}

uint64_t sub_24552DFFC()
{
  return swift_deallocObject();
}

uint64_t sub_24552E00C()
{
  return swift_deallocObject();
}

uint64_t sub_24552E01C()
{
  return swift_deallocObject();
}

uint64_t sub_24552E02C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  v3 = *a1 + 8;
  result = sub_24558F914();
  *a1 = v3;
  return result;
}

uint64_t sub_24552E084(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24552E0C8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484820);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24552E124()
{
  return 0;
}

uint64_t sub_24552E130()
{
  return 0;
}

void sub_24552E13C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24552E148()
{
  sub_24552E5E4();
  return sub_24558FA04();
}

uint64_t sub_24552E170()
{
  sub_24552E5E4();
  return sub_24558FA10();
}

uint64_t sub_24552E198(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

uint64_t sub_24552E1BC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_24552E300(a1, a2, a3, &qword_257484A48, (void (*)(void))sub_24552E5E4);
}

uint64_t sub_24552E1E8()
{
  sub_24558F9E0();
  return sub_24558F9EC();
}

uint64_t sub_24552E220()
{
  sub_24558F9E0();
  return sub_24558F9EC();
}

uint64_t sub_24552E250()
{
  return 1;
}

uint64_t sub_24552E258@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_24552E284()
{
  sub_24552E5A0();
  return sub_24558FA04();
}

uint64_t sub_24552E2AC()
{
  sub_24552E5A0();
  return sub_24558FA10();
}

uint64_t sub_24552E2D4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_24552E300(a1, a2, a3, &qword_257484A38, (void (*)(void))sub_24552E5A0);
}

uint64_t sub_24552E300(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  v7 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a5();
  sub_24558F9F8();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24552E3D0()
{
  sub_24552E628();
  return sub_24558F818();
}

uint64_t sub_24552E42C()
{
  sub_24552E628();
  return sub_24558F80C();
}

ValueMetadata *type metadata accessor for SMActivityAttributes()
{
  return &type metadata for SMActivityAttributes;
}

ValueMetadata *type metadata accessor for SMActivityAttributes.ContentState()
{
  return &type metadata for SMActivityAttributes.ContentState;
}

unint64_t sub_24552E49C()
{
  unint64_t result;

  result = qword_254415878;
  if (!qword_254415878)
  {
    result = MEMORY[0x249537C54](&unk_245594564, &type metadata for SMActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_254415878);
  }
  return result;
}

unint64_t sub_24552E4E4()
{
  unint64_t result;

  result = qword_254415888;
  if (!qword_254415888)
  {
    result = MEMORY[0x249537C54](&unk_245594644, &type metadata for SMActivityAttributes);
    atomic_store(result, (unint64_t *)&qword_254415888);
  }
  return result;
}

unint64_t sub_24552E52C()
{
  unint64_t result;

  result = qword_254415880;
  if (!qword_254415880)
  {
    result = MEMORY[0x249537C54](&unk_24559461C, &type metadata for SMActivityAttributes);
    atomic_store(result, (unint64_t *)&qword_254415880);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24552E5A0()
{
  unint64_t result;

  result = qword_257484A40;
  if (!qword_257484A40)
  {
    result = MEMORY[0x249537C54](&unk_2455947B8, &type metadata for SMActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257484A40);
  }
  return result;
}

unint64_t sub_24552E5E4()
{
  unint64_t result;

  result = qword_257484A50;
  if (!qword_257484A50)
  {
    result = MEMORY[0x249537C54](&unk_245594768, &type metadata for SMActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257484A50);
  }
  return result;
}

unint64_t sub_24552E628()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257484A58;
  if (!qword_257484A58)
  {
    type metadata accessor for SMSessionState(255);
    result = MEMORY[0x249537C54](&unk_24559442C, v1);
    atomic_store(result, (unint64_t *)&qword_257484A58);
  }
  return result;
}

ValueMetadata *type metadata accessor for SMActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for SMActivityAttributes.ContentState.CodingKeys;
}

ValueMetadata *type metadata accessor for SMActivityAttributes.CodingKeys()
{
  return &type metadata for SMActivityAttributes.CodingKeys;
}

unint64_t sub_24552E694()
{
  unint64_t result;

  result = qword_257484A60;
  if (!qword_257484A60)
  {
    result = MEMORY[0x249537C54](&unk_245594718, &type metadata for SMActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257484A60);
  }
  return result;
}

unint64_t sub_24552E6DC()
{
  unint64_t result;

  result = qword_257484A68;
  if (!qword_257484A68)
  {
    result = MEMORY[0x249537C54](&unk_245594740, &type metadata for SMActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257484A68);
  }
  return result;
}

unint64_t sub_24552E724()
{
  unint64_t result;

  result = qword_257484A70;
  if (!qword_257484A70)
  {
    result = MEMORY[0x249537C54](&unk_2455946C8, &type metadata for SMActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257484A70);
  }
  return result;
}

unint64_t sub_24552E76C()
{
  unint64_t result;

  result = qword_257484A78;
  if (!qword_257484A78)
  {
    result = MEMORY[0x249537C54](&unk_2455946F0, &type metadata for SMActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257484A78);
  }
  return result;
}

uint64_t static SendValidityUtilities.sendMessageFailureAlertCannotSendTitle()()
{
  return sub_24552E854(&qword_2574846A8, &static SendValidity.sendMessageFailureAlertCannotSendTitle);
}

uint64_t *SendValidity.sendMessageFailureAlertCannotSendTitle.unsafeMutableAddressor()
{
  if (qword_2574846A8 != -1)
    swift_once();
  return &static SendValidity.sendMessageFailureAlertCannotSendTitle;
}

uint64_t static SendValidityUtilities.sendMessageFailureAlertOKButtonText()()
{
  return sub_24552E854(&qword_2574846B0, &static SendValidity.sendMessageFailureAlertOKButtonText);
}

uint64_t sub_24552E854(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t *SendValidity.sendMessageFailureAlertOKButtonText.unsafeMutableAddressor()
{
  if (qword_2574846B0 != -1)
    swift_once();
  return &static SendValidity.sendMessageFailureAlertOKButtonText;
}

id sub_24552E904(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;

  if (*a3 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_24558F7AC();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t static SendValidityUtilities.sendValidityAlertMessage(for:)(uint64_t a1)
{
  uint64_t v1;
  char v2;

  v1 = sub_2455322B0(a1);
  return SendValidity.alertErrorMessage.getter(v1, v2 & 1);
}

uint64_t static SendValidity.sendValidity(from:)(uint64_t a1)
{
  return sub_2455322B0(a1);
}

uint64_t SendValidity.alertErrorMessage.getter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t *v3;

  if ((a2 & 1) != 0)
    __asm { BR              X9 }
  v2 = 0;
  switch(a1)
  {
    case 1:
      return v2;
    case 4:
      if (qword_2574846C0 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertLocationServicesText;
      goto LABEL_10;
    case 5:
      if (qword_2574846C8 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertCellularDataText;
      goto LABEL_10;
    case 6:
      if (qword_2574846D0 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertiMessageText;
      goto LABEL_10;
    case 7:
      if (qword_2574846D8 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertFailureLocationAuthorizationText;
      goto LABEL_10;
    case 8:
      if (qword_2574846E0 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertManateeText;
      goto LABEL_10;
    case 10:
      if (qword_2574846E8 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertNetworkReachabilityText;
      goto LABEL_10;
    case 11:
      if (qword_2574846F0 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertRequiresiPhoneText;
      goto LABEL_10;
    case 12:
      if (qword_2574846F8 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertRequiresiPhoneOrCellularText;
      goto LABEL_10;
    default:
      if (qword_257484698 != -1)
        swift_once();
      v3 = &static SendValidity.sendValidityGeneralError;
LABEL_10:
      v2 = *v3;
      swift_bridgeObjectRetain();
      return v2;
  }
}

id SendValidityUtilities.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SendValidityUtilities.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SendValidityUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SendValidityUtilities.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SendValidityUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t SendValidity.isValid.getter(unint64_t a1, unsigned __int8 a2)
{
  return a2 & (a1 > 9);
}

uint64_t static SendValidity.__derived_enum_equals(_:_:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  return sub_2455321A4(a1, a2 & 1, a3, a4 & 1);
}

uint64_t SendValidity.platterErrorMessage.getter(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    __asm { BR              X9 }
  return sub_24552F008(a1);
}

uint64_t sub_24552F008(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v1 = 0;
  switch(a1)
  {
    case 0:
    case 2:
    case 9:
      goto LABEL_10;
    case 1:
      return v1;
    case 4:
      if (qword_257484630 != -1)
        swift_once();
      v2 = &static SendValidity.initiatorEligibilityFailureLocationServicesText;
      goto LABEL_34;
    case 5:
      if (qword_257484638 != -1)
        swift_once();
      v2 = &static SendValidity.initiatorEligibilityFailureCellularDataText;
      goto LABEL_34;
    case 6:
      if (qword_257484640 != -1)
        swift_once();
      v2 = &static SendValidity.initiatorEligibilityFailureiMessageText;
      goto LABEL_34;
    case 7:
      if (qword_257484648 != -1)
        swift_once();
      v2 = &static SendValidity.initiatorEligibilityFailureLocationAuthorizationText;
      goto LABEL_34;
    case 8:
      if (qword_257484650 != -1)
        swift_once();
      v2 = &static SendValidity.initiatorEligibilityFailureManateeText;
      goto LABEL_34;
    case 10:
      if (qword_257484658 != -1)
        swift_once();
      v2 = &static SendValidity.initiatorEligibilityFailureNetworkReachabilityText;
      goto LABEL_34;
    case 11:
      if (qword_257484660 != -1)
        swift_once();
      v2 = &static SendValidity.initiatorEligibilityFailureRequiresiPhoneText;
      goto LABEL_34;
    case 12:
      if (qword_257484668 != -1)
        swift_once();
      v2 = &static SendValidity.initiatorEligibilityFailureRequiresiPhoneOrCellularText;
      goto LABEL_34;
    default:
      if (qword_257484700 != -1)
        swift_once();
      v3 = sub_24558F728();
      __swift_project_value_buffer(v3, (uint64_t)qword_2574871D8);
      v4 = sub_24558F710();
      v5 = sub_24558F8D8();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = swift_slowAlloc();
        v7 = swift_slowAlloc();
        v11 = v7;
        *(_DWORD *)v6 = 136315650;
        v8 = sub_24558F7DC();
        sub_245524F90(v8, v9, &v11);
        sub_24558F914();
        swift_bridgeObjectRelease();
        *(_WORD *)(v6 + 12) = 2080;
        sub_245524F90(0xD00000000000003CLL, 0x8000000245599A10, &v11);
        sub_24558F914();
        *(_WORD *)(v6 + 22) = 2048;
        sub_24558F914();
        _os_log_impl(&dword_245521000, v4, v5, "%s, %s: Unknown eligibilityStatus, %ld", (uint8_t *)v6, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x249537CD8](v7, -1, -1);
        MEMORY[0x249537CD8](v6, -1, -1);
      }

LABEL_10:
      if (qword_257484670 != -1)
        swift_once();
      v2 = &static SendValidity.initiatorEligibilityFailureUnknownText;
LABEL_34:
      v1 = *v2;
      swift_bridgeObjectRetain();
      return v1;
  }
}

uint64_t *SendValidity.initiatorEligibilityAddRecipientText.unsafeMutableAddressor()
{
  if (qword_257484618 != -1)
    swift_once();
  return &static SendValidity.initiatorEligibilityAddRecipientText;
}

uint64_t *SendValidity.sendValidityReceiverIneligible.unsafeMutableAddressor()
{
  if (qword_257484678 != -1)
    swift_once();
  return &static SendValidity.sendValidityReceiverIneligible;
}

uint64_t *SendValidity.sendValidityGroupReceiverIneligible.unsafeMutableAddressor()
{
  if (qword_257484680 != -1)
    swift_once();
  return &static SendValidity.sendValidityGroupReceiverIneligible;
}

uint64_t *SendValidity.initiatorEligibilityGroupConversationText.unsafeMutableAddressor()
{
  if (qword_257484620 != -1)
    swift_once();
  return &static SendValidity.initiatorEligibilityGroupConversationText;
}

uint64_t *SendValidity.sendValiditySessionAlreadyActive.unsafeMutableAddressor()
{
  if (qword_257484688 != -1)
    swift_once();
  return &static SendValidity.sendValiditySessionAlreadyActive;
}

uint64_t *SendValidity.sendValidityInvalidETA.unsafeMutableAddressor()
{
  if (qword_257484690 != -1)
    swift_once();
  return &static SendValidity.sendValidityInvalidETA;
}

uint64_t *SendValidity.initiatorEligibilityFailureUnknownText.unsafeMutableAddressor()
{
  if (qword_257484670 != -1)
    swift_once();
  return &static SendValidity.initiatorEligibilityFailureUnknownText;
}

uint64_t static SendValidity.initiatorEligibilityFailureReasonAlert(eligibilityStatus:onSend:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t *v3;

  v2 = 0;
  switch(a1)
  {
    case 1:
      return v2;
    case 4:
      if (qword_2574846C0 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertLocationServicesText;
      goto LABEL_33;
    case 5:
      if (qword_2574846C8 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertCellularDataText;
      goto LABEL_33;
    case 6:
      if (qword_2574846D0 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertiMessageText;
      goto LABEL_33;
    case 7:
      if (qword_2574846D8 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertFailureLocationAuthorizationText;
      goto LABEL_33;
    case 8:
      if (qword_2574846E0 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertManateeText;
      goto LABEL_33;
    case 10:
      if (qword_2574846E8 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertNetworkReachabilityText;
      goto LABEL_33;
    case 11:
      if (qword_2574846F0 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertRequiresiPhoneText;
      goto LABEL_33;
    case 12:
      if (qword_2574846F8 != -1)
        swift_once();
      v3 = &static SendValidity.sendMessageFailureAlertRequiresiPhoneOrCellularText;
      goto LABEL_33;
    default:
      if ((a2 & 1) != 0)
      {
        if (qword_257484698 != -1)
          swift_once();
        v3 = &static SendValidity.sendValidityGeneralError;
      }
      else
      {
        if (qword_2574846A0 != -1)
          swift_once();
        v3 = &static SendValidity.preSendValidityGeneralError;
      }
LABEL_33:
      v2 = *v3;
      swift_bridgeObjectRetain();
      return v2;
  }
}

uint64_t *SendValidity.sendValidityGeneralError.unsafeMutableAddressor()
{
  if (qword_257484698 != -1)
    swift_once();
  return &static SendValidity.sendValidityGeneralError;
}

unint64_t SendValidity.settingsDeepLinkUrl.getter(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return 0;
  else
    return sub_24552F88C(a1);
}

unint64_t sub_24552F88C(uint64_t a1)
{
  uint64_t v1;
  unint64_t result;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v1 = a1 - 4;
  result = 0xD000000000000020;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0xD000000000000022;
      break;
    case 2:
      result = 0xD000000000000013;
      break;
    case 3:
      result = 0xD000000000000030;
      break;
    case 4:
      result = 0xD000000000000033;
      break;
    default:
      if (qword_257484700 != -1)
        swift_once();
      v3 = sub_24558F728();
      __swift_project_value_buffer(v3, (uint64_t)qword_2574871D8);
      v4 = sub_24558F710();
      v5 = sub_24558F8D8();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = swift_slowAlloc();
        v7 = swift_slowAlloc();
        v10 = v7;
        *(_DWORD *)v6 = 136315650;
        v8 = sub_24558F7DC();
        sub_245524F90(v8, v9, &v10);
        sub_24558F914();
        swift_bridgeObjectRelease();
        *(_WORD *)(v6 + 12) = 2080;
        sub_245524F90(0xD000000000000036, 0x8000000245599990, &v10);
        sub_24558F914();
        *(_WORD *)(v6 + 22) = 2048;
        sub_24558F914();
        _os_log_impl(&dword_245521000, v4, v5, "%s, %s: Unknown eligibilityStatus, %ld", (uint8_t *)v6, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x249537CD8](v7, -1, -1);
        MEMORY[0x249537CD8](v6, -1, -1);
      }

      result = 0;
      break;
  }
  return result;
}

uint64_t *SendValidity.initiatorEligibilityFailureLocationServicesText.unsafeMutableAddressor()
{
  if (qword_257484630 != -1)
    swift_once();
  return &static SendValidity.initiatorEligibilityFailureLocationServicesText;
}

uint64_t *SendValidity.initiatorEligibilityFailureCellularDataText.unsafeMutableAddressor()
{
  if (qword_257484638 != -1)
    swift_once();
  return &static SendValidity.initiatorEligibilityFailureCellularDataText;
}

uint64_t *SendValidity.initiatorEligibilityFailureiMessageText.unsafeMutableAddressor()
{
  if (qword_257484640 != -1)
    swift_once();
  return &static SendValidity.initiatorEligibilityFailureiMessageText;
}

uint64_t *SendValidity.initiatorEligibilityFailureLocationAuthorizationText.unsafeMutableAddressor()
{
  if (qword_257484648 != -1)
    swift_once();
  return &static SendValidity.initiatorEligibilityFailureLocationAuthorizationText;
}

uint64_t *SendValidity.initiatorEligibilityFailureManateeText.unsafeMutableAddressor()
{
  if (qword_257484650 != -1)
    swift_once();
  return &static SendValidity.initiatorEligibilityFailureManateeText;
}

uint64_t *SendValidity.initiatorEligibilityFailureNetworkReachabilityText.unsafeMutableAddressor()
{
  if (qword_257484658 != -1)
    swift_once();
  return &static SendValidity.initiatorEligibilityFailureNetworkReachabilityText;
}

uint64_t *SendValidity.initiatorEligibilityFailureRequiresiPhoneText.unsafeMutableAddressor()
{
  if (qword_257484660 != -1)
    swift_once();
  return &static SendValidity.initiatorEligibilityFailureRequiresiPhoneText;
}

uint64_t *SendValidity.initiatorEligibilityFailureRequiresiPhoneOrCellularText.unsafeMutableAddressor()
{
  if (qword_257484668 != -1)
    swift_once();
  return &static SendValidity.initiatorEligibilityFailureRequiresiPhoneOrCellularText;
}

uint64_t *SendValidity.sendMessageFailureAlertLocationServicesText.unsafeMutableAddressor()
{
  if (qword_2574846C0 != -1)
    swift_once();
  return &static SendValidity.sendMessageFailureAlertLocationServicesText;
}

uint64_t *SendValidity.sendMessageFailureAlertCellularDataText.unsafeMutableAddressor()
{
  if (qword_2574846C8 != -1)
    swift_once();
  return &static SendValidity.sendMessageFailureAlertCellularDataText;
}

uint64_t *SendValidity.sendMessageFailureAlertiMessageText.unsafeMutableAddressor()
{
  if (qword_2574846D0 != -1)
    swift_once();
  return &static SendValidity.sendMessageFailureAlertiMessageText;
}

uint64_t *SendValidity.sendMessageFailureAlertFailureLocationAuthorizationText.unsafeMutableAddressor()
{
  if (qword_2574846D8 != -1)
    swift_once();
  return &static SendValidity.sendMessageFailureAlertFailureLocationAuthorizationText;
}

uint64_t *SendValidity.sendMessageFailureAlertManateeText.unsafeMutableAddressor()
{
  if (qword_2574846E0 != -1)
    swift_once();
  return &static SendValidity.sendMessageFailureAlertManateeText;
}

uint64_t *SendValidity.sendMessageFailureAlertNetworkReachabilityText.unsafeMutableAddressor()
{
  if (qword_2574846E8 != -1)
    swift_once();
  return &static SendValidity.sendMessageFailureAlertNetworkReachabilityText;
}

uint64_t *SendValidity.sendMessageFailureAlertRequiresiPhoneText.unsafeMutableAddressor()
{
  if (qword_2574846F0 != -1)
    swift_once();
  return &static SendValidity.sendMessageFailureAlertRequiresiPhoneText;
}

uint64_t *SendValidity.sendMessageFailureAlertRequiresiPhoneOrCellularText.unsafeMutableAddressor()
{
  if (qword_2574846F8 != -1)
    swift_once();
  return &static SendValidity.sendMessageFailureAlertRequiresiPhoneOrCellularText;
}

uint64_t *SendValidity.preSendValidityGeneralError.unsafeMutableAddressor()
{
  if (qword_2574846A0 != -1)
    swift_once();
  return &static SendValidity.preSendValidityGeneralError;
}

void *SendValidity.locationServicesSettingsDeepLinkUrl.unsafeMutableAddressor()
{
  return &static SendValidity.locationServicesSettingsDeepLinkUrl;
}

void *SendValidity.cellularDataSettingsDeepLinkUrl.unsafeMutableAddressor()
{
  return &static SendValidity.cellularDataSettingsDeepLinkUrl;
}

void *SendValidity.messagesSettingsDeepLinkUrl.unsafeMutableAddressor()
{
  return &static SendValidity.messagesSettingsDeepLinkUrl;
}

void *SendValidity.locationAuthorizationSettingsDeepLinkUrl.unsafeMutableAddressor()
{
  return &static SendValidity.locationAuthorizationSettingsDeepLinkUrl;
}

void *SendValidity.manateeSettingsDeepLinkUrl.unsafeMutableAddressor()
{
  return &static SendValidity.manateeSettingsDeepLinkUrl;
}

uint64_t sub_24552FF94(uint64_t a1)
{
  return sub_245530DA8(a1, 0xD000000000000015, 0x800000024559A150, &static SendValidity.initiatorEligibilityAddRecipientText, &qword_257487010);
}

uint64_t static SendValidity.initiatorEligibilityAddRecipientText.getter()
{
  return sub_24552E854(&qword_257484618, &static SendValidity.initiatorEligibilityAddRecipientText);
}

uint64_t sub_24552FFDC(uint64_t a1)
{
  return sub_245530DA8(a1, 0xD000000000000016, 0x800000024559A1F0, &static SendValidity.initiatorEligibilityGroupConversationText, &qword_257487020);
}

uint64_t static SendValidity.initiatorEligibilityGroupConversationText.getter()
{
  return sub_24552E854(&qword_257484620, &static SendValidity.initiatorEligibilityGroupConversationText);
}

uint64_t sub_245530024(uint64_t a1)
{
  return sub_245530DA8(a1, 0xE2676E6964616F4CLL, 0xAA0000000000A680, &static SendValidity.initiatorLoadingText, &qword_257487030);
}

uint64_t *SendValidity.initiatorLoadingText.unsafeMutableAddressor()
{
  if (qword_257484628 != -1)
    swift_once();
  return &static SendValidity.initiatorLoadingText;
}

uint64_t static SendValidity.initiatorLoadingText.getter()
{
  return sub_24552E854(&qword_257484628, &static SendValidity.initiatorLoadingText);
}

uint64_t sub_2455300AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.initiatorEligibilityFailureLocationServicesText = result;
  unk_257487040 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureLocationServicesText.getter()
{
  return sub_24552E854(&qword_257484630, &static SendValidity.initiatorEligibilityFailureLocationServicesText);
}

uint64_t sub_2455301F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.initiatorEligibilityFailureCellularDataText = result;
  unk_257487050 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureCellularDataText.getter()
{
  return sub_24552E854(&qword_257484638, &static SendValidity.initiatorEligibilityFailureCellularDataText);
}

uint64_t sub_245530334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.initiatorEligibilityFailureiMessageText = result;
  unk_257487060 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureiMessageText.getter()
{
  return sub_24552E854(&qword_257484640, &static SendValidity.initiatorEligibilityFailureiMessageText);
}

uint64_t sub_245530478()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.initiatorEligibilityFailureLocationAuthorizationText = result;
  unk_257487070 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureLocationAuthorizationText.getter()
{
  return sub_24552E854(&qword_257484648, &static SendValidity.initiatorEligibilityFailureLocationAuthorizationText);
}

uint64_t sub_2455305BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.initiatorEligibilityFailureManateeText = result;
  unk_257487080 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureManateeText.getter()
{
  return sub_24552E854(&qword_257484650, &static SendValidity.initiatorEligibilityFailureManateeText);
}

uint64_t sub_245530700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.initiatorEligibilityFailureNetworkReachabilityText = result;
  unk_257487090 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureNetworkReachabilityText.getter()
{
  return sub_24552E854(&qword_257484658, &static SendValidity.initiatorEligibilityFailureNetworkReachabilityText);
}

uint64_t sub_245530844()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.initiatorEligibilityFailureRequiresiPhoneText = result;
  unk_2574870A0 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureRequiresiPhoneText.getter()
{
  return sub_24552E854(&qword_257484660, &static SendValidity.initiatorEligibilityFailureRequiresiPhoneText);
}

uint64_t sub_245530988()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.initiatorEligibilityFailureRequiresiPhoneOrCellularText = result;
  unk_2574870B0 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureRequiresiPhoneOrCellularText.getter()
{
  return sub_24552E854(&qword_257484668, &static SendValidity.initiatorEligibilityFailureRequiresiPhoneOrCellularText);
}

uint64_t sub_245530ACC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.initiatorEligibilityFailureUnknownText = result;
  unk_2574870C0 = v5;
  return result;
}

uint64_t static SendValidity.initiatorEligibilityFailureUnknownText.getter()
{
  return sub_24552E854(&qword_257484670, &static SendValidity.initiatorEligibilityFailureUnknownText);
}

uint64_t sub_245530C18(uint64_t a1)
{
  return sub_245530DA8(a1, 0x1000000000000035, 0x800000024559A170, &static SendValidity.sendValidityReceiverIneligible, &qword_2574870D0);
}

uint64_t static SendValidity.sendValidityReceiverIneligible.getter()
{
  return sub_24552E854(&qword_257484678, &static SendValidity.sendValidityReceiverIneligible);
}

uint64_t sub_245530C60(uint64_t a1)
{
  return sub_245530DA8(a1, 0x1000000000000031, 0x800000024559A1B0, &static SendValidity.sendValidityGroupReceiverIneligible, &qword_2574870E0);
}

uint64_t static SendValidity.sendValidityGroupReceiverIneligible.getter()
{
  return sub_24552E854(&qword_257484680, &static SendValidity.sendValidityGroupReceiverIneligible);
}

uint64_t sub_245530CA8(uint64_t a1)
{
  return sub_245530DA8(a1, 0x1000000000000028, 0x800000024559A270, &static SendValidity.sendValiditySessionAlreadyActive, &qword_2574870F0);
}

uint64_t static SendValidity.sendValiditySessionAlreadyActive.getter()
{
  return sub_24552E854(&qword_257484688, &static SendValidity.sendValiditySessionAlreadyActive);
}

uint64_t sub_245530CF0(uint64_t a1)
{
  return sub_245530DA8(a1, 0x1000000000000030, 0x800000024559A2A0, &static SendValidity.sendValidityInvalidETA, &qword_257487100);
}

uint64_t static SendValidity.sendValidityInvalidETA.getter()
{
  return sub_24552E854(&qword_257484690, &static SendValidity.sendValidityInvalidETA);
}

uint64_t sub_245530D38(uint64_t a1)
{
  return sub_245530DA8(a1, 0x1000000000000059, 0x800000024559A210, &static SendValidity.sendValidityGeneralError, &qword_257487110);
}

uint64_t static SendValidity.sendValidityGeneralError.getter()
{
  return sub_24552E854(&qword_257484698, &static SendValidity.sendValidityGeneralError);
}

uint64_t sub_245530D80(uint64_t a1)
{
  return sub_245530DA8(a1, 0x1000000000000033, 0x80000002455999D0, &static SendValidity.preSendValidityGeneralError, &qword_257487120);
}

uint64_t sub_245530DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  uint64_t result;
  uint64_t v12;

  v7 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v8);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  *a4 = result;
  *a5 = v12;
  return result;
}

uint64_t static SendValidity.preSendValidityGeneralError.getter()
{
  return sub_24552E854(&qword_2574846A0, &static SendValidity.preSendValidityGeneralError);
}

unint64_t static SendValidity.locationServicesSettingsDeepLinkUrl.getter()
{
  return 0xD000000000000020;
}

unint64_t static SendValidity.cellularDataSettingsDeepLinkUrl.getter()
{
  return 0xD000000000000022;
}

unint64_t static SendValidity.messagesSettingsDeepLinkUrl.getter()
{
  return 0xD000000000000013;
}

unint64_t static SendValidity.locationAuthorizationSettingsDeepLinkUrl.getter()
{
  return 0xD000000000000030;
}

unint64_t static SendValidity.manateeSettingsDeepLinkUrl.getter()
{
  return 0xD000000000000033;
}

uint64_t sub_245530F78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.sendMessageFailureAlertCannotSendTitle = result;
  unk_257487130 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertCannotSendTitle.getter()
{
  return sub_24552E854(&qword_2574846A8, &static SendValidity.sendMessageFailureAlertCannotSendTitle);
}

uint64_t sub_2455310BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7C4();
  static SendValidity.sendMessageFailureAlertOKButtonText = result;
  unk_257487140 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertOKButtonText.getter()
{
  return sub_24552E854(&qword_2574846B0, &static SendValidity.sendMessageFailureAlertOKButtonText);
}

uint64_t sub_245531210()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.sendMessageFailureAlertDevicePlatformText = result;
  unk_257487150 = v5;
  return result;
}

uint64_t *SendValidity.sendMessageFailureAlertDevicePlatformText.unsafeMutableAddressor()
{
  if (qword_2574846B8 != -1)
    swift_once();
  return &static SendValidity.sendMessageFailureAlertDevicePlatformText;
}

uint64_t static SendValidity.sendMessageFailureAlertDevicePlatformText.getter()
{
  return sub_24552E854(&qword_2574846B8, &static SendValidity.sendMessageFailureAlertDevicePlatformText);
}

uint64_t sub_245531394()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.sendMessageFailureAlertLocationServicesText = result;
  unk_257487160 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertLocationServicesText.getter()
{
  return sub_24552E854(&qword_2574846C0, &static SendValidity.sendMessageFailureAlertLocationServicesText);
}

uint64_t sub_2455314D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.sendMessageFailureAlertCellularDataText = result;
  unk_257487170 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertCellularDataText.getter()
{
  return sub_24552E854(&qword_2574846C8, &static SendValidity.sendMessageFailureAlertCellularDataText);
}

uint64_t sub_24553161C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.sendMessageFailureAlertiMessageText = result;
  unk_257487180 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertiMessageText.getter()
{
  return sub_24552E854(&qword_2574846D0, &static SendValidity.sendMessageFailureAlertiMessageText);
}

uint64_t sub_245531760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.sendMessageFailureAlertFailureLocationAuthorizationText = result;
  unk_257487190 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertFailureLocationAuthorizationText.getter()
{
  return sub_24552E854(&qword_2574846D8, &static SendValidity.sendMessageFailureAlertFailureLocationAuthorizationText);
}

uint64_t sub_2455318A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.sendMessageFailureAlertManateeText = result;
  unk_2574871A0 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertManateeText.getter()
{
  return sub_24552E854(&qword_2574846E0, &static SendValidity.sendMessageFailureAlertManateeText);
}

uint64_t sub_2455319E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.sendMessageFailureAlertNetworkReachabilityText = result;
  unk_2574871B0 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertNetworkReachabilityText.getter()
{
  return sub_24552E854(&qword_2574846E8, &static SendValidity.sendMessageFailureAlertNetworkReachabilityText);
}

uint64_t sub_245531B2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.sendMessageFailureAlertRequiresiPhoneText = result;
  unk_2574871C0 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertRequiresiPhoneText.getter()
{
  return sub_24552E854(&qword_2574846F0, &static SendValidity.sendMessageFailureAlertRequiresiPhoneText);
}

uint64_t sub_245531C70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;

  v0 = sub_24558F518();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_24558F7A0();
  MEMORY[0x24BDAC7A8](v1);
  sub_24558F758();
  sub_245532660();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24558F50C();
  result = sub_24558F7D0();
  static SendValidity.sendMessageFailureAlertRequiresiPhoneOrCellularText = result;
  unk_2574871D0 = v5;
  return result;
}

uint64_t static SendValidity.sendMessageFailureAlertRequiresiPhoneOrCellularText.getter()
{
  return sub_24552E854(&qword_2574846F8, &static SendValidity.sendMessageFailureAlertRequiresiPhoneOrCellularText);
}

uint64_t SendValidity.type.getter(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return byte_24559498A[a1];
  else
    return 0;
}

uint64_t SendValidity.Case.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_245531E10 + 4 * byte_245594850[a1]))(0xD000000000000013, 0x8000000245595660);
}

uint64_t sub_245531E10()
{
  return 0x7669656365526F6ELL;
}

uint64_t sub_245531E2C()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_245531F28(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = SendValidity.Case.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == SendValidity.Case.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_24558F9B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_245531FB0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_24558F9E0();
  SendValidity.Case.rawValue.getter(v1);
  sub_24558F7E8();
  swift_bridgeObjectRelease();
  return sub_24558F9EC();
}

uint64_t sub_245532010()
{
  unsigned __int8 *v0;

  SendValidity.Case.rawValue.getter(*v0);
  sub_24558F7E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245532050()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_24558F9E0();
  SendValidity.Case.rawValue.getter(v1);
  sub_24558F7E8();
  swift_bridgeObjectRelease();
  return sub_24558F9EC();
}

uint64_t sub_2455320AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s13SafetyMonitor12SendValidityO4CaseO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_2455320D8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = SendValidity.Case.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_245532100(uint64_t a1, uint64_t a2)
{
  return sub_2455321A4(*(_QWORD *)a1, *(_BYTE *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
}

uint64_t sub_24553211C()
{
  uint64_t v0;

  v0 = sub_24558F728();
  __swift_allocate_value_buffer(v0, qword_2574871D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2574871D8);
  swift_bridgeObjectRetain();
  return sub_24558F71C();
}

uint64_t sub_2455321A4(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if ((a2 & 1) != 0)
    return ((uint64_t (*)(void))((char *)&loc_2455321D0 + 4 * byte_24559485C[a1]))();
  if ((a4 & 1) != 0)
    return 0;
  return a1 == a3;
}

uint64_t sub_2455322B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 - 18;
  result = 7;
  switch(v1)
  {
    case 0:
    case 1:
      return result;
    case 5:
      result = 6;
      break;
    case 7:
      result = 0;
      break;
    case 8:
      result = 2;
      break;
    case 9:
      result = 3;
      break;
    case 10:
      result = 4;
      break;
    case 11:
      result = 5;
      break;
    case 12:
      result = 6;
      break;
    case 13:
      result = 7;
      break;
    case 15:
      result = 9;
      break;
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
      result = 1;
      break;
    case 32:
      result = 10;
      break;
    case 33:
      result = 11;
      break;
    case 34:
      result = 12;
      break;
    default:
      result = 8;
      break;
  }
  return result;
}

uint64_t type metadata accessor for SendValidityUtilities()
{
  return objc_opt_self();
}

uint64_t _s13SafetyMonitor12SendValidityO4CaseO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_24558F9A4();
  swift_bridgeObjectRelease();
  if (v0 >= 0xC)
    return 12;
  else
    return v0;
}

unint64_t sub_2455323F0()
{
  unint64_t result;

  result = qword_257484A90;
  if (!qword_257484A90)
  {
    result = MEMORY[0x249537C54](&protocol conformance descriptor for SendValidity.Case, &type metadata for SendValidity.Case);
    atomic_store(result, (unint64_t *)&qword_257484A90);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SendValidity(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SendValidity(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_24553249C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2455324B8(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SendValidity()
{
  return &type metadata for SendValidity;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SendValidity.Case(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SendValidity.Case(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_2455325D0 + 4 * byte_24559488F[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_245532604 + 4 * byte_24559488A[v4]))();
}

uint64_t sub_245532604(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24553260C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245532614);
  return result;
}

uint64_t sub_245532620(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245532628);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_24553262C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245532634(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245532640(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245532648(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SendValidity.Case()
{
  return &type metadata for SendValidity.Case;
}

unint64_t sub_245532660()
{
  unint64_t result;

  result = qword_257484A28;
  if (!qword_257484A28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257484A28);
  }
  return result;
}

uint64_t sub_24553269C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_24558F8A8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24558F89C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_24552647C(a1, &qword_254415868);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24558F878();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

id SMCloudKitFunctionSwift.__allocating_init(serviceName:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return SMCloudKitFunctionSwift.init(serviceName:)(a1, a2);
}

id SMCloudKitFunctionSwift.init(serviceName:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v29;
  void *v30;
  uint64_t v31;
  objc_super v32;

  v5 = v2;
  sub_24558F71C();
  v6 = &v5[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_containerName];
  *(_QWORD *)v6 = 0xD000000000000023;
  *((_QWORD *)v6 + 1) = 0x8000000245595780;
  v7 = &v5[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName];
  *(_QWORD *)v7 = a1;
  *((_QWORD *)v7 + 1) = a2;
  v8 = objc_allocWithZone(MEMORY[0x24BDB9038]);
  v9 = (void *)sub_24558F7AC();
  v10 = objc_msgSend(v8, sel_initWithContainerIdentifier_environment_, v9, 1);

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB9030]), sel_initWithContainerID_, v10);
  *(_QWORD *)&v5[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_container] = v11;
  v12 = v11;
  swift_bridgeObjectRetain();
  v13 = (void *)sub_24558F7AC();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_codeServiceWithName_databaseScope_, v13, 3);

  *(_QWORD *)&v5[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_client] = v14;
  v15 = v14;

  v32.receiver = v5;
  v32.super_class = (Class)type metadata accessor for SMCloudKitFunctionSwift();
  v16 = objc_msgSendSuper2(&v32, sel_init);
  v17 = sub_24558F710();
  v18 = sub_24558F8E4();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v31 = v20;
    *(_DWORD *)v19 = 136315650;
    v21 = (char *)v16;
    v22 = objc_msgSend(v21, sel_description);
    v29 = v10;
    v30 = v15;
    v23 = sub_24558F7B8();
    v25 = v24;

    sub_245524F90(v23, v25, &v31);
    sub_24558F914();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    sub_245524F90(0xD000000000000012, 0x800000024559A490, &v31);
    sub_24558F914();
    *(_WORD *)(v19 + 22) = 2080;
    v26 = *(_QWORD *)&v21[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName];
    v27 = *(_QWORD *)&v21[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName + 8];
    swift_bridgeObjectRetain();
    sub_245524F90(v26, v27, &v31);
    sub_24558F914();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245521000, v17, v18, "#SafetyCache,Receiver,%s,%s,initialized with serviceName %s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x249537CD8](v20, -1, -1);
    MEMORY[0x249537CD8](v19, -1, -1);

  }
  else
  {

  }
  return v16;
}

uint64_t type metadata accessor for SMCloudKitFunctionSwift()
{
  uint64_t result;

  result = qword_257484B20;
  if (!qword_257484B20)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SMCloudKitFunctionSwift.requestSafetyCacheRecord(fromZone:token:completion:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, char *a5, uint64_t a6)
{
  void *v6;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  os_log_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  id v51;
  char *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  os_log_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  id v66;
  uint64_t v68;
  os_log_t v69;
  uint64_t v70;
  char *v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254415868);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = v6;
  v17 = objc_msgSend(v16, sel_description);
  v18 = sub_24558F7B8();
  v77 = v19;

  if (a4)
  {
    v75 = v18;
    v20 = a1;
    swift_bridgeObjectRetain_n();
    v21 = v16;
    swift_bridgeObjectRetain_n();
    v22 = v21;
    v23 = sub_24558F710();
    v24 = sub_24558F8E4();
    v72 = v24;
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc();
      v73 = a6;
      v26 = v25;
      v70 = swift_slowAlloc();
      v79 = v70;
      *(_DWORD *)v26 = 136316162;
      v71 = v15;
      swift_bridgeObjectRetain();
      v74 = v20;
      v78 = sub_245524F90(v20, a2, &v79);
      v76 = a3;
      sub_24558F914();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 12) = 2080;
      v68 = v26 + 14;
      v27 = (char *)v22;
      v28 = objc_msgSend(v27, sel_description);
      v29 = a2;
      v30 = a4;
      v31 = a5;
      v32 = sub_24558F7B8();
      v69 = v23;
      v34 = v33;

      v35 = v32;
      a5 = v31;
      a4 = v30;
      a2 = v29;
      v78 = sub_245524F90(v35, v34, &v79);
      sub_24558F914();

      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 22) = 2080;
      v78 = sub_245524F90(0xD000000000000034, 0x800000024559A4B0, &v79);
      sub_24558F914();
      *(_WORD *)(v26 + 32) = 2080;
      swift_bridgeObjectRetain();
      v78 = sub_245524F90(v76, a4, &v79);
      sub_24558F914();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 42) = 2080;
      v36 = *(_QWORD *)&v27[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName];
      v37 = *(_QWORD *)&v27[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName + 8];
      swift_bridgeObjectRetain();
      v78 = sub_245524F90(v36, v37, &v79);
      a3 = v76;
      sub_24558F914();

      v38 = v74;
      v15 = v71;
      swift_bridgeObjectRelease();
      v39 = v69;
      _os_log_impl(&dword_245521000, v69, (os_log_type_t)v72, "#SafetyCache,Receiver,sessionID:%s,%s,%s,requesting safety cache with token %s using serviceName %s", (uint8_t *)v26, 0x34u);
      v40 = v70;
      swift_arrayDestroy();
      MEMORY[0x249537CD8](v40, -1, -1);
      v41 = v26;
      a6 = v73;
      MEMORY[0x249537CD8](v41, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease_n();

      swift_bridgeObjectRelease_n();
      v38 = v20;
    }
    v18 = v75;
  }
  else
  {
    v76 = a3;
    v42 = v16;
    v74 = a1;
    v43 = v42;
    swift_bridgeObjectRetain_n();
    v44 = v43;
    v38 = v74;
    v45 = v44;
    v46 = sub_24558F710();
    v47 = sub_24558F8E4();
    v72 = v47;
    if (os_log_type_enabled(v46, v47))
    {
      v48 = swift_slowAlloc();
      v73 = a6;
      v49 = v48;
      v70 = swift_slowAlloc();
      v79 = v70;
      *(_DWORD *)v49 = 136315906;
      v71 = a5;
      swift_bridgeObjectRetain();
      v78 = sub_245524F90(v38, a2, &v79);
      sub_24558F914();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v49 + 12) = 2080;
      v68 = v49 + 14;
      v50 = (char *)v45;
      v51 = objc_msgSend(v50, sel_description);
      v75 = v18;
      v52 = v15;
      v53 = v51;
      v54 = sub_24558F7B8();
      v69 = v46;
      v55 = v54;
      v57 = v56;

      v78 = sub_245524F90(v55, v57, &v79);
      sub_24558F914();

      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 22) = 2080;
      v78 = sub_245524F90(0xD000000000000034, 0x800000024559A4B0, &v79);
      sub_24558F914();
      *(_WORD *)(v49 + 32) = 2080;
      v58 = *(_QWORD *)&v50[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName];
      v59 = *(_QWORD *)&v50[OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_serviceName + 8];
      swift_bridgeObjectRetain();
      v60 = v58;
      v15 = v52;
      v18 = v75;
      v78 = sub_245524F90(v60, v59, &v79);
      v38 = v74;
      sub_24558F914();

      a5 = v71;
      swift_bridgeObjectRelease();
      v61 = v69;
      _os_log_impl(&dword_245521000, v69, (os_log_type_t)v72, "#SafetyCache,Receiver,sessionID:%s,%s,%s,requesting safety cache without token using serviceName %s", (uint8_t *)v49, 0x2Au);
      v62 = v70;
      swift_arrayDestroy();
      MEMORY[0x249537CD8](v62, -1, -1);
      v63 = v49;
      a6 = v73;
      MEMORY[0x249537CD8](v63, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    a3 = v76;
  }
  v64 = sub_24558F8A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v15, 1, 1, v64);
  v65 = (_QWORD *)swift_allocObject();
  v65[2] = 0;
  v65[3] = 0;
  v65[4] = v38;
  v65[5] = a2;
  v65[6] = a3;
  v65[7] = a4;
  v65[8] = v16;
  v65[9] = v18;
  v65[10] = v77;
  v65[11] = a5;
  v65[12] = a6;
  swift_bridgeObjectRetain();
  swift_retain();
  v66 = v16;
  swift_bridgeObjectRetain();
  sub_24553269C((uint64_t)v15, (uint64_t)&unk_257484AF0, (uint64_t)v65);
  return swift_release();
}

uint64_t sub_245533374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v8 + 184) = v12;
  *(_QWORD *)(v8 + 192) = v13;
  *(_OWORD *)(v8 + 168) = v11;
  *(_QWORD *)(v8 + 152) = a7;
  *(_QWORD *)(v8 + 160) = a8;
  *(_QWORD *)(v8 + 136) = a5;
  *(_QWORD *)(v8 + 144) = a6;
  *(_QWORD *)(v8 + 128) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484B40);
  *(_QWORD *)(v8 + 200) = swift_task_alloc();
  v9 = sub_24558F614();
  *(_QWORD *)(v8 + 208) = v9;
  *(_QWORD *)(v8 + 216) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 224) = swift_task_alloc();
  *(_QWORD *)(v8 + 232) = type metadata accessor for FetchSafetyCacheResponse(0);
  *(_QWORD *)(v8 + 240) = swift_task_alloc();
  *(_QWORD *)(v8 + 248) = swift_task_alloc();
  *(_QWORD *)(v8 + 256) = type metadata accessor for FetchSafetyCacheRequest(0);
  *(_QWORD *)(v8 + 264) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245533494()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  __int128 v8;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 144);
  v8 = *(_OWORD *)(v0 + 128);
  v4 = swift_task_alloc();
  *(_OWORD *)(v4 + 16) = v8;
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v1;
  sub_2455344DC();
  sub_24558F6BC();
  swift_task_dealloc();
  v5 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_client);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 272) = v6;
  *v6 = v0;
  v6[1] = sub_245533594;
  return sub_24553B0A8(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 264), v5);
}

uint64_t sub_245533594()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 280) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24553363C()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, _QWORD);
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  os_log_type_t v30;
  NSObject *v31;
  uint64_t v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(v0 + 64) = 0;
  v1 = *(_QWORD **)(v0 + 248);
  if (*v1)
  {
    v2 = 0;
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 208);
    v4 = *(_QWORD *)(v0 + 216);
    v5 = *(_QWORD *)(v0 + 200);
    sub_2455345A4((uint64_t)v1 + *(int *)(*(_QWORD *)(v0 + 232) + 24), v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      v6 = *(_QWORD *)(v0 + 200);
      sub_24558F608();
      sub_24552647C(v6, &qword_257484B40);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 216) + 32))(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 208));
    }
    sub_2455345EC();
    v2 = (void *)sub_24558F8F0();
    *(_QWORD *)(v0 + 64) = v2;
    v1 = *(_QWORD **)(v0 + 248);
  }
  sub_245534524((uint64_t)v1, *(_QWORD *)(v0 + 240));
  v7 = v2;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v8 = v7;
  v9 = sub_24558F710();
  v10 = sub_24558F8E4();
  v11 = os_log_type_enabled(v9, v10);
  v12 = *(_QWORD *)(v0 + 176);
  if (v11)
  {
    v30 = v10;
    v31 = v9;
    v27 = *(uint64_t **)(v0 + 240);
    v13 = v2;
    v14 = *(_QWORD *)(v0 + 128);
    v26 = *(_QWORD *)(v0 + 168);
    v15 = *(_QWORD *)(v0 + 136);
    v16 = swift_slowAlloc();
    v28 = (_QWORD *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v32[0] = v29;
    *(_DWORD *)v16 = 136316162;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 80) = sub_245524F90(v14, v15, v32);
    sub_24558F914();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 88) = sub_245524F90(v26, v12, v32);
    sub_24558F914();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 22) = 2080;
    *(_QWORD *)(v0 + 96) = sub_245524F90(0xD000000000000034, 0x800000024559A4B0, v32);
    sub_24558F914();
    *(_WORD *)(v16 + 32) = 2048;
    v17 = *v27;
    sub_245534568(*(_QWORD *)(v0 + 240), type metadata accessor for FetchSafetyCacheResponse);
    *(_QWORD *)(v0 + 104) = v17;
    sub_24558F914();
    *(_WORD *)(v16 + 42) = 2112;
    if (v13)
    {
      *(_QWORD *)(v0 + 120) = v8;
      v18 = v8;
    }
    else
    {
      *(_QWORD *)(v0 + 112) = 0;
    }
    sub_24558F914();
    *v28 = v13;

    _os_log_impl(&dword_245521000, v31, v30, "#SafetyCache,Receiver,sessionID:%s,%s,%s,received response,responseCode,%ld,record,%@", (uint8_t *)v16, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257484B50);
    swift_arrayDestroy();
    MEMORY[0x249537CD8](v28, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x249537CD8](v29, -1, -1);
    MEMORY[0x249537CD8](v16, -1, -1);

  }
  else
  {
    sub_245534568(*(_QWORD *)(v0 + 240), type metadata accessor for FetchSafetyCacheResponse);

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

  }
  v19 = *(uint64_t **)(v0 + 248);
  v20 = *v19;
  v21 = *(_QWORD *)(v0 + 264);
  v22 = *(void (**)(uint64_t, void *, _QWORD))(v0 + 184);
  swift_beginAccess();
  v23 = *(void **)(v0 + 64);
  v24 = v23;
  v22(v20, v23, 0);

  sub_245534568((uint64_t)v19, type metadata accessor for FetchSafetyCacheResponse);
  sub_245534568(v21, type metadata accessor for FetchSafetyCacheRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245533B34()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void (*v16)(uint64_t, _QWORD, void *);
  id v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(v0 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v2 = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = v1;
  v4 = sub_24558F710();
  v5 = sub_24558F8D8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 280);
    v7 = *(_QWORD *)(v0 + 176);
    v19 = *(_QWORD *)(v0 + 168);
    v8 = *(_QWORD *)(v0 + 128);
    v9 = *(_QWORD *)(v0 + 136);
    v10 = swift_slowAlloc();
    v20 = (_QWORD *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    v22[0] = v21;
    *(_DWORD *)v10 = 136315906;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 72) = sub_245524F90(v8, v9, v22);
    sub_24558F914();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 40) = sub_245524F90(v19, v7, v22);
    sub_24558F914();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 22) = 2080;
    *(_QWORD *)(v0 + 48) = sub_245524F90(0xD000000000000034, 0x800000024559A4B0, v22);
    sub_24558F914();
    *(_WORD *)(v10 + 32) = 2112;
    v11 = v6;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 56) = v12;
    sub_24558F914();
    *v20 = v12;

    _os_log_impl(&dword_245521000, v4, v5, "#SafetyCache,Receiver,sessionID:%s,%s,%s,returned error %@", (uint8_t *)v10, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257484B50);
    swift_arrayDestroy();
    MEMORY[0x249537CD8](v20, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x249537CD8](v21, -1, -1);
    MEMORY[0x249537CD8](v10, -1, -1);

  }
  else
  {
    v13 = *(void **)(v0 + 280);

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

  }
  v14 = *(void **)(v0 + 280);
  v15 = *(_QWORD *)(v0 + 264);
  v16 = *(void (**)(uint64_t, _QWORD, void *))(v0 + 184);
  v17 = v14;
  v16(1, 0, v14);

  sub_245534568(v15, type metadata accessor for FetchSafetyCacheRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245533ECC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v10;
  uint64_t result;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  if (a5)
  {
    v10 = a5;
  }
  else
  {
    a4 = 0;
    v10 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  a1[2] = a4;
  a1[3] = v10;
  return result;
}

void sub_245534020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;

  if (a3)
    v7 = sub_24558F470();
  else
    v7 = 0;
  v8 = (id)v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2);

}

id SMCloudKitFunctionSwift.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SMCloudKitFunctionSwift.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SMCloudKitFunctionSwift.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SMCloudKitFunctionSwift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2455341BC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_245534220;
  return v6(a1);
}

uint64_t sub_245534220()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24553426C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2455342B8(uint64_t a1)
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
  uint64_t v12;

  v4 = v1[3];
  v12 = v1[2];
  v5 = v1[4];
  v6 = v1[5];
  v7 = v1[6];
  v8 = v1[7];
  v9 = v1[8];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_245526368;
  return sub_245533374(a1, v12, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_245534370()
{
  return type metadata accessor for SMCloudKitFunctionSwift();
}

uint64_t sub_245534378()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24558F728();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_245534400()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_245534424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_245534020(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_24553442C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245534450(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245526368;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257484B30 + dword_257484B30))(a1, v4);
}

uint64_t sub_2455344C0(_QWORD *a1)
{
  uint64_t v1;

  return sub_245533ECC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

unint64_t sub_2455344DC()
{
  unint64_t result;
  uint64_t SafetyCacheRequest;

  result = qword_257484B48;
  if (!qword_257484B48)
  {
    SafetyCacheRequest = type metadata accessor for FetchSafetyCacheRequest(255);
    result = MEMORY[0x249537C54](&unk_245594CC4, SafetyCacheRequest);
    atomic_store(result, (unint64_t *)&qword_257484B48);
  }
  return result;
}

uint64_t sub_245534524(uint64_t a1, uint64_t a2)
{
  uint64_t SafetyCacheResponse;

  SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(SafetyCacheResponse - 8) + 16))(a2, a1, SafetyCacheResponse);
  return a2;
}

uint64_t sub_245534568(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2455345A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484B40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2455345EC()
{
  unint64_t result;

  result = qword_257484B58;
  if (!qword_257484B58)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257484B58);
  }
  return result;
}

uint64_t *ContactsManager.shared.unsafeMutableAddressor()
{
  if (qword_257484708 != -1)
    swift_once();
  return &static ContactsManager.shared;
}

id sub_245534668()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[6];
  objc_super v26;

  v1 = OBJC_IVAR___SMContactsManagerInternal_store;
  v2 = objc_allocWithZone(MEMORY[0x24BDBACF8]);
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_init);
  v4 = OBJC_IVAR___SMContactsManagerInternal_keystoFetch;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257484BA0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2455943B0;
  v6 = (void *)*MEMORY[0x24BDBA288];
  v7 = (void *)*MEMORY[0x24BDBA348];
  *(_QWORD *)(v5 + 32) = *MEMORY[0x24BDBA288];
  *(_QWORD *)(v5 + 40) = v7;
  v8 = (void *)*MEMORY[0x24BDBA2C8];
  v9 = (void *)*MEMORY[0x24BDBA2C0];
  *(_QWORD *)(v5 + 48) = *MEMORY[0x24BDBA2C8];
  *(_QWORD *)(v5 + 56) = v9;
  v25[0] = v5;
  sub_24558F854();
  *(_QWORD *)&v3[v4] = v25[0];
  v10 = &v3[OBJC_IVAR___SMContactsManagerInternal_cachedContact];
  *((_QWORD *)v10 + 1) = 0;
  *((_QWORD *)v10 + 2) = 0;
  *(_QWORD *)v10 = 0;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v14 = v9;

  v26.receiver = v3;
  v26.super_class = (Class)type metadata accessor for ContactsManager();
  v15 = objc_msgSendSuper2(&v26, sel_init);
  v16 = (void *)objc_opt_self();
  v17 = v15;
  v18 = objc_msgSend(v16, sel_defaultCenter);
  v19 = *MEMORY[0x24BDBA3D0];
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v17;
  v25[4] = sub_245537714;
  v25[5] = v20;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 1107296256;
  v25[2] = sub_245534A7C;
  v25[3] = &block_descriptor;
  v21 = _Block_copy(v25);
  v22 = v17;
  swift_release();
  v23 = objc_msgSend(v18, sel_addObserverForName_object_queue_usingBlock_, v19, 0, 0, v21);

  _Block_release(v21);
  swift_unknownObjectRelease();

  return v22;
}

uint64_t sub_245534884(uint64_t a1, void *a2)
{
  uint64_t v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  void *v15;
  uint64_t v17;

  if (qword_257484710 != -1)
    swift_once();
  v3 = sub_24558F728();
  __swift_project_value_buffer(v3, (uint64_t)qword_2574871F8);
  v4 = a2;
  v5 = sub_24558F710();
  v6 = sub_24558F8E4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v17 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = v4;
    v10 = objc_msgSend(v9, sel_description);
    v11 = sub_24558F7B8();
    v13 = v12;

    sub_245524F90(v11, v13, &v17);
    sub_24558F914();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245521000, v5, v6, "%s, CNContactStoreDidChange, clearing cached contact", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249537CD8](v8, -1, -1);
    MEMORY[0x249537CD8](v7, -1, -1);

  }
  else
  {

  }
  v14 = &v4[OBJC_IVAR___SMContactsManagerInternal_cachedContact];
  v15 = *(void **)&v4[OBJC_IVAR___SMContactsManagerInternal_cachedContact];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  *((_QWORD *)v14 + 2) = 0;

  return swift_bridgeObjectRelease();
}

uint64_t sub_245534A7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_24558F404();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_24558F3F8();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id ContactsManager.__deallocating_deinit()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v1, sel_removeObserver_name_object_, v0, *MEMORY[0x24BDBA3D0], 0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for ContactsManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_245534CAC()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ContactsManager()), sel_init);
  static ContactsManager.shared = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for ContactsManager()
{
  return objc_opt_self();
}

id static ContactsManager.shared.getter()
{
  if (qword_257484708 != -1)
    swift_once();
  return (id)static ContactsManager.shared;
}

void *sub_245534D78()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_opt_self();
  v2 = (void *)sub_24558F7AC();
  v3 = objc_msgSend(v1, sel_predicateForContactsMatchingEmailAddress_, v2);

  v4 = *(void **)(v0 + OBJC_IVAR___SMContactsManagerInternal_store);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484B90);
  v5 = (void *)sub_24558F830();
  v11[0] = 0;
  v6 = objc_msgSend(v4, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v3, v5, v11);

  v7 = v11[0];
  if (v6)
  {
    sub_24552DEE8(0, &qword_257484B98);
    v1 = (void *)sub_24558F83C();
    v8 = v7;

  }
  else
  {
    v9 = v11[0];
    sub_24558F47C();

    swift_willThrow();
  }

  return v1;
}

CNContact __swiftcall ContactsManager.contact(with:)(Swift::String_optional with)
{
  char *v1;
  char *v2;
  void *object;
  void *countAndFlagsBits;
  objc_class *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  char *v25;
  id v26;
  char *v27;
  id v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _BYTE *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  char *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  objc_class *v69;
  objc_class *v70;
  objc_class *v71;
  id v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  id v77;
  void *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  id v83;
  char *v84;
  id v85;
  NSObject *v86;
  os_log_type_t v87;
  int v88;
  uint64_t v89;
  char *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  os_log_t v98;
  _BYTE *v99;
  id v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  objc_class *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  _BYTE *v111;
  objc_class *v112;
  char *v113;
  objc_class *v114;
  char *v115;
  objc_class *v116;
  NSObject *v117;
  os_log_type_t v118;
  uint64_t v119;
  char *v120;
  id v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  id v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  os_log_t v129;
  _BYTE v131[12];
  int v132;
  os_log_t v133;
  _BYTE *v134;
  objc_class *v135;
  char *v136;
  uint64_t v137;
  unint64_t v138;
  objc_class *v139;
  id v140[4];

  v2 = v1;
  object = with.value._object;
  countAndFlagsBits = (void *)with.value._countAndFlagsBits;
  v140[3] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)sub_24558F728();
  v6 = (char *)*((_QWORD *)v5 - 1);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = &v131[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = &v131[-v11];
  v13 = MEMORY[0x24BDAC7A8](v10);
  v134 = &v131[-v14];
  MEMORY[0x24BDAC7A8](v13);
  v16 = &v131[-v15];
  v17 = (objc_class *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACA0]), sel_init);
  v139 = v17;
  if (!object)
  {
    if (qword_257484710 != -1)
      swift_once();
    v47 = __swift_project_value_buffer((uint64_t)v5, (uint64_t)qword_2574871F8);
    (*((void (**)(_BYTE *, uint64_t, objc_class *))v6 + 2))(v12, v47, v5);
    v48 = v2;
    v49 = sub_24558F710();
    v50 = sub_24558F8D8();
    if (os_log_type_enabled((os_log_t)v49, v50))
    {
      v51 = swift_slowAlloc();
      v136 = v6;
      v52 = v51;
      v53 = (void *)swift_slowAlloc();
      v140[0] = v53;
      *(_DWORD *)v52 = 136315394;
      v54 = v48;
      v55 = objc_msgSend(v54, sel_description);
      v56 = sub_24558F7B8();
      v135 = v5;
      v57 = v56;
      v59 = v58;

      v137 = sub_245524F90(v57, v59, (uint64_t *)v140);
      sub_24558F914();

      swift_bridgeObjectRelease();
      *(_WORD *)(v52 + 12) = 2080;
      v137 = sub_245524F90(0x28746361746E6F63, 0xEE00293A68746977, (uint64_t *)v140);
      sub_24558F914();
      _os_log_impl(&dword_245521000, (os_log_t)v49, v50, "%s, %s: could not resolve contact due to no handle", (uint8_t *)v52, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x249537CD8](v53, -1, -1);
      MEMORY[0x249537CD8](v52, -1, -1);

      (*((void (**)(_BYTE *, objc_class *))v136 + 1))(v12, v135);
      return (CNContact)v139;
    }
LABEL_25:

    (*((void (**)(_BYTE *, objc_class *))v6 + 1))(v12, v5);
    return (CNContact)v139;
  }
  v18 = v17;
  v136 = v6;
  v6 = &v2[OBJC_IVAR___SMContactsManagerInternal_cachedContact];
  v19 = *(void **)&v2[OBJC_IVAR___SMContactsManagerInternal_cachedContact];
  if (!v19
    || (v20 = (void *)*((_QWORD *)v6 + 2)) == 0
    || (*((void **)v6 + 1) == countAndFlagsBits ? (v21 = v20 == object) : (v21 = 0), !v21 && (sub_24558F9B0() & 1) == 0))
  {
    v135 = v5;
    v5 = v18;
    swift_bridgeObjectRetain();
    v44 = (void *)sub_24558F7AC();
    v45 = (void *)sub_24558F7AC();
    -[objc_class setValue:forKey:](v5, sel_setValue_forKey_, v44, v45);

    v140[0] = countAndFlagsBits;
    v140[1] = object;
    v137 = 64;
    v138 = 0xE100000000000000;
    sub_2455372AC();
    if ((sub_24558F92C() & 1) != 0)
    {
      v46 = (unint64_t)sub_245534D78();
      v49 = v46;
      if (v46 >> 62)
      {
        swift_bridgeObjectRetain();
        v105 = sub_24558F98C();
        swift_bridgeObjectRelease();
        if (v105)
        {
LABEL_30:
          if ((v49 & 0xC000000000000001) == 0)
          {
            if (!*(_QWORD *)((v49 & 0xFFFFFFFFFFFFF8) + 0x10))
              __break(1u);
            goto LABEL_32;
          }
LABEL_49:
          v69 = (objc_class *)MEMORY[0x249537468](0, v49);
          goto LABEL_33;
        }
      }
      else if (*(_QWORD *)((v46 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_30;
      }
LABEL_51:
      swift_bridgeObjectRelease();
      goto LABEL_52;
    }
    v60 = (void *)objc_opt_self();
    v61 = objc_allocWithZone(MEMORY[0x24BDBAD88]);
    swift_bridgeObjectRetain();
    v62 = (void *)sub_24558F7AC();
    swift_bridgeObjectRelease();
    v63 = objc_msgSend(v61, sel_initWithStringValue_, v62);

    v64 = objc_msgSend(v60, sel_predicateForContactsMatchingPhoneNumber_, v63);
    v65 = *(void **)&v2[OBJC_IVAR___SMContactsManagerInternal_store];
    __swift_instantiateConcreteTypeFromMangledName(&qword_257484B90);
    v66 = (void *)sub_24558F830();
    v140[0] = 0;
    v12 = objc_msgSend(v65, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v64, v66, v140);

    v67 = v140[0];
    if (!v12)
    {
      v77 = v140[0];
      v78 = (void *)sub_24558F47C();

      swift_willThrow();
      v79 = (uint64_t)v135;
      v80 = v136;
      if (qword_257484710 != -1)
        swift_once();
      v81 = __swift_project_value_buffer(v79, (uint64_t)qword_2574871F8);
      (*((void (**)(_BYTE *, uint64_t, uint64_t))v80 + 2))(v9, v81, v79);
      v82 = v2;
      v83 = v78;
      v84 = v82;
      swift_bridgeObjectRetain();
      v85 = v78;
      v86 = sub_24558F710();
      v87 = sub_24558F8D8();
      v88 = v87;
      if (os_log_type_enabled(v86, v87))
      {
        v89 = swift_slowAlloc();
        v134 = (_BYTE *)swift_slowAlloc();
        v140[0] = v134;
        *(_DWORD *)v89 = 136315906;
        v133 = v86;
        v90 = v84;
        v91 = objc_msgSend(v90, sel_description);
        v92 = sub_24558F7B8();
        v132 = v88;
        v93 = v92;
        v95 = v94;

        v137 = sub_245524F90(v93, v95, (uint64_t *)v140);
        sub_24558F914();

        swift_bridgeObjectRelease();
        *(_WORD *)(v89 + 12) = 2080;
        v137 = sub_245524F90(0x28746361746E6F63, 0xEE00293A68746977, (uint64_t *)v140);
        sub_24558F914();
        *(_WORD *)(v89 + 22) = 2080;
        swift_bridgeObjectRetain();
        v137 = sub_245524F90((uint64_t)countAndFlagsBits, (unint64_t)object, (uint64_t *)v140);
        sub_24558F914();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v89 + 32) = 2080;
        swift_getErrorValue();
        v96 = sub_24558F9D4();
        v137 = sub_245524F90(v96, v97, (uint64_t *)v140);
        sub_24558F914();
        swift_bridgeObjectRelease();

        v98 = v133;
        _os_log_impl(&dword_245521000, v133, (os_log_type_t)v132, "%s, %s: Unable to resolve contact from handle - %s| Error: %s", (uint8_t *)v89, 0x2Au);
        v99 = v134;
        swift_arrayDestroy();
        MEMORY[0x249537CD8](v99, -1, -1);
        MEMORY[0x249537CD8](v89, -1, -1);

        (*((void (**)(_BYTE *, objc_class *))v136 + 1))(v9, v135);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*((void (**)(_BYTE *, uint64_t))v80 + 1))(v9, v79);
      }
      return (CNContact)v139;
    }
    sub_24552DEE8(0, &qword_257484B98);
    v49 = sub_24558F83C();
    v68 = v67;

    if (v49 >> 62)
    {
      swift_bridgeObjectRetain();
      v48 = (char *)sub_24558F98C();
      swift_bridgeObjectRelease();
      if (!v48)
        goto LABEL_51;
    }
    else
    {
      v48 = *(char **)((v49 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v48)
        goto LABEL_51;
    }
    if ((v49 & 0xC000000000000001) != 0)
      goto LABEL_49;
    if (*(_QWORD *)((v49 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_32:
      v69 = (objc_class *)*(id *)(v49 + 32);
LABEL_33:
      v70 = v69;
      swift_bridgeObjectRelease();
      v71 = v70;
      v72 = -[objc_class givenName](v71, sel_givenName);
      v73 = sub_24558F7B8();
      v75 = v74;

      swift_bridgeObjectRelease();
      v76 = HIBYTE(v75) & 0xF;
      if ((v75 & 0x2000000000000000) == 0)
        v76 = v73 & 0xFFFFFFFFFFFFLL;
      if (v76)
      {

        v5 = v71;
LABEL_45:

        v139 = v71;
LABEL_53:
        v106 = *(void **)v6;
        *(_QWORD *)v6 = v71;
        *((_QWORD *)v6 + 1) = countAndFlagsBits;
        *((_QWORD *)v6 + 2) = object;
        v107 = v71;

        swift_bridgeObjectRelease();
        v108 = (uint64_t)v135;
        if (qword_257484710 != -1)
          swift_once();
        v109 = __swift_project_value_buffer(v108, (uint64_t)qword_2574871F8);
        v110 = v136;
        v111 = v134;
        (*((void (**)(_BYTE *, uint64_t, uint64_t))v136 + 2))(v134, v109, v108);
        v112 = v139;
        v113 = v2;
        v114 = v112;
        v115 = v113;
        v116 = v114;
        v117 = sub_24558F710();
        v118 = sub_24558F8C0();
        if (os_log_type_enabled(v117, v118))
        {
          v119 = swift_slowAlloc();
          v133 = (os_log_t)swift_slowAlloc();
          v140[0] = v133;
          *(_DWORD *)v119 = 136315650;
          v120 = v115;
          v121 = objc_msgSend(v120, sel_description);
          v122 = sub_24558F7B8();
          v124 = v123;

          v137 = sub_245524F90(v122, v124, (uint64_t *)v140);
          sub_24558F914();

          swift_bridgeObjectRelease();
          *(_WORD *)(v119 + 12) = 2080;
          v137 = sub_245524F90(0x28746361746E6F63, 0xEE00293A68746977, (uint64_t *)v140);
          sub_24558F914();
          *(_WORD *)(v119 + 22) = 2080;
          v125 = -[objc_class givenName](v116, sel_givenName);
          v126 = sub_24558F7B8();
          v128 = v127;

          v137 = sub_245524F90(v126, v128, (uint64_t *)v140);
          sub_24558F914();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_245521000, v117, v118, "%s, %s: setting cached contact %s", (uint8_t *)v119, 0x20u);
          v129 = v133;
          swift_arrayDestroy();
          MEMORY[0x249537CD8](v129, -1, -1);
          MEMORY[0x249537CD8](v119, -1, -1);

          (*((void (**)(_BYTE *, objc_class *))v136 + 1))(v134, v135);
        }
        else
        {

          (*((void (**)(_BYTE *, uint64_t))v110 + 1))(v111, v108);
        }
        swift_beginAccess();
        return (CNContact)v139;
      }
      v100 = -[objc_class familyName](v71, sel_familyName);
      v101 = sub_24558F7B8();
      v103 = v102;

      swift_bridgeObjectRelease();
      v104 = HIBYTE(v103) & 0xF;
      if ((v103 & 0x2000000000000000) == 0)
        v104 = v101 & 0xFFFFFFFFFFFFLL;
      if (v104)
        goto LABEL_45;

LABEL_52:
      v71 = v5;
      goto LABEL_53;
    }
    __break(1u);
    goto LABEL_25;
  }
  v22 = qword_257484710;
  v23 = v19;
  if (v22 != -1)
    swift_once();
  v24 = __swift_project_value_buffer((uint64_t)v5, (uint64_t)qword_2574871F8);
  v25 = v136;
  (*((void (**)(_BYTE *, uint64_t, objc_class *))v136 + 2))(v16, v24, v5);
  v26 = v23;
  v27 = v2;
  v28 = v26;
  v29 = v27;
  v30 = sub_24558F710();
  v31 = sub_24558F8CC();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = swift_slowAlloc();
    v134 = (_BYTE *)swift_slowAlloc();
    v140[0] = v134;
    *(_DWORD *)v32 = 136315650;
    v33 = v29;
    v135 = v5;
    v34 = v33;
    v35 = objc_msgSend(v33, sel_description);
    v36 = sub_24558F7B8();
    v38 = v37;

    v137 = sub_245524F90(v36, v38, (uint64_t *)v140);
    sub_24558F914();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2080;
    v137 = sub_245524F90(0x28746361746E6F63, 0xEE00293A68746977, (uint64_t *)v140);
    sub_24558F914();
    *(_WORD *)(v32 + 22) = 2080;
    v39 = objc_msgSend(v28, sel_givenName);
    v40 = sub_24558F7B8();
    v42 = v41;

    v137 = sub_245524F90(v40, v42, (uint64_t *)v140);
    sub_24558F914();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245521000, v30, v31, "%s, %s: returning cached contact %s", (uint8_t *)v32, 0x20u);
    v43 = v134;
    swift_arrayDestroy();
    MEMORY[0x249537CD8](v43, -1, -1);
    MEMORY[0x249537CD8](v32, -1, -1);

    (*((void (**)(_BYTE *, objc_class *))v136 + 1))(v16, v135);
  }
  else
  {

    (*((void (**)(_BYTE *, objc_class *))v25 + 1))(v16, v5);
  }

  return (CNContact)v28;
}

uint64_t ContactsManager.activeSessionRecipientContacts(for:)(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Swift::String_optional v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v49;
  void *v50;
  uint64_t v51;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACA0]), sel_init);
  if (a1)
  {
    v5 = a1;
    v6 = objc_msgSend(v5, sel_receiverHandles);
    sub_24552DEE8(0, &qword_257484A20);
    v7 = sub_24558F83C();

    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      v8 = sub_24558F98C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v8 < 1)
    {
      if (qword_257484710 == -1)
      {
LABEL_21:
        v35 = sub_24558F728();
        __swift_project_value_buffer(v35, (uint64_t)qword_2574871F8);
        v36 = v2;
        v37 = sub_24558F710();
        v38 = sub_24558F8D8();
        if (os_log_type_enabled(v37, v38))
        {
          v39 = swift_slowAlloc();
          v40 = swift_slowAlloc();
          v51 = v40;
          *(_DWORD *)v39 = 136315394;
          v41 = v36;
          v42 = objc_msgSend(v41, sel_description);
          v43 = sub_24558F7B8();
          v45 = v44;

          sub_245524F90(v43, v45, &v51);
          sub_24558F914();

          swift_bridgeObjectRelease();
          *(_WORD *)(v39 + 12) = 2080;
          sub_245524F90(0xD000000000000024, 0x800000024559A5B0, &v51);
          sub_24558F914();
          _os_log_impl(&dword_245521000, v37, v38, "%s, %s: could not resolve contact due to no handles", (uint8_t *)v39, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x249537CD8](v40, -1, -1);
          MEMORY[0x249537CD8](v39, -1, -1);

        }
        else
        {

        }
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257484BA0);
        v47 = swift_allocObject();
        *(_OWORD *)(v47 + 16) = xmmword_2455949F0;
        *(_QWORD *)(v47 + 32) = v4;
        v51 = v47;
        sub_24558F854();
        v34 = v51;

        return v34;
      }
LABEL_33:
      swift_once();
      goto LABEL_21;
    }
    v51 = MEMORY[0x24BEE4AF8];
    v9 = objc_msgSend(v5, sel_receiverHandles);
    v10 = sub_24558F83C();

    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      v11 = sub_24558F98C();
      swift_bridgeObjectRelease();
      if (v11)
        goto LABEL_7;
    }
    else
    {
      v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v11)
      {
LABEL_7:
        if (v11 >= 1)
        {
          v49 = v4;
          v50 = v5;
          v12 = 0;
          do
          {
            if ((v10 & 0xC000000000000001) != 0)
              v13 = (id)MEMORY[0x249537468](v12, v10);
            else
              v13 = *(id *)(v10 + 8 * v12 + 32);
            v14 = v13;
            v15 = objc_msgSend(v13, sel_primaryHandle, v49);
            v16 = sub_24558F7B8();
            v18 = v17;

            v19.value._countAndFlagsBits = v16;
            v19.value._object = v18;
            ContactsManager.contact(with:)(v19);
            v20 = swift_bridgeObjectRelease();
            MEMORY[0x24953733C](v20);
            if (*(_QWORD *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_24558F860();
            ++v12;
            sub_24558F86C();
            sub_24558F854();

          }
          while (v11 != v12);

          swift_bridgeObjectRelease();
          v34 = v51;
          v4 = v49;
          goto LABEL_30;
        }
        __break(1u);
        goto LABEL_33;
      }
    }

    swift_bridgeObjectRelease();
    v34 = MEMORY[0x24BEE4AF8];
LABEL_30:

    return v34;
  }
  if (qword_257484710 != -1)
    swift_once();
  v21 = sub_24558F728();
  __swift_project_value_buffer(v21, (uint64_t)qword_2574871F8);
  v22 = v2;
  v23 = sub_24558F710();
  v24 = sub_24558F8D8();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = v4;
    v26 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v51 = v27;
    *(_DWORD *)v26 = 136315394;
    v28 = v22;
    v29 = objc_msgSend(v28, sel_description);
    v30 = sub_24558F7B8();
    v32 = v31;

    sub_245524F90(v30, v32, &v51);
    sub_24558F914();

    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    sub_245524F90(0xD000000000000024, 0x800000024559A5B0, &v51);
    sub_24558F914();
    _os_log_impl(&dword_245521000, v23, v24, "%s, %s: could not resolve contact due to no session state or configuration", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x249537CD8](v27, -1, -1);
    v33 = v26;
    v4 = v25;
    MEMORY[0x249537CD8](v33, -1, -1);

  }
  else
  {

  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257484BA0);
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_2455949F0;
  *(_QWORD *)(v46 + 32) = v4;
  v51 = v46;
  sub_24558F854();
  return v51;
}

Swift::OpaquePointer_optional __swiftcall ContactsManager.fetchAdditionalInfo(for:keysToFetch:)(Swift::OpaquePointer_optional result, Swift::OpaquePointer_optional keysToFetch)
{
  char *v2;
  unint64_t rawValue;
  char *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  os_log_type_t type;
  id v56;
  id v57;
  id v58;
  _QWORD *v59;
  id v60[2];

  rawValue = (unint64_t)result.value._rawValue;
  v60[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (!result.value._rawValue)
    goto LABEL_40;
  if (!*(_QWORD *)&result.is_nil)
  {
    rawValue = 0;
    goto LABEL_40;
  }
  v4 = v2;
  swift_bridgeObjectRetain();
  v5 = swift_bridgeObjectRetain();
  sub_2455372F0(v5);
  if (rawValue >> 62)
  {
LABEL_38:
    swift_bridgeObjectRetain_n();
    v6 = sub_24558F98C();
    if (v6)
      goto LABEL_5;
LABEL_39:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  v6 = *(_QWORD *)((rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v6)
    goto LABEL_39;
LABEL_5:
  v7 = objc_opt_self();
  v54 = v4;
  v56 = *(id *)&v4[OBJC_IVAR___SMContactsManagerInternal_store];
  v57 = (id)v7;
  v8 = 4;
  while (1)
  {
    v9 = v8 - 4;
    if ((rawValue & 0xC000000000000001) != 0)
      v10 = (id)MEMORY[0x249537468](v8 - 4, rawValue);
    else
      v10 = *(id *)(rawValue + 8 * v8);
    v11 = v10;
    v12 = v8 - 3;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257484BB0);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_245594A00;
    v14 = objc_msgSend(v11, sel_identifier);
    v15 = sub_24558F7B8();
    v17 = v16;

    *(_QWORD *)(v13 + 32) = v15;
    *(_QWORD *)(v13 + 40) = v17;
    v18 = (void *)sub_24558F830();
    swift_bridgeObjectRelease();
    v19 = objc_msgSend(v57, sel_predicateForContactsWithIdentifiers_, v18);

    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484B90);
    v21 = (void *)sub_24558F830();
    v60[0] = 0;
    v22 = objc_msgSend(v56, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v19, v21, v60);

    v4 = (char *)v60[0];
    if (!v22)
      break;
    sub_24552DEE8(0, &qword_257484B98);
    v23 = sub_24558F83C();
    v24 = v4;

    if (v23 >> 62)
    {
      swift_bridgeObjectRetain();
      v29 = sub_24558F98C();
      swift_bridgeObjectRelease();
      if (!v29)
      {
LABEL_6:

        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
    }
    else if (!*(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_6;
    }
    if ((v23 & 0xC000000000000001) != 0)
    {
      v25 = (char *)MEMORY[0x249537468](0, v23);
    }
    else
    {
      if (!*(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_36;
      v25 = (char *)*(id *)(v23 + 32);
    }
    v4 = v25;
    swift_bridgeObjectRelease();
    v26 = v4;
    if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
      || (rawValue & 0x8000000000000000) != 0
      || (rawValue & 0x4000000000000000) != 0)
    {
      sub_2455374A8(rawValue);
    }
    v27 = rawValue & 0xFFFFFFFFFFFFFF8;
    if (v9 >= *(_QWORD *)((rawValue & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_37;
    v28 = *(void **)(v27 + 8 * v8);
    *(_QWORD *)(v27 + 8 * v8) = v26;

    sub_24558F854();
LABEL_7:
    ++v8;
    if (v12 == v6)
      goto LABEL_39;
  }
  v30 = v60[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = (void *)sub_24558F47C();

  swift_willThrow();
  if (qword_257484710 != -1)
    swift_once();
  v32 = sub_24558F728();
  __swift_project_value_buffer(v32, (uint64_t)qword_2574871F8);
  v33 = v54;
  v34 = v11;
  v35 = v31;
  v36 = v33;
  v37 = v34;
  v38 = v31;
  swift_bridgeObjectRetain();
  v39 = sub_24558F710();
  v40 = sub_24558F8D8();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = swift_slowAlloc();
    v59 = (_QWORD *)swift_slowAlloc();
    v58 = (id)swift_slowAlloc();
    v60[0] = v58;
    *(_DWORD *)v41 = 136316162;
    type = v40;
    v42 = v36;
    v43 = objc_msgSend(v42, sel_description);
    v44 = sub_24558F7B8();
    v46 = v45;

    sub_245524F90(v44, v46, (uint64_t *)v60);
    sub_24558F914();

    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 12) = 2080;
    sub_245524F90(0xD000000000000025, 0x800000024559A5E0, (uint64_t *)v60);
    sub_24558F914();
    *(_WORD *)(v41 + 22) = 2112;
    v47 = v37;
    sub_24558F914();
    *v59 = v37;

    *(_WORD *)(v41 + 32) = 2080;
    v48 = swift_bridgeObjectRetain();
    v49 = MEMORY[0x249537360](v48, v20);
    v51 = v50;
    swift_bridgeObjectRelease();
    sub_245524F90(v49, v51, (uint64_t *)v60);
    sub_24558F914();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 42) = 2080;
    swift_getErrorValue();
    v52 = sub_24558F9D4();
    sub_245524F90(v52, v53, (uint64_t *)v60);
    sub_24558F914();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245521000, v39, type, "%s, %s: Unable to fetch additional keys for contact - %@, keys - %s| Error: %s", (uint8_t *)v41, 0x34u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257484B50);
    swift_arrayDestroy();
    MEMORY[0x249537CD8](v59, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x249537CD8](v58, -1, -1);
    MEMORY[0x249537CD8](v41, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  rawValue = 0;
LABEL_40:
  result.value._rawValue = (void *)rawValue;
  return result;
}

CNContact_optional __swiftcall ContactsManager.fetchSelfContact()()
{
  char *v0;
  void *v1;
  void *v2;
  objc_class *v3;
  id v4;
  Swift::Bool v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  id v10;
  char *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  void *v16;
  char *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  objc_class *v24;
  id v25[2];
  CNContact_optional result;

  v25[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *(void **)&v0[OBJC_IVAR___SMContactsManagerInternal_store];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484B90);
  v2 = (void *)sub_24558F830();
  v25[0] = 0;
  v3 = (objc_class *)objc_msgSend(v1, sel__crossPlatformUnifiedMeContactWithKeysToFetch_error_, v2, v25);

  v4 = v25[0];
  if (!v3)
  {
    v6 = v4;
    v7 = (void *)sub_24558F47C();

    swift_willThrow();
    if (qword_257484710 != -1)
      swift_once();
    v8 = sub_24558F728();
    __swift_project_value_buffer(v8, (uint64_t)qword_2574871F8);
    v9 = v0;
    v10 = v7;
    v11 = v9;
    v12 = v7;
    v13 = sub_24558F710();
    v14 = sub_24558F8D8();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v16 = (void *)swift_slowAlloc();
      v25[0] = v16;
      *(_DWORD *)v15 = 136315650;
      v17 = v11;
      v18 = objc_msgSend(v17, sel_description);
      v19 = sub_24558F7B8();
      v21 = v20;

      sub_245524F90(v19, v21, (uint64_t *)v25);
      sub_24558F914();

      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2080;
      sub_245524F90(0xD000000000000012, 0x800000024559A610, (uint64_t *)v25);
      sub_24558F914();
      *(_WORD *)(v15 + 22) = 2080;
      swift_getErrorValue();
      v22 = sub_24558F9D4();
      sub_245524F90(v22, v23, (uint64_t *)v25);
      sub_24558F914();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_245521000, v13, v14, "%s, %s: Unable to fetch self contact, error: %s", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x249537CD8](v16, -1, -1);
      MEMORY[0x249537CD8](v15, -1, -1);

    }
    else
    {

    }
    v3 = 0;
  }
  v24 = v3;
  result.value.super.isa = v24;
  result.is_nil = v5;
  return result;
}

uint64_t sub_24553721C()
{
  uint64_t v0;

  v0 = sub_24558F728();
  __swift_allocate_value_buffer(v0, qword_2574871F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2574871F8);
  swift_bridgeObjectRetain();
  return sub_24558F71C();
}

unint64_t sub_2455372AC()
{
  unint64_t result;

  result = qword_257484B78;
  if (!qword_257484B78)
  {
    result = MEMORY[0x249537C54](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257484B78);
  }
  return result;
}

uint64_t sub_2455372F0(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_24558F98C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_24558F98C();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x249537474](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_245537734(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_24558F98C();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_24558F854();
  }
  __break(1u);
  return result;
}

void sub_2455374A8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24558F98C();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x249537474);
}

uint64_t destroy for ContactsManager.SMCNContact(id *a1)
{

  return swift_bridgeObjectRelease();
}

_QWORD *_s13SafetyMonitor15ContactsManagerC11SMCNContactVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ContactsManager.SMCNContact(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
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

uint64_t assignWithTake for ContactsManager.SMCNContact(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactsManager.SMCNContact(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactsManager.SMCNContact(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactsManager.SMCNContact()
{
  return &type metadata for ContactsManager.SMCNContact;
}

uint64_t sub_2455376F0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_245537714(uint64_t a1)
{
  uint64_t v1;

  return sub_245534884(a1, *(void **)(v1 + 16));
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

uint64_t sub_245537734(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  uint64_t *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_24558F98C();
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
    v10 = sub_24558F98C();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2455379B0();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_257484BE8);
          v12 = sub_245537930(v16, i, a3);
          v14 = *v13;
          swift_unknownObjectRetain();
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257484B90);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_24558F998();
  __break(1u);
  return result;
}

void (*sub_245537930(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_245537A40(v6, a2, a3);
  return sub_245537984;
}

void sub_245537984(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

unint64_t sub_2455379B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257484BF0;
  if (!qword_257484BF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257484BE8);
    result = MEMORY[0x249537C54](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_257484BF0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249537C48](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t (*sub_245537A40(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x249537468](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_unknownObjectRetain();
LABEL_5:
    *v3 = v4;
    return sub_245537AAC;
  }
  __break(1u);
  return result;
}

uint64_t sub_245537AAC()
{
  return swift_unknownObjectRelease();
}

id CNContact.localizedName.getter()
{
  uint64_t v0;
  id result;
  void *v2;
  id v3;
  uint64_t v4;

  result = objc_msgSend((id)objc_opt_self(), sel_componentsForContact_, v0);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend((id)objc_opt_self(), sel_localizedStringFromPersonNameComponents_style_options_, result, 1, 0);
    v4 = sub_24558F7B8();

    return (id)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL sub_245537B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

void sub_245537B5C(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

void sub_245537B6C(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  char v4;

  sub_24553B080();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 9) = v4 & 1;
}

uint64_t sub_245537B9C()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void sub_245537BA4(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  char v4;

  sub_24553B080();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 9) = v4 & 1;
}

uint64_t sub_245537BD8()
{
  sub_24558F9E0();
  sub_24558F740();
  return sub_24558F9EC();
}

uint64_t sub_245537C40()
{
  sub_245539E60();
  return sub_24558F65C();
}

uint64_t sub_245537C78()
{
  sub_24558F9E0();
  sub_24558F740();
  return sub_24558F9EC();
}

BOOL sub_245537CDC(uint64_t a1, uint64_t *a2)
{
  return sub_245537B50(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_245537CF8()
{
  qword_257487210 = (uint64_t)&unk_25166CB00;
}

uint64_t sub_245537D0C@<X0>(_QWORD *a1@<X8>)
{
  if (qword_257484718 != -1)
    swift_once();
  *a1 = qword_257487210;
  return swift_bridgeObjectRetain();
}

uint64_t sub_245537D5C()
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
  uint64_t v24;

  v0 = sub_24558F704();
  __swift_allocate_value_buffer(v0, qword_257487218);
  __swift_project_value_buffer(v0, (uint64_t)qword_257487218);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484C88);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484C90);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_245594A50;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_SUCCESS";
  *(_QWORD *)(v7 + 8) = 40;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_24558F6EC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_UNKNOWN_ERROR";
  *(_QWORD *)(v11 + 8) = 46;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_DENIED";
  *((_QWORD *)v13 + 1) = 39;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_MISSING_ACCESS_DATA_RECORD";
  *((_QWORD *)v15 + 1) = 59;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 4;
  *(_QWORD *)v17 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_MISSING_SAFETY_CACHE_RECORD";
  *((_QWORD *)v17 + 1) = 60;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 5;
  *(_QWORD *)v19 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_MISSING_TOKEN";
  *((_QWORD *)v19 + 1) = 46;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 6;
  *(_QWORD *)v21 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_MISSING_RELEASE_TIME";
  *((_QWORD *)v21 + 1) = 53;
  v21[16] = 2;
  v10();
  v22 = (_QWORD *)(v6 + 7 * v3);
  v23 = (char *)v22 + *(int *)(v1 + 48);
  *v22 = 7;
  *(_QWORD *)v23 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_ZONE_NOT_FOUND";
  *((_QWORD *)v23 + 1) = 47;
  v23[16] = 2;
  v10();
  v24 = v6 + 8 * v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + 8 * v3) = 8;
  *(_QWORD *)v24 = "FETCH_SAFETY_CACHE_RESPONSE_CODE_RECORD_TRANSPORT_INIT_FAILURE";
  *(_QWORD *)(v24 + 8) = 62;
  *(_BYTE *)(v24 + 16) = 2;
  v10();
  return sub_24558F6F8();
}

uint64_t sub_245538038@<X0>(uint64_t a1@<X8>)
{
  return sub_2455381A0(&qword_257484720, (uint64_t)qword_257487218, a1);
}

void sub_245538054()
{
  strcpy((char *)&qword_257487230, "HelloRequest");
  algn_257487238[5] = 0;
  *(_WORD *)&algn_257487238[6] = -5120;
}

uint64_t sub_245538080(uint64_t a1)
{
  return sub_24553830C(a1, qword_257487240, (uint64_t)"name", 4);
}

uint64_t sub_245538098@<X0>(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  return sub_24558F62C();
}

uint64_t sub_2455380BC(uint64_t a1, uint64_t a2)
{
  return sub_245538548(a1, a2, &qword_257484728, &qword_257487230);
}

uint64_t (*sub_2455380E8())()
{
  return nullsub_1;
}

uint64_t sub_2455380FC()
{
  return sub_245538410();
}

uint64_t sub_245538110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24553847C(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for HelloRequest);
}

uint64_t sub_245538130()
{
  sub_2455393C4(&qword_257484C98, type metadata accessor for HelloRequest, (uint64_t)&unk_245594F5C);
  return sub_24558F650();
}

uint64_t sub_245538184@<X0>(uint64_t a1@<X8>)
{
  return sub_2455381A0(&qword_257484730, (uint64_t)qword_257487240, a1);
}

uint64_t sub_2455381A0@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_24558F704();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_24553820C()
{
  sub_2455393C4(&qword_257484C60, type metadata accessor for HelloRequest, (uint64_t)&unk_245594F94);
  return sub_24558F6A4();
}

uint64_t sub_245538250()
{
  sub_2455393C4(&qword_257484C60, type metadata accessor for HelloRequest, (uint64_t)&unk_245594F94);
  return sub_24558F6B0();
}

uint64_t sub_2455382A4(_QWORD *a1, char *a2)
{
  return sub_24553972C(a1, a2, type metadata accessor for HelloRequest) & 1;
}

void sub_2455382C4()
{
  strcpy((char *)&qword_257487258, "HelloResponse");
  unk_257487266 = -4864;
}

uint64_t sub_2455382F4(uint64_t a1)
{
  return sub_24553830C(a1, qword_257487268, (uint64_t)"response", 8);
}

uint64_t sub_24553830C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = sub_24558F704();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484C88);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484C90);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80);
  v10 = (v9 + 32) & ~v9;
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_245594A00;
  v12 = v11 + v10 + *(int *)(v8 + 48);
  *(_QWORD *)(v11 + v10) = 1;
  *(_QWORD *)v12 = a3;
  *(_QWORD *)(v12 + 8) = a4;
  *(_BYTE *)(v12 + 16) = 2;
  v13 = *MEMORY[0x24BE5C318];
  v14 = sub_24558F6EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v12, v13, v14);
  return sub_24558F6F8();
}

uint64_t sub_245538410()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_24558F668();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 1)
      sub_24558F680();
  }
  return result;
}

uint64_t sub_24553847C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD))
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v7 = v4[1];
  v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0)
    v8 = *v4 & 0xFFFFFFFFFFFFLL;
  if (!v8 || (result = sub_24558F6D4(), !v5))
  {
    a4(0);
    return sub_24558F620();
  }
  return result;
}

uint64_t sub_245538528(uint64_t a1, uint64_t a2)
{
  return sub_245538548(a1, a2, &qword_257484738, &qword_257487258);
}

uint64_t sub_245538548(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t v5;

  if (*a3 != -1)
    swift_once();
  v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_24553859C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24553847C(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for HelloResponse);
}

uint64_t sub_2455385B8()
{
  sub_2455393C4(&qword_257484CA8, type metadata accessor for HelloResponse, (uint64_t)&unk_245594DF4);
  return sub_24558F650();
}

uint64_t sub_245538608@<X0>(uint64_t a1@<X8>)
{
  return sub_2455381A0(&qword_257484740, (uint64_t)qword_257487268, a1);
}

uint64_t sub_245538624()
{
  sub_2455393C4(&qword_257484C40, type metadata accessor for HelloResponse, (uint64_t)&unk_245594E2C);
  return sub_24558F6A4();
}

uint64_t sub_245538664()
{
  sub_2455393C4(&qword_257484C40, type metadata accessor for HelloResponse, (uint64_t)&unk_245594E2C);
  return sub_24558F6B0();
}

uint64_t sub_2455386B4(_QWORD *a1, char *a2)
{
  return sub_24553972C(a1, a2, type metadata accessor for HelloResponse) & 1;
}

uint64_t sub_2455386D4()
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

  v0 = sub_24558F704();
  __swift_allocate_value_buffer(v0, qword_257487280);
  __swift_project_value_buffer(v0, (uint64_t)qword_257487280);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484C88);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484C90);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2455943C0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "zoneName";
  *(_QWORD *)(v7 + 8) = 8;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_24558F6EC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "token";
  *((_QWORD *)v11 + 1) = 5;
  v11[16] = 2;
  v10();
  return sub_24558F6F8();
}

uint64_t sub_245538824()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_24558F668();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2 || result == 1)
        sub_24558F680();
      result = sub_24558F668();
    }
  }
  return result;
}

uint64_t sub_2455388B4()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;

  v2 = v0[1];
  v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v3 = *v0 & 0xFFFFFFFFFFFFLL;
  if (!v3 || (result = sub_24558F6D4(), !v1))
  {
    v5 = v0[3];
    v6 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0)
      v6 = v0[2] & 0xFFFFFFFFFFFFLL;
    if (!v6 || (result = sub_24558F6D4(), !v1))
    {
      type metadata accessor for FetchSafetyCacheRequest(0);
      return sub_24558F620();
    }
  }
  return result;
}

uint64_t sub_24553898C@<X0>(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  return sub_24558F62C();
}

unint64_t sub_2455389B4()
{
  return 0xD000000000000017;
}

uint64_t sub_2455389D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 24);
  v5 = sub_24558F638();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_245538A10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 24);
  v5 = sub_24558F638();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_245538A50())()
{
  return nullsub_1;
}

uint64_t sub_245538A64()
{
  return sub_245538824();
}

uint64_t sub_245538A78()
{
  return sub_2455388B4();
}

uint64_t sub_245538A8C()
{
  sub_2455393C4(&qword_257484CB0, type metadata accessor for FetchSafetyCacheRequest, (uint64_t)&unk_245594C8C);
  return sub_24558F650();
}

uint64_t sub_245538ADC@<X0>(uint64_t a1@<X8>)
{
  return sub_2455381A0(&qword_257484748, (uint64_t)qword_257487280, a1);
}

uint64_t sub_245538AF8()
{
  sub_2455393C4((unint64_t *)&qword_257484B48, type metadata accessor for FetchSafetyCacheRequest, (uint64_t)&unk_245594CC4);
  return sub_24558F6A4();
}

uint64_t sub_245538B38()
{
  sub_2455393C4((unint64_t *)&qword_257484B48, type metadata accessor for FetchSafetyCacheRequest, (uint64_t)&unk_245594CC4);
  return sub_24558F6B0();
}

uint64_t sub_245538B8C()
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

  v0 = sub_24558F704();
  __swift_allocate_value_buffer(v0, qword_257487298);
  __swift_project_value_buffer(v0, (uint64_t)qword_257487298);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484C88);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484C90);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2455943C0;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "responseCode";
  *(_QWORD *)(v7 + 8) = 12;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_24558F6EC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "safetyCacheRecord";
  *((_QWORD *)v11 + 1) = 17;
  v11[16] = 2;
  v10();
  return sub_24558F6F8();
}

uint64_t sub_245538CDC()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = sub_24558F668();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        sub_245538DB4();
      }
      else if (result == 1)
      {
        sub_245539E60();
        sub_24558F674();
      }
      result = sub_24558F668();
    }
  }
  return result;
}

uint64_t sub_245538DB4()
{
  type metadata accessor for FetchSafetyCacheResponse(0);
  sub_24558F614();
  sub_2455393C4(&qword_257484CC8, (uint64_t (*)(uint64_t))MEMORY[0x24BE17930], MEMORY[0x24BE17920]);
  return sub_24558F68C();
}

uint64_t sub_245538E48()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  if (!*v0 || (sub_245539E60(), result = sub_24558F6C8(), !v1))
  {
    result = sub_245538F20((uint64_t)v0);
    if (!v1)
    {
      type metadata accessor for FetchSafetyCacheResponse(0);
      return sub_24558F620();
    }
  }
  return result;
}

uint64_t sub_245538F20(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t SafetyCacheResponse;
  _QWORD v11[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484B40);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24558F614();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  sub_2455345A4(a1 + *(int *)(SafetyCacheResponse + 24), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_24552647C((uint64_t)v4, &qword_257484B40);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  sub_2455393C4(&qword_257484CC8, (uint64_t (*)(uint64_t))MEMORY[0x24BE17930], MEMORY[0x24BE17920]);
  sub_24558F6E0();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_245539090@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  sub_24558F62C();
  v4 = a2 + *(int *)(a1 + 24);
  v5 = sub_24558F614();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
}

unint64_t sub_2455390F0()
{
  return 0xD000000000000018;
}

uint64_t sub_24553910C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_24558F638();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_24553914C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 20);
  v5 = sub_24558F638();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t sub_24553918C()
{
  return sub_245538CDC();
}

uint64_t sub_2455391A0()
{
  return sub_245538E48();
}

uint64_t sub_2455391B4()
{
  sub_2455393C4(&qword_257484CB8, type metadata accessor for FetchSafetyCacheResponse, (uint64_t)&unk_245594B24);
  return sub_24558F650();
}

uint64_t sub_245539204@<X0>(uint64_t a1@<X8>)
{
  return sub_2455381A0(&qword_257484750, (uint64_t)qword_257487298, a1);
}

uint64_t sub_245539220()
{
  sub_2455393C4(&qword_257484C08, type metadata accessor for FetchSafetyCacheResponse, (uint64_t)&unk_245594B5C);
  return sub_24558F6A4();
}

uint64_t sub_245539260()
{
  sub_24558F9E0();
  sub_24558F740();
  return sub_24558F9EC();
}

uint64_t sub_2455392B4()
{
  sub_2455393C4(&qword_257484C08, type metadata accessor for FetchSafetyCacheResponse, (uint64_t)&unk_245594B5C);
  return sub_24558F6B0();
}

uint64_t sub_245539304()
{
  sub_24558F9E0();
  sub_24558F740();
  return sub_24558F9EC();
}

uint64_t sub_245539358()
{
  return sub_2455393C4(&qword_257484C00, type metadata accessor for FetchSafetyCacheResponse, (uint64_t)&unk_245594A6C);
}

uint64_t type metadata accessor for FetchSafetyCacheResponse(uint64_t a1)
{
  return sub_245539624(a1, (uint64_t *)&unk_257484EF0);
}

uint64_t sub_245539398()
{
  return sub_2455393C4(&qword_257484C08, type metadata accessor for FetchSafetyCacheResponse, (uint64_t)&unk_245594B5C);
}

uint64_t sub_2455393C4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249537C54](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_245539404()
{
  return sub_2455393C4(&qword_257484C10, type metadata accessor for FetchSafetyCacheResponse, (uint64_t)&unk_245594A94);
}

uint64_t sub_245539430()
{
  return sub_2455393C4(&qword_257484C18, type metadata accessor for FetchSafetyCacheResponse, (uint64_t)&unk_245594AD4);
}

uint64_t sub_24553945C()
{
  return sub_2455393C4(&qword_257484C20, type metadata accessor for FetchSafetyCacheRequest, (uint64_t)&unk_245594BD4);
}

uint64_t type metadata accessor for FetchSafetyCacheRequest(uint64_t a1)
{
  return sub_245539624(a1, qword_257484E58);
}

uint64_t sub_24553949C()
{
  return sub_2455393C4((unint64_t *)&qword_257484B48, type metadata accessor for FetchSafetyCacheRequest, (uint64_t)&unk_245594CC4);
}

uint64_t sub_2455394C8()
{
  return sub_2455393C4(&qword_257484C28, type metadata accessor for FetchSafetyCacheRequest, (uint64_t)&unk_245594BFC);
}

uint64_t sub_2455394F4()
{
  return sub_2455393C4(&qword_257484C30, type metadata accessor for FetchSafetyCacheRequest, (uint64_t)&unk_245594C3C);
}

uint64_t sub_245539520()
{
  return sub_2455393C4(&qword_257484C38, type metadata accessor for HelloResponse, (uint64_t)&unk_245594D3C);
}

uint64_t type metadata accessor for HelloResponse(uint64_t a1)
{
  return sub_245539624(a1, qword_257484DC8);
}

uint64_t sub_245539560()
{
  return sub_2455393C4(&qword_257484C40, type metadata accessor for HelloResponse, (uint64_t)&unk_245594E2C);
}

uint64_t sub_24553958C()
{
  return sub_2455393C4(&qword_257484C48, type metadata accessor for HelloResponse, (uint64_t)&unk_245594D64);
}

uint64_t sub_2455395B8()
{
  return sub_2455393C4(&qword_257484C50, type metadata accessor for HelloResponse, (uint64_t)&unk_245594DA4);
}

uint64_t sub_2455395E4()
{
  return sub_2455393C4(&qword_257484C58, type metadata accessor for HelloRequest, (uint64_t)&unk_245594EA4);
}

uint64_t type metadata accessor for HelloRequest(uint64_t a1)
{
  return sub_245539624(a1, qword_257484D38);
}

uint64_t sub_245539624(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_245539658()
{
  return sub_2455393C4(&qword_257484C60, type metadata accessor for HelloRequest, (uint64_t)&unk_245594F94);
}

uint64_t sub_245539684()
{
  return sub_2455393C4(&qword_257484C68, type metadata accessor for HelloRequest, (uint64_t)&unk_245594ECC);
}

uint64_t sub_2455396B0()
{
  return sub_2455393C4(&qword_257484C70, type metadata accessor for HelloRequest, (uint64_t)&unk_245594F0C);
}

unint64_t sub_2455396E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257484C78;
  if (!qword_257484C78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257484C80);
    result = MEMORY[0x249537C54](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_257484C78);
  }
  return result;
}

uint64_t sub_24553972C(_QWORD *a1, char *a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  BOOL v13;
  char v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  void (*v18)(char *, uint64_t);
  uint64_t v20;

  v6 = sub_24558F638();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v20 - v11;
  v13 = *a1 == *(_QWORD *)a2 && a1[1] == *((_QWORD *)a2 + 1);
  if (v13 || (v14 = 0, (sub_24558F9B0() & 1) != 0))
  {
    v15 = a3(0);
    v16 = (char *)a1 + *(int *)(v15 + 20);
    v17 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v17(v12, v16, v6);
    v17(v10, &a2[*(int *)(v15 + 20)], v6);
    sub_2455393C4(&qword_257484CA0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    v14 = sub_24558F74C();
    v18 = *(void (**)(char *, uint64_t))(v7 + 8);
    v18(v10, v6);
    v18(v12, v6);
  }
  return v14 & 1;
}

uint64_t sub_245539870(char *a1, uint64_t *a2)
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t SafetyCacheResponse;
  uint64_t v25;
  unsigned int (*v26)(uint64_t, uint64_t, uint64_t);
  char v27;
  char *v29;
  char v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  char *v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;

  v4 = sub_24558F638();
  v46 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v45 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v44 = (char *)&v40 - v7;
  v8 = sub_24558F614();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484CD0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484B40);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v40 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v40 - v21;
  v47 = a1;
  v23 = *a2;
  if (*((_BYTE *)a2 + 8) == 1)
    __asm { BR              X11 }
  if (*(_QWORD *)a1 != v23)
    goto LABEL_10;
  v42 = v4;
  SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  sub_2455345A4((uint64_t)&v47[*(int *)(SafetyCacheResponse + 24)], (uint64_t)v22);
  sub_2455345A4((uint64_t)a2 + *(int *)(SafetyCacheResponse + 24), (uint64_t)v20);
  v25 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_2455345A4((uint64_t)v22, (uint64_t)v13);
  sub_2455345A4((uint64_t)v20, v25);
  v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v26((uint64_t)v13, 1, v8) == 1)
  {
    v41 = SafetyCacheResponse;
    sub_24552647C((uint64_t)v20, &qword_257484B40);
    sub_24552647C((uint64_t)v22, &qword_257484B40);
    if (v26(v25, 1, v8) == 1)
    {
      sub_24552647C((uint64_t)v13, &qword_257484B40);
LABEL_13:
      v32 = v41;
      v33 = v42;
      v34 = v46;
      v35 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
      v36 = v44;
      v35(v44, &v47[*(int *)(v41 + 20)], v42);
      v37 = (char *)a2 + *(int *)(v32 + 20);
      v38 = v45;
      v35(v45, v37, v33);
      sub_2455393C4(&qword_257484CA0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v27 = sub_24558F74C();
      v39 = *(void (**)(char *, uint64_t))(v34 + 8);
      v39(v38, v33);
      v39(v36, v33);
      return v27 & 1;
    }
    goto LABEL_9;
  }
  sub_2455345A4((uint64_t)v13, (uint64_t)v17);
  if (v26(v25, 1, v8) == 1)
  {
    sub_24552647C((uint64_t)v20, &qword_257484B40);
    sub_24552647C((uint64_t)v22, &qword_257484B40);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
LABEL_9:
    sub_24552647C((uint64_t)v13, &qword_257484CD0);
    goto LABEL_10;
  }
  v41 = SafetyCacheResponse;
  v29 = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v43, v25, v8);
  sub_2455393C4(qword_257484CD8, (uint64_t (*)(uint64_t))MEMORY[0x24BE17930], MEMORY[0x24BE17940]);
  v30 = sub_24558F74C();
  v31 = *(void (**)(char *, uint64_t))(v9 + 8);
  v31(v29, v8);
  sub_24552647C((uint64_t)v20, &qword_257484B40);
  sub_24552647C((uint64_t)v22, &qword_257484B40);
  v31(v17, v8);
  sub_24552647C((uint64_t)v13, &qword_257484B40);
  if ((v30 & 1) != 0)
    goto LABEL_13;
LABEL_10:
  v27 = 0;
  return v27 & 1;
}

uint64_t sub_245539CFC(_QWORD *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  char v12;
  BOOL v13;
  uint64_t SafetyCacheRequest;
  char *v15;
  void (*v16)(char *, char *, uint64_t);
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = sub_24558F638();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - v9;
  v11 = *a1 == *(_QWORD *)a2 && a1[1] == *((_QWORD *)a2 + 1);
  if (v11 || (v12 = 0, (sub_24558F9B0() & 1) != 0))
  {
    v13 = a1[2] == *((_QWORD *)a2 + 2) && a1[3] == *((_QWORD *)a2 + 3);
    if (v13 || (v12 = 0, (sub_24558F9B0() & 1) != 0))
    {
      SafetyCacheRequest = type metadata accessor for FetchSafetyCacheRequest(0);
      v15 = (char *)a1 + *(int *)(SafetyCacheRequest + 24);
      v16 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v16(v10, v15, v4);
      v16(v8, &a2[*(int *)(SafetyCacheRequest + 24)], v4);
      sub_2455393C4(&qword_257484CA0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      v12 = sub_24558F74C();
      v17 = *(void (**)(char *, uint64_t))(v5 + 8);
      v17(v8, v4);
      v17(v10, v4);
    }
  }
  return v12 & 1;
}

unint64_t sub_245539E60()
{
  unint64_t result;

  result = qword_257484CC0;
  if (!qword_257484CC0)
  {
    result = MEMORY[0x249537C54](&unk_2455951C0, &type metadata for FetchSafetyCacheResponseCode);
    atomic_store(result, (unint64_t *)&qword_257484CC0);
  }
  return result;
}

ValueMetadata *type metadata accessor for FetchSafetyCacheResponseCode()
{
  return &type metadata for FetchSafetyCacheResponseCode;
}

uint64_t sub_245539ECC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245539EDC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *sub_245539EF0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_24558F638();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_245539F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_24558F638();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_245539FD4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_24558F638();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_24553A044(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_24558F638();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_24553A0C0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_24558F638();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_24553A11C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_24558F638();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24553A188()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_24558F638();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_24553A214()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_24558F638();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_24553A298()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24558F638();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24553A30C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_24558F638();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_24553A3C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_24558F638();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_24553A410(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_24558F638();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

_QWORD *sub_24553A498(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_24558F638();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_24553A534(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_24558F638();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *sub_24553A590(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_24558F638();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_24553A60C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24553A618(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_24558F638();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_24553A694()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24553A6A0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_24558F638();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_24553A714()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24558F638();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_24553A788(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v7 = *(int *)(a3 + 20);
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    v10 = sub_24558F638();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = *(int *)(a3 + 24);
    v12 = (char *)v4 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_24558F614();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484B40);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  return v4;
}

uint64_t sub_24553A8AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_24558F638();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 24);
  v7 = sub_24558F614();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

uint64_t sub_24553A944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(int *)(a3 + 20);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_24558F638();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (void *)(a1 + v10);
  v12 = (const void *)(a2 + v10);
  v13 = sub_24558F614();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484B40);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 16))(v11, v12, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  return a1;
}

uint64_t sub_24553AA3C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void *, uint64_t, uint64_t);
  int v17;
  uint64_t v18;

  v6 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v6;
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (uint64_t)a2 + v7;
  v10 = sub_24558F638();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (void *)(a1 + v11);
  v13 = (char *)a2 + v11;
  v14 = sub_24558F614();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v9) = v16(v12, 1, v14);
  v17 = v16(v13, 1, v14);
  if (!(_DWORD)v9)
  {
    if (!v17)
    {
      (*(void (**)(void *, char *, uint64_t))(v15 + 24))(v12, v13, v14);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v12, v14);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484B40);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

uint64_t sub_24553AB80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(int *)(a3 + 20);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_24558F638();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (void *)(a1 + v10);
  v12 = (const void *)(a2 + v10);
  v13 = sub_24558F614();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484B40);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v14 + 32))(v11, v12, v13);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  return a1;
}

uint64_t sub_24553AC78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  uint64_t v17;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(int *)(a3 + 20);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_24558F638();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (void *)(a1 + v10);
  v12 = (void *)(a2 + v10);
  v13 = sub_24558F614();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v8) = v15(v11, 1, v13);
  v16 = v15(v12, 1, v13);
  if (!(_DWORD)v8)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484B40);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t sub_24553ADBC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24553ADC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_24558F638();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(int *)(a3 + 20);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484B40);
    v7 = *(_QWORD *)(v8 - 8);
    v9 = *(int *)(a3 + 24);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
}

uint64_t sub_24553AE3C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24553AE48(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = sub_24558F638();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(int *)(a4 + 20);
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484B40);
    v9 = *(_QWORD *)(v10 - 8);
    v11 = *(int *)(a4 + 24);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
}

void sub_24553AEC4()
{
  unint64_t v0;
  unint64_t v1;

  sub_24558F638();
  if (v0 <= 0x3F)
  {
    sub_24553AF54();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_24553AF54()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257484F00)
  {
    sub_24558F614();
    v0 = sub_24558F908();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257484F00);
  }
}

unint64_t sub_24553AFAC()
{
  unint64_t result;

  result = qword_257484F38;
  if (!qword_257484F38)
  {
    result = MEMORY[0x249537C54](&unk_245595120, &type metadata for FetchSafetyCacheResponseCode);
    atomic_store(result, (unint64_t *)&qword_257484F38);
  }
  return result;
}

unint64_t sub_24553AFF4()
{
  unint64_t result;

  result = qword_257484F40;
  if (!qword_257484F40)
  {
    result = MEMORY[0x249537C54](&unk_245595148, &type metadata for FetchSafetyCacheResponseCode);
    atomic_store(result, (unint64_t *)&qword_257484F40);
  }
  return result;
}

unint64_t sub_24553B03C()
{
  unint64_t result;

  result = qword_257484F48;
  if (!qword_257484F48)
  {
    result = MEMORY[0x249537C54](&unk_245595188, &type metadata for FetchSafetyCacheResponseCode);
    atomic_store(result, &qword_257484F48);
  }
  return result;
}

ValueMetadata *type metadata accessor for SafetyMonitorServerClient()
{
  return &type metadata for SafetyMonitorServerClient;
}

uint64_t sub_24553B0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484F58);
  v3[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24553B108()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t SafetyCacheRequest;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = v0[4];
  v1 = v0[5];
  sub_24553B330(v0[3], v1);
  SafetyCacheRequest = type metadata accessor for FetchSafetyCacheRequest(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(SafetyCacheRequest - 8) + 56))(v1, 0, 1, SafetyCacheRequest);
  v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_257484F60));
  v5 = sub_24558F5FC();
  v0[6] = v5;
  v6 = swift_task_alloc();
  v0[7] = v6;
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v2;
  v7 = swift_task_alloc();
  v0[8] = v7;
  *(_QWORD *)(v7 + 16) = v5;
  v8 = (_QWORD *)swift_task_alloc();
  v0[9] = (uint64_t)v8;
  type metadata accessor for FetchSafetyCacheResponse(0);
  *v8 = v0;
  v8[1] = sub_24553B228;
  return sub_24558F9BC();
}

uint64_t sub_24553B228()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_24553B29C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24553B2D8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24553B330(uint64_t a1, uint64_t a2)
{
  uint64_t SafetyCacheRequest;

  SafetyCacheRequest = type metadata accessor for FetchSafetyCacheRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(SafetyCacheRequest - 8) + 16))(a2, a1, SafetyCacheRequest);
  return a2;
}

uint64_t sub_24553B374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_24553B390()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  type metadata accessor for FetchSafetyCacheResponse(0);
  *v2 = v0;
  v2[1] = sub_24553B430;
  return sub_24558F9C8();
}

uint64_t sub_24553B430()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24553B4A4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24553B4D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_245526368;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_24553B540(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484F78);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_24558F5F0();
  return sub_24558F8B4();
}

uint64_t sub_24553B624(uint64_t a1)
{
  uint64_t SafetyCacheResponse;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD v9[2];

  SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  MEMORY[0x24BDAC7A8](SafetyCacheResponse);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484F80);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (_QWORD *)((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24553B7F0(a1, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9[1] = *v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257484F78);
    return sub_24558F884();
  }
  else
  {
    sub_24553B838((uint64_t)v7, (uint64_t)v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257484F78);
    return sub_24558F890();
  }
}

id sub_24553B734()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_cancel);
}

uint64_t sub_24553B744(uint64_t a1)
{
  return sub_24553B540(a1);
}

uint64_t sub_24553B74C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484F78);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_24553B7B0(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257484F78);
  return sub_24553B624(a1);
}

uint64_t sub_24553B7F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257484F80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24553B838(uint64_t a1, uint64_t a2)
{
  uint64_t SafetyCacheResponse;

  SafetyCacheResponse = type metadata accessor for FetchSafetyCacheResponse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(SafetyCacheResponse - 8) + 32))(a2, a1, SafetyCacheResponse);
  return a2;
}

void sub_24553B87C()
{
  void *v0;
  char v1;

  v0 = (void *)sub_24558F7AC();
  v1 = MGGetBoolAnswer();

  byte_2574872B0 = v1;
}

uint64_t sub_24553B8D0()
{
  uint64_t v0;
  _QWORD *v1;

  v1[11] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574849E0);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24553B968()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint8_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  id v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  uint64_t v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v1 = v0[13];
  sub_24558F434();
  v2 = sub_24558F4C4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  v5 = v4(v1, 1, v2);
  v6 = v0[13];
  if (v5 == 1)
  {
    sub_24552647C(v0[13], &qword_2574849E0);
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v7 = sub_24558F4A0();
    v8 = v9;
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  }
  if (qword_257484758 != -1)
    swift_once();
  if (byte_2574872B0 == 1)
  {
    if (byte_2574872B1 == 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      byte_2574872B1 = 1;
      v0[9] = 3;
      v17 = (const __CFString *)sub_24558F7AC();
      v18 = (__CFString *)sub_24558F7AC();
      v39 = (__CFString *)sub_24558F7AC();
      v40 = (__CFString *)v17;
      v38 = (__CFString *)sub_24558F7AC();
      CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v17, v18, v39, v38, 0, v0 + 9);
      if (v0[9])
      {
        v37 = v18;
        if (qword_257484760 != -1)
          swift_once();
        v19 = sub_24558F728();
        __swift_project_value_buffer(v19, (uint64_t)qword_2574872B8);
        swift_bridgeObjectRetain();
        v20 = sub_24558F710();
        v21 = sub_24558F8D8();
        v22 = v7;
        if (os_log_type_enabled(v20, v21))
        {
          v23 = (uint8_t *)swift_slowAlloc();
          v36 = swift_slowAlloc();
          *(_DWORD *)v23 = 136315138;
          v41[0] = v36;
          if (v8)
          {
            v24 = v8;
          }
          else
          {
            v22 = 0;
            v24 = 0xE000000000000000;
          }
          swift_bridgeObjectRetain();
          v25 = v22;
          v26 = qword_257486FF0 + 16;
          v0[10] = sub_245524F90(v25, v24, v41);
          sub_24558F914();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_245521000, v20, v21, "TTR Dismissed, radar info: %s", v23, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x249537CD8](v36, -1, -1);
          MEMORY[0x249537CD8](v23, -1, -1);

          v18 = v37;
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v18 = v37;
          v26 = qword_257486FF0 + 16;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        v27 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
        v26 = qword_257486FF0 + 16;
        if (v27)
        {
          v28 = v27;
          v29 = v18;
          v30 = v0[12];
          sub_24558F434();
          if (v4(v30, 1, v2) == 1)
          {
            v31 = 0;
          }
          else
          {
            v32 = v0[12];
            v31 = (void *)sub_24558F4AC();
            (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v32, v2);
          }
          v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC15A0]), sel_init);
          v0[6] = sub_24553C014;
          v0[7] = 0;
          v0[2] = MEMORY[0x24BDAC760];
          v0[3] = 1107296256;
          v0[4] = sub_24553C1D8;
          v0[5] = &block_descriptor_0;
          v34 = _Block_copy(v0 + 2);
          objc_msgSend(v28, sel_openURL_configuration_completionHandler_, v31, v33, v34);
          _Block_release(v34);

          v26 = &qword_257486FF0[2];
          v18 = v29;
        }
      }
      *((_BYTE *)v26 + 689) = 0;

    }
  }
  else
  {
    if (qword_257484760 != -1)
      swift_once();
    v10 = sub_24558F728();
    __swift_project_value_buffer(v10, (uint64_t)qword_2574872B8);
    swift_bridgeObjectRetain();
    v11 = sub_24558F710();
    v12 = sub_24558F8C0();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v41[0] = v14;
      *(_DWORD *)v13 = 67109378;
      *((_DWORD *)v0 + 28) = byte_2574872B0;
      sub_24558F914();
      *(_WORD *)(v13 + 8) = 2080;
      if (v8)
        v15 = v7;
      else
        v15 = 0;
      if (v8)
        v16 = v8;
      else
        v16 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      v0[8] = sub_245524F90(v15, v16, v41);
      sub_24558F914();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_245521000, v11, v12, "TTR isInternal:%{BOOL}d, radar info:%s", (uint8_t *)v13, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x249537CD8](v14, -1, -1);
      MEMORY[0x249537CD8](v13, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

  }
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

void sub_24553C014(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  NSObject *oslog;
  uint64_t v11;

  if (a2)
  {
    if (qword_257484760 != -1)
      swift_once();
    v3 = sub_24558F728();
    __swift_project_value_buffer(v3, (uint64_t)qword_2574872B8);
    v4 = a2;
    v5 = a2;
    oslog = sub_24558F710();
    v6 = sub_24558F8D8();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v9 = a2;
      v11 = _swift_stdlib_bridgeErrorToNSError();
      sub_24558F914();
      *v8 = v11;

      _os_log_impl(&dword_245521000, oslog, v6, "TTR Error filing radar: %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257484B50);
      swift_arrayDestroy();
      MEMORY[0x249537CD8](v8, -1, -1);
      MEMORY[0x249537CD8](v7, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_24553C1D8(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_24558F734();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t static SMTapToRadarManagerInternal.fileRadar(withError:conversationIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_257484FA0 + dword_257484FA0);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_24553D884;
  return v9(a1, a2, a3);
}

uint64_t sub_24553C418(void *a1, uint64_t a2, void *aBlock)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t (*v11)(id, uint64_t, uint64_t);

  v3[2] = a1;
  v3[3] = _Block_copy(aBlock);
  if (a2)
  {
    a2 = sub_24558F7B8();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v3[4] = v7;
  v11 = (uint64_t (*)(id, uint64_t, uint64_t))((char *)&dword_257484FA0 + dword_257484FA0);
  v8 = a1;
  v9 = (_QWORD *)swift_task_alloc();
  v3[5] = v9;
  *v9 = v3;
  v9[1] = sub_24553C4CC;
  return v11(v8, a2, v7);
}

uint64_t sub_24553C4CC()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  uint64_t v4;

  v2 = *(void **)(*v0 + 16);
  v1 = *(void (***)(_QWORD))(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t static SMTapToRadarManagerInternal.fileRadar(withValidity:conversationIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v8)();
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;

  switch(a1)
  {
    case 0:
      v12 = (char *)&dword_257484FB0 + dword_257484FB0;
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v3 + 16) = v9;
      *v9 = v3;
      v9[1] = sub_245526368;
      v10 = 0x800000024559A990;
      v11 = 0xD00000000000002DLL;
      return ((uint64_t (*)(unint64_t, unint64_t, _QWORD, _QWORD, uint64_t, uint64_t))v12)(v11, v10, 0, 0, a2, a3);
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      return (*(uint64_t (**)(void))(v3 + 8))();
    case 2:
      v12 = (char *)&dword_257484FB0 + dword_257484FB0;
      v7 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v3 + 24) = v7;
      v8 = sub_24553C684;
      goto LABEL_6;
    default:
      v12 = (char *)&dword_257484FB0 + dword_257484FB0;
      v7 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v3 + 32) = v7;
      v8 = sub_24553C6CC;
LABEL_6:
      *v7 = v3;
      v7[1] = v8;
      v10 = 0x800000024559A960;
      v11 = 0xD000000000000029;
      return ((uint64_t (*)(unint64_t, unint64_t, _QWORD, _QWORD, uint64_t, uint64_t))v12)(v11, v10, 0, 0, a2, a3);
  }
}

uint64_t sub_24553C684()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24553C6CC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t static SMTapToRadarManagerInternal.fileRadar(withTitle:description:conversationIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_257484FB0
                                                                                     + dword_257484FB0);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_24553D884;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_24553C8F8(uint64_t a1, uint64_t a2, uint64_t a3, void *aBlock)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v4[2] = _Block_copy(aBlock);
  if (a1)
  {
    a1 = sub_24558F7B8();
    v9 = v8;
    v4[3] = v8;
    if (a2)
      goto LABEL_3;
LABEL_6:
    v11 = 0;
    v4[4] = 0;
    if (a3)
      goto LABEL_4;
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v9 = 0;
  v4[3] = 0;
  if (!a2)
    goto LABEL_6;
LABEL_3:
  a2 = sub_24558F7B8();
  v11 = v10;
  v4[4] = v10;
  if (!a3)
    goto LABEL_7;
LABEL_4:
  a3 = sub_24558F7B8();
  v13 = v12;
LABEL_8:
  v4[5] = v13;
  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_257484FB0
                                                                                     + dword_257484FB0);
  v14 = (_QWORD *)swift_task_alloc();
  v4[6] = v14;
  *v14 = v4;
  v14[1] = sub_24553C9FC;
  return v16(a1, v9, a2, v11, a3, v13);
}

uint64_t sub_24553C9FC()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  uint64_t v3;

  v1 = *(void (***)(_QWORD))(*v0 + 16);
  v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

id SMTapToRadarManagerInternal.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SMTapToRadarManagerInternal.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SMTapToRadarManagerInternal.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SMTapToRadarManagerInternal();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24553CB68()
{
  uint64_t v0;

  v0 = sub_24558F728();
  __swift_allocate_value_buffer(v0, qword_2574872B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2574872B8);
  swift_bridgeObjectRetain();
  return sub_24558F71C();
}

uint64_t sub_24553CBE4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_24553D884;
  return v6();
}

uint64_t sub_24553CC38(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_24553D884;
  return v7();
}

uint64_t sub_24553CC8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_24558F8A8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24558F89C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_24552647C(a1, &qword_254415868);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24558F878();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24553CDD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[8] = a5;
  v6[9] = a6;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  v7 = sub_24558F464();
  v6[10] = v7;
  v6[11] = *(_QWORD *)(v7 - 8);
  v6[12] = swift_task_alloc();
  v6[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24553CE50()
{
  objc_super *v0;
  Class super_class;
  void (*v2)(id, Class, id);
  objc_class *v3;
  char *v4;
  objc_class *v5;
  _QWORD *v6;
  Class v8;
  id receiver;
  id v10;

  super_class = v0[6].super_class;
  receiver = v0[5].receiver;
  v10 = v0[6].receiver;
  v8 = v0[5].super_class;
  sub_24558F458();
  sub_24558F44C();
  sub_24558F440();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257485060);
  sub_24558F41C();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_245594A50;
  sub_24558F410();
  sub_24558F410();
  sub_24558F410();
  sub_24558F410();
  sub_24558F410();
  sub_24558F410();
  swift_bridgeObjectRetain();
  sub_24558F410();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24558F410();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24558F410();
  swift_bridgeObjectRelease();
  sub_24558F428();
  v2 = (void (*)(id, Class, id))*((_QWORD *)v8 + 2);
  v2(v10, super_class, receiver);
  v3 = (objc_class *)type metadata accessor for SMTapToRadarManagerInternal();
  v4 = (char *)objc_allocWithZone(v3);
  v2(&v4[OBJC_IVAR____TtC13SafetyMonitor27SMTapToRadarManagerInternal_urlComponents], (Class)v10, receiver);
  v0[1].receiver = v4;
  v0[1].super_class = v3;
  v0[7].receiver = objc_msgSendSuper2(v0 + 1, sel_init);
  v5 = (objc_class *)*((_QWORD *)v8 + 1);
  v0[7].super_class = v5;
  ((void (*)(id, id))v5)(v10, receiver);
  v6 = (_QWORD *)swift_task_alloc();
  v0[8].receiver = v6;
  *v6 = v0;
  v6[1] = sub_24553D274;
  return sub_24553B8D0();
}

uint64_t sub_24553D274()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24553D2C8()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 80);

  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24553D324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  return swift_task_switch();
}

uint64_t sub_24553D340()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = v0[5];
  sub_24558F938();
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  sub_24558F7F4();
  v0[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257485068);
  sub_24558F974();
  v2 = v0[2];
  v3 = v0[3];
  v0[8] = v3;
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_257484FB0
                                                                                    + dword_257484FB0);
  v4 = (_QWORD *)swift_task_alloc();
  v0[9] = v4;
  *v4 = v0;
  v4[1] = sub_24553D438;
  return v6(v2, v3, 0, 0, v0[6], v0[7]);
}

uint64_t sub_24553D438()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t type metadata accessor for SMTapToRadarManagerInternal()
{
  uint64_t result;

  result = qword_257484FE8;
  if (!qword_257484FE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24553D4C4()
{
  return type metadata accessor for SMTapToRadarManagerInternal();
}

uint64_t sub_24553D4CC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24558F464();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
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

uint64_t sub_24553D550()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_24553D58C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_24553D884;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))((char *)&dword_257485000 + dword_257485000))(v2, v3, v4, v5);
}

uint64_t sub_24553D610()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_24553D884;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_257485010 + dword_257485010))(v2, v3, v4);
}

uint64_t sub_24553D68C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_24553D884;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_257485020 + dword_257485020))(a1, v4, v5, v6);
}

uint64_t sub_24553D710()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24553D734(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245526368;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257485030 + dword_257485030))(a1, v4);
}

uint64_t sub_24553D7A4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_24553D7D8()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_24553D884;
  return ((uint64_t (*)(void *, uint64_t, void *))((char *)&dword_257485040 + dword_257485040))(v2, v3, v4);
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_245542ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  _Block_object_dispose(&a54, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_2455436D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t getIMChatCanonicalIDSIDsForAddressSymbolLoc()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = qword_254415CB8;
  v6 = qword_254415CB8;
  if (!qword_254415CB8)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __getIMChatCanonicalIDSIDsForAddressSymbolLoc_block_invoke;
    v2[3] = &unk_25166D8E8;
    v2[4] = &v3;
    __getIMChatCanonicalIDSIDsForAddressSymbolLoc_block_invoke((uint64_t)v2);
    v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_245545314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getIMChatCanonicalIDSIDsForAddressSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (_MergedGlobals_12)
  {
    v2 = (void *)_MergedGlobals_12;
  }
  else
  {
    _MergedGlobals_12 = _sl_dlopen();
    v2 = (void *)_MergedGlobals_12;
    if (!_MergedGlobals_12)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "IMChatCanonicalIDSIDsForAddress");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_254415CB8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void log_analytics_submission(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n=== BEGIN analytics submission for event %@ ===\n"), v3);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("%@ : %@\n"), v12, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "appendFormat:", CFSTR("=== END analytics submission for event %@ ===\n"), v3);
  _rt_log_facility_get_os_log(RTLogFacilityMetric);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_245521000, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

}

uint64_t __log_analytics_submission_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void sub_2455457E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2455458DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_245549970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_24555015C()
{
  void *v0;

  return 0;
}

void sub_24555400C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_245555CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_245556590(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  _Unwind_Resume(exception_object);
}

double RTCommonIsCoordinateValid(double a1, double a2)
{
  double v2;

  v2 = 1.0;
  if (a2 < -180.0)
    v2 = 0.0;
  if (a2 > 180.0 || a1 < -90.0 || a1 > 90.0)
    return 0.0;
  else
    return v2;
}

BOOL RTCommonConvertGeodeticToLocalFrame(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v9;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __double2 v22;
  double v23;

  v9 = vabdd_f64(a4, a7);
  if (v9 <= 2.0)
  {
    v16 = (a4 + a7) * 0.5 * 0.0174532925;
    v17 = (a7 - a4) * 0.0174532925;
    v18 = 360.0;
    if (a5 < 0.0)
      a5 = a5 + 360.0;
    v19 = a8 + 360.0;
    if (a8 >= 0.0)
      v19 = a8;
    v20 = v19 - a5;
    if (v20 <= 180.0)
    {
      if (v20 >= -180.0)
      {
LABEL_10:
        v21 = v20 * 0.0174532925;
        v22 = __sincos_stret(v16);
        v23 = sqrt(v22.__sinval * -0.00669437999 * v22.__sinval + 1.0);
        *a1 = v17 * (6335439.33 / (v23 * (v23 * v23)) + a6);
        *a2 = v22.__cosval * (6378137.0 / v23 + a6) * v21;
        *a3 = a9 - a6;
        return v9 <= 2.0;
      }
    }
    else
    {
      v18 = -360.0;
    }
    v20 = v20 + v18;
    goto LABEL_10;
  }
  return v9 <= 2.0;
}

BOOL RTCommonConvertLocalFrameToGeodetic(double *a1, double *a2, double a3, double a4, double a5, double a6, double a7)
{
  _BOOL8 v8;
  __double2 v15;
  double v16;
  double v17;
  double v18;

  v8 = a3 >= -90.0 && a3 <= 90.0;
  if (v8)
  {
    v15 = __sincos_stret(a3 * 0.0174532925);
    v16 = sqrt(v15.__sinval * -0.00669437999 * v15.__sinval + 1.0);
    v17 = 6335439.33 / (v16 * (v16 * v16)) + a5;
    v18 = v15.__cosval * (6378137.0 / v16 + a5);
    if (v18 < 10.0)
      v18 = 10.0;
    *a1 = a3 + a6 / v17 * 57.2957795;
    *a2 = a4 + a7 / v18 * 57.2957795;
  }
  return v8;
}

double RTCommonRandomDouble(double a1, double a2)
{
  return a1 + (double)arc4random_uniform(0x7FFFFFFFu) / 2147483650.0 * (a2 - a1);
}

uint64_t RTCommonRandomInt(unsigned int a1)
{
  return arc4random_uniform(0x7FFFFFFFu) % a1;
}

BOOL RTCommonRandomFlip(double a1)
{
  NSObject *v3;
  int v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1 < 0.0 || a1 > 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = 134217984;
      v6 = a1;
      _os_log_error_impl(&dword_245521000, v3, OS_LOG_TYPE_ERROR, "RTCommonRandomFlip, invalid probability, %f, probability must be between 0 and 1", (uint8_t *)&v5, 0xCu);
    }

  }
  return (double)arc4random_uniform(0x7FFFFFFFu) / 2147483650.0 < a1;
}

BOOL RTCommonValidConfidence(double a1)
{
  return a1 <= 1.0 && a1 >= 0.0;
}

void RTCommonSafeLog(long double a1)
{
  log(a1);
}

uint64_t conversationHandlesValid(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "receiverHandles", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (!v6)
          goto LABEL_12;
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "primaryHandle");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!v7)
          goto LABEL_14;
        objc_msgSend(v6, "primaryHandle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = +[SMHandle getSMHandleTypeWithHandle:](SMHandle, "getSMHandleTypeWithHandle:", v8);

        if (!v9)
        {
LABEL_12:
          v7 = 0;
          goto LABEL_14;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = 1;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v7 = 1;
  }
LABEL_14:

  return v7;
}

void sub_245566F68(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t isEligibleForReceivingZelkova()
{
  NSObject *v0;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315394;
    v3 = "BOOL isEligibleForReceivingZelkova(void)";
    v4 = 1024;
    v5 = 1;
    _os_log_impl(&dword_245521000, v0, OS_LOG_TYPE_DEFAULT, "%s, isEligible, %d", (uint8_t *)&v2, 0x12u);
  }

  return 1;
}

const __CFString *initiatorEligiblityStatusToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xB)
    return CFSTR("Unknown");
  else
    return off_25166E278[a1 - 1];
}

id _SMSafeArray(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;
  id v11;
  id *v12;
  id *v14;

  v9 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id *)&a9;
  v11 = v9;
  if (!v9)
    goto LABEL_4;
  while (v11 != (id)1)
  {
    objc_msgSend(v10, "addObject:");
    do
    {
LABEL_4:
      v12 = v14++;
      v11 = *v12;
    }
    while (!*v12);
  }

  return v10;
}

id _SMMultiErrorCreate(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v19 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(v19, "flatten");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v1;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    v20 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      v21 = v4;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v23 = v6;
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v25;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v25 != v11)
                  objc_enumerationMutation(v8);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v13 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v35 = "NSError * _Nonnull _SMMultiErrorCreate(NSArray *__strong _Nonnull)";
                    v36 = 1024;
                    v37 = 49;
                    _os_log_error_impl(&dword_245521000, v13, OS_LOG_TYPE_ERROR, "All parameters must be NSError or nil. (in %s:%d)", buf, 0x12u);
                  }

                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v2, "addObject:", v8);
                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
            }
            while (v10);
          }

          v5 = v20;
          v4 = v21;
          v6 = v23;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v35 = "NSError * _Nonnull _SMMultiErrorCreate(NSArray *__strong _Nonnull)";
              v36 = 1024;
              v37 = 55;
              _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "All parameters must be NSError or nil. (in %s:%d)", buf, 0x12u);
            }

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v2, "addObject:", v7);
        }
        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v4);
  }

  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    objc_msgSend(v2, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v32[0] = *MEMORY[0x24BDD0FC8];
    v32[1] = CFSTR("SMDetailedErrorsKey");
    v33[0] = CFSTR("Multiple errors occurred.");
    v33[1] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("SMErrorDomain"), 9, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

uint64_t onDaemonStartNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleDaemonStart");
}

void sub_245578AE8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

id SMErrorConnectionCreate(const char *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a2;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v13 = (void *)MEMORY[0x24BDD1540];
  v20 = *MEMORY[0x24BDD0FC8];
  v14 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("connection failure while servicing %@, %@"), v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("SMErrorDomain"), 8, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void sub_24557A084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_24557A5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557AA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557AEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557B628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557BA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557BF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557C388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557C820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557CCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557D304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557E044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557EBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557F1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557F66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24557FC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2455801F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2455807A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24558253C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_245583120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_245587370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_245587880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_245587D5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_245588254(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2455888A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_245588DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24558A640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void _RTRequireInitializer(uint64_t a1, SEL aSelector)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(aSelector);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ requires the use of the initializer: %@"), a1, v4);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

id _RTErrorInvalidParameterCreate(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %@"), a1, *MEMORY[0x24BDD0FC8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE27EE8], 7, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _rt_log_facility_get_os_log(dispatch_once_t *predicate)
{
  if (*predicate != -1)
    dispatch_once_f(predicate, predicate, (dispatch_function_t)_rt_log_facility_prepare);
  return (id)predicate[2];
}

os_log_t _rt_log_facility_prepare(uint64_t a1)
{
  os_log_t result;

  result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_24558F3F8()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_24558F404()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_24558F410()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_24558F41C()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_24558F428()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_24558F434()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_24558F440()
{
  return MEMORY[0x24BDCBAD0]();
}

uint64_t sub_24558F44C()
{
  return MEMORY[0x24BDCBB28]();
}

uint64_t sub_24558F458()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t sub_24558F464()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_24558F470()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_24558F47C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24558F488()
{
  return MEMORY[0x24BDCD348]();
}

uint64_t sub_24558F494()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_24558F4A0()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_24558F4AC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_24558F4B8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_24558F4C4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24558F4D0()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_24558F4DC()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_24558F4E8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_24558F4F4()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_24558F500()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24558F50C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_24558F518()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_24558F524()
{
  return MEMORY[0x24BDB46D8]();
}

uint64_t sub_24558F530()
{
  return MEMORY[0x24BDB4728]();
}

uint64_t sub_24558F53C()
{
  return MEMORY[0x24BDB4760]();
}

uint64_t sub_24558F548()
{
  return MEMORY[0x24BDB4768]();
}

uint64_t sub_24558F554()
{
  return MEMORY[0x24BDB47C8]();
}

uint64_t sub_24558F560()
{
  return MEMORY[0x24BDB4830]();
}

uint64_t sub_24558F56C()
{
  return MEMORY[0x24BDB4838]();
}

uint64_t sub_24558F578()
{
  return MEMORY[0x24BDB4848]();
}

uint64_t sub_24558F584()
{
  return MEMORY[0x24BDB4858]();
}

uint64_t sub_24558F590()
{
  return MEMORY[0x24BDB4868]();
}

uint64_t sub_24558F59C()
{
  return MEMORY[0x24BDB4870]();
}

uint64_t sub_24558F5A8()
{
  return MEMORY[0x24BDB48F8]();
}

uint64_t sub_24558F5B4()
{
  return MEMORY[0x24BDB49E0]();
}

uint64_t sub_24558F5C0()
{
  return MEMORY[0x24BDB49E8]();
}

uint64_t sub_24558F5CC()
{
  return MEMORY[0x24BDB49F0]();
}

uint64_t sub_24558F5D8()
{
  return MEMORY[0x24BDB49F8]();
}

uint64_t sub_24558F5E4()
{
  return MEMORY[0x24BDB4A00]();
}

uint64_t sub_24558F5F0()
{
  return MEMORY[0x24BE17908]();
}

uint64_t sub_24558F5FC()
{
  return MEMORY[0x24BE17910]();
}

uint64_t sub_24558F608()
{
  return MEMORY[0x24BE17928]();
}

uint64_t sub_24558F614()
{
  return MEMORY[0x24BE17930]();
}

uint64_t sub_24558F620()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t sub_24558F62C()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_24558F638()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_24558F644()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_24558F650()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_24558F65C()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_24558F668()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_24558F674()
{
  return MEMORY[0x24BE5C078]();
}

uint64_t sub_24558F680()
{
  return MEMORY[0x24BE5C120]();
}

uint64_t sub_24558F68C()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_24558F698()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_24558F6A4()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_24558F6B0()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_24558F6BC()
{
  return MEMORY[0x24BE5C1F0]();
}

uint64_t sub_24558F6C8()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_24558F6D4()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_24558F6E0()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_24558F6EC()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_24558F6F8()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_24558F704()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_24558F710()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24558F71C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24558F728()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24558F734()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_24558F740()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_24558F74C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24558F758()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_24558F764()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_24558F770()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_24558F77C()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_24558F788()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_24558F794()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_24558F7A0()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_24558F7AC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24558F7B8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24558F7C4()
{
  return MEMORY[0x24BDCFB08]();
}

uint64_t sub_24558F7D0()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_24558F7DC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_24558F7E8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24558F7F4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24558F800()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24558F80C()
{
  return MEMORY[0x24BEE1020]();
}

uint64_t sub_24558F818()
{
  return MEMORY[0x24BEE10A0]();
}

uint64_t sub_24558F824()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24558F830()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_24558F83C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24558F848()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24558F854()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24558F860()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24558F86C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_24558F878()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_24558F884()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_24558F890()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_24558F89C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_24558F8A8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_24558F8B4()
{
  return MEMORY[0x24BE17948]();
}

uint64_t sub_24558F8C0()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24558F8CC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_24558F8D8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24558F8E4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24558F8F0()
{
  return MEMORY[0x24BE17950]();
}

uint64_t sub_24558F8FC()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_24558F908()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24558F914()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24558F920()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24558F92C()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_24558F938()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24558F944()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24558F950()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24558F95C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_24558F968()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24558F974()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24558F980()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24558F98C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24558F998()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24558F9A4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_24558F9B0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24558F9BC()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_24558F9C8()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_24558F9D4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_24558F9E0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24558F9EC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24558F9F8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24558FA04()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24558FA10()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC930](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x24BDBFA08]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x24BDBFA10](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t IMStringIsEmail()
{
  return MEMORY[0x24BE50800]();
}

uint64_t IMStringIsPhoneNumber()
{
  return MEMORY[0x24BE50808]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t TMGetReferenceTime()
{
  return MEMORY[0x24BE28998]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

