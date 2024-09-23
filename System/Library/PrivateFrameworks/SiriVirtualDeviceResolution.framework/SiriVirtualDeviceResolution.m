uint64_t type metadata accessor for BooleanCapabilityPrimitive()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for AlarmTimerIntentsHandlingCapability()
{
  return objc_opt_self();
}

id AlarmTimerIntentsHandlingCapability.init(status:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t inited;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for AlarmTimerIntentsHandlingCapability();
  v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(inited + 32) = 0xD000000000000032;
  *(_QWORD *)(inited + 40) = 0x80000001C2EFBB60;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_7());
  v7 = v5;
  *(_QWORD *)(inited + 48) = sub_1C2ED4C54(a1);
  v8 = sub_1C2EF73E0();
  sub_1C2EC93D8(v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C2EC9B5C(6, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for VoiceTriggerCapability()
{
  return objc_opt_self();
}

void sub_1C2EC8BF8(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  void *v25;

  OUTLINED_FUNCTION_8();
  swift_bridgeObjectRetain();
  v6 = (void *)sub_1C2EF7410();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_1C2EF7410();
  objc_msgSend(a1, sel_encodeObject_forKey_, v6, v7);

  v8 = *a3;
  v9 = swift_bridgeObjectRetain();
  sub_1C2ECAC08(v9);
  OUTLINED_FUNCTION_1();
  v10 = (void *)sub_1C2EF74C4();
  swift_release();
  v11 = (void *)sub_1C2EF7410();
  objc_msgSend(a1, sel_encodeObject_forKey_, v10, v11);

  v12 = *(_QWORD *)(v3 + v8);
  v13 = v12 + 64;
  v14 = 1 << *(_BYTE *)(v12 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v12 + 64);
  v17 = (unint64_t)(v14 + 63) >> 6;
  swift_bridgeObjectRetain();
  v18 = 0;
  if (!v16)
    goto LABEL_5;
LABEL_4:
  v19 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (i = v19 | (v18 << 6); ; i = __clz(__rbit64(v22)) + (v18 << 6))
  {
    v24 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 16 * i);
    OUTLINED_FUNCTION_16();
    sub_1C2EF7464();
    swift_unknownObjectRetain_n();
    v25 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_encodeObject_forKey_, v24, v25);
    swift_unknownObjectRelease_n();

    if (v16)
      goto LABEL_4;
LABEL_5:
    v21 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v17)
      goto LABEL_23;
    v22 = *(_QWORD *)(v13 + 8 * v21);
    ++v18;
    if (!v22)
    {
      v18 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_23;
      v22 = *(_QWORD *)(v13 + 8 * v18);
      if (!v22)
      {
        v18 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_23;
        v22 = *(_QWORD *)(v13 + 8 * v18);
        if (!v22)
        {
          v18 = v21 + 3;
          if (v21 + 3 >= v17)
            goto LABEL_23;
          v22 = *(_QWORD *)(v13 + 8 * v18);
          if (!v22)
            break;
        }
      }
    }
LABEL_20:
    v16 = (v22 - 1) & v22;
  }
  v23 = v21 + 4;
  if (v23 >= v17)
  {
LABEL_23:
    swift_release();
    return;
  }
  v22 = *(_QWORD *)(v13 + 8 * v23);
  if (v22)
  {
    v18 = v23;
    goto LABEL_20;
  }
  while (1)
  {
    v18 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v18 >= v17)
      goto LABEL_23;
    v22 = *(_QWORD *)(v13 + 8 * v18);
    ++v23;
    if (v22)
      goto LABEL_20;
  }
LABEL_25:
  __break(1u);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BCCAAC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id VoiceTriggerCapability.init(status:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t inited;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for VoiceTriggerCapability();
  v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(inited + 32) = 0xD000000000000025;
  *(_QWORD *)(inited + 40) = 0x80000001C2EFAE20;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_7());
  v7 = v5;
  *(_QWORD *)(inited + 48) = sub_1C2ED4C54(a1);
  v8 = sub_1C2EF73E0();
  sub_1C2EC93D8(v8);
  v10 = v9;
  OUTLINED_FUNCTION_9();
  sub_1C2EC9BE8(5, v10, (void (*)(uint64_t))sub_1C2EC92B8, sub_1C2EC91C0);
  OUTLINED_FUNCTION_1();

  return v7;
}

unint64_t sub_1C2EC907C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1C2EF79B0();
  sub_1C2EF7440();
  v4 = sub_1C2EF79E0();
  return sub_1C2ECC530(a1, a2, v4);
}

uint64_t sub_1C2EC91C0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EC9210()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_key);
  OUTLINED_FUNCTION_8();
  v2 = *v1;
  OUTLINED_FUNCTION_2();
  return v2;
}

uint64_t sub_1C2EC92B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_key);
  OUTLINED_FUNCTION_8();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EC9310@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2EC9210();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C2EC9338(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C2EC92B8(v1, v2);
}

void sub_1C2EC9374()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5();
}

void VoiceTriggerCapability.__allocating_init(status:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13();
  VoiceTriggerCapability.init(status:)(v0);
  OUTLINED_FUNCTION_5();
}

void sub_1C2EC93D8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AFFD0);
    v2 = (_QWORD *)OUTLINED_FUNCTION_6();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v32 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  OUTLINED_FUNCTION_2();
  v6 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v7 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        v8 = v7 | (v6 << 6);
      }
      else
      {
        v9 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_38;
        if (v9 >= v31)
        {
LABEL_35:
          sub_1C2ECAEE4();
          return;
        }
        v10 = *(_QWORD *)(v32 + 8 * v9);
        v11 = v6 + 1;
        if (!v10)
        {
          OUTLINED_FUNCTION_12();
          if (v12 == v13)
            goto LABEL_35;
          OUTLINED_FUNCTION_10();
          if (!v10)
          {
            OUTLINED_FUNCTION_12();
            if (v12 == v13)
              goto LABEL_35;
            OUTLINED_FUNCTION_10();
            if (!v10)
            {
              OUTLINED_FUNCTION_12();
              if (v12 == v13)
                goto LABEL_35;
              OUTLINED_FUNCTION_10();
              if (!v10)
              {
                v15 = v14 + 4;
                if (v15 >= v31)
                  goto LABEL_35;
                v10 = *(_QWORD *)(v32 + 8 * v15);
                if (!v10)
                {
                  while (!__OFADD__(v15, 1))
                  {
                    OUTLINED_FUNCTION_12();
                    if (v12 == v13)
                      goto LABEL_35;
                    OUTLINED_FUNCTION_10();
                    v15 = v16 + 1;
                    if (v10)
                      goto LABEL_29;
                  }
                  goto LABEL_39;
                }
                v11 = v15;
              }
            }
          }
        }
LABEL_29:
        v5 = (v10 - 1) & v10;
        v8 = __clz(__rbit64(v10)) + (v11 << 6);
        v6 = v11;
      }
      v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v8);
      v19 = *v17;
      v18 = v17[1];
      v20 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      v21 = v20;
      v22 = sub_1C2EC907C(v19, v18);
      v23 = v22;
      if ((v24 & 1) == 0)
        break;
      v25 = (uint64_t *)(v2[6] + 16 * v22);
      swift_bridgeObjectRelease();
      *v25 = v19;
      v25[1] = v18;
      v26 = (_QWORD *)(v2[7] + 16 * v23);
      swift_unknownObjectRelease();
      *v26 = v21;
      v26[1] = &off_1E7CC90B8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v22;
    v27 = (uint64_t *)(v2[6] + 16 * v22);
    *v27 = v19;
    v27[1] = v18;
    v28 = (_QWORD *)(v2[7] + 16 * v22);
    *v28 = v21;
    v28[1] = &off_1E7CC90B8;
    v29 = v2[2];
    v13 = __OFADD__(v29, 1);
    v30 = v29 + 1;
    if (v13)
      goto LABEL_37;
    v2[2] = v30;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_1C2EC9654(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v15;
  char v16;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2AC8);
    v2 = OUTLINED_FUNCTION_6();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v15 = (unint64_t)(63 - v3) >> 6;
  OUTLINED_FUNCTION_2();
  swift_retain();
  if (v5)
  {
    v6 = __clz(__rbit64(v5));
    goto LABEL_28;
  }
  if (v15 > 1)
  {
    v7 = *(_QWORD *)(a1 + 72);
    v8 = 1;
    if (v7)
      goto LABEL_27;
    OUTLINED_FUNCTION_18();
    if (v9 == v10)
      goto LABEL_29;
    OUTLINED_FUNCTION_17();
    if (v7)
      goto LABEL_27;
    OUTLINED_FUNCTION_18();
    if (v9 == v10)
      goto LABEL_29;
    OUTLINED_FUNCTION_17();
    if (v7)
      goto LABEL_27;
    OUTLINED_FUNCTION_18();
    if (v9 == v10)
      goto LABEL_29;
    OUTLINED_FUNCTION_17();
    if (v7)
    {
LABEL_27:
      v6 = __clz(__rbit64(v7)) + (v8 << 6);
LABEL_28:
      v16 = *(_BYTE *)(*(_QWORD *)(a1 + 48) + v6);
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2AD0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2AD8);
      swift_dynamicCast();
      sub_1C2EF79B0();
      __asm { BR              X8 }
    }
    v12 = v11 + 4;
    if (v12 < v15)
    {
      v7 = *(_QWORD *)(a1 + 64 + 8 * v12);
      if (v7)
      {
        v8 = v12;
        goto LABEL_27;
      }
      while (1)
      {
        if (__OFADD__(v12, 1))
        {
          __break(1u);
          JUMPOUT(0x1C2EC9AF0);
        }
        OUTLINED_FUNCTION_18();
        if (v9 == v10)
          break;
        OUTLINED_FUNCTION_17();
        v12 = v13 + 1;
        if (v7)
          goto LABEL_27;
      }
    }
  }
LABEL_29:
  swift_release();
  sub_1C2ECAEE4();
  return v2;
}

uint64_t sub_1C2EC9B20(uint64_t a1, uint64_t a2)
{
  return sub_1C2EC9BE8(a1, a2, (void (*)(uint64_t))sub_1C2ECBAF4, sub_1C2ECB9F8);
}

uint64_t sub_1C2EC9B34(uint64_t a1, uint64_t a2)
{
  return sub_1C2EC9BE8(a1, a2, (void (*)(uint64_t))sub_1C2ECCF70, sub_1C2ECCE74);
}

uint64_t sub_1C2EC9B48(uint64_t a1, uint64_t a2)
{
  return sub_1C2EC9BE8(a1, a2, (void (*)(uint64_t))sub_1C2ECDB64, sub_1C2ECDA68);
}

uint64_t sub_1C2EC9B5C(uint64_t a1, uint64_t a2)
{
  return sub_1C2EC9BE8(a1, a2, (void (*)(uint64_t))sub_1C2EDA470, sub_1C2EDA374);
}

uint64_t sub_1C2EC9B70(uint64_t a1, uint64_t a2)
{
  return sub_1C2EC9BE8(a1, a2, (void (*)(uint64_t))sub_1C2EF1584, sub_1C2EF1488);
}

uint64_t sub_1C2EC9B84(uint64_t a1, uint64_t a2)
{
  return sub_1C2EC9BE8(a1, a2, (void (*)(uint64_t))sub_1C2EEFD9C, sub_1C2EEFCA0);
}

uint64_t sub_1C2EC9B98(uint64_t a1, uint64_t a2)
{
  return sub_1C2EC9BE8(a1, a2, (void (*)(uint64_t))sub_1C2EF4394, sub_1C2EF4298);
}

uint64_t sub_1C2EC9BAC(uint64_t a1, uint64_t a2)
{
  return sub_1C2EC9BE8(a1, a2, (void (*)(uint64_t))sub_1C2EEF1A8, sub_1C2EEF0AC);
}

uint64_t sub_1C2EC9BC0(uint64_t a1, uint64_t a2)
{
  return sub_1C2EC9BE8(a1, a2, (void (*)(uint64_t))sub_1C2EF0990, sub_1C2EF0894);
}

uint64_t sub_1C2EC9BD4(uint64_t a1, uint64_t a2)
{
  return sub_1C2EC9BE8(a1, a2, (void (*)(uint64_t))sub_1C2EEE5A0, sub_1C2EEE4A4);
}

uint64_t sub_1C2EC9BE8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;

  v5 = CapabilityKey.rawValue.getter();
  a3(v5);
  v6 = swift_bridgeObjectRetain();
  return a4(v6);
}

void sub_1C2EC9C70()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap);
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_19();
  sub_1C2EC9CFC(v2, v3, v1);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    OUTLINED_FUNCTION_7();
    swift_dynamicCastClass();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1C2EC9CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_1C2EC907C(a1, a2);
    if ((v3 & 1) != 0)
      swift_unknownObjectRetain();
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EC9D44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_1C2EC907C(a1, a2), (v7 & 1) != 0))
  {
    v8 = v6;
    v9 = *(_QWORD *)(a3 + 56);
    v10 = type metadata accessor for RequestAnalyticsContext(0);
    sub_1C2ECAB50(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * v8, a4);
    v11 = a4;
    v12 = 0;
    v13 = v10;
  }
  else
  {
    v13 = type metadata accessor for RequestAnalyticsContext(0);
    v11 = a4;
    v12 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v11, v12, 1, v13);
}

void sub_1C2EC9DD0(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_19();
  sub_1C2ED4CA8(v2, v3, a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EC9E1C(unint64_t a1)
{
  void *v1;

  return sub_1C2EC9E60(a1, (char *)v1) & 1;
}

uint64_t sub_1C2EC9E60(unint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v17;

  if (a1 >> 62)
    goto LABEL_30;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1C2EF7884())
  {
    v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1C3BCC3B0](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        v15 = a2;
        goto LABEL_24;
      }
      v10 = sub_1C2EF744C();
      v11 = sub_1C2EF3E58(v10, v8, v9);
      MEMORY[0x1C3BCC080](v11);
      swift_bridgeObjectRelease();
      v12 = sub_1C2EF78C0();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(_QWORD *)(*(_QWORD *)&a2[v17] + 16))
        goto LABEL_23;
      swift_bridgeObjectRetain();
      sub_1C2EC907C(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      v14 = sub_1C2ED4DC8((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3)
        goto LABEL_31;
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

uint64_t static VoiceTriggerCapability.supportsSecureCoding.getter()
{
  return 1;
}

void VoiceTriggerCapability.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_13();
  VoiceTriggerCapability.init(coder:)(v0);
  OUTLINED_FUNCTION_5();
}

char *VoiceTriggerCapability.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for VoiceTriggerCapability();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C2ECA33C((uint64_t)a1, (void (*)())sub_1C2EC92B8, (uint64_t (*)(_QWORD *))sub_1C2EC91C0);

  if (!*(_QWORD *)(*(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

uint64_t sub_1C2ECA328(uint64_t a1)
{
  return sub_1C2ECA33C(a1, (void (*)())sub_1C2ECBAF4, (uint64_t (*)(_QWORD *))sub_1C2ECB9F8);
}

uint64_t sub_1C2ECA33C(uint64_t a1, void (*a2)(), uint64_t (*a3)(_QWORD *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t (*v29)(_QWORD *);
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  _QWORD v33[3];
  uint64_t v34;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D2A90);
  v5 = OUTLINED_FUNCTION_11();
  *(_OWORD *)(v5 + 16) = xmmword_1C2EF9250;
  sub_1C2ECABD4(0, (unint64_t *)&qword_1EF7D3260);
  v7 = v6;
  *(_QWORD *)(v5 + 32) = v6;
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1();
  if (!v34)
    return sub_1C2ECAB94((uint64_t)v33);
  result = OUTLINED_FUNCTION_3();
  if ((result & 1) == 0)
    return result;
  v9 = OUTLINED_FUNCTION_11();
  *(_OWORD *)(v9 + 16) = xmmword_1C2EF9260;
  sub_1C2ECABD4(0, &qword_1EF7D2AA8);
  *(_QWORD *)(v9 + 32) = v10;
  *(_QWORD *)(v9 + 40) = v7;
  OUTLINED_FUNCTION_20();
  swift_bridgeObjectRelease();
  if (!v34)
  {
    OUTLINED_FUNCTION_1();
    return sub_1C2ECAB94((uint64_t)v33);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2AB0);
  if ((OUTLINED_FUNCTION_3() & 1) == 0)
    return OUTLINED_FUNCTION_1();
  v29 = a3;
  a2();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  v11 = (_QWORD *)sub_1C2EF73E0();
  v12 = *(_QWORD *)(v32 + 16);
  if (!v12)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    return v29(v11);
  }
  v31 = OUTLINED_FUNCTION_7();
  v30 = type metadata accessor for ContinuousNumericCapabilityPrimitive();
  v13 = (uint64_t *)(v32 + 40);
  while (1)
  {
    v15 = *(v13 - 1);
    v14 = *v13;
    OUTLINED_FUNCTION_16();
    v33[0] = v16;
    v33[1] = 0xEE005F70614D7365;
    OUTLINED_FUNCTION_2();
    sub_1C2EF7464();
    v17 = OUTLINED_FUNCTION_11();
    *(_OWORD *)(v17 + 16) = xmmword_1C2EF9260;
    *(_QWORD *)(v17 + 32) = v31;
    *(_QWORD *)(v17 + 40) = v30;
    OUTLINED_FUNCTION_20();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v34)
    {
      OUTLINED_FUNCTION_9();
      sub_1C2ECAB94((uint64_t)v33);
      goto LABEL_20;
    }
    if ((swift_dynamicCast() & 1) == 0)
    {
      OUTLINED_FUNCTION_9();
      goto LABEL_20;
    }
    swift_unknownObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    v33[0] = v11;
    v18 = sub_1C2EC907C(v15, v14);
    if (__OFADD__(v11[2], (v19 & 1) == 0))
      break;
    v20 = v18;
    v21 = v19;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D2AB8);
    if ((sub_1C2EF77D0() & 1) != 0)
    {
      v22 = sub_1C2EC907C(v15, v14);
      if ((v21 & 1) != (v23 & 1))
        goto LABEL_28;
      v20 = v22;
    }
    v11 = (_QWORD *)v33[0];
    if ((v21 & 1) != 0)
    {
      v24 = *(_QWORD *)(v33[0] + 56);
      swift_unknownObjectRelease();
      *(_OWORD *)(v24 + 16 * v20) = v32;
    }
    else
    {
      *(_QWORD *)(v33[0] + 8 * (v20 >> 6) + 64) |= 1 << v20;
      v25 = (uint64_t *)(v11[6] + 16 * v20);
      *v25 = v15;
      v25[1] = v14;
      *(_OWORD *)(v11[7] + 16 * v20) = v32;
      v26 = v11[2];
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        goto LABEL_27;
      v11[2] = v28;
      OUTLINED_FUNCTION_2();
    }
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_9();
    swift_bridgeObjectRelease();
LABEL_20:
    v13 += 2;
    if (!--v12)
      goto LABEL_21;
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  result = sub_1C2EF7968();
  __break(1u);
  return result;
}

uint64_t sub_1C2ECA750(uint64_t a1)
{
  return sub_1C2ECA33C(a1, (void (*)())sub_1C2ECCF70, (uint64_t (*)(_QWORD *))sub_1C2ECCE74);
}

uint64_t sub_1C2ECA764(uint64_t a1)
{
  return sub_1C2ECA33C(a1, (void (*)())sub_1C2ECDB64, (uint64_t (*)(_QWORD *))sub_1C2ECDA68);
}

uint64_t sub_1C2ECA778(uint64_t a1)
{
  return sub_1C2ECA33C(a1, (void (*)())sub_1C2EDA470, (uint64_t (*)(_QWORD *))sub_1C2EDA374);
}

uint64_t sub_1C2ECA78C(uint64_t a1)
{
  return sub_1C2ECA33C(a1, (void (*)())sub_1C2EEE5A0, (uint64_t (*)(_QWORD *))sub_1C2EEE4A4);
}

uint64_t sub_1C2ECA7A0(uint64_t a1)
{
  return sub_1C2ECA33C(a1, (void (*)())sub_1C2EEF1A8, (uint64_t (*)(_QWORD *))sub_1C2EEF0AC);
}

uint64_t sub_1C2ECA7B4(uint64_t a1)
{
  return sub_1C2ECA33C(a1, (void (*)())sub_1C2EEFD9C, (uint64_t (*)(_QWORD *))sub_1C2EEFCA0);
}

uint64_t sub_1C2ECA7C8(uint64_t a1)
{
  return sub_1C2ECA33C(a1, (void (*)())sub_1C2EF0990, (uint64_t (*)(_QWORD *))sub_1C2EF0894);
}

uint64_t sub_1C2ECA7DC(uint64_t a1)
{
  return sub_1C2ECA33C(a1, (void (*)())sub_1C2EF1584, (uint64_t (*)(_QWORD *))sub_1C2EF1488);
}

uint64_t sub_1C2ECA7F0(uint64_t a1)
{
  return sub_1C2ECA33C(a1, (void (*)())sub_1C2EF4394, (uint64_t (*)(_QWORD *))sub_1C2EF4298);
}

void sub_1C2ECA828(void *a1)
{
  sub_1C2EC8BF8(a1, (uint64_t)&OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_key, &OBJC_IVAR____TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability_primitivesMap);
}

void sub_1C2ECA84C(void *a1)
{
  sub_1C2EC8BF8(a1, (uint64_t)&OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_key, &OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap);
}

void sub_1C2ECA860(void *a1)
{
  sub_1C2EC8BF8(a1, (uint64_t)&OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_key, &OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap);
}

void sub_1C2ECA874(void *a1)
{
  sub_1C2EC8BF8(a1, (uint64_t)&OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_key, &OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap);
}

void sub_1C2ECA888(void *a1)
{
  sub_1C2EC8BF8(a1, (uint64_t)&OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_key, &OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap);
}

void sub_1C2ECA89C(void *a1)
{
  sub_1C2EC8BF8(a1, (uint64_t)&OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_key, &OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap);
}

void sub_1C2ECA8B0(void *a1)
{
  sub_1C2EC8BF8(a1, (uint64_t)&OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_key, &OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap);
}

void sub_1C2ECA8C4(void *a1)
{
  sub_1C2EC8BF8(a1, (uint64_t)&OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_key, &OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap);
}

void sub_1C2ECA8D8(void *a1)
{
  sub_1C2EC8BF8(a1, (uint64_t)&OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_key, &OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap);
}

void sub_1C2ECA8EC(void *a1)
{
  sub_1C2EC8BF8(a1, (uint64_t)&OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_key, &OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap);
}

void sub_1C2ECA900(void *a1)
{
  sub_1C2EC8BF8(a1, (uint64_t)&OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_key, &OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap);
}

id VoiceTriggerCapability.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void VoiceTriggerCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id VoiceTriggerCapability.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoiceTriggerCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for VoiceTriggerCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of VoiceTriggerCapability.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.key.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.key.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.__allocating_init(status:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.supportsVoiceTrigger.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static VoiceTriggerCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.matches(descriptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of VoiceTriggerCapability.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

void type metadata accessor for atomic_flag()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EF7D2A28)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EF7D2A28);
  }
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1C2ECAB50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RequestAnalyticsContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2ECAB94(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2AA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1C2ECABD4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_5();
}

_QWORD *sub_1C2ECAC08(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFE0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  v5 = sub_1C2ECACE8((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1C2ECAEE4();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_1C2ECACE8(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1C2ECAEE4()
{
  return swift_release();
}

void OUTLINED_FUNCTION_0(_QWORD *a1@<X8>)
{
  *a1 = 0x6669636570736E55;
  a1[1] = 0xEB00000000646569;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_1C2EF78A8();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return type metadata accessor for BooleanCapabilityPrimitive();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_allocObject();
}

id OUTLINED_FUNCTION_13()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

unint64_t OUTLINED_FUNCTION_19()
{
  return 0xD000000000000025;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_1C2EF762C();
}

void sub_1C2ECAFF0()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
}

void sub_1C2ECB018()
{
  sub_1C2ECB0D8();
}

void sub_1C2ECB024()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
}

void sub_1C2ECB04C()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2ECB064()
{
  CapabilityKey.rawValue.getter();
  sub_1C2EF7440();
  return swift_bridgeObjectRelease();
}

void sub_1C2ECB0B0()
{
  sub_1C2EF79BC();
  OUTLINED_FUNCTION_5();
}

void sub_1C2ECB0D8()
{
  OUTLINED_FUNCTION_7_0();
  CapabilityKey.rawValue.getter();
  sub_1C2EF7440();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
}

void sub_1C2ECB128()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
}

void sub_1C2ECB150()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0();
}

unint64_t sub_1C2ECB178(unint64_t result)
{
  if (result >= 3)
    return 3;
  return result;
}

uint64_t sub_1C2ECB188(uint64_t result)
{
  return result;
}

BOOL sub_1C2ECB190(char *a1, char *a2)
{
  return sub_1C2ED68EC(*a1, *a2);
}

void sub_1C2ECB19C()
{
  sub_1C2ECAFF0();
}

void sub_1C2ECB1B4()
{
  sub_1C2ECB0B0();
}

void sub_1C2ECB1BC()
{
  sub_1C2ECB128();
}

unint64_t sub_1C2ECB1D4@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1C2ECB178(*a1);
  *a2 = result;
  return result;
}

void sub_1C2ECB1FC(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = sub_1C2ECB188(*v1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2ECB220(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  sub_1C2ECB4EC(0);
  return v2;
}

BOOL sub_1C2ECB248(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _BOOL4 v4;
  void (*v5)(uint64_t);
  uint64_t v6;

  v2 = v1;
  swift_beginAccess();
  v4 = atomic_flag_test_and_set((atomic_flag *)(v2 + 16));
  swift_endAccess();
  if (!v4)
  {
    v5 = *(void (**)(uint64_t))(v2 + 24);
    if (v5)
    {
      swift_retain();
      v5(a1);
      sub_1C2ECB4EC((uint64_t)v5);
      v6 = *(_QWORD *)(v2 + 24);
      *(_QWORD *)(v2 + 24) = 0;
      *(_QWORD *)(v2 + 32) = 0;
      sub_1C2ECB4EC(v6);
    }
  }
  return !v4;
}

uint64_t sub_1C2ECB2F0()
{
  uint64_t v0;

  sub_1C2ECB4EC(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SafetyBlock()
{
  return objc_opt_self();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SafetyBlockSignal(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFE)
  {
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
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SafetyBlockSignal(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C2ECB418 + 4 * byte_1C2EF92F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1C2ECB44C + 4 * byte_1C2EF92F0[v4]))();
}

uint64_t sub_1C2ECB44C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ECB454(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2ECB45CLL);
  return result;
}

uint64_t sub_1C2ECB468(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2ECB470);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1C2ECB474(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ECB47C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ECB488(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1C2ECB494(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SafetyBlockSignal()
{
  return &type metadata for SafetyBlockSignal;
}

unint64_t sub_1C2ECB4B0()
{
  unint64_t result;

  result = qword_1EF7D2C88;
  if (!qword_1EF7D2C88)
  {
    result = MEMORY[0x1C3BCCAC4](&unk_1C2EF93BC, &type metadata for SafetyBlockSignal);
    atomic_store(result, (unint64_t *)&qword_1EF7D2C88);
  }
  return result;
}

uint64_t sub_1C2ECB4EC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_1C2EF79BC();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_1C2EF79E0();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_1C2EF79BC();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_1C2EF79BC();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_1C2EF79B0();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_1C2EF79B0();
}

uint64_t sub_1C2ECB54C(unint64_t a1, char *a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  char v16;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v2 = a1;
  if (a1 >> 62)
    goto LABEL_37;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1C2EF7884())
  {
    v18 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap;
    v4 = 4;
    v19 = v2;
    v20 = v2 & 0xC000000000000001;
    while (1)
    {
      v5 = v20 ? (char *)MEMORY[0x1C3BCC3B0](v4 - 4, v2) : (char *)*(id *)(v2 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
        goto LABEL_30;
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_28:
        swift_bridgeObjectRelease();

        return 0;
      }
      v10 = sub_1C2EF744C();
      v11 = sub_1C2EF3E58(v10, v8, v9);
      MEMORY[0x1C3BCC080](v11);
      swift_bridgeObjectRelease();
      v12 = sub_1C2EF78C0();
      swift_bridgeObjectRelease();
      if (v12)
      {
        if (v12 != 1)
        {
          swift_bridgeObjectRelease();

          goto LABEL_28;
        }
        if (!*(_QWORD *)(*(_QWORD *)&a2[v18] + 16))
          goto LABEL_32;
        swift_bridgeObjectRetain();
        sub_1C2EC907C(v8, v9);
        if ((v13 & 1) == 0)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          return 0;
        }
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for ContinuousNumericCapabilityPrimitive();
        if (!swift_dynamicCastClass())
          goto LABEL_25;
        v14 = sub_1C2ED50FC((uint64_t)v6);

        swift_unknownObjectRelease();
        if (!v14)
        {
LABEL_26:

          goto LABEL_34;
        }
      }
      else
      {
        if (!*(_QWORD *)(*(_QWORD *)&a2[v18] + 16))
        {
LABEL_30:

          swift_bridgeObjectRelease();
LABEL_34:
          swift_bridgeObjectRelease();
          return 0;
        }
        swift_bridgeObjectRetain();
        sub_1C2EC907C(v8, v9);
        if ((v15 & 1) == 0)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_34;
        }
        swift_unknownObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for BooleanCapabilityPrimitive();
        if (!swift_dynamicCastClass())
        {
LABEL_25:

          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          return 0;
        }
        swift_unknownObjectRetain();
        v16 = sub_1C2ED4DC8((uint64_t)v6);

        swift_unknownObjectRelease_n();
        if ((v16 & 1) == 0)
          goto LABEL_26;
      }
      ++v4;
      v2 = v19;
      if (v7 == v3)
        goto LABEL_38;
    }
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
  }
LABEL_38:

  swift_bridgeObjectRelease();
  return 1;
}

uint64_t SpeakerQualityReference.init(rawValue:)(uint64_t result)
{
  uint64_t v1;

  if (result == 3000)
    v1 = 3000;
  else
    v1 = 0;
  if (result == 2000)
    v1 = 2000;
  if (result == 1000)
    v1 = 1000;
  if (result)
    return v1;
  return result;
}

BOOL sub_1C2ECB998(uint64_t *a1, uint64_t *a2)
{
  return sub_1C2EF1CF4(*a1, *a2);
}

uint64_t sub_1C2ECB9A4()
{
  _QWORD *v0;

  return sub_1C2ECAFE8(*v0);
}

void sub_1C2ECB9AC()
{
  sub_1C2ECB04C();
}

uint64_t sub_1C2ECB9B4(uint64_t a1)
{
  _QWORD *v1;

  return sub_1C2ECB0D4(a1, *v1);
}

uint64_t sub_1C2ECB9BC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = SpeakerQualityReference.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1C2ECB9EC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1C2ECB9F8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2ECBA48()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_key);
  OUTLINED_FUNCTION_8();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2ECBAF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_key);
  OUTLINED_FUNCTION_8();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2ECBB4C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C2ECBAF4(v1, v2);
}

uint64_t (*sub_1C2ECBB88())()
{
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

id SpeakerCapability.__allocating_init(status:qualityScore:)(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_14();
  return SpeakerCapability.init(status:qualityScore:)(a1, a2);
}

id SpeakerCapability.init(status:qualityScore:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t inited;
  id v9;
  id v10;
  uint64_t v11;
  objc_super v13;

  v5 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap;
  v6 = v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v2[v5] = OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&v6[OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_key]);

  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for SpeakerCapability();
  v7 = objc_msgSendSuper2(&v13, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2D08);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9260;
  *(_QWORD *)(inited + 32) = 0xD000000000000020;
  *(_QWORD *)(inited + 40) = 0x80000001C2EFB010;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_7());
  v9 = v7;
  *(_QWORD *)(inited + 48) = sub_1C2ED4C54(a1);
  *(_QWORD *)(inited + 56) = &off_1E7CC90B8;
  *(_QWORD *)(inited + 64) = 0xD00000000000001FLL;
  *(_QWORD *)(inited + 72) = 0x80000001C2EFB040;
  v10 = objc_allocWithZone((Class)OUTLINED_FUNCTION_11_0());
  *(_QWORD *)(inited + 80) = sub_1C2ED5034((double)a2);
  *(_QWORD *)(inited + 88) = &off_1E7CC90A8;
  v11 = OUTLINED_FUNCTION_4_1();
  sub_1C2EC9B20(4, v11);
  swift_bridgeObjectRelease();

  return v9;
}

uint64_t type metadata accessor for SpeakerCapability()
{
  return objc_opt_self();
}

void sub_1C2ECBE10()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap);
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_8_0();
  sub_1C2EC9CFC(v2, v3, v1);
  v5 = v4;
  OUTLINED_FUNCTION_13_0();
  if (v5)
  {
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_7_1();
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2ECBEBC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  double v5;
  uint64_t result;

  if (!*(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap)
                  + 16))
    return 0;
  swift_bridgeObjectRetain();
  v1 = OUTLINED_FUNCTION_9_0();
  sub_1C2EC907C(v1, v2);
  if ((v3 & 1) == 0)
  {
    OUTLINED_FUNCTION_13_0();
    return 0;
  }
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_11_0();
  v4 = OUTLINED_FUNCTION_6_1();
  if (!v4)
  {
    OUTLINED_FUNCTION_7_1();
    return 0;
  }
  v5 = *(double *)(v4 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value);
  result = OUTLINED_FUNCTION_7_1();
  if ((~*(_QWORD *)&v5 & 0x7FF0000000000000) != 0)
  {
    if (v5 > -9.22337204e18)
    {
      if (v5 < 9.22337204e18)
        return (uint64_t)v5;
      goto LABEL_13;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

void sub_1C2ECBF98(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_8_0();
  sub_1C2ED4CA8(v2, v3, a1);
  OUTLINED_FUNCTION_5();
}

void sub_1C2ECBFE4()
{
  void *v0;
  uint64_t v1;
  double v2;
  double v3;

  OUTLINED_FUNCTION_11_0();
  v0 = (void *)OUTLINED_FUNCTION_9_0();
  sub_1C2ED5088(v0, v1, v2, v3);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2ECC040(unint64_t a1)
{
  void *v1;

  return sub_1C2ECB54C(a1, (char *)v1) & 1;
}

uint64_t static SpeakerCapability.supportsSecureCoding.getter()
{
  return 1;
}

void SpeakerCapability.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  SpeakerCapability.init(coder:)(a1);
  OUTLINED_FUNCTION_5();
}

char *SpeakerCapability.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for SpeakerCapability();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C2ECA328((uint64_t)a1);

  if (!*(_QWORD *)(*(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution17SpeakerCapability_primitivesMap] + 16))
  {

    return 0;
  }
  return v5;
}

id SpeakerCapability.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_14(), sel_init);
}

void SpeakerCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SpeakerCapability.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpeakerCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1C2ECC338()
{
  unint64_t result;

  result = qword_1EF7D2D10;
  if (!qword_1EF7D2D10)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for SpeakerQualityReference, &type metadata for SpeakerQualityReference);
    atomic_store(result, (unint64_t *)&qword_1EF7D2D10);
  }
  return result;
}

uint64_t sub_1C2ECC374@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2ECBA48();
  *a1 = result;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for SpeakerQualityReference()
{
  return &type metadata for SpeakerQualityReference;
}

uint64_t method lookup function for SpeakerCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SpeakerCapability.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SpeakerCapability.key.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SpeakerCapability.key.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SpeakerCapability.__allocating_init(status:qualityScore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SpeakerCapability.supportStatus.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SpeakerCapability.qualityScore.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of static SpeakerCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of static SpeakerCapability.capabilityDescriptionMatchingQualityScoreRange(lowerBound:upperBound:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of SpeakerCapability.matches(descriptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SpeakerCapability.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of SpeakerCapability.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t sub_1C2ECC4A0()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_2_0();
  return OUTLINED_FUNCTION_15(v0, v0);
}

uint64_t sub_1C2ECC4D0(uint64_t a1)
{
  uint64_t v2;

  sub_1C2ECB0D8();
  return sub_1C2ECC64C(a1, v2);
}

uint64_t sub_1C2ECC500()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_2_0();
  return OUTLINED_FUNCTION_15(v0, v0);
}

unint64_t sub_1C2ECC530(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1C2EF7938() & 1) == 0)
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
      while (!v14 && (sub_1C2EF7938() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C2ECC610()
{
  unint64_t result;

  result = qword_1EF7D2D40;
  if (!qword_1EF7D2D40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF7D2D40);
  }
  return result;
}

uint64_t sub_1C2ECC64C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_1C2ECC9B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(_QWORD);
  char v6;
  id v7;
  char v8;
  uint64_t v9;
  char v10;
  id v11;
  char v12;
  char v13;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  OUTLINED_FUNCTION_1_1();
  if ((v6 & 1) != 0)
  {
    v5(0);
    v7 = OUTLINED_FUNCTION_10_0();
    v8 = sub_1C2EF7644();

    if ((v8 & 1) == 0)
    {
      v9 = ~v3;
      v4 = (v4 + 1) & v9;
      OUTLINED_FUNCTION_1_1();
      if ((v10 & 1) != 0)
      {
        do
        {
          v11 = OUTLINED_FUNCTION_10_0();
          v12 = sub_1C2EF7644();

          if ((v12 & 1) != 0)
            break;
          v4 = (v4 + 1) & v9;
          OUTLINED_FUNCTION_1_1();
        }
        while ((v13 & 1) != 0);
      }
    }
  }
  return v4;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return sub_1C2EF7638();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_1C2EF73E0();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_dynamicCastClass();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_unknownObjectRelease();
}

unint64_t OUTLINED_FUNCTION_8_0()
{
  return 0xD000000000000020;
}

unint64_t OUTLINED_FUNCTION_9_0()
{
  return 0xD00000000000001FLL;
}

id OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(*(_QWORD *)(v1 + 48) + 8 * v0);
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return type metadata accessor for ContinuousNumericCapabilityPrimitive();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_14()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1C2ECC9B4(v2, a2);
}

uint64_t sub_1C2ECCB28(unint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v17;

  if (a1 >> 62)
    goto LABEL_30;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1C2EF7884())
  {
    v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1C3BCC3B0](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        v15 = a2;
        goto LABEL_24;
      }
      v10 = sub_1C2EF744C();
      v11 = sub_1C2EF3E58(v10, v8, v9);
      MEMORY[0x1C3BCC080](v11);
      swift_bridgeObjectRelease();
      v12 = sub_1C2EF78C0();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(_QWORD *)(*(_QWORD *)&a2[v17] + 16))
        goto LABEL_23;
      swift_bridgeObjectRetain();
      sub_1C2EC907C(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      v14 = sub_1C2ED4DC8((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3)
        goto LABEL_31;
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_1C2ECCE74(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2ECCEC4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_key);
  OUTLINED_FUNCTION_8();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2ECCF70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_key);
  OUTLINED_FUNCTION_8();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2ECCFC8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C2ECCF70(v1, v2);
}

uint64_t (*sub_1C2ECD004())()
{
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

void ProfileSwitchingCapability.__allocating_init(status:)(uint64_t a1)
{
  OUTLINED_FUNCTION_14();
  ProfileSwitchingCapability.init(status:)(a1);
  OUTLINED_FUNCTION_5();
}

id ProfileSwitchingCapability.init(status:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t inited;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for ProfileSwitchingCapability();
  v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(inited + 32) = 0xD000000000000029;
  *(_QWORD *)(inited + 40) = 0x80000001C2EFB130;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_7());
  v7 = v5;
  *(_QWORD *)(inited + 48) = sub_1C2ED4C54(a1);
  v8 = sub_1C2EF73E0();
  sub_1C2EC93D8(v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C2EC9B34(7, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for ProfileSwitchingCapability()
{
  return objc_opt_self();
}

void sub_1C2ECD244()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap);
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_3_1();
  sub_1C2EC9CFC(v2, v3, v1);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    OUTLINED_FUNCTION_7();
    swift_dynamicCastClass();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1C2ECD2D0(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_3_1();
  sub_1C2ED4CA8(v2, v3, a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2ECD31C(unint64_t a1)
{
  void *v1;

  return sub_1C2ECCB28(a1, (char *)v1) & 1;
}

uint64_t static ProfileSwitchingCapability.supportsSecureCoding.getter()
{
  return 1;
}

void ProfileSwitchingCapability.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  ProfileSwitchingCapability.init(coder:)(a1);
  OUTLINED_FUNCTION_5();
}

char *ProfileSwitchingCapability.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for ProfileSwitchingCapability();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C2ECA750((uint64_t)a1);

  if (!*(_QWORD *)(*(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id ProfileSwitchingCapability.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_14(), sel_init);
}

void ProfileSwitchingCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ProfileSwitchingCapability.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProfileSwitchingCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2ECD610@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2ECCEC4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for ProfileSwitchingCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.key.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.key.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.__allocating_init(status:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.supportsProfileSwitching.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static ProfileSwitchingCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.matches(descriptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ProfileSwitchingCapability.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_3_1()
{
  return 0xD000000000000029;
}

uint64_t sub_1C2ECD71C(unint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v17;

  if (a1 >> 62)
    goto LABEL_30;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1C2EF7884())
  {
    v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1C3BCC3B0](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        v15 = a2;
        goto LABEL_24;
      }
      v10 = sub_1C2EF744C();
      v11 = sub_1C2EF3E58(v10, v8, v9);
      MEMORY[0x1C3BCC080](v11);
      swift_bridgeObjectRelease();
      v12 = sub_1C2EF78C0();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(_QWORD *)(*(_QWORD *)&a2[v17] + 16))
        goto LABEL_23;
      swift_bridgeObjectRetain();
      sub_1C2EC907C(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      v14 = sub_1C2ED4DC8((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3)
        goto LABEL_31;
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_1C2ECDA68(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2ECDAB8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_key);
  OUTLINED_FUNCTION_8();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2ECDB64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_key);
  OUTLINED_FUNCTION_8();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2ECDBBC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C2ECDB64(v1, v2);
}

uint64_t (*sub_1C2ECDBF8())()
{
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

void AudioPlaybackCapability.__allocating_init(status:)(uint64_t a1)
{
  OUTLINED_FUNCTION_14();
  AudioPlaybackCapability.init(status:)(a1);
  OUTLINED_FUNCTION_5();
}

id AudioPlaybackCapability.init(status:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t inited;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for AudioPlaybackCapability();
  v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(inited + 32) = 0xD000000000000026;
  *(_QWORD *)(inited + 40) = 0x80000001C2EFB220;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_7());
  v7 = v5;
  *(_QWORD *)(inited + 48) = sub_1C2ED4C54(a1);
  v8 = sub_1C2EF73E0();
  sub_1C2EC93D8(v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C2EC9B48(0, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for AudioPlaybackCapability()
{
  return objc_opt_self();
}

void sub_1C2ECDE38()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap);
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_3_2();
  sub_1C2EC9CFC(v2, v3, v1);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    OUTLINED_FUNCTION_7();
    swift_dynamicCastClass();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1C2ECDEC4(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_3_2();
  sub_1C2ED4CA8(v2, v3, a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2ECDF10(unint64_t a1)
{
  void *v1;

  return sub_1C2ECD71C(a1, (char *)v1) & 1;
}

uint64_t static AudioPlaybackCapability.supportsSecureCoding.getter()
{
  return 1;
}

void AudioPlaybackCapability.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  AudioPlaybackCapability.init(coder:)(a1);
  OUTLINED_FUNCTION_5();
}

char *AudioPlaybackCapability.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AudioPlaybackCapability();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C2ECA764((uint64_t)a1);

  if (!*(_QWORD *)(*(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23AudioPlaybackCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id AudioPlaybackCapability.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_14(), sel_init);
}

void AudioPlaybackCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AudioPlaybackCapability.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioPlaybackCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2ECE204@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2ECDAB8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for AudioPlaybackCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioPlaybackCapability.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.key.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.key.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.__allocating_init(status:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.supportsAudioPlayback.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static AudioPlaybackCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.matches(descriptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of AudioPlaybackCapability.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

unint64_t OUTLINED_FUNCTION_3_2()
{
  return 0xD000000000000026;
}

void sub_1C2ECE310(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3130);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for RequestAnalyticsContext(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__swift_getEnumTagSinglePayload(a1, 1, v12) == 1)
  {
    sub_1C2ED485C(a1, &qword_1EF7D3130);
    sub_1C2ED3D84(a2, a3, (uint64_t)v8);
    swift_bridgeObjectRelease();
    sub_1C2ED485C((uint64_t)v8, &qword_1EF7D3130);
  }
  else
  {
    sub_1C2ED3D58(a1, (uint64_t)v11, type metadata accessor for RequestAnalyticsContext);
    sub_1C2ED3ECC((uint64_t)v11, a2, a3);
    swift_bridgeObjectRelease();
  }
}

SiriVirtualDeviceResolution::ExecutionInfo::Action_optional __swiftcall ExecutionInfo.Action.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 4;
  switch(rawValue)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v2 = 1;
      goto LABEL_6;
    case 2:
      v2 = 2;
      goto LABEL_6;
    case 3:
      v2 = 3;
LABEL_6:
      v3 = v2;
      break;
    case 4:
      break;
    case 5:
      v3 = 5;
      break;
    case 6:
      v3 = 6;
      break;
    case 7:
      v3 = 7;
      break;
    case 8:
      v3 = 8;
      break;
    case 9:
      v3 = 9;
      break;
    case 10:
      v3 = 10;
      break;
    case 11:
      v3 = 11;
      break;
    case 12:
      v3 = 12;
      break;
    case 13:
      v3 = 13;
      break;
    case 14:
      v3 = 14;
      break;
    case 15:
      v3 = 15;
      break;
    case 16:
      v3 = 16;
      break;
    case 17:
      v3 = 17;
      break;
    case 18:
      v3 = 18;
      break;
    case 19:
      v3 = 19;
      break;
    case 20:
      v3 = 20;
      break;
    case 21:
      v3 = 21;
      break;
    default:
      v3 = 22;
      break;
  }
  *v1 = v3;
  return (SiriVirtualDeviceResolution::ExecutionInfo::Action_optional)rawValue;
}

uint64_t sub_1C2ECE50C()
{
  unsigned __int8 *v0;

  return sub_1C2ECAFEC(*v0);
}

uint64_t sub_1C2ECE514(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_1C2ECB4FC(a1, *v1);
}

uint64_t sub_1C2ECE51C(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_1C2ECB0D0(a1, *v1);
}

SiriVirtualDeviceResolution::ExecutionInfo::Action_optional sub_1C2ECE524(Swift::Int *a1)
{
  return ExecutionInfo.Action.init(rawValue:)(*a1);
}

uint64_t ExecutionInfo.executionId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_9_1();
  return OUTLINED_FUNCTION_19_0(a1, v1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 16));
}

uint64_t ExecutionInfo.executionId.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_9_1();
  return OUTLINED_FUNCTION_19_0(v1, a1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 40));
}

uint64_t (*ExecutionInfo.executionId.modify())()
{
  return nullsub_1;
}

void ExecutionInfo.action.getter()
{
  _BYTE *v0;
  uint64_t v1;

  *v0 = *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_45() + 20));
  OUTLINED_FUNCTION_5();
}

uint64_t type metadata accessor for ExecutionInfo(uint64_t a1)
{
  return sub_1C2ED3BF0(a1, qword_1EF7D2E70);
}

void ExecutionInfo.action.setter()
{
  char v0;
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_53() + 20)) = v0;
  OUTLINED_FUNCTION_5();
}

uint64_t (*ExecutionInfo.action.modify())()
{
  type metadata accessor for ExecutionInfo(0);
  return nullsub_1;
}

void ExecutionInfo.quickStopActionResult.getter()
{
  _BYTE *v0;
  uint64_t v1;

  *v0 = *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_45() + 24));
  OUTLINED_FUNCTION_5();
}

void ExecutionInfo.quickStopActionResult.setter()
{
  char v0;
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(OUTLINED_FUNCTION_53() + 24)) = v0;
  OUTLINED_FUNCTION_5();
}

uint64_t (*ExecutionInfo.quickStopActionResult.modify())()
{
  type metadata accessor for ExecutionInfo(0);
  return nullsub_1;
}

void ExecutionInfo.init(executionId:action:quickStopActionResult:)(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *a2;
  v7 = *a3;
  v8 = type metadata accessor for ExecutionInfo(0);
  v9 = *(int *)(v8 + 24);
  v10 = OUTLINED_FUNCTION_9_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a4, a1, v10);
  *(_BYTE *)(a4 + *(int *)(v8 + 20)) = v6;
  *(_BYTE *)(a4 + v9) = v7;
  OUTLINED_FUNCTION_13_1();
}

BOOL static CrossDeviceCommandExecution.Result.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void CrossDeviceCommandExecution.Result.hash(into:)()
{
  sub_1C2EF79BC();
  OUTLINED_FUNCTION_5();
}

uint64_t CrossDeviceCommandExecution.Result.hashValue.getter()
{
  sub_1C2EF79B0();
  sub_1C2EF79BC();
  return sub_1C2EF79E0();
}

uint64_t sub_1C2ECE774()
{
  sub_1C2EF79B0();
  sub_1C2EF79BC();
  return sub_1C2EF79E0();
}

uint64_t CrossDeviceCommandExecution.FailureReason.asNSNumber.getter()
{
  return sub_1C2EF7584();
}

uint64_t CrossDeviceCommandExecution.FailureReason.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

SiriVirtualDeviceResolution::CrossDeviceCommandExecution::FailureReason_optional __swiftcall CrossDeviceCommandExecution.FailureReason.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (SiriVirtualDeviceResolution::CrossDeviceCommandExecution::FailureReason_optional)rawValue;
}

SiriVirtualDeviceResolution::CrossDeviceCommandExecution::FailureReason_optional sub_1C2ECE7D8(Swift::Int *a1)
{
  return CrossDeviceCommandExecution.FailureReason.init(rawValue:)(*a1);
}

void sub_1C2ECE7E0(uint64_t *a1@<X8>)
{
  *a1 = CrossDeviceCommandExecution.FailureReason.rawValue.getter();
  OUTLINED_FUNCTION_5();
}

SiriVirtualDeviceResolution::HomeKitTarget_optional __swiftcall HomeKitTarget.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 8;
  if ((unint64_t)rawValue < 8)
    v2 = rawValue;
  *v1 = v2;
  return (SiriVirtualDeviceResolution::HomeKitTarget_optional)rawValue;
}

SiriVirtualDeviceResolution::HomeKitTarget_optional sub_1C2ECE814(Swift::Int *a1)
{
  return HomeKitTarget.init(rawValue:)(*a1);
}

void sub_1C2ECE81C()
{
  DeviceResolutionAnalytics.logCommandExecution(_:)();
}

void DeviceResolutionAnalytics.logCommandExecution(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_2_1();
  if (qword_1EF7D29F8 != -1)
    v2 = swift_once();
  OUTLINED_FUNCTION_21(v2, (uint64_t)qword_1EF7D6058);
  v3 = (void *)sub_1C2EF7344();
  v4 = sub_1C2EF759C();
  if (OUTLINED_FUNCTION_32(v4))
  {
    *(_WORD *)OUTLINED_FUNCTION_24() = 0;
    OUTLINED_FUNCTION_23(&dword_1C2EC6000, v5, v6, "DeviceResolutionAnalytics#logCommandExecution() default implementation should not be used");
    OUTLINED_FUNCTION_3_3();
  }

  OUTLINED_FUNCTION_14_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_13_1();
}

void sub_1C2ECE8F0(SiriVirtualDeviceResolution::HomeKitTarget a1, uint64_t a2, uint64_t a3)
{
  DeviceResolutionAnalytics.selectHomeKitTarget(_:for:)(a1, *(Swift::String *)&a2);
}

Swift::Void __swiftcall DeviceResolutionAnalytics.selectHomeKitTarget(_:for:)(SiriVirtualDeviceResolution::HomeKitTarget _, Swift::String a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_2_1();
  if (qword_1EF7D29F8 != -1)
    v4 = swift_once();
  OUTLINED_FUNCTION_21(v4, (uint64_t)qword_1EF7D6058);
  v5 = (void *)sub_1C2EF7344();
  v6 = sub_1C2EF759C();
  if (OUTLINED_FUNCTION_32(v6))
  {
    *(_WORD *)OUTLINED_FUNCTION_24() = 0;
    OUTLINED_FUNCTION_23(&dword_1C2EC6000, v7, v8, "DeviceResolutionAnalytics#selectHomeKitTarget() default implementation should not be used");
    OUTLINED_FUNCTION_3_3();
  }

  OUTLINED_FUNCTION_14_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_13_1();
}

uint64_t sub_1C2ECE9C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for RequestAnalyticsContext(0) + 20));
  if (v1 && (v2 = *(_QWORD *)(v1 + 16)) != 0)
  {
    v3 = swift_bridgeObjectRetain() + 40;
    v4 = MEMORY[0x1E0DEE9E0];
    while (1)
    {
      v5 = *(id *)(v3 - 8);
      v6 = sub_1C2EF7584();
      if ((v4 & 0xC000000000000001) != 0)
      {
        if (v4 >= 0)
          v4 &= 0xFFFFFFFFFFFFFF8uLL;
        v7 = sub_1C2EF76E0();
        if (__OFADD__(v7, 1))
          goto LABEL_22;
        sub_1C2EEB304(v4, v7 + 1);
        v4 = v8;
      }
      swift_isUniquelyReferenced_nonNull_native();
      v9 = sub_1C2ECC4A0();
      if (__OFADD__(*(_QWORD *)(v4 + 16), (v10 & 1) == 0))
        break;
      v11 = v9;
      v12 = v10;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D31A0);
      if ((sub_1C2EF77D0() & 1) != 0)
      {
        v13 = sub_1C2ECC4A0();
        if ((v12 & 1) != (v14 & 1))
          goto LABEL_24;
        v11 = v13;
      }
      if ((v12 & 1) != 0)
      {
        v15 = *(_QWORD *)(v4 + 56);

        *(_QWORD *)(v15 + 8 * v11) = v6;
      }
      else
      {
        *(_QWORD *)(v4 + 8 * (v11 >> 6) + 64) |= 1 << v11;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v5;
        *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v11) = v6;
        v16 = *(_QWORD *)(v4 + 16);
        v17 = __OFADD__(v16, 1);
        v18 = v16 + 1;
        if (v17)
          goto LABEL_23;
        *(_QWORD *)(v4 + 16) = v18;
        v19 = v5;
      }
      v3 += 16;

      swift_bridgeObjectRelease();
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        return v4;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    sub_1C2ED4708(0, (unint64_t *)&qword_1EF7D2D40);
    result = sub_1C2EF7968();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E0];
  }
  return result;
}

void sub_1C2ECEBB0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = a1;

}

id sub_1C2ECEBBC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(void **)(v0 + 40);
  v2 = v1;
  if (!v1)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_currentContext);
    v4 = (void *)objc_opt_self();
    v5 = objc_msgSend(v4, sel_serviceName);
    if (!v5)
    {
      sub_1C2EF741C();
      v5 = (id)sub_1C2EF7410();
      swift_bridgeObjectRelease();
    }
    v2 = objc_msgSend(v3, sel_createXPCConnectionWithMachServiceName_options_, v5, 0);

    if (v2)
    {
      v6 = v2;
      v7 = objc_msgSend(v4, sel_xpcInterface);
      OUTLINED_FUNCTION_28((uint64_t)v7, sel_setRemoteObjectInterface_);

      v8 = MEMORY[0x1E0C809B0];
      OUTLINED_FUNCTION_47((uint64_t)&block_descriptor_29, MEMORY[0x1E0C809B0], 1107296256, v15, v17);
      v9 = OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_41();
      v10 = swift_release();
      OUTLINED_FUNCTION_28(v10, sel_setInvalidationHandler_);
      _Block_release(v7);

      OUTLINED_FUNCTION_47((uint64_t)&block_descriptor_32, v8, 1107296256, v16, v18);
      v11 = OUTLINED_FUNCTION_48();
      OUTLINED_FUNCTION_41();
      v12 = swift_release();
      OUTLINED_FUNCTION_28(v12, sel_setInterruptionHandler_);
      _Block_release(v7);

      objc_msgSend(v11, sel_resume);
    }
  }
  v13 = v1;
  return v2;
}

uint64_t sub_1C2ECEDA0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = OUTLINED_FUNCTION_41();
  v1(v2);
  return swift_release();
}

void sub_1C2ECEDC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  _QWORD v20[6];

  OUTLINED_FUNCTION_8_1();
  v3 = v2;
  v18 = v4;
  v19 = v5;
  v7 = v6;
  v8 = OUTLINED_FUNCTION_22();
  v9 = OUTLINED_FUNCTION_6_2(v8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_29();
  v11 = sub_1C2EF7350();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_2_1();
  if (qword_1EF7D29F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v11, (uint64_t)qword_1EF7D6058);
  OUTLINED_FUNCTION_39(v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
  v14 = sub_1C2EF7344();
  v15 = sub_1C2EF759C();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)OUTLINED_FUNCTION_24();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1C2EC6000, v14, v15, v18, v16, 2u);
    OUTLINED_FUNCTION_3_3();
  }

  OUTLINED_FUNCTION_40(*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
  v20[4] = v19;
  v20[5] = v7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 1107296256;
  v20[2] = sub_1C2ECEDA0;
  v20[3] = v3;
  v17 = _Block_copy(v20);
  swift_retain();
  OUTLINED_FUNCTION_30();
  sub_1C2ED4740(&qword_1EF7D2DD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_20_0(&qword_1EF7D2DE8);
  sub_1C2EF76B0();
  MEMORY[0x1C3BCC218](0, v1, v0, v17);
  _Block_release(v17);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_0_1();
}

void sub_1C2ECEFFC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), sel_invalidate);
  sub_1C2ECEBB0(0);
  OUTLINED_FUNCTION_5();
}

void sub_1C2ECF02C()
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[7];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42[7];

  OUTLINED_FUNCTION_8_1();
  v1 = v0;
  v3 = v2;
  v4 = OUTLINED_FUNCTION_22();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_52();
  v40 = v6;
  v7 = sub_1C2EF738C();
  v38 = *(_QWORD *)(v7 - 8);
  v39 = v7;
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_52();
  v37 = v9;
  v10 = type metadata accessor for CrossDeviceCommandExecution(0);
  v11 = *(_QWORD *)(v10 - 8);
  v33[6] = v10;
  v34 = v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)v33 - v15;
  v17 = OUTLINED_FUNCTION_31();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_2_1();
  if (qword_1EF7D29F8 != -1)
    swift_once();
  v19 = __swift_project_value_buffer(v17, (uint64_t)qword_1EF7D6058);
  OUTLINED_FUNCTION_39(v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16));
  v36 = v3;
  sub_1C2ED3D04(v3, (uint64_t)v16, type metadata accessor for CrossDeviceCommandExecution);
  v20 = sub_1C2EF7344();
  v21 = v18;
  v22 = sub_1C2EF7590();
  if (os_log_type_enabled(v20, v22))
  {
    v33[4] = v5;
    v23 = OUTLINED_FUNCTION_24();
    v33[5] = v4;
    v24 = (uint8_t *)v23;
    v25 = OUTLINED_FUNCTION_24();
    v33[3] = v0;
    v42[0] = v25;
    v33[2] = v21;
    *(_DWORD *)v24 = 136315138;
    v33[1] = v24 + 4;
    sub_1C2ED3D04((uint64_t)v16, (uint64_t)v14, type metadata accessor for CrossDeviceCommandExecution);
    v26 = sub_1C2EF7428();
    v41 = sub_1C2ED1D08(v26, v27, v42);
    sub_1C2EF7668();
    swift_bridgeObjectRelease();
    sub_1C2ED3D30((uint64_t)v16, type metadata accessor for CrossDeviceCommandExecution);
    _os_log_impl(&dword_1C2EC6000, v20, v22, "#hal logCommandExecution with execution: %s", v24, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_3();
  }
  sub_1C2ED3D30((uint64_t)v16, type metadata accessor for CrossDeviceCommandExecution);

  OUTLINED_FUNCTION_40(*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
  sub_1C2ED3D04(v36, (uint64_t)v14, type metadata accessor for CrossDeviceCommandExecution);
  v28 = (*(unsigned __int8 *)(v34 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = v1;
  sub_1C2ED3D58((uint64_t)v14, v29 + v28, type metadata accessor for CrossDeviceCommandExecution);
  v42[4] = (uint64_t)sub_1C2ED1C7C;
  v42[5] = v29;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 1107296256;
  v42[2] = (uint64_t)sub_1C2ECEDA0;
  v42[3] = (uint64_t)&block_descriptor;
  v30 = _Block_copy(v42);
  swift_retain();
  v31 = v37;
  sub_1C2EF7380();
  v41 = MEMORY[0x1E0DEE9D8];
  sub_1C2ED4740(&qword_1EF7D2DD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_20_0(&qword_1EF7D2DE8);
  v32 = v40;
  sub_1C2EF76B0();
  MEMORY[0x1C3BCC218](0, v31, v32, v30);
  _Block_release(v30);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v32, v4);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v31, v39);
  swift_release();
  OUTLINED_FUNCTION_0_1();
}

void sub_1C2ECF444(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  int EnumCaseMultiPayload;
  _QWORD *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int EnumTagSinglePayload;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  _QWORD *v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  os_log_t v76;
  id v77;
  NSObject *v78;
  os_log_type_t v79;
  uint64_t v80;
  id v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  id v94;
  NSObject *v95;
  os_log_type_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  _QWORD *v100;
  os_log_t v101;
  uint64_t v102;
  id v103;
  _QWORD *v104;
  char *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  os_log_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  __int128 aBlock;
  __int128 v118;
  uint64_t (*v119)(void *);
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123[5];

  v113 = a2;
  v109 = sub_1C2EF7338();
  v108 = *(_QWORD *)(v109 - 8);
  MEMORY[0x1E0C80A78](v109);
  v107 = (char *)&v103 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3130);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for RequestAnalyticsContext(0);
  MEMORY[0x1E0C80A78](v7);
  v106 = (uint64_t)&v103 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ExecutionInfo(0);
  v10 = MEMORY[0x1E0C80A78](v9);
  v112 = (char *)&v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v110 = (id *)((char *)&v103 - v13);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v103 - v14;
  v16 = type metadata accessor for CrossDeviceCommandExecution(0);
  MEMORY[0x1E0C80A78](v16);
  v18 = (uint64_t *)((char *)&v103 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = sub_1C2EF7350();
  v20 = *(_QWORD *)(v19 - 8);
  v115 = v19;
  v116 = v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v111 = (os_log_t)((char *)&v103 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = MEMORY[0x1E0C80A78](v21);
  v105 = (char *)&v103 - v24;
  v25 = MEMORY[0x1E0C80A78](v23);
  v104 = (id *)((char *)&v103 - v26);
  MEMORY[0x1E0C80A78](v25);
  v28 = (char *)&v103 - v27;
  v114 = a1;
  v29 = sub_1C2ECEBBC();
  if (v29)
  {
    v30 = v29;
    v119 = sub_1C2ED02DC;
    v120 = 0;
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v118 = sub_1C2EDDEF0;
    *((_QWORD *)&v118 + 1) = &block_descriptor_44;
    v31 = _Block_copy(&aBlock);
    v32 = objc_msgSend(v30, sel_remoteObjectProxyWithErrorHandler_, v31);
    _Block_release(v31);

    sub_1C2EF7698();
    swift_unknownObjectRelease();
  }
  else
  {
    aBlock = 0u;
    v118 = 0u;
  }
  sub_1C2ED4814((uint64_t)&aBlock, (uint64_t)v123);
  if (v123[3])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3190);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v103 = v122;
      sub_1C2ED3D04(v113, (uint64_t)v18, type metadata accessor for CrossDeviceCommandExecution);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload)
      {
        if (EnumCaseMultiPayload == 1)
        {
          v34 = v110;
          sub_1C2ED3D58((uint64_t)v18, (uint64_t)v110, type metadata accessor for ExecutionInfo);
          v35 = sub_1C2EF7314();
          v37 = v36;
          v38 = v114;
          swift_beginAccess();
          v39 = *(_QWORD *)(v38 + 24);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_1C2EC9D44(v35, v37, v39, (uint64_t)v6);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7);
          v41 = v116;
          v113 = v35;
          if (EnumTagSinglePayload == 1)
          {
            sub_1C2ED485C((uint64_t)v6, &qword_1EF7D3130);
            if (qword_1EF7D29F8 != -1)
              swift_once();
            v42 = v115;
            v43 = __swift_project_value_buffer(v115, (uint64_t)qword_1EF7D6058);
            v44 = v104;
            (*(void (**)(_QWORD *, uint64_t, uint64_t))(v41 + 16))(v104, v43, v42);
            swift_bridgeObjectRetain();
            v45 = v41;
            v46 = sub_1C2EF7344();
            v47 = sub_1C2EF759C();
            if (os_log_type_enabled(v46, v47))
            {
              v48 = (uint8_t *)swift_slowAlloc();
              v49 = (void *)swift_slowAlloc();
              v122 = v49;
              *(_DWORD *)v48 = 136315138;
              swift_bridgeObjectRetain();
              v121 = sub_1C2ED1D08(v113, v37, (uint64_t *)&v122);
              sub_1C2EF7668();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_1C2EC6000, v46, v47, "#hal logCrossDeviceCommandEnded Failed to find analytics context in cache - logCrossDeviceCommandStarted was not called for requestId: %s. Returning.", v48, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x1C3BCCB60](v49, -1, -1);
              MEMORY[0x1C3BCCB60](v48, -1, -1);
              swift_unknownObjectRelease();

              (*(void (**)(_QWORD *, uint64_t))(v45 + 8))(v104, v42);
            }
            else
            {
              swift_bridgeObjectRelease_n();
              swift_unknownObjectRelease();

              (*(void (**)(_QWORD *, uint64_t))(v45 + 8))(v44, v42);
            }
          }
          else
          {
            v84 = v106;
            sub_1C2ED3D58((uint64_t)v6, v106, type metadata accessor for RequestAnalyticsContext);
            v85 = (void *)sub_1C2EF7584();
            (*(void (**)(char *, uint64_t, uint64_t))(v108 + 16))(v107, v84, v109);
            sub_1C2ECE9C4();
            sub_1C2EF7314();
            v86 = (void *)sub_1C2EF7410();
            swift_bridgeObjectRelease();
            v87 = (void *)sub_1C2EF7584();
            v88 = (void *)sub_1C2EF7584();
            sub_1C2ED4708(0, (unint64_t *)&qword_1EF7D2D40);
            sub_1C2ED4708(0, &qword_1EF7D3610);
            sub_1C2ED418C();
            v89 = (void *)sub_1C2EF73BC();
            swift_bridgeObjectRelease();
            objc_msgSend(v103, sel_logCrossDeviceCommandEnded_action_actionResult_homeKitTarget_contextProximityPairs_, v86, v85, v87, v88, v89);

            if (qword_1EF7D29F8 != -1)
              swift_once();
            v90 = v115;
            v91 = __swift_project_value_buffer(v115, (uint64_t)qword_1EF7D6058);
            v92 = v116;
            v93 = v105;
            (*(void (**)(char *, uint64_t, uint64_t))(v116 + 16))(v105, v91, v90);
            swift_bridgeObjectRetain_n();
            v94 = v85;
            v95 = sub_1C2EF7344();
            v96 = sub_1C2EF7590();
            if (os_log_type_enabled(v95, v96))
            {
              v97 = swift_slowAlloc();
              v111 = v95;
              v98 = v97;
              v104 = (_QWORD *)swift_slowAlloc();
              v112 = (char *)swift_slowAlloc();
              v122 = v112;
              *(_DWORD *)v98 = 136315394;
              swift_bridgeObjectRetain();
              v121 = sub_1C2ED1D08(v113, v37, (uint64_t *)&v122);
              sub_1C2EF7668();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v98 + 12) = 2112;
              v121 = (uint64_t)v94;
              v99 = v94;
              v34 = v110;
              sub_1C2EF7668();
              v100 = v104;
              *v104 = v94;

              v101 = v111;
              _os_log_impl(&dword_1C2EC6000, v111, v96, "#hal logCrossDeviceCommandEnded for request: %s action:%@", (uint8_t *)v98, 0x16u);
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3198);
              swift_arrayDestroy();
              MEMORY[0x1C3BCCB60](v100, -1, -1);
              v102 = (uint64_t)v112;
              swift_arrayDestroy();
              MEMORY[0x1C3BCCB60](v102, -1, -1);
              MEMORY[0x1C3BCCB60](v98, -1, -1);

              (*(void (**)(char *, uint64_t))(v116 + 8))(v105, v115);
            }
            else
            {

              swift_bridgeObjectRelease_n();
              (*(void (**)(char *, uint64_t))(v92 + 8))(v93, v90);
            }
            sub_1C2ED1364();
            swift_bridgeObjectRelease();

            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v108 + 8))(v107, v109);
            sub_1C2ED3D30(v106, type metadata accessor for RequestAnalyticsContext);
          }
          v66 = (uint64_t)v34;
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2EB8);
          sub_1C2ED3D58((uint64_t)v18, (uint64_t)v112, type metadata accessor for ExecutionInfo);
          v67 = sub_1C2EF7314();
          v69 = v68;
          v70 = (void *)sub_1C2EF7584();
          v71 = (void *)sub_1C2EF7410();
          v72 = (void *)sub_1C2EF7584();
          objc_msgSend(v103, sel_logCrossDeviceCommandFailed_action_reason_, v71, v70, v72);

          v73 = v116;
          if (qword_1EF7D29F8 != -1)
            swift_once();
          v74 = v115;
          v75 = __swift_project_value_buffer(v115, (uint64_t)qword_1EF7D6058);
          v76 = v111;
          (*(void (**)(os_log_t, uint64_t, uint64_t))(v73 + 16))(v111, v75, v74);
          swift_bridgeObjectRetain_n();
          v77 = v70;
          v78 = sub_1C2EF7344();
          v79 = sub_1C2EF7590();
          if (os_log_type_enabled(v78, v79))
          {
            v80 = swift_slowAlloc();
            v110 = (_QWORD *)swift_slowAlloc();
            v113 = swift_slowAlloc();
            v123[0] = v113;
            *(_DWORD *)v80 = 136315394;
            swift_bridgeObjectRetain();
            v122 = (void *)sub_1C2ED1D08(v67, v69, v123);
            sub_1C2EF7668();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v80 + 12) = 2112;
            v122 = v77;
            v81 = v77;
            sub_1C2EF7668();
            v82 = v110;
            *v110 = v77;

            _os_log_impl(&dword_1C2EC6000, v78, v79, "#hal logCrossDeviceCommandFailed for request: %s action:%@", (uint8_t *)v80, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3198);
            swift_arrayDestroy();
            MEMORY[0x1C3BCCB60](v82, -1, -1);
            v83 = v113;
            swift_arrayDestroy();
            MEMORY[0x1C3BCCB60](v83, -1, -1);
            MEMORY[0x1C3BCCB60](v80, -1, -1);

            (*(void (**)(os_log_t, uint64_t))(v116 + 8))(v111, v115);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            (*(void (**)(os_log_t, uint64_t))(v73 + 8))(v76, v74);
          }
          sub_1C2ED1364();
          swift_bridgeObjectRelease();

          swift_unknownObjectRelease();
          v66 = (uint64_t)v112;
        }
      }
      else
      {
        v56 = *v18;
        v57 = v18[1];
        v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DD0);
        sub_1C2ED3D58((uint64_t)v18 + *(int *)(v58 + 64), (uint64_t)v15, type metadata accessor for ExecutionInfo);
        v59 = sub_1C2EF7314();
        v61 = v60;
        v62 = (void *)sub_1C2EF7584();
        LOBYTE(v123[0]) = 8;
        v63 = (_QWORD *)swift_allocObject();
        v63[2] = v114;
        v63[3] = v59;
        v64 = v103;
        v63[4] = v61;
        v63[5] = v64;
        v63[6] = v62;
        v63[7] = v56;
        v63[8] = v57;
        swift_retain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        v65 = v62;
        sub_1C2ED1574();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();

        swift_release();
        v66 = (uint64_t)v15;
      }
      sub_1C2ED3D30(v66, type metadata accessor for ExecutionInfo);
      goto LABEL_35;
    }
  }
  else
  {
    sub_1C2ED485C((uint64_t)v123, &qword_1EF7D2AA0);
  }
  v50 = v115;
  v51 = v116;
  if (qword_1EF7D29F8 != -1)
    swift_once();
  v52 = __swift_project_value_buffer(v50, (uint64_t)qword_1EF7D6058);
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v28, v52, v50);
  v53 = sub_1C2EF7344();
  v54 = sub_1C2EF759C();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v55 = 0;
    _os_log_impl(&dword_1C2EC6000, v53, v54, "#hal logCommandExecution Failed to get remote object", v55, 2u);
    MEMORY[0x1C3BCCB60](v55, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v51 + 8))(v28, v50);
LABEL_35:
  sub_1C2ED485C((uint64_t)&aBlock, &qword_1EF7D2AA0);
}

uint64_t sub_1C2ED02DC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD v16[3];
  uint64_t v17;

  v2 = sub_1C2EF7350();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EF7D29F8 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF7D6058);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = a1;
  v8 = a1;
  v9 = sub_1C2EF7344();
  v10 = sub_1C2EF759C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v17 = v12;
    *(_DWORD *)v11 = 136315138;
    v16[1] = v11 + 4;
    swift_getErrorValue();
    v13 = sub_1C2EF7974();
    v16[2] = sub_1C2ED1D08(v13, v14, &v17);
    sub_1C2EF7668();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C2EC6000, v9, v10, "#hal logCommandExecution Error reaching remote: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BCCB60](v12, -1, -1);
    MEMORY[0x1C3BCCB60](v11, -1, -1);
  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_1C2ED04F8(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, void *a5, unint64_t a6, uint64_t a7)
{
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
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  char *v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  char *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v50 = a5;
  v51 = a7;
  v12 = sub_1C2EF7350();
  v54 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x1E0C80A78](v12);
  v53 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v44 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3130);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for RequestAnalyticsContext(0);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v52 = a1;
  v23 = *(_QWORD *)(a1 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C2EC9D44(a2, a3, v23, (uint64_t)v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20) == 1)
  {
    sub_1C2ED485C((uint64_t)v19, &qword_1EF7D3130);
    if (qword_1EF7D29F8 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v12, (uint64_t)qword_1EF7D6058);
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v16, v24, v12);
    v25 = sub_1C2EF7344();
    v26 = sub_1C2EF759C();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1C2EC6000, v25, v26, "#hal logCommandExecution Failed to create analyticsContext for request.", v27, 2u);
      MEMORY[0x1C3BCCB60](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v54 + 8))(v16, v12);
  }
  else
  {
    v48 = a6;
    sub_1C2ED3D58((uint64_t)v19, (uint64_t)v22, type metadata accessor for RequestAnalyticsContext);
    v28 = a2;
    v29 = (void *)sub_1C2EF7410();
    sub_1C2EF7314();
    v30 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
    objc_msgSend(a4, sel_logCrossDeviceRequestLink_halRequestId_, v29, v30);

    sub_1C2EF7314();
    v31 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
    v32 = v50;
    objc_msgSend(a4, sel_logCrossDeviceCommandStarted_action_, v31, v50);

    if (qword_1EF7D29F8 != -1)
      swift_once();
    v47 = v22;
    v49 = a4;
    v33 = __swift_project_value_buffer(v12, (uint64_t)qword_1EF7D6058);
    v34 = v53;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v53, v33, v12);
    swift_bridgeObjectRetain_n();
    v35 = v32;
    v36 = sub_1C2EF7344();
    v37 = sub_1C2EF7590();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = swift_slowAlloc();
      v45 = (_QWORD *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v56 = v46;
      *(_DWORD *)v38 = 136315394;
      v50 = (void *)v12;
      swift_bridgeObjectRetain();
      v55 = sub_1C2ED1D08(v28, a3, &v56);
      sub_1C2EF7668();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v38 + 12) = 2112;
      v55 = (uint64_t)v35;
      v39 = v35;
      sub_1C2EF7668();
      v40 = v45;
      *v45 = v35;

      _os_log_impl(&dword_1C2EC6000, v36, v37, "#hal logCrossDeviceCommandStarted for request: %s action:%@", (uint8_t *)v38, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3198);
      swift_arrayDestroy();
      MEMORY[0x1C3BCCB60](v40, -1, -1);
      v41 = v46;
      swift_arrayDestroy();
      MEMORY[0x1C3BCCB60](v41, -1, -1);
      MEMORY[0x1C3BCCB60](v38, -1, -1);

      (*(void (**)(char *, void *))(v54 + 8))(v53, v50);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v34, v12);
    }
    if (v48)
      v42 = v48;
    else
      v42 = MEMORY[0x1E0DEE9D8];
    if (v51)
      v43 = v51;
    else
      v43 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C2ED0C2C(v28, a3, v42, v43, v49);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1C2ED3D30((uint64_t)v47, type metadata accessor for RequestAnalyticsContext);
  }
}

void sub_1C2ED0AA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  const void *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_8_1();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = OUTLINED_FUNCTION_22();
  v9 = OUTLINED_FUNCTION_6_2(v8);
  MEMORY[0x1E0C80A78](v9);
  v10 = OUTLINED_FUNCTION_1_2();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_10_1();
  v12 = *v7;
  v13 = OUTLINED_FUNCTION_11();
  *(_QWORD *)(v13 + 16) = v1;
  *(_QWORD *)(v13 + 24) = v5;
  *(_QWORD *)(v13 + 32) = v3;
  *(_BYTE *)(v13 + 40) = v12;
  OUTLINED_FUNCTION_27((uint64_t)sub_1C2ECEDA0);
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_30();
  sub_1C2ED4740(&qword_1EF7D2DD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_20_0(&qword_1EF7D2DE8);
  OUTLINED_FUNCTION_7_2();
  v14 = OUTLINED_FUNCTION_44();
  MEMORY[0x1C3BCC218](v14);
  _Block_release(v5);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_46(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_0_1();
}

void sub_1C2ED0BE8()
{
  sub_1C2ED1574();
}

void sub_1C2ED0C2C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v6 = v5;
  v19 = a1;
  if (a3 >> 62)
  {
    OUTLINED_FUNCTION_54();
    v10 = sub_1C2EF7884();
    a1 = swift_bridgeObjectRelease();
  }
  else
  {
    v10 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v10)
  {
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1C2EF77A0();
    if (v10 < 0)
    {
      __break(1u);
      return;
    }
    v11 = 0;
    do
    {
      if ((a3 & 0xC000000000000001) != 0)
        v12 = (id)MEMORY[0x1C3BCC3B0](v11, a3);
      else
        v12 = *(id *)(a3 + 8 * v11 + 32);
      v13 = v12;
      ++v11;
      objc_msgSend(objc_allocWithZone((Class)SVDDeviceUnit), sel_initWithDeviceUnit_, v12);

      sub_1C2EF7788();
      sub_1C2EF77AC();
      sub_1C2EF77B8();
      a1 = sub_1C2EF7794();
    }
    while (v10 != v11);
  }
  if (a5)
  {
    OUTLINED_FUNCTION_43(a1, &qword_1EF7D3140);
    v14 = (void *)sub_1C2EF74C4();
    v15 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_43(v15, &qword_1EF7D3148);
    v16 = (void *)sub_1C2EF74C4();
    v17 = (_QWORD *)OUTLINED_FUNCTION_11();
    v17[2] = v6;
    v17[3] = v19;
    v17[4] = a2;
    aBlock[4] = sub_1C2ED4180;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C2ED12C4;
    aBlock[3] = &block_descriptor_26;
    v18 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_release();
    objc_msgSend(a5, sel_getContextAndProximitySnapshotForCurrentRequestForDeviceUnits_serviceContexts_completion_, v14, v16, v18);
    _Block_release(v18);

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C2ED0EAC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  void (*v30)(id *, _QWORD);
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  NSObject *v36;
  os_log_type_t v37;
  unint64_t v38;
  uint8_t *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  id v49[4];
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;

  v41 = a2;
  v42 = a4;
  v46 = a3;
  v5 = sub_1C2EF7350();
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  MEMORY[0x1E0C80A78](v5);
  v43 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1C2ED4430(a1);
  if (!v7)
  {
LABEL_18:
    LOBYTE(v49[0]) = 8;
    v31 = v42;
    sub_1C2ED1574();
    swift_bridgeObjectRelease();
    v33 = v44;
    v32 = v45;
    if (qword_1EF7D29F8 != -1)
      swift_once();
    v34 = __swift_project_value_buffer(v32, (uint64_t)qword_1EF7D6058);
    v35 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v43, v34, v32);
    swift_bridgeObjectRetain_n();
    v36 = sub_1C2EF7344();
    v37 = sub_1C2EF7590();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = v31;
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = (void *)swift_slowAlloc();
      v49[0] = v40;
      *(_DWORD *)v39 = 136315138;
      swift_bridgeObjectRetain();
      v50 = sub_1C2ED1D08(v46, v38, (uint64_t *)v49);
      sub_1C2EF7668();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2EC6000, v36, v37, "#hal fetched and cached context snapshot and proximity for request: %s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BCCB60](v40, -1, -1);
      MEMORY[0x1C3BCCB60](v39, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v35, v32);
  }
  v8 = v7;
  v53 = MEMORY[0x1E0DEE9D8];
  sub_1C2EEC27C(0, v7 & ~(v7 >> 63), 0);
  result = sub_1C2ED4378(a1);
  v50 = result;
  v51 = v10;
  v52 = v11 & 1;
  if ((v8 & 0x8000000000000000) == 0)
  {
    v12 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 < 0)
      v12 = a1;
    v47 = v12;
    v48 = a1 & 0xC000000000000001;
    do
    {
      v14 = v50;
      v13 = v51;
      v15 = v52;
      sub_1C2ED4450(v49, v50, v51, v52, a1);
      v17 = v16;
      v18 = v49[0];
      v19 = objc_msgSend(v49[0], sel_integerValue, v41);

      v20 = v53;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1C2EEC27C(0, *(_QWORD *)(v20 + 16) + 1, 1);
        v20 = v53;
      }
      v22 = *(_QWORD *)(v20 + 16);
      v21 = *(_QWORD *)(v20 + 24);
      if (v22 >= v21 >> 1)
      {
        result = (uint64_t)sub_1C2EEC27C((char *)(v21 > 1), v22 + 1, 1);
        v20 = v53;
      }
      *(_QWORD *)(v20 + 16) = v22 + 1;
      v23 = v20 + 16 * v22;
      *(_QWORD *)(v23 + 32) = v17;
      *(_QWORD *)(v23 + 40) = v19;
      if (v48)
      {
        if ((v15 & 1) == 0)
          goto LABEL_25;
        if (sub_1C2EF780C())
          swift_isUniquelyReferenced_nonNull_native();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3158);
        v30 = (void (*)(id *, _QWORD))sub_1C2EF73EC();
        sub_1C2EF7860();
        v30(v49, 0);
      }
      else
      {
        sub_1C2ED41DC(v14, v13, v15, a1);
        v25 = v24;
        v27 = v26;
        v29 = v28;
        sub_1C2ED4678(v14, v13, v15);
        v50 = v25;
        v51 = v27;
        v52 = v29 & 1;
      }
      --v8;
    }
    while (v8);
    sub_1C2ED4678(v50, v51, v52);
    goto LABEL_18;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1C2ED12C4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1C2ED4708(0, (unint64_t *)&qword_1EF7D2D40);
  sub_1C2ED4708(0, &qword_1EF7D3610);
  sub_1C2ED418C();
  v2 = sub_1C2EF73C8();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_1C2ED1364()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;

  OUTLINED_FUNCTION_8_1();
  v3 = v0;
  v5 = v4;
  v7 = v6;
  v8 = OUTLINED_FUNCTION_22();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_10_1();
  v12 = (_QWORD *)OUTLINED_FUNCTION_11();
  v12[2] = v3;
  v12[3] = v7;
  v12[4] = v5;
  OUTLINED_FUNCTION_27((uint64_t)sub_1C2ECEDA0);
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_30();
  sub_1C2ED4740(&qword_1EF7D2DD8, v9, MEMORY[0x1E0DEF510]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_20_0(&qword_1EF7D2DE8);
  OUTLINED_FUNCTION_7_2();
  v13 = OUTLINED_FUNCTION_44();
  MEMORY[0x1C3BCC218](v13);
  _Block_release(v7);
  OUTLINED_FUNCTION_14_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  OUTLINED_FUNCTION_46(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_0_1();
}

uint64_t sub_1C2ED14B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3130);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for RequestAnalyticsContext(0);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v8);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C2ECE310((uint64_t)v7, a2, a3);
  return swift_endAccess();
}

void sub_1C2ED1574()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
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
  void *v20;

  OUTLINED_FUNCTION_8_1();
  v3 = v0;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = OUTLINED_FUNCTION_22();
  v17 = OUTLINED_FUNCTION_6_2(v16);
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_10_1();
  LOBYTE(v9) = *v9;
  v19 = OUTLINED_FUNCTION_11();
  *(_QWORD *)(v19 + 16) = v3;
  *(_QWORD *)(v19 + 24) = v15;
  *(_QWORD *)(v19 + 32) = v13;
  *(_QWORD *)(v19 + 40) = v11;
  *(_BYTE *)(v19 + 48) = (_BYTE)v9;
  *(_QWORD *)(v19 + 56) = v7;
  *(_QWORD *)(v19 + 64) = v5;
  v20 = OUTLINED_FUNCTION_27((uint64_t)sub_1C2ECEDA0);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1C2ED3CF4(v7);
  OUTLINED_FUNCTION_30();
  sub_1C2ED4740(&qword_1EF7D2DD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_20_0(&qword_1EF7D2DE8);
  sub_1C2EF76B0();
  MEMORY[0x1C3BCC218](0, v2, v1, v20);
  _Block_release(v20);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_0_1();
}

void sub_1C2ED170C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void (*a6)(uint64_t), uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  int *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);

  v24 = a7;
  v25 = a6;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3130);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v24 - v16;
  v18 = (int *)type metadata accessor for RequestAnalyticsContext(0);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v21 = *(_QWORD *)(a1 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C2EC9D44(a2, a3, v21, (uint64_t)v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, (uint64_t)v18) != 1)
  {
    sub_1C2ED3D58((uint64_t)v17, (uint64_t)v20, type metadata accessor for RequestAnalyticsContext);
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  sub_1C2EF732C();
  *(_QWORD *)&v20[v18[5]] = 0;
  v20[v18[6]] = 8;
  v20[v18[7]] = 22;
  sub_1C2ED485C((uint64_t)v17, &qword_1EF7D3130);
  if (a4)
  {
LABEL_5:
    v22 = v18[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v20[v22] = a4;
  }
LABEL_6:
  if (a5 != 8)
    v20[v18[6]] = a5;
  sub_1C2ED3D04((uint64_t)v20, (uint64_t)v15, type metadata accessor for RequestAnalyticsContext);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, (uint64_t)v18);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1C2ECE310((uint64_t)v15, a2, a3);
  v23 = swift_endAccess();
  if (v25)
    v25(v23);
  sub_1C2ED3D30((uint64_t)v20, type metadata accessor for RequestAnalyticsContext);
}

id *DeviceResolutionAnalyticsImpl.deinit()
{
  id *v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DeviceResolutionAnalyticsImpl.__deallocating_deinit()
{
  DeviceResolutionAnalyticsImpl.deinit();
  return swift_deallocClassInstance();
}

_QWORD *sub_1C2ED19B4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[12];
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_8_1();
  v14 = v1;
  v15 = v2;
  v3 = sub_1C2EF75C0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2EF75B4();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_29();
  sub_1C2EF738C();
  OUTLINED_FUNCTION_11_1();
  v10 = MEMORY[0x1E0C80A78](v9);
  v11 = MEMORY[0x1E0DEE9E0];
  v0[2] = 0;
  v0[3] = v11;
  v13[0] = OUTLINED_FUNCTION_43(v10, (unint64_t *)&unk_1EF7D3160);
  sub_1C2EF7380();
  v13[1] = MEMORY[0x1E0DEE9D8];
  sub_1C2ED4740((unint64_t *)&unk_1EF7D3A30, v7, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3170);
  sub_1C2ED477C((unint64_t *)&unk_1EF7D3A40, (uint64_t *)&unk_1EF7D3170);
  sub_1C2EF76B0();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF8D0], v3);
  v0[4] = sub_1C2EF75D8();
  v0[5] = 0;
  return v0;
}

void sub_1C2ED1B68()
{
  sub_1C2ECF02C();
}

void sub_1C2ED1B88()
{
  sub_1C2ED0AA4();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t type metadata accessor for CrossDeviceCommandExecution(uint64_t a1)
{
  return sub_1C2ED3BF0(a1, qword_1EF7D2F30);
}

uint64_t sub_1C2ED1BD4()
{
  int EnumCaseMultiPayload;
  uint64_t v1;

  type metadata accessor for CrossDeviceCommandExecution(0);
  OUTLINED_FUNCTION_38();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    goto LABEL_5;
  if (!EnumCaseMultiPayload)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DD0);
LABEL_5:
    v1 = OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_4_2(v1);
  }
  return swift_deallocObject();
}

void sub_1C2ED1C7C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for CrossDeviceCommandExecution(0) - 8) + 80);
  sub_1C2ECF444(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BCCAB8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1C2ED1D08(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_1C2ED1DD8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1C2ED47D8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1C2ED47D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C2ED1DD8(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_1C2ED1F2C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1C2EF7674();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1C2ED1FF0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_1C2EF777C();
    if (!v8)
    {
      result = sub_1C2EF786C();
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

void *sub_1C2ED1F2C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C2EF78B4();
  __break(1u);
  return result;
}

uint64_t sub_1C2ED1FF0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1C2ED2084(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1C2ED2258(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1C2ED2258((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C2ED2084(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_1C2EF7470();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x1E0DEE9D8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_6:
  v3 = sub_1C2ED21F4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_1C2EF7758();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_1C2EF78B4();
  __break(1u);
LABEL_14:
  result = sub_1C2EF786C();
  __break(1u);
  return result;
}

_QWORD *sub_1C2ED21F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3180);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1C2ED2258(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3180);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1C2ED23F0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C2ED232C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1C2ED232C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C2EF78B4();
  __break(1u);
  return result;
}

char *sub_1C2ED23F0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1C2EF78B4();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_1C2ED2470()
{
  return objectdestroy_2Tm();
}

void sub_1C2ED2478()
{
  sub_1C2ED0BE8();
}

unint64_t sub_1C2ED248C()
{
  unint64_t result;

  result = qword_1EF7D2DF0;
  if (!qword_1EF7D2DF0)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for ExecutionInfo.Action, &type metadata for ExecutionInfo.Action);
    atomic_store(result, (unint64_t *)&qword_1EF7D2DF0);
  }
  return result;
}

unint64_t sub_1C2ED24CC()
{
  unint64_t result;

  result = qword_1EF7D2DF8;
  if (!qword_1EF7D2DF8)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for ExecutionInfo.QuickStopActionResult, &type metadata for ExecutionInfo.QuickStopActionResult);
    atomic_store(result, (unint64_t *)&qword_1EF7D2DF8);
  }
  return result;
}

unint64_t sub_1C2ED250C()
{
  unint64_t result;

  result = qword_1EF7D2E00;
  if (!qword_1EF7D2E00)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for CrossDeviceCommandExecution.Result, &type metadata for CrossDeviceCommandExecution.Result);
    atomic_store(result, (unint64_t *)&qword_1EF7D2E00);
  }
  return result;
}

unint64_t sub_1C2ED254C()
{
  unint64_t result;

  result = qword_1EF7D2E08;
  if (!qword_1EF7D2E08)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for CrossDeviceCommandExecution.FailureReason, &type metadata for CrossDeviceCommandExecution.FailureReason);
    atomic_store(result, (unint64_t *)&qword_1EF7D2E08);
  }
  return result;
}

unint64_t sub_1C2ED258C()
{
  unint64_t result;

  result = qword_1EF7D2E10;
  if (!qword_1EF7D2E10)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for HomeKitTarget, &type metadata for HomeKitTarget);
    atomic_store(result, (unint64_t *)&qword_1EF7D2E10);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ExecutionInfo(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1C2EF7338();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
  }
  return a1;
}

uint64_t destroy for ExecutionInfo(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1C2EF7338();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for ExecutionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1C2EF7338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t assignWithCopy for ExecutionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1C2EF7338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for ExecutionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1C2EF7338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for ExecutionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1C2EF7338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionInfo()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1C2ED282C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_9_1();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    OUTLINED_FUNCTION_17_0(a1, a2, v4);
  else
    OUTLINED_FUNCTION_55();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ExecutionInfo()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1C2ED28B0(uint64_t a1, char a2, int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_DWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_9_1() - 8) + 84) == a3)
  {
    v7 = OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_16_0(v7, v8, v9, v10);
  }
  else
  {
    *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 4;
    OUTLINED_FUNCTION_55();
  }
}

uint64_t sub_1C2ED2904()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C2EF7338();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ExecutionInfo.Action(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xEB)
  {
    if (a2 + 21 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 21) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 22;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x16;
  v5 = v6 - 22;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ExecutionInfo.Action(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 21 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 21) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEA)
    return ((uint64_t (*)(void))((char *)&loc_1C2ED2A54 + 4 * byte_1C2EF95EB[v4]))();
  *a1 = a2 + 21;
  return ((uint64_t (*)(void))((char *)sub_1C2ED2A88 + 4 * byte_1C2EF95E6[v4]))();
}

uint64_t sub_1C2ED2A88(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED2A90(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2ED2A98);
  return result;
}

uint64_t sub_1C2ED2AA4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2ED2AACLL);
  *(_BYTE *)result = a2 + 21;
  return result;
}

uint64_t sub_1C2ED2AB0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED2AB8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for ExecutionInfo.Action()
{
  OUTLINED_FUNCTION_26();
}

void type metadata accessor for ExecutionInfo.QuickStopActionResult()
{
  OUTLINED_FUNCTION_26();
}

_QWORD *initializeBufferWithCopyOfBuffer for CrossDeviceCommandExecution(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;

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
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v11 = sub_1C2EF7338();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
      v12 = type metadata accessor for ExecutionInfo(0);
      *((_BYTE *)a1 + *(int *)(v12 + 20)) = *((_BYTE *)a2 + *(int *)(v12 + 20));
      *((_BYTE *)a1 + *(int *)(v12 + 24)) = *((_BYTE *)a2 + *(int *)(v12 + 24));
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2EB8);
      *((_BYTE *)a1 + *(int *)(v13 + 48)) = *((_BYTE *)a2 + *(int *)(v13 + 48));
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v7 = sub_1C2EF7338();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = type metadata accessor for ExecutionInfo(0);
      *((_BYTE *)a1 + *(int *)(v8 + 20)) = *((_BYTE *)a2 + *(int *)(v8 + 20));
      *((_BYTE *)a1 + *(int *)(v8 + 24)) = *((_BYTE *)a2 + *(int *)(v8 + 24));
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2EB0);
      *((_BYTE *)a1 + *(int *)(v9 + 48)) = *((_BYTE *)a2 + *(int *)(v9 + 48));
    }
    else
    {
      v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DD0) + 64);
      v16 = (char *)a1 + v15;
      v17 = (char *)a2 + v15;
      v18 = sub_1C2EF7338();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
      v19 = type metadata accessor for ExecutionInfo(0);
      v16[*(int *)(v19 + 20)] = v17[*(int *)(v19 + 20)];
      v16[*(int *)(v19 + 24)] = v17[*(int *)(v19 + 24)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for CrossDeviceCommandExecution(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result != 2 && (_DWORD)result != 1)
  {
    if ((_DWORD)result)
      return result;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DD0) + 64);
  }
  v3 = sub_1C2EF7338();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

_QWORD *initializeWithCopy for CrossDeviceCommandExecution(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v8 = sub_1C2EF7338();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    v9 = type metadata accessor for ExecutionInfo(0);
    *((_BYTE *)a1 + *(int *)(v9 + 20)) = *((_BYTE *)a2 + *(int *)(v9 + 20));
    *((_BYTE *)a1 + *(int *)(v9 + 24)) = *((_BYTE *)a2 + *(int *)(v9 + 24));
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2EB8);
    *((_BYTE *)a1 + *(int *)(v10 + 48)) = *((_BYTE *)a2 + *(int *)(v10 + 48));
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v5 = sub_1C2EF7338();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    v6 = type metadata accessor for ExecutionInfo(0);
    *((_BYTE *)a1 + *(int *)(v6 + 20)) = *((_BYTE *)a2 + *(int *)(v6 + 20));
    *((_BYTE *)a1 + *(int *)(v6 + 24)) = *((_BYTE *)a2 + *(int *)(v6 + 24));
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2EB0);
    *((_BYTE *)a1 + *(int *)(v7 + 48)) = *((_BYTE *)a2 + *(int *)(v7 + 48));
  }
  else
  {
    v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DD0) + 64);
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = sub_1C2EF7338();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = type metadata accessor for ExecutionInfo(0);
    v13[*(int *)(v16 + 20)] = v14[*(int *)(v16 + 20)];
    v13[*(int *)(v16 + 24)] = v14[*(int *)(v16 + 24)];
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for CrossDeviceCommandExecution(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_1C2ED3D30((uint64_t)a1, type metadata accessor for CrossDeviceCommandExecution);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v8 = sub_1C2EF7338();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = type metadata accessor for ExecutionInfo(0);
      *((_BYTE *)a1 + *(int *)(v9 + 20)) = *((_BYTE *)a2 + *(int *)(v9 + 20));
      *((_BYTE *)a1 + *(int *)(v9 + 24)) = *((_BYTE *)a2 + *(int *)(v9 + 24));
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2EB8);
      *((_BYTE *)a1 + *(int *)(v10 + 48)) = *((_BYTE *)a2 + *(int *)(v10 + 48));
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v5 = sub_1C2EF7338();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
      v6 = type metadata accessor for ExecutionInfo(0);
      *((_BYTE *)a1 + *(int *)(v6 + 20)) = *((_BYTE *)a2 + *(int *)(v6 + 20));
      *((_BYTE *)a1 + *(int *)(v6 + 24)) = *((_BYTE *)a2 + *(int *)(v6 + 24));
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2EB0);
      *((_BYTE *)a1 + *(int *)(v7 + 48)) = *((_BYTE *)a2 + *(int *)(v7 + 48));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DD0) + 64);
      v12 = (char *)a1 + v11;
      v13 = (char *)a2 + v11;
      v14 = sub_1C2EF7338();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
      v15 = type metadata accessor for ExecutionInfo(0);
      v12[*(int *)(v15 + 20)] = v13[*(int *)(v15 + 20)];
      v12[*(int *)(v15 + 24)] = v13[*(int *)(v15 + 24)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for CrossDeviceCommandExecution(_OWORD *a1, _OWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v8 = sub_1C2EF7338();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    v9 = type metadata accessor for ExecutionInfo(0);
    *((_BYTE *)a1 + *(int *)(v9 + 20)) = *((_BYTE *)a2 + *(int *)(v9 + 20));
    *((_BYTE *)a1 + *(int *)(v9 + 24)) = *((_BYTE *)a2 + *(int *)(v9 + 24));
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2EB8);
    *((_BYTE *)a1 + *(int *)(v10 + 48)) = *((_BYTE *)a2 + *(int *)(v10 + 48));
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v5 = sub_1C2EF7338();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    v6 = type metadata accessor for ExecutionInfo(0);
    *((_BYTE *)a1 + *(int *)(v6 + 20)) = *((_BYTE *)a2 + *(int *)(v6 + 20));
    *((_BYTE *)a1 + *(int *)(v6 + 24)) = *((_BYTE *)a2 + *(int *)(v6 + 24));
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2EB0);
    *((_BYTE *)a1 + *(int *)(v7 + 48)) = *((_BYTE *)a2 + *(int *)(v7 + 48));
  }
  else
  {
    *a1 = *a2;
    v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DD0) + 64);
    v12 = (char *)a1 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_1C2EF7338();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
    v15 = type metadata accessor for ExecutionInfo(0);
    v12[*(int *)(v15 + 20)] = v13[*(int *)(v15 + 20)];
    v12[*(int *)(v15 + 24)] = v13[*(int *)(v15 + 24)];
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_OWORD *assignWithTake for CrossDeviceCommandExecution(_OWORD *a1, _OWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_1C2ED3D30((uint64_t)a1, type metadata accessor for CrossDeviceCommandExecution);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v8 = sub_1C2EF7338();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      v9 = type metadata accessor for ExecutionInfo(0);
      *((_BYTE *)a1 + *(int *)(v9 + 20)) = *((_BYTE *)a2 + *(int *)(v9 + 20));
      *((_BYTE *)a1 + *(int *)(v9 + 24)) = *((_BYTE *)a2 + *(int *)(v9 + 24));
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2EB8);
      *((_BYTE *)a1 + *(int *)(v10 + 48)) = *((_BYTE *)a2 + *(int *)(v10 + 48));
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v5 = sub_1C2EF7338();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
      v6 = type metadata accessor for ExecutionInfo(0);
      *((_BYTE *)a1 + *(int *)(v6 + 20)) = *((_BYTE *)a2 + *(int *)(v6 + 20));
      *((_BYTE *)a1 + *(int *)(v6 + 24)) = *((_BYTE *)a2 + *(int *)(v6 + 24));
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2EB0);
      *((_BYTE *)a1 + *(int *)(v7 + 48)) = *((_BYTE *)a2 + *(int *)(v7 + 48));
    }
    else
    {
      *a1 = *a2;
      v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DD0) + 64);
      v12 = (char *)a1 + v11;
      v13 = (char *)a2 + v11;
      v14 = sub_1C2EF7338();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
      v15 = type metadata accessor for ExecutionInfo(0);
      v12[*(int *)(v15 + 20)] = v13[*(int *)(v15 + 20)];
      v12[*(int *)(v15 + 24)] = v13[*(int *)(v15 + 24)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1C2ED33B0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1C2ED33C0()
{
  uint64_t result;
  unint64_t v1;
  char v2;
  char v3;
  char v4;
  char *v5;
  char *v6;
  char *v7;

  result = type metadata accessor for ExecutionInfo(319);
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v5 = &v4;
    swift_getTupleTypeLayout2();
    v6 = &v3;
    swift_getTupleTypeLayout2();
    v7 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CrossDeviceCommandExecution.Result(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C2ED34CC + 4 * byte_1C2EF95F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1C2ED3500 + 4 * byte_1C2EF95F0[v4]))();
}

uint64_t sub_1C2ED3500(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED3508(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2ED3510);
  return result;
}

uint64_t sub_1C2ED351C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2ED3524);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1C2ED3528(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED3530(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for CrossDeviceCommandExecution.Result()
{
  OUTLINED_FUNCTION_26();
}

uint64_t _s27SiriVirtualDeviceResolution13ExecutionInfoV21QuickStopActionResultOwet_0(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFD)
  {
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
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s27SiriVirtualDeviceResolution13ExecutionInfoV21QuickStopActionResultOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C2ED361C + 4 * byte_1C2EF95FF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1C2ED3650 + 4 * byte_1C2EF95FA[v4]))();
}

uint64_t sub_1C2ED3650(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED3658(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2ED3660);
  return result;
}

uint64_t sub_1C2ED366C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2ED3674);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1C2ED3678(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED3680(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for CrossDeviceCommandExecution.FailureReason()
{
  OUTLINED_FUNCTION_26();
}

uint64_t getEnumTagSinglePayload for HomeKitTarget(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 7) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HomeKitTarget(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_1C2ED376C + 4 * byte_1C2EF9609[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1C2ED37A0 + 4 * byte_1C2EF9604[v4]))();
}

uint64_t sub_1C2ED37A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED37A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2ED37B0);
  return result;
}

uint64_t sub_1C2ED37BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2ED37C4);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1C2ED37C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED37D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for HomeKitTarget()
{
  OUTLINED_FUNCTION_26();
}

uint64_t dispatch thunk of DeviceResolutionAnalytics.logCommandExecution(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DeviceResolutionAnalytics.selectHomeKitTarget(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t type metadata accessor for DeviceResolutionAnalyticsImpl()
{
  return objc_opt_self();
}

uint64_t method lookup function for DeviceResolutionAnalyticsImpl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DeviceResolutionAnalyticsImpl.logCommandExecution(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of DeviceResolutionAnalyticsImpl.selectHomeKitTarget(_:for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

_QWORD *sub_1C2ED383C(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1C2EF7338();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1C2ED38DC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1C2EF7338();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2ED3920(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1C2EF7338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1C2ED3994(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;

  v6 = sub_1C2EF7338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1C2ED3A18(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1C2EF7338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1C2ED3A88(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1C2EF7338();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  v7 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t sub_1C2ED3B00()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1C2ED3B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_9_1();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    OUTLINED_FUNCTION_17_0(a1, a2, v4);
  else
    OUTLINED_FUNCTION_55();
}

uint64_t sub_1C2ED3B7C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1C2ED3B88(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_DWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_9_1() - 8) + 84) == a3)
  {
    v7 = OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_16_0(v7, v8, v9, v10);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
    OUTLINED_FUNCTION_55();
  }
}

uint64_t type metadata accessor for RequestAnalyticsContext(uint64_t a1)
{
  return sub_1C2ED3BF0(a1, qword_1EF7D30F0);
}

uint64_t sub_1C2ED3BF0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1C2ED3C20()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C2EF7338();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1C2ED3CA4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_51();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 56))
    swift_release();
  return swift_deallocObject();
}

void sub_1C2ED3CE0()
{
  uint64_t v0;

  sub_1C2ED170C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48), *(void (**)(uint64_t))(v0 + 56), *(_QWORD *)(v0 + 64));
}

uint64_t sub_1C2ED3CF4(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void sub_1C2ED3D04(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_34(a1, a2, a3);
  OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_5();
}

void sub_1C2ED3D30(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_4_2(v2);
  OUTLINED_FUNCTION_5();
}

void sub_1C2ED3D58(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_34(a1, a2, a3);
  OUTLINED_FUNCTION_42(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2ED3D84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1C2EC907C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v14 = *v4;
    *v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3138);
    sub_1C2EF77D0();
    swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v14 + 56);
    v11 = type metadata accessor for RequestAnalyticsContext(0);
    sub_1C2ED3D58(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v8, a3, type metadata accessor for RequestAnalyticsContext);
    sub_1C2EF77DC();
    *v4 = v14;
    swift_bridgeObjectRelease();
    return __swift_storeEnumTagSinglePayload(a3, 0, 1, v11);
  }
  else
  {
    v13 = type metadata accessor for RequestAnalyticsContext(0);
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v13);
  }
}

uint64_t sub_1C2ED3ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_1C2ED3F48(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2ED3F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1C2EC907C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3138);
  if ((sub_1C2EF77D0() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1C2EC907C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_1C2EF7968();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    v17 = v16 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for RequestAnalyticsContext(0) - 8) + 72) * v11;
    return sub_1C2ED40F8(a1, v17);
  }
  else
  {
    sub_1C2ED4068(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

void sub_1C2ED4068(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = type metadata accessor for RequestAnalyticsContext(0);
  sub_1C2ED3D58(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, type metadata accessor for RequestAnalyticsContext);
  v11 = a5[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a5[2] = v13;
}

uint64_t sub_1C2ED40F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RequestAnalyticsContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2ED4140()
{
  uint64_t *v0;

  return sub_1C2ED14B0(v0[2], v0[3], v0[4]);
}

uint64_t objectdestroy_2Tm()
{
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_51();
  return swift_deallocObject();
}

uint64_t sub_1C2ED4180(uint64_t a1)
{
  uint64_t v1;

  return sub_1C2ED0EAC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

unint64_t sub_1C2ED418C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF7D3150;
  if (!qword_1EF7D3150)
  {
    v1 = sub_1C2ED4708(255, (unint64_t *)&qword_1EF7D2D40);
    result = MEMORY[0x1C3BCCAC4](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF7D3150);
  }
  return result;
}

void sub_1C2ED41DC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  char v6;
  char v7;
  void *v8;

  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(_BYTE *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      {
        sub_1C2EF76BC();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (sub_1C2EF7818() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_1C2EF7824();
  sub_1C2ED4684(a1, a2, 1);
  sub_1C2ED4708(0, (unint64_t *)&qword_1EF7D2D40);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_1C2ECC4A0();
  v7 = v6;

  if ((v7 & 1) != 0)
  {
    sub_1C2EF7800();
    sub_1C2EF783C();
    sub_1C2ED4678(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_1C2ED4378(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

  if ((a1 & 0xC000000000000001) != 0)
    return sub_1C2EF77E8();
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v1 = 1 << v5;
  if (v6 < 7)
    return v1;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
  {
    v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  v3 = 64;
  for (i = 10; i - 8 < (unint64_t)(v1 + 63) >> 6; ++i)
  {
    v2 = *(_QWORD *)(a1 + 8 * i);
    v3 += 64;
    if (v2)
      return __clz(__rbit64(v2)) + v3;
  }
  return v1;
}

uint64_t sub_1C2ED4430(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
    return sub_1C2EF76E0();
  else
    return *(_QWORD *)(a1 + 16);
}

void sub_1C2ED4450(_QWORD *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  uint64_t v6;
  char v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v6 = a2;
  if ((a5 & 0xC000000000000001) != 0)
  {
    if ((a4 & 1) != 0)
    {
      sub_1C2EF7848();
      sub_1C2ED4708(0, (unint64_t *)&qword_1EF7D2D40);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_1C2ED4708(0, &qword_1EF7D3610);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v13;
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_18;
  }
  if ((a4 & 1) != 0)
  {
LABEL_10:
    if (sub_1C2EF7818() == *(_DWORD *)(a5 + 36))
    {
      sub_1C2EF7824();
      sub_1C2ED4708(0, (unint64_t *)&qword_1EF7D2D40);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      v6 = sub_1C2ECC4A0();
      v9 = v8;

      if ((v9 & 1) != 0)
        goto LABEL_12;
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      return;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  v10 = *(void **)(*(_QWORD *)(a5 + 48) + 8 * v6);
  v11 = *(void **)(*(_QWORD *)(a5 + 56) + 8 * v6);
  *a1 = v11;
  v10;
  v12 = v11;
}

uint64_t sub_1C2ED4678(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1C2ED4684(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

void sub_1C2ED4690()
{
  sub_1C2ECEDC8();
}

void sub_1C2ED46C0()
{
  sub_1C2ECEDC8();
}

void sub_1C2ED46F0()
{
  uint64_t v0;

  sub_1C2ECEFFC(v0);
}

uint64_t sub_1C2ED4708(uint64_t a1, unint64_t *a2)
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

void sub_1C2ED4740(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x1C3BCCAC4](a3, v5), a1);
  }
  OUTLINED_FUNCTION_5();
}

void sub_1C2ED477C(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x1C3BCCAC4](MEMORY[0x1E0DEAF38], v3), a1);
  }
  OUTLINED_FUNCTION_5();
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

uint64_t sub_1C2ED47D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C2ED4814(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2AA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C2ED485C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_2(v2);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2ED4884()
{
  uint64_t v0;

  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_51();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1C2ED48C8()
{
  uint64_t v0;

  sub_1C2ED04F8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(void **)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_1C2EF738C();
}

void OUTLINED_FUNCTION_3_3()
{
  JUMPOUT(0x1C3BCCB60);
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_6_2(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 144) = *(_QWORD *)(result - 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_1C2EF76B0();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return sub_1C2EF7338();
}

uint64_t OUTLINED_FUNCTION_14_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_16_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_17_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_19_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

void OUTLINED_FUNCTION_20_0(unint64_t *a1)
{
  uint64_t *v1;

  sub_1C2ED477C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_1C2EF7374();
}

void OUTLINED_FUNCTION_23(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return objectdestroy_2Tm();
}

void *OUTLINED_FUNCTION_27@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_QWORD *)(v2 - 104) = v1;
  return _Block_copy((const void *)(v2 - 128));
}

id OUTLINED_FUNCTION_28(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_29()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_1C2EF7380();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return sub_1C2EF7350();
}

BOOL OUTLINED_FUNCTION_32(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_34(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_36()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 160) + 8))(v0, *(_QWORD *)(v1 - 152));
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_39@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, v3);
}

uint64_t OUTLINED_FUNCTION_40@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_42@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_43(uint64_t a1, unint64_t *a2)
{
  return sub_1C2ED4708(0, a2);
}

uint64_t OUTLINED_FUNCTION_44()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_45()
{
  return type metadata accessor for ExecutionInfo(0);
}

uint64_t OUTLINED_FUNCTION_46@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void *OUTLINED_FUNCTION_47@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = v5;
  a5 = a1;
  return _Block_copy(&a2);
}

id OUTLINED_FUNCTION_48()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_49()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return type metadata accessor for ExecutionInfo(0);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_bridgeObjectRetain();
}

char *sub_1C2ED4C54(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *result;
  objc_super v10;

  *(_QWORD *)&v1[OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus] = 0;
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for BooleanCapabilityPrimitive();
  result = (char *)OUTLINED_FUNCTION_2_2((uint64_t)v10.super_class, sel_init, v3, v4, v5, v6, v7, v8, v10);
  *(_QWORD *)&result[OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus] = a1;
  return result;
}

id sub_1C2ED4CA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t inited;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D31F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9BC0;
  v7 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 32) = objc_msgSend(v7, sel_initWithInteger_, a3);
  sub_1C2EF74E8();
  v8 = inited;
  if (inited >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = sub_1C2EF7884();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = *(_QWORD *)((inited & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v9)
  {
    sub_1C2ED5348(v8);
    v11 = v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    v11 = MEMORY[0x1E0DEE9E8];
  }
  v12 = objc_allocWithZone((Class)type metadata accessor for CapabilityDescription());
  return CapabilityDescription.init(key:valueSet:)(a1, a2, v11);
}

uint64_t sub_1C2ED4DC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  char v4;
  id v6;
  char v7;

  v2 = *(_QWORD *)(a1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet);
  if (!v2)
    return 0;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, 0);
  v4 = sub_1C2EDDF28(v3, v2);

  if ((v4 & 1) != 0)
    return 1;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, *(_QWORD *)(v1 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus));
  v7 = sub_1C2EDDF28(v6, v2);

  return v7 & 1;
}

uint64_t sub_1C2ED4E80()
{
  return 1;
}

void sub_1C2ED4E88(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus);
  v4 = (id)OUTLINED_FUNCTION_0_2();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v3, v4);

}

id sub_1C2ED4F30(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  objc_super v18;

  v3 = OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus;
  *(_QWORD *)&v1[OBJC_IVAR___SVDBooleanCapabilityPrimitive_supportStatus] = 0;
  v4 = v1;
  v5 = (void *)OUTLINED_FUNCTION_0_2();
  v6 = objc_msgSend(a1, sel_decodeIntegerForKey_, v5);

  v7 = CapabilitySupportStatus.init(rawValue:)((unint64_t)v6);
  if ((v8 & 1) != 0)
    v9 = 0;
  else
    v9 = v7;
  *(_QWORD *)&v1[v3] = v9;

  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for BooleanCapabilityPrimitive();
  v16 = OUTLINED_FUNCTION_2_2((uint64_t)v18.super_class, sel_init, v10, v11, v12, v13, v14, v15, v18);

  return v16;
}

void sub_1C2ED4FF8()
{
  OUTLINED_FUNCTION_3_4();
  __break(1u);
}

id sub_1C2ED5028()
{
  return sub_1C2ED52F8(type metadata accessor for BooleanCapabilityPrimitive);
}

char *sub_1C2ED5034(double a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *result;
  objc_super v10;

  *(_QWORD *)&v1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value] = 0;
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for ContinuousNumericCapabilityPrimitive();
  result = (char *)OUTLINED_FUNCTION_2_2((uint64_t)v10.super_class, sel_init, v3, v4, v5, v6, v7, v8, v10);
  *(double *)&result[OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value] = a1;
  return result;
}

id sub_1C2ED5088(id result, uint64_t a2, double a3, double a4)
{
  uint64_t v7;

  if (a3 > a4)
  {
    __break(1u);
  }
  else
  {
    v7 = (uint64_t)result;
    objc_allocWithZone((Class)type metadata accessor for CapabilityDescription());
    swift_bridgeObjectRetain();
    return CapabilityDescription.init(key:valueRange:)(v7, a2, a3, a4);
  }
  return result;
}

BOOL sub_1C2ED50FC(uint64_t a1)
{
  uint64_t v1;
  double *v2;
  double v3;

  v2 = (double *)(a1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange);
  if ((*(_BYTE *)(a1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange + 16) & 1) != 0)
    return 0;
  v3 = *(double *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value);
  return *v2 <= v3 && v3 <= v2[1];
}

void sub_1C2ED514C(void *a1)
{
  uint64_t v1;
  double v3;
  id v4;

  v3 = *(double *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value);
  v4 = (id)OUTLINED_FUNCTION_1_3();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v4, v3);

}

id sub_1C2ED51FC(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  objc_super v16;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value;
  *(_QWORD *)&v1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive_value] = 0;
  v4 = v1;
  v5 = (void *)OUTLINED_FUNCTION_1_3();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v5);
  v7 = v6;

  *(_QWORD *)&v1[v3] = v7;
  v16.receiver = v4;
  v16.super_class = (Class)type metadata accessor for ContinuousNumericCapabilityPrimitive();
  v14 = OUTLINED_FUNCTION_2_2((uint64_t)v16.super_class, sel_init, v8, v9, v10, v11, v12, v13, v16);

  return v14;
}

void sub_1C2ED52BC()
{
  OUTLINED_FUNCTION_3_4();
  __break(1u);
}

id sub_1C2ED52EC()
{
  return sub_1C2ED52F8(type metadata accessor for ContinuousNumericCapabilityPrimitive);
}

id sub_1C2ED52F8(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ContinuousNumericCapabilityPrimitive()
{
  return objc_opt_self();
}

void sub_1C2ED5348(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  BOOL v10;
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
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1C2EF7884();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D31F8);
      v3 = sub_1C2EF7740();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_1C2EF7884();
      swift_bridgeObjectRelease();
      if (!v4)
      {
LABEL_25:
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x1E0DEE9E8];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    goto LABEL_25;
LABEL_9:
  v6 = 0;
  v7 = v3 + 56;
  v27 = v1;
  v28 = v1 & 0xC000000000000001;
  v24 = v1 + 32;
  v25 = v1 & 0xFFFFFFFFFFFFFF8;
  v26 = v4;
  while (1)
  {
    if (v28)
    {
      v8 = (id)MEMORY[0x1C3BCC3B0](v6, v1);
    }
    else
    {
      if (v6 >= *(_QWORD *)(v25 + 16))
        goto LABEL_28;
      v8 = *(id *)(v24 + 8 * v6);
    }
    v9 = v8;
    v10 = __OFADD__(v6++, 1);
    if (v10)
      break;
    v11 = sub_1C2EF7638();
    v12 = -1 << *(_BYTE *)(v3 + 32);
    v13 = v11 & ~v12;
    v14 = v13 >> 6;
    v15 = *(_QWORD *)(v7 + 8 * (v13 >> 6));
    v16 = 1 << v13;
    if (((1 << v13) & v15) != 0)
    {
      sub_1C2ED5590();
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_1C2EF7644();

      if ((v18 & 1) != 0)
      {
LABEL_20:

        v4 = v26;
        v1 = v27;
        goto LABEL_24;
      }
      v19 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v19;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v7 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if ((v15 & (1 << v13)) == 0)
          break;
        v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v21 = sub_1C2EF7644();

        if ((v21 & 1) != 0)
          goto LABEL_20;
      }
      v4 = v26;
      v1 = v27;
    }
    *(_QWORD *)(v7 + 8 * v14) = v16 | v15;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v9;
    v22 = *(_QWORD *)(v3 + 16);
    v10 = __OFADD__(v22, 1);
    v23 = v22 + 1;
    if (v10)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v23;
LABEL_24:
    if (v6 == v4)
      goto LABEL_25;
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

unint64_t sub_1C2ED5590()
{
  unint64_t result;

  result = qword_1EF7D3200;
  if (!qword_1EF7D3200)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF7D3200);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_1C2EF7410();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return sub_1C2EF7410();
}

id OUTLINED_FUNCTION_2_2(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

void static DeviceUnit.supportsSecureCoding.getter()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_87();
}

void static DeviceUnit.supportsSecureCoding.setter(char a1)
{
  OUTLINED_FUNCTION_8();
  byte_1EF7D3210 = a1;
  OUTLINED_FUNCTION_87();
}

void static DeviceUnit.supportsSecureCoding.modify()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5();
}

void DeviceUnit.identifier.getter()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_5();
}

id sub_1C2ED5728(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  void *v3;

  a3();
  v3 = (void *)sub_1C2EF7410();
  OUTLINED_FUNCTION_9();
  return OUTLINED_FUNCTION_49_0(v3);
}

void DeviceUnit.assistantId.getter()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_5();
}

void DeviceUnit.name.getter()
{
  sub_1C2ED78A4();
}

id sub_1C2ED57A0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3;
  void *v4;

  a3();
  if (!v3)
    return OUTLINED_FUNCTION_49_0(0);
  v4 = (void *)sub_1C2EF7410();
  OUTLINED_FUNCTION_9();
  return OUTLINED_FUNCTION_49_0(v4);
}

void DeviceUnit.roomName.getter()
{
  sub_1C2ED78A4();
}

uint64_t DeviceUnit.proximity.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___SVDDeviceUnitSwift_proximity);
}

void DeviceUnit.mediaRouteIdentifier.getter()
{
  sub_1C2ED78A4();
}

uint64_t DeviceUnit.isCommunalDevice.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice);
}

void DeviceUnit.homeKitAccessoryIdentifier.getter()
{
  sub_1C2ED78A4();
}

void DeviceUnit.__allocating_init(identifier:assistantId:builder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  OUTLINED_FUNCTION_14();
  DeviceUnit.init(identifier:assistantId:builder:)(a1, a2, a3, a4, a5);
}

void DeviceUnit.init(identifier:assistantId:builder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  char *v5;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  objc_super v21;

  v7 = &v5[OBJC_IVAR___SVDDeviceUnitSwift_identifier];
  *(_QWORD *)v7 = a1;
  *((_QWORD *)v7 + 1) = a2;
  v8 = &v5[OBJC_IVAR___SVDDeviceUnitSwift_assistantId];
  *(_QWORD *)v8 = a3;
  *((_QWORD *)v8 + 1) = a4;
  if (a5)
  {
    type metadata accessor for MutableDeviceUnit();
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = 0u;
    *(_OWORD *)(v9 + 32) = 0u;
    *(_OWORD *)(v9 + 48) = 0u;
    *(_OWORD *)(v9 + 57) = 0u;
    *(_QWORD *)(v9 + 80) = 0;
    *(_QWORD *)(v9 + 88) = 0;
    v10 = v5;
    a5(v9);
    v11 = *(_QWORD *)(v9 + 24);
    v12 = &v10[OBJC_IVAR___SVDDeviceUnitSwift_name];
    *(_QWORD *)v12 = *(_QWORD *)(v9 + 16);
    *((_QWORD *)v12 + 1) = v11;
    v13 = *(_QWORD *)(v9 + 40);
    v14 = &v10[OBJC_IVAR___SVDDeviceUnitSwift_roomName];
    *(_QWORD *)v14 = *(_QWORD *)(v9 + 32);
    *((_QWORD *)v14 + 1) = v13;
    *(_QWORD *)&v10[OBJC_IVAR___SVDDeviceUnitSwift_proximity] = *(_QWORD *)(v9 + 48);
    v15 = *(_QWORD *)(v9 + 64);
    v16 = &v10[OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier];
    *(_QWORD *)v16 = *(_QWORD *)(v9 + 56);
    *((_QWORD *)v16 + 1) = v15;
    v10[OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice] = *(_BYTE *)(v9 + 72);
    v18 = *(_QWORD *)(v9 + 80);
    v17 = *(_QWORD *)(v9 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    v19 = &v10[OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier];
    *(_QWORD *)v19 = v18;
    *((_QWORD *)v19 + 1) = v17;

  }
  else
  {
    OUTLINED_FUNCTION_73(OBJC_IVAR___SVDDeviceUnitSwift_name);
    OUTLINED_FUNCTION_73(OBJC_IVAR___SVDDeviceUnitSwift_roomName);
    *(_QWORD *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_proximity] = 0;
    OUTLINED_FUNCTION_73(OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier);
    v5[OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice] = 0;
    OUTLINED_FUNCTION_73(OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier);
  }
  v21.receiver = v5;
  v21.super_class = (Class)type metadata accessor for DeviceUnit();
  objc_msgSendSuper2(&v21, sel_init);
  v20 = OUTLINED_FUNCTION_41_0();
  sub_1C2ECB4EC(v20);
  OUTLINED_FUNCTION_31_0();
}

uint64_t type metadata accessor for DeviceUnit()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for MutableDeviceUnit()
{
  return objc_opt_self();
}

id DeviceUnit.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  return DeviceUnit.init(coder:)(a1);
}

id DeviceUnit.init(coder:)(void *a1)
{
  uint64_t v1;
  __n128 *v3;
  unint64_t v4;
  char *v5;
  __n128 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  __n128 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __n128 *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __n128 v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v46;
  id v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  __n128 *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __n128 v59;
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
  uint64_t *v72;
  char *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t *v76;
  void *v77;
  unsigned __int8 v78;
  uint64_t *v79;
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
  objc_super v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D2A90);
  v3 = (__n128 *)OUTLINED_FUNCTION_4_3();
  v4 = OUTLINED_FUNCTION_79(v3, (__n128)xmmword_1C2EF9250);
  v5 = (char *)OUTLINED_FUNCTION_78(v4);
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_1();
  if (v118)
  {
    if ((OUTLINED_FUNCTION_2_3() & 1) != 0)
    {
      v6 = (__n128 *)OUTLINED_FUNCTION_1_4();
      OUTLINED_FUNCTION_18_1(v6, v7, v8, v9, v10, v11, v12, v13, v80, v85, v90, v95, v99, v103, v107, v111, v14);
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_13_2();
      if ((OUTLINED_FUNCTION_2_3() & 1) != 0)
      {
        v15 = v117;
        v16 = (__n128 *)OUTLINED_FUNCTION_1_4();
        OUTLINED_FUNCTION_18_1(v16, v17, v18, v19, v20, v21, v22, v23, v81, v86, v91, v96, v100, v104, v108, v112, v24);
        OUTLINED_FUNCTION_59();
        OUTLINED_FUNCTION_45_0();
        if (OUTLINED_FUNCTION_2_3())
        {
          v33 = (__n128 *)OUTLINED_FUNCTION_1_4();
          OUTLINED_FUNCTION_18_1(v33, v34, v35, v36, v37, v38, v39, v40, v82, v87, v92, v97, v101, v116, v116, v113, v41);
          OUTLINED_FUNCTION_36_0();
          OUTLINED_FUNCTION_66();
          if (OUTLINED_FUNCTION_2_3())
          {
            v42 = v117;
            v43 = v117;
            v46 = (void *)OUTLINED_FUNCTION_3_5();
            v47 = objc_msgSend(a1, sel_decodeIntegerForKey_, v46);

            v48 = Proximity.init(rawValue:)(v47);
            if ((v49 & 1) != 0)
            {
              OUTLINED_FUNCTION_66();
              OUTLINED_FUNCTION_13_2();

              OUTLINED_FUNCTION_45_0();
              goto LABEL_13;
            }
            v50 = v48;
            v51 = (__n128 *)OUTLINED_FUNCTION_1_4();
            OUTLINED_FUNCTION_18_1(v51, v52, v53, v54, v55, v56, v57, v58, v83, v88, v93, v116, v116, v105, v109, v117, v59);
            sub_1C2EF762C();
            swift_bridgeObjectRelease();
            if (OUTLINED_FUNCTION_2_3())
            {
              v89 = v116;
              v94 = v50;
              v60 = v117;
              v61 = OUTLINED_FUNCTION_1_4();
              *(_OWORD *)(v61 + 16) = xmmword_1C2EF9250;
              *(_QWORD *)(v61 + 32) = v1;
              sub_1C2EF762C();
              v62 = OUTLINED_FUNCTION_37_0();
              if (!v118)
              {
                OUTLINED_FUNCTION_43_0(v62, v63, v64, v65, v66, v67, v68, v69, v84, v89, v94, v98, v102, v106);
                v70 = 0;
                v71 = 0;
                goto LABEL_26;
              }
              if (OUTLINED_FUNCTION_2_3())
              {
                v70 = v116;
                v71 = v117;
LABEL_26:
                v72 = (uint64_t *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_identifier];
                *v72 = v102;
                v72[1] = v42;
                v73 = &v5[OBJC_IVAR___SVDDeviceUnitSwift_assistantId];
                *(_QWORD *)v73 = v110;
                *((_QWORD *)v73 + 1) = v15;
                v74 = (uint64_t *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_name];
                *v74 = v106;
                v74[1] = v114;
                v75 = (uint64_t *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_roomName];
                *v75 = v98;
                v75[1] = v43;
                *(_QWORD *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_proximity] = v94;
                v76 = (uint64_t *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier];
                *v76 = v89;
                v76[1] = v60;
                v77 = (void *)OUTLINED_FUNCTION_51_0();
                v78 = objc_msgSend(a1, sel_decodeBoolForKey_, v77);

                v5[OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice] = v78;
                v79 = (uint64_t *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier];
                *v79 = v70;
                v79[1] = v71;

                v115.receiver = v5;
                v115.super_class = (Class)type metadata accessor for DeviceUnit();
                v44 = objc_msgSendSuper2(&v115, sel_init);

                return v44;
              }

              OUTLINED_FUNCTION_13_2();
              OUTLINED_FUNCTION_66();
              swift_bridgeObjectRelease();
            }
            else
            {

              OUTLINED_FUNCTION_13_2();
              OUTLINED_FUNCTION_66();
            }
          }
          else
          {

            OUTLINED_FUNCTION_13_2();
          }
        }
        else
        {

        }
        swift_bridgeObjectRelease();
      }
      else
      {

      }
LABEL_13:
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }

  }
  else
  {

    OUTLINED_FUNCTION_43_0(v25, v26, v27, v28, v29, v30, v31, v32, v80, v85, v90, v95, v99, v103);
  }
LABEL_14:
  type metadata accessor for DeviceUnit();
  OUTLINED_FUNCTION_84();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t DeviceUnit.__allocating_init(deviceUnitObjC:)(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v1 = a1;
  if (objc_msgSend(v1, sel_respondsToSelector_, sel_assistantId))
  {
    v2 = objc_msgSend(v1, sel_identifier);
    v3 = OUTLINED_FUNCTION_81();
    v5 = v4;

    v6 = objc_msgSend(v1, sel_assistantId);
    v7 = OUTLINED_FUNCTION_81();
    v9 = v8;

    *(_QWORD *)(swift_allocObject() + 16) = v1;
    v10 = objc_allocWithZone((Class)type metadata accessor for DeviceUnit());
    DeviceUnit.init(identifier:assistantId:builder:)(v3, v5, v7, v9, (void (*)(uint64_t))sub_1C2ED7718);
    v12 = v11;

  }
  else
  {

    return 0;
  }
  return v12;
}

id sub_1C2ED6104(void *a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  sub_1C2ED90D0(a2, (SEL *)&selRef_name);
  if (v4)
  {
    v5 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setName_, v5);

  }
  sub_1C2ED90D0(a2, (SEL *)&selRef_roomName);
  if (v6)
  {
    v7 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setRoomName_, v7);

  }
  v8 = Proximity.init(rawValue:)(objc_msgSend(a2, sel_proximity));
  if ((v9 & 1) == 0)
    objc_msgSend(a1, sel_setProximity_, v8);
  sub_1C2ED90D0(a2, (SEL *)&selRef_mediaRouteIdentifier);
  if (v10)
  {
    v11 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setMediaRouteIdentifier_, v11);

  }
  sub_1C2EEC780(a2);
  if (v12)
  {
    v13 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setHomeKitAccessoryIdentifier_, v13);

  }
  return objc_msgSend(a1, sel_setIsCommunalDevice_, objc_msgSend(a2, sel_isCommunalDevice));
}

void sub_1C2ED6270(void *a1)
{
  uint64_t v1;
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  OUTLINED_FUNCTION_28_0();
  v4 = (void *)OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_0_3();

  v5 = (void *)OUTLINED_FUNCTION_28_0();
  v6 = (void *)OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_0_3();

  OUTLINED_FUNCTION_48_0();
  if (v7)
    OUTLINED_FUNCTION_35_0();
  v8 = (void *)OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_39_0();

  OUTLINED_FUNCTION_48_0();
  if (v9)
    OUTLINED_FUNCTION_35_0();
  v10 = (void *)OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_39_0();

  v11 = *(_QWORD *)(v1 + OBJC_IVAR___SVDDeviceUnitSwift_proximity);
  v12 = (void *)OUTLINED_FUNCTION_3_5();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v11, v12);

  OUTLINED_FUNCTION_48_0();
  if (v13)
    OUTLINED_FUNCTION_35_0();
  v14 = (void *)sub_1C2EF7410();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_39_0();

  v15 = *(unsigned __int8 *)(v1 + OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice);
  v16 = (void *)OUTLINED_FUNCTION_51_0();
  objc_msgSend(a1, sel_encodeBool_forKey_, v15, v16);

  OUTLINED_FUNCTION_48_0();
  if (v17)
    OUTLINED_FUNCTION_35_0();
  v18 = (void *)sub_1C2EF7410();
  OUTLINED_FUNCTION_90((uint64_t)v18, sel_encodeObject_forKey_);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_23_0(v18);
}

uint64_t sub_1C2ED6500()
{
  char *v0;
  id v1;
  uint64_t v2;
  objc_super v4;

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for DeviceUnit();
  v1 = objc_msgSendSuper2(&v4, sel_description);
  v2 = OUTLINED_FUNCTION_81();

  sub_1C2EF774C();
  sub_1C2EF7464();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_38_0(OBJC_IVAR___SVDDeviceUnitSwift_name);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_38_0(OBJC_IVAR___SVDDeviceUnitSwift_roomName);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_20_1();
  Proximity.description.getter(*(_QWORD *)&v0[OBJC_IVAR___SVDDeviceUnitSwift_proximity]);
  sub_1C2EF7464();
  OUTLINED_FUNCTION_37_0();
  sub_1C2EF7464();
  OUTLINED_FUNCTION_38_0(OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_54_0();
  sub_1C2EF7464();
  sub_1C2EF7464();
  OUTLINED_FUNCTION_37_0();
  sub_1C2EF7464();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_37_0();
  sub_1C2EF7464();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_37_0();
  return v2;
}

void sub_1C2ED6760(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  _BYTE v8[24];
  uint64_t v9;

  sub_1C2ED4814(a1, (uint64_t)v8);
  if (v9)
  {
    type metadata accessor for DeviceUnit();
    if ((OUTLINED_FUNCTION_42_0() & 1) != 0)
    {
      OUTLINED_FUNCTION_21_0(OBJC_IVAR___SVDDeviceUnitSwift_assistantId);
      v3 = v3 && v1 == v2;
      if (v3 || (OUTLINED_FUNCTION_57() & 1) != 0)
      {
        OUTLINED_FUNCTION_21_0(OBJC_IVAR___SVDDeviceUnitSwift_identifier);
        if (!v3 || v4 != v5)
          OUTLINED_FUNCTION_57();
      }

    }
  }
  else
  {
    sub_1C2ECAB94((uint64_t)v8);
  }
  OUTLINED_FUNCTION_55_0();
}

uint64_t sub_1C2ED6848()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  sub_1C2EF79EC();
  OUTLINED_FUNCTION_9_2();
  sub_1C2EF7440();
  v0 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_67(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
  return sub_1C2EF79D4();
}

id DeviceUnit.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_14(), sel_init);
}

void DeviceUnit.init()()
{
  OUTLINED_FUNCTION_3_4();
  __break(1u);
}

BOOL sub_1C2ED68EC(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1C2ED68FC()
{
  return sub_1C2EF79BC();
}

uint64_t sub_1C2ED6920(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v10;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1C2EF7938() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6E61747369737361 && a2 == 0xEB00000000644974;
    if (v6 || (sub_1C2EF7938() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 1701667182 && a2 == 0xE400000000000000;
      if (v7 || (sub_1C2EF7938() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x656D614E6D6F6F72 && a2 == 0xE800000000000000;
        if (v8 || (sub_1C2EF7938() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x74696D69786F7270 && a2 == 0xE900000000000079;
          if (v9 || (sub_1C2EF7938() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0xD000000000000014 && a2 == 0x80000001C2EFB960 || (sub_1C2EF7938() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0xD000000000000010 && a2 == 0x80000001C2EFB810 || (sub_1C2EF7938() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else if (a1 == 0xD00000000000001ALL && a2 == 0x80000001C2EFB980)
          {
            swift_bridgeObjectRelease();
            return 7;
          }
          else
          {
            v10 = sub_1C2EF7938();
            swift_bridgeObjectRelease();
            if ((v10 & 1) != 0)
              return 7;
            else
              return 8;
          }
        }
      }
    }
  }
}

uint64_t sub_1C2ED6C5C()
{
  return 8;
}

uint64_t sub_1C2ED6C64()
{
  return 0;
}

uint64_t sub_1C2ED6C70(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1C2ED6CA8 + 4 * byte_1C2EF9C60[a1]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_1C2ED6CA8()
{
  return 0x6E61747369737361;
}

uint64_t sub_1C2ED6CC8()
{
  return 1701667182;
}

uint64_t sub_1C2ED6CD8()
{
  return 0x656D614E6D6F6F72;
}

uint64_t sub_1C2ED6CF0()
{
  return 0x74696D69786F7270;
}

unint64_t sub_1C2ED6D0C()
{
  return 0xD000000000000014;
}

void sub_1C2ED6D64()
{
  sub_1C2ED83A0();
}

uint64_t sub_1C2ED6D7C()
{
  return sub_1C2ED68FC();
}

uint64_t sub_1C2ED6D88()
{
  unsigned __int8 *v0;

  return sub_1C2ED6C70(*v0);
}

uint64_t sub_1C2ED6D90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C2ED6920(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C2ED6DB4()
{
  return sub_1C2ED6C64();
}

uint64_t sub_1C2ED6DD0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1C2ED6C5C();
  *a1 = result;
  return result;
}

uint64_t sub_1C2ED6DF4()
{
  sub_1C2ED8A58();
  return sub_1C2EF7A10();
}

uint64_t sub_1C2ED6E1C()
{
  sub_1C2ED8A58();
  return sub_1C2EF7A1C();
}

id DeviceUnit.__deallocating_deinit()
{
  return sub_1C2ED52F8(type metadata accessor for DeviceUnit);
}

void sub_1C2ED6EB4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3270);
  OUTLINED_FUNCTION_83();
  MEMORY[0x1E0C80A78](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C2ED8A58();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_80(OBJC_IVAR___SVDDeviceUnitSwift_identifier);
  OUTLINED_FUNCTION_15_0();
  if (!v1)
  {
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_6_3(2);
    OUTLINED_FUNCTION_6_3(3);
    sub_1C2ED8A94();
    OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_80(OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier);
    OUTLINED_FUNCTION_6_3(5);
    sub_1C2EF7914();
    OUTLINED_FUNCTION_80(OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier);
    OUTLINED_FUNCTION_6_3(7);
  }
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_44_0();
}

void DeviceUnit.__allocating_init(from:)()
{
  OUTLINED_FUNCTION_58();
  DeviceUnit.init(from:)();
  OUTLINED_FUNCTION_74();
}

void DeviceUnit.init(from:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
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
  objc_class *v19;
  uint64_t v20;
  char *v21;
  objc_super v22;
  char v23;
  uint64_t v24;

  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3288);
  v2 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_71();
  sub_1C2ED8A58();
  v5 = v0;
  v21 = v4;
  OUTLINED_FUNCTION_68();
  if (v1)
  {
    OUTLINED_FUNCTION_77();

    type metadata accessor for DeviceUnit();
    OUTLINED_FUNCTION_84();
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v24) = 0;
    v6 = v20;
    v7 = OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_47_0(v7, v8, OBJC_IVAR___SVDDeviceUnitSwift_identifier);
    LOBYTE(v24) = 1;
    v9 = OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_47_0(v9, v10, OBJC_IVAR___SVDDeviceUnitSwift_assistantId);
    v11 = OUTLINED_FUNCTION_7_3(2);
    OUTLINED_FUNCTION_47_0(v11, v12, OBJC_IVAR___SVDDeviceUnitSwift_name);
    v13 = OUTLINED_FUNCTION_7_3(3);
    OUTLINED_FUNCTION_47_0(v13, v14, OBJC_IVAR___SVDDeviceUnitSwift_roomName);
    v23 = 4;
    sub_1C2ED8AD0();
    sub_1C2EF78F0();
    *(_QWORD *)&v5[OBJC_IVAR___SVDDeviceUnitSwift_proximity] = v24;
    v15 = OUTLINED_FUNCTION_7_3(5);
    OUTLINED_FUNCTION_47_0(v15, v16, OBJC_IVAR___SVDDeviceUnitSwift_mediaRouteIdentifier);
    LOBYTE(v24) = 6;
    v5[OBJC_IVAR___SVDDeviceUnitSwift_isCommunalDevice] = sub_1C2EF78E4() & 1;
    v17 = OUTLINED_FUNCTION_7_3(7);
    OUTLINED_FUNCTION_47_0(v17, v18, OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier);

    v19 = (objc_class *)type metadata accessor for DeviceUnit();
    v22.receiver = v5;
    v22.super_class = v19;
    objc_msgSendSuper2(&v22, sel_init);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v21, v6);
    OUTLINED_FUNCTION_77();
  }
  OUTLINED_FUNCTION_33();
}

void sub_1C2ED73E0(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  DeviceUnit.__allocating_init(from:)();
  if (!v1)
    *a1 = v3;
}

void sub_1C2ED7408(_QWORD *a1)
{
  sub_1C2ED6EB4(a1);
}

unint64_t sub_1C2ED76B8()
{
  unint64_t result;

  result = qword_1EF7D3260;
  if (!qword_1EF7D3260)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF7D3260);
  }
  return result;
}

uint64_t sub_1C2ED76F4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1C2ED7718(void *a1)
{
  uint64_t v1;

  return sub_1C2ED6104(a1, *(void **)(v1 + 16));
}

uint64_t sub_1C2ED7720()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C2ED7754()
{
  sub_1C2ED7720();
  return swift_deallocClassInstance();
}

void static SVDDeviceUnit.supportsSecureCoding.getter()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_87();
}

void static SVDDeviceUnit.supportsSecureCoding.setter(char a1)
{
  OUTLINED_FUNCTION_8();
  byte_1EF7D3211 = a1;
  OUTLINED_FUNCTION_87();
}

void static SVDDeviceUnit.supportsSecureCoding.modify()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5();
}

void SVDDeviceUnit.identifier.getter()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_5();
}

void SVDDeviceUnit.assistantId.getter()
{
  sub_1C2ED78A4();
}

void SVDDeviceUnit.name.getter()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_5();
}

void SVDDeviceUnit.roomName.getter()
{
  sub_1C2ED78A4();
}

void sub_1C2ED78A4()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_41_0();
  OUTLINED_FUNCTION_5();
}

uint64_t SVDDeviceUnit.proximity.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_proximity);
}

void SVDDeviceUnit.__allocating_init(identifier:assistantId:name:roomName:proximity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  OUTLINED_FUNCTION_14();
  SVDDeviceUnit.init(identifier:assistantId:name:roomName:proximity:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  OUTLINED_FUNCTION_31_0();
}

id SVDDeviceUnit.init(identifier:assistantId:name:roomName:proximity:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  objc_super v15;

  v10 = &v9[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_identifier];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v11 = &v9[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId];
  *(_QWORD *)v11 = a3;
  *((_QWORD *)v11 + 1) = a4;
  v12 = &v9[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_name];
  *(_QWORD *)v12 = a5;
  *((_QWORD *)v12 + 1) = a6;
  v13 = &v9[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_roomName];
  *(_QWORD *)v13 = a7;
  *((_QWORD *)v13 + 1) = a8;
  *(_QWORD *)&v9[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_proximity] = a9;
  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for SVDDeviceUnit();
  return objc_msgSendSuper2(&v15, sel_init);
}

id SVDDeviceUnit.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  return SVDDeviceUnit.init(coder:)(a1);
}

id SVDDeviceUnit.init(coder:)(void *a1)
{
  __n128 *v2;
  unint64_t v3;
  char *v4;
  uint64_t v5;
  __n128 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
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
  __n128 *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __n128 v33;
  uint64_t v34;
  __n128 *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __n128 v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t *v50;
  char *v51;
  uint64_t *v52;
  id v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  objc_super v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D2A90);
  v2 = (__n128 *)OUTLINED_FUNCTION_4_3();
  v3 = OUTLINED_FUNCTION_79(v2, (__n128)xmmword_1C2EF9250);
  v4 = (char *)OUTLINED_FUNCTION_78(v3);
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_1();
  if (!v65)
  {

    OUTLINED_FUNCTION_69(v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_18:
    type metadata accessor for SVDDeviceUnit();
    swift_deallocPartialClassInstance();
    return 0;
  }
  if ((OUTLINED_FUNCTION_10_2() & 1) == 0)
  {

    goto LABEL_18;
  }
  v5 = v64;
  v6 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_34_0(v6, v7, v8, v9, v10, v11, v12, v13, v55, v58, v14);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_13_2();
  if (!OUTLINED_FUNCTION_10_2())
  {

LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v16 = v63;
  v15 = v64;
  v25 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_34_0(v25, v26, v27, v28, v29, v30, v31, v32, v56, v59, v33);
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_45_0();
  if ((OUTLINED_FUNCTION_10_2() & 1) == 0)
  {

LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  v34 = v64;
  v35 = (__n128 *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_34_0(v35, v36, v37, v38, v39, v40, v41, v42, v57, v63, v43);
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_37_0();
  if (!OUTLINED_FUNCTION_10_2())
  {

    OUTLINED_FUNCTION_45_0();
    goto LABEL_16;
  }
  v44 = v64;
  v61 = v63;
  v45 = (void *)OUTLINED_FUNCTION_3_5();
  v46 = objc_msgSend(a1, sel_decodeIntegerForKey_, v45);

  v47 = SVDProximity.init(rawValue:)((uint64_t)v46);
  if ((v48 & 1) != 0)
  {
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_45_0();

    goto LABEL_16;
  }
  v49 = &v4[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_identifier];
  *(_QWORD *)v49 = v63;
  *((_QWORD *)v49 + 1) = v5;
  v50 = (uint64_t *)&v4[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId];
  *v50 = v16;
  v50[1] = v15;
  v51 = &v4[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_name];
  *(_QWORD *)v51 = v60;
  *((_QWORD *)v51 + 1) = v34;
  v52 = (uint64_t *)&v4[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_roomName];
  *v52 = v61;
  v52[1] = v44;
  *(_QWORD *)&v4[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_proximity] = v47;

  v62.receiver = v4;
  v62.super_class = (Class)type metadata accessor for SVDDeviceUnit();
  v53 = objc_msgSendSuper2(&v62, sel_init);

  return v53;
}

void sub_1C2ED7CCC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  OUTLINED_FUNCTION_28_0();
  v1 = (void *)OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_0_3();

  OUTLINED_FUNCTION_48_0();
  if (v2)
    OUTLINED_FUNCTION_35_0();
  v3 = (void *)OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_39_0();

  v4 = (void *)OUTLINED_FUNCTION_28_0();
  v5 = (void *)OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_0_3();

  OUTLINED_FUNCTION_48_0();
  if (v6)
    OUTLINED_FUNCTION_35_0();
  v7 = (void *)OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_39_0();

  v8 = (void *)OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_90((uint64_t)v8, sel_encodeInteger_forKey_);
  OUTLINED_FUNCTION_23_0(v8);
}

uint64_t sub_1C2ED7E1C()
{
  uint64_t v0;

  sub_1C2EF774C();
  sub_1C2EF7464();
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_82(OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_roomName);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_82(OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_20_1();
  SVDProximity.description.getter(*(_QWORD *)(v0 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_proximity));
  sub_1C2EF7464();
  OUTLINED_FUNCTION_9();
  return 0;
}

void sub_1C2ED7F28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  char *v8;
  _BYTE v9[24];
  uint64_t v10;

  sub_1C2ED4814(a1, (uint64_t)v9);
  if (v10)
  {
    type metadata accessor for SVDDeviceUnit();
    if ((OUTLINED_FUNCTION_42_0() & 1) != 0)
    {
      v2 = *(_QWORD *)(v1 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId + 8);
      v3 = *(_QWORD *)&v8[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId + 8];
      if (v2)
      {
        if (!v3)
          goto LABEL_17;
        v4 = *(_QWORD *)(v1 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId) == *(_QWORD *)&v8[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId]
          && v2 == v3;
        if (!v4 && (OUTLINED_FUNCTION_57() & 1) == 0)
          goto LABEL_17;
      }
      else if (v3)
      {
LABEL_17:

        goto LABEL_18;
      }
      OUTLINED_FUNCTION_21_0(OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_identifier);
      if (!v4 || v5 != v6)
        OUTLINED_FUNCTION_57();
      goto LABEL_17;
    }
  }
  else
  {
    sub_1C2ECAB94((uint64_t)v9);
  }
LABEL_18:
  OUTLINED_FUNCTION_55_0();
}

uint64_t sub_1C2ED8004(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  id v6;
  id v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a1;
    swift_unknownObjectRetain();
    sub_1C2EF7698();
    OUTLINED_FUNCTION_39_0();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = a1;
  }
  v8 = a4(v10);

  sub_1C2ECAB94((uint64_t)v10);
  return v8 & 1;
}

uint64_t sub_1C2ED80B0()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  sub_1C2EF79EC();
  if (*(_QWORD *)(v0 + OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId + 8))
  {
    sub_1C2EF79C8();
    swift_bridgeObjectRetain();
    sub_1C2EF7440();
    v1 = OUTLINED_FUNCTION_9();
  }
  else
  {
    v1 = sub_1C2EF79C8();
  }
  OUTLINED_FUNCTION_67(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
  return sub_1C2EF79D4();
}

void SVDDeviceUnit.init()()
{
  OUTLINED_FUNCTION_3_4();
  __break(1u);
}

uint64_t sub_1C2ED816C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1C2EF7938() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6E61747369737361 && a2 == 0xEB00000000644974;
    if (v6 || (sub_1C2EF7938() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 1701667182 && a2 == 0xE400000000000000;
      if (v7 || (sub_1C2EF7938() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x656D614E6D6F6F72 && a2 == 0xE800000000000000;
        if (v8 || (sub_1C2EF7938() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x74696D69786F7270 && a2 == 0xE900000000000079)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v10 = sub_1C2EF7938();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 4;
          else
            return 5;
        }
      }
    }
  }
}

uint64_t sub_1C2ED8398()
{
  return 5;
}

void sub_1C2ED83A0()
{
  sub_1C2EF79B0();
  sub_1C2EF79BC();
  sub_1C2EF79E0();
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_1C2ED83DC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1C2ED8414 + 4 * byte_1C2EF9C68[a1]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_1C2ED8414()
{
  return 0x6E61747369737361;
}

uint64_t sub_1C2ED8434()
{
  return 1701667182;
}

uint64_t sub_1C2ED8444()
{
  return 0x656D614E6D6F6F72;
}

uint64_t sub_1C2ED845C()
{
  return 0x74696D69786F7270;
}

void sub_1C2ED8478()
{
  sub_1C2EF79B0();
  sub_1C2EF79BC();
  sub_1C2EF79E0();
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_1C2ED84B0()
{
  unsigned __int8 *v0;

  return sub_1C2ED83DC(*v0);
}

uint64_t sub_1C2ED84B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C2ED816C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1C2ED84DC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1C2ED8398();
  *a1 = result;
  return result;
}

uint64_t sub_1C2ED8500()
{
  sub_1C2ED8B2C();
  return sub_1C2EF7A10();
}

uint64_t sub_1C2ED8528()
{
  sub_1C2ED8B2C();
  return sub_1C2EF7A1C();
}

id SVDDeviceUnit.__deallocating_deinit()
{
  return sub_1C2ED52F8(type metadata accessor for SVDDeviceUnit);
}

void sub_1C2ED85A8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D32C0);
  OUTLINED_FUNCTION_83();
  MEMORY[0x1E0C80A78](v3);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C2ED8B2C();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_80(OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_identifier);
  OUTLINED_FUNCTION_15_0();
  if (!v1)
  {
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_8_2();
    sub_1C2ED8B68();
    OUTLINED_FUNCTION_61();
  }
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_44_0();
}

void SVDDeviceUnit.__allocating_init(from:)()
{
  OUTLINED_FUNCTION_58();
  SVDDeviceUnit.init(from:)();
  OUTLINED_FUNCTION_74();
}

void SVDDeviceUnit.init(from:)()
{
  void *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v16;
  objc_super v17;
  char v18;
  uint64_t v19;

  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D32D8);
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_71();
  sub_1C2ED8B2C();
  v2 = v0;
  OUTLINED_FUNCTION_68();
  if (v1)
  {
    OUTLINED_FUNCTION_75();

    type metadata accessor for SVDDeviceUnit();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v3 = sub_1C2EF78D8();
    v4 = (uint64_t *)&v2[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_identifier];
    *v4 = v3;
    v4[1] = v5;
    v6 = OUTLINED_FUNCTION_76();
    v7 = (uint64_t *)&v2[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_assistantId];
    *v7 = v6;
    v7[1] = v8;
    v9 = sub_1C2EF78D8();
    v10 = (uint64_t *)&v2[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_name];
    *v10 = v9;
    v10[1] = v11;
    LOBYTE(v19) = 3;
    v12 = OUTLINED_FUNCTION_76();
    v13 = (uint64_t *)&v2[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_roomName];
    *v13 = v12;
    v13[1] = v14;
    v18 = 4;
    sub_1C2ED8BA4();
    sub_1C2EF78F0();
    *(_QWORD *)&v2[OBJC_IVAR___SVDDeviceUnitSwiftDeprecated_proximity] = v19;

    v15 = (objc_class *)type metadata accessor for SVDDeviceUnit();
    v17.receiver = v2;
    v17.super_class = v15;
    objc_msgSendSuper2(&v17, sel_init);
    OUTLINED_FUNCTION_11_2();
    OUTLINED_FUNCTION_75();
  }
  OUTLINED_FUNCTION_33();
}

void sub_1C2ED89EC(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  SVDDeviceUnit.__allocating_init(from:)();
  if (!v1)
    *a1 = v3;
}

void sub_1C2ED8A14(_QWORD *a1)
{
  sub_1C2ED85A8(a1);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1C2ED8A58()
{
  unint64_t result;

  result = qword_1EF7D3278;
  if (!qword_1EF7D3278)
  {
    result = MEMORY[0x1C3BCCAC4](&unk_1C2EF9F8C, &type metadata for DeviceUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7D3278);
  }
  return result;
}

unint64_t sub_1C2ED8A94()
{
  unint64_t result;

  result = qword_1EF7D3280;
  if (!qword_1EF7D3280)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for Proximity, &type metadata for Proximity);
    atomic_store(result, (unint64_t *)&qword_1EF7D3280);
  }
  return result;
}

unint64_t sub_1C2ED8AD0()
{
  unint64_t result;

  result = qword_1EF7D3290;
  if (!qword_1EF7D3290)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for Proximity, &type metadata for Proximity);
    atomic_store(result, (unint64_t *)&qword_1EF7D3290);
  }
  return result;
}

uint64_t type metadata accessor for SVDDeviceUnit()
{
  return objc_opt_self();
}

unint64_t sub_1C2ED8B2C()
{
  unint64_t result;

  result = qword_1EF7D32C8;
  if (!qword_1EF7D32C8)
  {
    result = MEMORY[0x1C3BCCAC4](&unk_1C2EF9F3C, &type metadata for SVDDeviceUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7D32C8);
  }
  return result;
}

unint64_t sub_1C2ED8B68()
{
  unint64_t result;

  result = qword_1EF7D32D0;
  if (!qword_1EF7D32D0)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for SVDProximity, &type metadata for SVDProximity);
    atomic_store(result, (unint64_t *)&qword_1EF7D32D0);
  }
  return result;
}

unint64_t sub_1C2ED8BA4()
{
  unint64_t result;

  result = qword_1EF7D32E0;
  if (!qword_1EF7D32E0)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for SVDProximity, &type metadata for SVDProximity);
    atomic_store(result, (unint64_t *)&qword_1EF7D32E0);
  }
  return result;
}

uint64_t method lookup function for DeviceUnit()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DeviceUnit.__allocating_init(identifier:assistantId:builder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of DeviceUnit.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of DeviceUnit.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of DeviceUnit.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of DeviceUnit.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t method lookup function for SVDDeviceUnit()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SVDDeviceUnit.__allocating_init(identifier:assistantId:name:roomName:proximity:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SVDDeviceUnit.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of SVDDeviceUnit.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SVDDeviceUnit.description()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SVDDeviceUnit.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SVDDeviceUnit.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t getEnumTagSinglePayload for SVDDeviceUnit.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFC)
  {
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
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SVDDeviceUnit.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C2ED8DD0 + 4 * byte_1C2EF9C72[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1C2ED8E04 + 4 * byte_1C2EF9C6D[v4]))();
}

uint64_t sub_1C2ED8E04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED8E0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2ED8E14);
  return result;
}

uint64_t sub_1C2ED8E20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2ED8E28);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1C2ED8E2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED8E34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SVDDeviceUnit.CodingKeys()
{
  return &type metadata for SVDDeviceUnit.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for DeviceUnit.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_1C2ED8E9C + 4 * byte_1C2EF9C7C[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1C2ED8ED0 + 4 * byte_1C2EF9C77[v4]))();
}

uint64_t sub_1C2ED8ED0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED8ED8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2ED8EE0);
  return result;
}

uint64_t sub_1C2ED8EEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2ED8EF4);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1C2ED8EF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2ED8F00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceUnit.CodingKeys()
{
  return &type metadata for DeviceUnit.CodingKeys;
}

unint64_t sub_1C2ED8F20()
{
  unint64_t result;

  result = qword_1EF7D3490;
  if (!qword_1EF7D3490)
  {
    result = MEMORY[0x1C3BCCAC4](&unk_1C2EF9E5C, &type metadata for DeviceUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7D3490);
  }
  return result;
}

unint64_t sub_1C2ED8F60()
{
  unint64_t result;

  result = qword_1EF7D3498;
  if (!qword_1EF7D3498)
  {
    result = MEMORY[0x1C3BCCAC4](&unk_1C2EF9F14, &type metadata for SVDDeviceUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7D3498);
  }
  return result;
}

unint64_t sub_1C2ED8FA0()
{
  unint64_t result;

  result = qword_1EF7D34A0;
  if (!qword_1EF7D34A0)
  {
    result = MEMORY[0x1C3BCCAC4](&unk_1C2EF9E84, &type metadata for SVDDeviceUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7D34A0);
  }
  return result;
}

unint64_t sub_1C2ED8FE0()
{
  unint64_t result;

  result = qword_1EF7D34A8;
  if (!qword_1EF7D34A8)
  {
    result = MEMORY[0x1C3BCCAC4](&unk_1C2EF9EAC, &type metadata for SVDDeviceUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7D34A8);
  }
  return result;
}

unint64_t sub_1C2ED9020()
{
  unint64_t result;

  result = qword_1EF7D34B0;
  if (!qword_1EF7D34B0)
  {
    result = MEMORY[0x1C3BCCAC4](&unk_1C2EF9DCC, &type metadata for DeviceUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7D34B0);
  }
  return result;
}

unint64_t sub_1C2ED9060()
{
  unint64_t result;

  result = qword_1EF7D34B8;
  if (!qword_1EF7D34B8)
  {
    result = MEMORY[0x1C3BCCAC4](&unk_1C2EF9DF4, &type metadata for DeviceUnit.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7D34B8);
  }
  return result;
}

uint64_t sub_1C2ED909C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1C2ED90C0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1C2ED90D0(void *a1, SEL *a2)
{
  id v2;
  void *v3;

  v2 = objc_msgSend(a1, *a2);
  if (v2)
  {
    v3 = v2;
    sub_1C2EF741C();

  }
  return OUTLINED_FUNCTION_41_0();
}

id OUTLINED_FUNCTION_0_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(v0, (SEL)(v3 + 328), v1, v2);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return sub_1C2EF7410();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v2 - 120), v1);
}

uint64_t OUTLINED_FUNCTION_6_3@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 72) = a1;
  return sub_1C2EF78FC();
}

uint64_t OUTLINED_FUNCTION_7_3@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 72) = a1;
  return sub_1C2EF78CC();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_1C2EF78FC();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v2 - 120));
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_1C2EF7464();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_1C2EF7908();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return sub_1C2EF7464();
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return sub_1C2EF7464();
}

__n128 OUTLINED_FUNCTION_18_1(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __n128 a17)
{
  unint64_t v17;
  __n128 result;

  result = a17;
  a1[1] = a17;
  a1[2].n128_u64[0] = v17;
  return result;
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return sub_1C2EF7464();
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return sub_1C2EF7464();
}

uint64_t OUTLINED_FUNCTION_21_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_1C2EF7410();
}

void OUTLINED_FUNCTION_23_0(id a1)
{

}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return sub_1C2EF762C();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return sub_1C2EF762C();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return sub_1C2EF7410();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return sub_1C2EF7410();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return sub_1C2EF7464();
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return sub_1C2EF7410();
}

__n128 OUTLINED_FUNCTION_34_0(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  unint64_t v11;
  __n128 result;

  result = a11;
  a1[1] = a11;
  a1[2].n128_u64[0] = v11;
  return result;
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return sub_1C2EF7410();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return sub_1C2EF762C();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_38_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1 + 8);
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_43_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  return sub_1C2ECAB94((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return sub_1C2EF7A04();
}

uint64_t OUTLINED_FUNCTION_47_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + a3);
  *v4 = result;
  v4[1] = a2;
  return result;
}

id OUTLINED_FUNCTION_49_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return sub_1C2EF7410();
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return sub_1C2EF7410();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return sub_1C2EF7938();
}

id OUTLINED_FUNCTION_58()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_1C2EF762C();
}

uint64_t OUTLINED_FUNCTION_60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_61()
{
  return sub_1C2EF7920();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_1C2EF7464();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_67(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char __dst)
{
  return memcpy(&__dst, &a9, 0x48uLL);
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_1C2EF79F8();
}

uint64_t OUTLINED_FUNCTION_69(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  return sub_1C2ECAB94((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_1C2EF78D8();
}

_QWORD *OUTLINED_FUNCTION_71()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = v0[3];
  *(_QWORD *)(v1 - 112) = v0;
  return __swift_project_boxed_opaque_existential_1(v0, v2);
}

uint64_t OUTLINED_FUNCTION_72()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_73(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)(v1 + a1);
  *v2 = 0;
  v2[1] = 0;
}

uint64_t OUTLINED_FUNCTION_75()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(*(_QWORD *)(v0 - 112));
}

uint64_t OUTLINED_FUNCTION_76()
{
  return sub_1C2EF78CC();
}

uint64_t OUTLINED_FUNCTION_77()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(v0);
}

id OUTLINED_FUNCTION_78(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  return v1;
}

unint64_t OUTLINED_FUNCTION_79(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_1C2ED76B8();
}

uint64_t OUTLINED_FUNCTION_80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_81()
{
  return sub_1C2EF741C();
}

uint64_t OUTLINED_FUNCTION_82@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1 + 8);
}

uint64_t OUTLINED_FUNCTION_84()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_86()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_90(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t static ObjCCompatibility.capabilities(from:)(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  __int128 v7;
  _QWORD *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t ObjectType;
  Swift::String v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  unint64_t v33;
  __int128 v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  char *v40;
  unint64_t v41;
  __int128 v42;
  _QWORD *v43;

  v2 = sub_1C2EF7350();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (unint64_t)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
  {
LABEL_33:
    swift_bridgeObjectRetain();
    v6 = sub_1C2EF7884();
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      v40 = sel__swiftBacking;
      v41 = a1 & 0xC000000000000001;
      v8 = (_QWORD *)MEMORY[0x1E0DEE9E0];
      v9 = 4;
      v37 = MEMORY[0x1E0DEE9B8] + 8;
      *(_QWORD *)&v7 = 138412290;
      v34 = v7;
      v35 = (char *)v5;
      v36 = v3;
      v39 = v6;
      v32 = v2;
      v33 = a1;
      while (1)
      {
        if (v41)
          v10 = (id)MEMORY[0x1C3BCC3B0](v9 - 4, a1);
        else
          v10 = *(id *)(a1 + 8 * v9);
        v11 = v9 - 3;
        if (__OFADD__(v9 - 4, 1))
        {
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
          goto LABEL_33;
        }
        v12 = v10;
        if (!objc_msgSend(v12, sel_respondsToSelector_, v40))
          break;
        v13 = objc_msgSend(v12, sel__swiftBacking);
        sub_1C2EF7698();
        swift_unknownObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2AD0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v38 = v42;
          v2 = v42;
          ObjectType = swift_getObjectType();
          v15._countAndFlagsBits = (*(uint64_t (**)(uint64_t))(*((_QWORD *)&v38 + 1) + 32))(ObjectType);
          CapabilityKey.init(rawValue:)(v15);
          a1 = v43;
          if (v43 == 12)
          {
            swift_unknownObjectRelease();

            v2 = v32;
            a1 = v33;
LABEL_18:
            v6 = v39;
            goto LABEL_19;
          }
          swift_unknownObjectRetain();
          swift_isUniquelyReferenced_nonNull_native();
          v43 = v8;
          v22 = sub_1C2ECC4D0(a1);
          if (__OFADD__(v8[2], (v23 & 1) == 0))
            goto LABEL_31;
          v5 = v22;
          v3 = v23;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D34C0);
          if ((sub_1C2EF77D0() & 1) != 0)
          {
            v24 = sub_1C2ECC4D0(a1);
            if ((v3 & 1) != (v25 & 1))
            {
              result = sub_1C2EF7968();
              __break(1u);
              return result;
            }
            v5 = v24;
          }
          v8 = v43;
          if ((v3 & 1) != 0)
          {
            v26 = v43[7];
            swift_unknownObjectRelease();
            *(_OWORD *)(v26 + 16 * v5) = v38;
            v6 = v39;
          }
          else
          {
            v43[(v5 >> 6) + 8] |= 1 << v5;
            *(_BYTE *)(v8[6] + v5) = a1;
            *(_OWORD *)(v8[7] + 16 * v5) = v38;
            v27 = v8[2];
            v28 = __OFADD__(v27, 1);
            v29 = v27 + 1;
            v6 = v39;
            if (v28)
              goto LABEL_32;
            v8[2] = v29;
          }
          swift_unknownObjectRelease();

          swift_bridgeObjectRelease();
          v2 = v32;
          a1 = v33;
          v5 = (unint64_t)v35;
          v3 = v36;
        }
        else
        {

        }
LABEL_19:
        ++v9;
        if (v11 == v6)
        {
          swift_bridgeObjectRelease();
          goto LABEL_35;
        }
      }

      if (qword_1EF7D29F0 != -1)
        swift_once();
      v16 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF7D6040);
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 16))(v5, v16, v2);
      v17 = v12;
      v18 = sub_1C2EF7344();
      v19 = sub_1C2EF759C();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = swift_slowAlloc();
        v21 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v20 = v34;
        *(_QWORD *)(v20 + 4) = v17;
        *v21 = v17;
        _os_log_impl(&dword_1C2EC6000, v18, v19, "#hal Unable to convert svdCapability into capability: %@", (uint8_t *)v20, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3198);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3_3();
      }

      (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v5, v2);
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)MEMORY[0x1E0DEE9E0];
LABEL_35:
  v30 = sub_1C2EC9654((uint64_t)v8);
  swift_bridgeObjectRelease();
  type metadata accessor for Capabilities();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v30;
  return result;
}

ValueMetadata *type metadata accessor for ObjCCompatibility()
{
  return &type metadata for ObjCCompatibility;
}

uint64_t SVDProximity.init(rawValue:)(uint64_t result)
{
  uint64_t v1;

  if (result == 4000)
    v1 = 4000;
  else
    v1 = 0;
  if (result == 3000)
    v1 = 3000;
  if (result == 2000)
    v1 = 2000;
  if (result == 1000)
    v1 = 1000;
  if (result)
    return v1;
  return result;
}

uint64_t Proximity.description.getter(uint64_t a1)
{
  return sub_1C2ED9CB4(a1);
}

void *static Proximity.allCases.getter()
{
  return &unk_1E7CC85F8;
}

void sub_1C2ED9BE8(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E7CC85F8;
}

uint64_t sub_1C2ED9BF8()
{
  sub_1C2ED9FDC();
  return sub_1C2EF74AC();
}

uint64_t sub_1C2ED9C54()
{
  sub_1C2ED9FDC();
  return sub_1C2EF74A0();
}

uint64_t sub_1C2ED9CA0()
{
  uint64_t *v0;

  return Proximity.description.getter(*v0);
}

uint64_t SVDProximity.description.getter(uint64_t a1)
{
  return sub_1C2ED9CB4(a1);
}

uint64_t sub_1C2ED9CB4(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 0:
      return 0x6E776F6E6B6E75;
    case 4000:
      return 0x7972616D697270;
    case 2000:
      return 1918985582;
    case 3000:
      return 0x74616964656D6D69;
    case 1000:
      return 7496038;
  }
  result = sub_1C2EF7950();
  __break(1u);
  return result;
}

BOOL SVDProximity.isCloserOrSameAs(_:)(uint64_t a1, uint64_t a2)
{
  return a2 >= a1;
}

void *static SVDProximity.allCases.getter()
{
  return &unk_1E7CC8640;
}

unint64_t sub_1C2ED9D8C()
{
  unint64_t result;

  result = qword_1EF7D34C8;
  if (!qword_1EF7D34C8)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for Proximity, &type metadata for Proximity);
    atomic_store(result, (unint64_t *)&qword_1EF7D34C8);
  }
  return result;
}

uint64_t sub_1C2ED9DC8()
{
  return sub_1C2ED9E80(&qword_1EF7D34D0, &qword_1EF7D34D8);
}

unint64_t sub_1C2ED9DF0()
{
  unint64_t result;

  result = qword_1EF7D34E0;
  if (!qword_1EF7D34E0)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for SVDProximity, &type metadata for SVDProximity);
    atomic_store(result, (unint64_t *)&qword_1EF7D34E0);
  }
  return result;
}

uint64_t sub_1C2ED9E2C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = SVDProximity.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1C2ED9E5C()
{
  return sub_1C2ED9E80(&qword_1EF7D34E8, &qword_1EF7D34F0);
}

uint64_t sub_1C2ED9E80(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1C3BCCAC4](MEMORY[0x1E0DEAF50], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1C2ED9EC0(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E7CC8640;
}

uint64_t sub_1C2ED9ED0()
{
  sub_1C2ED9FA0();
  return sub_1C2EF74AC();
}

uint64_t sub_1C2ED9F2C()
{
  sub_1C2ED9FA0();
  return sub_1C2EF74A0();
}

uint64_t sub_1C2ED9F78()
{
  uint64_t *v0;

  return SVDProximity.description.getter(*v0);
}

ValueMetadata *type metadata accessor for Proximity()
{
  return &type metadata for Proximity;
}

ValueMetadata *type metadata accessor for SVDProximity()
{
  return &type metadata for SVDProximity;
}

unint64_t sub_1C2ED9FA0()
{
  unint64_t result;

  result = qword_1EF7D34F8;
  if (!qword_1EF7D34F8)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for SVDProximity, &type metadata for SVDProximity);
    atomic_store(result, (unint64_t *)&qword_1EF7D34F8);
  }
  return result;
}

unint64_t sub_1C2ED9FDC()
{
  unint64_t result;

  result = qword_1EF7D3500;
  if (!qword_1EF7D3500)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for Proximity, &type metadata for Proximity);
    atomic_store(result, (unint64_t *)&qword_1EF7D3500);
  }
  return result;
}

uint64_t sub_1C2EDA028(unint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v17;

  if (a1 >> 62)
    goto LABEL_30;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1C2EF7884())
  {
    v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1C3BCC3B0](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        v15 = a2;
        goto LABEL_24;
      }
      v10 = sub_1C2EF744C();
      v11 = sub_1C2EF3E58(v10, v8, v9);
      MEMORY[0x1C3BCC080](v11);
      swift_bridgeObjectRelease();
      v12 = sub_1C2EF78C0();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(_QWORD *)(*(_QWORD *)&a2[v17] + 16))
        goto LABEL_23;
      swift_bridgeObjectRetain();
      sub_1C2EC907C(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      v14 = sub_1C2ED4DC8((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3)
        goto LABEL_31;
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_1C2EDA374(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EDA3C4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_key);
  OUTLINED_FUNCTION_8();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2EDA470(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_key);
  OUTLINED_FUNCTION_8();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EDA4C8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C2EDA470(v1, v2);
}

uint64_t (*sub_1C2EDA504())()
{
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

void AlarmTimerIntentsHandlingCapability.__allocating_init(status:)(uint64_t a1)
{
  OUTLINED_FUNCTION_14();
  AlarmTimerIntentsHandlingCapability.init(status:)(a1);
  OUTLINED_FUNCTION_5();
}

void sub_1C2EDA59C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap);
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_3_6();
  sub_1C2EC9CFC(v2, v3, v1);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    OUTLINED_FUNCTION_7();
    swift_dynamicCastClass();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1C2EDA628(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_3_6();
  sub_1C2ED4CA8(v2, v3, a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EDA674(unint64_t a1)
{
  void *v1;

  return sub_1C2EDA028(a1, (char *)v1) & 1;
}

uint64_t static AlarmTimerIntentsHandlingCapability.supportsSecureCoding.getter()
{
  return 1;
}

void AlarmTimerIntentsHandlingCapability.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  AlarmTimerIntentsHandlingCapability.init(coder:)(a1);
  OUTLINED_FUNCTION_5();
}

char *AlarmTimerIntentsHandlingCapability.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AlarmTimerIntentsHandlingCapability();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C2ECA778((uint64_t)a1);

  if (!*(_QWORD *)(*(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id AlarmTimerIntentsHandlingCapability.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_14(), sel_init);
}

void AlarmTimerIntentsHandlingCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AlarmTimerIntentsHandlingCapability.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AlarmTimerIntentsHandlingCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2EDA924@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2EDA3C4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for AlarmTimerIntentsHandlingCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.key.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.key.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.__allocating_init(status:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.supportsAlarmTimerIntentsHandling.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static AlarmTimerIntentsHandlingCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.matches(descriptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AlarmTimerIntentsHandlingCapability.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_3_6()
{
  return 0xD000000000000032;
}

void sub_1C2EDAA30(HMHomeManager a1)
{
  DeviceResolutionProviding.setHomeKitDataSource(_:)(a1);
}

Swift::Void __swiftcall DeviceResolutionProviding.setHomeKitDataSource(_:)(HMHomeManager a1)
{
  OUTLINED_FUNCTION_0_4();
  __break(1u);
}

void sub_1C2EDAA7C()
{
  DeviceResolutionProviding.devices(matchingAny:with:)();
}

void DeviceResolutionProviding.devices(matchingAny:with:)()
{
  OUTLINED_FUNCTION_0_4();
  __break(1u);
}

uint64_t sub_1C2EDAAC8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C2EDAB0C;
  return DeviceResolutionProviding.pairedCompanionDevice()();
}

uint64_t sub_1C2EDAB0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_6_4();
  if (!v1)
    v3 = v0;
  return OUTLINED_FUNCTION_9_3(v3, *(uint64_t (**)(void))(v2 + 8));
}

uint64_t DeviceResolutionProviding.pairedCompanionDevice()()
{
  return OUTLINED_FUNCTION_1_5();
}

void sub_1C2EDAB44()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_4();
}

uint64_t sub_1C2EDAB90()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C2EDB338;
  return DeviceResolutionProviding.meDevice()();
}

uint64_t DeviceResolutionProviding.meDevice()()
{
  return OUTLINED_FUNCTION_1_5();
}

void sub_1C2EDABE0()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_4();
}

uint64_t sub_1C2EDAC2C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C2EDB338;
  return swift_task_switch();
}

uint64_t DeviceResolutionProviding.devicesMatching(capabilityDescriptions:)()
{
  return OUTLINED_FUNCTION_1_5();
}

void sub_1C2EDAC90()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_4();
}

uint64_t sub_1C2EDACDC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C2EDB338;
  return swift_task_switch();
}

uint64_t DeviceResolutionProviding.devices(matchingAny:)()
{
  return OUTLINED_FUNCTION_1_5();
}

void sub_1C2EDAD40()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_4();
}

uint64_t sub_1C2EDAD8C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C2EDB338;
  return swift_task_switch();
}

uint64_t DeviceResolutionProviding.devicesWithProximity(closerBound:fartherBound:)()
{
  return OUTLINED_FUNCTION_1_5();
}

void sub_1C2EDADF0()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_4();
}

uint64_t sub_1C2EDAE3C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C2EDB338;
  return swift_task_switch();
}

uint64_t DeviceResolutionProviding.sourceDevices(for:)()
{
  return OUTLINED_FUNCTION_1_5();
}

void sub_1C2EDAEA0()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_4();
}

void sub_1C2EDAEEC()
{
  DeviceResolutionProviding.devicesWithProximity(closerBound:fartherBound:completion:)();
}

void DeviceResolutionProviding.devicesWithProximity(closerBound:fartherBound:completion:)()
{
  OUTLINED_FUNCTION_0_4();
  __break(1u);
}

void sub_1C2EDAF38()
{
  DeviceResolutionProviding.sourceDevices(for:completion:)();
}

void DeviceResolutionProviding.sourceDevices(for:completion:)()
{
  OUTLINED_FUNCTION_0_4();
  __break(1u);
}

void sub_1C2EDAF84()
{
  DeviceResolutionProviding.devicesMatching(capabilityDescriptions:completion:)();
}

void DeviceResolutionProviding.devicesMatching(capabilityDescriptions:completion:)()
{
  OUTLINED_FUNCTION_0_4();
  __break(1u);
}

uint64_t sub_1C2EDAFD0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C2EDB338;
  return swift_task_switch();
}

uint64_t DeviceResolutionProviding.homeAutomationAccessories(matchingAny:checkForReachability:)()
{
  return OUTLINED_FUNCTION_1_5();
}

void sub_1C2EDB034()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_4();
}

void DeviceResolutionProviding.setEndpointUUID(_:)()
{
  OUTLINED_FUNCTION_0_4();
  __break(1u);
}

uint64_t dispatch thunk of DeviceResolutionProviding.setHomeKitDataSource(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DeviceResolutionProviding.devices(matchingAny:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of DeviceResolutionProviding.pairedCompanionDevice()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_3_7();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_11_3(v1, (uint64_t)sub_1C2EDB110);
  return OUTLINED_FUNCTION_8_3(v2, v3, v4);
}

uint64_t sub_1C2EDB110()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_6_4();
  return OUTLINED_FUNCTION_9_3(v0, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t dispatch thunk of DeviceResolutionProviding.meDevice()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_3_7();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_11_3(v1, (uint64_t)sub_1C2EDB33C);
  return OUTLINED_FUNCTION_8_3(v2, v3, v4);
}

uint64_t dispatch thunk of DeviceResolutionProviding.devicesMatching(capabilityDescriptions:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_10_3();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_4();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_5_3(v1, (uint64_t)sub_1C2EDB33C);
  return OUTLINED_FUNCTION_2_4(v2, v3, v4, v5);
}

uint64_t dispatch thunk of DeviceResolutionProviding.devices(matchingAny:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_10_3();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_4();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_5_3(v1, (uint64_t)sub_1C2EDB33C);
  return OUTLINED_FUNCTION_2_4(v2, v3, v4, v5);
}

uint64_t dispatch thunk of DeviceResolutionProviding.devicesWithProximity(closerBound:fartherBound:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v9 = (_QWORD *)OUTLINED_FUNCTION_3_7();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1C2EDB33C;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of DeviceResolutionProviding.sourceDevices(for:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_10_3();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_4();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_5_3(v1, (uint64_t)sub_1C2EDB33C);
  return OUTLINED_FUNCTION_2_4(v2, v3, v4, v5);
}

uint64_t dispatch thunk of DeviceResolutionProviding.devicesWithProximity(closerBound:fartherBound:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 72))();
}

uint64_t dispatch thunk of DeviceResolutionProviding.sourceDevices(for:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 80))();
}

uint64_t dispatch thunk of DeviceResolutionProviding.devicesMatching(capabilityDescriptions:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 88))();
}

uint64_t dispatch thunk of DeviceResolutionProviding.homeAutomationAccessories(matchingAny:checkForReachability:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v9 = (_QWORD *)OUTLINED_FUNCTION_3_7();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1C2EDB33C;
  return v11(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_1C2EF7878();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_2_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_5_3@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = a2;
  return v3;
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_8_3(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_9_3(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_11_3@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

id CapabilityDescription.__allocating_init(key:valueSet:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_14();
  return CapabilityDescription.init(key:valueSet:)(a1, a2, a3);
}

void CapabilityDescription.__allocating_init(key:valueRange:)()
{
  double v0;
  uint64_t v1;
  uint64_t v2;
  double v3;

  OUTLINED_FUNCTION_3_8();
  v0 = OUTLINED_FUNCTION_13_3();
  CapabilityDescription.init(key:valueRange:)(v1, v2, v0, v3);
  OUTLINED_FUNCTION_0_5();
}

void CapabilityDescription.key.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5();
}

uint64_t CapabilityDescription.valueSet.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CapabilityDescription.valueRange.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange);
}

uint64_t CapabilityDescription.capabilityKey.getter()
{
  uint64_t v0;
  uint64_t v1;

  sub_1C2EDB924();
  v0 = sub_1C2EF7680();
  if (*(_QWORD *)(v0 + 16))
  {
    v1 = *(_QWORD *)(v0 + 32);
    swift_bridgeObjectRetain();
  }
  else
  {
    v1 = 0;
  }
  swift_bridgeObjectRelease();
  return v1;
}

id CapabilityDescription.valueRangeLowerBound.getter()
{
  char v0;

  OUTLINED_FUNCTION_12_1();
  if ((v0 & 1) != 0)
    return 0;
  else
    return OUTLINED_FUNCTION_19_2(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_);
}

id CapabilityDescription.valueRangeUpperBound.getter()
{
  char v0;

  OUTLINED_FUNCTION_12_1();
  if ((v0 & 1) != 0)
    return 0;
  else
    return OUTLINED_FUNCTION_19_2(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_);
}

id CapabilityDescription.init(key:valueSet:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_class *v7;
  char *v8;
  char *v9;
  objc_super v11;

  v7 = (objc_class *)OUTLINED_FUNCTION_14_2();
  v8 = &v3[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  *(_QWORD *)&v3[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet] = a3;
  v9 = &v3[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v11.receiver = v3;
  v11.super_class = v7;
  return objc_msgSendSuper2(&v11, sel_init);
}

id CapabilityDescription.init(key:valueRange:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  char *v4;
  objc_class *v9;
  char *v10;
  double *v11;
  objc_super v13;

  v9 = (objc_class *)OUTLINED_FUNCTION_14_2();
  v10 = &v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v11 = (double *)&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
  *v11 = a3;
  v11[1] = a4;
  *((_BYTE *)v11 + 16) = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet] = 0;
  v13.receiver = v4;
  v13.super_class = v9;
  return objc_msgSendSuper2(&v13, sel_init);
}

unint64_t sub_1C2EDB924()
{
  unint64_t result;

  result = qword_1EF7D35F0;
  if (!qword_1EF7D35F0)
  {
    result = MEMORY[0x1C3BCCAC4](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF7D35F0);
  }
  return result;
}

void CapabilityDescription.__allocating_init(key:lowerbound:upperbound:)()
{
  double v0;
  uint64_t v1;
  uint64_t v2;
  double v3;

  OUTLINED_FUNCTION_3_8();
  v0 = OUTLINED_FUNCTION_13_3();
  CapabilityDescription.init(key:lowerbound:upperbound:)(v1, v2, v0, v3);
  OUTLINED_FUNCTION_0_5();
}

void CapabilityDescription.init(key:lowerbound:upperbound:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  id v8;

  if (a3 > a4)
  {
    __break(1u);
  }
  else
  {
    v8 = objc_allocWithZone((Class)swift_getObjectType());
    CapabilityDescription.init(key:valueRange:)(a1, a2, a3, a4);
    swift_getObjectType();
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_0_5();
  }
}

uint64_t static CapabilityDescription.supportsSecureCoding.getter()
{
  OUTLINED_FUNCTION_8();
  return byte_1EF7D35D0;
}

uint64_t static CapabilityDescription.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_8();
  byte_1EF7D35D0 = a1;
  return result;
}

void static CapabilityDescription.supportsSecureCoding.modify()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5();
}

Swift::Void __swiftcall CapabilityDescription.encode(with:)(NSCoder with)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double *v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v3 = (void *)sub_1C2EF7410();
  v4 = (void *)sub_1C2EF7410();
  OUTLINED_FUNCTION_0_3();

  v6 = *(void **)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet);
  if (v6)
  {
    OUTLINED_FUNCTION_5_4(v5, (unint64_t *)&qword_1EF7D3200);
    sub_1C2EDBCC8();
    v6 = (void *)sub_1C2EF7548();
  }
  v7 = (void *)sub_1C2EF7410();
  OUTLINED_FUNCTION_0_3();

  OUTLINED_FUNCTION_12_1();
  if ((v9 & 1) == 0)
  {
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, *v8);
    v11 = (void *)OUTLINED_FUNCTION_6_5();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v10, v11);

    v12 = OUTLINED_FUNCTION_19_2(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_);
    v13 = (id)OUTLINED_FUNCTION_6_5();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v12, v13);

  }
}

unint64_t sub_1C2EDBCC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF7D3600;
  if (!qword_1EF7D3600)
  {
    sub_1C2ECABD4(255, (unint64_t *)&qword_1EF7D3200);
    result = MEMORY[0x1C3BCCAC4](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF7D3600);
  }
  return result;
}

void CapabilityDescription.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  CapabilityDescription.init(coder:)(a1);
}

void CapabilityDescription.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v20;
  id v21;
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
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double *v50;
  char *v51;
  objc_super v52;
  id v53;
  uint64_t v54;
  uint64_t v55;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D2A90);
  v5 = OUTLINED_FUNCTION_4_3();
  *(_OWORD *)(v5 + 16) = xmmword_1C2EF9250;
  OUTLINED_FUNCTION_5_4(v5, (unint64_t *)&qword_1EF7D3260);
  v7 = v6;
  *(_QWORD *)(v5 + 32) = v6;
  v8 = v2;
  sub_1C2EF762C();
  OUTLINED_FUNCTION_54_0();
  if (!v55)
  {

    OUTLINED_FUNCTION_10_4(v22, v23, v24, v25, v26, v27);
LABEL_8:
    OUTLINED_FUNCTION_20_2();
    return;
  }
  if ((OUTLINED_FUNCTION_9_4() & 1) == 0)
  {

    goto LABEL_8;
  }
  v9 = v54;
  v10 = &v8[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
  *(_QWORD *)v10 = v53;
  *((_QWORD *)v10 + 1) = v9;
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1C2EFA370;
  *(_QWORD *)(v11 + 32) = v7;
  OUTLINED_FUNCTION_5_4(v11, &qword_1EF7D3610);
  v13 = v12;
  *(_QWORD *)(v11 + 40) = v12;
  OUTLINED_FUNCTION_5_4(v12, &qword_1EF7D3618);
  *(_QWORD *)(v11 + 48) = v14;
  sub_1C2EF762C();
  v15 = OUTLINED_FUNCTION_54_0();
  if (v55)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3620);
    if (OUTLINED_FUNCTION_9_4())
    {
      v21 = v53;
      goto LABEL_11;
    }
  }
  else
  {
    OUTLINED_FUNCTION_10_4(v15, v16, v17, v18, v19, v20);
  }
  v21 = 0;
LABEL_11:
  *(_QWORD *)&v8[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet] = v21;
  v28 = OUTLINED_FUNCTION_4_3();
  *(_OWORD *)(v28 + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(v28 + 32) = v13;
  OUTLINED_FUNCTION_1_6();
  v29 = OUTLINED_FUNCTION_54_0();
  if (v55)
  {
    if (!OUTLINED_FUNCTION_2_5())
    {
LABEL_25:
      v51 = &v8[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
      *(_QWORD *)v51 = 0;
      *((_QWORD *)v51 + 1) = 0;
      v51[16] = 1;
      goto LABEL_26;
    }
    v35 = v53;
  }
  else
  {
    OUTLINED_FUNCTION_10_4(v29, v30, v31, v32, v33, v34);
    v35 = 0;
  }
  v36 = OUTLINED_FUNCTION_4_3();
  *(_OWORD *)(v36 + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(v36 + 32) = v13;
  OUTLINED_FUNCTION_1_6();
  v37 = swift_bridgeObjectRelease();
  if (!v55)
  {
    OUTLINED_FUNCTION_10_4(v37, v38, v39, v40, v41, v42);
    if (v35)
      goto LABEL_22;
    v43 = 0;
    goto LABEL_24;
  }
  if ((OUTLINED_FUNCTION_2_5() & 1) == 0)
  {
LABEL_22:

    goto LABEL_25;
  }
  v43 = v53;
  if (!v35)
  {
LABEL_24:

    goto LABEL_25;
  }
  if (!v53)
    goto LABEL_22;
  v44 = v35;
  v45 = v53;
  objc_msgSend(v44, sel_doubleValue);
  v47 = v46;
  objc_msgSend(v45, sel_doubleValue);
  v49 = v48;

  if (v47 <= v49)
  {
    v50 = (double *)&v8[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
    *v50 = v47;
    v50[1] = v49;
    *((_BYTE *)v50 + 16) = 0;
LABEL_26:

    v52.receiver = v8;
    v52.super_class = ObjectType;
    objc_msgSendSuper2(&v52, sel_init);

    return;
  }
  __break(1u);
}

id CapabilityDescription.copy(with:)@<X0>(_QWORD *a1@<X8>)
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
  double *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id result;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = OUTLINED_FUNCTION_14_2();
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet);
  if (v4)
  {
    v5 = v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key;
    v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key);
    v7 = *(_QWORD *)(v5 + 8);
    OUTLINED_FUNCTION_17_2();
    OUTLINED_FUNCTION_11_4();
    swift_bridgeObjectRetain();
    v8 = v6;
    v9 = v7;
    v10 = v4;
  }
  else
  {
    OUTLINED_FUNCTION_12_1();
    if ((v12 & 1) == 0)
    {
      v19 = *v11;
      v18 = v11[1];
      v20 = v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key;
      v21 = *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key);
      v22 = *(_QWORD *)(v20 + 8);
      OUTLINED_FUNCTION_17_2();
      OUTLINED_FUNCTION_11_4();
      result = CapabilityDescription.init(key:valueRange:)(v21, v22, v19, v18);
      goto LABEL_7;
    }
    v13 = v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key;
    v14 = *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key);
    v15 = *(_QWORD *)(v13 + 8);
    OUTLINED_FUNCTION_11_4();
    v16 = sub_1C2EDC1F4(MEMORY[0x1E0DEE9D8]);
    OUTLINED_FUNCTION_17_2();
    v8 = v14;
    v9 = v15;
    v10 = v16;
  }
  result = CapabilityDescription.init(key:valueSet:)(v8, v9, v10);
LABEL_7:
  a1[3] = v3;
  *a1 = result;
  return result;
}

uint64_t sub_1C2EDC1F4(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  id v8;
  uint64_t v9;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1C2EF7884();
    swift_bridgeObjectRelease();
  }
  sub_1C2ECABD4(0, (unint64_t *)&qword_1EF7D3200);
  sub_1C2EDBCC8();
  result = sub_1C2EF756C();
  v4 = result;
  v9 = result;
  if (!v2)
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_5;
LABEL_13:
    swift_bridgeObjectRelease();
    return v4;
  }
  swift_bridgeObjectRetain();
  v5 = sub_1C2EF7884();
  result = swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x1C3BCC3B0](i, a1);
      else
        v7 = *(id *)(a1 + 8 * i + 32);
      sub_1C2EF2848(&v8, v7);

    }
    swift_bridgeObjectRelease();
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t CapabilityDescription.description.getter(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v4;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet))
  {
    OUTLINED_FUNCTION_5_4(a1, (unint64_t *)&qword_1EF7D3200);
    sub_1C2EDBCC8();
    OUTLINED_FUNCTION_11_4();
    sub_1C2EF7560();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_12_1();
    if ((v2 & 1) == 0)
      sub_1C2EDC5B0();
  }
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key);
  swift_bridgeObjectRetain();
  sub_1C2EF7464();
  sub_1C2EF7464();
  swift_bridgeObjectRelease();
  return v4;
}

id CapabilityDescription.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_14(), sel_init);
}

void CapabilityDescription.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CapabilityDescription.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_14_2();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2EDC5B0()
{
  sub_1C2EF77C4();
  sub_1C2EF7464();
  sub_1C2EF77C4();
  return 0;
}

uint64_t type metadata accessor for CapabilityDescription()
{
  return objc_opt_self();
}

uint64_t method lookup function for CapabilityDescription()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CapabilityDescription.__allocating_init(key:valueSet:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of CapabilityDescription.__allocating_init(key:valueRange:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of CapabilityDescription.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return sub_1C2EF762C();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_3_8()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

void OUTLINED_FUNCTION_5_4(uint64_t a1, unint64_t *a2)
{
  sub_1C2ECABD4(0, a2);
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return sub_1C2EF7410();
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_10_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  return sub_1C2ECAB94((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return swift_bridgeObjectRetain();
}

double OUTLINED_FUNCTION_13_3()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_getObjectType();
}

id OUTLINED_FUNCTION_17_2()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

id OUTLINED_FUNCTION_19_2(id a1, SEL a2)
{
  double v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return swift_deallocPartialClassInstance();
}

uint64_t CapabilityKey.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1C2EDC79C + 4 * byte_1C2EFA3C0[*v0]))(0xD000000000000017, 0x80000001C2EFACD0);
}

uint64_t sub_1C2EDC854()
{
  return 0x6669636570736E55;
}

SiriVirtualDeviceResolution::CapabilityKey_optional __swiftcall CapabilityKey.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriVirtualDeviceResolution::CapabilityKey_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1C2EF78C0();
  result.value = swift_bridgeObjectRelease();
  v5 = 12;
  if (v3 < 0xC)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_1C2EDC8CC()
{
  return sub_1C2EF1D00();
}

void sub_1C2EDC8D8()
{
  sub_1C2ECB018();
}

uint64_t sub_1C2EDC8E0()
{
  return sub_1C2ECB064();
}

void sub_1C2EDC8E8()
{
  sub_1C2ECB0D8();
}

SiriVirtualDeviceResolution::CapabilityKey_optional sub_1C2EDC8F0(Swift::String *a1)
{
  return CapabilityKey.init(rawValue:)(*a1);
}

uint64_t sub_1C2EDC8FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CapabilityKey.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1C2EDC920()
{
  return sub_1C2EDCA88(0, (void (*)(_QWORD))type metadata accessor for AudioPlaybackCapability, (uint64_t (*)(void))sub_1C2ECDE38);
}

uint64_t sub_1C2EDC938()
{
  return sub_1C2EDCA88(1, (void (*)(_QWORD))type metadata accessor for VideoPlaybackCapability, (uint64_t (*)(void))sub_1C2EF1830);
}

uint64_t sub_1C2EDC950()
{
  return sub_1C2EDCA88(2, (void (*)(_QWORD))type metadata accessor for AppLaunchCapability, (uint64_t (*)(void))sub_1C2EF0048);
}

uint64_t sub_1C2EDC968()
{
  return sub_1C2EDCA88(3, (void (*)(_QWORD))type metadata accessor for SeymourRoutingCapability, (uint64_t (*)(void))sub_1C2EF4640);
}

uint64_t sub_1C2EDC980()
{
  uint64_t v0;
  char v1;
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 16) + 16))
  {
    swift_bridgeObjectRetain();
    sub_1C2ECC4D0(4);
    if ((v1 & 1) != 0)
    {
      swift_unknownObjectRetain();
      OUTLINED_FUNCTION_13_0();
      type metadata accessor for SpeakerCapability();
      result = swift_dynamicCastClass();
      if (result)
        return result;
      swift_unknownObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_13_0();
    }
  }
  return 0;
}

uint64_t sub_1C2EDC9F8()
{
  return sub_1C2EDCA88(5, (void (*)(_QWORD))type metadata accessor for VoiceTriggerCapability, (uint64_t (*)(void))sub_1C2EC9C70);
}

uint64_t sub_1C2EDCA10()
{
  return sub_1C2EDCA88(6, (void (*)(_QWORD))type metadata accessor for AlarmTimerIntentsHandlingCapability, (uint64_t (*)(void))sub_1C2EDA59C);
}

uint64_t sub_1C2EDCA28()
{
  return sub_1C2EDCA88(7, (void (*)(_QWORD))type metadata accessor for ProfileSwitchingCapability, (uint64_t (*)(void))sub_1C2ECD244);
}

uint64_t sub_1C2EDCA40()
{
  return sub_1C2EDCA88(8, (void (*)(_QWORD))type metadata accessor for MUXCapability, (uint64_t (*)(void))sub_1C2EEF454);
}

uint64_t sub_1C2EDCA58()
{
  return sub_1C2EDCA88(10, (void (*)(_QWORD))type metadata accessor for CustomTimerIntentHandlingCapability, (uint64_t (*)(void))sub_1C2EF0C3C);
}

uint64_t sub_1C2EDCA70()
{
  return sub_1C2EDCA88(9, (void (*)(_QWORD))type metadata accessor for AssistantEnabledCapability, (uint64_t (*)(void))sub_1C2EEE84C);
}

uint64_t sub_1C2EDCA88(uint64_t a1, void (*a2)(_QWORD), uint64_t (*a3)(void))
{
  uint64_t v3;
  char v7;
  uint64_t v8;

  if (*(_QWORD *)(*(_QWORD *)(v3 + 16) + 16))
  {
    swift_bridgeObjectRetain();
    sub_1C2ECC4D0(a1);
    if ((v7 & 1) != 0)
    {
      swift_unknownObjectRetain();
      OUTLINED_FUNCTION_13_0();
      a2(0);
      if (swift_dynamicCastClass())
      {
        v8 = a3();
        swift_unknownObjectRelease();
        return v8;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_13_0();
    }
  }
  return 0;
}

uint64_t Capabilities.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Capabilities.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t CapabilitiesBuilder.audioPlaybackSupportStatus.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t CapabilitiesBuilder.audioPlaybackSupportStatus.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.audioPlaybackSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.videoPlaybackSupportStatus.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t CapabilitiesBuilder.videoPlaybackSupportStatus.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.videoPlaybackSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.appLaunchSupportStatus.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t CapabilitiesBuilder.appLaunchSupportStatus.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.appLaunchSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.seymourRoutingSupportStatus.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t CapabilitiesBuilder.seymourRoutingSupportStatus.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = result;
  *(_BYTE *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.seymourRoutingSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.speakerSupportStatusAndQuality.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t CapabilitiesBuilder.speakerSupportStatusAndQuality.setter(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 64) = result;
  *(_QWORD *)(v3 + 72) = a2;
  *(_BYTE *)(v3 + 80) = a3 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.speakerSupportStatusAndQuality.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.voiceTriggerSupportStatus.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

uint64_t CapabilitiesBuilder.voiceTriggerSupportStatus.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 88) = result;
  *(_BYTE *)(v2 + 96) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.voiceTriggerSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.profileSwitchingSupportStatus.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 104);
}

uint64_t CapabilitiesBuilder.profileSwitchingSupportStatus.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 104) = result;
  *(_BYTE *)(v2 + 112) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.profileSwitchingSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.muxSupportStatus.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 120);
}

uint64_t CapabilitiesBuilder.muxSupportStatus.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = result;
  *(_BYTE *)(v2 + 128) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.muxSupportStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.customTimerIntentHandlingStatus.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 136);
}

uint64_t CapabilitiesBuilder.customTimerIntentHandlingStatus.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 136) = result;
  *(_BYTE *)(v2 + 144) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.customTimerIntentHandlingStatus.modify())()
{
  return nullsub_1;
}

uint64_t CapabilitiesBuilder.assistantEnabledSupportStatus.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 152);
}

uint64_t CapabilitiesBuilder.assistantEnabledSupportStatus.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 152) = result;
  *(_BYTE *)(v2 + 160) = a2 & 1;
  return result;
}

uint64_t (*CapabilitiesBuilder.assistantEnabledSupportStatus.modify())()
{
  return nullsub_1;
}

void CapabilitiesBuilder.init()(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 1;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 56) = 1;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 80) = 1;
  *(_QWORD *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 96) = 1;
  *(_QWORD *)(a1 + 104) = 0;
  *(_BYTE *)(a1 + 112) = 1;
  *(_QWORD *)(a1 + 120) = 0;
  *(_BYTE *)(a1 + 128) = 1;
  *(_QWORD *)(a1 + 136) = 0;
  *(_BYTE *)(a1 + 144) = 1;
  *(_QWORD *)(a1 + 152) = 0;
  *(_BYTE *)(a1 + 160) = 1;
}

uint64_t CapabilitiesBuilder.build()()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t result;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  char v61;
  char v62;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_BYTE *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = *(_BYTE *)(v0 + 56);
  v52 = *(_QWORD *)(v0 + 72);
  v53 = *(_QWORD *)(v0 + 64);
  v7 = *(_BYTE *)(v0 + 80);
  v8 = *(_BYTE *)(v0 + 96);
  v54 = *(_QWORD *)(v0 + 88);
  v55 = *(_QWORD *)(v0 + 104);
  v59 = *(_BYTE *)(v0 + 112);
  v60 = *(_BYTE *)(v0 + 128);
  v56 = *(_QWORD *)(v0 + 120);
  v57 = *(_QWORD *)(v0 + 136);
  v58 = *(_QWORD *)(v0 + 152);
  v61 = *(_BYTE *)(v0 + 144);
  v62 = *(_BYTE *)(v0 + 160);
  v9 = MEMORY[0x1E0DEE9E0];
  if ((*(_BYTE *)(v0 + 8) & 1) != 0)
  {
    if ((*(_BYTE *)(v0 + 24) & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v31 = *(_QWORD *)v0;
    v32 = objc_allocWithZone((Class)type metadata accessor for AudioPlaybackCapability());
    AudioPlaybackCapability.init(status:)(v31);
    OUTLINED_FUNCTION_5_5();
    v33 = OUTLINED_FUNCTION_4_5();
    sub_1C2EDD0BC(v33, 0, v34, v35);
    OUTLINED_FUNCTION_1_7();
    if ((v2 & 1) != 0)
    {
LABEL_3:
      if ((v4 & 1) != 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  v36 = objc_allocWithZone((Class)type metadata accessor for VideoPlaybackCapability());
  VideoPlaybackCapability.init(status:)(v1);
  OUTLINED_FUNCTION_5_5();
  v37 = OUTLINED_FUNCTION_4_5();
  sub_1C2EDD0BC(v37, 1, v38, v39);
  OUTLINED_FUNCTION_1_7();
  if ((v4 & 1) != 0)
  {
LABEL_4:
    if ((v6 & 1) != 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  v40 = objc_allocWithZone((Class)type metadata accessor for AppLaunchCapability());
  AppLaunchCapability.init(status:)(v3);
  OUTLINED_FUNCTION_2_6();
  v41 = OUTLINED_FUNCTION_0_6();
  sub_1C2EDD0BC(v41, 2, v42, v43);
  OUTLINED_FUNCTION_1_7();
  if ((v6 & 1) != 0)
  {
LABEL_5:
    if ((v7 & 1) != 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  v44 = objc_allocWithZone((Class)type metadata accessor for SeymourRoutingCapability());
  SeymourRoutingCapability.init(status:)(v5);
  OUTLINED_FUNCTION_2_6();
  v45 = OUTLINED_FUNCTION_0_6();
  sub_1C2EDD0BC(v45, 3, v46, v47);
  OUTLINED_FUNCTION_1_7();
  if ((v7 & 1) != 0)
  {
LABEL_6:
    if ((v8 & 1) != 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  v48 = objc_allocWithZone((Class)type metadata accessor for SpeakerCapability());
  SpeakerCapability.init(status:qualityScore:)(v53, v52);
  OUTLINED_FUNCTION_2_6();
  v49 = OUTLINED_FUNCTION_0_6();
  sub_1C2EDD0BC(v49, 4, v50, v51);
  OUTLINED_FUNCTION_1_7();
  if ((v8 & 1) == 0)
  {
LABEL_7:
    v10 = objc_allocWithZone((Class)type metadata accessor for VoiceTriggerCapability());
    VoiceTriggerCapability.init(status:)(v54);
    OUTLINED_FUNCTION_2_6();
    v11 = OUTLINED_FUNCTION_0_6();
    sub_1C2EDD0BC(v11, 5, v12, v13);
    OUTLINED_FUNCTION_1_7();
  }
LABEL_8:
  if ((v59 & 1) == 0)
  {
    v14 = objc_allocWithZone((Class)type metadata accessor for ProfileSwitchingCapability());
    ProfileSwitchingCapability.init(status:)(v55);
    OUTLINED_FUNCTION_2_6();
    v15 = OUTLINED_FUNCTION_0_6();
    sub_1C2EDD0BC(v15, 7, v16, v17);
    OUTLINED_FUNCTION_1_7();
  }
  if ((v60 & 1) == 0)
  {
    v18 = objc_allocWithZone((Class)type metadata accessor for MUXCapability());
    MUXCapability.init(status:)(v56);
    OUTLINED_FUNCTION_2_6();
    v19 = OUTLINED_FUNCTION_0_6();
    sub_1C2EDD0BC(v19, 8, v20, v21);
    OUTLINED_FUNCTION_1_7();
  }
  if ((v61 & 1) == 0)
  {
    v22 = objc_allocWithZone((Class)type metadata accessor for CustomTimerIntentHandlingCapability());
    CustomTimerIntentHandlingCapability.init(status:)(v57);
    OUTLINED_FUNCTION_2_6();
    v23 = OUTLINED_FUNCTION_0_6();
    sub_1C2EDD0BC(v23, 10, v24, v25);
    OUTLINED_FUNCTION_1_7();
  }
  if ((v62 & 1) == 0)
  {
    v26 = objc_allocWithZone((Class)type metadata accessor for AssistantEnabledCapability());
    AssistantEnabledCapability.init(status:)(v58);
    OUTLINED_FUNCTION_2_6();
    v27 = OUTLINED_FUNCTION_0_6();
    sub_1C2EDD0BC(v27, 9, v28, v29);
    OUTLINED_FUNCTION_1_7();
  }
  type metadata accessor for Capabilities();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v9;
  return result;
}

uint64_t type metadata accessor for Capabilities()
{
  return objc_opt_self();
}

unint64_t sub_1C2EDD0BC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t result;

  v7 = (_QWORD *)*a4;
  v8 = sub_1C2ECC4D0(a2);
  if (__OFADD__(v7[2], (v9 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v10 = v8;
  v11 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D37C8);
  if ((sub_1C2EF77D0() & 1) == 0)
    goto LABEL_5;
  v12 = sub_1C2ECC4D0(a2);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_9:
    result = sub_1C2EF7968();
    __break(1u);
    return result;
  }
  v10 = v12;
LABEL_5:
  v14 = (_QWORD *)*a4;
  if ((v11 & 1) == 0)
    return sub_1C2EDD48C(v10, a2, a1, v14);
  v15 = v14[7];
  result = swift_unknownObjectRelease();
  *(_QWORD *)(v15 + 8 * v10) = a1;
  return result;
}

unint64_t sub_1C2EDD1AC()
{
  unint64_t result;

  result = qword_1EF7D36B0;
  if (!qword_1EF7D36B0)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for CapabilityKey, &type metadata for CapabilityKey);
    atomic_store(result, (unint64_t *)&qword_1EF7D36B0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CapabilityKey(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF5)
  {
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
    v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v5 = v6 - 12;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CapabilityKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C2EDD2BC + 4 * byte_1C2EFA3D1[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_1C2EDD2F0 + 4 * byte_1C2EFA3CC[v4]))();
}

uint64_t sub_1C2EDD2F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2EDD2F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2EDD300);
  return result;
}

uint64_t sub_1C2EDD30C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2EDD314);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_1C2EDD318(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2EDD320(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CapabilityKey()
{
  return &type metadata for CapabilityKey;
}

uint64_t method lookup function for Capabilities()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Capabilities.audioPlayback.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of Capabilities.videoPlayback.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of Capabilities.appLaunch.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of Capabilities.seymourRouting.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of Capabilities.speaker.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of Capabilities.voiceTrigger.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of Capabilities.alarmTimerIntentsHandling.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of Capabilities.profileSwitching.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of Capabilities.mux.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of Capabilities.customTimerIntentHandling.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of Capabilities.assistantEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t initializeBufferWithCopyOfBuffer for CapabilitiesBuilder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void *__swift_memcpy161_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA1uLL);
}

uint64_t getEnumTagSinglePayload for CapabilitiesBuilder(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 161))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CapabilitiesBuilder(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 160) = 0;
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
  *(_BYTE *)(result + 161) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CapabilitiesBuilder()
{
  return &type metadata for CapabilitiesBuilder;
}

unint64_t sub_1C2EDD48C(unint64_t result, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_BYTE *)(a4[6] + result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

void DeviceUnitDescription.deviceTypes.getter(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *DeviceUnitDescription.deviceTypes.setter(_QWORD *result)
{
  _QWORD *v1;

  *v1 = *result;
  return result;
}

uint64_t (*DeviceUnitDescription.deviceTypes.modify())()
{
  return nullsub_1;
}

uint64_t DeviceUnitDescription.room.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return OUTLINED_FUNCTION_0_7(v1[1], v1[2], v1[3], a1);
}

uint64_t sub_1C2EDD550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

__n128 DeviceUnitDescription.room.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  __n128 result;
  __int128 v4;

  OUTLINED_FUNCTION_2_7(a1);
  sub_1C2EDD598(v2[1], v2[2], v2[3]);
  *(_OWORD *)(v2 + 1) = v4;
  v2[3] = v1;
  OUTLINED_FUNCTION_1_8();
  return result;
}

uint64_t sub_1C2EDD598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t (*DeviceUnitDescription.room.modify())()
{
  return nullsub_1;
}

uint64_t DeviceUnitDescription.zone.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return OUTLINED_FUNCTION_0_7(v1[4], v1[5], v1[6], a1);
}

__n128 DeviceUnitDescription.zone.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  __n128 result;
  __int128 v4;

  OUTLINED_FUNCTION_2_7(a1);
  sub_1C2EDD598(v2[4], v2[5], v2[6]);
  *((_OWORD *)v2 + 2) = v4;
  v2[6] = v1;
  OUTLINED_FUNCTION_1_8();
  return result;
}

uint64_t (*DeviceUnitDescription.zone.modify())()
{
  return nullsub_1;
}

uint64_t DeviceUnitDescription.home.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return OUTLINED_FUNCTION_0_7(v1[7], v1[8], v1[9], a1);
}

__n128 DeviceUnitDescription.home.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  __n128 result;
  __int128 v4;

  OUTLINED_FUNCTION_2_7(a1);
  sub_1C2EDD598(v2[7], v2[8], v2[9]);
  *(_OWORD *)(v2 + 7) = v4;
  v2[9] = v1;
  OUTLINED_FUNCTION_1_8();
  return result;
}

uint64_t (*DeviceUnitDescription.home.modify())()
{
  return nullsub_1;
}

void __swiftcall DeviceUnitDescription.init()(SiriVirtualDeviceResolution::DeviceUnitDescription *__return_ptr retstr)
{
  retstr->deviceTypes.rawValue = 0;
  *(_QWORD *)&retstr->room.value.current = 0;
  retstr->room.value.name.value._countAndFlagsBits = 0;
  retstr->room.value.name.value._object = (void *)1;
  *(_QWORD *)&retstr->zone.value.current = 0;
  retstr->zone.value.name.value._countAndFlagsBits = 0;
  retstr->zone.value.name.value._object = (void *)1;
  *(_QWORD *)&retstr->home.value.current = 0;
  retstr->home.value.name.value._countAndFlagsBits = 0;
  retstr->home.value.name.value._object = (void *)1;
}

uint64_t LocationDescription.current.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t LocationDescription.current.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*LocationDescription.current.modify())()
{
  return nullsub_1;
}

uint64_t LocationDescription.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t LocationDescription.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*LocationDescription.name.modify())()
{
  return nullsub_1;
}

SiriVirtualDeviceResolution::LocationDescription __swiftcall LocationDescription.init()()
{
  uint64_t v0;
  SiriVirtualDeviceResolution::LocationDescription result;

  *(_BYTE *)v0 = 0;
  *(_QWORD *)(v0 + 8) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  return result;
}

uint64_t destroy for DeviceUnitDescription(_QWORD *a1)
{
  uint64_t result;

  if (a1[3] != 1)
    swift_bridgeObjectRelease();
  if (a1[6] != 1)
    swift_bridgeObjectRelease();
  result = a1[9];
  if (result != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for DeviceUnitDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = a1 + 8;
  v5 = *(_QWORD *)(a2 + 24);
  if (v5 == 1)
  {
    *(_OWORD *)v4 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(v4 + 16) = *(_QWORD *)(a2 + 24);
  }
  else
  {
    *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = v5;
    swift_bridgeObjectRetain();
  }
  v6 = *(_QWORD *)(a2 + 48);
  if (v6 == 1)
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  }
  else
  {
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = v6;
    swift_bridgeObjectRetain();
  }
  v7 = *(_QWORD *)(a2 + 72);
  if (v7 == 1)
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  }
  else
  {
    *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = v7;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for DeviceUnitDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 *v9;
  __int128 *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 *v14;
  __int128 *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = a1 + 8;
  v5 = (__int128 *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24) == 1)
  {
    if (v6 == 1)
    {
      v7 = *v5;
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_OWORD *)v4 = v7;
    }
    else
    {
      *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      swift_bridgeObjectRetain();
    }
  }
  else if (v6 == 1)
  {
    sub_1C2EDDA58(a1 + 8);
    v8 = *((_QWORD *)v5 + 2);
    *(_OWORD *)v4 = *v5;
    *(_QWORD *)(v4 + 16) = v8;
  }
  else
  {
    *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v9 = (__int128 *)(a1 + 32);
  v10 = (__int128 *)(a2 + 32);
  v11 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(a1 + 48) == 1)
  {
    if (v11 == 1)
    {
      v12 = *v10;
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      *v9 = v12;
    }
    else
    {
      *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      swift_bridgeObjectRetain();
    }
  }
  else if (v11 == 1)
  {
    sub_1C2EDDA58(a1 + 32);
    v13 = *(_QWORD *)(a2 + 48);
    *v9 = *v10;
    *(_QWORD *)(a1 + 48) = v13;
  }
  else
  {
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v14 = (__int128 *)(a1 + 56);
  v15 = (__int128 *)(a2 + 56);
  v16 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72) == 1)
  {
    if (v16 == 1)
    {
      v17 = *v15;
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *v14 = v17;
    }
    else
    {
      *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      swift_bridgeObjectRetain();
    }
  }
  else if (v16 == 1)
  {
    sub_1C2EDDA58(a1 + 56);
    v18 = *(_QWORD *)(a2 + 72);
    *v14 = *v15;
    *(_QWORD *)(a1 + 72) = v18;
  }
  else
  {
    *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t sub_1C2EDDA58(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for DeviceUnitDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = a1 + 8;
  v5 = a2 + 8;
  if (*(_QWORD *)(a1 + 24) == 1)
    goto LABEL_4;
  v6 = *(_QWORD *)(a2 + 24);
  if (v6 == 1)
  {
    sub_1C2EDDA58(v4);
LABEL_4:
    *(_OWORD *)v4 = *(_OWORD *)v5;
    *(_QWORD *)(v4 + 16) = *(_QWORD *)(v5 + 16);
    goto LABEL_6;
  }
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
LABEL_6:
  if (*(_QWORD *)(a1 + 48) == 1)
  {
LABEL_9:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    goto LABEL_11;
  }
  v7 = *(_QWORD *)(a2 + 48);
  if (v7 == 1)
  {
    sub_1C2EDDA58(a1 + 32);
    goto LABEL_9;
  }
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  swift_bridgeObjectRelease();
LABEL_11:
  if (*(_QWORD *)(a1 + 72) != 1)
  {
    v8 = *(_QWORD *)(a2 + 72);
    if (v8 != 1)
    {
      *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 72) = v8;
      swift_bridgeObjectRelease();
      return a1;
    }
    sub_1C2EDDA58(a1 + 56);
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceUnitDescription(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;
  int v4;
  BOOL v5;

  if (a2)
  {
    if (a2 > 0x7FFFFFFD && *(_BYTE *)(a1 + 80))
    {
      v2 = *(_DWORD *)a1 + 2147483645;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 24);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v4 = v3 - 1;
      if (v4 < 0)
        v4 = -1;
      v5 = __OFSUB__(v4, 1);
      v2 = v4 - 1;
      if (v2 < 0 != v5)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceUnitDescription(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 2147483646;
    if (a3 > 0x7FFFFFFD)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if (a3 > 0x7FFFFFFD)
      *(_BYTE *)(result + 80) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceUnitDescription()
{
  return &type metadata for DeviceUnitDescription;
}

uint64_t destroy for LocationDescription()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s27SiriVirtualDeviceResolution19LocationDescriptionVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LocationDescription(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
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

uint64_t assignWithTake for LocationDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationDescription(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 16);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LocationDescription(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationDescription()
{
  return &type metadata for LocationDescription;
}

uint64_t OUTLINED_FUNCTION_0_7@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  return sub_1C2EDD550(a1, a2, a3);
}

__n128 OUTLINED_FUNCTION_2_7(uint64_t a1)
{
  return *(__n128 *)a1;
}

unint64_t CapabilitySupportStatus.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

unint64_t sub_1C2EDDE48()
{
  unint64_t result;

  result = qword_1EF7D37D0;
  if (!qword_1EF7D37D0)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for CapabilitySupportStatus, &type metadata for CapabilitySupportStatus);
    atomic_store(result, (unint64_t *)&qword_1EF7D37D0);
  }
  return result;
}

unint64_t sub_1C2EDDE84@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = CapabilitySupportStatus.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CapabilitySupportStatus()
{
  return &type metadata for CapabilitySupportStatus;
}

uint64_t sub_1C2EDDEC4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1C2EDDEF0()
{
  void *v0;
  void (*v1)(void);
  id v2;

  OUTLINED_FUNCTION_79_0();
  v2 = v0;
  v1();
  swift_release();
  OUTLINED_FUNCTION_43_1(v2);
}

uint64_t sub_1C2EDDF28(void *a1, uint64_t a2)
{
  id v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  char v18;

  if ((a2 & 0xC000000000000001) != 0)
  {
    v3 = a1;
    v4 = sub_1C2EF7704();

    return v4 & 1;
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v6 = sub_1C2EF7638(), v7 = -1 << *(_BYTE *)(a2 + 32), v8 = v6 & ~v7, OUTLINED_FUNCTION_48_1(), (v10 & 1) == 0))
  {
LABEL_11:
    v13 = 0;
    return v13 & 1;
  }
  OUTLINED_FUNCTION_43(v9, (unint64_t *)&qword_1EF7D3200);
  v11 = OUTLINED_FUNCTION_102();
  v12 = sub_1C2EF7644();

  if ((v12 & 1) == 0)
  {
    v14 = ~v7;
    v15 = (v8 + 1) & v14;
    OUTLINED_FUNCTION_48_1();
    if ((v16 & 1) != 0)
    {
      do
      {
        v17 = OUTLINED_FUNCTION_102();
        v13 = sub_1C2EF7644();

        if ((v13 & 1) != 0)
          break;
        v15 = (v15 + 1) & v14;
        OUTLINED_FUNCTION_48_1();
      }
      while ((v18 & 1) != 0);
      return v13 & 1;
    }
    goto LABEL_11;
  }
  v13 = 1;
  return v13 & 1;
}

uint64_t sub_1C2EDE04C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1C2EF79B0();
    sub_1C2EF7440();
    v6 = sub_1C2EF79E0();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1C2EF7938() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1C2EF7938() & 1) != 0)
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

id sub_1C2EDE180()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DeviceResolutionService()), sel_init);
  qword_1EF7D37E0 = (uint64_t)result;
  return result;
}

id static DeviceResolutionService.sharedService.getter()
{
  if (qword_1EF7D29D0 != -1)
    swift_once();
  return (id)qword_1EF7D37E0;
}

_QWORD *sub_1C2EDE1F0()
{
  _QWORD *result;

  type metadata accessor for DeviceResolutionAnalyticsImpl();
  swift_allocObject();
  result = sub_1C2ED19B4();
  qword_1EF7D37E8 = (uint64_t)result;
  return result;
}

uint64_t static DeviceResolutionService.sharedAnalytics.getter()
{
  if (qword_1EF7D29D8 != -1)
    swift_once();
  return swift_retain();
}

void sub_1C2EDE26C(uint64_t a1)
{
  OUTLINED_FUNCTION_46_1(a1, OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager);
}

void sub_1C2EDE278(uint64_t a1)
{
  OUTLINED_FUNCTION_46_1(a1, OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService__xpcConnection);
}

id sub_1C2EDE284()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char *v10;
  uint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(void **)&v0[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService__xpcConnection];
  v2 = v1;
  if (!v1)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_currentContext);
    v4 = (void *)objc_opt_self();
    v5 = objc_msgSend(v4, sel_serviceName);
    if (!v5)
    {
      sub_1C2EF741C();
      v5 = (id)sub_1C2EF7410();
      OUTLINED_FUNCTION_9();
    }
    v2 = objc_msgSend(v3, sel_createXPCConnectionWithMachServiceName_options_, v5, 0);

    if (v2)
    {
      v6 = v2;
      v7 = objc_msgSend(v4, sel_xpcInterface);
      OUTLINED_FUNCTION_28((uint64_t)v7, sel_setRemoteObjectInterface_);

      *(_QWORD *)(OUTLINED_FUNCTION_11() + 16) = v0;
      v8 = MEMORY[0x1E0C809B0];
      OUTLINED_FUNCTION_47((uint64_t)&block_descriptor_61, MEMORY[0x1E0C809B0], 1107296256, v17, v19);
      v9 = OUTLINED_FUNCTION_48();
      v10 = v0;
      v11 = swift_release();
      OUTLINED_FUNCTION_28(v11, sel_setInvalidationHandler_);
      _Block_release(v7);

      *(_QWORD *)(OUTLINED_FUNCTION_11() + 16) = v10;
      OUTLINED_FUNCTION_47((uint64_t)&block_descriptor_67, v8, 1107296256, v18, v20);
      v12 = OUTLINED_FUNCTION_48();
      v13 = v10;
      v14 = swift_release();
      OUTLINED_FUNCTION_28(v14, sel_setInterruptionHandler_);
      _Block_release(v7);

      objc_msgSend(v12, sel_resume);
    }
  }
  v15 = v1;
  return v2;
}

void sub_1C2EDE498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  const char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  void *v16;
  id v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_8_1();
  v19 = v3;
  v5 = v4;
  v6 = OUTLINED_FUNCTION_22();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = OUTLINED_FUNCTION_1_2();
  v20 = *(_QWORD *)(v8 - 8);
  v21 = v8;
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_29();
  v10 = sub_1C2EF7350();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_2_1();
  if (qword_1EF7D29F0 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v10, (uint64_t)qword_1EF7D6040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v0, v12, v10);
  v13 = sub_1C2EF7344();
  v14 = sub_1C2EF759C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_24();
    *(_WORD *)v15 = 0;
    OUTLINED_FUNCTION_62_0(&dword_1C2EC6000, v13, v14, v19, v15);
    OUTLINED_FUNCTION_3_3();
  }

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0, v10);
  *(_QWORD *)(OUTLINED_FUNCTION_11() + 16) = v5;
  v16 = OUTLINED_FUNCTION_60_0();
  v17 = v5;
  OUTLINED_FUNCTION_30();
  sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_51_1(&qword_1EF7D2DE8);
  OUTLINED_FUNCTION_36_1();
  v18 = OUTLINED_FUNCTION_105();
  MEMORY[0x1C3BCC218](v18);
  _Block_release(v16);
  OUTLINED_FUNCTION_14_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v2, v21);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_0_1();
}

void sub_1C2EDE6EC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService__xpcConnection), sel_invalidate);
  sub_1C2EDE278(0);
  OUTLINED_FUNCTION_5();
}

void DeviceResolutionService.XPCError.hash(into:)()
{
  sub_1C2EF79BC();
  OUTLINED_FUNCTION_5();
}

uint64_t static DeviceResolutionService.XPCError.== infix(_:_:)()
{
  return 1;
}

uint64_t DeviceResolutionService.XPCError.hashValue.getter()
{
  sub_1C2EF79B0();
  sub_1C2EF79BC();
  return sub_1C2EF79E0();
}

uint64_t sub_1C2EDE78C()
{
  return DeviceResolutionService.XPCError.hashValue.getter();
}

void sub_1C2EDE7A0()
{
  DeviceResolutionService.XPCError.hash(into:)();
}

uint64_t sub_1C2EDE7B4()
{
  sub_1C2EF79B0();
  sub_1C2EF79BC();
  return sub_1C2EF79E0();
}

id sub_1C2EDE800()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  uint64_t v17;

  v15 = sub_1C2EF75C0();
  v1 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1C2EF75B4();
  v5 = (void (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1C2EF738C();
  MEMORY[0x1E0C80A78](v6);
  v7 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManagerReadyGroup;
  v8 = v0;
  *(_QWORD *)&v0[v7] = dispatch_group_create();
  v14 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue;
  sub_1C2ED4708(0, (unint64_t *)&unk_1EF7D3160);
  sub_1C2EF7380();
  v17 = MEMORY[0x1E0DEE9D8];
  sub_1C2EECC90(qword_1EF7D3A30, v5);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3170);
  sub_1C2EED464(qword_1EF7D3A40, (uint64_t *)&unk_1EF7D3170);
  sub_1C2EF76B0();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v15);
  *(_QWORD *)&v8[v14] = sub_1C2EF75D8();
  *(_QWORD *)&v8[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager] = 0;
  v8[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_initialLoadDone] = 0;
  v9 = (uint64_t)&v8[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_endpointUUID];
  v10 = sub_1C2EF7338();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  v8[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_waitingOnHomeManagerDataSync] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService__xpcConnection] = 0;

  v11 = (objc_class *)type metadata accessor for DeviceResolutionService();
  v16.receiver = v8;
  v16.super_class = v11;
  return objc_msgSendSuper2(&v16, sel_init);
}

void sub_1C2EDEA94()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;

  OUTLINED_FUNCTION_8_1();
  v4 = v3;
  v5 = OUTLINED_FUNCTION_22();
  v6 = (void (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_10_1();
  v9 = OUTLINED_FUNCTION_11();
  *(_QWORD *)(v9 + 16) = v0;
  *(_QWORD *)(v9 + 24) = v4;
  v10 = OUTLINED_FUNCTION_60_0();
  v11 = v0;
  v12 = v4;
  OUTLINED_FUNCTION_30();
  sub_1C2EECC90(&qword_1EF7D2DD8, v6);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_51_1(&qword_1EF7D2DE8);
  OUTLINED_FUNCTION_7_2();
  v13 = OUTLINED_FUNCTION_44();
  MEMORY[0x1C3BCC218](v13);
  _Block_release(v10);
  OUTLINED_FUNCTION_14_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  OUTLINED_FUNCTION_46(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_0_1();
}

void sub_1C2EDEBEC(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  sub_1C2EDE26C((uint64_t)a2);
}

uint64_t sub_1C2EDEC18()
{
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_82_0();
  return swift_deallocObject();
}

void sub_1C2EDEC34()
{
  uint64_t v0;

  sub_1C2EDEBEC(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
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

void sub_1C2EDEC54()
{
  char *v0;
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
  unint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  _QWORD v16[12];

  OUTLINED_FUNCTION_8_1();
  v4 = v3;
  v5 = OUTLINED_FUNCTION_22();
  v6 = OUTLINED_FUNCTION_6_2(v5);
  MEMORY[0x1E0C80A78](v6);
  v7 = OUTLINED_FUNCTION_1_2();
  v16[2] = *(_QWORD *)(v7 - 8);
  v16[3] = v7;
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_29();
  v9 = sub_1C2EF7338();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](v9);
  v16[1] = *(_QWORD *)&v0[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v4, v9);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v0;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  v16[10] = sub_1C2EDEF48;
  v16[11] = v13;
  v16[6] = MEMORY[0x1E0C809B0];
  v16[7] = 1107296256;
  v16[8] = sub_1C2ECEDA0;
  v16[9] = &block_descriptor_6_0;
  v14 = OUTLINED_FUNCTION_60_0();
  v15 = v0;
  OUTLINED_FUNCTION_30();
  v16[5] = MEMORY[0x1E0DEE9D8];
  sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_51_1(&qword_1EF7D2DE8);
  sub_1C2EF76B0();
  MEMORY[0x1C3BCC218](0, v2, v1, v14);
  _Block_release(v14);
  OUTLINED_FUNCTION_14_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v16[4] + 8));
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_0_1();
}

uint64_t sub_1C2EDEE34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D39E8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1C2EF7338();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v6, a2, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v7);
  v8 = a1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_endpointUUID;
  swift_beginAccess();
  sub_1C2EED880((uint64_t)v6, v8);
  return swift_endAccess();
}

uint64_t sub_1C2EDEF08()
{
  sub_1C2EF7338();
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_21_1();
  return OUTLINED_FUNCTION_0_8();
}

uint64_t sub_1C2EDEF48()
{
  uint64_t v0;
  uint64_t v1;

  sub_1C2EF7338();
  v0 = OUTLINED_FUNCTION_65();
  return sub_1C2EDEE34(v0, v1);
}

uint64_t sub_1C2EDEF64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3800);
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_29();
  v9 = sub_1C2EF753C();
  __swift_storeEnumTagSinglePayload(v4, 1, 1, v9);
  v10 = (_QWORD *)OUTLINED_FUNCTION_11();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v3;
  v10[5] = a1;
  v10[6] = a2;
  v10[7] = a3;
  v11 = v3;
  OUTLINED_FUNCTION_11_4();
  swift_retain();
  sub_1C2EDF2C0(v4, (uint64_t)&unk_1EF7D3810, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_1C2EDF020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  _QWORD *v9;

  v7[2] = a6;
  v7[3] = a7;
  v9 = (_QWORD *)swift_task_alloc();
  v7[4] = v9;
  *v9 = v7;
  v9[1] = sub_1C2EDF078;
  return sub_1C2EDFFCC(a5);
}

uint64_t sub_1C2EDF078(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 48) = a1;
  OUTLINED_FUNCTION_11_5();
  return swift_task_switch();
}

uint64_t sub_1C2EDF0E8()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 48));
  OUTLINED_FUNCTION_9();
  return OUTLINED_FUNCTION_68_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C2EDF120()
{
  uint64_t v0;
  void *v1;
  void (*v2)(void);
  uint64_t v3;

  v1 = *(void **)(v0 + 40);
  v2 = *(void (**)(void))(v0 + 16);
  v3 = type metadata accessor for DeviceUnit();
  OUTLINED_FUNCTION_43(v3, &qword_1EF7D3A18);
  sub_1C2EECC90(&qword_1EF7D3A88, (void (*)(uint64_t))type metadata accessor for DeviceUnit);
  sub_1C2EF73E0();
  v2();
  swift_bridgeObjectRelease();

  return OUTLINED_FUNCTION_68_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C2EDF1D0()
{
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_106();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C2EDF208(uint64_t a1)
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

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_1C2EDF294;
  return sub_1C2EDF020(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_1C2EDF294()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_6();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C2EDF2C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1C2EF753C();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1C2EED7B8(a1, &qword_1EF7D3800);
  }
  else
  {
    sub_1C2EF7530();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C2EF750C();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1C2EDF404()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_1_5();
}

uint64_t sub_1C2EDF414()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_76_0(v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3820);
  *v2 = v0;
  v2[1] = sub_1C2EDF490;
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_44_1();
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_1C2EDF490()
{
  uint64_t v0;

  OUTLINED_FUNCTION_16_2();
  if (!v0)
    OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_11_5();
  return OUTLINED_FUNCTION_1_9();
}

uint64_t sub_1C2EDF4D4()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_4_6(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1C2EDF500()
{
  sub_1C2EDF9B8();
}

uint64_t sub_1C2EDF538(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD v26[2];
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t aBlock;
  uint64_t v30;
  void (*v31)();
  void *v32;
  void (*v33)(uint64_t);
  uint64_t v34;

  v3 = sub_1C2EF7350();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B98);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1C2EDE284();
  if (!v11)
    goto LABEL_4;
  v12 = v11;
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v27((char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v7);
  v13 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v26[1] = v13 + v9;
  v14 = swift_allocObject();
  v28 = a2;
  v15 = v14;
  v26[0] = *(_QWORD *)(v8 + 32);
  ((void (*)(unint64_t, char *, uint64_t))v26[0])(v14 + v13, v10, v7);
  v33 = sub_1C2EED68C;
  v34 = v15;
  aBlock = MEMORY[0x1E0C809B0];
  v30 = 1107296256;
  v31 = sub_1C2EDDEF0;
  v32 = &block_descriptor_262;
  v16 = _Block_copy(&aBlock);
  swift_release();
  v17 = objc_msgSend(v12, sel_remoteObjectProxyWithErrorHandler_, v16);
  _Block_release(v16);

  sub_1C2EF7698();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3190);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v18 = (void *)aBlock;
    v27(v10, v28, v7);
    v19 = swift_allocObject();
    ((void (*)(unint64_t, char *, uint64_t))v26[0])(v19 + v13, v10, v7);
    v33 = (void (*)(uint64_t))sub_1C2EED6A4;
    v34 = v19;
    aBlock = MEMORY[0x1E0C809B0];
    v30 = 1107296256;
    v31 = (void (*)())sub_1C2EDF8E0;
    v32 = &block_descriptor_268;
    v20 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_pairedCompanionDeviceWithCompletion_, v20);
    _Block_release(v20);
    return swift_unknownObjectRelease_n();
  }
  else
  {
LABEL_4:
    if (qword_1EF7D29F0 != -1)
      swift_once();
    v22 = __swift_project_value_buffer(v3, (uint64_t)qword_1EF7D6040);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v22, v3);
    v23 = sub_1C2EF7344();
    v24 = sub_1C2EF759C();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1C2EC6000, v23, v24, "Failed to get remote object", v25, 2u);
      MEMORY[0x1C3BCCB60](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_1C2EECD38();
    aBlock = swift_allocError();
    return sub_1C2EF7518();
  }
}

uint64_t sub_1C2EDF8E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_1_5();
}

uint64_t sub_1C2EDF8F4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_76_0(v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3820);
  *v2 = v0;
  v2[1] = sub_1C2EDF978;
  OUTLINED_FUNCTION_9_5();
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_1C2EDF978()
{
  uint64_t v0;

  OUTLINED_FUNCTION_16_2();
  if (!v0)
    OUTLINED_FUNCTION_116();
  OUTLINED_FUNCTION_11_5();
  return OUTLINED_FUNCTION_1_9();
}

void sub_1C2EDF9B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  char *v6;
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
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
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
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  OUTLINED_FUNCTION_8_1();
  v25 = v1;
  v22 = v2;
  v23 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = OUTLINED_FUNCTION_22();
  v11 = OUTLINED_FUNCTION_6_2(v10);
  MEMORY[0x1E0C80A78](v11);
  v12 = OUTLINED_FUNCTION_1_2();
  v26 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_10_1();
  v14 = __swift_instantiateConcreteTypeFromMangledName(v5);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x1E0C80A78](v14);
  v24 = *(_QWORD *)&v7[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v9, v14);
  v17 = (*(unsigned __int8 *)(v15 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v7;
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v18 + v17, (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
  v34 = v23;
  v35 = v18;
  v30 = MEMORY[0x1E0C809B0];
  v31 = 1107296256;
  v32 = sub_1C2ECEDA0;
  v33 = v25;
  v19 = OUTLINED_FUNCTION_60_0();
  v20 = v7;
  OUTLINED_FUNCTION_30();
  v29 = MEMORY[0x1E0DEE9D8];
  sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_51_1(&qword_1EF7D2DE8);
  OUTLINED_FUNCTION_36_1();
  v21 = OUTLINED_FUNCTION_105();
  MEMORY[0x1C3BCC218](v21);
  _Block_release(v19);
  OUTLINED_FUNCTION_14_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_0_1();
}

void sub_1C2EDFB78()
{
  sub_1C2EDF9B8();
}

uint64_t sub_1C2EDFBB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD v26[2];
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t aBlock;
  uint64_t v30;
  void (*v31)();
  void *v32;
  void (*v33)(uint64_t);
  uint64_t v34;

  v3 = sub_1C2EF7350();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B98);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1C2EDE284();
  if (!v11)
    goto LABEL_4;
  v12 = v11;
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v27((char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v7);
  v13 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v26[1] = v13 + v9;
  v14 = swift_allocObject();
  v28 = a2;
  v15 = v14;
  v26[0] = *(_QWORD *)(v8 + 32);
  ((void (*)(unint64_t, char *, uint64_t))v26[0])(v14 + v13, v10, v7);
  v33 = sub_1C2EED68C;
  v34 = v15;
  aBlock = MEMORY[0x1E0C809B0];
  v30 = 1107296256;
  v31 = sub_1C2EDDEF0;
  v32 = &block_descriptor_244;
  v16 = _Block_copy(&aBlock);
  swift_release();
  v17 = objc_msgSend(v12, sel_remoteObjectProxyWithErrorHandler_, v16);
  _Block_release(v16);

  sub_1C2EF7698();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3190);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v18 = (void *)aBlock;
    v27(v10, v28, v7);
    v19 = swift_allocObject();
    ((void (*)(unint64_t, char *, uint64_t))v26[0])(v19 + v13, v10, v7);
    v33 = (void (*)(uint64_t))sub_1C2EED6A4;
    v34 = v19;
    aBlock = MEMORY[0x1E0C809B0];
    v30 = 1107296256;
    v31 = (void (*)())sub_1C2EDF8E0;
    v32 = &block_descriptor_250;
    v20 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_meDeviceWithCompletion_, v20);
    _Block_release(v20);
    return swift_unknownObjectRelease_n();
  }
  else
  {
LABEL_4:
    if (qword_1EF7D29F0 != -1)
      swift_once();
    v22 = __swift_project_value_buffer(v3, (uint64_t)qword_1EF7D6040);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v22, v3);
    v23 = sub_1C2EF7344();
    v24 = sub_1C2EF759C();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1C2EC6000, v23, v24, "Failed to get remote object", v25, 2u);
      MEMORY[0x1C3BCCB60](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_1C2EECD38();
    aBlock = swift_allocError();
    return sub_1C2EF7518();
  }
}

uint64_t sub_1C2EDFF58(void *a1)
{
  if (a1)
  {
    type metadata accessor for DeviceUnit();
    DeviceUnit.__allocating_init(deviceUnitObjC:)(a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B98);
  return sub_1C2EF7524();
}

uint64_t sub_1C2EDFFCC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v2[3] = a1;
  v2[4] = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v2[5] = v3;
  *v3 = v2;
  v3[1] = sub_1C2EE000C;
  return OUTLINED_FUNCTION_55_1();
}

uint64_t sub_1C2EE000C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_29_0(a1);
  if (v1)
    return OUTLINED_FUNCTION_4_6(*(uint64_t (**)(void))(v2 + 8));
  OUTLINED_FUNCTION_11_5();
  return OUTLINED_FUNCTION_54_1();
}

uint64_t sub_1C2EE0048()
{
  uint64_t v0;
  int8x16_t *v1;
  _QWORD *v2;

  v1 = (int8x16_t *)OUTLINED_FUNCTION_109();
  OUTLINED_FUNCTION_67_0(v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3840);
  *v2 = v0;
  v2[1] = sub_1C2EE00CC;
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_44_1();
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_1C2EE00CC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_34_1();
  if (!v0)
    swift_task_dealloc();
  OUTLINED_FUNCTION_11_5();
  return OUTLINED_FUNCTION_1_9();
}

uint64_t sub_1C2EE0110()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_53_0(*(_QWORD *)(v0 + 16), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C2EE013C()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_4_6(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C2EE0170(uint64_t a1, char *a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD aBlock[6];

  v25 = a4;
  v26 = sub_1C2EF7374();
  v30 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1C2EF738C();
  v28 = *(_QWORD *)(v9 - 8);
  v29 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AE0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = *(_QWORD *)&a2[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  v16 = (*(unsigned __int8 *)(v13 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = a3;
  *((_QWORD *)v17 + 3) = a2;
  v18 = v25;
  *((_QWORD *)v17 + 4) = v25;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v17[v16], v15, v12);
  aBlock[4] = sub_1C2EED2FC;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C2ECEDA0;
  aBlock[3] = &block_descriptor_191;
  v19 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v20 = a2;
  v21 = v18;
  sub_1C2EF7380();
  v31 = MEMORY[0x1E0DEE9D8];
  sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DE0);
  sub_1C2EED464(&qword_1EF7D2DE8, &qword_1EF7D2DE0);
  v22 = v26;
  sub_1C2EF76B0();
  MEMORY[0x1C3BCC218](0, v11, v8, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v22);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v29);
  return swift_release();
}

uint64_t sub_1C2EE03FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
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
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, char *, uint64_t);
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  _QWORD v47[2];
  char *v48;
  uint64_t v49;
  uint64_t v50;
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
  uint64_t aBlock;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v57 = a2;
  v52 = sub_1C2EF7350();
  v7 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  v9 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AE0);
  v51 = *(_QWORD *)(v10 - 8);
  v11 = *(_QWORD *)(v51 + 64);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a1 + 16);
  v55 = v7;
  v54 = v9;
  v53 = v11;
  if (v13)
  {
    v48 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v49 = v10;
    v50 = a4;
    swift_bridgeObjectRetain();
    v47[1] = a1;
    v56 = a3;
    v14 = (uint64_t *)(a1 + 56);
    v15 = MEMORY[0x1E0DEE9D8];
    do
    {
      v61 = v13;
      v62 = v15;
      v16 = *(v14 - 2);
      v17 = *(v14 - 1);
      v18 = *v14;
      v20 = v14[1];
      v19 = v14[2];
      v22 = v14[3];
      v21 = v14[4];
      v24 = v14[5];
      v23 = v14[6];
      aBlock = *(v14 - 3);
      v64 = v16;
      v65 = v17;
      v66 = (void *)v18;
      v67 = v20;
      v68 = v19;
      v58 = v19;
      v59 = v24;
      v69 = v22;
      v70 = v21;
      v60 = v21;
      v71 = v24;
      v72 = v23;
      sub_1C2EDD550(v16, v17, v18);
      sub_1C2EDD550(v20, v19, v22);
      sub_1C2EDD550(v21, v24, v23);
      sub_1C2EE8D7C();
      v26 = v25;
      aBlock = v62;
      swift_bridgeObjectRetain();
      sub_1C2EE93A8(v26);
      v27 = v17;
      v28 = v61;
      sub_1C2EDD598(v16, v27, v18);
      sub_1C2EDD598(v20, v58, v22);
      sub_1C2EDD598(v60, v59, v23);
      swift_bridgeObjectRelease();
      v15 = aBlock;
      v14 += 10;
      v13 = v28 - 1;
    }
    while (v13);
    swift_bridgeObjectRelease();
    a4 = v50;
    v10 = v49;
    v7 = v55;
    v9 = v54;
    v12 = v48;
  }
  else
  {
    v15 = MEMORY[0x1E0DEE9D8];
  }
  v29 = sub_1C2EDE284();
  if (v29)
  {
    v30 = v29;
    v62 = v15;
    v31 = v51;
    v32 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
    v32(v12, a4, v10);
    v33 = *(unsigned __int8 *)(v31 + 80);
    v34 = swift_allocObject();
    v35 = *(void (**)(uint64_t, char *, uint64_t))(v31 + 32);
    v35(v34 + ((v33 + 16) & ~v33), v12, v10);
    v67 = (uint64_t)sub_1C2EED358;
    v68 = v34;
    aBlock = MEMORY[0x1E0C809B0];
    v64 = 1107296256;
    v65 = (uint64_t)sub_1C2EDDEF0;
    v66 = &block_descriptor_197;
    v36 = _Block_copy(&aBlock);
    swift_release();
    v37 = objc_msgSend(v30, sel_remoteObjectProxyWithErrorHandler_, v36);
    _Block_release(v36);

    sub_1C2EF7698();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3190);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v38 = (void *)aBlock;
      v32(v12, a4, v10);
      v39 = swift_allocObject();
      *(_QWORD *)(v39 + 16) = v62;
      v35(v39 + ((v33 + 24) & ~v33), v12, v10);
      v67 = (uint64_t)sub_1C2EED3AC;
      v68 = v39;
      aBlock = MEMORY[0x1E0C809B0];
      v64 = 1107296256;
      v65 = (uint64_t)sub_1C2EE12C0;
      v66 = &block_descriptor_203;
      v40 = _Block_copy(&aBlock);
      swift_unknownObjectRetain();
      swift_release();
      objc_msgSend(v38, sel_getAllReachableDevicesWithCompletion_, v40);
      _Block_release(v40);
      return swift_unknownObjectRelease_n();
    }
    swift_bridgeObjectRelease();
    v7 = v55;
    v9 = v54;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v42 = v52;
  if (qword_1EF7D29F0 != -1)
    swift_once();
  v43 = __swift_project_value_buffer(v42, (uint64_t)qword_1EF7D6040);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v43, v42);
  v44 = sub_1C2EF7344();
  v45 = sub_1C2EF759C();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v46 = 0;
    _os_log_impl(&dword_1C2EC6000, v44, v45, "Failed to get remote object", v46, 2u);
    MEMORY[0x1C3BCCB60](v46, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v42);
  sub_1C2EECD38();
  aBlock = swift_allocError();
  return sub_1C2EF7518();
}

uint64_t sub_1C2EE098C(unint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t i;
  id v5;
  unint64_t isUniquelyReferenced_nonNull_native;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;

  v33 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1C2EF7884();
    if (v3)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = MEMORY[0x1E0DEE9D8];
    goto LABEL_16;
  }
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v3)
    goto LABEL_15;
LABEL_3:
  type metadata accessor for DeviceUnit();
  if (v3 < 1)
  {
    __break(1u);
LABEL_42:
    result = sub_1C2EF7968();
    __break(1u);
    return result;
  }
  for (i = 0; i != v3; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0)
      v5 = (id)MEMORY[0x1C3BCC3B0](i, a1);
    else
      v5 = *(id *)(a1 + 8 * i + 32);
    if (DeviceUnit.__allocating_init(deviceUnitObjC:)(v5))
    {
      MEMORY[0x1C3BCC104]();
      if (*(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1C2EF74F4();
      sub_1C2EF7500();
      sub_1C2EF74E8();
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = v33;
LABEL_16:
  type metadata accessor for DeviceUnit();
  v7 = (_QWORD *)sub_1C2EF73E0();
  if (isUniquelyReferenced_nonNull_native >> 62)
    goto LABEL_39;
  v8 = *(_QWORD *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v8)
  {
    v31 = isUniquelyReferenced_nonNull_native;
    v32 = isUniquelyReferenced_nonNull_native & 0xC000000000000001;
    v9 = 4;
    v30 = v8;
    while (1)
    {
      v10 = v32
          ? (char *)MEMORY[0x1C3BCC3B0](v9 - 4, isUniquelyReferenced_nonNull_native)
          : (char *)*(id *)(isUniquelyReferenced_nonNull_native + 8 * v9);
      v11 = v10;
      v12 = v9 - 3;
      if (__OFADD__(v9 - 4, 1))
        break;
      v13 = *(_QWORD *)&v10[OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier + 8];
      if (v13)
      {
        v14 = *(_QWORD *)&v10[OBJC_IVAR___SVDDeviceUnitSwift_homeKitAccessoryIdentifier];
        swift_bridgeObjectRetain();
        v15 = v11;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v16 = sub_1C2EC907C(v14, v13);
        if (__OFADD__(v7[2], (v17 & 1) == 0))
          goto LABEL_37;
        v18 = v16;
        v19 = v17;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AE8);
        if ((sub_1C2EF77D0() & 1) != 0)
        {
          v20 = sub_1C2EC907C(v14, v13);
          if ((v19 & 1) != (v21 & 1))
            goto LABEL_42;
          v18 = v20;
        }
        if ((v19 & 1) != 0)
        {
          v22 = v7[7];

          *(_QWORD *)(v22 + 8 * v18) = v15;
        }
        else
        {
          v7[(v18 >> 6) + 8] |= 1 << v18;
          v23 = (uint64_t *)(v7[6] + 16 * v18);
          *v23 = v14;
          v23[1] = v13;
          *(_QWORD *)(v7[7] + 8 * v18) = v15;
          v24 = v7[2];
          v25 = __OFADD__(v24, 1);
          v26 = v24 + 1;
          if (v25)
            goto LABEL_38;
          v7[2] = v26;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v8 = v30;
        isUniquelyReferenced_nonNull_native = v31;
      }
      else
      {

      }
      ++v9;
      if (v12 == v8)
        goto LABEL_35;
    }
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain_n();
    v8 = sub_1C2EF7884();
    swift_bridgeObjectRelease();
  }
LABEL_35:
  swift_bridgeObjectRelease_n();
  sub_1C2ED4708(0, &qword_1EF7D3A18);
  sub_1C2EECC90(&qword_1EF7D3A88, (void (*)(uint64_t))type metadata accessor for DeviceUnit);
  v27 = sub_1C2EF73E0();
  swift_bridgeObjectRetain();
  sub_1C2EE0F98(v27, a2, (uint64_t)v7);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AE0);
  return sub_1C2EF7524();
}

uint64_t sub_1C2EE0DB0(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v16 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_17;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_1C2EF7884())
  {
    v5 = 4;
    while (1)
    {
      v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C3BCC3B0](v5 - 4, a1) : *(id *)(a1 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      if (!*(_QWORD *)(a2 + 16))
        goto LABEL_10;
      v9 = objc_msgSend(v6, sel_category);
      v10 = objc_msgSend(v9, sel_categoryType);

      v11 = sub_1C2EF741C();
      v13 = v12;

      LOBYTE(v11) = sub_1C2EDE04C(v11, v13, a2);
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {

      }
      else
      {
LABEL_10:
        MEMORY[0x1C3BCC104]();
        if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1C2EF74F4();
        sub_1C2EF7500();
        sub_1C2EF74E8();
      }
      ++v5;
      if (v8 == v4)
      {
        swift_bridgeObjectRelease();
        v14 = v16;
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  v14 = MEMORY[0x1E0DEE9D8];
LABEL_19:
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1C2EE0F98(uint64_t a1, unint64_t a2, uint64_t isUniquelyReferenced_nonNull_native)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  _BOOL8 v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  id v39;
  uint64_t result;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v4 = v3;
  v8 = sub_1C2EF7338();
  v47 = *(_QWORD *)(v8 - 8);
  v48 = v8;
  MEMORY[0x1E0C80A78](v8);
  v46 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 >> 62)
  {
LABEL_33:
    swift_bridgeObjectRetain();
    v10 = sub_1C2EF7884();
    if (v10)
      goto LABEL_3;
LABEL_34:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return a1;
  }
  v10 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v10)
    goto LABEL_34;
LABEL_3:
  v41 = v4;
  v42 = a2;
  v44 = v10;
  v45 = a2 & 0xC000000000000001;
  v11 = 4;
  v43 = isUniquelyReferenced_nonNull_native;
  while (1)
  {
    if (v45)
      v12 = (id)MEMORY[0x1C3BCC3B0](v11 - 4, a2);
    else
      v12 = *(id *)(a2 + 8 * v11);
    v4 = v12;
    v13 = v11 - 3;
    if (__OFADD__(v11 - 4, 1))
    {
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    v14 = objc_msgSend(v12, sel_uniqueIdentifier);
    v15 = v46;
    sub_1C2EF7320();

    v16 = sub_1C2EF7314();
    v18 = v17;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v15, v48);
    if (!*(_QWORD *)(isUniquelyReferenced_nonNull_native + 16) || (v19 = sub_1C2EC907C(v16, v18), (v20 & 1) == 0))
    {

      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    a2 = (unint64_t)*(id *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 8 * v19);
    swift_bridgeObjectRelease();
    if ((a1 & 0xC000000000000001) != 0)
    {
      if (a1 < 0)
        v21 = a1;
      else
        v21 = a1 & 0xFFFFFFFFFFFFFF8;
      v22 = (id)a2;
      v23 = v4;
      v24 = sub_1C2EF76E0();
      if (__OFADD__(v24, 1))
        goto LABEL_31;
      a1 = sub_1C2EEB538(v21, v24 + 1);
    }
    else
    {
      v25 = (id)a2;
      v26 = v4;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v49 = a1;
    v27 = sub_1C2ECC500();
    v29 = *(_QWORD *)(a1 + 16);
    v30 = (v28 & 1) == 0;
    a1 = v29 + v30;
    if (__OFADD__(v29, v30))
      goto LABEL_30;
    v31 = v27;
    v32 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AF0);
    if ((sub_1C2EF77D0() & 1) != 0)
      break;
LABEL_22:
    a1 = v49;
    if ((v32 & 1) != 0)
    {
      v35 = *(_QWORD *)(v49 + 56);

      *(_QWORD *)(v35 + 8 * v31) = v4;
    }
    else
    {
      *(_QWORD *)(v49 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v31) = a2;
      *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v31) = v4;
      v36 = *(_QWORD *)(a1 + 16);
      v37 = __OFADD__(v36, 1);
      v38 = v36 + 1;
      if (v37)
        goto LABEL_32;
      *(_QWORD *)(a1 + 16) = v38;
      v39 = (id)a2;
    }

    swift_bridgeObjectRelease();
    a2 = v42;
    isUniquelyReferenced_nonNull_native = v43;
LABEL_27:
    ++v11;
    if (v13 == v44)
      goto LABEL_34;
  }
  v33 = sub_1C2ECC500();
  if ((v32 & 1) == (v34 & 1))
  {
    v31 = v33;
    goto LABEL_22;
  }
  type metadata accessor for DeviceUnit();
  result = sub_1C2EF7968();
  __break(1u);
  return result;
}

uint64_t sub_1C2EE12C0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1C2ED4708(0, &qword_1EF7D3140);
  v2 = sub_1C2EF74D0();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EE132C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  *(_BYTE *)(v3 + 80) = a2;
  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 40) = v4;
  *v4 = v3;
  v4[1] = sub_1C2EE1370;
  return OUTLINED_FUNCTION_55_1();
}

uint64_t sub_1C2EE1370(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_29_0(a1);
  if (v1)
    return OUTLINED_FUNCTION_4_6(*(uint64_t (**)(void))(v2 + 8));
  OUTLINED_FUNCTION_11_5();
  return OUTLINED_FUNCTION_54_1();
}

uint64_t sub_1C2EE13AC()
{
  uint64_t v0;
  char v1;
  int8x16_t *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_BYTE *)(v0 + 80);
  v2 = (int8x16_t *)OUTLINED_FUNCTION_109();
  OUTLINED_FUNCTION_67_0(v2);
  *(_BYTE *)(v3 + 40) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3850);
  *v4 = v0;
  v4[1] = sub_1C2EE00CC;
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_44_1();
  return sub_1C2EF7944();
}

uint64_t sub_1C2EE1444(uint64_t a1, char *a2, uint64_t a3, void *a4, int a5)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char *v21;
  id v22;
  uint64_t v23;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD aBlock[6];

  v26 = a5;
  v25 = a4;
  v27 = sub_1C2EF7374();
  v31 = *(_QWORD *)(v27 - 8);
  MEMORY[0x1E0C80A78](v27);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1C2EF738C();
  v29 = *(_QWORD *)(v10 - 8);
  v30 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3AD0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = *(_QWORD *)&a2[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  v17 = (*(unsigned __int8 *)(v14 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a3;
  *(_QWORD *)(v18 + 24) = a2;
  v19 = v25;
  *(_QWORD *)(v18 + 32) = v25;
  *(_BYTE *)(v18 + 40) = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v18 + v17, v16, v13);
  aBlock[4] = sub_1C2EED1F0;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C2ECEDA0;
  aBlock[3] = &block_descriptor_173;
  v20 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v21 = a2;
  v22 = v19;
  sub_1C2EF7380();
  v32 = MEMORY[0x1E0DEE9D8];
  sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DE0);
  sub_1C2EED464(&qword_1EF7D2DE8, &qword_1EF7D2DE0);
  v23 = v27;
  sub_1C2EF76B0();
  MEMORY[0x1C3BCC218](0, v12, v9, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v23);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v30);
  return swift_release();
}

uint64_t sub_1C2EE16DC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
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
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(_QWORD, _QWORD, _QWORD);
  uint64_t v29;
  void (*v30)(_QWORD, _QWORD, _QWORD);
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint8_t *v42;
  uint64_t v43;
  void (*v45)(char *, uint64_t);
  id v46;
  void *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, char *, uint64_t);
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  _QWORD v63[2];
  int v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t, uint64_t);
  uint64_t v78;
  void (*v79)(char *, uint64_t, uint64_t);
  uint64_t v80;
  uint64_t aBlock;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(_QWORD, _QWORD, _QWORD);
  uint64_t v89;
  void (*v90)(_QWORD, _QWORD, _QWORD);

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3AD0);
  v67 = *(_QWORD *)(v10 - 8);
  v11 = *(_QWORD *)(v67 + 64);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1C2EF7350();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v68 = (char *)v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x1E0C80A78](v15);
  v72 = (char *)v63 - v18;
  v19 = *(_QWORD *)(a1 + 16);
  v71 = a5;
  v70 = v17;
  v73 = v11;
  if (!v19)
  {
    v22 = MEMORY[0x1E0DEE9D8];
    if ((a4 & 1) != 0)
      goto LABEL_5;
LABEL_12:
    aBlock = v22;
    return sub_1C2EF7524();
  }
  v64 = a4;
  v69 = v14;
  v65 = (char *)v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = v10;
  v20 = v19;
  swift_bridgeObjectRetain();
  v63[1] = a1;
  v21 = (uint64_t *)(a1 + 56);
  v22 = MEMORY[0x1E0DEE9D8];
  v75 = a3;
  v74 = a2;
  do
  {
    v80 = v22;
    v23 = *(v21 - 3);
    v76 = *(v21 - 2);
    v25 = *(v21 - 1);
    v24 = *v21;
    v26 = v21[1];
    v27 = v21[2];
    v29 = v21[3];
    v28 = (void (*)(_QWORD, _QWORD, _QWORD))v21[4];
    v31 = v21[5];
    v30 = (void (*)(_QWORD, _QWORD, _QWORD))v21[6];
    aBlock = v23;
    v82 = v76;
    v83 = v25;
    v84 = (void *)v24;
    v85 = v26;
    v86 = v27;
    v87 = v29;
    v88 = v28;
    v78 = v31;
    v79 = (void (*)(char *, uint64_t, uint64_t))v28;
    v89 = v31;
    v90 = v30;
    v77 = (void (*)(char *, uint64_t, uint64_t))v30;
    sub_1C2EDD550(v76, v25, v24);
    sub_1C2EDD550(v26, v27, v29);
    sub_1C2EDD550((uint64_t)v28, v31, (uint64_t)v30);
    sub_1C2EE8D7C();
    v32 = v20;
    v34 = v33;
    aBlock = v80;
    swift_bridgeObjectRetain();
    v35 = v34;
    v36 = v32;
    sub_1C2EE93A8(v35);
    sub_1C2EDD598(v76, v25, v24);
    sub_1C2EDD598(v26, v27, v29);
    sub_1C2EDD598((uint64_t)v79, v78, (uint64_t)v77);
    swift_bridgeObjectRelease();
    v22 = aBlock;
    v21 += 10;
    v20 = v36 - 1;
  }
  while (v20);
  swift_bridgeObjectRelease();
  v10 = v66;
  a5 = v71;
  v13 = v70;
  v12 = v65;
  v14 = v69;
  if ((v64 & 1) == 0)
    goto LABEL_12;
LABEL_5:
  if (qword_1EF7D29F0 != -1)
    swift_once();
  v37 = __swift_project_value_buffer(v13, (uint64_t)qword_1EF7D6040);
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v78 = v37;
  v79 = v38;
  ((void (*)(char *))v38)(v72);
  swift_bridgeObjectRetain_n();
  v39 = sub_1C2EF7344();
  v40 = sub_1C2EF7590();
  v41 = os_log_type_enabled(v39, v40);
  v80 = v22;
  if (v41)
  {
    v69 = v14;
    v42 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v42 = 134217984;
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      v43 = sub_1C2EF7884();
      swift_bridgeObjectRelease();
    }
    else
    {
      v43 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    aBlock = v43;
    sub_1C2EF7668();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2EC6000, v39, v40, "accessories matching description: %ld", v42, 0xCu);
    MEMORY[0x1C3BCCB60](v42, -1, -1);
    v14 = v69;
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v45 = *(void (**)(char *, uint64_t))(v14 + 8);
  v45(v72, v13);
  v46 = sub_1C2EDE284();
  if (v46)
  {
    v47 = v46;
    v48 = v67;
    v77 = *(void (**)(char *, uint64_t, uint64_t))(v67 + 16);
    v77(v12, a5, v10);
    v49 = v12;
    v50 = *(unsigned __int8 *)(v48 + 80);
    v51 = swift_allocObject();
    v52 = *(void (**)(uint64_t, char *, uint64_t))(v48 + 32);
    v52(v51 + ((v50 + 16) & ~v50), v49, v10);
    v85 = (uint64_t)sub_1C2EED238;
    v86 = v51;
    v53 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v82 = 1107296256;
    v83 = (uint64_t)sub_1C2EDDEF0;
    v84 = &block_descriptor_179;
    v54 = _Block_copy(&aBlock);
    swift_release();
    v55 = objc_msgSend(v47, sel_remoteObjectProxyWithErrorHandler_, v54);
    _Block_release(v54);

    sub_1C2EF7698();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3190);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v56 = v53;
      v57 = (void *)aBlock;
      v77(v49, v71, v10);
      v58 = swift_allocObject();
      *(_QWORD *)(v58 + 16) = v80;
      v52(v58 + ((v50 + 24) & ~v50), v49, v10);
      v85 = (uint64_t)sub_1C2EED29C;
      v86 = v58;
      aBlock = v56;
      v82 = 1107296256;
      v83 = (uint64_t)sub_1C2EE12C0;
      v84 = &block_descriptor_185;
      v59 = _Block_copy(&aBlock);
      swift_unknownObjectRetain();
      swift_release();
      objc_msgSend(v57, sel_getAllReachableDevicesWithCompletion_, v59);
      _Block_release(v59);
      return swift_unknownObjectRelease_n();
    }
    swift_bridgeObjectRelease();
    v13 = v70;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v79(v68, v78, v13);
  v60 = sub_1C2EF7344();
  v61 = sub_1C2EF759C();
  if (os_log_type_enabled(v60, v61))
  {
    v62 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v62 = 0;
    _os_log_impl(&dword_1C2EC6000, v60, v61, "Failed to get remote object", v62, 2u);
    MEMORY[0x1C3BCCB60](v62, -1, -1);
  }

  v45(v68, v13);
  sub_1C2EECD38();
  aBlock = swift_allocError();
  return sub_1C2EF7518();
}

void sub_1C2EE1E18()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_8_1();
  v2 = v1;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_31();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_10_1();
  if (qword_1EF7D29F0 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v5, (uint64_t)qword_1EF7D6040);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v0, v7, v5);
  v8 = v4;
  v9 = v4;
  v10 = sub_1C2EF7344();
  v11 = sub_1C2EF759C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_24();
    *(_DWORD *)v12 = 136315138;
    swift_getErrorValue();
    v13 = OUTLINED_FUNCTION_94();
    v15 = OUTLINED_FUNCTION_92(v13, v14);
    OUTLINED_FUNCTION_90_0(v15);
    sub_1C2EF7668();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_73_0();
    OUTLINED_FUNCTION_73_0();
    OUTLINED_FUNCTION_89(&dword_1C2EC6000, v10, v11, "Error reaching remote: %s", v12);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_3();
  }
  OUTLINED_FUNCTION_73_0();
  OUTLINED_FUNCTION_73_0();

  OUTLINED_FUNCTION_46(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  sub_1C2EECD38();
  swift_allocError();
  __swift_instantiateConcreteTypeFromMangledName(v2);
  sub_1C2EF7518();
  OUTLINED_FUNCTION_0_1();
}

uint64_t sub_1C2EE1FFC(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1C2EF7884();
    v2 = result;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  if (!v2)
  {
    v5 = (char *)MEMORY[0x1E0DEE9D8];
LABEL_18:
    swift_bridgeObjectRelease();
    v14 = swift_bridgeObjectRetain();
    sub_1C2EE2824(v14, v5);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3AD0);
    return sub_1C2EF7524();
  }
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (char *)MEMORY[0x1E0DEE9D8];
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x1C3BCC3B0](v4, a1);
      else
        v6 = *(id *)(a1 + 8 * v4 + 32);
      v7 = v6;
      v8 = sub_1C2EEC780(v6);
      v10 = v9;

      if (v10)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_1C2EEACD0(0, *((_QWORD *)v5 + 2) + 1, 1, (uint64_t)v5);
        v12 = *((_QWORD *)v5 + 2);
        v11 = *((_QWORD *)v5 + 3);
        if (v12 >= v11 >> 1)
          v5 = sub_1C2EEACD0((char *)(v11 > 1), v12 + 1, 1, (uint64_t)v5);
        *((_QWORD *)v5 + 2) = v12 + 1;
        v13 = &v5[16 * v12];
        *((_QWORD *)v13 + 4) = v8;
        *((_QWORD *)v13 + 5) = v10;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2EE219C(id *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  int v36;
  int v37;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v4 = sub_1C2EF7350();
  v45 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v44 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_1C2EF7338();
  v6 = *(_QWORD *)(v43 - 8);
  MEMORY[0x1E0C80A78](v43);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v10 = objc_msgSend(*a1, sel_category);
  v11 = objc_msgSend(v10, sel_categoryType);

  v12 = sub_1C2EF741C();
  v14 = v13;

  if (v12 == sub_1C2EF741C() && v14 == v15)
    v42 = 1;
  else
    v42 = sub_1C2EF7938();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v9, sel_uniqueIdentifier);
  sub_1C2EF7320();

  v18 = sub_1C2EF7314();
  v20 = v19;
  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v8, v43);
  v41 = sub_1C2EE25A0(v18, v20, a2);
  swift_bridgeObjectRelease();
  if (qword_1EF7D29F0 != -1)
    swift_once();
  v22 = __swift_project_value_buffer(v4, (uint64_t)qword_1EF7D6040);
  v24 = v44;
  v23 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v44, v22, v4);
  v25 = v9;
  v26 = sub_1C2EF7344();
  v27 = v4;
  v28 = sub_1C2EF7590();
  if (os_log_type_enabled(v26, v28))
  {
    v29 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v47 = v30;
    *(_DWORD *)v29 = 136315650;
    v31 = objc_msgSend(v25, sel_uniqueIdentifier, v29 + 4);
    v40 = v27;
    v32 = v31;
    sub_1C2EF7320();

    v33 = sub_1C2EF7314();
    v35 = v34;
    v21(v8, v43);
    v46 = sub_1C2ED1D08(v33, v35, &v47);
    sub_1C2EF7668();

    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 1024;
    v36 = v42;
    LODWORD(v46) = v42 & 1;
    sub_1C2EF7668();
    *(_WORD *)(v29 + 18) = 1024;
    v37 = v41;
    LODWORD(v46) = v41 & 1;
    sub_1C2EF7668();
    _os_log_impl(&dword_1C2EC6000, v26, v28, "accessory %s: isTelevisionDevice=%{BOOL}d, isReachable=%{BOOL}d", (uint8_t *)v29, 0x18u);
    swift_arrayDestroy();
    MEMORY[0x1C3BCCB60](v30, -1, -1);
    MEMORY[0x1C3BCCB60](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v40);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v27);
    v37 = v41;
    v36 = v42;
  }
  return (v36 | v37) & 1;
}

uint64_t sub_1C2EE25A0(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_1C2EF7938();
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
    if (v12 || (sub_1C2EF7938() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2EE2664(unint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v11 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_16;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x1C3BCC3B0](v3, a1);
LABEL_7:
        v5 = v4;
        v6 = v3 + 1;
        if (__OFADD__(v3, 1))
          goto LABEL_15;
        v7 = objc_msgSend(v4, sel_name);
        sub_1C2EF741C();

        sub_1C2EDB924();
        v8 = sub_1C2EF768C();
        swift_bridgeObjectRelease();
        if (v8)
        {

        }
        else
        {
          sub_1C2EF7788();
          sub_1C2EF77AC();
          sub_1C2EF77B8();
          sub_1C2EF7794();
        }
        ++v3;
        if (v6 == v2)
        {
          v9 = v11;
          goto LABEL_18;
        }
      }
      if (v3 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      v2 = sub_1C2EF7884();
      if (!v2)
        goto LABEL_17;
    }
    v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_7;
  }
LABEL_17:
  v9 = MEMORY[0x1E0DEE9D8];
LABEL_18:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1C2EE2824(unint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  id v15;
  uint64_t v16;

  v3 = v2;
  v16 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_18;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v6)
  {
    while (1)
    {
      v7 = 0;
      v8 = a1 & 0xC000000000000001;
      while (v8)
      {
        v9 = (id)MEMORY[0x1C3BCC3B0](v7, a1);
LABEL_7:
        v10 = v9;
        v11 = v7 + 1;
        if (__OFADD__(v7, 1))
          goto LABEL_17;
        v15 = v9;
        v12 = sub_1C2EE219C(&v15, a2);
        if (v3)
        {
          swift_bridgeObjectRelease();

          v13 = v16;
          swift_bridgeObjectRelease();
          swift_release();
          return v13;
        }
        if ((v12 & 1) != 0)
        {
          sub_1C2EF7788();
          sub_1C2EF77AC();
          v3 = 0;
          sub_1C2EF77B8();
          sub_1C2EF7794();
          v8 = a1 & 0xC000000000000001;
        }
        else
        {

        }
        ++v7;
        if (v11 == v6)
        {
          v13 = v16;
          goto LABEL_20;
        }
      }
      if (v7 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v6 = sub_1C2EF7884();
      if (!v6)
        goto LABEL_19;
    }
    v9 = *(id *)(a1 + 8 * v7 + 32);
    goto LABEL_7;
  }
LABEL_19:
  v13 = MEMORY[0x1E0DEE9D8];
LABEL_20:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1C2EE29DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return OUTLINED_FUNCTION_1_5();
}

uint64_t sub_1C2EE29EC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = OUTLINED_FUNCTION_91();
  *(_QWORD *)(v0 + 40) = v1;
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3860);
  *v2 = v0;
  v2[1] = sub_1C2EE2A74;
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_44_1();
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_1C2EE2A74()
{
  uint64_t v0;

  OUTLINED_FUNCTION_35_1();
  if (!v0)
    swift_task_dealloc();
  OUTLINED_FUNCTION_11_5();
  return OUTLINED_FUNCTION_1_9();
}

uint64_t sub_1C2EE2AB8(uint64_t a1, unint64_t a2, char *a3)
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
  uint64_t v13;
  uint64_t result;
  uint64_t i;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[6];
  uint64_t v39;
  uint64_t v40;

  v33 = a1;
  v34 = a3;
  v4 = sub_1C2EF7374();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1C2EF738C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v35 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3AC0);
  v11 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32);
  v30 = v12;
  v31 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = MEMORY[0x1E0DEE9D8];
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1C2EF7884();
    v13 = result;
  }
  else
  {
    v13 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v36 = v9;
  v37 = v8;
  if (!v13)
  {
    swift_bridgeObjectRelease();
    v18 = MEMORY[0x1E0DEE9D8];
LABEL_18:
    v19 = v34;
    v29 = *(_QWORD *)&v34[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
    v20 = v31;
    v21 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v31, v33, v32);
    v22 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v19;
    *(_QWORD *)(v23 + 24) = v18;
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v23 + v22, v20, v21);
    aBlock[4] = sub_1C2EED0CC;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C2ECEDA0;
    aBlock[3] = &block_descriptor_159;
    v24 = _Block_copy(aBlock);
    v25 = v19;
    v26 = v35;
    sub_1C2EF7380();
    v40 = MEMORY[0x1E0DEE9D8];
    sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DE0);
    sub_1C2EED464(&qword_1EF7D2DE8, &qword_1EF7D2DE0);
    sub_1C2EF76B0();
    MEMORY[0x1C3BCC218](0, v26, v7, v24);
    _Block_release(v24);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v26, v37);
    return swift_release();
  }
  if (v13 >= 1)
  {
    v27 = v7;
    v28 = v5;
    v29 = v4;
    for (i = 0; i != v13; ++i)
    {
      if ((a2 & 0xC000000000000001) != 0)
        v16 = (id)MEMORY[0x1C3BCC3B0](i, a2);
      else
        v16 = *(id *)(a2 + 8 * i + 32);
      v17 = v16;
      objc_msgSend(v16, sel_copy, v27, v28);
      sub_1C2EF7698();
      swift_unknownObjectRelease();
      type metadata accessor for CapabilityDescription();
      if ((swift_dynamicCast() & 1) == 0)
        v39 = 0;

      if (v39)
      {
        MEMORY[0x1C3BCC104]();
        if (*(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1C2EF74F4();
        sub_1C2EF7500();
        sub_1C2EF74E8();
      }
    }
    swift_bridgeObjectRelease();
    v18 = v40;
    v5 = v28;
    v4 = v29;
    v7 = v27;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2EE2E9C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  char *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  double *v25;
  double v26;
  double v27;
  id v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  void *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t aBlock[8];

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3AC0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  v8 = sub_1C2EF7350();
  v67 = *(_QWORD *)(v8 - 8);
  v68 = v8;
  v9 = MEMORY[0x1E0C80A78](v8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v58 - v10;
  v66 = swift_allocObject();
  *(_QWORD *)(v66 + 16) = MEMORY[0x1E0DEE9E0];
  v12 = (void *)sub_1C2EE572C();
  v58 = v11;
  v60 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = v6;
  v62 = v12;
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1C2EF7884();
    v13 = result;
  }
  else
  {
    v13 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v15 = a3;
  v59 = v7;
  v64 = v5;
  if (v13)
  {
    if (v13 >= 1)
    {
      v63 = a3;
      v16 = 0;
      v17 = a2 & 0xC000000000000001;
      v18 = &OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key;
      v19 = &OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet;
      v65 = (uint8_t *)v13;
      while (1)
      {
        v20 = v17 ? (char *)MEMORY[0x1C3BCC3B0](v16, a2) : (char *)*(id *)(a2 + 8 * v16 + 32);
        v21 = v20;
        v22 = *(_QWORD *)&v20[*v19];
        if (v22)
          break;
        v25 = (double *)&v20[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
        if ((v20[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange + 16] & 1) == 0)
        {
          v27 = *v25;
          v26 = v25[1];
          v28 = objc_allocWithZone((Class)SVDCapabilityDescription);
          swift_bridgeObjectRetain();
          v29 = v17;
          v30 = a2;
          v31 = v19;
          v32 = v18;
          v33 = (void *)sub_1C2EF7410();
          swift_bridgeObjectRelease();
          v24 = objc_msgSend(v28, sel_initWithKey_valueRangeWithLowerBound_upperBound_, v33, v27, v26);

          v18 = v32;
          v19 = v31;
          a2 = v30;
          v17 = v29;
          v13 = (uint64_t)v65;
LABEL_14:

          if (v24)
          {
            MEMORY[0x1C3BCC104]();
            if (*(_QWORD *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((aBlock[0] & 0xFFFFFFFFFFFFFF8)
                                                                                    + 0x18) >> 1)
              sub_1C2EF74F4();
            sub_1C2EF7500();
            sub_1C2EF74E8();
          }
          goto LABEL_18;
        }

LABEL_18:
        if (v13 == ++v16)
        {
          swift_bridgeObjectRelease();
          v15 = v63;
          goto LABEL_21;
        }
      }
      swift_bridgeObjectRetain();
      sub_1C2EE36E4(v22);
      v23 = objc_allocWithZone((Class)SVDCapabilityDescription);
      v24 = sub_1C2EEA438();
      goto LABEL_14;
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_21:
    v34 = v58;
    if (qword_1EF7D29F0 != -1)
      swift_once();
    v35 = v68;
    v36 = __swift_project_value_buffer(v68, (uint64_t)qword_1EF7D6040);
    v37 = v67;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v34, v36, v35);
    swift_bridgeObjectRetain_n();
    v38 = sub_1C2EF7344();
    v39 = sub_1C2EF7590();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = swift_slowAlloc();
      aBlock[0] = v41;
      *(_DWORD *)v40 = 136315138;
      v65 = v40 + 4;
      v42 = sub_1C2ED4708(0, &qword_1EF7D3A60);
      v43 = swift_bridgeObjectRetain();
      v44 = MEMORY[0x1C3BCC128](v43, v42);
      v46 = v45;
      swift_bridgeObjectRelease();
      v69 = sub_1C2ED1D08(v44, v46, aBlock);
      sub_1C2EF7668();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2EC6000, v38, v39, "#hal Calling devicesMatching(:) with descriptions: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BCCB60](v41, -1, -1);
      MEMORY[0x1C3BCCB60](v40, -1, -1);

      (*(void (**)(char *, uint64_t))(v67 + 8))(v34, v68);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v37 + 8))(v34, v35);
    }
    v48 = v60;
    v47 = v61;
    v49 = MEMORY[0x1E0DEE9E0];
    v50 = swift_allocObject();
    *(_QWORD *)(v50 + 16) = v49;
    sub_1C2ED4708(0, &qword_1EF7D3A60);
    v51 = (void *)sub_1C2EF74C4();
    swift_bridgeObjectRelease();
    v52 = v47;
    v53 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v48, v15, v64);
    v54 = (*(unsigned __int8 *)(v47 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    v55 = (v59 + v54 + 7) & 0xFFFFFFFFFFFFFFF8;
    v56 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v52 + 32))(v56 + v54, v48, v53);
    *(_QWORD *)(v56 + v55) = v66;
    *(_QWORD *)(v56 + ((v55 + 15) & 0xFFFFFFFFFFFFFFF8)) = v50;
    aBlock[4] = (uint64_t)sub_1C2EED15C;
    aBlock[5] = v56;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1C2EE4478;
    aBlock[3] = (uint64_t)&block_descriptor_167;
    v57 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v62, sel_getDevicesMatchingCapabilityDescriptions_completion_, v51, v57);
    _Block_release(v57);

    swift_release();
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_1C2EE36E4(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  int64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;

  v1 = a1;
  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_1C2EF76E0())
      goto LABEL_3;
LABEL_6:
    v3 = MEMORY[0x1E0DEE9E8];
    if (v2)
      goto LABEL_4;
    goto LABEL_7;
  }
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_6;
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3A68);
  v3 = sub_1C2EF7740();
  if (v2)
  {
LABEL_4:
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1C2EF76D4();
    sub_1C2ED4708(0, (unint64_t *)&qword_1EF7D3200);
    sub_1C2EECE70((unint64_t *)&qword_1EF7D3600, (unint64_t *)&qword_1EF7D3200);
    result = sub_1C2EF7578();
    v1 = v35;
    v30 = v36;
    v5 = v37;
    v6 = v38;
    v7 = v39;
    goto LABEL_11;
  }
LABEL_7:
  v8 = -1 << *(_BYTE *)(v1 + 32);
  v30 = v1 + 56;
  v5 = ~v8;
  v9 = -v8;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v7 = v10 & *(_QWORD *)(v1 + 56);
  swift_bridgeObjectRetain();
  result = swift_retain();
  v6 = 0;
LABEL_11:
  v29 = (unint64_t)(v5 + 64) >> 6;
  v11 = v3 + 56;
  if (v1 < 0)
    goto LABEL_14;
LABEL_12:
  if (v7)
  {
    v12 = (v7 - 1) & v7;
    v13 = __clz(__rbit64(v7)) | (v6 << 6);
    v14 = v6;
    goto LABEL_31;
  }
  v16 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v16 >= v29)
      goto LABEL_44;
    v17 = *(_QWORD *)(v30 + 8 * v16);
    v14 = v6 + 1;
    if (!v17)
    {
      v14 = v6 + 2;
      if (v6 + 2 >= v29)
        goto LABEL_44;
      v17 = *(_QWORD *)(v30 + 8 * v14);
      if (!v17)
      {
        v14 = v6 + 3;
        if (v6 + 3 >= v29)
          goto LABEL_44;
        v17 = *(_QWORD *)(v30 + 8 * v14);
        if (!v17)
        {
          v14 = v6 + 4;
          if (v6 + 4 >= v29)
            goto LABEL_44;
          v17 = *(_QWORD *)(v30 + 8 * v14);
          if (!v17)
          {
            v18 = v6 + 5;
            while (v18 < v29)
            {
              v17 = *(_QWORD *)(v30 + 8 * v18++);
              if (v17)
              {
                v14 = v18 - 1;
                goto LABEL_30;
              }
            }
            goto LABEL_44;
          }
        }
      }
    }
LABEL_30:
    v12 = (v17 - 1) & v17;
    v13 = __clz(__rbit64(v17)) + (v14 << 6);
LABEL_31:
    v34 = *(void **)(*(_QWORD *)(v1 + 48) + 8 * v13);
    v19 = v34;
    if (v34)
    {
      v6 = v14;
      v7 = v12;
      while (1)
      {
        sub_1C2ED4708(0, (unint64_t *)&qword_1EF7D3200);
        swift_dynamicCast();
        result = sub_1C2EF7710();
        v20 = -1 << *(_BYTE *)(v3 + 32);
        v21 = result & ~v20;
        v22 = v21 >> 6;
        if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) == 0)
          break;
        v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_42:
        *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
        v28 = *(_QWORD *)(v3 + 48) + 40 * v23;
        *(_OWORD *)v28 = v31;
        *(_OWORD *)(v28 + 16) = v32;
        *(_QWORD *)(v28 + 32) = v33;
        ++*(_QWORD *)(v3 + 16);
        if ((v1 & 0x8000000000000000) == 0)
          goto LABEL_12;
LABEL_14:
        v15 = sub_1C2EF76F8();
        if (v15)
        {
          *(_QWORD *)&v31 = v15;
          sub_1C2ED4708(0, (unint64_t *)&qword_1EF7D3200);
          swift_dynamicCast();
          if (v34)
            continue;
        }
        goto LABEL_44;
      }
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_42;
        }
      }
      __break(1u);
      goto LABEL_46;
    }
LABEL_44:
    swift_release();
    sub_1C2ECAEE4();
    return v3;
  }
LABEL_46:
  __break(1u);
  return result;
}

id sub_1C2EE3B0C(double a1, double a2)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_1C2EF7410();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithKey_valueRangeWithLowerBound_upperBound_, v5, a1, a2);

  return v6;
}

uint64_t sub_1C2EE3B94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void (*v16)(unint64_t, uint64_t, unint64_t);
  NSObject *v17;
  uint64_t v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(unint64_t, unint64_t);
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  BOOL v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  char v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  id v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t result;
  uint64_t v70;
  void (*v71)(unint64_t, unint64_t);
  uint64_t v72;
  void (*v73)(unint64_t, uint64_t, unint64_t);
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint8_t *v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85[3];
  uint64_t v86[3];

  v74 = a2;
  v7 = sub_1C2EF7350();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (uint8_t *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (uint64_t)&v70 - v12;
  v14 = (id)(a4 + 16);
  swift_beginAccess();
  *(_QWORD *)(a4 + 16) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (qword_1EF7D29F0 == -1)
    goto LABEL_2;
LABEL_53:
  swift_once();
LABEL_2:
  v15 = __swift_project_value_buffer(v7, (uint64_t)qword_1EF7D6040);
  v16 = *(void (**)(unint64_t, uint64_t, unint64_t))(v8 + 16);
  v72 = v15;
  v73 = v16;
  ((void (*)(uint64_t))v16)(v13);
  swift_retain_n();
  v17 = sub_1C2EF7344();
  v18 = v8;
  v19 = sub_1C2EF7590();
  v20 = os_log_type_enabled(v17, v19);
  v78 = v7;
  v77 = v11;
  v75 = a3;
  if (v20)
  {
    v81 = v18;
    v11 = (uint8_t *)swift_slowAlloc();
    v80 = swift_slowAlloc();
    v86[0] = v80;
    v82 = v14;
    *(_DWORD *)v11 = 136315138;
    v79 = (uint64_t)(v11 + 4);
    swift_beginAccess();
    sub_1C2ED4708(0, &qword_1EF7D3140);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3A70);
    sub_1C2EECE70(&qword_1EF7D3A78, &qword_1EF7D3140);
    v21 = sub_1C2EF73D4();
    v23 = v22;
    swift_bridgeObjectRelease();
    v85[0] = sub_1C2ED1D08(v21, v23, v86);
    v14 = v82;
    sub_1C2EF7668();
    swift_release_n();
    a3 = v75;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2EC6000, v17, v19, "#hal Retrieved matching devices: %s", v11, 0xCu);
    v24 = v80;
    swift_arrayDestroy();
    MEMORY[0x1C3BCCB60](v24, -1, -1);
    MEMORY[0x1C3BCCB60](v11, -1, -1);

    v25 = *(void (**)(unint64_t, unint64_t))(v81 + 8);
    v26 = v13;
    v27 = v78;
  }
  else
  {

    swift_release_n();
    v25 = *(void (**)(unint64_t, unint64_t))(v18 + 8);
    v26 = v13;
    v27 = v7;
  }
  v71 = v25;
  v25(v26, v27);
  v7 = a3 + 16;
  swift_beginAccess();
  v8 = *(_QWORD *)v14;
  v28 = *(_QWORD *)(*(_QWORD *)v14 + 64);
  v79 = *(_QWORD *)v14 + 64;
  v29 = 1 << *(_BYTE *)(v8 + 32);
  v30 = -1;
  if (v29 < 64)
    v30 = ~(-1 << v29);
  a3 = v30 & v28;
  v80 = (unint64_t)(v29 + 63) >> 6;
  swift_bridgeObjectRetain();
  v31 = 0;
  v76 = v8;
  if (a3)
  {
LABEL_8:
    v32 = __clz(__rbit64(a3));
    a3 &= a3 - 1;
    v82 = v31;
    v33 = v32 | ((_QWORD)v31 << 6);
    goto LABEL_23;
  }
  while (1)
  {
    v34 = (uint64_t)v31 + 1;
    if (__OFADD__(v31, 1))
      goto LABEL_49;
    v35 = v78;
    a3 = (unint64_t)v77;
    if (v34 >= v80)
      break;
    v36 = *(_QWORD *)(v79 + 8 * v34);
    v37 = (uint64_t)v31 + 1;
    if (v36)
      goto LABEL_22;
    v37 = (uint64_t)v31 + 2;
    if ((uint64_t)v31 + 2 >= v80)
      break;
    v36 = *(_QWORD *)(v79 + 8 * v37);
    if (v36)
      goto LABEL_22;
    v37 = (uint64_t)v31 + 3;
    if ((uint64_t)v31 + 3 >= v80)
      break;
    v36 = *(_QWORD *)(v79 + 8 * v37);
    if (v36)
      goto LABEL_22;
    v38 = (uint64_t)v31 + 4;
    if ((uint64_t)v31 + 4 >= v80)
      break;
    v36 = *(_QWORD *)(v79 + 8 * v38);
    if (!v36)
    {
      while (1)
      {
        v37 = v38 + 1;
        if (__OFADD__(v38, 1))
          goto LABEL_52;
        if (v37 >= v80)
          goto LABEL_44;
        v36 = *(_QWORD *)(v79 + 8 * v37);
        ++v38;
        if (v36)
          goto LABEL_22;
      }
    }
    v37 = (uint64_t)v31 + 4;
LABEL_22:
    a3 = (v36 - 1) & v36;
    v82 = (id)v37;
    v33 = __clz(__rbit64(v36)) + (v37 << 6);
LABEL_23:
    v39 = *(void **)(*(_QWORD *)(v8 + 48) + 8 * v33);
    v40 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v33);
    v11 = (uint8_t *)type metadata accessor for DeviceUnit();
    v14 = v39;
    swift_bridgeObjectRetain();
    v13 = (uint64_t)v11;
    v41 = DeviceUnit.__allocating_init(deviceUnitObjC:)(v14);
    if (v41)
    {
      v42 = (void *)v41;
      v43 = static ObjCCompatibility.capabilities(from:)(v40);
      swift_bridgeObjectRelease();
      if (v43)
      {
        swift_beginAccess();
        v13 = *(_QWORD *)v7;
        v44 = (*(_QWORD *)v7 & 0xC000000000000001) == 0;
        v81 = v43;
        if (v44)
        {
          swift_retain();
          v47 = v42;
        }
        else
        {
          if (v13 >= 0)
            v13 &= 0xFFFFFFFFFFFFFF8uLL;
          swift_retain();
          v45 = v42;
          v46 = sub_1C2EF76E0();
          if (__OFADD__(v46, 1))
            goto LABEL_50;
          *(_QWORD *)v7 = sub_1C2EEB76C(v13, v46 + 1);
        }
        swift_isUniquelyReferenced_nonNull_native();
        v83 = *(uint8_t **)v7;
        v13 = (uint64_t)v83;
        v8 = v7;
        *(_QWORD *)v7 = 0x8000000000000000;
        v48 = sub_1C2ECC500();
        if (__OFADD__(*(_QWORD *)(v13 + 16), (v49 & 1) == 0))
        {
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_53;
        }
        v7 = v48;
        v50 = v49;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3A80);
        v13 = (uint64_t)&v83;
        v51 = sub_1C2EF77D0();
        v52 = v81;
        if ((v51 & 1) != 0)
        {
          v13 = (uint64_t)v83;
          v53 = sub_1C2ECC500();
          if ((v50 & 1) != (v54 & 1))
          {
            result = sub_1C2EF7968();
            __break(1u);
            return result;
          }
          v7 = v53;
        }
        v11 = v83;
        if ((v50 & 1) != 0)
        {
          v55 = *((_QWORD *)v83 + 7);
          swift_release();
          *(_QWORD *)(v55 + 8 * v7) = v52;
        }
        else
        {
          *(_QWORD *)&v83[8 * (v7 >> 6) + 64] |= 1 << v7;
          *(_QWORD *)(*((_QWORD *)v11 + 6) + 8 * v7) = v42;
          *(_QWORD *)(*((_QWORD *)v11 + 7) + 8 * v7) = v52;
          v56 = *((_QWORD *)v11 + 2);
          v57 = __OFADD__(v56, 1);
          v58 = v56 + 1;
          if (v57)
            goto LABEL_51;
          *((_QWORD *)v11 + 2) = v58;
          v59 = v42;
        }
        v7 = v8;
        v13 = *(_QWORD *)v8;
        *(_QWORD *)v8 = v11;

        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_release();

        v8 = v76;
      }
      else
      {

      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v31 = v82;

    if (a3)
      goto LABEL_8;
  }
LABEL_44:
  swift_release();
  v73(a3, v72, v35);
  swift_retain_n();
  v60 = sub_1C2EF7344();
  v61 = sub_1C2EF7590();
  if (os_log_type_enabled(v60, v61))
  {
    v62 = (uint8_t *)swift_slowAlloc();
    v81 = swift_slowAlloc();
    v85[0] = v81;
    v82 = (id)v7;
    *(_DWORD *)v62 = 136315138;
    swift_beginAccess();
    type metadata accessor for DeviceUnit();
    type metadata accessor for Capabilities();
    sub_1C2EECC90(&qword_1EF7D3A88, (void (*)(uint64_t))type metadata accessor for DeviceUnit);
    swift_bridgeObjectRetain();
    v63 = sub_1C2EF73D4();
    v65 = v64;
    swift_bridgeObjectRelease();
    v84 = sub_1C2ED1D08(v63, v65, v85);
    v7 = (unint64_t)v82;
    sub_1C2EF7668();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2EC6000, v60, v61, "#hal Returning transformed results: %s", v62, 0xCu);
    v66 = v81;
    swift_arrayDestroy();
    MEMORY[0x1C3BCCB60](v66, -1, -1);
    MEMORY[0x1C3BCCB60](v62, -1, -1);

    v67 = (unint64_t)v77;
    v68 = v78;
  }
  else
  {

    swift_release_n();
    v67 = a3;
    v68 = v35;
  }
  v71(v67, v68);
  swift_beginAccess();
  v84 = *(_QWORD *)v7;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3AC0);
  return sub_1C2EF7524();
}

uint64_t sub_1C2EE4478(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1C2ED4708(0, &qword_1EF7D3140);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3A70);
  sub_1C2EECE70(&qword_1EF7D3A78, &qword_1EF7D3140);
  v2 = sub_1C2EF73C8();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EE452C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return OUTLINED_FUNCTION_1_5();
}

uint64_t sub_1C2EE4540()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  v4 = (_QWORD *)OUTLINED_FUNCTION_109();
  v0[6] = v4;
  v4[2] = v1;
  v4[3] = v2;
  v4[4] = v3;
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3870);
  *v5 = v0;
  v5[1] = sub_1C2EE45E8;
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_44_1();
  return sub_1C2EF7944();
}

uint64_t sub_1C2EE45E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  OUTLINED_FUNCTION_11_5();
  return OUTLINED_FUNCTION_1_9();
}

uint64_t sub_1C2EE4648()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_4_6(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C2EE4674(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
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
  char *v16;
  unint64_t v17;
  char *v18;
  void *v19;
  char *v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v22[0] = a4;
  v7 = sub_1C2EF7374();
  v25 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1C2EF738C();
  v23 = *(_QWORD *)(v10 - 8);
  v24 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AB8);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[1] = *(_QWORD *)&a2[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  v17 = (*(unsigned __int8 *)(v14 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v18 = (char *)swift_allocObject();
  *((_QWORD *)v18 + 2) = a2;
  *((_QWORD *)v18 + 3) = a3;
  *((_QWORD *)v18 + 4) = v22[0];
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v18[v17], v16, v13);
  aBlock[4] = sub_1C2EECFDC;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C2ECEDA0;
  aBlock[3] = &block_descriptor_147;
  v19 = _Block_copy(aBlock);
  v20 = a2;
  sub_1C2EF7380();
  v26 = MEMORY[0x1E0DEE9D8];
  sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DE0);
  sub_1C2EED464(&qword_1EF7D2DE8, &qword_1EF7D2DE0);
  sub_1C2EF76B0();
  MEMORY[0x1C3BCC218](0, v12, v9, v19);
  _Block_release(v19);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v24);
  return swift_release();
}

uint64_t sub_1C2EE48F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[7];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AB8);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v10 = (void *)sub_1C2EE572C();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v7);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v12 + v11, (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  aBlock[4] = sub_1C2EED044;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C2EE12C0;
  aBlock[3] = &block_descriptor_153;
  v13 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v10, sel_getAllReachableDevicesWithCompletion_, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_1C2EE4A64(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t result;
  uint64_t i;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t j;
  char *v13;
  uint64_t v14;
  unint64_t v15;

  v15 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_1C2EF7884();
    if (v6)
      goto LABEL_3;
LABEL_15:
    result = swift_bridgeObjectRelease();
    v10 = MEMORY[0x1E0DEE9D8];
    goto LABEL_16;
  }
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_15;
LABEL_3:
  result = type metadata accessor for DeviceUnit();
  if (v6 < 1)
  {
    __break(1u);
    goto LABEL_32;
  }
  for (i = 0; i != v6; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0)
      v9 = (id)MEMORY[0x1C3BCC3B0](i, a1);
    else
      v9 = *(id *)(a1 + 8 * i + 32);
    if (DeviceUnit.__allocating_init(deviceUnitObjC:)(v9))
    {
      MEMORY[0x1C3BCC104]();
      if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1C2EF74F4();
      sub_1C2EF7500();
      sub_1C2EF74E8();
    }
  }
  result = swift_bridgeObjectRelease();
  v10 = v15;
LABEL_16:
  if (!(v10 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v11)
      goto LABEL_18;
LABEL_30:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AB8);
    return sub_1C2EF7524();
  }
  swift_bridgeObjectRetain();
  v11 = sub_1C2EF7884();
  result = swift_bridgeObjectRelease();
  if (!v11)
    goto LABEL_30;
LABEL_18:
  if (v11 >= 1)
  {
    for (j = 0; j != v11; ++j)
    {
      if ((v10 & 0xC000000000000001) != 0)
        v13 = (char *)MEMORY[0x1C3BCC3B0](j, v10);
      else
        v13 = (char *)*(id *)(v10 + 8 * j + 32);
      v14 = *(_QWORD *)&v13[OBJC_IVAR___SVDDeviceUnitSwift_proximity];
      if (v14 >= a2 && v14 <= a3)
      {
        sub_1C2EF7788();
        sub_1C2EF77AC();
        sub_1C2EF77B8();
        sub_1C2EF7794();
      }
      else
      {

      }
    }
    goto LABEL_30;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1C2EE4CFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return OUTLINED_FUNCTION_1_5();
}

uint64_t sub_1C2EE4D0C()
{
  uint64_t v0;
  int8x16_t *v1;
  _QWORD *v2;

  v1 = (int8x16_t *)OUTLINED_FUNCTION_91();
  *(_QWORD *)(v0 + 40) = v1;
  v1[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3880);
  *v2 = v0;
  v2[1] = sub_1C2EE4D98;
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_44_1();
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_1C2EE4D98()
{
  uint64_t v0;

  OUTLINED_FUNCTION_35_1();
  if (!v0)
    swift_task_dealloc();
  OUTLINED_FUNCTION_11_5();
  return OUTLINED_FUNCTION_1_9();
}

uint64_t sub_1C2EE4DDC()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_4_6(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C2EE4E08(uint64_t a1, char *a2, uint64_t a3)
{
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
  unint64_t v16;
  uint64_t v17;
  void *v18;
  char *v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v6 = sub_1C2EF7374();
  v24 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1C2EF738C();
  v22 = *(_QWORD *)(v9 - 8);
  v23 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AB0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[1] = *(_QWORD *)&a2[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue];
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  v16 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v17 + v16, v15, v12);
  aBlock[4] = sub_1C2EECF4C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C2ECEDA0;
  aBlock[3] = &block_descriptor_135;
  v18 = _Block_copy(aBlock);
  v19 = a2;
  swift_bridgeObjectRetain();
  sub_1C2EF7380();
  v25 = MEMORY[0x1E0DEE9D8];
  sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DE0);
  sub_1C2EED464(&qword_1EF7D2DE8, &qword_1EF7D2DE0);
  sub_1C2EF76B0();
  MEMORY[0x1C3BCC218](0, v11, v8, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v23);
  return swift_release();
}

uint64_t sub_1C2EE5080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[7];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AB0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v7 = (void *)sub_1C2EE572C();
  sub_1C2EF7338();
  sub_1C2EECC90(&qword_1EF7D3A98, (void (*)(uint64_t))MEMORY[0x1E0CB0998]);
  v8 = (void *)sub_1C2EF7548();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v4);
  v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_1C2EECF6C;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C2EE5680;
  aBlock[3] = &block_descriptor_141;
  v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v7, sel_getSourceDeviceForContextWithIdentifiers_completion_, v8, v11);
  _Block_release(v11);

  return swift_unknownObjectRelease();
}

uint64_t sub_1C2EE5230(uint64_t a1)
{
  sub_1C2EE5280(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AB0);
  return sub_1C2EF7524();
}

void sub_1C2EE5280(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  void (*v41)(unint64_t, uint64_t, uint64_t);
  _QWORD v42[2];
  uint64_t v43;
  int64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  uint64_t v49;
  int64_t v50;
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;

  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AA0);
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_108();
  v49 = v3;
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v42 - v6;
  MEMORY[0x1E0C80A78](v5);
  v45 = (char *)v42 - v8;
  v55 = MEMORY[0x1E0DEE9E0];
  sub_1C2EEC748(a1, v51);
  v47 = v51[0];
  v50 = v53;
  v9 = v54;
  v42[1] = v52;
  v43 = v51[1];
  v44 = (unint64_t)(v52 + 64) >> 6;
  swift_bridgeObjectRetain();
  while (1)
  {
    while (1)
    {
      if (v9)
      {
        v10 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v11 = v10 | (v50 << 6);
      }
      else
      {
        v12 = v50 + 1;
        if (__OFADD__(v50, 1))
          goto LABEL_36;
        if (v12 >= v44)
          goto LABEL_34;
        v13 = *(_QWORD *)(v43 + 8 * v12);
        v14 = v50 + 1;
        if (!v13)
        {
          v14 = v50 + 2;
          if (v50 + 2 >= v44)
            goto LABEL_34;
          v13 = *(_QWORD *)(v43 + 8 * v14);
          if (!v13)
          {
            v14 = v50 + 3;
            if (v50 + 3 >= v44)
              goto LABEL_34;
            v13 = *(_QWORD *)(v43 + 8 * v14);
            if (!v13)
            {
              v14 = v50 + 4;
              if (v50 + 4 >= v44)
                goto LABEL_34;
              v13 = *(_QWORD *)(v43 + 8 * v14);
              if (!v13)
              {
                v14 = v50 + 5;
                if (v50 + 5 >= v44)
                  goto LABEL_34;
                v13 = *(_QWORD *)(v43 + 8 * v14);
                if (!v13)
                {
                  v15 = v50 + 6;
                  while (v15 < v44)
                  {
                    v13 = *(_QWORD *)(v43 + 8 * v15++);
                    if (v13)
                    {
                      v14 = v15 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_34:
                  sub_1C2ECAEE4();
                  return;
                }
              }
            }
          }
        }
LABEL_19:
        v9 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v50 = v14;
      }
      v16 = v47;
      v17 = *(_QWORD *)(v47 + 48);
      v18 = sub_1C2EF7338();
      v19 = *(_QWORD *)(v18 - 8);
      v20 = *(_QWORD *)(v19 + 72);
      v21 = (uint64_t)v45;
      (*(void (**)(char *, unint64_t, uint64_t))(v19 + 16))(v45, v17 + v20 * v11, v18);
      v22 = *(void **)(*(_QWORD *)(v16 + 56) + 8 * v11);
      v23 = v46;
      *(_QWORD *)(v21 + *(int *)(v46 + 48)) = v22;
      sub_1C2EECECC(v21, (uint64_t)v7);
      v24 = *(void **)&v7[*(int *)(v23 + 48)];
      type metadata accessor for DeviceUnit();
      v25 = v22;
      v26 = v24;
      v27 = DeviceUnit.__allocating_init(deviceUnitObjC:)(v26);
      if (v27)
        break;
      sub_1C2EED7B8((uint64_t)v7, &qword_1EF7D3AA0);
    }
    v28 = v27;
    v48 = *(void (**)(uint64_t))(v19 + 32);
    v48(v49);
    v29 = v55;
    v30 = *(_QWORD *)(v55 + 16);
    if (*(_QWORD *)(v55 + 24) <= v30)
    {
      sub_1C2EEBEF4(v30 + 1, 1);
      v29 = v55;
    }
    sub_1C2EECC90(&qword_1EF7D3A98, (void (*)(uint64_t))MEMORY[0x1E0CB0998]);
    v31 = sub_1C2EF73F8();
    v32 = v29 + 64;
    v33 = v31 & ~(-1 << *(_BYTE *)(v29 + 32));
    if (((-1 << v33) & ~*(_QWORD *)(v29 + 64 + 8 * (v33 >> 6))) == 0)
      break;
    v34 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v29 + 64 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    v35 = v49;
LABEL_33:
    v41 = (void (*)(unint64_t, uint64_t, uint64_t))v48;
    *(_QWORD *)(v32 + ((v34 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v34;
    v41(*(_QWORD *)(v29 + 48) + v34 * v20, v35, v18);
    *(_QWORD *)(*(_QWORD *)(v29 + 56) + 8 * v34) = v28;
    ++*(_QWORD *)(v29 + 16);

  }
  OUTLINED_FUNCTION_95();
  while (++v37 != v38 || (v36 & 1) == 0)
  {
    v39 = v37 == v38;
    if (v37 == v38)
      v37 = 0;
    v36 |= v39;
    v40 = *(_QWORD *)(v32 + 8 * v37);
    if (v40 != -1)
    {
      v34 = __clz(__rbit64(~v40)) + (v37 << 6);
      v35 = v49;
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_1C2EE5680(uint64_t a1)
{
  void (*v1)(uint64_t);
  void (*v2)(uint64_t);
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_1C2EF7338();
  v2 = (void (*)(uint64_t))MEMORY[0x1E0CB0998];
  sub_1C2ED4708(0, &qword_1EF7D3140);
  sub_1C2EECC90(&qword_1EF7D3A98, v2);
  v3 = sub_1C2EF73C8();
  swift_retain();
  v1(v3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EE572C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD aBlock[6];

  v0 = sub_1C2EF7350();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1C2EDE284();
  if (v4)
  {
    v5 = v4;
    aBlock[4] = sub_1C2EE5960;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C2EDDEF0;
    aBlock[3] = &block_descriptor_55;
    v6 = _Block_copy(aBlock);
    v7 = objc_msgSend(v5, sel_remoteObjectProxyWithErrorHandler_, v6);
    _Block_release(v6);

    sub_1C2EF7698();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3190);
    if ((swift_dynamicCast() & 1) != 0)
      return aBlock[0];
  }
  if (qword_1EF7D29F0 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v0, (uint64_t)qword_1EF7D6040);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v9, v0);
  v10 = sub_1C2EF7344();
  v11 = sub_1C2EF759C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1C2EC6000, v10, v11, "Failed to get remote object", v12, 2u);
    MEMORY[0x1C3BCCB60](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1C2EECD38();
  swift_allocError();
  return swift_willThrow();
}

void sub_1C2EE5964()
{
  void *v0;
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
  _QWORD *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_8_1();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = OUTLINED_FUNCTION_22();
  v12 = OUTLINED_FUNCTION_6_2(v11);
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_10_1();
  v14 = (_QWORD *)OUTLINED_FUNCTION_11();
  v14[2] = v0;
  v14[3] = v6;
  v14[4] = v4;
  v14[5] = v8;
  v14[6] = v10;
  v15 = OUTLINED_FUNCTION_60_0();
  v16 = v0;
  swift_retain();
  OUTLINED_FUNCTION_30();
  sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_51_1(&qword_1EF7D2DE8);
  OUTLINED_FUNCTION_7_2();
  v17 = OUTLINED_FUNCTION_44();
  MEMORY[0x1C3BCC218](v17);
  _Block_release(v15);
  OUTLINED_FUNCTION_14_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8));
  OUTLINED_FUNCTION_46(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_0_1();
}

void sub_1C2EE5AC8(uint64_t a1, void (*a2)(_QWORD), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  void *aBlock;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;

  v9 = sub_1C2EF7350();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1C2EDE284();
  if (!v13)
    goto LABEL_4;
  v14 = v13;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a2;
  *(_QWORD *)(v15 + 24) = a3;
  v29 = sub_1C2EECF14;
  v30 = (_QWORD *)v15;
  aBlock = (void *)MEMORY[0x1E0C809B0];
  v26 = 1107296256;
  v27 = sub_1C2EDDEF0;
  v28 = &block_descriptor_123;
  v16 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v17 = objc_msgSend(v14, sel_remoteObjectProxyWithErrorHandler_, v16);
  _Block_release(v16);

  sub_1C2EF7698();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3190);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v18 = aBlock;
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = a2;
    v19[3] = a3;
    v19[4] = a4;
    v19[5] = a5;
    v29 = sub_1C2EECF34;
    v30 = v19;
    aBlock = (void *)MEMORY[0x1E0C809B0];
    v26 = 1107296256;
    v27 = sub_1C2EE12C0;
    v28 = &block_descriptor_129;
    v20 = _Block_copy(&aBlock);
    swift_retain();
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v18, sel_getAllReachableDevicesWithCompletion_, v20);
    swift_unknownObjectRelease_n();
    _Block_release(v20);
  }
  else
  {
LABEL_4:
    if (qword_1EF7D29F0 != -1)
      swift_once();
    v21 = __swift_project_value_buffer(v9, (uint64_t)qword_1EF7D6040);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v21, v9);
    v22 = sub_1C2EF7344();
    v23 = sub_1C2EF759C();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1C2EC6000, v22, v23, "Failed to get remote object", v24, 2u);
      MEMORY[0x1C3BCCB60](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    a2(MEMORY[0x1E0DEE9D8]);
  }
}

uint64_t sub_1C2EE5DC8(void *a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint8_t *v20;
  _QWORD v22[3];
  uint64_t (*v23)(_QWORD);
  uint64_t v24;
  uint64_t v25;

  v6 = sub_1C2EF7350();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EF7D29F0 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_1EF7D6040);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = a1;
  v12 = a1;
  v13 = sub_1C2EF7344();
  v14 = sub_1C2EF759C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v23 = a2;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v25 = v17;
    v22[2] = a3;
    *(_DWORD *)v16 = 136315138;
    v22[1] = v16 + 4;
    swift_getErrorValue();
    v18 = sub_1C2EF7974();
    v24 = sub_1C2ED1D08(v18, v19, &v25);
    sub_1C2EF7668();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C2EC6000, v13, v14, "Error reaching remote: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BCCB60](v17, -1, -1);
    v20 = v16;
    a2 = v23;
    MEMORY[0x1C3BCCB60](v20, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return a2(MEMORY[0x1E0DEE9D8]);
}

uint64_t sub_1C2EE6008(unint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t i;
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t j;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v20;

  v8 = MEMORY[0x1E0DEE9D8];
  v20 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = sub_1C2EF7884();
    if (v9)
      goto LABEL_3;
LABEL_15:
    result = swift_bridgeObjectRelease();
    v13 = MEMORY[0x1E0DEE9D8];
    goto LABEL_16;
  }
  v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9)
    goto LABEL_15;
LABEL_3:
  result = type metadata accessor for DeviceUnit();
  if (v9 < 1)
  {
    __break(1u);
    goto LABEL_33;
  }
  for (i = 0; i != v9; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0)
      v12 = (id)MEMORY[0x1C3BCC3B0](i, a1);
    else
      v12 = *(id *)(a1 + 8 * i + 32);
    if (DeviceUnit.__allocating_init(deviceUnitObjC:)(v12))
    {
      MEMORY[0x1C3BCC104]();
      if (*(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1C2EF74F4();
      sub_1C2EF7500();
      sub_1C2EF74E8();
    }
  }
  result = swift_bridgeObjectRelease();
  v13 = v20;
  v8 = MEMORY[0x1E0DEE9D8];
LABEL_16:
  if (!(v13 >> 62))
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v14)
      goto LABEL_18;
LABEL_30:
    swift_bridgeObjectRelease();
    v18 = MEMORY[0x1E0DEE9D8];
LABEL_31:
    a2(v18);
    return swift_release();
  }
  swift_bridgeObjectRetain();
  v14 = sub_1C2EF7884();
  result = swift_bridgeObjectRelease();
  if (!v14)
    goto LABEL_30;
LABEL_18:
  if (v14 >= 1)
  {
    for (j = 0; j != v14; ++j)
    {
      if ((v13 & 0xC000000000000001) != 0)
        v16 = (char *)MEMORY[0x1C3BCC3B0](j, v13);
      else
        v16 = (char *)*(id *)(v13 + 8 * j + 32);
      v17 = *(_QWORD *)&v16[OBJC_IVAR___SVDDeviceUnitSwift_proximity];
      if (v17 >= a4 && v17 <= a5)
      {
        sub_1C2EF7788();
        sub_1C2EF77AC();
        sub_1C2EF77B8();
        sub_1C2EF7794();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
    v18 = v8;
    goto LABEL_31;
  }
LABEL_33:
  __break(1u);
  return result;
}

void sub_1C2EE6290()
{
  sub_1C2EE666C();
}

uint64_t sub_1C2EE62AC(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  void (*v23)(uint64_t);
  void *aBlock;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v5 = sub_1C2EF7350();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1C2EDE284();
  if (!v9)
    goto LABEL_4;
  v10 = v9;
  v28 = sub_1C2EE5960;
  v29 = 0;
  v11 = (void *)MEMORY[0x1E0C809B0];
  aBlock = (void *)MEMORY[0x1E0C809B0];
  v25 = 1107296256;
  v26 = sub_1C2EDDEF0;
  v27 = &block_descriptor_111;
  v12 = _Block_copy(&aBlock);
  v13 = objc_msgSend(v10, sel_remoteObjectProxyWithErrorHandler_, v12);
  _Block_release(v12);

  sub_1C2EF7698();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3190);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v14 = aBlock;
    sub_1C2EF7338();
    sub_1C2EECC90(&qword_1EF7D3A98, (void (*)(uint64_t))MEMORY[0x1E0CB0998]);
    swift_unknownObjectRetain();
    v15 = (void *)sub_1C2EF7548();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a2;
    *(_QWORD *)(v16 + 24) = a3;
    v28 = sub_1C2EECEC4;
    v29 = v16;
    aBlock = v11;
    v25 = 1107296256;
    v26 = sub_1C2EE5680;
    v27 = &block_descriptor_117;
    v17 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_getSourceDeviceForContextWithIdentifiers_completion_, v15, v17);
    _Block_release(v17);

    return swift_unknownObjectRelease_n();
  }
  else
  {
LABEL_4:
    if (qword_1EF7D29F0 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v5, (uint64_t)qword_1EF7D6040);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v19, v5);
    v20 = sub_1C2EF7344();
    v21 = sub_1C2EF759C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1C2EC6000, v20, v21, "Failed to get remote object", v22, 2u);
      MEMORY[0x1C3BCCB60](v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1C2EF7338();
    v23 = (void (*)(uint64_t))MEMORY[0x1E0CB0998];
    type metadata accessor for DeviceUnit();
    sub_1C2EECC90(&qword_1EF7D3A98, v23);
    sub_1C2EF73E0();
    a2();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1C2EE660C(uint64_t a1, void (*a2)(void))
{
  sub_1C2EE5280(a1);
  a2();
  return swift_bridgeObjectRelease();
}

void sub_1C2EE6650()
{
  sub_1C2EE666C();
}

void sub_1C2EE666C()
{
  void *v0;
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
  _QWORD *v12;
  void *v13;
  id v14;
  uint64_t v15;

  OUTLINED_FUNCTION_8_1();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = OUTLINED_FUNCTION_22();
  v10 = OUTLINED_FUNCTION_6_2(v9);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_10_1();
  v12 = (_QWORD *)OUTLINED_FUNCTION_11();
  v12[2] = v0;
  v12[3] = v6;
  v12[4] = v4;
  v12[5] = v8;
  v13 = OUTLINED_FUNCTION_60_0();
  v14 = v0;
  swift_retain();
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_30();
  sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_51_1(&qword_1EF7D2DE8);
  sub_1C2EF76B0();
  MEMORY[0x1C3BCC218](0, v2, v1, v13);
  _Block_release(v13);
  OUTLINED_FUNCTION_14_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_0_1();
}

uint64_t sub_1C2EE67EC(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  double *v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  unint64_t aBlock;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD *v47;

  v7 = sub_1C2EF7350();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = MEMORY[0x1E0DEE9E0];
  v12 = sub_1C2EDE284();
  if (!v12)
    goto LABEL_21;
  v13 = v12;
  v46 = sub_1C2EE5960;
  v47 = 0;
  aBlock = MEMORY[0x1E0C809B0];
  v43 = 1107296256;
  v44 = sub_1C2EDDEF0;
  v45 = &block_descriptor_99;
  v14 = _Block_copy(&aBlock);
  v15 = objc_msgSend(v13, sel_remoteObjectProxyWithErrorHandler_, v14);
  _Block_release(v14);

  sub_1C2EF7698();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3190);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:
    if (qword_1EF7D29F0 != -1)
      swift_once();
    v29 = __swift_project_value_buffer(v7, (uint64_t)qword_1EF7D6040);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v29, v7);
    v30 = sub_1C2EF7344();
    v31 = sub_1C2EF759C();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1C2EC6000, v30, v31, "Failed to get remote object", v32, 2u);
      MEMORY[0x1C3BCCB60](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v33 = swift_bridgeObjectRetain();
    a2(v33);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  v16 = (void *)aBlock;
  aBlock = MEMORY[0x1E0DEE9D8];
  if (a4 >> 62)
  {
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1C2EF7884();
    v17 = result;
    if (result)
      goto LABEL_5;
    goto LABEL_27;
  }
  v17 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_unknownObjectRetain();
  result = swift_bridgeObjectRetain();
  if (!v17)
  {
LABEL_27:
    swift_bridgeObjectRelease();
LABEL_28:
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = MEMORY[0x1E0DEE9E0];
    sub_1C2ED4708(0, &qword_1EF7D3A60);
    v35 = (void *)sub_1C2EF74C4();
    swift_bridgeObjectRelease();
    v36 = (_QWORD *)swift_allocObject();
    v36[2] = a2;
    v36[3] = a3;
    v36[4] = v11;
    v36[5] = v34;
    v46 = sub_1C2EECE64;
    v47 = v36;
    aBlock = MEMORY[0x1E0C809B0];
    v43 = 1107296256;
    v44 = sub_1C2EE4478;
    v45 = &block_descriptor_108;
    v37 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v16, sel_getDevicesMatchingCapabilityDescriptions_completion_, v35, v37);
    _Block_release(v37);

    swift_release();
    swift_unknownObjectRelease_n();
    return swift_release();
  }
LABEL_5:
  v38 = v16;
  v39 = a2;
  v40 = a3;
  v41 = v11;
  if (v17 >= 1)
  {
    v19 = 0;
    while (1)
    {
      v20 = (a4 & 0xC000000000000001) != 0
          ? (char *)MEMORY[0x1C3BCC3B0](v19, a4)
          : (char *)*(id *)(a4 + 8 * v19 + 32);
      v21 = v20;
      v22 = *(_QWORD *)&v20[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueSet];
      if (v22)
        break;
      v25 = (double *)&v20[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange];
      if ((v20[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_valueRange + 16] & 1) == 0)
      {
        v27 = *v25;
        v26 = v25[1];
        sub_1C2ED4708(0, &qword_1EF7D3A60);
        swift_bridgeObjectRetain();
        v24 = sub_1C2EE3B0C(v27, v26);
LABEL_15:
        v28 = v24;

        if (v28)
        {
          MEMORY[0x1C3BCC104]();
          if (*(_QWORD *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((aBlock & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1C2EF74F4();
          sub_1C2EF7500();
          sub_1C2EF74E8();
        }
        goto LABEL_19;
      }

LABEL_19:
      if (v17 == ++v19)
      {
        swift_bridgeObjectRelease();
        v11 = v41;
        a2 = v39;
        a3 = v40;
        v16 = v38;
        goto LABEL_28;
      }
    }
    swift_bridgeObjectRetain();
    sub_1C2EE36E4(v22);
    v23 = objc_allocWithZone((Class)SVDCapabilityDescription);
    v24 = sub_1C2EEA438();
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void sub_1C2EE6D50()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v15[8];

  OUTLINED_FUNCTION_8_1();
  v1 = v0;
  v2 = OUTLINED_FUNCTION_31();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EF7D29F0 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF7D6040);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = v1;
  v8 = v1;
  v9 = sub_1C2EF7344();
  v10 = sub_1C2EF759C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_24();
    v15[7] = OUTLINED_FUNCTION_24();
    *(_DWORD *)v11 = 136315138;
    v15[1] = v11 + 4;
    swift_getErrorValue();
    v12 = OUTLINED_FUNCTION_94();
    v14 = OUTLINED_FUNCTION_92(v12, v13);
    OUTLINED_FUNCTION_90_0(v14);
    sub_1C2EF7668();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_85();
    OUTLINED_FUNCTION_85();
    OUTLINED_FUNCTION_89(&dword_1C2EC6000, v9, v10, "Error reaching remote: %s", v11);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3_3();
  }
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_85();

  OUTLINED_FUNCTION_14_0((uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_0_1();
}

uint64_t sub_1C2EE6EFC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint8_t *a5)
{
  uint64_t v8;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  BOOL v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  _BOOL8 v47;
  unint64_t v48;
  char v49;
  char v50;
  uint64_t v51;
  char v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  void (*v69)(uint64_t);
  uint64_t v70;
  uint64_t result;
  uint64_t v72;
  void (*v73)(char *, uint64_t);
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  void (*v77)(uint64_t);
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint8_t *v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88[3];
  uint64_t v89[4];

  v76 = a3;
  v8 = sub_1C2EF7350();
  isUniquelyReferenced_nonNull_native = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v80 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v13 = (uint64_t)&v72 - v12;
  if (qword_1EF7D29F0 == -1)
    goto LABEL_2;
LABEL_53:
  swift_once();
LABEL_2:
  v85 = a5 + 16;
  v14 = __swift_project_value_buffer(v8, (uint64_t)qword_1EF7D6040);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(isUniquelyReferenced_nonNull_native + 16);
  v74 = v14;
  v75 = v15;
  ((void (*)(uint64_t))v15)(v13);
  swift_retain_n();
  v16 = sub_1C2EF7344();
  v17 = sub_1C2EF7590();
  v18 = os_log_type_enabled(v16, v17);
  v81 = a4;
  v77 = (void (*)(uint64_t))a2;
  v78 = v8;
  if (v18)
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v83 = swift_slowAlloc();
    v89[0] = v83;
    v84 = isUniquelyReferenced_nonNull_native;
    *(_DWORD *)v19 = 136315138;
    v82 = (uint64_t)(v19 + 4);
    swift_beginAccess();
    a2 = *((_QWORD *)a5 + 2);
    sub_1C2ED4708(0, &qword_1EF7D3140);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3A70);
    sub_1C2EECE70(&qword_1EF7D3A78, &qword_1EF7D3140);
    v20 = sub_1C2EF73D4();
    v22 = v21;
    swift_bridgeObjectRelease();
    v88[0] = sub_1C2ED1D08(v20, v22, v89);
    sub_1C2EF7668();
    swift_release_n();
    a4 = v81;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2EC6000, v16, v17, "#hal Retrieved matching devices: %s", v19, 0xCu);
    v23 = v83;
    swift_arrayDestroy();
    MEMORY[0x1C3BCCB60](v23, -1, -1);
    MEMORY[0x1C3BCCB60](v19, -1, -1);

    v24 = *(void (**)(char *, uint64_t))(v84 + 8);
  }
  else
  {

    swift_release_n();
    v24 = *(void (**)(char *, uint64_t))(isUniquelyReferenced_nonNull_native + 8);
  }
  v73 = v24;
  v24((char *)v13, v8);
  v25 = (uint64_t *)(a4 + 16);
  a5 = v85;
  swift_beginAccess();
  v26 = *(_QWORD *)a5;
  v27 = *(_QWORD *)(*(_QWORD *)a5 + 64);
  v82 = *(_QWORD *)a5 + 64;
  v28 = 1 << *(_BYTE *)(v26 + 32);
  v29 = -1;
  if (v28 < 64)
    v29 = ~(-1 << v28);
  v8 = v29 & v27;
  v83 = (unint64_t)(v28 + 63) >> 6;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = 0;
  v79 = v26;
  if (v8)
  {
LABEL_8:
    v30 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v31 = v30 | (isUniquelyReferenced_nonNull_native << 6);
    goto LABEL_23;
  }
  while (1)
  {
    v32 = isUniquelyReferenced_nonNull_native + 1;
    if (__OFADD__(isUniquelyReferenced_nonNull_native, 1))
      goto LABEL_49;
    v8 = (uint64_t)v80;
    if (v32 >= v83)
      break;
    v33 = *(_QWORD *)(v82 + 8 * v32);
    ++isUniquelyReferenced_nonNull_native;
    if (v33)
      goto LABEL_22;
    isUniquelyReferenced_nonNull_native = v32 + 1;
    if (v32 + 1 >= v83)
      break;
    v33 = *(_QWORD *)(v82 + 8 * isUniquelyReferenced_nonNull_native);
    if (v33)
      goto LABEL_22;
    isUniquelyReferenced_nonNull_native = v32 + 2;
    if (v32 + 2 >= v83)
      break;
    v33 = *(_QWORD *)(v82 + 8 * isUniquelyReferenced_nonNull_native);
    if (v33)
      goto LABEL_22;
    v34 = v32 + 3;
    if (v34 >= v83)
      break;
    v33 = *(_QWORD *)(v82 + 8 * v34);
    if (!v33)
    {
      while (1)
      {
        isUniquelyReferenced_nonNull_native = v34 + 1;
        if (__OFADD__(v34, 1))
          goto LABEL_52;
        if (isUniquelyReferenced_nonNull_native >= v83)
          goto LABEL_44;
        v33 = *(_QWORD *)(v82 + 8 * isUniquelyReferenced_nonNull_native);
        ++v34;
        if (v33)
          goto LABEL_22;
      }
    }
    isUniquelyReferenced_nonNull_native = v34;
LABEL_22:
    v8 = (v33 - 1) & v33;
    v31 = __clz(__rbit64(v33)) + (isUniquelyReferenced_nonNull_native << 6);
LABEL_23:
    v35 = *(void **)(*(_QWORD *)(v26 + 48) + 8 * v31);
    a2 = *(_QWORD *)(*(_QWORD *)(v26 + 56) + 8 * v31);
    v36 = type metadata accessor for DeviceUnit();
    a5 = v35;
    swift_bridgeObjectRetain();
    v13 = v36;
    v37 = DeviceUnit.__allocating_init(deviceUnitObjC:)(a5);
    if (v37)
    {
      v38 = (void *)v37;
      a2 = static ObjCCompatibility.capabilities(from:)(a2);
      swift_bridgeObjectRelease();
      if (a2)
      {
        swift_beginAccess();
        v13 = *v25;
        v39 = (*v25 & 0xC000000000000001) == 0;
        v84 = a2;
        v85 = (uint8_t *)isUniquelyReferenced_nonNull_native;
        if (v39)
        {
          swift_retain();
          v42 = v38;
        }
        else
        {
          if (v13 >= 0)
            v13 &= 0xFFFFFFFFFFFFFF8uLL;
          swift_retain();
          v40 = v38;
          v41 = sub_1C2EF76E0();
          if (__OFADD__(v41, 1))
            goto LABEL_50;
          *v25 = sub_1C2EEB76C(v13, v41 + 1);
        }
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v87 = (_QWORD *)*v25;
        v13 = (uint64_t)v87;
        v43 = v25;
        *v25 = 0x8000000000000000;
        v44 = sub_1C2ECC500();
        v46 = *(_QWORD *)(v13 + 16);
        v47 = (v45 & 1) == 0;
        a4 = v46 + v47;
        if (__OFADD__(v46, v47))
        {
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_53;
        }
        v48 = v44;
        v49 = v45;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3A80);
        v13 = (uint64_t)&v87;
        v50 = sub_1C2EF77D0();
        a4 = v81;
        isUniquelyReferenced_nonNull_native = (uint64_t)v85;
        if ((v50 & 1) != 0)
        {
          v13 = (uint64_t)v87;
          v51 = sub_1C2ECC500();
          if ((v49 & 1) != (v52 & 1))
          {
            result = sub_1C2EF7968();
            __break(1u);
            return result;
          }
          v48 = v51;
        }
        v53 = v87;
        if ((v49 & 1) != 0)
        {
          v54 = v87[7];
          swift_release();
          a2 = v84;
          *(_QWORD *)(v54 + 8 * v48) = v84;
        }
        else
        {
          v87[(v48 >> 6) + 8] |= 1 << v48;
          *(_QWORD *)(v53[6] + 8 * v48) = v38;
          a2 = v84;
          *(_QWORD *)(v53[7] + 8 * v48) = v84;
          v55 = v53[2];
          v56 = __OFADD__(v55, 1);
          v57 = v55 + 1;
          if (v56)
            goto LABEL_51;
          v53[2] = v57;
          v58 = v38;
        }
        v25 = v43;
        v13 = *v43;
        *v43 = (uint64_t)v53;

        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_release();

        v26 = v79;
      }
      else
      {

      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    if (v8)
      goto LABEL_8;
  }
LABEL_44:
  swift_release();
  v59 = v78;
  v75(v8, v74, v78);
  swift_retain_n();
  v60 = sub_1C2EF7344();
  v61 = sub_1C2EF7590();
  if (os_log_type_enabled(v60, v61))
  {
    v62 = (uint8_t *)swift_slowAlloc();
    v63 = swift_slowAlloc();
    v88[0] = v63;
    *(_DWORD *)v62 = 136315138;
    v85 = v62 + 4;
    swift_beginAccess();
    type metadata accessor for DeviceUnit();
    type metadata accessor for Capabilities();
    sub_1C2EECC90(&qword_1EF7D3A88, (void (*)(uint64_t))type metadata accessor for DeviceUnit);
    swift_bridgeObjectRetain();
    v64 = sub_1C2EF73D4();
    v66 = v65;
    swift_bridgeObjectRelease();
    v86 = sub_1C2ED1D08(v64, v66, v88);
    sub_1C2EF7668();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2EC6000, v60, v61, "#hal Returning transformed results: %s", v62, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BCCB60](v63, -1, -1);
    MEMORY[0x1C3BCCB60](v62, -1, -1);

    v67 = v80;
    v68 = v78;
  }
  else
  {

    swift_release_n();
    v67 = (char *)v8;
    v68 = v59;
  }
  v73(v67, v68);
  v69 = v77;
  swift_beginAccess();
  v70 = swift_bridgeObjectRetain();
  v69(v70);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EE778C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return OUTLINED_FUNCTION_1_5();
}

uint64_t sub_1C2EE779C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_76_0(v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  OUTLINED_FUNCTION_43((uint64_t)v2, &qword_1EF7D3B00);
  *v2 = v0;
  v2[1] = sub_1C2EDF978;
  OUTLINED_FUNCTION_45_1();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_44_1();
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_1C2EE7820(uint64_t a1)
{
  uint64_t v1;

  return sub_1C2EE0170(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_1C2EE782C(uint64_t a1)
{
  uint64_t v1;

  return sub_1C2EE1444(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(unsigned __int8 *)(v1 + 40));
}

uint64_t sub_1C2EE783C(uint64_t a1)
{
  uint64_t v1;

  return sub_1C2EE2AB8(a1, *(_QWORD *)(v1 + 16), *(char **)(v1 + 24));
}

uint64_t sub_1C2EE7844(uint64_t a1)
{
  uint64_t v1;

  return sub_1C2EE4674(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1C2EE7850(uint64_t a1)
{
  uint64_t v1;

  return sub_1C2EE4E08(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1C2EE7858()
{
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_93();
  return swift_deallocObject();
}

void sub_1C2EE787C()
{
  uint64_t v0;

  sub_1C2EE5AC8(*(_QWORD *)(v0 + 16), *(void (**)(_QWORD))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_1C2EE7890()
{
  uint64_t v0;

  return sub_1C2EE62AC(*(_QWORD *)(v0 + 16), *(void (**)(void))(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t objectdestroy_34Tm()
{
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_93();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_84_0();
  return swift_deallocObject();
}

uint64_t sub_1C2EE78C4()
{
  uint64_t v0;

  return sub_1C2EE67EC(*(_QWORD *)(v0 + 16), *(void (**)(uint64_t))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

void *sub_1C2EE78D0(_BYTE *a1, uint64_t a2)
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
  char *v13;
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
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint8_t *v31;
  id v32;
  void *result;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  void (**v37)(char *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void (**v56)(char *, uint64_t, uint64_t);
  uint64_t v57;
  void *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t ObjectType;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  void (*v68)(uint64_t, uint64_t);
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  void (**v73)(char *, uint64_t, uint64_t);
  uint64_t v74;
  void *v75;
  void (**v76)(char *, uint64_t, uint64_t);
  char *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  _QWORD *v93;
  _QWORD *v94;
  uint64_t v95;
  void (**v96)(char *, uint64_t, uint64_t);
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t aBlock;
  uint64_t v103;
  uint64_t (*v104)(uint64_t);
  void *v105;
  void *v106;
  uint64_t v107;

  v85 = a2;
  v95 = sub_1C2EF7368();
  v90 = *(_QWORD *)(v95 - 8);
  v3 = MEMORY[0x1E0C80A78](v95);
  v94 = (char **)((char *)&v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v3);
  v93 = (char **)((char *)&v79 - v5);
  v92 = sub_1C2EF73A4();
  v89 = *(_QWORD *)(v92 - 8);
  v6 = MEMORY[0x1E0C80A78](v92);
  v88 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v91 = (char *)&v79 - v8;
  v100 = sub_1C2EF7374();
  v87 = *(_QWORD *)(v100 - 8);
  MEMORY[0x1E0C80A78](v100);
  v98 = (char *)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = sub_1C2EF738C();
  v86 = *(_QWORD *)(v99 - 8);
  MEMORY[0x1E0C80A78](v99);
  v97 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B08);
  v96 = *(void (***)(char *, uint64_t, uint64_t))(v80 - 8);
  MEMORY[0x1E0C80A78](v80);
  v83 = v11;
  v84 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_1C2EF75E4();
  v81 = *(_QWORD *)(v82 - 8);
  MEMORY[0x1E0C80A78](v82);
  v13 = (char *)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1C2EF7350();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v16);
  v79 = (char *)&v79 - v20;
  MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v79 - v21;
  v23 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager;
  v24 = *(void **)&a1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager];
  v25 = (_QWORD *)&unk_1EF7D3000;
  if (v24)
    goto LABEL_8;
  if (qword_1EF7D29F0 != -1)
    swift_once();
  v26 = __swift_project_value_buffer(v14, (uint64_t)qword_1EF7D6040);
  v27 = v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v22, v26, v14);
  v28 = sub_1C2EF7344();
  v29 = sub_1C2EF7590();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_1C2EC6000, v28, v29, "Initializing home manager", v30, 2u);
    v31 = v30;
    v25 = &unk_1EF7D3000;
    MEMORY[0x1C3BCCB60](v31, -1, -1);
  }

  v15 = v27;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v14);
  dispatch_group_enter(*(dispatch_group_t *)&a1[v25[274]]);
  v32 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CBA558]), sel_initWithOptions_cachePolicy_, 1348, 2);
  sub_1C2EDE26C((uint64_t)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CBA550]), sel_initWithHomeMangerConfiguration_, v32));
  result = *(void **)&a1[v23];
  if (result)
  {
    objc_msgSend(result, sel_setDelegate_, a1);

    v24 = *(void **)&a1[v23];
    if (!v24)
    {
      v35 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_waitingOnHomeManagerDataSync;
      goto LABEL_16;
    }
LABEL_8:
    v34 = objc_msgSend(v24, sel_isDataSyncInProgress);
    v35 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_waitingOnHomeManagerDataSync;
    if (v34)
    {
      v36 = v80;
      if ((a1[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_waitingOnHomeManagerDataSync] & 1) == 0)
      {
        v37 = v96;
        if (qword_1EF7D29F0 != -1)
          swift_once();
        v38 = __swift_project_value_buffer(v14, (uint64_t)qword_1EF7D6040);
        v39 = v15;
        (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v79, v38, v14);
        v40 = sub_1C2EF7344();
        v41 = sub_1C2EF7590();
        if (os_log_type_enabled(v40, v41))
        {
          v42 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_1C2EC6000, v40, v41, "Waiting on home manager to finish data sync", v42, 2u);
          v43 = v42;
          v25 = &unk_1EF7D3000;
          MEMORY[0x1C3BCCB60](v43, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v39 + 8))(v79, v14);
        dispatch_group_enter(*(dispatch_group_t *)&a1[v25[274]]);
        a1[v35] = 1;
LABEL_23:
        sub_1C2ED4708(0, &qword_1EF7D3B10);
        v49 = MEMORY[0x1E0DEE9D8];
        aBlock = MEMORY[0x1E0DEE9D8];
        sub_1C2EECC90(&qword_1EF7D3B18, (void (*)(uint64_t))MEMORY[0x1E0DEF938]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B20);
        sub_1C2EED464(&qword_1EF7D3B28, &qword_1EF7D3B20);
        v50 = v82;
        sub_1C2EF76B0();
        v51 = sub_1C2EF75F0();
        (*(void (**)(char *, uint64_t))(v81 + 8))(v13, v50);
        v52 = v84;
        v37[2](v84, v85, v36);
        v53 = (*((unsigned __int8 *)v37 + 80) + 24) & ~(unint64_t)*((unsigned __int8 *)v37 + 80);
        v54 = (v83 + v53 + 7) & 0xFFFFFFFFFFFFFFF8;
        v55 = swift_allocObject();
        *(_QWORD *)(v55 + 16) = v51;
        v37[4]((char *)(v55 + v53), (uint64_t)v52, v36);
        *(_QWORD *)(v55 + v54) = a1;
        type metadata accessor for SafetyBlock();
        swift_allocObject();
        swift_unknownObjectRetain();
        v56 = a1;
        v57 = sub_1C2ECB220((uint64_t)sub_1C2EED520, v55);
        v96 = v56;
        v106 = sub_1C2EED578;
        v107 = v57;
        v85 = v57;
        aBlock = MEMORY[0x1E0C809B0];
        v103 = 1107296256;
        v104 = sub_1C2EDDEC4;
        v105 = &block_descriptor_217;
        v58 = _Block_copy(&aBlock);
        swift_retain();
        v59 = v97;
        sub_1C2EF7380();
        v101 = v49;
        sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DE0);
        sub_1C2EED464(&qword_1EF7D2DE8, &qword_1EF7D2DE0);
        v60 = v98;
        v61 = v100;
        sub_1C2EF76B0();
        sub_1C2EF75A8();
        _Block_release(v58);
        v87 = *(_QWORD *)(v87 + 8);
        ((void (*)(char *, uint64_t))v87)(v60, v61);
        v86 = *(_QWORD *)(v86 + 8);
        ((void (*)(char *, uint64_t))v86)(v59, v99);
        swift_release();
        ObjectType = swift_getObjectType();
        v63 = v88;
        sub_1C2EF7398();
        v64 = (uint64_t)v93;
        *v93 = 2;
        v65 = v90;
        v66 = v95;
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v90 + 104))(v64, *MEMORY[0x1E0DEF4A0], v95);
        v67 = v91;
        MEMORY[0x1C3BCBFFC](v63, v64);
        v68 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
        v68(v64, v66);
        v69 = *(void (**)(char *, uint64_t))(v89 + 8);
        v70 = v92;
        v69(v63, v92);
        sub_1C2EE8A34(v64);
        v71 = v94;
        sub_1C2EE8A78(v94);
        MEMORY[0x1C3BCC26C](v67, v64, v71, ObjectType);
        v68((uint64_t)v71, v66);
        v68(v64, v66);
        v69(v67, v70);
        v72 = swift_allocObject();
        v73 = v96;
        v74 = v85;
        *(_QWORD *)(v72 + 16) = v96;
        *(_QWORD *)(v72 + 24) = v74;
        v106 = sub_1C2EED59C;
        v107 = v72;
        aBlock = MEMORY[0x1E0C809B0];
        v103 = 1107296256;
        v104 = sub_1C2EDDEC4;
        v105 = &block_descriptor_223;
        v75 = _Block_copy(&aBlock);
        v76 = v73;
        swift_retain();
        v77 = v97;
        sub_1C2EF7380();
        v78 = v98;
        sub_1C2EE8CC8();
        sub_1C2EF75FC();
        _Block_release(v75);
        ((void (*)(char *, uint64_t))v87)(v78, v100);
        ((void (*)(char *, uint64_t))v86)(v77, v99);
        swift_release();
        sub_1C2EF7614();
        swift_release();
        return (void *)swift_unknownObjectRelease();
      }
LABEL_17:
      v37 = v96;
      if (a1[v35] == 1)
      {
        if (qword_1EF7D29F0 != -1)
          swift_once();
        v44 = __swift_project_value_buffer(v14, (uint64_t)qword_1EF7D6040);
        v45 = v15;
        (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v44, v14);
        v46 = sub_1C2EF7344();
        v47 = sub_1C2EF7590();
        if (os_log_type_enabled(v46, v47))
        {
          v48 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v48 = 0;
          _os_log_impl(&dword_1C2EC6000, v46, v47, "Still waiting on home manager data sync", v48, 2u);
          MEMORY[0x1C3BCCB60](v48, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v14);
      }
      goto LABEL_23;
    }
LABEL_16:
    v36 = v80;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2EE839C(unsigned __int8 a1, uint64_t a2, uint64_t a3, char *a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  id v27;
  void (*v28)(char *, uint64_t);
  void *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD aBlock[6];

  v40 = a4;
  v42 = a3;
  v4 = a1;
  v5 = sub_1C2EF7350();
  v38 = *(_QWORD *)(v5 - 8);
  v39 = v5;
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B08);
  v8 = *(_QWORD *)(v41 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v41);
  v10 = sub_1C2EF7308();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v37 - v15;
  swift_getObjectType();
  result = sub_1C2EF7608();
  if (v4 == 2)
  {
    if (qword_1EF7D29F0 != -1)
      swift_once();
    v18 = v39;
    v19 = __swift_project_value_buffer(v39, (uint64_t)qword_1EF7D6040);
    v20 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v7, v19, v18);
    v21 = sub_1C2EF7344();
    v22 = sub_1C2EF759C();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1C2EC6000, v21, v22, "Timed out waiting for HMHomeManager to be ready", v23, 2u);
      MEMORY[0x1C3BCCB60](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v18);
    sub_1C2EED624();
    v24 = swift_allocError();
    *v25 = 0;
    aBlock[0] = v24;
    return sub_1C2EF7518();
  }
  else
  {
    v26 = *(void **)&v40[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager];
    if (v26)
    {
      v27 = v26;
      sub_1C2EF72FC();
      sub_1C2EF72F0();
      v28 = *(void (**)(char *, uint64_t))(v11 + 8);
      v28(v14, v10);
      v29 = (void *)sub_1C2EF72E4();
      v28(v16, v10);
      v30 = v41;
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v42, v41);
      v31 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v32 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v32 + v31, (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v30);
      v33 = v40;
      *(_QWORD *)(v32 + ((v9 + v31 + 7) & 0xFFFFFFFFFFFFFFF8)) = v40;
      aBlock[4] = sub_1C2EED5E8;
      aBlock[5] = v32;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1C2EDF8E0;
      aBlock[3] = &block_descriptor_232;
      v34 = _Block_copy(aBlock);
      v35 = v33;
      swift_release();
      v36 = objc_msgSend(v27, sel__refreshBeforeDate_completionHandler_, v29, v34);
      _Block_release(v34);

      return swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1C2EE8720(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD v26[3];
  uint64_t v27;

  v6 = sub_1C2EF7350();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v11 = a1;
    if (qword_1EF7D29F0 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v6, (uint64_t)qword_1EF7D6040);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v12, v6);
    v13 = a1;
    v14 = a1;
    v15 = sub_1C2EF7344();
    v16 = sub_1C2EF759C();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v26[1] = a2;
      v18 = (uint8_t *)v17;
      v19 = swift_slowAlloc();
      v27 = v19;
      *(_DWORD *)v18 = 136315138;
      v26[0] = v18 + 4;
      swift_getErrorValue();
      v20 = sub_1C2EF7974();
      v26[2] = sub_1C2ED1D08(v20, v21, &v27);
      sub_1C2EF7668();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C2EC6000, v15, v16, "Failed to refresh HMHomeManager: %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BCCB60](v19, -1, -1);
      MEMORY[0x1C3BCCB60](v18, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    sub_1C2EED624();
    v24 = swift_allocError();
    *v25 = a1;
    v27 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B08);
    return sub_1C2EF7518();
  }
  else
  {
    v22 = *(void **)(a3 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager);
    if (v22)
    {
      v27 = *(_QWORD *)(a3 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager);
      v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B08);
      return sub_1C2EF7524();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_1C2EE89D4()
{
  void *v0;
  void (*v1)(void *);
  id v2;

  OUTLINED_FUNCTION_79_0();
  v2 = v0;
  v1(v0);
  swift_release();
  OUTLINED_FUNCTION_43_1(v2);
}

BOOL sub_1C2EE8A10()
{
  return sub_1C2ECB248(0);
}

uint64_t sub_1C2EE8A34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0DEF498];
  v3 = sub_1C2EF7368();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_1C2EE8A78@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = 0;
  v2 = *MEMORY[0x1E0DEF480];
  v3 = sub_1C2EF7368();
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_1C2EE8AC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD aBlock[6];

  v3 = sub_1C2EF7374();
  v4 = (void (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v13[0] = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1C2EF738C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[4] = sub_1C2EED5A4;
  aBlock[5] = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C2ECEDA0;
  aBlock[3] = &block_descriptor_226;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_1C2EF7380();
  v13[1] = MEMORY[0x1E0DEE9D8];
  sub_1C2EECC90(&qword_1EF7D2DD8, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DE0);
  sub_1C2EED464(&qword_1EF7D2DE8, &qword_1EF7D2DE0);
  sub_1C2EF76B0();
  MEMORY[0x1C3BCC218](0, v10, v6, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v13[0] + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return swift_release();
}

BOOL sub_1C2EE8CA4()
{
  return sub_1C2ECB248(2);
}

uint64_t sub_1C2EE8CC8()
{
  sub_1C2EF7374();
  sub_1C2EECC90(&qword_1EF7D2DD8, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D2DE0);
  sub_1C2EED464(&qword_1EF7D2DE8, &qword_1EF7D2DE0);
  return sub_1C2EF76B0();
}

void sub_1C2EE8D7C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
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

  OUTLINED_FUNCTION_8_1();
  v51 = v0;
  v2 = v1;
  v3 = OUTLINED_FUNCTION_31();
  v52 = *(_QWORD *)(v3 - 8);
  v53 = v3;
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_108();
  v50 = v5;
  MEMORY[0x1E0C80A78](v6);
  v46 = (uint64_t)&v46 - v7;
  v8 = *(uint8_t **)v2;
  v9 = *(_QWORD *)(v2 + 8);
  v11 = *(_QWORD *)(v2 + 16);
  v10 = *(_QWORD *)(v2 + 24);
  v12 = *(_QWORD *)(v2 + 32);
  v13 = *(_QWORD *)(v2 + 40);
  v14 = *(_QWORD *)(v2 + 48);
  v15 = *(_QWORD *)(v2 + 56);
  v48 = *(_QWORD *)(v2 + 64);
  v49 = v12;
  v47 = *(_QWORD *)(v2 + 72);
  v16 = MEMORY[0x1E0DEE9D8];
  v65 = MEMORY[0x1E0DEE9D8];
  v54 = (uint64_t)v8;
  v17 = sub_1C2EF1DE4();
  v64 = v16;
  if (v10 != 1 || v14 != 1)
  {
    v54 = (uint64_t)v8;
    v55 = v9;
    v56 = v11;
    v57 = v10;
    v58 = v49;
    v59 = v13;
    v60 = v14;
    v61 = v15;
    v62 = v48;
    v63 = v47;
    sub_1C2EE955C();
    v20 = v19;
    v21 = v53;
    goto LABEL_8;
  }
  v22 = objc_msgSend(v51, sel_currentHome);
  v21 = v53;
  if (v22)
  {
    v23 = v22;
    v24 = objc_msgSend(v22, sel_rooms);
    OUTLINED_FUNCTION_43((uint64_t)v24, (unint64_t *)&unk_1EF7D39D8);
    v20 = OUTLINED_FUNCTION_99();

LABEL_8:
    v25 = v52;
    v64 = v20;
    v26 = v50;
    if (qword_1EF7D29F0 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v21, (uint64_t)qword_1EF7D6040);
    OUTLINED_FUNCTION_71_0(v26, v27, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 16));
    v28 = v64;
    swift_bridgeObjectRetain_n();
    v29 = sub_1C2EF7344();
    v30 = sub_1C2EF7590();
    if (os_log_type_enabled(v29, v30))
    {
      v8 = (uint8_t *)OUTLINED_FUNCTION_24();
      *(_DWORD *)v8 = 134217984;
      if (!(v28 >> 62))
      {
        v31 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_13;
      }
LABEL_35:
      swift_bridgeObjectRetain();
      v31 = sub_1C2EF7884();
      OUTLINED_FUNCTION_37_0();
LABEL_13:
      OUTLINED_FUNCTION_37_0();
      v54 = v31;
      sub_1C2EF7668();
      OUTLINED_FUNCTION_37_0();
      OUTLINED_FUNCTION_89(&dword_1C2EC6000, v29, v30, "No. of rooms matching description: %ld", v8);
      OUTLINED_FUNCTION_3_3();
    }

    OUTLINED_FUNCTION_78_0();
    OUTLINED_FUNCTION_61_0(v26, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
    swift_beginAccess();
    v32 = v64;
    if ((unint64_t)v64 >> 62)
    {
      if (v64 < 0)
        v29 = v64;
      else
        v29 = (v64 & 0xFFFFFFFFFFFFFF8);
      OUTLINED_FUNCTION_11_4();
      v33 = sub_1C2EF7884();
      if (v33)
        goto LABEL_16;
    }
    else
    {
      v33 = *(_QWORD *)((v64 & 0xFFFFFFFFFFFFF8) + 0x10);
      OUTLINED_FUNCTION_11_4();
      if (v33)
      {
LABEL_16:
        if (v33 < 1)
        {
          __break(1u);
          goto LABEL_35;
        }
        v34 = 0;
        do
        {
          if ((v32 & 0xC000000000000001) != 0)
            v35 = (id)MEMORY[0x1C3BCC3B0](v34, v32);
          else
            v35 = *(id *)(v32 + 8 * v34 + 32);
          v36 = v35;
          ++v34;
          v37 = objc_msgSend(v35, sel_accessories);
          sub_1C2ED4708(0, &qword_1EF7D3A18);
          v38 = OUTLINED_FUNCTION_101();

          swift_bridgeObjectRetain();
          v39 = sub_1C2EE0DB0(v38, v17);
          swift_bridgeObjectRelease();
          sub_1C2EE93A8(v39);

        }
        while (v33 != v34);
      }
    }
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_78_0();
    goto LABEL_23;
  }
  OUTLINED_FUNCTION_9();
  v40 = v52;
  if (qword_1EF7D29F0 != -1)
    swift_once();
  v41 = __swift_project_value_buffer(v21, (uint64_t)qword_1EF7D6040);
  v42 = v46;
  OUTLINED_FUNCTION_71_0(v46, v41, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 16));
  v43 = sub_1C2EF7344();
  v44 = sub_1C2EF759C();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)OUTLINED_FUNCTION_24();
    *(_WORD *)v45 = 0;
    OUTLINED_FUNCTION_62_0(&dword_1C2EC6000, v43, v44, "No current home available", v45);
    OUTLINED_FUNCTION_3_3();
  }

  OUTLINED_FUNCTION_61_0(v42, *(uint64_t (**)(uint64_t, uint64_t))(v40 + 8));
LABEL_23:
  OUTLINED_FUNCTION_0_1();
}

uint64_t sub_1C2EE91F4(unint64_t a1)
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
    v3 = sub_1C2EF7884();
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
    v5 = sub_1C2EF7884();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_24;
  }
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
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
    v4 = MEMORY[0x1C3BCC3BC](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = sub_1C2EEC7E0(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1C2EF7884();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_20;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_20:
    swift_bridgeObjectRelease();
    return sub_1C2EF74E8();
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2EE93A8(unint64_t a1)
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
    v3 = sub_1C2EF7884();
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
    v5 = sub_1C2EF7884();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_24;
  }
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
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
    v4 = MEMORY[0x1C3BCC3BC](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = sub_1C2EEC988(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1C2EF7884();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_20;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_20:
    swift_bridgeObjectRelease();
    return sub_1C2EF74E8();
  }
  __break(1u);
  return result;
}

void sub_1C2EE955C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  id v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;

  OUTLINED_FUNCTION_8_1();
  v3 = v2;
  v5 = v4;
  v6 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_2_1();
  v40 = v5[1];
  v9 = v5[3];
  v8 = v5[4];
  v10 = v5[6];
  v11 = objc_msgSend(v3, sel_currentHome);
  if (!v11)
  {
    if (qword_1EF7D29F0 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v6, (uint64_t)qword_1EF7D6040);
    OUTLINED_FUNCTION_71_0(v0, v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
    v18 = sub_1C2EF7344();
    v19 = sub_1C2EF759C();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)OUTLINED_FUNCTION_24();
      *(_WORD *)v20 = 0;
      OUTLINED_FUNCTION_62_0(&dword_1C2EC6000, v18, v19, "No current home available", v20);
      OUTLINED_FUNCTION_3_3();
    }

    OUTLINED_FUNCTION_61_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    goto LABEL_37;
  }
  v12 = v11;
  v39 = v9;
  v13 = objc_msgSend(v3, sel_currentAccessory);
  v14 = objc_msgSend(v13, sel_room);

  v15 = objc_msgSend(v12, sel_zones);
  OUTLINED_FUNCTION_43((uint64_t)v15, &qword_1EF7D39D0);
  v16 = OUTLINED_FUNCTION_101();

  if (v10 == 1)
    goto LABEL_3;
  if ((v8 & 1) != 0 && v14)
  {
    v21 = v14;
    v22 = v14;
    v23 = OUTLINED_FUNCTION_54();
    v24 = sub_1C2EE9CA8(v23, v22);
    v37 = 0;
    swift_bridgeObjectRelease();
    if (v24)
    {
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D31F0);
      v25 = OUTLINED_FUNCTION_11();
      *(_OWORD *)(v25 + 16) = xmmword_1C2EF9BC0;
      *(_QWORD *)(v25 + 32) = v24;
      OUTLINED_FUNCTION_96(v25);
      v16 = v41;
    }

    v14 = v21;
  }
  else
  {
    if (!v10)
    {
LABEL_3:
      v37 = 0;
      goto LABEL_16;
    }
    swift_bridgeObjectRetain();
    v16 = sub_1C2EE2664(v16);
    v37 = 0;
  }
LABEL_16:
  v42 = MEMORY[0x1E0DEE9D8];
  if (v16 >> 62)
  {
    OUTLINED_FUNCTION_54();
    v26 = sub_1C2EF7884();
  }
  else
  {
    v26 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_54();
  }
  v38 = v14;
  if (!v26)
  {
    OUTLINED_FUNCTION_78_0();
    v32 = MEMORY[0x1E0DEE9D8];
    goto LABEL_27;
  }
  if (v26 >= 1)
  {
    v27 = 0;
    do
    {
      if ((v16 & 0xC000000000000001) != 0)
        v28 = (id)MEMORY[0x1C3BCC3B0](v27, v16);
      else
        v28 = *(id *)(v16 + 8 * v27 + 32);
      v29 = v28;
      ++v27;
      v30 = objc_msgSend(v28, sel_rooms, v37);
      sub_1C2ED4708(0, (unint64_t *)&unk_1EF7D39D8);
      v31 = OUTLINED_FUNCTION_99();

      sub_1C2EE91F4(v31);
    }
    while (v26 != v27);
    OUTLINED_FUNCTION_78_0();
    v32 = v42;
LABEL_27:
    if (v32 >> 62)
    {
      swift_bridgeObjectRetain();
      v36 = sub_1C2EF7884();
      OUTLINED_FUNCTION_13_0();
      if (v36)
      {
LABEL_30:
        if (v39 != 1)
        {
          if ((v40 & 1) != 0 && v38)
          {
            v34 = v38;
            OUTLINED_FUNCTION_13_0();
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D31F0);
            v35 = OUTLINED_FUNCTION_11();
            *(_OWORD *)(v35 + 16) = xmmword_1C2EF9BC0;
            *(_QWORD *)(v35 + 32) = v34;
            OUTLINED_FUNCTION_96(v35);

LABEL_37:
            OUTLINED_FUNCTION_0_1();
            return;
          }
          if (v39)
          {
            swift_bridgeObjectRetain();
            sub_1C2EE2664(v32);
          }
        }

        goto LABEL_37;
      }
    }
    else if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_30;
    }
    OUTLINED_FUNCTION_13_0();
    v33 = objc_msgSend(v12, sel_rooms);
    OUTLINED_FUNCTION_43((uint64_t)v33, (unint64_t *)&unk_1EF7D39D8);
    v32 = sub_1C2EF74D0();

    goto LABEL_30;
  }
  __break(1u);
}

size_t sub_1C2EE99D8(id *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  size_t result;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v27 = sub_1C2EF7338();
  v5 = *(_QWORD *)(v27 - 8);
  v6 = MEMORY[0x1E0C80A78](v27);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v24 - v9;
  v11 = objc_msgSend(*a1, sel_rooms);
  sub_1C2ED4708(0, (unint64_t *)&unk_1EF7D39D8);
  v12 = sub_1C2EF74D0();

  if (!(v12 >> 62))
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    v16 = MEMORY[0x1E0DEE9D8];
LABEL_14:
    v22 = objc_msgSend(a2, sel_uniqueIdentifier);
    sub_1C2EF7320();

    MEMORY[0x1E0C80A78](v23);
    *(&v24 - 2) = v10;
    LOBYTE(v22) = sub_1C2EEC548((uint64_t (*)(char *))sub_1C2EECC74, (uint64_t)(&v24 - 4), v16);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v27);
    swift_bridgeObjectRelease();
    return v22 & 1;
  }
  swift_bridgeObjectRetain();
  v13 = sub_1C2EF7884();
  swift_bridgeObjectRelease();
  if (!v13)
    goto LABEL_13;
LABEL_3:
  v28 = MEMORY[0x1E0DEE9D8];
  result = sub_1C2EEC298(0, v13 & ~(v13 >> 63), 0);
  if ((v13 & 0x8000000000000000) == 0)
  {
    v24 = a2;
    v25 = v10;
    v26 = v2;
    v15 = 0;
    v16 = v28;
    do
    {
      if ((v12 & 0xC000000000000001) != 0)
        v17 = (id)MEMORY[0x1C3BCC3B0](v15, v12);
      else
        v17 = *(id *)(v12 + 8 * v15 + 32);
      v18 = v17;
      v19 = objc_msgSend(v17, sel_uniqueIdentifier, v24, v25, v26);
      sub_1C2EF7320();

      v28 = v16;
      v21 = *(_QWORD *)(v16 + 16);
      v20 = *(_QWORD *)(v16 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_1C2EEC298(v20 > 1, v21 + 1, 1);
        v16 = v28;
      }
      ++v15;
      *(_QWORD *)(v16 + 16) = v21 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v16+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v21, v8, v27);
    }
    while (v13 != v15);
    swift_bridgeObjectRelease();
    v10 = v25;
    a2 = v24;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void *sub_1C2EE9CA8(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v12;

  if (a1 >> 62)
    goto LABEL_16;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_1C2EF7884())
  {
    v6 = 4;
    while (1)
    {
      v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C3BCC3B0](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v12 = v7;
      v10 = sub_1C2EE99D8(&v12, a2);
      if (v2)
      {

        swift_bridgeObjectRelease();
        return v8;
      }
      if ((v10 & 1) != 0)
      {

        swift_bridgeObjectRelease();
        return v8;
      }

      ++v6;
      if (v9 == v5)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:

  swift_bridgeObjectRelease();
  return 0;
}

void sub_1C2EE9DD4()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_88();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_2_1();
  v5 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_initialLoadDone;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_initialLoadDone) & 1) == 0)
  {
    if (qword_1EF7D29F0 != -1)
      swift_once();
    v6 = __swift_project_value_buffer(v1, (uint64_t)qword_1EF7D6040);
    OUTLINED_FUNCTION_64_0(v6);
    v7 = sub_1C2EF7344();
    v8 = sub_1C2EF7590();
    if (OUTLINED_FUNCTION_77_0(v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_24();
      *(_WORD *)v9 = 0;
      OUTLINED_FUNCTION_62_0(&dword_1C2EC6000, v7, v2, "Home manager updated homes", v9);
      OUTLINED_FUNCTION_3_3();
    }

    OUTLINED_FUNCTION_61_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    *(_BYTE *)(v0 + v5) = 1;
    dispatch_group_leave(*(dispatch_group_t *)(v0
                                             + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManagerReadyGroup));
  }
  OUTLINED_FUNCTION_63_0();
}

void sub_1C2EE9F20()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_88();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_2_1();
  v5 = *(void **)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager);
  if (v5)
  {
    if ((objc_msgSend(v5, sel_isDataSyncInProgress) & 1) == 0)
    {
      if (qword_1EF7D29F0 != -1)
        swift_once();
      v6 = __swift_project_value_buffer(v1, (uint64_t)qword_1EF7D6040);
      OUTLINED_FUNCTION_64_0(v6);
      v7 = sub_1C2EF7344();
      v8 = sub_1C2EF7590();
      if (OUTLINED_FUNCTION_77_0(v8))
      {
        v9 = (uint8_t *)OUTLINED_FUNCTION_24();
        *(_WORD *)v9 = 0;
        OUTLINED_FUNCTION_62_0(&dword_1C2EC6000, v7, v2, "Home manager data sync finished", v9);
        OUTLINED_FUNCTION_3_3();
      }

      OUTLINED_FUNCTION_61_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
      dispatch_group_leave(*(dispatch_group_t *)(v0
                                               + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManagerReadyGroup));
      *(_BYTE *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_waitingOnHomeManagerDataSync) = 0;
    }
    OUTLINED_FUNCTION_63_0();
  }
  else
  {
    __break(1u);
  }
}

id DeviceResolutionService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeviceResolutionService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1C2EEA128()
{
  sub_1C2EDEA94();
}

uint64_t sub_1C2EEA148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1C2EDEF64(a1, a2, a3);
}

uint64_t sub_1C2EEA168()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C2EEA1B0;
  return sub_1C2EDF404();
}

uint64_t sub_1C2EEA1B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_6_6();
  if (!v1)
    v4 = a1;
  return OUTLINED_FUNCTION_9_3(v4, *(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_1C2EEA1E0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C2EED97C;
  return sub_1C2EDF8E4();
}

uint64_t sub_1C2EEA228(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C2EED97C;
  return sub_1C2EE29DC(a1);
}

uint64_t sub_1C2EEA278(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C2EED97C;
  return sub_1C2EDFFCC(a1);
}

uint64_t sub_1C2EEA2C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C2EED97C;
  return sub_1C2EE452C(a1, a2);
}

uint64_t sub_1C2EEA328(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1C2EED97C;
  return sub_1C2EE4CFC(a1);
}

void sub_1C2EEA378()
{
  sub_1C2EE5964();
}

void sub_1C2EEA398()
{
  sub_1C2EE6290();
}

void sub_1C2EEA3B8()
{
  sub_1C2EE6650();
}

uint64_t sub_1C2EEA3D8(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C2EED97C;
  return sub_1C2EE132C(a1, a2);
}

id sub_1C2EEA438()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)sub_1C2EF7410();
  swift_bridgeObjectRelease();
  v2 = (void *)sub_1C2EF7548();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_initWithKey_valueSet_, v1, v2);

  return v3;
}

uint64_t type metadata accessor for DeviceResolutionService()
{
  uint64_t result;

  result = qword_1EF7D3980;
  if (!qword_1EF7D3980)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1C2EEA4F8()
{
  unint64_t result;

  result = qword_1EF7D38A8;
  if (!qword_1EF7D38A8)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for DeviceResolutionService.XPCError, &type metadata for DeviceResolutionService.XPCError);
    atomic_store(result, (unint64_t *)&qword_1EF7D38A8);
  }
  return result;
}

uint64_t sub_1C2EEA534()
{
  return type metadata accessor for DeviceResolutionService();
}

void sub_1C2EEA53C()
{
  unint64_t v0;

  sub_1C2EEA960();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for DeviceResolutionService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DeviceResolutionService.setHomeKitDataSource(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of DeviceResolutionService.setEndpointUUID(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of DeviceResolutionService.devices(matchingAny:with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of DeviceResolutionService.pairedCompanionDevice()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_3_7();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C2EEA688;
  return OUTLINED_FUNCTION_4_6(v3);
}

uint64_t sub_1C2EEA688(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_6_6();
  return OUTLINED_FUNCTION_9_3(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t dispatch thunk of DeviceResolutionService.meDevice()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_3_7();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1C2EEDA2C;
  return OUTLINED_FUNCTION_4_6(v3);
}

uint64_t dispatch thunk of DeviceResolutionService.devices(matchingAny:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_7_4();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_52_0(v1, (uint64_t)sub_1C2EEDA2C);
  return OUTLINED_FUNCTION_23_1(v2, v3);
}

uint64_t dispatch thunk of DeviceResolutionService.homeAutomationAccessories(matchingAny:checkForReachability:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v5 = (_QWORD *)OUTLINED_FUNCTION_3_7();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C2EEDA2C;
  return v7(a1, a2);
}

uint64_t dispatch thunk of DeviceResolutionService.devicesMatching(capabilityDescriptions:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_7_4();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_52_0(v1, (uint64_t)sub_1C2EEDA2C);
  return OUTLINED_FUNCTION_23_1(v2, v3);
}

uint64_t dispatch thunk of DeviceResolutionService.devicesWithProximity(closerBound:fartherBound:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v5 = (_QWORD *)OUTLINED_FUNCTION_3_7();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C2EEDA2C;
  return v7(a1, a2);
}

uint64_t dispatch thunk of DeviceResolutionService.sourceDevices(for:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_7_4();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_52_0(v1, (uint64_t)sub_1C2EEDA2C);
  return OUTLINED_FUNCTION_23_1(v2, v3);
}

uint64_t dispatch thunk of DeviceResolutionService.devicesWithProximity(closerBound:fartherBound:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of DeviceResolutionService.sourceDevices(for:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of DeviceResolutionService.devicesMatching(capabilityDescriptions:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of DeviceResolutionService.homeManagerDidUpdateHomes(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of DeviceResolutionService.homeManagerDidUpdateDataSync(inProgress:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

void sub_1C2EEA960()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF7D39C8)
  {
    sub_1C2EF7338();
    v0 = sub_1C2EF765C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF7D39C8);
  }
}

uint64_t getEnumTagSinglePayload for DeviceResolutionService.XPCError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DeviceResolutionService.XPCError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C2EEAA48 + 4 * byte_1C2EFA690[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C2EEAA68 + 4 * byte_1C2EFA695[v4]))();
}

_BYTE *sub_1C2EEAA48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C2EEAA68(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C2EEAA70(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C2EEAA78(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C2EEAA80(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C2EEAA88(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1C2EEAA94()
{
  return 0;
}

ValueMetadata *type metadata accessor for DeviceResolutionService.XPCError()
{
  return &type metadata for DeviceResolutionService.XPCError;
}

_QWORD *initializeBufferWithCopyOfBuffer for DeviceResolutionService.HomeManagerError(_QWORD *a1, id *a2)
{
  id v3;
  id v4;

  v3 = *a2;
  v4 = *a2;
  *a1 = v3;
  return a1;
}

void destroy for DeviceResolutionService.HomeManagerError(id *a1)
{

}

void **assignWithCopy for DeviceResolutionService.HomeManagerError(void **a1, id *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = *a2;
  v4 = *a2;
  v5 = *a1;
  *a1 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for DeviceResolutionService.HomeManagerError(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceResolutionService.HomeManagerError(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DeviceResolutionService.HomeManagerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_1C2EEABFC(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1C2EEAC14(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for DeviceResolutionService.HomeManagerError()
{
  return &type metadata for DeviceResolutionService.HomeManagerError;
}

uint64_t sub_1C2EEAC44(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1C2EEACA8;
  return v6(a1);
}

uint64_t sub_1C2EEACA8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_6();
  return OUTLINED_FUNCTION_4_6(*(uint64_t (**)(void))(v0 + 8));
}

char *sub_1C2EEACD0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFE0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1C2EEAEB0((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C2EEADBC(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1C2EEADBC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C2EF78B4();
  __break(1u);
  return result;
}

char *sub_1C2EEAEB0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C2EF78B4();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1C2EEAF34(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_1C2EF78B4();
    __break(1u);
  }
  else if (a3 < a1 || (result = sub_1C2EF7338(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_1C2EF7338();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_1C2EEB030(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (v3 = a1 + 16 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_1C2EF78B4();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3A58);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1C2EEB11C(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4)
{
  BOOL v4;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v4 = a1 + 8 * a2 > a3) : (v4 = 0), v4))
  {
    OUTLINED_FUNCTION_97();
    result = sub_1C2EF78B4();
    __break(1u);
  }
  else
  {
    sub_1C2ED4708(0, a4);
    OUTLINED_FUNCTION_83_0();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1C2EEB1EC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(sub_1C2EF7338() - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_1C2EF78B4();
  __break(1u);
  return result;
}

unint64_t sub_1C2EEB2E0(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_1C2EEB304(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3BB0);
    v16 = sub_1C2EF789C();
    sub_1C2EF77F4();
    v2 = sub_1C2EF7854();
    if (v2)
    {
      v3 = v2;
      OUTLINED_FUNCTION_43(v2, (unint64_t *)&qword_1EF7D2D40);
      while (1)
      {
        swift_dynamicCast();
        sub_1C2ED4708(0, &qword_1EF7D3610);
        swift_dynamicCast();
        v4 = v16;
        v5 = *(_QWORD *)(v16 + 16);
        if (*(_QWORD *)(v16 + 24) <= v5)
        {
          sub_1C2EEB980(v5 + 1, 1, (uint64_t *)&unk_1EF7D3BB0);
          v4 = v16;
        }
        v6 = sub_1C2EF7638();
        v7 = v4 + 64;
        v8 = v6 & ~(-1 << *(_BYTE *)(v4 + 32));
        if (((-1 << v8) & ~*(_QWORD *)(v4 + 64 + 8 * (v8 >> 6))) == 0)
          break;
        v9 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v4 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
        *(_QWORD *)(v7 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v9) = v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v9) = v3;
        ++*(_QWORD *)(v4 + 16);
        v3 = sub_1C2EF7854();
        if (!v3)
          goto LABEL_16;
      }
      OUTLINED_FUNCTION_95();
      while (++v11 != v12 || (v10 & 1) == 0)
      {
        v13 = v11 == v12;
        if (v11 == v12)
          v11 = 0;
        v10 |= v13;
        v14 = *(_QWORD *)(v7 + 8 * v11);
        if (v14 != -1)
        {
          v9 = __clz(__rbit64(~v14)) + (v11 << 6);
          goto LABEL_15;
        }
      }
      __break(1u);
    }
    else
    {
LABEL_16:
      swift_release();
    }
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1C2EEB538(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AF8);
  v2 = sub_1C2EF789C();
  v17 = v2;
  sub_1C2EF77F4();
  v3 = sub_1C2EF7854();
  if (!v3)
  {
LABEL_16:
    swift_release();
    return v2;
  }
  v4 = v3;
  type metadata accessor for DeviceUnit();
  while (1)
  {
    swift_dynamicCast();
    sub_1C2ED4708(0, &qword_1EF7D3A18);
    swift_dynamicCast();
    v2 = v17;
    v5 = *(_QWORD *)(v17 + 16);
    if (*(_QWORD *)(v17 + 24) <= v5)
    {
      sub_1C2EEB980(v5 + 1, 1, &qword_1EF7D3AF8);
      v2 = v17;
    }
    result = sub_1C2EF7638();
    v7 = v2 + 64;
    v8 = -1 << *(_BYTE *)(v2 + 32);
    v9 = result & ~v8;
    v10 = v9 >> 6;
    if (((-1 << v9) & ~*(_QWORD *)(v2 + 64 + 8 * (v9 >> 6))) == 0)
      break;
    v11 = __clz(__rbit64((-1 << v9) & ~*(_QWORD *)(v2 + 64 + 8 * (v9 >> 6)))) | v9 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(_QWORD *)(v7 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v11) = v16;
    *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v11) = v4;
    ++*(_QWORD *)(v2 + 16);
    v4 = sub_1C2EF7854();
    if (!v4)
      goto LABEL_16;
  }
  v12 = 0;
  v13 = (unint64_t)(63 - v8) >> 6;
  while (++v10 != v13 || (v12 & 1) == 0)
  {
    v14 = v10 == v13;
    if (v10 == v13)
      v10 = 0;
    v12 |= v14;
    v15 = *(_QWORD *)(v7 + 8 * v10);
    if (v15 != -1)
    {
      v11 = __clz(__rbit64(~v15)) + (v10 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2EEB76C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3A90);
  v2 = sub_1C2EF789C();
  v17 = v2;
  sub_1C2EF77F4();
  v3 = sub_1C2EF7854();
  if (!v3)
  {
LABEL_16:
    swift_release();
    return v2;
  }
  v4 = v3;
  type metadata accessor for DeviceUnit();
  while (1)
  {
    swift_dynamicCast();
    type metadata accessor for Capabilities();
    swift_dynamicCast();
    v2 = v17;
    v5 = *(_QWORD *)(v17 + 16);
    if (*(_QWORD *)(v17 + 24) <= v5)
    {
      sub_1C2EEBC30(v5 + 1, 1);
      v2 = v17;
    }
    result = sub_1C2EF7638();
    v7 = v2 + 64;
    v8 = -1 << *(_BYTE *)(v2 + 32);
    v9 = result & ~v8;
    v10 = v9 >> 6;
    if (((-1 << v9) & ~*(_QWORD *)(v2 + 64 + 8 * (v9 >> 6))) == 0)
      break;
    v11 = __clz(__rbit64((-1 << v9) & ~*(_QWORD *)(v2 + 64 + 8 * (v9 >> 6)))) | v9 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(_QWORD *)(v7 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v11) = v16;
    *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v11) = v4;
    ++*(_QWORD *)(v2 + 16);
    v4 = sub_1C2EF7854();
    if (!v4)
      goto LABEL_16;
  }
  v12 = 0;
  v13 = (unint64_t)(63 - v8) >> 6;
  while (++v10 != v13 || (v12 & 1) == 0)
  {
    v14 = v10 == v13;
    if (v10 == v13)
      v10 = 0;
    v12 |= v14;
    v15 = *(_QWORD *)(v7 + 8 * v10);
    if (v15 != -1)
    {
      v11 = __clz(__rbit64(~v15)) + (v10 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2EEB980(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t i;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v7 = sub_1C2EF7890();
  v8 = v7;
  if (*(_QWORD *)(v6 + 16))
  {
    v9 = 1 << *(_BYTE *)(v6 + 32);
    v35 = v3;
    v36 = v6 + 64;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v6 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = v7 + 64;
    result = swift_retain();
    v15 = 0;
    if (!v11)
      goto LABEL_7;
LABEL_6:
    v16 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (i = v16 | (v15 << 6); ; i = __clz(__rbit64(v20)) + (v15 << 6))
    {
      v22 = *(void **)(*(_QWORD *)(v6 + 48) + 8 * i);
      v23 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * i);
      if ((a2 & 1) == 0)
      {
        v24 = v22;
        v25 = v23;
      }
      result = sub_1C2EF7638();
      v26 = -1 << *(_BYTE *)(v8 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v13 + 8 * (v27 >> 6))) == 0)
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v26) >> 6;
        while (++v28 != v31 || (v30 & 1) == 0)
        {
          v32 = v28 == v31;
          if (v28 == v31)
            v28 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v13 + 8 * v28);
          if (v33 != -1)
          {
            v29 = __clz(__rbit64(~v33)) + (v28 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v13 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v29) = v22;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v29) = v23;
      ++*(_QWORD *)(v8 + 16);
      if (v11)
        goto LABEL_6;
LABEL_7:
      v18 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_41;
      if (v18 >= v12)
        break;
      v19 = (_QWORD *)(v6 + 64);
      v20 = *(_QWORD *)(v36 + 8 * v18);
      ++v15;
      if (!v20)
      {
        v15 = v18 + 1;
        if (v18 + 1 >= v12)
          goto LABEL_32;
        v20 = *(_QWORD *)(v36 + 8 * v15);
        if (!v20)
        {
          v21 = v18 + 2;
          if (v21 >= v12)
          {
LABEL_32:
            OUTLINED_FUNCTION_114();
            v4 = v35;
            if ((a2 & 1) == 0)
              goto LABEL_39;
            goto LABEL_35;
          }
          v20 = *(_QWORD *)(v36 + 8 * v21);
          if (!v20)
          {
            while (1)
            {
              v15 = v21 + 1;
              if (__OFADD__(v21, 1))
                goto LABEL_42;
              if (v15 >= v12)
                goto LABEL_32;
              v20 = *(_QWORD *)(v36 + 8 * v15);
              ++v21;
              if (v20)
                goto LABEL_18;
            }
          }
          v15 = v21;
        }
      }
LABEL_18:
      v11 = (v20 - 1) & v20;
    }
    OUTLINED_FUNCTION_114();
    v4 = v35;
    v19 = (_QWORD *)(v6 + 64);
    if ((a2 & 1) == 0)
      goto LABEL_39;
LABEL_35:
    v34 = 1 << *(_BYTE *)(v6 + 32);
    if (v34 >= 64)
      sub_1C2EF252C(0, (unint64_t)(v34 + 63) >> 6, v19);
    else
      *v19 = -1 << v34;
    *(_QWORD *)(v6 + 16) = 0;
  }
LABEL_39:
  result = OUTLINED_FUNCTION_114();
  *v4 = v8;
  return result;
}

uint64_t sub_1C2EEBC30(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t i;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3A90);
  v6 = sub_1C2EF7890();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v33 = v2;
    v34 = v5 + 64;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v11 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 64;
    result = swift_retain();
    v14 = 0;
    if (!v10)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v19)) + (v14 << 6))
    {
      v21 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * i);
      v22 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * i);
      if ((a2 & 1) == 0)
      {
        v23 = v21;
        swift_retain();
      }
      result = sub_1C2EF7638();
      v24 = -1 << *(_BYTE *)(v7 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) == 0)
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          v30 = v26 == v29;
          if (v26 == v29)
            v26 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v26);
          if (v31 != -1)
          {
            v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v27) = v21;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v27) = v22;
      ++*(_QWORD *)(v7 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v17 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_41;
      if (v17 >= v11)
        break;
      v18 = (_QWORD *)(v5 + 64);
      v19 = *(_QWORD *)(v34 + 8 * v17);
      ++v14;
      if (!v19)
      {
        v14 = v17 + 1;
        if (v17 + 1 >= v11)
          goto LABEL_32;
        v19 = *(_QWORD *)(v34 + 8 * v14);
        if (!v19)
        {
          v20 = v17 + 2;
          if (v20 >= v11)
          {
LABEL_32:
            swift_release();
            v3 = v33;
            if ((a2 & 1) == 0)
              goto LABEL_39;
            goto LABEL_35;
          }
          v19 = *(_QWORD *)(v34 + 8 * v20);
          if (!v19)
          {
            while (1)
            {
              v14 = v20 + 1;
              if (__OFADD__(v20, 1))
                goto LABEL_42;
              if (v14 >= v11)
                goto LABEL_32;
              v19 = *(_QWORD *)(v34 + 8 * v14);
              ++v20;
              if (v19)
                goto LABEL_18;
            }
          }
          v14 = v20;
        }
      }
LABEL_18:
      v10 = (v19 - 1) & v19;
    }
    swift_release();
    v3 = v33;
    v18 = (_QWORD *)(v5 + 64);
    if ((a2 & 1) == 0)
      goto LABEL_39;
LABEL_35:
    v32 = 1 << *(_BYTE *)(v5 + 32);
    if (v32 >= 64)
      sub_1C2EF252C(0, (unint64_t)(v32 + 63) >> 6, v18);
    else
      *v18 = -1 << v32;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1C2EEBEF4(uint64_t a1, int a2)
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
  unint64_t i;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
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
  uint64_t v41;
  int v42;

  v3 = v2;
  v5 = sub_1C2EF7338();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AA8);
  v42 = a2;
  v10 = sub_1C2EF7890();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_40;
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
  v41 = v9;
  if (!v15)
    goto LABEL_7;
LABEL_6:
  v19 = __clz(__rbit64(v15));
  v15 &= v15 - 1;
  for (i = v19 | (v18 << 6); ; i = __clz(__rbit64(v23)) + (v18 << 6))
  {
    v25 = *(_QWORD *)(v6 + 72);
    v26 = *(_QWORD *)(v9 + 48) + v25 * i;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v26, v5);
      v27 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * i);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v26, v5);
      v27 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * i);
    }
    sub_1C2EECC90(&qword_1EF7D3A98, (void (*)(uint64_t))MEMORY[0x1E0CB0998]);
    result = sub_1C2EF73F8();
    v28 = -1 << *(_BYTE *)(v11 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6))) == 0)
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v28) >> 6;
      while (++v30 != v33 || (v32 & 1) == 0)
      {
        v34 = v30 == v33;
        if (v30 == v33)
          v30 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v30);
        if (v35 != -1)
        {
          v31 = __clz(__rbit64(~v35)) + (v30 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    v31 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(_QWORD *)(v16 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v31;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v25 * v31, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v31) = v27;
    ++*(_QWORD *)(v11 + 16);
    v9 = v41;
    if (v15)
      goto LABEL_6;
LABEL_7:
    v21 = v18 + 1;
    if (__OFADD__(v18, 1))
      goto LABEL_42;
    if (v21 >= v39)
    {
      swift_release();
      v3 = v38;
      v22 = v40;
      goto LABEL_35;
    }
    v22 = v40;
    v23 = v40[v21];
    ++v18;
    if (!v23)
    {
      v18 = v21 + 1;
      if (v21 + 1 >= v39)
        goto LABEL_33;
      v23 = v40[v18];
      if (!v23)
        break;
    }
LABEL_18:
    v15 = (v23 - 1) & v23;
  }
  v24 = v21 + 2;
  if (v24 < v39)
  {
    v23 = v40[v24];
    if (!v23)
    {
      while (1)
      {
        v18 = v24 + 1;
        if (__OFADD__(v24, 1))
          goto LABEL_43;
        if (v18 >= v39)
          goto LABEL_33;
        v23 = v40[v18];
        ++v24;
        if (v23)
          goto LABEL_18;
      }
    }
    v18 = v24;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  v3 = v38;
LABEL_35:
  if ((v42 & 1) != 0)
  {
    v36 = 1 << *(_BYTE *)(v9 + 32);
    if (v36 >= 64)
      sub_1C2EF252C(0, (unint64_t)(v36 + 63) >> 6, v22);
    else
      *v22 = -1 << v36;
    *(_QWORD *)(v9 + 16) = 0;
  }
LABEL_40:
  result = swift_release();
  *v3 = v11;
  return result;
}

char *sub_1C2EEC27C(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1C2EEC2B4(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

size_t sub_1C2EEC298(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_1C2EEC394(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1C2EEC2B4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3A50);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1C2EEAEB0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C2EEB030((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_1C2EEC394(size_t result, int64_t a2, char a3, uint64_t a4)
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
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D39F8);
  v10 = *(_QWORD *)(sub_1C2EF7338() - 8);
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
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_1C2EF7338() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_1C2EEAF34(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C2EEB1EC(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_1C2EEC4D4()
{
  sub_1C2EF7338();
  sub_1C2EECC90(&qword_1EF7D39F0, (void (*)(uint64_t))MEMORY[0x1E0CB0998]);
  return sub_1C2EF7404() & 1;
}

BOOL sub_1C2EEC548(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  int EnumTagSinglePayload;
  BOOL v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t (*v27)(char *);

  v4 = v3;
  v26 = a2;
  v27 = a1;
  v6 = sub_1C2EF7338();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D39E8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a3 + 16);
  v23 = a3;
  if (v13)
  {
    v14 = a3 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v15 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v24 = *(_QWORD *)(v7 + 72);
    v25 = v15;
    swift_bridgeObjectRetain();
    while (1)
    {
      v25(v12, v14, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6);
      v17 = EnumTagSinglePayload != 1;
      if (EnumTagSinglePayload == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v12, v6);
      v18 = v27(v9);
      v19 = v7;
      if (v4)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        swift_bridgeObjectRelease();
        return v17;
      }
      v20 = v18;
      v21 = v19;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v6);
      if ((v20 & 1) != 0)
        break;
      v14 += v24;
      --v13;
      v7 = v21;
      v4 = 0;
      if (!v13)
        goto LABEL_9;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
LABEL_9:
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v6);
    v17 = 0;
  }
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_1C2EEC748@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_1C2EEC780(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_homeKitAccessoryIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1C2EF741C();

  return v3;
}

uint64_t sub_1C2EEC7E0(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  uint64_t (*v10)();
  id *v11;
  id v12;
  _QWORD v13[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1C2EF7884();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1C2EF7884();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1C2EED464(&qword_1EF7D3A10, &qword_1EF7D3A08);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3A08);
            v10 = sub_1C2EECB30(v13, i, a3);
            v12 = *v11;
            ((void (*)(_QWORD *, _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1C2EEB11C((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, (unint64_t *)&unk_1EF7D39D8);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2EEC988(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  uint64_t (*v10)();
  id *v11;
  id v12;
  _QWORD v13[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1C2EF7884();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1C2EF7884();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1C2EED464(&qword_1EF7D3A20, &qword_1EF7D3850);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3850);
            v10 = sub_1C2EECB88(v13, i, a3);
            v12 = *v11;
            ((void (*)(_QWORD *, _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1C2EEB11C((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, &qword_1EF7D3A18);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t (*sub_1C2EECB30(_QWORD *a1, unint64_t a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_1C2EECC08(v6, a2, a3);
  return sub_1C2EECB84;
}

uint64_t (*sub_1C2EECB88(_QWORD *a1, unint64_t a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_1C2EECCC4(v6, a2, a3);
  return sub_1C2EECB84;
}

void sub_1C2EECBDC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1C2EECC08(_QWORD *a1, unint64_t a2, uint64_t a3))(id *)
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_1C2EEB2E0(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = (id)MEMORY[0x1C3BCC3B0](a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  return sub_1C2EEDA28;
}

uint64_t sub_1C2EECC74()
{
  return sub_1C2EEC4D4() & 1;
}

void sub_1C2EECC90(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_100();
  }
  OUTLINED_FUNCTION_5();
}

void (*sub_1C2EECCC4(_QWORD *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_1C2EEB2E0(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = (id)MEMORY[0x1C3BCC3B0](a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  return sub_1C2EECD30;
}

void sub_1C2EECD30(id *a1)
{

}

unint64_t sub_1C2EECD38()
{
  unint64_t result;

  result = qword_1EF7D3A28;
  if (!qword_1EF7D3A28)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for DeviceResolutionService.XPCError, &type metadata for DeviceResolutionService.XPCError);
    atomic_store(result, (unint64_t *)&qword_1EF7D3A28);
  }
  return result;
}

uint64_t sub_1C2EECD74()
{
  OUTLINED_FUNCTION_31_1();
  return swift_deallocObject();
}

void sub_1C2EECD94()
{
  sub_1C2EDE498();
}

void sub_1C2EECDCC()
{
  sub_1C2EDE498();
}

void sub_1C2EECE04()
{
  uint64_t v0;

  sub_1C2EDE6EC(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1C2EECE1C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C2EECE40()
{
  OUTLINED_FUNCTION_80_0();
  OUTLINED_FUNCTION_93();
  swift_release();
  OUTLINED_FUNCTION_84_0();
  return swift_deallocObject();
}

uint64_t sub_1C2EECE64(uint64_t a1)
{
  uint64_t v1;

  return sub_1C2EE6EFC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(uint8_t **)(v1 + 40));
}

void sub_1C2EECE70(unint64_t *a1, unint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = sub_1C2ED4708(255, a2);
    atomic_store(MEMORY[0x1C3BCCAC4](MEMORY[0x1E0DEFCF8], v3), a1);
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EECEAC()
{
  OUTLINED_FUNCTION_80_0();
  OUTLINED_FUNCTION_82_0();
  return swift_deallocObject();
}

uint64_t sub_1C2EECEC4(uint64_t a1)
{
  uint64_t v1;

  return sub_1C2EE660C(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_1C2EECECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2EECF14(void *a1)
{
  uint64_t v1;

  return sub_1C2EE5DC8(a1, *(uint64_t (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1C2EECF1C()
{
  OUTLINED_FUNCTION_80_0();
  OUTLINED_FUNCTION_84_0();
  return swift_deallocObject();
}

uint64_t sub_1C2EECF34(unint64_t a1)
{
  uint64_t v1;

  return sub_1C2EE6008(a1, *(void (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_1C2EECF40()
{
  return objectdestroy_131Tm(&qword_1EF7D3AB0);
}

uint64_t sub_1C2EECF4C()
{
  return sub_1C2EED0E0(&qword_1EF7D3AB0);
}

uint64_t sub_1C2EECF60()
{
  return objectdestroy_137Tm(&qword_1EF7D3AB0);
}

uint64_t sub_1C2EECF6C()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AB0);
  v0 = OUTLINED_FUNCTION_66_0();
  return sub_1C2EE5230(v0);
}

uint64_t sub_1C2EECF98()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AB8);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_21_1();
  return OUTLINED_FUNCTION_0_8();
}

uint64_t sub_1C2EECFDC()
{
  return sub_1C2EED310(&qword_1EF7D3AB8);
}

uint64_t sub_1C2EECFF0()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AB8);
  OUTLINED_FUNCTION_42_1(*(_QWORD *)(v0 - 8));
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_1C2EED044(unint64_t a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AB8);
  OUTLINED_FUNCTION_107();
  return sub_1C2EE4A64(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1C2EED07C()
{
  return objectdestroy_131Tm((uint64_t *)&unk_1EF7D3AC0);
}

uint64_t objectdestroy_131Tm(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_12_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_21_1();
  return OUTLINED_FUNCTION_0_8();
}

uint64_t sub_1C2EED0CC()
{
  return sub_1C2EED0E0((uint64_t *)&unk_1EF7D3AC0);
}

uint64_t sub_1C2EED0E0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v4)(_QWORD, _QWORD, uint64_t);

  OUTLINED_FUNCTION_110(a1);
  OUTLINED_FUNCTION_107();
  return v4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v1 + v2);
}

uint64_t sub_1C2EED10C()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3AC0);
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_42_1(v0);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_83_0();
  return OUTLINED_FUNCTION_0_8();
}

uint64_t sub_1C2EED15C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3AC0);
  OUTLINED_FUNCTION_49_1();
  return sub_1C2EE3B94(a1, v1 + v4, *(_QWORD *)(v1 + (v3 & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + (((v3 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_1C2EED1A4()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3AD0);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_21_1();
  return OUTLINED_FUNCTION_0_8();
}

uint64_t sub_1C2EED1F0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7D3AD0) - 8)
                          + 80);
  return sub_1C2EE16DC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(unsigned __int8 *)(v0 + 40), v0 + ((v1 + 41) & ~v1));
}

uint64_t sub_1C2EED22C()
{
  return objectdestroy_137Tm((uint64_t *)&unk_1EF7D3AD0);
}

void sub_1C2EED238(uint64_t a1)
{
  sub_1C2EED244(a1, (uint64_t *)&unk_1EF7D3AD0);
}

void sub_1C2EED244(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_98(a1, a2);
  sub_1C2EE1E18();
}

uint64_t sub_1C2EED290()
{
  return objectdestroy_181Tm((uint64_t *)&unk_1EF7D3AD0);
}

uint64_t sub_1C2EED29C(uint64_t a1)
{
  return sub_1C2EED3C0(a1, (uint64_t *)&unk_1EF7D3AD0, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_1C2EE1FFC);
}

uint64_t sub_1C2EED2B0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3AE0);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_21_1();
  return OUTLINED_FUNCTION_0_8();
}

uint64_t sub_1C2EED2FC()
{
  return sub_1C2EED310(&qword_1EF7D3AE0);
}

uint64_t sub_1C2EED310(uint64_t *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t (*v4)(_QWORD, _QWORD, _QWORD, char *);

  v2 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_110(a1) - 8) + 80);
  return v4(*((_QWORD *)v1 + 2), *((_QWORD *)v1 + 3), *((_QWORD *)v1 + 4), &v1[(v2 + 40) & ~v2]);
}

uint64_t sub_1C2EED34C()
{
  return objectdestroy_137Tm(&qword_1EF7D3AE0);
}

void sub_1C2EED358(uint64_t a1)
{
  sub_1C2EED244(a1, &qword_1EF7D3AE0);
}

uint64_t sub_1C2EED364()
{
  return objectdestroy_181Tm(&qword_1EF7D3AE0);
}

uint64_t objectdestroy_181Tm(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_21_1();
  return OUTLINED_FUNCTION_0_8();
}

uint64_t sub_1C2EED3AC(uint64_t a1)
{
  return sub_1C2EED3C0(a1, &qword_1EF7D3AE0, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_1C2EE098C);
}

uint64_t sub_1C2EED3C0(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, _QWORD, uint64_t))
{
  uint64_t v3;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_98(a1, a2) - 8) + 80);
  return a3(a1, *(_QWORD *)(v3 + 16), v3 + ((v5 + 24) & ~v5));
}

void sub_1C2EED40C()
{
  sub_1C2EDF9B8();
}

uint64_t sub_1C2EED444()
{
  return objectdestroy_207Tm(&qword_1EF7D3B08);
}

uint64_t sub_1C2EED450()
{
  return sub_1C2EED730(&qword_1EF7D3B08);
}

void sub_1C2EED464(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_100();
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EED498()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B08);
  v2 = (*(_QWORD *)(*(_QWORD *)(v1 - 8) + 64)
      + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80))
      + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_8_4();

  return swift_deallocObject();
}

uint64_t sub_1C2EED520(unsigned __int8 a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B08) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_1C2EE839C(a1, *(_QWORD *)(v1 + 16), v1 + v4, *(char **)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

BOOL sub_1C2EED578()
{
  return sub_1C2EE8A10();
}

uint64_t sub_1C2EED580()
{
  OUTLINED_FUNCTION_31_1();
  OUTLINED_FUNCTION_80_0();
  OUTLINED_FUNCTION_82_0();
  return swift_deallocObject();
}

uint64_t sub_1C2EED59C()
{
  uint64_t v0;

  return sub_1C2EE8AC0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

BOOL sub_1C2EED5A4()
{
  return sub_1C2EE8CA4();
}

uint64_t sub_1C2EED5AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B08);
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_42_1(v2);

  OUTLINED_FUNCTION_83_0();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_1C2EED5E8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B08);
  OUTLINED_FUNCTION_49_1();
  return sub_1C2EE8720(a1, v1 + v4, *(_QWORD *)(v1 + (v3 & 0xFFFFFFFFFFFFF8)));
}

unint64_t sub_1C2EED624()
{
  unint64_t result;

  result = qword_1EF7D3B90;
  if (!qword_1EF7D3B90)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for DeviceResolutionService.HomeManagerError, &type metadata for DeviceResolutionService.HomeManagerError);
    atomic_store(result, (unint64_t *)&qword_1EF7D3B90);
  }
  return result;
}

uint64_t sub_1C2EED660()
{
  return objectdestroy_207Tm(&qword_1EF7D3B98);
}

uint64_t sub_1C2EED66C()
{
  return sub_1C2EED730(&qword_1EF7D3B98);
}

uint64_t sub_1C2EED680()
{
  return objectdestroy_137Tm(&qword_1EF7D3B98);
}

void sub_1C2EED68C(uint64_t a1)
{
  sub_1C2EED244(a1, &qword_1EF7D3B98);
}

uint64_t sub_1C2EED698()
{
  return objectdestroy_137Tm(&qword_1EF7D3B98);
}

void sub_1C2EED6A8()
{
  void *v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3B98);
  v0 = (void *)OUTLINED_FUNCTION_66_0();
  sub_1C2EDFF58(v0);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EED6D4()
{
  return objectdestroy_207Tm(&qword_1EF7D3B98);
}

uint64_t objectdestroy_207Tm(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_21_1();
  return OUTLINED_FUNCTION_0_8();
}

uint64_t sub_1C2EED71C()
{
  return sub_1C2EED730(&qword_1EF7D3B98);
}

uint64_t sub_1C2EED730(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t);

  OUTLINED_FUNCTION_110(a1);
  v1 = OUTLINED_FUNCTION_65();
  return v3(v1);
}

uint64_t sub_1C2EED754()
{
  return objectdestroy_137Tm(&qword_1EF7D3B98);
}

uint64_t sub_1C2EED760()
{
  return objectdestroy_137Tm(&qword_1EF7D3B98);
}

uint64_t objectdestroy_137Tm(uint64_t *a1)
{
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_42_1(*(_QWORD *)(v1 - 8));
  return OUTLINED_FUNCTION_24_1();
}

void sub_1C2EED7B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_98(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EED7EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C2EED85C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF7D3BA0 + dword_1EF7D3BA0))(a1, v4);
}

uint64_t sub_1C2EED85C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_6();
  return OUTLINED_FUNCTION_4_6(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1C2EED880(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D39E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_4_6(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return sub_1C2EF7944();
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1 + v3, v0);
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_12_2()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_16_2()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 48) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_23_1(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t OUTLINED_FUNCTION_29_0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v2 - 8) = *v1;
  *(_QWORD *)(v3 + 48) = a1;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_31_1()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_34_1()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 72) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 56) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  return sub_1C2EF76B0();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_42_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v2 + v1);
}

void OUTLINED_FUNCTION_43_1(id a1)
{

}

void OUTLINED_FUNCTION_46_1(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 + a2);
  *(_QWORD *)(v2 + a2) = a1;

}

void OUTLINED_FUNCTION_51_1(_QWORD *a1)
{
  uint64_t *v1;

  sub_1C2EED464(a1, v1);
}

uint64_t OUTLINED_FUNCTION_52_0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_53_0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_54_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_55_1()
{
  return sub_1C2EE778C();
}

void *OUTLINED_FUNCTION_60_0()
{
  uint64_t v0;

  return _Block_copy((const void *)(v0 - 128));
}

uint64_t OUTLINED_FUNCTION_61_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_62_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_64_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, a1, v2);
}

uint64_t OUTLINED_FUNCTION_65()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_66_0()
{
  uint64_t v0;

  return v0;
}

int8x16_t OUTLINED_FUNCTION_67_0(int8x16_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  int8x16_t result;

  *(_QWORD *)(v2 + 56) = a1;
  result = vextq_s8(*(int8x16_t *)(v2 + 24), *(int8x16_t *)(v2 + 24), 8uLL);
  a1[1] = result;
  a1[2].i64[0] = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_68_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_71_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_73_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_76_0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_QWORD *)(result + 16) = v1;
  return result;
}

BOOL OUTLINED_FUNCTION_77_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_78_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_79_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_80_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_82_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_83_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_84_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_85()
{
  void *v0;

}

void OUTLINED_FUNCTION_89(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_90_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = a1;
  return v1 - 128;
}

uint64_t OUTLINED_FUNCTION_91()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_92(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C2ED1D08(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_93()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_94()
{
  return sub_1C2EF7974();
}

uint64_t OUTLINED_FUNCTION_96(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return sub_1C2EF74E8();
}

uint64_t OUTLINED_FUNCTION_98(uint64_t a1, uint64_t *a2)
{
  return __swift_instantiateConcreteTypeFromMangledName(a2);
}

uint64_t OUTLINED_FUNCTION_99()
{
  return sub_1C2EF74D0();
}

void OUTLINED_FUNCTION_100()
{
  JUMPOUT(0x1C3BCCAC4);
}

uint64_t OUTLINED_FUNCTION_101()
{
  return sub_1C2EF74D0();
}

id OUTLINED_FUNCTION_102()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(*(_QWORD *)(v0 + 48) + 8 * v1);
}

void OUTLINED_FUNCTION_103()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_105()
{
  return 0;
}

void OUTLINED_FUNCTION_106()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_109()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_110(uint64_t *a1)
{
  return __swift_instantiateConcreteTypeFromMangledName(a1);
}

uint64_t OUTLINED_FUNCTION_114()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_116()
{
  return swift_task_dealloc();
}

uint64_t sub_1C2EEDF14()
{
  uint64_t result;

  sub_1C2EEE048();
  result = sub_1C2EF7650();
  qword_1EF7D6030 = result;
  return result;
}

uint64_t sub_1C2EEDF7C()
{
  uint64_t result;

  sub_1C2EEE048();
  result = sub_1C2EF7650();
  qword_1EF7D6038 = result;
  return result;
}

uint64_t sub_1C2EEDFE4(uint64_t a1)
{
  return sub_1C2EEE0A8(a1, qword_1EF7D6040, &qword_1EF7D29E0, (id *)&qword_1EF7D6030);
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

unint64_t sub_1C2EEE048()
{
  unint64_t result;

  result = qword_1EF7D3C80;
  if (!qword_1EF7D3C80)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF7D3C80);
  }
  return result;
}

uint64_t sub_1C2EEE084(uint64_t a1)
{
  return sub_1C2EEE0A8(a1, qword_1EF7D6058, &qword_1EF7D29E8, (id *)&qword_1EF7D6038);
}

uint64_t sub_1C2EEE0A8(uint64_t a1, uint64_t *a2, _QWORD *a3, id *a4)
{
  uint64_t v7;
  id v8;

  v7 = sub_1C2EF7350();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1)
    swift_once();
  v8 = *a4;
  return sub_1C2EF735C();
}

uint64_t sub_1C2EEE130(unint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v17;

  if (a1 >> 62)
    goto LABEL_30;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1C2EF7884())
  {
    v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1C3BCC3B0](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        v15 = a2;
        goto LABEL_24;
      }
      v10 = sub_1C2EF744C();
      v11 = sub_1C2EF3E58(v10, v8, v9);
      MEMORY[0x1C3BCC080](v11);
      swift_bridgeObjectRelease();
      v12 = sub_1C2EF78C0();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(_QWORD *)(*(_QWORD *)&a2[v17] + 16))
        goto LABEL_23;
      swift_bridgeObjectRetain();
      sub_1C2EC907C(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      v14 = sub_1C2ED4DC8((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3)
        goto LABEL_31;
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

void AssistantEnabledCapability.__allocating_init(status:)(uint64_t a1)
{
  OUTLINED_FUNCTION_14();
  AssistantEnabledCapability.init(status:)(a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EEE4A4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EEE4F4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_key);
  OUTLINED_FUNCTION_8();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2EEE5A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_key);
  OUTLINED_FUNCTION_8();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EEE5F8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C2EEE5A0(v1, v2);
}

uint64_t (*sub_1C2EEE634())()
{
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

id AssistantEnabledCapability.init(status:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t inited;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for AssistantEnabledCapability();
  v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(inited + 32) = 0xD000000000000029;
  *(_QWORD *)(inited + 40) = 0x80000001C2EFC130;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_7());
  v7 = v5;
  *(_QWORD *)(inited + 48) = sub_1C2ED4C54(a1);
  v8 = sub_1C2EF73E0();
  sub_1C2EC93D8(v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C2EC9BD4(9, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for AssistantEnabledCapability()
{
  return objc_opt_self();
}

void sub_1C2EEE84C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap);
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_3_1();
  sub_1C2EC9CFC(v2, v3, v1);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    OUTLINED_FUNCTION_7();
    swift_dynamicCastClass();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1C2EEE8D8(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_3_1();
  sub_1C2ED4CA8(v2, v3, a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EEE924(unint64_t a1)
{
  void *v1;

  return sub_1C2EEE130(a1, (char *)v1) & 1;
}

uint64_t static AssistantEnabledCapability.supportsSecureCoding.getter()
{
  return 1;
}

void AssistantEnabledCapability.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  AssistantEnabledCapability.init(coder:)(a1);
  OUTLINED_FUNCTION_5();
}

char *AssistantEnabledCapability.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AssistantEnabledCapability();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C2ECA78C((uint64_t)a1);

  if (!*(_QWORD *)(*(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id AssistantEnabledCapability.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_14(), sel_init);
}

void AssistantEnabledCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AssistantEnabledCapability.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssistantEnabledCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2EEEC18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2EEE4F4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for AssistantEnabledCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssistantEnabledCapability.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.key.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.key.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.__allocating_init(status:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.supportsAssistantEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static AssistantEnabledCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.matches(descriptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of AssistantEnabledCapability.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t static DeviceSelectionIntent.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t sub_1C2EEED20(unint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v17;
  void *v19;

  if (a1 >> 62)
    goto LABEL_30;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1C2EF7884())
  {
    v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1C3BCC3B0](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        v15 = a2;
        goto LABEL_24;
      }
      v19 = v6;
      v10 = sub_1C2EF744C();
      v11 = sub_1C2EF3E58(v10, v9, v8);
      MEMORY[0x1C3BCC080](v11);
      swift_bridgeObjectRelease();
      v12 = sub_1C2EF78C0();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(_QWORD *)(*(_QWORD *)&a2[v17] + 16))
        goto LABEL_23;
      swift_bridgeObjectRetain();
      sub_1C2EC907C(v9, v8);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v15 = v19;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      v14 = sub_1C2ED4DC8((uint64_t)v19);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3)
        goto LABEL_31;
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

void MUXCapability.__allocating_init(status:)(uint64_t a1)
{
  OUTLINED_FUNCTION_14();
  MUXCapability.init(status:)(a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EEF0AC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EEF0FC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_key);
  OUTLINED_FUNCTION_8();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2EEF1A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_key);
  OUTLINED_FUNCTION_8();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EEF200(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C2EEF1A8(v1, v2);
}

uint64_t (*sub_1C2EEF23C())()
{
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

id MUXCapability.init(status:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t inited;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for MUXCapability();
  v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(inited + 32) = 0xD00000000000001CLL;
  *(_QWORD *)(inited + 40) = 0x80000001C2EFC250;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_7());
  v7 = v5;
  *(_QWORD *)(inited + 48) = sub_1C2ED4C54(a1);
  v8 = sub_1C2EF73E0();
  sub_1C2EC93D8(v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C2EC9BAC(8, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for MUXCapability()
{
  return objc_opt_self();
}

void sub_1C2EEF454()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap);
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_5_7();
  sub_1C2EC9CFC(v2, v3, v1);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    OUTLINED_FUNCTION_7();
    swift_dynamicCastClass();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1C2EEF4E0(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_5_7();
  sub_1C2ED4CA8(v2, v3, a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EEF52C(unint64_t a1)
{
  void *v1;

  return sub_1C2EEED20(a1, (char *)v1) & 1;
}

uint64_t static MUXCapability.supportsSecureCoding.getter()
{
  return 1;
}

void MUXCapability.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  MUXCapability.init(coder:)(a1);
  OUTLINED_FUNCTION_5();
}

char *MUXCapability.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for MUXCapability();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C2ECA7A0((uint64_t)a1);

  if (!*(_QWORD *)(*(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution13MUXCapability_primitivesMap] + 16))
  {

    return 0;
  }
  return v5;
}

id MUXCapability.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_14(), sel_init);
}

void MUXCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MUXCapability.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MUXCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2EEF820@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2EEF0FC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for MUXCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MUXCapability.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of MUXCapability.key.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of MUXCapability.key.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of MUXCapability.__allocating_init(status:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of MUXCapability.supportsMUX.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static MUXCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of MUXCapability.matches(descriptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of MUXCapability.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of MUXCapability.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_5_7()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_1C2EEF92C(unint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v17;

  if (a1 >> 62)
    goto LABEL_30;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1C2EF7884())
  {
    v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1C3BCC3B0](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        v15 = a2;
        goto LABEL_24;
      }
      v10 = sub_1C2EF744C();
      v11 = sub_1C2EF3E58(v10, v8, v9);
      MEMORY[0x1C3BCC080](v11);
      swift_bridgeObjectRelease();
      v12 = sub_1C2EF78C0();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(_QWORD *)(*(_QWORD *)&a2[v17] + 16))
        goto LABEL_23;
      swift_bridgeObjectRetain();
      sub_1C2EC907C(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      v14 = sub_1C2ED4DC8((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3)
        goto LABEL_31;
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

void AppLaunchCapability.__allocating_init(status:)(uint64_t a1)
{
  OUTLINED_FUNCTION_14();
  AppLaunchCapability.init(status:)(a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EEFCA0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EEFCF0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_key);
  OUTLINED_FUNCTION_8();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2EEFD9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_key);
  OUTLINED_FUNCTION_8();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EEFDF4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C2EEFD9C(v1, v2);
}

uint64_t (*sub_1C2EEFE30())()
{
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

id AppLaunchCapability.init(status:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t inited;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for AppLaunchCapability();
  v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(inited + 32) = 0xD000000000000022;
  *(_QWORD *)(inited + 40) = 0x80000001C2EFC2E0;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_7());
  v7 = v5;
  *(_QWORD *)(inited + 48) = sub_1C2ED4C54(a1);
  v8 = sub_1C2EF73E0();
  sub_1C2EC93D8(v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C2EC9B84(2, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for AppLaunchCapability()
{
  return objc_opt_self();
}

void sub_1C2EF0048()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap);
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_5_8();
  sub_1C2EC9CFC(v2, v3, v1);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    OUTLINED_FUNCTION_7();
    swift_dynamicCastClass();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1C2EF00D4(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_5_8();
  sub_1C2ED4CA8(v2, v3, a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EF0120(unint64_t a1)
{
  void *v1;

  return sub_1C2EEF92C(a1, (char *)v1) & 1;
}

uint64_t static AppLaunchCapability.supportsSecureCoding.getter()
{
  return 1;
}

void AppLaunchCapability.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  AppLaunchCapability.init(coder:)(a1);
  OUTLINED_FUNCTION_5();
}

char *AppLaunchCapability.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AppLaunchCapability();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C2ECA7B4((uint64_t)a1);

  if (!*(_QWORD *)(*(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution19AppLaunchCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id AppLaunchCapability.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_14(), sel_init);
}

void AppLaunchCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AppLaunchCapability.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppLaunchCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2EF0414@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2EEFCF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for AppLaunchCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppLaunchCapability.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AppLaunchCapability.key.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AppLaunchCapability.key.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AppLaunchCapability.__allocating_init(status:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of AppLaunchCapability.supportsAppLaunch.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static AppLaunchCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AppLaunchCapability.matches(descriptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AppLaunchCapability.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AppLaunchCapability.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_5_8()
{
  return 0xD000000000000022;
}

uint64_t sub_1C2EF0520(unint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v17;

  if (a1 >> 62)
    goto LABEL_30;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1C2EF7884())
  {
    v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1C3BCC3B0](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        v15 = a2;
        goto LABEL_24;
      }
      v10 = sub_1C2EF744C();
      v11 = sub_1C2EF3E58(v10, v8, v9);
      MEMORY[0x1C3BCC080](v11);
      swift_bridgeObjectRelease();
      v12 = sub_1C2EF78C0();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(_QWORD *)(*(_QWORD *)&a2[v17] + 16))
        goto LABEL_23;
      swift_bridgeObjectRetain();
      sub_1C2EC907C(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      v14 = sub_1C2ED4DC8((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3)
        goto LABEL_31;
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

void CustomTimerIntentHandlingCapability.__allocating_init(status:)(uint64_t a1)
{
  OUTLINED_FUNCTION_14();
  CustomTimerIntentHandlingCapability.init(status:)(a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EF0894(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EF08E4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_key);
  OUTLINED_FUNCTION_8();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2EF0990(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_key);
  OUTLINED_FUNCTION_8();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EF09E8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C2EF0990(v1, v2);
}

uint64_t (*sub_1C2EF0A24())()
{
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

id CustomTimerIntentHandlingCapability.init(status:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t inited;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for CustomTimerIntentHandlingCapability();
  v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(inited + 32) = 0xD000000000000028;
  *(_QWORD *)(inited + 40) = 0x80000001C2EFC3C0;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_7());
  v7 = v5;
  *(_QWORD *)(inited + 48) = sub_1C2ED4C54(a1);
  v8 = sub_1C2EF73E0();
  sub_1C2EC93D8(v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C2EC9BC0(10, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for CustomTimerIntentHandlingCapability()
{
  return objc_opt_self();
}

void sub_1C2EF0C3C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap);
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_5_9();
  sub_1C2EC9CFC(v2, v3, v1);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    OUTLINED_FUNCTION_7();
    swift_dynamicCastClass();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1C2EF0CC8(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_5_9();
  sub_1C2ED4CA8(v2, v3, a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EF0D14(unint64_t a1)
{
  void *v1;

  return sub_1C2EF0520(a1, (char *)v1) & 1;
}

uint64_t static CustomTimerIntentHandlingCapability.supportsSecureCoding.getter()
{
  return 1;
}

void CustomTimerIntentHandlingCapability.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  CustomTimerIntentHandlingCapability.init(coder:)(a1);
  OUTLINED_FUNCTION_5();
}

char *CustomTimerIntentHandlingCapability.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for CustomTimerIntentHandlingCapability();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C2ECA7C8((uint64_t)a1);

  if (!*(_QWORD *)(*(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id CustomTimerIntentHandlingCapability.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_14(), sel_init);
}

void CustomTimerIntentHandlingCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CustomTimerIntentHandlingCapability.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CustomTimerIntentHandlingCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2EF1008@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2EF08E4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for CustomTimerIntentHandlingCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.key.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.key.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.__allocating_init(status:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.supportsCustomTimerIntentHandling.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static CustomTimerIntentHandlingCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.matches(descriptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CustomTimerIntentHandlingCapability.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_5_9()
{
  return 0xD000000000000028;
}

uint64_t sub_1C2EF1114(unint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v17;

  if (a1 >> 62)
    goto LABEL_30;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1C2EF7884())
  {
    v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1C3BCC3B0](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        v15 = a2;
        goto LABEL_24;
      }
      v10 = sub_1C2EF744C();
      v11 = sub_1C2EF3E58(v10, v8, v9);
      MEMORY[0x1C3BCC080](v11);
      swift_bridgeObjectRelease();
      v12 = sub_1C2EF78C0();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(_QWORD *)(*(_QWORD *)&a2[v17] + 16))
        goto LABEL_23;
      swift_bridgeObjectRetain();
      sub_1C2EC907C(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      v14 = sub_1C2ED4DC8((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3)
        goto LABEL_31;
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

void VideoPlaybackCapability.__allocating_init(status:)(uint64_t a1)
{
  OUTLINED_FUNCTION_14();
  VideoPlaybackCapability.init(status:)(a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EF1488(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EF14D8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_key);
  OUTLINED_FUNCTION_8();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2EF1584(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_key);
  OUTLINED_FUNCTION_8();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EF15DC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C2EF1584(v1, v2);
}

uint64_t (*sub_1C2EF1618())()
{
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

id VideoPlaybackCapability.init(status:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t inited;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for VideoPlaybackCapability();
  v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(inited + 32) = 0xD000000000000026;
  *(_QWORD *)(inited + 40) = 0x80000001C2EFC4D0;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_7());
  v7 = v5;
  *(_QWORD *)(inited + 48) = sub_1C2ED4C54(a1);
  v8 = sub_1C2EF73E0();
  sub_1C2EC93D8(v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C2EC9B70(1, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for VideoPlaybackCapability()
{
  return objc_opt_self();
}

void sub_1C2EF1830()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap);
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_3_2();
  sub_1C2EC9CFC(v2, v3, v1);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    OUTLINED_FUNCTION_7();
    swift_dynamicCastClass();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1C2EF18BC(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_3_2();
  sub_1C2ED4CA8(v2, v3, a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EF1908(unint64_t a1)
{
  void *v1;

  return sub_1C2EF1114(a1, (char *)v1) & 1;
}

uint64_t static VideoPlaybackCapability.supportsSecureCoding.getter()
{
  return 1;
}

void VideoPlaybackCapability.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_14();
  VideoPlaybackCapability.init(coder:)(a1);
  OUTLINED_FUNCTION_5();
}

char *VideoPlaybackCapability.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for VideoPlaybackCapability();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C2ECA7DC((uint64_t)a1);

  if (!*(_QWORD *)(*(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id VideoPlaybackCapability.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_14(), sel_init);
}

void VideoPlaybackCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id VideoPlaybackCapability.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoPlaybackCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2EF1BFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2EF14D8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for VideoPlaybackCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of VideoPlaybackCapability.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.key.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.key.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.__allocating_init(status:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.supportsVideoPlayback.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static VideoPlaybackCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.matches(descriptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of VideoPlaybackCapability.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

BOOL sub_1C2EF1CF4(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1C2EF1D00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = CapabilityKey.rawValue.getter();
  v2 = v1;
  if (v0 == CapabilityKey.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1C2EF7938();
  OUTLINED_FUNCTION_9();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1C2EF1D90@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_1C2EF1DE4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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

  v1 = *v0;
  v15 = MEMORY[0x1E0DEE9E8];
  if ((*v0 & 1) != 0)
  {
    v6 = sub_1C2EF741C();
    OUTLINED_FUNCTION_0_9(v6, v7, v8);
    OUTLINED_FUNCTION_1_10();
    if ((v1 & 2) == 0)
    {
LABEL_3:
      if ((v1 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      v12 = sub_1C2EF741C();
      OUTLINED_FUNCTION_0_9(v12, v13, v14);
      OUTLINED_FUNCTION_1_10();
      if ((v1 & 8) == 0)
        return v15;
      goto LABEL_5;
    }
  }
  else if ((v1 & 2) == 0)
  {
    goto LABEL_3;
  }
  v9 = sub_1C2EF741C();
  OUTLINED_FUNCTION_0_9(v9, v10, v11);
  OUTLINED_FUNCTION_1_10();
  if ((v1 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v1 & 8) != 0)
  {
LABEL_5:
    v2 = sub_1C2EF741C();
    OUTLINED_FUNCTION_0_9(v2, v3, v4);
    OUTLINED_FUNCTION_1_10();
  }
  return v15;
}

uint64_t DeviceUnitCategory.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

SiriVirtualDeviceResolution::DeviceUnitCategory __swiftcall DeviceUnitCategory.init(rawValue:)(SiriVirtualDeviceResolution::DeviceUnitCategory rawValue)
{
  SiriVirtualDeviceResolution::DeviceUnitCategory *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void *sub_1C2EF1EA8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3DE8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EFA9E0;
  *(_QWORD *)(inited + 32) = sub_1C2EF741C();
  *(_QWORD *)(inited + 40) = v1;
  *(_QWORD *)(inited + 48) = 4;
  *(_QWORD *)(inited + 56) = sub_1C2EF741C();
  *(_QWORD *)(inited + 64) = v2;
  *(_QWORD *)(inited + 72) = 1;
  *(_QWORD *)(inited + 80) = sub_1C2EF741C();
  *(_QWORD *)(inited + 88) = v3;
  *(_QWORD *)(inited + 96) = 2;
  *(_QWORD *)(inited + 104) = sub_1C2EF741C();
  *(_QWORD *)(inited + 112) = v4;
  *(_QWORD *)(inited + 120) = 8;
  result = (void *)sub_1C2EF73E0();
  off_1EF7D3D98 = result;
  return result;
}

SiriVirtualDeviceResolution::DeviceUnitCategory_optional __swiftcall DeviceUnitCategory.init(homeAccessoryType:)(Swift::String homeAccessoryType)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  Swift::Int v10;
  Swift::Bool v11;
  SiriVirtualDeviceResolution::DeviceUnitCategory_optional result;

  object = homeAccessoryType._object;
  countAndFlagsBits = homeAccessoryType._countAndFlagsBits;
  v4 = v1;
  if (qword_1EF7D2A00 != -1)
    swift_once();
  v5 = off_1EF7D3D98;
  if (*((_QWORD *)off_1EF7D3D98 + 2) && (v6 = sub_1C2EC907C(countAndFlagsBits, (uint64_t)object), (v7 & 1) != 0))
  {
    v8 = 0;
    v9 = *(_QWORD *)(v5[7] + 8 * v6);
  }
  else
  {
    v9 = 0;
    v8 = 1;
  }
  v10 = swift_bridgeObjectRelease();
  *(_QWORD *)v4 = v9;
  *(_BYTE *)(v4 + 8) = v8;
  result.value.rawValue = v10;
  result.is_nil = v11;
  return result;
}

void static DeviceUnitCategory.unspecified.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static DeviceUnitCategory.homepod.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_8(a1);
}

void static DeviceUnitCategory.otherSpeaker.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_8(a1);
}

void static DeviceUnitCategory.appleTV.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_8(a1);
}

void static DeviceUnitCategory.otherTV.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_2_8(a1);
}

void *sub_1C2EF2048()
{
  void *result;

  sub_1C2EF3B4C();
  result = (void *)sub_1C2EF73E0();
  off_1EF7D3DA0 = result;
  return result;
}

uint64_t DeviceUnitCategory.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v1 = *v0;
  v20 = MEMORY[0x1E0DEE9E8];
  if (qword_1EF7D2A08 != -1)
LABEL_28:
    swift_once();
  v2 = off_1EF7D3DA0;
  v3 = (char *)off_1EF7D3DA0 + 64;
  v4 = 1 << *((_BYTE *)off_1EF7D3DA0 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *((_QWORD *)off_1EF7D3DA0 + 8);
  v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  v8 = 0;
  while (v6)
  {
    v9 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v10 = v9 | (v8 << 6);
LABEL_21:
    if ((*(_QWORD *)(v2[6] + 8 * v10) & ~v1) == 0)
    {
      v14 = (uint64_t *)(v2[7] + 16 * v10);
      v16 = *v14;
      v15 = v14[1];
      swift_bridgeObjectRetain();
      sub_1C2EF2548(&v18, v16, v15);
      OUTLINED_FUNCTION_1_10();
    }
  }
  v11 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v11 >= v7)
    goto LABEL_23;
  v12 = *(_QWORD *)&v3[8 * v11];
  ++v8;
  if (v12)
    goto LABEL_20;
  v8 = v11 + 1;
  if (v11 + 1 >= v7)
    goto LABEL_23;
  v12 = *(_QWORD *)&v3[8 * v8];
  if (v12)
    goto LABEL_20;
  v8 = v11 + 2;
  if (v11 + 2 >= v7)
    goto LABEL_23;
  v12 = *(_QWORD *)&v3[8 * v8];
  if (v12)
  {
LABEL_20:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
    goto LABEL_21;
  }
  v13 = v11 + 3;
  if (v13 < v7)
  {
    v12 = *(_QWORD *)&v3[8 * v13];
    if (!v12)
    {
      while (1)
      {
        v8 = v13 + 1;
        if (__OFADD__(v13, 1))
          goto LABEL_27;
        if (v8 >= v7)
          goto LABEL_23;
        v12 = *(_QWORD *)&v3[8 * v8];
        ++v13;
        if (v12)
          goto LABEL_20;
      }
    }
    v8 = v13;
    goto LABEL_20;
  }
LABEL_23:
  swift_release();
  v18 = 0;
  v19 = 0xE000000000000000;
  sub_1C2EF774C();
  OUTLINED_FUNCTION_1_10();
  v18 = 0xD000000000000015;
  v19 = 0x80000001C2EFC5C0;
  if (*(_QWORD *)(v20 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3DA8);
    sub_1C2EF26F4();
    sub_1C2EDB924();
    sub_1C2EF7494();
  }
  OUTLINED_FUNCTION_9();
  sub_1C2EF7464();
  swift_bridgeObjectRelease();
  sub_1C2EF7464();
  return v18;
}

SiriVirtualDeviceResolution::DeviceUnitCategory sub_1C2EF2304(Swift::Int *a1)
{
  return DeviceUnitCategory.init(rawValue:)(*a1);
}

void sub_1C2EF2314(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1C2EF231C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1C2EF2328(*a1, *v2, a2);
}

uint64_t sub_1C2EF2328@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t sub_1C2EF2334@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1C2EF2340(*a1, *v2, a2);
}

uint64_t sub_1C2EF2340@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_1C2EF234C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1C2EF2358(*a1, *v2, a2);
}

uint64_t sub_1C2EF2358@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

BOOL sub_1C2EF2364(_QWORD *a1, uint64_t *a2)
{
  return sub_1C2EF236C(a1, *a2);
}

BOOL sub_1C2EF236C(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1C2EF2398@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C2EF23A0(*a1, a2);
}

uint64_t sub_1C2EF23A0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & result;
  if (v3)
    *v2 &= ~result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t sub_1C2EF23C8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C2EF23D0(*a1, a2);
}

uint64_t sub_1C2EF23D0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  *v2 |= result;
  v4 = v3 & result;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t sub_1C2EF23F0(uint64_t *a1)
{
  return sub_1C2EF23F8(*a1);
}

uint64_t sub_1C2EF23F8(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

uint64_t sub_1C2EF2408(uint64_t *a1)
{
  return sub_1C2EF2410(*a1);
}

uint64_t sub_1C2EF2410(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

uint64_t sub_1C2EF2420(uint64_t *a1)
{
  return sub_1C2EF2428(*a1);
}

uint64_t sub_1C2EF2428(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

uint64_t sub_1C2EF2438@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1C2EF2444(*a1, *v2, a2);
}

uint64_t sub_1C2EF2444@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_1C2EF2450(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1C2EF245C(*a1, *v1);
}

BOOL sub_1C2EF245C(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1C2EF2468(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1C2EF2474(*a1, *v1);
}

BOOL sub_1C2EF2474(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1C2EF2480(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1C2EF248C(*a1, *v1);
}

BOOL sub_1C2EF248C(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1C2EF2498()
{
  uint64_t *v0;

  return sub_1C2EF24A0(*v0);
}

BOOL sub_1C2EF24A0(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1C2EF24AC()
{
  return sub_1C2EF76A4();
}

uint64_t sub_1C2EF24C4(uint64_t *a1)
{
  return sub_1C2EF24CC(*a1);
}

uint64_t sub_1C2EF24CC(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

SiriVirtualDeviceResolution::DeviceUnitCategory sub_1C2EF24DC@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  SiriVirtualDeviceResolution::DeviceUnitCategory result;

  result.rawValue = DeviceUnitCategory.init(rawValue:)(*a1).rawValue;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1C2EF2504@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = DeviceUnitCategory.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1C2EF252C(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_1C2EF2548(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_1C2EF79B0();
  swift_bridgeObjectRetain();
  sub_1C2EF7440();
  v8 = sub_1C2EF79E0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1C2EF7938() & 1) != 0)
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
      if (v19 || (sub_1C2EF7938() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1C2EF3240(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_1C2EF26F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF7D3DB0;
  if (!qword_1EF7D3DB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF7D3DA8);
    result = MEMORY[0x1C3BCCAC4](MEMORY[0x1E0DEB3D0], v1);
    atomic_store(result, (unint64_t *)&qword_1EF7D3DB0);
  }
  return result;
}

unint64_t sub_1C2EF273C()
{
  unint64_t result;

  result = qword_1EF7D3DB8;
  if (!qword_1EF7D3DB8)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for DeviceUnitCategory, &type metadata for DeviceUnitCategory);
    atomic_store(result, (unint64_t *)&qword_1EF7D3DB8);
  }
  return result;
}

unint64_t sub_1C2EF277C()
{
  unint64_t result;

  result = qword_1EF7D3DC0;
  if (!qword_1EF7D3DC0)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for DeviceUnitCategory, &type metadata for DeviceUnitCategory);
    atomic_store(result, (unint64_t *)&qword_1EF7D3DC0);
  }
  return result;
}

unint64_t sub_1C2EF27BC()
{
  unint64_t result;

  result = qword_1EF7D3DC8;
  if (!qword_1EF7D3DC8)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for DeviceUnitCategory, &type metadata for DeviceUnitCategory);
    atomic_store(result, (unint64_t *)&qword_1EF7D3DC8);
  }
  return result;
}

unint64_t sub_1C2EF27FC()
{
  unint64_t result;

  result = qword_1EF7D3DD0;
  if (!qword_1EF7D3DD0)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for DeviceUnitCategory, &type metadata for DeviceUnitCategory);
    atomic_store(result, (unint64_t *)&qword_1EF7D3DD0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeviceUnitCategory()
{
  return &type metadata for DeviceUnitCategory;
}

uint64_t sub_1C2EF2848(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  void *v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  void *v19;
  id v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char isUniquelyReferenced_nonNull_native;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = v2;
  v7 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v7 < 0)
      v8 = *v2;
    else
      v8 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v9 = a2;
    v10 = sub_1C2EF76EC();

    if (v10)
    {
      OUTLINED_FUNCTION_13_2();

      sub_1C2ED5590();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_1C2EF76E0();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v22 = sub_1C2EF2A7C(v8, result + 1);
    v28 = v22;
    if (*(_QWORD *)(v22 + 24) <= *(_QWORD *)(v22 + 16))
    {
      v26 = v9;
      sub_1C2EF2F28();
      v23 = v28;
    }
    else
    {
      v23 = v22;
      v24 = v9;
    }
    sub_1C2EF31C0((uint64_t)v9, v23);
    *v4 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_1C2EF7638();
    v12 = -1 << *(_BYTE *)(v7 + 32);
    v13 = v11 & ~v12;
    OUTLINED_FUNCTION_5_10();
    if ((v14 & 1) != 0)
    {
      sub_1C2ED5590();
      OUTLINED_FUNCTION_4_7();
      v15 = OUTLINED_FUNCTION_3_9();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        OUTLINED_FUNCTION_13_2();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        OUTLINED_FUNCTION_5_10();
        if ((v17 & 1) == 0)
          break;
        OUTLINED_FUNCTION_4_7();
        v18 = OUTLINED_FUNCTION_3_9();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    OUTLINED_FUNCTION_13_2();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v29 = *v2;
    *v2 = 0x8000000000000000;
    v9 = a2;
    sub_1C2EF33D8((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v9;
  return 1;
}

uint64_t sub_1C2EF2A7C(uint64_t a1, uint64_t a2)
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

  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E8];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D31F8);
  v2 = sub_1C2EF7734();
  v14 = v2;
  sub_1C2EF76D4();
  if (!sub_1C2EF76F8())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  sub_1C2ED5590();
  while (1)
  {
    swift_dynamicCast();
    v2 = v14;
    if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
    {
      sub_1C2EF2F28();
      v2 = v14;
    }
    result = sub_1C2EF7638();
    v4 = v2 + 56;
    v5 = -1 << *(_BYTE *)(v2 + 32);
    v6 = result & ~v5;
    v7 = v6 >> 6;
    if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) == 0)
      break;
    v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
    ++*(_QWORD *)(v2 + 16);
    if (!sub_1C2EF76F8())
      goto LABEL_16;
  }
  v9 = 0;
  v10 = (unint64_t)(63 - v5) >> 6;
  while (++v7 != v10 || (v9 & 1) == 0)
  {
    v11 = v7 == v10;
    if (v7 == v10)
      v7 = 0;
    v9 |= v11;
    v12 = *(_QWORD *)(v4 + 8 * v7);
    if (v12 != -1)
    {
      v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2EF2C50()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3DD8);
  v3 = sub_1C2EF7728();
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
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_1C2EF79B0();
      sub_1C2EF7440();
      result = sub_1C2EF79E0();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_1C2EF252C(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1C2EF2F28()
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
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D31F8);
  v3 = sub_1C2EF7728();
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
    if (!v8)
      goto LABEL_7;
LABEL_6:
    v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      result = sub_1C2EF7638();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6))) == 0)
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          v25 = v21 == v24;
          if (v21 == v24)
            v21 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
      ++*(_QWORD *)(v4 + 16);
      if (v8)
        goto LABEL_6;
LABEL_7:
      v15 = v12 + 1;
      if (__OFADD__(v12, 1))
        goto LABEL_38;
      if (v15 >= v9)
        goto LABEL_32;
      v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        v12 = v15 + 1;
        if (v15 + 1 >= v9)
          goto LABEL_32;
        v16 = v6[v12];
        if (!v16)
        {
          v12 = v15 + 2;
          if (v15 + 2 >= v9)
            goto LABEL_32;
          v16 = v6[v12];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              v1 = v28;
              v27 = 1 << *(_BYTE *)(v2 + 32);
              if (v27 > 63)
                sub_1C2EF252C(0, (unint64_t)(v27 + 63) >> 6, (_QWORD *)(v2 + 56));
              else
                *v6 = -1 << v27;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                v12 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_39;
                if (v12 >= v9)
                  goto LABEL_32;
                v16 = v6[v12];
                ++v17;
                if (v16)
                  goto LABEL_20;
              }
            }
            v12 = v17;
          }
        }
      }
LABEL_20:
      v8 = (v16 - 1) & v16;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_1C2EF31C0(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_1C2EF7638();
  result = sub_1C2EF76C8();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_1C2EF3240(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_1C2EF2C50();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1C2EF354C();
      goto LABEL_22;
    }
    sub_1C2EF38A4();
  }
  v11 = *v4;
  sub_1C2EF79B0();
  sub_1C2EF7440();
  result = sub_1C2EF79E0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1C2EF7938(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1C2EF795C();
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
          result = sub_1C2EF7938();
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

void sub_1C2EF33D8(uint64_t a1, unint64_t a2, char a3)
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
    sub_1C2EF2F28();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1C2EF36FC();
      goto LABEL_14;
    }
    sub_1C2EF3B88();
  }
  v8 = *v3;
  v9 = sub_1C2EF7638();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_1C2ED5590();
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_1C2EF7644();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_1C2EF795C();
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
        v15 = sub_1C2EF7644();

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

void *sub_1C2EF354C()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3DD8);
  v2 = *v0;
  v3 = sub_1C2EF771C();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1C2EF36FC()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D31F8);
  v2 = *v0;
  v3 = sub_1C2EF771C();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = v20;
    result = v20;
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C2EF38A4()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D3DD8);
  v3 = sub_1C2EF7728();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_1C2EF79B0();
    swift_bridgeObjectRetain();
    sub_1C2EF7440();
    result = sub_1C2EF79E0();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1C2EF3B4C()
{
  unint64_t result;

  result = qword_1EF7D3DE0;
  if (!qword_1EF7D3DE0)
  {
    result = MEMORY[0x1C3BCCAC4](&protocol conformance descriptor for DeviceUnitCategory, &type metadata for DeviceUnitCategory);
    atomic_store(result, (unint64_t *)&qword_1EF7D3DE0);
  }
  return result;
}

uint64_t sub_1C2EF3B88()
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
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7D31F8);
  v3 = sub_1C2EF7728();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    v18 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    result = sub_1C2EF7638();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6))) == 0)
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      while (++v21 != v24 || (v23 & 1) == 0)
      {
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v21);
        if (v26 != -1)
        {
          v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v15 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_36;
    if (v15 >= v9)
      goto LABEL_32;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      v12 = v15 + 1;
      if (v15 + 1 >= v9)
        goto LABEL_32;
      v16 = *(_QWORD *)(v6 + 8 * v12);
      if (!v16)
      {
        v12 = v15 + 2;
        if (v15 + 2 >= v9)
          goto LABEL_32;
        v16 = *(_QWORD *)(v6 + 8 * v12);
        if (!v16)
          break;
      }
    }
LABEL_20:
    v8 = (v16 - 1) & v16;
  }
  v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_34;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    v12 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v12 >= v9)
      goto LABEL_32;
    v16 = *(_QWORD *)(v6 + 8 * v12);
    ++v17;
    if (v16)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_0_9(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return sub_1C2EF2548((uint64_t *)va, a1, a2);
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_2_8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return sub_1C2EF7644();
}

id OUTLINED_FUNCTION_4_7()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(*(_QWORD *)(v0 + 48) + 8 * v1);
}

unint64_t sub_1C2EF3E58(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_1C2EF7458();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
    {
      v7 = sub_1C2EF7488();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2EF3F28(unint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v17;

  if (a1 >> 62)
    goto LABEL_30;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1C2EF7884())
  {
    v17 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap;
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0
         ? (char *)MEMORY[0x1C3BCC3B0](v4 - 4, a1)
         : (char *)*(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key];
      v9 = *(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution21CapabilityDescription_key + 8];
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRetain();
      if ((sub_1C2EF747C() & 1) == 0)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
LABEL_20:
        swift_bridgeObjectRelease();
        v15 = a2;
        goto LABEL_24;
      }
      v10 = sub_1C2EF744C();
      v11 = sub_1C2EF3E58(v10, v8, v9);
      MEMORY[0x1C3BCC080](v11);
      swift_bridgeObjectRelease();
      v12 = sub_1C2EF78C0();
      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_bridgeObjectRelease();

        goto LABEL_20;
      }
      if (!*(_QWORD *)(*(_QWORD *)&a2[v17] + 16))
        goto LABEL_23;
      swift_bridgeObjectRetain();
      sub_1C2EC907C(v8, v9);
      if ((v13 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v15 = v6;
LABEL_24:

        return 0;
      }
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for BooleanCapabilityPrimitive();
      if (!swift_dynamicCastClass())
      {

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      }
      swift_unknownObjectRetain();
      v14 = sub_1C2ED4DC8((uint64_t)v6);

      swift_unknownObjectRelease_n();
      if ((v14 & 1) == 0)
      {

        goto LABEL_27;
      }
      ++v4;
      if (v7 == v3)
        goto LABEL_31;
    }
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
  }
LABEL_31:

  swift_bridgeObjectRelease();
  return 1;
}

void SeymourRoutingCapability.__allocating_init(status:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13();
  SeymourRoutingCapability.init(status:)(v0);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EF4298(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EF42E8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_key);
  OUTLINED_FUNCTION_8();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1C2EF4394(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_key);
  OUTLINED_FUNCTION_8();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2EF43EC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  return sub_1C2EF4394(v1, v2);
}

uint64_t (*sub_1C2EF4428())()
{
  OUTLINED_FUNCTION_8();
  return j__swift_endAccess;
}

id SeymourRoutingCapability.init(status:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t inited;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_key]);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for SeymourRoutingCapability();
  v5 = objc_msgSendSuper2(&v12, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AFFC8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C2EF9250;
  *(_QWORD *)(inited + 32) = 0xD000000000000027;
  *(_QWORD *)(inited + 40) = 0x80000001C2EFC5E0;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_7());
  v7 = v5;
  *(_QWORD *)(inited + 48) = sub_1C2ED4C54(a1);
  v8 = sub_1C2EF73E0();
  sub_1C2EC93D8(v8);
  v10 = v9;
  swift_bridgeObjectRelease();
  sub_1C2EC9B98(3, v10);
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t type metadata accessor for SeymourRoutingCapability()
{
  return objc_opt_self();
}

void sub_1C2EF4640()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap);
  swift_bridgeObjectRetain();
  v2 = OUTLINED_FUNCTION_2_9();
  sub_1C2EC9CFC(v2, v3, v1);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    OUTLINED_FUNCTION_7();
    swift_dynamicCastClass();
    swift_unknownObjectRelease();
  }
  OUTLINED_FUNCTION_5();
}

void sub_1C2EF46CC(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7();
  v2 = OUTLINED_FUNCTION_2_9();
  sub_1C2ED4CA8(v2, v3, a1);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C2EF4718(unint64_t a1)
{
  void *v1;

  return sub_1C2EF3F28(a1, (char *)v1) & 1;
}

uint64_t static SeymourRoutingCapability.supportsSecureCoding.getter()
{
  return 1;
}

void SeymourRoutingCapability.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_13();
  SeymourRoutingCapability.init(coder:)(v0);
  OUTLINED_FUNCTION_5();
}

char *SeymourRoutingCapability.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap;
  v4 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0070);
  *(_QWORD *)&v1[v3] = sub_1C2EF73E0();
  OUTLINED_FUNCTION_0(&v4[OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_key]);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for SeymourRoutingCapability();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_init);
  sub_1C2ECA7F0((uint64_t)a1);

  if (!*(_QWORD *)(*(_QWORD *)&v5[OBJC_IVAR____TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability_primitivesMap]
                  + 16))
  {

    return 0;
  }
  return v5;
}

id SeymourRoutingCapability.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SeymourRoutingCapability.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SeymourRoutingCapability.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SeymourRoutingCapability();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1C2EF4A0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2EF42E8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t method lookup function for SeymourRoutingCapability()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SeymourRoutingCapability.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.key.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.key.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.__allocating_init(status:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.supportsSeymourRouting.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of static SeymourRoutingCapability.capabilityDescriptionMatchingSupportStatus(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.matches(descriptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of SeymourRoutingCapability.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

unint64_t OUTLINED_FUNCTION_2_9()
{
  return 0xD000000000000027;
}

id SVDCapabilityDescriptionsGroupedByCapabilityKey(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "capabilityKey", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(v2, "objectForKey:", v9);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v2, "setObject:forKey:", v10, v9);
          }
          objc_msgSend(v10, "addObject:", v8);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

uint64_t sub_1C2EF72E4()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1C2EF72F0()
{
  return MEMORY[0x1E0CB0828]();
}

uint64_t sub_1C2EF72FC()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1C2EF7308()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1C2EF7314()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1C2EF7320()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1C2EF732C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1C2EF7338()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1C2EF7344()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C2EF7350()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C2EF735C()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1C2EF7368()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1C2EF7374()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1C2EF7380()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1C2EF738C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1C2EF7398()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1C2EF73A4()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1C2EF73B0()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1C2EF73BC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1C2EF73C8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1C2EF73D4()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1C2EF73E0()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1C2EF73EC()
{
  return MEMORY[0x1E0DE9F18]();
}

uint64_t sub_1C2EF73F8()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1C2EF7404()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1C2EF7410()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C2EF741C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C2EF7428()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1C2EF7434()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1C2EF7440()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C2EF744C()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1C2EF7458()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1C2EF7464()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C2EF7470()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C2EF747C()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1C2EF7488()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1C2EF7494()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t sub_1C2EF74A0()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1C2EF74AC()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1C2EF74B8()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1C2EF74C4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1C2EF74D0()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1C2EF74DC()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1C2EF74E8()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1C2EF74F4()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1C2EF7500()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1C2EF750C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1C2EF7518()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1C2EF7524()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1C2EF7530()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1C2EF753C()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1C2EF7548()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1C2EF7554()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1C2EF7560()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1C2EF756C()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1C2EF7578()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1C2EF7584()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1C2EF7590()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1C2EF759C()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C2EF75A8()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_1C2EF75B4()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1C2EF75C0()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1C2EF75CC()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1C2EF75D8()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1C2EF75E4()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1C2EF75F0()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1C2EF75FC()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1C2EF7608()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1C2EF7614()
{
  return MEMORY[0x1E0DEFA30]();
}

uint64_t sub_1C2EF7620()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_1C2EF762C()
{
  return MEMORY[0x1E0CB2028]();
}

uint64_t sub_1C2EF7638()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1C2EF7644()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1C2EF7650()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1C2EF765C()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1C2EF7668()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C2EF7674()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C2EF7680()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1C2EF768C()
{
  return MEMORY[0x1E0CB24B8]();
}

uint64_t sub_1C2EF7698()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1C2EF76A4()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1C2EF76B0()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1C2EF76BC()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1C2EF76C8()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1C2EF76D4()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1C2EF76E0()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1C2EF76EC()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1C2EF76F8()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1C2EF7704()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1C2EF7710()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1C2EF771C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1C2EF7728()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1C2EF7734()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1C2EF7740()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1C2EF774C()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C2EF7758()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C2EF7764()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C2EF7770()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1C2EF777C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C2EF7788()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1C2EF7794()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1C2EF77A0()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1C2EF77AC()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1C2EF77B8()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1C2EF77C4()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1C2EF77D0()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1C2EF77DC()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1C2EF77E8()
{
  return MEMORY[0x1E0DECB38]();
}

uint64_t sub_1C2EF77F4()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1C2EF7800()
{
  return MEMORY[0x1E0DECB50]();
}

uint64_t sub_1C2EF780C()
{
  return MEMORY[0x1E0DECB58]();
}

uint64_t sub_1C2EF7818()
{
  return MEMORY[0x1E0DECB70]();
}

uint64_t sub_1C2EF7824()
{
  return MEMORY[0x1E0DECB78]();
}

uint64_t sub_1C2EF7830()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1C2EF783C()
{
  return MEMORY[0x1E0DECB88]();
}

uint64_t sub_1C2EF7848()
{
  return MEMORY[0x1E0DECBA0]();
}

uint64_t sub_1C2EF7854()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1C2EF7860()
{
  return MEMORY[0x1E0DECBD8]();
}

uint64_t sub_1C2EF786C()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C2EF7878()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1C2EF7884()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C2EF7890()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1C2EF789C()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1C2EF78A8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1C2EF78B4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C2EF78C0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1C2EF78CC()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1C2EF78D8()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1C2EF78E4()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1C2EF78F0()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1C2EF78FC()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1C2EF7908()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1C2EF7914()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1C2EF7920()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1C2EF792C()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1C2EF7938()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C2EF7944()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1C2EF7950()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1C2EF795C()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1C2EF7968()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1C2EF7974()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1C2EF7980()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C2EF798C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C2EF7998()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C2EF79A4()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C2EF79B0()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C2EF79BC()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C2EF79C8()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1C2EF79D4()
{
  return MEMORY[0x1E0DEDF38]();
}

uint64_t sub_1C2EF79E0()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1C2EF79EC()
{
  return MEMORY[0x1E0DEDF48]();
}

uint64_t sub_1C2EF79F8()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1C2EF7A04()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1C2EF7A10()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1C2EF7A1C()
{
  return MEMORY[0x1E0DEE8E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

BOOL atomic_flag_test_and_set(atomic_flag *a1)
{
  return MEMORY[0x1E0C81690](a1);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

