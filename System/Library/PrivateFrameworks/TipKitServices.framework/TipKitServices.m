uint64_t static DaemonUtilities.ingestContent(_:)()
{
  uint64_t v0;
  _QWORD *v1;

  sub_248AB3E54();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_248AB1004;
  return sub_248AB3E48();
}

uint64_t sub_248AB1004()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t static DaemonUtilities.updateDeviceProfile(_:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_248AB1064()
{
  uint64_t v0;

  sub_248AB3E18();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

ValueMetadata *type metadata accessor for DaemonUtilities()
{
  return &type metadata for DaemonUtilities;
}

void static TipConfiguration.bundleIdentifierOverride.getter()
{
  uint64_t v0;

  v0 = *(_QWORD *)(sub_248AB3E0C() - 8);
  MEMORY[0x24BDAC7A8]();
  sub_248AB3E00();
  sub_248AB3DDC();
  sub_248AB12E8(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_248AB12D8();
}

uint64_t static TipConfiguration.bundleIdentifierOverride.setter()
{
  uint64_t (*v0)(uint64_t *, _QWORD);
  uint64_t v2;

  v0 = (uint64_t (*)(uint64_t *, _QWORD))sub_248AB3DF4();
  sub_248AB3DE8();
  return v0(&v2, 0);
}

void static TipConfiguration.bundleIdentifierOverride.modify(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = malloc(0x58uLL);
  *a1 = v2;
  v3 = *(_QWORD *)(sub_248AB3E0C() - 8);
  v2[10] = malloc(*(_QWORD *)(v3 + 64));
  sub_248AB3E00();
  v4 = sub_248AB3DDC();
  v6 = v5;
  sub_248AB12E8(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  v2[8] = v4;
  v2[9] = v6;
  sub_248AB12D8();
}

void sub_248AB1214(char **a1, char a2)
{
  char *v2;
  void *v3;
  void (*v4)(char *, _QWORD);
  void (*v5)(char *, _QWORD);

  v2 = *a1;
  v3 = (void *)*((_QWORD *)*a1 + 10);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v4 = (void (*)(char *, _QWORD))sub_248AB3DF4();
    sub_248AB12C4();
    v4(v2, 0);
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = (void (*)(char *, _QWORD))sub_248AB3DF4();
    sub_248AB12C4();
    v5(v2 + 32, 0);
  }
  free(v3);
  free(v2);
}

ValueMetadata *type metadata accessor for TipConfiguration()
{
  return &type metadata for TipConfiguration;
}

uint64_t sub_248AB12C4()
{
  return sub_248AB3DE8();
}

uint64_t sub_248AB12E8@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t static TipEventProxy.donate(eventIdentifier:for:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_248AB1314()
{
  _QWORD *v0;
  unint64_t v1;
  _QWORD *v2;

  v1 = v0[6];
  if (v1)
    v1 = sub_248AB151C(v1);
  v0[7] = v1;
  sub_248AB3E3C();
  v2 = (_QWORD *)swift_task_alloc();
  v0[8] = v2;
  *v2 = v0;
  v2[1] = sub_248AB1380;
  return sub_248AB3E30();
}

uint64_t sub_248AB1380(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;

  v3 = (_QWORD *)*v2;
  v3[9] = a1;
  v3[10] = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  sub_248AB3D94();
  v5 = (_QWORD *)swift_task_alloc();
  v3[11] = v5;
  *v5 = v3;
  v5[1] = sub_248AB1438;
  return sub_248AB3D88();
}

uint64_t sub_248AB1438()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_248AB14BC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return sub_248AB1A1C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_248AB14E8()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return sub_248AB1A1C(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_248AB151C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  __int128 *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t result;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  __int128 *v26;
  _QWORD *v27;
  uint64_t *v28;
  _OWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  _OWORD v38[3];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _OWORD v43[2];
  _QWORD __dst[9];
  _QWORD __src[10];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    sub_248AB1938(&qword_2577B08D8);
    v2 = (_QWORD *)sub_248AB3F68();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v35 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v34 = (unint64_t)(63 - v3) >> 6;
  v6 = &__src[2];
  v7 = (__int128 *)&__dst[2];
  v8 = &v41;
  v9 = &v42;
  result = swift_bridgeObjectRetain();
  v36 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v37 = (v5 - 1) & v5;
        v11 = __clz(__rbit64(v5)) | (v36 << 6);
      }
      else
      {
        v12 = v36 + 1;
        if (__OFADD__(v36, 1))
          goto LABEL_34;
        if (v12 >= v34)
        {
LABEL_31:
          sub_248AB1A14();
          return (unint64_t)v2;
        }
        v13 = *(_QWORD *)(v35 + 8 * v12);
        v14 = v36 + 1;
        if (!v13)
        {
          v14 = v36 + 2;
          if (v36 + 2 >= v34)
            goto LABEL_31;
          v13 = *(_QWORD *)(v35 + 8 * v14);
          if (!v13)
          {
            v14 = v36 + 3;
            if (v36 + 3 >= v34)
              goto LABEL_31;
            v13 = *(_QWORD *)(v35 + 8 * v14);
            if (!v13)
            {
              v14 = v36 + 4;
              if (v36 + 4 >= v34)
                goto LABEL_31;
              v13 = *(_QWORD *)(v35 + 8 * v14);
              if (!v13)
              {
                v15 = v36 + 5;
                if (v36 + 5 >= v34)
                  goto LABEL_31;
                v13 = *(_QWORD *)(v35 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      goto LABEL_35;
                    if (v14 >= v34)
                      goto LABEL_31;
                    v13 = *(_QWORD *)(v35 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_25;
                  }
                }
                v14 = v36 + 5;
              }
            }
          }
        }
LABEL_25:
        v36 = v14;
        v37 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
      }
      v16 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      sub_248AB1978(*(_QWORD *)(v1 + 56) + 56 * v11, (uint64_t)v6);
      __src[0] = v18;
      __src[1] = v17;
      memcpy(__dst, __src, sizeof(__dst));
      v39 = __dst[0];
      v40 = __dst[1];
      sub_248AB19C4(v7, (uint64_t)v38);
      swift_bridgeObjectRetain();
      sub_248AB1938(&qword_2577B08E0);
      sub_248AB1938(&qword_2577B08E8);
      swift_dynamicCast();
      v19 = v39;
      v20 = v40;
      sub_248AB19E4(v8, v9);
      sub_248AB19E4(v9, v43);
      sub_248AB19E4(v43, v38);
      result = sub_248AB3298(v19, v20);
      v21 = result;
      if ((v22 & 1) == 0)
        break;
      v23 = v9;
      v24 = v8;
      v25 = v1;
      v26 = v7;
      v27 = v6;
      v28 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v28 = v19;
      v28[1] = v20;
      v6 = v27;
      v7 = v26;
      v1 = v25;
      v8 = v24;
      v9 = v23;
      v29 = (_OWORD *)(v2[7] + 32 * v21);
      sub_248AB19F4((uint64_t)v29);
      result = (unint64_t)sub_248AB19E4(v38, v29);
      v5 = v37;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v30 = (uint64_t *)(v2[6] + 16 * result);
    *v30 = v19;
    v30[1] = v20;
    result = (unint64_t)sub_248AB19E4(v38, (_OWORD *)(v2[7] + 32 * result));
    v31 = v2[2];
    v32 = __OFADD__(v31, 1);
    v33 = v31 + 1;
    if (v32)
      goto LABEL_33;
    v2[2] = v33;
    v5 = v37;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t TipEventProxy.deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return v0;
}

uint64_t TipEventProxy.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t TipEventProxy.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_248AB18F4()
{
  return TipEventProxy.unownedExecutor.getter();
}

uint64_t type metadata accessor for TipEventProxy()
{
  return objc_opt_self();
}

uint64_t method lookup function for TipEventProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_248AB1938(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495A434C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_248AB1978(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  v4 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_QWORD *)(a2 + 48) = v4;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_248AB19C4(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  *(_QWORD *)(a2 + 48) = *((_QWORD *)a1 + 6);
  *(_OWORD *)(a2 + 16) = v3;
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v2;
  return a2;
}

_OWORD *sub_248AB19E4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_248AB19F4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_248AB1A14()
{
  return swift_release();
}

uint64_t sub_248AB1A1C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t static TipEventProxySwift.donate(eventIdentifier:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  type metadata accessor for TipEventProxy();
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_248AB1AB4;
  return static TipEventProxy.donate(eventIdentifier:for:with:)(a1, a2, a3, a4, 0);
}

uint64_t sub_248AB1AB4()
{
  uint64_t v0;

  sub_248AB2344();
  return sub_248AB1A1C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_248AB1B4C(int a1, int a2, void *aBlock)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v3[2] = _Block_copy(aBlock);
  v4 = sub_248AB3E84();
  v6 = v5;
  v3[3] = v5;
  v7 = sub_248AB3E84();
  v9 = v8;
  v3[4] = v8;
  v10 = (_QWORD *)swift_task_alloc();
  v3[5] = v10;
  *v10 = v3;
  v10[1] = sub_248AB1BE4;
  return static TipEventProxySwift.donate(eventIdentifier:for:)(v4, v6, v7, v9);
}

uint64_t sub_248AB1BE4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v2 + 16);
  if (v0)
  {
    v4 = (void *)sub_248AB3D64();
    MEMORY[0x2495A4328](v0);
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(v2 + 16), 0);
  }
  _Block_release(*(const void **)(v2 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_248AB1C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v10;

  sub_248AB1938(&qword_2577B0908);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_248AB3ED8();
  sub_248AB1EE0((uint64_t)v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_2577B0918;
  v8[5] = v7;
  sub_248AB2098((uint64_t)v5, (uint64_t)&unk_2577B0928, (uint64_t)v8);
  return swift_release();
}

id TipEventProxySwift.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TipEventProxySwift.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id TipEventProxySwift.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TipEventProxySwift()
{
  return objc_opt_self();
}

uint64_t sub_248AB1E34()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_248AB1E68()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = sub_248AB2378(v1, (uint64_t)sub_248AB1EB4);
  return sub_248AB2364(v2, v3, v4, v5, v6);
}

uint64_t sub_248AB1EB4()
{
  uint64_t v0;

  sub_248AB2344();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AB1EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_248AB1EEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_248AB2340;
  return v6();
}

uint64_t sub_248AB1F44()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = sub_248AB2378(v1, (uint64_t)sub_248AB2340);
  return sub_248AB2364(v2, v3, v4, v5, v6);
}

uint64_t sub_248AB1F90(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_248AB2340;
  return v7();
}

uint64_t sub_248AB1FE8()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AB2014(uint64_t a1)
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
  v7[1] = sub_248AB2340;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2577B0920 + dword_2577B0920))(a1, v4, v5, v6);
}

uint64_t sub_248AB2098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_248AB3ED8();
  if (sub_248AB21D4(a1, 1, v6) == 1)
  {
    sub_248AB21E0(a1);
  }
  else
  {
    sub_248AB3ECC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_248AB3EC0();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_248AB21D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_248AB21E0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_248AB1938(&qword_2577B0908);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248AB2220(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_248AB2284;
  return v6(a1);
}

uint64_t sub_248AB2284()
{
  uint64_t v0;

  sub_248AB2344();
  return sub_248AB1A1C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_248AB22AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248AB22D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_248AB1AB4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2577B0930 + dword_2577B0930))(a1, v4);
}

uint64_t sub_248AB2344()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_248AB2364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t sub_248AB2378@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t static TipProxy.invalidate(tipIdentifier:for:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;
  _QWORD *v6;

  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_BYTE *)(v5 + 64) = *a5;
  sub_248AB3E3C();
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 32) = v6;
  *v6 = v5;
  v6[1] = sub_248AB2418;
  return sub_248AB3E30();
}

uint64_t sub_248AB2418(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v5;

  v3 = *v2;
  *(_QWORD *)(v3 + 40) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  sub_248AB3DAC();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 48) = v5;
  *v5 = v3;
  v5[1] = sub_248AB24C4;
  return sub_248AB3DA0();
}

uint64_t sub_248AB24C4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_248AB2538()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t TipProxy.deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return v0;
}

uint64_t TipProxy.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t TipProxy.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_248AB25B0()
{
  return TipProxy.unownedExecutor.getter();
}

void static TipProxy.InvalidationReason.userClosedTip.getter(_BYTE *a1@<X8>)
{
  sub_248AB2830(a1);
}

void static TipProxy.InvalidationReason.userPerformedAction.getter(_BYTE *a1@<X8>)
{
  sub_248AB2830(a1);
}

void static TipProxy.InvalidationReason.maxDisplayCountExceeded.getter(_BYTE *a1@<X8>)
{
  sub_248AB2830(a1);
}

BOOL static TipProxy.InvalidationReason.== infix(_:_:)()
{
  return sub_248AB25EC();
}

BOOL sub_248AB25EC()
{
  uint64_t v1;
  uint64_t v2;

  sub_248AB27F4();
  sub_248AB3EB4();
  sub_248AB3EB4();
  return v2 == v1;
}

uint64_t type metadata accessor for TipProxy()
{
  return objc_opt_self();
}

uint64_t method lookup function for TipProxy()
{
  return swift_lookUpClassMethod();
}

_BYTE *initializeBufferWithCopyOfBuffer for TipProxy.InvalidationReason(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TipProxy.InvalidationReason(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
    if (a2 + 9 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 9) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v5 = v6 - 10;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TipProxy.InvalidationReason(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_248AB2774 + 4 * byte_248AB4305[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_248AB27A8 + 4 * byte_248AB4300[v4]))();
}

uint64_t sub_248AB27A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_248AB27B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x248AB27B8);
  return result;
}

uint64_t sub_248AB27C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x248AB27CCLL);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_248AB27D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248AB27D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TipProxy.InvalidationReason()
{
  return &type metadata for TipProxy.InvalidationReason;
}

unint64_t sub_248AB27F4()
{
  unint64_t result;

  result = qword_2577B0948;
  if (!qword_2577B0948)
  {
    result = MEMORY[0x2495A4364](MEMORY[0x24BEB7518], MEMORY[0x24BEB7510]);
    atomic_store(result, (unint64_t *)&qword_2577B0948);
  }
  return result;
}

void sub_248AB2830(_BYTE *a1@<X8>)
{
  char v1;

  *a1 = v1;
}

uint64_t static TipProxy.remoteTipIdentifiers(bundleID:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;

  v5[4] = a2;
  v5[5] = a5;
  v5[3] = a1;
  v5[6] = sub_248AB3E3C();
  v6 = (_QWORD *)swift_task_alloc();
  v5[7] = v6;
  *v6 = v5;
  v6[1] = sub_248AB28B4;
  return sub_248AB3E30();
}

uint64_t sub_248AB28B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 64) = a1;
  swift_task_dealloc();
  if (v1)
    return sub_248AB1A1C(*(uint64_t (**)(void))(v3 + 8));
  else
    return swift_task_switch();
}

uint64_t sub_248AB2920()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v4)(uint64_t, void *, _QWORD, uint64_t);

  *(_QWORD *)(v0 + 72) = sub_248AB3E24();
  v4 = (uint64_t (*)(uint64_t, void *, _QWORD, uint64_t))((int)*MEMORY[0x24BEB7828] + MEMORY[0x24BEB7828]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  v2 = sub_248AB1938(&qword_2577B0960);
  *v1 = v0;
  v1[1] = sub_248AB29B8;
  return v4(v0 + 16, &unk_2577B0958, 0, v2);
}

uint64_t sub_248AB29B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_248AB2A24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD **)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 16);
  v5 = sub_248AB3D7C();
  sub_248AB3D1C(v5);
  v3[3] = v2;
  *v3 = v1;
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
}

uint64_t sub_248AB2A88()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return sub_248AB1A1C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_248AB2ABC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_248AB2AD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = v0;
  v2 = sub_248AB3DD0();
  v3 = sub_248AB3CC8();
  MEMORY[0x2495A40B8](v2, v3);
  sub_248AB3E78();
  v4 = sub_248AB3E60();
  result = swift_bridgeObjectRelease();
  v6 = MEMORY[0x24BEE4AF8];
  v22 = MEMORY[0x24BEE4AF8];
  if (!(v4 >> 62))
  {
    v7 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
      goto LABEL_3;
LABEL_14:
    sub_248AB3D34();
    v10 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_25;
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  v7 = sub_248AB3F50();
  result = sub_248AB3D34();
  if (!v7)
    goto LABEL_14;
LABEL_3:
  if (v7 < 1)
  {
    __break(1u);
    goto LABEL_29;
  }
  for (i = 0; i != v7; ++i)
  {
    if ((v4 & 0xC000000000000001) != 0)
      sub_248AB3D58();
    swift_retain();
    v9 = (void *)sub_248AB3DC4();

    if (v9)
    {
      sub_248AB3EFC();
      sub_248AB3F14();
      sub_248AB3F20();
      sub_248AB3F08();
    }
    else
    {
      swift_release();
    }
  }
  sub_248AB3D34();
  v10 = v22;
  if (v22 < 0)
    goto LABEL_25;
LABEL_15:
  if ((v10 & 0x4000000000000000) == 0)
  {
    v11 = *(_QWORD *)(v10 + 16);
    if (!v11)
    {
LABEL_26:
      sub_248AB3D3C();
      v13 = MEMORY[0x24BEE4AF8];
LABEL_27:
      **(_QWORD **)(v1 + 16) = v13;
      return (*(uint64_t (**)(void))(v1 + 8))();
    }
    goto LABEL_17;
  }
LABEL_25:
  swift_bridgeObjectRetain();
  v11 = sub_248AB3F50();
  sub_248AB3D3C();
  if (!v11)
    goto LABEL_26;
LABEL_17:
  result = (uint64_t)sub_248AB33DC(0, v11 & ~(v11 >> 63), 0);
  if ((v11 & 0x8000000000000000) == 0)
  {
    v21 = v1;
    v12 = 0;
    v13 = v6;
    v14 = v10 & 0xC000000000000001;
    do
    {
      if (v14)
        sub_248AB3D58();
      swift_retain();
      v15 = sub_248AB3DB8();
      v17 = v16;
      swift_release();
      v19 = *(_QWORD *)(v6 + 16);
      v18 = *(_QWORD *)(v6 + 24);
      if (v19 >= v18 >> 1)
        sub_248AB33DC((char *)(v18 > 1), v19 + 1, 1);
      ++v12;
      *(_QWORD *)(v6 + 16) = v19 + 1;
      v20 = v6 + 16 * v19;
      *(_QWORD *)(v20 + 32) = v15;
      *(_QWORD *)(v20 + 40) = v17;
    }
    while (v11 != v12);
    sub_248AB3D3C();
    v1 = v21;
    goto LABEL_27;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t static TipProxy.remoteTipIdentifiers(in:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_248AB2DB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[4];
  v0[2] = v0[3];
  v2 = swift_task_alloc();
  v0[5] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[6] = v3;
  sub_248AB1938(&qword_2577B0980);
  sub_248AB1938(&qword_2577B0988);
  sub_248AB3168();
  *v3 = v0;
  v3[1] = sub_248AB2E6C;
  return sub_248AB3EA8();
}

uint64_t sub_248AB2E6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  sub_248AB3D44();
  *v4 = *v3;
  *(_QWORD *)(v2 + 56) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    *(_QWORD *)(v2 + 64) = v0;
    swift_task_dealloc();
  }
  return sub_248AB3D0C();
}

uint64_t sub_248AB2ED0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_248AB31F0(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_248AB2F04()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_248AB1A1C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_248AB2F30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_248AB2F4C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = *(uint64_t **)(v0 + 16);
  v2 = *(int *)(sub_248AB1938(&qword_2577B0988) + 48);
  *(_DWORD *)(v0 + 80) = v2;
  v3 = (uint64_t)v1 + v2;
  *v1 = sub_248AB3D70();
  v1[1] = v4;
  v5 = sub_248AB1938(&qword_2577B09A0);
  *(_QWORD *)(v0 + 40) = v5;
  v6 = v3 + *(int *)(v5 + 48);
  v7 = sub_248AB3D70();
  v9 = v8;
  *(_QWORD *)(v0 + 48) = v8;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v10;
  *v10 = v0;
  v10[1] = sub_248AB2FFC;
  return static TipProxy.remoteTipIdentifiers(bundleID:in:)(v3, v6, v7, v9, *(_QWORD *)(v0 + 24));
}

uint64_t sub_248AB2FFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  sub_248AB3D44();
  *v4 = *v3;
  *(_QWORD *)(v2 + 64) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    v5 = *(_QWORD *)(v2 + 40);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 72) = v0;
    *(_DWORD *)(v2 + 84) = *(_DWORD *)(v5 + 64);
  }
  return sub_248AB3D0C();
}

uint64_t sub_248AB3068()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + *(int *)(v0 + 80) + *(int *)(v0 + 84)) = *(_QWORD *)(v0 + 72);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248AB3088()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_248AB1A1C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_248AB30C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_248AB3128;
  return sub_248AB2F30(a1, a2, v6);
}

uint64_t sub_248AB3128()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return sub_248AB1A1C(*(uint64_t (**)(void))(v2 + 8));
}

unint64_t sub_248AB3168()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577B0990;
  if (!qword_2577B0990)
  {
    v1 = sub_248AB31AC(&qword_2577B0980);
    result = MEMORY[0x2495A4364](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2577B0990);
  }
  return result;
}

uint64_t sub_248AB31AC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495A4358](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_248AB31F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_248AB1938(&qword_2577B0998);
    v1 = sub_248AB3F68();
  }
  else
  {
    v1 = MEMORY[0x24BEE4B00];
  }
  v4 = v1;
  v2 = swift_bridgeObjectRetain();
  sub_248AB34F4(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_248AB3298(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_248AB3F8C();
  sub_248AB3E90();
  v4 = sub_248AB3F98();
  return sub_248AB32FC(a1, a2, v4);
}

unint64_t sub_248AB32FC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_248AB3F74() & 1) == 0)
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
      while (!v14 && (sub_248AB3F74() & 1) == 0);
    }
  }
  return v6;
}

char *sub_248AB33DC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_248AB33F8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_248AB33F8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    sub_248AB1938((uint64_t *)&unk_2577B09C0);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_248AB34F4(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  _QWORD v33[3];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v38 = a3;
  v37 = *(_QWORD *)(sub_248AB1938(&qword_2577B09A0) - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248AB1938(&qword_2577B0988);
  v8 = MEMORY[0x24BDAC7A8]();
  v11 = (_QWORD *)((char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
    return swift_bridgeObjectRelease();
  v33[1] = v3;
  v33[2] = a1;
  v36 = (uint64_t)v11 + *(int *)(v8 + 48);
  v13 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  v34 = *(_QWORD *)(v9 + 72);
  swift_bridgeObjectRetain();
  v35 = v11;
  while (1)
  {
    sub_248AB3C7C(v13, (uint64_t)v11, &qword_2577B0988);
    v15 = v11[1];
    v41 = *v11;
    v14 = v41;
    v42 = v15;
    v16 = (uint64_t)v7;
    sub_248AB3898(v36, (uint64_t)v7);
    v17 = (_QWORD *)*v38;
    v19 = sub_248AB3298(v14, v15);
    v20 = v17[2];
    v21 = (v18 & 1) == 0;
    v22 = v20 + v21;
    if (__OFADD__(v20, v21))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_248AB3F80();
      __break(1u);
      goto LABEL_20;
    }
    v23 = v18;
    if (v17[3] < v22)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v18 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      sub_248AB1938(&qword_2577B09A8);
      sub_248AB3F38();
      if ((v23 & 1) != 0)
        goto LABEL_14;
    }
LABEL_10:
    v26 = (_QWORD *)*v38;
    *(_QWORD *)(*v38 + 8 * (v19 >> 6) + 64) |= 1 << v19;
    v27 = (uint64_t *)(v26[6] + 16 * v19);
    *v27 = v14;
    v27[1] = v15;
    v7 = (char *)v16;
    sub_248AB3898(v16, v26[7] + *(_QWORD *)(v37 + 72) * v19);
    v28 = v26[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_18;
    v26[2] = v30;
    v11 = v35;
    v13 += v34;
    a2 = 1;
    if (!--v12)
      return swift_bridgeObjectRelease_n();
  }
  sub_248AB3920(v22, a2 & 1);
  v24 = sub_248AB3298(v14, v15);
  if ((v23 & 1) != (v25 & 1))
    goto LABEL_19;
  v19 = v24;
  if ((v23 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v31 = swift_allocError();
  swift_willThrow();
  v43 = v31;
  MEMORY[0x2495A4334](v31);
  sub_248AB1938(&qword_2577B09B0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_248AB38E0(v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return MEMORY[0x2495A4328](v43);
  }
LABEL_20:
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_248AB3EE4();
  sub_248AB3E9C();
  sub_248AB3F2C();
  sub_248AB3E9C();
  result = sub_248AB3F44();
  __break(1u);
  return result;
}

uint64_t sub_248AB3898(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_248AB1938(&qword_2577B09A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248AB38E0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_248AB1938(&qword_2577B09A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248AB3920(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;
  int v41;

  v3 = v2;
  v40 = *(_QWORD *)(sub_248AB1938(&qword_2577B09A0) - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  sub_248AB1938(&qword_2577B0998);
  v41 = a2;
  v8 = sub_248AB3F5C();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v37 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v39 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v38 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    if (!v13)
      goto LABEL_7;
LABEL_6:
    v17 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    for (i = v17 | (v16 << 6); ; i = __clz(__rbit64(v20)) + (v16 << 6))
    {
      v22 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * i);
      v24 = *v22;
      v23 = v22[1];
      v25 = *(_QWORD *)(v40 + 72);
      v26 = *(_QWORD *)(v7 + 56) + v25 * i;
      if ((v41 & 1) != 0)
      {
        sub_248AB3898(v26, (uint64_t)v6);
      }
      else
      {
        sub_248AB3C7C(v26, (uint64_t)v6, &qword_2577B09A0);
        swift_bridgeObjectRetain();
      }
      sub_248AB3F8C();
      sub_248AB3E90();
      result = sub_248AB3F98();
      v27 = -1 << *(_BYTE *)(v9 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v14 + 8 * (v28 >> 6))) == 0)
      {
        v31 = 0;
        v32 = (unint64_t)(63 - v27) >> 6;
        while (++v29 != v32 || (v31 & 1) == 0)
        {
          v33 = v29 == v32;
          if (v29 == v32)
            v29 = 0;
          v31 |= v33;
          v34 = *(_QWORD *)(v14 + 8 * v29);
          if (v34 != -1)
          {
            v30 = __clz(__rbit64(~v34)) + (v29 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      v30 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v14 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(_QWORD *)(v14 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
      v35 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v30);
      *v35 = v24;
      v35[1] = v23;
      result = sub_248AB3898((uint64_t)v6, *(_QWORD *)(v9 + 56) + v25 * v30);
      ++*(_QWORD *)(v9 + 16);
      if (v13)
        goto LABEL_6;
LABEL_7:
      v19 = v16 + 1;
      if (__OFADD__(v16, 1))
        goto LABEL_40;
      if (v19 >= v38)
        goto LABEL_33;
      v20 = v39[v19];
      ++v16;
      if (!v20)
      {
        v16 = v19 + 1;
        if (v19 + 1 >= v38)
          goto LABEL_33;
        v20 = v39[v16];
        if (!v20)
        {
          v21 = v19 + 2;
          if (v21 >= v38)
          {
LABEL_33:
            swift_release();
            v3 = v37;
            if ((v41 & 1) != 0)
            {
              v36 = 1 << *(_BYTE *)(v7 + 32);
              if (v36 >= 64)
                sub_248AB3CAC(0, (unint64_t)(v36 + 63) >> 6, v39);
              else
                *v39 = -1 << v36;
              *(_QWORD *)(v7 + 16) = 0;
            }
            break;
          }
          v20 = v39[v21];
          if (!v20)
          {
            while (1)
            {
              v16 = v21 + 1;
              if (__OFADD__(v21, 1))
                goto LABEL_41;
              if (v16 >= v38)
                goto LABEL_33;
              v20 = v39[v16];
              ++v21;
              if (v20)
                goto LABEL_18;
            }
          }
          v16 = v21;
        }
      }
LABEL_18:
      v13 = (v20 - 1) & v20;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_248AB3C7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;

  v4 = sub_248AB1938(a3);
  sub_248AB3D1C(v4);
  return a2;
}

uint64_t sub_248AB3CAC(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

unint64_t sub_248AB3CC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577B09B8;
  if (!qword_2577B09B8)
  {
    v1 = sub_248AB3DD0();
    result = MEMORY[0x2495A4364](MEMORY[0x24BEB76E0], v1);
    atomic_store(result, (unint64_t *)&qword_2577B09B8);
  }
  return result;
}

uint64_t sub_248AB3D0C()
{
  return swift_task_switch();
}

uint64_t sub_248AB3D1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t sub_248AB3D34()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_248AB3D3C()
{
  return swift_release();
}

void sub_248AB3D44()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

void sub_248AB3D58()
{
  JUMPOUT(0x2495A413CLL);
}

uint64_t sub_248AB3D64()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_248AB3D70()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_248AB3D7C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_248AB3D88()
{
  return MEMORY[0x24BEB7330]();
}

uint64_t sub_248AB3D94()
{
  return MEMORY[0x24BEB7368]();
}

uint64_t sub_248AB3DA0()
{
  return MEMORY[0x24BEB73C8]();
}

uint64_t sub_248AB3DAC()
{
  return MEMORY[0x24BEB76B8]();
}

uint64_t sub_248AB3DB8()
{
  return MEMORY[0x24BEB76D0]();
}

uint64_t sub_248AB3DC4()
{
  return MEMORY[0x24BEB76D8]();
}

uint64_t sub_248AB3DD0()
{
  return MEMORY[0x24BEB76E8]();
}

uint64_t sub_248AB3DDC()
{
  return MEMORY[0x24BEB7768]();
}

uint64_t sub_248AB3DE8()
{
  return MEMORY[0x24BEB7770]();
}

uint64_t sub_248AB3DF4()
{
  return MEMORY[0x24BEB7790]();
}

uint64_t sub_248AB3E00()
{
  return MEMORY[0x24BEB7798]();
}

uint64_t sub_248AB3E0C()
{
  return MEMORY[0x24BEB77A0]();
}

uint64_t sub_248AB3E18()
{
  return MEMORY[0x24BEB77A8]();
}

uint64_t sub_248AB3E24()
{
  return MEMORY[0x24BEB7838]();
}

uint64_t sub_248AB3E30()
{
  return MEMORY[0x24BEB7858]();
}

uint64_t sub_248AB3E3C()
{
  return MEMORY[0x24BEB7868]();
}

uint64_t sub_248AB3E48()
{
  return MEMORY[0x24BEB7878]();
}

uint64_t sub_248AB3E54()
{
  return MEMORY[0x24BEB7888]();
}

uint64_t sub_248AB3E60()
{
  return MEMORY[0x24BEB78E0]();
}

uint64_t sub_248AB3E6C()
{
  return MEMORY[0x24BEB78E8]();
}

uint64_t sub_248AB3E78()
{
  return MEMORY[0x24BEB78F0]();
}

uint64_t sub_248AB3E84()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_248AB3E90()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_248AB3E9C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_248AB3EA8()
{
  return MEMORY[0x24BEB7940]();
}

uint64_t sub_248AB3EB4()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_248AB3EC0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_248AB3ECC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_248AB3ED8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_248AB3EE4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_248AB3EF0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_248AB3EFC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_248AB3F08()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_248AB3F14()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_248AB3F20()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_248AB3F2C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_248AB3F38()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_248AB3F44()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_248AB3F50()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_248AB3F5C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_248AB3F68()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_248AB3F74()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_248AB3F80()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_248AB3F8C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_248AB3F98()
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

